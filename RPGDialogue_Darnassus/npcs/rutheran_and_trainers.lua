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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They carry anyone who's walked the road and knows the roost, and plenty of them are warriors bound for Astranaar. I always know the ones heading for the Warsong lines, because they sit very still and look south the whole way." } },
      choices = {
        { text = "I'll go where I'm needed, however far.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I go where the pay is, not the front.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Badly, if I'm honest, because a hippogryph is half eagle and the eagle half thinks your companion is supper, or the other way round. Keep your beast at heel near the roost, and nobody loses a feather." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is staring at my birds the way it would stare at a rabbit, and they've noticed. Keep it by your side, friend, and we'll all stay friends." },
      },
      choices = {
        { text = "I'll keep it at heel. Your birds come first here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My companion goes where I go, birds or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Perhaps because you don't startle them, and a hippogryph that isn't startled flies straight. Mind that you're honest with them, though, because they remember a rider who mistreated them for years." },
      },
      choices = {
        { text = "I'll treat them well. They've earned it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A mount is a mount. I'll ride what I'm given.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Never, and I'm glad of it, because the hippogryphs are older than any spell for going places. The druids say a road you didn't travel is one you don't understand, and I've come to think they're right about that much." },
      },
      choices = {
        { text = "Then I'll fly with you and learn the road.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A shorter road is still a road, flight master.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Vesprystus. My hippogryphs carry our people from the foot of Teldrassil to Auberdine across the water, and from there to the rest of the world." },
        { id = "h_cond", when = { race = "Human" }, text = "A human, here at the roots of our tree! Our hippogryphs are gentler than your gryphons, I think, though I would not say so in Ironforge." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "My hippogryphs are fond of you, rogue, which is odd, since they're usually wary of anyone who walks that quietly." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage taking the long way! I'd heard your kind can step from one place to another with a word, so it's a compliment that you'd choose my birds." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, flying on to Auberdine? Hold on tight and don't lean, because armor makes the birds nervous." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! My birds can smell your companion from here, so let me settle them before you come any closer." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak. The birds can wait a moment." },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Why live at the roots, not in the city?", next = "a" },
        { text = "Are the hippogryphs hard to train?", next = "b" },
        { text = "Why would a hippogryph trust someone who walks quietly?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the kaldorei ever travel by magic instead?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do your hippogryphs carry warriors toward the Ashenvale front?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your hippogryphs get on with hunters' companions?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Whichever one you'll still respect after a hundred hours of drills, because that's what mastery costs. Most warriors want a great sword the moment they arrive, but I'd sooner see you learn the staff first, since it teaches your feet before it flatters your arms." } },
      choices = {
        { text = "I'll start with the staff and earn the sword.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I came for a sword, not a lesson in patience.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I can teach you to draw it the same way a thousand times, which is what the Sentinels need when the Warsong come through the trees. A hunter's instinct is a fine thing, but instinct tires and a trained arm doesn't." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I can't teach your {pet} anything, so it may sit and watch. It'll learn more from your footwork than you will, I suspect." },
      },
      choices = {
        { text = "Discipline, then. I'll draw it your way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My instincts have kept me alive this long.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "We do, but a Sentinel's dagger is a last answer, and a rogue's is often the first. I'll teach you either way, but I'd rather you learned patience with the blade before speed, because speed without patience gets people killed." },
      },
      choices = {
        { text = "Patience first, then. Teach me properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Speed's kept me alive so far. I'll take it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "One day you'll be out of mana in Ashenvale with a Warsong grunt in front of you, and then you'll be very glad you listened to an old weapon master. I teach patience above all, and a mage needs it more than most." },
      },
      choices = {
        { text = "Then show me. I'd rather be ready.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My spells won't run dry if I'm careful.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Ilyenia Moonfire, weapon master of Darnassus. I teach daggers, staves, bows and blades, but first I teach patience." },
        { id = "h_cond", when = { class = "WARRIOR" }, text = "A warrior. You will have the strength, but the Sentinels would tell you strength without balance is only a slower way to fall." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Daggers, I'd wager, and I can see you favour the right hand. Come, let me show you why the left matters just as much." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A staff, of course, and you'll want to know how to swing it when the spells run dry. Every mage thinks they'll never need to, and every mage is wrong." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, I'll have someone to teach who won't flinch when the staff comes round." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I teach bows here, though the hunters always tell me they know better." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Ask, but stand straight while you do." },
      },
      choices = {
        { text = "Teach me a weapon.", next = "BUSINESS" },
        { text = "What do the Sentinels favor?", next = "a" },
        { text = "Who else trains here?", next = "b" },
        { text = "Do the Sentinels train with daggers as rogues do?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Will I really need a staff in a fight?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which weapon should a warrior master first, Ilyenia?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can you teach a hunter anything new about the bow?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Patience, mostly, and how to read a beast before it moves, because a nightsaber shows you its charge a breath before it comes. Warriors fight the claw they see, and hunters watch the shoulder that throws it." } },
      choices = {
        { text = "I'll learn to watch the shoulder, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take the claw and answer it with steel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "To listen before you draw, because Teldrassil is full of beasts that are not your enemies, and the nightsabers of the old groves deserve that much from us. The Sentinels ride with hunters for that reason, since we know which shadow is a cat and which is a Gnarlpine." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has chosen you well. Speak to it often, even when you think it doesn't understand, because it understands more of you than you know." },
      },
      choices = {
        { text = "I'll listen first, and draw only when I must.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Anything that stalks me gets an arrow first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "That every track is a story about something hungry or frightened, and you should know which before you follow it. A rogue tracks to take, but a hunter tracks to understand, and I think you'd do your work better if you tried my way once." },
      },
      choices = {
        { text = "I'll try it your way. Understanding helps.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Understanding is slow. Taking is quick.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Of your servant, though she's no fonder of you for bringing it. Beasts know the fel by its stink, as surely as they know fire, and every hunter in Darnassus will read the same thing in their pets the moment you walk past." },
      },
      choices = {
        { text = "Then I'll keep my distance from your cats.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your cat can get used to it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Jeen'ra Nightrunner. I teach the hunters of Darnassus to track, to shoot and to bond with the wild beasts of Teldrassil." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "Ah, one of mine. Your beast trusts you; I can see it in how it stands. That trust is worth more than any skill I could teach." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You'd make a fine tracker, rogue, if only you'd learn to follow something other than a purse." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "My cat has her ears flat and her tail low, warlock, and I've learned to trust her over my own eyes." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior among the hunters. The beasts in the pens are watching you, so try not to rattle that armor." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Come and sit, and tell me what walks beside you; the people can wait." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Speak, but softly." },
      },
      choices = {
        { text = "I want training.", next = "BUSINESS" },
        { text = "How do you bond with a beast?", next = "a" },
        { text = "Where should a young hunter go?", next = "b" },
        { text = "What would a hunter teach a rogue about tracking?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there anything a warrior can learn from hunters?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should a hunter of Darnassus learn first, Jeen'ra?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is your cat afraid of me or of my servant?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
