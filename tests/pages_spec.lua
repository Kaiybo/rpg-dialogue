-- The game's own pages kept in the conversation box: picking a gossip option or a quest in
-- the box shows the next gossip page and the quest pages in the same box.

local function boot()
  local ns = Loader.Boot({
    packs = { "RPGDialogue_TestPack", "RPGDialogue_TestPack2" },
    setup = function(state) state.units.player.level = 2 end,
  })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  for _, n in ipairs({ "GossipFrame", "QuestFrame", "MerchantFrame" }) do if _G[n] then _G[n]:Hide() end end
  return ns
end

local function npc() Mock.state.units.npc = { guid = "Creature-0-1-0-1-197-AB", name = "Marshal McBride", level = 20, reaction = 5 } end

local function open(frameName, event)
  npc()
  local f = _G[frameName] or Mock.NewFrame("Frame", frameName)
  f:Show()
  f:SetAlpha(1)
  Mock.Fire(event)
  Mock.RunTimers()
  return f
end

local function rows(ns)
  local out = {}
  for _, b in ipairs(ns.UI.Dialogue.Frame().buttons) do
    if b:IsShown() then out[#out + 1] = b end
  end
  return out
end

local function click(ns, text)
  for i, b in ipairs(rows(ns)) do
    if (b.label:GetText() or ""):find(text, 1, true) then ns.UI.Dialogue.Click(i); return b end
  end
  error("no row with " .. text)
end

local function called(name)
  local hit
  for _, c in ipairs(Mock.calls) do if c[1] == name then hit = c end end
  return hit
end

describe("The game's pages in the box", function()
  it("shows the next gossip page in the same box", function()
    local ns = boot()
    Mock.state.gossipOptions = { { gossipOptionID = 5, name = "What can you do at an inn?" } }
    local gf = open("GossipFrame", "GOSSIP_SHOW")
    gf:SetAlpha(1)
    Mock.calls = {}
    click(ns, "What can you do at an inn?")
    ok(called("SelectOption"), "picked in the game")
    eq(ns.UI.Dialogue.IsShown(), true, "the box stays")
    Mock.state.gossipText = "Well when you stay at an inn, you rest very comfortably."
    Mock.state.gossipOptions = { { gossipOptionID = 6, name = "Make this inn your home." } }
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
    local f = ns.UI.Dialogue.Frame()
    contains(f.text:GetText(), "you rest very comfortably")
    click(ns, "Make this inn your home.")
    eq(called("SelectOption")[2], 6)
    eq(ns.UI.Dialogue.IsShown(), true)
  end)

  it("shows a quest's offer, accepts it, and gives the game's windows back their alpha", function()
    local ns = boot()
    Mock.state.gossipAvailable = { { title = "Kobold Camp Cleanup", questID = 9007 } }
    local gf = open("GossipFrame", "GOSSIP_SHOW")
    click(ns, "Quest: Kobold Camp Cleanup")
    eq(called("SelectAvailableQuest")[2], 9007)
    eq(ns.UI.Dialogue.IsShown(), true)
    Mock.state.questFrame = { questID = 9007, title = "Kobold Camp Cleanup", text = "Kobolds have been seen.",
      objectives = "Kill 10 Kobold Vermin.", rewards = { { "Militia Buckler", 135000, 1 } }, money = 250, xp = 170 }
    gf:Hide()
    local qf = open("QuestFrame", "QUEST_DETAIL")
    local f = ns.UI.Dialogue.Frame()
    local text = f.text:GetText()
    contains(text, "Kobolds have been seen.")
    contains(text, "Quest Objectives")
    contains(text, "Kill 10 Kobold Vermin.")
    contains(text, "Militia Buckler")
    contains(text, "170 experience")
    eq(f.subtitle:GetText(), "<Kobold Camp Cleanup>")
    eq(gf:GetAlpha(), 1, "the gossip window isn't left invisible")
    eq(qf:GetAlpha(), 0, "the quest window waits under the box")
    Mock.calls = {}
    click(ns, "Accept")
    ok(called("AcceptQuest"))
  end)

  it("hands in: continue when ready, then pick a reward and confirm it", function()
    local ns = boot()
    Mock.state.questFrame = { questID = 9001, title = "A Threat Within", progress = "Is it done?",
      required = { { "Kobold Ear", 1, 5 } }, completable = false }
    Mock.state.bags = { ["Kobold Ear"] = 3 }
    Mock.state.greeting = { available = {}, active = { { "A Threat Within", true } } }
    open("QuestFrame", "QUEST_GREETING")
    click(ns, "Hand in: A Threat Within")
    Mock.Fire("QUEST_PROGRESS")
    Mock.RunTimers()
    local f = ns.UI.Dialogue.Frame()
    contains(f.text:GetText(), "Kobold Ear")
    contains(f.text:GetText(), "3/5", "what the player carries against what's needed")
    local continue = rows(ns)[1]
    eq(continue.locked, true, "not ready yet")
    contains(continue.label:GetText(), "not finished yet", "says why in words")
    Mock.state.questFrame.completable = true
    Mock.state.bags = { ["Kobold Ear"] = 7 }
    Mock.Fire("QUEST_PROGRESS")
    Mock.RunTimers()
    contains(f.text:GetText(), "5/5", "never more than needed")
    Mock.calls = {}
    click(ns, "Continue")
    ok(called("CompleteQuest"))
    Mock.state.questFrame.reward = "Well done."
    Mock.state.questFrame.choices = { { "Sword", 1, 1, 2 }, { "Shield", 2, 1, 3, false } }
    Mock.state.questFrame.money = 150
    Mock.Fire("QUEST_COMPLETE")
    Mock.RunTimers()
    contains(f.text:GetText(), "Well done.")
    contains(f.text:GetText(), "Choose your reward:")
    -- Nothing chosen yet: Complete is locked, and picking a reward doesn't hand in.
    local complete = click(ns, "choose a reward first")
    eq(complete.locked, true)
    eq(called("GetQuestReward"), nil, "no reward taken by accident")
    Mock.calls = {}
    local shield = click(ns, "Shield")
    eq(called("GetQuestReward"), nil, "picking only marks it")
    eq(shield.tooltip.kind, "choice", "the game's item tooltip on hover")
    contains(shield.label:GetText(), "can't use", "unusable said in words")
    contains(rows(ns)[2].label:GetText(), "(chosen)")
    ok(rows(ns)[2].label:GetText():find("|cff0050a8Shield", 1, true), "rare in its quality color, deepened for parchment")
    contains(f.text:GetText(), "Well done.", "the text stays")
    click(ns, "Sword")
    contains(rows(ns)[1].label:GetText(), "(chosen)")
    eq((rows(ns)[2].label:GetText()):find("(chosen)", 1, true), nil, "only one at a time")
    click(ns, "Complete quest, taking")
    eq(called("GetQuestReward")[2], 1)
  end)

  it("shows a single reward on the reward page and takes it on Complete", function()
    local ns = boot()
    Mock.state.questFrame = { questID = 9002, title = "Report to Goldshire", reward = "Thanks.",
      choices = { { "Militia Buckler", 135000, 1, 2 } }, rewards = { { "Bread", 5, 4 } }, xp = 80 }
    open("QuestFrame", "QUEST_COMPLETE")
    click(ns, "Hand in: Report to Goldshire")
    local text = ns.UI.Dialogue.Frame().text:GetText()
    contains(text, "Militia Buckler")
    contains(text, "Bread x4")
    contains(text, "You will also receive:")
    contains(text, "80 experience")
    Mock.calls = {}
    click(ns, "Complete quest")
    eq(called("GetQuestReward")[2], 1)
  end)

  it("waits for item names the game hasn't loaded, then fills them in without retyping", function()
    local ns = boot()
    ns.db.settings.instantText = false
    Mock.state.questFrame = { questID = 9003, title = "From Seed to Sprout", progress = "We grow 'em up.",
      required = { { "Tree Sprouting Kit", 4321, 1 } }, completable = true }
    Mock.state.itemsLoading = { ["Tree Sprouting Kit"] = true }
    Mock.state.bags = { ["Tree Sprouting Kit"] = 1 }
    open("QuestFrame", "QUEST_PROGRESS")
    Mock.calls = {}
    click(ns, "Hand in: From Seed to Sprout")
    ok(called("RequestLoadItemDataByID"), "asked the game to load it")
    local D = ns.UI.Dialogue
    D.FinishText()
    local f = D.Frame()
    local text = f.text:GetText()
    contains(text, "...")
    ok(not text:find("4321", 1, true) or text:find("|T4321:", 1, true), "no bare item number in the text")
    ok(not text:find("item:", 1, true), "no item string in the text")
    Mock.state.itemsLoading = nil
    Mock.Fire("GET_ITEM_INFO_RECEIVED", 4321, true)
    Mock.RunTimers()
    contains(f.text:GetText(), "Tree Sprouting Kit")
    contains(f.text:GetText(), "1/1")
    eq(ns.Conversation.session.itemsPending, false)
  end)

  it("shows reward icons large: in the text and on the rows to choose from", function()
    local ns = boot()
    Mock.state.questFrame = { questID = 9004, title = "Choices", reward = "Pick.",
      choices = { { "Sword", 11, 1, 2 }, { "Shield", 12, 1, 2 } }, rewards = { { "Bread", 13, 1 } } }
    open("QuestFrame", "QUEST_COMPLETE")
    click(ns, "Hand in: Choices")
    local size = ns.Conversation.ItemIconSize()
    ok(size >= 24, "about twice the text height")
    contains(ns.UI.Dialogue.Frame().text:GetText(), "|T13:" .. size .. ":" .. size .. "|t")
    local sword = rows(ns)[1]
    eq(sword.iconSize, size)
    ok(sword:GetHeight() >= size, "the row makes room for it")
  end)

  it("hands over what needs the game's own confirmation, and opens vendors as usual", function()
    local ns = boot()
    Mock.state.questFrame = { questID = 9010, title = "Battle Orders", text = "Fight.", pvp = true }
    open("QuestFrame", "QUEST_DETAIL")
    -- The quest is offered straight away (a single quest): reveal its page in the box.
    click(ns, "Quest: Battle Orders")
    contains(ns.UI.Dialogue.Frame().text:GetText(), "Fight.")
    click(ns, "Accept (in the quest window)")
    eq(ns.UI.Dialogue.IsShown(), false, "the game's window, for its PvP confirmation")

    local ns2 = boot()
    Mock.state.gossipOptions = { { gossipOptionID = 77, name = "I want to browse your goods." } }
    local gf = open("GossipFrame", "GOSSIP_SHOW")
    click(ns2, "browse your goods")
    gf:Hide()
    Mock.NewFrame("Frame", "MerchantFrame"):Show()
    Mock.Fire("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", Enum.PlayerInteractionType.Merchant)
    Mock.RunTimers()
    eq(ns2.UI.Dialogue.IsShown(), false, "the vendor's own window")
    eq(gf:GetAlpha(), 1)
  end)

  it("can be turned off: picking hands over to the game's window", function()
    local ns = boot()
    ns.db.settings.pagesInBox = false
    Mock.state.gossipOptions = { { gossipOptionID = 5, name = "What can you do at an inn?" } }
    open("GossipFrame", "GOSSIP_SHOW")
    click(ns, "What can you do at an inn?")
    eq(ns.UI.Dialogue.IsShown(), false)
  end)
end)

describe("Staying in the box (no game menu in between)", function()
  local function getOn(ns)
    local r = rows(ns)
    contains(r[#r].label:GetText(), "Get on with it")
    ns.UI.Dialogue.Click(#r)
  end

  it("Get on with it goes straight to the NPC's one service", function()
    local ns = boot()
    Mock.state.gossipOptions = { { gossipOptionID = 77, name = "I want to browse your goods." } }
    local gf = open("GossipFrame", "GOSSIP_SHOW")
    Mock.calls = {}
    getOn(ns)
    eq(called("SelectOption")[2], 77, "the vendor option, picked for the player")
    eq(ns.UI.Dialogue.IsShown(), true, "the box stays until the vendor's window comes")
    eq(gf:GetAlpha(), 0, "the game's menu never shows")
    gf:Hide()
    Mock.NewFrame("Frame", "MerchantFrame"):Show()
    Mock.Fire("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", Enum.PlayerInteractionType.Merchant)
    Mock.RunTimers()
    eq(ns.UI.Dialogue.IsShown(), false, "the vendor's own window")
  end)

  it("with several options, Get on with it shows the menu in the box, ending in Goodbye", function()
    local ns = boot()
    Mock.state.gossipOptions = {
      { gossipOptionID = 5, name = "Make this inn your home." },
      { gossipOptionID = 6, name = "I want to browse your goods." },
    }
    Mock.state.gossipText = "Welcome to the inn."
    local gf = open("GossipFrame", "GOSSIP_SHOW")
    getOn(ns)
    eq(ns.UI.Dialogue.IsShown(), true)
    eq(gf:GetAlpha(), 0, "the game's menu stays hidden")
    local r = rows(ns)
    contains(r[1].label:GetText(), "Make this inn your home.")
    contains(r[2].label:GetText(), "browse your goods")
    contains(r[#r].label:GetText(), "Goodbye.")
    ns.UI.Dialogue.Click(#r)
    eq(ns.Conversation.session, nil, "Goodbye ends the visit")
  end)

  it("a reply that leads to business picks the service its words ask for", function()
    local ns = boot()
    Mock.state.gossipOptions = {
      { gossipOptionID = 5, name = "Make this inn your home." },
      { gossipOptionID = 6, name = "I want to browse your goods." },
    }
    open("GossipFrame", "GOSSIP_SHOW")
    Mock.calls = {}
    click(ns, "Reporting for duty")
    click(ns, "Show me the work")
    eq(called("SelectOption")[2], 6, "'Show me...' means the goods, not the inn")
  end)

  it("knows a service by the gossip window's icon when the words don't say", function()
    local ns = boot()
    _G.GetFileIDFromPath = function(path) return path:find("TrainerGossipIcon") and 132058 or 1 end
    Mock.state.gossipOptions = { { gossipOptionID = 9, name = "Let us talk.", icon = 132058 } }
    open("GossipFrame", "GOSSIP_SHOW")
    Mock.calls = {}
    eq(ns.Conversation.OptionKind({ name = "Let us talk.", icon = 132058 }), "trainer")
    _G.GetFileIDFromPath = nil
  end)

  it("Escape and the close button end the visit instead of showing the game's menu", function()
    local ns = boot()
    Mock.state.gossipOptions = { { gossipOptionID = 5, name = "What can you do at an inn?" } }
    local gf = open("GossipFrame", "GOSSIP_SHOW")
    local f = ns.UI.Dialogue.Frame()
    ns.UI.Dialogue.OnKey(f, "ESCAPE")
    eq(ns.Conversation.session, nil)
    eq(ns.UI.Dialogue.IsShown(), false)
    eq(gf:GetAlpha(), 1, "nothing left faded")
  end)

  it("someone we have no lines for still gets their menu in the box", function()
    local ns = boot()
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-424242-AB", name = "Nobody In Particular", level = 10, reaction = 5 }
    Mock.state.gossipText = "Need something?"
    Mock.state.gossipOptions = { { gossipOptionID = 3, name = "Tell me about this place." } }
    local gf = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
    gf:Show(); gf:SetAlpha(1)
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
    eq(ns.Conversation.session.menuOnly, true)
    eq(ns.UI.Dialogue.IsShown(), true)
    eq(gf:GetAlpha(), 0)
    eq(ns.UI.Dialogue.Frame().name:GetText(), "Nobody In Particular")
    contains(ns.UI.Dialogue.Frame().text:GetText(), "Need something?")
    Mock.calls = {}
    click(ns, "Tell me about this place.")
    eq(called("SelectOption")[2], 3)
    Mock.state.gossipText = "It's quiet."
    Mock.state.gossipOptions = {}
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
    contains(ns.UI.Dialogue.Frame().text:GetText(), "It's quiet.", "the next page in the box too")
    ns.db.settings.pagesInBox = false
  end)

  it("with pages in the box turned off, the game's menu comes back as before", function()
    local ns = boot()
    ns.db.settings.pagesInBox = false
    Mock.state.gossipOptions = { { gossipOptionID = 77, name = "I want to browse your goods." } }
    local gf = open("GossipFrame", "GOSSIP_SHOW")
    ns.Conversation.Business()
    eq(ns.UI.Dialogue.IsShown(), false)
    eq(gf:GetAlpha(), 1)
    eq(ns.Conversation.session.mode, "business")
  end)
end)
