-- Text tokens. They decorate a line; they never carry it.
--   {name} {npc} {race} {class} {g:lad|lass} {pet} {zone} {subzone} {town} {title} {home}
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
  killer = function()
    local d = ns.char and ns.char.deaths[#ns.char.deaths]
    return (d and d.killer and d.killer.name) or "something"
  end,
}

function Tokens.Render(text, ctx, env)
  if type(text) ~= "string" then return "" end
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
  "deaths", "deathplace", "killer" }
