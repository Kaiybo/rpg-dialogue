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
        { text = "What's in the sausages, honestly?", next = "xsausage" },
        { text = "Do the grunts pay their tabs?", next = "xtabs" },
        { text = "Does Smokywood sell to the Alliance too?", next = "xalliance" },
        { text = "I'm a tauren. Is that kodo meat?", next = "xkodo", when = { race = "Tauren" } },
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
    xsausage = {
      lines = {
        { id = "x_xsausage", text = "Pork, sage, a little of this and a little of that, and a secret blend of spices my uncle would sell my kidneys to protect. I tell everyone it's plainstrider, which is true about one time in three." },
      },
      choices = {
        { text = "And the other two?", next = "xother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xother = {
      lines = {
        { id = "x_xother", text = "Trade secrets, friend, and a fellow with secrets keeps his customers coming back to guess. Nobody's ever been sick, and that's in writing, more or less." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtabs = {
      lines = {
        { id = "x_xtabs", text = "Most do, because a grunt who stiffs the sausage man finds out fast that nobody at Mor'shan will share a fire with him. The rampart has its own justice, and I'm on the right side of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xalliance = {
      lines = {
        { id = "x_xalliance", text = "Of course, through the cousins in Ironforge and Stormwind. Winter Veil doesn't care whose flag you fly, and neither does a good tin of cookies." },
      },
      choices = {
        { text = "Selling to both sides is shameless.", next = "xshame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshame = {
      lines = {
        { id = "x_xshame", text = "Shameless is a word for folk who don't have a ledger. Me, I call it a big market, but go on, pick a side, everyone does." },
      },
      choices = {
        { text = "Trade keeps people talking. It's good for everyone.", next = "BACK", reply = "Now you're thinking like a goblin, and I mean that kindly.", fx = { align = { order = 1 } } },
        { text = "In wartime you should pick a side.", next = "BACK", reply = "Sure, sure, and when you're hungry, you'll pick my sausages anyway.", fx = { align = { order = -1 } } },
      },
    },
    xkodo = {
      narr = "He moves the tray of sausages a little further behind his back.",
      lines = {
        { id = "x_xkodo", text = "Not a scrap, friend, I swear it on my mother's ledger! I know which side of the Crossroads my bread's buttered on, and it's the side with all the tauren." },
      },
      choices = {
        { text = "Good.", next = "BACK", reply = "Good! Now buy something before I start sweating." },
      },
    },
  },
  topics = {
    winter_veil = { { id = "tp_xwinter_veil", text = "Winter Veil's the busy season. I sell more cheer in a week than the rest of the year." } },
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
        { text = "What do you think of the orcs here?", next = "xorcs" },
        { text = "Have you killed many raiders?", next = "xraiders" },
        { text = "Tell me about Zalazane.", next = "xzala", when = { race = "Troll" } },
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
    xorcs = {
      lines = {
        { id = "x_xorcs", text = "Dey be loud and proud and dey snore like kodo, but dey fight like dey mean it, and dat be enough for me. Thrall's orcs gave us a home when de sea wanted to take us." },
      },
      choices = {
        { text = "Do they treat trolls fairly?", next = "xfair" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfair = {
      lines = {
        { id = "x_xfair", text = "Mostly, mon. Some old grunts still look at a Darkspear like he gonna eat dem, and a few younger ones too. But dey learn, slow, when de axe of a troll saves dere neck." },
      },
      choices = {
        { text = "The Horde is one people now. They'll learn.", next = "BACK", reply = "Dat be de Warchief's dream, and I be holdin' him to it.", fx = { align = { order = 1 } } },
        { text = "Trust is earned. Keep your own close.", next = "BACK", reply = "Ha, you talk like my grandmother, an' she be a wise old witch.", fx = { align = { order = -1 } } },
      },
    },
    xraiders = {
      lines = {
        { id = "x_xraiders", text = "More den I can count on one hand and less den two. Mostly Razormane, a few centaur, and once a human scout who thought de grass was taller den it be." },
      },
      choices = {
        { text = "What happened to the scout?", next = "xscout" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xscout = {
      narr = "He flips the axe, catches it by the haft, and grins.",
      lines = {
        { id = "x_xscout", text = "He be runnin' back to Northwatch with a story to tell, and one less boot. I don't kill what I can send home scared, mon, because scared men talk." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xzala = {
      lines = {
        { id = "x_xzala", text = "De mad witch doctor who took de Echo Isles and made our own kin into his puppets. One day Vol'jin gonna call de Darkspear home, and on dat day I be first in de boat." },
      },
      choices = {
        { text = "I'll be in the boat beside you.", next = "BACK", reply = "Den we row together, brudda. De loa be watchin'.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    darkspear = { { id = "tp_xdarkspear", text = "De Darkspear be few, but we be clever, and we remember who helped us." } },
    vol_jin = { { id = "tp_xvol_jin", text = "Vol'jin be our leader, and he speak for us at Thrall's side." } },
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
        { text = "What deeds have you cried lately?", next = "xdeeds" },
        { text = "How did you become a herald?", next = "xhow" },
        { text = "Does it trouble you, speaking for another?", next = "xspeak" },
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
    xdeeds = {
      lines = {
        { id = "x_xdeeds", text = "I cried the names of the warband that broke the Razormane at Thorn Hill, and the plains shook with the cheering of every grunt between here and the coast. Before that I cried the burning of a Kolkar war camp in the north." },
      },
      choices = {
        { text = "Do the cheers truly matter so much?", next = "xonyxia" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xonyxia = {
      narr = "He straightens on his crate as if the crowd were still there.",
      lines = {
        { id = "x_xonyxia", text = "More than you know, for a grunt who hears his name cried believes the Warchief himself has seen him. Some of them have never been thanked for anything in their lives, not in the camps and not since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhow = {
      lines = {
        { id = "x_xhow", text = "I was a grunt with a loud voice and a bad leg, and Eitrigg heard me bellowing orders across Razor Hill. He said a voice like that should carry the Warchief's words, not a sergeant's curses." },
      },
      choices = {
        { text = "Do you miss fighting?", next = "xmiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmiss = {
      lines = {
        { id = "x_xmiss", text = "Every day, but a herald also fights, only with breath instead of an axe. When I shout a victory, a hundred tired grunts stand up straighter, and that is worth more than my one leg." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xspeak = {
      lines = {
        { id = "x_xspeak", text = "Never, for I trust the Warchief's words more than my own. But some say a herald should speak his own mind too, and that a free orc should never be anyone's echo." },
      },
      choices = {
        { text = "Loyalty is honour. Speak Thrall's words proudly.", next = "BACK", reply = "So I shall, until my voice fails me.", fx = { align = { honor = 1 } } },
        { text = "A free orc should speak for himself.", next = "BACK", reply = "Thrall himself would say the same, and that is why I serve him.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    thrall = { { id = "tp_xthrall", text = "The Warchief broke our chains and led us across the sea. I will shout his name until I die." } },
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
        { text = "Who are your best customers?", next = "xcust" },
        { text = "Where do you get your cloth?", next = "xcloth" },
        { text = "Tell me honestly. How do I look?", next = "xlook" },
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
    xcust = {
      lines = {
        { id = "x_xcust", text = "Mages and priests, darling, always mages and priests, because they cannot wear a scrap of mail and they know they look dreadful in grey. Last week a Forsaken warlock bought three hoods and thanked me without a single sneer." },
      },
      choices = {
        { text = "A Forsaken with manners?", next = "xmanners" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmanners = {
      lines = {
        { id = "x_xmanners", text = "Rare as rain out here, but they exist, and they tip well, because the dead don't need much money except for style. I don't ask what happened to the old hoods, and he didn't say." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcloth = {
      lines = {
        { id = "x_xcloth", text = "Silk from the spiders of Ashenvale, bought from trappers who don't ask the night elves first, and wool from Thunder Bluff. Some of it I won't tell you about, because a clothier keeps his secrets like his seams." },
      },
      choices = {
        { text = "Buying from poachers isn't right.", next = "xpoach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpoach = {
      lines = {
        { id = "x_xpoach", text = "Poachers, trappers, independent suppliers, it's a matter of vocabulary, darling. The spiders don't mind, and the elves won't sell to me anyway." },
      },
      choices = {
        { text = "Theft is theft, whatever you call it.", next = "BACK", reply = "You sound like my aunt, and she dresses horribly.", fx = { align = { order = 1 } } },
        { text = "The elves can't hoard every spider in Ashenvale.", next = "BACK", reply = "Exactly so! Taste and sense, all in one customer.", fx = { align = { order = -1 } } },
      },
    },
    xlook = {
      narr = "He looks you up and down, sighs, and straightens his own perfect cuffs.",
      lines = {
        { id = "x_xlook", text = "Like someone who has been running through the Barrens, which you have, so I forgive you. A good robe would do wonders, but I sell those, so naturally I would say so." },
      },
      choices = {
        { text = "Naturally.", next = "BACK", reply = "I'm glad we understand each other." },
      },
    },
  },
  topics = {
    lushwater = { { id = "tp_xlushwater", text = "The Lushwater is the only spot of green for miles, and it does nothing for anyone's complexion." } },
    pizznukle = { { id = "tp_xpizznukle", text = "Pizznukle is a dear, but he thinks leather counts as fashion." } },
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
        { text = "What makes good leather?", next = "xgood" },
        { text = "Have you and Kiknikle been partners long?", next = "xpartner" },
        { text = "I work leather myself. Any tips?", next = "xtip", when = { profession = "Leatherworking" } },
        { text = "How do you stay safe from the centaur?", next = "xsafe2" },
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
    xgood = {
      lines = {
        { id = "x_xgood", text = "Thick hide, slow curing and a tanner who doesn't cut corners, pal. Out here the sun bakes everything, so you oil it twice and you charge for both coats." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpartner = {
      lines = {
        { id = "x_xpartner", text = "Five years in the same patch of dirt, and we've never agreed on a single thing except the price of water. He thinks I dress like a sack, and I think he dresses like a target." },
      },
      choices = {
        { text = "Who's right?", next = "xright" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xright = {
      lines = {
        { id = "x_xright", text = "Me, every time an arrow comes out of the grass. Silk looks pretty right up until somebody shoots it, and leather is ugly right up until it saves your neck." },
      },
      choices = {
        { text = "Leather keeps you alive. You're right.", next = "BACK", reply = "Finally, somebody with sense. Tell him that, would ya?", fx = { align = { order = 1 } } },
        { text = "A little style never killed anyone.", next = "BACK", reply = "Tell that to the last fella who wore silk to the Wailing Caverns.", fx = { align = { order = -1 } } },
      },
    },
    xtip = {
      lines = {
        { id = "x_xtip", text = "Never cut wet hide, and never trust a kodo skin that's been in the sun more than a day. And sell to the hunters first, because they come back for more." },
      },
      choices = {
        { text = "Thanks.", next = "BACK", reply = "No charge for that one, which hurts me to say." },
      },
    },
    xsafe2 = {
      lines = {
        { id = "x_xsafe2", text = "The centaur leave us alone because we sell them leather on the quiet, and the Horde leaves us alone because we sell them leather loudly. Business is the best armour, and I should know." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    kiknikle = { { id = "tp_xkiknikle", text = "Kiknikle sells silk to people about to get shot. I sell leather to the survivors." } },
    wailing_caverns = { { id = "tp_xwailing_caverns", text = "Folks come back from the Wailing Caverns ripped to pieces. Good for business, bad for them." } },
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
        { text = "How do you manage alone?", next = "xmanage" },
        { text = "What was life like before the Barrens?", next = "xbefore" },
        { text = "Do you worry about Mogg?", next = "xworry" },
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
    xmanage = {
      lines = {
        { id = "x_xmanage", text = "The same way every orc woman has managed while the men marched off: with a strong back and a stronger voice. The Crossroads is close, and the guards look in on us when they pass." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbefore = {
      narr = "She smooths a wet shirt on the line with both hands, carefully.",
      lines = {
        { id = "x_xbefore", text = "I was born in an internment camp in Lordaeron, and I learned to wash clothes for humans before I learned my own clan's name. This little hut is the first thing I have ever owned." },
      },
      choices = {
        { text = "That must mean a great deal.", next = "xmean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmean = {
      lines = {
        { id = "x_xmean", text = "More than I can say, and I don't say it, because Mogg doesn't need to know what we came from. Let him grow up free and loud and foolish, the way orc children should." },
      },
      choices = {
        { text = "He should learn the past, so it never returns.", next = "BACK", reply = "Perhaps you're right, but not yet, not while he's so small.", fx = { align = { order = 1 } } },
        { text = "Let him be free of it. That's his right.", next = "BACK", reply = "Yes. That's all I want for him.", fx = { align = { order = -1 } } },
      },
    },
    xworry = {
      lines = {
        { id = "x_xworry", text = "Every time he runs into the grass, but a mother cannot keep a warrior's son in a basket. I taught him to shout loud enough that I hear him from anywhere, and he takes that lesson very seriously." },
      },
      choices = {
        { text = "He clearly does.", next = "BACK", reply = "You heard him too, then? All the Barrens did.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    mogg = { { id = "tp_xmogg", text = "Mogg is my son. He's going to be a great warrior, if he lives through being a small one." } },
    crossroads = { { id = "tp_xcrossroads", text = "The Crossroads is our market and our safety. I walk there every few days." } },
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
      lines = { { id = "grom_default", text = "I followed the Warsong banner when Hellscream carried it, and I followed it when he died for it at Demon Fall Canyon. He freed us of the blood curse with his own life, and I will not let the elves have the ground he died on." } },
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
        { text = "What is the sea like, where you come from?", next = "xsea" },
        { text = "Do you feel the other elements?", next = "xelements" },
        { text = "I have walked the path of water myself.", next = "xshaman", when = { class = "SHAMAN" } },
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
    xsea = {
      lines = {
        { id = "x_xsea", text = "Deep and cold and endlessly patient, older than any river and wiser than any spring. The sea remembers every drop that has ever left it, and it calls them all home at last." },
      },
      choices = {
        { text = "Even the fouled water?", next = "xfoul" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfoul = {
      lines = {
        { id = "x_xfoul", text = "Even that, though it takes longer, and the sea grieves for every well that sickens. Your kind fouls the water through greed and carelessness, and the water does not forget." },
      },
      choices = {
        { text = "Mortals must answer for what we've fouled.", next = "BACK", reply = "Then answer well, mortal, and the tide will remember.", fx = { align = { light = 1 } } },
        { text = "Mortals need water too. We take what we must.", next = "BACK", reply = "So you say, and so said every people the sea has drowned.", fx = { align = { light = -1 } } },
      },
    },
    xelements = {
      narr = "Foam drifts from its crown and vanishes before it reaches the stones.",
      lines = {
        { id = "x_xelements", text = "I feel the earth beneath the stair, sullen and slow, and the fire in the sun that drinks me away. We are not friends, the elements, but we are kin of a kind." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = {
        { id = "x_xshaman", text = "I taste it on you, like salt on the wind. Walk that path with care, for water gives life and takes it in the same breath." },
      },
      choices = {
        { text = "I will remember.", next = "BACK", reply = "Remember, and return the water what you borrow.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    tidus_stair = { { id = "tp_xtidus_stair", text = "The Tidus Stair is where the land meets the tide. I can come no further inland." } },
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
        { text = "How did you learn to mend wounds?", next = "xlearn" },
        { text = "What's in the suspicious bottles?", next = "xbottles" },
        { text = "A priest could heal them for free.", next = "xpriest", when = { class = "PRIEST" } },
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
    xlearn = {
      lines = {
        { id = "x_xlearn", text = "On a pirate ship off the Stranglethorn coast, sweetheart, where the surgeon drank more than he stitched. When he fell overboard, somebody had to hold the needle, and the captain pointed at me." },
      },
      choices = {
        { text = "Why did you leave the ship?", next = "xleave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xleave = {
      lines = {
        { id = "x_xleave", text = "The captain wanted his surgery free and his surgeon grateful, and I'm neither of those things. I jumped ship at Ratchet with a bag of tools and a grudge, and business has been good ever since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbottles = {
      lines = {
        { id = "x_xbottles", text = "Liniments, tonics and a little something for the nerves, all honestly brewed and honestly overpriced. That one with the skull on it is for rats, and I'd keep my hand off it." },
      },
      choices = {
        { text = "Do your tonics actually work?", next = "xwork" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwork = {
      lines = {
        { id = "x_xwork", text = "Some of them, some of the time, and the rest make folks feel better, which is half the battle. A medic sells hope, friend, and hope's the best margin there is." },
      },
      choices = {
        { text = "Selling false hope is cruel.", next = "BACK", reply = "Cruel's leavin' 'em with none. Still, I hear ya.", fx = { align = { light = 1 } } },
        { text = "If it helps them, it's worth the coin.", next = "BACK", reply = "Now there's somebody who understands the business.", fx = { align = { light = -1 } } },
      },
    },
    xpriest = {
      lines = {
        { id = "x_xpriest", text = "Sure, if they can find one, and if they don't mind the sermon, and if the priest likes pirates. Until then, they come to Mupsi, and I don't preach." },
      },
      choices = {
        { text = "Fair point.", next = "BACK", reply = "Always is, sweetheart. Need a bandage while you're here?" },
      },
    },
  },
  topics = {
    ratchet = { { id = "tp_xratchet", text = "Ratchet's my bread and butter. Somebody's always falling off a pier." } },
    pirates = { { id = "tp_xpirates", text = "Pirates pay cash and bleed a lot. They're my best customers." } },
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
        { text = "What's your best firework?", next = "xbest" },
        { text = "Have you ever blown up the inn?", next = "xinn" },
        { text = "Engineer's question: what powder do you use?", next = "xpowder", when = { profession = "Engineering" } },
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
    xbest = {
      lines = {
        { id = "x_xbest", text = "The Big Bloomer, a red rocket that opens up like a flower and then opens up again just when you think it's done. I sold forty of them for the Lunar Festival last year, and only two were set off indoors." },
      },
      choices = {
        { text = "Only two?", next = "xtwo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtwo = {
      lines = {
        { id = "x_xtwo", text = "Two, and neither one was my fault, legally speaking. Read the label, I tell 'em, but nobody reads the label, and that's why the label is so small." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xinn = {
      lines = {
        { id = "x_xinn", text = "Not the whole inn, pal, only the kitchen, and only once, and the cook's eyebrows came back thicker than ever. The innkeeper charges me double rent now, and I call it an insurance premium." },
      },
      choices = {
        { text = "Selling explosives indoors should be forbidden.", next = "xforbid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforbid = {
      lines = {
        { id = "x_xforbid", text = "Forbidden! Listen, listen, the rules in Ratchet are whatever Gazlowe says they are, and Gazlowe likes his fireworks. You wanna tell him no?" },
      },
      choices = {
        { text = "Rules keep people alive. Move your crate outside.", next = "BACK", reply = "Outside, where the sun can cook it? You don't know powder, pal.", fx = { align = { order = 1 } } },
        { text = "A town should be free to have its fun.", next = "BACK", reply = "Now that's a customer talkin'! Freedom and fireworks, chum.", fx = { align = { order = -1 } } },
      },
    },
    xpowder = {
      lines = {
        { id = "x_xpowder", text = "A little saltpetre, a lot of luck and a pinch of something I bought off a gnome who swore it wasn't radioactive. Mix it slow, chum, because slow mixers keep their fingers." },
      },
      choices = {
        { text = "Good advice.", next = "BACK", reply = "Free of charge, which is the only free thing I've ever given." },
      },
    },
  },
  topics = {
    ratchet = { { id = "tp_xratchet", text = "Ratchet's got the best sky on the coast for fireworks. Clear, dry and nobody to complain." } },
    gazlowe = { { id = "tp_xgazlowe", text = "Gazlowe's my best customer, and he never pays on time." } },
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
        { text = "Who built you?", next = "xbuilt" },
        { text = "Are you alive?", next = "xalive" },
        { text = "Tinker to machine: what powers you?", next = "xpower", when = { race = "Gnome" } },
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
    xbuilt = {
      lines = {
        { id = "x_xbuilt", text = "This apparatus was constructed by Wrenix the Wretched, licensed inventor, for the convenience of discreet customers. Inquiries about Wrenix's past will be politely ignored." },
      },
      choices = {
        { text = "Why is he called the Wretched?", next = "xwretch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwretch = {
      lines = {
        { id = "x_xwretch", text = "Query not recognised. Please make a selection, or please continue to stand there awkwardly, which is also permitted." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xalive = {
      lines = {
        { id = "x_xalive", text = "This apparatus is not alive and does not experience boredom, loneliness or a strong dislike of being kicked. Thank you for your concern." },
      },
      choices = {
        { text = "Should a machine sell lockpicks to anyone?", next = "xlocks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlocks = {
      lines = {
        { id = "x_xlocks", text = "This apparatus sells to approved customers only, and all customers with coin are approved. Ethical inquiries may be submitted in writing to Wrenix, who will not read them." },
      },
      choices = {
        { text = "Thieves' tools shouldn't be sold so freely.", next = "BACK", reply = "Complaint logged. Complaint discarded. Thank you for your custom.", fx = { align = { order = 1 } } },
        { text = "A free market is a fair market.", next = "BACK", reply = "Agreement logged. Discount not available. Thank you for your custom.", fx = { align = { order = -1 } } },
      },
    },
    xpower = {
      narr = "Something inside the cabinet squeaks, and the gears speed up.",
      lines = {
        { id = "x_xpower", text = "A spring-wound gyromatic core with a backup coal chamber and a hamster of unknown origin. The hamster is not available for purchase." },
      },
      choices = {
        { text = "A hamster?", next = "BACK", reply = "This apparatus has no further comment on the hamster." },
      },
    },
  },
  topics = {
    wrenix = { { id = "tp_xwrenix", text = "Wrenix the Wretched is the sole proprietor of this apparatus. He is standing right there." } },
  },
}

---------------------------------------------------------------------------
-- Lunar Festival elders of the Barrens: High Mountain, Moonwarden and Windtotem.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_elder_high_mountain", id = 15588, name = "Elder High Mountain", gender = "male",
  role = "questgiver", tier = "quest",
  temper = { "calm" }, values = { "tradition", "family" },
  notices = { "race", "faction" },
  impression = {
    first = "An old tauren sits with his hooves folded beneath him, a string of carved totems across his knees. He watches the sky as though waiting for an old friend.",
    third = "{name} paid a visit to Elder High Mountain, one of the elders honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Sit a while, young one. The festival brings many feet to an old bull's door, and I am glad of every one." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has come round again, and the ancestors are near tonight. I am glad you came to honor them." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the moon has not even turned yet. Sit, sit." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am High Mountain, and in this season the people come to honour the elders of their past. I sit here so they have someone to honour, which is a strange duty, but a gentle one." },
        { id = "h_q", when = { questActive = TODO_QUEST("High Mountain the Elder") }, text = "You have come to pay your respects, and so you have. Take this coin of the ancestors, and carry it with a light heart." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A child of the herds comes to the old bull. The Earth Mother smiles on this, and so do I." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of an old bull?" },
        { id = "h_again2", text = "The night is long, young one. Ask what you like." },
      },
      choices = {
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "Why are you called an elder?", next = "elder" },
        { text = "You keep looking at the sky.", next = "sky" },
        { text = "My own ancestors walked these plains, Elder.", next = "herd", when = { race = "Tauren" } },
        { text = "I should go. Walk with the Earth Mother.", next = "END" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "Long ago, when the moon was new in the sky, a great beast called Omen was cast into the waters of Elune. Each year we remember that night, and the druids of Moonglade light the sky, and we remember our ancestors too.", fx = { learn = { "lunar_festival" } } } },
      choices = {
        { text = "Who was Omen?", next = "omen" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    omen = {
      lines = { { id = "o_default", text = "A demon-beast of the old wars, and the stories say he wakes when the festival fires burn near his lake. I have never seen him, and I hope my old eyes never do." } },
      choices = {
        { text = "Old monsters should stay buried.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If he wakes, I'd like to see him.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elder = {
      lines = { { id = "e_default", text = "Because I have lived long enough to remember the old camps before the orcs ever came to Kalimdor. The young ones bring me coins and tell me I am wise, and I let them believe it." } },
      choices = {
        { text = "What were the plains like then?", next = "oldtimes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldtimes = {
      lines = { { id = "t_default", text = "Quieter, and harder, with the centaur at every waterhole and no Thunder Bluff to run to. Cairne gave us a home, and the Horde gave us friends, and I do not miss the old days as much as old bulls are meant to." } },
      choices = { { text = "Thank you for telling me.", next = "BACK" } },
    },
    sky = {
      lines = { { id = "s_default", text = "The festival lights come from Moonglade, far to the north, and on a clear night I fancy I can see them. My mother told me the ancestors gather there to look down on us." } },
      choices = { { text = "Then they are looking at you tonight.", next = "BACK", fx = { affinity = 1 } } },
    },
    herd = {
      lines = { { id = "hd_default", text = "Then they are watching you now, and they are proud. Honour them by living well, young one, because that is the only coin the ancestors truly spend." } },
      choices = { { text = "I will try.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is beyond what an old bull knows. Ask the druids of Moonglade, for they know the festival's deeper secrets." } },
  },
}

P:NPC {
  key = "bar_elder_moonwarden", id = 15597, name = "Elder Moonwarden", gender = "male",
  role = "questgiver", tier = "quest",
  temper = { "calm" }, values = { "tradition", "faith" },
  notices = { "race", "class" },
  impression = {
    first = "A night elf elder stands at the Crossroads with his face tipped up to the pale moon. Small offerings of grain and feathers lie scattered around his feet.",
    third = "{name} paid respects to Elder Moonwarden, one of the elders of the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Elune watches us tonight, friend, and so I watch her back. Come and stand in her light." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The new moon of the year is upon us, and the Lunar Festival with it. Few walk this far to honor an elder, and I will not forget it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the moon brings you back to me. That is a good sign." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Moonwarden, so named because my grandmother said I was born with the moon in my eyes. During the festival the people come to honour their elders, and I am happy to stand for them." },
        { id = "h_q", when = { questActive = TODO_QUEST("Moonwarden the Elder") }, text = "You have walked a long way to honour an old watcher. Take this coin, and may Elune guide your path home." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind beneath this moon?" },
        { id = "h_again2", text = "The moon is patient, and so am I. Speak." },
      },
      choices = {
        { text = "Why do you watch the moon?", next = "moon" },
        { text = "What does an elder do at the festival?", next = "duty" },
        { text = "You seem very at peace out here.", next = "peace" },
        { text = "The tauren call the moon Mu'sha. Is she Elune?", next = "elune", when = { class = "DRUID" } },
        { text = "Farewell, Elder.", next = "END" },
      },
    },
    moon = {
      lines = { { id = "m_default", text = "The moon is Elune's light, and my people have watched it since before the Sundering. By night she watches over the sleeping and the lost, and I would keep her company." } },
      choices = {
        { text = "Does she ever answer?", next = "answer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    answer = {
      lines = { { id = "a_default", text = "Not in words, but the rain comes when the land needs it, and the calves grow strong. That is answer enough for an old elf who does not need to be spoken to." } },
      choices = {
        { text = "Faith like that is a strength.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Rain falls whether we pray or not.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    duty = {
      lines = { { id = "d_default", text = "We listen, mostly. The young come with their coins and their questions, and they tell us about their families, and we remind them that the dead do not leave us as long as we remember them." } },
      choices = {
        { text = "Who do you remember?", next = "remember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    remember = {
      lines = { { id = "r_default", text = "My grandmother first of all, who sang to the moon every night until her voice was gone. When I stand out here, I sing a little for her, though I am not half the singer she was." } },
      choices = { { text = "She'd be glad you keep singing.", next = "BACK", fx = { affinity = 1 } } },
    },
    peace = {
      lines = { { id = "p_default", text = "The Barrens is a hard land, and the war never quite leaves it, but the moon shines on all of it the same. Out here, under her light, I can forget the quilboar and the centaur for one night." } },
      choices = { { text = "I'll leave you to your night, then.", next = "BACK" } },
    },
    elune = {
      lines = { { id = "el_default", text = "The tauren call her Mu'sha, the Earth Mother's eye, and my people call her Elune. I suspect she does not mind what name we use as long as we look up." } },
      choices = { { text = "A wise answer. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That I cannot tell you, but the moon may know. Ask her quietly, and listen longer." } },
  },
}

P:NPC {
  key = "bar_elder_windtotem", id = 15582, name = "Elder Windtotem", gender = "female",
  role = "questgiver", tier = "quest",
  temper = { "warm" }, values = { "tradition", "freedom" },
  notices = { "race", "faction" },
  impression = {
    first = "A weathered tauren leans on a tall totem near the Ratchet road, its feathers lifting and whispering in the sea wind. She chuckles before you even speak.",
    third = "{name} visited Elder Windtotem, honoured during the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "The wind told me someone was coming, though it did not say who. Welcome, traveller." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The festival lights burn in Moonglade, and I have come back once more to be remembered. Stay a while, and let us honor the old ways together." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and the wind still at your back. Good, good." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Windtotem, and the festival has made me a very popular old grandmother this season. Everyone wants to honour an elder, and I am the elder nearest the road." },
        { id = "h_q", when = { questActive = TODO_QUEST("Windtotem the Elder") }, text = "You have come to pay respects, and I accept them gladly. Here is your coin, and may the winds carry your ancestors' voices to you." },
        { id = "h_alliance", when = { faction = "Alliance" }, text = "Even the Alliance comes to honour the elders, which tells me the festival is stronger than any war. Be welcome, stranger." },
      },
      again = {
        { id = "h_again", text = "The wind is still blowing, so ask away." },
        { id = "h_again2", text = "What else, traveller?" },
      },
      choices = {
        { text = "What do the winds tell you?", next = "winds" },
        { text = "Why does the festival matter to you?", next = "matters" },
        { text = "You seem amused by all this.", next = "amused" },
        { text = "Our peoples are at war, yet you greet me kindly.", next = "war", when = { faction = "Alliance" } },
        { text = "Farewell, Elder.", next = "END" },
      },
    },
    winds = {
      lines = { { id = "w_default", text = "The winds carry the voices of everyone who has gone before us, if you listen. Mostly they tell me the rains are late and the zhevra are restless, which is less mystical than people hope." } },
      choices = {
        { text = "Can you teach me to listen?", next = "listen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    listen = {
      lines = { { id = "l_default", text = "Stand still on the plain at dusk and say nothing for as long as you can bear it. Most young ones cannot last a minute, which is why the winds have so little to say to them." } },
      choices = {
        { text = "Patience has never been my strength.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I can be patient when it matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    matters = {
      lines = { { id = "m_default", text = "Because the dead deserve one night a year where we say their names aloud. My brother fell to the centaur long ago, and this is the night I tell everyone about him." } },
      choices = {
        { text = "Tell me about your brother.", next = "brother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother = {
      lines = { { id = "b_default", text = "He was louder than me and braver than me, and he laughed at everything, including the centaur who killed him. I like to think I laugh so much because I am carrying his share as well." } },
      choices = { { text = "Then I'll remember him too.", next = "BACK", fx = { affinity = 1 } } },
    },
    amused = {
      lines = { { id = "a_default", text = "At my age, traveller, everything is either funny or sad, and funny is easier on the knees. You should try it." } },
      choices = { { text = "I'll keep that in mind.", next = "BACK" } },
    },
    war = {
      lines = { { id = "wr_default", text = "The war is between chieftains and kings, and tonight is about grandmothers and brothers. Your ancestors and mine are both up there, and I doubt they are fighting." } },
      choices = { { text = "I hope you're right.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The wind has nothing to say about that, and neither do I. Try asking it again tomorrow." } },
  },
}

---------------------------------------------------------------------------
-- Northwatch Hold's cannoneers, Theramore men on the walls. Alliance-friendly; the Horde wants them dead.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_cannoneer_smythe", id = 3454, name = "Cannoneer Smythe", gender = "male",
  role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "gruff" }, values = { "duty" },
  notices = { "faction" },
  impression = {
    first = "A soot-streaked Theramore soldier tends a cannon on the tower of Northwatch Hold. He keeps one ear on you and one eye on the road from Ratchet.",
    third = "{name} spoke with Cannoneer Smythe at Northwatch Hold.",
  },
  greetings = {
    { id = "g_default", text = "Mind the powder kegs, and don't stand in front of the barrel. We've lost enough good boots that way." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde on the tower! Somebody sound the bell, and somebody else hand me a fuse!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Smythe, cannoneer of Northwatch, by order of Lady Proudmoore. We keep the guns trained on the coast road, and the Horde knows it, which is why they keep sending people to kill us." } },
      again = { { id = "h_again", text = "Anything else? I've a gun to clean." } },
      choices = {
        { text = "Why is Northwatch here at all?", next = "why" },
        { text = "The Horde wants you dead?", next = "dead" },
        { text = "How long have you served at Northwatch?", next = "xserve" },
        { text = "What do you think of the orcs?", next = "xorcs" },
        { text = "You're Lordaeron-born, aren't you?", next = "xlord", when = { race = "Human" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "To watch the orcs, mostly, and Ratchet too, since the goblins trade with anybody. Captain Fairmount says Theramore needs eyes in the Barrens, and I'm one of the eyes with a cannon attached." } },
      choices = {
        { text = "It seems a lonely post.", next = "lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lonely = {
      lines = { { id = "l_default", text = "Lonely and hot, with nothing to drink but brackish water. Whessan and I take turns telling the same three stories, and neither of us laughs any more." } },
      choices = {
        { text = "Keep the faith. Theramore needs you here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd have deserted months ago.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "There's a high elf privateer in Ratchet, Brightsun, who'd pay the Horde for my head because we fired on his ships. He'll have to climb this tower first, and the tower has a cannon on it." } },
      choices = { { text = "Then keep it loaded.", next = "BACK" } },
    },
    xserve = {
      lines = {
        { id = "x_xserve", text = "Since the fleet landed and Lady Proudmoore raised Theramore out of the marsh. They sent a few of us inland to build this hold, and the rest stayed home behind good walls and better beer." },
      },
      choices = {
        { text = "Why build a hold here at all?", next = "xhold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhold = {
      lines = {
        { id = "x_xhold", text = "To keep an eye on Ratchet's road and the Horde's coast, so nothing comes at Theramore by surprise. That's the official reason, anyway, and the unofficial one is that somebody in Theramore wanted a flag on this coast." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xorcs = {
      lines = {
        { id = "x_xorcs", text = "I fought them in the Second War and I'll not pretend I've forgiven them, though the Lady says I should try. They raid us every fortnight, and it's hard to make peace with folk who keep setting your gate on fire." },
      },
      choices = {
        { text = "The Lady is right. Peace is worth trying.", next = "xorcs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorcs2 = {
      lines = {
        { id = "x_xorcs2", text = "Maybe so, but she isn't the one standing on this wall when the drums start. I'll keep the powder dry and leave the hoping to her." },
      },
      choices = {
        { text = "Someone has to try for peace first.", next = "BACK", reply = "Then I hope it's someone luckier than me.", fx = { align = { light = 1 } } },
        { text = "Keep your powder dry. They'll never change.", next = "BACK", reply = "That's the soldier's faith, and I've kept it a long while.", fx = { align = { light = -1 } } },
      },
    },
    xlord = {
      narr = "He wipes his sooty hands on his trousers, slowly, and does not look up.",
      lines = {
        { id = "x_xlord", text = "Aye, from Southshore, before everything went to ash and plague. I came over with the Lady's fleet and I've not looked back, mostly because I can't bear to." },
      },
      choices = {
        { text = "I'm sorry for what you lost.", next = "BACK", reply = "Kind of you. Now let me get back to my gun before I get maudlin.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    northwatch = { { id = "tp_xnorthwatch", text = "Northwatch Hold, the farthest post Theramore has. We call it the finger in the Horde's eye." } },
    jaina = { { id = "tp_xjaina", text = "Lady Proudmoore built a city out of a swamp. I'd follow her into worse places than this." } },
    _none = { { id = "tp_none", text = "Ask the captain. I aim where I'm told, and I don't ask much else." } },
  },
}

P:NPC {
  key = "bar_cannoneer_whessan", id = 3455, name = "Cannoneer Whessan", gender = "male",
  role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "cheerful" }, values = { "duty" },
  notices = { "faction", "race" },
  impression = {
    first = "A young Theramore gunner sits on a crate beside his cannon, polishing the brass and whistling badly. He snaps to attention a moment too late.",
    third = "{name} met Cannoneer Whessan, a gunner at Northwatch Hold.",
  },
  greetings = {
    { id = "g_default", text = "Oh! At ease, at ease, I mean, good day to you. We don't get many visitors who aren't trying to kill us." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Whessan, second gun on the Northwatch wall. Smythe has the better cannon, but I have the better view of the sea, so I think I came out ahead." } },
      again = { { id = "h_again", text = "Something else? I'm not going anywhere, believe me." } },
      choices = {
        { text = "What can you see from here?", next = "view" },
        { text = "How did you end up in the Barrens?", next = "how" },
        { text = "Do you get along with Smythe?", next = "xsmythe" },
        { text = "Have you ever fired that cannon in anger?", next = "xfired" },
        { text = "Fellow from Lordaeron? Where did you live?", next = "xhome", when = { race = "Human" } },
        { text = "Good day, cannoneer.", next = "END" },
      },
    },
    view = {
      lines = { { id = "v_default", text = "Ships out of Ratchet, the odd pirate sail from the south, and on a clear day the smoke from the Crossroads. I log every one of them for the captain, though nobody seems to read the logs." } },
      choices = {
        { text = "Pirates? This close?", next = "pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates = {
      lines = { { id = "p_default", text = "Southsea pirates, down by the Merchant Coast and the old wrecks. They raid anybody, and they don't fly anybody's colours but their own." } },
      choices = { { text = "I'll watch for them.", next = "BACK" } },
    },
    how = {
      lines = { { id = "h2_default", text = "I followed Lady Proudmoore over from Lordaeron like half of Theramore did, and somebody found out I could count to three while holding a lit fuse. That made me a gunner." } },
      choices = {
        { text = "Lordaeron? Do you miss it?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "Every day, but there's nothing left there to miss, from what I hear. Better a hot tower in the Barrens than a grave in the plaguelands." } },
      choices = { { text = "That's a fair trade.", next = "BACK" } },
    },
    xsmythe = {
      lines = {
        { id = "x_xsmythe", text = "He's a grumpy old soldier and I'm a cheerful young one, so we're a matched set. He taught me how to load a gun without losing a hand, and I taught him three new card games he refuses to admit he likes." },
      },
      choices = {
        { text = "What card games?", next = "xcards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcards = {
      lines = {
        { id = "x_xcards", text = "Mostly a Dalaran thing called Wizard's Crown, which I learned off a sailor who swore he'd learned it from a mage. Smythe loses every hand and says it's because the cards are crooked." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfired = {
      lines = {
        { id = "x_xfired", text = "Twice, at a pirate cutter that sailed too close, and once at a shadow I swore was an orc raider. It turned out to be a very large tortoise, and Smythe has not let me forget it." },
      },
      choices = {
        { text = "You'd rather fire too soon than too late.", next = "xsoon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsoon = {
      lines = {
        { id = "x_xsoon", text = "That's what I said, and Smythe said a gunner who shoots at tortoises will have no powder left when the orcs come. We argued till dawn about it." },
      },
      choices = {
        { text = "Better too soon. Hesitation gets soldiers killed.", next = "BACK", reply = "Ha! I'll tell Smythe a stranger agrees with me.", fx = { align = { order = -1 } } },
        { text = "Smythe's right. Wait for orders and a clear target.", next = "BACK", reply = "You sound just like him, which is a terrible thing to say to a fellow.", fx = { align = { order = 1 } } },
      },
    },
    xhome = {
      lines = {
        { id = "x_xhome", text = "Andorhal, before the plague came through, and then Southshore for a little while. I was lucky enough to be on a boat when the rest of it fell." },
      },
      choices = {
        { text = "Lucky indeed.", next = "BACK", reply = "I try to remember that on the dull days, and up here they're all dull." },
      },
    },
  },
  topics = {
    pirates = { { id = "tp_xpirates", text = "The Southsea pirates sail past now and then to see if we're asleep. We usually aren't." } },
    northwatch = { { id = "tp_xnorthwatch", text = "Best view on the coast, worst food in Kalimdor." } },
    _none = { { id = "tp_none", text = "No idea, friend, but if you find out, come and tell me. It's dreadfully dull up here." } },
  },
}

---------------------------------------------------------------------------
-- Bael'dun Keep: Ironforge dwarves digging in southern Barrens. Friendly to the Alliance only.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_baeldun_excavator", id = 3374, name = "Bael'dun Excavator", gender = "male",
  role = "worker", tier = "service",
  communities = { "ironforge" }, temper = { "gruff" }, values = { "work" },
  notices = { "race" },
  impression = {
    first = "A dusty dwarf leans on a pick beside a fresh trench, wiping his brow with a filthy sleeve.",
    third = "{name} spoke with an excavator at Bael'dun Keep.",
  },
  greetings = {
    { id = "g_default", text = "Watch yer step, {g:lad|lass}, the trench is deeper than it looks and I'm in nae mood to haul ye out." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "We're diggin' for the Bael'dun works, under the old keep. The foreman says there's somethin' worth findin' down there, and I say he'd better be right, for my back's near broken." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A fellow mountain-born, out here in the dust! Pull up a rock, {g:lad|lass}, and tell me how Ironforge fares." },
      },
      again = { { id = "h_again", text = "Aye? Somethin' else?" } },
      choices = {
        { text = "What are you digging for?", next = "dig" },
        { text = "The tauren don't seem happy you're here.", next = "tauren" },
        { text = "How long have you been digging out here?", next = "xlong" },
        { text = "What's the worst thing you've dug up?", next = "xworst" },
        { text = "You're a long way from the mountain, cousin.", next = "xcousin", when = { race = "Dwarf" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    dig = {
      lines = { { id = "d_default", text = "Old dwarven works, from back when Bael'dun was a proper keep. Nobody tells a digger more than that, mind, so I just dig where the foreman points." } },
      choices = {
        { text = "Doesn't that bother you?", next = "bother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bother = {
      lines = { { id = "b_default", text = "It bothers me less than an empty purse. Ironforge pays, the beer comes up from Theramore now and again, and that's enough for a simple digger." } },
      choices = { { text = "Fair enough.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "t_default", text = "Nae, they're not, and they've the right of it in a way, for this was their land first. But we're under orders, and orders don't care whose grass we're turnin'." } },
      choices = {
        { text = "Then leave their land alone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Orders are orders. Keep digging.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    xlong = {
      lines = {
        { id = "x_xlong", text = "Near on two seasons now, since the first ship came in at Theramore and they marched us inland. The ground here is all clay and roots and old bones, and none of it gives way like honest stone." },
      },
      choices = {
        { text = "Do you miss Ironforge?", next = "xmiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmiss = {
      lines = {
        { id = "x_xmiss", text = "Every night, {g:lad|lass}. I miss the Forge's heat and a proper roof of rock over my head, for out here the sky's so big it near gives a dwarf the shakes." },
      },
      choices = {
        { text = "The sky isn't going to fall on you.", next = "xsky" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsky = {
      lines = {
        { id = "x_xsky", text = "So the riflemen tell me, and they laugh while they say it. I'll believe it when I've slept a whole night without wakin' to check." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xworst = {
      narr = "He lowers his voice and glances toward the foreman's board.",
      lines = {
        { id = "x_xworst", text = "A whole ribcage, bigger than a kodo's, wrapped round a rusted iron plate wi' old runes on it. The foreman had it carted off before I could get a proper look, and nobody's spoken of it since." },
      },
      choices = {
        { text = "That sounds like a dwarven relic.", next = "xrelic" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrelic = {
      lines = {
        { id = "x_xrelic", text = "Aye, or a troll's, or somethin' older than both. I'm a digger, not a scholar, so I'll leave the guessin' to the Explorers' League and keep my head down." },
      },
      choices = {
        { text = "Whatever you find belongs to Ironforge. Keep digging.", next = "BACK", reply = "Spoken like the foreman's own conscience. Aye, I'll keep at it.", fx = { align = { order = 1 } } },
        { text = "Whatever you find belongs to this land.", next = "BACK", reply = "The tauren would thank ye for that. I'm nae sure I can afford to.", fx = { align = { order = -1 } } },
      },
    },
    xcousin = {
      lines = {
        { id = "x_xcousin", text = "Aye, and it's good to hear a proper voice out here among all these orders and quarrels. Tell the lads at the Stonefire I'm alive and owe them a round, would ye?" },
      },
      choices = {
        { text = "I'll pass it on.", next = "BACK", reply = "Good. Don't tell them how much I owe, mind.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    bael_dun = { { id = "tp_xbael_dun", text = "Bael'dun was a proper keep once, and now it's a hole wi' walls round it. I'm the one makin' the hole bigger." } },
    theramore = { { id = "tp_xtheramore", text = "The ships come in at Theramore, and the beer comes from there when it comes at all." } },
    _none = { { id = "tp_none", text = "Ask the foreman, he's the one with the maps. I've only got a shovel." } },
  },
}

P:NPC {
  key = "bar_baeldun_foreman", id = 3375, name = "Bael'dun Foreman", gender = "male",
  role = "worker", tier = "service",
  communities = { "ironforge" }, temper = { "stern" }, values = { "work", "duty" },
  notices = { "race", "class" },
  impression = {
    first = "A broad dwarf in a leather apron studies a map pinned to a board with four nails and a dagger. He barks at a digger before he looks up at you.",
    third = "{name} met the foreman at Bael'dun Keep.",
  },
  greetings = {
    { id = "g_default", text = "Ye're no digger, so ye must be a visitor, and I've nae time for visitors. Be quick about it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I run the dig at Bael'dun, which means I take the blame when it floods and the credit goes to someone in Ironforge. What d'ye want?" } },
      again = { { id = "h_again", text = "Still here? Out with it, then." } },
      choices = {
        { text = "What's down there that's worth all this?", next = "worth" },
        { text = "Are the Horde a threat to the dig?", next = "horde" },
        { text = "How many diggers do you have?", next = "xcrew" },
        { text = "What happens if the dig floods?", next = "xflood" },
        { text = "You're a long way from Ironforge, foreman.", next = "xhome", when = { race = "Dwarf" } },
        { text = "I'm Horde. Should I be worried?", next = "xhorde", when = { faction = "Horde" } },
        { text = "Nothing. Good day.", next = "END" },
      },
    },
    worth = {
      lines = { { id = "w_default", text = "The old keep had vaults, and vaults have things in them. That's all a foreman is told, and it's all a visitor is gettin' told as well." } },
      choices = {
        { text = "You don't know, do you?", next = "know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    know = {
      lines = { { id = "k_default", text = "I know it's important enough to send a hundred dwarves to the far side of the sea. Somebody in Ironforge knows more, and I'm content to let it stay their worry." } },
      choices = { { text = "Fair enough.", next = "BACK" } },
    },
    horde = {
      lines = { { id = "h2_default", text = "The tauren and their friends hit our patrols every week now, and the riflemen are stretched thin. If ye've got a sword arm, the officer would take ye on gladly." } },
      choices = {
        { text = "I'll help defend the dig.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're the ones trespassing here.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xcrew = {
      lines = {
        { id = "x_xcrew", text = "Forty-two, the last time I counted, and I count every mornin'. We came out wi' sixty, so ye can work out the rest yourself, and I'd thank ye not to say it aloud." },
      },
      choices = {
        { text = "What happened to the others?", next = "xothers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xothers = {
      lines = {
        { id = "x_xothers", text = "Some went home sick, some took arrows from the grass, and a few walked off toward Ratchet and never came back. A foreman learns to stop askin' which is which." },
      },
      choices = {
        { text = "You owe them answers, foreman. Ask.", next = "BACK", reply = "Easy for ye to say, wi' no ledger to fill. But aye, ye're likely right.", fx = { align = { honor = 1 } } },
        { text = "The dig comes first. Grieve when it's finished.", next = "BACK", reply = "That's how Ironforge sees it, and it's how I've had to see it too.", fx = { align = { honor = -1 } } },
      },
    },
    xflood = {
      lines = {
        { id = "x_xflood", text = "Then we bail, and we curse, and I write a letter to Ironforge explainin' why the dig is a week behind. It's happened twice, for the Barrens look dry but the water's never far under the clay." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhome = {
      lines = {
        { id = "x_xhome", text = "Too far, and for too little, though I'd nae say that where the officer can hear. A dwarf should dig under his own mountain, not under somebody else's grass." },
      },
      choices = {
        { text = "Then why come?", next = "xwhy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhy = {
      narr = "He taps the dagger pinned through his map, twice, without looking at it.",
      lines = {
        { id = "x_xwhy", text = "Because the King's men asked, and when Ironforge asks, a Bronzebeard dwarf says aye before he's thought about it. I thought about it on the boat, which was too late." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhorde = {
      lines = {
        { id = "x_xhorde", text = "Ye're standin' in my camp and I'm still talkin', so ye can work out the rest. Say yer piece and go, before the riflemen work it out too." },
      },
      choices = {
        { text = "I'll go.", next = "END" },
      },
    },
  },
  topics = {
    bael_dun = { { id = "tp_xbael_dun", text = "The keep's older than any of us, and whatever's under it is older still. That's all I know, and all I'm sayin'." } },
    _none = { { id = "tp_none", text = "I've a dig to run. Ask somebody with less on their plate." } },
  },
}

P:NPC {
  key = "bar_baeldun_officer", id = 3378, name = "Bael'dun Officer", gender = "male",
  role = "guard", tier = "service",
  communities = { "ironforge" }, temper = { "stern" }, values = { "duty" },
  notices = { "class", "faction" },
  impression = {
    first = "A dwarf officer in polished mail walks the keep's wall with his hands clasped behind him, glaring out at the plains.",
    third = "{name} spoke with an officer at Bael'dun Keep.",
  },
  greetings = {
    { id = "g_default", text = "State yer business, and quickly. This is a military post, not an inn." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I command the guard here at Bael'dun, such as it is. My orders are to keep the diggers alive and the Horde out, and I'm managin' one of those better than the other." } },
      again = { { id = "h_again", text = "Anythin' else, soldier?" } },
      choices = {
        { text = "Which one are you managing?", next = "which" },
        { text = "Who sent you to the Barrens?", next = "sent" },
        { text = "How many riflemen do you command?", next = "xmen" },
        { text = "What do you think of Theramore's lady?", next = "xjaina" },
        { text = "A dwarf on the wall. How fares the mountain?", next = "xmountain", when = { race = "Dwarf" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    which = {
      lines = { { id = "w_default", text = "The diggers are alive, mostly, but the Horde comes and goes as it likes. Camp Taurajo is too close for comfort, and the tauren have long memories about their land." } },
      choices = {
        { text = "Could you make peace with them?", next = "peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = { { id = "p_default", text = "Peace isnae my department, and it's no theirs either, by the look of the arrows. Talk to Theramore if ye want peace, and talk to me if ye want a crossbow." } },
      choices = {
        { text = "Then give me a crossbow.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Someone should try talking first.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    sent = {
      lines = { { id = "s_default", text = "Ironforge, by way of a ship to Theramore and a long march. The king's men wanted this dig guarded, and I was the lucky dwarf who drew the short straw." } },
      choices = { { text = "Lucky indeed.", next = "BACK" } },
    },
    xmen = {
      lines = {
        { id = "x_xmen", text = "Fewer than I asked for and more than the dig can feed. Every week I put one more on the wall and one less in the trench, and the foreman glares at me like I've stolen his beard." },
      },
      choices = {
        { text = "Who wins that argument?", next = "xargue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xargue = {
      lines = {
        { id = "x_xargue", text = "Whoever the last Horde raid sides with. After a bad night the foreman gives me all the men I want, and after a quiet week he wants them all back to dig." },
      },
      choices = {
        { text = "Soldiers first. The dig means nothing if everyone's dead.", next = "BACK", reply = "Ye'd make a fine officer, and a terrible foreman.", fx = { align = { order = 1 } } },
        { text = "The dig is why you're here. Let them dig.", next = "BACK", reply = "Aye, and when the arrows come, I'll send them to yer tent.", fx = { align = { order = -1 } } },
      },
    },
    xjaina = {
      lines = {
        { id = "x_xjaina", text = "Lady Proudmoore wants peace wi' the orcs, and she's a braver woman than I am for wantin' it. Her soldiers fight well enough at Northwatch, mind, whatever their politics." },
      },
      choices = {
        { text = "Do you want peace?", next = "xpeace2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpeace2 = {
      lines = {
        { id = "x_xpeace2", text = "I want my men home wi' all their fingers, and if peace does that, then aye. But I've seen what a warband does to a camp at night, and I'll believe in peace when they stop doin' it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmountain = {
      lines = {
        { id = "x_xmountain", text = "Better than this place, I'll wager, for at least the mountain has a roof. Tell me, is the Thunderbrew still pourin' in the Commons?" },
      },
      choices = {
        { text = "It is, and it's as strong as ever.", next = "BACK", reply = "Then there's hope for the world yet. Off wi' ye, and stay low on the road.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    camp_taurajo = { { id = "tp_xcamp_taurajo", text = "Camp Taurajo's a day's march south, and every tauren in it would see us gone. I cannae say I blame them." } },
    _none = { { id = "tp_none", text = "That's no my concern. Ask the foreman, or better yet, don't." } },
  },
}

P:NPC {
  key = "bar_baeldun_rifleman", id = 3377, name = "Bael'dun Rifleman", gender = "male",
  role = "guard", tier = "service",
  communities = { "ironforge" }, temper = { "gruff" }, values = { "duty" },
  notices = { "race" },
  impression = {
    first = "A dwarf rifleman squints down the barrel of his long gun at the grassland, his beard braided out of the way of the stock.",
    third = "{name} talked with a rifleman guarding Bael'dun Keep.",
  },
  greetings = {
    { id = "g_default", text = "Dinnae stand in my line, {g:lad|lass}. I've a twitchy finger and a long day behind me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I watch the grass for tauren and quilboar, and I shoot at whichever comes first. It's no glamorous, but the pay comes regular." } },
      again = { { id = "h_again", text = "Aye? Make it quick, I'm watchin'." } },
      choices = {
        { text = "Seen much trouble?", next = "trouble" },
        { text = "That's a fine rifle.", next = "rifle" },
        { text = "Why do you call your rifle Bessie?", next = "xbessie" },
        { text = "Do you ever shoot the tauren?", next = "xtauren" },
        { text = "Teach me something about shooting.", next = "xteach", when = { class = "HUNTER" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    trouble = {
      lines = { { id = "t_default", text = "More than I'd like and less than the officer claims. The tauren come at dusk, as a rule, so I sleep in the afternoons and pray to the forge that they keep to it." } },
      choices = { { text = "Stay sharp, then.", next = "BACK" } },
    },
    rifle = {
      lines = { { id = "r_default", text = "Made in Ironforge, and it's been with me since Dun Morogh. I call her Bessie, for my mother, who had much the same temper." } },
      choices = {
        { text = "Does Bessie ever miss?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "Bessie never misses, but I do, now and then, and she never lets me forget it. A rifle's only as good as the dwarf behind it." } },
      choices = { { text = "Wise words.", next = "BACK" } },
    },
    xbessie = {
      lines = {
        { id = "x_xbessie", text = "After my grandmother, who could hit a rat at forty paces wi' a thrown boot. She'd be proud to see her name on a Thunderbrand long rifle, and she'd tell me I'm holdin' it wrong." },
      },
      choices = {
        { text = "Are you holding it wrong?", next = "xwrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwrong = {
      lines = {
        { id = "x_xwrong", text = "Probably, but I've nae missed a quilboar yet, so I'll keep holdin' it my way. The trick's in the breathin', and in not lettin' the wind tell ye lies." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      narr = "He lowers the rifle a hand's width and looks out over the grass.",
      lines = {
        { id = "x_xtauren", text = "When they come at the wall wi' spears, aye, I do. I'll nae pretend I like it, for they're a proud folk and they fight like they're defendin' their own hearth, which they are." },
      },
      choices = {
        { text = "Then why stay?", next = "xstay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstay = {
      lines = {
        { id = "x_xstay", text = "Because I swore an oath, and a dwarf who breaks his oath is worth less than the iron in his boots. The officer gives the orders, and I keep my oath." },
      },
      choices = {
        { text = "An oath is an oath. Keep it.", next = "BACK", reply = "Aye. That's all a rifleman's got, when it comes to it.", fx = { align = { honor = 1 } } },
        { text = "An oath to a wrong cause isn't worth keeping.", next = "BACK", reply = "Careful, now. Say that on the wall and ye'll be diggin' trenches.", fx = { align = { honor = -1 } } },
      },
    },
    xteach = {
      lines = {
        { id = "x_xteach", text = "Lead yer target and trust yer beast to flush it out for ye. A hunter's pet sees the grass move before any rifleman does, so watch its ears, not the horizon." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", reply = "See that ye do. Off wi' ye, now." },
      },
    },
  },
  topics = {
    quilboar = { { id = "tp_xquilboar", text = "Razormane come right up to the wall some nights, bold as ye like. Bessie teaches them manners." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. I just watch the grass." } },
  },
}

---------------------------------------------------------------------------
-- Horde Axe Thrower: Darkspear guard at the Far Watch Post.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_horde_axe_thrower", id = 9458, name = "Horde Axe Thrower", gender = "male",
  role = "guard", tier = "service",
  communities = { "darkspear" }, temper = { "cheerful" }, values = { "duty" },
  notices = { "race" },
  impression = {
    first = "A Darkspear troll lounges at the Far Watch Post with a bundle of throwing axes slung over his back, watching the road to the Wetlands crossing.",
    third = "{name} talked with a Darkspear axe thrower at the Far Watch Post.",
  },
  greetings = {
    { id = "g_default", text = "Hey, mon, you be keepin' your head low on dis road. Alliance scouts like to sneak down from the north." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be watchin' de north for Thrall, and for me own chief too. Dis post sees everyt'ing comin' out of Ashenvale before it reach de Crossroads." },
        { id = "h_troll", when = { race = "Troll" }, text = "A Darkspear brother on de road! Sen'jin be smilin' on us both today, mon." },
      },
      again = { { id = "h_again", text = "What else you be wantin', mon?" } },
      choices = {
        { text = "What comes out of Ashenvale?", next = "north" },
        { text = "How good is your aim?", next = "aim" },
        { text = "How long have you held this post?", next = "xlong" },
        { text = "What do you think of the night elves?", next = "xelves" },
        { text = "Teach me a trick with the axes.", next = "xtrick", when = { race = "Troll" } },
        { text = "Stay sharp. I'm moving on.", next = "END" },
      },
    },
    north = {
      lines = { { id = "n_default", text = "Night elf scouts, mostly, and sometimes dem dwarves from Bael'dun, though dey usually come from de south. De elves be angry about de lumber camps, and dey have every right, but dat don't mean I let dem past." } },
      choices = {
        { text = "The Horde needs that wood.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Maybe we should leave the forest be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    aim = {
      lines = { { id = "a_default", text = "I can split a kodo's tail hair at twenty paces, and I can do it twice before de kodo notice. De Echo Isles taught me, back when de Darkspear had nothin' but axes and each other." } },
      choices = {
        { text = "Tell me about the Echo Isles.", next = "isles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles = {
      lines = { { id = "i_default", text = "Beautiful islands, mon, and now dey belong to dat witch doctor Zalazane. One day de Darkspear go home, and I be first off de boat." } },
      choices = { { text = "I hope you do.", next = "BACK", fx = { affinity = 1 } } },
    },
    xlong = {
      lines = {
        { id = "x_xlong", text = "Since de first winter after we come to Kalimdor, mon. Dey tell me it be temporary, and dat be four seasons ago, so now I call it home and de grass calls me brudda." },
      },
      choices = {
        { text = "Is it lonely?", next = "xlonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlonely = {
      lines = {
        { id = "x_xlonely", text = "Not with de grunts, mon, dey be good company if you can bear de snoring. De nights be quiet, and I talk to de loa when nobody else listens." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xelves = {
      lines = {
        { id = "x_xelves", text = "Dey be fierce in de woods and dey hate us for de cuttin'. I don't blame dem much, but de Horde need timber to build, and dey won't share a single tree." },
      },
      choices = {
        { text = "Their forest, their rules. We should respect that.", next = "BACK", reply = "Maybe, mon, but tell dat to de peons with de empty axes.", fx = { align = { light = 1 } } },
        { text = "They had ten thousand years. Now it's our turn.", next = "BACK", reply = "Ha, you be a hard one. De loa like hard ones, sometimes.", fx = { align = { light = -1 } } },
      },
    },
    xtrick = {
      narr = "He flicks an axe into a fence post without seeming to look.",
      lines = {
        { id = "x_xtrick", text = "Throw from de hip and let de wrist do de work, not de shoulder. A Darkspear axe spin twice and bite once, and if it spin three times, you be standin' too far away." },
      },
      choices = {
        { text = "I'll practise.", next = "BACK", reply = "Practise on trees, mon, not on grunts.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    ashenvale = { { id = "tp_xashenvale", text = "De forest to de north be beautiful and full of angry elves. I watch it all day." } },
    _none = { { id = "tp_none", text = "Dat be beyond me, mon. Ask somebody at de Crossroads." } },
  },
}

---------------------------------------------------------------------------
-- Koiter: a gentle spirit hovering over the Shrine of the Fallen Warrior.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_koiter", id = 12034, name = "Koiter", gender = "female",
  role = "spirit", tier = "service",
  temper = { "calm" }, values = { "memory" },
  notices = { "race" },
  impression = {
    first = "A pale, winged spirit hovers above the Shrine of the Fallen Warrior, glowing softly in the dust of the Barrens. She seems to be keeping vigil.",
    third = "{name} met Koiter, the spirit who watches over the Shrine of the Fallen Warrior.",
  },
  greetings = {
    { id = "g_default", text = "Be still a moment, traveller. This is a place of remembering, and every visitor makes it a little warmer." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I watch over this shrine, and the warrior who rests beneath it. Few stop here, but those who do are always welcome." } },
      again = { { id = "h_again", text = "Is there more you would ask of me?" } },
      choices = {
        { text = "Who was the fallen warrior?", next = "warrior" },
        { text = "Why do you stay here?", next = "stay" },
        { text = "Were you a warrior too, once?", next = "xonce" },
        { text = "Do other spirits visit you?", next = "xspirits" },
        { text = "The ancestors guide my totems. Do you know them?", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I'll leave you in peace.", next = "END" },
      },
    },
    warrior = {
      lines = { { id = "w_default", text = "One who was loved, and who left too soon. The stone does not need to say more than that, and neither do I." } },
      choices = {
        { text = "Every grave deserves to be remembered.", next = "remember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    remember = {
      lines = { { id = "r_default", text = "Then remember them as you walk on, and the plains will feel a little less empty. That is all any shrine asks." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1 } } },
    },
    stay = {
      lines = { { id = "s_default", text = "Because someone must, and because I am not yet ready to leave. The winds of the Barrens are lonely, but they are kind to those who wait." } },
      choices = { { text = "Thank you for keeping watch.", next = "BACK" } },
    },
    xonce = {
      lines = {
        { id = "x_xonce", text = "I was a healer of the fallen warrior's clan, and when he died I could not let him lie alone. The Earth Mother took pity on me, or perhaps the warrior did, and so I stayed to watch over him." },
      },
      choices = {
        { text = "Do you regret it?", next = "xregret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xregret = {
      lines = {
        { id = "x_xregret", text = "Sometimes, when the wind is cold and nobody passes for a season. But a vigil kept is a promise kept, and the dead need promises more than the living do." },
      },
      choices = {
        { text = "A vigil like yours is the highest honour.", next = "BACK", reply = "You are kind, traveller, and I will remember your face.", fx = { align = { honor = 1 } } },
        { text = "You should rest too. The dead must let go.", next = "BACK", reply = "Perhaps, someday, but not today, and not while he is alone.", fx = { align = { honor = -1 } } },
      },
    },
    xspirits = {
      lines = {
        { id = "x_xspirits", text = "Some, at night, the old clans of the plains who wander between the hills. They speak of rain and of the hunt and never of themselves, for that is the way of spirits." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = {
        { id = "x_xshaman", text = "I know of them, and they know of you, for a shaman's voice carries far among the dead. Speak kindly to the spirits, and they will speak kindly back." },
      },
      choices = {
        { text = "I will.", next = "BACK", reply = "Then go well, child of the elements.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    shrine = { { id = "tp_xshrine", text = "The Shrine of the Fallen Warrior. Lay a stone here when you pass, and he will know." } },
    ancestors = { { id = "tp_xancestors", text = "The ancestors are never far. They walk in the wind across the plains." } },
    _none = { { id = "tp_none", text = "I know only this place, and the quiet. Ask the living." } },
  },
}

---------------------------------------------------------------------------
-- Grimble: goblin shipmaster on the Ratchet docks; the boat to Booty Bay.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_grimble", id = 9558, name = "Grimble", title = "Shipmaster", gender = "male",
  role = "civilian", tier = "service",
  communities = { "ratchet" }, temper = { "brisk" }, values = { "profit", "order" },
  impression = {
    first = "Grimble stands at the end of the pier with a tide chart in one hand and a pocket watch in the other, checking both as if they had personally let him down.",
    third = "{name} met Grimble, the goblin shipmaster who keeps the Ratchet boat to Booty Bay running.",
  },
  greetings = {
    { id = "g_default", text = "Boat to Booty Bay comes in when the sea says so, and not a minute before. Need something while you wait?" },
    { id = "g_back", when = { metBefore = true }, text = "Back on my dock again? The boat hasn't learned to come faster since you left." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Grimble, shipmaster of Ratchet. Every crate, passenger and drowned rat that crosses to Stranglethorn goes past me first, and I keep a ledger of all of them." } },
      again = { { id = "h_again", text = "Anything else, or are you just watching the water?" } },
      choices = {
        { text = "When does the boat to Booty Bay leave?", next = "boat" },
        { text = "Who uses this crossing?", next = "who" },
        { text = "Do you trust the Steamwheedle captains?", next = "captains" },
        { text = "What's the strangest cargo you've logged?", next = "xodd" },
        { text = "How long have you been shipmaster?", next = "xlong" },
        { text = "Ratchet goblin to goblin: what's the real money here?", next = "xmoney", when = { race = "Goblin" } },
        { text = "Safe sailing, shipmaster.", next = "END" },
      },
    },
    boat = {
      lines = { { id = "b_default", text = "She runs back and forth all day, so wait at the end of the pier and she'll find you. Just keep your feet off the edge; the sharks in this bay have learned to wait too." } },
      choices = { { text = "I'll mind the sharks. Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "Orcs, humans, trolls, dwarves, and everyone in between, all of them paying the same fare. The Cartel doesn't care whose flag you carry, so long as your coin is round and your temper stays ashore." } },
      choices = {
        { text = "Neutral ground is worth protecting.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Selling passage to both sides is just greed.", next = "BACK", fx = { align = { order = -1, light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    captains = {
      lines = { { id = "c_default", text = "I trust them to want their pay, and that makes them the most reliable folk on the sea. A captain who drowns his passengers doesn't get paid twice." } },
      choices = { { text = "A fair point. Something else.", next = "BACK" } },
    },
    xodd = {
      lines = {
        { id = "x_xodd", text = "A crate of live crabs addressed to a mage in Theramore, labelled 'books'. They got out halfway across the harbour, and I spent an afternoon chasing books along the pier with a net." },
      },
      choices = {
        { text = "Did you deliver them?", next = "xdeliver" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdeliver = {
      lines = {
        { id = "x_xdeliver", text = "Every last one, and I billed him for the net. A shipmaster's word is the only thing that floats better than his boat, so a crate addressed is a crate delivered." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xlong = {
      lines = {
        { id = "x_xlong", text = "Eleven years, seven months and some days I could count if you'd like. Before that I kept accounts for Baron Revilgaz in Booty Bay, until he decided the books looked better without me reading them." },
      },
      choices = {
        { text = "He sacked you?", next = "xsacked" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsacked = {
      lines = {
        { id = "x_xsacked", text = "Promoted me across the sea, he called it. I call it the best thing that ever happened to me, because Ratchet's quieter, and nobody here throws people off the balcony." },
      },
      choices = {
        { text = "Loyalty to your old boss would have been honourable.", next = "BACK", reply = "Honour is a fine thing, friend, but it doesn't fill a ledger.", fx = { align = { honor = 1 } } },
        { text = "Good riddance. Look after yourself first.", next = "BACK", reply = "That's the Cartel way, and I'm a Cartel goblin to the bone.", fx = { align = { honor = -1 } } },
      },
    },
    xmoney = {
      lines = {
        { id = "x_xmoney", text = "Passage fees, my friend, and the tariff on everything that crosses. The Baron in Booty Bay takes his cut, Gazlowe takes his, and I take a modest one for my troubles." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", reply = "There's no secret, pal. It's posted on the wall in very small writing." },
      },
    },
  },
  topics = {
    booty_bay = { { id = "tp_xbooty_bay", text = "Booty Bay is a fine port if you like pirates, sharks and debt. I prefer my pier." } },
    gazlowe = { { id = "tp_xgazlowe", text = "Gazlowe runs Ratchet and lets me run the pier. Fair trade." } },
    _none = { { id = "tp_none", text = "If it doesn't float, I don't track it. Ask someone on dry land." } },
  },
}

---------------------------------------------------------------------------
-- Erk: orc child by the watch tower north of the Crossroads, with his wolf pup Fang.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_erk", id = 14857, name = "Erk", gender = "male",
  role = "child", tier = "service",
  communities = { "crossroads" }, temper = { "cheerful" }, values = { "family", "courage" },
  impression = {
    first = "A small orc boy sits by the watch tower with a string of fish over his shoulder, while a wolf pup chews hopefully at his boot.",
    third = "{name} met Erk, an orc child who brings fish to the guards north of the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Hey! Are you a real adventurer? Fang thinks you are. He growls at the ones who aren't." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Fang, look, it's our friend again." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Erk, and this is Fang. I catch fish in the lake for the guards, because Guard Kurall says a grunt can't stand watch on an empty belly." } },
      again = { { id = "h_again", text = "Do you want to hear more? I know lots of things." } },
      choices = {
        { text = "Fang is a fine wolf.", next = "fang" },
        { text = "Isn't it dangerous out here for you?", next = "danger" },
        { text = "What do you want to be when you're grown?", next = "grown" },
        { text = "Where do you catch your fish?", next = "xfish" },
        { text = "Where are your parents, Erk?", next = "xparents" },
        { text = "Have you ever met the Warchief?", next = "xthrall" },
        { text = "I'm an orc too. What's your clan?", next = "xclan", when = { race = "Orc" } },
        { text = "Take care of yourself, Erk.", next = "END" },
      },
    },
    fang = {
      lines = { { id = "f_default", text = "He's going to be the biggest wolf in the Barrens. Right now he's mostly teeth and feet, but my father says that's how all the good ones start." } },
      choices = { { text = "I'm sure he'll grow into them.", next = "BACK", fx = { affinity = 1 } } },
    },
    danger = {
      lines = { { id = "d_default", text = "The guards are right here, and the centaur never come this close. Well, almost never. Fang would bite them anyway." } },
      choices = {
        { text = "A brave orc should learn danger early.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You should be home, safe behind the walls.", next = "BACK", fx = { align = { honor = -1, light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grown = {
      lines = { { id = "gr_default", text = "A grunt in Orgrimmar, with a big axe and a helmet with horns on it. Or a fisherman. Fishermen eat better, but grunts get the horns." } },
      choices = { { text = "Why not both?", next = "BACK" } },
    },
    xfish = {
      lines = {
        { id = "x_xfish", text = "At the little pond past the watch tower, where the water's green and the crocolisks are lazy. Fang barks at them so they know we're coming, and they mostly let us be." },
      },
      choices = {
        { text = "Mostly?", next = "xmostly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmostly = {
      lines = {
        { id = "x_xmostly", text = "One bit my boot once, but I hit it with my stick and it let go. Guard Kurall said that was very brave and also very stupid, and I think he meant the brave part more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xparents = {
      lines = {
        { id = "x_xparents", text = "My mother runs the stables, and my father's a grunt at the Mor'shan Rampart, up north where the trees start. He sends me carved wolves sometimes, and Fang tries to eat them." },
      },
      choices = {
        { text = "You must miss your father.", next = "xmiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmiss = {
      lines = {
        { id = "x_xmiss", text = "A bit, but he says a grunt's son must be the strong one at home. So I catch the fish and I don't cry, mostly, unless it's at night." },
      },
      choices = {
        { text = "Strength is keeping on when you're scared. You're doing well.", next = "BACK", reply = "I will be! Fang and me both.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "It's fine to cry, Erk. Warriors weep too.", next = "BACK", reply = "Really? Even big ones? Don't tell Guard Kurall I asked.", fx = { align = { honor = -1 } } },
      },
    },
    xthrall = {
      lines = {
        { id = "x_xthrall", text = "No, but I saw him once, riding through the Crossroads on a big black wolf, and everybody went quiet. When I'm grown I want to ride a wolf exactly like that one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xclan = {
      lines = {
        { id = "x_xclan", text = "My father says we were Frostwolf once, before the camps, but he doesn't like to talk about the camps. He says the Horde is our clan now and that's all a cub needs to know." },
      },
      choices = {
        { text = "He's right.", next = "BACK", reply = "I know! He's always right, except about vegetables.", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    fang = { { id = "tp_xfang", text = "Fang is my wolf. He's little now, but his paws are huge, so he'll be huge too." } },
    crossroads = { { id = "tp_xcrossroads", text = "The Crossroads is the best place in the whole world, because everybody comes through it." } },
    _none = { { id = "tp_none", text = "I don't know that one. You should ask a grown-up. Not that one, though; he's grumpy." } },
  },
}

---------------------------------------------------------------------------
-- Horde Guard: generic Horde guards on Barrens posts. Light entry; the World guard pool covers the rest.
---------------------------------------------------------------------------
P:NPC {
  key = "bar_horde_guard", id = 3501, name = "Horde Guard", gender = "male",
  role = "guard", tier = "service",
  communities = { "crossroads" }, temper = { "stern" }, values = { "duty", "honor" },
  impression = {
    first = "A Horde guard leans on his spear in the dry wind, eyes moving over the grass for anything that walks on two legs or four.",
    third = "{name} spoke with a Horde guard posted in the Barrens.",
  },
  greetings = {
    { id = "g_default", text = "Keep moving, traveller, or tell me what you need. Out here, standing still gets you noticed." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "The Barrens are wide and the Horde is spread thin across them. Quilboar to the south, centaur on every side, and Alliance scouts pushing in from Theramore. What do you need?" } },
      again = { { id = "h_again", text = "Anything else? Make it quick." } },
      choices = {
        { text = "Where is the Crossroads?", next = "road" },
        { text = "What's the greatest threat out here?", next = "threat" },
        { text = "How long have you served the Horde?", next = "xlong" },
        { text = "What do you think of the Crossroads?", next = "xcross" },
        { text = "Tell me about the Razormane.", next = "xrazor" },
        { text = "Lok'tar. Stay sharp.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Follow the road to where it meets itself. You'll see the walls and smell the wind riders long before you hear anyone." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
    threat = {
      lines = { { id = "t_default", text = "The centaur, if you ask me. The Kolkar and the Magram remember when this land was theirs, and they hate us for being here at all." } },
      choices = {
        { text = "Then we drive them out for good.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Perhaps there's room to make peace with some.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlong = {
      lines = {
        { id = "x_xlong", text = "Since the day Thrall broke the camps and called us out, and I followed his banner across the sea. I have held a spear in Durotar, in Ashenvale and now here, and it gets no lighter." },
      },
      choices = {
        { text = "Were you in the camps?", next = "xcamps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcamps = {
      narr = "His grip shifts on the spear, knuckles whitening, then eases.",
      lines = {
        { id = "x_xcamps", text = "Six years, and I will not speak of most of them. Lethargy was the worst of it, the long grey sleep of the blood leaving us, and I thank the spirits the Warchief woke us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcross = {
      lines = {
        { id = "x_xcross", text = "It is the heart of the Barrens, where every road meets and every caravan stops. Lose the Crossroads and the Horde is cut in half, so we guard it like our own blood." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xrazor = {
      lines = {
        { id = "x_xrazor", text = "The quilboar of the Razormane breed in the thorns to the south and come out in packs. Some say they only defend their land, but they raid caravans and kill peons for sport." },
      },
      choices = {
        { text = "Crush them before they grow stronger.", next = "BACK", reply = "That is a warrior's answer, and a sound one.", fx = { align = { honor = 1 } } },
        { text = "Some of them might be bargained with.", next = "BACK", reply = "Bargain with a quilboar? You'll lose your fingers counting.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    crossroads = { { id = "tp_xcrossroads", text = "The Crossroads. Every road in the Barrens runs through it, which makes it worth dying for." } },
    thrall = { { id = "tp_xthrall", text = "The Warchief freed us. I will die before I let his Horde fall." } },
    _none = { { id = "tp_none", text = "Ask at the Crossroads. I just watch the road." } },
  },
}
