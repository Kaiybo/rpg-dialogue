-- M6: spirit healers, barks, insanity, drunk replies, ghosts, books, errands.

local function bootReal(setup)
  local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Elwynn" }, setup = setup })
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
local function leave(ns) if ns.Conversation.session then ns.Conversation.Finish() end end
local function text(ns) return plain(ns.UI.Dialogue.Frame().text:GetText()) end

describe("Spirit healers", function()
  it("every spirit healer shares one file, and knows how you died", function()
    local ns = bootReal()
    Mock.state.ghost = true
    ns.Slash.Handle("die trivial")
    ns.char.deaths[#ns.char.deaths].killer = { name = "Kobold Vermin" }
    talkTo("Spirit Healer", 6491, "Northshire Valley")
    local s = ns.Conversation.session
    eq(s.info.key, "pool:spirithealer")
    eq(s.mode, "full")
    ns.UI.Dialogue.Click(2)                     -- What does my file say?
    contains(text(ns), "Kobold Vermin")
    leave(ns)
    talkTo("Spirit Healer", 6491, "Goldshire")
    eq(ns.char.npc["pool:spirithealer"].times, 1, "the other healer has the same records")
  end)

  it("notices repeated deaths in the same spot", function()
    local ns = bootReal()
    Mock.state.ghost = true
    for _ = 1, 3 do ns.char.deaths[#ns.char.deaths + 1] = { t = Mock.state.now, zone = "Elwynn Forest", subzone = "Echo Ridge Mine", cause = "creature" } end
    ns.char.deathCount = 3
    talkTo("Spirit Healer", 6491, "Northshire Valley")
    contains(text(ns), "Echo Ridge Mine again")
  end)
end)

describe("Ghosts", function()
  it("as a ghost only the spirit-sensitive answer", function()
    local ns = bootReal()
    Mock.state.ghost = true
    talkTo("Marshal McBride", 197, "Northshire Abbey")
    eq(ns.Conversation.session, nil)
    talkTo("Brother Sammuel", 198, "Northshire Abbey")
    contains(text(ns), "I can feel you there")
  end)
end)

describe("Barks", function()
  it("a nearby NPC speaks up now and then, rate-limited", function()
    local ns = bootReal()
    Mock.state.units.nameplate1 = { guid = "Creature-0-1-0-1-501-AB", name = 'Remy "Two Times"', level = 10 }
    Mock.state.subzone = "Goldshire"
    Mock.chat = {}
    ok(ns.Barks.Try("nameplate1", true))
    contains(Mock.chat[#Mock.chat], "says:")
    eq(ns.Barks.Try("nameplate1"), false, "too soon")
  end)

  it("a nearby child squeals when you shift into a cat", function()
    local ns = bootReal()
    Mock.state.units.nameplate2 = { guid = "Creature-0-1-0-1-7000-AB", name = "Orphan", level = 1 }
    ns.Barks.CHANCE = 0                          -- no idle bark when the nameplate appears
    Mock.Fire("NAME_PLATE_UNIT_ADDED", "nameplate2")
    ns.Barks.CHANCE = 0.3
    Mock.chat = {}
    Mock.state.form = 1
    Mock.Fire("UPDATE_SHAPESHIFT_FORM")
    contains(table.concat(Mock.chat, "\n"), "turned into a cat")
  end)
end)

describe("Insanity", function()
  it("scrambles text deterministically, never when turned off, and fades with rest", function()
    local ns = bootReal()
    ns.Insanity.Add(80)
    local a = ns.Insanity.Scramble("The garrison is spread thin across the valley tonight.", nil, 5)
    local b = ns.Insanity.Scramble("The garrison is spread thin across the valley tonight.", nil, 5)
    eq(a, b, "no flicker: same seed, same text")
    ns.db.settings.insanityFx = false
    eq(ns.Insanity.Scramble("plain words here", nil, 5), "plain words here")
    ns.db.settings.insanityFx = true
    ns.db.settings.reduceMotion = true
    eq(ns.Insanity.Strength(), 0, "reduce motion turns every effect off")
    ns.db.settings.reduceMotion = false
    Mock.state.resting = true
    ns.Insanity.Tick(4)
    ok(ns.Insanity.Level() < 30, "rest cures it")
  end)

  it("journal entries come out in a different hand", function()
    local ns = bootReal()
    ns.Insanity.Add(100)
    ns.db.settings.insanityIntensity = 1
    ns.Effects.Journal({ first = "Spoke to the Marshal about kobolds today." }, ns.Context.New({ spoof = {} }), { now = 0 })
    eq(ns.char.journal[#ns.char.journal].otherHand, true)
  end)
end)

describe("Drunk replies", function()
  it("slur replies when drunk enough", function()
    local ns = bootReal()
    eq(ns.Conversation.Slur("Show me the work.", 0, 1), "Show me the work.")
    contains(ns.Conversation.Slur("Show me the work.", 2, 1), "Shhow")
  end)
end)

describe("Books", function()
  it("reading a known book teaches a topic and an NPC may react", function()
    local ns = bootReal()
    Mock.state.bookTitle = "The Seven Kingdoms"
    Mock.Fire("ITEM_TEXT_BEGIN")
    ok(ns.char.topics.seven_kingdoms, "topic learned")
    contains(ns.char.journal[#ns.char.journal].text, "The Seven Kingdoms")
    ns.char.npc.neals = { times = 2, affinity = 0, topics = {}, flags = {}, last = Mock.state.now - 600 }
    talkTo("Brother Neals", 199, "Northshire Abbey")
    contains(text(ns), "Stromgarde")
  end)
end)

describe("Errands", function()
  it("offered, verified by the addon, rewarded with addon-only things", function()
    local ns = bootReal()
    ns.db.capture.quests[4300] = { title = "Wolves Across the Border" }
    Mock.state.questsDone[4300] = true
    ns.char.npc.eagan = { times = 2, affinity = 0, topics = {}, flags = {}, last = Mock.state.now - 600 }
    talkTo("Eagan Peltskinner", 200, "Northshire Valley")
    ns.Conversation.OpenFull("talk")
    local entries = ns.Conversation.session.choiceEntries
    eq(entries[1].errand, "eagan_echo_wolves")
    ns.UI.Dialogue.Click(1)
    contains(text(ns), "Echo Ridge Mine")
    ok(ns.char.errands.eagan_echo_wolves.taken)
    leave(ns)
    Mock.state.now = Mock.state.now + 60
    Mock.state.subzone = "Echo Ridge Mine"
    Mock.Fire("ZONE_CHANGED")
    talkTo("Eagan Peltskinner", 200, "Northshire Valley")
    ns.Conversation.OpenFull("talk")
    eq(ns.Conversation.session.choiceEntries[1].action, "complete")
    ns.UI.Dialogue.Click(1)
    ok(ns.char.errands.eagan_echo_wolves.done)
    eq(ns.char.npc.eagan.affinity, 2)
  end)
end)
