-- Camp Taurajo: the tauren and orc camp in the southern Barrens. Voice: bibles/taurajo.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jorn", id = TODO_NPC("Jorn Skyseer"), name = "Jorn Skyseer",
  bible = "bibles/taurajo.md", role = "trainer", tier = "quest",
  communities = { "taurajo" }, temper = { "patient" }, values = { "wise", "kind" },
  notices = { "class", "pet" },

  greetings = {
    { id = "g_camp", text = "The Barrens look empty to those who don't know where to look. Sit; I'll show you where to look." },
    { id = "g_back", when = { metBefore = true }, text = "The hunter returns. Tell me what the grass showed you." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then you're my student whether you meant to be or not. Sit down." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your companion trusts you; I can see it in how it stands. Earn that every day." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jorn Skyseer. I teach young hunters the ways of the wild, here where it's safe enough to learn. The Barrens are full of life for those with the patience to see it." },
        { id = "h_ishamuhale", tags = { "news" }, when = { questActive = TODO_QUEST("Ishamuhale") },
          text = "Ishamuhale. A thunder lizard older and fiercer than the rest. Bring me proof you faced it, and we'll talk about what's next." },
        { id = "h_lakota", when = { questActive = TODO_QUEST("Lakota'mani") },
          text = "Lakota'mani walks the plains like a moving hill. Bring me his hoof. It's a lesson in patience as much as courage." },
        { id = "h_owatanka", when = { questActive = TODO_QUEST("Owatanka") },
          text = "Owatanka. The thunderhawk who rules the sky over the southern Barrens. Face it, and you'll have learned something no one can teach." },
        { id = "h_washte", when = { questActive = TODO_QUEST("Washte Pawne") },
          text = "Washte Pawne. A wind serpent of the old stories. Few hunters ever see it. Fewer come back to describe it." },
      },
      choices = {
        { text = "What does a hunter learn first?", next = "first" },
        { text = "Thank you, teacher.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Stillness. Anyone can run. Anyone can shoot. Stillness is what lets you choose when to do either." } },
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

  greetings = {
    { id = "g_cage", text = "*snort* Come closer, come closer. Mangletooth doesn't bite. Through the bars." },
    { id = "g_back", when = { metBefore = true }, text = "*snort* You again. Good. Mangletooth has a deal for you. Mangletooth always has a deal." },
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
          text = "*snort* Mangletooth, of the Razormane. Strongest of the quilboar. The Bristlebacks are weak. Kill them, and Mangletooth will tell you things." },
        { id = "h_tribes", tags = { "news" }, when = { questActive = TODO_QUEST("Tribes at War") },
          text = "*snort* Bristlebacks. Go and break them. Razormane will thank you. Maybe they will even remember Mangletooth." },
        { id = "h_shards", when = { questActive = TODO_QUEST("Blood Shards of Agamaggan") },
          text = "Blood shards. Bristlebacks carry them. Bring them to Mangletooth, and he will give you the boar god's gifts." },
        { id = "h_betrayal", when = { questActive = TODO_QUEST("Betrayal from Within") },
          text = "*snort* Nak, Kuz, Lok. Mangletooth's own. They left him to the cow-folk's axes. Now they learn what Mangletooth thinks of that." },
      },
      choices = {
        { text = "Who is Agamaggan?", next = "agamaggan" },
        { text = "You're not getting out of that cage.", next = "END", fx = { affinity = -1 } },
      },
    },
    agamaggan = {
      big = true,
      lines = {
        { id = "a_default", text = "The great boar. He fell long ago, fighting for this world, and where his blood touched the earth, the thorns grew. His bones lie in the south. The quilboar remember. *snort*" },
      },
      choices = { { text = "Interesting.", next = "END", fx = { affinity = 1, trait = { curious = 1 } } } },
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

  greetings = {
    { id = "g_forge", text = "Come, come. Let me see what you're carrying. Every weapon tells me something about the hand that holds it." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! Then you'll know what I mean: the quilboar's crude spears teach me more than a dozen fine orc blades." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That armor's taken a beating. Interesting beating. Centaur, I'd guess, from the cuts." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tatternack Steelforge. The Warchief sent me to study weapons and armor, and to meet everyone who passes through Taurajo. There's something to learn from every people, even the quilboar." },
        { id = "h_weapons", tags = { "news" }, when = { questActive = TODO_QUEST("Weapons of Choice") },
          text = "I'd like to see what the enemy fights with. Bring me their weapons. I promise to study them before I melt them." },
      },
      choices = { { text = "I'll bring you something interesting.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } } },
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
          text = "Innkeeper Byula. Everyone who crosses the southern Barrens stops at Taurajo eventually. I make sure they leave rested." },
      },
      choices = { { text = "Just a rest, thanks.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Jorn. He knows the Barrens. I know soup." } },
  },
}
