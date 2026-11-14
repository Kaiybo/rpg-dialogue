-- The specificity engine (DESIGN.md §3).
--   gather -> eligible -> fresh -> pace -> score -> pick (top band, weighted, seeded)
-- Every pick leaves a trace for /rpgd why.
local _, ns = ...

local C = ns.Compat
local U = ns.Util
local Cond = ns.Conditions
local Pacing = ns.Pacing

local Engine = {}
ns.Engine = Engine

Engine.BASE = { own = 400, generic = 0 }
Engine.TOP_BAND = 5
Engine.NEWS_THRESHOLD = 440
Engine.MAX_CHOICES = 4
Engine.traces = {}
Engine.forcedSeed = nil

---------------------------------------------------------------------------
-- Environment for one conversation
---------------------------------------------------------------------------
function Engine.NewEnv(info, ctx, mem)
  local now = C.Now()
  local day = math.floor(now / 86400)
  local seed = Engine.forcedSeed or U.Hash(info.key or info.name or "?", day, ns.char.conversations)
  Engine.forcedSeed = nil
  return {
    info = info, ctx = ctx, mem = mem, now = now, seed = seed, rng = U.NewRNG(seed),
    conv = { acks = 0, sys = {}, reacted = {}, beats = 0 },
    questIDs = {}, titleToID = {},
  }
end

---------------------------------------------------------------------------
-- Traces
---------------------------------------------------------------------------
local function newTrace(slot, env, extra)
  local info = env.info or {}
  local t = {
    slot = slot, npc = info.name, key = info.key, node = extra and extra.node, seed = env.seed,
    rows = {}, fails = {}, held = {}, notes = {}, t = env.now,
  }
  local ctx = env.ctx
  if ctx then
    t.ctx = ("%s %s %s (%s) · %s · %s"):format(tostring(ctx.race), tostring(ctx.class), tostring(ctx.level),
      tostring(ctx.band), tostring(ctx.tod), tostring(ctx.subzone ~= "" and ctx.subzone or ctx.zone))
  end
  return t
end

local function keepTrace(t)
  local list = Engine.traces
  list[#list + 1] = t
  if #list > 12 then table.remove(list, 1) end
end

---------------------------------------------------------------------------
-- Gathering
---------------------------------------------------------------------------
local function add(out, list, base, src)
  for _, line in ipairs(list or {}) do out[#out + 1] = { line = line, base = base, src = src } end
end

-- slot: "line" | "greeting" | "notice" | "react"
function Engine.Gather(slot, info, ctx, nodeId)
  local out = {}
  local def = info.def
  local own = Engine.BASE.own
  local isStart = (nodeId == nil) or (def and nodeId == def.start) or info.pooled
  if slot == "line" then
    if def and def.nodes and def.nodes[nodeId] then add(out, def.nodes[nodeId].lines, own, "own") end
    if not isStart then return out end
  elseif slot == "greeting" then
    if def then add(out, def.greetings, own, "own") end
  elseif slot == "notice" then
    if def then add(out, def.notice, own, "own") end
  elseif slot == "react" then
    if def then add(out, def.react, own, "own") end
  end
  if ns.Data then
    for _, p in ipairs(ns.Data.PoolsFor(info, ctx)) do
      local field = (slot == "line") and "lines" or (slot == "greeting" and "greetings" or slot)
      add(out, p.pool[field], p.base, "pool:" .. p.pool.id)
    end
    -- Generic lines are the last link of the line/greeting chains. Never acknowledgments.
    if slot == "line" or slot == "greeting" then
      for _, g in ipairs(ns.Data.GenericFor(ctx)) do
        add(out, slot == "line" and g.lines or g.greetings, Engine.BASE.generic, "generic:" .. g.id)
      end
    end
  end
  return out
end

---------------------------------------------------------------------------
-- The pick
---------------------------------------------------------------------------
local function systemsOf(line)
  if line.sys then
    local set = {}
    for _, s in ipairs(U.AsList(line.sys)) do set[s] = true end
    return set
  end
  return Cond.Systems(line.when)
end

-- opts: { node, filter = function(line, gid) return ok, why end, defaultOnce = bool }
-- Returns the winning candidate ({ line, gid, score, systems }) or nil, and the trace.
function Engine.Pick(slot, cands, ctx, env, opts)
  opts = opts or {}
  local trace = newTrace(slot, env, opts)
  local eligible = {}
  for i, cand in ipairs(cands) do
    local line = cand.line
    local gid = line._gid or (cand.src .. "#" .. i)
    local pass, score, parts, why = Cond.Eval(line.when, ctx, env)
    local seen = ns.char.seen[gid]
    local once = line.once or (opts.defaultOnce and not line.repeatable)
    if not pass then
      trace.fails[#trace.fails + 1] = { gid, why }
    elseif once and seen then
      trace.fails[#trace.fails + 1] = { gid, "once: already seen" }
    elseif Pacing.OnCooldown(line, gid, env) then
      trace.fails[#trace.fails + 1] = { gid, "cooldown " .. tostring(line.cooldown) }
    else
      local held
      if opts.filter then
        local ok, reason = opts.filter(line, gid)
        if not ok then held = reason end
      end
      local systems = systemsOf(line)
      if not held then
        for sys in pairs(systems) do
          local ok, reason = Pacing.Check(sys, env)
          if not ok then held = "pacing: " .. reason; break end
        end
      end
      if held then
        trace.held[#trace.held + 1] = { gid, held }
      else
        local total = cand.base + score + (line.priority or 0)
        local stale, factor = Pacing.Freshness(gid, slot, env)
        local label = (cand.src == "own" and "own" or cand.src) .. " " .. cand.base
        local desc = { label }
        for _, p in ipairs(parts) do desc[#desc + 1] = p end
        if line.priority then desc[#desc + 1] = "priority " .. line.priority end
        eligible[#eligible + 1] = {
          line = line, gid = gid, score = total, parts = table.concat(desc, " + "),
          stale = stale, factor = factor, systems = systems, seenAt = seen and seen.t or 0,
        }
      end
    end
  end

  table.sort(eligible, function(a, b)
    if a.score ~= b.score then return a.score > b.score end
    return a.gid < b.gid
  end)

  local winner
  local fresh = {}
  for _, e in ipairs(eligible) do if not e.stale then fresh[#fresh + 1] = e end end
  if #fresh > 0 then
    local max = fresh[1].score
    local band, total = {}, 0
    for _, e in ipairs(fresh) do
      if e.score >= max - Engine.TOP_BAND then
        local w = (e.line.weight or 1) * e.factor
        band[#band + 1] = { e = e, w = w }
        total = total + w
      end
    end
    local roll = env.rng.next() * total
    for _, b in ipairs(band) do
      roll = roll - b.w
      if roll < 0 then winner = b.e; break end
    end
    winner = winner or band[#band].e
  elseif #eligible > 0 then
    -- Everything was seen recently: repeat the one seen longest ago rather than go silent.
    table.sort(eligible, function(a, b) return a.seenAt < b.seenAt end)
    winner = eligible[1]
    trace.notes[#trace.notes + 1] = "all candidates seen recently; repeating the oldest"
  end

  for _, e in ipairs(eligible) do
    trace.rows[#trace.rows + 1] = { gid = e.gid, score = e.score, parts = e.parts, win = (e == winner), stale = e.stale }
  end
  trace.winner = winner and winner.gid
  keepTrace(trace)
  return winner, trace
end

---------------------------------------------------------------------------
-- Slots
---------------------------------------------------------------------------
function Engine.PickLine(info, nodeId, ctx, env, nodeBig)
  env.nodeBig = nodeBig
  local cands = Engine.Gather("line", info, ctx, nodeId)
  return Engine.Pick("line", cands, ctx, env, { node = nodeId })
end

function Engine.PickGreeting(info, ctx, env)
  local cands = Engine.Gather("greeting", info, ctx)
  return Engine.Pick("greeting", cands, ctx, env)
end

local function ackChance(ctx)
  local s = ctx.spoofed and ctx.spoofed.ackChance
  if type(s) == "number" then return s end
  return (ns.db and ns.db.settings.ackChance) or 0.35
end

-- Noticing moment, maybe. Returns winner or nil, trace.
function Engine.PickNotice(info, ctx, env)
  local memKey = ns.Memory.Key(info)
  if (env.conv.acks or 0) >= Pacing.ACK.perConversation then return nil end
  local roll = env.rng.next()
  local chance = ackChance(ctx)
  local cands = Engine.Gather("notice", info, ctx)
  if #cands == 0 then return nil end
  if roll >= chance then
    local t = newTrace("notice", env)
    t.notes[#t.notes + 1] = ("no noticing moment this time (roll %.2f > %.2f)"):format(roll, chance)
    keepTrace(t)
    return nil, t
  end
  local winner, trace = Engine.Pick("notice", cands, ctx, env, {
    defaultOnce = true,
    filter = function(line) return Pacing.AckAllowed(line.cat, memKey, env) end,
  })
  table.insert(trace.notes, 1, ("roll %.2f <= %.2f"):format(roll, chance))
  return winner, trace
end

function Engine.UseNotice(winner, info, env)
  Pacing.UseAck(winner.line.cat, ns.Memory.Key(info), env)
end

-- Live reaction to an event ("form", "pet", "mount", "stealth", "aura").
function Engine.PickReaction(info, event, ctx, env)
  local cands = {}
  for _, c in ipairs(Engine.Gather("react", info, ctx)) do
    if c.line.on == event then cands[#cands + 1] = c end
  end
  if #cands == 0 then return nil end
  local winner, trace = Engine.Pick("react", cands, ctx, env, {
    filter = function(_, gid)
      if env.conv.reacted[gid] then return false, "already reacted this conversation" end
      return true
    end,
  })
  if winner then env.conv.reacted[winner.gid] = true end
  return winner, trace
end

-- Does this NPC have "something new" (DESIGN.md §3.6)?
function Engine.HasNews(info, ctx, env)
  local def = info.def
  if not def or not def.nodes then return false end
  local node = def.nodes[def.start]
  if not node then return false end
  for _, line in ipairs(node.lines or {}) do
    local isNews = false
    for _, tag in ipairs(line.tags or {}) do if tag == "news" then isNews = true end end
    if isNews and not ns.char.seen[line._gid or ""] then
      local pass, score = Cond.Eval(line.when, ctx, env)
      if pass and Engine.BASE.own + score + (line.priority or 0) >= Engine.NEWS_THRESHOLD then
        local blocked = false
        for sys in pairs(systemsOf(line)) do
          if not Pacing.Check(sys, env) then blocked = true end
        end
        if not blocked then return true, line._gid end
      end
    end
  end
  return false
end

---------------------------------------------------------------------------
-- Choices
---------------------------------------------------------------------------
local SPECIAL = { Persuade = true, Intimidate = true, Deceive = true }
Engine.SPECIAL = SPECIAL

-- Visible choices for a node: { { choice, locked = bool }, ... } (at most MAX_CHOICES)
function Engine.Choices(node, ctx, env)
  local out = {}
  local showLocked = ns.db and ns.db.settings.showLocked
  for _, choice in ipairs(node and node.choices or {}) do
    local pass = Cond.Eval(choice.when, ctx, env)
    if pass then
      out[#out + 1] = { choice = choice }
    elseif showLocked and choice.tag then
      out[#out + 1] = { choice = choice, locked = true }
    end
    if #out >= Engine.MAX_CHOICES then break end
  end
  return out
end

-- Special reply options: success comes from who the player is, never dice.
function Engine.CheckChoice(choice, ctx, env)
  local check = choice.check
  if check and check.pass then
    local pass = Cond.Eval(check.pass, ctx, env)
    return pass == true
  end
  local temper = {}
  for _, t in ipairs((env.info.def and env.info.def.temper) or {}) do temper[t] = true end
  if choice.tag == "Intimidate" then
    return temper.cowardly == true or ctx.power == "above" or ctx.power == "far_above"
  elseif choice.tag == "Persuade" then
    if (env.mem and env.mem.affinity or 0) >= 3 then return true end
    local town = env.info.communities and env.info.communities[1]
    local standing = town and ns.char.towns[town] and ns.char.towns[town].value or 0
    if standing >= 30 then return true end
    local values = (env.info.def and env.info.def.values) or {}
    for _, t in ipairs(ns.Effects.DominantTraits()) do
      if U.Contains(values, t) then return true end
    end
    return false
  elseif choice.tag == "Deceive" then
    return not temper.sharp
  end
  return true
end

function Engine.IsSpecial(choice)
  return choice.tag ~= nil and SPECIAL[choice.tag] == true
end

---------------------------------------------------------------------------
-- Topic answers ("Ask about…", M4): NPC's own > community > role > brush-off
---------------------------------------------------------------------------
function Engine.PickTopic(info, topic, ctx, env)
  local cands = {}
  local def = info.def
  if def and def.topics then
    add(cands, def.topics[topic], Engine.BASE.own, "own")
    if #cands == 0 then add(cands, def.topics._none, 90, "own-brushoff") end
  end
  if ns.Data then
    for _, p in ipairs(ns.Data.PoolsFor(info, ctx)) do
      local topics = p.pool.topics or {}
      add(cands, topics[topic], p.base, "pool:" .. p.pool.id)
      add(cands, topics._none, p.base - 150, "pool-brushoff:" .. p.pool.id)
    end
    for _, g in ipairs(ns.Data.GenericFor(ctx)) do
      local topics = g.topics or {}
      add(cands, topics[topic], 0, "generic:" .. g.id)
      add(cands, topics._none, -100, "generic-brushoff:" .. g.id)
    end
  end
  return Engine.Pick("topic", cands, ctx, env, { node = "topic:" .. topic })
end
