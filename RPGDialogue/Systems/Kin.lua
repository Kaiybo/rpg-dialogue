-- Kin (0.80.0): the other characters on this account. Each character's entry and the people
-- it has spoken with live in the account-wide RPGDialogueDB.kin, so an NPC can notice that
-- "someone very like you" came by: the `alt` condition and the {alt} tokens.
--   db.kin.chars[id] = { name, realm, race, class, gender, faction, level, t }   (id = "Realm-Name")
--   db.kin.met[npcKey][id] = time that character last finished talking with them
-- NPCs never know these are your characters; lines treat them as kin, look-alikes or rumour.
local _, ns = ...

local C = ns.Compat
local Kin = {}
ns.Kin = Kin

local function store()
  local db = ns.db
  if not db then return nil end
  db.kin = type(db.kin) == "table" and db.kin or {}
  db.kin.chars = type(db.kin.chars) == "table" and db.kin.chars or {}
  db.kin.met = type(db.kin.met) == "table" and db.kin.met or {}
  return db.kin
end

local function realm()
  local fn = _G.GetRealmName
  local ok, r = pcall(function() return fn and fn() end)
  return (ok and type(r) == "string" and r ~= "") and r or "?"
end

function Kin.SelfID()
  if Kin.id then return Kin.id end
  local name = C.Name("player")
  if not name then return nil end
  Kin.id = realm() .. "-" .. name
  return Kin.id
end

-- Writes this character's entry (login, level-up, each conversation).
function Kin.Stamp()
  local k, id = store(), Kin.SelfID()
  if not k or not id then return end
  local _, race = C.Race("player")
  local _, class = C.Class("player")
  local e = k.chars[id] or {}
  e.name, e.realm = C.Name("player"), realm()
  e.race, e.class = race or e.race, class or e.class
  e.gender = C.Sex("player") or e.gender
  e.faction = C.Faction("player") or e.faction
  e.level = C.Level("player") or e.level
  e.t = C.Now()
  k.chars[id] = e
end

-- This character just finished a conversation with npcKey.
function Kin.Met(npcKey, when)
  local k, id = store(), Kin.SelfID()
  if not k or not id or not npcKey then return end
  local m = k.met[npcKey]
  if not m then m = {}; k.met[npcKey] = m end
  m[id] = when or C.Now()
end

-- Characters before 0.80.0 already know people: copy this character's memory over once.
local function backfill()
  local k, id = store(), Kin.SelfID()
  if not k or not id or not ns.char then return end
  local c = ns.char
  if c.kinBackfilled then return end
  for key, rec in pairs(c.npc or {}) do
    if type(rec) == "table" and (rec.times or 0) > 0 then
      local m = k.met[key] or {}
      k.met[key] = m
      if not m[id] or (rec.last and rec.last > m[id]) then m[id] = rec.last or C.Now() end
    end
  end
  c.kinBackfilled = true
end

-- Other characters, newest first. npcKey given: only those who met that person (each with
-- `met` = when). Spoof with /rpgd spoof alt=Name (or alt=Name:Race:CLASS:Faction).
function Kin.Others(ctx, npcKey)
  local out = {}
  local spoof = ctx and ctx.spoofed and ctx.spoofed.alt
  if spoof then
    local name, race, class, faction = tostring(spoof):match("^([^:]+):?([^:]*):?([^:]*):?([^:]*)$")
    out[1] = {
      id = "spoof", name = name or "Somebody", race = (race ~= "" and race) or ctx.race,
      class = (class ~= "" and class:upper()) or "WARRIOR", faction = (faction ~= "" and faction) or ctx.faction,
      gender = ctx.gender, level = 60, met = C.Now() - 3 * 86400, t = C.Now() - 3 * 86400,
    }
    return out
  end
  local k, self = store(), Kin.SelfID()
  if not k then return out end
  local met = npcKey and k.met[npcKey]
  if npcKey and not met then return out end
  for id, e in pairs(k.chars) do
    if id ~= self and type(e) == "table" and (not npcKey or met[id]) then
      local copy = { id = id, met = npcKey and met[id] or nil }
      for f, v in pairs(e) do copy[f] = v end
      out[#out + 1] = copy
    end
  end
  table.sort(out, function(a, b) return (a.met or a.t or 0) > (b.met or b.t or 0) end)
  return out
end

local function listHas(list, x)
  if type(list) ~= "table" then return list == x end
  for i = 1, #list do if list[i] == x then return true end end
  return false
end

-- Does character e fit spec v (the table form of the `alt` condition)?
function Kin.Fits(ctx, e, v, now)
  if v.race and not listHas(v.race, e.race) then return false end
  if v.class and not listHas(v.class, e.class) then return false end
  if v.gender and e.gender ~= v.gender then return false end
  if v.kin and e.race ~= ctx.race then return false end
  if v.notKin and e.race == ctx.race then return false end
  if v.sameClass and e.class ~= ctx.class then return false end
  if v.faction == "same" and e.faction ~= ctx.faction then return false end
  if v.faction == "other" and e.faction == ctx.faction then return false end
  if v.faction and v.faction ~= "same" and v.faction ~= "other" and not listHas(v.faction, e.faction) then return false end
  if v.higher and not ((e.level or 0) > (ctx.level or 0)) then return false end
  if v.level then
    local lv = e.level or 0
    if type(v.level) == "number" and lv < v.level then return false end
    if type(v.level) == "table" and ((v.level.min and lv < v.level.min) or (v.level.max and lv > v.level.max)) then return false end
  end
  if v.days and e.met and ((now or C.Now()) - e.met) > v.days * 86400 then return false end
  return true
end

-- The first character a condition spec picks out, or nil.
function Kin.Match(ctx, v, env)
  local npcKey = env and env.info and ns.Memory.Key(env.info)
  if type(v) == "table" and v.met == false then npcKey = nil end
  local list = Kin.Others(ctx, npcKey)
  if type(v) ~= "table" then return list[1] end
  for _, e in ipairs(list) do
    if Kin.Fits(ctx, e, v, env and env.now) then return e end
  end
  return nil
end

local RACE = {
  Human = "human", Dwarf = "dwarf", Gnome = "gnome", NightElf = "night elf", Orc = "orc",
  Troll = "troll", Tauren = "tauren", Scourge = "Forsaken", Skyborne = "Skyborne",
}
function Kin.RaceName(e) return (e and RACE[e.race or ""]) or "traveler" end
function Kin.ClassName(e) return (e and e.class and e.class:lower()) or "adventurer" end

-- /rpgd kin: who the account remembers.
function Kin.Print()
  local k = store()
  if not k then return end
  local self, n = Kin.SelfID(), 0
  for id, e in pairs(k.chars) do
    local met = 0
    for _, m in pairs(k.met) do if m[id] then met = met + 1 end end
    ns.Print(("%s%s: level %s %s %s (%s), knows %d people"):format(e.name or id, id == self and " (you)" or "",
      tostring(e.level or "?"), Kin.RaceName(e), Kin.ClassName(e), tostring(e.faction or "?"), met))
    n = n + 1
  end
  if n == 0 then ns.Print("No characters recorded yet.") end
end

ns.OnLogin(function()
  Kin.Stamp()
  backfill()
end)
ns.On("PLAYER_LEVEL_UP", function() if C.After then C.After(1, Kin.Stamp) else Kin.Stamp() end end)
