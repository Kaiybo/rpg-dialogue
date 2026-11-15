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
    { id = "g_default", text = "Report, or move along. The keep's no place for loiterin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' in one piece. That's more than most o' my reports manage." },
    { id = "g_algaz", when = { questActive = TODO_QUEST("The Algaz Gauntlet") }, text = "Come through Algaz, did ye? Then sit, an' tell me what ye saw, all of it." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' the clans, good. Ironforge sends us fewer than we need, so every beard through that door is welcome." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye look like ye came through Algaz the hard way. Brahnmar's down by the docks; see him before ye see the Captain." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Valstag Ironjaw, of the keep. Reports come to me from Algaz an' the hills, an' I pass the bad ones to Captain Stoutfist, which lately is all o' them." },
        { id = "h_algaz_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Algaz Gauntlet"), days = 5 } },
          text = "Yer report's full o' bad news. The Dragonmaw usually keep to the hills, an' now they're surgin' into Algaz, an' nobody here can tell me why." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Captain Stoutfist") },
          text = "The Captain's in the war room, inside the keep. Go on; I've told him ye've already bloodied the Dragonmaw once." },
        { id = "h_spoils", when = { questDone = TODO_QUEST("Spoils of War") },
          text = "Ye saw to that business o' the spoils. The Captain was pleased, an' when he's pleased, I'm allowed to be." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, I've three reports an' a cold supper waitin'." },
        { id = "h_again2", text = "Go on. Better ye tell me than the orcs do." },
      },
      choices = {
        { text = "What's happening in Dun Algaz?", next = "algaz" },
        { text = "Why does the road matter so much?", next = "road" },
        { text = "What's Captain Stoutfist like?", next = "stoutfist" },
        { text = "How should we deal with the Dragonmaw?", next = "dragonmaw" },
        { text = "I came through Algaz. It's bad.", next = "through", when = { questDone = TODO_QUEST("The Algaz Gauntlet") } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    algaz = {
      lines = {
        { id = "a_default", fx = { learn = { "dragonmaw" } },
          text = "The Dragonmaw have pushed out o' their hills an' into the pass, scouts an' grunts both. Normally they skulk up there an' leave Algaz be, so somethin's stirred them, an' that worries me more than the orcs themselves." },
      },
      choices = {
        { text = "What could have stirred them?", next = "algaz_why" },
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
      choices = { { text = "Something else.", next = "BACK" } },
    },

    through = {
      lines = {
        { id = "t_default", text = "I know, I read it twice. Ye've done more against them than half the garrison, so the Captain'll want to see ye, an' I'd go before he asks twice." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { menethil = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Everythin' that happens between here an' Loch Modan crosses my table sooner or later. Ask." } },
    background = { { id = "tp_bg", text = "A soldier o' Ironforge who reads reports now, which is harder on the eyes than the axe ever was." } },
    advice = { { id = "tp_ad", text = "Count the orcs before ye fight them, an' count them again after, so the report's right." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "Orcs who lost their dragons an' kept their tempers. They've pushed into Algaz, an' I'd like to know why.", next = "algaz" } },
    _none = { { id = "tp_none", text = "Not in any report o' mine." } },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tarrel Rockweaver. My wife Merrin's with Prospector Whelgar's excavation team, east o' here. She's written every week for a month, an' now it's been near two weeks with nothin'." },
        { id = "h_scout", when = { questBefore = TODO_QUEST("In Search of The Excavation Team") },
          text = "Are ye the scout Longbraid promised? He said he'd send one if we didn't hear from the team soon, an' we haven't, so ye must be." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("In Search of The Excavation Team"), days = 7 } },
          text = "Raptors, an' lives lost, but Merrin lives, an' the Prospector, thanks to that lad Ormer. At least three made it, so I'm thankful an' sick at the same time." },
        { id = "h_unrequited", when = { questDone = TODO_QUEST("Unrequited Love") },
          text = "Ye know more o' my heart's business than most, after that. I'll thank ye to keep it between us an' the bridge." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not goin' anywhere till there's a letter." },
        { id = "h_again2", text = "Go on. Talkin' keeps me from countin' the days." },
      },
      choices = {
        { text = "Tell me about Merrin.", next = "merrin" },
        { text = "What's the excavation looking for?", next = "dig" },
        { text = "Who's Longbraid?", next = "longbraid" },
        { text = "Why not go yourself?", next = "go" },
        { text = "When will the killing end, do you think?", next = "killing", when = { questDone = TODO_QUEST("In Search of The Excavation Team") } },
        { text = "I hope she writes soon.", next = "END", fx = { affinity = 1 } },
      },
    },

    merrin = {
      lines = {
        { id = "m_default", text = "Clever as a gnome an' stubborn as a mule, an' she writes the best letters in Khaz Modan. Every week, regular as tide; that's why the quiet frightens me so." },
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
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know Merrin's letters by heart, an' a little about the dig. Ask what ye like." } },
    background = { { id = "tp_bg", text = "I'm a weaver, an' Merrin's husband, an' right now mostly the second." } },
    advice = { { id = "tp_ad", text = "Write home often. Somebody's always waitin' on a bridge for it." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "One more reason the letters might not come." } },
    _none = { { id = "tp_none", text = "Sorry, friend, my head's full o' Merrin." } },
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
    { id = "g_default", text = "Pull up a chair, friend. The beer's better than the weather, at least." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Any word from across the sea?" },
  },

  notice = {
    { id = "n_travel", cat = "travel", when = { visited = "Theramore Isle" },
      text = "You've been to Theramore! Did you hear of an inn run by a man named James Hyal? Best cook you'll ever meet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Vincent Hyal. My brother James and I worked a tavern here in Menethil, until he caught the second wind of patriotism and went west with Lady Proudmoore. Half of Lordaeron did, the state it was in." },
        { id = "h_quest", tags = { "news" }, when = { questActive = TODO_QUEST("James Hyal") },
          text = "Somebody's asking after James? That'll be one of the cooks he trained, I'd bet. He's across the sea, setting up an inn, and the clerk in Theramore can point you to him." },
        { id = "h_done", when = { questDone = TODO_QUEST("James Hyal") },
          text = "Did you find James? No, don't tell me if it's long; just tell me he's cooking. He was always happiest cooking." },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere to be but here." },
        { id = "h_again2", text = "Go on. The rain's not stopping, so we may as well talk." },
      },
      choices = {
        { text = "Tell me about James.", next = "james" },
        { text = "Why did he leave?", next = "leave" },
        { text = "Why didn't you go with him?", next = "stay" },
        { text = "Was it right to abandon Lordaeron?", next = "abandon" },
        { text = "Good luck to him.", next = "END" },
      },
    },

    james = {
      lines = {
        { id = "j_default", text = "A damn fine cook, and an innkeeper born. He could feed a table of Kul Tiras marines and send them home happy, which is a kind of magic. He trained half the cooks in Stormwind, it feels like." },
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
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know Menethil's tavern stools, and I know my brother. That's most of it." } },
    background = { { id = "tp_bg", text = "I worked a tavern with my brother, and now I mostly sit in one and miss him." } },
    advice = { { id = "tp_ad", text = "If you ever eat at an inn James Hyal runs, order whatever he says." } },
    _none = { { id = "tp_none", text = "Can't say, friend, but ask me about James and I'll talk all night." } },
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
  },

  notice = {
    { id = "n_young", cat = "greenness", when = { maxLevel = 25 },
      text = "You've a fresh face, the kind that ought to see the world before it settles. I like that in a recruit." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "From Kalimdor yourself! Then you know I'm not lying about it, so tell these landlubbers how fine it is." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Red Jack Flint, at your service. It's my job to tell eager souls about Kalimdor, the land of opportunity across the sea, and oh, to be on the sea again myself, with the wind in my face." },
        { id = "h_done", when = { questDone = TODO_QUEST("Fiora Longears") },
          text = "Fiora says you made it across and that you'll do well. Mr. Flint never misjudges a character, she told you, and she's right, I don't." },
      },
      again = {
        { id = "h_again", text = "What else? Ask me anything about the sea, or Kalimdor, or both!" },
        { id = "h_again2", text = "Go on, I've stories enough for the whole crossing." },
      },
      choices = {
        { text = "What's in Kalimdor?", next = "kalimdor" },
        { text = "Who's Fiora Longears?", next = "fiora" },
        { text = "Why don't you go to sea yourself?", next = "sea" },
        { text = "Is it right to send folk away from home?", next = "away" },
        { text = "Maybe someday.", next = "END" },
      },
    },

    kalimdor = {
      lines = {
        { id = "k_default", text = "Forests older than kingdoms, deserts, mountains, and towns built by brave folk with their own hands. There's room there, friend, room to make a name, which is more than you'll find in a harbour full of rain." },
      },
      choices = {
        { text = "What about the dangers?", next = "kalimdor_danger" },
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
  },

  topics = {
    knows = { { id = "tp_knows", text = "Kalimdor, the sea, and a few tall tales besides; I know them all. Pick one!" } },
    background = { { id = "tp_bg", text = "A sailor, once, and a recruiter now, which is a sailor with dry boots." } },
    advice = { { id = "tp_ad", text = "Go and see the world before it comes to see you." } },
    _none = { { id = "tp_none", text = "Not a thing, friend, but have I told you about Kalimdor?" } },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sida. I go out to Ironbeard's Tomb every week, an' this time I was set on by great drippin' oozes. I threw my bag at one an' it swallowed the thing whole, an' I need what's in it." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Digging Through the Ooze"), days = 5 } },
          text = "My bag! I'd thought it gone for good. Keep that other bit ye found in it; wash it first, though, an' I mean properly." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? Quickly, if ye please." },
        { id = "h_again2", text = "Go on, I'm still a bit shaky, so talk slow." },
      },
      choices = {
        { text = "Why visit Ironbeard's Tomb?", next = "tomb" },
        { text = "What's in the bag?", next = "bag" },
        { text = "Which ooze took it?", next = "ooze" },
        { text = "Do you have family here?", next = "family" },
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
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know Ironbeard's Tomb's paths an' the oozes in 'em, now. Ask, if ye must." } },
    background = { { id = "tp_bg", text = "I'm a dwarf with a weekly errand an' a husband who sulks. That's plenty." } },
    advice = { { id = "tp_ad", text = "Don't throw yer bag at an ooze. Throw yer shoe; ye can always get another shoe." } },
    _none = { { id = "tp_none", text = "That's none o' my concern, an' I've concerns enough." } },
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
    hello = {
      lines = {
        { id = "h_default", text = "Harold Riggs. I teach fishing, and talk about it, and occasionally catch something. Menethil's a fine harbour for fish, if you can stomach the rain and the wrecks." },
      },
      again = {
        { id = "h_again", text = "What else? Nothing's biting, so I've time." },
        { id = "h_again2", text = "Go on, then, I'm all ears." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "What wrecks?", next = "wrecks" },
        { text = "What's good to catch here?", next = "catch" },
        { text = "Do the murlocs bother you?", next = "murlocs" },
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
    hello = {
      lines = {
        { id = "h_default", text = "Camerick Jongleur, wandering minstrel, though I've not wandered in a while. Raptors to the east, orcs to the north, Dark Irons on the bridges, so I'm wandering in a very small circle around Menethil." },
        { id = "h_nekrosh", when = { questDone = TODO_QUEST("Defeat Nek'rosh") },
          text = "You're the one who brought down Nek'rosh! Sit still; I'm writing a verse, and I need to know what colour his blood was." },
      },
      again = {
        { id = "h_again", text = "Another question? I've a song for most things, and a joke for the rest." },
        { id = "h_again2", text = "Go on, I'm tuning; it takes a while in this damp." },
      },
      choices = {
        { text = "Play me something.", next = "song" },
        { text = "Why can't you leave?", next = "stuck" },
        { text = "What do you sing about here?", next = "subjects" },
        { text = "Should a song tell the truth?", next = "truth" },
        { text = "Here's a hymn you could learn.", next = "hymn", when = { class = "PRIEST" } },
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
    { id = "g_default", text = "Have a look, friend. These are the finest steeds you'll find anywhere, and I'll say so to anyone." },
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
    hello = {
      lines = {
        { id = "h_default", text = "Unger Statforth, horse breeder. Years of careful breeding and plenty of care, and I've the privilege of showing you the results. A horse is a companion for life, friend, so don't choose in a hurry." },
        { id = "h_notrusted", when = { ["not"] = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } } },
          text = "I'm sorry, but I'll only sell to those Stormwind trusts completely. It's nothing against you; these steeds can't fall into an enemy's hands, so earn the kingdom's trust and come back." },
      },
      again = {
        { id = "h_again", text = "Anything else? Take your time; the horses aren't going anywhere." },
        { id = "h_again2", text = "Go on, ask away." },
      },
      choices = {
        { text = "Show me your horses.", next = "BUSINESS", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } } },
        { text = "Why so particular about buyers?", next = "buyers" },
        { text = "How do horses fare in the Wetlands?", next = "wetlands" },
        { text = "Is it fair, selling only to some?", next = "fair" },
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
  },
}
