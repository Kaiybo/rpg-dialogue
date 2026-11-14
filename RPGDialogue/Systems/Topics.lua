-- "Ask about..." topics the player has learned (Morrowind-style).
local _, ns = ...

local C = ns.Compat
local Topics = {}
ns.Topics = Topics

Topics.STALE_SECONDS = 30 * 86400

-- Known topics, most recently learned first. Each: { id, name, category, learned, asked, archived }
function Topics.Known(includeArchived)
  local out = {}
  local now = C.Now()
  for id, rec in pairs(ns.char.topics) do
    local def = ns.Data.topics[id]
    local last = math.max(rec.t or 0, rec.asked or 0)
    local archived = rec.archived or (now - last > Topics.STALE_SECONDS)
    if includeArchived or not archived then
      out[#out + 1] = {
        id = id, name = def and def.name or id, category = def and def.category or "other",
        learned = rec.t or 0, asked = rec.asked, archived = archived,
      }
    end
  end
  table.sort(out, function(a, b)
    if a.learned ~= b.learned then return a.learned > b.learned end
    return a.name < b.name
  end)
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

function Topics.Asked(id, npcKey)
  local rec = ns.char.topics[id]
  if rec then rec.asked = C.Now(); rec.archived = nil end
  local mem = npcKey and ns.char.npc[npcKey]
  if mem then mem.topics = mem.topics or {}; mem.topics[id] = C.Now() end
end

function Topics.Teach(id)
  ns.char.topics[id] = ns.char.topics[id] or { t = C.Now(), from = "dev" }
end

function Topics.Forget(id)
  ns.char.topics[id] = nil
end

function Topics.Any()
  return next(ns.char.topics) ~= nil
end

---------------------------------------------------------------------------
-- Morrowind-style topics in the text (0.26.0)
-- * Core topics every conversation offers: background, my trade, a little secret, latest
--   rumors, someplace nearby. Always known, always first in the list, never archived.
-- * A topic's keywords in what an NPC says become links: click one to ask about it.
--   Seeing a keyword teaches the topic, the way hearing a name in Vvardenfell did.
-- * What each NPC said about a topic is remembered for the journal.
---------------------------------------------------------------------------
Topics.CORE = { "background", "my_trade", "little_secret", "latest_rumors", "someplace_nearby" }
local CORE_SET = {}
for i, id in ipairs(Topics.CORE) do CORE_SET[id] = i end
function Topics.IsCore(id) return CORE_SET[id] ~= nil end

local baseKnown = Topics.Known
-- Known topics: the core ones first (when defined), then the learned ones, newest first.
function Topics.Known(includeArchived)
  local out = {}
  for _, id in ipairs(Topics.CORE) do
    local def = ns.Data.topics[id]
    if def then
      local rec = ns.char.topics[id] or {}
      out[#out + 1] = { id = id, name = def.name, category = def.category or "general", learned = 0,
                        asked = rec.asked, core = true }
    end
  end
  for _, t in ipairs(baseKnown(includeArchived)) do
    if not CORE_SET[t.id] then out[#out + 1] = t end
  end
  return out
end

function Topics.Any()
  for _, id in ipairs(Topics.CORE) do if ns.Data.topics[id] then return true end end
  return next(ns.char.topics) ~= nil
end

-- Keyword list: { lower = "defias", id = "defias", len = 6 }, longest first. A topic's
-- keywords are its own `keywords`, else its name without a leading "The ". Core topics
-- and topics marked `link = false` never link.
local kwCache, kwCount
local function keywords()
  local n = 0
  for _ in pairs(ns.Data.topics) do n = n + 1 end
  if kwCache and kwCount == n then return kwCache end
  local list = {}
  for id, def in pairs(ns.Data.topics) do
    if not CORE_SET[id] and def.link ~= false then
      local words = def.keywords
      if type(words) == "string" then words = { words } end
      if not words then words = { ((def.name or id):gsub("^[Tt]he ", "")) } end
      for _, w in ipairs(words) do
        if type(w) == "string" and #w >= 3 then list[#list + 1] = { lower = w:lower(), id = id, len = #w } end
      end
    end
  end
  table.sort(list, function(a, b)
    if a.len ~= b.len then return a.len > b.len end
    return a.lower < b.lower
  end)
  kwCache, kwCount = list, n
  return list
end
function Topics.ResetKeywords() kwCache = nil end

local function escapePattern(s) return (s:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%1")) end

-- Finds topic keywords in text (whole words, any case; the first mention of each topic).
-- Returns the text with links (when color is given), and the list of topic ids found.
-- Text that already holds escape codes (colors, links) is left as it is.
function Topics.Linkify(text, color)
  if type(text) ~= "string" or text == "" or text:find("|", 1, true) then return text, {} end
  local lower = text:lower()
  local taken, found, seen = {}, {}, {}
  for _, kw in ipairs(keywords()) do
    if not seen[kw.id] then
      -- Whole words only, but a possessive still counts: "Kurzen's men" links "Kurzen".
      local pat = "%f[%w']" .. escapePattern(kw.lower) .. "%f[^%w]"
      local s, e = lower:find(pat)
      while s do
        local clash = false
        for _, span in ipairs(taken) do
          if s <= span[2] and e >= span[1] then clash = true; break end
        end
        if not clash then
          taken[#taken + 1] = { s, e, kw.id }
          seen[kw.id] = true
          break
        end
        s, e = lower:find(pat, e + 1)
      end
    end
  end
  for _, span in ipairs(taken) do found[#found + 1] = span[3] end
  if not color or #taken == 0 then return text, found end
  table.sort(taken, function(a, b) return a[1] > b[1] end)
  local out = text
  for _, span in ipairs(taken) do
    local word = out:sub(span[1], span[2])
    out = out:sub(1, span[1] - 1) .. "|Hrpgdtopic:" .. span[3] .. "|h" .. color .. word .. "|r|h" .. out:sub(span[2] + 1)
  end
  return out, found
end

-- Text without our links or colors (for the typewriter, speech, and other addons' windows).
function Topics.Plain(text)
  if type(text) ~= "string" then return text end
  local out = text:gsub("|H[^|]*|h", ""):gsub("|h", ""):gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
  return out
end

-- Topics heard in what someone said: learn the ones not known yet. Returns the new ones.
function Topics.Hear(ids, who)
  local new = {}
  if ns.db and ns.db.settings.topicLinks == false then return new end
  for _, id in ipairs(ids or {}) do
    if ns.Data.topics[id] and not CORE_SET[id] and not ns.char.topics[id] then
      ns.char.topics[id] = { t = C.Now(), from = who, heard = true }
      new[#new + 1] = id
      ns.Fire("TOPIC_LEARNED", id)
    end
  end
  return new
end

-- What an NPC said about a topic, for the journal (their latest answer only).
Topics.MAX_SAID = 8
Topics.MAX_TEXT = 400
function Topics.Record(id, who, name, gid, text)
  if not who or not gid then return end
  local rec = ns.char.topics[id]
  if not rec then
    if not CORE_SET[id] then return end
    rec = { t = 0 }
    ns.char.topics[id] = rec
  end
  rec.said = rec.said or {}
  if type(text) == "string" then text = Topics.Plain(text):sub(1, Topics.MAX_TEXT) else text = nil end
  rec.said[who] = { gid = gid, name = name, t = C.Now(), text = text }
  local n, oldest, oldestT = 0, nil, math.huge
  for k, v in pairs(rec.said) do
    n = n + 1
    if v.t < oldestT then oldest, oldestT = k, v.t end
  end
  if n > Topics.MAX_SAID and oldest then rec.said[oldest] = nil end
end
