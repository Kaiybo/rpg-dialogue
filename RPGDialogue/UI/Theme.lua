-- Look: parchment and dark wood, very readable, uncluttered. Built from solid color
-- textures (no external art), so nothing can show up as a missing-texture box.
-- High-contrast theme for accessibility. Color is never the only signal.
local _, ns = ...

ns.UI = ns.UI or {}
local Theme = {}
ns.UI.Theme = Theme

-- The readable font is Atkinson Hyperlegible (Braille Institute, SIL Open Font License 1.1,
-- see Media/Fonts/AtkinsonHyperlegible-OFL.txt), made for low-vision readers. It covers
-- Latin scripts only, so other client languages use the game's own fonts.
Theme.FONTS = {
  body = "Fonts\\FRIZQT__.TTF",
  readable = "Interface\\AddOns\\RPGDialogue\\Media\\Fonts\\AtkinsonHyperlegible-Regular.ttf",
  readableFallback = "Fonts\\ARIALN.TTF",
  name = "Fonts\\MORPHEUS.TTF",
}

Theme.PALETTES = {
  parchment = {
    bg = { 0.93, 0.87, 0.71, 0.97 }, inner = { 0.88, 0.80, 0.62, 1 },
    wood = { 0.26, 0.16, 0.08, 1 }, woodLight = { 0.42, 0.27, 0.13, 1 },
    text = { 0.16, 0.10, 0.04 }, name = { 0.42, 0.17, 0.04 }, subtitle = { 0.36, 0.26, 0.15 },
    choice = { 0.20, 0.12, 0.05 }, hover = { 0.60, 0.25, 0.02 }, number = { 0.45, 0.20, 0.05 },
    highlight = { 0.55, 0.38, 0.16, 0.20 }, dim = { 0.45, 0.38, 0.30 }, locked = { 0.52, 0.47, 0.40 },
    reaction = { 0.30, 0.20, 0.10 },
  },
  contrast = {
    bg = { 0, 0, 0, 0.96 }, inner = { 0.08, 0.08, 0.08, 1 },
    wood = { 1, 1, 1, 1 }, woodLight = { 0.7, 0.7, 0.7, 1 },
    text = { 1, 1, 1 }, name = { 1, 0.82, 0 }, subtitle = { 0.85, 0.85, 0.85 },
    choice = { 1, 1, 0.55 }, hover = { 1, 1, 1 }, number = { 1, 0.82, 0 },
    highlight = { 1, 1, 1, 0.18 }, dim = { 0.75, 0.75, 0.75 }, locked = { 0.6, 0.6, 0.6 },
    reaction = { 0.85, 0.95, 1 },
  },
}

function Theme.Palette()
  local s = ns.db and ns.db.settings
  return (s and s.highContrast) and Theme.PALETTES.contrast or Theme.PALETTES.parchment
end


function Theme.TextSize()
  return (ns.db and ns.db.settings.textSize) or 14
end

local function readable()
  local s = ns.db and ns.db.settings
  return s and s.readableFont and ns.Compat.LatinClient()
end

function Theme.BodyFont()
  return readable() and Theme.FONTS.readable or Theme.FONTS.body
end

function Theme.SetFont(fs, kind, size)
  -- With the readable font on, names drop the decorative font too.
  local path = (kind == "name" and not readable()) and Theme.FONTS.name or Theme.BodyFont()
  size = size or Theme.TextSize()
  fs:SetFont(path, size, "")
  -- A font that failed to load leaves the string with no font at all; fall back.
  if not fs:GetFont() and path == Theme.FONTS.readable then fs:SetFont(Theme.FONTS.readableFallback, size, "") end
  if not fs:GetFont() then fs:SetFontObject("GameFontHighlight") end
end

local function color(tex, c) tex:SetColorTexture(c[1], c[2], c[3], c[4] or 1) end

-- Background plus a wood frame (four edges) and a thin inner line.
function Theme.Decorate(f, thickness)
  thickness = thickness or 6
  f.rpgdTex = f.rpgdTex or {}
  local t = f.rpgdTex
  if not t.bg then
    t.bg = f:CreateTexture(nil, "BACKGROUND")
    t.bg:SetAllPoints()
    t.top = f:CreateTexture(nil, "BORDER"); t.bottom = f:CreateTexture(nil, "BORDER")
    t.left = f:CreateTexture(nil, "BORDER"); t.right = f:CreateTexture(nil, "BORDER")
    t.top:SetPoint("TOPLEFT"); t.top:SetPoint("TOPRIGHT"); t.top:SetHeight(thickness)
    t.bottom:SetPoint("BOTTOMLEFT"); t.bottom:SetPoint("BOTTOMRIGHT"); t.bottom:SetHeight(thickness)
    t.left:SetPoint("TOPLEFT"); t.left:SetPoint("BOTTOMLEFT"); t.left:SetWidth(thickness)
    t.right:SetPoint("TOPRIGHT"); t.right:SetPoint("BOTTOMRIGHT"); t.right:SetWidth(thickness)
    t.innerTop = f:CreateTexture(nil, "BORDER", nil, 1)
    t.innerTop:SetPoint("TOPLEFT", thickness, -thickness); t.innerTop:SetPoint("TOPRIGHT", -thickness, -thickness)
    t.innerTop:SetHeight(1)
    t.innerBottom = f:CreateTexture(nil, "BORDER", nil, 1)
    t.innerBottom:SetPoint("BOTTOMLEFT", thickness, thickness); t.innerBottom:SetPoint("BOTTOMRIGHT", -thickness, thickness)
    t.innerBottom:SetHeight(1)
  end
  Theme.Recolor(f)
end

function Theme.Recolor(f)
  local t = f.rpgdTex
  if not t then return end
  local p = Theme.Palette()
  color(t.bg, p.bg)
  for _, k in ipairs({ "top", "bottom", "left", "right" }) do color(t[k], p.wood) end
  color(t.innerTop, p.woodLight)
  color(t.innerBottom, p.woodLight)
end

function Theme.TextColor(fs, key)
  local c = Theme.Palette()[key or "text"]
  fs:SetTextColor(c[1], c[2], c[3])
end
