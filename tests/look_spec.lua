-- The "game style" look: the conversation box built from the game's own quest and gossip
-- window art, with "parchment and wood" as the other choice and the fallback.

local function boot(opts)
  opts = opts or {}
  local ns = Loader.Boot({
    packs = { "RPGDialogue_TestPack", "RPGDialogue_TestPack2" },
    db = opts.db,
    setup = function(state)
      state.units.player.level = 2
      if opts.setup then opts.setup(state) end
    end,
  })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  for k, v in pairs(opts.settings or {}) do ns.db.settings[k] = v end
  for _, n in ipairs({ "GossipFrame", "QuestFrame", "MerchantFrame" }) do if _G[n] then _G[n]:Hide() end end
  return ns
end

local function gossip(name)
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-197-AB", name = name, level = 20, reaction = 5 }
  local f = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
  f:Show()
  f:SetAlpha(1)
  Mock.Fire("GOSSIP_SHOW")
  Mock.RunTimers()
  return f
end

local function shownRows(ns)
  local out = {}
  for _, b in ipairs(ns.UI.Dialogue.Frame().buttons) do if b:IsShown() then out[#out + 1] = b end end
  return out
end

local function rowFor(ns, text)
  for _, b in ipairs(shownRows(ns)) do
    if (b.label:GetText() or ""):find(text, 1, true) then return b end
  end
end

describe("Window style", function()
  it("defaults to the game's own look when the client has its art", function()
    local ns = boot()
    eq(ns.db.settings.look, "game")
    eq(ns.UI.Theme.Look(), "game")
    gossip("Marshal McBride")
    local f = ns.UI.Dialogue.Frame()
    ok(rawget(f, "TopLeftCorner"), "the game's metal frame border")
    eq(rawget(f, "TopLeftCorner"):GetAtlas(), "PortraitFrameTemplate:TopLeftCorner")
    eq(f.rpgdTex.bg:IsShown(), false, "no wood")
    eq(ns.UI.Theme.GamePart(f, "paperAtlas"), "QuestBG-Parchment", "the quest parchment")
    local portrait = ns.UI.Theme.GamePart(f, "portrait")
    eq(portrait._portrait, "npc", "the NPC's round portrait, as on the gossip window")
    eq(f.model:IsShown(), false)
    eq(f.rule:IsShown(), false, "no wood rules")
  end)

  it("gives replies the gossip speech bubble, the game's quest icons, and a bullet to leave", function()
    local ns = boot()
    Mock.state.gossipAvailable = { { title = "Kobold Camp Cleanup", questID = 9007 } }
    Mock.state.gossipActive = { { title = "Wolves Across the Border", questID = 9003, isComplete = false } }
    Mock.state.gossipOptions = { { gossipOptionID = 77, name = "I want to browse your goods.", icon = 132060 } }
    gossip("Marshal McBride")
    local reply = rowFor(ns, "Reporting for duty")
    ok(reply and reply.icon:IsShown(), "a reply has an icon")
    eq(reply.icon:GetTexture(), "Interface\\GossipFrame\\GossipGossipIcon")
    eq(rowFor(ns, "Kobold Camp Cleanup").icon:GetTexture(), "Interface/GossipFrame/AvailableQuestIcon")
    eq(rowFor(ns, "Wolves Across the Border").icon:GetAtlas(), "SideInProgressquesticon")
    eq(rowFor(ns, "browse your goods").icon:GetTexture(), 132060, "the option's own icon")
    eq(rowFor(ns, "Get on with it").icon:GetTexture(), "Interface\\QuestFrame\\UI-Quest-BulletPoint")
    ok(not (rowFor(ns, "Kobold Camp Cleanup").label:GetText()):find("|A:", 1, true), "no inline icon markup")
    eq(reply.hl:GetTexture(), "Interface\\QuestFrame\\UI-QuestTitleHighlight", "the gossip list's highlight bar")
    eq(reply.stripe:IsShown(), false)
  end)

  it("uses the game's red buttons and close button", function()
    local ns = boot()
    gossip("Marshal McBride")
    local f = ns.UI.Dialogue.Frame()
    eq(f.ask.red[1]:IsShown(), true)
    eq(f.ask.red[1]:GetTexture(), "Interface\\Buttons\\UI-Panel-Button-Up")
    eq(f.ask.bg:IsShown(), false)
    local r, g, b = f.ask.label:GetTextColor()
    eq(r, 1); eq(g, 0.82); eq(b, 0)
    eq(f.close.closeArt:GetAtlas(), "RedButton-Exit")
    eq(f.close.label:IsShown(), false)
    f.close:GetScript("OnClick")(f.close)
    eq(ns.UI.Dialogue.IsShown(), false, "the close button is still Get on with it")
  end)

  it("switches to parchment and wood, and back, in place", function()
    local ns = boot()
    gossip("Marshal McBride")
    local f = ns.UI.Dialogue.Frame()
    ns.db.settings.look = "wood"
    ns.UI.Dialogue.Restyle()
    eq(ns.UI.Theme.Look(), "wood")
    eq(f.rpgdTex.bg:IsShown(), true)
    eq(rawget(f, "TopLeftCorner"):IsShown(), false)
    eq(f.model:IsShown(), true)
    eq(f.ask.red[1]:IsShown(), false)
    eq(f.ask.bg:IsShown(), true)
    eq(rowFor(ns, "Reporting for duty").icon:IsShown(), false, "no speech bubbles on wood")
    eq(rowFor(ns, "Reporting for duty").stripe:IsShown(), true)
    ns.db.settings.look = "game"
    ns.UI.Dialogue.Restyle()
    eq(f.rpgdTex.bg:IsShown(), false)
    eq(rawget(f, "TopLeftCorner"):IsShown(), true)
  end)

  it("keeps the parchment's proportions: drawn from its corner and cut off, not squashed", function()
    local ns = boot()
    gossip("Marshal McBride")
    local f = ns.UI.Dialogue.Frame()
    local paper = ns.UI.Theme.GamePart(f, "paper")
    eq(paper:GetTexture(), 9001, "the parchment's own texture file")
    local c = paper._coords
    ok(c, "cropped")
    eq(c[1], 0); eq(c[3], 0)
    ok(c[2] <= 0.5 and c[4] < 0.8, "only part of it shows, from the top-left")
    -- Width fills (the box is wider than the parchment), height is cut: same scale both ways.
    local shownW, shownH = (c[2] / 0.5) * 330, (c[4] / 0.8) * 420
    local scale = math.max(1, 344 / 330)
    ok(math.abs(shownW * scale - 344) < 1, "width at the parchment's scale")
    ok(shownH < 420, "height cut, not squashed")
  end)

  it("builds the Ask list like the box: title bar, header search, same height", function()
    local ns = boot()
    ns.char.topics = ns.char.topics or {}
    gossip("Marshal McBride")
    local f = ns.UI.Dialogue.Frame()
    local heights = {}
    f.GetHeight = function() return 230 end
    ns.UI.AskAbout.Toggle(f)
    eq(ns.UI.AskAbout.IsShown(), true)
    local rows = ns.UI.AskAbout.Rows()
    local panel = rows[1]:GetParent()
    panel.SetHeight = function(_, h) heights[#heights + 1] = h end
    ns.UI.AskAbout.Fit(f)
    eq(heights[#heights], 230, "matches the box")
    ok(rawget(panel, "TopLeftCorner"), "the game's frame border")
    eq(rawget(panel, "TopLeftCorner"):GetAtlas(), "ButtonFrameTemplateNoPortrait:TopLeftCorner")
    ok(ns.UI.Theme.GamePart(panel, "inset"), "an inset with parchment")
    eq(panel.close.closeArt:GetAtlas(), "RedButton-Exit")
    panel.close:GetScript("OnClick")(panel.close)
    eq(ns.UI.AskAbout.IsShown(), false, "its own close button")
  end)

  it("falls back to wood when the client lacks the art, and says so in settings", function()
    local ns = boot({ setup = function(state) state.gameArt = false end })
    eq(ns.db.settings.look, "game", "the setting stays")
    eq(ns.UI.Theme.Look(), "wood")
    gossip("Marshal McBride")
    local f = ns.UI.Dialogue.Frame()
    eq(f.rpgdTex.bg:IsShown(), true)
    eq(rawget(f, "TopLeftCorner"), nil)
    eq(ns.UI.Theme.GamePart(f, "portrait"), nil)
  end)

  it("falls back to wood if applying the frame border fails", function()
    local ns = boot({ setup = function(state) state.nineSliceFails = true end })
    gossip("Marshal McBride")
    eq(ns.UI.Theme.Look(), "wood")
    eq(ns.UI.Dialogue.Frame().rpgdTex.bg:IsShown(), true)
    eq(ns.UI.Dialogue.IsShown(), true, "the conversation still works")
  end)

  it("follows the game's quest text contrast setting", function()
    local ns = boot({ setup = function(state) state.questTextContrast = 4 end })
    gossip("Marshal McBride")
    local f = ns.UI.Dialogue.Frame()
    eq(ns.UI.Theme.GamePart(f, "paperAtlas"), "QuestBG-Parchment-Accessibility4", "the dark background")
    local r = f.text:GetTextColor()
    eq(r, 1, "light text on it")
    ns.db.settings.highContrast = true
    Mock.state.questTextContrast = 0
    ns.UI.Dialogue.Restyle()
    eq(ns.UI.Theme.GamePart(f, "paperAtlas"), "QuestBG-Parchment-Accessibility4", "our high contrast uses it too")
  end)

  it("names use the window's own font: Friz in the game style, Morpheus on wood", function()
    local ns = boot({ db = { schema = 3, settings = { fontName = "morpheus" } } })
    eq(ns.db.settings.fontName, "auto", "the old default moves over")
    eq((ns.UI.Theme.FontPath("name")), "Fonts\\FRIZQT__.TTF")
    ns.db.settings.look = "wood"
    eq((ns.UI.Theme.FontPath("name")), "Fonts\\MORPHEUS.TTF")
    local ns2 = boot({ db = { schema = 3, settings = { fontName = "cinzel" } } })
    eq(ns2.db.settings.fontName, "cinzel", "a different choice is kept")
    local found
    for _, c in ipairs(ns2.UI.Theme.FontChoices("name")) do if c.id == "auto" then found = c end end
    ok(found and found.label, "offered in settings")
  end)

  it("opens where the game opens its quest windows when there's no game window", function()
    local ns = boot()
    local placed
    local D = ns.UI.Dialogue
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-197-AB", name = "Marshal McBride", level = 20, reaction = 5 }
    D.Show({ name = "Marshal McBride", unit = "npc", text = "Hello.", choices = {} })
    local f = D.Frame()
    D.Hide()
    f.SetPoint = function(_, point, rel, relPoint, x, y) placed = { point, rel, relPoint, x, y } end
    D.Show({ name = "Marshal McBride", unit = "npc", text = "Hello.", choices = {} })
    eq(placed[1], "TOPLEFT"); eq(placed[2], UIParent); eq(placed[4], 16); eq(placed[5], -116)
  end)
end)
