-- "Everything matters sometimes": per-system budgets, noticing-moment cooldowns and the
-- anti-repetition fade. All tunable here (DESIGN.md §3.4–3.5).
local _, ns = ...

local Pacing = {}
ns.Pacing = Pacing

-- every = N: at most once per N conversations. seconds = S: at most once per S seconds.
-- chance = p: extra roll. big = true: always allowed inside a `big` node.
Pacing.BUDGETS = {
  alignment = { every = 5, big = true },
  taint = { seconds = 172800, chance = 0.25 },
  origin = { every = 4 },
  trait = { every = 3 },
  opinion = { every = 4 },
  book = { seconds = 86400 },
  insanity = { every = 2 },
  -- No "death" budget: spirit healers talk about nothing else, and other NPCs' remarks about
  -- your deaths are noticing moments, which have their own pacing.
}

Pacing.ACK = {
  perConversation = 1,
  categoryGlobalSeconds = 1800,      -- same category across all NPCs: 30 min
  categoryNpcSeconds = 259200,       -- same category, same NPC: 3 days
}

Pacing.BEAT = { perConversation = 1, minConversations = 3, minSeconds = 1200 }

-- Seen lines are kept out of the top band for this long (seconds), by slot.
Pacing.FADE = { greeting = 86400, line = 259200, topic = 259200, rumor = 604800, bark = 1800, notice = 0, react = 0, choice = 0 }

-- Rumors: an innkeeper passes one on at most once an hour, with this chance per visit.
Pacing.RUMOR = { chance = 0.5, seconds = 3600 }

local function store()
  local p = ns.char.pacing
  p.sys = p.sys or {}
  p.ack = p.ack or {}
  p.ackNpc = p.ackNpc or {}
  return p
end

-- ok, reason
function Pacing.Check(sys, env)
  local b = Pacing.BUDGETS[sys]
  if not b then return true end
  if b.big and env.nodeBig then return true end
  local rec = store().sys[sys]
  if rec then
    if b.every and (ns.char.conversations - (rec.c or -1000)) < b.every then
      return false, ("%s used %d conversation(s) ago (budget 1 in %d)"):format(sys, ns.char.conversations - rec.c, b.every)
    end
    if b.seconds and (env.now - (rec.t or 0)) < b.seconds then
      return false, ("%s used %d min ago (budget %d min)"):format(sys, math.floor((env.now - rec.t) / 60), b.seconds / 60)
    end
  end
  if env.conv and env.conv.sys and env.conv.sys[sys] then
    return false, sys .. " already used in this conversation"
  end
  if b.chance and env.rng and env.rng.next() >= b.chance then
    return false, ("%s roll failed (chance %.2f)"):format(sys, b.chance)
  end
  return true
end

function Pacing.Use(sys, env)
  store().sys[sys] = { c = ns.char.conversations, t = env.now }
  if env.conv then
    env.conv.sys = env.conv.sys or {}
    env.conv.sys[sys] = true
  end
end

-- Noticing moments: per conversation, per category (global), per category per NPC.
function Pacing.AckAllowed(cat, npcKey, env)
  local conv = env.conv or {}
  if (conv.acks or 0) >= Pacing.ACK.perConversation then
    return false, "noticing budget used this conversation"
  end
  if not cat then return true end
  local p = store()
  local g = p.ack[cat]
  if g and env.now - g < Pacing.ACK.categoryGlobalSeconds then
    return false, ("pacing: %q used %d min ago (%d min)"):format(cat, math.floor((env.now - g) / 60), Pacing.ACK.categoryGlobalSeconds / 60)
  end
  local n = npcKey and p.ackNpc[npcKey .. ":" .. cat]
  if n and env.now - n < Pacing.ACK.categoryNpcSeconds then
    return false, ("pacing: %q with this NPC %.1f days ago"):format(cat, (env.now - n) / 86400)
  end
  return true
end

function Pacing.UseAck(cat, npcKey, env)
  env.conv = env.conv or {}
  env.conv.acks = (env.conv.acks or 0) + 1
  if not cat then return end
  local p = store()
  p.ack[cat] = env.now
  if npcKey then p.ackNpc[npcKey .. ":" .. cat] = env.now end
end

-- Freshness of a line: returns excluded (inside its fade window), factor (0..1 weight).
function Pacing.Freshness(gid, slot, env)
  local rec = ns.char.seen[gid]
  if not rec then return false, 1 end
  local window = Pacing.FADE[slot] or Pacing.FADE.line
  if window <= 0 then return false, 1 end
  local age = env.now - (rec.t or 0)
  if age < window then return true, 0 end
  return false, math.max(0.05, math.min(1, age / (2 * window)))
end

-- Cooldown on a line ("12h", "3d", "5c").
function Pacing.OnCooldown(line, gid, env)
  if not line.cooldown then return false end
  local rec = ns.char.seen[gid]
  if not rec then return false end
  local d = ns.Util.ParseDuration(line.cooldown)
  if not d then return false end
  if d.seconds then return env.now - (rec.t or 0) < d.seconds end
  if d.conversations then return ns.char.conversations - (rec.c or -1000) < d.conversations end
  return false
end
