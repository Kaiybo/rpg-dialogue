-- Applies the effects of choices and lines (fx tables), and the journal.
-- Alignment math per DESIGN.md §3.9.
local _, ns = ...

local C = ns.Compat
local U = ns.Util
local Effects = {}
ns.Effects = Effects

Effects.KEYS = {
  align = true, big = true, taint = true, trait = true, opinion = true, flag = true, claim = true,
  affinity = true, standing = true, thread = true, hear = true, expose = true, learn = true, npcFlag = true,
  insanity = true,
}

---------------------------------------------------------------------------
-- Alignment
---------------------------------------------------------------------------
-- Pushing further the same way has diminishing returns; pulling back is full strength.
function Effects.ShiftAxis(current, delta, big)
  if big then delta = delta * 2.5 end
  local applied = delta
  if (current >= 0 and delta > 0) or (current <= 0 and delta < 0) then
    applied = delta * (1 - math.abs(current) / 120)
  end
  return U.Clamp(current + applied, -100, 100)
end

function Effects.Align(deltas, big)
  local a = ns.char.align
  for axis, d in pairs(deltas) do
    if axis == "light" or axis == "order" or axis == "honor" then
      a[axis] = Effects.ShiftAxis(a[axis] or 0, d, big)
      a.lastShift = C.Now()
    end
  end
end

-- Slow drift toward zero beyond ±20 (1 point per 7 days), and taint decay.
function Effects.Drift(now)
  local a = ns.char.align
  local last = a.driftAt or now
  local weeks = math.floor((now - last) / 604800)
  if weeks <= 0 then a.driftAt = a.driftAt or now; return end
  for _, axis in ipairs({ "light", "order", "honor" }) do
    local v = a[axis] or 0
    if v > 20 then a[axis] = math.max(20, v - weeks) elseif v < -20 then a[axis] = math.min(-20, v + weeks) end
  end
  local taintDecay = math.floor((now - last) / 864000)
  if taintDecay > 0 then a.taint = math.max(0, (a.taint or 0) - taintDecay) end
  a.driftAt = last + weeks * 604800
end

-- Alignment titles: regions of the three-axis space, worded by faction.
Effects.TITLES = {
  { id = "lightsworn", test = function(a) return a.light >= 50 end, Alliance = "Lightsworn", Horde = "Sunwalker-hearted" },
  { id = "shadowed", test = function(a) return a.light <= -50 end, Alliance = "Shadowed", Horde = "Shadow-touched" },
  { id = "lawkeeper", test = function(a) return a.order >= 50 end, Alliance = "Lawkeeper", Horde = "Loyal Blade" },
  { id = "wildborn", test = function(a) return a.order <= -50 end, Alliance = "Wild Heart", Horde = "Spirit-walker" },
  { id = "oathbound", test = function(a) return a.honor >= 50 end, Alliance = "Oathbound", Horde = "Honor-bound" },
  { id = "silvertongue", test = function(a) return a.honor <= -50 end, Alliance = "Silvertongue", Horde = "Shadow-dealer" },
}

function Effects.Title()
  local a = ns.char.align
  local best, bestMag
  for _, t in ipairs(Effects.TITLES) do
    if t.test(a) then
      local mag = math.max(math.abs(a.light), math.abs(a.order), math.abs(a.honor))
      if not best or mag > bestMag then best, bestMag = t, mag end
    end
  end
  return best and best.id or nil
end

function Effects.TitleName()
  local id = Effects.Title()
  if not id then return nil end
  local faction = C.Faction("player") or "Alliance"
  for _, t in ipairs(Effects.TITLES) do
    if t.id == id then return t[faction] or t.Alliance end
  end
end

---------------------------------------------------------------------------
-- Traits
---------------------------------------------------------------------------
Effects.TRAITS = { "witty", "stern", "kind", "cruel", "pious", "skeptical", "greedy", "generous", "curious", "brave", "cautious" }

-- Top two traits with at least 3 points.
function Effects.DominantTraits()
  local list = {}
  for name, n in pairs(ns.char.traits) do
    if type(n) == "number" and n >= 3 then list[#list + 1] = { name = name, n = n } end
  end
  table.sort(list, function(a, b) if a.n ~= b.n then return a.n > b.n end return a.name < b.name end)
  local out = {}
  for i = 1, math.min(2, #list) do out[i] = list[i].name end
  return out
end

---------------------------------------------------------------------------
-- Town standing
---------------------------------------------------------------------------
Effects.TIERS = {
  { name = "Reviled", max = -60 }, { name = "Distrusted", max = -20 }, { name = "Stranger", max = 9 },
  { name = "Known", max = 29 }, { name = "Liked", max = 54 }, { name = "Respected", max = 79 },
  { name = "Hero", max = 100 },
}

function Effects.TierName(value)
  for _, t in ipairs(Effects.TIERS) do
    if value <= t.max then return t.name end
  end
  return "Hero"
end

function Effects.Standing(town, delta, spread)
  local towns = ns.char.towns
  local rec = towns[town] or { value = 0 }
  towns[town] = rec
  rec.value = U.Clamp((rec.value or 0) + delta, -100, 100)
  rec.t = C.Now()
  if spread ~= false and ns.Data and ns.Data.towns[town] then
    for other, frac in pairs(ns.Data.towns[town].related or {}) do
      Effects.Standing(other, delta * frac, false)
    end
  end
end

---------------------------------------------------------------------------
-- Apply an fx table. env: { info, mem, now, conv }
---------------------------------------------------------------------------
function Effects.Apply(fx, env)
  if type(fx) ~= "table" then return end
  local c = ns.char
  local now = env.now or C.Now()
  if fx.align then Effects.Align(fx.align, fx.big or env.nodeBig) end
  if fx.taint then c.align.taint = U.Clamp((c.align.taint or 0) + fx.taint, 0, 100) end
  if fx.trait then
    for name, n in pairs(fx.trait) do c.traits[name] = (c.traits[name] or 0) + n end
  end
  if fx.opinion then
    local who = env.info and (env.info.key or env.info.name)
    for topic, stance in pairs(fx.opinion) do
      local prev = c.opinions[topic]
      local rec = { stance = stance, said = env.said, t = now, npc = who, communities = env.info and env.info.communities, heardBy = {} }
      if prev and prev.stance ~= stance then
        rec.contradicts = { stance = prev.stance, npc = prev.npc, t = prev.t, communities = prev.communities }
      end
      if prev and prev.heardBy then for k, v in pairs(prev.heardBy) do rec.heardBy[k] = v end end
      if who then rec.heardBy[who] = now end
      c.opinions[topic] = rec
    end
  end
  if fx.flag then
    for _, f in ipairs(U.AsList(fx.flag.set)) do c.flags[f] = now end
    for _, f in ipairs(U.AsList(fx.flag.clear)) do c.flags[f] = nil end
  end
  if fx.npcFlag and env.mem then
    for _, f in ipairs(U.AsList(fx.npcFlag.set)) do env.mem.flags[f] = now end
    for _, f in ipairs(U.AsList(fx.npcFlag.clear)) do env.mem.flags[f] = nil end
  end
  if fx.claim then
    local id = type(fx.claim) == "table" and fx.claim.id or fx.claim
    c.claims.player[id] = { t = now, npc = env.info and (env.info.key or env.info.name) }
  end
  if fx.affinity and env.mem then
    env.mem.affinity = U.Clamp((env.mem.affinity or 0) + fx.affinity, -10, 10)
  end
  if fx.standing then
    for town, d in pairs(fx.standing) do Effects.Standing(town, d) end
  end
  if fx.thread then
    local id = fx.thread.id or fx.thread[1]
    local t = c.threads[id] or { state = "dormant", beats = {}, choices = {} }
    c.threads[id] = t
    if fx.thread.beat then t.beats[fx.thread.beat] = now end
    if fx.thread.state then t.state = fx.thread.state end
    if fx.thread.choice then t.choices[#t.choices + 1] = { id = fx.thread.choice, t = now } end
    t.t = now
  end
  if fx.hear then
    for _, id in ipairs(U.AsList(fx.hear)) do
      c.claims.heard[id] = c.claims.heard[id] or { t = now, npc = env.info and (env.info.key or env.info.name) }
    end
  end
  if fx.expose then
    for _, id in ipairs(U.AsList(fx.expose)) do c.claims.exposed[id] = c.claims.exposed[id] or now end
  end
  if fx.insanity and ns.Insanity then ns.Insanity.Add(fx.insanity) end
  if fx.learn then
    for _, id in ipairs(U.AsList(fx.learn)) do
      if not c.topics[id] then
        c.topics[id] = { t = now, from = env.info and (env.info.key or env.info.name) }
        ns.Fire("TOPIC_LEARNED", id)
      end
    end
  end
end

---------------------------------------------------------------------------
-- Journal
---------------------------------------------------------------------------
function Effects.Journal(template, ctx, env)
  if type(template) ~= "table" then return end
  local voice = (ns.db and ns.db.settings.journalVoice) or "first"
  local text = template[voice] or template.first or template.third
  if not text then return end
  local c = ns.char
  local rendered = ns.Tokens.Render(text, ctx, env)
  local otherHand = ns.Insanity and ns.Insanity.Strength() > 0.5
  if otherHand then rendered = ns.Insanity.Scramble(rendered, 0.6, #c.journal) end
  c.journal[#c.journal + 1] = {
    t = env.now or C.Now(),
    zone = ctx.zone, subzone = ctx.subzone,
    npc = env.info and env.info.name, key = env.info and env.info.key,
    text = rendered, voice = voice, otherHand = otherHand or nil,
  }
  if ns.UI and ns.UI.Launcher and ns.UI.Launcher.UpdateBadge then ns.UI.Launcher.UpdateBadge() end
end
