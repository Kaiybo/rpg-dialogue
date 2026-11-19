-- Dun Morogh folk the first passes missed, part 3: Amberstill Ranch (Turuk Amberstill, Ultham Ironhorn), Narm Faulk
-- south of Helm's Bed Lake (the dwarven paladins' Tome of Divinity), Yori Crackhelm in the Thunderbrew Distillery and
-- Wagner Hammerstrike at the Gates of Ironforge (Harvest Festival only). Voice: bibles/missed_dunmorogh.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Turuk Amberstill: dwarven weaponsmith, Amberstill Ranch. Kin to Rudra, Veron, Yarlyn and Pol.
P:NPC {
  key = "turuk_amberstill", id = TODO_NPC("Turuk Amberstill"), name = "Turuk Amberstill", gender = "male",
  title = "Dwarven Weaponsmith",
  bible = "bibles/missed_dunmorogh.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "blunt", "steady" }, values = { "kin", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "Turuk Amberstill is the one Amberstill who'd sooner shape steel than shear rams, and he sells his axes and hammers from the family ranch. He keeps one eye on his work and the other on the hills above the pens.",
    third = "{name} met Turuk Amberstill, the weaponsmith of Amberstill Ranch.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. If ye've come fer a ram, ye want my kin, but if ye've come fer somethin' tae swing, ye want me." },
    { id = "g_war", when = { class = { "WARRIOR", "PALADIN" } }, text = "Ye've the arms fer a proper dwarven hammer, {class}. Come an' try the balance o' this one, an' mind the ram behind ye." },
    { id = "g_done", when = { questDone = TODO_QUEST("Protecting the Herd") }, text = "Ye're the one who put down Vagash! Rudra's slept two nights runnin', an' the whole ranch is the better fer it." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the ranch, are ye? The rams remember ye, an' so do I." },
  },
  notice = {
    { id = "n_broken", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That edge o' yers has more notches than a saw, {g:lad|lass}. I'll no' insult ye by sayin' what I think o' it, but I'm thinkin' it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Turuk Amberstill. The family breeds the finest rams in Khaz Modan, an' I make the weapons, because every clan needs one dwarf who's nae good wi' animals." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Aye, go on, the forge will keep." },
      },
      choices = {
        { text = "A smith on a ram ranch?", next = "smith" },
        { text = "You keep watching the hills.", next = "hills" },
        { text = "What makes a weapon dwarven?", next = "dwarven" },
        { text = "Let me see your work.", next = "END" },
      },
    },
    smith = {
      lines = { { id = "s_default", text = "The rams never took tae me, nor I tae them, so I went tae the Great Forge as a lad an' came home wi' a trade. It suits everyone, for a ranch wi' wolves an' worse in the hills needs sharp steel as much as it needs fences." } },
      choices = {
        { text = "Who runs the ranch, then?", next = "family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "Rudra has the herd, an' she's the one tae see about any trouble wi' it. Veron sells the rams tae riders, an' Ultham Ironhorn teaches folk tae stay on them, which isnae as simple as he makes it look." } },
      choices = { { text = "A proper clan business. Something else.", next = "BACK" } },
    },
    hills = {
      lines = {
        { id = "hl_done", when = { questDone = TODO_QUEST("Protecting the Herd") }, text = "Old habit, {g:lad|lass}. Vagash is dead an' I've ye tae thank fer it, but where there was one yeti there'll be another, an' I'd sooner see it comin'." },
        { id = "hl_default", text = "Aye, I do. There's a yeti the hunters call Vagash that's been comin' down at dusk tae take our rams, an' I've a hammer by the anvil that I made wi' him in mind." },
      },
      choices = {
        { text = "Why not hunt him yourself?", next = "hunt", when = { ["not"] = { questDone = TODO_QUEST("Protecting the Herd") } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunt = {
      lines = { { id = "hu_default", text = "Because I make hammers a great deal better than I swing them, an' I'm honest enough tae know it. Speak tae Rudra if ye've a mind tae try, for she's lost enough o' her herd tae be glad o' anyone who will." } },
      choices = { { text = "I'll speak to her. Something else.", next = "BACK" } },
    },
    dwarven = {
      lines = { { id = "d_default", text = "Weight in the head an' a short haft, so all the strength o' yer back goes intae the blow. Human blades are made fer reach, but a dwarf fights close, an' close is where a hammer does its talkin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm an Amberstill who cannae abide rams, so I learned the forge instead. The family's forgiven me, mostly." } },
    frostmane = { { id = "tp_fm", text = "The trolls keep tae the west, an' they've never troubled the ranch. It's what comes out o' the hills that costs us rams." } },
    _none = { { id = "tp_none", text = "I dinnae ken, friend. Ask Rudra; she hears the news from every rider who comes fer a ram." } },
  },
}

-- Narm Faulk: dwarf paladin south of Helm's Bed Lake, struck down by Dark Iron spies and raised by a young paladin
-- with the Symbol of Life (The Tome of Divinity). He can only be spoken with once he is on his feet again.
P:NPC {
  key = "narm_faulk", id = TODO_NPC("Narm Faulk"), name = "Narm Faulk", gender = "male",
  bible = "bibles/missed_dunmorogh.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh" }, temper = { "grim", "grateful" }, values = { "duty", "comrades", "faith" },
  notices = { "class", "race" },
  impression = {
    first = "Narm Faulk is a dwarf paladin sitting up in bloodied snow south of Helm's Bed Lake, grey in the face and gripping his hammer as though the fight weren't over. He has just come back from somewhere he doesn't care to describe.",
    third = "{name} met Narm Faulk, the paladin who fell to Dark Iron spies south of Helm's Bed Lake.",
  },
  greetings = {
    { id = "g_default", text = "Steady, {class}, an' keep yer voice low. There are Dark Irons in these hills yet, an' I'm in nae state tae meet them twice in one day." },
    { id = "g_pal", when = { class = "PALADIN" }, text = "So it was yer hand that pulled me back. Light bless ye, {g:lad|lass}, for I was a long way down an' I'd stopped expectin' anyone tae come." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've come back tae see if I'm still breathin'? I am, an' I mean tae keep at it." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "It does me good tae see a Bronzebeard face. The last dwarves I looked at had ash-grey skin an' eyes like coals, an' they werenae friendly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_pal", when = { class = "PALADIN" }, text = "Narm Faulk, o' the Knights o' the Silver Hand, an' in yer debt past any payin'. That was the Symbol o' Life ye used, an' Tiza doesnae trust it tae a paladin she's unsure of, so I ken what she thinks o' ye." },
        { id = "h_default", text = "Narm Faulk, Knight o' the Silver Hand. I came here wi' Muiredon Battleforge tae count Dark Iron spies, an' we found more o' them than we'd bargained fer." },
      },
      again = {
        { id = "h_again", text = "Ask what ye will, but keep watchin' the treeline while ye do." },
        { id = "h_again2", text = "Aye, {class}? I've breath enough fer another question." },
      },
      choices = {
        { text = "What happened here?", next = "ambush" },
        { text = "Muiredon is alive. He's sick with shame.", next = "muiredon" },
        { text = "What are Dark Irons doing in Dun Morogh?", next = "spies" },
        { text = "What was it like, where you were?", next = "beyond", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Rest. I'll keep watch a while.", next = "END" },
      },
    },
    ambush = {
      lines = { { id = "a_default", text = "We'd tracked them tae a camp below the lake an' crept in tae see what they carried. They had a sentry we never saw, an' in a breath there were four on us, so I told Muiredon tae run fer help while I held them." } },
      choices = {
        { text = "You knew you couldn't hold four.", next = "knew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knew = {
      lines = { { id = "k_default", text = "I knew it fine. But one of us had tae carry word tae Ironforge, an' he's the faster runner an' has a wife waitin', so it wasnae a hard sum tae do." } },
      choices = {
        { text = "That's what the Silver Hand is for.", next = "hand" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hand = {
      lines = { { id = "hd_default", text = "Aye, it is. Uther's order taught us that a paladin stands between, an' I stood between as long as my legs would let me. I'd do it again, though I'd be obliged if nobody asked me tae this week." } },
      choices = { { text = "You've earned the rest. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    muiredon = {
      lines = { { id = "m_default", text = "Shame? The daft old badger did exactly as I bade him, an' it's only because he ran that anyone came fer me at all. Tell him from me that if he's ashamed, I'll rise from this snow an' knock it out o' him." } },
      choices = { { text = "I'll tell him, word for word.", next = "BACK", fx = { affinity = 1 } } },
    },
    spies = {
      lines = { { id = "s_default", text = "Watchin' Ironforge, an' no' fer the first time. They're Thaurissan's folk out o' Blackrock, an' the Senate keeps sayin' there's nae proof they've come this far north, so proof is what Muiredon an' I were after.", fx = { learn = { "dark_iron" } } } },
      choices = {
        { text = "What proof would satisfy the Senate?", next = "proof" },
        { text = "Something else.", next = "BACK" },
      },
    },
    proof = {
      lines = { { id = "p_default", text = "Their own writin'. The spies carry orders in the Dark Iron script, an' a page o' that laid on a senator's desk is harder tae argue wi' than the word o' two tired paladins." } },
      choices = { { text = "Then they'll have their page. Something else.", next = "BACK" } },
    },
    beyond = {
      lines = { { id = "b_default", text = "Quiet, an' no' cold, which surprised me after Dun Morogh. I'll say nae more than that, for I dinnae think it's meant tae be told, but I'll tell ye I wasnae afraid." } },
      choices = { { text = "That's enough to know. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a paladin o' Ironforge, sworn tae the Silver Hand. Muiredon Battleforge an' I have watched each other's backs fer years." } },
    dark_iron = { { id = "tp_di", text = "They're spyin' on Ironforge from the hills below Helm's Bed Lake. I've the wounds tae prove it, if the Senate wants a look." } },
    _none = { { id = "tp_none", text = "I cannae help ye wi' that, {class}, my wits are still half in the snow. Ask Tiza Battleforge in the Mystic Ward." } },
  },
}

-- Yori Crackhelm: Thunderbrew Distillery, Kharanos; welcomes newcomers (the Welcome! voucher).
P:NPC {
  key = "yori_crackhelm", id = TODO_NPC("Yori Crackhelm"), name = "Yori Crackhelm", gender = "male",
  bible = "bibles/missed_dunmorogh.md", role = "citizen", tier = "service",
  communities = { "kharanos" }, temper = { "welcoming", "chatty" }, values = { "hospitality", "kharanos" },
  notices = { "greenness", "pet" },
  impression = {
    first = "Yori Crackhelm has made himself the unofficial welcome of Kharanos, standing in the Thunderbrew Distillery with a greeting ready for anyone who stamps the snow off their boots. He seems to like new faces better than old ale.",
    third = "{name} met Yori Crackhelm, who welcomes newcomers at the Thunderbrew Distillery in Kharanos.",
  },
  greetings = {
    { id = "g_default", text = "Welcome tae Kharanos, {class}, an' welcome tae the Thunderbrew Distillery! Stamp the snow off an' come in by the fire." },
    { id = "g_voucher", when = { questActive = TODO_QUEST("Welcome!") }, text = "Is that a voucher ye're holdin'? Well, bring it here, {g:lad|lass}, for I've been keepin' somethin' aside fer whoever carried it." },
    { id = "g_back", when = { metBefore = true }, text = "There's a face I know! Ye see, that's how it goes in Kharanos, ye're a stranger once an' never again." },
  },
  notice = {
    { id = "n_new", cat = "greenness", when = { maxLevel = 6 },
      text = "Fresh out o' Coldridge, are ye? I can tell by the way ye're lookin' at the rafters. It's a grand hall, an' ye'll get used tae it." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "An' who's this fine creature? Bring it in, bring it in, so long as it doesnae drink from the vats." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Yori Crackhelm, an' it's my pleasure tae be the first friendly word a traveller hears in Kharanos. Innkeeper Belm does the beds an' the Thunderbrews do the ale, so I do the welcomin'." },
      },
      again = {
        { id = "h_again", text = "What else can I tell ye about the place?" },
        { id = "h_again2", text = "Aye, ask away, {class}, I've all the time in the world." },
      },
      choices = {
        { text = "Who should a newcomer meet here?", next = "meet" },
        { text = "Is welcoming people your whole trade?", next = "trade" },
        { text = "You must see every sort come through.", next = "sorts" },
        { text = "Thank you for the welcome.", next = "END" },
      },
    },
    meet = {
      lines = { { id = "m_default", text = "Belm first, fer a bed an' a hot meal, an' then Ragnar Thunderbrew, who'll have ye huntin' boar fer his ribs before ye've finished yer mug. If it's work ye're after, Senator Stonehallow is usually about wi' somethin' on his mind." } },
      choices = {
        { text = "And who should I avoid?", next = "avoid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    avoid = {
      lines = { { id = "a_default", text = "Naebody in the village, {g:lad|lass}, but mind the roads beyond it. There are wendigo in the hills tae the south-west an' leper gnomes on the road tae Gnomeregan, an' neither lot has ever returned a greetin' o' mine.", fx = { learn = { "gnomeregan" } } } },
      choices = { { text = "You tried greeting a wendigo? Something else.", next = "BACK", reply = "Only the once, an' from a good way off. It's a matter o' principle wi' me." } },
    },
    trade = {
      lines = { { id = "t_default", text = "It isnae a trade at all, an' naebody pays me fer it. I just mind what it was like tae walk intae a strange hall wi' cold feet an' nae friends, an' I decided nobody would do that in Kharanos while I was standin' here." } },
      choices = { { text = "That's a good thing to decide. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sorts = {
      lines = {
        { id = "s_gnome", when = { race = "Gnome" }, text = "I do, an' more o' yer folk than any other, this past while. They come in from Gnomeregan wi' naethin' but what they're wearin', an' I make sure every one o' them gets a seat by the fire before anyone asks them a question.", fx = { learn = { "gnomeregan" } } },
        { id = "s_default", text = "Every sort! Recruits out o' Coldridge wi' their first scars, gnomes who've lost their city, humans up from Stormwind who cannae believe the cold, an' lately the odd night elf, who gets stared at somethin' terrible." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've lived in Kharanos all my days, an' I've appointed myself its doorman. Naebody's objected yet." } },
    gnomeregan = { { id = "tp_gn", text = "The poor wee folk still come through, though fewer now. I try tae see they get a warm welcome, for they've had a cold enough road." } },
    _none = { { id = "tp_none", text = "Now that I dinnae know, but somebody in this hall will. Ask Belm, an' tell him Yori sent ye." } },
  },
}

-- Wagner Hammerstrike: Harvest Festival fireworks vendor at the Gates of Ironforge (Honoring a Hero: Uther's Tomb).
P:NPC {
  key = "wagner_hammerstrike", id = TODO_NPC("Wagner Hammerstrike"), name = "Wagner Hammerstrike", gender = "male",
  bible = "bibles/missed_dunmorogh.md", role = "vendor", tier = "quest",
  communities = { "ironforge" }, temper = { "solemn", "warm" }, values = { "remembrance", "honor" },
  notices = { "class", "race" },
  impression = {
    first = "Wagner Hammerstrike stands by the feast tables at the Gates of Ironforge during the Harvest Festival, with crates of fireworks at his feet and a quiet word for everyone who stops. He talks about the fallen as if they were only late for dinner.",
    third = "{name} met Wagner Hammerstrike, who keeps the Harvest Festival at the Gates of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "A good Harvest Festival tae ye, {class}! Take a seat at the table, an' spare a thought fer those who cannae." },
    { id = "g_active", when = { questActive = TODO_QUEST("Honoring a Hero") }, text = "Have ye been tae the tomb yet? It's a hard road north, I ken, but it's a road worth walkin' at this time o' year." },
    { id = "g_done", when = { questDone = TODO_QUEST("Honoring a Hero") }, text = "Ye went tae Uther's Tomb an' paid yer respects, I hear. That was well done, {class}, an' the Lightbringer would have thought so too." },
    { id = "g_back", when = { metBefore = true }, text = "Back tae the feast, are ye? There's plenty yet, for a dwarven table doesnae empty in one sittin'." },
  },
  notice = {
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin! Then this festival is yers more than most, for it's the first o' yer order we remember at it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Wagner Hammerstrike. I keep the Harvest Festival here at the gates, where we eat well, light the sky, an' remember the heroes who paid fer the bread on the table." },
      },
      again = {
        { id = "h_again", text = "What else would ye ask, friend?" },
        { id = "h_again2", text = "Aye, {class}? Sit, eat, an' ask." },
      },
      choices = {
        { text = "What is the Harvest Festival for?", next = "festival" },
        { text = "Which hero does the Alliance honor?", next = "uther" },
        { text = "Fireworks, at a remembrance?", next = "fireworks" },
        { text = "I knew some who didn't come home.", next = "lost" },
        { text = "A good festival to you.", next = "END" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It's fer givin' thanks, an' no' only fer the harvest. Every loaf on that table is there because somebody stood in front o' the Horde or the Scourge an' didnae step aside, an' once a year we stop an' say so aloud." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    uther = {
      lines = { { id = "u_default", text = "Uther the Lightbringer, first o' the paladins. He led the Silver Hand through the Second War, an' he died in Lordaeron defendin' his king's ashes from the prince he'd trained himself." } },
      choices = {
        { text = "Where does he lie?", next = "tomb" },
        { text = "A human hero, honored by dwarves?", next = "human", when = { race = "Dwarf" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tomb = {
      lines = { { id = "t_default", text = "In a tomb in the Western Plaguelands, south o' Andorhal, wi' the dead walkin' the fields all round it. That's why few go, an' why it means so much when somebody does." } },
      choices = {
        { text = "Has the Scourge left the tomb alone?", next = "alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = { { id = "al_default", text = "So travellers say, an' I've heard it from too many tae doubt it. The plague has rotted everythin' fer miles, yet the tomb stands clean, an' ye may make o' that what yer faith allows." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    human = {
      lines = { { id = "hu_default", text = "Aye, an' why not? My own father marched beside the Silver Hand, an' he said Uther never once asked whether the dwarf next tae him prayed the same way. A hero like that belongs tae whoever he bled fer." } },
      choices = { { text = "That's a fair answer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    fireworks = {
      lines = { { id = "fw_default", text = "Ye've never been tae a dwarven wake, have ye? We dinnae send our dead off wi' whisperin'. We make a noise the mountain can hear, so they'll know they're missed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lost = {
      lines = { { id = "l_default", text = "Then this table's theirs as much as yers. Sit a while an' say their names over a full plate, for that's all the ceremony there is tae it, an' it's all that's ever been needed." } },
      choices = { { text = "I'll do that. Thank you.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep the festival at the gates each year. Somebody must set the table an' mind the fireworks, an' I've the patience fer both." } },
    scourge = { { id = "tp_sc", text = "The dead hold Lordaeron, an' Uther's Tomb sits in the middle o' them. It hasnae stopped folk goin' tae pay their respects." } },
    _none = { { id = "tp_none", text = "I couldnae say, friend, I only know the festival an' who it's fer. Have a bite an' ask inside the gates." } },
  },
}
