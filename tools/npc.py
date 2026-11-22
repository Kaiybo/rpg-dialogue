#!/usr/bin/env python3
"""NPC lookup: who someone is in Forever, and whether we've already written them.

    python3 tools/npc.py "Topper McNabb"          # wiki facts + quotes + quests + our packs
    python3 tools/npc.py "Topper McNabb" --full   # also the whole article text
    python3 tools/npc.py --search "Booty Bay innkeeper"   # find wiki pages
    python3 tools/npc.py --local "McNabb"         # only our packs (no network)
    python3 tools/npc.py --zone "Booty Bay"       # NPCs the wiki lists for a place

Sources: warcraft.wiki.gg (wowpedia.fandom.com is also permitted for manual research;
wowhead is blocked in the cloud sessions), the local capture registry (tools/registry/ids.json, if imported),
and the content packs. Wiki pages describe original WoW unless a section or page says
Forever: treat quest names and IDs as unconfirmed for Forever (CLAUDE.md, LORE_NOTES.md).
Pages are cached in tools/out/wiki_cache/. Python 3, standard library only.
"""

import argparse
import hashlib
import html
import json
import os
import re
import sys
import urllib.parse
import urllib.request

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
API = "https://warcraft.wiki.gg/api.php"
CACHE = os.path.join(ROOT, "tools", "out", "wiki_cache")
REGISTRY = os.path.join(ROOT, "tools", "registry", "ids.json")
UA = "rpg-dialogue-npc-lookup/1.0 (WoW addon content tool)"


# ---------------------------------------------------------------------------
# Wiki access
# ---------------------------------------------------------------------------
def api(params, refresh=False):
    params = dict(params, format="json", formatversion="2")
    url = API + "?" + urllib.parse.urlencode(params)
    os.makedirs(CACHE, exist_ok=True)
    path = os.path.join(CACHE, hashlib.sha1(url.encode()).hexdigest() + ".json")
    if not refresh and os.path.exists(path):
        return json.load(open(path, encoding="utf-8"))
    req = urllib.request.Request(url, headers={"User-Agent": UA})
    with urllib.request.urlopen(req, timeout=30) as r:
        data = json.load(r)
    json.dump(data, open(path, "w", encoding="utf-8"))
    return data


def search(q, limit=10):
    d = api({"action": "query", "list": "search", "srsearch": q, "srlimit": limit})
    out = []
    for h in d.get("query", {}).get("search", []):
        snip = html.unescape(re.sub(r"<[^>]+>", "", h.get("snippet", "")))
        out.append((h["title"], snip))
    return out


def wikitext(title, refresh=False):
    d = api({"action": "parse", "page": title, "prop": "wikitext", "redirects": "1"}, refresh)
    if "error" in d:
        return None, None
    p = d["parse"]
    return p["title"], p["wikitext"]


# ---------------------------------------------------------------------------
# Wikitext -> plain text
# ---------------------------------------------------------------------------
def strip_templates(s):
    # remove nested {{...}} blocks we don't render
    out, depth, i = [], 0, 0
    while i < len(s):
        if s.startswith("{{", i):
            depth += 1
            i += 2
        elif s.startswith("}}", i) and depth:
            depth -= 1
            i += 2
        else:
            if not depth:
                out.append(s[i])
            i += 1
    return "".join(out)


def plain(s):
    s = re.sub(r"\{\{coords\|([\d.]+)\|([\d.]+)[^}]*\}\}", r" (\1, \2)", s)
    s = re.sub(r"\{\{(?:text|Text)\|\w+\|[^|}]*\|([^}]*)\}\}", r'"\1"', s)
    s = re.sub(r"\{\{(?:quest|Quest|questlong|npc|NPC|loc|item)\|(?:[^|}]*\|)*?([^|}]+)\}\}", r"\1", s)
    s = strip_templates(s)
    s = re.sub(r"\[\[(?:File|Image|Category):[^\]]*\]\]", "", s)
    s = re.sub(r"\[\[(?:[^|\]]*\|)?([^\]]*)\]\]", r"\1", s)
    s = re.sub(r"\[https?://\S+ ([^\]]*)\]", r"\1", s)
    s = re.sub(r"<ref[^>]*/>|<ref[^>]*>.*?</ref>", "", s, flags=re.S)
    s = re.sub(r"<br\s*/?>", "; ", s)
    s = re.sub(r"<[^>]+>", "", s)
    s = s.replace("'''", "").replace("''", "")
    s = re.sub(r"[ \t]+", " ", s)
    return html.unescape(s).strip()


def infobox(text):
    m = re.search(r"\{\{\s*(Npcbox|NPCbox|Npc|Infobox[^|\n]*)", text, re.I)
    if not m:
        return {}
    # take the balanced template
    i, depth = m.start(), 0
    for j in range(m.start(), len(text) - 1):
        if text.startswith("{{", j):
            depth += 1
        elif text.startswith("}}", j):
            depth -= 1
            if depth == 0:
                body = text[i + 2:j]
                break
    else:
        return {}
    fields, cur = {}, None
    for line in body.split("\n"):
        mm = re.match(r"\s*\|\s*([\w ]+?)\s*=\s*(.*)", line)
        if mm:
            cur = mm.group(1).strip().lower()
            fields[cur] = mm.group(2)
        elif cur:
            fields[cur] += " " + line
    return {k: plain(v) for k, v in fields.items() if plain(v)}


def sections(text):
    """[(heading, body)] with '' for the lead."""
    parts = re.split(r"^(={2,4})\s*(.*?)\s*\1\s*$", text, flags=re.M)
    out = [("", parts[0])]
    for k in range(1, len(parts), 3):
        out.append((parts[k + 1], parts[k + 2]))
    return out


def lead(text, sentences=4):
    body = sections(text)[0][1]
    body = re.sub(r"^\{\{\s*(Npcbox|NPCbox|Infobox).*?^\}\}", "", body, flags=re.S | re.M | re.I)
    paras = [plain(p) for p in body.split("\n\n")]
    paras = [p for p in paras if p and not p.startswith(("|", "{", "*"))]
    s = " ".join(paras)
    bits = re.split(r"(?<=[.!?])\s+", s)
    return " ".join(bits[:sentences])


def quotes(text):
    return [html.unescape(plain(m.group(1)))
            for m in re.finditer(r"\{\{text\|\w+\|[^|}]*\|([^}]*)\}\}", text, re.I)]


def quest_lines(text):
    out = []
    for head, body in sections(text):
        if re.search(r"quest|objective", head, re.I):
            for line in body.splitlines():
                if line.strip().startswith(("*", "#")):
                    t = plain(line.lstrip("*#: "))
                    if t:
                        out.append(t)
    return out


def forever_text(text):
    """Text under a Forever heading or a {{Forever-section}} tag."""
    out = []
    for h, body in sections(text):
        if "forever" in h.lower():
            out.append(plain(body))
        else:
            for m in re.finditer(r"\{\{\s*Forever-section[^}]*\}\}(.*?)(?=\{\{\s*\w+-section|\Z)", body, re.S | re.I):
                out.append(plain(m.group(1)))
    return "\n".join(t for t in out if t)


def era_sections(text):
    """Headings and era templates that tell you what is later than Year 1."""
    tags = sorted(set(m.group(1) for m in re.finditer(r"\{\{\s*(\w+)-section", text)))
    heads = [h for h, _ in sections(text) if h]
    return tags, heads


# ---------------------------------------------------------------------------
# Local: registry + packs
# ---------------------------------------------------------------------------
def local_hits(name):
    hits = []
    pat = re.compile(re.escape(name), re.I)
    for d in sorted(os.listdir(ROOT)):
        if not d.startswith("RPGDialogue"):
            continue
        for dp, _, files in os.walk(os.path.join(ROOT, d)):
            for f in files:
                if not f.endswith(".lua"):
                    continue
                p = os.path.join(dp, f)
                try:
                    n = sum(1 for line in open(p, encoding="utf-8") if pat.search(line))
                except UnicodeDecodeError:
                    continue
                if n:
                    hits.append((os.path.relpath(p, ROOT), n))
    reg = []
    if os.path.exists(REGISTRY):
        data = json.load(open(REGISTRY, encoding="utf-8"))
        for k, v in (data.get("npcs") or {}).items():
            if pat.search(json.dumps(v)) or pat.search(str(k)):
                reg.append((k, v))
    return hits, reg


def print_local(name):
    hits, reg = local_hits(name)
    print(f"\n== Our packs: '{name}' ==")
    if not hits:
        print("  not written yet")
    for p, n in sorted(hits, key=lambda x: -x[1])[:15]:
        print(f"  {p}  ({n} lines)")
    if reg:
        print("== Captured (tools/registry/ids.json) ==")
        for k, v in reg[:10]:
            print(f"  {k}: {v}")


# ---------------------------------------------------------------------------
def show(name, full=False, refresh=False):
    title, text = wikitext(name, refresh)
    if text is None:
        res = search(name, 5)
        if not res:
            print(f"No wiki page for '{name}'.")
            print_local(name)
            return
        title, text = wikitext(res[0][0], refresh)
        print(f"(no exact page; using best match '{title}')")
    url = "https://warcraft.wiki.gg/wiki/" + urllib.parse.quote(title.replace(" ", "_"))
    print(f"== {title} ==\n{url}")
    box = infobox(text)
    for k in ("title", "id", "level", "race", "gender", "class", "faction", "affiliation",
              "occupation", "location", "status", "relatives", "mentors", "students"):
        if k in box:
            print(f"  {k:<12} {box[k]}")
    print("\n" + lead(text, 99 if full else 4))
    tags, heads = era_sections(text)
    if heads:
        print("\nSections: " + " | ".join(heads))
    later = [t for t in tags if t.lower() not in ("forever", "wow", "cat", "classic", "vanilla", "wc3", "war3")]
    if later:
        print("Later-era/non-game sections (not Year 1, don't use): " + ", ".join(later))
    fv = forever_text(text)
    if fv:
        print("\n== Forever ==\n" + fv)
    q = quotes(text)
    if q:
        print("\n== Quotes ==")
        for line in dict.fromkeys(q):
            print("  " + line)
    ql = quest_lines(text)
    if ql:
        print("\n== Quests (original WoW; unconfirmed for Forever) ==")
        for line in ql[:25]:
            print("  " + line)
    if full:
        for h, body in sections(text)[1:]:
            t = plain(body)
            if t:
                print(f"\n== {h} ==\n{t}")
    print_local(title)


def zone(place):
    res = search(f'"{place}" npc', 1)
    title, text = wikitext(place)
    if text is None and res:
        title, text = wikitext(res[0][0])
    if text is None:
        print(f"No wiki page for '{place}'.")
        return
    print(f"== {title}: people listed on the wiki ==")
    seen = []
    for h, body in sections(text):
        if re.search(r"npc|resident|people|notable|character|vendor|trainer|service", h, re.I):
            print(f"\n-- {h} --")
            for line in body.splitlines():
                if line.strip().startswith(("*", "#", "|")):
                    t = plain(line.lstrip("*#|: "))
                    if t and t not in seen:
                        seen.append(t)
                        print("  " + t)
    if not seen:
        print("(no NPC section on that page; try --search)")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("name", nargs="?")
    ap.add_argument("--search", metavar="Q")
    ap.add_argument("--local", metavar="NAME")
    ap.add_argument("--zone", metavar="PLACE")
    ap.add_argument("--full", action="store_true")
    ap.add_argument("--refresh", action="store_true", help="ignore the cache")
    a = ap.parse_args()
    try:
        if a.search:
            for t, s in search(a.search):
                print(f"{t}\n    {s[:160]}")
        elif a.local:
            print_local(a.local)
        elif a.zone:
            zone(a.zone)
        elif a.name:
            show(a.name, a.full, a.refresh)
        else:
            ap.print_help()
    except BrokenPipeError:
        raise
    except OSError as e:
        print(f"Wiki unreachable ({e}). Local only:", file=sys.stderr)
        if a.name or a.local:
            print_local(a.name or a.local)
        sys.exit(1)


if __name__ == "__main__":
    try:
        main()
    except BrokenPipeError:
        sys.stderr.close()
