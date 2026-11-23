-- Letters in the game's own mail window (0.106.0): a third tab, "Letters", beside Inbox and
-- Send Mail. Letters from RPG Dialogue (Systems/Letters.lua) are listed like the inbox, newest
-- first; click one to read it on letter paper, Back to the list, Burn to throw it away,
-- Reply to pick an answer (0.107.0; Systems/Letters.lua Letters.Replies).
-- The mail window can also be dragged, and opens where it was left.
local _, ns = ...

local C = ns.Compat
local L = ns.L

local P = {}
ns.UI.Letters = P

local ROWS, ROW_H = 7, 45
local INK = {
  name = { 0.24, 0.12, 0.00 },
  text = { 0.18, 0.10, 0.02 },
  dim  = { 0.40, 0.30, 0.20 },
  new  = { 0.10, 0.42, 0.00 },
}

local tab, panel, tabID
local reading, pageNo, replying = nil, 1, false
local MAX_OPTS = 5

local function ink(fs, key) local c = INK[key]; fs:SetTextColor(c[1], c[2], c[3]); fs:SetShadowOffset(0, 0) end
local function font(fs, objects)
  for _, name in ipairs(objects) do
    if _G[name] then fs:SetFontObject(_G[name]); return end
  end
end

local function ago(t)
  if not t or t <= 0 then return "" end
  local days = math.floor((C.Now() - t) / 86400)
  if days <= 0 then return L.LETTER_TODAY end
  if days == 1 then return L.LETTER_YESTERDAY end
  return L.LETTER_DAYS_AGO:format(days)
end

local function button(parent, text, w)
  local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  b:SetSize(w, 22)
  b:SetText(text)
  return b
end

---------------------------------------------------------------------------
-- The panel (inside the mail window, where the inbox sits)
---------------------------------------------------------------------------
local function makeRow(i)
  local row = CreateFrame("Button", nil, panel.list)
  row:SetHeight(ROW_H)
  row:SetPoint("TOPLEFT", 0, -(i - 1) * ROW_H)
  row:SetPoint("TOPRIGHT", 0, -(i - 1) * ROW_H)
  row:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
  row.line = row:CreateTexture(nil, "BACKGROUND")
  row.line:SetPoint("BOTTOMLEFT", 4, 0)
  row.line:SetPoint("BOTTOMRIGHT", -4, 0)
  row.line:SetHeight(1)
  row.line:SetColorTexture(0.32, 0.20, 0.08, 0.35)
  row.slot = row:CreateTexture(nil, "BORDER")
  row.slot:SetTexture("Interface\\Buttons\\UI-EmptySlot")
  row.slot:SetSize(56, 56)
  row.slot:SetPoint("LEFT", -6, 0)
  row.icon = row:CreateTexture(nil, "ARTWORK")
  row.icon:SetSize(34, 34)
  row.icon:SetPoint("LEFT", 5, 0)
  row.from = row:CreateFontString(nil, "OVERLAY")
  font(row.from, { "GameFontNormal" })
  row.from:SetPoint("TOPLEFT", row.icon, "TOPRIGHT", 8, -2)
  row.from:SetPoint("RIGHT", -60, 0)
  row.from:SetJustifyH("LEFT")
  row.from:SetWordWrap(false)
  row.tag = row:CreateFontString(nil, "OVERLAY")
  font(row.tag, { "GameFontNormalSmall" })
  row.tag:SetPoint("TOPRIGHT", -6, -7)
  row.tag:SetJustifyH("RIGHT")
  row.subject = row:CreateFontString(nil, "OVERLAY")
  font(row.subject, { "GameFontHighlightSmall" })
  row.subject:SetPoint("BOTTOMLEFT", row.icon, "BOTTOMRIGHT", 8, 3)
  row.subject:SetPoint("RIGHT", -6, 0)
  row.subject:SetJustifyH("LEFT")
  row.subject:SetWordWrap(false)
  row:SetScript("OnClick", function(self) if self.id then P.Open(self.id) end end)
  return row
end

local function region()
  local mail = _G.MailFrame
  local inset = mail.Inset or _G.MailFrameInset
  panel:ClearAllPoints()
  if inset then
    panel:SetPoint("TOPLEFT", inset, "TOPLEFT", 4, -4)
    panel:SetPoint("BOTTOMRIGHT", inset, "BOTTOMRIGHT", -4, 4)
  else
    panel:SetPoint("TOPLEFT", mail, "TOPLEFT", 16, -64)
    panel:SetPoint("BOTTOMRIGHT", mail, "BOTTOMRIGHT", -16, 36)
  end
end

local function create()
  panel = CreateFrame("Frame", "RPGDialogueMailLetters", _G.MailFrame)
  panel:SetFrameLevel(_G.MailFrame:GetFrameLevel() + 5)
  panel:EnableMouse(true)
  panel:Hide()
  region()

  -- Paper: the game's letter stationery, over a parchment fill in case it's missing.
  panel.fill = panel:CreateTexture(nil, "BACKGROUND")
  panel.fill:SetAllPoints()
  panel.fill:SetColorTexture(0.86, 0.78, 0.60, 1)
  panel.paper = panel:CreateTexture(nil, "BACKGROUND", nil, 1)
  panel.paper:SetAllPoints()
  panel.paper:Hide()
  -- Drags on the panel move the mail window too.
  panel:RegisterForDrag("LeftButton")
  panel:SetScript("OnDragStart", function() local m = _G.MailFrame; if m:IsMovable() and not C.InCombat() then m:StartMoving() end end)
  panel:SetScript("OnDragStop", function() P.SaveMail() end)

  -- List view.
  panel.list = CreateFrame("Frame", nil, panel)
  panel.list:SetPoint("TOPLEFT", 6, -6)
  panel.list:SetPoint("BOTTOMRIGHT", -6, 34)
  panel.list:EnableMouseWheel(true)
  panel.list:SetScript("OnMouseWheel", function(_, delta) P.Page(-delta) end)
  panel.rows = {}
  for i = 1, ROWS do panel.rows[i] = makeRow(i) end
  panel.empty = panel.list:CreateFontString(nil, "OVERLAY")
  font(panel.empty, { "QuestFont", "GameFontHighlight" })
  panel.empty:SetPoint("TOP", 0, -40)
  panel.empty:SetPoint("LEFT", 10, 0)
  panel.empty:SetPoint("RIGHT", -10, 0)
  ink(panel.empty, "dim")

  panel.prev = CreateFrame("Button", nil, panel)
  panel.prev:SetSize(28, 28)
  panel.prev:SetPoint("BOTTOMLEFT", 4, 4)
  panel.prev:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
  panel.prev:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
  panel.prev:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")
  panel.prev:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
  panel.prev:SetScript("OnClick", function() P.Page(-1) end)
  panel.next = CreateFrame("Button", nil, panel)
  panel.next:SetSize(28, 28)
  panel.next:SetPoint("BOTTOMRIGHT", -4, 4)
  panel.next:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
  panel.next:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
  panel.next:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
  panel.next:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
  panel.next:SetScript("OnClick", function() P.Page(1) end)
  panel.pageText = panel:CreateFontString(nil, "OVERLAY")
  font(panel.pageText, { "GameFontNormalSmall" })
  panel.pageText:SetPoint("LEFT", panel.prev, "RIGHT", 4, 0)
  ink(panel.pageText, "dim")
  panel.burnJunk = button(panel, L.LETTER_BURN_JUNK, 110)
  panel.burnJunk:SetPoint("BOTTOM", 0, 7)
  panel.burnJunk:SetScript("OnClick", function()
    for _, e in ipairs(ns.Letters.Inbox()) do
      if e.def.junk then ns.Letters.Burn(e.id) end
    end
    P.Render()
  end)

  -- Reading view.
  panel.letter = CreateFrame("Frame", nil, panel)
  panel.letter:SetPoint("TOPLEFT", 10, -8)
  panel.letter:SetPoint("BOTTOMRIGHT", -8, 34)
  panel.subject = panel.letter:CreateFontString(nil, "OVERLAY")
  font(panel.subject, { "QuestTitleFont", "GameFontNormalLarge" })
  panel.subject:SetPoint("TOPLEFT", 2, -2)
  panel.subject:SetPoint("TOPRIGHT", -2, -2)
  panel.subject:SetJustifyH("LEFT")
  ink(panel.subject, "name")
  panel.from = panel.letter:CreateFontString(nil, "OVERLAY")
  font(panel.from, { "GameFontNormalSmall" })
  panel.from:SetPoint("TOPLEFT", panel.subject, "BOTTOMLEFT", 0, -4)
  panel.from:SetPoint("RIGHT", -2, 0)
  panel.from:SetJustifyH("LEFT")
  ink(panel.from, "dim")
  panel.rule = panel.letter:CreateTexture(nil, "ARTWORK")
  panel.rule:SetHeight(1)
  panel.rule:SetPoint("TOPLEFT", panel.from, "BOTTOMLEFT", 0, -6)
  panel.rule:SetPoint("RIGHT", panel.letter, "RIGHT", -4, 0)
  panel.rule:SetColorTexture(0.32, 0.20, 0.08, 0.45)
  panel.scroll = CreateFrame("ScrollFrame", nil, panel.letter, C.Template("scroll"))
  panel.scroll:SetPoint("TOPLEFT", panel.rule, "BOTTOMLEFT", 0, -8)
  panel.scroll:SetPoint("BOTTOMRIGHT", -22, 2)
  panel.body = CreateFrame("Frame", nil, panel.scroll)
  panel.body:SetSize(10, 10)
  panel.text = panel.body:CreateFontString(nil, "OVERLAY")
  font(panel.text, { "QuestFont", "GameFontHighlight" })
  panel.text:SetPoint("TOPLEFT", 2, 0)
  panel.text:SetJustifyH("LEFT")
  panel.text:SetJustifyV("TOP")
  ink(panel.text, "text")
  panel.scroll:SetScrollChild(panel.body)

  panel.back = button(panel, L.LETTER_BACK, 90)
  panel.back:SetPoint("BOTTOMLEFT", 6, 7)
  panel.back:SetScript("OnClick", function() reading = nil; replying = false; P.Render() end)
  panel.reply = button(panel, L.LETTER_REPLY, 100)
  panel.reply:SetPoint("BOTTOM", 0, 7)
  panel.reply:SetScript("OnClick", function() replying = not replying; P.Render() end)

  -- Reply choices, under the letter.
  panel.opts = CreateFrame("Frame", nil, panel)
  panel.opts:SetPoint("BOTTOMLEFT", 10, 34)
  panel.opts:SetPoint("BOTTOMRIGHT", -8, 34)
  panel.opts:SetHeight(10)
  panel.opts.rule = panel.opts:CreateTexture(nil, "ARTWORK")
  panel.opts.rule:SetHeight(1)
  panel.opts.rule:SetPoint("TOPLEFT", 0, 0)
  panel.opts.rule:SetPoint("TOPRIGHT", -4, 0)
  panel.opts.rule:SetColorTexture(0.32, 0.20, 0.08, 0.45)
  panel.opts.buttons = {}
  for i = 1, MAX_OPTS do
    local b = CreateFrame("Button", nil, panel.opts)
    b:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "ADD")
    b.text = b:CreateFontString(nil, "OVERLAY")
    font(b.text, { "QuestFont", "GameFontHighlight" })
    b.text:SetPoint("TOPLEFT", 4, -3)
    b.text:SetPoint("RIGHT", -4, 0)
    b.text:SetJustifyH("LEFT")
    ink(b.text, "name")
    b.index = i
    b:SetScript("OnClick", function(self)
      if reading then ns.Letters.Reply(reading, self.index) end
      replying = false
      P.Render()
    end)
    panel.opts.buttons[i] = b
  end
  panel.burn = button(panel, L.LETTER_BURN, 90)
  panel.burn:SetPoint("BOTTOMRIGHT", -6, 7)
  panel.burn:SetScript("OnClick", function()
    if reading then ns.Letters.Burn(reading) end
    reading, replying = nil, false
    P.Render()
  end)
end

-- The inbox's own parchment (the biggest texture on the inbox), so the tab looks like it.
local function copyPaper()
  local inbox = _G.InboxFrame
  if panel.paperDone or not inbox or not inbox.GetRegions then return end
  panel.paperDone = true
  local best, area = nil, 0
  for _, r in ipairs({ inbox:GetRegions() }) do
    if r.GetObjectType and r:GetObjectType() == "Texture" and r:IsShown() then
      local w, h = r:GetSize()
      if (w or 0) * (h or 0) > area and ((r.GetAtlas and r:GetAtlas()) or r:GetTexture()) then best, area = r, w * h end
    end
  end
  if not best or area < 20000 then return end
  local atlas = best.GetAtlas and best:GetAtlas()
  if atlas then panel.paper:SetAtlas(atlas) else
    panel.paper:SetTexture(best:GetTexture())
    panel.paper:SetTexCoord(best:GetTexCoord())
  end
  panel.paper:ClearAllPoints()
  panel.paper:SetPoint("TOPLEFT", best, "TOPLEFT")
  panel.paper:SetPoint("BOTTOMRIGHT", best, "BOTTOMRIGHT")
  panel.paper:Show()
end

local function pages(n) return math.max(1, math.ceil(n / ROWS)) end

local function showList()
  panel.letter:Hide(); panel.back:Hide(); panel.burn:Hide(); panel.reply:Hide(); panel.opts:Hide()
  panel.list:Show(); panel.prev:Show(); panel.next:Show(); panel.pageText:Show()
  local inbox = ns.Letters.Inbox()
  local n = #inbox
  pageNo = math.max(1, math.min(pageNo, pages(n)))
  panel.empty:SetText(ns.Letters.Enabled() and L.LETTERS_NONE or L.LETTERS_OFF)
  panel.empty:SetShown(n == 0)
  local junk = 0
  for _, e in ipairs(inbox) do if e.def.junk then junk = junk + 1 end end
  panel.burnJunk:SetShown(junk > 0)
  panel.prev:SetEnabled(pageNo > 1)
  panel.next:SetEnabled(pageNo < pages(n))
  panel.pageText:SetText(n > ROWS and L.LETTER_PAGE:format(pageNo, pages(n)) or "")
  for i, row in ipairs(panel.rows) do
    local e = inbox[(pageNo - 1) * ROWS + i]
    if e then
      local unread = not e.rec.read
      row.id = e.id
      row.from:SetText(ns.Letters.From(e.def))
      row.subject:SetText(e.def.subject or "")
      ink(row.from, unread and "name" or "dim")
      ink(row.subject, unread and "text" or "dim")
      if unread then
        row.tag:SetText(e.def.junk and L.LETTER_JUNK or L.LETTER_NEW)
        ink(row.tag, e.def.junk and "dim" or "new")
      else
        row.tag:SetText(ago(e.rec.arrived))
        ink(row.tag, "dim")
      end
      row.icon:SetTexture(unread and "Interface\\Icons\\INV_Letter_15" or "Interface\\Icons\\INV_Misc_Note_01")
      if not row.icon:GetTexture() then row.icon:SetTexture("Interface\\Icons\\INV_Misc_Note_01") end
      row.icon:SetDesaturated(e.def.junk and true or false)
      row:Show()
    else
      row.id = nil
      row:Hide()
    end
  end
end

local function showLetter()
  local def = ns.Letters.Def(reading)
  local rec = ns.char.letters and ns.char.letters[reading]
  if not def or not rec or rec.burned then reading = nil; return showList() end
  panel.list:Hide(); panel.prev:Hide(); panel.next:Hide(); panel.pageText:Hide(); panel.burnJunk:Hide()
  panel.letter:Show(); panel.back:Show(); panel.burn:Show()
  local canReply = ns.Letters.CanReply(reading)
  if not canReply then replying = false end
  panel.reply:SetShown(canReply)
  panel.reply:SetText(replying and L.LETTER_REPLY_CANCEL or L.LETTER_REPLY)
  local optsH = 0
  if replying then
    local list = ns.Letters.Replies(reading) or {}
    local w = math.max(100, (panel.opts:GetWidth() or 280) - 8)
    for i, b in ipairs(panel.opts.buttons) do
      local r = list[i]
      if r then
        b.text:SetWidth(w)
        b.text:SetText(i .. ". " .. (r.text or ""))
        local h = math.max(18, b.text:GetStringHeight() + 6)
        b:ClearAllPoints()
        b:SetPoint("TOPLEFT", 0, -(optsH + 4))
        b:SetPoint("RIGHT", panel.opts, "RIGHT", 0, 0)
        b:SetHeight(h)
        b:Show()
        optsH = optsH + h
      else
        b:Hide()
      end
    end
    optsH = optsH + 8
    panel.opts:SetHeight(optsH)
  end
  panel.opts:SetShown(replying)
  panel.letter:SetPoint("BOTTOMRIGHT", -8, 34 + optsH)
  panel.subject:SetText(def.subject or "")
  local when = ago(rec.arrived)
  panel.from:SetText(L.LETTER_FROM:format(ns.Letters.From(def)) .. (when ~= "" and ("  ·  " .. when) or ""))
  local w = math.max(100, (panel.scroll:GetWidth() or 260) - 6)
  panel.body:SetWidth(w + 4)
  panel.text:SetWidth(w)
  panel.text:SetSpacing(ns.db.settings.lineSpacing or 3)
  local body = ns.Letters.Body(def)
  if rec.replyText then body = body .. "\n\n" .. L.LETTER_REPLIED .. "\n\"" .. rec.replyText .. "\"" end
  panel.text:SetText(body)
  panel.body:SetHeight(math.max(10, panel.text:GetStringHeight() + 8))
end

function P.Render()
  P.UpdateTab()
  if not panel or not panel:IsShown() then return end
  if reading then showLetter() else showList() end
end

function P.Page(d)
  if reading then return end
  pageNo = pageNo + d
  P.Render()
end

function P.Open(id)
  reading, replying = id, false
  ns.Letters.Read(id)
  P.Render()
  panel.scroll:SetVerticalScroll(0)
end

---------------------------------------------------------------------------
-- The tab
---------------------------------------------------------------------------
local function setTitle(text)
  local mail = _G.MailFrame
  if mail.SetTitle then mail:SetTitle(text)
  elseif _G.MailFrameTitleText then _G.MailFrameTitleText:SetText(text)
  elseif mail.TitleText then mail.TitleText:SetText(text) end
end

function P.UpdateTab()
  if not tab then return end
  local n = ns.char and ns.Letters.Enabled() and ns.Letters.Unread() or 0
  tab:SetText(n > 0 and ("%s (%d)"):format(L.LETTERS_TITLE, n) or L.LETTERS_TITLE)
  if PanelTemplates_TabResize then pcall(PanelTemplates_TabResize, tab, 0) end
  tab:SetShown(ns.Letters.Enabled())
end

-- Show the Letters tab (the game's own tabs hide it again through the hook below).
function P.Select()
  if not tab then return end
  if not panel then create() end
  pcall(copyPaper)
  if PanelTemplates_SetTab then PanelTemplates_SetTab(_G.MailFrame, tabID) end
  if _G.InboxFrame then _G.InboxFrame:Hide() end
  if _G.SendMailFrame then _G.SendMailFrame:Hide() end
  if SetSendMailShowing then pcall(SetSendMailShowing, false) end
  if _G.OpenMailFrame and _G.OpenMailFrame:IsShown() and HideUIPanel then pcall(HideUIPanel, _G.OpenMailFrame) end
  setTitle(L.LETTERS_TITLE)
  region()
  reading, pageNo = nil, 1
  panel:Show()
  P.Render()
  if C.PlaySound then C.PlaySound("IG_CHARACTER_INFO_TAB") end
end

local function makeTab()
  local mail = _G.MailFrame
  local prev = _G.MailFrameTab2
  if not mail or not prev or tab then return end
  tabID = 3
  while _G["MailFrameTab" .. tabID] do tabID = tabID + 1 end
  local before = _G["MailFrameTab" .. (tabID - 1)]
  for _, tpl in ipairs({ "FriendsFrameTabTemplate", "CharacterFrameTabButtonTemplate", "PanelTabButtonTemplate" }) do
    local ok, b = pcall(CreateFrame, "Button", "MailFrameTab" .. tabID, mail, tpl)
    if ok and b then tab = b; break end
  end
  if not tab then return end
  tab:SetID(tabID)
  -- Same spacing as the game's own second tab.
  local _, rel, _, x, y = prev:GetPoint(1)
  if rel ~= _G.MailFrameTab1 then x, y = -8, 0 end
  tab:SetPoint("LEFT", before, "RIGHT", x or -8, y or 0)
  tab:SetScript("OnClick", P.Select)
  if PanelTemplates_SetNumTabs then PanelTemplates_SetNumTabs(mail, tabID) end
  if PanelTemplates_DeselectTab then PanelTemplates_DeselectTab(tab) end
  P.UpdateTab()
  -- The game's Inbox/Send Mail tabs (and opening the mailbox) take the window back.
  if MailFrameTab_OnClick then
    hooksecurefunc("MailFrameTab_OnClick", function() if panel then panel:Hide() end end)
  end
  mail:HookScript("OnHide", function() if panel then panel:Hide() end reading = nil end)
end

---------------------------------------------------------------------------
-- Moving the mail window: drag it, and it opens there next time.
---------------------------------------------------------------------------
local function placeMail()
  local mail = _G.MailFrame
  local pos = ns.db and ns.db.settings.pos and ns.db.settings.pos.mail
  if not (mail and mail:IsShown() and pos and pos[1]) or C.InCombat() then return end
  mail:ClearAllPoints()
  mail:SetPoint(pos[1], UIParent, pos[2], pos[3], pos[4])
end

function P.SaveMail()
  local mail = _G.MailFrame
  mail:StopMovingOrSizing()
  mail:SetUserPlaced(false)   -- we keep the spot ourselves; the game's layout cache stays out of it
  local point, _, relPoint, x, y = mail:GetPoint()
  ns.db.settings.pos = ns.db.settings.pos or {}
  ns.db.settings.pos.mail = { point, relPoint, x, y }
end

local function makeMovable()
  local mail = _G.MailFrame
  if not mail then return end
  mail:SetMovable(true)
  mail:SetClampedToScreen(true)
  mail:EnableMouse(true)
  mail:RegisterForDrag("LeftButton")
  mail:HookScript("OnDragStart", function(self) if not C.InCombat() then self:StartMoving() end end)
  mail:HookScript("OnDragStop", P.SaveMail)
  -- The game lays out its side panels whenever one opens; put the mail window back after.
  if UpdateUIPanelPositions then hooksecurefunc("UpdateUIPanelPositions", placeMail) end
  mail:HookScript("OnShow", function() C.After(0, placeMail) end)
end

-- /rpgd letters
function P.Toggle()
  local mail = _G.MailFrame
  if not (mail and mail:IsShown()) then ns.Print(L.LETTERS_NEED_MAILBOX); return end
  if panel and panel:IsShown() and MailFrameTab_OnClick then MailFrameTab_OnClick(nil, 1) else P.Select() end
end

function P.Refresh() ns.Guard("letters tab", P.Render) end

ns.OnLogin(function()
  ns.Guard("letters tab", makeTab)
  ns.Guard("mail mover", makeMovable)
end)
ns.On("MAIL_SHOW", function()
  ns.Letters.Tick()
  ns.Guard("letters tab", P.UpdateTab)
end)
ns.Listen("LETTERS_CHANGED", P.Refresh)
