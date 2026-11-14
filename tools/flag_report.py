#!/usr/bin/env python3
"""Turns the in-game "this line is wrong" flags into a report you can hand to the next
session to fix (each entry shows the line, where it lives, who said it, your note, and the
full context at the time).

    python3 tools/flag_report.py "<...>/SavedVariables/RPGDialogue.lua" [--out tools/out/flagged.md]
Python 3, standard library only.
"""

import argparse
import datetime
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from rpgd import packs as P  # noqa: E402
from rpgd.luadata import parse_saved_variables, to_plain  # noqa: E402


def locate(gid):
    """Finds file:line for a global line id like 'mcbride.h_default'."""
    if not gid or "." not in gid:
        return None
    owner, lid = gid.rsplit(".", 1)
    pattern = re.compile(r'\bid\s*=\s*"' + re.escape(lid) + r'"')
    for pack in P.find_packs():
        for f in pack.files:
            path = os.path.join(pack.path, f)
            if not f.endswith(".lua") or not os.path.exists(path):
                continue
            text = open(path, encoding="utf-8").read()
            if owner.startswith("pool:") or owner.startswith("generic:"):
                if f'id = "{owner.split(":", 1)[1]}"' not in text:
                    continue
            elif f'key = "{owner}"' not in text:
                continue
            for n, line in enumerate(text.splitlines(), 1):
                if pattern.search(line):
                    return f"{os.path.relpath(path, P.ROOT)}:{n}"
    return None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("savedvariables")
    ap.add_argument("--out", default=os.path.join(P.ROOT, "tools", "out", "flagged.md"))
    args = ap.parse_args()
    data = parse_saved_variables(open(args.savedvariables, encoding="utf-8").read(), args.savedvariables)
    flagged = to_plain((data.get("RPGDialogueDB") or {}).get("flagged") or [])
    if isinstance(flagged, dict):
        flagged = [flagged[k] for k in sorted(flagged, key=lambda k: int(k))]
    out = [f"# Flagged lines ({len(flagged)})\n", "Fix each one and note the fix in CHANGELOG.md.\n"]
    for i, f in enumerate(flagged, 1):
        when = datetime.datetime.fromtimestamp(f.get("t", 0), datetime.timezone.utc).strftime("%Y-%m-%d %H:%M") if f.get("t") else "?"
        out.append(f"## {i}. {f.get('line')} ({f.get('npc')})")
        out.append(f"- Where: {locate(f.get('line')) or 'not found (removed or renamed?)'}")
        out.append(f"- Said: \"{f.get('text')}\"")
        out.append(f"- Note: {f.get('note') or '(none)'}")
        out.append(f"- Node: {f.get('node')} · pack {f.get('pack')} · seed {f.get('seed')} · {when} UTC")
        ctx = f.get("ctx") or []
        if isinstance(ctx, dict):
            ctx = [ctx[k] for k in sorted(ctx, key=lambda k: int(k))]
        out.append("- Context: " + "; ".join(ctx))
        out.append("")
    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w", encoding="utf-8") as fh:
        fh.write("\n".join(out))
    print(f"{len(flagged)} flagged line(s) -> {os.path.relpath(args.out, P.ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
