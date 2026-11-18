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

-- Any other quest turned in inside a town counts for that town too (0.84.0), just less
-- than the ones its file lists.
Towns.QUEST_DEFAULT = 3

local here

function Towns.OnQuestTurnedIn(questID)
  local listed = false
  for id, town in pairs(ns.Data.towns) do
    for _, entry in ipairs(town.quests or {}) do
      if questMatches(entry[1], questID) then
        listed = true
        ns.Effects.Standing(id, entry[2] or 5)
        ns.Debug("standing", id, "+", entry[2] or 5, "for quest", questID)
        Towns.Word(id, "helped", nil, C.Now())
      end
    end
  end
  if listed then return end
  local id = here and here()
  if id then
    ns.Effects.Standing(id, Towns.QUEST_DEFAULT)
    ns.Debug("standing", id, "+", Towns.QUEST_DEFAULT, "for unlisted quest", questID)
    Towns.Word(id, "helped", nil, C.Now())
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

---------------------------------------------------------------------------
-- Coming back (0.67.0): when you walk into a town after a day or more away, the town
-- remembers how long you were gone and what level you were when you left.
--   rec.visit  last time you were in the town (refreshed when you leave and at logout)
--   rec.vlvl   your level then
--   rec.back   { gap = seconds away, t = when you came back, lvl = level when you left }
---------------------------------------------------------------------------
Towns.RETURN_GAP = 86400         -- a day out of town counts as having been away
Towns.RETURN_FRESH = 4 * 3600    -- people notice for this long after you arrive

local function rec(id)
  local towns = ns.char.towns
  local r = towns[id]
  if not r then r = { value = 0 }; towns[id] = r end
  return r
end

function here()
  local zone, sub = C.Zone()
  if not ns.Data or zone == "" then return nil end
  return ns.Data.CommunityForPlace(zone, sub)
end

local loginPending = true
function Towns.Enter(id, now, level)
  local c = ns.char
  if not c then return end
  local cur = c.curTown
  if cur == id and not loginPending then return end
  local login = loginPending
  loginPending = false
  -- Leaving a town stamps it; at login PLAYER_LOGOUT already stamped it, and stamping it
  -- again would hide the time spent logged out.
  if cur and cur ~= id and not login then
    local r = rec(cur)
    r.visit, r.vlvl = now, level
  end
  c.curTown = id
  if not id then return end
  local r = rec(id)
  if r.visit and now - r.visit >= Towns.RETURN_GAP then
    r.back = { gap = now - r.visit, t = now, lvl = r.vlvl }
  elseif r.back and now - r.back.t > Towns.RETURN_FRESH then
    -- Only drop a stale return: a /reload or a step outside the gate keeps a fresh one.
    r.back = nil
  end
  r.visit, r.vlvl = now, level
end

local function track()
  -- Before the town data loads we can't tell where we are; wait rather than "leave".
  if not ns.char or not ns.Data or not next(ns.Data.towns) then return end
  Towns.Enter(here(), C.Now(), C.Level("player"))
end

-- The fresh return to a town, or nil: { days, levels, town }.
function Towns.Back(id, now, level)
  local r = id and ns.char.towns[id]
  local b = r and r.back
  if not b or (now - b.t) > Towns.RETURN_FRESH then return nil end
  return { days = b.gap / 86400, levels = (b.lvl and level) and (level - b.lvl) or nil, town = id }
end

-- "a week", "two months": how a person says how long you were gone.
function Towns.AwayWords(days)
  if not days then return "a while" end
  if days < 2 then return "a day or two" end
  if days < 6 then return "a few days" end
  if days < 11 then return "a week" end
  if days < 21 then return "a fortnight" end
  if days < 45 then return "a month" end
  if days < 75 then return "two months" end
  if days < 135 then return "a season" end
  if days < 300 then return "half a year" end
  if days < 400 then return "most of a year" end
  return "more than a year"
end

---------------------------------------------------------------------------
-- Word gets around (0.67.0): what you did with one person in a town, the rest of it hears.
-- rec.word[kind] = { t, npc, name, pooled, n }. Kinds: pleased, angered, persuaded,
-- intimidated, deceived, caughtLying, helped. Related towns hear it a day later.
---------------------------------------------------------------------------
Towns.WORD_DAYS = 14
Towns.WORD_DELAY = 86400
Towns.WORD_STANDING = { pleased = 2, angered = -2, persuaded = 1, intimidated = -2, caughtLying = -3 }
Towns.WORD_NOTE = { pleased = true, angered = true, intimidated = true, caughtLying = true }

function Towns.Word(id, kind, info, now)
  if not id or not kind then return end
  local r = rec(id)
  r.word = r.word or {}
  local prev = r.word[kind]
  local npc = info and (info.key or ("name:" .. tostring(info.name)))
  r.word[kind] = {
    t = now, n = ((prev and prev.n) or 0) + 1,
    npc = npc, name = info and info.name, pooled = info and info.pooled or nil,
  }
  -- The standing nudge counts once a day per person and kind, so repeating the same
  -- reply (or the same check) can't farm it. Quest turn-ins (no info) always count.
  local d = Towns.WORD_STANDING[kind]
  local repeat_ = npc and prev and prev.npc == npc and now - prev.t < 86400
  if d and not repeat_ then ns.Effects.Standing(id, d) end
end

-- What a reply did that a town would talk about (nil when nothing).
function Towns.WordKind(choice, checkResult, fx)
  local tag = choice and choice.tag
  if checkResult == true then
    if tag == "Intimidate" then return "intimidated" end
    if tag == "Persuade" then return "persuaded" end
    if tag == "Deceive" then return "deceived" end
  elseif checkResult == false and tag == "Deceive" then
    return "caughtLying"
  end
  local a = type(fx) == "table" and fx.affinity
  if a and a >= 2 then return "pleased" end
  if a and a <= -2 then return "angered" end
  return nil
end

-- The freshest word matching spec ({ kind, days, town, self }) for this NPC's town, or nil.
-- Word from a related town counts once a day has passed.
function Towns.FindWord(spec, env, now)
  if type(spec) ~= "table" or spec[1] then spec = { kind = spec } end
  local info = env and env.info
  local id = spec.town or (info and info.communities and info.communities[1])
  if not id then return nil end
  now = now or C.Now()
  local maxAge = (spec.days or Towns.WORD_DAYS) * 86400
  local me = info and (info.key or ("name:" .. tostring(info.name)))
  local kinds = U.AsList(spec.kind or { "pleased", "angered", "persuaded", "intimidated", "deceived", "caughtLying", "helped" })
  local best
  local function look(townId, delay)
    local r = ns.char.towns[townId]
    if not (r and r.word) then return end
    for _, k in ipairs(kinds) do
      local w = r.word[k]
      if w and now - w.t <= maxAge and now - w.t >= delay and (spec.self or w.npc ~= me) then
        if not best or w.t > best.t then best = { t = w.t, kind = k, name = w.name, pooled = w.pooled, n = w.n, town = townId } end
      end
    end
  end
  look(id, 0)
  local town = ns.Data and ns.Data.towns[id]
  if spec.near ~= false and town then
    for other, frac in pairs(town.related or {}) do
      if frac >= 0.1 then look(other, Towns.WORD_DELAY) end
    end
  end
  return best
end

-- How a person names whoever the word came from.
function Towns.SourceName(w)
  if not w or not w.name then return "someone" end
  if w.pooled then
    local n = tostring(w.name):lower()
    return (n:match("^[aeiou]") and "an " or "a ") .. n
  end
  return w.name
end

ns.Listen("QUEST_TURNED_IN", Towns.OnQuestTurnedIn)
ns.On("ZONE_CHANGED_NEW_AREA", track)
ns.On("ZONE_CHANGED", track)
ns.On("ZONE_CHANGED_INDOORS", track)
ns.On("PLAYER_LOGOUT", function()
  local c = ns.char
  if c and c.curTown then
    local r = rec(c.curTown)
    r.visit, r.vlvl = C.Now(), C.Level("player")
  end
end)
ns.OnLogin(function() C.After(3, track) end)
ns.OnLogin(function() Towns.Soften(C.Now()) end)
