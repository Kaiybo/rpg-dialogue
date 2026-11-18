-- Content packs: discovery (TOC metadata), load-on-demand by zone, registration through
-- the public RPGDialogueAPI, and merging when two packs cover the same NPC.
local _, ns = ...

local C = ns.Compat
local U = ns.Util

local Data = {
  npcs = {},      -- key -> NPC definition (merged across packs)
  byID = {},      -- npcID -> key
  byName = {},    -- normalized name -> key (for TODO ids)
  pools = {},     -- list
  generic = {},   -- list
  threads = {}, claims = {}, topics = {}, towns = {}, origins = {}, rumors = {}, books = {}, errands = {}, letters = {},
  views = {},     -- topic id -> list of things the player can say back (0.82.0)
  directions = {}, -- town id -> list of "Where is...?" entries (several packs may add to one town)
  arrivals = {},  -- zone name -> list of diary entries for a first arrival (first match wins)
  persuade = {},  -- reply sets for Admire / Taunt / Intimidate (0.85.0)
  lines = {},     -- global line id -> { line = , owner = , slot = }
}
ns.Data = Data

local Packs = { list = {}, byID = {}, byAddon = {}, zoneIndex = {} }
ns.Packs = Packs

Packs.FORMAT = 1     -- highest data format this core understands
Packs.API_VERSION = 1

---------------------------------------------------------------------------
-- Placeholders for IDs we don't have yet (constraint 6)
---------------------------------------------------------------------------
local function todo(kind)
  return function(name) return { todo = kind, name = name } end
end
local TODO = {
  TODO_NPC = todo("npc"), TODO_QUEST = todo("quest"), TODO_ITEM = todo("item"),
  TODO_SPELL = todo("spell"), TODO_MAP = todo("map"),
}

---------------------------------------------------------------------------
-- Indexing helpers
---------------------------------------------------------------------------
local function indexLine(line, gid, owner, slot)
  line._gid = gid
  line._owner = owner
  line._slot = slot
  Data.lines[gid] = { line = line, owner = owner, slot = slot }
end

local function indexList(list, prefix, owner, slot)
  for _, line in ipairs(list or {}) do
    if line.id then indexLine(line, prefix .. "." .. line.id, owner, slot) end
  end
end

local function indexTopics(topics, prefix, owner)
  for topic, list in pairs(topics or {}) do
    for _, line in ipairs(list) do
      if line.id then indexLine(line, prefix .. "." .. line.id, owner, "topic") end
      line._topic = topic
    end
  end
end

local function indexNPC(def)
  indexList(def.barks, def.key, def.key, "bark")
  indexList(def.greetings, def.key, def.key, "greeting")
  indexList(def.notice, def.key, def.key, "notice")
  indexList(def.react, def.key, def.key, "react")
  for nodeId, node in pairs(def.nodes or {}) do
    node._id = nodeId
    indexList(node.lines, def.key, def.key, "line")
    indexList(node.again, def.key, def.key, "again")
  end
  indexTopics(def.topics, def.key, def.key)
  -- Their own answers to Admire / Taunt / Intimidate (0.85.0).
  for action, byResult in pairs(def.persuade or {}) do
    if type(byResult) == "table" then
      for result, list in pairs(byResult) do
        indexList(list, def.key .. ".persuade_" .. action .. "_" .. result, def.key, "persuade")
      end
    end
  end
  -- Their own things the player can say back (0.82.0), and their answers to them.
  for topic, list in pairs(def.views or {}) do
    for _, v in ipairs(list) do
      v._topic = topic
      if v.id then indexList(v.replies, def.key .. ".view_" .. topic .. "." .. v.id, def.key, "view") end
    end
  end
end

local function warn(pack, msg)
  if ns.Debug then ns.Debug("pack " .. tostring(pack and pack.id) .. ": " .. msg) end
  if pack then pack.warnings[#pack.warnings + 1] = msg end
end

---------------------------------------------------------------------------
-- Registration (called from pack files through the pack handle)
---------------------------------------------------------------------------
local function mergeNPC(old, new, pack)
  if new.override and (pack.priority or 0) >= (old._priority or 0) then return new end
  for _, field in ipairs({ "greetings", "notice", "react" }) do
    if new[field] then
      old[field] = old[field] or {}
      for _, l in ipairs(new[field]) do old[field][#old[field] + 1] = l end
    end
  end
  old.nodes = old.nodes or {}
  for id, node in pairs(new.nodes or {}) do
    if not old.nodes[id] or (pack.priority or 0) > (old._priority or 0) then old.nodes[id] = node end
  end
  if new.persuade then
    old.persuade = old.persuade or {}
    for action, byResult in pairs(new.persuade) do
      old.persuade[action] = old.persuade[action] or {}
      for result, list in pairs(byResult) do
        local into = old.persuade[action][result] or {}
        old.persuade[action][result] = into
        for _, l in ipairs(list) do into[#into + 1] = l end
      end
    end
  end
  old.topics = old.topics or {}
  for topic, list in pairs(new.topics or {}) do
    old.topics[topic] = old.topics[topic] or {}
    for _, l in ipairs(list) do old.topics[topic][#old.topics[topic] + 1] = l end
  end
  old._packs[#old._packs + 1] = pack.id
  return old
end

local kinds = {}

function kinds.NPC(pack, def)
  if type(def.key) ~= "string" then return warn(pack, "NPC without key") end
  -- A file made by tools/new_zone.py that nobody has written yet: the NPC stays pooled.
  if def.scaffold then pack.scaffolds = (pack.scaffolds or 0) + 1; return end
  def._pack = pack.id
  def._priority = pack.priority or 0
  def._packs = { pack.id }
  def.start = def.start or "hello"
  local existing = Data.npcs[def.key]
  local merged = existing and mergeNPC(existing, def, pack) or def
  Data.npcs[def.key] = merged
  indexNPC(def)
  if type(def.id) == "number" then
    Data.byID[def.id] = def.key
  elseif U.IsTodo(def.id) then
    pack.todos = (pack.todos or 0) + 1
  end
  local name = def.name or (U.IsTodo(def.id) and def.id.name)
  if name then Data.byName[U.Norm(name)] = def.key end
end

function kinds.Pool(pack, def)
  if not def.id or not def.role then return warn(pack, "Pool needs id and role") end
  def._pack = pack.id
  local prefix = "pool:" .. def.id
  indexList(def.greetings, prefix, prefix, "greeting")
  indexList(def.notice, prefix, prefix, "notice")
  indexList(def.react, prefix, prefix, "react")
  indexList(def.lines, prefix, prefix, "line")
  indexList(def.barks, prefix, prefix, "bark")
  indexTopics(def.topics, prefix, prefix)
  -- Pools may carry whole conversation trees (spirit healers): they then act as one
  -- shared character for every NPC of that role.
  for nodeId, node in pairs(def.nodes or {}) do
    node._id = nodeId
    indexList(node.lines, prefix, prefix, "line")
  end
  if def.nodes then def.start = def.start or "hello" end
  Data.pools[#Data.pools + 1] = def
end

function kinds.Generic(pack, def)
  def.id = def.id or ("generic" .. (#Data.generic + 1))
  def._pack = pack.id
  local prefix = "generic:" .. def.id
  indexList(def.greetings, prefix, prefix, "greeting")
  indexList(def.lines, prefix, prefix, "line")
  indexTopics(def.topics, prefix, prefix)
  Data.generic[#Data.generic + 1] = def
end

local function simpleKind(store)
  return function(pack, def)
    if not def.id then return warn(pack, "definition without id") end
    def._pack = pack.id
    Data[store][def.id] = def
  end
end
-- Threads: beats are indexed as lines (global id "thread:<id>.<beat>") and by NPC key.
Data.beatsByNpc = {}
function kinds.Thread(pack, def)
  if not def.id then return warn(pack, "thread without id") end
  def._pack = pack.id
  Data.threads[def.id] = def
  for _, beat in ipairs(def.beats or {}) do
    if beat.id and beat.npc then
      indexLine(beat, "thread:" .. def.id .. "." .. beat.id, "thread:" .. def.id, "beat")
      beat._thread = def
      Data.beatsByNpc[beat.npc] = Data.beatsByNpc[beat.npc] or {}
      table.insert(Data.beatsByNpc[beat.npc], beat)
    else
      warn(pack, "thread " .. def.id .. ": beat needs id and npc")
    end
  end
end
kinds.Claim = simpleKind("claims")
kinds.Topic = simpleKind("topics")
kinds.Book = simpleKind("books")
kinds.Errand = simpleKind("errands")
kinds.Letter = simpleKind("letters")
kinds.Town = simpleKind("towns")
kinds.Origin = simpleKind("origins")
-- Gut feelings (Systems/Insight.lua): note pools by tell, with class-flavored variants.
function kinds.GutNotes(pack, def)
  def._pack = pack.id
  if ns.Insight then ns.Insight.Add(def) end
end
-- Views (0.82.0): what the player can say back after an "Ask about..." answer. One
-- definition per topic (topic = "_any" for every topic without views of its own); several
-- packs may add to the same topic. Replies are indexed as lines "view:<topic>.<view>.<id>".
function kinds.Views(pack, def)
  local topic = def.topic or def.id
  if type(topic) ~= "string" or type(def.views) ~= "table" then return warn(pack, "Views needs a topic and views") end
  def._pack = pack.id
  Data.views[topic] = Data.views[topic] or {}
  local list = Data.views[topic]
  for _, v in ipairs(def.views) do
    v._topic = topic
    if v.id then indexList(v.replies, "view:" .. topic .. "." .. v.id, "view:" .. topic, "view") end
    list[#list + 1] = v
  end
end
-- Directions: "Where is...?" for one town. { town = "<town id>", mapID = ?, entries = { { id,
-- name, kind, class?, profession?, text, x?, y? } } }. Several packs may add to one town; a
-- later entry with the same id replaces the earlier one.
function kinds.Directions(pack, def)
  if type(def.town) ~= "string" or type(def.entries) ~= "table" then return warn(pack, "Directions needs a town and entries") end
  def._pack = pack.id
  local list = Data.directions[def.town] or {}
  Data.directions[def.town] = list
  for _, e in ipairs(def.entries) do
    if type(e) == "table" and e.id and e.name then
      e._town, e._mapID = def.town, e.mapID or def.mapID
      local replaced = false
      for i, old in ipairs(list) do
        if old.id == e.id then list[i] = e; replaced = true; break end
      end
      if not replaced then list[#list + 1] = e end
    else
      warn(pack, "directions for " .. def.town .. ": an entry needs id and name")
    end
  end
end
-- Persuade (0.85.0): how people answer Admire, Taunt and Intimidate.
--   P:Persuade { id, role = "guard" | {..}, subtitle = "..", faction = "Horde", zone = "..",
--     admire = { success = { lines }, fail = { lines } }, taunt = {..}, intimidate = {..} }
-- Lines are indexed "persuade:<id>.<action>.<result>.<line id>".
function kinds.Persuade(pack, def)
  if not def.id then return warn(pack, "Persuade without id") end
  def._pack = pack.id
  for _, action in ipairs({ "admire", "joke", "taunt", "intimidate" }) do
    for _, result in ipairs({ "success", "fail" }) do
      local list = def[action] and def[action][result]
      indexList(list, "persuade:" .. def.id .. "." .. action .. "." .. result, "persuade:" .. def.id, "persuade")
    end
  end
  Data.persuade[#Data.persuade + 1] = def
end
-- Arrivals: what the character writes in the diary the first time they reach a zone.
function kinds.Arrival(pack, def)
  if type(def.zone) ~= "string" then return warn(pack, "Arrival needs a zone name") end
  def._pack = pack.id
  Data.arrivals[def.zone] = Data.arrivals[def.zone] or {}
  table.insert(Data.arrivals[def.zone], def)
end
-- Rumors: lines innkeepers (or any role listed) may pass on.
function kinds.Rumors(pack, def)
  if not def.id then return warn(pack, "rumors without id") end
  def._pack = pack.id
  Data.rumors[def.id] = def
  indexList(def.lines, "rumor:" .. def.id, "rumor:" .. def.id, "rumor")
end

local function newHandle(meta)
  local pack = {
    id = meta.id, name = meta.name or meta.id, author = meta.author, version = meta.version,
    format = meta.format or 1, priority = meta.priority or 0, requires = meta.requires or {},
    warnings = {}, counts = {}, registered = true,
  }
  for k, fn in pairs(TODO) do pack[k] = fn end
  for kind, fn in pairs(kinds) do
    pack[kind] = function(self, def)
      if self.refused then return end
      if type(def) ~= "table" then return warn(self, kind .. " called without a table") end
      self.counts[kind] = (self.counts[kind] or 0) + 1
      fn(self, def)
    end
  end
  return pack
end

---------------------------------------------------------------------------
-- The public API (the one extra global; DESIGN.md §6)
---------------------------------------------------------------------------
local API = { version = Packs.API_VERSION, format = Packs.FORMAT }
for k, fn in pairs(TODO) do API[k] = fn end

function API:RegisterPack(meta)
  assert(type(meta) == "table" and type(meta.id) == "string", "RegisterPack needs { id = ... }")
  local existing = Packs.byID[meta.id]
  if existing and existing.registered then return existing end
  local pack = newHandle(meta)
  if existing then
    for k, v in pairs(existing) do if pack[k] == nil then pack[k] = v end end
  end
  if (meta.format or 1) > Packs.FORMAT then
    pack.refused = ("needs data format %d, this version of RPG Dialogue reads up to %d"):format(meta.format, Packs.FORMAT)
    ns.Print(("Content pack %s was not loaded: %s. Update RPG Dialogue."):format(pack.name, pack.refused))
  end
  Packs.byID[meta.id] = pack
  Packs.CheckFileList(pack)
  local found = false
  for i, p in ipairs(Packs.list) do if p.id == meta.id then Packs.list[i] = pack; found = true end end
  if not found then Packs.list[#Packs.list + 1] = pack end
  return pack
end

-- WoW reads an addon's file list (its .toc) only when the game starts; /reload re-reads the
-- Lua files but not the list. So after an update that adds files, the TOC's Version (from
-- the old list) disagrees with the version in the code. Say so, once, with the fix.
local toldRestart = {}
function Packs.TellRestart(title, listed, loaded)
  if toldRestart[title] then return end
  toldRestart[title] = true
  ns.Print(ns.L.RESTART_NEEDED:format(title, tostring(loaded), tostring(listed)))
end

function Packs.CheckFileList(pack)
  for name, entry in pairs(Packs.byAddon) do
    if entry.id == pack.id and entry.tocVersion and pack.version and entry.tocVersion ~= pack.version
       and tostring(pack.version):match("^%d") then
      Packs.TellRestart(entry.title or name, entry.tocVersion, pack.version)
    end
  end
end

-- Handle for a pack's data files. Works even if pack.lua hasn't run yet.
function API:Pack(id)
  local pack = Packs.byID[id]
  if not pack then
    pack = newHandle({ id = id })
    pack.registered = false
    Packs.byID[id] = pack
    Packs.list[#Packs.list + 1] = pack
  end
  return pack
end

function API:TalkToTarget()
  if ns.Conversation then ns.Conversation.TalkToTarget() end
end

-- Keybinding: open or close the "Ask about..." list during a full conversation.
function API:AskAbout()
  local D = ns.UI and ns.UI.Dialogue
  local f = D and D.Frame()
  if f and f:IsShown() and f.ask:IsShown() then ns.UI.AskAbout.Toggle(f) end
end

function API:OpenJournal()
  if ns.Journal and ns.Journal.Toggle then ns.Journal.Toggle() else ns.Print("The journal arrives in a later version.") end
end

ns.API = API
C.SetGlobal("RPGDialogueAPI", API)

---------------------------------------------------------------------------
-- Discovery and loading
---------------------------------------------------------------------------
local function splitList(s)
  local out = {}
  for piece in tostring(s or ""):gmatch("[^,%s]+") do out[#out + 1] = piece end
  return out
end

function Packs.Discover()
  Packs.zoneIndex = {}
  for i = 1, C.NumAddOns() do
    local name = C.AddOnName(i)
    local id = name and C.AddOnMeta(name, "X-RPGD-Pack")
    if id then
      local entry = Packs.byAddon[name] or {}
      entry.addon, entry.id = name, id
      entry.load = C.AddOnMeta(name, "X-RPGD-Load") or "zone"
      entry.format = tonumber(C.AddOnMeta(name, "X-RPGD-Format") or "1") or 1
      entry.zones = splitList(C.AddOnMeta(name, "X-RPGD-Zones"))
      -- Titles carry a grey version for the AddOns list ("... |cff8a8a8a1.1.0|r"); drop it here.
      local title = C.AddOnMeta(name, "Title") or name
      entry.title = (title:gsub("%s*|c%x%x%x%x%x%x%x%x[%w%.%-]+|r%s*$", ""))
      entry.tocVersion = C.AddOnMeta(name, "Version")
      entry.loaded = C.IsAddOnLoaded(name)
      Packs.byAddon[name] = entry
      for _, z in ipairs(entry.zones) do
        local key = tonumber(z) or z:gsub("_", " ")
        Packs.zoneIndex[key] = Packs.zoneIndex[key] or {}
        table.insert(Packs.zoneIndex[key], name)
      end
    end
  end
end

local function enabled(entry)
  local s = ns.db and ns.db.settings.packs or {}
  return s[entry.id] ~= false
end

function Packs.LoadAddon(name)
  local entry = Packs.byAddon[name]
  if not entry or entry.loaded or not enabled(entry) then return false end
  if entry.format > Packs.FORMAT then
    entry.refused = true
    ns.Print(("Content pack %s needs a newer RPG Dialogue (data format %d)."):format(entry.title, entry.format))
    return false
  end
  if not C.IsAddOnEnabled(name) then return false end
  local ok, reason = C.LoadAddOn(name)
  entry.loaded = ok
  if not ok then ns.Debug("could not load", name, tostring(reason)) end
  return ok
end

function Packs.LoadForLogin()
  for name, entry in pairs(Packs.byAddon) do
    if entry.load == "login" then Packs.LoadAddon(name) end
  end
end

function Packs.LoadForZone()
  local zone, sub, mapID = C.Zone()
  for _, key in ipairs({ mapID, zone, sub }) do
    for _, name in ipairs(key and Packs.zoneIndex[key] or {}) do Packs.LoadAddon(name) end
  end
end

-- Loads every pack (tests, simulation, /rpgd packs loadall).
function Packs.LoadAll()
  for name in pairs(Packs.byAddon) do Packs.LoadAddon(name) end
end

-- Pack ids a registered pack requires that aren't installed (or are turned off).
function Packs.MissingRequires(reg)
  local missing = {}
  for _, id in ipairs(reg and reg.requires or {}) do
    local found = false
    for _, entry in pairs(Packs.byAddon) do
      if entry.id == id and enabled(entry) then found = true end
    end
    if not found then missing[#missing + 1] = id end
  end
  return missing
end

function Packs.List()
  local out = {}
  for name, entry in pairs(Packs.byAddon) do
    local reg = Packs.byID[entry.id]
    out[#out + 1] = {
      addon = name, id = entry.id, title = entry.title, loaded = entry.loaded, enabled = enabled(entry),
      load = entry.load, zones = entry.zones, refused = entry.refused or (reg and reg.refused),
      warnings = reg and #reg.warnings or 0, counts = reg and reg.counts or {}, todos = reg and reg.todos or 0,
      version = reg and reg.version, missing = Packs.MissingRequires(reg),
    }
  end
  table.sort(out, function(a, b) return a.addon < b.addon end)
  return out
end

function Packs.PrintList()
  ns.Print(ns.L.VERSION_LINE:format(ns.VERSION))
  ns.Print("Content packs:")
  for _, p in ipairs(Packs.List()) do
    local state = p.refused and "|cffff4040refused|r" or (not p.enabled and "|cff888888off|r")
      or (p.loaded and "|cff40ff40loaded|r" or "waiting for zone")
    local npcs = p.counts.NPC or 0
    C.Print(("  %s (%s%s): %s, %d NPCs, %d pools%s%s"):format(p.title, p.id,
      p.version and (" " .. tostring(p.version)) or "", state, npcs, p.counts.Pool or 0,
      p.todos > 0 and (", " .. p.todos .. " TODO ids") or "",
      #p.missing > 0 and (", needs " .. table.concat(p.missing, ", ")) or ""))
  end
end

ns.OnLogin(function()
  Packs.Discover()
  Packs.LoadForLogin()
  Packs.LoadForZone()
end)
-- A zone's pack loads as soon as we know we're in it. On a new character's first login
-- the zone isn't known yet at PLAYER_LOGIN, and walking from Northshire to Goldshire never
-- changes the zone, so every zone signal counts (each check is cheap once loaded).
for _, ev in ipairs({ "PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA", "ZONE_CHANGED", "ZONE_CHANGED_INDOORS" }) do
  ns.On(ev, function() if Packs.zoneIndex then Packs.LoadForZone() end end)
end

---------------------------------------------------------------------------
-- Lookups used by the conversation controller
---------------------------------------------------------------------------
function Data.FindNPC(npcID, name)
  local key = npcID and Data.byID[npcID]
  if key then return Data.npcs[key] end
  if name then
    key = Data.byName[U.Norm(name)]
    local def = key and Data.npcs[key]
    -- Name matching is only for NPCs whose ID is still a TODO placeholder.
    if def and type(def.id) ~= "number" then
      if ns.IsDev() and not def._warnedTodo then
        def._warnedTodo = true
        ns.Debug("matched", name, "by name: its NPC ID is still TODO in", def._pack)
      end
      return def
    end
  end
  return nil
end

-- Community for a subzone, from town definitions.
function Data.CommunityForPlace(zone, subzone)
  for id, town in pairs(Data.towns) do
    for _, s in ipairs(town.subzones or {}) do
      if s == subzone then return id end
    end
  end
  for id, town in pairs(Data.towns) do
    for _, z in ipairs(town.zones or {}) do
      if z == zone then return id end
    end
  end
  return nil
end

-- pool.subtitle: plain, lower-case text the NPC's title must contain ("paladin trainer",
-- "weaponsmith"), or a list of them: narrows a role pool to one kind of that role.
local function subtitleMatches(want, have)
  if type(have) ~= "string" or have == "" then return false end
  have = have:lower()
  for _, w in ipairs(U.AsList(want)) do
    if have:find(w, 1, true) then return true end
  end
  return false
end

local function poolMatches(pool, info, ctx)
  if pool.role ~= info.role then return false end
  if pool.faction and pool.faction ~= ctx.faction then return false end
  if pool.zone and pool.zone ~= ctx.zone then return false end
  if pool.subtitle and not subtitleMatches(pool.subtitle, info.subtitle) then return false end
  if pool.community then
    local comms = info.communities or {}
    if not U.Contains(comms, pool.community) then return false end
  end
  return true
end

-- Pools for an NPC, each with its score base: community 200, kind of role (subtitle) 150,
-- role+zone/faction 120, role 100.
-- forTopics: also the pools that only answer "Ask about..." questions (askOnly = true).
-- Those never speak lines or make an unnamed NPC count as someone with things to say.
function Data.PoolsFor(info, ctx, forTopics)
  local out = {}
  for _, pool in ipairs(Data.pools) do
    if (forTopics or not pool.askOnly) and poolMatches(pool, info, ctx) then
      local base = pool.community and 200 or (pool.subtitle and 150 or ((pool.zone or pool.faction) and 120 or 100))
      out[#out + 1] = { pool = pool, base = base }
    end
  end
  table.sort(out, function(a, b) return a.base > b.base end)
  return out
end

-- A pool that carries its own conversation tree for this role (e.g. spirit healers).
function Data.TreePoolFor(info, ctx)
  for _, p in ipairs(Data.PoolsFor(info, ctx)) do
    if p.pool.nodes then return p.pool end
  end
  return nil
end

function Data.GenericFor(ctx)
  local out = {}
  for _, g in ipairs(Data.generic) do
    if not g.faction or g.faction == ctx.faction then out[#out + 1] = g end
  end
  return out
end

-- Global line ids referenced by the "this line is wrong" button and heardLine.
function Data.Line(gid)
  local rec = Data.lines[gid]
  return rec and rec.line
end
