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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "It does, and I'd be a poor apothecary if I couldn't name a dozen of them, but the tauren believe I'm making medicine, and so I am, mostly. Bring the blooms up from the Wailing Caverns and keep your guesses to yourself, and we'll both stay welcome on Spirit Rise." },
      },
      choices = {
        { text = "Secrets suit me. Your work is safe with me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "If it harms the tauren, they should know.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What do you really want serpentbloom for?", next = "serpent" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They mind, quietly, the way tauren mind everything, with long looks and longer silences. The Pools of Vision are holy to them, so I'd keep your spells in your pocket down here, whatever you think of their spirits." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "They mind me already, so a second Forsaken in a mage's robe is hardly going to ruin anyone's day. Keep your spells in your pocket down here, though, because the Pools of Vision are holy to them, and Cairne's patience is what keeps us all welcome." },
      },
      choices = {
        { text = "Their pools, their rules. I'll keep my spells still.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Holy or not, the pools don't own my magic.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How do the tauren treat you here?", next = "tauren" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They look at me the same way, and I didn't even bring a demon. The tauren know what fel fire does to grass and to people, so you might as well get used to the looks, because they won't stop." },
      },
      choices = {
        { text = "Their fear is fair. I'll keep my imp leashed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them stare. Fear keeps people polite.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why are the Forsaken in Thunder Bluff?", next = "why" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Apothecary Zamah, and I represent the Royal Apothecary Society here among our tauren friends. Cairne lets us study, and in return we share our cures, mostly." },
        { id = "h_serpent", when = { questActive = TODO_QUEST("Serpentbloom") },
          text = "The serpentbloom grows in the Wailing Caverns, among the druids who've gone wrong down there. Bring me what you can, and mind the fumes." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Ah, a shaman. The elements are such fascinating subjects, and so very poor at holding still to be studied." },
      },
      choices = {
        { text = "Why are the Forsaken in Thunder Bluff?", next = "why" },
        { text = "What do you want serpentbloom for?", next = "serpent" },
        { text = "How do the tauren treat you?", next = "tauren" },
        { text = "What does the Society really study?", next = "society", when = { race = "Undead" } },
        { text = "Do the spirits of the Pools trouble you, Zamah?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Serpentbloom has other uses, I'd imagine.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the tauren mind mages walking their sacred pools?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "The tauren look at my imp as if it were plague.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I'll be going.", next = "END" },
      },
      again = {
        { id = "h_again", text = "More questions? I do like a curious mind, while it lasts." },
        { id = "h_again2", text = "Ask what you will, child; the healing waters of the Spirit Rise are patient." },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The tauren say the Pools of Vision show the spirits of their ancestors, and I'll admit some of my samples behave oddly near the water. The dead and the elements are not good neighbors, I find, which is why your elders watch me so closely, and why I smile at them." } },
      choices = {
        { text = "The tauren trusted you here, so repay that with honest work.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever you find down there, keep it from the elders.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "That's true, and I've watched a troll rogue sit so still in the grass that a plainstrider stepped on him. But a hunter is patient so the beast can be honoured, and I'm not sure a rogue is patient for anything but the purse at the end of it." },
      },
      choices = {
        { text = "Patience for its own sake, then. I'll learn that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The purse at the end is reason enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What does the Earth Mother ask of hunters?", next = "mother" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Perhaps, but then the arrow would be the mage's and not the archer's. The Thunderhorns have shot true for generations with nothing but good wood and good eyes, and I'll keep teaching it that way." },
      },
      choices = {
        { text = "Tradition has its strength. I'll respect it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A truer arrow is a truer arrow, whatever moves it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Are you kin to Mull Thunderhorn?", next = "kin" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Holt Thunderhorn, and I teach the hunters of Thunder Bluff. The Thunderhorns have hunted Mulgore since long before the bluffs had bridges." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Your bow has seen use since we last met, hunter. Let me see what you have learned." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman on Hunter Rise? You're welcome here, though my students will want to know if you can call the wind to steady an arrow." },
      },
      choices = {
        { text = "Are you kin to Mull Thunderhorn?", next = "kin" },
        { text = "What does the Earth Mother ask of hunters?", next = "mother" },
        { text = "Can a shaman's wind really steady an arrow, Holt?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A hunter and a rogue both learn patience, Holt.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can magic make an arrow fly truer?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My grandfather swore a shaman did it for him once, on a hunt near the Red Rocks, and he never missed again the rest of that day. I think the spirits helped and I think his own patience helped more, and I've never decided which to thank first." } },
      choices = {
        { text = "Thank the spirits first. They gave him the day.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thank his own eye. The spirits get too much credit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They count, and I'd be a fool to say otherwise, but my warriors are too big to be silent and too proud to be quick. So we stand in front where the enemy can see us, and you can do whatever it is you do behind them." },
      },
      choices = {
        { text = "Standing in front takes courage. I respect that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The enemy you can't see is the one who wins.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why must strength be careful?", next = "careful" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They're trained to fight whatever threatens the herd, and a demon off its leash would qualify. I'll not hide that some of my warriors look at your kind and think of the Burning Blade, so be glad the Warchief speaks for you, warlock." },
      },
      choices = {
        { text = "I'm grateful for his word. I'll keep my demon leashed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't need the Warchief's word to defend myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who do the warriors fight?", next = "fight" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ker Ragetotem, and I train the warriors who guard Thunder Bluff. A tauren's strength is great, so we must learn to use it carefully." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Come for more training, warrior? Good, because the centaur do not rest, and neither should we." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, then. Your strength comes from outside you, so you must learn to carry it even more carefully than a warrior does." },
      },
      choices = {
        { text = "Who do the warriors fight?", next = "fight" },
        { text = "Why must strength be careful?", next = "careful" },
        { text = "Does a shaman need a warrior's training, Ker?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Strength isn't everything. Speed and silence count too.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Are your warriors trained to fight demons?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every shaman who guards the herd stands close enough to be struck, so yes, learn to take a blow. The Grimtotem out in Stonetalon have shamans of their own, and they won't hesitate to turn the earth on our braves." } },
      choices = {
        { text = "I'll learn to stand and take a blow for the herd.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A wise shaman shouldn't be close enough to be hit.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I am a warrior, not an elder. Ask on Elder Rise." } },
  },
}
