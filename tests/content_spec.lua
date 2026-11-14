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
    eq(ns.Util.Count(ns.Data.npcs), 53)
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

  it("a named NPC with noticing moments of their own doesn't borrow the role pool's", function()
    local ns = bootReal()
    Mock.state.subzone = "Goldshire"
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-99011-AB", name = "Smith Argus", level = 20 }
    Mock.state.tooltip.npc = { { leftText = "Smith Argus" }, { leftText = "<Journeyman Blacksmith>" } }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.key, "argus")
    local cands = ns.Engine.Gather("notice", info, ctx)
    ok(#cands > 0)
    for _, c in ipairs(cands) do eq(c.src, "own") end
    -- A pooled blacksmith still gets the pool's.
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-99012-AB", name = "Some Smith", level = 20 }
    Mock.state.tooltip.npc = { { leftText = "Some Smith" }, { leftText = "<Blacksmithing Supplies>" } }
    ctx = ns.Context.New({ unit = "npc" })
    info = ns.Conversation.Identify("npc", ctx)
    local any = false
    for _, c in ipairs(ns.Engine.Gather("notice", info, ctx)) do if c.src:match("^pool:") then any = true end end
    ok(any or info.role ~= "blacksmith", "pooled NPCs keep pool notices")
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
    ok(ns.Data.threads.westfall_left and #ns.Data.threads.westfall_left.beats == 7)
  end)

  it("Redridge loads in Lakeshire, and Solomon's letters reach the Keep", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Redridge", "RPGDialogue_Stormwind" } })
    ns.db.settings.instantText = true
    Mock.state.zone, Mock.state.subzone = "Redridge Mountains", "Lakeshire"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.redridge" then ok(p.loaded); eq(p.warnings, 0) end
    end
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-99344-AB", name = "Magistrate Solomon", level = 40 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.key, "solomon")
    eq(info.communities[1], "lakeshire")
    local t = ns.Data.threads.solomons_letters
    ok(t and #t.beats == 7)
    -- The Keep's beats wait for the Stormwind pack, which loads in Stormwind.
    eq(ns.Data.npcs.bolvar, nil)
    Mock.state.zone, Mock.state.subzone = "Stormwind City", "Stormwind Keep"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    ok(ns.Data.npcs.bolvar and ns.Data.npcs.katrana)
  end)

  it("Duskwood: the Night Watch are guards of Darkshire, and Smitts remembers Haggard", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Elwynn", "RPGDialogue_Duskwood" } })
    ns.db.settings.instantText = true
    Mock.state.zone, Mock.state.subzone = "Duskwood", "Darkshire"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-99601-AB", name = "Watcher Backus", level = 30 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(info.communities[1], "darkshire")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_darkshire")
    -- Heard Haggard's line in Eastvale, then Smitts picks it up.
    ns.char.heard["haggard.h_raven"] = Mock.state.now
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-99602-AB", name = "Tavernkeep Smitts", level = 30 }
    Mock.NewFrame("Frame", "GossipFrame"):Show()
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
    local s = ns.Conversation.session
    eq(s.info.key, "smitts")
    eq(s.lastLine, "smitts.h_haggard")
  end)

  it("Ironforge loads at the gates in Dun Morogh, and John Turner remembers Stephanie", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Ironforge" } })
    Mock.state.zone, Mock.state.subzone = "Dun Morogh", "Gates of Ironforge"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.ironforge" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Jordan Stilwell").key, "jordan")
    eq(ns.Data.FindNPC(nil, "John Turner").key, "john_turner")
  end)

  it("Wetlands loads in Menethil Harbor; Stoutfist and Fitzsimmons are themselves, the guards are Menethil's", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Wetlands" } })
    Mock.state.zone, Mock.state.subzone = "Wetlands", "Menethil Harbor"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.wetlands" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Captain Stoutfist").key, "stoutfist")
    eq(ns.Data.FindNPC(nil, "First Mate Fitzsimmons").key, "fitzsimmons")
    eq(ns.Data.FindNPC(nil, "Mikhail").key, "mikhail")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-2405-AB", name = "Menethil Guard", level = 40 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_menethil")
  end)

  it("Moonglade loads in Nighthaven; Remulos greets a druid, and the defenders are Nighthaven's guards", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Moonglade" } })
    Mock.state.zone, Mock.state.subzone = "Moonglade", "Nighthaven"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.moonglade" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Keeper Remulos").key, "remulos")
    eq(ns.Data.FindNPC(nil, "Great Bear Spirit").key, "great_bear")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-11822-AB", name = "Nighthaven Defender", level = 55 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_nighthaven")
  end)

  it("Darnassus loads in the Temple of the Moon; Tyrande and Fandral are both there to disagree", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Darnassus" } })
    Mock.state.zone, Mock.state.subzone = "Darnassus", "Temple of the Moon"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.darnassus" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Tyrande Whisperwind").key, "tyrande")
    eq(ns.Data.FindNPC(nil, "Arch Druid Fandral Staghelm").key, "fandral")
  end)

  it("Thunder Bluff loads on Elder Rise; Cairne, Hamuul and Magatha are there", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_ThunderBluff" } })
    Mock.state.zone, Mock.state.subzone = "Thunder Bluff", "Elder Rise"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.thunderbluff" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Cairne Bloodhoof").key, "cairne")
    eq(ns.Data.FindNPC(nil, "Arch Druid Hamuul Runetotem").key, "hamuul")
    eq(ns.Data.FindNPC(nil, "Magatha Grimtotem").key, "magatha")
  end)

  it("The Barrens loads at the Crossroads; Mankrik is there, and the guards are the Crossroads'", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Barrens" } })
    Mock.state.zone, Mock.state.subzone = "The Barrens", "The Crossroads"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.barrens" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Mankrik").key, "mankrik")
    eq(ns.Data.FindNPC(nil, "Thork").key, "thork")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-3501-AB", name = "Horde Guard", level = 55 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_crossroads")
  end)

  it("Ashenvale loads in Astranaar, and holds both Raene and Senani", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Ashenvale" } })
    Mock.state.zone, Mock.state.subzone = "Ashenvale", "Astranaar"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.ashenvale" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Raene Wolfrunner").key, "raene")
    eq(ns.Data.FindNPC(nil, "Senani Thunderheart").key, "senani")
    eq(ns.Data.FindNPC(nil, "Relara Whitemoon").key, "relara")
  end)

  it("Hillsbrad loads in Southshore, with Redpath and Darthalia a valley apart", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Hillsbrad" } })
    Mock.state.zone, Mock.state.subzone = "Hillsbrad Foothills", "Southshore"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.hillsbrad" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Marshal Redpath").key, "redpath")
    eq(ns.Data.FindNPC(nil, "High Executor Darthalia").key, "darthalia")
  end)

  it("Darkshore loads in Auberdine; Thundris and Cerellean are there, and the Sentinels are Auberdine's", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Darkshore" } })
    Mock.state.zone, Mock.state.subzone = "Darkshore", "Auberdine"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.darkshore" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Thundris Windweaver").key, "thundris")
    eq(ns.Data.FindNPC(nil, "Cerellean Whiteclaw").key, "cerellean")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-6087-AB", name = "Auberdine Sentinel", level = 40 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_auberdine")
  end)

  it("Orgrimmar loads in the Valley of Strength; Thrall and Neeru are both in the city", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Orgrimmar" } })
    Mock.state.zone, Mock.state.subzone = "Orgrimmar", "Valley of Strength"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.orgrimmar" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Thrall").key, "thrall")
    eq(ns.Data.FindNPC(nil, "Neeru Fireblade").key, "neeru")
  end)

  it("Undercity loads in the Royal Quarter, with Sylvanas and Varimathras", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Undercity" } })
    Mock.state.zone, Mock.state.subzone = "Undercity", "Royal Quarter"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.undercity" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Lady Sylvanas Windrunner").key, "sylvanas")
    eq(ns.Data.FindNPC(nil, "Varimathras").key, "varimathras")
  end)

  it("Loch Modan loads in Thelsamar; the Mountaineers are Thelsamar's guards", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_LochModan" } })
    Mock.state.zone, Mock.state.subzone = "Loch Modan", "Thelsamar"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.lochmodan" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Mountaineer Kadrell").key, "kadrell")
    eq(ns.Data.FindNPC(nil, "Chief Engineer Hinderweir VII").key, "hinderweir")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-727-AB", name = "Ironforge Mountaineer", level = 30 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_thelsamar")
  end)

  it("Stonetalon loads at Sun Rock Retreat; Maggran and Albagorm are on either side of the ridges", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Stonetalon" } })
    Mock.state.zone, Mock.state.subzone = "Stonetalon Mountains", "Sun Rock Retreat"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.stonetalon" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Maggran Earthbinder").key, "maggran")
    eq(ns.Data.FindNPC(nil, "Keeper Albagorm").key, "albagorm")
  end)

  it("the_circle: a druid hears Dendrite's beat in Moonglade, then the Keeper's", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Moonglade" } })
    ns.db.settings.instantText = true
    Mock.state.units.player.classFile, Mock.state.units.player.class = "DRUID", "Druid"
    Mock.state.units.player.level = 16
    Mock.state.zone, Mock.state.subzone = "Moonglade", "Nighthaven"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    local t = ns.Data.threads.the_circle
    ok(t and #t.beats == 7)
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-11802-AB", name = "Dendrite Starblaze", level = 30 }
    Mock.NewFrame("Frame", "GossipFrame"):Show()
    Mock.Fire("GOSSIP_SHOW")
    Mock.RunTimers()
    ok(ns.char.threads.the_circle and ns.char.threads.the_circle.beats.b1_dendrite, "Dendrite's beat recorded")
    eq(ns.char.threads.the_circle.state, "stirring")
  end)

  it("Stranglethorn loads in Booty Bay; the Baron, Nimboya and Doren are all there, and the Bruisers guard the port", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Stranglethorn" } })
    Mock.state.zone, Mock.state.subzone = "Stranglethorn Vale", "Booty Bay"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.stranglethorn" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Baron Revilgaz").key, "revilgaz")
    eq(ns.Data.FindNPC(nil, "Nimboya").key, "nimboya")
    eq(ns.Data.FindNPC(nil, "Lieutenant Doren").key, "doren")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-4624-AB", name = "Booty Bay Bruiser", level = 57 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_bootybay")
  end)

  it("Thousand Needles loads at Freewind Post; Longhorn and Pozzik are there, and the Braves are Freewind's", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_ThousandNeedles" } })
    Mock.state.zone, Mock.state.subzone = "Thousand Needles", "Freewind Post"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.thousandneedles" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Cliffwatcher Longhorn").key, "longhorn")
    eq(ns.Data.FindNPC(nil, "Pozzik").key, "pozzik")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-9524-AB", name = "Freewind Brave", level = 45 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_freewind")
  end)

  it("Durotar loads in Razor Hill; Gornek and Gadrin are there, the grunts are Razor Hill's, and Vol'jin knows Gadrin", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Durotar", "RPGDialogue_Orgrimmar" } })
    Mock.state.zone, Mock.state.subzone = "Durotar", "Razor Hill"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.durotar" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Gornek").key, "gornek")
    eq(ns.Data.FindNPC(nil, "Master Gadrin").key, "gadrin")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-5953-AB", name = "Razor Hill Grunt", level = 30 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_razorhill")
  end)

  it("Mulgore loads in Bloodhoof Village; Baine and Ayessa are there, and a Brave is Bloodhoof's guard", function()
    local ns = Loader.Boot({ packs = { "RPGDialogue_World", "RPGDialogue_Mulgore" } })
    Mock.state.zone, Mock.state.subzone = "Mulgore", "Bloodhoof Village"
    Mock.Fire("ZONE_CHANGED_NEW_AREA")
    Mock.RunTimers()
    for _, p in ipairs(ns.Packs.List()) do
      if p.id == "rpgd.mulgore" then ok(p.loaded); eq(p.warnings, 0) end
    end
    eq(ns.Data.FindNPC(nil, "Baine Bloodhoof").key, "baine")
    eq(ns.Data.FindNPC(nil, "Ayessa Dawnsinger").key, "ayessa")
    Mock.state.units.npc = { guid = "Creature-0-1-0-1-3222-AB", name = "Brave Wildrunner", level = 30 }
    local ctx = ns.Context.New({ unit = "npc" })
    local info = ns.Conversation.Identify("npc", ctx)
    eq(info.role, "guard")
    eq(ns.Data.PoolsFor(info, ctx)[1].pool.id, "guard_bloodhoof")
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
