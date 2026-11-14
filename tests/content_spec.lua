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
    eq(ns.Util.Count(ns.Data.npcs), 13)
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

  it("the simulation driver runs without runtime errors", function()
    local p = io.popen('cd "' .. Loader.ROOT .. '" && lua5.1 tests/sim_driver.lua 20 3 | tail -1')
    local last = p:read("*l")
    p:close()
    eq(last, "done\t20\t0")
  end)
end)
