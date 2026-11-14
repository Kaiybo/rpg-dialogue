"""Loading content packs and the engine's vocabulary (condition keys, effects, tokens)
for the out-of-game tools. Python 3, standard library only."""

import os
import re

from .luadata import LTable, SubsetError, TodoRef, parse_pack_file

# RPGD_ROOT lets the tool tests run against a scratch copy of the repo.
ROOT = os.path.abspath(os.environ.get("RPGD_ROOT") or os.path.join(os.path.dirname(__file__), "..", ".."))
CORE = os.path.join(ROOT, "RPGDialogue")


# ---------------------------------------------------------------------------
# Vocabulary, read from the Lua sources so the tools never drift from the engine
# ---------------------------------------------------------------------------
def condition_spec(root=ROOT):
    """{ key: {'weight': int, 'kind': 'hinge'|'gate', 'sys': str|None} } from Conditions.lua."""
    src = open(os.path.join(root, "RPGDialogue", "Core", "Conditions.lua"), encoding="utf-8").read()
    spec = {}
    for m in re.finditer(r'\bdef\("(\w+)",\s*(\d+),\s*"(\w+)",\s*(nil|"(\w+)")', src):
        spec[m.group(1)] = {"weight": int(m.group(2)), "kind": m.group(3), "sys": m.group(5)}
    for m in re.finditer(r'\bctx(?:Eq|Bool)\("(\w+)",\s*(\d+)\)', src):
        spec[m.group(1)] = {"weight": int(m.group(2)), "kind": "hinge", "sys": None}
    for m in re.finditer(r'\bctxSet\("(\w+)",\s*"\w+",\s*(\d+)\)', src):
        spec[m.group(1)] = {"weight": int(m.group(2)), "kind": "hinge", "sys": None}
    for k in ("all", "any", "not"):
        spec[k] = {"weight": 0, "kind": "combinator", "sys": None}
    return spec


def effect_keys(root=ROOT):
    src = open(os.path.join(root, "RPGDialogue", "Core", "Effects.lua"), encoding="utf-8").read()
    m = re.search(r"Effects\.KEYS\s*=\s*\{(.*?)\}", src, re.S)
    return set(re.findall(r"(\w+)\s*=\s*true", m.group(1))) if m else set()


def token_names(root=ROOT):
    src = open(os.path.join(root, "RPGDialogue", "Core", "Tokens.lua"), encoding="utf-8").read()
    m = re.search(r"Tokens\.KNOWN\s*=\s*\{(.*?)\}", src, re.S)
    return set(re.findall(r'"(\w+)"', m.group(1))) if m else set()


def role_patterns(root=ROOT):
    """(subtitle patterns, name patterns) from WorldData.lua: [(lua_pattern, role), ...]."""
    src = open(os.path.join(root, "RPGDialogue", "Core", "WorldData.lua"), encoding="utf-8").read()

    def block(name):
        m = re.search(name + r"\s*=\s*\{(.*?)\n\}", src, re.S)
        return re.findall(r'\{\s*"([^"]+)",\s*"(\w+)"\s*\}', m.group(1)) if m else []
    return block("W.SUBTITLE_ROLES"), block("W.NAME_ROLES")


def detect_role(subtitle, name, patterns):
    """Same order as Conv.DetectRole: subtitle first (plain find), then name patterns."""
    subs, names = patterns
    s = (subtitle or "").lower()
    for pat, role in subs:
        if pat in s:
            return role
    n = (name or "").lower()
    for pat, role in names:
        if re.search(pat, n):
            return role
    return None


ROLES = {"questgiver", "guard", "innkeeper", "vendor", "trainer", "flightmaster", "stablemaster", "banker",
         "auctioneer", "spirithealer", "child", "militia", "peon", "blacksmith", "noble", "priest", "citizen",
         "farmer", "soldier", "worker", "scholar"}
TIERS = {"major", "quest", "service", "pooled"}
REACT_EVENTS = {"form", "pet", "mount", "stealth", "aura"}
SPECIAL_TAGS = {"Persuade", "Intimidate", "Deceive"}


# ---------------------------------------------------------------------------
# Packs
# ---------------------------------------------------------------------------
class Pack:
    def __init__(self, addon, path):
        self.addon, self.path = addon, path
        self.meta, self.files = {}, []
        self.id = None
        self.register = None
        self.defs = []          # (kind, LTable, file, line)
        self.errors = []        # (file, line, message) from parsing
        self.unlisted = []

    def rel(self, f):
        return os.path.relpath(os.path.join(self.path, f), ROOT)


def read_toc(path):
    meta, files = {}, []
    with open(path, encoding="utf-8-sig") as fh:
        for raw in fh:
            line = raw.strip()
            m = re.match(r"^##\s*([\w\-]+)\s*:\s*(.*)$", line)
            if m:
                meta[m.group(1)] = m.group(2).strip()
            elif line and not line.startswith("#"):
                files.append(line.replace("\\", "/"))
    return meta, files


def find_packs(root=ROOT, extra_dirs=()):
    packs = []
    dirs = [root] + list(extra_dirs)
    for base in dirs:
        for name in sorted(os.listdir(base)):
            path = os.path.join(base, name)
            toc = os.path.join(path, name + ".toc")
            if not (os.path.isdir(path) and name.startswith("RPGDialogue_") and os.path.exists(toc)):
                continue
            meta, files = read_toc(toc)
            if "X-RPGD-Pack" not in meta:
                continue
            pack = Pack(name, path)
            pack.meta, pack.files, pack.id = meta, files, meta["X-RPGD-Pack"]
            packs.append(pack)
    return packs


def load_pack(pack):
    listed = set()
    for f in pack.files:
        if not f.endswith(".lua"):
            continue
        listed.add(os.path.normpath(f))
        full = os.path.join(pack.path, f)
        if not os.path.exists(full):
            pack.errors.append((f, None, "listed in the TOC but missing"))
            continue
        try:
            parsed = parse_pack_file(open(full, encoding="utf-8").read(), pack.rel(f))
        except SubsetError as e:
            pack.errors.append((f, e.line, e.msg))
            continue
        if parsed["register"] is not None:
            pack.register = parsed["register"]
        if parsed["calls"] and parsed["pack"] and parsed["pack"] != pack.id:
            pack.errors.append((f, None, f"Pack(\"{parsed['pack']}\") doesn't match X-RPGD-Pack {pack.id}"))
        for kind, tbl, line in parsed["calls"]:
            pack.defs.append((kind, tbl, f, line))
    for dirpath, _, names in os.walk(pack.path):
        if "bibles" in dirpath:
            continue
        for n in names:
            if n.endswith(".lua"):
                rel = os.path.normpath(os.path.relpath(os.path.join(dirpath, n), pack.path))
                if rel not in listed:
                    pack.unlisted.append(rel)
    return pack


def load_all(root=ROOT, extra_dirs=()):
    return [load_pack(p) for p in find_packs(root, extra_dirs)]


# ---------------------------------------------------------------------------
# Walking an NPC/pool definition
# ---------------------------------------------------------------------------
def arr(v):
    if isinstance(v, LTable):
        return v.array()
    if isinstance(v, list):
        return v
    return []


def iter_lines(defn, owner_prefix):
    """Yields (slot, node_id, line_table, global_id) for every line in an NPC/pool/generic def."""
    for slot, field in (("greeting", "greetings"), ("notice", "notice"), ("react", "react"), ("line", "lines")):
        for line in arr(defn.get(field)):
            if isinstance(line, LTable):
                yield slot, None, line, f"{owner_prefix}.{line.get('id')}"
    nodes = defn.get("nodes")
    if isinstance(nodes, LTable):
        for nid, node in nodes.named().items():
            if isinstance(node, LTable):
                for line in arr(node.get("lines")):
                    if isinstance(line, LTable):
                        yield "line", nid, line, f"{owner_prefix}.{line.get('id')}"
    for line in arr(defn.get("barks")):
        if isinstance(line, LTable):
            yield "bark", None, line, f"{owner_prefix}.{line.get('id')}"
    topics = defn.get("topics")
    if isinstance(topics, LTable):
        for topic, lst in topics.named().items():
            for line in arr(lst):
                if isinstance(line, LTable):
                    yield "topic", topic, line, f"{owner_prefix}.{line.get('id')}"


def iter_choices(defn):
    nodes = defn.get("nodes")
    if isinstance(nodes, LTable):
        for nid, node in nodes.named().items():
            for i, ch in enumerate(arr(node.get("choices")) if isinstance(node, LTable) else [], 1):
                if isinstance(ch, LTable):
                    yield nid, i, ch
    for i, ch in enumerate(arr(defn.get("choices")), 1):
        if isinstance(ch, LTable):
            yield "(pool)", i, ch


def walk_conditions(when, fn, path="when"):
    """Calls fn(key, value, path) for every condition key in a when-table, through combinators."""
    if not isinstance(when, LTable):
        return
    for k, v in when.named().items():
        fn(k, v, path)
        if k in ("all", "not"):
            walk_conditions(v, fn, f"{path}.{k}")
        elif k == "any":
            for i, sub in enumerate(arr(v), 1):
                walk_conditions(sub, fn, f"{path}.any[{i}]")


def hinges(when, spec):
    if not isinstance(when, LTable):
        return 0
    n = 0
    for k, v in when.named().items():
        if k == "all":
            n += hinges(v, spec)
        elif k == "any":
            n += max([hinges(sub, spec) for sub in arr(v)] or [0])
        elif k != "not" and spec.get(k, {}).get("kind") == "hinge":
            n += 1
    return n


def todo_refs(v, out=None):
    out = [] if out is None else out
    if isinstance(v, TodoRef):
        out.append(v)
    elif isinstance(v, LTable):
        for x in v.values():
            todo_refs(x, out)
    return out
