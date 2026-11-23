-- Dustwallow Marsh, folk no earlier pass reached: Theramore's shopkeepers and trainers (Uma Bartulm, Marie Holdston,
-- Craig Nollward, Helenia Olden, Timothy Worthington, Medic Helaina), a Theramore Lieutenant and Sentry, a Brackenwall
-- Enforcer, and the black drake Emberstrife in the Wyrmbog.
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Uma Bartulm: herbalism and alchemy supplies.
P:NPC {
  key = "dw_uma_bartulm", id = TODO_NPC("Uma Bartulm"), name = "Uma Bartulm", gender = "female",
  role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "brisk" }, values = { "craft" },
  notices = { "craft" },
  impression = {
    first = "Uma Bartulm sells herbs and alchemy supplies on Theramore Isle, and her shop smells of drying leaves and swamp water. She weighs everything twice and talks while she does it.",
    third = "{name} met Uma Bartulm, Theramore's herbalism and alchemy supplier.",
  },
  greetings = {
    { id = "g_default", text = "Come in and shut the door, please, the damp gets into the vials. What are you after?" },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "You've been picking in the marsh, I can smell it on you. If there's liferoot in that bag, I'll have a look at it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep vials, solvents and the odd herb that doesn't grow here. Half the guard buys healing draughts from the alchemists I supply, so I like to think I've saved a few of them." } },
      again = { { id = "h_again", text = "Anything else? I've a batch of leaves to turn." } },
      choices = {
        { text = "What grows well in the marsh?", next = "marsh" },
        { text = "The damp must ruin your stock.", next = "damp" },
        { text = "Good day, Uma.", next = "END" },
      },
    },
    marsh = {
      lines = { { id = "m_default", text = "Liferoot and kingsblood along the drier ground, and fadeleaf if you don't mind the shade. Don't pick anything near the Wyrmbog, though, because the dragons' mess gets into the roots." } },
      choices = {
        { text = "Dragons' mess?", next = "dragons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons = {
      lines = { { id = "d_default", text = "Black dragons nest in the south of the marsh, and everything that grows near them comes up bitter and sooty. I threw out a whole crate once, and the smell stayed in the shop for a week." } },
      choices = { { text = "I'll keep north. Something else.", next = "BACK" } },
    },
    damp = {
      lines = { { id = "da_default", text = "It does, unless you're stubborn about it, and I am. Everything goes in waxed jars, and I keep a brazier going even in summer, which the neighbours complain about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I couldn't say, dear. Ask me about roots and I'll talk all day." } } },
}

-- Marie Holdston: blacksmithing trainer and weapon vendor.
P:NPC {
  key = "dw_marie_holdston", id = TODO_NPC("Marie Holdston"), name = "Marie Holdston", gender = "female",
  role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "gruff" }, values = { "craft", "duty" },
  notices = { "craft", "kit" },
  impression = {
    first = "Marie Holdston trains blacksmiths and sells weapons on Theramore Isle. She has forearms like a dockhand and a voice that carries over the anvil without effort.",
    third = "{name} met Marie Holdston, Theramore's blacksmithing trainer.",
  },
  greetings = {
    { id = "g_default", text = "Mind the sparks. If you want a blade, they're on the rack, and if you want to learn to make one, roll up your sleeves." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've a smith's burns on your hands. Let's see what you know, and then I'll show you what you don't." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That gear's half rust. The marsh does that, and so does neglect, and I'd guess both." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I came over with Lady Proudmoore's fleet and I've kept the garrison armed ever since. The damp here eats steel faster than any orc, so most of my day is fighting rust." } },
      again = { { id = "h_again", text = "Something else? The iron's cooling." } },
      choices = {
        { text = "How do you fight rust?", next = "rust" },
        { text = "You sailed with the fleet from Lordaeron?", next = "fleet" },
        { text = "Thanks, Marie.", next = "END" },
      },
    },
    rust = {
      lines = { { id = "r_default", text = "Oil every night, and a good scabbard, and never put a blade away wet. Most soldiers manage one of the three, and I see the rest of them at my rack." } },
      choices = { { text = "I'll oil mine. Something else.", next = "BACK" } },
    },
    fleet = {
      lines = { { id = "f_default", text = "I did, with my hammer wrapped in sailcloth and not much else. We left a dying kingdom behind us, and I'd sooner talk about steel than about that." } },
      choices = {
        { text = "Then we'll talk about steel.", next = "BACK", fx = { affinity = 1 } },
        { text = "Do you miss it?", next = "miss" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "I miss the forge my father built, and I miss the man himself. The rest is ash now, and Theramore is home, rain and all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Not my trade. Ask at the inn, they've nothing better to do." } } },
}

-- Craig Nollward: cook at the Theramore inn.
P:NPC {
  key = "dw_craig_nollward", id = TODO_NPC("Craig Nollward"), name = "Craig Nollward", gender = "male",
  role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "cheerful" }, values = { "craft" },
  notices = { "craft" },
  impression = {
    first = "Craig Nollward cooks and sells food at the Theramore inn, and he has strong opinions about seasoning that he will share with anyone who stands still.",
    third = "{name} met Craig Nollward, the cook at the Theramore inn.",
  },
  greetings = {
    { id = "g_default", text = "Hungry? You look hungry. Sit down, I've a pot of something that's nearly fish." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Thank the Light. Tell me, do you salt before or after, because there's a man down the dock who's wrong about it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I feed the off-watch, the dock hands and anyone who wanders in out of the rain. I also teach a bit of cooking, if you've patience and a strong stomach." } },
      again = { { id = "h_again", text = "Anything else? The pot won't stir itself." } },
      choices = {
        { text = "Who's wrong about salt?", next = "stern" },
        { text = "What do you cook in a swamp?", next = "swamp" },
        { text = "Later, Craig.", next = "END" },
      },
    },
    stern = {
      lines = { { id = "s_default", text = "Morgan Stern, who cooks for the guard. He salts after and he swears by bogbean leaves, and we've had the same argument every night for a year." } },
      choices = {
        { text = "Bogbean leaves?", next = "bogbean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bogbean = {
      lines = { { id = "b_default", text = "Bitter green things from the north marsh. He sends poor Ignatz out to pick them, raptors and all, and I still say the dish would be better without them." } },
      choices = { { text = "I'll take no side. Something else.", next = "BACK" } },
    },
    swamp = {
      lines = { { id = "sw_default", text = "Fish, crab, turtle if the hunters bring one back, and raptor when I'm desperate. Raptor's stringy, but it's honest food, which is more than I can say for anything with tentacles." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask me about a stew." } } },
}

-- Helenia Olden: trade supplies, first house by the docks.
P:NPC {
  key = "dw_helenia_olden", id = TODO_NPC("Helenia Olden"), name = "Helenia Olden", gender = "female",
  role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "kindly" }, values = { "plain_dealing" },
  notices = { "craft" },
  impression = {
    first = "Helenia Olden sells trade supplies from the first house past Theramore's docks. She is the first shopkeeper most newcomers meet, and she seems to have made a habit of giving directions.",
    third = "{name} met Helenia Olden, who sells trade supplies near Theramore's docks.",
  },
  greetings = {
    { id = "g_default", text = "Just off the boat? Everyone is, at first. I've thread, dye and flux, and directions are free." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "My shop's the first one off the dock, so I see every face that comes to Theramore. Most are lost, a few are trouble, and some just need a spool of thread." } },
      again = { { id = "h_again", text = "What else can I help you find?" } },
      choices = {
        { text = "Where should a newcomer go first?", next = "where" },
        { text = "What kind of trouble comes off the boat?", next = "trouble" },
        { text = "Thank you, Helenia.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "The inn for a bed, the keep if you're looking for work, and Lady Proudmoore's tower only if you've been sent for. The guards will point you right if I haven't." } },
      choices = {
        { text = "What sort of work at the keep?", next = "work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "wk_default", text = "Deserters in the marsh, raptors, the black dragons to the south, and something about Stonemaul ogres. There's always more trouble than soldiers here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trouble = {
      lines = { { id = "t_default", text = "Men who left something bad behind in Lordaeron and think the sea will hide it. It doesn't, and the guard usually works it out before I do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I sell thread, love, not secrets. Try the inn." } } },
}

-- Timothy Worthington: tailoring trainer.
P:NPC {
  key = "dw_timothy_worthington", id = TODO_NPC("Timothy Worthington"), name = "Timothy Worthington", gender = "male",
  role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "fussy" }, values = { "craft" },
  notices = { "craft" },
  impression = {
    first = "Timothy Worthington trains tailors in Theramore and keeps his own clothes spotless, which in Dustwallow Marsh is a small miracle he is quietly proud of.",
    third = "{name} met Timothy Worthington, Theramore's tailoring trainer.",
  },
  greetings = {
    { id = "g_default", text = "Please wipe your boots. I've mud enough from the soldiers, and I've only just finished brushing the bench." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A fellow tailor, and your seams are straight, which I can't say for half the garrison. Come and see what I can teach you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I teach tailoring to anyone with steady hands and keep the officers' uniforms presentable. Mageweave is the cloth of the hour, if you can find it." } },
      again = { { id = "h_again", text = "Yes? Do mind the cloth on the bench." } },
      choices = {
        { text = "Where does mageweave come from?", next = "mageweave" },
        { text = "Clean clothes in a swamp seems hopeless.", next = "clean" },
        { text = "Good day, Timothy.", next = "END" },
      },
    },
    mageweave = {
      lines = { { id = "mw_default", text = "Off the backs of those who can afford it, mostly, so the ogres and the cultists and the like. I won't ask how you come by it, and you needn't tell me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    clean = {
      lines = { { id = "c_default", text = "It is hopeless, which is exactly why it matters. If the officers look like soldiers, the soldiers remember they are, and Lady Proudmoore notices these things." } },
      choices = {
        { text = "Appearances keep discipline. You're right.", next = "BACK", reply = "Thank you. Someone finally understands.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A soldier fights just as well muddy.", next = "BACK", reply = "Perhaps, but he salutes worse.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I'm sure I couldn't say. I keep to my needles." } } },
}

-- Medic Helaina: a young first aid medic.
P:NPC {
  key = "dw_medic_helaina", id = TODO_NPC("Medic Helaina"), name = "Medic Helaina", gender = "female",
  role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "earnest" }, values = { "healing" },
  notices = { "craft", "kit" },
  impression = {
    first = "Medic Helaina is young for a medic and works harder than anyone to make up for it. She learned her trade from the healers of the Alliance and treats the guard's cuts and fevers on Theramore Isle.",
    third = "{name} met Medic Helaina, a first aid medic on Theramore Isle.",
  },
  greetings = {
    { id = "g_default", text = "Are you hurt? Sit down and let me look, even if you think it's nothing." },
    { id = "g_low", when = { health = { max = 0.5 } }, text = "You're bleeding on my floor. Sit, please, before you fall over." },
  },
  notice = {
    { id = "n_aid", cat = "craft", when = { profession = "First Aid" },
      text = "You carry bandages. Good. Let me see how you wrap them, because most people do it too loosely." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep the garrison patched up and teach first aid to anyone who'll learn. In this marsh it's fever as often as swords, and fever doesn't care how brave you are." } },
      again = { { id = "h_again", text = "Anything else? I've a soldier with marsh rot waiting." } },
      choices = {
        { text = "What's the worst you see here?", next = "worst" },
        { text = "Who taught you?", next = "teacher" },
        { text = "Thanks, Helaina.", next = "END" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "Raptor bites that go bad in the damp. If you're bitten out there, clean it with boiled water the same day, not the next, or you'll be back here losing the arm." } },
      choices = {
        { text = "Boiled water. I'll remember.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher = {
      lines = { { id = "t_default", text = "The field healers, mostly, in the camps after the war. They had more wounded than hands, so they taught anyone who didn't faint." } },
      choices = {
        { text = "You didn't faint?", next = "faint" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faint = {
      lines = { { id = "f_default", text = "Once, the first day, but I came back the second. They said that was the part that counted." } },
      choices = { { text = "It is. Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know about that, I'm afraid. Ask me about a wound instead." } } },
}

-- Theramore Lieutenant.
P:NPC {
  key = "dw_theramore_lieutenant", id = TODO_NPC("Theramore Lieutenant"), name = "Theramore Lieutenant", gender = "male",
  role = "soldier", tier = "service",
  communities = { "theramore" }, temper = { "stern" }, values = { "duty" },
  notices = { "class" },
  impression = {
    first = "The Theramore Lieutenants keep the watch on the isle and answer to Captain Garran Vimes. This one looked at me as if I were a report he had not yet decided to file.",
    third = "{name} spoke with a Theramore Lieutenant on the isle.",
  },
  greetings = {
    { id = "g_default", text = "State your business on the isle, please. If it's honest, you'll find us glad of the help." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep the watch rotation and pass reports up to Captain Vimes. Between the deserters, the Horde scouts and the dragons, there's never a short report." } },
      again = { { id = "h_again", text = "Anything else? Keep it brief, please." } },
      choices = {
        { text = "What's in the reports lately?", next = "reports" },
        { text = "Where do I find Captain Vimes?", next = "vimes" },
        { text = "Carry on, lieutenant.", next = "END" },
      },
    },
    reports = {
      lines = {
        { id = "r_default", text = "Orcs seen near the Shady Rest, and some of the men are calling for blood. The Lady wants it looked into before anyone draws steel, and so do I." },
        { id = "r_orc", when = { questDone = TODO_QUEST("The Orc Report") }, text = "Your report on the orcs reached the captain. He read it twice, which is more than he does for mine." },
      },
      choices = {
        { text = "Peace with the Horde is worth keeping.", next = "BACK", reply = "Lady Proudmoore thinks so, and I follow her.", fx = { align = { order = 1 } } },
        { text = "The Horde will break the peace anyway.", next = "BACK", reply = "Maybe, but not because we broke it first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vimes = {
      lines = { { id = "v_default", text = "In the keep, behind a desk he hates. He'd rather be on the walls, and so would I, but someone has to read the reports." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That's not in my orders. Ask at the keep." } } },
}

-- Theramore Sentry.
P:NPC {
  key = "dw_theramore_sentry", id = TODO_NPC("Theramore Sentry"), name = "Theramore Sentry", gender = "male",
  role = "guard", tier = "service",
  communities = { "theramore" }, temper = { "weary" }, values = { "duty" },
  notices = {},
  impression = {
    first = "The Theramore Sentries stand on the walls and towers around the isle, watching the marsh for anything that moves. This one was wet through and did not seem to expect otherwise.",
    third = "{name} spoke with a Theramore Sentry.",
  },
  greetings = {
    { id = "g_default", text = "Halt, and good day. You're not a raptor, so you're welcome enough." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Quiet, please. You hear more of the marsh at night when nobody's talking." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I stand watch and I count what comes out of the marsh. Raptors, deserters, now and then a black dragon high up, and fog, always fog." } },
      again = { { id = "h_again", text = "Anything else? I'm meant to be watching, not chatting." } },
      choices = {
        { text = "Dragons fly this far north?", next = "dragons" },
        { text = "Deserters?", next = "deserters" },
        { text = "Stay dry.", next = "END" },
      },
    },
    dragons = {
      lines = { { id = "d_default", text = "Not often, but I've seen them, black as a coal against the clouds. They come from the Wyrmbog to the south, and they never land, thank the Light." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    deserters = {
      lines = { { id = "de_default", text = "Men who ran off into the marsh, and some have turned bandit since. I knew a few of them once, which makes the watch longer." } },
      choices = {
        { text = "They chose their road.", next = "BACK", reply = "They did, and it's a hard one.", fx = { align = { order = 1 } } },
        { text = "Maybe they had reasons.", next = "BACK", reply = "Maybe. I'd still have to stop them.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Couldn't say. Ask the lieutenant." } } },
}

-- Brackenwall Enforcer: Stonemaul ogre guard.
P:NPC {
  key = "dw_brackenwall_enforcer", id = TODO_NPC("Brackenwall Enforcer"), name = "Brackenwall Enforcer", gender = "male",
  role = "guard", tier = "service",
  communities = { "brackenwall" }, temper = { "gruff" }, values = { "strength" },
  notices = {},
  impression = {
    first = "The Brackenwall Enforcers are Stonemaul ogres in red war paint who guard the village with maces as long as a man. This one counted on his fingers while he talked, and kept losing his place.",
    third = "{name} spoke with a Brackenwall Enforcer of the Stonemaul.",
  },
  greetings = {
    { id = "g_default", text = "You come in Brackenwall, you be good. Enforcer is watching, and Enforcer has big mace." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Enforcer guards Brackenwall for the Stonemaul and for the Horde. Stonemaul used to live in the south, but the black dragons came and burned everything, so now we live here." } },
      again = { { id = "h_again", text = "You still talking? Enforcer is still listening." } },
      choices = {
        { text = "The dragons drove you out?", next = "dragons" },
        { text = "Why do Stonemaul fight for the Horde?", next = "horde" },
        { text = "Goodbye, big one.", next = "END" },
      },
    },
    dragons = {
      lines = { { id = "d_default", text = "Big black ones, from the bog. They burned the old village and ate many ogres, and Enforcer wants to smash them, but Enforcer cannot reach that high." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    horde = {
      lines = { { id = "h2_default", text = "Rexxar came and helped Stonemaul when the bad ogres fought us. Rexxar is strong and Thrall is strong, so Stonemaul is Horde now, and Enforcer smashes for them." } },
      choices = {
        { text = "Strength earns loyalty. That's fair.", next = "BACK", reply = "Yes! You are smart, for a small one.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Loyalty should come from more than strength.", next = "BACK", reply = "Enforcer does not know what that means, but Enforcer will think about it.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Enforcer does not know. Ask somebody with smaller head." } } },
}

-- Emberstrife: black drake of the Wyrmbog, who tests dragonspawn for Onyxia's guard.
P:NPC {
  key = "dw_emberstrife", id = TODO_NPC("Emberstrife"), name = "Emberstrife", gender = "male",
  role = "questgiver", tier = "quest",
  communities = {}, temper = { "proud", "cruel" }, values = { "power" },
  notices = { "race" },
  impression = {
    first = "Emberstrife is an ancient black drake who lairs in the Wyrmbog, and his den reeks of ash and old bones. He spoke to me the way a cat speaks to a mouse it has not decided to eat.",
    third = "{name} faced Emberstrife, the black drake of the Wyrmbog.",
  },
  greetings = {
    { id = "g_default", text = "Another small thing walks into my den on two legs. Speak quickly, mortal, while I am still curious." },
    { id = "g_disguise", when = { questActive = TODO_QUEST("Emberstrife") }, text = "You smell of dragonspawn, and badly. Do you think you are the first to wear a borrowed shape before me?" },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Your people once held my kin in chains at Grim Batol, and my flight has a very long memory." },
  },
  start = "hello",
  nodes = {
    hello = {
      big = true,
      lines = { { id = "h_default", text = "I am Emberstrife, and I serve Onyxia, daughter of Deathwing. Dragonspawn who would join her guard come to me, and I test them, and most of them do not come back out." } },
      again = { { id = "h_again", text = "You are still here, and still talking. How brave, or how foolish." } },
      choices = {
        { text = "What is the test?", next = "test" },
        { text = "Why does Onyxia need guards?", next = "onyxia" },
        { text = "Deathwing's brood will fall in time.", next = "defy" },
        { text = "I'll leave you to your den.", next = "END" },
      },
    },
    test = {
      lines = { { id = "t_default", text = "Strength, cunning and obedience, mortal, and the skulls of my enemies as proof. Those who return to me with the right skulls may ascend, and the rest feed the bog." } },
      choices = {
        { text = "Whose skulls?", next = "skulls" },
        { text = "I wear the amulet. Test me.", next = "skulls", when = { questActive = TODO_QUEST("Emberstrife") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skulls = {
      lines = { { id = "sk_default", text = "Dragons of the other flights, the blue and the green and the bronze and the red, who think themselves Azeroth's guardians. Let them guard their own heads, if they can." } },
      choices = {
        { text = "That's no test. It's murder.", next = "BACK", reply = "Murder is a word for cattle. Dragons call it rank.", fx = { align = { light = 1 } } },
        { text = "Only the strong deserve to rise.", next = "BACK", reply = "Ah, you understand. How very unusual in a mortal.", fx = { align = { light = -1 } } },
      },
    },
    onyxia = {
      lines = { { id = "o_default", text = "She keeps a lair in the south of this marsh and a mask in your human kingdom, and she needs loyal claws in both. I would say more, but you would only understand half of it." } },
      choices = {
        { text = "A mask in Stormwind?", next = "mask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mask = {
      lines = { { id = "m_default", text = "Did I say Stormwind? You mortals hear what you fear to hear. Go home and look closely at your nobles, and see how long you keep your head after." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    defy = {
      lines = { { id = "df_default", text = "Bold words in a black dragon's den. Your kind built your little kingdoms in the ashes we left, and you will build them again when we have burned them a second time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    black_dragonflight = { { id = "tp_black", text = "We are the eldest flight and the greatest, and the world will remember it." } },
    _none = { { id = "tp_none", text = "I do not answer the questions of insects. Ask something worth my breath." } },
  },
}

-- Falgran Hastil: a Theramore tracker sent to follow the hoofprints after "Suspicious Hoofprints".
P:NPC {
  key = "dw_falgran_hastil", id = 5088, name = "Falgran Hastil", gender = "male",
  role = "soldier", tier = "service",
  communities = { "theramore" }, temper = { "dutiful", "terse" }, values = { "duty", "order" },
  notices = { "class", "travel" },
  impression = {
    first = "A lean tracker with mud to his knees and a map he keeps folding.",
    third = "{name} met Falgran Hastil, a tracker of the Theramore Guard.",
  },
  greetings = {
    { id = "g_default", text = "Falgran Hastil, Theramore Guard. If you've come about the hoofprints, I'm the one they're sending after them." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? I've not found where those tracks end yet, but I will." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, text = "A hunter, good. You'll know a fresh print from an old one, which is more than half the Guard can say." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Somebody left hoofprints by the burnt-out inn on the Barrens road, and the Lady Jaina wants to know whose they were. I'm to follow them wherever they go and report back to the citadel." } },
      again = { { id = "h_again", text = "Make it quick, friend. Tracks don't wait for anyone, least of all in a swamp." } },
      choices = {
        { text = "Whose hoofprints do you think they are?", next = "whose" },
        { text = "How do you track anything in this mud?", next = "mud" },
        { text = "Good hunting, Falgran.", next = "END" },
      },
    },
    whose = {
      lines = { { id = "w_default", text = "Tauren, by the size of them, which is what has the Guard worried. Some say it's the Horde stirring up trouble, and others say someone wants it to look that way, so we can't afford to guess wrong." } },
      choices = {
        { text = "It's the Horde. Treat it as an attack.", next = "BACK", reply = "Plenty in the barracks would agree, but Lady Proudmoore wants proof before she wants war. I'll bring her proof.", fx = { align = { order = -1 } } },
        { text = "Find the truth before anyone draws a sword.", next = "BACK", reply = "That's exactly my orders, and I mean to keep them. A wrong guess here costs lives on both sides.", fx = { align = { order = 1 } } },
      },
    },
    mud = {
      lines = { { id = "m_default", text = "Patience, mostly, and a good eye for broken reeds. The marsh swallows a print within a day, so you follow what the creature brushed past rather than what it stepped on." } },
      choices = {
        { text = "Have you seen anything strange out there?", next = "strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "Plenty, and none of it friendly. Black dragonspawn in the Wyrmbog, the Grimtotem moving through the reeds, and things in the water I'd rather not describe before supper." } },
      choices = { { text = "Then watch your back. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not my concern, friend. Ask someone at the citadel who sits behind a desk." } },
  },
}

-- Medic Tamberlyn: a neophyte First Aid medic on Theramore Isle, still learning the trade.
P:NPC {
  key = "dw_medic_tamberlyn", id = 5199, name = "Medic Tamberlyn", gender = "female",
  role = "citizen", tier = "service",
  communities = { "theramore" }, temper = { "earnest", "nervous" }, values = { "compassion", "duty" },
  notices = { "kit" },
  impression = {
    first = "A young medic with bandage rolls tucked into every pocket.",
    third = "{name} met Medic Tamberlyn, a young First Aid medic on Theramore Isle.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello! You're not bleeding, are you? I mean, I could help if you were, I've been practising all week." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and still in one piece, which is the best kind of patient there is." },
  },
  notice = {
    { id = "n_hurt", cat = "kit", when = { health = { max = 0.5 } }, text = "Light above, you're hurt! Sit down, keep the pressure on it, and please don't faint until I've found my scissors." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Tamberlyn, and I'm learning field medicine here at Theramore, though I'm still a neophyte, so mostly I roll bandages and fetch water. My teacher says every medic starts that way, and I hope he's right." } },
      again = { { id = "h_again", text = "Anything else? I've a basket of linen to cut, but I can talk while I do it." } },
      choices = {
        { text = "Why become a medic?", next = "why" },
        { text = "What's the hardest part of the work?", next = "hard" },
        { text = "Keep up the good work.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "My brother came home from the Barrens road with a wound nobody knew how to dress, and he very nearly didn't recover. I decided then that I'd never stand by and watch somebody bleed again because I didn't know what to do." } },
      choices = {
        { text = "Do you tend Horde wounded too?", next = "horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "ho_default", text = "Lady Jaina wants peace with Thrall's people, and I think a medic ought to treat whoever's in front of her. Some of the soldiers say I'm soft for thinking it, but blood looks the same on everyone." } },
      choices = {
        { text = "A wound is a wound. You're right.", next = "BACK", reply = "Thank you! I'll tell the sergeant someone agreed with me, though he won't care.", fx = { align = { light = 1 } } },
        { text = "Our own soldiers come first, always.", next = "BACK", reply = "Well, yes, of course they would, if it came to choosing. I just hope it never does.", fx = { align = { light = -1 } } },
      },
    },
    hard = {
      lines = { { id = "h2_default", text = "Keeping my hands steady when someone is screaming, honestly. The bandaging I can do in my sleep now, but the noise and the blood still make my stomach turn over." } },
      choices = { { text = "That gets easier with time. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask my teacher at the infirmary; he knows everything, or at least he sounds like he does." } },
  },
}
