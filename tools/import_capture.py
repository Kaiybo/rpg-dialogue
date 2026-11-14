#!/usr/bin/env python3
"""Capture importer: reads your RPGDialogue SavedVariables file and builds the ID registry
the validator uses (tools/registry/ids.json). With --resolve it also replaces TODO
placeholders in the content packs with real IDs where the match is unambiguous.

    python3 tools/import_capture.py "<WoW>/_forever_/WTF/Account/<ACCOUNT>/SavedVariables/RPGDialogue.lua"
    python3 tools/import_capture.py <file> --resolve        # rewrite TODO_NPC/TODO_QUEST in packs
    python3 tools/import_capture.py <file> --resolve --dry-run

Registry entries are merged with what's already there, so several capture files (from
different characters or sessions) can be imported one after another.
Python 3, standard library only.
"""

import argparse
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from rpgd import packs as P  # noqa: E402
from rpgd.luadata import LTable, parse_saved_variables, to_plain  # noqa: E402

REGISTRY = os.path.join(P.ROOT, "tools", "registry", "ids.json")


def load_capture(path):
    data = parse_saved_variables(open(path, encoding="utf-8").read(), path)
    db = data.get("RPGDialogueDB")
    if not isinstance(db, LTable) or not isinstance(db.get("capture"), LTable):
        raise SystemExit("No RPGDialogueDB.capture in that file. Is it RPGDialogue.lua from SavedVariables?")
    return to_plain(db["capture"])


def merge_registry(cap):
    reg = {"npcs": {}, "quests": {}}
    if os.path.exists(REGISTRY):
        reg = json.load(open(REGISTRY, encoding="utf-8"))
    npcs = cap.get("npcs") or {}
    for nid, rec in (npcs.items() if isinstance(npcs, dict) else enumerate(npcs, 1)):
        if isinstance(rec, dict):
            cur = reg["npcs"].get(str(nid), {})
            cur.update({k: rec.get(k) for k in ("name", "subtitle", "zone", "subzone", "mapID", "x", "y", "level", "elite", "gossip", "reaction", "n") if rec.get(k) is not None})
            reg["npcs"][str(nid)] = cur
    for source in ("quests", "questText"):
        qs = cap.get(source) or {}
        for qid, rec in (qs.items() if isinstance(qs, dict) else enumerate(qs, 1)):
            if isinstance(rec, dict):
                cur = reg["quests"].get(str(qid), {})
                for k in ("title", "giver", "turnin", "zone"):
                    if rec.get(k) is not None:
                        cur[k] = rec.get(k)
                if isinstance(rec.get("minLevel"), int):
                    cur["minLevel"] = min(cur.get("minLevel", rec["minLevel"]), rec["minLevel"])
                if isinstance(rec.get("factions"), dict):
                    cur["factions"] = sorted(set(cur.get("factions", [])) | set(rec["factions"]))
                reg["quests"][str(qid)] = cur
    os.makedirs(os.path.dirname(REGISTRY), exist_ok=True)
    with open(REGISTRY, "w", encoding="utf-8") as fh:
        json.dump(reg, fh, indent=1, sort_keys=True)
    return reg


def norm(s):
    return re.sub(r"\s+", " ", re.sub(r"[^\w\s]", "", str(s).lower())).strip()


def resolve(reg, dry_run):
    by_name, by_title = {}, {}
    for nid, rec in reg["npcs"].items():
        by_name.setdefault(norm(rec.get("name", "")), []).append(int(nid))
    for qid, rec in reg["quests"].items():
        by_title.setdefault(norm(rec.get("title", "")), []).append(int(qid))
    changed, ambiguous, missing = 0, set(), set()
    for pack in P.find_packs():
        for f in pack.files:
            if not f.endswith(".lua"):
                continue
            path = os.path.join(pack.path, f)
            if not os.path.exists(path):
                continue
            src = open(path, encoding="utf-8").read()

            def sub(m):
                nonlocal changed
                kind, name = m.group(1), bytes(m.group(2), "utf-8").decode("unicode_escape")
                table = by_name if kind == "NPC" else by_title
                ids = sorted(set(table.get(norm(name), [])))
                if len(ids) == 1:
                    changed += 1
                    return str(ids[0])
                (ambiguous if ids else missing).add(f"{kind} {name}" + (f" -> {ids}" if ids else ""))
                return m.group(0)

            new = re.sub(r'TODO_(NPC|QUEST)\("((?:[^"\\]|\\.)*)"\)', sub, src)
            if new != src and not dry_run:
                open(path, "w", encoding="utf-8").write(new)
    return changed, ambiguous, missing


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("savedvariables")
    ap.add_argument("--resolve", action="store_true")
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    reg = merge_registry(load_capture(args.savedvariables))
    print(f"Registry: {len(reg['npcs'])} NPCs, {len(reg['quests'])} quests -> {os.path.relpath(REGISTRY, P.ROOT)}")
    if args.resolve:
        changed, ambiguous, missing = resolve(reg, args.dry_run)
        print(f"{'Would replace' if args.dry_run else 'Replaced'} {changed} placeholder(s).")
        for a in sorted(ambiguous):
            print("  ambiguous:", a)
        for m in sorted(missing):
            print("  not captured yet:", m)
        print("Unused local TODO_* aliases are harmless; run tools/validate.py --strict to see what's left.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
