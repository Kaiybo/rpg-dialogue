#!/usr/bin/env python3
"""Builds a ready-to-install zip of the addon folders, named after the core's version:
tools/out/RPGDialogue-<version>.zip, holding RPGDialogue/ and every content pack folder.

    python3 tools/build_zip.py

Leaves out what never ships: voice bibles, Markdown (plans, changelogs, notes) and anything
captured. Refuses to build if the folders' version numbers disagree (tools/version.py).
For releases, the BigWigs packager (.pkgmeta) does the same job from a git tag.
Python 3, standard library only.
"""

import os
import sys
import zipfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import version as V  # noqa: E402

SKIP_DIRS = {"bibles", "__pycache__"}


def main():
    rows = V.status()
    probs = V.problems(rows)
    if probs:
        for p in probs:
            print("  -", p)
        print("Versions disagree; fix them first (python3 tools/version.py).")
        return 1
    core = next(r["toc"] for r in rows if r["addon"] == "RPGDialogue")
    out_dir = os.path.join(V.ROOT, "tools", "out")
    os.makedirs(out_dir, exist_ok=True)
    out = os.path.join(out_dir, f"RPGDialogue-{core}.zip")
    count = 0
    with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as z:
        for addon, path, *_ in V.folders():
            for dirpath, dirnames, names in os.walk(path):
                dirnames[:] = sorted(d for d in dirnames if d not in SKIP_DIRS)
                for n in sorted(names):
                    if n.endswith(".md"):
                        continue
                    full = os.path.join(dirpath, n)
                    z.write(full, os.path.relpath(full, os.path.dirname(path)))
                    count += 1
    print(f"Built {os.path.relpath(out, V.ROOT)} ({count} files):")
    for r in rows:
        print(f"  {r['addon']} {r['toc']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
