-- Ironforge's people a paladin meets: the Hall of Mysteries, the Commons, the gates.
-- Voices: bibles/brandur.md, bibles/john_turner.md, bibles/jordan.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Brandur Ironhammer: paladin trainer; sends dwarves to Tiza Battleforge, humans to Rall.
P:NPC {
  key = "brandur", id = TODO_NPC("Brandur Ironhammer"), name = "Brandur Ironhammer", title = "Paladin Trainer",
  bible = "bibles/brandur.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "proud" }, values = { "pious", "brave" },
  spiritSensitive = true,
  notices = { "kit" },

  greetings = {
    { id = "g_hall", text = "The Light keep ye. Here for trainin', or here for the warm floor?" },
    { id = "g_human", when = { race = "Human", class = "PALADIN" }, text = "A human paladin up the mountain! Rall'll want ye back by supper." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "PALADIN", durability = { max = 0.25 } },
      text = "Yer plate's in a shameful state. A paladin's armor is a promise tae the people behind ye. Mend it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Brandur Ironhammer. I train the Light's young ones in Ironforge. Dwarves I send on tae Tiza Battleforge; humans tae Duthorian Rall. The Light's no' fussy about beards." },
        { id = "h_dwarf", when = { race = "Dwarf", class = "PALADIN" },
          text = "Ye've a dwarf's stubbornness an' a paladin's oath. That's a fine pair, as long as the oath wins the arguments." },
        { id = "h_other", when = { ["not"] = { class = "PALADIN" } },
          text = "Not one o' mine, but ye're welcome in the Hall. Mind the mages; they bite." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Farewell.", next = "END" },
      },
    },
  },

  topics = {
    tome_of_divinity = { { id = "tp_tome", text = "Tiza teaches it here; Rall in Stormwind. Same book, different accents." } },
    _none = { { id = "tp_none", text = "That's no' for the Hall o' Mysteries. Ask up the Commons." } },
  },
}

-- John Turner: always in Ironforge, always collecting for the Stormwind orphans.
P:NPC {
  key = "john_turner", id = TODO_NPC("John Turner"), name = "John Turner",
  bible = "bibles/john_turner.md", role = "citizen", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "wealth" },

  barks = { { id = "b_orphans", text = "Spare a thought for the orphans of Stormwind! A thought, a copper, anything at all!" } },
  greetings = {
    { id = "g_orphans", text = "Friend! Have you a moment for the orphans of Stormwind?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The orphans thank you for your attention. They'd thank you more for linen." },
  },

  notice = {
    { id = "n_rich", cat = "wealth", when = { money = { min = 500000 } },
      text = "You've a heavy purse, if you don't mind my saying. I mind saying it. I say it anyway. It's for the children." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "John Turner. My wife Stephanie and I run the orphanage in Stormwind. I come up to Ironforge every month to gather supplies. I'm usually here. It's a long month." },
        { id = "h_stephanie", when = { heardLine = "stephanie.h_tome" },
          text = "You've met Stephanie! How is she? Tired? She's always tired. Tell her I'm close to a donation. I'm always close." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Your people are generous, once they've decided you're not a fool. It took them a year. I'm still not sure about some of them." },
      },
      choices = {
        { text = "How are the children?", next = "children" },
        { text = "Good luck, John.", next = "END" },
      },
    },
    children = {
      lines = { { id = "c_default", text = "Growing out of everything we give them. That's good news, really. It's just expensive good news." } },
      choices = { { text = "Ha. I'll keep them in mind.", next = "END", fx = { affinity = 1, align = { light = 1 } } } },
    },
  },

  topics = {
    tome_of_divinity = { { id = "tp_tome", text = "The young paladins come to Stephanie with linen. Best thing the Church ever started." } },
    _none = { { id = "tp_none", text = "No idea! But the orphans of Stormwind could use your help." } },
  },
}

-- Jordan Stilwell: the Church's smith, outside the Gates of Ironforge.
P:NPC {
  key = "jordan", id = TODO_NPC("Jordan Stilwell"), name = "Jordan Stilwell",
  bible = "bibles/jordan.md", role = "blacksmith", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "pious", "honest" },
  notices = { "paladin", "craft" },

  greetings = {
    { id = "g_gate", text = "Cold out here by the gates. Warmer by the anvil. Come closer." },
    { id = "g_fist", when = { questActive = TODO_QUEST("Verigan's Fist") }, text = "For the Fist? Good. Bring what I asked and I'll do the rest." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "A paladin. I trained for it once, before my father's forge called me home. I make the hammers now instead of swinging them. It's a different prayer." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! Show me your hands. Hm. Good burns. Honest ones." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jordan Stilwell. I serve the Church of the Holy Light the only way I know: at the anvil." },
        { id = "h_fist", tags = { "news" }, when = { questActive = TODO_QUEST("Verigan's Fist") },
          text = "Bosch Verigan was my friend. This hammer will carry his name, and it'll go to a paladin worth the name. I hope that's you." },
        { id = "h_daphne", when = { questDone = TODO_QUEST("The Tome of Valor") },
          text = "You stood with Daphne at the farm? She wrote me. She said you were brave and she was braver. That sounds like her." },
      },
      choices = {
        { text = "Who was Verigan?", next = "verigan" },
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Stay warm, Jordan.", next = "END" },
      },
    },
    verigan = {
      lines = { { id = "v_default", text = "An old friend. A good man. The kind you name things after, so people keep asking who he was. That's the point." } },
      choices = { { text = "Then I'll remember him.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
  },

  topics = {
    tome_of_divinity = { { id = "tp_tome", text = "Faith first, then the hammer. Rall's right about that. I'm a smith; I'd put it the other way round, if he'd let me." } },
    westfall = { { id = "tp_westfall", text = "My Daphne keeps the farm there. Stubborn woman. I married her for it." } },
    _none = { { id = "tp_none", text = "Couldn't say. I only know hammers and prayers." } },
  },
}
