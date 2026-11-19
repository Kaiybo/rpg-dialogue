-- More Dun Morogh folk: Beldin Steelgrill and Milli Featherwhistle at Steelgrill's Depot, Tharek Blackstone and
-- Granis Swiftaxe in Kharanos, and the Anvilmar trainers Thran Khorman, Thorgas Grimson, Bromos Grummner and Solm Hargrin.
-- Also (added later): Lomac Gearstrip, Hands Springsprocket, Tannok Frosthammer, Mountaineer Barleybrew and seven Ironforge vendors.
-- Second pass: Ironforge shopkeepers, supply vendors, profession and class trainers (see bibles/more_folk.md).
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
    { id = "g_night", when = { timeOfDay = "night" }, text = "Aye, I'm still at it, an' the lamp's burnin' Beldin's coin. What d'ye need at this hour?" },
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
        { id = "h_again3", text = "Ye're still here, an' the iron's still hot. Ask, an' pass me those tongs while ye're at it." },
        { id = "h_again", text = "What else? Talk while I file; I've no time tae stop." },
        { id = "h_again2", text = "Go on, I'm listenin', mostly." },
      },
      choices = {
        { text = "Do you need a delivery made?", next = "delivery" },
        { text = "Steelgrill must keep you busy.", next = "beldin" },
        { text = "Kharanos seems a quiet place for a smith.", next = "town" },
        { text = "Your apprentice gets a lot of blame.", next = "apprentice" },
        { text = "I work iron myself. Show me a spanner.", next = "smith", when = { profession = { "Blacksmithing", "Engineering" } } },
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
    apprentice = {
      lines = { { id = "ap_default", text = "He earns every word o' it. The lad's willin' enough, but he took a crate tae the Depot last month by way o' the Thunderbrew Distillery, an' it was the next mornin' before either o' them arrived." } },
      choices = {
        { text = "Kharanos does have its temptations.", next = "apprentice_kharanos" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apprentice_kharanos = {
      lines = { { id = "ak_default", text = "It has the one, an' it's a big one wi' barrels in it. I cannae blame the lad overmuch, for Innkeeper Belm's fire is warmer than my forge an' the company's better than mine." } },
      choices = {
        { text = "Go easy on him. He'll learn.", next = "BACK", reply = "Aye, I suppose I was no better at his age, though I'll thank ye no' tae tell him that.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = {
        { id = "sm_default", text = "Here, feel the weight o' that. I draw the jaws out thick an' temper them soft, for a hard spanner snaps in the cold an' a soft one only bends, an' ye can bend it back." },
        { id = "sm_eng", when = { profession = "Engineering" }, text = "An engineer, are ye? Then ye're the sort who breaks these. Feel the jaws on that one: I temper them soft so they bend in the frost instead o' snappin', an' ye can thank me later." },
      },
      choices = {
        { text = "That's good work, Tharek.", next = "BACK", reply = "It's honest work, which is better. But thank ye.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    steelgrill = { { id = "tp_steel", text = "Beldin Steelgrill runs the Depot east o' here, wi' the siege engines an' the gnomes. He's my best customer an' my worst, both at once." } },
    kharanos = { { id = "tp_khar", text = "A good wee town. Ye can get a tool, a meal an' a bed here, an' most folk only want two o' the three." } },
    background = { { id = "tp_bg", text = "I make tools, an' good ones too, for a pick that breaks in the deep can cost a miner more than his day's wages." } },
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
  notices = { "race", "craft" },
  impression = {
    first = "She only sells to gnomes or those the gnomes trust.",
    third = "{name} met Milli Featherwhistle, the gnome who builds and sells mechanostriders at Steelgrill's Depot.",
  },
  greetings = {
    { id = "g_gnome", when = { race = "Gnome" }, text = "Hello, hello, and welcome! The green one's warmed up, if you'd like to try the saddle." },
    { id = "g_exalted", when = { reputation = { faction = "Gnomeregan", min = "exalted" } }, text = "A true friend of Gnomeregan! I've heard what you've done for us, and my pen is open to you." },
    { id = "g_hi", text = "Hello, hello! Mind the red one, it bites, figuratively speaking, but it does have a sticky clutch." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! The blue one's been asking after you, which is to say its gyroscope wobbles when you leave." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Oh, good, you'll appreciate the knee joints, because I've redesigned them four times and nobody ever notices." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! You'll be wanting Veron Amberstill's rams, I expect, which are lovely animals if you don't mind a mount with opinions." },
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
        { id = "h_again3", text = "Ask away! Just step to the left a little, because the yellow one kicks when it's being oiled." },
        { id = "h_again", text = "What else? I've a gyroscope to calibrate, but I can talk while I do it." },
        { id = "h_again2", text = "Go on, ask anything about striders." },
      },
      choices = {
        { text = "Show me your mechanostriders.", next = "BUSINESS", when = { any = { { race = "Gnome" }, { reputation = { faction = "Gnomeregan", min = "exalted" } } } } },
        { text = "Why only sell to gnomes?", next = "gnomes" },
        { text = "How do you build them?", next = "build" },
        { text = "Steelgrill's Depot is a long way from Tinker Town.", next = "depot" },
        { text = "Tell me about those knee joints.", next = "knees", when = { profession = "Engineering" } },
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
    depot = {
      lines = { { id = "dp_default", text = "It is, but there's no room in Tinker Town to test a strider at full stride, and the snow out here is marvellous for finding faults. Beldin Steelgrill lets me keep the pen so long as my striders stay out of the way of his siege engines." } },
      choices = {
        { text = "And do they stay out of the way?", next = "depot_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    depot_stay = {
      lines = { { id = "ds_default", text = "Mostly! The red one walked into Pilot Bellowfiz's engine last week, but that was a clutch problem and I've very nearly fixed it. Beldin said several things in Dwarven that I've chosen not to translate." } },
      choices = {
        { text = "What happens to a strider on ice?", next = "depot_ice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    depot_ice = {
      lines = { { id = "di_default", text = "It does the splits, which is alarming for everyone and worst for the rider. I'm testing a wider foot with little studs on it, and Binjy has fallen off only twice this week, which is a forty percent improvement." } },
      choices = { { text = "I admire Binjy's courage.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    knees = {
      lines = { { id = "kn_default", text = "Oh, wonderful, somebody asked! The old joint was a simple hinge and it froze solid below a certain temperature, so mine has a sleeve and a grease channel and a tiny heating coil off the boiler. It adds two pounds and it's worth every ounce." } },
      choices = {
        { text = "A heating coil off the boiler. That's clever.", next = "BACK", reply = "Thank you! I've been waiting three years for someone to say so.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    mechanostriders = { { id = "tp_strider", text = "Two legs, one boiler and a gyroscope that does all the hard thinking. They're faster than they look and friendlier than a ram, though I would say that." } },
    steelgrill = { { id = "tp_steel", text = "Beldin is gruff and fair, and he's never once charged me for the pen. I mend his kettle in return, which breaks more often than you'd think." } },
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
  notices = { "class", "drunk", "race" },
  impression = {
    first = "He is quick with an axe and quicker with a joke.",
    third = "{name} met Granis Swiftaxe, the warrior trainer in the Thunderbrew Distillery in Kharanos.",
  },
  greetings = {
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have ye come for a lesson or a mug? Ye can have both, in that order." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The drill's done for the day an' the taps are open. Sit, an' talk if ye've a mind." },
    { id = "g_hi", text = "Ho, there! Mind the barrels; I've knocked over more than one wi' a backswing." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior! Come in, come in, an' let's see what ye've learned since Anvilmar." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ye've been at the Thunderbrew already, I see. Nae axe work for ye today, or ye'll have somebody's ear off." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Good tae see a dwarf wi' some road on {g:his|her} boots. The valley needs more o' ye out there an' fewer at the bar." },
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
        { id = "h_again3", text = "Ask on, but stand clear o' the swing, for I'm no' stoppin' the lesson for talk." },
        { id = "h_again", text = "What else? Speak quick, the distillery's busy." },
        { id = "h_again2", text = "Go on, I'm all ears." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Who's Muren Stormpike?", next = "muren" },
        { text = "Training in a distillery?", next = "brewery" },
        { text = "What's troubling Kharanos these days?", next = "trouble" },
        { text = "I've passed Muren's test.", next = "passed", when = { questDone = TODO_QUEST("Vejrek") } },
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
    trouble = {
      lines = { { id = "tb_default", text = "The Frostmane trolls have a camp in the hills tae the west, there's wendigo in the cave by the road, an' the troggs have come up at Gol'Bolar Quarry. It's a fine valley for a young warrior, for there's always somethin' needs hittin'." } },
      choices = {
        { text = "Which is the worst of them?", next = "trouble_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_worst = {
      lines = { { id = "tw_default", text = "The trolls, for they think an' the others don't. A wendigo comes straight at ye an' a trogg comes at ye in a mob, but a Frostmane will wait behind a drift till ye've walked past." } },
      choices = {
        { text = "How do you fight something that waits?", next = "trouble_wait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_wait = {
      lines = { { id = "ta_default", text = "Ye walk slow, ye keep yer shield arm tae the hillside, an' ye never chase the first one ye see, for he's the bait. Senir Whitebeard keeps count o' the trolls up at his camp, if ye want tae put that tae use." } },
      choices = { { text = "I'll remember it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    passed = {
      lines = { { id = "pa_default", text = "Did ye, by my beard! Then ye've done what a good many o' my students never managed, an' Muren doesnae hand that out for kindness. Have a mug on yer way out an' tell the Thunderbrews I said ye'd earned the seat." } },
      choices = { { text = "You taught me the footwork, Granis.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    anvilmar = { { id = "tp_anvil", text = "Where the young ones start, up in Coldridge. Thran sends them down tae me wi' the basics an' a few bad habits." } },
    thunderbrew = { { id = "tp_thunder", text = "Best distillery in Dun Morogh, whatever the Barleybrews tell ye. Ragnar runs it, an' he lets me drill in the back." } },
    frostmane = { { id = "tp_frost", text = "Ice trolls, an' older in these hills than we are. They'll no' leave, so we keep them back." } },
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
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' on yer own two feet. That's the first test passed." },
    { id = "g_hi", text = "Another recruit, eh? Stand up straight an' let me have a look at ye." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "Back for more, are ye? Good. A warrior who stops learnin' stops livin'." },
    { id = "g_rune", when = { questActive = TODO_QUEST("Simple Rune") }, text = "Sten sent ye wi' a rune, did he? Hand it over an' let's get started." },
  },
  notice = {
    { id = "n_green", cat = "class", when = { maxLevel = 5 },
      text = "Ye're as new as the mornin' snow. That's nae shame, for everybody in Ironforge started in this valley." },
    { id = "n_old", cat = "class", when = { minLevel = 20 },
      text = "Ye've been a long way since Coldridge, by the look o' that gear. It's good o' ye tae come back an' see where it began." },
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
        { id = "h_again3", text = "Ye've more questions than most recruits. That's no' a bad thing, so ask." },
        { id = "h_again", text = "What else? Make it quick, I've recruits tae drill." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What's the first lesson?", next = "lesson" },
        { text = "What's out in Coldridge Valley?", next = "valley" },
        { text = "Anvilmar looks like more than a barracks.", next = "anvilmar" },
        { text = "I started here, a long while back.", next = "back", when = { minLevel = 20, race = { "Dwarf", "Gnome" } } },
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
    anvilmar = {
      lines = { { id = "an_default", text = "It's the first hall most dwarves an' gnomes ever fight from, named for old King Anvilmar. We've trainers for every trade o' war under the one roof, an' Sten Stoutarm outside tae point the new ones at their first wolves." } },
      choices = {
        { text = "Who else teaches here?", next = "anvilmar_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anvilmar_who = {
      lines = { { id = "aw_default", text = "Thorgas Grimson has the hunters, though ye'll need tae listen hard tae follow him. Bromos Grummner has the paladins an' a speech for every occasion, an' Solm Hargrin has the rogues, wherever he's standin' at the minute." } },
      choices = {
        { text = "Do you all get along?", next = "anvilmar_along" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anvilmar_along = {
      lines = { { id = "aa_default", text = "Well enough, for there's nowhere else tae go when the snow's up. We argue over whose recruits did best against the troggs, an' Solm usually wins, because nobody can prove what his lot did." } },
      choices = { { text = "That sounds about right. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    back = {
      lines = { { id = "bk_default", text = "I thought I knew the face. I've sent hundreds out that door an' I cannae promise I remember every one, but I remember the ones who come back. What did the road teach ye that I didnae?" } },
      choices = {
        { text = "That you were right about trolls.", next = "BACK", reply = "Ha! I'm always right about trolls. It's good tae see ye whole.", fx = { affinity = 1 } },
        { text = "That there's always something bigger than you.", next = "BACK", reply = "Aye, there's the lesson I cannae teach in a valley this small. Ye learned it an' lived, an' that's the hard part.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    frostmane = { { id = "tp_frost", text = "Ice trolls, wi' a camp in the valley's west end. They were here before Anvilmar was, an' they've no' forgotten it." } },
    kharanos = { { id = "tp_khar", text = "Through the pass, when the pass is open. Granis Swiftaxe takes my recruits on from there, an' he's a sound teacher for all his ale." } },
    troggs = { { id = "tp_troggs", text = "Stupid, strong, an' never alone. Count them before ye swing, for there's always one more than ye thought." } },
    grelin = { { id = "tp_grelin", text = "Grelin Whitebeard watches the Frostmane from his camp tae the south-west. If he asks ye for somethin', he needs it." } },
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
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' ye've a bit mair snow in yer beard, or ye would hae if ye'd a beard. Wot news frae the valley?" },
    { id = "g_hi", text = "Wot kin I do fer ye? If it's trainin' ye're after, ye've come tae the right dwarf." },
    { id = "g_hunt", when = { class = "HUNTER" }, text = "Back frae the snow, are ye? Good; let's see wot ye've learned oot there." },
    { id = "g_rune", when = { questActive = TODO_QUEST("Etched Rune") }, text = "Sten's rune, is it? Gie it here, an' we'll get ye started." },
  },
  notice = {
    { id = "n_pet", cat = "class", when = { pet = { type = "Beast" } },
      text = "That's a braw beast ye've brought. {pet} has the look o' somethin' that's eaten well an' run far." },
    { id = "n_elf", cat = "class", when = { race = "NightElf" },
      text = "An elf, in Coldridge! Ye'll hae a bow, nae doubt. I'll no' hold it against ye, but dinnae ask me tae string it." },
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
        { id = "h_again3", text = "Ye're still here? Speak slow, then, an' I'll dae the same fer ye." },
        { id = "h_again", text = "Wot else, then?" },
        { id = "h_again2", text = "Go on, speak up." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Why learn in the field?", next = "field" },
        { text = "What's good hunting nearby?", next = "hunting" },
        { text = "Folk say your accent takes some getting used to.", next = "accent" },
        { text = "Rifle or bow, Thorgas?", next = "rifle", when = { class = "HUNTER" } },
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
        { text = "The wisdom of others. Their mistakes need not be mine.", next = "BACK", reply = "Hmph. Fair, maybe, but ye'll still learn more in the snow.", fx = { align = { order = 1 } } },
      },
    },
    hunting = {
      lines = { { id = "hu_default", text = "Wolves in the valley, boars on the hills, an' the odd bear if ye're brave. Start wi' the wolves, an' mind their teeth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    accent = {
      lines = { { id = "ac_default", text = "Dae they! Thran says the same, an' him frae nae further off than the next hill. I was raised high in the mountains where there's naebody tae talk tae but the rams, an' the rams never complained." } },
      choices = {
        { text = "What's hunting like, that high up?", next = "accent_high" },
        { text = "I follow you well enough.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    accent_high = {
      lines = { { id = "ah_default", text = "Thin air, deep snow, an' naethin' tae hide behind. Ye learn tae sit still fer half a day, fer the beast sees ye long afore ye see it, an' it's only yer patience that's longer than its own." } },
      choices = {
        { text = "And what did you hunt?", next = "accent_hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    accent_hunt = {
      lines = { { id = "at_default", text = "Wild rams, mostly, an' the snow leopards that hunt them. I never took a leopard that wasnae after my own kill, mind, fer there's room on a mountain fer two hunters." } },
      choices = { { text = "That's a fair way to hunt.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    rifle = {
      big = true,
      lines = { { id = "ri_default", text = "A dwarf'll tell ye rifle an' an elf'll tell ye bow, an' they're baith tellin' ye wot they grew up wi'. A rifle's loud an' it frights every beast in the valley, an' a bow's quiet an' asks more o' yer arm. Wot say ye?" } },
      choices = {
        { text = "The rifle. Do it the dwarven way.", next = "BACK", reply = "Aye, an' I'll no' argue wi' that. Keep yer powder oot the snow.", fx = { align = { order = 1 } } },
        { text = "Whatever suits the hunt. Tradition can wait.", next = "BACK", reply = "Hm. That's nae a bad answer, though I'd no' say it loud in Ironforge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    wolves = { { id = "tp_wolves", text = "They hunt in threes an' fours in the valley, an' the ane ye see is nae the ane tae fear. Watch the trees ahint ye." } },
    coldridge = { { id = "tp_cold", text = "A wee valley, an' a guid one tae learn in. There's wolves, boars, troggs an' trolls, an' nane o' them far frae the door." } },
    sten = { { id = "tp_sten", text = "Sten Stoutarm sorts the new ones an' sends them tae us wi' their runes. He's a guid lad, an' he speaks plainer than I dae." } },
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
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' welcome! I was just thinkin' o' somethin' I meant tae tell ye last time." },
    { id = "g_hi", text = "The Light be with ye, friend! Come in, come in." },
    { id = "g_pal", when = { class = "PALADIN" }, text = "Welcome back, young paladin. The Light shines on ye today, I can tell." },
    { id = "g_rune", when = { questActive = TODO_QUEST("Consecrated Rune") }, text = "A consecrated rune from Sten! Good, then it's time ye began yer trainin' proper." },
  },
  notice = {
    { id = "n_dpal", cat = "class", when = { class = "PALADIN", race = "Dwarf" },
      text = "A dwarf wi' the Light in {g:him|her}! We were few when the order began, an' every one o' ye makes the Hand a wee bit more ours." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Then we serve the same Light, friend, though ye do it wi' cleaner hands than mine." },
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
        { id = "h_again3", text = "Ye've more tae ask, an' I've more tae say. That's the best sort o' conversation." },
        { id = "h_again", text = "What else? The Light is patient, an' so am I." },
        { id = "h_again2", text = "Go on, then, ask away." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Tell me about the Silver Hand.", next = "hand" },
        { text = "Why do dwarves follow a human order?", next = "why" },
        { text = "You're fond of a speech, I'm told.", next = "speech" },
        { text = "You fought in the Second War yourself?", next = "war" },
        { text = "What should a young paladin fear most?", next = "fear", when = { class = "PALADIN" } },
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
    speech = {
      lines = { { id = "sp_default", text = "Who told ye that, Thran? Aye, well, he's no' wrong. A recruit who's cold, tired an' frightened o' troggs needs somethin' tae carry besides a hammer, an' words weigh nothin' at all." } },
      choices = {
        { text = "Do the words work?", next = "speech_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    speech_work = {
      lines = { { id = "sw_default", text = "On some. The rest nod politely an' learn it the hard way out in the snow, an' then they come back an' ask me tae say it again. I always do, an' I never say I told them so." } },
      choices = { { text = "That's patience, Bromos.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    war = {
      lines = { { id = "wr_default", text = "I did, as a young dwarf wi' a rifle an' no faith tae speak of. I saw human knights stand in a pass against the Horde wi' the Light shinin' off them, an' I decided there an' then what I wanted tae be." } },
      choices = {
        { text = "That's a long road from a rifle.", next = "war_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_road = {
      lines = { { id = "wd_default", text = "It was, an' the humans were patient wi' a stubborn dwarf who kept askin' why. I've tried tae be as patient wi' every recruit since, for that's how the debt gets paid." } },
      choices = { { text = "A good way to pay it. Something else.", next = "BACK" } },
    },
    fear = {
      lines = { { id = "fe_default", text = "Pride, {g:lad|lass}, an' nothin' else comes close. The undead will only kill ye, but pride will have ye thinkin' the Light is yours tae spend as ye please, an' I've watched that ruin better paladins than either of us." } },
      choices = { { text = "I'll keep watch for it.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    light = { { id = "tp_light", text = "It asks three things o' ye, respect, tenacity an' compassion, an' it asks them every day. Nane o' them get easier, but ye get stronger." } },
    uther = { { id = "tp_uther", text = "Uther the Lightbringer, first o' the order. We'll no' see his like again, but we can try tae be worth his memory." } },
    anvilmar = { { id = "tp_anvil", text = "A cold hall wi' a warm fire, an' the place where every dwarven paladin takes the first step. I'm proud tae stand in it." } },
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
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night's the proper time for a lesson. Step in, an' shut the door wi'out lettin' it click." },
    { id = "g_hi", text = "Didnae hear ye come in, which is either a compliment or a warnin'. What d'ye want?" },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one o' mine. Ye're quieter than last time, I'll give ye that." },
    { id = "g_rune", when = { questActive = TODO_QUEST("Encrypted Rune") }, text = "Sten's rune, is it? Good; let's see if ye can read it." },
  },
  notice = {
    { id = "n_gnome", cat = "class", when = { race = "Gnome" },
      text = "A gnome. Ye've a head start on the rest, for folk never look down, an' that's worth a year o' my lessons." },
    { id = "n_loud", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "I heard that armour comin' from the far side o' the hall. It's honest, I'll grant ye, but it's loud." },
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
        { id = "h_again3", text = "Still askin'? Fine, but stand out o' the lamplight when ye do it." },
        { id = "h_again", text = "What else? Speak quiet, for these walls have ears." },
        { id = "h_again2", text = "Go on, then, but keep yer voice down." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Honour among thieves? Really?", next = "honor" },
        { text = "Why does Ironforge need rogues?", next = "need" },
        { text = "A rogue trainer among paladins and warriors.", next = "anvilmar" },
        { text = "What's the first thing you teach?", next = "first" },
        { text = "What would you have me unlearn?", next = "unlearn", when = { class = "ROGUE" } },
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
    anvilmar = {
      lines = { { id = "an_default", text = "Aye, an' Bromos Grummner gives me a look every mornin' like I've been at the collection plate. Thran Khorman's fairer, for he's fought beside enough scouts tae know what we're for." } },
      choices = {
        { text = "And what are you for?", next = "anvilmar_for" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anvilmar_for = {
      lines = { { id = "af_default", text = "For knowin' how many troggs are in the cave before Thran's lot walk intae it, an' how many trolls are behind the drift. A warrior wins the fight, but somebody has tae tell him where it is." } },
      choices = { { text = "That's worth more than it sounds.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "fi_default", text = "Standin' still. Any fool can creep, but the young ones cannae bear tae hold a shadow for an hour while their feet go numb, an' that hour is the whole trade." } },
      choices = {
        { text = "And the second thing?", next = "first_second" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_second = {
      lines = { { id = "fs_default", text = "Leavin'. A rogue who gets in an' cannae get out is only a slow sort o' corpse, so I make them find three ways out o' every room in Anvilmar before I let them near a lock." } },
      choices = { { text = "Three ways out. I'll count them.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    unlearn = {
      lines = { { id = "un_default", text = "The habit o' lookin' at the thing ye want. Ye stare at a purse or a guard an' yer whole body points at it, an' anybody watchin' can read ye like a signpost. Look at the wall beside it, an' let yer hands do the wantin'." } },
      choices = { { text = "I'll practise that.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    ironforge = { { id = "tp_if", text = "A city wi' one great gate an' a hundred small doors. I've walked most o' them, an' I'll no' tell ye where they go." } },
    dark_iron = { { id = "tp_dark", text = "Clever, patient, an' better at my trade than I like tae admit. If ye ever think ye've spotted all o' them, ye havenae." } },
    anvilmar = { { id = "tp_anvil", text = "Stone walls, one main door an' two ways out that the others dinnae know about. I'll no' say which." } },
    background = { { id = "tp_bg", text = "I'm a rogue trainer. That's all ye need tae know." } },
    _none = { { id = "tp_none", text = "No' my business, an' no' yours either." } },
  },
}

---------------------------------------------------------------------------
-- Missed folk (added later): Lomac Gearstrip in Tinker Town; Hands Springsprocket in Coldridge Pass, Tannok
-- Frosthammer in Kharanos and Mountaineer Barleybrew at the South Gate Outpost; and the Ironforge vendors Bruuk
-- Barleybeard, Dolman Steelfury, Barim Jurgenstaad, Myra Tyrngaarde, Sraaz, Pithwick and Fizzlebang Booms.
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Lomac Gearstrip: suspicious gnome chemist in Tinker Town; the only maker of NG-5.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_lomac", id = TODO_NPC("Lomac Gearstrip"), name = "Lomac Gearstrip",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "ironforge", "gnomeregan" }, temper = { "suspicious", "gleeful" }, values = { "craft", "curious" },
  notices = { "craft", "race" },
  impression = {
    first = "Lomac Gearstrip squints at every visitor as if they had come to steal a formula, and then laughs at the thought of what the formula would do to them. He makes an explosive he calls NG-5 and is prouder of it than is quite safe.",
    third = "{name} met Lomac Gearstrip, a suspicious gnome chemist in Tinker Town who makes the explosive NG-5.",
  },
  greetings = {
    { id = "g_gnome", when = { race = "Gnome" }, text = "A gnome. Fine, you can come two steps closer than the others, but no further, and touch nothing." },
    { id = "g_hi", text = "Stop right there, and don't lean on that bench! Who sent you, and what did they tell you I had?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still in one piece, which is more than I'd have wagered. What is it this time?" },
    { id = "g_gaxim", when = { questActive = TODO_QUEST("An Old Colleague") }, text = "Ahhh, Gaxim sent you, did he? And how do I know you're not lying to me, hmm? Hmm?" },
    { id = "g_potions", when = { questActive = TODO_QUEST("Ineptitude + Chemicals = Fun") }, text = "I can't make any Nitromirglyceronium without those potions, you know, because they're vital to the mixture. Have you brought them?" },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You've got stained fingers and you smell faintly of swiftthistle, so you're an alchemist. Good, good, the world's not all swords and sorcery, you know." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, at least, so you'll understand the difference between a calculated explosion and an accident. Most people in this mountain don't." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lomac Gearstrip, chemist, and before you ask, no, you can't see the formula. I make the most potent explosive in Khaz Modan in this corner of Tinker Town, and I'd like to keep having a corner to make it in." },
        { id = "h_done", when = { questDone = TODO_QUEST("Ineptitude + Chemicals = Fun") }, text = "Well, you're not in itty bitty pieces, so either you handled my NG-5 properly or you haven't used it yet. Which goblins got it, in the end?" },
      },
      again = {
        { id = "h_again", text = "What else? Talk quietly, because loud noises upset the beakers and the beakers upset me." },
        { id = "h_again2", text = "Go on, then, but keep your elbows in." },
        { id = "h_again3", text = "Another question! You're persistent, and I haven't decided whether that's suspicious." },
      },
      choices = {
        { text = "What is NG-5?", next = "ng5" },
        { text = "You know Gaxim Rustfizzle.", next = "gaxim" },
        { text = "You don't trust visitors much.", next = "trust" },
        { text = "I brew potions myself.", next = "alch", when = { profession = "Alchemy" } },
        { text = "I'll leave you to your beakers.", next = "END" },
      },
    },
    ng5 = {
      lines = { { id = "ng_default", text = "Nitromirglyceronium, fifth formulation, and my greatest creation. The first four formulations were also very powerful, which is why this is my third workshop." } },
      choices = {
        { text = "What goes into it?", next = "ng5_recipe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ng5_recipe = {
      lines = { { id = "nr_default", text = "Ha! Nice try. I'll tell you that it starts with a few common potions, mana and fortitude, and that everything interesting happens after that, behind a locked door, with me on the far side of a thick wall." } },
      choices = {
        { text = "And you hand this out to strangers?", next = "ng5_strangers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ng5_strangers = {
      big = true,
      lines = { { id = "ns_default", text = "Only to strangers who mean to use it on someone I dislike, and I dislike a great many people, goblins especially. I'll be honest with you: half the reason I hand it over is to see whether you or they end up in the crater." } },
      choices = {
        { text = "A thing that dangerous should be kept under guard.", next = "BACK", reply = "Under guard! By whom, the dwarves? They'd put it in a cannon within the week. No, it's safest with the one person who's afraid of it.", fx = { align = { order = 1 } } },
        { text = "If it blows up the right people, hand it out freely.", next = "BACK", reply = "Hahaha! Now that's the proper spirit of inquiry. Stand a little further from the bench, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gaxim = {
      lines = { { id = "gx_default", text = "Gaxim and I were colleagues before Gnomeregan fell, and he always built the devices while I mixed what went inside them. He's off saving a forest from the Venture Company now, which is very noble and will certainly get him killed." } },
      choices = {
        { text = "He spoke well of you.", next = "gaxim_well" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gaxim_well = {
      lines = { { id = "gw_default", text = "Did he? Then he wants something, because Gaxim only remembers my good qualities when he's out of explosives. Still, he's the only engineer who ever followed my handling instructions, so I suppose I miss him a little." } },
      choices = { { text = "I'll tell him you said so.", next = "BACK", reply = "You'll do no such thing. Tell him the usual terms apply and to stand upwind.", fx = { affinity = 1 } } },
    },
    trust = {
      lines = { { id = "tr_default", text = "Would you, in my position? There are leper gnomes under this mountain who were perfectly sensible people once, and I'd rather my work didn't find its way down the tram to whatever they've become." } },
      choices = {
        { text = "That's a fair reason to be careful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alch = {
      lines = { { id = "al_default", text = "Do you? Then answer me this, and quickly: what do you do when a mixture starts to smoke and it wasn't supposed to?" } },
      choices = {
        { text = "Put it down gently and leave the room.", next = "BACK", reply = "Correct! Gently, and then the room. You'd be amazed how many reverse the order.", fx = { affinity = 1 } },
        { text = "Add water and stir.", next = "BACK", reply = "Hahaha! Oh, please do that, but not in here, and write to me afterwards if you still have hands.", fx = { trait = { witty = 1 } } },
      },
    },
  },
  topics = {
    venture_company = { { id = "tp_venture", text = "Goblins who strip a forest to the stumps and call it industry. I'd blow up every shredder they own for free, and I never do anything for free." } },
    gnomeregan = { { id = "tp_gnomer", text = "I had a proper laboratory there, with ventilation. Thermaplugg can keep the furniture, but I do miss the ventilation." } },
    tinker_town = { { id = "tp_tinker", text = "Crowded, noisy and full of people who borrow tools. On the other hand, nobody here complains about the bangs." } },
    background = { { id = "tp_bg", text = "I'm a chemist, and I've been one for longer than most of my workshops have lasted." } },
    _none = { { id = "tp_none", text = "Why do you want to know that? No, never mind, I don't know anyway, and I wouldn't say if I did." } },
  },
}

---------------------------------------------------------------------------
-- Hands Springsprocket: gnome supplier stuck on the Coldridge side of the pass with a crate for the Kharanos inn.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_hands", id = TODO_NPC("Hands Springsprocket"), name = "Hands Springsprocket",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh", "gnomeregan" }, temper = { "cheerful", "fretful" }, values = { "practical", "community" },
  notices = { "greenness", "race" },
  impression = {
    first = "Hands Springsprocket stands at the mouth of Coldridge Pass beside a crate he cannot deliver, stamping his feet against the cold. He supplies the inn at Kharanos and has no way through the troggs in the tunnel without an escort.",
    third = "{name} met Hands Springsprocket, a gnome supplier waiting at Coldridge Pass for someone to carry his crate to Kharanos.",
  },
  greetings = {
    { id = "g_hi", text = "Hey! You look like a hearty sort. You wouldn't be planning on braving the pass, would you?" },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again! Still no mountaineer escort, in case you were wondering, and my toes have gone quite numb." },
    { id = "g_active", when = { questActive = TODO_QUEST("Supplies to Tannok") }, text = "You've still got the crate? Tannok Frosthammer, at the inn in Kharanos, and do keep it the right way up." },
    { id = "g_done", when = { questDone = TODO_QUEST("Supplies to Tannok") }, text = "You made it through! Tannok sent word with a mountaineer, and I can't tell you what a weight that is off my mind." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 5 },
      text = "You're new out of Anvilmar, aren't you? That's all right. The troggs in the tunnel are slow, and you look quicker than they are." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome with a weapon and a purposeful walk! I've only got the purposeful walk, which is why I'm standing here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hands Springsprocket, and this crate is meant for the inn at Kharanos. I can't get through the pass myself with the troggs in it, and it'll be days before a mountaineer escort comes by." },
        { id = "h_done", when = { questDone = TODO_QUEST("Supplies to Tannok") }, text = "There's my courier! The inn's stocked, Tannok's stopped worrying, and I've another crate half packed if the pass stays this bad." },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere to be, which is rather the problem." },
        { id = "h_again2", text = "Ask away! Talking keeps my teeth from chattering." },
        { id = "h_again3", text = "Go on, I'm listening, and so is the crate, probably." },
      },
      choices = {
        { text = "What's in the crate?", next = "crate" },
        { text = "What's wrong with the pass?", next = "pass" },
        { text = "That's a cold place to wait.", next = "cold" },
        { text = "I came up through Anvilmar myself.", next = "anvilmar", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Stay warm, Hands.", next = "END" },
      },
    },
    crate = {
      lines = { { id = "cr_default", text = "Candles, salt, a sack of dried apples and some odds and ends Tannok Frosthammer asked for by letter. It isn't treasure, but an inn runs on small things, and Kharanos has been short of them since the tunnel went bad." } },
      choices = {
        { text = "Who's Tannok Frosthammer?", next = "crate_tannok" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crate_tannok = {
      lines = { { id = "ct_default", text = "The innkeeper's assistant at the Thunderbrew Distillery, and the one who actually counts the stores while Innkeeper Belm entertains the room. He'll sit you by the fire and put a flagon in your hand before you've set the crate down." } },
      choices = {
        { text = "What if I kept the crate for myself?", next = "crate_keep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crate_keep = {
      big = true,
      lines = { { id = "ck_default", text = "Then you'd have a great many candles and a guilty conscience, and I'd have to tell Tannok I trusted the wrong traveller. You wouldn't really, would you?" } },
      choices = {
        { text = "No. A delivery is a promise.", next = "BACK", reply = "That's exactly what I tell everyone, and hardly anyone listens! Thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Candles are candles. I'd think about it.", next = "BACK", reply = "Oh dear. Well, please think about it on the far side of Kharanos, after you've handed it over.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pass = {
      lines = { { id = "pa_default", text = "Troggs, dozens of them, come up out of the rock and settled in the tunnel as if they owned it. Mountaineer Thalos holds this end and won't let me through alone, and he's quite right, though I do wish he'd be right a little faster." } },
      choices = {
        { text = "Where did the troggs come from?", next = "pass_troggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pass_troggs = {
      lines = { { id = "pt_default", text = "Out of the ground, the dwarves say, from somewhere they dug too deep. I've heard Gnomeregan had the same trouble from below before the end, so you'll forgive me if I don't care to study them closely." } },
      choices = { { text = "I'll clear a few on my way.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    cold = {
      lines = { { id = "co_default", text = "It is! I've a heating coil sewn into my coat, but it only warms the left side, so I turn round every so often like a roast. Balir Frosthammer back at the hall says I should grow a beard, which isn't helpful." } },
      choices = { { text = "A beard might suit you.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    anvilmar = {
      lines = { { id = "an_default", text = "Then you know how it is in the valley. Everyone's kind and everyone's busy, and the only way out is a tunnel full of troggs, which does concentrate the mind on becoming useful." } },
      choices = { { text = "It worked on me.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    anvilmar = { { id = "tp_anvil", text = "The hall at the heart of Coldridge Valley. It's warm inside and everyone's training for something, and I do my packing in a corner so as not to be drilled by accident." } },
    thalos = { { id = "tp_thalos", text = "Mountaineer Thalos guards this end of the pass. He's stern, but he's saved my crate twice and my neck once, so I don't argue with him." } },
    kharanos = { { id = "tp_khar", text = "A proper town with a proper inn, just through the pass. I'd be there now if the troggs had any manners." } },
    troggs = { { id = "tp_troggs", text = "Big, grey and very fond of hitting things. I keep well back and let the mountaineers handle the introductions." } },
    background = { { id = "tp_bg", text = "I carry supplies between Anvilmar and Kharanos. It was a quiet living until quite recently." } },
    _none = { { id = "tp_none", text = "I'm afraid I couldn't tell you. My news is all a few days old and on the wrong side of a tunnel." } },
  },
}

---------------------------------------------------------------------------
-- Tannok Frosthammer: innkeeper's assistant at the Thunderbrew Distillery; worried about the road to Anvilmar.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_tannok", id = TODO_NPC("Tannok Frosthammer"), name = "Tannok Frosthammer", title = "Innkeeper Assistant",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "kharanos" }, temper = { "hospitable", "worried" }, values = { "community", "practical" },
  notices = { "greenness", "kit" },
  impression = {
    first = "Tannok Frosthammer has a seat by the fire and a flagon ready for anyone who comes in out of the snow. He keeps the inn's stores at Kharanos and frets over every day without word from Anvilmar.",
    third = "{name} met Tannok Frosthammer, the innkeeper's assistant in Kharanos, who worries about the trogg-held pass to Anvilmar.",
  },
  greetings = {
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's late tae be out in the snow. Come in, there's a bed upstairs an' the fire's banked for the night." },
    { id = "g_hi", text = "Hello there! Come in, take a seat by the fire an' warm yerself wi' a flagon o' ale." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' welcome. Yer seat's still warm, near enough." },
    { id = "g_crate", when = { questActive = TODO_QUEST("Supplies to Tannok") }, text = "Is that a crate from Hands ye're carryin'? Set it down here, friend, an' mind yer back." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 6 },
      text = "Ye've just come through the pass, by the snow on ye. Sit down before ye fall down, for that tunnel takes it out o' everybody the first time." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer gear's had a hard road. Grawn Thromwyn has the forge across the way, an' he'll see ye right once ye've thawed." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tannok Frosthammer, an' I help Innkeeper Belm keep this place stocked an' standin'. We've had scarce word from Anvilmar since the troggs overran the pass, an' I'll admit it's been weighin' on me." },
        { id = "h_done", when = { questDone = TODO_QUEST("Supplies to Tannok") }, text = "There's the one who brought the supplies from Hands! I was beginnin' tae worry, an' now I can worry about somethin' else for a change. Make yerself comfortable." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye? There's time, an' there's ale." },
        { id = "h_again2", text = "Go on, friend, I'm only countin' candles." },
        { id = "h_again3", text = "Ask away, an' pull yer chair nearer the fire while ye do." },
      },
      choices = {
        { text = "What word have you had from Anvilmar?", next = "anvilmar" },
        { text = "What does an innkeeper's assistant do?", next = "work" },
        { text = "This is a distillery and an inn at once.", next = "distillery" },
        { text = "A Frosthammer? I met Balir in Coldridge.", next = "balir", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Thank you for the fire, Tannok.", next = "END" },
      },
    },
    anvilmar = {
      lines = { { id = "an_default", text = "Little enough. A mountaineer comes through every few days wi' the mail, an' Hands Springsprocket sends what supplies he can when there's somebody tae carry them. Between times, we've only the silence tae go on." } },
      choices = {
        { text = "The recruits are holding their own up there.", next = "anvilmar_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anvilmar_hold = {
      lines = { { id = "ah_default", text = "I'm glad tae hear it, truly. It's the young ones I think of, for every dwarf in this room came down through that valley once, an' it was never meant tae be cut off from the rest of us." } },
      choices = {
        { text = "Should the mountaineers clear the pass for good?", next = "anvilmar_clear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anvilmar_clear = {
      big = true,
      lines = { { id = "ac_default", text = "That's the argument at this bar most nights. Some say the mountaineers should leave the troll camps be an' put every rifle intae that tunnel, an' others say ye cannae strip the valley's guard for the sake o' one road. What would ye have them do?" } },
      choices = {
        { text = "Clear the pass. Nobody should be cut off from help.", next = "BACK", reply = "Aye, that's where my heart is, though I'm no soldier. I'll say so the next time Senator Stonehallow's man is in.", fx = { align = { light = 1 } } },
        { text = "Hold the valley first. One road isn't worth the line.", next = "BACK", reply = "That's the mountaineers' own view, an' they ken their trade. It's a cold comfort for the folk at Anvilmar, mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "wk_default", text = "Everythin' Belm doesnae care tae, which is the countin', the orderin' an' the sweepin'. He keeps the room cheerful an' I keep it supplied, an' between us nobody's gone thirsty or cold yet." } },
      choices = {
        { text = "What runs short first?", next = "work_short" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_short = {
      lines = { { id = "ws_default", text = "Candles an' salt, every winter. Ale we've plenty of, for Ragnar Thunderbrew makes it under our feet, but ye cannae light a room nor cure a ham wi' Thunder Ale, though I've seen it tried." } },
      choices = { { text = "I'd have liked to see that.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    distillery = {
      lines = { { id = "di_default", text = "It is, an' it's the best arrangement in Dun Morogh. The Thunderbrews brew below, Belm pours above, Granis Swiftaxe drills his warriors in the back, an' Jarven guards the cellar an' suffers." } },
      choices = { { text = "Poor Jarven.", next = "BACK", reply = "Aye, poor Jarven. I take him his supper, an' I've learned no' tae breathe ale on him when I do.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    balir = {
      lines = { { id = "ba_default", text = "Did ye! He's kin, on my father's side, an' the last I heard he was fretful over the boars an' the troggs both. If ye saw him well, that's the best news the mail's no' brought me." } },
      choices = { { text = "He was well, and busy.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    thunderbrew = { { id = "tp_thunder", text = "The family that owns the roof over my head an' the ale under my feet. Ragnar's a fair master, so long as ye dinnae spill any." } },
    hands = { { id = "tp_hands", text = "Hands Springsprocket, a wee gnome wi' a big conscience. He supplies us from the Coldridge side, when the troggs let him." } },
    belm = { { id = "tp_belm", text = "Innkeeper Belm's the face o' the place an' the laugh o' it. I'm the ledger, an' we both ken which the customers prefer." } },
    troggs = { { id = "tp_troggs", text = "They've the pass, an' I wish they hadnae. That's the whole o' my opinion on troggs." } },
    background = { { id = "tp_bg", text = "I'm a Frosthammer, an' I keep the stores at the Kharanos inn. It's steady work, an' warm." } },
    _none = { { id = "tp_none", text = "I couldnae say, friend. Ask Belm, for he hears everythin' that's said at the bar." } },
  },
}

---------------------------------------------------------------------------
-- Mountaineer Barleybrew: South Gate Outpost sentry with a cask of his brother Rejold's Shimmer Stout to share.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_barleybrew", id = TODO_NPC("Mountaineer Barleybrew"), name = "Mountaineer Barleybrew",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh" }, temper = { "jolly", "generous" }, values = { "family", "friendship" },
  notices = { "drunk", "race" },
  impression = {
    first = "Mountaineer Barleybrew keeps the South Gate with a rifle on his shoulder and a cask at his feet. His brother brews a stout he swears by, and he would rather share it with a friend down the road than drink it alone.",
    third = "{name} met Mountaineer Barleybrew at the South Gate Outpost, who wants his brother's Shimmer Stout carried to a friend in Loch Modan.",
  },
  greetings = {
    { id = "g_night", when = { timeOfDay = "night" }, text = "Who goes? Step intae the lantern light. Ach, a traveller. It's a cold night for the tunnel, friend." },
    { id = "g_hi", text = "Halt! Ach, ye're no trogg, so come ahead, then, an' tell me if ye're bound for Loch Modan." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good, for it's a dull watch an' I've a thirst for talk." },
    { id = "g_active", when = { questActive = TODO_QUEST("Stout to Kadrell") }, text = "Ye've the cask still? Kadrell patrols the road through Thelsamar, an' mind ye don't sample it on the way." },
    { id = "g_done", when = { questDone = TODO_QUEST("Stout to Kadrell") }, text = "Kadrell sent word he felt like he could fly! That's my brother's stout for ye, an' I thank ye for carryin' it." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ye've had a few, I see, an' good for ye. Just walk the middle o' the tunnel, for the edges are further away than they look." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf wi' a proper thirst on {g:him|her}, I can tell. Ye'll have opinions about stout, an' I want tae hear them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mountaineer Barleybrew, on the South Gate. I've been drinkin' more o' that Shimmer Stout my brother Rejold made, an' it's great stuff, so I want a fellow mountaineer tae try it." },
        { id = "h_stout", when = { questDone = TODO_QUEST("Shimmer Stout") }, text = "So ye're the one who fetched Rejold his makings! Then ye've a share in every cask, as I see it, an' ye're welcome at this gate any day." },
      },
      again = {
        { id = "h_again", text = "What else? The pass is quiet, an' I'm in nae hurry." },
        { id = "h_again2", text = "Go on, ask. It's that or count snowflakes." },
        { id = "h_again3", text = "Aye? I'm listenin', wi' one ear on the tunnel." },
      },
      choices = {
        { text = "Tell me about this Shimmer Stout.", next = "stout" },
        { text = "Who is the stout for?", next = "kadrell" },
        { text = "What do you watch for at this gate?", next = "gate" },
        { text = "A Barleybrew in the Mountaineers, not the brewery.", next = "family", when = { race = "Dwarf" } },
        { text = "Keep a good watch, Mountaineer.", next = "END" },
      },
    },
    stout = {
      lines = { { id = "st_default", text = "Rejold's newest, brewed out at Brewnall Village wi' somethin' in it he'll no' name, even tae me. It's dark as a mine an' it sets yer head turnin', an' I've never had its like." } },
      choices = {
        { text = "Better than Thunder Ale?", next = "stout_rival" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stout_rival = {
      big = true,
      lines = { { id = "sr_default", text = "Now there's a question that's started fights from here tae Ironforge. The Thunderbrews have the name an' the king's table, an' my family's had tae brew twice as well for half the notice. What d'ye say, should a brewer be judged by the name or by the mug?" } },
      choices = {
        { text = "By the mug. A name is only paint on a barrel.", next = "BACK", reply = "Ha! I'll tell Rejold that, word for word, an' he'll hang it over the vats.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A name is earned over generations. It counts.", next = "BACK", reply = "Hmph. That's fair, I suppose, an' it's what the Thunderbrews would say. We'll earn ours, then, one cask at a time.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kadrell = {
      lines = { { id = "ka_default", text = "Mountaineer Kadrell, who walks the road through Thelsamar in Loch Modan. Go south-east through the tunnel, then turn north-east where the path forks intae a road, an' it'll take ye straight intae town." } },
      choices = {
        { text = "Why Kadrell in particular?", next = "kadrell_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kadrell_why = {
      lines = { { id = "kw_default", text = "We trained together, an' he stood a winter on this gate before they moved him tae the loch. He has the best palate in the Mountaineers, an' if Kadrell says a stout is good, every outpost in Khaz Modan will be askin' for a cask." } },
      choices = { { text = "So this is business as well as friendship.", next = "BACK", reply = "It's both, an' I'll no' apologise. A Barleybrew can love his friend an' his brother's ledger at once.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    gate = {
      lines = { { id = "ga_default", text = "The South Gate Pass runs through the mountain tae Loch Modan, an' everythin' that goes between the two comes by me. Troggs, mostly, are what I'm watchin' for, an' the odd Dark Iron who thinks a tunnel's a fine place tae be clever." } },
      choices = {
        { text = "Has it been quiet lately?", next = "gate_quiet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate_quiet = {
      lines = { { id = "gq_default", text = "Quiet enough that I can keep a cask by my boot, an' no' so quiet that I'd open it on watch. The word from the loch is that the troggs are thick about the dig sites, so I'd keep yer weapon loose once ye're through." } },
      choices = { { text = "I'll keep it loose. Thank you.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "fa_default", text = "Aye, an' my mother's still no' forgiven me. Rejold got the nose for brewin' an' Marleth got the cheek for sellin' it, an' I got a good eye an' a likin' for cold air, so somebody had tae guard what the others make." } },
      choices = { { text = "Every family needs one sober head.", next = "BACK", reply = "Sober! Dinnae spread that about, {g:lad|lass}, I've a reputation.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    kadrell = { { id = "tp_kadrell", text = "Mountaineer Kadrell, down in Thelsamar. He's a good soldier an' a better judge o' stout, an' I miss havin' him on this gate." } },
    troggs = { { id = "tp_troggs", text = "They come up wherever somebody's dug too deep. I've shot a fair few on this road, an' there's always more." } },
    rejold = { { id = "tp_rejold", text = "My brother, an' the finest brewer in Dun Morogh, whatever the sign over the Kharanos distillery says." } },
    loch_modan = { { id = "tp_loch", text = "Through the tunnel an' down. It's a bonny valley wi' a great loch in it, an' more troggs than it deserves." } },
    background = { { id = "tp_bg", text = "I'm a Barleybrew by birth an' a Mountaineer by choice. I guard the gate an' drink my brother's work." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, friend. Naethin' comes through this gate but carts an' weather." } },
  },
}

---------------------------------------------------------------------------
-- Bruuk Barleybeard: bartender and owner of Bruuk's Corner in the Military Ward.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_bruuk", id = TODO_NPC("Bruuk Barleybeard"), name = "Bruuk Barleybeard", title = "Bartender",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "gruff", "watchful" }, values = { "practical", "loyal" },
  notices = { "drunk", "soldier" },
  impression = {
    first = "Bruuk Barleybeard keeps a small tavern in the Military Ward where soldiers drink when they are off the wall. He pours without being asked twice and listens without seeming to.",
    third = "{name} met Bruuk Barleybeard, who keeps the bar at Bruuk's Corner in Ironforge's Military Ward.",
  },
  greetings = {
    { id = "g_night", when = { timeOfDay = "night" }, text = "The night watch has just gone out, so ye've the place near tae yerself. What'll it be?" },
    { id = "g_hi", text = "Welcome tae Bruuk's Corner. Find a stool, name yer drink, an' keep yer blade sheathed." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The usual, or have ye no' been here long enough tae have one?" },
    { id = "g_soldier", when = { class = { "WARRIOR", "PALADIN" } }, text = "Off duty, are ye? Good, then sit where the lads can see ye're no' an officer." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ye've had yer fill already, an' no' from my kegs. I'll pour ye one more, an' then it's water or the door." },
    { id = "n_soldier", cat = "soldier", when = { minLevel = 40 },
      text = "Ye've the look o' somebody who's seen a real fight. The lads in the corner will want yer stories, so mind ye tell the true ones." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bruuk Barleybeard, an' this is my corner. It's no' as grand as the Stonefire, but the soldiers from the Hall o' Arms drink here, an' they'd sooner have it quiet an' close tae their bunks." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Bruuk Barleybeard. Sit down, {g:lad|lass}, an' I'll pour ye somethin' brewed under this mountain an' no' carted in from a human vineyard." },
      },
      again = {
        { id = "h_again", text = "What else? I've mugs tae wash, but I can hear ye over them." },
        { id = "h_again2", text = "Go on. A bartender's ears are part o' the service." },
        { id = "h_again3", text = "Aye? Speak yer mind, there's nae officers in tonight." },
      },
      choices = {
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "Who drinks at Bruuk's Corner?", next = "regulars" },
        { text = "What do the soldiers talk about?", next = "talk" },
        { text = "Why open a tavern in the Military Ward?", next = "ward" },
        { text = "I've stood a watch or two myself.", next = "watch", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "What's the best thing you pour?", next = "pour" },
        { text = "Another time, Bruuk.", next = "END" },
      },
    },
    regulars = {
      lines = { { id = "re_default", text = "Guards comin' off the gates, recruits from the Hall o' Arms, an' Pilot Longbeard whenever he's worn out his welcome wi' Muren Stormpike. Edris carries the mugs, an' she's thrown out bigger dwarves than me." } },
      choices = {
        { text = "Has she thrown out many?", next = "regulars_edris" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars_edris = {
      lines = { { id = "rd_default", text = "One or two a month, an' always for the same thing, which is singin' the clan songs wi' the wrong words. She's patient wi' a brawl, but she'll no' stand for that." } },
      choices = { { text = "I'll mind my words, then.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    talk = {
      lines = { { id = "ta_default", text = "The Dark Irons, the troggs in Dun Morogh, an' who's been posted tae Alterac an' hasnae written. They talk a great deal when they think the barman's deaf, an' I've never corrected them." } },
      choices = {
        { text = "And what do you do with what you hear?", next = "talk_hear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk_hear = {
      big = true,
      lines = { { id = "th_default", text = "Naethin', as a rule. But now an' then a lad says somethin' in his cups that his captain ought tae know, a grudge or a debt or a plan tae desert, an' I've tae decide whether a bar's a confessional or a guard post." } },
      choices = {
        { text = "What's said over a mug stays there.", next = "BACK", reply = "That's the old rule, an' it's kept this place full. I only break it when somebody's like tae end up dead.", fx = { align = { honor = 1 } } },
        { text = "If it endangers the city, tell his captain.", next = "BACK", reply = "Aye, an' I have, twice. I didnae sleep well after either, but I'd do it again.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ward = {
      lines = { { id = "wa_default", text = "Because a soldier wi' an hour's leave will no' walk tae the Commons an' back for a drink. I served my own years on the wall, an' I remember wishin' somebody would put a keg within reach o' the barracks, so I did." } },
      choices = { { text = "A sound piece of strategy.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "wt_default", text = "Then ye ken the worst o' it isnae the cold nor the fear, it's the hours when nothin' happens an' ye cannae stop listenin'. First one's poured strong for anybody who's stood that kind o' watch." } },
      choices = { { text = "You understand it well.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    pour = {
      lines = {
        { id = "po_default", text = "A dark ale from a wee brewer in the Commons that nobody's heard of, an' I'd like tae keep it that way. It's no' as strong as Thunderbrew's, but a soldier can drink two an' still find his bunk." },
        { id = "po_drunk", when = { drunk = true }, text = "For ye, right now, it's water, an' dinnae look at me like that. Ask me again tomorrow an' I'll tell ye about the dark ale." },
      },
      choices = { { text = "Two and still find my bunk. Pour it.", next = "BUSINESS" }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dark_iron = { { id = "tp_dark", text = "Every soldier in here has an opinion on them, an' it's the same opinion. I pour, an' I let them have it." } },
    hall_of_arms = { { id = "tp_hall", text = "Across the ward. They train there all day an' drink here all evenin', an' I can tell how the drill went by how fast the first mug goes down." } },
    military_ward = { { id = "tp_ward", text = "Barracks, the Hall o' Arms, an' my corner. It's the one part o' Ironforge where folk go tae bed on time." } },
    stonefire = { { id = "tp_stone", text = "Firebrew's place in the Commons. It's a fine tavern if ye want noise an' tall tales, an' I send him the ones who do." } },
    background = { { id = "tp_bg", text = "I was a soldier, an' now I pour for soldiers. It's the better half o' the same job." } },
    _none = { { id = "tp_none", text = "I couldnae say. If nobody's said it at this bar, I've no' heard it." } },
  },
}

---------------------------------------------------------------------------
-- Dolman Steelfury: weapon merchant at Steelfury's Weapon Emporium in the Commons.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_dolman", id = TODO_NPC("Dolman Steelfury"), name = "Dolman Steelfury", title = "Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "proud", "direct" }, values = { "craft", "honest" },
  notices = { "kit", "class" },
  impression = {
    first = "Dolman Steelfury sells axes, swords and hammers from a shop in the Commons with his family's name over the door. He sizes up a customer's arm before their purse and will not sell a weapon that does not suit the first.",
    third = "{name} met Dolman Steelfury, who sells weapons at Steelfury's Weapon Emporium in the Ironforge Commons.",
  },
  greetings = {
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Steelfury's, an' welcome, {g:lad|lass}. Ye'll no' need tellin' that an axe is the proper answer tae most things." },
    { id = "g_poor", when = { money = { max = 100 } }, text = "Ye've an empty purse, by the look o' ye. Look all ye like, there's nae charge for learnin' what good steel looks like." },
    { id = "g_hi", text = "Steelfury's Weapon Emporium. Tell me what ye mean tae hit, an' I'll tell ye what tae hit it wi'." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are ye? Either that last one served ye well or it broke, an' I ken which I'm bettin' on." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That edge o' yours has been through a hard season. I'll sell ye a new one gladly, but a whetstone would have been cheaper." },
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Ye'll no' be wantin' a two-handed axe, I take it. I've daggers an' a staff or two, an' I'll no' laugh while ye lift them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dolman Steelfury, an' my kinsman Grenil works the other counter. Everythin' on these racks was forged under this mountain, an' I've handled each piece myself before I'd put a price on it." },
        { id = "h_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "Dolman Steelfury. Now ye're a customer worth openin' the good rack for. Hold out yer arm an' let me see the reach on ye." },
      },
      again = {
        { id = "h_again", text = "What else? Talk or buy, I'm content wi' either." },
        { id = "h_again2", text = "Go on, I've an axe tae oil, an' I can listen while I do it." },
        { id = "h_again3", text = "Aye? Ask, an' mind the rack behind ye." },
      },
      choices = {
        { text = "Let me see the racks.", next = "BUSINESS" },
        { text = "How do you choose a weapon for someone?", next = "choose" },
        { text = "Who forges what you sell?", next = "forge" },
        { text = "There's no shortage of weapon shops in Ironforge.", next = "rivals" },
        { text = "What would you put in my hand?", next = "fit", when = { class = { "WARRIOR", "PALADIN", "ROGUE", "HUNTER" } } },
        { text = "What sells best these days?", next = "sells" },
        { text = "Good day, Dolman.", next = "END" },
      },
    },
    choose = {
      lines = { { id = "ch_default", text = "I watch them walk in. A dwarf who leads wi' his shoulder wants an axe, an' one who stands square wants a hammer, an' anybody who looks at the swords first has been readin' human stories." } },
      choices = {
        { text = "And if they want the wrong one?", next = "choose_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose_wrong = {
      big = true,
      lines = { { id = "cw_default", text = "Then I tell them so, once. Grenil says it's their coin an' their funeral, an' we should sell them what they ask for, an' I say a Steelfury blade in the wrong hand shames the name. What would ye do behind this counter?" } },
      choices = {
        { text = "Refuse the sale. Your name is on the door.", next = "BACK", reply = "That's my thinkin', an' I've lost good coin by it. I've no' lost a customer tae a trogg yet, mind.", fx = { align = { honor = 1 } } },
        { text = "Sell it. A customer's choice is his own.", next = "BACK", reply = "Ye an' Grenil would get on. He's the richer Steelfury, I'll grant ye that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge = {
      lines = { { id = "fo_default", text = "The smiths at the Great Forge, mostly, an' I buy from Bengus Deepforge's journeymen when their work passes my hand. I'm no smith myself, but I've sold steel for thirty years an' I can feel a bad temper in a blade the way ye'd feel a draught." } },
      choices = {
        { text = "What does a bad temper feel like?", next = "forge_feel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge_feel = {
      lines = { { id = "ff_default", text = "Dead. Ye flick a good blade an' it sings back at ye, an' a bad one only clacks, like a spoon on a pot. Any apprentice can make a thing sharp, but it takes a smith tae make it sing." } },
      choices = { { text = "I'll listen for it.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    rivals = {
      lines = { { id = "ri_default", text = "There's the Timberline lot in the Military Ward an' the Goldfurys wi' their bows an' guns, an' there's custom for all of us while the Dark Irons an' the Horde keep at it. I'd sooner there was less custom an' fewer funerals, but I'll no' pretend the war's bad for the till." } },
      choices = { { text = "That's an honest thing for a merchant to say.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    fit = {
      lines = {
        { id = "fi_default", text = "Turn round. Aye, ye carry yer weight forward an' ye've a long reach for yer height, so I'd give ye somethin' wi' a bit o' length an' the balance near the hand. Come an' try the third rack." },
        { id = "fi_rogue", when = { class = "ROGUE" }, text = "Ye stand like ye're no' really here, which tells me all I need. Short blades, a matched pair, an' nothin' that catches the light. Second drawer, an' I never saw ye." },
      },
      choices = { { text = "Show me, then.", next = "BUSINESS" }, { text = "Something else.", next = "BACK" } },
    },
    sells = {
      lines = { { id = "se_default", text = "Axes tae dwarves, same as always, an' swords tae the humans who come up on the tram wantin' somethin' dwarf-made tae show off at home. This last year it's been hammers, though, for there's more young paladins about than I've ever seen." } },
      choices = { { text = "Hard times make for hammer sales.", next = "BACK", reply = "They do, an' I'd trade the lot for a quiet year.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    commons = { { id = "tp_commons", text = "Every coin in Ironforge passes through it. I can hear the auction house from my counter, an' I ken what steel's fetchin' before the smiths do." } },
    great_forge = { { id = "tp_forge", text = "The heart o' the city an' the source o' my stock. If ye've never stood at the rail an' watched the pour, go an' do it." } },
    grenil = { { id = "tp_grenil", text = "My kinsman, an' the better salesman. He'd sell an axe tae a gnome an' a stool tae stand on while swingin' it." } },
    background = { { id = "tp_bg", text = "I'm a Steelfury, an' we've sold arms in the Commons since my grandfather's day." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. If it doesnae have an edge or a haft, it's outside my trade." } },
  },
}

---------------------------------------------------------------------------
-- Barim Jurgenstaad: reagent vendor in the Commons.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_barim", id = TODO_NPC("Barim Jurgenstaad"), name = "Barim Jurgenstaad", title = "Reagents",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "dry", "careful" }, values = { "practical", "knowledge" },
  notices = { "class" },
  impression = {
    first = "Barim Jurgenstaad sells powders, candles and stranger things in small labelled jars, and he can guess a customer's craft by which shelf their eyes go to. He asks no questions about what any of it is for.",
    third = "{name} met Barim Jurgenstaad, the reagent vendor in the Ironforge Commons.",
  },
  greetings = {
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for shoppin'. The ones who come at this hour usually want the bottom shelf, an' I dinnae ask." },
    { id = "g_hi", text = "Reagents, friend. Tell me yer callin' an' I'll save ye the trouble o' readin' the labels." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, so ye've used it all up. That's how I like my customers, busy an' still breathin'." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Ye'll want rune stones an' powder for yer portals, an' I'll remind ye that I dinnae give credit tae folk who can leave the city in a blink." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Ye're one o' the Forlorn Cavern lot. I'll serve ye the same as anybody, but I'll thank ye tae keep yer wee friend off the counter." },
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. Ye'll be after the Symbols o' Divinity, an' I keep them on the top shelf, well away from the things the warlocks buy." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Barim Jurgenstaad. I stock what the spellcasters o' Ironforge burn through, an' they burn through a great deal. It's a quiet trade, for nobody boasts about where they buy their candles." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK", "PALADIN", "DRUID", "SHAMAN" } }, text = "Barim Jurgenstaad, an' I can see ye're one o' mine. Have a look, an' tell me if I'm short o' anythin', for the carts have been slow." },
      },
      again = {
        { id = "h_again", text = "What else? Mind yer sleeve on the jars." },
        { id = "h_again2", text = "Go on, I'm only weighin' powder." },
        { id = "h_again3", text = "Aye? Ask quietly, some o' this stock doesnae care for shoutin'." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "Who are your customers?", next = "customers" },
        { text = "Where does all this come from?", next = "source" },
        { text = "You don't ask what it's used for.", next = "ask" },
        { text = "What do you make of those who buy from you?", next = "caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "What's the strangest thing on your shelves?", next = "strange" },
        { text = "Good day, Barim.", next = "END" },
      },
    },
    customers = {
      lines = { { id = "cu_default", text = "Mages an' priests from the Hall o' Mysteries, mostly, an' paladins before they march. The rogues send somebody else tae buy their powders, an' think I dinnae ken whose errand it is." } },
      choices = {
        { text = "Who buys the most?", next = "customers_most" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_most = {
      lines = { { id = "cm_default", text = "The mages, by a league. Every time one o' them fancies an afternoon in Stormwind, that's a rune out o' my jar. Ginny Longberry across the way says the same, an' between us we could map where every mage in Ironforge spends his holidays." } },
      choices = { { text = "That's a dangerous sort of knowledge.", next = "BACK", reply = "It would be, if I were the talkin' sort. I'm the weighin' sort.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    source = {
      lines = { { id = "so_default", text = "Some from Stormwind by the tram, some from the gnomes in Tinker Town who grind the powders finer than any dwarf would bother tae, an' the candles I buy from a chandler in the Commons. Nane o' it's rare, but all o' it has tae be clean." } },
      choices = {
        { text = "What happens if it isn't clean?", next = "source_clean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source_clean = {
      lines = { { id = "sc_default", text = "A portal that opens on the wrong side o' a wall, or a blessing that doesnae hold. I had a bad batch o' powder once, years back, an' a mage walked out o' here an' opened his portal tae Stormwind a yard above the canal. He was civil about it, considerin'." } },
      choices = { { text = "I'd have been less civil.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    ask = {
      big = true,
      lines = { { id = "as_default", text = "I dinnae, an' that's a choice I made a long while back. The same powder that steadies a priest's prayer will serve a warlock's circle, an' if I started askin', I'd have tae start refusin', an' then where does it stop?" } },
      choices = {
        { text = "A seller should know what he's arming.", next = "BACK", reply = "Maybe so. I've lain awake on it more than once, an' I'll no' say ye're wrong.", fx = { align = { light = 1 } } },
        { text = "It's not your business what they do with it.", next = "BACK", reply = "That's the line I've held, an' it lets me sleep most nights. Most, mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    caster = {
      lines = { { id = "ca_default", text = "That ye're all in a hurry, an' ye all think the next spell is the important one. I've sold tae three generations o' casters, an' the ones who lasted were the ones who bought twice what they thought they'd need." } },
      choices = { { text = "Then I'll buy double.", next = "BUSINESS" }, { text = "Sound advice. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    strange = {
      lines = { { id = "sg_default", text = "A jar o' somethin' the label calls 'wild thornroot', bought from an elf years back for the druids who never came. It's no' wilted in all that time, an' I've stopped lookin' at it after dark." } },
      choices = {
        { text = "I could use that.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Best leave that jar alone.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },
  topics = {
    tinker_town = { { id = "tp_tinker", text = "The gnomes grind my powders. They're finer than I could manage an' they arrive on time, an' only the odd sack hums." } },
    commons = { { id = "tp_commons", text = "Loud, crowded an' good for trade. I keep my door half shut against the noise an' the dust." } },
    hall_of_mysteries = { { id = "tp_hall", text = "Over in the Mystic Ward, an' the source o' most o' my custom. I've never been past the door, for a reagent seller's better no' knowin' too much." } },
    longberry = { { id = "tp_long", text = "Ginny Longberry keeps the other reagent shop, an' we send each other customers when one of us runs dry. It's a civil sort o' rivalry." } },
    background = { { id = "tp_bg", text = "I weigh powders an' sell candles. It's dull work done carefully, which is the only safe way tae do it." } },
    _none = { { id = "tp_none", text = "I couldnae say. I ken what's in the jars, an' no' much about what's outside the shop." } },
  },
}

---------------------------------------------------------------------------
-- Myra Tyrngaarde: bread vendor who walks the Commons with her basket.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_myra", id = TODO_NPC("Myra Tyrngaarde"), name = "Myra Tyrngaarde", title = "Bread Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "cheerful", "brisk" }, values = { "community", "practical" },
  notices = { "hunger", "race" },
  impression = {
    first = "Myra Tyrngaarde walks the Commons with a basket of warm loaves on her arm, calling her wares over the noise of the auction house. She knows half the city by the bread they buy.",
    third = "{name} met Myra Tyrngaarde, who sells fresh bread from a basket in the Ironforge Commons.",
  },
  greetings = {
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Fresh bread, {g:lad|lass}! Dark an' heavy, the way yer own mother made it, or should have." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ye've caught me wi' the last o' the day's bake. It's no' warm, but it's honest, an' I'll no' pretend otherwise." },
    { id = "g_hi", text = "Fresh bread! Warm from the oven, an' it'll no' stay that way if ye stand there thinkin' about it." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! I kept a loaf back, in case ye came by hungry." },
  },
  notice = {
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "Ye look like ye've come a long road on an empty stomach. Sit on that step an' eat somethin' before ye go another yard." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human! Ye'll find my bread darker an' heavier than what they bake in Stormwind, an' ye'll thank me for it by the second bite." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Myra Tyrngaarde, an' this is the best bread in the Commons, baked this mornin'. I walk it round myself, for folk at the bank an' the auction house never think tae eat till somebody puts a loaf under their nose." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "Myra Tyrngaarde. Ye've a cook's eye, for ye looked at the crust before ye looked at the price. Go on, then, tell me what ye think o' the bake." },
      },
      again = {
        { id = "h_again", text = "What else, dear? Walk wi' me, for I've the whole Commons tae get round." },
        { id = "h_again2", text = "Go on, ask, I can talk an' sell at once." },
        { id = "h_again3", text = "Aye? Quick now, before these go cold." },
      },
      choices = {
        { text = "I'll take some bread.", next = "BUSINESS" },
        { text = "You know everyone in the Commons, I'd guess.", next = "commons" },
        { text = "Why sell from a basket and not a shop?", next = "basket" },
        { text = "How do you bake, under a mountain?", next = "bake" },
        { text = "I bake too. What's in the dark loaf?", next = "cook", when = { profession = "Cooking" } },
        { text = "Good day, Myra.", next = "END" },
      },
    },
    commons = {
      lines = { { id = "cm_default", text = "Near enough. The bankers take a white roll each an' never tip, Auctioneer Redmuse wants the end crusts, an' Innkeeper Firebrew buys two dozen for the Stonefire an' tells his customers he baked them." } },
      choices = {
        { text = "And you let Firebrew take the credit?", next = "commons_credit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    commons_credit = {
      big = true,
      lines = { { id = "cc_default", text = "He pays on the day an' he pays in full, so he can tell them the king baked it for all I mind. My sister says I'm daft, an' that a baker's name is the only thing she owns. What do ye think?" } },
      choices = {
        { text = "Your sister's right. Put your name on your work.", next = "BACK", reply = "Ach, ye sound just like her. Maybe I'll have a word wi' Firebrew, an' maybe I'll have it after he's paid for the month.", fx = { align = { honor = 1 } } },
        { text = "Take the coin. Pride doesn't buy flour.", next = "BACK", reply = "That's my view exactly. Folk can eat my bread wi'out knowin' my name, an' I'll still have fed them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    basket = {
      lines = { { id = "bk_default", text = "A shop waits for folk tae be hungry, an' a basket goes an' finds them. I've an oven in a back room off the Commons an' two good legs, an' that's a business." } },
      choices = {
        { text = "It must be a long day on your feet.", next = "basket_day" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basket_day = {
      lines = { { id = "bd_default", text = "Up before the forge shift changes, bakin' till the first bell, an' walkin' till the basket's empty. I'm asleep before the Stonefire's had its first song, an' I've never once minded." } },
      choices = { { text = "That's honest work, Myra.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    bake = {
      lines = { { id = "ba_default", text = "Easier than ye'd think, for there's nae shortage o' heat in Ironforge. The trouble's the flour, which comes up by cart from the lowland farms, an' the air, which is so dry down here the dough skins over if ye turn yer back." } },
      choices = { { text = "So how do you keep it from drying?", next = "bake_dry" }, { text = "Something else.", next = "BACK" } },
    },
    bake_dry = {
      lines = { { id = "by_default", text = "A wet cloth over the bowl an' a pan o' water in the oven, which my mother taught me an' her mother taught her. There's nae secret tae it, only rememberin' tae do it every single mornin'." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "ck_default", text = "Rye, a spoon o' dark honey, an' a splash o' stout in place o' some o' the water. Dinnae tell the Thunderbrews, or they'll want paid for the idea." } },
      choices = { { text = "Stout in the dough. I'll try it.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stonefire = { { id = "tp_stone", text = "Firebrew's tavern, an' my best customer. Half the bread on those tables is mine, whatever he tells ye." } },
    commons = { { id = "tp_commons", text = "The busiest floor in Ironforge, an' the hungriest. Ye can find anythin' here, so long as ye can hear yerself ask for it." } },
    sraaz = { { id = "tp_sraaz", text = "The wee pie-seller by the Great Forge. He's a sweet soul, an' his pies are better than he thinks they are." } },
    background = { { id = "tp_bg", text = "I'm a baker, an' my mother was a baker. I sell what I make before it's had time tae cool." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, dear. I only ken what folk say while they're chewin'." } },
  },
}

---------------------------------------------------------------------------
-- Sraaz: gnome pie vendor who wanders the Great Forge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_sraaz", id = TODO_NPC("Sraaz"), name = "Sraaz", title = "Pie Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "earnest", "anxious" }, values = { "craft", "kind" },
  notices = { "race", "hunger" },
  impression = {
    first = "Sraaz carries a tray of pies around the Great Forge and apologises for them before anyone has taken a bite. He times his rounds to the smiths' breaks and worries aloud about crust.",
    third = "{name} met Sraaz, a gnome who sells pies to the smiths around the Great Forge in Ironforge.",
  },
  greetings = {
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Pies! Hot pies! And they're the meat ones today, sir or madam, I know you'll ask." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Oh! You're up late. I've two left, and they've been by the forge all evening, so they're warmer than I am." },
    { id = "g_hi", text = "Pies! Hot pies! Well, warm pies, I've been walking a while, but they were very hot when I started!" },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again! Was the last one all right? You can tell me if it wasn't, I'd rather know." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Then you'll remember proper Gnomeregan pastry, with the eleven folds. I only manage nine out here, I'm sorry to say." },
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "You look worn right through. Please have a pie, and eat it sitting down, because they're no good to anyone eaten in a hurry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Sraaz, and I make pies, and then I walk them round the Great Forge until they're gone. The smiths get very hungry, you see, and they can't leave the anvils, so the pies have to go to them." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "I'm Sraaz, and these are pies. I know dwarves like a great deal of meat in theirs, so I've made the filling forty percent denser this month, and I do hope that's enough." },
      },
      again = {
        { id = "h_again", text = "Is there something else? I don't mind, but I should keep moving, or the bottom ones go soft." },
        { id = "h_again2", text = "Yes? Oh, do ask, I like being asked things." },
        { id = "h_again3", text = "Go on! I'll just shift the tray to my other arm." },
      },
      choices = {
        { text = "I'll have a pie.", next = "BUSINESS" },
        { text = "It's hot work, selling by the Great Forge.", next = "forge" },
        { text = "Why pies?", next = "pies" },
        { text = "You apologise a great deal for a good cook.", next = "sorry" },
        { text = "Do you miss Gnomeregan's kitchens?", next = "home", when = { race = "Gnome" } },
        { text = "What goes into a forge-side pie?", next = "filling" },
        { text = "Goodbye, Sraaz.", next = "END" },
      },
    },
    forge = {
      lines = { { id = "fo_default", text = "It is, but the heat keeps the pies warm, which saves me a great deal of trouble. I walk a circuit: the smiths first, then the miners' benches, then the gryphon master, because Gryth Thurden always wants one for himself and one for the bird." } },
      choices = {
        { text = "The gryphons eat pie?", next = "forge_gryph" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge_gryph = {
      lines = { { id = "fg_default", text = "Only the filling! One of them took the whole tray off me once, very politely, and I hadn't the heart to argue with a beak that size. Gryth paid for all twelve, which was decent of him." } },
      choices = { { text = "A discerning animal.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    pies = {
      lines = { { id = "pi_default", text = "Because a pie is a whole meal with its own plate, and a smith can eat it with one hand while the other holds the tongs. I worked that out by watching them try to eat stew at the anvil, which was distressing for everybody." } },
      choices = {
        { text = "That's good engineering.", next = "pies_eng" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pies_eng = {
      lines = { { id = "pe_default", text = "Do you think so? Everyone in Tinker Town says cooking isn't a proper discipline, because nothing in it explodes. I've told them that's the entire aim, and they look at me as though I'd missed the point." } },
      choices = {
        { text = "A thing built to work is as proper as it gets.", next = "BACK", reply = "Oh, thank you. I'm going to remember that the next time someone asks where my blast shield is.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sorry = {
      big = true,
      lines = { { id = "so_default", text = "Do I? Sorry. Oh dear. It's only that dwarves are so sure of everything they make, and I can always see the three things I'd change. Should I just say they're the best pies in Ironforge and be done with it?" } },
      choices = {
        { text = "No. Honest doubt makes a better cook.", next = "BACK", reply = "That's a comfort, actually. I'll keep worrying, then, but I'll try to do it more quietly.", fx = { align = { honor = 1 } } },
        { text = "Yes. Say it loudly, and people will believe it.", next = "BACK", reply = "The best pies in Ironforge! Oh, that felt very strange. I'll practise where nobody can hear.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Every day. We had ovens with a dial for the heat, and a little bell when the time was up, and here I've a coal stove I have to guess at. But the dwarves have been kind, and nobody has ever sent a pie back." } },
      choices = { { text = "We'll have those ovens again one day.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    filling = {
      lines = {
        { id = "fi_default", text = "Boar, mostly, from Dun Morogh, with onion and a great deal of pepper, because the smiths can't taste anything subtler through the smoke. There's an apple one too, but I only make six, and they're gone before I've finished the first circuit." },
        { id = "fi_cook", when = { profession = "Cooking" }, text = "You cook, don't you? Then I'll tell you properly: boar shoulder, braised overnight, onion, pepper, and a spoon of the braising liquor in the pastry itself. That last part's mine, and I'm rather proud of it." },
      },
      choices = { { text = "I'll try the boar.", next = "BUSINESS" }, { text = "It sounds very good, Sraaz.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    tinker_town = { { id = "tp_tinker", text = "I sleep there, but I don't sell there. Everyone in Tinker Town wants to improve the pie, and one of them tried to add a wick." } },
    great_forge = { { id = "tp_forge", text = "The hottest, loudest, hungriest place in the city. I'm very fond of it, though I can't hear a thing for an hour afterwards." } },
    myra = { { id = "tp_myra", text = "Myra Tyrngaarde sells bread in the Commons, and she gave me her old proving cloths when I arrived with nothing. I save her a pie every week." } },
    background = { { id = "tp_bg", text = "I'm a cook from Gnomeregan. I got out with a rolling pin and a recipe book, which turned out to be enough." } },
    _none = { { id = "tp_none", text = "Oh, I'm sorry, I don't know. I mostly know about pastry." } },
  },
}

---------------------------------------------------------------------------
-- Pithwick: gnome bag vendor inside Fizzlespinner's General Goods in the Commons.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_pithwick", id = TODO_NPC("Pithwick"), name = "Pithwick", title = "Bag Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "precise", "chatty" }, values = { "craft", "practical" },
  notices = { "craft", "kit" },
  impression = {
    first = "Pithwick sells bags from a corner of the general store in the Commons and can tell you the capacity of each to the cubic inch. He seems faintly offended by how people pack.",
    third = "{name} met Pithwick, a gnome who sells bags in Fizzlespinner's General Goods in the Ironforge Commons.",
  },
  greetings = {
    { id = "g_gnome", when = { race = "Gnome" }, text = "Bags, pouches and packs, and all of them with straps that adjust to a sensible height, unlike everything else in this city!" },
    { id = "g_poor", when = { money = { max = 100 } }, text = "Bags! Though I see your purse is flat, and I do sell those too, for when you've something to put in one." },
    { id = "g_hi", text = "Bags, pouches and packs! And may I say, the one on your shoulder is carrying its load entirely on the wrong strap." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Is it full already? It's always full already. Nobody ever buys the size up when I tell them to." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew! I can see the callus on your thumb. If you ever make more bags than you can carry, I pay fairly, and I inspect every seam." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Everything you own looks as though it's been dragged behind a ram. A good pack won't mend your armour, but at least the pieces would arrive together." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Pithwick, bag vendor. Fillius Fizzlespinner sells the things, and I sell what you carry the things in, which I maintain is the more important half of the transaction." },
        { id = "h_eng", when = { profession = { "Engineering", "Mining", "Herbalism" } }, text = "Pithwick, bag vendor, and you're a gatherer or a tinkerer, by the bulges in that pack. You people fill a bag faster than anyone, and you never sort it." },
      },
      again = {
        { id = "h_again", text = "What else? I've a shelf to square up, but I can do both." },
        { id = "h_again2", text = "Go on, ask! I've opinions on most forms of luggage." },
        { id = "h_again3", text = "Yes? Do mind the display, it's arranged by volume." },
      },
      choices = {
        { text = "Show me your bags.", next = "BUSINESS" },
        { text = "What makes one bag better than another?", next = "better" },
        { text = "You share a shop with Fizzlespinner.", next = "shop" },
        { text = "What's wrong with how I pack?", next = "pack" },
        { text = "I stitch bags myself.", next = "tailor", when = { profession = "Tailoring" } },
        { text = "What's the most anyone has asked a bag to hold?", next = "most" },
        { text = "Goodbye, Pithwick.", next = "END" },
      },
    },
    better = {
      lines = { { id = "be_default", text = "Seams, first of all. A bag fails at the seam, never in the middle of the cloth, so I turn every one inside out and pull before I'll put it on the shelf. After that it's the mouth, which should be wide enough for your hand and narrow enough to keep the weather out." } },
      choices = {
        { text = "And the best cloth?", next = "better_cloth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    better_cloth = {
      lines = { { id = "bc_default", text = "Linen for a beginner, wool once you're carrying ore, and silk if you can afford it, because silk holds twice its weight and folds to nothing. The dwarves will tell you leather, and the dwarves are wrong, because leather is a third of the load before you've put anything in." } },
      choices = { { text = "I'll take a gnome's word on weight.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    shop = {
      lines = { { id = "sh_default", text = "I rent the corner, and it suits us both. Someone comes in for rope and a tinderbox, discovers they can't fit them in, and takes two steps to their left. I've suggested we draw arrows on the floor, and Fillius says that's undignified." } },
      choices = {
        { text = "Arrows would sell more bags.", next = "shop_arrows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop_arrows = {
      big = true,
      lines = { { id = "sa_default", text = "Eleven percent more, by my estimate! But Fillius says a customer should find what they need without being herded, and I say a customer doesn't know what they need until they're shown. Which of us has it right?" } },
      choices = {
        { text = "Fillius. Let people choose for themselves.", next = "BACK", reply = "Hm. That's the principled answer, and I notice it's also the one with fewer sales in it. Very well.", fx = { align = { honor = 1 } } },
        { text = "You do. Lead them to the till.", next = "BACK", reply = "Exactly! I'll start with one small arrow and see if he notices.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pack = {
      lines = { { id = "pk_default", text = "Heavy things at the bottom and against your back, soft things round the outside, and whatever you need in a hurry at the top. You've got a waterskin on top of your bandages and something sharp next to both, and I could hear it from the door." } },
      choices = {
        { text = "I'll repack tonight, I promise.", next = "BACK", reply = "You won't, nobody does. But thank you for saying so.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailor = {
      lines = { { id = "tl_default", text = "Do you? Then double-stitch the bottom corners and wax your thread, and you'll already be ahead of half of what's offered to me. I turn away more bags than I buy, and it's always the corners." } },
      choices = { { text = "Double-stitched corners. Noted.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    most = {
      lines = { { id = "mo_default", text = "A miner once tried to fit forty bars of iron into a linen sack, and it lasted eleven steps, I counted. I sold him three wool bags and a lecture, and he's bought from me ever since, so the lecture must have been good." } },
      choices = { { text = "Eleven steps is better than I'd have guessed.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dwarves = { { id = "tp_dwarves", text = "Splendid people who pack by throwing things in and sitting on the lid. I've stopped watching, for my own peace." } },
    fizzlespinner = { { id = "tp_fizz", text = "Fillius Fizzlespinner keeps the general goods, and keeps them tidy, which is why I agreed to the corner. I couldn't share a roof with a muddle." } },
    commons = { { id = "tp_commons", text = "Everyone in Ironforge crosses it twice a day carrying too much. From a professional standpoint, it's ideal." } },
    background = { { id = "tp_bg", text = "I sold luggage in Gnomeregan, and now I sell it here. People leave in a hurry more often than you'd think." } },
    _none = { { id = "tp_none", text = "I'm afraid that's outside my field, unless you want to know what size of bag it would fit in." } },
  },
}

---------------------------------------------------------------------------
-- Fizzlebang Booms: gnome fireworks vendor in Tinker Town.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_fizzlebang", id = TODO_NPC("Fizzlebang Booms"), name = "Fizzlebang Booms", title = "Fireworks Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "exuberant", "loud" }, values = { "craft", "joy" },
  notices = { "craft", "race" },
  impression = {
    first = "Fizzlebang Booms sells fireworks in Tinker Town with soot on his sleeves and one eyebrow shorter than the other. He talks about colour and height the way a smith talks about steel.",
    third = "{name} met Fizzlebang Booms, a gnome who sells fireworks in Tinker Town in Ironforge.",
  },
  greetings = {
    { id = "g_gnome", when = { race = "Gnome" }, text = "Fireworks! Oh, a fellow gnome, come in, come in, and tell me honestly whether this one looks green to you." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night's the proper time for them! Take a few up to the gates and aim at the stars, not the guards." },
    { id = "g_hi", text = "Fireworks! Rockets in red, blue and green, and every one tested by me personally, which is why I look like this!" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did they go up? They did go up, didn't they, and not sideways? Good, good." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! You make things that go bang for a reason, and I make things that go bang for no reason at all, so we're practically cousins." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Your people only ever ask how loud it is. It's very loud, and it's also purple, which I think deserves a mention." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Fizzlebang Booms, and yes, that's the name I was born with, so you can see I never had much choice of career. I sell rockets for celebrations, and I think this mountain could do with a few more of those." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "Fizzlebang Booms! You'll remember the displays over the main hall on festival nights, before everything. I'm trying to get the green right again, and I'm nearly there." },
      },
      again = {
        { id = "h_again", text = "What else? Stand clear of the fuse rack while you think." },
        { id = "h_again2", text = "Ask away! I can talk and pack powder, I've nearly always got away with it." },
        { id = "h_again3", text = "Yes? Go on, nothing's lit at the moment." },
      },
      choices = {
        { text = "Show me your fireworks.", next = "BUSINESS" },
        { text = "How do you get the colours?", next = "colour" },
        { text = "Where can you even set them off in here?", next = "where" },
        { text = "What happened to your eyebrow?", next = "eyebrow" },
        { text = "I work with powder too. What's your mix?", next = "eng", when = { profession = "Engineering" } },
        { text = "What's the grandest display you've ever made?", next = "grand" },
        { text = "Goodbye, Fizzlebang.", next = "END" },
      },
    },
    colour = {
      lines = { { id = "co_default", text = "Metal salts, packed into little stars round the charge. Copper gives you blue, which is the hardest, and I've a red that comes from a powder the miners throw away. The green keeps coming out yellow, and I take that very personally." } },
      choices = {
        { text = "What's wrong with yellow?", next = "colour_yellow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    colour_yellow = {
      lines = { { id = "cy_default", text = "Nothing, if you meant yellow! But I promised a green, and a firework is a promise you make to a whole crowd at once. You only get the one moment, and everyone's looking up." } },
      choices = { { text = "That's a fine way to see your craft.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    where = {
      lines = { { id = "wh_default", text = "Not in here, as Tinkmaster Overspark has explained to me several times and once in writing. Outside the gates, on the snow, is best, because the white throws the colour back up at you." } },
      choices = {
        { text = "Has one ever gone off indoors?", next = "where_in" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_in = {
      big = true,
      lines = { { id = "wi_default", text = "Once, and it went the whole length of Tinker Town and out across the Great Forge before it burst. The smiths cheered! The guards did not. I've been told a thing that frightens people shouldn't be sold as a toy, and I've been thinking about whether that's right." } },
      choices = {
        { text = "The guards have a point. Keep them out of the city.", next = "BACK", reply = "I suppose so. I'll put a bigger notice on the rack, and read it to people, slowly.", fx = { align = { order = 1 } } },
        { text = "A little fright is the price of wonder.", next = "BACK", reply = "That's what I think! Though perhaps don't say I agreed, if anyone in uniform asks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eyebrow = {
      lines = { { id = "ey_default", text = "Short fuse, a cold morning and a moment of optimism. It grows back in about six weeks, I've timed it, and it's very nearly a regular occurrence, so I keep a calendar." } },
      choices = { { text = "You're remarkably cheerful about it.", next = "BACK", reply = "Oh, an eyebrow's a small price! I've still got all ten fingers, which in my trade is practically showing off.", fx = { trait = { witty = 1 } } } },
    },
    eng = {
      lines = { { id = "en_default", text = "Slower than yours, I expect! You want a charge to burst a rock, and I want mine to lift gently and then open like a flower. I cut the powder with fine charcoal and a pinch of something I'm not telling Lomac Gearstrip about." } },
      choices = { { text = "Your secret's safe from Lomac.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    grand = {
      lines = { { id = "gd_default", text = "Forty rockets off the slope above the gates, the first winter after we came here, for the refugees. Half the mountain came out to watch, dwarves and gnomes together, and for about a minute nobody was thinking about what we'd lost." } },
      choices = { { text = "That minute was worth the powder.", next = "BACK", reply = "It was. I've been trying to make another one ever since.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    overspark = { { id = "tp_overspark", text = "The Tinkmaster's very fair, and he's only confiscated my stock twice. He gave it back both times, with a note." } },
    tinker_town = { { id = "tp_tinker", text = "Home for now, and the only neighbourhood in Ironforge where a sudden bang makes people look interested instead of alarmed." } },
    gnomeregan = { { id = "tp_gnomer", text = "We'll take it back, and when we do I've a display planned that will be seen from Loch Modan. I've been saving the good blue." } },
    background = { { id = "tp_bg", text = "I make fireworks, I sell fireworks, and now and then I wear them. It's a full life." } },
    _none = { { id = "tp_none", text = "No idea, I'm afraid! Unless it can be made to go up and sparkle, it's not really my area." } },
  },
}

---------------------------------------------------------------------------
-- Second pass of missed Ironforge folk: named shopkeepers, the Timberline Arms and Goldfury counters,
-- supply vendors, profession trainers and their apprentices, and class trainers.
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Grenil Steelfury: weapon merchant at Steelfury's Weapon Emporium in the Commons; Dolman's kinsman.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_grenil", id = TODO_NPC("Grenil Steelfury"), name = "Grenil Steelfury", title = "Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "genial", "shrewd" }, values = { "practical", "family" },
  notices = { "kit", "race" },
  impression = {
    first = "Grenil Steelfury works the second counter at Steelfury's Weapon Emporium and smiles a good deal more than his kinsman Dolman. He will sell a customer whatever they ask for, wrap it nicely and wish them luck with it.",
    third = "{name} met Grenil Steelfury, who sells weapons beside his kinsman at Steelfury's Weapon Emporium in the Ironforge Commons.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome tae Steelfury's! Whatever ye've a mind tae swing, I've got it, an' I'll no' lecture ye about it the way some would." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! A returnin' customer is the best compliment a shop can get, so come in an' look about." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "Come in, wee friend! I've daggers at a sensible height on the low rack, an' I put them there for ye special." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That blade o' yours is near worn through, friend. I'll no' say a word against it, but I'll leave the new ones where ye can see them." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Up on the tram from Stormwind, are ye? Ye'll be wantin' somethin' dwarf-made tae take home, an' ye've come tae the right counter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Grenil Steelfury, at yer service. Dolman at the other counter is my kinsman, an' between us we've got every sort o' steel a body could want, though ye'll find I'm the easier one tae buy from." },
        { id = "h_rich", when = { money = { min = 1000000 } }, text = "Grenil Steelfury, an' I can hear a heavy purse when it walks in. Let me show ye the pieces Dolman keeps at the back for folk he approves of." },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye? There's nae hurry, the steel will keep." },
        { id = "h_again2", text = "Aye, go on. I like a customer who talks, it gives me time tae think what tae sell them." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Dolman says you'd sell anyone anything.", next = "dolman" },
        { text = "How is trade in the Commons?", next = "trade" },
        { text = "What's the strangest thing you've sold?", next = "strange" },
        { text = "You must get a lot of first-time buyers.", next = "first" },
        { text = "Good day, Grenil.", next = "END" },
      },
    },
    dolman = {
      lines = { { id = "do_default", text = "Ha! He said that, did he? I say a customer kens their own arm better than a shopkeeper does, an' if they don't, they'll learn it quicker wi' the wrong axe than wi' a lecture." } },
      choices = {
        { text = "And if the wrong axe gets them killed?", next = "dolman_risk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dolman_risk = {
      big = true,
      lines = { { id = "dr_default", text = "Then I'll grieve, an' I mean that. But I've seen Dolman send a lad away empty-handed for pickin' the wrong sword, an' that lad went out the gates wi' nothin' at all. Which o' us did worse by him?" } },
      choices = {
        { text = "You did right. An armed fool beats an unarmed one.", next = "BACK", reply = "That's how I see it, an' I'll tell Dolman a customer agreed wi' me. He'll sulk till supper.", fx = { align = { order = -1 } } },
        { text = "Dolman did. A shop should have standards.", next = "BACK", reply = "Aye, well, that's the family view, an' I've heard it at every dinner for thirty years.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "tr_default", text = "Brisk, an' I'll no' complain. We're a short walk from the bank an' the auction house, so folk come past wi' fresh coin an' a notion tae spend it. Barim Jurgenstaad sends me his mages when they want a dagger, an' I send him anybody who asks me for powder." } },
      choices = {
        { text = "The shops here look after each other.", next = "trade_neighbours" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_neighbours = {
      lines = { { id = "tn_default", text = "We have tae, for the Commons is small an' a grudge would last a hundred years. Myra Tyrngaarde brings us bread at noon, Pithwick sells the bags our customers forget they need, an' nobody undercuts anybody on a feast day." } },
      choices = { { text = "That sounds like a good neighbourhood.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    strange = {
      lines = { { id = "st_default", text = "A two-handed hammer tae a gnome mage, who wanted it for a paperweight. She paid in full, had it carried tae the Hall o' Mysteries by two porters, an' as far as I ken it's holdin' down her notes tae this day." } },
      choices = { { text = "Dolman must have loved that.", next = "BACK", reply = "He didnae speak tae me for a week, an' it was the most peaceful week I've had in this shop.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "fi_default", text = "Every day. Ye can tell them by the way they hold a sword out in front like it might bite. I give them somethin' plain an' sound, an' I tell them tae come back when they've notched it, because the second weapon is the one that matters." } },
      choices = {
        { text = "Why the second?", next = "first_second" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_second = {
      lines = { { id = "fs_default", text = "Because by then they ken what they are. The first one's bought on a dream, an' the second's bought by somebody who's been hit a few times an' has opinions about reach." } },
      choices = { { text = "I remember buying my second.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dolman = { { id = "tp_dolman", text = "The best judge o' steel in the Commons an' the worst salesman. I'd no' trade him, but I'd no' let him near the till on a busy day either." } },
    commons = { { id = "tp_commons", text = "The best pitch in Ironforge. Everybody passes through wi' coin in hand, an' most o' them pass our door." } },
    great_forge = { { id = "tp_forge", text = "Where our stock is born. I go up once a week tae haggle wi' the journeymen, an' I come back wi' singed eyebrows an' good prices." } },
    background = { { id = "tp_bg", text = "A Steelfury, same as Dolman, an' raised behind this counter. I could price an axe before I could read." } },
    _none = { { id = "tp_none", text = "I couldnae say, friend. Now if ye'd asked me what tae hit it wi', I'd have three answers ready." } },
  },
}

---------------------------------------------------------------------------
-- Ginny Longberry: gnome reagent vendor who runs Longberry's Reagents in the Mystic Ward.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_ginny", id = TODO_NPC("Ginny Longberry"), name = "Ginny Longberry", title = "Reagents",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "brisk", "exact" }, values = { "knowledge", "order" },
  notices = { "class", "race" },
  impression = {
    first = "Ginny Longberry runs Longberry's Reagents in the Mystic Ward, a step from the Hall of Mysteries, and keeps every jar labelled twice. She can usually guess what a caster needs before they have finished asking.",
    third = "{name} met Ginny Longberry, the gnome who runs Longberry's Reagents in the Mystic Ward of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Longberry's Reagents! Everything is labelled, everything is weighed, and nothing in here is as dangerous as it smells." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? You're either casting a great deal or wasting a great deal, and I'm happy to supply either habit." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage! Let me guess, you're down to your last rune and you only noticed at the door of the Hall." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You'll want candles, or a Symbol if you've got that far. The priests across the water buy them by the box, and I keep the good wax for them." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "It's good to see one of us in the Mystic Ward. The dwarves are kind, but they will keep putting things on the top shelf." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ginny Longberry, and this is my shop. I sell the small things a spell uses up, which means powders, runes, candles and seeds, and I sell them to nearly everybody who walks out of the Hall of Mysteries." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "Ginny Longberry. I do stock what your sort needs, and I'd thank you to buy it quietly, because the priests next door count my customers." },
      },
      again = {
        { id = "h_again", text = "Yes? I can weigh and talk at once, I've had the practice." },
        { id = "h_again2", text = "Anything else? Mind the left-hand shelf, the jars there don't like being bumped." },
      },
      choices = {
        { text = "Let me see your reagents.", next = "BUSINESS" },
        { text = "Why does a spell need reagents at all?", next = "why" },
        { text = "You're well placed, beside the Hall of Mysteries.", next = "place" },
        { text = "Is Bimble Longberry a relation of yours?", next = "bimble" },
        { text = "What sells out fastest?", next = "fast" },
        { text = "Do the priests and mages get along?", next = "along" },
        { text = "Goodbye, Ginny.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because some magic wants paying in advance. A rune holds the shape of a place so the mage doesn't have to, and a pinch of powder gives a spell something to burn besides the caster. I think of myself as selling shortcuts, and safe ones." } },
      choices = {
        { text = "And without the shortcut?", next = "why_without" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_without = {
      lines = { { id = "ww_default", text = "Then you get half a portal, which I'm told is a great deal worse than none. Milstaff Stormeye over in the Hall keeps a list of students who tried it, and he reads it aloud to each new class." } },
      choices = { { text = "I'll keep my runes stocked.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    place = {
      lines = { { id = "pl_default", text = "I chose it on purpose, after counting who went in and out for a week. Students come out of a lesson knowing exactly what they've run short of, and I'm the first door they see. Barim Jurgenstaad has the Commons, and we don't trouble each other." } },
      choices = {
        { text = "You counted for a whole week?", next = "place_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    place_count = {
      lines = { { id = "pc_default", text = "Six days and a half, with a tally sheet for each door. It came to four hundred and twelve casters and one very lost ram, and I've never regretted the rent since." } },
      choices = { { text = "That's a gnome's way to choose a shop.", next = "BACK", reply = "It's the only way! Anything else is guessing with your savings.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    bimble = {
      lines = { { id = "bi_default", text = "She's family, yes, and she's the one walking round the ward with a basket of apples. We tried sharing the shop, but fruit and reagents can't sit on one counter, because people get muddled and I won't have anyone biting a rune." } },
      choices = { { text = "A sensible separation.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    fast = {
      big = true,
      lines = { { id = "fa_default", text = "Runes of teleportation, by a long way, and I can tell you why: half the mages in this city hop to Stormwind for lunch. I've wondered whether I ought to sell a rune to someone who only wants it to skip a walk." } },
      choices = {
        { text = "Magic isn't a toy. Make them walk.", next = "BACK", reply = "That's what High Priest Rohan would say, and he'd be pleased with you. My till would not.", fx = { align = { order = 1 } } },
        { text = "It's their coin and their spell.", next = "BACK", reply = "That's my feeling too. A walk never taught anyone arcane theory.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    along = {
      lines = { { id = "y1_default", text = "Like neighbours with a shared wall. The priests think the mages are reckless and the mages think the priests are slow, and they both come to me to complain, which is good for trade. Bink and Braenna Flintcrag take tea together, so it can't be serious." } },
      choices = { { text = "Complaints are custom, I suppose.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    mystic_ward = { { id = "tp_ward", text = "The quiet side of Ironforge, with the pool and the Hall of Mysteries. It smells of incense and wet stone, and I've grown fond of it." } },
    hall_of_mysteries = { { id = "tp_hall", text = "Priests, paladins and mages all under one roof, and somehow they haven't burned it down. They're my best customers, every one." } },
    barim = { { id = "tp_barim", text = "Barim Jurgenstaad sells reagents in the Commons. He's careful and dry and never short-weighs, and I'd buy from him if I didn't have my own." } },
    background = { { id = "tp_bg", text = "I kept stores for a laboratory in Gnomeregan. It's the same work here, only now the shelves are my own." } },
    _none = { { id = "tp_none", text = "That isn't on any of my labels, so I'm afraid I can't help you with it." } },
  },
}

---------------------------------------------------------------------------
-- Bimble Longberry: gnome fruit vendor who walks the Mystic Ward with a basket.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_bimble", id = TODO_NPC("Bimble Longberry"), name = "Bimble Longberry", title = "Fruit Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "sunny", "chatty" }, values = { "kind", "practical" },
  notices = { "hunger", "race" },
  impression = {
    first = "Bimble Longberry walks the Mystic Ward with a basket of fruit nearly as big as she is, calling out what is ripe. She is certain that most of what ails Ironforge could be mended with an apple.",
    third = "{name} met Bimble Longberry, a gnome who sells fruit from a basket in the Mystic Ward of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Fresh fruit! Apples, melons and bananas, all the way up the mountain and not a bruise on them!" },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I've saved you a good one, or I would have if I'd known you were coming, so have this one instead." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Still up? So am I, because the mages study late and they forget to eat until somebody walks past with a basket." },
  },
  notice = {
    { id = "n_tired", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "Oh, you look quite done in! Sit on the edge of the pool for a minute and eat something that grew in sunlight." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf who's stopped for fruit! You're the third this month, and I'm keeping count because I think it's catching on." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Bimble Longberry, and this is the only fresh fruit in the Mystic Ward. Dwarves eat bread and meat and more bread, so somebody has to walk about reminding people that apples exist." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "Bimble Longberry! You'll remember the hydroponic gardens on the fourth level, won't you? I think about those melons more than is probably healthy." },
      },
      again = {
        { id = "h_again", text = "Something else? Hold the basket a moment if you like, my arm could do with the rest." },
        { id = "h_again2", text = "Go on, I've got all day and only one circuit to walk." },
      },
      choices = {
        { text = "What's in the basket today?", next = "BUSINESS" },
        { text = "Where does fruit come from, up here?", next = "from" },
        { text = "That basket is nearly as big as you are.", next = "basket" },
        { text = "Who buys the most from you?", next = "buyers" },
        { text = "Why walk, when you could have a stall?", next = "walk" },
        { text = "What's the best fruit you've ever sold?", next = "best" },
        { text = "Goodbye, Bimble.", next = "END" },
      },
    },
    from = {
      lines = { { id = "fr_default", text = "Not from Dun Morogh, I can tell you, because nothing grows out there but pine and bad tempers. It comes up from Elwynn on the Deeprun Tram, and I meet the morning car myself so that I get first pick of the crates." } },
      choices = {
        { text = "The tram must be hard on soft fruit.", next = "from_tram" },
        { text = "Something else.", next = "BACK" },
      },
    },
    from_tram = {
      lines = { { id = "ft_default", text = "It's dreadful! The cars start with a jolt, and a jolt is all a peach needs. I've written to the tram engineers with a design for a sprung crate, and they wrote back that fruit was not a priority, which shows you what engineers eat." } },
      choices = { { text = "A sprung crate sounds worth building.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    basket = {
      lines = { { id = "ba_default", text = "It holds thirty-one apples or four melons, and I can carry it for exactly one circuit of the ward before I need to sit down. I did the sums so that the sitting down happens beside the pool, where the priests are." } },
      choices = { { text = "You've planned your rests as well as your route.", next = "BACK", reply = "Of course! A rest beside customers is hardly a rest at all, it's a stall with no rent.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "The mage students, because they study till their hands shake and then remember they haven't eaten since yesterday. Bink buys a banana every afternoon, and High Priest Rohan takes one apple a week and blesses the basket, which I think helps." } },
      choices = {
        { text = "Does anyone refuse outright?", next = "buyers_refuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_refuse = {
      lines = { { id = "br_default", text = "The paladins, mostly, and they're terribly polite about it. Brandur Ironhammer told me a dwarf gets all the fruit he needs from what goes into ale, and I couldn't think of an answer quickly enough." } },
      choices = { { text = "He's not entirely wrong about ale.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    walk = {
      lines = { { id = "wa_default", text = "Because nobody goes looking for fruit, they only buy it when it walks up to them. Ginny has her shop and her labels, and I have my feet. Between us we see everybody in the ward twice a day." } },
      choices = { { text = "The ward is lucky to have you both.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "y1_default", text = "A crate of Stranglethorn mangoes that came up by mistake! Nobody in Ironforge had seen one. I sold them by the slice, and Tinkmaster Overspark sent an apprentice all the way from Tinker Town for the last. I've asked for more every week since, and nobody knows where the first crate came from." } },
      choices = { { text = "I hope another crate goes astray.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    ginny = { { id = "tp_ginny", text = "Ginny's family, and she runs the reagent shop. She labels everything twice, including, one year, me." } },
    mystic_ward = { { id = "tp_ward", text = "It's the prettiest part of the city, with the water and the lamps. It's also the only part where people look as if they need feeding." } },
    gnomeregan = { { id = "tp_gnomer", text = "We had gardens under glass there, with lamps like little suns. I'd like to see them lit again before I'm too old to carry a basket." } },
    background = { { id = "tp_bg", text = "I sell fruit and I walk in circles. It's healthier than most trades in this mountain." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, I'm sorry! I could tell you whether it's ripe, if it's a fruit." } },
  },
}

---------------------------------------------------------------------------
-- Bretta Goldfury: gun merchant at Goldfury's Hunting Supplies in the Military Ward.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_bretta", id = TODO_NPC("Bretta Goldfury"), name = "Bretta Goldfury", title = "Gun Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "loud", "confident" }, values = { "craft", "family" },
  notices = { "class", "craft" },
  impression = {
    first = "Bretta Goldfury sells rifles and shot at Goldfury's Hunting Supplies in the northeast corner of the Military Ward. She has spent so long around gunfire that she speaks a little louder than the room needs.",
    third = "{name} met Bretta Goldfury, who sells guns at Goldfury's Hunting Supplies in the Military Ward of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Goldfury's! Guns on my side, bows on Skolmin's, an' if ye cannae decide I'll decide for ye, an' it'll be a gun." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more shot? Good, that means ye've been usin' it instead o' polishin' the barrel." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter! Come round this side o' the shop, {g:lad|lass}, an' don't let my kinsman talk ye intae a bit o' bent wood." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Ye've powder under yer nails, so ye make yer own. Show me the bore on yer best piece sometime, I like tae see what the workshops are turnin' out." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye carry that like ye ken which end's which. Ye'd be surprised how many come in here who don't." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bretta Goldfury, an' I sell the finest long guns in Ironforge. Skolmin sells bows at the other counter, for folk who like tae be quiet about their huntin', an' we've agreed tae differ on that for years." },
        { id = "h_nohunter", when = { class = { "MAGE", "PRIEST", "WARLOCK", "PALADIN" } }, text = "Bretta Goldfury. Ye'll no' be shootin' one yerself, I can see that, but there's nae harm in admirin' good work, so look all ye like." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up a bit, I've spent thirty years next tae a test range." },
        { id = "h_again2", text = "Aye, go on, I'm listenin' wi' my good ear." },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Why a gun over a bow?", next = "why" },
        { text = "Who makes these rifles?", next = "makers" },
        { text = "You two share a shop and disagree on everything.", next = "skolmin" },
        { text = "What should a hunter carry in Dun Morogh?", next = "carry", when = { class = "HUNTER" } },
        { text = "What goes wrong with a gun most often?", next = "wrong" },
        { text = "Good day, Bretta.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because a gun doesnae care how strong yer arm is or how long ye've practised. A dwarf, a gnome or a human recruit can pick one up an' put a hole in a trogg at sixty paces by the end o' the week. A bow takes years, an' the troggs willnae wait." } },
      choices = {
        { text = "And the noise?", next = "why_noise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_noise = {
      lines = { { id = "wn_default", text = "The noise is half the point! A wendigo that hears one shot thinks twice about the rest o' the party. Skolmin says ye scare off yer supper as well, an' I say supper's cheaper at the Stonefire than a new leg." } },
      choices = { { text = "You've had this argument before.", next = "BACK", reply = "Every day since we opened, an' I've no' lost it yet, whatever he tells ye.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    makers = {
      lines = { { id = "ma_default", text = "The barrels are bored by dwarves at the Great Forge, an' the locks come from Tinker Town, since the gnomes have smaller fingers an' more patience. I fit them together an' prove every one on the range before it goes on the wall." } },
      choices = {
        { text = "Dwarf barrel, gnome lock. Who gets the credit?", next = "makers_credit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    makers_credit = {
      lines = { { id = "mc_default", text = "The Goldfury name goes on the stock, an' I pay both o' them fair for the privilege. I'll say this for the gnomes, though: since they came tae live wi' us, I've no' had a single lock misfire." } },
      choices = { { text = "That's fair praise.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    skolmin = {
      big = true,
      lines = { { id = "sk_default", text = "We do, an' it's good for trade, for a customer who hears us argue buys from one of us tae end it. Mind, there's truth under it. He thinks a hunter should take only what's needed, quiet-like, an' I think ye should make certain. Where do ye stand?" } },
      choices = {
        { text = "Take only what you need, and take it cleanly.", next = "BACK", reply = "Ye'd best go an' stand at his counter, then. He'll be unbearable about it.", fx = { align = { light = 1 } } },
        { text = "Make certain. A wounded beast is worse than a dead one.", next = "BACK", reply = "There's sense! I'll tell Skolmin the customer has spoken.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = { { id = "ca_default", text = "A short rifle wi' a heavy ball, for the boars are thick in the hide an' the bears are thicker. Leave the long fowlin' pieces for Loch Modan, where ye've room tae see what ye're aimin' at." } },
      choices = { { text = "Show me the short rifles.", next = "BUSINESS" }, { text = "Something else.", next = "BACK" } },
    },
    wrong = {
      lines = { { id = "y1_default", text = "Damp powder, an' after that, a dirty barrel. Folk blame the gun, an' the gun's never at fault. I've had rifles come back tae me packed solid wi' six shots' worth o' soot, an' the owner swearin' it misfired by itself." } },
      choices = { { text = "I'll keep mine clean.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    skolmin = { { id = "tp_skolmin", text = "My kinsman, an' a fine bowyer, an' wrong about nearly everythin'. I'd have nobody else across the shop from me." } },
    military_ward = { { id = "tp_ward", text = "The Hall o' Arms is just along the way, so every recruit wi' a week's pay walks past my door. It's the best pitch in the city for my trade." } },
    hall_of_arms = { { id = "tp_hall", text = "Regnus an' Daera teach the hunters there, an' they send them on tae us tae be kitted out. I send them back when they've questions I cannae answer wi' a price." } },
    background = { { id = "tp_bg", text = "A Goldfury, born in this ward, an' I fired my first shot before I'd my first braid." } },
    _none = { { id = "tp_none", text = "I've nae idea. If it cannae be loaded, aimed or cleaned, ye've come tae the wrong dwarf." } },
  },
}

---------------------------------------------------------------------------
-- Skolmin Goldfury: bow merchant at Goldfury's Hunting Supplies in the Military Ward.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_skolmin", id = TODO_NPC("Skolmin Goldfury"), name = "Skolmin Goldfury", title = "Bow Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "quiet", "patient" }, values = { "craft", "nature" },
  notices = { "class", "race" },
  impression = {
    first = "Skolmin Goldfury sells bows, crossbows and arrows at Goldfury's Hunting Supplies, across the shop from Bretta and her guns. He speaks quietly, partly from habit and partly to make her lean in.",
    third = "{name} met Skolmin Goldfury, who sells bows at Goldfury's Hunting Supplies in the Military Ward of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome. Bows an' arrows are on this side, an' ye'll find it's the quieter side in every sense." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've come back, so the string held. I'd expect nothin' less, but it's good tae hear." },
    { id = "g_elf", when = { race = "NightElf" }, text = "A night elf in my shop. I'll no' pretend I can teach yer folk anythin' about a bow, but I'd be glad o' yer opinion on mine." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye've a hunter's shoulders, the right one set a wee bit lower. That comes from years o' drawin', an' I'm glad tae see it." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Yer people have been bendin' wood since before this mountain was hollowed. I've a yew stave I'd like ye tae look at, if ye've a moment." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Skolmin Goldfury, bowyer. Most dwarves think a bow is a thing for elves an' poachers, an' my kinswoman Bretta will tell ye so from across the room. I've kept this counter thirty years all the same." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Skolmin Goldfury. Ye'll have heard Bretta already, I expect, most o' the ward has. When ye're ready tae hunt somethin' without tellin' the whole valley, come an' see me." },
      },
      again = {
        { id = "h_again", text = "What else would ye like tae ken? I'm in nae hurry." },
        { id = "h_again2", text = "Aye, ask. I can string a bow an' listen at once." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "A dwarf bowyer is a rare thing.", next = "rare" },
        { text = "What wood do you use, in a land of pine?", next = "wood" },
        { text = "Bretta says the gun has won the argument.", next = "bretta" },
        { text = "What makes a good arrow?", next = "arrow" },
        { text = "How long does a bow take to make?", next = "long" },
        { text = "Good day, Skolmin.", next = "END" },
      },
    },
    rare = {
      lines = { { id = "ra_default", text = "It is, an' I've stopped mindin' the jokes. I learned it huntin' wi' my grandfather in the high passes, where one shot from a gun brings the snow down on yer head. Ye learn tae love a quiet weapon up there." } },
      choices = {
        { text = "Did the snow ever come down?", next = "rare_snow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rare_snow = {
      lines = { { id = "rs_default", text = "Once, on a party o' riflemen two ridges over. We dug for a day an' found three of the five. I've made bows ever since, an' I've never tried tae talk a rifleman out o' his gun, only tae sell him a second choice." } },
      choices = { { text = "That's a hard way to learn a trade.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    wood = {
      lines = { { id = "wo_default", text = "No' pine, that's certain, for it snaps like a biscuit. I have ash an' yew brought up from Elwynn, an' I back the heavier bows wi' ram's horn from the Amberstill ranch, which gives them a kick a plain stave never has." } },
      choices = {
        { text = "Horn-backed bows are a dwarven idea?", next = "wood_horn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_horn = {
      lines = { { id = "wh_default", text = "It's my idea, an' I'm fair proud of it. A dwarf's arms are short an' strong, so I make a short bow that draws heavy. Put a long elven bow in a dwarf's hands an' he'll trip over it on the stairs." } },
      choices = { { text = "Built for the archer, not the legend.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    bretta = {
      lines = { { id = "br_default", text = "She says a good many things, an' she says them loud. A gun is the better tool for a soldier, an' I'll grant her that. But a hunter who cannae get close enough for a bow hasnae learned tae hunt, only tae shoot." } },
      choices = {
        { text = "A fair distinction.", next = "BACK", fx = { affinity = 1 } },
        { text = "Don't tell her I agreed with you.", next = "BACK", reply = "I'll no' need tae. She'll see it on my face an' start in before ye've reached the door.", fx = { trait = { witty = 1 } } },
      },
    },
    arrow = {
      lines = { { id = "ar_default", text = "Straightness first, an' then weight that matches the bow. Folk fuss over the head, but it's the fletchin' that decides where it goes. I use gryphon feathers when Gryth Thurden's birds are moultin', an' there's nothin' finer." } },
      choices = { { text = "Gryphon-fletched arrows. I'll remember that.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    long = {
      lines = { { id = "y1_default", text = "A season, if ye count the dryin'. The stave sits a winter before I'll touch it, an' the horn an' glue want a month tae set. Bretta can fit a rifle in a day, an' she reminds me of it. I tell her nothin' good was ever rushed, an' she tells me that's what slow folk say." } },
      choices = { { text = "A season's work deserves respect.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    bretta = { { id = "tp_bretta", text = "Bretta's my kin an' the best gunsmith's eye in the ward. She's deaf in one ear an' pretends it's both when I'm winnin'." } },
    military_ward = { { id = "tp_ward", text = "Soldiers, recruits an' drill sergeants, all o' them loud. I keep the quiet corner o' the loudest ward in Ironforge." } },
    amberstill = { { id = "tp_amber", text = "The Amberstills raise rams out past Kharanos, an' they sell me the shed horn. It's the best bow-backin' in the Eastern Kingdoms, though they think I'm daft for wantin' it." } },
    background = { { id = "tp_bg", text = "A Goldfury an' a bowyer, which my family thinks is one word too many." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. I ken wood, horn an' feather, an' no' a great deal else." } },
  },
}

---------------------------------------------------------------------------
-- Brenwyn Wintersteel: blade merchant at Timberline Arms in the Military Ward.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_brenwyn", id = TODO_NPC("Brenwyn Wintersteel"), name = "Brenwyn Wintersteel", title = "Blade Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "cool", "exact" }, values = { "craft", "honest" },
  notices = { "class", "kit" },
  impression = {
    first = "Brenwyn Wintersteel sells swords and daggers at Timberline Arms in the Military Ward. She tests an edge on her thumbnail while she talks and never seems to cut herself.",
    third = "{name} met Brenwyn Wintersteel, the blade merchant at Timberline Arms in the Military Ward of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Timberline Arms. Blades are mine, so if it has an edge an' a point, ye're talkin' tae the right dwarf." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Let me see the edge on the last one before ye tell me how it served." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Daggers are in the case on the left. I'll no' ask what they're for, an' ye'll no' tell me, an' we'll both sleep well." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Ye've been choppin' wi' that blade like it was an axe. It's a sword, {g:lad|lass}, an' it wants tae be drawn across, no' swung down." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye've the wrists for a longer blade than the one ye're wearin'. Try the third from the end before ye go." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Brenwyn Wintersteel. There are four of us under this roof, an' we split the trade by what the thing does: I sell what cuts, Hegnar sells what chops, Kelomir sells what crushes, an' Thalgus sells whatever's left." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Brenwyn Wintersteel. Aye, a dwarf who sells swords, an' ye can save the joke, for Hegnar makes it every mornin' before his porridge." },
      },
      again = {
        { id = "h_again", text = "What else? I've an edge tae finish, but I can talk over it." },
        { id = "h_again2", text = "Go on, then, an' keep yer sleeve away from the rack." },
      },
      choices = {
        { text = "Show me your blades.", next = "BUSINESS" },
        { text = "Why swords, in a city of axes?", next = "why" },
        { text = "Four merchants in one shop sounds crowded.", next = "four" },
        { text = "How do you tell a good edge?", next = "edge" },
        { text = "What blade suits a quiet sort of work?", next = "quiet", when = { class = "ROGUE" } },
        { text = "Who buys swords, in Ironforge?", next = "buyers" },
        { text = "Good day, Brenwyn.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because an axe has one good answer an' a sword has a dozen. Ye can cut, thrust, parry an' turn another blade aside wi' it. I saw a Stormwind knight fence in the Hall o' Arms when I was a girl, an' I never looked at an axe the same way again." } },
      choices = {
        { text = "What did your family say?", next = "why_family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_family = {
      lines = { { id = "wf_default", text = "My father said it was a phase, an' that was sixty years ago. He carries one o' my short swords now, under his cloak, where his friends cannae see it." } },
      choices = { { text = "That's a quiet sort of victory.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    four = {
      lines = { { id = "fo_default", text = "It is, an' it works. Nobody steps on another's counter, an' a customer who cannae decide gets passed along the room till somethin' fits. The only quarrel is over who sweeps." } },
      choices = {
        { text = "And who does sweep?", next = "four_sweep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    four_sweep = {
      lines = { { id = "fw_default", text = "Thalgus, since he sells the odds an' ends an' has the least tae polish. He's kept a tally o' every sweepin' for eleven years, an' he reads it out at Winter Veil." } },
      choices = { { text = "Every shop needs a Thalgus.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    edge = {
      big = true,
      lines = { { id = "ed_default", text = "By the light along it. Hold it tae the lamp, an' a true edge shows nae line at all, while a dull one shines back at ye. I'll sell a plain blade wi' a true edge before a pretty one wi' a false, though the pretty ones pay better." } },
      choices = {
        { text = "Honest steel first. The rest is vanity.", next = "BACK", reply = "Aye, an' I'd have ye say it louder, so the whole shop can hear.", fx = { align = { honor = 1 } } },
        { text = "Sell the pretty ones. Coin keeps the doors open.", next = "BACK", reply = "Ye sound like my ledger. It isnae wrong, but I dinnae have tae like it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = { { id = "qu_default", text = "Somethin' short, dark in the steel an' thin enough tae find a gap. I keep a few I had blued so they'll no' catch the lamplight, an' Ormyr Flinteye's students buy them as fast as I can get them." } },
      choices = { { text = "Show me those.", next = "BUSINESS" }, { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "y1_default", text = "Humans, mostly, up on the tram, an' the gnome warriors, who cannae lift a great axe an' are tired o' bein' told so. An' more young dwarves than their fathers ken. I wrap those in plain cloth, an' they carry them home like contraband." } },
      choices = { { text = "A quiet rebellion, one sword at a time.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    timberline = { { id = "tp_timber", text = "Timberline Arms has stood in the Military Ward longer than I've been alive. The name's from the first owner, who came down from the tree line wi' a cart o' hunting knives." } },
    hegnar = { { id = "tp_hegnar", text = "Hegnar Swiftaxe sells the axes, an' he thinks a sword is an axe that lost its nerve. He's a good dwarf, an' I'd no' tell him so." } },
    military_ward = { { id = "tp_ward", text = "It's all drill an' shoutin', an' every one o' them needs somethin' sharp. I've nae complaints." } },
    background = { { id = "tp_bg", text = "I've sold blades at this counter since I was old enough tae be trusted wi' the keys." } },
    _none = { { id = "tp_none", text = "I dinnae ken. Ask me about a blade an' I'll keep ye here till supper." } },
  },
}

---------------------------------------------------------------------------
-- Hegnar Swiftaxe: axe merchant at Timberline Arms in the Military Ward.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_hegnar_axe", id = TODO_NPC("Hegnar Swiftaxe"), name = "Hegnar Swiftaxe", title = "Axe Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "hearty", "stubborn" }, values = { "tradition", "brave" },
  notices = { "race", "class" },
  impression = {
    first = "Hegnar Swiftaxe sells axes at Timberline Arms and believes no other weapon needs to exist. He is broad, loud and fond of demonstrating a swing in a shop that is too small for it.",
    third = "{name} met Hegnar Swiftaxe, the axe merchant at Timberline Arms in the Military Ward of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Ho! Ye've the look o' somebody who needs an axe. Everybody has that look, mind, but on ye it's stronger." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did it bite deep? O' course it did, for I sold it tae ye myself." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf, by my beard, an' walkin' straight past the swords! Yer mother raised ye right." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ye've the shoulders for a great axe, {g:lad|lass}. It'd be a waste tae hang anythin' smaller on them." },
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Ye'll no' be liftin' one o' mine, I think. Kelomir has staves at the next counter, an' he's gentle wi' yer sort." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hegnar Swiftaxe, an' the name's nae accident. My family's sold axes in this ward since the War o' the Three Hammers, an' I've never once had a customer come back tae say it was too sharp." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Hegnar Swiftaxe. A warrior, an' a proper one by the look. Come round the counter an' feel the weight o' this one before ye say a word." },
      },
      again = {
        { id = "h_again", text = "What else? Stand back a pace, I talk wi' my hands." },
        { id = "h_again2", text = "Aye, ask away, I've nothin' but axes an' time." },
      },
      choices = {
        { text = "Show me your axes.", next = "BUSINESS" },
        { text = "Why does a dwarf love an axe so?", next = "love" },
        { text = "You're kin to Granis Swiftaxe in Kharanos, I'd guess.", next = "granis" },
        { text = "One hand or two?", next = "hands" },
        { text = "Brenwyn says a sword has a dozen answers.", next = "brenwyn" },
        { text = "What's the finest axe you've ever sold?", next = "finest" },
        { text = "Good day, Hegnar.", next = "END" },
      },
    },
    love = {
      lines = { { id = "lo_default", text = "Because it's honest! It fells a tree, splits yer firewood, opens a keg an' closes an argument, an' it never pretends tae be anythin' else. We cut this mountain's first timbers wi' axes before we'd a single forge lit." } },
      choices = {
        { text = "And it suits a dwarf's build.", next = "love_build" },
        { text = "Something else.", next = "BACK" },
      },
    },
    love_build = {
      lines = { { id = "lb_default", text = "There, ye see it! We're short in the arm an' thick in the back, so all the weight goes tae the head o' the axe, where it's wanted. A tall man wi' a sword is reachin', an' a dwarf wi' an axe is arrivin'." } },
      choices = { { text = "Reaching and arriving. I like that.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    granis = {
      lines = { { id = "gr_default", text = "A cousin, aye, an' he teaches the young warriors down at the Thunderbrew. He sends them up tae me when they've outgrown their trainin' axe, an' I send him a cask at Brewfest for the custom." } },
      choices = { { text = "A family business, then, one way or another.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    hands = {
      lines = { { id = "ha_default", text = "That's the only real question in my trade. One hand an' a shield if ye mean tae stand in a line an' live, an' two hands if ye mean tae end it quick an' trust yer friends tae keep ye standin'." } },
      choices = {
        { text = "Which do you carry?", next = "hands_own" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hands_own = {
      big = true,
      lines = { { id = "ho_default", text = "Two hands, always, an' my wife calls it vanity. She says a dwarf wi' a family has nae business leavin' his shield at home. I say the best guard is tae finish it first. What's yer own way?" } },
      choices = {
        { text = "Shield up. You owe your family a safe return.", next = "BACK", reply = "Ye'd get on wi' her. Aye, well, maybe I'll take the buckler down an' dust it.", fx = { align = { order = 1 } } },
        { text = "Strike first and hardest. Caution loses fights.", next = "BACK", reply = "Ha! I'll tell her a stranger took my side, an' sleep in the shop for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brenwyn = {
      lines = { { id = "bw_default", text = "Aye, an' eleven o' them are ways tae avoid hittin' somebody. She's the finest judge of an edge in Ironforge, I'll give her that, an' she sharpens my display pieces when she thinks I'm no' lookin'." } },
      choices = { { text = "So you do like her swords a little.", next = "BACK", reply = "I like her edges. The swords I put up wi'.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    finest = {
      lines = { { id = "y1_default", text = "A great axe from the Great Forge, wi' a haft o' black ash an' a head ye could shave by. A mountaineer captain bought it, an' she's carried it at the South Gate for twelve years. She brings it in every Winter Veil so I can look at it, an' I'm no' ashamed tae say I've wept." } },
      choices = { { text = "That's a craftsman's reward.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    timberline = { { id = "tp_timber", text = "Four counters an' one roof. It'd be the finest shop in the ward if three o' them sold axes as well." } },
    brenwyn = { { id = "tp_brenwyn", text = "Brenwyn Wintersteel sells swords an' daggers. She's sharp in every sense, an' I'd no' cross her on a matter of steel." } },
    hall_of_arms = { { id = "tp_hall", text = "Kelstrum Stonebreaker trains the warriors there, an' he sends them tae me when they're ready for real iron. A good arrangement, that." } },
    background = { { id = "tp_bg", text = "A Swiftaxe, an' we've sold what the name says for longer than the ward's had walls." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, friend, but if it ever needs choppin', then I'm the dwarf tae see." } },
  },
}

---------------------------------------------------------------------------
-- Kelomir Ironhand: maces and staves at Timberline Arms in the Military Ward.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_kelomir", id = TODO_NPC("Kelomir Ironhand"), name = "Kelomir Ironhand", title = "Maces & Staves",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "gentle", "thoughtful" }, values = { "pious", "craft" },
  notices = { "class", "race" },
  impression = {
    first = "Kelomir Ironhand sells maces and staves at Timberline Arms, so his customers are paladins, priests and mages. He is the quietest of the four merchants and the only one the casters are not afraid to ask.",
    third = "{name} met Kelomir Ironhand, who sells maces and staves at Timberline Arms in the Military Ward of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Good day tae ye. Maces an' staves are at this end, an' ye're welcome tae lift any o' them." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I hope the last one sat well in the hand, an' if it didnae, tell me, an' we'll find ye another." },
    { id = "g_pal", when = { class = "PALADIN" }, text = "Light be wi' ye, {g:brother|sister}. I've a hammer on the wall I think has been waitin' for a paladin." },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Ye lean on that staff more than ye wield it, which tells me it's a hand too long. I can cut one tae yer height." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "I keep the short staves on the low pegs, friend. Ye'll no' need tae ask anybody tae fetch one down." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kelomir Ironhand. The others in this shop sell things for cuttin', an' I sell things for folk who'd sooner no' draw blood, which is a larger crowd than ye'd think in a soldier's ward." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "Kelomir Ironhand, an' ye're very welcome. The priests come over from the Mystic Ward tae me, since I'm the only weapon merchant who doesnae make them feel foolish for askin'." },
      },
      again = {
        { id = "h_again", text = "Is there aught else? Take yer time." },
        { id = "h_again2", text = "Aye, I'm listenin'. The others are loud enough for the whole shop, so I've learned tae." },
      },
      choices = {
        { text = "Show me your maces and staves.", next = "BUSINESS" },
        { text = "Why do priests carry maces?", next = "priests" },
        { text = "A staff is a strange thing to sell beside hammers.", next = "staff" },
        { text = "How do you get on with the other three?", next = "others" },
        { text = "What makes a paladin's hammer different?", next = "hammer", when = { class = "PALADIN" } },
        { text = "What's the oldest piece in your stock?", next = "oldest" },
        { text = "Light keep you, Kelomir.", next = "END" },
      },
    },
    priests = {
      lines = { { id = "pr_default", text = "It's an old vow among some o' them, tae shed nae blood by the edge. A mace breaks a bone an' leaves the rest tae the Light's mercy. I've thought a good deal about whether that's a real difference or a comfortable one." } },
      choices = {
        { text = "And what did you decide?", next = "priests_decide" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests_decide = {
      big = true,
      lines = { { id = "pd_default", text = "I havenae, an' I've sold maces forty years. A man struck down is struck down. Still, a priest who chooses the mace has at least stopped tae ask the question, an' most who buy swords never do. How does it sit wi' ye?" } },
      choices = {
        { text = "The asking matters. Restraint is a virtue.", next = "BACK", reply = "That's the kinder readin', an' I'll hold tae it. Thank ye.", fx = { align = { light = 1 } } },
        { text = "Dead is dead. The vow is only for show.", next = "BACK", reply = "Aye, there are days I think the same. I sell them anyway, an' pray over the till.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    staff = {
      lines = { { id = "sf_default", text = "It is, an' Hegnar calls my end o' the shop the firewood counter. But a mage's staff is turned an' balanced as careful as any blade, an' I have mine made from Elwynn ash by a turner who's never rushed a job in his life." } },
      choices = {
        { text = "Do the mages know the difference?", next = "staff_mages" },
        { text = "Something else.", next = "BACK" },
      },
    },
    staff_mages = {
      lines = { { id = "sm_default", text = "The good ones do. Bink came in once an' tapped six staves on the floor before she found one that rang true, an' she said it would hold a charge better. I dinnae understand the half o' that, but I've tapped every staff since." } },
      choices = { { text = "A merchant who listens to his customers.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "ot_default", text = "Well enough. Hegnar shouts, Brenwyn frowns, an' Thalgus counts things, an' I keep the peace an' the kettle. Somebody in a shop has tae be the one who remembers the birthdays." } },
      choices = { { text = "And that falls to you.", next = "BACK", reply = "It always has. I dinnae mind it, there's worse things tae be known for.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    hammer = {
      lines = { { id = "hm_default", text = "The balance sits further forward, for ye strike once an' mean it, an' the haft is long enough tae lean on while ye pray. Valgar Highforge had me alter the grip on his three times before he was satisfied." } },
      choices = { { text = "Show me the hammers.", next = "BUSINESS" }, { text = "Something else.", next = "BACK" } },
    },
    oldest = {
      lines = { { id = "y1_default", text = "A plain oak staff that's leaned in that corner since my grandfather's day. Naebody's ever bought it, an' I've never marked it down. I've a feelin' it's waitin' for somebody, an' I'd no' like tae sell it tae the wrong hand." } },
      choices = { { text = "I hope the right hand finds it.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    timberline = { { id = "tp_timber", text = "It's a good shop wi' good folk in it. A wee bit noisy, but then so is the whole ward." } },
    mystic_ward = { { id = "tp_mystic", text = "Half my customers walk over from there. I've thought o' movin' the counter closer, but the others would miss my tea." } },
    thalgus = { { id = "tp_thalgus", text = "Thalgus Thunderfist sells what the rest of us dinnae, an' keeps the shop's accounts besides. He's fair, an' he's never been a copper out." } },
    background = { { id = "tp_bg", text = "An Ironhand, an' a quiet one. I meant tae be a priest an' found I was better at fittin' them out." } },
    _none = { { id = "tp_none", text = "I'm sorry, I dinnae ken. I'd no' like tae guess an' send ye wrong." } },
  },
}

---------------------------------------------------------------------------
-- Thalgus Thunderfist: weapon merchant at Timberline Arms; thrown weapons, shot and odds and ends.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_thalgus", id = TODO_NPC("Thalgus Thunderfist"), name = "Thalgus Thunderfist", title = "Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "fussy", "dry" }, values = { "order", "practical" },
  notices = { "class", "kit" },
  impression = {
    first = "Thalgus Thunderfist keeps the fourth counter at Timberline Arms, where the throwing knives, shot, arrows and everything the other three will not stock end up. He also keeps the shop's ledger, and it shows.",
    third = "{name} met Thalgus Thunderfist, a weapon merchant at Timberline Arms in the Military Ward of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Timberline Arms, fourth counter. If the other three havenae got it, I have, an' it's in a drawer wi' a number on it." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. I've yer last purchase in the book, so tell me how many ye lost an' I'll tell ye how many tae buy." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Shot or arrows? I've both, counted intae hundreds, an' I'll thank ye no' tae ask me tae split a bundle." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Throwin' knives are in the second drawer. Ye'll want a dozen, for ye'll no' get back the ones that hit." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer gear's in a state. I dinnae mend, but I'll write ye a list o' what tae replace first, in order o' urgency." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thalgus Thunderfist. I sell the things a fighter runs out of: knives tae throw, shot, arrows an' the pouches tae carry them. It's no' glamorous, but nobody ever lost a battle for want of a second sword." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Thalgus Thunderfist, an' ye're my best sort o' customer, for ye'll be back within the week. Tell me the bore or the draw, an' I'll have it counted before ye've found yer purse." },
      },
      again = {
        { id = "h_again", text = "What else? I'm in the middle of a count, but it'll keep." },
        { id = "h_again2", text = "Aye? Go on, I've marked my place." },
      },
      choices = {
        { text = "Show me what's in the drawers.", next = "BUSINESS" },
        { text = "What's the name Thunderfist doing behind a ledger?", next = "name" },
        { text = "You keep the accounts for all four counters.", next = "ledger" },
        { text = "How much shot does a hunter go through?", next = "shot" },
        { text = "I hear you do the sweeping.", next = "sweep" },
        { text = "What's the strangest thing in your drawers?", next = "strangest" },
        { text = "Good day, Thalgus.", next = "END" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "My grandfather earned it wi' his fists at Grim Batol, an' I inherited it wi' a head for sums. Every family needs one who counts what the others bring home, an' in mine that's me." } },
      choices = { { text = "A ledger wins wars too, in its way.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    ledger = {
      lines = { { id = "le_default", text = "Somebody must. Hegnar rounds up, Brenwyn rounds down, an' Kelomir forgets tae charge the priests at all. Left tae themselves they'd have traded this shop for a keg an' a kind word years ago." } },
      choices = {
        { text = "Kelomir doesn't charge priests?", next = "ledger_priests" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ledger_priests = {
      big = true,
      lines = { { id = "lp_default", text = "He charges them less, an' thinks I havenae noticed. I've let it stand four years, because he's a good soul an' it's his own share he's givin' away. Still, a price is a price, an' the book ought tae be true. Should I put a stop tae it?" } },
      choices = {
        { text = "Let him be. It's charity, and his to give.", next = "BACK", reply = "Aye, I thought ye'd say so. I'll keep writin' it down as breakage, then, an' say nothin'.", fx = { align = { order = -1 } } },
        { text = "A price is a price. Tell him to stop.", next = "BACK", reply = "That's the proper answer, an' I'm no' sure I've the heart for it. I'll think on it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shot = {
      lines = { { id = "sh_default", text = "A careful one, two hundred rounds a week. A careless one, the same in a day, an' he'll tell ye the beasts are gettin' tougher. I can tell ye a hunter's skill from the book wi'out ever seein' him shoot." } },
      choices = {
        { text = "What does the book say about most of them?", next = "shot_book" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shot_book = {
      lines = { { id = "sb_default", text = "That they improve, an' that's the pleasant part o' the job. A recruit buys four hundred his first month an' two hundred his sixth, an' somewhere in between he's learned tae wait for the shot." } },
      choices = { { text = "You see more from that counter than you let on.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    sweep = {
      lines = { { id = "sw_default", text = "Brenwyn told ye, did she? Four thousand an' sixteen times as o' this mornin', against none at all for the other three. I'm no' bitter, mind, I only like the record kept." } },
      choices = { { text = "Four thousand and sixteen is a lot of not being bitter.", next = "BACK", reply = "Hmph. Ye may have a point, but I'll no' be writin' that one down.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    strangest = {
      lines = { { id = "y1_default", text = "A left-handed knuckle guard, made tae order for a customer who never came back for it. That was nine years ago. It's in drawer forty, paid in full, wi' his name on a tag. I'll no' sell what's been paid for, an' I check it at every count." } },
      choices = { { text = "He may come back for it yet.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    timberline = { { id = "tp_timber", text = "A sound business, whatever the others do tae it. We've turned a profit every year but the one Hegnar bought forty great axes on a feelin'." } },
    goldfury = { { id = "tp_goldfury", text = "The Goldfurys across the ward sell the guns an' bows, an' I sell what goes in them at a copper less. We nod tae each other." } },
    kelomir = { { id = "tp_kelomir", text = "Kelomir Ironhand is the best of us, an' the worst wi' money. I look after the second so he can go on bein' the first." } },
    background = { { id = "tp_bg", text = "A Thunderfist who can add. There's one born every third generation, an' the family's never sure what tae do wi' us." } },
    _none = { { id = "tp_none", text = "That's no' in any drawer o' mine, so I cannae help ye." } },
  },
}

---------------------------------------------------------------------------
-- Fillius Fizzlespinner: trade supplies at Fizzlespinner's General Goods in the Commons.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_fillius", id = TODO_NPC("Fillius Fizzlespinner"), name = "Fillius Fizzlespinner", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "tidy", "principled" }, values = { "order", "honest" },
  notices = { "craft", "race" },
  impression = {
    first = "Fillius Fizzlespinner owns Fizzlespinner's General Goods in the Commons and sells thread, flux, vials and spice from shelves arranged by trade. He would sooner lose a sale than hurry a customer.",
    third = "{name} met Fillius Fizzlespinner, the gnome who keeps Fizzlespinner's General Goods in the Ironforge Commons.",
  },
  greetings = {
    { id = "g_hi", text = "Good day, and welcome to Fizzlespinner's. Trade supplies are on the left, sorted by craft, and you're free to browse without being pounced on." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Nothing has moved since your last visit, which I mention because customers seem to find it reassuring." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "Hello, hello! The lower shelves are stocked exactly the same as the upper ones, so there's no need for the stool." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Blacksmithing", "Alchemy", "Cooking", "Leatherworking", "Engineering", "Enchanting" } },
      text = "You work a trade, I can tell by your hands. Whatever you've run out of, it's on the shelf with your craft's name on it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Flux is on the second shelf, master dwarf. It is always flux with your people, and I order it by the barrel." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Fillius Fizzlespinner, proprietor. I sell the little things every craft uses up, and I've arranged them so that a tailor never has to walk past a blacksmith's shelf. Pithwick has the corner for his bags, as you may have noticed." },
        { id = "h_craft", when = { profession = { "Tailoring", "Blacksmithing", "Alchemy", "Leatherworking", "Engineering" } }, text = "Fillius Fizzlespinner. A working crafter is the customer this shop was built for, so tell me your trade and I'll point you to the right shelf." },
      },
      again = {
        { id = "h_again", text = "Was there something else? Do take your time." },
        { id = "h_again2", text = "Yes? I'm only straightening labels, so you aren't interrupting." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Everything in here is in its place.", next = "tidy" },
        { text = "Pithwick wants arrows painted on your floor.", next = "arrows" },
        { text = "Who else sells trade goods in the city?", next = "others" },
        { text = "What do crafters forget most often?", next = "forget" },
        { text = "What's the hardest thing to keep in stock?", next = "stock" },
        { text = "Good day, Fillius.", next = "END" },
      },
    },
    tidy = {
      lines = { { id = "ti_default", text = "Thank you, it is. A crafter comes in halfway through a piece of work with their head full of it, and the kindest thing I can do is let them find the thread without having to think. A muddled shop steals a little of everybody's day." } },
      choices = {
        { text = "Were you always this orderly?", next = "tidy_always" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tidy_always = {
      lines = { { id = "ta_default", text = "I kept a parts store on the second level of Gnomeregan, with eleven thousand drawers, and I could find any washer in it blindfolded. I left with what I could carry, so I'm rather attached to the shelves I have now." } },
      choices = { { text = "I'm sorry about the drawers.", next = "BACK", reply = "That's kind of you. I still dream about the indexing.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    arrows = {
      big = true,
      lines = { { id = "ar_default", text = "He has told you too, has he? He's a dear fellow and a clever one, and he's quite right that it would sell more. But I think a person who walks into a shop should be left to decide what they want. Am I being old-fashioned?" } },
      choices = {
        { text = "No. A shop should serve, not steer.", next = "BACK", reply = "Thank you. I shall tell Pithwick the matter is settled, and he will raise it again on Thursday.", fx = { align = { honor = 1 } } },
        { text = "A little. Let him paint one arrow.", next = "BACK", reply = "Hm. One arrow, and a small one, and I choose the colour. I'll consider it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "ot_default", text = "Burbik Gearspanner has a shop up by the Great Forge, and he's welcome to the smiths, who track soot everywhere. Bryllia Ironbrand sells the general goods, the food and the lamp oil. There's trade enough that none of us goes short." } },
      choices = { { text = "You speak well of your rivals.", next = "BACK", reply = "They're neighbours first. One can be a rival in a tidy way.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    forget = {
      lines = { { id = "fo_default", text = "Thread, without question. A tailor will carry forty bolts of silk across the city and not one spool to sew them with. After thread it's vials, and after vials it's the alchemist coming back to say the vials were the wrong size." } },
      choices = {
        { text = "Are they ever the wrong size?", next = "forget_vials" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget_vials = {
      lines = { { id = "fv_default", text = "Never. They're labelled in two places and I ask at the counter besides. Tally Berryfizz once came back three times in a day, and on the third visit she laughed so hard she had to sit on my step." } },
      choices = { { text = "A patient shopkeeper is a rare thing.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    stock = {
      lines = { { id = "y1_default", text = "Spices, since the roads grew dangerous. Every cook in Ironforge wants them and the caravans come when they come. I keep a waiting list, in order, and Daryl Riknussun has been at the top of it for six years by the simple method of asking every morning." } },
      choices = { { text = "Persistence earns its place.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    pithwick = { { id = "tp_pithwick", text = "My tenant in the corner. He sells excellent bags and has a new idea for my shop every week, and I've grown fond of saying no to them." } },
    commons = { { id = "tp_commons", text = "It's the heart of the city's trade, and noisier than I'd like. I close the shutters at the ninth bell and enjoy the quiet." } },
    gnomeregan = { { id = "tp_gnomer", text = "I had a very good store there. I try not to think about what the troggs have done to the filing." } },
    background = { { id = "tp_bg", text = "I'm a storekeeper, as I was at home. It's quiet work, and somebody has to know where things are." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't stock an answer to that. I'd only be guessing, and I dislike guessing." } },
  },
}

---------------------------------------------------------------------------
-- Edris Barleybeard: barmaid at Bruuk's Corner in the Military Ward; Bruuk's kin.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_edris", id = TODO_NPC("Edris Barleybeard"), name = "Edris Barleybeard", title = "Barmaid",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "sharp", "warm" }, values = { "family", "practical" },
  notices = { "drunk", "class" },
  impression = {
    first = "Edris Barleybeard carries the mugs at Bruuk's Corner in the Military Ward and can hold six in each hand. She knows which soldier owes what and who has had enough, and she is rarely argued with twice.",
    third = "{name} met Edris Barleybeard, the barmaid at Bruuk's Corner in the Military Ward of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Sit where ye like, so long as it's no' the stool by the fire, for that's Pilot Longbeard's an' he sulks." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' ye paid last time, so ye're welcome. What'll it be?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The late watch is just off the gates, so mind yer elbows. I'll find ye a corner." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ye've had a few already, an' no' here. I'll serve ye one more an' then it's water, an' I'll no' be argued wi'." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } },
      text = "Ye've a fighter's look, so ye'll fit in. Keep yer weapon peace-tied in here an' we'll get on fine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Edris Barleybeard. Bruuk's my kin an' it's his name on the corner, but he stands behind the bar an' I'm the one who walks the floor, so if ye want a thing brought or a dwarf removed, ye ask me." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Edris Barleybeard. Ye'll want the dark ale, bein' a dwarf o' sense, an' I'll bring it before ye've got yer cloak off." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, I've a tray gettin' warm." },
        { id = "h_again2", text = "Aye, go on, I can listen an' carry." },
      },
      choices = {
        { text = "I'll take a drink.", next = "BUSINESS" },
        { text = "Bruuk says you've thrown out bigger dwarves than him.", next = "thrown" },
        { text = "What sort of crowd drinks here?", next = "crowd" },
        { text = "You must hear everything in a soldiers' bar.", next = "hear" },
        { text = "How does this place compare to the Stonefire?", next = "stonefire" },
        { text = "What does the ward drink most?", next = "drink" },
        { text = "Good night, Edris.", next = "END" },
      },
    },
    thrown = {
      lines = { { id = "th_default", text = "I have, an' it's nae great trick. Ye take them by the collar an' the belt while they're still explainin' themselves, an' ye walk. A drunk dwarf goes where his belt goes." } },
      choices = {
        { text = "Who was the biggest?", next = "thrown_big" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thrown_big = {
      lines = { { id = "tb_default", text = "A sergeant o' the siege brigade, the width o' that door an' twice as thick. He came back the next mornin' wi' his hat in his hands tae pay for the stool, an' he's left a copper on my tray every night since." } },
      choices = { { text = "You've a firm hand and a fair one.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    crowd = {
      lines = { { id = "cr_default", text = "Guards off the gates, recruits from the Hall o' Arms, an' the siege brigade lot when they've been paid. They're loud, an' they sing badly, but they look after the place, for it's the only bar in the ward." } },
      choices = {
        { text = "And the recruits? Do they behave?", next = "crowd_recruits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crowd_recruits = {
      big = true,
      lines = { { id = "cc_default", text = "They try tae keep up wi' the veterans an' end the night under the table. Bruuk says a soldier learns his limit by findin' it, an' I say half o' them are bairns who miss their mothers. I water the last round for the youngest, an' he pretends no' tae see." } },
      choices = {
        { text = "You're right to. Someone should look out for them.", next = "BACK", reply = "Aye, well. They'll have hard enough mornin's ahead wi'out me addin' tae them.", fx = { align = { light = 1 } } },
        { text = "Bruuk's right. Let them learn the hard way.", next = "BACK", reply = "Ye've never had tae carry one home, then. Suit yerself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hear = {
      lines = { { id = "he_default", text = "More than the Senate does, I'd wager. I ken which patrol's short o' boots an' which officer's no' trusted, an' I keep it between my ears. A barmaid who repeats what she hears is out o' work by Winter Veil." } },
      choices = { { text = "Then I'll not ask you to.", next = "BACK", reply = "Good. Ye'd be surprised how many try, an' wi' how little coin.", fx = { trait = { reserved = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    stonefire = {
      lines = { { id = "sf_default", text = "Firebrew's place is for travellers an' merchants, wi' beds an' a proper kitchen. Here ye get ale, a stool an' the truth about yer singin'. Gwenna over there is a friend o' mine, an' we swap stories about the worst o' them." } },
      choices = { { text = "I'd pay to hear those stories.", next = "BACK", reply = "Ye couldnae afford them, an' half the folk in them are armed.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    drink = {
      lines = { { id = "y1_default", text = "Dark ale, an' plenty of it. The officers ask for Thunderbrew lager an' the recruits for whatever's cheapest. Every so often a gnome orders somethin' wi' fruit in it, an' I bring it wi' a straight face, for a customer's a customer." } },
      choices = { { text = "A professional through and through.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    bruuk = { { id = "tp_bruuk", text = "Bruuk's gruff an' he's soft as dough under it. He soldiered on the wall for years, an' he's never refused a veteran a drink on a bad night." } },
    military_ward = { { id = "tp_ward", text = "It's loud from the first drill tae the last bell. I was born tae the noise, an' I cannae sleep anywhere quiet." } },
    longbeard = { { id = "tp_longbeard", text = "Pilot Longbeard's in most nights, tellin' the same three stories. I could tell them for him by now, an' better." } },
    background = { { id = "tp_bg", text = "A Barleybeard, an' I've carried mugs in this ward since I could lift a tray." } },
    _none = { { id = "tp_none", text = "I dinnae ken, an' if I did I'd likely no' say. Drink up." } },
  },
}

---------------------------------------------------------------------------
-- Tynnus Venomsprout: gnome shady dealer in the Forlorn Cavern; poisons and rogue supplies.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_tynnus", id = TODO_NPC("Tynnus Venomsprout"), name = "Tynnus Venomsprout", title = "Shady Dealer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "soft-spoken", "sly" }, values = { "discretion", "craft" },
  notices = { "class", "craft" },
  impression = {
    first = "Tynnus Venomsprout sells powders, vials and other quiet goods in the Forlorn Cavern, near the rogues of the Hidden Circle. He speaks softly, washes his hands often and never says the word poison.",
    third = "{name} met Tynnus Venomsprout, a gnome who deals in rogues' supplies in the Forlorn Cavern of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Good day. Do keep your voice down, if you would, and tell me what sort of problem you have." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. I take it the last purchase did what it said on the label I didn't put on it." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "One of Hulfdan's, unless I'm mistaken, and I'm not. Come round where the lamp doesn't reach." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist. We are in the same trade from opposite ends, you and I, and I'd be glad to compare notes on dosage some evening." },
    { id = "n_pal", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "Oh, dear. You've wandered down the wrong passage, I think. I sell lamp oil and flash powder, and that is all you saw." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tynnus Venomsprout, supplier of specialised goods. I sell powders, empty vials and certain preparations to people whose work requires them, and I ask no questions, because the answers would only worry me." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Tynnus Venomsprout. The Circle sends its people to me for the things a blade can't do alone. Tell me how quickly it needs to work, and how quietly." },
      },
      again = {
        { id = "h_again", text = "Was there something more? Softly, please." },
        { id = "h_again2", text = "Yes? I'm listening, and so is the cavern, so choose your words." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "You sell poison, then.", next = "poison" },
        { text = "This is an odd corner for a shop.", next = "cavern" },
        { text = "Where do you get your ingredients?", next = "source" },
        { text = "What's the first rule of handling your goods?", next = "rule", when = { class = "ROGUE" } },
        { text = "Do you ever turn a customer away?", next = "refuse" },
        { text = "Goodbye, Tynnus.", next = "END" },
      },
    },
    poison = {
      lines = { { id = "po_default", text = "What an ugly word. I sell ingredients, and what a customer mixes at home is between them and their conscience. I will say that the king's own agents buy from me, so the mountain evidently feels the trade has its uses." } },
      choices = {
        { text = "Does it trouble you, what they're used for?", next = "poison_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    poison_trouble = {
      big = true,
      lines = { { id = "pt_default", text = "Now and then, at about three in the morning. A Dark Iron spy who dies quietly in a tunnel never opens a gate to his friends, and I think that a fair exchange. But I don't see the faces, and I've wondered whether that is wisdom or cowardice." } },
      choices = {
        { text = "Quiet work saves lives. You do your part.", next = "BACK", reply = "That is what I tell the ceiling. It's pleasant to hear it from someone who can answer.", fx = { align = { honor = -1 } } },
        { text = "Killing unseen is no honest trade.", next = "BACK", reply = "No, it isn't, and I've never claimed otherwise. Honest trades don't keep spies out of Ironforge, though.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cavern = {
      lines = { { id = "ca_default", text = "It's the only corner that suits. The Forlorn Cavern is where Ironforge keeps what it prefers not to look at: the rogues, the warlocks and a lake nobody fishes twice. The rent is low and the neighbours mind their own business." } },
      choices = {
        { text = "Who are the neighbours?", next = "cavern_neighbours" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cavern_neighbours = {
      lines = { { id = "cn_default", text = "Hulfdan Blackbeard and Ormyr Flinteye teach the Circle's rogues, and Fenthwick too, who is the only one that says good morning. Gerrig Bonegrip's warlocks keep to their shop of runes, and I let them, because their ingredients are far worse than mine." } },
      choices = { { text = "A dealer in poisons who's wary of warlocks.", next = "BACK", reply = "My goods only harm the person they're meant for. That's a great deal more than they can promise.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    source = {
      lines = { { id = "so_default", text = "Spider glands from the Wetlands, certain mushrooms from the deep tunnels, and a salt the miners would rather not know they're selling me. I test every batch on a measured scale, and I have never once sold a preparation that was stronger or weaker than I said." } },
      choices = { { text = "Precision, even in this.", next = "BACK", reply = "Especially in this. A careless grocer gives you a stomach ache, and a careless one of me is a funeral.", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    rule = {
      lines = { { id = "ru_default", text = "Gloves, and then a second pair of gloves. After that, never coat a blade you mean to sheathe against your own leg, which sounds obvious until you meet the number of rogues who limp." } },
      choices = { { text = "Two pairs. I'll remember.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    refuse = {
      lines = { { id = "y1_default", text = "Often. Anyone who tells me who it's for, to begin with, because a professional never would. And anyone who is angry. My goods are for work, and anger is personal. I send those to the tavern, and most of them thank me a week later." } },
      choices = { { text = "A dealer with rules.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    forlorn_cavern = { { id = "tp_cavern", text = "Dark, damp and discreet. Nobody comes here by accident twice, which keeps my custom to the serious sort." } },
    hidden_circle = { { id = "tp_circle", text = "I couldn't possibly say. If there were such a body, I expect it would pay its accounts promptly, and in small coin." } },
    hulfdan = { { id = "tp_hulfdan", text = "Master Blackbeard is a careful customer and a careful teacher. He has never asked me for anything he couldn't justify to the king." } },
    background = { { id = "tp_bg", text = "I was a pest controller in Gnomeregan. The work has changed less than you might suppose." } },
    _none = { { id = "tp_none", text = "I know nothing about that, and I find it's usually safest to stay that way." } },
  },
}

---------------------------------------------------------------------------
-- Sognar Cliffbeard: meat vendor who walks the Military Ward.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_sognar", id = TODO_NPC("Sognar Cliffbeard"), name = "Sognar Cliffbeard", title = "Meat Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "jolly", "blunt" }, values = { "practical", "hearty" },
  notices = { "class", "pet" },
  impression = {
    first = "Sognar Cliffbeard walks the Military Ward selling roast and cured meat to soldiers who have no time to sit down for it. He smells of woodsmoke and thinks vegetables are a rumour from Stormwind.",
    third = "{name} met Sognar Cliffbeard, who sells meat on foot in the Military Ward of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Meat! Hot haunch, smoked ribs an' boar sausage, an' every bit of it was runnin' about Dun Morogh last week!" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more, eh? I kent ye would be, nobody stops at one o' my sausages." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter! Is that beast o' yours fed? I've offcuts cheap, an' he's lookin' at my tray like it owes him coin." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Yer {pet}'s got a good eye for quality. Keep a hand on him, mind, I've lost a string o' sausages that way before." },
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "Ye cannae swing steel on bread alone, whatever Myra tells ye. Get some meat in ye before the next drill." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sognar Cliffbeard, an' I feed the Military Ward. A recruit gets a short rest between drills an' it's no' long enough tae reach a table, so I bring the table tae them, hot." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "Sognar Cliffbeard. Ye cook, I can tell by the way ye sniffed. Go on, then, guess what wood I smoke over, an' I'll tell ye if ye're close." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, it's goin' cold." },
        { id = "h_again2", text = "Aye, ask, I can walk an' talk an' sell all at once." },
      },
      choices = {
        { text = "What's on the tray?", next = "BUSINESS" },
        { text = "Where does your meat come from?", next = "from" },
        { text = "You and Myra seem to be rivals.", next = "myra" },
        { text = "How do you smoke it, inside a mountain?", next = "smoke" },
        { text = "What do soldiers ask for most?", next = "soldiers" },
        { text = "What's the best thing on your tray?", next = "bestcut" },
        { text = "Good day, Sognar.", next = "END" },
      },
    },
    from = {
      lines = { { id = "fr_default", text = "Boar from the Kharanos hunters, mostly, for the crag boars are fat this year. I take bear when I can get it, an' ram when one o' the Amberstills' beasts gets too old an' too mean, though I dinnae tell the customers which ram." } },
      choices = {
        { text = "Do you know the rams by name?", next = "from_rams" },
        { text = "Something else.", next = "BACK" },
      },
    },
    from_rams = {
      lines = { { id = "fm_default", text = "Rudra Amberstill does, an' she tells me every one, wi' tears, while she takes my coin. I've eaten a ram called Old Grumble that bit a mountaineer twice. He was tough tae the very end, an' I respected him for it." } },
      choices = { { text = "A fitting end for Old Grumble.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    myra = {
      big = true,
      lines = { { id = "my_default", text = "Rivals? She sells bread in the Commons an' I sell meat here, an' on a feast day we stand together an' sell both for more than either's worth. Is that sharp practice, d'ye think, or only good sense?" } },
      choices = {
        { text = "It's sharp practice. Feast days aren't for gouging.", next = "BACK", reply = "Hmph. Ye've a point, an' the recruits are poor enough. I'll speak tae Myra.", fx = { align = { honor = 1 } } },
        { text = "It's good sense. Folk pay what a thing's worth to them.", next = "BACK", reply = "That's how I see it! Nobody's ever handed one back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smoke = {
      lines = { { id = "sm_default", text = "I've a wee smokehouse cut intae the rock behind the ward, wi' a flue that runs up tae the mountainside. I burn pine for the boar an' applewood for the ribs, an' the guards on the upper ledge say they can smell supper two hours early." } },
      choices = {
        { text = "Where does applewood come from, up here?", next = "smoke_apple" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smoke_apple = {
      lines = { { id = "sa_default", text = "Bimble Longberry saves me her broken fruit crates from the Mystic Ward. She thinks I use them for kindlin', an' I've never had the heart tae tell her they go intae the very thing she disapproves of." } },
      choices = { { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    soldiers = {
      lines = { { id = "sl_default", text = "Sausage, for ye can eat it wi' one hand an' hold a shield wi' the other. The officers want ribs, an' then they want somewhere tae wipe their fingers, an' that's how ye tell an officer." } },
      choices = { { text = "I'll take the sausage, then.", next = "BUSINESS" }, { text = "Something else.", next = "BACK" } },
    },
    bestcut = {
      lines = { { id = "y1_default", text = "The smoked ribs, if ye've two hands free an' nae pride. Three days over applewood, an' the meat comes off the bone if ye look at it sternly. Muren Stormpike has a standin' order, an' he eats them behind his desk where the recruits cannae see." } },
      choices = { { text = "Even a commander has his weakness.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    military_ward = { { id = "tp_ward", text = "A thousand hungry dwarves an' nae kitchen but mine an' Bruuk's. I'll never be rich, but I'll never be idle." } },
    myra = { { id = "tp_myra", text = "Myra Tyrngaarde bakes the best bread in Ironforge, an' it goes very well under my sausage. Dinnae tell her I said the first part." } },
    bruuk = { { id = "tp_bruuk", text = "Bruuk's Corner sells the ale that washes my meat down. He lets me stand by his door on cold days, an' I keep his regulars fed." } },
    background = { { id = "tp_bg", text = "A Cliffbeard, a hunter's son, an' too fond o' the eatin' tae be much good at the chasin'." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, friend, for if I cannae roast it, I've nae opinion on it." } },
  },
}

---------------------------------------------------------------------------
-- Golnir Bouldertoe: mining supplies at the Great Forge; kin to Geofram the mining trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_golnir", id = TODO_NPC("Golnir Bouldertoe"), name = "Golnir Bouldertoe", title = "Mining Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "cocky", "cheerful" }, values = { "craft", "family" },
  notices = { "craft", "kit" },
  impression = {
    first = "Golnir Bouldertoe sells picks, flux and coal at the counter beside his kinsman Geofram, the mining trainer. He is the younger of the two and never lets a lesson pass without adding a correction.",
    third = "{name} met Golnir Bouldertoe, who sells mining supplies at the Great Forge in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Picks, flux an' coal! An' if Geofram's told ye tae swing from the shoulder, forget it an' ask me." },
    { id = "g_back", when = { metBefore = true }, text = "Back already? Ye've either struck a good vein or broken the pick, an' I can help wi' both." },
    { id = "g_miner", when = { profession = "Mining" }, text = "A miner! Let me see yer pick. Aye, that's blunt as a senator, ye'll want a new head on it." },
    { id = "g_crate", when = { questActive = TODO_QUEST("Ride to Ironforge") }, text = "Is that a Thelsamar crate under yer arm? By my beard, it is, an' only a week later than I was promised, so set it down gently." },
  },
  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Ye've rock dust in yer collar, so ye've been at it today. Where's the copper runnin' this season?" },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer gear's been through a cave-in, or looks it. I cannae mend it, but I've stood where ye're standin'." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Golnir Bouldertoe. Geofram at the next counter teaches the minin', an' I sell the tools for it, an' I fix what he teaches while I'm about it. He learned his trade when picks were made o' bronze, near enough." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "I'm Golnir Bouldertoe, an' ye'll be a smith, I'd wager? Then it's flux an' coal ye're after, an' I've both by the sack, cheaper than Thurgrum, though dinnae tell him." },
      },
      again = {
        { id = "h_again", text = "What else? I've a crate o' pick heads tae sort, but they'll wait." },
        { id = "h_again2", text = "Aye, ask. Geofram's no' listenin', he never is." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Geofram says you call his teaching out of date.", next = "geofram" },
        { text = "What makes a good pick?", next = "pick" },
        { text = "Where does the Great Forge get its ore?", next = "ore" },
        { text = "What do miners buy that surprises people?", next = "surprise" },
        { text = "Here's your crate from Thelsamar.", next = "crate", when = { questActive = TODO_QUEST("Ride to Ironforge") } },
        { text = "Good day, Golnir.", next = "END" },
      },
    },
    geofram = {
      lines = { { id = "ge_default", text = "Because it is! He has them tap an' listen for an hour before they swing. I say blast a wee hole, see what's behind it, an' save yer afternoon. The gnomes have powder for it now." } },
      choices = {
        { text = "And what does he say to that?", next = "geofram_says" },
        { text = "Something else.", next = "BACK" },
      },
    },
    geofram_says = {
      big = true,
      lines = { { id = "gs_default", text = "That the mountain's been here longer than powder, an' deserves a bit o' manners. He's never brought a roof down in two hundred years, I'll grant him that. Which of us would ye follow intae a tunnel?" } },
      choices = {
        { text = "Geofram. The old ways keep the roof up.", next = "BACK", reply = "Aye, well. Ye'd be bored, but ye'd be alive, an' I suppose that counts.", fx = { align = { order = 1 } } },
        { text = "You. Time matters, and powder works.", next = "BACK", reply = "Ha! D'ye hear that, Geofram? No, he's pretendin' he cannae.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pick = {
      lines = { { id = "pi_default", text = "A head o' good steel wi' the point drawn out long, an' a haft of ash that'll flex before it snaps. I have Bengus Deepforge's lads forge mine, an' I fit the hafts myself, for a loose head has killed more miners than troggs have." } },
      choices = {
        { text = "You check every one?", next = "pick_check" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pick_check = {
      lines = { { id = "pc_default", text = "Every one, against that anvil, ten strokes. If it shifts, it goes back. I'm quick about most things, but no' about that." } },
      choices = { { text = "So you've some of Geofram's care after all.", next = "BACK", reply = "Keep yer voice down! He'd never let me forget it.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    ore = {
      lines = { { id = "or_default", text = "Copper an' tin from Dun Morogh, iron from Loch Modan an' the Wetlands, an' the rare stuff from wherever adventurers like yerself drag it. Gol'Bolar quarry sent us the most, till the troggs came up through the floor." } },
      choices = { { text = "The troggs have cost Ironforge dearly.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    surprise = {
      lines = { { id = "y1_default", text = "Candles. A miner will spend more on candles in a year than on picks. Ye can dig wi' a blunt pick, but ye cannae dig in the dark, an' the lamp oil the city sells smokes somethin' terrible." } },
      choices = {
        { text = "Why not gnomish lamps?", next = "surprise_lamps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    surprise_lamps = {
      lines = { { id = "y2_default", text = "I stock them, an' the young ones buy them. The old hands willnae, for a candle flame tells ye when the air's gone bad an' a gnomish lamp just keeps shinin' while ye fall over. Geofram taught me that, an' he was right, curse him." } },
      choices = { { text = "So Geofram's ways have their uses.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    crate = {
      lines = { { id = "cr_default", text = "An' no' a board cracked, so ye carried it better than the last courier did. I've a parcel tae go back the same way, so take it tae Gryth Thurden at the gryphon roost, an' he'll see ye an' it safely tae Loch Modan." } },
      choices = { { text = "Gryth Thurden it is. Something else first.", next = "BACK" } },
    },
  },
  topics = {
    geofram = { { id = "tp_geofram", text = "The best miner in Ironforge, an' I'll say it only where he cannae hear. I've been tryin' tae prove him wrong for forty years." } },
    great_forge = { { id = "tp_forge", text = "Every lump of ore in Khaz Modan ends up in that fire. I like tae think the best of it passed my counter first." } },
    thurgrum = { { id = "tp_thurgrum", text = "Thurgrum Deepforge sells the smiths their supplies. We overlap on flux, an' we're polite about it, mostly." } },
    background = { { id = "tp_bg", text = "A Bouldertoe, an' we've been under one mountain or another since before the Three Hammers." } },
    _none = { { id = "tp_none", text = "Nae idea. If ye cannae dig it up or dig wi' it, I'm nae help." } },
  },
}

---------------------------------------------------------------------------
-- Thurgrum Deepforge: blacksmithing supplies at the Great Forge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_thurgrum", id = TODO_NPC("Thurgrum Deepforge"), name = "Thurgrum Deepforge", title = "Blacksmithing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "steady", "plain" }, values = { "craft", "family" },
  notices = { "craft", "race" },
  impression = {
    first = "Thurgrum Deepforge sells hammers, flux, coal and grinding stones at the Great Forge, a few paces from where his kin teach the craft. He has burn scars to the elbow and misses the anvil.",
    third = "{name} met Thurgrum Deepforge, who sells blacksmithing supplies at the Great Forge in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Hammers, flux, coal an' stones. If ye're standin' at an anvil an' somethin's missin', I've got it." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Run out o' flux, I'll wager, everybody does." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith. Good, show me yer hammer hand. Aye, ye've been workin', there's the callus." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Ye've scale on yer apron, so ye came straight from the fire. I miss that smell more than I'd tell my wife." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Ye've come a long way tae buy coal. I'll take it as a compliment tae the Forge." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thurgrum Deepforge. Bengus teaches at the Great Anvil an' Tormus forges for the army, an' I keep the both o' them an' every other smith here in coal an' flux. It's the dull end o' the family trade, an' somebody must do it." },
      },
      again = {
        { id = "h_again", text = "What else d'ye need?" },
        { id = "h_again2", text = "Aye, ask. The fire's loud, so speak up." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You say you miss the anvil.", next = "anvil" },
        { text = "How much coal does the Great Forge burn?", next = "coal" },
        { text = "What does a new smith always get wrong?", next = "wrong" },
        { text = "The gnomes must have changed the Forge.", next = "gnomes" },
        { text = "Good day, Thurgrum.", next = "END" },
      },
    },
    anvil = {
      lines = { { id = "an_default", text = "I do. I was a fair smith till a crucible went over my arm, an' now the hand shakes when I hold tongs. It doesnae shake when I weigh coal, so here I am." } },
      choices = {
        { text = "That's a hard thing to lose.", next = "anvil_lose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anvil_lose = {
      big = true,
      lines = { { id = "al_default", text = "It is. Bengus says I should teach, for I've still the eye. I say a smith who cannae strike has nae business tellin' others how. What d'ye think?" } },
      choices = {
        { text = "Teach. Knowledge shouldn't die with the hand.", next = "BACK", reply = "Hm. That's kindly said. Maybe I'll stand at Bengus's elbow a day an' see.", fx = { align = { light = 1 } } },
        { text = "You're right. A teacher should show, not tell.", next = "BACK", reply = "Aye. That's my pride talkin', an' it seems it's yours as well.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    coal = {
      lines = { { id = "co_default", text = "None at all, in the Forge itself, for that's the mountain's own fire. It's the wee anvils round the edge that burn coal, forty sacks a day between them. The lava does for smeltin', but ye cannae temper a blade over it." } },
      choices = { { text = "I'd assumed the lava did everything.", next = "BACK", reply = "Everybody does. It's too hot an' too dirty for fine work, an' it spits.", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    wrong = {
      lines = { { id = "wr_default", text = "They strike too hard an' too cold. Ye see them batterin' at black iron as if it owed them coin. Heat it till it's the colour o' straw, hit it half as hard, an' it'll go where ye ask." } },
      choices = {
        { text = "Who's the best of the young ones?", next = "wrong_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong_best = {
      lines = { { id = "wb_default", text = "Groum Stonebeard, Rotgath's lad, has the patience for it. Rotgath willnae tell him so, for fear it goes tae his head, so I tell him when his father's back is turned." } },
      choices = { { text = "Every apprentice needs someone like you.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    gnomes = {
      lines = { { id = "x1_default", text = "They have, an' for the better, though I'd no' say it at the Stonefire. They brought bellows that pump themselves an' a wee gauge that tells ye the heat. Half the old smiths willnae touch them." } },
      choices = {
        { text = "And you?", next = "gnomes_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes_you = {
      lines = { { id = "x2_default", text = "I sell the gauges, so I'd best believe in them. A shakin' hand cannae judge a fire by feel any more, an' the gauge doesnae care. It's given me a bit o' the craft back." } },
      choices = { { text = "Then it's a good trade for you both.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    bengus = { { id = "tp_bengus", text = "Bengus Deepforge teaches the craft at the Great Anvil. He's kin, an' he's the best there is, an' he kens it." } },
    great_forge = { { id = "tp_forge", text = "The heart o' the mountain. Stand at the rail when they pour, an' ye'll understand dwarves better than any book can tell ye." } },
    golnir = { { id = "tp_golnir", text = "Golnir Bouldertoe undercuts me on flux by a copper an' thinks I havenae noticed. I let him, he's young." } },
    background = { { id = "tp_bg", text = "A Deepforge. We've had a hand in every pour at this Forge since it was lit." } },
    _none = { { id = "tp_none", text = "I cannae help ye there. I ken iron an' what feeds it." } },
  },
}

---------------------------------------------------------------------------
-- Burbik Gearspanner: gnome trade supplier who owns Burbik's Supplies near the Great Forge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_burbik", id = TODO_NPC("Burbik Gearspanner"), name = "Burbik Gearspanner", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "busy", "ambitious" }, values = { "practical", "gnomeregan" },
  notices = { "craft", "race" },
  impression = {
    first = "Burbik Gearspanner owns Burbik's Supplies near the Great Forge and stocks the same thread, flux and vials as every other trade shop in Ironforge. He is determined to sell more of them than any dwarf.",
    third = "{name} met Burbik Gearspanner, the gnome who runs Burbik's Supplies near the Great Forge in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Burbik's Supplies! Everything the dwarven shops have, three paces closer to the anvils, and served twice as fast!" },
    { id = "g_back", when = { metBefore = true }, text = "A returning customer! That's the forty-first this week, and yes, I'm counting, I've a chart." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "A fellow gnome! Every copper you spend here goes toward taking Gnomeregan back, or toward my rent, which comes to the same thing in the long run." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Blacksmithing", "Engineering", "Leatherworking", "Tailoring", "Alchemy" } },
      text = "You make things! Then you'll run out of things, and I've timed the walk from every workbench in this ward to my door." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, in a gnome's shop! Come in, come in, the flux is the same flux, I promise, and the scales are honest." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Burbik Gearspanner, sole proprietor. I came out of Gnomeregan with a ledger and nothing else, and I thought, what does this mountain use up every single day? Then I rented the nearest door to where they use it." },
      },
      again = {
        { id = "h_again", text = "What else can I get you? Or tell you, telling's free." },
        { id = "h_again2", text = "Yes, yes, go on! I'm restocking, but I've two ears." },
      },
      choices = {
        { text = "Show me what you stock.", next = "BUSINESS" },
        { text = "How do you compete with the dwarven shops?", next = "compete" },
        { text = "Why set up beside the Great Forge?", next = "forge" },
        { text = "You said the coin goes toward Gnomeregan.", next = "gnomer" },
        { text = "What sells best beside a forge?", next = "sells" },
        { text = "Goodbye, Burbik.", next = "END" },
      },
    },
    compete = {
      lines = { { id = "cp_default", text = "Speed! A dwarf shopkeeper wants to discuss your beard and your grandfather before he'll weigh a thing. I have it wrapped before you've finished asking. The smiths complained for a month, and then they noticed how much longer their dinner break had got." } },
      choices = {
        { text = "Do the other shopkeepers resent you?", next = "compete_resent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    compete_resent = {
      big = true,
      lines = { { id = "cs_default", text = "A little. Thurgrum Deepforge has been decent, and he was here a century before me. I could take half his custom if I dropped my flux by two coppers, and I've done the sums more than once. We're guests in this city, though." } },
      choices = {
        { text = "Leave him be. A guest doesn't ruin his host.", next = "BACK", reply = "No. No, he doesn't. I'll put the sums back in the drawer.", fx = { align = { honor = 1 } } },
        { text = "Trade is trade. Drop the price.", next = "BACK", reply = "That's what the chart says. I'll think about it over the weekend, with the door shut.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge = {
      lines = { { id = "fo_default", text = "Because that's where things run out! A smith with hot iron on the anvil can't walk to the Commons for flux, the piece would be ruined. I measured it: from the Great Anvil to my counter is ninety-four paces, dwarf paces." } },
      choices = {
        { text = "You measured in dwarf paces?", next = "forge_paces" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge_paces = {
      lines = { { id = "fp_default", text = "I borrowed a dwarf. Groum Stonebeard walked it for me six times and I took the mean. He wanted to know why, and when I explained, he said it was the most gnomish thing he'd ever heard." } },
      choices = { { text = "He wasn't wrong.", next = "BACK", reply = "He wasn't! I've had it painted on a little sign.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    gnomer = {
      lines = { { id = "gn_default", text = "A tenth of what I clear goes to High Tinker Mekkatorque's fund, every month, and I've the receipts. It's not much against what it'll cost. But I'd like to be able to say I helped buy one bolt of the door we walk back in through." } },
      choices = { { text = "One bolt at a time is how it's done.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    sells = {
      lines = { { id = "x1_default", text = "Flux, by the barrel, and then coal, and then burn salve, which I added in my second week after watching the smiths for an afternoon. Nobody had thought to sell it next to the fire!" } },
      choices = {
        { text = "Whose salve do you stock?", next = "sells_salve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_salve = {
      lines = { { id = "x2_default", text = "Reyna Stonebranch makes it at the Physician, and I take forty pots a month. She thought I was mad until the first forty went in three days. Now she grows the herbs for it in trays." } },
      choices = { { text = "You see what a place is missing.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    great_forge = { { id = "tp_forge", text = "Hot, loud and full of customers. I've stopped noticing the first two." } },
    fillius = { { id = "tp_fillius", text = "Fillius Fizzlespinner has the Commons. He's far tidier than me and far slower, and we send each other cards at Winter Veil." } },
    gnomeregan = { { id = "tp_gnomer", text = "I had a stall on the third level, by the lifts. It was a very good pitch, and I intend to have it back." } },
    background = { { id = "tp_bg", text = "Shopkeeper, refugee, optimist. In that order on weekdays." } },
    _none = { { id = "tp_none", text = "No idea! It's not on my shelves, and if it were I'd have a price on it." } },
  },
}

---------------------------------------------------------------------------
-- Soolie Berryfizz: alchemy supplies at Berryfizz's Potions and Mixed Drinks in Tinker Town; kin to Tally.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_soolie", id = TODO_NPC("Soolie Berryfizz"), name = "Soolie Berryfizz", title = "Alchemy Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "bright", "careful" }, values = { "craft", "family" },
  notices = { "craft", "race" },
  impression = {
    first = "Soolie Berryfizz sells vials and alchemical supplies at Berryfizz's Potions and Mixed Drinks in Tinker Town, where Tally Berryfizz teaches the craft. She washes every vial herself and holds each one to the lamp.",
    third = "{name} met Soolie Berryfizz, who sells alchemy supplies at Berryfizz's Potions and Mixed Drinks in Tinker Town.",
  },
  greetings = {
    { id = "g_hi", text = "Hello! Vials, in every size, and all of them clean, which you'd be amazed how few shops can say." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again! Did the last batch keep? It keeps much longer in a clean vial, I did a study." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist! Wonderful. Tell me what you're brewing and I'll tell you which glass it wants." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Your fingertips are stained three different colours, so you've been busy. The purple one doesn't come off, I'm sorry to say." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Before you ask, the mixed drinks on the sign are Tally's joke. Mostly. Don't drink anything off the blue shelf." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Soolie Berryfizz. Tally's my kin and she does the teaching, Vosur does the stirring, and I do the supplies, which means I'm the only one in the shop who knows where anything is." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm only rinsing." },
        { id = "h_again2", text = "Yes? Do go on, I can hear over the bubbling." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why does a clean vial matter so much?", next = "clean" },
        { text = "Potions and Mixed Drinks?", next = "sign" },
        { text = "A dwarf apprentice in a gnome's shop?", next = "vosur" },
        { text = "What do alchemists run out of most?", next = "runout" },
        { text = "Goodbye, Soolie.", next = "END" },
      },
    },
    clean = {
      lines = { { id = "cl_default", text = "Because a potion is a very particular arrangement of things, and the dregs of the last one are a different arrangement. Put them together and you get a third thing nobody planned. Sometimes that's a headache, and once it was a small fire." } },
      choices = {
        { text = "Whose small fire?", next = "clean_fire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clean_fire = {
      lines = { { id = "cf_default", text = "Tally's, and she'd tell you it was a controlled reaction. Her notes say controlled. The ceiling has a different view. I've washed every vial myself since then, and we haven't lost an eyebrow in two years." } },
      choices = { { text = "Two years is a fine record for Tinker Town.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    sign = {
      big = true,
      lines = { { id = "si_default", text = "Tally says a potion is only a drink with a purpose. The dwarves come in for the second half of the sign, and she sells them something fizzy and harmless and lets them think it's ale. I've said we ought to tell them what's in it." } },
      choices = {
        { text = "Tell them. A customer should know what they drink.", next = "BACK", reply = "That's what I said! I'll write a little card for each glass, with the ingredients.", fx = { align = { honor = 1 } } },
        { text = "It's harmless fun. Let Tally have her joke.", next = "BACK", reply = "I suppose nobody's turned green. Not permanently.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vosur = {
      lines = { { id = "vo_default", text = "Vosur Brakthel, yes! He walked in the week we opened and said gnomes had forgotten more alchemy than dwarves ever knew, and could he sweep the floor. He hasn't swept it once, but he has very steady hands." } },
      choices = {
        { text = "He sounds like a good find.", next = "vosur_find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vosur_find = {
      lines = { { id = "vf_default", text = "He is. He reaches the high shelves, and he tastes things we wouldn't dare to. Dwarves are astonishingly hard to poison, and I've started keeping notes." } },
      choices = { { text = "Do let him see the notes.", next = "BACK", reply = "He helps me write them! He's very proud of the one about the mushroom.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    runout = {
      lines = { { id = "x1_default", text = "Vials, vials and vials. Nobody ever believes how many they'll need. A potion isn't finished until it's in glass, and an alchemist with a full cauldron and no vials is a very sad sight." } },
      choices = {
        { text = "Has that happened here?", next = "runout_here" },
        { text = "Something else.", next = "BACK" },
      },
    },
    runout_here = {
      lines = { { id = "x2_default", text = "To Tally, in our first month! She'd brewed a whole cauldron of something green, and we ladled it into teacups and the kettle. That's why I took over the supplies." } },
      choices = { { text = "The kettle must have been memorable.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    tally = { { id = "tp_tally", text = "Tally Berryfizz is the best alchemist in Tinker Town and the worst at putting lids back on. I love her dearly and I follow her round with a cloth." } },
    tinker_town = { { id = "tp_tinker", text = "It's home until home is clean again. It's noisy and it smells of oil, and the neighbours wave." } },
    gnomeregan = { { id = "tp_gnomer", text = "The radiation's the trouble. Tally thinks there's a draught that might help the afflicted, and we test a new one every month." } },
    background = { { id = "tp_bg", text = "I ran the glassware for a laboratory at home. It's the same work here, only now I have to explain what a pipette is." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry! I could tell you what sort of vial to keep it in." } },
  },
}

---------------------------------------------------------------------------
-- Tilli Thistlefuzz: enchanting supplies at Thistlefuzz Arcanery; kin to Gimble the enchanting trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_tilli", id = TODO_NPC("Tilli Thistlefuzz"), name = "Tilli Thistlefuzz", title = "Enchanting Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "calm", "amused" }, values = { "family", "knowledge" },
  notices = { "craft", "class" },
  impression = {
    first = "Tilli Thistlefuzz sells rods, dusts and formulas at Thistlefuzz Arcanery near the Great Forge, where her kinsman Gimble teaches enchanting. She is as unflappable as he is jumpy and has learned to finish his sentences.",
    third = "{name} met Tilli Thistlefuzz, who sells enchanting supplies at Thistlefuzz Arcanery in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the Arcanery. Rods and dusts are with me, and if Gimble squeaks when you come in, it's nothing personal." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. Gimble remembered you, which means he's decided you're probably not a spy." },
    { id = "g_ench", when = { profession = "Enchanting" }, text = "An enchanter! I can tell by the faint glow under your nails. What are you short of?" },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "You've been breaking things down for dust, haven't you? There's a shimmer on your sleeve. It brushes off, eventually." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You already know how to put magic into the air, and we put it into objects, where it stays put and behaves." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Tilli Thistlefuzz. Gimble does the teaching and the worrying, and I sell the supplies and tell him nobody is following him. It takes about the same amount of time each." },
      },
      again = {
        { id = "h_again", text = "What else can I help with?" },
        { id = "h_again2", text = "Yes? Go on, Gimble's busy checking the window." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why is Gimble so nervous?", next = "gimble" },
        { text = "What is an enchanting rod actually for?", next = "rod" },
        { text = "Where does the dust come from?", next = "dust" },
        { text = "Does enchanting belong beside a forge?", next = "beside" },
        { text = "Goodbye, Tilli.", next = "END" },
      },
    },
    gimble = {
      lines = { { id = "gi_default", text = "He believes someone is after his formulas, and he has believed it for as long as I've known him. The culprit changes: the Dark Irons, a rival in Stormwind, and once a pigeon. He's brilliant, and it comes with the territory." } },
      choices = {
        { text = "Is anyone actually after them?", next = "gimble_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gimble_after = {
      big = true,
      lines = { { id = "ga_default", text = "No. I checked, quietly, with Thief Catcher Farmountain. I've never told Gimble, because being watched makes him feel important, and being ignored would break his heart. I do wonder if I ought to." } },
      choices = {
        { text = "Tell him. He deserves to stop being afraid.", next = "BACK", reply = "Perhaps. I'd have to pick a calm day, and I'm not certain he has those.", fx = { align = { honor = 1 } } },
        { text = "Leave it. The fear is half his pride.", next = "BACK", reply = "That's what I've thought. He'd only find a new thing to fear, and the pigeon was hard on us all.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rod = {
      lines = { { id = "ro_default", text = "It's a sort of pen. The enchantment is a pattern, and the rod is what you draw it with, so a better rod draws a finer line. A smith makes the blank, and the enchanter wakes it up with dust and a pearl." } },
      choices = { { text = "A pen for magic. That's clearer than any book.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    dust = {
      lines = { { id = "du_default", text = "From enchanted things, unmade. Adventurers bring me rings and bracers they've outgrown, and Thonys Pillarstone, our journeyman, breaks them down at the back table. It's the one part of the craft that makes me a little sad." } },
      choices = {
        { text = "Why sad?", next = "dust_sad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dust_sad = {
      lines = { { id = "ds_default", text = "Somebody made each of those, carefully, and somebody wore it into danger. Then it's a pinch of dust in a jar. Thonys says the magic only moves house, and I've decided to believe him." } },
      choices = { { text = "It's a good way to think of it.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    beside = {
      lines = { { id = "x1_default", text = "More than you'd think. Smiths make the thing, and we make the thing better. A dwarf will spend a month on a sword and then bring it here, pretending he only wants to look." } },
      choices = {
        { text = "Do the smiths approve?", next = "beside_smiths" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beside_smiths = {
      lines = { { id = "x2_default", text = "They grumble that a good blade needs no magic, and then they ask what it costs. Bengus Deepforge had his own hammer done, and he's told everyone it was a gift." } },
      choices = { { text = "Pride and practicality, side by side.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gimble = { { id = "tp_gimble", text = "Gimble Thistlefuzz is family, and the finest enchanter in Ironforge. He's also hiding behind the counter, I expect, so wave." } },
    great_forge = { { id = "tp_forge", text = "It's very warm and it shakes the shelves when they pour. Gimble thinks the pours are a signal. They aren't." } },
    thonys = { { id = "tp_thonys", text = "Thonys Pillarstone is a dwarf who chose enchanting, which his family finds baffling. He's gentle with the work, and I like him for it." } },
    background = { { id = "tp_bg", text = "I kept the stockroom for the enchanters' guild in Gnomeregan. I keep Gimble now as well, which is the larger job." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Don't ask Gimble, he'll want to know why you're asking." } },
  },
}

---------------------------------------------------------------------------
-- Fimble Finespindle: gnome leatherworking trainer at Finespindle's Leather Goods, north side of the Great Forge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_fimble", id = TODO_NPC("Fimble Finespindle"), name = "Fimble Finespindle", title = "Leatherworking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "fussy", "kindly" }, values = { "craft", "family" },
  notices = { "craft", "race" },
  impression = {
    first = "Fimble Finespindle teaches leatherworking at Finespindle's Leather Goods on the north side of the Great Forge. He stitches smaller and straighter than anyone in Ironforge and cannot watch a crooked seam without reaching for it.",
    third = "{name} met Fimble Finespindle, the gnome leatherworking trainer at Finespindle's Leather Goods in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Finespindle's! Mind the hides on the rack, they're curing, and they don't like being leaned on." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Show me your last piece, and I promise to say something nice before I say the rest." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker! Let me see your stitching. Hm, eight to the inch. We'll get you to twelve." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You've wax under your thumbnail and a needle scar on your palm. Good, that means you've stopped being careful and started being quick." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Lovely strong hands, your people, and you grip an awl as if it owed you money. We'll work on that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Fimble Finespindle, and this is the family shop. I teach, Bombus sells the supplies, Lissyphus fits the armour and Gretta takes the beginners. Balthus Stoneflayer has the corner for skinning, since leather has to start somewhere." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I'll keep stitching, if you don't mind." },
        { id = "h_again2", text = "Yes? Ask away, I've only forty more holes to punch." },
      },
      choices = {
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "Gnomes aren't known for leather.", next = "gnomes" },
        { text = "What separates good leather armour from bad?", next = "good" },
        { text = "How do you get on with a dwarf skinner in the shop?", next = "balthus" },
        { text = "What do you start a beginner on?", next = "begin" },
        { text = "Goodbye, Fimble.", next = "END" },
      },
    },
    gnomes = {
      lines = { { id = "gn_default", text = "No, and that's exactly why we're good at it. A dwarf thinks leather is what you wear until you can afford plate. We came to it as engineers, and a jerkin is a machine with forty moving parts that happens to have a person inside." } },
      choices = {
        { text = "A machine with a person inside?", next = "gnomes_machine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes_machine = {
      lines = { { id = "gm_default", text = "Certainly! It has to bend at the elbow, turn at the waist and not creak when a rogue breathes. I draw every pattern with the joints marked, and I've a wooden figure with hinges that I fit them on first." } },
      choices = { { text = "I'd like to see that figure.", next = "BACK", reply = "He's called Stanley, and he's in the back. He's been stabbed a great many times for science.", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    good = {
      lines = { { id = "go_default", text = "The seams, always. Any fool can cut a good hide, but the armour fails where two pieces meet. I double-stitch, wax the thread and hide the knot inside, so that a blade sliding along the seam finds nothing to catch." } },
      choices = { { text = "Hidden knots. I'll look for them.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    balthus = {
      lines = { { id = "ba_default", text = "Very well, now. He thought I was fussy and I thought he was rough, and then he brought me a bear hide without a single nick in it. You can't do my work without his, and he's stopped pretending otherwise." } },
      choices = {
        { text = "Does it trouble you, where the hides come from?", next = "balthus_hides" },
        { text = "Something else.", next = "BACK" },
      },
    },
    balthus_hides = {
      big = true,
      lines = { { id = "bh_default", text = "A little, if I'm honest. Balthus says a beast taken cleanly and used whole is respected. I'd still sooner my students bought hides than went out and made a sport of it." } },
      choices = {
        { text = "Balthus is right. Use the whole beast and waste nothing.", next = "BACK", reply = "Yes, I suppose that's the honest end of it. Waste would be the real insult.", fx = { align = { light = -1 } } },
        { text = "You're right. Killing shouldn't be a pastime.", next = "BACK", reply = "Thank you. I'll go on saying so, and they'll go on not listening.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    begin = {
      lines = { { id = "x1_default", text = "A belt. It's one straight seam, and it teaches them to keep their stitches even over a length. They all want to make boots, and I tell them boots are a belt that's been cruel to you." } },
      choices = {
        { text = "And after the belt?", next = "begin_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    begin_after = {
      lines = { { id = "x2_default", text = "Gloves, which make them cry, and then they come back the next day, and that's how I know which ones are leatherworkers. Gretta keeps a jar of sweets for glove week." } },
      choices = { { text = "Glove week sounds like a trial.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    bombus = { { id = "tp_bombus", text = "Bombus sells the thread, dye and salt. He's family, and he's the only one of us who enjoys doing the accounts." } },
    great_forge = { { id = "tp_forge", text = "The heat's useful, as it happens. Hides cure in half the time on this side of the city." } },
    gretta = { { id = "tp_gretta", text = "Gretta takes the newest students. She's more patient than I am, and they cry less." } },
    background = { { id = "tp_bg", text = "The Finespindles made harness and belting for Gnomeregan's machines. We've only changed what goes inside the leather." } },
    _none = { { id = "tp_none", text = "I couldn't say! Unless it can be stitched, in which case I have opinions." } },
  },
}

---------------------------------------------------------------------------
-- Bombus Finespindle: leatherworking supplies at Finespindle's Leather Goods.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_bombus", id = TODO_NPC("Bombus Finespindle"), name = "Bombus Finespindle", title = "Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "jovial", "exact" }, values = { "family", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Bombus Finespindle sells thread, dye and curing salt at Finespindle's Leather Goods and keeps the family's books. He is round, cheerful and knows the price of salt in four cities.",
    third = "{name} met Bombus Finespindle, who sells leatherworking supplies at Finespindle's Leather Goods in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Thread, dye and salt! Fimble will tell you how to use them, at length, and I'll simply sell them to you." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! You're in the book now, you know, under good customers." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker! Then you're out of coarse thread. No, don't tell me how I know, everyone always is." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You skin your own, I can smell it, no offence meant. You'll want salt, and more of it than you think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bombus Finespindle. I'm the Finespindle who can't sew, so they put me in charge of everything else. I buy the salt, sell the thread and make sure the shop still belongs to us at the end of each month." },
      },
      again = {
        { id = "h_again", text = "What else? I've a column to add, but it isn't going anywhere." },
        { id = "h_again2", text = "Yes, yes, ask! I like a chat better than a ledger." },
        { id = "h_again3", text = "Go on, ask! The sums can wait, they always add up the same." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "A Finespindle who can't sew?", next = "sew" },
        { text = "Why does a leather shop sell so much salt?", next = "salt" },
        { text = "How does a family share one small shop?", next = "family" },
        { text = "What's the oddest thing in the stock book?", next = "odd" },
        { text = "Goodbye, Bombus.", next = "END" },
      },
    },
    sew = {
      lines = { { id = "se_default", text = "Not a stitch! Fimble tried to teach me for eleven years, and at the end of it I'd made one glove with six fingers. He keeps it on the wall, and he says it's to encourage the students." } },
      choices = { { text = "Six fingers would suit somebody.", next = "BACK", reply = "That's what I said! Nobody's come in for it yet, but I'm hopeful.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    salt = {
      lines = { { id = "sa_default", text = "Because a raw hide rots in two days unless it's salted, and every hunter forgets that until the smell reminds them. I buy it by the barrel from the Menethil boats, and the price goes up whenever the Wetlands road is closed." } },
      choices = {
        { text = "And when the price goes up?", next = "salt_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    salt_price = {
      big = true,
      lines = { { id = "sp_default", text = "Then I've a choice. I can pass it on to the customers, or I can take the loss and keep them. Fimble says we should swallow it, since half of them are students with no coin. I say a shop that swallows every loss gets eaten." } },
      choices = {
        { text = "Swallow it. They'll remember who was fair.", next = "BACK", reply = "Oh, bother. That's what the ledger says they do, as well. Very well.", fx = { align = { honor = 1 } } },
        { text = "Pass it on. The shop has to survive.", next = "BACK", reply = "Exactly so! I'll put up a little notice explaining about the road.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "fa_default", text = "By each of us having a corner and staying in it. Fimble has the bench, Lissyphus the fitting stand, Gretta the beginners' table and I've the counter. We only quarrel at stocktaking, and Balthus referees, because he's a dwarf and can't be bribed with cake." } },
      choices = {
        { text = "What is Balthus bribed with?", next = "family_balthus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_balthus = {
      lines = { { id = "fb_default", text = "Nothing, I've tried! Ale, pie, a very nice belt. He just looks at the hides and says who's right. It's dreadful, and it works." } },
      choices = { { text = "An honest referee is worth keeping.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    odd = {
      lines = { { id = "x1_default", text = "Forty pounds of dragon scale, entered in my grandfather's hand, with a note saying not for sale. We left it behind when we fled, and I still carry it over on the books each year." } },
      choices = {
        { text = "Why keep it on the books?", next = "odd_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    odd_why = {
      lines = { { id = "x2_default", text = "Because the day I strike it off is the day I've agreed it's gone. An accountant's allowed one sentimental entry, and that one's mine." } },
      choices = { { text = "Then leave it there until you go home.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    fimble = { { id = "tp_fimble", text = "Fimble's the talent of the family. I'm the one who makes sure the talent can afford thread." } },
    balthus = { { id = "tp_balthus", text = "Balthus Stoneflayer teaches skinning in our corner. He hardly says a word, and every hide he brings in is perfect." } },
    great_forge = { { id = "tp_forge", text = "Good passing trade and terrible soot. I dust the dye jars twice a day." } },
    background = { { id = "tp_bg", text = "Bookkeeper to the Finespindles, by popular demand and one six-fingered glove." } },
    _none = { { id = "tp_none", text = "Haven't the faintest! It's not in the stock book, at any rate." } },
  },
}

---------------------------------------------------------------------------
-- Balthus Stoneflayer: dwarf skinning trainer in Finespindle's Leather Goods.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_balthus", id = TODO_NPC("Balthus Stoneflayer"), name = "Balthus Stoneflayer", title = "Skinning Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "taciturn", "exact" }, values = { "craft", "nature" },
  notices = { "craft", "pet" },
  impression = {
    first = "Balthus Stoneflayer teaches skinning from a corner of Finespindle's Leather Goods, the one dwarf in a shop of gnomes. He says little, keeps his knives sharper than razors and wastes nothing.",
    third = "{name} met Balthus Stoneflayer, the skinning trainer at Finespindle's Leather Goods in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Skinnin' ye're after, is it? Then show me yer knife first, for I can tell more from the edge than from yer talk." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Did ye keep the edge on it, or did ye go at a boar wi' a butter knife again?" },
    { id = "g_skin", when = { profession = "Skinning" }, text = "A skinner, good. Hold out yer hands, for the calluses will tell me how long ye've been at it." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Dinnae fret, I've nae designs on yer {pet}. I only take what's already down." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Ye work leather. Then ye ken a bad cut costs ye the whole hide, an' ye'll listen better than most." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Balthus Stoneflayer. I teach folk tae take a hide off clean, so the Finespindles have somethin' fit tae sew. It's simple work, an' simple isnae the same as easy." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Aye. Ask, then." },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "What's the secret to a clean hide?", next = "clean" },
        { text = "You're the only dwarf in a shop full of gnomes.", next = "gnomes" },
        { text = "You don't waste words.", next = "words" },
        { text = "What beasts are worth skinning in Dun Morogh?", next = "beasts" },
        { text = "I was sent to you about a camp.", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Skinning") } },
        { text = "Good day, Balthus.", next = "END" },
      },
    },
    clean = {
      lines = { { id = "cl_default", text = "A sharp knife an' nae hurry. Ye cut along the belly an' let the weight o' the hide do the pullin', an' ye never saw at it. Most folk ruin a pelt in the first minute because they're still excited from the kill." } },
      choices = {
        { text = "So you wait before you cut?", next = "clean_wait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clean_wait = {
      big = true,
      lines = { { id = "cw_default", text = "I do. I sit a moment wi' the beast first. My father called it thankin' it, an' I'm no' sure I'd go so far, but yer hands are steadier after. The young ones think it's daft." } },
      choices = {
        { text = "It's not daft. The beast is owed that much.", next = "BACK", reply = "Aye. That's near what my father said. Ye'll make a decent skinner.", fx = { align = { light = 1 } } },
        { text = "It's a carcass. Just do the work.", next = "BACK", reply = "Then ye'll nick the hide, the way they always do, but suit yerself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes = {
      lines = { { id = "gn_default", text = "I am. They talk enough for a whole clan, so I've nae need tae. Fimble does the finest stitchin' I've seen in two hundred years, an' he's earned good hides. That's why I'm here an' no' in some hunter's lodge." } },
      choices = {
        { text = "That's high praise, from you.", next = "gnomes_praise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes_praise = {
      lines = { { id = "gp_default", text = "It's the truth. I told him once, an' he talked about it for a week. I'll no' make that mistake twice." } },
      choices = { { text = "Your secret is safe.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    words = {
      lines = { { id = "wo_default", text = "Ye dinnae need many. I spent forty years huntin' the high passes alone, an' the beasts never asked my opinion. I come down tae teach in the cold months, an' by spring I've said all I had." } },
      choices = { { text = "Then I'll not use up your supply.", next = "BACK", reply = "Hm. Ye're all right.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    beasts = {
      lines = { { id = "x1_default", text = "Crag boar for a beginner, for the hide's thick an' forgivin'. Wolf when ye've a steadier hand. Snow leopard only when ye're good, for the pelt's thin an' worth more than a month's wages." } },
      choices = {
        { text = "And bear?", next = "beasts_bear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "cp_default", text = "Then here's the whole lesson, an' I'll say it once: whatever ye hunt for the pot has a coat on it, an' that coat is a bedroll, a windbreak or a waterskin if ye take it off in one piece. Skin it warm, scrape it clean an' stretch it by the fire, an' ye'll never sleep cold on the mountain.", fx = { learn = { "camping" } } } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    beasts_bear = {
      lines = { { id = "x2_default", text = "Bear's heavy work an' ye'll want help turnin' it. But a winter bear hide will keep a family warm for twenty years. I've one on my own bed that was my grandfather's." } },
      choices = { { text = "Twenty years is good value.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    fimble = { { id = "tp_fimble", text = "Fimble Finespindle is the best leatherworker in Ironforge, an' he talks enough for the both of us." } },
    dun_morogh = { { id = "tp_dm", text = "Boar, bear, wolf an' leopard. Good hides, all o' them, an' thick, for the cold." } },
    bombus = { { id = "tp_bombus", text = "Bombus keeps tryin' tae bribe me at stocktakin'. It was a good belt, mind. I gave it back." } },
    background = { { id = "tp_bg", text = "I'm a Stoneflayer, an' we've been trappers in these hills since before the city had gates." } },
    camping = { { id = "tp_camp", text = "A good hide, stretched an' dried, is the difference between a camp an' a cold night on bare stone." } },
    _none = { { id = "tp_none", text = "I dinnae ken, an' I'll no' guess. Ask someone who talks more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Jormund Stonebrow: tailoring trainer at Stonebrow's Clothier, north side of the Great Forge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_jormund", id = TODO_NPC("Jormund Stonebrow"), name = "Jormund Stonebrow", title = "Tailoring Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "dignified", "particular" }, values = { "craft", "tradition" },
  notices = { "craft", "class" },
  impression = {
    first = "Jormund Stonebrow teaches tailoring at Stonebrow's Clothier on the north side of the Great Forge. He is the best-dressed dwarf in Ironforge and has spent a lifetime being told that needlework is no trade for a dwarf.",
    third = "{name} met Jormund Stonebrow, the tailoring trainer at Stonebrow's Clothier in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Good day, an' welcome tae Stonebrow's. Wipe the soot from yer hands before ye touch the silk, if ye'd be so kind." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, ye've returned. Turn about an' let me see how that last hem has held." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor, splendid! Ye'll find nae jokes about needles in this shop, only work." },
  },
  notice = {
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Yer robe's cut for a taller frame an' taken up badly. I could have that hangin' right in an afternoon." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Ye've a thimble callus on the middle finger, so ye sew by hand. Good. A tailor who cannae hand-stitch is only a cutter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jormund Stonebrow, master tailor. I teach the craft here, Poranna Snowbraid sells the thread an' dye, an' my kinswoman Ingrys sells what we make. Every mage an' priest in this city wears somethin' that passed under my needle." },
      },
      again = {
        { id = "h_again", text = "Is there aught else? I've a sleeve tae set." },
        { id = "h_again2", text = "Aye, go on. I can talk an' baste." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "A dwarf tailor must hear some remarks.", next = "remarks" },
        { text = "What cloth is worth a tailor's time?", next = "cloth" },
        { text = "Who do you make for?", next = "customers" },
        { text = "What does an apprentice tailor learn first?", next = "first" },
        { text = "Good day, Master Stonebrow.", next = "END" },
      },
    },
    remarks = {
      lines = { { id = "re_default", text = "For two hundred years. My brothers went tae the forge an' I went tae the loom, an' my father didnae speak o' me at table. Then the king's chamberlain ordered a ceremonial cloak from this shop, an' my father found he had a tailor in the family after all." } },
      choices = {
        { text = "Did you forgive him?", next = "remarks_forgive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    remarks_forgive = {
      big = true,
      lines = { { id = "rf_default", text = "I made him a coat, an' he wore it tae his grave. I've never been certain whether that was forgiveness on my part or only good manners. What would ye call it?" } },
      choices = {
        { text = "Forgiveness. You gave him your best work.", next = "BACK", reply = "Aye. I think it was, at that. It was a very fine coat.", fx = { align = { light = 1 } } },
        { text = "Manners. He hadn't earned more.", next = "BACK", reply = "Perhaps no'. Ye've a hard eye, but I'll no' say it's a false one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "cl_default", text = "Linen tae learn on, wool for honest wear, an' silk when ye're ready tae be humbled. Mageweave is another matter, for it fights the needle as if it had a mind. I've sewn it forty years an' it still surprises me." } },
      choices = { { text = "Cloth with a mind of its own.", next = "BACK", reply = "Aye, an' a poor opinion o' tailors. Ye learn tae coax it.", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    customers = {
      lines = { { id = "cu_default", text = "The Hall o' Mysteries, chiefly. High Priest Rohan's vestments are mine, an' the mages order by the dozen because they scorch their cuffs. The gnomes were a new study, mind, for nothin' I owned was small enough tae measure them." } },
      choices = {
        { text = "How did you manage the gnomes?", next = "customers_gnomes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_gnomes = {
      lines = { { id = "cg_default", text = "Outfitter Eric lent me a gnomish tape, marked in units I've never understood. I measure wi' his tape an' cut by my own eye, an' Bink tells me her robe is the first that hasnae tripped her on the stairs." } },
      choices = { { text = "That's a craftsman adapting.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "x1_default", text = "Tae press. Before a stitch is sewn, they spend a month at the iron, for a seam that isnae pressed will never lie flat however fine the sewin'. They hate it, an' they thank me later." } },
      choices = {
        { text = "A whole month of pressing?", next = "first_month" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_month = {
      lines = { { id = "x2_default", text = "Uthrar Threx did six weeks, for he scorched a bolt o' silk in the fifth. He's the neatest presser in Ironforge now, an' he checks the iron three times." } },
      choices = { { text = "A scorched bolt is a lasting lesson.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    poranna = { { id = "tp_poranna", text = "Poranna Snowbraid keeps the thread an' dye. She can match a colour from across the Forge by lamplight." } },
    great_forge = { { id = "tp_forge", text = "A poor place for a clothier, wi' the soot. But the rent is what it is, an' I keep the bolts under linen." } },
    uthrar = { { id = "tp_uthrar", text = "Uthrar Threx is my journeyman. He's a good plain sewer, an' he'll be a fine one when he stops rushin' his buttonholes." } },
    background = { { id = "tp_bg", text = "A Stonebrow, an' the first o' the name tae lift a needle. No' the last, I'm glad tae say." } },
    _none = { { id = "tp_none", text = "That's outside my learnin', I fear. I'd no' wish tae give ye a poorly cut answer." } },
  },
}

---------------------------------------------------------------------------
-- Poranna Snowbraid: tailoring supplies at Stonebrow's Clothier.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_poranna", id = TODO_NPC("Poranna Snowbraid"), name = "Poranna Snowbraid", title = "Tailoring Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "warm", "sharp-eyed" }, values = { "craft", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Poranna Snowbraid sells thread, dye and bolts of cloth at Stonebrow's Clothier beside the Great Forge. She has a wall of spools sorted by colour and can name any shade a customer is wearing.",
    third = "{name} met Poranna Snowbraid, who sells tailoring supplies at Stonebrow's Clothier in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Come in, dear. Thread, dye an' cloth, an' if ye dinnae ken what colour ye want, I'll ken it for ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Ye were wearin' that same grey last time. We'll have tae do somethin' about that." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor! Then ye're out o' fine thread, for nobody ever buys enough." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "That's yer own work ye're wearin', is it no'? The stitchin's sound, but ye matched the thread by candlelight, dear, an' it shows." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "I keep half-spools for the wee folk, dear, since ye use so little. Nae sense payin' for thread ye'll never reach the end of." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Poranna Snowbraid, dear. Jormund teaches the sewin', an' I sell what ye sew wi'. My sister Maeva sells robes over in the Mystic Ward, so between the Snowbraids an' the Stonebrows we've the cloth trade fair stitched up." },
      },
      again = {
        { id = "h_again", text = "What else, dear?" },
        { id = "h_again2", text = "Go on, I'm only windin' spools." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "How do you match a colour so quickly?", next = "colour" },
        { text = "Where do the dyes come from?", next = "dye" },
        { text = "What's Jormund like to work beside?", next = "jormund" },
        { text = "What colours do dwarves actually buy?", next = "buy" },
        { text = "Good day, Poranna.", next = "END" },
      },
    },
    colour = {
      lines = { { id = "co_default", text = "Practice, an' the Forge. Ye see every shade o' red an' gold there is in that fire, an' after fifty years beside it yer eye gets tuned. I take the cloth out tae the rail an' match it by forge-light, which is truer than any lamp." } },
      choices = { { text = "Forge-light for matching thread. Who'd have guessed?", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    dye = {
      lines = { { id = "dy_default", text = "Red from a beetle they send up from Stranglethorn, blue from a flower in Elwynn, an' black from oak galls an' iron, which we've plenty of. Purple I cannae get at any price, so the mages bring their own an' willnae say where from." } },
      choices = {
        { text = "The mages won't tell you?", next = "dye_mages" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dye_mages = {
      big = true,
      lines = { { id = "dm_default", text = "No' a word, an' I've asked nicely. I've a wee sample put by, an' Soolie Berryfizz says she could work out what's in it in a week. It'd be worth a fortune tae the shop. It'd also be takin' what isnae mine." } },
      choices = {
        { text = "Leave it. A craftsman's secret is his own.", next = "BACK", reply = "Aye, dear, ye're right. I'd no' thank anybody for doin' it tae me.", fx = { align = { honor = 1 } } },
        { text = "Find out. They're selling to you, after all.", next = "BACK", reply = "That's what the wicked half o' me says. I'll see how I feel on Monday.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jormund = {
      lines = { { id = "jo_default", text = "Proud as a senator an' twice as tidy. He unpicked a whole gown once because one seam was a hair off, an' the customer never would have seen it. I thought him daft at the time." } },
      choices = {
        { text = "And now?", next = "jormund_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jormund_now = {
      lines = { { id = "jn_default", text = "Now I think that's why folk walk past three other shops tae reach ours. He kens the seam is there, an' that's enough for him. I've stopped arguin', an' I order extra thread." } },
      choices = { { text = "That kind of pride builds a good shop.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    buy = {
      lines = { { id = "x1_default", text = "Brown, grey an' a red that's near enough brown, dear. I've a wall o' colours, an' the dwarves walk past every one tae the same three spools. The gnomes buy the rest, bless them." } },
      choices = {
        { text = "What do the gnomes choose?", next = "buy_gnomes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buy_gnomes = {
      lines = { { id = "x2_default", text = "Everythin' at once! I sold one wee lass seven colours for a single scarf. It looked like a firework, an' she was that pleased wi' it I've kept the bright thread at the front ever since." } },
      choices = { { text = "The gnomes are good for your shelves.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    jormund = { { id = "tp_jormund", text = "Jormund Stonebrow's the finest tailor in Khaz Modan, an' he'd be the first tae tell ye, dear." } },
    maeva = { { id = "tp_maeva", text = "My sister Maeva sells robes by the Hall o' Mysteries. She got the looks an' I got the eye for colour, an' we've both done well by it." } },
    great_forge = { { id = "tp_forge", text = "The warmest spot in Ironforge. My joints are grateful, even if the silk isnae." } },
    background = { { id = "tp_bg", text = "A Snowbraid, dear. My mother wove, an' her mother before her." } },
    _none = { { id = "tp_none", text = "I couldnae say, dear, unless it's a colour, for I'm awful good wi' colours." } },
  },
}

---------------------------------------------------------------------------
-- Reyna Stonebranch: herbalism trainer at the Ironforge Physician, south side of the Great Forge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_reyna", id = TODO_NPC("Reyna Stonebranch"), name = "Reyna Stonebranch", title = "Herbalism Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "gentle", "stubborn" }, values = { "nature", "knowledge" },
  notices = { "craft", "race" },
  impression = {
    first = "Reyna Stonebranch teaches herbalism at the Ironforge Physician on the south side of the Great Forge. She grows what she can in trays under lamps and misses the sky more than a dwarf is supposed to admit.",
    third = "{name} met Reyna Stonebranch, the herbalism trainer at the Ironforge Physician.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, an' mind the trays by the door. That's peacebloom, an' it's taken me a year tae coax it up under a lamp." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back! Have ye brought me anythin' green? I'll even take a weed, it's been a long winter." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "A herbalist! Ye smell o' earthroot an' fresh air. Stand there a moment an' let me breathe." },
    { id = "g_camp", when = { questActive = TODO_QUEST("Camping 101: Herbalism") }, text = "Ah, ye've come about the camp lessons. Good, for a camp wi' nae herbalist in it is only a cold place tae be ill." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "One o' the kaldorei, in my wee shop. Ye'll think my trays a sad sort o' garden, an' ye'll be right, but they're all the green I've got." },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "There's sap on yer cuffs, so ye've been pickin' this week. Tell me what's flowerin' out there, I get so little news." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Reyna Stonebranch. I teach folk tae find herbs an' gather them wi'out killin' the plant, an' my sister Gwina sells the tools. Nissa Firestone has the bandages at the other table, so between us we're the nearest thing tae a physician the Forge has." },
      },
      again = {
        { id = "h_again", text = "What else would ye like tae ken?" },
        { id = "h_again2", text = "Aye, ask. The seedlings are in nae hurry." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "A herbalist under a mountain is a strange thing.", next = "mountain" },
        { text = "What grows in Dun Morogh, under all that snow?", next = "snow" },
        { text = "How do you gather without killing the plant?", next = "gather" },
        { text = "What do the smiths come to you for?", next = "smiths" },
        { text = "What does an herbalist bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Herbalism") } },
        { text = "Good day, Reyna.", next = "END" },
      },
    },
    mountain = {
      lines = { { id = "mo_default", text = "It is, an' my mother said so every day. But the smiths burn themselves an' the miners cough, an' somebody must ken which leaf helps. I go out tae the valley every spring wi' a basket, an' it keeps me sane the rest o' the year." } },
      choices = {
        { text = "You'd live outside, if you could.", next = "mountain_out" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mountain_out = {
      big = true,
      lines = { { id = "mu_default", text = "In a heartbeat, an' that's a shameful thing for a dwarf tae say. Gwina says my place is here, where I'm needed. I've a notion tae go tae Loch Modan an' teach by the water. Is it selfish tae want that?" } },
      choices = {
        { text = "Stay. The Forge needs its healer.", next = "BACK", reply = "Aye. That's Gwina's word too, an' she's seldom wrong. The trays will have tae do.", fx = { align = { order = 1 } } },
        { text = "Go. You've given the mountain enough years.", next = "BACK", reply = "Oh, dinnae tempt me. I'll think on it when the snow melts, an' I thank ye for sayin' it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    snow = {
      lines = { { id = "sn_default", text = "More than ye'd think. Peacebloom an' silverleaf in the sheltered hollows, an' earthroot on the hillsides where the wind keeps the snow thin. Look near the roots o' the pines, for the needles keep the ground warm." } },
      choices = { { text = "Near the pine roots. Thank you.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    gather = {
      lines = { { id = "ga_default", text = "Ye take a third an' leave the rest, an' ye never pull the root unless the root is what ye came for. A patch treated that way will feed ye for a lifetime. I've been pickin' the same silverleaf by Kharanos since I was a girl." } },
      choices = {
        { text = "Do your students keep to that?", next = "gather_students" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gather_students = {
      lines = { { id = "gs_default", text = "The druids do, the few I've met off the Auberdine boats. The rest strip a hollow bare an' come back complainin' there's nothin' left. I send those tae pick for Gwina a season, an' she straightens them out." } },
      choices = { { text = "A season with Gwina sounds like a cure.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    smiths = {
      lines = { { id = "x1_default", text = "Burns, every day. I make a salve o' silverleaf an' peacebloom, an' it takes the fire out in a minute. They come in gruff an' go out quiet, an' they never say thank ye, but the next week there's a mended kettle on my step." } },
      choices = {
        { text = "They pay in kettles?", next = "smiths_kettles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smiths_kettles = {
      lines = { { id = "x2_default", text = "Kettles, hinges, a wee iron trellis for the trays. A smith's too proud tae owe ye, so he pays ye sideways. I've the best-made herb racks in Khaz Modan." } },
      choices = { { text = "Gratitude in iron. That's very dwarven.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "cp_default", text = "A wee pouch o' dried leaf for the kettle, an' the knowledge o' what's growin' within a hundred paces o' the fire. A cup o' the right tea at night is the difference between marchin' in the mornin' an' lyin' there groanin'.", fx = { learn = { "camping" } } } },
      choices = { { text = "I'll keep a pouch for the kettle. Something else.", next = "BACK" } },
    },
  },
  topics = {
    gwina = { { id = "tp_gwina", text = "My sister, an' the practical one. She sells the sickles an' the pouches an' tells me tae stop moonin' at the door." } },
    nissa = { { id = "tp_nissa", text = "Nissa Firestone teaches the bandagin'. She sees every burn the Forge hands out, an' I supply what goes under the wrappin'." } },
    great_forge = { { id = "tp_forge", text = "Hot, dry an' dark. It's the worst place in Azeroth tae grow a thing, an' I manage it anyway, out o' spite." } },
    background = { { id = "tp_bg", text = "A Stonebranch. The name's a joke the family made about us a long while back, an' we kept it." } },
    _none = { { id = "tp_none", text = "I dinnae ken, I'm sorry. If it has leaves I might, so describe it tae me." } },
  },
}

---------------------------------------------------------------------------
-- Gwina Stonebranch: herbalism supplies at the Ironforge Physician; Reyna's sister.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_gwina", id = TODO_NPC("Gwina Stonebranch"), name = "Gwina Stonebranch", title = "Herbalism Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "brisk", "dry" }, values = { "practical", "family" },
  notices = { "craft", "kit" },
  impression = {
    first = "Gwina Stonebranch sells sickles, pouches and vials at the Ironforge Physician, where her sister Reyna teaches herbalism. She is the practical half of the pair and counts the stock while Reyna talks to the seedlings.",
    third = "{name} met Gwina Stonebranch, who sells herbalism supplies at the Ironforge Physician.",
  },
  greetings = {
    { id = "g_hi", text = "Sickles, pouches an' vials. Reyna does the teachin', an' I do the sellin', so tell me which ye're here for." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Lost the sickle or filled the pouch?" },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "A picker. Let me see yer pouch. Aye, that's damp at the bottom, an' yer herbs will mould by Thursday." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Alchemy" } },
      text = "Ye've the look o' somebody who uses what I sell. Good. I've nae patience for folk who buy a sickle tae hang on the wall." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gwina Stonebranch. My sister can tell ye the name o' every flower in Khaz Modan an' cannae tell ye what day it is. I keep the shop open, the stock counted an' Reyna fed, an' I sell good tools at a fair price." },
      },
      again = {
        { id = "h_again", text = "What else? I've vials tae count." },
        { id = "h_again2", text = "Aye, go on." },
        { id = "h_again3", text = "Aye, be quick about it." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You and Reyna are very different.", next = "reyna" },
        { text = "What does a herbalist actually need?", next = "need" },
        { text = "Reyna says you straighten out greedy pickers.", next = "greedy" },
        { text = "What breaks first on a herbalist's kit?", next = "kit" },
        { text = "Good day, Gwina.", next = "END" },
      },
    },
    reyna = {
      lines = { { id = "re_default", text = "We are, an' it's as well. If we were both like her, we'd have a shop full o' flowers an' nae roof. If we were both like me, we'd have a roof an' nothin' worth puttin' under it." } },
      choices = {
        { text = "She talks of leaving for Loch Modan.", next = "reyna_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reyna_leave = {
      lines = { { id = "rl_default", text = "Every spring, regular as the thaw. I tell her she's needed here, an' she is. I dinnae tell her that I'd be lost wi'out her, for she'd stay out o' pity, an' I'll no' have that." } },
      choices = { { text = "You're softer than you let on.", next = "BACK", reply = "Say that again an' I'll charge ye double for the sickle.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    need = {
      lines = { { id = "ne_default", text = "A sharp sickle, a dry pouch an' a pair o' eyes. Folk come in wantin' gadgets, an' I send them away wi' three things an' their coin still in their purse. Burbik Gearspanner thinks I've lost my wits." } },
      choices = { { text = "An honest shop is a rare one.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    greedy = {
      lines = { { id = "gr_default", text = "I do. I send them out tae pick me fifty silverleaf from one hollow wi'out harmin' it. They come back wi' ten an' a new respect, or they dinnae come back, an' either way the hollow's safe." } },
      choices = {
        { text = "And those who strip it anyway?", next = "greedy_strip" },
        { text = "Something else.", next = "BACK" },
      },
    },
    greedy_strip = {
      big = true,
      lines = { { id = "gs_default", text = "I stop sellin' tae them, an' I tell every supplier from here tae Thelsamar tae do the same. Reyna says that's harsh, for folk have tae earn a livin'. I say a livin' that leaves the valley bare is a theft from everybody after." } },
      choices = {
        { text = "You're right. Greed like that should cost them.", next = "BACK", reply = "Aye. I'm glad somebody else sees it plain.", fx = { align = { order = 1 } } },
        { text = "Reyna's right. It isn't your place to punish.", next = "BACK", reply = "Hmph. Maybe no'. I'll still no' sell them a sickle.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kit = {
      lines = { { id = "x1_default", text = "The pouch, at the drawstring. Folk yank it open wi' wet hands a hundred times a day. I double the cord on mine, an' I've no' had one back in four years." } },
      choices = {
        { text = "And the sickle?", next = "kit_sickle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kit_sickle = {
      lines = { { id = "x2_default", text = "The sickle lasts for ever if ye dry it. Naebody dries it. I sell more sickles tae rust than tae new pickers, an' I tell each o' them so at the counter." } },
      choices = { { text = "Do they dry the next one?", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    reyna = { { id = "tp_reyna", text = "My sister. The gentlest dwarf in Ironforge, an' the most stubborn, which she gets from me." } },
    great_forge = { { id = "tp_forge", text = "It dries herbs faster than any rack. That's the one good thing I'll say for the heat." } },
    physician = { { id = "tp_phys", text = "The Ironforge Physician is us an' Nissa Firestone. Burns, coughs an' crushed fingers, mostly. It's steady work." } },
    background = { { id = "tp_bg", text = "A Stonebranch, an' the one wi' her feet on the ground." } },
    _none = { { id = "tp_none", text = "Dinnae ken. Ask Reyna, an' set aside an hour." } },
  },
}

---------------------------------------------------------------------------
-- Outfitter Eric: gnome speciality tailoring supplies near the Great Forge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_eric", id = TODO_NPC("Outfitter Eric"), name = "Outfitter Eric", title = "Speciality Tailoring Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "flamboyant", "exacting" }, values = { "style", "craft" },
  notices = { "class", "craft" },
  impression = {
    first = "Outfitter Eric sells rare patterns and fine thread near the Great Forge and dresses better than anyone has cause to in a city of soot. He regards dwarven fashion as a problem he has been sent to solve.",
    third = "{name} met Outfitter Eric, a gnome who sells speciality tailoring supplies near the Great Forge in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Outfitter Eric, purveyor of patterns you won't find on any other counter in this mountain. Do come in, and do mind the lace." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned! And in the same boots, I see. We shall say no more about it." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor! At last, somebody who will understand why a shirt needs eleven buttons." },
  },
  notice = {
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "All that plate, and nothing soft beneath it but a sack, I expect. A proper shirt under armour changes a person's whole outlook." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew, I can tell by the way you looked at my cuffs first. They're hand-rolled, thank you for noticing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Outfitter Eric. Poranna Snowbraid sells the thread a tailor needs, and I sell the patterns a tailor wants, which are a different thing entirely. Formal shirts, dress trousers and a tuxedo, if you've the skill for it." },
      },
      again = {
        { id = "h_again", text = "Something further? I'm only pressing a collar." },
        { id = "h_again2", text = "Yes? Ask, ask, I do love to be consulted." },
      },
      choices = {
        { text = "Show me your patterns.", next = "BUSINESS" },
        { text = "A tuxedo, in Ironforge?", next = "tuxedo" },
        { text = "What do you make of dwarven dress?", next = "dwarves" },
        { text = "Why Outfitter, and not just Eric?", next = "name" },
        { text = "What should a well-dressed adventurer own?", next = "own" },
        { text = "Goodbye, Eric.", next = "END" },
      },
    },
    tuxedo = {
      lines = { { id = "tu_default", text = "And why not in Ironforge? There are weddings here, and feasts, and a Senate that sits in armour because nobody has shown it an alternative. I've sold four patterns this year, and three of them to dwarves who asked me not to say so." } },
      choices = {
        { text = "Who was the fourth?", next = "tuxedo_fourth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tuxedo_fourth = {
      lines = { { id = "tf_default", text = "Jormund Stonebrow, who bought it to see whether he could improve on it. He sent it back with two corrections in the margin, and I'm sorry to say both were right." } },
      choices = { { text = "That must have stung.", next = "BACK", reply = "Terribly. I've framed it. One should keep one's defeats where one can see them.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      big = true,
      lines = { { id = "dw_default", text = "They dress to survive a rockfall, and I respect that, truly. But a people who carve halls like these and then wear brown to stand in them! I've wondered whether it's my place to say so, being a guest." } },
      choices = {
        { text = "It isn't. Their ways are their own.", next = "BACK", reply = "No. No, you're quite right, and I shall admire the stonework and keep quiet about the brown.", fx = { align = { order = 1 } } },
        { text = "Say it. A little colour never hurt a mountain.", next = "BACK", reply = "My thought exactly! I shall begin with scarves and work inward.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "Because there were nine Erics on my level of Gnomeregan, and one distinguishes oneself by trade. There was Welder Eric, Plumber Eric and a Sprocket Eric nobody cared for. I'm the only one I know made it out, so I keep the title for all of us." } },
      choices = {
        { text = "I'm sorry about the other Erics.", next = "name_erics" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_erics = {
      lines = { { id = "ne_default", text = "Thank you. I like to think they're only delayed. When the city's retaken I intend to walk back in wearing something magnificent, so they can find me in the crowd." } },
      choices = { { text = "I hope they see you coming.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    own = {
      lines = { { id = "x1_default", text = "One good shirt. Not for fighting in, heavens, but for the evening after. One walks into the tavern having slain something dreadful, and one ought not to look as if it had won." } },
      choices = {
        { text = "And beyond the shirt?", next = "own_beyond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    own_beyond = {
      lines = { { id = "x2_default", text = "Clean boots and a comb. That's all. Elegance is mostly the appearance of having had time, and nobody need know one hadn't." } },
      choices = { { text = "The appearance of having had time. Noted.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    jormund = { { id = "tp_jormund", text = "Jormund Stonebrow is the one dwarf in Ironforge who understands a lapel. I'd call him a rival if he weren't so obviously my better." } },
    great_forge = { { id = "tp_forge", text = "Soot, sparks and steam. I chose it for the passing trade and I regret it every laundry day." } },
    gnomeregan = { { id = "tp_gnomer", text = "We had a promenade on the upper level, and people dressed for it. I miss being looked at by people who knew what they were seeing." } },
    background = { { id = "tp_bg", text = "An outfitter, by trade and by title. I dressed the engineers' guild for its annual dinner, in happier years." } },
    _none = { { id = "tp_none", text = "I haven't the least idea. I could tell you what to wear while finding out." } },
  },
}

---------------------------------------------------------------------------
-- Grumnus Steelshaper: armorsmith trainer at the Great Anvil.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_grumnus", id = TODO_NPC("Grumnus Steelshaper"), name = "Grumnus Steelshaper", title = "Armorsmith Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "stern", "protective" }, values = { "craft", "duty" },
  notices = { "craft", "kit" },
  impression = {
    first = "Grumnus Steelshaper teaches the armourer's side of smithing at the centre of the Great Forge. He counts his work by the soldiers who came home in it, and takes on only smiths who have already proven themselves.",
    third = "{name} met Grumnus Steelshaper, the master armorsmith at the Great Forge in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Stand clear o' the quench, an' say what ye want. If it's armour made, see the merchants. If it's armour learned, we'll see." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are ye? Then ye've work tae show me, I hope, an' no' only questions." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith, good. Bengus teaches ye tae shape iron, an' I teach ye tae make it keep somebody alive." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer armour's hangin' by its rivets. Whoever made it did right by ye, for ye're still standin' in it. Get it mended." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Ye've burns on the left forearm, where the piece rests when ye plannish. That's an armourer's scar, or the start o' one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Grumnus Steelshaper, armorsmith. A smith who's mastered the plain craft comes tae a fork: he makes the thing that strikes or the thing that stops it. Ironus Coldsteel there takes the first sort, an' I take the second." },
        { id = "h_ready", when = { profession = "Blacksmithing", minLevel = 40 }, text = "Grumnus Steelshaper. Ye've the level an' the hands for the armourer's path, if ye want it. It's a choice ye make once, so think before ye answer." },
      },
      again = {
        { id = "h_again", text = "What else? The iron's coolin'." },
        { id = "h_again2", text = "Aye. Ask." },
      },
      choices = {
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "Why armour, and not weapons?", next = "why" },
        { text = "What makes a breastplate good?", next = "plate" },
        { text = "You and Ironus stand at the same anvil.", next = "ironus" },
        { text = "What do you ask of an apprentice?", next = "apprentice" },
        { text = "Good day, Master Steelshaper.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because I made swords for the Second War, an' I never learned where one o' them ended up. Then a lad walked intae this Forge wi' an orc's axe mark across a breastplate o' mine an' nae mark on him. I've no' forged a blade since." } },
      choices = {
        { text = "Do you remember the plate?", next = "why_plate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_plate = {
      lines = { { id = "wp_default", text = "Every rivet. He left it wi' me, an' it hangs behind the bellows. When an apprentice asks why I'm hard on him over a seam, I take him tae look at it." } },
      choices = { { text = "That's a better lesson than any lecture.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    plate = {
      lines = { { id = "pl_default", text = "It's thick where the blow lands an' thin where the body bends, an' it's curved so that a point slides off instead o' bitin'. A flat plate is a target. Folk want it pretty, an' I tell them pretty is for the lid o' the coffin." } },
      choices = { { text = "Curved to turn a point. I'll look for that.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    ironus = {
      lines = { { id = "ir_default", text = "We do, an' we've argued across it for years. He's a strange one, Ironus, quiet, an' he talks about time more than a smith should. His blades are the best I've seen, mind. I test my plate against them." } },
      choices = {
        { text = "Which wins, his blade or your plate?", next = "ironus_wins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ironus_wins = {
      big = true,
      lines = { { id = "iw_default", text = "The plate, more often, an' I'm prouder o' that than I should be. He says the world needs the sword tae end a war. I say it needs the shield tae outlast one. We'll no' settle it, but I'd hear yer mind." } },
      choices = {
        { text = "The shield. Wars are won by those left standing.", next = "BACK", reply = "Aye. That's an armourer's answer, an' ye're welcome at my anvil.", fx = { align = { light = 1 } } },
        { text = "The sword. Nothing ends until someone ends it.", next = "BACK", reply = "Then ye want Ironus. He'll be glad of ye, an' I'll no' hold it against ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    apprentice = {
      lines = { { id = "y1_default", text = "That he wears what he makes. First helm he finishes goes on his own head, an' I hit it wi' a hammer. No' hard. Hard enough that he checks his rivets ever after." } },
      choices = {
        { text = "Has a helm ever failed?", next = "apprentice_failed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apprentice_failed = {
      lines = { { id = "y2_default", text = "One, an' the lad had a lump for a week an' a lesson for life. He's the best helm-maker I've trained. Sends me a cask every year on the day, wi' a note that says only: still holdin'." } },
      choices = { { text = "A lump well earned, then.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    bengus = { { id = "tp_bengus", text = "Bengus Deepforge teaches the plain craft. Learn from him first, an' dinnae come tae me till he says ye're ready." } },
    great_forge = { { id = "tp_forge", text = "The Great Anvil's the centre o' it, an' the centre o' Ironforge. I've stood at it most o' my life." } },
    ironus = { { id = "tp_ironus", text = "Ironus Coldsteel, the weaponsmith. A fine smith an' an odd dwarf. He never seems tae tire." } },
    background = { { id = "tp_bg", text = "A Steelshaper. We've made the Ironforge guard's plate for four generations." } },
    _none = { { id = "tp_none", text = "I dinnae ken, an' I'll no' guess. Ask somebody who isnae standin' at a fire." } },
  },
}

---------------------------------------------------------------------------
-- Ironus Coldsteel: weaponsmith trainer at the Great Anvil.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_ironus", id = TODO_NPC("Ironus Coldsteel"), name = "Ironus Coldsteel", title = "Weaponsmith Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "quiet", "patient" }, values = { "craft", "knowledge" },
  notices = { "craft", "class" },
  impression = {
    first = "Ironus Coldsteel teaches the weaponsmith's side of the craft at the Great Anvil. He is soft-spoken for a smith, works without seeming to hurry, and looks at a finished blade as though he already knows where it will go.",
    third = "{name} met Ironus Coldsteel, the master weaponsmith at the Great Forge in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Well met. There is time for your question, so ask it properly." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back, as I thought you might. What have you made since we last spoke?" },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "A smith. Good. Show me your hammer, and I will tell you what you have been striking too hard." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You hurry your quench, I think. There is a blue at the edge of your work that comes from impatience. It can be unlearned." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN", "ROGUE" } },
      text = "You carry a weapon as one who has needed it. Remember the smith who made it, now and then. He thought of you, though he never knew your name." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Ironus Coldsteel, and I teach the making of weapons to smiths who have mastered the plain craft. Grumnus Steelshaper teaches the making of armour at this same anvil, and we have found that the argument between us improves both." },
        { id = "h_ready", when = { profession = "Blacksmithing", minLevel = 40 }, text = "I am Ironus Coldsteel. You are ready to choose a path, I think, and once chosen it is not lightly changed. There is no need to decide today." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Go on. The steel will wait, and so will I." },
      },
      choices = {
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "You don't speak like the other smiths.", next = "speech" },
        { text = "What makes a blade great?", next = "blade" },
        { text = "Grumnus says the world needs shields more.", next = "grumnus" },
        { text = "Which weapon is hardest to make well?", next = "hardest" },
        { text = "Farewell, Master Coldsteel.", next = "END" },
      },
    },
    speech = {
      lines = { { id = "sp_default", text = "So I am told. I learned my letters before I learned my trade, and from old books, and the habit stayed. The others have stopped remarking on it. A forge cares how you strike, and not how you talk." } },
      choices = { { text = "Fair enough. The work speaks for you.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    blade = {
      lines = { { id = "bl_default", text = "Patience, and nothing else. The steel must be folded until the flaws are worked out of it, and you cannot be told how many folds that is, you can only attend. Most smiths stop when their arm tires. A great blade is one where the smith stopped when the steel was ready." } },
      choices = {
        { text = "How do you know when it's ready?", next = "blade_ready" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade_ready = {
      lines = { { id = "br_default", text = "It changes its voice under the hammer, from a clack to something nearer a bell. You will hear it once, and afterward you will not be able to ignore it. I envy you the first time." } },
      choices = { { text = "I'll listen for the bell.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    grumnus = {
      lines = { { id = "gr_default", text = "He does, and he is a good dwarf to believe it. A shield lets a soldier live through the day. But a war that is only endured goes on for as long as both sides have iron, and I have seen what long wars leave behind them." } },
      choices = {
        { text = "So a weaponsmith shortens wars?", next = "grumnus_short" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grumnus_short = {
      big = true,
      lines = { { id = "gs_default", text = "That is what I tell myself. I also know that every blade I make will outlast the cause it was made for, and be picked up by someone I would not have chosen. Should a smith answer for that?" } },
      choices = {
        { text = "Yes. You should mind who you arm.", next = "BACK", reply = "I think so too. It is why I teach few, and slowly.", fx = { align = { honor = 1 } } },
        { text = "No. The hand that swings it answers, not yours.", next = "BACK", reply = "That is the comfortable view, and it may even be the true one. Thank you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = { { id = "y1_default", text = "The dagger. A greatsword forgives a small error, for there is so much steel to hide it in. A dagger is all edge and point, and every flaw is the whole of it." } },
      choices = {
        { text = "And the easiest?", next = "hardest_easy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest_easy = {
      lines = { { id = "y2_default", text = "A mace, which is why young smiths despise it. I make them forge twenty before they touch a blade. By the twentieth they have learned to strike true, and they no longer despise anything." } },
      choices = { { text = "Twenty maces is a patient lesson.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    grumnus = { { id = "tp_grumnus", text = "Grumnus Steelshaper is the finest armourer in Khaz Modan. His plate has turned my best work more than once, and I am glad of it." } },
    great_forge = { { id = "tp_forge", text = "It has burned for a very long time. I find that restful, in a place where so much else changes." } },
    bengus = { { id = "tp_bengus", text = "Bengus Deepforge lays the foundation. I will not take a student he has not finished with." } },
    background = { { id = "tp_bg", text = "I am a smith. I have been one longer than I usually admit, and there is little else worth telling." } },
    _none = { { id = "tp_none", text = "I cannot say. Some things are better learned in their own time." } },
  },
}

---------------------------------------------------------------------------
-- Kelv Sternhammer: warrior trainer in the Hall of Arms.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_kelv", id = TODO_NPC("Kelv Sternhammer"), name = "Kelv Sternhammer", title = "Warrior Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "stern", "fair" }, values = { "duty", "brave" },
  notices = { "class", "kit" },
  impression = {
    first = "Kelv Sternhammer drills warriors in the Hall of Arms and has never been heard to praise anyone twice. He holds a shield as if it were part of his arm and expects the same of his recruits.",
    third = "{name} met Kelv Sternhammer, a warrior trainer in the Hall of Arms in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Stand straight when ye address a drill master. Better. Now, what d'ye want?" },
    { id = "g_back", when = { metBefore = true }, text = "Ye again. Ye're still breathin', so somethin' I said must have stuck." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior. Shield arm up. Higher. There, now ye look like ye mean tae live." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Look at the state o' that gear. A warrior who neglects his kit is a corpse wi' a delay on it. See an armourer today." },
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "Yer feet are too close together. One good shove an' ye're on yer back, an' the troggs dinnae wait while ye get up." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kelv Sternhammer. Kelstrum Stonebreaker teaches them tae hit, Bilban Tosslespanner teaches them tae be quick, an' I teach them tae hold a line when everythin' in them wants tae run. Mine's the lesson they thank me for last." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief." },
        { id = "h_again2", text = "Aye. Speak." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "What does holding a line take?", next = "line" },
        { text = "You don't hand out much praise.", next = "praise" },
        { text = "A gnome warrior trainer must have surprised you.", next = "bilban" },
        { text = "Who makes the best recruits?", next = "recruits" },
        { text = "Good day, drill master.", next = "END" },
      },
    },
    line = {
      lines = { { id = "li_default", text = "Trust in the dwarf on yer left, an' nothin' else. Yer shield covers him, his covers ye, an' the moment one o' ye steps back the whole wall is a row o' dead heroes. I drill it till they can do it asleep, for that's near enough how they'll be doin' it." } },
      choices = {
        { text = "Have you seen a line break?", next = "line_break" },
        { text = "Something else.", next = "BACK" },
      },
    },
    line_break = {
      big = true,
      lines = { { id = "lb_default", text = "Once, at the gates o' Dun Modr. One lad ran, an' eleven died for it. He lived, an' he came tae me after, askin' tae be drilled again. I've never decided if I was right tae take him back." } },
      choices = {
        { text = "You were. Everyone deserves a second stand.", next = "BACK", reply = "He's a sergeant now, an' he's never stepped back since. Maybe ye're right.", fx = { align = { light = 1 } } },
        { text = "You weren't. Eleven dead is past forgiving.", next = "BACK", reply = "Their mothers would say the same. I hear them, most nights.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise = {
      lines = { { id = "pr_default", text = "No. Praise makes a recruit think he's finished learnin', an' the day he thinks that is the day before his funeral. I tell them when they've done a thing right, once, an' they remember it better for the rarity." } },
      choices = {
        { text = "Who was the last to earn it?", next = "praise_last" },
        { text = "Something else.", next = "BACK" },
      },
    },
    praise_last = {
      lines = { { id = "pl_default", text = "A human lass up from Stormwind, half my weight, who held the centre against six o' my best for the count of a hundred. I told her it was adequate. She grinned like I'd handed her a medal." } },
      choices = { { text = "From you, it was one.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    bilban = {
      lines = { { id = "bi_default", text = "He did. I laughed, an' then he put me on the floor by goin' between my knees. He fights like a ferret in a pipe, an' there's lessons in it for dwarves that think height is strength." } },
      choices = { { text = "You learned something from a gnome.", next = "BACK", reply = "I did, an' if ye repeat that in this hall I'll have ye runnin' laps till Winter Veil.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    recruits = {
      lines = { { id = "x1_default", text = "The ones who are a wee bit feared. The fearless ones break formation tae be heroes, an' I've buried enough o' those. Give me a lad who kens he can die, an' I'll make him a wall." } },
      choices = {
        { text = "And the fearless ones?", next = "recruits_fearless" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits_fearless = {
      lines = { { id = "x2_default", text = "I send them tae Kelstrum, who'll put them on the floor till they've learned some. If that doesnae take, there's always the siege brigade. They like a dwarf wi' nae sense." } },
      choices = { { text = "A place for everyone, then.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    hall_of_arms = { { id = "tp_hall", text = "Where Ironforge makes its soldiers. It's loud an' it stinks o' sweat an' ram, an' I'd have it nae other way." } },
    kelstrum = { { id = "tp_kelstrum", text = "Kelstrum Stonebreaker's the senior o' us. Hits like a rockslide. Go tae him when ye want tae learn tae end a fight." } },
    muren = { { id = "tp_muren", text = "Muren Stormpike sets the tests for the ones who think they're ready. Most find out they werenae." } },
    background = { { id = "tp_bg", text = "Thirty years in the line an' twenty teachin' it. That's all there is tae tell." } },
    _none = { { id = "tp_none", text = "No' my concern, an' likely no' yours. Back tae drill." } },
  },
}

---------------------------------------------------------------------------
-- Beldruk Doombrow: paladin trainer in the Hall of Mysteries.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_beldruk", id = TODO_NPC("Beldruk Doombrow"), name = "Beldruk Doombrow", title = "Paladin Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "grave", "kind" }, values = { "pious", "duty" },
  notices = { "class", "race" },
  impression = {
    first = "Beldruk Doombrow trains paladins in the Hall of Mysteries. His name and his eyebrows both promise thunder, and his students are surprised to find he is the gentlest of their teachers.",
    third = "{name} met Beldruk Doombrow, a paladin trainer in the Hall of Mysteries in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Light's blessin' on ye, friend. Come in from the noise an' be easy." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've come back safe, an' I'm glad of it. Sit a moment before ye tell me why." },
    { id = "g_pal", when = { class = "PALADIN" }, text = "Well met, {g:brother|sister}. Ye carry the Light well. Let's see if we can help ye carry it further." },
  },
  notice = {
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "Ye've the tiredness on ye that comes from healin' others an' forgettin' yerself. Rest is a duty too, {g:lad|lass}." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "I ken what ye are, an' I'll no' turn ye from this hall. But I'll pray for ye, an' ye'll no' stop me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Beldruk Doombrow, o' the Silver Hand. Valgar Highforge leads our order here, Brandur Ironhammer trains the hammer arm, an' I look tae the other half o' a paladin, which is the part that kneels." },
      },
      again = {
        { id = "h_again", text = "What else is on yer heart?" },
        { id = "h_again2", text = "Aye, ask. I've time for ye." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Doombrow is a grim name for a gentle dwarf.", next = "name" },
        { text = "How did dwarves come to the Light?", next = "light" },
        { text = "What's the hardest thing you teach?", next = "hard" },
        { text = "What do you make of the Scarlet Crusade?", next = "scarlet" },
        { text = "Light be with you, Beldruk.", next = "END" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "It is! My great-grandfather earned it scowlin' at trolls, an' I inherited the brow wi'out the temper. The young ones come tae their first lesson shakin', an' I've found it's a fine way tae teach them no' tae judge by a face." } },
      choices = { { text = "A lesson before the lesson.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "li_default", text = "Through the humans, in the Second War. We fought beside Lothar's knights an' saw them close wounds wi' a prayer, an' a dwarf is too practical tae ignore a thing that works. The faith came after the usefulness, I'll admit it." } },
      choices = {
        { text = "Is faith that starts that way real?", next = "light_real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_real = {
      big = true,
      lines = { { id = "lr_default", text = "I've asked myself. The human priests would say the Light doesnae mind which door ye come in by. Some o' my brothers say a dwarf's Light is only a tool wi' a prayer attached. What's yer own thought?" } },
      choices = {
        { text = "It's real. The Light judges what you do with it.", next = "BACK", reply = "Aye. That's my belief, an' I'm glad tae hear it said plain.", fx = { align = { light = 1 } } },
        { text = "It's a tool. A good one, and that's enough.", next = "BACK", reply = "There's honesty in that. I'd ask ye tae sit in the chapel a while all the same, an' see.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard = {
      lines = { { id = "ha_default", text = "Mercy. Any dwarf can be taught tae swing a hammer, an' most arrive knowin' how. Teachin' him tae lower it when the enemy has yielded, wi' his blood still up, that takes years." } },
      choices = {
        { text = "And if he can't learn it?", next = "hard_cant" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard_cant = {
      lines = { { id = "hc_default", text = "Then he's a warrior, an' a fine one, an' I send him across tae the Hall o' Arms wi' my blessin'. There's nae shame in it. The Light asks a particular thing, an' it isnae for everybody." } },
      choices = { { text = "That's a kind way to turn someone away.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    scarlet = {
      lines = { { id = "x1_default", text = "They grieve me. They were of our order once, an' they took the same vows I teach here. They kept the hammer an' the zeal an' let go o' the mercy, an' ye can see what's left." } },
      choices = {
        { text = "Could it happen to a paladin here?", next = "scarlet_here" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scarlet_here = {
      lines = { { id = "x2_default", text = "Tae any of us, aye. It starts the day ye're certain the Light agrees wi' ye about who deserves tae die. I tell my students tae be suspicious o' that feelin' above all others." } },
      choices = { { text = "That warning is worth remembering.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    hall_of_mysteries = { { id = "tp_hall", text = "Priests, paladins an' mages share it, an' the mages are the noisy ones. We put up wi' them, for they mend the lamps." } },
    valgar = { { id = "tp_valgar", text = "Valgar Highforge heads the Silver Hand in Ironforge. A harder dwarf than me, an' the order needs both sorts." } },
    rohan = { { id = "tp_rohan", text = "High Priest Rohan has forgotten more o' the Light than I'll learn. I sit in on his sermons when I can." } },
    background = { { id = "tp_bg", text = "I carried a rifle in the Second War an' a hammer ever since. The hammer's lighter on the conscience." } },
    _none = { { id = "tp_none", text = "I cannae say, friend. I'll no' pretend tae wisdom I havenae got." } },
  },
}

---------------------------------------------------------------------------
-- Olmin Burningbeard: hunter trainer in the Hall of Arms.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_olmin", id = TODO_NPC("Olmin Burningbeard"), name = "Olmin Burningbeard", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "boisterous", "proud" }, values = { "brave", "craft" },
  notices = { "class", "pet" },
  impression = {
    first = "Olmin Burningbeard teaches marksmanship to the hunters of the Hall of Arms. His red beard is singed at one side from a lifetime of flintlocks, and he can talk about powder for an hour without drawing breath.",
    third = "{name} met Olmin Burningbeard, a hunter trainer in the Hall of Arms in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Ho there! Mind where ye point that, an' come an' tell me what ye're huntin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! How many shots tae the kill this time? Be honest, I'll ken if ye're lyin'." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter! Let me see yer piece. Aye, she's fouled at the breech, when did ye last clean her?" },
    { id = "g_path", when = { questActive = TODO_QUEST("The Hunter's Path") }, text = "Ye're still under the mountain? Grif Wildheart's waitin' in Kharanos, {g:lad|lass}, an' the beasts o' Dun Morogh willnae tame themselves." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine {pet} ye've got. Keep him off tae one side when ye fire, or he'll be deaf as me by spring." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Olmin Burningbeard! Daera Brightspear teaches them tae track, Regnus teaches them tae work wi' a beast, an' I teach them tae hit what they're aimin' at, which the other two seem tae think happens by itself." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up, I've rifleman's ears." },
        { id = "h_again2", text = "Aye, go on!" },
        { id = "h_again3", text = "Aye? Louder, friend!" },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "How did the beard get burned?", next = "beard" },
        { text = "What's the secret to a clean shot?", next = "shot" },
        { text = "Where do Ironforge's hunters practise?", next = "range" },
        { text = "Rifle, or blunderbuss?", next = "piece" },
        { text = "Good hunting, Olmin.", next = "END" },
      },
    },
    beard = {
      lines = { { id = "be_default", text = "The name came first, an' I grew intae it! Every dwarf in my family has set his beard alight at least once, for we lean too close tae the pan. My grandfather did it at his own weddin'. I've done it eleven times an' I'm no' ashamed." } },
      choices = { { text = "A proud family tradition.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    shot = {
      lines = { { id = "sh_default", text = "Breathin'. Ye let half yer breath out an' squeeze in the stillness after. Everybody thinks it's the eye, but I've taught half-blind dwarves tae shoot the pip from a card. Naebody shoots straight while they're gaspin'." } },
      choices = {
        { text = "And when the beast is charging you?", next = "shot_charge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shot_charge = {
      big = true,
      lines = { { id = "sc_default", text = "Then ye breathe anyway, which is the whole lesson. I teach them tae wait till it's close enough that they cannae miss. Daera says that's reckless, an' they should shoot early an' often. Who's got the right of it?" } },
      choices = {
        { text = "You have. One sure shot beats three hopeful ones.", next = "BACK", reply = "Ha! Tell Daera. Tell her loud, she's just there.", fx = { align = { order = -1 } } },
        { text = "Daera has. Don't gamble your life on one shot.", next = "BACK", reply = "Hmph. Ye've a cautious head. It'll keep ye alive, an' bore ye stiff.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    range = {
      lines = { { id = "ra_default", text = "No' in the hall, more's the pity, since a ricochet took a chunk out o' Muren Stormpike's desk. We go out tae the slope above the gates. Bretta Goldfury has a provin' range behind her shop, an' she lets my best ones use it." } },
      choices = {
        { text = "What did Muren say about the desk?", next = "range_desk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    range_desk = {
      lines = { { id = "rd_default", text = "Very little, an' very quietly, which was worse than shoutin'. I carved him a new corner for it myself. It doesnae match, an' he's kept it that way as a reminder tae me." } },
      choices = { { text = "He sounds like a patient dwarf.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    piece = {
      lines = { { id = "x1_default", text = "Rifle, for the huntin'. A blunderbuss is a fine thing for a doorway full o' troggs, an' nae use past twenty paces. I own both, an' I've names for them, an' I'll no' tell ye what they are." } },
      choices = {
        { text = "Why not?", next = "piece_names" },
        { text = "Something else.", next = "BACK" },
      },
    },
    piece_names = {
      lines = { { id = "x2_default", text = "Because one's named for my mother an' the other for my wife, an' neither kens which is the loud one. I mean tae keep it that way." } },
      choices = { { text = "A wise silence.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    hall_of_arms = { { id = "tp_hall", text = "Warriors at one end an' hunters at the other, an' the beasts in between tae keep the peace." } },
    daera = { { id = "tp_daera", text = "Daera Brightspear's the best tracker under the mountain. She thinks I'm too loud, an' I think she's too quiet, an' the students get the middle." } },
    goldfury = { { id = "tp_goldfury", text = "Bretta Goldfury sells the only rifles I'd put in a student's hands. Her kinsman sells bows, an' we dinnae speak o' that." } },
    background = { { id = "tp_bg", text = "A Burningbeard an' a rifleman. I shot for the king's guard till my ears gave out." } },
    _none = { { id = "tp_none", text = "Nae idea, friend, an' unless I can shoot it, I've nae opinion on it either." } },
  },
}

---------------------------------------------------------------------------
-- Regnus Thundergranite: hunter trainer in the Hall of Arms; Belia's cousin.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_regnus", id = TODO_NPC("Regnus Thundergranite"), name = "Regnus Thundergranite", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "easy", "teasing" }, values = { "nature", "family" },
  notices = { "pet", "class" },
  impression = {
    first = "Regnus Thundergranite teaches hunters in the Hall of Arms with a grey wolf lying across his boots. He talks to the wolf more than to most people, and teases his cousin Belia about her boar every chance he gets.",
    third = "{name} met Regnus Thundergranite, a hunter trainer in the Hall of Arms in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Easy, he'll no' bite. He's only decidin' what he thinks o' ye, an' he's quicker at it than I am." },
    { id = "g_back", when = { metBefore = true }, text = "He remembers ye, look, his tail went. That's a better welcome than I give." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, good! Where's yer beast, an' is it fed? That's the first two things I ask anybody." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Yer {pet} keeps lookin' at ye before he moves. That's trust, an' ye cannae train it in. Ye've done well by him." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye walk quiet for somebody in boots that size. Somebody taught ye right." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Regnus Thundergranite. I teach hunters how tae fight alongside a beast, an' my cousin Belia teaches the beasts their half of it. Between us we turn out a pair that can read each other, which is the whole o' huntin'." },
      },
      again = {
        { id = "h_again", text = "What else? He's listenin' too, mind." },
        { id = "h_again2", text = "Aye, go on." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Tell me about your wolf.", next = "wolf" },
        { text = "Belia says you laugh at her boar.", next = "boar" },
        { text = "What's the first rule of hunting with a beast?", next = "rule" },
        { text = "What beast suits a new hunter?", next = "suits" },
        { text = "Good hunting, Regnus.", next = "END" },
      },
    },
    wolf = {
      lines = { { id = "wo_default", text = "I found him as a pup on the slopes above Brewnall, the winter the wendigo took his pack. He was half frozen an' he still tried tae take my hand off. I've no' named him, for he's never told me what he's called." } },
      choices = {
        { text = "No name, in all these years?", next = "wolf_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wolf_name = {
      big = true,
      lines = { { id = "wn_default", text = "None. Belia says a beast ye keep should be named an' taught its place. I say he's no' mine, he only chooses tae stay. It's the oldest argument in our family." } },
      choices = {
        { text = "You're right. A companion isn't owned.", next = "BACK", reply = "Aye. He agrees wi' ye, look at him. Smug beast.", fx = { align = { order = -1 } } },
        { text = "Belia's right. A beast needs to know its master.", next = "BACK", reply = "She'll be pleased. He's less so, he's gone tae sulk under the bench.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boar = {
      lines = { { id = "bo_default", text = "I do, an' she deserves it. It's a fine boar, I'll grant her, an' it would follow her intae a volcano. But it ate my left boot last Brewfest, an' she said the boot must have provoked it." } },
      choices = { { text = "Did the boot provoke it?", next = "BACK", reply = "It was sittin' there bein' leather. That's all the provocation a boar wants.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    rule = {
      lines = { { id = "ru_default", text = "Feed him before ye feed yerself. Every time, even when ye're starvin', even when it's the last o' the meat. A beast that kens it comes first will walk intae anythin' beside ye." } },
      choices = {
        { text = "And the second rule?", next = "rule_two" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rule_two = {
      lines = { { id = "rt_default", text = "Never send him where ye wouldnae go. If it's too dangerous for ye, it's too dangerous for him, an' he'll go anyway because ye asked. That's a debt, an' a good hunter never forgets he owes it." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    suits = {
      lines = { { id = "x1_default", text = "Whatever's nearest home. A Dun Morogh hunter should start wi' a boar or a wolf, for they ken the snow as well as ye do. Folk go off tae Stranglethorn for a tiger an' wonder why it sulks in the cold." } },
      choices = {
        { text = "Should a beast never leave its country?", next = "suits_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    suits_leave = {
      lines = { { id = "x2_default", text = "It can, if ye go slow. Take it a valley at a time an' let it learn the smells. Rush it, an' ye've a miserable animal an' a hunter who deserves one." } },
      choices = { { text = "A valley at a time. I'll remember.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    belia = { { id = "tp_belia", text = "My cousin, an' the best beast handler in Ironforge. She'd sooner talk tae a ram than tae me, an' some days I dinnae blame her." } },
    hall_of_arms = { { id = "tp_hall", text = "The warriors complain about the smell o' the beasts. The beasts have never once complained about the warriors, which tells ye who's better mannered." } },
    ulbrek = { { id = "tp_ulbrek", text = "Ulbrek Firehand stables the animals. He's gentle wi' them an' gruff wi' us, which is the right way round." } },
    background = { { id = "tp_bg", text = "A Thundergranite, raised in the high valleys. We learned tae hunt before we learned tae read, an' some of us stopped there." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask the wolf, he kens more than he lets on." } },
  },
}

---------------------------------------------------------------------------
-- Fenthwick: gnome rogue trainer in the Forlorn Cavern.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_fenthwick", id = TODO_NPC("Fenthwick"), name = "Fenthwick", title = "Rogue Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "cheery", "sly" }, values = { "cunning", "discretion" },
  notices = { "class", "race" },
  impression = {
    first = "Fenthwick trains rogues in the Forlorn Cavern for the Hidden Circle. He is the only one there who says good morning, and people who assume a cheerful gnome is harmless tend to find their purse lighter.",
    third = "{name} met Fenthwick, a gnome rogue trainer in the Forlorn Cavern of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Good morning! Or evening, it's hard to tell down here. Do come in, and keep a hand on your belt." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I'd have known your footsteps anywhere, you still favour the left." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "One of ours! Lovely. I've already had your coin purse and put it back, did you notice? No? We'll work on that." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You checked the exits when you came in, which is good, and you let me see you do it, which is not." },
    { id = "n_tall", cat = "race", when = { race = { "Human", "NightElf" } },
      text = "You tall folk never look down. It's the most useful fact I know, and I've made a career of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Fenthwick. Hulfdan Blackbeard runs things, Ormyr Flinteye teaches the knife, and I teach the part where nobody ever knows you were there. I'm told I make it look like fun, and that's because it is." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quietly, we've a reputation." },
        { id = "h_again2", text = "Yes? Go on, nobody's listening that I haven't accounted for." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "What does a gnome bring to this trade?", next = "gnome" },
        { text = "You're very cheerful for a rogue.", next = "cheer" },
        { text = "What is the Hidden Circle for?", next = "circle" },
        { text = "What's the first thing you teach?", next = "first" },
        { text = "Goodbye, Fenthwick.", next = "END" },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Size, to begin with! I fit through vents, under tables and inside a mail sack, and I have done all three in one evening. Then there's the mechanical side. A dwarf looks at a lock and sees a puzzle, and I see a small machine that wants to open." } },
      choices = {
        { text = "What's the best lock you've opened?", next = "gnome_lock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_lock = {
      lines = { { id = "gl_default", text = "A Dark Iron strongbox with three tumblers and a flame trap. It took me four hours and my left eyebrow. Inside there was a list of names, and nine of the people on it are no longer a worry to the king." } },
      choices = { { text = "An eyebrow well spent.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    cheer = {
      lines = { { id = "ch_default", text = "It's the best disguise there is. People watch the grim fellow in the corner with the hood, and they tell the smiling gnome their troubles. I haven't worn a hood in years." } },
      choices = {
        { text = "Is the cheer real, then?", next = "cheer_real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheer_real = {
      big = true,
      lines = { { id = "cr_default", text = "Do you know, it mostly is. But I've used it to walk someone to a quiet place they didn't come back from, and they trusted me the whole way. I've wondered whether a smile used like that stays a smile." } },
      choices = {
        { text = "It doesn't. That's a lie, however useful.", next = "BACK", reply = "No. I thought not. I'll keep it for honest company, when I can find some.", fx = { align = { honor = 1 } } },
        { text = "It's a tool like any other. Use what works.", next = "BACK", reply = "That's the trade's answer, and I've given it myself. It sounds odd coming back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle = {
      lines = { { id = "ci_default", text = "For the things King Magni needs done and can't be seen asking for. Dark Iron spies, mostly, and the odd senator's secret. We answer to the throne, which is more than can be said for most people with knives." } },
      choices = { { text = "Knives with a conscience.", next = "BACK", reply = "With a paymaster, at least, and a list of rules. It's nearly the same thing.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "x1_default", text = "How to stand in a room. Not hiding, just standing, so that nobody's eye stops on you. It takes a month, and most students hate it, because they came here to learn knives." } },
      choices = {
        { text = "How do you test it?", next = "first_test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_test = {
      lines = { { id = "x2_default", text = "I send them to stand in Bruuk's Corner for an evening. If Edris Barleybeard takes their order without being waved at, they've failed. She misses nothing, so very few pass first time." } },
      choices = { { text = "A barmaid as examiner. Clever.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    hulfdan = { { id = "tp_hulfdan", text = "Master Blackbeard. He hasn't smiled since the Second War, and I've a standing wager that I'll manage it before I retire." } },
    forlorn_cavern = { { id = "tp_cavern", text = "Dark, damp and full of people minding their own business. I think it's charming." } },
    tynnus = { { id = "tp_tynnus", text = "Tynnus Venomsprout supplies the unpleasant bottles. He's a dear, and I never accept a cup of tea from him." } },
    background = { { id = "tp_bg", text = "I inspected ventilation in Gnomeregan, officially. It's astonishing what you overhear in a vent." } },
    _none = { { id = "tp_none", text = "I couldn't possibly say! And if I could, I'd have to charge you for it." } },
  },
}

---------------------------------------------------------------------------
-- Nittlebur Sparkfizzle: gnome mage trainer in the Hall of Mysteries.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_nittlebur", id = TODO_NPC("Nittlebur Sparkfizzle"), name = "Nittlebur Sparkfizzle", title = "Mage Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "professorial", "distracted" }, values = { "knowledge", "order" },
  notices = { "class", "race" },
  impression = {
    first = "Nittlebur Sparkfizzle is the senior mage trainer in the Hall of Mysteries. He lectures whether or not anyone is listening and loses his spectacles on his own forehead several times a day.",
    third = "{name} met Nittlebur Sparkfizzle, a gnome mage trainer in the Hall of Mysteries in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Yes, yes, come in, and don't stand on the circle. It's chalk, and it took me all morning." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. I was in the middle of a thought about you, or possibly about soup." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A student of the arcane! Good. Tell me the third principle of conjuration, and don't look at your sleeve." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Your left cuff is singed and your right is frosted, so you've been practising both schools in one day. Admirable, and unwise." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf with an interest in magic! We get one a year, and I always hope it's the start of a trend." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Nittlebur Sparkfizzle, senior instructor. Juli Stormkettle takes the frost students, Bink and Dink take the theory, Milstaff Stormeye does portals, and I oversee the lot and correct the diagrams." },
      },
      again = {
        { id = "h_again", text = "What else? Briefly, I've a class in, oh, some number of minutes." },
        { id = "h_again2", text = "Yes? Have you seen my spectacles? Never mind, ask." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "How do gnome mages fit in a dwarven hall?", next = "hall" },
        { text = "What do new mages get wrong?", next = "wrong" },
        { text = "Your spectacles are on your forehead.", next = "specs" },
        { text = "Which school of magic is the hardest?", next = "school" },
        { text = "Good day, Instructor.", next = "END" },
      },
    },
    hall = {
      lines = { { id = "ha_default", text = "Remarkably well. The dwarves had almost no arcane tradition, so there was a great empty corner of the Hall and nobody to object. High Priest Rohan asked only that we not set fire to the pews, and we have very nearly kept to it." } },
      choices = {
        { text = "Very nearly?", next = "hall_nearly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_nearly = {
      lines = { { id = "hn_default", text = "One pew, and it was a small one. Dink rebuilt it the same afternoon, with a hinged seat for storing hymnals, and the priests have since asked for six more like it." } },
      choices = { { text = "An accident that improved the furniture.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    wrong = {
      lines = { { id = "wr_default", text = "They reach for power before precision. A fireball the size of a cart is very easy and very stupid. I make them light one candle, at twenty paces, without warming the wick beside it, and most of them hate me for a month." } },
      choices = {
        { text = "Is power ever the right answer?", next = "wrong_power" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong_power = {
      big = true,
      lines = { { id = "wp_default", text = "That is the question that sank Dalaran, some would say. The Kirin Tor believed any knowledge was worth having. I teach restraint, and the young ones tell me restraint did not save Gnomeregan either." } },
      choices = {
        { text = "Teach restraint. Power without it is a disaster.", next = "BACK", reply = "Quite so. I shall quote you in the next lecture, without attribution.", fx = { align = { order = 1 } } },
        { text = "They've a point. We'll need every spell we can get.", next = "BACK", reply = "Hm. Yes. I lie awake over that, on occasion.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    specs = {
      lines = { { id = "sp_default", text = "Are they? So they are. Thank you. I enchanted them once to chime when lost, and they chimed continuously for a week, so I took it off again." } },
      choices = { { text = "A sensible retreat.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    school = {
      lines = { { id = "x1_default", text = "Arcane, without question. Fire and frost are only borrowed from the world, and the world lends freely. The arcane is the thing itself, and it resents being handled. I have taught it sixty years and I still wear gloves." } },
      choices = {
        { text = "Gloves help?", next = "school_gloves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    school_gloves = {
      lines = { { id = "x2_default", text = "Not in the least. But they remind me to be careful, and a reminder is worth more than a ward. I recommend them to every student, and Bink is the only one who listens." } },
      choices = { { text = "A reminder you can wear.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    hall_of_mysteries = { { id = "tp_hall", text = "A fine building with excellent acoustics. One can lecture from the far end and be heard at the door, as the paladins have mentioned to me." } },
    bink = { { id = "tp_bink", text = "Bink is the most gifted theorist I've taught, and her brother Dink is the most gifted at making theory work. I try never to seat them together." } },
    gnomeregan = { { id = "tp_gnomer", text = "The Academy's library was on the sixth level. I've rewritten four of the texts from memory, and I'm fairly sure of three." } },
    background = { { id = "tp_bg", text = "I held the chair of applied conjuration. The chair itself was, regrettably, left behind." } },
    _none = { { id = "tp_none", text = "That's outside my field. I could speculate, but I'd want it in writing that I was speculating." } },
  },
}

---------------------------------------------------------------------------
-- Juli Stormkettle: gnome mage trainer in the Hall of Mysteries.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_juli", id = TODO_NPC("Juli Stormkettle"), name = "Juli Stormkettle", title = "Mage Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "brisk", "wry" }, values = { "practical", "knowledge" },
  notices = { "class", "kit" },
  impression = {
    first = "Juli Stormkettle trains mages in the Hall of Mysteries and has no patience for theory that does not survive a fight. Her students learn frost first, on the grounds that a frozen enemy gives you time to think.",
    third = "{name} met Juli Stormkettle, a gnome mage trainer in the Hall of Mysteries in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Hello. If you've come to hear a lecture, Nittlebur is over there. If you've come to learn something you'll use, stay." },
    { id = "g_back", when = { metBefore = true }, text = "You're back and unburnt. So you listened, or you were lucky, and I don't mind which." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage. Right, show me a frost nova, and then tell me which way you'd run after it." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your robe's in ribbons. Things have been getting close enough to hit you, and that's the problem we'll fix." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You stand too still when you cast. A mage is a target with a book, so keep your feet moving." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Juli Stormkettle. I teach mages how to stay alive, which the Academy never bothered with, because nothing was supposed to get into the Academy. I was there when the troggs came up through the floor, and I've taught differently ever since." },
      },
      again = {
        { id = "h_again", text = "What else? Make it useful." },
        { id = "h_again2", text = "Yes? Go on." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Why do you teach frost first?", next = "frost" },
        { text = "You were there when Gnomeregan fell.", next = "fell" },
        { text = "What do you make of Nittlebur's lectures?", next = "nittlebur" },
        { text = "What should a mage carry besides spells?", next = "carry" },
        { text = "Goodbye, Juli.", next = "END" },
      },
    },
    frost = {
      lines = { { id = "fr_default", text = "Because fire kills things and frost stops them, and a beginner needs the second far more. Freeze a trogg's feet to the floor and you've bought five seconds to remember what you were taught. Nobody remembers anything with teeth in their leg." } },
      choices = { { text = "Five seconds can be a lifetime.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    fell = {
      lines = { { id = "fe_default", text = "I held a stairwell on the fifth level with two students and a wall of ice, while the lifts ran. We got four hundred up before the radiation came. I've done the sums on how many more a better mage would have managed, and I've stopped doing them." } },
      choices = {
        { text = "Four hundred is no small number.", next = "fell_number" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fell_number = {
      big = true,
      lines = { { id = "fn_default", text = "No. The order to seal the level came while people were still on the stairs below us, and I obeyed it. I've been told it was right, and it saved the four hundred. I'm not sure being right is the same as being forgiven." } },
      choices = {
        { text = "You followed the order. Many live because of it.", next = "BACK", reply = "That's what the High Tinker says. I try to believe him on weekdays.", fx = { align = { order = 1 } } },
        { text = "Some orders shouldn't be obeyed.", next = "BACK", reply = "I've thought that too. I'd have died on those stairs for it, and saved nobody.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nittlebur = {
      lines = { { id = "ni_default", text = "They're excellent, and they go on for ever. He gives them the why and I give them the what-now. A student who's had both is worth three who've had one, though I wouldn't say it where he could hear." } },
      choices = {
        { text = "So you respect him.", next = "nittlebur_respect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nittlebur_respect = {
      lines = { { id = "nr_default", text = "Enormously. He rewrote four textbooks from memory in a refugee tent. I also hide his spectacles when he's being unbearable, so it evens out." } },
      choices = { { text = "That explains the spectacles.", next = "BACK", reply = "Some of the time. He manages the rest on his own.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    carry = {
      lines = { { id = "x1_default", text = "Water, a knife and good boots. Mana runs out, and when it does you're a small person in a dress, a long way from help. I make my students run a mile in their robes before I'll pass them." } },
      choices = {
        { text = "A mile, in robes?", next = "carry_mile" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry_mile = {
      lines = { { id = "x2_default", text = "Up the ramp to the gates and back. Nittlebur called it undignified until one of his own students outran a bear in the Wetlands. He hasn't mentioned it since." } },
      choices = { { text = "The bear settled the argument.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    hall_of_mysteries = { { id = "tp_hall", text = "Stone walls, one door and priests on hand. It's the most defensible classroom I've ever had, and I checked." } },
    gnomeregan = { { id = "tp_gnomer", text = "We'll go back. When we do, I want every mage I've trained walking in front, and walking out again after." } },
    dink = { { id = "tp_dink", text = "Dink builds things that make magic behave. If he ever opens a shop, I'll be first in the queue." } },
    background = { { id = "tp_bg", text = "I was a junior instructor at the Academy. I'm a senior one now, by subtraction." } },
    _none = { { id = "tp_none", text = "I don't know. I only teach what I've tested." } },
  },
}

---------------------------------------------------------------------------
-- Dink: gnome mage trainer in the Hall of Mysteries; Bink's brother.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_dink", id = TODO_NPC("Dink"), name = "Dink", title = "Mage Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "tinkering", "good-humoured" }, values = { "craft", "family" },
  notices = { "class", "craft" },
  impression = {
    first = "Dink trains mages in the Hall of Mysteries beside his sister Bink. Where she writes the theory, he builds little devices to prove it, and his end of the hall is full of things that hum.",
    third = "{name} met Dink, a gnome mage trainer in the Hall of Mysteries in Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Hello! Don't touch the brass one, it's holding a charge. Actually, don't touch any of them." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good, hold this for a moment. No, the other end. Thank you." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage! Excellent. Cast something small at this dial, would you? I want to see how far the needle goes." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Then you'll see what I'm doing with the coils. Bink says it's cheating, and I say it's instrumentation." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "There's a crackle about you still, so you've cast in the last hour. I've a device that can tell me which school, if you'll stand still." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Dink, and that's my sister Bink, and yes, we've heard every joke, including the one you're thinking of. She teaches why a spell works, and I teach how to make it work the same way twice." },
      },
      again = {
        { id = "h_again", text = "What else? I'm only calibrating." },
        { id = "h_again2", text = "Yes? Mind the wire by your foot." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "What are all these devices?", next = "devices" },
        { text = "What's it like, teaching beside your sister?", next = "bink" },
        { text = "The priests seem to tolerate you well.", next = "priests" },
        { text = "What's the best thing you've built here?", next = "built" },
        { text = "Goodbye, Dink.", next = "END" },
      },
    },
    devices = {
      lines = { { id = "de_default", text = "Measures, mostly. That one counts how much mana a spell uses, that one how hot a fireball burns, and the round one tells me when a portal's about to go wrong. Magic has always been taught by feel, and I think that's why mages keep exploding." } },
      choices = {
        { text = "Can magic really be measured?", next = "devices_measure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    devices_measure = {
      big = true,
      lines = { { id = "dm_default", text = "I think so! Nittlebur says some things ought to stay a mystery, and that a mage who trusts a dial stops trusting his own sense. I say a mystery is only a thing nobody has built the right gauge for yet." } },
      choices = {
        { text = "Measure it all. Ignorance never saved anyone.", next = "BACK", reply = "That's the spirit! I'll put you down for a turn on the big dial.", fx = { align = { order = -1 } } },
        { text = "Nittlebur's right. Some arts shouldn't be reduced to dials.", next = "BACK", reply = "Hm. Bink says the same, and she's usually right, which is very annoying.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bink = {
      lines = { { id = "bi_default", text = "Wonderful and maddening. She finishes my sentences, usually with a correction. We haven't been more than a room apart since we shared a cradle, and we got out of Gnomeregan holding hands, I'm not ashamed to say." } },
      choices = { { text = "She's lucky to have you, and you her.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    priests = {
      lines = { { id = "pr_default", text = "We've an arrangement. They heal our burns and we keep their lamps lit with a cantrip. I also built them a pew with a hinged seat, after an incident, and it's become rather popular." } },
      choices = {
        { text = "What sort of incident?", next = "priests_incident" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests_incident = {
      lines = { { id = "pi_default", text = "A student, a sneeze and a fire spell. Nobody was sitting on it at the time. Theodrus Frostbeard put it out with a bucket of holy water, which I measured afterwards, and it's exactly as wet as the ordinary sort." } },
      choices = { { text = "You measured the holy water.", next = "BACK", reply = "Of course! He was quite cross. I've been asked not to publish.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    built = {
      lines = { { id = "x1_default", text = "A lamp for the Hall that brightens when someone starts casting carelessly. The priests thought it was a miracle for a week. It's a coil, a crystal and a very small bell." } },
      choices = {
        { text = "Does it work on the teachers?", next = "built_teachers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    built_teachers = {
      lines = { { id = "x2_default", text = "It goes off for Nittlebur about twice a day, and he's asked me to move it. I've told him the mounting is permanent. It isn't." } },
      choices = { { text = "I won't tell him.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    bink = { { id = "tp_bink", text = "My sister, and the cleverer of us on paper. I'm the cleverer with a screwdriver, and we've agreed that's a draw." } },
    hall_of_mysteries = { { id = "tp_hall", text = "Good solid stone, which is ideal. It hardly scorches at all." } },
    gnomeregan = { { id = "tp_gnomer", text = "My workshop was on the fourth level. I've a list of what I'd save first, and I revise it most evenings." } },
    background = { { id = "tp_bg", text = "I built demonstration pieces for the Academy. Now I build them for whoever will stand still." } },
    _none = { { id = "tp_none", text = "No idea! I haven't a gauge for that one." } },
  },
}

---------------------------------------------------------------------------
-- Briarthorn: gnome warlock trainer in the Forlorn Cavern.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_briarthorn", id = TODO_NPC("Briarthorn"), name = "Briarthorn", title = "Warlock Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "clinical", "unbothered" }, values = { "knowledge", "control" },
  notices = { "class", "race" },
  impression = {
    first = "Briarthorn trains warlocks in the Forlorn Cavern, out of sight of the Hall of Mysteries. He treats demonology as a branch of engineering with unusually hostile components, and treats most people as components that have yet to prove themselves.",
    third = "{name} met Briarthorn, a gnome warlock trainer in the Forlorn Cavern of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Step inside the lamp's edge and state your business, because I don't care for visitors I can't see properly." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned with all your limbs, which is better than my last three visitors managed, so tell me what you've learned." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Ah, a practitioner, and a living one. Tell me which of your servants last disobeyed you and what you did about it, and then I'll know whether to waste my time." },
    { id = "g_vet", when = { class = "WARLOCK", minLevel = 50 }, text = "You've survived long enough to be interesting, which puts you in very small company. Sit, if you like, since I've finally something worth saying to you." },
  },
  notice = {
    { id = "n_holy", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "You disapprove, and I can see it from here. You're welcome to, though your disapproval has never yet closed a rift." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your imp's mark is fresh on your wrist. Summon less often and bind more firmly, and the mark will fade." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage from the Hall of Mysteries, slumming it. Your colleagues upstairs study the arcane as if it were a garden, and I study what eats gardens." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "He doesn't put down the soul shard he's turning in his fingers; he holds it up to the lamp and squints through it at you.",
      lines = {
        { id = "h_default", text = "I'm Briarthorn, and I teach the binding of demons here, where the priests needn't look at it. Thistleheart takes the beginners and Alexander Calder takes the humans who find their way down, while I take whoever has stopped being frightened and started being careful." },
      },
      again = {
        { id = "h_again", text = "What else? Ask it clearly, because I won't guess at what you meant." },
        { id = "h_again2", text = "Carry on, then, while the lamp has oil in it." },
        { id = "h_again3", when = { class = "WARLOCK" }, text = "You've another question, and I'd rather hear it from you than read it in your obituary." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Teach me something the trainers' books leave out.", next = "shards", when = { class = "WARLOCK" } },
        { text = "How do I banish a demon that isn't mine?", next = "banish", when = { class = "WARLOCK", minLevel = 28 } },
        { text = "I'm ready for the Inferno and the Ritual of Doom.", next = "doom", when = { class = "WARLOCK", minLevel = 50 } },
        { text = "Why would a gnome become a warlock?", next = "why" },
        { text = "How does Ironforge permit this?", next = "permit" },
        { text = "You make it sound like engineering.", next = "mistake" },
        { text = "What do you make your students practise most?", next = "practise" },
        { text = "Goodbye, Briarthorn.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "For the same reason a gnome becomes anything, which is that it was a problem nobody had solved properly. A demon is a source of power with a will of its own, so remove the will and what remains is extremely useful." } },
      choices = {
        { text = "Can you ever really remove the will?", next = "why_will" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    why_will = {
      big = true,
      lines = { { id = "ww_default", text = "No, you can only hold it down, every hour, for the rest of your life. I consider that an acceptable cost for what I can do against the Burning Legion's own, though others have told me it's a slow way of losing." } },
      choices = {
        { text = "They're right. No one holds a demon forever.", next = "BACK", reply = "Perhaps, but I've held mine for thirty years, so do tell me when your method has done better.", fx = { align = { light = 1 } } },
        { text = "It's worth it. Turn their own weapons on them.", next = "BACK", reply = "Exactly so, and you may have the makings of a competent practitioner after all.", fx = { align = { light = -1 } } },
        { text = "I'd rather not take a side on that.", next = "BACK", reply = "Then you'll have to take one the day a demon asks you, which is a worse day to decide." },
      },
    },
    permit = {
      lines = { { id = "pe_default", text = "It doesn't, officially. King Magni's people know where we are and choose not to ask, so long as we stay in the cavern and nothing gets loose, and we've kept our half of that bargain as well as he's kept his." } },
      choices = {
        { text = "Has anything ever got loose?", next = "permit_loose" },
        { text = "Do any dwarves study with you?", next = "permit_dwarves" },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    permit_loose = {
      lines = { { id = "pl_default", text = "An imp did once, as far as the Commons, where it stole a pie from a vendor called Sraaz and was back in its circle within the minute. The vendor was compensated, and the student responsible now scrubs the binding floor." } },
      choices = { { text = "A stolen pie is a mild disaster.", next = "BACK", reply = "It was a warning, and I treated it as one, because the next thing won't want pie.", fx = { trait = { cautious = 1 } } }, { text = "Back to the lessons, then.", next = "BACK" } },
    },
    permit_dwarves = {
      lines = { { id = "pd_default", text = "Not one in three years. Dwarves think a demon is something a Dark Iron keeps in his cellar, and they're so frightened of the comparison that they'd sooner leave the Legion's weapons lying in the road than pick one up, which I find unforgivably wasteful." } },
      choices = { { text = "Maybe they've seen what it costs.", next = "BACK", reply = "Everyone has seen what it costs, but only some of us have done the arithmetic." }, { text = "Something else.", next = "BACK" } },
    },
    mistake = {
      lines = { { id = "mi_default", text = "Because it is, and the commonest failure is the one engineers know best, which is growing fond of the machine. Mine has served me three decades and would eat my heart tomorrow, and I remind myself of that each morning before breakfast." } },
      choices = {
        { text = "That's a cold way to live.", next = "BACK", reply = "It's a long one, and I've noticed the warm ones tend to be brief.", fx = { trait = { stern = 1 } } },
        { text = "What's the second commonest failure?", next = "mistake2" },
      },
    },
    mistake2 = {
      lines = { { id = "mi2_default", text = "Pride in one's own binding, which I suffer from and so I watch for it twice as hard. Thistleheart would say the second failure is loneliness, and he's probably right, but I've no talent for curing that, so I leave it to him." } },
      choices = { { text = "At least you know your limits.", next = "BACK", fx = { affinity = 1 } } },
    },
    practise = {
      lines = { { id = "x1_default", text = "Dismissal, because any child can call a thing up. I have them summon and banish forty times a day, until sending it back is quicker than breathing, since the summoning is the smaller half of the art." } },
      choices = {
        { text = "Why so many times?", next = "practise_why" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    practise_why = {
      lines = { { id = "x2_default", text = "Because the day it matters, you will be bleeding and afraid, and your hands must do it without you. I have seen what happens to the ones who needed to think first." } },
      choices = { { text = "Then I'll practise the sending back.", next = "BACK", fx = { affinity = 1 } }, { text = "That's grim, but fair.", next = "BACK" } },
    },
    shards = {
      lines = {
        { id = "sd_fel", when = { pet = { family = "Felhunter" } }, text = "Your felhunter knows this already, which is why it watches your bags. A soul shard is a whole life folded small, and every demon you own is quietly hoping you'll drop one." },
        { id = "sd_default", text = "Here is something the books put politely: a soul shard is a whole life folded small, and every demon you own is quietly hoping you'll drop one. Carry what you need and not a shard more, because a full bag of them is a temptation to the demon and a weight on you." },
      },
      choices = {
        { text = "A weight on me? How so?", next = "shards2" },
        { text = "I'll travel light.", next = "BACK" },
      },
    },
    shards2 = {
      lines = { { id = "sd2_default", text = "You'll dream about whoever they were, if you keep enough of them long enough. I've measured it, and past a certain number the dreams begin, so I keep below that number and I'd advise you to find your own." } },
      choices = {
        { text = "What's your number?", next = "BACK", reply = "Mine is mine, and yours will differ, so don't borrow it." },
        { text = "Better not to dwell on that.", next = "BACK" },
      },
    },
    banish = {
      lines = { { id = "bn_default", text = "You've the Banishment now, so you can push a demon or an elemental half out of the world and hold it there. It doesn't care whose demon it is, which is a thing to remember on the day a colleague's servant slips its leash, and an even better thing to remember about your own." } },
      choices = {
        { text = "You'd banish another warlock's demon?", next = "banish2" },
        { text = "I'll keep that in mind.", next = "BACK" },
      },
    },
    banish2 = {
      big = true,
      lines = { { id = "bn2_default", text = "Without asking first, and I'd expect the same courtesy back. Some of my colleagues call that a breach of manners between practitioners, so tell me which side of it you stand on." } },
      choices = {
        { text = "A loose demon is everyone's business. Banish it.", next = "BACK", reply = "Good, and if it's ever mine, don't hesitate.", fx = { align = { order = 1 } } },
        { text = "A warlock's servants are his own affair.", next = "BACK", reply = "Then I hope you never have to watch one eat somebody while you wait to be asked.", fx = { align = { order = -1 } } },
      },
    },
    doom = {
      lines = { { id = "dm_default", text = "Then you'll learn to call down an infernal, which is a burning stone with a demon inside it, and to work the Ritual of Doom with others of the craft. The infernal will turn on you once its binding wears off, and the doomguard demands a life before it will serve, so neither is a toy, and both are exactly what the Legion threw at Hyjal." } },
      choices = {
        { text = "A life? Whose?", next = "doom2" },
        { text = "Train me, then.", next = "BUSINESS" },
      },
    },
    doom2 = {
      lines = { { id = "dm2_default", text = "One of the warlocks in the ritual, unless you're very lucky, and the ritual doesn't care which. I've done it twice and lost a colleague once, and I chose to go on teaching it, so think hard before you stand in that circle with people you're fond of." } },
      choices = {
        { text = "Then I'll choose my circle carefully.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "You lost a colleague and carried on?", next = "BACK", reply = "I did, because the Legion didn't stop for my grief, and I've no intention of stopping for it either.", fx = { trait = { stern = 1 } } },
      },
    },
  },
  topics = {
    forlorn_cavern = { { id = "tp_cavern", text = "It's suitably out of the way, though the damp is bad for parchment, and I've complained to nobody, since there's nobody to complain to." } },
    thistleheart = { { id = "tp_thistle", text = "Thistleheart is soft on the new ones, and they survive his lessons, so I make no objection." } },
    burning_legion = { { id = "tp_legion", text = "The Legion is the reason for all of this. Everything I teach was learned from the enemy, and I intend to return it with interest." } },
    background = { { id = "tp_bg", text = "I studied containment in Gnomeregan. The subject of the containment has changed, but the principles haven't." } },
    _none = { { id = "tp_none", text = "That's irrelevant to my work, so ask somebody with more idle hours than I have." } },
  },
}

---------------------------------------------------------------------------
-- Thistleheart: gnome warlock trainer in the Forlorn Cavern.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_thistleheart", id = TODO_NPC("Thistleheart"), name = "Thistleheart", title = "Warlock Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "mild", "watchful" }, values = { "care", "knowledge" },
  notices = { "class", "greenness" },
  impression = {
    first = "Thistleheart trains the newest warlocks in the Forlorn Cavern. He is mild and attentive, and spends as much time asking his students how they are sleeping as teaching them to summon.",
    third = "{name} met Thistleheart, a gnome warlock trainer in the Forlorn Cavern of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Hello there, come in, and don't mind the smell of sulphur, because it's only chalk and nerves." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! How have you been sleeping? I ask everyone, and it isn't an idle question." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "You're one of ours, so sit down a moment before we start. Has there been any whispering when you're alone? You can be honest with me." },
    { id = "g_taint", when = { class = "WARLOCK", taint = { min = 50 } }, text = "Oh, my dear, come and sit by the lamp. You've the look of someone who's been listening to the wrong voice for a while, and we'd best talk before we train." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { class = "WARLOCK", maxLevel = 20 },
      text = "You're new to it, I can tell, because your hands shake when you hold the shard. That's the right reaction, and I'd worry if they didn't." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK", pet = { family = "Voidwalker" } },
      text = "You've dark under your eyes, and that'll be the voidwalker, which takes it out of one at first. Eat something before you summon again." },
    { id = "n_holy", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "You're very welcome down here, truly, and if you've come to pray over my students, I'd only ask that you pray quietly, because some of them startle." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "He pulls a second stool out from under the bench with his foot before you've said a word.",
      lines = {
        { id = "h_default", text = "I'm Thistleheart. I take the students who've only just found out what they are, and I get them through the first year without losing themselves, and after that Briarthorn teaches them the craft. My part is making sure there's still a person left to teach." },
      },
      again = {
        { id = "h_again", text = "What else would you like to ask? There's tea in the pot if you want it." },
        { id = "h_again2", text = "Go on, there's no hurry down here." },
        { id = "h_again3", when = { class = "WARLOCK" }, text = "Is there more on your mind? Half of what I teach happens in the questions students nearly don't ask." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Something whispers to me when I'm alone.", next = "whisper", when = { class = "WARLOCK" } },
        { text = "My voidwalker leaves me exhausted.", next = "void", when = { class = "WARLOCK", minLevel = 10 } },
        { text = "How does someone find out they're a warlock?", next = "find" },
        { text = "What happens to those who lose themselves?", next = "lose" },
        { text = "You're gentler than your trade suggests.", next = "gentle" },
        { text = "How do the priests upstairs treat your students?", next = "priests" },
        { text = "Goodbye, Thistleheart.", next = "END" },
      },
    },
    find = {
      lines = { { id = "fi_default", text = "Usually something answers them. A child is angry or afraid and wishes hard, and a small voice says yes, and most are too frightened to tell anyone, so they come to me years later having taught themselves badly out of stolen books." } },
      choices = {
        { text = "Is that how it was for you?", next = "find_you" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    find_you = {
      lines = { { id = "fy_default", text = "It was. I was nine, and I told my teacher, and she didn't report me; she found someone who could show me how to say no to it. I've tried to be that for whoever comes down these steps." } },
      choices = {
        { text = "She did right by you.", next = "BACK", fx = { affinity = 1 } },
        { text = "And after the fall, there were more of them?", next = "find_fall" },
      },
    },
    find_fall = {
      lines = { { id = "ff_default", text = "Far more. Grief is very loud, and the voices that answer grief are patient, so I had twenty refugees on my stair the first winter in Tinker Town, and most of them younger than you'd think. The dwarves don't have the same trouble, or if they do, they bury it under ale and never come down here." } },
      choices = { { text = "Twenty is a great many to save.", next = "BACK", reply = "I didn't save all of them, but I knew all their names, and I still do.", fx = { trait = { kind = 1 } } } },
    },
    lose = {
      big = true,
      lines = { { id = "lo_default", text = "They stop asking whether a thing is right and ask only whether it works, and after that the demon needn't do anything at all. I've had two students go that way, and Briarthorn and I had to decide what was owed to the city." } },
      choices = {
        { text = "The city comes first. You did what you had to.", next = "BACK", reply = "We did, and it's kind of you not to ask what, exactly.", fx = { align = { order = 1 } } },
        { text = "A teacher never gives up on a student.", next = "BACK", reply = "I didn't want to, and I think of them both every time a new one walks in.", fx = { align = { order = -1 } } },
        { text = "I'd rather not hear the rest of that.", next = "BACK", reply = "No, and I'd rather not tell it, so we're agreed." },
      },
    },
    gentle = {
      lines = { { id = "ge_default", text = "It's the only way that works. Frighten a young warlock and they hide what they're doing, and a hidden warlock is the dangerous kind, so I'd sooner they came to me at midnight to say an imp had told them something clever." } },
      choices = {
        { text = "What do imps say that's clever?", next = "gentle_imps" },
        { text = "Briarthorn doesn't seem the gentle sort.", next = "gentle_briar" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    gentle_imps = {
      lines = {
        { id = "gi_imp", when = { pet = { family = "Imp" } }, text = "That you're special, and that nobody else understands you, and I'd wager yours has tried it already. It's the same thing every time, and it works every time, because everyone is nine years old somewhere inside." },
        { id = "gi_default", text = "That you're special, and that nobody else understands you. It's the same thing every time, and it works every time, because everyone is nine years old somewhere inside." },
      },
      choices = { { text = "I'll remember that, if one starts flattering me.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    gentle_briar = {
      lines = { { id = "gb_default", text = "He isn't, and he'd be offended if you said he was. But he's never once lost control, and he's never once turned away a student of mine who came to him scared, so I think we make a fair pair between us." } },
      choices = { { text = "A fair pair. Back to my questions.", next = "BACK" } },
    },
    whisper = {
      narr = "He sets down the teapot very gently, as if a louder sound might frighten something off.",
      lines = {
        { id = "wh_taint", when = { taint = { min = 40 } }, text = "Thank you for telling me, because most don't until it's late. It's been talking to you for a while, hasn't it, and it's begun to sound like your own thoughts?" },
        { id = "wh_default", text = "Thank you for telling me, because most don't until it's late. Is it saying things you'd think anyway, or things you'd never think on your own?" },
      },
      choices = {
        { text = "Things I'd think anyway. That's what frightens me.", next = "whisper2" },
        { text = "Things I'd never think. Cruel things.", next = "whisper3" },
        { text = "It's nothing. Forget I said it.", next = "BACK", reply = "I won't forget it, but I won't press you either, and the stool will be here." },
      },
    },
    whisper2 = {
      lines = { { id = "wh2_default", text = "That's the more dangerous kind, and the commoner one, because it's only borrowing your voice. Say each thought aloud before you act on it, here or to anyone you trust, and you'll hear which ones aren't yours." } },
      choices = { { text = "Aloud. I'll try that.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    whisper3 = {
      lines = { { id = "wh3_default", text = "Then it's still outside you, which is good news, though it won't feel like it. Sleep with a lamp lit and your shards in another room, and come back in a week and tell me whether it's quieter." } },
      choices = { { text = "Thank you, Thistleheart.", next = "BACK", fx = { affinity = 1 } } },
    },
    void = {
      lines = { { id = "vd_default", text = "Everyone says so at first. A voidwalker doesn't steal your strength, but holding it in this world is like holding a door shut against a draught all day, and your body notices before your mind does." } },
      choices = {
        { text = "Does it get easier?", next = "void2" },
        { text = "I'll eat more, then.", next = "BACK", reply = "Do, and sleep more, which my students always think is the less important half." },
      },
    },
    void2 = {
      lines = { { id = "vd2_default", text = "By the time Gakin calls you back to Stormwind for the succubus, you'll hardly notice it. The succubus is tiring in a different way, I'm afraid, and you'd best come and see me before you bind her." } },
      choices = { { text = "I'll come back before then.", next = "BACK", fx = { affinity = 1 } } },
    },
    priests = {
      lines = { { id = "x1_default", text = "Better than you'd expect. Braenna Flintcrag comes down once a month with bread and asks no questions, because she says a soul that's being fought over deserves at least a hot meal." } },
      choices = {
        { text = "Do the students accept it?", next = "priests_accept" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests_accept = {
      lines = { { id = "x2_default", text = "Warily, the first time, but by the third month they're waiting at the stair for her. I think it does more good than half my lessons, and I've told her so." } },
      choices = { { text = "A small kindness goes a long way down here.", next = "BACK", fx = { affinity = 1 } }, { text = "Back to the lessons, then.", next = "BACK" } },
    },
  },
  topics = {
    briarthorn = { { id = "tp_briar", text = "Briarthorn is cold and exact and has never lost control once. I'm glad he's on our side, and I make sure the students meet me first." } },
    forlorn_cavern = { { id = "tp_cavern", text = "It's a lonely corner, and that suits the lesson, because nobody should learn this where it's comfortable." } },
    jubahl = { { id = "tp_jubahl", text = "Jubahl Corpseseeker handles the demons themselves. He's a human from Stormwind, and he knows their natures better than they'd like." } },
    background = { { id = "tp_bg", text = "I was a schoolteacher before any of this came out, and in most ways I still am." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. I try not to pretend to answers down here." } },
  },
}

---------------------------------------------------------------------------
-- Jubahl Corpseseeker: human demon trainer in the Forlorn Cavern.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_jubahl", id = TODO_NPC("Jubahl Corpseseeker"), name = "Jubahl Corpseseeker", title = "Demon Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "sardonic", "weary" }, values = { "knowledge", "survival" },
  notices = { "class", "race" },
  impression = {
    first = "Jubahl Corpseseeker is a human among the gnome warlocks of the Forlorn Cavern, where he teaches bound demons their tricks and sells the grimoires for it. He left Stormwind in a hurry and does not discuss why.",
    third = "{name} met Jubahl Corpseseeker, the demon trainer in the Forlorn Cavern of Ironforge.",
  },
  greetings = {
    { id = "g_hi", text = "Well, a visitor. Keep your voice down and your hands where the imp can see them, he startles." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Either you like the company or you need a grimoire, and nobody likes the company." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A warlock, good. Which of your servants is testing its chains? It's always one of them." },
    { id = "g_succ", when = { class = "WARLOCK", pet = { family = "Succubus" } }, text = "Ah, you've brought her along. Tell her to stop smiling at me, would you, because I've watched better men than me fall for that look." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Stormwind, by your accent. If anyone at the Slaughtered Lamb asks after me, you never met me, and I'd take that kindly." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Your imp's been talking back, I'd wager, because they do once they've sized you up. I've a book for that." },
    { id = "n_holy", cat = "class", when = { class = "PALADIN" },
      text = "A paladin in the Forlorn Cavern. Whatever you've heard about me, it's probably true, and I'd still rather you didn't smite the stock." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jubahl Corpseseeker. The gnomes teach the warlock and I teach the demon, because a servant knows a handful of tricks when you bind it, and the rest it learns from grimoires, which I happen to sell." },
        { id = "h_vet", when = { class = "WARLOCK", minLevel = 60 }, text = "You've gone as far as the gnomes can take you, by the look of you, which leaves the sort of business I don't advertise. Sit down, and mind the candle." },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere to be, as you can see." },
        { id = "h_again2", text = "Go on, then, before the imp gets bored and starts on the bookshelf." },
        { id = "h_again3", when = { class = "WARLOCK" }, text = "Something else on your mind? Ask it before your servant does, because theirs are never as polite." },
      },
      choices = {
        { text = "Show me your grimoires.", next = "BUSINESS" },
        { text = "I want a steed worthy of the craft.", next = "dread", when = { class = "WARLOCK", minLevel = 60 } },
        { text = "My succubus is getting harder to manage.", next = "succ", when = { class = "WARLOCK", minLevel = 20 } },
        { text = "What's a human doing down here among gnomes?", next = "human" },
        { text = "Which demon is the hardest to teach?", next = "hardest" },
        { text = "Corpseseeker is quite a name.", next = "name" },
        { text = "How does one teach a demon anything?", next = "teach" },
        { text = "Farewell, Jubahl.", next = "END" },
      },
    },
    human = {
      lines = { { id = "hu_default", text = "I'm staying out of Stormwind. There was a disagreement in the cellar of a certain tavern about who owned a certain book, and I thought it wise to be under a mountain for a few years, and the gnomes asked no questions, so I answer to them now." } },
      choices = {
        { text = "Who did own the book?", next = "human_book" },
        { text = "Let's leave that buried.", next = "BACK" },
      },
    },
    human_book = {
      big = true,
      narr = "He glances at a locked chest under the counter, then makes a point of looking anywhere else.",
      lines = { { id = "hb_default", text = "Not me, strictly, but the man who did was going to use it on something far too large for him, with half the Mage Quarter above his head. So I took it, and I've been called a thief ever since." } },
      choices = {
        { text = "You stopped a disaster. That's no theft.", next = "BACK", reply = "That's my version, and it's nice to hear someone else tell it.", fx = { align = { honor = -1 } } },
        { text = "Good reasons don't make it yours.", next = "BACK", reply = "No, they don't, but I've still got it, and the Mage Quarter's still standing.", fx = { align = { honor = 1 } } },
        { text = "What's in the book?", next = "BACK", reply = "Nothing you'd want, and nothing I'll show you, so let's call that a kindness." },
      },
    },
    hardest = {
      lines = { { id = "ha_default", text = "The succubus, by a long way. An imp wants to hurt you and a voidwalker wants to be left alone, and you can work with either, but a succubus wants you to like her, and she's very good at it." } },
      choices = {
        { text = "And the easiest?", next = "hardest_easy" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hardest_easy = {
      lines = { { id = "he_default", text = "The felhunter, because it's hungry and honest about it. Feed it other people's magic and it's as loyal as a dog, and I'd take ten of them over one imp with opinions." } },
      choices = { { text = "A demon you can almost trust.", next = "BACK", reply = "Almost is the word that keeps you alive.", fx = { trait = { cautious = 1 } } }, { text = "Back to the rest of it.", next = "BACK" } },
    },
    name = {
      lines = { { id = "na_default", text = "It's the one I was born with, if you'll believe it, because my grandfather dug graves in Lordaeron. With a name like that I was never going to be a baker, though I did think about it." } },
      choices = { { text = "Corpseseeker's Fine Breads has a ring to it.", next = "BACK", reply = "Don't, because I've drawn that sign in my head a hundred times.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    teach = {
      lines = { { id = "x1_default", text = "You don't, strictly. The grimoire holds the trick and the warlock's will presses it in, which is a bit like teaching a dog by reading it the instructions very, very firmly." } },
      choices = {
        { text = "Do they resent learning?", next = "teach_resent" },
        { text = "Odd sort of schooling. Something else.", next = "BACK" },
      },
    },
    teach_resent = {
      lines = { { id = "x2_default", text = "The imp complains for a week and then pretends it knew all along, and the voidwalker doesn't seem to notice. I've grown almost fond of the complaining, which Briarthorn tells me is a warning sign." } },
      choices = { { text = "He may have a point.", next = "BACK", fx = { affinity = 1 } }, { text = "Fondness can't hurt that much.", next = "BACK", reply = "Say that again in ten years, if you're still in a position to say anything." } },
    },
    succ = {
      lines = { { id = "sc_default", text = "Of course she is, because you've started explaining yourself to her. She can't disobey a plain order, so she works on making you give vaguer ones, and she's patient about it." } },
      choices = {
        { text = "How do I stop it?", next = "succ2" },
        { text = "I hadn't noticed I was doing that.", next = "succ2", reply = "Nobody does, which is the whole of her art." },
      },
    },
    succ2 = {
      lines = { { id = "sc2_default", text = "Short orders, no reasons, and never ask her opinion, even as a joke. Lago Blackwrench makes his students write their orders down and read them back at night, and I laughed at him once, and then I tried it." } },
      choices = { { text = "Short orders, then. Thank you.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    dread = {
      lines = { { id = "dr_default", text = "Then you're past the Felsteed and you want a Dreadsteed, which isn't taught; it's taken. Go to the Burning Steppes and find Mor'zul Bloodbringer, a human warlock who camps west of the Altar of Storms and has spent years working out where such a creature might be had." } },
      choices = {
        { text = "Taken from where?", next = "dread2" },
        { text = "Mor'zul Bloodbringer. I'll find him.", next = "BACK" },
      },
    },
    dread2 = {
      lines = { { id = "dr2_default", text = "From a demon lord of the Nether, by way of a ritual in the ruins of Dire Maul, and you'll want friends you trust with you, because you'll be standing in a circle while things try very hard to break it. Mor'zul will explain the rest, at great length, and his imp Gorzeeki will interrupt him throughout." } },
      choices = {
        { text = "That sounds worth the trouble.", next = "BACK", reply = "It is, and the look on a paladin's face when you ride past is worth a fair bit too." },
        { text = "I'll gather my friends first.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },
  topics = {
    forlorn_cavern = { { id = "tp_cavern", text = "It's dark and wet, and nobody from Stormwind ever comes here, which makes it perfect." } },
    gnomes = { { id = "tp_gnomes", text = "They treat demonology like plumbing, which is the sanest approach I've met, and I've met a few." } },
    stormwind = { { id = "tp_stormwind", text = "It's a fine city. I miss the sun and the bread, and not much else." } },
    morzul = { { id = "tp_morzul", text = "Mor'zul Bloodbringer is in the Burning Steppes, chasing the Dreadsteed. He's brilliant and a little cracked, which is how most of us end up if we live long enough." } },
    background = { { id = "tp_bg", text = "I'm a warlock from a long line of gravediggers. We've always worked near the dead, one way or another." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, because I keep my nose out of anything that doesn't have horns." } },
  },
}
