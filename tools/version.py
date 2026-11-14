#!/usr/bin/env python3
"""Version numbers for every addon folder, kept in step.

Each folder's version appears in four places that must agree:
  * the TOC's "## Version:" (what the game reads),
  * a grey version at the end of the TOC's "## Title:" (so it shows in the AddOns list),
  * the code: ns.VERSION in RPGDialogue/Core/Init.lua, or version = "..." in a pack's pack.lua,
  * the newest "## x.y.z" heading of its CHANGELOG.md (root for the core, the pack's own for packs).

    python3 tools/version.py                         # show every folder's version
    python3 tools/version.py --check                 # exit 1 if anything disagrees
    python3 tools/version.py set RPGDialogue 0.9.1   # update TOC, title and code together
    python3 tools/version.py set RPGDialogue_Elwynn 1.2.0
Write the CHANGELOG heading yourself (the tool reminds you). Python 3, standard library only.
"""

import argparse
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from rpgd import packs as P  # noqa: E402

ROOT = P.ROOT
GREY = "|cff8a8a8a"
SEMVER = re.compile(r"^\d+\.\d+\.\d+$")
INIT = os.path.join(ROOT, "RPGDialogue", "Core", "Init.lua")


def read(path):
    with open(path, encoding="utf-8") as fh:
        return fh.read()


def write(path, text):
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(text)


def title_version(title):
    m = re.search(r"\|c[0-9a-fA-F]{8}([\w.\-]+)\|r\s*$", title or "")
    return m.group(1) if m else None


def changelog_version(path):
    if not os.path.exists(path):
        return None
    m = re.search(r"^##\s+\[?v?(\d+\.\d+\.\d+)", read(path), re.M)
    return m.group(1) if m else None


def folders():
    """[(addon, folder path, toc path, code file, code regex, changelog)]"""
    out = [("RPGDialogue", os.path.join(ROOT, "RPGDialogue"), os.path.join(ROOT, "RPGDialogue", "RPGDialogue.toc"),
            INIT, r'(ns\.VERSION\s*=\s*")([^"]*)(")', os.path.join(ROOT, "CHANGELOG.md"))]
    for pack in P.find_packs():
        out.append((pack.addon, pack.path, os.path.join(pack.path, pack.addon + ".toc"),
                    os.path.join(pack.path, "pack.lua"), r'(\bversion\s*=\s*")([^"]*)(")',
                    os.path.join(pack.path, "CHANGELOG.md")))
    return out


def status():
    rows = []
    for addon, _, toc, code, rx, cl in folders():
        meta, _ = P.read_toc(toc)
        m = re.search(rx, read(code)) if os.path.exists(code) else None
        rows.append({
            "addon": addon, "toc": meta.get("Version"), "title": title_version(meta.get("Title")),
            "code": m.group(2) if m else None, "changelog": changelog_version(cl),
        })
    return rows


def problems(rows):
    out = []
    for r in rows:
        if not r["toc"] or not SEMVER.match(r["toc"]):
            out.append(f"{r['addon']}: TOC Version {r['toc']!r} isn't a version number like 1.2.3")
            continue
        for k, label in (("title", "the grey version in the TOC Title"), ("code", "the version in the code"),
                         ("changelog", "the newest CHANGELOG.md heading")):
            if r[k] != r["toc"]:
                out.append(f"{r['addon']}: {label} is {r[k]!r}, the TOC says {r['toc']}")
    return out


def cmd_set(addon, version):
    if not SEMVER.match(version):
        raise SystemExit(f"{version!r} isn't a version number like 1.2.3")
    for name, _, toc, code, rx, cl in folders():
        if name != addon:
            continue
        text = read(toc)
        text = re.sub(r"^## Version:.*$", f"## Version: {version}", text, count=1, flags=re.M)
        m = re.search(r"^## Title:(.*)$", text, re.M)
        if m:
            base = re.sub(r"\s*\|c[0-9a-fA-F]{8}[\w.\-]+\|r\s*$", "", m.group(1)).strip()
            text = text.replace(m.group(0), f"## Title: {base} {GREY}{version}|r", 1)
        write(toc, text)
        src = read(code)
        new, n = re.subn(rx, lambda mm: mm.group(1) + version + mm.group(3), src, count=1)
        if not n:
            raise SystemExit(f"no version found in {os.path.relpath(code, ROOT)}")
        write(code, new)
        print(f"{addon} is now {version} (TOC, title, {os.path.relpath(code, ROOT)}).")
        if changelog_version(cl) != version:
            print(f"Now add a '## {version} (date)' heading to {os.path.relpath(cl, ROOT)}.")
        return 0
    raise SystemExit(f"No addon folder {addon!r}. Folders: " + ", ".join(f[0] for f in folders()))


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--check", action="store_true", help="exit 1 if any folder's versions disagree")
    sub = ap.add_subparsers(dest="cmd")
    sp = sub.add_parser("set")
    sp.add_argument("addon")
    sp.add_argument("version")
    args = ap.parse_args()
    if args.cmd == "set":
        return cmd_set(args.addon, args.version)
    rows = status()
    probs = problems(rows)
    if not args.check or probs:
        width = max(len(r["addon"]) for r in rows)
        for r in rows:
            print(f"{r['addon']:<{width}}  {r['toc'] or '?'}")
    for p in probs:
        print("  -", p)
    if args.check:
        print(f"{len(rows)} folder(s), " + ("versions agree." if not probs else f"{len(probs)} problem(s)."))
    return 1 if (args.check and probs) else 0


if __name__ == "__main__":
    sys.exit(main())
