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
