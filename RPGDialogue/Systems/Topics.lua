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
