-- The letters panel (0.80.0): opens beside the game's mailbox when you have letters from
-- RPG Dialogue (Systems/Letters.lua). A list of letters, newest first; click one to read it,
-- Back to the list, Burn to throw it away.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local UI = ns.UI
local Theme = UI.Theme

local P = {}
UI.Letters = P

local W, H = 300, 420
local ROWS = 9
local ROW_H = 34

local frame, reading
local mailOpen = false

local function makeRow(i)
  local row = CreateFrame("Button", nil, frame.list)
  row:SetHeight(ROW_H)
  row:SetPoint("TOPLEFT", 0, -(i - 1) * (ROW_H + 2))
  row:SetPoint("TOPRIGHT", 0, -(i - 1) * (ROW_H + 2))
  row.hl = row:CreateTexture(nil, "HIGHLIGHT")
  row.hl:SetAllPoints()
  row.stripe = row:CreateTexture(nil, "BACKGROUND")
  row.stripe:SetPoint("BOTTOMLEFT")
  row.stripe:SetPoint("BOTTOMRIGHT")
  row.stripe:SetHeight(1)
  row.icon = row:CreateTexture(nil, "ARTWORK")
  row.icon:SetSize(24, 24)
  row.icon:SetPoint("LEFT", 4, 0)
  row.from = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  row.from:SetPoint("TOPLEFT", row.icon, "TOPRIGHT", 8, 0)
  row.from:SetPoint("RIGHT", -40, 0)
  row.from:SetJustifyH("LEFT")
  row.from:SetWordWrap(false)
  row.subject = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  row.subject:SetPoint("BOTTOMLEFT", row.icon, "BOTTOMRIGHT", 8, 0)
  row.subject:SetPoint("RIGHT", -4, 0)
  row.subject:SetJustifyH("LEFT")
  row.subject:SetWordWrap(false)
  row.new = row:CreateFontString(nil, "OVERLAY", "GameFontGreenSmall")
  row.new:SetPoint("TOPRIGHT", -4, -2)
  row.new:SetText(L.LETTER_NEW)
  row:SetScript("OnClick", function(self) P.Open(self.id) end)
  return row
end

local function create()
  frame = CreateFrame("Frame", "RPGDialogueLettersFrame", UIParent)
  frame:SetSize(W, H)
  frame:SetFrameStrata("HIGH")
  frame:EnableMouse(true)
  frame:Hide()
  Theme.Decorate(frame, 6, { chrome = "frame" })
  frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.title:SetDrawLayer("OVERLAY", 7)
  frame.close = Theme.CloseButton(frame)
  frame.close:SetScript("OnClick", function() frame:Hide() end)

  frame.list = CreateFrame("Frame", nil, frame)
  frame.list:SetPoint("TOPLEFT", 14, -34)
  frame.list:SetPoint("BOTTOMRIGHT", -14, 34)
  frame.empty = frame.list:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.empty:SetPoint("TOP", 0, -20)
  frame.empty:SetText(L.LETTERS_NONE)
  frame.rows = {}
  for i = 1, ROWS do frame.rows[i] = makeRow(i) end

  frame.letter = CreateFrame("Frame", nil, frame)
  frame.letter:SetPoint("TOPLEFT", 14, -34)
  frame.letter:SetPoint("BOTTOMRIGHT", -14, 34)
  frame.subject = frame.letter:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  frame.subject:SetPoint("TOPLEFT", 2, -2)
  frame.subject:SetPoint("TOPRIGHT", -2, -2)
  frame.subject:SetJustifyH("LEFT")
  frame.from = frame.letter:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  frame.from:SetPoint("TOPLEFT", frame.subject, "BOTTOMLEFT", 0, -4)
  frame.from:SetJustifyH("LEFT")
  frame.scroll = CreateFrame("ScrollFrame", nil, frame.letter, C.Template("scroll"))
  frame.scroll:SetPoint("TOPLEFT", 0, -44)
  frame.scroll:SetPoint("BOTTOMRIGHT", -22, 0)
  frame.body = CreateFrame("Frame", nil, frame.scroll)
  frame.body:SetSize(W - 50, 10)
  frame.text = frame.body:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.text:SetPoint("TOPLEFT", 2, 0)
  frame.text:SetWidth(W - 54)
  frame.text:SetJustifyH("LEFT")
  frame.text:SetJustifyV("TOP")
  frame.scroll:SetScrollChild(frame.body)

  frame.back = Theme.Button(frame, L.LETTER_BACK, 90, 22)
  frame.back:SetScript("OnClick", function() reading = nil; P.Refresh() end)
  frame.burn = Theme.Button(frame, L.LETTER_BURN, 90, 22)
  frame.burn:SetScript("OnClick", function()
    if reading then ns.Letters.Burn(reading) end
    reading = nil
    P.Refresh()
  end)
end

-- Game look: title in the title bar, buttons on the bottom bar. Wood look: on the paper.
local function placeParts(game)
  frame.title:ClearAllPoints()
  frame.close:ClearAllPoints()
  frame.back:ClearAllPoints()
  frame.burn:ClearAllPoints()
  if game then
    frame.title:SetPoint("TOPLEFT", 12, -5)
    frame.title:SetPoint("TOPRIGHT", -24, -5)
    frame.title:SetJustifyH("CENTER")
    frame.close:SetPoint("TOPRIGHT", 1, 0)
    frame.back:SetPoint("BOTTOMLEFT", 6, 4)
    frame.burn:SetPoint("BOTTOMRIGHT", -6, 4)
    local inset = Theme.GamePart(frame, "inset")
    if inset then
      inset:ClearAllPoints()
      inset:SetPoint("TOPLEFT", 4, -24)
      inset:SetPoint("BOTTOMRIGHT", -6, 26)
    end
    Theme.FitPaper(frame, W - 10, H - 24 - 26)
  else
    frame.title:SetPoint("TOPLEFT", 16, -14)
    frame.title:SetJustifyH("LEFT")
    frame.close:SetPoint("TOPRIGHT", -12, -12)
    frame.back:SetPoint("BOTTOMLEFT", 14, 12)
    frame.burn:SetPoint("BOTTOMRIGHT", -14, 12)
  end
end

-- Beside the mailbox if there is one, else in the middle of the screen.
local function anchor()
  frame:ClearAllPoints()
  local mail = _G.MailFrame
  if mail and mail:IsShown() then
    frame:SetPoint("TOPLEFT", mail, "TOPRIGHT", -30, -12)
  else
    frame:SetPoint("CENTER")
  end
end

local function style()
  local game = Theme.IsGame()
  Theme.Recolor(frame)
  placeParts(game)
  Theme.StyleButton(frame.back)
  Theme.StyleButton(frame.burn)
  Theme.StyleButton(frame.close, 12)
  Theme.SetFont(frame.title, "name", game and 13 or 18)
  Theme.Shadow(frame.title, game)
  Theme.TextColor(frame.title, game and "title" or "name")
  Theme.SetFont(frame.subject, "name", 15)
  Theme.TextColor(frame.subject, "name")
  Theme.SetFont(frame.from, "body", 11)
  Theme.TextColor(frame.from, "dim")
  Theme.SetFont(frame.text, "body", Theme.BodySize())
  Theme.TextColor(frame.text, "text")
  Theme.SetFont(frame.empty, "body", 12)
  Theme.TextColor(frame.empty, "dim")
  for _, row in ipairs(frame.rows) do
    Theme.StyleRow(row)
    Theme.SetFont(row.from, "name", 13)
    Theme.TextColor(row.from, "name")
    Theme.SetFont(row.subject, "body", 11)
    Theme.TextColor(row.subject, "text")
  end
end

local function showList()
  frame.letter:Hide()
  frame.list:Show()
  frame.back:Hide()
  frame.burn:Hide()
  local inbox = ns.Letters.Inbox()
  local unread = ns.Letters.Unread()
  frame.title:SetText(unread > 0 and ("%s (%d)"):format(L.LETTERS_TITLE, unread) or L.LETTERS_TITLE)
  frame.empty:SetShown(#inbox == 0)
  for i, row in ipairs(frame.rows) do
    local e = inbox[i]
    if e then
      row.id = e.id
      row.from:SetText(ns.Letters.From(e.def))
      row.subject:SetText(e.def.subject or "")
      row.new:SetText(e.def.junk and L.LETTER_JUNK or L.LETTER_NEW)
      row.new:SetShown(not e.rec.read)
      row.icon:SetTexture(e.rec.read and "Interface\\Icons\\INV_Misc_Note_01" or "Interface\\Icons\\INV_Letter_15")
      if not row.icon:GetTexture() then row.icon:SetTexture("Interface\\Icons\\INV_Misc_Note_01") end
      row:Show()
    else
      row.id = nil
      row:Hide()
    end
  end
end

local function showLetter(id)
  local def = ns.Letters.Def(id)
  if not def then reading = nil; return showList() end
  frame.list:Hide()
  frame.letter:Show()
  frame.back:Show()
  frame.burn:Show()
  frame.title:SetText(L.LETTERS_TITLE)
  frame.subject:SetText(def.subject or "")
  frame.from:SetText(L.LETTER_FROM:format(ns.Letters.From(def)))
  frame.text:SetSpacing(ns.db.settings.lineSpacing or 3)
  frame.text:SetText(ns.Letters.Body(def))
  frame.body:SetHeight(math.max(10, frame.text:GetStringHeight() + 8))
  frame.scroll:SetVerticalScroll(0)
end

function P.Open(id)
  reading = id
  ns.Letters.Read(id)
  P.Refresh()
end

-- Shown while the mailbox is open, letters are on, and there's at least one letter.
function P.Refresh()
  local want = mailOpen and ns.Letters.Enabled() and #ns.Letters.Inbox() > 0
  if not want then
    if frame then frame:Hide() end
    return
  end
  if not frame then create() end
  style()
  if reading then showLetter(reading) else showList() end
  if not frame:IsShown() then anchor(); frame:Show() end
end

-- /rpgd letters: open the panel anywhere (handy when a mailbox is far off).
function P.Toggle()
  if frame and frame:IsShown() then frame:Hide(); return end
  if not frame then create() end
  style()
  reading = nil
  showList()
  anchor()
  frame:Show()
end

ns.On("MAIL_SHOW", function()
  mailOpen = true
  reading = nil
  ns.Letters.Tick()
  ns.Guard("letters panel", P.Refresh)
end)
ns.On("MAIL_CLOSED", function()
  mailOpen = false
  if frame then frame:Hide() end
end)
ns.Listen("LETTERS_CHANGED", function()
  if (mailOpen or (frame and frame:IsShown())) and frame then
    ns.Guard("letters panel", function()
      if mailOpen then P.Refresh() elseif reading then showLetter(reading) else showList() end
    end)
  elseif mailOpen then
    ns.Guard("letters panel", P.Refresh)
  end
end)
