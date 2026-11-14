-- Look: parchment and dark wood, very readable, uncluttered. Built from solid color
-- textures (no external art), so nothing can show up as a missing-texture box.
-- High-contrast theme for accessibility. Color is never the only signal.
local _, ns = ...

ns.UI = ns.UI or {}
local Theme = {}
ns.UI.Theme = Theme

-- Fonts. The text and the names each pick from: the game's own fonts, three bundled open
-- fonts (SIL Open Font License 1.1, licence files in Media/Fonts), and any fonts other
-- addons share through LibSharedMedia. The bundled fonts cover Latin scripts only, so other
-- client languages get the game's standard font. `scale` evens out how big fonts look.
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
Theme.DEFAULT_FONT = { body = "friz", name = "morpheus" }

-- { { id, label, path, scale }, ... } for the settings: built-in fonts, then SharedMedia's.
function Theme.FontChoices(kind)
  local L = ns.L
  local out = {}
  if kind == "name" then out[#out + 1] = { id = "same", label = L.FONT_SAME } end
  for _, f in ipairs(Theme.FONT_LIST) do
    out[#out + 1] = { id = f.id, label = L["FONT_" .. f.id:upper()] or f.id, path = f.path, scale = f.scale }
  end
  for _, f in ipairs(ns.Compat.SharedMediaFonts()) do
    out[#out + 1] = { id = "lsm:" .. f.name, label = f.name .. " (SharedMedia)", path = f.path }
  end
  return out
end

local function findFont(id)
  for _, f in ipairs(Theme.FONT_LIST) do if f.id == id then return f end end
  if type(id) == "string" and id:find("^lsm:") then
    local name = id:sub(5)
    for _, f in ipairs(ns.Compat.SharedMediaFonts()) do
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
  local f = findFont(id) or findFont(Theme.DEFAULT_FONT[kind == "name" and "name" or "body"])
  if f.latin and not ns.Compat.LatinClient() then f = nil end
  if not f or (f.id == "friz" and not ns.Compat.LatinClient()) then
    return ns.Compat.GlobalString("STANDARD_TEXT_FONT") or "Fonts\\FRIZQT__.TTF", 1
  end
  return f.path, f.scale or 1
end

Theme.PALETTES = {
  parchment = {
    bg = { 0.93, 0.87, 0.71, 0.97 }, bgTop = { 0.96, 0.91, 0.77, 0.98 }, bgBottom = { 0.87, 0.79, 0.61, 0.98 },
    inner = { 0.88, 0.80, 0.62, 1 }, shade = { 0.62, 0.50, 0.32, 0.45 },
    wood = { 0.24, 0.15, 0.07, 1 }, woodLight = { 0.42, 0.27, 0.13, 1 }, trim = { 0.74, 0.57, 0.27, 1 },
    text = { 0.16, 0.10, 0.04 }, name = { 0.42, 0.17, 0.04 }, subtitle = { 0.40, 0.29, 0.17 },
    choice = { 0.20, 0.12, 0.05 }, hover = { 0.55, 0.22, 0.02 }, number = { 0.55, 0.30, 0.08 },
    highlight = { 0.55, 0.38, 0.16, 0.16 }, accent = { 0.55, 0.25, 0.05, 0.9 },
    dim = { 0.45, 0.38, 0.30 }, locked = { 0.52, 0.47, 0.40 }, reaction = { 0.30, 0.20, 0.10 },
    divider = { 0.42, 0.27, 0.13, 0.30 },
    button = { 0.30, 0.19, 0.09, 1 }, buttonText = { 0.96, 0.90, 0.76 }, buttonHover = { 1, 0.92, 0.70, 0.14 },
  },
  contrast = {
    bg = { 0, 0, 0, 0.96 }, bgTop = { 0, 0, 0, 0.97 }, bgBottom = { 0, 0, 0, 0.97 },
    inner = { 0.08, 0.08, 0.08, 1 }, shade = { 0.3, 0.3, 0.3, 0.6 },
    wood = { 1, 1, 1, 1 }, woodLight = { 0.7, 0.7, 0.7, 1 }, trim = { 1, 0.82, 0, 1 },
    text = { 1, 1, 1 }, name = { 1, 0.82, 0 }, subtitle = { 0.85, 0.85, 0.85 },
    choice = { 1, 1, 0.55 }, hover = { 1, 1, 1 }, number = { 1, 0.82, 0 },
    highlight = { 1, 1, 1, 0.18 }, accent = { 1, 0.82, 0, 1 },
    dim = { 0.75, 0.75, 0.75 }, locked = { 0.6, 0.6, 0.6 }, reaction = { 0.85, 0.95, 1 },
    divider = { 1, 1, 1, 0.45 },
    button = { 0.12, 0.12, 0.12, 1 }, buttonText = { 1, 1, 1 }, buttonHover = { 1, 1, 1, 0.2 },
  },
}

function Theme.Palette()
  local s = ns.db and ns.db.settings
  return (s and s.highContrast) and Theme.PALETTES.contrast or Theme.PALETTES.parchment
end


function Theme.TextSize()
  return (ns.db and ns.db.settings.textSize) or 14
end

function Theme.BodyFont()
  return (Theme.FontPath("body"))
end

-- kind: "name" for names and headings, anything else for text.
function Theme.SetFont(fs, kind, size)
  local path, scale = Theme.FontPath(kind == "name" and "name" or "body")
  size = math.floor((size or Theme.TextSize()) * (scale or 1) + 0.5)
  fs:SetFont(path, size, "")
  -- A font file that failed to load leaves the string with no font at all; fall back.
  if not fs:GetFont() then fs:SetFont(ns.Compat.GlobalString("STANDARD_TEXT_FONT") or "Fonts\\FRIZQT__.TTF", size, "") end
  if not fs:GetFont() then fs:SetFontObject("GameFontHighlight") end
end

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

-- A soft drop shadow, a parchment gradient, a dark wood frame with a brass hairline inside
-- it, and a faint shade line where the parchment meets the trim.
function Theme.Decorate(f, thickness)
  thickness = thickness or 6
  f.rpgdTex = f.rpgdTex or {}
  local t = f.rpgdTex
  if not t.bg then
    t.shadow = {}
    for i, spread in ipairs({ 3, 7, 12 }) do
      local sh = f:CreateTexture(nil, "BACKGROUND", nil, -8 + i)
      sh:SetPoint("TOPLEFT", -spread + 2, spread - 4)
      sh:SetPoint("BOTTOMRIGHT", spread + 2, -spread - 4)
      t.shadow[i] = sh
    end
    t.bg = f:CreateTexture(nil, "BACKGROUND", nil, 1)
    t.bg:SetPoint("TOPLEFT", thickness, -thickness)
    t.bg:SetPoint("BOTTOMRIGHT", -thickness, thickness)
    t.wood = edges(f, "BORDER", 0, 0, thickness)
    t.trim = edges(f, "BORDER", 1, thickness, 1)
    t.shade = edges(f, "BORDER", 2, thickness + 1, 1)
  end
  Theme.Recolor(f)
end

function Theme.Recolor(f)
  local t = f.rpgdTex
  if not t then return end
  local p = Theme.Palette()
  for i, sh in ipairs(t.shadow) do sh:SetColorTexture(0, 0, 0, ({ 0.30, 0.16, 0.07 })[i]) end
  ns.Compat.SetGradient(t.bg, "VERTICAL", p.bgBottom, p.bgTop)
  paint(t.wood, p.wood)
  paint(t.trim, p.trim)
  paint(t.shade, p.shade)
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

-- A flat wood button with a brass edge and parchment lettering, to replace the game's red
-- panel buttons inside our windows. SetText/GetText work as on any button.
function Theme.Button(parent, text, width, height)
  local b = CreateFrame("Button", nil, parent)
  b:SetSize(width, height)
  b.bg = b:CreateTexture(nil, "BACKGROUND")
  b.bg:SetAllPoints()
  b.edge = edges(b, "BORDER", 0, 0, 1)
  b.hl = b:CreateTexture(nil, "HIGHLIGHT")
  b.hl:SetPoint("TOPLEFT", 1, -1)
  b.hl:SetPoint("BOTTOMRIGHT", -1, 1)
  b.label = b:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  b.label:SetPoint("CENTER", 0, 0)
  b.SetText = function(self, t) self.label:SetText(t) end
  b.GetText = function(self) return self.label:GetText() end
  b:SetScript("OnMouseDown", function(self) self.label:SetPoint("CENTER", 1, -1) end)
  b:SetScript("OnMouseUp", function(self) self.label:SetPoint("CENTER", 0, 0) end)
  b.rpgdButton = true
  Theme.StyleButton(b)
  b:SetText(text or "")
  return b
end

function Theme.StyleButton(b, size)
  local p = Theme.Palette()
  color(b.bg, p.button)
  paint(b.edge, p.trim)
  color(b.hl, p.buttonHover)
  Theme.SetFont(b.label, "body", size or math.max(10, Theme.TextSize() - 2))
  b.label:SetTextColor(p.buttonText[1], p.buttonText[2], p.buttonText[3])
end

-- "|cffRRGGBB" for a palette color, for a number or marker inside a line of text.
function Theme.Hex(key)
  local c = Theme.Palette()[key]
  return ("|cff%02x%02x%02x"):format(math.floor(c[1] * 255 + 0.5), math.floor(c[2] * 255 + 0.5), math.floor(c[3] * 255 + 0.5))
end

function Theme.TextColor(fs, key)
  local c = Theme.Palette()[key or "text"]
  fs:SetTextColor(c[1], c[2], c[3])
end
