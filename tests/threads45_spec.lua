-- Throughlines for the 45-60 Alliance road: the plague cauldrons (Chillwind, the Writhing
-- Haunt, the Eastweald), the Dawn's letters (Everlook, Chillwind, Light's Hope) and the Light
-- in the Plaguelands (priests and paladins; Chillwind, Light's Hope, the Eastweald, the
-- Cathedral). Each beat fires for its own NPC, and the journal's Stories page shows the title.

local function boot(zone, subzone, packs, class)
  local ns = Loader.Boot({
    packs = packs,
    setup = function(state)
      local p = state.units.player
      p.class, p.classFile, p.level = "Priest", class or "PRIEST", 56
      state.zone, state.subzone = zone, subzone
    end,
  })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  Mock.Fire("ZONE_CHANGED_NEW_AREA")
  Mock.RunTimers()
  return ns
end

local function talk(ns, name)
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-99001-AB", name = name, level = 60, reaction = 5 }
  local f = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
  f:Show()
  Mock.Fire("GOSSIP_SHOW")
  Mock.RunTimers()
  return ns.Conversation.session and ns.Conversation.session.info.key
end

local function text(ns) return plain(ns.UI.Dialogue.Frame().text:GetText()) or "" end

-- A quest the player has turned in (TODO_QUEST resolves through capture data).
local function questDone(ns, id, title)
  ns.db.capture.quests[id] = { title = title }
  Mock.state.questsDone[id] = true
end

-- Earlier beats heard long ago, so pacing doesn't hold the next one back.
local function heard(ns, id, state, beats)
  local t = ns.Threads.State(id)
  t.state = state
  for _, b in ipairs(beats) do t.beats[b] = 1 end
  return t
end

local WPL = { "RPGDialogue_World", "RPGDialogue_WesternPlaguelands" }
local EPL = { "RPGDialogue_World", "RPGDialogue_EasternPlaguelands" }

describe("The plague cauldrons", function()
  it("is a thread of six beats across Chillwind and the Eastweald", function()
    local ns = boot("Western Plaguelands", "Chillwind Camp", WPL)
    local t = ns.Data.threads.plague_cauldrons
    ok(t and #t.beats == 6)
    eq(ns.Data.FindNPC(nil, "Commander Ashlam Valorfist").key, "valorfist")
  end)

  it("Valorfist starts it, and Stories shows it", function()
    local ns = boot("Western Plaguelands", "Chillwind Camp", WPL)
    eq(talk(ns, "Commander Ashlam Valorfist"), "valorfist")
    contains(text(ns), "eight cauldrons breathing plague", "the beat speaks first")
    local t = ns.char.threads.plague_cauldrons
    ok(t and t.beats.b1_valorfist)
    eq(t.state, "stirring")
    ok(ns.char.topics.plague_cauldrons, "learned about the cauldrons")
    contains(ns.Journal.Text("stories"), "The plague cauldrons")
  end)

  it("MacDonnell carries it on, then Mulgris, while he lives", function()
    local ns = boot("Western Plaguelands", "Chillwind Camp", WPL, "WARRIOR")
    heard(ns, "plague_cauldrons", "stirring", { "b1_valorfist" })
    eq(talk(ns, "High Priestess MacDonnell"), "macdonnell")
    contains(text(ns), "pray over every bottle")
    eq(ns.char.threads.plague_cauldrons.state, "unfolding")

    ns = boot("Western Plaguelands", "The Writhing Haunt", WPL)
    heard(ns, "plague_cauldrons", "unfolding", { "b1_valorfist", "b2_macdonnell" })
    eq(talk(ns, "Mulgris Deepriver"), "mulgris")
    contains(text(ns), "a spoiled brew is still a brew")
    ok(ns.char.threads.plague_cauldrons.beats.b4_mulgris)
  end)

  it("Arbington's beat waits for a sample", function()
    local ns = boot("Western Plaguelands", "Chillwind Camp", WPL)
    questDone(ns, 5127, "Return to Chillwind Camp")
    eq(talk(ns, "Alchemist Arbington"), "arbington")
    contains(text(ns), "foulest thing")
    ok(ns.char.threads.plague_cauldrons.beats.b3_arbington)
  end)

  it("Tirion hears of it in the Eastweald", function()
    local ns = boot("Eastern Plaguelands", "Eastwall Gate", EPL)
    heard(ns, "plague_cauldrons", "unfolding", { "b1_valorfist", "b2_macdonnell" })
    eq(talk(ns, "Tirion Fordring"), "tirion")
    contains(text(ns), "four more of those pots")
    ok(ns.char.threads.plague_cauldrons.beats.b5_tirion)
  end)

  it("Mission Accomplished! resolves it with Valorfist", function()
    local ns = boot("Western Plaguelands", "Chillwind Camp", WPL)
    local t = heard(ns, "plague_cauldrons", "unfolding", { "b1_valorfist", "b2_macdonnell", "b3_arbington" })
    questDone(ns, 5238, "Mission Accomplished!")
    eq(talk(ns, "Commander Ashlam Valorfist"), "valorfist")
    contains(text(ns), "say thank you for it")
    eq(t.state, "resolved")
    contains(ns.Journal.Text("stories"), "Valorfist read me a citation")
  end)
end)

describe("The Dawn's letters", function()
  it("Gregor starts it in Everlook, and Stories shows it", function()
    local ns = boot("Winterspring", "Everlook", { "RPGDialogue_World", "RPGDialogue_Winterspring" })
    eq(talk(ns, "Gregor Greystone"), "gregor")
    contains(text(ns), "letters are most of what holds us together")
    eq(ns.char.threads.dawn_letters.state, "stirring")
    contains(ns.Journal.Text("stories"), "The Dawn's letters")
  end)

  it("Pureheart reads Gregor's report at Chillwind", function()
    local ns = boot("Western Plaguelands", "Chillwind Camp", WPL)
    heard(ns, "dawn_letters", "stirring", { "b1_gregor" })
    eq(talk(ns, "Argent Officer Pureheart"), "pureheart")
    contains(text(ns), "well enough")
    eq(ns.char.threads.dawn_letters.state, "unfolding")
  end)

  it("Tyrosus reads them at dawn", function()
    local ns = boot("Eastern Plaguelands", "Light's Hope Chapel", EPL)
    heard(ns, "dawn_letters", "unfolding", { "b1_gregor", "b2_pureheart" })
    eq(talk(ns, "Lord Maxwell Tyrosus"), "tyrosus")
    contains(text(ns), "one quiet hour")
    ok(ns.char.threads.dawn_letters.beats.b3_tyrosus)
  end)

  it("Gregor asks after Tyrosus, and it resolves", function()
    local ns = boot("Winterspring", "Everlook", { "RPGDialogue_World", "RPGDialogue_Winterspring" })
    local t = heard(ns, "dawn_letters", "unfolding", { "b1_gregor", "b2_pureheart", "b3_tyrosus" })
    eq(talk(ns, "Gregor Greystone"), "gregor")
    contains(text(ns), "Did Lord Tyrosus look well?")
    eq(t.state, "resolved")
  end)
end)

describe("The Light in the Plaguelands", function()
  it("MacDonnell starts it for a priest, and Stories shows it", function()
    local ns = boot("Western Plaguelands", "Chillwind Camp", WPL)
    eq(talk(ns, "High Priestess MacDonnell"), "macdonnell")
    contains(text(ns), "frightened of their own hands")
    eq(ns.char.threads.plague_light.state, "stirring")
    contains(ns.Journal.Text("stories"), "The Light in the Plaguelands")
  end)

  it("isn't for a warrior", function()
    local ns = boot("Western Plaguelands", "Chillwind Camp", WPL, "WARRIOR")
    talk(ns, "High Priestess MacDonnell")
    local t = ns.char.threads.plague_light
    ok(not (t and t.beats.b1_macdonnell))
  end)

  it("Leonid and Tirion carry it on", function()
    local ns = boot("Eastern Plaguelands", "Light's Hope Chapel", EPL)
    heard(ns, "plague_light", "stirring", { "b1_macdonnell" })
    eq(talk(ns, "Leonid Barthalomew the Revered"), "leonid")
    contains(text(ns), "dead as I am")
    eq(ns.char.threads.plague_light.state, "unfolding")

    ns = boot("Eastern Plaguelands", "Eastwall Gate", EPL)
    heard(ns, "plague_light", "stirring", { "b1_macdonnell" })
    eq(talk(ns, "Tirion Fordring"), "tirion")
    contains(text(ns), "nothing left to swing")
  end)

  it("Benedictus ends it at the Cathedral", function()
    local ns = boot("Stormwind City", "Cathedral Square", { "RPGDialogue_World", "RPGDialogue_Stormwind" })
    local t = heard(ns, "plague_light", "unfolding", { "b1_macdonnell", "b2_leonid" })
    eq(talk(ns, "Archbishop Benedictus"), "benedictus")
    contains(text(ns), "still asking")
    eq(t.state, "resolved")
  end)
end)
