#!/usr/bin/env python3
"""Simulation test: runs thousands of random but valid characters through the real engine
(tests/sim_driver.lua under Lua 5.1) for every NPC and reports:

  * how often each named NPC falls back to pool or generic lines
  * lines and thread beats that never fire
  * how often noticing moments are available, per NPC
  * special reply options that never appear, always succeed or always fail
  * topics the player can learn that nobody has a specific take on
  * contradictory conditions (static), and runtime errors

    python3 tools/simulate.py [--characters 2000] [--seed 1] [--out tools/out/simulation.md]

Needs lua5.1 (or luajit) on PATH. Exit code 1 on runtime errors.
"""

import argparse
import collections
import os
import shutil
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from rpgd import packs as P  # noqa: E402
from rpgd.luadata import LTable, TodoRef  # noqa: E402

HORDE = {"Orc", "Troll", "Tauren", "Scourge"}


def static_contradictions(all_packs):
    problems = []
    for pack in all_packs:
        for kind, tbl, f, line in pack.defs:
            if kind not in ("NPC", "Pool", "Generic"):
                continue
            owner = tbl.get("key") or tbl.get("id")
            for slot, node, ln, gid in P.iter_lines(tbl, str(owner)):
                when = ln.get("when")
                if not isinstance(when, LTable):
                    continue
                w = when.named()
                if isinstance(w.get("minLevel"), int) and isinstance(w.get("maxLevel"), int) and w["minLevel"] > w["maxLevel"]:
                    problems.append(f"{gid}: minLevel > maxLevel")
                for a, b in (("questBefore", "questDone"), ("questBefore", "questActive"), ("questActive", "questDone")):
                    if a in w and b in w and repr(w[a]) == repr(w[b]):
                        problems.append(f"{gid}: {a} and {b} on the same quest can never both pass")
                races = w.get("race")
                races = races.array() if isinstance(races, LTable) else ([races] if races else [])
                if races and all(r in HORDE for r in races) and pack.addon == "RPGDialogue_Elwynn":
                    problems.append(f"{gid}: only Horde races, but Alliance NPCs in Elwynn are hostile to them")
                if w.get("metBefore") is False and ("timesTalked" in w or "daysSince" in w):
                    problems.append(f"{gid}: metBefore = false contradicts timesTalked/daysSince")
    return problems


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--characters", type=int, default=2000)
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--out", default=os.path.join(P.ROOT, "tools", "out", "simulation.md"))
    args = ap.parse_args()

    lua = shutil.which("lua5.1") or shutil.which("luajit") or shutil.which("lua")
    if not lua:
        print("Needs lua5.1 or luajit on PATH (the simulation runs the real engine).")
        return 2
    proc = subprocess.run([lua, os.path.join(P.ROOT, "tests", "sim_driver.lua"), str(args.characters), str(args.seed)],
                          capture_output=True, text=True, cwd=P.ROOT)
    if proc.returncode != 0:
        print(proc.stderr)
        return 1

    all_lines, fired, topicdefs = set(), collections.Counter(), set()
    starts = collections.defaultdict(collections.Counter)      # npc -> src counter at hello
    notices = collections.defaultdict(collections.Counter)     # npc -> {some, none}
    specials = collections.defaultdict(collections.Counter)    # (npc,node,text) -> pass/fail
    choice_seen = set()
    topics = collections.defaultdict(collections.Counter)      # topic -> kind counter
    topic_owners = collections.defaultdict(set)                # topic -> npcs with own take
    errors = []
    conversations = collections.Counter()

    for raw in proc.stdout.splitlines():
        f = raw.split("\t")
        kind = f[0]
        if kind == "line":
            all_lines.add(f[1])
        elif kind == "topicdef":
            topicdefs.add(f[1])
        elif kind in ("pick", "greeting", "notice", "react", "topic"):
            if kind == "topic":
                gid, tkind = f[3], f[4]
                if gid != "-":
                    fired[gid] += 1
                topics[f[2]][tkind] += 1
                if tkind in ("own", "pooltake"):
                    topic_owners[f[2]].add(f[1])
                continue
            gid, src = f[3], f[4]
            if gid != "-":
                fired[gid] += 1
            if kind == "pick" and f[2] in ("hello",):
                starts[f[1]][src] += 1
            if kind == "notice":
                notices[f[1]]["some" if gid != "-" else "none"] += 1
        elif kind == "choice":
            key = (f[1], f[2], f[4])
            choice_seen.add(key)
            if f[5] != "-":
                specials[key][f[6]] += 1
        elif kind == "hinge":
            conversations[f[1]] += 1
        elif kind == "error":
            errors.append(f"{f[1]}: {f[2]}")

    all_packs = P.load_all()
    # Special options defined in content, to find ones that never appear.
    defined_specials = []
    for pack in all_packs:
        for kind, tbl, fname, line in pack.defs:
            if kind != "NPC":
                continue
            for nid, i, ch in P.iter_choices(tbl):
                if ch.get("tag") in P.SPECIAL_TAGS:
                    defined_specials.append((tbl.get("key"), nid, ch.get("text")))
    # Thread beats (gathered by the M4 thread engine; listed so unreachable ones show up).
    beats = []
    for pack in all_packs:
        for kind, tbl, fname, line in pack.defs:
            if kind == "Thread":
                for b in P.arr(tbl.get("beats")):
                    if isinstance(b, LTable):
                        beats.append(f"{tbl.get('id')}.{b.get('id')} ({b.get('npc')})")

    never = sorted(g for g in all_lines if fired[g] == 0)
    contradictions = static_contradictions(all_packs)

    lines = []
    w = lines.append
    w(f"# Simulation report\n\n{args.characters} characters, seed {args.seed}. Every character talks to every NPC.\n")
    w(f"Runtime errors: **{len(errors)}**\n")
    for e in errors[:30]:
        w(f"- {e}")
    w("\n## Fallback rate (start node, named NPCs)\n\nShare of first lines that came from a pool or generic line instead of the NPC's own.\n")
    w("| NPC | own | pool | generic |\n|---|---|---|---|")
    for npc in sorted(starts):
        if npc.startswith("pool:"):
            continue
        c = starts[npc]
        tot = sum(c.values()) or 1
        w(f"| {npc} | {100 * c['own'] / tot:.0f}% | {100 * c['pool'] / tot:.0f}% | {100 * c['generic'] / tot:.0f}% |")
    w("\n## Noticing moments available\n\nShare of conversations where a noticing moment was eligible (before the frequency roll; with the default 0.35 chance the player sees roughly a third of these).\n")
    w("| NPC | eligible |\n|---|---|")
    for npc in sorted(notices):
        c = notices[npc]
        tot = sum(c.values()) or 1
        w(f"| {npc} | {100 * c['some'] / tot:.0f}% |")
    w(f"\n## Lines that never fired ({len(never)} of {len(all_lines)})\n")
    w("Some are expected: lines for states the random characters rarely reach (Champion band, Fel Taint, specific deaths). Look for lines that *should* fire.\n")
    for g in never:
        w(f"- {g}")
    w("\n## Thread beats\n\nBeats are offered by the thread engine (M4); until then they never fire in the simulation.\n")
    for b in beats:
        w(f"- {b}")
    w("\n## Special reply options\n")
    for key in defined_specials:
        c = specials.get(key)
        if not c and key not in choice_seen:
            w(f"- **never appears**: {key[0]}.{key[1]}: {key[2]}")
        elif c:
            tot = c["pass"] + c["fail"]
            note = " **(always succeeds)**" if c["fail"] == 0 else (" **(always fails)**" if c["pass"] == 0 else "")
            w(f"- {key[0]}.{key[1]}: {key[2]}: shown {tot} times, success {100 * c['pass'] / max(tot, 1):.0f}%{note}")
    w("\n## Topics\n\nWho has their own take on each topic (vs only brush-offs).\n")
    for t in sorted(topicdefs):
        owners = sorted(topic_owners.get(t, []))
        flag = " **(nobody has a take)**" if not owners else ""
        w(f"- {t}: {', '.join(owners) or '-'}{flag}")
    w("\n## Contradictory conditions (static)\n")
    for c in contradictions or ["none"]:
        w(f"- {c}")
    w("\n## Not checked yet\n\n- Lines about quests a character couldn't have done at their level or faction: needs quest levels from capture data (`tools/import_capture.py`).\n- Hinge stacking is checked by `tools/validate.py`.\n- False claims that can never be exposed are checked by `tools/validate.py`.")

    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines) + "\n")
    print(f"Simulated {args.characters} characters: {len(errors)} runtime error(s), {len(never)} of {len(all_lines)} lines never fired, "
          f"{len(contradictions)} contradiction(s). Report: {os.path.relpath(args.out, P.ROOT)}")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
