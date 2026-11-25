-- Disposition (0.34.0): how one person regards the player, 0-100, Morrowind-style.
--
--   50 to start, then:
--     * what passed between you (NPC affinity, -10..10):            x4   (+-40)
--     * what their town thinks of you (town standing / 5):           +-15
--     * what they value against who you've shown yourself to be
--       (the NPC's `values` against your dominant traits):           +8 each, -8 for the opposite
--     * their temper (warm, jovial, gentle +5; gruff, cold -5)
--     * your alignment (0.114.0), on every axis their values (or role) care about,
--       either way (Disp.VALUE_AXES, ROLE_AXES):                     +-3/6/9/12 at 15/30/50/75
--     * a hostile or unfriendly unit reaction:                        -10
--     * their rivals (`rivals` on the NPC, 0.55.0): your affinity with each
--       rival x3 against you (to -15), or, if you've crossed the rival,
--       x1 in your favour (to +5)
--     * Admire / Taunt / Intimidate (Systems/Persuasion.lua, 0.85.0): a modifier that
--       fades by a point a day
--     * their prejudices (`prejudice` on the NPC, 0.80.0): what they hold against your
--       race, faction, class or origin, eased by 3 for each point of affinity you've earned
--       (to -25 in all)
--     * your tone (0.85.0, Daggerfall-style): Polite or Blunt against the manner this person
--       likes (`Disp.ToneLiked`): +3..+6 for the right one, -3..-5 for the wrong one,
--       nothing for Normal or for someone with no preference
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

-- Tone (0.85.0): Polite / Normal / Blunt, Daggerfall-style. The player's tone is kept per
-- character (`char.tone`), starting from the `tone` setting; spoof with tone=blunt.
Disp.TONES = { "polite", "normal", "blunt" }
local TONE_OK = { polite = true, normal = true, blunt = true }

-- 0.86.0: the tone feature is removed; everyone speaks Normal (variants fall back to it).
function Disp.Tone(ctx)
  do return "normal" end
  local spoofed = ctx and ctx.spoofed and ctx.spoofed.tone
  if TONE_OK[spoofed] then return spoofed end
  local settings = ns.db and ns.db.settings
  local t = ns.char and ns.char.tone
  if TONE_OK[t] then
    -- The setting shows this character's tone, and a new character starts in the last one used.
    if settings and settings.tone ~= t then settings.tone = t end
    return t
  end
  t = settings and settings.tone
  return TONE_OK[t] and t or "normal"
end

function Disp.SetTone(t)
  if not TONE_OK[t] then return end
  if ns.char then ns.char.tone = t end
  if ns.db and ns.db.settings then ns.db.settings.tone = t end
end

-- The next tone in Polite -> Normal -> Blunt order (the selector cycles).
function Disp.NextTone(t)
  for i, v in ipairs(Disp.TONES) do
    if v == t then return Disp.TONES[i % #Disp.TONES + 1] end
  end
  return "normal"
end

-- Who likes which manner. Polite: nobles, priests, officials, gentle and warm tempers, anyone
-- who values Order or the Light. Blunt: soldiers and guards, gruff and jovial tempers, orcs,
-- trolls and dwarves (def `race`), anyone who values Honor. Each family counts once.
Disp.POLITE = {
  role = { noble = true, priest = true, clerk = true, banker = true },
  temper = { gentle = true, warm = true, formal = true, serene = true, fussy = true },
  values = { lawful = true, dutiful = true, duty = true, order = true, devout = true, pious = true, light = true },
}
Disp.BLUNT = {
  role = { soldier = true, guard = true, militia = true, peon = true },
  temper = { gruff = true, jovial = true, blunt = true, hearty = true, boisterous = true, brash = true },
  values = { honest = true, honorable = true, honor = true, strength = true },
  race = { Orc = true, Troll = true, Dwarf = true },
}

local function tonePoints(def, role, want)
  local n = 0
  if role and want.role[role] then n = n + 1 end
  for _, field in ipairs({ "temper", "values" }) do
    for _, t in ipairs(def[field] or {}) do
      if want[field][t] then n = n + 1; break end
    end
  end
  if want.race and def.race and want.race[def.race] then n = n + 1 end
  return n
end

-- The manner this person likes and how strongly (1-3), or nil. def.likesTone overrides.
function Disp.ToneLiked(def, role)
  if type(def) ~= "table" then return nil, 0 end
  if def.likesTone == "polite" or def.likesTone == "blunt" then return def.likesTone, 3 end
  if def.likesTone == false or def.likesTone == "none" then return nil, 0 end
  local diff = tonePoints(def, role or def.role, Disp.POLITE) - tonePoints(def, role or def.role, Disp.BLUNT)
  if diff == 0 then return nil, 0 end
  return diff > 0 and "polite" or "blunt", math.min(math.abs(diff), 3)
end

-- What your tone does to this person's disposition: a number (0 for Normal or no preference).
function Disp.ToneDelta(def, role, tone)
  if tone ~= "polite" and tone ~= "blunt" then return 0 end
  local liked, strength = Disp.ToneLiked(def, role)
  if not liked then return 0 end
  if liked == tone then return math.min(6, 2 * strength + 1) end
  return -(strength + 2)
end

local function clamp(v, lo, hi) return math.max(lo, math.min(hi, v)) end

local function set(list)
  local out = {}
  for _, v in ipairs(list or {}) do out[v] = true end
  return out
end

-- info: the conversation's NPC info (def, communities...); mem: their memory record.
-- Returns the value and a list of reasons ({ text, delta }) for /rpgd why and the tooltip.
-- Alignment (0.114.0). What someone values ties them to an axis, one way or the other:
-- +1 when they want you toward Light / Order / Honor, -1 when they want you the other way.
Disp.VALUE_AXES = {
  lawful = { "order", 1 }, dutiful = { "order", 1 }, duty = { "order", 1 }, order = { "order", 1 },
  loyal = { "order", 1 }, discipline = { "order", 1 }, law = { "order", 1 }, tradition = { "order", 1 },
  freedom = { "order", -1 }, free = { "order", -1 }, wild = { "order", -1 }, independence = { "order", -1 },
  devout = { "light", 1 }, pious = { "light", 1 }, light = { "light", 1 }, faith = { "light", 1 },
  mercy = { "light", 1 }, compassion = { "light", 1 }, kind = { "light", 1 }, holy = { "light", 1 },
  shadow = { "light", -1 }, power = { "light", -1 }, ruthless = { "light", -1 }, forbidden = { "light", -1 },
  honest = { "honor", 1 }, honorable = { "honor", 1 }, honor = { "honor", 1 }, brave = { "honor", 1 },
  courage = { "honor", 1 }, strength = { "honor", 1 }, truth = { "honor", 1 },
  cunning = { "honor", -1 }, profit = { "honor", -1 }, guile = { "honor", -1 }, secrets = { "honor", -1 },
}
-- People who value nothing on an axis still have their role's view of it.
Disp.ROLE_AXES = {
  guard = { order = 1 }, soldier = { order = 1, honor = 1 }, militia = { order = 1 },
  priest = { light = 1 }, honor = { honor = 1 }, banker = { order = 1 }, clerk = { order = 1 },
  noble = { order = 1 }, trainer = { honor = 1 },
}
-- An NPC def may set `alignment = { light = 1, order = -1 }` to say outright what it wants.
function Disp.AxesFor(def, role)
  local out, seen = {}, false
  for _, v in ipairs((def and def.values) or {}) do
    local a = Disp.VALUE_AXES[v]
    if a and out[a[1]] == nil then out[a[1]] = a[2]; seen = true end
  end
  if type(def and def.alignment) == "table" then
    for axis, dir in pairs(def.alignment) do out[axis] = dir; seen = true end
  end
  if not seen and Disp.ROLE_AXES[role or ""] then
    for axis, dir in pairs(Disp.ROLE_AXES[role]) do out[axis] = dir end
  end
  return out
end
-- How much one axis is worth: nothing near the middle, up to 12 at the far ends.
function Disp.AlignWeight(a)
  local m = math.abs(a)
  local w = (m >= 75 and 12) or (m >= 50 and 9) or (m >= 30 and 6) or (m >= 15 and 3) or 0
  return a < 0 and -w or w
end

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
  -- Where you stand (0.114.0): every axis they care about, either way, scaled by how far
  -- you lean (Disp.AlignWeight). What they value says which axes and which way; people who
  -- value nothing on an axis get their role's (Disp.ROLE_AXES).
  local align = ns.char.align or {}
  for axis, dir in pairs(Disp.AxesFor(def, info and info.role)) do
    local w = Disp.AlignWeight(align[axis] or 0) * dir
    if w ~= 0 then add(w, "align:" .. axis .. (w > 0 and ":with" or ":against")) end
  end
  for _, r in ipairs(Disp.Rivals(def)) do
    local rm = ns.char.npc and ns.char.npc[r]
    local ra = rm and rm.affinity or 0
    if ra > 0 then add(-math.min(ra * Disp.RIVAL_PENALTY, 15), "rival:" .. r)
    elseif ra < 0 then add(math.min(-ra, 5), "rivalfoe:" .. r) end
  end
  local _, left = Disp.Prejudice(def, mem, ctx)
  add(-left, "prejudice")
  local tone = Disp.ToneDelta(def, info and info.role, Disp.Tone(ctx))
  add(tone, tone > 0 and "tone:likes" or "tone:dislikes")
  local reaction = ctx and ctx.npcReaction
  if type(reaction) == "number" and reaction <= 3 then add(-10, "unfriendly") end
  -- Admire, Taunt, Intimidate (0.85.0): what's left of how they took it.
  if ns.Persuasion then add(ns.Persuasion.Modifier(mem), "persuade") end
  return clamp(v, 0, 100), why
end

-- What's pulling them against you (0.90.0), as a set of words for the `grudge` condition:
-- wronged (your affinity with them is below 0), town, values (your traits or alignment),
-- temper (they're sour with everyone), rival (you're friends with someone they hate),
-- prejudice, tone, persuade (a Taunt or Intimidate that still stings), enemy (unfriendly
-- reaction). Only reasons worth 3 points or more against you count.
Disp.GRUDGE_OF = {
  affinity = "wronged", prejudice = "prejudice", unfriendly = "enemy", persuade = "persuade",
}
function Disp.Grudges(info, mem, ctx)
  local _, why = Disp.Compute(info, mem, ctx)
  local out, worst, worstD = {}, nil, 0
  for _, r in ipairs(why) do
    local reason, d = r[1], r[2]
    if d <= -3 then
      local g = Disp.GRUDGE_OF[reason]
      if not g then
        if reason:find("^town:") then g = "town"
        elseif reason:find("^rival:") then g = "rival"
        elseif reason:find("^tone:") then g = "tone"
        elseif reason:find("^temper ") then g = "temper"
        elseif reason:find("^align:") then g = "alignment"
        else g = "values" end
      end
      out[g] = true
      if d < worstD then worst, worstD = g, d end
    end
  end
  return out, worst
end

-- What's warming them to you (0.114.0), the mirror of Grudges, for the `fondness`
-- condition: earned (your affinity with them), town, values (your traits or alignment),
-- temper (they're warm with everyone), rival (you've crossed someone they dislike), tone
-- (you speak the way they like), persuade (an Admire or a joke they still remember).
-- Only reasons worth 3 points or more in your favour count.
Disp.FONDNESS_OF = { affinity = "earned", persuade = "persuade" }
function Disp.Fondness(info, mem, ctx)
  local _, why = Disp.Compute(info, mem, ctx)
  local out, best, bestD = {}, nil, 0
  for _, r in ipairs(why) do
    local reason, d = r[1], r[2]
    if d >= 3 then
      local g = Disp.FONDNESS_OF[reason]
      if not g then
        if reason:find("^town:") then g = "town"
        elseif reason:find("^rivalfoe:") then g = "rival"
        elseif reason:find("^tone:") then g = "tone"
        elseif reason:find("^temper ") then g = "temper"
        elseif reason:find("^align:") then g = "alignment"
        else g = "values" end
      end
      out[g] = true
      if d > bestD then best, bestD = g, d end
    end
  end
  return out, best
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
