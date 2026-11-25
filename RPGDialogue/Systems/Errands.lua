-- Addon-side errands: an NPC asks for something the addon can verify (an item in your bags,
-- visiting a place, a kill count). Rewards are addon-only (affinity, standing, journal,
-- topics) and errands are never presented as real quests: no quest log, no markers.
local _, ns = ...

local C = ns.Compat
local L = ns.L
local Errands = {}
ns.Errands = Errands

local function rec(id)
  ns.char.errands = ns.char.errands or {}
  return ns.char.errands[id]
end

-- Is the requirement met? Returns ok, progress text.
function Errands.Met(def)
  local need = def.need or {}
  if need.visit then
    local t = ns.char.places and ns.char.places[need.visit]
    local r = rec(def.id)
    -- places[] keeps only the first visit; a visit after taking the errand is r.visited.
    if r and r.visited then return true, need.visit end
    local taken = r and r.taken or 0
    return t ~= nil and t >= taken, need.visit
  end
  if need.item then
    local id = type(need.item) == "number" and need.item or nil
    if not id then return false, "unknown item" end
    local have = C.ItemCount(id)
    return have >= (need.count or 1), have .. "/" .. (need.count or 1)
  end
  if need.kill then
    local id = type(need.kill) == "number" and need.kill or nil
    if not id then return false, "unknown creature" end
    local d = ns.char.deeds["kill:" .. id]
    local start = rec(def.id) and rec(def.id).kills or 0
    local have = (d and d.n or 0) - start
    return have >= (need.count or 1), have .. "/" .. (need.count or 1)
  end
  return false, "?"
end

-- Errand choices for an NPC right now: offers and hand-ins. Each: { text, errand, action }
function Errands.ChoicesFor(info, ctx, env)
  local out = {}
  if not info.key then return out end
  for id, def in pairs(ns.Data.errands) do
    if def.npc == info.key then
      local r = rec(id)
      if not r then
        if ns.Conditions.Eval(def.when, ctx, env) then
          out[#out + 1] = { text = def.offerChoice or L.ERRAND_ASK, errand = id, action = "offer" }
        end
      elseif not r.done and Errands.Met(def) then
        out[#out + 1] = { text = def.doneChoice or L.ERRAND_DONE, errand = id, action = "complete" }
      end
    end
  end
  table.sort(out, function(a, b) return a.errand < b.errand end)
  return out
end

-- Returns the NPC's text for the step.
function Errands.Act(id, action, env)
  local def = ns.Data.errands[id]
  if not def then return nil end
  ns.char.errands = ns.char.errands or {}
  local now = env.now or C.Now()
  if action == "offer" then
    local kills = def.need and type(def.need.kill) == "number" and ns.char.deeds["kill:" .. def.need.kill]
    ns.char.errands[id] = { taken = now, kills = kills and kills.n or 0 }
    return def.offer
  elseif action == "complete" then
    local r = ns.char.errands[id]
    if not r or r.done then return nil end
    r.done = now
    if def.reward then ns.Effects.Apply(def.reward, env) end
    if def.journal then ns.Effects.Journal(def.journal, env.ctx or {}, env) end
    return def.thanks
  end
end

function Errands.Describe()
  local out = {}
  for id, r in pairs(ns.char.errands or {}) do
    local def = ns.Data.errands[id]
    local progress = "?"
    if def then
      local _, p = Errands.Met(def)
      progress = p
    end
    out[#out + 1] = id .. ": " .. (r.done and "done" or ("taken, " .. tostring(progress)))
  end
  table.sort(out)
  return out
end


-- Being somewhere an open errand sends you (Trackers fires this on every subzone change).
ns.Listen("PLACE_VISITED", function(sub)
  if not ns.char or not ns.char.errands or not ns.Data or not ns.Data.errands then return end
  for id, r in pairs(ns.char.errands) do
    local def = ns.Data.errands[id]
    if type(r) == "table" and not r.done and not r.visited and def and def.need and def.need.visit == sub then
      r.visited = C.Now()
    end
  end
end)
