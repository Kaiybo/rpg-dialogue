-- M5: origins, journal, export/import.

local function bootReal(setup)
  local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Elwynn" }, setup = setup })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  return ns
end

describe("Origins", function()
  it("lists origins for race, class and faction, always ending with Other", function()
    local ns = bootReal()
    local list = ns.Origins.ListFor("Human", "WARRIOR")
    eq(list[#list].id, "other")
    local ids = {}
    for _, o in ipairs(list) do ids[o.id] = true end
    ok(ids.human_westfall_farmhand and not ids.human_paladin_squire, "paladin-only origin hidden for warriors")
    ok(ns.Origins.ListFor("Human", "PALADIN")[1] ~= nil)
    local sky = {}
    for _, o in ipairs(ns.Origins.ListFor("Skyborne", "MAGE")) do sky[o.id] = true end
    ok(sky.skyborne_high_order and not sky.skyborne_windshaper, "Alliance player sees the High Order, not the Windshapers")
  end)

  it("choosing applies the nudge and home-town welcome once, and writes the first journal entry", function()
    local ns = bootReal()
    ns.Origins.Choose("human_westfall_farmhand")
    eq(ns.char.origin.id, "human_westfall_farmhand")
    eq(ns.char.traits.stern, 1)
    eq(ns.char.towns.goldshire.value, 10)
    eq(ns.Towns.TierName("goldshire"), "Known")
    contains(ns.char.journal[#ns.char.journal].text, "Westfall")
    ns.Origins.Choose("other")
    ns.Origins.Choose("human_westfall_farmhand")
    eq(ns.char.traits.stern, 1, "no double nudge")
  end)

  it("conversations work with no origin, and origin lines appear with one", function()
    local ns = bootReal()
    local ctx = ns.Context.New({ spoof = {} })
    eq((ns.Conditions.Eval({ origin = "human_westfall_farmhand" }, ctx, { now = 0 })), false)
    ns.Origins.Choose("human_westfall_farmhand")
    eq((ns.Conditions.Eval({ origin = "human_westfall_farmhand" }, ctx, { now = 0 })), true)
    ns.Origins.Choose("other")
    eq((ns.Conditions.Eval({ origin = "other" }, ctx, { now = 0 })), false, "Other unlocks nothing")
  end)
end)

describe("Journal", function()
  it("renders every tab without errors and in the character's words", function()
    local ns = bootReal()
    ns.Effects.Journal({ first = "I met the Marshal.", third = "{name} met the Marshal." }, ns.Context.New({ spoof = {} }), { now = Mock.state.now })
    ns.char.npc.mcbride = { times = 2, affinity = 3, last = Mock.state.now, name = "Marshal McBride", lastLine = "mcbride.h_default" }
    ns.Effects.Apply({ opinion = { defias = "mercy" }, align = { light = 40 }, hear = "defias_common_thieves" }, { now = Mock.state.now, info = { key = "mcbride", communities = { "northshire" } } })
    ns.char.books["The Seven Kingdoms"] = { t = Mock.state.now, n = 1 }
    ns.Trackers.Deed("level:10")
    contains(ns.Journal.Text("chronicle"), "I met the Marshal.")
    contains(ns.Journal.Text("chronicle", "marshal"), "Marshal")
    eq(ns.Journal.Text("chronicle", "zzzz"), ns.L.J_EMPTY)
    contains(ns.Journal.Text("people"), "Marshal McBride")
    contains(ns.Journal.Text("people"), "warm")
    local sheet = ns.Journal.Text("sheet")
    contains(sheet, "Light")
    contains(sheet, "mercy")
    contains(sheet, "insists")
    contains(sheet, "The Seven Kingdoms")
    contains(sheet, "Reached level 10")
    eq(ns.Journal.Text("deeds"), sheet, "old page names land on Myself")
    ns.Journal.Show("sheet")
    ns.Journal.Show("notes")
    ok(ns.Journal.IsShown())
    ns.UI.Launcher.Refresh()
    ok(ns.UI.Launcher.Book():IsShown(), "the journal button is on screen")
    ns.db.settings.journalButton = false
    ns.UI.Launcher.Refresh()
    eq(ns.UI.Launcher.Book():IsShown(), false)
  end)

  it("never shows raw town standing numbers", function()
    local ns = bootReal()
    ns.char.towns.goldshire = { value = 42 }
    local sheet = ns.Journal.Text("sheet")
    contains(sheet, "Goldshire: Liked")
    ok(not sheet:find("42"))
  end)
end)

describe("Export and import", function()
  it("round-trips a character's story", function()
    local ns = bootReal()
    ns.Origins.Choose("human_minor_noble")
    ns.Effects.Apply({ align = { honor = 12 }, opinion = { defias = "hardline" } }, { now = 1, info = { key = "dughan" } })
    ns.char.npc.dughan = { times = 3, affinity = 2, name = "Marshal Dughan" }
    local text = ns.Export.Build()
    ok(text:match("^RPGD1:%d+:"), "header and checksum")
    ns.SavedData.ResetCharacter()
    eq(ns.char.origin, nil)
    local payload, why = ns.Export.Check(text)
    ok(payload, why)
    ns.Export.Apply(payload)
    eq(ns.char.origin.id, "human_minor_noble")
    eq(ns.char.npc.dughan.times, 3)
    eq(ns.char.opinions.defias.stance, "hardline")
    ok(#ns.char._quarantine >= 1, "previous story kept aside")
  end)

  it("refuses damaged, foreign or newer strings without touching data", function()
    local ns = bootReal()
    ns.char.npc.x = { times = 9 }
    local text = ns.Export.Build()
    local damaged = text:sub(1, -6) .. "AAAA="
    eq((ns.Export.Check(damaged)), nil)
    eq((ns.Export.Check("hello")), nil)
    eq((ns.Export.Check("RPGD9:1:abc")), nil)
    local _, why = ns.Export.Check(text:sub(1, #text - 10))
    ok(why ~= nil)
    eq(ns.char.npc.x.times, 9, "untouched")
  end)

  it("the serializer handles strings with any bytes and nested tables", function()
    local ns = bootReal()
    local v = { a = "x:y;{}s5:", [1] = { 2, 3, true, false }, n = -1.5e10, deep = { { { "z" } } } }
    local back = ns.Export.Deserialize(ns.Export.Serialize(v))
    eq(back.a, v.a); eq(back[1][3], true); eq(back.n, v.n); eq(back.deep[1][1][1], "z")
    eq(ns.Export.B64Decode(ns.Export.B64Encode("any\0bytes\255")), "any\0bytes\255")
  end)
end)

describe("Journal pages (0.35.0)", function()
  local function talkTo(ns, name)
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-9100-AB", name = name, level = 20, reaction = 5 }
    local f = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
    f:Show()
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
  end
  local function leave(ns)
    if _G.GossipFrame then _G.GossipFrame:Hide() end
    if ns.Conversation.session then ns.Conversation.Finish() end
    Mock.Fire("GOSSIP_CLOSED", false)
  end

  it("writes an NPC's impression once, after talking, and groups people by zone", function()
    local ns = bootReal()
    ns.Data.npcs.mcbride.impression = { first = "McBride stands like a wall with a sword in it.", third = "{name} met McBride." }
    talkTo(ns, "Marshal McBride")
    leave(ns)
    local n = #ns.char.journal
    contains(ns.char.journal[n].text, "stands like a wall")
    ok(ns.char.npc.mcbride.impressed, "marked")
    talkTo(ns, "Marshal McBride")
    leave(ns)
    eq(#ns.char.journal, n, "only once")
    local people = ns.Journal.Text("people")
    contains(people, "Marshal McBride")
    contains(people, "stands like a wall")
    eq(ns.Journal.Text("people", "zzzz"), ns.L.J_NO_MATCH)
  end)

  it("writes a zone's arrival entry the first time only", function()
    local ns = bootReal()
    ns.Data.arrivals["Test Vale"] = {
      { when = { faction = "Horde" }, first = "Horde arrival.", third = "x" },
      { first = "A quiet vale, {name}'s first.", third = "{name} came to the vale." },
    }
    local before = #ns.char.journal
    ns.Trackers.Deed("zone:Test Vale")
    eq(#ns.char.journal, before + 1)
    contains(ns.char.journal[#ns.char.journal].text, "A quiet vale")
    ns.Diary.Arrive("Test Vale")
    eq(#ns.char.journal, before + 1, "once per zone")
    ns.Diary.Arrive("Nowhere At All")
    eq(#ns.char.journal, before + 1, "no entry without an Arrival")
  end)

  it("Stories shows threads heard, with their state and who said what", function()
    local ns = bootReal()
    eq(ns.Journal.Text("stories"), ns.L.J_NO_STORIES)
    local t = ns.Threads.State("elwynn_gold")
    t.state = "stirring"
    t.beats.b1_dust = Mock.state.now
    t.lastT = Mock.state.now
    local text = ns.Journal.Text("stories")
    contains(text, "The gold of Elwynn's mines")
    contains(text, ns.L.J_STORY_STIRRING)
    contains(text, "Remy swears")
    contains(text, "Nobody in Elwynn buys dust")
    eq(ns.Journal.Text("threads"), text, "old name lands on Stories")
  end)

  it("Heard of lists topics by category with what people answered", function()
    local ns = bootReal()
    eq(ns.Journal.Text("heard"), ns.L.J_NOTHING_HEARD)
    ns.Effects.Apply({ learn = { "gold_dust" } }, { now = Mock.state.now, info = { key = "remy", name = "Remy \"Two Times\"" } })
    local text = ns.Journal.Text("heard")
    contains(text, ns.L.J_NOT_ASKED)
    local gid
    for id, rec in pairs(ns.Data.lines) do
      if rec.slot == "topic" and rec.line._topic == "gold_dust" then gid = id; break end
    end
    if gid then
      ns.Topics.RecordAnswer("gold_dust", "remy", "Remy", gid)
      ns.Topics.RecordAnswer("gold_dust", "remy", "Remy", gid)
      eq(#ns.char.topics.gold_dust.said, 1, "one answer per person")
      contains(ns.Journal.Text("heard"), "Remy: \"")
    end
    eq(ns.Journal.Text("topics"), ns.Journal.Text("heard"), "old name lands on Heard of")
  end)

  it("a first death, a tenth level and a first dungeon write their own diary lines", function()
    local ns = bootReal()
    local n = #ns.char.journal
    ns.Trackers.Deed("level:30")
    contains(ns.char.journal[#ns.char.journal].text, "Guards nod to me")
    ns.Trackers.Deed("level:30")
    eq(#ns.char.journal, n + 1, "a deed writes once")
    ns.char.deaths[#ns.char.deaths + 1] = { killer = { name = "Hogger" } }
    ns.Trackers.Deed("first_death")
    contains(ns.char.journal[#ns.char.journal].text, "Hogger")
    ns.Trackers.Deed("dungeon:The Deadmines")
    contains(ns.char.journal[#ns.char.journal].text, "The Deadmines")
    ns.Trackers.Deed("kill:1234")
    eq(#ns.char.journal, n + 3, "kills stay off the diary")
  end)

  it("counts unread diary entries until the journal is opened", function()
    local ns = bootReal()
    ns.Journal.MarkRead()
    eq(ns.Journal.Unread(), 0)
    ns.Effects.Journal({ first = "One.", third = "One." }, ns.Context.New({ spoof = {} }), { now = Mock.state.now })
    ns.Effects.Journal({ first = "Two.", third = "Two." }, ns.Context.New({ spoof = {} }), { now = Mock.state.now })
    eq(ns.Journal.Unread(), 2)
    ns.UI.Launcher.Refresh()
    eq(ns.UI.Launcher.Book().badge:GetText(), "2")
    ns.Journal.Show("stories")
    eq(ns.Journal.Unread(), 0)
    eq(ns.UI.Launcher.Book().badge:GetText(), "")
    for _, tab in ipairs({ "chronicle", "stories", "people", "heard", "sheet", "notes" }) do ns.Journal.Show(tab) end
  end)
end)

describe("Citizens (0.35.0)", function()
  it("a friendly person with no title or file is a citizen, and the box opens for them", function()
    local ns = bootReal()
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-9200-AB", name = "Some Passerby", level = 10, reaction = 5, ctype = "Humanoid" }
    local ctx = ns.Context.New({ unit = "npc" })
    eq(ns.Conversation.DetectRole(ctx), "citizen")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-9201-AB", name = "Squirrel", level = 1, reaction = 4, ctype = "Critter" }
    eq(ns.Conversation.DetectRole(ns.Context.New({ unit = "npc" })), nil, "critters aren't people")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-9202-AB", name = "Angry Bandit", level = 10, reaction = 2, ctype = "Humanoid" }
    eq(ns.Conversation.DetectRole(ns.Context.New({ unit = "npc" })), nil, "hostiles aren't citizens")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-9200-AB", name = "Some Passerby", level = 10, reaction = 5, ctype = "Humanoid" }
    Mock.state.units.target = Mock.state.units.npc
    ns.Conversation.Start("talk", "npc")
    ok(ns.Conversation.session and ns.Conversation.session.info.role == "citizen", "talked as a citizen")
    ns.Conversation.Finish()
  end)
end)
