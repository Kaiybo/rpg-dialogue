-- A human priest: Shadowform is noticed for what it is (never mistaken for a druid's beast),
-- stance changes and leaving a shape say nothing, and the Cathedral has more to say.

local function boot(opts)
  opts = opts or {}
  local ns = Loader.Boot({
    packs = opts.packs or { "RPGDialogue_World", "RPGDialogue_Elwynn", "RPGDialogue_Stormwind" },
    setup = function(state)
      local p = state.units.player
      p.class, p.classFile, p.level = opts.class or "Priest", opts.classFile or "PRIEST", opts.level or 40
      state.zone, state.subzone = opts.zone or "Stormwind City", opts.subzone or "Cathedral Square"
      state.form = opts.form or 0
    end,
  })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  ns.db.settings.ackChance = 1                  -- always notice, so the tests can see it
  Mock.Fire("ZONE_CHANGED_NEW_AREA")
  Mock.RunTimers()
  return ns
end

local function talk(name, id)
  Mock.state.units.npc = { guid = "Creature-0-1-0-1-" .. id .. "-AB", name = name, level = 30, reaction = 5 }
  local f = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
  f:Show()
  Mock.Fire("GOSSIP_SHOW")
  Mock.RunTimers()
end

local function leave(ns)
  if _G.GossipFrame then _G.GossipFrame:Hide() end
  if ns.Conversation.session then ns.Conversation.Finish() end
  Mock.Fire("GOSSIP_CLOSED", false)
  Mock.RunTimers()
end

local function text(ns) return plain(ns.UI.Dialogue.Frame().text:GetText()) or "" end
local function reaction(ns)
  local r = ns.UI.Dialogue.Frame().reaction
  return r:IsShown() and plain(r:GetText()) or ""
end
local function click(ns, needle)
  for i, b in ipairs(ns.UI.Dialogue.Frame().buttons) do
    if b:IsShown() and (plain(b.label:GetText()) or ""):find(needle, 1, true) then ns.UI.Dialogue.Click(i); return true end
  end
  return false
end

describe("Shapes", function()
  it("Shadowform is a shape; stances and stealth are not", function()
    local ns = boot()
    eq(ns.World.FormName(28), "shadow")
    eq(ns.World.FormName(1), "cat")
    eq(ns.World.FormName(17), nil, "battle stance")
    eq(ns.World.FormName(30), nil, "stealth has its own reaction")
    eq(ns.World.FormName(0), nil)
    eq(ns.World.FormName(nil), nil)
  end)

  it("in conversation, taking Shadowform is noticed; leaving it is not", function()
    local ns = boot()
    talk("Archbishop Benedictus", 1284)
    eq(ns.Conversation.session.info.key, "benedictus")
    eq(reaction(ns), "")
    Mock.state.form = 28
    Mock.Fire("UPDATE_SHAPESHIFT_FORM")
    contains(reaction(ns), "studied that")
    ns.UI.Dialogue.Frame().reaction:Hide()
    Mock.state.form = 0
    Mock.Fire("UPDATE_SHAPESHIFT_FORM")
    eq(reaction(ns), "", "stepping out of a shape says nothing")
  end)

  it("a warrior's stance change never sets off a nearby child", function()
    local ns = boot({ class = "Warrior", classFile = "WARRIOR", zone = "Elwynn Forest", subzone = "Goldshire" })
    Mock.state.units.nameplate2 = { guid = "Creature-0-1-0-1-7000-AB", name = "Orphan", level = 1 }
    ns.Barks.CHANCE = 0
    Mock.Fire("NAME_PLATE_UNIT_ADDED", "nameplate2")
    ns.Barks.CHANCE = 0.3
    Mock.chat = {}
    Mock.state.form = 17
    Mock.Fire("UPDATE_SHAPESHIFT_FORM")
    Mock.state.form = 18
    Mock.Fire("UPDATE_SHAPESHIFT_FORM")
    eq(#Mock.chat, 0, "stances are invisible")
  end)

  it("a nearby child sees a priest go dark", function()
    local ns = boot({ zone = "Elwynn Forest", subzone = "Goldshire" })
    Mock.state.units.nameplate2 = { guid = "Creature-0-1-0-1-7000-AB", name = "Orphan", level = 1 }
    ns.Barks.CHANCE = 0
    Mock.Fire("NAME_PLATE_UNIT_ADDED", "nameplate2")
    ns.Barks.CHANCE = 0.3
    Mock.chat = {}
    Mock.state.form = 28
    Mock.Fire("UPDATE_SHAPESHIFT_FORM")
    contains(table.concat(Mock.chat, "\n"), "all dark")
  end)

  it("no zone's beast-shape reaction fires on Shadowform", function()
    local ns = boot()
    local ctx = ns.Context.New({ spoof = { form = "shadow" } })
    for _, pool in pairs(ns.Data.pools or {}) do
      for _, r in ipairs(pool.react or {}) do
        if r.on == "form" then
          ok(r.when and r.when.form, (pool.id or "?") .. "." .. r.id .. " names its forms")
          if r.id ~= "r_shadow" then ok(not ns.Conditions.Eval(r.when, ctx, {}), pool.id .. "." .. r.id .. " stays quiet") end
        end
      end
    end
  end)
end)

describe("The Cathedral, for a priest", function()
  it("Benedictus asks a priest in Shadowform to step out of it", function()
    local ns = boot({ form = 28 })
    talk("Archbishop Benedictus", 1284)
    contains(text(ns), "Step out of the shadow")
  end)

  it("Benedictus tells of the bishop who went too far into shadow", function()
    local ns = boot()
    talk("Archbishop Benedictus", 1284)
    ok(click(ns, "What does the Church make of shadow"))
    ok(click(ns, "Has a priest ever gone too far into it?"))
    contains(text(ns), "A bishop, after the First War")
    ok(click(ns, "Was she wrong?"))
    contains(text(ns), "Count what it costs")
  end)

  it("Laurena won't teach through Shadowform", function()
    local ns = boot({ form = 28 })
    talk("High Priestess Laurena", 376)
    eq(ns.Conversation.session.info.key, "laurena")
    contains(text(ns), "can't call on the Light")
  end)

  it("the shared priest trainer asks what the shadow costs", function()
    local ns = boot({ form = 28, zone = "Elwynn Forest", subzone = "Goldshire" })
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-99001-AB", name = "Brother Test", level = 30, reaction = 5 }
    local info = { pooled = true, role = "trainer", subtitle = "Priest Trainer", communities = {}, name = "Brother Test" }
    local pools = ns.Data.PoolsFor(info, ns.Context.New({ unit = "npc" }))
    local found
    for _, p in ipairs(pools) do if p.pool.id == "trainer_priest" then found = p.pool end end
    ok(found, "the priest trainer pool applies")
    ok(found.nodes.shadow_fear, "with a branch for a priest in Shadowform")
  end)
end)

describe("A first horse at forty", function()
  it("Katie Hunter sells to a human at 40, and asks a younger one to wait", function()
    local ns = boot({ zone = "Elwynn Forest", subzone = "Eastvale Logging Camp" })
    talk("Katie Hunter", 384)
    eq(ns.Conversation.session.info.key, "katie_hunter")
    ok(click(ns, "Show me the horses."), "a human at 40 can buy")
    leave(ns)
    local young = boot({ zone = "Elwynn Forest", subzone = "Eastvale Logging Camp", level = 30 })
    talk("Katie Hunter", 384)
    contains(text(young), "You'll need Randal's lessons first")
    ok(not click(young, "Show me the horses."))
  end)

  it("Randal Hunter has a word for a priest", function()
    local ns = boot({ zone = "Elwynn Forest", subzone = "Eastvale Logging Camp" })
    talk("Randal Hunter", 4732)
    ok(click(ns, "Can a priest ride like a knight?"))
    contains(text(ns), "something left to heal the knights")
  end)
end)


describe("Reputation", function()
  it("an exalted night elf may buy a horse; one who isn't may only pat one", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Elwynn" }, setup = function(state)
      local p = state.units.player
      p.race, p.raceFile, p.level = "Night Elf", "NightElf", 45
      state.zone, state.subzone = "Elwynn Forest", "Eastvale Logging Camp"
    end })
    ns.db.settings.instantText = true
    Mock.Fire("ZONE_CHANGED_NEW_AREA"); Mock.RunTimers()
    local Cond = ns.Conditions
    local want = { reputation = { faction = "Stormwind", min = "exalted" } }
    ok(not Cond.Eval(want, ns.Context.New({}), {}), "unknown standing fails")
    Mock.state.reputation = { [72] = 7 }
    ok(not Cond.Eval(want, ns.Context.New({}), {}), "revered isn't enough")
    Mock.state.reputation = { [72] = 8 }
    ok(Cond.Eval(want, ns.Context.New({}), {}), "exalted")
    ok(Cond.Eval(want, ns.Context.New({ spoof = { reputation = { Stormwind = 8 } } }), {}), "spoofed")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-384-AB", name = "Katie Hunter", level = 30, reaction = 5 }
    local f = _G.GossipFrame or Mock.NewFrame("Frame", "GossipFrame")
    f:Show(); Mock.Fire("GOSSIP_SHOW"); Mock.RunTimers()
    contains(plain(ns.UI.Dialogue.Frame().text:GetText()), "Stormwind trusts you completely")
  end)
end)
