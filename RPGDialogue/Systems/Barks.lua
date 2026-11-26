-- Proximity barks: short lines from NPCs near you, heavily rate-limited, shown as local
-- chat (only on your screen). No API lists nearby NPCs, so we use what the client exposes:
-- nameplates as they appear, your target and your mouseover (DESIGN.md R10).
-- Live reactions for nearby NPCs use the same path: a child squeals as you shift forms.
local _, ns = ...

local C = ns.Compat
local Barks = {}
ns.Barks = Barks

Barks.GLOBAL_SECONDS = 300   -- rare on purpose (0.116.0: was 90)
Barks.NPC_SECONDS = 3600     -- one remark per person per hour at most
Barks.CHANCE = 0.2
Barks.NEARBY_SECONDS = 20

local lastGlobal = 0
local lastByNpc = {}
local nearby = {}      -- guid -> { unit, name, npcID, t }

local function enabled()
  local s = ns.db and ns.db.settings
  -- Nobody butts in while two people near you are talking (Systems/Overheard.lua).
  if ns.Overheard and ns.Overheard.IsPlaying() then return false end
  return s and s.enabled and s.barks and not C.InCombat() and not C.InInstance()
end

local function infoFor(unit)
  if not C.Exists(unit) or C.IsPlayer(unit) or not C.IsFriendly(unit) then return nil end
  local ctx = ns.Context.New({ unit = unit })
  if not ctx.npcName then return nil end
  local info = ns.Conversation.Identify(unit, ctx)
  return info, ctx
end

local function say(info, text)
  C.Print(("|cffffff9f%s says: %s|r"):format(info.name or "?", text))
end

-- Returns true if a bark was said.
Barks.MOUSEOVER_CHANCE = 0.08  -- mouseover happens constantly, so it rolls far lower

function Barks.Try(unit, force, chance)
  if not enabled() then return false end
  local now = C.Now()
  if not force and now - lastGlobal < Barks.GLOBAL_SECONDS then return false end
  local info, ctx = infoFor(unit)
  if not info then return false end
  local key = ns.Memory.Key(info)
  if not force and lastByNpc[key] and now - lastByNpc[key] < Barks.NPC_SECONDS then return false end
  local env = ns.Engine.NewEnv(info, ctx, ns.Memory.Get(key) or {})
  if not force and math.random() > (chance or Barks.CHANCE) then return false end  -- env.rng is seeded per NPC per day: same roll all day
  local w = ns.Engine.PickBark(info, ctx, env)
  if not w then return false end
  ns.Memory.MarkSeen(w.gid, w.line)
  lastGlobal, lastByNpc[key] = now, now
  say(info, ns.Tokens.Render(w.line.text, ctx, env, w.line.when))
  return true
end

local function remember(unit)
  local guid = C.GUID(unit)
  if not guid or C.IsPlayer(unit) then return end
  nearby[guid] = { unit = unit, t = C.Now() }
end

-- A live event (form, pet, mount, stealth) near NPCs who'd react to it.
function Barks.React(event)
  if not enabled() then return end
  local now = C.Now()
  for guid, n in pairs(nearby) do
    if now - n.t > Barks.NEARBY_SECONDS then
      nearby[guid] = nil
    elseif C.GUID(n.unit) == guid then
      local info, ctx = infoFor(n.unit)
      if info then
        local key = ns.Memory.Key(info)
        if not lastByNpc[key] or now - lastByNpc[key] >= 60 then
          local env = ns.Engine.NewEnv(info, ctx, ns.Memory.Get(key) or {})
          local w = ns.Engine.PickReaction(info, event, ctx, env)
          if w then
            lastByNpc[key] = now
            say(info, ns.Tokens.Render(w.line.text, ctx, env, w.line.when))
            return
          end
        end
      end
    end
  end
end

ns.On("NAME_PLATE_UNIT_ADDED", function(_, unit)
  remember(unit)
  Barks.Try(unit)
end)
ns.On("PLAYER_TARGET_CHANGED", function()
  if C.Exists("target") then remember("target"); Barks.Try("target") end
end)
ns.On("UPDATE_MOUSEOVER_UNIT", function()
  -- Passing someone with the mouse over them: they may speak up (0.116.0). Same timers and
  -- roll as every bark, so it stays rare.
  if C.Exists("mouseover") then remember("mouseover"); Barks.Try("mouseover", false, Barks.MOUSEOVER_CHANCE) end
end)

-- Only when no conversation window is open (the controller handles those).
local function liveNearby(event)
  return function()
    local s = ns.Conversation.session
    if s and s.mode == "full" then return end
    Barks.React(event)
  end
end
local formNearby, lastForm = liveNearby("form"), nil
ns.On("UPDATE_SHAPESHIFT_FORM", function()
  -- Only on taking a shape, as in conversation (Conv.OnForm).
  local form = ns.World.FormName(C.FormID())
  local changed = form ~= nil and form ~= lastForm
  lastForm = form
  if changed then formNearby() end
end)
ns.On("UPDATE_STEALTH", liveNearby("stealth"))
ns.On("PLAYER_MOUNT_DISPLAY_CHANGED", liveNearby("mount"))
