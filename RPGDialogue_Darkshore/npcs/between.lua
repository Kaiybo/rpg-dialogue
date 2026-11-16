-- Darkshore between the towns (0.38.0): Bashal'Aran, the Grove of the Ancients, Remtravel's dig, and two druids in trouble in the wilds. Voice: bibles/auberdine.md
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "asterion", id = TODO_NPC("Asterion"), name = "Asterion", title = "",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "bashal_aran" }, temper = { "weary" }, values = { "dutiful", "wise" },
  impression = {
    first = "Asterion keeps a lonely watch over the ruins of Bashal'Aran, where satyrs pick through what his people left behind. He talks about the old city as if he can still hear it.",
    third = "{name} met Asterion, the druid who watches over the ruins of Bashal'Aran.",
  },

  greetings = {
    { id = "g_default", text = "Walk softly here, traveller, for Bashal'Aran was a city once, and the satyrs have not left it in peace." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the ruins, which few people choose to do. Sit a while, if the satyrs allow it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Asterion, and I watch over what is left of Bashal'Aran. The Deth'ryll satyrs crawl through these stones looking for old magic, and I mean to see that they find none of it." },
        { id = "h_cond", when = { race = "NightElf" }, text = "You're one of the Kaldorei, so you'll feel it too, I think, the old sorrow in these stones. Our people built this place before the sea took so much of the shore." },
      },
      again = {
        { id = "h_again1", text = "What else would you know about the ruins?" },
        { id = "h_again2", text = "Ask, then, while the satyrs are quiet." },
      },
      choices = {
        { text = "What do the satyrs want here?", next = "satyrs" },
        { text = "What was Bashal'Aran?", next = "city" },
        { text = "Do you send word to Auberdine?", next = "neighbors" },
        { text = "You're a druid, as I am. How do you bear it here?", next = "druid", when = { class = "DRUID" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    satyrs = {
      lines = {
        { id = "satyrs_default", text = "They want whatever magic the Highborne left behind, for they were Highborne once themselves, before the Legion twisted them. I've asked travellers to take the horns from the Deth'ryll and bring me the old relics they steal." },
      },
      choices = {
        { text = "Why do they keep coming back?", next = "satyrs2" },
      },
    },
    satyrs2 = {
      lines = {
        { id = "satyrs2_default", text = "Because it calls to them, and I think it always will, the way a drunkard hears a tavern door. Some say we should forgive them their shape, and some say we should finish what the war began." },
      },
      choices = {
        { text = "Whatever they were, they chose this. Drive them out.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "They were our people once. Pity them, at least.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Let them dig. Dead cities are no one's business.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    city = {
      lines = {
        { id = "city_default", text = "A city of the Kaldorei, from the days before the Sundering, and later a quiet place where my people kept their histories. Now it is broken stones and old moonlight, and I am all that's left to mind it." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    neighbors = {
      lines = {
        { id = "neighbors_default", text = "When I can, yes, though Auberdine has troubles enough with the bears and the furbolgs. Tharnariun and I were students together once, and he still sends me a bottle of something on the boat days." },
      },
      choices = {
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "druid_default", text = "By listening to the trees instead of the stones, mostly. The ruins grieve, but the forest around them is still young and stubborn, and a druid can lean on that when the nights are long." },
      },
      choices = {
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a druid who stayed where others left, and I watch the old city because someone should." } },
    _none = { { id = "tp_none", text = "I've no answer for that, I'm afraid; the ruins keep their own counsel and so do I." } },
  },
}

P:NPC {
  key = "remtravel", id = TODO_NPC("Prospector Remtravel"), name = "Prospector Remtravel", title = "Explorers' League",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "remtravel_dig" }, temper = { "scatterbrained" }, values = { "curious", "proud" },
  impression = {
    first = "Prospector Remtravel is a dwarf of the Explorers' League who loses his notes, his tools and occasionally himself. He is cheerful about all of it.",
    third = "{name} met Prospector Remtravel, an absent-minded dwarf digging in southern Darkshore.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a visitor! Mind the trench, lad, I've only just dug it and I'd hate to lose another one in there." },
    { id = "g_back", when = { metBefore = true }, text = "I know your face, I'm nearly sure of it, which puts you ahead of half my notes!" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Remtravel's the name, prospector for the Explorers' League, and these old elven ruins are the finest dig I've had in years. If only I could remember where I left the bloody fossil." },
        { id = "h_cond", when = { race = "Dwarf" }, text = "A dwarf, out here! Tell me you're from Ironforge and you've brought a proper pickaxe, because the elves don't make a tool worth swinging." },
      },
      again = {
        { id = "h_again1", text = "Now, where was I? Ah, yes, you were asking something." },
        { id = "h_again2", text = "Carry on, carry on, I'm listening with at least one ear, which is more than Gorbold gets." },
      },
      choices = {
        { text = "What are you digging for?", next = "dig" },
        { text = "What does the Explorers' League want with Darkshore?", next = "league" },
        { text = "Isn't it dangerous out here alone?", next = "danger" },
        { text = "I'm from Ironforge, and I brought a pick.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Good luck with the digging.", next = "END" },
      },
    },
    dig = {
      lines = {
        { id = "dig_default", text = "Bones, lad, old ones, from beasts that walked this shore before the elves ever did. Gorbold back in Auberdine thinks I've gone soft in the head, but the League pays for curiosity, not common sense." },
      },
      choices = {
        { text = "Did you find anything?", next = "dig2" },
      },
    },
    dig2 = {
      lines = {
        { id = "dig2_default", text = "I found a fossil the size of my head and then the murlocs chased me off and I can't think where I put it down. The elves say these ruins are holy and I ought to leave them be, but bones belong in a museum, don't they?" },
      },
      choices = {
        { text = "Knowledge belongs to everyone. Dig away.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "If the elves call it holy, ask their leave first.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    league = {
      lines = {
        { id = "league_default", text = "The whole history of the world, lad, and Darkshore has more of it lying about than most. Brann Bronzebeard himself would give his beard to see this coast, though don't tell him I said so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "danger_default", text = "Dangerous? Oh, terribly, what with the murlocs and the Blackwood furbolgs and the gnolls of the hills. But I've a stout hat and a good sense of direction, which is more than most of my colleagues can say, mind." },
      },
      choices = {
        { text = "If you say so.", next = "BACK" },
      },
    },
    dwarf = {
      lines = {
        { id = "dwarf_default", text = "Bless your beard! Then you'll know the Hall of Explorers smells of old paper and older ale, and you'll forgive a fellow for missing it out here among all these trees." },
      },
      choices = {
        { text = "I do miss it. What else?", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Explorers' League, thirty years in the field, and only lost twice, whatever Gorbold tells you." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, lad. I can barely tell you where I left my lunch." } },
  },
}

P:NPC {
  key = "onu", id = TODO_NPC("Onu"), name = "Onu", title = "Ancient of Lore",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "grove_of_ancients" }, temper = { "slow" }, values = { "wise", "protective" },
  impression = {
    first = "Onu is an Ancient of Lore at the Grove of the Ancients, old as the forest and slow to speak. Each word he says seems to have been weighed for a season first.",
    third = "{name} met Onu, the Ancient of Lore who guards the Grove of the Ancients in Darkshore.",
  },

  greetings = {
    { id = "g_default", text = "Young one, you walk quickly, as all your kind do. Stand a while and let the grove see you." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the grove remembers your footsteps. That is no small thing, for it forgets most visitors." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Onu, and I have kept this grove since the trees here were saplings. Something stirs at the Master's Glaive to the south, where the old blade fell, and I do not like the shape of it." },
        { id = "h_cond", when = { class = "DRUID" }, text = "Ah, a druid walks in my grove, and I hear the Cenarion Circle in the way you step. Malfurion's children are always welcome among the Ancients." },
      },
      again = {
        { id = "h_again1", text = "Speak, young one, I am listening." },
        { id = "h_again2", text = "The grove waits. What else do you wish to know?" },
      },
      choices = {
        { text = "What is the Master's Glaive?", next = "glaive" },
        { text = "Who are the other Ancients here?", next = "grove" },
        { text = "How old are you, Onu?", next = "time" },
        { text = "The Circle sends its respects, Ancient.", next = "druidq", when = { class = "DRUID" } },
        { text = "I will leave you in peace.", next = "END" },
      },
    },
    glaive = {
      lines = {
        { id = "glaive_default", text = "A great blade that fell from the sky in the war against the Legion, and it lies in the earth still, far to the south of here. Now men in dark robes gather around it, the Twilight's Hammer, and they whisper to things that should stay sleeping." },
      },
      choices = {
        { text = "What would you have done about them?", next = "glaive2" },
      },
    },
    glaive2 = {
      lines = {
        { id = "glaive2_default", text = "I am too old and too rooted to walk there, so I ask the young ones to go for me. Some would scatter the cult and let them run, and some would end them before the whispering spreads." },
      },
      choices = {
        { text = "Scatter them. They're people, however lost.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "End them, before whatever they call answers.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    grove = {
      lines = {
        { id = "grove_default", text = "Old friends, who sleep more than they speak, as I will someday. We remember the forest as it was before the Sundering, and we keep that memory so the young trees have something to grow toward." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    time = {
      lines = {
        { id = "time_default", text = "Older than the shore you walked to reach me, little one. I remember when this coast was a hill above a city, before the sea came in and took it." },
      },
      choices = {
        { text = "That's older than I can picture.", next = "BACK" },
      },
    },
    druidq = {
      lines = {
        { id = "druidq_default", text = "Then carry mine back to Moonglade, and tell Remulos that Onu still stands. A message from an Ancient is slow, but it arrives." },
      },
      choices = {
        { text = "I will. May I ask something else?", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am an Ancient of Lore, and the memory of this forest lives in my roots." } },
    _none = { { id = "tp_none", text = "That is a question for younger minds than mine, little one, and for quicker ones." } },
  },
}

P:NPC {
  key = "volcor", id = TODO_NPC("Volcor"), name = "Volcor", title = "",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "darkshore_wilds" }, temper = { "hunted" }, values = { "brave", "protective" },
  impression = {
    first = "Volcor is a night elf hiding from the furbolgs of the Blackwood, who have gone mad and turned on everyone. He is hurt and short of patience, but not of courage.",
    third = "{name} met Volcor, a night elf trapped by the maddened Blackwood furbolgs in Darkshore.",
  },

  greetings = {
    { id = "g_default", text = "Quiet, friend, please! The Blackwood are just outside, and they'll hear us if we talk above a whisper." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and you weren't followed, I hope. Good, then we can speak." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "My name is Volcor, and I was taken by the Blackwood furbolgs when they turned on us. I need to reach the road and get word to Auberdine, but I can't fight my way past them alone." },
        { id = "h_cond", when = { class = "ROGUE" }, text = "You move like someone who knows how to go unseen, which may be just what I need. There's more than one way out of this den." },
      },
      again = {
        { id = "h_again1", text = "Speak quickly, they patrol often." },
        { id = "h_again2", text = "What else? Keep your voice low." },
      },
      choices = {
        { text = "How do we get you out?", next = "escape" },
        { text = "Why did the Blackwood turn on you?", next = "furbolg" },
        { text = "Who's waiting for you in Auberdine?", next = "others" },
        { text = "I can get us both out unseen.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll come back for you.", next = "END" },
      },
    },
    escape = {
      lines = {
        { id = "escape_default", text = "We can fight our way through the camp, or we can slip around it while they sleep, and either way I need you at my side. I'd sooner do it by force, but I'll trust your judgement." },
      },
      choices = {
        { text = "Why would you rather fight?", next = "escape2" },
      },
    },
    escape2 = {
      lines = {
        { id = "escape2_default", text = "Because they killed two of my friends in front of me, and some part of me wants them to pay. The other part knows they're sick, not wicked, and that something has been poisoning their minds." },
      },
      choices = {
        { text = "We go quietly. Revenge can wait.", next = "BACK", fx = { align = { order = 1 }, trait = { patient = 1 } } },
        { text = "They've earned a fight. We go through them.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    furbolg = {
      lines = {
        { id = "furbolg_default", text = "They were friendly once, and traded with us for years, but this season they grew wild and red-eyed. They've been drinking or eating something foul, and I'd wager the satyrs had a hand in it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_default", text = "Sentinels I've served beside, and a sister who'll box my ears for getting caught. Tell Thundris Windweaver what's happening up here, whatever becomes of me." },
      },
      choices = {
        { text = "I'll tell him.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "rogue_default", text = "Then you'll lead and I'll follow, and Elune keep us both out of their noses. I've never been gladder to meet someone who sneaks for a living." },
      },
      choices = {
        { text = "Before that, something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a scout of Auberdine, or I was, before the Blackwood took me." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't time to wonder about it just now." } },
  },
}

P:NPC {
  key = "kerlonian", id = TODO_NPC("Kerlonian Evershade"), name = "Kerlonian Evershade", title = "",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "darkshore_wilds" }, temper = { "drowsy" }, values = { "kind", "foolish" },
  impression = {
    first = "Kerlonian Evershade is a druid who fell into the Emerald Dream and keeps falling back into it. He is sweet-natured and embarrassed by it, when he is awake.",
    third = "{name} met Kerlonian Evershade, a druid in Darkshore who cannot stay awake.",
  },

  greetings = {
    { id = "g_default", text = "Hm? Oh, forgive me, I must have dozed off again, which happens rather a lot lately." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and I'm awake to see you, which is a fine change for both of us." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Kerlonian, and I'm meant to be on my way home to Auberdine and my love, Liladris. The trouble is that I keep falling asleep on the road, and the Dream doesn't want to let me go." },
        { id = "h_cond", when = { class = "DRUID" }, text = "Another druid! You'll understand, then, how sweet the Dream is, and how easy it is to stay there longer than you should." },
      },
      again = {
        { id = "h_again1", text = "Ask, quickly, before I nod off." },
        { id = "h_again2", text = "Yes? I'm listening, truly I am." },
      },
      choices = {
        { text = "Why do you keep falling asleep?", next = "sleep" },
        { text = "Who is Liladris?", next = "liladris" },
        { text = "Is the road to Auberdine safe?", next = "road" },
        { text = "I've felt the Dream's pull, too.", next = "druidk", when = { class = "DRUID" } },
        { text = "Stay awake, Kerlonian.", next = "END" },
      },
    },
    sleep = {
      lines = {
        { id = "sleep_default", text = "I walked the Emerald Dream too long, and too deeply, and now some part of me wants to go back every moment. The Horn of Awakening can rouse me, if you'll stay with me and blow it when I drift." },
      },
      choices = {
        { text = "Is the Dream so wonderful?", next = "sleep2" },
      },
    },
    sleep2 = {
      lines = {
        { id = "sleep2_default", text = "It's the forest as it was meant to be, green and whole and quiet. Some of my order think we should spend more time there, and some think we've spent too much already." },
      },
      choices = {
        { text = "The waking world needs you more. Come home.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "If the Dream is that beautiful, I'd stay too.", next = "BACK", fx = { align = { order = -1 }, trait = { dreamer = 1 } } },
      },
    },
    liladris = {
      lines = {
        { id = "liladris_default", text = "Liladris Moonriver, who waits for me in Auberdine and who is going to be very cross. I promised her I'd be back before the moon was full, and I've lost track of how many moons it's been." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_default", text = "Not for a man who sleeps in the middle of it, no. There are bears gone mad and Blackwood furbolgs about, so do keep an eye out while I'm dreaming." },
      },
      choices = {
        { text = "I'll watch the road.", next = "BACK" },
      },
    },
    druidk = {
      lines = {
        { id = "druidk_default", text = "Then you know it's no sin to love it, only to forget the people waiting for you. Promise me you'll remember that, when it's your turn." },
      },
      choices = {
        { text = "I promise. What else?", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a druid of the Cenarion Circle, and very nearly a bridegroom, if I can stay awake." } },
    _none = { { id = "tp_none", text = "I'm not sure, and I think I may have dreamed the answer once and forgotten it." } },
  },
}
