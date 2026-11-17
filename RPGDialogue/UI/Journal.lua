-- The journal: the character's own book, in their point of view (not the truth). Six
-- pages: Diary (what happened, day by day, place by place), Stories (the throughlines they've
-- stumbled into, and where each stands), People (who they've met, where, and how it stands),
-- Heard of (topics, and what people said when asked), Myself (where they stand, what they've
-- done), Notes.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local UI = ns.UI
local Theme = UI.Theme

local J = {}
ns.Journal = J
UI.Journal = J

local W, H = 660, 500
local TAB_W, TAB_STEP = 100, 104
local frame
local current = "chronicle"
local TABS = { "chronicle", "stories", "people", "heard", "sheet", "notes" }
-- Old page names (saved bindings, macros) land on the page that holds them now.
local ALIASES = { topics = "heard", deeds = "sheet", threads = "stories" }
-- Pages with a search box.
local SEARCHABLE = { chronicle = true, people = true, heard = true }
local switching   -- true while J.Show clears the search box on a page change

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

local HEAD, DIM, NOTE, PLACE = "|cff6b2f0f", "|cff8a6d3b", "|cff4a3a2a", "|cff7a4a1a"
local MONTHS = { "January", "February", "March", "April", "May", "June", "July", "August",
                 "September", "October", "November", "December" }
local DAYS = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }

-- "Tuesday, 15 November" for a timestamp (or "" when the client has no calendar).
local function dayName(t)
  local okDate, d = pcall(_G.date, "*t", t)
  if not okDate or type(d) ~= "table" then return "" end
  return ("%s, %d %s"):format(DAYS[d.wday] or "", d.day, MONTHS[d.month] or "")
end

local function heading(add, text)
  add(HEAD .. text .. "|r")
end

-- The diary: entries grouped under the day they were written, oldest first within a day
-- (newest day at the top), with the place written once each time it changes.
local function diary(add, c, search)
  local needle = search and search ~= "" and search:lower()
  local days, order = {}, {}
  for _, e in ipairs(c.journal) do
    local text = e.kind == "summary" and L.J_FOLDED:format(e.folded or 0) or (e.text or "")
    local place = (e.subzone and e.subzone ~= "") and e.subzone or e.zone or ""
    if text ~= "" and (not needle or text:lower():find(needle, 1, true) or place:lower():find(needle, 1, true)) then
      local key = dayName(e.t or 0)
      if not days[key] then days[key] = {}; order[#order + 1] = key end
      local list = days[key]
      list[#list + 1] = { text = e.otherHand and ("|cff7a5a8a" .. text .. "  " .. L.J_OTHER_HAND .. "|r") or text, place = place }
    end
  end
  for i = #order, 1, -1 do
    local key = order[i]
    heading(add, key ~= "" and key or L.J_UNDATED)
    local lastPlace
    for _, e in ipairs(days[key]) do
      if e.place ~= "" and e.place ~= lastPlace then add(DIM .. e.place .. "|r") end
      lastPlace = e.place
      add(e.text)
    end
    add(" ")
  end
end

local function matches(needle, ...)
  if not needle then return true end
  for i = 1, select("#", ...) do
    local v = select(i, ...)
    if type(v) == "string" and v:lower():find(needle, 1, true) then return true end
  end
  return false
end

local function voiceText(tpl, ctx)
  if type(tpl) ~= "table" then return nil end
  local voice = (ns.db and ns.db.settings.journalVoice) or "first"
  local text = tpl[voice] or tpl.first or tpl.third
  return text and ns.Tokens.Render(text, ctx or ns.Context.New({ spoof = {} }), {}) or nil
end

local function topicNames(ids)
  local out = {}
  for id in pairs(ids or {}) do
    local def = ns.Data.topics[id]
    if def and not def.standard then out[#out + 1] = def.name end
  end
  table.sort(out)
  return out
end

-- People, grouped by the zone where you last spoke with them (most recent zone first).
local function people(add, c, search)
  local needle = search and search ~= "" and search:lower()
  local groups, order = {}, {}
  for key, m in pairs(c.npc) do
    if (m.times or 0) > 0 then
      local def = ns.Data.npcs[key]
      local name = m.name or (def and def.name) or key
      local title = def and def.title
      local place = m.zone or L.J_ELSEWHERE
      if matches(needle, name, title, place) then
        if not groups[place] then groups[place] = { last = 0, list = {} }; order[#order + 1] = place end
        local g = groups[place]
        g.list[#g.list + 1] = { key = key, m = m, def = def, name = name, title = title }
        g.last = math.max(g.last, m.last or 0)
      end
    end
  end
  table.sort(order, function(a, b) return groups[a].last > groups[b].last end)
  local ctx = ns.Context.New({ spoof = {} })
  for _, place in ipairs(order) do
    local g = groups[place]
    table.sort(g.list, function(a, b) return (a.m.last or 0) > (b.m.last or 0) end)
    add(PLACE .. place:upper() .. "|r")
    add(" ")
    for _, p in ipairs(g.list) do
      heading(add, p.name .. (p.title and (DIM .. "  <" .. p.title .. ">|r") or ""))
      local word = affinityWord(p.m.affinity)
      local d = ns.Disposition and ns.Disposition.ForMemory(p.key)
      if d then word = ns.Disposition.TierName(d):lower() end
      add(L.J_PERSON:format(word, L.J_TALKED:format(p.m.times or 0), when(p.m.last)))
      if p.m.impressed and p.def and p.def.impression then
        local imp = voiceText(p.def.impression, ctx)
        if imp then add(NOTE .. imp .. "|r") end
      end
      -- Rivals (0.57.0): only the ones you've met, with where you stand with each.
      local rivals = {}
      for _, r in ipairs(ns.Disposition and ns.Disposition.Rivals(p.def) or {}) do
        local rm = c.npc[r]
        if rm and (rm.times or 0) > 0 then
          local rn = ns.Disposition.RivalName(r)
          local a = rm.affinity or 0
          rivals[#rivals + 1] = a > 0 and L.J_RIVAL_SIDED:format(rn) or a < 0 and L.J_RIVAL_CROSSED:format(rn) or rn
        end
      end
      if #rivals > 0 then add(DIM .. L.J_RIVALS:format(table.concat(rivals, ", ")) .. "|r") end
      local told = topicNames(p.m.topics)
      if #told > 0 then add(L.J_ASKED_ABOUT:format(table.concat(told, ", "))) end
      local line = p.m.lastLine and ns.Data.Line(p.m.lastLine)
      if line and line.text then add(L.J_LAST_SAID:format(ns.Tokens.Render(line.text, ctx, { info = { name = p.name } }))) end
      add(" ")
    end
  end
end

-- Stories: the throughlines heard so far, the live ones first.
local STATE_ORDER = { unfolding = 1, stirring = 2, resolved = 3, soured = 4, faded = 5 }
local function stories(add, c)
  local list = {}
  for id, t in pairs(c.threads or {}) do
    local def = ns.Data.threads[id]
    if def and t.state and t.state ~= "dormant" and next(t.beats or {}) then
      list[#list + 1] = { id = id, t = t, def = def }
    end
  end
  table.sort(list, function(a, b)
    local oa, ob = STATE_ORDER[a.t.state] or 9, STATE_ORDER[b.t.state] or 9
    if oa ~= ob then return oa < ob end
    return (a.t.lastT or 0) > (b.t.lastT or 0)
  end)
  local ctx = ns.Context.New({ spoof = {} })
  for _, s in ipairs(list) do
    local state = s.t.state
    heading(add, (s.def.title or s.def.id) .. "  " .. DIM .. (L["J_STORY_" .. state:upper()] or state) .. "|r")
    local story = s.def.story or {}
    -- A faded story reads as it stood when it was dropped.
    local text = voiceText(story[state] or (state == "faded" and (story.unfolding or story.stirring)), ctx)
    add(text or s.def.theme or "")
    -- Who told me what, in the order I heard it.
    local beats = {}
    for _, b in ipairs(s.def.beats or {}) do
      local at = s.t.beats[b.id]
      if at then beats[#beats + 1] = { b = b, at = at } end
    end
    table.sort(beats, function(x, y) return x.at < y.at end)
    for _, e in ipairs(beats) do
      local npc = ns.Data.npcs[e.b.npc]
      local who = (c.npc[e.b.npc] and c.npc[e.b.npc].name) or (npc and npc.name) or e.b.npc
      add(DIM .. L.J_STORY_BEAT:format(who, when(e.at)) .. "|r " .. NOTE .. "\"" .. ns.Tokens.Render(e.b.text or "", ctx, { info = { name = who } }) .. "\"|r")
    end
    add(" ")
  end
end

-- Heard of: every topic picked up, by category, with who first spoke of it and what
-- people said when asked.
local function heard(add, c, search)
  local needle = search and search ~= "" and search:lower()
  local cats, order = {}, {}
  for _, t in ipairs(ns.Topics.Known(true)) do
    if not t.standard then
      local rec = c.topics[t.id] or {}
      local def = ns.Data.topics[t.id]
      local blob = {}
      for _, a in ipairs(rec.said or {}) do
        local line = ns.Data.Line(a.gid)
        if line and line.text then blob[#blob + 1] = line.text end
      end
      if matches(needle, t.name, table.concat(blob, " "), def and def.learned) then
        local cat = t.category or "other"
        if not cats[cat] then cats[cat] = {}; order[#order + 1] = cat end
        table.insert(cats[cat], t)
      end
    end
  end
  table.sort(order, function(a, b) return ns.Topics.CategoryName(a) < ns.Topics.CategoryName(b) end)
  local ctx = ns.Context.New({ spoof = {} })
  for _, cat in ipairs(order) do
    add(PLACE .. ns.Topics.CategoryName(cat):upper() .. "|r")
    add(" ")
    table.sort(cats[cat], function(a, b) return a.name < b.name end)
    for _, t in ipairs(cats[cat]) do
      local src = ns.Topics.Source(t.id)
      heading(add, t.name .. (src and (DIM .. "  " .. L.J_HEARD_FROM:format(src) .. "|r") or ""))
      local rec = c.topics[t.id] or {}
      local said = rec.said or {}
      if #said == 0 then
        add(DIM .. L.J_NOT_ASKED .. "|r")
      else
        for i = #said, 1, -1 do
          local a = said[i]
          local line = ns.Data.Line(a.gid)
          if line and line.text then
            local who = a.name or (c.npc[a.who] and c.npc[a.who].name) or a.who
            add(L.J_SAID:format(who, ns.Tokens.Render(line.text, ctx, { info = { name = who } })))
          end
        end
      end
      add(" ")
    end
  end
end

local function myself(add, c)
  local a = c.align
  local alignTitle = ns.Effects.TitleName()
  heading(add, L.J_ALIGNMENT .. (alignTitle and ("  (" .. alignTitle .. ")") or ""))
  add(axisWords(a.light or 0, L.AX_LIGHT, L.AX_SHADOW))
  add(axisWords(a.order or 0, L.AX_ORDER, L.AX_WILD))
  add(axisWords(a.honor or 0, L.AX_HONOR, L.AX_CUNNING))
  if (a.taint or 0) > 0 then add(a.taint >= 40 and L.TAINT_STRONG or L.TAINT_FAINT) end
  local dom = ns.Effects.DominantTraits()
  if #dom > 0 then add(L.J_TRAITS .. " " .. table.concat(dom, ", ")) end
  add(" ")
  local function section(title, lines)
    if #lines == 0 then return end
    heading(add, title)
    for _, l in ipairs(lines) do add(l) end
    add(" ")
  end
  local lines = {}
  for topic, o in pairs(c.opinions) do
    local def = ns.Data.topics[topic]
    lines[#lines + 1] = (def and def.name or topic) .. ": " .. tostring(o.stance):gsub("_", " ") .. (o.contradicts and (" " .. L.J_CONTRADICTED) or "")
  end
  table.sort(lines)
  section(L.J_OPINIONS, lines)
  lines = {}
  for id in pairs(c.towns) do
    local town = ns.Data.towns[id]
    lines[#lines + 1] = (town and town.name or id) .. ": " .. ns.Towns.TierName(id)
  end
  table.sort(lines)
  section(L.J_TOWNS, lines)
  lines = {}
  for id, rec in pairs(c.claims.heard) do
    local def = ns.Data.claims[id]
    local who = def and def.by and ns.Data.npcs[def.by] and ns.Data.npcs[def.by].name or tostring(rec.npc or "?")
    lines[#lines + 1] = L.J_INSISTS:format(who, def and def.text or id) .. (c.claims.exposed[id] and (" " .. L.J_SETTLED) or "")
  end
  table.sort(lines)
  section(L.J_CLAIMS, lines)
  local nTopics = 0
  for _, t in ipairs(ns.Topics.Known(true)) do if not t.standard then nTopics = nTopics + 1 end end
  if nTopics > 0 then section(L.J_TOPICS, { L.J_TOPICS_COUNT:format(nTopics) }) end
  lines = {}
  for title in pairs(c.books) do lines[#lines + 1] = title end
  table.sort(lines)
  section(L.J_BOOKS, lines)
  local deeds = {}
  for id, d in pairs(c.deeds) do deeds[#deeds + 1] = { id = id, t = d.t or 0, n = d.n or 1 } end
  table.sort(deeds, function(x, y) return x.t > y.t end)
  lines = {}
  for _, d in ipairs(deeds) do lines[#lines + 1] = deedName(d.id) .. (d.n > 1 and (" ×" .. d.n) or "") .. "  " .. DIM .. when(d.t) .. "|r" end
  if (c.deathCount or 0) > 0 then lines[#lines + 1] = L.J_DEATHS:format(c.deathCount) end
  section(L.J_DEEDS, lines)
  heading(add, L.J_ORIGIN .. "  " .. (c.origin and c.origin.name or L.J_NO_ORIGIN))
  if c.origin and c.origin.blurb then add(c.origin.blurb) end
end

function J.Text(tab, search)
  tab = ALIASES[tab] or tab
  local c = ns.char
  local out = {}
  local function add(s) out[#out + 1] = s end
  if tab == "chronicle" then
    diary(add, c, search)
    if #out == 0 then add(L.J_EMPTY) end
  elseif tab == "people" then
    people(add, c, search)
    if #out == 0 then add((search and search ~= "") and L.J_NO_MATCH or L.J_NOBODY) end
  elseif tab == "stories" then
    stories(add, c)
    if #out == 0 then add(L.J_NO_STORIES) end
  elseif tab == "heard" then
    heard(add, c, search)
    if #out == 0 then add((search and search ~= "") and L.J_NO_MATCH or L.J_NOTHING_HEARD) end
  elseif tab == "sheet" then
    myself(add, c)
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
    local b = Theme.Button(frame, "", TAB_W, 22)
    b:SetText(L["J_TAB_" .. id:upper()])
    b:SetScript("OnClick", function() J.Show(id) end)
    frame.tabs[id] = b
  end

  frame.search = CreateFrame("EditBox", nil, frame, C.Template("editbox"))
  frame.search:SetSize(200, 20)
  frame.search:SetAutoFocus(false)
  frame.search:SetScript("OnTextChanged", function() if SEARCHABLE[current] and not switching then J.Show(current) end end)
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
    b:SetPoint("TOPLEFT", 14 + (i - 1) * TAB_STEP, game and -32 or -40)
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
  local target = ALIASES[tab] or tab or current
  if target ~= current and not switching then
    switching = true
    frame.search:SetText("")
    switching = false
  end
  current = target
  frame.title:SetText(L.J_TITLE)
  J.Style()
  local isNotes = current == "notes"
  local isSheet = current == "sheet"
  frame.notes:SetShown(isNotes)
  frame.text:SetShown(not isNotes)
  frame.search:SetShown(SEARCHABLE[current] == true)
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
  J.MarkRead()
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

-- Unread diary entries (the journal button shows a count).
function J.Unread()
  local c = ns.char
  if not c or not c.journal then return 0 end
  return math.max(0, #c.journal - (c.journalRead or 0))
end

function J.MarkRead()
  local c = ns.char
  if not c or not c.journal then return end
  c.journalRead = #c.journal
  if ns.UI.Launcher and ns.UI.Launcher.UpdateBadge then ns.UI.Launcher.UpdateBadge() end
end

function J.Current() return current end
function J.Frame() return frame end

function J.Toggle()
  if frame and frame:IsShown() then frame:Hide() else J.Show() end
end

function J.IsShown() return frame ~= nil and frame:IsShown() end
