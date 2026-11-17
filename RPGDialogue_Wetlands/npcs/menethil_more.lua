-- Menethil Harbor, the rest of the town: Stoutfist's officer in the keep, a husband waiting on
-- letters from the dig, a man whose brother sailed with Proudmoore, Kalimdor's recruiter, a dwarf
-- who lost her bag to an ooze, the fishing trainer, a stranded minstrel and the horse breeder.
-- Voice: bibles/menethil_more.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "valstag", id = TODO_NPC("Valstag Ironjaw"), name = "Valstag Ironjaw",
  bible = "bibles/menethil_more.md", role = "soldier", tier = "quest",
  communities = { "menethil" }, temper = { "gruff" }, values = { "dutiful", "brave" },
  notices = { "race", "kit" },

  impression = {
    first = "Valstag Ironjaw reads the reports from Dun Algaz in the keep and doesn't like a word of them. He's a soldier's soldier: blunt, tired, and quietly worried about why the Dragonmaw are pushing now.",
    third = "{name} met Valstag Ironjaw, who gathers reports on the Dragonmaw in Menethil Keep for Captain Stoutfist.",
  },

  greetings = {
    { id = "g_default", text = "Report, or move along. The keep's no place for loiterin', an' the roof leaks on loiterers first." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' in one piece. That's more than most o' my reports manage." },
    { id = "g_algaz", when = { questActive = TODO_QUEST("The Algaz Gauntlet") }, text = "Come through Algaz, did ye? Then sit, an' tell me what ye saw, all of it." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' back in one piece. Sit, an' tell me what ye saw on the roads, all of it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown a deal tougher since last ye reported tae me. I'd send ye through Algaz alone now, an' I wouldnae say that lightly." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word reached the keep that ye were caught in a lie in the harbor. I live on reports, so the ones ye give me had best be true." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "I hear ye've been leanin' on the harbor folk. They've the Dragonmaw at the gate already, so they've no need o' more fright from ye." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' the clans, good. Ironforge sends us fewer than we need, so every beard through that door is welcome." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye look like ye came through Algaz on yer face, an' the raptors had a go at what was left. Brahnmar's down by the docks; see him before ye see the Captain." },
  },

  start = "hello",
  nodes = {
    opn_dragonmaw = {
      lines = {
        { id = "opn_dragonmaw_q", text = "Have ye, now? Then ye'd be the third this week, an' the other two were sailors who've never held a pike. Go on, I'll write it down, for the Captain likes tae know what the town's sayin'. March or hold?" },
      },
      choices = {
        { text = "March on Grim Batol. Break them before they rebuild.", next = "opn_dragonmaw_r_march", fx = { affinity = 1, align = { order = -1 }, trait = { brave = 1 }, opinion = { wl_dragonmaw = "march" } } },
        { text = "Hold the walls. The harbour matters more than the hills.", next = "opn_dragonmaw_r_hold", fx = { align = { order = 1 }, trait = { careful = 1 }, opinion = { wl_dragonmaw = "hold" } } },
        { text = "Neither. Send adventurers and save your soldiers.", next = "opn_dragonmaw_r_adventurers", fx = { trait = { practical = 1 }, opinion = { wl_dragonmaw = "adventurers" } } },
        { text = "Never mind, Valstag. I'd rather not be in the report.", next = "BACK" },
      },
    },
    opn_dragonmaw_r = {
      lines = {
        { id = "opn_dragonmaw_r_default", text = "Fair, an' I'll leave ye out, though the Captain'll ask." },
      },
      choices = {
        { text = "Something else, Valstag.", next = "BACK" },
      },
    },
    opn_dragonmaw_r_march = {
      lines = {
        { id = "opn_dragonmaw_r_march", text = "Noted, an' underlined, for ye've the look o' someone who'd go first. I'd march beside ye, off the record, but we'd want three times what we've got." },
      },
      choices = {
        { text = "Something else, Valstag.", next = "BACK" },
      },
    },
    opn_dragonmaw_r_hold = {
      lines = {
        { id = "opn_dragonmaw_r_hold", text = "That's the Captain's own mind most mornings, an' mine on the days I've read the casualty lists. I'll put ye down wi' the sensible ones." },
      },
      choices = {
        { text = "Something else, Valstag.", next = "BACK" },
      },
    },
    opn_dragonmaw_r_adventurers = {
      lines = {
        { id = "opn_dragonmaw_r_adventurers", text = "Ha! That's what we've been doin' all along, only nobody's said it out loud. I'll write it more politely than ye said it." },
      },
      choices = {
        { text = "Something else, Valstag.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd take it, an' I'd mark it 'unconfirmed', same as any scout's rumour. Captain Stoutfist wants facts, an' the earth's no' known for givin' those. But I've had scouts come back wi' less, an' some o' them didnae come back at all." } },
      choices = {
        { text = "Mark it unconfirmed. Facts matter more than feelings.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The earth doesn't lie, Valstag. Trust it over scouts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Aye, if ye can stand the Algaz road. The Dragonmaw come down in packs from the hills, an' a mage who can freeze a pack in the open would save me writin' a good many names on the casualty list." } },
      choices = {
        { text = "Send me to Algaz. I'll meet them in the open.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll strike from the walls. Let them come to me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Ironjaw.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Dragonmaw scouts, an' the raptors that follow them, for the raptors have learned the orcs leave bodies behind. If ye can tell me how many orcs are movin' an' where, I can tell the Captain somethin' other than bad news for once." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} would hear a Dragonmaw patrol long before the road did, an' I'd take its count over half my scouts'." },
      },
      choices = {
        { text = "I'll count them and report, nothing more.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll count them, then thin them out myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "That's no small offer. The Dragonmaw watch the road through Dun Algaz an' they've taken two o' my runners this month, so if ye can get through unseen, ye'll be worth more tae me than a squad." },
      },
      choices = {
        { text = "Your letters will get there unread.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll get through. What's in the letters is worth something too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's happening at Algaz?", next = "algaz" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Do ye now? Then ye know what they did wi' it in the last war, an' ye'll forgive me if I don't care tae hear how ye learned it. Take yer knowledge north an' turn it on them, an' I'll judge ye by where the bodies fall." },
      },
      choices = {
        { text = "I'll use it to end theirs, nothing more.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Their power can serve better hands than theirs.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What should be done about the Dragonmaw?", next = "dragonmaw" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Aye, in the Second War, alongside some o' the night elves' wild friends, though there were few enough o' them then. They fought for the forests while we fought for the hold." } },
      choices = {
        { text = "We fought for the same world, Valstag.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Druids shouldn't be fighting men's wars.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than the Captain admits an' fewer than the sailors say, which puts it somewhere I don't sleep well. Every name comes across my desk, an' I've started keepin' them in a separate book." } },
      choices = {
        { text = "Give me the book, Ironjaw. I'll pray over every name.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Names in a book won't hold the pass, Ironjaw.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Ironjaw.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That they're in the pass in strength, an' they're no' just raidin', they're diggin' in, which orcs don't do without a reason. Somethin' to the east is pushin' them, or pullin' them, an' I'd give a year's pay tae know what." } },
      choices = {
        { text = "Report it all to the Captain. He'll decide.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget orders. I'll scout east and find out myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Ironjaw.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The reports from Algaz come wi' casualty lists, an' I'd be glad o' someone tae read the names over properly." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. If ye're bound for Algaz, the Captain'll want tae shake yer hand first, an' then he'll want tae send ye there." },
        { id = "h_default", key = true,
          text = "Valstag Ironjaw, of the keep. Reports come to me from Algaz an' the hills, an' I pass the bad ones to Captain Stoutfist, which lately is all o' them." },
        { id = "h_algaz_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Algaz Gauntlet"), days = 5 } },
          text = "Yer report's full o' bad news. The Dragonmaw usually keep to the hills, an' now they're surgin' into Algaz, an' nobody here can tell me why." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Captain Stoutfist") },
          text = "The Captain's in the war room, inside the keep. Go on; I've told him ye've already bloodied the Dragonmaw once." },
        { id = "h_spoils", when = { questDone = TODO_QUEST("Spoils of War") },
          text = "Ye saw to that business o' the spoils. The Captain was pleased, an' when he's pleased, I'm allowed to be." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, is it? I've seen yer kind fight in the old days, an' I'll tell ye now, a bear on a battlefield is a sight tae make an orc think twice." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Good; I need eyes on the Algaz road, an' a hunter's eyes are better than most." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. The Captain'll want ye on the wall, an' I'll want ye dryin' my reports, for half o' them are soaked through by the time they get here." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I'll take any report I can get, an' if the earth wants tae tell ye what the Dragonmaw are about at Grim Batol, I'll write it in my book." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, I've three reports an' a cold supper waitin'." },
        { id = "h_again2", text = "Go on. Better ye tell me than the orcs do." },
      },
      choices = {
        { text = "Have you fought beside druids before?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's happening in Dun Algaz?", next = "algaz" },
        { text = "Why does the road matter so much?", next = "road" },
        { text = "Captain Stoutfist seems a hard man to serve.", next = "stoutfist" },
        { text = "How should we deal with the Dragonmaw?", next = "dragonmaw" },
        { text = "I came through Algaz. It's bad.", next = "through", when = { questDone = TODO_QUEST("The Algaz Gauntlet") } },
        { text = "Send me to Algaz, Ironjaw. I'll hold the pass.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "I can carry your reports where the road's cut.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The Dragonmaw are orcs. I know their old magic.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do you need watched on the Algaz road, Ironjaw?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The Dragonmaw must have killed a good many at Algaz, Ironjaw.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do the Algaz reports say about the Dragonmaw, Ironjaw?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could a mage help against the Dragonmaw, Ironjaw?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you take a shaman's report from the earth, Valstag?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    algaz = {
      lines = {
        { id = "a_default", fx = { learn = { "dragonmaw" } },
          text = "The Dragonmaw have pushed out o' their hills an' into the pass, scouts an' grunts both. Normally they skulk up there an' leave Algaz be, so somethin's stirred them, an' that worries me more than the orcs themselves." },
      },
      choices = {
        { text = "Something must have stirred them.", next = "algaz_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    algaz_why = {
      lines = {
        { id = "aw_default", text = "A new chief, a plan, or a fear o' somethin' worse behind them; I've heard all three in this room. The Captain's put his coin on the chief, an' the Captain's usually right." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    road = {
      lines = {
        { id = "r_default", text = "Because if the Dragonmaw hold Algaz, Loch Modan's cut off from this harbour, an' Ironforge's road to the sea goes with it. Everythin' then comes by ship, an' the bay's no friend to ships." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "thandol_span" } } } },
    },

    stoutfist = {
      lines = {
        { id = "s_default", text = "Hard as the walls an' twice as stubborn, an' proud o' the name on the gate. He asked me for soldiers who'll go where they're told, an' I've sent him every one I could find." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    dragonmaw = {
      big = true,
      lines = {
        { id = "d_default", text = "There's two minds on that in this keep. Some say hold the walls an' the pass an' let the hills keep their orcs, an' some say march on the camp an' end it." },
      },
      choices = {
        { text = "Hold the walls. Discipline wins wars.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "March on them. Waiting only feeds them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do you think?", next = "dragonmaw_you" },
      },
    },
    dragonmaw_you = {
      lines = {
        { id = "dy_default", text = "I think I write reports, an' the Captain decides. Off the record, I'd march, but I'd want a lot more than we've got to do it." },
      },
      choices = {
        { text = "March on the Dragonmaw, or hold? I have a view.", next = "opn_dragonmaw" },
        { text = "Something else.", next = "BACK" },
      },
    },

    through = {
      lines = {
        { id = "t_default", text = "I know, I read it twice. Ye've done more against them than half the garrison, so the Captain'll want to see ye, an' I'd go before he asks twice." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { menethil = 1 } } } },
    },
    xwarrior = {
      lines = { { id = "xwa_default", text = "Ye'd hold it an' all, by the look o' ye, but holdin' isn't the problem. We've held Algaz for years; it's the supplies gettin' through to the lads that's killin' us, an' ye can't block a pass wi' a shield an' feed it at the same time." } },
      choices = {
        { text = "Then I'll guard the wagons.", next = "BACK", fx = { affinity = 2 } },
        { text = "Why does the road matter so much?", next = "road" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Everythin' that happens between here an' Loch Modan crosses my table sooner or later. Ask." } },
    background = { { id = "tp_bg", text = "A soldier o' Ironforge who reads reports now, which is harder on the eyes than the axe ever was." } },
    advice = { { id = "tp_ad", text = "Count the orcs before ye fight them, an' count them again after, so the report's right." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "Orcs who lost their dragons an' kept their tempers. They've pushed into Algaz, an' I'd like to know why.", next = "algaz" } },
    _none = { { id = "tp_none", text = "Not in any report o' mine." } },
    grim_batol = { { id = "tp_grim_batol", text = "Every report from the highland mentions Grim Batol sooner or later, an' never wi' good news. The Dragonmaw use it as a den, an' I'd sooner count orcs anywhere else." } },
    magni = { { id = "tp_magni", text = "I send King Magni's officers a report every week, an' I like tae think somebody in the High Seat reads them. Ironforge is a long way off when ye're wet." } },
    stromgarde = { { id = "tp_stromgarde", text = "Stromgarde's remnant at Refuge Pointe sends us news o' the Highlands, an' we send them ours. They're short o' everythin' but courage." } },
    scourge = { { id = "tp_scourge", text = "Reports from across the water say the dead are thick on the Lordaeron shore. I file them under 'pray it stays there'." } },
    second_war = { { id = "tp_second_war", text = "I fought the orcs in the Second War when they came up through these very wetlands, an' I'm still countin' them. The Dragonmaw were the worst o' the lot, an' they're still here." } },
  },
}

P:NPC {
  key = "tarrel", id = TODO_NPC("Tarrel Rockweaver"), name = "Tarrel Rockweaver",
  bible = "bibles/menethil_more.md", role = "citizen", tier = "quest",
  communities = { "menethil" }, temper = { "anxious" }, values = { "loving", "loyal" },
  notices = { "race", "weary" },

  impression = {
    first = "Tarrel Rockweaver waits on the harbour bridge for letters from his wife Merrin at Whelgar's dig, and they have stopped coming. He's trying very hard to be calm and not managing it.",
    third = "{name} met Tarrel Rockweaver, who waits in Menethil Harbor for word from his wife at the Whelgar excavation.",
  },

  greetings = {
    { id = "g_default", text = "Have ye come from the east? Any word from the dig?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Is there any news from the dig? Tell me there's news." },
    { id = "g_active", when = { questActive = TODO_QUEST("In Search of The Excavation Team") }, text = "East to the dig, an' find Merrin. Please, don't stop for anythin'." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ye're one o' us! Have ye come through the dig, by any chance? My wife's there, Merrin Rockweaver." },
    { id = "n_weary", cat = "weary", when = { deathsHere = { min = 1 } },
      text = "Ye've been hurt out there. Is it raptors? Tell me it isn't raptors." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Would ye? I know it's daft. Glorin says I should pray an' wait, an' I've been prayin' an' waitin' till I cannae sleep. If the ground she's walkin' on could tell ye she's still walkin', I'd go on waitin' happy." } },
      choices = {
        { text = "I'll listen, and tell you only what's true.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "She's well, Tarrel. I'm sure of it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd trust anybody who'd go, an' that's the truth of it. The raptors have the road tae Whelgar's dig, an' I've heard yer sort can set things on beasts that'd make even a raptor think twice, so if ye're goin' east, look for her, would ye?" } },
      choices = {
        { text = "I'll find her, Tarrel. You have my word.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm going east for my own reasons. We'll see.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Tarrel.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Raptors, or Mosshide gnolls, or worse, for the letters stopped an' nobody's come back down the road. Merrin's a tough one, but she's a digger, no' a fighter, an' I'd feel a great deal better if someone with an axe went lookin'." } },
      choices = {
        { text = "I'll find her, Tarrel. You have my word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll go, but the dig pays my way, not you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Anythin' o' Merrin's, a glove or a letter or a bootprint, for she always walked the north side o' the road where it's drier. The raptors hunt along it now, an' I cannae bear to think what that means." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Yer {pet} has a good nose, I'd guess, an' Merrin always smells o' pipe smoke an' lamp oil, if that's any help." },
      },
      choices = {
        { text = "I'll find her trail and follow it to the end.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll look, but I won't risk my neck on a hunch.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Can ye? Then go, please, an' look for Merrin; she'll be the one arguin' wi' Whelgar about where tae dig next. An' if she's not there, I'd still rather know than keep waitin'." },
      },
      choices = {
        { text = "I'll find her, Tarrel, and tell you the truth.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If anyone's hurt her, they'll never see me coming.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What is Merrin digging for?", next = "dig" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Burn them, then, every last one, an' I'll not shed a tear. Only mind the diggers, for Merrin'll be in the thick o' it, she always is." },
      },
      choices = {
        { text = "The diggers come first. The raptors can wait.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Every raptor in those hills will burn for this.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What's Merrin like?", next = "merrin" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Aye, if ye would, an' say it loud enough that the raptors hear it too. I've been prayin' myself every night, but I'm a miner, no' a priest, an' I'm no' sure anyone's listenin'." } },
      choices = {
        { text = "Someone's always listening, Tarrel. Keep praying.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't find her. Someone has to go east.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tarrel.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Word, that's all, just word o' who's still standin', an' whether Merrin's among them. I'll no' ask ye tae bring her home by the hand, though I'd no' say no if ye did." } },
      choices = {
        { text = "I'll bring you word, Tarrel, whatever it is.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll go, if the dig pays for the escort.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Tarrel.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Merrin's letters said they kept tae the high ground at first, an' then the diggers turned up some old bones an' the beasts came down tae the camp. I keep tellin' myself it's the noise drawin' them, an' no' the bones." } },
      choices = {
        { text = "Wait for word, as Merrin would want. Patience will be rewarded.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Waiting does nothing. Go to the dig and see for yourself.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Would ye say a word for my Merrin out at the dig? She'd laugh at me for askin', but she's no' here tae laugh." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! If ye're goin' east, Merrin's at Whelgar's dig, an' I'd count it a mercy if ye looked in on her." },
        { id = "h_default", key = true,
          text = "Tarrel Rockweaver. My wife Merrin's with Prospector Whelgar's excavation team, east o' here. She's written every week for a month, an' now it's been near two weeks with nothin'." },
        { id = "h_scout", when = { questBefore = TODO_QUEST("In Search of The Excavation Team") },
          text = "Are ye the scout Longbraid promised? He said he'd send one if we didn't hear from the team soon, an' we haven't, so ye must be." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("In Search of The Excavation Team"), days = 7 } },
          text = "Raptors, an' lives lost, but Merrin lives, an' the Prospector, thanks to that lad Ormer. At least three made it, so I'm thankful an' sick at the same time." },
        { id = "h_unrequited", when = { questDone = TODO_QUEST("Unrequited Love") },
          text = "Ye know more o' my heart's business than most, after that. I'll thank ye to keep it between us an' the bridge." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior? Would ye go east, to Whelgar's dig? I know it's a lot to ask, but I cannae go myself, an' Merrin's out there." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Ye'd know how to read a road, then, an' I need somebody to read the east road for me." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Ye'll know the beasts o' this marsh, then, an' I'd give a lot tae know if the raptors have gone mad or were always like this." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock? I'm a simple weaver, an' I'll no' pretend I understand yer trade, but ye look like ye could walk the east road an' come back." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Ye might be able tae help. My Merrin's at Whelgar's dig, an' she's no' written in near two weeks. Could the earth tell ye if she's well?" },
      },
      again = {
        { id = "h_again", text = "What else? I'm not goin' anywhere till there's a letter." },
        { id = "h_again2", text = "Go on. Talkin' keeps me from countin' the days." },
      },
      choices = {
        { text = "Tell me about Merrin.", next = "merrin" },
        { text = "The excavation must be after something special.", next = "dig" },
        { text = "Did anyone promise to look for them?", next = "longbraid" },
        { text = "You could go yourself.", next = "go" },
        { text = "When will the killing end, do you think?", next = "killing", when = { questDone = TODO_QUEST("In Search of The Excavation Team") } },
        { text = "Dwarves don't leave kin in the marsh, Tarrel.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I can reach the dig without the raptors smelling me.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "If the raptors trouble the dig, they'll burn.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do you fear has happened at the dig, Tarrel?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should I look for on the road east, Tarrel?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Shall I pray for Merrin's safe return, Tarrel?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What should I bring back from the dig, Tarrel?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The raptors seem bolder near Whelgar's dig than they used to be.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you trust a warlock to look for Merrin, Tarrel?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Shall I ask the earth about Merrin, Tarrel?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I hope she writes soon.", next = "END", fx = { affinity = 1 } },
      },
    },

    merrin = {
      lines = {
        { id = "m_default", text = "Clever as a gnome an' stubborn as a mule, an' she writes the best letters in Khaz Modan. Every week, regular as tide; that's why three weeks wi' no letter frightens me so." },
        { id = "m_done", when = { questDone = TODO_QUEST("In Search of The Excavation Team") },
          text = "Trapped on the ridge with the Prospector an' Ormer, but alive. Her letter shook, an' Merrin's hand never shakes." },
      },
      choices = {
        { text = "I'll find her.", next = "BACK", when = { questBefore = TODO_QUEST("In Search of The Excavation Team") }, fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dig = {
      lines = {
        { id = "d_default", fx = { learn = { "explorers_league" } },
          text = "Old things, rare artifacts, an' lately bones, big ones, she said in her last letter. She was excited about the bones; I'm startin' to wish she hadn't been." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    longbraid = {
      lines = {
        { id = "l_default", text = "Longbraid the Grim, the commander up toward the Thandol Span. He promised to send a scout to the dig if word stopped, an' he's a dwarf of his word, grim or not." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "thandol_span" } } } },
    },

    go = {
      lines = {
        { id = "g2_default", text = "I've tried, twice, an' got as far as the fork both times. I'm a weaver, not a fighter, an' Merrin made me promise I'd not do anythin' foolish. Waitin' is the foolish thing I'm allowed." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    killing = {
      big = true,
      lines = {
        { id = "k_default", text = "I long for the day King Magni's people can live without fear, but I don't know if I'll see it. Raptors, orcs, Dark Irons; there's always one more thing in the hills." },
      },
      choices = {
        { text = "That day will come. Keep hoping.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "It won't. Fight for what's yours instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = { { id = "xdw_default", text = "No, we don't, an' it's good to hear it said by somebody who means it. Everyone in the keep tells me to wait, an' waitin's the one thing I was never built for." } },
      choices = {
        { text = "Then I'll go to the dig for you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Waiting's what keeps you alive, Tarrel.", next = "go" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know Merrin's letters by heart, an' a little about the dig. Ask what ye like." } },
    background = { { id = "tp_bg", text = "I'm a weaver, an' Merrin's husband, an' right now mostly the second." } },
    advice = { { id = "tp_ad", text = "Write home often. Somebody's always waitin' on a bridge for it." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "One more reason the letters might not come." } },
    _none = { { id = "tp_none", text = "Sorry, friend, my head's full o' Merrin." } },
    grim_batol = { { id = "tp_grim_batol", text = "Merrin says nobody digs anywhere near Grim Batol, an' for once I'm glad she listens tae someone. I'd no' sleep at all otherwise." } },
    explorers_league = { { id = "tp_explorers_league", text = "The Explorers' League has my wife, my letters an' half my wages in postage. They give back a very fine map now an' then." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire bought a bolt o' my plaid once for their tents, an' I've been tellin' folk about it ever since. Merrin says I've told the story more times than I've woven the cloth." } },
  },
}

P:NPC {
  key = "hyal", id = TODO_NPC("Vincent Hyal"), name = "Vincent Hyal",
  bible = "bibles/menethil_more.md", role = "citizen", tier = "quest",
  communities = { "menethil" }, temper = { "warm" }, values = { "loyal", "proud" },
  notices = { "travel", "hunger" },

  impression = {
    first = "Vincent Hyal sits in the Deepwater Tavern and talks about his brother James, who sailed west with Lady Proudmoore and opened an inn. He's proud of him and hasn't heard from him in a while.",
    third = "{name} met Vincent Hyal, whose brother James sailed to Kalimdor with Jaina Proudmoore's expedition.",
  },

  greetings = {
    { id = "g_default", text = "Pull up a chair, friend, and not that one, the leg's gone. The beer's better than the weather, at least." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Any word from across the sea?" },
  },

  notice = {
    { id = "n_travel", cat = "travel", when = { visited = "Theramore Isle" },
      text = "You've been to Theramore! Did you hear of an inn run by a man named James Hyal? Best cook you'll ever meet." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "He said he saw orcs in the internment camps who'd been shamans once, broken and quiet, and that he felt sorry for them, which was an unpopular thing to say in a Menethil tavern. Then he went west with Lady Proudmoore. I like to think he'd be glad to see a dwarf take up the old ways and use them well." } },
      choices = {
        { text = "Your brother was right. Pity is no weakness.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pity for orcs? They earned those camps.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A little, aye, for Lordaeron fell with a lot of whispering in cellars first, and I watched it happen from this side of the mountains. Still, you're paying for your stew, which is more than some of the soldiers manage." } },
      choices = {
        { text = "I'll never be one of those cultists, Vincent.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. The cult just used it badly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Vincent.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We'd a pickpocket working the tables one winter, and James caught him by the collar and then gave him a job washing mugs. He was the best pot-boy we ever had, and he went west with James, so I suppose I lost two of them that day." } },
      choices = {
        { text = "Your brother did right. Most thieves only need a chance.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A thief belongs in a cell, not a kitchen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Vincent.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not that he wrote, though I'm told there was fighting enough at the start, with the orcs and the demons both. Mostly he writes about the inn, and about how Theramore's walls are higher than Menethil's, which I believe, since ours are mostly mud." } },
      choices = {
        { text = "Walls don't keep a town. The people on them do.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "High walls are fine, but I'd rather have open roads.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "James says the marsh there is worse than ours, with crocolisks the size of rowboats and black dragons in the fens to the south. I think he exaggerates, but then he always did, and I miss it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} would like Dustwallow, I'd wager, if half of what James writes is true." },
      },
      choices = {
        { text = "I'll take his word for it, and believe the best.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sounds like a tall tale to sell more ale.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every night, and I've no idea if I'm doing it right, because James was always the one who knew the words. I just ask that Theramore's walls hold and that he's still cooking." } },
      choices = {
        { text = "Then I'll pray with you, and we'll get the words right.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He chose to leave. He'll manage without your prayers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Vincent.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Once, when the refugees came through with their carts and their dead, but I'm a tavern man, not a soldier. I poured for the ones who did fight, and I've told myself that was my part." } },
      choices = {
        { text = "Pouring for the weary is a duty too, Vincent.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Lordaeron needed every arm. You should have fought.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Vincent.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Tell him I'm well, and that the rain here hasn't stopped since he left, and that he still owes me a cookpot. Tell him to write, too, because if he's alive he's lazy, and I'd rather he was lazy." } },
      choices = {
        { text = "I'll carry your words faithfully, every one of them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll mention it if I pass that way. No promises.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. James used to say grace over every pot he cooked, and I've not heard anyone say it since he sailed." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll have an opinion, I'm sure, on those of us who stayed behind when Lordaeron fell." },
        { id = "h_default", key = true,
          text = "Vincent Hyal. My brother James and I worked a tavern here in Menethil, until he caught the second wind of patriotism and went west with Lady Proudmoore. Half of Lordaeron did, the state it was in." },
        { id = "h_quest", tags = { "news" }, when = { questActive = TODO_QUEST("James Hyal") },
          text = "Somebody's asking after James? That'll be one of the cooks he trained, I'd bet. He's across the sea, setting up an inn, and the clerk in Theramore can point you to him." },
        { id = "h_done", when = { questDone = TODO_QUEST("James Hyal") },
          text = "Did you find James? No, don't tell me if it's long; just tell me he's cooking. He was always happiest cooking." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, eh? James always said he'd have made a fine soldier, though I never saw him lift anything heavier than a keg." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! James used to bring back crocolisk tails for the stew before he left, and I've never found a hunter who did them better." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid from across the sea! You might have heard of Theramore, then, where my brother James keeps an inn." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue, is it? Mind the tables; James used to say the quick-fingered ones always order the cheapest ale and leave with the most." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. James would have muttered a prayer and fetched Brother Glorin, but I've stood behind a bar too long to fuss over who drinks at it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. James would have liked you; he always said the Alliance would only win if it stopped being afraid of new things." },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere to be but here." },
        { id = "h_again2", text = "Go on. The rain's not stopping, so we may as well talk." },
      },
      choices = {
        { text = "Tell me about James.", next = "james" },
        { text = "He must have had his reasons for leaving.", next = "leave" },
        { text = "You could have gone with him.", next = "stay" },
        { text = "Was it right to abandon Lordaeron?", next = "abandon" },
        { text = "Lady Proudmoore was a student of Dalaran, like me.", next = "xmage", when = { class = "MAGE" } },
        { text = "Did your brother fight when he went west with Proudmoore?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What's the hunting like across the sea, by Theramore?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You must pray for James across the sea, Vincent.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did you ever think of taking up arms yourself, Vincent?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is there anything you'd want me to tell James, if I reach Theramore?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Did your tavern get much trouble from my sort, Vincent?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does my trade worry you, Vincent?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Did your brother ever see shamans, Vincent?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck to him.", next = "END" },
      },
    },

    james = {
      lines = {
        { id = "j_default", text = "A damn fine cook, and an innkeeper born. He could feed a table of Kul Tiras marines and send them home happy, and I've seen mages do less with more. He trained half the cooks in Stormwind, it feels like." },
      },
      choices = {
        { text = "Where's his inn?", next = "james_inn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    james_inn = {
      lines = {
        { id = "ji_default", text = "Somewhere on the far continent, near Theramore, I think. Last I heard the fighting had settled over there and he was building. He's too busy to write, I'd wager, doing good business." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    leave = {
      lines = {
        { id = "l_default", text = "Lordaeron was falling to pieces, the dead walking, the king gone. Lady Proudmoore said there was a new land and a new start, and James never could resist a fresh start." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    stay = {
      lines = {
        { id = "s_default", text = "Somebody had to keep the tavern stools warm. And I get seasick, which James found very funny until the day the boat left." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    abandon = {
      big = true,
      lines = {
        { id = "a_default", text = "Abandon? That's a hard word. He didn't run from anything; he went to build something, and if the old kingdom couldn't hold him, I don't blame him." },
      },
      choices = {
        { text = "He did right. A new land needed people.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Lordaeron needed people more. He should have stayed.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Was she? James always wrote that she could freeze the sea itself if she had a mind to, and I took it for a sailor's tale. If you ever cross to Theramore, tell my brother a mage said it was true." } },
      choices = {
        { text = "I'll tell him.", next = "BACK", fx = { affinity = 2 } },
        { text = "Why didn't you go with him?", next = "stay" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know Menethil's tavern stools, and I know my brother. That's most of it." } },
    background = { { id = "tp_bg", text = "I worked a tavern with my brother, and now I mostly sit in one and miss him." } },
    advice = { { id = "tp_ad", text = "If you ever eat at an inn James Hyal runs, order whatever he says." } },
    _none = { { id = "tp_none", text = "Can't say, friend, but ask me about James and I'll talk all night." } },
    theramore = { { id = "tp_theramore", text = "My brother James keeps the inn at Theramore now, and he writes that the marsh is awful and the people are wonderful. I'd go to him if I could stand the boat." } },
    jaina = { { id = "tp_jaina", text = "James says Lady Jaina eats at his inn sometimes and always thanks the cook. That tells you more about a ruler than any speech, I think." } },
    onyxia = { { id = "tp_onyxia", text = "James writes that a black dragon has a lair somewhere in the Dustwallow swamps, and the soldiers won't go near it. I'd have him come home if he'd listen." } },
  },
}

P:NPC {
  key = "red_jack", id = TODO_NPC("Red Jack Flint"), name = "Red Jack Flint",
  bible = "bibles/menethil_more.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "jovial" }, values = { "romantic", "ambitious" },
  notices = { "greenness", "race" },

  impression = {
    first = "Red Jack Flint sells Kalimdor to anyone who stands still long enough, with all the poetry of a sailor who misses the sea. He swears he sees the sea in my future, and probably says it to everyone.",
    third = "{name} met Red Jack Flint, who urges travellers in Menethil to seek their fortunes across the sea in Kalimdor.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a likely soul! Have you ever thought about the sea, friend? Kalimdor's waiting!" },
    { id = "g_back", when = { metBefore = true }, text = "Still on dry land? Shame on you, with Kalimdor just a voyage away!" },
    { id = "g_active", when = { questActive = TODO_QUEST("Fiora Longears") }, text = "Fiora's waiting across the water! Off you go, and give her my love." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I'd hoped you'd finally taken ship for Kalimdor! Still on dry land, friend, or have you a sea tale to tell me?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown into a proper adventurer since you first stood on my dock! Kalimdor could use a soul like you, and so could the sea." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone in the harbor round to your view! You'd make a fine ship's recruiter, friend, and I mean that as high praise." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody on the docks has been singing your praises like a sea shanty! I always said you had the makings of a legend." },
  },

  notice = {
    { id = "n_young", cat = "greenness", when = { maxLevel = 25 },
      text = "You've a fresh face, the kind that ought to see the world before it settles. I like that in a recruit." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "From Kalimdor yourself! Then you know I'm not lying about it, so tell these landlubbers how fine it is." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "In Theramore, certainly, for Lady Proudmoore welcomes anyone useful. In the rest of it, that depends on who's holding the spear. The tauren are said to revere the earth as much as any dwarf, and the night elves have their druids, so you'd have plenty to talk about, if nobody shot you first." } },
      choices = {
        { text = "I'd go as a guest, and earn my welcome.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd go where the earth leads, welcome or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Welcome is a strong word, friend, but Theramore takes all sorts, and I'm told Lady Proudmoore cares more for what you do than where your power comes from. Mind, the night elves at Auberdine remember a war against demons, and they'll not have forgotten it by the time your ship docks." } },
      choices = {
        { text = "Then I'll give the elves no reason to remember.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them remember. Fear keeps people polite.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Jack.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Fighting? Oh, there's fighting to make a bard weep, from the shores of Darkshore to the Ashenvale woods, and a warrior with a strong arm could make a name over there in a season. I'd go myself, but my place is here, telling eager souls like you about it." } },
      choices = {
        { text = "I'll go where I'm needed, not where the songs are.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A name and a fortune? Then sell me the fare.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Why, everything a hunter could dream of, from the nightsabers of Teldrassil to the great bears of Darkshore, and they say the night elves tame the cats as easily as we tame dogs. I've seen none of it myself, mind, but I've talked to sailors who swear by every word." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would have cousins over there, I shouldn't wonder, and bigger ones too." },
      },
      choices = {
        { text = "If I go, I'll respect the night elves' woods.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll go for the pelts, and plenty of them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "A cut! I'm wounded, friend, stabbed right through the purse. The fare's the captain's and the passage is your own affair, and I only point the way to Auberdine and let the land sell itself." },
      },
      choices = {
        { text = "Point the way, then, and I'll pay the captain.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every pitch has an angle. I'd like in on yours.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's dangerous over there?", next = "kalimdor_danger" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Despise is a strong word, but I'd not wave a wand around Auberdine, no. Their old queen and her court tore the world in half with magic, so they say, and the elves have long memories, being as they live forever." },
      },
      choices = {
        { text = "Then I'll respect their ways while I'm there.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Their fear is no reason to hide what I am.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's Kalimdor like?", next = "kalimdor" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Most find work and a roof, friend, and a few write back to tell me they found more than that. The rest I don't hear from, and I tell myself the post is slow." } },
      choices = {
        { text = "Then I'll pray the post is only slow, Jack.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some will fail out there. That's their choice.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Jack.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe as anywhere with a wall, friend, and safer than Lordaeron, which is what most of them are running from. Lady Proudmoore keeps the peace with the orcs, and that's more than anyone ever managed here." } },
      choices = {
        { text = "Proudmoore's peace is worth keeping, Jack.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Peace with orcs? I'd sooner trust my hammer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Jack.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That the trees are taller than Stormwind's cathedral and the moon shines brighter on the far side of the sea, and that every one of them could make a new life there. Half of that's true, and I'd thank you not to tell them which half." } },
      choices = {
        { text = "Tell them the truth. They deserve to know where they're sailing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every sailor stretches a tale. Let them dream a little.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Kalimdor's full of souls in need of comfort, friend, and the night elves have priestesses of their own, if you're curious." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Theramore could use a few of your sort, friend, with Lady Proudmoore holding the line against all comers." },
        { id = "h_default", key = true,
          text = "Red Jack Flint, at your service. It's my job to tell eager souls about Kalimdor, the land of opportunity across the sea, and oh, to be on the sea again myself, with the wind in my face." },
        { id = "h_done", when = { questDone = TODO_QUEST("Fiora Longears") },
          text = "Fiora says you made it across and that you'll do well. Mr. Flint never misjudges a character, she told you, and she's right, I don't." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Kalimdor's crying out for warriors, friend, for there are centaur and quilboar and worse across the sea, and every one of them wants testing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Have I told you about the beasts of Kalimdor, friend? Nightsabers, striders and birds as tall as a man, or so the sailors say." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of Kalimdor! Now here's someone who can tell these landlubbers I'm not exaggerating about the forests over there." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Now there's someone Kalimdor's never seen the like of, for the night elves will either run from you or fill you with arrows, and both would make a fine story." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! You'd love Kalimdor. They say the whole land's alive with spirits, and the orcs over there are thick with your kind. Er, their kind. You know what I mean." },
      },
      again = {
        { id = "h_again", text = "What else? Ask me anything about the sea, or Kalimdor, or both!" },
        { id = "h_again2", text = "Go on, I've stories enough for the whole crossing." },
      },
      choices = {
        { text = "What's in Kalimdor?", next = "kalimdor" },
        { text = "Who meets folk on the other side?", next = "fiora" },
        { text = "Why don't you go to sea yourself?", next = "sea" },
        { text = "Is it right to send folk away from home?", next = "away" },
        { text = "Kalimdor is my home, sailor.", next = "xnightelf", when = { race = "NightElf" } },
        { text = "You sell Kalimdor like a man with a cut of the fare.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is it true the night elves despise magic?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "There can't be much real fighting in Kalimdor.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What beasts would a hunter find in Kalimdor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the folk you send across ever find comfort there?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Theramore must be safe for the folk you send, Jack.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do you tell folk about Kalimdor, Red Jack?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would Kalimdor welcome a warlock, Jack?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would a dwarf shaman be welcome in Kalimdor, Red Jack?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Maybe someday.", next = "END" },
      },
    },

    kalimdor = {
      lines = {
        { id = "k_default", text = "Forests older than kingdoms, deserts, mountains, and towns built by brave folk with their own hands. There's room there, friend, room to make a name, which is more than you'll find in a harbour full of rain." },
      },
      choices = {
        { text = "You haven't mentioned the dangers.", next = "kalimdor_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kalimdor_danger = {
      lines = {
        { id = "kd_default", text = "Oh, plenty, and that's the fun of it! Where there's danger there's work, and where there's work there's coin. I'd not send you anywhere I'd not go myself, if only my knees were younger." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fiora = {
      lines = {
        { id = "f_default", text = "My partner across the water, an elf with an eye for talent and a voice like a summer morning. She'll start you on your Kalimdor adventure; I just point you at the boat." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    sea = {
      lines = {
        { id = "s_default", text = "Because the sea's a jealous mistress, and she's thrown me off more decks than I'll admit. These days I rock in a chair and tell others about her, which is safer and nearly as good." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    away = {
      big = true,
      lines = {
        { id = "a_default", text = "Away? I send them toward something! Though I'll admit, some folk say every strong arm that goes west is one less defending Lordaeron and Khaz Modan." },
      },
      choices = {
        { text = "The young should stay and defend home.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Let them go. Freedom's worth the risk.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnightelf = {
      lines = { { id = "xne_default", text = "Then you've the advantage of me, and I'll stop selling it to you. Tell me true, is there a place on that coast where the trees come right down to the water and the sea turns silver at night, or did some drunk make that up for my benefit?" } },
      choices = {
        { text = "Darkshore. It's real, and it's beautiful.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "A drunk made it up. Stay home.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Kalimdor, the sea, and a few tall tales besides; I know them all. Pick one!" } },
    background = { { id = "tp_bg", text = "A sailor, once, and a recruiter now, which is a sailor with dry boots." } },
    advice = { { id = "tp_ad", text = "Go and see the world before it comes to see you." } },
    _none = { { id = "tp_none", text = "Not a thing, friend, but have I told you about Kalimdor?" } },
    theramore = { { id = "tp_theramore", text = "Theramore is the Alliance's foothold in Kalimdor, built by Lady Jaina's people after the war at Hyjal. Take the boat and see it, friend; it's worth the seasickness." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where I lost my first ship and won my second, both at cards. A sailor should see it once, and leave before the dice come out." } },
    nordrassil = { { id = "tp_nordrassil", text = "The night elves had a tree at Hyjal so tall it touched the clouds, and they broke a demon army at its roots. I've only heard it told by sailors, but every one of them told it the same way." } },
    jaina = { { id = "tp_jaina", text = "Lady Jaina led the survivors of Lordaeron across the sea to Kalimdor and built a city out of a swamp. That's the kind of captain I'd sail for." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's a goblin port on the Barrens coast that sells to anybody, Horde or Alliance, with a smile and a bill. I've docked there twice and kept a hand on my purse both times." } },
  },
}

P:NPC {
  key = "sida", id = TODO_NPC("Sida"), name = "Sida",
  bible = "bibles/menethil_more.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "nervous" }, values = { "stubborn", "practical" },
  notices = { "race", "kit" },

  impression = {
    first = "Sida visits Ironbeard's Tomb every week and won't say why, and an ooze has eaten her bag. She's flustered, sharp-tongued, and plainly hiding something she considers nobody's business.",
    third = "{name} met Sida, a dwarf in Menethil Harbor who lost her bag to an ooze at Ironbeard's Tomb.",
  },

  greetings = {
    { id = "g_default", text = "Oh! Oh, ye're a sturdy-lookin' sort. Ye don't happen to fight oozes, do ye?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Have ye got my bag, or are ye just visitin'?" },
    { id = "g_active", when = { questActive = TODO_QUEST("Digging Through the Ooze") }, text = "Any luck with that ooze? Any of them? They all look the same, I know." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Ye'll understand, then. Some things need visitin', whatever's dripping in the halls." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Light's sake, ye're dripping too. Not ooze, is it? Please say it isn't ooze." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It feels it, though I'm no shaman. The oozes crawl out o' the ground like it's spittin' them up, an' the old stones lean more every visit. My granny said the dead rest easier when the earth's at peace, an' I'd like tae think somebody's lookin' after them." } },
      choices = {
        { text = "I'll look in on the tomb and see the dead rest easy.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead don't care how the earth feels, Sida.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Great drippin' things that came up out o' the ground, an' I dinnae care what they are so long as one o' them gives back my bag. Burn them, freeze them, set a demon on them; I'll no' ask how, so long as ye dinnae ask me what's in it." } },
      choices = {
        { text = "I won't pry, Sida. Your bag's your business.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll get your bag, but I'll look inside it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Sida.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oozes, great drippin' ones, an' they'll swallow anythin' that stands still too long, as my bag can tell ye. Hit them hard an' quick, an' mind yer boots, for whatever they leave behind eats through leather." } },
      choices = {
        { text = "I'll get your bag back and ask no questions.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll get it back, once you tell me what's in it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Do they? Then burn the lot, an' if ye find my bag inside one, try not tae burn that too. There's things in it I'd not get back again for any price." },
      },
      choices = {
        { text = "I'll bring the bag back unopened.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll bring it back, though I'll want a look inside.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's in the bag?", next = "bag" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Quick fingers in an ooze? Ye'd lose them tae the bone, an' it'd serve ye right for tryin'. Kill the thing first an' then go rummagin', an' wash yer hands after." },
      },
      choices = {
        { text = "I'll do it your way, Sida.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll do it my way, and it'll be quicker.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who's buried in the tomb?", next = "tomb_who" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The old words my gran taught me, an' a bit o' news from the harbour, for I reckon the dead get bored. The oozes have made a fair mess o' the place, an' I'd sooner it were tidy for them." } },
      choices = {
        { text = "Then I'll say the old words there too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead don't need news, Sida. Stay safe.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sida.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Aye, if anyone could manage it, but they keep comin' up out o' the bog no matter how many ye squash. I'd settle for my bag back an' a clear path tae the door." } },
      choices = {
        { text = "I'll clear the path to the tomb, Sida.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Find another tomb to visit. That one's lost.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Sida.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Aye, it should, an' gently, for there's folk lyin' there that deserve their rest more than they deserve fire. If ye go in, mind ye don't knock the stones about, or ye'll answer tae me." } },
      choices = {
        { text = "Gently, then. The dead deserve respect from the living.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fire's quickest. The dead won't mind a little smoke.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, is it? Ironbeard's Tomb could do wi' one, for nobody's said a proper word there in years but me." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The oozes out by the tomb are a disgrace tae the dead, an' I'd thank ye tae clear them." },
        { id = "h_default", key = true,
          text = "Sida. I go out to Ironbeard's Tomb every week, an' this time I was set on by great drippin' oozes. I threw my bag at one an' it swallowed the thing whole, an' I need what's in it." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Digging Through the Ooze"), days = 5 } },
          text = "My bag! I'd thought it gone for good. Keep that other bit ye found in it; wash it first, though, an' I mean properly." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, is it? Good, for the oozes out by the tomb don't care how sharp yer tongue is, only how sharp yer axe is." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, is it? Well, don't go sniffin' about after me like a hound, for where I go is my own business." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. If that thing o' yers can eat oozes, I've a job for it, an' if it cannae, keep it away from me." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I go out tae Ironbeard's Tomb every week, an' I'll tell ye, the earth there's no' at rest. Maybe ye can tell me why." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? Quickly, if ye please." },
        { id = "h_again2", text = "Go on, I'm still a bit shaky, so talk slow." },
      },
      choices = {
        { text = "You seem set on visiting Ironbeard's Tomb.", next = "tomb" },
        { text = "What's in the bag?", next = "bag" },
        { text = "Which ooze took it?", next = "ooze" },
        { text = "You must have family here.", next = "family" },
        { text = "My pet could sniff out which ooze took it.", next = "xhunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Oozes burn nicely, if you know the spell.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I could fish your bag out of the ooze. Quick fingers.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What's waiting for me out by Ironbeard's Tomb?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do you say at the tomb, Sida?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the tomb be cleansed of the oozes for good, Sida?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The oozes are spreading through the tomb. Should it be cleansed?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What are those oozes at Ironbeard's Tomb, Sida?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The earth at Ironbeard's Tomb seems restless, Sida.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll keep an eye out.", next = "END" },
      },
    },

    tomb = {
      lines = {
        { id = "t_default", text = "That's my business, thank ye. Northeast o' here, near Dun Modr, an' I'll say no more than that it's a place worth visitin', or was, before the oozes." },
      },
      choices = {
        { text = "Is someone buried there?", next = "tomb_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tomb_who = {
      lines = {
        { id = "tw_default", text = "Dwarves are buried there, as ye'd expect, it bein' a tomb. Now, if ye don't mind, I'd sooner talk about my bag." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    bag = {
      lines = {
        { id = "b_default", text = "Things I need, an' that's all ye need to know. Ye'll see when ye bring it back, I suppose, but I'll thank ye not to look first." },
      },
      choices = {
        { text = "I'll bring it unopened.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ooze = {
      lines = {
        { id = "o_default", text = "I don't know! I panicked an' threw it, an' the ooze just sucked it up, an' then they all looked the same. Ye'll have to check them all, I'm afraid." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    family = {
      big = true,
      lines = {
        { id = "f_default", text = "A husband, Einar, who hunts crocolisks out on the road an' won't set foot in Menethil while I'm here. I'll not say who's in the wrong, but it isn't me." },
      },
      choices = {
        { text = "Talk to him. Forgive, whoever's wrong.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Stand your ground if you're right.", next = "BACK", fx = { align = { light = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xhu_default", text = "Sniff it out? Those oozes smell like a privy in summer, so I'd not wish that on any beast, but I'll thank you for the thought. Just bring the bag back unopened, and don't let {pet} chew on it." } },
      choices = {
        { text = "Unopened. Promise.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "No promises about the opening.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know Ironbeard's Tomb's paths an' the oozes in 'em, now. Ask, if ye must." } },
    background = { { id = "tp_bg", text = "I'm a dwarf with a weekly errand an' a husband who sulks. That's plenty." } },
    advice = { { id = "tp_ad", text = "Don't throw yer bag at an ooze. Throw yer shoe; ye can always get another shoe." } },
    _none = { { id = "tp_none", text = "That's none o' my concern, an' I've concerns enough." } },
    grim_batol = { { id = "tp_grim_batol", text = "My husband's old granda wouldnae even look east toward Grim Batol, an' he sulked about it worse than my husband does. That's sayin' somethin'." } },
    holy_light = { { id = "tp_holy_light", text = "I say a prayer at Ironbeard's Tomb every week for the old fellow, whoever he was. It's only manners, an' the oozes don't seem tae mind." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I went tae the Faire once in Elwynn an' won a hat at their games, an' my husband sulked for a week because I wouldnae let him wear it." } },
  },
}

P:NPC {
  key = "riggs", id = TODO_NPC("Harold Riggs"), name = "Harold Riggs",
  bible = "bibles/menethil_more.md", role = "trainer", tier = "service",
  communities = { "menethil" }, temper = { "jovial" }, values = { "friendly", "patient" },
  notices = { "craft", "class" },

  impression = {
    first = "Harold Riggs teaches fishing in Menethil and talks shop with anyone who'll stand still. He thinks the bay's full of bad luck and good fish in equal measure.",
    third = "{name} met Harold Riggs, who teaches fishing in Menethil Harbor.",
  },

  greetings = {
    { id = "g_default", text = "Come for a lesson? The bay's in a giving mood today, mostly." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Caught anything worth bragging about?" },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "A fisher! Come here and tell me what's biting where you've been. I'll swap you a story for a story." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think it favours the patient ones, and the ones who don't fish near the wrecks. Some of the old sailors leave a coin in the harbour for luck, and I've never had the nerve to tell them a murloc probably eats it. You'd say there's something in the water that notices, I suppose." } },
      choices = {
        { text = "Respect the water, and it'll respect your line.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Luck's for fools. Better bait catches more fish.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd teach a murloc to fish if it sat still long enough, friend, and you're better company than a murloc. Only don't go conjuring anything over the water, for the fish here are skittish enough with the wrecks about." } },
      choices = {
        { text = "I'll learn it properly, with patience and a rod.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I won't wait for fish when I can make them come.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Riggs.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because sieges are long and supply carts are slow, and the bay's full of fish that don't ask to be paid. Half the garrison fish off the wall between watches, and they eat better than the officers." } },
      choices = {
        { text = "I'll learn, then. Patience never hurt a soldier.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather fight than sit holding a rod.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than hunters like to admit, for you've to know where the fish go and when, and the bay has its own seasons like any forest. Mind the crocolisks while you do it, though, for they like a fisherman better than any fish." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would make a fine fishing companion, as long as it doesn't jump in after the catch." },
      },
      choices = {
        { text = "I'll take the patience lesson gladly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I prefer prey that runs. Fish don't give much chase.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Ha! I suppose not, though the fish don't call the watch when you've got them. Patience is patience, whatever you're catching, and most folk haven't got any." },
      },
      choices = {
        { text = "Patience is a virtue. I'll keep it honest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Patience, and a fish that never sees the hook.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's in the wrecks out there?", next = "wrecks" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Conjured bread fills you, I'll grant you, but it's no better than a meal you dreamt. A fresh cod out of Menethil Bay on a hot pan is a thing you remember, and you'd know it if you'd ever tasted one." },
      },
      choices = {
        { text = "There's worth in the old ways. Teach me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Conjured bread does me fine, thanks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's biting this season?", next = "catch" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They ask me where the fish are, which is the same thing to a sailor. I send the worried ones up to Brother Glorin, and the ones who aren't worried I worry about myself." } },
      choices = {
        { text = "Faith keeps a sailor steadier than any charm.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Luck and fish. Sailors need nothing more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Riggs.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I fish the near water and they keep to the wrecks, and that's an arrangement I'd like to keep. Fitzsimmons says they're still on duty out there, and I believe him on the foggy mornings." } },
      choices = {
        { text = "They deserve rest. Someone should go out to them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them keep the wrecks. Fish the near water.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Riggs.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Big grey things nobody's ever landed, that take a line and run straight out to sea before they snap it. The old sailors say they nest in the sunken hulls, and I'd give a year's catch to see one." } },
      choices = {
        { text = "A fisherman should know his waters. Land one someday.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave the deep ones be. Not everything needs catching.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Sit by the water a while; you'll find fishing is a good deal like praying, mostly waiting and hoping." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, eh? Patience is a virtue, they tell me, so you'll make a fine angler if you ever put the hammer down." },
        { id = "h_default", text = "Harold Riggs. I teach fishing, and talk about it, and occasionally catch something. Menethil's a fine harbour for fish, if you can stomach the rain and the wrecks." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want to learn to fish, then, for a soldier who can feed himself is worth two who can't." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Fishing's just hunting with a longer arm and a good deal more waiting." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Tell me, does a druid shaped like a seal count as a fisherman, or is that cheating?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! I once watched a warlock fish with a little imp holding the line, and it caught more than I did, which I'll never forgive." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Can you tell the fish to bite? No, don't answer that; it would ruin the sport." },
      },
      again = {
        { id = "h_again", text = "What else? Nothing's biting, so I've time." },
        { id = "h_again2", text = "Go on, then, I'm all ears." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "What wrecks?", next = "wrecks" },
        { text = "This looks like good fishing water.", next = "catch" },
        { text = "The murlocs must bother you out here.", next = "murlocs" },
        { text = "Patience and a quiet step. Fishing's not so different from my trade.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I can conjure food. Why fish at all?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why would a warrior bother with fishing, Riggs?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Fishing seems a lot like hunting, Riggs.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the sailors ask you for luck before they sail, Riggs?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the drowned sailors in the bay trouble your fishing, Riggs?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What lives deepest in the bay, Riggs?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you teach a warlock to fish, Riggs?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you think the water favours some fishermen, Harold?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good fishing.", next = "END" },
      },
    },

    wrecks = {
      lines = {
        { id = "w_default", fx = { learn = { "third_fleet" } },
          text = "Kul Tiras's Third Fleet, sunk in the bay, and old Fitzsimmons won't stop drinking about it. The fish love a wreck, but there's things on those ships I'd not fish near." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    catch = {
      lines = {
        { id = "c_default", text = "Plenty of good eating fish in the shallows, and crocolisks in the marsh if you're the sort who fishes with an axe. Keep your line out of the wreck water, is all I'll say." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    murlocs = {
      big = true,
      lines = {
        { id = "m_default", text = "Bluegills, raiding the boats and nicking the cargo. Some folk say kill every one, and some say they were here first and we built a harbour on their fishing ground." },
      },
      choices = {
        { text = "The harbour's ours. Drive them off.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They were here first. Find a way to live together.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Fish, bait and the bay's bad luck, that's my trade. What do you want to know?" } },
    background = { { id = "tp_bg", text = "I fish, I teach, and I talk too much; ask anyone." } },
    advice = { { id = "tp_ad", text = "Never fish over a wreck after dark. Just trust me on that." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend, but ask me about fish and I'll never stop." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay holds a fishing contest, I'm told, and the goblins give a prize for the biggest catch. I'd go if I didn't get seasick, and yes, I know, a seasick fisherman, so don't start." } },
    third_fleet = { { id = "tp_third_fleet", text = "I won't fish over the Third Fleet's wrecks, and I tell all my students the same. Something down there bites lines clean through, and it isn't a fish." } },
    theramore = { { id = "tp_theramore", text = "The fish off Theramore are bigger and uglier than ours, they say, and twice as hard to land. I'll take their word for it." } },
  },
}

P:NPC {
  key = "camerick", id = TODO_NPC("Camerick Jongleur"), name = "Camerick Jongleur",
  bible = "bibles/menethil_more.md", role = "citizen", tier = "service",
  communities = { "menethil" }, temper = { "cheerful" }, values = { "romantic", "curious" },
  notices = { "class", "race" },

  impression = {
    first = "Camerick Jongleur is a wandering minstrel who can't wander, because the Wetlands have shut the roads around him. He's making the best of it in Menethil, one rainy song at a time.",
    third = "{name} met Camerick Jongleur, a minstrel stuck in Menethil Harbor while the Wetlands' troubles block the roads.",
  },

  greetings = {
    { id = "g_default", text = "A traveller! Sit, sit, and let me try a new verse on you before I lose my nerve." },
    { id = "g_back", when = { metBefore = true }, text = "My one faithful audience returns! I've a new song since last time, and it rhymes almost everywhere." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Would you know a good hymn? I've a tavern of sailors who need something softer than sea shanties." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "An elf of the night! I've a song about your people, but I've never met one, so I'd love to know how wrong it is." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Something about a dwarf who listened to the mountain when the mountain had given up on being listened to. The Ironforge crowd would want more anvils in it and the Wildhammer crowd would want more thunder, and I'd end up with a song that's mostly noise. That's most songs, mind." } },
      choices = {
        { text = "Put in more anvils. Ironforge is my home.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Put in more thunder. The old ways are mine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I would, but I'd have to make you the villain, I'm afraid, for nobody in a tavern ever sang along to a brave warlock. Unless you went and did something brave, of course, like taking Nek'rosh's head, and then I'd have no choice but to make you the hero." } },
      choices = {
        { text = "Then I'll earn the hero's verse, Camerick.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Villains get the best lines anyway. Keep them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Camerick.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I'd write one about you, if you did something worth singing, like clearing the Dragonmaw out of Algaz so I could finally leave. Songs about holding walls are dull, I'm afraid, but songs about breaking sieges sell very well." } },
      choices = {
        { text = "Sing about the wall. That's where the real work is.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then I'll break the siege, and you can sing it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Well, I'd like to, from a safe distance, because my verse says they're green and the soldiers say they're mottled brown. A song should get the colour right, at least, even if it gets everything else wrong." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} could go in the song too, though I'll warn you, very little rhymes with {pet}." },
      },
      choices = {
        { text = "I'll tell you the truth of it, mottled brown and all.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Make them green and twice as big. Nobody will check.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Oh, the best stories always come with that condition! My voice has cracked twice this week, but my discretion never has, so tell me, and I'll change the names and make you three inches taller." },
      },
      choices = {
        { text = "Tell it true, names aside.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Tell it however earns the most coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What do you sing about, mostly?", next = "subjects" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "There were, and some of them were even flattering! Most of them now are about Antonidas and the day the city fell, and I don't sing those in a harbour full of Lordaeron's refugees unless somebody asks." },
      },
      choices = {
        { text = "Sing them true, even if it hurts.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sing something kinder. The truth can wait.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Is there any truth in your songs?", next = "truth" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'm trying to, but the soldiers want songs about home and the sailors want songs about drinking, and nobody wants songs about Menethil. Still, someone ought to remember who held this harbour." } },
      choices = {
        { text = "Sing it true, Camerick, even if it's grim.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Give them songs of home. The truth can wait.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Camerick.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Precious few, since most of us only met your folk a few years ago, and the old songs mix you up with the high elves. I've half a verse about a moonlit forest across the sea, but I need someone who's seen it to tell me if I'm close." } },
      choices = {
        { text = "Write it true, Camerick. Ask before you rhyme.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Make it grand. Nobody here will know the difference.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Every good ballad has one, and I've never had a real one sit still long enough to tell me how they talk." },
        { id = "h_default", text = "Camerick Jongleur, wandering minstrel, though I've not wandered in a while. Raptors to the east, orcs to the north, Dark Irons on the bridges, so I'm wandering in a very small circle around Menethil." },
        { id = "h_nekrosh", when = { questDone = TODO_QUEST("Defeat Nek'rosh") },
          text = "You're the one who brought down Nek'rosh! Sit still; I'm writing a verse, and I need to know what colour his blood was." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, splendid, because every good song needs a warrior, and I've been stuck here writing songs about rain." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've a whole verse about raptors and I've never seen one up close, which you'll agree is a problem." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You've the look of a song I haven't written yet, and I've had little else to write about lately but rain." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! I've a song about a warlock and his imp, though nothing rhymes with imp but limp and shrimp, so it's mostly about seafood." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I've a song about Wildhammer shamans calling storms over the Hinterlands, but none about a Bronzebeard. Give me a week and I'll write one." },
      },
      again = {
        { id = "h_again", text = "Another question? I've a song for most things, and a joke for the rest." },
        { id = "h_again2", text = "Go on, I'm tuning; it takes a while in this damp." },
      },
      choices = {
        { text = "Play me something.", next = "song" },
        { text = "You seem stuck here in Menethil.", next = "stuck" },
        { text = "What do you sing about here?", next = "subjects" },
        { text = "Should a song tell the truth?", next = "truth" },
        { text = "Here's a hymn you could learn.", next = "hymn", when = { class = "PRIEST" } },
        { text = "I've a story for your songs, if you leave out my name.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I studied at Dalaran. There must be songs about it.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you write a song about a warrior, Camerick?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you need to see a raptor to write about one?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You ought to sing of the soldiers at Menethil, Camerick.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What songs do humans sing about my people, Camerick?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Nobody would write a song about a warlock.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would your song about a Bronzebeard shaman say, Camerick?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Some other time.", next = "END" },
      },
    },

    song = {
      lines = {
        { id = "s_default", text = "'Oh, the rain on the harbour, the rain on the keep, the rain on the captain who never will sleep.' It goes on like that, and so does the rain; it's very popular with the guards." },
      },
      choices = {
        { text = "That's terrible. Play it again.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stuck = {
      lines = {
        { id = "st_default", text = "A minstrel walks alone with a lute, which is a fine way to die in the Wetlands right now. I could take a ship, but a song needs land under it, and Kalimdor's a long way to go for an audience." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } } },
    },

    subjects = {
      lines = {
        { id = "su_default", text = "The drowned fleet, Captain Stoutfist's temper, and old Harlo who rode out of Dun Modr on the last horse. Sailors want sad songs and soldiers want brave ones, so I write sad brave ones and everyone cries." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "third_fleet" } } } },
    },

    truth = {
      big = true,
      lines = {
        { id = "t_default", text = "Ah, the minstrel's question! A true song makes people wiser, and a lovely lie makes them braver, and I've never once decided which this town needs more." },
      },
      choices = {
        { text = "The truth. Always the truth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The lie, if it gets them through the night.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hymn = {
      lines = {
        { id = "h2_default", text = "Would you? Hum it, then, slowly... oh, that's lovely, and it's in a key even sailors can manage. I'll give you the credit, I promise, or at least most of it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A minstrel collects stories, and I've collected Menethil's whole stock by now. Which one?" } },
    background = { { id = "tp_bg", text = "A wandering minstrel who stopped wandering; that's the whole tragedy, in one verse." } },
    advice = { { id = "tp_ad", text = "Always learn one cheerful song. You'll need it more than the sad ones." } },
    _none = { { id = "tp_none", text = "I've no song for that, so I've no idea." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I played a season with the Darkmoon Faire once, and I learned more songs in a month than in ten years on the road. Silas Darkmoon pays well and talks faster than any goblin." } },
    arthas = { { id = "tp_arthas", text = "There's a ballad about Prince Arthas I won't sing anymore, a fine old thing from before he went north. It's hard to sing about a hero when everyone knows the ending." } },
    jaina = { { id = "tp_jaina", text = "Everybody wants a song about Lady Jaina, and I've written three, but none of them is right yet. Nothing decent rhymes with Theramore." } },
    grim_batol = { { id = "tp_grim_batol", text = "There's an old dwarven song about Grim Batol that makes grown dwarves weep, and they'd never let me sing it. I only know the tune, and that's frightening enough." } },
  },
}

P:NPC {
  key = "unger", id = TODO_NPC("Unger Statforth"), name = "Unger Statforth",
  bible = "bibles/menethil_more.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "proud" }, values = { "proud", "careful" },
  notices = { "race", "mount" },

  impression = {
    first = "Unger Statforth breeds horses at Menethil and sells them only to those Stormwind trusts. He talks about his steeds like a proud father and about everyone else like a careful banker.",
    third = "{name} met Unger Statforth, the horse breeder of Menethil Harbor.",
  },

  greetings = {
    { id = "g_default", text = "Have a look, friend. These are the finest steeds you'll find anywhere, and the grey only bites people he likes." },
    { id = "g_back", when = { metBefore = true }, text = "Back to see the horses? They remember you, I think, and they're good judges." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "One of Stormwind's own! Then you may buy, and I'd be glad to see one of mine go to a good home." },
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "A good mount you've got there, though I'd wager mine is better. No offence to the beast." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They seem to like you, which is more than they think of most dwarves. A horse doesn't care about the Light or the elements, only whether your hands are steady and your voice is calm. If the spirits give you both, then I've no quarrel with your spirits." } },
      choices = {
        { text = "Steady hands and a calm voice. That's honest work.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Horses like whoever feeds them. Nothing more to it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Any one of them, if you treat it right, for a horse doesn't care what you study, only how you hold the reins. I've turned away riders who thought a horse was a thing like a cloak or a staff, to be bought and forgotten, and I'd do it again." } },
      choices = {
        { text = "A horse is a companion. I'll treat it as one.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's a mount. I'll feed it and ride it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Unger.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "My horses are bred for the road, friend, but they'll stand their ground if their rider does, and that's all I ask of anyone. Stormwind's knights ride bigger beasts, but none sounder in the leg." } },
      choices = {
        { text = "I'll keep it back from the fighting. Horses aren't soldiers.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll ride into the thick of it and trust the horse.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The best, usually, for you'll feed and water the beast before yourself, and a horse remembers that. I'd sooner sell to a hunter than to a banker, though the bankers do pay faster." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} will have to get used to running beside a horse, mind, which some of them never do." },
      },
      choices = {
        { text = "A beast comes first. I'll care for it well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll feed it, but I'll ride it as hard as I need.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Quiet, is it? Every horse I breed is steady, so it won't startle at a raptor or a thunderclap, but none of them will tiptoe for you. If you need to go unheard, friend, I'd suggest you walk." },
      },
      choices = {
        { text = "Steady and honest, then. That's good enough.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A horse that keeps its mouth shut suits me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who buys from you?", next = "buyers" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "I've heard what you lot ride, with the burning hooves and the eyes like coals, and I'll say only that no horse of mine would stand in a stable beside it. Keep it well away from my paddock if you ever get one." },
      },
      choices = {
        { text = "Fair. I'd not frighten your herd.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Mine will never tire. Yours will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Is the trade fair, though?", next = "fair" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I say a word over every one, though I'm no priest and I don't know the proper words. If you've better ones, I'd be glad to hear them before the next foal comes." } },
      choices = {
        { text = "Every life is worth a blessing, Unger.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A strong foal needs good feed, not words.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Unger.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "My father's stock rode with the Alliance in the last war, and a few came back with scars and better manners than their riders. I breed for nerve now, because a horse that bolts at an orc's shout is worse than no horse at all." } },
      choices = {
        { text = "Nerve comes from training. Discipline makes the warhorse.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nerve comes from spirit. Let them run a little wild.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Unger.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They hate it, every one, because the ground gives under their hooves and the crocolisks wait at every ford. I breed them sure-footed for that reason, though I'd not ask any horse to love this place." } },
      choices = {
        { text = "Breed them for the land they live on. That's wise.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them run wild a season. Instinct teaches better than breeding.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. My horses are calm with your kind about, I find, and so am I." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. A horse in a paladin's hands is a horse well placed, I'd say, and I'd say it to Stormwind too." },
        { id = "h_default", text = "Unger Statforth, horse breeder. Years of careful breeding and plenty of care, and I've the privilege of showing you the results. A horse is a companion for life, friend, so don't choose in a hurry." },
        { id = "h_notrusted", when = { ["not"] = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } } },
          text = "I'm sorry, but I'll only sell to those Stormwind trusts completely. It's nothing against you; these steeds can't fall into an enemy's hands, so earn the kingdom's trust and come back." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! A good horse needs a rider who'll keep his seat when the axes come out, and you look the sort." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, I see. Hunters make careful riders, I find, for you know what an animal's thinking." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Your people ride great cats, I'm told, so I'll not try to sell you a horse unless you ask very nicely." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I'll ask you kindly not to conjure anything near the paddock, for my horses have strong opinions about sudden lights." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Horses, I find, are better judges of character than people. Let's see what mine make of you." },
      },
      again = {
        { id = "h_again", text = "Anything else? Take your time; the horses aren't going anywhere." },
        { id = "h_again2", text = "Go on, ask away." },
      },
      choices = {
        { text = "Show me your horses.", next = "BUSINESS", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } } },
        { text = "You seem very particular about your buyers.", next = "buyers" },
        { text = "The Wetlands can't be kind to horses.", next = "wetlands" },
        { text = "Is it fair, selling only to some?", next = "fair" },
        { text = "A quiet horse is worth more to some of us.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'll have a mount of my own in time, I'm told.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would one of your horses carry a warrior into battle?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters make good horse owners, Unger?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you bless the foals when they're born, Unger?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Have your horses carried knights into battle before, Unger?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your horses don't look fond of the marsh, Unger.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would one of your horses carry a mage, Unger?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do your horses make of a shaman, Unger?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },

    buyers = {
      lines = {
        { id = "b_default", text = "A horse is a weapon, as surely as a sword, and a fast one carries news or raiders. I won't see one of mine under a Syndicate rider or a Dark Iron, so Stormwind's trust is my rule." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    wetlands = {
      lines = {
        { id = "w_default", text = "Badly, if you let them stand in the mud. I keep them on the high ground by the keep, dry and well fed, and I check their hooves twice a day for rot." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fair = {
      big = true,
      lines = {
        { id = "f_default", text = "Fair? It's careful, which isn't always the same thing. I've turned away good folk who'd have treated a horse well, and I lose sleep over a few of them." },
      },
      choices = {
        { text = "Rules keep the Alliance safe. You're right.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Judge the buyer, not the banner.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Horses, breeding and hooves; I know them like my own family. What do you want?" } },
    background = { { id = "tp_bg", text = "I breed horses, and I've spent my life at it, and I don't regret a day." } },
    advice = { { id = "tp_ad", text = "Check your horse's hooves every night in the Wetlands. Mud rots them faster than you'd think." } },
    _none = { { id = "tp_none", text = "Not a horse question, so not my question." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire bought two of my ponies for their children's rides, and I hear they're the most spoiled ponies in the kingdom now. Good for them." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer think horses are slow and gryphons are better, and they're right about the speed. But you can't stable a gryphon in a shed." } },
    stromgarde = { { id = "tp_stromgarde", text = "I bred warhorses for Stromgarde's knights before their kingdom fell to ruin. There's nobody left there to buy them, so I sell to the garrison and to Stormwind." } },
  },
}
