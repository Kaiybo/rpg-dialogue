-- Letters (0.80.0): now and then someone you've met writes to you, and the letter waits at
-- the mailbox. The game's real mail is the server's, so ours sit beside it: open any mailbox
-- and a "Letters" panel lists what has come (UI/Letters.lua).
--
-- A pack registers a letter with P:Letter { id, npc, from, subject, body, when, delay,
-- journal, fx }. It is sent either by a dialogue effect (fx = { letter = "id" }) or on its
-- own once `when` holds (checked every minute). It arrives `delay` seconds later (default
-- 30 minutes), and the chat says so when it does. No more than one arrives per SPACING.
-- Random letters (random = true, optional `when`, `weight`): now and then, at most one per
-- RANDOM_GAP, one may turn up unasked. junk = true marks junk mail (rarer, by weight).
-- Setting: settings.letters (off: nothing new is sent or delivered, the panel stays shut).
local _, ns = ...

local C = ns.Compat
local L = ns.L
local Letters = {}
ns.Letters = Letters

Letters.DEFAULT_DELAY = 1800
Letters.KEEP = 40          -- most letters kept in the mailbox; the oldest read ones go first
Letters.SPACING = 3600          -- at most one letter reaches the mailbox per hour; the rest wait their turn
Letters.RANDOM_GAP = 6 * 3600   -- at least this long between random letters (and since any letter arrived)
Letters.RANDOM_CHANCE = 1 / 180 -- per minute once the gap has passed (about three hours on average)
Letters.JUNK_WEIGHT = 0.3       -- junk mail's default weight against a normal random letter's 1

function Letters.Enabled()
  return ns.db ~= nil and ns.db.settings.letters ~= false and ns.db.settings.enabled ~= false
end

local function store()
  ns.char.letters = ns.char.letters or {}
  return ns.char.letters
end

function Letters.Def(id) return ns.Data.letters and ns.Data.letters[id] end

-- Who signs it: `from`, else the NPC's name, else the key. The NPC's zone pack is often not
-- loaded (you read the letter somewhere else), so the name you remember them by comes next.
function Letters.From(def)
  if def.from then return def.from end
  local npc = def.npc and ns.Data.npcs[def.npc]
  if npc and npc.name then return npc.name end
  local mem = def.npc and ns.char and ns.char.npc and ns.char.npc[def.npc]
  return (mem and mem.name) or def.npc or "?"
end

local function envFor(def, now)
  local mem = def.npc and ns.Memory.Get(def.npc) or nil
  local npc = def.npc and ns.Data.npcs[def.npc]
  return { now = now, mem = mem or { times = 0, flags = {} },
    info = { key = def.npc, name = Letters.From(def), def = npc } }
end

-- Send a letter (a dialogue effect or a met `when`). Each letter comes once.
function Letters.Queue(id, now)
  local def = Letters.Def(id)
  if not def or not ns.char then return false end
  local s = store()
  if s[id] then return false end
  now = now or C.Now()
  s[id] = { sent = now, due = now + (def.delay or Letters.DEFAULT_DELAY) }
  return true
end

-- Letters whose `when` has come true. Someone writes only if you've spoken with them, unless
-- the letter says `stranger = true`.
function Letters.CheckConditions(now)
  local s = store()
  local ctx
  for id, def in pairs(ns.Data.letters or {}) do
    if not s[id] and def.when and not def.random then
      local env = envFor(def, now)
      if def.stranger or not def.npc or (env.mem.times or 0) > 0 then
        ctx = ctx or ns.Context.New({ spoof = {} })
        if ns.Conditions.Eval(def.when, ctx, env) then Letters.Queue(id, now) end
      end
    end
  end
end

local function eligible(def, now)
  local env = envFor(def, now)
  if def.npc and not def.stranger and (env.mem.times or 0) == 0 then return false end
  return not def.when or ns.Conditions.Eval(def.when, ns.Context.New({ spoof = {} }), env)
end

-- Now and then a letter nobody asked for: picked by weight among random letters not yet had.
function Letters.RollRandom(now, force)
  local c = ns.char
  if not force then
    if now - (c.lettersRandomAt or 0) < Letters.RANDOM_GAP then return nil end
    if now - (c.lettersLastAt or 0) < Letters.RANDOM_GAP / 2 then return nil end
    for _, r in pairs(store()) do if not r.arrived then return nil end end -- one is still on its way
    if math.random() >= Letters.RANDOM_CHANCE then return nil end
  end
  local s, pool, total = store(), {}, 0
  for id, def in pairs(ns.Data.letters or {}) do
    if def.random and not s[id] and eligible(def, now) then
      local w = def.weight or (def.junk and Letters.JUNK_WEIGHT or 1)
      pool[#pool + 1] = { id = id, w = w }
      total = total + w
    end
  end
  if total <= 0 then return nil end
  table.sort(pool, function(a, b) return a.id < b.id end)
  local roll = math.random() * total
  for _, e in ipairs(pool) do
    roll = roll - e.w
    if roll <= 0 then
      c.lettersRandomAt = now
      Letters.Queue(e.id, now)
      return e.id
    end
  end
end

-- Due letters reach the mailbox one at a time, at most one per SPACING; the earliest due
-- goes first and the others wait. forceId (testing) delivers that one now regardless.
-- Returns how many arrived (0 or 1).
function Letters.Deliver(now, forceId)
  local c = ns.char
  local s, pick, pickId = store(), nil, nil
  if forceId then
    pick, pickId = s[forceId], forceId
    if not pick or pick.arrived or not Letters.Def(forceId) then return 0 end
  elseif now - (c.lettersLastAt or 0) < Letters.SPACING then return 0 end
  if not forceId then for id, r in pairs(s) do
    if not r.arrived and r.due and r.due <= now and Letters.Def(id) then
      if not pick or r.due < pick.due or (r.due == pick.due and id < pickId) then pick, pickId = r, id end
    end
  end end
  if not pick then return 0 end
  pick.arrived = now
  c.lettersLastAt = now
  local def = Letters.Def(pickId)
  if def.junk then ns.Print(L.LETTER_ARRIVED_JUNK)
  else ns.Print(L.LETTER_ARRIVED:format(Letters.From(def))) end
  if ns.db.settings.sounds ~= false then C.PlaySound("TELL_MESSAGE") end
  Letters.Trim()
  ns.Fire("LETTERS_CHANGED")
  return 1
end

function Letters.Tick()
  if not ns.char or not Letters.Enabled() then return end
  local now = C.Now()
  ns.Guard("letters", function()
    Letters.CheckConditions(now)
    Letters.RollRandom(now)
    Letters.Deliver(now)
  end)
end

-- The mailbox: arrived, not burned, newest first.
function Letters.Inbox()
  local out = {}
  for id, r in pairs(store()) do
    local def = Letters.Def(id)
    if def and r.arrived and not r.burned then out[#out + 1] = { id = id, def = def, rec = r } end
  end
  table.sort(out, function(a, b)
    if a.rec.arrived ~= b.rec.arrived then return a.rec.arrived > b.rec.arrived end
    return a.id < b.id
  end)
  return out
end

function Letters.Unread()
  local n = 0
  for _, e in ipairs(Letters.Inbox()) do if not e.rec.read then n = n + 1 end end
  return n
end

-- Body text with tokens filled ({name}, {class}...).
function Letters.Body(def)
  local env = envFor(def, C.Now())
  return ns.Tokens.Render(def.body or "", ns.Context.New({ spoof = {} }), env)
end

-- Opening a letter for the first time: the journal line and any fx.
function Letters.Read(id)
  local r = store()[id]
  local def = Letters.Def(id)
  if not r or not def or r.read then return end
  local now = C.Now()
  r.read = now
  local ctx = ns.Context.New({ spoof = {} })
  local env = envFor(def, now)
  local from, subject = Letters.From(def), def.subject or ""
  if not def.junk or def.journal then ns.Effects.Journal(def.journal or {
    first = L.LETTER_JOURNAL:format(from, subject),
    third = L.LETTER_JOURNAL_3:format(from, subject),
  }, ctx, env) end
  if def.fx then ns.Effects.Apply(def.fx, env) end
  ns.Fire("LETTERS_CHANGED")
end

function Letters.Burn(id)
  local r = store()[id]
  if r then r.burned = C.Now(); r.read = r.read or r.burned end
  ns.Fire("LETTERS_CHANGED")
end

-- Keep the mailbox small: past KEEP, the oldest read letters are burned.
function Letters.Trim()
  local inbox = Letters.Inbox()
  for i = #inbox, Letters.KEEP + 1, -1 do
    if inbox[i].rec.read then inbox[i].rec.burned = C.Now() end
  end
end

ns.Listen("CONVERSATION_ENDED", function() C.After(1, Letters.Tick) end)
ns.OnLogin(function()
  -- No random letter in a new character's first hours.
  if ns.char and (ns.char.lettersRandomAt or 0) == 0 then ns.char.lettersRandomAt = C.Now() end
  C.After(5, Letters.Tick)
  C.NewTicker(60, Letters.Tick)
end)
