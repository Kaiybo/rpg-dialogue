-- M3: the real content packs load, validate in the engine and hold a conversation.

local function bootReal()
  local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Elwynn" } })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  ns.db.settings.openMode = "compact"
  return ns
end

describe("Content packs", function()
  it("load at login (World) and by zone (Elwynn) with no warnings", function()
    local ns = bootReal()
    local loaded = {}
    for _, p in ipairs(ns.Packs.List()) do loaded[p.id] = p.loaded; eq(p.warnings, 0, p.id .. " warnings") end
    ok(loaded["rpgd.world"] and loaded["rpgd.elwynn"])
    eq(ns.Util.Count(ns.Data.npcs), 23)
    ok(ns.Data.threads.elwynn_gold and ns.Data.towns.goldshire and ns.Data.claims.defias_common_thieves)
  end)

  it("every condition key and effect used in content is known to the engine", function()
    local ns = bootReal()
    local function walk(when)
      if type(when) ~= "table" then return end
      for k, v in pairs(when) do
        ok(ns.Conditions.IsKnown(k), "unknown key " .. tostring(k))
        if k == "all" or k == "not" then walk(v) elseif k == "any" then for _, s in ipairs(v) do walk(s) end end
      end
    end
    for _, rec in pairs(ns.Data.lines) do
      walk(rec.line.when)
      for k in pairs(rec.line.fx or {}) do ok(ns.Effects.KEYS[k], "unknown effect " .. k) end
    end
  end)

  it("McBride greets a new human warrior in full, with a real line of his", function()
    local ns = bootReal()
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-197-AB", name = "Marshal McBride", level = 20 }
    Mock.NewFrame("Frame", "GossipFrame"):Show()
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
    local s = ns.Conversation.session
    eq(s.mode, "full")
    ok(s.lastLine:match("^mcbride%."), "own line: " .. tostring(s.lastLine))
    ok(#s.choiceEntries >= 2)
  end)

  it("a Goldshire guard uses the Goldshire pool and reacts to town standing", function()
    local ns = bootReal()
    Mock.state.subzone = "Goldshire"
    ns.char.towns.goldshire = { value = 60 }
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-1423-AB", name = "Stormwind Guard", level = 30 }
    Mock.NewFrame("Frame", "GossipFrame"):Show()
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
    local s = ns.Conversation.session
    eq(s.info.role, "guard")
    eq(s.info.communities[1], "goldshire")
    contains(ns.UI.Compact.Text(), "smells that much of gnoll")
  end)

  it("a class trainer speaks from the pool for their class, not the plain trainer pool", function()
    local ns = bootReal()
    Mock.state.zone, Mock.state.subzone = "Stormwind City", "Cathedral Square"
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-99001-AB", name = "Some Trainer", level = 40 }
    Mock.state.tooltip.npc = { { leftText = "Some Trainer" }, { leftText = "<Paladin Trainer>" } }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "trainer")
    local pools = ns.Data.PoolsFor(info, ctx)
    eq(pools[1].pool.id, "trainer_paladin")
    eq(pools[1].base, 150)
    eq(pools[#pools].pool.id, "trainer")
    -- a priest trainer doesn't get the paladin pool
    Mock.state.tooltip.npc[2].leftText = "<Priest Trainer>"
    ctx = ns.Context.New({ unit = "npc" })
    info = ns.Conversation.Identify("npc", ctx)
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "trainer_priest")
  end)

  it("capital guards belong to their city by zone", function()
    local ns = bootReal()
    Mock.state.zone, Mock.state.subzone = "Ironforge", "The Commons"
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-5595-AB", name = "Ironforge Guard", level = 55 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(info.communities[1], "ironforge")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_ironforge")
  end)

  it("Westfall and Stormwind load when you get there, and their people speak", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Elwynn", "RPGDialogue_Westfall", "RPGDialogue_Stormwind" } })
    ns.db.settings.instantText = true
    ns.db.settings.sounds = false
    local function loaded(id)
      for _, p in ipairs(ns.Packs.List()) do if p.id == id then return p.loaded, p.warnings end end
    end
    eq((loaded("rpgd.westfall")), false)
    Mock.state.zone, Mock.state.subzone = "Westfall", "Sentinel Hill"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    local ok1, warn1 = loaded("rpgd.westfall")
    ok(ok1, "Westfall pack loaded")
    eq(warn1, 0)
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-99234-AB", name = "Gryan Stoutmantle", level = 30 }
    Mock.NewFrame("Frame", "GossipFrame"):Show()
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
    local s = ns.Conversation.session
    eq(s.info.key, "gryan")
    eq(s.info.communities[1], "sentinel_hill")
    ns.Conversation.End("test")

    Mock.state.zone, Mock.state.subzone = "Stormwind City", "Stormwind Keep"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    local ok2, warn2 = loaded("rpgd.stormwind")
    ok(ok2, "Stormwind pack loaded")
    eq(warn2, 0)
    eq(ns.Data.FindNPC(nil, "Lady Katrana Prestor").key, "katrana")
    ok(ns.Data.threads.westfall_left and #ns.Data.threads.westfall_left.beats == 6)
  end)

  it("Zephras Isle's Peacekeepers are guards of the isle, and the High Elder knows her own", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Zephras" } })
    ns.db.settings.instantText = true
    Mock.state.zone, Mock.state.subzone = "Zephras Isle", "Valanaar"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-99501-AB", name = "Valanaar Peacekeeper", level = 20 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(info.communities[1], "zephras_isle")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_zephras")
    eq(ns.Data.FindNPC(nil, "Talaanis Shadowsong").key, "talaanis")
  end)

  it("the simulation driver runs without runtime errors", function()
    local p = io.popen('cd "' .. Loader.ROOT .. '" && lua5.1 tests/sim_driver.lua 20 3 | tail -1')
    local last = p:read("*l")
    p:close()
    eq(last, "done\t20\t0")
  end)
end)
