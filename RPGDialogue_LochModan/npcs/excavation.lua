-- Ironband's Excavation and the powder road: Magmar Fellhew, who minds the dig's details,
-- and Huldar and Miran, the League's haulers. Voices: bibles/excavation.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Magmar Fellhew: Ironband's second at the excavation, the one who writes things down.
P:NPC {
  key = "lm_fellhew", id = TODO_NPC("Magmar Fellhew"), name = "Magmar Fellhew",
  bible = "bibles/excavation.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "anxious", "precise" }, values = { "dutiful", "practical" },
  notices = { "kit", "craft" },

  impression = {
    first = "Magmar Fellhew keeps the tally at Ironband's dig: every crate, every pick and every trogg sighted, in a hand so small it needs a lamp. He seemed relieved just to have someone to tell it all to.",
    third = "{name} met Magmar Fellhew, who minds the details of Ironband's Excavation and counts troggs the way other dwarves count coin.",
  },

  greetings = {
    { id = "g_default", text = "Mind the rope line, friend, an' mind the cart track besides. I'm Magmar Fellhew, an' if ye're no' carryin' a pick, I'll guess ye've come about the troggs." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! I've added four troggs tae the tally since ye left, an' I'd rather be addin' crates." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, by my count, an' I do count. The dig's no further along, if ye were wonderin', but the troggs are." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown into a proper fighter since last I saw ye, an' I'll write that down too, under assets." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Jern Hornhelm's letters say ye've been a help in Thelsamar. Jern doesnae praise anyone in ink, so that's worth somethin'." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Keep yer voice down, if ye would. The troggs come up more at night, an' I'd like tae hear them before I see them." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Yer gear's in a worse state than our pit props, an' that's sayin' somethin'. There's no smith at the dig, so get back tae Morhan in Thelsamar before it falls off ye." },
    { id = "n_miner", cat = "craft", when = { profession = { name = "Mining", min = 1 } },
      text = "Ye've a miner's hands, I see. Dinnae get ideas about the dig face, mind, for every stone in it's been numbered." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Magmar Fellhew, an' I mind the details at Ironband's Excavation, which these days means writin' down how many troggs came up the shaft an' how many dwarves went down it. The Prospector does the diggin' an' I do the worryin'." },
        { id = "h_exc_active", tags = { "news" }, when = { questActive = TODO_QUEST("Ironband's Excavation") },
          text = "Jern sent ye? Then ye'll want tae know why the dig's slowed, an' I'll tell ye plain: it's the troggs! They've come up out o' the deep cuts like water through a cracked dam, an' we cannae dig past them." },
        { id = "h_exc_done", when = { questRecent = { TODO_QUEST("Ironband's Excavation"), days = 3 } },
          text = "I hope Jern took my letter seriously, for I underlined the word troggs twice an' I dinnae waste ink. Now the Prospector will want hands, if ye've any spare." },
        { id = "h_idols", when = { questActive = TODO_QUEST("Gathering Idols") },
          text = "The carved idols, aye, the Prospector's wantin' them gathered. Handle them like ye'd handle a lit fuse, for I've seen what they do tae a trogg that's near one." },
        { id = "h_shipment_done", tags = { "news" }, when = { questDone = TODO_QUEST("Protecting the Shipment") },
          text = "The powder got through, thanks tae you, an' the Prospector near wept on the barrels. I've written ye intae the tally under the good column, which is a short column these days." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Good, for ye'll understand what we're diggin' for, even when it doesnae look like much. Every cut here could be a page o' our own past." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, eh? Our steam pump's been coughin' since the spring, an' I'd be grateful for a look, though I'll admit I'm no' sure what it's for any more." },
        { id = "h_human", when = { race = "Human" },
          text = "A human, this far up the loch? Ye're welcome, an' if ye've got a strong back, ye're very welcome." },
      },
      again = {
        { id = "h_again", text = "What else? I've a crate count tae finish, but it'll keep a moment longer." },
        { id = "h_again2", text = "Go on, ask away. Talkin' keeps my hands from shakin' when the ground rumbles." },
        { id = "h_again3", text = "Anythin' else, friend? Mind the ledger, for that wet patch is a trogg's footprint an' I've no' had the heart tae wipe it off." },
      },
      choices = {
        { text = "Why has the dig slowed?", next = "troggs" },
        { text = "What are you digging for, anyway?", next = "dig" },
        { text = "What's Prospector Ironband like to work for?", next = "ironband" },
        { text = "Tell me about these carved idols.", next = "idols" },
        { text = "The Dark Irons were behind the missing powder.", next = "powder", when = { questDone = TODO_QUEST("Protecting the Shipment") } },
        { text = "Let me look at that steam pump.", next = "xgnome", when = { race = "Gnome" } },
        { text = "I'll leave you to your tally.", next = "END" },
      },
    },

    troggs = {
      lines = {
        { id = "tr_default", text = "We cut deeper than the old survey said, chasin' a wall o' fitted stone, an' one mornin' the deep shaft was full o' them. They're grey, stinkin', strong as an ox an' near as clever, an' they've been comin' up ever since." },
        { id = "tr_done", when = { questDone = TODO_QUEST("Ironband's Excavation") },
          text = "Ye know the start o' it from my letter. We cut too deep, an' they came boilin' up out o' the dark, an' every week there's more o' them than my tally says there should be." },
      },
      choices = {
        { text = "Where are they coming from?", next = "troggs_where" },
        { text = "How many have you lost?", next = "troggs_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs_where = {
      lines = {
        { id = "tw_default", text = "Down, is all I can tell ye, an' down's a big direction under Khaz Modan. The Prospector thinks there's whole warrens under the hills, an' Captain Rugelfuss has them in the Valley o' Kings too, so it's no' just us they're botherin'." },
      },
      choices = {
        { text = "Did your digging wake them?", next = "troggs_blame" },
        { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },
    troggs_blame = {
      big = true,
      lines = {
        { id = "tb_default", text = "That's the question I write in the margin every night an' scratch out every mornin'. Maybe they were always there an' we opened the door, or maybe we knocked. Either way they're here, an' the dig's half a mile from Thelsamar." },
        { id = "tb_warm", when = { disposition = { min = 65 } },
          text = "Between you an' me, I told the Prospector the fitted wall meant somethin' was sealed behind it, an' he said that's exactly why we should open it. I dinnae blame him, but I wrote down that I'd said it." },
      },
      choices = {
        { text = "Knowledge is worth the risk. Keep digging.", next = "BACK", reply = "That's what Ironband says every mornin', an' I write it down like a good second. I only wish I could make the troggs read it.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Some doors should stay shut. Seal the deep shaft.", next = "BACK", reply = "I've drafted that order three times an' never sent it. Maybe ye're right, an' maybe I'm just too curious tae sign it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },
    troggs_lost = {
      lines = {
        { id = "tl_default", text = "Nobody dead yet, thank the Titans, though Bruk the digger's arm will never sit right an' two o' the lads went home tae Ironforge an' didnae come back. The tally o' dwarves is shorter every month, whatever the troggs do." },
      },
      choices = {
        { text = "I'll thin the troggs out for you.", next = "BACK", fx = { trait = { brave = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dig = {
      lines = {
        { id = "dg_default", text = "We're diggin' ruins, old an' fitted without mortar, wi' carvin' on them that nobody in the League can read yet. The Prospector says they're older than Ironforge, an' I'll say only that they're older than anythin' I've seen." },
      },
      choices = {
        { text = "Older than Ironforge? Who built them?", next = "dig_who" },
        { text = "Is it worth all this trouble?", next = "dig_worth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig_who = {
      lines = {
        { id = "dw_default", text = "That's what the League's here tae find out, an' I'll no' guess in front o' a stranger. The Prospector has his notions an' Ironforge has its own, an' I keep the crates an' let them argue." },
        { id = "dw_league", when = { origin = "dwarf_explorers_league" },
          text = "Ye're League, ye know how it goes: every carvin' starts three arguments in Ironforge an' settles none. The Prospector reckons there's a hand in it older than ours, an' Prospector Stormpike tells him tae bring proof an' no' poetry." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    dig_worth = {
      big = true,
      lines = {
        { id = "dwo_default", text = "Ask me on a quiet day an' I'll say aye, for the past's the only map we've got o' who we are. Ask me after a trogg's had a go at the cookfire an' I'll say I miss my mother's kitchen in the Commons." },
      },
      choices = {
        { text = "Your people's history is worth bleeding for.", next = "BACK", reply = "Ye say that like someone who's never had tae write the letter home. Still, I'll take it, for I believe it too, on the quiet days.", fx = { align = { honor = 1 } } },
        { text = "No ruin is worth a dwarf's life.", next = "BACK", reply = "No, it isnae, an' I'd have said the same last week after the cookfire. The trouble is, nobody asks the ruin.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ironband = {
      lines = {
        { id = "ib_default", text = "Stout an' honest, an' he values results above all else, which is grand when there's results an' less grand when there's troggs. He's no' a shouter, mind, he just goes quiet an' looks at the ledger as if it owed him money." },
      },
      choices = {
        { text = "Does he listen to you?", next = "ironband_listen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ironband_listen = {
      lines = {
        { id = "il_default", text = "He listens tae the numbers, an' I'm the one who writes them, so aye, in a roundabout way. When the powder never came, it was my count that told him it was stolen an' no' lost." },
      },
      choices = {
        { text = "Who did he suspect?", next = "powder_suspect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder_suspect = {
      lines = {
        { id = "ps_default", text = "He suspected kobolds at first, or a broken axle, or Jern's ledgers bein' wrong, which Jern took personally. Nobody thought o' the haulers, for they'd been on the road near a year." },
        { id = "ps_done", when = { questDone = TODO_QUEST("Protecting the Shipment") },
          text = "He suspected kobolds, a broken axle an' Jern's ledgers, but never Saean, an' that's the part that sits worst wi' me, for I wrote his name on every pay slip an' never once looked at him twice." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    idols = {
      lines = {
        { id = "id_default", text = "They're wee stone figures, ugly as sin, turnin' up in the deep cuts just before the troggs came. Put one near a trogg an' it goes wild, foamin' an' howlin', so the Prospector wants every last one o' them out o' their hands." },
      },
      choices = {
        { text = "Are the idols the troggs' own work?", next = "idols_whose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    idols_whose = {
      big = true,
      lines = {
        { id = "iw_default", text = "They're no' fine enough for trogg hands, I'd say, but the troggs treat them like they're holy. I keep one locked in a strongbox for the League tae look at, an' I sleep on the far side o' the tent from it." },
      },
      choices = {
        { text = "Smash them all. Whatever they are, they're dangerous.", next = "BACK", reply = "Smash them, an' we'd never know what they were. I'll keep mine locked away an' let the League decide, thank ye.", fx = { align = { light = 1 } } },
        { text = "Study them. Danger is just knowledge nobody's earned yet.", next = "BACK", reply = "Now that's a line I'll be writin' in my book, wi' yer name beside it. Ironband would like ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    powder = {
      lines = {
        { id = "pw_default", text = "So I've heard, an' I've no' stopped thinkin' on it. Saean carried our powder near a year, an' all that time the Dark Irons knew what we had an' when it was comin'." },
      },
      choices = {
        { text = "What would the Dark Irons want with your dig?", next = "powder_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder_why = {
      lines = {
        { id = "pwy_default", text = "Maybe the dig, maybe just the powder, for there's a dam on this loch an' a deal o' blastin' it would take tae crack it. I'd rather it was the dig, an' I dinnae like that I'd rather that." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    xgnome = {
      lines = {
        { id = "xg_default", text = "Would ye? It's by the spoil heap, the thing wi' the brass belly that hisses. It pumps water out o' the deep cut, or it did, an' now it mostly pumps steam intae Bruk's face." },
      },
      choices = {
        { text = "Sounds like a cracked valve seat. Easy enough.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I'd need to take it apart entirely.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I write down everythin' that happens at this dig, an' a fair bit that happens near it. Ask, an' I'll read ye the relevant page." } },
    background = { { id = "tp_bg", text = "I'm Ironforge born an' Commons raised, an' the League took me on for my handwritin' before it ever let me near a pick." } },
    advice = { { id = "tp_ad", text = "Count everythin' twice, friend. The second count's the one that saves yer life." } },
    troggs = { { id = "tp_troggs", text = "The troggs came up out o' our deep cut, an' I've the tally tae prove it.", next = "troggs" } },
    explorers_league = { { id = "tp_league", text = "The League pays for the dig an' the Prospector runs it. I keep both o' them honest wi' a quill." } },
    dark_iron = { { id = "tp_di", text = "The Dark Irons had a man on our powder road for a year. I'll no' trust a quiet hauler again." } },
    _none = { { id = "tp_none", text = "That's no' in my ledger, friend. Try Jern in Thelsamar, for his ledgers are bigger." } },
  },
}

-- Huldar: the League's senior hauler on the south road round the loch.
P:NPC {
  key = "lm_huldar", id = TODO_NPC("Huldar"), name = "Huldar",
  bible = "bibles/excavation.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "gruff", "steady" }, values = { "loyal", "practical" },
  notices = { "soldier", "kit" },

  impression = {
    first = "Huldar hauls blastpowder for the Explorers' League and sits on the barrels while he talks, which says a lot about his nerves or his sense. He trusted his crew completely, once.",
    third = "{name} met Huldar, a League hauler on the road south of the loch, who learned the hard way who rode beside him.",
  },

  greetings = {
    { id = "g_default", text = "Easy, there! This cart's full o' blastpowder, so if ye're plannin' tae swing anythin', swing it elsewhere." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. Pull up a barrel, but dinnae sit on the one wi' the red mark." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' I've hauled this road six times since, same road an' same carts, wi' one less face." },
    { id = "g_saean", when = { questDone = TODO_QUEST("Protecting the Shipment") }, text = "There's the one who stood wi' us at the ambush. Whatever ye need, friend, Huldar's yer dwarf." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Plate an' a proper weapon! I'll sleep easier tonight if ye're walkin' alongside, an' Miran will too, though he'll no' say it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye're in rags, friend. If the Dark Irons come again, I'd want ye in somethin' better than that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Huldar, hauler for the Explorers' League, an' this here's a cart o' blastpowder bound for Ironband's dig. The south road round the loch is flat an' easy, which is why we take it, an' why someone was waitin' on it." },
        { id = "h_resupply", tags = { "news" }, when = { questActive = TODO_QUEST("Resupplying the Excavation") },
          text = "Jern sent ye after us? Good, for there's been a feelin' on this road all mornin' that I dinnae like, an' Saean, our third hauler, has been lookin' at the hills more than his feet." },
        { id = "h_protect", tags = { "news" }, when = { questActive = TODO_QUEST("Protecting the Shipment") },
          text = "Saean's gone over tae them, the dog! Dark Irons, on our road, an' he knew they'd be here. Stay close an' keep them off the barrels, for one spark an' we're all a crater." },
        { id = "h_protect_done", when = { questRecent = { TODO_QUEST("Protecting the Shipment"), days = 3 } },
          text = "We're still breathin', an' the powder's still dry, an' that's your doin'. I keep turnin' it over, though, for Saean shared my fire near a whole year." },
        { id = "h_protect_later", when = { questLater = { TODO_QUEST("Protecting the Shipment"), days = 7 } },
          text = "Jern hired a new third for the cart, a lad from Kharanos, an' I check his boots for Dark Iron soot every mornin'. He thinks I'm mad, an' maybe I am." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "One o' ours, good. Ye'll know a hauler's no' paid tae fight, but a dwarf fights anyway when the road asks it of him." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A night elf on the loch road? Ye're a long way from yer trees, an' ye're tall enough tae see an ambush comin', so stay near the front." },
      },
      again = {
        { id = "h_again", text = "What else? The mules need a rest anyway, an' so do I." },
        { id = "h_again2", text = "Ask away. Talkin' keeps my eyes off the hills, an' my eyes need the rest." },
      },
      choices = {
        { text = "Tell me about the road to the dig.", next = "road" },
        { text = "What happened with Saean?", next = "saean", when = { questDone = TODO_QUEST("Protecting the Shipment") } },
        { text = "Why does a dig need this much powder?", next = "powder" },
        { text = "Who's Miran?", next = "miran" },
        { text = "How long have you hauled for the League?", next = "self" },
        { text = "I've moved contraband myself. You learn the tricks.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Safe roads, Huldar.", next = "END" },
      },
    },

    road = {
      lines = {
        { id = "rd_default", text = "Out o' Thelsamar, south along the shore past the dam, an' east round the tip o' the loch tae the dig. Two days wi' a full cart, an' every bend o' it's a good place for an ambush, now I think on it." },
      },
      choices = {
        { text = "What's the most dangerous stretch?", next = "road_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_danger = {
      lines = {
        { id = "rdd_default", text = "The bend below the eastern hills, where the troggs come down tae drink an' the scrub grows thick enough tae hide a dozen Dark Irons. That's where they hit us, an' I'll be rememberin' it every time I pass." },
      },
      choices = {
        { text = "Then ride with more guards.", next = "road_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_guards = {
      big = true,
      lines = {
        { id = "rg_default", text = "Wi' whose coin? The League pays for powder an' picks, an' the Mountaineers are spread thin as butter on a miner's bread. I've asked Jern, an' Jern asked Ironforge, an' Ironforge asked us tae be careful." },
      },
      choices = {
        { text = "Ironforge has its reasons. Make do with what you have.", next = "BACK", reply = "Make do, aye, it's what dwarves do best. But make do is how good haulers end up in shallow graves on the south road.", fx = { align = { order = 1 } } },
        { text = "Then arm yourselves and stop waiting for Ironforge.", next = "BACK", reply = "Ha! Now there's a hauler's answer. I've an axe under the seat already, an' I'll find the lads some more.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    saean = {
      lines = {
        { id = "sa_default", text = "Near a year he hauled wi' us, an' never a cross word. He'd sing on the night watch, an' Miran would throw his boot at him, an' we'd laugh. Then he walked us straight intae a Dark Iron knife an' never looked back." },
      },
      choices = {
        { text = "Did you ever suspect him?", next = "saean_suspect" },
        { text = "What should happen to him?", next = "saean_justice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saean_suspect = {
      lines = {
        { id = "ss_default", text = "Once, an' I put it down tae nothin'. He'd go off for water at the same bend every trip, an' come back wi' an empty skin. I thought he was just a dreamer." },
        { id = "ss_warm", when = { disposition = { min = 65 } },
          text = "Aye, once, an' I'll tell ye what I havenae told Jern. He asked me last winter which barrels were the Seaforium an' which the common powder, an' I told him, for I thought he was learnin' the trade." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    saean_justice = {
      big = true,
      lines = {
        { id = "sj_default", text = "That's for the magistrate, they tell me, if anyone ever lays hands on him. I'm only a hauler, but I've had a long road tae think on it." },
      },
      choices = {
        { text = "Bring him before Bluntnose. Let the law decide.", next = "BACK", reply = "Aye, the law, an' I'll stand at the back o' the hall an' watch. It's more than he gave Miran, but it's the right way.", fx = { align = { honor = 1 } } },
        { text = "A traitor doesn't deserve a trial. End him.", next = "BACK", reply = "I've thought it, many a night on that road. But I'm a hauler, no' a hangman, an' I'll leave it tae Bluntnose.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    powder = {
      lines = {
        { id = "pw_default", text = "Rock's hard in these hills, an' the Prospector's chasin' somethin' deep. A pick'll get ye a foot a day, an' a barrel o' this'll get ye a room, if ye pack it right an' stand well back." },
      },
      choices = {
        { text = "Isn't hauling it dangerous?", next = "powder_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder_danger = {
      lines = {
        { id = "pd_default", text = "Only if ye're careless, or unlucky, or someone wants it tae go off. I've hauled powder twenty years an' I've all ten fingers, which in this trade makes me an old master." },
        { id = "pd_mage", when = { class = "MAGE" },
          text = "Only around mages, friend, no offence meant. Keep yer hands in yer sleeves while ye're near the cart, an' we'll get along fine." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    miran = {
      lines = {
        { id = "mi_default", text = "My partner on the cart, an' the best hand wi' a mule in Khaz Modan. He doesnae say much, but he's the one who spotted the Dark Irons first, so I'll forgive him all the sulkin'." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    self = {
      lines = {
        { id = "sf_default", text = "Twenty years for the League, an' ten afore that haulin' ore out o' the mines under Ironforge. I've carried powder tae digs from the Wetlands tae the Badlands, an' this is the first time anyone's tried tae steal it on the road." },
      },
      choices = {
        { text = "Why stay with it after the ambush?", next = "self_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    self_stay = {
      lines = {
        { id = "sst_default", text = "Because the dig still needs powder an' I still know the road. If I stopped every time somethin' went wrong, I'd have stopped twenty years back, an' I'd be a poorer dwarf an' a duller one." },
      },
      choices = {
        { text = "That's a stubborn sort of courage.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Have ye now? Then tell me, how would ye lift a barrel off a movin' cart wi' three dwarves watchin'? I'd like tae know what tae look for." },
      },
      choices = {
        { text = "You'd use the man already on the cart.", next = "BACK", reply = "The man already on the cart. Aye, that's what happened, isn't it, an' I never once looked at him twice. Thank ye, though it stings.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather keep my methods to myself.", next = "BACK", reply = "Keep them, then, an' I'll keep my eyes on ye. A hauler learns tae watch quiet folk the hard way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the road an' the folk on it better than the Mountaineers do. Ask, an' I'll tell ye what I've seen from the cart." } },
    background = { { id = "tp_bg", text = "I've thirty years haulin', ten o' them in the deeps under Ironforge, an' the back tae prove it." } },
    advice = { { id = "tp_ad", text = "Know who's beside ye on the road, friend. I thought I did." } },
    dark_iron = { { id = "tp_di", text = "They were waitin' at the bend below the hills, an' they knew our load. That's all I need tae know about Dark Irons." } },
    explorers_league = { { id = "tp_league", text = "The League pays on time, I'll say that for them, an' it's no' their fault who they hire." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. I know powder an' the road, an' that's about the end o' it." } },
  },
}
