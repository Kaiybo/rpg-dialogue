-- Rut'theran's hippogryph master and two Darnassian trainers. Voice: bibles/rutheran_and_warriors.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC = P.TODO_NPC

-- Vesprystus: hippogryph master at Rut'theran Village.
P:NPC {
  key = "vesprystus", id = TODO_NPC("Vesprystus"), name = "Vesprystus", title = "Hippogryph Master",
  bible = "bibles/rutheran_and_warriors.md", role = "flightmaster", tier = "service",
  communities = { "darnassus" }, temper = { "calm" }, values = { "nature", "freedom" },
  impression = {
    first = "Vesprystus tends the hippogryphs at Rut'theran Village, at the foot of Teldrassil, and he speaks of the sea wind as though it were an old friend.",
    third = "{name} met Vesprystus, who keeps the hippogryphs of Rut'theran Village.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveler. The hippogryphs are ready, and the wind off the sea is kind today." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the roots of Teldrassil. Where will the wind take you this time?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Vesprystus. My hippogryphs carry our people from the foot of Teldrassil to Auberdine across the water, and from there to the rest of the world." },
        { id = "h_cond", when = { race = "Human" }, text = "A human, here at the roots of our tree! Our hippogryphs are gentler than your gryphons, I think, though I would not say so in Ironforge." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak. The birds can wait a moment." },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Why live at the roots, not in the city?", next = "a" },
        { text = "Are the hippogryphs hard to train?", next = "b" },
        { text = "Thank you, Vesprystus.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Because someone must stand at the gate between Teldrassil and the world. Darnassus looks up toward the stars, and I prefer to look out at the sea." } },
      choices = {
        { text = "Does the outside world worry you?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "It does. Our people hid in the forest for ten thousand years, and now we have joined an alliance of humans and dwarves who build with fire and stone." } },
      choices = {
        { text = "The Alliance is our strength now. We must stand with them.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Our people should keep to our own ways and our own forest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "No, only patient work, and a great deal of fish. They choose their riders more than we choose them, which is why I let them sniff you first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have kept beasts of the air since long before Teldrassil was planted." } },
    _none = { { id = "tp_none", text = "That is beyond my knowledge. Ask in the city above." } },
  },
}

-- Ilyenia Moonfire: weapon master in Darnassus.
P:NPC {
  key = "ilyenia", id = TODO_NPC("Ilyenia Moonfire"), name = "Ilyenia Moonfire", title = "Weapon Master",
  bible = "bibles/rutheran_and_warriors.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "exacting" }, values = { "discipline", "duty" },
  impression = {
    first = "Ilyenia Moonfire teaches weapons in Darnassus with a Sentinel's precision, and she does not hide her opinion of sloppy footwork.",
    third = "{name} met Ilyenia Moonfire, Darnassus' exacting weapon master.",
  },
  greetings = {
    { id = "g_default", text = "You wish to learn a new weapon? Show me your stance first." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I trust you have been practicing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Ilyenia Moonfire, weapon master of Darnassus. I teach daggers, staves, bows and blades, but first I teach patience." },
        { id = "h_cond", when = { class = "WARRIOR" }, text = "A warrior. You will have the strength, but the Sentinels would tell you strength without balance is only a slower way to fall." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Ask, but stand straight while you do." },
      },
      choices = {
        { text = "Teach me a weapon.", next = "BUSINESS" },
        { text = "What do the Sentinels favor?", next = "a" },
        { text = "Who else trains here?", next = "b" },
        { text = "Farewell.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "The glaive and the bow, for they keep the enemy at a distance and the forest quiet. Our sisters have fought with them since long before your kingdoms rose." } },
      choices = {
        { text = "Is distance not a coward's way?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "A Sentinel who lives to fight again has served her people better than one who dies proudly. Pride is a luxury; discipline is a duty." } },
      choices = {
        { text = "A warrior should face the enemy close, with honor.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Winning matters more than how it looks. You're right.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Arias'ta Bladesinger trains our warriors, and I teach any of them a new weapon once she says they are ready. Few are as ready as they think." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I served among the Sentinels before I came to teach. My hands remember more than my mouth will tell." } },
    _none = { { id = "tp_none", text = "That is not something a blade can answer." } },
  },
}

-- Jeen'ra Nightrunner: hunter trainer in Darnassus.
P:NPC {
  key = "jeenra", id = TODO_NPC("Jeen'ra Nightrunner"), name = "Jeen'ra Nightrunner", title = "Hunter Trainer",
  bible = "bibles/rutheran_and_warriors.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "quiet" }, values = { "nature", "freedom" },
  impression = {
    first = "Jeen'ra Nightrunner trains Darnassus' hunters in a quiet voice, and she seems far more at ease with the beasts than with the people who come to her.",
    third = "{name} met Jeen'ra Nightrunner, a quiet hunter trainer of Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Speak softly. The beasts are listening, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Your companion looks well, and so do you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Jeen'ra Nightrunner. I teach the hunters of Darnassus to track, to shoot and to bond with the wild beasts of Teldrassil." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "Ah, one of mine. Your beast trusts you; I can see it in how it stands. That trust is worth more than any skill I could teach." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Speak, but softly." },
      },
      choices = {
        { text = "I want training.", next = "BUSINESS" },
        { text = "How do you bond with a beast?", next = "a" },
        { text = "Where should a young hunter go?", next = "b" },
        { text = "Farewell, Jeen'ra.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Patience, and respect. You do not own a beast, you walk beside it, and when it chooses to walk beside you, the bond is made." } },
      choices = {
        { text = "Do some hunters treat beasts as tools?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "Some do, and the beasts know it. A hunter who uses a beast like a weapon will lose it the first time he needs it most." } },
      choices = {
        { text = "A companion deserves respect and care.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A beast is a beast. It serves the hunter.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Into the forest around Dolanaar, where the nightsabers prowl, and then across the sea to Darkshore. The wild will teach you more than I can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have hunted these woods since before the tree was grown. Before that, I hunted the old forests of Ashenvale." } },
    _none = { { id = "tp_none", text = "I do not know. Ask the wind; it knows more than I." } },
  },
}
