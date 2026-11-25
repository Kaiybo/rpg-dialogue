-- The conversation drawn inside DialogueUI's own window (Peterodox's DialogueUI), so with
-- that addon everything happens in one window: its own.
--
-- Read from DialogueUI's public source (version 1.0.7, github.com/Peterodox/YUI-Dialogue;
-- it has no API for adding dialogue). Its window, DUIQuestFrame, gets its methods copied in
-- from DUIDialogBaseMixin. For each event, ShowUI calls one handler (HandleGossip,
-- HandleQuestGreeting, HandleQuestDetail/Progress/Complete) that lays out the page from
-- pooled parts (FormatParagraph, AcquireOptionButton + SetGossip, AcquireExitButton,
-- SetScrollRange) and returns true. We wrap those handlers: while a conversation page is
-- set, the page is laid out from the same parts; otherwise DialogueUI's own page is. Its
-- key listener is a child of the window with SetIndexedAction, so number keys pick our
-- replies too. If any of this is missing or fails, the conversation moves to RPG
-- Dialogue's own box, and DialogueUI's page is left as it would have been.
local _, ns = ...

local C = ns.Compat
local L = ns.L

ns.UI = ns.UI or {}
local V = {}
ns.UI.DUIView = V

local HANDLERS = { "HandleGossip", "HandleQuestGreeting", "HandleQuestDetail", "HandleQuestProgress",
  "HandleQuestComplete" }
local NEEDED = { "HandleGossip", "ReleaseAllObjects", "UseQuestLayout", "FormatParagraph", "AcquireOptionButton",
  "AcquireExitButton", "SetScrollRange" }
local SPACING = 16          -- DialogueUI's space between a paragraph and the options
local TALK_ICON = 132053    -- the gossip speech bubble
local MAX_TOPICS = 7       -- topics per page of the Ask list (plus More, Back)

local installed, broken = false, false
-- A talk-key or right-click conversation (no game menu behind it): we showed DialogueUI's
-- window ourselves, so we hide it at the end, and its closing (Goodbye, Escape) ends ours.
local owned, hidingSelf = false, false
local page                  -- { text, choices, canAsk, asking }
local lastView              -- the last page asked for, to move it to the box if needed
local rows = {}             -- what each option button does, from the last layout

local function window() return C.DialogueUIFrame() end

-- Methods copied in by DialogueUI's mixin are fields of the window itself.
local function has(f, name) return type(rawget(f, name)) == "function" end

-- DialogueUI's saved settings (a global table), read-only: its theme, input device and
-- "NPC name on page" option, so our pages look like its own.
local function duiSetting(key)
  local db = _G.DialogueUI_DB
  if type(db) == "table" then return db[key] end
  return nil
end
local function darkTheme() return duiSetting("Theme") == 2 end
local function usingGamePad()
  local d = duiSetting("InputDevice")
  return d ~= nil and d ~= 1
end

-- Muted ink for narration and "You said", on the parchment and on the dark theme.
local function dimColor() return darkTheme() and "|cffa49a8c" or "|cff8c7b67" end

-- DialogueUI's own icons, so our rows wear the same art as its gossip and quest rows.
local ICON_PATH = "Interface\\AddOns\\DialogueUI\\Art\\Icons\\"
local QUEST_ICONS = {
  available = ICON_PATH .. "AvailableQuest.png",
  complete = ICON_PATH .. "CompleteQuest.png",
  incomplete = ICON_PATH .. "IncompleteQuest.png",
}
local ROW_ICONS = {
  ask = ICON_PATH .. "Gossip-Blue.png",
  persuade = ICON_PATH .. "Gossip-Red.png",
  nav = ICON_PATH .. "Gossip.png",
}

-- Option buttons are DialogueUI's, pooled and reused for its own pages. Everything we add
-- to one (the rule above it, a greyed icon, our row number) is undone before every layout,
-- ours or DialogueUI's.
local ruleTex, touched = {}, {}
local function resetButtons()
  for _, t in pairs(ruleTex) do t:Hide() end
  for b in pairs(touched) do
    b.rpgdRow = nil
    if b.Icon and b.Icon.SetDesaturated then b.Icon:SetDesaturated(false) end
    if b.Icon and b.Icon.SetVertexColor then b.Icon:SetVertexColor(1, 1, 1) end
  end
end
local function ruleFor(b)
  local t = ruleTex[b]
  if not t then
    t = b:CreateTexture(nil, "ARTWORK")
    t:SetHeight(1)
    ruleTex[b] = t
  end
  -- A brown rule on the parchment, a pale one on the dark theme.
  if darkTheme() then t:SetColorTexture(0.85, 0.85, 0.85, 0.22)
  else t:SetColorTexture(0.55, 0.46, 0.36, 0.45) end
  return t
end

-- Clicks. DialogueUI's buttons call onClickFunc from their OnClick, but its swipe-to-scroll
-- (on by default) swallows a click it takes for the end of a drag, and on some setups that
-- left every one of our replies dead. So each button we use also gets a hook of its own
-- (installed once, idle unless the button holds one of our rows): if the click reached the
-- button but not our row, and the mouse didn't really move, the row is picked anyway.
local GetCursorPosition = _G.GetCursorPosition
local function cursorY()
  if type(GetCursorPosition) ~= "function" then return 0 end
  local _, y = GetCursorPosition()
  return y or 0
end
local hooked = setmetatable({}, { __mode = "k" })
local function hookButton(b)
  if hooked[b] or type(b.HookScript) ~= "function" then return end
  hooked[b] = true
  b:HookScript("OnMouseDown", function(self, button)
    if self.rpgdRow and button == "LeftButton" then self.rpgdDownY, self.rpgdFired = cursorY(), false end
  end)
  b:HookScript("OnClick", function(self, button)
    local i = self.rpgdRow
    if not i or button ~= "LeftButton" or self.rpgdFired then return end
    local down = self.rpgdDownY
    self.rpgdDownY = nil
    if down and math.abs(cursorY() - down) > 12 then return end
    self.rpgdFired = true
    V.Click(i)
  end)
end

local function install(f)
  if installed then return true end
  for _, name in ipairs(HANDLERS) do
    local original = rawget(f, name)
    if type(original) == "function" then
      f[name] = function(self, ...)
        resetButtons()
        if page then
          local ok, laidOut = pcall(V.Layout, self)
          if ok and laidOut then return true end
          V.Broke(laidOut)
        end
        return original(self, ...)
      end
    end
  end
  if type(f.HookScript) == "function" then
    f:HookScript("OnHide", function()
      if not owned or hidingSelf then return end
      owned, page = false, nil
      if ns.Conversation.OnWindowClosed then ns.Conversation.OnWindowClosed() end
    end)
  end
  installed = true
  return true
end

function V.Available()
  if broken then return false end
  local f = window()
  if not f then return false end
  for _, name in ipairs(NEEDED) do if not has(f, name) then return false end end
  return install(f)
end

-- Something about DialogueUI's window didn't work: from now on, the box.
function V.Broke(err)
  broken = true
  page = nil
  ns.Debug("DialogueUI view:", tostring(err))
  local v = lastView
  C.After(0, function() ns.Conversation.FallbackToBox(v) end)
end

local function keyListener(f)
  if type(f.GetChildren) ~= "function" then return nil end
  for _, child in ipairs({ f:GetChildren() }) do
    if type(child) == "table" and type(child.SetIndexedAction) == "function" then return child end
  end
  return nil
end

-- The option rows for the current page: the NPC's replies and the game's options, Ask
-- about..., and Get on with it (back to DialogueUI's own page). Or the topics list.
local function buildRows(p)
  local out = {}
  local Conv = ns.Conversation
  if p.persuading then
    -- Admire, Taunt, Intimidate (0.85.0): once a day each with each person.
    local state = Conv.PersuadeState() or {}
    for _, action in ipairs(ns.Persuasion.ACTIONS) do
      local st = state[action]
      local name = L["PERSUADE_" .. action:upper()]
      local usable = st ~= nil and st.usable
      out[#out + 1] = { text = usable and name or (name .. " (" .. L.PERSUADE_TRIED .. ")"), locked = not usable, kind = "persuade",
        onClick = function() page.persuading = nil; Conv.Persuade(action) end }
    end
    out[#out + 1] = { text = L.DUI_BACK, gap = true, kind = "nav", onClick = function() page.persuading = nil; V.Refresh() end }
    return out
  end
  if p.asking then
    -- What the player can say back to the last answer (0.82.0), above the list.
    for i, c in ipairs(p.choices or {}) do
      if c.view then out[#out + 1] = { text = c.text, onClick = function() Conv.Choose(i) end } end
    end
    -- Every topic, a page at a time: "ask anyone" first, then what this person said they
    -- know about, then the rest, newest first.
    local s = Conv.session
    local key = s and s.memKey
    local disp = s and ns.Disposition and ns.Disposition.For(s.env, s.ctx)
    local all = ns.Topics.Known(false, key, disp)
    local std, knows, rest = {}, {}, {}
    for _, t in ipairs(all) do
      if t.standard then std[#std + 1] = t elseif t.knows then knows[#knows + 1] = t else rest[#rest + 1] = t end
    end
    local topics = {}
    for _, group in ipairs({ std, knows, rest }) do
      for _, t in ipairs(group) do topics[#topics + 1] = t end
    end
    local pages = math.max(1, math.ceil(#topics / MAX_TOPICS))
    local pg = math.min(p.askPage or 0, pages - 1)
    p.askPage = pg
    for i = pg * MAX_TOPICS + 1, math.min(#topics, (pg + 1) * MAX_TOPICS) do
      local t = topics[i]
      local id = t.id
      local suffix = ""
      if key and ns.Topics.StillGated(id, key, disp) then suffix = " (" .. L.ASK_GATED .. ")"
      elseif key and ns.Topics.NothingFrom(id, key) then suffix = " (" .. L.ASK_NOTHING .. ")"
      elseif key and ns.Topics.AskedOf(id, key) and not t.standard then suffix = " (" .. L.ASK_ASKED .. ")"
      elseif t.knows then suffix = " *" end
      out[#out + 1] = { text = t.name .. suffix, onClick = function() Conv.Ask(id) end }
    end
    if pg + 1 < pages then
      out[#out + 1] = { text = L.DUI_MORE:format(pg + 2, pages), gap = true, kind = "nav",
        onClick = function() page.askPage = pg + 1; V.Refresh() end }
    end
    if pg > 0 then
      out[#out + 1] = { text = L.DUI_PREV, gap = pg + 1 >= pages, kind = "nav",
        onClick = function() page.askPage = pg - 1; V.Refresh() end }
    end
    out[#out + 1] = { text = L.DUI_BACK, gap = true, kind = "nav", onClick = function() page.asking = nil; page.askPage = nil; V.Refresh() end }
    return out
  end
  local nChoices, anyGame = #(p.choices or {}), false
  for i, c in ipairs(p.choices or {}) do
    if c.game then anyGame = true end
    out[#out + 1] = {
      text = (c.locked and (L.LOCKED_MARK .. " ") or "") .. c.text, icon = c.icon, locked = c.locked, gap = c.gap,
      rule = c.game and c.gap or nil,
      onClick = function() Conv.Choose(i) end,
    }
  end
  local firstAfter = #out + 1
  if p.canAsk then
    local n = ns.Topics.Count()
    out[#out + 1] = { text = n > 0 and L.DUI_ASK_N:format(n) or L.DUI_ASK, gap = true, kind = "ask",
      onClick = function() page.asking = true; page.askPage = 0; V.Refresh() end }
  end
  if ns.Persuasion and Conv.PersuadeState() then
    out[#out + 1] = { text = L.DUI_PERSUADE, gap = not p.canAsk, kind = "persuade",
      onClick = function() page.persuading = true; V.Refresh() end }
  end
  out[#out + 1] = { text = L.GET_ON_WITH_IT, gap = not p.canAsk and not Conv.PersuadeState(),
    onClick = function() Conv.Business() end }
  -- Tone (0.85.0): the last row; a click moves to the next tone and rewords the replies.
  if p.tone then
    local name = L["TONE_" .. p.tone:upper()] or p.tone
    out[#out + 1] = { text = L.DUI_TONE:format(name), gap = true,
      onClick = function() Conv.SetTone(ns.Disposition.NextTone(p.tone)) end }
  end
  -- No game options listed: the rule goes under the replies, above what follows them.
  if nChoices > 0 and not anyGame and out[firstAfter] then
    out[firstAfter].rule = true
    out[firstAfter].gap = true
  end
  return out
end

-- Lay the page out in DialogueUI's window, the way its HandleGossip does.
function V.Layout(f)
  local p = page
  f:ReleaseAllObjects()
  f:UseQuestLayout(false)
  f.hasActiveGossipQuests, f.numAvailableQuests, f.keepGossipHistory = false, 0, false
  local text = V.Compose(p)
  local offsetY, first, last = f:FormatParagraph(0, text ~= "" and text or " ")
  if not first then error("FormatParagraph returned nothing") end
  -- Number keys, as on DialogueUI's own pages (it shows none while a gamepad is in use).
  local keys = (not usingGamePad()) and keyListener(f) or nil
  rows = buildRows(p)
  for i, r in ipairs(rows) do
    local b = f:AcquireOptionButton()
    local hotkey = (keys and i <= 9) and keys:SetIndexedAction(i, b) or nil
    -- A game icon id (vendor, trainer...) goes in as the option's icon, so DialogueUI swaps
    -- in its own art for it, as on its own gossip page.
    local icon = r.icon
    local iconID = (type(icon) == "table" and type(icon.file) == "number") and icon.file or TALK_ICON
    b:SetGossip({ gossipOptionID = 0, orderIndex = 0, flags = 0, icon = iconID, name = r.text }, hotkey)
    if b.Icon then
      local art = (type(icon) == "table" and icon.quest and QUEST_ICONS[icon.quest]) or (r.kind and ROW_ICONS[r.kind])
      if art then
        b.Icon:SetTexture(art)
      elseif type(icon) == "table" and iconID == TALK_ICON then
        if icon.atlas then b.Icon:SetAtlas(icon.atlas) elseif icon.file then b.Icon:SetTexture(icon.file) end
      end
    end
    b.shouldShowUIOnClick = false
    b.onClickFunc = function(self)
      if self then self.rpgdFired = true end
      V.Click(i)
    end
    b.rpgdRow = i
    touched[b] = true
    hookButton(b)
    if r.locked then
      if b.Disable then b:Disable() end
      if b.Icon and b.Icon.SetDesaturated then b.Icon:SetDesaturated(true) end
      if b.Icon and b.Icon.SetVertexColor then b.Icon:SetVertexColor(0.6, 0.6, 0.6) end
    end
    b:SetPoint("TOPLEFT", last, "BOTTOMLEFT", 0, (i == 1 or r.gap) and -SPACING or 0)
    if r.rule and i > 1 and ns.db.settings.gameDivider ~= false and b.CreateTexture then
      local t = ruleFor(b)
      t:ClearAllPoints()
      t:SetPoint("BOTTOMLEFT", b, "TOPLEFT", 4, SPACING / 2)
      t:SetWidth(math.max(40, (b:GetWidth() or 300) * 0.6))
      t:Show()
    end
    last = b
    if has(f, "IndexGamePadObject") then f:IndexGamePadObject(b) end
  end
  local accept = rawget(f, "AcceptButton")
  if type(accept) == "table" and accept.Hide then accept:Hide() end
  local exit = f:AcquireExitButton()
  if exit and exit.SetButtonExitGossip then exit:SetButtonExitGossip() end
  local top, bottom = first:GetTop(), last:GetBottom()
  f:SetScrollRange((top and bottom) and (top - bottom) or (offsetY + 40 * #rows))
  if has(f, "SetQuestTextRange") then f:SetQuestTextRange(nil) end
  if has(f, "FadeInContentFrame") then f:FadeInContentFrame() end
  return true
end

function V.Click(i)
  local r = rows[i]
  if r and not r.locked then r.onClick() end
end

-- Lay the current page out again (or DialogueUI's own page, with none set).
function V.Refresh()
  local f = window()
  if not f or not f:IsShown() then return end
  local handler = rawget(f, "handler")
  if type(handler) ~= "string" or not has(f, handler) then handler = "HandleGossip" end
  if not page then f.keepGossipHistory = false end
  pcall(f[handler], f, true)
end

-- "Name: what they say", when DialogueUI's own "NPC name on page" option is on.
local function withName(text)
  if not text or text == "" or not duiSetting("ShowNPCNameOnPage") then return text end
  local name = lastView and lastView.name
  if type(name) ~= "string" or name == "" then
    local ok, n = pcall(_G.UnitName, "npc")
    name = ok and n or nil
  end
  if type(name) ~= "string" or name == "" then return text end
  return name .. ": " .. text
end

-- The page's text, put together at layout time from its parts, so the box can take the
-- same parts over unchanged if it has to: the NPC's disposition, what you just said, the
-- narration, then their words (with their name, if DialogueUI shows names) and any
-- reactions after them. The extras are in muted ink, the NPC's words in DialogueUI's own.
local function compose(p)
  local dim, out = dimColor(), {}
  if p.disp and p.disp.name then out[#out + 1] = dim .. L.DISP_LABEL:format(p.disp.name) .. "|r" end
  if p.said and p.said ~= "" then out[#out + 1] = dim .. L.YOU_SAID:format(p.said) .. "|r" end
  if p.narr and p.narr ~= "" then out[#out + 1] = dim .. p.narr .. "|r" end
  local body = withName(p.body)
  if body and body ~= "" then out[#out + 1] = body end
  for _, r in ipairs(p.reactions or {}) do out[#out + 1] = r end
  return table.concat(out, "\n\n")
end
V.Compose = compose

---------------------------------------------------------------------------
-- The same calls as the box (UI/DialogueFrame.lua)
---------------------------------------------------------------------------
function V.Show(v)
  if not V.Available() then return false end
  lastView = v
  page = { body = v.text, narr = v.narr, said = v.said, disp = v.disposition,
    choices = v.choices, canAsk = v.canAsk, tone = v.tone }
  local f = window()
  if not f:IsShown() and owned then
    -- Opened by us: no camera move or hidden UI (those come with the game's interaction).
    local ok = pcall(f.Show, f)
    if ok and has(f, "PlayIntroAnimation") then pcall(f.PlayIntroAnimation, f) end
  end
  if f:IsShown() then
    V.Refresh()
  else
    -- DialogueUI shows its window a moment after the game's event, and lays our page out
    -- then. If it doesn't show at all (one of its own settings), the box takes over.
    C.After(1, function()
      if page and not window():IsShown() then
        page = nil
        ns.Conversation.FallbackToBox(lastView)
      end
    end)
  end
  return true
end

function V.SetChoices(choices)
  if not page then return end
  page.choices, page.asking, page.persuading = choices, nil, nil
  if lastView then lastView.choices = choices end
  V.Refresh()
end

-- The tone row's word (0.85.0); nil hides it.
function V.SetTone(tone)
  if lastView then lastView.tone = tone end
  if not page then return end
  page.tone = tone
  V.Refresh()
end

-- How they feel about you now (the box's "Disposition:" corner), as the page's first line.
function V.SetDisposition(d)
  if lastView then lastView.disposition = d end
  if not page then return end
  page.disp = d
  V.Refresh()
end

-- After an answer, what the player can say back (0.82.0): the replies change, and while
-- the topic list is open the views are listed above it.
function V.ShowViews(choices)
  if not page then return end
  page.choices = choices
  if lastView then lastView.choices = choices end
  V.Refresh()
end

-- An answer keeps the topic list open (and its page), so the next question is one click.
-- What you said to get it (Admire, Joke, Taunt, Intimidate; 0.86.0) goes ahead of it.
function V.ShowAnswer(text, _, _, said)
  if not page then return end
  page.body, page.narr, page.said, page.reactions = text or "", nil, said, nil
  if lastView then lastView.text, lastView.narr, lastView.said = page.body, nil, said end
  V.Refresh()
end

function V.ShowReaction(text)
  if not page or not text or text == "" then return end
  page.reactions = page.reactions or {}
  page.reactions[#page.reactions + 1] = text
  V.Refresh()
end

-- Back to DialogueUI's own page.
-- Hide the window we opened, without that counting as the player closing it.
local function hideOwned()
  owned, page = false, nil
  local f = window()
  if f and f:IsShown() then
    hidingSelf = true
    pcall(f.Hide, f)
    hidingSelf = false
  end
end

function V.Hide()
  if owned then return hideOwned() end
  if not page then return end
  page = nil
  V.Refresh()
end

-- Forget the page without laying anything out (the game's next page is coming anyway).
-- A window we opened ourselves has no game page coming: it closes.
function V.Release()
  if owned then return hideOwned() end
  page = nil
end

-- The next Show opens DialogueUI's window itself (talk key, right-click: no game menu).
function V.Own() owned = true end
-- The game's own menu arrived after all (gossip after a right-click): the window is the
-- game's now, and closes with the interaction as usual.
function V.Adopt() owned = false end
function V.Owned() return owned end

function V.IsShown()
  local f = window()
  return page ~= nil and f ~= nil and f:IsShown()
end

function V.Frame() return nil end
function V.FlagSaved() end
function V.Rows() return rows end
