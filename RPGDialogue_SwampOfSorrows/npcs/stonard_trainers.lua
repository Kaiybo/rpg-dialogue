-- Stonard's trainers: Ogromm (hunter), Grokor (pet trainer), Kartosh (warlock), Rogvar (alchemy).
-- Voice: bibles/stonard_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Ogromm, hunter trainer
---------------------------------------------------------------------------
P:NPC {
  key = "ogromm", id = 987, name = "Ogromm", title = "Hunter Trainer",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "blunt", "watchful" }, values = { "practical", "proud" },
  notices = { "class", "pet" },

  impression = {
    first = "Ogromm trains Stonard's hunters and has no patience for anyone who isn't one. He stands at the edge of town watching the treeline, and he talks to you without ever quite looking away from it.",
    third = "{name} met Ogromm, the hunter trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Don't waste my time, unless you've got a bow and something worth learning." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Good, stand there where you can see the trees, and we'll talk." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} is watching the reeds the same way I am, which tells me you've trained it well, or it's smarter than you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Ogromm, and I train hunters. If you're not one, I've nothing to teach you, and you'll forgive me if I go back to watching those trees." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and you've walked through the swamp to get here, so you've already learned more than any yard could teach. What else do you need from me?" },
        { id = "h_tauren", when = { class = "HUNTER", race = "Tauren" },
          text = "A tauren hunter, and you walk quietly for something your size, which I don't understand and never will. Come, let's see what you've learned on the plains." },
        { id = "h_troll", when = { class = "HUNTER", race = "Troll" },
          text = "A troll hunter, and you'll know the jungle tricks already, which serve better here than anything the Barrens taught me. What do you need?" },
      },
      again = {
        { id = "h_again", text = "What else? I'm still watching the trees." },
        { id = "h_again2", text = "Ask, but quietly. The jaguars listen." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What are you watching for?", next = "trees" },
        { text = "What's the hardest thing to hunt here?", next = "prey" },
        { text = "How should a hunter treat the beasts he kills?", next = "kill" },
        { text = "My people hunt the plains. How is this different?", next = "xtauren", when = { class = "HUNTER", race = "Tauren" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },

    trees = {
      lines = { { id = "tr_default", text = "Jaguars, mostly, because they come down out of the branches at dusk, and a grunt at the gate never looks up. I lost a scout to one last season, and I've stood here every evening since." } },
      choices = {
        { text = "Does anyone stand watch with you?", next = "trees_alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trees_alone = {
      lines = { { id = "tra_default", text = "Sometimes Grokor, when his beasts are fed, though he spends more time watching the beasts than the trees. Mostly I'm alone, which suits me well enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    prey = {
      lines = { { id = "pr_default", text = "The crocolisks in the deep water, because you can't see them and they don't make a sound until they've got you. A hunter who learns to read the water in this swamp can read anything." } },
      choices = {
        { text = "How do you read the water?", next = "prey_water" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prey_water = {
      lines = { { id = "prw_default", text = "You watch for the bubbles, the ripples that don't match the wind, and the birds that suddenly go quiet. And you never, ever stand close to the bank to drink, no matter how thirsty you are." } },
      choices = { { text = "I'll remember. Something else.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },

    kill = {
      big = true,
      lines = { { id = "ki_default", text = "With respect, I'd say, but I know orcs who'd say otherwise and I don't argue with them. A beast that dies cleanly fed a hunter, and a beast that dies badly fed nothing but somebody's pride." } },
      choices = {
        { text = "A clean kill honours the beast and the hunter.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Dead is dead. The beast doesn't care how.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xtauren = {
      lines = { { id = "xta_default", text = "On the plains you see the herd from a mile away, and you choose your kill before you've strung your bow. Here you see nothing until it's on you, so you learn to hunt with your ears, and your nose, and the hairs on the back of your neck." } },
      choices = { { text = "Then I've much to learn. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I hunted for a war band in the Barrens, and when Thrall sent orcs east to hold Stonard, I came along to keep them fed. I've been watching these trees ever since." } },
    _none = { { id = "tp_none", text = "Don't waste my time. Ask someone in the hall." } },
  },
}

---------------------------------------------------------------------------
-- Grokor, pet trainer
---------------------------------------------------------------------------
P:NPC {
  key = "grokor", id = TODO_NPC("Grokor"), name = "Grokor", title = "Pet Trainer",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "gentle", "patient" }, values = { "loyal", "kind" },
  notices = { "class", "pet" },

  impression = {
    first = "Grokor trains hunters' beasts at Stonard and is gentler than any orc I've met. He talks to the animals first and their owners second, and I suspect he prefers it that way.",
    third = "{name} met Grokor, the pet trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Hello, hello. Have you brought a beast, or just yourself?" },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Oh, and who's this? Come here, {pet}, let me see you, and never mind your master for a moment." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} has been eating well, I can see, but its coat's damp, so don't let it sleep in the mud tonight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Grokor, and I teach hunters' beasts the things they need to know: how to fight, how to hold a foe, how to stay alive in a swamp that wants to eat them. Their hunters learn a little too, if they listen." },
        { id = "h_hunter", when = { class = "HUNTER", pet = { type = "Beast" } },
          text = "A hunter, and you've brought your {pet}, which is the right way to do it. What do you want to teach it today?" },
        { id = "h_nopet", when = { class = "HUNTER", pet = false },
          text = "A hunter without a beast at your side? Either you've left it in Hekkru's stable, or you've lost it, and I hope it's the first." },
      },
      again = {
        { id = "h_again", text = "What else? I'm happy to talk about beasts all day." },
        { id = "h_again2", text = "Go on. The beasts don't mind waiting." },
      },
      choices = {
        { text = "Teach my beast.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What's the first thing a beast needs to learn?", next = "first" },
        { text = "What beasts do well in the swamp?", next = "swamp" },
        { text = "Should a hunter love his beast?", next = "love" },
        { text = "My beast doesn't always listen to me.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I'll leave you to the beasts.", next = "END" },
      },
    },

    first = {
      lines = { { id = "fi_default", text = "To trust you, which no trainer can teach, because only the hunter can earn it. After that, everything else comes easy, the growl, the bite, the standing ground." } },
      choices = {
        { text = "How do you earn a beast's trust?", next = "first_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_trust = {
      lines = { { id = "fit_default", text = "You feed it from your own hand, and you never strike it, and you're there every time it's hurt. That's all, and it's harder than it sounds, because a hunter's life is rough and beasts remember everything." } },
      choices = { { text = "I'll remember. Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    swamp = {
      lines = { { id = "sw_default", text = "Crocolisks, if you can tame one, because they're at home in the water and nothing here wants to fight them. Raptors do badly, because they hate the damp, and cats do well enough if they keep to the trees." } },
      choices = {
        { text = "Has anyone tamed a crocolisk here?", next = "swamp_croc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swamp_croc = {
      lines = { { id = "swc_default", text = "A young troll hunter did, last spring, and walked it through the gate as proud as a chieftain, and Thultash nearly put it in the stew. We sorted it out, and the crocolisk forgave everyone but Thultash." } },
      choices = { { text = "Smart crocolisk. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    love = {
      big = true,
      lines = { { id = "lo_default", text = "Some hunters say a beast is a tool, and they get by, but their beasts never fight as hard as the ones that are loved. I've seen a wolf stand over its fallen hunter for a whole night, and that wolf was never just a tool." } },
      choices = {
        { text = "A beast is a companion, not a tool. Love it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast is a tool. Feed it and use it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xhunter = {
      lines = { { id = "xh_default", text = "Then it's still deciding whether you're worth listening to, and that's not the beast's fault. Spend a night beside it without asking anything of it, and see if it listens better in the morning." } },
      choices = { { text = "I'll try. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I grew up with the wolves of a war band, sleeping in the kennels when I was small. I've always understood beasts better than orcs." } },
    _none = { { id = "tp_none", text = "I only know beasts, friend. Ask Ogromm, if you can get him to look away from the trees." } },
  },
}

---------------------------------------------------------------------------
-- Kartosh, warlock trainer
---------------------------------------------------------------------------
P:NPC {
  key = "kartosh", id = 988, name = "Kartosh", title = "Warlock Trainer",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "cold", "sharp" }, values = { "ambitious", "proud" },
  notices = { "class" },

  impression = {
    first = "Kartosh trains Stonard's warlocks and speaks to everyone else as though they were furniture. He works beside Greshka, who sells the grimoires, and the two of them have a way of finishing each other's insults.",
    third = "{name} met Kartosh, the warlock trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Your will is not strong enough to manipulate the forces we control, so why are you standing here?" },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A warlock. You know enough to be dangerous, but you still look like you need training to me, {name}." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your demon is restless, which means you've been feeding it too little or commanding it too much. Either one will kill you eventually." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kartosh, and I teach warlocks to command what others fear. If you're not a warlock, there's nothing here for you, and I'll thank you not to stand so close to the circle." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "A warlock, and you've come all the way to Stonard to learn, which tells me you've already outgrown what they teach in the cities. Good. What do you want to know?" },
        { id = "h_forsaken", when = { class = "WARLOCK", race = "Scourge" },
          text = "A Forsaken warlock, and I'll admit your kind take to the art well, since you've already lost what the rest of us are afraid of losing. What do you need?" },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "A shaman, come to look at a warlock and frown. Go ahead and frown, then, but the Horde needs both of us, whatever the spirits say." },
      },
      again = {
        { id = "h_again", text = "Anything else? Be quick about it." },
        { id = "h_again2", text = "Speak, then. My patience is not endless." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Why train warlocks out here, of all places?", next = "why" },
        { text = "What's Greshka to you?", next = "greshka" },
        { text = "Isn't the fel what ruined the orcs?", next = "fel" },
        { text = "The spirits say your art is poison.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "Because the Blasted Lands are a day's walk south, and the Portal stands there still, and the demons that once came through it have not all gone home. A warlock who learns here learns beside the thing itself, and not in some comfortable room in Orgrimmar." } },
      choices = {
        { text = "Do you go into the Blasted Lands yourself?", next = "why_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_go = {
      lines = { { id = "whg_default", text = "When I must, and I come back, which is more than many do. There are elves out there who bleed themselves for power, and I find them more frightening than any demon, because at least a demon knows what it is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    greshka = {
      lines = { { id = "gr_default", text = "A colleague, and the only one in Stonard worth talking to. She sells the grimoires and I teach what's in them, and between us we've decided which of the young warlocks will live long enough to matter." } },
      choices = {
        { text = "That's a cold way to put it.", next = "greshka_cold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    greshka_cold = {
      lines = { { id = "grc_default", text = "It's an honest way, and honesty is cold in our trade. A warlock who's careless dies, and a warlock who's afraid dies slower, and I'd rather tell them so before they find out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fel = {
      big = true,
      lines = { { id = "fe_default", text = "It is, and the shamans never let us forget it, but the Horde didn't fall because of power, it fell because its leaders let the power lead. I command the demon, and the demon does not command me, and that's the whole of the difference." } },
      choices = {
        { text = "Power is only dangerous to the weak. Command it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some power should be left alone, Kartosh.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xshaman = {
      lines = { { id = "xs_default", text = "Then the spirits are right, and they should keep saying it, so that warlocks remember to be careful. But the spirits didn't stop the Burning Legion last time, and I'd like to see them try without us next time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I learned the art in the last days of the old Horde, and I watched what it did to Gul'dan's followers. I learned from their mistakes, and I'm still here." } },
    _none = { { id = "tp_none", text = "That is beneath my interest. Go and ask someone who cares." } },
  },
}

---------------------------------------------------------------------------
-- Rogvar, alchemy trainer
---------------------------------------------------------------------------
P:NPC {
  key = "rogvar", id = TODO_NPC("Rogvar"), name = "Rogvar", title = "Alchemy Trainer",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "excitable", "sharp" }, values = { "curious", "craft" },
  notices = { "craft" },

  impression = {
    first = "Rogvar is the alchemist at Stonard and the most skilled in the Horde's eastern lands, or so he says. His workbench is scorched, his eyebrows are thin, and he talks about the swamp's herbs the way other orcs talk about battles.",
    third = "{name} met Rogvar, the alchemy trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Step carefully, the floor's sticky, and don't touch anything that's bubbling, because I'm not sure what it'll do yet." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist! Come in, come in, and tell me what you've been brewing, because I'm bored of talking to Rartar about vials." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Your fingers are stained green to the knuckle, so you've been working with swamp herbs, and you've been doing it without gloves." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Rogvar, and I teach alchemy, the good kind, the kind that keeps grunts alive and ogres confused. If you've got the skill, I'll teach you the hard recipes, and if you don't, I'll teach you how to get it." },
        { id = "h_alch", when = { profession = "Alchemy" },
          text = "A working alchemist, and you've come all the way to the swamp, which means you've learned everything they teach in the cities. Good, because what I teach here, they don't." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage, come to look down at alchemy as a lesser art, I expect. Go ahead, but remember who you'll come to when you run out of mana in the middle of a fight." },
      },
      again = {
        { id = "h_again", text = "What else? I've got a flask on the fire, so be quick." },
        { id = "h_again2", text = "Ask away, while it's still simmering." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { profession = "Alchemy" } },
        { text = "What grows in the swamp that's worth brewing?", next = "herbs" },
        { text = "What happened to your eyebrows?", next = "brows" },
        { text = "Do you ever brew anything dangerous?", next = "danger" },
        { text = "What can't the cities teach me?", next = "xalch", when = { profession = "Alchemy" } },
        { text = "I'll leave you to your brewing.", next = "END" },
      },
    },

    herbs = {
      lines = { { id = "he_default", text = "Blindweed, which grows nowhere else in these lands, and liferoot along the banks, and a few things in the Pool of Sorrow that I won't name because I'm still working out what they do. The swamp's a garden, for anyone willing to wade." } },
      choices = {
        { text = "What does blindweed do?", next = "herbs_blind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_blind = {
      lines = { { id = "heb_default", text = "Hides you from the eyes of others, when it's brewed right, and blinds you when it's brewed wrong. I've done both, and I recommend the first." } },
      choices = { { text = "Noted. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    brows = {
      lines = { { id = "br_default", text = "A fire elixir that wanted to be a fire more than an elixir. Rartar keeps a count of the scorch marks on my bench, and he says I'm due for another, so you might want to stand back a little." } },
      choices = { { text = "I'll stand back. Something else.", next = "BACK" } },
    },

    danger = {
      big = true,
      lines = { { id = "da_default", text = "Every alchemist does, if he's any good, because the line between a cure and a poison is a pinch of the wrong thing. The Forsaken apothecaries brew things on purpose that I'd pour into the swamp, and I tell them so whenever they come asking for blindweed." } },
      choices = {
        { text = "Knowledge has no limits. Brew what you can.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some brews should never be made. You're right.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xalch = {
      lines = { { id = "xa_default", text = "The swamp's own recipes, the ones that use what grows here, and the patience to brew in a place where everything spoils. The city alchemists work in dry rooms with clean glass, and they'd faint at the sight of my bench." } },
      choices = { { text = "I'm not afraid of a dirty bench. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was a healer's apprentice in the camps and learned to brew from whatever the guards threw away. Out here, with a whole swamp to work with, I feel like a king." } },
    _none = { { id = "tp_none", text = "Not my subject, friend. Ask me about herbs, or ask somebody else." } },
  },
}
