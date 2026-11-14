-- M5: origins, journal, export/import.

local function bootReal(setup)
  local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Elwynn" }, setup = setup })
  ns.db.settings.instantText = true
  ns.db.settings.sounds = false
  return ns
end

describe("Origins", function()
  it("lists origins for race, class and faction, always ending with Other", function()
    local ns = bootReal()
    local list = ns.Origins.ListFor("Human", "WARRIOR")
    eq(list[#list].id, "other")
    local ids = {}
    for _, o in ipairs(list) do ids[o.id] = true end
    ok(ids.human_westfall_farmhand and not ids.human_paladin_squire, "paladin-only origin hidden for warriors")
    ok(ns.Origins.ListFor("Human", "PALADIN")[1] ~= nil)
    local sky = {}
    for _, o in ipairs(ns.Origins.ListFor("Skyborne", "MAGE")) do sky[o.id] = true end
    ok(sky.skyborne_high_order and not sky.skyborne_windshaper, "Alliance player sees the High Order, not the Windshapers")
  end)

  it("choosing applies the nudge and home-town welcome once, and writes the first journal entry", function()
    local ns = bootReal()
    ns.Origins.Choose("human_westfall_farmhand")
    eq(ns.char.origin.id, "human_westfall_farmhand")
    eq(ns.char.traits.stern, 1)
    eq(ns.char.towns.goldshire.value, 10)
    eq(ns.Towns.TierName("goldshire"), "Known")
    contains(ns.char.journal[#ns.char.journal].text, "Westfall")
    ns.Origins.Choose("other")
    ns.Origins.Choose("human_westfall_farmhand")
    eq(ns.char.traits.stern, 1, "no double nudge")
  end)

  it("conversations work with no origin, and origin lines appear with one", function()
    local ns = bootReal()
    local ctx = ns.Context.New({ spoof = {} })
    eq((ns.Conditions.Eval({ origin = "human_westfall_farmhand" }, ctx, { now = 0 })), false)
    ns.Origins.Choose("human_westfall_farmhand")
    eq((ns.Conditions.Eval({ origin = "human_westfall_farmhand" }, ctx, { now = 0 })), true)
    ns.Origins.Choose("other")
    eq((ns.Conditions.Eval({ origin = "other" }, ctx, { now = 0 })), false, "Other unlocks nothing")
  end)
end)

describe("Journal", function()
  it("renders every tab without errors and in the character's words", function()
    local ns = bootReal()
    ns.Effects.Journal({ first = "I met the Marshal.", third = "{name} met the Marshal." }, ns.Context.New({ spoof = {} }), { now = Mock.state.now })
    ns.char.npc.mcbride = { times = 2, affinity = 3, last = Mock.state.now, name = "Marshal McBride", lastLine = "mcbride.h_default" }
    ns.Effects.Apply({ opinion = { defias = "mercy" }, align = { light = 40 }, hear = "defias_common_thieves" }, { now = Mock.state.now, info = { key = "mcbride", communities = { "northshire" } } })
    ns.char.books["The Seven Kingdoms"] = { t = Mock.state.now, n = 1 }
    ns.Trackers.Deed("level:10")
    contains(ns.Journal.Text("chronicle"), "I met the Marshal.")
    contains(ns.Journal.Text("chronicle", "marshal"), "Marshal")
    eq(ns.Journal.Text("chronicle", "zzzz"), ns.L.J_EMPTY)
    contains(ns.Journal.Text("people"), "Marshal McBride")
    contains(ns.Journal.Text("people"), "warm")
    local sheet = ns.Journal.Text("sheet")
    contains(sheet, "Light")
    contains(sheet, "mercy")
    contains(ns.Journal.Text("topics"), "insists")
    contains(ns.Journal.Text("topics"), "The Seven Kingdoms")
    contains(ns.Journal.Text("deeds"), "Reached level 10")
    ns.Journal.Show("sheet")
    ns.Journal.Show("notes")
    ok(ns.Journal.IsShown())
  end)

  it("never shows raw town standing numbers", function()
    local ns = bootReal()
    ns.char.towns.goldshire = { value = 42 }
    local sheet = ns.Journal.Text("sheet")
    contains(sheet, "Goldshire: Liked")
    ok(not sheet:find("42"))
  end)
end)

describe("Export and import", function()
  it("round-trips a character's story", function()
    local ns = bootReal()
    ns.Origins.Choose("human_minor_noble")
    ns.Effects.Apply({ align = { honor = 12 }, opinion = { defias = "hardline" } }, { now = 1, info = { key = "dughan" } })
    ns.char.npc.dughan = { times = 3, affinity = 2, name = "Marshal Dughan" }
    local text = ns.Export.Build()
    ok(text:match("^RPGD1:%d+:"), "header and checksum")
    ns.SavedData.ResetCharacter()
    eq(ns.char.origin, nil)
    local payload, why = ns.Export.Check(text)
    ok(payload, why)
    ns.Export.Apply(payload)
    eq(ns.char.origin.id, "human_minor_noble")
    eq(ns.char.npc.dughan.times, 3)
    eq(ns.char.opinions.defias.stance, "hardline")
    ok(#ns.char._quarantine >= 1, "previous story kept aside")
  end)

  it("refuses damaged, foreign or newer strings without touching data", function()
    local ns = bootReal()
    ns.char.npc.x = { times = 9 }
    local text = ns.Export.Build()
    local damaged = text:sub(1, -6) .. "AAAA="
    eq((ns.Export.Check(damaged)), nil)
    eq((ns.Export.Check("hello")), nil)
    eq((ns.Export.Check("RPGD9:1:abc")), nil)
    local _, why = ns.Export.Check(text:sub(1, #text - 10))
    ok(why ~= nil)
    eq(ns.char.npc.x.times, 9, "untouched")
  end)

  it("the serializer handles strings with any bytes and nested tables", function()
    local ns = bootReal()
    local v = { a = "x:y;{}s5:", [1] = { 2, 3, true, false }, n = -1.5e10, deep = { { { "z" } } } }
    local back = ns.Export.Deserialize(ns.Export.Serialize(v))
    eq(back.a, v.a); eq(back[1][3], true); eq(back.n, v.n); eq(back.deep[1][1][1], "z")
    eq(ns.Export.B64Decode(ns.Export.B64Encode("any\0bytes\255")), "any\0bytes\255")
  end)
end)
