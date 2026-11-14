-- Capture: how real NPC IDs, quest IDs and Blizzard's own text get into the content tools.
-- Everything goes into account-wide SavedVariables (RPGDialogueDB.capture), which
-- tools/import_capture.py and tools/export_reference.py read out of game.
-- Captured text is writing reference only. It never ships in dialogue.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local Cap = {}
ns.Capture = Cap

local MAX_GREETINGS = 6

local function store() return ns.db.capture end

local function subtitleOf(unit)
  local lines = C.TooltipLines(unit)
  local line = lines[2]
  if not line or line:find("^Level") then return nil end
  return (line:gsub("^<", ""):gsub(">$", ""))
end

-- Records a unit if it's an NPC. Returns npcID, record.
function Cap.Unit(unit, hasGossip)
  local id = C.NPCID(C.GUID(unit))
  if not id then return nil end
  local zone, sub = C.Zone()
  local mapID, x, y = C.MapPosition()
  local rec = store().npcs[id] or { first = C.Now(), n = 0 }
  rec.name = C.Name(unit) or rec.name
  rec.subtitle = subtitleOf(unit) or rec.subtitle
  rec.zone, rec.subzone, rec.mapID = zone, sub, mapID
  if x then rec.x, rec.y = math.floor(x * 10 + 0.5) / 10, math.floor(y * 10 + 0.5) / 10 end
  rec.level = C.Level(unit) or rec.level
  rec.elite = C.Classification(unit) or rec.elite
  rec.reaction = C.Reaction(unit) or rec.reaction
  rec.family = C.CreatureType(unit) or rec.family
  if hasGossip ~= nil then rec.gossip = rec.gossip or hasGossip end
  rec.last = C.Now()
  rec.n = (rec.n or 0) + 1
  store().npcs[id] = rec
  return id, rec
end

function Cap.Target()
  if not C.Exists("target") then ns.Print(L.CAPTURE_NO_TARGET); return end
  local id, rec = Cap.Unit("target")
  if not id then ns.Print(L.CAPTURE_NOT_NPC); return end
  ns.Print(L.CAPTURE_SAVED:format(rec.name or "?", id, rec.subzone ~= "" and rec.subzone or rec.zone or "?"))
end

function Cap.Summary()
  local s = store()
  local q = 0
  for _ in pairs(s.questText) do q = q + 1 end
  ns.Print(L.CAPTURE_COUNT:format(ns.Util.Count(s.npcs), ns.Util.Count(s.quests), ns.Util.Count(s.gossip), q))
end

-- What capture data exists for the zone you're in, and which NPCs you've talked to that have
-- no content yet (most-talked-to first): a to-do list for the next content pass.
function Cap.ZoneStatus()
  local zone = C.Zone()
  local s = store()
  local npcs, covered, quests, todo = 0, 0, 0, {}
  for id, rec in pairs(s.npcs) do
    local friendly = not rec.reaction or rec.reaction >= 4
    if rec.zone == zone and friendly then
      npcs = npcs + 1
      if ns.Data.FindNPC(id, rec.name) then
        covered = covered + 1
      elseif rec.gossip then
        todo[#todo + 1] = rec
      end
    end
  end
  for _, q in pairs(s.quests) do if q.zone == zone then quests = quests + 1 end end
  ns.Print(L.CAPTURE_ZONE:format(zone or "?", npcs, covered, quests))
  table.sort(todo, function(a, b) return (a.n or 0) > (b.n or 0) end)
  for i = 1, math.min(5, #todo) do
    ns.Print(L.CAPTURE_ZONE_TODO:format(todo[i].name or "?", todo[i].subzone or "", todo[i].n or 0))
  end
end

local function textOn() return ns.db and ns.db.settings.captureText end

local function currentNPC()
  local guid = C.GUID("npc")
  return C.NPCID(guid)
end

---------------------------------------------------------------------------
-- Gossip greeting text
---------------------------------------------------------------------------
ns.On("GOSSIP_SHOW", function()
  if not ns.db then return end
  local id = Cap.Unit("npc", true)
  if not id or not textOn() then return end
  local text = C.GossipText()
  local rec = store().gossip[id] or { greetings = {}, options = {} }
  if text and text ~= "" then
    local seen = false
    for _, g in ipairs(rec.greetings) do if g == text then seen = true break end end
    if not seen and #rec.greetings < MAX_GREETINGS then rec.greetings[#rec.greetings + 1] = text end
  end
  for _, o in ipairs(C.GossipOptions()) do
    if o.name then rec.options[o.name] = true end
  end
  rec.t = C.Now()
  store().gossip[id] = rec
end)

---------------------------------------------------------------------------
-- Quest text at each stage
---------------------------------------------------------------------------
local function questRecord(questID)
  local rec = store().questText[questID] or {}
  store().questText[questID] = rec
  return rec
end

local function captureQuestStage(stage)
  if not ns.db or not textOn() then return end
  local f = C.QuestFrameText()
  local questID = f.questID
  if not questID or questID == 0 then return end
  local npc = currentNPC()
  if npc then Cap.Unit("npc") end
  local rec = questRecord(questID)
  rec.title = f.title or rec.title
  if stage == "detail" then
    rec.description = f.text
    rec.objectives = f.objectives
    rec.giver = npc or rec.giver
  elseif stage == "progress" then
    rec.progress = f.progress
  elseif stage == "complete" then
    rec.completion = f.reward
    rec.turnin = npc or rec.turnin
  end
  rec.t = C.Now()
end

ns.On("QUEST_DETAIL", function() captureQuestStage("detail") end)
ns.On("QUEST_PROGRESS", function() captureQuestStage("progress") end)
ns.On("QUEST_COMPLETE", function() captureQuestStage("complete") end)
ns.On("QUEST_GREETING", function()
  if ns.db then Cap.Unit("npc", true) end
end)

---------------------------------------------------------------------------
-- Quest log: every quest accepted and turned in, with ID and title
---------------------------------------------------------------------------
ns.Listen("QUEST_ACCEPTED", function(questID)
  local q = store().quests[questID] or {}
  q.title = C.QuestTitle(questID) or q.title
  q.giver = currentNPC() or q.giver
  q.zone = (C.Zone())
  q.accepted = C.Now()
  -- The lowest level anyone took it at, and which factions took it: the simulation uses
  -- these to catch lines about quests a character couldn't have done yet.
  local lvl = C.Level("player")
  if lvl and (not q.minLevel or lvl < q.minLevel) then q.minLevel = lvl end
  local faction = C.Faction("player")
  if faction then q.factions = q.factions or {}; q.factions[faction] = true end
  store().quests[questID] = q
end)

ns.Listen("QUEST_TURNED_IN", function(questID)
  local q = store().quests[questID] or {}
  q.title = q.title or C.QuestTitle(questID)
  q.turnin = currentNPC() or q.turnin
  q.turnedIn = C.Now()
  store().quests[questID] = q
end)

---------------------------------------------------------------------------
-- Auto-capture: any NPC you interact with or target
---------------------------------------------------------------------------
ns.On("PLAYER_TARGET_CHANGED", function()
  if not ns.db or not ns.db.settings.autoCapture then return end
  if C.Exists("target") and not C.IsPlayer("target") then Cap.Unit("target") end
end)

ns.On("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", function()
  if not ns.db then return end
  if C.Exists("npc") then
    local _, rec = Cap.Unit("npc")
    if rec then rec.interacts = true end   -- opens a game window (vendor, trainer...) when right-clicked
  end
end)

-- Title -> questID lookup used to resolve TODO_QUEST("Title") placeholders at runtime.
function Cap.QuestIDByTitle(title)
  local norm = ns.Util.Norm(title)
  for title2, id in pairs(C.QuestLogByTitle()) do
    if ns.Util.Norm(title2) == norm then return id end
  end
  if not ns.db then return nil end
  for id, q in pairs(store().quests) do
    if q.title and ns.Util.Norm(q.title) == norm then return id end
  end
  for id, q in pairs(store().questText) do
    if q.title and ns.Util.Norm(q.title) == norm then return id end
  end
  return nil
end
