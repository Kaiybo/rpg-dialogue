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
