#!/usr/bin/env python3
"""Coverage report: what the content covers, per pack and per NPC.

    python3 tools/coverage.py [--out tools/out/coverage.md]

Lists, per NPC: lines and nodes, races/classes/genders and race+class combos with specific
content, noticing-moment categories, quests with before/during/after/later reactions, and
topics with an own take. Plus a throughline map (which NPCs carry beats for which threads).
Python 3, standard library only.
"""

import argparse
import collections
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from rpgd import packs as P  # noqa: E402
from rpgd.luadata import LTable, TodoRef  # noqa: E402

PHASE = {"questBefore": "before", "questActive": "during", "questObjective": "during", "questReady": "during",
         "questRecent": "after", "questDone": "after", "questLater": "later"}


def quest_name(v):
    ref = v[1] if isinstance(v, LTable) and 1 in v else v
    if isinstance(ref, TodoRef):
        return ref.name
    return str(ref)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=os.path.join(P.ROOT, "tools", "out", "coverage.md"))
    args = ap.parse_args()

    out = []
    w = out.append
    quests = collections.defaultdict(lambda: collections.defaultdict(set))   # quest -> phase -> npcs
    threads = collections.defaultdict(list)
    topic_takes = collections.defaultdict(set)
    w("# Coverage report\n")
    for pack in P.load_all():
        all_npcs = [(tbl, f) for kind, tbl, f, line in pack.defs if kind == "NPC"]
        scaffolds = sorted(str(tbl.get("key")) for tbl, f in all_npcs if tbl.get("scaffold"))
        npcs = [(tbl, f) for tbl, f in all_npcs if not tbl.get("scaffold")]
        pools = [(tbl, f) for kind, tbl, f, line in pack.defs if kind == "Pool"]
        for kind, tbl, f, line in pack.defs:
            if kind == "Thread":
                for b in P.arr(tbl.get("beats")):
                    if isinstance(b, LTable):
                        threads[tbl.get("id")].append((b.get("npc"), b.get("id")))
        if not npcs and not pools and not scaffolds:
            continue
        w(f"## {pack.meta.get('Title', pack.addon)}\n")
        if scaffolds:
            w(f"Written: {len(npcs)} of {len(all_npcs)} planned NPCs. Still scaffolds: {', '.join(scaffolds)}\n")
        w("| NPC | lines | nodes | races | classes | combos | gender | noticing | topics |")
        w("|---|---|---|---|---|---|---|---|---|")
        for tbl, f in sorted(npcs, key=lambda x: str(x[0].get("key"))) + sorted(pools, key=lambda x: str(x[0].get("id"))):
            owner = tbl.get("key") or ("pool:" + str(tbl.get("id")))
            races, classes, combos, genders, cats = set(), set(), set(), set(), set()
            n_lines = 0
            for slot, node, ln, gid in P.iter_lines(tbl, owner):
                n_lines += 1
                if slot == "notice" and ln.get("cat"):
                    cats.add(ln.get("cat"))
                if slot == "topic" and node != "_none":
                    topic_takes[node].add(owner)
                when = ln.get("when")
                found = {}

                def visit(k, v, path):
                    vals = v.array() if isinstance(v, LTable) and k in ("race", "class", "gender") else [v]
                    if k in ("race", "class", "gender"):
                        found.setdefault(k, set()).update(x for x in vals if isinstance(x, str))
                    if k in PHASE:
                        quests[quest_name(v)][PHASE[k]].add(owner)
                P.walk_conditions(when, visit)
                races |= found.get("race", set())
                classes |= found.get("class", set())
                genders |= found.get("gender", set())
                if found.get("race") and found.get("class"):
                    for r in found["race"]:
                        for c in found["class"]:
                            combos.add(f"{r} {c}")
            for nid, i, ch in P.iter_choices(tbl):
                def visit2(k, v, path):
                    if k in PHASE:
                        quests[quest_name(v)][PHASE[k]].add(owner)
                P.walk_conditions(ch.get("when"), visit2)
            nodes = len(tbl.get("nodes").named()) if isinstance(tbl.get("nodes"), LTable) else 0
            topics = tbl.get("topics").named() if isinstance(tbl.get("topics"), LTable) else {}
            w(f"| {owner} | {n_lines} | {nodes} | {', '.join(sorted(races)) or '-'} | {', '.join(sorted(classes)) or '-'} | "
              f"{', '.join(sorted(combos)) or '-'} | {', '.join(sorted(genders)) or '-'} | {', '.join(sorted(cats)) or '-'} | "
              f"{', '.join(sorted(t for t in topics if t != '_none')) or '-'} |")
        w("")
    w("## Quests: reactions before, during, after, later\n")
    w("| quest | before | during | after | later |\n|---|---|---|---|---|")
    for q in sorted(quests):
        ph = quests[q]
        w(f"| {q} | {', '.join(sorted(ph['before'])) or '-'} | {', '.join(sorted(ph['during'])) or '-'} | "
          f"{', '.join(sorted(ph['after'])) or '-'} | {', '.join(sorted(ph['later'])) or '-'} |")
    w("\n## Throughline map\n")
    for t, beats in sorted(threads.items()):
        w(f"- **{t}**: " + ", ".join(f"{npc} ({bid})" for npc, bid in beats))
    w("\n## Topics with an own take\n")
    for t in sorted(topic_takes):
        w(f"- {t}: {', '.join(sorted(topic_takes[t]))}")

    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write("\n".join(out) + "\n")
    print(f"Coverage report: {os.path.relpath(args.out, P.ROOT)} ({len(quests)} quests referenced, {len(threads)} thread(s))")
    return 0


if __name__ == "__main__":
    sys.exit(main())
