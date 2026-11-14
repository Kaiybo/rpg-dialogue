-- M1: Util, Compat, SavedData, Context, Spoof, Trackers, Capture, Slash.

describe("Util", function()
  local ns = Loader.Boot()
  local U = ns.Util

  it("RNG is deterministic for a seed", function()
    local a, b = U.NewRNG(42), U.NewRNG(42)
    for _ = 1, 50 do eq(a.next(), b.next()) end
    local c = U.NewRNG(43)
    ok(U.NewRNG(42).next() ~= c.next(), "different seeds differ")
  end)

  it("RNG stays in [0,1) and int stays in range", function()
    local r = U.NewRNG(7)
    for _ = 1, 2000 do
      local v = r.next()
      ok(v >= 0 and v < 1)
      local i = r.int(1, 4)
      ok(i >= 1 and i <= 4)
    end
  end)

  it("parses durations", function()
    eq(U.ParseDuration("3d").seconds, 259200)
    eq(U.ParseDuration("12h").seconds, 43200)
    eq(U.ParseDuration("5c").conversations, 5)
    eq(U.ParseDuration("nope"), nil)
  end)

  it("normalizes titles for loose matching", function()
    eq(U.Norm("  Kobold Camp  Cleanup! "), "kobold camp cleanup")
  end)
end)

describe("Compat", function()
  local ns = Loader.Boot()
  local C = ns.Compat

  it("parses NPC IDs from creature GUIDs, including obfuscated ones", function()
    eq(C.NPCID("Creature-0-1234-0-12-197-00004A1B2C"), 197)
    eq(C.NPCID("Creature-0-x9-y-z-6774-qq"), 6774)
    eq(C.NPCID("Player-1-0000AAAA"), nil)
    eq(C.NPCID(nil), nil)
  end)

  it("reports quest states", function()
    Mock.state.questsDone[7] = true
    Mock.state.questLog[15] = { title = "Investigate Echo Ridge" }
    Mock.state.questLog[21] = { title = "Skirmish at Echo Ridge", ready = true }
    eq(C.QuestState(7), "done")
    eq(C.QuestState(15), "active")
    eq(C.QuestState(21), "ready")
    eq(C.QuestState(54), "before")
  end)

  it("treats secret values as unknown", function()
    Mock.state.units.npc = { guid = "SECRET", name = "x" }
    Mock.state.secret["SECRET"] = true
    eq(C.GUID("npc"), nil)
  end)

  it("probe lists present and missing APIs", function()
    local found = {}
    for _, p in ipairs(C.Probe()) do found[p.name] = p.present end
    eq(found["C_GossipInfo.GetOptions"], true)
    eq(found["C_DeathRecap.GetRecapEvents"], false)
  end)

  it("refuses to write globals it doesn't own", function()
    local okWrite = pcall(C.SetGlobal, "SomeoneElsesGlobal", 1)
    eq(okWrite, false)
  end)

  it("maps interaction types by enum name", function()
    eq(C.InteractionName(5), "Merchant")
  end)
end)

describe("SavedData", function()
  it("fills defaults on a fresh install", function()
    local ns = Loader.Boot()
    eq(ns.db.schema, 1)
    eq(ns.db.settings.ackChance, 0.35)
    eq(type(ns.char.npc), "table")
    eq(ns.char.align.light, 0)
  end)

  it("sets damaged values aside instead of wiping them, and says so", function()
    local ns = Loader.Boot({ char = { schema = 1, npc = "broken", align = { light = 12 } } })
    eq(type(ns.char.npc), "table")
    eq(ns.char.align.light, 12, "good data survives")
    eq(ns.char._quarantine[1].value, "broken")
    local said = false
    for _, line in ipairs(Mock.chat) do if line:find("set aside") then said = true end end
    ok(said, "player is told")
  end)

  it("leaves data from a newer schema untouched", function()
    local ns = Loader.Boot({ char = { schema = 99, npc = "whatever" } })
    eq(RPGDialogueCharDB.npc, "whatever", "saved data untouched")
    eq(type(ns.char.npc), "table", "session runs on defaults")
    eq(ns.readOnly, true)
  end)

  it("folds old journal entries into a summary instead of dropping them", function()
    local ns = Loader.Boot()
    local j = {}
    for i = 1, 10 do j[i] = { t = i } end
    ns.SavedData.TrimJournal(j, 5)
    eq(#j, 5)
    eq(j[1].kind, "summary")
    eq(j[1].folded, 6)
    eq(j[5].t, 10)
  end)

  it("trims the seen-lines history oldest first", function()
    local ns = Loader.Boot()
    local seen = {}
    for i = 1, 20 do seen["l" .. i] = { t = i } end
    ns.SavedData.TrimSeen(seen, 15)
    eq(ns.Util.Count(seen), 15)
    eq(seen.l1, nil)
    ok(seen.l20 ~= nil)
  end)
end)

describe("Context", function()
  local ns = Loader.Boot()
  local Ctx = ns.Context

  it("computes level band and time of day", function()
    Mock.state.units.player.level = 27
    Mock.state.hour = 19
    local ctx = Ctx.New({ unit = nil, spoof = {} })
    eq(ctx.band, "Seasoned")
    eq(ctx.tod, "dusk")
  end)

  it("computes relative power buckets", function()
    eq(Ctx.PowerBucket(5, 20, false), "far_below")
    eq(Ctx.PowerBucket(20, 5, false), "far_above")
    eq(Ctx.PowerBucket(10, 10, false), "even")
    eq(Ctx.PowerBucket(10, 10, true), "below", "elite shifts toward the NPC")
    eq(Ctx.PowerBucket(10, -1, false), "far_below", "skull")
    eq(Ctx.PowerBucket(10, nil, false), "even", "no NPC")
  end)

  it("reads the NPC from its unit token", function()
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-197-AB", name = "Marshal McBride", level = 20 }
    local ctx = Ctx.New({ unit = "npc", spoof = {} })
    eq(ctx.npcID, 197)
    eq(ctx.npcName, "Marshal McBride")
  end)

  it("detects debuff types and resurrection sickness", function()
    Mock.state.auras.HARMFUL = { { spellId = 15007, name = "Resurrection Sickness" }, { spellId = 999, name = "Plague", dispelName = "Disease" } }
    local ctx = Ctx.New({ spoof = {} })
    eq(ctx.resSick, true)
    eq(ctx.debuffTypes.Disease, true)
  end)

  it("flags a character far from home and under-leveled", function()
    Mock.state.units.player.raceFile = "Tauren"
    Mock.state.units.player.level = 3
    Mock.state.zone = "Duskwood"
    local ctx = Ctx.New({ spoof = {} })
    eq(ctx.outOfPlace.far, true)
    eq(ctx.outOfPlace.under, true)
  end)

  it("lets spoofed values win, and marks them", function()
    local ctx = Ctx.New({ spoof = { race = "Gnome", class = "PRIEST", level = 8, form = "bear", deaths = 4 } })
    eq(ctx.race, "Gnome")
    eq(ctx.band, "Greenhorn")
    eq(ctx.form, "bear")
    eq(ctx.spoofed.deaths, 4)
    local text = table.concat(Ctx.Describe(ctx), "\n")
    contains(text, "race = Gnome (spoofed)")
  end)

  it("uses fallback holiday dates when the calendar has nothing", function()
    local set = Ctx.FallbackHolidays({ month = 12, day = 25 })
    eq(set.winterveil, true)
    set = Ctx.FallbackHolidays({ month = 1, day = 1 })
    eq(set.winterveil, true, "wraps the new year")
    set = Ctx.FallbackHolidays({ month = 11, day = 13 })
    eq(next(set), nil)
  end)
end)

describe("Spoof", function()
  local ns = Loader.Boot()
  it("parses race, class, numbers, sets and quest states", function()
    local k, v = ns.Spoof.Parse("race=nightelf"); eq(k, "race"); eq(v, "NightElf")
    k, v = ns.Spoof.Parse("race=undead"); eq(v, "Scourge")
    k, v = ns.Spoof.Parse("class=priest"); eq(v, "PRIEST")
    k, v = ns.Spoof.Parse("level=8"); eq(v, 8)
    k, v = ns.Spoof.Parse("debuff=Disease,Curse"); eq(k, "debuffTypes"); eq(v.Curse, true)
    k, v = ns.Spoof.Parse("quest:7=done"); eq(k, "quest"); eq(v[7], "done")
    k, v = ns.Spoof.Parse("zone=Stormwind_City"); eq(v, "Stormwind City")
    eq((ns.Spoof.Parse("nonsense")), nil)
  end)
end)

describe("Trackers", function()
  it("logs turn-ins, deaths with an inferred cause, books, home inn and drunkenness", function()
    local ns = Loader.Boot()
    Mock.Fire("QUEST_TURNED_IN", 7, 170, 25)
    eq(ns.char.quests.turnedIn[7], Mock.state.now)

    Mock.state.units.target = { guid = "Creature-0-1-0-1-448-AA", name = "Hogger", level = 11, classification = "elite", friendly = false }
    Mock.Fire("PLAYER_DEAD")
    eq(ns.char.deathCount, 1)
    eq(ns.char.deaths[1].cause, "elite")
    eq(ns.char.deaths[1].killer.npcID, 448)
    ok(ns.char.deeds.first_death)

    Mock.state.units.target = nil
    Mock.Fire("MIRROR_TIMER_START", "BREATH", 0, 60000, -1, 0, "Breath")
    Mock.Fire("PLAYER_DEAD")
    eq(ns.char.deaths[2].cause, "drowning")

    Mock.state.bookTitle = "The Seven Kingdoms"
    Mock.Fire("ITEM_TEXT_BEGIN")
    eq(ns.char.books["The Seven Kingdoms"].n, 1)

    Mock.state.bind = "Lion's Pride Inn"
    Mock.Fire("CHAT_MSG_SYSTEM", "Lion's Pride Inn is now your home.")
    eq(ns.char.homeInn.name, "Lion's Pride Inn")

    Mock.Fire("CHAT_MSG_SYSTEM", "You feel tipsy.")
    eq(ns.char.drunk, 1)
  end)

  it("infers causes from the killer snapshot", function()
    local ns = Loader.Boot()
    local T = ns.Trackers
    eq(T.InferCause({ name = "Stormwind City Guard", level = 55 }, 20), "guard")
    eq(T.InferCause({ name = "Kobold Vermin", level = 2 }, 30), "trivial")
    eq(T.InferCause({ name = "Someone", isPlayer = true }, 30), "player")
    eq(T.InferCause(nil, 30), "unknown")
  end)
end)

describe("Capture", function()
  it("records NPCs, gossip text and quest text", function()
    local ns = Loader.Boot()
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-197-AB", name = "Marshal McBride", level = 20, reaction = 5 }
    Mock.state.tooltip.npc = { { leftText = "Marshal McBride" }, { leftText = "Level 20" } }
    Mock.state.gossipText = "Greetings."
    Mock.Fire("GOSSIP_SHOW")
    local rec = ns.db.capture.npcs[197]
    eq(rec.name, "Marshal McBride")
    eq(rec.gossip, true)
    eq(ns.db.capture.gossip[197].greetings[1], "Greetings.")

    Mock.state.questFrame = { questID = 7, title = "Kobold Camp Cleanup", text = "desc", objectives = "obj" }
    Mock.Fire("QUEST_DETAIL")
    eq(ns.db.capture.questText[7].giver, 197)
    eq(ns.db.capture.questText[7].objectives, "obj")

    Mock.state.questLog[7] = { title = "Kobold Camp Cleanup" }
    Mock.Fire("QUEST_ACCEPTED", 7)
    eq(ns.db.capture.quests[7].title, "Kobold Camp Cleanup")
    eq(ns.Capture.QuestIDByTitle("kobold camp cleanup"), 7)
    -- the lowest level it was taken at, and by which faction (for the simulation)
    eq(ns.db.capture.quests[7].minLevel, 5)
    eq(ns.db.capture.quests[7].factions.Alliance, true)
    Mock.state.units.player.level = 9
    Mock.Fire("QUEST_ACCEPTED", 7)
    eq(ns.db.capture.quests[7].minLevel, 5)
  end)

  it("lists the zone's NPCs that have no content yet", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_TestPack" } })
    ns.db.capture.npcs[197] = { name = "Marshal McBride", zone = "Elwynn Forest", gossip = true, reaction = 5, n = 3 }
    ns.db.capture.npcs[555] = { name = "Nobody Yet", zone = "Elwynn Forest", subzone = "Goldshire", gossip = true, reaction = 5, n = 7 }
    ns.db.capture.npcs[556] = { name = "Kobold Vermin", zone = "Elwynn Forest", reaction = 2 }
    ns.db.capture.npcs[557] = { name = "Elsewhere", zone = "Westfall", gossip = true, reaction = 5 }
    ns.db.capture.quests[8] = { title = "Q", zone = "Elwynn Forest" }
    Mock.chat = {}
    ns.Slash.Handle("capture zone")
    local text = table.concat(Mock.chat, "\n")
    ok(text:find("2 friendly NPCs captured %(1 have content%), 1 quests captured"), text)
    ok(text:find("no content yet: Nobody Yet %(Goldshire%), talked to 7"), text)
    ok(not text:find("Elsewhere"), text)
  end)
end)

describe("Slash", function()
  it("dispatches commands and reports unknown ones", function()
    local ns = Loader.Boot()
    ns.Slash.Handle("dev on")
    eq(ns.db.settings.dev, true)
    ns.Slash.Handle("dump ctx")
    ns.Slash.Handle("probe")
    ns.Slash.Handle("bogus")
    contains(Mock.chat[#Mock.chat], "Unknown command")
    ok(SlashCmdList.RPGD ~= nil)
    eq(SLASH_RPGD1, "/rpgd")
  end)
end)
