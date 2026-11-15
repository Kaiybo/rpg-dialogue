-- King Magni Bronzebeard. Voice: bibles/magni.md
-- Strong, stoic, carrying more grief than he lets the court see: a brother lost in Northrend,
-- a brother lost somewhere past the maps, a daughter in the hands of the Dark Iron.
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "magni", id = TODO_NPC("King Magni Bronzebeard"), name = "King Magni Bronzebeard",
  bible = "bibles/magni.md", role = "noble", tier = "major",
  communities = { "ironforge" }, temper = { "proud" }, values = { "brave", "honest", "lawful" },
  notices = { "fel", "kin" },

  impression = {
    first = "King Magni Bronzebeard has a voice made for being heard over forges and a laugh made for being heard over that. He is every inch a king, and he hasn't forgotten how to be a dwarf.",
    third = "{name} stood before King Magni Bronzebeard in the High Seat of Ironforge.",
  },

  greetings = {
    { id = "g_king", text = "Ye stand before the King of Ironforge. Speak up; the forges are loud." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "One o' mine, by the look o' ye. Welcome home, whatever road ye've been walkin'." },
    { id = "g_hero", when = { minLevel = 50 }, text = "I know that face; half the Alliance does by now. Come, sit, an' tell me how the world's been treatin' ye." },
    { id = "g_incursion", when = { questDone = TODO_QUEST("Old Ironforge Incursion") },
      text = "There's the one who went down under my hall an' came back up again. Come in, come in." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "A warlock, in my hall. Ye'll keep yer pets on a short chain while ye're here, an' ye'll keep yer business short as well." },
    { id = "n_shaman", cat = "kin", when = { race = "Dwarf", class = "SHAMAN" },
      text = "A dwarf who speaks wi' the elements. My granddad swore the mountain had a voice. Maybe ye're just the first tae answer it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Magni Bronzebeard, King o' Ironforge. We pledged our axes tae the Alliance after the Second War, an' we've no' regretted it, mostly." },
        { id = "h_grelin", when = { heardLine = "grelin.h_default" },
          text = "Ye've met the Whitebeard brothers, then. The Senate sends 'em to count trolls. I'd send an army, but the Senate likes countin'." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "Ah, our gnome friends. Mekkatorque's tram still runs, though I still dinnae understand how, an' ye're welcome in Ironforge as long as the mountain stands." },
        { id = "h_human", when = { race = "Human", minLevel = 20 },
          text = "Stormwind's sent ye north? Give the Regent my regards. An' tell him the Dark Iron are no' gettin' any friendlier." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves from the sky, they tell me! The Explorers will want tae measure ye, so let them; they measure everythin' that holds still long enough." },
        { id = "h_incursion", tags = { "news" }, when = { questRecent = { TODO_QUEST("Old Ironforge Incursion"), days = 7 } },
          text = "Dark Irons diggin' under my own hall, an' ye brought me their commander's head. It was Farsen's eyes an' yer arm that did it, an' Ironforge owes ye both." },
        { id = "h_priest", when = { race = "Human", class = "PRIEST" },
          text = "A priest o' the Cathedral, under my mountain. Our own keep the Hall o' Mysteries, wi' Rohan. They'll make ye welcome, an' they'll make ye tea." },
        { id = "h_hunter", when = { race = "Dwarf", class = "HUNTER" },
          text = "A dwarf wi' a rifle an' a beast at heel. The Mountaineers will try tae recruit ye. Make 'em buy the first round." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, there's a face I'm glad o'! Come up, come up, an' never mind the guards; they know a friend o' the throne when they see one." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "I'll hear ye, because a king hears everyone, but I'll no' pretend I'm pleased tae. Out wi' it." },
      },
      again = {
        { id = "h_again", text = "What else, then? The court can wait; it's well used tae it." },
        { id = "h_again2", text = "Go on. I've more ears than answers, but ye're welcome tae both." },
        { id = "h_again3", when = { race = "Dwarf" }, text = "Speak freely. A king hears enough 'Yes, my king' tae last him." },
      },
      choices = {
        { text = "What troubles Ironforge?", next = "troubles" },
        { text = "Tell me about your family.", next = "family" },
        { text = "Why did a king take up digging for the past?", next = "league" },
        { text = "You gave the gnomes part of your city.", next = "gnomes" },
        { text = "How did the Light come to Ironforge?", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "The Senate's envoys use your name a great deal.", next = "senate",
          when = { any = { { heardLine = "grelin.h_default" }, { questDone = TODO_QUEST("The Reports") } } } },
        { text = "Farsen sends his regards, my king.", next = "incursion", when = { questDone = TODO_QUEST("Old Ironforge Incursion") } },
        { text = "I came out of Lordaeron, Your Majesty.", next = "terenas", when = { origin = "human_lordaeron_refugee" } },
        { text = "Long live the king.", next = "END", fx = { affinity = 1 } },
      },
    },

    troubles = {
      lines = {
        { id = "t_default", text = "The Dark Iron, festerin' in the mountain, an' troll raids in Dun Morogh. An' on top o' that, the Alliance is askin' for more axes than I've got hands tae swing." },
      },
      choices = {
        { text = "Tell me about the Dark Iron.", next = "dark" },
        { text = "Where have your axes gone?", next = "reserve" },
        { text = "I'll lend mine.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Keep your axes at home, Your Majesty, because Ironforge comes first.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    dark = {
      lines = {
        { id = "dk_default", text = "They were our kin, once. Now they're at the dam on the loch, in Uldaman an' out in the Badlands, diggin' an' burnin' where they've no right tae be." },
      },
      choices = {
        { text = "Why do they hate you so?", next = "dark_why" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron", "uldaman" } } },
      },
    },
    dark_why = {
      big = true,
      lines = {
        { id = "dw_default", text = "Madoran Bronzebeard broke their armies at our gates. His statue still watches the pass in Loch Modan. Some grudges outlive everyone who started them." },
      },
      choices = {
        { text = "Then it's time someone ended it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 }, align = { honor = 1 } } },
        { text = "Grudges can be set down, too.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Keep the gate shut, then.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
      },
    },
    reserve = {
      lines = {
        { id = "rs_default", text = "At the Alliance's front, mostly. The Reserve's been called up, so Loch Modan holds wi' half a garrison an' Captain Rugelfuss countin' troggs in his sleep." },
      },
      choices = {
        { text = "Should Ironforge send so many?", next = "reserve_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reserve_why = {
      lines = {
        { id = "rw_default", text = "I gave my word after the Second War. The Alliance helped us take this mountain back. A dwarf who forgets that isnae worth his beard." },
      },
      choices = {
        { text = "Spoken like a king.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your own valleys bleed for it.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 }, align = { honor = -1 } } },
      },
    },

    family = {
      big = true,
      lines = {
        { id = "f_default", text = "My brother Muradin went tae Northrend an' didnae come back. My daughter's in the hands o' the Dark Iron. I'll say no more about it in front o' the court." },
      },
      choices = {
        { text = "What happened to Muradin?", next = "muradin" },
        { text = "And your other brother, Brann?", next = "brann" },
        { text = "Then someone should bring her home.", next = "home", fx = { trait = { brave = 1 } } },
        { text = "I'm sorry, my king.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "There's no court here now, Your Majesty. Tell me of her.", tag = "Persuade", next = "family_moira",
          check = { pass = { any = { { disposition = { min = 68 } }, { race = "Dwarf" }, { class = { "PRIEST", "PALADIN" } } } } },
          fail = { next = "family_court", fx = { affinity = -1 } } },
      },
    },
    muradin = {
      lines = {
        { id = "mu_default", text = "He took the League's lads intae Northrend, an' Arthas Menethil found him there. Muradin taught that boy tae swing a hammer, an' the boy killed him for it." },
      },
      choices = {
        { text = "What did you do, when you heard?", next = "blade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade = {
      big = true,
      lines = {
        { id = "bl_default", key = true,
          text = "I went tae the Great Anvil wi' a crystal o' pure Light the Silver Hand had brought me, an' for three days I worked it intae a sword. Every blow I struck was for Muradin." },
      },
      choices = {
        { text = "Where is the sword now?", next = "blade_where" },
        { text = "The Light answers grief, Your Majesty. It answered yours.", next = "BACK",
          when = { class = { "PRIEST", "PALADIN" } }, fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Grief made that sword, Your Majesty, not the Light.", next = "BACK", when = { class = { "PRIEST", "PALADIN" } }, fx = { align = { light = -1 } } },
        { text = "Grief makes hard steel.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    blade_where = {
      lines = {
        { id = "bw_default", text = "Wi' Mograine o' the Silver Hand, last I knew, an' I've no' asked since. I'd rather think it's still doin' the work I made it for." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brann = {
      lines = {
        { id = "br_default", text = "Off past the edge o' the maps, as ever, an' no word from him in months. The League keeps sayin' he always turns up, but I've stopped sayin' it back." },
      },
      choices = {
        { text = "Magellas still keeps a chair for him.", next = "BACK", when = { heardLine = "magellas.h_brann" }, fx = { affinity = 2 } },
        { text = "He'll turn up.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "I'll keep an ear out on the road.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    home = {
      lines = {
        { id = "h2_default", text = "Aye, someone should. When ye're strong enough, come back an' say that tae me again, an' I'll be listenin'." },
        { id = "h2_ready", when = { minLevel = 50 },
          text = "Ye might be strong enough now. Others have gone intae that mountain for her. Mind that, an' come tae me when ye mean it." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Perhaps she doesn't want bringing home, Your Majesty.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },

    league = {
      lines = {
        { id = "lg_default", text = "Our miners broke intae halls older than Ironforge, carved in a hand nobody could read. A king who doesnae want tae know where his folk came from is just a man in a crown." },
      },
      choices = {
        { text = "What did the halls tell you?", next = "league_halls" },
        { text = "Mining must have paid better.", next = "league_cost" },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    league_halls = {
      lines = {
        { id = "lh_default", text = "Nothin' yet that anyone'll swear to. Magellas has his theories an' Archesonus has her doubts, an' if ye ask either one ye'll lose an afternoon." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    league_cost = {
      lines = {
        { id = "lc_default", text = "It did, an' the Senate reminds me o' that every season. But ye cannae eat gold, an' ye cannae know yerself by it either." },
      },
      choices = {
        { text = "Wise words.", next = "BACK", fx = { affinity = 1 } },
        { text = "You can buy a lot of bread with it.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    gnomes = {
      lines = {
        { id = "gn_default", text = "Their city was poisoned an' overrun, an' ours had room. That's the whole of it, an' anyone who tells ye otherwise wants somethin' from ye." },
      },
      choices = {
        { text = "Did your people mind?", next = "gnomes_mind" },
        { text = "And the tram?", next = "tram" },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },
    gnomes_mind = {
      lines = {
        { id = "gm_default", text = "Some grumbled, but dwarves grumble about the weather under a mountain. I've no' heard one complain about the tram, mind, an' that's a gnome's work." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tram = {
      lines = {
        { id = "tr_default", text = "I asked Mekkatorque for a quicker road tae Stormwind after the war, an' he went under the mountains for it. I've ridden the thing twice, wi' my eyes shut both times." },
      },
      choices = {
        { text = "The King of Ironforge, afraid of a tram?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    light = {
      lines = {
        { id = "li_default", text = "Up from the humans, after the Second War. The Silver Hand took some o' my folk intae its ranks, an' the Church's teachin' came wi' them. Now Rohan keeps a whole hall for it." },
      },
      choices = {
        { text = "Do you follow the Light yourself?", next = "light_self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_self = {
      lines = {
        { id = "ls_default", text = "I'm a smith an' a king; I follow the anvil. But I've seen what the Light does in steel, once. I'd no' say a word against it." },
      },
      choices = {
        { text = "What did it do in steel?", next = "blade" },
        { text = "That's a kind of faith.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Steel and sense have served you better than prayer.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    senate = {
      lines = {
        { id = "se_default", text = "The Senate likes reports an' I like trolls dead, so I signed Grelin's letter m'self. Senator Redstone's been shoutin' about it ever since." },
      },
      choices = {
        { text = "Is the Senate wrong?", next = "senate_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    senate_wrong = {
      lines = {
        { id = "sw_default", text = "No. It's slow, but it's right more often than I'd like, an' a king needs somebody tae tell him no. I just dinnae need it tae take a month." },
      },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A king shouldn't wait on anyone.", next = "BACK", fx = { trait = { stern = 1 }, align = { order = -1 } } },
      },
    },

    incursion = {
      lines = {
        { id = "in_default", text = "Ha! Old Farsen saw Dark Iron tunnels from a hill in Dun Morogh before my own guards saw 'em under their boots. I'll be hearin' about that for years." },
      },
      choices = {
        { text = "Are the breaches sealed?", next = "incursion_sealed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    incursion_sealed = {
      lines = {
        { id = "is_default", text = "Sealed an' doubled, an' the lower halls are full o' guards who'd rather be at the Stonefire. They'll live, an' so will the rest of us, thanks tae ye, {name}." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, standing = { ironforge = 1 } } } },
    },

    terenas = {
      lines = {
        { id = "te_default", text = "Then ye've lost more than I have. Terenas was a good man, wise an' fair. Word o' his death reached me at the anvil, an' I've no' forgiven the hour." },
      },
      choices = {
        { text = "Thank you, Your Majesty.", next = "BACK", fx = { affinity = 2 } },
        { text = "At the anvil?", next = "blade" },
      },
    },
    family_moira = {
      big = true,
      lines = {
        { id = "fm_default", text = "When Lakeshire's envoys came beggin' for help against the Blackrock, it was Moira who stood up in the hall an' said she'd go. I signed the order that let her ride south wi' twenty guardsmen, because I was proud o' her for askin'." },
        { id = "fm_after", text = "The Dark Iron took her on the road through the Steppes, an' not one o' the twenty came home. I've had that order read back tae me in my own head every night since, an' my hand's never once refused tae sign it." },
        { id = "fm_priest", when = { class = { "PRIEST", "PALADIN" } }, text = "Ye'll want tae tell me it's no' my fault, an' ye'd be kind tae. Pray for her instead, would ye, because I've run out o' words for it an' the Light might still have some." },
      },
      choices = {
        { text = "She went because she's your daughter, Majesty.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then we bring her home.", next = "home", fx = { trait = { brave = 1 } } },
      },
    },
    family_court = {
      lines = {
        { id = "fc_default", text = "There's always a court, {g:lad|lass}, even when there's naebody in it but the two of us an' the walls. I've said what I'll say about my daughter." },
        { id = "fc_default2", text = "Kindly meant, I'm sure, but a king's grief is no' a thing for passin' about the Great Forge. Leave it be." },
      },
      choices = {
        { text = "Forgive me, Your Majesty.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every report from Dun Morogh tae the Badlands comes up these steps sooner or later, an' I read the lot. Ask me about any o' this." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, I'll set the Senate's papers aside a while. Ask me about any o' this, an' I'll gie ye a straight answer." },
    },
    background = { { id = "tp_bg", text = "I'm the eldest o' three brothers, born tae the throne, an' I wasnae sure I'd make a decent king. Some mornings I'm still no' sure.", next = "family" } },
    advice = { { id = "tp_ad", text = "Keep yer word, keep yer axe sharp, an' keep the Senate waitin' just long enough tae be polite." } },
    dark_iron = { { id = "tp_dark_iron", text = "Thaurissan's get. I'll no' waste my breath cursin' them when I've a mountain tae hold against them.", next = "dark" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "A good city, poisoned from inside. Mekkatorque carries the weight of it, an' I'd carry it for him if he'd let me." } },
    explorers_league = { { id = "tp_league", text = "The League was my idea, an' my best one. Ask Magellas; he'll agree wi' me, at length." } },
    frostmane = { { id = "tp_frostmane", text = "Grelin's business, an' the Senate's. I keep my own counsel on the Frostmane. They've cost my house more than a few sheep." } },
    troggs = { { id = "tp_troggs", text = "Up from the deep places, into Gnomeregan first an' now our quarries. Somethin' woke them. I'd like tae know what before it wakes worse." } },
    defias = { { id = "tp_defias", text = "Stormwind's thieves? That's the humans' business, an' we've our own rot in the mountain tae deal with." } },
    westfall = { { id = "tp_westfall", text = "Farmland, isn't it? Never trust ground ye cannae dig a decent tunnel through." } },
    _none = { { id = "tp_none", text = "Ask the Explorers' League. They know a wee bit about everythin', an' they'll tell ye all of it." } },
  },
}
