-- Blackrock Depths: the Dark Iron city under the mountain. Lokhtos Darkbargainer trades for the
-- Thorium Brotherhood, Kharan Mighthammer and Marshal Windsor sit in the Detention Block with
-- Commander Gor'shak, and the ghost of Franclorn Forgewright mourns over his own tomb.
-- Voices: bibles/dg_lokhtos.md, bibles/dg_kharan.md, bibles/dg_windsor.md, bibles/dg_gorshak.md, bibles/dg_franclorn.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Lokhtos Darkbargainer: the Thorium Brotherhood's dealer in the Grim Guzzler.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_lokhtos", id = TODO_NPC("Lokhtos Darkbargainer"), name = "Lokhtos Darkbargainer",
  title = "The Thorium Brotherhood", bible = "bibles/dg_lokhtos.md", role = "quartermaster", tier = "quest",
  temper = { "shrewd", "gruff" }, values = { "practical", "loyal" },
  notices = { "craft", "race" },
  impression = {
    first = "A Dark Iron who trades with outsiders and doesn't care who sees it.",
    third = "{name} did business with Lokhtos Darkbargainer, the Thorium Brotherhood's man in the Grim Guzzler.",
  },

  greetings = {
    { id = "g_default", text = "Keep yer voice down, outsider. The Brotherhood does its trading here because the Emperor's guards are too busy drinking to notice." },
    { id = "g_contract", when = { questActive = TODO_QUEST("A Binding Contract") }, text = "Ye've a contract to bind, have ye? Bring me the thorium and the Brotherhood will hold to its word, as it always does." },
    { id = "g_back", when = { metBefore = true }, text = "Back again with dark iron on yer hands, I hope. Talk's cheap down here, but ore isn't." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing" } },
      text = "A smith, eh? Then ye'll want what's in my ledger, and ye'll know it's worth every core of fire it costs." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard in the Guzzler. Mind yer beard, lad, because half the room would trade it for a round." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lokhtos Darkbargainer, of the Thorium Brotherhood. We're the Dark Irons who'd sooner work the forge than kneel to Thaurissan's ghost or the fire lord he woke." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Aye, I know what ye think of my kin, and ye've the right to think it. But the Brotherhood isn't the Emperor, and our hammers don't answer to him." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, the bouncers are watching." },
        { id = "h_again2", text = "Go on, I'm listening, though not for free forever." },
      },
      choices = {
        { text = "Who are the Thorium Brotherhood?", next = "brotherhood" },
        { text = "You trade under the Emperor's nose.", next = "nose" },
        { text = "What does the Brotherhood want with fiery cores?", next = "cores" },
        { text = "Tell me about the plans you sell.", next = "plans", when = { profession = { "Blacksmithing" } } },
        { text = "What do you have for trade?", next = "BUSINESS" },
        { text = "I'll leave you to your bargains.", next = "END" },
      },
    },
    brotherhood = {
      lines = { { id = "b_default", text = "Smiths, mostly, who walked out of the Emperor's forges when the fire lord's servants started giving the orders. Our brothers keep Thorium Point up on the Searing Gorge cliffs, and I keep the cellar door open for them down here." } },
      choices = {
        { text = "Why turn on your own people?", next = "turn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    turn = {
      lines = { { id = "t_default", text = "Because my own people are slaves to Ragnaros and don't know it. Thaurissan called the Firelord up three hundred years ago and was burned to ash for it, and we've served the fire that ate him ever since." } },
      choices = {
        { text = "Then your people deserve to be freed.", next = "BACK", reply = "Freed, aye, though I'd settle for awake. If outsiders are what it takes to break the Firelord's grip, I'll sell to outsiders and sleep fine.", fx = { align = { light = 1 }, learn = { "thorium_brotherhood" } } },
        { text = "Your people chose the fire. Let them burn.", next = "BACK", reply = "Hard words, and ye're not wrong that we chose it once. But my grandsire didn't choose, and neither did the children born in this city since.", fx = { align = { light = -1 }, affinity = -1, learn = { "thorium_brotherhood" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "thorium_brotherhood" } } },
      },
    },
    nose = {
      lines = { { id = "no_default", text = "Plugger Spazzring runs this bar, and Plugger cares about coin and thunderbrew, in that order. As long as the taps run, nobody asks why Lokhtos sits in the corner with a ledger." } },
      choices = {
        { text = "And if the Emperor learns of it?", next = "learns" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learns = {
      lines = { { id = "le_default", text = "Then I'll be a cinder in the Grim Guzzler's fireplace by morning. Every Brother takes that bet, outsider, so don't go boasting about where ye bought yer plans." } },
      choices = {
        { text = "Your secret is safe with me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cores = {
      lines = { { id = "c_default", text = "Fiery cores and lava cores come out of the Firelord's own hall, from the creatures that serve him. Hand them to the Brotherhood and ye prove whose side ye're on, and that's worth more to us than any coin." } },
      choices = {
        { text = "So the Brotherhood buys loyalty.", next = "BACK", reply = "We buy proof, which is rarer. Loyalty is what ye call it after the proof's been piling up a while.", fx = { align = { order = 1 } } },
        { text = "I'll fight Ragnaros for my own reasons.", next = "BACK", reply = "Good, keep them. The Brotherhood doesn't care why ye swing, only that ye're swinging at the right thing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plans = {
      lines = { { id = "p_default", text = "Dark iron plate, fiery weapons, things no Bronzebeard forge has seen in three hundred years. The Brotherhood shares them only with smiths who've earned our trust, so earn it." } },
      choices = {
        { text = "I intend to.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    ragnaros = { { id = "tp_rag", text = "The Firelord sleeps below us in the Molten Core, and every Dark Iron in this city works for him whether they know it or not." } },
    _none = { { id = "tp_none", text = "I sell plans, not gossip. Ask someone with fewer guards watching him." } },
  },
}

---------------------------------------------------------------------------
-- Kharan Mighthammer: Bronzebeard prisoner in the Detention Block, who knows Dagran's fate.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_kharan", id = TODO_NPC("Kharan Mighthammer"), name = "Kharan Mighthammer",
  bible = "bibles/dg_kharan.md", role = "questgiver", tier = "quest",
  temper = { "weary", "proud" }, values = { "loyal", "honest" },
  notices = { "race", "faction" },
  impression = {
    first = "A Bronzebeard worn thin by the cells, carrying a tale he dreads to tell.",
    third = "{name} found Kharan Mighthammer chained in the Detention Block of Blackrock Depths.",
  },

  greetings = {
    { id = "g_default", text = "Another face that isn't a Dark Iron jailer. Thank the stone for small mercies, friend." },
    { id = "g_tale", when = { questActive = TODO_QUEST("Kharan's Tale") }, text = "Ye've come for the tale, then. Sit, if ye can find a dry patch, because it isn't a short one." },
    { id = "g_news", when = { questActive = TODO_QUEST("The Bearer of Bad News") }, text = "Ye're carrying my tale to Ironforge, aren't ye? Tell Magni gently, if there's any way to tell a king such a thing gently." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard! I'd stand up and clasp yer arm, {g:lad|lass}, if these chains reached that far." },
    { id = "n_horde", cat = "faction", when = { faction = "Horde" },
      text = "Horde, are ye? Well, I've less quarrel with ye than with the ones who locked this door." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kharan Mighthammer, sent by King Magni himself to find his daughter. I found her, aye, and the Dark Irons found me, and I've been rotting here ever since." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Bearer of Bad News") }, text = "So the king knows now. I've dreaded that day longer than I've sat in this cell, and I'm glad it was ye who carried it and not some herald." },
      },
      again = {
        { id = "h_again", text = "Ask what ye like. I've nothing but time down here." },
        { id = "h_again2", text = "What else, friend?" },
      },
      choices = {
        { text = "What happened to Princess Moira?", next = "moira" },
        { text = "How did you end up in this cell?", next = "cell" },
        { text = "The Dark Irons keep a good prison.", next = "prison" },
        { text = "What do you need from me?", next = "BUSINESS" },
        { text = "Stay strong. I'll be back.", next = "END" },
      },
    },
    moira = {
      lines = { { id = "m_default", text = "Taken by Dagran Thaurissan, the Emperor himself, and the court calls it a kidnapping. But I saw her in the throne room, friend, and she wasn't in chains, and she called him husband." } },
      choices = {
        { text = "Bewitched, surely.", next = "bewitched" },
        { text = "Maybe she chose him.", next = "chose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bewitched = {
      lines = { { id = "bw_default", text = "That's what I keep telling myself, and the king will tell himself the same. Thaurissan has sorcery enough, and the fire lord's priests have more, so it may well be true." } },
      choices = {
        { text = "Then she must be rescued, whatever she says.", next = "BACK", reply = "Aye, that's the king's heart talking, and mine too. I only pray the rescue doesn't break what's left of her.", fx = { align = { order = 1 } } },
        { text = "If she's free in her mind, let her choose.", next = "BACK", reply = "Ye'd say that in a tavern, but say it to a father and see where it gets ye. Still, I've wondered it myself in the dark.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    chose = {
      lines = { { id = "ch_default", text = "Bite yer tongue in front of a Bronzebeard. Though I'll own she had a proud stubborn streak, and a princess with nothing to do but be married off might listen to a crowned Emperor's sweet words." } },
      choices = {
        { text = "That would break Magni's heart.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cell = {
      lines = { { id = "c_default", text = "I got too close to the throne room, and a squad of the Emperor's guard got closer to me. They've kept me alive because a king's messenger might be worth ransom someday, and the day never comes." } },
      choices = {
        { text = "Others are locked up here too.", next = "others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "A Stormwind marshal named Windsor sits a few cells down, and an orc commander called Gor'shak shouts at the guards every morning. I've had worse neighbours in Ironforge, truth be told." } },
      choices = {
        { text = "I'll see what I can do for them.", next = "BACK", fx = { affinity = 1, learn = { "detention_block" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "detention_block" } } },
      },
    },
    prison = {
      lines = { { id = "pr_default", text = "Good enough to keep a Mighthammer in it, and that's saying something. Still, every lock has a key, and Dark Iron jailers drink at the Grim Guzzler like everybody else." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    moira = { { id = "tp_moira", text = "The king's only daughter, and the Emperor's wife now, gods help us all.", next = "moira" } },
    _none = { { id = "tp_none", text = "I've been in a cell for longer than I care to count. Whatever ye're asking about, I've likely missed it." } },
  },
}

---------------------------------------------------------------------------
-- Marshal Windsor: the Stormwind marshal held in the Detention Block, waiting on his escape.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_windsor", id = TODO_NPC("Marshal Windsor"), name = "Marshal Windsor",
  bible = "bibles/dg_windsor.md", role = "escort", tier = "quest",
  temper = { "stern", "dutiful" }, values = { "loyal", "brave" },
  notices = { "faction", "class" },
  impression = {
    first = "A soldier of Stormwind still standing straight in a Dark Iron cell.",
    third = "{name} found Marshal Windsor imprisoned in Blackrock Depths.",
  },

  greetings = {
    { id = "g_default", text = "Stand easy, {class}. If you've come through all that to reach this cell, you're the best news I've had in months." },
    { id = "g_break", when = { questActive = TODO_QUEST("Jail Break!") }, text = "Is it time? Then get this door open and keep close, because the Dark Irons won't let us walk out of here politely." },
  },

  notice = {
    { id = "n_ally", cat = "faction", when = { faction = "Alliance" },
      text = "Alliance colours. Light be praised, Morgan's Vigil hasn't forgotten me after all." },
    { id = "n_horde", cat = "faction", when = { faction = "Horde" },
      text = "A Horde soldier. Strange days, when I'm glad to see one of you on this side of a Dark Iron door." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Marshal Windsor, of Stormwind. I came into these mountains to learn what the Dark Irons and the Blackrock orcs were planning together, and I learned more than they could let me carry home." },
      },
      again = {
        { id = "h_again", text = "What else? We may not have long before the guards come round." },
        { id = "h_again2", text = "Speak quickly, soldier." },
      },
      choices = {
        { text = "What did you learn?", next = "learned" },
        { text = "Who betrayed you?", next = "betrayed" },
        { text = "You look well for a prisoner.", next = "well" },
        { text = "Let's get you out of here.", next = "BUSINESS" },
        { text = "Hold on a little longer.", next = "END" },
      },
    },
    learned = {
      lines = { { id = "l_default", text = "That the black dragonflight has its claws in both of them. Rend Blackhand sits in the Spire above, and a dragon in a nobleman's guise has been whispering in Stormwind's own court, though nobody believed me when I said so." } },
      choices = {
        { text = "A dragon in the court? That's madness.", next = "court" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court = {
      lines = { { id = "c_default", text = "Madness is what they called it. But I've seen the documents the Dark Irons kept, and the plan to take Stormwind from within runs straight back to Blackrock Spire and the dragons that rule it." } },
      choices = {
        { text = "Then the court must be purged.", next = "BACK", reply = "Purged is a hard word, but it may come to that. Carry the truth home before the lady in question learns we know.", fx = { align = { order = 1 }, learn = { "black_dragonflight" } } },
        { text = "Stormwind's nobles made their own mess.", next = "BACK", reply = "They did, and Westfall still pays for it. But no noble deserves a dragon at his ear, and the realm deserves it least of all.", fx = { align = { order = -1 }, learn = { "black_dragonflight" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "black_dragonflight" } } },
      },
    },
    betrayed = {
      lines = { { id = "b_default", text = "Nobody, which is the shame of it. I was careless on the road past the Burning Steppes, and a Dark Iron patrol was less careless than I." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    well = {
      lines = { { id = "w_default", text = "A Stormwind marshal keeps his back straight, even on Dark Iron gruel. Talk to the dwarf Kharan down the row if you want to see what years of this do to a man." } },
      choices = {
        { text = "You'll be home soon.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I've been in a cell, soldier. Ask me again when I've had a decent meal and a report on my desk." } },
  },
}

---------------------------------------------------------------------------
-- Commander Gor'shak: an orc commander held in the Detention Block, sent by Thrall.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_gorshak", id = TODO_NPC("Commander Gor'shak"), name = "Commander Gor'shak",
  bible = "bibles/dg_gorshak.md", role = "escort", tier = "quest",
  temper = { "fierce", "blunt" }, values = { "honorable", "loyal" },
  notices = { "faction", "race" },
  impression = {
    first = "An orc commander who rattles his chains like a war drum.",
    third = "{name} found Commander Gor'shak imprisoned in Blackrock Depths.",
  },

  greetings = {
    { id = "g_default", text = "You are no Dark Iron, or I would already be at your throat. Speak, stranger." },
    { id = "g_going", when = { questActive = TODO_QUEST("What Is Going On?") }, text = "The warchief's word reached you, then. Good. Open this cell and stand with me when the Dark Irons come." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "A brother of the Horde! Lok'tar, warrior, though I wish we met in better halls than these." },
    { id = "n_ally", cat = "faction", when = { faction = "Alliance" },
      text = "Alliance, here? Then the Dark Irons have made enemies of everyone, and that, at least, pleases me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Gor'shak, commander in the warchief's service. Thrall sent me to learn what the Dark Irons plan in this mountain, and they have given me a cell instead of answers." },
      },
      again = {
        { id = "h_again", text = "What more? Speak plainly." },
        { id = "h_again2", text = "Ask, then. My patience wears thinner than these bars." },
      },
      choices = {
        { text = "Why does Thrall care about the Dark Irons?", next = "thrall" },
        { text = "You share a mountain with Rend Blackhand.", next = "rend" },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Be patient, commander.", next = "END" },
      },
    },
    thrall = {
      lines = { { id = "t_default", text = "Because the Dark Irons stand shoulder to shoulder with Rend, and Rend calls himself warchief of a Horde that turned its back on Thrall. What grows in this mountain will one day march on Orgrimmar." } },
      choices = {
        { text = "The Horde must strike first.", next = "BACK", reply = "Spoken like an orc of the old Horde, and I would not stop you. But strike wisely, because this mountain has swallowed bigger armies than ours.", fx = { align = { order = -1 } } },
        { text = "Learn their plans before shedding blood.", next = "BACK", reply = "That is the warchief's way, and that is why he sent a scout and not a warband. Still, my axe grows restless while I wait.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rend = {
      lines = { { id = "r_default", text = "Rend and his brother Maim hold the Spire above us with the dragons as their masters. They call themselves the true Horde, yet they bow to a black wyrm, and there is no shame deeper than that." } },
      choices = {
        { text = "The Blackrock clan was always proud.", next = "proud" },
        { text = "Something else.", next = "BACK" },
      },
    },
    proud = {
      lines = { { id = "p_default", text = "Proud, and drunk on demon blood longer than any clan. Blackhand led the Horde once, and his sons would sell what's left of it to any master who promises them a crown." } },
      choices = {
        { text = "Their day will come.", next = "BACK", fx = { affinity = 1, learn = { "rend_blackhand" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "rend_blackhand" } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I know battle and I know this cell. Of that, I know nothing." } },
  },
}

---------------------------------------------------------------------------
-- Franclorn Forgewright: Dark Iron ghost who built the city, mourning at his own tomb.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_franclorn", id = TODO_NPC("Franclorn Forgewright"), name = "Franclorn Forgewright",
  bible = "bibles/dg_franclorn.md", role = "questgiver", tier = "quest",
  temper = { "sorrowful", "proud" }, values = { "creative", "repentant" },
  notices = { "race", "craft" },
  impression = {
    first = "A ghost who built the city that killed him, and cannot stop grieving for it.",
    third = "{name} spoke with the ghost of Franclorn Forgewright in Blackrock Depths.",
  },

  greetings = {
    { id = "g_default", text = "You can see me? Then hear me, mortal, before the forges drown out an old ghost's voice." },
    { id = "g_legacy", when = { questActive = TODO_QUEST("Dark Iron Legacy") }, text = "Ironfoe still hangs beneath the Golem Lord's hand, and my key with it. Bring it back to the dark, and my work will not be wasted." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Bronzebeard or Wildhammer, it hardly matters to a ghost. We were all one clan before the war, and I remember it." },
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Engineering" } },
      text = "Your hands are scarred by the forge. Look around you, smith, and see what my hands made before the fire took them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Franclorn Forgewright, who carved Shadowforge City for Thaurissan the Emperor. My bones lie in this statue's shadow, and my spirit lingers because the work was never finished." },
      },
      again = {
        { id = "h_again", text = "What more would you ask of the dead?" },
        { id = "h_again2", text = "Ask, while the forge-roar lets me speak." },
      },
      choices = {
        { text = "You built this whole city?", next = "built" },
        { text = "What happened when Ragnaros woke?", next = "cataclysm" },
        { text = "Your own people keep this place now.", next = "people" },
        { text = "What would you have me do?", next = "BUSINESS" },
        { text = "Rest easy, spirit.", next = "END" },
      },
    },
    built = {
      lines = { { id = "b_default", text = "The halls, the vaults, the Black Anvil and the great gate, all from my plans. I gave the Emperor a city fit for a god, and the god he summoned burned it from the inside." } },
      choices = {
        { text = "That is a craftsman's pride.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cataclysm = {
      lines = { { id = "c_default", text = "Thaurissan meant to call an elemental slave to win the war against Ironforge, and instead he called its master. The mountain split, the land around it turned to ash, and my people have bent the knee to fire ever since." } },
      choices = {
        { text = "Thaurissan doomed his own people.", next = "doom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    doom = {
      lines = { { id = "d_default", text = "He did, and I helped him build the throne he did it from. A ghost has a long time to think about such things." } },
      choices = {
        { text = "You only built. The sin was his.", next = "BACK", reply = "Kind words, and I would like to believe them. But a builder who never asks what the hall is for is not innocent, only careless.", fx = { align = { light = 1 } } },
        { text = "Then you share his guilt.", next = "BACK", reply = "Yes, and so I linger. Perhaps when the key returns to the dark and my people are free, I will be allowed to sleep.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    people = {
      lines = { { id = "p_default", text = "They keep it as slaves keep a master's house. Some of them, the Thorium Brotherhood, have begun to remember they are smiths first, and that gives an old ghost hope." } },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "thorium_brotherhood" } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "The living world has moved on without me, mortal. I know only stone and fire and regret." } },
  },
}
