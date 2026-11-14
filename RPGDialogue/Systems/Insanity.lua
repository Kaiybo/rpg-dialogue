-- Temporary insanity: cosmetic only, toggleable, with an intensity setting, and never any
-- flashing or strobing. Triggered by content (fx.insanity), cured by rest, the Camping buff,
-- praying at a shrine or cathedral, or time.
--   Effects: scrambled dialogue text, intrusive extra choices, fake whispers (local chat
--   only), NPC names occasionally wrong, journal entries "in a different hand", a static
--   dark vignette at the screen edges.
local _, ns = ...

local C = ns.Compat
local U = ns.Util
local Ins = {}
ns.Insanity = Ins

Ins.DECAY_PER_HOUR = 10
Ins.REST_CURE = 5           -- extra per hour while resting
Ins.HOLY_PLACES = { ["Cathedral Square"] = true, ["Cathedral of Light"] = true, ["Northshire Abbey"] = true }
Ins.WHISPERS = {
  "Did you hear that? Behind you.", "They know what you did.", "Count the candles again.",
  "Not your shadow. Not anymore.", "The door was open. Who opened it?",
}
Ins.WRONG_NAMES = { "Someone Else", "Your Mother", "The Collector", "Nobody", "Old Friend" }
Ins.INTRUSIVE = { "Why are you staring at me?", "I know what you're hiding.", "Make the whispering stop." }

local function state()
  ns.char.insanity = ns.char.insanity or { level = 0 }
  return ns.char.insanity
end

function Ins.Level() return state().level or 0 end

local function enabled()
  local s = ns.db and ns.db.settings
  return s and s.insanityFx and not s.reduceMotion
end

-- 0..1: how strongly effects apply (level scaled by the intensity setting).
function Ins.Strength()
  if not enabled() then return 0 end
  return math.min(1, Ins.Level() / 100) * ((ns.db.settings.insanityIntensity or 0.5) * 2)
end

function Ins.Add(n)
  local st = state()
  st.level = U.Clamp((st.level or 0) + n, 0, 100)
  st.t = C.Now()
  Ins.UpdateVignette()
end

function Ins.Cure(n)
  Ins.Add(-(n or 100))
end

-- Deterministic scramble: swaps letters inside some words. Seeded per text so it doesn't
-- jitter frame to frame (no flicker).
function Ins.Scramble(text, strength, seed)
  strength = strength or Ins.Strength()
  if strength <= 0 or type(text) ~= "string" then return text end
  local rng = U.NewRNG(U.Hash(text, seed or 0))
  return (text:gsub("(%a)(%a+)(%a)", function(first, mid, last)
    if rng.next() > strength * 0.35 or #mid < 2 then return first .. mid .. last end
    local chars = {}
    for ch in mid:gmatch(".") do chars[#chars + 1] = ch end
    for i = #chars, 2, -1 do local j = rng.int(1, i); chars[i], chars[j] = chars[j], chars[i] end
    return first .. table.concat(chars) .. last
  end))
end

function Ins.Name(name, seed)
  local strength = Ins.Strength()
  if strength <= 0.3 then return name end
  local rng = U.NewRNG(U.Hash(name, seed or 0))
  if rng.next() < (strength - 0.3) * 0.5 then return Ins.WRONG_NAMES[rng.int(1, #Ins.WRONG_NAMES)] end
  return name
end

-- An extra choice that does nothing but say something it shouldn't.
function Ins.IntrusiveChoice(seed)
  local strength = Ins.Strength()
  if strength < 0.4 then return nil end
  local rng = U.NewRNG(U.Hash("intrusive", seed or 0))
  if rng.next() > strength * 0.6 then return nil end
  return Ins.INTRUSIVE[rng.int(1, #Ins.INTRUSIVE)]
end

---------------------------------------------------------------------------
-- Vignette: four static dark edges. Alpha follows strength; no animation, no flashing.
---------------------------------------------------------------------------
local edges
function Ins.UpdateVignette()
  local strength = Ins.Strength()
  if strength <= 0 then
    if edges then for _, e in ipairs(edges) do e:Hide() end end
    return
  end
  if not edges then
    edges = {}
    local specs = {
      { "TOPLEFT", "TOPRIGHT", nil, 90 }, { "BOTTOMLEFT", "BOTTOMRIGHT", nil, 90 },
      { "TOPLEFT", "BOTTOMLEFT", 90, nil }, { "TOPRIGHT", "BOTTOMRIGHT", 90, nil },
    }
    for _, sp in ipairs(specs) do
      local f = CreateFrame("Frame", nil, UIParent)
      f:SetFrameStrata("BACKGROUND")
      f:SetPoint(sp[1]); f:SetPoint(sp[2])
      if sp[3] then f:SetWidth(sp[3]) else f:SetHeight(sp[4]) end
      f.tex = f:CreateTexture(nil, "BACKGROUND")
      f.tex:SetAllPoints()
      f:EnableMouse(false)
      edges[#edges + 1] = f
    end
  end
  for _, e in ipairs(edges) do
    e.tex:SetColorTexture(0, 0, 0, 0.35 * strength)
    e:Show()
  end
end

---------------------------------------------------------------------------
-- Time, rest and holy places cure it; whispers come now and then.
---------------------------------------------------------------------------
function Ins.Tick(hours)
  local st = state()
  if (st.level or 0) <= 0 then return end
  local cure = Ins.DECAY_PER_HOUR * hours
  if C.IsResting() then cure = cure + Ins.REST_CURE * hours end
  local _, sub = C.Zone()
  if Ins.HOLY_PLACES[sub] then cure = cure + 30 * hours end
  local camping = ns.World.SPELLS.camping
  if camping then
    local found = false
    C.ForEachAura("player", "HELPFUL", function(a) if a.spellId == camping then found = true end end)
    if found then cure = cure + 30 * hours end
  end
  Ins.Add(-cure)
end

function Ins.Whisper()
  local strength = Ins.Strength()
  if strength <= 0 or C.InCombat() then return end
  local rng = U.NewRNG(U.Hash("whisper", C.Now()))
  if rng.next() > strength * 0.5 then return end
  local who = Ins.WRONG_NAMES[rng.int(1, #Ins.WRONG_NAMES)]
  -- Local only: printed to your own chat frame, never sent.
  C.Print(("|cffff80ff%s whispers: %s|r"):format(who, Ins.WHISPERS[rng.int(1, #Ins.WHISPERS)]))
end

ns.OnLogin(function()
  Ins.UpdateVignette()
  C.NewTicker(300, function() Ins.Tick(300 / 3600); Ins.Whisper() end)
end)

