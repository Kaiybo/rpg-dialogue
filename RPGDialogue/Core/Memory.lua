-- NPC memory and line history.
local _, ns = ...

local C = ns.Compat
local Memory = {}
ns.Memory = Memory

-- Stable memory key: the content key for named NPCs, else the NPC ID, else the name.
function Memory.Key(info)
  if info.key then return info.key end
  if info.npcID then return "id:" .. info.npcID end
  return "name:" .. tostring(info.name)
end

function Memory.Get(key)
  return ns.char.npc[key]
end

-- Returns the record as it was before this conversation (times = previous count).
function Memory.Begin(key, info)
  local rec = ns.char.npc[key]
  if not rec then
    rec = { times = 0, affinity = 0, topics = {}, flags = {}, name = info and info.name }
    ns.char.npc[key] = rec
  end
  rec.topics = rec.topics or {}
  rec.flags = rec.flags or {}
  return rec
end

function Memory.End(rec, lastLine)
  local now = C.Now()
  rec.first = rec.first or now
  rec.last = now
  rec.times = (rec.times or 0) + 1
  if lastLine then rec.lastLine = lastLine end
end

function Memory.MarkSeen(gid, line)
  local seen = ns.char.seen
  local rec = seen[gid]
  if not rec then rec = { n = 0 }; seen[gid] = rec end
  rec.t = C.Now()
  rec.n = rec.n + 1
  rec.c = ns.char.conversations
  if line and line.key then ns.char.heard[gid] = rec.t end
end

function Memory.Seen(gid)
  return ns.char.seen[gid]
end
