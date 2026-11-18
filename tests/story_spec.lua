-- M4: throughlines, Ask about, gossip network, contradictions, rumors, town standing, dev commands.

local function bootReal(opts)
  opts = opts or {}
  local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Elwynn" }, setup = opts.setup })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  return ns
end

local function talkTo(name, id, subzone)
  if subzone then Mock.state.subzone = subzone end
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-" .. id .. "-AB", name = name, level = 20 }
  local gf = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
  gf:Show()
  Mock.Fire("GOSSIP_SHOW")
  Mock.RunTimers()
end

local function leave(ns)
  if ns.Conversation.session then ns.Conversation.Finish() end
  if _G.GossipFrame then _G.GossipFrame:Hide() end
end

local function text(ns) return plain(ns.UI.Dialogue.Frame().text:GetText()) end

describe("Throughlines", function()
  it("offers a beat, records it, and holds the next one back for pacing", function()
    local ns = bootReal()
    talkTo('Remy "Two Times"', 501, "Goldshire")
    contains(text(ns), "Nobody in Elwynn buys dust but me")
    local t = ns.char.threads.elwynn_gold
    ok(t and t.beats.b1_dust, "beat recorded")
    eq(t.state, "stirring")
    ok(ns.char.claims.heard.remy_only_buyer, "beat fx applied")
    contains(ns.Journal.Text("stories"), "Nobody in Elwynn buys dust")
    leave(ns)
    talkTo("Innkeeper Farley", 502, "Lion's Pride Inn")
    ok(not text(ns):find("rider paid for a room"), "Farley's beat held: too soon after Remy's")
    local held = false
    for _, tr in ipairs(ns.Engine.traces) do
      for _, h in ipairs(tr.held) do if h[1] == "thread:elwynn_gold.b2_riders" then held = h[2] end end
    end
    contains(held or "", "pacing")
  end)

  it("offers the next beat once enough conversations and time have passed", function()
    local ns = bootReal()
    talkTo('Remy "Two Times"', 501, "Goldshire"); leave(ns)
    ns.char.conversations = ns.char.conversations + 5
    Mock.state.now = Mock.state.now + 3600
    ns.char.npc.farley = { times = 3, affinity = 0, topics = {}, flags = {}, last = Mock.state.now - 600 }
    talkTo("Innkeeper Farley", 502, "Lion's Pride Inn")
    eq(ns.Conversation.session.mode, "full", "an unheard beat counts as news")
    contains(text(ns), "rider paid for a room in gold dust")
  end)

  it("/rpgd threads lists, forces and resets threads", function()
    local ns = bootReal()
    Mock.chat = {}
    ns.Slash.Handle("threads")
    contains(table.concat(Mock.chat, "\n"), "elwynn_gold [dormant]")
    ns.Slash.Handle("threads force elwynn_gold b2_riders")
    eq(ns.char.threads.elwynn_gold.force, "b2_riders")
    ns.Slash.Handle("threads reset elwynn_gold")
    eq(ns.char.threads.elwynn_gold, nil)
  end)
end)

describe("Ask about", function()
  it("answers with the NPC's own take, a community take, or a brush-off in their voice", function()
    local ns = bootReal()
    ns.Topics.Teach("hogger")
    ns.Topics.Teach("maybell_tommy")
    talkTo("Marshal McBride", 197, "Northshire Abbey")
    ok(ns.UI.Dialogue.Frame().ask:IsShown(), "Ask about... button shown when topics are known")
    ns.Conversation.Ask("hogger")
    contains(text(ns), "Dughan's problem")
    ns.Conversation.Ask("maybell_tommy")
    eq(text(ns), "That's not a garrison matter. Ask the brothers; they read.")
    ok(ns.char.topics.hogger.asked, "asking is remembered")
  end)

  it("the topic list is searchable and puts stale topics in an archive", function()
    local ns = bootReal()
    ns.Topics.Teach("hogger")
    ns.char.topics.defias = { t = Mock.state.now - 40 * 86400 }
    local function learned(list)
      local n = 0
      for _, t in ipairs(list) do if not t.standard then n = n + 1 end end
      return n
    end
    eq(learned(ns.Topics.Known(false)), 1)
    eq(learned(ns.Topics.Known(true)), 2)
    eq(#ns.Topics.Filter(ns.Topics.Known(true), "hog"), 1)
  end)
end)

describe("Gossip network", function()
  it("an opinion told to McBride reaches Willem later, not at once", function()
    local ns = bootReal()
    talkTo("Marshal McBride", 197, "Northshire Abbey")
    ns.Conversation.ShowNode("defias")
    ns.UI.Dialogue.Click(2)                   -- "A thief's a thief."
    eq(ns.char.opinions.defias.stance, "hardline")
    leave(ns)
    local env = { now = Mock.state.now, info = { key = "willem", communities = { "northshire" } } }
    local ctx = ns.Context.New({ spoof = {} })
    local pass, _, _, why = ns.Conditions.Eval({ gossip = { topic = "defias", stance = "hardline", chance = 1 } }, ctx, env)
    eq(pass, false)
    contains(why, "hasn't spread")
    env.now = env.now + 3600
    pass = ns.Conditions.Eval({ gossip = { topic = "defias", stance = "hardline", chance = 1 } }, ctx, env)
    eq(pass, true)
    env.info = { key = "mcbride", communities = { "northshire" } }
    eq((ns.Conditions.Eval({ gossip = { topic = "defias", chance = 1 } }, ctx, env)), false, "not to the NPC you told")
    env.info = { key = "farley", communities = { "goldshire" } }
    eq((ns.Conditions.Eval({ gossip = { topic = "defias", chance = 1 } }, ctx, env)), false, "not outside the community")
  end)

  it("notices contradictions within a community", function()
    local ns = bootReal()
    local env = { now = Mock.state.now, info = { key = "willem", name = "Deputy Willem", communities = { "northshire" } } }
    ns.Effects.Apply({ opinion = { defias = "mercy" } }, { now = env.now, info = { key = "mcbride", communities = { "northshire" } } })
    ns.Effects.Apply({ opinion = { defias = "hardline" } }, env)
    local ctx = ns.Context.New({ spoof = {} })
    env.info = { key = "milly", communities = { "northshire" } }
    eq((ns.Conditions.Eval({ contradiction = "defias" }, ctx, env)), true)
    env.info = { key = "farley", communities = { "goldshire" } }
    eq((ns.Conditions.Eval({ contradiction = "defias" }, ctx, env)), false)
  end)
end)

describe("Rumors and town standing", function()
  it("an innkeeper passes on a rumor that teaches a topic", function()
    local ns = bootReal()
    ns.Pacing.RUMOR.chance = 1
    Mock.state.zone = "Elwynn Forest"
    ns.char.npc.farley = { times = 2, affinity = 0, topics = {}, flags = {}, last = Mock.state.now - 3600 }
    talkTo("Innkeeper Farley", 502, "Lion's Pride Inn")
    local s = ns.Conversation.session
    local shown = (s.mode == "full" and text(ns)) or ns.UI.Compact.Text()
    local told = false
    for _, w in ipairs({ "Westfall", "gnolls", "Jasperlode", "Deputy Rainer", "Haggard", "Azora", "Maclure" }) do
      if shown:find(w, 1, true) then told = true end
    end
    ok(told, "a rumor was told: " .. tostring(shown))
    ns.Pacing.RUMOR.chance = 0.5
  end)

  it("quests done for a town raise its standing, and it spreads to related towns", function()
    local ns = bootReal()
    ns.db.capture.quests[4242] = { title = "WANTED: \"Hogger\"" }
    Mock.Fire("QUEST_TURNED_IN", 4242, 0, 0)
    eq(ns.char.towns.goldshire.value, 15)
    ok(ns.char.towns.northshire.value > 0, "spread to Northshire")
    eq(ns.Towns.TierName("goldshire"), "Known")
  end)

  it("long absences soften extreme standing, but not all the way", function()
    local ns = bootReal()
    ns.char.towns.goldshire = { value = 90, t = Mock.state.now - 20 * 604800 }
    ns.Towns.Soften(Mock.state.now)
    eq(ns.char.towns.goldshire.value, 50)
    ns.char.towns.goldshire.softenedAt = Mock.state.now - 100 * 604800
    ns.Towns.Soften(Mock.state.now)
    eq(ns.char.towns.goldshire.value, 30, "a town never forgets completely")
  end)
end)

describe("Lies", function()
  it("a claim the player made is caught when real history contradicts it", function()
    local ns = bootReal()
    ns.db.capture.quests[4242] = { title = "WANTED: \"Hogger\"" }
    ns.Effects.Apply({ claim = "player_killed_hogger" }, { now = Mock.state.now, info = { key = "farley" } })
    ns.char.npc.dughan = { times = 2, affinity = 0, topics = {}, flags = {}, last = Mock.state.now - 600 }
    talkTo("Marshal Dughan", 503, "Goldshire")
    contains(text(ns), "no claw on my desk")
    ok(ns.char.towns.goldshire.value < 0, "standing dropped")
    leave(ns)
    Mock.state.questsDone[4242] = true
    local ctx = ns.Context.New({ spoof = {} })
    eq((ns.Conditions.Eval({ lieCaught = "player_killed_hogger" }, ctx, { now = 0, questIDs = {}, titleToID = {} })), false, "true claims aren't lies")
  end)

  it("alignment hints are off by default and name the strongest shift when on", function()
    local ns = bootReal()
    eq(ns.Conversation.AlignHint({ fx = { align = { light = 3, order = -1 } } }), "Light")
    eq(ns.Conversation.AlignHint({ fx = { align = { honor = -2 } } }), "Cunning")
    eq(ns.db.settings.alignHints, false)
  end)
end)

describe("Dev commands", function()
  it("claims, topics and fake deaths", function()
    local ns = bootReal()
    ns.Effects.Apply({ hear = "defias_common_thieves" }, { now = 0, info = { key = "dughan" } })
    Mock.chat = {}
    ns.Slash.Handle("claims")
    contains(table.concat(Mock.chat, "\n"), "common thieves")
    ns.Slash.Handle("topics teach hogger")
    ok(ns.char.topics.hogger)
    ns.Slash.Handle("topics forget hogger")
    eq(ns.char.topics.hogger, nil)
    ns.Slash.Handle("die trivial")
    eq(ns.char.deaths[#ns.char.deaths].cause, "trivial")
  end)
end)
