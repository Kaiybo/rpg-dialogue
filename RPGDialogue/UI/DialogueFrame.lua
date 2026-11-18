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

local PAD, PORTRAIT = 20, 92
-- The game look has the game's gossip window's measurements (GossipFrame.xml): 338 by 496
-- (taller only if the conversation needs it), greeting text at 18, -75 and 270 wide, a
-- 15-pixel space, then the options, each 300 wide with a 16-pixel icon and the text at 20.
-- The wood look is a wide box with the portrait beside the text.
local WOOD_WIDTH, GAME_WIDTH, GAME_HEIGHT = 600, 338, 496
local GAME_HEADER, GAME_BAR = 60, 26
local GAME_TEXT_X, GAME_TEXT_Y, GAME_TEXT_W = 18, -75, 270
local GAME_ROW_X, GAME_ROW_W, GAME_ROW_TEXT, GAME_SPACER = 8, 300, 20, 15
local MAX_BUTTONS = 10

-- Icons the game's gossip window uses: a speech bubble for talking, a bullet otherwise.
local ICON_TALK = { file = "Interface\\GossipFrame\\GossipGossipIcon" }
local ICON_BULLET = { file = "Interface\\QuestFrame\\UI-Quest-BulletPoint" }
local PORTRAIT_FALLBACK = "Interface\\Icons\\INV_Misc_QuestionMark"

local frame
local view
-- full: plain text typed out letter by letter; linked: the same text with topic words as
-- links (Topics.Hear), shown once typing finishes so a half-typed link never shows.
local reveal = { full = "", linked = nil, shown = 0, active = false, total = 0 }
local autoTimer
local selected, navMode = nil, false

---------------------------------------------------------------------------
-- Typewriter (substring reveal, UTF-8 safe)
---------------------------------------------------------------------------
-- Where the typewriter may cut: the byte end of each visible character. Escape codes
-- (|T icons|t, |A atlases|a, |c colours, |r, |H links|h) are never cut in half, so the raw
-- code never flashes on screen; an icon counts as one character, colour codes as none.
local function cutPoints(s)
  local cuts, i, len = {}, 1, #s
  while i <= len do
    local b = s:byte(i)
    if b == 124 then -- "|"
      local c = s:sub(i + 1, i + 1)
      local stop
      if c == "T" then stop = s:find("|t", i + 2, true); stop = stop and stop + 1
      elseif c == "A" then stop = s:find("|a", i + 2, true); stop = stop and stop + 1
      elseif c == "c" then stop = i + 9
      elseif c == "H" then stop = s:find("|h", i + 2, true); stop = stop and stop + 1
      elseif c == "r" or c == "h" or c == "n" or c == "|" then stop = i + 1 end
      if stop then
        local visible = c == "T" or c == "A" or c == "n" or c == "|"
        if visible or #cuts == 0 then cuts[#cuts + 1] = math.min(stop, len)
        else cuts[#cuts] = math.min(stop, len) end
        i = stop + 1
      else
        cuts[#cuts + 1] = i; i = i + 1
      end
    else
      local size = (b >= 240 and 4) or (b >= 224 and 3) or (b >= 192 and 2) or 1
      i = i + size
      cuts[#cuts + 1] = i - 1
    end
  end
  return cuts
end
D.CutPoints = cutPoints

-- Byte index of the end of the n-th visible character.
local function utf8Cut(s, n)
  if n <= 0 then return 0 end
  local cuts = cutPoints(s)
  return cuts[math.min(n, #cuts)] or 0
end
D.utf8Cut = utf8Cut

local function utf8Len(s) return #cutPoints(s) end

local function settings() return ns.db.settings end

local PERSUADE_ACTIONS = { "admire", "taunt", "intimidate" }
local PERSUADE_ICONS = {
  admire = "Interface\\Icons\\Spell_Holy_Heal",
  taunt = "Interface\\Icons\\Spell_Nature_Reincarnation",
  intimidate = "Interface\\Icons\\Ability_GolemThunderClap",
}
local function isGame() return Theme.IsGame() end
-- "Large dialogue box" (0.82.0): a wider, taller box with bigger text, easier to read.
local LARGE_EXTRA_W, LARGE_GAME_EXTRA_W, LARGE_EXTRA_H, LARGE_TEXT = 220, 150, 110, 3
local function large() return settings().largeBox and true or false end
local function woodWidth() return WOOD_WIDTH + (large() and LARGE_EXTRA_W or 0) end
local function gameExtra() return large() and LARGE_GAME_EXTRA_W or 0 end
local function gameHeight() return GAME_HEIGHT + (large() and LARGE_EXTRA_H or 0) end
local function width() return isGame() and (GAME_WIDTH + gameExtra()) or woodWidth() end

local function instant()
  local s = settings()
  return s.instantText or s.reduceMotion
end

local function finishReveal()
  reveal.active = false
  frame.text:SetText(reveal.linked or reveal.full)
  frame:SetScript("OnUpdate", nil)
  -- The click-to-finish cover is only needed while typing; off, so links can be clicked.
  if frame.textClick then frame.textClick:Hide() end
  D.StartAutoAdvance()
end

local function startReveal()
  if frame.textClick then frame.textClick:Show() end
  reveal.active = true
  frame.text:SetText("")
  frame:SetScript("OnUpdate", D.OnUpdate)
end

-- A topic word in the text was clicked: ask about it. Hovering shows what a click does.
local function onLink(_, link)
  local id = ns.Topics and ns.Topics.FromLink(link)
  if id and ns.Conversation then ns.Conversation.Ask(id) end
end
local function onLinkEnter(_, link)
  -- An item on a quest page: the game's item tooltip.
  local kind, index, itemID
  if type(link) == "string" then kind, index, itemID = link:match("^rpgdq:(%a+):(%d+):?(%d*)") end
  if kind then C.ShowQuestItemTooltip(frame, kind, tonumber(index), tonumber(itemID)); return end
  local id = ns.Topics and ns.Topics.FromLink(link)
  local def = id and ns.Data.topics[id]
  if not def then return end
  C.ShowTextTooltip(frame, L.ASK_LINK_TOOLTIP:format(def.name))
end
local function onLinkLeave() C.HideTooltip() end

function D.OnUpdate(_, elapsed)
  if not reveal.active then return end
  reveal.shown = reveal.shown + elapsed * (settings().textSpeed or 70)
  local n = math.floor(reveal.shown)
  if n >= reveal.total then finishReveal(); return end
  reveal.cuts = reveal.cuts or cutPoints(reveal.full)
  frame.text:SetText(reveal.full:sub(1, reveal.cuts[n] or 0))
end

function D.IsRevealing() return reveal.active end
function D.FinishText() if reveal.active then finishReveal() end end

---------------------------------------------------------------------------
-- Construction
---------------------------------------------------------------------------
local function makeButton(i)
  local b = CreateFrame("Button", nil, frame)
  b:SetHeight(20)
  b.icon = b:CreateTexture(nil, "ARTWORK")
  b.icon:SetSize(16, 16)
  b.icon:SetPoint("TOPLEFT", 3, -2)
  b.icon:Hide()
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
  b:SetScript("OnEnter", function(self)
    -- Once the keys are in use, the mouse moves the same selection (one marker, not two).
    if navMode and not self.locked and selected ~= i then D.Select(i) end
    Theme.TextColor(self.label, self.locked and "locked" or "hover")
    -- A reward on a quest page: the game's item tooltip.
    if self.tooltip then C.ShowQuestItemTooltip(self, self.tooltip.kind, self.tooltip.index, self.tooltip.itemID) end
  end)
  b:SetScript("OnLeave", function(self)
    Theme.TextColor(self.label, D.ColorKey(self))
    if self.tooltip then GameTooltip:Hide() end
  end)
  return b
end

-- Replies in ink, locked ones faded, "Get on with it" quieter than the rest.
function D.ColorKey(b)
  if b.locked then return "locked" end
  if b.isGetOn then return "dim" end
  return "choice"
end

local function create()
  frame = CreateFrame("Frame", nil, Theme.Parent())
  frame:SetSize(width(), 260)
  frame:SetFrameStrata(Theme.Strata())
  frame:SetToplevel(true)
  frame:SetClampedToScreen(true)
  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:RegisterForDrag("LeftButton")
  frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
  frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing(); D.SavePosition() end)
  frame:Hide()
  Theme.Decorate(frame, 7, { portrait = true })
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

  -- Name and subtitle: beside the portrait (wood), or in the title bar and the header
  -- (game). Placed in D.Style. The name draws above the frame's metal title bar.
  frame.name = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.name:SetDrawLayer("OVERLAY", 7)
  frame.subtitle = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.subtitle:SetDrawLayer("OVERLAY", 7)

  -- A rule under the name, and another above the replies (wood look; placed in D.Style
  -- and D.Layout).
  frame.rule = Theme.Divider(frame)
  frame.replyRule = Theme.Divider(frame)

  -- What you just said, quiet, above their answer (0.61.0).
  frame.said = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.said:SetJustifyH("LEFT")
  frame.said:SetJustifyV("TOP")
  frame.said:SetWordWrap(true)
  frame.said:Hide()

  frame.text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.text:SetJustifyH("LEFT")
  frame.text:SetJustifyV("TOP")
  frame.text:SetWordWrap(true)

  frame.reaction = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.reaction:SetPoint("TOPLEFT", frame.text, "BOTTOMLEFT", 0, -8)
  frame.reaction:SetJustifyH("LEFT")
  frame.reaction:SetWordWrap(true)

  -- Clicking the text finishes the typewriter.
  frame.textClick = CreateFrame("Button", nil, frame)
  frame.textClick:SetPoint("TOPLEFT", frame.text, "TOPLEFT")
  frame.textClick:SetPoint("BOTTOMRIGHT", frame.text, "BOTTOMRIGHT")
  frame.textClick:SetScript("OnClick", D.FinishText)

  -- Topic words in the text are links (Topics.Hear): click to ask about them.
  C.EnableHyperlinks(frame, onLink, onLinkEnter, onLinkLeave)

  frame.buttons = {}
  for i = 1, MAX_BUTTONS do frame.buttons[i] = makeButton(i) end

  frame.close = Theme.CloseButton(frame)
  frame.close:SetScript("OnClick", function() ns.Conversation.Close() end)
  frame.close:HookScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(L.CLOSE)
    GameTooltip:Show()
  end)
  frame.close:HookScript("OnLeave", function() GameTooltip:Hide() end)

  -- "This line is wrong"
  frame.flag = CreateFrame("Button", nil, frame)
  frame.flag:SetSize(16, 16)
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

  -- This visit so far: what they said and what you said, on hover (0.61.0).
  -- Click it for the journal (0.62.0).
  frame.history = CreateFrame("Button", nil, frame)
  frame.history:SetSize(16, 16)
  frame.history:SetAlpha(0.55)
  frame.history.icon = frame.history:CreateTexture(nil, "ARTWORK")
  frame.history.icon:SetAllPoints()
  frame.history.icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
  frame.history:SetScript("OnEnter", function(self)
    self:SetAlpha(1)
    D.HistoryTooltip(self)
  end)
  frame.history:SetScript("OnClick", function() if ns.Journal and ns.Journal.Toggle then ns.Journal.Toggle() end end)
  frame.history:SetScript("OnLeave", function(self) self:SetAlpha(0.55); GameTooltip:Hide() end)

  -- "Aa": text size, line spacing and fonts, changed live (UI/TextOptions.lua).
  frame.textBtn = CreateFrame("Button", nil, frame)
  frame.textBtn:SetSize(20, 16)
  frame.textBtn.label = frame.textBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.textBtn.label:SetPoint("CENTER")
  frame.textBtn.label:SetText("Aa")
  frame.textBtn.hl = frame.textBtn:CreateTexture(nil, "HIGHLIGHT")
  frame.textBtn.hl:SetAllPoints()
  frame.textBtn.hl:SetColorTexture(1, 1, 1, 0.15)
  frame.textBtn:SetScript("OnClick", function() UI.TextOptions.Toggle(frame) end)
  frame.textBtn:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText(L.QUICK_TIP)
    GameTooltip:Show()
  end)
  frame.textBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

  -- "Ask about..."
  frame.ask = Theme.Button(frame, L.ASK_BUTTON, 140, 22)
  frame.ask:SetScript("OnClick", function() UI.AskAbout.Toggle(frame) end)
  frame.ask:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:SetText(L.ASK_TITLE)
    GameTooltip:AddLine(L.ASK_BUTTON_TIP, 1, 1, 1, true)
    GameTooltip:Show()
  end)
  frame.ask:SetScript("OnLeave", function() GameTooltip:Hide() end)
  frame.ask:Hide()

  -- Disposition (0.34.0): how this person regards you, with the reasons on hover.
  frame.disp = CreateFrame("Button", nil, frame)
  frame.disp:SetSize(150, 18)
  frame.disp.label = frame.disp:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.disp.label:SetPoint("LEFT")
  frame.disp.label:SetJustifyH("LEFT")
  frame.disp:SetScript("OnEnter", function(self) D.DispositionTooltip(self) end)
  frame.disp:SetScript("OnLeave", function() GameTooltip:Hide() end)
  frame.disp:Hide()

  -- Admire, Taunt, Intimidate (0.85.0): small buttons on the bottom bar, an icon (and, in
  -- the wide wood look, a word). Each is tried once a day with each person.
  frame.persuade = {}
  for i, action in ipairs(PERSUADE_ACTIONS) do
    local b = CreateFrame("Button", nil, frame)
    b.action = action
    b:SetSize(18, 18)
    b.icon = b:CreateTexture(nil, "ARTWORK")
    b.icon:SetSize(16, 16)
    b.icon:SetPoint("LEFT", 1, 0)
    b.icon:SetTexture(PERSUADE_ICONS[action])
    b.label = b:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    b.label:SetPoint("LEFT", b.icon, "RIGHT", 3, 0)
    b.label:SetText(L["PERSUADE_" .. action:upper()])
    b.hl = b:CreateTexture(nil, "HIGHLIGHT")
    b.hl:SetAllPoints()
    b.hl:SetColorTexture(1, 1, 1, 0.12)
    b:SetScript("OnClick", function(self)
      if self.usable then ns.Conversation.Persuade(self.action) end
    end)
    b:SetScript("OnEnter", function(self) D.PersuadeTooltip(self) end)
    b:SetScript("OnLeave", function() GameTooltip:Hide() end)
    b:Hide()
    frame.persuade[i] = b
  end

  -- Tone (0.85.0): Polite / Normal / Blunt; a click moves to the next one.
  frame.tone = CreateFrame("Button", nil, frame)
  frame.tone:SetSize(110, 18)
  frame.tone.label = frame.tone:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.tone.label:SetPoint("LEFT")
  frame.tone.label:SetJustifyH("LEFT")
  frame.tone:RegisterForClicks("LeftButtonUp", "RightButtonUp")
  frame.tone:SetScript("OnClick", function(self, button)
    local cur = self.value or "normal"
    local nxt = ns.Disposition.NextTone(cur)
    if button == "RightButton" then nxt = ns.Disposition.NextTone(nxt) end
    ns.Conversation.SetTone(nxt)
    if GameTooltip:IsOwned(self) then D.ToneTooltip(self) end
  end)
  frame.tone:SetScript("OnEnter", function(self) D.ToneTooltip(self) end)
  frame.tone:SetScript("OnLeave", function() GameTooltip:Hide() end)
  frame.tone:Hide()

  frame.flagBox = CreateFrame("EditBox", nil, frame, C.Template("editbox"))
  frame.flagBox:SetSize(WOOD_WIDTH - 2 * PAD - 120, 20)
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

  -- Keys and gamepad buttons go to a listener above everything else (TOOLTIP strata, high
  -- level), so another dialogue addon's own key listener (DialogueUI's is at TOOLTIP too)
  -- can't take number keys meant for us while the box is up. It covers no mouse input.
  frame.keys = CreateFrame("Frame", nil, frame)
  frame.keys:SetAllPoints()
  frame.keys:SetFrameStrata("TOOLTIP")
  if frame.keys.SetFixedFrameStrata then frame.keys:SetFixedFrameStrata(true) end
  frame.keys:SetFrameLevel(9000)
  frame.keys:EnableKeyboard(true)
  frame.keys:SetPropagateKeyboardInput(true)
  frame.keys:SetScript("OnKeyDown", function(self, key) D.OnKey(self, key) end)
  C.SetGamePadHandler(frame.keys, function(self, button) D.OnPad(self, button) end)
  frame:SetScript("OnHide", function()
    reveal.active = false
    frame:SetScript("OnUpdate", nil)
    if autoTimer then autoTimer.cancelled = true end
    C.GamePadButtons(frame.keys, false)
  end)
end

---------------------------------------------------------------------------
-- Styling, layout, position
---------------------------------------------------------------------------
-- Positions that differ between the two looks.
local function placeParts(game)
  local W = width()
  frame:SetWidth(W)
  local n, sub = frame.name, frame.subtitle
  n:ClearAllPoints(); sub:ClearAllPoints()
  frame.said:ClearAllPoints()
  frame.close:ClearAllPoints()
  frame.history:ClearAllPoints()
  frame.flag:ClearAllPoints()
  frame.textBtn:ClearAllPoints()
  frame.ask:ClearAllPoints()
  frame.disp:ClearAllPoints()
  frame.tone:ClearAllPoints()
  frame.flagBox:ClearAllPoints()
  frame.flagHint:ClearAllPoints()
  frame.rule:ClearAllPoints()
  if game then
    -- Like the gossip window: name in the title bar, subtitle in the header beside the
    -- portrait, text inside the parchment inset, buttons on the bottom bar.
    n:SetPoint("TOPLEFT", 58, -5)
    n:SetPoint("TOPRIGHT", -24, -5)
    n:SetJustifyH("CENTER")
    n:SetWordWrap(false)
    sub:SetPoint("TOPLEFT", 62, -32)
    sub:SetPoint("TOPRIGHT", -12, -32)
    sub:SetJustifyH("CENTER")
    frame.said:SetPoint("TOPLEFT", GAME_TEXT_X, GAME_TEXT_Y)
    frame.close:SetPoint("TOPRIGHT", 1, 0)
    frame.history:SetSize(14, 14)
    frame.history:SetPoint("TOPRIGHT", -66, -4)
    frame.flag:SetSize(14, 14)
    frame.flag:SetPoint("TOPRIGHT", -26, -4)
    frame.textBtn:SetPoint("TOPRIGHT", -44, -3)
    -- Bottom bar (game look): a slimmer Ask button and quieter, smaller labels.
    frame.ask:SetSize(118, 20)
    frame.ask:SetPoint("BOTTOMRIGHT", -8, 4)
    frame.disp:SetPoint("BOTTOMLEFT", 12, 7)
    frame.disp.label:SetFontObject("GameFontNormalSmall")
    frame.tone.label:SetFontObject("GameFontNormalSmall")
    frame.flagBox:SetPoint("BOTTOMLEFT", 12, 5)
    -- The metal border reaches past the frame (most at the portrait corner and the top).
    frame:SetClampRectInsets(-13, 4, 16, -3)
  else
    local textLeft = PAD + PORTRAIT + 14
    n:SetPoint("TOPLEFT", textLeft, -PAD + 2)
    n:SetJustifyH("LEFT")
    n:SetWordWrap(true)
    sub:SetPoint("TOPLEFT", n, "BOTTOMLEFT", 0, -2)
    sub:SetJustifyH("LEFT")
    frame.rule:SetPoint("TOPLEFT", sub, "BOTTOMLEFT", 0, -6)
    frame.rule:SetPoint("RIGHT", frame, "RIGHT", -PAD - 46, 0)
    frame.said:SetPoint("TOPLEFT", sub, "BOTTOMLEFT", 0, -14)
    frame.close:SetPoint("TOPRIGHT", -12, -12)
    frame.history:SetSize(16, 16)
    frame.history:SetPoint("TOPRIGHT", -84, -14)
    frame.flag:SetSize(16, 16)
    frame.flag:SetPoint("TOPRIGHT", -38, -14)
    frame.textBtn:SetPoint("TOPRIGHT", -60, -14)
    frame.ask:SetSize(140, 22)
    frame.ask:SetPoint("BOTTOMRIGHT", -16, 14)
    frame.disp:SetPoint("BOTTOMLEFT", PAD + 6, 16)
    frame.disp.label:SetFontObject("GameFontHighlight")
    frame.tone.label:SetFontObject("GameFontHighlight")
    frame.flagBox:SetPoint("BOTTOMLEFT", PAD + 6, 10)
    frame.flagHint:SetPoint("LEFT", frame.flagBox, "RIGHT", 8, 0)
    frame:SetClampRectInsets(0, 0, 0, 0)
  end
  for _, part in ipairs({ frame.model, frame.portraitBg, frame.portraitTrim, frame.portraitInner }) do
    part:SetShown(not game)
  end
  frame.rule:SetShown(not game)
  frame.replyRule:SetShown(not game)
end

local function textWidth()
  if isGame() then return GAME_TEXT_W + gameExtra() end
  return woodWidth() - (PAD + PORTRAIT + 14) - PAD - 22
end

function D.Style()
  if not frame then return end
  local size = Theme.BodySize() + (large() and LARGE_TEXT or 0)
  local game = isGame()
  Theme.Recolor(frame)
  placeParts(game)
  local p = Theme.Palette()
  frame.portraitBg:SetColorTexture(p.wood[1], p.wood[2], p.wood[3], 1)
  frame.portraitTrim:SetColorTexture(p.trim[1], p.trim[2], p.trim[3], 1)
  frame.portraitInner:SetColorTexture(p.wood[1] * 0.6, p.wood[2] * 0.6, p.wood[3] * 0.6, 1)
  Theme.ColorDivider(frame.rule)
  Theme.ColorDivider(frame.replyRule)
  Theme.StyleButton(frame.ask)
  Theme.StyleButton(frame.close, 12)
  if game then
    -- The title bar's size, gold with a shadow, as on the game's own windows.
    Theme.SetFont(frame.name, "name", 13)
    Theme.SetFont(frame.subtitle, "body", size - 1)
  else
    Theme.SetFont(frame.name, "name", size + 6)
    Theme.SetFont(frame.subtitle, "body", size - 2)
  end
  Theme.Shadow(frame.name, game)
  Theme.Shadow(frame.subtitle, game)
  frame.textBtn.label:SetFont(C.GlobalString("STANDARD_TEXT_FONT") or "Fonts\\FRIZQT__.TTF", 11, "")
  Theme.Shadow(frame.textBtn.label, game)
  Theme.TextColor(frame.textBtn.label, "title")
  Theme.SetFont(frame.text, "body", size)
  Theme.SetFont(frame.reaction, "body", size - 1)
  Theme.SetFont(frame.said, "body", size - 1)
  Theme.TextColor(frame.said, "dim")
  frame.said:SetSpacing(settings().lineSpacing or 3)
  Theme.SetFont(frame.flagHint, "body", size - 3)
  Theme.SetFont(frame.disp.label, "body", size - 2)
  for _, b in ipairs(frame.persuade) do Theme.SetFont(b.label, "body", size - 3) end
  Theme.Shadow(frame.disp.label, false)
  Theme.TextColor(frame.disp.label, "header")
  Theme.SetFont(frame.tone.label, "body", size - 2)
  Theme.Shadow(frame.tone.label, false)
  Theme.TextColor(frame.tone.label, "header")
  frame.text:SetSpacing(settings().lineSpacing or 3)
  frame.reaction:SetSpacing(settings().lineSpacing or 3)
  Theme.TextColor(frame.name, "title")
  Theme.TextColor(frame.subtitle, "header")
  Theme.TextColor(frame.text, "text")
  Theme.TextColor(frame.reaction, "reaction")
  Theme.TextColor(frame.flagHint, "dim")
  for _, b in ipairs(frame.buttons) do
    Theme.SetFont(b.label, "body", size)
    Theme.SetFont(b.marker, "name", size)
    Theme.TextColor(b.marker, "marker")
    b.label:SetSpacing(2)
    Theme.StyleRow(b)
    Theme.TextColor(b.label, D.ColorKey(b))
  end
  frame:SetScale(Theme.Scale())
end

function D.Layout()
  if not frame then return end
  local game = isGame()
  local W, tw = width(), textWidth()
  frame.text:SetWidth(tw)
  frame.reaction:SetWidth(tw)
  frame.said:SetWidth(tw)
  -- The text sits under what you said, or where that line would be.
  local saidH = frame.said:IsShown() and ((frame.said:GetStringHeight() or 14) + 8) or 0
  frame.text:ClearAllPoints()
  if saidH > 0 then
    frame.text:SetPoint("TOPLEFT", frame.said, "BOTTOMLEFT", 0, -8)
  else
    frame.text:SetPoint("TOPLEFT", frame.said, "TOPLEFT")
  end
  -- Measure with the full text so the window doesn't grow while typing.
  local current = frame.text:GetText()
  frame.text:SetText(reveal.full)
  local textH = frame.text:GetStringHeight() or 14
  frame.text:SetText(current)
  local reactionH = frame.reaction:IsShown() and (8 + (frame.reaction:GetStringHeight() or 14)) or 0
  local rowLeft, rowWidth, y
  local rowGap = 2
  if game then
    rowLeft, rowWidth, rowGap = GAME_ROW_X, GAME_ROW_W + gameExtra(), 1
    y = GAME_TEXT_Y - saidH - textH - reactionH - GAME_SPACER
  else
    local h = (frame.name:GetStringHeight() or 20) + (frame.subtitle:GetStringHeight() or 0) + 12 + saidH + textH + reactionH
    rowLeft, rowWidth = PAD, W - 2 * PAD
    y = -(PAD + math.max(PORTRAIT, h) + 16)
    frame.replyRule:ClearAllPoints()
    frame.replyRule:SetPoint("TOPLEFT", PAD, y)
    frame.replyRule:SetPoint("TOPRIGHT", -PAD, y)
    y = y - 8
  end
  for _, b in ipairs(frame.buttons) do
    if b:IsShown() then
      if b.gap then y = y - 8 end   -- a little space before the game's own options
      -- A big icon (a reward to choose) gets room beside it, with the text centered on it.
      local big = b.icon:IsShown() and (b.iconSize or 16) > 16
      local indent = big and (b.iconSize + 10) or (game and GAME_ROW_TEXT or (b.icon:IsShown() and 22 or 4))
      b:ClearAllPoints()
      b:SetPoint("TOPLEFT", rowLeft, y)
      b:SetWidth(rowWidth)
      b.label:ClearAllPoints()
      b.label:SetWidth(rowWidth - indent - 4)
      local labelH = b.label:GetStringHeight() or 14
      local iconH = b.icon:IsShown() and (big and (b.iconSize + 6) or (game and 18 or 20)) or 0
      local bh = math.max(labelH + (game and 4 or 6), iconH)
      b.icon:ClearAllPoints()
      if big then
        b.icon:SetPoint("LEFT", 3, 0)
        b.label:SetPoint("LEFT", indent, 0)
      else
        b.icon:SetPoint("TOPLEFT", 3, -2)
        b.label:SetPoint("TOPLEFT", indent, game and -2 or -3)
      end
      b:SetHeight(bh)
      y = y - bh - rowGap
    end
  end
  frame.disp:SetShown(frame.disp.value ~= nil and not frame.flagBox:IsShown())
  -- Persuasion buttons sit just left of "Ask about..." (or the corner), right to left.
  local persuadeOn = frame.persuadeState ~= nil and not frame.flagBox:IsShown()
  local words = true   -- 0.86.0: actions always show their names
  local anchor, anchorPoint, gap = frame.ask, "LEFT", -6
  if not frame.ask:IsShown() then
    anchor, anchorPoint, gap = frame, "BOTTOMRIGHT", 0
  end
  for i = #frame.persuade, 1, -1 do
    local b = frame.persuade[i]
    b:SetShown(persuadeOn)
    if persuadeOn then
      b.label:SetShown(words)
      b:SetHeight(words and 18 or 20)
      b.icon:SetSize(words and 16 or 18, words and 16 or 18)
      b:SetWidth(words and (22 + (b.label:GetStringWidth() or 40)) or 20)
      b:ClearAllPoints()
      if anchor == frame then
        b:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", game and -8 or -16, game and 6 or 16)
      else
        b:SetPoint("RIGHT", anchor, anchorPoint, (anchor == frame.ask and not words) and -10 or gap, 0)
      end
      anchor, anchorPoint, gap = b, "LEFT", words and -8 or -5
    end
  end
  frame.tone:SetShown(frame.tone.value ~= nil and not frame.flagBox:IsShown())
  if frame.tone:IsShown() then
    frame.tone:ClearAllPoints()
    if frame.disp:IsShown() then
      frame.tone:SetPoint("LEFT", frame.disp, "RIGHT", game and 18 or 14, 0)
    else
      frame.tone:SetPoint("BOTTOMLEFT", game and 12 or (PAD + 6), game and 6 or 16)
    end
  end
  local barShown = frame.flagBox:IsShown() or frame.ask:IsShown() or frame.disp:IsShown() or frame.tone:IsShown() or persuadeOn
  if game then
    local bottom = barShown and GAME_BAR or 4
    -- The flag hint ("say what's wrong", "saved") gets its own line above the bar.
    if frame.flagBox:IsShown() or (frame.flagHint:GetText() or "") ~= "" then
      y = y - 16
      frame.flagHint:ClearAllPoints()
      frame.flagHint:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", GAME_TEXT_X, bottom + 6)
    end
    local inset = Theme.GamePart(frame, "inset")
    if inset then
      inset:ClearAllPoints()
      inset:SetPoint("TOPLEFT", 4, -GAME_HEADER)
      inset:SetPoint("BOTTOMRIGHT", -6, bottom)
    end
    frame.flagBox:SetWidth(W - 12 - 16 - (frame.ask:IsShown() and 148 or 0))
    local H = math.max(-y + 12 + bottom, gameHeight())
    frame:SetHeight(H)
    Theme.FitPaper(frame, W - 10, H - GAME_HEADER - bottom)
  else
    frame.flagBox:SetWidth(woodWidth() - 2 * PAD - 120)
    if barShown then y = y - 36 end
    frame:SetHeight(-y + PAD - 4)
  end
  -- The Ask list beside the box keeps its height.
  if UI.AskAbout.IsShown() then UI.AskAbout.Fit(frame) end
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
  elseif isGame() then
    -- Where the game opens its own quest and gossip windows.
    frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 16, -116)
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
  frame.lastLabel = v.lastLabel
  frame.name:SetText(v.name or "")
  frame.subtitle:SetText(v.subtitle and ("<" .. v.subtitle .. ">") or "")
  frame.reaction:SetText("")
  frame.reaction:Hide()
  D.SetSaid(v.said)
  if v.unit and frame.model.SetUnit then
    frame.model:ClearModel()
    frame.model:SetUnit(v.unit)
    if frame.model.SetPortraitZoom then frame.model:SetPortraitZoom(1) end
  end

  D.RenderChoices(v.choices)
  C.GamePadButtons(frame.keys, settings().gamepad ~= false and C.GamePadEnabled())

  frame.flagHint:SetText("")
  frame.ask:SetShown(v.canAsk == true)
  frame.ask:SetText((v.askCount and v.askCount > 0) and L.ASK_BUTTON_N:format(v.askCount) or L.ASK_BUTTON)
  D.SetDisposition(v.disposition, true)
  D.SetTone(v.tone, true)
  D.Style()   -- also builds the current look's parts, the round portrait among them
  local portrait = Theme.GamePart(frame, "portrait")
  if portrait and not C.SetPortrait(portrait, v.unit) then portrait:SetTexture(PORTRAIT_FALLBACK) end
  -- Narration (0.85.0): its own paragraph in dim ink, typed before their words.
  local narr = (v.narr and v.narr ~= "") and (Theme.Hex("dim") .. v.narr .. "|r\n\n") or ""
  reveal.full = narr .. (v.text or "")
  reveal.linked = v.linkedText and (narr .. v.linkedText) or nil
  reveal.total = utf8Len(reveal.full)
  reveal.cuts = nil
  reveal.shown = 0
  D.Layout()
  local opening = not frame:IsShown()
  if opening then place(ns.Conversation.session and ns.Conversation.session.blizz) end
  frame:Show()
  if opening and frame.fadeIn and not settings().reduceMotion then frame.fadeIn:Play() end
  if instant() then
    finishReveal()
  else
    startReveal()
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
    b.tooltip = c.tooltip
    local num = c.locked and ((i % 10) .. ". ") or (Theme.Hex("number") .. (i % 10) .. ".|r ")
    -- A branch explored in an earlier conversation is dimmed (it's also listed after the
    -- fresh ones, so order carries the same news without the color).
    local text = c.explored and (Theme.Hex("dim") .. c.text .. "|r") or c.text
    b.label:SetText(num .. (c.locked and (L.LOCKED_MARK .. " ") or "") .. text)
    -- The game's own options keep their icons in both looks; in the game look the NPC's
    -- replies get the gossip window's speech bubble, like any talk option there.
    D.SetRowIcon(b, c.icon or (isGame() and not c.game and ICON_TALK) or nil, c.locked)
    b:Show()
    n = i
  end
  local getOn = frame.buttons[n + 1]
  getOn.locked = false
  getOn.tooltip = nil
  getOn.gap = n > 0
  getOn.label:SetText(((n + 1) % 10) .. ". " .. (frame.lastLabel or L.GET_ON_WITH_IT))
  D.SetRowIcon(getOn, isGame() and ICON_BULLET or nil, false)
  getOn:Show()
  for i = 1, MAX_BUTTONS do
    frame.buttons[i].isGetOn = (i == n + 1)
    if i > n + 1 then frame.buttons[i]:Hide() end
  end
  -- Keyboard and gamepad users keep a selection from one node to the next.
  D.Select(nil)
  if navMode then D.Move(1) end
end

-- icon: { atlas = name } or { file = path or fileID, desaturate = bool }, or nil.
function D.SetRowIcon(b, icon, faded)
  if not icon then
    b.icon:Hide()
    b.iconSize = nil
    return
  end
  b.icon:SetTexCoord(0, 1, 0, 1)
  local okSet
  if icon.atlas then okSet = b.icon:SetAtlas(icon.atlas) else okSet = b.icon:SetTexture(icon.file) end
  if okSet == false and icon ~= ICON_BULLET then return D.SetRowIcon(b, ICON_BULLET, faded) end
  b.iconSize = icon.size or 16
  b.icon:SetSize(b.iconSize, b.iconSize)
  b.icon:SetDesaturated((icon.desaturate or faded) and true or false)
  b.icon:SetAlpha(faded and 0.5 or 1)
  b.icon:Show()
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

-- Replace the choices in place (after an errand step, a reward picked). focus: the row a
-- keyboard or gamepad selection moves to (the next step, such as "Complete quest").
function D.SetChoices(choices, focus)
  if not frame or not frame:IsShown() then return end
  if view then view.choices = choices end
  D.RenderChoices(choices)
  if navMode and focus and frame.buttons[focus] and frame.buttons[focus]:IsShown() then D.Select(focus) end
  D.Style()
  D.Layout()
end

-- After a settings change (look, fonts, sizes): draw everything again in place.
function D.Restyle()
  if not frame then return end
  if frame:IsShown() and view then D.RenderChoices(view.choices) end
  D.Style()
  local portrait = Theme.GamePart(frame, "portrait")
  if portrait and view and not C.SetPortrait(portrait, view.unit) then portrait:SetTexture(PORTRAIT_FALLBACK) end
  D.Layout()
end

-- An answer from "Ask about...": replaces the main text, keeps the choices.
function D.ShowAnswer(text, topicName, linked, said)
  if not frame or not frame:IsShown() then return end
  frame.reaction:SetText("")
  frame.reaction:Hide()
  D.SetSaid(said)
  reveal.full = text or ""
  reveal.linked = linked
  reveal.total = utf8Len(reveal.full)
  reveal.cuts = nil
  reveal.shown = 0
  if topicName then frame.subtitle:SetText("<" .. topicName .. ">") end
  D.Layout()
  if instant() then
    finishReveal()
  else
    startReveal()
  end
end

-- New text for the same page (an item's name arrived): typing carries on where it was, and
-- finished text is simply replaced.
function D.UpdateText(text, linked)
  if not frame or not frame:IsShown() then return end
  reveal.full = text or ""
  reveal.linked = linked
  reveal.total = utf8Len(reveal.full)
  reveal.cuts = nil
  D.Layout()
  if reveal.active then
    reveal.shown = math.min(reveal.shown, reveal.total)
  else
    frame.text:SetText(reveal.linked or reveal.full)
  end
end

-- d: { value, name, why } or nil (setting off, or a game page).
function D.SetDisposition(d, noLayout)
  if not frame then return end
  D.SetPersuade(ns.Conversation.PersuadeState and ns.Conversation.PersuadeState() or nil)
  frame.disp.value = d
  if d then
    frame.disp.label:SetText(L.DISP_LABEL:format(Theme.Hex("title") .. d.name .. "|r"))
    frame.disp:SetWidth(math.max(60, (frame.disp.label:GetStringWidth() or 120) + 4))
  else
    frame.disp.label:SetText("")
  end
  if not noLayout then D.Layout() end
end

-- state: { [action] = { usable, last } } or nil (off, or a game page).
function D.SetPersuade(state)
  if not frame then return end
  frame.persuadeState = state
  for _, b in ipairs(frame.persuade) do
    local st = state and state[b.action]
    b.usable = st ~= nil and st.usable
    b.icon:SetDesaturated(not b.usable)
    b.icon:SetAlpha(b.usable and 1 or 0.6)
    if b.usable then Theme.TextColor(b.label, "header") else Theme.TextColor(b.label, "dim") end
  end
end

function D.PersuadeTooltip(b)
  local name = L["PERSUADE_" .. b.action:upper()]
  GameTooltip:SetOwner(b, "ANCHOR_TOP")
  GameTooltip:SetText(name)
  GameTooltip:AddLine(L["PERSUADE_" .. b.action:upper() .. "_TIP"], 1, 1, 1, true)
  if not b.usable then GameTooltip:AddLine(L.PERSUADE_TRIED_TIP, 0.7, 0.7, 0.7, true) end
  GameTooltip:Show()
end

-- tone: "polite" / "normal" / "blunt", or nil (selector off, or a game page).
function D.SetTone(tone, noLayout)
  if not frame then return end
  frame.tone.value = tone
  if tone then
    local name = L["TONE_" .. tone:upper()] or tone
    frame.tone.label:SetText(L.TONE_LABEL:format(Theme.Hex("title") .. name .. "|r"))
    frame.tone:SetWidth(math.max(60, (frame.tone.label:GetStringWidth() or 90) + 4))
  else
    frame.tone.label:SetText("")
  end
  if not noLayout then D.Layout() end
end

function D.ToneTooltip(owner)
  GameTooltip:SetOwner(owner, "ANCHOR_TOP")
  GameTooltip:SetText(L.TONE_TITLE)
  GameTooltip:AddLine(L.TONE_TIP, 1, 1, 1, true)
  local cur = frame.tone.value
  for _, t in ipairs(ns.Disposition.TONES) do
    local on = t == cur
    GameTooltip:AddLine((on and "> " or "   ") .. (L["TONE_" .. t:upper()] or t), on and 1 or 0.7, on and 0.82 or 0.7, on and 0 or 0.7)
  end
  GameTooltip:Show()
end

local WHY_KEYS = { affinity = "DISP_WHY_AFFINITY", unfriendly = "DISP_WHY_UNFRIENDLY", prejudice = "DISP_WHY_PREJUDICE",
  persuade = "DISP_WHY_PERSUADE",
  ["tone:likes"] = "DISP_WHY_TONE_LIKES", ["tone:dislikes"] = "DISP_WHY_TONE_DISLIKES" }

function D.DispositionTooltip(owner)
  local d = frame.disp.value
  if not d then return end
  GameTooltip:SetOwner(owner, "ANCHOR_TOP")
  GameTooltip:SetText(L.DISP_TITLE:format(d.name, d.value))
  GameTooltip:AddLine(L.DISP_TIP, 1, 1, 1, true)
  for _, r in ipairs(d.why or {}) do
    local key, delta = r[1], r[2]
    local text
    if WHY_KEYS[key] then
      text = L[WHY_KEYS[key]]
    elseif key:find("^town:") then
      local town = ns.Data.towns and ns.Data.towns[key:sub(6)]
      text = L.DISP_WHY_TOWN:format(town and town.name or key:sub(6))
    elseif key:find("^rival:") then
      text = L.DISP_WHY_RIVAL:format(ns.Disposition.RivalName(key:sub(7)))
    elseif key:find("^rivalfoe:") then
      text = L.DISP_WHY_RIVALFOE:format(ns.Disposition.RivalName(key:sub(10)))
    elseif key:find("^values ") then
      text = L.DISP_WHY_VALUES:format(key:sub(8))
    elseif key:find("^dislikes ") then
      text = L.DISP_WHY_DISLIKES:format(key:sub(10))
    elseif key:find("^temper ") then
      text = L.DISP_WHY_TEMPER
    else
      text = L.DISP_WHY_ALIGN
    end
    local r1, g1 = delta > 0 and 0.3 or 1, delta > 0 and 1 or 0.35
    GameTooltip:AddDoubleLine(text, (delta > 0 and "+" or "") .. delta, 0.9, 0.9, 0.9, r1, g1, 0.3)
  end
  GameTooltip:Show()
end

-- The reply you just picked, shown above their answer ("You: ..."), or nothing.
function D.SetSaid(text)
  if text and text ~= "" then
    frame.said:SetText(L.YOU_SAID:format(text))
    frame.said:Show()
  else
    frame.said:SetText("")
    frame.said:Hide()
  end
end

-- Hover on the book: this visit's exchange so far, newest last, long lines shortened.
local HISTORY_MAX, HISTORY_CHARS = 12, 180
function D.HistoryTooltip(owner)
  GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
  GameTooltip:SetText(L.HISTORY_TITLE)
  local s = ns.Conversation.session
  local log = s and s.log or {}
  if #log == 0 then
    GameTooltip:AddLine(L.HISTORY_EMPTY, 0.8, 0.8, 0.8, true)
  else
    local who = (view and view.name) or ""
    for k = math.max(1, #log - HISTORY_MAX + 1), #log do
      local e = log[k]
      local text = e.text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("\n+", " ")
      if utf8Len(text) > HISTORY_CHARS then text = text:sub(1, utf8Cut(text, HISTORY_CHARS)) .. "..." end
      if e.who == "you" then
        GameTooltip:AddLine(L.YOU_SAID:format(text), 1, 0.82, 0, true)
      elseif e.who == "ask" then
        GameTooltip:AddLine(L.HISTORY_ASKED:format(text), 1, 0.82, 0, true)
      else
        GameTooltip:AddLine(who ~= "" and (who .. ": " .. text) or text, 1, 1, 1, true)
      end
    end
  end
  GameTooltip:AddLine(L.JOURNAL_BOX_TIP, 0.6, 0.6, 0.6, true)
  GameTooltip:Show()
end

-- Settings: put the box back where it opens by default.
function D.ResetPosition()
  settings().pos.dialogue = nil
  if frame and frame:IsShown() then place(ns.Conversation.session and ns.Conversation.session.blizz) end
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

-- Keys that belong to the box while another dialogue addon's window waits underneath, even
-- when they do nothing here (a "7" with six replies must not pick that window's option 7).
local OURS_WHILE_OVER = { SPACE = true, ENTER = true, NUMPADENTER = true, ESCAPE = true, UP = true, DOWN = true,
  LEFT = true, RIGHT = true, TAB = true }
for n = 0, 9 do OURS_WHILE_OVER[tostring(n)] = true; OURS_WHILE_OVER["NUMPAD" .. n] = true end

function D.OnKey(self, key)
  if C.InCombat() then return end
  local handled = false
  local ask = UI.AskAbout
  if ask.IsShown() and (key == "UP" or key == "DOWN" or key == "ENTER" or key == "NUMPADENTER") then
    handled = true
    if key == "UP" then ask.Move(-1) elseif key == "DOWN" then ask.Move(1) else ask.Confirm() end
  elseif key == "ESCAPE" then
    handled = true
    if UI.TextOptions.IsShown() then UI.TextOptions.Hide()
    elseif ask.IsShown() then ask.Hide()
    else ns.Conversation.Close() end
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
  if not handled and OURS_WHILE_OVER[key] and ns.Conversation.OverOtherWindow() then handled = true end
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
    ns.Conversation.Close()
  elseif button == "PAD3" and frame.ask:IsShown() then
    ask.Toggle(frame)
  end
end

function D.Frame() return frame end
