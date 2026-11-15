-- Bloodhoof Village: Cairne's tribe on the plains below the bluffs. Voice: bibles/mulgore.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baine", id = TODO_NPC("Baine Bloodhoof"), name = "Baine Bloodhoof",
  bible = "bibles/mulgore.md", role = "noble", tier = "major",
  communities = { "bloodhoof" }, temper = { "calm" }, values = { "wise", "loyal", "kind" },
  notices = { "race", "form" },

  greetings = {
    { id = "g_tent", text = "Be welcome in Bloodhoof Village. My father keeps the bluffs; I keep the plains below them." },
    { id = "g_back", when = { metBefore = true }, text = "Friend, sit with me a moment; the village can spare me." },
  },

  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the Windshapers. My father welcomed your people, and I'll do no less. Ask if you need anything of Mulgore." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, so far from the red city. Your Warchief helped bring my people here, and we remember that." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "A bear in my tent, and a polite one. The Earth Mother has a sense of humor." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Baine Bloodhoof, Cairne's son. Goblins dig to the east, gnolls raid from the west, and dwarves blast the earth at Bael'dun. I'd rather talk them all down than fight them." },
        { id = "h_cairne", when = { heardLine = "cairne.h_default" },
          text = "You've met my father on the bluffs, so he'll have told you about the land. He tells everyone; he never tires of it." },
        { id = "h_rounds", when = { metBefore = true }, text = "I walk the village each evening, every tent and every fire. A leader should know every face, and I'm still learning a few." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Stars over Stonebull Lake, and on nights like this I can almost hear the old songs from when we wandered." },
      },
      choices = {
        { text = "How did the tauren come to Mulgore?", next = "coming" },
        { text = "What troubles the plains?", next = "troubles" },
        { text = "Why talk, if they won't listen?", next = "talk" },
        { text = "Does your father miss living on the plains?", tag = "Persuade", next = "baine_father",
          check = { pass = { any = { { disposition = { min = 65 } }, { heardLine = "cairne.h_default" }, { race = "Tauren" } } } },
          fail = { next = "baine_father_no", fx = { affinity = -1 } } },
        { text = "Earth Mother guide you.", next = "END", fx = { affinity = 1 } },
      },
    },
    baine_father = {
      lines = {
        { id = "bf_default", text = "Every season. He tells me the High Rise is a fine place to see the land from and a poor place to stand on it. He'd rather walk with the herds, I think, and he stays up there because the tribes need one place to look to. I've never told him I noticed." },
        { id = "bf_heard", when = { heardLine = "cairne.h_default" },
          text = "You've heard him speak of the land, so you know already. He talks about the plains the way old warriors talk about a battle they miss. I keep the village well so that he can at least look down and see it kept." },
      },
      choices = {
        { text = "He's lucky in his son.", next = "BACK", fx = { affinity = 2 } },
        { text = "I won't mention it to him.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    baine_father_no = {
      lines = {
        { id = "bn_default", text = "My father's heart is his own to speak of, friend." },
        { id = "bn_ask", text = "Ask him yourself, on the High Rise. He'll tell you more than I should." },
      },
      choices = { { text = "Of course.", next = "BACK" } },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", text = "The Venture Company cuts the land in the east, and the Palemane gnolls raid from the west. At Bael'dun, the dwarves blast the ground until the earth's spirits cry out. I warned them, and they kept digging." },
      },
      choices = {
        { text = "I'll help.", next = "END", fx = { affinity = 2, standing = { bloodhoof = 1 }, align = { honor = 1 } } },
        { text = "The Venture Company pays well, and I won't cross them for a few hills.", next = "END", fx = { align = { honor = -1 } } },
      },
    },
    talk = {
      lines = {
        { id = "tk_default", text = "Because sometimes they do. A spear settles one quarrel, but a word, spoken well, can settle a hundred." },
      },
      choices = { { text = "Wise words.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    coming = {
      lines = {
        { id = "c_default", text = "We wandered for longer than any elder remembers. My father met Thrall's orcs, and with them beside us we drove the centaur from these plains. Mulgore is the first home our people have held in centuries." },
      },
      choices = { { text = "A home worth guarding.", next = "END", fx = { affinity = 2, standing = { bloodhoof = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The plains bring news to Bloodhoof from every road, and I try to hear all of it. Ask me about these, and I'll tell you what I know." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "Sit with me, friend; you've earned the long answers, and the village can spare me a while." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer, as I'd answer anyone who asks honestly, and I hope you are asking honestly." },
    },
    cenarion_circle = { { id = "tp_circle", text = "Hamuul studies with them. My father trusts them, and so do I. The land needs friends who listen to it." } },
    grimtotem = { { id = "tp_grimtotem", text = "They're tauren, whatever else they are. I'd rather reason with them than fight them, for as long as reason works." } },
    _none = { { id = "tp_none", text = "I don't know, but I'll ask, and I'll remember you asked first." } },
    venture_company = { { id = "tp_venture", text = "We refused them the right to mine, and they poisoned our wells anyway. I'd still rather they sat down and talked, though I'm starting to doubt they know how." } },
  },
}

P:NPC {
  key = "zarlman", id = TODO_NPC("Zarlman Two-Moons"), name = "Zarlman Two-Moons",
  bible = "bibles/mulgore.md", role = "priest", tier = "quest",
  communities = { "bloodhoof" }, temper = { "serene" }, values = { "wise", "patient" },
  notices = { "class", "affliction" },

  greetings = {
    { id = "g_spirit", text = "Peace, young one. Baine tends the village in this world. I tend it in the other." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the spirit lodge. The spirits remember your step." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "You walk close to the spirits already; I can see it. Don't be afraid of what they show you." },
    { id = "n_ghostly", cat = "affliction", place = "before", when = { resSick = true },
      text = "You've come back from the spirit's road not long ago, and it leaves a mark. Rest, and it fades." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Zarlman Two-Moons is my name, and I look after the spirits of this village, and of the young ones passing through it." },
        { id = "h_vision", tags = { "news" }, when = { questActive = TODO_QUEST("Rite of Vision") },
          text = "The rite of vision asks you to see with more than your eyes. Drink, follow, and don't fight what you're shown." },
        { id = "h_young", when = { metBefore = true }, text = "The young ones come down from Narache shaking, from their first death or their first vision. At that age they look much the same." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The spirits are louder after dark, not angrier, only louder, like children who won't sleep." },
      },
      choices = {
        { text = "What are the spirits saying?", next = "spirits" },
        { text = "What does the rite show?", next = "vision" },
        { text = "Thank you, elder.", next = "END" },
      },
    },
    vision = {
      lines = { { id = "v_default", text = "Something different for everyone: a path, usually, and sometimes the end of one. The spirits choose; I only open the door." } },
      choices = {
        { text = "I'm ready.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd rather walk my own path than one the spirits pick for me.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    spirits = {
      lines = {
        { id = "s_wells", text = "They're restless near the wells. The water's spirits don't understand why it tastes of oil. Mull is trying to explain it to them." },
        { id = "s_quiet", text = "Quiet, today, and quiet is good. Quiet means nobody is grieving." },
      },
      choices = { { text = "Thank you, elder.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "The spirits haven't spoken of that. I won't speak for them." } },
  },
}

P:NPC {
  key = "harken", id = TODO_NPC("Harken Windtotem"), name = "Harken Windtotem",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "steady" }, values = { "practical" },
  notices = { "class" },

  greetings = {
    { id = "g_plains", text = "Watch the sky over Mulgore for a while. You'll see what I mean about the swoops." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter? Then you'll have a better eye for birds than most, so use it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Harken Windtotem, and I keep an eye on what flies over Mulgore. Lately it's mostly swoops, and too many of them." },
        { id = "h_swoop", tags = { "news" }, when = { questActive = TODO_QUEST("Swoop Hunting") },
          text = "The swoops are thick this season. Thin them, and bring me their quills. Nothing goes to waste in this village." },
        { id = "h_knees", when = { metBefore = true }, text = "My grandfather read the weather from how the birds flew. I read it from how my knees ache. The tribe calls that progress." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Even the swoops sleep at this hour, but I don't, much; it's an old habit from the wandering years." },
        { id = "h_maur", when = { heardLine = "maur.h_default" }, text = "Maur's after that beast again? He's tracked it longer than some of our braves have been alive." },
      },
      choices = { { text = "Why watch the sky?", next = "sky" }, { text = "I'll see to it.", next = "END", fx = { affinity = 1 } } },
    },
    sky = {
      lines = {
        { id = "s_map", text = "When we wandered, the sky was the only map we had. Now we've a home with walls of grass, and I still can't stop looking up." },
      },
      choices = { { text = "Keep watching for us.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. Ask Baine; he hears more than I do." } },
  },
}

P:NPC {
  key = "maur", id = TODO_NPC("Maur Raincaller"), name = "Maur Raincaller",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "solemn" }, values = { "brave" },
  notices = { "kit" },

  greetings = {
    { id = "g_rain", text = "Rain's coming; I can smell it on the wind. It's good for the grass, and bad for tracking." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out in the grass had a go at you. Get mended before you go after anything bigger." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Maur Raincaller. There's a beast in Mulgore the young hunters whisper about, and I've seen its tracks. I'd like to see its hide." },
        { id = "h_mazz", tags = { "news" }, when = { questActive = TODO_QUEST("Mazzranache") },
          text = "The beast is called Mazzranache. Find it, end it, and bring me proof, and the young ones will stop whispering and start bragging." },
        { id = "h_slow", when = { metBefore = true }, text = "The young braves ask me how to track. I tell them: walk slower than you want to. Not one of them listens." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Something big moves out in the dark grass. I've heard it more than I've seen it, and that's the part I don't like." },
      },
      choices = { { text = "How did you get your name?", next = "name" }, { text = "I'll find it.", next = "END", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    name = {
      lines = {
        { id = "n_rain", text = "It rained on every camp I made, the whole long walk to Mulgore. My mother said the clouds had adopted me, and the name stuck, and so did the clouds." },
      },
      choices = { { text = "It's a good name.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's not something I've tracked." } },
  },
}

P:NPC {
  key = "mull", id = TODO_NPC("Mull Thunderhorn"), name = "Mull Thunderhorn",
  bible = "bibles/mulgore.md", role = "priest", tier = "quest",
  communities = { "bloodhoof" }, temper = { "worried" }, values = { "devout", "protective" },
  notices = { "race" },

  greetings = {
    { id = "g_wells", text = "Forgive me, my mind is on the wells. It's always on the wells, lately." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Tell me the water runs clean somewhere, please." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You're of the plains, so the wells are yours too. Help me cleanse them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mull Thunderhorn, and the sacred wells of Mulgore are sick. Goblins set up beside them, and now the water tastes of oil and worse." },
        { id = "h_poison", tags = { "news" }, when = { questActive = TODO_QUEST("Poison Water") },
          text = "The creatures that drink from the wells are sickening too. Bring me proof of it, so I know how deep the poison runs." },
        { id = "h_cleanse", when = { any = { { questActive = TODO_QUEST("Winterhoof Cleansing") }, { questActive = TODO_QUEST("Thunderhorn Cleansing") }, { questActive = TODO_QUEST("Wildmane Cleansing") } } },
          text = "Take the totem to the well and let it work. The earth remembers clean water; we only have to remind it." },
        { id = "h_totem", when = { any = { { questActive = TODO_QUEST("Thunderhorn Totem") }, { questActive = TODO_QUEST("Wildmane Totem") } } },
          text = "A totem must be made before a well can be cleansed. Gather what it needs, and I'll do the rest." },
        { id = "h_walk", when = { metBefore = true }, text = "I walked to every well this morning, and my hooves ache, and the water's no better. Tomorrow I'll walk again." },
      },
      choices = {
        { text = "Who poisoned them?", next = "who" },
        { text = "I'll help cleanse them.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Goblin oil means goblin coin, and I won't stand in its way.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    who = {
      lines = { { id = "w_default", text = "The Venture Company, with their machines and their spills. They don't mean it, I think; they simply don't care, and somehow that's worse." } },
      choices = { { text = "It is.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm sorry, my thoughts are with the water. Ask Baine." } },
    venture_company = { { id = "tp_venture", text = "They wanted to mine our mountains, and we said no, so they took the wells instead. That is how they listen." } },
  },
}

P:NPC {
  key = "ahab", id = TODO_NPC("Ahab Wheathoof"), name = "Ahab Wheathoof",
  bible = "bibles/mulgore.md", role = "farmer", tier = "quest",
  communities = { "bloodhoof" }, temper = { "anxious" }, values = { "kind" },
  notices = { "pet" },

  greetings = {
    { id = "g_kyle", text = "Oh! Hello, traveler, you haven't seen a dog, have you? He's brown and scruffy, and he never sits still." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you seen any sign of him, any at all?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine companion you have. Keep him close, and don't ever let him wander off." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Ahab Wheathoof, and I keep a little ranch by the lake. I kept a dog, too, Kyle, until he ran off, and he's never been gone this long." },
        { id = "h_kyle", tags = { "news" }, when = { questActive = TODO_QUEST("Kyle's Gone Missing!") },
          text = "If you find him, he'll be hungry; he's always hungry. Bring him something tasty and he'll follow you anywhere." },
        { id = "h_kyle_done", when = { questDone = TODO_QUEST("Kyle's Gone Missing!") },
          text = "He's home! Look at him, Kyle, sit, Kyle, sit, oh, he won't sit and I don't care one bit. He's home!" },
        { id = "h_fence", when = { questDone = TODO_QUEST("Kyle's Gone Missing!"), metBefore = true }, text = "Kyle chewed through the fence again, but he didn't go anywhere; he just likes chewing fences. I've stopped mending it." },
        { id = "h_watch", when = { questDone = TODO_QUEST("Kyle's Gone Missing!"), timeOfDay = "night" }, text = "He sleeps across the door now, like he's afraid I'll be the one to wander off. Silly dog." },
      },
      choices = {
        { text = "Tell me about Kyle.", next = "kyle" },
        { text = "I'll keep an eye out for him.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "It's only a dog.", next = "END", fx = { affinity = -2 } },
      },
    },
    kyle = {
      lines = {
        { id = "k_pup", text = "Found him as a pup down by the lake, soaking wet and barking at a frog. He's been barking at things ever since. Best friend I've got." },
      },
      choices = { { text = "He sounds wonderful.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Sorry, I can't think about anything else until Kyle's home." } },
  },
}

P:NPC {
  key = "kauth", id = TODO_NPC("Innkeeper Kauth"), name = "Innkeeper Kauth",
  bible = "bibles/mulgore.md", role = "innkeeper", tier = "service",
  communities = { "bloodhoof" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Come in from the grass and the wind. There's stew, and a hide to sleep on." },
    { id = "g_home", when = { homeInn = { "Bloodhoof Village" } }, text = "Your sleeping hide is aired and ready. The wind is kind tonight." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look worn thin. Sit by the fire until the color comes back." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "The village brew is stronger than it tastes, and most learn that once." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kauth. Travelers come through here on the way to the bluffs, and all of them leave my inn fed." },
        { id = "h_task", when = { questActive = TODO_QUEST("A Task Unfinished") },
          text = "There's a task left undone that weighs on me. You'll carry it further than I can." },
        { id = "h_view", when = { metBefore = true }, text = "The bluff folk come down for my stew and say they're here for the view. The view's fine, but the stew's better." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The wind's dropped, so listen: that's the lake against the shore, the best sound in Mulgore." },
        { id = "h_mull", when = { heardLine = "mull.h_default" }, text = "Mull's been to every well again, hasn't he? I bring him stew, and he forgets to eat it, so I bring more." },
      },
      choices = { { text = "What's in the stew?", next = "stew" }, { text = "Just a meal, thank you.", next = "END" } },
    },
    stew = {
      lines = {
        { id = "s_roots", text = "Tallstrider, wild roots, and whatever the hunters bring in that they can't name. Don't ask more than that; it spoils the taste." },
      },
      choices = { { text = "Smells good.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I hear a little of everything and keep less. Ask Baine." } },
  },
}

-- Forever's camping: the adventurer camped just outside Bloodhoof Village.
P:NPC {
  key = "kaga", id = TODO_NPC("Kaga Wildhoof"), name = "Kaga Wildhoof",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "warm" }, values = { "generous", "brave" },
  notices = { "craft" },

  greetings = {
    { id = "g_fire", text = "Earth Mother's blessing, traveler. Come and sit; the fire is big enough for two." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my fire, are you? Good. Sit, and tell me where the road took you." },
  },

  notice = {
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work hides? Then you'll want to learn the tent. A night by a fire with a tent close by is a night well spent." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kaga Wildhoof. I wander, I camp, and I come back to Mulgore when the wind turns, and the Chief and I go back a long way." },
        { id = "h_bundle", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "A bundle from Chief Hawkwind? He never forgets a kindness. Tell him he owes me nothing, and that I said so twice." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire and let it work on you. The rest comes when it comes." },
        { id = "h_narache", when = { metBefore = true }, text = "I came past Camp Narache on the way in, where the young ones were fighting boars with sticks. I gave them a few pointers, and a few bandages." },
      },
      choices = {
        { text = "What is it you love about camping?", next = "why" },
        { text = "Earth Mother keep you.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Every fire is a small village for a night. Whoever passes can sit at it. I've met more friends at campfires than in any town." } },
      choices = { { text = "Teach me.", next = "END", fx = { affinity = 2, learn = { "camping" } } } },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "Start with a fire, which any cook can make, and then add what your hands know how to make." } },
    _none = { { id = "tp_none", text = "I don't know. The wind hasn't told me." } },
  },
}
