-- Kharanos's shopkeepers and Anvilmar's armor merchant: the people who outfit Dun Morogh's new adventurers.
-- Voices: bibles/kharanos_shops.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC = P.TODO_NPC

-- Kreg Bilmn: general supplies in Kharanos; plain-spoken, knows every traveler on the road.
P:NPC {
  key = "dm_kreg", id = TODO_NPC("Kreg Bilmn"), name = "Kreg Bilmn",
  bible = "bibles/kharanos_shops.md", role = "vendor", tier = "service",
  communities = { "kharanos" }, temper = { "steady" }, values = { "practical", "honest" },
  notices = { "weary" },

  impression = {
    first = "Kreg Bilmn sells general supplies in Kharanos and has watched every new adventurer in Dun Morogh pass his counter. He gives plain advice whether you ask for it or not.",
    third = "{name} met Kreg Bilmn, who sells general supplies in Kharanos.",
  },

  greetings = {
    { id = "g_default", text = "Bread, water an' bags, an' a word o' warnin' for free, if ye want it." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, I see. That's more than I'd have bet on, the first time ye came in." },
  },

  notice = {
    { id = "n_cold", cat = "weary", when = { deaths = { min = 3 } },
      text = "Ye've the look o' someone who's been knocked down more than once out there. Buy some bread an' sit by the fire a while before ye go back." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "More than the old folk like, an' fewer than the young ones claim. Every year there's a lad or lass who's been listenin' at the rocks since they were wee, an' now Teo Hammerstorm's tellin' them it isnae daft after all. It's their grandparents who come in here complainin'." } },
      choices = {
        { text = "The grandparents deserve patience. Change is hard on old dwarves.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The grandparents had their turn. The young can choose now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That they're big an' hungry an' they come down when the snow's deep, an' a bear form won't make ye bigger than one. Go in pairs, keep a fire, an' don't follow one intae its cave." } },
      choices = {
        { text = "Good advice. I'll heed it and travel carefully.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll follow where the trail leads. That's a druid's way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A spare waterskin an' a good blanket, for the Frostmane don't kill half as many recruits as the cold does. Ye'll laugh now, but come back an' tell me that after a night in the snow above Brewnall." } },
      choices = {
        { text = "I'll buy the blanket and take your advice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The cold's never killed me yet. I'll chance it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The wendigo in the high caves, for they're bigger than they look an' meaner than that, an' the bears up near Shimmer Ridge. The boars an' wolves are fine for practice, but a hunter who goes after the wendigo too young comes back carried." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Yer {pet} looks like it could take a boar, but mind it near the wendigo, for they've a cold bite." },
      },
      choices = {
        { text = "I'll wait until I'm ready for the wendigo.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take on the wendigo now and learn quickly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Now an' then, an' usually the young ones who think a shopkeeper doesnae notice. I've kept this shop through the Second War an' the troll raids, so a cutpurse doesnae frighten me much." } },
      choices = {
        { text = "I'll pay my way, Kreg. You've earned that respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every shopkeeper says that until the till is empty.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because most o' them stay in the city, where the trainin' is, an' the rest go straight on tae Stormwind. Out here we've troll raids an' troggs, an' folk havenae much patience for anythin' that might make it worse." } },
      choices = {
        { text = "Then I'll show them I make things better, not worse.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Their patience isn't my concern. Results are.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Most o' them, sooner or later, for the wolves an' the troggs don't care how new ye are. I sell them linen an' send them tae Belm's for a hot meal, an' I tell them tae go easy, though they never listen." } },
      choices = {
        { text = "I'll keep an eye on them. The young ones need guarding.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them freeze a bit. Dun Morogh teaches quick.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me see what you have, Kreg.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That the high snows aren't a game, an' the wendigos don't care how brave ye are. I've buried more than one bold lad who thought he could take on the whole mountain alone, an' I'd like tae bury fewer." } },
      choices = {
        { text = "Courage means knowing when to stand together. I'll tell them so.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some lessons can't be taught. They have to be lived.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Thanks, Kreg.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Thread, a bag that doesnae leak an' a warm cloak, for conjured bread willnae keep the cold off up past Kharanos. I've watched gnome mages come down from Coldridge in robes thin as paper, an' I've sold every one o' them a cloak by the time they reach the lake." },
      },
      choices = {
        { text = "Sound advice. I'll take a cloak.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little fire keeps me warm enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in Kharanos! Ye'll want bandages, I'd guess, for yer prayers won't last the whole road tae Ironforge, an' I've seen priests try." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll want rations an' a whetstone, an' maybe a stern word for the recruits, for they'll listen tae a paladin before they'll listen tae me." },
        { id = "h_default", key = true,
          text = "Kreg Bilmn, general supplies, an' I've kept this shop in Kharanos since before most o' the new recruits were born. Whatever ye forgot tae bring from Anvilmar, I've likely got it." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "Kreg Bilmn, general supplies, an' welcome tae Kharanos, wee one. Yer people have been comin' through here since the city fell, an' I've learned tae stock things a gnome likes, like spare bolts an' very small boots." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I know every face on the Kharanos road, an' I know when one o' them's countin' my shelves. Buy what ye need, an' we'll get on fine." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in Kharanos is a rare thing, an' I'll tell ye now the recruits will stare. Ignore them, an' they'll get bored soon enough." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Ye'll want rations an' a whetstone, an' ye'll want them before ye go up intae the high snows." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? I've shot an' arrows on the back shelf, an' meat for yer beast if ye've one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in Kharanos. Ye'll need less from me than most, I expect, but here's advice for free: the wendigo up the hills don't care what shape ye're in." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Ye'll be after water an' bread, I'd guess, except ye can make yer own, so what is it ye're really here for?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Ye'll be wantin' somethin' tae carry yer totems in, I expect. I've sacks, but I've never been asked tae make one holy." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've a crate tae unpack." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "What's the warning you mentioned?", next = "warn" },
        { text = "What's Kharanos like?", next = "town" },
        { text = "Do you see many gnomes come through?", next = "gnomes" },
        { text = "Do travellers often try to rob you, Kreg?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why are warlocks so rare out here in Kharanos?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What's the most useful thing a warrior can buy here?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Which beasts should a hunter watch for in Dun Morogh?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do many of the young recruits come back hurt, Kreg?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do the recruits need to hear, Kreg?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What should a druid know about the wendigo?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What would a mage need from your store, Kreg?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Are many Dun Morogh dwarves taking the shaman's path, Kreg?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thanks, Kreg.", next = "END" },
      },
    },

    warn = {
      lines = {
        { id = "wa_default", text = "Stay off Shimmer Ridge till ye're stronger, for the Frostmane trolls up there don't take kindly tae visitors. An' don't go near the Gnomeregan road, for there are troggs an' worse along it now." },
      },
      choices = {
        { text = "What's worse than troggs?", next = "warn_worse" },
        { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },
    warn_worse = {
      lines = {
        { id = "ww_default", text = "Gnomes that didnae get out in time, an' the poison got intae them. They're no' right in the head anymore, poor things, an' they'll attack anyone who comes near." },
      },
      choices = {
        { text = "They deserve pity, not a blade.", next = "BACK", fx = { align = { light = 1 }, learn = { "gnomeregan" } } },
        { text = "If they attack, they're enemies. Simple as that.", next = "BACK", fx = { align = { light = -1 }, learn = { "gnomeregan" } } },
      },
    },

    town = {
      lines = {
        { id = "to_default", text = "Quiet, mostly, an' warm, if ye stay near the inn. The Thunderbrew Distillery's just across the way, an' that's what most folk come for, though they leave wi' a sore head." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    gnomes = {
      lines = {
        { id = "gn_default", text = "Every week, still, for Kharanos is the first proper town on the road from Gnomeregan. Some o' them stay, an' some go on tae Ironforge, an' a few go back out tae try their luck in the ruins." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've kept shop in Kharanos my whole life, an' my father before me, an' I've never once seen the snow melt." } },
    advice = { { id = "tp_ad", text = "Carry more bread than ye think ye need. The cold makes ye hungry." } },
    scourge = { { id = "tp_scourge", text = "I've sold rope an' rations tae more than one adventurer bound fer the Plaguelands, an' only a few o' them came back fer more. Pack extra bandages an' dinnae go alone." } },
    booty_bay = { { id = "tp_booty_bay", text = "I've a crate o' Booty Bay rum on the back shelf that nobody's touched in a year, an' I'm no' surprised. It tastes like a pirate's boot." } },
    thandol_span = { { id = "tp_thandol_span", text = "The Span's down, so all my Wetlands goods come by boat now, an' they're late an' dear. Blame the Dark Irons, an' then blame the boatmen." } },
    _none = { { id = "tp_none", text = "Couldnae say, friend, but Innkeeper Belm across the way hears every rumor in Dun Morogh." } },
  },
}

-- Grawn Thromwyn: weaponsmith in Kharanos; proud of honest steel.
P:NPC {
  key = "dm_grawn", id = TODO_NPC("Grawn Thromwyn"), name = "Grawn Thromwyn",
  bible = "bibles/kharanos_shops.md", role = "blacksmith", tier = "service",
  communities = { "kharanos" }, temper = { "gruff" }, values = { "proud", "practical" },
  notices = { "kit" },

  impression = {
    first = "Grawn Thromwyn makes and sells weapons in Kharanos and takes each sale as a promise that the blade will hold. He has little patience for decoration and a great deal for good steel.",
    third = "{name} met Grawn Thromwyn, a weaponsmith in Kharanos.",
  },

  greetings = {
    { id = "g_default", text = "Need somethin' with an edge? Ye've come tae the right forge." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. How's that blade holdin' up?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That gear's half fallin' apart, an' I'll wager yer weapon's no' much better. Get it seen tae before ye go back out." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A mace or an axe, somethin' honest wi' weight behind it. The orcs used tae carry great carved staves, but a dwarf doesnae walk about wavin' a stick when he could carry a hammer. I'll take back any that breaks in an honest fight, same as always, though I'll want tae know if the lightnin' broke it." } },
      choices = {
        { text = "An honest hammer, Grawn. I'll fight fair with it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever kills quickest. Fairness is a luxury.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "No, for both do the same work, an' both should be kept sharp. But a blade ye can hand tae yer bairns when ye're done, an' that's worth somethin'." } },
      choices = {
        { text = "A weapon's worth is in the hand that holds it.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Any weapon that wins is a good one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Any of them, if the arm behind it's steady, but I'd give ye the broad axe, for trolls are tall an' a good axe reaches up as well as across. I'll take back any that breaks in an honest fight, as I said, an' I've no' taken one back yet." } },
      choices = {
        { text = "An honest fight is the only kind I'll give it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll use it however wins the day, honest or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Somethin' short an' heavy, for when the bear's on top o' ye there's no room tae swing anythin' long. A hunter's blade gets used less than a warrior's, but it gets used when it matters most." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' yer {pet} would keep the bear off ye long enough tae draw it, I'd hope, which is what a good beast is for." },
      },
      choices = {
        { text = "I'll keep it sharp and use it only when I must.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I like a bear close. I'll use the blade often.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd refuse tae sell it tae a cutthroat, an' I'd know one if I saw one. Ye look like ye've a reason for yer trade, so I'll trust ye this once, an' I'll hear about it if I'm wrong." } },
      choices = {
        { text = "My blades are for the troggs and the trolls.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A dagger doesn't care whose back it's in, Grawn.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only the clever ones, for a mage wi' a dagger can still fight when the mana's gone. I've seen a gnome mage hold off a trogg wi' a carvin' knife after his spells ran dry, an' that's no' a sight ye forget." } },
      choices = {
        { text = "A good mage prepares for every fight. I'll buy one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If I need a blade, I've already lost the fight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I forge them honest, an' that's all the blessin' I know how tae give. If ye want a priest tae say somethin' over it after, I'll no' stop ye, but I'll tell ye now the steel's the same either way." } },
      choices = {
        { text = "A blessing adds something steel alone can't, Grawn.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Honest steel is enough. A mace doesn't need prayers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me see your weapons.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd want tae know what ye mean by unfair, for a troll stabbin' ye in the back is unfair, but it's no' the hammer's fault. If it broke because ye swung it at a stone wall, though, ye'll be buyin' another." } },
      choices = {
        { text = "A fair fight is the only kind worth having, Grawn.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "There's no such thing as a fair fight. Only won ones.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Grawn.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Somethin' does, a dark bloom on the blade like rust that isnae rust, an' I've seen it twice now after a warlock came tae the counter. Maybe it's my eyes gettin' old, but I'll no' sell a blade wi' a flaw in it, whatever caused it." },
      },
      choices = {
        { text = "I'll keep it back from your steel.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your eyes are getting old, Grawn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest buyin' a blade? I'll sell ye a mace, then, for that's what yer sort carry, an' I make a mace that won't break on a trogg's skull." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll want a hammer, then, an' I've a few that'll do the Light proud, though I'd say they do Grawn Thromwyn proud first." },
        { id = "h_default", key = true,
          text = "Grawn Thromwyn, weaponsmith. Every blade in this shop was made tae be used, no' hung on a wall, an' I'll take back any that breaks in an honest fight." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "Grawn Thromwyn, weaponsmith, an' ye're a warrior by the way ye walk. I've axes, swords an' maces, so take yer pick an' tell me what ye'll be hittin' with it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue wantin' a blade? I'll sell ye a dagger, but I'll want tae know it's for the troggs an' no' for a dwarf's back." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage buyin' a blade! I'd ask what for, but I suppose even mages run out o' spells." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? I don't make guns, but I make the blade ye'll want when the bear gets too close for one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I've heard yer kind fight wi' claws an' teeth, which is fine, but ye'll still want a good mace for when ye're on two legs." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll sell ye a dagger or a staff, but I'll ask ye no' tae let yer servant touch the steel, for it leaves a mark on the metal I cannae polish out." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I've a mace or two that would carry a lightnin' strike well, if ye don't mind it scorchin' the grip." },
      },
      again = {
        { id = "h_again", text = "What else? I've steel coolin'." },
        { id = "h_again2", text = "Ask away." },
      },
      choices = {
        { text = "Let me see your weapons.", next = "BUSINESS" },
        { text = "Which weapon would you choose?", next = "choose" },
        { text = "Do you really take back broken blades?", next = "back" },
        { text = "Why make weapons in Kharanos, not Ironforge?", next = "why" },
        { text = "Would you refuse to sell me a dagger?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do mages often buy weapons from you, Grawn?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which of your blades would hold against a Frostmane troll?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What blade should a hunter carry, Grawn?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever forge weapons blessed for the faithful, Grawn?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you take back a hammer broken in an unfair fight?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is a claw any less honest than a blade, Grawn?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does my servant really mark your steel, Grawn?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What weapon suits a shaman best, Grawn?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Grawn.", next = "END" },
      },
    },

    choose = {
      lines = {
        { id = "ch_default", text = "An axe, every time, for it's a dwarf's weapon an' it'll chop wood as well as trolls. But if ye've a gun an' good aim, ye might never need tae get close enough tae use it." },
      },
      choices = {
        { text = "I prefer to fight up close.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I'd rather they never get near me.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },

    back = {
      lines = {
        { id = "ba_default", text = "In an honest fight, aye. If ye've been usin' it tae pry open crates or chop ice, that's yer own fault, an' I'll know, for I can read a broken blade like a book." },
      },
      choices = {
        { text = "What does a broken blade tell you?", next = "back_read" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back_read = {
      lines = {
        { id = "br_default", text = "Where it struck an' how hard, an' whether the one holdin' it knew what they were doin'. A clean break near the hilt means bad steel, which means me, but a chip near the tip means ye hit a rock, which means you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because the recruits come through here first, an' they need weapons before they reach the city. An' because I'd rather be a big name in Kharanos than a small one in the Great Forge, an' I'll no' apologize for that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned the craft at the Great Forge an' brought it out here, where the air's cleaner an' the customers are less fussy." } },
    advice = { { id = "tp_ad", text = "Keep yer blade oiled. Rust kills more weapons than trolls do." } },
    second_war = { { id = "tp_second_war", text = "I forged fer the Second War as an apprentice, an' I learned more in one season than in ten years since. A blade that holds is a blade that keeps a soldier breathing." } },
    scourge = { { id = "tp_scourge", text = "Silver an' fire for the dead, an' good steel fer everythin' else. I've sold a few blades tae lads goin' north, an' I've told every one o' them tae aim fer the neck." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "Dark Iron steel's the finest made, an' I'd never sell a blade o' it in this shop. It'd be like sellin' a murderer's axe." } },
    _none = { { id = "tp_none", text = "I make weapons. If it's no' about that, I'm the wrong dwarf tae ask." } },
  },
}

-- Boran Ironclink: armorer in Kharanos; mail and plate for those who stand in front.
P:NPC {
  key = "dm_boran", id = TODO_NPC("Boran Ironclink"), name = "Boran Ironclink",
  bible = "bibles/kharanos_shops.md", role = "blacksmith", tier = "service",
  communities = { "kharanos" }, temper = { "jovial" }, values = { "practical", "proud" },
  notices = { "kit" },

  impression = {
    first = "Boran Ironclink sells armor in Kharanos and clanks a little when he walks, because he wears a sample of his stock. He believes most problems in Dun Morogh can be solved by thicker mail.",
    third = "{name} met Boran Ironclink, an armorer in Kharanos.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in! Ye look like ye could use a bit more iron about ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did the mail keep the teeth out?" },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "By my beard, where's yer armor? Ye cannae go out in the snow like that, an' certainly no' near the trolls." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "My armor stands up tae claws, cold an' troggs. Lightnin' I've never tested, an' I'll no' start by testin' it on a customer. Mind, if ye're standin' in a storm wi' yer arms up, ye'll want somethin' that doesnae draw it quite so well as mail, so I'll think on it." } },
      choices = {
        { text = "Think on it carefully. A good smith tests before he sells.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take my chances. The storm won't strike its own.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I've no idea, an' I'd love tae see it tried, though I'd rather it wasnae my best mail that tore. Leather's yer friend, I'd say, for it gives a little, an' mail's as stubborn as a dwarf." } },
      choices = {
        { text = "Good armor is wisdom. Even a bear can use more.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I trust my own hide more than any mail.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A good mail coat an' a shield wi' an iron rim, for a trogg's club comes down hard an' a wooden shield splits. Most recruits want the light stuff so they can run, but a warrior isnae meant tae run, so he might as well be heavy." } },
      choices = {
        { text = "A warrior stands. Give me the heavy coat.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take the light stuff. Speed wins fights too.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Light mail over a fur linin', for ye'll be lyin' still in the snow for hours, an' the cold'll do ye in quicker than any bear. I line the shoulders thick, for a hunter's always carryin' a rifle on one an' a carcass on the other." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' yer {pet} has its own fur, lucky beast, so it'll no' need my help, though I'd make it somethin' if I could." },
      },
      choices = {
        { text = "The warm lining, then. Patience in the cold wins hunts.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep it light. I don't sit still for hours.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because ye need tae move yer hands freely, an' my mail would weigh ye down like an anvil. Stick tae cloth, an' let the warriors stand in front o' ye, for that's what they're there for." } },
      choices = {
        { text = "I'll trust the warriors to stand in front of me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd sooner stand alone than rely on anyone else.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I make armor for whoever needs it, but I'll admit I prefer the ones who fight wi' axes. Yer kind's demons do the fightin' for ye, an' I've no' the trick o' makin' armor for a voidwalker." } },
      choices = {
        { text = "I fight my own battles, Boran. The demon only helps.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My demon bleeds so I don't have to. That's the point.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Aye, an' I'll argue it wi' anyone, though I'll admit a priest an' a good coat o' mail together are better than either alone. The recruits who come back are the ones who wore my mail an' had a healer behind them." } },
      choices = {
        { text = "Faith saves more than mail ever could, Boran.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. Good mail is a prayer answered.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me see your armour.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "If ye stand in front o' them, aye, an' that's what a paladin's for, I've heard. My armor will keep yer ribs whole, an' yer ribs will keep the troggs off the recruits behind ye, so we'll call it a partnership." } },
      choices = {
        { text = "Then I'll stand in front, every time. That's my duty.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Armour keeps me alive. The recruits must look after themselves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Thanks, Boran.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Because sooner or later somebody sees ye comin', an' then all the sneakin' in the world willnae stop a Frostmane spear. Get the best leather ye can afford, an' if ye ever change yer mind about mail, ye know where my counter is." },
      },
      choices = {
        { text = "Good leather it is. Thanks, Boran.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Nobody sees me coming, Boran.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Ye'll want somethin' light, I'd guess, but I'll tell ye now my armor's kept more recruits alive than any prayer, an' I'll stand by that." },
        { id = "h_default", key = true,
          text = "Boran Ironclink, armorer, an' my armor's kept more recruits alive in Dun Morogh than any priest. Mail, shields, helms, the lot, an' all made tae keep the cold out as well as the claws." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "Boran Ironclink, armorer, an' ye're a paladin, so ye'll want the heaviest mail I've got. The Light'll protect yer soul, but somebody has tae protect yer ribs, an' that's my job." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage wantin' armor? I'll sell ye somethin', but ye'll no' be able tae cast in plate, so don't come back complainin'." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in my shop? Ye'll no' be wantin' plate, I'd guess, so what is it ye're after?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Now there's someone who'll wear a coat o' mail an' thank me for it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll want mail ye can kneel in, for a hunter's always crouchin' in the snow behind somethin'." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Ye'll want somethin' that fits whether ye're a bear or an elf, an' I'm sorry tae say I've never made such a thing." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! Ye'll no' want mail, I know, for it clanks, but have ye considered that clankin' is a small price tae pay for no' bein' stabbed?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, eh? Ye'll want mail, then, for I hear the elements dinnae care much whose side ye're on when they get goin'." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Go on, ask." },
      },
      choices = {
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "Why do you wear your own stock?", next = "wear" },
        { text = "What's the worst thing out there in Dun Morogh?", next = "worst" },
        { text = "Is heavy armor worth the weight?", next = "weight" },
        { text = "Why can't a mage cast spells in your armor?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you not make armor for warlocks, Boran?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What armor would you give a warrior heading for the troggs?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What armor suits a hunter in Dun Morogh, Boran?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has your armour really saved more lives than prayer, Boran?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Can heavy armour protect the weak as well as its wearer?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does your armor hold up when a druid changes shape?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why should a rogue care about armor, Boran?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Will your armor stand up to lightning, Boran?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thanks, Boran.", next = "END" },
      },
    },

    wear = {
      lines = {
        { id = "we_default", text = "So folk can see it works, an' so they can hear me comin'. A dwarf who sells armor an' doesnae wear it is like a brewer who doesnae drink, an' ye'd never trust either o' them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    worst = {
      lines = {
        { id = "wo_default", text = "The Frostmane trolls, for they're clever an' they don't fight fair. Then there's the wendigos in the Grizzled Den, which are big an' angry an' don't care how much armor ye've got." },
      },
      choices = {
        { text = "The trolls have lived here a long time, though.", next = "worst_trolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst_trolls = {
      lines = {
        { id = "wt_default", text = "Aye, they say this was their land before it was ours, an' maybe it was. But we're here now, an' they keep raidin' our farms, so I'll keep sellin' armor tae the folk who stop them." },
      },
      choices = {
        { text = "Maybe there's room for both peoples here.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Dun Morogh belongs to Ironforge now.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },

    weight = {
      lines = {
        { id = "wg_default", text = "Every ounce, if ye're the one standin' in front. A mage can hide behind ye, an' a rogue can hide in the shadows, but a warrior or a paladin has tae stand an' take it, an' that's what my mail's for." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I made armor for the Ironforge army in the Second War, an' now I make it for recruits, which is a lot less shoutin'." } },
    advice = { { id = "tp_ad", text = "Keep yer mail dry. Rust is an enemy that never sleeps." } },
    scourge = { { id = "tp_scourge", text = "Thicker mail won't stop a plague, more's the pity, but it'll stop the claws o' whatever's carryin' it. Come see me before ye go north." } },
    second_war = { { id = "tp_second_war", text = "My father wore mail o' my grandfather's makin' through the whole Second War, an' he came home wi' nothin' worse than a dent. I keep that mail on the wall fer luck." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's got a strongman who wears a breastplate made o' tin, an' I've offered him a real one fer free advertising. He hasnae answered yet." } },
    _none = { { id = "tp_none", text = "That's no' armor, so I couldnae help ye wi' it." } },
  },
}

-- Durnan Furcutter: cloth and leather armor at Anvilmar in Coldridge Valley; kind to brand-new recruits.
P:NPC {
  key = "dm_durnan", id = TODO_NPC("Durnan Furcutter"), name = "Durnan Furcutter",
  bible = "bibles/kharanos_shops.md", role = "vendor", tier = "service",
  communities = { "coldridge" }, temper = { "warm" }, values = { "kind", "practical" },
  notices = { "greenness" },

  impression = {
    first = "Durnan Furcutter sells cloth and leather armor at Anvilmar to recruits who have barely learned to hold a sword. He fusses over them like an uncle and worries about the ones who don't come back.",
    third = "{name} met Durnan Furcutter, who sells armor to new recruits at Anvilmar.",
  },

  greetings = {
    { id = "g_default", text = "Ye look cold, recruit. Let's find ye somethin' warm before ye catch yer death." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Ye're lookin' tougher already." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 5 },
      text = "First week out o' the barracks, is it? I can always tell, for the new ones still look surprised by the snow." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I've never asked them, an' it's a strange question tae hear in my own shop. The trappers say they thank the beast before they skin it, an' I always took that for an old mountain habit. Ye'd tell me it's more than habit, would ye no'?" } },
      choices = {
        { text = "It's more than habit. Thank the beast, always.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A hide's a hide. Thanks don't keep anyone warm.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every day, for I see them go out in the snow in whatever they came in, an' I see some o' them come back blue. The cold in Dun Morogh doesnae care who ye are, an' it's patient." } },
      choices = {
        { text = "Then they need discipline as much as warm leather.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "They'll learn. Some lessons only the cold can teach.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because mail's cold an' it chafes, an' a recruit wi' raw shoulders swings slow. Every warrior who's come back from the troggs tellin' me his paddin' saved him has made my day, an' I'd like ye tae be one o' them." } },
      choices = {
        { text = "I'll wear the padding and come back to tell you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go without. A little chafing never hurt anyone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Somethin' soft at the knees an' tough at the shoulders, for a hunter kneels a lot an' carries a lot. I've watched a good many young hunters go out o' Anvilmar, an' the ones that come back always have muddy knees." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' look after yer {pet}, mind, for I've seen hunters come back wi'out their beasts, an' it's a sadder thing than ye'd think." },
      },
      choices = {
        { text = "I'll look after my beast before myself.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A beast can be tamed again. I'll look after myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Aye, if ye oil it right an' cut it soft, which is why my leathers cost a wee bit more. I make it for scouts an' hunters, but I've no' asked any o' them what they get up to in the dark." } },
      choices = {
        { text = "I'll use it to scout the Frostmane, nothing more.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better you don't ask, Durnan. It's healthier that way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every one o' them, an' I keep a list in my head, though I'll no' say it aloud. If ye're a priest, I'd take it kindly if ye said a word for them now an' then, for I never know what tae say myself." } },
      choices = {
        { text = "I'll pray for them, Durnan. Every name on your list.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Don't dwell on the dead. Dress the living warmly instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Show me what you have.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Troggs an' wolves, mostly, an' the Frostmane trolls in the hills, an' the young ones who think they can handle all three at once. Keep an eye on them for me, will ye? They listen tae paladins." } },
      choices = {
        { text = "I'll watch over the recruits. It's what a paladin does.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The recruits are soldiers. They can look after themselves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Durnan.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, fresh out o' Anvilmar! Ye'll want somethin' warm under all that mail, an' I've a padded shirt that'll keep the cold out." },
        { id = "h_default", key = true,
          text = "Durnan Furcutter, cloth an' leather. Every recruit who comes through Anvilmar needs somethin' warmer than what they arrived in, an' I make sure they get it." },
        { id = "h_mage", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
          text = "Durnan Furcutter, cloth an' leather, an' ye'll be wantin' the cloth, I'd guess. Robes are warm enough, as long as ye stay near a fire, which a spellcaster always seems tae manage somehow." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue fresh out o' Anvilmar! Ye'll want leather that doesnae creak, an' I've a few pieces that'll suit ye." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll be wantin' mail soon enough, but for now let me give ye somethin' warm tae wear under it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll want leather, then, an' good leather's my trade, so ye've come tae the right dwarf." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, an' ye look half frozen, though I expect ye'd say ye're fine. Kaldorei always say that, an' then they start shiverin'." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I've wolf pelts an' bear hides aplenty, though I suppose ye'd want tae ask the beasts' leave before ye wore one." },
      },
      again = {
        { id = "h_again", text = "Anythin' else I can help ye with, recruit?" },
        { id = "h_again2", text = "Go on, ask." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What should a new recruit wear?", next = "wear" },
        { text = "What's the danger here in Coldridge Valley?", next = "danger" },
        { text = "Where do recruits go after Anvilmar?", next = "after" },
        { text = "Can leather really be made to stay quiet?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why would a warrior need cloth under mail, Durnan?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What leather would you recommend for a young hunter?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you worry about the recruits who don't come back, Durnan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What's the danger here in Coldridge, Durnan?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you wish the recruits respected the cold more?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you think the beasts mind being worn, Durnan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thanks, Durnan.", next = "END" },
      },
    },

    wear = {
      lines = {
        { id = "we_default", text = "Somethin' warm an' somethin' that'll stop a wolf's teeth, an' if ye can find both in one, all the better. Leather's best for that, unless ye're a spellcaster, in which case ye'll just have tae run faster." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    danger = {
      lines = {
        { id = "da_default", text = "Troggs in the caves tae the north, an' the Frostmane trolls in the hills, an' the wolves everywhere else. None of it's too much for a careful recruit, but I've seen careless ones carried back on a sledge." },
      },
      choices = {
        { text = "I'll be careful, I promise.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 }, learn = { "troggs" } } },
        { text = "I'll take my chances.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 }, learn = { "troggs" } } },
      },
    },

    after = {
      lines = {
        { id = "af_default", text = "Through the tunnel tae Kharanos, where there's a proper inn an' proper shops, an' then on tae Ironforge if ye've the stomach for it. Most come back this way once or twice, an' I'm always glad tae see them." },
      },
      choices = {
        { text = "Do many not come back?", next = "after_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_lost = {
      lines = {
        { id = "al_default", text = "Some, aye, an' I try no' tae count them. I remember the faces, though, an' the coats I sold them, an' I hope wherever they are, they're warm." },
      },
      choices = { { text = "I'll come back. You'll see.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've stitched coats in Anvilmar for twenty years, an' I've lost count o' the recruits I've dressed." } },
    advice = { { id = "tp_ad", text = "Keep yer feet dry. Cold feet lose more fights than bad swords." } },
    scourge = { { id = "tp_scourge", text = "Some o' my recruits want tae go north an' fight the dead, an' I fuss over every one o' them. Leather's no' much against a plague, but it's warmer than nothin'." } },
    magni = { { id = "tp_magni", text = "The King came by Anvilmar once an' bought a pair o' my gloves, an' he wears them yet, I'm told. I've never been so proud o' a pair o' gloves." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The recruits all want tae go tae the Darkmoon Faire on their first leave, an' they come back skint an' happy. I tell them tae buy a warm cloak first, an' none o' them listen." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, recruit. Ask Sten Stoutarm by the door; he knows the valley better than I do." } },
  },
}
