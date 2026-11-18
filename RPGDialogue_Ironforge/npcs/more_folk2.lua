-- More Dun Morogh folk: Beldin Steelgrill and Milli Featherwhistle at Steelgrill's Depot, Tharek Blackstone and
-- Granis Swiftaxe in Kharanos, and the Anvilmar trainers Thran Khorman, Thorgas Grimson, Bromos Grummner and Solm Hargrin.
-- Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Beldin Steelgrill: siege engine technician who runs Steelgrill's Depot and wears out tools by the crate.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_beldin", id = TODO_NPC("Beldin Steelgrill"), name = "Beldin Steelgrill",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh" }, temper = { "proud", "busy" }, values = { "craft", "practical" },
  notices = { "race", "craft" },
  impression = {
    first = "He goes through tools faster than anyone can make them.",
    third = "{name} met Beldin Steelgrill, the siege engine technician who runs Steelgrill's Depot outside Kharanos.",
  },
  greetings = {
    { id = "g_hi", text = "Mind yer feet, there's a gear train on the ground there an' it cost more than yer boots. What can I do for ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Back at the Depot, are ye? Good, for I've always somethin' that needs carryin' or fetchin'." },
    { id = "g_tools", when = { questActive = TODO_QUEST("Tools for Steelgrill") }, text = "Is that Tharek's crate under yer arm? Bless the man, I've been tightenin' bolts wi' my teeth since Tuesday." },
    { id = "g_visit", when = { questActive = TODO_QUEST("A Visitor to Dun Morogh") }, text = "Have ye been up tae that fire in the Tundrid Hills yet? I'd like tae know who's watchin' my Depot from up there." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Half my best hands are gnomes since Gnomeregan fell, an' they've taught me more about gearing than I'll ever admit tae their faces." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Ye've the burnt eyebrows o' an engineer. Don't touch the Trollplow; Stonegear's very particular about who touches the Trollplow." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Beldin Steelgrill, an' this is my Depot. I build an' mend the siege engines that keep the Frostmane an' the troggs honest, an' there's no finer technician in Khaz Modan, though I'll let my work say so." },
        { id = "h_done", when = { questDone = TODO_QUEST("Tools for Steelgrill") }, text = "That crate o' Tharek's tools has already lost two spanners an' a hammer tae the snow. I'll be needin' another one soon, I expect." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The Trollplow's boiler won't fix itself." },
        { id = "h_again2", text = "Go on, I can listen an' hammer at the same time." },
      },
      choices = {
        { text = "What are you building here?", next = "engines" },
        { text = "You must go through a lot of tools.", next = "tools" },
        { text = "Who's watching from the hills?", next = "watcher" },
        { text = "Do gnomes really work on your engines?", next = "gnomes", when = { race = "Gnome" } },
        { text = "I'll let you work, Beldin.", next = "END" },
      },
    },
    engines = {
      lines = { { id = "en_default", text = "Steam tanks, mostly, an' the odd ram-driven cannon carriage, an' Pilot Stonegear's Trollplow, which is the pride o' the Depot. The army takes them as fast as I can build them, an' sends them back broken just as fast." } },
      choices = {
        { text = "Where does the army take them?", next = "engines_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    engines_where = {
      lines = { { id = "ew_default", text = "Wherever the Dark Irons are pushin', an' that's more places every year. Loch Modan, the Wetlands, the passes south toward the Searing Gorge; my engines have been everywhere my feet have never gone." } },
      choices = {
        { text = "Do you ever wish you'd gone with them?", next = "engines_wish" },
        { text = "Something else.", next = "BACK" },
      },
    },
    engines_wish = {
      big = true,
      lines = { { id = "ewi_default", text = "Every time one comes back wi' a crack in the boiler, aye, for I'd like tae see what did it. But somebody has tae stay an' mend them, an' I'm better wi' a spanner than an axe. Would ye stay, or go?" } },
      choices = {
        { text = "Stay. Somebody has to keep the machines running.", next = "BACK", reply = "That's how I tell myself, an' most days I believe it. The Depot needs a steady hand.", fx = { align = { order = 1 } } },
        { text = "Go. You'd build better if you'd seen the front.", next = "BACK", reply = "Ye might be right, an' that's what keeps me up at night. Maybe someday.", fx = { align = { order = -1 } } },
      },
    },
    tools = {
      lines = { { id = "to_default", text = "More than any dwarf alive, an' poor Tharek Blackstone in Kharanos makes most o' them. He's the best toolsmith in the valley, an' I keep him so busy his wife has started sendin' me letters." } },
      choices = {
        { text = "Maybe give him a rest?", next = "tools_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tools_rest = {
      lines = { { id = "tr_default", text = "A rest! The Frostmane don't rest, an' neither do my engines. Still, I'll send him a keg o' Thunderbrew this winter, for I'm no' heartless." } },
      choices = { { text = "That's decent of you.", next = "BACK", fx = { affinity = 1 } } },
    },
    watcher = {
      lines = { { id = "wa_default", text = "There's been a fire burnin' up in the Tundrid Hills these last weeks, an' nobody's come down tae say who lit it. It might be a friend, an' it might be a Dark Iron spy, an' I'd like tae know which before I sleep easy." } },
      choices = { { text = "I'll keep an eye out.", next = "BACK" } },
    },
    gnomes = {
      big = true,
      lines = { { id = "gn_default", text = "They do, an' they're the best hands I've ever had, though they talk the whole time an' half o' it's numbers. Tell me true, do ye think your people will ever go back tae Gnomeregan?" } },
      choices = {
        { text = "We will. Mekkatorque swears it, and so do I.", next = "BACK", reply = "Then I'll build ye the engines tae do it, an' gladly. Ye'll need a bigger Trollplow.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "No. That city is dead, and we should move on.", next = "BACK", reply = "That's a hard thing tae say about home, an' I'll no' argue wi' ye. Ye're welcome here as long as ye like.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    gnomeregan = { { id = "tp_gnomer", text = "A terrible loss, an' my Depot's the better for the gnomes who came out o' it, which I hate tae say." } },
    background = { { id = "tp_bg", text = "I'm a technician, an' a good one. That's all ye need tae know." } },
    _none = { { id = "tp_none", text = "If it doesnae have a boiler or a gear, I'm no' the one tae ask." } },
  },
}

---------------------------------------------------------------------------
-- Tharek Blackstone: overworked Kharanos toolsmith whose best customer is Beldin Steelgrill.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_tharek", id = TODO_NPC("Tharek Blackstone"), name = "Tharek Blackstone",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh" }, temper = { "weary", "grumbling" }, values = { "craft", "honest" },
  notices = { "craft", "class" },
  impression = {
    first = "He grumbles about Steelgrill constantly and would be lost without the work.",
    third = "{name} met Tharek Blackstone, an overworked toolsmith in Kharanos who makes most of Steelgrill's Depot's tools.",
  },
  greetings = {
    { id = "g_hi", text = "If ye're from Steelgrill, tell him I'm workin' as fast as I can, an' if ye're no', I'm still workin' as fast as I can." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, I've another crate for the Depot an' my legs are done for the day." },
    { id = "g_done", when = { questDone = TODO_QUEST("Tools for Steelgrill") }, text = "Ye got the tools tae Beldin in one piece, which is more than my last apprentice managed. Thank ye kindly." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! I don't suppose ye'd fancy makin' a few dozen spanners in yer spare time? No, I thought no'." },
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, eh? Ye've arms on ye like a forge hand, an' I could use a pair o' those." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tharek Blackstone, toolsmith. I make hammers, spanners, wrenches an' the like for the whole valley, but mostly for Beldin Steelgrill, who breaks them faster than the frost does." },
        { id = "h_active", when = { questActive = TODO_QUEST("Tools for Steelgrill") }, text = "Ye've the crate? Good, then off ye go tae Steelgrill's Depot, east along the road, an' don't let him tell ye they're late." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I file; I've no time tae stop." },
        { id = "h_again2", text = "Go on, I'm listenin', mostly." },
      },
      choices = {
        { text = "Do you need a delivery made?", next = "delivery" },
        { text = "Steelgrill must keep you busy.", next = "beldin" },
        { text = "Kharanos seems a quiet place for a smith.", next = "town" },
        { text = "Good day, Tharek.", next = "END" },
      },
    },
    delivery = {
      lines = { { id = "de_default", text = "I always need a delivery made, for my legs are too old an' my apprentice is too slow. There's a crate o' tools for Steelgrill's Depot, if ye're headin' east." } },
      choices = {
        { text = "What's in the crate?", next = "delivery_crate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    delivery_crate = {
      lines = { { id = "dc_default", text = "Spanners, wrenches, a set o' fine files an' a pry bar Beldin swears he needs, though I think he uses it tae open his ale. Mind ye don't drop it; the files will bend." } },
      choices = {
        { text = "What if I keep a spanner for myself?", next = "delivery_keep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    delivery_keep = {
      big = true,
      lines = { { id = "dk_default", text = "Then Beldin will count them, find one short, an' send me a letter about it that's longer than the crate. Ye wouldnae do that tae an old dwarf, would ye?" } },
      choices = {
        { text = "Of course not. Every tool arrives.", next = "BACK", reply = "Good, then ye're a better sort than my apprentice.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "He'll never notice one spanner.", next = "BACK", reply = "He notices everythin', an' then he notices me. Leave the spanners be, please.", fx = { align = { honor = -1 } } },
      },
    },
    beldin = {
      lines = { { id = "be_default", text = "Busy? He keeps me so busy my wife says she's forgotten my face. But he pays on time, an' he says my tools are the only ones that'll take the cold, an' that's worth hearin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    town = {
      lines = { { id = "to_default", text = "Quiet? Kharanos has the Thunderbrew Distillery, the troggs comin' up from the old tunnel, an' every young dwarf in the valley passin' through tae Ironforge. It's quiet like a forge is quiet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I make tools. Good ones, too." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, friend. I've been in the forge all day." } },
  },
}

---------------------------------------------------------------------------
-- Milli Featherwhistle: mechanostrider merchant at Steelgrill's Depot who builds her own stock.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_milli", id = TODO_NPC("Milli Featherwhistle"), name = "Milli Featherwhistle", title = "Mechanostrider Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "dunmorogh", "gnomeregan" }, temper = { "cheerful", "proud" }, values = { "craft", "gnomeregan" },
  notices = { "race" },
  impression = {
    first = "She only sells to gnomes or those the gnomes trust.",
    third = "{name} met Milli Featherwhistle, the gnome who builds and sells mechanostriders at Steelgrill's Depot.",
  },
  greetings = {
    { id = "g_hi", text = "Hello, hello! Mind the red one, it bites, figuratively speaking, but it does have a sticky clutch." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! The blue one's been asking after you, which is to say its gyroscope wobbles when you leave." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Every strider in this pen was built to Mekkatorque's designs, with a few of my own improvements, of course." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Milli Featherwhistle, and these are my mechanostriders, every one built by my own hands. I'm afraid I only sell them to gnomes or to those Gnomeregan counts as a true friend, for they're not just machines, you see." },
        { id = "h_gnome", when = { any = { { race = "Gnome" }, { reputation = { faction = "Gnomeregan", min = "exalted" } } } }, text = "Ah, a proper customer! Have a look, have a look, and if you want to test the gears, the green one's had its brakes seen to." },
      },
      again = {
        { id = "h_again", text = "What else? I've a gyroscope to calibrate, but I can talk while I do it." },
        { id = "h_again2", text = "Go on, ask anything about striders." },
      },
      choices = {
        { text = "Show me your mechanostriders.", next = "BUSINESS", when = { any = { { race = "Gnome" }, { reputation = { faction = "Gnomeregan", min = "exalted" } } } } },
        { text = "Why only sell to gnomes?", next = "gnomes" },
        { text = "How do you build them?", next = "build" },
        { text = "Goodbye, Milli.", next = "END" },
      },
    },
    gnomes = {
      lines = { { id = "gn_default", text = "Because they're the last thing Gnomeregan made before it fell, near enough, and every one carries a bit of home in it. I'll sell to anyone who's done right by my people, but not to just anyone off the road." } },
      choices = {
        { text = "That seems unfair to other folk.", next = "gnomes_fair" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes_fair = {
      big = true,
      lines = { { id = "gf_default", text = "Perhaps it is, but we lost a city, and these are what's left of it. Wouldn't you guard something like that?" } },
      choices = {
        { text = "I would. Guard them well.", next = "BACK", reply = "Thank you, I will. Prove yourself to Gnomeregan and I'll sell you one gladly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No. Share them, and more will help your people.", next = "BACK", reply = "That's a thought, I suppose, and not a bad one. I'll consider it, maybe.", fx = { align = { order = -1 } } },
      },
    },
    build = {
      lines = { { id = "bu_default", text = "Gyroscopes for balance, a steam boiler for the legs, and a great deal of patience for the calibration. It's taken me three years to perfect the stride, and they still trip on ice sometimes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gnomeregan = { { id = "tp_gnomer", text = "Home, and we'll have it back one day. Until then, I build striders." } },
    background = { { id = "tp_bg", text = "I'm a gnome who builds mechanostriders, and I'm very good at it." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, unless it's about gears." } },
  },
}

---------------------------------------------------------------------------
-- Granis Swiftaxe: warrior trainer in the Thunderbrew Distillery; sends warriors to Muren Stormpike.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_granis", id = TODO_NPC("Granis Swiftaxe"), name = "Granis Swiftaxe", title = "Warrior Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "blunt", "hearty" }, values = { "brave", "honest" },
  notices = { "class" },
  impression = {
    first = "He is quick with an axe and quicker with a joke.",
    third = "{name} met Granis Swiftaxe, the warrior trainer in the Thunderbrew Distillery in Kharanos.",
  },
  greetings = {
    { id = "g_hi", text = "Ho, there! Mind the barrels; I've knocked over more than one wi' a backswing." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior! Come in, come in, an' let's see what ye've learned since Anvilmar." },
  },
  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "Ye stand well, but ye lean on yer back foot. Fix that, or a troll will fix it for ye." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Granis Swiftaxe, warrior trainer, an' I've taught half the fighters in Kharanos how tae hold an axe proper. The other half learned from Thran Khorman up at Anvilmar, an' I fix their habits when they get here." },
        { id = "h_muren", when = { class = "WARRIOR", minLevel = 10 }, text = "Ye've grown since Anvilmar, I can see it. It's time ye went up tae Ironforge an' saw Muren Stormpike in the Hall o' Arms; he'll have a proper test for ye." },
      },
      again = {
        { id = "h_again", text = "What else? Speak quick, the distillery's busy." },
        { id = "h_again2", text = "Go on, I'm all ears." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Who's Muren Stormpike?", next = "muren" },
        { text = "Training in a distillery?", next = "brewery" },
        { text = "Farewell, Granis.", next = "END" },
      },
    },
    muren = {
      lines = { { id = "mu_default", text = "A Stormpike an' a hard old warrior who tests the young ones in Ironforge. He's tough, an' fair, an' he doesnae suffer fools, so mind yer manners." } },
      choices = {
        { text = "What kind of test?", next = "muren_test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    muren_test = {
      big = true,
      lines = { { id = "mt_default", text = "He'll send ye after somethin' dangerous, most likely a troll in the high snows. Some say it's cruel tae send youngsters out like that; what d'ye think?" } },
      choices = {
        { text = "It's how warriors are made. It's right.", next = "BACK", reply = "That's what I believe too. Go on, then, when ye're ready.", fx = { align = { order = 1 } } },
        { text = "It's cruel. Train them more first.", next = "BACK", reply = "Maybe, but a warrior who's never been tested is no warrior at all.", fx = { align = { order = -1 } } },
      },
    },
    brewery = {
      lines = { { id = "br_default", text = "Aye, an' why not? The Thunderbrews let me use the back room, an' the warriors get a mug after trainin'. Best arrangement in Khaz Modan." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a warrior an' a trainer, an' I like my ale." } },
    _none = { { id = "tp_none", text = "No idea, friend, but I'll fight it if ye like." } },
  },
}

---------------------------------------------------------------------------
-- Thran Khorman: warrior trainer at Anvilmar, the first teacher for Coldridge recruits.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_thran", id = TODO_NPC("Thran Khorman"), name = "Thran Khorman", title = "Warrior Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "gruff", "patient" }, values = { "duty", "brave" },
  notices = { "class" },
  impression = {
    first = "He is gruff with recruits, but he is patient.",
    third = "{name} met Thran Khorman, the warrior trainer at Anvilmar.",
  },
  greetings = {
    { id = "g_hi", text = "Another recruit, eh? Stand up straight an' let me have a look at ye." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "Back for more, are ye? Good. A warrior who stops learnin' stops livin'." },
    { id = "g_rune", when = { questActive = TODO_QUEST("Simple Rune") }, text = "Sten sent ye wi' a rune, did he? Hand it over an' let's get started." },
  },
  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "Yer grip's too tight. Loosen it, or ye'll tire before the troll does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thran Khorman, an' I train warriors here at Anvilmar. Most o' ye come here green as moss, an' I send ye out tae fight the Frostmane an' the troggs wi' a bit more sense." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, I've recruits tae drill." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What's the first lesson?", next = "lesson" },
        { text = "What's out in Coldridge Valley?", next = "valley" },
        { text = "Farewell, Thran.", next = "END" },
      },
    },
    lesson = {
      lines = { { id = "le_default", text = "Never turn yer back on a troll, an' never trust a trogg tae stay dead. The rest ye'll learn by doin'." } },
      choices = {
        { text = "That's it? No sword drills?", next = "lesson_drills" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson_drills = {
      big = true,
      lines = { { id = "ld_default", text = "Drills come later. First ye need tae want tae stay alive more than ye want tae look brave. Which matters more tae ye, livin' or lookin' good?" } },
      choices = {
        { text = "Living. Glory is for the dead.", next = "BACK", reply = "That's a good answer, an' it means ye might survive the year.", fx = { align = { honor = -1 } } },
        { text = "Fighting well, even if it costs me.", next = "BACK", reply = "Brave an' foolish, an' I like ye for it, but be careful out there.", fx = { align = { honor = 1 } } },
      },
    },
    valley = {
      lines = { { id = "va_default", text = "Frostmane trolls tae the west, troggs in the caves, an' wolves wherever ye least want them. Grelin Whitebeard's camped out watchin' the trolls, if ye want a real fight." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a warrior trainer. I've been one for longer than ye've been alive." } },
    _none = { { id = "tp_none", text = "No idea, an' I don't care much either." } },
  },
}

---------------------------------------------------------------------------
-- Thorgas Grimson: hunter trainer at Anvilmar; thick accent, believes in learning in the field.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_thorgas", id = TODO_NPC("Thorgas Grimson"), name = "Thorgas Grimson", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "laconic", "wise" }, values = { "nature", "patient" },
  notices = { "class" },
  impression = {
    first = "His accent is so thick other dwarves ask him to repeat himself.",
    third = "{name} met Thorgas Grimson, the hunter trainer at Anvilmar.",
  },
  greetings = {
    { id = "g_hi", text = "Wot kin I do fer ye? If it's trainin' ye're after, ye've come tae the right dwarf." },
    { id = "g_hunt", when = { class = "HUNTER" }, text = "Back frae the snow, are ye? Good; let's see wot ye've learned oot there." },
    { id = "g_rune", when = { questActive = TODO_QUEST("Etched Rune") }, text = "Sten's rune, is it? Gie it here, an' we'll get ye started." },
  },
  notice = {
    { id = "n_hunt", cat = "class", when = { class = "HUNTER" },
      text = "Ye've the eye o' a hunter, or ye will hae, wi' time." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thorgas Grimson, hunter trainer, an' I'll tell ye straight: the best trainin' is oot in the snow. I can teach ye the basics, but the wolves an' the boars will teach ye the rest." },
        { id = "h_nonhunt", when = { class = { "WARRIOR", "PALADIN", "ROGUE", "PRIEST", "MAGE", "WARLOCK" } }, text = "I kinnae help ye wi' trainin', fer ye're no hunter. Ye should look fer yer own trainer, though I'll talk a wee while if ye like." },
      },
      again = {
        { id = "h_again", text = "Wot else, then?" },
        { id = "h_again2", text = "Go on, speak up." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Why learn in the field?", next = "field" },
        { text = "What's good hunting nearby?", next = "hunting" },
        { text = "Farewell, Thorgas.", next = "END" },
      },
    },
    field = {
      lines = { { id = "fi_default", text = "Because a wolf doesnae read books, an' neither does a troll. Ye learn tae track by trackin', an' tae shoot by shootin', an' there's nae other way." } },
      choices = {
        { text = "Some say books help.", next = "field_books" },
        { text = "Something else.", next = "BACK" },
      },
    },
    field_books = {
      big = true,
      lines = { { id = "fb_default", text = "Some say a lot o' things. Tell me, wot d'ye trust more, yer own eyes or someone else's words?" } },
      choices = {
        { text = "My own eyes. Experience is the best teacher.", next = "BACK", reply = "Aye, that's the hunter's way.", fx = { align = { order = -1 } } },
        { text = "The wisdom of others. Why make their mistakes?", next = "BACK", reply = "Hmph. Fair, maybe, but ye'll still learn more in the snow.", fx = { align = { order = 1 } } },
      },
    },
    hunting = {
      lines = { { id = "hu_default", text = "Wolves in the valley, boars on the hills, an' the odd bear if ye're brave. Start wi' the wolves, an' mind their teeth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a hunter, an' I train hunters. Nae more tae it." } },
    _none = { { id = "tp_none", text = "I kinnae help ye wi' that, friend." } },
  },
}

---------------------------------------------------------------------------
-- Bromos Grummner: paladin trainer at Anvilmar; stresses the dwarf-human brotherhood of the Silver Hand.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_bromos", id = TODO_NPC("Bromos Grummner"), name = "Bromos Grummner", title = "Paladin Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "confident", "warm" }, values = { "faith", "alliance" },
  notices = { "class", "race" },
  impression = {
    first = "He is confident, warm, and a little too fond of speeches.",
    third = "{name} met Bromos Grummner, the paladin trainer at Anvilmar.",
  },
  greetings = {
    { id = "g_hi", text = "The Light be with ye, friend! Come in, come in." },
    { id = "g_pal", when = { class = "PALADIN" }, text = "Welcome back, young paladin. The Light shines on ye today, I can tell." },
    { id = "g_rune", when = { questActive = TODO_QUEST("Consecrated Rune") }, text = "A consecrated rune from Sten! Good, then it's time ye began yer trainin' proper." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human, out here in the snow! The Silver Hand was founded by your people, an' it's an honour tae have ye." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bromos Grummner, paladin trainer, an' a proud member o' the Silver Hand. Dwarves an' humans fought side by side in the Second War, an' the Light bound us together in a way no treaty ever could." },
      },
      again = {
        { id = "h_again", text = "What else? The Light is patient, an' so am I." },
        { id = "h_again2", text = "Go on, then, ask away." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Tell me about the Silver Hand.", next = "hand" },
        { text = "Why do dwarves follow a human order?", next = "why" },
        { text = "Farewell, Bromos.", next = "END" },
      },
    },
    hand = {
      lines = { { id = "ha_default", text = "It was founded by the Archbishop Alonsus Faol an' Uther the Lightbringer tae fight the Horde in the Second War. Dwarves joined from the start, an' we've been proud tae serve." } },
      choices = {
        { text = "And now that Uther is gone?", next = "hand_uther" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hand_uther = {
      big = true,
      lines = { { id = "hu_default", text = "We mourn him, an' we carry on, for the Light didnae die wi' him. Do ye think the Hand can be what it was?" } },
      choices = {
        { text = "It can. We just need to keep faith.", next = "BACK", reply = "Aye, that's the spirit! The Light never abandons the faithful.", fx = { align = { light = 1 } } },
        { text = "No. Its time has passed.", next = "BACK", reply = "Ye may be right, an' it grieves me tae hear it, but I'll no' stop believin'.", fx = { align = { light = -1 } } },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because the Light doesnae care who ye are, only wot ye do. An' because the humans saved us in the Second War, an' we don't forget a debt." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a paladin o' the Silver Hand, an' I train the young ones." } },
    _none = { { id = "tp_none", text = "I cannae say, friend, but the Light might know." } },
  },
}

---------------------------------------------------------------------------
-- Solm Hargrin: rogue trainer at Anvilmar; believes in honour among thieves.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_solm", id = TODO_NPC("Solm Hargrin"), name = "Solm Hargrin", title = "Rogue Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "sly", "principled" }, values = { "honor", "loyal" },
  notices = { "class" },
  impression = {
    first = "He insists there's honour among thieves, and he may be joking.",
    third = "{name} met Solm Hargrin, the rogue trainer at Anvilmar.",
  },
  greetings = {
    { id = "g_hi", text = "Didnae hear ye come in, which is either a compliment or a warnin'. What d'ye want?" },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one o' mine. Ye're quieter than last time, I'll give ye that." },
    { id = "g_rune", when = { questActive = TODO_QUEST("Encrypted Rune") }, text = "Sten's rune, is it? Good; let's see if ye can read it." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ye walk like ye're tryin' no' tae be heard, an' that's half the battle." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Solm Hargrin, an' I train rogues. Folk think we're all thieves an' cutthroats, but a rogue wi' honour is worth ten soldiers when the kingdoms are at each other's throats." },
      },
      again = {
        { id = "h_again", text = "What else? Speak quiet, for these walls have ears." },
        { id = "h_again2", text = "Go on, then, but keep yer voice down." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Honour among thieves? Really?", next = "honor" },
        { text = "Why does Ironforge need rogues?", next = "need" },
        { text = "Farewell, Solm.", next = "END" },
      },
    },
    honor = {
      lines = { { id = "ho_default", text = "Aye, really. A rogue who betrays his own is no better than a Dark Iron, an' I'll no' train one. Ye steal from the enemy, no' from yer friends." } },
      choices = {
        { text = "And if a friend betrays you first?", next = "honor_betray" },
        { text = "Something else.", next = "BACK" },
      },
    },
    honor_betray = {
      big = true,
      lines = { { id = "hb_default", text = "Then they were never a friend, an' ye deal wi' them as ye see fit. What would ye do?" } },
      choices = {
        { text = "Forgive them, once. Everyone deserves a chance.", next = "BACK", reply = "That's kind, maybe too kind, but I respect it all the same.", fx = { align = { light = 1 } } },
        { text = "Make sure they never do it again.", next = "BACK", reply = "Spoken like a true rogue. Mind ye don't enjoy it too much.", fx = { align = { light = -1 } } },
      },
    },
    need = {
      lines = { { id = "ne_default", text = "Because the Dark Irons have spies, an' the Horde has spies, an' even our friends in Stormwind have spies. Somebody has tae watch the watchers, an' it might as well be us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a rogue trainer. That's all ye need tae know." } },
    _none = { { id = "tp_none", text = "No' my business, an' no' yours either." } },
  },
}
