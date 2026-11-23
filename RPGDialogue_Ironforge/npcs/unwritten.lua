-- Dun Morogh and Ironforge folk without a conversation yet: Gol'Bolar Quarry and Coldridge hands, Gnomeregan's watchers
-- and refugees, holiday vendors, the battlemasters of the Hall of Arms and the Ahn'Qiraj war-effort collectors.
-- Voice: bibles/missed_c.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Father Gavin: Argent Dawn priest at Misty Pine Refuge.
P:NPC {
  key = "ifu_father_gavin", id = TODO_NPC("Father Gavin"), name = "Father Gavin", title = "The Argent Dawn", gender = "male",
  bible = "bibles/missed_c.md", role = "priest", tier = "service",
  communities = { "dunmorogh" }, temper = { "gentle", "steady" }, values = { "faith", "duty" },
  impression = {
    first = "Father Gavin keeps a small table of vials and holy water at Misty Pine Refuge, far from any chapel. He wears the Argent Dawn's colours and speaks like a man who has buried more of the dead than he has wed the living.",
    third = "{name} met Father Gavin, a priest of the Argent Dawn keeping watch at Misty Pine Refuge.",
  },
  greetings = {
    { id = "g_default", text = "The Light keep you warm, friend, for the mountains certainly won't." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The kettle's cold, but the welcome isn't." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Father Gavin, and I serve the Argent Dawn. We go wherever the dead will not lie still, and you would be surprised how far into the snow that has brought me." } },
      again = { { id = "h_again", text = "What else weighs on you, child?" }, { id = "h_again2", text = "Ask, and I'll answer as well as an old priest can." } },
      choices = {
        { text = "What is the Argent Dawn?", next = "dawn" },
        { text = "Why would the Dawn come this far into the snow?", next = "snow" },
        { text = "You've fought the Scourge yourself, then.", next = "fought" },
        { text = "I serve the Light as well, Father.", next = "fellow", when = { class = "PRIEST" } },
        { text = "Farewell.", next = "END" },
      },
    },
    dawn = {
      lines = { { id = "dawn_default", text = "We are an order sworn against the Scourge, priests and soldiers and scholars alike, and we ask no man his kingdom before we let him stand with us. The plague does not care for banners, so neither do we." } },
      choices = {
        { text = "Even the Horde stands with you?", next = "horde" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "horde_default", text = "Some of them do, quietly, and I have shared bread with an orc who hated the dead as much as I. Not everyone in Ironforge likes to hear that, so I mention it only to those who ask." } },
      choices = {
        { text = "The plague makes allies of anyone who fights it.", next = "BACK", reply = "Then you understand the Dawn better than most who wear its tabard.", fx = { align = { order = -1 } } },
        { text = "An orc is an orc, whatever he fights.", next = "BACK", reply = "Perhaps, but I would still rather he fought beside me than against me.", fx = { align = { order = 1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    snow = {
      lines = { { id = "snow_default", text = "Because the plague came south with the refugees, hidden in grain and in coughs, and someone must watch for it at the mountain's gate. Misty Pine is quiet, which is exactly what I pray for every morning." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    fought = {
      lines = { { id = "fought_default", text = "I have stood in Lordaeron when the villages fell, and I have no wish to tell that tale twice in a day. It is enough to say that I know what a ghoul smells like before it rounds the corner." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fellow = {
      lines = { { id = "fellow_default", text = "Then you know that the Light is a lantern, not a sword, though it serves as both when the dead come walking. Keep your prayers short and your eyes open, my friend." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I'm afraid that's beyond an old priest's knowing. The Light shows me the road, not the map." } },
  },
}

-- Prospector Gehn: Explorers' League prospector at Gol'Bolar Quarry.
P:NPC {
  key = "ifu_prospector_gehn", id = TODO_NPC("Prospector Gehn"), name = "Prospector Gehn", title = "Explorers' League", gender = "male",
  bible = "bibles/missed_c.md", role = "scholar", tier = "service",
  communities = { "dunmorogh" }, temper = { "eager", "gruff" }, values = { "knowledge", "work" },
  impression = {
    first = "Prospector Gehn stands over the cut of Gol'Bolar Quarry with a pick in one hand and a notebook in the other. He has the Explorers' League's habit of looking at rock as if it owed him a story.",
    third = "{name} met Prospector Gehn of the Explorers' League at Gol'Bolar Quarry.",
  },
  greetings = {
    { id = "g_default", text = "Mind the edge, {g:lad|lass}, the quarry's deeper than it looks." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The stone hasn't moved since ye left, more's the pity." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Gehn's the name, prospector for the Explorers' League. I'm here to read the quarry's walls before the miners knock them all down for building stone." } },
      again = { { id = "h_again", text = "What else, then?" }, { id = "h_again2", text = "Go on, I've a moment between hammer strokes." } },
      choices = {
        { text = "What do the quarry walls tell you?", next = "walls" },
        { text = "Who works the quarry?", next = "miners" },
        { text = "Troggs have been seen near the quarry.", next = "troggs" },
        { text = "Farewell.", next = "END" },
      },
    },
    walls = {
      lines = { { id = "walls_default", text = "That this mountain was shaped, not just grown, if ye know how to look at the seams. The League thinks the titans had their hands in all of Khaz Modan, and every quarry gives us another page of the tale." } },
      choices = {
        { text = "Titans? Here in Dun Morogh?", next = "titans" },
        { text = "Old stones should be studied, not cut for walls.", next = "BACK", reply = "Ye'd have a friend in me, but try tellin' that to the King's builders.", fx = { align = { order = -1 } } },
        { text = "A city needs stone more than scholars need stories.", next = "BACK", reply = "Hmph, spoken like a mason, and there's sense in it, I'll grant.", fx = { align = { order = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    titans = {
      lines = { { id = "titans_default", text = "Aye, and Uldaman's proof enough of that for anyone with eyes. Brann Bronzebeard says the same, and when a Bronzebeard and a quarry agree, I'll take their word over any tavern scholar's." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    miners = {
      lines = { { id = "miners_default", text = "Ironforge's miners, cutting stone for the city's halls, and some of them nae too pleased to have a League man peerin' over their shoulders. Grothor and Grumnal up north are friendlier than most, if ye fancy a chat." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    troggs = {
      lines = { { id = "troggs_default", text = "They have, and that's the worry nobody wants to say aloud. Troggs come up from deep places when somethin' disturbs them, and the League would very much like to know what that somethin' is." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's nae in my notebook, I'm afraid. Ask at the Hall of Explorers if it's learnin' ye want." } },
  },
}

-- Avarus Kharag: dwarf paladin at Gol'Bolar Quarry.
P:NPC {
  key = "ifu_avarus_kharag", id = TODO_NPC("Avarus Kharag"), name = "Avarus Kharag", gender = "male",
  bible = "bibles/missed_c.md", role = "paladin", tier = "service",
  communities = { "dunmorogh" }, temper = { "stern", "steady" }, values = { "duty", "faith" },
  impression = {
    first = "Avarus Kharag stands watch at Gol'Bolar Quarry in plate that has seen use, his hammer resting on his shoulder. He is a paladin, and he guards the miners as if the Light itself had set him there.",
    third = "{name} met Avarus Kharag, a dwarf paladin standing guard at Gol'Bolar Quarry.",
  },
  greetings = {
    { id = "g_default", text = "The Light keep ye, traveller. Stay clear of the cuttin' face." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again. Still in one piece, I see, and glad of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Avarus Kharag, of the Silver Hand, or what's left of it. The miners here need a strong arm against the troggs, and I'd rather be useful in the snow than idle in a chapel." } },
      again = { { id = "h_again", text = "Speak, friend." }, { id = "h_again2", text = "Aye, what else?" } },
      choices = {
        { text = "What's left of the Silver Hand?", next = "hand" },
        { text = "How bad are the troggs here?", next = "troggs" },
        { text = "I bear the Light as you do.", next = "brother", when = { class = "PALADIN" } },
        { text = "Farewell.", next = "END" },
      },
    },
    hand = {
      lines = { { id = "hand_default", text = "Scattered, I'm sorry to say, since Uther fell and Lordaeron with him. But a paladin's vows don't need a grand master to keep them, and I keep mine here among my own people." } },
      choices = {
        { text = "Do you miss the old Order?", next = "order" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    order = {
      lines = { { id = "order_default", text = "Every day, for there was a brotherhood in it I've not found since. Still, a hammer raised for the weak is the same hammer, whether it's raised in Lordaeron or Dun Morogh." } },
      choices = {
        { text = "The Light needs no Order to work through us.", next = "BACK", reply = "Well said, and it's what keeps me goin' on cold mornings.", fx = { align = { light = 1 } } },
        { text = "Faith without an Order is just a man alone.", next = "BACK", reply = "Perhaps, but a man alone can still hold a gate.", fx = { align = { light = -1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    troggs = {
      lines = { { id = "troggs_default", text = "Bad enough that the miners won't work without a guard, and I can't blame them. The beasts come up out of the rock with no warning, and they don't stop until somethin' stops them." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    brother = {
      lines = { { id = "brother_default", text = "Then we're kin in more than one way, and it gladdens me to see it. Keep your vows close, for the world out there will test them sooner than ye think." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's nae my concern, friend. My concern is the quarry and the folk in it." } },
  },
}

-- Onin MacHammar: watcher on a tower outside Gnomeregan.
P:NPC {
  key = "ifu_onin_machammar", id = TODO_NPC("Onin MacHammar"), name = "Onin MacHammar", gender = "male",
  bible = "bibles/missed_c.md", role = "scout", tier = "service",
  communities = { "dunmorogh" }, temper = { "wry", "guarded" }, values = { "practical", "loyal" },
  impression = {
    first = "Onin MacHammar keeps to the top of a tower outside Gnomeregan, watching the ruined city's gates. He has a soot-dark look about him and an easy grin that never quite reaches his eyes.",
    third = "{name} met Onin MacHammar, keeping watch over Gnomeregan from a tower in Dun Morogh.",
  },
  greetings = {
    { id = "g_default", text = "Climbed all the way up, did ye? Then ye'd best have a reason." },
    { id = "g_back", when = { metBefore = true }, text = "Back for the view? It hasnae improved." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Onin MacHammar, and aye, I've heard what folk whisper about my complexion. I watch Gnomeregan for Ironforge, since somebody has to keep an eye on what crawls out of that hole." } },
      again = { { id = "h_again", text = "Anythin' else, while I've got ye?" }, { id = "h_again2", text = "Ask away, the gates aren't goin' anywhere." } },
      choices = {
        { text = "What crawls out of Gnomeregan?", next = "gnomeregan" },
        { text = "People whisper about your complexion?", next = "skin" },
        { text = "Farewell.", next = "END" },
      },
    },
    gnomeregan = {
      lines = { { id = "gnomeregan_default", text = "Troggs, mostly, and leper gnomes gone half mad from the poison the city's soaked in. Now and then a Dark Iron agent slips past, and those are the ones I'm really here for." } },
      choices = {
        { text = "Dark Irons near Gnomeregan?", next = "darkiron" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    darkiron = {
      lines = { { id = "darkiron_default", text = "Aye, sniffin' about for whatever machines Thermaplugg left behind. Thaurissan's lot would love a weapon to turn on Ironforge, and I'd rather they didnae find one." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    skin = {
      lines = { { id = "skin_default", text = "They do, because I've a touch of soot in the blood from my mother's side, and Ironforge has long memories. I've served the King all my life, but I've stopped waitin' for every dwarf to believe it." } },
      choices = {
        { text = "A dwarf's deeds matter more than his blood.", next = "BACK", reply = "If only more folk below thought as you do.", fx = { align = { honor = 1 } } },
        { text = "After the War of the Three Hammers, can you blame them?", next = "BACK", reply = "No, I cannae, and that's the bitter part of it.", fx = { align = { honor = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Nae idea, friend. I watch gates, I don't read books." } },
  },
}

-- Miner Grothor: miner north of Gol'Bolar Quarry.
P:NPC {
  key = "ifu_miner_grothor", id = TODO_NPC("Miner Grothor"), name = "Miner Grothor", gender = "male",
  bible = "bibles/missed_c.md", role = "miner", tier = "service",
  communities = { "dunmorogh" }, temper = { "gruff", "plain" }, values = { "work", "practical" },
  impression = {
    first = "Miner Grothor works a seam north of Gol'Bolar Quarry, chipping at the rock with a slow, steady swing. He looks up only long enough to judge whether you're likely to get in his way.",
    third = "{name} met Miner Grothor, working a seam north of Gol'Bolar Quarry.",
  },
  greetings = {
    { id = "g_default", text = "Stand back a pace, the chips fly further than ye'd think." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The seam's still here, and so am I." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Grothor, miner, and that's the whole of my story. The quarry's cut for buildin' stone, but up here there's copper and tin in the rock, and I mean to have them out before the snows close the path." } },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Aye, go on." } },
      choices = {
        { text = "Is the seam a good one?", next = "seam" },
        { text = "You work alongside Miner Grumnal?", next = "grumnal" },
        { text = "I mine too. Mind if I take a look?", next = "miner", when = { profession = "Mining" } },
        { text = "Farewell.", next = "END" },
      },
    },
    seam = {
      lines = { { id = "seam_default", text = "Good enough to feed my family and a few of the smiths at the Great Forge. Copper runs green through the grey here, and there's tin under it if ye've the patience to dig." } },
      choices = {
        { text = "Any trouble from the troggs?", next = "troggs" },
        { text = "Honest work in the rock is the best kind.", next = "BACK", reply = "Ye'll get no argument from me.", fx = { align = { order = 1 } } },
        { text = "I'd rather take what I need from the troggs.", next = "BACK", reply = "Ha, then ye'll go hungry more often than I do.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    troggs = {
      lines = { { id = "troggs_default", text = "Some, and Grumnal swears they come up through old tunnels we've not mapped. I keep my pick sharp and my back to the wall, and I'd advise ye to do the same." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    grumnal = {
      lines = { { id = "grumnal_default", text = "Aye, for thirty years, and he's never once let me finish a story. He's a fine miner and a terrible listener, which makes for a quiet partnership most days." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    miner = {
      lines = { { id = "miner_default", text = "Look all ye like, but this seam's spoken for. There's richer veins further north, past the old trogg holes, if ye don't mind company." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldnae say. Ask somebody who spends less time in the rock." } },
  },
}

-- Miner Grumnal: miner north of Gol'Bolar Quarry.
P:NPC {
  key = "ifu_miner_grumnal", id = TODO_NPC("Miner Grumnal"), name = "Miner Grumnal", gender = "male",
  bible = "bibles/missed_c.md", role = "miner", tier = "service",
  communities = { "dunmorogh" }, temper = { "chatty", "gruff" }, values = { "work", "family" },
  impression = {
    first = "Miner Grumnal leans on his pick more than he swings it, and he is glad of any excuse to stop. He has a miner's broad shoulders and a talker's restless mouth.",
    third = "{name} met Miner Grumnal, Grothor's talkative partner on a seam north of Gol'Bolar Quarry.",
  },
  greetings = {
    { id = "g_default", text = "Oh, a visitor! Grothor, look, somebody new to talk to." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, Grothor's run out of things to say, as usual." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Grumnal's the name, and I've been diggin' this mountain since before my beard reached my belt. Don't mind Grothor, he thinks every word spoken is a swing of the pick wasted." } },
      again = { { id = "h_again", text = "What else can I tell ye?" }, { id = "h_again2", text = "Go on, ask, I've nowhere to be." } },
      choices = {
        { text = "Where do the troggs come from?", next = "troggs" },
        { text = "What's Grothor like to work with?", next = "grothor" },
        { text = "Farewell.", next = "END" },
      },
    },
    troggs = {
      lines = { { id = "troggs_default", text = "Old tunnels, older than Ironforge, if ye ask me, and nobody ever does. I've heard them scratchin' behind the rock at night, and I tell ye, it's not a sound ye forget." } },
      choices = {
        { text = "Have you told anyone?", next = "told" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    told = {
      lines = { { id = "told_default", text = "Told the quarry foreman, told the guard, told Grothor three times a day. They all nod and go back to work, so I suppose it'll be me that's proven right when the wall comes down." } },
      choices = {
        { text = "You should keep warning them until they listen.", next = "BACK", reply = "Aye, I will, though my throat's sore from it.", fx = { align = { order = -1 } } },
        { text = "Best leave it to the guards to worry about.", next = "BACK", reply = "Hmph, that's what Grothor says, and look at him.", fx = { align = { order = 1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    grothor = {
      lines = { { id = "grothor_default", text = "Steady as granite, and about as talkative. Mind ye, I'd trust him with my life down a shaft, and I have, twice." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ah, that's nae somethin' I know, and I know a great deal, ask anyone." } },
  },
}

-- Apprentice Soren: apprentice in Coldridge Valley, scouting the Frostmane trolls.
P:NPC {
  key = "ifu_apprentice_soren", id = TODO_NPC("Apprentice Soren"), name = "Apprentice Soren", gender = "male",
  bible = "bibles/missed_c.md", role = "scout", tier = "quest",
  communities = { "coldridge" }, temper = { "eager", "nervous" }, values = { "duty", "learning" },
  impression = {
    first = "Apprentice Soren is young for a dwarf and trying hard not to show it, with a scout's cloak too long for him and a map he keeps unfolding. He has been sent to watch the Frostmane trolls of Coldridge Valley.",
    third = "{name} met Apprentice Soren, a young dwarf scouting the Frostmane trolls in Coldridge Valley.",
  },
  greetings = {
    { id = "g_default", text = "Oh! I thought ye were a troll for a moment. Sorry, it's been a long watch." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did ye see any Frostmane on the way?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Soren, apprentice to the mountaineers, and I'm keepin' watch on the Frostmane trolls. I've been told to learn what they're plannin', which is a great deal easier to say than to do." } },
      again = { { id = "h_again", text = "What else did ye want to know?" }, { id = "h_again2", text = "Sorry, where were we?" } },
      choices = {
        { text = "What are the Frostmane planning?", next = "plans" },
        { text = "Who sent you out here?", next = "sent" },
        { text = "You seem nervous for a scout.", next = "nervous" },
        { text = "I grew up hearing tales of the Frostmane.", next = "tales", when = { race = "Dwarf" } },
        { text = "Farewell.", next = "END" },
      },
    },
    plans = {
      lines = { { id = "plans_default", text = "Raids on the valley, I'd wager, since they've been gatherin' in the caves to the west. Their shamans have been chantin' all night, and that's never meant anything good for a dwarf." } },
      choices = {
        { text = "What do the shamans want?", next = "shamans" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    shamans = {
      lines = { { id = "shamans_default", text = "To drive us out of Coldridge, the way they've wanted since our grandfathers' grandfathers came here. The valley was theirs once, they say, and I suppose they've a point, though I'd never tell the Mountaineers that." } },
      choices = {
        { text = "Do you pity them?", next = "pity" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    pity = {
      lines = { { id = "pity_default", text = "A wee bit, if I'm honest, for they're cold and hungry and losin'. But they killed two of our lads last spring, so my pity has a short leash." } },
      choices = {
        { text = "The valley belongs to whoever can hold it.", next = "BACK", reply = "That's how the mountaineers see it, aye.", fx = { align = { honor = -1 } } },
        { text = "Even trolls deserve a home somewhere.", next = "BACK", reply = "Somewhere, aye, just not here, I hope.", fx = { align = { honor = 1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    sent = {
      lines = { { id = "sent_default", text = "The mountaineers at Anvilmar, who say a scout learns more in a week of watchin' than a month of drills. I think they mostly wanted me out from underfoot." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    nervous = {
      lines = { { id = "nervous_default", text = "Is it that plain? I've only been out here a few weeks, and the snow makes every shadow look like a troll with a spear. I'll get used to it, everyone says so." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    tales = {
      lines = { { id = "tales_default", text = "So did I, and none of them prepared me for the smell of their camps. Still, it's good to talk to someone who knows what we're up against." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Oh, I've no idea, sorry. I'm only an apprentice, they don't tell me much." } },
  },
}

-- Tog Rustsprocket: gnome refugee in Kharanos.
P:NPC {
  key = "ifu_tog_rustsprocket", id = TODO_NPC("Tog Rustsprocket"), name = "Tog Rustsprocket", gender = "male",
  bible = "bibles/missed_c.md", role = "refugee", tier = "service",
  communities = { "kharanos" }, temper = { "anxious", "bright" }, values = { "invention", "family" },
  impression = {
    first = "Tog Rustsprocket sits near the Thunderbrew distillery in Kharanos with a half-mended gadget in his lap. He is one of Gnomeregan's refugees, and he has not stopped tinkering since the day he fled.",
    third = "{name} met Tog Rustsprocket, a gnome refugee from Gnomeregan living in Kharanos.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello! Careful, that spring is under roughly forty pounds of tension." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Good, I could use a second pair of hands, figuratively." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Tog Rustsprocket, formerly of Gnomeregan's third pneumatics division, currently of a bench in Kharanos. The dwarves have been very kind, though I do miss having a ceiling that isn't made of snow." } },
      again = { { id = "h_again", text = "What else can I tell you?" }, { id = "h_again2", text = "Sorry, I was calibrating, go on." } },
      choices = {
        { text = "What happened to Gnomeregan?", next = "fall" },
        { text = "What are you building?", next = "gadget" },
        { text = "I made it out of Gnomeregan too.", next = "kin", when = { race = "Gnome" } },
        { text = "Farewell.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "fall_default", text = "Troggs came up from below, and then Mekkatorque flooded the city with radiation to stop them, on Thermaplugg's advice. It worked on the troggs, partly, and on about four in five of us as well." } },
      choices = {
        { text = "Did your family make it out?", next = "family" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "family_default", text = "My sister did, and she's in Tinker Town now, building a better lock for every door she owns. My cousins didn't, and I try not to do that arithmetic too often." } },
      choices = {
        { text = "Gnomeregan will be taken back someday.", next = "BACK", reply = "I like to think so, and Mekkatorque says so every week.", fx = { align = { order = 1 } } },
        { text = "That city's a tomb now. Build something new.", next = "BACK", reply = "Maybe you're right, though it hurts to hear it.", fx = { align = { order = -1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    gadget = {
      lines = { { id = "gadget_default", text = "A pocket heater, because Kharanos is twelve degrees colder than any gnome was designed for. Version four has stopped catching fire, which is a seventy percent improvement over version three." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "kin_default", text = "Then we're two of the lucky ones, and lucky's a strange word for it. Find me in Tinker Town sometime, we survivors ought to compare notes." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Hmm, that's outside my area of expertise, which is mostly springs." } },
  },
}

-- Bubulo Acerbus: Gnomeregan Exiles cloth quartermaster in Tinker Town.
P:NPC {
  key = "ifu_bubulo_acerbus", id = TODO_NPC("Bubulo Acerbus"), name = "Bubulo Acerbus", title = "Alliance Cloth Quartermaster", gender = "male",
  bible = "bibles/missed_c.md", role = "quartermaster", tier = "quest",
  communities = { "ironforge" }, temper = { "fussy", "warm" }, values = { "community", "practical" },
  impression = {
    first = "Bubulo Acerbus keeps careful ledgers of donated cloth in Tinker Town, with each bolt measured, weighed and labelled. He collects for the Gnomeregan Exiles, who arrived in Ironforge with little more than the clothes they fled in.",
    third = "{name} met Bubulo Acerbus, who collects cloth for the Gnomeregan Exiles in Tinker Town.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, welcome! Are you carrying any wool by chance?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a returning donor! Or a prospective one, which is nearly as good." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("A Donation of Wool") }, text = "Wool is wonderfully warm, and we're still short. Every bolt counts, really." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("A Donation of Wool") }, tags = { "news" }, text = "Your wool is already being stitched into blankets, and the children in the lower workshops won't shiver tonight." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Bubulo Acerbus, cloth quartermaster for the Gnomeregan Exiles. Our people came out of the city with nothing, so I collect wool and silk and turn them into blankets, coats and a little dignity." } },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "Any other questions? I do love questions." } },
      choices = {
        { text = "Why does Tinker Town need cloth?", next = "why" },
        { text = "Do you collect silk as well?", next = "silk" },
        { text = "Your ledgers are very tidy.", next = "ledgers" },
        { text = "I came from Gnomeregan too. What can I do?", next = "exile", when = { race = "Gnome" } },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Because a gnome can rebuild a workshop in a week, but a winter coat takes a seamstress and a bolt of wool. Ironforge has been generous with stone, and stone makes a very cold blanket." } },
      choices = {
        { text = "How many refugees are there?", next = "count" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    count = {
      lines = { { id = "count_default", text = "Fewer than there should be, and more than Tinker Town has beds for. I count them every week, and the number goes down only when someone finds work outside the city." } },
      choices = {
        { text = "Does the count ever go up?", next = "up" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    up = {
      lines = { { id = "up_default", text = "Now and then, when someone wanders in from the snow who we thought was lost. Those are the days I remember why I keep the ledgers at all." } },
      choices = {
        { text = "Every soul saved is worth the trouble.", next = "BACK", reply = "Exactly, exactly, and I'll write that in the margin.", fx = { align = { light = 1 } } },
        { text = "Better to spend on the living than the lost.", next = "BACK", reply = "A practical view, though not one I can share.", fx = { align = { light = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    silk = {
      lines = { { id = "silk_default", text = "Silk, yes, for the finer work, the linings and the bandages our engineers will insist on needing. Wool for warmth, silk for everything else, that's my rule." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ledgers = {
      lines = { { id = "ledgers_default", text = "Thank you, you're very kind, and very observant. A tidy ledger is the only thing standing between a fair distribution and a riot, and I'd much rather have the former." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    exile = {
      lines = { { id = "exile_default", text = "Bring cloth, of course, but also come by the workshops and say hello. Our people need to see that some of us are out there making a life, not just surviving." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Oh dear, that's not in my ledgers. Perhaps ask one of the engineers?" } },
  },
}

-- Wizbang Booms: gnome fireworks vendor for the Midsummer festival.
P:NPC {
  key = "ifu_wizbang_booms", id = TODO_NPC("Wizbang Booms"), name = "Wizbang Booms", title = "Holiday Fireworks Vendor", gender = "male",
  bible = "bibles/missed_c.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "excitable", "cheerful" }, values = { "invention", "joy" },
  impression = {
    first = "Wizbang Booms sells fireworks out of a crate stencilled with warnings that he has crossed out by hand. His eyebrows are slightly singed, and he seems proud of it.",
    third = "{name} met Wizbang Booms, a gnome who sells holiday fireworks in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Fireworks! Festive, colourful and only occasionally structural!" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I knew you had a spark in you!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Wizbang Booms, pyrotechnician, at your service and slightly at your risk. Every rocket in this crate has been hand-tested by me, which is why I'm standing a little further from it than you are." } },
      again = { { id = "h_again", text = "What else can I light up for you?" }, { id = "h_again2", text = "Questions? Excellent, I have answers and matches." } },
      choices = {
        { text = "Are these fireworks safe?", next = "safe" },
        { text = "Why sell fireworks in Ironforge?", next = "why" },
        { text = "Farewell.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "safe_default", text = "Safe is a relative term, and relative to most gnomish inventions they're practically a pillow. Light the fuse, step back three paces, then step back three more, and you'll keep both eyebrows." } },
      choices = {
        { text = "Have you lost eyebrows before?", next = "brows" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    brows = {
      lines = { { id = "brows_default", text = "Eleven times, which is roughly once per new formula. They grow back, and the colours I discovered were worth every hair." } },
      choices = {
        { text = "Discovery is worth a few burns.", next = "BACK", reply = "Spoken like a true tinker!", fx = { align = { order = -1 } } },
        { text = "Someone ought to regulate you.", next = "BACK", reply = "Someone has tried, and their eyebrows are gone too.", fx = { align = { order = 1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Because the dwarves celebrate loudly and the ceiling is very high, which is a wonderful combination. Midsummer's my busiest season, and the guards have nearly stopped glaring at me." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No idea, but if you find out, tell me whether it explodes." } },
  },
}

-- Corporal Carnes: human soldier collecting iron bars for the Ahn'Qiraj war effort.
P:NPC {
  key = "ifu_corporal_carnes", id = TODO_NPC("Corporal Carnes"), name = "Corporal Carnes", title = "Iron Bar Collector", gender = "male",
  bible = "bibles/missed_c.md", role = "soldier", tier = "quest",
  communities = { "ironforge" }, temper = { "brisk", "earnest" }, values = { "duty", "practical" },
  impression = {
    first = "Corporal Carnes stands in the Military Ward beside a growing stack of iron bars, ticking them off a list with a stub of charcoal. He is a human soldier who seems happy to be anywhere with a roof.",
    third = "{name} met Corporal Carnes, who collects iron bars for the Alliance war effort in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Iron, friend! The army runs on it, so do you have any?" },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again. The stack's taller, thanks to folk like you." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("The Alliance Needs Iron Bars!") }, text = "Still gathering those bars? The smiths will melt down every one you bring." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("The Alliance Needs Iron Bars!") }, tags = { "news" }, text = "Your iron's already gone to the smiths, and it'll be a soldier's breastplate by the end of the week." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Corporal Carnes, collecting iron bars for the war effort. The Field Marshal says the army marching south will need more steel than Ironforge has ever forged, and I believe him." } },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "Go on, I can count and talk at once." } },
      choices = {
        { text = "What war is this for?", next = "war" },
        { text = "How many bars do you need?", next = "count" },
        { text = "You're a long way from Stormwind.", next = "home" },
        { text = "I could smelt some bars for you.", next = "miner", when = { profession = "Mining" } },
        { text = "Farewell.", next = "END" },
      },
    },
    war = {
      lines = { { id = "war_default", text = "Silithus, in the far south of Kalimdor, where something is stirring under the desert. The Cenarion Circle sent word, and the Alliance means to be ready when the gates open." } },
      choices = {
        { text = "What's behind the gates?", next = "gates" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    gates = {
      lines = { { id = "gates_default", text = "Insects, they say, the size of houses and organised like an army. I've never seen one, and I'd be content to keep it that way, though I don't expect I'll be asked." } },
      choices = {
        { text = "Will you march south?", next = "march" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    march = {
      lines = { { id = "march_default", text = "If they call me, aye, and I expect they will. I'd rather go with good iron on my chest, which is why I'm so particular about this stack." } },
      choices = {
        { text = "The Alliance must stand together for this.", next = "BACK", reply = "Aye, that's the spirit the Marshal wants to hear.", fx = { align = { honor = 1 } } },
        { text = "Let the elves fight their own war in Kalimdor.", next = "BACK", reply = "Plenty say that, but the bugs won't stop at Kalimdor.", fx = { align = { honor = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    count = {
      lines = { { id = "count_default", text = "More than you'd believe, and the number on my list gets bigger every time the Field Marshal reads it. Every mine in Khaz Modan is working day and night." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "home_default", text = "I am, and the ale's better here, so I've no complaints. The war effort gathers at Ironforge because the forges are here, so here I stand." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    miner = {
      lines = { { id = "miner_default", text = "Then you're worth your weight in ore, and I mean that. Smelt as many as you can, and bring them straight to me." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask the Field Marshal, he knows everything, or says he does." } },
  },
}

-- Melnan Darkstone: dwarf barker for the Darkmoon Faire in the Commons.
P:NPC {
  key = "ifu_melnan_darkstone", id = TODO_NPC("Melnan Darkstone"), name = "Melnan Darkstone", title = "Darkmoon Faire Barker", gender = "male",
  bible = "bibles/missed_c.md", role = "barker", tier = "quest",
  communities = { "ironforge" }, temper = { "loud", "cheerful" }, values = { "joy", "trade" },
  impression = {
    first = "Melnan Darkstone walks the Commons calling out the Darkmoon Faire's wonders in a voice that could fill a mine shaft. He wears the Faire's colours over a dwarf's sturdy frame.",
    third = "{name} met Melnan Darkstone, who announces the Darkmoon Faire in Ironforge's Commons.",
  },
  greetings = {
    { id = "g_default", text = "Step right up, step right up! The Darkmoon Faire has come to town!" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a familiar face! Have ye seen the Faire yet, or are ye savin' it?" },
    { id = "g_qactive", when = { questActive = TODO_QUEST("The Darkmoon Faire") }, text = "Off to the Faire with ye! Silas Darkmoon is waitin', and so are the games." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("The Darkmoon Faire") }, tags = { "news" }, text = "So ye've seen it! Didnae I tell ye there's nothin' like it in all the world?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Melnan Darkstone, barker for the Darkmoon Faire! Wonders, prizes, games of skill and chance, all a short walk out of the city, and ye'd be daft to miss them." } },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "More questions? I'm a barker, I love questions." } },
      choices = {
        { text = "Where is the Faire set up?", next = "where" },
        { text = "What can I win at the Faire?", next = "prizes" },
        { text = "You've got a voice for a barker.", next = "voice" },
        { text = "A gnome running a faire? I've never heard of him.", next = "gnome", when = { race = "Gnome" } },
        { text = "Fortune tellers at a faire? I trust only the Light.", next = "fortune", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Farewell.", next = "END" },
      },
    },
    where = {
      lines = { { id = "where_default", text = "Out past the gates when it's our turn in Khaz Modan, in the field by Kharanos, though it travels where it pleases. Silas Darkmoon decides the road, and nobody knows how he chooses." } },
      choices = {
        { text = "Who is Silas Darkmoon?", next = "silas" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    silas = {
      lines = { { id = "silas_default", text = "The master of the Faire, a gnome with a top hat and a grin, and a mystery even to those who work for him. He pays on time, which is more than I can say for some." } },
      choices = {
        { text = "What's the mystery about him?", next = "mystery" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    mystery = {
      lines = { { id = "mystery_default", text = "Nobody remembers the Faire startin', and nobody's ever seen Silas age a day. I don't ask, because the pay's good and the ale's free." } },
      choices = {
        { text = "Some mysteries are best left alone.", next = "BACK", reply = "Wise, and the ale's better when ye're not thinkin'.", fx = { align = { order = 1 } } },
        { text = "I'd want to know who I worked for.", next = "BACK", reply = "Aye, well, ye'd be the first to find out.", fx = { align = { order = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    prizes = {
      lines = { { id = "prizes_default", text = "Tickets for games and turn-ins, and tickets for prizes ye won't find in any shop in Ironforge. Bring the Faire some leather or some gears and ye'll walk away with a fistful." } },
      choices = {
        { text = "What sort of games?", next = "games" },
        { text = "Something else.", next = "BACK" },
      },
    },
    voice = {
      lines = { { id = "voice_default", text = "Forty years of shoutin' down a mine shaft will do that, and I'm far happier shoutin' about prizes. The Faire took me on in Thelsamar and I never looked back." } },
      choices = {
        { text = "Don't you miss the mines?", next = "mines" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    games = {
      lines = { { id = "games_default", text = "Tonk battles for the tinkerers, a cannon that'll fire ye clear across the field if ye're brave enough, and a fortune teller who'll tell ye things ye didnae want to know. The cannon's my favourite, though I've never had the beard for it myself." } },
      choices = {
        { text = "A cannon? That's madness, and I'm in.", next = "BACK", reply = "Ha! That's the spirit, and bring a helmet!", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mines = {
      lines = { { id = "mines_default", text = "I miss the lads, and the songs, and the smell of a fresh seam, but I don't miss the cave-ins or the troggs. A man can only shout 'Mind yer head!' so many times before he'd rather shout somethin' cheerful." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gnome_default", text = "Never heard of him? He's the most famous gnome there is, after the High Tinker, though I'll grant ye he never seems to visit Tinker Town. Ask him about Gnomeregan sometime and watch him change the subject faster than a goblin counts coin." } },
      choices = { { text = "I just might. Something else.", next = "BACK" } },
    },
    fortune = {
      lines = { { id = "fortune_default", text = "And so ye should, but Sayge's only a fortune teller, and the Light won't mind a bit of fun on a holiday. Mind ye, he asks some strange questions, so answer them honest or not at all." } },
      choices = {
        { text = "Fortune telling is harmless fun.", next = "BACK", reply = "That's how I see it, aye.", fx = { align = { light = -1 } } },
        { text = "Tampering with fate is no game.", next = "BACK", reply = "Hmph. Ye're no fun at all, but ye're probably right.", fx = { align = { light = 1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Nae idea, but ye'll find someone at the Faire who'll sell ye the answer!" } },
  },
}

-- Master Sergeant Fizzlebolt: gnome sergeant tallying the Ahn'Qiraj war effort in Ironforge.
P:NPC {
  key = "ifu_fizzlebolt", id = TODO_NPC("Master Sergeant Fizzlebolt"), name = "Master Sergeant Fizzlebolt", gender = "male",
  bible = "bibles/missed_c.md", role = "soldier", tier = "quest",
  communities = { "ironforge" }, temper = { "precise", "brisk" }, values = { "duty", "order" },
  impression = {
    first = "Master Sergeant Fizzlebolt keeps the war effort's tallies on a board taller than he is, climbing a stepladder to update each figure. He reports to Field Marshal Snowfall and takes the numbers personally.",
    third = "{name} met Master Sergeant Fizzlebolt, who tracks the Alliance war effort in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Report! Er, that is, hello. Do you have supplies for the effort?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The figures are up two point four percent since your last visit." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Master Sergeant Fizzlebolt, logistics and tallies for the Alliance war effort. Every bar, bandage and fish brought to the Military Ward is counted by me, personally, twice." } },
      again = { { id = "h_again", text = "What else? Be brief, I'm mid-calculation." }, { id = "h_again2", text = "Go on, the numbers can wait a moment." } },
      choices = {
        { text = "How is the war effort going?", next = "tally" },
        { text = "What are all these supplies for?", next = "supplies" },
        { text = "You take the numbers personally.", next = "personal" },
        { text = "Any gnomish engineers marching south?", next = "engineers", when = { race = "Gnome" } },
        { text = "Farewell.", next = "END" },
      },
    },
    tally = {
      lines = { { id = "tally_default", text = "Steadily, though copper is ahead of schedule and lotus is embarrassingly behind. The Horde is collecting too, and I would very much like us to finish first." } },
      choices = {
        { text = "It's a race with the Horde?", next = "race" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    race = {
      lines = { { id = "race_default", text = "Not officially, but the Field Marshal reads their tallies every morning with a very particular expression. General Zog brings them, which is another thing the Marshal has an expression about." } },
      choices = {
        { text = "Is Zog trustworthy?", next = "zog" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    zog = {
      lines = { { id = "zog_default", text = "He's an orc, and a diplomat, so I trust his numbers and not his smile. The Horde has as much to lose in the south as we do, which is the only reason any of this works." } },
      choices = {
        { text = "We should trust the Horde in this.", next = "BACK", reply = "A bold position, and you'll be outnumbered in this ward.", fx = { align = { honor = 1 } } },
        { text = "I wouldn't trust an orc with a ledger.", next = "BACK", reply = "Neither does the Marshal, but he reads it anyway.", fx = { align = { honor = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    supplies = {
      lines = { { id = "supplies_default", text = "An army, to march on Ahn'Qiraj in Silithus once the gates are opened. Armies run on bandages and fish more than on speeches, whatever the bards tell you." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    personal = {
      lines = { { id = "personal_default", text = "Numbers are the only part of a war that never lies to you. I'd rather know we're short of leather today than find out at the gates." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    engineers = {
      lines = { { id = "engineers_default", text = "Quite a few, and more volunteering every day, mostly for the chance to study the insects. I've told them it's a war, not a field trip, and they've written that down." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's not on my board, and if it's not on my board it doesn't exist." } },
  },
}

-- Macey Jinglepocket: goblin Winter Veil vendor in the Commons.
P:NPC {
  key = "ifu_macey_jinglepocket", id = TODO_NPC("Macey Jinglepocket"), name = "Macey Jinglepocket", title = "Smokywood Pastures", gender = "female",
  bible = "bibles/missed_c.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "pushy", "cheerful" }, values = { "trade", "joy" },
  impression = {
    first = "Macey Jinglepocket runs the finer end of Smokywood Pastures' Winter Veil stall, with ribbons on every crate and a price on every ribbon. She smiles at you like a ledger she has already balanced.",
    third = "{name} met Macey Jinglepocket of Smokywood Pastures, selling Winter Veil goods in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Happy Winter Veil, sweetheart! Everything's festive, and everything's for sale!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, pal? I knew you'd come round to the deluxe selection." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Macey Jinglepocket, Smokywood Pastures, premium holiday division. Wulmort sells the cheap stuff over there, and I sell the stuff people actually remember, at a price they'll also remember." } },
      again = { { id = "h_again", text = "What else can I wrap for ya?" }, { id = "h_again2", text = "Go on, ask, the meter's not running. Yet." } },
      choices = {
        { text = "What is Smokywood Pastures?", next = "company" },
        { text = "Why is your stock dearer than Wulmort's?", next = "price" },
        { text = "Farewell.", next = "END" },
      },
    },
    company = {
      lines = { { id = "company_default", text = "Only the finest holiday outfitter in Azeroth, pal, sellin' Winter Veil cheer to Horde and Alliance alike. Greatfather Winter brings the presents, and we bring the wrapping paper, at a very fair margin." } },
      choices = {
        { text = "You sell to the Horde too?", next = "horde" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "horde_default", text = "Course we do, cheer doesn't care what colour your tabard is, and neither does gold. Orgrimmar's got a stall just like this one, and the snow there's mostly sand." } },
      choices = {
        { text = "Goods should be sold to anyone who can pay.", next = "BACK", reply = "Now that's a customer after my own heart!", fx = { align = { order = -1 } } },
        { text = "You shouldn't be trading with the enemy.", next = "BACK", reply = "Enemy? Pal, they're just customers who smell different.", fx = { align = { order = 1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    price = {
      lines = { { id = "price_default", text = "Because it's better, sweetheart, and because Wulmort can't tell a velvet ribbon from a bootlace. You pay for quality, and quality pays for my retirement." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Never heard of it, and if I can't sell it, I don't need to." } },
  },
}

-- Wulmort Jinglepocket: goblin Winter Veil vendor and Smokywood Pastures' resources director.
P:NPC {
  key = "ifu_wulmort_jinglepocket", id = TODO_NPC("Wulmort Jinglepocket"), name = "Wulmort Jinglepocket", title = "Smokywood Pastures", gender = "male",
  bible = "bibles/missed_c.md", role = "vendor", tier = "quest",
  communities = { "ironforge" }, temper = { "harried", "cheerful" }, values = { "trade", "joy" },
  impression = {
    first = "Wulmort Jinglepocket waves a list of Winter Veil specials at anyone who passes, wearing a festive hat at a slightly desperate angle. He is the goblin in charge of Smokywood Pastures' cheaper goods and most of its paperwork.",
    third = "{name} met Wulmort Jinglepocket of Smokywood Pastures, who announces Greatfather Winter's arrival in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Season's greetings, friend! Greatfather Winter's here, and so are my specials!" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you're back! Did you meet the big man yet?" },
    { id = "g_qactive", when = { questActive = TODO_QUEST("Greatfather Winter is Here!") }, text = "Go on, go see him! The big fellow's by the tree, and he's got presents for good kids, and I'm told for you." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("Greatfather Winter is Here!") }, tags = { "news" }, text = "You met him, huh? Lovely fella, terrible negotiator, which is great for business." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Wulmort Jinglepocket, Goblin Resources Director for Smokywood Pastures, which means I do everything nobody else wants to. Right now that means sellin' cookies and tellin' everybody Greatfather Winter's in town." } },
      again = { { id = "h_again", text = "What else, buddy?" }, { id = "h_again2", text = "Listen, listen, I've got a minute, ask away." } },
      choices = {
        { text = "Who is Greatfather Winter?", next = "winter" },
        { text = "What's a Goblin Resources Director?", next = "job" },
        { text = "You look tired.", next = "tired" },
        { text = "Ironforge celebrates Winter Veil louder than anywhere.", next = "dwarves", when = { race = "Dwarf" } },
        { text = "Do the Horde get Greatfather Winter too?", next = "horde", when = { faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    winter = {
      lines = { { id = "winter_default", text = "The spirit of the season, pal, big beard, red coat, brings presents to the deserving and coal to the rest. I don't ask where he comes from, I just sell cocoa to the folks who line up to see him." } },
      choices = {
        { text = "Is he really a spirit?", next = "spirit" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    spirit = {
      lines = { { id = "spirit_default", text = "Between you and me, I've seen him eat six cookies in a row, so if he's a spirit he's a hungry one. The company handles his contract, and believe me, the small print is enormous." } },
      choices = {
        { text = "What's in the small print?", next = "print" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    print = {
      lines = { { id = "print_default", text = "That'd be confidential, friend, but let's just say Smokywood gets the cocoa concession in perpetuity. Very good deal, very good deal." } },
      choices = {
        { text = "Even holidays need a good contract.", next = "BACK", reply = "Ha! You're gonna go far, kid.", fx = { align = { order = 1 } } },
        { text = "You've turned a holiday into a business.", next = "BACK", reply = "Turned? Pal, it was always a business, I just do the books.", fx = { align = { order = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    job = {
      lines = { { id = "job_default", text = "It means when the reindeer chew the inventory, it's my problem, and when Macey wants a raise, also my problem. I'm basically the company's whole complaint department." } },
      choices = {
        { text = "What's the worst complaint you've had?", next = "complaint" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tired = {
      lines = { { id = "tired_default", text = "Tired? Sweetheart, it's Winter Veil, I haven't slept since the first snow. I'll rest when the season's over and the ledgers balance, so probably never." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    complaint = {
      lines = { { id = "complaint_default", text = "Some field agent of ours got himself buried in a snowdrift up in Alterac and filed a grievance from inside it, if you can believe that. I've got the paperwork right here, and it's very damp." } },
      choices = {
        { text = "You should send someone to dig him out.", next = "BACK", reply = "And pay for a shovel? Fine, fine, I'll think about it, Mister Generous.", fx = { align = { light = 1 } } },
        { text = "He'll dig himself out. That's good business.", next = "BACK", reply = "See, you get it! Initiative, that's what I pay him for.", fx = { align = { light = -1 } } },
      },
    },
    dwarves = {
      lines = { { id = "dwarves_default", text = "Louder, thirstier and better at buyin', bless every beard in this city. I move more Winter Veil brew here in a week than I do in Orgrimmar all season, and don't tell my Orgrimmar guy I said so." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    horde = {
      lines = { { id = "horde_default", text = "Sure they do, pal, he's in Orgrimmar right now, same beard, same coat, same appetite for cookies. Smokywood don't pick sides, we just pick pockets, politely and with a receipt." } },
      choices = { { text = "Very neutral of you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No clue, but if you find out, there might be a market for it." } },
  },
}

-- Lylandris: Silverwing Sentinel battlemaster in the Hall of Arms.
P:NPC {
  key = "ifu_lylandris", id = TODO_NPC("Lylandris"), name = "Lylandris", title = "Warsong Gulch Battlemaster", gender = "female",
  bible = "bibles/missed_c.md", role = "battlemaster", tier = "service",
  communities = { "ironforge" }, temper = { "cold", "proud" }, values = { "duty", "nature" },
  impression = {
    first = "Lylandris stands in the Hall of Arms with a Silverwing Sentinel's bearing, as out of place among the dwarves as a moonwell in a forge. She recruits for the fight at Warsong Gulch.",
    third = "{name} met Lylandris, who recruits for the Silverwing Sentinels in Ironforge's Hall of Arms.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Have you come to fight for Ashenvale?" },
    { id = "g_back", when = { metBefore = true }, text = "You return. The Warsong are still cutting our trees." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Lylandris of the Silverwing Sentinels. The Warsong orcs are tearing at the edge of Ashenvale, and I am gathering those willing to stop them at the gulch." } },
      again = { { id = "h_again", text = "Speak." }, { id = "h_again2", text = "What else would you ask of me?" } },
      choices = {
        { text = "What happens at Warsong Gulch?", next = "gulch" },
        { text = "Why recruit in Ironforge?", next = "ironforge" },
        { text = "Farewell.", next = "END" },
      },
    },
    gulch = {
      lines = { { id = "gulch_default", text = "The Warsong clan cuts our forest for their war, and we take back what we can, banner by banner. It is a small war in a narrow place, and it has cost us many sisters." } },
      choices = {
        { text = "Why fight over one valley?", next = "why" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Because every tree they fell is one our grandmothers saw planted, and because if we yield one valley they will take the next. The forest remembers who defended it." } },
      choices = {
        { text = "Ashenvale must be defended.", next = "BACK", reply = "Then Elune walks with you.", fx = { align = { honor = 1 } } },
        { text = "The orcs need wood to live, as you do.", next = "BACK", reply = "Then let them take it from their own land.", fx = { align = { honor = -1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    ironforge = {
      lines = { { id = "ironforge_default", text = "Because the dwarves are fierce, and stubborn, and owe us nothing, yet many of them come anyway. Elune does not ask which forest a warrior was born in." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know nothing of that. Ask one of the dwarves." } },
  },
}

-- Keeper Moonshade: night elf collecting runecloth bandages for the war effort.
P:NPC {
  key = "ifu_keeper_moonshade", id = TODO_NPC("Keeper Moonshade"), name = "Keeper Moonshade", title = "Runecloth Bandage Collector", gender = "male",
  bible = "bibles/missed_c.md", role = "quartermaster", tier = "quest",
  communities = { "ironforge" }, temper = { "calm", "remote" }, values = { "duty", "patient" },
  impression = {
    first = "Keeper Moonshade waits in the Military Ward among crates of bandages, his robes a deep violet against the forge glow. He collects runecloth bandages for the war effort with the patience of someone who has seen many wars.",
    third = "{name} met Keeper Moonshade, who collects runecloth bandages for the Alliance war effort in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Elune-adore. Do you bring bandages for the wounded to come?" },
    { id = "g_back", when = { metBefore = true }, text = "You return. The crates are fuller, but not yet full." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("The Alliance Needs Runecloth Bandages!") }, text = "The bandages will be needed, sooner than the young ones believe. Bring what you can." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("The Alliance Needs Runecloth Bandages!") }, tags = { "news" }, text = "Your bandages are packed and labelled. Each one is a soldier who may yet come home." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Keeper Moonshade, and I gather runecloth bandages for the army that will march to Silithus. My people have fought the qiraji before, long ago, and I remember what that war cost." } },
      again = { { id = "h_again", text = "What else would you know?" }, { id = "h_again2", text = "Ask, and I will answer." } },
      choices = {
        { text = "You fought the qiraji before?", next = "before" },
        { text = "Why bandages, rather than swords?", next = "bandages" },
        { text = "You seem out of place among the dwarves.", next = "place" },
        { text = "I've trained in first aid.", next = "aid", when = { profession = "First Aid" } },
        { text = "Farewell.", next = "END" },
      },
    },
    before = {
      lines = { { id = "before_default", text = "My people did, a thousand years ago, when the insects swarmed out of the desert and Fandral's son fell before the walls. The Scarab Wall held them then, and the wall is weakening now." } },
      choices = {
        { text = "Fandral's son fell there?", next = "valstann" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    valstann = {
      lines = { { id = "valstann_default", text = "Valstann Staghelm, yes, and the Arch Druid has never spoken of it since. Do not ask him, if you value his good opinion." } },
      choices = {
        { text = "Will this war end differently?", next = "differently" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    differently = {
      lines = { { id = "differently_default", text = "Perhaps, if the younger races bring as many bandages as they do bravado. I have hope, which is more than I had a thousand years ago." } },
      choices = {
        { text = "The younger races will prove themselves.", next = "BACK", reply = "I hope you are right, little one.", fx = { align = { honor = 1 } } },
        { text = "Wars are won by strength, not hope.", next = "BACK", reply = "Strength without hope breaks first, in my experience.", fx = { align = { honor = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    bandages = {
      lines = { { id = "bandages_default", text = "Swords end lives, and bandages keep them, and a war is lost by whichever side runs out of living first. The dwarves forge enough swords for all of us." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    place = {
      lines = { { id = "place_default", text = "I am, and they are kind enough not to say so. Ironforge is where the effort gathers, and my duty goes where the effort goes." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    aid = {
      lines = { { id = "aid_default", text = "Then your hands are worth more to this war than a dozen eager swords. Wrap them tight, and wrap them clean." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is not something I can help you with. The Field Marshal may know." } },
  },
}

-- Master Nightsong: night elf collecting purple lotus for the war effort.
P:NPC {
  key = "ifu_master_nightsong", id = TODO_NPC("Master Nightsong"), name = "Master Nightsong", title = "Purple Lotus Collector", gender = "male",
  bible = "bibles/missed_c.md", role = "quartermaster", tier = "quest",
  communities = { "ironforge" }, temper = { "dry", "measured" }, values = { "knowledge", "duty" },
  impression = {
    first = "Master Nightsong sorts dried purple lotus by colour and scent at his station in the Military Ward. He is a night elf of quiet authority, and he handles each flower as if it might bruise.",
    third = "{name} met Master Nightsong, who collects purple lotus for the Alliance war effort in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Have you brought lotus, or only curiosity?" },
    { id = "g_back", when = { metBefore = true }, text = "You return. I hope the fields were generous." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("The Alliance Needs Purple Lotus!") }, text = "Lotus is the slowest of our collections, I am sorry to say. Search the hills of the Hinterlands and the Feralas jungles." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("The Alliance Needs Purple Lotus!") }, tags = { "news" }, text = "Your lotus is already in the alchemists' hands. Thank you, truly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Master Nightsong, and I gather purple lotus for the alchemists who will brew the army's potions. It is a scarce flower, and the war has made it scarcer still." } },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "I am listening." } },
      choices = {
        { text = "Where does purple lotus grow?", next = "where" },
        { text = "Is the collection going well?", next = "going" },
        { text = "You handle the flowers very gently.", next = "gentle" },
        { text = "I'm an herbalist. Any advice for finding lotus?", next = "herb", when = { profession = "Herbalism" } },
        { text = "Farewell.", next = "END" },
      },
    },
    where = {
      lines = { { id = "where_default", text = "In warm, wild places, the jungles of Stranglethorn and Feralas and the high valleys of the Hinterlands. It hides among other plants, and an impatient picker will crush more than he gathers." } },
      choices = {
        { text = "Why is it so precious?", next = "precious" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    precious = {
      lines = { { id = "precious_default", text = "Its oils bind a potion's strength so that it does not fade in the desert heat. Without it, a healing draught carried to Silithus would be water by the time it was needed." } },
      choices = {
        { text = "You know a great deal about alchemy.", next = "alchemy" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    alchemy = {
      lines = { { id = "alchemy_default", text = "I have had many centuries to learn it, and I am still a student. The dwarves think me slow, but I have never once ruined a batch." } },
      choices = {
        { text = "Patience is the greatest skill of all.", next = "BACK", reply = "Then you will make a fine herbalist someday.", fx = { align = { order = 1 } } },
        { text = "Some things need doing quickly, not perfectly.", next = "BACK", reply = "Some things, yes, but never potions.", fx = { align = { order = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    going = {
      lines = { { id = "going_default", text = "Poorly, if I am honest, for lotus cannot be smelted or sewn. The Sergeant's copper pile mocks me daily from across the ward." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gentle = {
      lines = { { id = "gentle_default", text = "A bruised petal loses half its oil before it reaches the vial. Gentleness is not a virtue here, merely good practice." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    herb = {
      lines = { { id = "herb_default", text = "Look where the ground is wet and shaded, near old ruins especially. The lotus favours places that have been left alone a long time." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I cannot help you with that. Perhaps the Sergeant would know." } },
  },
}

-- Donal Osgood: League of Arathor battlemaster in the Hall of Arms.
P:NPC {
  key = "ifu_donal_osgood", id = TODO_NPC("Donal Osgood"), name = "Donal Osgood", title = "Arathi Basin Battlemaster", gender = "male",
  bible = "bibles/missed_c.md", role = "battlemaster", tier = "service",
  communities = { "ironforge" }, temper = { "earnest", "proud" }, values = { "duty", "honor" },
  impression = {
    first = "Donal Osgood wears the League of Arathor's colours in the Hall of Arms, a human far from home with Stromgarde in his voice. He recruits fighters for Arathi Basin.",
    third = "{name} met Donal Osgood, who recruits for the League of Arathor in Ironforge's Hall of Arms.",
  },
  greetings = {
    { id = "g_default", text = "For Arathor! Have you come to fight for the basin?" },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again. The Defilers haven't yet given up, and neither have we." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Donal Osgood, of the League of Arathor. Arathi Basin was once the breadbasket of Stromgarde, and the Forsaken's Defilers mean to take it, so we mean to take it first." } },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "Go on, I've time." } },
      choices = {
        { text = "What's in Arathi Basin?", next = "basin" },
        { text = "Is Stromgarde your home?", next = "home" },
        { text = "Farewell.", next = "END" },
      },
    },
    basin = {
      lines = { { id = "basin_default", text = "Farms, mines, a lumber mill and a blacksmith, the things a kingdom needs to stand. Whoever holds them feeds the highlands, and the Defilers would rather poison them than share." } },
      choices = {
        { text = "Who are the Defilers?", next = "defilers" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    defilers = {
      lines = { { id = "defilers_default", text = "The Forsaken's soldiers in Arathi, sent by the Dark Lady to claim the basin for Undercity. They want the land dead, and the dead do not need to farm." } },
      choices = {
        { text = "The basin should be free for its own people.", next = "BACK", reply = "Aye, that's what we fight for.", fx = { align = { honor = 1 } } },
        { text = "Farms are worth less than a good war.", next = "BACK", reply = "Tell that to a hungry man in Refuge Pointe.", fx = { align = { honor = -1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "home_default", text = "It was, before the troll and the ogres and the Syndicate took most of it. I mean to see my grandchildren walk its streets, and the basin is the first step." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Can't say. Arathor's my business, and that isn't Arathor." } },
  },
}

-- Private Porter: Stormwind private collecting medium leather for the war effort.
P:NPC {
  key = "ifu_private_porter", id = TODO_NPC("Private Porter"), name = "Private Porter", title = "Medium Leather Collector", gender = "male",
  bible = "bibles/missed_c.md", role = "soldier", tier = "quest",
  communities = { "ironforge" }, temper = { "easy", "plain" }, values = { "duty", "practical" },
  impression = {
    first = "Private Porter stands guard over a stack of leather in the Military Ward with a soldier's sloppy good humour. He is a Stormwind man who seems to have been posted somewhere warmer than he expected.",
    third = "{name} met Private Porter, who collects medium leather for the Alliance war effort in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Leather, friend? I'm told the army can't march barefoot." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, my stack's looking thin." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("The Alliance Needs Medium Leather!") }, text = "Still looking for leather? Hides from Arathi or the Wetlands are best." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("The Alliance Needs Medium Leather!") }, tags = { "news" }, text = "That leather's already gone to the saddlers. Some cavalry horse will thank you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Private Porter, Stormwind regulars, assigned to leather collection, which isn't the glory I signed up for. Still, boots and saddles and armour straps all need leather, and somebody's got to count it." } },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "Anything more?" } },
      choices = {
        { text = "Where's the best leather?", next = "leather" },
        { text = "You don't sound happy about this post.", next = "post" },
        { text = "How's Stormwind these days?", next = "stormwind" },
        { text = "I'm a skinner. What should I hunt?", next = "skin", when = { profession = "Skinning" } },
        { text = "Farewell.", next = "END" },
      },
    },
    leather = {
      lines = { { id = "leather_default", text = "Medium leather comes off big game, raptors in Arathi, bears in the Wetlands and Hillsbrad. Skin them cleanly and cure them well, and the saddlers won't send them back." } },
      choices = {
        { text = "Do they send much back?", next = "back" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "back_default", text = "More than you'd think, because half the hides come in looking like a cat's been at them. I don't mind, it means I get to say no to someone for once." } },
      choices = {
        { text = "You enjoy saying no?", next = "no" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    no = {
      lines = { { id = "no_default", text = "Only a little, and only to people who've earned it. A private doesn't get to say no to much, so I take my chances where I find them." } },
      choices = {
        { text = "Every job in a war matters.", next = "BACK", reply = "Aye, that's what the Sergeant says too, but it's nice to hear.", fx = { align = { order = 1 } } },
        { text = "A soldier belongs at the front, not counting hides.", next = "BACK", reply = "That's what I keep telling them.", fx = { align = { order = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    post = {
      lines = { { id = "post_default", text = "I wanted to fight, if I'm honest, and instead I'm counting hides in a mountain. The Sergeant says it'll be my turn in Silithus soon enough." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    stormwind = {
      lines = { { id = "stormwind_default", text = "Busy with the war effort, same as here, and still missing its king. The regent's not a bad sort, but folk want Varian back." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    skin = {
      lines = { { id = "skin_default", text = "Raptors in Arathi, and mind the big ones, they hunt in packs. Bring me their hides and I'll call you a hero." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No idea, friend. Ask the Field Marshal, he's the one with the maps." } },
  },
}

-- Sarah Sadwhistle: gnome collecting roast raptor for the war effort.
P:NPC {
  key = "ifu_sarah_sadwhistle", id = TODO_NPC("Sarah Sadwhistle"), name = "Sarah Sadwhistle", title = "Roast Raptor Collector", gender = "female",
  bible = "bibles/missed_c.md", role = "quartermaster", tier = "quest",
  communities = { "ironforge" }, temper = { "cheerful", "fussy" }, values = { "community", "practical" },
  impression = {
    first = "Sarah Sadwhistle tends a cart of wrapped roast raptor in the Military Ward, sniffing each parcel before she stacks it. She is a gnome with the brisk cheer of someone who has fed many hungry people.",
    third = "{name} met Sarah Sadwhistle, who collects roast raptor for the Alliance war effort in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello! Have you brought me any raptor? Roasted, not raw, please." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I hope you've been cooking." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("The Alliance Needs Roast Raptor!") }, text = "Still cooking? Raptor from Arathi or the Wetlands roasts beautifully, just watch the bones." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("The Alliance Needs Roast Raptor!") }, tags = { "news" }, text = "Your raptor's packed in salt and ready for the march. The soldiers will eat well on your account." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Sarah Sadwhistle, collecting roast raptor for the troops. An army marches on its stomach, as they say, and raptor keeps for weeks if you roast it right and salt it well." } },
      again = { { id = "h_again", text = "What else can I tell you?" }, { id = "h_again2", text = "Anything more, dear?" } },
      choices = {
        { text = "Why raptor?", next = "why" },
        { text = "Do you cook it yourself?", next = "cook" },
        { text = "You sniff every parcel.", next = "sniff" },
        { text = "I'm a cook myself. Any tips for raptor?", next = "cooking", when = { profession = "Cooking" } },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "It's lean, it's plentiful, and it doesn't spoil in heat, which matters a great deal in a desert. Boar goes rancid in a week, raptor lasts nearly a month." } },
      choices = {
        { text = "How do you know all this?", next = "know" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    know = {
      lines = { { id = "know_default", text = "I ran a kitchen in Gnomeregan for eleven years, feeding three hundred engineers who never remembered to eat. You learn which food lasts when your customers forget it for days." } },
      choices = {
        { text = "Do you miss your kitchen?", next = "miss" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "miss_default", text = "Every day, though I try not to say so. Tinker Town has a kitchen, it's just smaller and colder and full of dwarves asking for more gravy." } },
      choices = {
        { text = "You'll have a kitchen in Gnomeregan again.", next = "BACK", reply = "That's kind, dear, and I hope you're right.", fx = { align = { order = 1 } } },
        { text = "Gnomeregan's gone. Better to start fresh.", next = "BACK", reply = "Perhaps, but I'm too old to start anything fresh.", fx = { align = { order = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    cook = {
      lines = { { id = "cook_default", text = "Oh no, I check it, I pack it and I scold whoever brought it if it's undercooked. The cooking's up to volunteers like you." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sniff = {
      lines = { { id = "sniff_default", text = "Of course I do! An underdone raptor will make a whole squad sick, and I'll not have that on my conscience." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    cooking = {
      lines = { { id = "cooking_default", text = "Low heat, and turn it often, and don't skimp on salt. Raptor's tough if you rush it, but tender as anything if you're patient." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Oh, I've no idea about that. I only know food, I'm afraid." } },
  },
}

-- Katrina Shimmerstar: gnome candy vendor for Hallow's End in the Commons.
P:NPC {
  key = "ifu_katrina_shimmerstar", id = TODO_NPC("Katrina Shimmerstar"), name = "Katrina Shimmerstar", title = "Hallow's End Treats", gender = "female",
  bible = "bibles/missed_c.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "playful", "bright" }, values = { "joy", "community" },
  impression = {
    first = "Katrina Shimmerstar sells candy and masks from a stall decorated with carved gourds. She is a gnome with a mischievous grin and a basket of treats she guards closely.",
    third = "{name} met Katrina Shimmerstar, who sells Hallow's End treats in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Trick or treat! Well, mostly treat, I'm saving the tricks." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more sweets? I knew you would be." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Katrina Shimmerstar, purveyor of Hallow's End sweets and masks! It's a holiday the Forsaken started, if you can believe it, but the candy's far too good to leave to them." } },
      again = { { id = "h_again", text = "What else, sweetie?" }, { id = "h_again2", text = "Go on, ask, before the candy runs out." } },
      choices = {
        { text = "The Forsaken started this holiday?", next = "forsaken" },
        { text = "What can you tell me about the masks?", next = "masks" },
        { text = "Farewell.", next = "END" },
      },
    },
    forsaken = {
      lines = { { id = "forsaken_default", text = "They did, to celebrate breaking free of the Lich King, which is a very strange thing to celebrate with candy. But the Alliance took it up anyway, because nobody says no to a sweet." } },
      choices = {
        { text = "Should we celebrate their holiday?", next = "celebrate" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    celebrate = {
      lines = { { id = "celebrate_default", text = "I think a holiday belongs to whoever has the most fun with it. The Forsaken burn wicker men, we eat sweets, and nobody needs to share notes." } },
      choices = {
        { text = "A holiday is for everyone.", next = "BACK", reply = "Exactly, and so is candy!", fx = { align = { order = -1 } } },
        { text = "I'd rather not celebrate anything Undercity started.", next = "BACK", reply = "Suit yourself, more candy for me.", fx = { align = { order = 1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    masks = {
      lines = { { id = "masks_default", text = "They're enchanted, just a little, so you can look like a troll or an elf or an orc for an hour. Everyone thinks it's funny, until the guards mistake them for the real thing." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's not something I know about, but would you like a sweet instead?" } },
  },
}

-- Field Marshal Snowfall: dwarf commander of the Alliance war effort in Ironforge.
P:NPC {
  key = "ifu_field_marshal_snowfall", id = TODO_NPC("Field Marshal Snowfall"), name = "Field Marshal Snowfall", title = "Alliance War Effort Commander", gender = "male",
  bible = "bibles/missed_c.md", role = "commander", tier = "quest",
  communities = { "ironforge" }, temper = { "stern", "proud" }, values = { "duty", "order" },
  impression = {
    first = "Field Marshal Snowfall commands the Alliance war effort from the Military Ward, his white beard braided with steel rings. He is a dwarf of iron temper and broad shoulders, and every collector in the ward reports to him.",
    third = "{name} met Field Marshal Snowfall, who commands the Alliance war effort from Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "State yer business, {class}. The war effort waits for no one." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, eh? Good. We'll need every pair of hands." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Field Marshal Snowfall, commandin' the Alliance war effort. The insects of Ahn'Qiraj are wakin' in Silithus, and when the Scarab Wall falls, I mean for us to be ready." } },
      again = { { id = "h_again", text = "What else? Be quick." }, { id = "h_again2", text = "Out with it." } },
      choices = {
        { text = "What's happening in Silithus?", next = "silithus" },
        { text = "How are the collections going?", next = "collections" },
        { text = "You've seen a lot of wars.", next = "wars" },
        { text = "Will Ironforge send many of its own?", next = "dwarves", when = { race = "Dwarf" } },
        { text = "Farewell.", next = "END" },
      },
    },
    silithus = {
      lines = { { id = "silithus_default", text = "The Cenarion Circle warns of the qiraji, an insect empire sealed behind the Scarab Wall for a thousand years. The wall is weakenin', and the Circle's askin' every nation for help." } },
      choices = {
        { text = "Can we really beat them?", next = "beat" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    beat = {
      lines = { { id = "beat_default", text = "If we're prepared, aye, and if we're not, we'll learn what the elves learned a thousand years ago. I'd rather not learn it the hard way." } },
      choices = {
        { text = "And the Horde?", next = "horde" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "horde_default", text = "The Horde's collectin' too, and General Zog brings me their tallies. I've no love for orcs, but I'll not refuse an ally in a war like this." } },
      choices = {
        { text = "We should stand with the Horde in this.", next = "BACK", reply = "Aye, for this war at least.", fx = { align = { honor = 1 } } },
        { text = "I'd not trust the Horde at our backs.", next = "BACK", reply = "Nor would I, but I'll take their bandages.", fx = { align = { honor = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    collections = {
      lines = { { id = "collections_default", text = "Unevenly, as collections always do. Copper's ahead, lotus is behind, and I've a mind to send every herbalist in Ironforge to Feralas." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wars = {
      lines = { { id = "wars_default", text = "The Second War, and the Third, and a few skirmishes that never got names. Every one of them was won by the side that was better supplied, and that's why I'm countin' bandages." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    dwarves = {
      lines = { { id = "dwarves_default", text = "Every Mountaineer who can carry an axe, and the King himself if I let him. Magni's itchin' for a fight, but I'd rather he stayed home." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's nae a matter for the war effort, and I've no time for anything else." } },
  },
}

-- Glordrum Steelbeard: Stormpike Guard battlemaster in the Hall of Arms.
P:NPC {
  key = "ifu_glordrum_steelbeard", id = TODO_NPC("Glordrum Steelbeard"), name = "Glordrum Steelbeard", title = "Alterac Valley Battlemaster", gender = "male",
  bible = "bibles/missed_c.md", role = "battlemaster", tier = "service",
  communities = { "ironforge" }, temper = { "fierce", "proud" }, values = { "duty", "kin" },
  impression = {
    first = "Glordrum Steelbeard stands in the Hall of Arms in Stormpike blue, recruiting for the war in Alterac Valley. He has a mountaineer's weathered face and a habit of slapping his axe haft when he talks about Frostwolves.",
    third = "{name} met Glordrum Steelbeard, who recruits for the Stormpike Guard in Ironforge's Hall of Arms.",
  },
  greetings = {
    { id = "g_default", text = "Ho there! Ready to march on Alterac?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, the Frostwolves aren't givin' up, and neither are we." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Glordrum Steelbeard, Stormpike Guard. We've an expedition in Alterac Valley diggin' for iron, and the Frostwolf orcs say it's their ancestral land, so we've been settlin' the matter with axes." } },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "Speak up, I'm half deaf from the cannons." } },
      choices = {
        { text = "Why fight over Alterac?", next = "why" },
        { text = "Who leads the Stormpike?", next = "vanndar" },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Iron, and pride, and a valley that's been bloodied since before the Second War. Vanndar Stormpike leads us there, and he doesn't give up ground once he's taken it." } },
      choices = {
        { text = "Do the Frostwolves have a claim?", next = "claim" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    claim = {
      lines = { { id = "claim_default", text = "They say so, and I'll grant they've lived there longer than we've been diggin'. But the iron's in the mountain, and the mountain doesn't care who was there first." } },
      choices = {
        { text = "The Frostwolves were there first.", next = "BACK", reply = "Aye, maybe, but first isn't the same as right.", fx = { align = { honor = 1 } } },
        { text = "The iron belongs to whoever digs it out.", next = "BACK", reply = "Now ye're talkin' like a Stormpike!", fx = { align = { honor = -1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    vanndar = {
      lines = { { id = "vanndar_default", text = "General Vanndar Stormpike, a dwarf's dwarf, with a beard you could hang a lantern from. He holds Dun Baldar like it's his own front door." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Never heard of it. Ask somebody who doesnae live in the snow." } },
  },
}

-- Mistina Steelshield: dwarf cloth quartermaster at the Great Forge.
P:NPC {
  key = "ifu_mistina_steelshield", id = TODO_NPC("Mistina Steelshield"), name = "Mistina Steelshield", title = "Alliance Cloth Quartermaster", gender = "female",
  bible = "bibles/missed_c.md", role = "quartermaster", tier = "quest",
  communities = { "ironforge" }, temper = { "brisk", "warm" }, values = { "community", "work" },
  impression = {
    first = "Mistina Steelshield keeps a cloth quartermaster's stall by the Great Forge, where the heat keeps her bolts dry. She is a dwarf of brisk good sense who measures everything twice.",
    third = "{name} met Mistina Steelshield, who collects cloth donations for Ironforge at the Great Forge.",
  },
  greetings = {
    { id = "g_default", text = "Good day, {g:lad|lass}! Any wool or silk to spare for the city?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Ye're becomin' one of my best donors." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("A Donation of Wool") }, text = "Still gatherin' wool? It keeps comin' off every gnoll and bandit in the Eastern Kingdoms, so ye'll find plenty." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("A Donation of Wool") }, tags = { "news" }, text = "Yer wool's gone to the tailors, and there'll be a few warmer miners this winter." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Mistina Steelshield, cloth quartermaster for Ironforge. I gather wool and silk from anyone kind enough to give it, and the city turns it into blankets, uniforms and bandages for those who need them." } },
      again = { { id = "h_again", text = "What else, {g:lad|lass}?" }, { id = "h_again2", text = "Aye, go on." } },
      choices = {
        { text = "What's the cloth used for?", next = "cloth" },
        { text = "Do the gnomes have their own quartermaster?", next = "gnomes" },
        { text = "The forge must keep your cloth dry.", next = "forge" },
        { text = "I'm a tailor. Do you need finished goods?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Farewell.", next = "END" },
      },
    },
    cloth = {
      lines = { { id = "cloth_default", text = "Blankets for the miners, uniforms for the guards, bandages for the Mountaineers, and anythin' else the city's short of. Ironforge has stone enough, but cloth's always scarce in a mountain." } },
      choices = {
        { text = "Who decides where it goes?", next = "decides" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    decides = {
      lines = { { id = "decides_default", text = "I do, mostly, with the Thane's quartermasters breathin' down my neck. The miners get first claim in winter, and the guards get it in summer, when they're more likely to be fightin'." } },
      choices = {
        { text = "Is it ever enough?", next = "enough" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    enough = {
      lines = { { id = "enough_default", text = "Never, but it's more than we had last year, and that's what I count. A wee bit better each year is how a city survives." } },
      choices = {
        { text = "Every little bit helps.", next = "BACK", reply = "Aye, ye understand it perfectly.", fx = { align = { light = 1 } } },
        { text = "Charity never solves anything.", next = "BACK", reply = "Hmph, then ye've never been cold in a mine.", fx = { align = { light = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    gnomes = {
      lines = { { id = "gnomes_default", text = "Aye, Bubulo, down in Tinker Town, and we try nae to compete. He gets the gnomes' donations, I get the dwarves', and we split whatever comes from humans." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    forge = {
      lines = { { id = "forge_default", text = "Aye, that's why I set up here, and the warmth keeps my old bones happy too. Cloth goes mouldy in the deeper halls, and nobody wants a mouldy blanket." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    tailor = {
      lines = { { id = "tailor_default", text = "Bolts are best, since the city's tailors know exactly what's needed. But if ye've a good hand, the guard's always short of linen shirts." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldnae say, I'm afraid. Cloth's my business, and that isn't cloth." } },
  },
}

-- Sergeant Stonebrow: dwarf sergeant collecting copper bars for the war effort.
P:NPC {
  key = "ifu_sergeant_stonebrow", id = TODO_NPC("Sergeant Stonebrow"), name = "Sergeant Stonebrow", title = "Copper Bar Collector", gender = "male",
  bible = "bibles/missed_c.md", role = "soldier", tier = "quest",
  communities = { "ironforge" }, temper = { "gruff", "proud" }, values = { "duty", "work" },
  impression = {
    first = "Sergeant Stonebrow guards the tallest pile in the Military Ward, a mountain of copper bars he points at whenever anyone mentions the other collections. He is a dwarf with a sergeant's bark and a miner's pride.",
    third = "{name} met Sergeant Stonebrow, who collects copper bars for the Alliance war effort in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Copper! Bring me copper, and plenty of it!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Look at that pile, would ye, just look at it!" },
    { id = "g_qactive", when = { questActive = TODO_QUEST("The Alliance Needs Copper Bars!") }, text = "Still diggin'? Good, there's copper in every hill from here to Loch Modan." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("The Alliance Needs Copper Bars!") }, tags = { "news" }, text = "Yer bars are on the pile, and the pile's the tallest in the ward, as I knew it would be." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Sergeant Stonebrow, collectin' copper bars for the war effort, and doin' it better than anyone else in this ward. Copper's for buckles and rivets and fittin's, and an army can't march without a thousand of each." } },
      again = { { id = "h_again", text = "What else, soldier?" }, { id = "h_again2", text = "Out with it, I've copper to count." } },
      choices = {
        { text = "Your pile is the tallest here.", next = "pile" },
        { text = "What's copper used for in war?", next = "use" },
        { text = "Where's the best copper?", next = "where" },
        { text = "I've been mining copper for you.", next = "miner", when = { profession = "Mining" } },
        { text = "Farewell.", next = "END" },
      },
    },
    pile = {
      lines = { { id = "pile_default", text = "Aye, and I'll not pretend I'm not proud of it. Dwarves know copper, and every miner in Dun Morogh's been sendin' me bars since the call went out." } },
      choices = {
        { text = "Is it a competition, then?", next = "competition" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    competition = {
      lines = { { id = "competition_default", text = "Officially, no, and the Field Marshal would have my beard if I said so. Unofficially, Master Nightsong's lotus pile is a disgrace, and he knows it." } },
      choices = {
        { text = "That's unkind to Nightsong.", next = "unkind" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    unkind = {
      lines = { { id = "unkind_default", text = "Maybe, but the elf can take it, he's had a thousand years of practice. We'll share a drink when the war's done, and I'll stop gloatin' then." } },
      choices = {
        { text = "Friendly rivalry keeps morale up.", next = "BACK", reply = "Exactly! That's what I keep tellin' the Marshal.", fx = { align = { order = -1 } } },
        { text = "A soldier shouldn't mock his allies.", next = "BACK", reply = "Hmph, maybe ye're right, but I'll not stop.", fx = { align = { order = 1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    use = {
      lines = { { id = "use_default", text = "Rivets, buckles, wire, fittin's for every bit of kit a soldier carries. Iron's for the blade, but copper holds the whole thing together." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "where_default", text = "Dun Morogh, Loch Modan, Elwynn if ye don't mind humans, and the hills of the Barrens if ye do. It's everywhere a miner looks, which is why my pile's the tallest." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    miner = {
      lines = { { id = "miner_default", text = "Then ye're a credit to the craft, and I'll remember yer name when the history's written. Keep smeltin', and keep bringin' it here." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Nae idea. Copper's what I know, and that isnae copper." } },
  },
}

-- Nurse Stonefield: Stormwind nurse collecting silk bandages for the war effort.
P:NPC {
  key = "ifu_nurse_stonefield", id = TODO_NPC("Nurse Stonefield"), name = "Nurse Stonefield", title = "Silk Bandage Collector", gender = "female",
  bible = "bibles/missed_c.md", role = "healer", tier = "quest",
  communities = { "ironforge" }, temper = { "kind", "tired" }, values = { "compassion", "duty" },
  impression = {
    first = "Nurse Stonefield sorts silk bandages in the Military Ward, folding each one with a nurse's quick, practised hands. She is a human from Stormwind with tired eyes and a gentle voice.",
    third = "{name} met Nurse Stonefield, who collects silk bandages for the Alliance war effort in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hello, dear. Have you any silk bandages for me?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Thank you, the soldiers will need every one." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("The Alliance Needs Silk Bandages!") }, text = "Still wrapping? Silk bandages hold better than linen, and they'll be needed in the desert." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("The Alliance Needs Silk Bandages!") }, tags = { "news" }, text = "Your bandages are folded and packed. I hope they're never needed, but they will be." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Nurse Stonefield, from Stormwind, and I collect silk bandages for the army going south. I've nursed soldiers from every war since the Second, and I've never once had enough bandages." } },
      again = { { id = "h_again", text = "What else, dear?" }, { id = "h_again2", text = "Anything else I can help you with?" } },
      choices = {
        { text = "You've nursed in every war since the Second?", next = "wars" },
        { text = "Why silk rather than linen?", next = "silk" },
        { text = "You seem tired.", next = "tired" },
        { text = "I know how to make silk bandages.", next = "aid", when = { profession = "First Aid" } },
        { text = "Farewell.", next = "END" },
      },
    },
    wars = {
      lines = { { id = "wars_default", text = "Every one, and the Third was the worst, with plague in the wounds and the dead getting up again. I'd hoped I'd never see another army march, and here I am folding bandages." } },
      choices = {
        { text = "Why do you keep doing it?", next = "why" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Because somebody has to, and because the soldiers need a kind face when they come back broken. I can't stop the wars, but I can stop some of the bleeding." } },
      choices = {
        { text = "That's a heavy burden.", next = "burden" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    burden = {
      lines = { { id = "burden_default", text = "It is, but I've carried it long enough that it fits my shoulders. Don't you worry about me, dear, worry about the lads going south." } },
      choices = {
        { text = "The Light will reward your kindness.", next = "BACK", reply = "Bless you, dear, I hope so.", fx = { align = { light = 1 } } },
        { text = "Kindness won't win a war.", next = "BACK", reply = "No, but it brings the soldiers home.", fx = { align = { light = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    silk = {
      lines = { { id = "silk_default", text = "Silk holds tighter and stays cleaner, and in the desert heat that's the difference between a wound that heals and one that festers. Linen's fine for a scraped knee, but not for a war." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tired = {
      lines = { { id = "tired_default", text = "I am, dear, but there's no rest until the crates are full. Thank you for noticing, it's more than most do." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    aid = {
      lines = { { id = "aid_default", text = "Then you're worth a dozen sword-swingers to me, dear. Make as many as you can, and I'll see them where they're needed." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I'm afraid I don't know, dear. I only know bandages and the people who need them." } },
  },
}

-- Bonnie Stoneflayer: dwarf collecting light leather for the war effort.
P:NPC {
  key = "ifu_bonnie_stoneflayer", id = TODO_NPC("Bonnie Stoneflayer"), name = "Bonnie Stoneflayer", title = "Light Leather Collector", gender = "female",
  bible = "bibles/missed_c.md", role = "quartermaster", tier = "quest",
  communities = { "ironforge" }, temper = { "cheerful", "brisk" }, values = { "work", "family" },
  impression = {
    first = "Bonnie Stoneflayer stacks bundles of light leather in the Military Ward with a skinner's practised eye for quality. She is a cheerful dwarf whose arms are as thick as any miner's.",
    third = "{name} met Bonnie Stoneflayer, who collects light leather for the Alliance war effort in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Hello there, {g:lad|lass}! Got any leather for me?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I'll take whatever ye've brought." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("The Alliance Needs Light Leather!") }, text = "Light leather's easy enough to come by, just skin anythin' with fur from Dun Morogh to Westfall." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("The Alliance Needs Light Leather!") }, tags = { "news" }, text = "Yer leather's off to the saddlers, and it'll be belts and pouches soon enough." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Bonnie Stoneflayer, collectin' light leather for the troops. My family's been skinnin' and tannin' in Dun Morogh for six generations, so I know a good hide when I see one." } },
      again = { { id = "h_again", text = "What else, {g:lad|lass}?" }, { id = "h_again2", text = "Go on, ask away." } },
      choices = {
        { text = "Your family are skinners?", next = "family" },
        { text = "What's light leather used for?", next = "use" },
        { text = "You've thick arms for a quartermaster.", next = "arms" },
        { text = "I'm a skinner too. Any advice?", next = "skin", when = { profession = "Skinning" } },
        { text = "Farewell.", next = "END" },
      },
    },
    family = {
      lines = { { id = "family_default", text = "Aye, the Stoneflayers have been skinnin' bears and boars in Dun Morogh since before Ironforge had a king. My brother Balthus still runs the tannery, and he's twice the skinner I am." } },
      choices = {
        { text = "Does Balthus help with the collection?", next = "balthus" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    balthus = {
      lines = { { id = "balthus_default", text = "He sends me hides when he's got spare, though he grumbles about it. He'd rather sell them to the city's leatherworkers, who pay better than the war effort." } },
      choices = {
        { text = "Can you blame him?", next = "blame" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    blame = {
      lines = { { id = "blame_default", text = "Not really, he's got four bairns to feed. But I tell him the war won't wait for his profits, and he grumbles some more." } },
      choices = {
        { text = "Family comes before any war.", next = "BACK", reply = "Aye, that's what Balthus says.", fx = { align = { order = -1 } } },
        { text = "Everyone must give to the war effort.", next = "BACK", reply = "Aye, that's what I tell him.", fx = { align = { order = 1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    use = {
      lines = { { id = "use_default", text = "Belts, pouches, gloves and straps, the wee things every soldier needs. Medium and heavy leather's for armour, but light leather holds it all together." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    arms = {
      lines = { { id = "arms_default", text = "Ha! Thirty years of scrapin' hides will do that to ye. I could still skin a bear faster than any lad in the Mountaineers." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    skin = {
      lines = { { id = "skin_default", text = "Cut along the belly, never across, and keep yer blade sharp. A clean hide's worth twice a torn one." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Nae idea, {g:lad|lass}. Ask somebody who doesnae spend all day with hides." } },
  },
}

-- Huntress Swiftriver: night elf collecting spotted yellowtail for the war effort.
P:NPC {
  key = "ifu_huntress_swiftriver", id = TODO_NPC("Huntress Swiftriver"), name = "Huntress Swiftriver", title = "Spotted Yellowtail Collector", gender = "female",
  bible = "bibles/missed_c.md", role = "quartermaster", tier = "quest",
  communities = { "ironforge" }, temper = { "calm", "wry" }, values = { "nature", "duty" },
  impression = {
    first = "Huntress Swiftriver tends barrels of salted fish in the Military Ward, her bow slung across her back even here. She is a night elf of easy grace who seems faintly amused at being assigned to fish.",
    third = "{name} met Huntress Swiftriver, who collects spotted yellowtail for the Alliance war effort in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Have you brought fish, or only questions?" },
    { id = "g_back", when = { metBefore = true }, text = "You return. The barrels are fuller, thanks to you." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("The Alliance Needs Spotted Yellowtail!") }, text = "Spotted yellowtail runs in the warm southern seas, around Feralas and Tanaris. Cook them well before you bring them." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("The Alliance Needs Spotted Yellowtail!") }, tags = { "news" }, text = "Your fish are salted and packed. The soldiers will eat well in the desert." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Huntress Swiftriver, and I collect spotted yellowtail for the army. A huntress gathering fish, I know, but war has made stranger tasks of better warriors than me." } },
      again = { { id = "h_again", text = "What else would you know?" }, { id = "h_again2", text = "Speak, I'm listening." } },
      choices = {
        { text = "Why fish for an army?", next = "why" },
        { text = "Where do yellowtail run?", next = "where" },
        { text = "You seem amused by your post.", next = "amused" },
        { text = "A hunter, counting fish? That's a waste.", next = "fellow", when = { class = "HUNTER" } },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Spotted yellowtail is rich and keeps well, and it will feed soldiers in the desert where there is no game to hunt. A hungry army is a defeated army, whatever its blades." } },
      choices = {
        { text = "Do you miss the hunt?", next = "hunt" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hunt = {
      lines = { { id = "hunt_default", text = "Every day, for there is no stalking a barrel of fish. But the Sentinels go where they are needed, and they needed me here." } },
      choices = {
        { text = "Will you go to Silithus?", next = "silithus" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    silithus = {
      lines = { { id = "silithus_default", text = "If the call comes, I will, with my bow and my cat. I would rather hunt the qiraji than pack fish for those who do." } },
      choices = {
        { text = "The hunt is the true calling.", next = "BACK", reply = "You speak like a hunter.", fx = { align = { order = -1 } } },
        { text = "Every task in war matters equally.", next = "BACK", reply = "Wise, though I would still rather hunt.", fx = { align = { order = 1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "where_default", text = "In the warm seas of the south, off the coasts of Feralas and Tanaris. Fishing there is easy, as long as you mind the sharks and the pirates." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    amused = {
      lines = { { id = "amused_default", text = "I am, a little, for a Sentinel counting fish is a sight my sisters would laugh at. Still, laughter is better than complaint, and duty is duty." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    fellow = {
      lines = { { id = "fellow_default", text = "It is, and I have told the Field Marshal so. He told me fish do not run away, so I may as well count them." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I cannot help you with that. The Field Marshal may know." } },
  },
}

-- General Zog: Horde ambassador bringing the Horde's war effort tallies to Ironforge.
P:NPC {
  key = "ifu_general_zog", id = TODO_NPC("General Zog"), name = "General Zog", gender = "male",
  bible = "bibles/missed_c.md", role = "diplomat", tier = "quest",
  communities = { "ironforge" }, temper = { "blunt", "proud" }, values = { "honor", "duty" },
  impression = {
    first = "General Zog stands in the Military Ward like a boulder dropped among pebbles, an orc in full war gear surrounded by wary dwarves. He brings the Horde's war effort tallies to Field Marshal Snowfall, and he does not pretend to enjoy it.",
    third = "{name} met General Zog, the Horde envoy who carries the war effort's tallies to Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "You stare, {class}. Most here do. Speak, or move along." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You are braver than most of your kind." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am General Zog, sent by the Warchief to share the Horde's tallies with your Field Marshal. The qiraji threaten us all, and Thrall would rather the Alliance be ready than dead." } },
      again = { { id = "h_again", text = "Speak." }, { id = "h_again2", text = "What else?" } },
      choices = {
        { text = "Why does the Horde share its tallies?", next = "why" },
        { text = "How is the Horde's effort going?", next = "tally" },
        { text = "You must feel out of place here.", next = "place" },
        { text = "Lok'tar, General. How do the dwarves treat you?", next = "orc", when = { race = "Orc" } },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Because a war against the qiraji is not a war we can fight alone. Thrall is wise enough to know it, and so is Snowfall, though he will not say so aloud." } },
      choices = {
        { text = "Do you trust Snowfall?", next = "trust" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "trust_default", text = "I trust that he wants to win, and so do I. That is enough for now, and more than I would have said of any dwarf five years ago." } },
      choices = {
        { text = "Can our peoples ever truly trust each other?", next = "peace" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    peace = {
      lines = { { id = "peace_default", text = "Not in my lifetime, perhaps, but my sons may see it. The war against the Legion showed us both what is possible." } },
      choices = {
        { text = "Our peoples should work toward peace.", next = "BACK", reply = "Then you are wiser than many of your kind.", fx = { align = { honor = 1 } } },
        { text = "The Horde can never be trusted.", next = "BACK", reply = "Then we understand each other, at least.", fx = { align = { honor = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    tally = {
      lines = { { id = "tally_default", text = "Well, and better than the Alliance's in some things. Snowfall glares at the numbers every morning, and I enjoy watching him do it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    place = {
      lines = { { id = "place_default", text = "I am an orc in a dwarf city, so yes. But I have stood in worse places, and at least the ale is strong." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "orc_default", text = "With cold stares and colder silence, brother, but they keep their axes sheathed. That is more than I expected, and more than they would have given us a few years ago." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I do not know, and I do not care to. Ask a dwarf." } },
  },
}


-- Festival Loremaster: the Ironforge keeper of Midsummer lore, who sends the bold to steal the Horde capitals' flames.
P:NPC {
  key = "if_festival_loremaster", id = 16817, name = "Festival Loremaster", gender = "male",
  role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "jovial", "learned" }, values = { "tradition", "story" },
  notices = { "race", "class" },
  impression = {
    first = "A white-bearded dwarf with a book under one arm and a torch in the other hand.",
    third = "{name} met the Festival Loremaster, who keeps the old stories of the Midsummer Fire Festival.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, welcome, {g:lad|lass}! The bonfires are lit and the summer's at its height, so pull up a stone and hear some old lore." },
    { id = "g_festival", when = { holiday = "midsummer" }, text = "Midsummer's here, {g:lad|lass}, and the fires burn in every city! There's nae a better night for a good tale." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more tales, are ye? Good, I've a cartload of them and nae enough ears." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Stealing Orgrimmar's Flame") }, text = "Orgrimmar's flame, {g:lad|lass}! Have ye touched it yet, or are the grunts still glaring at ye?" },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" }, text = "Light fingers and soft boots, I'd wager. I may have a job that suits ye, all in the spirit of the festival." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm a loremaster of the Midsummer Fire Festival, and it's my duty to keep the old tales of the flame from being forgotten. Every people in this world lights fires on the longest day, ye know, even the Horde in their dusty cities." } },
      again = { { id = "h_again", text = "What else would ye know? Ask away while the fire's hot." } },
      choices = {
        { text = "Why do people light fires at midsummer?", next = "why" },
        { text = "You mentioned the Horde cities?", next = "horde" },
        { text = "Tell me a festival tale.", next = "tale" },
        { text = "A good festival to you.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "To honour the sun at its strongest, and to burn away the old troubles before the year turns cold. Dwarves light theirs to thank the forge-fire that warms the mountain, and the humans to keep the dark at bay a while longer." } },
      choices = {
        { text = "And what do the dwarves burn?", next = "burn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn = {
      lines = { { id = "b_default", text = "Old grudges, if we're honest, written on scraps and tossed in the blaze. Mind, a dwarf has a great many grudges, so the bonfires at Ironforge burn longer than most." } },
      choices = { { text = "That sounds healthy. Something else.", next = "BACK" } },
    },
    horde = {
      lines = { { id = "ho_default", text = "Aye, Orgrimmar, Thunder Bluff and the Undercity all keep their own festival flames, guarded day and night. It's an old game for a brave soul to slip in and carry a piece of their fire home, and I'll reward anyone daft enough to manage it." } },
      choices = {
        { text = "I'll steal their flames. What do I do?", next = "steal" },
        { text = "Isn't that just provoking a war?", next = "war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    steal = {
      lines = { { id = "s_default", text = "Find the bonfire in the heart of their city, touch it, and come back with yer hands still on yer arms. Bring me proof of each, and the Alliance will drink to yer name till next summer." } },
      choices = {
        { text = "Showing up the Horde suits me fine.", next = "BACK", reply = "Ha! That's the spirit, {g:lad|lass}, though mind ye don't start a real war over a wee flame.", fx = { align = { honor = -1 } } },
        { text = "I'll do it fairly. No needless blood.", next = "BACK", reply = "Good. It's a prank, not a raid, and the best thieves leave everyone alive to grumble about it.", fx = { align = { honor = 1 } } },
      },
    },
    war = {
      lines = { { id = "wa_default", text = "Nae more than a snowball provokes a blizzard, {g:lad|lass}. Their folk come sneaking for our flames just the same, and both sides laugh about it over a mug, or most of them do." } },
      choices = { { text = "If you say so. Something else.", next = "BACK" } },
    },
    tale = {
      lines = { { id = "t_default", text = "Here's one for ye: an old Bronzebeard smith once fell asleep beside the Midsummer bonfire, and woke with his beard singed clean off. He swore the fire was jealous of it, and he never lit another without a bucket of water beside him." } },
      choices = {
        { text = "A dwarf's beard is worth guarding.", next = "BACK", when = { race = "Dwarf" }, reply = "Spoken like a true son or daughter of Khaz Modan. Keep it away from the sparks tonight." },
        { text = "Ha. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's nae part of the festival lore, {g:lad|lass}. Try the Hall of Explorers; they've a book on everything." } },
  },
}

-- Greatfather Winter's Helper: a goblin in festive colours standing beside Greatfather Winter in the Commons.
P:NPC {
  key = "if_greatfather_winters_helper", id = 15745, name = "Greatfather Winter's Helper", gender = "male",
  role = "citizen", tier = "service",
  communities = { "ironforge" }, temper = { "cheerful", "pushy" }, values = { "profit", "festivity" },
  notices = { "race" },
  impression = {
    first = "A goblin in a red and green suit, grinning at everyone who passes.",
    third = "{name} met Greatfather Winter's goblin helper in the Commons of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Happy Winter Veil, pal! Step right up, the big fella's taking requests and I'm handling the paperwork." },
    { id = "g_festival", when = { holiday = "winterveil" }, text = "Happy Winter Veil! Greatfather Winter's handing out gifts, and Smokywood Pastures has everything else you need." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, ya valued customer? Greatfather Winter never forgets a face, and I never forget a ledger." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" }, text = "A gnome! Listen, if you know anything about toy springs, I've got a crate of them that keep going off sideways." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm one of Greatfather Winter's little helpers, contracted for the season through Smokywood Pastures, and let me tell ya, the hours are brutal. Toys, treats, wrapping, and every kid in Ironforge wantin' a mechanical squirrel." } },
      again = { { id = "h_again", text = "Something else, chum? Make it quick, the queue's backin' up past the bank." } },
      choices = {
        { text = "A goblin helping Greatfather Winter? Truly?", next = "why" },
        { text = "What's the Feast of Winter Veil about?", next = "veil" },
        { text = "Merry Winter Veil.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Sure, why not? Smokywood runs the whole operation, so somebody's gotta count the gifts, and goblins count better than anybody. Plus the cocoa's free for staff, which is a perk I value very highly." } },
      choices = {
        { text = "So it's all a business to you?", next = "biz" },
        { text = "Something else.", next = "BACK" },
      },
    },
    biz = {
      lines = { { id = "b_default", text = "Everything's a business, pal, but that don't mean it ain't nice too. A happy kid today is a payin' customer in twenty years, so I call that an investment in goodwill." } },
      choices = {
        { text = "Giving should be free of profit.", next = "BACK", reply = "Aw, that's sweet, and the big guy agrees with ya. I just keep the books so he can afford to be generous.", fx = { align = { order = 1 } } },
        { text = "Fair enough. A deal's a deal.", next = "BACK", reply = "Now you're talkin' my language! Remind me to send you a catalogue next year.", fx = { align = { order = -1 } } },
      },
    },
    veil = {
      lines = { { id = "v_default", text = "Snow, presents, a big tree and a jolly old fella handing things out, that's the short version. The dwarves have been celebrating it since before anybody wrote it down, and they drink twice as much eggnog as everybody else, which is good for sales." } },
      choices = { { text = "Sounds like a fine tradition. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not in my contract, pal. Try the big guy, he knows everybody's business, if ya know what I mean." } },
  },
}
