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

    drill = {
      lines = { { id = "dr_default", text = "A spinning head of hardened bits, a gyroscope to keep it pointed the right way, and an engine strong enough to push both through granite. The trouble is the engine, because the strong ones are too heavy and the light ones give out halfway through a hill." } },
      choices = {
        { text = "Hence the goblin part.", next = "goblin" },
        { text = "Something else.", next = "BACK" },
      },
    },

    goblin = {
      big = true,
      lines = { { id = "go_default", text = "Because it works, and that's the only reason I need. The goblins in the Deadmines built a shredder with a power core better than anything we have left, and the Tinkmaster turned his nose up at it, but I'd use troll mojo if it got me through the rock." } },
      choices = {
        { text = "Use whatever works. Pride never dug a tunnel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Goblin parts fail. Build it the gnomish way, properly.", next = "BACK", fx = { align = { order = 1 } } },
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
        { text = "Safe travels, Argos.", next = "END" },
      },
    },

    gershala = {
      lines = { { id = "ge_default", text = "A corruption in Darkshore, creeping through the beasts and the furbolgs, and something wrong with the land itself that no one in Auberdine can explain. Gershala studies it, and writes to me, and every letter is a little more worried than the one before." } },
      choices = {
        { text = "What does he think is causing it?", next = "cause" },
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
        { text = "Something else.", next = "BACK" },
      },
    },

    city = {
      lines = { { id = "ci_default", text = "It is stone, and stone, and more stone, and the people build as though they mean to outlast the mountains. I do not understand it, but I admire it a little, and I have learned to like their bread, which surprised me." } },
      choices = {
        { text = "Wait until you try the cheese.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    auberdine = {
      lines = { { id = "au_default", text = "A town of white stone and moonwells on the shore, where the ships come in from Menethil and Teldrassil. It is beautiful in the evening, when the lamps are lit along the water, and I have not seen it for three seasons." } },
      choices = {
        { text = "You'll see it again.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
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
  },

  topics = {
    teldrassil = { { id = "tp_teldrassil", text = "Our new home, and still a little strange to me. I miss the old forests more than I can say." } },
    _none = { { id = "tp_none", text = "I am a stranger here, and I do not know. Ask one of the humans; they seem to know everything, or say they do." } },
  },
}

---------------------------------------------------------------------------
-- Mazen Mac'Nadir
---------------------------------------------------------------------------
P:NPC {
  key = "mazen", id = TODO_NPC("Mazen Mac'Nadir"), name = "Mazen Mac'Nadir",
  bible = "bibles/city_quests.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "fussy", "kindly" }, values = { "knowledge", "order" },
  notices = { "class" },

  impression = {
    first = "Mazen Mac'Nadir keeps the library of the Academy of Arcane Arts and Sciences and counts its enchanted books the way a shepherd counts sheep. He spoke kindly of his assistant Dellis, and despaired of him in the same breath.",
    third = "{name} met Mazen Mac'Nadir, the mage who keeps the Academy's library of magical tomes in Stormwind's Canals.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, please, quietly. Some of these books are asleep, and you do not want to be here when they wake." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Do touch nothing on the third shelf; it bit a visitor this morning." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! You'll know the rules, then: no fire, no portals, and no reading aloud from anything bound in skin." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Your sort is welcome to read here, but I'll count the books twice when you leave, and you'll forgive me for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mazen Mac'Nadir, caretaker of the works here in the library of the Academy of Arcane Arts and Sciences. It is my responsibility to see that every magical tome and scroll is accounted for at all times, because who knows what folly would follow if one fell into the wrong hands?" },
        { id = "h_behest", tags = { "news" }, when = { questActive = TODO_QUEST("Mazen's Behest") },
          text = "You'll help Dellis? Bless you. He's quite able in the library and quite hopeless the moment he steps outside the city gates, and he made a horrible mistake last week that I'd rather he told you about himself." },
        { id = "h_behest_done", when = { questDone = TODO_QUEST("Mazen's Behest") },
          text = "Dellis tells me it wasn't his fault, really it wasn't, and I've decided to believe him for the sake of my own peace. Thank you for helping him." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down, the scrolls are listening." },
        { id = "h_again2", text = "Ask, ask. Quietly." },
      },
      choices = {
        { text = "What's so dangerous about a book?", next = "books" },
        { text = "Tell me about Dellis.", next = "dellis" },
        { text = "Who uses this library?", next = "readers" },
        { text = "Have any books ever gone missing?", next = "missing" },
        { text = "Could I study here?", next = "study", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "I'll leave you to your shelves.", next = "END" },
      },
    },

    books = {
      lines = { { id = "bo_default", text = "Some of them hold spells that want to be cast, and they'll whisper to anyone who sits too close. Others only hold knowledge, which is worse, because knowledge never wears off once it's in your head." } },
      choices = {
        { text = "Then why keep them at all?", next = "keep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      big = true,
      lines = { { id = "ke_default", text = "Because burning a book doesn't unwrite what's in it; it only means that the next person who learns it learns it alone. Some of the Academy's masters would burn the worst of them anyway, and I've stood in front of the shelves more than once." } },
      choices = {
        { text = "Lock them away. Knowledge belongs to those who'll guard it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let anyone read them. Knowledge shouldn't be locked up.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dellis = {
      lines = { { id = "de_default", text = "Acolyte Dellis, my assistant, who can find any scroll in this library blindfolded and can't find his own way to Goldshire with a map. He means well, and he works hard, and he really ought never to be allowed outside." } },
      choices = {
        { text = "What did he do?", next = "dellis_mistake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dellis_mistake = {
      lines = { { id = "dm_default", text = "He was sent outside the walls with supplies for the Academy and came back without them, and without a very good story either. I'll let him tell you the rest, because he tells it better, or at least longer." } },
      choices = {
        { text = "I'll go and hear it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    readers = {
      lines = { { id = "re_default", text = "Apprentices from the Mage Quarter, mostly, and the odd priest from the Cathedral looking for something the Light forgot to mention. Collin Mauren comes in to read about basilisks and never puts anything back where he found it." } },
      choices = {
        { text = "Basilisks?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    missing = {
      lines = { { id = "mi_default", text = "One, years ago, a small volume on binding that walked out under a student's robe. We found the student in Duskwood six months later and never found the book, and I've counted every shelf twice a day since." } },
      choices = {
        { text = "That's a grim story.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    study = {
      lines = {
        { id = "st_default", text = "You may, at the long table where I can see you, and with nothing taken off the premises. Ask me for a subject and I'll bring you the book, and I'll take it away again when you start to look too interested." },
        { id = "st_warlock", when = { class = "WARLOCK" }, text = "You may, at the long table directly in front of my desk, and you'll forgive me if I watch you the whole time. I've read what your sort read, and I know how it ends." },
      },
      choices = {
        { text = "That's fair, Mazen.", next = "BACK", fx = { affinity = 1 } },
        { text = "You worry too much.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'd have to look it up, and I'd rather not, so I'll say I don't know." } },
  },
}
