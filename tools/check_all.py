#!/usr/bin/env python3
"""Runs every check in one go: the gate before a commit, a milestone or a release.

    python3 tools/check_all.py              # everyday: tests, lint, validator, voice, simulation, coverage
    python3 tools/check_all.py --quick      # skip the simulation
    python3 tools/check_all.py --release    # also: strict validator (no TODO ids, no scaffolds),
                                            # packaging and repository checks

Each check's full output goes to tools/out/check_<name>.txt; the summary shows what failed.
Exit code 1 if anything failed. Python 3, standard library only (the Lua checks need lua5.1
and luacheck on PATH; a missing tool is SKIPPED, and a skip fails --release).
"""

import argparse
import os
import re
import shutil
import subprocess
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from rpgd import packs as P  # noqa: E402

ROOT = P.ROOT
OUT = os.path.join(ROOT, "tools", "out")
PY = sys.executable


def tool(name, *args):
    return [PY, os.path.join(ROOT, "tools", name)] + list(args)


def run(name, cmd):
    t = time.time()
    try:
        p = subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True)
    except FileNotFoundError as e:
        return "SKIP", str(e), 0
    os.makedirs(OUT, exist_ok=True)
    with open(os.path.join(OUT, f"check_{name}.txt"), "w", encoding="utf-8") as fh:
        fh.write(p.stdout + ("\n" + p.stderr if p.stderr else ""))
    lines = [ln for ln in (p.stdout + "\n" + p.stderr).strip().splitlines() if ln.strip()]
    summary = lines[-1] if lines else ""
    return ("PASS" if p.returncode == 0 else "FAIL"), summary, time.time() - t


# ---------------------------------------------------------------------------
# Release-only checks (in-process)
# ---------------------------------------------------------------------------
def release_checks():
    problems = []
    packs = [p for p in P.find_packs()]
    tocs = [os.path.join(ROOT, "RPGDialogue", "RPGDialogue.toc")] + [os.path.join(p.path, p.addon + ".toc") for p in packs]
    interfaces = {}
    for toc in tocs:
        meta, _ = P.read_toc(toc)
        rel = os.path.relpath(toc, ROOT)
        interfaces.setdefault(meta.get("Interface", "?"), []).append(rel)
        if meta.get("Version") != "@project-version@":
            problems.append(f"{rel}: Version should be @project-version@ (the packager fills it in from the git tag)")
        if not meta.get("Title") or not meta.get("Notes"):
            problems.append(f"{rel}: needs Title and Notes")
    if len(interfaces) > 1:
        problems.append("TOCs disagree on ## Interface: " + "; ".join(f"{k} in {', '.join(v)}" for k, v in interfaces.items()))

    pkg = os.path.join(ROOT, ".pkgmeta")
    text = open(pkg, encoding="utf-8").read() if os.path.exists(pkg) else ""
    for addon in ["RPGDialogue"] + [p.addon for p in packs]:
        if not re.search(r"^\s+\S+/" + re.escape(addon) + r":\s*" + re.escape(addon) + r"\s*$", text, re.M):
            problems.append(f".pkgmeta: {addon} missing from move-folders (it won't be in the release zip)")
    for must in ("tests", "tools", "reference"):
        if not re.search(r"^\s+-\s+\"?" + must + r"\"?\s*$", text, re.M):
            problems.append(f".pkgmeta: '{must}' should be in ignore")

    if shutil.which("git") and os.path.isdir(os.path.join(ROOT, ".git")):
        tracked = subprocess.run(["git", "ls-files", "reference", "*.SavedVariables.lua", "WTF"], cwd=ROOT,
                                 capture_output=True, text=True).stdout.split()
        if tracked:
            problems.append("captured Blizzard text or SavedVariables are tracked by git: " + ", ".join(tracked[:5]) +
                            " (git rm --cached them; they must never be published)")
        dirty = subprocess.run(["git", "status", "--porcelain"], cwd=ROOT, capture_output=True, text=True).stdout.strip()
        if dirty:
            problems.append("uncommitted changes (tag a release from a clean tree)")

    # Blizzard's UI add-on policy and the brief's hard rules, checked in what ships:
    # nothing talks to other players or servers, no dynamic code, no ads or donation asks.
    forbidden = {
        r"\bSendChatMessage\b": "sends chat (barks and whispers must stay local)",
        r"\bSendAddonMessage\b|C_ChatInfo\.SendAddonMessage": "sends addon messages (client-side and solo only)",
        r"\bloadstring\b|\bRunScript\b|\bsetfenv\b": "runs dynamic code (packs are data)",
        r"(?i)patreon|paypal|ko-fi|buymeacoffee|donat(e|ion)": "asks for donations in game (policy rule 5)",
    }
    for addon_dir in ["RPGDialogue"] + [p.addon for p in packs]:
        for dirpath, _, names in os.walk(os.path.join(ROOT, addon_dir)):
            if "bibles" in dirpath:
                continue
            for n in names:
                if not n.endswith((".lua", ".xml", ".toc")):
                    continue
                path = os.path.join(dirpath, n)
                text = open(path, encoding="utf-8").read()
                for rx, why in forbidden.items():
                    m = re.search(rx, text)
                    if m:
                        problems.append(f"{os.path.relpath(path, ROOT)}: {m.group(0)!r} {why}")

    # Each pack has its own version (pack.lua) and changelog (CHANGELOG.md in the pack folder).
    for p in packs:
        reg = p.register if p.register is not None else None
        if reg is None:
            P.load_pack(p)
            reg = p.register
        version = reg.get("version") if reg is not None else None
        cl_path = os.path.join(p.path, "CHANGELOG.md")
        if not os.path.exists(cl_path):
            problems.append(f"{p.addon}: no CHANGELOG.md (each pack keeps its own)")
            continue
        m = re.search(r"^##\s+\[?v?(\d+\.\d+\.\d+)", open(cl_path, encoding="utf-8").read(), re.M)
        if not m:
            problems.append(f"{p.addon}/CHANGELOG.md: no '## x.y.z' version heading")
        elif version != m.group(1):
            problems.append(f"{p.addon}: pack.lua version {version!r} doesn't match CHANGELOG.md ({m.group(1)})")

    cl = os.path.join(ROOT, "CHANGELOG.md")
    if not os.path.exists(cl) or not re.search(r"^## ", open(cl, encoding="utf-8").read(), re.M):
        problems.append("CHANGELOG.md has no version sections")
    for f in ("LICENSE", "README.md"):
        if not os.path.exists(os.path.join(ROOT, f)):
            problems.append(f"{f} is missing")
    return problems


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--quick", action="store_true", help="skip the simulation")
    ap.add_argument("--release", action="store_true", help="strict validator plus packaging and repository checks")
    ap.add_argument("--characters", type=int, default=1500, help="simulation size (default 1500)")
    args = ap.parse_args()

    lua = shutil.which("lua5.1") or shutil.which("luajit")
    checks = [
        ("lua_tests", [lua, "tests/run.lua"] if lua else None, "Lua engine tests (mock client)"),
        ("tool_tests", [PY, "-m", "unittest", "discover", "-s", "tests", "-p", "test_*.py"], "Python tool tests"),
        ("luacheck", ["luacheck", "--no-color", "."] if shutil.which("luacheck") else None, "luacheck (lint, no stray globals)"),
        ("validate", tool("validate.py", "--quiet", *(["--strict"] if args.release else [])), "Content validator"),
        ("voicecheck", tool("voicecheck.py"), "AI-voice checker"),
        ("simulate", None if args.quick else tool("simulate.py", "--characters", str(args.characters)), "Simulation"),
        ("coverage", tool("coverage.py"), "Coverage report"),
    ]
    results = []
    for name, cmd, label in checks:
        if cmd is None:
            status = "SKIP"
            summary = "skipped (--quick)" if name == "simulate" and args.quick else "tool not installed"
            results.append((label, status, summary, 0))
            continue
        status, summary, secs = run(name, cmd)
        results.append((label, status, summary, secs))
    if args.release:
        probs = release_checks()
        results.append(("Release checks", "FAIL" if probs else "PASS", f"{len(probs)} problem(s)", 0))

    width = max(len(r[0]) for r in results)
    print()
    for label, status, summary, secs in results:
        print(f"{status:4}  {label:<{width}}  {summary[:110]}" + (f"  ({secs:.0f}s)" if secs >= 1 else ""))
    if args.release:
        for p in probs:
            print("      -", p)
    failed = [r for r in results if r[1] == "FAIL" or (args.release and r[1] == "SKIP")]
    print(f"\n{'All checks passed.' if not failed else f'{len(failed)} check(s) failed.'} Full output: tools/out/check_*.txt")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
