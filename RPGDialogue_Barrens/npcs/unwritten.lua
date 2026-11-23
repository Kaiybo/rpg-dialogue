-- Barrens and Ratchet folk the roster scan found unwritten: Wenikee Boltbucket and Hecht Copperpinch
-- near Mor'shan, Taskmaster Fizzule at the Venture Co. tower, Grenthar and the Herald of Thrall at the
-- Crossroads, Kiknikle and Pizznukle west of the Lushwater Oasis, Pooka north of the Crossroads,
-- Captain Shatterskull at Mor'shan, the Manifestation of Water at the Tidus Stair, and in Ratchet
-- Mupsi Shacklefridd, Jaxxil Sparks and Wrenix's Gizmotronic Apparatus.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Wenikee Boltbucket: goblin scout for Sputtervalve, watching the Venture Co. in the north.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_wenikee_boltbucket", id = TODO_NPC("Wenikee Boltbucket"), name = "Wenikee Boltbucket", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "ratchet" }, temper = { "nervous" }, values = { "profit", "survival" },
  notices = { "class", "race" },
  impression = {
    first = "Wenikee Boltbucket crouches behind a rock with a spyglass that has been mended with wire in three places. She jumps when you speak, then pretends she meant to.",
    third = "{name} met Wenikee Boltbucket, a goblin scout from Ratchet keeping watch on the Venture Company.",
  },
  greetings = {
    { id = "g_default", text = "Keep your voice down, would you? Some of us are trying to be invisible out here." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still not followed, I hope. Get down behind the rock with me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Wenikee Boltbucket, and before you ask, yes, Sputtervalve sent me, and no, he did not send me with nearly enough pay. I watch the Venture Company so that Ratchet knows what it is digging up." },
        { id = "h_q", when = { questActive = TODO_QUEST("Wenikee Boltbucket") }, text = "Sputtervalve sent you after me? Then he wants his report, and he can have it, as soon as somebody helps me get it." },
      },
      again = {
        { id = "h_again", text = "What else? Talk quietly." },
        { id = "h_again2", text = "Anything more, or are you just enjoying the scenery?" },
      },
      choices = {
        { text = { normal = "What is the Venture Company doing out here?", polite = "If I may ask, what is the Venture Company doing here?", blunt = "What's the Venture Company up to?" }, next = "venture" },
        { text = "What does Sputtervalve want with it?", next = "sputter" },
        { text = "You don't look like a scout.", next = "scout" },
        { text = "Goblins spying on goblins. That's new.", next = "goblins", when = { race = "Goblin" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    venture = {
      lines = { { id = "v_default", text = "Digging, cutting, pumping, the usual, only they do it with more whips than the rest of us. Their slugs and their nuggets come out of the ground faster than anyone can count them, and Ratchet would like to be the one counting.", fx = { learn = { "venture_co" } } } },
      choices = {
        { text = "Slugs and nuggets?", next = "slugs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    slugs = {
      lines = { { id = "s_default", text = "Nugget slugs, the miners call them, the lumps of ore that come out raw before anyone smelts them. Bring a few back to Sputtervalve and he will know whose ore it is just by sniffing it, the old goat." } },
      choices = {
        { text = "That sounds like theft.", next = "theft" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theft = {
      lines = { { id = "t_default", text = "It is research, and the difference is that research gets written down. Besides, the Venture Company stole the hills first, so we are only stealing a little of it back." } },
      choices = {
        { text = "Fair enough. Thieves can't complain of thieves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A theft is a theft, whoever did it first.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    sputter = {
      lines = { { id = "sp_default", text = "Sputtervalve wants to know whether the Venture Company is about to put Ratchet out of business. He calls it market intelligence, and I call it lying in the dirt for a week." } },
      choices = {
        { text = "Is Ratchet in danger?", next = "danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "Only of a bad quarter, if we are lucky. The Venture Company does not trade with anyone it can rob, and Ratchet is built on the idea that everyone trades with everyone, so we are not friends." } },
      choices = { { text = "I'll keep an eye on them too.", next = "BACK", fx = { affinity = 1 } } },
    },
    scout = {
      lines = { { id = "sc_default", text = "That is exactly why I am good at it. Nobody looks twice at a small goblin with a toolbag, so I have walked right through their camp twice and counted their wagons." } },
      choices = { { text = "Bold of you. Something else.", next = "BACK" } },
    },
    goblins = {
      lines = { { id = "gb_default", text = "It is the oldest trade we have, friend. Every cartel watches every other cartel, and the only shame in it is getting caught." } },
      choices = { { text = "Then don't get caught.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Hecht Copperpinch: Smokywood Pastures food and drink vendor near Mor'shan.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_hecht_copperpinch", id = TODO_NPC("Hecht Copperpinch"), name = "Hecht Copperpinch", title = "Smokywood Pastures", gender = "male",
  role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "cheerful" }, values = { "profit" },
  impression = {
    first = "Hecht Copperpinch stands behind a cart stacked with tins, sausages and bottles stamped with the Smokywood Pastures seal. He is already holding out a sample before you reach him.",
    third = "{name} met Hecht Copperpinch, a goblin selling Smokywood Pastures food and drink near Mor'shan.",
  },
  greetings = {
    { id = "g_default", text = "Hungry? Thirsty? Both, if you have been out on the road. Smokywood Pastures has you covered." },
    { id = "g_back", when = { metBefore = true }, text = "A repeat customer, my favourite kind. What will it be today?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Hecht Copperpinch, at your service, selling the finest Smokywood goods this side of anywhere. The soldiers at the rampart eat my sausages, and nobody has died of them yet." } },
      again = { { id = "h_again", text = "Anything else? I have a tin for every mood." } },
      choices = {
        { text = "What is Smokywood Pastures?", next = "smoky" },
        { text = "Who buys from you out here?", next = "buyers" },
        { text = "Show me what you have.", next = "END" },
      },
    },
    smoky = {
      lines = { { id = "s_default", text = "A family business, if your family is very large and very good at accounts. We smoke, we bake, we bottle, and come the Winter Veil we sell enough cheer to fill Orgrimmar twice." } },
      choices = {
        { text = "Are you one of the Copperpinches in Thunder Bluff?", next = "family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "Seersa and Whulwert are cousins of mine, more or less. They get the big city and the holiday crowds, and I get the rampart and the dust, which tells you who is better at asking the boss nicely." } },
      choices = { { text = "Your sausages deserve better.", next = "BACK", fx = { affinity = 1 } } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Grunts from the rampart, caravan drivers, and anybody coming back from Ashenvale with all their limbs and an appetite to prove it. War is hungry work, friend, and I am a patriot that way." } },
      choices = { { text = "Of course you are. Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Taskmaster Fizzule: a Dark Iron "taskmaster" at the Venture Co. tower, secretly a Horde agent.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_taskmaster_fizzule", id = TODO_NPC("Taskmaster Fizzule"), name = "Taskmaster Fizzule", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "venture_co" }, temper = { "guarded" }, values = { "duty", "secrecy" },
  notices = { "class" },
  impression = {
    first = "A Dark Iron dwarf in a Venture Company harness leans outside the tower, barking at nobody in particular. When the peons pass out of earshot, his eyes go very steady and very cold.",
    third = "{name} met Taskmaster Fizzule, a Dark Iron overseer at the Venture Co. tower who is not quite what he seems.",
  },
  greetings = {
    { id = "g_default", text = "Back to work, or move along. The Company doesn't pay me to chat with strangers." },
    { id = "g_back", when = { metBefore = true }, text = "You. Keep your face blank and your voice low, and we can talk." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm the taskmaster here, as far as the goblins know. They pay me to crack a whip over their miners, and I am very good at it, so nobody asks where I came from." },
        { id = "h_q", when = { questActive = TODO_QUEST("Deep Cover") }, text = "So Orgrimmar sent you. Good, for I have been wearing this harness long enough to forget whose side I am on." },
      },
      again = {
        { id = "h_again", text = "Quickly now. The foreman counts heads at dusk." },
        { id = "h_again2", text = "Ask, but look busy while you do." },
      },
      choices = {
        { text = "You're no Venture Company man.", next = "cover" },
        { text = "What does the Company do at this tower?", next = "tower" },
        { text = "A Dark Iron working for goblins?", next = "darkiron" },
        { text = "I know the trade. Who are you really with?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll move along.", next = "END" },
      },
    },
    cover = {
      lines = { { id = "c_default", text = "Say that louder and we will both find out how deep the Sludge Fen is. I serve the Horde, quietly, and the less you know about how, the longer we both live." } },
      choices = {
        { text = "Why would the Horde trust a Dark Iron?", next = "trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "It doesn't, and it shouldn't, which is why the work suits me. A spy everyone suspects is a spy nobody watches closely, because they think they already know what he is." } },
      choices = {
        { text = "A clever lie is still a lie.", next = "trust_end", fx = { align = { honor = 1 } } },
        { text = "Lies win wars as well as axes do.", next = "trust_end", fx = { align = { honor = -1 } } },
      },
    },
    trust_end = {
      lines = { { id = "te_default", text = "You can have your opinion, and I'll have my reports. Both of us will sleep about as well as we deserve." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tower = {
      lines = { { id = "tw_default", text = "They drink the land dry and call it industry, pumping the fen and cutting anything that stands still. The tower keeps their plans, and the plans are what Orgrimmar wants.", fx = { learn = { "venture_co" } } } },
      choices = {
        { text = "Then steal the plans.", next = "plans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plans = {
      lines = { { id = "p_default", text = "I would, if I could leave my post for an hour without a dozen goblins asking where I went. That is the job for someone like you, who isn't missed." } },
      choices = { { text = "I'll think on it.", next = "BACK" } },
    },
    darkiron = {
      lines = { { id = "d_default", text = "The Company hires anyone with a strong arm and no questions, and a Dark Iron has both. Nobody here wonders why I left the Mountain, and I don't intend to tell them." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "r_default", text = "You have the walk, so I'll give you this much: the Shattered Hand pays my wages, and the Venture Company only thinks it does. Keep that under your hood." } },
      choices = { { text = "It stays with me.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
}

---------------------------------------------------------------------------
-- Grenthar: Darkspear axe thrower at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_grenthar", id = TODO_NPC("Grenthar"), name = "Grenthar", gender = "male",
  role = "soldier", tier = "service",
  communities = { "crossroads" }, temper = { "easygoing" }, values = { "loyalty" },
  impression = {
    first = "A lanky Darkspear troll leans on the Crossroads palisade with a brace of throwing axes on his belt. He is idly spinning one between his fingers, and it never once slips.",
    third = "{name} met Grenthar, a Darkspear axe thrower on the walls of the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Hey, mon. Don't stand in front of me if you be wantin' to keep your ears." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, mon? Still got both ears, I see. Good." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Grenthar, of the Darkspear. I watch the road for the Crossroads, and anything that come over the hill with bad intent gets an axe to think about." },
        { id = "h_troll", when = { race = "Troll" }, text = "A Darkspear face out here! Sen'jin's children be scattered all over these plains now, but we still find each other." },
      },
      again = { { id = "h_again", text = "What else, mon? The road be quiet for now." } },
      choices = {
        { text = "What comes over the hill?", next = "threats" },
        { text = "How did you learn to throw like that?", next = "axes" },
        { text = "Darkspear guarding an orc town?", next = "darkspear" },
        { text = "Stay sharp.", next = "END" },
      },
    },
    threats = {
      lines = { { id = "t_default", text = "Raptors from the south, quilboar from the thorns, and centaur when they be feelin' brave. Sometimes it be just a lost kodo, and then I feel very silly holding an axe." } },
      choices = { { text = "Better silly than surprised.", next = "BACK" } },
    },
    axes = {
      lines = { { id = "a_default", text = "On the Echo Isles, throwin' at coconuts until the coconuts stopped winnin'. A spear be for close, an axe be for far, and a troll should know both or he be lunch." } },
      choices = {
        { text = "Did you leave the islands with Vol'jin?", next = "isles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles = {
      lines = { { id = "i_default", text = "Some of us went to Durotar with Thrall and some stayed, but my axes go where the Horde go. Thrall saved our tribe from the sea witch, so we keep his roads clear." } },
      choices = { { text = "That's a debt worth paying.", next = "BACK", fx = { affinity = 1 } } },
    },
    darkspear = {
      lines = { { id = "d_default", text = "The Crossroads be a Horde town, not an orc town, mon. Tauren cook the food, orcs bark the orders, and trolls do the clever parts." } },
      choices = { { text = "Ha. Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Herald of Thrall: announcer of the Warchief's Blessing at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_herald_of_thrall", id = TODO_NPC("Herald of Thrall"), name = "Herald of Thrall", gender = "male",
  role = "soldier", tier = "service",
  communities = { "crossroads", "orgrimmar" }, temper = { "proud" }, values = { "honor", "loyalty" },
  impression = {
    first = "An orc in Orgrimmar's red and black stands on a crate at the Crossroads, a scroll under one arm and a voice that carries to the far gate.",
    third = "{name} met the Herald of Thrall, who carries the Warchief's words to the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Hear me, warrior! The Warchief's word reaches even the Barrens." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The Warchief's voice is the same, and so is mine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am the Herald of Thrall, sent to speak the Warchief's words where he cannot go himself. When a great deed is done for the Horde, I am the one who cries it across the plains." } },
      again = { { id = "h_again", text = "Speak, and I will answer in the Warchief's name." } },
      choices = {
        { text = "What is the Warchief's Blessing?", next = "blessing" },
        { text = "Do you know Thrall yourself?", next = "thrall" },
        { text = "Carry on, Herald.", next = "END" },
      },
    },
    blessing = {
      lines = { { id = "b_default", text = "When the Horde strikes down a great enemy, the Warchief sends his blessing to all who stand in our towns. Orgrimmar, Razor Hill, the Crossroads and Camp Taurajo all hear it at once, and every warrior there fights the harder for it." } },
      choices = {
        { text = "Glory should be shared.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Blessings don't swing axes.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    thrall = {
      lines = { { id = "t_default", text = "I have stood in Grommash Hold and heard him speak, and that is all a herald needs. He freed us from the camps, and I will shout his name until my throat gives out." } },
      choices = { { text = "Then shout well. Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Kiknikle: goblin cloth vendor at a small camp west of the Lushwater Oasis.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_kiknikle", id = TODO_NPC("Kiknikle"), name = "Kiknikle", title = "Stylish Clothier", gender = "male",
  role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "vain" }, values = { "profit", "style" },
  impression = {
    first = "In a dusty little camp west of the Lushwater Oasis, a goblin in a spotless purple coat fusses over a rack of robes. He is the only clean thing for a mile.",
    third = "{name} met Kiknikle, a goblin clothier selling robes from a camp west of the Lushwater Oasis.",
  },
  greetings = {
    { id = "g_default", text = "Oh, look at you. No, really, look at you. We can fix that." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more style? I knew you had taste somewhere under the dust." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kiknikle, stylish clothier, and yes, I mean stylish out here too. Every caravan to the oasis passes my rack, and half of them leave better dressed." },
        { id = "h_cloth", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "A caster! Finally, a customer who actually wears cloth instead of laughing at it." },
      },
      again = { { id = "h_again", text = "Something else, or shall we talk hemlines?" } },
      choices = {
        { text = "Why sell robes in the middle of the Barrens?", next = "why" },
        { text = "Your neighbour sells leather.", next = "pizz" },
        { text = "Let me see the rack.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because nobody else does, and everybody here is sweating through their armor. Light cloth breathes, my friend, and the sun out here doesn't care how brave you are." } },
      choices = {
        { text = "Not much call for silk at the oasis.", next = "oasis" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oasis = {
      lines = { { id = "o_default", text = "There wasn't, until the druids started poking about in those caves and the water went strange. Now everyone wants to go home looking respectable, so they buy something on the way." } },
      choices = { { text = "Clever. Something else.", next = "BACK" } },
    },
    pizz = {
      lines = { { id = "p_default", text = "Pizznukle, yes, with his smelly hides. We share a fire and a guard, and we argue about whose customers are uglier." } },
      choices = { { text = "Whose are?", next = "BACK", reply = "His, obviously. Mine leave in purple." } },
    },
  },
}

---------------------------------------------------------------------------
-- Pizznukle: goblin leather armor merchant, same camp as Kiknikle.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_pizznukle", id = TODO_NPC("Pizznukle"), name = "Pizznukle", title = "Leather Armor Merchant", gender = "male",
  role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "gruff" }, values = { "profit" },
  impression = {
    first = "A thickset goblin sits on a pile of hides, cutting a jerkin to size with shears bigger than his forearm. He smells of tannin and does not apologise for it.",
    third = "{name} met Pizznukle, a goblin leather merchant camped west of the Lushwater Oasis.",
  },
  greetings = {
    { id = "g_default", text = "Leather, here. Sturdy, cheap, and it doesn't fall apart in the rain. What more do you want?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Something you bought tear already? No? Then you want more." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Pizznukle. I sell leather to people who get shot at, which out here is everybody. Kiknikle sells robes to people who don't know it yet." },
        { id = "h_lw", when = { profession = "Leatherworking" }, text = "You work leather yourself, I see it on your hands. Then you know a good hide when you see one, and these are good hides." },
      },
      again = { { id = "h_again", text = "What else? I'm not getting any younger." } },
      choices = {
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Is this camp safe?", next = "safe" },
        { text = "Show me your stock.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hd_default", text = "Kodo and plainstrider from the hunters, zhevra when I'm lucky, and raptor when somebody is braver than they are smart. Raptor makes the best jerkins, and you can tell your friends I said so." } },
      choices = {
        { text = "Do the tauren mind you selling kodo?", next = "tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "They mind if you waste it, so I don't waste it. A tauren hunter told me once that the beast is honoured if its hide keeps someone alive, so every jerkin I sell is practically a prayer." } },
      choices = { { text = "A prayer at a markup.", next = "BACK", reply = "All the best prayers are, friend." } },
    },
    safe = {
      lines = { { id = "s_default", text = "Safe as anything in the Barrens, which means not very. We pay a guard, we keep the fire small, and we leave the oasis to the druids and whatever has got into the water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Pooka: orc mother living north of the Crossroads; her son Mogg plays at war outside.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_pooka", id = TODO_NPC("Pooka"), name = "Pooka", gender = "female",
  role = "citizen", tier = "service",
  communities = { "crossroads" }, temper = { "warm" }, values = { "family" },
  impression = {
    first = "An orc woman hangs washing outside a small hut while a boy charges past with a stick, shouting war cries at the grass. She watches him with a smile she tries to hide.",
    third = "{name} met Pooka, an orc mother raising her son Mogg on the northern plains.",
  },
  greetings = {
    { id = "g_default", text = "Mind Mogg, he thinks every traveller is a harpy. Lok'tar, and welcome." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Mogg will want to show you his new stick." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Pooka, and that loud little warrior is my son Mogg. His father is away fighting for the Horde, so Mogg has decided to guard the hut against every harpy in the Barrens." } },
      again = { { id = "h_again", text = "Anything else? Mind the washing." } },
      choices = {
        { text = "Where is his father fighting?", next = "father" },
        { text = "Mogg will make a fine warrior.", next = "mogg" },
        { text = "Why live out here alone?", next = "alone" },
        { text = "Farewell, Pooka.", next = "END" },
      },
    },
    father = {
      lines = { { id = "f_default", text = "North, in the Ashenvale woods, cutting lumber with the Warsong and fighting off the night elves who mind it. He sends word when a caravan passes, and Mogg makes me read it three times." } },
      choices = {
        { text = "The Horde needs that lumber.", next = "father_end", fx = { align = { order = 1 } } },
        { text = "The forest isn't ours to cut.", next = "father_end", fx = { align = { order = -1 } } },
      },
    },
    father_end = {
      lines = { { id = "fe_default", text = "Perhaps, and perhaps not. I only want him home with both arms, and I leave the rest to the Warchief." } },
      choices = { { text = "I hope he comes home soon.", next = "BACK", fx = { affinity = 1 } } },
    },
    mogg = {
      lines = { { id = "m_default", text = "He will make a loud one, at least. I would rather he grew up a farmer, but he has his father's head and his grandfather's lungs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alone = {
      lines = { { id = "a_default", text = "We are not so alone, with the Crossroads a short walk south. The camps taught me to love open sky, and I will not trade it for walls again." } },
      choices = { { text = "I understand. Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Captain Shatterskull: Warsong captain at Mor'shan, watching the Ashenvale border.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_captain_shatterskull", id = TODO_NPC("Captain Shatterskull"), name = "Captain Shatterskull", gender = "male",
  role = "soldier", tier = "quest",
  communities = { "morshan", "warsong" }, temper = { "stern" }, values = { "honor", "duty" },
  notices = { "class", "race" },
  impression = {
    first = "A scarred orc captain in Warsong colours stands by the rampart's gate, eyes fixed north toward the dark line of Ashenvale. He speaks without turning his head.",
    third = "{name} met Captain Shatterskull of the Warsong, who holds the line at Mor'shan.",
  },
  greetings = {
    { id = "g_default", text = "State your business, and make it quick. The elves don't wait for introductions." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, I could use another blade." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Captain Shatterskull, Warsong. Mor'shan Rampart is the door between the Barrens and Ashenvale, and I keep it shut against the Sentinels and open for our lumber." },
        { id = "h_q", when = { questActive = TODO_QUEST("Quell the Silverwing Usurpers") }, text = "The Silverwing are out in the woods again, so put them down and bring me proof." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I watch." },
        { id = "h_again2", text = "Speak, but keep it short." },
      },
      choices = {
        { text = { normal = "What threatens the rampart?", polite = "If I may, captain, what threatens the rampart?", blunt = "Who's attacking you?" }, next = "silverwing" },
        { text = "Why does the Horde need Ashenvale's wood?", next = "wood" },
        { text = "You fought beside Grom Hellscream?", next = "grom" },
        { text = "I've served on the front myself.", next = "veteran", when = { minLevel = 25 } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    silverwing = {
      lines = { { id = "s_default", text = "The Silverwing Sentinels, night elf huntresses who think every tree in the north belongs to them. They raid our lumber camps by night and vanish by day." } },
      choices = {
        { text = "Do they have a point?", next = "point" },
        { text = "Something else.", next = "BACK" },
      },
    },
    point = {
      lines = { { id = "p_default", text = "They have arrows, which is the only point that matters at the rampart. We came to Kalimdor with nothing, and we will build with what we take." } },
      choices = {
        { text = "The Horde takes what it needs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "We could ask before we take.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Orgrimmar's walls, the Crossroads' palisade, every boat in the Ratchet trade, all of it is wood. Durotar grows rock and scorpions, so we cut in Ashenvale or we do not build at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grom = {
      lines = { { id = "g_default", text = "I followed the Warsong banner when Hellscream carried it, and I followed it when he died for it at Demon Fall Canyon. He freed us of the blood curse with his own life, and I will not let the elves have the ground he died on." } },
      choices = {
        { text = "He drank that curse in the first place.", next = "grom_end" },
        { text = "His sacrifice will be remembered.", next = "grom_end", fx = { affinity = 1 } },
      },
    },
    grom_end = {
      lines = { { id = "ge_default", text = "Yes, he drank it, and yes, he paid it back. That is more than most of us managed, and you would do well to remember both halves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    veteran = {
      lines = { { id = "v_default", text = "You have the look of it, I'll grant you that. Then you know the woods are worse than any field, because the enemy can be standing beside you and you'd never know." } },
      choices = { { text = "I know it well.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Manifestation of Water: elemental summoned by Islen Waterseer at the Tidus Stair.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_manifestation_of_water", id = TODO_NPC("Manifestation of Water"), name = "Manifestation of Water",
  role = "citizen", tier = "service",
  communities = {}, temper = { "aloof" }, values = { "balance" },
  impression = {
    first = "A shape of rolling seawater rises at the Tidus Stair, foam for a crown and the pull of the tide in every movement. Its voice sounds like surf heard from inside a shell.",
    third = "{name} stood before the Manifestation of Water at the Tidus Stair.",
  },
  greetings = {
    { id = "g_default", text = "The shaman calls, and the tide answers. Speak, small one, before I return to the deep." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Waterseer has called me with fouled water from the old wells, and I taste the sickness in it. I am the sea's answer, and I will not stay long." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "You hear the elements as she does. Then you already know I do not come for your sake, but for the water's." },
      },
      again = { { id = "h_again", text = "Ask. The tide is turning." } },
      choices = {
        { text = "What sickness is in the water?", next = "sick" },
        { text = "Why answer Islen at all?", next = "islen" },
        { text = "Return to the deep.", next = "END" },
      },
    },
    sick = {
      lines = { { id = "s_default", text = "Something that dreams has dreamed into it, and the dream is a bad one. The water remembers being pure, and it is angry that it cannot be." } },
      choices = { { text = "Can it be cleansed?", next = "BACK", reply = "Water always runs clean in the end. Whether you live to see it is another tide." } },
    },
    islen = {
      lines = { { id = "i_default", text = "She asks, where others command, and she gives back what she takes. The sea remembers manners longer than mountains do." } },
      choices = { { text = "I'll remember that.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Mupsi Shacklefridd: goblin near Ratchet, patching up the hurt and the unlucky.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_mupsi_shacklefridd", id = TODO_NPC("Mupsi Shacklefridd"), name = "Mupsi Shacklefridd", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "ratchet" }, temper = { "brisk" }, values = { "profit", "care" },
  notices = { "class" },
  impression = {
    first = "Just outside Ratchet, a goblin woman sits on an upturned crate with a bag of bandages, salves and suspicious bottles. A sailor with a wrapped arm limps away from her looking grateful and poorer.",
    third = "{name} met Mupsi Shacklefridd, a goblin who mends wounds for coin outside Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "Bleeding? Broken? Bitten? Sit down, and keep your coin purse where I can see it." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? Either you're clumsy or you're brave, and both pay the same." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mupsi Shacklefridd, mender of wounds, setter of bones, and seller of the only bandages in Ratchet that aren't old sails. Every dockhand and pirate on the coast comes to me sooner or later." },
        { id = "h_q", when = { questActive = TODO_QUEST("Mending Old Wounds") }, text = "You're here about the hurt ones? Good, because I can only stitch so fast, and they keep coming." },
      },
      again = {
        { id = "h_again", text = "What else? Stop squirming." },
        { id = "h_again2", text = "Something more, or are you just here for the company?" },
      },
      choices = {
        { text = "Who comes to you for mending?", next = "patients" },
        { text = "Why not set up inside Ratchet?", next = "outside" },
        { text = "Do you ever mend people for free?", next = "free" },
        { text = "I heal too. Need a hand?", next = "healer", when = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" } } },
        { text = "I'm fine, thanks.", next = "END" },
      },
    },
    patients = {
      lines = { { id = "p_default", text = "Sailors with rope burns, miners from the Venture camps, and the poor fools who swam out to the Southsea pirates. I don't ask whose side they're on, and I charge everyone the same." } },
      choices = {
        { text = "You patch up pirates too?", next = "pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates = {
      lines = { { id = "pi_default", text = "Pirate gold spends as well as any, and they tip better than the Bruisers. Besides, a pirate I've stitched up thinks twice about robbing my cart." } },
      choices = {
        { text = "Mercy shouldn't pick sides.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some wounds should be left open.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    outside = {
      lines = { { id = "o_default", text = "The Bruisers don't like blood on the docks, and Gazlowe doesn't like competition he can't tax. Out here I pay no rent, and the patients find me just fine by following the trail." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    free = {
      lines = { { id = "f_default", text = "Once, for a kid who fell off the pier, and I've never told anyone. If you repeat it, I'll deny it and charge you double." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    healer = {
      lines = { { id = "h2_default", text = "A healer who offers, instead of selling? Sit down and roll up your sleeves, then, and I'll split the tips with you, which is generous for a goblin." } },
      choices = { { text = "Keep the tips.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
}

---------------------------------------------------------------------------
-- Jaxxil Sparks: holiday fireworks vendor in the Ratchet inn.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_jaxxil_sparks", id = TODO_NPC("Jaxxil Sparks"), name = "Jaxxil Sparks", title = "Holiday Fireworks Vendor", gender = "male",
  role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "excitable" }, values = { "profit", "fun" },
  impression = {
    first = "A goblin with singed eyebrows sits in a corner of the Ratchet inn beside a crate stencilled DO NOT SMOKE NEAR. He is smoking near it.",
    third = "{name} met Jaxxil Sparks, a goblin who sells holiday fireworks in the Ratchet inn.",
  },
  greetings = {
    { id = "g_default", text = "Rockets, crackers, fountains of colour! Light the sky, friend, and pay up front." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another bang? I knew you had the spark in you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Jaxxil Sparks, purveyor of explosive celebration. When the festivals roll around, I'm the reason the sky over Ratchet turns every colour it has." } },
      again = { { id = "h_again", text = "Anything else? Don't stand too close to the crate." } },
      choices = {
        { text = "Isn't selling fireworks inside an inn dangerous?", next = "danger" },
        { text = "What festivals do you sell for?", next = "festivals" },
        { text = "Show me the fireworks.", next = "END" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "Only if something catches, and nothing has caught since the last time. The innkeeper made me sign a paper, which I did, and then the paper caught, but that was an accident." } },
      choices = {
        { text = "That's how eyebrows go.", next = "brows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brows = {
      lines = { { id = "b_default", text = "They grow back, mostly, and every goblin engineer worth his salt has lost them a few times. Bare brows are a badge of honour in Ratchet." } },
      choices = { { text = "I'll keep mine, thanks.", next = "BACK" } },
    },
    festivals = {
      lines = { { id = "f_default", text = "Midsummer, when everyone lights bonfires and wants something louder, and any other day someone has gold and something to celebrate. A good rocket sells itself, friend." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Wrenix's Gizmotronic Apparatus: Wrenix the Wretched's vending machine in Ratchet.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_wrenix_apparatus", id = TODO_NPC("Wrenix's Gizmotronic Apparatus"), name = "Wrenix's Gizmotronic Apparatus",
  role = "vendor", tier = "service",
  communities = { "ratchet" }, temper = { "mechanical" }, values = { "profit" },
  impression = {
    first = "A clanking metal cabinet stands beside Wrenix the Wretched, all gears, levers and a coin slot worn shiny. A speaking tube on its front crackles when you lean close.",
    third = "{name} inspected Wrenix's Gizmotronic Apparatus, a vending machine in Ratchet.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, valued customer. Please insert coin. Please do not kick the apparatus." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "This is Wrenix's Gizmotronic Apparatus, patent pending. It dispenses thieves' tools and sundries to approved customers. Thank you for your custom." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Approved customer recognised. Lockpicks, flash powder and sundries are now available. Please do not pick the apparatus." },
      },
      again = { { id = "h_again", text = "Please make a selection. The apparatus is listening." } },
      choices = {
        { text = "Who approves the customers?", next = "approve" },
        { text = "Kick the machine.", next = "kick" },
        { text = "Make a selection.", next = "END" },
      },
    },
    approve = {
      lines = { { id = "a_default", text = "Approval is granted by Wrenix the Wretched, inventor and owner. Wrenix is very busy. Please do not wake Wrenix." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kick = {
      lines = { { id = "k_default", text = "Impact detected. The apparatus has noted your face. Wrenix has been informed, and Wrenix is now awake." } },
      choices = { { text = "Sorry, machine.", next = "BACK" } },
    },
  },
}
