-- The War Quarter's trainers and the city's priests: Angela Curthas, Christoph Walker and Baltus Fowler for warriors;
-- Aelthalyste, Father Lazarus and Father Lankester for priests. Voices: bibles/<key>.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Aelthalyste: the priestess who teaches the Forsaken that the Light still answers, and what else does.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_aelthalyste", id = TODO_NPC("Aelthalyste"), name = "Aelthalyste", title = "Priest Trainer",
  bible = "bibles/uc_aelthalyste.md", role = "priest", tier = "quest",
  communities = { "undercity" }, temper = { "calm", "grim" }, values = { "pious", "practical" },
  notices = { "class", "light", "origin" },
  impression = {
    first = "Aelthalyste teaches the Forsaken's priests that the Light still answers the dead, and that it isn't the only thing that answers. She spoke of faith like a widow speaks of a husband who wronged her and whom she still loves.",
    third = "{name} met Aelthalyste, who trains the Forsaken's priests in both the Light and the shadow.",
  },

  greetings = {
    { id = "g_default", text = "Be at peace while you're here. It's in short supply in this city, so I keep a little of it by me." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the candles. Most people who do have something heavier on them than they let on." },
    { id = "g_sister", when = { class = "PRIEST", gender = "female", race = "Scourge" }, text = "Sister. Come in, and tell me whether the Light still finds you, out there in the dark." },
    { id = "g_brother", when = { class = "PRIEST", gender = "male", race = "Scourge" }, text = "Brother. Come in, and tell me whether the Light still finds you, out there in the dark." },
  },

  notice = {
    { id = "n_living_priest", cat = "class", when = { class = "PRIEST", race = "Troll" },
      text = "A troll who prays. Your loa and my Light make strange neighbours, but you'll find I'm a quiet one." },
    { id = "n_chapel", cat = "origin", when = { origin = "forsaken_chapel_priest" },
      text = "You hold your hands the way they taught us in the chapels. Some habits outlive the heart." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Aelthalyste, and I teach the priests of the Forsaken. The Light abandoned us to the plague, many say, and yet when I call it, it still comes, and I've spent my second life trying to understand why." },
        { id = "h_notpriest", when = { ["not"] = { class = "PRIEST" } }, text = "You're no priest, but you're welcome to sit. The dead come here to remember they were people once, and the living sometimes come to see whether we were." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin among the Forsaken. The Light keeps stranger company than the Church ever let it, and you're the proof." },
      },
      again = {
        { id = "h_again", text = "Ask what you came to ask. There's no shame here that hasn't already been confessed by someone worse." },
        { id = "h_again2", text = "Something more? The candles have plenty of wax left." },
        { id = "h_again3", when = { class = "PRIEST" }, text = "Go on, priest. We've time, and little else." },
      },
      choices = {
        { text = "Why would the Light answer the dead?", next = "light" },
        { text = "You teach shadow as well, don't you?", next = "shadow" },
        { text = "What do you make of the Scarlet Crusade?", next = "scarlets" },
        { text = "I served in a chapel, before.", next = "chapel", when = { origin = "forsaken_chapel_priest" } },
        { text = "Does my faith still matter here?", next = "living", when = { class = "PRIEST", race = "Troll" } },
        { text = "I'm ready to learn.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Peace to you.", next = "END" },
      },
    },

    light = {
      lines = { { id = "li_default", text = "Perhaps it answers will, not worth, and we have more will than most, since we've already been through the worst. Or perhaps it never cared who called, and only the Church cared, and the Church is ash now." } },
      choices = {
        { text = "Which do you believe?", next = "light_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_believe = {
      lines = { { id = "lb_default", text = "On good nights, I believe it forgives us. On the other nights I believe it's a fire, and fire doesn't forgive, it simply burns for whoever feeds it." } },
      choices = {
        { text = "And which is tonight?", next = "light_tonight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_tonight = {
      big = true,
      lines = {
        { id = "lt_default", text = "Tonight it's a fire, and I'm content with that, because a fire can still keep people warm. I've stopped needing the Light to love me, and I find I pray better for it." },
        { id = "lt_paladin", when = { class = "PALADIN" }, text = "Tonight it's a fire, and you carry it on your shield, so tell me, does it feel like love to you, or only like heat? I've stopped needing it to love me, and I find I pray better for it." },
      },
      choices = {
        { text = "The Light is mercy, whatever the Church made of it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's a tool, and tools don't care who holds them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shadow = {
      lines = { { id = "sh_default", text = "Of course. The shadow is the other side of the same coin, and our priests learn both, because the Scourge doesn't wait for us to settle our theology. The Devouring Plague we teach is the Lich King's own sickness turned back against his servants." } },
      choices = {
        { text = "Using the plague doesn't trouble you?", next = "shadow_plague" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_plague = {
      big = true,
      lines = { { id = "sp_default", text = "It troubles me every time, and I teach it anyway. It was done to us first, and I see a kind of justice in handing it back to the ones who spread it, though I'd rather not look at that justice too closely." } },
      choices = {
        { text = "They earned it. Give it back twice over.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "A weapon like that should stay a last resort.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    scarlets = {
      lines = { { id = "sc_default", text = "They are what I would have become, if the plague had passed me by. I see their priests at the Monastery shouting the same prayers I once said, and they'd burn me for saying them now." } },
      choices = {
        { text = "Do you pity them?", next = "scarlets_pity" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scarlets_pity = {
      lines = { { id = "sp2_default", text = "I pity the frightened ones, the farmers they've armed and told to hate. The ones in red at the top, who know exactly what they're doing, I leave to the Deathstalkers, and I don't pray for them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Peace to you, Aelthalyste.", next = "END" },
      },
    },

    chapel = {
      lines = { { id = "ch_default", text = "Then you remember the bells at evening, and the smell of wax and wet wool. I won't ask which chapel, since some of them are Scarlet now, and some of them are only ash, and neither answer is worth saying aloud." } },
      choices = {
        { text = "I still say the old prayers.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "I've left those prayers behind.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    living = {
      lines = { { id = "lv_default", text = "Faith matters wherever it's carried, and you carry yours a long way from the jungle to come down here. The Dark Lady's people need healers more than they'll ever admit, and they'll accept one with tusks if it keeps them standing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I lit candles in a chapel once, and now I light them here. The walls are different and the prayers are harder, but the candles are the same." } },
    advice = { { id = "tp_ad", text = "Pray even when you don't believe. The Light doesn't seem to mind, and neither will you, in time." } },
    _none = { { id = "tp_none", text = "I don't know, child. I only know what comes when I call it." } },
  },
}

---------------------------------------------------------------------------
-- Father Lazarus: priest trainer, wry about his name.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_lazarus", id = TODO_NPC("Father Lazarus"), name = "Father Lazarus", title = "Priest Trainer",
  bible = "bibles/uc_lazarus.md", role = "priest", tier = "service",
  communities = { "undercity" }, temper = { "dry", "warm" }, values = { "pious" },
  notices = { "class" },
  impression = {
    first = "Father Lazarus trains priests in the Undercity and has heard every joke about his name, mostly from himself. He wears his old Church collar under his robe, frayed through.",
    third = "{name} met Father Lazarus, a priest trainer of the Undercity with a dry joke about his name.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in. I'd offer you a seat, but the last one fell apart, rather like the congregation." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you're back. Good; I'd hoped I hadn't scared you off." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A fellow priest. Tell me you've found somewhere above ground where people still listen to us." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Father Lazarus, and yes, I know. My mother named me Lazarus long before the plague, and you'd think I'd have taken the hint and stayed buried." },
        { id = "h_living", when = { race = { "Orc", "Tauren", "Troll" } }, text = "One of the Warchief's people, down in our crypts. You're welcome here, though I'm afraid the hymns are rather mournful for living ears." },
      },
      again = {
        { id = "h_again", text = "Another question? Ask, and I'll try to answer before I lose another finger." },
      },
      choices = {
        { text = "Do you still believe, Father?", next = "believe" },
        { text = "Do you keep anything from your old church, Father?", next = "collar" },
        { text = "Train me, Father.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Goodbye, Father.", next = "END" },
      },
    },
    believe = {
      lines = { { id = "be_default", text = "I believe in what I can still do, which is mend the hurt and see off the Scourge. Whether that's faith or stubbornness, I've stopped trying to tell the two apart." } },
      choices = {
        { text = "Faith is the stubbornness that matters.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Stubbornness, Father. Faith had its chance.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    collar = {
      lines = { { id = "co_default", text = "From a parish church in the capital, the one with the green door, though the door's gone now. I wear it under the robe, where the Dark Lady's people won't see it and the Light, perhaps, still can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm afraid I'd only be guessing, and I gave up guessing about the same time I gave up breathing." } },
  },
}

---------------------------------------------------------------------------
-- Father Lankester: priest trainer, stern and sermonising.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_lankester", id = TODO_NPC("Father Lankester"), name = "Father Lankester", title = "Priest Trainer",
  bible = "bibles/uc_lankester.md", role = "priest", tier = "service",
  communities = { "undercity" }, temper = { "stern", "proud" }, values = { "pious", "loyal" },
  notices = { "class" },
  impression = {
    first = "Father Lankester preaches to the Forsaken as if he were still in a pulpit and the plague had only interrupted his sermon. He is certain the Light chose the Dark Lady's people, and certain of very little else.",
    third = "{name} met Father Lankester, a stern priest trainer of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Stand straight. The Light is watching, and it is not impressed by slouching." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good. Constancy is the beginning of virtue." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Keep your hands where I can see them, rogue. This is a place of prayer, not a pocket to be picked." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Father Lankester. I teach the Light to the Forsaken who are worthy of it, and I say to anyone who'll listen that we were not cast out of it, but tested." },
        { id = "h_scourge", when = { race = "Scourge", class = "PRIEST" }, text = "A priest of our people. Hold your head up; the Scarlets call us abominations, but the Light still answers us, and it does not answer them any louder." },
      },
      again = {
        { id = "h_again", text = "Speak. I have a sermon to finish, but it will keep." },
      },
      choices = {
        { text = "Tested? By the plague?", next = "tested" },
        { text = "What do you think of the Dark Lady?", next = "lady" },
        { text = "Train me, Father.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Good day, Father.", next = "END" },
      },
    },
    tested = {
      lines = { { id = "te_default", text = "By the plague, by the Lich King's chains, and now by the hatred of the living. Every trial strips away something we didn't need, and what remains is purer for it." } },
      choices = {
        { text = "Suffering has a purpose. I believe that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Suffering is just suffering, Father.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lady = {
      lines = { { id = "la_default", text = "She broke the chains on our minds when no priest and no king could, and that is a kind of miracle whether she calls it one or not. I pray for her every evening, though I suspect she would find that amusing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That is not a matter of faith, and so not a matter for me." } },
  },
}

---------------------------------------------------------------------------
-- Angela Curthas: warrior trainer, a former shieldmaiden of the city watch.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_curthas", id = TODO_NPC("Angela Curthas"), name = "Angela Curthas", title = "Warrior Trainer",
  bible = "bibles/uc_curthas.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "blunt", "warm" }, values = { "brave" },
  notices = { "class", "gear" },
  impression = {
    first = "Angela Curthas trains warriors in the War Quarter and inspects your shield before your face. She was city watch in life and still talks about holding a gate as if she'd just come off shift.",
    third = "{name} met Angela Curthas, a warrior trainer in the Undercity who once stood watch in the capital.",
  },

  greetings = {
    { id = "g_default", text = "Shield up, chin down. Now, what do you want?" },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, I see, or still something, at any rate. Good." },
    { id = "g_woman", when = { gender = "female", class = "WARRIOR" }, text = "Another woman with a sword. Good; the watch never had enough of us, and the Scourge never once asked to see my papers." },
  },

  notice = {
    { id = "n_war", cat = "gear", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "Your armour's hanging off you in strips. Get it mended before you come to me, or you'll learn my lessons the hard way." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Angela Curthas. I teach warriors in the War Quarter, and before that I held the palace gate for the city watch, which is to say I've been fighting in this same city for longer than most of you have been dead." },
        { id = "h_orc", when = { race = "Orc", class = "WARRIOR" }, text = "An orc warrior, come for lessons from a dead woman. I'll teach you what I know, and you can teach me how you lot hit so hard." },
      },
      again = {
        { id = "h_again", text = "Something else? Quick, I've a recruit out there holding his shield upside down." },
      },
      choices = {
        { text = "You held a gate here, in life?", next = "gate" },
        { text = "What makes a good warrior?", next = "good" },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "I'll go.", next = "END" },
      },
    },
    gate = {
      lines = { { id = "ga_default", text = "When the plague reached the capital, we held the gate for two days against our own neighbours, who'd come back wrong. On the third day the gate held, and I didn't, and I woke up years later on the other side of it." } },
      choices = {
        { text = "That's a hard way to lose a post.", next = "gate_lose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate_lose = {
      lines = { { id = "gl_default", text = "I don't count it lost, because I'm back at it, in a manner of speaking, and the same enemy's on the other side. That's more than most watchmen ever get, a second shift." } },
      choices = {
        { text = "Then hold the line this time.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget the line. Take the fight to them.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    good = {
      lines = { { id = "go_default", text = "Knowing when to stand and when to step aside, and never confusing the two. Any fool can swing a sword, but it takes a warrior to know which fight is hers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Never heard of it. Ask someone who reads." } },
  },
}

---------------------------------------------------------------------------
-- Christoph Walker: warrior trainer, a quiet veteran of the Second War.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_cwalker", id = TODO_NPC("Christoph Walker"), name = "Christoph Walker", title = "Warrior Trainer",
  bible = "bibles/uc_cwalker.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "calm", "grim" }, values = { "honest" },
  notices = { "race" },
  impression = {
    first = "Christoph Walker fought orcs in the Second War and now teaches them swordplay in the War Quarter. He finds this funnier than he lets on, and he lets on very little.",
    third = "{name} met Christoph Walker, a warrior trainer in the Undercity who fought the Horde in the Second War.",
  },

  greetings = {
    { id = "g_default", text = "You've a question, or you'd not be standing there. Ask it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Sit down; my legs aren't what they were, and they were never much." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "I fought your people at Hillsbrad, in the Second War. You'll forgive me if my shoulder twitches." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Christoph Walker. I teach the blade in the War Quarter, and I learned it in Lordaeron's army back when the orcs were the enemy, which is a thing I try not to mention in front of the orcs." },
      },
      again = {
        { id = "h_again", text = "Something more? I've time, if not much patience." },
      },
      choices = {
        { text = "You fought the orcs?", next = "orcs" },
        { text = "What's the first thing you teach?", next = "first" },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    orcs = {
      lines = {
        { id = "or_default", text = "At Hillsbrad and at Thoradin's Wall, as a pikeman, and I hated them with my whole heart. Now they're the only people above ground who'll trade with us, and I've learned that hatred keeps less well than salt pork." },
        { id = "or_orc", when = { race = "Orc" }, text = "Your people, yes, at Hillsbrad and at Thoradin's Wall, and I hated them with my whole heart. Now you're the only living folk who'll trade with us, and I've learned that hatred keeps less well than salt pork." },
      },
      choices = {
        { text = "Old enemies can learn to stand together.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Alliances of need last only as long as the need.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "fi_default", text = "How to fall, and how to get up again. The dead get up more easily than the living, but they fall just the same, and I'd rather they did it on purpose." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you. I was a pikeman, not a scholar." } },
  },
}

---------------------------------------------------------------------------
-- Baltus Fowler: warrior trainer, loud and cheerful.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_fowler", id = TODO_NPC("Baltus Fowler"), name = "Baltus Fowler", title = "Warrior Trainer",
  bible = "bibles/uc_fowler.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "loud", "cheerful" }, values = { "brave" },
  notices = { "class" },
  impression = {
    first = "Baltus Fowler is the loudest corpse in the War Quarter and seems delighted about it. He treats every lesson as a tavern brawl he's slightly too fond of.",
    third = "{name} met Baltus Fowler, a boisterous warrior trainer in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Ha! Another one! Come here and let's see if you can take a punch." },
    { id = "g_back", when = { metBefore = true }, text = "There you are! I was telling the lads about you just yesterday, though I may have exaggerated." },
  },

  notice = {
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "WARRIOR" },
      text = "Light's mercy, look at the size of you! You could carry me home under one arm, and some nights I'd let you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Baltus Fowler! I teach warriors to hit things, and I'm very good at it, because I've been hit by everything in Lordaeron and some of it twice." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "A spellcaster, in the War Quarter? You're braver than you look, or lost, and either way, welcome!" },
      },
      again = {
        { id = "h_again", text = "More questions? Ask away, I love a chat between bruises." },
      },
      choices = {
        { text = "What was the worst thing that ever hit you?", next = "worst" },
        { text = "Why are you so cheerful?", next = "cheer" },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Farewell, Baltus.", next = "END" },
      },
    },
    worst = {
      lines = { { id = "wo_default", text = "An abomination outside Brill, the first winter after we woke up, swinging a meat hook the size of a door. I took it on the shield and flew twenty feet into a pumpkin patch, and I laughed so hard I couldn't get up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cheer = {
      lines = { { id = "ch_default", text = "Because I was dead, mate, properly dead, and now I'm not, and I can still swing a sword! Everybody down here's so gloomy about it, and I can't see why." } },
      choices = {
        { text = "You're right. Every day is a gift.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some of us remember what we lost, Baltus.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea! But if you find out, come and tell me, and we'll drink to it." } },
  },
}
