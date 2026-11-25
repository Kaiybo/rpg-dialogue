-- Working with DialogueUI (Peterodox's addon that replaces the gossip and quest windows):
-- the box talks first over DialogueUI's waiting window, then hands over to it.

local function boot(opts)
  opts = opts or {}
  local dui
  local ns = Loader.Boot({
    packs = { "RPGDialogue_TestPack", "RPGDialogue_TestPack2" },
    db = opts.db,
    setup = function(state)
      state.units.player.level = 2
      if opts.addon ~= false then
        table.insert(state.addons, { name = opts.addon or "DialogueUI", meta = {}, loaded = true })
      end
      -- DialogueUI's window: a global frame, hidden until it handles an event.
      dui = Mock.NewFrame("Frame", "DUIQuestFrame")
      dui:Hide()
    end,
  })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  for _, n in ipairs({ "GossipFrame", "QuestFrame", "MerchantFrame" }) do if _G[n] then _G[n]:Hide() end end
  return ns, dui
end

local function talk(name)
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-197-AB", name = name, level = 20, reaction = 5 }
  Mock.Fire("GOSSIP_SHOW")
  Mock.RunTimers()
end

local function called(name)
  for _, c in ipairs(Mock.calls) do if c[1] == name then return c[2] end end
end

local function press(ns, key)
  local keys = ns.UI.Dialogue.Frame().keys
  local propagate
  keys.SetPropagateKeyboardInput = function(_, v) propagate = v end
  keys:GetScript("OnKeyDown")(keys, key)
  return propagate
end

describe("With DialogueUI", function()
  it("talks first by default, over DialogueUI's window, which waits invisible underneath", function()
    local ns, dui = boot()
    eq(ns.db.settings.otherAddons, "auto")
    eq(ns.Integrations.Mode(), "normal")
    talk("Marshal McBride")
    eq(ns.UI.Dialogue.IsShown(), true, "our box")
    -- DialogueUI shows its window a moment later, and fades it in itself.
    dui:Show()
    eq(dui:GetAlpha(), 0, "taken under the box")
    dui:SetAlpha(0.4)
    eq(dui:GetAlpha(), 0, "its own fade-in can't bring it back while we talk")
    ok(ns.Conversation.OverOtherWindow())
  end)

  it("keeps its number keys away from DialogueUI while the box is up", function()
    local ns, dui = boot()
    talk("Marshal McBride")
    dui:Show()
    eq(press(ns, "9"), false, "a number we don't use doesn't reach DialogueUI")
    eq(press(ns, "F1"), true, "other keys pass")
    eq(ns.UI.Dialogue.IsShown(), true)
  end)

  it("hands over to DialogueUI's window on Get on with it", function()
    local ns, dui = boot()
    talk("Marshal McBride")
    dui:Show()
    ns.Conversation.Business()
    eq(ns.UI.Dialogue.IsShown(), false)
    eq(dui:GetAlpha(), 1, "DialogueUI's window is back")
    eq(dui:IsShown(), true, "never hidden (that would end the conversation)")
    dui:SetAlpha(0.5)
    eq(dui:GetAlpha(), 0.5, "no longer held")
    eq(ns.Conversation.OverOtherWindow(), false)
  end)

  it("hands over with a game option picked, and when DialogueUI was already up", function()
    local ns, dui = boot()
    ns.db.settings.pagesInBox = false
    Mock.state.gossipOptions = { { gossipOptionID = 77, name = "I want to browse your goods." } }
    dui:Show()
    dui:SetAlpha(1)
    talk("Marshal McBride")
    eq(dui:GetAlpha(), 0, "faded when the box opened over it")
    local f = ns.UI.Dialogue.Frame()
    local pick
    for i, b in ipairs(f.buttons) do
      if b:IsShown() and (b.label:GetText() or ""):find("browse your goods", 1, true) then pick = i end
    end
    ok(pick, "the option is listed")
    Mock.calls = {}
    ns.UI.Dialogue.Click(pick)
    eq(called("SelectOption"), 77)
    eq(dui:GetAlpha(), 1)
    eq(ns.UI.Dialogue.IsShown(), false)
  end)

  it("keeps its windows outside the game UI, above DialogueUI's window", function()
    local ns = boot()
    talk("Marshal McBride")
    local f = ns.UI.Dialogue.Frame()
    eq(f:GetParent(), nil, "DialogueUI can fade the game UI without hiding the box")
    eq(ns.UI.Theme.Strata(), "FULLSCREEN_DIALOG")
    eq(ns.UI.Theme.Strata("blocker"), "FULLSCREEN")
  end)

  it("ends with DialogueUI's window and recovers it after an error", function()
    local ns, dui = boot()
    talk("Marshal McBride")
    dui:Show()
    ns.Conversation.Recover()
    eq(dui:GetAlpha(), 1)
    dui:Hide()
    Mock.Fire("GOSSIP_CLOSED")
    Mock.RunTimers()
    ok(not ns.Conversation.session or ns.Conversation.session.ended, "the visit ended with its window")
  end)

  it("still steps back for Immersion, and moves the old default over", function()
    local ns = boot({ addon = "Immersion" })
    eq(ns.Integrations.Mode(), "stepback")
    local ns2 = boot({ db = { schema = 4, settings = { otherAddons = "stepback" } } })
    eq(ns2.db.settings.otherAddons, "auto")
    eq(ns2.Integrations.Mode(), "normal")
    local ns3 = boot({ addon = false })
    eq(ns3.UI.Theme.Strata(), "DIALOG", "without DialogueUI nothing changes")
  end)
end)

---------------------------------------------------------------------------
-- Inside DialogueUI's window (the default): a stand-in with the methods its window has.
---------------------------------------------------------------------------
local function fakeWindow(opts)
  opts = opts or {}
  local f = Mock.NewFrame("Frame", "DUIQuestFrame")
  f:Hide()
  local log = { native = 0, layouts = 0 }
  local keys = Mock.NewFrame("Frame", nil, f)
  keys.actions = {}
  keys.SetIndexedAction = function(self, i, b) self.actions[i] = b; return tostring(i) end
  f.log, f.keys, f.buttons = log, keys, {}
  f.GetChildren = function() return keys end
  f.handler = "HandleGossip"
  f.HandleGossip = function(self) log.native = log.native + 1; self.text = "native gossip"; return true end
  f.ReleaseAllObjects = function(self) self.buttons = {}; log.layouts = log.layouts + 1 end
  f.UseQuestLayout = function() end
  f.FormatParagraph = function(self, y, text)
    self.text = text
    if opts.broken then return y end
    local fs = Mock.NewFrame("FontString", nil, self)
    return y + 20, fs, fs
  end
  f.AcquireOptionButton = function(self)
    local b = Mock.NewFrame("Button", nil, self)
    b.Icon = Mock.NewFrame("Texture", nil, b)
    b.SetGossip = function(btn, data, hotkey) btn.name = (hotkey and (hotkey .. ". ") or "") .. data.name end
    self.buttons[#self.buttons + 1] = b
    return b
  end
  f.AcquireExitButton = function(self)
    local b = Mock.NewFrame("Button", nil, self)
    b.SetButtonExitGossip = function() end
    return b
  end
  f.SetScrollRange = function() end
  return f
end

local function bootInside(opts)
  local dui
  local ns = Loader.Boot({
    packs = { "RPGDialogue_TestPack", "RPGDialogue_TestPack2" },
    setup = function(state)
      state.units.player.level = 2
      table.insert(state.addons, { name = "DialogueUI", meta = {}, loaded = true })
      dui = fakeWindow(opts)
    end,
  })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  for _, n in ipairs({ "GossipFrame", "QuestFrame", "MerchantFrame" }) do if _G[n] then _G[n]:Hide() end end
  return ns, dui
end

-- The game's event, then DialogueUI showing its window and laying out the page (ShowUI).
local function visit(dui, name)
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-197-AB", name = name, level = 20, reaction = 5 }
  Mock.Fire("GOSSIP_SHOW")
  Mock.RunTimers()
  dui:HandleGossip()
  dui:Show()
end

local function names(dui)
  local out = {}
  for _, b in ipairs(dui.buttons) do out[#out + 1] = b.name end
  return table.concat(out, " | ")
end

describe("Inside DialogueUI's window (default)", function()
  it("draws the conversation in DialogueUI's window, not in a box of ours", function()
    local ns, dui = bootInside()
    ok(ns.Integrations.InsideDialogueUI())
    visit(dui, "Marshal McBride")
    eq(ns.Conversation.session.view, "dui")
    eq(ns.UI.Dialogue.IsShown(), false, "no box of ours")
    eq(dui:GetAlpha(), 1, "its window is the one you see")
    ok(dui.text ~= "native gossip" and dui.text ~= "", "the NPC's line in its window")
    contains(names(dui), "1. Reporting for duty", "our replies as its options, with its number keys")
    contains(names(dui), "Get on with it")
    ok(dui.keys.actions[1], "number key 1 picks our first reply")
    Mock.RunTimers()
    eq(ns.Conversation.session.view, "dui", "still there once its window showed")
  end)

  it("follows the conversation in its window, and Get on with it shows its own page", function()
    local ns, dui = bootInside()
    visit(dui, "Marshal McBride")
    local before = dui.text
    dui.buttons[1].onClickFunc(dui.buttons[1])
    ok(dui.text ~= before or ns.Conversation.session == nil, "the next line, in its window")
    if ns.Conversation.session then
      local last = dui.buttons[#dui.buttons]
      eq(last.name:match("Get on with it") ~= nil, true)
      local native = dui.log.native
      last.onClickFunc(last)
      eq(dui.log.native, native + 1, "its own gossip page again")
      eq(dui.text, "native gossip")
    end
  end)

  it("lets its own pages take over when a game option is picked", function()
    local ns, dui = bootInside()
    Mock.state.gossipOptions = { { gossipOptionID = 77, name = "I want to browse your goods." } }
    visit(dui, "Marshal McBride")
    local pick
    for i, b in ipairs(dui.buttons) do if b.name:find("browse your goods", 1, true) then pick = i end end
    ok(pick)
    Mock.calls = {}
    dui.buttons[pick].onClickFunc(dui.buttons[pick])
    eq(called("SelectOption"), 77)
    eq(ns.Conversation.session.mode, "business")
    dui:HandleGossip()
    eq(dui.text, "native gossip", "the next page is its own")
  end)

  it("moves to the box if its window can't take the page", function()
    local ns, dui = bootInside({ broken = true })
    visit(dui, "Marshal McBride")
    Mock.RunTimers()
    eq(ns.Conversation.session.view, nil)
    eq(ns.UI.Dialogue.IsShown(), true, "RPG Dialogue's box instead")
    eq(dui:GetAlpha(), 0, "its window waits underneath")
  end)

  it("uses the box when its window never shows", function()
    local ns, dui = bootInside()
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-197-AB", name = "Marshal McBride", level = 20, reaction = 5 }
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
    eq(ns.UI.Dialogue.IsShown(), false)
    Mock.RunTimers()
    eq(ns.UI.Dialogue.IsShown(), true, "after a moment, the box")
    ok(dui, "its window stayed hidden")
  end)

  it("lists every topic a page at a time, and stays on the list after an answer", function()
    local ns, dui = bootInside()
    ns.Data.topics.knows = { id = "knows", name = "What do you know?", category = "anyone", standard = true, order = 0 }
    for i = 1, 12 do
      local id = "t" .. i
      ns.Data.topics[id] = { id = id, name = "Topic " .. i, category = "people" }
      ns.char.topics[id] = { t = ns.Compat.Now() - 100 + i }
    end
    visit(dui, "Marshal McBride")
    local ask
    for i, b in ipairs(dui.buttons) do if b.name:find("Ask about... (12)", 1, true) then ask = i end end
    ok(ask, "Ask about with the count: " .. names(dui))
    dui.buttons[ask].onClickFunc(dui.buttons[ask])
    contains(names(dui), "What do you know?")
    contains(names(dui), "More topics (page 2 of 2)")
    contains(names(dui), "Back")
    local more
    for i, b in ipairs(dui.buttons) do if b.name:find("More topics", 1, true) then more = i end end
    dui.buttons[more].onClickFunc(dui.buttons[more])
    contains(names(dui), "Previous topics")
    contains(names(dui), "Topic 1")
    dui.buttons[1].onClickFunc(dui.buttons[1])
    contains(names(dui), "Previous topics", "still on the list after the answer")
  end)

  it("keeps RPG Dialogue's box first when that's chosen", function()
    local ns, dui = bootInside()
    ns.db.settings.otherAddons = "takeover"
    visit(dui, "Marshal McBride")
    eq(ns.UI.Dialogue.IsShown(), true)
    eq(dui:GetAlpha(), 0)
  end)
end)

describe("Talk key with DialogueUI", function()
  it("opens DialogueUI's window itself, and closing it ends the visit", function()
    local ns, dui = bootInside()
    Mock.state.units.target = { guid = "Creature-0-1-0-1-9002-AB", name = "Deputy Willem", level = 10 }
    ns.Conversation.TalkToTarget()
    local s = ns.Conversation.session
    eq(s.kind, "talk")
    eq(s.view, "dui")
    eq(dui:IsShown(), true, "its window, opened by us")
    eq(ns.UI.Dialogue.IsShown(), false, "no box of ours")
    contains(names(dui), "Get on with it")
    dui:Hide()
    eq(ns.Conversation.session, nil, "Goodbye or Escape in its window ends the visit")
  end)

  it("closes the window it opened when the visit ends", function()
    local ns, dui = bootInside()
    Mock.state.units.target = { guid = "Creature-0-1-0-1-9002-AB", name = "Deputy Willem", level = 10 }
    ns.Conversation.TalkToTarget()
    ns.Conversation.Business()
    eq(ns.Conversation.session, nil)
    eq(dui:IsShown(), false, "nothing left open")
  end)

  it("uses the box when DialogueUI's window is busy", function()
    local ns, dui = bootInside()
    dui:Show()
    Mock.state.units.target = { guid = "Creature-0-1-0-1-9002-AB", name = "Deputy Willem", level = 10 }
    ns.Conversation.TalkToTarget()
    eq(ns.Conversation.session.view, nil)
    eq(ns.UI.Dialogue.IsShown(), true)
  end)
end)

describe("Quests from the conversation in DialogueUI", function()
  it("comes back to the conversation when the NPC's menu returns after the quest", function()
    local ns, dui = bootInside()
    Mock.state.gossipAvailable = { { title = "Kobold Camp Cleanup", questID = 9007 } }
    visit(dui, "Marshal McBride")
    local pick
    for i, b in ipairs(dui.buttons) do if (b.name or ""):find("Kobold Camp Cleanup", 1, true) then pick = i end end
    ok(pick, "the quest is among our rows: " .. names(dui))
    dui.buttons[pick].onClickFunc(dui.buttons[pick])
    eq(ns.Conversation.session.mode, "business", "DialogueUI's quest page takes over")
    -- Accepted in DialogueUI's window; the game sends the NPC's menu again.
    Mock.Fire("QUEST_FINISHED")
    Mock.state.gossipAvailable = {}
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
    local s = ns.Conversation.session
    ok(s, "the visit carries on")
    eq(s.mode, "full", "back in the conversation")
    dui:HandleGossip()
    contains(names(dui), "Get on with it", "our page again, not DialogueUI's plain menu")
  end)
end)

describe("Our windows in DialogueUI's style", function()
  it("switches once to DialogueUI's parchment, following its theme", function()
    local ns, dui = boot()
    eq(ns.db.settings.look, "dialogueui", "set once on login")
    eq(ns.UI.Theme.Look(), "dui")
    talk("Marshal McBride")
    local d = ns.UI.Dialogue.Frame().rpgdTex.dui
    ok(d and d.top:IsShown(), "its parchment behind our box")
    contains(d.top:GetTexture(), "Theme_Brown")
    eq(ns.UI.Theme.Palette().dark, nil)
    _G.DialogueUI_DB = { Theme = 2 }
    ok(ns.UI.Theme.Palette().dark, "its dark theme, dark ink")
    _G.DialogueUI_DB = nil
    ns.db.settings.look = "wood"
    eq(ns.UI.Theme.Look(), "wood", "and can be switched back")
  end)
end)
