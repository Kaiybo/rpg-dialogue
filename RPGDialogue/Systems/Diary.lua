-- The diary writes itself a little: the first time the character reaches a zone (an
-- authored Arrival entry from a pack), and after talking with a named NPC who carries an
-- `impression` (what the character made of them). Both use the journal's two voices.
local _, ns = ...

local C = ns.Compat
local Diary = {}
ns.Diary = Diary

-- The first arrival entry for this zone whose conditions hold, or nil.
function Diary.ArrivalFor(zone, ctx, env)
  local list = ns.Data.arrivals and ns.Data.arrivals[zone]
  if not list then return nil end
  for _, def in ipairs(list) do
    if not def.when or ns.Conditions.Eval(def.when, ctx, env) then return def end
  end
end

function Diary.Arrive(zone)
  local c = ns.char
  if not c or not zone or zone == "" then return end
  c.arrived = c.arrived or {}
  if c.arrived[zone] then return end
  local ctx = ns.Context.New({ spoof = {} })
  local env = { now = C.Now() }
  local def = Diary.ArrivalFor(zone, ctx, env)
  if not def then return end
  c.arrived[zone] = env.now
  ns.Effects.Journal(def, ctx, env)
end

-- After a conversation: the impression, once per NPC (people met before 0.35.0 get theirs
-- the next time they're spoken to).
function Diary.Impression(s)
  local def = s and s.info and s.info.def
  if not def or not def.impression or not s.mem or s.mem.impressed then return end
  s.mem.impressed = C.Now()
  ns.Effects.Journal(def.impression, s.ctx or ns.Context.New({ spoof = {} }), s.env or { now = C.Now(), info = s.info })
end

-- A few deeds write their own line: a first death, every tenth level, a first dungeon.
-- (Arrivals are authored per zone instead; kills stay on the Myself page.)
function Diary.Deed(id)
  local L = ns.L
  local kind, arg = id:match("^(%a+):(.+)$")
  local tpl
  if id == "first_death" then
    local d = ns.char.deaths and ns.char.deaths[#ns.char.deaths]
    local who = d and d.killer and d.killer.name
    tpl = who and { first = L.DIARY_FIRST_DEATH_BY:format(who), third = L.DIARY_FIRST_DEATH_BY_3:format(who) }
      or { first = L.DIARY_FIRST_DEATH, third = L.DIARY_FIRST_DEATH_3 }
  elseif kind == "level" then
    tpl = { first = L["DIARY_LEVEL_" .. arg] or L.DIARY_LEVEL:format(arg), third = L.DIARY_LEVEL_3:format(arg) }
  elseif kind == "dungeon" then
    tpl = { first = L.DIARY_DUNGEON:format(arg), third = L.DIARY_DUNGEON_3:format(arg) }
  elseif kind == "cleared" then
    tpl = { first = L.DIARY_CLEARED:format(arg), third = L.DIARY_CLEARED_3:format(arg) }
  end
  if tpl then ns.Effects.Journal(tpl, ns.Context.New({ spoof = {} }), { now = C.Now() }) end
end

ns.Listen("DEED", function(id)
  if type(id) ~= "string" then return end
  local zone = id:match("^zone:(.+)$")
  if zone then Diary.Arrive(zone) else Diary.Deed(id) end
end)
-- Where you last spoke with someone (the People page groups by it).
function Diary.Where(s)
  if not s or not s.mem or not s.ctx then return end
  local zone = s.ctx.zone
  if type(zone) == "string" and zone ~= "" then s.mem.zone = zone end
end

ns.Listen("CONVERSATION_ENDED", function(s)
  Diary.Where(s)
  Diary.Impression(s)
end)

-- Characters from before 0.35.0 start with everything already read.
ns.OnLogin(function()
  local c = ns.char
  if c and c.journalRead == nil then c.journalRead = #(c.journal or {}) end
end)
