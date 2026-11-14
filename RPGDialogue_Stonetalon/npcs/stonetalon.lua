-- Stonetalon Mountains. Voice: bibles/stonetalon.md
-- Sun Rock Retreat and Malaka'jin (Horde), Stonetalon Peak (Alliance, neutral keeper).
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "maggran", id = TODO_NPC("Maggran Earthbinder"), name = "Maggran Earthbinder",
  bible = "bibles/stonetalon.md", role = "soldier", tier = "major",
  communities = { "sun_rock" }, temper = { "hard" }, values = { "loyal", "brave" },
  notices = { "kit", "race" },

  greetings = {
    { id = "g_rock", text = "Sun Rock. The wind's strong up here and the sun stronger. Good for old wounds. Say what you need." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the rock. Good. I've work for the ones who come back." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been bloodied. Good; it means you fought. Now mend, and fight smarter." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of my people. You'll find me less gentle than the elders. The years and the battles took that from me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Maggran Earthbinder. Cairne gave me Sun Rock to hold, and the wind and sun here to ease what the years did to me. I was gentle once. I'm not anymore." },
        { id = "h_harpies", tags = { "news" }, when = { questActive = TODO_QUEST("Harpies Threaten") },
          text = "The harpies grow bold in the hills. They dive on our scouts and carry off what they can. Show them what Sun Rock does to thieves." },
        { id = "h_bloodfury", when = { questActive = TODO_QUEST("Bloodfury Bloodline") },
          text = "Their matriarch's line breeds the worst of them. End it, and the rest will scatter like leaves." },
        { id = "h_spiders", when = { questActive = TODO_QUEST("Arachnophobia") },
          text = "Besseleth. A spider bigger than a kodo. She nearly had me, years back. Kill her, and I'll sleep easier. A little." },
        { id = "h_reserves", when = { questActive = TODO_QUEST("Calling in the Reserves") },
          text = "We need more hands than we've got. Carry word for me, and quickly." },
      },
      choices = {
        { text = "What hardened you?", next = "hard" },
        { text = "I'll help hold Sun Rock.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    hard = {
      big = true,
      lines = {
        { id = "h2_default", text = "Battle. Loss. Spider venom, once, that left me shaking for a season. Cairne sent me here to heal. The mountains healed the body. The rest is still working on it." },
      },
      choices = { { text = "I understand.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Their keeper watches the peak to the north. We leave each other be, mostly. Mostly is a fragile word up here." } },
    _none = { { id = "tp_none", text = "Not my concern. Ask Tammra; she has more patience." } },
  },
}

P:NPC {
  key = "tammra", id = TODO_NPC("Tammra Windfield"), name = "Tammra Windfield",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "gentle" }, values = { "hopeful", "patient" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_seeds", text = "Careful where you step. Those little green shoots are the first things to grow in that soil in years." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Then you'll know how hard it is to make dead ground live again. Help me, if you've a moment." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tammra Windfield. I tend what grows on Sun Rock, and I try to bring back what doesn't. Every mountain can heal, given time and stubbornness." },
        { id = "h_kaya", tags = { "news" }, when = { questActive = TODO_QUEST("Kaya's Alive") },
          text = "Kaya's alive? Oh, Earth Mother be thanked. Bring her home safe. Please. Safe." },
        { id = "h_rebirth", when = { questActive = TODO_QUEST("Cycle of Rebirth") },
          text = "Death feeds life, if you let it. It's the oldest cycle there is. Help me turn it the right way round." },
        { id = "h_newlife", when = { questActive = TODO_QUEST("New Life") },
          text = "Plant them gently. Water them more gently still. They're the future of these slopes." },
        { id = "h_shoots", when = { metBefore = true }, text = "Two of the new shoots died in the night. Five lived. I'll take five." },
      },
      choices = {
        { text = "Why bring the ground back?", next = "why" },
        { text = "What happened to the land here?", next = "land" },
        { text = "Good luck with your garden.", next = "END", fx = { affinity = 1 } },
      },
    },
    land = {
      big = true,
      lines = {
        { id = "l_default", text = "Fire, and goblin axes, and fighting. The vale to the south burned black. But burned ground is still ground. It remembers how to be green." },
      },
      choices = { { text = "I'll help it remember.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
    why = {
      lines = {
        { id = "w_right", text = "Because the mountain's been cut and burned, and someone ought to make it right. It doesn't much matter who. It happens to be me." },
      },
      choices = { { text = "I'm glad it's you.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "They want the same thing I want, a living mountain. I wish we could plant side by side instead of glaring across the ridges." } },
    _none = { { id = "tp_none", text = "I don't know. I mostly know seeds." } },
  },
}

P:NPC {
  key = "braelyn", id = TODO_NPC("Braelyn Firehand"), name = "Braelyn Firehand",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "bitter" }, values = { "ambitious", "vengeful" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_mage", text = "You've a capable look. I've work for capable people. Unpleasant work. Well paid." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Then you'll understand. Magic is being choked out of these mountains by druids who think every spell is a crime." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A druid. In the Horde, at least. I suppose that's something. You'll not like what I'm about to ask, so don't ask what it is." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Braelyn Firehand. The Horde gives me a roof here, and I give it my spells. The druids of the Talon Den want this land bare of magic. I want it back." },
        { id = "h_legacy", tags = { "news" }, when = { questActive = TODO_QUEST("Cenarius' Legacy") },
          text = "The druids at the Talon Den, and Cenarius's brood with them. They'd strangle every spell in the world if they could. Thin their numbers." },
        { id = "h_ordanus", tags = { "news" }, when = { questActive = TODO_QUEST("Ordanus") },
          text = "Ordanus. A keeper, in Ashenvale, at the top of a great tree. I knew him, long ago. He thought himself above even the Highborne. Bring me his head." },
      },
      choices = {
        { text = "Why do you hate the druids?", next = "hate" },
        { text = "I'll think about it.", next = "END" },
      },
    },
    hate = {
      big = true,
      lines = {
        { id = "h2_default", text = "Because they decide what magic may live and what must die, and call it balance. I've seen what balance costs. I'll not pay it twice." },
      },
      choices = {
        { text = "That sounds like a grudge.", next = "grudge", fx = { trait = { skeptical = 1 } } },
        { text = "I see.", next = "END" },
      },
    },
    grudge = {
      lines = { { id = "g2_default", text = "It is a grudge. A very old one. Old grudges are the only kind worth keeping." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Gardeners with claws. Don't let their smiles fool you." } },
    _none = { { id = "tp_none", text = "Irrelevant. Unless it's magic, and then it's mine." } },
  },
}

P:NPC {
  key = "jinzil", id = TODO_NPC("Witch Doctor Jin'Zil"), name = "Witch Doctor Jin'Zil",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "sly" }, values = { "loyal", "curious" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_cave", text = "Come in, come in, mon. Don't mind the cages. Most of dem be empty. Most." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! Ya smell like the Echo Isles, mon. Sit, sit. Jin'Zil got stories and stew." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Ah, the spirits like you. Dey whisper about you. Not all good things, but dey whisper." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jin'Zil. Witch doctor, Darkspear, and friend to Darsok and Rokhan. Dis cave be my workshop. Da forest out dere be my pantry." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("Letter to Jin'Zil") },
          text = "A letter from Darsok? Dat old knife! He still bragging? He still bragging. Give it here, mon." },
        { id = "h_magic", when = { questActive = TODO_QUEST("Jin'Zil's Forest Magic") },
          text = "Da forest got magic in it, if you know where to cut. Bring Jin'Zil what he asked, and don't let da tree-folk catch you." },
        { id = "h_darsok", when = { heardLine = "darsok.h_default" },
          text = "You met Darsok at da Crossroads? Ha! He tell you he the best? He always say dat. He be second best. Jin'Zil be first." },
        { id = "h_quiet", when = { metBefore = true }, text = "De spirits been quiet today. Quiet spirits make Jin'Zil nervous, mon. Like a cage that stop rattlin'." },
      },
      choices = {
        { text = "What's in the cages?", next = "cages" },
        { text = "I'll be going.", next = "END" },
      },
    },
    cages = {
      lines = { { id = "c_default", text = "Ingredients, mon. Sometimes ingredients be talking. Dat's normal. Don't listen to dem." } },
      choices = { { text = "...right.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Da spirits don't say, mon. Ask again tomorrow; maybe dey change dey minds." } },
  },
}

P:NPC {
  key = "jayka", id = TODO_NPC("Innkeeper Jayka"), name = "Innkeeper Jayka",
  bible = "bibles/stonetalon.md", role = "innkeeper", tier = "service",
  communities = { "sun_rock" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Weapons down, boots off, and tell me who you've been fighting. That's how we do it on Sun Rock." },
    { id = "g_home", when = { homeInn = { "Sun Rock Retreat" } }, text = "Home on the rock. The wind's howling tonight. Good night to be indoors." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Harpies or spiders? It's always one or the other up here. Sit. Eat. Both kinds of trouble will wait." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jayka. I keep the inn on Sun Rock. Warriors come in tired and leave rested, or at least less tired. That's the job." },
        { id = "h_harpies", when = { metBefore = true }, text = "The harpies screamed all night. The braves screamed back. Nobody slept. Breakfast?" },
      },
      choices = {
        { text = "Do you like it up here?", next = "rock" },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just resting.", next = "END" },
      },
    },
    rock = {
      lines = {
        { id = "r_high", text = "It's high, it's windy, and the water's cold enough to stop your heart. I wouldn't live anywhere else." },
      },
      choices = { { text = "I can see why.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Maggran. He knows the mountain. He just doesn't like saying much about it." } },
  },
}

P:NPC {
  key = "albagorm", id = TODO_NPC("Keeper Albagorm"), name = "Keeper Albagorm",
  bible = "bibles/stonetalon.md", role = "noble", tier = "quest",
  communities = { "stonetalon_peak" }, temper = { "serene" }, values = { "patient", "protective" },
  spiritSensitive = true,
  notices = { "class", "form" },

  greetings = {
    { id = "g_grove", text = "Peace, little one. This grove is old, and wise, and wary. Tread softly and you'll find it kind." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A child of the Circle. Welcome, welcome. The mountain has missed druids. So have I." },
    { id = "n_horde", cat = "class", when = { faction = "Horde" },
      text = "You come from Sun Rock's side of the ridges. That's no crime here. Crimes are done with hands, not banners." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Albagorm, keeper of the grove. I watch over this peak and its forest, and lately I watch the vale to the south, where the fires came." },
        { id = "h_journey", tags = { "news" }, when = { questActive = TODO_QUEST("Journey to Stonetalon Peak") },
          text = "You climbed all this way. Good. The mountain needs friends who can climb. Rest a moment, then listen." },
        { id = "h_vale", tags = { "news" }, when = { questActive = TODO_QUEST("Reclaiming the Charred Vale") },
          text = "The Charred Vale was green once. Those who burn it must be driven out, and then we can begin again. Will you help?" },
      },
      choices = {
        { text = "How old is the grove?", next = "age" },
        { text = "What happened to the vale?", next = "vale" },
        { text = "I'll help the grove.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    vale = {
      big = true,
      lines = {
        { id = "v_default", text = "Fire, and greed, and those who'd rather the mountain bare. Forests have died before. They come back, if someone stands between them and the next fire." },
      },
      choices = { { text = "Then I'll stand there.", next = "END", fx = { affinity = 2 } } },
    },
    age = {
      lines = {
        { id = "a_old", text = "Older than the mountain's name. Older than the Horde's coming, or the Alliance's. Young, for a tree. The trees would laugh at you for asking." },
      },
      choices = { { text = "Then I'll ask the trees.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "My father's children and their students. We keep the old places. Not everyone thanks us for it." } },
    _none = { { id = "tp_none", text = "The grove doesn't know, little one. Nor do I." } },
  },
}

P:NPC {
  key = "faralia", id = TODO_NPC("Innkeeper Faralia"), name = "Innkeeper Faralia",
  bible = "bibles/stonetalon.md", role = "innkeeper", tier = "service",
  communities = { "stonetalon_peak" }, temper = { "quiet" }, values = { "kind" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Rest here. It's quiet on the peak, and the trees keep the wind off." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Faralia. I keep a small inn for those who climb up to the grove. Not many do. The ones who do usually need the bed." },
        { id = "h_druid", when = { metBefore = true }, text = "A druid came up from the grove at dawn and sat on my step without a word, watching the mountain. Then she left. I've decided it was a compliment." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Up here the stars are near enough to count. I've tried. I always lose my place somewhere past the ridge." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just resting.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the Keeper. He's lived here longer than the trees." } },
  },
}
