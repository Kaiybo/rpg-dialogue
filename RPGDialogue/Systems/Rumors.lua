-- Innkeepers are rumor hubs: local news, word from nearby, reactions to the player's own
-- deeds. Rumors are hearsay (often claims), gated by level, place and deeds, and rotate.
local _, ns = ...

local U = ns.Util
local Rumors = {}
ns.Rumors = Rumors

-- Rumor sets that apply to this NPC: role, town (community) and zone filters.
function Rumors.SetsFor(info, ctx)
  local out = {}
  for _, set in pairs(ns.Data.rumors) do
    local roles = U.AsList(set.roles or "innkeeper")
    local ok = U.Contains(roles, info.role) or (set.npcs and info.key and U.Contains(set.npcs, info.key))
    if ok and set.towns then
      ok = false
      for _, t in ipairs(info.communities or {}) do if U.Contains(set.towns, t) then ok = true end end
    end
    if ok and set.zones then ok = U.Contains(set.zones, ctx.zone) end
    if ok then out[#out + 1] = set end
  end
  table.sort(out, function(a, b) return a.id < b.id end)
  return out
end

-- At most one rumor per hour per NPC, with a chance per visit.
function Rumors.Due(info, env)
  local key = "rumor:" .. (ns.Memory.Key(info))
  local p = ns.char.pacing
  p.rumor = p.rumor or {}
  local last = p.rumor[key]
  if last and env.now - last < ns.Pacing.RUMOR.seconds then return false end
  return env.rng.next() < ns.Pacing.RUMOR.chance
end

function Rumors.Used(info, env)
  local p = ns.char.pacing
  p.rumor = p.rumor or {}
  p.rumor["rumor:" .. ns.Memory.Key(info)] = env.now
end
