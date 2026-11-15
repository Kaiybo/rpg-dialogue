-- A small, controllable stand-in for the WoW client API, so the real addon code
-- (Compat included) runs under plain Lua 5.1. Tests change Mock.state and fire events.
local Mock = {}
_G.Mock = Mock

local function deepcopy(t)
  if type(t) ~= "table" then return t end
  local o = {}
  for k, v in pairs(t) do o[k] = deepcopy(v) end
  return o
end

local DEFAULT_STATE = {
  now = 1800000000, clock = 1000, hour = 14, minute = 0,
  date = { year = 2026, month = 11, monthDay = 13, weekday = 6 },
  combat = false,
  units = {
    player = { guid = "Player-1-0000AAAA", name = "Tester", level = 5, race = "Human", raceFile = "Human",
      class = "Warrior", classFile = "WARRIOR", sex = 2, faction = "Alliance", isPlayer = true, friendly = true },
  },
  zone = "Elwynn Forest", subzone = "Northshire Abbey", mapID = 1429, x = 0.48, y = 0.42,
  resting = false, mounted = false, stealthed = false, form = 0, inInstance = false,
  ghost = false, dead = false,
  durability = { [1] = { 50, 50 }, [5] = { 80, 80 }, [7] = { 60, 60 } },
  items = { [1] = 101, [5] = 105, [7] = 107, [8] = 108 },
  money = 1234, guild = nil, bind = "Northshire Abbey",
  auras = { HELPFUL = {}, HARMFUL = {} },
  questsDone = {}, questLog = {},   -- questLog[id] = { title, ready, objectives = {...} }
  questTitles = {},
  gossipText = "", gossipOptions = {},
  questFrame = {},
  addons = {},      -- list of { name, meta = {}, lod = true, load = function() end, loaded }
  secret = {},
  tooltip = {},     -- unit -> { lines }
  inRange = true,
  gameArt = true,       -- the client has the game's window art (atlases, NineSliceUtil)
  missingAtlas = {},    -- atlas name -> true: this client lacks it
  questTextContrast = 0,
  nineSliceFails = false,
  globals = { DRUNK_MESSAGE_SELF1 = "You feel sober again.", DRUNK_MESSAGE_SELF2 = "You feel tipsy.",
    DRUNK_MESSAGE_SELF3 = "You feel drunk.  Woah!", DRUNK_MESSAGE_SELF4 = "You feel completely smashed." },
}

Mock.chat = {}
Mock.timers = {}
Mock.frames = {}
Mock.calls = {}

function Mock.Reset()
  Mock.state = deepcopy(DEFAULT_STATE)
  Mock.chat = {}
  Mock.timers = {}
  Mock.calls = {}
  Mock.frames = {}
  _G.DUIQuestFrame = nil   -- another addon's window, made by tests that need it
  if Mock.CreateBaseFrames then Mock.CreateBaseFrames() end
end

local S = function() return Mock.state end
local function unit(u) return S().units[u] end

---------------------------------------------------------------------------
-- Frames: every unknown method is a harmless no-op returning nil.
---------------------------------------------------------------------------
local frameMethods = {}
-- Widget methods are CamelCase; our own fields on frames are lower case and must read nil.
frameMethods.__index = function(t, k)
  local m = rawget(frameMethods, k)
  if m then return m end
  if type(k) == "string" and k:match("^%u") then return function() return nil end end
  return nil
end

function frameMethods.RegisterEvent(self, ev)
  if Mock.unknownEvents and Mock.unknownEvents[ev] then error("Attempt to register unknown event " .. ev) end
  self._events[ev] = true
end
function frameMethods.RegisterUnitEvent(self, ev) self._events[ev] = true end
function frameMethods.UnregisterEvent(self, ev) self._events[ev] = nil end
function frameMethods.UnregisterAllEvents(self) self._events = {} end
function frameMethods.SetScript(self, name, fn) self._scripts[name] = fn end
function frameMethods.GetScript(self, name) return self._scripts[name] end
function frameMethods.HookScript(self, name, fn)
  local old = self._scripts[name]
  self._scripts[name] = function(...) if old then old(...) end fn(...) end
end
function frameMethods.Show(self)
  local was = self._shown
  self._shown = true
  if not was and self._scripts.OnShow then self._scripts.OnShow(self) end
end
function frameMethods.Hide(self)
  local was = self._shown
  self._shown = false
  if was and self._scripts.OnHide then self._scripts.OnHide(self) end
end
function frameMethods.SetShown(self, v) if v then self:Show() else self:Hide() end end
function frameMethods.IsShown(self) return self._shown end
function frameMethods.IsVisible(self) return self._shown end
-- Like the real client: text on a FontString or EditBox needs a font first (a template,
-- SetFont or SetFontObject), or it errors "Font not set".
function frameMethods.SetText(self, t)
  if (self._type == "FontString" or self._type == "EditBox") and not self._font then
    error(self._type .. ":SetText(): Font not set", 2)
  end
  self._text = t
end
function frameMethods.SetFont(self, path) if path and path ~= "" then self._font = true end return true end
function frameMethods.SetFontObject(self, obj) if obj then self._font = true end end
function frameMethods.GetText(self) return self._text end
function frameMethods.SetAlpha(self, a) self._alpha = a end
function frameMethods.GetAlpha(self) return self._alpha or 1 end
function frameMethods.GetName(self) return self._name end
function frameMethods.GetParent(self) return self._parent end
function frameMethods.GetWidth() return 100 end
function frameMethods.GetHeight(self) return self._height or 20 end
function frameMethods.SetHeight(self, h) self._height = h end
function frameMethods.GetStringHeight() return 14 end
function frameMethods.GetStringWidth() return 80 end
function frameMethods.GetNumLetters(self) return #(self._text or "") end
function frameMethods.GetPoint() return "CENTER", nil, "CENTER", 0, 0 end
function frameMethods.GetNumPoints() return 1 end
function frameMethods.GetFont() return "Fonts\\FRIZQT__.TTF", 14, "" end
function frameMethods.GetChecked(self) return self._checked end
function frameMethods.SetChecked(self, v) self._checked = v end
function frameMethods.GetValue(self) return self._value or 0 end
function frameMethods.SetValue(self, v)
  self._value = v
  if self._scripts.OnValueChanged then self._scripts.OnValueChanged(self, v) end
end
function frameMethods.IsMouseOver() return false end
function frameMethods.CreateFontString(self, _, _, template)
  local fs = Mock.NewFrame("FontString", nil, self)
  fs._font = template ~= nil
  return fs
end
function frameMethods.CreateTexture(self) return Mock.NewFrame("Texture", nil, self) end
function frameMethods.CreateMaskTexture(self) return Mock.NewFrame("MaskTexture", nil, self) end
-- Textures remember what they show, so tests can check which art was picked.
function frameMethods.SetAtlas(self, name) self._atlas = name; self._texture = nil end
function frameMethods.SetTexture(self, file) self._texture = file; self._atlas = nil; return true end
function frameMethods.SetColorTexture(self, r, g, b, a) self._color = { r, g, b, a }; self._texture, self._atlas = nil, nil end
function frameMethods.GetAtlas(self) return self._atlas end
function frameMethods.SetTexCoord(self, ...) self._coords = { ... } end
function frameMethods.GetTexture(self) return self._texture end
function frameMethods.SetTextColor(self, r, g, b) self._textColor = { r, g, b } end
function frameMethods.GetTextColor(self) local c = self._textColor or { 1, 1, 1 }; return c[1], c[2], c[3] end
function frameMethods.CreateAnimationGroup(self) return Mock.NewFrame("AnimationGroup", nil, self) end
function frameMethods.CreateAnimation(self) return Mock.NewFrame("Animation", nil, self) end
function frameMethods.GetFrameLevel() return 1 end
function frameMethods.GetFrameStrata() return "MEDIUM" end
function frameMethods.GetObjectType(self) return self._type end
function frameMethods.Click(self)
  if self._scripts.OnClick then self._scripts.OnClick(self, "LeftButton") end
end

function Mock.NewFrame(ftype, name, parent)
  local f = setmetatable({ _type = ftype, _name = name, _parent = parent, _events = {}, _scripts = {}, _shown = true }, frameMethods)
  Mock.frames[#Mock.frames + 1] = f
  if name then _G[name] = f end
  return f
end

function CreateFrame(ftype, name, parent, template)
  local f = Mock.NewFrame(ftype, name, parent)
  if template then f._font = true end
  return f
end

function Mock.CreateBaseFrames()
  UIParent = Mock.NewFrame("Frame", "UIParent")
  WorldFrame = Mock.NewFrame("Frame", "WorldFrame")
  GameTooltip = Mock.NewFrame("GameTooltip", "GameTooltip")
  Minimap = Mock.NewFrame("Frame", "Minimap")
end
Mock.Reset()
DEFAULT_CHAT_FRAME = { AddMessage = function(_, msg) Mock.chat[#Mock.chat + 1] = msg end }
for _, n in ipairs({ "GameFontNormal", "GameFontNormalSmall", "GameFontNormalLarge", "GameFontHighlight",
  "GameFontHighlightSmall", "GameFontHighlightLarge", "GameFontDisable", "QuestFont" }) do
  _G[n] = { GetFont = function() return "Fonts\\FRIZQT__.TTF", 12, "" end }
end
STANDARD_TEXT_FONT = "Fonts\\FRIZQT__.TTF"
SlashCmdList = {}
BackdropTemplateMixin = {}
SOUNDKIT = { IG_QUEST_LIST_OPEN = 1, IG_QUEST_LIST_CLOSE = 2, IG_MAINMENU_OPTION_CHECKBOX_ON = 3 }
function PlaySound(id) Mock.calls[#Mock.calls + 1] = { "PlaySound", id } end

---------------------------------------------------------------------------
-- The game's window art: atlases, frame borders, portraits, material colors
---------------------------------------------------------------------------
C_Texture = {
  GetAtlasInfo = function(name)
    if not S().gameArt or S().missingAtlas[name] then return nil end
    if tostring(name):find("^QuestBG") then
      -- The quest parchment: part of a bigger texture file.
      return { width = 330, height = 420, file = 9001, leftTexCoord = 0, rightTexCoord = 0.5,
               topTexCoord = 0, bottomTexCoord = 0.8 }
    end
    return { width = 16, height = 16, file = 1 }
  end,
}
local NINE = { "TopLeftCorner", "TopRightCorner", "BottomLeftCorner", "BottomRightCorner",
  "TopEdge", "BottomEdge", "LeftEdge", "RightEdge" }
NineSliceUtil = {
  GetLayout = function(name) if S().gameArt then return { name = name } end end,
  ApplyLayoutByName = function(container, name)
    if S().nineSliceFails then error("layout " .. tostring(name) .. " failed") end
    for _, piece in ipairs(NINE) do
      if not rawget(container, piece) then rawset(container, piece, container:CreateTexture()) end
      rawget(container, piece):SetAtlas(name .. ":" .. piece)
    end
  end,
}
function SetPortraitTexture(tex, u)
  Mock.calls[#Mock.calls + 1] = { "SetPortraitTexture", u }
  tex._portrait = u
end
function GetMaterialTextColors(material)
  if material == "Stone" then return { 1, 1, 1 }, { 1, 0.82, 0.4 } end
  return { 0.2, 0.12, 0.06 }, { 0, 0, 0 }
end
function GetCVarNumberOrDefault(name)
  if name == "questTextContrast" then return S().questTextContrast end
end
QuestTextContrast = { GetDefaultBackgroundAtlas = function() return "QuestBG-Parchment" end }
QuestUtil = {
  GetQuestIconOfferForQuestID = function() return "Interface/GossipFrame/AvailableQuestIcon", false end,
  GetQuestIconActiveForQuestID = function(_, complete)
    if complete then return "Interface/GossipFrame/ActiveQuestIcon", false end
    return "SideInProgressquesticon", true
  end,
}

-- Post-hooks, like the client's (the original runs first, then the hook).
function hooksecurefunc(t, name, fn)
  if type(t) == "string" then t, name, fn = _G, t, name end
  local orig = t[name]
  t[name] = function(...)
    local r = { orig(...) }
    fn(...)
    return unpack(r)
  end
end

function Mock.Fire(event, ...)
  for _, f in ipairs(Mock.frames) do
    if f._events[event] and f._scripts.OnEvent then f._scripts.OnEvent(f, event, ...) end
  end
end

function Mock.RunTimers()
  local list = Mock.timers
  Mock.timers = {}
  for _, t in ipairs(list) do t() end
end

---------------------------------------------------------------------------
-- Time, combat, misc
---------------------------------------------------------------------------
function GetServerTime() return S().now end
function GetTime() return S().clock end
function GetGameTime() return S().hour, S().minute end
function InCombatLockdown() return S().combat end
function GetBuildInfo() return "1.60.1", "99999", "Nov 1 2026", 16001 end
C_DateAndTime = { GetCurrentCalendarTime = function() return S().date end }
C_Timer = {
  After = function(_, fn) Mock.timers[#Mock.timers + 1] = fn end,
  NewTicker = function(_, fn) return { Cancel = function() end, fn = fn } end,
}
function issecretvalue(v) return S().secret[v] == true end

Enum = { PlayerInteractionType = { None = 0, Gossip = 3, QuestGiver = 4, Merchant = 5, TaxiNode = 6,
  Trainer = 7, Banker = 8, Binder = 20, Auctioneer = 21, StableMaster = 22, SpiritHealer = 18 } }

---------------------------------------------------------------------------
-- Add-ons
---------------------------------------------------------------------------
C_AddOns = {}
function C_AddOns.GetNumAddOns() return #S().addons end
function C_AddOns.GetAddOnInfo(i)
  local a = type(i) == "number" and S().addons[i] or nil
  if not a then for _, x in ipairs(S().addons) do if x.name == i then a = x end end end
  if not a then return nil end
  return a.name, a.name, "", true, nil, "INSECURE", false
end
function C_AddOns.GetAddOnMetadata(name, field)
  for _, a in ipairs(S().addons) do if a.name == name then return a.meta[field] end end
  return nil
end
function C_AddOns.IsAddOnLoaded(name)
  for _, a in ipairs(S().addons) do if a.name == name then return a.loaded == true, a.loaded == true end end
  return false, false
end
function C_AddOns.GetAddOnEnableState() return 2 end
function C_AddOns.LoadAddOn(name)
  for _, a in ipairs(S().addons) do
    if a.name == name then
      if not a.loaded then a.loaded = true; if a.load then a.load() end end
      return true
    end
  end
  return false, "MISSING"
end
function UpdateAddOnMemoryUsage() end
function GetAddOnMemoryUsage() return 123 end

---------------------------------------------------------------------------
-- Units
---------------------------------------------------------------------------
function UnitGUID(u) local x = unit(u); return x and x.guid end
function UnitExists(u) return unit(u) ~= nil end
function UnitName(u) local x = unit(u); return x and x.name end
function UnitLevel(u) local x = unit(u); return x and x.level end
function UnitRace(u) local x = unit(u); if x then return x.race, x.raceFile, 1 end end
function UnitClass(u) local x = unit(u); if x then return x.class, x.classFile, 1 end end
function UnitSex(u) local x = unit(u); return x and x.sex end
function UnitFactionGroup(u) local x = unit(u); return x and x.faction end
function UnitClassification(u) local x = unit(u); return x and (x.classification or "normal") end
function UnitReaction(u) local x = unit(u); return x and (x.reaction or 5) end
function UnitIsPlayer(u) local x = unit(u); return x and x.isPlayer == true end
function UnitIsFriend(_, u) local x = unit(u); return x and x.friendly ~= false end
function UnitCreatureFamily(u) local x = unit(u); return x and x.family end
function UnitCreatureType(u) local x = unit(u); return x and x.ctype end
function UnitIsGhost() return S().ghost end
function UnitIsDeadOrGhost() return S().dead or S().ghost end
function GetGuildInfo() return S().guild, S().guild and "Member" or nil, 1 end
function GetMoney() return S().money end
function GetNumSubgroupMembers() return 0 end
function GetCurrentTitle() return 0 end
function GetInventoryItemDurability(slot) local d = S().durability[slot]; if d then return d[1], d[2] end end
function GetInventoryItemID(_, slot) return S().items[slot] end
function GetProfessions() return nil end
function GetProfessionInfo() return nil end
C_GameRules = { IsHardcoreActive = function() return false end }
function CheckInteractDistance() return S().inRange end

---------------------------------------------------------------------------
-- Place, state
---------------------------------------------------------------------------
function GetRealZoneText() return S().zone end
function GetSubZoneText() return S().subzone end
C_Map = {
  GetBestMapForUnit = function() return S().mapID end,
  GetPlayerMapPosition = function() return { GetXY = function() return S().x, S().y end } end,
}
function IsResting() return S().resting end
function IsMounted() return S().mounted end
function IsStealthed() return S().stealthed end
function IsInInstance() return S().inInstance, S().inInstance and "party" or "none" end
function GetShapeshiftFormID() return S().form end
function GetFactionInfoByID(id)
  local st = S().reputation and S().reputation[id]
  if st then return "Faction " .. id, "", st end
end
function GetBindLocation() return S().bind end
function ItemTextGetItem() return S().bookTitle end

C_UnitAuras = {
  GetAuraDataByIndex = function(_, i, filter) return S().auras[filter or "HELPFUL"][i] end,
}

C_TooltipInfo = {
  GetUnit = function(u) local t = S().tooltip[u]; if t then return { lines = t } end end,
}

---------------------------------------------------------------------------
-- Quests and gossip
---------------------------------------------------------------------------
C_QuestLog = {}
function C_QuestLog.IsQuestFlaggedCompleted(id) return S().questsDone[id] == true end
function C_QuestLog.GetLogIndexForQuestID(id) if S().questLog[id] then return 1 end end
function C_QuestLog.ReadyForTurnIn(id) local q = S().questLog[id]; return q and q.ready == true end
function C_QuestLog.IsComplete(id) local q = S().questLog[id]; return q and q.ready == true end
function C_QuestLog.GetQuestObjectives(id) local q = S().questLog[id]; return q and q.objectives or {} end
function C_QuestLog.GetTitleForQuestID(id)
  local q = S().questLog[id]
  return (q and q.title) or S().questTitles[id]
end
function C_QuestLog.GetNumQuestLogEntries()
  local n = 0
  for _ in pairs(S().questLog) do n = n + 1 end
  return n, n
end
function C_QuestLog.GetInfo(i)
  local ids = {}
  for id in pairs(S().questLog) do ids[#ids + 1] = id end
  table.sort(ids)
  local id = ids[i]
  if id then return { title = S().questLog[id].title, questID = id, isHeader = false } end
end

C_GossipInfo = {
  GetText = function() return S().gossipText end,
  GetOptions = function() return S().gossipOptions end,
  GetAvailableQuests = function() return Mock.state.gossipAvailable or {} end,
  GetActiveQuests = function() return Mock.state.gossipActive or {} end,
  SelectOption = function(id) Mock.calls[#Mock.calls + 1] = { "SelectOption", id } end,
  SelectAvailableQuest = function(id) Mock.calls[#Mock.calls + 1] = { "SelectAvailableQuest", id } end,
  SelectActiveQuest = function(id) Mock.calls[#Mock.calls + 1] = { "SelectActiveQuest", id } end,
  CloseGossip = function() Mock.calls[#Mock.calls + 1] = { "CloseGossip" } end,
}
function CloseQuest() Mock.calls[#Mock.calls + 1] = { "CloseQuest" } end
-- Quest window greeting page: state.greeting = { available = { "Title" }, active = { { "Title", complete } } }
local function greeting() return S().greeting or { available = {}, active = {} } end
function GetNumAvailableQuests() return #greeting().available end
function GetAvailableTitle(i) return greeting().available[i] end
function GetNumActiveQuests() return #greeting().active end
function GetActiveTitle(i) local q = greeting().active[i]; if q then return q[1], q[2] end end
function SelectAvailableQuest(i) Mock.calls[#Mock.calls + 1] = { "SelectAvailableQuest#", i } end
function SelectActiveQuest(i) Mock.calls[#Mock.calls + 1] = { "SelectActiveQuest#", i } end
function GetQuestID() return S().questFrame.questID end
function GetTitleText() return S().questFrame.title end
function GetQuestText() return S().questFrame.text end
function GetObjectiveText() return S().questFrame.objectives end
function GetProgressText() return S().questFrame.progress end
function GetRewardText() return S().questFrame.reward end
function GetGreetingText() return S().questFrame.greeting end
-- Quest pages: state.questFrame.choices / rewards / required = { { name, texture, count, quality, usable } },
-- state.bags = { [itemName] = count } for GetItemCount,
-- money, xp, cost, completable, auto, pvp.
local QUEST_LISTS = { choice = "choices", reward = "rewards", required = "required" }
local function questList(kind) return S().questFrame[QUEST_LISTS[kind]] or {} end
function GetNumQuestChoices() return #questList("choice") end
function GetNumQuestRewards() return #questList("reward") end
function GetNumQuestItems() return #questList("required") end
function GetQuestItemInfo(kind, i)
  local it = questList(kind)[i]
  if it then
    local name = (S().itemsLoading or {})[it[1]] and "" or it[1]
    return name, it[2], it[3] or 1, it[4] or 1, it[5] ~= false
  end
end
function GetQuestItemLink(kind, i)
  local it = questList(kind)[i]
  if it then return "|Hitem:" .. tostring(it[2]) .. "|h[" .. it[1] .. "]|h" end
end
-- Item IDs on the quest page are their texture numbers (as in GetQuestItemLink above).
local function itemNameForID(id)
  for _, kind in ipairs({ "choice", "reward", "required" }) do
    for _, it in ipairs(questList(kind)) do if tonumber(it[2]) == tonumber(id) then return it[1] end end
  end
end
function GetItemCount(item)
  local name = tonumber(item) and itemNameForID(item) or tostring(item):match("%[(.-)%]") or item
  return (S().bags or {})[name] or 0
end
-- Items whose names the client hasn't loaded yet: state.itemsLoading = { [name] = true }.
-- GetQuestItemInfo gives "" for them until a test clears the flag and fires GET_ITEM_INFO_RECEIVED.
C_Item = C_Item or {}
function C_Item.GetItemNameByID(id)
  local name = itemNameForID(id)
  if name and not (S().itemsLoading or {})[name] then return name end
end
function C_Item.RequestLoadItemDataByID(id) Mock.calls[#Mock.calls + 1] = { "RequestLoadItemDataByID", id } end
function GetRewardMoney() return S().questFrame.money or 0 end
function GetRewardXP() return S().questFrame.xp or 0 end
function GetQuestMoneyToGet() return S().questFrame.cost or 0 end
function IsQuestCompletable() return S().questFrame.completable == true end
function QuestGetAutoAccept() return S().questFrame.auto == true end
function QuestFlagsPVP() return S().questFrame.pvp == true end
function AcceptQuest() Mock.calls[#Mock.calls + 1] = { "AcceptQuest" } end
function AcknowledgeAutoAcceptQuest() Mock.calls[#Mock.calls + 1] = { "AcknowledgeAutoAcceptQuest" } end
function CompleteQuest() Mock.calls[#Mock.calls + 1] = { "CompleteQuest" } end
function GetQuestReward(i) Mock.calls[#Mock.calls + 1] = { "GetQuestReward", i } end

-- Global strings
setmetatable(_G, {
  __index = function(_, k)
    local s = rawget(Mock, "state")
    if s and s.globals[k] ~= nil then return s.globals[k] end
    return nil
  end,
})

return Mock
