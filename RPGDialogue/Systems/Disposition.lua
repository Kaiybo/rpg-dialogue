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
  local reaction = ctx and ctx.npcReaction
  if type(reaction) == "number" and reaction <= 3 then add(-10, "unfriendly") end
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
