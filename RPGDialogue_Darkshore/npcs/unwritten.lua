-- Darkshore folk with no conversation until now: Heldan Galesong (fish seller on the Twilight Shore),
-- Fiora Longears (high elf on the Auberdine pier) and Tiyani (food and drink at the Grove of the Ancients).
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Heldan Galesong
---------------------------------------------------------------------------
P:NPC {
  key = "ds_heldan", id = TODO_NPC("Heldan Galesong"), name = "Heldan Galesong",
  role = "vendor", tier = "service",
  communities = { "darkshore_wilds" }, temper = { "calm", "dreamy" }, values = { "patience", "nature" },
  impression = {
    first = "He fishes alone on a long beach and seems to like it that way.",
    third = "{name} met Heldan Galesong, who fishes and sells his catch on the beach west of Ameth'Aran.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Mind the line, traveler; I've had one bite all morning and I'd hate to lose it." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "A fellow angler! Sit, if you like. The sea doesn't mind company if it's quiet." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Heldan Galesong. I fish where the Long Wash meets the Twilight Shore, and I sell what I catch to anyone who walks this far down the beach, which isn't many." },
      },
      again = {
        { id = "h_again", text = "Something else? The fish aren't biting anyway." },
        { id = "h_again2", text = "Ask away. I've nowhere to be." },
      },
      choices = {
        { text = "Why fish out here, so far from Auberdine?", next = "far" },
        { text = "Ameth'Aran is just up the hill. Have you been?", next = "ruins" },
        { text = "Show me your catch.", next = "BUSINESS" },
        { text = "Good fishing, Heldan.", next = "END" },
      },
    },
    far = {
      lines = { { id = "fa_default", text = "The fish here are fatter and the people fewer. Auberdine's dock is crowded with sailors and gossip, and neither one helps a man catch anything." } },
      choices = {
        { text = "What do you catch here?", next = "catch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    catch = {
      lines = { { id = "ca_default", text = "Rainbow fin albacore, mostly, and a few things I can't name that I throw back. Lately even the fish seem uneasy, as if something in the deep water disturbs them." } },
      choices = {
        { text = "The sea will settle. It always does.", next = "BACK", reply = "I hope you're right. I've never known it this restless.", fx = { align = { order = 1 } } },
        { text = "Something's wrong in Darkshore. Ignoring it won't help.", next = "BACK", reply = "No, I suppose not. But I'm a fisherman, not a Sentinel.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins = {
      lines = { { id = "ru_default", text = "Not since the ghosts started walking there. Ameth'Aran was a fine place once, they say, before the Highborne who lived there brought ruin on it. I keep to the beach." } },
      choices = { { text = "Wise of you. Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Fiora Longears
---------------------------------------------------------------------------
P:NPC {
  key = "ds_fiora", id = TODO_NPC("Fiora Longears"), name = "Fiora Longears",
  role = "questgiver", tier = "quest", race = "HighElf",
  communities = { "auberdine" }, temper = { "warm", "sharp" }, values = { "adventure", "talent" },
  impression = {
    first = "A high elf on the Auberdine pier, sizing up every traveler who steps off the boat.",
    third = "{name} met Fiora Longears, Red Jack Flint's partner in Auberdine, who sends promising travelers deeper into Kalimdor.",
  },
  greetings = {
    { id = "g_default", text = "Another new face off the boat! Welcome to Kalimdor, or at least the damp edge of it." },
    { id = "g_flint", when = { questActive = TODO_QUEST("Fiora Longears") }, text = "Red Jack sent you, didn't he? I can always tell. He picks the ones with salt still in their hair." },
    { id = "g_astra", when = { questActive = TODO_QUEST("Journey to Astranaar") }, text = "Still here, {name}? Astranaar is south, through the forest, and it won't come to you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Fiora Longears, at your service. Red Jack Flint and I keep an eye out for travelers with promise, and when one comes across from Menethil, I point them toward where they'll do the most good." },
        { id = "h_done", when = { questDone = TODO_QUEST("Fiora Longears") }, text = "Red Jack never misjudges a character, and he didn't misjudge you. You'll do well in Kalimdor, {name}." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? Ask before the next boat comes in." },
        { id = "h_again2", text = "Go on. I like talking to someone who isn't a sailor." },
      },
      choices = {
        { text = "Where should I go next?", next = "astranaar" },
        { text = "A high elf, this far from Quel'Thalas?", next = "quel" },
        { text = "How do you know Red Jack Flint?", next = "flint" },
        { text = "The night elves don't seem pleased to see you.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "Goodbye, Fiora.", next = "END" },
      },
    },
    astranaar = {
      lines = { { id = "as_default", text = "South, to Ashenvale, and the town of Astranaar. The Sentinels there are fighting the Horde for every tree, and they need people like you more than Darkshore does." } },
      choices = {
        { text = "What's waiting for me in Astranaar?", next = "astranaar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    astranaar2 = {
      lines = { { id = "a2_default", text = "Orcs with axes, satyrs in the woods, and furbolgs gone mad. It isn't pretty, but you'll learn more there in a week than you would in a year on this pier." } },
      choices = {
        { text = "Good. I want a real fight.", next = "BACK", reply = "Then you'll find one. Try not to find two at once.", fx = { align = { honor = 1 } } },
        { text = "I'd rather find work that pays than fights.", next = "BACK", reply = "Astranaar has both, if you're clever about it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quel = {
      lines = { { id = "qu_default", text = "Quel'Thalas is a long way, and a sad place since the Scourge came through. I wanted somewhere new, and Kalimdor is as new as the world gets." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flint = {
      lines = { { id = "fl_default", text = "Jack and I have sent travelers back and forth across the water for years. He talks too much and I listen too little, so we get along very well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kaldorei = {
      lines = { { id = "ka_default", text = "Your people and mine have old grudges, I know. I'd rather leave them in the old books where they belong. I'm only here to help." } },
      choices = {
        { text = "Old grudges have their reasons.", next = "BACK", reply = "They do. But I wasn't alive for any of them.", fx = { align = { order = 1 } } },
        { text = "Then let's leave them there.", next = "BACK", reply = "Thank you. That's kinder than most.", fx = { align = { order = -1 } } },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Tiyani
---------------------------------------------------------------------------
P:NPC {
  key = "ds_tiyani", id = TODO_NPC("Tiyani"), name = "Tiyani",
  role = "vendor", tier = "service",
  communities = { "grove_of_ancients" }, temper = { "gentle", "shy" }, values = { "hospitality", "nature" },
  impression = {
    first = "She sells dew and bread to travelers among the ancients.",
    third = "{name} met Tiyani, who sells food and drink at the Grove of the Ancients in Darkshore.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Grove. Please speak softly; the ancients are listening." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Thirsty again? The dew is fresh this morning." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tiyani. I keep food and drink for those who visit the Grove of the Ancients, and for the druids who forget to eat when they're talking to trees." },
      },
      again = {
        { id = "h_again", text = "Is there something else?" },
        { id = "h_again2", text = "Yes? I'm still here." },
      },
      choices = {
        { text = "Do the ancients really listen?", next = "ancients" },
        { text = "What do you sell?", next = "dew" },
        { text = "I'll buy something.", next = "BUSINESS" },
        { text = "Farewell, Tiyani.", next = "END" },
      },
    },
    ancients = {
      lines = { { id = "an_default", text = "They hear everything, though they answer slowly. Onu speaks for them, and even he takes his time choosing words." } },
      choices = {
        { text = "What troubles the ancients?", next = "ancients2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ancients2 = {
      lines = { { id = "a2_default", text = "The sickness in Darkshore, and the furbolgs gone wild, and the naga on the coast. Onu worries for all of it, and I worry because he does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dew = {
      lines = { { id = "de_default", text = "Morning glory dew, gathered from the leaves at sunrise, and bread baked in the old way. It isn't much, but it's honest food." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

-- Elder Starweave: a night elf ancestor-spirit in Auberdine during the Lunar Festival.
P:NPC {
  key = "ds_elder_starweave", id = 15601, name = "Elder Starweave", gender = "female",
  role = "elder", tier = "quest",
  temper = { "serene", "wise" }, values = { "memory", "Elune" },
  notices = { "race" },
  impression = {
    first = "A silver kaldorei spirit stands by the shore of Auberdine, her gaze on the dark sea.",
    third = "{name} honoured Elder Starweave in Auberdine at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. The festival moon has brought you to me." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Elune smiles on those who remember." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Starweave the Elder") }, text = "You seek the blessing of the elders. Come, and receive mine." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" }, text = "A daughter or son of the kaldorei. Your ancestors are glad of you." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" }, text = "A dwarf on our shores. Your people's ships have been good friends to Auberdine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Starweave, and once I wove the starlight into songs for the Sisters of Elune. Now each year the moon lets me return to these shores I loved." } },
      again = {
        { id = "h_again", text = "Speak, child. The tide is patient, and so am I." },
        { id = "h_again2", text = "What else would you know?" },
      },
      choices = {
        { text = "Why return to Darkshore?", next = "shore" },
        { text = "What is the Lunar Festival to the kaldorei?", next = "festival" },
        { text = "Darkshore seems troubled these days.", next = "troubled" },
        { text = "I serve Elune too, Elder.", next = "priest", when = { class = "PRIEST" } },
        { text = "Elune keep you, Elder.", next = "END" },
      },
    },
    shore = {
      lines = { { id = "s_default", text = "I walked these shores when the forests were young and the sea was gentle. The land has changed, but the moon on the water has not." } },
      choices = { { text = "It is a beautiful sight. Something else.", next = "BACK" } },
    },
    festival = {
      lines = { { id = "f_default", text = "It is our oldest rite, the honouring of the elders. In Moonglade, the druids open their sanctuary, and we wake the ancient Omen with light." } },
      choices = {
        { text = "Who is Omen?", next = "omen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    omen = {
      lines = { { id = "o_default", text = "A great beast of the old wars, cursed and driven beneath Moonglade's lake. Each festival the fireworks stir him, and brave souls drive him back down." } },
      choices = {
        { text = "I would fight him gladly.", next = "BACK", reply = "Then bring friends and bright rockets.", fx = { align = { valor = 1 } } },
        { text = "Some sleeping beasts are best left sleeping.", next = "BACK", reply = "Wise, perhaps. Yet tradition is tradition.", fx = { align = { valor = -1 } } },
      },
    },
    troubled = {
      lines = { { id = "t_default", text = "Yes, the furbolgs have gone mad and the old ruins stir with the restless dead. The Sentinels of Auberdine need every hand they can find." } },
      choices = { { text = "I'll lend mine. Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "Then you know her light does not fade, even for the dead. Carry it gently, and she will carry you." } },
      choices = { { text = "Thank you, Elder. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "An elder of the kaldorei, a weaver of songs for the Sisters of Elune." } },
    _none = { { id = "tp_none", text = "That I do not know, child. Ask the Sentinels." } },
  },
}
