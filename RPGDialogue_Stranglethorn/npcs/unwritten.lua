-- Stranglethorn Vale and Booty Bay: folk a roster scan found with no conversation yet.
-- The rest of the Zandalar camp on Yojamba Isle (kept consistent with yojamba.lua), Short John Mithril of the
-- Gurubashi Arena, and "Sea Wolf" MacKinley and "Shaky" Phillipe of Booty Bay. Voice: bibles/yojamba.md, bibles/booty_bay_salty.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC = P.TODO_NPC

-- Al'tabim the All-Seeing: Zandalar seer on Yojamba Isle.
P:NPC {
  key = "stv_altabim", id = TODO_NPC("Al'tabim the All-Seeing"), name = "Al'tabim the All-Seeing", gender = "male",
  bible = "bibles/yojamba.md", role = "questgiver", tier = "service",
  communities = {}, temper = { "serene", "cryptic" }, values = { "devout", "tradition" },
  notices = { "class", "race" },
  impression = {
    first = "Al'tabim the All-Seeing sits among the Zandalar on Yojamba Isle, and his gaze rests on you a moment longer than is comfortable, as though he were reading something written behind your eyes.",
    third = "{name} met Al'tabim the All-Seeing, a seer of the Zandalar on Yojamba Isle.",
  },
  greetings = {
    { id = "g_default", text = "I saw you comin' across de water, stranger, long before your boat touched de sand. Sit, and let us talk of Hakkar." },
    { id = "g_back", when = { metBefore = true }, text = "You return, as I knew you would. De threads of your fate still run toward Zul'Gurub." },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You work with de unseen, {class}, same as me. When you go into de city, Hakkar's priests will feel you comin', so make sure dey feel it too late." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, far from de Echo Isles. De Zandalar remember all de tribes, little cousin, even de small ones." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Al'tabim, and de Zandalar call me de All-Seeing because I see what is comin' before it comes. What I see now is de Soulflayer risin' in Zul'Gurub, and every tribe of de world drownin' in blood if he is not stopped." } },
      again = { { id = "h_again", text = "Ask, and I will tell you what I can see." } },
      choices = {
        { text = "What exactly do you see coming?", next = "vision" },
        { text = "Why do the Zandalar need outsiders?", next = "outsiders" },
        { text = "Seers usually see what they want to see.", next = "doubt" },
        { text = "I'll go to Zul'Gurub.", next = "END" },
      },
    },
    vision = {
      lines = { { id = "v_default", text = "I see de Gurubashi priests feedin' Hakkar de blood of their own people, and his strength growin' with every heart dat stops. If he walks free of de city, he will not stop at de jungle, and de Zandalar have seen dat once before." } },
      choices = {
        { text = "When has he walked free before?", next = "before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "In de days of de old Gurubashi empire, when de Atal'ai priests called him into de world and he nearly devoured it. De other tribes broke de Atal'ai and drove dem into de swamp, and de empire never stood tall again." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    outsiders = {
      lines = { { id = "o_default", text = "Because de Zandalar are few and old, and de Gurubashi priests are many and mad with power. We will give gifts to any who fight de Soulflayer, Horde or Alliance, for Hakkar does not care which banner you carry." } },
      choices = {
        { text = "Then the old feuds can wait. Hakkar comes first.", next = "BACK", reply = "Wise. Old grudges are a luxury for a world dat is not burnin'.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I fight for my own people, not for the Zandalar.", next = "BACK", reply = "Fight for whoever you like, so long as you fight. De Soulflayer will eat your people too.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    doubt = {
      lines = { { id = "d_default", text = "Some do, mon, and I have seen dem die of it. I would very much like to be wrong about Hakkar, but de bones keep fallin' de same way, and I am too old to argue with bones." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a seer of de Zandalar, come to Yojamba to watch de Soulflayer and warn de world." } },
    _none = { { id = "tp_none", text = "Dat, I do not see, stranger. Even de All-Seeing has his blind spots." } },
  },
}

-- Falthir the Sightless: blind Zandalar trader on Yojamba Isle.
P:NPC {
  key = "stv_falthir", id = TODO_NPC("Falthir the Sightless"), name = "Falthir the Sightless", gender = "male",
  bible = "bibles/yojamba.md", role = "vendor", tier = "service",
  communities = {}, temper = { "wry", "patient" }, values = { "tradition", "practical" },
  notices = { "race" },
  impression = {
    first = "Falthir the Sightless is a blind Zandalar who knows every trinket on his mat by touch. He named what was in my pack before I'd opened it.",
    third = "{name} met Falthir the Sightless, a blind Zandalar trader on Yojamba Isle.",
  },
  greetings = {
    { id = "g_default", text = "Ah, footsteps I do not know, and dey smell of salt and jungle. Come, sit, and tell old Falthir what you carry." },
    { id = "g_back", when = { metBefore = true }, text = "I know dat step! You came back, and you walk heavier, which means you have been fightin'." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Dat voice is troll, Darkspear by de lilt. Your people were small when mine were already old, cousin, but small is not de same as weak." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Falthir, and I have no eyes, but my fingers know more about de old Gurubashi work than most scholars' eyes ever will. Bring me what you find in Zul'Gurub, and I will tell you what it is and what it is worth." } },
      again = { { id = "h_again", text = "What else, stranger? Falthir is listenin'." } },
      choices = {
        { text = "How did you lose your sight?", next = "sight" },
        { text = "What sort of things come out of Zul'Gurub?", next = "relics" },
        { text = "You can't really know an object by touch.", next = "touch" },
        { text = "Let me see what you have.", next = "END" },
      },
    },
    sight = {
      lines = { { id = "s_default", text = "I looked into a Hakkari idol when I was young and foolish, and it looked back. De priests of my tribe said I was lucky to keep my mind, and dey were right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    relics = {
      lines = { { id = "r_default", text = "Coins of de old empire, bijous de priests wore, and things carved by hands dat have been dust a thousand years. Some carry de Soulflayer's taint, and dose I keep far from my mat." } },
      choices = {
        { text = "Tainted relics should be destroyed, not traded.", next = "BACK", reply = "Destroyed by who? Fire does not kill dat kind of magic. Better it sits with someone who knows it.", fx = { align = { light = 1 } } },
        { text = "A relic is power. Sell me the tainted ones.", next = "BACK", reply = "No, stranger. Falthir sells many things, but not dat.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    touch = {
      lines = { { id = "t_default", text = "Put somethin' in my hand and test me, then. De old carvers left their marks deep, and a finger finds what de eye skips over." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a Zandalar, blind since my youth, and a trader of old things." } },
    _none = { { id = "tp_none", text = "Dat, I cannot tell you by touch or by ear, stranger." } },
  },
}

-- Rin'wosho the Trader: the Zandalar Tribe's trader on Yojamba Isle.
P:NPC {
  key = "stv_rinwosho", id = TODO_NPC("Rin'wosho the Trader"), name = "Rin'wosho the Trader", gender = "male",
  bible = "bibles/yojamba.md", role = "vendor", tier = "service",
  communities = {}, temper = { "shrewd", "cheerful" }, values = { "practical", "loyal" },
  notices = { "race" },
  impression = {
    first = "Rin'wosho trades for the Zandalar on Yojamba Isle, and he weighed me up like a bundle of goods the moment I stepped onto the sand.",
    third = "{name} met Rin'wosho, the Zandalar Tribe's trader on Yojamba Isle.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, welcome! De Zandalar reward dose who fight Hakkar, and Rin'wosho is de one who hands out de rewards, so you want to be friends with me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend of de Zandalar! Let me see how much de tribe trusts you now." },
  },
  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "A goblin, come to haggle with a troll. You will find de Zandalar drive a harder bargain dan Booty Bay, little one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Rin'wosho, and I keep de tribe's goods, de armor and charms de Zandalar give to dose who prove demselves in Zul'Gurub. De more you do for us, de more I can open my chests for you." } },
      again = { { id = "h_again", text = "Yes, friend? What else?" } },
      choices = {
        { text = "How do I earn the tribe's trust?", next = "trust" },
        { text = "Where do the Zandalar come from?", next = "home" },
        { text = "So it's a bribe to fight your war.", next = "bribe" },
        { text = "Show me your goods.", next = "END" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "Kill Hakkar's servants in de city, bring back what dey carry, and de tribe hears about it. Molthor keeps de count, and I keep de chests, and between us, nobody goes unpaid." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "h2_default", text = "From an island far across de sea, older dan any tribe in dis jungle. We are de first of de trolls, and we came here because de Gurubashi forgot what dey owe de rest of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bribe = {
      lines = { { id = "b_default", text = "A bribe, a gift, a fair trade, call it what you like, mon. You bleed for de tribe, and de tribe pays you back, and dat is older dan any of your kingdoms." } },
      choices = {
        { text = "Fair enough. Honest pay for honest work.", next = "BACK", reply = "Now you talk like a trader! We will get along.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take your gifts and fight how I please.", next = "BACK", reply = "So long as Hakkar's priests die, I do not care how pretty you do it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am de Zandalar's trader on Yojamba, and I keep de tribe's chests." } },
    _none = { { id = "tp_none", text = "Not my business, friend. Ask Molthor." } },
  },
}

-- Zandalar Enforcer: guard of the Zandalar camp on Yojamba Isle.
P:NPC {
  key = "stv_zandalar_enforcer", id = TODO_NPC("Zandalar Enforcer"), name = "Zandalar Enforcer",
  bible = "bibles/yojamba.md", role = "guard", tier = "service",
  communities = {}, temper = { "stern", "proud" }, values = { "duty", "tradition" },
  notices = { "race" },
  impression = {
    first = "A Zandalar enforcer, towering and painted, who guards the camp on Yojamba Isle with a spear and a long memory.",
    third = "{name} spoke with one of the Zandalar enforcers on Yojamba Isle.",
  },
  greetings = {
    { id = "g_default", text = "You stand on Zandalar ground now. Behave, and you will leave on your own feet." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Molthor says you are useful, so I will not throw you in de sea today." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. Stand straighter, little cousin, you are among de Zandalar." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep de peace on Yojamba, and I keep de Gurubashi spies off dis island. De priests of Hakkar would love to cut de throats of de ones who came here to stop dem." } },
      again = { { id = "h_again", text = "Speak, if you must." } },
      choices = {
        { text = "Do Gurubashi spies really come here?", next = "spies" },
        { text = "You look like you've fought in the city.", next = "city" },
        { text = "Why should outsiders trust the Zandalar?", next = "trust" },
        { text = "I'll behave.", next = "END" },
      },
    },
    spies = {
      lines = { { id = "s_default", text = "Every few nights, swimmin' in from de jungle with poison on deir blades. De sharks get most of dem before I do, and I do not mind sharin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city = {
      lines = { { id = "c_default", text = "I went in once, with de first party, and I came out with fewer friends dan I went in with. De bats, de snakes, de priests, all of dem fight for de Soulflayer, and none of dem fear death." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "t_default", text = "You should not, unless we earn it, and we do not ask you to love us. We ask you to kill Hakkar before he kills all of us, and dat is a simpler thing." } },
      choices = {
        { text = "Honest words. I can work with that.", next = "BACK", reply = "Good. Den go work.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Trolls are trolls. I'll keep my blade close.", next = "BACK", reply = "Keep it close, and keep it pointed at de Gurubashi.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am an enforcer of de Zandalar, sworn to guard dis camp." } },
    _none = { { id = "tp_none", text = "I guard, I do not gossip. Ask Molthor." } },
  },
}

-- Zandalar Headshrinker: a Zandalar witch doctor on Yojamba Isle.
P:NPC {
  key = "stv_zandalar_headshrinker", id = TODO_NPC("Zandalar Headshrinker"), name = "Zandalar Headshrinker",
  bible = "bibles/yojamba.md", role = "guard", tier = "service",
  communities = {}, temper = { "sly", "grim" }, values = { "tradition", "devout" },
  notices = { "class" },
  impression = {
    first = "A Zandalar headshrinker, beads and small dried things hanging from the belt, who watches the camp with a witch doctor's quiet amusement.",
    third = "{name} spoke with one of the Zandalar headshrinkers on Yojamba Isle.",
  },
  greetings = {
    { id = "g_default", text = "Heh, a fresh head walkin' around on its own legs. Do not worry, stranger, I only shrink de ones dat earn it." },
    { id = "g_back", when = { metBefore = true }, text = "You still have your head, I see. Good, keep it dat way." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You talk to spirits too, I can smell it on you. Den you know de spirits in dat city are very, very angry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am a headshrinker of de Zandalar, and I guard dis camp with de old magic, de kind dat makes a Gurubashi spy think twice. De heads on my belt are all Hakkar's servants, and dey do not complain anymore." } },
      again = { { id = "h_again", text = "Yes? Speak up, de heads are listenin'." } },
      choices = {
        { text = "Why shrink heads at all?", next = "why" },
        { text = "What do you know of the Hakkari priests?", next = "priests" },
        { text = "That's a barbaric practice.", next = "barbaric" },
        { text = "I'll keep my head, thanks.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "A shrunken head keeps a little of de spirit inside, and a spirit can be asked questions. De Gurubashi priests tell me deir secrets after dey are dead, which is more dan dey would do alive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priests = {
      lines = { { id = "p_default", text = "Each one serves a different beast loa dat Hakkar has twisted, de bat, de snake, de spider, de panther and de tiger. Kill de priest, and de loa he chained might thank you for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    barbaric = {
      lines = { { id = "b_default", text = "Barbaric, you say, and your people hang deir criminals in de town square. Every people has its customs, stranger, and mine are older dan yours." } },
      choices = {
        { text = "Fair point. I have no right to judge.", next = "BACK", reply = "Heh. You are smarter dan you look.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Old or not, desecrating the dead is wrong.", next = "BACK", reply = "Tell dat to Hakkar, who eats de dead whole. I only borrow dem.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a headshrinker of de Zandalar, keeper of de old voodoo." } },
    _none = { { id = "tp_none", text = "Even de heads do not know dat one, stranger." } },
  },
}

-- Short John Mithril: the goblin who drops the treasure chest into the Gurubashi Arena.
P:NPC {
  key = "stv_short_john_mithril", id = TODO_NPC("Short John Mithril"), name = "Short John Mithril", gender = "male",
  bible = "bibles/booty_bay_salty.md", role = "citizen", tier = "service",
  communities = { "stranglethorn" }, temper = { "showy", "loud" }, values = { "greedy", "mischief" },
  notices = { "class" },
  impression = {
    first = "Short John Mithril is a goblin pirate with a showman's voice, who turns up at the Gurubashi Arena now and then to drop a chest of loot into the pit and watch everyone kill each other over it.",
    third = "{name} met Short John Mithril, the goblin who throws treasure into the Gurubashi Arena.",
  },
  greetings = {
    { id = "g_default", text = "Arr, a fresh contender! Ya look like you'd fight for a chest of gold, and that's my favourite kind of customer." },
    { id = "g_back", when = { metBefore = true }, text = "You survived the last one, eh, kid? Then you're a regular, and regulars get my best showmanship." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue! Ya'll be wantin' to sneak in and grab the chest while everyone else is bleedin', and I can't say I disapprove, pal." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Short John Mithril, at your service, purveyor of fine treasure to the brave and the foolish! Every few hours I drop a chest into the Gurubashi Arena, and whoever's left standing gets to keep what's inside." } },
      again = { { id = "h_again", text = "What else, chum? The next drop won't wait forever." } },
      choices = {
        { text = "Why give away treasure at all?", next = "why" },
        { text = "What's in the chest?", next = "chest" },
        { text = "Pitting people against each other is cruel.", next = "cruel" },
        { text = "I'll be in the arena.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Who says I'm givin' it away? The Booty Bay bookmakers pay me handsome to keep the crowds comin', and nothing brings a crowd like blood and gold together. It's an investment, see." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    chest = {
      lines = { { id = "c_default", text = "Arena gear, pal, good stuff, and somethin' different every time, which keeps everybody guessin'. Ya want to know exactly what's in it, ya have to win it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cruel = {
      lines = { { id = "cr_default", text = "Cruel? Nobody makes 'em jump in, kid, they come runnin' all on their own. I just provide the incentive, and the incentive is shiny." } },
      choices = {
        { text = "Then the fighters have only themselves to blame.", next = "BACK", reply = "Now you're talkin' like a goblin! Nobody's ever forced, see.", fx = { align = { honor = -1 } } },
        { text = "Dangling gold over desperate people is still wrong.", next = "BACK", reply = "Wrong, right, I don't keep those ledgers, pal. Just the money ones.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a goblin, a pirate, and the finest showman in Stranglethorn, arr." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, kid. Got a chest to drop." } },
  },
}

-- "Sea Wolf" MacKinley: Booty Bay gambler and quest giver.
P:NPC {
  key = "stv_sea_wolf_mackinley", id = TODO_NPC("\"Sea Wolf\" MacKinley"), name = "\"Sea Wolf\" MacKinley", gender = "male",
  bible = "bibles/booty_bay_salty.md", role = "questgiver", tier = "service",
  communities = { "booty_bay" }, temper = { "brash", "sly" }, values = { "greedy", "mischief" },
  notices = { "class" },
  impression = {
    first = "\"Sea Wolf\" MacKinley is a weathered old salt and gambler in Booty Bay, and he talked about debts as fondly as other men talk about their children.",
    third = "{name} met \"Sea Wolf\" MacKinley, an old sailor and gambler of Booty Bay.",
  },
  greetings = {
    { id = "g_default", text = "Ahoy, matey! Ye've a look about ye of someone who can do a job and keep his mouth shut, and I've got just the job." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good, good, there's always another debt to collect in this town." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ye've a light step, matey, and a lighter touch, I'd wager. That's handy in my line of work." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "They call me the Sea Wolf, on account of my years on the sea, though these days I prefer to hunt men who owe me money. Shaky Phillipe, for one, owes me plenty, and he's not been in any hurry to pay." } },
      again = { { id = "h_again", text = "Aye, what else is on yer mind?" } },
      choices = {
        { text = "What does Shaky owe you?", next = "shaky" },
        { text = "How did you get the name Sea Wolf?", next = "name" },
        { text = "Hunting debtors seems a mean trade.", next = "mean" },
        { text = "I'll be off.", next = "END" },
      },
    },
    shaky = {
      lines = { { id = "s_default", text = "Enough to buy a ship, if ye count the interest, and I always count the interest. The man jumps at his own shadow, so a little fright should loosen his purse, and the gorillas up at Mistvale Valley are fine for frightening." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "n_default", text = "I sailed with the worst crews on the South Seas and I came home every time, which is more than the sharks can say. A sailor who always comes back gets a name, and mine's the Sea Wolf." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mean = {
      lines = { { id = "m_default", text = "Mean? He made the bet, matey, I only hold him to it. In Booty Bay a man's word is the only coin that never runs out, and when he breaks it, he pays the price." } },
      choices = {
        { text = "A debt is a debt. He should pay.", next = "BACK", reply = "Spoken like a true Booty Bay man! I like ye already.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Scaring a nervous man is just cruelty.", next = "BACK", reply = "Cruelty, business, ye say potato. He'll live, matey.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm an old sailor and gambler of Booty Bay, retired from the sea but not from collectin'." } },
    _none = { { id = "tp_none", text = "Never heard of it, matey. Ask at the Salty Sailor." } },
  },
}

-- "Shaky" Phillipe: a nervous man on the docks of Booty Bay.
P:NPC {
  key = "stv_shaky_phillipe", id = TODO_NPC("\"Shaky\" Phillipe"), name = "\"Shaky\" Phillipe", gender = "male",
  bible = "bibles/booty_bay_salty.md", role = "questgiver", tier = "service",
  communities = { "booty_bay" }, temper = { "nervous", "jumpy" }, values = { "caution", "survival" },
  notices = { "class" },
  impression = {
    first = "\"Shaky\" Phillipe flinched when I said hello, which seems to be what he does to everyone. He's a sailor whose nerves have long since come apart at the seams.",
    third = "{name} met \"Shaky\" Phillipe, the jumpiest man in Booty Bay.",
  },
  greetings = {
    { id = "g_default", text = "Oh! Oh, you startled me, please don't come up behind a fellow like that, my heart can't take much more of this town." },
    { id = "g_back", when = { metBefore = true }, text = "You again! You're not here for MacKinley, are you? Please say you're not here for MacKinley." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You look like you could stop a gorilla with your bare hands, which is wonderful, really, as long as you're on my side." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Phillipe, and yes, everyone calls me Shaky, and yes, I know why, so there's no need to say it. I sailed for years without a fright, but one bad voyage and a few bad debts will change a man." } },
      again = { { id = "h_again", text = "W-what else? Just, please, keep your voice down." } },
      choices = {
        { text = "What happened on that voyage?", next = "voyage" },
        { text = "MacKinley says you owe him money.", next = "debt" },
        { text = "You should face your fears.", next = "fear" },
        { text = "Take care, Shaky.", next = "END" },
      },
    },
    voyage = {
      lines = { { id = "v_default", text = "Bloodsail pirates, at night, with no warning, and I hid in a barrel of salt fish while they did terrible things to my crewmates. I haven't had a good night's sleep since, and I can't stand the smell of fish." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    debt = {
      lines = { { id = "d_default", text = "I do, I do, and I mean to pay it, honest! But every time I get a few coins together, something happens, and MacKinley keeps sending people to scare me, which only makes it worse." } },
      choices = {
        { text = "Pay him, Shaky. A debt is a debt.", next = "BACK", reply = "I know, I know, and I will. Just not today.", fx = { align = { honor = 1 } } },
        { text = "Skip town. MacKinley can whistle for it.", next = "BACK", reply = "And go where? The jungle? No, no, I'll take MacKinley over the trolls.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear = {
      lines = { { id = "f_default", text = "Face them? I face them every single day, they're all over this town! Every creak on the dock is a Bloodsail, and every knock on the door is MacKinley's thugs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a sailor once, a brave one, believe it or not. Now I just try to get through each day." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, honest! Please don't tell anyone I said so." } },
  },
}
