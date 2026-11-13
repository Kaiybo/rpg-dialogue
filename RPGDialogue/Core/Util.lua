-- Pure Lua helpers. Nothing here touches the game, so all of it runs in tests.
local _, ns = ...

local U = {}
ns.Util = U

---------------------------------------------------------------------------
-- Seeded random numbers (Park–Miller minimal standard generator).
-- Plain arithmetic, exact in doubles, no bit library: identical in game and tests.
---------------------------------------------------------------------------
local MOD = 2147483647

function U.NewRNG(seed)
  local state = math.floor(tonumber(seed) or 1) % MOD
  if state <= 0 then state = state + MOD - 1 end
  local rng = {}
  -- Returns a float in [0, 1).
  function rng.next()
    state = (state * 16807) % MOD
    return (state - 1) / (MOD - 1)
  end
  -- Returns an integer in [lo, hi].
  function rng.int(lo, hi)
    return lo + math.floor(rng.next() * (hi - lo + 1))
  end
  function rng.seed() return state end
  return rng
end

-- djb2-style string hash folded into the generator's range. Used for seeds.
function U.Hash(...)
  local h = 5381
  for i = 1, select("#", ...) do
    local s = tostring((select(i, ...)))
    for j = 1, #s do
      h = (h * 33 + s:byte(j)) % MOD
    end
    h = (h * 33 + 31) % MOD
  end
  return h
end

---------------------------------------------------------------------------
-- Tables
---------------------------------------------------------------------------
function U.DeepCopy(v, seen)
  if type(v) ~= "table" then return v end
  seen = seen or {}
  if seen[v] then return seen[v] end
  local out = {}
  seen[v] = out
  for k, val in pairs(v) do out[U.DeepCopy(k, seen)] = U.DeepCopy(val, seen) end
  return out
end

function U.Wipe(t)
  for k in pairs(t) do t[k] = nil end
  return t
end

function U.Count(t)
  local n = 0
  for _ in pairs(t) do n = n + 1 end
  return n
end

function U.Keys(t, sorted)
  local out = {}
  for k in pairs(t) do out[#out + 1] = k end
  if sorted then table.sort(out, function(a, b) return tostring(a) < tostring(b) end) end
  return out
end

-- A value that may be a single item or a list of items, as a list.
function U.AsList(v)
  if v == nil then return {} end
  if type(v) == "table" and v[1] ~= nil and v.todo == nil then return v end
  return { v }
end

function U.Contains(list, value)
  for i = 1, #list do if list[i] == value then return true end end
  return false
end

---------------------------------------------------------------------------
-- Strings
---------------------------------------------------------------------------
function U.Trim(s)
  return (tostring(s):gsub("^%s+", ""):gsub("%s+$", ""))
end

function U.Split(s, sep)
  local out = {}
  sep = sep or "%s"
  for piece in tostring(s):gmatch("[^" .. sep .. "]+") do out[#out + 1] = piece end
  return out
end

function U.Words(s)
  local n = 0
  for _ in tostring(s):gmatch("%S+") do n = n + 1 end
  return n
end

-- "Kobold Camp Cleanup" -> "kobold camp cleanup" (for loose title/name matching)
function U.Norm(s)
  return (tostring(s):lower():gsub("[%p]", ""):gsub("%s+", " "):gsub("^ ", ""):gsub(" $", ""))
end

---------------------------------------------------------------------------
-- Durations: "90s", "30m", "12h", "3d" -> seconds; "5c" -> { conversations = 5 }
---------------------------------------------------------------------------
local UNIT_SECONDS = { s = 1, m = 60, h = 3600, d = 86400, w = 604800 }

function U.ParseDuration(v)
  if type(v) == "number" then return { seconds = v } end
  if type(v) ~= "string" then return nil end
  local n, unit = v:match("^%s*(%d+%.?%d*)%s*(%a)%s*$")
  n = tonumber(n)
  if not n then return nil end
  unit = unit:lower()
  if unit == "c" then return { conversations = n } end
  local mult = UNIT_SECONDS[unit]
  if not mult then return nil end
  return { seconds = n * mult }
end

---------------------------------------------------------------------------
-- Misc
---------------------------------------------------------------------------
function U.Clamp(v, lo, hi)
  if v < lo then return lo elseif v > hi then return hi end
  return v
end

function U.Round(v, places)
  local m = 10 ^ (places or 0)
  return math.floor(v * m + 0.5) / m
end

-- Placeholder references produced by TODO_NPC("Name") etc. in content packs.
function U.IsTodo(v)
  return type(v) == "table" and v.todo ~= nil
end

function U.RefString(v)
  if U.IsTodo(v) then return "TODO_" .. tostring(v.todo):upper() .. "(\"" .. tostring(v.name) .. "\")" end
  return tostring(v)
end
