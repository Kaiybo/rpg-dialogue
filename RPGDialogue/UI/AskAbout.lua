-- The "Ask about..." list: known topics, most recent first, searchable, with an archive
-- for stale ones. Opens beside the dialogue window.
-- Game look: built like the conversation box beside it (metal frame, title in the title
-- bar, search in the header, topics on parchment, the archive button on the bottom bar),
-- and the same height as the box. Wood look: a fixed-size wood panel.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local UI = ns.UI
local Theme = UI.Theme

local Ask = {}
UI.AskAbout = Ask

local MAX_ROWS, ROW_H = 12, 20
local WOOD_WIDTH, GAME_WIDTH = 240, 260
local WOOD_HEIGHT = 66 + MAX_ROWS * ROW_H + 40
-- Game look: rows start below the 60-pixel header; the bottom bar is 26 high.
local GAME_TOP, GAME_BAR = 66, 26
local panel
local offset, showArchive, filtered = 0, false, {}
local selected   -- index into filtered (keyboard / gamepad)
local rows = MAX_ROWS   -- rows that fit the panel right now

local function width() return Theme.IsGame() and GAME_WIDTH or WOOD_WIDTH end

-- One row per entry: a category header (not clickable) or a topic. Topics already asked
-- of this NPC say so; "ask anyone" topics come first.
local function isTopic(i) return filtered[i] ~= nil and filtered[i].topic ~= nil end

local function refresh()
  local text = panel.search:GetText()
  local s = ns.Conversation.session
  local npcKey = s and s.memKey
  local list = ns.Topics.Filter(ns.Topics.Known(showArchive, npcKey), text)
  filtered = ns.Topics.Rows(list, text ~= nil and text ~= "")
  for i = 1, MAX_ROWS do
    local row = panel.rows[i]
    local e = i <= rows and filtered[i + offset]
    if e and e.header then
      row.topic = nil
      row.label:SetText(e.header)
      Theme.TextColor(row.label, "dim")
      row.cat:SetText("")
      row:UnlockHighlight()
      row.marker:Hide()
      row:EnableMouse(false)
      row:Show()
    elseif e then
      local t = e.topic
      row.topic = t.id
      local asked = npcKey and ns.Topics.AskedOf(t.id, npcKey)
      local nothing = asked and ns.Topics.NothingFrom(t.id, npcKey)
      local suffix = ""
      if t.archived then suffix = " |cff888888(" .. L.ASK_ARCHIVED .. ")|r" end
      if nothing then suffix = suffix .. " " .. Theme.Hex("dim") .. "(" .. L.ASK_NOTHING .. ")|r"
      elseif asked then suffix = suffix .. " " .. Theme.Hex("dim") .. "(" .. L.ASK_ASKED .. ")|r" end
      row.label:SetText("  " .. t.name .. suffix)
      Theme.TextColor(row.label, "choice")
      row.cat:SetText("")
      local on = (selected == i + offset)
      if on then row:LockHighlight() else row:UnlockHighlight() end
      row.marker:SetShown(on)
      row:EnableMouse(true)
      row:Show()
    else
      row:Hide()
    end
  end
  local any = false
  for i = 1, #filtered do if isTopic(i) then any = true; break end end
  panel.empty:SetShown(not any)
  panel.archive:SetText(showArchive and L.ASK_HIDE_ARCHIVE or L.ASK_SHOW_ARCHIVE)
end

local function create()
  panel = CreateFrame("Frame", nil, Theme.Parent())
  panel:SetSize(WOOD_WIDTH, WOOD_HEIGHT)
  panel:SetFrameStrata(Theme.Strata())
  panel:SetClampedToScreen(true)
  panel:EnableMouse(true)
  panel:Hide()
  Theme.Decorate(panel, 5, { chrome = "frame" })

  panel.title = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  panel.title:SetDrawLayer("OVERLAY", 7)
  panel.close = Theme.CloseButton(panel)
  panel.close:SetScript("OnClick", function() panel:Hide() end)
  panel.search = CreateFrame("EditBox", nil, panel, C.Template("editbox"))
  panel.search:SetAutoFocus(false)
  panel.search:SetScript("OnTextChanged", function() offset = 0; refresh() end)
  panel.search:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)

  panel.rows = {}
  for i = 1, MAX_ROWS do
    local row = CreateFrame("Button", nil, panel)
    row:SetHeight(ROW_H)
    row.label = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    row.label:SetPoint("LEFT", 4, 0)
    row.label:SetJustifyH("LEFT")
    row.cat = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    row.cat:SetPoint("RIGHT", -4, 0)
    row.hl = row:CreateTexture(nil, "HIGHLIGHT")
    row.hl:SetAllPoints()
    row.stripe = row:CreateTexture(nil, "HIGHLIGHT", nil, 1)
    row.stripe:SetPoint("TOPLEFT")
    row.stripe:SetPoint("BOTTOMLEFT")
    row.stripe:SetWidth(3)
    row.marker = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    row.marker:SetPoint("RIGHT", row, "LEFT", 0, 0)
    row.marker:SetText(">")
    row.marker:Hide()
    row:SetScript("OnClick", function(self)
      if self.topic then ns.Conversation.Ask(self.topic) end
    end)
    -- Where the topic came from, and what this person made of it.
    row:SetScript("OnEnter", function(self)
      if not self.topic then return end
      local def = ns.Data.topics[self.topic]
      GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
      GameTooltip:SetText(def and def.name or self.topic)
      if def and def.standard then
        GameTooltip:AddLine(self.topic == "knows" and L.ASK_KNOWS_TIP or L.ASK_ANYONE_TIP, 1, 1, 1, true)
      else
        local from = ns.Topics.Source(self.topic)
        if from then GameTooltip:AddLine(L.ASK_HEARD_FROM:format(from), 1, 1, 1, true) end
      end
      local s = ns.Conversation.session
      local key = s and s.memKey
      if key and ns.Topics.NothingFrom(self.topic, key) then
        GameTooltip:AddLine(L.ASK_NOTHING_TIP, 0.7, 0.7, 0.7, true)
      elseif key and ns.char.npc[key] and ns.char.npc[key].knows and ns.char.npc[key].knows[self.topic] then
        GameTooltip:AddLine(L.ASK_KNOWS_ROW_TIP, 0.7, 0.7, 0.7, true)
      end
      GameTooltip:Show()
    end)
    row:SetScript("OnLeave", function() GameTooltip:Hide() end)
    panel.rows[i] = row
  end
  panel.empty = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  panel.empty:SetJustifyH("LEFT")

  panel.rule = Theme.Divider(panel)
  panel.archive = Theme.Button(panel, "", WOOD_WIDTH - 28, 22)
  panel.archive:SetScript("OnClick", function() showArchive = not showArchive; offset = 0; refresh() end)

  panel:EnableMouseWheel(true)
  panel:SetScript("OnMouseWheel", function(_, delta)
    offset = math.max(0, math.min(math.max(0, #filtered - rows), offset - delta))
    refresh()
  end)
end

-- Positions for the current look, and how many rows fit the current height.
local function layout()
  local game = Theme.IsGame()
  local W, H = width(), panel:GetHeight() or 0
  panel:SetWidth(W)
  for _, part in ipairs({ panel.title, panel.close, panel.search, panel.empty, panel.archive, panel.rule }) do
    part:ClearAllPoints()
  end
  local top
  if game then
    panel.title:SetPoint("TOPLEFT", 12, -5)
    panel.title:SetPoint("TOPRIGHT", -24, -5)
    panel.title:SetJustifyH("CENTER")
    panel.close:SetPoint("TOPRIGHT", 1, 0)
    panel.search:SetSize(W - 36, 20)
    panel.search:SetPoint("TOPLEFT", 20, -30)
    panel.empty:SetPoint("TOPLEFT", 16, -GAME_TOP - 2)
    panel.archive:SetSize(W - 20, 22)
    panel.archive:SetPoint("BOTTOMLEFT", 8, 4)
    local inset = Theme.GamePart(panel, "inset")
    if inset then
      inset:ClearAllPoints()
      inset:SetPoint("TOPLEFT", 4, -60)
      inset:SetPoint("BOTTOMRIGHT", -6, GAME_BAR)
    end
    Theme.FitPaper(panel, W - 10, H - 60 - GAME_BAR)
    top = -GAME_TOP
    rows = math.max(3, math.min(MAX_ROWS, math.floor((H - GAME_TOP - GAME_BAR - 6) / ROW_H)))
  else
    panel.title:SetPoint("TOPLEFT", 14, -12)
    panel.title:SetJustifyH("LEFT")
    panel.close:SetPoint("TOPRIGHT", -8, -8)
    panel.search:SetSize(W - 30, 20)
    panel.search:SetPoint("TOPLEFT", 18, -36)
    panel.empty:SetPoint("TOPLEFT", 16, -60)
    panel.archive:SetSize(W - 28, 22)
    panel.archive:SetPoint("BOTTOMLEFT", 14, 12)
    panel.rule:SetPoint("TOPLEFT", 12, -28)
    panel.rule:SetPoint("TOPRIGHT", -12, -28)
    top = -62
    rows = MAX_ROWS
  end
  panel.rule:SetShown(not game)
  panel.empty:SetWidth(W - 32)
  for i, row in ipairs(panel.rows) do
    row:ClearAllPoints()
    row:SetWidth(W - (game and 30 or 24))
    row:SetPoint("TOPLEFT", 14, top - (i - 1) * ROW_H)
  end
end

function Ask.Style()
  local size = Theme.BodySize()
  local game = Theme.IsGame()
  Theme.Recolor(panel)
  -- In the game look the title sits in the metal title bar, like the box's name.
  Theme.SetFont(panel.title, "name", game and 13 or size + 2)
  Theme.Shadow(panel.title, game)
  Theme.TextColor(panel.title, game and "title" or "name")
  Theme.SetFont(panel.empty, "body", size - 2)
  Theme.TextColor(panel.empty, "dim")
  for _, row in ipairs(panel.rows) do
    Theme.SetFont(row.label, "body", size - 1)
    Theme.SetFont(row.marker, "name", size - 1)
    Theme.TextColor(row.marker, "marker")
    Theme.SetFont(row.cat, "body", size - 4)
    Theme.TextColor(row.label, "choice")
    Theme.TextColor(row.cat, "dim")
    Theme.StyleRow(row)
  end
  Theme.ColorDivider(panel.rule)
  Theme.StyleButton(panel.archive)
  Theme.StyleButton(panel.close, 12)
  panel:SetScale(Theme.Scale())
  layout()
end

-- Game look: the same height as the box beside it. Then lay out and fill again.
function Ask.Fit(anchor)
  if not panel then return end
  if Theme.IsGame() and anchor then
    panel:SetHeight(math.max(200, anchor:GetHeight() or 0))
  else
    panel:SetHeight(WOOD_HEIGHT)
  end
  layout()
  if selected and selected > offset + rows then offset = selected - rows end
  refresh()
end

function Ask.Toggle(anchor)
  if not panel then create() end
  if panel:IsShown() then panel:Hide(); return end
  panel.title:SetText(L.ASK_TITLE)
  panel.empty:SetText(L.ASK_NONE)
  panel.search:SetText("")
  offset, selected = 0, nil
  Ask.Style()
  panel:ClearAllPoints()
  -- The game look's metal frame reaches a few pixels past the box's edge.
  local gap = Theme.IsGame() and 12 or 4
  if anchor then panel:SetPoint("TOPLEFT", anchor, "TOPRIGHT", gap, 0) else panel:SetPoint("CENTER") end
  Ask.Fit(anchor)
  panel:Show()
end

-- Keyboard / gamepad: move through the topics (skipping headers, scrolling as needed) and ask.
function Ask.Move(delta)
  if not panel then return end
  local n = #filtered
  local any = false
  for i = 1, n do if isTopic(i) then any = true; break end end
  if not any then return end
  local i = selected or (delta > 0 and 0 or n + 1)
  repeat
    i = i + (delta > 0 and 1 or -1)
    if i > n then i = 1 elseif i < 1 then i = n end
  until isTopic(i)
  selected = i
  -- Keep a header in view above the first topic of its group.
  local top = (selected > 1 and not isTopic(selected - 1)) and selected - 1 or selected
  if top <= offset then offset = top - 1 end
  if selected > offset + rows then offset = selected - rows end
  refresh()
end

function Ask.Confirm()
  local e = selected and filtered[selected]
  if e and e.topic then ns.Conversation.Ask(e.topic.id) end
end

function Ask.Selected()
  local e = selected and filtered[selected]
  return e and e.topic and e.topic.id
end

-- After an answer: redraw, so the topic just asked shows as asked.
function Ask.Refresh() if panel and panel:IsShown() then refresh() end end

function Ask.Hide() if panel then panel:Hide() end end
function Ask.IsShown() return panel ~= nil and panel:IsShown() end
function Ask.Rows() return panel and panel.rows end
