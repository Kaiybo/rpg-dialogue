-- The journal: the character's point of view, not the truth. Tabs: Chronicle, People I've
-- Met, Character Sheet (with the Origin page), Topics, Deeds, Notes.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local UI = ns.UI
local Theme = UI.Theme

local J = {}
ns.Journal = J
UI.Journal = J

local W, H = 560, 480
local frame
local current = "chronicle"
local TABS = { "chronicle", "people", "sheet", "topics", "deeds", "notes" }

---------------------------------------------------------------------------
-- Text builders (pure: also used by tests)
---------------------------------------------------------------------------
local function when(t)
  if not t or t == 0 then return "" end
  local days = math.floor((C.Now() - t) / 86400)
  if days <= 0 then return L.J_TODAY elseif days == 1 then return L.J_YESTERDAY end
  return L.J_DAYS_AGO:format(days)
end

local function affinityWord(a)
  a = a or 0
  if a <= -5 then return L.AFF_HOSTILE elseif a <= -2 then return L.AFF_WARY elseif a < 2 then return L.AFF_NEUTRAL
  elseif a < 5 then return L.AFF_WARM end
  return L.AFF_FOND
end

local function axisWords(v, pos, neg)
  local mag = math.abs(v)
  local side = v >= 0 and pos or neg
  if mag < 10 then return L.ALIGN_BALANCED:format(pos, neg) end
  local strength = mag < 30 and L.ALIGN_LEANING or (mag < 60 and L.ALIGN_FIRMLY or L.ALIGN_DEEPLY)
  return strength:format(side)
end

local DEED_NAMES = {
  first_death = function() return L.DEED_FIRST_DEATH end,
}

local function deedName(id)
  if DEED_NAMES[id] then return DEED_NAMES[id]() end
  local kind, arg = id:match("^(%a+):(.+)$")
  if kind == "level" then return L.DEED_LEVEL:format(arg) end
  if kind == "zone" then return L.DEED_ZONE:format(arg) end
  if kind == "dungeon" then return L.DEED_DUNGEON:format(arg) end
  if kind == "kill" then
    local cap = ns.db.capture.npcs[tonumber(arg)]
    return L.DEED_KILL:format(cap and cap.name or ("#" .. arg))
  end
  return id
end

function J.Text(tab, search)
  local c = ns.char
  local out = {}
  local function add(s) out[#out + 1] = s end
  if tab == "chronicle" then
    local needle = search and search ~= "" and search:lower()
    for i = #c.journal, 1, -1 do
      local e = c.journal[i]
      local text = e.kind == "summary" and L.J_FOLDED:format(e.folded or 0) or (e.text or "")
      if not needle or text:lower():find(needle, 1, true) or (e.zone or ""):lower():find(needle, 1, true) then
        add("|cff8a6d3b" .. when(e.t) .. (e.subzone and e.subzone ~= "" and (" · " .. e.subzone) or (e.zone and (" · " .. e.zone) or "")) .. "|r")
        add(e.otherHand and ("|cff7a5a8a" .. text .. "  " .. L.J_OTHER_HAND .. "|r") or text)
        add(" ")
      end
    end
    if #out == 0 then add(L.J_EMPTY) end
  elseif tab == "people" then
    local list = {}
    for key, m in pairs(c.npc) do
      if (m.times or 0) > 0 then list[#list + 1] = { key = key, m = m } end
    end
    table.sort(list, function(a, b) return (a.m.last or 0) > (b.m.last or 0) end)
    for _, p in ipairs(list) do
      local name = p.m.name or p.key
      add("|cff6b2f0f" .. name .. "|r  " .. affinityWord(p.m.affinity) .. " · " .. L.J_TALKED:format(p.m.times or 0) .. " · " .. when(p.m.last))
      local line = p.m.lastLine and ns.Data.Line(p.m.lastLine)
      if line and line.text then add("  \"" .. ns.Tokens.Render(line.text, ns.Context.New({ spoof = {} }), { info = { name = name } }) .. "\"") end
      add(" ")
    end
    if #list == 0 then add(L.J_NOBODY) end
  elseif tab == "sheet" then
    local a = c.align
    local title = ns.Effects.TitleName()
    add("|cff6b2f0f" .. L.J_ALIGNMENT .. "|r" .. (title and ("  (" .. title .. ")") or ""))
    add("  " .. axisWords(a.light or 0, L.AX_LIGHT, L.AX_SHADOW))
    add("  " .. axisWords(a.order or 0, L.AX_ORDER, L.AX_WILD))
    add("  " .. axisWords(a.honor or 0, L.AX_HONOR, L.AX_CUNNING))
    if (a.taint or 0) > 0 then add("  " .. (a.taint >= 40 and L.TAINT_STRONG or L.TAINT_FAINT)) end
    add(" ")
    local dom = ns.Effects.DominantTraits()
    add("|cff6b2f0f" .. L.J_TRAITS .. "|r  " .. (#dom > 0 and table.concat(dom, ", ") or L.J_NONE_YET))
    add(" ")
    add("|cff6b2f0f" .. L.J_OPINIONS .. "|r")
    local any = false
    for topic, o in pairs(c.opinions) do
      any = true
      local def = ns.Data.topics[topic]
      add("  " .. (def and def.name or topic) .. ": " .. tostring(o.stance):gsub("_", " ") .. (o.contradicts and (" " .. L.J_CONTRADICTED) or ""))
    end
    if not any then add("  " .. L.J_NONE_YET) end
    add(" ")
    add("|cff6b2f0f" .. L.J_TOWNS .. "|r")
    any = false
    for id in pairs(c.towns) do
      any = true
      local town = ns.Data.towns[id]
      add("  " .. (town and town.name or id) .. ": " .. ns.Towns.TierName(id))
    end
    if not any then add("  " .. L.J_NONE_YET) end
    add(" ")
    add("|cff6b2f0f" .. L.J_ORIGIN .. "|r  " .. (c.origin and c.origin.name or L.J_NO_ORIGIN))
    if c.origin and c.origin.blurb then add("  " .. c.origin.blurb) end
  elseif tab == "topics" then
    -- What each person said about a topic (their latest answer), newest first, plain text.
    local function said(id)
      local rec = c.topics[id]
      if not rec or not rec.said then return end
      local list = {}
      for _, v in pairs(rec.said) do list[#list + 1] = v end
      table.sort(list, function(x, y) return (x.t or 0) > (y.t or 0) end)
      for _, v in ipairs(list) do
        local line = ns.Data.Line(v.gid)
        local text = v.text or (line and line.text)
        if text then add("  " .. L.J_TOPIC_SAID:format(v.name or "?", ns.Topics.Plain(text))) end
      end
    end
    local core, learned = {}, {}
    for _, t in ipairs(ns.Topics.Known(true)) do
      if t.core then core[#core + 1] = t else learned[#learned + 1] = t end
    end
    if #core > 0 then
      local names = {}
      for _, t in ipairs(core) do names[#names + 1] = t.name end
      add("|cff6b2f0f" .. L.J_CORE .. "|r  " .. table.concat(names, ", "))
      add(" ")
    end
    for _, t in ipairs(learned) do
      add("|cff6b2f0f" .. t.name .. "|r  (" .. t.category .. ")")
      said(t.id)
    end
    if #learned == 0 then add(L.J_NO_TOPICS) end
    add(" ")
    add("|cff6b2f0f" .. L.J_CLAIMS .. "|r")
    local any = false
    for id, rec in pairs(c.claims.heard) do
      any = true
      local def = ns.Data.claims[id]
      local who = def and def.by and ns.Data.npcs[def.by] and ns.Data.npcs[def.by].name or tostring(rec.npc or "?")
      local settled = c.claims.exposed[id] and (" " .. L.J_SETTLED) or ""
      add("  " .. L.J_INSISTS:format(who, def and def.text or id) .. settled)
    end
    if not any then add("  " .. L.J_NONE_YET) end
    add(" ")
    add("|cff6b2f0f" .. L.J_BOOKS .. "|r")
    any = false
    for title in pairs(c.books) do any = true; add("  " .. title) end
    if not any then add("  " .. L.J_NONE_YET) end
  elseif tab == "deeds" then
    local list = {}
    for id, d in pairs(c.deeds) do list[#list + 1] = { id = id, t = d.t or 0, n = d.n or 1 } end
    table.sort(list, function(x, y) return x.t > y.t end)
    for _, d in ipairs(list) do add(deedName(d.id) .. (d.n > 1 and (" ×" .. d.n) or "") .. "  |cff8a6d3b" .. when(d.t) .. "|r") end
    if (c.deathCount or 0) > 0 then add(L.J_DEATHS:format(c.deathCount)) end
    if #out == 0 then add(L.J_NO_DEEDS) end
  end
  return table.concat(out, "\n")
end

---------------------------------------------------------------------------
-- Window
---------------------------------------------------------------------------
local function create()
  frame = CreateFrame("Frame", nil, UIParent)
  frame:SetSize(W, H)
  frame:SetPoint("CENTER")
  frame:SetFrameStrata("HIGH")
  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:SetClampedToScreen(true)
  frame:RegisterForDrag("LeftButton")
  frame:SetScript("OnDragStart", frame.StartMoving)
  frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
  frame:Hide()
  Theme.Decorate(frame, 7, { chrome = "frame" })

  -- Keyboard: Escape closes, Left/Right switch tabs. Gamepad: D-pad left/right, B closes.
  frame:EnableKeyboard(true)
  frame:SetPropagateKeyboardInput(true)
  frame:SetScript("OnKeyDown", function(self, key) J.OnKey(self, key) end)
  C.SetGamePadHandler(frame, function(self, button)
    if button == "PADDLEFT" then J.OnKey(self, "LEFT")
    elseif button == "PADDRIGHT" then J.OnKey(self, "RIGHT")
    elseif button == "PAD2" then J.OnKey(self, "ESCAPE")
    end
  end)
  frame:SetScript("OnHide", function() C.GamePadButtons(frame, false) end)

  frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.title:SetDrawLayer("OVERLAY", 7)
  frame.close = Theme.CloseButton(frame)
  frame.close:SetScript("OnClick", function() frame:Hide() end)

  frame.tabs = {}
  for _, id in ipairs(TABS) do
    local b = Theme.Button(frame, "", 84, 22)
    b:SetText(L["J_TAB_" .. id:upper()])
    b:SetScript("OnClick", function() J.Show(id) end)
    frame.tabs[id] = b
  end

  frame.search = CreateFrame("EditBox", nil, frame, C.Template("editbox"))
  frame.search:SetSize(200, 20)
  frame.search:SetAutoFocus(false)
  frame.search:SetScript("OnTextChanged", function() if current == "chronicle" then J.Show("chronicle") end end)
  frame.search:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)

  frame.scroll = CreateFrame("ScrollFrame", nil, frame, C.Template("scroll"))
  frame.scroll:SetPoint("TOPLEFT", 18, -98)
  frame.scroll:SetPoint("BOTTOMRIGHT", -36, 50)
  frame.content = CreateFrame("Frame", nil, frame.scroll)
  frame.content:SetSize(W - 70, 10)
  frame.scroll:SetScrollChild(frame.content)
  frame.text = frame.content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.text:SetPoint("TOPLEFT")
  frame.text:SetWidth(W - 74)
  frame.text:SetJustifyH("LEFT")
  frame.text:SetJustifyV("TOP")

  -- Notes: the player's own writing.
  frame.notes = CreateFrame("EditBox", nil, frame.content)
  frame.notes:SetFontObject("ChatFontNormal")  -- an EditBox needs a font before any text
  frame.notes:SetMultiLine(true)
  frame.notes:SetAutoFocus(false)
  frame.notes:SetWidth(W - 74)
  frame.notes:SetHeight(300)
  frame.notes:SetPoint("TOPLEFT")
  frame.notes:SetScript("OnTextChanged", function(self) ns.char.notes = self:GetText() end)
  frame.notes:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
  frame.notes:Hide()

  -- Origin page controls (Character Sheet)
  frame.originButtons = {}
  frame.originLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.originLabel:SetPoint("BOTTOMLEFT", 18, 30)
  frame.blurb = CreateFrame("EditBox", nil, frame, C.Template("editbox"))
  frame.blurb:SetSize(W - 140, 20)
  frame.blurb:SetPoint("BOTTOMLEFT", 22, 8)
  frame.blurb:SetAutoFocus(false)
  frame.blurb:SetScript("OnEnterPressed", function(self) ns.Origins.SetBlurb(self:GetText()); self:ClearFocus(); J.Show("sheet") end)
  frame.blurb:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
  frame.originBtn = Theme.Button(frame, "", 100, 22)
  frame.originBtn:SetPoint("BOTTOMRIGHT", -14, 8)
  frame.originBtn:SetScript("OnClick", function() J.CycleOrigin() end)
end

local pendingOrigin, originIndex
-- Origin picking: one button cycles through the list for this race and class, a second
-- click confirms (changing an existing origin always asks first).
function J.CycleOrigin()
  local _, race = C.Race("player")
  local _, class = C.Class("player")
  local list = ns.Origins.ListFor(race, class)
  if pendingOrigin then
    ns.Origins.Choose(pendingOrigin.id, frame.blurb:GetText() ~= "" and frame.blurb:GetText() or pendingOrigin.blurb)
    pendingOrigin = nil
    J.Show("sheet")
    return
  end
  originIndex = ((originIndex or 0) % #list) + 1
  local o = list[originIndex]
  frame.originLabel:SetText(L.J_ORIGIN_PICK:format(o.name))
  frame.blurb:SetText(o.blurb or "")
  frame.originBtn:SetText(L.J_ORIGIN_CONFIRM)
  pendingOrigin = o
  C.After(6, function()
    if pendingOrigin == o then pendingOrigin = nil; frame.originBtn:SetText(L.J_ORIGIN_NEXT) end
  end)
end

-- Game look: title in the title bar, tabs and search on the rock header, the pages on
-- parchment below. Wood look: everything on the wood-framed parchment.
local GAME_INSET_TOP = 90
local function placeParts(game)
  frame.title:ClearAllPoints()
  frame.close:ClearAllPoints()
  frame.search:ClearAllPoints()
  if game then
    frame.title:SetPoint("TOPLEFT", 12, -5)
    frame.title:SetPoint("TOPRIGHT", -24, -5)
    frame.title:SetJustifyH("CENTER")
    frame.close:SetPoint("TOPRIGHT", 1, 0)
    frame.search:SetPoint("TOPRIGHT", -24, -64)
    local inset = Theme.GamePart(frame, "inset")
    if inset then
      inset:ClearAllPoints()
      inset:SetPoint("TOPLEFT", 4, -GAME_INSET_TOP)
      inset:SetPoint("BOTTOMRIGHT", -6, 4)
    end
    Theme.FitPaper(frame, W - 10, H - GAME_INSET_TOP - 4)
  else
    frame.title:SetPoint("TOPLEFT", 18, -14)
    frame.title:SetJustifyH("LEFT")
    frame.close:SetPoint("TOPRIGHT", -12, -12)
    frame.search:SetPoint("TOPRIGHT", -24, -70)
  end
  for i, id in ipairs(TABS) do
    local b = frame.tabs[id]
    b:ClearAllPoints()
    b:SetPoint("TOPLEFT", 14 + (i - 1) * 88, game and -32 or -40)
  end
end

function J.Style()
  local size = Theme.TextSize()
  local game = Theme.IsGame()
  Theme.Recolor(frame)
  placeParts(game)
  Theme.StyleButton(frame.close, 12)
  Theme.StyleButton(frame.originBtn)
  for _, b in pairs(frame.tabs) do Theme.StyleButton(b) end
  Theme.SetFont(frame.title, "name", game and 13 or size + 6)
  Theme.Shadow(frame.title, game)
  Theme.TextColor(frame.title, game and "title" or "name")
  Theme.SetFont(frame.text, "body", size)
  Theme.TextColor(frame.text, "text")
  frame.text:SetSpacing(ns.db.settings.lineSpacing or 3)
  frame.notes:SetFont(Theme.BodyFont(), size, "")
  frame.notes:SetShadowOffset(0, 0)
  frame.notes:SetTextColor(Theme.Palette().text[1], Theme.Palette().text[2], Theme.Palette().text[3])
  Theme.SetFont(frame.originLabel, "body", size - 1)
  Theme.TextColor(frame.originLabel, "subtitle")
  frame:SetScale(ns.db.settings.scale or 1)
end

function J.Show(tab)
  if not frame then create() end
  current = tab or current
  frame.title:SetText(L.J_TITLE)
  J.Style()
  local isNotes = current == "notes"
  local isSheet = current == "sheet"
  frame.notes:SetShown(isNotes)
  frame.text:SetShown(not isNotes)
  frame.search:SetShown(current == "chronicle")
  frame.originLabel:SetShown(isSheet)
  frame.blurb:SetShown(isSheet)
  frame.originBtn:SetShown(isSheet)
  if isNotes then
    frame.notes:SetText(ns.char.notes or "")
  else
    frame.text:SetText(J.Text(current, frame.search:GetText()))
    frame.content:SetHeight((frame.text:GetStringHeight() or 100) + 20)
  end
  for id, b in pairs(frame.tabs) do
    local label = L["J_TAB_" .. id:upper()]
    b:SetText(id == current and ("> " .. label) or label)
    if id == current then b:LockHighlight() else b:UnlockHighlight() end
  end
  C.GamePadButtons(frame, ns.db.settings.gamepad ~= false and C.GamePadEnabled())
  if isSheet then
    local o = ns.char.origin
    frame.originLabel:SetText(o and L.J_ORIGIN_CURRENT:format(o.name) or L.J_ORIGIN_NONE)
    frame.blurb:SetText(o and o.blurb or "")
    frame.originBtn:SetText(o and L.J_ORIGIN_CHANGE or L.J_ORIGIN_NEXT)
    pendingOrigin, originIndex = nil, nil
  end
  frame:Show()
end

function J.OnKey(self, key)
  local handled = false
  if C.InCombat() then
    handled = false
  elseif key == "ESCAPE" then
    handled = true
    frame:Hide()
  elseif key == "LEFT" or key == "RIGHT" then
    handled = true
    local idx = 1
    for i, id in ipairs(TABS) do if id == current then idx = i end end
    idx = (idx - 1 + (key == "RIGHT" and 1 or -1)) % #TABS + 1
    J.Show(TABS[idx])
  end
  self:SetPropagateKeyboardInput(not handled)
end

function J.Current() return current end
function J.Frame() return frame end

function J.Toggle()
  if frame and frame:IsShown() then frame:Hide() else J.Show() end
end

function J.IsShown() return frame ~= nil and frame:IsShown() end
