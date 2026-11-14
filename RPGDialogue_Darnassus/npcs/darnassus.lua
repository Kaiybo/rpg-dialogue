-- Darnassus. Voice: bibles/darnassus.md
-- Tyrande and Fandral don't agree on much, and both say so. Fandral's later secret is
-- never hinted: his temper shows, nothing else does.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tyrande", id = TODO_NPC("Tyrande Whisperwind"), name = "Tyrande Whisperwind",
  bible = "bibles/darnassus.md", role = "noble", tier = "major",
  communities = { "darnassus" }, temper = { "fierce" }, values = { "protective", "devout" },
  spiritSensitive = true,
  notices = { "fel", "race", "class" },

  greetings = {
    { id = "g_temple", text = "You stand in the Temple of the Moon. Speak plainly. Elune hears everything, and I have little time for the rest." },
    { id = "g_kin", when = { race = "NightElf" }, text = "Child of the kaldorei. Elune's light on you. What do you need of me?" },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good. Those who come back usually have something to say." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "I know that taint. My people burned for it once. Say your piece quickly and take it out of Elune's house." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "NightElf" },
      text = "A sister of the moon. Good. We are fewer than we were, and needed more than ever." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Eldre'Thalas. I remember it as a city of light. Your people left it under a prince's purge, I'm told. That speaks well of them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tyrande Whisperwind, High Priestess of Elune. While my husband sleeps, I lead our people. I did not ask to lead them alone, but I will not do it half-heartedly." },
        { id = "h_tenaron", when = { heardLine = "tenaron.h_default" },
          text = "You came down from Aldrassil past Tenaron's watch. He sends me the best of Shadowglen. Let's see if he was right about you." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "Malfurion would have been glad of you, druid. Go to the Enclave, by all means. But come back here when the Archdruid's certainties start to sound like truths." },
        { id = "h_human", when = { race = "Human" },
          text = "Humans in Darnassus. A few years ago I would have thought it impossible. The Alliance has taught us both to be surprised." },
      },
      choices = {
        { text = "Where is Malfurion?", next = "malfurion" },
        { text = "What troubles Darnassus?", next = "troubles" },
        { text = "Elune be with you.", next = "END", fx = { affinity = 1 } },
      },
    },
    malfurion = {
      big = true,
      lines = {
        { id = "m_default", text = "His body sleeps in his barrow. His spirit walks the Emerald Dream and does not come back. The druids searched. They found nothing. I wait. I am very tired of waiting." },
      },
      choices = {
        { text = "He'll come back.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Can nothing be done?", next = "done" },
      },
    },
    done = {
      lines = { { id = "d_default", text = "If you find a way, bring it to me before anyone else. Anyone. I trust very few with my husband's life." } },
      choices = { { text = "...", next = "END" } },
    },
    troubles = {
      lines = {
        { id = "t_default", text = "Our immortality is gone, and some of us want it back at any price. The Horde cuts at Ashenvale. And the Archdruid has opinions about everything." },
      },
      choices = {
        { text = "The Archdruid?", next = "fandral" },
        { text = "I'll help where I can.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    fandral = {
      lines = { { id = "f_default", text = "Fandral Staghelm grew this tree without the Aspects' blessing and calls it a triumph. Perhaps it is. I would sleep better if Malfurion had been asked." } },
      choices = { { text = "...", next = "END", fx = { learn = { "cenarion_circle" } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "My husband's order. In his absence, Fandral's. I pray that's a short arrangement." } },
    worgen = { { id = "tp_worgen", text = "In the human woods? I have heard. Ask the druids, and watch their faces when you do." } },
    _none = { { id = "tp_none", text = "That is not a matter for the Temple. The Sentinels may know." } },
  },
}

P:NPC {
  key = "fandral", id = TODO_NPC("Arch Druid Fandral Staghelm"), name = "Arch Druid Fandral Staghelm",
  bible = "bibles/darnassus.md", role = "noble", tier = "major",
  communities = { "darnassus" }, temper = { "abrasive" }, values = { "proud", "ambitious" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_enclave", text = "Yes? The Enclave is busy. I am busier. Be brief." },
    { id = "g_druid", when = { class = "DRUID", race = "NightElf" }, text = "A kaldorei druid. Good. The Circle needs more of our own and fewer of the rest." },
    { id = "g_back", when = { metBefore = true }, text = "Again. Very well. Speak." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren", class = "DRUID" },
      text = "A tauren druid. Malfurion's generosity, still walking about. I'll not pretend I agreed with it." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne", class = "DRUID" },
      text = "A druid of the sky-folk. You honour the winds above the moon, I hear. The Circle's doors have been flung very wide indeed." },
    { id = "n_not", cat = "class", when = { ["not"] = { class = "DRUID" } },
      text = "You're no druid. Whatever you want from the Enclave, I doubt you'll understand it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fandral Staghelm, Archdruid of the Cenarion Circle. While Malfurion dreams, someone must lead. I do. Some would rather I didn't. They are wrong." },
        { id = "h_corithras", when = { heardLine = "corithras.h_default" },
          text = "Corithras worries about the moonwells. Corithras worries about everything. Teldrassil is young; it will grow strong. Patience." },
        { id = "h_crown", tags = { "news" }, when = { questActive = TODO_QUEST("Crown of the Earth") },
          text = "The moonwells of Teldrassil. Their waters will tell me how the tree grows. Bring them to me untouched. And do not dawdle." },
        { id = "h_crown_done", when = { questDone = TODO_QUEST("Crown of the Earth") },
          text = "The tree is strong. Stronger than its critics. I'll be sure to tell them." },
        { id = "h_tyrande", when = { heardLine = "tyrande.h_default" },
          text = "Fresh from the Temple, by the reproachful look of you. The High Priestess has many virtues. Leadership is not chief among them." },
      },
      choices = {
        { text = "Why did you grow Teldrassil?", next = "tree" },
        { text = "What of Moonglade?", next = "moonglade" },
        { text = "I'll go.", next = "END" },
      },
    },
    tree = {
      big = true,
      lines = {
        { id = "t_default", text = "Because we lost our immortality at Hyjal, and a people that can die should not wait politely to do it. The Aspects withheld their blessing. We grew it anyway. Look up. It holds." },
      },
      choices = {
        { text = "It's magnificent.", next = "END", fx = { affinity = 2 } },
        { text = "Without their blessing?", next = "blessing", fx = { trait = { skeptical = 1 } } },
      },
    },
    blessing = {
      lines = { { id = "b_default", text = "Blessings are for those who can afford to wait for them. We could not. Spare me the Temple's sermon; I've heard it." } },
      choices = { { text = "...", next = "END" } },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Remulos keeps his glade and his opinions. The druids there talk of balance while the world tilts. I prefer to act." } },
      choices = { { text = "...", next = "END", fx = { learn = { "cenarion_circle" } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Mine to lead, for now. I mean to leave it stronger than I found it, whatever Moonglade thinks." } },
    _none = { { id = "tp_none", text = "Not my concern. Ask a Sentinel. They enjoy being asked things." } },
  },
}

P:NPC {
  key = "mathrengyl", id = TODO_NPC("Mathrengyl Bearwalker"), name = "Mathrengyl Bearwalker",
  bible = "bibles/darnassus.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "calm" }, values = { "wise", "loyal" },
  notices = { "form", "class" },

  greetings = {
    { id = "g_druid", when = { class = "DRUID" }, text = "Welcome, young one. The Enclave's doors are open to you, and so is my time." },
    { id = "g_other", when = { ["not"] = { class = "DRUID" } }, text = "What brings you to the Cenarion Circle, friend? Ask, and I'll answer if I can." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ah, the bear sits well on you. The Great Bear Spirit chose rightly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mathrengyl Bearwalker. I train the druids of the Enclave. Once I stood at the Archdruid's side; now I stand with the young ones, which suits me better." },
        { id = "h_call", tags = { "news" }, when = { questActive = TODO_QUEST("Heeding the Call") },
          text = "You heard the call. Good. Not everyone does. Sit, and we'll speak of what it means to walk as more than one creature." },
        { id = "h_claw", when = { questActive = TODO_QUEST("Body and Heart") },
          text = "The Great Bear Spirit has shown you the body. Now the heart. Lunaclaw waits to test it. Go humbly." },
        { id = "h_poison", when = { questActive = TODO_QUEST("Lessons Anew") },
          text = "Auberdine has had trouble with poisons. A druid who can draw poison out of the living is worth ten who can only watch. Learn it." },
        { id = "h_aquatic", when = { questDone = TODO_QUEST("Aquatic Form") },
          text = "The sea's yours now, as well as the forest. Few of us are comfortable in both. Try to be." },
        { id = "h_strife", when = { metBefore = true },
          text = "You'll hear talk that the Circle is divided. Don't believe it. Fandral leads us well, and his vision built the very tree you stand on." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What is a Druid of the Claw?", next = "claw" },
        { text = "Farewell.", next = "END" },
      },
    },
    claw = {
      big = true,
      lines = {
        { id = "c_default", text = "One who wears the bear and understands it: strength held in reserve, given to protect. Many can take the shape. Fewer earn the name." },
      },
      choices = { { text = "I'd like to earn it.", next = "END", fx = { affinity = 2, learn = { "cenarion_circle" } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "United, whatever you've heard. Disagreement isn't division. The Archdruid has broad shoulders." } },
    _none = { { id = "tp_none", text = "That's beyond my teaching. Ask in the Temple, perhaps." } },
  },
}

P:NPC {
  key = "amoora", id = TODO_NPC("Priestess A'moora"), name = "Priestess A'moora",
  bible = "bibles/darnassus.md", role = "priest", tier = "quest",
  communities = { "darnassus" }, temper = { "gentle" }, values = { "devout", "kind" },
  notices = { "class", "death" },

  greetings = {
    { id = "g_moon", text = "Elune's light finds you, even here under the branches. Come in, sit by the pool." },
    { id = "g_back", when = { metBefore = true }, text = "There you are, little star. The moon remembers those who return." },
  },

  notice = {
    { id = "n_ghost", cat = "death", when = { resSick = true },
      text = "You've walked the other side not long ago. Rest here. The moon is kind to those who've seen its dark half." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "A'moora, a priestess of the Sisterhood. I tend the Temple's pool and those who come to it. Most come tired. I try to send them out less so." },
        { id = "h_temple", tags = { "news" }, when = { questActive = TODO_QUEST("The Temple of the Moon") },
          text = "You've found the Temple. Good. There is work for a willing heart, and a little sorrow in it. Listen." },
        { id = "h_tears", when = { questActive = TODO_QUEST("Tears of the Moon") },
          text = "That errand is a quiet one, and a sad one. Go carefully, and come back to me when it's done." },
        { id = "h_sathrah", when = { questActive = TODO_QUEST("Sathrah's Sacrifice") },
          text = "Sathrah's name is spoken softly in this temple. Do what's asked, and do it with care." },
      },
      choices = {
        { text = "Tell me about Elune.", next = "elune" },
        { text = "Thank you, Priestess.", next = "END" },
      },
    },
    elune = {
      big = true,
      lines = {
        { id = "e_default", text = "She is the light that doesn't burn. She doesn't ask us to be strong, only to keep shining a little in the dark. Even a little is enough." },
      },
      choices = { { text = "That's beautiful.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Our brothers and sisters of the wild. The Temple and the Enclave love each other, mostly. Loudly, at times." } },
    _none = { { id = "tp_none", text = "I couldn't say, little star. The High Priestess might." } },
  },
}

P:NPC {
  key = "gracina", id = TODO_NPC("Gracina Spiritmight"), name = "Gracina Spiritmight",
  bible = "bibles/darnassus.md", role = "scholar", tier = "quest",
  communities = { "darnassus" }, temper = { "intent" }, values = { "curious", "devout" },
  notices = { "lore", "trophy" },

  greetings = {
    { id = "g_study", text = "Careful with the specimens. Some of them are only mostly dead." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Bring anything? Shells, stings, chitin? I'm not particular." },
  },

  notice = {
    { id = "n_skinner", cat = "trophy", when = { profession = "Skinning" },
      text = "A skinner! Then you've handled more of Azeroth's creatures than most scholars ever will. Tell me what you've seen." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gracina Spiritmight, priestess and scholar. I study the creatures that belong to this world alone. Lately, the ones that don't seem to belong to it at all." },
        { id = "h_silithid", tags = { "news" }, when = { questActive = TODO_QUEST("Rise of the Silithid") },
          text = "Silithid. Insects, the young ones call them, but no insect thinks the way they do. Bring me what you find. Carefully." },
        { id = "h_low", when = { maxLevel = 40 },
          text = "Things live in the southern deserts that frighten me more than any orc. You're young yet. Come back when you're not." },
      },
      choices = {
        { text = "What frightens you?", next = "fear" },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    fear = {
      big = true,
      lines = {
        { id = "f_default", text = "Order without mercy. A hive moves as one mind, and that mind is patient. Patient enemies are the worst kind. They outlast you." },
      },
      choices = { { text = "I'll keep my eyes open.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not my field. Now, if it had six legs, I'd be all ears." } },
  },
}

P:NPC {
  key = "saelienne", id = TODO_NPC("Innkeeper Saelienne"), name = "Innkeeper Saelienne",
  bible = "bibles/darnassus.md", role = "innkeeper", tier = "service",
  communities = { "darnassus" }, temper = { "warm" }, values = { "kind" },
  notices = { "weary", "race" },

  greetings = {
    { id = "g_rest", text = "Rest a while, traveller. The branches rock a little at night. Most find it soothing." },
    { id = "g_home", when = { homeInn = { "Darnassus", "Craftsmen's Terrace" } }, text = "You're home. Elune guard your dreams tonight." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "You've had a hard road. Sit. Moonberry juice first, then sleep, then whatever comes after." },
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Gnome" } },
      text = "Don't look down from the terrace, friend. Everyone does it once. Once is enough." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Saelienne. I keep the inn on the Craftsmen's Terrace. Travellers come up from the boats looking lost. I make sure they leave looking rested." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You'll sleep well up here, I think. Your people are used to the ground being a long way down." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just resting.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I only keep the beds. The Temple knows more." } },
  },
}
