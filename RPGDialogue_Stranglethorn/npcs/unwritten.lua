-- Stranglethorn Vale and Booty Bay: folk a roster scan found with no conversation yet.
-- The rest of the Zandalar camp on Yojamba Isle (kept consistent with yojamba.lua), Short John Mithril of the
-- Gurubashi Arena, and "Sea Wolf" MacKinley and "Shaky" Phillipe of Booty Bay. Voice: bibles/yojamba.md, bibles/booty_bay_salty.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep my distance." },
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
        { text = "Tell me about Zandalar.", next = "yzand" },
        { text = "What did you see when I arrived?", next = "yseeyou" },
        { text = "What does the All-Seeing fear?", next = "yfear" },
        { text = "A Darkspear seeks your counsel, elder.", next = "BACK", when = { race = "Troll" }, reply = "Den sit, cousin. De Darkspear be small, but de Zandalar remember dat your tribe never bowed to Hakkar." },
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
  
    yseeyou = {
      lines = {
        { id = "yaltabi_yseeyou_d", text = "A fire on de water, and your shadow walkin' through it without burnin'. Dat is all de bones gave me, mon. I do not know if it means you will live or only dat you will be brave, and Al'tabim does not pretend." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfear = {
      lines = {
        { id = "yaltabi_yfear_d", text = "Dat de bones be right. Seein' is a heavy gift, mon. I saw de Atal'ai fall into de swamp before it happened, and I warned dem, and dey laughed. Now I see Zul'Gurub, and I wonder who will laugh dis time." },
      },
      choices = {
        { text = "Do the bones ever lie?", next = "ylie" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylie = {
      lines = {
        { id = "yaltabi_ylie_d", text = "De bones show what is likely, not what is certain. Some of my brothers say a seer must speak every vision, even de cruel ones. Others say some visions only make de future come quicker. Which be wiser, you think?" },
      },
      choices = {
        { text = "Speak every vision. People must be warned.", next = "BACK", reply = "Den Al'tabim will keep speakin', even when de words taste bitter.", fx = { align = { order = 1 } } },
        { text = "Keep the cruel ones silent. Fear helps no one.", next = "BACK", reply = "Maybe. But silence has a taste too, and it be worse.", fx = { align = { order = -1 } } },
      },
    },
    yzand = {
      lines = {
        { id = "yaltabi_yzand_d", text = "Zandalar is our island, far to de south across de sea, older dan any troll kingdom. De King Rastakhan sends us to mend what our children broke. We be priests first, and warriors only when we must." },
        { id = "yaltabi_yzand_v0", when = { race = "Troll" }, text = "Zandalar, cousin, de cradle of every troll who ever lived, yours too, though de Darkspear forget it. Rastakhan sends us to mend what our children broke." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hakkar = { { id = "yaltabi_tp_hakkar", text = "Hakkar de Soulflayer. Say his name softly, mon, for his priests be listenin' in every shadow." } },
    zandalar = { { id = "yaltabi_tp_zandalar", text = "Zandalar is de first home of all trolls. Every tribe came from dere, whether dey remember or not." } },

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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
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
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How did you lose your sight?", next = "sight" },
        { text = "What sort of things come out of Zul'Gurub?", next = "relics" },
        { text = "You can't really know an object by touch.", next = "touch" },
        { text = "How did you come to keep relics?", next = "xblind" },
        { text = "Why sell relics instead of keeping them?", next = "xsell" },
        { text = "Are you a priest yourself?", next = "xpriest" },
        { text = "I am a troll too, though Darkspear.", next = "BACK", when = { race = "Troll" }, reply = "Darkspear. Yes, I smell de sea on you, and de islands. Your tribe has wandered far from de old ways, but your hands still remember dem." },
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
    xblind = {
      lines = {
        { id = "xxblind_0", text = "After de idol took my eyes, de elders gave me to de relic-keepers, because a man who cannot see learns to listen to what he holds. Dey were right about dat too." },
      },
      choices = {
        { text = "What do the relics tell you?", next = "xlisten" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlisten = {
      lines = {
        { id = "xxlisten_0", text = "Who made dem, and for which loa, and how much blood dey drank. A Gurubashi coin is warm when it was paid to Hakkar's priests. I do not like to hold dose ones long." },
      },
      choices = {
        { text = "Should such things be destroyed?", next = "xdestroy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdestroy = {
      lines = {
        { id = "xxdestroy_0", text = "Some of my brothers say every Hakkari relic should be thrown into de sea. I say dey should be kept and studied, so we know de enemy's hand when we see it again. Which way do you lean?" },
      },
      choices = {
        { text = "Keep them. Knowledge is a weapon too.", next = "BACK", reply = "Spoken like a relic-keeper. Maybe you will be one, someday.", fx = { align = { light = -1 } } },
        { text = "Destroy them. Some things are too foul to keep.", next = "BACK", reply = "Hm. Dere is wisdom in fear, sometimes. I will think on it.", fx = { align = { light = 1 } } },
      },
    },
    xsell = {
      lines = {
        { id = "xxsell_0", text = "De coins and bijous you bring me buy favour with de tribe, and favour buys de armour Rin'wosho keeps. A relic in de hands of an ally is better dan one in a Gurubashi temple." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      lines = {
        { id = "xxpriest_0", text = "No, I serve de priests, which is a quieter thing. Dey speak to de loa, and I tell dem what de Gurubashi hands have made. Between us, we know de shape of what waits in Zul'Gurub." },
      },
      choices = {
        { text = "What waits there?", next = "xzg" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xzg = {
      lines = {
        { id = "xxzg_0", text = "Hakkar's high priests, each bound to a loa dey have twisted, and de Soulflayer himself behind dem. You will need many friends to go in dere, and good luck to come out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hakkar = { { id = "tp_xhakkar", text = "De Soulflayer. I have held his priests' coins, and dey burn cold. Dat is all I need to know of him." } },
    zulgurub = { { id = "tp_xzulgurub", text = "De old Gurubashi capital. My fingers know its stones better dan I would like." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer. Come and look; I'll knock a little off for you, quietly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
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
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How do I earn the tribe's trust?", next = "trust" },
        { text = "Where do the Zandalar come from?", next = "home" },
        { text = "So it's a bribe to fight your war.", next = "bribe" },
        { text = "How do the Zandalar judge an outsider?", next = "xjudge" },
        { text = "What is Yojamba Isle to you?", next = "xisle" },
        { text = "Why do the Zandalar need outsiders at all?", next = "xneed" },
        { text = "I am a troll. Do I earn favour faster?", next = "BACK", when = { race = "Troll" }, reply = "Ha! You earn it de same as anybody, by blood and work. But I will admit, it is good to see a troll on dis side of de fight." },
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
    xjudge = {
      lines = {
        { id = "xxjudge_0", text = "By what dey bring back from Zul'Gurub, mostly. Coins, bijous, de heads of priests. Every one tells me a little more about who you are and how hard you fight." },
      },
      choices = {
        { text = "And if someone brings nothing?", next = "xnothing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnothing = {
      lines = {
        { id = "xxnothing_0", text = "Den dey get nothing. De Zandalar do not give gifts to de idle. Some of my brothers say we should arm anyone willing to fight Hakkar, even before dey prove demselves. What do you say?" },
      },
      choices = {
        { text = "Arm them early. The danger is too great to wait.", next = "BACK", reply = "Hm. Dat is de soft way, but maybe de quick one too.", fx = { align = { order = -1 } } },
        { text = "Trust must be earned. Your way is right.", next = "BACK", reply = "Yes. A blade given too soon is a blade turned on you.", fx = { align = { order = 1 } } },
      },
    },
    xisle = {
      lines = {
        { id = "xxisle_0", text = "A small island and a big camp, just across de water from Zul'Gurub. We chose it so we can watch de city and still sleep with de sea between us and de priests." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xneed = {
      lines = {
        { id = "xxneed_0", text = "Because de Gurubashi priests have bound demselves to loa we cannot fight alone. We are old and proud, but we are few here. Pride does not stop de Soulflayer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    zandalar = { { id = "tp_xzandalar", text = "De first of all trolls. We remember what de others have forgotten." } },
    hakkar = { { id = "tp_xhakkar", text = "De Soulflayer. Every chest I open is one more blade turned against him." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along, and stay out of trouble. I'll know if you don't." },
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
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Do Gurubashi spies really come here?", next = "spies" },
        { text = "You look like you've fought in the city.", next = "city" },
        { text = "Why should outsiders trust the Zandalar?", next = "trust" },
        { text = "How long have you served on Yojamba?", next = "xlong" },
        { text = "What do you do with a caught spy?", next = "xcaught" },
        { text = "Are the Zandalar friendly to strangers?", next = "xstrangers" },
        { text = "I'm a hunter. The jungle is my home too.", next = "BACK", when = { class = "HUNTER" }, reply = "Den you know de jungle has teeth everywhere, hunter. Keep your beast close on dis island, and do not let it chase de crabs." },
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
    xlong = {
      lines = {
        { id = "xxlong_0", text = "Since de first canoes crossed from Zandalar, when de priests of Hakkar began to sing again. Long enough to know de face of every friend on dis isle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcaught = {
      lines = {
        { id = "xxcaught_0", text = "We ask questions first, and we ask dem carefully. Some of my brothers want spies killed on sight, so de Gurubashi learn to fear dis place. What would you do with dem?" },
      },
      choices = {
        { text = "Question them, then show mercy to the young.", next = "BACK", reply = "Mercy. Hm. Young spies grow up to be old ones, stranger.", fx = { align = { light = 1 } } },
        { text = "Kill them on sight. Make the island feared.", next = "BACK", reply = "Fear keeps de beach quiet, yes. But it also keeps it empty.", fx = { align = { light = -1 } } },
      },
    },
    xstrangers = {
      lines = {
        { id = "xxstrangers_0", text = "Friendly enough to de ones who fight Hakkar. De rest we watch. Dere is no shame in being watched, if you have nothing to hide." },
      },
      choices = {
        { text = "What if I do have something to hide?", next = "xhide" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhide = {
      lines = {
        { id = "xxhide_0", text = "Den you will find de Zandalar have long memories and longer spears. I say dis as a friend." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hakkar = { { id = "tp_xhakkar", text = "De blood god. My spear has drunk de blood of his servants many times." } },
    zandalar = { { id = "tp_xzandalar", text = "De first and oldest of de troll peoples. Our island is far, but our reach is long." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. The streets feel a little safer with you walking them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm watching you, so keep your hands where I can see them." },
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
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Why shrink heads at all?", next = "why" },
        { text = "What do you know of the Hakkari priests?", next = "priests" },
        { text = "That's a barbaric practice.", next = "barbaric" },
        { text = "How do you shrink a head?", next = "xhow" },
        { text = "What kind of magic do you use?", next = "xmagic" },
        { text = "Do you enjoy your work?", next = "xenjoy" },
        { text = "I am a shaman. Are we kin in the craft?", next = "BACK", when = { class = "SHAMAN" }, reply = "Close cousins, maybe. You speak to de elements, and I speak to de dead dat are still a little bit listening." },
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
    xhow = {
      lines = {
        { id = "xxhow_0", text = "Dat is a secret of de witch doctors, and you would not sleep well if I told you. I will say dat it takes salt, smoke and a great deal of patience." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmagic = {
      lines = {
        { id = "xxmagic_0", text = "Voodoo, de old kind. Hexes and wards and a few spirits who owe me favours. De Gurubashi spies fear dis camp more dan dey fear de enforcers' spears." },
      },
      choices = {
        { text = "Is voodoo dark magic?", next = "xdark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdark = {
      lines = {
        { id = "xxdark_0", text = "Some outsiders call it dark, and some trolls call it holy. Magic is a blade, and de hand decides what it cuts. Do you agree?" },
      },
      choices = {
        { text = "Magic serves whoever wields it.", next = "BACK", reply = "Yes. Den you understand de heart of voodoo already.", fx = { align = { light = -1 } } },
        { text = "Some magic is foul no matter who wields it.", next = "BACK", reply = "Hmph. Den you would hate Hakkar's priests even more dan I do.", fx = { align = { light = 1 } } },
      },
    },
    xenjoy = {
      lines = {
        { id = "xxenjoy_0", text = "Every head on my belt is one less servant of Hakkar. I do not enjoy de killing, but I enjoy de quiet after it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    voodoo = { { id = "tp_xvoodoo", text = "De oldest magic of de trolls, and de most misunderstood." } },
    hakkar = { { id = "tp_xhakkar", text = "His priests are clever, but deir heads shrink de same as anybody else's." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. I was hoping you'd come by again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Say what you need, and then go." },
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
        { text = "Where does the treasure come from?", next = "xsource" },
        { text = "How did you get into this line of work?", next = "xhistory" },
        { text = "Do Horde and Alliance fight over your chests?", next = "xwar" },
        { text = "I'm a warrior. Is there honour in the Arena?", next = "BACK", when = { class = "WARRIOR" }, reply = "Honour? Ha! There's blood and treasure and a lot of shouting. Take your honour in, by all means, but bring your shield too." },
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
    xsource = {
      lines = {
        { id = "xxsource_0", text = "A gentleman never reveals his sources, friend! Shipwrecks, mostly, and a few deals with folk who'd rather not be named. The Arena gets the leftovers." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhistory = {
      lines = {
        { id = "xxhistory_0", text = "I was a pirate for years until I realised it was more fun to watch other people fight over treasure than to fight myself. Safer too, and the crowd loves it." },
      },
      choices = {
        { text = "Why not just sell it?", next = "xsell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsell = {
      lines = {
        { id = "xxsell_0", text = "Where's the drama in that? A merchant earns coin, but a showman earns legend, and the Gurubashi Arena's the best stage in the jungle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      lines = {
        { id = "xxwar_0", text = "All the time, and that's half the show! Some say I'm stirring up the war for my own amusement. Others say I'm giving the brave a fair shot. What do you think?" },
      },
      choices = {
        { text = "It's a fair shot for anyone brave enough.", next = "BACK", reply = "That's the spirit! The Arena rewards courage, and the occasional lucky fool.", fx = { align = { order = -1 } } },
        { text = "You're making a spectacle of bloodshed.", next = "BACK", reply = "Spectacle? Absolutely! Bloodshed? Only for the clumsy.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    gurubashi_arena = { { id = "tp_xgurubashi_arena", text = "Best seat's on the rim, and the best prize is in the middle. Choose wisely." } },
    booty_bay = { { id = "tp_xbooty_bay", text = "Fine town for a pirate with a reputation. Mind your purse there." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. Come, stay a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep my distance." },
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
        { text = "What did you do before hunting debtors?", next = "xsea" },
        { text = "What does Shaky owe you, exactly?", next = "xowe" },
        { text = "Do you ever forgive a debt?", next = "xforgive" },
        { text = "Are you a sailor from Kul Tiras?", next = "BACK", when = { race = "Human" }, reply = "Kul Tiras, Stormwind, the bottom of the sea, I've called them all home at one time or another. These days it's Booty Bay, God help me." },
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
    xsea = {
      lines = {
        { id = "xxsea_0", text = "I sailed with the merchant fleets and later with men who didn't care much for flags. Twenty years on deck will put salt in your blood and a scowl on your face for good." },
      },
      choices = {
        { text = "Why did you come ashore?", next = "xashore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xashore = {
      lines = {
        { id = "xxashore_0", text = "Knees went, and the captain who owed me wages went down with his ship. I decided I'd rather collect money on land than lose it at sea." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xowe = {
      lines = {
        { id = "xxowe_0", text = "Enough to buy a small boat, which he did, and then lost it. He's been dodging me ever since, and I'm tired of watching him tremble on the docks every time I walk by." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xforgive = {
      lines = {
        { id = "xxforgive_0", text = "Once, for a friend who died before he could pay. Shaky's no friend, though. Some say a man who's lost everything should be let off. What's your view on it?" },
      },
      choices = {
        { text = "A debt's a debt, Mackinley. Collect it.", next = "BACK", reply = "Aye, that's how the sea taught me, and the sea's never wrong.", fx = { align = { honor = 1 } } },
        { text = "He's lost his ship already. Show some mercy.", next = "BACK", reply = "Mercy? Hmph. Maybe. When he's paid half, I'll think about mercy.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    shaky_phillipe = { { id = "tp_xshaky_phillipe", text = "A coward and a debtor, but I'll admit he's a fine sailor when he's sober and calm." } },
    booty_bay = { { id = "tp_xbooty_bay", text = "A goblin port that floats on other people's debts. Suits me fine." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. Come, stay a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep my distance." },
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
        { text = "What happened on that bad voyage?", next = "xvoyage2" },
        { text = "Is there any way out of your debt?", next = "xout" },
        { text = "Do you miss the sea?", next = "xmiss" },
        { text = "I can tell a frightened man. You're safe now.", next = "BACK", when = { class = "PRIEST" }, reply = "Bless you. I'll take that, even from a stranger, because nobody else in this town says it." },
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
    xvoyage2 = {
      lines = {
        { id = "xxvoyage2_0", text = "A storm, a reef and a ship full of Bloodsail Buccaneers who thought we were carrying gold. We weren't. They didn't believe us until half the crew was over the side." },
      },
      choices = {
        { text = "How did you survive?", next = "xsurvive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsurvive = {
      lines = {
        { id = "xxsurvive_0", text = "I hid in a rum barrel for two days. Two days, friend, and I still can't smell rum without shaking. Some sailors call it cowardice. Maybe it was." },
      },
      choices = {
        { text = "Was it cowardice?", next = "xcoward" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcoward = {
      lines = {
        { id = "xxcoward_0", text = "Some say a man ought to fight to the end, and others say living is the whole point. I've argued it with myself every night since. What do you say?" },
      },
      choices = {
        { text = "Living isn't cowardice. You did what you had to.", next = "BACK", reply = "Thank you. I'll sleep a bit better tonight, I think.", fx = { align = { honor = -1 } } },
        { text = "A sailor stands by his crew, whatever comes.", next = "BACK", reply = "Aye. That's what I tell myself, too, and it's why I can't sleep.", fx = { align = { honor = 1 } } },
      },
    },
    xout = {
      lines = {
        { id = "xxout_0", text = "Pay Mackinley, I suppose, but I'd need a ship and a cargo and some luck for that. Or I could leave town, though then I'd never sail from Booty Bay again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmiss = {
      lines = {
        { id = "xxmiss_0", text = "Every day. The sea was the only place I wasn't afraid, before. Now it's the place I'm most afraid of, and I miss it anyway. Funny, isn't it?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    sea_wolf_mackinley = { { id = "tp_xsea_wolf_mackinley", text = "He means well, I think, in a frightening sort of way. Please don't tell him where I am." } },
    bloodsail = { { id = "tp_xbloodsail", text = "Don't say that name too loud. They have friends in town." } },
    background = { { id = "tp_bg", text = "I was a sailor once, a brave one, believe it or not. Now I just try to get through each day." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, honest! Please don't tell anyone I said so." } },
  },
}

-- Elder Starglade: a night elf ancestor-spirit who keeps the Lunar Festival watch outside Zul'Gurub.
P:NPC {
  key = "stv_elder_starglade", id = 15596, name = "Elder Starglade", gender = "male",
  role = "elder", tier = "quest",
  temper = { "calm", "solemn" }, values = { "memory", "vigilance" },
  notices = { "race", "travel" },
  impression = {
    first = "A pale, silver spirit of a kaldorei elder, standing calm before the troll city's gates.",
    third = "{name} honoured Elder Starglade, whose spirit keeps watch before Zul'Gurub at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome, traveller. Few come to these gates with peace in their hearts, so I am glad of the company." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The festival lights burn in Moonglade, and I have come back once more to be remembered. Stay a while, and let us honor the old ways together." },
    { id = "g_back", when = { metBefore = true }, text = "You return to an old spirit's vigil. The moon remembers you, and so do I." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Starglade the Elder") }, text = "You carry the festival's blessing with you. Come, and I will give you what the ancestors give." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" }, text = "A child of the kaldorei, so far from the boughs of Teldrassil. Elune's light finds you even under this jungle." },
    { id = "n_troll", cat = "race", when = { race = "Troll" }, text = "A troll at the gates of Zul'Gurub. I hope you came to mourn this place and not to serve what wakes inside it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Starglade, and once I walked these lands before there were jungles or troll empires to fill them. Now, each year at the turning of the moon, my spirit returns to honour those who honour the old ways." } },
      again = {
        { id = "h_again", text = "Ask what you will. The night is long, and I am in no hurry." },
        { id = "h_again2", text = "Speak on, young one. Spirits have patience in plenty." },
      },
      choices = {
        { text = "Why does your spirit stand here, of all places?", next = "place" },
        { text = "Tell me about the Lunar Festival.", next = "festival" },
        { text = "You must have seen the trolls at their height.", next = "trolls" },
        { text = "Do the kaldorei still honour you, Elder?", next = "kin", when = { race = "NightElf" } },
        { text = "I go in peace, Elder.", next = "END" },
      },
    },
    place = {
      lines = { { id = "p_default", text = "Because the Gurubashi wake their blood god in there, and something old must watch the door. I cannot raise a hand against Hakkar, but I can remember, and remembering is a kind of guard." } },
      choices = {
        { text = "Who is Hakkar?", next = "hakkar" },
        { text = "Then I'll remember with you. Something else.", next = "BACK" },
      },
    },
    hakkar = {
      lines = { { id = "hk_default", text = "The Soulflayer, a god of blood the Gurubashi called into this world long ago. Their own priests once cast him out at great cost, and now the Atal'ai and others would bring him back. The Zandalar on their isle to the north watch it with grave faces.", fx = { learn = { "hakkar" } } } },
      choices = {
        { text = "Then someone should storm the city and end it.", next = "BACK", reply = "Bravely said. Bring many friends, for the Gurubashi do not die easily.", fx = { align = { honor = 1 } } },
        { text = "Let the trolls clean up their own mess.", next = "BACK", reply = "A cold answer, but an honest one. Yet a god of blood does not keep to one people's lands.", fx = { align = { honor = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "At the new year the elders return, and the living seek us out to give thanks and take a coin of blessing. The heart of it lies in Moonglade, where the druids gather and Elune's light is strongest." } },
      choices = {
        { text = "What happens in Moonglade?", next = "moonglade" },
        { text = "I'll come back with the festival's blessing.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Feasting, fireworks and old friends, and on certain nights the ancient Omen stirs beneath the lake. They say it was Elune's light that drove him down long ago, and the rockets remind him of it still." } },
      choices = {
        { text = "Fireworks to fight a demigod? I'd like to see that.", next = "BACK" },
        { text = "A festival for spirits is a gentle thing. Something else.", next = "BACK" },
      },
    },
    trolls = {
      lines = { { id = "t_default", text = "I saw them when they were mighty, and I saw them when they were cruel, and often it was the same day. The Gurubashi raised stone above these trees while my people were still learning their own magic." } },
      choices = { { text = "And now their stone is falling apart.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "Some do, in the old houses, and that is enough for me. Carry my name home to Darnassus, and tell the priestesses that Starglade still keeps watch in the south." } },
      choices = { { text = "I will carry it, Elder. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "An elder of the kaldorei, long dead and still remembered. The moon brings me back each year." } },
    _none = { { id = "tp_none", text = "That I do not know. The living keep their own news, and I keep only memory." } },
  },
}

-- Elder Winterhoof: a tauren ancestor-spirit on the roof of the Booty Bay bank during the Lunar Festival.
P:NPC {
  key = "stv_elder_winterhoof", id = 15576, name = "Elder Winterhoof", gender = "male",
  role = "elder", tier = "quest",
  temper = { "warm", "wry" }, values = { "earth", "memory" },
  notices = { "race" },
  impression = {
    first = "An old tauren spirit sits on the bank roof as if it were a hilltop, watching the harbour.",
    third = "{name} climbed the roofs of Booty Bay to find Elder Winterhoof's spirit at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Ho, you found me. Not many think to climb up here, and fewer manage it without falling into the bay." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "Another Lunar Festival, and another year turned. The ancestors smile on those who seek out their elders." },
    { id = "g_back", when = { metBefore = true }, text = "Back on my roof again, little one? Mind the gulls; they think it belongs to them." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Winterhoof the Elder") }, text = "You have come seeking the elders. Sit a moment, and receive the blessing of the Earth Mother." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "A shu'halo, this far from Mulgore. The Earth Mother walks with her children wherever the sea takes them." },
    { id = "n_goblin", cat = "race", when = { race = "Goblin" }, text = "A goblin come to visit a ghost. Do not look for coin up here, friend; I died with none." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Winterhoof, an elder of my tribe in the days when my people still wandered. When the new year turns, the Earth Mother lets my spirit come back and look upon the world a little while." } },
      again = {
        { id = "h_again", text = "What else, little one? The view is fine and I have nowhere to be." },
        { id = "h_again2", text = "Ask away. The harbour will not mind us talking." },
      },
      choices = {
        { text = "Why a goblin rooftop, Elder?", next = "roof" },
        { text = "What does the Lunar Festival mean to the tauren?", next = "festival" },
        { text = "You lived through the centaur wars, then?", next = "wander" },
        { text = "The Winterhoof still dwell in Mulgore, Elder.", next = "tribe", when = { race = "Tauren" } },
        { text = "Farewell, Elder.", next = "END" },
      },
    },
    roof = {
      lines = { { id = "r_default", text = "Because from here I can see the sea and the jungle both, and the sea is a thing I never saw in life. The goblins below make a great deal of noise, but even they cannot spoil the sunrise." } },
      choices = {
        { text = "What do you think of the goblins?", next = "goblins" },
        { text = "It is a fine view. Something else.", next = "BACK" },
      },
    },
    goblins = {
      lines = { { id = "gb_default", text = "They build and they sell and they never sit still, and they would sell the sky if they could find a buyer. I do not hate them for it. The Earth Mother made the restless ones too." } },
      choices = {
        { text = "Their greed will burn the world one day.", next = "BACK", reply = "Perhaps, if no one keeps them honest. That is a task for the living.", fx = { align = { order = 1 } } },
        { text = "Trade makes the world turn. Good for them.", next = "BACK", reply = "Ha. Spoken like a goblin, though you do not look like one.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is a time to remember those who walked before you. The druids of Moonglade call it a kaldorei feast, but every people honours its dead, and the shu'halo sing for theirs beneath the same moon." } },
      choices = {
        { text = "Who should I seek next?", next = "others" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "There are many of us scattered across the world. Look near the gates of Zul'Gurub in this very jungle; old Starglade keeps his vigil there, though he is a gloomy one." } },
      choices = { { text = "I'll seek him out. Something else.", next = "BACK" } },
    },
    wander = {
      lines = { { id = "w_default", text = "I lived through enough of them to grow tired of the word war. In my day we followed the herds and moved with the seasons, and the centaur followed us like wolves follow kodo." } },
      choices = { { text = "Now Cairne has given your people a home.", next = "BACK" } },
    },
    tribe = {
      lines = { { id = "t_default", text = "Then they have done well, and Cairne Bloodhoof with them. Tell my descendants that their elder sat on a goblin's roof and laughed, and that he was proud of them." } },
      choices = { { text = "I will tell them, Elder. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A tauren elder of the Winterhoof, long gone to the Earth Mother. I come back at the festival to see what my people have made of the world." } },
    _none = { { id = "tp_none", text = "The dead do not hear much gossip, little one. Ask the goblins; they hear everything." } },
  },
}

-- Se'Jib: jungle troll leatherworking master who teaches the Tribal craft near the Mizjah Ruins.
P:NPC {
  key = "stv_sejib", id = 7871, name = "Se'Jib", gender = "male",
  role = "trainer", tier = "quest",
  temper = { "proud", "laconic" }, values = { "craft", "tradition" },
  notices = { "profession", "race" },
  impression = {
    first = "A lean jungle troll works hides at a lonely camp, his knife never stopping.",
    third = "{name} sought out Se'Jib, the troll who teaches Tribal Leatherworking in Stranglethorn.",
  },
  greetings = {
    { id = "g_default", text = "You walk soft for a stranger, mon. Se'Jib is busy, but he can talk while he works." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to Se'Jib. Good. Most who leave this camp do not." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Tribal Leatherworking") }, text = "Ah, you be the one who wants the tribal way. Show Se'Jib you are ready, and he will show you everything." },
  },
  notice = {
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" }, text = "Your fingers be stained and scarred. You work leather, eh? Then we speak the same tongue already." },
    { id = "n_alliance", cat = "faction", when = { faction = "Alliance" }, text = "Alliance in Se'Jib's camp? Se'Jib trains for the Horde, and you be lucky his hands are busy with hides." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Se'Jib teaches the tribal way of leather, the way my fathers did it long before the Horde came to these shores. Hides, bone, feather and paint, and spirit in every stitch." } },
      again = {
        { id = "h_again", text = "What else you want, mon? The hide is drying." },
        { id = "h_again2", text = "Speak quick. Se'Jib's knife be getting bored." },
      },
      choices = {
        { text = "What makes tribal leather different?", next = "craft" },
        { text = "Why work out here, so far from Grom'gol?", next = "camp" },
        { text = "These jungles look dangerous for a lone craftsman.", next = "jungle" },
        { text = "I work leather. Teach me the tribal way.", next = "teach", when = { profession = "Leatherworking" } },
        { text = "What do you hunt for your hides?", next = "ytigers" },
        { text = "Who taught you the tribal way?", next = "ytaught" },
        { text = "Do you get along with the orcs?", next = "yorcs" },
        { text = "I'm a leatherworker. What's your secret?", next = "BACK", when = { profession = "Leatherworking" }, reply = "No secret, mon. Cut with de grain, cure slow, and thank de beast. Most forget de last part." },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    craft = {
      lines = { { id = "c_default", text = "Elemental leather be cut for the storm, and dragonscale for the fight. Tribal leather be made for the hunt, so it bends with you and smells like the jungle and the beasts never know you coming." } },
      choices = {
        { text = "So it's about the hunter, not the hide.", next = "spirit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit = {
      lines = { { id = "s_default", text = "Now you start to understand. The beast gives its skin, so you honour it with good work and no waste. The old loa be watching, and they don't like wasted hides." } },
      choices = {
        { text = "Every part used. That is the right way.", next = "BACK", reply = "Yah. You have a good heart for this.", fx = { align = { order = 1 } } },
        { text = "A hide is a hide. Spirits don't pay.", next = "BACK", reply = "Heh. Then you will make good armour and bad leather, mon.", fx = { align = { order = -1 } } },
      },
    },
    camp = {
      lines = { { id = "cp_default", text = "Grom'gol be full of orcs shouting and wyverns screaming. Out here Se'Jib can hear the river, and the tigers and raptors come right to me for skinning." } },
      choices = { { text = "That's one way to find stock. Something else.", next = "BACK" } },
    },
    jungle = {
      lines = { { id = "j_default", text = "Dangerous for the soft ones. The Bloodscalp and Skullsplitter fight each other in the ruins, and the Gurubashi in the east fight everybody. Se'Jib keeps his head down and his fire small." } },
      choices = { { text = "Then I'll keep mine down too.", next = "BACK" } },
    },
    teach = {
      lines = { { id = "t_default", text = "Se'Jib teaches only the ones who already know the basic cuts well. Master the craft, then come to Se'Jib, and he will teach you to make armour that moves like a panther." } },
      choices = { { text = "I'll prove myself to you. Something else.", next = "BACK" } },
    },
  
    ytaught = {
      lines = {
        { id = "ysejib_ytaught_d", text = "My grandfather, on de Echo Isles, before de Darkspear came to Durotar with Thrall. He made leather from sea-turtle and shark, and he said every hide carry de spirit of de one who wore it. I still hear him when I work." },
        { id = "ysejib_ytaught_v0", when = { race = "Troll" }, text = "My grandfather, on de Echo Isles, cousin. You know de old ways. He said every hide carry de spirit of de one who wore it, and I still hear him when I cut." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yorcs = {
      lines = {
        { id = "ysejib_yorcs_d", text = "Dey be loud, but dey keep deir word. Thrall gave de Darkspear a home when nobody else would, and Se'Jib not forget dat. But de orcs in Grom'gol hunt tigers for sport and leave de hides. Dat Se'Jib cannot forgive." },
      },
      choices = {
        { text = "Should the Horde stop them?", next = "ystop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ystop = {
      lines = {
        { id = "ysejib_ystop_d", text = "Some Darkspear say tell de Warchief, let him punish dem. Others say keep quiet, dis be orc business and de Darkspear be guests. Se'Jib not sure. What you say?" },
      },
      choices = {
        { text = "Tell the Warchief. Waste dishonours everyone.", next = "BACK", reply = "Den Se'Jib will send word, and de loa will see who listens.", fx = { align = { honor = 1 } } },
        { text = "Keep quiet. The Darkspear owe Thrall too much.", next = "BACK", reply = "Maybe. But a debt not make waste right, mon.", fx = { align = { honor = -1 } } },
      },
    },
    ytigers = {
      lines = {
        { id = "ysejib_ytigers_d", text = "De Stranglethorn tigers be fast and proud, and deir hides make de best armour for a hunter who must move quiet. Se'Jib hunts only de old ones, de ones de jungle already let go." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    echo_isles = { { id = "ysejib_tp_echo_isles", text = "De Echo Isles be home, once. De Darkspear left dem, but de spirits stay." } },
    loa = { { id = "ysejib_tp_loa", text = "De loa watch everyting. Even a tanner must keep dem happy." } },

    background = { { id = "tp_bg", text = "Jungle troll, leatherworker, teacher of the tribal way. Nothing more you need to know." } },
    _none = { { id = "tp_none", text = "Se'Jib knows leather and jungle, mon. Ask somebody else about that." } },
  },
}

-- Drunken Bruiser: a goblin bruiser off duty during the festival nights, deep in his cups.
P:NPC {
  key = "stv_drunken_bruiser", id = 15724, name = "Drunken Bruiser", gender = "male",
  role = "guard", tier = "service",
  temper = { "loud", "maudlin" }, values = { "coin" },
  impression = {
    first = "A burly goblin sways on his feet, a bottle in one fist and his club in the other.",
    third = "{name} met a Drunken Bruiser celebrating in Booty Bay.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Go on through, friend; I'll not trouble you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along, and stay out of trouble. I'll know if you don't." },
    { id = "g_default", text = "Heyyy, friend! You look like a friend. Are you a friend? Because I got a club for the other kind." },
    { id = "g_back", when = { metBefore = true }, text = "You again! I remember you. I think. Did I owe you money?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Festival night, pal! The boss says we're off duty till the fireworks stop, so I'm making the most of it." } },
      again = { { id = "h_again", text = "What? Oh, you're still here. Good, good. What was I saying?" } },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Shouldn't a bruiser be keeping the peace?", next = "peace" },
        { text = "What are you celebrating, exactly?", next = "celebrate" },
        { text = "How long have you worked for the Baron?", next = "xyears" },
        { text = "What's the worst trouble you've stopped?", next = "xworst" },
        { text = "Who's the toughest pirate in town?", next = "xpirates" },
        { text = "Goblins and gnomes, eh? Any hard feelings?", next = "BACK", when = { race = "Gnome" }, reply = "Hard feelings? Nah, pal. You build rockets that go up, we build rockets that go boom. Different markets!" },
        { text = "You've had enough. I'm leaving.", next = "END" },
      },
    },
    peace = {
      lines = { { id = "p_default", text = "I am keeping it! Look, nobody's fighting, are they? That's because they all know I'm here, and I'm very scary." } },
      choices = {
        { text = "You can barely stand up.", next = "stand" },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    stand = {
      lines = { { id = "s_default", text = "I can stand fine, it's the dock that's moving. Don't tell Baron Revilgaz, all right? He docks our pay for leaning." } },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", reply = "You're a real pal. A real, real pal.", fx = { align = { order = -1 } } },
        { text = "A guard who drinks on watch deserves the sack.", next = "BACK", reply = "Off watch! Off! Ugh, you sound like my foreman.", fx = { align = { order = 1 } } },
      },
    },
    celebrate = {
      lines = { { id = "c_default", text = "Everything! The fireworks, the free grog, the fact that nobody got eaten by a shark this week. In Booty Bay, that's a holiday all by itself." } },
      choices = { { text = "I'll drink to the sharks going hungry.", next = "BACK" } },
    },
    xyears = {
      lines = {
        { id = "xxyears_0", text = "Eight years with the Blackwater Cartel, pal, and six of 'em on these docks. Before that I hauled crates in Undermine till my back went funny, so this is a step up." },
      },
      choices = {
        { text = "What's the Blackwater Cartel to you?", next = "xcartel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcartel = {
      lines = {
        { id = "xxcartel_0", text = "The Cartel's the Baron's outfit, and the Baron's the law in Booty Bay. You pay your docking fee, you keep your knives sheathed, and nobody gets thrown to the sharks. Simple!" },
      },
      choices = {
        { text = "Does anyone ever get thrown to the sharks?", next = "xsharks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsharks = {
      lines = {
        { id = "xxsharks_0", text = "Once a season, maybe, and only the ones who really earn it. Personally I think it keeps the sharks friendly and the visitors polite. Some folk say it's cruel. What d'you think?" },
      },
      choices = {
        { text = "A port needs hard rules, or it falls apart.", next = "BACK", reply = "Exactly! See, you get it. Order, pal, with teeth.", fx = { align = { order = 1 } } },
        { text = "Feeding folk to sharks is no kind of justice.", next = "BACK", reply = "Huh. Maybe. Don't say that too loud near the Baron, though.", fx = { align = { order = -1 } } },
      },
    },
    xworst = {
      lines = {
        { id = "xxworst_0", text = "A pirate from the Bloodsail tried to light the dock on fire last spring. I tackled him into the water, then remembered I can't swim so good. The other bruisers had to fish us both out." },
      },
      choices = {
        { text = "The Bloodsail come into town?", next = "xbloodsail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbloodsail = {
      lines = {
        { id = "xxbloodsail_0", text = "Not openly, no. They hate the Baron for the tolls and he hates them for the raids. Every now and then one sneaks in with a cutlass and a grudge, and that's when I earn my pay." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpirates = {
      lines = {
        { id = "xxpirates_0", text = "Toughest? Me, obviously, when I'm sober. After me, maybe Fleet Master Firallon, but he's out on the water with the Bloodsail, and he's not invited to the festival." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    booty_bay = { { id = "tp_xbooty_bay", text = "Best town in the world, pal! Sharks, grog and fireworks. What more do you need?" } },
    baron_revilgaz = { { id = "tp_xbaron_revilgaz", text = "The Baron's a fine boss. Pays on time and docks you for leaning. Mostly the second one." } },
    _none = { { id = "tp_none", text = "Huh? No idea, pal. Ask me again when I'm sober, which is tomorrow. Maybe." } },
  },
}

-- Gremnik Rizzlesprang: the ghost of a goblin wizard and smuggler who still haunts Booty Bay.
P:NPC {
  key = "stv_gremnik_rizzlesprang", id = 16123, name = "Gremnik Rizzlesprang", gender = "male",
  role = "ghost", tier = "service",
  temper = { "sly", "bitter" }, values = { "coin", "secrets" },
  impression = {
    first = "A pale goblin ghost drifts by the water, still counting coins he can no longer hold.",
    third = "{name} met the ghost of Gremnik Rizzlesprang, a goblin wizard and smuggler of Booty Bay.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep my distance." },
    { id = "g_default", text = "Oh, you can see me? Wonderful. Nobody's looked me in the eye in ages, and I've got so much to complain about." },
    { id = "g_back", when = { metBefore = true }, text = "Back to visit old Gremnik? I'm touched. Well, I'd be touched if I had anything to touch with." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Gremnik Rizzlesprang, wizard, merchant and importer of goods the Baron didn't need to hear about. Late of Booty Bay, and I do mean late." } },
      again = { { id = "h_again", text = "Still here? Me too. Forever, it seems." } },
      choices = {
        { text = "So you were a smuggler.", next = "smuggle" },
        { text = "How does a wizard end up a ghost?", next = "death" },
        { text = "What were you smuggling, exactly?", next = "xcargo" },
        { text = "Why haven't you moved on?", next = "xstay" },
        { text = "Can I help you rest?", next = "xrest" },
        { text = "A mage should know better than to cast underwater.", next = "BACK", when = { class = "MAGE" }, reply = "Oh, you're a wizard too? Then you know the first rule: never trust a scroll from a pirate. I learned that one late." },
        { text = "What would you do with the gold, anyway?", next = "ygold" },
        { text = "Do you remember being alive?", next = "yalive" },
        { text = "Rest easy, Gremnik.", next = "END" },
      },
    },
    smuggle = {
      lines = { { id = "s_default", text = "Smuggler is such an ugly word. I moved goods quietly past people who wanted a cut, and the cut I saved went into my pocket. It's the goblin way, really." } },
      choices = {
        { text = "Sounds like theft with extra steps.", next = "BACK", reply = "Everything in this town is theft with extra steps, friend.", fx = { align = { order = 1 } } },
        { text = "Clever work. I respect that.", next = "BACK", reply = "Finally, someone with taste.", fx = { align = { order = -1 } } },
      },
    },
    death = {
      lines = { { id = "d_default", text = "Badly, and with a great deal of money still owed to me. Some partners don't like to be cut out of a deal, and some spells don't work as well under water." } },
      choices = {
        { text = "Who killed you?", next = "who" },
        { text = "That's grim. Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Oh, I've a list, and none of them would thank me for saying. This is Booty Bay, friend. You keep your mouth shut, even after it stops breathing." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    xcargo = {
      lines = {
        { id = "xxcargo_0", text = "Oh, the usual. Thorium from the mainland, silk from the elves, a crate of rare reagents for a certain mage who shan't be named. Nothing that ate anybody, mostly." },
      },
      choices = {
        { text = "Mostly?", next = "xmostly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmostly = {
      lines = {
        { id = "xxmostly_0", text = "There was a raptor egg once. Very valuable, very small, and then very large and very hungry. I don't talk about the raptor egg." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xstay = {
      lines = {
        { id = "xxstay_0", text = "Unfinished business, friend! I'm owed four hundred gold by a partner who's still walking about Booty Bay with my coin in his purse. A goblin can't rest with a debt open." },
      },
      choices = {
        { text = "Would you forgive the debt to find peace?", next = "xforgive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforgive = {
      lines = {
        { id = "xxforgive_0", text = "Forgive it? You might as well ask a shark to give up teeth. Still, some ghosts tell me letting go is the only way out. What would you do in my place?" },
      },
      choices = {
        { text = "Let it go, Gremnik. Gold won't follow you anywhere.", next = "BACK", reply = "Hmph. Spoken like someone who isn't owed four hundred gold. Still, I'll think on it.", fx = { align = { honor = 1 } } },
        { text = "Haunt him till he pays every copper.", next = "BACK", reply = "Ha! Now that's a plan with some profit in it. I like you.", fx = { align = { honor = -1 } } },
      },
    },
    xrest = {
      lines = {
        { id = "xxrest_0", text = "Rest? I'd settle for a good chat and a bit of gossip, honestly. The living ignore me, and the other ghosts in this bay are terrible company. All moaning, no business sense." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  
    ygold = {
      lines = {
        { id = "ygremni_ygold_d", text = "Spend it? Can't. Hold it? Can't. But knowing it's mine, friend, that's the part a goblin never stops wanting. I'd give it to my sister in Gadgetzan, maybe, if I could. She never liked me, but she'd like the gold." },
      },
      choices = {
        { text = "Then let her have it.", next = "ysister" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysister = {
      lines = {
        { id = "ygremni_ysister_d", text = "You mean go after my partner and make him pay her instead? That'd mean admitting I'm dead, legally speaking, and goblin law takes a dim view of the dead owning property. I'd have to sign it over. A ghost can't sign." },
      },
      choices = {
        { text = "Find a way. Make the debt do some good.", next = "BACK", reply = "Hmph. You're as bad as the priests. Fine, I'll think about haunting a notary.", fx = { align = { honor = 1 } } },
        { text = "Forget the sister. It's your gold.", next = "BACK", reply = "Now that's a goblin talking! I knew I liked you.", fx = { align = { honor = -1 } } },
      },
    },
    yalive = {
      lines = {
        { id = "ygremni_yalive_d", text = "Bits. The smell of the docks, the weight of a full purse, the feeling of a good deal closing. I don't remember dying, which I'm told is a mercy. I'd rather remember it and know who to haunt." },
        { id = "ygremni_yalive_v0", when = { race = "Scourge" }, text = "Bits, same as you, I'd wager. The docks, a full purse, a deal closing. You lot came back with your bodies, though. I got stuck with the cheap option." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gadgetzan = { { id = "ygremni_tp_gadgetzan", text = "My sister runs a shop in Gadgetzan. She'd sell my ghost to a collector if she could." } },
    ghosts = { { id = "ygremni_tp_ghosts", text = "The other ghosts in this bay are pirates. Terrible conversationalists, worse with money." } },

    booty_bay = { { id = "tp_xbooty_bay", text = "Still the best port on the South Seas. I'd know, for I've drifted through every warehouse in it." } },
    baron_revilgaz = { { id = "tp_xbaron_revilgaz", text = "The Baron never knew half of what came through his docks. That was rather the point." } },
    _none = { { id = "tp_none", text = "If I knew, I'd sell it to you. Since I don't, go ask a living goblin." } },
  },
}

-- Landro Longshot: a well-connected goblin broker in Booty Bay, flanked by hired muscle.
P:NPC {
  key = "stv_landro_longshot", id = 17249, name = "Landro Longshot", gender = "male",
  role = "merchant", tier = "service",
  temper = { "smooth", "guarded" }, values = { "coin", "connections" },
  impression = {
    first = "A sharply dressed goblin with two bodyguards who look bored and dangerous.",
    third = "{name} did business with Landro Longshot, a goblin broker of Booty Bay.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. I was hoping you'd come by again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Make it quick, if you please. I've no time for you." },
    { id = "g_default", text = "Friend! Come in close, the boys won't bite. Landro Longshot, and I deal in the rare and the remarkable." },
    { id = "g_back", when = { metBefore = true }, text = "A returning customer! You see, boys? Quality attracts quality." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "If it's unusual and someone wants it, I can find it, for a price. Fair prices, mind you, because Landro's reputation is worth more than any one deal." } },
      again = { { id = "h_again", text = "What else can Landro do for you, friend?" } },
      choices = {
        { text = "What sort of rare goods?", next = "goods" },
        { text = "Why the bodyguards?", next = "guards" },
        { text = "How did you build your reputation?", next = "xrep" },
        { text = "What's the strangest thing you've sold?", next = "xodd" },
        { text = "Do you trade with both Horde and Alliance?", next = "xsides" },
        { text = "Do you deal with rogues often?", next = "BACK", when = { class = "ROGUE" }, reply = "Every day, friend, and the good ones never tell me their real name. I'd like to keep it that way with you, too." },
        { text = "How did you start out?", next = "ystart" },
        { text = "Ever had a deal go sour?", next = "ysour" },
        { text = "Not today, Landro.", next = "END" },
      },
    },
    goods = {
      lines = { { id = "gd2_default", text = "Curios, trinkets, strange little things from all over the world. Some folk bring me a token and I turn it into something they can hold." } },
      choices = {
        { text = "Where do you get them?", next = "source" },
        { text = "Interesting. Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "s_default", text = "Here and there, and mostly from people who don't want their names on anything. That's the beauty of Booty Bay: the Cartel doesn't ask, and I don't tell." } },
      choices = {
        { text = "Honest dealing beats secrets every time.", next = "BACK", reply = "Sure, sure, and I'm honest about my secrets. That counts.", fx = { align = { order = 1 } } },
        { text = "Sounds like my kind of town.", next = "BACK", reply = "Ha! Stick around, friend. You'll fit right in.", fx = { align = { order = -1 } } },
      },
    },
    guards = {
      lines = { { id = "gd_default", text = "Because the rare and remarkable attract the rude and the stabby. The boys keep conversations polite, and they've never lost me a customer yet." } },
      choices = { { text = "They do look polite. Something else.", next = "BACK" } },
    },
    xrep = {
      lines = {
        { id = "xxrep_0", text = "One deal at a time, and never once breaking a promise. A goblin who welshes on a deal in Booty Bay doesn't stay a goblin for long, he becomes shark bait with a mustache." },
      },
      choices = {
        { text = "And the bodyguards?", next = "xguards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xguards = {
      lines = {
        { id = "xxguards_0", text = "Insurance. Reputation keeps the honest folk honest, and these two keep the dishonest folk thinking hard about it. They're very good at the looking part." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xodd = {
      lines = {
        { id = "xxodd_0", text = "A set of playing cards from Darkmoon that tell your fortune if you shuffle them right. The buyer drew the Death card on the spot and left town that afternoon. I never did learn what happened." },
      },
      choices = {
        { text = "Do you believe in fortunes?", next = "xfate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfate = {
      lines = {
        { id = "xxfate_0", text = "I believe in profit, friend. But I'll admit I've never shuffled that deck myself, which tells you something." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xsides = {
      lines = {
        { id = "xxsides_0", text = "Booty Bay's neutral, and so's my purse. An orc's gold and a human's gold weigh exactly the same on my scale. Some folk think a merchant should pick a side in this war. Do you?" },
      },
      choices = {
        { text = "A merchant should stay out of wars.", next = "BACK", reply = "A sound business mind. You'll do well around here.", fx = { align = { order = -1 } } },
        { text = "Some causes are worth more than profit.", next = "BACK", reply = "Heh. Noble of you. Expensive, but noble.", fx = { align = { order = 1 } } },
      },
    },
  
    ystart = {
      lines = {
        { id = "ylandro_ystart_d", text = "Sweeping floors in a Steamwheedle warehouse in Booty Bay, and noticing what got moved at night. I learned more in those three years than any school could teach, friend, and I never once stole a crate. I only remembered where they went." },
        { id = "ylandro_ystart_v0", when = { race = "Goblin" }, text = "Sweeping floors in a Steamwheedle warehouse, same as half of us. You know how it goes, pal. You learn what moves at night and you remember where it goes." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ysour = {
      lines = {
        { id = "ylandro_ysour_d", text = "Once. A buyer from the Bloodsail paid for a crate of rare tokens with coin that turned out to be lead with a gold skin. My boys found him a week later. He paid me back in full, and he walks with a limp now." },
      },
      choices = {
        { text = "Was the limp necessary?", next = "ylimp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylimp = {
      lines = {
        { id = "ylandro_ylimp_d", text = "In Booty Bay, a reputation is the only thing that keeps you breathing. If I let one cheat go, every pirate in the bay would try it. Some say I'm cruel. I say I'm consistent, and consistency keeps more people alive than kindness." },
      },
      choices = {
        { text = "Consistency keeps order. You did what you had to.", next = "BACK", reply = "Exactly, friend. You understand business better than most.", fx = { align = { order = 1 } } },
        { text = "Cruelty is still cruelty. You could have shown mercy.", next = "BACK", reply = "Mercy's a luxury, pal. I'll buy some when I can afford it.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    bloodsail = { { id = "ylandro_tp_bloodsail", text = "The Bloodsail Buccaneers don't pay their debts. I've learned to take payment up front." } },
    steamwheedle = { { id = "ylandro_tp_steamwheedle", text = "The Steamwheedle Cartel runs Booty Bay. They don't ask questions, and neither do I." } },

    booty_bay = { { id = "tp_xbooty_bay", text = "Best market in the world, if you know who to ask. Usually that's me." } },
    goblins = { { id = "tp_xgoblins", text = "We're a practical people. Steamwheedle keeps the ports open and the deals flowing." } },
    _none = { { id = "tp_none", text = "That's not my line, friend. But if you find something on it, bring it to Landro." } },
  },
}

-- Rebel Watchman: one of the Stormwind deserters keeping watch over the Rebel Camp.
P:NPC {
  key = "stv_rebel_watchman", id = 754, name = "Rebel Watchman", gender = "male",
  role = "guard", tier = "service",
  temper = { "wary", "tired" }, values = { "loyalty", "honour" },
  impression = {
    first = "A weathered soldier in mismatched armour keeps his eyes on the jungle.",
    third = "{name} met a Rebel Watchman guarding the Rebel Camp in northern Stranglethorn.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. The streets feel a little safer with you walking them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along, and stay out of trouble. I'll know if you don't." },
    { id = "g_default", text = "Halt there. You're not a troll and you're not a panther, so I suppose you can pass." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Lieutenant Doren's inside if you've business with him." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Keep your hands where I can see them. We've trouble enough from the jungle without the Horde at our gate." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "We keep watch day and night here, because the Kurzen trolls and the jungle beasts both like a stray soldier for supper." } },
      again = { { id = "h_again", text = "Anything else? Quick, I'm meant to be watching the tree line." } },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Why do they call this the Rebel Camp?", next = "rebels" },
        { text = "Who are the Kurzen?", next = "kurzen" },
        { text = "Where did you serve before this?", next = "xpast" },
        { text = "How do you hold this camp?", next = "xhold" },
        { text = "What do you think of Stormwind now?", next = "xstorm" },
        { text = "Do you ever see Horde scouts here?", next = "BACK", when = { faction = "Horde" }, reply = "We see them, and they see us, and mostly we both decide the jungle's dangerous enough already. Don't make me regret that." },
        { text = "Do you ever think of going home?", next = "yhome" },
        { text = "Who leads the camp now?", next = "ylead" },
        { text = "A soldier of Stormwind salutes you.", next = "BACK", when = { race = "Human" }, reply = "Then you're braver than most who'd salute a rebel. Thank you, friend. It matters more than you'd think." },
        { text = "Stay sharp, soldier.", next = "END" },
      },
    },
    rebels = {
      lines = { { id = "r_default", text = "We served under Colonel Kurzen, sent south by Stormwind to fight the trolls. When he turned his men into something foul with troll magic and madness, Lieutenant Doren and the rest of us walked away." } },
      choices = {
        { text = "Then Stormwind calls you deserters?", next = "deserters" },
        { text = "That took courage. Something else.", next = "BACK" },
      },
    },
    deserters = {
      lines = { { id = "d_default", text = "Some in Stormwind do, aye, and it stings. We never left our duty; we left a madman, and we've been fighting his men ever since." } },
      choices = {
        { text = "Orders are orders. You broke your oath.", next = "BACK", reply = "Then you never had a commander like Kurzen. Pray you never do.", fx = { align = { order = 1 } } },
        { text = "You did right to leave him.", next = "BACK", reply = "Thank you. We don't hear that often.", fx = { align = { order = -1 } } },
      },
    },
    kurzen = {
      lines = { { id = "k_default", text = "Kurzen's men, the ones who stayed, hold the compound east of here. They've gone half wild, and they've jungle trolls fighting at their side now." } },
      choices = { { text = "I'll keep clear of the east. Something else.", next = "BACK" } },
    },
    xpast = {
      lines = {
        { id = "xxpast_0", text = "Colonel Kurzen's company, sent from Stormwind to train the Stranglethorn natives. The colonel went strange in this heat, and the men who wouldn't follow him walked off with Sergeant Yohwa." },
      },
      choices = {
        { text = "Strange how?", next = "xkurzen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xkurzen2 = {
      lines = {
        { id = "xxkurzen2_0", text = "He started talking to shadows and taking orders from them, or so it looked to us. Folk say the shadow priests got into his head. I only know that the men who stayed with him aren't the men I trained beside." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhold = {
      lines = {
        { id = "xxhold_0", text = "Palisades, a good fire, and sleeping in shifts. We're short of arrows and shorter of medicine, so we trade with Booty Bay when we can spare a man for the walk." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xstorm = {
      lines = {
        { id = "xxstorm_0", text = "Stormwind calls us deserters, and maybe that's fair by the letter of it. But we didn't desert the kingdom, we deserted a madman. Was that right, or should we have stayed and obeyed?" },
      },
      choices = {
        { text = "You did right. No oath binds you to madness.", next = "BACK", reply = "Thank you. Some nights I need to hear that more than I'd like.", fx = { align = { order = -1 } } },
        { text = "An oath is an oath. You should have stayed.", next = "BACK", reply = "Then you'd have watched us turn into what Kurzen's men are now.", fx = { align = { order = 1 } } },
      },
    },
  
    yhome = {
      lines = {
        { id = "yrebelw_yhome_d", text = "Every night. I've a wife in Goldshire, if she's still waiting. I wrote her once, through a Booty Bay trader, and never heard back. Maybe the letter never reached her. Maybe it did." },
      },
      choices = {
        { text = "Would Stormwind take you back?", next = "yback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yback = {
      lines = {
        { id = "yrebelw_yback_d", text = "They'd hang me, more likely, or put me in the Stockade. Some of the men want to march home and face it, tell the truth and take whatever comes. Others say we stay here until Kurzen's dead and we've proved ourselves." },
      },
      choices = {
        { text = "March home and tell the truth.", next = "BACK", reply = "Brave words. Maybe when Kurzen's gone, I'll find the courage to take them.", fx = { align = { honor = 1 } } },
        { text = "Stay and finish the job first.", next = "BACK", reply = "Aye. That's what most of us believe. Kurzen first, then home.", fx = { align = { honor = -1 } } },
      },
    },
    ylead = {
      lines = {
        { id = "yrebelw_ylead_d", text = "Lieutenant Doren, who led us out of Kurzen's compound. He's young but steady, and he's never once asked a man to do something he wouldn't do himself. I'd follow him into the Gurubashi ruins." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    doren = { { id = "yrebelw_tp_doren", text = "Lieutenant Doren leads the camp. He's the reason we're still alive." } },
    goldshire = { { id = "yrebelw_tp_goldshire", text = "Goldshire's home. The Lion's Pride Inn, and a wife who may not remember my face." } },

    kurzen = { { id = "tp_xkurzen", text = "The colonel was a good officer once. That's what makes it hard." } },
    stormwind = { { id = "tp_xstormwind", text = "Home, once. I'd go back if they'd have me without a noose." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Lieutenant Doren; he knows more than I do." } },
  },
}

-- Ziggle Sparks: Booty Bay's holiday fireworks seller.
P:NPC {
  key = "stv_ziggle_sparks", id = 8116, name = "Ziggle Sparks", gender = "male",
  role = "vendor", tier = "service",
  temper = { "excitable", "singed" }, values = { "coin", "spectacle" },
  impression = {
    first = "A goblin with singed eyebrows and a cart of rockets that hums faintly.",
    third = "{name} bought fireworks, or nearly did, from Ziggle Sparks in Booty Bay.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
    { id = "g_default", text = "Step right up! Rockets, crackers, sparklers, and nothing in my stock has exploded early in, oh, days!" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more boom? Nice! Mind the cart, it's a little warm." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Ziggle Sparks, holiday fireworks, the finest in Booty Bay. When there's a festival, there's a sky to fill, and I fill it!" } },
      again = { { id = "h_again", text = "Anything else? I've got a fuse burning somewhere, I'm sure of it." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Are these things safe?", next = "safe" },
        { text = "What happened to your eyebrows?", next = "brows" },
        { text = "Where do you buy your powder?", next = "xpowder" },
        { text = "What's your best firework?", next = "xbest" },
        { text = "Have you ever had an accident?", next = "xaccident" },
        { text = "A gnome would make these quieter.", next = "BACK", when = { race = "Gnome" }, reply = "Quieter? Why would anybody want quieter? Go build your silent rockets in Ironforge, pal, and leave the noise to the professionals." },
        { text = "Who taught you pyrotechnics?", next = "yteach" },
        { text = "What's the biggest show you've ever done?", next = "yshow" },
        { text = "I'll pass for now.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Safe is a relative word, pal. Point them up, stand back, and don't light them near the powder kegs on the docks, and you'll be fine." } },
      choices = {
        { text = "Fireworks in a wooden town? That's reckless.", next = "BACK", reply = "Reckless? It's tradition! Mostly reckless tradition.", fx = { align = { order = 1 } } },
        { text = "Give me the biggest one you've got.", next = "BACK", reply = "Now that's a customer! Just sign this waiver first.", fx = { align = { order = -1 } } },
      },
    },
    brows = {
      lines = { { id = "b_default", text = "Product testing, pal! Every rocket I sell, I've lit one just like it, so you know it works." } },
      choices = {
        { text = "That's oddly reassuring.", next = "test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test = {
      lines = { { id = "t_default", text = "It should be! My cousin skipped the testing once, and now the Steamwheedle won't let him near anything sharper than a spoon." } },
      choices = { { text = "Good to know. Something else.", next = "BACK" } },
    },
    xpowder = {
      lines = {
        { id = "xxpowder_0", text = "Kezan blackpowder, imported at great expense and greater risk. You don't want to know what's in the blue rockets, and I don't want to remember either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbest = {
      lines = {
        { id = "xxbest_0", text = "The Big Red Rocket. It goes up like a dragon and comes down like rain, and once it scared every bird out of Stranglethorn for an entire day." },
      },
      choices = {
        { text = "Were the birds all right?", next = "xbirds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbirds = {
      lines = {
        { id = "xxbirds_0", text = "They came back eventually. The Baron fined me for the noise. Some folk say a fireworks seller ought to be careful, and some say a good show's worth the risk. Which are you?" },
      },
      choices = {
        { text = "A good show is worth a little risk.", next = "BACK", reply = "Exactly! The crowd agrees, and so does my purse.", fx = { align = { order = -1 } } },
        { text = "Careful work keeps everyone's eyebrows on.", next = "BACK", reply = "Bah. You sound like the Baron. Still, fair point.", fx = { align = { order = 1 } } },
      },
    },
    xaccident = {
      lines = {
        { id = "xxaccident_0", text = "Plenty. These eyebrows are on their third growth. But I've never lost a customer, only a few hats and a wagon or two." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  
    yteach = {
      lines = {
        { id = "yziggle_yteach_d", text = "My uncle Bizzle, on Kezan, before he got exploded. He said a goblin who can make the sky pretty can make his purse heavy, and he was right, until the day he wasn't. I keep his lucky fuse in my pocket." },
        { id = "yziggle_yteach_v0", when = { race = "Goblin" }, text = "My uncle Bizzle, back on Kezan, before he got exploded. You know how it goes. I keep his lucky fuse in my pocket, unlit, for respect." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yshow = {
      lines = {
        { id = "yziggle_yshow_d", text = "The Baron's birthday, three years back. I lit the whole sky over the bay, red, gold and green. Every pirate stopped fighting to watch. The Baron paid me double, then fined me for the scorch marks on his balcony." },
      },
      choices = {
        { text = "Should you charge less for the risk?", next = "ycharge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycharge = {
      lines = {
        { id = "yziggle_ycharge_d", text = "Less? Pal, the risk is the price. Some folk say a merchant should warn buyers what can go wrong. Others say a buyer who wants fireworks already knows. I say a little mystery sells more rockets." },
      },
      choices = {
        { text = "Warn your buyers. It's the honest thing.", next = "BACK", reply = "Fine, fine. I'll print a warning. Very small print.", fx = { align = { honor = 1 } } },
        { text = "Mystery sells. Keep it quiet.", next = "BACK", reply = "That's the goblin way! You'd make a fine salesman.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    kezan = { { id = "yziggle_tp_kezan", text = "Kezan's home, the goblin island. Loud, smoky, and full of explosions. I miss it." } },
    baron = { { id = "yziggle_tp_baron", text = "Baron Revilgaz pays well and fines better. Watch his balcony." } },

    fireworks = { { id = "tp_xfireworks", text = "The finest in Booty Bay, and the loudest too." } },
    booty_bay = { { id = "tp_xbooty_bay", text = "Best town in the world for a goblin with fire in his blood." } },
    _none = { { id = "tp_none", text = "No idea, pal! But I bet it'd look great with a rocket going off behind it." } },
  },
}

-- Servant of the Hand: Zandalari warriors attending Molthor, the Hand of Rastakhan, on Yojamba Isle.
P:NPC {
  key = "stv_servant_of_the_hand", id = 15080, name = "Servant of the Hand", title = "Hand of Rastakhan", gender = "male",
  role = "guard", tier = "service",
  communities = { "zandalar" }, temper = { "stern", "solemn" }, values = { "duty", "tradition" },
  notices = { "race" },
  impression = {
    first = "A towering Zandalari troll in ceremonial armour watches you from beside Molthor's fire.",
    third = "{name} spoke with one of the Zandalari who serve the Hand of Rastakhan on Yojamba Isle.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're welcome here, and I'll tell the others so if they ask." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm watching you, so keep your hands where I can see them." },
    { id = "g_default", text = "De Zandalarian trolls have traveled far and suffered much to reach dis place, stranger, but to do nothing is to invite our doom." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" }, text = "Darkspear. You are far from de old ways, but de blood remembers, and so do we." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I serve Molthor, who is de Hand of King Rastakhan, and I guard his fire while he gathers blades against de Soulflayer. If you have come to help, speak to de Hand, and if you have come to stare, stare quickly." } },
      again = { { id = "h_again", text = "You have more to say? Say it, and den let me return to my watch." } },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What is the Soulflayer?", next = "hakkar" },
        { text = "Why do the Zandalar fight other trolls?", next = "gurubashi" },
        { text = "Who is Molthor?", next = "xmolthor" },
        { text = "What happens if Hakkar wins?", next = "xwins" },
        { text = "A Darkspear stands with you, brother.", next = "BACK", when = { race = "Troll" }, reply = "Den stand tall, Darkspear. De Zandalar remember every tribe dat answers when de blood god calls." },
        { text = "Have you fought Hakkar's priests before?", next = "yfought" },
        { text = "Do you miss Zandalar?", next = "ymiss" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    hakkar = {
      lines = { { id = "hk_default", text = "Hakkar, de blood god, who de Gurubashi once worshipped and once cast out, at de cost of their empire. Now his priests have called him back into Zul'Gurub, and if he walks free, he will drink dis whole world dry.", fx = { learn = { "hakkar" } } } },
      choices = { { text = "Then he must be stopped. Something else.", next = "BACK" } },
    },
    gurubashi = {
      lines = { { id = "gu_default", text = "De Zandalar are de first of all trolls, de priests and keepers of de oldest ways, and when our children go astray it falls to us to correct dem. We do not enjoy it, but we do not shirk it either." } },
      choices = {
        { text = "Do you trust outsiders to help you?", next = "outsiders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    outsiders = {
      lines = { { id = "o_default", text = "Trust is a word for kin. We need blades, and you have one, and dat is enough for now, but de Hand will be watching what you do with it." } },
      choices = {
        { text = "Then I'll prove myself with deeds.", next = "BACK", reply = "Good. Deeds are de only words de Zandalar hear.", fx = { align = { honor = 1 } } },
        { text = "I fight for the reward, not your trust.", next = "BACK", reply = "Den you will be paid, and nothing more.", fx = { align = { honor = -1 } } },
      },
    },
    xmolthor = {
      lines = {
        { id = "xxmolthor_0", text = "Molthor is de Hand of Rastakhan, sent from Zandalar to gather de champions who will go into Zul'Gurub. When he speaks, de King speaks, so mind your words before him." },
      },
      choices = {
        { text = "What is your duty?", next = "xduty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xduty = {
      lines = {
        { id = "xxduty_0", text = "To keep his fire lit and his back guarded. Many Gurubashi would pay well for de Hand's head, and some of dem walk dis beach pretending to be traders." },
      },
      choices = {
        { text = "How do you tell them apart?", next = "xspot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xspot = {
      lines = {
        { id = "xxspot_0", text = "By de eyes, mostly. A trader looks at your goods, and a spy looks at your back. Some of my brothers would cut down any Gurubashi who comes close. I am not so quick. Who is right?" },
      },
      choices = {
        { text = "Better to strike first than lose the Hand.", next = "BACK", reply = "Dat is de warrior's way. It is not always wrong.", fx = { align = { honor = -1 } } },
        { text = "Strike only when you are sure. Honour demands it.", next = "BACK", reply = "Yes. De innocent Gurubashi are still our cousins.", fx = { align = { honor = 1 } } },
      },
    },
    xwins = {
      lines = {
        { id = "xxwins_0", text = "Den de jungle will run red, and after de jungle, every shore of dis sea. Hakkar does not stop at one feast. Dat is why de Zandalar came, and why you should care." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  
    yfought = {
      lines = {
        { id = "yservan_yfought_d", text = "On de shore below Zul'Gurub, two moons ago. A Hakkari priest called blood from my brother's veins with a word. I killed de priest, but my brother did not wake. I carry his blade now, beside my own." },
      },
      choices = {
        { text = "Do you seek revenge?", next = "yrevenge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yrevenge = {
      lines = {
        { id = "yservan_yrevenge_d", text = "De Hand says revenge clouds de eye, and a clouded eye misses de true enemy. But my brother's blood still be on dat shore. Some Zandalar say a warrior's grief must be fed. Others say it must be starved." },
      },
      choices = {
        { text = "Feed it. Your brother deserves vengeance.", next = "BACK", reply = "Den I will carry his blade into Zul'Gurub, and it will drink first.", fx = { align = { honor = 1 } } },
        { text = "The Hand is right. Starve it, and see clearly.", next = "BACK", reply = "You speak like Molthor. Maybe you both be right.", fx = { align = { honor = -1 } } },
      },
    },
    ymiss = {
      lines = {
        { id = "yservan_ymiss_d", text = "Every day. De island has temples older dan any city of de younger races, and de sea dere is clear as glass. When dis war be done, I will go home and tell my mother how her son died." },
        { id = "yservan_ymiss_v0", when = { race = "Troll" }, text = "Every day. You be troll, so maybe someday you see it, de temples and de clear sea. When dis war be done, I go home and tell my mother how her son died." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    molthor = { { id = "yservan_tp_molthor", text = "Molthor be de Hand of Rastakhan. When he speaks, de King speaks." } },
    zul_gurub = { { id = "yservan_tp_zul_gurub", text = "Zul'Gurub be de old Gurubashi capital. Hakkar's priests hold it now, and de jungle bleeds." } },
 _none = { { id = "tp_none", text = "Dat is not for me to answer. Ask de Hand, if he will hear you." } } },
}
