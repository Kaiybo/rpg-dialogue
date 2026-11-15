-- M2: packs, conditions, engine scoring, pacing, conversation flow, UI wiring.

local function boot(opts)
  opts = opts or {}
  local ns = Loader.Boot({
    packs = opts.packs or { "RPGDialogue_TestPack", "RPGDialogue_TestPack2" },
    char = opts.char, db = opts.db,
    setup = function(state)
      state.units.player.level = opts.level or 2
      if opts.setup then opts.setup(state) end
    end,
  })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  -- These specs cover the short-line mode; the default (the box every time) is in ux_spec.lua.
  ns.db.settings.openMode = opts.openMode or "compact"
  return ns
end

local function npc(state, name, id)
  state.units.npc = { guid = "Creature-0-1-0-1-" .. (id or 197) .. "-AB", name = name, level = 20, reaction = 5 }
end

local function gossip(name, id)
  npc(Mock.state, name, id)
  local gf = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
  gf:Show()
  gf:SetAlpha(1)
  Mock.Fire("GOSSIP_SHOW")
  Mock.RunTimers()
  return gf
end

local function closeGossip()
  if _G.GossipFrame then _G.GossipFrame:Hide() end
  Mock.Fire("GOSSIP_CLOSED", false)
  Mock.RunTimers()
end

local function dialogueText(ns)
  local f = ns.UI.Dialogue.Frame()
  return f and f.text:GetText()
end

describe("Packs", function()
  it("discovers packs from TOC metadata and loads them by zone and at login", function()
    local ns = boot()
    local list = ns.Packs.List()
    local byId = {}
    for _, p in ipairs(list) do byId[p.id] = p end
    ok(byId["test.main"].loaded, "zone pack loaded for Elwynn Forest")
    ok(byId["test.extra"].loaded, "login pack loaded")
    ok(RPGDialogueAPI ~= nil and RPGDialogueAPI.version == 1)
  end)

  it("finds TODO-id NPCs by name, numbered NPCs by ID", function()
    local ns = boot()
    eq(ns.Data.FindNPC(nil, "Marshal McBride").key, "mcbride")
    eq(ns.Data.FindNPC(9002, "whoever").key, "willem")
    eq(ns.Data.FindNPC(1234, "Nobody"), nil)
  end)

  it("ignores scaffold NPCs nobody has written yet (they stay pooled)", function()
    local ns = boot()
    eq(ns.Data.npcs.scaffolded, nil)
    eq(ns.Data.FindNPC(9099, "Unwritten Person"), nil)
    local entry
    for _, p in ipairs(ns.Packs.List()) do if p.id == "test.main" then entry = p end end
    ok(entry, "test pack listed")
  end)

  it("merges two packs covering the same NPC", function()
    local ns = boot()
    local def = ns.Data.npcs.mcbride
    local found = false
    for _, g in ipairs(def.greetings) do if g.id == "g_extra" then found = true end end
    ok(found, "extra pack's greeting merged in")
    ok(def.nodes.hello ~= nil, "nodes kept")
  end)

  it("refuses a pack with a newer data format, with a message", function()
    local ns = boot({ packs = { "RPGDialogue_TestPack", "RPGDialogue_TestFuture" } })
    local refused
    for _, p in ipairs(ns.Packs.List()) do if p.id == "test.future" then refused = p.refused end end
    ok(refused, "refused")
    local said = false
    for _, l in ipairs(Mock.chat) do if l:find("newer RPG Dialogue") then said = true end end
    ok(said)
  end)
end)

describe("Conditions", function()
  local ns = boot()
  local Cond = ns.Conditions

  it("counts hinges and infers pacing systems", function()
    eq(Cond.Hinges({ race = "Dwarf", class = "SHAMAN", chance = 0.5 }), 2)
    eq(Cond.Hinges({ any = { { race = "Dwarf" }, { race = "Gnome", class = "MAGE" } } }), 2)
    local sys = Cond.Systems({ alignment = { axis = "light", min = 10 }, origin = "x" })
    ok(sys.alignment and sys.origin)
  end)

  it("scores race+class together as 50", function()
    local ctx = ns.Context.New({ spoof = { race = "Dwarf", class = "SHAMAN" } })
    local pass, score = Cond.Eval({ race = "Dwarf", class = "SHAMAN" }, ctx, { now = 0 })
    ok(pass)
    eq(score, 50)
  end)

  it("handles any / not combinators", function()
    local ctx = ns.Context.New({ spoof = { race = "Gnome" } })
    local pass, score = Cond.Eval({ any = { { race = "Dwarf" }, { race = "Gnome" } } }, ctx, { now = 0 })
    ok(pass); eq(score, 25)
    pass = Cond.Eval({ ["not"] = { race = "Gnome" } }, ctx, { now = 0 })
    eq(pass, false)
  end)

  it("resolves TODO quests through the NPC's gossip quest list", function()
    local ctx = ns.Context.New({ spoof = {} })
    local env = { now = 0, questIDs = {}, titleToID = { ["kobold camp cleanup"] = 9007 } }
    eq(Cond.QuestState({ todo = "quest", name = "Kobold Camp Cleanup" }, ctx, env), "before")
    Mock.state.questsDone[9007] = true
    env.questIDs = {}
    eq(Cond.QuestState({ todo = "quest", name = "Kobold Camp Cleanup" }, ctx, env), "done")
  end)
end)

describe("Engine", function()
  it("reproduces the DESIGN.md worked example (480 beats 455)", function()
    local ns = boot()
    ns.db.capture.quests[9001] = { title = "A Threat Within" }
    ns.char.quests.turnedIn[9001] = Mock.state.now - 3600
    Mock.state.gossipAvailable = { { title = "Kobold Camp Cleanup", questID = 9007 } }
    gossip("Marshal McBride")
    local s = ns.Conversation.session
    eq(s.mode, "full")
    eq(s.reason, "first meeting")
    eq(dialogueText(ns), "Willem sent you up.")
    local trace
    for _, t in ipairs(ns.Engine.traces) do if t.slot == "line" then trace = t end end
    eq(trace.rows[1].gid, "mcbride.h_from_willem")
    eq(trace.rows[1].score, 480)
    eq(trace.rows[2].score, 455)
  end)

  it("prefers race+class over race alone, and falls back to the NPC's plain line", function()
    local ns = boot()
    ns.Spoof.values.race = "Dwarf"
    ns.Spoof.values.class = "SHAMAN"
    gossip("Marshal McBride")
    eq(dialogueText(ns), "A dwarf who talks to the weather.")
    ns.Spoof.values.class = "WARRIOR"
    closeGossip()
    ns.char.npc.mcbride.times = 0
    gossip("Marshal McBride")
    eq(dialogueText(ns), "A dwarf.")
  end)

  it("doesn't repeat a line inside its fade window when an alternative exists", function()
    local ns = boot()
    local info = { key = "mcbride", name = "Marshal McBride", def = ns.Data.npcs.mcbride, communities = { "northshire" } }
    local ctx = ns.Context.New({ unit = nil, spoof = {} })
    local env = ns.Engine.NewEnv(info, ctx, {})
    local first = ns.Engine.PickGreeting(info, ctx, env)
    ns.Memory.MarkSeen(first.gid, first.line)
    local second = ns.Engine.PickGreeting(info, ctx, ns.Engine.NewEnv(info, ctx, {}))
    ok(first.gid ~= second.gid, "different greeting the second time")
  end)

  it("is deterministic for a seed", function()
    local ns = boot()
    local info = { key = "mcbride", name = "Marshal McBride", def = ns.Data.npcs.mcbride, communities = { "northshire" } }
    local ctx = ns.Context.New({ spoof = {} })
    ns.Engine.forcedSeed = 777
    local a = ns.Engine.PickGreeting(info, ctx, ns.Engine.NewEnv(info, ctx, {}))
    ns.Engine.forcedSeed = 777
    local b = ns.Engine.PickGreeting(info, ctx, ns.Engine.NewEnv(info, ctx, {}))
    eq(a.gid, b.gid)
  end)

  it("holds alignment lines for pacing outside big nodes, allows them inside", function()
    local ns = boot()
    ns.char.align.light = 40
    ns.char.pacing.sys.alignment = { c = ns.char.conversations, t = Mock.state.now }
    local info = { key = "mcbride", name = "Marshal McBride", def = ns.Data.npcs.mcbride, communities = { "northshire" } }
    local ctx = ns.Context.New({ spoof = {} })
    local env = ns.Engine.NewEnv(info, ctx, { times = 1 })
    local _, trace = ns.Engine.PickLine(info, "hello", ctx, env, false)
    local held = false
    for _, h in ipairs(trace.held) do if h[1] == "mcbride.h_align" then held = true end end
    ok(held, "alignment line held in a normal node")
    local w = ns.Engine.PickLine(info, "defias", ctx, env, true)
    eq(w.gid, "mcbride.d_align", "allowed in a big node")
  end)

  it("uses pools, then generic lines, for NPCs without their own content", function()
    local ns = boot()
    Mock.state.subzone = "Northshire Abbey"
    gossip("Northshire Guard", 1423)
    local s = ns.Conversation.session
    ok(s.info.pooled)
    eq(s.info.role, "guard")
    eq(s.mode, "compact")
    contains(ns.UI.Compact.Text(), "Move along.")
  end)

  it("leaves unknown NPCs with no pool for their role alone", function()
    local ns = boot()
    gossip("Some Farmer", 5555)
    eq(ns.Conversation.session, nil)
  end)

  it("picks topic answers: own, then pool, then brush-off", function()
    local ns = boot()
    local info = { key = "mcbride", name = "Marshal McBride", def = ns.Data.npcs.mcbride, communities = { "northshire" } }
    local ctx = ns.Context.New({ spoof = {} })
    local env = ns.Engine.NewEnv(info, ctx, {})
    eq(ns.Engine.PickTopic(info, "kobolds", ctx, env).gid, "mcbride.t_kobolds")
    eq(ns.Engine.PickTopic(info, "stonemasons", ctx, env).gid, "mcbride.t_none")
    local guard = { pooled = true, name = "Guard", role = "guard", communities = { "northshire" } }
    eq(ns.Engine.PickTopic(guard, "stonemasons", ctx, ns.Engine.NewEnv(guard, ctx, {})).gid, "pool:guard_northshire.t_none")
  end)
end)

describe("Stances", function()
  it("the typewriter never cuts an icon or colour code in half", function()
    local ns = boot()
    local D = ns.UI.Dialogue
    local s = "Ab |T1508495:26:26|t |cff00ff00Pincer|r x"
    for n = 1, #D.CutPoints(s) do
      local part = s:sub(1, D.utf8Cut(s, n))
      ok(not part:find("|T[^|]*$") and not part:find("|c%x?%x?%x?%x?%x?%x?%x?$"), "clean cut at " .. n .. ": " .. part)
    end
    eq(#D.CutPoints(s), 13, "the icon counts as one letter, colour codes as none")
  end)
end)

describe("Conversation", function()
  it("runs a full conversation: choice effects, journal, business, memory", function()
    local ns = boot()
    local gf = gossip("Marshal McBride")
    eq(gf:GetAlpha(), 0, "Blizzard window faded under ours")
    ns.UI.Dialogue.Click(1)                   -- Reporting for duty -> orders
    eq(ns.char.align.order > 0, true)
    eq(ns.char.traits.stern, 1)
    eq(ns.char.journal[1].text, "Reported to McBride.")
    eq(dialogueText(ns), "Kobold camp, north woods.")
    ns.UI.Dialogue.Click(1)                   -- Show me the work -> BUSINESS
    eq(ns.UI.Dialogue.IsShown(), false)
    eq(gf:GetAlpha(), 1, "Blizzard window restored")
    eq(ns.Conversation.session, nil, "nothing on his menu: the visit ends instead of showing the game's")
    eq(ns.char.npc.mcbride.times, 1)
    eq(ns.char.npc.mcbride.affinity, 1)
  end)

  it("'Get on with it' is always the last numbered option; with an empty menu it ends the visit", function()
    local ns = boot()
    local gf = gossip("Marshal McBride")
    local f = ns.UI.Dialogue.Frame()
    local last
    for i, b in ipairs(f.buttons) do if b:IsShown() then last = i end end
    contains(f.buttons[last].label:GetText(), "Get on with it")
    ns.UI.Dialogue.OnKey(f, tostring(last))
    eq(ns.UI.Dialogue.IsShown(), false)
    eq(gf:GetAlpha(), 1)
  end)

  it("keeps repeat visits short, and opens fully when there's something new", function()
    local ns = boot()
    gossip("Marshal McBride")
    ns.Conversation.Business()
    closeGossip()
    gossip("Marshal McBride")
    eq(ns.Conversation.session.mode, "compact", "nothing new")
    closeGossip()
    ns.db.capture.quests[9007] = { title = "Kobold Camp Cleanup" }
    Mock.state.questsDone[9007] = true
    ns.char.quests.turnedIn[9007] = Mock.state.now - 60
    gossip("Marshal McBride")
    eq(ns.Conversation.session.mode, "full", "news line due")
    eq(dialogueText(ns), "Quiet night, thanks to you.")
  end)

  it("marks NPCs with something new in their tooltip, only when that setting is on", function()
    local ns = boot()
    local lines = {}
    local function hover()
      lines = {}
      GameTooltip.GetUnit = function() return "Marshal McBride", "mouseover" end
      GameTooltip.AddLine = function(_, text) lines[#lines + 1] = text end
      Mock.state.units.mouseover = { guid = "Creature-0-1-0-1-197-AB", name = "Marshal McBride", level = 20, reaction = 5 }
      ns.Conversation.ClearMarkCache()
      GameTooltip:GetScript("OnTooltipSetUnit")(GameTooltip)
      return lines[1]
    end
    eq(hover(), nil, "never met: nothing marked")
    gossip("Marshal McBride")
    ns.Conversation.Business()
    closeGossip()
    ns.db.capture.quests[9007] = { title = "Kobold Camp Cleanup" }
    Mock.state.questsDone[9007] = true
    ns.char.quests.turnedIn[9007] = Mock.state.now - 60
    eq(hover(), nil, "off by default")
    ns.db.settings.newMarker = true
    local seen, convs = ns.Util.Count(ns.char.seen), ns.char.conversations
    eq(hover(), "Has something new to say")
    eq(ns.Util.Count(ns.char.seen), seen, "hovering marks nothing as heard")
    eq(ns.char.conversations, convs, "hovering isn't a conversation")
  end)

  it("lets another NPC react to a key line the player heard", function()
    local ns = boot()
    gossip("Marshal McBride")
    ns.UI.Dialogue.Click(2)                   -- What about the Defias? -> d_default (key)
    ok(ns.char.heard["mcbride.d_default"])
    ns.UI.Dialogue.Click(1)                   -- END
    closeGossip()
    gossip("Deputy Willem", 9002)
    eq(dialogueText(ns), "The Marshal told you about the Defias, did he?")
  end)

  it("special options succeed or fail from who you are", function()
    local ns = boot({ level = 60 })
    gossip("Marshal McBride")                -- NPC level 20: far above -> Intimidate works
    ns.UI.Dialogue.Click(3)
    eq(dialogueText(ns), "Fine. Fine.")
    closeGossip()
    local ns2 = boot({ level = 5 })
    gossip("Marshal McBride")
    ns2.UI.Dialogue.Click(3)
    eq(dialogueText(ns2), "Out of my sight.")
    eq(ns2.char.npc.mcbride.affinity, -2)
  end)

  it("hides origin-only choices when no origin is set", function()
    local ns = boot()
    gossip("Marshal McBride")
    for _, e in ipairs(ns.Conversation.session.choiceEntries) do
      ok(e.choice.text ~= "I'm from a farm.")
    end
  end)

  it("shows a noticing moment before the line when one is due", function()
    local ns = boot()
    ns.db.settings.ackChance = 1
    Mock.state.durability = { [1] = { 5, 50 } }
    gossip("Marshal McBride")
    contains(dialogueText(ns), "Get that armor fixed.")
    eq(ns.char.pacing.ack.kit, Mock.state.now)
  end)

  it("reacts live to stealth while the window is open", function()
    local ns = boot()
    gossip("Marshal McBride")
    Mock.state.stealthed = true
    Mock.Fire("UPDATE_STEALTH")
    eq(ns.UI.Dialogue.Frame().reaction:GetText(), "I can still hear you.")
  end)

  it("closes the full window when combat starts", function()
    local ns = boot()
    local gf = gossip("Marshal McBride")
    Mock.state.combat = true
    Mock.Fire("PLAYER_REGEN_DISABLED")
    eq(ns.UI.Dialogue.IsShown(), false)
    eq(gf:GetAlpha(), 1)
  end)

  it("never opens the full window in combat", function()
    local ns = boot()
    Mock.state.combat = true
    gossip("Marshal McBride")
    eq(ns.Conversation.session.mode, "compact")
  end)

  it("steps back when Immersion is loaded (default)", function()
    local ns = boot({ setup = function(state)
      table.insert(state.addons, { name = "Immersion", meta = {}, loaded = true })
    end })
    gossip("Marshal McBride")
    eq(ns.Conversation.session.mode, "compact")
    eq(ns.UI.Dialogue.IsShown(), false)
  end)

  it("talks to a target without gossip, and refuses when out of range", function()
    local ns = boot()
    Mock.state.units.target = { guid = "Creature-0-1-0-1-9002-AB", name = "Deputy Willem", level = 10 }
    ns.Conversation.TalkToTarget()
    eq(ns.Conversation.session.kind, "talk")
    eq(ns.UI.Dialogue.IsShown(), true)
    ns.Conversation.Business()
    eq(ns.Conversation.session, nil, "no Blizzard window: business ends it")
    Mock.state.inRange = false
    ns.Conversation.TalkToTarget()
    eq(ns.Conversation.session, nil)
  end)

  it("saves a flagged line with context and note", function()
    local ns = boot()
    gossip("Marshal McBride")
    ns.Conversation.Flag("McBride wouldn't say this")
    local f = ns.db.flagged[1]
    eq(f.key, "mcbride")
    eq(f.note, "McBride wouldn't say this")
    ok(#f.ctx > 10)
  end)

  it("explains the last choice with /rpgd why", function()
    local ns = boot()
    gossip("Marshal McBride")
    Mock.chat = {}
    ns.Slash.Handle("why")
    local all = table.concat(Mock.chat, "\n")
    contains(all, "WIN")
    contains(all, "mcbride")
  end)
end)

describe("Effects", function()
  local ns = boot()
  it("applies diminishing returns pushing further, full strength pulling back", function()
    local E = ns.Effects
    eq(E.ShiftAxis(0, 10), 10)
    ok(E.ShiftAxis(60, 10) < 66)
    eq(E.ShiftAxis(60, -10), 50)
    eq(E.ShiftAxis(0, 4, true), 10, "big choices count 2.5x")
    eq(E.ShiftAxis(99, 50), 100, "clamped")
  end)
  it("names town standing tiers", function()
    eq(ns.Effects.TierName(0), "Stranger")
    eq(ns.Effects.TierName(-70), "Reviled")
    eq(ns.Effects.TierName(40), "Liked")
  end)
  it("spreads standing to related towns", function()
    ns.Effects.Standing("northshire", 20)
    eq(ns.char.towns.northshire.value, 20)
    eq(ns.char.towns.goldshire.value, 5)
  end)
end)
