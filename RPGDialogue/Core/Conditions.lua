-- Condition keys: how each is evaluated, how much it adds to a line's score, whether it's
-- a "hinge" (a fact about the player) or a "gate" (bookkeeping), and which pacing system
-- it draws from. Weights follow DESIGN.md §2.7 / §3.3.
local _, ns = ...

local U = ns.Util
local Cond = {}
ns.Conditions = Cond

Cond.defs = {}

local function def(key, weight, kind, sys, eval)
  Cond.defs[key] = { weight = weight, kind = kind, sys = sys, eval = eval }
end

---------------------------------------------------------------------------
-- Value helpers
---------------------------------------------------------------------------
-- expected may be a scalar or a list (any of).
local function matches(actual, expected)
  if type(expected) == "table" and expected.todo == nil and expected.min == nil and expected.max == nil then
    for i = 1, #expected do if actual == expected[i] then return true end end
    return false
  end
  return actual == expected
end

-- expected: number (minimum) or { min = , max = }
local function inRange(actual, expected)
  if type(actual) ~= "number" then return false end
  if type(expected) == "number" then return actual >= expected end
  if type(expected) ~= "table" then return false end
  if expected.min and actual < expected.min then return false end
  if expected.max and actual > expected.max then return false end
  return true
end

local function show(v)
  if type(v) == "table" then
    if v.todo then return U.RefString(v) end
    local parts = {}
    for k, x in pairs(v) do parts[#parts + 1] = (type(k) == "number" and "" or (tostring(k) .. "=")) .. tostring(x) end
    table.sort(parts)
    return "{" .. table.concat(parts, ",") .. "}"
  end
  return tostring(v)
end
Cond.Show = show

-- Fact lookup with spoof support: ctx.spoofed[key] wins over the real value.
local function spoofOr(ctx, key, real)
  local s = ctx.spoofed and ctx.spoofed[key]
  if s ~= nil and s ~= true then return s end
  return real
end

-- Resolves a quest reference (number or TODO_QUEST) to an ID, or nil.
function Cond.QuestID(ref, env)
  if type(ref) == "number" then return ref end
  if U.IsTodo(ref) and ref.todo == "quest" then
    local cache = env and env.questIDs
    local key = ref.name
    if cache and cache[key] ~= nil then return cache[key] or nil end
    local id = env and env.titleToID and env.titleToID[U.Norm(ref.name)]
    if not id and ns.Capture then id = ns.Capture.QuestIDByTitle(ref.name) end
    if cache then cache[key] = id or false end
    return id
  end
  return nil
end

-- "before" | "active" | "ready" | "done" | nil (unknown)
function Cond.QuestState(ref, ctx, env)
  local id = Cond.QuestID(ref, env)
  if not id then return nil end
  local spoofed = ctx.questSpoof and ctx.questSpoof[id]
  if spoofed then return spoofed end
  return ns.Compat.QuestState(id)
end

-- Seconds since the addon saw this quest turned in, or nil.
local function sinceTurnIn(ref, ctx, env)
  local id = Cond.QuestID(ref, env)
  if not id then return nil end
  local t = ns.char.quests.turnedIn[id]
  if not t then
    if ctx.questSpoof and ctx.questSpoof[id] == "recent" then return 0 end
    return nil
  end
  return env.now - t
end

local function questArg(v)
  if type(v) == "table" and v.todo == nil and v[1] ~= nil then return v[1], v end
  return v, {}
end

---------------------------------------------------------------------------
-- Quest family. Time-sensitive states (active, objective, ready, recent) weigh 60, above
-- race+class combos (50). Long-tail states (before, done, later) stay eligible for weeks,
-- so they weigh less (45/40) and a combo line can win over them (DESIGN.md §3.3).
---------------------------------------------------------------------------
def("questBefore", 45, "hinge", nil, function(ctx, v, env)
  local st = Cond.QuestState(v, ctx, env)
  return st == "before", "quest " .. show(v) .. " is " .. tostring(st or "unresolved")
end)

def("questActive", 60, "hinge", nil, function(ctx, v, env)
  local st = Cond.QuestState(v, ctx, env)
  return st == "active" or st == "ready", "quest " .. show(v) .. " is " .. tostring(st or "unresolved")
end)

def("questReady", 60, "hinge", nil, function(ctx, v, env)
  local st = Cond.QuestState(v, ctx, env)
  return st == "ready", "quest " .. show(v) .. " is " .. tostring(st or "unresolved")
end)

def("questDone", 40, "hinge", nil, function(ctx, v, env)
  local st = Cond.QuestState(v, ctx, env)
  return st == "done" or st == "recent", "quest " .. show(v) .. " is " .. tostring(st or "unresolved")
end)

-- { Q, left = { min, max } }: objectives still outstanding (sum of need - have).
def("questObjective", 60, "hinge", nil, function(ctx, v, env)
  local ref, opts = questArg(v)
  local st = Cond.QuestState(ref, ctx, env)
  if st ~= "active" and st ~= "ready" then return false, "quest " .. show(ref) .. " not active" end
  local left = 0
  local spoofLeft = ctx.spoofed and ctx.spoofed.objectiveLeft
  if type(spoofLeft) == "number" then
    left = spoofLeft
  else
    for _, o in ipairs(ns.Compat.QuestObjectives(Cond.QuestID(ref, env))) do
      if not o.done then left = left + math.max(1, (o.need or 0) - (o.have or 0)) end
    end
  end
  local want = opts.left or { min = 1 }
  return inRange(left, want), "objectives left " .. left .. ", wanted " .. show(want)
end)

-- { Q, days = N }: turned in within N days (default 3)
def("questRecent", 60, "hinge", nil, function(ctx, v, env)
  local ref, opts = questArg(v)
  local since = sinceTurnIn(ref, ctx, env)
  local days = opts.days or 3
  if not since then return false, "no turn-in logged for " .. show(ref) end
  return since <= days * 86400, ("turned in %.1f days ago, wanted <= %s"):format(since / 86400, days)
end)

-- { Q, days = N }: turned in more than N days ago (default 3)
def("questLater", 40, "hinge", nil, function(ctx, v, env)
  local ref, opts = questArg(v)
  local since = sinceTurnIn(ref, ctx, env)
  local days = opts.days or 3
  if not since then
    -- Done before the addon was installed: counts as "later".
    local st = Cond.QuestState(ref, ctx, env)
    return st == "done", "quest " .. show(ref) .. " is " .. tostring(st or "unresolved")
  end
  return since > days * 86400, ("turned in %.1f days ago, wanted > %s"):format(since / 86400, days)
end)

---------------------------------------------------------------------------
-- Heard lines, threads, claims (60)
---------------------------------------------------------------------------
def("heardLine", 60, "hinge", nil, function(ctx, v, env)
  local spoofed = ctx.spoofed and ctx.spoofed.heard
  if spoofed == v then return true, "heard (spoofed)" end
  return ns.char.heard[v] ~= nil, "heardLine " .. tostring(v) .. (ns.char.heard[v] and "" or ": not heard")
end)

def("thread", 60, "hinge", nil, function(ctx, v, env)
  local t = ns.char.threads[v.id or v[1]]
  if not t then
    -- Untouched thread: it is dormant, and no beat has been heard yet.
    if v.state then return matches("dormant", v.state), "thread " .. show(v.id or v[1]) .. " untouched" end
    if v.beat then return false, "thread " .. show(v.id or v[1]) .. " untouched" end
    return true, "thread " .. show(v.id or v[1]) .. " untouched"
  end
  if v.state and not matches(t.state, v.state) then return false, "thread state " .. tostring(t.state) end
  if v.beat and not (t.beats and t.beats[v.beat]) then return false, "beat " .. v.beat .. " not heard" end
  if v.notBeat and t.beats and t.beats[v.notBeat] then return false, "beat " .. v.notBeat .. " already heard" end
  return true, "thread " .. show(v.id or v[1])
end)

-- The player claimed something (fx.claim) that their real history contradicts: the claim's
-- definition says when it would be true (trueWhen), and that isn't the case.
def("lieCaught", 60, "hinge", nil, function(ctx, v, env)
  if not ns.char.claims.player[v] then return false, "player never claimed " .. tostring(v) end
  local claim = ns.Data and ns.Data.claims[v]
  if not claim or not claim.trueWhen then return false, "claim " .. tostring(v) .. " can't be checked" end
  local isTrue = Cond.Eval(claim.trueWhen, ctx, env)
  return not isTrue, isTrue and "the claim is true" or "the claim is false"
end)

def("heardClaim", 60, "hinge", nil, function(_, v)
  return ns.char.claims.heard[v] ~= nil, "claim " .. tostring(v)
end)
def("claimExposed", 60, "hinge", nil, function(_, v)
  return ns.char.claims.exposed[v] ~= nil, "claim exposed " .. tostring(v)
end)
def("claim", 60, "hinge", nil, function(_, v)
  return ns.char.claims.player[v] ~= nil, "player claim " .. tostring(v)
end)

---------------------------------------------------------------------------
-- Deeds and deaths (40)
---------------------------------------------------------------------------
def("deed", 40, "hinge", nil, function(ctx, v)
  local spoofed = ctx.spoofed and ctx.spoofed.deed
  if spoofed == v then return true, "deed (spoofed)" end
  return ns.char.deeds[v] ~= nil, "deed " .. tostring(v)
end)

-- Creatures you or your party have killed, tallied by name (Trackers.Kill).
-- killed = { name = "Defias", min = 20 } : names containing any of the words (case-insensitive)
-- killed = { min = 1000 }               : every kill
-- Spoof with killed = 50 (any matching tally reads as 50).
def("killed", 40, "hinge", nil, function(ctx, v)
  if type(v) ~= "table" then v = { min = tonumber(v) or 1 } end
  local spoofed = ctx.spoofed and ctx.spoofed.killed
  local kills = ns.char.kills or { total = 0, byName = {} }
  local n
  if type(spoofed) == "number" then
    n = spoofed
  elseif not v.name then
    n = kills.total or 0
  else
    n = 0
    local words = {}
    for _, w in ipairs(U.AsList(v.name)) do words[#words + 1] = tostring(w):lower() end
    for name, count in pairs(kills.byName or {}) do
      local lower = name:lower()
      for i = 1, #words do
        if lower:find(words[i], 1, true) then n = n + count; break end
      end
    end
  end
  local range = { min = v.min or 1, max = v.max }
  return inRange(n, range), "killed " .. show(v.name or "anything") .. ": " .. n
end)

-- Dungeons whose last boss you or your party have killed (World.DUNGEON_BOSSES; 0.58.0).
-- cleared = "Uldaman" | { "Uldaman", "Zul'Farrak" } (any of) | { name = "Uldaman", not = true }
-- Spoof with cleared = "Uldaman" (or a list), or true for every place.
function Cond.Cleared(place, spoofed)
  if spoofed == true then return true end
  if spoofed ~= nil then
    for _, p in ipairs(U.AsList(spoofed)) do if p == place then return true end end
  end
  if ns.char.deeds and ns.char.deeds["cleared:" .. place] then return true end
  local bosses = ns.World.DUNGEON_BOSSES[place]
  local byName = ns.char.kills and ns.char.kills.byName or {}
  for _, b in ipairs(bosses or {}) do
    if (byName[b] or 0) > 0 then return true end
  end
  return false
end
def("cleared", 40, "hinge", nil, function(ctx, v)
  local spoofed = ctx.spoofed and ctx.spoofed.cleared
  local negate = false
  if type(v) == "table" and v.name then negate = v["not"] == true; v = v.name end
  for _, place in ipairs(U.AsList(v)) do
    if Cond.Cleared(place, spoofed) then
      if negate then return false, "cleared " .. place end
      return true, "cleared " .. place
    end
  end
  if negate then return true, "not cleared " .. show(v) end
  return false, "not cleared " .. show(v)
end)

def("deaths", 40, "hinge", "death", function(ctx, v)
  local n = spoofOr(ctx, "deaths", ns.char.deathCount or 0)
  return inRange(n, v), "deaths " .. n .. ", wanted " .. show(v)
end)

-- Deaths in the same place as the last one, within `days` (default 7): { min = 3, days = 7 }
def("deathsHere", 40, "hinge", "death", function(ctx, v, env)
  local deaths = ns.char.deaths
  local last = deaths[#deaths]
  local n = spoofOr(ctx, "deathsHere", nil)
  if n == nil then
    n = 0
    if last then
      local cutoff = (env.now or 0) - (v.days or 7) * 86400
      for i = #deaths, 1, -1 do
        local d = deaths[i]
        if (d.t or 0) < cutoff then break end
        if d.subzone == last.subzone and d.zone == last.zone then n = n + 1 end
      end
    end
  end
  return inRange(n, v), "deaths in the same place " .. n
end)

-- Days since the previous death (before the current one, if the player is a ghost now).
def("daysSinceDeath", 40, "hinge", "death", function(ctx, v, env)
  local deaths = ns.char.deaths
  local prev = deaths[#deaths - 1]
  local days = spoofOr(ctx, "daysSinceDeath", prev and ((env.now or 0) - (prev.t or 0)) / 86400 or nil)
  if not days then return false, "no earlier death" end
  return inRange(days, v), ("%.1f days between deaths"):format(days)
end)

-- The player has been to a subzone (recorded by the addon).
def("visited", 15, "hinge", nil, function(ctx, v)
  local places = ns.char.places or {}
  return places[v] ~= nil, "visited " .. tostring(v)
end)

def("deathCause", 40, "hinge", "death", function(ctx, v)
  local last = ns.char.deaths[#ns.char.deaths]
  local cause = spoofOr(ctx, "deathCause", last and last.cause)
  return matches(cause, v), "last death cause " .. tostring(cause)
end)

---------------------------------------------------------------------------
-- Origin (35), identity (25), character (30), dark (40), knowledge (30)
---------------------------------------------------------------------------
def("origin", 35, "hinge", "origin", function(ctx, v)
  local o = spoofOr(ctx, "origin", ns.char.origin and ns.char.origin.id)
  return o ~= nil and o ~= "other" and matches(o, v), "origin " .. tostring(o)
end)

def("race", 25, "hinge", nil, function(ctx, v)
  return matches(ctx.race, v), "race: " .. tostring(ctx.race) .. ", wanted " .. show(v)
end)

def("class", 25, "hinge", nil, function(ctx, v)
  return matches(ctx.class, v), "class: " .. tostring(ctx.class) .. ", wanted " .. show(v)
end)

-- { axis = "light", min = , max = }
def("alignment", 30, "hinge", "alignment", function(ctx, v)
  local axis = v.axis or "light"
  local val = spoofOr(ctx, axis, ns.char.align[axis] or 0)
  return inRange(val, v), axis .. " " .. val .. ", wanted " .. show(v)
end)

def("title", 30, "hinge", "alignment", function(ctx, v)
  local t = ns.Effects and ns.Effects.Title() or nil
  t = spoofOr(ctx, "alignTitle", t)
  return matches(t, v), "title " .. tostring(t)
end)

-- Honor rank, 1 (Private/Scout) to 14 (Grand Marshal/High Warlord); 0 is none.
-- pvpRank = 6 (minimum) | { min = 1, max = 5 } | false (no rank).
def("pvpRank", 30, "hinge", nil, function(ctx, v)
  local r = ctx.pvpRank or 0
  if v == false then return r == 0, "honor rank " .. r end
  if v == true then return r > 0, "honor rank " .. r end
  return inRange(r, v), "honor rank " .. r
end)

-- Passes when v is one of the character's dominant traits (top two, count >= 3).
def("trait", 30, "hinge", "trait", function(ctx, v)
  local spoofed = ctx.spoofed and ctx.spoofed.trait
  if spoofed then return matches(spoofed, v), "trait (spoofed) " .. tostring(spoofed) end
  local dom = ns.Effects and ns.Effects.DominantTraits() or {}
  for _, t in ipairs(dom) do if matches(t, v) then return true, "dominant trait " .. t end end
  return false, "dominant traits: " .. (#dom > 0 and table.concat(dom, ", ") or "none")
end)

-- { topic = , stance = }
def("opinion", 30, "hinge", "opinion", function(ctx, v)
  local o = ns.char.opinions[v.topic or v[1]]
  local stance = o and o.stance
  return stance ~= nil and (v.stance == nil or matches(stance, v.stance)), "opinion " .. show(v.topic or v[1]) .. " = " .. tostring(stance)
end)

-- Gossip network: the player told someone else in this NPC's community their opinion on a
-- topic, long enough ago for word to spread, and word reached this NPC (a stable roll per
-- NPC and opinion). { topic = , stance = , delay = 600, chance = 0.6 }
def("gossip", 30, "hinge", "opinion", function(ctx, v, env)
  local topic = v.topic or v[1]
  local o = ns.char.opinions[topic]
  if not o then return false, "no opinion on " .. tostring(topic) end
  if v.stance and not matches(o.stance, v.stance) then return false, "opinion is " .. tostring(o.stance) end
  local info = env.info or {}
  local me = info.key or info.name
  if o.npc == me then return false, "told this NPC directly" end
  local shared = false
  for _, c in ipairs(o.communities or {}) do
    if U.Contains(info.communities or {}, c) then shared = true end
  end
  if not shared then return false, "told outside this community" end
  if (env.now or 0) - (o.t or 0) < (v.delay or 600) then return false, "word hasn't spread yet" end
  local roll = (U.Hash(me, topic, o.t or 0) % 1000) / 1000
  local p = v.chance or 0.6
  return roll < p, ("word reached them (%.2f < %.2f)"):format(roll, p)
end)

-- The player said conflicting things about a topic, both within this NPC's community.
def("contradiction", 40, "hinge", "opinion", function(ctx, v, env)
  local topic = type(v) == "table" and (v.topic or v[1]) or v
  local o = ns.char.opinions[topic]
  local prev = o and o.contradicts
  if not prev then return false, "no contradiction on " .. tostring(topic) end
  local comms = (env.info and env.info.communities) or {}
  local function heardHere(list)
    for _, c in ipairs(list or {}) do if U.Contains(comms, c) then return true end end
    return false
  end
  return heardHere(o.communities) and heardHere(prev.communities), "contradiction on " .. tostring(topic)
end)

def("taint", 40, "hinge", "taint", function(ctx, v)
  local t = spoofOr(ctx, "taint", ns.char.align.taint or 0)
  return inRange(t, v), "taint " .. t
end)

def("insanity", 40, "hinge", "insanity", function(ctx, v)
  local i = spoofOr(ctx, "insanity", ns.char.insanity.level or 0)
  return inRange(i, v), "insanity " .. i
end)

def("topicKnown", 30, "hinge", nil, function(_, v)
  return ns.char.topics[v] ~= nil, "topic " .. tostring(v)
end)

def("bookRead", 30, "hinge", "book", function(_, v)
  return ns.char.books[v] ~= nil, "book " .. tostring(v)
end)

def("homeInn", 30, "hinge", nil, function(ctx, v)
  local home = spoofOr(ctx, "homeInn", ns.char.homeInn and ns.char.homeInn.name)
  if v == true then return home ~= nil and home == ctx.subzone, "home inn " .. tostring(home) end
  return matches(home, v), "home inn " .. tostring(home)
end)

---------------------------------------------------------------------------
-- Relationship (20)
---------------------------------------------------------------------------
local function mem(env) return env.mem or {} end

def("metBefore", 20, "hinge", nil, function(ctx, v, env)
  local met = spoofOr(ctx, "metBefore", (mem(env).times or 0) > 0)
  return met == v, "met before: " .. tostring(met)
end)

def("timesTalked", 20, "hinge", nil, function(ctx, v, env)
  local n = spoofOr(ctx, "timesTalked", mem(env).times or 0)
  return inRange(n, v), "times talked " .. n
end)

def("daysSince", 20, "hinge", nil, function(ctx, v, env)
  local last = mem(env).last
  local days = spoofOr(ctx, "daysSince", last and (env.now - last) / 86400 or nil)
  if not days then return false, "never talked" end
  return inRange(days, v), ("days since %.1f"):format(days)
end)

def("affinity", 20, "hinge", nil, function(ctx, v, env)
  local a = spoofOr(ctx, "affinity", mem(env).affinity or 0)
  return inRange(a, v), "affinity " .. a
end)

-- Your affinity with a named NPC other than this one (0.55.0): { npc = "fandral", min = , max = }.
-- Someone you've never met counts as 0.
def("affinityWith", 30, "hinge", nil, function(ctx, v, env)
  local key = type(v) == "table" and (v.npc or v[1]) or v
  local m = key and ns.char.npc and ns.char.npc[key]
  local a = m and m.affinity or 0
  local range = type(v) == "table" and v or { min = 1 }
  return inRange(a, { min = range.min, max = range.max }), "affinity with " .. tostring(key) .. " " .. a
end)

-- Your best affinity with any of this NPC's `rivals` (0.55.0): { min = , max = }, or a
-- number as a minimum. With max only, it's your worst (you've crossed a rival).
def("rivalFavor", 30, "hinge", nil, function(ctx, v, env)
  local def = env.info and env.info.def
  local rivals = ns.Disposition and ns.Disposition.Rivals(def) or {}
  if #rivals == 0 then return false, "no rivals" end
  local best, worst
  for _, r in ipairs(rivals) do
    local m = ns.char.npc and ns.char.npc[r]
    local a = m and m.affinity or 0
    best = best and math.max(best, a) or a
    worst = worst and math.min(worst, a) or a
  end
  local spoof = spoofOr(ctx, "rivalFavor", nil)
  if spoof then best, worst = spoof, spoof end
  if type(v) == "table" and v.max and not v.min then
    return worst <= v.max, "rival affinity (worst) " .. worst
  end
  return inRange(best, v), "rival affinity " .. best
end)

-- How this person regards you, 0-100 (Systems/Disposition.lua): { min = , max = }.
-- 20-34 cold, 45-59 neutral, 60-74 warm, 75-89 friendly, 90+ devoted.
def("disposition", 20, "hinge", nil, function(ctx, v, env)
  local d = ns.Disposition and ns.Disposition.For(env, ctx) or 50
  return inRange(d, v), "disposition " .. d
end)

-- { town = , min = , max = } or { town = , tier = "Liked" }
def("townStanding", 20, "hinge", nil, function(ctx, v, env)
  local town = v.town or v[1] or (env.info and env.info.communities and env.info.communities[1])
  local val = spoofOr(ctx, "townStanding", (ns.char.towns[town] and ns.char.towns[town].value) or 0)
  if v.tier then
    local tier = ns.Effects and ns.Effects.TierName(val) or "Stranger"
    return matches(tier, v.tier), town .. " standing " .. tier
  end
  return inRange(val, v), town .. " standing " .. val
end)

---------------------------------------------------------------------------
-- State and world (15)
---------------------------------------------------------------------------
local function ctxEq(key, weight)
  def(key, weight, "hinge", nil, function(ctx, v)
    return matches(ctx[key], v), key .. ": " .. tostring(ctx[key]) .. ", wanted " .. show(v)
  end)
end

local function ctxBool(key, weight)
  def(key, weight, "hinge", nil, function(ctx, v)
    return (ctx[key] == true) == (v == true), key .. ": " .. tostring(ctx[key])
  end)
end

local function ctxSet(key, field, weight)
  def(key, weight, "hinge", nil, function(ctx, v)
    local set = ctx[field] or {}
    for _, x in ipairs(U.AsList(v)) do if set[x] then return true, key .. ": " .. tostring(x) end end
    return false, key .. ": none of " .. show(v)
  end)
end

ctxEq("form", 15)
ctxBool("mounted", 15)
ctxBool("stealthed", 15)
ctxBool("ghost", 15)
ctxBool("resSick", 15)
ctxBool("camping", 15)
ctxBool("nearlyNaked", 15)
ctxSet("debuffType", "debuffTypes", 15)
ctxSet("aura", "auras", 15)
ctxSet("holiday", "holiday", 15)
ctxSet("outOfPlace", "outOfPlace", 15)
ctxEq("zone", 15)
ctxEq("subzone", 15)
ctxEq("power", 15)
ctxEq("tabard", 15)

def("drunk", 15, "hinge", nil, function(ctx, v)
  local d = ctx.drunk or 0
  if v == true then return d >= 1, "drunk " .. d end
  if v == false then return d == 0, "drunk " .. d end
  return inRange(d, v), "drunk " .. d
end)

-- { max = 0.25 } (ratio 0..1)
def("durability", 15, "hinge", nil, function(ctx, v)
  local d = ctx.durability
  if type(d) ~= "number" then return false, "no durability items" end
  return inRange(d, v), ("durability %.2f"):format(d)
end)

def("equipped", 15, "hinge", nil, function(ctx, v)
  local set = ctx.equipped or {}
  for _, id in ipairs(U.AsList(v)) do if set[id] then return true, "wearing " .. tostring(id) end end
  return false, "not wearing " .. show(v)
end)

-- { family = "Imp" } | { type = "Beast" } | { named = "Spot" } | true
def("pet", 15, "hinge", nil, function(ctx, v)
  local p = ctx.pet
  if v == false then return not p, "pet: " .. tostring(p and p.family) end
  if not p then return false, "no pet" end
  if v == true then return true, "has pet" end
  if v.family and not matches(p.family, v.family) then return false, "pet family " .. tostring(p.family) end
  if v.type and not matches(p.type, v.type) then return false, "pet type " .. tostring(p.type) end
  if v.named and p.name ~= v.named then return false, "pet name " .. tostring(p.name) end
  return true, "pet " .. tostring(p.family)
end)

-- { faction = factionID, min = standingID (1-8) }
def("rep", 15, "hinge", nil, function(ctx, v)
  local spoofed = ctx.spoofed and ctx.spoofed.rep
  local standing = type(spoofed) == "number" and spoofed or ns.Compat.Rep(v.faction or v[1])
  if not standing then return false, "unknown reputation" end
  return inRange(standing, v), "standing " .. standing
end)

-- { name = "Mining", min = 75 }
def("profession", 15, "hinge", nil, function(ctx, v)
  local name = type(v) == "string" and v or (v.name or v[1])
  local skill = (ctx.professions or {})[name]
  if not skill then return false, "no " .. tostring(name) end
  if type(v) == "table" and not inRange(skill, v) then return false, name .. " " .. skill end
  return true, name .. " " .. skill
end)

-- reputation = { faction = "Stormwind", min = "exalted" } (or max; standings by name or 1-8).
-- Spoof with reputation = { Stormwind = 8 }.
local function standingOf(ctx, faction)
  local W = ns.World
  local id = type(faction) == "number" and faction or W.FACTION_IDS[faction]
  if not id then return nil end
  local sp = ctx.spoofed and ctx.spoofed.reputation
  if type(sp) == "table" then return sp[faction] or sp[id] end
  local cache = rawget(ctx, "_rep")
  if not cache then cache = {}; rawset(ctx, "_rep", cache) end
  if cache[id] == nil then cache[id] = tonumber((ns.Compat.Rep(id))) or false end
  return cache[id] or nil
end

def("reputation", 15, "hinge", nil, function(ctx, v)
  if type(v) ~= "table" then return false, "reputation needs a table" end
  local S = ns.World.STANDINGS
  local s = standingOf(ctx, v.faction)
  if not s then return false, "reputation with " .. tostring(v.faction) .. ": unknown" end
  local lo, hi = S[v.min] or tonumber(v.min), S[v.max] or tonumber(v.max)
  return (not lo or s >= lo) and (not hi or s <= hi), "reputation with " .. tostring(v.faction) .. ": " .. s
end)

-- PvP. pvpFlagged true/false; honorKills / dishonorKills { min, max } or a number (minimum).
ctxBool("pvpFlagged", 15)
def("honorKills", 15, "hinge", nil, function(ctx, v)
  local n = ctx.honorKills
  if type(n) ~= "number" then return false, "no honor record" end
  return inRange(n, v), "honorable kills " .. n
end)
def("dishonorKills", 15, "hinge", nil, function(ctx, v)
  local n = ctx.dishonorKills
  if type(n) ~= "number" then return false, "no honor record" end
  return inRange(n, v), "dishonorable kills " .. n
end)

-- guild = true (in any guild) | false (in none) | "Name" or a list of names.
-- guildRank = "Officer" or a list (the rank's name as the guild set it).
def("guild", 15, "hinge", nil, function(ctx, v)
  local g = ctx.guild
  if v == true then return g ~= nil and g ~= false, "guild: " .. tostring(g) end
  if v == false then return not g, "guild: " .. tostring(g) end
  return g and matches(g, v) or false, "guild: " .. tostring(g)
end)
def("guildRank", 15, "hinge", nil, function(ctx, v)
  local r = ctx.guildRank
  return r and matches(r, v) or false, "guild rank: " .. tostring(r)
end)

-- Items in your bags (or worn): carrying = itemID | { ids } | { id = itemID, min = 5 }.
-- Spoof with carrying = { [itemID] = count }.
def("carrying", 15, "hinge", nil, function(ctx, v)
  local sp = ctx.spoofed and ctx.spoofed.carrying
  local cache = rawget(ctx, "_items")
  if not cache then cache = {}; rawset(ctx, "_items", cache) end
  local function count(id)
    if type(sp) == "table" then return sp[id] or 0 end
    if cache[id] == nil then cache[id] = tonumber(ns.Compat.ItemCount(id)) or 0 end
    return cache[id]
  end
  if type(v) == "table" and v.id then
    local n = 0
    for _, id in ipairs(U.AsList(v.id)) do n = n + count(id) end
    return inRange(n, { min = v.min or 1, max = v.max }), "carrying " .. show(v.id) .. " x" .. n
  end
  for _, id in ipairs(U.AsList(v)) do
    if count(id) > 0 then return true, "carrying " .. tostring(id) end
  end
  return false, "not carrying " .. show(v)
end)

---------------------------------------------------------------------------
-- Level and place (10)
---------------------------------------------------------------------------
ctxEq("band", 10)
ctxBool("capital", 10)
ctxBool("resting", 10)
ctxBool("atInn", 10)

-- Copper, as GetMoney() reports it: { min = 1000000 } is 100 gold.
def("money", 10, "hinge", nil, function(ctx, v)
  local m = ctx.money or 0
  return inRange(m, v), "money " .. m
end)

def("minLevel", 10, "hinge", nil, function(ctx, v)
  return ctx.level >= v, "level " .. ctx.level
end)
def("maxLevel", 10, "hinge", nil, function(ctx, v)
  return ctx.level <= v, "level " .. ctx.level
end)

---------------------------------------------------------------------------
-- Small touches (5)
---------------------------------------------------------------------------
ctxEq("gender", 5)
ctxEq("faction", 5)
def("timeOfDay", 5, "hinge", nil, function(ctx, v)
  return matches(ctx.tod, v), "time of day: " .. tostring(ctx.tod)
end)
-- Who you travel with (0.59.0 widened it and raised its weight from 5 to 25).
-- party = true                         : anyone in your party
-- party = { race =, class =, gender = } : a member matching all given (each may be a list)
-- party = { kin = true }               : a member of your own race; { sameClass = true }: your class
-- party = { size = 4 } / { size = { min = 2, max = 3 } } : how many others (size = 0 is alone)
-- party = { class = ..., ["not"] = true } : in a party, with no such member (size still applies)
-- party = { size = ..., ["not"] = true }  : not that size
-- Spoof with party = { { race = "Dwarf", class = "WARRIOR", name = "Brann" }, ... }.
local function memberMatches(ctx, m, v)
  if v.race and not matches(m.race, v.race) then return false end
  if v.class and not matches(m.class, v.class) then return false end
  if v.gender and m.gender ~= v.gender then return false end
  if v.kin and m.race ~= ctx.race then return false end
  if v.sameClass and m.class ~= ctx.class then return false end
  return true
end

local function partyList(ctx)
  local s = ctx.spoofed and ctx.spoofed.party
  if type(s) == "table" then return s end
  return ctx.party or {}
end

-- The first member a `party` condition picks out (for the {companion} token), or nil.
function Cond.PartyMatch(ctx, v)
  local list = partyList(ctx)
  if type(v) ~= "table" then return list[1] end
  for _, m in ipairs(list) do
    if memberMatches(ctx, m, v) then return m end
  end
  return list[1]
end

def("party", 25, "hinge", nil, function(ctx, v)
  local list = partyList(ctx)
  if v == true then return #list > 0, "party of " .. #list end
  if v == false then return #list == 0, "party of " .. #list end
  if type(v) ~= "table" then return false, "bad party spec" end
  local negate = v["not"] == true
  local sizeOk = true
  if v.size ~= nil then
    sizeOk = inRange(#list, type(v.size) == "number" and { min = v.size, max = v.size } or v.size)
  end
  local ok
  if v.race or v.class or v.gender or v.kin or v.sameClass then
    -- `not` flips the member test only: "a party, but nobody like that in it".
    local found = false
    for _, m in ipairs(list) do
      if memberMatches(ctx, m, v) then found = true; break end
    end
    if negate then found = not found and #list > 0 end
    ok = sizeOk and found
  elseif v.size ~= nil then
    ok = sizeOk
    if negate then ok = not ok end
  else
    ok = #list > 0
    if negate then ok = not ok end
  end
  return ok, (ok and "party matches " or "party doesn't match ") .. show(v) .. " (" .. #list .. " others)"
end)

---------------------------------------------------------------------------
-- Gates (0)
---------------------------------------------------------------------------
def("chance", 0, "gate", nil, function(_, v, env)
  local roll = env.rng and env.rng.next() or 0
  return roll < v, ("chance %.2f, rolled %.2f"):format(v, roll)
end)

def("flag", 0, "gate", nil, function(_, v)
  return ns.char.flags[v] ~= nil, "flag " .. tostring(v)
end)

def("npcFlag", 0, "gate", nil, function(_, v, env)
  local flags = mem(env).flags or {}
  return flags[v] ~= nil, "npc flag " .. tostring(v)
end)

-- An NPC flag set in an earlier conversation, not this one (memory's `last` is stamped
-- when a conversation ends). For "last time you said..." lines.
def("npcFlagBefore", 0, "gate", nil, function(_, v, env)
  local m = mem(env)
  local at = (m.flags or {})[v]
  return at ~= nil and m.last ~= nil and at <= m.last, "npc flag from an earlier visit " .. tostring(v)
end)

---------------------------------------------------------------------------
-- Evaluation
---------------------------------------------------------------------------
local evalAll

-- Returns pass, score, parts (list of "key+weight"), failReason
local function evalKey(key, v, ctx, env)
  if key == "all" then
    return evalAll(v, ctx, env)
  elseif key == "any" then
    local best, bestParts
    local reasons = {}
    for _, sub in ipairs(v) do
      local p, s, parts, why = evalAll(sub, ctx, env)
      if p and (not best or s > best) then best, bestParts = s, parts end
      if not p then reasons[#reasons + 1] = why end
    end
    if best then return true, best, bestParts end
    return false, 0, {}, "any: " .. table.concat(reasons, " / ")
  elseif key == "not" then
    local p = evalAll(v, ctx, env)
    if p then return false, 0, {}, "not: matched" end
    return true, 0, {}
  end
  local d = Cond.defs[key]
  if not d then return false, 0, {}, "unknown condition key " .. key end
  local pass, detail = d.eval(ctx, v, env)
  if not pass then return false, 0, {}, detail end
  return true, d.weight, { key .. " " .. d.weight }
end

-- when: table of conditions (all must pass). Keys are evaluated in sorted order so
-- RNG use (chance) is deterministic.
function evalAll(when, ctx, env)
  if when == nil then return true, 0, {} end
  local keys = U.Keys(when, true)
  local score, parts = 0, {}
  local hasRace, hasClass = false, false
  for _, key in ipairs(keys) do
    local pass, s, p, why = evalKey(key, when[key], ctx, env)
    if not pass then return false, 0, {}, why end
    score = score + s
    for i = 1, #p do parts[#parts + 1] = p[i] end
    if key == "race" then hasRace = true elseif key == "class" then hasClass = true end
  end
  return true, score, parts, nil, hasRace and hasClass
end

-- Returns pass, score, parts, failReason
function Cond.Eval(when, ctx, env)
  local pass, score, parts, why = evalAll(when, ctx, env)
  return pass, score, parts, why
end

-- Pacing systems a `when` table draws from (inferred from its keys).
function Cond.Systems(when, out)
  out = out or {}
  if type(when) ~= "table" then return out end
  for key, v in pairs(when) do
    if key == "all" or key == "not" then
      Cond.Systems(v, out)
    elseif key == "any" then
      for _, sub in ipairs(v) do Cond.Systems(sub, out) end
    else
      local d = Cond.defs[key]
      if d and d.sys then out[d.sys] = true end
    end
  end
  return out
end

-- Number of player "hinges" in a when table (for the "everything matters sometimes" rule).
function Cond.Hinges(when)
  local n = 0
  if type(when) ~= "table" then return 0 end
  for key, v in pairs(when) do
    if key == "all" then n = n + Cond.Hinges(v)
    elseif key == "any" then
      local best = 0
      for _, sub in ipairs(v) do best = math.max(best, Cond.Hinges(sub)) end
      n = n + best
    elseif key ~= "not" then
      local d = Cond.defs[key]
      if d and d.kind == "hinge" then n = n + 1 end
    end
  end
  return n
end

function Cond.IsKnown(key)
  return key == "all" or key == "any" or key == "not" or Cond.defs[key] ~= nil
end
