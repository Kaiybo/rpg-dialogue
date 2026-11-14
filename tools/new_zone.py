#!/usr/bin/env python3
"""Zone scaffolding: the start of the "adding a zone" workflow (see PACK_AUTHORING.md).

Step 1, plan. Lists the zone's captured NPCs and quests and proposes a coverage tier for each:
    python3 tools/new_zone.py plan "Westfall" [--capture "<...>/SavedVariables/RPGDialogue.lua"]
  writes RPGDialogue_Westfall/PLAN.md. Review the tier column (major / quest / service /
  pooled / skip) with the user, edit it, then:

Step 2, scaffold. Creates the pack around the approved plan:
    python3 tools/new_zone.py scaffold "Westfall"
  writes the TOC, pack.lua, pools.lua, one npcs/<key>.lua and bibles/<key>.md per NPC tiered
  major / quest / service, a lore-sheet stub in LORE_NOTES.md and the pack's line in .pkgmeta.
  NPC files are marked `scaffold = true`: the game ignores them (the NPC stays pooled) and the
  validator lists them until someone writes them. Existing files are never overwritten, so
  you can re-run scaffold after approving more NPCs.

Options: --addon RPGDialogue_X (folder name), --id rpgd.x (pack id), --title "...".
No IDs are ever invented: an NPC without a captured ID gets TODO_NPC("Name").
Python 3, standard library only.
"""

import argparse
import collections
import datetime
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from rpgd import packs as P  # noqa: E402

REGISTRY = os.path.join(P.ROOT, "tools", "registry", "ids.json")
TIER_CHOICES = ("major", "quest", "service", "pooled", "skip")
SERVICE_ROLES = {"vendor", "flightmaster", "trainer", "banker", "stablemaster", "auctioneer", "blacksmith",
                 "innkeeper", "spirithealer"}
# Words dropped when making a key from a name ("Marshal Dughan" -> dughan).
TITLES = {"marshal", "deputy", "innkeeper", "brother", "sister", "captain", "sergeant", "lieutenant",
          "farmer", "lord", "lady", "sir", "mayor", "foreman", "chef", "apprentice", "master", "grand",
          "high", "priestess", "priest", "magistrate", "commander", "general", "private", "corporal",
          "elder", "smith", "guard", "scout", "ranger", "father", "mother", "old", "young", "the", "of"}


# ---------------------------------------------------------------------------
# Names
# ---------------------------------------------------------------------------
def words(s):
    return re.findall(r"[A-Za-z0-9]+", s.replace("'", ""))


def default_addon(zone):
    return "RPGDialogue_" + "".join(w[:1].upper() + w[1:].lower() for w in words(zone))


def default_id(zone):
    return "rpgd." + "_".join(w.lower() for w in words(zone))


def zone_token(zone):
    return zone.replace(" ", "_")


def slug(s):
    return "_".join(w.lower() for w in words(s)) or "unknown"


def make_key(name, taken):
    ws = [w.lower() for w in words(name)]
    core = [w for w in ws if w not in TITLES] or ws or ["npc"]
    for cand in (core[-1], core[0], "_".join(core), "_".join(ws)):
        if cand and cand not in taken and re.match(r"^[a-z]", cand):
            taken.add(cand)
            return cand
    base, i = "_".join(core), 2
    while f"{base}{i}" in taken:
        i += 1
    taken.add(f"{base}{i}")
    return f"{base}{i}"


def lua_str(s):
    return '"' + str(s).replace("\\", "\\\\").replace('"', '\\"').replace("\n", " ") + '"'


def norm(s):
    return re.sub(r"\s+", " ", re.sub(r"[^\w\s]", "", str(s or "").lower())).strip()


# ---------------------------------------------------------------------------
# What's already there
# ---------------------------------------------------------------------------
def load_registry(capture):
    if capture:
        from import_capture import load_capture, merge_registry
        merge_registry(load_capture(capture))
    if not os.path.exists(REGISTRY):
        raise SystemExit("No capture registry yet. Run tools/import_capture.py <SavedVariables file> first, "
                         "or pass --capture <file>.")
    reg = json.load(open(REGISTRY, encoding="utf-8"))
    return {int(k): v for k, v in reg.get("npcs", {}).items()}, {int(k): v for k, v in reg.get("quests", {}).items()}


def existing_content():
    """NPC keys / ids / names already written in any pack, and town subzones."""
    keys, ids, names, towns = set(), {}, {}, {}
    for pack in P.load_all():
        for kind, tbl, f, line in pack.defs:
            if kind == "NPC":
                keys.add(tbl.get("key"))
                if isinstance(tbl.get("id"), int):
                    ids[tbl.get("id")] = (pack.addon, tbl.get("key"))
                if tbl.get("name"):
                    names[norm(tbl.get("name"))] = (pack.addon, tbl.get("key"))
            elif kind == "Town":
                for sz in P.arr(tbl.get("subzones")):
                    towns[sz] = tbl.get("id")
    return keys, ids, names, towns


# ---------------------------------------------------------------------------
# plan
# ---------------------------------------------------------------------------
def propose(rec, role, n_quests, named_role):
    if named_role and not n_quests:
        return "pooled", "unnamed role NPC: a pool covers it"
    if role in SERVICE_ROLES and n_quests < 2:
        return "service", f"{role}" + (", 1 quest" if n_quests else "")
    if n_quests >= 4:
        return "major", f"{n_quests} quests"
    if n_quests >= 1:
        return "quest", f"{n_quests} quest(s)"
    if rec.get("gossip"):
        return "service" if role else "pooled", "talks, no quests captured"
    return "skip", "no gossip or quests seen"


def cmd_plan(args):
    npcs, quests = load_registry(args.capture)
    zone = args.zone
    addon, pack_id = args.addon or default_addon(zone), args.id or default_id(zone)
    folder = os.path.join(P.ROOT, addon)
    plan_path = os.path.join(folder, "PLAN.md")
    if os.path.exists(plan_path) and not args.force:
        raise SystemExit(f"{os.path.relpath(plan_path, P.ROOT)} already exists. Edit it, or pass --force to rebuild it.")

    in_zone = {nid: r for nid, r in npcs.items() if r.get("zone") == zone}
    if not in_zone:
        zones = collections.Counter(r.get("zone") for r in npcs.values())
        raise SystemExit(f"No captured NPCs in {zone!r}. Captured zones: " +
                         ", ".join(f"{z} ({n})" for z, n in zones.most_common() if z))
    gives, takes = collections.defaultdict(list), collections.defaultdict(list)
    zone_quests = {}
    for qid, q in quests.items():
        if q.get("giver") in in_zone:
            gives[q["giver"]].append(qid)
        if q.get("turnin") in in_zone:
            takes[q["turnin"]].append(qid)
        if q.get("zone") == zone or q.get("giver") in in_zone or q.get("turnin") in in_zone:
            zone_quests[qid] = q

    patterns = P.role_patterns()
    keys, have_ids, have_names, towns = existing_content()
    friendly, hostile = [], collections.defaultdict(list)
    for nid, r in in_zone.items():
        if r.get("reaction") is not None and r.get("reaction") < 4:
            hostile[r.get("name") or "?"].append(r.get("level"))
        else:
            friendly.append((nid, r))

    rows = []
    for nid, r in friendly:
        name = r.get("name") or f"NPC {nid}"
        role = P.detect_role(r.get("subtitle"), name, patterns)
        named_role = role is not None and P.detect_role(None, name, patterns) == role
        nq = len(set(gives[nid]) | set(takes[nid]))
        if not role and nq:
            role = "questgiver"
        done = have_ids.get(nid) or have_names.get(norm(name))
        tier, why = propose(r, role, nq, named_role)
        if done:
            tier, why = "skip", f"already written: {done[0]} `{done[1]}`"
        rows.append({
            "key": done[1] if done else make_key(name, keys),
            "name": name, "id": str(nid), "subtitle": r.get("subtitle") or "",
            "subzone": r.get("subzone") or "", "quests": f"{len(set(gives[nid]))}/{len(set(takes[nid]))}",
            "seen": str(r.get("n") or ""), "tier": tier, "role": role or "",
            "community": towns.get(r.get("subzone") or "", slug(r.get("subzone") or "") if r.get("subzone") else ""),
            "notes": why,
        })
    order = {t: i for i, t in enumerate(TIER_CHOICES)}
    rows.sort(key=lambda x: (order[x["tier"]], x["subzone"], x["name"]))

    def qname(nid):
        return npcs.get(nid, {}).get("name") or (f"NPC {nid}" if nid else "?")

    sub_counts = collections.Counter(r["subzone"] for r in rows if r["subzone"])
    out = [f"# Plan: {zone}\n",
           f"Pack `{addon}` (id `{pack_id}`), zone token `{zone_token(zone)}`. "
           f"Made by `tools/new_zone.py plan` from capture data on {datetime.date.today().isoformat()}.\n",
           "**Review the tier column with the user before writing anything** (the brief's zone workflow, step 2). "
           "Tiers: `major` (full conversation, agenda, thread beats) · `quest` (quest reactions, a few nodes) · "
           "`service` (short, compact mode) · `pooled` (a role pool covers them) · `skip`. "
           "You can also edit `key`, `role` and `community`. Then run "
           f"`python3 tools/new_zone.py scaffold \"{zone}\"`.\n",
           "## NPCs\n",
           "| key | name | id | subtitle | subzone | quests (gives/takes) | seen | tier | role | community | notes |",
           "|---|---|---|---|---|---|---|---|---|---|---|"]
    for r in rows:
        out.append("| " + " | ".join(r[c].replace("|", "/") for c in
                                      ("key", "name", "id", "subtitle", "subzone", "quests", "seen", "tier", "role", "community", "notes")) + " |")
    out += ["", "## Quests\n",
            "| id | title | giver | turn-in | lowest level seen | factions |", "|---|---|---|---|---|---|"]
    for qid, q in sorted(zone_quests.items(), key=lambda kv: (kv[1].get("minLevel") or 0, kv[1].get("title") or "")):
        out.append(f"| {qid} | {q.get('title') or '?'} | {qname(q.get('giver'))} | {qname(q.get('turnin'))} | "
                   f"{q.get('minLevel') or ''} | {', '.join(q.get('factions') or [])} |")
    out += ["", "## Settlements\n", "Subzones with friendly NPCs. Town standing needs a `P:Town` in `RPGDialogue_World/towns.lua`.\n"]
    for sz, n in sub_counts.most_common():
        out.append(f"- {sz}: {n} NPC(s), " + (f"town `{towns[sz]}`" if sz in towns else f"no town yet (suggested id `{slug(sz)}`)"))
    if hostile:
        out += ["", "## Creatures seen (hostile)\n", "Useful for errands (kill counts), rumors and noticing moments.\n"]
        for name, levels in sorted(hostile.items()):
            lv = sorted(level for level in levels if isinstance(level, int))
            out.append(f"- {name}" + (f" (level {lv[0]}–{lv[-1]})" if lv else ""))
    out += ["", "## Checklist (the brief's \"adding a zone\" prompt)\n",
            "1. [ ] Lore sheet in `LORE_NOTES.md` (scaffold adds a stub): key NPCs, storylines, Year 1 status, sources cited.",
            "2. [ ] Tiers above approved by the user.",
            "3. [ ] Voice bibles, sources and quests first (`reference/<zone>.md` from `tools/export_reference.py`).",
            "4. [ ] Throughlines proposed and approved: existing threads that could continue here, 1–2 new ones.",
            "5. [ ] Dialogue: before/during/after quest reactions, echoes of nearby zones, towns, topics, innkeeper rumors, origin nods.",
            "6. [ ] `python3 tools/check_all.py` passes (validator, voice check, simulation, coverage, tests).",
            "7. [ ] In-game test checklist for the user.",
            "8. [ ] `HANDOFF.md` updated, committed.", ""]
    os.makedirs(folder, exist_ok=True)
    with open(plan_path, "w", encoding="utf-8") as fh:
        fh.write("\n".join(out))
    counts = collections.Counter(r["tier"] for r in rows)
    print(f"Wrote {os.path.relpath(plan_path, P.ROOT)}: {len(rows)} NPC(s) "
          f"({', '.join(f'{counts[t]} {t}' for t in TIER_CHOICES if counts[t])}), {len(zone_quests)} quest(s).")
    print("Review the tiers with the user, then run: python3 tools/new_zone.py scaffold " + json.dumps(zone))
    return 0


# ---------------------------------------------------------------------------
# scaffold
# ---------------------------------------------------------------------------
def read_plan(path):
    text = open(path, encoding="utf-8").read()
    m = re.search(r"^## NPCs\s*$(.*?)(?=^## |\Z)", text, re.M | re.S)
    if not m:
        raise SystemExit(f"{path}: no '## NPCs' table")
    table = [ln.strip() for ln in m.group(1).splitlines() if ln.strip().startswith("|")]
    header = [c.strip().lower() for c in table[0].strip("|").split("|")]
    rows = []
    for ln in table[2:]:
        cells = [c.strip().strip("`").strip() for c in ln.strip("|").split("|")]
        rows.append(dict(zip(header, cells)))
    pm = re.search(r"Pack `([^`]+)` \(id `([^`]+)`\), zone token `([^`]+)`", text)
    return rows, (pm.groups() if pm else (None, None, None))


def write_new(path, text, made):
    if os.path.exists(path):
        return False
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(text)
    made.append(os.path.relpath(path, P.ROOT))
    return True


def npc_stub(row, pack_id, quests_by_npc):
    nid = row.get("id", "")
    known = nid.isdigit()
    comm = row.get("community", "")
    lines = [f"-- {row['name']}" + (f", {row['subtitle']}" if row.get("subtitle") else "") +
             (f", {row['subzone']}" if row.get("subzone") else "") + f". Voice: bibles/{row['key']}.md",
             "-- SCAFFOLD from tools/new_zone.py. Write the voice bible first, then this file, then delete",
             "-- `scaffold = true`. Until then the game ignores this file and the NPC stays pooled."]
    gq = quests_by_npc.get(nid, {})
    if gq.get("gives") or gq.get("takes"):
        lines.append("-- Captured quests (write before / during / after reactions for each):")
        for label in ("gives", "takes"):
            for qid, title in gq.get(label, []):
                lines.append(f"--   {label}: {title} (quest {qid})")
    lines.append(f"local P = RPGDialogueAPI:Pack({lua_str(pack_id)})")
    if not known:
        lines.append("local TODO_NPC = P.TODO_NPC")
    lines += ["", "P:NPC {",
              f"  key = {lua_str(row['key'])}, id = {nid if known else 'TODO_NPC(' + lua_str(row['name']) + ')'}, name = {lua_str(row['name'])},",
              f"  bible = \"bibles/{row['key']}.md\", role = {lua_str(row.get('role') or 'citizen')}, tier = {lua_str(row['tier'])},",
              f"  communities = {{ {lua_str(comm)} }}," if comm else "  communities = {},",
              "  scaffold = true,", "}", ""]
    return "\n".join(lines)


def bible_stub(row, zone, quests_by_npc):
    nid = row.get("id", "")
    gq = quests_by_npc.get(nid, {})
    qlines = [f"- {title} ({label}, quest {qid}): TODO what it reveals" for label in ("gives", "takes")
              for qid, title in gq.get(label, [])]
    if not qlines:
        qlines = ["- TODO: none captured yet. If they really have none, write '- none: <why>'."]
    ident = " · ".join(x for x in (nid if nid.isdigit() else "TODO id", row["name"],
                                   ", ".join(x for x in (row.get("subzone"), zone) if x),
                                   row.get("subtitle") or row.get("role") or "", row["tier"]) if x)
    return "\n".join([
        f"# {row['name']}  (key: {row['key']})", "",
        "## Sources",
        f"- TODO: the warcraft.wiki.gg page for {row['name']}, if there is one (cite it, and say whether you read it)",
        f"- reference/{slug(zone)}.md (captured gossip and quest text; reference only, never copied)", "",
        "## Their quests", *qlines, "",
        "## Identity", ident,
        "Personality:", "Speech:", "Knows and cares about:", "Relationships:", "Default attitudes:",
        "Lore anchors:", "Never says:", "",
        "## Threads they could carry", "", "## Agenda", "", "## Secrets", "", "## Reliability", "",
        "## What they notice   (2–3 things)", "", "## Topics", ""])


def cmd_scaffold(args):
    zone = args.zone
    addon = args.addon or default_addon(zone)
    folder = os.path.join(P.ROOT, addon)
    plan_path = os.path.join(folder, "PLAN.md")
    if not os.path.exists(plan_path):
        raise SystemExit(f"No {os.path.relpath(plan_path, P.ROOT)}. Run: python3 tools/new_zone.py plan {json.dumps(zone)}")
    rows, (p_addon, p_id, p_token) = read_plan(plan_path)
    pack_id = args.id or p_id or default_id(zone)
    token = p_token or zone_token(zone)
    title = args.title or zone

    bad = [r for r in rows if r.get("tier") not in TIER_CHOICES]
    if bad:
        raise SystemExit("Unknown tier for: " + ", ".join(f"{r.get('name')} ({r.get('tier')!r})" for r in bad) +
                         f". Use one of {', '.join(TIER_CHOICES)}.")
    keys = [r["key"] for r in rows if r["tier"] in ("major", "quest", "service")]
    dupes = [k for k, n in collections.Counter(keys).items() if n > 1]
    if dupes:
        raise SystemExit("Duplicate keys in the plan: " + ", ".join(dupes))
    for k in keys:
        if not re.match(r"^[a-z][a-z0-9_]*$", k):
            raise SystemExit(f"Key {k!r} must be lower case letters, digits and underscores")

    quests_by_npc = collections.defaultdict(lambda: {"gives": [], "takes": []})
    if os.path.exists(REGISTRY):
        reg = json.load(open(REGISTRY, encoding="utf-8"))
        for qid, q in sorted(reg.get("quests", {}).items(), key=lambda kv: int(kv[0])):
            for label, field in (("gives", "giver"), ("takes", "turnin")):
                if q.get(field) is not None:
                    quests_by_npc[str(q[field])][label].append((qid, q.get("title") or "?"))

    made = []
    write_new(os.path.join(folder, "pack.lua"), "\n".join([
        f"RPGDialogueAPI:RegisterPack {{",
        f"  id = {lua_str(pack_id)},", f"  name = {lua_str(title)},", '  author = "RPG Dialogue",',
        '  version = "0.1.0",            -- this pack\'s own version: see CHANGELOG.md here', "  format = 1,",
        "  priority = 0,", '  requires = { "rpgd.world" },', "}", ""]), made)
    write_new(os.path.join(folder, "CHANGELOG.md"), "\n".join([
        f"# RPG Dialogue: {title} (pack changelog)", "",
        "The pack's own version is `version` in `pack.lua`; bump both together.", "",
        "## 0.1.0 (in progress)", f"- Scaffolded from capture data for {zone}.", ""]), made)

    pooled = collections.defaultdict(list)
    for r in rows:
        if r["tier"] == "pooled":
            pooled[(r.get("role") or "citizen", r.get("community") or "")].append(r["name"])
    pool_lines = [f"-- Unnamed and minor NPCs of {zone}, covered by role pools.",
                  "-- SCAFFOLD from tools/new_zone.py: no pools written yet. Pooled NPCs in the plan:"]
    for (role, comm), names in sorted(pooled.items()):
        pool_lines.append(f"--   role {role}" + (f", community {comm}" if comm else "") + ": " + ", ".join(sorted(set(names))))
    pool_lines += ["--", "-- Write pools like this (see RPGDialogue_Elwynn/pools.lua), as real code, below these comments:",
                   f'--   local P = RPGDialogueAPI:Pack("{pack_id}")',
                   '--   P:Pool { id = "guard_<town>", role = "guard", community = "<town>",',
                   '--     greetings = { { id = "g_1", text = "..." } }, lines = { { id = "l_1", text = "..." } },',
                   '--     choices = { { text = "...", next = "END" } } }', ""]
    write_new(os.path.join(folder, "pools.lua"), "\n".join(pool_lines), made)

    npc_files = []
    for r in rows:
        if r["tier"] not in ("major", "quest", "service"):
            continue
        npc_files.append(f"npcs\\{r['key']}.lua")
        write_new(os.path.join(folder, "npcs", r["key"] + ".lua"), npc_stub(r, pack_id, quests_by_npc), made)
        write_new(os.path.join(folder, "bibles", r["key"] + ".md"), bible_stub(r, zone, quests_by_npc), made)

    toc_path = os.path.join(folder, addon + ".toc")
    if not os.path.exists(toc_path):
        write_new(toc_path, "\n".join([
            "## Interface: 16001, 16002", f"## Title: RPG Dialogue: {title} |cff8a8a8a0.1.0|r", f"## Notes: Dialogue for {zone}.",
            "## Author: RPG Dialogue", "## Version: 0.1.0", "## Dependencies: RPGDialogue",
            "## LoadOnDemand: 1", f"## X-RPGD-Pack: {pack_id}", "## X-RPGD-Format: 1", "## X-RPGD-Load: zone",
            f"## X-RPGD-Zones: {token}", "", "pack.lua", "pools.lua", *npc_files, ""]), made)
    else:
        text = open(toc_path, encoding="utf-8").read()
        listed = {ln.strip().replace("/", "\\") for ln in text.splitlines()}
        missing = [f for f in npc_files if f not in listed]
        if missing:
            with open(toc_path, "a", encoding="utf-8") as fh:
                fh.write(("" if text.endswith("\n") else "\n") + "\n".join(missing) + "\n")
            made.append(os.path.relpath(toc_path, P.ROOT) + f" (+{len(missing)} file(s))")

    lore = os.path.join(P.ROOT, "LORE_NOTES.md")
    if os.path.exists(lore) and not re.search(r"^## Lore sheet: " + re.escape(zone) + r"\b", open(lore, encoding="utf-8").read(), re.M):
        key_npcs = [f"- {r['name']}" + (f" ({r['subzone']})" if r.get("subzone") else "") + ": TODO, from their quests"
                    for r in rows if r["tier"] in ("major", "quest")]
        with open(lore, "a", encoding="utf-8") as fh:
            fh.write("\n".join(["", f"## Lore sheet: {zone} (draft, from tools/new_zone.py)", "",
                                "Sources: TODO (warcraft.wiki.gg / Blizzard pages you actually read, and "
                                f"`reference/{slug(zone)}.md`). Every quest ID comes from capture, never from these pages.", "",
                                "**Key NPCs and what they care about (from their quests)**", *key_npcs, "",
                                "**Quest storylines**", "- TODO", "",
                                "**Year 1 status (what has and hasn't happened yet)**", "- TODO", "",
                                "Unsure, needs capture or a source before use: TODO", ""]))
        made.append("LORE_NOTES.md (lore sheet stub)")

    pkg = os.path.join(P.ROOT, ".pkgmeta")
    if os.path.exists(pkg):
        text = open(pkg, encoding="utf-8").read()
        if f": {addon}\n" not in text and "move-folders:" in text:
            m = re.search(r"move-folders:\n((?:[ \t]+.*\n)+)", text)
            if m:
                block = m.group(1)
                prefix = re.match(r"([ \t]+)(\S+?)/", block)
                indent, pkgname = (prefix.group(1), prefix.group(2)) if prefix else ("  ", "RPGDialogue")
                text = text.replace(block, block + f"{indent}{pkgname}/{addon}: {addon}\n", 1)
                open(pkg, "w", encoding="utf-8").write(text)
                made.append(".pkgmeta (move-folders)")

    print(f"Scaffold for {zone} in {addon}/ (pack {pack_id}):")
    for m in made:
        print("  +", m)
    if not made:
        print("  nothing new (every file already exists)")
    print("Next: lore sheet -> voice bibles (sources and quests first) -> propose throughlines -> write the NPCs "
          "-> remove `scaffold = true` -> python3 tools/check_all.py")
    return 0


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    sub = ap.add_subparsers(dest="cmd", required=True)
    for name in ("plan", "scaffold"):
        sp = sub.add_parser(name)
        sp.add_argument("zone", help='zone name as the game shows it, e.g. "Westfall"')
        sp.add_argument("--addon", help="addon folder name (default RPGDialogue_<Zone>)")
        sp.add_argument("--id", help="pack id (default rpgd.<zone>)")
        if name == "plan":
            sp.add_argument("--capture", help="SavedVariables/RPGDialogue.lua to import first")
            sp.add_argument("--force", action="store_true", help="rebuild an existing PLAN.md")
        else:
            sp.add_argument("--title", help="pack title (default the zone name)")
    args = ap.parse_args()
    return cmd_plan(args) if args.cmd == "plan" else cmd_scaffold(args)


if __name__ == "__main__":
    sys.exit(main())
