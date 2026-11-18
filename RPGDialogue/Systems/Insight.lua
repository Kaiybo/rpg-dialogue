-- Gut feelings (BG3-style insight): now and then, when someone says something they're not
-- reliable about, a dim note under the page says how it sat with you ("Something in his
-- voice doesn't sit right."). Built on claims (CONTENT_GUIDE §8): a line that carries
-- fx.hear on a claim that isn't plainly true, or a line with its own `tell`
-- ("lie" | "true" | "hiding" | "afraid"). At most one per conversation, and seeded per line,
-- so reopening the conversation doesn't reroll it. Notes come from P:GutNotes (World pack).
local _, ns = ...

local U = ns.Util

local Insight = {}
ns.Insight = Insight

Insight.BASE = 0.10
Insight.MAX = 0.65
-- Who reads people well: rogues and priests most, then druids and shamans.
Insight.CLASS = {
  ROGUE = 0.18, PRIEST = 0.18, DRUID = 0.14, SHAMAN = 0.14,
  PALADIN = 0.07, MAGE = 0.05, WARLOCK = 0.06, HUNTER = 0.05, WARRIOR = 0.02,
}
-- Dominant traits that make you harder to fool.
Insight.TRAITS = { skeptical = 0.12, cautious = 0.07, curious = 0.05, witty = 0.05 }
Insight.WARM = 0.08          -- disposition Warm or better: they let things slip
Insight.CLOSE = 0.04         -- and a little more at Friendly or Devoted
Insight.CONTRADICTED = 0.20  -- you've already heard it contradicted

-- A claim's truth, read as a tell. Plainly true claims say nothing.
Insight.FROM_TRUTH = { ["false"] = "lie", partly = "hiding", disputed = "true", unknown = "true" }
Insight.TELLS = { lie = true, ["true"] = true, hiding = true, afraid = true }

Insight.notes = {}  -- { lie = { texts }, ..., class = { ROGUE = { lie = {...} } } }, merged from packs

-- Registered by P:GutNotes (PackAPI): several packs may add to the pools.
function Insight.Add(def)
  local n = Insight.notes
  for tell in pairs(Insight.TELLS) do
    for _, t in ipairs(U.AsList(def[tell])) do
      n[tell] = n[tell] or {}
      table.insert(n[tell], t)
    end
  end
  for class, pools in pairs(def.class or {}) do
    n.class = n.class or {}
    n.class[class] = n.class[class] or {}
    for tell, list in pairs(pools) do
      n.class[class][tell] = n.class[class][tell] or {}
      for _, t in ipairs(U.AsList(list)) do table.insert(n.class[class][tell], t) end
    end
  end
end

local function claims()
  local c = ns.char.claims
  c.doubted = c.doubted or {}
  return c
end

-- The tell for a line, and the claim it rests on (if any).
function Insight.Tell(line)
  if type(line) ~= "table" then return nil end
  local fx = type(line.fx) == "table" and line.fx or nil
  local claimId
  for _, id in ipairs(fx and fx.hear and U.AsList(fx.hear) or {}) do
    claimId = claimId or id
    local def = ns.Data.claims[id]
    local tell = def and (def.tell or Insight.FROM_TRUTH[tostring(def.truth)])
    if not line.tell and tell then return tell, id end
  end
  if line.tell and Insight.TELLS[line.tell] then return line.tell, claimId end
  return nil
end

-- Has the player heard this claim contradicted: settled, a claim that disputes it, or a
-- line that exposes it?
function Insight.Contradicted(claimId)
  if not claimId then return false end
  local c = claims()
  if c.exposed[claimId] then return true end
  local def = ns.Data.claims[claimId]
  for _, other in ipairs(def and U.AsList(def.contradicts) or {}) do
    if c.heard[other] then return true end
  end
  for id in pairs(c.heard) do
    local o = ns.Data.claims[id]
    if o and id ~= claimId then
      for _, x in ipairs(U.AsList(o.contradicts)) do if x == claimId then return true end end
    end
  end
  for _, src in ipairs(def and U.AsList(def.exposedBy) or {}) do
    if type(src) == "string" and not src:find("^quest:") and ns.char.heard[src] then return true end
  end
  return false
end

function Insight.Chance(ctx, env, claimId)
  local p = Insight.BASE + (Insight.CLASS[ctx.class or ""] or 0)
  local spoofed = ctx.spoofed and ctx.spoofed.trait
  local dom = spoofed and { spoofed } or (ns.Effects and ns.Effects.DominantTraits and ns.Effects.DominantTraits()) or {}
  for _, t in ipairs(dom) do p = p + (Insight.TRAITS[t] or 0) end
  if ns.Disposition and env then
    local d = ns.Disposition.For(env, ctx)
    if d and d >= 60 then p = p + Insight.WARM end
    if d and d >= 75 then p = p + Insight.CLOSE end
  end
  if Insight.Contradicted(claimId) then p = p + Insight.CONTRADICTED end
  return math.min(p, Insight.MAX)
end

local PRONOUNS = {
  male = { his = "his", him = "him", His = "His", Him = "Him" },
  female = { his = "her", him = "her", His = "Her", Him = "Her" },
  none = { his = "their", him = "them", His = "Their", Him = "Them" },
}

local function pick(list, seed)
  if not list or #list == 0 then return nil end
  return list[(seed % #list) + 1]
end

function Insight.NoteText(tell, ctx, env, seed)
  local n = Insight.notes
  local cls = n.class and n.class[ctx.class or ""]
  local text
  if cls and cls[tell] and seed % 3 == 0 then text = pick(cls[tell], math.floor(seed / 3)) end
  text = text or pick(n[tell], seed)
  if not text then return nil end
  local def = env and env.info and env.info.def
  local g = ctx.npcGender or (def and def.gender)
  local p = PRONOUNS[g or "none"] or PRONOUNS.none
  text = text:gsub("{(%a+)}", function(k) return p[k] end)
  return ns.Tokens.Render(text, ctx, env)
end

-- A line was just said. Returns the note to show, or nil. Records what was noticed.
function Insight.Notice(s, winner)
  if not s or not winner or s.gutDone or s.mode ~= "full" then return nil end
  if ns.db.settings.gutFeelings == false then return nil end
  local tell, claimId = Insight.Tell(winner.line)
  if not tell then return nil end
  local c = claims()
  c.gutSeen = c.gutSeen or {}
  if c.gutSeen[winner.gid] then return nil end
  local ctx, env = s.ctx, s.env
  local seed = U.Hash("gut", s.memKey or "?", winner.gid or "?")
  if (seed % 1000) / 1000 >= Insight.Chance(ctx, env, claimId) then return nil end
  local text = Insight.NoteText(tell, ctx, env, math.floor(seed / 1000))
  if not text then return nil end
  s.gutDone = true
  local now = env and env.now or 0
  c.gutSeen[winner.gid] = now
  if tell == "lie" then
    c.doubted[winner.gid] = now
    if claimId then c.doubted[claimId] = now end
  end
  return text
end

-- For the journal: did you doubt this claim or this line?
function Insight.Doubted(id)
  local c = ns.char and ns.char.claims
  return c and c.doubted and c.doubted[id] ~= nil or false
end
