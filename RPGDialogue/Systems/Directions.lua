-- "Where is...?" (Daggerfall-style): ask anyone the way to the inn, the bank, a trainer or
-- one of the town's people. Content packs hold one P:Directions per town:
--   P:Directions { town = "stormwind", mapID = 1453, entries = {
--     { id = "inn", name = "The Gilded Rose", kind = "inn", text = "...", x = 60.4, y = 75.3 },
--     { id = "trainer_warrior", name = "Warrior trainer", kind = "class", class = "WARRIOR", text = "..." },
--     { id = "trainer_mining", name = "Mining trainer", kind = "profession", profession = "Mining", text = "..." },
--     { id = "dughan", name = "Marshal Dughan", kind = "npc", npc = "dughan", text = "..." },
--   } }
-- The town is the one the player stands in (town subzones/zones), else the NPC's own
-- community. Answers are the entry's text (or the NPC's own, def.directions[id]); an NPC
-- with newInTown = true answers vaguely. With TomTom loaded, an entry with x/y (0-100,
-- Classic map coordinates) also gets a waypoint.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local Dir = {}
ns.Directions = Dir

Dir.PAGE = 7

-- Order in the list: the everyday places first, then trainers, then people.
Dir.KIND_ORDER = { inn = 1, bank = 2, auction = 3, flight = 4, mail = 5, stable = 6, class = 7, profession = 8, vendor = 9, npc = 10 }

local function townHas(id) return id and ns.Data.directions and ns.Data.directions[id] and #ns.Data.directions[id] > 0 end

-- The town to give directions for: where the player is, else where the NPC lives.
function Dir.Town(info)
  local zone, sub = C.Zone()
  local here = ns.Data.CommunityForPlace and ns.Data.CommunityForPlace(zone or "", sub or "")
  if townHas(here) then return here end
  local def = info and info.def
  for _, id in ipairs((def and def.communities) or {}) do
    if townHas(id) then return id end
  end
  return nil
end

-- The town's entries in list order: the player's own class trainer first among trainers,
-- professions they know before the rest.
function Dir.List(info, ctx)
  local town = Dir.Town(info)
  if not town then return nil, {} end
  local myClass = ctx and ctx.class
  local myProfs = (ctx and ctx.professions) or {}
  local out = {}
  for i, e in ipairs(ns.Data.directions[town]) do
    local rank = (Dir.KIND_ORDER[e.kind or "npc"] or 11) * 10
    if e.kind == "class" and e.class == myClass then rank = rank - 5 end
    if e.kind == "profession" and e.profession and myProfs[e.profession] then rank = rank - 5 end
    out[#out + 1] = { e = e, rank = rank, i = i }
  end
  table.sort(out, function(a, b)
    if a.rank ~= b.rank then return a.rank < b.rank end
    return a.i < b.i
  end)
  local list = {}
  for _, r in ipairs(out) do list[#list + 1] = r.e end
  return town, list
end

local function isSelf(entry, info, memKey)
  if not info then return false end
  if entry.npc and (entry.npc == memKey or (info.def and info.def.key == entry.npc)) then return true end
  return entry.kind == "npc" and info.name ~= nil and entry.name == info.name
end

-- What this NPC says when asked the way to entry. seed picks among the vague answers.
function Dir.Answer(entry, info, memKey, seed)
  local def = info and info.def
  if isSelf(entry, info, memKey) then return L.WHERE_SELF end
  local own = def and type(def.directions) == "table" and def.directions[entry.id]
  if type(own) == "string" and own ~= "" then return own end
  if def and def.newInTown then
    local vague = L.WHERE_VAGUE
    return vague[((seed or 0) % #vague) + 1]
  end
  if type(entry.text) == "string" and entry.text ~= "" then return entry.text end
  return L.WHERE_UNKNOWN
end

-- A TomTom waypoint for the entry, when TomTom is loaded and the entry has coordinates.
-- No hard dependency: anything missing or failing just does nothing.
function Dir.Waypoint(entry, info)
  if not (entry and tonumber(entry.x) and tonumber(entry.y)) then return false end
  if info and info.def and info.def.newInTown then return false end
  local tt = _G and rawget(_G, "TomTom")
  if type(tt) ~= "table" or type(tt.AddWaypoint) ~= "function" then return false end
  local mapID = entry._mapID
  if not mapID then
    local _, _, m = C.Zone()
    mapID = tonumber(m)
  end
  if not mapID then return false end
  local ok = pcall(tt.AddWaypoint, tt, mapID, entry.x / 100, entry.y / 100,
    { title = entry.name, persistent = false, minimap = true, world = true, from = "RPG Dialogue" })
  if ok then ns.Print(L.WHERE_WAYPOINT:format(entry.name)) end
  return ok
end

-- Rows for one page of the list: { entries = { entry, ... }, more = bool }.
function Dir.Page(list, page)
  local n = #list
  local pages = math.max(1, math.ceil(n / Dir.PAGE))
  page = (page or 0) % pages
  local out = {}
  for i = page * Dir.PAGE + 1, math.min(n, (page + 1) * Dir.PAGE) do out[#out + 1] = list[i] end
  return out, pages > 1, page
end
