-- Town standing: each town's own opinion of the player (addon-only; it never changes prices
-- or how guards really behave). Moves with conversations (fx.standing), quests done for
-- the town, caught lies and thread endings; spreads a little to related towns; long
-- absences soften the extremes, but a town never forgets completely.
local _, ns = ...

local C = ns.Compat
local U = ns.Util
local Towns = {}
ns.Towns = Towns

Towns.SOFTEN_FLOOR = 30          -- extremes soften toward ±30, never past it
Towns.SOFTEN_PER_WEEK = 2

-- Quest refs in a town's quest list: { { questRef, amount }, ... }
local function questMatches(ref, questID)
  if ref == questID then return true end
  if U.IsTodo(ref) and ns.Capture then return ns.Capture.QuestIDByTitle(ref.name) == questID end
  return false
end

function Towns.OnQuestTurnedIn(questID)
  for id, town in pairs(ns.Data.towns) do
    for _, entry in ipairs(town.quests or {}) do
      if questMatches(entry[1], questID) then
        ns.Effects.Standing(id, entry[2] or 5)
        ns.Debug("standing", id, "+", entry[2] or 5, "for quest", questID)
      end
    end
  end
end

-- A lie the player told got caught: the town where it was told thinks less of them.
function Towns.LieCaught(town, amount)
  if town then ns.Effects.Standing(town, -(amount or 8)) end
end

function Towns.Soften(now)
  for _, rec in pairs(ns.char.towns) do
    local weeks = math.floor((now - (rec.softenedAt or rec.t or now)) / 604800)
    if weeks > 0 then
      local v = rec.value or 0
      local step = weeks * Towns.SOFTEN_PER_WEEK
      if v > Towns.SOFTEN_FLOOR then rec.value = math.max(Towns.SOFTEN_FLOOR, v - step)
      elseif v < -Towns.SOFTEN_FLOOR then rec.value = math.min(-Towns.SOFTEN_FLOOR, v + step) end
      rec.softenedAt = now
    end
  end
end

-- Tier name for display, flavored per town ("Hero of Goldshire").
function Towns.TierName(id)
  local rec = ns.char.towns[id]
  local tier = ns.Effects.TierName(rec and rec.value or 0)
  local town = ns.Data.towns[id]
  return (town and town.tiers and town.tiers[tier]) or tier
end

ns.Listen("QUEST_TURNED_IN", Towns.OnQuestTurnedIn)
ns.OnLogin(function() Towns.Soften(C.Now()) end)
