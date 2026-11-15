-- Thunder Bluff. Voice: bibles/thunderbluff.md
-- Cairne keeps his rival close: Magatha lives on Elder Rise and says what she thinks of him.
-- Her later treachery is never hinted beyond her open ambition.
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "cairne", id = TODO_NPC("Cairne Bloodhoof"), name = "Cairne Bloodhoof",
  bible = "bibles/thunderbluff.md", role = "noble", tier = "major",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "honorable", "gentle", "wise" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_chief", text = "The High Rise greets you, young one. The Earth Mother's wind blows strong up here, so stand firm." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "Tauren-born! The plains go with you wherever you walk; I see them in your step." },
    { id = "g_back", when = { metBefore = true }, text = "Good, you've come again. An old bull likes faces he knows." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID", race = "Tauren" },
      text = "A tauren druid. Twenty generations we waited for one, and now you walk among us, thanks to Hamuul's work. Be worthy of it." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne", faction = "Horde" },
      text = "The sky-people who came down to Mulgore. The Earthen Ring spoke for you, and the tauren keep the word of friends. Walk freely here." },
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "An outsider on the High Rise. You came in peace, or the Bluffwatchers would have said otherwise. Say what you came to say." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Cairne Bloodhoof, and I lead the Bloodhoof and all the tribes who call Mulgore home. We wandered for generations, but now we have a home, and I mean to keep it." },
        { id = "h_baine", when = { heardLine = "baine.h_default" },
          text = "You've met my son in the village. He listens better than I did at his age, but don't tell him I said so." },
        { id = "h_journey", tags = { "news" }, when = { questActive = TODO_QUEST("Journey into Thunder Bluff") },
          text = "You've climbed the lifts and found your way to me, and well done; a tauren who knows the Bluff knows where home is. Now, let me look at you." },
        { id = "h_rites", when = { questDone = TODO_QUEST("Rites of the Earthmother") },
          text = "You walked the rites of the Earth Mother. I see it on you. Carry it lightly; it's heavy enough on its own." },
      },
      choices = {
        { text = "How did the tauren come to Mulgore?", next = "mulgore" },
        { text = "Why do you follow Thrall?", next = "thrall" },
        { text = "Earth Mother keep you, chieftain.", next = "END", fx = { affinity = 1 } },
      },
    },
    mulgore = {
      big = true,
      lines = {
        { id = "m_default", text = "The centaur hunted us across the plains. A young orc named Thrall fought beside us, and when his people found their land, we found ours. We built the Bluff high so we would never be caught in the open again." },
      },
      choices = {
        { text = "A good home.", next = "END", fx = { affinity = 2 } },
        { text = "And you swore to the Horde.", next = "thrall" },
      },
    },
    thrall = {
      lines = { { id = "t_default", text = "He came to us as a stranger and fought for us as kin. A debt like that isn't paid in one lifetime. The Horde has my word, and my word holds." } },
      choices = { { text = "For honor.", next = "END", fx = { affinity = 2, align = { honor = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "That is Hamuul's road, and the night elves let him walk it, some more gladly than others. I'm proud of him." } },
    _none = { { id = "tp_none", text = "Ask the elders on their rise. They've more patience for questions than an old warrior." } },
  },
}

P:NPC {
  key = "hamuul", id = TODO_NPC("Arch Druid Hamuul Runetotem"), name = "Arch Druid Hamuul Runetotem",
  bible = "bibles/thunderbluff.md", role = "noble", tier = "major",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "wise", "balanced" },
  notices = { "form", "race" },

  greetings = {
    { id = "g_rise", text = "Peace, traveller. You're on Elder Rise, so speak softly; the old ones are thinking." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Another druid! Come, come; every one of you is a gift, when not so long ago there were none of us at all." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ha! The bear, my favourite. Remember that the bear is strong because it rests, so rest, young one." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne", class = "DRUID" },
      text = "A shen'dorei druid! You honour the elements first, I'm told, which suits me; the Earth Mother is the earth, after all. We'll get along." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hamuul Runetotem. I asked Malfurion Stormrage to teach me, after the war, and he said yes when others said no. I've tried to be worth that yes ever since." },
        { id = "h_rau", when = { heardLine = "rau.h_default" },
          text = "You've spoken with Rau at Freewind. He learned to listen to the land here, on Elder Rise. I'm glad it's serving him in the Needles." },
        { id = "h_fandral", when = { heardLine = "fandral.h_default" },
          text = "So Fandral has received you in Darnassus. He didn't want me taught, and he was wrong, but I don't hold it against him. Mostly." },
        { id = "h_young", when = { metBefore = true }, text = "Every young druid who comes up the lift reminds me how few of us there were. I count you all, you know, and I'm not ashamed of it." },
      },
      choices = {
        { text = "What did Malfurion teach you?", next = "taught" },
        { text = "What's the most important lesson?", next = "lesson" },
        { text = "Farewell, Arch Druid.", next = "END" },
      },
    },
    taught = {
      big = true,
      lines = {
        { id = "t_default", text = "That the wild isn't something you command; it's something you join. I was the first of my people in twenty generations to hear that, and I mean not to be the last." },
      },
      choices = { { text = "You won't be.", next = "END", fx = { affinity = 2, learn = { "cenarion_circle" } } } },
    },
    lesson = {
      lines = { { id = "l_default", text = "Strength without wisdom is only a stampede, and I say it to every young druid. Most nod and a few listen, and you can tell the difference in about ten years." } },
      choices = { { text = "I'm listening.", next = "END", fx = { affinity = 2, trait = { patient = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "I'm the highest of the tauren in it, which mostly means I'm the one who gets glared at in Darnassus. Remulos is kinder." } },
    _none = { { id = "tp_none", text = "Ask Turak, or the Chieftain, or the wind; it knows more than both of us." } },
  },
}

P:NPC {
  key = "turak", id = TODO_NPC("Turak Runetotem"), name = "Turak Runetotem",
  bible = "bibles/thunderbluff.md", role = "trainer", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "patient" }, values = { "balanced", "wise" },
  notices = { "form", "class" },

  greetings = {
    { id = "g_druid", when = { class = "DRUID" }, text = "Welcome, young druid. Keep your mind clear and your heart strong, and the Great Balance will keep a place for you." },
    { id = "g_other", when = { ["not"] = { class = "DRUID" } }, text = "Balance in all things, friend. Even in a city built on cliffs." },
  },

  notice = {
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "Swift and quiet, the cat. Mind it doesn't make you forget the rest of what you are." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Turak Runetotem, and I help the Arch Druid train the young ones. I teach the steps; he teaches why they matter." },
        { id = "h_call", tags = { "news" }, when = { questActive = TODO_QUEST("Heeding the Call") },
          text = "The call reached you, then, and good. Sit, for before you can be more than one creature, you must understand the one you are." },
        { id = "h_back", when = { questActive = TODO_QUEST("Back to Thunder Bluff") },
          text = "You've sat with the Great Bear Spirit; few forget that look. Tell me what you felt." },
        { id = "h_poison", when = { questActive = TODO_QUEST("Power over Poison") },
          text = "The Crossroads has troubles with poison. A druid who can draw it out of the living is worth a dozen healers' herbs." },
        { id = "h_aquatic", when = { questDone = TODO_QUEST("Aquatic Form") },
          text = "Now the water's yours too, though few tauren take to it. You'll be a strange sight in the rivers, so enjoy it." },
        { id = "h_bear", when = { metBefore = true, class = "DRUID" }, text = "How does the bear sit with you now? It's heavy at first, for most, and then it gets lighter, or you get stronger, which is the same thing in the end." },
        { id = "h_listen", when = { metBefore = true }, text = "The Arch Druid speaks to the Circle. I speak to the young ones. Between the two of us, someone is always being listened to." },
        { id = "h_skyborne", when = { race = "Skyborne", class = "DRUID" }, text = "A druid from the sky isles! Your people lean on the elements before Elune, I'm told, and I'm glad of it. The Earth Mother made the winds too, and she won't mind sharing you." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Mu'sha has her eye open, and the White Lady brings sleep to the plains, though not to me, tonight." },
      },
      choices = {
        { text = "How did you become a druid?", next = "path" },
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What is the Great Balance?", next = "balance" },
        { text = "Farewell.", next = "END" },
      },
    },
    balance = {
      lines = { { id = "b_default", text = "Everything in its place, and everything with a place. When we forget our place, the world reminds us, gently if we're lucky." } },
      choices = { { text = "Thank you.", next = "END", fx = { affinity = 1, learn = { "cenarion_circle" } } } },
    },
    path = {
      lines = {
        { id = "p_stag", text = "I hunted, first, and I tracked a stag three days and lost it. On the fourth morning it found me: stood there in the grass, watching, and I put the bow down. Hamuul found me a week later, still sitting there." },
      },
      choices = { { text = "That's a good story.", next = "END", fx = { affinity = 2 } }, { text = "What did the stag want?", next = "stag" } },
    },
    stag = {
      lines = {
        { id = "s_default", text = "I've wondered for years. I think it wanted to see if I'd keep chasing, and I didn't, and that was the lesson." },
      },
      choices = { { text = "I'll remember it.", next = "END", fx = { affinity = 2, trait = { patient = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Our order, and the Arch Druid's pride. Go to Moonglade when you can; it's quieter than here." } },
    _none = { { id = "tp_none", text = "Ask Hamuul. I only teach what I'm sure of." } },
  },
}

P:NPC {
  key = "magatha", id = TODO_NPC("Magatha Grimtotem"), name = "Magatha Grimtotem",
  bible = "bibles/thunderbluff.md", role = "noble", tier = "major",
  communities = { "thunder_bluff" }, temper = { "cunning" }, values = { "proud", "ambitious" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_crone", text = "Hm. Another one come to stare at the old crone. Well, stare, and then be useful or be gone." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "A child of the plains, good. You at least have the sense to be born tauren." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman? The elements speak to you, do they? They speak to me louder, so remember that, if we ever disagree." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken. Don't flinch; I don't hate you, and our ways might give you back a little of what you lost. Some here think I've other reasons, so let them think." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome", "NightElf" } },
      text = "The lesser races walk on Elder Rise now; what a time we live in. Keep your hands where I can see them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Magatha, Elder Crone of the Grimtotem. Cairne lets me live up here so he can keep an eye on me. I let him think it works." },
        { id = "h_crone", tags = { "news" }, when = { questActive = TODO_QUEST("The Elder Crone") },
          text = "Someone sent you to me? Good; I have uses for capable hands, and fewer for chatter. Listen carefully, because I won't say it twice." },
        { id = "h_forsaken", when = { questActive = TODO_QUEST("Forsaken Aid") },
          text = "The Forsaken want to remember being alive, and I can help with that. Whether I should, the Chieftain has opinions, and I'll ask for his when I want them." },
        { id = "h_fire", when = { questActive = TODO_QUEST("Sacred Fire") },
          text = "Sacred fire, for sacred work. Fetch it, and don't let anyone ask you what it's for." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves who dropped out of the sky. Kalimdor fills up with strangers, and Cairne opens the gate to every one. I'd have shut it." },
      },
      choices = {
        { text = "What do you think of Cairne?", next = "cairne" },
        { text = "What do the Grimtotem want?", next = "want" },
        { text = "I'll go.", next = "END" },
      },
    },
    cairne = {
      big = true,
      lines = {
        { id = "c_default", text = "A good warrior and a kind old bull, and a chieftain who gives our people's future away to orcs and outsiders one handshake at a time. I would lead them better, and I have said so, to his face." },
      },
      choices = {
        { text = "That's bold.", next = "bold" },
        { text = "He's a great leader.", next = "END", fx = { affinity = -2 } },
      },
    },
    bold = {
      lines = { { id = "b_default", text = "It's honest, and the tauren used to value that. Now we value getting along, and it's not the same thing, child." } },
      choices = { { text = "...", next = "END" } },
    },
    want = {
      lines = { { id = "w_default", text = "What was ours: the old lands, wherever they lie. Kalimdor was the tauren's before it was anyone's, and I haven't forgotten; I'm old enough not to." } },
      choices = { { text = "...", next = "END", fx = { learn = { "grimtotem" } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Night elves teaching tauren to be tauren! Hamuul is proud of it, and I find it embarrassing." } },
    grimtotem = { { id = "tp_grimtotem", text = "You've heard about Arnak, I suppose. Every clan has its hotheads. Mine simply has more of them, and better reasons." } },
    _none = { { id = "tp_none", text = "Not my concern, and not yours either, I expect." } },
  },
}

P:NPC {
  key = "pala", id = TODO_NPC("Innkeeper Pala"), name = "Innkeeper Pala",
  bible = "bibles/thunderbluff.md", role = "innkeeper", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm" }, values = { "generous", "kind" },
  notices = { "weary", "race" },

  greetings = {
    { id = "g_inn", text = "In out of the wind with you. There's always room by my fire." },
    { id = "g_home", when = { homeInn = { "Thunder Bluff", "Lower Rise" } }, text = "Your blanket's by the fire, love. I aired it out this morning." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Oh, look at you! Sit, sit; stew first, then sleep, and then you can go and get hurt again." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You look chilled through, but sit by the fire anyway; warm's warm, whatever's underneath." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Pala, and I keep the Cat and the Shaman. Warriors, druids, traders off the lifts: everyone gets the same welcome and the same stew." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Horde" },
          text = "Sky-folk, from down at the camp? Sit by the fire; up here the wind's colder than you'd think, even for you." },
        { id = "h_lifts", when = { metBefore = true }, text = "The lift-runners eat here every night, the strongest backs in the city and the softest hearts. Don't tell them I said so." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Late and windy tonight, so listen to the totems creak; it sounds like the whole bluff is breathing." },
        { id = "h_turak", when = { heardLine = "turak.h_default" }, text = "You've been up to Turak on Elder Rise? He eats here twice a moon, and sits by the window and doesn't speak, but he tips well." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Why 'the Cat and the Shaman'?", next = "name" },
        { text = "Just resting.", next = "END" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "Ask three regulars and you'll get three stories, and my favourite has the cat winning. Make up your own; everyone else does." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I only keep the beds, friend. Ask on the rises." } },
  },
}
