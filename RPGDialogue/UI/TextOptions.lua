-- Quick text options, from the conversation box's "Aa" button: text size, line spacing and
-- the fonts for what people say and for names, changed live while you read. The same
-- settings as in the settings panel ("Look and text").
local _, ns = ...

local L = ns.L
local UI = ns.UI
local Theme = UI.Theme

local T = {}
UI.TextOptions = T

local WIDTH, ROW_H, LABEL_W = 260, 26, 92
local SIZE_MIN, SIZE_MAX, SPACING_MIN, SPACING_MAX = 10, 24, 0, 10
local panel

local function settings() return ns.db.settings end

local function apply()
  UI.Dialogue.Restyle()
  if UI.AskAbout.IsShown() then UI.AskAbout.Style() end
  T.Refresh()
end

-- Number settings: one step up or down, within limits.
function T.Step(key, delta)
  local s = settings()
  local lo, hi, default = SIZE_MIN, SIZE_MAX, 13
  if key == "lineSpacing" then lo, hi, default = SPACING_MIN, SPACING_MAX, 3 end
  s[key] = math.max(lo, math.min(hi, (s[key] or default) + delta))
  apply()
end

-- The large dialogue box, on or off.
function T.SetLarge(on)
  settings().largeBox = on and true or false
  apply()
end

-- Fonts: the next or previous one in the same list as the settings panel's.
function T.CycleFont(key, delta)
  local kind = key == "fontName" and "name" or "body"
  local list = Theme.FontChoices(kind)
  local cur = settings()[key] or Theme.DEFAULT_FONT[kind]
  local idx = 1
  for i, c in ipairs(list) do if c.id == cur then idx = i end end
  settings()[key] = list[(idx - 1 + delta) % #list + 1].id
  apply()
end

-- "Atkinson Hyperlegible (easiest to read)" -> "Atkinson Hyperlegible"
local function shortLabel(key)
  local kind = key == "fontName" and "name" or "body"
  local cur = settings()[key] or Theme.DEFAULT_FONT[kind]
  for _, c in ipairs(Theme.FontChoices(kind)) do
    if c.id == cur then return (c.label:gsub("%s*%b()", "")) end
  end
  return cur
end

-- One row: a label, [<] value [>].
local function row(i, label, onLess, onMore, less, more)
  local y = -12 - (i - 1) * ROW_H
  local r = {}
  r.label = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  r.label:SetPoint("TOPLEFT", 12, y - 4)
  r.label:SetWidth(LABEL_W)
  r.label:SetJustifyH("LEFT")
  r.label:SetText(label)
  r.less = Theme.Button(panel, less or "<", 22, 20)
  r.less:SetPoint("TOPLEFT", 12 + LABEL_W, y)
  r.less:SetScript("OnClick", onLess)
  r.more = Theme.Button(panel, more or ">", 22, 20)
  r.more:SetPoint("TOPRIGHT", -12, y)
  r.more:SetScript("OnClick", onMore)
  r.value = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  r.value:SetPoint("LEFT", r.less, "RIGHT", 4, 0)
  r.value:SetPoint("RIGHT", r.more, "LEFT", -4, 0)
  r.value:SetJustifyH("CENTER")
  r.value:SetWordWrap(false)
  return r
end

local function create(box)
  panel = CreateFrame("Frame", nil, box)
  panel:SetSize(WIDTH, 12 + 5 * ROW_H + 26)
  panel:SetFrameLevel(box:GetFrameLevel() + 30)
  panel:EnableMouse(true)
  panel:Hide()
  Theme.Decorate(panel, 4)
  panel.rows = {
    size = row(1, L.OPT_TEXT_SIZE, function() T.Step("textSize", -1) end, function() T.Step("textSize", 1) end, "-", "+"),
    spacing = row(2, L.OPT_SPACING, function() T.Step("lineSpacing", -1) end, function() T.Step("lineSpacing", 1) end, "-", "+"),
    body = row(3, L.QUICK_FONT_TEXT, function() T.CycleFont("fontBody", -1) end, function() T.CycleFont("fontBody", 1) end),
    name = row(4, L.QUICK_FONT_NAME, function() T.CycleFont("fontName", -1) end, function() T.CycleFont("fontName", 1) end),
    box = row(5, L.QUICK_BOX, function() T.SetLarge(false) end, function() T.SetLarge(true) end, "-", "+"),
  }
  panel.more = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  panel.more:SetPoint("BOTTOMLEFT", 12, 10)
  panel.more:SetText(L.QUICK_MORE)
end

-- Labels in a fixed size (so the panel doesn't jump as the text grows), each font's name
-- written in that font.
function T.Refresh()
  if not panel then return end
  Theme.Recolor(panel)
  local s, r = settings(), panel.rows
  for _, one in pairs(r) do
    Theme.SetFont(one.label, "body", 12)
    Theme.TextColor(one.label, "text")
    Theme.TextColor(one.value, "choice")
    Theme.StyleButton(one.less, 12)
    Theme.StyleButton(one.more, 12)
  end
  for _, one in ipairs({ r.size, r.spacing }) do Theme.SetFont(one.value, "body", 12) end
  r.size.value:SetText(tostring(s.textSize or 13))
  r.spacing.value:SetText(tostring(s.lineSpacing or 3))
  Theme.SetFont(r.body.value, "body", 12)
  r.body.value:SetText(shortLabel("fontBody"))
  Theme.SetFont(r.name.value, "name", 12)
  r.name.value:SetText(shortLabel("fontName"))
  Theme.SetFont(r.box.value, "body", 12)
  r.box.value:SetText(s.largeBox and L.BOX_LARGE or L.BOX_NORMAL)
  Theme.SetFont(panel.more, "body", 10)
  Theme.TextColor(panel.more, "dim")
end

function T.Toggle(box)
  if not panel then create(box) end
  if panel:IsShown() then panel:Hide(); return end
  panel:ClearAllPoints()
  -- Just under the title bar (game look) or the top edge (wood), at the right.
  if Theme.IsGame() then panel:SetPoint("TOPRIGHT", box, "TOPRIGHT", -8, -26)
  else panel:SetPoint("TOPRIGHT", box, "TOPRIGHT", -12, -38) end
  T.Refresh()
  panel:Show()
end

function T.Hide() if panel then panel:Hide() end end
function T.IsShown() return panel ~= nil and panel:IsShown() end
function T.Rows() return panel and panel.rows end
