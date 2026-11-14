#!/usr/bin/env python3
"""AI-voice checker. Failures block a milestone, like validator errors.

    python3 tools/voicecheck.py

Fails on:
  * banned phrases (banned_phrases.txt; plain text or `re:` regular expressions)
  * near-identical lines spoken by different NPCs
  * mad-libs: lines built mainly around {race} or {class}
  * noticing moments in pools so broad that any NPC could say them
  * copied Blizzard wording: any 6-word run shared with captured quest or gossip text in
    reference/*.md (only when you have exported reference files; they stay local)
Warns on:
  * several NPCs opening the same way
  * words overused within one NPC, or within one pack
Python 3, standard library only.
"""

import collections
import difflib
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from rpgd import packs as P  # noqa: E402
from rpgd.luadata import LTable  # noqa: E402

NARROW_ROLES = {"child", "flightmaster", "innkeeper", "spirithealer", "blacksmith", "stablemaster", "guard", "trainer"}
STOP = set("""a an the and or but if then so of to in on at by for with from up down out over under again further once here
there when where why how all any both each few more most other some such no nor not only own same than too very can will
just don't should now i me my we our you your he him his she her it its they them their what which who whom this that these
those am is are was were be been being have has had do does did doing would could ought i'm you're he's she's it's we're
they're i've you've we've they've i'd you'd he'd she'd we'd they'd i'll you'll he'll she'll we'll they'll isn't aren't wasn't
weren't hasn't haven't hadn't doesn't didn't won't wouldn't shan't shouldn't can't cannot couldn't mustn't let's that's who's
what's here's there's when's where's why's how's as into through during before after above below between off about against
one two get got go going come like well yes oh mind""".split())


def load_banned(path):
    plain, regex = [], []
    if not os.path.exists(path):
        return plain, regex
    for raw in open(path, encoding="utf-8"):
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if line.startswith("re:"):
            regex.append(re.compile(line[3:], re.I))
        else:
            plain.append(line.lower())
    return plain, regex


def norm(text):
    text = re.sub(r"\{[^}]*\}", "", text.lower())
    return re.sub(r"[^a-z' ]+", " ", text).split()


SHINGLE = 6


def shingles(words, n=SHINGLE):
    return {" ".join(words[i:i + n]) for i in range(len(words) - n + 1)}


def reference_shingles():
    """6-word runs from captured Blizzard text (reference/*.md, written by export_reference.py)."""
    ref_dir = os.path.join(P.ROOT, "reference")
    out = {}
    if not os.path.isdir(ref_dir):
        return out
    for name in sorted(os.listdir(ref_dir)):
        if not name.endswith(".md"):
            continue
        with open(os.path.join(ref_dir, name), encoding="utf-8") as fh:
            for raw in fh:
                text = re.sub(r"^\s*(>|\*\*\w+:\*\*)\s*", "", raw)
                for sh in shingles(norm(text)):
                    out.setdefault(sh, name)
    return out


def main():
    plain, regex = load_banned(os.path.join(P.ROOT, "banned_phrases.txt"))
    fails, warns = [], []
    entries = []   # (owner, pack, gid, text, slot, is_choice)
    broad_notices = []
    for pack in P.load_all():
        for kind, tbl, f, line in pack.defs:
            if kind not in ("NPC", "Pool", "Generic"):
                continue
            owner = tbl.get("key") if kind == "NPC" else f"{kind.lower()}:{tbl.get('id')}"
            for slot, node, ln, gid in P.iter_lines(tbl, owner):
                if isinstance(ln.get("text"), str):
                    entries.append((owner, pack.addon, gid, ln["text"], slot, False))
                if kind == "Pool" and slot == "notice" and tbl.get("role") not in NARROW_ROLES and not tbl.get("community"):
                    broad_notices.append(gid)
            for nid, i, ch in P.iter_choices(tbl):
                if isinstance(ch.get("text"), str):
                    entries.append((owner, pack.addon, f"{owner}.{nid}.choice{i}", ch["text"], "choice", True))
        for kind, tbl, f, line in pack.defs:
            if kind == "Rumors":
                for ln in P.arr(tbl.get("lines")):
                    if isinstance(ln, LTable) and isinstance(ln.get("text"), str):
                        entries.append((f"rumors:{tbl.get('id')}", pack.addon, f"rumor:{tbl.get('id')}.{ln.get('id')}", ln["text"], "rumor", False))
            elif kind == "Errand":
                for k in ("offer", "thanks", "remind"):
                    if isinstance(tbl.get(k), str):
                        entries.append((tbl.get("npc"), pack.addon, f"errand:{tbl.get('id')}.{k}", tbl[k], "errand", False))
            if kind == "Thread":
                for b in P.arr(tbl.get("beats")):
                    if isinstance(b, LTable) and isinstance(b.get("text"), str):
                        entries.append((b.get("npc"), pack.addon, f"thread:{tbl.get('id')}.{b.get('id')}", b["text"], "beat", False))

    # Banned phrases
    for owner, pack, gid, text, slot, is_choice in entries:
        low = text.lower()
        for ph in plain:
            if ph in low:
                fails.append(f"banned phrase {ph!r} in {gid}: {text}")
        for rx in regex:
            if rx.search(text):
                fails.append(f"banned pattern /{rx.pattern}/ in {gid}: {text}")

    # Copied Blizzard wording (only checkable with local reference files)
    ref = reference_shingles()
    for owner, pack, gid, text, slot, is_choice in entries:
        hits = shingles(norm(text)) & ref.keys() if ref else set()
        if hits:
            sh = sorted(hits)[0]
            fails.append(f"copies Blizzard's wording (\"{sh}...\" is in reference/{ref[sh]}) in {gid}: write it in your own words")

    # Mad-libs
    for owner, pack, gid, text, slot, is_choice in entries:
        if re.search(r"\{(race|class)\}", text):
            rest = norm(text)
            first = text.split()[:4]
            if len(rest) < 6 or any(re.search(r"\{(race|class)\}", w) for w in first):
                fails.append(f"mad-lib (built around a race/class token) in {gid}: {text}")
    for gid in broad_notices:
        fails.append(f"noticing moment in a broad pool (any NPC could say it): {gid}")

    # Near-identical lines across different NPCs
    spoken = [(o, g, " ".join(norm(t))) for o, p, g, t, s, c in entries if not c and len(norm(t)) >= 5]
    by_first = collections.defaultdict(list)
    for o, g, t in spoken:
        by_first[t.split()[0] if t else ""].append((o, g, t))
    for bucket in by_first.values():
        for i in range(len(bucket)):
            for j in range(i + 1, len(bucket)):
                a, b = bucket[i], bucket[j]
                if a[0] != b[0] and difflib.SequenceMatcher(None, a[2], b[2]).ratio() > 0.82:
                    fails.append(f"near-identical lines from different NPCs: {a[1]} / {b[1]}")

    # Openings shared by several NPCs
    openings = collections.defaultdict(set)
    for owner, pack, gid, text, slot, is_choice in entries:
        if slot in ("greeting", "line") and not is_choice:
            words = norm(text)[:2]
            if len(words) == 2:
                openings[" ".join(words)].add(owner)
    for op, owners in sorted(openings.items()):
        if len(owners) >= 3:
            warns.append(f"{len(owners)} NPCs open with \"{op}...\": {', '.join(sorted(map(str, owners)))}")

    # Overused words within one NPC / one pack
    per_npc = collections.defaultdict(collections.Counter)
    per_pack = collections.defaultdict(collections.Counter)
    pack_lines = collections.Counter()
    for owner, pack, gid, text, slot, is_choice in entries:
        if is_choice:
            continue
        words = set(w for w in norm(text) if w not in STOP and len(w) > 3)
        per_npc[owner].update(words)
        per_pack[pack].update(words)
        pack_lines[pack] += 1
    for owner, c in per_npc.items():
        for word, n in c.items():
            if n >= 5:
                warns.append(f"{owner} uses \"{word}\" in {n} lines")
    for pack, c in per_pack.items():
        for word, n in c.most_common(8):
            if pack_lines[pack] >= 40 and n / pack_lines[pack] > 0.06:
                warns.append(f"{pack}: \"{word}\" appears in {n} of {pack_lines[pack]} lines")

    for w in warns:
        print("WARN ", w)
    for f in fails:
        print("FAIL ", f)
    print(f"\n{len(entries)} lines and replies checked" +
          (f" (and against {len(ref)} runs of captured Blizzard text)" if ref else " (no reference/ files, so no copy check)") +
          f". {len(fails)} failure(s), {len(warns)} warning(s).")
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
