-- The conversation box: portrait, name, typewriter text, up to 4 replies, then the game's
-- own options for this NPC (quests, vendor, training...), "Get on with it" (always), and a
-- flag button for wrong lines. Keys: 1-9 and 0 pick, Up/Down/Tab move a selection, Enter takes it, Space finishes the text,
-- Escape = Get on with it. Gamepad (client gamepad mode): D-pad moves, A confirms,
-- B = Get on with it, X = Ask about. Nothing relies on color alone: the selection also
-- shows a ">" marker, and locked options say so in words.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local UI = ns.UI
local Theme = UI.Theme

local D = {}
UI.Dialogue = D

local PAD, PORTRAIT, WIDTH = 20, 92, 600
local MAX_BUTTONS = 10

local frame
local view
local reveal = { full = "", shown = 0, active = false, total = 0 }
local autoTimer
local selected, navMode = nil, false

---------------------------------------------------------------------------
-- Typewriter (substring reveal, UTF-8 safe)
---------------------------------------------------------------------------
-- Byte index of the end of the n-th UTF-8 character.
local function utf8Cut(s, n)
  local i, count = 1, 0
  local len = #s
  while i <= len and count < n do
    local b = s:byte(i)
    local size = (b >= 240 and 4) or (b >= 224 and 3) or (b >= 192 and 2) or 1
    i = i + size
    count = count + 1
  end
  return i - 1
end
D.utf8Cut = utf8Cut

local function utf8Len(s)
  local _, n = s:gsub("[^\128-\191]", "")
  return n
end

local function settings() return ns.db.settings end

local function instant()
  local s = settings()
  return s.instantText or s.reduceMotion
end

local function finishReveal()
  reveal.active = false
  frame.text:SetText(reveal.full)
  frame:SetScript("OnUpdate", nil)
  D.StartAutoAdvance()
end

local function onUpdate(_, elapsed)
  if not reveal.active then return end
  reveal.shown = reveal.shown + elapsed * (settings().textSpeed or 70)
  local n = math.floor(reveal.shown)
  if n >= reveal.total then finishReveal(); return end
  frame.text:SetText(reveal.full:sub(1, utf8Cut(reveal.full, n)))
end

function D.IsRevealing() return reveal.active end
function D.FinishText() if reveal.active then finishReveal() end end

---------------------------------------------------------------------------
-- Construction
---------------------------------------------------------------------------
local function makeButton(i)
  local b = CreateFrame("Button", nil, frame)
  b:SetHeight(20)
  b.label = b:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  b.label:SetPoint("TOPLEFT", 4, -3)
  b.label:SetJustifyH("LEFT")
  b.label:SetWordWrap(true)
  -- Hover (and keyboard selection): a soft band with an accent stripe on the left.
  b.hl = b:CreateTexture(nil, "HIGHLIGHT")
  b.hl:SetAllPoints()
  b.stripe = b:CreateTexture(nil, "HIGHLIGHT", nil, 1)
  b.stripe:SetPoint("TOPLEFT")
  b.stripe:SetPoint("BOTTOMLEFT")
  b.stripe:SetWidth(3)
  b.marker = b:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  b.marker:SetPoint("RIGHT", b, "LEFT", -2, 0)
  b.marker:SetText(">")
  b.marker:Hide()
  b:SetScript("OnClick", function() D.Click(i) end)
  b:SetScript("OnEnter", function(self) Theme.TextColor(self.label, self.locked and "locked" or "hover") end)
  b:SetScript("OnLeave", function(self) Theme.TextColor(self.label, D.ColorKey(self)) end)
  return b
end

-- Replies in ink, locked ones faded, "Get on with it" quieter than the rest.
function D.ColorKey(b)
  if b.locked then return "locked" end
  if b.isGetOn then return "dim" end
  return "choice"
end

local function create()
  frame = CreateFrame("Frame", nil, UIParent)
  frame:SetSize(WIDTH, 260)
  frame:SetFrameStrata("DIALOG")
  frame:SetToplevel(true)
  frame:SetClampedToScreen(true)
  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:RegisterForDrag("LeftButton")
  frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
  frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing(); D.SavePosition() end)
  frame:Hide()
  Theme.Decorate(frame, 7)
  -- A short fade-in when the box opens (off with reduce motion).
  frame.fadeIn = frame:CreateAnimationGroup()
  local fade = frame.fadeIn and frame.fadeIn:CreateAnimation("Alpha")
  if fade then
    fade:SetFromAlpha(0)
    fade:SetToAlpha(1)
    fade:SetDuration(0.15)
  end

  -- Portrait in a wood frame with a brass hairline.
  frame.portraitBg = frame:CreateTexture(nil, "ARTWORK")
  frame.portraitBg:SetSize(PORTRAIT + 8, PORTRAIT + 8)
  frame.portraitBg:SetPoint("TOPLEFT", PAD - 4, -PAD + 4)
  frame.portraitTrim = frame:CreateTexture(nil, "ARTWORK", nil, 1)
  frame.portraitTrim:SetSize(PORTRAIT + 2, PORTRAIT + 2)
  frame.portraitTrim:SetPoint("TOPLEFT", PAD - 1, -PAD + 1)
  frame.portraitInner = frame:CreateTexture(nil, "ARTWORK", nil, 2)
  frame.portraitInner:SetSize(PORTRAIT, PORTRAIT)
  frame.portraitInner:SetPoint("TOPLEFT", PAD, -PAD)
  frame.model = CreateFrame("PlayerModel", nil, frame)
  frame.model:SetSize(PORTRAIT, PORTRAIT)
  frame.model:SetPoint("TOPLEFT", PAD, -PAD)

  local textLeft = PAD + PORTRAIT + 14
  local textWidth = WIDTH - textLeft - PAD - 22
  frame.name = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.name:SetPoint("TOPLEFT", textLeft, -PAD + 2)
  frame.name:SetJustifyH("LEFT")
  frame.subtitle = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.subtitle:SetPoint("TOPLEFT", frame.name, "BOTTOMLEFT", 0, -2)
  frame.subtitle:SetJustifyH("LEFT")

  -- A rule under the name, and another above the replies (placed in D.Layout).
  frame.rule = Theme.Divider(frame)
  frame.rule:SetPoint("TOPLEFT", frame.subtitle, "BOTTOMLEFT", 0, -6)
  frame.rule:SetPoint("RIGHT", frame, "RIGHT", -PAD - 46, 0)
  frame.replyRule = Theme.Divider(frame)

  frame.text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.text:SetPoint("TOPLEFT", frame.subtitle, "BOTTOMLEFT", 0, -14)
  frame.text:SetWidth(textWidth)
  frame.text:SetJustifyH("LEFT")
  frame.text:SetJustifyV("TOP")
  frame.text:SetWordWrap(true)

  frame.reaction = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.reaction:SetPoint("TOPLEFT", frame.text, "BOTTOMLEFT", 0, -8)
  frame.reaction:SetWidth(textWidth)
  frame.reaction:SetJustifyH("LEFT")
  frame.reaction:SetWordWrap(true)

  -- Clicking the text finishes the typewriter.
  frame.textClick = CreateFrame("Button", nil, frame)
  frame.textClick:SetPoint("TOPLEFT", frame.text, "TOPLEFT")
  frame.textClick:SetPoint("BOTTOMRIGHT", frame.text, "BOTTOMRIGHT")
  frame.textClick:SetScript("OnClick", D.FinishText)

  frame.buttons = {}
  for i = 1, MAX_BUTTONS do frame.buttons[i] = makeButton(i) end

  frame.close = Theme.Button(frame, "x", 20, 20)
  frame.close:SetPoint("TOPRIGHT", -12, -12)
  frame.close:SetScript("OnClick", function() ns.Conversation.Business() end)
  frame.close:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(L.GET_ON_WITH_IT)
    GameTooltip:Show()
  end)
  frame.close:SetScript("OnLeave", function() GameTooltip:Hide() end)

  -- "This line is wrong"
  frame.flag = CreateFrame("Button", nil, frame)
  frame.flag:SetSize(16, 16)
  frame.flag:SetPoint("TOPRIGHT", -38, -14)
  frame.flag:SetAlpha(0.55)
  frame.flag.icon = frame.flag:CreateTexture(nil, "ARTWORK")
  frame.flag.icon:SetAllPoints()
  frame.flag.icon:SetTexture("Interface\\Icons\\INV_Misc_Note_01")
  frame.flag:SetScript("OnClick", function() D.ToggleFlagBox() end)
  frame.flag:SetScript("OnEnter", function(self)
    self:SetAlpha(1)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(L.FLAG_TIP)
    GameTooltip:AddLine(L.FLAG_TIP2, 1, 1, 1, true)
    GameTooltip:Show()
  end)
  frame.flag:SetScript("OnLeave", function(self) self:SetAlpha(0.55); GameTooltip:Hide() end)

  -- "Ask about..."
  frame.ask = Theme.Button(frame, L.ASK_BUTTON, 116, 22)
  frame.ask:SetPoint("BOTTOMRIGHT", -16, 14)
  frame.ask:SetScript("OnClick", function() UI.AskAbout.Toggle(frame) end)
  frame.ask:Hide()

  frame.flagBox = CreateFrame("EditBox", nil, frame, C.Template("editbox"))
  frame.flagBox:SetSize(WIDTH - 2 * PAD - 120, 20)
  frame.flagBox:SetPoint("BOTTOMLEFT", PAD + 6, 10)
  frame.flagBox:SetAutoFocus(false)
  frame.flagBox:SetMaxLetters(140)
  frame.flagBox:Hide()
  frame.flagBox:SetScript("OnEnterPressed", function(self)
    ns.Conversation.Flag(self:GetText())
    self:SetText("")
    self:ClearFocus()
    self:Hide()
    D.Layout()
  end)
  frame.flagBox:SetScript("OnEscapePressed", function(self) self:ClearFocus(); self:Hide(); D.Layout() end)
  frame.flagHint = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.flagHint:SetPoint("LEFT", frame.flagBox, "RIGHT", 8, 0)

  frame:EnableKeyboard(true)
  frame:SetPropagateKeyboardInput(true)
  frame:SetScript("OnKeyDown", function(self, key) D.OnKey(self, key) end)
  C.SetGamePadHandler(frame, function(self, button) D.OnPad(self, button) end)
  frame:SetScript("OnHide", function()
    reveal.active = false
    frame:SetScript("OnUpdate", nil)
    if autoTimer then autoTimer.cancelled = true end
    C.GamePadButtons(frame, false)
  end)
end

---------------------------------------------------------------------------
-- Styling, layout, position
---------------------------------------------------------------------------
function D.Style()
  if not frame then return end
  local size = Theme.TextSize()
  Theme.Recolor(frame)
  local p = Theme.Palette()
  frame.portraitBg:SetColorTexture(p.wood[1], p.wood[2], p.wood[3], 1)
  frame.portraitTrim:SetColorTexture(p.trim[1], p.trim[2], p.trim[3], 1)
  frame.portraitInner:SetColorTexture(p.wood[1] * 0.6, p.wood[2] * 0.6, p.wood[3] * 0.6, 1)
  Theme.ColorDivider(frame.rule)
  Theme.ColorDivider(frame.replyRule)
  Theme.StyleButton(frame.ask)
  Theme.StyleButton(frame.close, 12)
  Theme.SetFont(frame.name, "name", size + 6)
  Theme.SetFont(frame.subtitle, "body", size - 2)
  Theme.SetFont(frame.text, "body", size)
  Theme.SetFont(frame.reaction, "body", size - 1)
  Theme.SetFont(frame.flagHint, "body", size - 3)
  frame.text:SetSpacing(settings().lineSpacing or 3)
  frame.reaction:SetSpacing(settings().lineSpacing or 3)
  Theme.TextColor(frame.name, "name")
  Theme.TextColor(frame.subtitle, "subtitle")
  Theme.TextColor(frame.text, "text")
  Theme.TextColor(frame.reaction, "reaction")
  Theme.TextColor(frame.flagHint, "dim")
  for _, b in ipairs(frame.buttons) do
    Theme.SetFont(b.label, "body", size)
    Theme.SetFont(b.marker, "name", size)
    Theme.TextColor(b.marker, "name")
    b.label:SetSpacing(2)
    b.hl:SetColorTexture(p.highlight[1], p.highlight[2], p.highlight[3], p.highlight[4])
    b.stripe:SetColorTexture(p.accent[1], p.accent[2], p.accent[3], p.accent[4])
    Theme.TextColor(b.label, D.ColorKey(b))
  end
  frame:SetScale(settings().scale or 1)
end

function D.Layout()
  if not frame then return end
  local textWidth = WIDTH - (PAD + PORTRAIT + 14) - PAD - 22
  -- Measure with the full text so the window doesn't grow while typing.
  local current = frame.text:GetText()
  frame.text:SetText(reveal.full)
  local h = (frame.name:GetStringHeight() or 20) + (frame.subtitle:GetStringHeight() or 0) + 12
    + (frame.text:GetStringHeight() or 14)
  frame.text:SetText(current)
  if frame.reaction:IsShown() then h = h + 8 + (frame.reaction:GetStringHeight() or 14) end
  local top = math.max(PORTRAIT, h)
  local y = -(PAD + top + 16)
  frame.replyRule:ClearAllPoints()
  frame.replyRule:SetPoint("TOPLEFT", PAD, y)
  frame.replyRule:SetPoint("TOPRIGHT", -PAD, y)
  y = y - 8
  for _, b in ipairs(frame.buttons) do
    if b:IsShown() then
      if b.gap then y = y - 8 end   -- a little space before the game's own options
      b:ClearAllPoints()
      b:SetPoint("TOPLEFT", PAD, y)
      b:SetWidth(WIDTH - 2 * PAD)
      b.label:SetWidth(WIDTH - 2 * PAD - 8)
      local bh = (b.label:GetStringHeight() or 14) + 6
      b:SetHeight(bh)
      y = y - bh - 2
    end
  end
  if frame.flagBox:IsShown() or frame.ask:IsShown() then y = y - 36 end
  frame:SetHeight(-y + PAD - 4)
  frame.text:SetWidth(textWidth)
end

function D.SavePosition()
  local point, _, relPoint, x, y = frame:GetPoint()
  settings().pos.dialogue = { point, relPoint, x, y }
end

local function place(anchor)
  frame:ClearAllPoints()
  local pos = settings().pos.dialogue
  if pos and pos[1] then
    frame:SetPoint(pos[1], UIParent, pos[2], pos[3], pos[4])
  elseif anchor then
    frame:SetPoint("TOPLEFT", anchor, "TOPLEFT", 0, 0)
  else
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 120)
  end
end

---------------------------------------------------------------------------
-- Public
---------------------------------------------------------------------------
-- v: { name, subtitle, unit, text, choices = { { text, locked } }, lineGid }
function D.Show(v)
  if not frame then create(); D.Style() end
  view = v
  frame.name:SetText(v.name or "")
  frame.subtitle:SetText(v.subtitle and ("<" .. v.subtitle .. ">") or "")
  frame.reaction:SetText("")
  frame.reaction:Hide()
  if v.unit and frame.model.SetUnit then
    frame.model:ClearModel()
    frame.model:SetUnit(v.unit)
    if frame.model.SetPortraitZoom then frame.model:SetPortraitZoom(1) end
  end

  D.RenderChoices(v.choices)
  C.GamePadButtons(frame, settings().gamepad ~= false and C.GamePadEnabled())

  frame.flagHint:SetText("")
  frame.ask:SetShown(v.canAsk == true)
  D.Style()
  reveal.full = v.text or ""
  reveal.total = utf8Len(reveal.full)
  reveal.shown = 0
  D.Layout()
  local opening = not frame:IsShown()
  if opening then place(ns.Conversation.session and ns.Conversation.session.blizz) end
  frame:Show()
  if opening and frame.fadeIn and not settings().reduceMotion then frame.fadeIn:Play() end
  if instant() then
    finishReveal()
  else
    reveal.active = true
    frame.text:SetText("")
    frame:SetScript("OnUpdate", onUpdate)
  end
  if settings().sounds then C.PlaySound("IG_QUEST_LIST_OPEN") end
end

function D.RenderChoices(choices)
  local n = 0
  for i, c in ipairs(choices or {}) do
    if i > MAX_BUTTONS - 1 then break end
    local b = frame.buttons[i]
    b.locked = c.locked
    b.gap = c.gap
    local num = c.locked and ((i % 10) .. ". ") or (Theme.Hex("number") .. (i % 10) .. ".|r ")
    b.label:SetText(num .. (c.locked and (L.LOCKED_MARK .. " ") or "") .. c.text)
    b:Show()
    n = i
  end
  local getOn = frame.buttons[n + 1]
  getOn.locked = false
  getOn.gap = n > 0
  getOn.label:SetText(((n + 1) % 10) .. ". " .. L.GET_ON_WITH_IT)
  getOn:Show()
  for i = 1, MAX_BUTTONS do
    frame.buttons[i].isGetOn = (i == n + 1)
    if i > n + 1 then frame.buttons[i]:Hide() end
  end
  -- Keyboard and gamepad users keep a selection from one node to the next.
  D.Select(nil)
  if navMode then D.Move(1) end
end

---------------------------------------------------------------------------
-- Keyboard / gamepad selection
---------------------------------------------------------------------------
function D.Select(i)
  for j, b in ipairs(frame.buttons) do
    local on = (j == i)
    if on then b:LockHighlight() else b:UnlockHighlight() end
    b.marker:SetShown(on)
  end
  selected = i
end

function D.Selected() return selected end

function D.Move(delta)
  local list = {}
  for i, b in ipairs(frame.buttons) do
    if b:IsShown() and not b.locked then list[#list + 1] = i end
  end
  if #list == 0 then return end
  navMode = true
  local pos = 0
  for k, i in ipairs(list) do if i == selected then pos = k end end
  if pos == 0 then
    pos = delta > 0 and 1 or #list
  else
    pos = (pos - 1 + delta) % #list + 1
  end
  D.Select(list[pos])
end

-- Enter / A: finish the text if it's still typing, else take the selected reply.
function D.Confirm()
  if reveal.active then finishReveal(); return true end
  if selected then D.Click(selected); return true end
  return false
end

-- Replace the choices in place (after an errand step).
function D.SetChoices(choices)
  if not frame or not frame:IsShown() then return end
  if view then view.choices = choices end
  D.RenderChoices(choices)
  D.Style()
  D.Layout()
end

-- An answer from "Ask about...": replaces the main text, keeps the choices.
function D.ShowAnswer(text, topicName)
  if not frame or not frame:IsShown() then return end
  frame.reaction:SetText("")
  frame.reaction:Hide()
  reveal.full = text or ""
  reveal.total = utf8Len(reveal.full)
  reveal.shown = 0
  if topicName then frame.subtitle:SetText("<" .. topicName .. ">") end
  D.Layout()
  if instant() then
    finishReveal()
  else
    reveal.active = true
    frame.text:SetText("")
    frame:SetScript("OnUpdate", onUpdate)
  end
end

function D.ShowReaction(text)
  if not frame or not frame:IsShown() then return end
  frame.reaction:SetText(text)
  frame.reaction:Show()
  D.Layout()
end

function D.Hide()
  if frame and frame:IsShown() then
    frame:Hide()
    if settings().sounds then C.PlaySound("IG_QUEST_LIST_CLOSE") end
  end
end

function D.IsShown() return frame ~= nil and frame:IsShown() end

function D.Click(i)
  local b = frame.buttons[i]
  if not b or not b:IsShown() then return end
  if autoTimer then autoTimer.cancelled = true end
  if b.isGetOn then
    ns.Conversation.Business()
  elseif not b.locked then
    D.FinishText()
    ns.Conversation.Choose(i)
  end
end

function D.ToggleFlagBox()
  if frame.flagBox:IsShown() then
    frame.flagBox:Hide()
  else
    frame.flagBox:Show()
    frame.flagBox:SetFocus()
    frame.flagHint:SetText(L.FLAG_HINT)
  end
  D.Layout()
end

function D.FlagSaved()
  if frame then frame.flagHint:SetText(L.FLAG_SAVED) end
end

-- Auto-advance: when the only real option is one choice, take it after a delay.
function D.StartAutoAdvance()
  if not settings().autoAdvance or not view then return end
  if #(view.choices or {}) ~= 1 or view.choices[1].locked then return end
  local token = { cancelled = false }
  autoTimer = token
  C.After(settings().autoDelay or 4, function()
    if not token.cancelled and frame:IsShown() and view and #view.choices == 1 then D.Click(1) end
  end)
end

function D.OnKey(self, key)
  if C.InCombat() then return end
  local handled = false
  local ask = UI.AskAbout
  if ask.IsShown() and (key == "UP" or key == "DOWN" or key == "ENTER" or key == "NUMPADENTER") then
    handled = true
    if key == "UP" then ask.Move(-1) elseif key == "DOWN" then ask.Move(1) else ask.Confirm() end
  elseif key == "ESCAPE" then
    handled = true
    if ask.IsShown() then ask.Hide() else ns.Conversation.Business() end
  elseif key == "SPACE" then
    if reveal.active then handled = true; finishReveal() end
  elseif key == "UP" or (key == "TAB" and C.ShiftDown()) then
    handled = true
    D.Move(-1)
  elseif key == "DOWN" or key == "TAB" then
    handled = true
    D.Move(1)
  elseif key == "ENTER" or key == "NUMPADENTER" then
    handled = D.Confirm()
  else
    local n = tonumber(key) or tonumber(key:match("^NUMPAD(%d)$") or "")
    if n == 0 then n = 10 end
    if n and frame.buttons[n] and frame.buttons[n]:IsShown() then
      handled = true
      D.Click(n)
    end
  end
  self:SetPropagateKeyboardInput(not handled)
end

function D.OnPad(_, button)
  if C.InCombat() then return end
  local ask = UI.AskAbout
  if ask.IsShown() then
    if button == "PADDUP" then ask.Move(-1)
    elseif button == "PADDDOWN" then ask.Move(1)
    elseif button == "PAD1" then ask.Confirm()
    elseif button == "PAD2" or button == "PAD3" then ask.Hide()
    end
    return
  end
  if button == "PADDUP" then
    D.Move(-1)
  elseif button == "PADDDOWN" then
    D.Move(1)
  elseif button == "PAD1" then
    if not D.Confirm() then D.Move(1) end
  elseif button == "PAD2" then
    ns.Conversation.Business()
  elseif button == "PAD3" and frame.ask:IsShown() then
    ask.Toggle(frame)
  end
end

function D.Frame() return frame end
