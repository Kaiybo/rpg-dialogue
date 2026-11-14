-- Desolace: Nijel's Point (Alliance, with a neutral Cenarion keeper) and Ghost Walker Post (Horde). Voice: bibles/desolace.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pentigast", id = TODO_NPC("Captain Pentigast"), name = "Captain Pentigast",
  bible = "bibles/desolace.md", role = "soldier", tier = "major",
  communities = { "nijels_point" }, temper = { "calculating" }, values = { "dutiful", "cunning" },
  notices = { "kit", "status" },

  greetings = {
    { id = "g_post", text = "Another sword for Nijel's Point. Good. I've more ground to hold than men to hold it." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the valley. Which clan did you run into this time?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you got between two centaur clans. Easy mistake. Get patched." },
    { id = "n_stormwind", cat = "status", when = { race = "Human" },
      text = "A face from home. Tell me Stormwind still remembers we're out here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Pentigast, of the Stormwind Army. We're spread thin out here, and the centaur outnumber us. Luckily they hate each other more." },
        { id = "h_alliance", tags = { "news" }, when = { questActive = TODO_QUEST("Strange Alliance") },
          text = "One of the clans will deal with us, for a price. Pick your partner and earn their trust. We can sort out what we owe them later." },
        { id = "h_politics", when = { questActive = TODO_QUEST("Brutal Politics") },
          text = "Politics out here are brutal. Make friends with one clan, then remind them they were never ours. Ugly work. Necessary." },
      },
      choices = {
        { text = "Playing the clans against each other?", next = "clans" },
        { text = "I'll help hold the Point.", next = "END", fx = { affinity = 1, standing = { nijels_point = 1 } } },
      },
    },
    clans = {
      big = true,
      lines = {
        { id = "c_default", text = "Kolkar, Magram, Gelkis. Three clans, three grudges, one valley. If they spend their arrows on each other, they don't spend them on us. I'd rather that than a war I can't win." },
      },
      choices = {
        { text = "Clever.", next = "END", fx = { affinity = 2, align = { order = 1 } } },
        { text = "And when they find out?", next = "END", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The keeper's on his own errand. I don't ask. He doesn't explain. We get along." } },
    _none = { { id = "tp_none", text = "Not in my orders. Ask Kreldig; the Reclaimers poke into everything." } },
  },
}

P:NPC {
  key = "marandis", id = TODO_NPC("Keeper Marandis"), name = "Keeper Marandis",
  bible = "bibles/desolace.md", role = "noble", tier = "quest",
  communities = { "nijels_point" }, temper = { "formal" }, values = { "proud", "devout" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_keeper", text = "You stand before a keeper of the grove. Speak carefully; my time is the Circle's, not mine." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you know what the Circle asks of its servants. Perhaps one day it will ask more of you." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "You wear the bear with some dignity. Good. Keep it when you take your own shape again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Keeper Marandis, of the Cenarion Circle. My sisters and I came down from Stonetalon on the Circle's business, and it is not small business." },
        { id = "h_corruption", tags = { "news" }, when = { questActive = TODO_QUEST("Corruption of Earth and Seed") },
          text = "The earth here is sick at its root. Bring me proof of what's poisoning it. The Circle must know." },
        { id = "h_strong", when = { minLevel = 45 },
          text = "You've grown strong. Then hear it: a princess of the earth, Theradras, holds the body of one dear to the Circle. We mean to take it back." },
      },
      choices = {
        { text = "What mission?", next = "mission" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    mission = {
      lines = { { id = "m_default", text = "Ask me again when you've grown. The Circle's business is not for apprentices. No offense is meant." } },
      choices = { { text = "Some taken.", next = "END", fx = { affinity = -1 } }, { text = "I understand.", next = "END", fx = { affinity = 1, learn = { "cenarion_circle" } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The Circle sees further than any one keeper. I see as far as Desolace. It is far enough to worry." } },
    _none = { { id = "tp_none", text = "That does not concern the Circle, so it does not concern me." } },
  },
}

P:NPC {
  key = "kreldig", id = TODO_NPC("Kreldig Ungor"), name = "Kreldig Ungor",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  communities = { "nijels_point" }, temper = { "busy" }, values = { "practical", "friendly" },
  notices = { "craft" },

  greetings = {
    { id = "g_busy", text = "Got a lot on out here, friend. Wrecks to pick, reagents to fetch, an' only the one of me." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering", "Mining" } },
      text = "Good with yer hands? Reclaimers Inc. is always hirin' folk who know salvage from scrap." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kreldig Ungor, Reclaimers Inc. We find what others lost an' put it back to use. Desolace has lost a great deal." },
        { id = "h_karnitol", tags = { "news" }, when = { questActive = TODO_QUEST("The Karnitol Shipwreck") },
          text = "The Karnitol went down off the coast with her cargo. The Reclaimers want what's left aboard. Fetch what ye can." },
        { id = "h_reagents", when = { questActive = TODO_QUEST("Reagents for Reclaimers Inc.") },
          text = "Reagents, from the beasts an' the ruins. The Reclaimers pay fair. Mostly on time." },
        { id = "h_business", when = { questActive = TODO_QUEST("Reclaimers' Business in Desolace") },
          text = "Ye came all this way on Reclaimers' business? Good. Pull up a crate." },
      },
      choices = { { text = "I'll help.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    explorers_league = { { id = "tp_league", text = "The League digs fer history. We dig fer things that still work. Friendly rivals." } },
    _none = { { id = "tp_none", text = "Never salvaged one o' those. Ask the Captain." } },
  },
}

P:NPC {
  key = "anton", id = TODO_NPC("Brother Anton"), name = "Brother Anton",
  bible = "bibles/desolace.md", role = "priest", tier = "quest",
  communities = { "nijels_point" }, temper = { "zealous" }, values = { "devout", "brave" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_light", text = "The Light be with you, friend. Have you come to take up the Crusade's cause? There's work for the faithful here." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "A servant of the Light! Then you'll want to see the Valley of Bones. The dead walk there, and the Crusade means to stop them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Brother Anton, an emissary of the Scarlet Crusade. We fight the undead wherever they rise. Brother Crowley in Stormwind sends me the willing." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("Down the Scarlet Path") },
          text = "The Valley of Bones, to the southeast. The dead walk there. Destroy them, and the Crusade will welcome you." },
        { id = "h_crowley", when = { questActive = TODO_QUEST("Brother Anton") },
          text = "Brother Crowley sent you! Good. Then you're ready to prove yourself to the Crusade." },
      },
      choices = {
        { text = "I've heard troubling things about the Crusade.", next = "troubling" },
        { text = "I'll go to the valley.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    troubling = {
      big = true,
      lines = {
        { id = "t_default", text = "Rumors. There are always rumors about anyone who fights hard. The Crusade's cause is just. I'm sure of it. I've been in Desolace a long while, I admit." },
      },
      choices = {
        { text = "Maybe you should go back and see.", next = "END", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "I'm sure you're right.", next = "END", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "Brave men and women, fighting the plague where no one else will. Whatever you've heard, that's the heart of it." } },
    _none = { { id = "tp_none", text = "I couldn't say. Pray on it." } },
  },
}

P:NPC {
  key = "lyshaerya", id = TODO_NPC("Innkeeper Lyshaerya"), name = "Innkeeper Lyshaerya",
  bible = "bibles/desolace.md", role = "innkeeper", tier = "service",
  communities = { "nijels_point" }, temper = { "calm" }, values = { "kind" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Rest here. There's little enough comfort in Desolace; take what this roof can give." },
    { id = "g_home", when = { homeInn = { "Nijel's Point" } }, text = "You've come back to the Point. Your bed's made. The dust got in anyway." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've walked back from the spirit healer across a dead land. Sit. Nothing here will ask anything of you for an hour." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Lyshaerya. I keep the only warm hearth between Stonetalon and Feralas. Travelers find their way to it eventually." },
        { id = "h_dust", when = { metBefore = true }, text = "Desolace dust gets into everything. The bread, the beds, my hair. I've stopped fighting it. Now I just sweep while I talk." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The centaur drums carry a long way at night. You stop hearing them after a week. I haven't stopped yet." },
      },
      choices = { { text = "Just a room, thank you.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I keep the hearth. Ask the Captain for news." } },
  },
}

-- Ghost Walker Post: the Horde's camp in Desolace.
P:NPC {
  key = "takata", id = TODO_NPC("Takata Steelblade"), name = "Takata Steelblade",
  bible = "bibles/desolace.md", role = "soldier", tier = "major",
  communities = { "ghost_walker" }, temper = { "hard" }, values = { "loyal", "stern" },
  notices = { "class", "kit" },

  greetings = {
    { id = "g_post", text = "You're in Desolace now. The demons' servants are thick here. Are you here to fight them?" },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. I've killed a great many who walked your road too far. Don't make me add you to the count." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Satyr claws, by the look of it. They fight dirty. Learn to fight dirtier." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Takata Steelblade. Keldran sent me from Orgrimmar to hunt the Burning Blade here. They hide among the satyrs, so the satyrs die too." },
        { id = "h_satyr", tags = { "news" }, when = { questActive = TODO_QUEST("Befouled by Satyr") },
          text = "The satyrs foul everything they touch. Thin them. The Blade loses its friends one horn at a time." },
        { id = "h_corrupter", when = { questActive = TODO_QUEST("The Corrupter") },
          text = "There's something behind the satyrs, something worse. Find it, and end it." },
        { id = "h_relations", when = { questActive = TODO_QUEST("Alliance Relations") },
          text = "The centaur clans can be bargained with. One of them, anyway. Go and see which." },
      },
      choices = { { text = "I'll hunt with you.", next = "END", fx = { affinity = 2, learn = { "burning_blade" } } } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "Orcs who still kneel to the old fire. In Durotar they hide in caves. Here they hide behind satyrs. I find them either way." } },
    _none = { { id = "tp_none", text = "Not my hunt." } },
  },
}

P:NPC {
  key = "nataka", id = TODO_NPC("Nataka Longhorn"), name = "Nataka Longhorn",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  communities = { "ghost_walker" }, temper = { "easygoing" }, values = { "patient", "practical" },
  notices = { "craft", "race" },

  greetings = {
    { id = "g_post", text = "Desolace isn't such a bad place, once you stop expecting it to grow anything. Sit down." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The centaur still out there? They always are." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You fish? Out here? Good. There's a catch off the coast I'd like to see before I'm too old to eat it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the herd, in this grey place. It does me good to see horns that aren't centaur bows." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nataka Longhorn, of Thunder Bluff. The centaur harass us, the land gives nothing, and still I've grown fond of it. Don't tell anyone." },
        { id = "h_family", tags = { "news" }, when = { questActive = TODO_QUEST("Family Tree") },
          text = "A letter? From my brother, at Freewind? I'd given up waiting. Let me sit down before I read it." },
        { id = "h_brother", when = { heardLine = "longhorn.h_default" },
          text = "You've been to Freewind Post? Then you've met my brother. Does he still stand on the edge of the mesa like he's holding it up?" },
        { id = "h_catch", when = { questActive = TODO_QUEST("Catch of the Day") },
          text = "There's a fish off this coast worth the trouble. Bring me one, and we'll both eat better than Desolace deserves." },
      },
      choices = { { text = "I'll help.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "My brother writes about them, when he writes. He worries. He always worried more than me." } },
    _none = { { id = "tp_none", text = "Couldn't say. Desolace doesn't bring much news." } },
  },
}
