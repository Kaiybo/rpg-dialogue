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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Tabetha, and yes, I live out here by choice. The marsh is full of mana and short on meddlers, which is exactly how a mage likes her neighborhood." },
        { id = "h_c0", when = { class = "MAGE" }, text = "Another student of the arcane! Then you'll feel it too, the way the ley energy pools in this swamp like rainwater." },
      },
      again = { { id = "h_again", text = "What else, dear? Visitors are so rare out here that I'm glad of every question." }, { id = "h_again2", text = "Ask, dear. I've time." } },
      choices = {
        { text = "Why live out in the swamp?", next = "b1_1" },
        { text = "Do you know Lady Jaina?", next = "b2_1" },
        { text = "What dangers should I watch for?", next = "b3_1" },
        { text = "Could you teach me something about the ley lines?", next = "x_1", when = { class = "MAGE" } },
        { text = "Shouldn't you be helping Theramore?", next = "s_1" },
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Jarl, and they call me Swamp Eye because I see everything that moves out here. Nobody sneaks past my house without me knowing it, no matter what that Theramore lot thinks." },
        { id = "h_c0", when = { class = "ROGUE" }, text = "You're the sneaky sort, aren't you? Well, Swamp Eye sees you all the same, so don't get any ideas about my larder." },
      },
      again = { { id = "h_again", text = "What else? Speak up, I'm watching the reeds." }, { id = "h_again2", text = "Anything more? Make it quick." } },
      choices = {
        { text = "What have you seen in the swamp?", next = "b1_1" },
        { text = "Why live out here?", next = "b2_1" },
        { text = "Do you trust Theramore?", next = "b3_1" },
        { text = "Theramore's people aren't all bad.", next = "x_1", when = { race = "Human" } },
        { text = "Why not move into Theramore?", next = "s_1" },
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ogron is ogre, but Ogron not want to smash Alliance. Ogron want to help find who burn the inn, because Ogron see things too, and nobody ask Ogron." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Questioning Reethe") }, text = "Ogron go with you to find Reethe, and you ask the questions, because Ogron not good with words. But Ogron good at keeping you safe." },
      },
      again = { { id = "h_again", text = "You want ask Ogron more?" }, { id = "h_again2", text = "Ogron listening, friend." } },
      choices = {
        { text = "Why help the Alliance?", next = "b1_1" },
        { text = "What did you see?", next = "b2_1" },
        { text = "Where is your clan?", next = "b3_1" },
        { text = "Ogres attacked my people for years.", next = "x_1", when = { race = { "Human", "Dwarf" } } },
        { text = "Can an ogre really change?", next = "s_1" },
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Private Hendel, Theramore Guard, posted at Sentry Point. We watch the northern road so Theramore knows what's coming before it arrives, and lately what's coming is trouble." },
        { id = "h_c0", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "You're asking after the diplomat? Plenty of people have, and I've told every one of them I saw nothing out of the ordinary." },
      },
      again = { { id = "h_again", text = "Anything else, citizen?" }, { id = "h_again2", text = "Make it quick; I'm on watch." } },
      choices = {
        { text = "What happened at the Shady Rest?", next = "b1_1" },
        { text = "What's it like out here?", next = "b2_1" },
        { text = "Do you see much Horde traffic?", next = "b3_1" },
        { text = "Lonely posts make soft soldiers.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Should Theramore make peace with the Horde?", next = "s_1" },
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Me Mok'Morokk, overlord of the Stonemaul! The black dragon killed our chief and drove us from our home, so now we live here, with the orcs, and Mok'Morokk the boss." },
        { id = "h_c0", when = { race = "Orc" }, text = "An orc! You good friends with Stonemaul, so Mok'Morokk let you talk. Talk fast, though." },
      },
      again = { { id = "h_again", text = "What else you want?" }, { id = "h_again2", text = "Speak! Mok'Morokk hungry." } },
      choices = {
        { text = "What happened to the Stonemaul?", next = "b1_1" },
        { text = "Why do you need me?", next = "b2_1" },
        { text = "Do the orcs respect you?", next = "b3_1" },
        { text = "I'm strong enough to fight for you.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Should the Stonemaul serve the Horde?", next = "s_1" },
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Draz'Zilb, advisor to Overlord Mok'Morokk. While he leads the Stonemaul with his fists, I lead them with knowledge, and between us we keep Brackenwall standing." },
        { id = "h_c0", when = { class = { "MAGE", "WARLOCK" } }, text = "A fellow student of the arcane. Most ogres think magic is merely a loud kind of club, and it is pleasant to speak with someone who knows better." },
      },
      again = { { id = "h_again", text = "Draz'Zilb hears you, small one. Ask your next question and be clever about it." }, { id = "h_again2", text = "Ask, and I shall answer if I can." } },
      choices = {
        { text = "Tell me about Brackenwall.", next = "b1_1" },
        { text = "You don't sound like the overlord.", next = "b2_1" },
        { text = "What of the black dragons?", next = "b3_1" },
        { text = "Thrall values the Stonemaul.", next = "x_1", when = { race = "Orc" } },
        { text = "Is your overlord a good leader?", next = "s_1" },
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
