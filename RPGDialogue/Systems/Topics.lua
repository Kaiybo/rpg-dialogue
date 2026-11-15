-- "Ask about..." topics the player has learned (Morrowind-style).
--
--   * Topics are learned from lines and choices (fx.learn), from books, and by hearing them:
--     when someone says a topic's name (or one of its keywords), the player picks it up,
--     and the word is highlighted in the box so it can be clicked to ask about it.
--   * "Ask anyone" topics (standard = true: their story, their work, a little advice,
--     latest rumors) are always known and answered by everyone: the NPC's own take, then
--     their role's, then anyone's.
--   * The list groups topics by category, most recent first, with the "ask anyone" topics
--     on top; a topic already asked of this NPC is marked.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local Topics = {}
ns.Topics = Topics

Topics.STALE_SECONDS = 30 * 86400
Topics.LINK_PREFIX = "rpgdtopic:"
Topics.MIN_KEYWORD = 4

local function standardIds()
  local out = {}
  for id, def in pairs(ns.Data.topics or {}) do
    if def.standard then out[#out + 1] = id end
  end
  table.sort(out, function(a, b)
    local da, db = ns.Data.topics[a], ns.Data.topics[b]
    if (da.order or 99) ~= (db.order or 99) then return (da.order or 99) < (db.order or 99) end
    return a < b
  end)
  return out
end

function Topics.IsStandard(id)
  local def = ns.Data.topics and ns.Data.topics[id]
  return def ~= nil and def.standard == true
end

-- Known topics, most recently learned first. Each: { id, name, category, learned, asked, archived, standard }
-- With npcKey, topics that NPC said they could speak to ("What do you know?") carry knows = true.
function Topics.Known(includeArchived, npcKey)
  local out = {}
  local now = C.Now()
  local mem = npcKey and ns.char.npc[npcKey]
  local knows = mem and mem.knows or {}
  for id, rec in pairs(ns.char.topics) do
    local def = ns.Data.topics[id]
    if not (def and def.standard) then
      local last = math.max(rec.t or 0, rec.asked or 0)
      local archived = rec.archived or (now - last > Topics.STALE_SECONDS)
      if includeArchived or not archived then
        out[#out + 1] = {
          id = id, name = def and def.name or id, category = def and def.category or "other",
          learned = rec.t or 0, asked = rec.asked, archived = archived, knows = knows[id] ~= nil or nil,
        }
      end
    end
  end
  table.sort(out, function(a, b)
    if a.learned ~= b.learned then return a.learned > b.learned end
    return a.name < b.name
  end)
  local std = {}
  for _, id in ipairs(standardIds()) do
    local def = ns.Data.topics[id]
    std[#std + 1] = { id = id, name = def.name, category = def.category or "anyone", learned = math.huge, standard = true }
  end
  for i = #std, 1, -1 do table.insert(out, 1, std[i]) end
  return out
end

function Topics.Filter(list, text)
  if not text or text == "" then return list end
  local needle = text:lower()
  local out = {}
  for _, t in ipairs(list) do
    if t.name:lower():find(needle, 1, true) or t.category:lower():find(needle, 1, true) then out[#out + 1] = t end
  end
  return out
end

function Topics.CategoryName(cat)
  return L["TOPIC_CAT_" .. tostring(cat):upper()] or cat
end

-- Rows for the list: the "ask anyone" topics, then each category under a header, in the
-- order of its most recently learned topic. A search shows a flat list.
function Topics.Rows(list, searching)
  if searching then
    local rows = {}
    for _, t in ipairs(list) do rows[#rows + 1] = { topic = t } end
    return rows
  end
  local order, groups = {}, {}
  -- "What they can tell you about": what this NPC said they know, right after "Ask anyone".
  local hasKnows = false
  for _, t in ipairs(list) do if t.knows and not t.standard then hasKnows = true; break end end
  for _, t in ipairs(list) do
    local cat = t.standard and "anyone" or (t.knows and "knows") or t.category
    if hasKnows and cat ~= "anyone" and not groups.knows then groups.knows = {}; order[#order + 1] = "knows" end
    if not groups[cat] then groups[cat] = {}; order[#order + 1] = cat end
    table.insert(groups[cat], t)
  end
  local rows = {}
  for _, cat in ipairs(order) do
    rows[#rows + 1] = { header = Topics.CategoryName(cat) }
    for _, t in ipairs(groups[cat]) do rows[#rows + 1] = { topic = t } end
  end
  return rows
end

-- answered = false: they had nothing to say about it (a brush-off), shown as such in the list.
function Topics.Asked(id, npcKey, answered)
  local rec = ns.char.topics[id]
  if rec then rec.asked = C.Now(); rec.archived = nil end
  local mem = npcKey and ns.char.npc[npcKey]
  if mem then
    mem.topics = mem.topics or {}
    mem.topics[id] = C.Now()
    if answered == false then
      mem.nothing = mem.nothing or {}
      mem.nothing[id] = true
    elseif mem.nothing then
      mem.nothing[id] = nil
    end
  end
end

-- What people said when asked about it, for the journal's "Heard of" page: one answer per
-- person (the latest), at most MAX_ANSWERS people per topic. Stored as line ids.
Topics.MAX_ANSWERS = 8
function Topics.RecordAnswer(id, npcKey, name, gid)
  local rec = ns.char.topics[id]
  if not rec or not gid then return end
  rec.said = rec.said or {}
  local who = npcKey or name or "?"
  for i, a in ipairs(rec.said) do
    if a.who == who then table.remove(rec.said, i); break end
  end
  table.insert(rec.said, { who = who, name = name, gid = gid, t = C.Now() })
  while #rec.said > Topics.MAX_ANSWERS do table.remove(rec.said, 1) end
end

-- They were asked and had nothing to say about it.
function Topics.NothingFrom(id, npcKey)
  local mem = npcKey and ns.char.npc[npcKey]
  return mem ~= nil and mem.nothing ~= nil and mem.nothing[id] == true
end

-- "What do you know?": remember what they said they could speak to.
function Topics.MarkKnows(ids, npcKey)
  local mem = npcKey and ns.char.npc[npcKey]
  if not mem then return end
  mem.knows = mem.knows or {}
  for _, id in ipairs(ids) do mem.knows[id] = mem.knows[id] or C.Now() end
end

-- How many topics the player has picked up (not counting "ask anyone" or archived ones).
function Topics.Count()
  local n = 0
  for _, t in ipairs(Topics.Known(false)) do if not t.standard then n = n + 1 end end
  return n
end

-- Who the player first heard it from, as a name (nil when unknown).
function Topics.Source(id)
  local rec = ns.char.topics[id]
  local from = rec and rec.from
  if type(from) ~= "string" or from == "dev" then return nil end
  local mem = ns.char.npc[from]
  local def = ns.Data and ns.Data.npcs and ns.Data.npcs[from]
  return (mem and mem.name) or (def and def.name) or (not from:find("^id:") and (from:gsub("^name:", ""))) or nil
end

-- Has this NPC already been asked about this topic (in any conversation)?
function Topics.AskedOf(id, npcKey)
  local mem = npcKey and ns.char.npc[npcKey]
  return mem ~= nil and mem.topics ~= nil and mem.topics[id] ~= nil
end

function Topics.Teach(id)
  ns.char.topics[id] = ns.char.topics[id] or { t = C.Now(), from = "dev" }
end

function Topics.Forget(id)
  ns.char.topics[id] = nil
end

function Topics.Any()
  return next(ns.char.topics) ~= nil or #standardIds() > 0
end

---------------------------------------------------------------------------
-- Hearing topics in what people say
---------------------------------------------------------------------------
-- The words that name a topic: its keywords, plus its name without a leading "The " or
-- anything after a comma or a bracket. Too-short words are left out (they'd match
-- everywhere). Built once per set of topics.
local index, indexCount

local function addWord(list, id, word)
  word = word and word:gsub("^%s+", ""):gsub("%s+$", "")
  if not word or #word < Topics.MIN_KEYWORD then return end
  list[#list + 1] = { id = id, word = word:lower() }
end

local function buildIndex()
  local list, count = {}, 0
  for id, def in pairs(ns.Data.topics or {}) do
    count = count + 1
    if not def.standard and def.link ~= false then
      for _, w in ipairs(def.keywords or {}) do addWord(list, id, w) end
      -- linkName = false: the name is too ordinary a phrase ("The Collector"); keywords only.
      if def.linkName ~= false then
        local name = def.name or ""
        name = name:gsub("^[Tt]he ", ""):gsub("%s*[,(].*$", "")
        addWord(list, id, name)
      end
    end
  end
  -- Longest first, so "Siege of Farholde" wins over "Farholde".
  table.sort(list, function(a, b)
    if #a.word ~= #b.word then return #a.word > #b.word end
    return a.id < b.id
  end)
  index, indexCount = list, count
end

local function getIndex()
  local count = 0
  for _ in pairs(ns.Data.topics or {}) do count = count + 1 end
  if not index or count ~= indexCount then buildIndex() end
  return index
end
function Topics.ResetIndex() index = nil end

-- Letters and digits; an apostrophe is a boundary, so "Hogger's" still names Hogger.
local function isLetter(ch)
  return ch ~= "" and (ch:match("%w") ~= nil or ch:byte() >= 128)
end

-- Finds topic words in plain text. Returns a list of { id, s, e } (byte positions in the
-- text), at most one per topic, never overlapping, in text order. Skips text inside
-- |c...|r colour codes and |H...|h links already there.
function Topics.Find(text, exclude)
  local found, taken, seen = {}, {}, {}
  if type(text) ~= "string" or text == "" then return found end
  local lower = text:lower()
  -- Mark escape sequences as taken so nothing matches inside them.
  for s, e in lower:gmatch("()|[ch].-|[rh]()") do
    for i = s, e - 1 do taken[i] = true end
  end
  for _, k in ipairs(getIndex()) do
    if not seen[k.id] and k.id ~= exclude then
      local from = 1
      while true do
        local s, e = lower:find(k.word, from, true)
        if not s then break end
        local before, after = lower:sub(s - 1, s - 1), lower:sub(e + 1, e + 1)
        -- A plural "s" still counts: "kobolds" names the topic "Kobolds", "gnolls" names "Gnoll".
        local plural = after == "s" and not isLetter(lower:sub(e + 2, e + 2))
        local edge = s == 1 or not isLetter(before)
        local tail = not isLetter(after) or plural
        local free = true
        for i = s, e do if taken[i] then free = false; break end end
        if edge and tail and free then
          if plural then e = e + 1 end
          for i = s, e do taken[i] = true end
          found[#found + 1] = { id = k.id, s = s, e = e }
          seen[k.id] = true
          break
        end
        from = e + 1
      end
    end
  end
  table.sort(found, function(a, b) return a.s < b.s end)
  return found
end

-- The same text with each topic word wrapped in a clickable, coloured link.
function Topics.Link(text, found, hex)
  if not found or #found == 0 then return text end
  local out, pos = {}, 1
  for _, f in ipairs(found) do
    out[#out + 1] = text:sub(pos, f.s - 1)
    out[#out + 1] = ("|H%s%s|h%s%s|r|h"):format(Topics.LINK_PREFIX, f.id, hex or "", text:sub(f.s, f.e))
    pos = f.e + 1
  end
  out[#out + 1] = text:sub(pos)
  return table.concat(out)
end

function Topics.FromLink(link)
  if type(link) ~= "string" then return nil end
  return link:match("^" .. Topics.LINK_PREFIX .. "(.+)$")
end

-- Someone said this: learn the topics in it (hearing is how most topics arrive), and
-- return the text with them linked (when the setting is on). exclude: the topic being
-- asked about, which shouldn't link to itself.
function Topics.Hear(text, env, exclude, hex)
  local found = Topics.Find(text, exclude)
  local learn = {}
  for _, f in ipairs(found) do
    if not ns.char.topics[f.id] then learn[#learn + 1] = f.id end
  end
  if #learn > 0 then ns.Effects.Apply({ learn = learn }, env or { now = C.Now() }) end
  local on = not ns.db or ns.db.settings.topicLinks ~= false
  return on and Topics.Link(text, found, hex) or text, found
end

-- Topic names as a list, each a clickable link (or plain, with hex == false).
function Topics.LinkList(ids, hex)
  local parts = {}
  for _, id in ipairs(ids) do
    local def = ns.Data.topics[id]
    local name = def and def.name or id
    if hex == false then
      parts[#parts + 1] = name
    else
      parts[#parts + 1] = ("|H%s%s|h%s%s|r|h"):format(Topics.LINK_PREFIX, id, hex or "", name)
    end
  end
  return table.concat(parts, "\n")
end
