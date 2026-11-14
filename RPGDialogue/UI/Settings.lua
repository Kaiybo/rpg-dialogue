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

local function header(text)
  local fs = content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
  fs:SetPoint("TOPLEFT", 16, y)
  fs:SetText(text)
  y = y - 28
end

local function note(text)
  local fs = content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  fs:SetPoint("TOPLEFT", 20, y)
  fs:SetWidth(560)
  fs:SetJustifyH("LEFT")
  fs:SetText(text)
  y = y - (fs:GetStringHeight() or 12) - 8
end

local function checkbox(label, key, onChange)
  local b = CreateFrame("CheckButton", nil, content)
  b:SetSize(22, 22)
  b:SetPoint("TOPLEFT", 16, y)
  b:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
  b:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
  b:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight", "ADD")
  b:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
  b.label = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  b.label:SetPoint("LEFT", b, "RIGHT", 4, 0)
  b.label:SetText(label)
  b:SetScript("OnClick", function(self)
    s()[key] = self:GetChecked() and true or false
    if onChange then onChange(s()[key]) end
    refreshUI()
  end)
  b.refresh = function() b:SetChecked(s()[key] == true) end
  controls[#controls + 1] = b
  y = y - 26
  return b
end

local function slider(label, key, min, max, step, fmt)
  local text = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  text:SetPoint("TOPLEFT", 20, y)
  local sl = CreateFrame("Slider", nil, content)
  sl:SetOrientation("HORIZONTAL")
  sl:SetSize(220, 16)
  sl:SetPoint("TOPLEFT", 300, y + 2)
  sl:SetMinMaxValues(min, max)
  sl:SetValueStep(step)
  sl:SetObeyStepOnDrag(true)
  sl:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal")
  local track = sl:CreateTexture(nil, "BACKGROUND")
  track:SetPoint("LEFT"); track:SetPoint("RIGHT"); track:SetHeight(6)
  track:SetColorTexture(0.3, 0.3, 0.3, 0.8)
  local function show(v) text:SetText(label .. ": " .. string.format(fmt or "%d", v)) end
  sl:SetScript("OnValueChanged", function(_, v)
    v = math.floor(v / step + 0.5) * step
    s()[key] = v
    show(v)
    refreshUI()
  end)
  sl.refresh = function() sl:SetValue(s()[key] or min); show(s()[key] or min) end
  controls[#controls + 1] = sl
  y = y - 30
  return sl
end

-- A font picker: a button that cycles through the fonts (its label drawn in that font),
-- and a sample line underneath in the chosen font.
local function fontPicker(label, key, kind)
  local text = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  text:SetPoint("TOPLEFT", 20, y - 4)
  text:SetText(label)
  local choices = UI.Theme.FontChoices(kind)
  local b = CreateFrame("Button", nil, content, C.Template("button"))
  b:SetSize(260, 22)
  b:SetPoint("TOPLEFT", 300, y)
  local sample = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  sample:SetPoint("TOPLEFT", 304, y - 26)
  sample:SetWidth(280)
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
local function cycle(label, key, values, labels)
  local text = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  text:SetPoint("TOPLEFT", 20, y - 4)
  text:SetText(label)
  local b = CreateFrame("Button", nil, content, C.Template("button"))
  b:SetSize(220, 22)
  b:SetPoint("TOPLEFT", 300, y)
  local function show()
    for i, v in ipairs(values) do if v == s()[key] then b:SetText(labels[i]) end end
  end
  b:SetScript("OnClick", function()
    local idx = 1
    for i, v in ipairs(values) do if v == s()[key] then idx = i end end
    s()[key] = values[idx % #values + 1]
    show()
    refreshUI()
  end)
  b.refresh = show
  controls[#controls + 1] = b
  y = y - 28
  return b
end

local function build()
  panel = CreateFrame("Frame")
  panel.name = L.ADDON_NAME
  local scroll = CreateFrame("ScrollFrame", nil, panel, C.Template("scroll"))
  scroll:SetPoint("TOPLEFT", 4, -8)
  scroll:SetPoint("BOTTOMRIGHT", -28, 8)
  content = CreateFrame("Frame", nil, scroll)
  content:SetSize(600, 1400)
  scroll:SetScrollChild(content)
  y = -8

  header(L.ADDON_NAME .. "  |cff8a8a8a" .. ns.VERSION .. "|r")
  checkbox(L.OPT_ENABLED, "enabled")
  cycle(L.OPT_OPEN_MODE, "openMode", { "full", "compact", "skip" }, { L.OPEN_FULL, L.OPEN_COMPACT, L.OPEN_SKIP })
  cycle(L.OPT_LOOK, "look", { "game", "wood" }, { L.LOOK_GAME, L.LOOK_WOOD })
  if not UI.Theme.GameArt() then note(L.OPT_LOOK_MISSING) end
  checkbox(L.OPT_RIGHT_CLICK, "rightClickTalk")
  checkbox(L.OPT_FADE, "fadeDefault")
  slider(L.OPT_ACK, "ackChance", 0, 1, 0.05, "%.2f")
  checkbox(L.OPT_NEW_MARKER, "newMarker")

  y = y - 8
  header(L.OPT_HEADER_OTHERS)
  local other = ns.Integrations and ns.Integrations.DialogueAddonLoaded()
  note(other and L.OPT_OTHERS_FOUND:format(other) or L.OPT_OTHERS_NONE)
  cycle(L.OPT_OTHERS, "otherAddons", { "auto", "takeover", "stepback", "off" },
    { L.OTHERS_AUTO, L.OTHERS_TAKEOVER, L.OTHERS_STEPBACK, L.OTHERS_OFF })

  y = y - 8
  header(L.OPT_HEADER_TRP3)
  note(ns.Integrations.RoleplayAddonLoaded() and L.OPT_TRP3_FOUND or L.OPT_TRP3_NONE)
  checkbox(L.OPT_TRP3_NAME, "trp3Name")
  checkbox(L.OPT_TRP3_TITLE, "trp3Title")

  y = y - 8
  header(L.OPT_HEADER_STORY)
  cycle(L.OPT_JOURNAL_VOICE, "journalVoice", { "first", "third" }, { L.VOICE_FIRST, L.VOICE_THIRD })
  cycle(L.OPT_TAGS, "tags", { "available", "always", "never" }, { L.TAGS_AVAILABLE, L.TAGS_ALWAYS, L.TAGS_NEVER })
  checkbox(L.OPT_LOCKED, "showLocked")
  checkbox(L.OPT_HINTS, "alignHints")
  checkbox(L.OPT_BARKS, "barks")
  checkbox(L.OPT_INSANITY, "insanityFx")
  slider(L.OPT_INSANITY_LEVEL, "insanityIntensity", 0, 1, 0.1, "%.1f")
  checkbox(L.OPT_TTS, "tts")
  if not C.TTSAvailable() then note(L.OPT_TTS_MISSING) end

  y = y - 8
  header(L.OPT_HEADER_ACCESS)
  slider(L.OPT_TEXT_SIZE, "textSize", 10, 24, 1)
  slider(L.OPT_SPACING, "lineSpacing", 0, 10, 1)
  fontPicker(L.OPT_FONT_TEXT, "fontBody", "body")
  fontPicker(L.OPT_FONT_NAME, "fontName", "name")
  slider(L.OPT_SPEED, "textSpeed", 20, 200, 10)
  checkbox(L.OPT_INSTANT, "instantText")
  checkbox(L.OPT_AUTO, "autoAdvance")
  slider(L.OPT_AUTO_DELAY, "autoDelay", 1, 10, 1)
  checkbox(L.OPT_REDUCE_MOTION, "reduceMotion")
  checkbox(L.OPT_GAMEPAD, "gamepad")
  checkbox(L.OPT_CONTRAST, "highContrast")
  checkbox(L.OPT_SOUNDS, "sounds")
  slider(L.OPT_SCALE, "scale", 0.7, 1.5, 0.05, "%.2f")

  y = y - 8
  header(L.OPT_HEADER_PACKS)
  note(L.OPT_PACKS_NOTE)
  for _, p in ipairs(ns.Packs.List()) do
    local id = p.id
    local b = CreateFrame("CheckButton", nil, content)
    b:SetSize(22, 22)
    b:SetPoint("TOPLEFT", 16, y)
    b:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
    b:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
    local label = content:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", b, "RIGHT", 4, 0)
    label:SetText(p.title .. (p.version and (" " .. tostring(p.version)) or "")
      .. (p.refused and (" |cffff4040(" .. L.PACK_REFUSED .. ")|r") or "")
      .. (#p.missing > 0 and (" (" .. L.PACK_NEEDS:format(table.concat(p.missing, ", ")) .. ")") or ""))
    b:SetScript("OnClick", function(self)
      if self:GetChecked() then s().packs[id] = nil else s().packs[id] = false end
    end)
    b.refresh = function() b:SetChecked(s().packs[id] ~= false) end
    controls[#controls + 1] = b
    y = y - 26
  end

  y = y - 8
  header(L.OPT_HEADER_DEV)
  checkbox(L.OPT_DEV, "dev")
  checkbox(L.OPT_AUTOCAPTURE, "autoCapture")
  checkbox(L.OPT_CAPTURE_TEXT, "captureText")

  content:SetHeight(-y + 40)
  panel:SetScript("OnShow", function() for _, c in ipairs(controls) do c.refresh() end end)
  category = C.RegisterSettings(panel, L.ADDON_NAME)
end

function Settings.Open()
  if not panel then build() end
  C.OpenSettings(category)
end

ns.OnLogin(function()
  if not panel then build() end
end)
