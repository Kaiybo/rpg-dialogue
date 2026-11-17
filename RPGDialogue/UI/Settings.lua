-- Settings panel (game Settings > AddOns > RPG Dialogue, or /rpgd settings).
-- Controls are built from plain widgets (no dropdown templates, which are taint-prone).
local _, ns = ...

local C = ns.Compat
local L = ns.L
local UI = ns.UI

local Settings = {}
ns.Settings = Settings

local panel, content, category
local controls = {}
local y

local function s() return ns.db.settings end

local function refreshUI()
  UI.Dialogue.Restyle()
  if UI.AskAbout.IsShown() then UI.AskAbout.Style() end
end

local LEFT, CONTROL_X, WIDTH = 16, 320, 600

-- Sub-options are greyed out while the option they belong to is off.
local function setEnabled(c, on)
  local a = on and 1 or 0.4
  if c.SetEnabled then c:SetEnabled(on) elseif on and c.Enable then c:Enable() elseif c.Disable then c:Disable() end
  c:SetAlpha(a)
  if c.label then c.label:SetAlpha(a) end
  if c.value then c.value:SetAlpha(a) end
end

local function refreshDeps()
  for _, c in ipairs(controls) do
    if c.dependsOn then setEnabled(c, s()[c.dependsOn] ~= false and s()[c.dependsOn] ~= nil) end
  end
end

local function header(text)
  y = y - 10
  local fs = content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  fs:SetPoint("TOPLEFT", LEFT, y)
  fs:SetText(text)
  local line = content:CreateTexture(nil, "ARTWORK")
  line:SetHeight(1)
  line:SetPoint("TOPLEFT", LEFT, y - 22)
  line:SetPoint("TOPRIGHT", content, "TOPLEFT", WIDTH - 20, y - 22)
  line:SetColorTexture(1, 0.82, 0, 0.25)
  y = y - 32
end

local function note(text, indent)
  local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  fs:SetPoint("TOPLEFT", LEFT + 4 + (indent or 0), y)
  fs:SetWidth(WIDTH - 40)
  fs:SetJustifyH("LEFT")
  fs:SetTextColor(0.7, 0.7, 0.7)
  fs:SetText(text)
  y = y - (fs:GetStringHeight() or 12) - 8
end

-- opts: onChange, dependsOn (another setting's key), indent
local function checkbox(label, key, opts)
  opts = opts or {}
  local indent = opts.dependsOn and 20 or 0
  local b = CreateFrame("CheckButton", nil, content)
  b:SetSize(22, 22)
  b:SetPoint("TOPLEFT", LEFT + indent, y)
  b:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
  b:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
  b:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight", "ADD")
  b:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
  b.label = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  b.label:SetPoint("LEFT", b, "RIGHT", 4, 0)
  b.label:SetWidth(WIDTH - 60 - indent)
  b.label:SetJustifyH("LEFT")
  b.label:SetText(label)
  b:SetScript("OnClick", function(self)
    s()[key] = self:GetChecked() and true or false
    if opts.onChange then opts.onChange(s()[key]) end
    refreshDeps()
    refreshUI()
  end)
  b.refresh = function() b:SetChecked(s()[key] == true) end
  b.dependsOn = opts.dependsOn
  controls[#controls + 1] = b
  local h = b.label:GetStringHeight() or 14
  y = y - math.max(26, h + 10)
  return b
end

-- Label on the left, the slider in the control column, the value to its right.
-- show(v) turns the stored value into what the player reads ("35%", "4 s").
local function slider(label, key, min, max, step, show, opts)
  opts = opts or {}
  local indent = opts.dependsOn and 20 or 0
  local sl = CreateFrame("Slider", nil, content)
  sl.label = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  sl.label:SetPoint("TOPLEFT", LEFT + 4 + indent, y - 2)
  sl.label:SetWidth(CONTROL_X - LEFT - 12 - indent)
  sl.label:SetJustifyH("LEFT")
  sl.label:SetText(label)
  sl:SetOrientation("HORIZONTAL")
  sl:SetSize(190, 16)
  sl:SetPoint("TOPLEFT", CONTROL_X, y)
  sl:SetMinMaxValues(min, max)
  sl:SetValueStep(step)
  sl:SetObeyStepOnDrag(true)
  sl:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal")
  local track = sl:CreateTexture(nil, "BACKGROUND")
  track:SetPoint("LEFT"); track:SetPoint("RIGHT"); track:SetHeight(6)
  track:SetColorTexture(0.3, 0.3, 0.3, 0.8)
  sl.value = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  sl.value:SetPoint("LEFT", sl, "RIGHT", 10, 0)
  local function text(v) sl.value:SetText(show and show(v) or tostring(v)) end
  sl:SetScript("OnValueChanged", function(_, v)
    v = math.floor(v / step + 0.5) * step
    s()[key] = v
    text(v)
    refreshUI()
  end)
  sl.refresh = function() sl:SetValue(s()[key] or min); text(s()[key] or min) end
  sl.dependsOn = opts.dependsOn
  controls[#controls + 1] = sl
  local h = sl.label:GetStringHeight() or 14
  y = y - math.max(30, h + 12)
  return sl
end

local function percent(v) return string.format("%d%%", math.floor(v * 100 + 0.5)) end
local function times(v) return string.format("%.2fx", v) end
local function seconds(v) return string.format("%d s", v) end

-- A font picker: a button that cycles through the fonts, and a sample line underneath
-- in the chosen font.
local function fontPicker(label, key, kind)
  local text = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  text:SetPoint("TOPLEFT", LEFT + 4, y - 4)
  text:SetText(label)
  local choices = UI.Theme.FontChoices(kind)
  local b = CreateFrame("Button", nil, content, C.Template("button"))
  b:SetSize(240, 22)
  b:SetPoint("TOPLEFT", CONTROL_X, y)
  local sample = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  sample:SetPoint("TOPLEFT", CONTROL_X + 4, y - 26)
  sample:SetWidth(WIDTH - CONTROL_X - 10)
  sample:SetJustifyH("LEFT")
  local function show()
    local cur = s()[key]
    for _, c in ipairs(choices) do if c.id == cur then b:SetText(c.label) end end
    UI.Theme.SetFont(sample, kind, 15)
    sample:SetText(kind == "name" and "Melika Isenstrider" or L.FONT_PREVIEW)
  end
  b:SetScript("OnClick", function()
    local idx = 0
    for i, c in ipairs(choices) do if c.id == s()[key] then idx = i end end
    s()[key] = choices[idx % #choices + 1].id
    show()
    refreshUI()
  end)
  b.refresh = show
  controls[#controls + 1] = b
  y = y - 52
  return b
end

-- A button that cycles through values (instead of a dropdown).
local function cycle(label, key, values, labels, opts)
  opts = opts or {}
  local text = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  text:SetPoint("TOPLEFT", LEFT + 4, y - 4)
  text:SetWidth(CONTROL_X - LEFT - 12)
  text:SetJustifyH("LEFT")
  text:SetText(label)
  local b = CreateFrame("Button", nil, content, C.Template("button"))
  b:SetSize(240, 22)
  b:SetPoint("TOPLEFT", CONTROL_X, y)
  local function show()
    for i, v in ipairs(values) do if v == s()[key] then b:SetText(labels[i]) end end
  end
  b:SetScript("OnClick", function()
    local idx = 1
    for i, v in ipairs(values) do if v == s()[key] then idx = i end end
    s()[key] = values[idx % #values + 1]
    show()
    if opts.onChange then opts.onChange(s()[key]) end
    refreshUI()
  end)
  b.refresh = show
  controls[#controls + 1] = b
  y = y - 28
  return b
end

-- A row of plain action buttons.
local function actions(list)
  local x = LEFT
  for _, a in ipairs(list) do
    local b = CreateFrame("Button", nil, content, C.Template("button"))
    b:SetSize(a.width or 170, 22)
    b:SetPoint("TOPLEFT", x, y)
    b:SetText(a.text)
    b:SetScript("OnClick", a.func)
    x = x + (a.width or 170) + 8
  end
  y = y - 32
end

local function build()
  panel = CreateFrame("Frame")
  panel.name = L.ADDON_NAME
  local scroll = CreateFrame("ScrollFrame", nil, panel, C.Template("scroll"))
  scroll:SetPoint("TOPLEFT", 4, -8)
  scroll:SetPoint("BOTTOMRIGHT", -28, 8)
  content = CreateFrame("Frame", nil, scroll)
  content:SetSize(WIDTH, 1400)
  scroll:SetScrollChild(content)
  y = -8

  local title = content:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
  title:SetPoint("TOPLEFT", LEFT, y)
  title:SetText(L.ADDON_NAME .. "  |cff8a8a8a" .. ns.VERSION .. "|r")
  y = y - 34
  actions({
    { text = L.OPT_OPEN_JOURNAL, func = function() if ns.Journal and ns.Journal.Toggle then ns.Journal.Toggle() end end },
    { text = L.OPT_RESET_BUTTON, width = 220, func = function() ns.UI.Launcher.ResetPosition() end },
  })

  -- General: whether and when the box opens.
  header(L.OPT_HEADER_GENERAL)
  checkbox(L.OPT_ENABLED, "enabled")
  cycle(L.OPT_OPEN_MODE, "openMode", { "full", "compact", "skip" }, { L.OPEN_FULL, L.OPEN_COMPACT, L.OPEN_SKIP })
  checkbox(L.OPT_RIGHT_CLICK, "rightClickTalk")
  checkbox(L.OPT_PAGES, "pagesInBox")
  checkbox(L.OPT_FADE, "fadeDefault")

  -- Look and text: the things people change most (also from the box's "Aa" button).
  header(L.OPT_HEADER_TEXT)
  cycle(L.OPT_LOOK, "look", { "game", "wood" }, { L.LOOK_GAME, L.LOOK_WOOD })
  if not UI.Theme.GameArt() then note(L.OPT_LOOK_MISSING) end
  slider(L.OPT_SCALE, "scale", 0.7, 1.5, 0.05, times)
  slider(L.OPT_TEXT_SIZE, "textSize", 10, 24, 1)
  slider(L.OPT_SPACING, "lineSpacing", 0, 10, 1)
  fontPicker(L.OPT_FONT_TEXT, "fontBody", "body")
  fontPicker(L.OPT_FONT_NAME, "fontName", "name")
  checkbox(L.OPT_CONTRAST, "highContrast")
  do -- Put a dragged conversation box back where it opens by default (0.61.0).
    local t = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    t:SetPoint("TOPLEFT", LEFT + 4, y - 4)
    t:SetText(L.OPT_RESET_POS_LABEL)
    local b = CreateFrame("Button", nil, content, C.Template("button"))
    b:SetSize(240, 22)
    b:SetPoint("TOPLEFT", CONTROL_X, y)
    b:SetText(L.OPT_RESET_POS)
    b:SetScript("OnClick", function() UI.Dialogue.ResetPosition() end)
    y = y - 28
  end

  -- Reading: how the text arrives.
  header(L.OPT_HEADER_ACCESS)
  checkbox(L.OPT_INSTANT, "instantText")
  slider(L.OPT_SPEED, "textSpeed", 20, 200, 10)
  checkbox(L.OPT_AUTO, "autoAdvance")
  slider(L.OPT_AUTO_DELAY, "autoDelay", 1, 10, 1, seconds, { dependsOn = "autoAdvance" })
  checkbox(L.OPT_REDUCE_MOTION, "reduceMotion")
  checkbox(L.OPT_SOUNDS, "sounds")
  checkbox(L.OPT_TTS, "tts")
  if not C.TTSAvailable() then
    note(L.OPT_TTS_MISSING, 20)
  else
    checkbox(L.OPT_TTS_QUESTS, "ttsQuests", { dependsOn = "tts" })
    do -- Hear the voices now; voice, speed and volume are the game's own TTS options.
      local t = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
      t:SetPoint("TOPLEFT", LEFT + 24, y - 4)
      t:SetText(L.OPT_TTS_TEST_LABEL)
      local b = CreateFrame("Button", nil, content, C.Template("button"))
      b:SetSize(240, 22)
      b:SetPoint("TOPLEFT", CONTROL_X, y)
      b:SetText(L.OPT_TTS_TEST)
      b:SetScript("OnClick", function() ns.Slash.Handle("tts") end)
      y = y - 28
    end
    note(L.OPT_TTS_NOTE, 20)
  end
  checkbox(L.OPT_GAMEPAD, "gamepad")

  -- In the conversation: what the box shows besides the words.
  header(L.OPT_HEADER_CONVO)
  checkbox(L.OPT_ECHO, "echoReply")
  cycle(L.OPT_TAGS, "tags", { "available", "always", "never" }, { L.TAGS_AVAILABLE, L.TAGS_ALWAYS, L.TAGS_NEVER })
  checkbox(L.OPT_IDENTITY_TAGS, "identityTags")
  checkbox(L.OPT_LOCKED, "showLocked")
  checkbox(L.OPT_HINTS, "alignHints")
  checkbox(L.OPT_TOPIC_LINKS, "topicLinks")
  checkbox(L.OPT_DISPOSITION, "showDisposition")
  checkbox(L.OPT_APPROVAL, "approval")
  checkbox(L.OPT_CHECK_RESULTS, "checkResults")

  -- The world: people noticing you, speaking up, the madness.
  header(L.OPT_HEADER_WORLD)
  slider(L.OPT_ACK, "ackChance", 0, 1, 0.05, percent)
  checkbox(L.OPT_NEW_MARKER, "newMarker")
  checkbox(L.OPT_BARKS, "barks")
  checkbox(L.OPT_INSANITY, "insanityFx")
  slider(L.OPT_INSANITY_LEVEL, "insanityIntensity", 0, 1, 0.1, percent, { dependsOn = "insanityFx" })

  -- The journal and how to reach it.
  header(L.OPT_HEADER_JOURNAL)
  cycle(L.OPT_JOURNAL_VOICE, "journalVoice", { "first", "third" }, { L.VOICE_FIRST, L.VOICE_THIRD })
  checkbox(L.OPT_JOURNAL_BUTTON, "journalButton", { onChange = function() ns.UI.Launcher.Refresh() end })
  checkbox(L.OPT_MINIMAP_BUTTON, "minimapButton", { onChange = function() ns.UI.Launcher.Refresh() end })
  note(L.OPT_JOURNAL_NOTE)

  -- Other addons: dialogue addons and Total RP 3 together.
  header(L.OPT_HEADER_OTHERS)
  local other = ns.Integrations and ns.Integrations.DialogueAddonLoaded()
  note(other and L.OPT_OTHERS_FOUND:format(other) or L.OPT_OTHERS_NONE)
  cycle(L.OPT_OTHERS, "otherAddons", { "auto", "takeover", "stepback", "off" },
    { L.OTHERS_AUTO, L.OTHERS_TAKEOVER, L.OTHERS_STEPBACK, L.OTHERS_OFF })
  note(ns.Integrations.RoleplayAddonLoaded() and L.OPT_TRP3_FOUND or L.OPT_TRP3_NONE)
  checkbox(L.OPT_TRP3_NAME, "trp3Name")
  checkbox(L.OPT_TRP3_TITLE, "trp3Title", { dependsOn = "trp3Name" })

  header(L.OPT_HEADER_PACKS)
  note(L.OPT_PACKS_NOTE)
  for _, p in ipairs(ns.Packs.List()) do
    local id = p.id
    local b = CreateFrame("CheckButton", nil, content)
    b:SetSize(22, 22)
    b:SetPoint("TOPLEFT", LEFT, y)
    b:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
    b:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
    local label = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", b, "RIGHT", 4, 0)
    label:SetText(p.title .. (p.version and (" |cff8a8a8a" .. tostring(p.version) .. "|r") or "")
      .. (p.refused and (" |cffff4040(" .. L.PACK_REFUSED .. ")|r") or "")
      .. (#p.missing > 0 and (" (" .. L.PACK_NEEDS:format(table.concat(p.missing, ", ")) .. ")") or ""))
    b:SetScript("OnClick", function(self)
      if self:GetChecked() then s().packs[id] = nil else s().packs[id] = false end
    end)
    b.refresh = function() b:SetChecked(s().packs[id] ~= false) end
    controls[#controls + 1] = b
    y = y - 24
  end

  header(L.OPT_HEADER_DEV)
  checkbox(L.OPT_DEV, "dev")
  checkbox(L.OPT_AUTOCAPTURE, "autoCapture")
  checkbox(L.OPT_CAPTURE_TEXT, "captureText")

  content:SetHeight(-y + 40)
  panel:SetScript("OnShow", function()
    for _, c in ipairs(controls) do c.refresh() end
    refreshDeps()
  end)
  category = C.RegisterSettings(panel, L.ADDON_NAME)
end

function Settings.Open()
  if not panel then build() end
  C.OpenSettings(category)
end

ns.OnLogin(function()
  if not panel then build() end
end)
