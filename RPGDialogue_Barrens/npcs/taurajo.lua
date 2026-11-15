-- Camp Taurajo: the tauren and orc camp in the southern Barrens. Voice: bibles/taurajo.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jorn", id = TODO_NPC("Jorn Skyseer"), name = "Jorn Skyseer",
  bible = "bibles/taurajo.md", role = "trainer", tier = "quest",
  communities = { "taurajo" }, temper = { "patient" }, values = { "wise", "kind" },
  notices = { "class", "pet" },
  impression = {
    first = "Jorn Skyseer believes stillness is a hunter's first lesson, and he teaches it by example. Sitting beside him, the empty Barrens began to look a great deal less empty.",
    third = "{name} met Jorn Skyseer, the patient tauren at Camp Taurajo who teaches hunters to see the life hidden on the Barrens.",
  },

  greetings = {
    { id = "g_camp", text = "The Barrens look empty to those who don't know where to look. Sit; I'll show you where to look." },
    { id = "g_back", when = { metBefore = true }, text = "The hunter returns. Tell me what the grass showed you." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter? Then you're my student, whether you meant to be or not. Sit down." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your companion trusts you; I can see it in how it stands. Earn that every day." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jorn Skyseer is my name, and I teach young hunters the ways of the wild, here where it's safe enough to learn. The Barrens are full of life for those with the patience to see it." },
        { id = "h_ishamuhale", tags = { "news" }, when = { questActive = TODO_QUEST("Ishamuhale") },
          text = "Ishamuhale is a thunder lizard, older and fiercer than the rest. Bring me proof that you faced it, and we'll talk about what's next." },
        { id = "h_lakota", when = { questActive = TODO_QUEST("Lakota'mani") },
          text = "Lakota'mani walks the plains like a moving hill. Bring me his hoof. It's a lesson in patience as much as courage." },
        { id = "h_owatanka", when = { questActive = TODO_QUEST("Owatanka") },
          text = "Owatanka is the thunderhawk who rules the sky over the southern Barrens. Face it, and you'll have learned something no one can teach." },
        { id = "h_washte", when = { questActive = TODO_QUEST("Washte Pawne") },
          text = "Washte Pawne is a wind serpent out of the old stories. Few hunters ever see it, and fewer come back to describe it." },
      },
      choices = {
        { text = "What does a hunter learn first?", next = "first" },
        { text = "Thank you, teacher.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Stillness. Anyone can run and anyone can shoot, but stillness is what lets you choose when to do either." } },
      choices = { { text = "I'll practice.", next = "END", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know. The plains might; ask them, quietly." } },
  },
}

P:NPC {
  key = "mangletooth", id = TODO_NPC("Mangletooth"), name = "Mangletooth",
  bible = "bibles/taurajo.md", role = "questgiver", tier = "quest",
  communities = { "taurajo" }, temper = { "scheming" }, values = { "cunning" },
  notices = { "race" },
  impression = {
    first = "Mangletooth snorts through the bars of his cage and offers deals as though he were the one holding the keys. He remembers every one of his captors, and I suspect he will remember me too.",
    third = "{name} met Mangletooth, a caged Razormane quilboar at Camp Taurajo with a grudge against his own kin and a deal for anyone who listens.",
  },

  greetings = {
    { id = "g_cage", text = "*snort* Come closer, come closer; Mangletooth doesn't bite, not through the bars." },
    { id = "g_back", when = { metBefore = true }, text = "*snort* You again, good. Mangletooth has a deal for you, because Mangletooth always has a deal." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "*snort* Tall cow-folk keep Mangletooth in a cage. Mangletooth remembers every one of them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "*snort* Mangletooth is of the Razormane, strongest of the quilboar, and the Bristlebacks are weak. Kill them, and Mangletooth will tell you things." },
        { id = "h_tribes", tags = { "news" }, when = { questActive = TODO_QUEST("Tribes at War") },
          text = "*snort* Go and break the Bristlebacks, and the Razormane will thank you. Maybe they will even remember Mangletooth." },
        { id = "h_shards", when = { questActive = TODO_QUEST("Blood Shards of Agamaggan") },
          text = "The Bristlebacks carry blood shards. Bring them to Mangletooth, and he will give you the boar god's gifts." },
        { id = "h_betrayal", when = { questActive = TODO_QUEST("Betrayal from Within") },
          text = "*snort* Nak, Kuz and Lok were Mangletooth's own, and they left him to the cow-folk's axes. Now they learn what Mangletooth thinks of that." },
        { id = "h_thorns", when = { metBefore = true }, text = "*snort* Mangletooth dreams of the thorns. Great thorns, taller than the cow-folk's poles. One day Mangletooth goes home to them." },
      },
      choices = {
        { text = "Why help us at all?", next = "why" },
        { text = "Who is Agamaggan?", next = "agamaggan" },
        { text = "You're not getting out of that cage.", next = "END", fx = { affinity = -1 } },
      },
    },
    agamaggan = {
      big = true,
      lines = {
        { id = "a_default", text = "*snort* The great boar fell long ago, fighting for this world, and where his blood touched the earth, the thorns grew. His bones lie in the south, and the quilboar remember." },
      },
      choices = { { text = "Interesting.", next = "END", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    why = {
      lines = {
        { id = "w_hate", text = "*snort* Mangletooth hates cages, but Mangletooth hates Bristlebacks more. A clever boar picks which hate to feed, and today Mangletooth feeds the bigger one." },
      },
      choices = { { text = "I'll remember you said that.", next = "END", fx = { trait = { skeptical = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "*snort* Mangletooth knows nothing about that. Ask again with blood shards." } },
  },
}

P:NPC {
  key = "tatternack", id = TODO_NPC("Tatternack Steelforge"), name = "Tatternack Steelforge",
  bible = "bibles/taurajo.md", role = "blacksmith", tier = "quest",
  communities = { "taurajo" }, temper = { "curious" }, values = { "curious", "practical" },
  notices = { "craft", "kit" },
  impression = {
    first = "To Tatternack Steelforge, every weapon is a letter from the hand that held it. He is writing it all down for the Warchief, who may never read it, and he does not seem to mind.",
    third = "{name} met Tatternack Steelforge, a curious smith at Camp Taurajo who studies the weapons of every people the Horde meets.",
  },

  greetings = {
    { id = "g_forge", text = "Come, come. Let me see what you're carrying. Every weapon tells me something about the hand that holds it." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! Then you'll know what I mean: the quilboar's crude spears teach me more than a dozen fine orc blades." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That armor's taken a beating, and an interesting one. Centaur, I'd guess, from the cuts." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tatternack Steelforge, at your service. The Warchief sent me to study weapons and armor, and to meet everyone who passes through Taurajo, because there's something to learn from every people, even the quilboar." },
        { id = "h_weapons", tags = { "news" }, when = { questActive = TODO_QUEST("Weapons of Choice") },
          text = "I'd like to see what the enemy fights with. Bring me their weapons. I promise to study them before I melt them." },
      },
      choices = { { text = "What have you learned so far?", next = "learned" }, { text = "I'll bring you something interesting.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    learned = {
      lines = {
        { id = "l_bone", text = "That the quilboar sharpen bone better than most smiths sharpen steel, and the centaur don't sharpen anything at all; they just hit harder. I'm writing it all down for the Warchief, and he may never read it, but I'm writing it anyway." },
      },
      choices = { { text = "Somebody should.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not my field. Bring me a weapon from it, though, and it will be." } },
  },
}

P:NPC {
  key = "byula", id = TODO_NPC("Innkeeper Byula"), name = "Innkeeper Byula",
  bible = "bibles/taurajo.md", role = "innkeeper", tier = "service",
  communities = { "taurajo" }, temper = { "warm" }, values = { "generous", "kind" },
  notices = { "weary" },
  impression = {
    first = "Innkeeper Byula keeps Taurajo's fire lit and serves the kodo herders first because they have earned it. She has never found the hyenas' laughter funny, and she says the stew helps more than you would think.",
    third = "{name} rested at Innkeeper Byula's inn at Camp Taurajo, where the fire is always lit for travellers of the southern Barrens.",
  },

  greetings = {
    { id = "g_inn", text = "Welcome, traveler. Taurajo's fire is always lit, and there's always room by it." },
    { id = "g_home", when = { homeInn = { "Camp Taurajo" } }, text = "You've come back to us. Your bed's ready, and the kodo stew is hot." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "The road back from the spirit healer is long. Sit; the stew helps more than you'd think." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Byula, and I keep the inn. Everyone who crosses the southern Barrens stops at Taurajo eventually, and I make sure they leave rested." },
        { id = "h_herders", when = { metBefore = true }, text = "The kodo herders come in at sundown smelling of dust and kodo, and I serve them first. They've earned it." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear that, past the palisade? Those are hyenas, and they laugh when the moon's up. I've never once found it funny." },
      },
      choices = { { text = "What's Taurajo like?", next = "camp" }, { text = "Just a rest, thanks.", next = "END" } },
    },
    camp = {
      lines = {
        { id = "c_fires", text = "Quieter than the Crossroads, and hungrier. Centaur and quilboar both test the palisade. We keep the fires high and the spears close, and we still sing at night." },
      },
      choices = { { text = "I'd like to hear that.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Jorn; he knows the Barrens, and I only know soup." } },
  },
}
