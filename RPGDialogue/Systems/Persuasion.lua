-- Persuasion (0.85.0, Morrowind-style): Admire, Taunt and Intimidate, from the box's bottom
-- bar (or DialogueUI's "Persuade..." entry). Each can be tried once per person per day.
--
-- Whether it works comes from who the two of you are, never dice:
--   * the NPC's `temper` (named NPCs; unnamed ones get their role's, ROLE_TEMPER) and `values`
--   * the player's dominant traits, class and race, the relative `power`, and the NPC's
--     prejudice and present disposition (the same inputs as Systems/Disposition.lua)
--   * their mood today: -1, 0 or +1, seeded by the day and the person, so a near thing can go
--     either way on a different day, but trying again the same day changes nothing
-- Admire works on vain, warm and jovial people and fails on sharp or cold ones. Taunt wins
-- over gruff and proud fighters who respect some spine and puts most others off. Intimidate
-- works on the cowardly or when you plainly outclass them, and otherwise costs a lot.
-- Joke (0.87.0) lands with the jovial and the cheerful, falls flat with the grim and the
-- stern, and risks the least.
--
-- An outcome is a disposition modifier (`mem.persuadeMod = { v, t }`) that fades toward
-- nothing by DECAY_PER_DAY a day, capped at +-MOD_MAX. No bribes (an addon can't take gold),
-- and no alignment: this is how you handle a person, not who you are.
local _, ns = ...

local C = ns.Compat

local Pers = {}
ns.Persuasion = Pers

Pers.ACTIONS = { "admire", "joke", "taunt", "intimidate" }
Pers.COOLDOWN = 86400       -- once per person per day, per action
Pers.DECAY_PER_DAY = 1      -- disposition points the modifier loses each day
Pers.MOD_MAX = 25

-- What each outcome does to disposition.
Pers.EFFECT = {
  admire = { success = 6, fail = -4 },
  joke = { success = 5, fail = -2 },   -- 0.87.0: the gentlest of the four either way
  taunt = { success = 8, fail = -6 },
  intimidate = { success = 10, fail = -12 },
}

-- The score an action needs (see Pers.Score).
Pers.NEED = { admire = 1, joke = 1, taunt = 2, intimidate = 3 }

-- Tempers for people with none of their own (unnamed NPCs, by role).
Pers.ROLE_TEMPER = {
  guard = { "gruff" }, soldier = { "gruff", "proud" }, militia = { "gruff" }, honor = { "proud" },
  vendor = { "cheerful" }, innkeeper = { "jovial" }, banker = { "dry" }, auctioneer = { "brisk" },
  trainer = { "steady" }, flightmaster = { "brisk" }, stablemaster = { "calm" }, blacksmith = { "gruff" },
  peon = { "cowardly" }, worker = { "anxious" }, child = { "eager" }, citizen = { "steady" },
}

local ADMIRE_LIKES = { vain = 4, jovial = 3, warm = 3, cheerful = 3, friendly = 3, chatty = 3, gentle = 2,
  eager = 2, smooth = 2, proud = 1, kind = 2 }
local ADMIRE_HATES = { sharp = -4, cold = -4, shrewd = -3, grim = -3, surly = -3, bitter = -3, dry = -2,
  blunt = -1, hostile = -4 }
-- Joke (0.87.0): the merry laugh, the dour don't, and a bad joke costs little.
local JOKE_LIKES = { jovial = 4, cheerful = 3, chatty = 3, friendly = 2, warm = 2, eager = 2, hearty = 3,
  boisterous = 3, brash = 2, smooth = 1, kind = 1 }
local JOKE_HATES = { grim = -4, cold = -3, stern = -3, surly = -3, bitter = -3, hostile = -4, formal = -2,
  serene = -1, anxious = -1, proud = -1, sharp = -1 }
local JOKE_ROLES = { innkeeper = 1, child = 1, peon = 1 }
local TAUNT_RESPECTS = { gruff = 3, proud = 3, fierce = 3, blunt = 2, stern = 2 }
local TAUNT_HURTS = { gentle = -2, warm = -2, kind = -2, anxious = -2, cowardly = -2 }
local FIGHTER_ROLES = { guard = true, soldier = true, militia = true, honor = true }
local FIGHTER_VALUES = { brave = true, proud = true, strength = true, honor = true }

local function set(list)
  local out = {}
  for _, v in ipairs(list or {}) do out[v] = true end
  return out
end

-- The NPC's tempers as a set: their own, else their role's.
function Pers.Temper(info)
  local def = info and info.def
  local list = def and def.temper
  if type(list) == "string" then list = { list } end
  if type(list) ~= "table" or #list == 0 then list = Pers.ROLE_TEMPER[info and info.role or ""] or {} end
  return set(list)
end

local function bestOf(temper, weights)
  local best
  for t in pairs(temper) do
    local w = weights[t]
    if w and (best == nil or math.abs(w) > math.abs(best)) then best = w end
  end
  return best
end

-- Their mood today: -1, 0 or +1, the same all day for the same person.
function Pers.Mood(key, now)
  local day = math.floor((now or C.Now()) / 86400)
  local h = 0
  local s = tostring(key or "?")
  for i = 1, #s do h = (h * 31 + s:byte(i)) % 2147483647 end
  return ((h + day * 7919) % 3) - 1
end

local function fighter(info)
  if FIGHTER_ROLES[info and info.role or ""] then return true end
  local sub = info and info.subtitle
  if type(sub) == "string" and sub:lower():find("warrior", 1, true) then return true end
  local values = info and info.def and info.def.values
  for _, v in ipairs(values or {}) do if FIGHTER_VALUES[v] then return true end end
  return false
end

-- The score for an action against this person, and the reasons ({ text, delta }).
-- ctx: the conversation's context; mem: their memory record.
function Pers.Score(action, info, mem, ctx, now)
  local score, why = 0, {}
  local function add(d, reason)
    if d and d ~= 0 then score = score + d; why[#why + 1] = { reason, d } end
  end
  local temper = Pers.Temper(info)
  local traits = set(ns.Effects and ns.Effects.DominantTraits() or {})
  local class, race = ctx and ctx.class, ctx and ctx.race
  local power = ctx and ctx.power
  local disp = ns.Disposition and ns.Disposition.Compute(info, mem, ctx) or 50
  local _, prejudice = 0, 0
  if ns.Disposition then _, prejudice = ns.Disposition.Prejudice(info and info.def, mem, ctx) end

  if action == "admire" then
    add(bestOf(temper, ADMIRE_LIKES), "temper")
    add(bestOf(temper, ADMIRE_HATES), "temper")
    if traits.charming then add(2, "charming") end
    if traits.witty then add(1, "witty") end
    if traits.kind then add(1, "kind") end
    if traits.cruel then add(-1, "cruel") end
    if traits.reserved then add(-1, "reserved") end
    if disp >= 60 then add(1, "disposition") elseif disp < 35 then add(-2, "disposition") end
    if prejudice > 0 then add(-2, "prejudice") end
  elseif action == "joke" then
    add(bestOf(temper, JOKE_LIKES), "temper")
    add(bestOf(temper, JOKE_HATES), "temper")
    add(JOKE_ROLES[info and info.role or ""], "role")
    if traits.witty then add(2, "witty") end
    if traits.charming then add(1, "charming") end
    if traits.stern then add(-1, "stern") end
    if traits.reserved then add(-1, "reserved") end
    if traits.cruel then add(-1, "cruel") end
    if disp >= 60 then add(1, "disposition") elseif disp < 35 then add(-2, "disposition") end
    if prejudice > 0 then add(-1, "prejudice") end
  elseif action == "taunt" then
    local respect = bestOf(temper, TAUNT_RESPECTS)
    if respect then
      add(respect, "temper")
      if fighter(info) then add(2, "fighter") end
    else
      add(-3, "temper")
    end
    add(bestOf(temper, TAUNT_HURTS), "temper")
    if traits.brave then add(1, "brave") end
    if traits.witty then add(1, "witty") end
    if traits.cautious then add(-1, "cautious") end
    if class == "WARRIOR" then add(1, "class") end
    if power == "above" or power == "far_above" then add(1, "power")
    elseif power == "far_below" then add(-1, "power") end
  elseif action == "intimidate" then
    if temper.cowardly then add(6, "cowardly") elseif temper.anxious then add(3, "anxious") end
    if power == "far_above" then add(5, "power")
    elseif power == "above" then add(3, "power")
    elseif power == "below" then add(-2, "power")
    elseif power == "far_below" then add(-4, "power") end
    if temper.proud or temper.fierce then add(-3, "temper") end
    if FIGHTER_ROLES[info and info.role or ""] then add(-2, "armed") end
    if class == "WARRIOR" or class == "ROGUE" or class == "WARLOCK" then add(1, "class") end
    if race == "Orc" or race == "Tauren" or race == "Scourge" or race == "Undead" then add(1, "race") end
    if traits.cruel then add(1, "cruel") end
    if traits.stern then add(1, "stern") end
    if traits.kind then add(-1, "kind") end
  end
  add(Pers.Mood(info and (info.key or info.npcID or info.name), now), "mood")
  return score, why
end

-- Spoofing (Dev/Spoof.lua): ctx.spoofed.persuade = true / false forces the outcome.
function Pers.Check(action, info, mem, ctx, now)
  local score, why = Pers.Score(action, info, mem, ctx, now)
  local forced = ctx and ctx.spoofed and ctx.spoofed.persuade
  if forced ~= nil then return forced == true, score, why end
  return score >= (Pers.NEED[action] or 2), score, why
end

---------------------------------------------------------------------------
-- Once a day, per person, per action
---------------------------------------------------------------------------
function Pers.LastTry(mem, action)
  return mem and mem.persuade and mem.persuade[action] or nil
end

function Pers.CanUse(mem, action, now)
  local last = Pers.LastTry(mem, action)
  return last == nil or ((now or C.Now()) - last) >= Pers.COOLDOWN
end

---------------------------------------------------------------------------
-- The lasting effect on disposition
---------------------------------------------------------------------------
-- The modifier now, after it has faded (a whole number).
function Pers.Modifier(mem, now)
  local m = mem and mem.persuadeMod
  if type(m) ~= "table" or type(m.v) ~= "number" or m.v == 0 then return 0 end
  local days = math.max(0, ((now or C.Now()) - (m.t or 0)) / 86400)
  local left = math.max(0, math.abs(m.v) - days * Pers.DECAY_PER_DAY)
  local v = (m.v > 0 and 1 or -1) * left
  return v >= 0 and math.floor(v + 0.5) or -math.floor(-v + 0.5)
end

function Pers.AddModifier(mem, delta, now)
  if not mem or not delta or delta == 0 then return end
  now = now or C.Now()
  local m = mem.persuadeMod
  local cur = 0
  if type(m) == "table" and type(m.v) == "number" then
    local days = math.max(0, (now - (m.t or 0)) / 86400)
    local left = math.max(0, math.abs(m.v) - days * Pers.DECAY_PER_DAY)
    cur = (m.v > 0 and 1 or -1) * left
  end
  local v = math.max(-Pers.MOD_MAX, math.min(Pers.MOD_MAX, cur + delta))
  mem.persuadeMod = { v = v, t = now }
end

-- Try one: records the day's use and the modifier. Returns success, the disposition delta.
function Pers.Try(action, info, mem, ctx, now)
  now = now or C.Now()
  local ok = Pers.Check(action, info, mem, ctx, now)
  if mem then
    mem.persuade = mem.persuade or {}
    mem.persuade[action] = now
  end
  local eff = Pers.EFFECT[action] or {}
  local delta = ok and (eff.success or 0) or (eff.fail or 0)
  Pers.AddModifier(mem, delta, now)
  return ok, delta
end
