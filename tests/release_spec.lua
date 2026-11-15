-- M8: Total RP 3 (read-only), accessibility, release checks.

local function trp3(player, opts)
  opts = opts or {}
  return function(state)
    if opts.loaded ~= false then
      state.addons[#state.addons + 1] = { name = "totalRP3", meta = {}, loaded = true }
    end
    _G.AddOn_TotalRP3 = player and { Player = opts.static and { static = { GetCurrentUser = function() return player end } }
      or { GetCurrentUser = function() return player end } } or nil
  end
end

local function profile(fields)
  local p = {}
  function p:GetFirstName() return fields.first end
  function p:GetLastName() return fields.last end
  function p:GetTitle() return fields.title end
  function p:GetRoleplayingName() return fields.full end
  return p
end

local function name(ns)
  return ns.Tokens.Render("{name}", ns.Context.New())
end

describe("Total RP 3", function()
  local function boot(setup, settings)
    local ns = Loader.Boot({ setup = setup })
    for k, v in pairs(settings or {}) do ns.db.settings[k] = v end
    return ns
  end

  it("uses the character name when Total RP 3 isn't installed", function()
    local ns = boot(trp3(nil, { loaded = false }))
    eq(name(ns), "Tester")
    eq(ns.Integrations.RoleplayAddonLoaded(), false)
  end)

  it("uses the roleplay title and first name when it is", function()
    local ns = boot(trp3(profile({ first = "Aldric", last = "Vane", title = "Sir", full = "Aldric Vane" })))
    eq(name(ns), "Sir Aldric")
  end)

  it("respects both settings", function()
    local ns = boot(trp3(profile({ first = "Aldric", title = "Sir" })), { trp3Title = false })
    eq(name(ns), "Aldric")
    ns.db.settings.trp3Name = false
    eq(name(ns), "Tester")
  end)

  it("strips color codes, textures and links from profile text", function()
    local ns = boot(trp3(profile({ first = "|cff00ff00Aldric|r", title = "|TInterface\\Icons\\x:12|t Sir " })))
    eq(name(ns), "Sir Aldric")
  end)

  it("falls back to the first word of the full name, then to the character name", function()
    local ns = boot(trp3(profile({ full = "Aldric Vane" })), { trp3Title = false })
    eq(name(ns), "Aldric")
    ns = boot(trp3(profile({})))
    eq(name(ns), "Tester")
  end)

  it("never breaks when Total RP 3 errors or changes shape", function()
    local bad = setmetatable({}, { __index = function() error("boom") end })
    local ns = boot(trp3(bad))
    eq(name(ns), "Tester")
    local ns2 = boot(function(state)
      state.addons[#state.addons + 1] = { name = "totalRP3", meta = {}, loaded = true }
      _G.AddOn_TotalRP3 = { Player = { GetCurrentUser = function() error("not ready") end } }
    end)
    eq(name(ns2), "Tester")
    local ns3 = boot(function(state)
      state.addons[#state.addons + 1] = { name = "totalRP3", meta = {}, loaded = true }
      _G.AddOn_TotalRP3 = "nonsense"
    end)
    eq(name(ns3), "Tester")
  end)

  it("reads older versions (static API, profile characteristics)", function()
    local old = {}
    function old:GetCharacteristics() return { FN = "Mira", LN = "Thorne", TI = "Lady" } end
    local ns = boot(trp3(old, { static = true }))
    eq(name(ns), "Lady Mira")
  end)

  it("ignores a stray AddOn_TotalRP3 global when the addon isn't loaded", function()
    local ns = boot(trp3(profile({ first = "Aldric" }), { loaded = false }))
    eq(name(ns), "Tester")
  end)

  it("never writes to Total RP 3", function()
    local writes = 0
    local p = profile({ first = "Aldric", title = "Sir" })
    local guarded = setmetatable({}, { __index = p, __newindex = function() writes = writes + 1 end })
    local ns = boot(trp3(guarded))
    eq(name(ns), "Sir Aldric")
    eq(writes, 0)
  end)
end)

describe("Total RP 3 teardown", function()
  it("clears the fake global", function()
    _G.AddOn_TotalRP3 = nil
    ok(true)
  end)
end)

---------------------------------------------------------------------------
-- Accessibility
---------------------------------------------------------------------------
local function bootUI(settings)
  local ns = Loader.Boot({
    packs = { "RPGDialogue_TestPack", "RPGDialogue_TestPack2" },
    setup = function(state) state.units.player.level = 2 end,
  })
  ns.db.settings.instantText = true
  for k, v in pairs(settings or {}) do ns.db.settings[k] = v end
  return ns
end

local function talkTo(name, id)
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-" .. (id or 197) .. "-AB", name = name, level = 20, reaction = 5 }
  local gf = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
  gf:Show()
  gf:SetAlpha(1)
  Mock.Fire("GOSSIP_SHOW")
  Mock.RunTimers()
end

local function shownLabels(f)
  local out = {}
  for _, b in ipairs(f.buttons) do if b:IsShown() then out[#out + 1] = b.label:GetText() end end
  return out
end

describe("Accessibility", function()
  it("keyboard: arrows move a marked selection, Enter takes it, Escape gets on with it", function()
    local ns = bootUI()
    talkTo("Marshal McBride")
    local D = ns.UI.Dialogue
    local f = D.Frame()
    eq(D.Selected(), nil, "no selection until the keyboard is used")
    D.OnKey(f, "DOWN")
    eq(D.Selected(), 1)
    eq(f.buttons[1].marker:IsShown(), true, "the selection is marked with > as well as the highlight")
    D.OnKey(f, "DOWN")
    eq(D.Selected(), 2)
    D.OnKey(f, "UP")
    D.OnKey(f, "UP")
    eq(D.Selected(), #shownLabels(f), "wraps to Get on with it")
    D.OnKey(f, "DOWN")
    D.OnKey(f, "ENTER")
    eq(ns.Conversation.session.node, "orders")
    eq(D.Selected(), 1, "keyboard users keep a selection on the next node")
    D.OnKey(f, "ESCAPE")
    eq(D.IsShown(), false)
  end)

  it("locked options say so in words, and the selection skips them", function()
    local ns = bootUI({ showLocked = true })
    talkTo("Marshal McBride")
    local f = ns.UI.Dialogue.Frame()
    ns.UI.Dialogue.SetChoices({ { text = "Open." }, { text = "[Persuade] Shut.", locked = true }, { text = "Also open." } })
    local lockedIndex = 2
    eq(f.buttons[2].locked, true)
    contains(f.buttons[lockedIndex].label:GetText(), "(Locked)")
    for _ = 1, 6 do
      ns.UI.Dialogue.OnKey(f, "DOWN")
      ok(ns.UI.Dialogue.Selected() ~= lockedIndex, "never lands on a locked option")
    end
  end)

  it("gamepad: D-pad moves, A confirms, B gets on with it", function()
    local ns = bootUI()
    talkTo("Marshal McBride")
    local D = ns.UI.Dialogue
    local f = D.Frame()
    D.OnPad(f, "PAD1")
    eq(D.Selected(), 1, "A with nothing selected selects the first reply")
    D.OnPad(f, "PADDDOWN")
    D.OnPad(f, "PAD1")
    eq(ns.Conversation.session.node, "defias")
    D.OnPad(f, "PAD2")
    eq(D.IsShown(), false)
  end)

  it("Ask about works from the keyboard", function()
    local ns = bootUI()
    ns.Slash.Handle("topics teach kobolds")
    talkTo("Marshal McBride")
    local D = ns.UI.Dialogue
    local f = D.Frame()
    eq(f.ask:IsShown(), true, "Ask about is offered")
    RPGDialogueAPI:AskAbout()   -- the keybinding
    eq(ns.UI.AskAbout.IsShown(), true)
    D.OnKey(f, "DOWN")
    eq(ns.UI.AskAbout.Selected(), "kobolds")
    D.OnKey(f, "ENTER")
    eq(f.text:GetText(), "Vermin with candles.")
    D.OnKey(f, "ESCAPE")
    eq(ns.UI.AskAbout.IsShown(), false, "Escape closes the list first")
    eq(D.IsShown(), true)
  end)

  it("journal: Left/Right switch tabs, the current tab is marked in words, Escape closes", function()
    local ns = bootUI()
    ns.UI.Journal.Show("chronicle")
    local J = ns.UI.Journal
    local f = J.Frame()
    J.OnKey(f, "RIGHT")
    eq(J.Current(), "people")
    contains(f.tabs.people:GetText(), "> People")
    eq(f.tabs.chronicle:GetText(), "Diary")
    J.OnKey(f, "LEFT")
    J.OnKey(f, "LEFT")
    eq(J.Current(), "notes", "wraps around")
    J.OnKey(f, "ESCAPE")
    eq(J.IsShown(), false)
  end)

  it("reduce motion: no typewriter and no insanity effects", function()
    local ns = bootUI({ instantText = false, reduceMotion = true })
    talkTo("Marshal McBride")
    eq(ns.UI.Dialogue.IsRevealing(), false)
    ns.Slash.Handle("insanity 90")
    eq(ns.Insanity.Strength(), 0)
  end)

  it("fonts: text and names each pick a font; bundled ones fall back on non-Latin clients", function()
    local ns = bootUI({ fontBody = "atkinson", fontName = "cinzel" })
    local fs = Mock.NewFrame("FontString")
    local set, setSize
    fs.SetFont = function(_, path, size) set, setSize = path, size end
    fs.GetFont = function() return set end
    ns.UI.Theme.SetFont(fs, "body", 14)
    contains(set, "AtkinsonHyperlegible-Regular.ttf")
    ns.UI.Theme.SetFont(fs, "name", 20)
    contains(set, "Cinzel-Regular.ttf")
    eq(setSize, 19, "Cinzel is scaled to look the same size")
    ns.db.settings.fontBody = "crimson"
    ns.db.settings.fontName = "same"
    ns.UI.Theme.SetFont(fs, "name", 14)
    contains(set, "CrimsonPro-Regular.ttf", "names follow the text")
    _G.GetLocale = function() return "koKR" end
    _G.STANDARD_TEXT_FONT = "Fonts\\2002.TTF"
    ns.UI.Theme.SetFont(fs, "body", 14)
    eq(set, "Fonts\\2002.TTF", "the client's own font for other scripts")
    _G.GetLocale = nil
    _G.STANDARD_TEXT_FONT = "Fonts\\FRIZQT__.TTF"
    ns.db.settings.fontBody, ns.db.settings.fontName = "friz", "morpheus"
    ns.UI.Theme.SetFont(fs, "name", 14)
    eq(set, "Fonts\\MORPHEUS.TTF")
  end)

  it("fonts: SharedMedia fonts are offered when another addon shares them", function()
    local ns = bootUI()
    local lsm = { fonts = { ["Expressway"] = "Interface\\AddOns\\SharedMedia\\Expressway.ttf" } }
    function lsm:List() return { "Expressway" } end
    function lsm:Fetch(_, name) return self.fonts[name] end
    _G.LibStub = setmetatable({}, { __call = function(_, name) if name == "LibSharedMedia-3.0" then return lsm end end })
    local found
    for _, c in ipairs(ns.UI.Theme.FontChoices("body")) do if c.id == "lsm:Expressway" then found = c end end
    ok(found, "listed")
    ns.db.settings.fontBody = "lsm:Expressway"
    eq((ns.UI.Theme.FontPath("body")), "Interface\\AddOns\\SharedMedia\\Expressway.ttf")
    _G.LibStub = nil
    eq((ns.UI.Theme.FontPath("body")), "Fonts\\FRIZQT__.TTF", "gone again: back to the default")
  end)

  it("fonts: the old readable-font switch moves over", function()
    local ns = Loader.Boot({ db = { schema = 2, settings = { readableFont = true } } })
    eq(ns.db.settings.fontBody, "atkinson")
    eq(ns.db.settings.fontName, "same")
    eq(ns.db.settings.readableFont, nil)
  end)

  it("a font file that won't load falls back to the game's font", function()
    local ns = bootUI({ fontBody = "crimson" })
    local fs = Mock.NewFrame("FontString")
    local set
    fs.SetFont = function(_, path) if not path:find("Crimson") then set = path end end
    fs.GetFont = function() return set end
    ns.UI.Theme.SetFont(fs, "body", 14)
    eq(set, "Fonts\\FRIZQT__.TTF")
  end)

  it("sounds off: the addon plays nothing", function()
    local ns = bootUI({ sounds = false })
    Mock.calls = {}
    talkTo("Marshal McBride")
    ns.Conversation.Business()
    for _, c in ipairs(Mock.calls) do ok(c[1] ~= "PlaySound", "played a sound") end
  end)
end)

describe("Versions", function()
  it("says to restart the game when a folder was updated but its old file list is still loaded", function()
    local ns = Loader.Boot({
      packs = { "RPGDialogue_TestPack" },
      setup = function(state)
        for _, a in ipairs(state.addons) do
          if a.name == "RPGDialogue_TestPack" then a.meta.Version = "0.5" end
        end
        state.addons[#state.addons + 1] = { name = "RPGDialogue", meta = { Version = "0.8.0" }, loaded = true }
      end,
    })
    local text = table.concat(Mock.chat, "\n")
    contains(text, "RPG Dialogue was updated to " .. ns.VERSION .. ", but the game still has the old file list (0.8.0)")
    contains(text, "Test Pack")
    contains(text, "a /reload isn't enough")
  end)

  it("stays quiet when the versions agree, and lists them", function()
    local ns = Loader.Boot({
      packs = { "RPGDialogue_TestPack" },
      setup = function(state)
        for _, a in ipairs(state.addons) do
          if a.name == "RPGDialogue_TestPack" then a.meta.Version = "1" end
        end
      end,
    })
    ok(not table.concat(Mock.chat, "\n"):find("old file list"), "no warning")
    Mock.chat = {}
    ns.Slash.Handle("packs")
    contains(table.concat(Mock.chat, "\n"), "RPG Dialogue " .. ns.VERSION)
  end)
end)
