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
    { id = "dp_rep_tb_h", when = { rep = { faction = "Thorium Brotherhood", min = "Honored" } }, text = "Honoured by the Brotherhood, are you? Then perhaps we can do some real business, friend." },
    { id = "dp_rep_tb_e", when = { rep = { faction = "Thorium Brotherhood", min = "Exalted" } }, text = "Exalted among the Brotherhood! I've a few things in my pack that I don't show just anyone." },
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

    lk_bar = {
      lines = { { id = "lkb_1", text = "Strange is the kindest word for it. Ye've Private Rocknot, who'd drink the barrels dry if Plugger let him, a goblin called Ribbly hidin' from his own family, and the Emperor's guards, who come in for the thunderbrew an' leave wi' no memory o' the evening." } },
      choices = {
        { text = "Why is Ribbly hiding from his family?", next = "lk_bar2" },
        { text = "Drunk guards make poor watchmen. Clever of you.", next = "lk_bar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lk_bar2 = {
      lines = { { id = "lkb2_1", text = "Ask him yerself, if ye want an earful; it's a goblin matter, which means money an' a grudge. What matters tae me is the noise, because nobody hears a bargain bein' struck in a room where Rocknot's singin'." } },
      choices = {
        { text = "Then here's to Rocknot's singing.", next = "BACK", reply = "Aye, though ye'll no' say that once ye've heard it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    lk_start = {
      lines = { { id = "lks_1", text = "Bring me the residue the Emperor's own folk leave behind, the black grit that clings tae every Dark Iron who works the forges here. Gather enough of it an' I'll put yer name in the ledger, an' that's the first step on a long stair." } },
      choices = {
        { text = "Why does a bit of grit prove anything?", next = "lk_start2" },
        { text = "My clan won't forget what your Emperor did.", next = "lk_start2", when = { race = "Dwarf" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lk_start2 = {
      lines = { { id = "lks2_1", text = "Because ye only get it by fightin' the Emperor's folk, an' that's a thing nobody does by accident. As for grudges, Bronzebeard, the Brotherhood remembers the War o' the Three Hammers as well as ye do; we only want the next three hundred years tae go better." } },
      choices = {
        { text = "Then the grit's a good place to start.", next = "BACK", reply = "It is. Mind ye bring it in a sack, not yer pockets; it stains." },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "The Guzzler has a strange crowd for a hideout.", next = "lk_bar" },
        { text = "How does an outsider start with the Brotherhood?", next = "lk_start" },
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
    { id = "dp_rep_tb_f", when = { rep = { faction = "Thorium Brotherhood", min = "Friendly" } }, text = "The Thorium Brotherhood speaks for you, I hear. They've no love for the Dark Irons in this city, and neither do I." },
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
        { text = "Ironforge still asks after you, Kharan.", next = "ironforge", when = { race = "Dwarf" } },
        { text = "Why would a Bronzebeard talk to the Horde?", next = "horde", when = { faction = "Horde" } },
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
        { text = "So the keys are in a tavern?", next = "keys" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keys = {
      lines = { { id = "k_default", text = "The jailers carry them, and the jailers carry them to the Guzzler when their shift ends, so ye can work out the rest. Mind the bouncers, though, because Plugger Spazzring doesn't take kindly to brawls he hasn't started himself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ironforge = {
      lines = { { id = "if_default", text = "Does it, now? I'd have thought they'd carved my name on a memorial stone and gone back to their ale. Tell me true, {g:lad|lass}, how's the king bearing up without his daughter?" } },
      choices = {
        { text = "He's grieving, but he's still our king.", next = "BACK", reply = "Aye, that's Magni. He'd stand at the forge with a broken heart and never let the hammer slip.", fx = { affinity = 1 } },
        { text = "He's shut himself in the throne room.", next = "BACK", reply = "Then my tale will hit him all the harder. I'd almost rather stay in this cell than be the one to tell it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "hd_default", text = "Because a cell's a poor place for old grudges, and ye didn't put me in it. The orc down the row, Gor'shak, has been the best company I've had in years, and I'll thank ye not to tell anyone in Ironforge I said so." } },
      choices = { { text = "Something else.", next = "BACK" } },
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
        { text = "Morgan's Vigil sent word you were lost.", next = "vigil", when = { faction = "Alliance" } },
        { text = "A paladin of the Light at your service, Marshal.", next = "paladin", when = { class = "PALADIN" } },
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
        { text = "What became of your notes?", next = "notes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    notes = {
      lines = { { id = "n_default", text = "The Dark Irons took my papers, and my memory's no substitute for them. Some of it went to the warden, and some of it, I'd wager, went up the mountain to the Spire, where Rend's people can read it at their leisure." } },
      choices = {
        { text = "Then we'll take them back.", next = "notes2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    notes2 = {
      lines = { { id = "n2_default", text = "That's the spirit, but get me out first, because the papers mean little without the man who can explain them. Once I'm free, I'll know where to look, and Morgan's Vigil can do the rest." } },
      choices = {
        { text = "Duty first, then. I'll follow your lead.", next = "BACK", reply = "Good soldier. Stormwind needs more who listen before they charge.", fx = { align = { order = 1 } } },
        { text = "I'll do it my own way, Marshal.", next = "BACK", reply = "Then do it well, because I'm in no position to give orders from in here.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vigil = {
      lines = { { id = "v_default", text = "Lost, is it? I suppose that's kinder than dead, and closer to the truth. Tell whoever keeps the Vigil now that I haven't talked, and that I'll make my report in person." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Then the Light hasn't given up on this pit entirely. I've prayed more in this cell than I did in twenty years of service, and I'll take a paladin's sword arm as the answer, if you'll lend it." } },
      choices = {
        { text = "The Light brought me here for a reason.", next = "BACK", fx = { affinity = 1 } },
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
        { text = "How did the Dark Irons take you?", next = "captured" },
        { text = "For the Horde, commander. I'll get you out.", next = "horde", when = { faction = "Horde" } },
        { text = "An Alliance soldier freeing a Horde commander. Strange times.", next = "alliance", when = { faction = "Alliance" } },
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
    captured = {
      lines = { { id = "ca_default", text = "I came through the Burning Steppes with three scouts, and the Dark Irons found us at the gate. My scouts died well, and I was dragged down here to rot until someone thought to ask me questions." } },
      choices = {
        { text = "Did they get anything out of you?", next = "captured_talk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captured_talk = {
      lines = { { id = "ct_default", text = "Nothing but curses. But there is another prisoner in these depths, a dwarf called Kharan Mighthammer, who knows far more of this mountain's secrets than I do. Find him, and you will learn what Thrall needs to hear." } },
      choices = {
        { text = "A dwarf will speak to a Horde agent?", next = "captured_kharan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captured_kharan = {
      lines = { { id = "ck_default", text = "In a Dark Iron cell, enemies learn to talk to one another. He hates Thaurissan more than he hates me, and that is enough common ground for now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    horde = {
      lines = { { id = "ho_default", text = "Lok'tar, {class}! The warchief chose well when he sent you after me. Break these chains and you will have my axe beside you until we reach the surface." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alliance = {
      lines = { { id = "al_default", text = "Strange indeed, though I will not refuse an open door because of the hand that holds it. Tell your king that Gor'shak of the Horde pays his debts, even to humans." } },
      choices = {
        { text = "Our peoples have common enemies in this mountain.", next = "BACK", reply = "They do. Perhaps that is how the old wars end, one cell at a time.", fx = { align = { order = 1 } } },
        { text = "Don't mistake this for friendship, orc.", next = "BACK", reply = "I would never, human. An honest enemy is worth more to me than a false friend.", fx = { align = { order = -1 } } },
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
        { text = "What is this statue you lie beside?", next = "statue" },
        { text = "I'm a Bronzebeard. We've not forgotten the War of the Three Hammers.", next = "bronzebeard", when = { race = "Dwarf" } },
        { text = "Can't a priest's prayers let you rest?", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
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
        { text = "Can the Brotherhood free them?", next = "people_free", fx = { learn = { "thorium_brotherhood" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "thorium_brotherhood" } } },
      },
    },
    people_free = {
      lines = { { id = "pf_default", text = "Not alone, for the Firelord's grip is in the very forges they work. But smiths remember what their hands were made for, and a smith who remembers can be turned against any master in time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    statue = {
      lines = { { id = "st_default", text = "My own likeness, raised by the Emperor in a kinder year, when he still thought my genius belonged to him. Now my bones lie in its shadow, and the Dark Irons walk past it without knowing whose face it wears." } },
      choices = {
        { text = "Is that why you can't move on?", next = "statue_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    statue_why = {
      lines = { { id = "sw_default", text = "Partly, and partly the Shadowforge Key, which I designed and which Thaurissan's heirs still covet. While that key opens doors it was never meant to, my work is not finished, and neither am I." } },
      choices = {
        { text = "Then I'll see the key used rightly.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bronzebeard = {
      lines = { { id = "bz_default", text = "Nor have we, Bronzebeard, though I think we remember it differently. We lost that war and fled here to this mountain, and our grief made Thaurissan desperate enough to call up fire. Your king's grandfathers had a hand in this, whether you like to hear it or not." } },
      choices = {
        { text = "Your Emperor started that war.", next = "BACK", reply = "He did, and I drew the siege engines for it. Stubbornness is the one thing all our clans share.", fx = { align = { light = -1 } } },
        { text = "Perhaps it's time the clans set it aside.", next = "BACK", reply = "From a Bronzebeard's mouth? Then perhaps there is hope for the stone after all.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Your Light is kind, but it does not reach a soul tied to unfinished work. Help me finish the work, and I will need no prayers at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "The living world has moved on without me, mortal. I know only stone and fire and regret." } },
  },
}

---------------------------------------------------------------------------
-- Mistress Nagmara: Dark Iron hostess of the Grim Guzzler, sweet on Private Rocknot.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_nagmara", id = 9500, name = "Mistress Nagmara", role = "questgiver", tier = "quest",
  temper = { "sly", "flirtatious" }, values = { "pleasure", "practical" },
  notices = { "race", "quest" },
  impression = {
    first = "A Dark Iron hostess with an eye on the bar's sullen guard and a plan for him.",
    third = "{name} brewed a love potion for Mistress Nagmara in the Grim Guzzler.",
  },

  greetings = {
    { id = "g_default", text = "Well now, a new face in the Guzzler, and not one of the Emperor's sour-mouthed guards. Sit a while, sweetling, I don't bite unless I'm asked." },
    { id = "g_potion", when = { questActive = TODO_QUEST("The Love Potion") }, text = "Have ye got my ingredients, love? Rocknot isn't getting any sweeter on his own, and neither am I getting any younger." },
    { id = "g_back", when = { questDone = TODO_QUEST("The Love Potion") }, text = "There's my favourite matchmaker! Rocknot and I have been getting on famously, thanks to you." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A surface dwarf with a proper beard on him. If ye weren't a Bronzebeard I might be tempted, but a girl has her standards." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Nagmara, and I keep the Grim Guzzler's guests happy, one way or another. Most nights it's easy work, but there's one guard by the taps who won't so much as look at me." },
      },
      again = {
        { id = "h_again", text = "Anything else on yer mind, sweetling?" },
        { id = "h_again2", text = "Go on, I've time for a charming stranger." },
      },
      choices = {
        { text = "Which guard won't look at you?", next = "rocknot" },
        { text = "This is an odd place for romance.", next = "guzzler" },
        { text = "What do you need from me?", next = "potion" },
        { text = "A Dark Iron flirting with a Bronzebeard. Now I've seen everything.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "How did you end up in the Guzzler?", next = "yhow" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    rocknot = {
      lines = { { id = "r_default", text = "Private Rocknot, the big brute minding the kegs. He's got eyes only for Plugger's thunderbrew and never for me, and I'm sick of losing to a barrel." } },
      choices = {
        { text = "What does he see in the ale?", next = "rocknot2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rocknot2 = {
      lines = { { id = "r2_default", text = "Courage, I'd guess, and a reason not to think about who he serves. Every guard in this city drinks to forget the fire lord under their boots, and Rocknot just drinks more than most." } },
      choices = {
        { text = "Then maybe he needs kindness, not a potion.", next = "BACK", reply = "Kindness! Oh, aren't ye sweet. Kindness never got a Dark Iron anything but a knife in the back, love.", fx = { align = { light = 1 } } },
        { text = "If he won't come willingly, make him.", next = "BACK", reply = "Now there's someone who understands how things are done in Shadowforge. I like ye already.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guzzler = {
      lines = { { id = "gu_default", text = "Odd? This is the only warm place in the city that doesn't belong to the Emperor or his priests. Plugger Spazzring pours, the patrons drink, and nobody asks too many questions as long as the taps keep running." } },
      choices = {
        { text = "What happens if the taps stop?", next = "guzzler2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guzzler2 = {
      lines = { { id = "gu2_default", text = "Then the whole room turns on whoever stopped them, and I'd not want to be that fool. Mind yerself around Plugger's kegs, sweetling, he counts every drop." } },
      choices = {
        { text = "I'll be careful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    potion = {
      lines = { { id = "p_default", text = "A love potion, brewed right. I need Gromsblood, silver from the big veins, and a vial of water from the hot springs in Un'Goro Crater, and none of that grows down here in the dark." } },
      choices = {
        { text = "Un'Goro is a long way to go for a crush.", next = "potion2" },
        { text = "I'll fetch what you need.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    potion2 = {
      lines = { { id = "p2_default", text = "It's a long way for me, love, but you're the one with the legs for it. Bring it all back and I'll make it worth yer while, and Rocknot will finally learn what he's been missing." } },
      choices = {
        { text = "Drugging a man is a low trick.", next = "BACK", reply = "Low? Darling, this is Blackrock Depths. Everything worth having down here is had by a low trick.", fx = { align = { order = 1 } } },
        { text = "Love is a battle. Fight however you like.", next = "BACK", reply = "Spoken like someone who's won a few. Off with ye, then, and hurry back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "d_default", text = "Ha! Don't flatter yerself, I was only looking. Yer folk and mine have three hundred years of blood between us, but a pretty face is a pretty face in any clan." } },
      choices = {
        { text = "Maybe our clans will make peace someday.", next = "BACK", reply = "Not while Thaurissan's line sits on the throne, love. But it's a sweet thought, I'll grant ye.", fx = { align = { light = 1 } } },
        { text = "Your clan burned Ironforge's kin. No peace for that.", next = "BACK", reply = "Aye, and yer clan buried mine under a mountain. We'll call it even and order another round.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhow = {
      narr = "She swirls the dregs in her mug and doesn't drink them.",
      lines = {
        { id = "yh_default", text = "Born in Shadowforge City, love, to a mother who scrubbed the Emperor's floors and a father who died at the forges. I learned young that a smile pays better than a scrub brush, and Plugger pays best of all, so here I am." },
        { id = "yh_dwarf", when = { race = "Dwarf" }, text = "Born in Shadowforge, to a mother who scrubbed the Emperor's floors and a father the forges took. Ye surface folk think we all love fire. Most of us just haven't anywhere else to go, sweetling." },
      },
      choices = {
        { text = "Do you ever think of leaving?", next = "yleave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yleave = {
      lines = { { id = "yl_default", text = "The Thorium Brotherhood up in the Gorge would take me, I hear, them that broke from the Emperor. But this is my city, rotten as it is. A girl doesn't walk out on her own mountain. Or should she?" } },
      choices = {
        { text = "Go to the Brotherhood. Break free.", next = "BACK", reply = "Maybe I will, once Rocknot's sorted. He'd need to come too.", fx = { align = { order = -1 } } },
        { text = "Stay. Your city needs folk like you.", next = "BACK", reply = "Ha! It needs a lot of things, love, and I'm the cheapest.", fx = { align = { order = 1 } } },
      },
    },
  },

  topics = {
    rocknot = { { id = "yt_rocknot", text = "Private Rocknot. Big shoulders, sad eyes, and in love with a barrel. I'll fix that." } },
    plugger = { { id = "yt_plug", text = "Plugger Spazzring runs the Grim Guzzler. Pours honest measures and hates thieves more than he hates the Emperor." } },
    thaurissan = { { id = "yt_thaur", text = "The Emperor and his fire lord. Say his name softer in here, sweetling, the walls drink too." } },
    _none = { { id = "tp_none", text = "Gossip's for the bar, love, and I'm only interested in one man's business tonight." } },
  },
}

---------------------------------------------------------------------------
-- Dughal Stormwing: a Wildhammer prisoner in the Detention Block, freed during Jail Break.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_dughal", id = 9022, name = "Dughal Stormwing", role = "prisoner", tier = "service",
  temper = { "proud", "restless" }, values = { "free", "loyal" },
  notices = { "race" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's my rescuer, back again! By Kurdran's beard, I'll be tellin' Aerie Peak about ye till the gryphons are sick of hearin' it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Ye've let me rot in here before, so forgive me if I don't cheer when ye come down the stair." },
    { id = "g_default", text = "Ye've a key, or ye've an axe, and either one will do. Get me out of this cage before the jailers come back round!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Dughal Stormwing, of the Wildhammer clan of Aerie Peak. The Dark Irons dragged me down here after a skirmish in the Hinterlands' south, and I've not seen the sky since." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A cousin from Ironforge! I'll not hold the beard trimming against ye today. Dughal Stormwing of Aerie Peak, and I'd kiss ye for that key." },
      },
      again = {
        { id = "h_again", text = "Aye? Ask quick, the jailers have ears." },
        { id = "xh_again2", text = "Still talking? Talk while ye walk, then, for I've had enough of sitting." },
      },
      choices = {
        { text = "How did the Dark Irons catch a Wildhammer?", next = "caught" },
        { text = "Marshal Windsor is in these cells too.", next = "windsor" },
        { text = "Tell me about Aerie Peak.", next = "xaerie" },
        { text = "What did you see of the Dark Irons' halls?", next = "xhalls" },
        { text = "Are there other Wildhammers down here?", next = "xother" },
        { text = "I've flown a gryphon from Aerie Peak myself.", next = "xflown", when = { race = "Dwarf" } },
        { text = "What will you do when you're free?", next = "yfree" },
        { text = "Go. Find your way out.", next = "END" },
      },
    },
    caught = {
      lines = { { id = "c_default", text = "My gryphon took a bolt and we came down hard on the slopes, and before I'd my wits back there were a dozen of them on me. I'd sooner have been eaten by a wyvern than walked in chains through that great gate." } },
      choices = {
        { text = "Your gryphon may still live.", next = "BACK", reply = "Aye, I'll hold to that, for it's a hope that costs nothing. Thank ye for saying it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    windsor = {
      lines = { { id = "w_default", text = "The Stormwind marshal? He's the one with the plan, and if he says we run, we run. I'd follow any man who can keep his head after what they've done to him in here." } },
      choices = {
        { text = "Stand with him, then. Every blade counts.", next = "BACK", reply = "I've no blade, but I've two fists and a grudge, and that'll do.", fx = { align = { order = 1 } } },
        { text = "Forget Windsor. Save yourself.", next = "BACK", reply = "Spoken like a lowlander. A Wildhammer doesn't leave a friend in a cage, not even a Stormwind one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xaerie = {
      narr = "He tips his head back as if he could see the sky through the stone.",
      lines = { { id = "xae_default", text = "High on the cliffs of the Hinterlands, where the wind smells of pine and the gryphons nest in the rocks. Falstad Wildhammer rules there, and he'd sooner fly a hundred miles than ask Ironforge for a favour." } },
      choices = {
        { text = "Why do the Wildhammers keep apart from Ironforge?", next = "xsplit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsplit = {
      lines = { { id = "xsp_default", text = "The War of the Three Hammers, long ago, when Bronzebeard, Wildhammer and Dark Iron tore the old kingdom in three. We took to the high places and the open air, and we've no wish to go back under a mountain, as ye can tell." } },
      choices = {
        { text = "The clans should stand together again.", next = "BACK", reply = "Maybe, so long as nobody asks us to trim our beards and live in a hole.", fx = { align = { order = 1 } } },
        { text = "Every clan has the right to its own road.", next = "BACK", reply = "Aye, that's the Wildhammer creed, near enough. Ye'd fit in at the Peak.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhalls = {
      lines = { { id = "xha_default", text = "Forges the size of a town and rivers of fire, and a great black city built into the mountain's guts. They marched me past an arena where they make prisoners fight for the crowd's sport, and I'll not forget the cheering." } },
      choices = {
        { text = "The Dark Irons deserve to burn in their own fires.", next = "BACK", reply = "Aye, and I'd fan the flames myself, if I'd the hands free.", fx = { align = { light = -1 } } },
        { text = "Not every Dark Iron chose this.", next = "BACK", reply = "Maybe so, but I've yet to meet the one who didn't. Show me him, and I'll think on it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xother = {
      lines = { { id = "xot_default", text = "None that I've seen alive. There was a lad from Aerie Peak taken with me, Grimbald, and they took him up the stairs one morning and he never came back down." } },
      choices = {
        { text = "I'm sorry for him.", next = "BACK", reply = "So am I. Tell them at the Peak, if ye ever pass that way, so someone raises a mug for him." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xflown = {
      lines = { { id = "xfl_default", text = "Have ye, now? Then ye've felt the wind lift ye clean off the cliff, and ye'll know why I'm going half mad down here. A Bronzebeard on a gryphon, though, the lads at the Peak would laugh themselves silly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yfree = {
      lines = {
        { id = "yfr_default", text = "Find the nearest gryphon roost and beg a ride home, then drink the Peak's cellars dry and tell Falstad to his face that the Dark Irons need a lesson from the air. After that, I'll find out if my Skyrender still lives." },
        { id = "yfr_horde", when = { faction = "Horde" }, text = "Get out, first, and I'll thank ye for the key even if ye're Horde. Then home to Aerie Peak to find out if my gryphon Skyrender still lives, and to drink the cellars dry." },
      },
      choices = {
        { text = "Will you come back to fight?", next = "yreturn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yreturn = {
      narr = "He flexes hands rubbed raw by the chains.",
      lines = { { id = "yre_default", text = "Some of the lads will want a raid on the mountain the day I tell them about Grimbald. I'd sooner bring the Bronzebeards in too and do it properly, but that'd mean asking Ironforge for help. What would ye do?" } },
      choices = {
        { text = "Strike now, with the Wildhammers alone.", next = "BACK", reply = "Fast and angry, the Wildhammer way. Aye, it's tempting.", fx = { align = { order = -1 } } },
        { text = "Swallow your pride and ask Ironforge.", next = "BACK", reply = "It'll stick in my throat, but ye may be right.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    windsor = { { id = "yt_windsor", text = "Marshal Windsor of Stormwind. Grim man, sharp mind. If he says run, I run." } },
    gryphons = { { id = "yt_gryph", text = "A gryphon picks its rider, not the other way round. Mine's Skyrender, and she's the finest in the Peak." } },
    aerie_peak = { { id = "xtp_aerie", text = "Home, and the finest place in the world to drink and fly and argue. I'll see it again, or I'll die trying." } },
    dark_iron = { { id = "xtp_di", text = "Fire-loving cowards who strike from behind and then gloat about it. I owe them a long debt." } },
    _none = { { id = "tp_none", text = "Ask me again under the open sky, friend, and I'll tell ye anything ye like." } } },
}

---------------------------------------------------------------------------
-- Tobias Seecher: one of Windsor's old band, a prisoner in the Halls of the Law.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_tobias", id = 9679, name = "Tobias Seecher", role = "prisoner", tier = "service",
  temper = { "wry", "weary" }, values = { "loyal" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back for me, which is more than Windsor's lot ever expected anyone to do. I'm very glad to see you, friend." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'd hoped for a jailer with a heart, and I've got the next worst thing." },
    { id = "g_default", text = "Easy, I'm not one of the dangerous ones, whatever the guards have told you. Is that a key, or are you just glad to see me?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "Tobias Seecher. I rode with Marshal Windsor's company when we came to look into this mountain, and the Dark Irons took the lot of us in one bad night." } },
      again = {
        { id = "h_again", text = "Anything else, before they notice the door's open?" },
        { id = "xh_again2", text = "Still with me? Good, because the walls make terrible company." },
      },
      choices = {
        { text = "What happened to Windsor's company?", next = "company" },
        { text = "Who are the others in these cells?", next = "cells" },
        { text = "What was Windsor looking for here?", next = "xlooking" },
        { text = "How did you survive this long?", next = "xsurvive" },
        { text = "What will you do once you're out?", next = "xafter" },
        { text = "I'm from Stormwind. I'll carry word back.", next = "xstormwind", when = { race = "Human" } },
        { text = "Do you have family waiting for you?", next = "yfamily" },
        { text = "Get moving.", next = "END" },
      },
    },
    company = {
      lines = { { id = "co_default", text = "Some died on the road, some died in here, and the marshal they kept apart from the rest of us. He found out something about Onyxia and the court in Stormwind, and the Dark Irons wanted it out of him badly." } },
      choices = {
        { text = "Then Stormwind must hear what he knows.", next = "BACK", reply = "That's what I've been telling the walls for months. Glad someone finally answered.", fx = { align = { order = 1 } } },
        { text = "Stormwind left you to rot. I wouldn't bother.", next = "BACK", reply = "Fair point, but I'd rather prove them wrong than prove them right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cells = {
      lines = { { id = "ce_default", text = "Murderers, mostly, and a Scarlet zealot who prays louder than the jailers shout. I'd leave most of those doors shut if I were you, because not everyone in here will thank you for opening them." } },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlooking = {
      lines = { { id = "xlo_default", text = "Answers, mostly, about who was really pulling the strings in Stormwind's court. The marshal had a notion that the Dark Irons and the black dragons knew more about it than they ought to, and he wanted proof." } },
      choices = {
        { text = "Did he find it?", next = "xproof" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xproof = {
      narr = "He glances down the corridor before he answers, lowering his voice.",
      lines = { { id = "xpr_default", text = "He found something, and they took it off him, notes and all, and scattered it among their own people. If you can find the pieces and get them back to him, he'll know what to do with them." } },
      choices = {
        { text = "Then I'll find every page and bring them back.", next = "BACK", reply = "That's the spirit. The marshal will want to shake your hand, if they've left him one.", fx = { align = { order = 1 } } },
        { text = "Court intrigue isn't worth dying in a cell over.", next = "BACK", reply = "Maybe not, but he's already in the cell, and so am I. Might as well make it count.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsurvive = {
      lines = { { id = "xsu_default", text = "By keeping my head down and my mouth shut, which anyone who knows me would tell you is a miracle. I tell myself jokes, and I laugh at them, because nobody else down here will." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xafter = {
      lines = { { id = "xaf_default", text = "Find the deepest tavern in Lakeshire and sit in it until I've forgotten the smell of this place. Then I'll ride with the marshal again, because a man doesn't get to choose his debts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xstormwind = {
      lines = { { id = "xsw_default", text = "Tell them Tobias Seecher's alive, if anyone still asks after me. And tell the marshal's friends at the Keep that he never stopped working, not even in here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yfamily = {
      narr = "He rubs at the stubble on his jaw, and for once he doesn't smile.",
      lines = {
        { id = "yfa_default", text = "A girl in Lakeshire, if she's waited, which I wouldn't blame her for not doing. Her name's Molly, and she bakes the worst bread on the lake, and I'd eat a whole loaf of it right now and ask for another." },
        { id = "yfa_dwarf", when = { race = "Dwarf" }, text = "A girl in Lakeshire named Molly, who bakes bread so hard a Bronzebeard could use it for a whetstone. If she's waited, I'll eat a whole loaf and ask for another." },
      },
      choices = { { text = "She'll have waited. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    lakeshire = { { id = "yt_lake", text = "Lakeshire's got the best bridge and the worst bread in the kingdom, and I miss both." } },
    onyxia = { { id = "yt_onyx", text = "Windsor had a name he'd only whisper. I'll leave the whispering to him, friend." } },
    thaurissan = { { id = "yt_thaur", text = "The Emperor sits on a throne of black stone and talks to fire. I saw him once, from a cage, and once was plenty." } },
    shill = { { id = "yt_shill", text = "The Scarlet in the next cell prays all night. I'd let him out just to get some sleep." } },
    windsor = { { id = "xtp_windsor", text = "The best officer I ever served and the most stubborn man alive. If anyone gets out of here, it'll be him." } },
    dark_iron = { { id = "xtp_di", text = "They took us in one night and they've been taking us apart ever since. I don't forgive easily." } },
    _none = { { id = "tp_none", text = "I've been in a cell for longer than I care to count, friend, so I don't know much about anything lately." } } },
}

---------------------------------------------------------------------------
-- Crest Killer: a dwarf convict in the Halls of the Law who won't thank anyone for his freedom.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_crest_killer", id = 9680, name = "Crest Killer", role = "prisoner", tier = "service",
  temper = { "menacing", "sneering" }, values = { "self" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ye again, and still alive. I've a grudging likin' for ye now, which ye'd do well to treat as rare as it is." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Back at my bars, are ye? I've killed folk for less than the look ye gave me last time." },
    { id = "g_default", text = "Well, look who's come to visit. Ye'd best have a good reason for standing so close to my door." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "They call me Crest Killer, and I earned the name with more noble houses than ye can count. The Dark Irons lock up their worst in these halls, so ye can guess how proud I am to be here." } },
      again = {
        { id = "h_again", text = "Still here? Brave or daft, I can't tell which." },
        { id = "xh_again2", text = "Ye keep coming back to my bars. Most folk learn quicker than that." },
      },
      choices = {
        { text = "What did you do to earn that name?", next = "name" },
        { text = "Would you fight the jailers if I freed you?", next = "free" },
        { text = "Who paid you for your killings?", next = "xpaid" },
        { text = "How long have you been in here?", next = "xlong" },
        { text = "What do you think of the Dark Irons?", next = "xdark" },
        { text = "I know a few nobles I'd pay you to visit.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You're a disgrace to dwarvenkind.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I'll leave your door shut.", next = "END" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "I hunted the ones who wore crests, lords and their heirs, and I took their signet rings as proof. Gold buys a knife easier than it buys loyalty, and I was always for sale." } },
      choices = {
        { text = "You deserve the cell you're in.", next = "BACK", reply = "Aye, likely. Deserving never had much to do with where a dwarf ends up.", fx = { align = { light = 1 } } },
        { text = "A killer for hire is still honest work.", next = "BACK", reply = "Ha! At last, someone who understands a trade when they see one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    free = {
      lines = { { id = "f_default", text = "Where I come from, ye get shanked for opening another inmate's cell door. Think on that a good long while before ye reach for the lock." } },
      choices = {
        { text = "Understood.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpaid = {
      narr = "He grins through the bars, and you count three missing teeth.",
      lines = { { id = "xpa_default", text = "Other nobles, mostly, for there's no man so keen to see a lord dead as his own cousin. I never asked their reasons, and they never asked my methods, and that's the whole secret of a long career." } },
      choices = {
        { text = "So how did you end up here?", next = "xcaught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcaught = {
      lines = { { id = "xca_default", text = "I took a contract on a Dark Iron, if ye can believe it, a fat steward who'd crossed the wrong merchant. The steward had more guards than sense, and I had more confidence than either." } },
      choices = {
        { text = "Then the cell's fair payment for that mistake.", next = "BACK", reply = "Fair? Ha. Fair is a word for honest men, and I've met few of those down here.", fx = { align = { order = 1 } } },
        { text = "Bad luck, not justice, put you here.", next = "BACK", reply = "Now ye're talking like a sensible sort. Luck turns, given time and a careless guard.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlong = {
      lines = { { id = "xlo_default", text = "Long enough to know the jailers by their footsteps and the gruel by its smell. Some days I count the drips from the ceiling, and some days I count the ways I'd kill the one who brings the bowl." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdark = {
      lines = { { id = "xda_default", text = "They're cruel, proud and too clever with fire, and I'd admire them if they weren't the ones holding the key. Their Emperor bows to something bigger beneath the mountain, so the whispers say, though no prisoner's ever seen what." } },
      choices = {
        { text = "What does the whisper say it is?", next = "xwhisper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhisper = {
      lines = { { id = "xwh_default", text = "Fire that walks and talks, and a lord made of it, deep down in the molten heart of the mountain. Could be jailers' talk to frighten us, but I've felt the floor go warm at night, and I don't scare easy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Do ye, now? Then ye understand the trade, and ye'll understand I don't work from a cell. Open the door and we'll talk about prices, or don't, and keep yer nobles to yerself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdwarf = {
      lines = { { id = "xdw_default", text = "A disgrace, aye, and a rich one, until recently. Ironforge has its share of knives in the dark, cousin, it just pays them better and calls them something prettier." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dark_iron = { { id = "xtp_di", text = "They pay their jailers in scraps and their soldiers in fire. I'd not work for them, and I've worked for anyone." } },
    stormwind = { { id = "xtp_sw", text = "Lots of crests in Stormwind, and lots of folk who'd like a few of them gone. I made a fair living there once." } },
    _none = { { id = "tp_none", text = "Ask the jailers, friend. I'm not in the habit of answering questions for free." } } },
}

---------------------------------------------------------------------------
-- Ograbisi: an ogre prisoner sharing a cell with the orc Jaz.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_ograbisi", id = 9677, name = "Ograbisi", role = "prisoner", tier = "service",
  temper = { "brutish", "hungry" }, values = { "self" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "The good one comes back! Ograbisi remembers you, and Ograbisi will not try to eat you, maybe." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Ograbisi does not like you, and Ograbisi is thinking you would taste better than gruel." },
    { id = "g_default", text = "You smell like food that walks. Ograbisi is very hungry, and the little dwarfs only bring gruel." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "Ograbisi was a strong one in the mountain, and the dwarfs needed six chains to bring him in here. Now he sits with the orc and the orc talks too much." } },
      again = {
        { id = "h_again", text = "Ograbisi is still hungry. You want something more?" },
        { id = "xh_again2", text = "You come back. Ograbisi hopes you bring meat this time." },
      },
      choices = {
        { text = "The orc is your cellmate?", next = "jaz" },
        { text = "Why did the dwarves lock you up?", next = "why" },
        { text = "What's it like being an ogre in a dwarf prison?", next = "xprison" },
        { text = "Where were you before Blackrock?", next = "xbefore" },
        { text = "What would you do if you got out?", next = "xout" },
        { text = "I'm an orc. I could speak to Jaz for you.", next = "xorc", when = { race = "Orc" } },
        { text = "What did ogres eat, back in the mountains?", next = "yfood" },
        { text = "Enjoy your gruel.", next = "END" },
      },
    },
    jaz = {
      lines = { { id = "j_default", text = "Jaz, he is called, and he says the Horde will come for him one day. Ograbisi says the Horde does not come for anybody down here, and then Jaz is quiet for a while." } },
      choices = {
        { text = "The Horde never forgets its own.", next = "BACK", reply = "Then the Horde is very slow, little one. Ograbisi has counted many gruels.", fx = { align = { order = 1 } } },
        { text = "Nobody's coming for either of you.", next = "BACK", reply = "Ograbisi knows. That is why Ograbisi is so hungry and so angry.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Ograbisi ate the Emperor's cattle, and then the Emperor's cattle man. The dwarfs did not think that was funny at all." } },
      choices = {
        { text = "I can't think why not.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xprison = {
      narr = "He shifts his weight, and the chains on his wrists clank against the stone.",
      lines = { { id = "xpr_default", text = "Small. Everything is small, the door is small, the bowl is small, the dwarfs are small. Ograbisi hits his head every morning and the jailers laugh, and Ograbisi remembers which ones laugh." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbefore = {
      lines = { { id = "xbe_default", text = "Ograbisi was in the mountain with the other ogres, the Firegut and the ones who serve the black dragons. Ogres fight for whoever pays, and the dwarfs did not pay, so Ograbisi ate their cows." } },
      choices = {
        { text = "Who pays the ogres now?", next = "xpays" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpays = {
      lines = { { id = "xpa_default", text = "The black dragons up the mountain, and the orcs in the spire, they pay with meat and shiny things. Ograbisi thinks it is a good deal, but Jaz says ogres are fools to work for dragons." } },
      choices = {
        { text = "Jaz is right. Dragons use ogres and throw them away.", next = "BACK", reply = "Hm. Ograbisi does not like it when Jaz is right. Jaz gets loud.", fx = { align = { order = -1 } } },
        { text = "Strong ones fight for whoever is strongest. Sensible.", next = "BACK", reply = "Yes! You understand. You are small, but you are not stupid.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xout = {
      lines = { { id = "xou_default", text = "Eat. Then smash the dwarf who laughs loudest. Then eat again, because smashing makes Ograbisi hungry." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xorc = {
      lines = { { id = "xor_default", text = "You are like Jaz, green and loud. Tell him to stop talking about honour in the night, because Ograbisi cannot sleep and honour does not fill bellies." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yfood = {
      lines = {
        { id = "yfo_default", text = "Goats, boars, black-scale lizards, and sometimes a dwarf that walks too far from the forge. Ogre mothers cook with big rocks in big pots, and the smell goes all the way up the mountain. Ograbisi misses the smell more than the mountain." },
        { id = "yfo_tauren", when = { race = "Tauren" }, text = "Goats and boars and lizards, and once a cow-man like you, but small. Do not worry. Ograbisi is in chains, and also you look stringy. Ograbisi misses mother's big pot more than the mountain." },
      },
      choices = {
        { text = "You had a mother?", next = "ymother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymother = {
      narr = "The ogre is quiet for a long moment, which seems to surprise even him.",
      lines = { { id = "ymo_default", text = "Everybody has a mother, little one, even ogres. Ograbisi's mother had two heads, one nice and one shouting. The shouting head told Ograbisi never to eat the cattle man. Ograbisi did not listen, and now Ograbisi is here." } },
      choices = { { text = "Mothers usually know best. Something else.", next = "BACK" } },
    },
  },
  topics = {
    gruel = { { id = "yt_gruel", text = "Gruel is grey and it is cold and it tastes of the jailer's thumb. Ograbisi hates gruel." } },
    chains = { { id = "yt_chains", text = "Six chains brought Ograbisi in. Now it is four. Ograbisi is patient, for an ogre." } },
    thaurissan = { { id = "yt_thaur", text = "The fire dwarf king. Ograbisi ate his cows. Ograbisi would eat the king too, but he is mostly beard." } },
    dark_iron = { { id = "xtp_di", text = "Small and mean and they smell of smoke. Ograbisi does not like dwarfs." } },
    jaz = { { id = "xtp_jaz", text = "Jaz is the orc. Jaz talks and talks, and Ograbisi listens because there is nothing else to do." } },
    _none = { { id = "tp_none", text = "Ograbisi does not know that. Ograbisi knows hungry and Ograbisi knows chains." } } },
}

---------------------------------------------------------------------------
-- Shill Dinger: a Scarlet Crusader imprisoned by the Dark Irons, still preaching.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_shill_dinger", id = 9678, name = "Shill Dinger", role = "prisoner", tier = "service",
  temper = { "zealous", "suspicious" }, values = { "pious" },
  notices = { "race" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return, and the Light has kept you whole in this heathen pit. I'll count you in my prayers tonight, stranger." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll pray for your soul, since no one else will, but keep your distance from my cell." },
    { id = "g_default", text = "Halt! Before you come one step nearer, tell me whether you are clean of the plague, stranger." },
    { id = "g_undead", when = { race = "Scourge" }, text = "Abomination! Even in this pit the Light sends me trials, and you are the foulest of them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I am Shill Dinger, a soldier of the Scarlet Crusade. I came south hunting the taint of the Scourge, and these heathen dwarves threw me in chains for my trouble." } },
      again = {
        { id = "h_again", text = "Speak, and be quick about it. My prayers are not finished." },
        { id = "xh_again2", text = "You linger. Are you here to repent, or to mock?" },
      },
      choices = {
        { text = "What brought a Crusader to Blackrock?", next = "why" },
        { text = "The Crusade kills innocents in Lordaeron.", next = "crusade" },
        { text = "Who leads the Scarlet Crusade?", next = "xleader" },
        { text = "How do the dwarves treat you here?", next = "xtreat" },
        { text = "What did you see in the fires below?", next = "xfire" },
        { text = "I'm a paladin. Your Crusade shames the Light.", next = "xpaladin", when = { class = "PALADIN" } },
        { text = "Where were you from, before the Crusade?", next = "yfrom" },
        { text = "Pray on, then.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Rumours of necromancy among the dark dwarves, and a fire that burns without the Light's blessing. I found the fire, and I found it far worse than any rumour." } },
      choices = {
        { text = "Your faith hasn't failed you here?", next = "BACK", reply = "Never. Every lash only proves the Light is testing me for something greater." },
        { text = "Something else.", next = "BACK" },
      },
    },
    crusade = {
      lines = { { id = "c_default", text = "There are no innocents in a plagued land, only the dead and those who have not yet died. If that sounds cruel to you, then you have never watched your neighbours rise from their graves." } },
      choices = {
        { text = "Cruelty in the Light's name is still cruelty.", next = "BACK", reply = "Spoken like someone who has never had to burn a village to save a kingdom.", fx = { align = { light = 1 } } },
        { text = "Someone has to make the hard choices.", next = "BACK", reply = "At last, a voice of sense in this pit. The Crusade would welcome you, stranger.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xleader = {
      lines = { { id = "xle_default", text = "Grand Crusader Saidan Dathrohan, and under him the faithful of Tyr's Hand and the Monastery. The Light chose them to cleanse Lordaeron, and when I am free I will return to their banner." } },
      choices = {
        { text = "And if they're wrong?", next = "xwrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwrong = {
      narr = "He stares at you, and his knuckles whiten on the bars.",
      lines = { { id = "xwr_default", text = "Wrong? The dead walk in the streets of Andorhal, stranger, and you ask if we are wrong to burn them. If there is a sin in the Crusade, it is that we have been too slow." } },
      choices = {
        { text = "Then the Light has left your Crusade behind.", next = "BACK", reply = "Heresy, spoken in a heathen pit. I will pray for you, though you do not deserve it.", fx = { align = { light = 1 } } },
        { text = "Hard times demand hard men. I understand.", next = "BACK", reply = "Then you are wiser than most who pass these bars. Remember that when you reach Lordaeron.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtreat = {
      lines = { { id = "xtr_default", text = "They throw me bread and laugh at my prayers. But they have not broken me, and every day I outlast them is a sermon of its own." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfire = {
      lines = { { id = "xfi_default", text = "A city that worships flame, and priests who sing to it. Whatever lies beneath this mountain, it is no less a darkness than the Scourge, only warmer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpaladin = {
      lines = { { id = "xpa_default", text = "Shames it? We are the last who still carry it into the dark, while your Silver Hand sits in Stormwind polishing its hammers. When Uther fell, his order fell with him, and we picked up what was left." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yfrom = {
      narr = "For a moment the zealot's glare falters, and he looks only tired.",
      lines = {
        { id = "yfr_default", text = "A village outside Hearthglen, with an orchard and a mill and a chapel with a blue window. The plague came in the grain, and the chapel window was the last thing I saw before I ran. There is no village now. There is only the Crusade." },
        { id = "yfr_human", when = { race = "Human" }, text = "A village outside Hearthglen, with an orchard and a chapel with a blue window. You are Lordaeron-born too, maybe, or your parents were. Then you know there is nothing to go home to. There is only the Crusade." },
      },
      choices = { { text = "I'm sorry for your loss. Something else.", next = "BACK" } },
    },
  },
  topics = {
    hearthglen = { { id = "yt_hearth", text = "Hearthglen still holds, in the north. The Light keeps it, and so do the Crusade's swords." } },
    dark_iron = { { id = "yt_di", text = "Heathens who worship fire and laugh at prayer. The Light will judge them, and I hope to watch." } },
    light = { { id = "yt_light", text = "The Light does not ask whether we are gentle. It asks whether we are faithful." } },
    scarlet_crusade = { { id = "xtp_scarlet", text = "The only true army of the Light left in Lordaeron. You will come to see it, if you live long enough." } },
    scourge = { { id = "xtp_scourge", text = "The plague of the Lich King, and the reason I will never stop fighting. Every corpse is a soldier waiting to rise." } },
    _none = { { id = "tp_none", text = "I know only the Light and the evils it opposes. Ask me of those or ask me nothing." } } },
}
