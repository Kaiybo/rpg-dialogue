-- Stormwind quest givers not yet written: Shoni the Shilent (Dwarven District; Gnomeregan's underground assault crew),
-- Argos Nightwhisper (the Park; The Corruption Abroad) and Mazen Mac'Nadir (the Academy library in the Canals; Mazen's Behest).
-- Voices: bibles/city_quests.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Shoni the Shilent
---------------------------------------------------------------------------
P:NPC {
  key = "shoni", id = TODO_NPC("Shoni the Shilent"), name = "Shoni the Shilent",
  bible = "bibles/city_quests.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "brisk", "chatty" }, values = { "invention", "loyal" },
  notices = { "race", "class" },

  impression = {
    first = "Shoni the Shilent commands Gnomeregan's underground assault crew from a corner of the Dwarven District, and she is not silent in the least. She explained her drilling machines to me twice, faster the second time.",
    third = "{name} met Shoni the Shilent in Stormwind, the gnome who means to tunnel back into Gnomeregan with her gyrodrillmatic excavationators.",
  },

  greetings = {
    { id = "g_default", text = "Yes, yes, I know the name, everyone has a joke about the name, and I've heard all of them, so let's skip ahead to the part where you help me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good, I've been talking to the drills all morning, and they're terrible listeners." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, and a sturdy-looking one! Can you hold a lamp steady in a tunnel for six hours? Don't answer, I'll find out." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! You people dig like it's breathing. Come and tell me what's wrong with my drill bits, because I'm sure something is." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Shoni, commander of the Gnomeregan underground assault crew. Gnomeregan has fallen to those dastardly troggs, and the High Tinker's people can't walk in the front door, so we're going to come up through the floor with a fleet of gyrodrillmatic excavationators." },
        { id = "h_speak", tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Shoni") },
          text = "Gnoarn sent you? Wonderful, wonderful, he's the only one in Tinker Town who believes in the drills. Well, the only one who says so out loud." },
        { id = "h_assault", tags = { "news" }, when = { questActive = TODO_QUEST("Underground Assault") },
          text = "The shredder's power supply, the Gnoam Sprecklesprocket, is still inside that goblin machine in the Deadmines. Bring it back intact, and I mean intact, because a cracked one goes off like a firework." },
        { id = "h_assault_done", tags = { "news" }, when = { questDone = TODO_QUEST("Underground Assault") },
          text = "The Sprecklesprocket hums like a happy cat! The first excavationator's already running on it, and it's chewed through two flagstones and a dwarf's boot, which he's forgiven me for, mostly." },
        { id = "h_guts", tags = { "news" }, when = { questActive = TODO_QUEST("Gyrodrillmatic Excavationators") },
          text = "Two dozen robo-mechanical guts, from the bots in Gnomeregan. They wander about down there like cattle on an open range, so go and do some unkind things to them on my behalf." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, I've a drill cooling." },
        { id = "h_again2", text = "Go on, I've time while the gears settle. Not much, but some." },
      },
      choices = {
        { text = "Why are you called the Shilent?", next = "name" },
        { text = "How does a gyrodrillmatic excavationator work?", next = "drill" },
        { text = "Why use a goblin power supply?", next = "goblin" },
        { text = "Do you really think you can retake the city?", next = "retake" },
        { text = "I worked on the Gnomeregan defenses myself.", next = "gnome", when = { race = "Gnome" } },
        { text = "Who's on this crew of yours?", next = "crew" },
        { text = "What does the High Tinker make of all this?", next = "mekka" },
        { text = "How did Gnomeregan fall, exactly?", next = "fall" },
        { text = "Why dig from Stormwind and not Ironforge?", next = "where" },
        { text = "Your drill bits are tempered wrong, I'd wager.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I've been through the Deadmines. I've seen that shredder.", next = "xdeadmines", when = { cleared = "The Deadmines" } },
        { text = "I lost everything when Gnomeregan fell.", next = "xrefugee", when = { origin = "gnome_gnomeregan_refugee" } },
        { text = "I was in the rearguard when we evacuated.", next = "xrearguard", when = { origin = "gnome_rearguard" } },
        { text = "I'm a tinker's apprentice. Need another pair of hands?", next = "xapprentice", when = { origin = "gnome_tinker_apprentice" } },
        { text = "I'm an engineer. Show me the schematics.", next = "xengineer", when = { profession = "Engineering" } },
        { text = "So when do you start drilling?", next = "launch", when = { questDone = TODO_QUEST("Gyrodrillmatic Excavationators") } },
        { text = "Good luck with the drilling.", next = "END" },
      },
    },

    name = {
      lines = { { id = "na_default", text = "Because I talked the whole way through a twelve-hour shift at the Institute, and someone called me Shoni the Silent as a joke, and it came out wrong after a few ales. It stuck, and by now I've decided it's a title, and I'd thank you to say it properly." } },
      choices = {
        { text = "Shoni the Shilent. Properly said.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else, Shoni.", next = "BACK" },
      },
    },

    drill_count = {
      lines = { { id = "dc_default", text = "Three, if you count the one in pieces, and four if you count the one in pieces at the bottom of the canal, which the harbor watch would rather I didn't. The one that works is called Bessie, after my aunt, who also went through walls." } },
      choices = {
        { text = "How did one end up in the canal?", next = "drill_canal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drill_canal = {
      lines = { { id = "dca_default", text = "It reached the canal before it reached the bottom of the hill, which I'd call an error of about forty degrees and a great deal of water. Nobody drowned, and the Dwarven District has a lovely new fountain, which I maintain was always the plan." } },
      choices = {
        { text = "Every failure is data. Keep going.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Test properly before you flood the city again.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    crew = {
      lines = { { id = "cr_default", text = "Six gnomes, two dwarves who lost a bet, and a goblin I'm not supposed to mention, who does the wiring. Most of the gnomes came out of Gnomeregan with nothing but their boots, so they've a stake in getting back in, and they work like it." } },
      choices = {
        { text = "A goblin, on a Gnomeregan crew?", next = "crew_goblin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_goblin = {
      lines = { { id = "cg_default", text = "Steamwheedle, not those Venture Company thugs, and he charges me a fortune, and he's the best wiring man I've ever met. If the High Tinker ever asks, he's a very short dwarf with a sunburn.", fx = { learn = { "steamwheedle" } } } },
      choices = {
        { text = "You shouldn't lie to the High Tinker.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What Mekkatorque doesn't know won't hurt him.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mekka = {
      lines = { { id = "mk_default", text = "He thinks it's bold, and brave, and slightly mad, which from the High Tinker is the highest praise there is. He's given me his blessing, some funding and a very stern look, in that order." } },
      choices = {
        { text = "And Tinkmaster Overspark?", next = "overspark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    overspark = {
      lines = { { id = "ov_default", text = "Overspark thinks the front door's the only door, and that goblin parts insult the whole race, and he says both very loudly at meetings. He's brilliant and he's wrong, and I'll forgive him the minute I come up through his floor." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    fall = {
      lines = { { id = "fa_default", text = "Troggs boiled up out of the deep places, and we fought them, and the High Tinker took Thermaplugg's advice and flooded the lower city with radiation to kill them. It killed them, and it killed most of us, and the troggs came back anyway.", fx = { learn = { "troggs", "gnomeregan" } } } },
      choices = {
        { text = "Thermaplugg betrayed you all.", next = "fall_thermaplugg" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fall_thermaplugg = {
      lines = { { id = "ft_default", text = "That's what they say in Tinker Town, and I believe it, though I worked two floors under him once and he always said good morning. People are complicated, and traitors more than most." } },
      choices = {
        { text = "Traitors should pay. Every one of them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Take the city back first. Justice can wait.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    where = {
      lines = { { id = "wh_default", text = "Because Ironforge's tunnels are full of dwarves who think they invented the very idea of digging, and Stormwind has room, cheap rent and a regent who doesn't ask questions about loud noises at night. Also the dwarves here lend me tools, and the ones in Ironforge want them back." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    deadmines = {
      lines = { { id = "dm_default", text = "Because the Defias hired goblins to build their fleet, and goblins build the best shredders anywhere, and the Defias pay well with money they've stolen from somebody else. Somewhere under Moonbrook there's a whole ship, I'm told, and I'd love to know how they got it down there.", fx = { learn = { "deadmines", "defias" } } } },
      choices = {
        { text = "The Defias are thieves. Hang the lot of them.", next = "BACK", fx = { align = { order = 1 }, opinion = { defias = "hardline" } } },
        { text = "The Defias were cheated by the nobles first.", next = "BACK", fx = { align = { order = -1 }, opinion = { defias = "masons_wronged" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdwarf = {
      lines = { { id = "xd_default", text = "I knew it, I knew something was off! They come out of the forge blue and go into the rock grey and come out of the rock looking like a chewed spoon, so is it the quench? Tell me it's the quench." } },
      choices = {
        { text = "It's the quench. Oil, not water.", next = "xdwarf_after", fx = { affinity = 2, trait = { practical = 1 } } },
        { text = "I'm a dwarf, not a smith. Ask Ironforge.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xdwarf_after = {
      lines = { { id = "xda_default", text = "Oil! Every dwarf in this district has been telling me it's the quench for months, and not one of them said oil, and I'm beginning to think they were enjoying themselves. Thank you, truly; Bessie thanks you too." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xdeadmines = {
      lines = { { id = "xdm_default", text = "Then you've seen Sneed's shredder up close! Was it as beautiful as they say, all pistons and teeth, or did you mostly see the teeth?" } },
      choices = {
        { text = "Mostly the teeth.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "It was a fine machine. A shame to break it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Why was it down there at all?", next = "deadmines" },
      },
    },

    xrefugee = {
      lines = { { id = "xr_default", text = "So did everyone on my crew, and some of us lost people too, and I won't pretend a drill fixes that. But I'd rather be digging toward home than sitting in Tinker Town weeping into my soup, and there's a shovel here with your name on it whenever you want it." } },
      choices = {
        { text = "I'll think about it.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'm not going back. Ever.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    xrearguard = {
      lines = { { id = "xrg_default", text = "Then you held the doors while the rest of us ran, and I owe you a drink at the very least. Did you see the old engineering hall on your way out? I need to know whether the floor's still there, or whether I'm drilling into a lake." } },
      choices = {
        { text = "It was flooded, the last I saw.", next = "BACK", fx = { affinity = 1, learn = { "gnomeregan" } } },
        { text = "I didn't look back. I couldn't.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },

    xapprentice = {
      lines = { { id = "xa_default", text = "Always! Can you strip a gyroscope blindfolded? No? Well, you will by the end of the week, if you come by in the evenings, and you'll learn more in a month on my crew than in a year of sweeping some tinker's floor." } },
      choices = {
        { text = "I'll come by.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xengineer = {
      lines = { { id = "xe_default", text = "A real engineer, finally! Here, look at the gearing on the main shaft, no, the other way up, and tell me honestly whether the torque ratio is mad or merely ambitious." } },
      choices = {
        { text = "Merely ambitious.", next = "BACK", fx = { affinity = 1 } },
        { text = "Mad. Completely mad. I love it.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    launch = {
      lines = { { id = "la_default", text = "Soon, very soon! The guts you brought have given me four new servo arms, and a spare for when the first four go up in smoke, so as soon as the bits stop chewing themselves we go down, and then we go home." } },
      choices = {
        { text = "Save me a place in the first tunnel.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    drill = {
      lines = { { id = "dr_default", text = "A spinning head of hardened bits, a gyroscope to keep it pointed the right way, and an engine strong enough to push both through granite. The trouble is the engine, because the strong ones are too heavy and the light ones give out halfway through a hill." } },
      choices = {
        { text = "Hence the goblin part.", next = "goblin" },
        { text = "How many of these have you built?", next = "drill_count" },
        { text = "Something else.", next = "BACK" },
      },
    },

    goblin = {
      big = true,
      lines = { { id = "go_default", text = "Because it works, and that's the only reason I need. The goblins in the Deadmines built a shredder with a power core better than anything we have left, and the Tinkmaster turned his nose up at it, but I'd use troll mojo if it got me through the rock." } },
      choices = {
        { text = "Use whatever works. Pride never dug a tunnel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Goblin parts fail. Build it the gnomish way, properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Why is a goblin shredder in the Deadmines?", next = "deadmines" },
        { text = "Something else.", next = "BACK" },
      },
    },

    retake = {
      lines = { { id = "re_default", text = "I have to, or I'd be just another gnome sitting in Tinker Town waiting for someone else to do it. One tunnel, one crew, one good push up through the floor of the old engineering hall, and the troggs won't know what hit them." } },
      choices = {
        { text = "And the radiation?", next = "radiation" },
        { text = "Something else.", next = "BACK" },
      },
    },
    radiation = {
      lines = { { id = "ra_default", text = "That's Ozzie's problem, and Razzle's, up in Kharanos. My job is getting us in, and theirs is making sure we don't glow when we get there, and I trust them, mostly, though I keep a lead apron by the door." } },
      choices = {
        { text = "That's a sensible apron.", next = "BACK", fx = { trait = { witty = 1 }, learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnome = {
      lines = { { id = "gn_default", text = "Then you know the old service shafts under the eastern wing? We might come up through one of them, if they haven't collapsed, so come and look at my maps and tell me which ones you remember." } },
      choices = {
        { text = "Show me the maps.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'd rather forget them.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "Home, and I'm going to drill my way back into it if it takes every bit in Stormwind." } },
    deadmines = { { id = "tp_deadmines", text = "Full of goblins with very good engines and very bad manners. I'd like their engines, please." } },
    _none = { { id = "tp_none", text = "No idea, and I'm too busy to guess. Ask me about drills." } },
  },
}

---------------------------------------------------------------------------
-- Argos Nightwhisper
---------------------------------------------------------------------------
P:NPC {
  key = "argos", id = TODO_NPC("Argos Nightwhisper"), name = "Argos Nightwhisper",
  bible = "bibles/city_quests.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "calm", "weary" }, values = { "family", "nature" },
  notices = { "race", "class" },

  impression = {
    first = "Argos Nightwhisper sits beneath the trees of Stormwind's park as if he were trying to remember a forest, and he asked for help with the patience of someone who has asked many times before.",
    third = "{name} met Argos Nightwhisper in Stormwind's park, a night elf who came across the sea to find help for his brother in Darkshore.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, stranger. Stormwind is a loud city, and this park is the only corner of it where I can hear myself think." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The trees here are young and a little lonely, and so am I, so sit a while." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of the Kaldorei, here, among the humans! Tell me, how fares Auberdine? I have been away too long." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You will feel it too, then, the strain in the land across the sea, even from this far away." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I am Argos Nightwhisper. I have travelled from afar to seek help, because it is said that brave adventurers roam these city streets, and my brother Gershala needs help in Darkshore, in the seaside town of Auberdine." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Corruption Abroad") },
          text = "You will go to Gershala? Thank you. Take the ship from Menethil Harbor to Auberdine, and tell him that his brother sent you, and that I am well, even if Stormwind's food is not." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Corruption Abroad") },
          text = "A letter came from Gershala on the last ship, and it says a {class} came to help him. I knew it was you before I read the name." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have time; I have had little else since I came here." },
        { id = "h_again2", text = "Ask. The park is quiet, and I do not mind talking." },
      },
      choices = {
        { text = "What troubles your brother?", next = "gershala" },
        { text = "Why come to Stormwind for help?", next = "why" },
        { text = "What do you make of Stormwind?", next = "city" },
        { text = "Tell me about Auberdine.", next = "auberdine" },
        { text = "How fares Darkshore, brother?", next = "kaldorei", when = { race = "NightElf" } },
        { text = "What did you do, back in Auberdine?", next = "self" },
        { text = "I stood watch at Auberdine. I know your brother.", next = "xwatch", when = { origin = "nightelf_auberdine_watch" } },
        { text = "I feel it too. Something is wrong over there.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Elune watches over your brother, Argos.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Why should a human cross the sea for the kaldorei?", next = "xhuman", when = { race = "Human" } },
        { text = "I met Gershala. He's well.", next = "xmet", when = { questDone = TODO_QUEST("The Corruption Abroad") } },
        { text = "I brought Gershala his brain stems.", next = "xstems", when = { questDone = TODO_QUEST("Researching the Corruption") } },
        { text = "Safe travels, Argos.", next = "END" },
      },
    },

    gershala = {
      lines = { { id = "ge_default", text = "A corruption in Darkshore, creeping through the beasts and the furbolgs, and something wrong with the land itself that no one in Auberdine can explain. Gershala studies it, and writes to me, and every letter is a little more worried than the one before." } },
      choices = {
        { text = "What does he think is causing it?", next = "cause" },
        { text = "What is your brother like?", next = "gershala_like" },
        { text = "What do his letters say?", next = "letters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cause = {
      big = true,
      lines = { { id = "ca_default", text = "He does not say, and that frightens me more than any answer would. Some of our people want the Sentinels to burn out the sick places and start again, and others say the forest must be healed and not cut, and my brother has always been one of the second." } },
      choices = {
        { text = "Heal it if you can. Fire is a last resort.", next = "BACK", fx = { align = { light = 1 }, learn = { "furbolgs" } } },
        { text = "Burn out the sickness before it spreads.", next = "BACK", fx = { align = { light = -1 }, learn = { "furbolgs" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "Because Darnassus has its own troubles, and its Sentinels are stretched thin from Ashenvale to the coast. The humans have heroes enough that they send them to fight in other people's lands, and I thought perhaps one of them might come to ours." } },
      choices = {
        { text = "That's a fair hope.", next = "BACK", fx = { affinity = 1, learn = { "sentinels" } } },
        { text = "Darnassus has troubles of its own?", next = "why_darnassus" },
        { text = "Something else.", next = "BACK" },
      },
    },

    city = {
      lines = { { id = "ci_default", text = "It is stone, and stone, and more stone, and the people build as though they mean to outlast the mountains. I do not understand it, but I admire it a little, and I have learned to like their bread, which surprised me." } },
      choices = {
        { text = "Wait until you try the cheese.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "What have you seen of the city so far?", next = "city_seen" },
        { text = "Do the humans treat you well?", next = "city_humans" },
        { text = "Something else.", next = "BACK" },
      },
    },

    auberdine = {
      lines = { { id = "au_default", text = "A town of white stone and moonwells on the shore, where the ships come in from Menethil and Teldrassil. It is beautiful in the evening, when the lamps are lit along the water, and I have not seen it for three seasons." } },
      choices = {
        { text = "You'll see it again.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What will you do, when you're home again?", next = "auberdine_home" },
        { text = "Something else.", next = "BACK" },
      },
    },

    kaldorei = {
      lines = { { id = "ka_default", text = "Worse than when I left, from what my brother writes, and he is not a man who frightens easily. Go to him if you can, sister or brother of the night, for he would sooner trust one of our own than any human." } },
      choices = {
        { text = "I'll go to him.", next = "BACK", fx = { affinity = 2, learn = { "teldrassil" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gershala_like = {
      lines = { { id = "gl_default", text = "Clever, and stubborn, and far braver than I am, though he would deny it. He studies the satyr and the naga, the things our own people became, because he believes we must understand them before we can be certain we will never follow." } },
      choices = {
        { text = "That's dangerous work.", next = "gershala_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gershala_danger = {
      lines = { { id = "gd_default", text = "It is, and I told him so, and he told me that a brother who worries is a brother with too little to do. So I crossed the sea to find him help, which I suppose proves his point." } },
      choices = {
        { text = "Understanding the enemy is worth the risk.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some knowledge costs too much. Tell him to stop.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters = {
      lines = { { id = "le_default", text = "That the bears of the forest have grown savage, that the Blackwood furbolgs have turned on their neighbours, and that the moonwells near the coast taste wrong. His last letter stopped in the middle of a sentence, and the next began as if nothing had happened, and I have not slept well since.", fx = { learn = { "furbolgs" } } } },
      choices = {
        { text = "What does he think is causing it?", next = "cause" },
        { text = "Something else.", next = "BACK" },
      },
    },

    why_darnassus = {
      lines = { { id = "wd_default", text = "Teldrassil is young, and the old forests of Ashenvale fall to the orcs' axes, and our elders argue still over whether the new tree was wisely planted. I will not say which side I take, here among strangers, but I will say that the arguing is loud." } },
      choices = {
        { text = "Planting a new world tree was a bold choice. Good.", next = "BACK", fx = { align = { order = -1 }, learn = { "teldrassil" } } },
        { text = "Some things shouldn't be rushed, even trees.", next = "BACK", fx = { align = { order = 1 }, learn = { "teldrassil" } } },
        { text = "The orcs are cutting Ashenvale?", next = "ashenvale" },
      },
    },
    ashenvale = {
      lines = { { id = "as_default", text = "They cut it for their war and their fires, and the Sentinels fight them for every tree. I am no warrior, but I have heard an old tree fall, and it is a sound I will carry with me until I die.", fx = { learn = { "ashenvale" } } } },
      choices = {
        { text = "The Horde will answer for every tree.", next = "BACK", fx = { align = { light = -1 }, opinion = { orcs = "hate" } } },
        { text = "Perhaps peace is possible, if both sides want it.", next = "BACK", fx = { align = { light = 1 }, opinion = { peace = "for" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    self = {
      lines = { { id = "sf_default", text = "I kept the records of the moonwell in Auberdine, who came to it and what they asked of Elune, which was quiet work and suited me well. My brother calls me a scribe with a scribe's courage, and he is not entirely wrong." } },
      choices = {
        { text = "Crossing the sea alone took courage.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    city_seen = {
      lines = { { id = "cs_default", text = "The Cathedral, which is beautiful and loud with bells, and the harbor, which is beautiful and loud with sailors, and this park, which is merely beautiful. A child in the Trade District asked whether my ears were real, and I let her touch one, and her mother nearly fainted." } },
      choices = {
        { text = "You've made a friend for life.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    city_humans = {
      lines = { { id = "ch_default", text = "Kindly, mostly, with a great deal of staring. One baker charged me twice what he charged a human for bread, and when I paid without a word he gave me the second loaf for nothing, so I think he was ashamed of himself." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    auberdine_home = {
      lines = { { id = "ah_default", text = "Walk the shore at dusk with Gershala, if he will leave his jars, and sit by the moonwell until the stars come out. Small things, which I did not know were large until there was a sea between us." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xwatch = {
      lines = { { id = "xw_default", text = "Then you have seen him walking the shore at night, muttering to himself. Tell me true, as one of Auberdine to another: does he look well, or does he look like a man who has stopped eating?" } },
      choices = {
        { text = "He's tired, but he's well.", next = "xwatch_after", fx = { trait = { kind = 1 } } },
        { text = "He's thin. He needs you home.", next = "xwatch_after", fx = { trait = { honest = 1 } } },
      },
    },
    xwatch_after = {
      lines = { { id = "xwa_default", text = "Thank you for telling me plainly. I think I will take the next boat when this is done, whatever my brother says about waiting here for help." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xdruid = {
      lines = { { id = "xd_default", text = "Then I am not imagining it, and neither is Gershala. Tell the druids of the Cenarion Enclave in Darnassus that the coast is sickening, and that a scribe in Stormwind's park says so, if they have not already heard it.", fx = { learn = { "cenarion_circle" } } } },
      choices = {
        { text = "I'll tell them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xpriest = {
      lines = { { id = "xp_default", text = "I pray she does, every night the moon rises over this city of stone. It is strange to pray to her here; she looks just the same, but she feels further away." } },
      choices = {
        { text = "She's no further. Faith crosses any sea.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Prayers won't help him. Hands will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xhuman = {
      lines = { { id = "xh_default", text = "Because we stood together at Mount Hyjal, or so I am told, and because I would help a human's brother if he came to me. If that is not enough, I can only say please, which is all I have left to offer." } },
      choices = {
        { text = "The Alliance is bound together. I'll go.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go because you asked, not for any alliance.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xmet = {
      lines = { { id = "xm_default", text = "He wrote that you were patient with him, which means he talked at you for an hour about brain stems. Thank you; I breathe a little easier now that someone has seen his face for me." } },
      choices = {
        { text = "He spoke of you, too.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xstems = {
      lines = { { id = "xs_default", text = "His last letter said the change begins in the mind, long before the body follows, and that those it happens to rarely notice. I have read that line many times, and I do not like what it means for any of us." } },
      choices = {
        { text = "Your people are stronger than the satyr were.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Anyone can fall. Watch yourselves closely.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    teldrassil = { { id = "tp_teldrassil", text = "Our new home, and still a little strange to me. I miss the old forests more than I can say." } },
    _none = { { id = "tp_none", text = "I am a stranger here, and I do not know. Ask one of the humans; they seem to know everything, or say they do." } },
  },
}
