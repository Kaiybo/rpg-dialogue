-- Ashenvale between the towns (0.38.0): Forest Song, a bowyer's roadside camp, Zoram'gar, and a captive furbolg. Voice: bibles/ashenvale.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "kayneth", id = TODO_NPC("Kayneth Stillwind"), name = "Kayneth Stillwind", title = "",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "forest_song" }, temper = { "tense" }, values = { "dutiful", "protective" },
  impression = {
    first = "Kayneth Stillwind holds Forest Song, the far eastern outpost of Ashenvale, with the Forsaken on one side and demons on the other. He speaks like a man counting arrows.",
    third = "{name} met Kayneth Stillwind, who keeps watch at Forest Song in eastern Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Forest Song, {class}, the last kind word you'll hear before Felwood." },
    { id = "g_back", when = { metBefore = true }, text = "You're back in the east, then, and in one piece. That's more than I can say for the Forsaken's last messenger." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Kayneth Stillwind, and Forest Song is my charge. The Forsaken have been seen in the woods to the east carrying strange diseases, and I'd very much like to know what they mean to do with them." },
        { id = "h_cond", when = { race = "Human" }, text = "A human, this far east? You'll know better than most what the Forsaken's plagues did to Lordaeron, so you'll understand why I lose sleep over them." },
      },
      again = {
        { id = "h_again1", text = "There's more you want to know, I can see it, so ask while the woods are quiet." },
        { id = "h_again2", text = "Ask, then. The watch changes soon." },
      },
      choices = {
        { text = "What are the Forsaken doing here?", next = "forsaken" },
        { text = "What lies east of Forest Song?", next = "east" },
        { text = "How do you keep the outpost supplied?", next = "post" },
        { text = "I saw what the plague did at home.", next = "lordaeron", when = { race = "Human" } },
        { text = "Keep the outpost safe.", next = "END" },
      },
    },
    forsaken = {
      lines = {
        { id = "forsaken_default", text = "They've set up camps in the woods and they brew things there, vials and powders that kill trees from the root up. I've asked travellers to bring me samples, so the druids can learn what it is." },
      },
      choices = {
        { text = "What will you do once you know?", next = "forsaken2" },
      },
    },
    forsaken2 = {
      lines = {
        { id = "forsaken2_default", text = "That depends on the Sentinels, and on the Horde, who claim the Forsaken are their allies now. Some of my people would burn every camp, and others want proof before we start a war nobody can stop." },
      },
      choices = {
        { text = "Burn the camps. Plague is plague, whoever carries it.", next = "BACK", fx = { align = { order = -1 }, trait = { stern = 1 } } },
        { text = "Get proof first. A war needs more than suspicion.", next = "BACK", fx = { align = { order = 1 }, trait = { patient = 1 } } },
      },
    },
    east = {
      lines = {
        { id = "east_default", text = "Felwood, where the demons' corruption sits in the soil, and Azshara beyond, which is mostly ghosts and naga. We guard the road so the rot stays on that side of the hills." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    post = {
      lines = {
        { id = "post_default", text = "Badly, and slowly, from Astranaar along a road the Warsong orcs love to watch. Raene Wolfrunner sends what she can spare, and I'm grateful for every crate of it." },
      },
      choices = {
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    lordaeron = {
      lines = {
        { id = "lordaeron_default", text = "Then I'm sorry, and I'm glad you're here, because you'll recognise the signs faster than any of us. If you see a grey mist in the trees, don't breathe it, and tell me where it was." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a Sentinel officer, and Forest Song is the post nobody else wanted." } },
    _none = { { id = "tp_none", text = "I couldn't say, and out here I've learned not to guess." } },
  },
}

P:NPC {
  key = "bhaldaran", id = TODO_NPC("Bhaldaran Ravenshade"), name = "Bhaldaran Ravenshade", title = "Bowyer",
  bible = "bibles/ashenvale.md", role = "vendor", tier = "service",
  communities = { "ashenvale_road" }, temper = { "dry" }, values = { "craft", "private" },
  impression = {
    first = "Bhaldaran Ravenshade sells bows from a quiet camp off the Ashenvale road, far from town by choice. He judges a customer by how they hold a bow before he listens to a word they say.",
    third = "{name} met Bhaldaran Ravenshade, a bowyer who keeps a camp off the road in Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "Show me how you hold a bow before you ask the price of one." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still holding that thing wrong, I see. Come in, then." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Bhaldaran, and I make bows, which is all most people need to know about me. I live out here because the wood's better and the company's quieter." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "A hunter, at last, someone who'll appreciate the grain. Have a look at the longbows, and don't let your pet chew on the racks." },
      },
      again = {
        { id = "h_again1", text = "If there's something else, out with it, because those staves won't shape themselves." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Let me see your bows.", next = "BUSINESS" },
        { text = "What makes a good bow?", next = "bows" },
        { text = "Isn't it lonely out here?", next = "alone" },
        { text = "I'd like the best longbow you have.", next = "hunter", when = { class = "HUNTER" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    bows = {
      lines = {
        { id = "bows_default", text = "Patient wood and a patient maker, and Ashenvale has the first if not always the second. I let my staves season a full year, so if you want one sooner you'll have to buy someone else's." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = {
        { id = "alone_default", text = "It's peaceful, which isn't the same thing, though people in Astranaar never seem to understand that. The orcs cut on the far side of the river and leave me be, mostly." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hunter_default", text = "Then you'll pay for it, and you'll treat it better than you treat your boots. A bow remembers how it's handled, whatever the humans say." },
      },
      choices = {
        { text = "Understood.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a bowyer, and that's the long and short of it." } },
    _none = { { id = "tp_none", text = "Don't know, and I can't say I'm curious." } },
  },
}

P:NPC {
  key = "karang", id = TODO_NPC("Karang Amakkar"), name = "Karang Amakkar", title = "",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "zoramgar" }, temper = { "watchful" }, values = { "loyal", "practical" },
  impression = {
    first = "Karang Amakkar keeps Zoram'gar Outpost, a scrap of Horde camp on the Zoram Strand surrounded by elves and naga. He has the patience of an orc who has learned to wait for his chances.",
    third = "{name} met Karang Amakkar, who commands the Horde's Zoram'gar Outpost on the coast of Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "Lok'tar, stranger. You found Zoram'gar, which means the elves didn't find you first." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the strand. Good, I can use every blade I can get." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Karang, and this outpost is the Horde's foothold on the western shore. The naga crawl up from the water, the elves watch from the trees, and somewhere out in the bay lies Blackfathom Deeps, full of things worse than either." },
        { id = "h_cond", when = { race = "Orc" }, text = "An orc of the Horde, good. You'll know we didn't come to this coast to admire it, so let us speak plainly." },
      },
      again = {
        { id = "h_again1", text = "Say what else is on your mind, and say it before the tide turns." },
        { id = "h_again2", text = "Speak, I'm listening." },
      },
      choices = {
        { text = "Why hold this strand at all?", next = "strand" },
        { text = "Where do the naga come from?", next = "naga" },
        { text = "Do you send word to Splintertree?", next = "splinter" },
        { text = "Then plainly: what do you need?", next = "orc", when = { race = "Orc" } },
        { text = "Strength to Zoram'gar.", next = "END" },
      },
    },
    strand = {
      lines = {
        { id = "strand_default", text = "Because the Warchief needs wood and the Horde needs a road to the sea, and the elves would give us neither if they could help it. Every day we stay here, the forest learns we are not leaving." },
      },
      choices = {
        { text = "The elves see it as theft.", next = "strand2" },
      },
    },
    strand2 = {
      lines = {
        { id = "strand2_default", text = "They would, and perhaps they are not wrong, but my people need timber and they are not going to freeze for an elf's sake. Some say we should parley with the Sentinels, and some say the axe is the only word they hear." },
      },
      choices = {
        { text = "Talk first. The Horde needs peace more than wood.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The axe, then. They started this when they hunted us.", next = "BACK", fx = { align = { order = -1 }, trait = { fierce = 1 } } },
      },
    },
    naga = {
      lines = {
        { id = "naga_default", text = "From the deep water, and from Blackfathom, where they serve some mistress the elves are afraid to name. They are cold and clever, and they hate the elves even more than they hate us, which I find almost comforting." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    splinter = {
      lines = {
        { id = "splinter_default", text = "When a runner can get through, yes. Splintertree fights the Sentinels on the east road and we fight the naga here, and between us we keep the Horde's name alive in this forest." },
      },
      choices = {
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    orc = {
      lines = {
        { id = "orc_default", text = "Blades, supplies, and someone who can walk into the Deeps and walk out again. If you're that orc, I'll remember your name to the Warchief." },
      },
      choices = {
        { text = "I'll think on it.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I serve the Horde, and Zoram'gar is where it sent me." } },
    _none = { { id = "tp_none", text = "I don't know. Ask someone who stays indoors more." } },
  },
}

P:NPC {
  key = "ruul", id = TODO_NPC("Ruul Snowhoof"), name = "Ruul Snowhoof", title = "",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "thistlefur" }, temper = { "gentle" }, values = { "kind", "brave" },
  impression = {
    first = "Ruul Snowhoof is a furbolg held captive by his own maddened tribe, the Thistlefur. He is the only one left among them with clear eyes, and it grieves him.",
    third = "{name} met Ruul Snowhoof, a Thistlefur furbolg kept captive by his own maddened kin in Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "You are not Thistlefur, and you have not come to hurt Ruul. That is good, that is very good." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back for Ruul. Few do that for a furbolg, and Ruul will not forget it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ruul's tribe, the Thistlefur, have gone mad, and they keep Ruul in this cage because Ruul would not go mad with them. If you set Ruul free, Ruul will walk you to safety, though the way is long." },
        { id = "h_cond", when = { race = "Tauren" }, text = "Shu'halo, cousin of the forest! Ruul knew your people's drums once, from the old days, before the madness." },
      },
      again = {
        { id = "h_again1", text = "What else does the friend want to know?" },
        { id = "h_again2", text = "Ruul is listening, and Ruul is not going anywhere." },
      },
      choices = {
        { text = "What made your tribe mad?", next = "madness" },
        { text = "Where will you go if you're free?", next = "ruul" },
        { text = "Why trust the Horde?", next = "horde" },
        { text = "My people remember the furbolgs kindly.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll come back for you, Ruul.", next = "END" },
      },
    },
    madness = {
      lines = {
        { id = "madness_default", text = "Something in the forest, or in the water, Ruul does not know which. The red-eyed ones say a voice in the ground speaks to them, and Ruul hears only the wind, which is how Ruul knows he is still Ruul." },
      },
      choices = {
        { text = "Can they be saved?", next = "madness2" },
      },
    },
    madness2 = {
      lines = {
        { id = "madness2_default", text = "Ruul hopes so, every night, but Ruul has seen them kill their own cubs. The Horde wants their land, and the elves want them gone, and nobody asks what the furbolgs want." },
      },
      choices = {
        { text = "They should be healed, not hunted.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "If they kill cubs, they're beyond saving.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    ruul = {
      lines = {
        { id = "ruul_default", text = "East, to the Timbermaw if they will have Ruul, for they are still themselves. Ruul has no tribe now, and a furbolg without a tribe is only half a furbolg." },
      },
      choices = {
        { text = "I hope they take you in.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "horde_default", text = "Ruul trusts the one standing at the cage, not the banner behind them. You came to talk before you came to kill, and that is a thing Ruul notices." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_default", text = "Then the Earth Mother has not forgotten Ruul's people either. When you are home, tell the elders that one Thistlefur kept his mind." },
      },
      choices = {
        { text = "I will. Something else?", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ruul is a Thistlefur, the last one with clear eyes." } },
    _none = { { id = "tp_none", text = "Ruul does not know that, friend. Ruul knows trees and cages, mostly." } },
  },
}
