-- The conversation controller: game events in, engine picks, UI out.
--
-- Rules it keeps (DESIGN.md §3.1, R4–R6):
--   * Blizzard's window is never hidden, closed or re-opened by us. It opens as usual,
--     ours appears in front of it (optionally fading it), and "Get on with it" just
--     closes ours.
--   * Never a full window in combat; the full window closes if combat starts.
--   * Repeat visits stay short (compact bar) unless the NPC has something new.
local _, ns = ...

local C = ns.Compat
local U = ns.Util
local L = ns.L
local W = ns.World
local Engine = ns.Engine
local Memory = ns.Memory
local Effects = ns.Effects
local Tokens = ns.Tokens
local Cond = ns.Conditions

local Conv = {}
ns.Conversation = Conv
Conv.session = nil

local STORY_TIERS = { major = true, quest = true }
Conv.LIVE_KEYS = { "form", "pet", "mounted", "stealthed", "auras" }

local FRAME_FOR_INTERACTION = {
  Merchant = "merchant", Trainer = "trainer", TaxiNode = "taxi", Banker = "bank",
  StableMaster = "stable", Auctioneer = "auction",
}

---------------------------------------------------------------------------
-- Who is this?
---------------------------------------------------------------------------
local function roleFromPatterns(text, patterns)
  if not text then return nil end
  local lower = text:lower()
  for _, pair in ipairs(patterns) do
    if lower:find(pair[1]) then return pair[2] end
  end
  return nil
end

function Conv.DetectRole(ctx, interactionName)
  local cap = ns.db and ctx.npcID and ns.db.capture.npcs[ctx.npcID]
  local role = roleFromPatterns(cap and cap.subtitle, W.SUBTITLE_ROLES)
  role = role or roleFromPatterns(ctx.npcSubtitle or nil, W.SUBTITLE_ROLES)
  role = role or (interactionName and W.INTERACTION_ROLES[interactionName])
  role = role or roleFromPatterns(ctx.npcName or nil, W.NAME_ROLES)
  return role
end

function Conv.Identify(unit, ctx, interactionName)
  if not C.Exists(unit) or C.IsPlayer(unit) then return nil end
  local npcID = ctx.npcID or nil
  local name = ctx.npcName or nil
  if not npcID and not name then return nil end
  local info = { npcID = npcID, unitName = name, subtitle = ctx.npcSubtitle or nil }
  local def = ns.Data.FindNPC(npcID, name)
  if def then
    info.def = def
    info.key = def.key
    info.name = def.name or name
    info.role = def.role
    info.tier = def.tier or "quest"
    info.communities = def.communities or {}
    info.subtitle = def.title or info.subtitle
  else
    info.pooled = true
    info.name = name
    info.role = Conv.DetectRole(ctx, interactionName)
    info.tier = "pooled"
    local comm = ns.Data.CommunityForPlace(ctx.zone, ctx.subzone)
    info.communities = comm and { comm } or {}
    -- A role pool with its own conversation tree speaks as one shared character:
    -- every spirit healer seems to know your file.
    local tree = ns.Data.TreePoolFor(info, ctx)
    if tree then
      info.def = tree
      info.key = "pool:" .. tree.id
      info.tier = tree.tier or "major"
    end
  end
  return info
end

-- The node to show: the NPC's own, or (for pooled NPCs) one assembled from pools.
function Conv.Node(info, nodeId, ctx)
  if info.def and info.def.nodes and info.def.nodes[nodeId] then return info.def.nodes[nodeId] end
  local node = { lines = {} }
  for _, p in ipairs(ns.Data.PoolsFor(info, ctx)) do
    if p.pool.choices then node.choices = p.pool.choices; break end
  end
  if not node.choices then
    for _, g in ipairs(ns.Data.GenericFor(ctx)) do
      if g.choices then node.choices = g.choices; break end
    end
  end
  node.choices = node.choices or { { text = L.FAREWELL, next = "END" } }
  return node
end

---------------------------------------------------------------------------
-- Session lifecycle
---------------------------------------------------------------------------
local function otherAddonMode()
  return ns.Integrations and ns.Integrations.Mode() or "normal"
end

function Conv.BlizzardFrame(session)
  session = session or Conv.session
  if not session then return nil end
  local kind = session.kind == "gossip" and "gossip" or (session.kind == "quest" and "quest")
    or FRAME_FOR_INTERACTION[session.interaction or ""]
  if not kind then
    local shown, k = C.AnyInteractionFrameShown()
    if shown then kind = k end
  end
  if not kind then return nil end
  local f = C.BlizzardFrame(kind)
  if f and f:IsShown() then return f, kind end
  return nil
end

-- Marks a picked line as shown: memory, pacing budgets, its own effects.
function Conv.Shown(winner)
  local s = Conv.session
  if not winner or not s then return end
  Memory.MarkSeen(winner.gid, winner.line)
  for sys in pairs(winner.systems or {}) do ns.Pacing.Use(sys, s.env) end
  if winner.line.fx then Effects.Apply(winner.line.fx, s.env) end
  if winner.line.journal and not winner.line._thread then Effects.Journal(winner.line.journal, s.ctx, s.env) end
  if winner.line._thread and ns.Threads then ns.Threads.Heard(winner.line, s.env) end
end

function Conv.Start(kind, unit, interactionName)
  if not ns.db or not ns.char or not ns.db.settings.enabled then return end
  local mode = otherAddonMode()
  if mode == "off" then return end
  local guid = C.GUID(unit)
  if not guid then return end
  local s = Conv.session
  if s and s.guid == guid and not s.ended then
    -- Same NPC, interaction continuing (gossip -> vendor, gossip -> quest details).
    if kind == "talk" then
      if s.mode ~= "full" then Conv.OpenFull("talk") end
      return
    end
    s.kind = kind
    s.interaction = interactionName or s.interaction
    if s.mode == "compact" then ns.UI.Compact.Reanchor(Conv.BlizzardFrame(s)) end
    return
  end
  if s then Conv.Finish() end

  local ctx = ns.Context.New({ unit = unit })
  local info = Conv.Identify(unit, ctx, interactionName)
  if not info then return end
  if info.pooled and kind ~= "talk" and #ns.Data.PoolsFor(info, ctx) == 0 then return end
  -- As a ghost, only the spirit-sensitive answer.
  if C.IsGhost() and info.role ~= "spirithealer" and not (info.def and info.def.spiritSensitive) then return end

  ns.char.conversations = (ns.char.conversations or 0) + 1
  local memKey = Memory.Key(info)
  local mem = Memory.Begin(memKey, info)
  local env = Engine.NewEnv(info, ctx, mem)
  Effects.Drift(env.now)
  if kind == "gossip" then
    for _, q in ipairs(C.GossipQuests()) do
      if q.title and q.questID then env.titleToID[U.Norm(q.title)] = q.questID end
    end
  end

  s = {
    guid = guid, unit = unit, kind = kind, interaction = interactionName, info = info, ctx = ctx,
    mem = mem, memKey = memKey, env = env, started = env.now,
  }
  Conv.session = s

  local full, reason = Conv.DecideFull(s, mode)
  s.reason = reason
  if full == nil then s.mode = "none"; return end

  -- A story NPC with a noticing moment due gets the full window.
  if not full and mode == "normal" and not C.InCombat() then
    local notice = Engine.PickNotice(info, ctx, env)
    s.pendingNotice = notice or false
    if notice and STORY_TIERS[info.tier] then full, s.reason = true, "noticing moment" end
  end

  if full then Conv.OpenFull(s.reason) else Conv.OpenCompact() end
end

-- true = full, false = compact, nil = show nothing. Second value: reason (for /why).
function Conv.DecideFull(s, mode)
  local settings = ns.db.settings
  if s.kind == "talk" then return true, "talk" end
  if C.InCombat() then return false, "combat" end
  if mode == "stepback" then return false, "another dialogue addon is in charge" end
  if settings.openMode == "full" then return true, "setting: always full" end
  local first = (s.mem.times or 0) == 0
  if first and s.info.def then return true, "first meeting" end
  local news, gid = Engine.HasNews(s.info, s.ctx, s.env)
  if news then return true, "something new: " .. tostring(gid) end
  if settings.openMode == "skip" then return nil, "setting: skip to business" end
  return false, "nothing new"
end

-- Optional tooltip marker (off by default, it spoils discovery): does this NPC have
-- something new to say? Read-only: no memory, pacing or seen-state changes.
-- Cached per NPC for 15 seconds, since tooltips refresh constantly.
local markCache = {}
function Conv.HasSomethingNew(unit)
  if not ns.db or not ns.db.settings.newMarker or C.InCombat() then return false end
  if Conv.session and not Conv.session.ended then return false end
  local guid = C.GUID(unit)
  if not guid then return false end
  local now = C.Now()
  local hit = markCache[guid]
  if hit and now - hit.t < 15 then return hit.v end
  local v = false
  local ctx = ns.Context.New({ unit = unit })
  local info = Conv.Identify(unit, ctx)
  if info and info.def then
    local mem = Memory.Get(Memory.Key(info))
    if mem and (mem.times or 0) > 0 then
      v = Engine.HasNews(info, ctx, Engine.NewEnv(info, ctx, mem)) and true or false
    end
  end
  markCache[guid] = { t = now, v = v }
  return v
end

function Conv.ClearMarkCache() markCache = {} end

ns.OnLogin(function()
  C.OnUnitTooltip(function(tooltip, unit)
    if Conv.HasSomethingNew(unit) then
      local p = ns.UI.Theme.Palette()
      local c = p.name or { 1, 0.82, 0 }
      C.TooltipAddLine(tooltip, L.TOOLTIP_NEW, c[1], c[2], c[3])
    end
  end)
end)
ns.Listen("CONVERSATION_OPENED", function() Conv.ClearMarkCache() end)

function Conv.OpenFull(reason)
  local s = Conv.session
  if not s then return end
  if C.InCombat() then ns.Print(L.COMBAT_LATER); return end
  s.mode = "full"
  s.reason = reason or s.reason
  ns.UI.Compact.Hide()
  local frame = Conv.BlizzardFrame(s)
  s.blizz = frame
  if frame and ns.db.settings.fadeDefault then
    C.SetFaded(frame, true)
    s.faded = true
    ns.UI.Blocker.Cover(frame)
  end
  -- Snapshot the states live reactions watch, so a change after this moment is seen.
  for _, k in ipairs(Conv.LIVE_KEYS) do local _ = s.ctx[k] end
  local start = (s.info.def and s.info.def.start) or "hello"
  Conv.ShowNode(start)
  ns.Fire("CONVERSATION_OPENED", s)
end

local function restoreBlizzard(s)
  if s and s.faded then
    C.SetFaded(s.blizz, false)
    s.faded = false
  end
  ns.UI.Blocker.Uncover()
end

-- "Get on with it": close ours, leave Blizzard's window (already open underneath).
function Conv.Business()
  local s = Conv.session
  if not s then return end
  ns.UI.Dialogue.Hide()
  if ns.UI.AskAbout then ns.UI.AskAbout.Hide() end
  restoreBlizzard(s)
  if s.kind == "talk" or not Conv.BlizzardFrame(s) then
    Conv.Finish()
  else
    s.mode = "business"
  end
end

-- End the conversation and the interaction.
function Conv.End()
  local s = Conv.session
  if not s then return end
  local _, kind = Conv.BlizzardFrame(s)
  Conv.Finish()
  if kind then C.CloseInteraction(kind) end
end

function Conv.Finish()
  local s = Conv.session
  if not s or s.ended then Conv.session = nil; return end
  s.ended = true
  if s.ticker then s.ticker:Cancel() end
  Memory.End(s.mem, s.lastLine)
  restoreBlizzard(s)
  ns.UI.Dialogue.Hide()
  ns.UI.Compact.Hide()
  if ns.UI.AskAbout then ns.UI.AskAbout.Hide() end
  if ns.db.settings.tts then C.StopSpeaking() end
  Conv.session = nil
  ns.Fire("CONVERSATION_ENDED", s)
end

---------------------------------------------------------------------------
-- Showing things
---------------------------------------------------------------------------
local HINTS = {
  light = { "Light", "Shadow" }, order = { "Order", "Wild" }, honor = { "Honor", "Cunning" },
}

-- Optional alignment hint, from the choice's strongest alignment shift ("[Light]").
local function alignHint(choice)
  local align = choice.fx and choice.fx.align
  if not align then return nil end
  local best, bestMag
  for axis, d in pairs(align) do
    if HINTS[axis] and d ~= 0 and (not bestMag or math.abs(d) > bestMag) then best, bestMag = axis, math.abs(d) end
  end
  if not best then return nil end
  return align[best] > 0 and HINTS[best][1] or HINTS[best][2]
end
Conv.AlignHint = alignHint

-- Slurred replies when drunk (cosmetic).
function Conv.Slur(text, level, seed)
  if (level or 0) < 2 then return text end
  local rng = U.NewRNG(U.Hash(text, seed or 0))
  text = text:gsub("s", "sh"):gsub("S", "Sh")
  if level >= 3 or rng.next() < 0.5 then
    text = text:gsub("(%a+)", function(w) if rng.next() < 0.12 then return w .. " *hic*" end end, 2)
  end
  return text
end

local function choiceLabel(entry)
  local choice = entry.choice
  local text = choice.text or "..."
  local tags = ns.db.settings.tags
  if choice.tag and tags ~= "never" and (tags == "always" or not entry.locked) and not text:find("^%[") then
    text = "[" .. choice.tag .. "] " .. text
  end
  if ns.db.settings.alignHints then
    local hint = alignHint(choice)
    if hint then text = text .. " [" .. hint .. "]" end
  end
  return text
end

function Conv.ShowNode(nodeId)
  local s = Conv.session
  if not s then return end
  local info, ctx, env = s.info, s.ctx, s.env
  local node = Conv.Node(info, nodeId, ctx)
  s.node = nodeId
  s.nodeDef = node

  local winner = Engine.PickLine(info, nodeId, ctx, env, node.big)
  local main = winner and Tokens.Render(winner.line.text, ctx, env) or L.FALLBACK_LINE
  Conv.Shown(winner)
  s.lastLine = winner and winner.gid or s.lastLine

  -- Noticing moment: only on the first node, at most once per conversation.
  local before, after
  local isStart = nodeId == ((info.def and info.def.start) or "hello")
  if isStart and not s.noticeDone then
    s.noticeDone = true
    local notice = s.pendingNotice
    if notice == nil then notice = Engine.PickNotice(info, ctx, env) end
    s.pendingNotice = nil
    if notice then
      Engine.UseNotice(notice, info, env)
      Conv.Shown(notice)
      local text = Tokens.Render(notice.line.text, ctx, env)
      local place = notice.line.place or "before"
      if place == "replace" then main = text
      elseif place == "after" then after = text
      else before = text end
    end
  end

  -- Innkeepers (and other listed roles) may pass on a rumor on the first node.
  if isStart and not s.rumorDone and ns.Rumors and ns.Rumors.Due(info, env) then
    s.rumorDone = true
    local rumor = Engine.PickRumor(info, ctx, env)
    if rumor then
      Conv.Shown(rumor)
      ns.Rumors.Used(info, env)
      local text = Tokens.Render(rumor.line.text, ctx, env)
      after = after and (after .. "\n\n" .. text) or text
    end
  end

  local body = main
  if before then body = before .. "\n\n" .. body end
  if after then body = body .. "\n\n" .. after end

  local Ins = ns.Insanity
  if Ins then body = Ins.Scramble(body, nil, env.seed) end

  ns.UI.Dialogue.Show({
    name = Ins and Ins.Name(info.name, env.seed) or info.name, subtitle = info.subtitle, unit = s.unit,
    text = body, choices = Conv.BuildChoices(node, isStart),
    lineGid = winner and winner.gid, canAsk = ns.Topics and ns.Topics.Any(),
  })
  if ns.db.settings.tts then C.StopSpeaking(); C.Speak(body) end
end

-- Choices for a node: errands (first node only), the node's own, and (when insanity is
-- strong) an intrusive extra. At most Engine.MAX_CHOICES.
function Conv.BuildChoices(node, isStart)
  local s = Conv.session
  local ctx, env = s.ctx, s.env
  local entries = {}
  if isStart and ns.Errands then
    for _, e in ipairs(ns.Errands.ChoicesFor(s.info, ctx, env)) do
      entries[#entries + 1] = { choice = { text = e.text }, errand = e.errand, action = e.action }
    end
  end
  for _, e in ipairs(Engine.Choices(node, ctx, env)) do
    if #entries < Engine.MAX_CHOICES then entries[#entries + 1] = e end
  end
  local intrusive = ns.Insanity and ns.Insanity.IntrusiveChoice(env.seed + #entries)
  if intrusive and #entries < Engine.MAX_CHOICES then
    entries[#entries + 1] = { choice = { text = intrusive }, intrusive = true }
  end
  local firstGame = true
  for _, e in ipairs(Conv.GameOptions(s)) do
    e.firstGame = firstGame
    firstGame = false
    entries[#entries + 1] = e
  end
  s.choiceEntries = entries
  local choices = {}
  for i, entry in ipairs(entries) do
    if entry.game then
      choices[i] = { text = entry.choice.text, game = true, gap = entry.firstGame and i > 1 }
    else
      choices[i] = {
        text = Conv.Slur(choiceLabel(entry), ctx.drunk, env.seed + i),
        locked = entry.locked, special = entry.choice and Engine.IsSpecial(entry.choice),
      }
    end
  end
  return choices
end

function Conv.Choose(index)
  local s = Conv.session
  if not s or s.mode ~= "full" then return end
  local entry = s.choiceEntries and s.choiceEntries[index]
  if not entry or entry.locked then return end
  if entry.errand then
    local text = ns.Errands.Act(entry.errand, entry.action, s.env)
    ns.UI.Dialogue.ShowAnswer(Tokens.Render(text or "", s.ctx, s.env))
    ns.UI.Dialogue.SetChoices(Conv.BuildChoices(s.nodeDef, false))
    return
  end
  if entry.intrusive then
    ns.UI.Dialogue.ShowAnswer(L.INSANITY_RESPONSE)
    return
  end
  if entry.game then
    -- Hand over to the game's window first, then pick the option there.
    local g = entry.game
    Conv.Business()
    if g.kind == "gossipQuest" then
      C.SelectGossipQuest(g.questID, g.active)
    elseif g.kind == "greetingQuest" then
      C.SelectGreetingQuest(g.index, g.active)
    elseif g.kind == "gossipOption" then
      C.SelectGossip(g.id)
    end
    return
  end
  local choice = entry.choice
  local env, ctx = s.env, s.ctx
  local fx, nextId, journal = choice.fx, choice.next, choice.journal

  if Engine.IsSpecial(choice) then
    local success = Engine.CheckChoice(choice, ctx, env)
    local checks = s.mem.checks or {}
    s.mem.checks = checks
    checks[s.node .. ":" .. index] = { t = env.now, ok = success, tag = choice.tag }
    if not success and choice.fail then
      fx, nextId = choice.fail.fx, choice.fail.next or nextId
      journal = choice.fail.journal or journal
    end
  end

  Effects.Apply(fx, env)
  Effects.Journal(journal, ctx, env)

  if nextId == "BUSINESS" then
    Conv.Business()
  elseif nextId == nil or nextId == "END" then
    Conv.End()
  else
    Conv.ShowNode(nextId)
  end
end

-- "Ask about...": the NPC's own take, then their community's, their role's, then a brush-off.
function Conv.Ask(topic)
  local s = Conv.session
  if not s or s.mode ~= "full" then return end
  local w = Engine.PickTopic(s.info, topic, s.ctx, s.env)
  ns.Topics.Asked(topic, s.memKey)
  local text = L.FALLBACK_LINE
  if w then
    Conv.Shown(w)
    s.lastLine = w.gid
    text = Tokens.Render(w.line.text, s.ctx, s.env)
  end
  ns.UI.Dialogue.ShowAnswer(text, ns.Data.topics[topic] and ns.Data.topics[topic].name or topic)
end

function Conv.OpenCompact()
  local s = Conv.session
  if not s then return end
  s.mode = "compact"
  local info, ctx, env = s.info, s.ctx, s.env
  local notice = s.pendingNotice
  if notice == nil and otherAddonMode() == "normal" and not C.InCombat() then
    notice = Engine.PickNotice(info, ctx, env)
  end
  s.pendingNotice = nil
  local rumor
  if not notice and ns.Rumors and ns.Rumors.Due(info, env) then
    rumor = Engine.PickRumor(info, ctx, env)
    if rumor then ns.Rumors.Used(info, env) end
  end
  local winner = notice or rumor or Engine.PickGreeting(info, ctx, env)
  if not winner then s.mode = "none"; return end
  if notice then Engine.UseNotice(notice, info, env) end
  Conv.Shown(winner)
  s.lastLine = winner.gid
  local anchor = otherAddonMode() == "normal" and Conv.BlizzardFrame(s) or nil
  ns.UI.Compact.Show({
    name = info.name, text = Tokens.Render(winner.line.text, ctx, env), anchor = anchor,
    autoHide = anchor == nil and 12 or nil,
  })
end

---------------------------------------------------------------------------
-- Talk to Target (keybinding, slash command, compact bar button)
---------------------------------------------------------------------------
function Conv.TalkNow()
  local s = Conv.session
  if s and not s.ended then
    Conv.OpenFull("talk")
    return
  end
  Conv.TalkToTarget()
end

function Conv.TalkToTarget()
  if C.InCombat() then ns.Print(L.COMBAT_LATER); return end
  local s = Conv.session
  if s and not s.ended and s.unit == "npc" then Conv.OpenFull("talk"); return end
  if not C.Exists("target") or C.IsPlayer("target") then ns.Print(L.TALK_NO_TARGET); return end
  if not C.IsFriendly("target") then ns.Print(L.TALK_HOSTILE); return end
  if C.InRange("target") == false then ns.Print(L.TALK_TOO_FAR); return end
  Conv.Start("talk", "target")
  s = Conv.session
  if s and s.kind == "talk" then
    s.ticker = C.NewTicker(0.5, function()
      local cur = Conv.session
      if cur ~= s or s.ended then return end
      if not C.Exists("target") or C.GUID("target") ~= s.guid or C.InRange("target") == false then
        Conv.Finish()
      end
    end)
  end
end

---------------------------------------------------------------------------
-- "This line is wrong"
---------------------------------------------------------------------------
function Conv.Flag(note)
  local s = Conv.session
  if not s or not ns.Flag then return end
  ns.Flag.Save(s, note)
end

---------------------------------------------------------------------------
-- Events
---------------------------------------------------------------------------
-- Which page the quest window is on: "greeting" | "detail" | "progress" | "complete".
local questStage

local function deferStart(kind, unit, interactionName)
  -- Let Blizzard's window open first, so ours lands in front of it.
  C.After(0, function() Conv.Start(kind, unit, interactionName) end)
end

ns.On("GOSSIP_SHOW", function() deferStart("gossip", "npc") end)
ns.On("QUEST_GREETING", function() questStage = "greeting"; deferStart("quest", "npc") end)
ns.On("QUEST_DETAIL", function() questStage = "detail"; deferStart("quest", "npc") end)
ns.On("QUEST_PROGRESS", function() questStage = "progress"; deferStart("quest", "npc") end)
ns.On("QUEST_COMPLETE", function() questStage = "complete"; deferStart("quest", "npc") end)

---------------------------------------------------------------------------
-- The game's own options in the box: the NPC's quests (hand-ins first), then their gossip
-- options (vendor, training, flights, "make this inn your home"...). Picking one hands
-- over to the game's window, exactly as if it had been clicked there.
---------------------------------------------------------------------------
Conv.MAX_GAME_OPTIONS = 5

local function questRank(q) return q.active and (q.complete and 1 or 3) or 2 end
local function questLabel(q)
  local fmt = q.active and (q.complete and L.GAME_TURN_IN or L.GAME_QUEST_ACTIVE) or L.GAME_QUEST
  return fmt:format(q.title or "?")
end

function Conv.GameOptions(s)
  local out = {}
  if not s or s.kind == "talk" then return out end
  local function add(text, game) out[#out + 1] = { choice = { text = text }, game = game } end
  local gossip, quest = C.BlizzardFrame("gossip"), C.BlizzardFrame("quest")
  local onGossip = gossip and gossip:IsShown()
  local onQuest = quest and quest:IsShown()
  -- The page the visit is on decides (both windows can't really be open at once).
  if s.kind == "quest" and onQuest then onGossip = false end
  if s.kind == "service" then onGossip, onQuest = false, false end
  if onGossip then
    local quests = C.GossipQuests()
    table.sort(quests, function(a, b)
      if questRank(a) ~= questRank(b) then return questRank(a) < questRank(b) end
      return (a.title or "") < (b.title or "")
    end)
    for _, q in ipairs(quests) do
      add(questLabel(q), { kind = "gossipQuest", questID = q.questID, active = q.active })
    end
    for _, o in ipairs(C.GossipOptions()) do
      if type(o.name) == "string" and o.name ~= "" then add(o.name, { kind = "gossipOption", id = o.id }) end
    end
  elseif onQuest then
    if questStage == "greeting" then
      local quests = C.GreetingQuests()
      table.sort(quests, function(a, b)
        if questRank(a) ~= questRank(b) then return questRank(a) < questRank(b) end
        return a.index < b.index
      end)
      for _, q in ipairs(quests) do
        add(questLabel(q), { kind = "greetingQuest", index = q.index, active = q.active })
      end
    else
      local title = C.QuestFrameText().title
      if type(title) == "string" and title ~= "" then
        local handIn = questStage == "progress" or questStage == "complete"
        add((handIn and L.GAME_TURN_IN or L.GAME_QUEST):format(title), { kind = "reveal" })
      end
    end
  end
  while #out > Conv.MAX_GAME_OPTIONS do table.remove(out) end
  return out
end
ns.On("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", function(_, kind)
  local name = C.InteractionName(kind)
  if FRAME_FOR_INTERACTION[name or ""] then deferStart("service", "npc", name) end
end)

function Conv.CheckClosed()
  local s = Conv.session
  if not s or s.kind == "talk" then return end
  if not C.AnyInteractionFrameShown() then Conv.Finish() end
end

local function onClose() C.After(0.2, Conv.CheckClosed) end
ns.On("GOSSIP_CLOSED", onClose)
ns.On("QUEST_FINISHED", onClose)
ns.On("PLAYER_INTERACTION_MANAGER_FRAME_HIDE", onClose)

ns.On("PLAYER_REGEN_DISABLED", function()
  local s = Conv.session
  if s and s.mode == "full" then Conv.Business() end
end)

---------------------------------------------------------------------------
-- Live reactions while the full window is open
---------------------------------------------------------------------------
local function live(event, keys, changed)
  return function()
    local s = Conv.session
    if not s or s.mode ~= "full" or not ns.UI.Dialogue.IsShown() or C.InCombat() then return end
    local ctx = s.ctx
    local before = {}
    for _, k in ipairs(keys) do before[k] = ctx[k] end
    ns.Context.Refresh(ctx, keys)
    if not changed(before, ctx) then return end
    local w = Engine.PickReaction(s.info, event, ctx, s.env)
    if w then
      Conv.Shown(w)
      ns.UI.Dialogue.ShowReaction(Tokens.Render(w.line.text, ctx, s.env))
    end
  end
end

local function petKey(p) return p and ((p.family or "") .. ":" .. (p.name or "")) or "" end

Conv.OnForm = live("form", { "form" }, function(b, ctx) return b.form ~= ctx.form end)
Conv.OnPet = live("pet", { "pet" }, function(b, ctx) return ctx.pet and petKey(b.pet) ~= petKey(ctx.pet) end)
Conv.OnMount = live("mount", { "mounted" }, function(b, ctx) return ctx.mounted and not b.mounted end)
Conv.OnStealth = live("stealth", { "stealthed" }, function(b, ctx) return ctx.stealthed and not b.stealthed end)
Conv.OnAura = live("aura", { "auras", "debuffTypes" }, function(b, ctx)
  for id in pairs(ctx.auras or {}) do if not (b.auras or {})[id] then return true end end
  return false
end)

ns.On("UPDATE_SHAPESHIFT_FORM", Conv.OnForm)
ns.OnUnit("UNIT_PET", "player", Conv.OnPet)
ns.On("PLAYER_MOUNT_DISPLAY_CHANGED", Conv.OnMount)
ns.On("UPDATE_STEALTH", Conv.OnStealth)
ns.OnUnit("UNIT_AURA", "player", Conv.OnAura)

-- Make Cond available to other modules that only load the controller.
Conv.Cond = Cond

---------------------------------------------------------------------------
-- Safety net: if anything in a conversation errors, say so in chat and give the game's
-- own window back, so a bug never blocks gossip, quests or vendors.
---------------------------------------------------------------------------
function Conv.Recover()
  local s = Conv.session
  if s then
    if s.faded then C.SetFaded(s.blizz, false); s.faded = false end
    s.mode = "business"
  end
  for _, f in ipairs({ "gossip", "quest", "merchant", "trainer", "taxi" }) do
    local frame = C.BlizzardFrame(f)
    if frame then C.SetFaded(frame, false) end
  end
  ns.UI.Blocker.Uncover()
  if ns.UI.Dialogue.Frame() then ns.UI.Dialogue.Frame():Hide() end
  ns.UI.Compact.Hide()
  if ns.UI.AskAbout then ns.UI.AskAbout.Hide() end
end

for _, name in ipairs({ "Start", "OpenFull", "OpenCompact", "ShowNode", "Choose", "Business", "End",
                        "Finish", "Ask", "TalkNow", "TalkToTarget", "CheckClosed" }) do
  local fn = Conv[name]
  Conv[name] = function(...) return ns.Guard("conversation:" .. name, fn, Conv.Recover, ...) end
end
