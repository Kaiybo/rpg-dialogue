#!/usr/bin/env python3
"""Makes sure every version in CHANGELOG.md has a GitHub release (run by
.github/workflows/github-release.yml; needs full git history and the gh CLI).

For each `## x.y.z` heading without a `vx.y.z` release, it finds the last commit whose
RPGDialogue/RPGDialogue.toc says that version (mainline first, then any branch merged in),
zips the addon folders as they were there (no bibles, no Markdown), and publishes it with
that changelog section as the notes. Oldest first; the current version is marked latest.

    python3 tools/gh_releases.py [--dry-run]
"""

import io
import json
import os
import re
import subprocess
import sys
import tarfile
import zipfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOC = "RPGDialogue/RPGDialogue.toc"
OUT = os.path.join(ROOT, "tools", "out", "releases")
ADDON = re.compile(r"^RPGDialogue(_[A-Za-z0-9]+)?/")


def git(*args, binary=False):
    out = subprocess.run(["git", *args], cwd=ROOT, check=True, capture_output=True).stdout
    return out if binary else out.decode("utf-8", "replace")


def toc_version(commit):
    try:
        text = git("show", f"{commit}:{TOC}")
    except subprocess.CalledProcessError:
        return None
    m = re.search(r"^## Version:\s*(\S+)", text, re.M)
    return m.group(1) if m else None


def version_commits():
    """version -> commit holding that version's final state."""
    found = {}
    # Mainline first (the state just before the next bump is the most complete).
    for c in git("log", "--first-parent", "--format=%H", "HEAD").split():
        v = toc_version(c)
        if v and v not in found:
            found[v] = c
    # Versions that only ever existed on a merged branch.
    for c in git("log", "--topo-order", "--format=%H", "HEAD").split():
        v = toc_version(c)
        if v and v not in found:
            found[v] = c
    return found


def changelog():
    """[(version, date, name, notes)] oldest first. Heading: `## x.y.z (date): Patch Name`."""
    text = open(os.path.join(ROOT, "CHANGELOG.md"), encoding="utf-8").read()
    parts = re.split(r"^## (\d+\.\d+\.\d+)(?:\s*\(([^)]*)\))?(?:[ \t]*:[ \t]*(.*?))?[ \t]*$",
                     text, flags=re.M)
    out = []
    for i in range(1, len(parts), 4):
        out.append((parts[i], parts[i + 1] or "", (parts[i + 2] or "").strip(), parts[i + 3].strip()))
    return list(reversed(out))


def touches_workflows(commit):
    files = git("diff-tree", "-m", "--no-commit-id", "--name-only", "-r", commit)
    return ".github/workflows/" in files


def tag_target(version, commit):
    """GITHUB_TOKEN can't tag a commit that edits workflow files (HTTP 403), so step back
    along first parents to one with the same version that doesn't."""
    c = commit
    while touches_workflows(c):
        try:
            parent = git("rev-parse", f"{c}^1").strip()
        except subprocess.CalledProcessError:
            return commit
        if toc_version(parent) != version:
            return commit
        c = parent
    return c


def build_zip(version, commit):
    os.makedirs(OUT, exist_ok=True)
    path = os.path.join(OUT, f"RPGDialogue-{version}.zip")
    tar = tarfile.open(fileobj=io.BytesIO(git("archive", "--format=tar", commit, binary=True)))
    count = 0
    with zipfile.ZipFile(path, "w", zipfile.ZIP_DEFLATED) as z:
        for m in tar.getmembers():
            name = m.name
            if not m.isfile() or not ADDON.match(name):
                continue
            if name.endswith(".md") or "/bibles/" in name or "/__pycache__/" in name:
                continue
            z.writestr(name, tar.extractfile(m).read())
            count += 1
    return path, count


def gh(*args):
    return subprocess.run(["gh", *args], cwd=ROOT, check=True, capture_output=True, text=True).stdout


def main():
    dry = "--dry-run" in sys.argv
    existing = set()
    if not dry:
        rows = json.loads(gh("release", "list", "--limit", "1000", "--json", "tagName"))
        existing = {r["tagName"] for r in rows}
    commits = version_commits()
    current = toc_version("HEAD")
    made = failed = 0
    for version, date, name, notes in changelog():
        tag = f"v{version}"
        if tag in existing:
            continue
        commit = commits.get(version)
        if not commit:
            print(f"{tag}: no commit has this version; skipped")
            continue
        path, count = build_zip(version, commit)
        body = (f"Released {date}.\n\n" if date else "") + notes
        body += "\n\n---\nUnzip into Interface/AddOns, then fully restart the game.\n"
        print(f"{tag}: {commit[:8]}, {count} files")
        if dry:
            continue
        notes_path = path + ".notes.md"
        with open(notes_path, "w", encoding="utf-8") as f:
            f.write(body)
        target = tag_target(version, commit)
        try:
            gh("release", "create", tag, path, "--target", target, "--title",
               f"RPG Dialogue {version}" + (f": {name}" if name else ""), "--notes-file", notes_path, "--latest=false")
        except subprocess.CalledProcessError as e:
            print(f"{tag}: release failed at {target[:8]}: {e.stderr.strip()}")
            failed += 1
            continue
        made += 1
        if version == current and os.environ.get("GITHUB_OUTPUT"):
            # The tag above was made with GITHUB_TOKEN, which doesn't start release.yml,
            # so the workflow uploads this one to CurseForge itself.
            with open(os.environ["GITHUB_OUTPUT"], "a") as f:
                f.write(f"curse_tag={tag}\n")
    if not dry and current and (made or f"v{current}" in existing):
        try:
            gh("release", "edit", f"v{current}", "--latest")
        except subprocess.CalledProcessError as e:
            print(f"could not mark v{current} latest: {e.stderr}")
    print(f"{made} release(s) created, {failed} failed")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
