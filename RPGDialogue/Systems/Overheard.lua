-- Overheard exchanges (0.116.0): now and then two people standing near you talk to each
-- other, and you catch it in local chat (only on your screen). Packs add them with
--   P:Exchange { id, a = { npc = "key" | {..}, role = "guard" | {..}, subtitle = "text" },
--     b = { .. }, when = { conditions, checked against the player }, once = true?,
--     lines = { { who = "a" | "b" | nil (narration), text = "..." }, .. } }
-- A side may be left out (anyone friendly). The pair can stand either way round. Named
-- exchanges (npc on either side) are heard once; role exchanges again after a few days.
-- What was heard feeds the `overheard` condition, so people can mention it afterwards.
local _, ns = ...

local C = ns.Compat
local U = ns.Util
local Over = {}
ns.Overheard = Over

Over.GLOBAL_SECONDS = 900    -- at most one exchange every 15 minutes
Over.CHANCE = 0.2            -- per chance to start one, once two people are near
Over.NEARBY_SECONDS = 25
Over.GAP = 3.2               -- seconds between the lines of one exchange
Over.REPEAT_DAYS = 4         -- role exchanges come round again after this long

Over.list = {}
local byId = {}
local nearby = {}            -- guid -> { unit, t }
local lastAt = 0
local playing = false

function Over.IsPlaying() return playing end

function Over.Add(def)
  if type(def.id) ~= "string" or type(def.lines) ~= "table" then return false end
  if byId[def.id] then
    for i, old in ipairs(Over.list) do if old == byId[def.id] then table.remove(Over.list, i); break end end
  end
  byId[def.id] = def
  Over.list[#Over.list + 1] = def
  return true
end

local function store()
  ns.char.overheard = ns.char.overheard or {}
  local s = ns.char.overheard
  s._by = s._by or {}
  return s
end

local function enabled()
  local s = ns.db and ns.db.settings
  return s and s.enabled and s.overheard == true and not C.InCombat() and not C.InInstance()
    and not (ns.Conversation.session and ns.Conversation.session.mode == "full")
end

local function anyOf(value, want)
  if want == nil then return true end
  if type(want) ~= "table" then return value == want end
  for _, w in ipairs(want) do if value == w then return true end end
  return false
end

local function sideMatches(info, side)
  if not side then return true end
  if side.npc and not anyOf(info.key, side.npc) then return false end
  if side.role and not anyOf(info.role, side.role) then return false end
  if side.subtitle then
    local sub = (info.subtitle or ""):lower()
    local wants = type(side.subtitle) == "table" and side.subtitle or { side.subtitle }
    local ok = false
    for _, w in ipairs(wants) do if sub:find(w:lower(), 1, true) then ok = true; break end end
    if not ok then return false end
  end
  if side.named == true and info.pooled then return false end
  return true
end

local function named(def)
  return (def.a and def.a.npc) or (def.b and def.b.npc)
end

local function fresh(def, s, now)
  local at = s[def.id]
  if not at then return true end
  local once = def.once
  if once == nil then once = named(def) and true or false end
  if once then return false end
  return now - at > (def.days or Over.REPEAT_DAYS) * 86400
end

-- Score: a named side counts most, then a subtitle, then a role.
local function sideScore(side)
  if not side then return 0 end
  return (side.npc and 100 or 0) + (side.subtitle and 30 or 0) + (side.role and 10 or 0)
end

-- Candidates for one pair of people (both ways round).
local function candidates(ia, ib, ctx, env, now)
  local s, out = store(), {}
  for _, def in ipairs(Over.list) do
    if fresh(def, s, now) then
      local first, second
      if sideMatches(ia, def.a) and sideMatches(ib, def.b) then first, second = ia, ib
      elseif sideMatches(ib, def.a) and sideMatches(ia, def.b) then first, second = ib, ia end
      if first and first ~= second then
        local pass, score = ns.Conditions.Eval(def.when, ctx, env)
        if pass then
          out[#out + 1] = { def = def, a = first, b = second,
            score = sideScore(def.a) + sideScore(def.b) + (score or 0) }
        end
      end
    end
  end
  return out
end

local function pick(cands)
  if #cands == 0 then return nil end
  table.sort(cands, function(x, y) return x.score > y.score end)
  -- Among the best few, any at random (so two guards don't always say the same thing).
  local top, best = {}, cands[1].score
  for _, c in ipairs(cands) do if c.score >= best - 20 then top[#top + 1] = c end end
  return top[math.random(#top)]
end

local function speakerName(info)
  return info.name or info.unitName or "Someone"
end

local function play(c, ctx, env)
  playing = true
  local s = store()
  local now = C.Now()
  s[c.def.id] = now
  for _, info in ipairs({ c.a, c.b }) do
    s._by[ns.Memory.Key(info)] = c.def.id
  end
  -- A named exchange is worth a diary line (or the exchange's own `journal = { first, third }`).
  if named(c.def) and ns.Effects and ns.Effects.Journal then
    local a, b = speakerName(c.a), speakerName(c.b)
    local where = (ctx.subzone ~= nil and ctx.subzone ~= "" and ctx.subzone) or ctx.zone or "town"
    local tpl = c.def.journal or {
      first = ("I overheard %s and %s talking in %s."):format(a, b, where),
      third = ("{name} overheard %s and %s in %s."):format(a, b, where),
    }
    pcall(ns.Effects.Journal, tpl, ctx, { now = now })
  end
  local function line(i)
    local l = c.def.lines[i]
    -- Cut short when a fight starts or the player opens a conversation of their own.
    local sess = ns.Conversation.session
    if not l or C.InCombat() or (sess and sess.mode == "full") then playing = false; return end
    local text = ns.Tokens.Render(l.text or l[2] or "", ctx, env)
    local who = l.who or l[1]
    if who == "a" or who == "b" then
      C.Print(("|cffffff9f%s says: %s|r"):format(speakerName(who == "a" and c.a or c.b), text))
    else
      C.Print(("|cffbfbfbf%s|r"):format(text))
    end
    C.After(Over.GAP, function() line(i + 1) end)
  end
  line(1)
end

local function infoFor(unit)
  if not C.Exists(unit) or C.IsPlayer(unit) or not C.IsFriendly(unit) or C.UnitDead(unit) then return nil end
  local ctx = ns.Context.New({ unit = unit })
  if not ctx.npcName then return nil end
  return ns.Conversation.Identify(unit, ctx), ctx
end

-- People still near, as { info, ctx }.
local function present(now)
  local out = {}
  for guid, n in pairs(nearby) do
    if now - n.t > Over.NEARBY_SECONDS or C.GUID(n.unit) ~= guid then
      nearby[guid] = nil
    else
      local info, ctx = infoFor(n.unit)
      if info and info.role ~= "quiet" and info.role ~= "corpse" then out[#out + 1] = { info = info, ctx = ctx } end
    end
  end
  return out
end

-- Returns true if an exchange began. force skips the timers and the roll (/rpgd overhear).
function Over.Try(force)
  if playing or not ns.char or not ns.db then return false end
  if not force and not enabled() then return false end
  local now = C.Now()
  if not force and now - lastAt < Over.GLOBAL_SECONDS then return false end
  local people = present(now)
  if #people < 2 then return false end
  if not force and math.random() > Over.CHANCE then lastAt = now - Over.GLOBAL_SECONDS / 2; return false end
  local all = {}
  for i = 1, #people do
    for j = i + 1, #people do
      local p, q = people[i], people[j]
      if ns.Memory.Key(p.info) ~= ns.Memory.Key(q.info) then
        local env = ns.Engine.NewEnv(p.info, p.ctx, ns.Memory.Get(ns.Memory.Key(p.info)) or {})
        for _, c in ipairs(candidates(p.info, q.info, p.ctx, env, now)) do
          c.ctx, c.env = p.ctx, env
          all[#all + 1] = c
        end
      end
    end
  end
  local c = pick(all)
  if not c then return false end
  lastAt = now
  play(c, c.ctx, c.env)
  return true
end

local function remember(unit)
  local guid = C.GUID(unit)
  if not guid or C.IsPlayer(unit) then return end
  nearby[guid] = { unit = unit, t = C.Now() }
end

ns.On("NAME_PLATE_UNIT_ADDED", function(_, unit)
  remember(unit)
  Over.Try()
end)
ns.On("PLAYER_TARGET_CHANGED", function()
  if C.Exists("target") then remember("target"); Over.Try() end
end)
ns.On("UPDATE_MOUSEOVER_UNIT", function()
  if C.Exists("mouseover") then remember("mouseover"); Over.Try() end
end)
