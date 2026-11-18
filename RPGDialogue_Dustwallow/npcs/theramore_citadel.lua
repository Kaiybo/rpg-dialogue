-- Foothold Citadel and the Theramore workshops: Commander Samaul (The Missing Diplomat), Caz Twosprocket
-- (The Black Shield) and Torq Ironblast (gunsmith). Voice: bibles/theramore_citadel.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Commander Samaul
---------------------------------------------------------------------------
P:NPC {
  key = "samaul", id = TODO_NPC("Commander Samaul"), name = "Commander Samaul",
  bible = "bibles/theramore_citadel.md", role = "soldier", tier = "quest",
  communities = { "theramore" }, temper = { "stern", "fair" }, values = { "duty", "order" },
  notices = { "race", "class" },

  impression = {
    first = "Commander Samaul runs the Theramore Guard from Foothold Citadel, and he looks at every visitor as a disturbance he will have to write up later. He is stern, but he listens, and he doesn't like being kept in the dark.",
    third = "{name} met Commander Samaul, commander of the Theramore Guard in Foothold Citadel.",
  },

  greetings = {
    { id = "g_hello", text = "State your business. I've a garrison to run and a marsh full of trouble to keep out of it." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "You're still looking into Hendel, I take it. I'd like to know what you find, all of it." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Missing Diplomat") }, text = "I've read the report about Hendel three times now. It reads worse every time." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. The Lady's guard could use a few more of your kind, if you ever tire of wandering." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You carry yourself like a soldier. Whose army trained you, and why aren't you still in it?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Commander Samaul, of the Theramore Guard. I command the soldiers who hold this isle and the towers along the road, and I have a duty to protect these lands from anything that would disturb them, visitors included." },
        { id = "h_diplomat", when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "Hendel? Yes, I know the man, but why would you need one of my soldiers? Elling Trias sent you, did he? Then your business is troubling, or he'd not have sent you to me first. Hendel was stationed at Sentry Point, the first tower outside Theramore. Be cautious." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Missing Diplomat"), days = 5 } },
          text = "One of my own soldiers, mixed up in this. I'll be going through every name on the roster myself, {name}, and I won't be gentle about it." },
        { id = "h_alliance", when = { race = "Human" },
          text = "From Stormwind? We get fewer of you than you'd think. Theramore was built by Lordaeron's survivors and Kul Tirans, and we've had to learn to trust Stormwind's people one at a time." },
      },
      again = {
        { id = "h_again", text = "Anything else? Be brief." },
        { id = "h_again2", text = "Go on. I'm listening, for the moment." },
      },
      choices = {
        { text = "What sort of man is Private Hendel?", next = "hendel" },
        { text = "What threatens Theramore most?", next = "threats" },
        { text = "How do you deal with deserters?", next = "deserters" },
        { text = "What do you think of the Lady's peace with the Horde?", next = "peace" },
        { text = "I'm looking into Hendel.", next = "BUSINESS" },
        { text = "I'll not keep you, Commander.", next = "END" },
      },
    },

    hendel = {
      lines = {
        { id = "he_default", text = "Steady, quiet, never late to his watch, which is more than I can say for most. He asked for Sentry Point himself, and I thought it was because he liked the quiet." },
        { id = "he_done", when = { questDone = TODO_QUEST("The Missing Diplomat") }, text = "I thought I knew him. He asked for Sentry Point himself, and now I know why he wanted a tower where nobody would be watching him." },
      },
      choices = {
        { text = "Do you trust your soldiers?", next = "hendel_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hendel_trust = {
      big = true,
      lines = { { id = "ht_default", text = "I have to, or I can't command them. But if one of mine has turned, I'll have to start asking every man on this isle where he goes at night, and a garrison that's watched that closely starts to rot from the inside." } },
      choices = {
        { text = "Watch them all. Better safe than betrayed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trust your men. Suspicion does more harm.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    threats = {
      lines = { { id = "th_default", text = "The Stonemaul ogres in the marsh, the black dragonspawn in the south, the Grimtotem on the road west, and whoever burned the Shady Rest Inn. I'd add the marsh itself, which has killed more of my soldiers than all the rest put together." } },
      choices = {
        { text = "The marsh kills soldiers?", next = "threats_marsh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    threats_marsh = {
      lines = { { id = "tm_default", text = "Fever, crocolisks, bad water and worse footing. A soldier who survived the Third War steps off a path in the fog and we find his helmet a week later. Tell your friends to stay on the road." } },
      choices = {
        { text = "I'll keep to the road.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    deserters = {
      lines = { { id = "de_default", text = "Too often, lately. Men slip away from the towers and don't come back, and I hear they're gathering out at the old ruins in the marsh. Captain Vimes takes those reports; I sign them, and I don't enjoy it." } },
      choices = {
        { text = "Why do they desert?", next = "deserters_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deserters_why = {
      lines = { { id = "dw_default", text = "Some say it's the marsh, and some say it's the peace, that they didn't cross the sea to stand guard over orcs. And some never needed a reason, only a gap in the fence." } },
      choices = {
        { text = "Desertion is betrayal.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Some had good reasons.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },

    peace = {
      lines = { { id = "pe_default", text = "My opinion is that the Lady made it, and my job is to keep it. In private I'll say this much: I've buried soldiers from both wars, and I don't care to dig any more graves if I can help it." } },
      choices = {
        { text = "That's a soldier's wisdom.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The garrison, the towers, the roster, and who's late for his watch." } },
    background = { { id = "tp_bg", text = "A soldier of Lordaeron who followed the Lady west, and now I run her guard." } },
    _none = { { id = "tp_none", text = "That's not a matter for the Guard. Ask the archmage, or the captain." } },
  },
}

---------------------------------------------------------------------------
-- Caz Twosprocket
---------------------------------------------------------------------------
P:NPC {
  key = "caz", id = TODO_NPC("Caz Twosprocket"), name = "Caz Twosprocket",
  title = "Engineering Trainer",
  bible = "bibles/theramore_citadel.md", role = "trainer", tier = "quest",
  communities = { "theramore" }, temper = { "chatty", "restless" }, values = { "craft", "curiosity" },
  notices = { "race", "craft" },

  impression = {
    first = "Caz Twosprocket is a gnome engineer who is also, rather to everyone's surprise, one of Theramore's best smiths. He is bored, and when he's bored he talks, and when he talks he draws on whatever's nearest.",
    third = "{name} met Caz Twosprocket, Theramore's gnome engineer and smith.",
  },

  greetings = {
    { id = "g_hello", text = "Hello, hello! You're not an engineer, are you? Please say you're an engineer." },
    { id = "g_shield", when = { questActive = TODO_QUEST("The Black Shield") }, text = "Is that the shield? Bring it here, bring it here, I've been dying for something interesting." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Oh, splendid; finally someone who'll understand when I say my gear ratios are sulking." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another gnome, out here in the swamp! Were you in Gnomeregan when it happened? No, don't answer, not yet, I'll get maudlin." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Caz Twosprocket, engineer, smith, and Theramore's resident tinkerer. The garrison's engines are nearly finished, which means I'm nearly out of work, which means I'm getting a little bit bored, if I'm honest." },
        { id = "h_shield", when = { questActive = TODO_QUEST("The Black Shield") },
          text = "Ah, I almost missed this! The leather strap on the back has been burned off, but look at the fittings: it was made to sit on a very big arm. A tauren's, I'd guess. Tell Captain Vimes I'm sorry I can't tell him more than that." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("The Black Shield") },
          text = "Did the captain make anything of the shield? I keep thinking about those fittings. Tauren smithing, I'm nearly sure, but tauren don't usually paint their shields black." },
        { id = "h_eng", when = { profession = "Engineering" },
          text = "A fellow engineer! Sit down, sit down, I'll show you the schematics I'm not supposed to show anyone, and then I'll teach you whatever you've come for." },
      },
      again = {
        { id = "h_again", text = "What else? I've time; I've far too much time." },
        { id = "h_again2", text = "Ask away! Questions are the second-best cure for boredom." },
      },
      choices = {
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "A gnome who smiths?", next = "smith" },
        { text = "What engines are you building?", next = "engines" },
        { text = "What did you see in that shield?", next = "shield" },
        { text = "How did you end up in Theramore?", next = "how" },
        { text = "Good luck with the boredom, Caz.", next = "END" },
      },
    },

    smith = {
      lines = { { id = "sm_default", text = "Every engineer has to make his own parts eventually, and somewhere along the way I got rather good at it. Piter and Hans pretend not to mind, but I've seen Hans measuring my work when he thinks I'm not looking." } },
      choices = {
        { text = "Is it better than theirs?", next = "smith_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith_better = {
      lines = { { id = "sb_default", text = "Different, let's say, because I build things to move and they build things to stop moving things. Between the three of us, Theramore's very well equipped, and very well argued over." } },
      choices = {
        { text = "A good rivalry.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    engines = {
      lines = { { id = "en_default", text = "Siege engines, for the walls, in case anything ever comes across the marsh that the guards can't handle. The Lady signed the order, though she didn't look happy about it." } },
      choices = {
        { text = "Why wasn't she happy?", next = "engines_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    engines_why = {
      big = true,
      lines = { { id = "ew_default", text = "Because she's trying to keep a peace, and nothing says peace like a catapult pointed at Brackenwall. The captain says it's prudence; the archmage says it's an invitation." } },
      choices = {
        { text = "The captain's right. Be ready for war.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "The archmage is right. Weapons invite war.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shield = {
      lines = {
        { id = "sh_default", text = "Haven't seen it yet, but the captain's been muttering about a black shield found at the burned inn. If somebody brings it to me, I'll tell them everything the metal knows." },
        { id = "sh_seen", when = { questDone = TODO_QUEST("The Black Shield") }, text = "Big, heavy, crudely riveted, and painted black over older paint. Made for a tauren, I'd bet my workbench, but the black was added later by somebody else." },
      },
      choices = {
        { text = "Somebody's framing the Horde.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    how = {
      lines = { { id = "ho_default", text = "I came over on a supply ship to fix the harbor crane, and the harbor crane is still broken, because every time I fix it, somebody asks me to fix something else. That was four years ago." } },
      choices = {
        { text = "So the crane's still broken?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Gears, springs, rivets, and roughly everything else that clicks." } },
    background = { { id = "tp_bg", text = "Gnomish engineer, accidental smith, and the man the harbor crane forgot.", next = "how" } },
    gnomeregan = { { id = "tp_gnomer", text = "I'd rather not talk about it, if that's all the same, because I had friends there." } },
    _none = { { id = "tp_none", text = "No idea! But if it has moving parts, bring it here and I'll find out." } },
  },
}

---------------------------------------------------------------------------
-- Torq Ironblast
---------------------------------------------------------------------------
P:NPC {
  key = "torq", id = TODO_NPC("Torq Ironblast"), name = "Torq Ironblast",
  title = "Gunsmith",
  bible = "bibles/theramore_citadel.md", role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "gruff", "proud" }, values = { "craft", "memory" },
  notices = { "race", "class" },

  impression = {
    first = "Torq Ironblast is a grizzled dwarf gunsmith in Foothold Citadel who tests every barrel with his ear before he'll sell it. He fought in the Third War, and he still talks about the orcs the way a man talks about a storm that took his roof.",
    third = "{name} met Torq Ironblast, the dwarven gunsmith of Foothold Citadel.",
  },

  greetings = {
    { id = "g_hello", text = "Guns, powder, an' a bit o' good advice. Two o' those cost money." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter! Let's see that rifle, lad. Aye, it's been dragged through the marsh, I can smell it." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ironforge, is it? Ye'll know a proper barrel when ye see one, then, an' ye'll not haggle like a human." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Torq Ironblast, gunsmith to the Theramore Guard an' anyone else wi' coin. Best guns this side o' the sea, an' I'll fight any gnome who says different." },
      },
      again = { { id = "h_again", text = "What else, then?" } },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "You fought in the Third War?", next = "war" },
        { text = "Any advice for the marsh?", next = "marsh" },
        { text = "I saw you listening to that barrel like it could talk.", next = "ear" },
        { text = "What do you make of Caz Twosprocket?", next = "caz" },
        { text = "Which hold did ye learn yer trade in?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "So you'll fight any gnome? Here I am.", next = "gnome", when = { race = "Gnome" } },
        { text = "What should a hunter carry in this swamp?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Farewell, Torq.", next = "END" },
      },
    },
    ear = {
      lines = { { id = "ea_default", text = "It can talk, if ye know how tae listen! Tap a good barrel an' it rings clean, like a bell at the Great Forge, but a cracked one goes dull an' sour, an' I'll not sell a gun that's lyin' tae me." } },
      choices = {
        { text = "Who taught you that trick?", next = "ea_teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ea_teacher = {
      lines = { { id = "eat_default", text = "An old gunsmith in the Military Ward back in Ironforge, deaf in one ear from his own work an' still the best listener I ever met. He used tae say a dwarf who cannae hear his barrel deserves what it does tae him." } },
      choices = {
        { text = "Do you miss Ironforge?", next = "ea_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ea_home = {
      lines = { { id = "eah_default", text = "Every time it rains, which here is every day. But I came over wi' the Alliance in the war an' stayed when the Lady built her walls, an' a dwarf finishes what he starts, even if it's a swamp." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "theramore" } } } },
    },
    caz = {
      lines = { { id = "cz_default", text = "Ha! A clever wee gnome who builds siege engines that never see a siege, an' calls my rifles 'charmingly primitive'. I call his engines kindling, so we're even, an' we drink together on a Friday." } },
      choices = {
        { text = "Guns or engines, which wins a war?", next = "cz_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cz_war = {
      lines = { { id = "czw_default", text = "Engines knock down walls, I'll grant him that, but walls don't win wars, lads wi' rifles do. Ye'll want both, if the peace ever breaks, an' I pray tae the stone it doesnae." } },
      choices = {
        { text = "A strong army keeps the peace. Build the engines.", next = "BACK", fx = { align = { order = 1 } },
          reply = "Aye, that's Caz's argument too. Dinnae tell him ye agree." },
        { text = "Engines are a threat. They invite the war they're built for.", next = "BACK", fx = { align = { order = -1 } },
          reply = "Tervosh says the same. Maybe the both o' ye are right." },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Ironforge, Military Ward, under a master who'd box yer ears for a crooked sight. Ye'll know the type, {g:lad|lass}, every one o' us had one. Mind ye bring yer rifle tae me before ye go intae the marsh, an' I'll listen tae it for free." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Ha! Ye've more nerve than height, I'll give ye that. It's a figure o' speech, wee one, mostly aimed at Caz, so put yer wrench away an' I'll show ye what a proper rifle looks like." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Twice the shot ye think ye'll need, oilcloth for the powder, an' a spare bowstring if ye shoot a bow, which I'll forgive. The crocolisks out past the Den have hides like a tavern door, so aim for the eye." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    war = {
      lines = { { id = "wa_default", text = "Aye, in the Stonetalon Mountains, holdin' a post when the Warsong came through. Grom Hellscream's lot hit us like a landslide, an' I'll not forget the sound o' them drums as long as I live." } },
      choices = {
        { text = "And now the Lady keeps peace with them.", next = "war_peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_peace = {
      big = true,
      lines = { { id = "wp_default", text = "She does, an' I sell guns to the men who keep her peace, which is a funny sort o' joke when ye think on it. Some nights I think she's right, an' some nights I hear them drums again." } },
      choices = {
        { text = "She's right. The war has to end somewhere.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Keep your powder dry. Orcs don't change.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh = {
      lines = { { id = "ma_default", text = "Keep yer powder in oilcloth, or the damp'll have it before the crocolisks have you. An' clean yer barrel every night, because rust in this place grows like moss." } },
      choices = {
        { text = "Good advice.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Guns, powder, an' how tae keep 'em dry in a swamp." } },
    advice = { { id = "tp_ad", text = "Oilcloth, lad. Oilcloth for everythin'." } },
    caz = { { id = "tp_caz", text = "Builds kindlin' an' calls it engines. Good company on a Friday, though." } },
    warsong = { { id = "tp_warsong", text = "I still hear them drums some nights. I'll say no more about it." } },
    _none = { { id = "tp_none", text = "Never heard o' it, an' I'd sooner say so than make somethin' up." } },
  },
}
