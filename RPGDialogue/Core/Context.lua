-- The context snapshot (ctx): everything detectable about the player, the NPC and the
-- world when a conversation opens. Conditions read ctx, never the live API, which makes
-- them testable and spoofable.
--
-- Fields are lazy: each is computed through Compat the first time a condition reads it,
-- then cached for the rest of the conversation. Spoofed values are set up front and
-- therefore win.
local _, ns = ...

local C = ns.Compat
local W = ns.World
local U = ns.Util

local Ctx = {}
ns.Context = Ctx

local B = {}   -- builders: key -> function(ctx) return value end
Ctx.builders = B

---------------------------------------------------------------------------
-- Player
---------------------------------------------------------------------------
B.name = function() return C.Name("player") end
B.race = function() local _, file = C.Race("player"); return file end
B.raceName = function() return (C.Race("player")) end
B.class = function() local _, file = C.Class("player"); return file end
B.className = function() return (C.Class("player")) end
B.gender = function() return C.Sex("player") end
B.level = function() return C.Level("player") or 1 end
B.faction = function() return C.Faction("player") end
B.guild = function() return (C.Guild()) end
B.guildRank = function() local _, rank = C.Guild(); return rank end
B.money = function() return C.Money() end
B.title = function() return C.TitleText() end
B.hardcore = function() return C.IsHardcore() end
B.pvpRank = function() return (C.PvPRank()) end
B.pvpRankName = function() local _, n = C.PvPRank(); return n end
B.pvpFlagged = function() return C.PvPFlagged() end
-- Talents (0.97.0): spec = { tree = 1..3, name = English tree name, points = n }
-- for your deepest tree (nil with no points), talentPoints = { n1, n2, n3 }.
-- Spoof: /rpgd spoof spec=Fire:31 (or spec=2:31).
B.talentPoints = function()
  local t, out = ns.Compat.Talents and ns.Compat.Talents() or {}, {}
  for i = 1, 3 do out[i] = t[i] and t[i].points or 0 end
  return out
end
B.spec = function(ctx)
  local pts, best = ctx.talentPoints, nil
  for i = 1, 3 do if pts[i] > 0 and (not best or pts[i] > pts[best]) then best = i end end
  if not best then return nil end
  local names = ns.Conditions.SPEC_TREES[ctx.class or ""] or {}
  return { tree = best, name = names[best], points = pts[best] }
end
B.honorKills = function() local hk = C.PvPLifetime(); return hk end
B.dishonorKills = function() local _, dk = C.PvPLifetime(); return dk end

B.band = function(ctx)
  local lvl = ctx.level
  for _, b in ipairs(W.LEVEL_BANDS) do
    if lvl >= b.min and lvl <= b.max then return b.name end
  end
  return lvl > 60 and "Champion" or "Greenhorn"
end

B.professions = function()
  local out = {}
  for _, p in ipairs(C.Professions()) do out[p.name] = p.skill end
  return out
end

B.equipped = function()
  local set = {}
  for _, id in pairs(C.Equipped()) do set[id] = true end
  return set
end
B.tabard = function() return C.Equipped()[19] end
B.durability = function() local d = C.Durability(); return d end
B.nearlyNaked = function() return C.ArmorPiecesWorn() <= 2 end

---------------------------------------------------------------------------
-- NPC (unit token set in ctx.unit, usually "npc" or "target")
---------------------------------------------------------------------------
B.npcGUID = function(ctx) return ctx.unit and C.GUID(ctx.unit) end
B.npcID = function(ctx) return C.NPCID(ctx.npcGUID) end
B.npcName = function(ctx) return ctx.unit and C.Name(ctx.unit) end
B.npcLevel = function(ctx) return ctx.unit and C.Level(ctx.unit) end
-- 0.90.0: the unit's creature family ("Imp", "Voidwalker"...), and whether it is your own pet.
B.npcFamily = function(ctx) return ctx.unit and C.Family(ctx.unit) or false end
-- The NPC's race file token ("Dwarf", "Goblin"...) when UnitRace answers for it, else false.
B.npcRace = function(ctx)
  if not ctx.unit then return false end
  local name, file = C.Race(ctx.unit)
  return file or name or false
end
-- The localized race name with spaces stripped ("Night Elf" -> "NightElf"), else false.
B.npcRaceName = function(ctx)
  if not ctx.unit then return false end
  local name = C.Race(ctx.unit)
  return type(name) == "string" and (name:gsub("%s", "")) or false
end
B.npcMine = function(ctx)
  if not ctx.unit or not C.Exists("pet") then return false end
  local g = C.GUID(ctx.unit)
  return g ~= nil and g == C.GUID("pet")
end
B.npcGender = function(ctx) return ctx.unit and C.Sex(ctx.unit) end
-- 0.105.2: how a dead NPC died, if you saw it in the combat log: slain = "you" (you or your
-- pet), "party", "player" or "npc"; slayer = their name; blow = the spell (false for a swing).
B.npcType = function(ctx) return ctx.unit and C.CreatureType(ctx.unit) or false end
local function slainRec(ctx)
  local g = ctx.npcGUID
  return g and ns.Trackers and ns.Trackers.slain and ns.Trackers.slain[g] or nil
end
B.slain = function(ctx) local r = slainRec(ctx); return r and r.by or false end
B.slayer = function(ctx) local r = slainRec(ctx); return r and r.name or false end
B.blow = function(ctx) local r = slainRec(ctx); return r and r.blow or false end
B.npcElite = function(ctx)
  local c = ctx.unit and C.Classification(ctx.unit)
  return c == "elite" or c == "rareelite" or c == "worldboss"
end
B.npcReaction = function(ctx) return ctx.unit and C.Reaction(ctx.unit) end
B.npcSubtitle = function(ctx)
  if not ctx.unit then return nil end
  local lines = C.TooltipLines(ctx.unit)
  local line = lines[2]
  if not line or line:find("^Level") then return nil end
  return (line:gsub("^<", ""):gsub(">$", ""))
end

-- Relative power: "far_below" | "below" | "even" | "above" | "far_above" (player vs NPC).
function Ctx.PowerBucket(playerLevel, npcLevel, npcElite)
  if type(npcLevel) ~= "number" then return "even" end           -- no NPC (or unknown)
  if npcLevel <= 0 then return "far_below" end                    -- skull: far stronger
  local diff = playerLevel - npcLevel
  local steps = { "far_below", "below", "even", "above", "far_above" }
  local i
  if diff <= -10 then i = 1 elseif diff <= -4 then i = 2 elseif diff <= 3 then i = 3
  elseif diff <= 9 then i = 4 else i = 5 end
  if npcElite and i > 1 then i = i - 1 end
  return steps[i]
end

B.levelDiff = function(ctx) return ctx.level - (ctx.npcLevel or ctx.level) end
B.power = function(ctx) return Ctx.PowerBucket(ctx.level, ctx.npcLevel, ctx.npcElite) end

---------------------------------------------------------------------------
-- World
---------------------------------------------------------------------------
local function zoneInfo(ctx)
  if ctx._zone == nil then
    local zone, sub, mapID = C.Zone()
    rawset(ctx, "_zone", { zone, sub, mapID })
  end
  return ctx._zone
end
B.zone = function(ctx) return zoneInfo(ctx)[1] end
B.subzone = function(ctx) return zoneInfo(ctx)[2] end
B.mapID = function(ctx) return zoneInfo(ctx)[3] end
B.capital = function(ctx) return W.CAPITALS[ctx.zone] ~= nil end
B.resting = function() return C.IsResting() end
B.atInn = function(ctx) return ctx.resting and not ctx.capital end
B.inInstance = function() return (C.InInstance()) end
B.hour = function() return (C.GameTime()) end

function Ctx.TimeOfDay(hour)
  if hour >= 5 and hour <= 7 then return "dawn" end
  if hour >= 8 and hour <= 17 then return "day" end
  if hour >= 18 and hour <= 20 then return "dusk" end
  return "night"
end
B.tod = function(ctx) return Ctx.TimeOfDay(ctx.hour) end

local function inRange(month, day, from, to)
  local v, a, b = month * 100 + day, from[1] * 100 + from[2], to[1] * 100 + to[2]
  if a <= b then return v >= a and v <= b end
  return v >= a or v <= b   -- wraps the new year
end

-- Easter Sunday (Gregorian, anonymous algorithm) -> month, day.
local function easter(y)
  local a, b, c = y % 19, math.floor(y / 100), y % 100
  local d, e = math.floor(b / 4), b % 4
  local f = math.floor((b + 8) / 25)
  local g = math.floor((b - f + 1) / 3)
  local h = (19 * a + b - d - g + 15) % 30
  local i, k = math.floor(c / 4), c % 4
  local l = (32 + 2 * e + 2 * i - h - k) % 7
  local m = math.floor((a + 11 * h + 22 * l) / 451)
  local month = math.floor((h + l - 7 * m + 114) / 31)
  return month, (h + l - 7 * m + 114) % 31 + 1
end

function Ctx.FallbackHolidays(date)
  local out = {}
  -- Noblegarden: the week ending on Easter Sunday, through the Monday after.
  if date.year and date.month and date.day then
    local em, ed = easter(date.year)
    -- Easter is always in March or April, so a day count from 1 March is enough.
    local function dayNum(mo, dd) return (mo == 3 and 0) or (mo == 4 and 31) or (mo == 5 and 61) or -999, dd end
    local base = dayNum(date.month)
    if base > -999 then
      local t, te = base + date.day, dayNum(em) + ed
      if t >= te - 6 and t <= te + 1 then out.noblegarden = true end
    end
  end
  for _, h in ipairs(W.HOLIDAYS) do
    if inRange(date.month, date.day, h.from, h.to) then out[h.id] = true end
  end
  return out
end

B.holiday = function()
  local set = {}
  local titles = C.HolidaysToday()
  for _, title in ipairs(titles) do
    local id = W.HOLIDAY_TITLES[title]
    if id then set[id] = true end
  end
  if #titles == 0 then set = Ctx.FallbackHolidays(C.Date()) end
  return set
end

---------------------------------------------------------------------------
-- State
---------------------------------------------------------------------------
B.form = function() return W.FormName(C.FormID()) end
B.mounted = function() return C.IsMounted() end
B.stealthed = function() return C.IsStealthed() end
B.ghost = function() return C.IsGhost() end
B.pet = function() return C.Pet() or false end

local function scanAuras(ctx)
  if ctx._auras == nil then
    local buffs, debuffTypes = {}, {}
    C.ForEachAura("player", "HELPFUL", function(a) if a.spellId then buffs[a.spellId] = true end end)
    C.ForEachAura("player", "HARMFUL", function(a)
      if a.spellId then buffs[a.spellId] = true end
      if a.dispel then debuffTypes[a.dispel] = true end
    end)
    rawset(ctx, "_auras", { buffs, debuffTypes })
  end
  return ctx._auras
end
B.auras = function(ctx) return scanAuras(ctx)[1] end
B.debuffTypes = function(ctx) return scanAuras(ctx)[2] end
B.resSick = function(ctx) return ctx.auras[W.SPELLS.resurrectionSickness] == true end
B.camping = function(ctx) return W.SPELLS.camping ~= nil and ctx.auras[W.SPELLS.camping] == true end

B.drunk = function()
  local c = ns.char
  if not c or not c.drunkAt then return 0 end
  if C.Now() - c.drunkAt > 900 then return 0 end   -- sober after 15 min without news
  return c.drunk or 0
end

B.party = function() return C.Party() end

---------------------------------------------------------------------------
-- Out of place
---------------------------------------------------------------------------
B.outOfPlace = function(ctx)
  local set = {}
  local homes = W.HOMELANDS[ctx.race or ""]
  if homes and ctx.zone and ctx.zone ~= "" and not U.Contains(homes, ctx.zone) then set.far = true end
  local range = W.ZONE_LEVELS[ctx.zone or ""]
  if range then
    if ctx.level < range[1] - 2 then set.under = true end
    if ctx.level > range[2] + 5 then set.over = true end
  end
  return set
end

---------------------------------------------------------------------------
-- Construction
---------------------------------------------------------------------------
local mt = {
  __index = function(ctx, key)
    local build = B[key]
    if not build then return nil end
    local v = build(ctx)
    if v == nil then v = false end   -- cache "unknown" too, so we don't ask again
    rawset(ctx, key, v)
    return v
  end,
}

-- The order /rpgd dump ctx prints fields in.
Ctx.DUMP_ORDER = {
  "name", "race", "class", "gender", "level", "band", "faction", "guild", "guildRank", "title",
  "money", "durability", "nearlyNaked", "tabard", "hardcore",
  "spec", "talentPoints", "pvpRank", "pvpRankName", "pvpFlagged", "honorKills", "dishonorKills",
  "npcName", "npcID", "npcFamily", "npcRace", "npcMine", "npcLevel", "npcGender", "npcElite", "npcReaction", "npcSubtitle", "power", "levelDiff",
  "zone", "subzone", "mapID", "capital", "resting", "atInn", "inInstance", "hour", "tod", "holiday",
  "party", "form", "mounted", "stealthed", "ghost", "pet", "debuffTypes", "resSick", "camping", "drunk", "outOfPlace",
}

-- opts: { unit = "npc", spoof = { key = value } }
function Ctx.New(opts)
  opts = opts or {}
  local ctx = setmetatable({ unit = opts.unit, spoofed = {}, questSpoof = {} }, mt)
  local spoof = opts.spoof or (ns.Spoof and ns.Spoof.values) or {}
  for k, v in pairs(spoof) do
    if k == "quest" then
      for id, state in pairs(v) do ctx.questSpoof[id] = state end
    elseif B[k] then
      rawset(ctx, k, v)
      ctx.spoofed[k] = true
    else
      ctx.spoofed[k] = v   -- history-type overrides read by Conditions
    end
  end
  return ctx
end

-- Re-reads live fields after an event (live reactions). keys: list of builder names.
function Ctx.Refresh(ctx, keys)
  for _, k in ipairs(keys) do
    if not ctx.spoofed[k] then
      rawset(ctx, k, nil)
      if k == "auras" or k == "debuffTypes" or k == "resSick" then
        rawset(ctx, "_auras", nil)
        -- Fields built from the aura scan go stale with it.
        for _, d in ipairs({ "auras", "debuffTypes", "resSick", "camping" }) do
          if not ctx.spoofed[d] then rawset(ctx, d, nil) end
        end
      end
    end
  end
end

-- Lines for /rpgd dump ctx.
function Ctx.Describe(ctx)
  local out = {}
  for _, k in ipairs(Ctx.DUMP_ORDER) do
    local v = ctx[k]
    local s
    if k == "party" and type(v) == "table" then
      local parts = {}
      for _, m in ipairs(v) do
        parts[#parts + 1] = tostring(m.name or "?") .. " (" .. tostring(m.race) .. " " .. tostring(m.class) .. ")"
      end
      s = #parts > 0 and table.concat(parts, ", ") or "alone"
    elseif type(v) == "table" then
      local parts = {}
      for kk, vv in pairs(v) do parts[#parts + 1] = (vv == true) and tostring(kk) or (tostring(kk) .. "=" .. tostring(vv)) end
      table.sort(parts)
      s = "{" .. table.concat(parts, ", ") .. "}"
    elseif type(v) == "number" and v % 1 ~= 0 then
      s = string.format("%.2f", v)
    else
      s = tostring(v)
    end
    if ctx.spoofed[k] == true then s = s .. " " .. ns.L.CTX_SPOOFED end
    out[#out + 1] = k .. " = " .. s
  end
  for k, v in pairs(ctx.spoofed) do
    if v ~= true then out[#out + 1] = k .. " = " .. tostring(v) .. " " .. ns.L.CTX_SPOOFED end
  end
  return out
end
