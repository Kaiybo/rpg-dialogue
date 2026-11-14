#!/usr/bin/env python3
"""Simulation test: runs thousands of random but valid characters through the real engine
(tests/sim_driver.lua under Lua 5.1) for every NPC and reports:

  * how often each named NPC falls back to pool or generic lines
  * lines and thread beats that never fire
  * how often noticing moments are available, per NPC
  * special reply options that never appear, always succeed or always fail
  * topics the player can learn that nobody has a specific take on
  * contradictory conditions (static), and runtime errors
  * lines about quests a character couldn't have done yet at the line's level, or on the
    line's faction (static; needs quest levels and factions from capture data)

    python3 tools/simulate.py [--characters 2000] [--seed 1] [--out tools/out/simulation.md]

Needs lua5.1 (or luajit) on PATH. Exit code 1 on runtime errors.
"""

import argparse
import collections
import json
import os
import re
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


TAKEN = {"questActive", "questReady", "questDone", "questObjective", "questRecent", "questLater"}
ALLIANCE = {"Human", "Dwarf", "NightElf", "Gnome"}


def level_bands():
    src = open(os.path.join(P.ROOT, "RPGDialogue", "Core", "WorldData.lua"), encoding="utf-8").read()
    return {m.group(1): (int(m.group(2)), int(m.group(3)))
            for m in re.finditer(r'name = "(\w+)", min = (\d+), max = (\d+)', src)}


def norm(s):
    return re.sub(r"\s+", " ", re.sub(r"[^\w\s]", "", str(s or "").lower())).strip()


def impossible_refs(all_packs, registry):
    """Lines whose own conditions cap the level below a quest's lowest captured level, or pin a
    faction that never took the quest. Only top-level and all-conditions count (not any/not)."""
    quests = (registry or {}).get("quests", {})
    by_title = {norm(q.get("title")): q for q in quests.values() if q.get("title")}
    bands = level_bands()
    problems, unchecked = [], set()

    def resolve(ref):
        if isinstance(ref, LTable) and 1 in ref:
            ref = ref[1]
        if isinstance(ref, TodoRef):
            return ref.name, by_title.get(norm(ref.name))
        if isinstance(ref, int):
            return str(ref), quests.get(str(ref))
        return str(ref), None

    def scan(gid, when):
        if not isinstance(when, LTable):
            return
        flat = {}
        stack = [when]
        while stack:
            w = stack.pop()
            for k, v in w.named().items():
                if k == "all" and isinstance(v, LTable):
                    stack.append(v)
                elif k not in ("any", "not"):
                    flat.setdefault(k, []).append(v)
        refs = [v for k in TAKEN for v in flat.get(k, [])]
        if not refs:
            return
        max_level = None
        for v in flat.get("maxLevel", []):
            if isinstance(v, int):
                max_level = v if max_level is None else min(max_level, v)
        for v in flat.get("band", []):
            names = v.array() if isinstance(v, LTable) else [v]
            tops = [bands[n][1] for n in names if n in bands]
            if tops:
                max_level = max(tops) if max_level is None else min(max_level, max(tops))
        faction = None
        for v in flat.get("faction", []):
            faction = v if isinstance(v, str) else faction
        for v in flat.get("race", []):
            races = set(v.array() if isinstance(v, LTable) else [v])
            if races and races <= HORDE:
                faction = "Horde"
            elif races and races <= ALLIANCE:
                faction = "Alliance"
        for ref in refs:
            name, rec = resolve(ref)
            if not rec or (rec.get("minLevel") is None and not rec.get("factions")):
                unchecked.add(name)
                continue
            if max_level is not None and rec.get("minLevel") and max_level < rec["minLevel"]:
                problems.append(f"{gid}: about {name!r}, but the line is for level {max_level} and below; "
                                f"the lowest level it was taken at is {rec['minLevel']}")
            if faction and rec.get("factions") and faction not in rec["factions"]:
                problems.append(f"{gid}: about {name!r}, but the line is {faction}-only and only "
                                f"{', '.join(rec['factions'])} characters took it")

    for pack in all_packs:
        for kind, tbl, f, line in pack.defs:
            if kind in ("NPC", "Pool", "Generic"):
                owner = tbl.get("key") or tbl.get("id")
                if kind == "Pool":
                    owner = f"pool:{owner}"
                for slot, node, ln, gid in P.iter_lines(tbl, str(owner)):
                    scan(gid, ln.get("when"))
                for nid, i, ch in P.iter_choices(tbl):
                    scan(f"{owner}.{nid}.choice{i}", ch.get("when"))
            elif kind == "Thread":
                for b in P.arr(tbl.get("beats")):
                    if isinstance(b, LTable):
                        scan(f"thread:{tbl.get('id')}.{b.get('id')}", b.get("when"))
            elif kind == "Rumors":
                for ln in P.arr(tbl.get("lines")):
                    if isinstance(ln, LTable):
                        scan(f"rumor:{tbl.get('id')}.{ln.get('id')}", ln.get("when"))
    return problems, sorted(unchecked)


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--characters", type=int, default=2000)
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--out", default=os.path.join(P.ROOT, "tools", "out", "simulation.md"))
    ap.add_argument("--jobs", type=int, default=0,
                    help="parallel Lua processes (default: one per CPU, at most 4). Shard 0 keeps --seed, so --jobs 1 matches older runs")
    args = ap.parse_args()

    lua = shutil.which("lua5.1") or shutil.which("luajit") or shutil.which("lua")
    if not lua:
        print("Needs lua5.1 or luajit on PATH (the simulation runs the real engine).")
        return 2
    # Every character talks to every NPC, so the run grows with both. Split the characters
    # into shards (each its own seed) and run them side by side; the report only counts and
    # collects, so the shards' outputs simply add up.
    jobs = args.jobs or min(os.cpu_count() or 1, 4)
    jobs = max(1, min(jobs, args.characters))
    driver = os.path.join(P.ROOT, "tests", "sim_driver.lua")
    procs = []
    for i in range(jobs):
        n = args.characters // jobs + (1 if i < args.characters % jobs else 0)
        seed = args.seed if i == 0 else args.seed + 7919 * i
        procs.append(subprocess.Popen([lua, driver, str(n), str(seed)], stdout=subprocess.PIPE,
                                      stderr=subprocess.PIPE, text=True, cwd=P.ROOT))
    outputs = []
    failed = False
    for pr in procs:
        out, err = pr.communicate()
        if pr.returncode != 0:
            print(err)
            failed = True
        outputs.append(out)
    if failed:
        return 1

    class _Joined:
        stdout = "\n".join(outputs)
    proc = _Joined

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
        elif kind in ("pick", "greeting", "notice", "react", "topic", "rumor", "bark"):
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
    reg_path = os.path.join(P.ROOT, "tools", "registry", "ids.json")
    registry = json.load(open(reg_path, encoding="utf-8")) if os.path.exists(reg_path) else None
    impossible, unchecked = impossible_refs(all_packs, registry)

    lines = []
    w = lines.append
    w(f"# Simulation report\n\n{args.characters} characters, seed {args.seed}, {jobs} shard(s). Every character talks to every NPC.\n")
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
    w("\n## Thread beats\n")
    for b in beats:
        bid = "thread:" + b.split(" ")[0]
        w(f"- {b}: fired {fired[bid]} times")
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
    w("\n## Impossible quest references (static)\n\nLines about a quest the character couldn't have taken yet at the line's level, or on the line's faction. "
      "Uses the lowest level and the factions seen in capture data (`tools/import_capture.py`).\n")
    for c in impossible or ["none found"]:
        w(f"- {c}")
    if unchecked:
        w(f"\nNot checked, no level or faction captured yet ({len(unchecked)}): " + ", ".join(unchecked))
    w("\n## Checked elsewhere\n\n- Hinge stacking (\"everything matters sometimes\"): `tools/validate.py`.\n"
      "- False claims that can never be exposed: `tools/validate.py`.")

    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines) + "\n")
    print(f"Simulated {args.characters} characters: {len(errors)} runtime error(s), {len(never)} of {len(all_lines)} lines never fired, "
          f"{len(contradictions)} contradiction(s), {len(impossible)} impossible quest reference(s) "
          f"({len(unchecked)} quest(s) not checkable yet). Report: {os.path.relpath(args.out, P.ROOT)}")
    return 1 if errors or impossible or contradictions else 0


if __name__ == "__main__":
    sys.exit(main())
