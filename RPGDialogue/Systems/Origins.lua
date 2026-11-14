-- Origins: an optional background the player picks in the journal's Character Sheet.
-- One dismissible hint at first login; nothing else pushes the player to choose. Every
-- conversation must make complete sense without one ("other" or never picked).
local _, ns = ...

local C = ns.Compat
local L = ns.L
local Origins = {}
ns.Origins = Origins

Origins.HOME_STANDING = 10   -- "Known" in the home town instead of "Stranger"

-- Origin choices for a race and class. "other" is always last.
function Origins.ListFor(race, class)
  local out, other = {}, nil
  for _, def in pairs(ns.Data.origins) do
    if def.race == race then
      for _, o in ipairs(def.origins or {}) do
        if o.id == "other" then other = o
        elseif (not o.class or o.class == class) and (not o.faction or o.faction == ns.Compat.Faction("player")) then
          out[#out + 1] = o
        end
      end
    end
  end
  table.sort(out, function(a, b) return a.name < b.name end)
  out[#out + 1] = other or { id = "other", name = L.ORIGIN_OTHER }
  return out
end

function Origins.Find(id)
  for _, def in pairs(ns.Data.origins) do
    for _, o in ipairs(def.origins or {}) do if o.id == id then return o end end
  end
  return nil
end

function Origins.Current()
  return ns.char.origin
end

-- Choose (or change) the origin. Past conversations stay as they were; the starting nudge
-- and the home-town welcome apply only the first time each origin is chosen.
function Origins.Choose(id, blurb)
  local o = Origins.Find(id) or (id == "other" and { id = "other", name = L.ORIGIN_OTHER })
  if not o then return false end
  local c = ns.char
  local now = C.Now()
  c.origin = { id = o.id, name = o.name, blurb = blurb or o.blurb, t = now }
  c.originsApplied = c.originsApplied or {}
  if not c.originsApplied[o.id] and o.id ~= "other" then
    c.originsApplied[o.id] = now
    local env = { now = now, info = { name = L.ORIGIN_JOURNAL_SOURCE } }
    if o.nudge then ns.Effects.Apply(o.nudge, env) end
    if o.home then
      local cur = c.towns[o.home] and c.towns[o.home].value or 0
      if cur < Origins.HOME_STANDING then ns.Effects.Standing(o.home, Origins.HOME_STANDING - cur, false) end
    end
  end
  if c.origin.blurb and c.origin.blurb ~= "" then
    c.journal[#c.journal + 1] = { t = now, kind = "origin", text = c.origin.blurb, voice = "first" }
  end
  ns.Fire("ORIGIN_CHOSEN", o.id)
  return true
end

function Origins.SetBlurb(text)
  if ns.char.origin then ns.char.origin.blurb = text end
end

ns.OnLogin(function()
  local c = ns.char
  if not c.originHintShown and not c.origin then
    c.originHintShown = true
    C.After(8, function() ns.Print(L.ORIGIN_HINT) end)
  end
end)
