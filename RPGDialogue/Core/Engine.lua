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
Engine.MAX_CHOICES = 6
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
local function add(out, list, base, src, filter)
  for _, line in ipairs(list or {}) do out[#out + 1] = { line = line, base = base, src = src, filter = filter } end
end

Engine.BEAT_BASE = 480

-- slot: "line" | "greeting" | "notice" | "react"
function Engine.Gather(slot, info, ctx, nodeId)
  local out = {}
  local def = info.def
  local own = Engine.BASE.own
  -- A pooled NPC with no tree speaks only an assembled opening; one speaking through a pool's
  -- own tree (spirit healers, bound demons) is past the start on every other node, so other
  -- pools' and generic lines must not compete there.
  local isStart = (nodeId == nil) or (def and nodeId == def.start) or (info.pooled and not (def and def.nodes))
  if slot == "line" then
    if def and def.nodes and def.nodes[nodeId] then add(out, def.nodes[nodeId].lines, own, "own") end
    if not isStart then return out end
    -- Throughline beats for this NPC compete in the opening line, scoring high; pacing
    -- can still hold them back (shown as HELD in /rpgd why).
    if info.key and ns.Threads then
      for _, beat in ipairs(ns.Threads.BeatsFor(info.key)) do
        out[#out + 1] = { line = beat, base = Engine.BEAT_BASE, src = "beat", filter = ns.Threads.Filter }
      end
    end
  elseif slot == "greeting" then
    if def then add(out, def.greetings, own, "own") end
  elseif slot == "notice" then
    if def then add(out, def.notice, own, "own") end
  elseif slot == "react" then
    if def then add(out, def.react, own, "own") end
  elseif slot == "bark" then
    if def then add(out, def.barks, own, "own") end
  end
  -- A named NPC with noticing moments of their own keeps to them: a role pool's "any
  -- blacksmith could say this" moment would fail the content guide's test (CONTENT_GUIDE §3).
  -- The same for reactions. Pooled NPCs and named NPCs without their own still use the pool's.
  local ownOnly = def and not info.pooled and ((slot == "notice" and def.notice and #def.notice > 0)
    or (slot == "react" and def.react and #def.react > 0))
  if ns.Data and not ownOnly then
    for _, p in ipairs(ns.Data.PoolsFor(info, ctx)) do
      if p.pool ~= def then
        local field = (slot == "line") and "lines" or (slot == "greeting" and "greetings" or (slot == "bark" and "barks" or slot))
        add(out, p.pool[field], p.base, "pool:" .. p.pool.id)
      end
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
      if not held and cand.filter then
        local ok, reason = cand.filter(line, gid, env)
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
          line = line, gid = gid, score = total, parts = table.concat(desc, " + "), src = cand.src,
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

function Engine.PickBark(info, ctx, env)
  local cands = Engine.Gather("bark", info, ctx)
  if #cands == 0 then return nil end
  return Engine.Pick("bark", cands, ctx, env)
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
  if info.key and ns.Threads then
    for _, beat in ipairs(ns.Threads.BeatsFor(info.key)) do
      local pass = Cond.Eval(beat.when, ctx, env)
      if pass and ns.Threads.Filter(beat, beat._gid, env) then return true, beat._gid end
    end
  end
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
-- Replies that leave the node rather than open a branch: never hidden as explored.
local EXITS = { END = true, BUSINESS = true, BACK = true }
function Engine.IsExit(nextId) return nextId == nil or EXITS[nextId] == true end

-- The replies to show for a node, at most Engine.MAX_CHOICES, in the writer's order.
--   opts.visited:  nodes already shown in this conversation. A reply leading to one is
--                  hidden (asked and answered), unless it leads to a hub (opts.hubs: the
--                  start node and nodes marked hub = true), to a rotating node (opts.rotating:
--                  nodes marked rotating = true, which draw a fresh line each visit), or
--                  says repeatable = true.
--   opts.explored: nodes this NPC showed in earlier conversations. Those replies still
--                  appear, marked explored.
-- When there are too many, explored branches drop first, then branches without
-- conditions (the ones everybody gets); exits and replies that exist because of who
-- the player is are kept.
-- Stances (0.33.0): a reply that shifts alignment is a statement the character makes, and
-- the stances in one node are mutually exclusive. A question never shifts alignment.
-- Once one stance in a node is taken (opts.stance: its text), the node's other stances are
-- gone for good with this NPC, and the one taken no longer shifts alignment again.
-- A reply's text may be a string or tone variants (0.85.0):
-- { normal = "...", polite = "...", blunt = "..." }; a missing variant falls back to normal.
function Engine.BaseText(choice)
  local t = choice and choice.text
  if type(t) == "table" then return t.normal or t.polite or t.blunt end
  return t
end

function Engine.ChoiceText(choice, tone)
  local t = choice and choice.text
  if type(t) ~= "table" then return t end
  if not tone then tone = ns.Disposition and ns.Disposition.Tone() or "normal" end
  return t[tone] or t.normal or t.polite or t.blunt
end

function Engine.IsQuestion(text)
  return type(text) == "string" and text:find("%?[\"'%)%s]*$") ~= nil
end

function Engine.IsStance(choice)
  return type(choice) == "table" and type(choice.fx) == "table" and choice.fx.align ~= nil
    and not Engine.IsQuestion(Engine.BaseText(choice))
end

function Engine.Choices(node, ctx, env, opts)
  opts = opts or {}
  local stance = opts.stance
  local visited, explored, hubs = opts.visited or {}, opts.explored or {}, opts.hubs or {}
  local rotating = opts.rotating or {}
  local showLocked = ns.db and ns.db.settings.showLocked
  local out = {}
  for _, choice in ipairs(node and node.choices or {}) do
    local target = choice.next
    local exit = Engine.IsExit(target) or hubs[target]
    local otherStance = stance and Engine.IsStance(choice) and Engine.BaseText(choice) ~= stance
    if not otherStance and (exit or choice.repeatable or rotating[target] or not visited[target]) then
      local entry
      if Cond.Eval(choice.when, ctx, env) then
        entry = { choice = choice }
      elseif showLocked and choice.tag then
        entry = { choice = choice, locked = true }
      end
      if entry then
        entry.exit = exit and true or nil
        entry.explored = (not exit and explored[target]) or nil
        out[#out + 1] = entry
      end
    end
  end
  local function dropLast(test)
    for i = #out, 1, -1 do
      if test(out[i]) then table.remove(out, i); return true end
    end
    return false
  end
  while #out > Engine.MAX_CHOICES do
    if not dropLast(function(e) return e.explored end)
      and not dropLast(function(e) return not e.exit and not e.choice.when end)
      and not dropLast(function(e) return not e.exit end) then
      table.remove(out)
    end
  end
  return out
end

-- Coming back to a node already shown in this conversation (a reply with next = "BACK"):
-- one of its short "again" lines ("What else?" in this NPC's voice), else a greeting.
function Engine.PickAgain(info, nodeId, ctx, env)
  local node = info.def and info.def.nodes and info.def.nodes[nodeId]
  local cands = {}
  add(cands, node and node.again, Engine.BASE.own, "own")
  if #cands > 0 then
    local w = Engine.Pick("again", cands, ctx, env, { node = nodeId })
    if w then return w end
  end
  return Engine.PickGreeting(info, ctx, env)
end

-- Special reply options: success comes from who the player is, never dice.
-- Disposition decides the extremes (0.114.0): someone Devoted to you (90+) is won over by
-- any Persuade or Deceive, and someone Hostile (below 20) believes nothing you say.
-- Intimidate is left alone: fear works on people who hate you.
Engine.CHECK_DEVOTED, Engine.CHECK_HOSTILE = 90, 20
function Engine.CheckChoice(choice, ctx, env)
  local check = choice.check
  if (choice.tag == "Persuade" or choice.tag == "Deceive") and ns.Disposition and env and env.info then
    local d = ns.Disposition.For(env, ctx)
    if d >= Engine.CHECK_DEVOTED then return true end
    if d < Engine.CHECK_HOSTILE then return false end
  end
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
    if ns.Disposition and ns.Disposition.For(env, ctx) >= ns.Disposition.PERSUADE then return true end
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
-- Rumors (innkeepers and other listed roles)
---------------------------------------------------------------------------
function Engine.PickRumor(info, ctx, env)
  if not ns.Rumors then return nil end
  local cands = {}
  for _, set in ipairs(ns.Rumors.SetsFor(info, ctx)) do add(cands, set.lines, 300, "rumor:" .. set.id) end
  if #cands == 0 then return nil end
  return Engine.Pick("rumor", cands, ctx, env, { defaultOnce = false })
end

---------------------------------------------------------------------------
-- Topic answers ("Ask about…", M4): NPC's own > community > role > brush-off
---------------------------------------------------------------------------
-- "Ask about...": the NPC's own take, then their community's, their role's, then anyone's;
-- a brush-off in their own voice when nobody has a take.
--   * "Ask anyone" topics (their story, their work, advice, rumors) skip brush-offs: every
--     role has something to say, and anyone can fall back on a generic answer.
--   * A named NPC's story is their own or a polite deflection, never a role's stock one.
--   * Latest rumors: the NPC's own, then whatever is going round this zone (any role can
--     pass on hearsay, not only innkeepers), then their role's or anyone's.
-- A line's `minDisposition` (0.85.0) holds that answer back until they think well enough of you;
-- its `maxDisposition` (0.90.0) holds it back unless they think that little of you (what comes
-- out only in anger).
-- Cowed (0.90.0): someone who hates you and has just been frightened into talking skips
-- `minDisposition`.
local function dispFilter(disp, cowed)
  return function(line)
    local need = line.minDisposition
    if not cowed and type(need) == "number" and disp < need then return false, ("disposition %d < %d"):format(disp, need) end
    local cap = line.maxDisposition
    if type(cap) == "number" and disp > cap then return false, ("disposition %d > %d"):format(disp, cap) end
    return true
  end
end

local function currentDisposition(ctx, env)
  if not ns.Disposition or not env then return 50 end
  return ns.Disposition.For(env, ctx)
end

function Engine.PickTopic(info, topic, ctx, env)
  local cands = {}
  local def = info.def
  local tdef = ns.Data and ns.Data.topics and ns.Data.topics[topic]
  local standard = tdef and tdef.standard
  local held = dispFilter(currentDisposition(ctx, env), env and env.cowed)
  if def and def.topics then
    add(cands, def.topics[topic], Engine.BASE.own, "own", held)
    if #cands == 0 and not standard then add(cands, def.topics._none, 90, "own-brushoff") end
  end
  if topic == "rumors" and #cands == 0 and ns.Rumors then
    for _, set in ipairs(ns.Rumors.SetsFor(info, ctx, true)) do add(cands, set.lines, 300, "rumor:" .. set.id) end
  end
  if ns.Data then
    local named = def ~= nil and not info.pooled
    for _, p in ipairs(ns.Data.PoolsFor(info, ctx, true)) do
      local topics = p.pool.topics or {}
      if not (standard and topic == "background" and named) then
        add(cands, topics[topic], p.base, "pool:" .. p.pool.id, held)
      end
      if not standard then add(cands, topics._none, p.base - 150, "pool-brushoff:" .. p.pool.id) end
    end
    for _, g in ipairs(ns.Data.GenericFor(ctx)) do
      local topics = g.topics or {}
      add(cands, topics[topic], 0, "generic:" .. g.id, held)
      if not standard then add(cands, topics._none, -100, "generic-brushoff:" .. g.id) end
    end
  end
  return Engine.Pick("topic", cands, ctx, env, { node = "topic:" .. topic })
end

-- What slips out in anger (0.90.0, topics with `blurts`): the NPC's own `blurts` lines, else
-- whatever is going round their town or zone (any role).
-- field: "blurts" (default) or "confides" (0.114.0, what a friend lets you in on).
function Engine.PickBlurt(info, ctx, env, field)
  local cands = {}
  local def = info.def
  if def then add(cands, def[field or "blurts"], Engine.BASE.own, "own") end
  if #cands == 0 and ns.Rumors then
    for _, set in ipairs(ns.Rumors.SetsFor(info, ctx, true)) do add(cands, set.lines, 300, "rumor:" .. set.id) end
  end
  if #cands == 0 then return nil end
  return Engine.Pick("blurt", cands, ctx, env, { defaultOnce = false })
end

---------------------------------------------------------------------------
-- Disposition gates (0.85.0): what they won't talk about yet
---------------------------------------------------------------------------
-- The disposition this topic needs before they'll discuss it at all (Disposition.TopicNeed),
-- when they don't have it yet; else nil. Returns need, current disposition.
function Engine.TopicGate(info, topic, ctx, env)
  if not ns.Disposition then return nil end
  local disp = currentDisposition(ctx, env)
  local need = ns.Disposition.TopicNeed(topic, info)
  if disp < need then return need, disp end
  return nil
end

-- When the answer they gave was a brush-off: the lowest `minDisposition` among the answers
-- they'd otherwise have given (so the brush-off counts as "won't say", not "nothing to say").
function Engine.HeldAnswerNeed(info, topic, ctx, env)
  local disp = currentDisposition(ctx, env)
  local lowest
  local function scan(list)
    for _, line in ipairs(list or {}) do
      local m = line.minDisposition
      if type(m) == "number" and disp < m and Cond.Eval(line.when, ctx, env) then
        if not lowest or m < lowest then lowest = m end
      end
    end
  end
  local def = info.def
  if def and def.topics then scan(def.topics[topic]) end
  if ns.Data then
    for _, p in ipairs(ns.Data.PoolsFor(info, ctx, true)) do scan((p.pool.topics or {})[topic]) end
    for _, g in ipairs(ns.Data.GenericFor(ctx)) do scan((g.topics or {})[topic]) end
  end
  return lowest, disp
end

-- Their refusal, in their voice: the NPC's own `topics._gated`, then their pools', then
-- the generic ones (RPGDialogue_World).
function Engine.PickGated(info, ctx, env)
  local cands = {}
  local def = info.def
  if def and def.topics then add(cands, def.topics._gated, Engine.BASE.own, "own-gated") end
  if ns.Data then
    for _, p in ipairs(ns.Data.PoolsFor(info, ctx, true)) do
      add(cands, (p.pool.topics or {})._gated, p.base, "pool-gated:" .. p.pool.id)
    end
    for _, g in ipairs(ns.Data.GenericFor(ctx)) do
      add(cands, (g.topics or {})._gated, 0, "generic-gated:" .. g.id)
    end
  end
  return Engine.Pick("topic", cands, ctx, env, { node = "topic:_gated" })
end

---------------------------------------------------------------------------
-- Admire, Taunt, Intimidate (0.85.0): how they answer
---------------------------------------------------------------------------
-- The NPC's own `persuade[action][result]`, then the reply sets (P:Persuade) for their
-- role (and subtitle), for their side, then everyone's. A set's `role` and `subtitle` narrow
-- it; lines carry ordinary conditions (`race`, `class`, `faction`, `disposition`...).
local function persuadeSetBase(set, info, ctx)
  if set.faction and set.faction ~= ctx.faction then return nil end
  if set.zone and not U.Contains(U.AsList(set.zone), ctx.zone) then return nil end
  if set.subzone and not U.Contains(U.AsList(set.subzone), ctx.subzone) then return nil end
  local base = (set.subzone and 80) or (set.zone and 60) or 0
  if set.role then
    if not U.Contains(U.AsList(set.role), info.role) then return nil end
    base = 150
  end
  if set.subtitle then
    local have = type(info.subtitle) == "string" and info.subtitle:lower() or ""
    local ok = false
    for _, w in ipairs(U.AsList(set.subtitle)) do if have:find(w, 1, true) then ok = true; break end end
    if not ok then return nil end
    base = base + 50
  end
  if set.faction then base = base + 30 end
  if set.npc then
    if not U.Contains(U.AsList(set.npc), info.name) then return nil end
    base = base + 300
  end
  return base
end

-- What the player says (0.86.0): a `say` line for the action, picked at random so it rarely
-- repeats. Lines written for this very person (their own, or a set naming them) come up
-- more often than not; the last 60 said are left out while anything else is left.
function Engine.PickSay(info, action, ctx, env)
  local cands = {}
  local def = info.def
  local own = def and def.persuade and def.persuade[action]
  if own then add(cands, own.say, 1000, "own") end
  for _, set in ipairs(ns.Data and ns.Data.persuade or {}) do
    local base = persuadeSetBase(set, info, ctx)
    local lists = base and set[action]
    if lists then add(cands, lists.say, base, "persuade:" .. set.id) end
  end
  local recent = ns.char and ns.char.saidPersuade or {}
  local was = {}
  for _, g in ipairs(recent) do was[g] = true end
  local special, rest, stale = {}, {}, {}
  for i, cand in ipairs(cands) do
    local pass, score = Cond.Eval(cand.line.when, ctx, env)
    if pass then
      cand.gid = cand.line._gid or (cand.src .. "#" .. i)
      cand.weight = 1 + ((score or 0) > 0 and 2 or 0) + (cand.base >= 150 and 3 or cand.base > 0 and 1 or 0)
      if was[cand.gid] then stale[#stale + 1] = cand
      elseif cand.base >= 300 then special[#special + 1] = cand
      else rest[#rest + 1] = cand end
    end
  end
  local from = rest
  if #special > 0 and (#rest == 0 or math.random() < 0.6) then from = special end
  if #from == 0 then from = stale end
  if #from == 0 then return nil end
  local total = 0
  for _, c in ipairs(from) do total = total + c.weight end
  local roll, pick = math.random() * total, from[#from]
  for _, c in ipairs(from) do
    roll = roll - c.weight
    if roll <= 0 then pick = c; break end
  end
  if ns.char then
    recent[#recent + 1] = pick.gid
    while #recent > 60 do table.remove(recent, 1) end
    ns.char.saidPersuade = recent
  end
  return pick
end

function Engine.PickPersuade(info, action, result, ctx, env)
  local cands = {}
  local def = info.def
  local own = def and def.persuade and def.persuade[action]
  if own then add(cands, own[result], Engine.BASE.own, "own") end
  for _, set in ipairs(ns.Data and ns.Data.persuade or {}) do
    local base = persuadeSetBase(set, info, ctx)
    local lists = base and set[action]
    if lists then add(cands, lists[result], base, "persuade:" .. set.id) end
  end
  return Engine.Pick("persuade", cands, ctx, env, { node = "persuade:" .. action })
end

---------------------------------------------------------------------------
-- Speaking your mind (0.82.0): after an answer, a few things the player can say back
---------------------------------------------------------------------------
Engine.MAX_VIEWS = 3

-- The views on offer for a topic: the NPC's own, then the topic's, else the "_any" set
-- (never for "What do you know?"). Nothing once a view on it was given to this NPC. Each
-- eligible view, in the writer's order, up to MAX_VIEWS.
function Engine.ViewsFor(info, topic, ctx, env)
  if topic == "knows" then return {} end
  local mem = env and env.mem
  if mem and mem.views and mem.views[topic] then return {} end
  local def = info and info.def
  local pools = {}
  if def and def.views and def.views[topic] then pools[#pools + 1] = def.views[topic] end
  local data = ns.Data and ns.Data.views or {}
  if data[topic] then pools[#pools + 1] = data[topic] end
  if #pools == 0 then
    local tdef = ns.Data and ns.Data.topics and ns.Data.topics[topic]
    if tdef and tdef.standard then return {} end
    if data._any then pools[#pools + 1] = data._any end
  end
  local out = {}
  for _, list in ipairs(pools) do
    for _, v in ipairs(list) do
      if #out < Engine.MAX_VIEWS and Cond.Eval(v.when, ctx, env) then out[#out + 1] = v end
    end
    if #out >= 2 then break end
  end
  return out
end

-- How the NPC takes it: the view's own replies (the NPC's own first), else a shrug.
function Engine.PickViewReply(info, view, ctx, env)
  local cands = {}
  local def = info and info.def
  local own = def and def.viewReplies and view.id and def.viewReplies[view.id]
  add(cands, own, Engine.BASE.own, "own")
  add(cands, view.replies, 200, "view:" .. tostring(view._topic))
  local data = ns.Data and ns.Data.views
  local shrug = data and data._shrug and data._shrug[1]
  if shrug then add(cands, shrug.replies, 0, "view:_shrug") end
  return Engine.Pick("view", cands, ctx, env, { node = "view:" .. tostring(view._topic) })
end

---------------------------------------------------------------------------
-- "What do you know?" (0.34.0): the topics this NPC has something to say about
---------------------------------------------------------------------------
-- A topic counts when the NPC's own answers, or their role's or community's pools, hold a
-- line whose conditions pass now (never a brush-off, never the generic fallback, never an
-- "ask anyone" topic). Their own topics come first, then the pools'; each group in the
-- order of the topic list. Returns { { id, own = bool } }.
local function anyEligible(list, ctx, env)
  for _, line in ipairs(list or {}) do
    if Cond.Eval(line.when, ctx, env) then return true end
  end
  return false
end

function Engine.TopicsKnownBy(info, ctx, env)
  local topics = ns.Data and ns.Data.topics or {}
  local own, pooled, seen = {}, {}, {}
  local def = info.def
  local ids = {}
  for id, tdef in pairs(topics) do
    if not tdef.standard then ids[#ids + 1] = id end
  end
  table.sort(ids)
  for _, id in ipairs(ids) do
    if def and def.topics and anyEligible(def.topics[id], ctx, env) then
      own[#own + 1] = { id = id, own = true }
      seen[id] = true
    end
  end
  if ns.Data and ns.Data.PoolsFor then
    for _, p in ipairs(ns.Data.PoolsFor(info, ctx, true)) do
      local pt = p.pool.topics
      if pt and p.pool ~= def then
        for _, id in ipairs(ids) do
          if not seen[id] and anyEligible(pt[id], ctx, env) then
            pooled[#pooled + 1] = { id = id }
            seen[id] = true
          end
        end
      end
    end
  end
  for _, e in ipairs(pooled) do own[#own + 1] = e end
  return own
end
