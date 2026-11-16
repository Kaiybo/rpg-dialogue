-- Thunder Bluff's rises: the Forsaken apothecary on Spirit Rise and the trainers of Hunter Rise. Voice: bibles/thunderbluff.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zamah", id = TODO_NPC("Apothecary Zamah"), name = "Apothecary Zamah",
  bible = "bibles/thunderbluff.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "dry" }, values = { "curious", "ambitious" },
  notices = { "race" },
  impression = {
    first = "Apothecary Zamah works for the Royal Apothecary Society in the Pools of Vision beneath Spirit Rise, a Forsaken among tauren who seems to enjoy their unease. She wants serpentbloom and other samples, and she is politely vague about why.",
    third = "{name} met Apothecary Zamah, the Forsaken apothecary beneath Thunder Bluff's Spirit Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Do come in, and don't mind the smell. The tauren tell me it's an acquired tolerance." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still breathing. How refreshing." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren who comes down here willingly? Your elders mostly cross the pools to avoid me." },
    { id = "n_undead", cat = "race", when = { race = "Undead" },
      text = "Ah, a fellow citizen of the Undercity. It's pleasant to talk to someone who doesn't flinch." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Apothecary Zamah, and I represent the Royal Apothecary Society here among our tauren friends. Cairne lets us study, and in return we share our cures, mostly." },
        { id = "h_serpent", when = { questActive = TODO_QUEST("Serpentbloom") },
          text = "The serpentbloom grows in the Wailing Caverns, among the druids who've gone wrong down there. Bring me what you can, and mind the fumes." },
      },
      choices = {
        { text = "Why are the Forsaken in Thunder Bluff?", next = "why" },
        { text = "What do you want serpentbloom for?", next = "serpent" },
        { text = "How do the tauren treat you?", next = "tauren" },
        { text = "What does the Society really study?", next = "society", when = { race = "Undead" } },
        { text = "I'll be going.", next = "END" },
      },
      again = {
        { id = "h_again", text = "More questions? I do like a curious mind, while it lasts." },
        { id = "h_again2", text = "Go on, ask. The pools aren't going anywhere." },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because Cairne Bloodhoof, bless his enormous heart, spoke for us when the rest of the Horde would sooner have burned us. The tauren believe we can be healed of our curse, and we are happy to let them believe it." } },
      choices = { { text = "You don't believe you can be healed?", next = "why_heal" } },
    },
    why_heal = {
      lines = { { id = "wh_default", text = "I believe in study, and the tauren have herbs and spirits we have never examined. Whether that ends in a cure or in something more useful, the Dark Lady will decide." } },
      choices = { { text = "Something more useful?", next = "why_useful" } },
    },
    why_useful = {
      lines = { { id = "wu_default", text = "A cure for the Scourge's plague, of course, for the living as well as the dead. What else could I possibly mean?" } },
      choices = {
        { text = "Cairne trusted you. Don't betray that.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Use what you learn however you must.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    serpent = {
      lines = { { id = "s_default", text = "Its venom has properties the Society finds remarkable, and the druids of the Fang have made it grow strange and strong. I would very much like to know how." } },
      choices = { { text = "I'll gather some.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      lines = { { id = "t_default", text = "With courtesy and a good deal of staring. Magatha Grimtotem is the only one who looks at me as though she understands me, which I find rather more worrying than the staring." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    society = {
      lines = { { id = "so_default", text = "Plagues, my dear, and everything that cures them or carries them. One must understand a weapon before one can turn it away, or turn it around." } },
      choices = { { text = "I'll keep that between us.", next = "BACK", fx = { affinity = 2 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I'm afraid that falls outside my research, and my interest." } },
  },
}

P:NPC {
  key = "holt", id = TODO_NPC("Holt Thunderhorn"), name = "Holt Thunderhorn",
  bible = "bibles/thunderbluff.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "patient", "wise" },
  notices = { "class" },
  impression = {
    first = "Holt Thunderhorn trains hunters on Hunter Rise, a patient elder whose family is known across Mulgore for its archers.",
    third = "{name} met Holt Thunderhorn, the hunter trainer on Thunder Bluff's Hunter Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Hunter Rise. The wind is good for archery today." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Holt Thunderhorn, and I teach the hunters of Thunder Bluff. The Thunderhorns have hunted Mulgore since long before the bluffs had bridges." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Your bow has seen use since we last met, hunter. Let me see what you have learned." },
      },
      choices = {
        { text = "Are you kin to Mull Thunderhorn?", next = "kin" },
        { text = "What does the Earth Mother ask of hunters?", next = "mother" },
        { text = "Good hunting.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? A hunter's patience includes listening." } },
    },
    kin = {
      lines = { { id = "k_default", text = "Mull is family, yes, though he prefers the village to the bluffs. He keeps an eye on the young braves at Bloodhoof, and I keep an eye on him." } },
      choices = { { text = "Does he need watching?", next = "kin_watch" } },
    },
    kin_watch = {
      lines = { { id = "kw_default", text = "Every Thunderhorn does, because we all think the next hunt will be the greatest. Mull simply says it louder than the rest of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mother = {
      lines = { { id = "m_default", text = "That we take only what the herd can spare, and that we waste nothing of what we take. A hunter who forgets this soon finds the plains empty." } },
      choices = {
        { text = "The herd comes before the hunter.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A hunter must feed his family first.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I have not heard of that. The plains keep many secrets." } },
  },
}

P:NPC {
  key = "ker", id = TODO_NPC("Ker Ragetotem"), name = "Ker Ragetotem",
  bible = "bibles/thunderbluff.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "firm" }, values = { "brave", "honorable" },
  notices = { "class" },
  impression = {
    first = "Ker Ragetotem trains the warriors of Thunder Bluff, a broad, stern tauren who reminds every student that strength is for protecting the herd.",
    third = "{name} met Ker Ragetotem, the warrior trainer in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Stand firm, young one. The bluffs are high, and the wind is not kind to the unsteady." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ker Ragetotem, and I train the warriors who guard Thunder Bluff. A tauren's strength is great, so we must learn to use it carefully." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Come for more training, warrior? Good, because the centaur do not rest, and neither should we." },
      },
      choices = {
        { text = "Who do the warriors fight?", next = "fight" },
        { text = "Why must strength be careful?", next = "careful" },
        { text = "Farewell.", next = "END" },
      },
      again = { { id = "h_again", text = "Ask what you will. A warrior should understand before he swings." } },
    },
    fight = {
      lines = { { id = "f_default", text = "The centaur have hunted our people for generations, and only with the orcs' help did we finally drive them from Mulgore. Now the quilboar and the Venture Company test our borders instead." } },
      choices = { { text = "Will the centaur return?", next = "fight_return" } },
    },
    fight_return = {
      lines = { { id = "fr_default", text = "They are in the Barrens still, and in Desolace, and they remember us as well as we remember them. One day they will try, and on that day I want my students ready." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    careful = {
      lines = { { id = "c_default", text = "Because a tauren who loses his temper can kill a friend as easily as a foe. Cairne taught us that strength without restraint is only another kind of beast." } },
      choices = {
        { text = "Restraint is a warrior's real strength.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some foes deserve no restraint at all.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I am a warrior, not an elder. Ask on Elder Rise." } },
  },
}
