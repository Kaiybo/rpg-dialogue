-- Disposition (0.34.0): how one person regards the player, 0-100, Morrowind-style.
--
--   50 to start, then:
--     * what passed between you (NPC affinity, -10..10):            x4   (+-40)
--     * what their town thinks of you (town standing / 5):           +-15
--     * what they value against who you've shown yourself to be
--       (the NPC's `values` against your dominant traits):           +8 each, -8 for the opposite
--     * their temper (warm, jovial, gentle +5; gruff, cold -5)
--     * your alignment, when they value it (lawful/dutiful and Order,
--       devout/pious and Light, honest and Honor):                    +-5
--     * a hostile or unfriendly unit reaction:                        -10
--     * their rivals (`rivals` on the NPC, 0.55.0): your affinity with each
--       rival x3 against you (to -15), or, if you've crossed the rival,
--       x1 in your favour (to +5)
--     * Admire / Taunt / Intimidate (Systems/Persuasion.lua, 0.85.0): a modifier that
--       fades by a point a day
--     * their prejudices (`prejudice` on the NPC, 0.80.0): what they hold against your
--       race, faction, class or origin, eased by 3 for each point of affinity you've earned
--       (to -25 in all)
--   Clamped to 0-100. Words: Hostile, Cold, Wary, Neutral, Warm, Friendly, Devoted.
--
-- It's addon-only: it never changes prices or how anyone really behaves in the game. It
-- colours what people say (condition `disposition`), how easily they're persuaded, and what
-- they'll confide (content gates answers on it).
local _, ns = ...

local Disp = {}
ns.Disposition = Disp

-- A Persuade check with no conditions of its own passes from here up (Engine.CheckChoice).
Disp.PERSUADE = 65

-- What they'll talk about (0.85.0). Below GATE_ORDINARY (Cold or worse) they won't discuss
-- anything but the "ask anyone" topics; secrets and personal topics need GATE_PRIVATE
-- (Warm). A topic's own `minDisposition` overrides both; a line's `minDisposition` holds
-- that one answer back.
Disp.GATE_ORDINARY = 35   -- Wary or better
Disp.GATE_PRIVATE = 60    -- Warm or better
Disp.PRIVATE_CATEGORIES = { secrets = true, personal = true }

-- The disposition a topic needs with this NPC (0 for none). Private: the topic says
-- `private`/`secret`, its category is secrets or personal, its `about` names this NPC, or
-- the NPC lists it in its own `private`.
function Disp.TopicNeed(topic, info)
  local tdef = ns.Data and ns.Data.topics and ns.Data.topics[topic]
  if topic == "knows" or (tdef and tdef.standard) then return 0 end
  if tdef and type(tdef.minDisposition) == "number" then return tdef.minDisposition end
  local def = info and info.def
  local private = tdef and (tdef.private or tdef.secret or Disp.PRIVATE_CATEGORIES[tdef.category or ""])
  if not private and tdef and tdef.about and info and info.key then
    local about = type(tdef.about) == "table" and tdef.about or { tdef.about }
    for _, k in ipairs(about) do if k == info.key then private = true; break end end
  end
  if not private and def and type(def.private) == "table" then
    for _, k in ipairs(def.private) do if k == topic then private = true; break end end
  end
  if type(def and def.topicGates) == "table" and type(def.topicGates[topic]) == "number" then
    return def.topicGates[topic]
  end
  return private and Disp.GATE_PRIVATE or Disp.GATE_ORDINARY
end

Disp.TIERS = {
  { id = "hostile", max = 19 }, { id = "cold", max = 34 }, { id = "wary", max = 44 },
  { id = "neutral", max = 59 }, { id = "warm", max = 74 }, { id = "friendly", max = 89 },
  { id = "devoted", max = 100 },
}

-- Traits that pull the other way: an NPC who values kindness thinks less of the cruel.
Disp.OPPOSITE = {
  kind = "cruel", cruel = "kind", generous = "greedy", greedy = "generous",
  brave = "cautious", cautious = "brave", pious = "skeptical", skeptical = "pious",
  devout = "skeptical", honest = "cunning",
}
Disp.WARM_TEMPER = { warm = true, jovial = true, gentle = true, kind = true, friendly = true }
Disp.COLD_TEMPER = { gruff = true, cold = true, surly = true, hostile = true, bitter = true }

-- Rivals (0.55.0): an NPC's `rivals` is a list of other NPCs' keys. Pleasing one cools the
-- other; crossing one warms the other a little. Declare both sides in content.
Disp.RIVAL_PENALTY = 3

function Disp.Rivals(def)
  local r = def and def.rivals
  if type(r) == "string" then return { r } end
  return type(r) == "table" and r or {}
end

-- A rival's display name: their memory record, else their definition, else the key.
function Disp.RivalName(key)
  local m = ns.char.npc and ns.char.npc[key]
  if m and m.name then return m.name end
  local d = ns.Data and ns.Data.npcs and ns.Data.npcs[key]
  return d and d.name or key
end

-- Rivals of this NPC the player has pleased (affinity > 0) and met, best first: { key, affinity }.
function Disp.FavouredRivals(def)
  local out = {}
  for _, r in ipairs(Disp.Rivals(def)) do
    local m = ns.char.npc and ns.char.npc[r]
    if m and (m.affinity or 0) > 0 then out[#out + 1] = { key = r, affinity = m.affinity } end
  end
  table.sort(out, function(a, b) return a.affinity > b.affinity end)
  return out
end

-- Prejudice (0.80.0): an NPC's `prejudice` is one entry or a list of them:
--   { race = "Gnome" | {..}, faction = "Horde", class = "WARLOCK", origin = "..",
--     exceptOrigin = ".." | {..}, amount = 10 (default), why = "writer's note" }
-- Every key given must match the player. The weight a prejudice carries falls by
-- PREJUDICE_EASE for each point of affinity above zero: people can be won round.
Disp.PREJUDICE_EASE = 3
Disp.PREJUDICE_MAX = 25

local function anyOf(actual, want)
  if want == nil then return true end
  if type(want) == "table" then
    for _, w in ipairs(want) do if w == actual then return true end end
    return false
  end
  return want == actual
end

local function who(ctx)
  if ctx then return ctx.race, ctx.faction, ctx.class end
  local C = ns.Compat
  if not C then return nil end
  local _, race = C.Race("player")
  local _, class = C.Class("player")
  return race, C.Faction("player"), class
end

-- Returns the full weight of the prejudices that match the player, and what's left of it
-- after affinity (both >= 0), plus the first matching entry.
function Disp.Prejudice(def, mem, ctx)
  local p = def and def.prejudice
  if type(p) ~= "table" then return 0, 0 end
  if p.race or p.faction or p.class or p.origin or p.amount then p = { p } end
  local race, faction, class = who(ctx)
  local origin = ns.char and ns.char.origin and ns.char.origin.id
  local full, first = 0, nil
  for _, e in ipairs(p) do
    if type(e) == "table" and anyOf(race, e.race) and anyOf(faction, e.faction)
      and anyOf(class, e.class) and anyOf(origin, e.origin)
      and not (e.exceptOrigin and origin and anyOf(origin, e.exceptOrigin)) then
      full = full + (tonumber(e.amount) or 10)
      first = first or e
    end
  end
  full = math.min(full, Disp.PREJUDICE_MAX)
  local aff = mem and mem.affinity or 0
  local left = math.max(0, full - math.max(0, aff) * Disp.PREJUDICE_EASE)
  return full, left, first
end

local function clamp(v, lo, hi) return math.max(lo, math.min(hi, v)) end

local function set(list)
  local out = {}
  for _, v in ipairs(list or {}) do out[v] = true end
  return out
end

-- info: the conversation's NPC info (def, communities...); mem: their memory record.
-- Returns the value and a list of reasons ({ text, delta }) for /rpgd why and the tooltip.
function Disp.Compute(info, mem, ctx)
  local v, why = 50, {}
  local function add(d, reason)
    if d ~= 0 then v = v + d; why[#why + 1] = { reason, d } end
  end
  local aff = mem and mem.affinity or 0
  add(aff * 4, "affinity")
  local town = info and info.communities and info.communities[1]
  local rec = town and ns.char.towns and ns.char.towns[town]
  if rec and rec.value then add(clamp(math.floor(rec.value / 5 + 0.5), -15, 15), "town:" .. town) end
  local def = info and info.def
  local values = set(def and def.values)
  local dom = ns.Effects and ns.Effects.DominantTraits() or {}
  for _, t in ipairs(dom) do
    if values[t] then add(8, "values " .. t) end
    for valued in pairs(values) do
      if Disp.OPPOSITE[valued] == t then add(-8, "dislikes " .. t); break end
    end
  end
  for _, t in ipairs(def and def.temper or {}) do
    if Disp.WARM_TEMPER[t] then add(5, "temper " .. t); break end
  end
  for _, t in ipairs(def and def.temper or {}) do
    if Disp.COLD_TEMPER[t] then add(-5, "temper " .. t); break end
  end
  local align = ns.char.align or {}
  local function byAxis(axis, keys)
    for _, k in ipairs(keys) do
      if values[k] then
        local a = align[axis] or 0
        if a >= 20 then add(5, k .. " / " .. axis) elseif a <= -20 then add(-5, k .. " / " .. axis) end
        return
      end
    end
  end
  byAxis("order", { "lawful", "dutiful" })
  byAxis("light", { "devout", "pious" })
  byAxis("honor", { "honest" })
  for _, r in ipairs(Disp.Rivals(def)) do
    local rm = ns.char.npc and ns.char.npc[r]
    local ra = rm and rm.affinity or 0
    if ra > 0 then add(-math.min(ra * Disp.RIVAL_PENALTY, 15), "rival:" .. r)
    elseif ra < 0 then add(math.min(-ra, 5), "rivalfoe:" .. r) end
  end
  local _, left = Disp.Prejudice(def, mem, ctx)
  add(-left, "prejudice")
  local reaction = ctx and ctx.npcReaction
  if type(reaction) == "number" and reaction <= 3 then add(-10, "unfriendly") end
  -- Admire, Taunt, Intimidate (0.85.0): what's left of how they took it.
  if ns.Persuasion then add(ns.Persuasion.Modifier(mem), "persuade") end
  return clamp(v, 0, 100), why
end

-- The value for the NPC of a conversation environment (cached per conversation, and
-- recomputed after anything that could move it: affinity, standing, traits).
function Disp.For(env, ctx)
  if not env then return 50 end
  local spoofed = ctx and ctx.spoofed and ctx.spoofed.disposition
  if type(spoofed) == "number" then return spoofed end
  return (Disp.Compute(env.info, env.mem, ctx or env.ctx))
end

function Disp.Tier(value)
  for _, t in ipairs(Disp.TIERS) do
    if value <= t.max then return t.id end
  end
  return "devoted"
end

function Disp.TierName(value)
  local id = Disp.Tier(value)
  return ns.L["DISP_" .. id:upper()] or id
end

-- From what's stored alone (the journal, outside a conversation).
function Disp.ForMemory(key)
  local mem = ns.char.npc[key]
  if not mem then return nil end
  local info = { key = key, name = mem.name }
  local def = ns.Data and ns.Data.npcs and ns.Data.npcs[key]
  if def then info.def = def; info.communities = def.communities end
  if not info.communities and mem.town then info.communities = { mem.town } end
  return (Disp.Compute(info, mem, nil))
end
