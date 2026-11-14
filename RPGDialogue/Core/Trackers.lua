-- Things the addon records itself because the game doesn't keep them for us:
-- quest turn-ins with timestamps, deaths, deeds, books read, home inn, drunkenness, zones.
local _, ns = ...

local C = ns.Compat
local W = ns.World
local T = {}
ns.Trackers = T

local function char() return ns.char end

---------------------------------------------------------------------------
-- Deeds
---------------------------------------------------------------------------
function T.Deed(id, data)
  local deeds = char().deeds
  local d = deeds[id]
  if not d then
    d = { t = C.Now(), n = 0 }
    deeds[id] = d
    ns.Fire("DEED", id, d, data)
  end
  d.n = d.n + 1
  d.last = C.Now()
  return d
end

---------------------------------------------------------------------------
-- Quests
---------------------------------------------------------------------------
ns.On("QUEST_ACCEPTED", function(_, a, b)
  local questID = b or a
  if type(questID) ~= "number" then return end
  char().quests.accepted[questID] = C.Now()
  ns.Fire("QUEST_ACCEPTED", questID)
end)

ns.On("QUEST_TURNED_IN", function(_, questID)
  if type(questID) ~= "number" then return end
  char().quests.turnedIn[questID] = C.Now()
  ns.Fire("QUEST_TURNED_IN", questID)
end)

---------------------------------------------------------------------------
-- Deaths. The combat log is closed to addons in Forever (DESIGN.md R3), so the
-- cause is inferred: breath/fatigue timers, then what you were fighting.
---------------------------------------------------------------------------
local mirror = {}   -- timerName -> { value, max, started }

ns.On("MIRROR_TIMER_START", function(_, name, value, maxValue)
  mirror[name] = { value = value, max = maxValue, started = C.Clock() }
end)

ns.On("MIRROR_TIMER_STOP", function(_, name)
  local m = mirror[name]
  if m then m.stopped = C.Clock() end
end)

local function timerRanOut(name)
  local m = mirror[name]
  if not m then return false end
  if m.stopped then return C.Clock() - m.stopped < 2 end
  return true
end

local function killerSnapshot()
  for _, unit in ipairs({ "target", "mouseover" }) do
    if C.Exists(unit) and not C.IsFriendly(unit) then
      return {
        name = C.Name(unit),
        level = C.Level(unit),
        elite = C.Classification(unit),
        isPlayer = C.IsPlayer(unit),
        npcID = C.NPCID(C.GUID(unit)),
      }
    end
  end
  return nil
end

function T.InferCause(killer, playerLevel, drowning, fatigue)
  if drowning then return "drowning" end
  if fatigue then return "fatigue" end
  if not killer then return "unknown" end
  if killer.isPlayer then return "player" end
  local lname = (killer.name or ""):lower()
  for _, pat in ipairs(W.NAME_ROLES) do
    if pat[2] == "guard" and lname:find(pat[1]) then return "guard" end
  end
  if killer.elite == "worldboss" then return "boss" end
  local lvl = killer.level
  if lvl and lvl > 0 and playerLevel and lvl <= playerLevel - 10 then return "trivial" end
  if killer.elite == "elite" or killer.elite == "rareelite" then return "elite" end
  return "creature"
end

ns.On("PLAYER_DEAD", function()
  local c = char()
  local zone, sub = C.Zone()
  local mapID, x, y = C.MapPosition()
  local killer = killerSnapshot()
  local level = C.Level("player")
  local inInstance = C.InInstance()
  local entry = {
    t = C.Now(), zone = zone, subzone = sub, mapID = mapID, x = x, y = y, level = level,
    killer = killer, instance = inInstance or nil,
    cause = T.InferCause(killer, level, timerRanOut("BREATH"), timerRanOut("EXHAUSTION")),
  }
  c.deaths[#c.deaths + 1] = entry
  c.deathCount = (c.deathCount or 0) + 1
  if c.deathCount == 1 then T.Deed("first_death") end
  mirror = {}
  ns.Fire("PLAYER_DIED", entry)
end)

-- Kills by you or your party (Midnight added PARTY_KILL; missing on some clients).
ns.On("PARTY_KILL", function(_, _, targetGUID)
  if C.IsSecret(targetGUID) then return end
  local id = C.NPCID(targetGUID)
  if id then T.Deed("kill:" .. id) end
end)

---------------------------------------------------------------------------
-- Levels, zones, dungeons
---------------------------------------------------------------------------
ns.On("PLAYER_LEVEL_UP", function(_, level)
  level = tonumber(level)
  if level and level % 10 == 0 then T.Deed("level:" .. level) end
end)

local function zoneChanged()
  local c = char()
  if not c then return end
  local zone, sub = C.Zone()
  if zone ~= "" and not c.zones[zone] then
    c.zones[zone] = C.Now()
    T.Deed("zone:" .. zone)
  end
  local inInstance, kind = C.InInstance()
  if inInstance and (kind == "party" or kind == "raid") and zone ~= "" then
    T.Deed("dungeon:" .. zone)
  end
  if sub ~= "" then
    c.places = c.places or {}
    c.places[sub] = c.places[sub] or C.Now()
    ns.Fire("PLACE_VISITED", sub)
  end
  -- Home inn visits (at most one per hour)
  local home = c.homeInn
  if home and sub ~= "" and sub == home.name then
    local now = C.Now()
    if not home.lastVisit or now - home.lastVisit > 3600 then
      home.visits = (home.visits or 0) + 1
      home.lastVisit = now
    end
  end
end

ns.On("ZONE_CHANGED_NEW_AREA", zoneChanged)
ns.On("ZONE_CHANGED", zoneChanged)

---------------------------------------------------------------------------
-- Home inn (hearthstone)
---------------------------------------------------------------------------
local function checkBind()
  local c = char()
  if not c then return end
  local loc = C.BindLocation()
  if not loc then return end
  if not c.homeInn or c.homeInn.name ~= loc then
    local previous = c.homeInn and c.homeInn.name
    c.homeInn = { name = loc, since = C.Now(), visits = 0, previous = previous }
    if previous then ns.Fire("HOME_INN_CHANGED", loc, previous) end
  end
end

---------------------------------------------------------------------------
-- System messages: drunk state, hearth changes. Chat may be secret inside
-- instances (Midnight), in which case we simply don't learn anything there.
---------------------------------------------------------------------------
local DRUNK_KEYS = { "DRUNK_MESSAGE_SELF1", "DRUNK_MESSAGE_SELF2", "DRUNK_MESSAGE_SELF3", "DRUNK_MESSAGE_SELF4" }

function T.DrunkLevelFor(msg)
  for i = 1, #DRUNK_KEYS do
    local s = C.GlobalString(DRUNK_KEYS[i])
    if s and s == msg then return i - 1 end
  end
  return nil
end

ns.On("CHAT_MSG_SYSTEM", function(_, msg)
  if type(msg) ~= "string" or C.IsSecret(msg) then return end
  local level = T.DrunkLevelFor(msg)
  if level then
    local c = char()
    c.drunk = level
    c.drunkAt = C.Now()
    return
  end
  checkBind()
end)

---------------------------------------------------------------------------
-- Books
---------------------------------------------------------------------------
ns.On("ITEM_TEXT_BEGIN", function()
  local title = C.BookTitle()
  if not title then return end
  local books = char().books
  local b = books[title]
  if not b then
    b = { t = C.Now(), n = 0 }
    books[title] = b
    ns.Fire("BOOK_READ", title)
  end
  b.n = b.n + 1
end)

ns.OnLogin(function()
  checkBind()
  zoneChanged()
  C.RequestCalendar()
end)
ns.On("PLAYER_ENTERING_WORLD", function() checkBind() end)
