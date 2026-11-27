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
  -- Still running: it has run out only once its time (value, in ms) has passed. Killed by a
  -- murloc with breath to spare is not drowning.
  if type(m.value) == "number" and type(m.started) == "number" then
    return C.Clock() - m.started >= m.value / 1000 - 1
  end
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

-- Kills by you or your party: a deed per creature ID, plus a tally by creature name
-- (char.kills.byName) for the `killed` condition. Creatures only, never players.
-- Kills already counted this session, by GUID (or name when the GUID is missing), so the
-- combat log and the target-watch fallback below never count one body twice.
local counted, countedN = {}, 0
function T.Kill(guid, name)
  if C.IsSecret(guid) then return end
  local id = C.NPCID(guid)
  if not id then return end
  if counted[guid] then return end
  countedN = countedN + 1
  if countedN > 500 then counted, countedN = {}, 1 end
  counted[guid] = true
  local d = T.Deed("kill:" .. id)
  if type(name) == "string" and name ~= "" and not C.IsSecret(name) then d.name = name end
  local k = char().kills
  k.total = (k.total or 0) + 1
  if type(name) == "string" and name ~= "" and not C.IsSecret(name) then
    k.byName[name] = (k.byName[name] or 0) + 1
    T.BossDown(name)
  end
end

-- A dungeon's last boss is down: deed "cleared:<place>" (journal + diary). Idempotent.
function T.BossDown(name)
  for place, bosses in pairs(W.DUNGEON_BOSSES or {}) do
    for i = 1, #bosses do
      if bosses[i] == name then
        if not char().deeds["cleared:" .. place] then T.Deed("cleared:" .. place) end
        break
      end
    end
  end
end

-- 0.72.0: dungeon entries used to count every room change inside; start the count over.
ns.OnLogin(function()
  local c = ns.char
  if not c or c.deedsFix72 then return end
  for id, d in pairs(c.deeds or {}) do
    if id:find("^dungeon:") and type(d) == "table" then d.n = 1 end
  end
  c.deedsFix72 = true
end)

-- Kills from before 0.58.0 (tallied by name since 0.54.0) get their journal deed too.
ns.OnLogin(function()
  local c = ns.char
  if not (c and c.kills and c.kills.byName) then return end
  for name, n in pairs(c.kills.byName) do
    if (n or 0) > 0 then T.BossDown(name) end
  end
end)

-- Classic clients report kills through the combat log (subevent PARTY_KILL); Midnight
-- closed the combat log and added a PARTY_KILL event instead (no name).
local getCombatInfo = _G.CombatLogGetCurrentEventInfo

-- Who struck the last blow on an NPC (0.105.2), so a corpse can show how they died. Session
-- only, never saved: bodies don't outlast a logout. lastHit holds the latest damage to each
-- creature; slain keeps it when they die. Both are trimmed so a long session stays small.
T.lastHit, T.slain = {}, {}
local hitCount, slainCount = 0, 0
local band = _G.bit and _G.bit.band
local MINE, PARTY_OR_RAID, IS_PLAYER = 0x1, 0x6, 0x400
local function whoStruck(sourceGUID, sourceFlags)
  if sourceGUID and sourceGUID == C.GUID("player") then return "you" end
  if band and type(sourceFlags) == "number" then
    if band(sourceFlags, MINE) ~= 0 then return "you" end
    if band(sourceFlags, PARTY_OR_RAID) ~= 0 then return "party" end
    if band(sourceFlags, IS_PLAYER) ~= 0 then return "player" end
  end
  return "npc"
end
local function noteHit(sub, sourceGUID, sourceName, sourceFlags, destGUID, spellName)
  if type(destGUID) ~= "string" or not destGUID:find("^Creature") then return end
  local blow
  if sub == "SWING_DAMAGE" then blow = false
  elseif sub == "ENVIRONMENTAL_DAMAGE" then blow = false; sourceName = nil
  else blow = type(spellName) == "string" and spellName or false end
  if not T.lastHit[destGUID] then
    hitCount = hitCount + 1
    if hitCount > 300 then T.lastHit, hitCount = {}, 1 end
  end
  T.lastHit[destGUID] = { by = whoStruck(sourceGUID, sourceFlags), name = sourceName or false, blow = blow }
end
local DAMAGE = { SWING_DAMAGE = true, RANGE_DAMAGE = true, SPELL_DAMAGE = true, SPELL_PERIODIC_DAMAGE = true,
  DAMAGE_SHIELD = true, ENVIRONMENTAL_DAMAGE = true }

local function onCombatLog(_, ...)
  local sub, destGUID, destName, sourceGUID, sourceName, sourceFlags, spellName
  if getCombatInfo then
    local _, s, _, sg, sn, sf, _, dg, dn, _, _, _, spn = getCombatInfo()
    sub, destGUID, destName, sourceGUID, sourceName, sourceFlags, spellName = s, dg, dn, sg, sn, sf, spn
  else
    local _, s, _, sg, sn, sf, _, dg, dn, _, _, _, spn = ...
    sub, destGUID, destName, sourceGUID, sourceName, sourceFlags, spellName = s, dg, dn, sg, sn, sf, spn
  end
  if DAMAGE[sub] then
    noteHit(sub, sourceGUID, sourceName, sourceFlags, destGUID, spellName)
  elseif (sub == "UNIT_DIED" or sub == "PARTY_KILL") and type(destGUID) == "string" and T.lastHit[destGUID] then
    if not T.slain[destGUID] then
      slainCount = slainCount + 1
      if slainCount > 200 then T.slain, slainCount = {}, 1 end
    end
    T.slain[destGUID] = T.lastHit[destGUID]
  end
  if sub == "PARTY_KILL" then
    T.Kill(destGUID, destName)
  elseif sub == "UNIT_DIED" and type(destName) == "string" and C.InInstance() then
    -- The killing blow went to a pet, a totem, a raid member outside your party or the
    -- fight itself: if you were there when the boss fell, it still counts.
    if not C.IsSecret(destName) then T.BossDown(destName) end
  end
end
if not ns.On("COMBAT_LOG_EVENT_UNFILTERED", onCombatLog) then
  ns.On("PARTY_KILL", function(_, _, targetGUID) T.Kill(targetGUID) end)
end

-- Fallback for clients whose combat log stays closed or silent (Forever): watch the target.
-- A creature seen alive and tapped by you (or your group) that then reads as dead counts as
-- your kill. Only bodies first seen alive count, so clicking an old corpse never does.
-- T.Kill dedupes by GUID against the combat-log path.
local engaged, engagedN = {}, 0
local function watchUnit(unit, healthEvent)
  if not C.Exists(unit) or C.IsPlayer(unit) then return end
  local guid = C.GUID(unit)
  if type(guid) ~= "string" or C.IsSecret(guid) or not guid:find("^Creature") then return end
  if C.UnitDead(unit) then
    -- Health just hit zero on a body tapped by you (a one-shot never shows it alive).
    local tappedNow = healthEvent and _G.UnitIsTappedByPlayer and _G.UnitIsTappedByPlayer(unit)
    if engaged[guid] or tappedNow then
      engaged[guid] = nil
      if not counted[guid] then T.Kill(guid, C.Name(unit)) end
    end
  else
    local tapped = _G.UnitIsTappedByPlayer and _G.UnitIsTappedByPlayer(unit)
    if tapped or (_G.UnitAffectingCombat and _G.UnitAffectingCombat(unit) and T.lastHit[guid]
        and T.lastHit[guid].by ~= "npc") then
      if not engaged[guid] then
        engagedN = engagedN + 1
        if engagedN > 300 then engaged, engagedN = {}, 1 end
      end
      engaged[guid] = true
    end
  end
end
ns.On("PLAYER_TARGET_CHANGED", function() watchUnit("target") end)
ns.On("UNIT_HEALTH", function(_, unit)
  if unit == "target" or (type(unit) == "string" and unit:find("^party%dtarget$")) then watchUnit(unit, true) end
end)
ns.On("UNIT_FLAGS", function(_, unit) if unit == "target" then watchUnit(unit) end end)

---------------------------------------------------------------------------
-- Levels, zones, dungeons
---------------------------------------------------------------------------
ns.On("PLAYER_LEVEL_UP", function(_, level)
  level = tonumber(level)
  if level and level % 10 == 0 then T.Deed("level:" .. level) end
end)

-- Is this name a zone or city, not a room or a subzone? True when the map agrees, when it's a
-- known zone or capital, or when it was never seen as a subzone.
function T.IsLand(name)
  if not name or name == "" then return false end
  if W.ZONE_LEVELS and W.ZONE_LEVELS[name] then return true end
  if W.CAPITALS and W.CAPITALS[name] then return true end
  local mapZone = C.MapZone and C.MapZone()
  if mapZone and mapZone == name then return true end
  local c = char()
  if mapZone and mapZone ~= name then return false end
  return not (c and c.places and c.places[name])
end

local function zoneChanged()
  local c = char()
  if not c then return end
  local zone, sub = C.Zone()
  local inInstance, kind = C.InInstance()
  local dungeon = inInstance and (kind == "party" or kind == "raid") and zone ~= ""
  if zone ~= "" and not c.zones[zone] then
    c.zones[zone] = C.Now()
    -- A first-visit deed only for a real zone: indoor rooms can report themselves as the zone.
    if T.IsLand(zone) or dungeon then T.Deed("zone:" .. zone) end
  end
  -- One entry per trip in, not one per room change inside (0.72.0).
  if dungeon then
    if c.inDungeon ~= zone then
      c.inDungeon = zone
      T.Deed("dungeon:" .. zone)
    end
  elseif not inInstance then
    c.inDungeon = nil
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
-- Walking into a building (an inn, a town hall) changes the subzone with this event only:
-- without it, home-inn visits and errands that send you indoors were never noticed.
ns.On("ZONE_CHANGED_INDOORS", zoneChanged)

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
