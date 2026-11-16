-- Dustwallow between the towns: Tabetha's hut, Swamp Eye Jarl's farm, Sentry Point, Ogron in the marsh, and the leaders of Brackenwall Village.
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tabetha", id = TODO_NPC("Tabetha"), name = "Tabetha",
  bible = "bibles/dustwallow.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Tabetha lives alone in a hut deep in the southern marsh, a mage who chose the swamp over Theramore's towers and doesn't regret it.",
    third = "{name} met Tabetha, a reclusive mage living in the southern marshes of Dustwallow.",
  },
  greetings = {
    { id = "g_main", text = "Come in, come in, and wipe your boots, though in this marsh I suppose there's little point." },
    { id = "g_back", when = { metBefore = true }, text = "You found your way back through the mire! Most don't bother twice." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I think the spirits were here long before the mana pooled, and they put up with it the way neighbors put up with a noisy house. The ogres and the dragons disturb them far more than I ever could." } },
      choices = {
        { text = "Then be a quiet neighbor, Tabetha. The spirits deserve that.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The spirits can adapt. Your research matters more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The ley energy pools here whether I touch it or not, and I only ever take a cupful. Still, I know your Circle frowns on my sort tapping wild places, and I've never quite decided whether they're wrong." } },
      choices = {
        { text = "Take only what you need, and the marsh will forgive you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Mana is there to be used. Take all you like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Little ones, mostly, the sort that tickle the back of my neck when something bigger than a frog comes near the door. They've warned me about raptors, ogres and one very lost Theramore patrol, and today about you." } },
      choices = {
        { text = "Good wards. A woman alone out here should have them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Next time I'll find a way past them, just to prove it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It sours it, the way salt sours a well, and the pools out here take years to clear. I've no quarrel with you personally, but the marsh is my home, and I'll be choosy about who casts what on my doorstep." } },
      choices = {
        { text = "Your home, your rules. I'll keep my craft elsewhere.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Mana is mana. It'll forgive a little fel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll feel the mana in this marsh as a hum in the ground, I suspect, and I'd love to know whether it hums the same for you as it does for me." },
        { id = "h_default", key = true, text = "I'm Tabetha, and yes, I live out here by choice. The marsh is full of mana and short on meddlers, which is exactly how a mage likes her neighborhood." },
        { id = "h_c0", when = { class = "MAGE" }, text = "Another student of the arcane! Then you'll feel it too, the way the ley energy pools in this swamp like rainwater." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Before you say it, dear: yes, I draw on the swamp's mana, and no, I don't believe it minds." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You crept up on my hut very nicely, I'll give you that, but my wards noticed you three bushes back, so you may as well come and sit down." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You've come to a house built on mana, so please don't spill anything fel near it, because I'd have to clean the whole ley pool and I've only just finished." },
      },
      again = { { id = "h_again", text = "What else, dear? Visitors are so rare out here that I'm glad of every question." }, { id = "h_again2", text = "Ask, dear. I've time." } },
      choices = {
        { text = "Does all your magic out here disturb the marsh's spirits?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does the marsh truly not mind a mage drawing on it?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why live out in the swamp?", next = "b1_1" },
        { text = "Do you know Lady Jaina?", next = "b2_1" },
        { text = "What dangers should I watch for?", next = "b3_1" },
        { text = "Could you teach me something about the ley lines?", next = "x_1", when = { class = "MAGE" } },
        { text = "Shouldn't you be helping Theramore?", next = "s_1" },
        { text = "What wards do you keep around your hut, Tabetha?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does fel magic spoil the mana here, Tabetha?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Theramore is a fine city, but it's full of people with opinions about how a mage should work. Out here I have quiet, the mana pools and the occasional crocolisk at the door." } },
      choices = { { text = "What dangers do you ward against?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The marsh has its dangers, of course, from the black dragonflight's whelps to the Grimtotem in the south. I've learned which ones to ward against and which ones to simply avoid." } },
      choices = { { text = "That's kind of you.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "And when someone like you comes by needing help with a spell, I'm glad to give it. A hermit isn't the same as a hater of company." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Everyone in Dustwallow knows of Lady Proudmoore, and I respect her greatly. Still, I'm happier admiring her from a distance than sitting in her councils." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "The dragonkin to the south are no joke, and Onyxia's lair lies that way, so keep your head down near the Wyrmbog. The swamp itself is patient, too, and it'll swallow the careless." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Only the basics, I'm afraid, since the rest takes years of patience. Feel for the current under your feet, and never draw from it faster than it flows." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say a mage should serve the city that shelters her, but I've found I serve better from out here, where no one tells me how." } },
      choices = { { text = "Every hand matters. Theramore needs its mages.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "You owe nobody your solitude. Stay out here.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I can't say I know, dear, and I've read a great many books." } } },
}

P:NPC {
  key = "jarl", id = TODO_NPC("\"Swamp Eye\" Jarl"), name = "\"Swamp Eye\" Jarl",
  bible = "bibles/dustwallow.md", role = "questgiver", tier = "quest",
  impression = {
    first = "\"Swamp Eye\" Jarl lives in a ramshackle house in the marsh and has a lot to say about who's been sneaking through it.",
    third = "{name} met \"Swamp Eye\" Jarl at his house in the Dustwallow marsh.",
  },
  greetings = {
    { id = "g_main", text = "Hold there! Who're you and what d'you want in my swamp?" },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. Fine, come on in, I suppose." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "There are lights over the water at night and voices where nobody's standing, and the Theramore lot call me mad for mentioning it. I've lived here longer than they have, so I'll trust my own eyes over their sneers any day." } },
      choices = {
        { text = "Trust your eyes, Jarl. The marsh shows you true.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Lights and voices? The marsh water's gone to your head.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Things that shouldn't, that's what. The crocolisks have gone quiet as if they're hiding from something bigger, and there's soldiers on the road at night who don't carry torches." } },
      choices = {
        { text = "Tell Theramore's guard what you've seen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep your own counsel. Theramore hasn't earned it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A young one out of Theramore, chasing something across the bog that he swore was a will-o'-the-wisp. It was a lantern on a pole I'd put out myself, and he roasted half my patch before he noticed, so now I don't trust any of you near my garden." } },
      choices = {
        { text = "That's a fool's mistake. I'd make it right with you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A few turnips is the price of living near Theramore.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jarl.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Now and then, heading for the deep swamp with books under their arms and no sense in their heads. The black dragons over by Onyxia's lair don't care much for company, and I've seen more than one go in that never came back out." } },
      choices = {
        { text = "Then they went looking for power they couldn't handle.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Every one of them knew the risk. That's their right.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You see the marsh with different eyes, I suppose, but mine see plenty, and I don't need spirits to tell me who's sneaking about." },
        { id = "h_default", key = true, text = "Name's Jarl, and they call me Swamp Eye because I see everything that moves out here. Nobody sneaks past my house without me knowing it, no matter what that Theramore lot thinks." },
        { id = "h_c0", when = { class = "ROGUE" }, text = "You're the sneaky sort, aren't you? Well, Swamp Eye sees you all the same, so don't get any ideas about my larder." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, creeping about in animal skins! Don't think Swamp Eye can't tell a real crocolisk from a pretend one, because he can." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, eh? Don't go waving your hands about near my house, because the last one who did lit my turnips on fire and never paid for them." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, out here in my marsh. Swamp Eye doesn't miss things, and he certainly won't miss that little imp skulking about behind you." },
      },
      again = { { id = "h_again", text = "What else? Speak up, I'm watching the reeds." }, { id = "h_again2", text = "Anything more? Make it quick." } },
      choices = {
        { text = "Do the spirits of this marsh ever trouble you, Jarl?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What moves out in the swamp lately, Jarl?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What have you seen in the swamp?", next = "b1_1" },
        { text = "Why live out here?", next = "b2_1" },
        { text = "Do you trust Theramore?", next = "b3_1" },
        { text = "Theramore's people aren't all bad.", next = "x_1", when = { race = "Human" } },
        { text = "Why not move into Theramore?", next = "s_1" },
        { text = "Who set your turnips on fire, Jarl?", next = "xmage", when = { class = "MAGE" } },
        { text = "Have you seen other warlocks pass through the marsh, Jarl?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Strangers, mostly, and too many of them lately. Deserters, smugglers and folk wearing black shields who think nobody's looking." } },
      choices = { { text = "Black shields?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Theramore asked me about the Shady Rest Inn, as if I'd have anything to do with that place. I keep to myself and I tell the truth, which is more than I can say for some." } },
      choices = { { text = "Who should I trust?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you want to know what's really going on out here, follow the tracks and don't trust any travelers you meet on the road." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Because it's quiet and nobody bothers me, or nobody used to. Now I get soldiers, adventurers and every curious soul in Kalimdor knocking on my door." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Trust's a big word, friend. Lady Proudmoore's fair enough, but some of her soldiers would rather blame a swamp hermit than look at their own ranks." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Didn't say they were, friend. I said some of them are too quick to point fingers at an old man in a swamp." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "I've been asked to move into town more than once, and every time I say no. A man's home is his home, even if it's in a bog." } },
      choices = { { text = "Your home, your choice. Stay put.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "You'd be safer in the city. Swallow your pride.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Never seen it, never heard of it, and I see everything." } } },
}

P:NPC {
  key = "ogron", id = TODO_NPC("Ogron"), name = "Ogron",
  bible = "bibles/dustwallow.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Ogron is an ogre who has left his clan's ways behind and wanders the marsh near the Shady Rest, offering his help to Theramore's investigators.",
    third = "{name} met Ogron, a peaceful ogre in the Dustwallow marsh.",
  },
  greetings = {
    { id = "g_main", text = "Ogron say hello, and you not run away, so that good, very good!" },
    { id = "g_back", when = { metBefore = true }, text = "You come back, and that make Ogron happy, very happy!" },
  },
  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ogre magi very clever, and they whisper in the big ogre's ear until the big ogre does what they want. Ogron not like that, because Ogron think if you want something, you ask for it with your own mouth." } },
      choices = {
        { text = "Magic should help people, Ogron, not rule them.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Someone has to guide the strong ones. Better a clever guide.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Ogron.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Long ago, an orc named Gul'dan gave ogres the fel magic and made them clever and cruel. Ogron's grandfather tell stories of it, and they are bad stories, so Ogron hope your stories end better." } },
      choices = {
        { text = "My magic serves the Alliance. It won't hurt you, Ogron.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power, Ogron. Gul'dan just used it well.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ogron is ogre, but Ogron not want to smash Alliance. Ogron want to help find who burn the inn, because Ogron see things too, and nobody ask Ogron." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Questioning Reethe") }, text = "Ogron go with you to find Reethe, and you ask the questions, because Ogron not good with words. But Ogron good at keeping you safe." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "You make magic like Draz'Zilb! But Ogron think your magic is kinder, because you not use it to tell people what to do." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Ogron know that smell, because it is the same as the old ogre magi. Ogron not afraid, but Ogron stand a little farther away, if that is all right with you." },
      },
      again = { { id = "h_again", text = "You want ask Ogron more?" }, { id = "h_again2", text = "Ogron listening, friend." } },
      choices = {
        { text = "Why help the Alliance?", next = "b1_1" },
        { text = "What did you see?", next = "b2_1" },
        { text = "Where is your clan?", next = "b3_1" },
        { text = "Ogres attacked my people for years.", next = "x_1", when = { race = { "Human", "Dwarf" } } },
        { text = "Can an ogre really change?", next = "s_1" },
        { text = "Do ogres use magic to rule each other, Ogron?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why does my magic smell like the ogre magi, Ogron?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Ogron's clan always fight, always smash, and Ogron tired of it. Ogron want to be friend instead, and humans give Ogron chance when nobody else would." } },
      choices = { { text = "You eat fish?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Some soldiers still scared of Ogron, and they look at Ogron like Ogron going to eat them. Ogron not eat people, Ogron eat fish." } },
      choices = { { text = "I'm glad you're here.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "So Ogron help, and maybe one day they not be scared anymore." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Ogron see men in black shields walking around the swamp, and Ogron see Reethe running away. Ogron think Reethe know something, but Ogron not sure what." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Far away, and Ogron not go back. They call Ogron weak, but Ogron think smashing all the time is the weak way." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Ogron know, and Ogron sorry. Ogron not do it, but Ogron sorry anyway, because somebody should be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Many people say Ogron can never be anything but ogre. Ogron says they wrong, but Ogron still have to prove it." } },
      choices = { { text = "Anyone can change. I believe you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "An ogre is an ogre. Prove it first.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Ogron not know that, but Ogron know fish!" } } },
}

P:NPC {
  key = "hendel", id = TODO_NPC("Private Hendel"), name = "Private Hendel",
  bible = "bibles/dustwallow.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Private Hendel keeps the post at Sentry Point, the lonely watchtower where Theramore's road meets the northern marsh.",
    third = "{name} met Private Hendel at Sentry Point in Dustwallow Marsh.",
  },
  greetings = {
    { id = "g_main", text = "Halt, traveler. State your business at Sentry Point." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Fine, pass on through, but keep your nose clean." },
  },
  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Mostly it hides the road, and whoever's on it, which is the trouble. Since the inn burned, every shape in the fog looks like a Horde raider to my lads, and I'm the one who tells them it's only a heron." } },
      choices = {
        { text = "Shooting at shapes in fog is how wars start.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better a dead heron than a dead guard.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Harder than it looks in daylight and easier than I'd like at night, because the fog off the marsh rolls right over the road. Whoever took the diplomat knew that too, and they knew it better than any traveler should." } },
      choices = {
        { text = "Then I'll report the gaps to Theramore, properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A tower that can be slipped past is no tower. Fix it yourself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Private.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because there's one tower, three men and a great deal of marsh, and things come out of the fog faster than we can light the brazier. A ward would warn us at least, though I'd settle for the Archmage remembering we exist." } },
      choices = {
        { text = "I'll remind Tervosh myself. You deserve better than this post.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A soldier who needs a ward isn't watching hard enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Private Hendel, Theramore Guard, posted at Sentry Point. We watch the northern road so Theramore knows what's coming before it arrives, and lately what's coming is trouble." },
        { id = "h_c0", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "You're asking after the diplomat? Plenty of people have, and I've told every one of them I saw nothing out of the ordinary." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A night elf druid out at Sentry Point? Don't go changing into anything large near the tower, because the lads on watch shoot first in this fog." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You came up the road without the watchtower spotting you, which is either impressive or a sign I need to have words with the lad on the ladder." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage on the north road? Good, because Archmage Tervosh is always on about sending us a ward for the tower, and you're the closest thing I've seen to one." },
      },
      again = { { id = "h_again", text = "Anything else, citizen?" }, { id = "h_again2", text = "Make it quick; I'm on watch." } },
      choices = {
        { text = "What does the fog hide out here, Private?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What happened at the Shady Rest?", next = "b1_1" },
        { text = "What's it like out here?", next = "b2_1" },
        { text = "Do you see much Horde traffic?", next = "b3_1" },
        { text = "Lonely posts make soft soldiers.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Should Theramore make peace with the Horde?", next = "s_1" },
        { text = "How hard is it to slip past Sentry Point, Hendel?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why does Sentry Point need a ward, Hendel?", next = "xmage", when = { class = "MAGE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "The inn burned, and Theramore says it was a Horde attack. Some of the locals say otherwise, though I wouldn't put much stock in swamp gossip." } },
      choices = { { text = "Do you believe the locals?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Whatever happened, it's put everyone on edge. The marsh was quiet before, or as quiet as a marsh ever gets." } },
      choices = { { text = "I'll keep that in mind.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you're investigating, talk to the captain in Theramore, and leave the rumors where you found them." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Damp, quiet and lonely, and I've had worse posts. At least the crocolisks don't talk back." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Some, from Brackenwall and further out. Lady Proudmoore wants peace with them, and I follow orders, so I keep my hands off my sword until I'm told otherwise." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Is that what you think? Come back when you've stood a month in the marsh and tell me again." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Lady Proudmoore believes peace is worth the risk. Plenty of us in the ranks think it's madness, though few will say so aloud." } },
      choices = { { text = "Peace is worth the risk. Lady Jaina is right.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "The Horde can't be trusted. The ranks are right.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Not something I know about. Move along, citizen." } } },
}

P:NPC {
  key = "mokmorokk", id = TODO_NPC("Overlord Mok'Morokk"), name = "Overlord Mok'Morokk",
  bible = "bibles/dustwallow.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Overlord Mok'Morokk rules the ogres of Brackenwall Village with a heavy hand and a heavier appetite.",
    third = "{name} met Overlord Mok'Morokk, the ogre leader of Brackenwall Village in Dustwallow Marsh.",
  },
  greetings = {
    { id = "g_main", text = "You stand before Mok'Morokk, so bow, little one! Maybe Mok'Morokk not squash you today." },
    { id = "g_back", when = { metBefore = true }, text = "You come back? Mok'Morokk has more work for strong ones." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Stonemaul have ogre magi, and ogre magi want gold and power, like Draz'Zilb. Orc shaman want nothing but to talk to wind, and Mok'Morokk not understand that at all." } },
      choices = {
        { text = "Shamans ask, and never take. That's the difference, Overlord.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Power is power. Your magi have the right idea.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Mok'Morokk trust Draz'Zilb like Mok'Morokk trust swamp water, which is not very much. He talk soft and smile big, and every time he smile, the Stonemaul do what he want instead of what the boss want." } },
      choices = {
        { text = "A wise boss listens to his advisor. Trust Draz'Zilb.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Watch him closely. Clever ones always want the throne.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Overlord.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because demon do what boss says, and Stonemaul ogres argue all day about the food. A demon would carry the meat, smash the black dragon's children, and never once ask Mok'Morokk for more gold." } },
      choices = {
        { text = "Demons serve no one for long, Overlord. Trust your ogres.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good demon is worth ten ogres. You're not wrong.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You shaman! Orc shaman talk to rocks, and rocks listen. Mok'Morokk talk to rocks, and rocks do nothing." },
        { id = "h_default", key = true, text = "Me Mok'Morokk, overlord of the Stonemaul! The black dragon killed our chief and drove us from our home, so now we live here, with the orcs, and Mok'Morokk the boss." },
        { id = "h_c0", when = { race = "Orc" }, text = "An orc! You good friends with Stonemaul, so Mok'Morokk let you talk. Talk fast, though." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "You make fire with your hands like Draz'Zilb! Mok'Morokk not like Draz'Zilb's fire, because it always point at Mok'Morokk when nobody look." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Your little demon smell like old Gul'dan stories! Mok'Morokk like strong magic, so maybe you make Mok'Morokk a demon too?" },
      },
      again = { { id = "h_again", text = "What else you want?" }, { id = "h_again2", text = "Speak! Mok'Morokk hungry." } },
      choices = {
        { text = "Do the Stonemaul have shamans of their own?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What happened to the Stonemaul?", next = "b1_1" },
        { text = "Why do you need me?", next = "b2_1" },
        { text = "Do the orcs respect you?", next = "b3_1" },
        { text = "I'm strong enough to fight for you.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Should the Stonemaul serve the Horde?", next = "s_1" },
        { text = "Do you trust Draz'Zilb's magic, Overlord?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why would you want a demon, Overlord?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "The black dragon Onyxia, she come and kill our chief, and our home at Stonemaul burn. The ogres who live had to run, and Mok'Morokk led them here." } },
      choices = { { text = "You thanked Thrall?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Now Brackenwall is our home, and the orcs give us protection. Mok'Morokk say thank you to Thrall, because that what a smart ogre do." } },
      choices = { { text = "Take it back how?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "But Mok'Morokk not forget. One day Stonemaul ogres take back what is ours, and the dragon pay." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Mok'Morokk need strong ones to do dangerous things, because Mok'Morokk too important to risk. That how being boss work." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Orcs respect strength, and Mok'Morokk very strong. Anyone who say otherwise, they talk to Mok'Morokk's fists." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Ha! Then you good for Mok'Morokk, and you go smash things Mok'Morokk not want to smash himself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some ogres say Mok'Morokk should rule alone, without orcs. Others say the Horde keep us safe from dragon. Mok'Morokk not decide yet." } },
      choices = { { text = "The Horde keeps you safe. Stay loyal.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "An overlord bows to no one. Rule alone.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Mok'Morokk not know, and Mok'Morokk not care!" } } },
}

P:NPC {
  key = "drazzilb", id = TODO_NPC("Draz'Zilb"), name = "Draz'Zilb",
  bible = "bibles/dustwallow.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Draz'Zilb is the cunning ogre advisor of Brackenwall Village, a mage whose quiet words carry more weight than his overlord's shouts.",
    third = "{name} met Draz'Zilb, the ogre mage advisor at Brackenwall Village.",
  },
  greetings = {
    { id = "g_main", text = "Well met, stranger, but speak softly, for the overlord does not like competition." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you have returned. Brackenwall still has need of capable hands." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ogres remember Gul'dan, who made the first ogre magi with fel magic and lies. When the black dragon drove us out and the orcs offered us Brackenwall speaking to the elements instead, we knew they had changed." } },
      choices = {
        { text = "The Horde has changed. We'll never go back to fel magic.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Gul'dan had power, at least. Not every warlock was a fool.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "It feels them as a wound feels the knife, small one. Since Onyxia's brood took the Wyrmbog, the beasts of the south marsh have grown savage, and even my spells taste of smoke down there." } },
      choices = {
        { text = "Then drive the brood out, and the marsh will heal.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power is power. Learn what the dragons know.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every advisor keeps ears in the village, because the overlord's moods change faster than the weather over the marsh. Nazeer and I share what we learn about Theramore, and we each keep a little back, which is how friends in the Horde stay friends." } },
      choices = {
        { text = "Keep your secrets. A wise advisor always holds something back.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Share everything with your allies. Secrets rot alliances.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, Draz'Zilb.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Gul'dan bargained with the dark powers and poured them into ogres to make the first magi, so yes, our power has a fel root. Draz'Zilb has spent his life making it grow into something else, and he will thank you not to water the old root." } },
      choices = {
        { text = "The root is the strength. Embrace what Gul'dan gave you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You've grown past it. That takes more strength than power does.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman of Thrall's Horde. The Warchief's restoring of your old ways is the reason the Stonemaul trusted the orcs at all." },
        { id = "h_default", key = true, text = "I am Draz'Zilb, advisor to Overlord Mok'Morokk. While he leads the Stonemaul with his fists, I lead them with knowledge, and between us we keep Brackenwall standing." },
        { id = "h_c0", when = { class = { "MAGE", "WARLOCK" } }, text = "A fellow student of the arcane. Most ogres think magic is merely a loud kind of club, and it is pleasant to speak with someone who knows better." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid of the tauren, here among the Stonemaul. Draz'Zilb has long wondered whether your magic and his drink from the same well." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You walk like a shadow, small one, and Draz'Zilb notices shadows, because the overlord's enemies use them and so does Draz'Zilb." },
      },
      again = { { id = "h_again", text = "Draz'Zilb hears you, small one. Ask your next question and be clever about it." }, { id = "h_again2", text = "Ask, and I shall answer if I can." } },
      choices = {
        { text = "Why did shamans make the Stonemaul trust the orcs?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does the swamp still feel the black dragons, Draz'Zilb?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me about Brackenwall.", next = "b1_1" },
        { text = "You don't sound like the overlord.", next = "b2_1" },
        { text = "What of the black dragons?", next = "b3_1" },
        { text = "Thrall values the Stonemaul.", next = "x_1", when = { race = "Orc" } },
        { text = "Is your overlord a good leader?", next = "s_1" },
        { text = "Do you keep spies in Brackenwall, Draz'Zilb?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Did the ogre magi learn their power from demons, Draz'Zilb?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Brackenwall is the home of the Stonemaul ogres who fled the black dragon, and of the orcs who sheltered us. It is not grand, but it is ours." } },
      choices = { { text = "You serve Thrall then?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The marsh is dangerous, with Theramore to the east and Onyxia's brood to the south. We must be clever to survive here, and cleverness is my duty." } },
      choices = { { text = "What do you need?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Do not underestimate the ogres of Brackenwall, friend. We may seem slow, but we remember everything." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Every ogre speaks in his own way, friend. Mok'Morokk shouts because he must be heard, while I speak softly because I wish to be listened to." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Onyxia's brood rules the southern marsh, and they hate all who live here. Our people learned that lesson in fire." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "And the Stonemaul value Thrall, though some of us remember when orcs and ogres fought side by side in darker days. I prefer these days." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Mok'Morokk is strong, and strength holds our people together. But strength alone is a poor master, and I whisper what he does not think of." } },
      choices = { { text = "Strength holds a people together. Follow him.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "A leader without wisdom fails. You should lead.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Even I do not know everything, though I would never say so to Mok'Morokk." } } },
}
