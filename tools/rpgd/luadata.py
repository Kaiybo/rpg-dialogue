"""Parser for RPG Dialogue's Lua data subset, and for WoW SavedVariables files.

Pack data files may contain only (DESIGN.md §2.2):
    local P = RPGDialogueAPI:Pack("pack.id")
    local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST
    RPGDialogueAPI:RegisterPack { ... }
    P:Kind { ... }            (or P:Kind({ ... }))
Inside tables: strings, numbers, booleans, nil, nested tables, and TODO_*("name") calls.
Anything else is a SubsetError with a line number.

Tables become LTable objects: a dict whose positional entries use int keys 1..n, with
.items_list() / .array() helpers and a .line attribute (where the table started).
Python 3, standard library only.
"""

import re

TODO_KINDS = ("TODO_NPC", "TODO_QUEST", "TODO_ITEM", "TODO_SPELL", "TODO_MAP")


class SubsetError(Exception):
    def __init__(self, msg, line=None, path=None):
        self.msg, self.line, self.path = msg, line, path
        where = f"{path or '?'}:{line or '?'}"
        super().__init__(f"{where}: {msg}")


class TodoRef:
    def __init__(self, kind, name, line=None):
        self.kind, self.name, self.line = kind, name, line

    def __repr__(self):
        return f'{self.kind}("{self.name}")'

    def __eq__(self, other):
        return isinstance(other, TodoRef) and (self.kind, self.name) == (other.kind, other.name)

    def __hash__(self):
        return hash((self.kind, self.name))


class LTable(dict):
    line = None

    def array(self):
        out, i = [], 1
        while i in self:
            out.append(self[i])
            i += 1
        return out

    def named(self):
        return {k: v for k, v in self.items() if isinstance(k, str)}


# ---------------------------------------------------------------------------
# Tokenizer
# ---------------------------------------------------------------------------
_NAME = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")
_NUMBER = re.compile(r"0[xX][0-9a-fA-F]+|(?:\d+\.?\d*|\.\d+)(?:[eE][+-]?\d+)?")
_LONG_OPEN = re.compile(r"\[(=*)\[")
_PUNCT = ("...", "..", "==", "~=", "<=", ">=", "{", "}", "[", "]", "(", ")", "=", ",", ";", ":", ".", "-", "+", "*", "/", "#", "<", ">", "%", "^")
_ESCAPES = {"n": "\n", "t": "\t", "r": "\r", "\\": "\\", '"': '"', "'": "'", "a": "\a", "b": "\b", "f": "\f", "v": "\v", "\n": "\n"}


def tokenize(src, path=None):
    toks = []
    i, line, n = 0, 1, len(src)
    while i < n:
        c = src[i]
        if c == "\n":
            line += 1
            i += 1
            continue
        if c in " \t\r":
            i += 1
            continue
        if src.startswith("--", i):
            m = _LONG_OPEN.match(src, i + 2)
            if m:
                close = "]" + m.group(1) + "]"
                end = src.find(close, m.end())
                if end < 0:
                    raise SubsetError("unclosed long comment", line, path)
                line += src.count("\n", i, end)
                i = end + len(close)
            else:
                end = src.find("\n", i)
                i = n if end < 0 else end
            continue
        if c in "\"'":
            j, buf = i + 1, []
            while True:
                if j >= n:
                    raise SubsetError("unclosed string", line, path)
                ch = src[j]
                if ch == c:
                    break
                if ch == "\n":
                    raise SubsetError("newline in string", line, path)
                if ch == "\\":
                    nxt = src[j + 1] if j + 1 < n else ""
                    if nxt.isdigit():
                        m = re.match(r"\d{1,3}", src[j + 1:])
                        buf.append(chr(int(m.group(0))))
                        j += 1 + len(m.group(0))
                        continue
                    buf.append(_ESCAPES.get(nxt, nxt))
                    j += 2
                    continue
                buf.append(ch)
                j += 1
            toks.append(("str", "".join(buf), line))
            i = j + 1
            continue
        m = _LONG_OPEN.match(src, i)
        if m:
            close = "]" + m.group(1) + "]"
            end = src.find(close, m.end())
            if end < 0:
                raise SubsetError("unclosed long string", line, path)
            body = src[m.end():end]
            if body.startswith("\n"):
                body = body[1:]
            toks.append(("str", body, line))
            line += src.count("\n", i, end)
            i = end + len(close)
            continue
        m = _NUMBER.match(src, i)
        if m and (c.isdigit() or (c == "." and i + 1 < n and src[i + 1].isdigit())):
            text = m.group(0)
            val = int(text, 16) if text.lower().startswith("0x") else (float(text) if any(ch in text for ch in ".eE") else int(text))
            toks.append(("num", val, line))
            i = m.end()
            continue
        m = _NAME.match(src, i)
        if m:
            word = m.group(0)
            kind = "kw" if word in ("true", "false", "nil", "local", "function", "end", "return", "and", "or", "not", "if", "then", "for", "while", "do") else "name"
            toks.append((kind, word, line))
            i = m.end()
            continue
        for p in _PUNCT:
            if src.startswith(p, i):
                toks.append(("op", p, line))
                i += len(p)
                break
        else:
            raise SubsetError(f"unexpected character {c!r}", line, path)
    toks.append(("eof", None, line))
    return toks


# ---------------------------------------------------------------------------
# Parser
# ---------------------------------------------------------------------------
class _Parser:
    def __init__(self, toks, path, allow_names=False):
        self.toks, self.pos, self.path, self.allow_names = toks, 0, path, allow_names

    def peek(self, k=0):
        return self.toks[self.pos + k]

    def next(self):
        t = self.toks[self.pos]
        self.pos += 1
        return t

    def expect(self, kind, value=None):
        t = self.next()
        if t[0] != kind or (value is not None and t[1] != value):
            want = value if value is not None else kind
            raise SubsetError(f"expected {want!r}, found {t[1]!r}", t[2], self.path)
        return t

    def accept(self, kind, value=None):
        t = self.peek()
        if t[0] == kind and (value is None or t[1] == value):
            self.pos += 1
            return t
        return None

    def value(self):
        t = self.peek()
        if t[0] == "str":
            self.pos += 1
            s = t[1]
            # Concatenation is code, not data.
            if self.peek()[0] == "op" and self.peek()[1] == "..":
                raise SubsetError("string concatenation isn't allowed in data", t[2], self.path)
            return s
        if t[0] == "num":
            self.pos += 1
            return t[1]
        if t[0] == "op" and t[1] == "-" and self.peek(1)[0] == "num":
            self.pos += 2
            return -self.peek(-1)[1]
        if t[0] == "kw" and t[1] in ("true", "false", "nil"):
            self.pos += 1
            return {"true": True, "false": False, "nil": None}[t[1]]
        if t[0] == "op" and t[1] == "{":
            return self.table()
        if t[0] == "name" and t[1] in TODO_KINDS:
            self.pos += 1
            self.expect("op", "(")
            s = self.expect("str")
            self.expect("op", ")")
            return TodoRef(t[1], s[1], t[2])
        if t[0] == "kw" and t[1] == "function":
            raise SubsetError("functions aren't allowed in data", t[2], self.path)
        if t[0] == "name":
            raise SubsetError(f"variable {t[1]!r} isn't allowed in data (only literals and TODO_* placeholders)", t[2], self.path)
        raise SubsetError(f"unexpected {t[1]!r}", t[2], self.path)

    def table(self):
        start = self.expect("op", "{")
        tbl = LTable()
        tbl.line = start[2]
        idx = 1
        while not self.accept("op", "}"):
            t = self.peek()
            if t[0] == "op" and t[1] == "[":
                self.pos += 1
                key = self.value()
                self.expect("op", "]")
                self.expect("op", "=")
                tbl[key] = self.value()
            elif t[0] == "name" and self.peek(1)[0] == "op" and self.peek(1)[1] == "=":
                self.pos += 2
                tbl[t[1]] = self.value()
            else:
                tbl[idx] = self.value()
                idx += 1
            if not (self.accept("op", ",") or self.accept("op", ";")):
                self.expect("op", "}")
                break
        return tbl

    def call_arg(self):
        if self.accept("op", "("):
            v = self.value()
            self.expect("op", ")")
            return v
        return self.value()


def parse_pack_file(src, path=None):
    """Returns { 'pack': id or None, 'register': LTable or None, 'calls': [(kind, LTable, line)] }."""
    toks = tokenize(src, path)
    p = _Parser(toks, path)
    out = {"pack": None, "register": None, "calls": [], "locals": set()}
    handle = None
    while p.peek()[0] != "eof":
        t = p.peek()
        if t[0] == "kw" and t[1] == "local":
            p.next()
            names = [p.expect("name")[1]]
            while p.accept("op", ","):
                names.append(p.expect("name")[1])
            p.expect("op", "=")
            first = p.peek()
            if len(names) == 1 and first[0] == "name" and first[1] == "RPGDialogueAPI":
                p.next()
                p.expect("op", ":")
                p.expect("name", "Pack")
                arg = p.call_arg()
                if not isinstance(arg, str):
                    raise SubsetError("Pack() needs a pack id string", t[2], path)
                handle = names[0]
                out["pack"] = arg
            else:
                # local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST
                for i, name in enumerate(names):
                    if i > 0:
                        p.expect("op", ",")
                    src_name = p.expect("name")
                    p.expect("op", ".")
                    field = p.expect("name")
                    if src_name[1] not in (handle, "RPGDialogueAPI") or field[1] != name or name not in TODO_KINDS:
                        raise SubsetError(f"only 'local {name} = P.{name}' style aliases of TODO_* are allowed", t[2], path)
                    out["locals"].add(name)
            continue
        if t[0] == "name" and t[1] == "RPGDialogueAPI":
            p.next()
            p.expect("op", ":")
            p.expect("name", "RegisterPack")
            meta = p.call_arg()
            if not isinstance(meta, LTable):
                raise SubsetError("RegisterPack needs a table", t[2], path)
            out["register"] = meta
            continue
        if t[0] == "name" and handle and t[1] == handle:
            p.next()
            p.expect("op", ":")
            kind = p.expect("name")
            arg = p.call_arg()
            if not isinstance(arg, LTable):
                raise SubsetError(f"{kind[1]} needs a table", kind[2], path)
            out["calls"].append((kind[1], arg, kind[2]))
            continue
        raise SubsetError(f"statement not allowed in data files: {t[1]!r}", t[2], path)
    return out


def parse_saved_variables(src, path=None):
    """Parses a WoW SavedVariables file: NAME = value, repeated. Returns {name: value}."""
    toks = tokenize(src, path)
    p = _Parser(toks, path)
    out = {}
    while p.peek()[0] != "eof":
        name = p.expect("name")
        p.expect("op", "=")
        out[name[1]] = p.value()
    return out


def to_plain(v):
    """LTable -> list (pure arrays) or dict, recursively. Handy for JSON output."""
    if isinstance(v, LTable):
        arr = v.array()
        if len(arr) == len(v):
            return [to_plain(x) for x in arr]
        return {str(k): to_plain(x) for k, x in v.items()}
    if isinstance(v, TodoRef):
        return repr(v)
    return v
