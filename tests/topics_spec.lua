-- 0.26.0: Morrowind-style Ask about. Topic words in what people say become links, seeing one
-- teaches the topic, core topics are always there, towns and zones have voices, and the
-- journal keeps what each person said.

local function boot(packs)
  local ns = Loader.Boot({ packs = packs or { "RPGDialogue_World", "RPGDialogue_Elwynn" } })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  return ns
end

local function talkTo(name, id, subzone, zone)
  if subzone then Mock.state.subzone = subzone end
  if zone then Mock.state.zone = zone end
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-" .. id .. "-AB", name = name, level = 20 }
  local gf = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
  gf:Show()
  Mock.Fire("GOSSIP_SHOW")
  Mock.RunTimers()
end

local function leave(ns)
  if ns.Conversation.session then ns.Conversation.Finish() end
  if _G.GossipFrame then _G.GossipFrame:Hide() end
  Mock.state.zone = "Elwynn Forest"
end

local function raw(ns) return ns.UI.Dialogue.Frame().text:GetText() end
local function text(ns) return ns.Topics.Plain(raw(ns)) end
local function count(s, sub)
  local n, i = 0, 1
  while true do
    local a, b = s:find(sub, i, true)
    if not a then return n end
    n, i = n + 1, b + 1
  end
end

describe("Topic links", function()
  it("link whole words, first mention only, longest keyword first", function()
    local ns = boot()
    local out, ids = ns.Topics.Linkify("The Defias hide in Westfall. Defias, everywhere.", "|cff0000ff")
    eq(count(out, "|Hrpgdtopic:defias|h"), 1, "first mention only")
    eq(count(out, "|Hrpgdtopic:westfall|h"), 1)
    eq(#ids, 2)
    eq(ns.Topics.Plain(out), "The Defias hide in Westfall. Defias, everywhere.", "plain text round-trips")
    local _, none = ns.Topics.Linkify("Stormwinds and Hoggers aren't words.")
    eq(#none, 0, "no partial words")
    local abbey = ns.Topics.Linkify("Back to Northshire Abbey with you.", "|cff0000ff")
    contains(abbey, "|Hrpgdtopic:northshire_abbey|h|cff0000ffNorthshire Abbey|r|h", "the longer keyword wins")
    local _, poss = ns.Topics.Linkify("Kurzen's men went mad.")
    eq(poss[1], "kurzen", "a possessive still links")
    local same, skip = ns.Topics.Linkify("|cffff0000Defias|r already colored")
    eq(same, "|cffff0000Defias|r already colored")
    eq(#skip, 0, "text with escape codes is left alone")
  end)

  it("core topics never link, and a topic can opt out", function()
    local ns = boot()
    local _, ids = ns.Topics.Linkify("Some background on my trade, and camping.")
    eq(#ids, 0)
  end)

  it("seeing a topic's name in an answer teaches it, and the text carries the link", function()
    local ns = boot()
    ns.Topics.Teach("goldshire")
    talkTo("Marshal McBride", 197, "Northshire Abbey")
    ok(not ns.char.topics.stormwind, "not known yet")
    ns.Conversation.Ask("goldshire")
    contains(text(ns), "south of Stormwind")
    contains(raw(ns), "|Hrpgdtopic:stormwind|h")
    ok(ns.char.topics.stormwind and ns.char.topics.stormwind.heard, "learned on sight")
    eq(ns.char.topics.stormwind.from, ns.Conversation.session.memKey)
    local s = ns.Conversation.session
    local seen = {}
    for _, id in ipairs(s.newTopics or {}) do seen[id] = true end
    ok(seen.stormwind and seen.hogger, "marked new for the Ask list")
  end)

  it("clicking a link asks about it", function()
    local ns = boot()
    ns.Topics.Teach("goldshire")
    talkTo("Marshal McBride", 197, "Northshire Abbey")
    ns.Conversation.Ask("goldshire")
    local frame = ns.UI.Dialogue.Frame()
    ok(frame:GetHyperlinksEnabled(), "hyperlinks enabled on the box")
    frame:GetScript("OnHyperlinkClick")(frame, "rpgdtopic:stormwind", "Stormwind", "LeftButton")
    eq(frame.subtitle:GetText(), "<Stormwind>")
    contains(text(ns), "First War")
  end)

  it("the setting turns links and learning off", function()
    local ns = boot()
    ns.db.settings.topicLinks = false
    ns.Topics.Teach("goldshire")
    talkTo("Marshal McBride", 197, "Northshire Abbey")
    ns.Conversation.Ask("goldshire")
    ok(not raw(ns):find("|H", 1, true), "no links")
    ok(not ns.char.topics.stormwind, "nothing learned")
  end)
end)

describe("Core topics", function()
  it("are always known, first in the list, and never archived", function()
    local ns = boot()
    local list = ns.Topics.Known(false)
    eq(list[1].id, "background")
    eq(list[5].id, "someplace_nearby")
    ok(list[1].core, "marked core")
    ok(ns.Topics.Any(), "the Ask button shows even before any topic is learned")
  end)

  it("anyone answers them: their own words, their trade's, or common knowledge", function()
    local ns = boot({ "RPGDialogue_World", "RPGDialogue_Stranglethorn" })
    Mock.state.units.player.faction = "Alliance"
    talkTo("Baron Revilgaz", 2496, "Booty Bay", "Stranglethorn Vale")
    ns.Conversation.Ask("my_trade")
    contains(text(ns), "I keep this port for the Cartel")
    ns.Conversation.Ask("little_secret")
    eq(text(ns), "Secrets are inventory. I don't give inventory away.", "a stranger gets the refusal")
    ns.char.npc.revilgaz.affinity = 5
    ns.Conversation.Ask("little_secret")
    contains(text(ns), "The parrot can count", "a friend gets the secret")
    leave(ns)
  end)

  it("answers what a pooled NPC is asked from their trade", function()
    local ns = boot()
    local info = { name = "Some Banker", role = "banker", pooled = true, communities = {} }
    local ctx = ns.Context.New({})
    ctx.faction = "Alliance"
    local env = ns.Engine.NewEnv(info, ctx, {})
    local w = ns.Engine.PickTopic(info, "background", ctx, env)
    eq(w.gid, "pool:banker.ta_bg")
    w = ns.Engine.PickTopic(info, "scourge", ctx, env)
    eq(w.src, "generic:common_alliance", "common knowledge beats the trade's brush-off")
  end)

  it("latest rumors from an innkeeper is a rumor", function()
    local ns = boot()
    talkTo("Innkeeper Farley", 502, "Lion's Pride Inn")
    ns.Conversation.Ask("latest_rumors")
    local gid = ns.Conversation.session.lastLine or ""
    ok(gid:find("^rumor:") ~= nil, "rumor line, got " .. gid)
  end)
end)

describe("Voices", function()
  it("a town's voice answers for everyone there, below the person's own words", function()
    local ns = boot({ "RPGDialogue_World", "RPGDialogue_Stranglethorn" })
    talkTo("Baron Revilgaz", 2496, "Booty Bay", "Stranglethorn Vale")
    ns.Conversation.Ask("someplace_nearby")
    local gid = ns.Conversation.session.lastLine
    ok(gid:find("^voice:booty_bay%.") ~= nil, "Booty Bay's voice, got " .. tostring(gid))
    ns.Conversation.Ask("horde")
    eq(ns.Conversation.session.lastLine, "revilgaz.ta_horde", "his own take wins")
    leave(ns)
  end)

  it("a zone's voice speaks for anyone in the zone without a town voice", function()
    local ns = boot({ "RPGDialogue_World", "RPGDialogue_Stranglethorn" })
    Mock.state.zone = "Stranglethorn Vale"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")                -- zone packs load on arrival
    local info = { name = "Someone", role = "vendor", pooled = true, communities = {} }
    local ctx = ns.Context.New({})
    ctx.zone = "Stranglethorn Vale"
    local w = ns.Engine.PickTopic(info, "someplace_nearby", ctx, ns.Engine.NewEnv(info, ctx, {}))
    eq(w.gid, "voice:stranglethorn.v_near_jungle")
    ctx.zone = "Elwynn Forest"
    w = ns.Engine.PickTopic(info, "someplace_nearby", ctx, ns.Engine.NewEnv(info, ctx, {}))
    ok(w.gid ~= "voice:stranglethorn.v_near_jungle", "not outside the zone")
    Mock.state.zone = "Elwynn Forest"
  end)
end)

describe("Topic journal", function()
  it("records what each person said, and the journal shows it", function()
    local ns = boot()
    ns.Topics.Teach("goldshire")
    talkTo("Marshal McBride", 197, "Northshire Abbey")
    ns.Conversation.Ask("goldshire")
    local key = ns.Conversation.session.memKey
    local said = ns.char.topics.goldshire.said[key]
    ok(said and said.text:find("Lion's Pride", 1, true), "answer kept as plain text")
    eq(said.name, "Marshal McBride")
    ns.Conversation.Ask("background")
    ok(ns.char.topics.background.said[key], "core topic answers are kept too")
    contains(ns.UI.Journal.Text("topics"), "Marshal McBride: \"Village on the road south of Stormwind")
  end)

  it("brush-offs aren't recorded as an answer", function()
    local ns = boot()
    ns.Topics.Teach("maybell_tommy")
    talkTo("Marshal McBride", 197, "Northshire Abbey")
    ns.Conversation.Ask("maybell_tommy")
    ok(not ns.char.topics.maybell_tommy.said, "nothing recorded")
  end)
end)
