#!/usr/bin/env python3
"""Exports captured Blizzard text as writing reference: reference/<zone>.md, one section per
NPC (gossip greetings, quests given and turned in, quest text at every stage).

This is reference for writing voice bibles. It never ships in dialogue, and it must stay out
of any public repository (it's Blizzard's text).

    python3 tools/export_reference.py "<...>/SavedVariables/RPGDialogue.lua" [--zone "Elwynn Forest"]
Python 3, standard library only.
"""

import argparse
import collections
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from rpgd import packs as P  # noqa: E402
from import_capture import load_capture  # noqa: E402


def slug(s):
    return re.sub(r"[^a-z0-9]+", "_", s.lower()).strip("_") or "unknown"


def items(d):
    return d.items() if isinstance(d, dict) else enumerate(d or [], 1)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("savedvariables")
    ap.add_argument("--zone", help="only this zone")
    args = ap.parse_args()
    cap = load_capture(args.savedvariables)
    npcs = {int(k): v for k, v in items(cap.get("npcs")) if isinstance(v, dict)}
    gossip = {int(k): v for k, v in items(cap.get("gossip")) if isinstance(v, dict)}
    qtext = {int(k): v for k, v in items(cap.get("questText")) if isinstance(v, dict)}
    quests = {int(k): v for k, v in items(cap.get("quests")) if isinstance(v, dict)}

    by_zone = collections.defaultdict(list)
    for nid, rec in npcs.items():
        by_zone[rec.get("zone") or "Unknown"].append(nid)
    outdir = os.path.join(P.ROOT, "reference")
    os.makedirs(outdir, exist_ok=True)
    written = 0
    for zone, ids in sorted(by_zone.items()):
        if args.zone and zone != args.zone:
            continue
        out = [f"# {zone}: captured text (reference only, never ship, never publish)\n"]
        for nid in sorted(ids, key=lambda i: (npcs[i].get("subzone") or "", npcs[i].get("name") or "")):
            rec = npcs[nid]
            out.append(f"## {rec.get('name', '?')}  (NPC {nid})")
            out.append(f"{rec.get('subtitle') or ''} · {rec.get('subzone') or ''} ({rec.get('x', '?')}, {rec.get('y', '?')}) · level {rec.get('level', '?')}\n")
            g = gossip.get(nid)
            if g:
                for t in (g.get("greetings") or []):
                    out.append(f"> {t}\n")
                opts = g.get("options")
                if isinstance(opts, dict) and opts:
                    out.append("Options: " + "; ".join(sorted(opts)) + "\n")
            given = [q for q, r in qtext.items() if r.get("giver") == nid] + [q for q, r in quests.items() if r.get("giver") == nid]
            taken = [q for q, r in qtext.items() if r.get("turnin") == nid] + [q for q, r in quests.items() if r.get("turnin") == nid]
            for label, lst in (("Gives", given), ("Takes", taken)):
                for q in sorted(set(lst)):
                    t = qtext.get(q, {})
                    title = t.get("title") or quests.get(q, {}).get("title") or "?"
                    out.append(f"### {label}: {title} (quest {q})")
                    for key, name in (("description", "Description"), ("objectives", "Objectives"),
                                      ("progress", "Progress"), ("completion", "Completion")):
                        if t.get(key):
                            out.append(f"**{name}:** {t[key]}\n")
            out.append("")
        with open(os.path.join(outdir, slug(zone) + ".md"), "w", encoding="utf-8") as fh:
            fh.write("\n".join(out))
        written += 1
    print(f"Wrote {written} zone file(s) to reference/.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
