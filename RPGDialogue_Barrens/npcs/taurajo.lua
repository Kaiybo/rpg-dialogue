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
        { text = "Teach me the four great beasts, teacher.", next = "hunter", when = { class = "HUNTER" } },
        { text = "How do I know my companion trusts me?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "My people hunted with spears and voodoo, not patience.", next = "troll", when = { race = "Troll", class = "HUNTER" } },
        { text = "The skies of my home had beasts too.", next = "skyborne", when = { race = "Skyborne", class = "HUNTER" } },
        { text = "Do you teach druids, or only hunters?", next = "druid", when = { class = "DRUID" } },
        { text = "Thank you, teacher.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else would you learn? Sit, there's light enough yet." },
        { id = "h_again2", text = "Another question? Good, because a hunter who stops asking soon stops seeing the grass." },
      },
    },
    hunter = {
      big = true,
      lines = {
        { id = "hu_default", text = "Ishamuhale, Lakota'mani, Owatanka and Washte Pawne: the lizard, the kodo, the hawk and the serpent. Each one teaches something a bow can't, and only a hunter who has faced all four truly knows the Barrens." },
        { id = "hu_runner", when = { origin = "tauren_plains_runner" },
          text = "You've run these plains since you could stand, so you've seen Lakota'mani's tracks already, I'd wager. Now you'll learn why the runners never follow them alone." },
        { id = "hu_orc", when = { race = "Orc" },
          text = "Orc hunters come to me thinking a beast is something to break. The four will teach you otherwise, if you let them, and if you don't, Lakota'mani will teach you with his hooves." },
      },
      choices = {
        { text = "Which should I face first?", next = "hunter_first" },
        { text = "I'll face them to honor the land.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll face them for the trophies, teacher.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    hunter_first = {
      lines = { { id = "hf_default", text = "Ishamuhale, the thunder lizard, because he'll teach you to read the ground before he charges. Then the kodo for patience, the hawk for the sky, and the serpent last, because she teaches humility, and that lesson hurts." } },
      choices = { { text = "I'll start with the lizard.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    pet = {
      lines = {
        { id = "pe_default", text = "Watch {pet} when you're hurt. A beast that only follows you will hang back, but a beast that trusts you will put itself between you and the danger. When you see that, you'll have something no trainer can give you." },
      },
      choices = {
        { text = "{pet} already does that.", next = "pet_already" },
        { text = "Then I'll earn it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    pet_already = {
      lines = { { id = "pa_default", text = "Then never send it into a fight you wouldn't walk into yourself. A beast's trust is the most patient thing in the world, and the easiest to spend." } },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 2 } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "Spears and voodoo have served the Darkspear well, and I won't ask you to give them up. But the Barrens are wider than any jungle, and out here the hunter who waits outlives the hunter who charges. Learn to wait, and then throw your spear." } },
      choices = {
        { text = "A headhunter strikes first. That's our way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll learn your patience, and keep my spear.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "I'd like to hear of them one day, though I suspect your hawks were bigger than ours. The Windshapers' hunters who came through Taurajo walk the grass as if they expect it to blow away beneath them, and I find that charming." } },
      choices = {
        { text = "The ground here is very still.", next = "BACK", fx = { affinity = 2 } },
        { text = "What did they ask you?", next = "skyborne_ask" },
      },
    },
    skyborne_ask = {
      lines = { { id = "sa_default", text = "Whether the wind on the plains has a spirit that would answer them. I told them to ask Owatanka, the thunderhawk, and they laughed, but I wasn't joking." } },
      choices = { { text = "Maybe I'll ask him.", next = "BACK", fx = { affinity = 1 } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Hamuul's druids come to sit with me now and then, to learn how a hunter reads the grass. A druid who can wear a cat's body still has to learn to think like one, and the cats here are very good teachers." } },
      choices = { { text = "Then teach me how a cat thinks.", next = "BACK", fx = { affinity = 2 } } },
    },
    first = {
      lines = { { id = "f_default", text = "Stillness. Anyone can run and anyone can shoot, but stillness is what lets you choose when to do either." } },
      choices = { { text = "I'll practice.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
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
        { text = "That lock wouldn't take me long to pick.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'm tauren. Why should I help you?", next = "tauren", when = { race = "Tauren" } },
        { text = "You're not getting out of that cage.", next = "END", fx = { affinity = -1 } },
      },
      again = {
        { id = "h_again", text = "*snort* More questions? Mangletooth answers, for a price." },
      },
    },
    rogue = {
      big = true,
      lines = { { id = "ro_default", text = "*snort* Quiet, quiet! The cow-folk will hear. Mangletooth knows a sneaky one when he smells one, and a sneaky one who opened this cage would get the best of the boar god's gifts, all of them." } },
      choices = {
        { text = "The camp keeps its prisoner. I'm not a traitor.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Keep talking. Maybe one day, for the right gifts.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "*snort* Because Bristlebacks raid your kodo too, cow-folk, and Mangletooth tells you where they sleep. You hate quilboar, Mangletooth hates Bristlebacks, and today the hates point the same way." } },
      choices = { { text = "Today. Not tomorrow.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    agamaggan = {
      big = true,
      lines = {
        { id = "a_default", text = "*snort* The great boar fell long ago, fighting for this world, and where his blood touched the earth, the thorns grew. His bones lie in the south, and the quilboar remember." },
      },
      choices = { { text = "Interesting.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    why = {
      lines = {
        { id = "w_hate", text = "*snort* Mangletooth hates cages, but Mangletooth hates Bristlebacks more. A clever boar picks which hate to feed, and today Mangletooth feeds the bigger one." },
      },
      choices = { { text = "I'll remember you said that.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
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
      choices = {
        { text = "What have you learned so far?", next = "learned" },
        { text = "What does my weapon tell you about me?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "A shaman's totems are made here too. Do you study them?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'll bring you something interesting.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } },
      },
      again = {
        { id = "h_again", text = "Something else? My hands are busy, but my ears aren't." },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "Let me see the edge. Hm, you've been fighting things with hide, not armor, because it's dull in the middle and sharp at the tip. You stab more than you think you do, warrior." },
        { id = "wa_tauren", when = { race = "Tauren" },
          text = "A tauren warrior's grip wears the haft smooth just above the middle, every time, because you swing from the shoulders like a kodo. I've written a whole page on it." },
      },
      choices = { { text = "Then I'll learn to swing better.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "I would if anyone let me hold one long enough! The shamans here say a totem is carved for a spirit and not for study, and I respect that, though I'd still like to know which wood takes the lightning best." } },
      choices = { { text = "I'll ask the spirits for you.", next = "BACK", fx = { affinity = 2 } } },
    },
    learned = {
      lines = {
        { id = "l_bone", text = "That the quilboar sharpen bone better than most smiths sharpen steel, and the centaur don't sharpen anything at all; they just hit harder. I'm writing it all down for the Warchief, and he may never read it, but I'm writing it anyway." },
      },
      choices = { { text = "Somebody should.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
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
