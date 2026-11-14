-- Throughlines: stories that emerge across NPCs without ever becoming quests.
-- No quest log, no markers, no pop-ups. Beats are rare: at most one per conversation, and
-- beats of the same thread are kept apart (conversations and real time).
local _, ns = ...

local C = ns.Compat
local Threads = {}
ns.Threads = Threads

Threads.FADE_SECONDS = 21 * 86400   -- an untouched stirring thread fades after three weeks

local function state(id)
  local t = ns.char.threads[id]
  if not t then
    t = { state = "dormant", beats = {}, choices = {} }
    ns.char.threads[id] = t
  end
  t.beats = t.beats or {}
  t.choices = t.choices or {}
  return t
end
Threads.State = state

function Threads.BeatsFor(npcKey)
  return (ns.Data and ns.Data.beatsByNpc and ns.Data.beatsByNpc[npcKey]) or {}
end

-- Pacing for a beat candidate. Returns ok, reason (reason shows as HELD in /rpgd why).
function Threads.Filter(beat, gid, env)
  local thread = beat._thread
  if not thread then return false, "beat without a thread" end
  local t = ns.char.threads[thread.id]
  if t and t.beats and t.beats[beat.id] then return false, "beat already heard" end
  if t and (t.state == "resolved" or t.state == "soured" or t.state == "faded") then
    return false, "thread " .. thread.id .. " is " .. t.state
  end
  if t and t.force == beat.id then return true end
  env = env or {}
  if env.conv and (env.conv.beats or 0) >= ns.Pacing.BEAT.perConversation then
    return false, "pacing: one beat per conversation"
  end
  local pacing = thread.pacing or {}
  local minConv = pacing.minConversations or ns.Pacing.BEAT.minConversations
  local minSec = pacing.minSeconds or ns.Pacing.BEAT.minSeconds
  if t and t.lastConv and (ns.char.conversations - t.lastConv) < minConv then
    return false, ("pacing: %s had a beat %d conversation(s) ago (min %d)"):format(thread.id, ns.char.conversations - t.lastConv, minConv)
  end
  if t and t.lastT and env.now and (env.now - t.lastT) < minSec then
    return false, ("pacing: %s had a beat %d min ago (min %d)"):format(thread.id, math.floor((env.now - t.lastT) / 60), minSec / 60)
  end
  return true
end

-- Called when a beat was shown.
function Threads.Heard(beat, env)
  local thread = beat._thread
  local t = state(thread.id)
  local now = env.now or C.Now()
  t.beats[beat.id] = now
  t.lastConv = ns.char.conversations
  t.lastT = now
  t.force = nil
  if t.state == "dormant" then t.state = "stirring" end
  if env.conv then env.conv.beats = (env.conv.beats or 0) + 1 end
  -- Journal: every beat is recorded; at the third, a reflective entry ties them together.
  if ns.Effects then
    local j = beat.journal or {
      first = "{npc} told me: \"" .. beat.text .. "\"",
      third = "{npc} told {name}: \"" .. beat.text .. "\"",
    }
    ns.Effects.Journal(j, env.ctx or {}, env)
    local n = ns.Util.Count(t.beats)
    if n == 3 and thread.reflection then ns.Effects.Journal(thread.reflection, env.ctx or {}, env) end
  end
  ns.Fire("THREAD_BEAT", thread.id, beat.id)
end

-- Threads nobody follows up on just fade.
function Threads.Fade(now)
  for id, t in pairs(ns.char.threads) do
    if (t.state == "stirring" or t.state == "unfolding") and t.lastT and now - t.lastT > Threads.FADE_SECONDS then
      t.state = "faded"
      t.fadedAt = now
    end
  end
end

-- Dev: lines for /rpgd threads
function Threads.Describe()
  local out = {}
  for id, def in pairs(ns.Data.threads) do
    local t = ns.char.threads[id] or { state = "dormant", beats = {} }
    local heard, waiting = {}, {}
    for _, b in ipairs(def.beats or {}) do
      if t.beats and t.beats[b.id] then heard[#heard + 1] = b.id .. "@" .. b.npc
      else waiting[#waiting + 1] = b.id .. "@" .. b.npc end
    end
    out[#out + 1] = ("%s [%s] heard: %s | waiting: %s%s"):format(id, t.state, table.concat(heard, ", "),
      table.concat(waiting, ", "), t.force and (" | forced: " .. t.force) or "")
  end
  table.sort(out)
  return out
end

function Threads.Reset(id)
  ns.char.threads[id] = nil
end

function Threads.Force(id, beatId)
  local def = ns.Data.threads[id]
  if not def then return false end
  for _, b in ipairs(def.beats or {}) do
    if b.id == beatId then
      local t = state(id)
      t.force = beatId
      if t.beats then t.beats[beatId] = nil end
      return true, b.npc
    end
  end
  return false
end

ns.OnLogin(function() Threads.Fade(C.Now()) end)
