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

---------------------------------------------------------------------------
-- Voices (0.117.0): a text to speech voice per NPC race and gender, and our own speed and
-- volume. Settings: ttsVoiceMode = "game" (the game's two picks) | "race" (each race and
-- gender its own voice from those installed), ttsCustom (use ttsRate -10..10, ttsVolume
-- 0..100). Everything falls back to Compat's choices when the TTS API is missing.
-- Core can call ns.Voices.Speak(text, unit, info, gender); until it does, Conv.Speak is
-- wrapped at login so the speaker is known while C.Speak picks its voice.
---------------------------------------------------------------------------
local V = {}
ns.Voices = V
local speaker     -- { race, gender } while a line is being started

local baseVoice, baseRate, baseVolume = C.TTSVoice, C.TTSRate, C.TTSVolume

local function settings() return ns.db and ns.db.settings or {} end

-- Race tokens folded into voice families, so kin share a voice.
V.FAMILY = { Human = "human", Dwarf = "dwarf", Gnome = "gnome", NightElf = "nightelf", Orc = "orc",
  Troll = "troll", Tauren = "tauren", Scourge = "forsaken", Undead = "forsaken", Goblin = "goblin",
  BloodElf = "elf", HighElf = "elf" }

local function hash(str)
  local h = 0
  for i = 1, #str do h = (h * 31 + str:byte(i)) % 1000003 end
  return h
end

local FEMALE = { "female", "zira", "hazel", "susan", "eva", "linda", "heera", "catherine", "hedda",
  "helena", "julie", "hortense", "elsa", "paulina", "maria", "haruka", "huihui", "samantha", "karen",
  "moira", "tessa", "fiona", "victoria", "allison", "ava", "serena", "kate", "aria", "jenny", "sonia", "libby" }

local function isFemale(v)
  local n = type(v) == "table" and (v.name or ""):lower() or ""
  for _, w in ipairs(FEMALE) do if n:find("%f[%a]" .. w .. "%f[%A]") then return true end end
  return false
end

-- Installed voices that suit a gender; with too few to choose from, nil (use the game's).
local function voicesFor(gender)
  local all = C.TTSVoices and C.TTSVoices() or {}
  local out = {}
  for i = 1, #all do
    if type(all[i]) == "table" and (gender == "female") == isFemale(all[i]) then out[#out + 1] = all[i] end
  end
  return out
end

-- The voice for a race family and gender: the player's own pick (ttsVoiceFor[family..gender]
-- = voiceID) if still installed, else one chosen steadily from the matching voices.
function V.VoiceFor(family, gender)
  local s = settings()
  if s.ttsVoiceMode ~= "race" or not family then return baseVoice(gender) end
  local key = family .. ":" .. tostring(gender or "?")
  local all = C.TTSVoices and C.TTSVoices() or {}
  local pick = s.ttsVoiceFor and s.ttsVoiceFor[key]
  if pick then for i = 1, #all do if all[i].voiceID == pick then return all[i] end end end
  local list = voicesFor(gender)
  if #list < 2 then return baseVoice(gender) end
  return list[hash(key) % #list + 1]
end

-- Step a race and gender to the next installed voice (for a settings button or slash).
function V.Cycle(family, gender)
  local list = voicesFor(gender)
  if #list == 0 then return nil end
  local s = settings()
  s.ttsVoiceFor = s.ttsVoiceFor or {}
  local cur, idx = V.VoiceFor(family, gender), 0
  for i, v in ipairs(list) do if cur and v.voiceID == cur.voiceID then idx = i end end
  local nxt = list[idx % #list + 1]
  s.ttsVoiceFor[family .. ":" .. tostring(gender or "?")] = nxt.voiceID
  return nxt
end

function V.Family(unit, info)
  local token
  if unit and C.Exists(unit) then token = select(2, C.Race(unit)) end
  token = token or (info and (info.raceToken or info.race))
  if type(token) ~= "string" then return nil end
  return V.FAMILY[token] or token:lower():gsub("%s", "")
end

-- Compat reads these through C.* at speak time, so overriding them steers its voice.
C.TTSVoice = function(gender)
  local ok, v = pcall(function()
    if speaker and speaker.family then return V.VoiceFor(speaker.family, gender or speaker.gender) end
  end)
  if ok and v then return v end
  return baseVoice(gender)
end
C.TTSRate = function()
  local s = settings()
  if s.ttsCustom and tonumber(s.ttsRate) then return math.max(-10, math.min(10, s.ttsRate)) end
  return baseRate()
end
C.TTSVolume = function()
  local s = settings()
  if s.ttsCustom and tonumber(s.ttsVolume) and s.ttsVolume > 0 then return math.min(100, s.ttsVolume) end
  return baseVolume()
end

-- Speak a line in the voice for this speaker. Returns what C.Speak returns.
function V.Speak(text, unit, info, gender)
  if not (C.TTSAvailable and C.TTSAvailable() and C.Speak) then return false end
  gender = gender or (unit and C.Exists(unit) and C.Sex(unit)) or (info and info.gender)
  speaker = { family = V.Family(unit, info), gender = gender }
  local ok, r = pcall(C.Speak, text, gender)
  speaker = nil
  return ok and r
end

ns.OnLogin(function()
  local Conv = ns.Conversation
  if Conv and Conv.Speak and not Conv._voicesWrapped then
    Conv._voicesWrapped = true
    Conv.Speak = function(sess, text)
      if not settings().tts then return end
      return V.Speak(text, sess and sess.unit, sess and sess.info)
    end
  end
end)
