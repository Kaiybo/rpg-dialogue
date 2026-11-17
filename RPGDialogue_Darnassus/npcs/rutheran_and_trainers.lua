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
    { id = "g_default", text = "Ishnu-alah, traveler. The hippogryphs are ready, and the wind off the sea is kind today, so the gulls should leave your hat alone." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the roots of Teldrassil. Where will the wind take you this time?" },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They ride it like a river. Your wind spirits might speak with them better than I can." } },
      choices = {
        { text = "Then let them fly freely and safely, Vesprystus.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The wind is wild. Let them struggle.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Too often, from Auberdine and beyond, and the hippogryphs know it, because they fly gently when they carry someone hurt. If you're ever going that way, ride with the wounded, and you'll ease two hearts at once." } },
      choices = {
        { text = "I'll ride with them whenever I can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll fly where my own work takes me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "To Auberdine across the water, and from there the roads and flights go south toward Ashenvale. Sit still and trust the beast, which I suspect is harder for your kind than for mine." } },
      choices = {
        { text = "I'll sit still and trust it, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I trust my own feet more than any beast.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "xhuntcl_default", text = "Badly, because a hippogryph is half eagle and the eagle half thinks your companion is supper, or the other way round. Keep your beast at heel near the roost, and nobody loses a feather." },
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
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They settle the moment one of the Circle climbs on, because hippogryphs have flown beside the druids since the days of Cenarius and they remember who keeps his ways. The Sentinels ride them to war now, though I don't think they were ever meant for it." } },
      choices = {
        { text = "They serve the Sentinels well, and that's an honourable use.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They should fly free, not carry anyone to war.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Many of them flew over Hyjal when the Legion burned it, and the rest learned their fear from those that did. Dismiss your servant on the dock, and they'll fly you as gently as anyone." },
      },
      choices = {
        { text = "I'll dismiss it on the dock.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "They'll carry it if I command it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. My hippogryphs carry the wounded home more often than I'd like, and they're always calmer when a healer rides with them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. My hippogryphs have never carried so much armor, {class}, but they're stronger than they look, and they won't let you fall." },
        { id = "h_default", text = "I am Vesprystus, keeper of the hippogryphs. They carry our people from the roots of Teldrassil to Auberdine across the water, and from there to the rest of a world that has grown very large since the Sundering." },
        { id = "h_cond", when = { race = "Human" }, text = "A human, here at the roots of our tree! Our hippogryphs are gentler than your gryphons, I think, though I would not say so in Ironforge." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "My hippogryphs are fond of you, rogue, which is odd, since they're usually wary of anyone who walks that quietly." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage taking the long way! I'd heard your kind can step from one place to another with a word, so it's a compliment that you'd choose my birds." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, flying on to Auberdine? Hold on tight and don't lean, because armor makes the birds nervous." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! My birds can smell your companion from here, so let me settle them before you come any closer." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You could swim to Auberdine in seal shape if you liked, but my hippogryphs are faster and a good deal drier." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock at Rut'theran. My hippogryphs will carry you across to Auberdine, but not your servant, because they've a long memory of the Legion's fires." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The sea wind has been an old friend of mine for longer than your mountains have been mined, so tell me, does your wind spirit know it too?" },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The wind can wait, and so can I." },
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
        { text = "Do the wounded often fly home on your hippogryphs?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Can your hippogryphs carry a paladin toward the front?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your hippogryphs know a druid when they carry one?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why do your hippogryphs remember the Legion?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the hippogryphs feel the sea wind, Vesprystus?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
    nordrassil = { { id = "tp_nordrassil", text = "My birds came down from Hyjal with us, and they still turn their heads north sometimes. I think they remember the first tree, the way we do." } },
    everlook = { { id = "tp_everlook", text = "Everlook is a goblin town up in Winterspring, and my birds hate the cold of it. Druids fly there anyway, being druids." } },
    theramore = { { id = "tp_theramore", text = "Theramore is a long way south by hippogryph, over the Barrens and its Horde. I don't send my birds there lightly." } },
    _none = { { id = "tp_none", text = "That is beyond my knowledge. Ask in the city above, where the priestesses keep longer memories than mine." } },
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
    { id = "g_back", when = { metBefore = true }, text = "You return. I trust you have been practicing, for the Sentinels practiced for a thousand years before they called themselves ready." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Anyone can, with discipline. Your spirits may guide you, but your feet must obey me." } },
      choices = {
        { text = "I will learn proper discipline, Ilyenia.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My spirits guide my feet well enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A priest who can't defend themselves is a priest who needs a Sentinel beside them, and I'd rather the Sentinel were fighting. Learn the staff well enough to keep an enemy at arm's length, and your prayers will have time to work." } },
      choices = {
        { text = "My faith is my first defense, but I'll learn the staff.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd trade a long prayer for a good staff any day.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Exactly as I teach the Sentinels, with patience first and the weapon after, because I've seen too many strong arms wasted by an impatient mind. Your oaths will mean little if your swing leaves you open." } },
      choices = {
        { text = "Then I'll begin again, as you say.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My training served me well enough before this.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because a bear that is struck down wakes up as an elf with nothing in hand, and I've seen that happen in Ashenvale more than once. Learn the staff, and you'll be glad of it on the day your shapes fail you." } },
      choices = {
        { text = "Then I'll learn the staff properly, as you say.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My claws have never failed me, and I trust them more.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because patience and a sound grip will save you on the day your servant falls and your spells run dry, and that day comes for everyone. I teach daggers, staves and blades, and I teach them to anyone who'll stand still and listen." },
      },
      choices = {
        { text = "Teach me, then. I'll stand and listen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My servant holds the line, and I don't ask more of it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want a staff or a mace, I suppose, and I can teach you both, but I'll teach you patience first, as I teach everyone." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll favor the mace and the two-handed sword, I expect, and I don't care what your order taught you before you came." },
        { id = "h_default", text = "I am Ilyenia Moonfire, weapon master of Darnassus. I teach daggers, staves, bows and blades, but first I teach patience." },
        { id = "h_cond", when = { class = "WARRIOR" }, text = "A warrior. You will have the strength, but the Sentinels would tell you strength without balance is only a slower way to fall." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Daggers, I'd wager, and I can see you favour the right hand. Come, let me show you why the left matters just as much." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A staff, of course, and you'll want to know how to swing it when the spells run dry. Every mage thinks they'll never need to, and every mage is wrong." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, I'll have someone to teach who won't flinch when the staff comes round." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I teach bows here, though the hunters always tell me they know better." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You'll want a staff or a mace, and I'll teach you either, though you'll fight half your battles with claws and never thank me for it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I can teach you the staff and the dagger, though most of your kind would rather let something else hold the line." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Your footwork is sloppy, spirits or no, so stand properly, as a Sentinel would." },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask with your weight on both feet." },
        { id = "h_again2", text = "Ask, but stand straight while you do." },
      },
      choices = {
        { text = "Teach me a weapon.", next = "BUSINESS" },
        { text = "What do the Sentinels favor?", next = "a" },
        { text = "You can't be the only trainer here.", next = "b" },
        { text = "Do the Sentinels train with daggers as rogues do?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Will I really need a staff in a fight?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which weapon should a warrior master first, Ilyenia?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can you teach a hunter anything new about the bow?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Must a priest learn weapons as well, Ilyenia?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Will you teach a paladin as you teach the Sentinels?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why should a druid learn weapons when the claws do the work?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why should a warlock learn a weapon at all?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Can a shaman learn proper footwork, Ilyenia?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "The glaive and the bow, for they keep the enemy at a distance and the forest quiet. Our sisters have fought with them since long before your kingdoms rose." } },
      choices = {
        { text = "Fighting from a distance seems a coward's way.", next = "a2" },
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
    centaur = { { id = "tp_centaur", text = "I fought centaur once in the Barrens, when our patrols ran farther south. They're stronger than you'd think, and smarter than they let you see." } },
    warsong = { { id = "tp_warsong", text = "I've fought the Warsong in Ashenvale, and I'll fight them again if they ask. Strong arms, poor patience, which is what I teach my students to use against them." } },
    blackfathom = { { id = "tp_blackfathom", text = "The deeps swallowed a temple and more than one patrol. Fight with your back to stone and your feet out of the water." } },
    _none = { { id = "tp_none", text = "That is not something a blade can answer, and I have asked my blades a great many things." } },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They trust those who listen. You listen, it seems. I am more at ease with beasts than with people, and you may be the same." } },
      choices = {
        { text = "Then I will treat them gently, Jeen'ra.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Beasts are beasts. Trust is unnecessary.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Rarely, because they're proud and think a wound from the wild is a lesson. I tell them a lesson is no good to the dead, and perhaps they'll believe it from you." } },
      choices = {
        { text = "I'll heal any hunter who comes to me, proud or not.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they're too proud to ask, I won't chase them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They'll trust what you do, not what you wear, as all beasts do. Kill only what you must and leave the rest in peace, and they'll let you pass soon enough." } },
      choices = {
        { text = "I'll kill only what I must, and leave the rest.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll go as I please, and the beasts can mind themselves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because you smell a little of them, I think, and you've walked in their shapes, so they know you won't put a collar on them. My hunters earn that trust slowly, and you arrived with half of it already." } },
      choices = {
        { text = "A beast should only follow someone it has chosen freely.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some beasts need a firm hand before they'll trust anyone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Most beasts do, I think, because magic makes the air feel wrong to them, the way a storm does. She'll settle if you stand still and let her come to you, which is good advice for most of the wild, if you'll take it from me." },
      },
      choices = {
        { text = "I'll stand still and let her come.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Beasts will learn to bear it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. My hunters come back bitten and clawed, and they rarely think to ask a healer, so I'm glad to see one of you here." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You walk loudly for these woods, {class}, but the beasts of Teldrassil will forgive you that if you come in peace." },
        { id = "h_default", text = "I am Jeen'ra Nightrunner, and I teach the hunters of Darnassus to track, to shoot and to bond with the wild beasts of Teldrassil, as our hunters did in the forests of the old world." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "Ah, one of mine. Your beast trusts you; I can see it in how it stands. I can teach you skills, but I can't teach that." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You'd make a fine tracker, rogue, if only you'd learn to follow something other than a purse." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "My cat has her ears flat and her tail low, warlock, and I've learned to trust her over my own eyes." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior among the hunters. The beasts in the pens are watching you, so try not to rattle that armor." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Come and sit, and tell me what walks beside you; the people can wait." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The cats in the pens have stopped pacing, and they only do that for one of the Circle, so come in and let them look at you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. My cat doesn't like the smell of the arcane, so forgive her if she growls at you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The beasts here are calm around you, and that is rare in a stranger, so I think the forest has already decided about you." },
      },
      again = {
        { id = "h_again", text = "What else? Speak as you would on the hunt, softly and to the point." },
        { id = "h_again2", text = "Speak, but softly, for a nightsaber hears a careless word a long way off." },
      },
      choices = {
        { text = "I want training.", next = "BUSINESS" },
        { text = "How do you bond with a beast?", next = "a" },
        { text = "A young hunter needs somewhere to start.", next = "b" },
        { text = "What would a hunter teach a rogue about tracking?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there anything a warrior can learn from hunters?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should a hunter of Darnassus learn first, Jeen'ra?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is your cat afraid of me or of my servant?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your hunters ever ask a priest for help?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Will the beasts of Teldrassil trust a paladin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why do the beasts settle for a druid, Jeen'ra?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why does your cat dislike the arcane?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the beasts trust shamans, Jeen'ra?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
    centaur = { { id = "tp_centaur", text = "Centaur ride the southern plains in war bands, and they hunt the way we do, without mercy. I respect them, and I'd shoot one without hesitation." } },
    green_dragons = { { id = "tp_green_dragons", text = "In the old forest I saw a green dragon once, sleeping under a great tree. The beasts all went quiet around it, and so did I." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw used to trade furs with us before the corruption came. Those who are left are as proud as ever, and twice as wary." } },
    _none = { { id = "tp_none", text = "I do not know. Ask the wind; it knows more than I." } },
  },
}
