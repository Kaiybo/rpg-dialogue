-- The "Ask about..." list: known topics, most recent first, searchable, with an archive
-- for stale ones. Opens beside the dialogue window.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local UI = ns.UI
local Theme = UI.Theme

local Ask = {}
UI.AskAbout = Ask

local ROWS, ROW_H, WIDTH = 12, 20, 240
local panel
local offset, showArchive, filtered = 0, false, {}
local selected   -- index into filtered (keyboard / gamepad)

local function refresh()
  local list = ns.Topics.Filter(ns.Topics.Known(showArchive), panel.search:GetText())
  filtered = list
  for i = 1, ROWS do
    local row = panel.rows[i]
    local t = list[i + offset]
    if t then
      row.topic = t.id
      row.label:SetText(t.name .. (t.archived and (" |cff888888(" .. L.ASK_ARCHIVED .. ")|r") or ""))
      row.cat:SetText(t.category)
      local on = (selected == i + offset)
      if on then row:LockHighlight() else row:UnlockHighlight() end
      row.marker:SetShown(on)
      row:Show()
    else
      row:Hide()
    end
  end
  panel.empty:SetShown(#list == 0)
  panel.archive:SetText(showArchive and L.ASK_HIDE_ARCHIVE or L.ASK_SHOW_ARCHIVE)
end

local function create()
  panel = CreateFrame("Frame", nil, UIParent)
  panel:SetSize(WIDTH, 60 + ROWS * ROW_H + 30)
  panel:SetFrameStrata("DIALOG")
  panel:SetClampedToScreen(true)
  panel:EnableMouse(true)
  panel:Hide()
  Theme.Decorate(panel, 5)

  panel.title = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  panel.title:SetPoint("TOPLEFT", 12, -12)
  panel.search = CreateFrame("EditBox", nil, panel, C.Template("editbox"))
  panel.search:SetSize(WIDTH - 30, 20)
  panel.search:SetPoint("TOPLEFT", 16, -32)
  panel.search:SetAutoFocus(false)
  panel.search:SetScript("OnTextChanged", function() offset = 0; refresh() end)
  panel.search:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)

  panel.rows = {}
  for i = 1, ROWS do
    local row = CreateFrame("Button", nil, panel)
    row:SetSize(WIDTH - 24, ROW_H)
    row:SetPoint("TOPLEFT", 12, -56 - (i - 1) * ROW_H)
    row.label = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    row.label:SetPoint("LEFT", 4, 0)
    row.label:SetJustifyH("LEFT")
    row.cat = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    row.cat:SetPoint("RIGHT", -4, 0)
    row.hl = row:CreateTexture(nil, "HIGHLIGHT")
    row.hl:SetAllPoints()
    row.marker = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    row.marker:SetPoint("RIGHT", row, "LEFT", 0, 0)
    row.marker:SetText(">")
    row.marker:Hide()
    row:SetScript("OnClick", function(self)
      if self.topic then ns.Conversation.Ask(self.topic) end
    end)
    panel.rows[i] = row
  end
  panel.empty = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  panel.empty:SetPoint("TOPLEFT", 16, -60)
  panel.empty:SetWidth(WIDTH - 32)
  panel.empty:SetJustifyH("LEFT")

  panel.archive = CreateFrame("Button", nil, panel, C.Template("button"))
  panel.archive:SetSize(WIDTH - 24, 20)
  panel.archive:SetPoint("BOTTOMLEFT", 12, 10)
  panel.archive:SetScript("OnClick", function() showArchive = not showArchive; offset = 0; refresh() end)

  panel:EnableMouseWheel(true)
  panel:SetScript("OnMouseWheel", function(_, delta)
    offset = math.max(0, math.min(math.max(0, #filtered - ROWS), offset - delta))
    refresh()
  end)
end

function Ask.Style()
  local size = Theme.TextSize()
  Theme.Recolor(panel)
  Theme.SetFont(panel.title, "name", size + 2)
  Theme.TextColor(panel.title, "name")
  Theme.SetFont(panel.empty, "body", size - 2)
  Theme.TextColor(panel.empty, "dim")
  local p = Theme.Palette()
  for _, row in ipairs(panel.rows) do
    Theme.SetFont(row.label, "body", size - 1)
    Theme.SetFont(row.marker, "name", size - 1)
    Theme.TextColor(row.marker, "name")
    Theme.SetFont(row.cat, "body", size - 4)
    Theme.TextColor(row.label, "choice")
    Theme.TextColor(row.cat, "dim")
    row.hl:SetColorTexture(p.highlight[1], p.highlight[2], p.highlight[3], p.highlight[4])
  end
  panel:SetScale((ns.db and ns.db.settings.scale) or 1)
end

function Ask.Toggle(anchor)
  if not panel then create() end
  if panel:IsShown() then panel:Hide(); return end
  panel.title:SetText(L.ASK_TITLE)
  panel.empty:SetText(L.ASK_NONE)
  panel.search:SetText("")
  Ask.Style()
  panel:ClearAllPoints()
  if anchor then panel:SetPoint("TOPLEFT", anchor, "TOPRIGHT", 4, 0) else panel:SetPoint("CENTER") end
  offset, selected = 0, nil
  refresh()
  panel:Show()
end

-- Keyboard / gamepad: move through the list (scrolling as needed) and ask.
function Ask.Move(delta)
  if not panel or #filtered == 0 then return end
  if not selected then
    selected = delta > 0 and 1 or #filtered
  else
    selected = (selected - 1 + delta) % #filtered + 1
  end
  if selected <= offset then offset = selected - 1 end
  if selected > offset + ROWS then offset = selected - ROWS end
  refresh()
end

function Ask.Confirm()
  local t = selected and filtered[selected]
  if t then ns.Conversation.Ask(t.id) end
end

function Ask.Selected() return selected and filtered[selected] and filtered[selected].id end

function Ask.Hide() if panel then panel:Hide() end end
function Ask.IsShown() return panel ~= nil and panel:IsShown() end
function Ask.Rows() return panel and panel.rows end
