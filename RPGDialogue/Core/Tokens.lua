-- Text tokens. They decorate a line; they never carry it.
--   {name} {npc} {race} {class} {g:lad|lass} {pet} {zone} {subzone} {town} {title} {home} {rank} {guild}
--   {away} (0.67.0): how long you were gone ("a month"), from your return to the town, else
--     from when you last spoke with this person. {source} (0.67.0): who the line's `word` came from.
--   {companion} (0.59.0): the party member the line's `party` condition picked out, else the first one.
--   {alt} {altrace} {altclass} (0.80.0): your other character the line's `alt` condition picked out.
local _, ns = ...

local Tokens = {}
ns.Tokens = Tokens

local RACE_NAMES = {
  Human = "human", Dwarf = "dwarf", Gnome = "gnome", NightElf = "night elf", Orc = "orc",
  Troll = "troll", Tauren = "tauren", Scourge = "Forsaken", Skyborne = "Skyborne",
}

local function raceName(ctx)
  return RACE_NAMES[ctx.race or ""] or (ctx.raceName and tostring(ctx.raceName)) or "traveler"
end

local function className(ctx)
  local n = ctx.className
  if type(n) == "string" and n ~= "" then return n:lower() end
  return (ctx.class and tostring(ctx.class):lower()) or "adventurer"
end

-- The name NPCs use: your Total RP 3 name when that's on (Integrations/TotalRP3.lua).
function Tokens.PlayerName(ctx)
  if ns.Integrations and ns.Integrations.RoleplayName then
    local rp = ns.Integrations.RoleplayName()
    if rp then return rp end
  end
  return ctx.name or "stranger"
end

local simple = {
  name = function(ctx) return Tokens.PlayerName(ctx) end,
  npc = function(_, env) return env and env.info and env.info.name or "" end,
  race = raceName,
  class = className,
  pet = function(ctx) local p = ctx.pet; return (p and p.name) or "your companion" end,
  zone = function(ctx) return ctx.zone or "" end,
  subzone = function(ctx) return (ctx.subzone ~= "" and ctx.subzone) or ctx.zone or "" end,
  town = function(_, env)
    local id = env and env.info and env.info.communities and env.info.communities[1]
    local town = id and ns.Data and ns.Data.towns[id]
    return town and town.name or (id or "")
  end,
  title = function() local t = ns.Effects and ns.Effects.TitleName and ns.Effects.TitleName(); return t or "" end,
  home = function() return (ns.char and ns.char.homeInn and ns.char.homeInn.name) or "" end,
  deaths = function() return tostring((ns.char and ns.char.deathCount) or 0) end,
  deathplace = function()
    local d = ns.char and ns.char.deaths[#ns.char.deaths]
    return d and ((d.subzone ~= "" and d.subzone) or d.zone) or "somewhere"
  end,
  rank = function(ctx) return ctx.pvpRankName or "soldier" end,
  guild = function(ctx) return ctx.guild or "your company" end,
  away = function(ctx, env)
    local T = ns.Towns
    if not T then return "a while" end
    local town = env and env.info and env.info.communities and env.info.communities[1]
    local back = T.Back(town, (env and env.now) or ns.Compat.Now(), ctx.level)
    if back then return T.AwayWords(back.days) end
    local last = env and env.mem and env.mem.last
    return T.AwayWords(last and ((ns.Compat.Now() - last) / 86400) or nil)
  end,
  killer = function()
    local d = ns.char and ns.char.deaths[#ns.char.deaths]
    return (d and d.killer and d.killer.name) or "something"
  end,
}

local function companion(ctx, when)
  local spec = type(when) == "table" and when.party or nil
  local m = ns.Conditions and ns.Conditions.PartyMatch and ns.Conditions.PartyMatch(ctx, spec)
  return (m and m.name) or "your friend"
end

-- `when` (optional) is the line's condition table, used by {companion}.
function Tokens.Render(text, ctx, env, when)
  if type(text) ~= "string" then return "" end
  if text:find("{companion}", 1, true) then
    text = text:gsub("{companion}", (companion(ctx, when):gsub("%%", "%%%%")))
  end
  if text:find("{alt", 1, true) and ns.Kin then
    local spec = type(when) == "table" and when.alt or nil
    local e = ns.Kin.Match(ctx, spec, env) or {}
    local function esc(x) return (tostring(x):gsub("%%", "%%%%")) end
    text = text:gsub("{alt}", esc(e.name or "someone"))
    text = text:gsub("{altrace}", esc(ns.Kin.RaceName(e.race and e)))
    text = text:gsub("{altclass}", esc(ns.Kin.ClassName(e.class and e)))
  end
  if text:find("{source}", 1, true) then
    local spec = type(when) == "table" and when.word or nil
    local w = spec and ns.Towns and ns.Towns.FindWord(spec, env)
    text = text:gsub("{source}", ((ns.Towns and ns.Towns.SourceName(w) or "someone"):gsub("%%", "%%%%")))
  end
  text = text:gsub("{g:([^|}]*)|([^}]*)}", function(male, female)
    return ctx.gender == "female" and female or male
  end)
  text = text:gsub("{(%a+)}", function(key)
    local fn = simple[key]
    if fn then return fn(ctx, env) end
    return nil
  end)
  return text
end

Tokens.KNOWN = { "name", "npc", "race", "class", "pet", "zone", "subzone", "town", "title", "home", "g",
  "deaths", "deathplace", "killer", "rank", "guild", "companion", "away", "source",
  "alt", "altrace", "altclass" }
