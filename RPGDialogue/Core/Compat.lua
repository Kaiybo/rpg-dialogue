-- The ONLY file that talks to Blizzard's game API, frame names and globals.
-- If Forever's API differs from what we expect, this is the one file to change.
--
-- Forever runs on Mainline's 12.1.5-era API (see DESIGN.md §0), so every function
-- tries the modern call first and keeps a legacy fallback. Anything missing is
-- recorded in Compat.missing and logged in developer mode.
local _, ns = ...

local G = _G
local C = {}
ns.Compat = C

C.missing = {}

---------------------------------------------------------------------------
-- Resolution helpers
---------------------------------------------------------------------------
local pathCache = {}

-- "C_GossipInfo.GetText" -> function or nil (looked up at call time, never cached,
-- so mocks and late-loading Blizzard addons are picked up).
local function resolve(path)
  local parts = pathCache[path]
  if not parts then
    parts = {}
    for p in path:gmatch("[^%.]+") do parts[#parts + 1] = p end
    pathCache[path] = parts
  end
  local v = G
  for i = 1, #parts do
    if type(v) ~= "table" then return nil end
    v = v[parts[i]]
    if v == nil then return nil end
  end
  return v
end
C.Resolve = resolve

local function noteMissing(path)
  if not C.missing[path] then
    C.missing[path] = true
    if ns.Debug then ns.Debug("API missing:", path) end
  end
end

local function results(ok, ...)
  if ok then return ... end
  return nil
end

-- Call the first path that exists, protected. Returns the call's results, or nil.
local function call(paths, ...)
  if type(paths) == "string" then paths = { paths } end
  for i = 1, #paths do
    local fn = resolve(paths[i])
    if type(fn) == "function" then
      return results(pcall(fn, ...))
    end
  end
  noteMissing(paths[1])
  return nil
end
C.Call = call

function C.Has(path)
  return resolve(path) ~= nil
end

-- Midnight-era "secret" values can be displayed but not compared. Treat them as unknown.
function C.IsSecret(v)
  local fn = resolve("issecretvalue")
  if type(fn) == "function" then
    local ok, secret = pcall(fn, v)
    return ok and secret == true
  end
  return false
end

local function clean(v)
  if v == nil or C.IsSecret(v) then return nil end
  return v
end

---------------------------------------------------------------------------
-- Probe: which APIs does this client have? (/rpgd probe)
---------------------------------------------------------------------------
C.PROBE_LIST = {
  "C_GossipInfo.GetOptions", "C_GossipInfo.GetText", "C_GossipInfo.SelectOption",
  "C_QuestLog.IsQuestFlaggedCompleted", "C_QuestLog.GetQuestObjectives", "C_QuestLog.ReadyForTurnIn",
  "C_QuestLog.GetTitleForQuestID", "C_QuestLog.GetInfo",
  "C_UnitAuras.GetAuraDataByIndex", "AuraUtil.ForEachAura",
  "C_AddOns.GetAddOnMetadata", "C_AddOns.LoadAddOn",
  "C_Calendar.GetDayEvent", "C_DateAndTime.GetCurrentCalendarTime",
  "C_VoiceChat.SpeakText", "C_VoiceChat.GetTtsVoices", "C_TTSSettings.GetSpeechRate", "TextToSpeech_Speak",
  "C_TooltipInfo.GetUnit",
  "C_Reputation.GetFactionDataByID", "C_Map.GetBestMapForUnit", "C_Map.GetPlayerMapPosition",
  "C_DeathRecap.GetRecapEvents", "C_GameRules.IsHardcoreActive",
  "Settings.RegisterCanvasLayoutCategory", "AddonCompartmentFrame.RegisterAddon",
  "issecretvalue", "CheckInteractDistance", "GetShapeshiftFormID", "GetBindLocation",
  "IsQuestFlaggedCompleted", "UnitBuff", "GetQuestLogLeaderBoard", "InterfaceOptions_AddCategory",
  "GetServerTime", "Enum.PlayerInteractionType",
  "C_GossipInfo.SelectAvailableQuest", "C_GossipInfo.SelectActiveQuest", "SelectAvailableQuest", "GetActiveTitle",
  "C_GamePad.IsEnabled", "TooltipDataProcessor.AddTooltipPostCall",
  "NineSliceUtil.ApplyLayoutByName", "C_Texture.GetAtlasInfo", "SetPortraitTexture",
  "GetMaterialTextColors", "QuestUtil.GetQuestIconOfferForQuestID",
}

-- Old functions kept only as fallbacks; a modern client is expected not to have them.
C.PROBE_LEGACY = { IsQuestFlaggedCompleted = true, UnitBuff = true, InterfaceOptions_AddCategory = true,
  GetQuestLogLeaderBoard = true }

function C.Probe()
  local out = {}
  for i = 1, #C.PROBE_LIST do
    local p = C.PROBE_LIST[i]
    out[#out + 1] = { name = p, present = resolve(p) ~= nil, legacy = C.PROBE_LEGACY[p] }
  end
  return out
end

---------------------------------------------------------------------------
-- Time, output, timers, combat
---------------------------------------------------------------------------
function C.Now()
  return call({ "GetServerTime", "time" }) or 0
end

function C.Clock()
  return call("GetTime") or 0
end

-- Mouse buttons pressed and released on the 3D world (not on any window). Hooks only:
-- the game's own click handling (targeting, interacting, turning the camera) is untouched.
function C.HookWorldClicks(onDown, onUp)
  local wf = resolve("WorldFrame")
  if type(wf) ~= "table" or type(wf.HookScript) ~= "function" then
    noteMissing("WorldFrame:HookScript")
    return false
  end
  local okDown = pcall(wf.HookScript, wf, "OnMouseDown", function(_, button) pcall(onDown, button) end)
  local okUp = pcall(wf.HookScript, wf, "OnMouseUp", function(_, button) pcall(onUp, button) end)
  return okDown and okUp
end

-- Server game time: hours (0-23), minutes.
function C.GameTime()
  local h, m = call("GetGameTime")
  return h or 12, m or 0
end

-- { year, month, day, weekday } in local calendar time.
function C.Date()
  local t = call("C_DateAndTime.GetCurrentCalendarTime")
  if type(t) == "table" then
    return { year = t.year, month = t.month, day = t.monthDay, weekday = t.weekday }
  end
  local d = call("date", "*t")
  if type(d) == "table" then
    return { year = d.year, month = d.month, day = d.day, weekday = d.wday }
  end
  return { year = 2026, month = 1, day = 1, weekday = 1 }
end

function C.Print(msg)
  local chat = resolve("DEFAULT_CHAT_FRAME")
  if chat and chat.AddMessage then
    chat:AddMessage(msg)
  else
    print(msg)
  end
end

function C.After(seconds, fn)
  local after = resolve("C_Timer.After")
  if after then after(seconds, fn) else fn() end
end

function C.NewTicker(seconds, fn)
  local ticker = resolve("C_Timer.NewTicker")
  if ticker then return ticker(seconds, fn) end
  return { Cancel = function() end }
end

function C.InCombat()
  return call("InCombatLockdown") == true
end

function C.Build()
  return call("GetBuildInfo")
end

---------------------------------------------------------------------------
-- Globals we are allowed to own: SavedVariables, slash commands, keybinding names,
-- and the public pack API. Nothing else is ever written to _G.
---------------------------------------------------------------------------
local ALLOWED_GLOBALS = {
  RPGDialogueDB = true, RPGDialogueCharDB = true, RPGDialogueAPI = true,
}

function C.GetSV(name)
  return G[name]
end

function C.SetSV(name, value)
  assert(ALLOWED_GLOBALS[name], "not an allowed global: " .. tostring(name))
  G[name] = value
end

function C.SetGlobal(name, value)
  assert(ALLOWED_GLOBALS[name] or name:match("^BINDING_") or name:match("^SLASH_"),
    "not an allowed global: " .. tostring(name))
  G[name] = value
end

function C.RegisterSlash(id, commands, handler)
  for i = 1, #commands do G["SLASH_" .. id .. i] = commands[i] end
  local list = resolve("SlashCmdList")
  if list then list[id] = handler end
end

function C.GlobalString(name)
  local v = G[name]
  if type(v) == "string" then return v end
  return nil
end

---------------------------------------------------------------------------
-- AddOns
---------------------------------------------------------------------------
function C.NumAddOns()
  return call({ "C_AddOns.GetNumAddOns", "GetNumAddOns" }) or 0
end

function C.AddOnName(index)
  local name = call({ "C_AddOns.GetAddOnInfo", "GetAddOnInfo" }, index)
  return name
end

function C.AddOnMeta(name, field)
  return call({ "C_AddOns.GetAddOnMetadata", "GetAddOnMetadata" }, name, field)
end

function C.IsAddOnLoaded(name)
  local loadedOrLoading, loaded = call({ "C_AddOns.IsAddOnLoaded", "IsAddOnLoaded" }, name)
  if loaded ~= nil then return loaded == true end
  return loadedOrLoading == true
end

---------------------------------------------------------------------------
-- Gamepad (the client's own gamepad mode). Our windows only take gamepad buttons while
-- they're open and the player has gamepad mode on.
---------------------------------------------------------------------------
function C.GamePadEnabled()
  return call("C_GamePad.IsEnabled") == true
end

function C.SetGamePadHandler(frame, handler)
  if type(frame.EnableGamePadButton) ~= "function" then
    noteMissing("Frame:EnableGamePadButton")
    return false
  end
  return (pcall(frame.SetScript, frame, "OnGamePadButtonDown", handler))
end

function C.GamePadButtons(frame, on)
  if type(frame.EnableGamePadButton) == "function" then
    pcall(frame.EnableGamePadButton, frame, on and true or false)
  end
end

function C.ShiftDown() return call("IsShiftKeyDown") == true end

-- A vertical or horizontal color gradient on a texture (modern ColorMixin form, then the
-- older one, then a flat average). c1 is the bottom (or left) color, c2 the top (or right).
function C.SetGradient(tex, orientation, c1, c2)
  tex:SetColorTexture(1, 1, 1, 1)
  local create = resolve("CreateColor")
  if create and type(tex.SetGradient) == "function" then
    local ok = pcall(tex.SetGradient, tex, orientation,
      create(c1[1], c1[2], c1[3], c1[4] or 1), create(c2[1], c2[2], c2[3], c2[4] or 1))
    if ok then return end
  end
  if type(tex.SetGradientAlpha) == "function" then
    local ok = pcall(tex.SetGradientAlpha, tex, orientation, c1[1], c1[2], c1[3], c1[4] or 1, c2[1], c2[2], c2[3], c2[4] or 1)
    if ok then return end
  end
  tex:SetColorTexture((c1[1] + c2[1]) / 2, (c1[2] + c2[2]) / 2, (c1[3] + c2[3]) / 2, ((c1[4] or 1) + (c2[4] or 1)) / 2)
end

-- Inline atlas icon for text ("|A:name:h:w|a"), or "" if this client doesn't have it.
function C.AtlasMarkup(name, size)
  local info = call("C_Texture.GetAtlasInfo", name)
  if not info then return "" end
  return ("|A:%s:%d:%d|a"):format(name, size, size)
end

-- Inline texture icon for text ("|T<file>:h:w|t ") from a file ID or path, or "".
function C.IconMarkup(file, size)
  if type(file) ~= "number" and type(file) ~= "string" then return "" end
  if file == 0 or file == "" then return "" end
  return ("|T%s:%d:%d|t "):format(tostring(file), size, size)
end

---------------------------------------------------------------------------
-- The game's own window art, for the "game style" look. Names and paths are from
-- Blizzard's 12.1.5 interface code (GossipFrame, ButtonFrameTemplate, NineSliceLayouts,
-- QuestUtils; see DESIGN.md §3.10). Every piece checks the client has it first.
---------------------------------------------------------------------------
function C.HasAtlas(name)
  return type(name) == "string" and call("C_Texture.GetAtlasInfo", name) ~= nil
end

-- { width, height, file, leftTexCoord, rightTexCoord, topTexCoord, bottomTexCoord, ... } or nil.
function C.AtlasInfo(name)
  if type(name) ~= "string" then return nil end
  local info = call("C_Texture.GetAtlasInfo", name)
  return type(info) == "table" and info or nil
end

-- The frame borders (NineSliceUtil and the layouts we use) and the quest parchment.
function C.GameArtAvailable()
  local getLayout = resolve("NineSliceUtil.GetLayout")
  if type(getLayout) ~= "function" or type(resolve("NineSliceUtil.ApplyLayoutByName")) ~= "function" then
    noteMissing("NineSliceUtil")
    return false
  end
  for _, name in ipairs({ "PortraitFrameTemplate", "ButtonFrameTemplateNoPortrait", "SimplePanelTemplate", "InsetFrameTemplate" }) do
    local ok, layout = pcall(getLayout, name)
    if not ok or type(layout) ~= "table" then return false end
  end
  return C.HasAtlas("QuestBG-Parchment") and C.HasAtlas("UI-Frame-PortraitMetal-CornerTopLeft")
end

-- Puts one of the game's frame borders on a frame of ours (as textures on that frame).
function C.ApplyNineSlice(frame, layoutName)
  local fn = resolve("NineSliceUtil.ApplyLayoutByName")
  if type(fn) ~= "function" then return false end
  return (pcall(fn, frame, layoutName))
end

-- A child frame drawn as part of its parent (so the parent's text can sit above it).
function C.UseParentLevel(frame)
  if type(frame.SetUsingParentLevel) ~= "function" then return false end
  return (pcall(frame.SetUsingParentLevel, frame, true))
end

function C.SetPortrait(texture, unit)
  if not unit then return false end
  local fn = resolve("SetPortraitTexture")
  if type(fn) ~= "function" then return false end
  return (pcall(fn, texture, unit))
end

-- The player's "Quest Text Contrast" accessibility setting (0 = normal parchment, 1-3 lighter
-- parchments, 4 = dark background with light text).
function C.QuestTextContrast()
  local v = call({ "GetCVarNumberOrDefault", "GetCVar" }, "questTextContrast")
  return tonumber(v) or 0
end

-- The quest parchment the game itself would show (follows the contrast setting).
function C.QuestBackgroundAtlas(dark)
  if dark and C.HasAtlas("QuestBG-Parchment-Accessibility4") then return "QuestBG-Parchment-Accessibility4" end
  local atlas = call("QuestTextContrast.GetDefaultBackgroundAtlas")
  if type(atlas) == "string" and C.HasAtlas(atlas) then return atlas end
  return "QuestBG-Parchment"
end

-- Text and title colors the game uses on a material ("Parchment", "Stone"), as {r, g, b}.
local MATERIAL_FALLBACK = {
  Parchment = { { 0.18, 0.12, 0.06 }, { 0, 0, 0 } },
  Stone = { { 1, 1, 1 }, { 0.993, 0.831, 0.380 } },
}
function C.MaterialTextColors(material)
  local text, title = call("GetMaterialTextColors", material)
  local fb = MATERIAL_FALLBACK[material] or MATERIAL_FALLBACK.Parchment
  local function ok(c) return type(c) == "table" and type(c[1]) == "number" and type(c[3]) == "number" end
  return ok(text) and text or fb[1], ok(title) and title or fb[2]
end

-- The icon the game's gossip window shows for a quest: { atlas = name } or { file = path,
-- desaturate = bool }. Asks the game's own helper first (campaign, daily, legendary...).
function C.QuestIcon(q)
  if q.questID then
    local path = q.active and "QuestUtil.GetQuestIconActiveForQuestID" or "QuestUtil.GetQuestIconOfferForQuestID"
    local fn = resolve(path)
    if type(fn) == "function" then
      local ok, asset, isAtlas
      if q.active then ok, asset, isAtlas = pcall(fn, q.questID, q.complete == true)
      else ok, asset, isAtlas = pcall(fn, q.questID) end
      if ok and type(asset) == "string" and asset ~= "" then
        if not isAtlas then return { file = asset } end
        if C.HasAtlas(asset) then return { atlas = asset } end
      end
    end
  end
  if not q.active then return { file = "Interface\\GossipFrame\\AvailableQuestIcon" } end
  if q.complete then return { file = "Interface\\GossipFrame\\ActiveQuestIcon" } end
  if C.HasAtlas("SideInProgressquesticon") then return { atlas = "SideInProgressquesticon" } end
  return { file = "Interface\\GossipFrame\\ActiveQuestIcon", desaturate = true }
end

-- An icon ({ atlas } or { file }) as inline text markup, or "".
function C.IconToMarkup(icon, size)
  if type(icon) ~= "table" then return "" end
  if icon.atlas then
    local m = C.AtlasMarkup(icon.atlas, size)
    return m ~= "" and (m .. " ") or ""
  end
  return C.IconMarkup(icon.file, size)
end

-- Fonts other addons share through LibSharedMedia-3.0 (if any addon loaded it). Read-only.
function C.SharedMediaFonts()
  local out = {}
  local libstub = resolve("LibStub")
  if not libstub then return out end
  local ok, lsm = pcall(libstub, "LibSharedMedia-3.0", true)
  if not ok or type(lsm) ~= "table" or type(lsm.List) ~= "function" then return out end
  local okList, names = pcall(lsm.List, lsm, "font")
  if not okList or type(names) ~= "table" then return out end
  for _, name in ipairs(names) do
    local okFetch, path = pcall(lsm.Fetch, lsm, "font", name, true)
    if okFetch and type(path) == "string" then out[#out + 1] = { name = name, path = path } end
  end
  return out
end

-- Client languages written in Latin script (the bundled readable font covers these).
local LATIN = { enUS = true, enGB = true, deDE = true, frFR = true, esES = true, esMX = true, itIT = true, ptBR = true }
function C.LatinClient()
  local loc = call("GetLocale")
  return loc == nil or LATIN[loc] == true
end

---------------------------------------------------------------------------
-- Unit tooltips: fn(tooltip, unit) after the game fills one in. Modern clients use
-- TooltipDataProcessor; older ones the OnTooltipSetUnit script.
---------------------------------------------------------------------------
function C.OnUnitTooltip(fn)
  local tdp = resolve("TooltipDataProcessor.AddTooltipPostCall")
  local unitType = resolve("Enum.TooltipDataType.Unit")
  local function wrapped(tooltip)
    if tooltip ~= resolve("GameTooltip") then return end
    local okUnit, _, unit = pcall(tooltip.GetUnit, tooltip)
    if okUnit and unit then pcall(fn, tooltip, unit) end
  end
  if type(tdp) == "function" and unitType ~= nil then
    pcall(tdp, unitType, wrapped)
    return true
  end
  local tt = resolve("GameTooltip")
  if tt and tt.HookScript then
    return (pcall(tt.HookScript, tt, "OnTooltipSetUnit", wrapped))
  end
  noteMissing("TooltipDataProcessor.AddTooltipPostCall")
  return false
end

function C.TooltipAddLine(tooltip, text, r, g, b)
  pcall(tooltip.AddLine, tooltip, text, r, g, b, true)
  pcall(tooltip.Show, tooltip)
end

-- A one-line tooltip on one of our own frames (GameTooltip is shared; we only borrow it).
function C.ShowTextTooltip(owner, text)
  local tt = resolve("GameTooltip")
  if not tt or not owner then return end
  pcall(tt.SetOwner, tt, owner, "ANCHOR_CURSOR")
  pcall(tt.SetText, tt, text, 1, 1, 1, 1, true)
  pcall(tt.Show, tt)
end

function C.HideTooltip()
  local tt = resolve("GameTooltip")
  if tt then pcall(tt.Hide, tt) end
end

-- Clickable |H...|h links in a FontString on our own frame (topic words in the box).
-- Frame:SetHyperlinksEnabled is in the modern client and recent Classic clients; without
-- it the words stay coloured and every topic is still in the "Ask about..." list.
function C.EnableHyperlinks(frame, onClick, onEnter, onLeave)
  if not frame or type(frame.SetHyperlinksEnabled) ~= "function" then
    noteMissing("Frame:SetHyperlinksEnabled")
    return false
  end
  frame:SetHyperlinksEnabled(true)
  frame:SetScript("OnHyperlinkClick", onClick)
  if onEnter then frame:SetScript("OnHyperlinkEnter", onEnter) end
  if onLeave then frame:SetScript("OnHyperlinkLeave", onLeave) end
  return true
end

---------------------------------------------------------------------------
-- Total RP 3 (optional, read-only). Uses its public player object
-- (AddOn_TotalRP3.Player.GetCurrentUser), never its internals, and never writes.
-- Returns { first, last, title, full } with any of them nil, or nil.
---------------------------------------------------------------------------
function C.RoleplayProfile()
  local api = resolve("AddOn_TotalRP3.Player")
  if type(api) ~= "table" then return nil end
  local getUser = api.GetCurrentUser or (type(api.static) == "table" and api.static.GetCurrentUser)
  if type(getUser) ~= "function" then return nil end
  local ok, player = pcall(getUser)
  if not ok or type(player) ~= "table" then return nil end
  local function method(name)
    local okIdx, fn = pcall(function() return player[name] end)
    if not okIdx or type(fn) ~= "function" then return nil end
    local okCall, v = pcall(fn, player)
    if okCall and type(v) == "string" and v ~= "" then return v end
    return nil
  end
  local out = {
    first = method("GetFirstName"), last = method("GetLastName"),
    title = method("GetTitle"), full = method("GetRoleplayingName"),
  }
  if not out.first and not out.full then
    -- Older versions: the profile's characteristics (Mary Sue Protocol field names).
    local okIdx, fn = pcall(function() return player.GetCharacteristics end)
    local okCall, ch = false, nil
    if okIdx and type(fn) == "function" then okCall, ch = pcall(fn, player) end
    if okCall and type(ch) == "table" then
      out.first = type(ch.FN) == "string" and ch.FN or nil
      out.last = type(ch.LN) == "string" and ch.LN or nil
      out.title = out.title or (type(ch.TI) == "string" and ch.TI or nil)
    end
  end
  if not out.first and not out.full then return nil end
  return out
end

-- Is the addon enabled for this character? (Disabled packs must not be loaded.)
function C.IsAddOnEnabled(name)
  local playerName = call("UnitName", "player")
  local state = call({ "C_AddOns.GetAddOnEnableState", "GetAddOnEnableState" }, name, playerName)
  if state == nil then return true end
  if type(state) == "boolean" then return state end
  return state > 0
end

function C.LoadAddOn(name)
  local ok, reason = call({ "C_AddOns.LoadAddOn", "LoadAddOn" }, name)
  return ok == true or ok == 1, reason
end

function C.UpdateMemory()
  call({ "UpdateAddOnMemoryUsage" })
end

function C.MemoryKB(name)
  return call({ "GetAddOnMemoryUsage" }, name) or 0
end

---------------------------------------------------------------------------
-- Units
---------------------------------------------------------------------------
function C.GUID(unit) return clean(call("UnitGUID", unit)) end
function C.Exists(unit) return call("UnitExists", unit) == true end
function C.IsPlayer(unit) return call("UnitIsPlayer", unit) == true end
function C.IsGhost() return call("UnitIsGhost", "player") == true end
function C.IsDead() return call("UnitIsDeadOrGhost", "player") == true end
function C.Classification(unit) return clean(call("UnitClassification", unit)) end
function C.Reaction(unit, other) return clean(call("UnitReaction", unit, other or "player")) end
function C.Family(unit) return clean(call("UnitCreatureFamily", unit)) end
function C.CreatureType(unit) return clean(call("UnitCreatureType", unit)) end
-- The player's own pet (a warlock's bound demon, a hunter's beast).
function C.IsMyPet(unit)
  if not unit or not C.Exists("pet") then return false end
  return call("UnitIsUnit", unit, "pet") == true
end
function C.Faction(unit) return clean(call("UnitFactionGroup", unit or "player")) end

function C.Name(unit)
  local name = call("UnitName", unit)
  return clean(name)
end

function C.Level(unit)
  local lvl = clean(call("UnitLevel", unit))
  return tonumber(lvl)
end

function C.IsFriendly(unit)
  return call("UnitIsFriend", "player", unit) == true
end

-- Returns localized name, file token ("Human", "Scourge", ...), race ID.
function C.Race(unit)
  return call("UnitRace", unit or "player")
end

-- Returns localized name, file token ("PRIEST"), class ID.
function C.Class(unit)
  return call("UnitClass", unit or "player")
end

function C.Sex(unit)
  local s = call("UnitSex", unit or "player")
  if s == 2 then return "male" elseif s == 3 then return "female" end
  return nil
end

-- "Creature-0-[server]-[instance]-[zone]-[npcID]-[spawn]". Beta 5 obfuscated the
-- server and spawn parts, so only the type and the sixth field are trusted.
function C.NPCID(guid)
  if type(guid) ~= "string" then return nil end
  local kind, _, _, _, _, id = guid:match("^(%a+)%-([^%-]*)%-([^%-]*)%-([^%-]*)%-([^%-]*)%-([^%-]*)")
  if kind == "Creature" or kind == "Vehicle" then
    return tonumber(id)
  end
  return nil
end

function C.Guild()
  local name, rank = call("GetGuildInfo", "player")
  return clean(name), clean(rank)
end

function C.Money()
  return call("GetMoney") or 0
end

local PROFESSION_NAMES = {
  Alchemy = true, Blacksmithing = true, Enchanting = true, Engineering = true, Herbalism = true,
  Leatherworking = true, Mining = true, Skinning = true, Tailoring = true, Cooking = true,
  Fishing = true, ["First Aid"] = true, Jewelcrafting = true, Inscription = true,
}

-- { { name = "Mining", skill = 75, max = 150 }, ... }
function C.Professions()
  local out = {}
  if resolve("GetProfessions") and resolve("GetProfessionInfo") then
    local list = { call("GetProfessions") }
    for i = 1, 6 do
      local idx = list[i]
      if idx then
        local name, _, skill, max = call("GetProfessionInfo", idx)
        if name then out[#out + 1] = { name = name, skill = skill or 0, max = max or 0 } end
      end
    end
    return out
  end
  local n = call("GetNumSkillLines") or 0
  for i = 1, n do
    local name, isHeader, _, rank, _, _, max = call("GetSkillLineInfo", i)
    if name and not isHeader and PROFESSION_NAMES[name] then
      out[#out + 1] = { name = name, skill = rank or 0, max = max or 0 }
    end
  end
  return out
end

function C.TitleText()
  local id = call("GetCurrentTitle")
  if id and id > 0 then return clean(call("GetTitleName", id)) end
  return nil
end

-- Classic honor ranks, 1-14 (UnitPVPRank reports 5-18 for them, 0 for none).
C.PVP_RANK_NAMES = {
  Alliance = { "Private", "Corporal", "Sergeant", "Master Sergeant", "Sergeant Major", "Knight",
    "Knight-Lieutenant", "Knight-Captain", "Knight-Champion", "Lieutenant Commander", "Commander",
    "Marshal", "Field Marshal", "Grand Marshal" },
  Horde = { "Scout", "Grunt", "Sergeant", "Senior Sergeant", "First Sergeant", "Stone Guard",
    "Blood Guard", "Legionnaire", "Centurion", "Champion", "Lieutenant General", "General",
    "Warlord", "High Warlord" },
}

-- rank (0-14), rank name or nil.
function C.PvPRank()
  local raw = tonumber(call("UnitPVPRank", "player")) or 0
  local rank = raw >= 5 and (raw - 4) or 0
  if rank == 0 then return 0, nil end
  local name = clean(call("GetPVPRankInfo", raw, "player"))
  if not name then
    local list = C.PVP_RANK_NAMES[C.Faction("player") or ""]
    name = list and list[rank]
  end
  return rank, name
end

function C.PvPFlagged()
  return call("UnitIsPVP", "player") and true or false
end

-- honorable kills, dishonorable kills (lifetime), or nil when the client has no honor system.
function C.PvPLifetime()
  local hk, dk = call("GetPVPLifetimeStats")
  return tonumber(hk), tonumber(dk)
end

local DURABILITY_SLOTS = { 1, 3, 5, 6, 7, 8, 9, 10, 16, 17, 18 }
local ARMOR_SLOTS = { 1, 3, 5, 6, 7, 8, 9, 10 }

-- Average durability ratio (0..1) over items that have durability, or nil.
function C.Durability()
  local cur, max, broken = 0, 0, 0
  for i = 1, #DURABILITY_SLOTS do
    local c, m = call("GetInventoryItemDurability", DURABILITY_SLOTS[i])
    if c and m and m > 0 then
      cur, max = cur + c, max + m
      if c == 0 then broken = broken + 1 end
    end
  end
  if max == 0 then return nil, 0 end
  return cur / max, broken
end

-- slot -> itemID for every equipped slot.
function C.Equipped()
  local out = {}
  for slot = 1, 19 do
    local id = call("GetInventoryItemID", "player", slot)
    if id then out[slot] = id end
  end
  return out
end

function C.ArmorPiecesWorn()
  local n = 0
  for i = 1, #ARMOR_SLOTS do
    if call("GetInventoryItemID", "player", ARMOR_SLOTS[i]) then n = n + 1 end
  end
  return n
end

-- The other members of your party (not raid subgroups beyond your own): race and class
-- tokens, name, level, gender. 0.59.0 added name/level/gender.
function C.Party()
  local out = {}
  local n = call({ "GetNumSubgroupMembers", "GetNumPartyMembers" }) or 0
  if n > 4 then n = 4 end
  for i = 1, n do
    local unit = "party" .. i
    local _, race = C.Race(unit)
    local _, class = C.Class(unit)
    if race or class then
      out[#out + 1] = { race = race, class = class, name = C.Name(unit), level = clean(call("UnitLevel", unit)),
        gender = C.Sex(unit) }
    end
  end
  return out
end

---------------------------------------------------------------------------
-- Place and state
---------------------------------------------------------------------------
function C.Zone()
  local zone = clean(call("GetRealZoneText")) or ""
  local sub = clean(call("GetSubZoneText")) or ""
  local mapID = clean(call("C_Map.GetBestMapForUnit", "player"))
  return zone, sub, mapID
end

-- The zone the map puts you in (map type 3 zone or 4 dungeon), climbing from a micro map.
-- GetRealZoneText reports some indoor rooms ("Southshore Town Hall") as the zone; this doesn't.
function C.MapZone()
  local mapID = clean(call("C_Map.GetBestMapForUnit", "player"))
  for _ = 1, 6 do
    if not mapID then return nil end
    local info = call("C_Map.GetMapInfo", mapID)
    if type(info) ~= "table" then return nil end
    local t = info.mapType
    if t == 3 or t == 4 then return clean(info.name) end
    if t and t < 3 then return nil end
    mapID = info.parentMapID
  end
end

function C.MapPosition()
  local mapID = clean(call("C_Map.GetBestMapForUnit", "player"))
  if not mapID then return nil end
  local pos = call("C_Map.GetPlayerMapPosition", mapID, "player")
  if pos and pos.GetXY then
    local x, y = pos:GetXY()
    if x and not C.IsSecret(x) then return mapID, x * 100, y * 100 end
  end
  return mapID
end

function C.IsResting() return call("IsResting") == true end
function C.IsMounted() return call("IsMounted") == true end
function C.IsStealthed() return call("IsStealthed") == true end

function C.InInstance()
  local inInstance, kind = call("IsInInstance")
  return inInstance == true, kind
end

function C.FormID()
  return clean(call("GetShapeshiftFormID"))
end

function C.Pet()
  if not C.Exists("pet") then return nil end
  return {
    name = C.Name("pet"),
    family = C.Family("pet"),
    type = C.CreatureType("pet"),
  }
end

-- Calls fn({ spellId, name, dispel }) for each aura. filter: "HELPFUL" | "HARMFUL".
function C.ForEachAura(unit, filter, fn)
  if resolve("C_UnitAuras.GetAuraDataByIndex") then
    for i = 1, 80 do
      local a = call("C_UnitAuras.GetAuraDataByIndex", unit, i, filter)
      if not a then break end
      fn({ spellId = clean(a.spellId), name = clean(a.name), dispel = clean(a.dispelName) })
    end
    return
  end
  local legacy = filter == "HARMFUL" and "UnitDebuff" or "UnitBuff"
  for i = 1, 40 do
    local name, _, _, dispel, _, _, _, _, _, spellId = call(legacy, unit, i)
    if not name then break end
    fn({ spellId = clean(spellId), name = clean(name), dispel = clean(dispel) })
  end
end

function C.Rep(factionID)
  local data = call("C_Reputation.GetFactionDataByID", factionID)
  if type(data) == "table" then return data.reaction, data.name end
  local name, _, standing = call("GetFactionInfoByID", factionID)
  return standing, name
end

function C.ItemCount(itemID)
  return call({ "C_Item.GetItemCount", "GetItemCount" }, itemID) or 0
end

function C.IsHardcore()
  return call("C_GameRules.IsHardcoreActive") == true
end

---------------------------------------------------------------------------
-- Quests
---------------------------------------------------------------------------
local function logIndexFor(questID)
  local idx = call("C_QuestLog.GetLogIndexForQuestID", questID)
  if idx then return idx end
  return call("GetQuestLogIndexByID", questID)
end

-- "done" | "ready" | "active" | "before"
function C.QuestState(questID)
  if type(questID) ~= "number" then return nil end
  local done = call({ "C_QuestLog.IsQuestFlaggedCompleted", "IsQuestFlaggedCompleted" }, questID)
  if done then return "done" end
  local idx = logIndexFor(questID)
  if idx and idx > 0 then
    if call("C_QuestLog.ReadyForTurnIn", questID) or call("C_QuestLog.IsComplete", questID) then
      return "ready"
    end
    return "active"
  end
  return "before"
end

-- { { text, done, have, need }, ... } for a quest in the log.
function C.QuestObjectives(questID)
  local out = {}
  local list = call("C_QuestLog.GetQuestObjectives", questID)
  if type(list) == "table" then
    for i = 1, #list do
      local o = list[i]
      out[#out + 1] = { text = o.text, done = o.finished == true, have = o.numFulfilled or 0, need = o.numRequired or 0 }
    end
    return out
  end
  local idx = logIndexFor(questID)
  if not idx then return out end
  for i = 1, 10 do
    local text, _, finished = call("GetQuestLogLeaderBoard", i, idx)
    if not text then break end
    local have, need = text:match("(%d+)%s*/%s*(%d+)")
    out[#out + 1] = { text = text, done = finished == true, have = tonumber(have) or 0, need = tonumber(need) or 0 }
  end
  return out
end

function C.QuestTitle(questID)
  return call("C_QuestLog.GetTitleForQuestID", questID)
end

-- title -> questID for everything currently in the quest log.
function C.QuestLogByTitle()
  local out = {}
  local n = call("C_QuestLog.GetNumQuestLogEntries")
  if n then
    for i = 1, n do
      local info = call("C_QuestLog.GetInfo", i)
      if info and not info.isHeader and info.title and info.questID then out[info.title] = info.questID end
    end
    return out
  end
  n = call("GetNumQuestLogEntries") or 0
  for i = 1, n do
    local title, _, _, isHeader, _, _, _, questID = call("GetQuestLogTitle", i)
    if title and not isHeader and questID then out[title] = questID end
  end
  return out
end

---------------------------------------------------------------------------
-- Gossip, quest frames, interactions
---------------------------------------------------------------------------
function C.GossipText()
  return clean(call({ "C_GossipInfo.GetText", "GetGossipText" }))
end

-- { { id, name, icon }, ... }
function C.GossipOptions()
  local out = {}
  local list = call("C_GossipInfo.GetOptions")
  if type(list) == "table" then
    for i = 1, #list do
      local o = list[i]
      out[#out + 1] = { id = o.gossipOptionID, name = o.name, icon = o.icon, only = o.selectOptionWhenOnlyOption == true }
    end
    return out
  end
  local legacy = { call("GetGossipOptions") }
  for i = 1, #legacy, 2 do
    out[#out + 1] = { id = (i + 1) / 2, name = legacy[i], kind = legacy[i + 1] }
  end
  return out
end

-- The file IDs of the gossip window's service icons (vendor, trainer, flight...), so an
-- option can be told apart from a "tell me more" one without reading its words.
local serviceIcons
function C.GossipServiceIcons()
  if serviceIcons then return serviceIcons end
  serviceIcons = {}
  for kind, file in pairs({ vendor = "VendorGossipIcon", trainer = "TrainerGossipIcon", taxi = "TaxiGossipIcon",
                            binder = "BinderGossipIcon", banker = "BankerGossipIcon" }) do
    local id = call("GetFileIDFromPath", "Interface\\GossipFrame\\" .. file)
    if type(id) == "number" then serviceIcons[id] = kind end
  end
  return serviceIcons
end

-- Quests this NPC offers or holds for you: { { title, questID, active }, ... }
function C.GossipQuests()
  local out = {}
  for _, which in ipairs({ "GetAvailableQuests", "GetActiveQuests" }) do
    local list = call("C_GossipInfo." .. which)
    if type(list) == "table" then
      for i = 1, #list do
        local q = list[i]
        out[#out + 1] = { title = q.title, questID = q.questID, active = which == "GetActiveQuests",
                          complete = q.isComplete == true }
      end
    end
  end
  return out
end

function C.SelectGossipQuest(questID, active)
  if active then return call("C_GossipInfo.SelectActiveQuest", questID) end
  return call("C_GossipInfo.SelectAvailableQuest", questID)
end

-- The quest window's greeting page (an NPC with several quests and no gossip):
-- { { title, index, active, complete }, ... }, quests to hand in first.
function C.GreetingQuests()
  local out = {}
  for i = 1, call("GetNumActiveQuests") or 0 do
    local title, complete = call("GetActiveTitle", i)
    if title then out[#out + 1] = { title = clean(title), index = i, active = true, complete = complete == true } end
  end
  for i = 1, call("GetNumAvailableQuests") or 0 do
    local title = call("GetAvailableTitle", i)
    if title then out[#out + 1] = { title = clean(title), index = i, active = false } end
  end
  return out
end

function C.SelectGreetingQuest(index, active)
  return call(active and "SelectActiveQuest" or "SelectAvailableQuest", index)
end

function C.SelectGossip(id)
  if resolve("C_GossipInfo.SelectOption") then return call("C_GossipInfo.SelectOption", id) end
  return call("SelectGossipOption", id)
end

-- Text on the quest window for the current stage.
function C.QuestFrameText()
  return {
    questID = call("GetQuestID"),
    title = call("GetTitleText"),
    text = call("GetQuestText"),
    objectives = call("GetObjectiveText"),
    progress = call("GetProgressText"),
    reward = call("GetRewardText"),
    greeting = call("GetGreetingText"),
  }
end

---------------------------------------------------------------------------
-- The quest window's pages, read and answered from our box (the same calls the game's
-- QuestFrame makes, 12.1.5: QuestFrame.lua / QuestInfo.lua).
---------------------------------------------------------------------------
-- Items on the current quest page. kind: "choice" (pick one), "reward", "required".
-- Each: name, texture, count, quality (nil if unknown), usable (false only when the game
-- says the player can't use it), itemID (nil if unknown), loading (true while the game
-- hasn't got the item's name yet: the name is then a placeholder, and the game is asked
-- to load it; GET_ITEM_INFO_RECEIVED / QUEST_ITEM_UPDATE follow), and for required items,
-- have (how many the player carries, nil if unknown).
local ITEM_COUNTERS = { choice = "GetNumQuestChoices", reward = "GetNumQuestRewards", required = "GetNumQuestItems" }

-- A name the game hasn't really got yet: empty, a bare number or item string, or the
-- client's "Retrieving item information" placeholder.
local function unloadedName(name)
  if type(name) ~= "string" or name == "" then return true end
  if name:find("^%s*%[?%s*%d+%s*%]?%s*$") or name:find("item:%d") then return true end
  local retrieving = G.RETRIEVING_ITEM_INFO
  return type(retrieving) == "string" and retrieving ~= "" and name:find(retrieving, 1, true) == 1
end

function C.QuestItems(kind)
  local out = {}
  for i = 1, tonumber(call(ITEM_COUNTERS[kind])) or 0 do
    local name, texture, count, quality, usable, itemID = call("GetQuestItemInfo", kind, i)
    name = clean(name)
    local link = call("GetQuestItemLink", kind, i)
    link = type(link) == "string" and link or nil
    itemID = tonumber(itemID) or tonumber(link and link:match("item:(%d+)"))
    local loading = false
    if unloadedName(name) then
      local byID = itemID and call({ "C_Item.GetItemNameByID", "GetItemInfo" }, itemID)
      if not unloadedName(byID) then
        name = byID
      else
        loading = true
        name = nil
        if itemID then call("C_Item.RequestLoadItemDataByID", itemID) end
      end
    end
    if name or loading then
      local it = { index = i, name = loading and "..." or name, texture = texture,
                   count = tonumber(count) or 1, kind = kind, quality = tonumber(quality),
                   usable = usable ~= false, itemID = itemID, loading = loading }
      if kind == "required" then
        it.have = tonumber(call({ "C_Item.GetItemCount", "GetItemCount" }, itemID or link or name))
      end
      out[#out + 1] = it
    end
  end
  return out
end

-- What the quest page offers and asks: money and experience rewarded, money it costs,
-- whether it can be handed in, whether it's an automatic or a PvP quest.
function C.QuestPageInfo()
  return {
    rewardMoney = tonumber(call("GetRewardMoney")) or 0,
    rewardXP = tonumber(call("GetRewardXP")) or 0,
    cost = tonumber(call("GetQuestMoneyToGet")) or 0,
    completable = call("IsQuestCompletable") == true,
    auto = call("QuestGetAutoAccept") == true,
    pvp = call("QuestFlagsPVP") == true,
  }
end

-- "Accept", "continue" (hand in items), "reward" (with a choice index or 0), "decline".
function C.QuestAnswer(action, choice)
  if action == "accept" then
    if call("QuestGetAutoAccept") == true then return call("AcknowledgeAutoAcceptQuest") end
    return call("AcceptQuest")
  elseif action == "continue" then
    return call("CompleteQuest")
  elseif action == "reward" then
    return call("GetQuestReward", choice or 0)
  elseif action == "decline" then
    return call("CloseQuest")
  end
end

-- Money as the game writes it (gold, silver and copper coins), or plain text.
function C.MoneyText(copper)
  copper = tonumber(copper) or 0
  local text = call({ "C_CurrencyInfo.GetCoinTextureString", "GetCoinTextureString" }, copper)
  if type(text) == "string" and text ~= "" then return text end
  local g, s, c = math.floor(copper / 10000), math.floor(copper / 100) % 100, copper % 100
  local parts = {}
  if g > 0 then parts[#parts + 1] = g .. "g" end
  if s > 0 then parts[#parts + 1] = s .. "s" end
  if c > 0 or #parts == 0 then parts[#parts + 1] = c .. "c" end
  return table.concat(parts, " ")
end

-- The game's tooltip for an item on the quest page.
-- Falls back to the item's own link when the quest window can't fill it in.
function C.ShowQuestItemTooltip(owner, kind, index, itemID)
  local tip = G.GameTooltip
  if type(tip) ~= "table" then return end
  pcall(tip.SetOwner, tip, owner, "ANCHOR_CURSOR")
  local ok = type(tip.SetQuestItem) == "function" and pcall(tip.SetQuestItem, tip, kind, index)
  local filled = ok and type(tip.NumLines) == "function" and (tip:NumLines() or 0) > 0
  if not filled and itemID and type(tip.SetHyperlink) == "function" then
    pcall(tip.SetHyperlink, tip, "item:" .. itemID)
  end
  pcall(tip.Show, tip)
end

local CLOSERS = {
  gossip = { "C_GossipInfo.CloseGossip", "CloseGossip" },
  quest = { "CloseQuest" },
  merchant = { "CloseMerchant" },
  taxi = { "CloseTaxiMap" },
  bank = { "CloseBankFrame" },
  trainer = { "CloseTrainer" },
  stable = { "ClosePetStables" },
}

function C.CloseInteraction(kind)
  local paths = CLOSERS[kind]
  if paths then call(paths) end
end

-- Enum.PlayerInteractionType value -> name ("Merchant", "Trainer", ...)
local interactionNames
function C.InteractionName(value)
  if not interactionNames then
    interactionNames = {}
    local enum = resolve("Enum.PlayerInteractionType")
    if type(enum) == "table" then
      for name, v in pairs(enum) do interactionNames[v] = name end
    end
  end
  return interactionNames[value]
end

-- Tooltip text lines for a unit (line 2 is usually an NPC's title: "Flight Master").
function C.TooltipLines(unit)
  local out = {}
  local data = call("C_TooltipInfo.GetUnit", unit)
  if type(data) == "table" and type(data.lines) == "table" then
    for i = 1, #data.lines do
      local text = clean(data.lines[i].leftText)
      if text then out[#out + 1] = text end
    end
  end
  return out
end

-- true / false, or nil if this client can't tell us.
function C.InRange(unit)
  if not resolve("CheckInteractDistance") then return nil end
  local ok, inRange = pcall(resolve("CheckInteractDistance"), unit, 3)
  if not ok or C.IsSecret(inRange) then return nil end
  return inRange == true
end

function C.BindLocation()
  return clean(call("GetBindLocation"))
end

function C.BookTitle()
  return clean(call("ItemTextGetItem"))
end

-- Holiday names active today, if the calendar API can tell us. May be empty.
function C.HolidaysToday()
  local out = {}
  if not resolve("C_Calendar.GetNumDayEvents") then return out end
  local d = C.Date()
  local n = call("C_Calendar.GetNumDayEvents", 0, d.day) or 0
  for i = 1, n do
    local e = call("C_Calendar.GetDayEvent", 0, d.day, i)
    if type(e) == "table" and e.calendarType == "HOLIDAY" and e.title then out[#out + 1] = e.title end
  end
  return out
end

function C.RequestCalendar()
  call("C_Calendar.OpenCalendar")
end

---------------------------------------------------------------------------
-- Text to speech
-- SpeakText's arguments changed between clients ((voice, text, dest, rate, volume) on
-- older ones, (voice, text, rate, volume, overlap) on newer), and a wrong guess doesn't
-- error, it just plays at volume 0. So the client's own TextToSpeech_Speak goes first
-- (it always matches its client); the direct call picks its shape from the enum.
---------------------------------------------------------------------------
local tts = { pending = 0, lastError = nil, speaking = false }
C.TTS = tts

function C.TTSAvailable()
  return resolve("C_VoiceChat.SpeakText") ~= nil
end

local function ttsVoices()
  local v = call("C_VoiceChat.GetTtsVoices")
  if type(v) ~= "table" then return {} end
  return v
end
C.TTSVoices = ttsVoices

local FEMALE = { "zira", "hazel", "susan", "eva", "linda", "heera", "catherine", "hedda", "helena",
  "julie", "hortense", "elsa", "paulina", "maria", "haruka", "huihui", "yaoyao", "heami", "sabina",
  "irina", "female", "woman", "samantha", "karen", "moira", "tessa", "fiona", "victoria", "allison",
  "ava", "serena", "kate", "aria", "jenny", "sonia", "libby", "natasha", "clara" }
local MALE = { "david", "mark", "george", "james", "richard", "ravi", "sean", "stefan", "pablo",
  "paul", "claude", "cosimo", "daniel", "ichiro", "kangkang", "pavel", "male", "man", "alex",
  "fred", "tom", "oliver", "arthur", "guy", "ryan", "thomas", "william", "brian", "eric" }

local function nameIs(voice, list)
  local n = type(voice) == "table" and voice.name and voice.name:lower() or ""
  if n:find("female", 1, true) then return list == FEMALE end
  for i = 1, #list do
    if n:find("%f[%a]" .. list[i] .. "%f[%A]") then return true end
  end
  return false
end

local function byID(voices, id)
  if id == nil then return nil end
  for i = 1, #voices do if voices[i].voiceID == id then return voices[i] end end
  return nil
end

-- The game's picks (Options > Accessibility > Text to Speech): Standard voice for men,
-- Alternate voice for women. If both are the same voice, guess by the voice's name.
function C.TTSVoice(gender)
  local voices = ttsVoices()
  if #voices == 0 then return { voiceID = 0, name = "?" } end
  local vt = resolve("Enum.TtsVoiceType")
  local std = byID(voices, call("C_TTSSettings.GetVoiceOptionID", vt and vt.Standard or 0))
  local alt = byID(voices, call("C_TTSSettings.GetVoiceOptionID", vt and vt.Alternate or 1))
  std = std or voices[1]
  if gender == "female" then
    if alt and alt.voiceID ~= std.voiceID then return alt end
    if nameIs(std, FEMALE) then return std end
    for i = 1, #voices do if nameIs(voices[i], FEMALE) then return voices[i] end end
  elseif gender == "male" then
    if nameIs(std, FEMALE) and alt and alt.voiceID ~= std.voiceID then return alt end
    if not nameIs(std, FEMALE) then return std end
    for i = 1, #voices do if nameIs(voices[i], MALE) then return voices[i] end end
  end
  return std
end

function C.TTSRate()
  local r = tonumber(call("C_TTSSettings.GetSpeechRate"))
  return r or 0
end

-- The game's stored volume as it is (nil where the client has no TTS settings).
function C.TTSGameVolume()
  return tonumber(call("C_TTSSettings.GetSpeechVolume"))
end

function C.TTSVolume()
  local v = C.TTSGameVolume()
  if not v or v <= 0 then v = 100 end   -- 0 usually means "never set", not "mute"
  return v
end

-- What the box shows isn't what should be read: no colour codes, links, icons or <emotes>.
function C.TTSClean(text)
  text = tostring(text or "")
  text = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
  text = text:gsub("|H.-|h(.-)|h", "%1"):gsub("|T.-|t", ""):gsub("|A.-|a", ""):gsub("|n", " ")
  text = text:gsub("<.->", " "):gsub("%[(.-)%]", "%1")
  text = text:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
  return text
end

-- The ways we can ask the client to speak, tried in order. A way whose line then fails to
-- play (VOICE_CHAT_TTS_PLAYBACK_FAILED) is dropped for the session and the line is read
-- again the next way, so a client that rejects one shape still talks.
local WAYS = {
  { name = "TextToSpeech_Speak", fn = function(voice, text)
      -- Reads the game's own volume: at 0 (never set) it plays silently, so skip it then.
      local blizz = resolve("TextToSpeech_Speak")
      local gameVol = C.TTSGameVolume()
      if not (blizz and gameVol and gameVol > 0) then return false end
      return pcall(blizz, text, voice)
    end },
  { name = "SpeakText(dest)", fn = function(voice, text, rate, volume)
      local speak, dests = resolve("C_VoiceChat.SpeakText"), resolve("Enum.VoiceTtsDestination")
      if not (speak and dests) then return false end
      return pcall(speak, voice.voiceID, text, dests.LocalPlayback or 1, rate, volume)
    end },
  { name = "SpeakText(queued)", fn = function(voice, text, rate, volume)
      local speak, dests = resolve("C_VoiceChat.SpeakText"), resolve("Enum.VoiceTtsDestination")
      if not (speak and dests and dests.QueuedLocalPlayback) then return false end
      return pcall(speak, voice.voiceID, text, dests.QueuedLocalPlayback, rate, volume)
    end },
  { name = "SpeakText", fn = function(voice, text, rate, volume)
      local speak = resolve("C_VoiceChat.SpeakText")
      if not speak then return false end
      return pcall(speak, voice.voiceID, text, rate, volume, false)
    end },
  { name = "SpeakText(dest=1)", fn = function(voice, text, rate, volume)
      local speak = resolve("C_VoiceChat.SpeakText")
      if not speak then return false end
      return pcall(speak, voice.voiceID, text, 1, rate, volume)
    end },
}
tts.bad = {}

local function speakNow(voice, text, rate, volume, from)
  local err = "no way to speak"
  for i = from or 1, #WAYS do
    if not tts.bad[i] then
      local ok, e = WAYS[i].fn(voice, text, rate, volume)
      if ok then return true, WAYS[i].name, i end
      if e then err = tostring(e) end
    end
  end
  return false, err
end

-- Speak text in a voice for gender ("male"/"female"/nil). Anything still being read is
-- stopped first; the new line starts a moment later, because a stop issued right before a
-- speak can swallow the new line too.
function C.Speak(text, gender)
  if not C.TTSAvailable() then return false end
  text = C.TTSClean(text)
  if text == "" then return false end
  tts.pending = tts.pending + 1
  local mine = tts.pending
  local voice, rate, volume = C.TTSVoice(gender), C.TTSRate(), C.TTSVolume()
  local function go()
    if mine ~= tts.pending then return end
    local ok, how, way = speakNow(voice, text, rate, volume)
    tts.lastHow, tts.lastVoice = how, voice
    if ok then
      tts.speaking = true
      tts.current = { mine = mine, way = way, voice = voice, text = text, rate = rate, volume = volume }
    else
      tts.lastError = how
    end
  end
  if tts.speaking then
    call("C_VoiceChat.StopSpeakingText")
    C.After(0.15, go)
  else
    go()
  end
  return true
end

function C.StopSpeaking()
  tts.pending = tts.pending + 1
  tts.current = nil
  call("C_VoiceChat.StopSpeakingText")
end

-- Name a VoiceTtsStatus number: from the client's enum, else the classic-era numbering.
local STATUS = { [0] = "Success", "InvalidEngineType", "EngineAllocationFailed", "NotSupported",
  "MaxCharactersExceeded", "UtteranceBelowMinimumDuration", "InputTextEnqueued", "SdkNotInitialized",
  "DestinationQueueFull", "EnqueueNotNecessary", "UtteranceNotFound", "ManagerNotFound",
  "InvalidArgument", "InternalError" }
local function statusName(n)
  if type(n) ~= "number" then return nil end
  local e = resolve("Enum.VoiceTtsStatus")
  if type(e) == "table" then
    for k, v in pairs(e) do if v == n then return k end end
    return nil
  end
  return STATUS[n]
end

-- Every way failing means the client's speech engine itself isn't playing, not a wrong
-- call: say so once, and let every way be tried again on the next line.
local ENGINE_DOWN = "RPG Dialogue: the game's own speech engine is failing (every method was rejected, "
  .. "status %s), so this is a client or Windows problem, not the addon. Try Options > Accessibility > "
  .. "Text to Speech > Play Sample; if that is silent too, set Options > Sound > Voice Chat output "
  .. "device to your speakers, and check Windows speech settings."
local function engineDown(status)
  tts.bad = {}
  tts.lastError = (tts.lastError or "") .. "; nothing else worked"
  if tts.verbose or not tts.warned then
    tts.warned = true
    C.Print(ENGINE_DOWN:format(status or "?"))
  end
end

-- Playback events (where the client has them) tell us whether a stop is needed, and why
-- a line failed. A failed line is read again the next way, and the failing way dropped.
function C.TTSEvents(on)
  on("VOICE_CHAT_TTS_PLAYBACK_STARTED", function() tts.speaking = true; tts.worked = tts.current and tts.current.way end)
  on("VOICE_CHAT_TTS_PLAYBACK_FINISHED", function() tts.speaking = false end)
  on("VOICE_CHAT_TTS_PLAYBACK_FAILED", function(_, a, b, c)
    tts.speaking = false
    -- The argument order differs between clients; the status is the small number.
    local parts, status = {}, nil
    for _, v in ipairs({ a, b, c }) do
      local n = type(v) == "number" and v < 100 and statusName(v)
      if n and not status then status = v .. "=" .. n end
      parts[#parts + 1] = n and (tostring(v) .. "=" .. n) or tostring(v)
    end
    tts.lastError = "playback failed (" .. table.concat(parts, ", ") .. ") via " .. tostring(tts.lastHow)
    if tts.verbose then C.Print("RPG Dialogue: text to speech failed: " .. tts.lastError .. ".") end
    local cur = tts.current
    if not (cur and cur.mine == tts.pending) or tts.worked == cur.way then return end
    tts.bad[cur.way] = true
    tts.current = nil
    local ok, how, way = speakNow(cur.voice, cur.text, cur.rate, cur.volume, cur.way + 1)
    tts.lastHow = how
    if ok then
      tts.speaking = true
      cur.way = way
      tts.current = cur
      if tts.verbose then C.Print("RPG Dialogue: trying " .. how .. " instead.") end
    else
      engineDown(status)
    end
  end)
end

---------------------------------------------------------------------------
-- Settings panel and launcher
---------------------------------------------------------------------------
function C.RegisterSettings(frame, name)
  local settings = resolve("Settings")
  if settings and settings.RegisterCanvasLayoutCategory then
    local ok, category = pcall(settings.RegisterCanvasLayoutCategory, frame, name)
    if ok and category then
      pcall(settings.RegisterAddOnCategory, category)
      return category
    end
  end
  frame.name = name
  call("InterfaceOptions_AddCategory", frame)
  return frame
end

function C.OpenSettings(category)
  local settings = resolve("Settings")
  if settings and settings.OpenToCategory and type(category) == "table" and category.GetID then
    if pcall(settings.OpenToCategory, category:GetID()) then return end
  end
  call("InterfaceOptionsFrame_OpenToCategory", category)
end

function C.RegisterCompartment(info)
  local frame = resolve("AddonCompartmentFrame")
  if frame and frame.RegisterAddon then
    return (pcall(frame.RegisterAddon, frame, info))
  end
  return false
end

function C.Minimap()
  return resolve("Minimap")
end

function C.CursorPosition()
  return call("GetCursorPosition")
end

---------------------------------------------------------------------------
-- Blizzard's own windows. We never hide, close or re-register them; we only read
-- whether they're shown, anchor to them, and (optionally) fade them while our
-- window covers them. See DESIGN.md R4.
---------------------------------------------------------------------------
-- DUIQuestFrame: DialogueUI's window, which takes the place of both GossipFrame and
-- QuestFrame when that addon is loaded (see DESIGN.md §8, "DialogueUI").
local FRAME_NAMES = {
  gossip = { "GossipFrame", "DUIQuestFrame" },
  quest = { "QuestFrame", "DUIQuestFrame" },
  merchant = { "MerchantFrame" },
  trainer = { "ClassTrainerFrame" },
  taxi = { "FlightMapFrame", "TaxiFrame" },
  bank = { "BankFrame" },
  stable = { "PetStableFrame", "StableFrame" },
  auction = { "AuctionHouseFrame", "AuctionFrame" },
}

function C.BlizzardFrame(kind)
  local names = FRAME_NAMES[kind]
  if not names then return nil end
  for i = 1, #names do
    local f = G[names[i]]
    if type(f) == "table" and f.IsShown and f:IsShown() then return f end
  end
  local f = G[names[1]]
  if type(f) == "table" and f.IsShown then return f end
  return nil
end

function C.AnyInteractionFrameShown()
  for kind in pairs(FRAME_NAMES) do
    local f = C.BlizzardFrame(kind)
    if f and f:IsShown() then return true, kind end
  end
  return false
end

function C.SetFaded(frame, faded)
  if not frame or not frame.SetAlpha then return end
  if frame == C.DialogueUIFrame() then return C.PinHidden(frame, faded) end
  pcall(frame.SetAlpha, frame, faded and 0 or 1)
end

---------------------------------------------------------------------------
-- DialogueUI (Peterodox's addon, which replaces the gossip and quest windows). Read from
-- its public source (github.com/Peterodox/YUI-Dialogue): its window is the global
-- DUIQuestFrame; hiding that window ends the NPC interaction, its intro animation sets
-- the window's alpha every frame for a moment, its keyboard listener sits at TOOLTIP
-- strata, and its "hide the game UI" option fades UIParent to nothing.
---------------------------------------------------------------------------
function C.DialogueUILoaded() return C.IsAddOnLoaded("DialogueUI") end

function C.DialogueUIFrame()
  local f = G.DUIQuestFrame
  if type(f) == "table" and type(f.IsShown) == "function" then return f end
  return nil
end

-- Keep a frame see-through while pinned, even if its owner animates its alpha (we never
-- Hide() it: for DialogueUI that would end the conversation with the NPC).
local pinned = setmetatable({}, { __mode = "k" })
local hooked = setmetatable({}, { __mode = "k" })
local pinning = false
function C.PinHidden(frame, on)
  if on then
    if not hooked[frame] then
      local hook = resolve("hooksecurefunc")
      if type(hook) == "function" then
        hooked[frame] = true
        pcall(hook, frame, "SetAlpha", function(self)
          if pinned[self] and not pinning then
            pinning = true
            pcall(self.SetAlpha, self, 0)
            pinning = false
          end
        end)
      end
    end
    pinned[frame] = true
    pcall(frame.SetAlpha, frame, 0)
  elseif pinned[frame] then
    pinned[frame] = nil
    pcall(frame.SetAlpha, frame, 1)
  end
end

function C.IsPinned(frame) return pinned[frame] == true end

-- Run fn(frame) whenever DialogueUI's window shows (hook only).
function C.OnDialogueUIShow(fn)
  local f = C.DialogueUIFrame()
  if not f or type(f.HookScript) ~= "function" then return false end
  f:HookScript("OnShow", fn)
  return true
end

-- UIParent's own scale, for windows we keep outside UIParent (so DialogueUI hiding the game
-- UI doesn't hide them too).
function C.UIParentScale()
  local p = G.UIParent
  local ok, v = pcall(p.GetScale, p)
  return ok and tonumber(v) or 1
end

---------------------------------------------------------------------------
-- Templates, sounds
---------------------------------------------------------------------------
local TEMPLATES = {
  backdrop = "BackdropTemplate",
  check = "UICheckButtonTemplate",
  button = "UIPanelButtonTemplate",
  close = "UIPanelCloseButton",
  editbox = "InputBoxTemplate",
  scroll = "UIPanelScrollFrameTemplate",
}

function C.Template(kind)
  local name = TEMPLATES[kind]
  if kind == "backdrop" and not resolve("BackdropTemplateMixin") then return nil end
  return name
end

function C.PlaySound(kitName)
  local kit = resolve("SOUNDKIT." .. kitName)
  if kit then call("PlaySound", kit) end
end
