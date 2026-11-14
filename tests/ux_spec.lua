-- After the first in-game test: the conversation box opens every time, lists the game's own
-- options (quests, vendor, training...), and a bug never leaves the player stuck.

local function boot(opts)
  opts = opts or {}
  local ns = Loader.Boot({
    packs = opts.packs or { "RPGDialogue_TestPack", "RPGDialogue_TestPack2" },
    db = opts.db,
    setup = function(state) state.units.player.level = opts.level or 2 end,
  })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  -- Blizzard's windows are globals that outlive a test; start with them all closed.
  for _, n in ipairs({ "GossipFrame", "QuestFrame", "MerchantFrame" }) do if _G[n] then _G[n]:Hide() end end
  return ns
end

local function npc(name, id)
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-" .. (id or 197) .. "-AB", name = name, level = 20, reaction = 5 }
end

local function open(frameName, event, name, id)
  npc(name, id)
  local f = _G[frameName] or Mock.NewFrame("Frame", frameName)
  f:Show()
  f:SetAlpha(1)
  Mock.Fire(event)
  Mock.RunTimers()
  return f
end

local function close(frameName, event)
  if _G[frameName] then _G[frameName]:Hide() end
  Mock.Fire(event, false)
  Mock.RunTimers()
end

local function labels(ns)
  local out = {}
  for _, b in ipairs(ns.UI.Dialogue.Frame().buttons) do
    if b:IsShown() then out[#out + 1] = b.label:GetText() end
  end
  return out
end

local function called(name)
  for _, c in ipairs(Mock.calls) do if c[1] == name then return c[2] end end
  return nil
end

describe("The conversation box", function()
  it("opens every time by default, not only on first meetings", function()
    local ns = boot()
    eq(ns.db.settings.openMode, "full")
    open("GossipFrame", "GOSSIP_SHOW", "Marshal McBride")
    eq(ns.Conversation.session.mode, "full")
    ns.Conversation.Business()
    close("GossipFrame", "GOSSIP_CLOSED")
    open("GossipFrame", "GOSSIP_SHOW", "Marshal McBride")
    eq(ns.Conversation.session.mode, "full", "a repeat visit with nothing new")
    eq(ns.UI.Dialogue.IsShown(), true)
    eq(ns.UI.Compact.IsShown(), false)
  end)

  it("moves the old short-line default over, but keeps a deliberate 'skip'", function()
    local ns = boot({ db = { schema = 1, settings = { openMode = "compact" } } })
    eq(ns.db.settings.openMode, "full")
    eq(ns.db.schema, ns.SavedData.SCHEMA)
    local ns2 = boot({ db = { schema = 1, settings = { openMode = "skip" } } })
    eq(ns2.db.settings.openMode, "skip")
  end)

  it("lists the NPC's quests and gossip options after the replies; picking one hands over", function()
    local ns = boot()
    Mock.state.gossipAvailable = { { title = "Kobold Camp Cleanup", questID = 9007 } }
    Mock.state.gossipActive = { { title = "A Threat Within", questID = 9001, isComplete = true },
                               { title = "Wolves Across the Border", questID = 9003, isComplete = false } }
    Mock.state.gossipOptions = { { gossipOptionID = 77, name = "I want to browse your goods." } }
    local gf = open("GossipFrame", "GOSSIP_SHOW", "Marshal McBride")
    local list = labels(ns)
    local joined = table.concat(list, " | ")
    contains(joined, "Hand in: A Threat Within")
    contains(joined, "Quest: Kobold Camp Cleanup")
    contains(joined, "Quest (in progress): Wolves Across the Border")
    contains(joined, "I want to browse your goods.")
    contains(list[#list], "Get on with it")
    -- hand-ins before new quests before quests in progress, all after the NPC's own replies
    local function pos(text) for i, l in ipairs(list) do if l:find(text, 1, true) then return i end end end
    ok(pos("Reporting for duty") < pos("Hand in:"), "replies first")
    ok(pos("Hand in:") < pos("Quest: Kobold") and pos("Quest: Kobold") < pos("in progress"), "quest order")
    eq(ns.UI.Dialogue.Frame().buttons[pos("Hand in:")].gap, true, "a little space before the game's options")

    Mock.calls = {}
    ns.UI.Dialogue.OnKey(ns.UI.Dialogue.Frame(), tostring(pos("Quest: Kobold")))
    eq(called("SelectAvailableQuest"), 9007)
    eq(ns.UI.Dialogue.IsShown(), false)
    eq(gf:GetAlpha(), 1, "the game's window is back")
    eq(ns.Conversation.session.mode, "business", "the same visit carries on in the game's window")

    -- Its quest details follow; the box doesn't pop up again for the same visit.
    open("QuestFrame", "QUEST_DETAIL", "Marshal McBride")
    eq(ns.UI.Dialogue.IsShown(), false)
  end)

  it("picks a gossip option and an active quest the same way", function()
    local ns = boot()
    Mock.state.gossipActive = { { title = "A Threat Within", questID = 9001, isComplete = true } }
    Mock.state.gossipOptions = { { gossipOptionID = 77, name = "Train me." } }
    open("GossipFrame", "GOSSIP_SHOW", "Marshal McBride")
    local list = labels(ns)
    Mock.calls = {}
    for i, l in ipairs(list) do if l:find("Train me.", 1, true) then ns.UI.Dialogue.Click(i) end end
    eq(called("SelectOption"), 77)
    close("GossipFrame", "GOSSIP_CLOSED")
    open("GossipFrame", "GOSSIP_SHOW", "Marshal McBride")
    list = labels(ns)
    Mock.calls = {}
    for i, l in ipairs(list) do if l:find("Hand in:", 1, true) then ns.UI.Dialogue.Click(i) end end
    eq(called("SelectActiveQuest"), 9001)
  end)

  it("works on the quest window too: the greeting page and a single quest", function()
    local ns = boot()
    Mock.state.greeting = { available = { "Kobold Camp Cleanup" }, active = { { "A Threat Within", true } } }
    open("QuestFrame", "QUEST_GREETING", "Marshal McBride")
    local list = labels(ns)
    local joined = table.concat(list, " | ")
    contains(joined, "Hand in: A Threat Within")
    contains(joined, "Quest: Kobold Camp Cleanup")
    Mock.calls = {}
    for i, l in ipairs(list) do if l:find("Quest: Kobold", 1, true) then ns.UI.Dialogue.Click(i) end end
    eq(called("SelectAvailableQuest#"), 1)
    close("QuestFrame", "QUEST_FINISHED")

    Mock.state.questFrame = { questID = 9007, title = "Kobold Camp Cleanup" }
    local qf = open("QuestFrame", "QUEST_DETAIL", "Deputy Willem", 9002)
    list = labels(ns)
    local idx
    for i, l in ipairs(list) do if l:find("Quest: Kobold Camp Cleanup", 1, true) then idx = i end end
    ok(idx, "the quest on offer is listed")
    ns.UI.Dialogue.Click(idx)
    eq(ns.UI.Dialogue.IsShown(), false)
    eq(qf:GetAlpha(), 1)
  end)

  it("key 0 picks the tenth option", function()
    local ns = boot()
    Mock.state.gossipOptions = {}
    for i = 1, 5 do Mock.state.gossipOptions[i] = { gossipOptionID = 100 + i, name = "Option " .. i } end
    open("GossipFrame", "GOSSIP_SHOW", "Marshal McBride")
    local list = labels(ns)
    ok(#list <= 10, "at most ten buttons")
    if #list == 10 then
      contains(list[10], "0. ")
      ns.UI.Dialogue.OnKey(ns.UI.Dialogue.Frame(), "0")
      eq(ns.UI.Dialogue.IsShown(), false, "the tenth is Get on with it")
    end
  end)
end)

describe("Safety net", function()
  it("an error says so in chat and gives the game's window back", function()
    local ns = boot()
    local real = ns.UI.Dialogue.Show
    ns.UI.Dialogue.Show = function() error("boom in Show", 0) end
    Mock.chat = {}
    local gf = open("GossipFrame", "GOSSIP_SHOW", "Marshal McBride")
    ns.UI.Dialogue.Show = real
    local text = table.concat(Mock.chat, "\n")
    contains(text, "Something went wrong")
    contains(text, "boom in Show")
    eq(gf:GetAlpha(), 1, "Blizzard's window is visible again")
    eq(ns.UI.Dialogue.IsShown(), false)
    -- Only once per message.
    Mock.chat = {}
    ns.UI.Dialogue.Show = function() error("boom in Show", 0) end
    close("GossipFrame", "GOSSIP_CLOSED")
    open("GossipFrame", "GOSSIP_SHOW", "Marshal McBride")
    ns.UI.Dialogue.Show = real
    ok(not table.concat(Mock.chat, "\n"):find("boom in Show"), "not repeated")
  end)
end)

---------------------------------------------------------------------------
-- Right-clicking someone with no menu (Melika Isenstrider)
---------------------------------------------------------------------------
local function bootReal(player)
  local ns = Loader.Boot({
    packs = { "RPGDialogue_World", "RPGDialogue_Elwynn" },
    setup = function(state)
      state.zone, state.subzone = "Elwynn Forest", "Lion's Pride Inn"
      for k, v in pairs(player or {}) do state.units.player[k] = v end
    end,
  })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  for _, n in ipairs({ "GossipFrame", "QuestFrame", "MerchantFrame" }) do if _G[n] then _G[n]:Hide() end end
  return ns
end

local MELIKA = { guid = "Creature-0-1-0-1-6000-AB", name = "Melika Isenstrider", level = 11, reaction = 5 }

-- Hover, press and release the right button (held for `hold` seconds), then let timers run.
local function rightClick(unit, hold)
  Mock.state.units.mouseover = unit
  WorldFrame:GetScript("OnMouseDown")(WorldFrame, "RightButton")
  Mock.state.clock = Mock.state.clock + (hold or 0.1)
  Mock.state.units.target = unit        -- the game targets whoever you right-click
  WorldFrame:GetScript("OnMouseUp")(WorldFrame, "RightButton")
  Mock.RunTimers()
end

describe("Right-clicking someone with no menu", function()
  it("opens the box for Melika Isenstrider", function()
    local ns = bootReal()
    rightClick(MELIKA)
    local s = ns.Conversation.session
    ok(s, "a conversation started")
    eq(s.kind, "talk")
    eq(s.info.key, "melika")
    eq(ns.UI.Dialogue.IsShown(), true)
    local f = ns.UI.Dialogue.Frame()
    contains(f.text:GetText(), "Farley talks to the guests, I feed them.")
    contains(table.concat(labels(ns), " | "), "What's in the kitchen tonight?")
    ns.UI.Dialogue.Click(1)
    contains(f.text:GetText(), "Mutton stew")
  end)

  it("has her own lines for a new level-1 character whose first login didn't know the zone yet", function()
    -- Simulate the first login: the zone was unknown at login, and Northshire -> Goldshire
    -- is the same zone, so no ZONE_CHANGED_NEW_AREA ever came.
    local ns2 = Loader.Boot({
      packs = { "RPGDialogue_World", "RPGDialogue_Elwynn" },
      setup = function(state)
        state.zone, state.subzone = "", ""
        state.units.player.level, state.units.player.classFile = 1, "PALADIN"
      end,
    })
    ns2.db.settings.instantText = true
    ns2.db.settings.sounds = false
    for _, n in ipairs({ "GossipFrame", "QuestFrame", "MerchantFrame" }) do if _G[n] then _G[n]:Hide() end end
    local elwynnLoaded = false
    for _, p in ipairs(ns2.Packs.List()) do if p.addon == "RPGDialogue_Elwynn" then elwynnLoaded = p.loaded end end
    eq(elwynnLoaded, false, "not loaded at login")
    Mock.state.zone, Mock.state.subzone = "Elwynn Forest", "Lion's Pride Inn"
    rightClick(MELIKA)
    eq(ns2.Conversation.session.info.key, "melika", "her own file, not the innkeeper pool")
    contains(ns2.UI.Dialogue.Frame().text:GetText(), "Farley talks to the guests")
  end)

  it("loads the zone's pack on a subzone change too", function()
    local ns = Loader.Boot({
      packs = { "RPGDialogue_World", "RPGDialogue_Elwynn" },
      setup = function(state) state.zone, state.subzone = "", "" end,
    })
    Mock.state.zone, Mock.state.subzone = "Elwynn Forest", "Goldshire"
    Mock.Fire("ZONE_CHANGED")
    local loaded
    for _, p in ipairs(ns.Packs.List()) do if p.addon == "RPGDialogue_Elwynn" then loaded = p.loaded end end
    eq(loaded, true)
  end)

  it("speaks to a level-22 Skyborne druid as one", function()
    local ns = bootReal({ race = "Skyborne", raceFile = "Skyborne", class = "Druid", classFile = "DRUID", level = 22 })
    rightClick(MELIKA)
    contains(ns.UI.Dialogue.Frame().text:GetText(), "A sky-folk druid.")
    local joined = table.concat(labels(ns), " | ")
    contains(joined, "Winds be with you.")
  end)

  it("ignores a held right button (turning the camera), the setting off, and NPCs out of reach", function()
    local ns = bootReal()
    rightClick(MELIKA, 1.5)
    eq(ns.Conversation.session, nil, "camera turn")
    ns.db.settings.rightClickTalk = false
    rightClick(MELIKA)
    eq(ns.Conversation.session, nil, "setting off")
    ns.db.settings.rightClickTalk = true
    Mock.state.inRange = false
    rightClick(MELIKA)
    eq(ns.Conversation.session, nil, "too far")
  end)

  it("leaves NPCs with a menu to the game, and still opens the box with their window", function()
    local ns = bootReal()
    ns.db.capture.npcs[6001] = { name = "Innkeeper Farley", gossip = true }
    local farley = { guid = "Creature-0-1-0-1-6001-AB", name = "Innkeeper Farley", level = 30, reaction = 5 }
    rightClick(farley)
    eq(ns.Conversation.session, nil, "no talk box for someone with a gossip menu")
    open("GossipFrame", "GOSSIP_SHOW", "Innkeeper Farley", 6001)
    eq(ns.Conversation.session.kind, "gossip")
    eq(ns.UI.Dialogue.IsShown(), true)
  end)

  it("adds the game's options if its window arrives after the box (slow server)", function()
    local ns = bootReal()
    local stranger = { guid = "Creature-0-1-0-1-6002-AB", name = "Innkeeper Farley", level = 30, reaction = 5 }
    rightClick(stranger)
    eq(ns.Conversation.session.kind, "talk", "not known to have a menu yet")
    Mock.state.gossipOptions = { { gossipOptionID = 5, name = "Make this inn your home." } }
    Mock.state.units.npc = stranger
    local gf = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
    gf:Show(); gf:SetAlpha(1)
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
    eq(ns.Conversation.session.kind, "gossip")
    contains(table.concat(labels(ns), " | "), "Make this inn your home.")
    eq(gf:GetAlpha(), 0, "the game's window sits faded behind the box")
  end)
end)
