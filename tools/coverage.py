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

# The depth standard (CONTENT_GUIDE.md "Depth"): talk branches from the opening node, nodes in
# all, the longest chain of nodes from the opening, and replies only some characters get.
DEPTH_STANDARD = {
    "major": {"branches": 4, "nodes": 10, "depth": 3, "gated": 2},
    "quest": {"branches": 3, "nodes": 6, "depth": 3, "gated": 1},
    "service": {"branches": 2, "nodes": 3, "depth": 2, "gated": 0},
}
EXITS = ("END", "BUSINESS", "BACK", None)
IDENTITY = {"race", "class", "gender", "faction", "origin", "band", "minLevel", "maxLevel", "form", "profession",
            "alignment", "trait", "townStanding", "questDone", "questActive", "questRecent", "heardLine",
            "heardClaim", "topicKnown", "opinion", "deed", "rep", "metBefore", "timesTalked", "flag", "claim"}


def depth_of(tbl):
    """(branches, nodes, depth, gated) for an NPC's conversation tree."""
    nodes = tbl.get("nodes").named() if isinstance(tbl.get("nodes"), LTable) else {}
    start = tbl.get("start") or "hello"
    edges, gated = {}, 0
    for nid, node in nodes.items():
        outs = []
        for ch in P.arr(node.get("choices")) if isinstance(node, LTable) else []:
            if not isinstance(ch, LTable):
                continue
            if ch.get("next") not in EXITS and ch.get("next") in nodes:
                outs.append(ch.get("next"))
            keys = set()
            P.walk_conditions(ch.get("when"), lambda k, v, path: keys.add(k))
            if keys & IDENTITY or ch.get("tag"):
                gated += 1
        edges[nid] = outs
    branches = len(set(edges.get(start, [])))

    best = 0
    def walk(n, seen):
        nonlocal best
        best = max(best, len(seen))
        if best >= 12:
            return
        for t in edges.get(n, []):
            if t not in seen:
                walk(t, seen | {t})
    if start in nodes:
        walk(start, {start})
    return branches, len(nodes), best, gated


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
    w("## Depth: how far each conversation goes\n")
    w("Standard (CONTENT_GUIDE.md \"Depth\"): " + "; ".join(
        f"{t}: {d['branches']}+ branches, {d['nodes']}+ nodes, {d['depth']}+ deep, {d['gated']}+ replies only some characters get"
        for t, d in DEPTH_STANDARD.items()) + "\n")
    w("| pack | NPC | tier | branches | nodes | deep | gated | meets |\n|---|---|---|---|---|---|---|---|")
    met = collections.Counter()
    total = collections.Counter()
    for pack in P.load_all():
        for kind, tbl, f, line in pack.defs:
            if kind != "NPC" or tbl.get("scaffold"):
                continue
            tier = tbl.get("tier") or "quest"
            std = DEPTH_STANDARD.get(tier)
            if not std:
                continue
            b, n, d, g = depth_of(tbl)
            ok = b >= std["branches"] and n >= std["nodes"] and d >= std["depth"] and g >= std["gated"]
            total[tier] += 1
            met[tier] += ok
            w(f"| {pack.addon.replace('RPGDialogue_', '')} | {tbl.get('key')} | {tier} | {b} | {n} | {d} | {g} | {'yes' if ok else 'no'} |")
    w("")
    w("Meeting the standard: " + ", ".join(f"{t} {met[t]}/{total[t]}" for t in DEPTH_STANDARD) + "\n")
    depth_summary = ", ".join(f"{t} {met[t]}/{total[t]}" for t in DEPTH_STANDARD)
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
    print(f"Coverage report: {os.path.relpath(args.out, P.ROOT)} ({len(quests)} quests referenced, {len(threads)} thread(s); "
          f"depth standard met: {depth_summary})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
