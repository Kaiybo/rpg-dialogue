-- The Letters page of the journal (0.106.0; a separate panel at the mailbox before that).
-- Letters from RPG Dialogue (Systems/Letters.lua) are listed on the left, newest first, and
-- the chosen one is read on the right. Opening a mailbox with unread letters opens the
-- journal on this page (beside the mail window, unless the journal has been moved), and
-- walking off closes it again if the mailbox opened it.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local UI = ns.UI
local Theme = UI.Theme

local P = {}
UI.Letters = P

local LIST_W, ROW_H, ROW_GAP = 250, 38, 2
local page, reading, offset = nil, nil, 0
local rows = {}
local openedByMail   -- { frame = mail window was up, x, y }: the mailbox opened the journal

---------------------------------------------------------------------------
-- Mailbox: open beside it, close on walking off
---------------------------------------------------------------------------
-- World position in yards. UnitPosition can be missing or return nil on this client,
-- so fall back to the map position converted to world coordinates.
local function playerPos()
  if UnitPosition then
    local ok, y, x = pcall(UnitPosition, "player")
    if ok and y and x then return x, y end
  end
  local M = C_Map
  if M and M.GetBestMapForUnit and M.GetPlayerMapPosition and M.GetWorldPosFromMapPos then
    local ok, x, y = pcall(function()
      local map = M.GetBestMapForUnit("player")
      local pos = map and M.GetPlayerMapPosition(map, "player")
      if not pos then return end
      local _, world = M.GetWorldPosFromMapPos(map, pos)
      if world then return world.x, world.y end
    end)
    if ok and x and y then return x, y end
  end
end

local function closeAtMail()
  if not openedByMail then return end
  openedByMail = nil
  if ns.Journal.IsShown() and ns.Journal.Current() == "letters" then ns.Journal.Frame():Hide() end
end

local watcher = CreateFrame("Frame")
local elapsed = 0
watcher:SetScript("OnUpdate", function(_, dt)
  if not openedByMail then return end
  elapsed = elapsed + dt
  if elapsed < 0.25 then return end
  elapsed = 0
  if not ns.Journal.IsShown() then openedByMail = nil; return end
  local mail = _G.MailFrame
  if not openedByMail.frame and mail and mail:IsShown() then openedByMail.frame = true end
  if openedByMail.frame and not (mail and mail:IsShown()) then return closeAtMail() end
  if openedByMail.x then
    local x, y = playerPos()
    if x and ((x - openedByMail.x) ^ 2 + (y - openedByMail.y) ^ 2) > 100 then return closeAtMail() end
  end
end)

---------------------------------------------------------------------------
-- Building the page
---------------------------------------------------------------------------
local function ago(t)
  if not t or t <= 0 then return "" end
  local days = math.floor((C.Now() - t) / 86400)
  if days <= 0 then return L.LETTER_TODAY end
  if days == 1 then return L.LETTER_YESTERDAY end
  return L.LETTER_DAYS_AGO:format(days)
end

local function makeRow(i)
  local row = CreateFrame("Button", nil, page.list)
  row:SetHeight(ROW_H)
  row:SetPoint("TOPLEFT", 0, -(i - 1) * (ROW_H + ROW_GAP))
  row:SetPoint("TOPRIGHT", 0, -(i - 1) * (ROW_H + ROW_GAP))
  row.hl = row:CreateTexture(nil, "HIGHLIGHT")
  row.hl:SetAllPoints()
  row.sel = row:CreateTexture(nil, "BACKGROUND")
  row.sel:SetAllPoints()
  row.stripe = row:CreateTexture(nil, "BACKGROUND", nil, 1)
  row.stripe:SetPoint("BOTTOMLEFT")
  row.stripe:SetPoint("BOTTOMRIGHT")
  row.stripe:SetHeight(1)
  row.icon = row:CreateTexture(nil, "ARTWORK")
  row.icon:SetSize(26, 26)
  row.icon:SetPoint("LEFT", 4, 0)
  row.dot = row:CreateTexture(nil, "OVERLAY")
  row.dot:SetSize(8, 8)
  row.dot:SetPoint("TOPLEFT", row.icon, "TOPLEFT", -3, 3)
  row.from = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  row.from:SetPoint("TOPLEFT", row.icon, "TOPRIGHT", 8, 1)
  row.from:SetPoint("RIGHT", -38, 0)
  row.from:SetJustifyH("LEFT")
  row.from:SetWordWrap(false)
  row.tag = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  row.tag:SetPoint("TOPRIGHT", -4, -3)
  row.tag:SetJustifyH("RIGHT")
  row.subject = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  row.subject:SetPoint("BOTTOMLEFT", row.icon, "BOTTOMRIGHT", 8, -1)
  row.subject:SetPoint("RIGHT", -4, 0)
  row.subject:SetJustifyH("LEFT")
  row.subject:SetWordWrap(false)
  row:SetScript("OnClick", function(self) if self.id then P.Open(self.id) end end)
  return row
end

local function visibleRows()
  local h = page.list:GetHeight() or 0
  if h <= 0 then h = 330 end
  return math.max(1, math.floor((h + ROW_GAP) / (ROW_H + ROW_GAP)))
end

-- The page sits where the journal's scrolling page sits, inside the journal frame.
function P.Build(jframe)
  if page then return page end
  page = CreateFrame("Frame", nil, jframe)
  page:SetPoint("TOPLEFT", 24, -112)
  page:SetPoint("BOTTOMRIGHT", -24, 14)
  page:Hide()

  page.list = CreateFrame("Frame", nil, page)
  page.list:SetPoint("TOPLEFT", 0, 0)
  page.list:SetPoint("BOTTOMLEFT", 0, 32)
  page.list:SetWidth(LIST_W)
  page.list:EnableMouseWheel(true)
  page.list:SetScript("OnMouseWheel", function(_, delta)
    local n = #ns.Letters.Inbox()
    offset = math.max(0, math.min(offset - delta, n - visibleRows()))
    P.Render()
  end)
  page.empty = page.list:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  page.empty:SetPoint("TOPLEFT", 4, -8)
  page.empty:SetPoint("RIGHT", -4, 0)
  page.empty:SetJustifyH("LEFT")
  page.more = page:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  page.more:SetPoint("TOPLEFT", page.list, "BOTTOMLEFT", 4, -4)

  page.burnJunk = Theme.Button(page, L.LETTER_BURN_JUNK, 130, 22)
  page.burnJunk:SetPoint("BOTTOMLEFT", 0, 2)
  page.burnJunk:SetScript("OnClick", function()
    for _, e in ipairs(ns.Letters.Inbox()) do
      if e.def.junk then ns.Letters.Burn(e.id) end
    end
    if reading and not ns.Letters.Def(reading) then reading = nil end
    offset = 0
    P.Render()
  end)

  page.divider = page:CreateTexture(nil, "ARTWORK")
  page.divider:SetWidth(1)
  page.divider:SetPoint("TOPLEFT", page.list, "TOPRIGHT", 10, 0)
  page.divider:SetPoint("BOTTOM", page, "BOTTOM", 0, 0)

  -- The reader.
  page.reader = CreateFrame("Frame", nil, page)
  page.reader:SetPoint("TOPLEFT", page.list, "TOPRIGHT", 22, 0)
  page.reader:SetPoint("BOTTOMRIGHT", 0, 0)
  page.subject = page.reader:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  page.subject:SetPoint("TOPLEFT", 2, -2)
  page.subject:SetPoint("TOPRIGHT", -2, -2)
  page.subject:SetJustifyH("LEFT")
  page.from = page.reader:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  page.from:SetPoint("TOPLEFT", page.subject, "BOTTOMLEFT", 0, -4)
  page.from:SetPoint("RIGHT", -2, 0)
  page.from:SetJustifyH("LEFT")
  page.rule = Theme.Divider(page.reader)
  page.rule:SetPoint("TOPLEFT", page.from, "BOTTOMLEFT", 0, -6)
  page.rule:SetPoint("RIGHT", page.reader, "RIGHT", -4, 0)
  page.scroll = CreateFrame("ScrollFrame", nil, page.reader, C.Template("scroll"))
  page.scroll:SetPoint("TOPLEFT", page.rule, "BOTTOMLEFT", 0, -8)
  page.scroll:SetPoint("BOTTOMRIGHT", -22, 32)
  page.body = CreateFrame("Frame", nil, page.scroll)
  page.body:SetSize(10, 10)
  page.text = page.body:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  page.text:SetPoint("TOPLEFT", 2, 0)
  page.text:SetJustifyH("LEFT")
  page.text:SetJustifyV("TOP")
  page.scroll:SetScrollChild(page.body)
  page.hint = page.reader:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  page.hint:SetPoint("CENTER", 0, 20)
  page.hint:SetText(L.LETTER_PICK)

  page.burn = Theme.Button(page.reader, L.LETTER_BURN, 100, 22)
  page.burn:SetPoint("BOTTOMRIGHT", -2, 2)
  page.burn:SetScript("OnClick", function()
    if not reading then return end
    local list = ns.Letters.Inbox()
    local idx
    for i, e in ipairs(list) do if e.id == reading then idx = i end end
    ns.Letters.Burn(reading)
    -- Move on to the next letter (or the one before, at the end of the list).
    local nxt = idx and (list[idx + 1] or list[idx - 1])
    reading = nil
    if nxt and nxt.id ~= list[idx].id then P.Open(nxt.id) else P.Render() end
  end)
  return page
end

local function style()
  local size = Theme.TextSize()
  local p = Theme.Palette()
  Theme.StyleButton(page.burn)
  Theme.StyleButton(page.burnJunk)
  page.divider:SetColorTexture(p.divider[1], p.divider[2], p.divider[3], p.divider[4] or 1)
  Theme.ColorDivider(page.rule)
  Theme.SetFont(page.subject, "name", size + 4)
  Theme.TextColor(page.subject, "name")
  Theme.SetFont(page.from, "body", math.max(10, size - 2))
  Theme.TextColor(page.from, "dim")
  Theme.SetFont(page.text, "body", size)
  Theme.TextColor(page.text, "text")
  page.text:SetSpacing(ns.db.settings.lineSpacing or 3)
  Theme.SetFont(page.hint, "body", size)
  Theme.TextColor(page.hint, "dim")
  Theme.SetFont(page.empty, "body", size)
  Theme.TextColor(page.empty, "dim")
  Theme.SetFont(page.more, "body", math.max(10, size - 3))
  Theme.TextColor(page.more, "dim")
end

local function styleRow(row, e)
  local p = Theme.Palette()
  Theme.StyleRow(row)
  local unread = not e.rec.read
  local sel = e.id == reading
  row.sel:SetColorTexture(p.highlight[1], p.highlight[2], p.highlight[3], sel and math.max(0.35, p.highlight[4] or 0.35) or 0)
  Theme.SetFont(row.from, "name", 13)
  Theme.SetFont(row.subject, "body", 11)
  Theme.SetFont(row.tag, "body", 10)
  Theme.TextColor(row.from, (unread or sel) and "name" or "dim")
  Theme.TextColor(row.subject, (unread or sel) and "text" or "dim")
  Theme.TextColor(row.tag, "dim")
  row.dot:SetColorTexture(p.accent[1], p.accent[2], p.accent[3], 1)
  row.dot:SetShown(unread and not e.def.junk)
  row.icon:SetDesaturated(e.def.junk and true or false)
  row.icon:SetAlpha((unread or sel) and 1 or 0.6)
end

function P.Render()
  if not page then return end
  style()
  local inbox = ns.Letters.Inbox()
  local n = #inbox
  local vis = visibleRows()
  offset = math.max(0, math.min(offset, n - vis))
  if not ns.Letters.Enabled() then
    page.empty:SetText(L.LETTERS_OFF)
  else
    page.empty:SetText(L.LETTERS_NONE)
  end
  page.empty:SetShown(n == 0)
  page.burnJunk:SetShown(n > 0)
  local junk = 0
  for _, e in ipairs(inbox) do if e.def.junk then junk = junk + 1 end end
  page.burnJunk:SetEnabled(junk > 0)
  page.burnJunk:SetAlpha(junk > 0 and 1 or 0.5)
  for i = 1, math.max(vis, #rows) do
    local row = rows[i] or makeRow(i)
    rows[i] = row
    local e = i <= vis and inbox[i + offset]
    if e then
      row.id = e.id
      row.from:SetText(ns.Letters.From(e.def))
      row.subject:SetText(e.def.subject or "")
      row.tag:SetText(e.def.junk and L.LETTER_JUNK or ago(e.rec.arrived))
      row.icon:SetTexture(e.rec.read and "Interface\\Icons\\INV_Misc_Note_01" or "Interface\\Icons\\INV_Letter_15")
      if not row.icon:GetTexture() then row.icon:SetTexture("Interface\\Icons\\INV_Misc_Note_01") end
      styleRow(row, e)
      row:Show()
    else
      row.id = nil
      row:Hide()
    end
  end
  if n > vis then
    page.more:SetText(L.LETTER_SHOWING:format(offset + 1, math.min(n, offset + vis), n))
    page.more:Show()
  else
    page.more:Hide()
  end
  page.more:ClearAllPoints()
  page.more:SetPoint("BOTTOMRIGHT", page.list, "BOTTOMRIGHT", -2, -14)

  -- Reader.
  local def = reading and ns.Letters.Def(reading)
  local rec = reading and ns.char.letters and ns.char.letters[reading]
  if def and rec and not rec.burned then
    page.hint:Hide()
    page.subject:SetText(def.subject or "")
    local arrived = ago(rec.arrived)
    page.from:SetText(L.LETTER_FROM:format(ns.Letters.From(def)) .. (arrived ~= "" and ("  ·  " .. arrived) or ""))
    local w = math.max(100, (page.scroll:GetWidth() or 380) - 6)
    page.body:SetWidth(w + 4)
    page.text:SetWidth(w)
    page.text:SetText(ns.Letters.Body(def))
    page.body:SetHeight(math.max(10, page.text:GetStringHeight() + 8))
    for _, f in ipairs({ page.subject, page.from, page.rule, page.scroll, page.burn }) do f:Show() end
  else
    reading = nil
    for _, f in ipairs({ page.subject, page.from, page.rule, page.scroll, page.burn }) do f:Hide() end
    page.hint:SetText(n > 0 and L.LETTER_PICK or "")
    page.hint:Show()
  end
end

-- Called by the journal when it shows or leaves this page.
function P.ShowPage(on)
  if not page then return end
  page:SetShown(on)
  if on then P.Render() end
end

function P.Open(id)
  reading = id
  ns.Letters.Read(id)
  -- Keep the chosen letter in view.
  local vis = visibleRows()
  for i, e in ipairs(ns.Letters.Inbox()) do
    if e.id == id then
      if i <= offset then offset = i - 1 elseif i > offset + vis then offset = i - vis end
    end
  end
  P.Render()
  if page and page.scroll then page.scroll:SetVerticalScroll(0) end
end

-- Up/Down on the journal's Letters page.
function P.Step(dir)
  local inbox = ns.Letters.Inbox()
  if #inbox == 0 then return end
  local idx = 0
  for i, e in ipairs(inbox) do if e.id == reading then idx = i end end
  idx = math.max(1, math.min(#inbox, idx + dir))
  P.Open(inbox[idx].id)
end

-- The journal tab's label: "Letters (2)" while some are unread.
function P.TabLabel()
  local n = ns.char and ns.Letters.Enabled() and ns.Letters.Unread() or 0
  return n > 0 and ("%s (%d)"):format(L.J_TAB_LETTERS, n) or L.J_TAB_LETTERS
end

function P.Refresh()
  if not ns.Journal.IsShown() then return end
  if ns.Journal.Current() == "letters" then ns.Journal.Show("letters", true) else ns.Journal.UpdateTabs() end
end

-- /rpgd letters
function P.Toggle()
  if ns.Journal.IsShown() and ns.Journal.Current() == "letters" then ns.Journal.Frame():Hide(); return end
  reading = nil
  ns.Journal.Show("letters")
end

ns.On("MAIL_SHOW", function()
  ns.Letters.Tick()
  ns.Guard("letters page", function()
    if not ns.Letters.Enabled() or ns.Letters.Unread() == 0 then return end
    if ns.Journal.IsShown() then ns.Journal.Show("letters"); return end
    reading = nil
    ns.Journal.Show("letters")
    ns.Journal.BesideMail()
    local x, y = playerPos()
    local mail = _G.MailFrame
    openedByMail = { frame = mail and mail:IsShown() or false, x = x, y = y }
  end)
end)
ns.On("MAIL_CLOSED", closeAtMail)
-- When the game closes its own mail window (walking away), close ours with it.
if _G.MailFrame then _G.MailFrame:HookScript("OnHide", closeAtMail) end
ns.Listen("LETTERS_CHANGED", function() ns.Guard("letters page", P.Refresh) end)
