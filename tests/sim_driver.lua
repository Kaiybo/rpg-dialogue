-- Simulation driver: runs thousands of random but valid characters through the real engine
-- against the real content packs (under the mock client) and prints one TSV record per
-- event for tools/simulate.py to aggregate.
--   lua5.1 tests/sim_driver.lua [characters] [seed]
local ROOT = arg[0]:match("^(.*)/tests/sim_driver%.lua$") or "."
package.path = ROOT .. "/tests/?.lua;" .. package.path
require("wowmock")
local Loader = require("loader")

local N = tonumber(arg[1]) or 300
local SEED = tonumber(arg[2]) or 1

local function out(...) io.write(table.concat({ ... }, "\t"), "\n") end

local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Elwynn", "RPGDialogue_Westfall", "RPGDialogue_Stormwind", "RPGDialogue_Zephras", "RPGDialogue_Redridge", "RPGDialogue_Duskwood", "RPGDialogue_Ironforge", "RPGDialogue_Wetlands", "RPGDialogue_Moonglade", "RPGDialogue_Darnassus", "RPGDialogue_ThunderBluff", "RPGDialogue_Barrens", "RPGDialogue_Ashenvale", "RPGDialogue_Hillsbrad", "RPGDialogue_Darkshore", "RPGDialogue_Orgrimmar", "RPGDialogue_Undercity", "RPGDialogue_LochModan", "RPGDialogue_Stonetalon", "RPGDialogue_Stranglethorn", "RPGDialogue_ThousandNeedles", "RPGDialogue_Durotar", "RPGDialogue_Mulgore", "RPGDialogue_Tirisfal", "RPGDialogue_Teldrassil", "RPGDialogue_Silverpine", "RPGDialogue_Desolace", "RPGDialogue_Tanaris", "RPGDialogue_Dustwallow", "RPGDialogue_Feralas", "RPGDialogue_SwampOfSorrows", "RPGDialogue_Arathi", "RPGDialogue_Hinterlands", "RPGDialogue_Badlands", "RPGDialogue_UnGoro", "RPGDialogue_Winterspring", "RPGDialogue_Felwood", "RPGDialogue_SearingGorge" } })
ns.Packs.LoadAll()
local U = ns.Util
local rng = U.NewRNG(SEED)
local function pick(list) return list[rng.int(1, #list)] end
local function chance(p) return rng.next() < p end

local RACES = {
  Human = { "WARRIOR", "PALADIN", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "HUNTER" },
  Dwarf = { "WARRIOR", "PALADIN", "HUNTER", "ROGUE", "PRIEST", "SHAMAN" },
  Gnome = { "WARRIOR", "ROGUE", "MAGE", "WARLOCK", "PRIEST" },
  NightElf = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "DRUID" },
  Skyborne = { "DRUID", "HUNTER", "ROGUE", "WARRIOR", "MAGE" },
  Orc = { "WARRIOR", "HUNTER", "ROGUE", "SHAMAN", "WARLOCK", "MAGE" },
  Tauren = { "WARRIOR", "HUNTER", "SHAMAN", "DRUID", "PALADIN" },
  Troll = { "WARRIOR", "HUNTER", "ROGUE", "PRIEST", "MAGE", "SHAMAN", "WARLOCK" },
  Scourge = { "WARRIOR", "ROGUE", "PRIEST", "MAGE", "WARLOCK", "PALADIN" },
}
local RACE_LIST = { "Human", "Human", "Human", "Dwarf", "Gnome", "NightElf", "Skyborne" }
-- About a third of the characters are Horde, so Horde-only lines (Thunder Bluff, the
-- Crossroads, Splintertree, Tarren Mill, Orgrimmar, the Undercity) get exercised too.
local HORDE_RACE_LIST = { "Orc", "Tauren", "Troll", "Scourge", "Skyborne" }
local SKYBORNE_HORDE = { "DRUID", "HUNTER", "ROGUE", "WARRIOR", "SHAMAN" }
local SUBZONES = { northshire = "Northshire Abbey", goldshire = "Goldshire", eastvale = "Eastvale Logging Camp",
  sentinel_hill = "Sentinel Hill", westfall_farms = "Saldean's Farm", stormwind = "Trade District", zephras_isle = "Valanaar", lakeshire = "Lakeshire",
  darkshire = "Darkshire", raven_hill = "Raven Hill", ironforge = "The Commons", menethil = "Menethil Harbor", nighthaven = "Nighthaven", darnassus = "Temple of the Moon", thunder_bluff = "Elder Rise", crossroads = "The Crossroads", astranaar = "Astranaar", maestras_post = "Maestra's Post", splintertree = "Splintertree Post", southshore = "Southshore", tarren_mill = "Tarren Mill", auberdine = "Auberdine", orgrimmar = "Valley of Strength", undercity = "Royal Quarter", thelsamar = "Thelsamar", sun_rock = "Sun Rock Retreat", stonetalon_peak = "Stonetalon Peak", booty_bay = "Booty Bay", gromgol = "Grom'gol Base Camp", rebel_camp = "Rebel Camp", freewind = "Freewind Post", mirage_raceway = "Mirage Raceway", valley_of_trials = "Valley of Trials", razor_hill = "Razor Hill", senjin = "Sen'jin Village", narache = "Camp Narache", bloodhoof = "Bloodhoof Village", gevrek = "Camp Gev'rek", deathknell = "Deathknell", brill = "Brill", shadowglen = "Shadowglen", dolanaar = "Dolanaar", kharanos = "Kharanos", coldridge = "Anvilmar", sepulcher = "The Sepulcher", taurajo = "Camp Taurajo", nijels_point = "Nijel's Point", ghost_walker = "Ghost Walker Post", gadgetzan = "Gadgetzan", steamwheedle_port = "Steamwheedle Port", theramore = "Theramore Isle", brackenwall = "Brackenwall Village", feathermoon = "Feathermoon Stronghold", mojache = "Camp Mojache", stonard = "Stonard", refuge_pointe = "Refuge Pointe", hammerfall = "Hammerfall", aerie_peak = "Aerie Peak", kargath = "Kargath", marshals_refuge = "Marshal's Refuge", everlook = "Everlook", bloodvenom_post = "Bloodvenom Post", thorium_point = "Thorium Point" }
local ZONES = { sentinel_hill = "Westfall", westfall_farms = "Westfall", stormwind = "Stormwind City", zephras_isle = "Zephras Isle", lakeshire = "Redridge Mountains", darkshire = "Duskwood", raven_hill = "Duskwood", ironforge = "Ironforge", menethil = "Wetlands", nighthaven = "Moonglade", darnassus = "Darnassus", thunder_bluff = "Thunder Bluff", crossroads = "The Barrens", astranaar = "Ashenvale", maestras_post = "Ashenvale", splintertree = "Ashenvale", southshore = "Hillsbrad Foothills", tarren_mill = "Hillsbrad Foothills", auberdine = "Darkshore", orgrimmar = "Orgrimmar", undercity = "Undercity", thelsamar = "Loch Modan", sun_rock = "Stonetalon Mountains", stonetalon_peak = "Stonetalon Mountains", booty_bay = "Stranglethorn Vale", gromgol = "Stranglethorn Vale", rebel_camp = "Stranglethorn Vale", freewind = "Thousand Needles", mirage_raceway = "Thousand Needles", valley_of_trials = "Durotar", razor_hill = "Durotar", senjin = "Durotar", narache = "Mulgore", bloodhoof = "Mulgore", gevrek = "Mulgore", deathknell = "Tirisfal Glades", brill = "Tirisfal Glades", shadowglen = "Teldrassil", dolanaar = "Teldrassil", kharanos = "Dun Morogh", coldridge = "Dun Morogh", sepulcher = "Silverpine Forest", taurajo = "The Barrens", nijels_point = "Desolace", ghost_walker = "Desolace", gadgetzan = "Tanaris", steamwheedle_port = "Tanaris", theramore = "Dustwallow Marsh", brackenwall = "Dustwallow Marsh", feathermoon = "Feralas", mojache = "Feralas", stonard = "Swamp of Sorrows", refuge_pointe = "Arathi Highlands", hammerfall = "Arathi Highlands", aerie_peak = "The Hinterlands", kargath = "Badlands", marshals_refuge = "Un'Goro Crater", everlook = "Winterspring", bloodvenom_post = "Felwood", thorium_point = "Searing Gorge" }
local PROFS = { "Skinning", "Alchemy", "Herbalism", "Blacksmithing", "Mining", "Tailoring" }

-- Give every TODO quest title a fake ID and register it in capture data, as a real
-- capture would.
local titles, nextID = {}, 900000
local visited = {}
local function scan(v)
  if type(v) ~= "table" or visited[v] then return end
  visited[v] = true
  if v.todo == "quest" and not titles[v.name] then
    nextID = nextID + 1
    titles[v.name] = nextID
    ns.db.capture.quests[nextID] = { title = v.name }
  end
  for _, x in pairs(v) do if type(x) == "table" then scan(x) end end
end
for _, def in pairs(ns.Data.npcs) do scan(def) end
for _, pool in ipairs(ns.Data.pools) do scan(pool) end
for _, t in pairs(ns.Data.threads) do scan(t) end
for _, r in pairs(ns.Data.rumors) do scan(r) end
for _, t in pairs(ns.Data.towns) do scan(t) end
local questIDs = {}
for _, id in pairs(titles) do questIDs[#questIDs + 1] = id end

local keyLines = {}
for gid, rec in pairs(ns.Data.lines) do if rec.line.key then keyLines[#keyLines + 1] = gid end end
table.sort(keyLines)

for gid in pairs(ns.Data.lines) do out("line", gid) end
for id in pairs(ns.Data.topics) do out("topicdef", id) end

local function randomCharacter(i)
  local horde = chance(0.33)
  local race = horde and pick(HORDE_RACE_LIST) or pick(RACE_LIST)
  local class = pick((horde and race == "Skyborne") and SKYBORNE_HORDE or RACES[race])
  local level = chance(0.7) and rng.int(1, 12) or rng.int(13, 60)
  local spoof = {
    race = race, class = class, level = level, gender = chance(0.5) and "male" or "female",
    faction = horde and "Horde" or "Alliance", hour = rng.int(0, 23), drunk = chance(0.1) and rng.int(1, 3) or 0,
    durability = chance(0.15) and rng.next() * 0.3 or 0.9, nearlyNaked = chance(0.05),
    resSick = chance(0.05), stealthed = class == "ROGUE" and chance(0.3), ghost = chance(0.03),
    form = (class == "DRUID" and chance(0.5)) and pick({ "bear", "cat", "travel" }) or false,
    pet = (class == "HUNTER" and { family = pick({ "Wolf", "Cat", "Bear", "Boar" }), type = "Beast", name = "Pet" })
      or (class == "WARLOCK" and { family = pick({ "Imp", "Voidwalker" }), type = "Demon", name = "Pet" }) or false,
    money = rng.int(0, 2000000),
    professions = chance(0.5) and { [pick(PROFS)] = rng.int(1, 150) } or {},
    debuffTypes = chance(0.1) and { [pick({ "Disease", "Curse", "Poison", "Magic" })] = true } or {},
    holiday = {}, auras = {}, outOfPlace = {},
  }
  spoof.tod = ns.Context.TimeOfDay(spoof.hour)
  for b = #ns.World.LEVEL_BANDS, 1, -1 do
    local band = ns.World.LEVEL_BANDS[b]
    if level >= band.min and level <= band.max then spoof.band = band.name end
  end
  if race ~= "Human" and not horde and chance(0.5) then spoof.outOfPlace.far = true end

  -- History
  local c = ns.char
  U.Wipe(c.npc); U.Wipe(c.seen); U.Wipe(c.heard); U.Wipe(c.threads); U.Wipe(c.towns); U.Wipe(c.traits)
  U.Wipe(c.opinions); U.Wipe(c.topics); U.Wipe(c.claims.heard); U.Wipe(c.claims.exposed); U.Wipe(c.quests.turnedIn)
  c.pacing = { sys = {}, ack = {}, ackNpc = {} }
  c.conversations = rng.int(0, 200)
  c.align.light, c.align.order, c.align.honor = rng.int(-60, 60), rng.int(-60, 60), rng.int(-60, 60)
  c.align.taint = chance(0.1) and rng.int(0, 60) or 0
  for _ = 1, rng.int(0, 4) do local t = pick(ns.Effects.TRAITS); c.traits[t] = (c.traits[t] or 0) + rng.int(1, 4) end
  c.deathCount = chance(0.6) and rng.int(0, 20) or 0
  c.origin = (race == "Human" and chance(0.4)) and { id = pick({ "human_westfall_farmhand", "human_minor_noble", "human_lordaeron_refugee", "human_paladin_squire", "other" }) } or nil
  for _, town in ipairs({ "northshire", "goldshire", "eastvale", "sentinel_hill", "westfall_farms", "stormwind", "lakeshire", "darkshire", "raven_hill" }) do
    if chance(0.5) then c.towns[town] = { value = rng.int(-70, 80) } end
  end
  for _, gid in ipairs(keyLines) do if chance(0.25) then c.heard[gid] = Mock.state.now end end
  for _, id in pairs(ns.Data.claims) do if chance(0.25) then c.claims.heard[id.id] = { t = 0 } end end
  for id in pairs(ns.Data.topics) do if chance(0.3) then c.topics[id] = { t = 0 } end end
  c.homeInn = chance(0.4) and { name = pick({ "Goldshire", "Northshire Abbey", "Stormwind City" }) } or nil
  U.Wipe(c.journal)
  U.Wipe(c.books); U.Wipe(c.claims.player)
  if chance(0.15) then c.books["The Seven Kingdoms"] = { t = 0, n = 1 } end
  if chance(0.15) then c.claims.player.player_killed_hogger = { t = 0 } end
  local old = Mock.state.now - rng.int(1, 14) * 86400 - rng.int(0, 86400)
  if chance(0.5) then
    local stances = { "mercy", "hardline", "follow_the_leaders" }
    c.opinions.defias = { stance = pick(stances), npc = "mcbride", communities = { "northshire" }, t = old, heardBy = {} }
    if chance(0.3) then
      c.opinions.defias.contradicts = { stance = pick(stances), npc = "willem", communities = { "northshire" }, t = old - 3600 }
    end
  end
  if chance(0.3) then
    c.opinions.maybell_tommy = { stance = pick({ "romantic", "dutiful" }), npc = "pestle", communities = { "goldshire" }, t = old, heardBy = {} }
  end

  -- Quests: a plausible spread for the level
  local qspoof = {}
  Mock.state.questsDone, Mock.state.questLog = {}, {}
  for _, id in ipairs(questIDs) do
    local r = rng.next()
    local pDone = math.min(0.9, level / 15)
    if r < pDone then
      Mock.state.questsDone[id] = true
      if chance(0.4) then c.quests.turnedIn[id] = Mock.state.now - rng.int(0, 15) * 86400 end
    elseif r < pDone + 0.15 then
      local need = rng.int(4, 10)
      Mock.state.questLog[id] = { title = "q" .. id, ready = chance(0.3),
        objectives = { { text = "x", finished = false, numFulfilled = rng.int(0, need), numRequired = need } } }
    end
  end
  return spoof, qspoof
end

local function src(gid)
  if not gid then return "none" end
  if gid:match("^pool:") then return "pool" end
  if gid:match("^generic:") then return "generic" end
  return "own"
end

local function record(kind, who, node, w)
  out(kind, who, node or "-", w and w.gid or "-", src(w and w.gid), w and w.score or 0)
end

local TOPIC_IDS, OTHER_TOPICS = {}, 3
for topic in pairs(ns.Data.topics) do TOPIC_IDS[#TOPIC_IDS + 1] = topic end
table.sort(TOPIC_IDS)

local function talk(info, spoof, charIndex, mem)
  -- Real play: every conversation counts, and time passes between them.
  ns.char.conversations = ns.char.conversations + 1
  Mock.state.now = Mock.state.now + 1800
  local ctx = ns.Context.New({ spoof = spoof })
  if info.pooled and not info.def then
    local tree = ns.Data.TreePoolFor(info, ctx)
    if tree then info.def, info.key = tree, "pool:" .. tree.id end
  end
  if info.role == "spirithealer" then
    ctx.spoofed.deaths = rng.int(1, 60)
    ctx.spoofed.deathCause = pick({ "falling", "drowning", "fatigue", "guard", "player", "trivial", "elite", "boss", "creature", "unknown" })
    ctx.spoofed.deathsHere = rng.int(0, 4)
    ctx.spoofed.daysSinceDeath = rng.int(0, 30)
  end
  local env = ns.Engine.NewEnv(info, ctx, mem)
  local who = info.key or ("pool:" .. tostring(info.role) .. "@" .. tostring(info.communities[1]))
  local nodes = info.def and info.def.nodes or { hello = ns.Conversation.Node(info, "hello", ctx) }
  for nodeId, node in pairs(nodes) do
    local w = ns.Engine.PickLine(info, nodeId, ctx, env, node.big)
    record("pick", who, nodeId, w)
    if w then
      ns.Memory.MarkSeen(w.gid, w.line)
      if w.line._thread then ns.Threads.Heard(w.line, env) end
      if w.line.fx then ns.Effects.Apply(w.line.fx, env) end
    end
    for i, entry in ipairs(ns.Engine.Choices(node, ctx, env)) do
      local ch = entry.choice
      local ok = ns.Engine.IsSpecial(ch) and (ns.Engine.CheckChoice(ch, ctx, env) and "pass" or "fail") or "-"
      out("choice", who, nodeId, i, ch.text, ch.tag or "-", ok)
    end
  end
  local g = ns.Engine.PickGreeting(info, ctx, env)
  record("greeting", who, nil, g)
  if g then ns.Memory.MarkSeen(g.gid, g.line) end
  ctx.spoofed.ackChance = 1
  env.conv.acks = 0
  local n = ns.Engine.PickNotice(info, ctx, env)
  record("notice", who, nil, n)
  local bark = ns.Engine.PickBark(info, ctx, env)
  if bark then record("bark", who, nil, bark); ns.Memory.MarkSeen(bark.gid, bark.line) end
  local rumor = ns.Engine.PickRumor(info, ctx, env)
  if rumor then record("rumor", who, nil, rumor); ns.Memory.MarkSeen(rumor.gid, rumor.line) end
  for _, ev in ipairs({ "form", "pet", "stealth", "mount", "aura" }) do
    local r = ns.Engine.PickReaction(info, ev, ctx, env)
    if r then record("react", who, ev, r) end
  end
  -- Topics: everything this NPC has its own take on, plus a few others at random (brush-offs
  -- and pool takes). Asking every NPC every topic made the run grow with NPCs x topics
  -- (48 minutes at 0.20.0) while repeating the same brush-off millions of times.
  local asked, seen = {}, {}
  local own = info.def and info.def.topics
  if own then
    for topic in pairs(own) do
      if topic ~= "_none" and ns.Data.topics[topic] and not seen[topic] then seen[topic] = true; asked[#asked + 1] = topic end
    end
  end
  for _ = 1, OTHER_TOPICS do
    local topic = TOPIC_IDS[rng.int(1, #TOPIC_IDS)]
    if not seen[topic] then seen[topic] = true; asked[#asked + 1] = topic end
  end
  table.sort(asked)
  for _, topic in ipairs(asked) do
    local t = ns.Engine.PickTopic(info, topic, ctx, env)
    local gid = t and t.gid or "-"
    local kind = "none"
    if t then
      if t.line._topic == topic then kind = src(gid) == "own" and "own" or "pooltake" else kind = "brushoff" end
    end
    out("topic", who, topic, gid, kind, t and t.score or 0)
  end
  out("hinge", who, charIndex, spoof.race, spoof.class, spoof.level)
end

local pooledNPCs = {
  { pooled = true, role = "guard", communities = { "northshire" }, name = "Northshire Guard" },
  { pooled = true, role = "guard", communities = { "goldshire" }, name = "Stormwind Guard" },
  { pooled = true, role = "child", communities = { "goldshire" }, name = "Child" },
  { pooled = true, role = "flightmaster", communities = {}, name = "Flight Master" },
  { pooled = true, role = "innkeeper", communities = {}, name = "Innkeeper" },
  { pooled = true, role = "vendor", communities = {}, name = "Merchant" },
  { pooled = true, role = "spirithealer", communities = {}, name = "Spirit Healer" },
}

local VISITS = 2  -- the first visit is often already a return (mem.times is random), so two cover both
local function newMem()
  local mem = { times = rng.int(0, 8), affinity = rng.int(-4, 6), topics = {}, flags = {} }
  if mem.times > 0 then mem.last = Mock.state.now - rng.int(0, 30) * 86400 end
  return mem
end

local errors = 0
local START = Mock.state.now
for i = 1, N do
  Mock.state.now = START
  local spoof = randomCharacter(i)
  local everyone = {}
  for key, def in pairs(ns.Data.npcs) do
    everyone[#everyone + 1] = { def = def, key = key, name = def.name, role = def.role, tier = def.tier, communities = def.communities or {} }
  end
  table.sort(everyone, function(a, b) return a.key < b.key end)
  for _, info in ipairs(pooledNPCs) do everyone[#everyone + 1] = info end
  -- Shuffle the visiting order per character, like real play.
  for j = #everyone, 2, -1 do local k = rng.int(1, j); everyone[j], everyone[k] = everyone[k], everyone[j] end
  local mems = {}
  for visit = 1, VISITS do
    for _, info in ipairs(everyone) do
      local id = info.key or info.name
      mems[id] = mems[id] or newMem()
      spoof.subzone = SUBZONES[info.communities[1] or ""] or "Goldshire"
      spoof.zone = ZONES[info.communities[1] or ""] or "Elwynn Forest"
      local ok, err = pcall(talk, info, spoof, i, mems[id])
      if not ok then errors = errors + 1; out("error", id, tostring(err)) end
      mems[id].times = mems[id].times + 1
      mems[id].last = Mock.state.now
    end
    Mock.state.now = Mock.state.now + 86400
  end
end
out("done", N, errors)
