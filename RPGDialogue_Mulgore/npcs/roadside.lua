-- Mulgore's roads and Bloodhoof's trainers. Voice: bibles/mulgore.md
-- Morin Cloudstalker walks the plains and watches the dwarves at Bael'dun and the Venture Company's mines.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "morin", id = TODO_NPC("Morin Cloudstalker"), name = "Morin Cloudstalker",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  temper = { "steady" }, values = { "protective", "dutiful" },
  notices = { "race" },
  impression = {
    first = "Morin Cloudstalker keeps watch on Mulgore's open road, a tauren who has seen caravans burned and dwarves digging where they have no right. He speaks slowly and means every word.",
    third = "{name} met Morin Cloudstalker, who watches the roads of Mulgore.",
  },
  greetings = {
    { id = "g_road", text = "The road is long and the plains are wide, traveler. Stand with me a moment." },
    { id = "g_back", when = { metBefore = true }, text = "You return to my stretch of road. The Earth Mother keeps you, I see." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf on Mulgore's road, walking in the open. That is more honest than your kin at Bael'dun, at least." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Morin Cloudstalker, and I watch over the road for the braves of Bloodhoof. Strangers have been tearing at the earth to the north, and a caravan of ours was ravaged not far from here." },
        { id = "h_caravan", when = { questActive = TODO_QUEST("The Ravaged Caravan") },
          text = "The caravan lies broken by the road to the north. Search it, and tell me what you find, because the dead deserve to be known." },
        { id = "h_dig", when = { questActive = TODO_QUEST("Dwarven Digging") },
          text = "The dwarves at Bael'dun dig without asking the land's leave. Bring me proof of what they seek, so the elders can judge it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You are a shaman, so you must feel what the strangers to the north are doing to the earth, as surely as I see it." },
      },
      choices = {
        { text = "What are the dwarves digging for?", next = "dwarves" },
        { text = "What happened to the caravan?", next = "caravan" },
        { text = "Who else troubles Mulgore?", next = "venture" },
        { text = "My people have no part in Bael'dun.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "The earth to the north is wounded. What can a shaman do?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Ask what you need. The road will still be here when we are done." },
        { id = "h_again2", text = "There is more on your mind, I think. Speak it." },
      },
    },
    dwarves = {
      lines = { { id = "d_default", text = "They say they look for the ancient things of the titans, buried deep beneath our plains. Whatever they seek, they have built a fortress to guard it, and fortresses are not built for peaceful work." } },
      choices = { { text = "Will the tauren drive them out?", next = "dwarves_out" } },
    },
    dwarves_out = {
      lines = { { id = "do_default", text = "Cairne hopes to avoid a war, because our people have had enough of those. But the braves grow angry each time the dwarves' machines shake the ground." } },
      choices = { { text = "What would you do?", next = "dwarves_morin" } },
    },
    dwarves_morin = {
      lines = { { id = "dm_default", text = "I would ask them once, plainly, to leave. If they would not, then the land itself would forgive us for making them." } },
      choices = {
        { text = "Then ask them, and make them go if they refuse.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Asking only warns them. Strike before they're ready.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else, Morin.", next = "BACK" },
      },
    },
    caravan = {
      lines = { { id = "c_default", text = "It carried goods from Bloodhoof toward the Barrens, and it never got past the hills. The attackers took little and broke much, which tells me they wanted fear more than plunder." } },
      choices = { { text = "I'll search it.", next = "BACK", fx = { affinity = 1 } } },
    },
    venture = {
      lines = { { id = "v_default", text = "Goblins of the Venture Company have opened mines in our hills, and the quilboar and the gnolls grow bold besides. Ask the braves at Bloodhoof, because each of them has a story." } },
      choices = { { text = "Thank you.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "I believe you, for you walk the open road and do not hide behind walls. Tell your kin in Ironforge that Mulgore is not empty land, and that it has people who remember." } },
      choices = { { text = "I'll tell them.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Mend what can be mended, and remember what can't. The dwarves dig at Bael'dun and the goblins dig at their mine, and neither asks the earth's leave, so someone must ask its pardon for them, and someone must make them stop." } },
      choices = {
        { text = "I would ask its pardon first, and help it heal.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I would make them stop, and let the earth have them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know the road and the grass beside it. For more than that, ask the elders." } },
  },
}

P:NPC {
  key = "gennia", id = TODO_NPC("Gennia Runetotem"), name = "Gennia Runetotem",
  bible = "bibles/mulgore.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "serene" }, values = { "wise", "patient" },
  notices = { "class" },
  impression = {
    first = "Gennia Runetotem teaches the young druids of Bloodhoof Village, gentle and patient, with the Runetotem family's long memory of the Cenarion way.",
    third = "{name} met Gennia Runetotem, the druid trainer at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Peace to you, young one. The grass is tall this season, and the land is glad." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gennia Runetotem, and I teach the druids of Bloodhoof what the land is willing to share. Our family learned the old ways from the night elves, long ago, and we keep them still." },
        { id = "h_druid", when = { class = "DRUID" }, text = "Welcome back, little druid. Show me what the wild has taught you since last we spoke." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman among my druids? You're welcome here, because the Earth Mother speaks to both of us, only in different voices." },
      },
      choices = {
        { text = "Tauren learned from the night elves?", next = "elves" },
        { text = "What does a druid do?", next = "druid" },
        { text = "How does a druid's path differ from a shaman's, Gennia?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Earth Mother keep you.", next = "END" },
      },
      again = { { id = "h_again", text = "Something more? Ask, and I will answer as the land allows." } },
    },
    elves = {
      lines = { { id = "e_default", text = "Hamuul Runetotem studied with the great Malfurion Stormrage himself, and he brought the teachings home to our people. Some elves still grumble about it, but the Cenarion Circle welcomes us." } },
      choices = { { text = "Where is Hamuul now?", next = "elves_hamuul" } },
    },
    elves_hamuul = {
      lines = { { id = "eh_default", text = "Up on Elder Rise in Thunder Bluff, beside Cairne. Visit him if you are able, because he loves nothing more than a student with questions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "A druid keeps the balance between growth and decay, and between the wild and the people who live within it. We heal, and we take the shapes of beasts, and sometimes we must let things die." } },
      choices = {
        { text = "Balance means accepting hard things.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd save what I could, balance or not.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The night elves taught my family to walk with the wild until we became part of it. Your path is older among the tauren, speaking with the elements and asking their aid, and I think the Earth Mother is glad of both." } },
      choices = {
        { text = "Both paths serve her, so we should share what each learns.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The night elves' ways are theirs. Tauren need only the old rites.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is not something the land has told me, little one." } },
  },
}

P:NPC {
  key = "yaw", id = TODO_NPC("Yaw Sharpmane"), name = "Yaw Sharpmane",
  bible = "bibles/mulgore.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "steady" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Yaw Sharpmane teaches Bloodhoof's hunters, a quiet tauren who measures a student by how they treat their animal companion.",
    third = "{name} met Yaw Sharpmane, the hunter trainer at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "You walk softly enough. Good, because the plainstriders hear everything." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Yaw Sharpmane, and I teach the hunters of Bloodhoof. The plains feed us, so we take only what we need and thank the beast that gives it." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Your companion looks well fed, hunter, and that tells me more about you than your aim." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, then. You'll understand why we thank the beast after a hunt, because you've heard the spirits that walk beside it." },
      },
      choices = {
        { text = "What makes a good hunter?", next = "good" },
        { text = "What's the hunting like in Mulgore?", next = "plains" },
        { text = "Do the beasts' spirits speak to hunters too, Yaw?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Good hunting, Yaw.", next = "END" },
      },
      again = { { id = "h_again", text = "Ask on. A hunter learns by asking as much as by tracking." } },
    },
    good = {
      lines = { { id = "g_default", text = "Patience first, and respect after, and only then the bow. A hunter who kills for sport forgets that the plains are watching him." } },
      choices = {
        { text = "Every kill should be honored.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast is a beast. Meat's meat.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    plains = {
      lines = { { id = "p_default", text = "Plainstriders and prairie wolves near the village, and swoops overhead for the patient. Further north, the Venture Company scares the game away with their noise." } },
      choices = { { text = "And the great beasts?", next = "plains_big" } },
    },
    plains_big = {
      lines = { { id = "pb_default", text = "Ask Harken Windtotem about the old wolves, because he tells those stories better than I do. Then come back and tell me if you believed him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not in words, the way the elements speak to you, but a good hunter learns to listen all the same. When my hawk won't leave my arm, I know something on the plains is wrong, and most often it's the Palemane gnolls." } },
      choices = {
        { text = "Then the beasts and the elements both deserve our thanks.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hunter owes the beast a clean kill, and nothing more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I track beasts, not rumors. Ask at the inn." } },
  },
}
