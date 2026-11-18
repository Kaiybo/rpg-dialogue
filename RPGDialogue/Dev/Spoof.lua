-- /rpgd spoof race=Gnome class=PRIEST level=8 form=bear ...
-- Overrides ctx fields (and history-type facts) for testing. Session only, never saved.
local _, ns = ...

local L = ns.L
local Spoof = { values = {} }
ns.Spoof = Spoof

local RACES = {
  human = "Human", dwarf = "Dwarf", gnome = "Gnome", nightelf = "NightElf", night_elf = "NightElf",
  orc = "Orc", troll = "Troll", tauren = "Tauren", undead = "Scourge", forsaken = "Scourge",
  scourge = "Scourge", skyborne = "Skyborne",
}

local BOOLS = {
  mounted = true, stealthed = true, ghost = true, nearlyNaked = true, resting = true, capital = true,
  atInn = true, camping = true, resSick = true, hardcore = true, inInstance = true, npcElite = true,
  metBefore = true,
}

local NUMBERS = {
  level = true, npcLevel = true, hour = true, drunk = true, durability = true, money = true,
  deaths = true, timesTalked = true, daysSince = true, affinity = true, light = true, order = true,
  honor = true, taint = true, insanity = true, npcID = true, townStanding = true,
  away = true, levelsSince = true,
}

local SETS = { debuffTypes = true, auras = true, holiday = true, outOfPlace = true }

local ALIASES = { naked = "nearlyNaked", debuff = "debuffTypes", aura = "auras", time = "tod" }

local function toBool(v)
  v = v:lower()
  return v == "true" or v == "yes" or v == "1" or v == "on"
end

local function toSet(v)
  local set = {}
  for piece in v:gmatch("[^,]+") do set[tonumber(piece) or piece] = true end
  return set
end

-- Returns key, value or nil, error.
function Spoof.Parse(token)
  local key, raw = token:match("^([%w_:]+)=(.+)$")
  if not key then return nil end
  key = ALIASES[key] or key
  raw = raw:gsub("_", " ")
  local qid = key:match("^quest:(%d+)$")
  if qid then return "quest", { [tonumber(qid)] = raw:lower() } end
  if key == "race" then return key, RACES[raw:lower():gsub(" ", "")] or raw end
  if key == "class" then return key, raw:upper() end
  if key == "gender" or key == "npcGender" or key == "tod" or key == "form" or key == "tone" then return key, raw:lower() end
  if key == "pet" then
    if raw:lower() == "none" then return key, false end
    return key, { family = raw, name = "Spot" }
  end
  if BOOLS[key] then return key, toBool(raw) end
  if NUMBERS[key] then
    local n = tonumber(raw)
    if not n then return nil end
    return key, n
  end
  if SETS[key] then return key, toSet(raw) end
  return key, raw
end

function Spoof.Apply(args)
  local applied = {}
  for _, token in ipairs(args) do
    if token == "clear" then
      ns.Util.Wipe(Spoof.values)
      ns.Print(L.SPOOF_CLEARED)
      return
    end
    local k, v = Spoof.Parse(token)
    if k == nil then
      ns.Print(L.SPOOF_BAD:format(token))
    elseif k == "quest" then
      Spoof.values.quest = Spoof.values.quest or {}
      for id, state in pairs(v) do Spoof.values.quest[id] = state end
      applied[#applied + 1] = token
    else
      Spoof.values[k] = v
      applied[#applied + 1] = token
    end
  end
  if #applied == 0 then
    local current = {}
    for k in pairs(Spoof.values) do current[#current + 1] = k end
    ns.Print(#current > 0 and L.SPOOF_SET:format(table.concat(current, ", ")) or L.SPOOF_NONE)
  else
    ns.Print(L.SPOOF_SET:format(table.concat(applied, " ")))
  end
end
