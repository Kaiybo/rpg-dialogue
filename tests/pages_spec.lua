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

  it("hands in: continue when ready, then pick a reward", function()
    local ns = boot()
    Mock.state.questFrame = { questID = 9001, title = "A Threat Within", progress = "Is it done?",
      required = { { "Kobold Ear", 1, 5 } }, completable = false }
    Mock.state.greeting = { available = {}, active = { { "A Threat Within", true } } }
    open("QuestFrame", "QUEST_GREETING")
    click(ns, "Hand in: A Threat Within")
    Mock.Fire("QUEST_PROGRESS")
    Mock.RunTimers()
    local f = ns.UI.Dialogue.Frame()
    contains(f.text:GetText(), "Kobold Ear x5")
    local continue = rows(ns)[1]
    eq(continue.locked, true, "not ready yet")
    Mock.state.questFrame.completable = true
    Mock.Fire("QUEST_PROGRESS")
    Mock.RunTimers()
    Mock.calls = {}
    click(ns, "Continue")
    ok(called("CompleteQuest"))
    Mock.state.questFrame.reward = "Well done."
    Mock.state.questFrame.choices = { { "Sword", 1 }, { "Shield", 2 } }
    Mock.Fire("QUEST_COMPLETE")
    Mock.RunTimers()
    contains(f.text:GetText(), "Well done.")
    local shield = click(ns, "Take: Shield")
    eq(called("GetQuestReward")[2], 2)
    eq(shield.tooltip.kind, "choice", "the game's item tooltip on hover")
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
