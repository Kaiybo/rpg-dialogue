-- Two looks for our windows (setting "look"):
--  * "game" (default): the game's own quest and gossip window art, read from the client at
--    runtime: the metal frame with the round portrait, the rock header, the quest parchment
--    (following the game's "Quest Text Contrast" setting), red panel buttons, the gossip
--    list's highlight bar. It matches whatever the player's own quest windows look like.
--  * "wood": RPG Dialogue's parchment and dark wood, built from solid color textures only.
-- If the client lacks any piece of the game art, every window falls back to "wood".
-- High-contrast theme for accessibility in both. Color is never the only signal.
local _, ns = ...

local C = ns.Compat

ns.UI = ns.UI or {}
local Theme = {}
ns.UI.Theme = Theme

---------------------------------------------------------------------------
-- Look
---------------------------------------------------------------------------
local artChecked, artOK, artBroken = false, false, false

-- Does this client have the game art the "game" look is made of?
function Theme.GameArt()
  if not artChecked then
    artChecked = true
    artOK = C.GameArtAvailable() and true or false
  end
  return artOK and not artBroken
end

function Theme.Look()
  local s = ns.db and ns.db.settings
  if s and s.look == "dialogueui" and C.DialogueUILoaded() then return "dui" end
  if (not s or s.look ~= "wood") and Theme.GameArt() then return "game" end
  return "wood"
end

-- The "dialogueui" look: our windows on DialogueUI's own parchment (its brown or dark
-- theme, read from its saved settings), laid out as the wood look.
function Theme.IsDUI() return Theme.Look() == "dui" end
function Theme.DUIDark()
  local db = _G.DialogueUI_DB
  return type(db) == "table" and db.Theme == 2
end

function Theme.IsGame() return Theme.Look() == "game" end

---------------------------------------------------------------------------
-- Fonts. The text and the names each pick from: the game's own fonts, three bundled open
-- fonts (SIL Open Font License 1.1, licence files in Media/Fonts), and any fonts other
-- addons share through LibSharedMedia. The bundled fonts cover Latin scripts only, so other
-- client languages get the game's standard font. `scale` evens out how big fonts look.
---------------------------------------------------------------------------
local MEDIA = "Interface\\AddOns\\RPGDialogue\\Media\\Fonts\\"
Theme.FONT_LIST = {
  { id = "friz", path = "Fonts\\FRIZQT__.TTF", game = true },
  { id = "crimson", path = MEDIA .. "CrimsonPro-Regular.ttf", scale = 1.18, latin = true },
  { id = "atkinson", path = MEDIA .. "AtkinsonHyperlegible-Regular.ttf", latin = true },
  { id = "arialn", path = "Fonts\\ARIALN.TTF", scale = 1.05, game = true, latin = true },
  { id = "morpheus", path = "Fonts\\MORPHEUS.TTF", scale = 1.05, game = true, latin = true },
  { id = "cinzel", path = MEDIA .. "Cinzel-Regular.ttf", scale = 0.95, latin = true },
  { id = "skurri", path = "Fonts\\SKURRI.TTF", game = true, latin = true },
}
-- Names default to "the window's own": Friz Quadrata in the game's title bar, Morpheus on wood.
Theme.DEFAULT_FONT = { body = "friz", name = "auto" }

-- { { id, label, path, scale }, ... } for the settings: built-in fonts, then SharedMedia's.
function Theme.FontChoices(kind)
  local L = ns.L
  local out = {}
  if kind == "name" then
    out[#out + 1] = { id = "auto", label = L.FONT_AUTO }
    out[#out + 1] = { id = "same", label = L.FONT_SAME }
  end
  for _, f in ipairs(Theme.FONT_LIST) do
    out[#out + 1] = { id = f.id, label = L["FONT_" .. f.id:upper()] or f.id, path = f.path, scale = f.scale }
  end
  for _, f in ipairs(C.SharedMediaFonts()) do
    out[#out + 1] = { id = "lsm:" .. f.name, label = f.name .. " (SharedMedia)", path = f.path }
  end
  return out
end

local function findFont(id)
  for _, f in ipairs(Theme.FONT_LIST) do if f.id == id then return f end end
  if type(id) == "string" and id:find("^lsm:") then
    local name = id:sub(5)
    for _, f in ipairs(C.SharedMediaFonts()) do
      if f.name == name then return { id = id, path = f.path } end
    end
  end
  return nil
end

-- path, scale for "body" or "name".
function Theme.FontPath(kind)
  local s = ns.db and ns.db.settings or {}
  local id = kind == "name" and (s.fontName or Theme.DEFAULT_FONT.name) or (s.fontBody or Theme.DEFAULT_FONT.body)
  if id == "same" then return Theme.FontPath("body") end
  if id == "auto" then id = Theme.IsGame() and "friz" or "morpheus" end
  local f = findFont(id) or findFont(kind == "name" and "morpheus" or Theme.DEFAULT_FONT.body)
  if f.latin and not C.LatinClient() then f = nil end
  if not f or (f.id == "friz" and not C.LatinClient()) then
    return C.GlobalString("STANDARD_TEXT_FONT") or "Fonts\\FRIZQT__.TTF", 1
  end
  return f.path, f.scale or 1
end

function Theme.TextSize()
  return (ns.db and ns.db.settings.textSize) or 13
end

-- What people say, and the replies. (The default, 13, is the game's quest font size.)
function Theme.BodySize()
  return Theme.TextSize()
end

-- With DialogueUI loaded our windows live outside UIParent, one strata above its window:
-- its "hide the game UI" option fades UIParent (which would hide ours too), and our box has
-- to sit over its window while we talk. Otherwise: UIParent, DIALOG strata.
function Theme.Lifted() return C.DialogueUILoaded() end
function Theme.Parent() return (not Theme.Lifted()) and UIParent or nil end
function Theme.Strata(kind)
  if Theme.Lifted() then return kind == "blocker" and "FULLSCREEN" or "FULLSCREEN_DIALOG" end
  return "DIALOG"
end
function Theme.Scale()
  local s = (ns.db and ns.db.settings.scale) or 1
  if Theme.Lifted() then s = s * C.UIParentScale() end
  return s
end

function Theme.BodyFont()
  return (Theme.FontPath("body"))
end

-- kind: "name" for names and headings, anything else for text. No outline and no shadow:
-- ink on parchment, like the game's quest text. (Strings start from GameFontHighlight, whose
-- drop shadow made dark text look bold; the title bar turns its shadow back on.)
function Theme.SetFont(fs, kind, size)
  local path, scale = Theme.FontPath(kind == "name" and "name" or "body")
  size = math.floor((size or Theme.TextSize()) * (scale or 1) + 0.5)
  -- A font file that failed to load leaves the string with no font at all (or, on clients
  -- where SetFont reports failure, with its old font at its old size); fall back.
  if fs:SetFont(path, size, "") == false or not fs:GetFont() then
    fs:SetFont(C.GlobalString("STANDARD_TEXT_FONT") or "Fonts\\FRIZQT__.TTF", size, "")
  end
  if not fs:GetFont() then fs:SetFontObject("GameFontHighlight") end
  Theme.Shadow(fs, false)
end

-- A drop shadow like the game's title fonts (or none).
function Theme.Shadow(fs, on)
  if on then
    fs:SetShadowOffset(1, -1)
    fs:SetShadowColor(0, 0, 0, 1)
  else
    fs:SetShadowOffset(0, 0)
    fs:SetShadowColor(0, 0, 0, 0)
  end
  fs.rpgdShadow = on and true or false
end

---------------------------------------------------------------------------
-- Colors
---------------------------------------------------------------------------
Theme.PALETTES = {
  parchment = {
    bg = { 0.93, 0.87, 0.71, 0.97 }, bgTop = { 0.96, 0.91, 0.77, 0.98 }, bgBottom = { 0.87, 0.79, 0.61, 0.98 },
    inner = { 0.88, 0.80, 0.62, 1 }, shade = { 0.62, 0.50, 0.32, 0.45 },
    wood = { 0.24, 0.15, 0.07, 1 }, woodLight = { 0.42, 0.27, 0.13, 1 }, trim = { 0.74, 0.57, 0.27, 1 },
    text = { 0.16, 0.10, 0.04 }, name = { 0.42, 0.17, 0.04 }, subtitle = { 0.40, 0.29, 0.17 },
    title = { 0.42, 0.17, 0.04 }, header = { 0.40, 0.29, 0.17 },
    choice = { 0.20, 0.12, 0.05 }, hover = { 0.55, 0.22, 0.02 }, number = { 0.55, 0.30, 0.08 },
    marker = { 0.42, 0.17, 0.04 }, topic = { 0.10, 0.22, 0.52 },
    highlight = { 0.55, 0.38, 0.16, 0.16 }, accent = { 0.55, 0.25, 0.05, 0.9 },
    dim = { 0.45, 0.38, 0.30 }, locked = { 0.52, 0.47, 0.40 }, reaction = { 0.30, 0.20, 0.10 },
    divider = { 0.42, 0.27, 0.13, 0.30 },
    button = { 0.30, 0.19, 0.09, 1 }, buttonText = { 0.96, 0.90, 0.76 }, buttonTextHover = { 1, 0.95, 0.82 },
    buttonHover = { 1, 0.92, 0.70, 0.14 },
  },
  contrast = {
    bg = { 0, 0, 0, 0.96 }, bgTop = { 0, 0, 0, 0.97 }, bgBottom = { 0, 0, 0, 0.97 },
    inner = { 0.08, 0.08, 0.08, 1 }, shade = { 0.3, 0.3, 0.3, 0.6 },
    wood = { 1, 1, 1, 1 }, woodLight = { 0.7, 0.7, 0.7, 1 }, trim = { 1, 0.82, 0, 1 },
    text = { 1, 1, 1 }, name = { 1, 0.82, 0 }, subtitle = { 0.85, 0.85, 0.85 },
    title = { 1, 0.82, 0 }, header = { 0.85, 0.85, 0.85 },
    choice = { 1, 1, 0.55 }, hover = { 1, 1, 1 }, number = { 1, 0.82, 0 }, marker = { 1, 0.82, 0 },
    topic = { 0.55, 0.85, 1 },
    highlight = { 1, 1, 1, 0.18 }, accent = { 1, 0.82, 0, 1 },
    dim = { 0.75, 0.75, 0.75 }, locked = { 0.6, 0.6, 0.6 }, reaction = { 0.85, 0.95, 1 },
    divider = { 1, 1, 1, 0.45 },
    button = { 0.12, 0.12, 0.12, 1 }, buttonText = { 1, 1, 1 }, buttonTextHover = { 1, 1, 0.6 },
    buttonHover = { 1, 1, 1, 0.2 },
  },
}

-- The game look takes its ink from the game itself (the colors its quest text uses on
-- parchment, or on the dark background of the highest contrast setting).
local gameCache = {}
local function gamePalette(dark)
  local key = dark and "dark" or "light"
  if gameCache[key] then return gameCache[key] end
  local text, title = C.MaterialTextColors(dark and "Stone" or "Parchment")
  local p
  if dark then
    p = { text = text, choice = { 1, 1, 1 }, hover = { 1, 1, 1 }, number = { 1, 0.82, 0 }, marker = { 1, 0.82, 0 },
          topic = { 0.55, 0.80, 1 },
          name = { 1, 0.82, 0 }, subtitle = { 0.85, 0.85, 0.85 }, dim = { 0.75, 0.75, 0.75 },
          locked = { 0.6, 0.6, 0.6 }, reaction = { 0.85, 0.95, 1 }, divider = { 1, 1, 1, 0.3 },
          bg = { 0.08, 0.07, 0.06, 1 } }
  else
    p = { text = text, choice = title, hover = title, number = { 0.42, 0.27, 0.10 }, marker = { 0.42, 0.27, 0.10 },
          topic = { 0.08, 0.20, 0.48 },
          name = { 0.24, 0.12, 0 }, subtitle = { 0.34, 0.24, 0.13 }, dim = { 0.34, 0.26, 0.18 },
          locked = { 0.46, 0.41, 0.35 }, reaction = { 0.28, 0.17, 0.07 }, divider = { 0.32, 0.20, 0.08, 0.35 },
          bg = { 0.86, 0.78, 0.60, 1 } }
  end
  -- Gold on the metal title bar, white on the rock header, gold button lettering: the game's.
  p.title, p.header = { 1, 0.82, 0 }, { 1, 1, 1 }
  p.buttonText, p.buttonTextHover = { 1, 0.82, 0 }, { 1, 1, 1 }
  p.dark = dark
  setmetatable(p, { __index = Theme.PALETTES.parchment })
  gameCache[key] = p
  return p
end

-- DialogueUI's inks (its ThemeUtil colours): dark brown on its parchment; greys and pale
-- gold on its dark theme.
local duiCache = {}
local function duiPalette(dark)
  local key = dark and "dark" or "light"
  if duiCache[key] then return duiCache[key] end
  local p
  if dark then
    p = { text = { 0.7, 0.7, 0.7 }, name = { 1, 0.98, 0.8 }, title = { 1, 0.98, 0.8 }, subtitle = { 0.7, 0.7, 0.7 },
          header = { 0.9, 0.9, 0.9 }, choice = { 0.796, 0.784, 0.584 }, hover = { 1, 0.98, 0.8 },
          number = { 0.796, 0.784, 0.584 }, marker = { 1, 0.98, 0.8 }, topic = { 0.55, 0.80, 1 },
          dim = { 0.55, 0.55, 0.55 }, locked = { 0.5, 0.5, 0.5 }, reaction = { 0.85, 0.9, 1 },
          divider = { 1, 1, 1, 0.22 }, highlight = { 1, 1, 1, 0.08 }, accent = { 0.796, 0.784, 0.584, 0.9 },
          wood = { 0.12, 0.12, 0.12, 1 }, woodLight = { 0.25, 0.25, 0.25, 1 }, trim = { 0.45, 0.42, 0.35, 1 },
          button = { 0.16, 0.16, 0.16, 1 }, buttonText = { 1, 0.98, 0.8 }, buttonTextHover = { 1, 1, 1 },
          buttonHover = { 1, 1, 1, 0.12 }, bg = { 0.1, 0.1, 0.1, 1 }, dark = true }
  else
    p = { text = { 0.19, 0.17, 0.13 }, name = { 0.416, 0.18, 0.165 }, title = { 0.19, 0.17, 0.13 },
          subtitle = { 0.50, 0.36, 0.24 }, header = { 0.19, 0.17, 0.13 }, choice = { 0.19, 0.17, 0.13 },
          hover = { 0.416, 0.18, 0.165 }, number = { 0.50, 0.36, 0.24 }, marker = { 0.416, 0.18, 0.165 },
          topic = { 0.08, 0.20, 0.48 }, dim = { 0.50, 0.36, 0.24 }, locked = { 0.55, 0.47, 0.38 },
          reaction = { 0.28, 0.17, 0.07 }, divider = { 0.42, 0.31, 0.20, 0.35 },
          wood = { 0.30, 0.22, 0.14, 1 }, woodLight = { 0.50, 0.36, 0.24, 1 }, trim = { 0.50, 0.36, 0.24, 1 },
          button = { 0.30, 0.22, 0.14, 1 }, buttonText = { 0.87, 0.86, 0.75 }, buttonTextHover = { 1, 0.97, 0.88 } }
  end
  setmetatable(p, { __index = Theme.PALETTES.parchment })
  duiCache[key] = p
  return p
end

function Theme.Palette()
  local s = ns.db and ns.db.settings
  local contrast = s and s.highContrast
  if Theme.IsDUI() and not contrast then return duiPalette(Theme.DUIDark()) end
  if Theme.IsGame() then return gamePalette(contrast or C.QuestTextContrast() == 4) end
  return contrast and Theme.PALETTES.contrast or Theme.PALETTES.parchment
end

-- "|cffRRGGBB" for a palette color, for a number or marker inside a line of text.
function Theme.Hex(key)
  local c = Theme.Palette()[key]
  return ("|cff%02x%02x%02x"):format(math.floor(c[1] * 255 + 0.5), math.floor(c[2] * 255 + 0.5), math.floor(c[3] * 255 + 0.5))
end

-- Item quality colors (0 poor .. 5 legendary) as the game uses them on dark backgrounds,
-- and deeper shades of the same hues that stay readable on parchment. Common and poor items
-- keep the text color, as the game's quest window does.
local QUALITY_DARK = { [2] = "1eff00", [3] = "0070dd", [4] = "a335ee", [5] = "ff8000", [6] = "e6cc80", [7] = "00ccff" }
local QUALITY_LIGHT = { [2] = "1a7a00", [3] = "0050a8", [4] = "7a1fb8", [5] = "b35400", [6] = "8a6d1f", [7] = "006f8f" }
local function darkPalette() return Theme.Palette().dark or Theme.Palette() == Theme.PALETTES.contrast end

-- "|cffRRGGBB" for an item of this quality, or nil for plain text.
function Theme.QualityHex(quality)
  local hex = (darkPalette() and QUALITY_DARK or QUALITY_LIGHT)[tonumber(quality) or -1]
  return hex and ("|cff" .. hex) or nil
end

-- Green for "you have enough", red for "you don't" or "you can't use this" (always said in
-- words too, never by color alone).
function Theme.StatusHex(good)
  if darkPalette() then return good and "|cff40ff40" or "|cffff5050" end
  return good and "|cff1a6a00" or "|cffa01010"
end

function Theme.TextColor(fs, key)
  local c = Theme.Palette()[key or "text"]
  fs:SetTextColor(c[1], c[2], c[3])
end

---------------------------------------------------------------------------
-- Frames
---------------------------------------------------------------------------
local function color(tex, c) tex:SetColorTexture(c[1], c[2], c[3], c[4] or 1) end

local function edges(f, layer, sub, inset, size)
  local e = {}
  for _, side in ipairs({ "top", "bottom", "left", "right" }) do e[side] = f:CreateTexture(nil, layer, nil, sub) end
  e.top:SetPoint("TOPLEFT", inset, -inset); e.top:SetPoint("TOPRIGHT", -inset, -inset); e.top:SetHeight(size)
  e.bottom:SetPoint("BOTTOMLEFT", inset, inset); e.bottom:SetPoint("BOTTOMRIGHT", -inset, inset); e.bottom:SetHeight(size)
  e.left:SetPoint("TOPLEFT", inset, -inset); e.left:SetPoint("BOTTOMLEFT", inset, inset); e.left:SetWidth(size)
  e.right:SetPoint("TOPRIGHT", -inset, -inset); e.right:SetPoint("BOTTOMRIGHT", -inset, inset); e.right:SetWidth(size)
  return e
end

local function paint(e, c) for _, t in pairs(e) do color(t, c) end end
local function showAll(list, on) for _, r in ipairs(list) do r:SetShown(on) end end

local NINE_PIECES = { "TopLeftCorner", "TopRightCorner", "BottomLeftCorner", "BottomRightCorner",
  "TopEdge", "BottomEdge", "LeftEdge", "RightEdge", "Center" }

local ROCK = "Interface\\FrameGeneral\\UI-Background-Rock"
local PORTRAIT_MASK = "Interface\\CharacterFrame\\TempPortraitAlphaMask"

-- The game look's parts for one frame, made the first time they're needed. A portrait
-- frame is built like the game's gossip window (ButtonFrameTemplate): metal frame with the
-- portrait ring, rock behind a 60-pixel header, an inset holding the quest parchment.
-- opts.chrome = "frame" is the same without the portrait (the title bar runs the full
-- width). Any other window gets the plain metal panel border around parchment.
local function buildGame(f)
  local t = f.rpgdTex
  if t.game ~= nil then return t.game end
  local g = { regions = {} }
  local function keep(r) g.regions[#g.regions + 1] = r; return r end
  local layout
  if t.opts.portrait or t.opts.chrome == "frame" then
    layout = t.opts.portrait and "PortraitFrameTemplate" or "ButtonFrameTemplateNoPortrait"
    g.rock = keep(f:CreateTexture(nil, "BACKGROUND", nil, -6))
    g.rock:SetTexture(ROCK, "REPEAT", "REPEAT")
    g.rock:SetHorizTile(true)
    g.rock:SetVertTile(true)
    g.rock:SetPoint("TOPLEFT", 2, -21)
    g.rock:SetPoint("BOTTOMRIGHT", -2, 2)
    g.streaks = keep(f:CreateTexture(nil, "BORDER"))
    if C.HasAtlas("_UI-Frame-TopTileStreaks") then
      g.streaks:SetAtlas("_UI-Frame-TopTileStreaks")
      g.streaks:SetHorizTile(true)
    end
    g.streaks:SetHeight(43)
    g.streaks:SetPoint("TOPLEFT", 6, -21)
    g.streaks:SetPoint("TOPRIGHT", -2, -21)
    -- The inset's own border needs a frame drawn at our level, under our text.
    g.inset = CreateFrame("Frame", nil, f)
    if C.UseParentLevel(g.inset) then C.ApplyNineSlice(g.inset, "InsetFrameTemplate") end
    g.paper = keep(f:CreateTexture(nil, "BACKGROUND", nil, 2))
    g.paper:SetPoint("TOPLEFT", g.inset, "TOPLEFT", 3, -3)
    g.paper:SetPoint("BOTTOMRIGHT", g.inset, "BOTTOMRIGHT", -3, 3)
  end
  if t.opts.portrait then
    -- The round portrait sits in the frame's corner ring, above it.
    g.portrait = keep(f:CreateTexture(nil, "OVERLAY", nil, 6))
    g.portrait:SetSize(62, 62)
    g.portrait:SetPoint("TOPLEFT", -5, 7)
    if type(f.CreateMaskTexture) == "function" and type(g.portrait.AddMaskTexture) == "function" then
      local m = f:CreateMaskTexture()
      m:SetTexture(PORTRAIT_MASK, "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
      m:SetPoint("TOPLEFT", g.portrait, "TOPLEFT", 2, 0)
      m:SetPoint("BOTTOMRIGHT", g.portrait, "BOTTOMRIGHT", -2, 4)
      g.portrait:AddMaskTexture(m)
    end
  elseif not layout then
    layout = "SimplePanelTemplate"
    g.paper = keep(f:CreateTexture(nil, "BACKGROUND", nil, 2))
    g.paper:SetPoint("TOPLEFT", 2, -2)
    g.paper:SetPoint("BOTTOMRIGHT", -2, 2)
  end
  if not C.ApplyNineSlice(f, layout) then
    -- Something about the game art didn't work after all: wood for everyone from now on.
    for _, r in ipairs(g.regions) do r:Hide() end
    if g.inset then g.inset:Hide() end
    artBroken = true
    t.game = false
    return false
  end
  for _, name in ipairs(NINE_PIECES) do
    local piece = rawget(f, name) or f[name]
    if type(piece) == "table" then keep(piece) end
  end
  t.game = g
  return g
end

-- Decorate a window. opts.portrait: the conversation box (portrait, header and inset in the
-- game look). thickness: the wood frame's width.
function Theme.Decorate(f, thickness, opts)
  thickness = thickness or 6
  f.rpgdTex = f.rpgdTex or {}
  local t = f.rpgdTex
  t.opts = opts or t.opts or {}
  if not t.bg then
    t.wood = {}
    t.shadow = {}
    for i, spread in ipairs({ 3, 7, 12 }) do
      local sh = f:CreateTexture(nil, "BACKGROUND", nil, -8 + i)
      sh:SetPoint("TOPLEFT", -spread + 2, spread - 4)
      sh:SetPoint("BOTTOMRIGHT", spread + 2, -spread - 4)
      t.shadow[i] = sh
      t.wood[#t.wood + 1] = sh
    end
    t.bg = f:CreateTexture(nil, "BACKGROUND", nil, 1)
    t.bg:SetPoint("TOPLEFT", thickness, -thickness)
    t.bg:SetPoint("BOTTOMRIGHT", -thickness, thickness)
    t.wood[#t.wood + 1] = t.bg
    t.woodEdge = edges(f, "BORDER", 0, 0, thickness)
    t.trim = edges(f, "BORDER", 1, thickness, 1)
    t.shade = edges(f, "BORDER", 2, thickness + 1, 1)
    for _, set in ipairs({ t.woodEdge, t.trim, t.shade }) do
      for _, r in pairs(set) do t.wood[#t.wood + 1] = r end
    end
  end
  Theme.Recolor(f)
end

-- DialogueUI's parchment (Parchment.png, 1024 wide: top cap 0-256, a stretching middle
-- 256-896, bottom cap 896-1152, as its own window cuts it). The paper fills about 74% of
-- the image's width, so the image is drawn wider than the window and centred on it, the
-- caps centred on its top and bottom edges.
local DUI_ART = "Interface\\AddOns\\DialogueUI\\Art\\"
local function duiFit(f)
  local d = f.rpgdTex and f.rpgdTex.dui
  if not d then return end
  local w = f:GetWidth() or 0
  if w <= 0 then return end
  local tw = w / 0.736
  local cap = 256 * tw / 1024
  d.top:SetSize(tw, cap)
  d.bottom:SetSize(tw, cap)
  d.mid:SetShown(d.on and (f:GetHeight() or 0) > cap)
end
local function buildDUI(f)
  local t = f.rpgdTex
  if t.dui then return t.dui end
  local d = {}
  d.top = f:CreateTexture(nil, "BACKGROUND", nil, 1)
  d.top:SetPoint("CENTER", f, "TOP", 0, 0)
  d.top:SetTexCoord(0, 1, 0, 256 / 2048)
  d.bottom = f:CreateTexture(nil, "BACKGROUND", nil, 1)
  d.bottom:SetPoint("CENTER", f, "BOTTOM", 0, 0)
  d.bottom:SetTexCoord(0, 1, 896 / 2048, 1152 / 2048)
  d.mid = f:CreateTexture(nil, "BACKGROUND", nil, 0)
  d.mid:SetPoint("TOPLEFT", d.top, "BOTTOMLEFT")
  d.mid:SetPoint("BOTTOMRIGHT", d.bottom, "TOPRIGHT")
  d.mid:SetTexCoord(0, 1, 256 / 2048, 896 / 2048)
  t.dui = d
  if type(f.HookScript) == "function" then f:HookScript("OnSizeChanged", duiFit) end
  return d
end

-- Show the parts of the current look and color them. Every window's Style calls this.
function Theme.Recolor(f)
  local t = f.rpgdTex
  if not t then return end
  local dui = Theme.IsDUI() and not (ns.db and ns.db.settings.highContrast)
  if t.dui or dui then
    local d = buildDUI(f)
    d.on = dui
    local file = DUI_ART .. (Theme.DUIDark() and "Theme_Dark" or "Theme_Brown") .. "\\Parchment.png"
    for _, k in ipairs({ "top", "mid", "bottom" }) do
      if dui then d[k]:SetTexture(file) end
      d[k]:SetShown(dui)
    end
    if dui then
      duiFit(f)
      showAll(t.wood, false)
      if t.game then
        showAll(t.game.regions, false)
        if t.game.inset then t.game.inset:Hide() end
      end
      return
    end
  end
  local g = Theme.IsGame() and buildGame(f) or nil
  local game = g and true or false
  showAll(t.wood, not game)
  if t.game then
    showAll(t.game.regions, game)
    if t.game.inset then t.game.inset:SetShown(game) end
  end
  local p = Theme.Palette()
  if game then
    g.paperAtlas = C.QuestBackgroundAtlas(p.dark)
    if g.paper:SetAtlas(g.paperAtlas) == false then
      color(g.paper, p.bg)
      g.paperAtlas = nil
    end
    Theme.FitPaper(f)
    return
  end
  for i, sh in ipairs(t.shadow) do sh:SetColorTexture(0, 0, 0, ({ 0.30, 0.16, 0.07 })[i]) end
  C.SetGradient(t.bg, "VERTICAL", p.bgBottom, p.bgTop)
  paint(t.woodEdge, p.wood)
  paint(t.trim, p.trim)
  paint(t.shade, p.shade)
end

-- The parchment keeps its proportions: drawn at its own size (or scaled up just enough to
-- cover a bigger area) from its top-left corner, and cut off by the inset, the way the
-- gossip window shows it. Without the atlas's coordinates it's simply stretched.
-- w, h: the parchment's area (the inset, or the whole panel), when the window knows it.
function Theme.FitPaper(f, w, h)
  local g = f.rpgdTex and f.rpgdTex.game
  if not g or not g.paper then return end
  if w and h then g.paperSize = { w, h } end
  local size, atlas = g.paperSize, g.paperAtlas
  if not size or not atlas or not Theme.IsGame() then return end
  local info = C.AtlasInfo(atlas)
  local l, r = info and info.leftTexCoord, info and info.rightTexCoord
  local t, b = info and info.topTexCoord, info and info.bottomTexCoord
  if not (info and info.file and type(l) == "number" and type(r) == "number" and type(t) == "number"
      and type(b) == "number" and (info.width or 0) > 0 and (info.height or 0) > 0) then return end
  w, h = size[1] - 6, size[2] - 6
  if w <= 0 or h <= 0 then return end
  local scale = math.max(1, w / info.width, h / info.height)
  local fx, fy = w / (info.width * scale), h / (info.height * scale)
  if g.paper:SetTexture(info.file) == false then g.paper:SetAtlas(atlas); return end
  g.paper:SetTexCoord(l, l + (r - l) * fx, t, t + (b - t) * fy)
end

-- A part of the game look on a decorated frame ("portrait", "inset"), or nil (wood look,
-- or not built).
function Theme.GamePart(f, key)
  local t = f.rpgdTex
  local g = t and t.game
  if not g or not Theme.IsGame() then return nil end
  return g[key]
end

-- A thin horizontal rule.
function Theme.Divider(parent)
  local d = parent:CreateTexture(nil, "ARTWORK")
  d:SetHeight(1)
  d.rpgdDivider = true
  return d
end

function Theme.ColorDivider(d)
  color(d, Theme.Palette().divider)
end

---------------------------------------------------------------------------
-- Rows (replies, topics): a highlight on hover and on the keyboard selection. The game
-- look uses the gossip window's own highlight bar; wood a soft band with an accent stripe.
---------------------------------------------------------------------------
local ROW_HIGHLIGHT = "Interface\\QuestFrame\\UI-QuestTitleHighlight"

function Theme.StyleRow(row)
  local p = Theme.Palette()
  if Theme.IsGame() then
    row.hl:SetTexture(ROW_HIGHLIGHT)
    row.hl:SetBlendMode("ADD")
    row.hl:SetVertexColor(1, 1, 1, 1)
    row.stripe:Hide()
  else
    row.hl:SetBlendMode("BLEND")
    row.hl:SetColorTexture(p.highlight[1], p.highlight[2], p.highlight[3], p.highlight[4])
    row.stripe:Show()
    row.stripe:SetColorTexture(p.accent[1], p.accent[2], p.accent[3], p.accent[4])
  end
end

---------------------------------------------------------------------------
-- Buttons. One button object carries both looks: the game's red panel button (the same
-- textures as UIPanelButtonTemplate) and a flat wood button with a brass edge.
-- SetText/GetText work as on any button.
---------------------------------------------------------------------------
local RED = "Interface\\Buttons\\UI-Panel-Button-"
local RED_COORDS = { { 0, 0.09375 }, { 0.09375, 0.53125 }, { 0.53125, 0.625 } }

local function setRed(b, state)
  for _, tex in ipairs(b.red) do tex:SetTexture(RED .. state) end
end

local function hoverColor(b, on)
  if b.isClose and b.gameLook then return end
  if b.selected then b.label:SetTextColor(1, 1, 1); return end
  local c = Theme.Palette()[on and "buttonTextHover" or "buttonText"]
  b.label:SetTextColor(c[1], c[2], c[3])
end

function Theme.Button(parent, text, width, height)
  local b = CreateFrame("Button", nil, parent)
  b:SetSize(width, height)
  b.woodSize = { width, height }
  -- wood
  b.bg = b:CreateTexture(nil, "BACKGROUND")
  b.bg:SetAllPoints()
  b.edge = edges(b, "BORDER", 0, 0, 1)
  b.hl = b:CreateTexture(nil, "HIGHLIGHT")
  b.hl:SetPoint("TOPLEFT", 1, -1)
  b.hl:SetPoint("BOTTOMRIGHT", -1, 1)
  -- game: left cap, middle, right cap, and the additive highlight
  b.red = {}
  for i = 1, 3 do
    local tex = b:CreateTexture(nil, "BACKGROUND", nil, 1)
    tex:SetTexCoord(RED_COORDS[i][1], RED_COORDS[i][2], 0, 0.6875)
    b.red[i] = tex
  end
  b.red[1]:SetPoint("TOPLEFT"); b.red[1]:SetPoint("BOTTOMLEFT"); b.red[1]:SetWidth(12)
  b.red[3]:SetPoint("TOPRIGHT"); b.red[3]:SetPoint("BOTTOMRIGHT"); b.red[3]:SetWidth(12)
  b.red[2]:SetPoint("TOPLEFT", b.red[1], "TOPRIGHT")
  b.red[2]:SetPoint("BOTTOMRIGHT", b.red[3], "BOTTOMLEFT")
  setRed(b, "Up")
  b.redHl = b:CreateTexture(nil, "HIGHLIGHT", nil, 1)
  b.redHl:SetAllPoints()
  b.redHl:SetTexture(RED .. "Highlight")
  b.redHl:SetTexCoord(0, 0.625, 0, 0.6875)
  b.redHl:SetBlendMode("ADD")

  b.label = b:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  b.label:SetPoint("CENTER", 0, 0)
  b.SetText = function(self, t) self.label:SetText(t) end
  b.GetText = function(self) return self.label:GetText() end
  b:SetScript("OnMouseDown", function(self)
    self.label:SetPoint("CENTER", 1, -1)
    if self.gameLook then
      if self.isClose then Theme.CloseArt(self, true) else setRed(self, "Down") end
    end
  end)
  b:SetScript("OnMouseUp", function(self)
    self.label:SetPoint("CENTER", 0, 0)
    if self.gameLook then
      if self.isClose then Theme.CloseArt(self, false) else setRed(self, "Up") end
    end
  end)
  b:SetScript("OnEnter", function(self) hoverColor(self, true) end)
  b:SetScript("OnLeave", function(self) hoverColor(self, false) end)
  b.rpgdButton = true
  Theme.StyleButton(b)
  b:SetText(text or "")
  return b
end

-- The red close button (game look) or a small wood "x" button.
function Theme.CloseButton(parent)
  local b = Theme.Button(parent, "x", 20, 20)
  b.isClose = true
  b.closeArt = b:CreateTexture(nil, "ARTWORK")
  b.closeArt:SetAllPoints()
  b.closeHl = b:CreateTexture(nil, "HIGHLIGHT", nil, 2)
  b.closeHl:SetAllPoints()
  Theme.StyleButton(b)
  return b
end

-- The game's close button art: atlases on modern clients, the classic files otherwise.
function Theme.CloseArt(b, pressed)
  if C.HasAtlas("RedButton-Exit") then
    b.closeArt:SetAtlas(pressed and "RedButton-exit-pressed" or "RedButton-Exit")
    b.closeHl:SetAtlas("RedButton-Highlight")
  else
    b.closeArt:SetTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-" .. (pressed and "Down" or "Up"))
    b.closeHl:SetTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
  end
  b.closeHl:SetBlendMode("ADD")
end

function Theme.StyleButton(b, size)
  local p = Theme.Palette()
  local game = Theme.IsGame()
  b.gameLook = game
  local wood = { b.bg, b.hl, b.edge.top, b.edge.bottom, b.edge.left, b.edge.right }
  if b.isClose and b.closeArt then
    showAll(wood, not game)
    showAll(b.red, false)
    b.redHl:Hide()
    b.closeArt:SetShown(game)
    b.closeHl:SetShown(game)
    b.label:SetShown(not game)
    if game then
      b:SetSize(24, 24)
      Theme.CloseArt(b, false)
      return
    end
    b:SetSize(b.woodSize[1], b.woodSize[2])
  else
    showAll(wood, not game)
    showAll(b.red, game)
    b.redHl:SetShown(game)
  end
  size = size or math.max(10, Theme.TextSize() - 2)
  if game then
    -- The game's button lettering (GameFontNormal: Friz Quadrata 12 with a shadow, gold,
    -- white on hover), following the text size setting.
    b.label:SetFont(C.GlobalString("STANDARD_TEXT_FONT") or "Fonts\\FRIZQT__.TTF", size, "")
    if not b.label:GetFont() then b.label:SetFontObject("GameFontNormal") end
    Theme.Shadow(b.label, true)
    setRed(b, "Up")
  else
    color(b.bg, p.button)
    paint(b.edge, p.trim)
    color(b.hl, p.buttonHover)
    Theme.SetFont(b.label, "body", size)
    Theme.Shadow(b.label, false)
  end
  b.label:SetTextColor(p.buttonText[1], p.buttonText[2], p.buttonText[3])
end
