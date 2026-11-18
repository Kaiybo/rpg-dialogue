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
    { id = "g_hero", when = { minLevel = 50 }, text = "I know that face, an' so does every tavern from here tae Stormwind. Come, sit, an' tell me how the world's been treatin' ye." },
    { id = "g_incursion", when = { questDone = TODO_QUEST("Old Ironforge Incursion") },
      text = "There's the one who went down under my hall an' came back up again. Come in, come in." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone from the mountain {away}, an' the forges kept singin' without ye. Welcome back tae Ironforge all the same." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "Ha! Ye've been away {away}, an' ye've come back carryin' yerself like a proper warrior o' the Alliance. Whatever ye've been fightin', I'd wager it fared worse than ye." },
    { id = "g_word_helped", when = { word = "helped" }, text = "My people tell me ye've been lendin' a hand about the city these past days. That's the sort o' news a king likes tae hear over his supper." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "I hear ye've been throwin' yer weight about among my folk. Ironforge doesnae take kindly tae bullies, friend, so mind yerself in my hall." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "A warlock, in my hall. Ye'll keep yer pets on a short chain while ye're here, an' ye'll keep yer business short as well." },
    { id = "n_shaman", cat = "kin", when = { race = "Dwarf", class = "SHAMAN" },
      text = "A dwarf who speaks wi' the elements. My granddad swore the mountain had a voice. Maybe ye're just the first tae answer it." },
  },

  start = "hello",
  nodes = {
    opn_horde = {
      lines = {
        { id = "opn_horde_q", text = "The Regent's envoys tell me the orcs have a new warchief, this Thrall, who talks o' peace an' keeps tae his own corner o' Kalimdor. I fought his people when they burned Khaz Modan, so I'm no' the one tae ask. What d'ye make o' him?" },
      },
      choices = {
        { text = "He's kept his word so far. I'd give him the chance.", next = "opn_horde_r_trust", fx = { align = { light = 1 }, opinion = { warchief = "trust" } } },
        { text = "An orc's word lasts until he's hungry, Your Majesty.", next = "opn_horde_r_distrust", fx = { affinity = 1, align = { light = -1 }, trait = { stern = 1 }, opinion = { warchief = "distrust" } } },
        { text = "Watch him and keep the axes sharp. Both can be true.", next = "opn_horde_r_wary", fx = { trait = { practical = 1 }, opinion = { warchief = "wary" } } },
        { text = "They burned Khaz Modan. No treaty buys that back.", next = "opn_horde_r_hate", when = { race = "Dwarf" }, fx = { affinity = 1, align = { light = -1 }, opinion = { horde = "hate" } } },
        { text = "I came out of Lordaeron. I've worse enemies than orcs now.", next = "opn_horde_r", when = { origin = "human_lordaeron_refugee" }, fx = { opinion = { horde = "lesser_evil", scourge = "hate" } } },
        { text = "That's for kings to judge, not me.", next = "BACK" },
      },
    },
    opn_horde_r = {
      lines = {
        { id = "opn_horde_r_default", text = "Aye, the Plague's taught us all new arithmetic. I'll still count the orcs, mind, but I'll count the dead first." },
      },
      choices = {
        { text = "Something else, Your Majesty.", next = "BACK" },
      },
    },
    opn_horde_r_trust = {
      lines = {
        { id = "opn_horde_r_trust", text = "Then I hope ye're right, an' I hope ye're there tae tell me so if ye're wrong. I've buried enough friends who trusted an orc's smile." },
      },
      choices = {
        { text = "Something else, Your Majesty.", next = "BACK" },
      },
    },
    opn_horde_r_distrust = {
      lines = {
        { id = "opn_horde_r_distrust", text = "Ha! Ye'd do well in my Senate, though ye'd frighten half o' them. I'll no' argue wi' ye, for I've seen what hungry orcs do." },
      },
      choices = {
        { text = "Something else, Your Majesty.", next = "BACK" },
      },
    },
    opn_horde_r_wary = {
      lines = {
        { id = "opn_horde_r_wary", text = "That's a soldier's answer, an' it's near enough the one I give the Regent. Peace is a fine thing tae have on the table, so long as the axe stays under it." },
      },
      choices = {
        { text = "Something else, Your Majesty.", next = "BACK" },
      },
    },
    opn_horde_r_hate = {
      lines = {
        { id = "opn_horde_r_hate", text = "No, it doesnae, an' I'll no' insult the dead by pretendin' otherwise. But mind ye don't let the grudge do yer thinkin', or ye'll end up like the Dark Iron." },
      },
      choices = {
        { text = "Something else, Your Majesty.", next = "BACK" },
      },
    },
    xpt_magni = {
      big = true,
      lines = { { id = "xpt_magni_default", text = "We think the same as we always have: a company's a clan ye choose, an' ye owe it what ye'd owe yer kin. My brothers an' I fought back tae back long before any o' us wore a crown, an' I'd still trust a band o' honest travellers over most o' the Senate." } },
      choices = {
        { text = "Then I'll stand by my company as I would by kin.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Kin is kin. A company is just a contract that lasts.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Do you miss your brothers, Your Majesty?", next = "xpt_magni2" },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xpt_magni2 = {
      lines = { { id = "xpt_magni2_default", text = "Every day, though in different ways, for Brann's off diggin' somewhere an' writes when he remembers, an' Muradin went north wi' Prince Arthas an' never came home. I keep a chair for each o' them at the table, an' some nights I catch myself waitin' for Muradin tae come in late an' complain about the ale." } },
      choices = {
        { text = "Perhaps one of them will come home yet, Your Majesty.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "When the throne lets me, which isnae often, for there's no air like the air above Kharanos an' no ram like an Amberstill ram. I've brought down a bear or two in my time, an' I'll tell ye about every one o' them if ye've an hour." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' that's a fine {pet} ye have! Treat it well, for a beast that trusts ye is worth more than a mountain o' gold, an' I say that as a dwarf who has the gold." },
      },
      choices = {
        { text = "I'd be honoured to hunt beside you someday, Your Majesty.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Royal hunts are for show. Real hunters go alone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because they've been thievin' in my city, an' I'll no' have that, whatever good they think they're doin'. If ye want tae serve Ironforge from the shadows, go after the Dark Iron, for they've secrets in Shadowforge I'd like tae know, an' I'll forget yer friends' names for it." } },
      choices = {
        { text = "Then I'll serve the throne, Your Majesty, against the Dark Iron.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The Circle serves itself, Your Majesty. So do I.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "As guests who've earned their place, for the Mystic Ward has never been sharper an' the gnomes fight like dwarves twice their size. I'd only ask them tae stop blowin' holes in my walls when they practise." } },
      choices = {
        { text = "Ironforge's kindness deserves loyalty. I'll serve it well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Gnomes or dwarves, mages answer to their art first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "More than ye'd guess. Ye listen tae the forest an' we listen tae the mountain, an' the both of us know the world's older than any crown sittin' on it, mine included." } },
      choices = {
        { text = "The land comes before any crown, Your Majesty.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A strong crown is what keeps the land safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_brd = {
      big = true,
      lines = { { id = "xcl_brd_default", text = "Then the Dark Iron have lost their emperor, an' I've lost the one enemy I could put a name tae. But naebody's brought my Moira through that gate yet, so maybe she's hurt, or maybe she's hidin' her face for shame, an' if it's shame she's a fool, for there's nothin' I wouldnae forgive her." } },
      choices = {
        { text = "I'll go back down and find her myself, Your Majesty.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I went down for Thaurissan, Your Majesty, not for a princess.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What will you do if she won't come home?", next = "xcl_brd2" },
      },
    },
    xcl_brd2 = {
      lines = { { id = "xcl_brd2_default", text = "Then I'll go an' fetch her, crown or no crown, an' the Senate can shout at an empty throne for a week. She's a Bronzebeard, whatever happened tae her down there, an' Bronzebeards come home." } },
      choices = {
        { text = "Then I hope she comes home soon, Your Majesty.", next = "BACK" },
      },
    },
    xalt_magni = {
      big = true,
      lines = { { id = "xalt_magni_default", text = "{alt}, a {altrace} {altclass}, an' as fine a guest as this hall's had in a season. That one brought me word from the road an' stayed for a pint, which is more than the Senate's envoys ever do, an' I've a fondness for folk who'll do both." } },
      choices = {
        { text = "Kin should stand together, Your Majesty. Blood comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A body's worth is in their deeds, not their family.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Your Majesty.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "Hold there, I've seen that face afore! A {altclass} called {alt} stood in this very hall, an' ye've the same jaw an' the same stubborn eyes, so ye'll be kin, or I'm no' a Bronzebeard." },
        { id = "h_alt_dwarf", when = { alt = { race = "Dwarf", notKin = true }, metBefore = false },
          text = "Ye're no' a dwarf, but ye walk intae my hall the way {alt} did, an' that one's as stout a {altclass} as Khaz Modan ever sent out. Ye wouldnae happen tae know each other?" },
        { id = "h_alt_back", when = { alt = { days = 30 }, metBefore = true }, cooldown = "5d",
          text = "{alt} was here no' long ago, drinkin' my health an' tellin' tales o' the road, an' I'll wager half o' them were about ye. Sit down, an' tell me which half were true." },
        { id = "o_warchief_trust", tags = { "news" }, when = { opinion = { topic = "warchief", stance = "trust" }, faction = "Alliance" },
          text = "Here's the one who'd give the orc warchief a fair hearin'. I've been chewin' on that since, an' I've still no' decided if ye're wise or soft." },
        { id = "o_senate_useless", tags = { "news" }, when = { gossip = { topic = "ironforge_senate", stance = "useless" } },
          text = "My senators tell me ye called them a room full o' talkers. I'll no' say ye're wrong, but I'll no' say it where they can hear me either." },
        { id = "h_pt_magni", tags = { "news" }, when = { party = { race = "Dwarf" }, race = { "Human", "NightElf", "Gnome" } },
          text = "Ye've one o' my own folk at yer side, I see, an' {companion} looks like they've kept ye out o' trouble more than once. That's how it should be; there's no' a road in Azeroth a dwarf cannae make shorter for a friend." },
        { id = "h_pt_magnikin", tags = { "news" }, when = { party = { kin = true }, race = "Dwarf" },
          text = "A company o' dwarves walkin' intae the Great Forge together! That's a sight tae warm an old king, an' it puts me in mind o' the days when the clans still marched as one." },
        { id = "h_cl_brd", tags = { "news" }, when = { cleared = "Blackrock Depths", faction = "Alliance" },
          text = "They tell me ye went down intae the Depths an' Thaurissan didnae come back up. I've waited a long while tae hear that, an' I've no' yet decided what I feel about it." },
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
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid o' the Cenarion Circle in my throne room! Ye keep the old forests, I'm told, an' I keep the old stone, so we're no' so different as folk think." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "One o' the shadowy sort, in my own throne room. I've had my guards pull yer friends from the Hidden Circle out o' the Commons, so I'll be keepin' an eye on ye." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, an' welcome. Most o' the mages in my city are gnomes who came tae us wi' nothin' after Gnomeregan fell, an' I'll no' have it said Ironforge turned them away." },
      },
      again = {
        { id = "h_again", text = "What else, then? The court can wait; it's well used tae it." },
        { id = "h_again2", text = "Go on. I've more ears than answers, but ye're welcome tae both." },
        { id = "h_again3", when = { race = "Dwarf" }, text = "Speak freely. A king hears enough 'Yes, my king' tae last him." },
      },
      choices = {
        { text = "Do dwarves and druids really have anything in common, Your Majesty?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What troubles Ironforge?", next = "troubles" },
        { text = "Tell me about your family.", next = "family" },
        { text = "Why did a king take up digging for the past?", next = "league" },
        { text = "You gave the gnomes part of your city.", next = "gnomes" },
        { text = "How did the Light come to Ironforge?", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "The Senate's envoys use your name often.", next = "senate",
          when = { any = { { heardLine = "grelin.h_default" }, { questDone = TODO_QUEST("The Reports") } } } },
        { text = "Farsen sends his regards, my king.", next = "incursion", when = { questDone = TODO_QUEST("Old Ironforge Incursion") } },
        { text = "I came out of Lordaeron, Your Majesty.", next = "terenas", when = { origin = "human_lordaeron_refugee" } },
        { text = "The mountain speaks to me, Your Majesty. Through the stone.", next = "shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "I've come about the fel I carry, Your Majesty.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I served in the Military Ward before I took the road.", next = "soldier", when = { race = "Dwarf", class = "WARRIOR" } },
        { text = "Darnassus sends its greetings, King Magni.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "Why have your guards been arresting the Hidden Circle?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How do you see the gnome mages in your city?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you ever hunt in the high snows, Your Majesty?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Thaurissan is dead, Your Majesty. I was there.", next = "xcl_brd", when = { cleared = "Blackrock Depths", faction = "Alliance" } },
        { text = "What does Ironforge think of the companies that pass through?", next = "xpt_magni", when = { party = true } },
        { text = "Who's this other one you keep mentioning, Your Majesty?", next = "xalt_magni", when = { alt = true } },
        { text = "Long live the king.", next = "END", fx = { affinity = 1 } },
      },
    },

    troubles = {
      lines = {
        { id = "t_default", text = "The Dark Iron, festerin' in the mountain, an' troll raids in Dun Morogh. An' on top o' that, the Alliance is askin' for more axes than I've got hands tae swing." },
      },
      choices = {
        { text = "And the Horde, Your Majesty? What of the orcs?", next = "opn_horde" },
        { text = "Tell me about the Dark Iron.", next = "dark" },
        { text = "The Alliance seems to have most of your axes already.", next = "reserve" },
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
        { text = "That's a great many soldiers to send away.", next = "reserve_why" },
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
        { text = "Your people can't all have welcomed them.", next = "gnomes_mind" },
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
        { text = "You don't strike me as a dwarf who follows the Light.", next = "light_self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_self = {
      lines = {
        { id = "ls_default", text = "I'm a smith an' a king; I follow the anvil. But I've seen what the Light does in steel, once. I'd no' say a word against it." },
      },
      choices = {
        { text = "What did it do in steel?", next = "blade" },
        { text = "That sounds like faith to me.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
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
        { text = "I hope the breaches have been sealed.", next = "incursion_sealed" },
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
    shaman = {
      big = true,
      lines = {
        { id = "sh_default", text = "So my granddad wasnae mad after all, or else ye're both mad together. Some o' my court say it's Wildhammer superstition, an' the rest want tae know what the mountain thinks o' the Senate, so what does it say tae ye?" },
        { id = "sh_listener", when = { origin = "dwarf_stone_listener" },
          text = "I'm told ye were listenin' at the walls o' the deep halls since ye were a bairn, an' the miners called ye odd for it. The mountain's had a long time tae get a word in, so I'd like tae hear what it's been sayin'." },
      },
      choices = {
        { text = "It says the Dark Iron dig where they shouldn't.", next = "shaman_deep" },
        { text = "The elements are older than any king, Your Majesty.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "I serve Ironforge first, and the stone second.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Something else, Your Majesty.", next = "BACK" },
      },
    },
    shaman_deep = {
      lines = {
        { id = "shd_default", text = "Farsen says the same from his hill, an' he's a Wildhammer, so it's a rare day I find a Wildhammer an' a Bronzebeard agreein'. If the stone's tellin' ye where the breaches are, ye tell the guard captains before ye tell anyone else." },
      },
      choices = {
        { text = "I'll keep my ear to the stone for you.", next = "BACK", fx = { affinity = 2, standing = { ironforge = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "Ye're honest enough tae say it tae my face, an' I'll grant ye that much. I've seen what fel did tae the orcs an' what it's done tae the Dark Iron's masters, an' I dinnae want it in my halls, so tell me why I should." },
        { id = "wl_gnome", when = { race = "Gnome" },
          text = "A gnome wi' fel on yer hands, under my mountain. Gelbin vouches for his people, every one, but I'd like tae hear why ye went lookin' for that kind o' power before I vouch for ye myself." },
      },
      choices = {
        { text = "Power is a tool. I hold the chain.", next = "BACK", fx = { align = { light = -1 }, affinity = -2 } },
        { text = "I use it against the things that made it, Your Majesty.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Who in your hall would watch me?", next = "warlock_watch" },
      },
    },
    warlock_watch = {
      lines = {
        { id = "ww_default", text = "Rohan, if he takes a likin' tae ye, an' my guards whether he does or no'. Dinnae take it hard; I've buried too many friends tae trust a thing because it's polite." },
      },
      choices = {
        { text = "Fair, Your Majesty.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldier = {
      lines = {
        { id = "so_default", text = "Then ye know what I ask o' the Reserve, an' ye know I ask too much o' it. Half the Ward's gone south tae the Alliance's wars an' the other half's guardin' the Span an' the loch, so a warrior on the road is one more axe I dinnae have at home." },
        { id = "so_ward", when = { origin = "dwarf_military_ward" },
          text = "I've seen yer name on a roster, I think, or yer da's. The Military Ward breeds good soldiers an' then I send them away from it, an' some nights I wonder whether it's a king's work or a fool's." },
      },
      choices = {
        { text = "The road needs axes too, Your Majesty.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Call me home and I'll come.", next = "BACK", fx = { align = { order = 1 }, affinity = 2, standing = { ironforge = 1 } } },
        { text = "Where's the line thinnest?", next = "reserve" },
      },
    },
    kaldorei = {
      lines = {
        { id = "ke_default", text = "Does it, now! Tell the Darnassians they're welcome under the mountain whenever they've had their fill o' trees, an' that my League's been diggin' in their Darkshore wi' every permission we could get. Mostly every permission." },
      },
      choices = {
        { text = "My people are wary of digging, Your Majesty.", next = "kaldorei_dig" },
        { text = "The Alliance is stronger with both our peoples.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kaldorei_dig = {
      lines = {
        { id = "kd_default", text = "I've heard, an' I've heard why. Ye've had your share o' things comin' up out o' the ground ye wish had stayed down, an' so have we, so I'll tell Magellas tae ask twice before he digs once." },
      },
      choices = {
        { text = "Some things should stay buried, Your Majesty.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Better to know what's down there, Your Majesty.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
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
    gnomeregan = { { id = "tp_gnomeregan", text = "A good city, poisoned from inside. Mekkatorque blames himself for it, an' I'd take that off his shoulders if he'd let me." } },
    explorers_league = { { id = "tp_league", text = "The League was my idea, an' my best one. Ask Magellas; he'll agree wi' me, at length." } },
    frostmane = { { id = "tp_frostmane", text = "Grelin's business, an' the Senate's. I keep my own counsel on the Frostmane. They've cost my house more than a few sheep." } },
    troggs = { { id = "tp_troggs", text = "Up from the deep places, into Gnomeregan first an' now our quarries. Somethin' woke them. I'd like tae know what before it wakes worse." } },
    defias = { { id = "tp_defias", text = "Stormwind's thieves? That's the humans' business, an' we've our own rot in the mountain tae deal with." } },
    westfall = { { id = "tp_westfall", text = "Farmland, isn't it? Never trust ground ye cannae dig a decent tunnel through." } },
    magni = { { id = "tp_magni", text = "Aye, that's me, an' I'll no' pretend tae be humble about it, for a king who cannae stand behind his own name has nae business wearin' a crown." } },
    thrall = { { id = "tp_thrall", text = "The orc lad who broke the internment camps an' took his people across the sea. I fought his kind through the whole Second War an' I've no' forgotten it, but I'll grant he's kept tae his side o' the water, mostly." }, { id = "tp_thrall2", when = { faction = "Horde" }, text = "Ye carry his colors intae my throne room an' expect a kind word? He's a canny leader, I'll give him that, an' he'll get nae more from me while his warriors raid our caravans in Ashenvale." } },
    scourge = { { id = "tp_scourge", text = "The plague that ate Lordaeron whole, an' it's still hungry. My brother Muradin went north wi' Prince Arthas an' never came home, so ye'll forgive me if I take the Scourge a wee bit personal." } },
    arthas = { { id = "tp_arthas", text = "I knew him as a lad, a fine golden prince wi' a hard swing, an' I'd have sworn by him. Now he's a traitor who murdered his own father an' rides wi' the dead, an' my brother was lost on his errand." } },
    bolvar = { { id = "tp_bolvar", text = "A solid man, Fordragon, an' he holds Stormwind together wi' both hands while the lad's too young tae hold it himself. I'd trust him wi' my back in a fight, which is more than I'll say for some o' that court." } },
    varian = { { id = "tp_varian", text = "Wrynn went off tae parley an' never arrived, an' Stormwind's been runnin' on a boy an' a regent ever since. I've sent my own riders askin', an' I've had nothin' back but shrugs." } },
    prestor = { { id = "tp_prestor", text = "The Lady Prestor has the ear o' the whole Stormwind court, an' the court's been mighty slow tae answer my letters since she arrived. Make o' that what ye like; I'm a dwarf, an' I just count the letters." } },
    wildhammer = { { id = "tp_wildhammer", text = "Cousins, stubborn as rams an' twice as loud, wi' their gryphons an' their tattoos up in the Hinterlands. We've had our quarrels since the War o' the Three Hammers, but when the orcs came they flew wi' us, an' that counts." } },
    grim_batol = { { id = "tp_grim_batol", text = "The Three Hammers war left Grim Batol cursed when the Dark Iron sorceress Modgud died at its gates. Then the Dragonmaw squatted in it, an' I'll no' send a dwarf back there for any gold." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "Thaurissan's spawn sit in their burnin' city under the mountain, an' my daughter Moira's down there wi' them. Dagran took her, an' I'll have her back if I have tae dig through the whole Searing Gorge wi' my own hands." } },
    jaina = { { id = "tp_jaina", text = "Proudmoore's lass is a fine sorceress an' a braver soul than her father ever gave her credit for. She keeps Theramore open tae all comers, an' I'll trust her judgement on the orcs before I'll trust most." } },
    stromgarde = { { id = "tp_stromgarde", text = "Thoras Trollbane was a hard old wolf an' a good friend tae Ironforge, an' his kingdom deserved better than ogres an' bandits in its halls. I've sent what I can spare tae Refuge Pointe, though it's never enough." } },
    dalaran = { { id = "tp_dalaran", text = "I'll be glad tae see the wizards' city standin' again, though I'd be gladder still if they opened their gates a wee bit faster. Mages like their walls, an' I suppose after what Archimonde did tae them, ye cannae blame them." } },
    _none = { { id = "tp_none", text = "Ask the Explorers' League. They know a wee bit about everythin', an' they'll tell ye all of it." } },
  },
}
