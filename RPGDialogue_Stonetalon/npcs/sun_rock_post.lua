-- Sun Rock Retreat's keepers: Tharm (wind rider master), Gereck (stable master), Hgarth (enchanting
-- trainer on the cliff), Jeeda (apprentice witch doctor, upstairs at the inn). Horde, service tier.
-- Voice: bibles/sun_rock_post.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC = P.TODO_NPC

-- Tharm: tauren wind rider master.
P:NPC {
  key = "tharm", id = TODO_NPC("Tharm"), name = "Tharm", title = "Wind Rider Master",
  bible = "bibles/sun_rock_post.md", role = "flightmaster", tier = "service",
  communities = { "sun_rock" }, temper = { "calm", "watchful" }, values = { "duty", "nature" },
  notices = { "race", "weary", "class" },
  impression = {
    first = "Tharm keeps the wind riders at Sun Rock and talks about the mountain winds as if they were moody relatives. He watches the cliffs for harpies even while he's speaking to you.",
    third = "{name} met Tharm, the tauren wind rider master of Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_default", text = "The winds are good today, {class}, so if you're flying, now is the time." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the rock. The riders remember you, so they won't snap at you this time." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night flights are smooth over the mountains, because the harpies sleep, though the riders would rather sleep too." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Earth Mother guide you. You'll find the riders carry a tauren more easily than an orc, though I never tell the orcs that." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the wind-walking people, I'm told. The riders sniff at you because you smell of high air, the way they do, and they don't know what to make of it." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Some of your kind ask me why they should ride when they might one day fly on their own, and I tell them the riders know the way already." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You're hurt, and a rider won't wait for you to steady yourself. Rest at Jayka's first, and fly when you can hold on." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Tharm, and I keep the wind riders of Sun Rock. They'll carry you to Thunder Bluff, to the Crossroads, or south over the mountains to Shadowprey on the Desolace coast, and they know the winds better than any map." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc, and you'll be wanting Orgrimmar. The riders will take you to the Crossroads, and from there you know the way home better than I do." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? The riders are in no hurry." },
        { id = "h_again2", text = "Ask what you like. The wind won't change for a while yet." },
      },
      choices = {
        { text = "What are the winds like here?", next = "winds" },
        { text = "Do the harpies trouble the riders?", next = "harpies" },
        { text = "What lies down in Desolace?", next = "desolace" },
        { text = "Do the riders ever fight?", next = "fight", when = { any = { { class = "WARRIOR" }, { class = "HUNTER" } } } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Farewell, Tharm.", next = "END" },
      },
    },

    winds = {
      lines = {
        { id = "wi_default", text = "They come up the cliffs in the morning and roll back down at dusk, like breath. A young rider fights them, and an old one lets them carry it, and I only send the old ones out with travellers." },
      },
      choices = {
        { text = "Do you ever fly yourself?", next = "winds_self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winds_self = {
      lines = {
        { id = "ws_default", text = "Every dawn, to see the mountain whole before the day begins. The Charred Vale looks worse from above than from the ground, and the goblins' clearings look like sores on a hide." },
      },
      choices = {
        { text = "Then someone must heal them.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    harpies = {
      lines = {
        { id = "ha_default", text = "The Bloodfury dive at the riders when they pass the vale, and a wind rider will turn to fight even with someone on its back. I've lost one rider and nearly lost two travellers, so I fly the long way round now." },
      },
      choices = {
        { text = "Should we clear the harpies out?", next = "harpies_clear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harpies_clear = {
      big = true,
      lines = {
        { id = "hc_default", text = "Maggran says so, and he sends braves up the cliffs for their talons. Tammra says the land will push the harpies out once it heals, and I've lived long enough to think they're both partly right." },
      },
      choices = {
        { text = "Maggran's right. Drive them off with spears.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Heal the land and let it push them out.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    desolace = {
      lines = {
        { id = "de_default", text = "Grey land and old bones, and centaur clans who fight each other when they aren't fighting us. The troll village at Shadowprey sits on the coast, and the riders land there gladly, because it's the only green the land has left." },
      },
      choices = {
        { text = "Why is Desolace so grey?", next = "desolace_grey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    desolace_grey = {
      lines = {
        { id = "dg_default", text = "The shaman say something old and angry sleeps under it, and that the land is sick with its dreaming. I only know the riders don't like flying low over the kodo graveyard, and I don't ask them to." },
      },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Farewell, Tharm.", next = "END" },
      },
    },

    fight = {
      big = true,
      lines = {
        { id = "fi_default", text = "They do, and fiercely, but they're not war beasts unless they're raised to it, and mine are carriers. I won't send them into a battle, whatever an officer asks, because a rider lost carrying a message is a rider I can't replace." },
      },
      choices = {
        { text = "Every beast should serve the Horde in war.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right to keep them out of it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I raised riders at Thunder Bluff before I came here. The mountains suit them better than the bluffs." } },
    advice = { { id = "tp_ad", text = "Lean into the wind, not away from it. The rider will thank you." } },
    _none = { { id = "tp_none", text = "The riders don't know that, and so neither do I." } },
  },
}

-- Gereck: orc stable master.
P:NPC {
  key = "gereck", id = TODO_NPC("Gereck"), name = "Gereck", title = "Stable Master",
  bible = "bibles/sun_rock_post.md", role = "stablemaster", tier = "service",
  communities = { "sun_rock" }, temper = { "gruff", "fond" }, values = { "loyal", "practical" },
  notices = { "pet", "class" },
  impression = {
    first = "Gereck keeps the stables at Sun Rock and talks to the beasts more kindly than he talks to their owners. He has a scar from every kind of animal in Kalimdor and a story for most of them.",
    third = "{name} met Gereck, the gruff orc stable master of Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_default", text = "Leaving a beast or taking one back? Either way, mind the cat in the end stall, because she bites." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your beasts ate well while you were gone, better than you did, I'd guess." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine {pet}. It's been watching the stalls since you walked up, wondering which of them it could take in a fight." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Good; you're the only ones who use me, and the only ones who ask how the beasts are before they ask the price." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gereck, stable master. I keep hunters' beasts fed and quiet while their masters climb about the mountain, and I've a few scars from the ones that didn't want to be kept." },
        { id = "h_notHunter", when = { class = "WARRIOR" },
          text = "You're no hunter, so I don't know what you'd want with my stables, unless you've come to look at the beasts. That's allowed, but don't put your hand through the bars." },
      },
      again = {
        { id = "h_again", text = "What else? The cat's getting restless." },
        { id = "h_again2", text = "Something more? Talk while I fill the troughs." },
      },
      choices = {
        { text = "What's the cat in the end stall?", next = "cat" },
        { text = "What beasts do hunters bring up here?", next = "beasts" },
        { text = "How do you care for so many?", next = "care" },
        { text = "I need my stable.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Farewell, Gereck.", next = "END" },
      },
    },

    cat = {
      lines = {
        { id = "ca_default", text = "A mountain cougar, left here by a hunter who went down into Desolace and hasn't come back for her. That was two seasons ago, and I'm too fond of her now to sell her, which she knows." },
      },
      choices = {
        { text = "Do you think the hunter's dead?", next = "cat_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cat_dead = {
      big = true,
      lines = {
        { id = "cd_default", text = "Probably, because Desolace eats people, but I keep her stall paid out of my own pocket in case I'm wrong. A beast shouldn't be given away just because its master is late." },
      },
      choices = {
        { text = "That's loyalty. Keep waiting.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let her go to a hunter who'll use her.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    beasts = {
      lines = {
        { id = "be_default", text = "Wolves from Durotar, cats from the Barrens, and boars, which I hate, because they eat the stall doors. The tauren bring plainstriders, and the trolls bring things I've had to look up." },
        { id = "be_troll", when = { race = "Troll" }, text = "Wolves and cats, mostly, and your people bring bats and raptors, which I've had to learn about the hard way. The raptor took a finger's worth off my hand and I've forgiven it." },
      },
      choices = {
        { text = "What did you have to look up?", next = "beasts_odd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_odd = {
      lines = {
        { id = "bo_default", text = "A crab the size of a shield, from the Darkspear isles, that ate nothing but fish and hated me personally. Its master swore it was the finest beast in Kalimdor, and I've never been so glad to see a hunter come back." },
      },
      choices = {
        { text = "I'll keep my crab away from you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    care = {
      big = true,
      lines = {
        { id = "cr_default", text = "Feed them before yourself, speak low, and never let them see you're afraid. Some keepers use a whip on the bad ones, and I won't have it in my stables, though it makes my days longer." },
      },
      choices = {
        { text = "A firm hand keeps a beast in line.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Patience over the whip. You're right.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Wolf handler for my clan before the camps. The wolves were the only thing the camps didn't take from me." } },
    advice = { { id = "tp_ad", text = "Feed your beast first, every time. It remembers." } },
    _none = { { id = "tp_none", text = "Don't know. Ask a beast, they know more than people think." } },
  },
}

-- Hgarth: orc enchanting trainer on a cliff above Sun Rock.
P:NPC {
  key = "hgarth", id = TODO_NPC("Hgarth"), name = "Hgarth", title = "Enchanting Trainer",
  bible = "bibles/sun_rock_post.md", role = "trainer", tier = "service",
  communities = { "sun_rock" }, temper = { "aloof", "proud" }, values = { "knowledge", "discipline" },
  notices = { "craft", "class", "arcane" },
  impression = {
    first = "Hgarth teaches enchanting from a ledge above Sun Rock that most people never find, and he seems to like it that way. He asked whether I had come for knowledge, and he sounded doubtful about the answer.",
    third = "{name} climbed to Hgarth, the orc enchanter who teaches from a hidden ledge above Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_default", text = "Have you come to seek the knowledge of Hgarth? You must have, because nobody climbs that path by accident." },
    { id = "g_back", when = { metBefore = true }, text = "You found the path a second time. Good; most forget it, and I don't remind them." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "Your hands carry the dust of disenchanted things. Show me what you've learned, and I'll tell you how much of it is wrong." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You'll think enchanting is a lesser art, as your kind usually do, until you try to hold a spell inside a cloak for a year." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. Don't bring your fel up here; it sours the rods, and I can smell it on you from the path." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Hgarth, and I teach the art of enchanting to those who climb this far. The wind on this ledge keeps the work clean, and the climb keeps out those who want it only a little." },
        { id = "h_notEnch", when = { profession = { "Tailoring", "Blacksmithing", "Leatherworking" } },
          text = "You're a crafter, but not an enchanter, and you climbed anyway. Either you're curious, or you're lost, and I'll find out which by your questions." },
      },
      again = {
        { id = "h_again", text = "What else? Speak; the wind will take it away soon enough." },
        { id = "h_again2", text = "Another question. You climbed for them, so ask." },
      },
      choices = {
        { text = "Why teach up here, where no one can find you?", next = "ledge" },
        { text = "What is enchanting, truly?", next = "art" },
        { text = "Where did an orc learn this?", next = "learned" },
        { text = "Train me.", next = "BUSINESS", when = { profession = "Enchanting" } },
        { text = "I'll climb back down. Farewell.", next = "END" },
      },
    },

    ledge = {
      big = true,
      lines = {
        { id = "le_default", text = "Because those who want the art badly enough will find the path, and those who don't will waste my rods. Kulwia thinks I'm unfriendly, and she's right, but my students finish what they start." },
      },
      choices = {
        { text = "Knowledge should be open to anyone who asks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Hard paths make good students. Keep the ledge.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    art = {
      lines = {
        { id = "ar_default", text = "Taking the power out of one thing and binding it into another, so a cloak turns a blade or a bracer gives strength. Unmake carelessly and you get dust, and bind carelessly and you get a cloak that burns its wearer." },
      },
      choices = {
        { text = "Has that happened?", next = "art_burn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    art_burn = {
      lines = {
        { id = "ab_default", text = "Once, to a student of mine who rushed. He lived, and he learned, and he doesn't rush now; he also doesn't wear cloaks, which is a shame in these winds." },
      },
      choices = {
        { text = "I'll take my time, then.", next = "BACK", fx = { trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    learned = {
      lines = {
        { id = "lr_default", text = "From the warlocks of the old Horde, before Thrall, though I learned only the binding and refused the rest. I watched what they did with the power they took, and I chose to take it out of stones and cloth instead of out of people." },
      },
      choices = {
        { text = "You turned away from the warlocks?", next = "learned_turn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned_turn = {
      big = true,
      lines = {
        { id = "lt_default", text = "I did, and I paid for it in the camps like everyone else, but my hands are clean of that work. Some say the knowledge itself was tainted, and I say the hand that uses it decides, and we'll never agree." },
      },
      choices = {
        { text = "Knowledge is only a tool. The hand decides.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some knowledge stains whoever learns it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned binding in the old Horde and kept it when I left the rest behind. That's all you'll get from me." } },
    advice = { { id = "tp_ad", text = "Disenchant what you don't need. Dust is more useful than vanity." } },
    _none = { { id = "tp_none", text = "That isn't enchanting, so it isn't my concern." } },
  },
}

-- Jeeda: orc apprentice witch doctor, reagent vendor upstairs in the inn.
P:NPC {
  key = "jeeda", id = TODO_NPC("Jeeda"), name = "Jeeda", title = "Apprentice Witch Doctor",
  bible = "bibles/sun_rock_post.md", role = "vendor", tier = "service",
  communities = { "sun_rock" }, temper = { "eager", "nervous" }, values = { "learning", "ambitious" },
  notices = { "class", "race", "craft" },
  impression = {
    first = "Jeeda sells herbs and powders upstairs in Sun Rock's inn and calls herself an apprentice witch doctor, though she isn't sure whose apprentice she is. She is eager, a little jumpy, and very keen to be taken seriously.",
    third = "{name} met Jeeda, the orc apprentice witch doctor who sells reagents upstairs at Sun Rock's inn.",
  },

  greetings = {
    { id = "g_default", text = "Oh, a customer, come up, come up! Mind the jars on the stair, because some of them are only nearly sealed." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Did the powder work? Don't tell me if it didn't, because I'm having a good day." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll! Do you know any witch doctors? Real ones, I mean, from the isles, who might want an apprentice who works hard and doesn't complain much?" },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. You talk to spirits properly, the way I'm trying to learn, so please don't laugh at my jars." },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "An herbalist! If you've any earthroot or mageroyal you don't need, I buy them, and I'm told I pay fairly, though I'm never sure." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Jeeda, apprentice witch doctor, and I sell herbs, potions and powders from up here where the smoke can get out of the window. Jayka lets me have the room as long as nothing explodes, and nothing has, lately." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue, so you'll want vanishing powder, everyone like you does. I make it myself, mostly, and it works nearly every time, which I'm told is the right amount." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got time, as long as the pot doesn't boil over." },
        { id = "h_again2", text = "Ask away! I like questions, because I can usually answer one or two." },
      },
      choices = {
        { text = "Whose apprentice are you?", next = "master" },
        { text = "What does a witch doctor's apprentice do?", next = "work" },
        { text = "Has anything ever exploded?", next = "boom" },
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "Good luck, Jeeda.", next = "END" },
      },
    },

    master = {
      lines = {
        { id = "ma_default", text = "That's the hard part, because I'm an orc and the witch doctors are mostly trolls, and they don't take orc students easily. I've written to the witch doctor down at Malaka'jin three times, and he sent me back a frog the last time." },
      },
      choices = {
        { text = "A frog? What did that mean?", next = "master_frog" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_frog = {
      big = true,
      lines = {
        { id = "mf_default", text = "I don't know, and I've been too frightened to ask, so I've been feeding it and hoping that's the test. I've heard things about what he keeps in the cages down there, too, and I'm not sure I want to learn all of it." },
      },
      choices = {
        { text = "Learn it all. Power is power.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Find a teacher you can trust.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    work = {
      lines = {
        { id = "wo_default", text = "Grind roots, dry leaves, listen for spirits, and write down everything, because nobody tells you twice. I've filled two books and I understand about a third of what's in them." },
      },
      choices = {
        { text = "Can you hear the spirits yet?", next = "work_spirits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_spirits = {
      lines = {
        { id = "ws_default", text = "Sometimes, at night, when the wind comes off the Charred Vale, and they sound angry and very tired. Tammra says that's the land, not the spirits, and I don't know how to tell the difference yet." },
      },
      choices = {
        { text = "You'll learn. Keep listening.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    boom = {
      lines = {
        { id = "bo_default", text = "Only once, and only a small one, and Jayka still talks about her eyebrows. I've moved the firebloom to a jar on the far side of the room, and I'm fairly sure that's fixed it." },
      },
      choices = {
        { text = "Fairly sure?", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Farewell, Jeeda.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I grew up in Razor Hill watching the Darkspear witch doctors, and I never wanted to do anything else." } },
    advice = { { id = "tp_ad", text = "Never sniff a jar to find out what's in it. Read the label first, if there is one." } },
    _none = { { id = "tp_none", text = "I don't know, but I'll write it down in case someone tells me later." } },
  },
}
