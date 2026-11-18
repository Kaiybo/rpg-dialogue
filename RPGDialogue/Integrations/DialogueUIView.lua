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
local page                  -- { text, choices, canAsk, asking }
local lastView              -- the last page asked for, to move it to the box if needed
local rows = {}             -- what each option button does, from the last layout

local function window() return C.DialogueUIFrame() end

-- Methods copied in by DialogueUI's mixin are fields of the window itself.
local function has(f, name) return type(rawget(f, name)) == "function" end

local function install(f)
  if installed then return true end
  for _, name in ipairs(HANDLERS) do
    local original = rawget(f, name)
    if type(original) == "function" then
      f[name] = function(self, ...)
        if page then
          local ok, laidOut = pcall(V.Layout, self)
          if ok and laidOut then return true end
          V.Broke(laidOut)
        end
        return original(self, ...)
      end
    end
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
  if p.asking then
    -- What the player can say back to the last answer (0.82.0), above the list.
    for i, c in ipairs(p.choices or {}) do
      if c.view then out[#out + 1] = { text = c.text, onClick = function() Conv.Choose(i) end } end
    end
    -- Every topic, a page at a time: "ask anyone" first, then what this person said they
    -- know about, then the rest, newest first.
    local s = Conv.session
    local key = s and s.memKey
    local all = ns.Topics.Known(false, key)
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
      if key and ns.Topics.NothingFrom(id, key) then suffix = " (" .. L.ASK_NOTHING .. ")"
      elseif key and ns.Topics.AskedOf(id, key) and not t.standard then suffix = " (" .. L.ASK_ASKED .. ")"
      elseif t.knows then suffix = " *" end
      out[#out + 1] = { text = t.name .. suffix, onClick = function() Conv.Ask(id) end }
    end
    if pg + 1 < pages then
      out[#out + 1] = { text = L.DUI_MORE:format(pg + 2, pages), gap = true,
        onClick = function() page.askPage = pg + 1; V.Refresh() end }
    end
    if pg > 0 then
      out[#out + 1] = { text = L.DUI_PREV, gap = pg + 1 >= pages,
        onClick = function() page.askPage = pg - 1; V.Refresh() end }
    end
    out[#out + 1] = { text = L.DUI_BACK, gap = true, onClick = function() page.asking = nil; page.askPage = nil; V.Refresh() end }
    return out
  end
  for i, c in ipairs(p.choices or {}) do
    out[#out + 1] = {
      text = (c.locked and (L.LOCKED_MARK .. " ") or "") .. c.text, icon = c.icon, locked = c.locked, gap = c.gap,
      onClick = function() Conv.Choose(i) end,
    }
  end
  if p.canAsk then
    local n = ns.Topics.Count()
    out[#out + 1] = { text = n > 0 and L.DUI_ASK_N:format(n) or L.DUI_ASK, gap = true,
      onClick = function() page.asking = true; page.askPage = 0; V.Refresh() end }
  end
  out[#out + 1] = { text = L.GET_ON_WITH_IT, gap = not p.canAsk, onClick = function() Conv.Business() end }
  -- Tone (0.85.0): the last row; a click moves to the next tone and rewords the replies.
  if p.tone then
    local name = L["TONE_" .. p.tone:upper()] or p.tone
    out[#out + 1] = { text = L.DUI_TONE:format(name), gap = true,
      onClick = function() Conv.SetTone(ns.Disposition.NextTone(p.tone)) end }
  end
  return out
end

-- Lay the page out in DialogueUI's window, the way its HandleGossip does.
function V.Layout(f)
  local p = page
  f:ReleaseAllObjects()
  f:UseQuestLayout(false)
  f.hasActiveGossipQuests, f.numAvailableQuests, f.keepGossipHistory = false, 0, false
  local offsetY, first, last = f:FormatParagraph(0, (p.text and p.text ~= "") and p.text or " ")
  if not first then error("FormatParagraph returned nothing") end
  local keys = keyListener(f)
  rows = buildRows(p)
  for i, r in ipairs(rows) do
    local b = f:AcquireOptionButton()
    local hotkey = (keys and i <= 9) and keys:SetIndexedAction(i, b) or nil
    b:SetGossip({ gossipOptionID = 0, orderIndex = 0, flags = 0, icon = TALK_ICON, name = r.text }, hotkey)
    if r.icon and b.Icon then
      if r.icon.atlas then b.Icon:SetAtlas(r.icon.atlas) else b.Icon:SetTexture(r.icon.file) end
    end
    b.shouldShowUIOnClick = false
    b.onClickFunc = function() V.Click(i) end
    if r.locked and b.Disable then b:Disable() end
    b:SetPoint("TOPLEFT", last, "BOTTOMLEFT", 0, (i == 1 or r.gap) and -SPACING or 0)
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

---------------------------------------------------------------------------
-- The same calls as the box (UI/DialogueFrame.lua)
---------------------------------------------------------------------------
function V.Show(v)
  if not V.Available() then return false end
  lastView = v
  page = { text = v.text, choices = v.choices, canAsk = v.canAsk, tone = v.tone }
  local f = window()
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
  page.choices, page.asking = choices, nil
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

-- After an answer, what the player can say back (0.82.0): the replies change, and while
-- the topic list is open the views are listed above it.
function V.ShowViews(choices)
  if not page then return end
  page.choices = choices
  if lastView then lastView.choices = choices end
  V.Refresh()
end

-- An answer keeps the topic list open (and its page), so the next question is one click.
function V.ShowAnswer(text)
  if not page then return end
  page.text = text or ""
  if lastView then lastView.text = page.text end
  V.Refresh()
end

function V.ShowReaction(text)
  if not page then return end
  page.text = (page.text or "") .. "\n\n" .. text
  V.Refresh()
end

-- Back to DialogueUI's own page.
function V.Hide()
  if not page then return end
  page = nil
  V.Refresh()
end

-- Forget the page without laying anything out (the game's next page is coming anyway).
function V.Release() page = nil end

function V.IsShown()
  local f = window()
  return page ~= nil and f ~= nil and f:IsShown()
end

function V.Frame() return nil end
function V.FlagSaved() end
function V.Rows() return rows end
