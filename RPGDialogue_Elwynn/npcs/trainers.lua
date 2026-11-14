-- Elwynn's class trainers: Northshire Abbey's teachers for the first ten levels, and Goldshire's
-- for the next twenty. Voices: bibles/trainers.md (one bible, a section each).
-- Each has their own way with their own class and a short way with everyone else.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Northshire Abbey
---------------------------------------------------------------------------

-- Priestess Anetta: heals the abbey's wounded trainees and teaches novice priests.
P:NPC {
  key = "anetta", id = TODO_NPC("Priestess Anetta"), name = "Priestess Anetta", title = "Priest Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "steady" }, values = { "pious", "kind" },
  spiritSensitive = true,
  notices = { "wounds" },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Sit, little {g:brother|sister}. The Light can wait a moment for you to catch your breath." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "Hurt? Sit. I'll see to it. Then go and find your own teacher." },
  },

  notice = {
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.3 } },
      text = "Another one from the kobold camps. Hold still. You're the ninth today, and the day's young." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Anetta. I keep the Library Wing, and I keep the recruits alive. Some days those are the same job." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hallowed Letter"), days = 1 } },
          text = "So McBride wrote to me about you. Then you're one of mine now. The first lesson is that the Light heals the people who annoy you too." },
        { id = "h_wounded", when = { questActive = TODO_QUEST("Healing the Wounded") },
          text = "The trainees by the barracks. Mend them, don't lecture them. The lecturing comes later, and it's my job." },
        { id = "h_favor", tags = { "news" }, when = { questActive = TODO_QUEST("In Favor of the Light") },
          text = "Josetta, in Goldshire, upstairs at the Lion's Pride. She'll teach you what I can't from a library. Finish what you owe the Marshal first." },
        { id = "h_other", when = { ["not"] = { class = "PRIEST" } },
          text = "Whatever your path, don't turn your back on the Light. It has a long memory, and a kind one." },
        { id = "h_cots", when = { metBefore = true }, text = "Three cots full this morning, and all three of them got up and walked out by noon. I'll take that." },
        { id = "h_back", tags = { "news" }, when = { class = "PRIEST", minLevel = 20, metBefore = true },
          text = "Look at you. You left here with a staff you could barely hold. Come and tell me what the world's done to you. Then tell me what you've done to it." },
      },
      again = { { id = "h_again", text = "Something else? Sit while you ask; the stool's for visitors." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is the Light, really?", next = "light" },
        { text = "What should a new priest learn first?", next = "first", when = { class = "PRIEST", maxLevel = 15 } },
        { text = "What happens to the ones you can't heal?", next = "lost" },
        { text = "I grew up in these halls.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "Thank you, Priestess.", next = "END" },
      },
    },
    light = {
      big = true,
      lines = { { id = "l_default", text = "Not a weapon, whatever the paladins say over supper. More like a lamp you keep lit for whoever comes after you." } },
      choices = {
        { text = "I'll keep it lit.", next = "BACK", fx = { affinity = 1, align = { light = 2 } } },
        { text = "Some days it's a weapon.", next = "light_weapon", fx = { trait = { stern = 1 } } },
      },
    },
    light_weapon = {
      lines = { { id = "lw_default", text = "Some days. Then you put it down again, and you check your hands, and you go and heal someone. That's how you know it's still the Light in them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "To heal before you're asked. To stand behind the fighters, not in front of them. And to drink water. Priests forget water. I don't know why. We all do." } },
      choices = {
        { text = "Why behind the fighters?", next = "first_behind" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    first_behind = {
      lines = { { id = "fb_default", text = "Because if you fall, so do they. You're the last thing between them and Brother Neals. Be harder to kill than the kobold in front of you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    lost = {
      big = true,
      lines = { { id = "lo_default", text = "I sit with them. That's all there is to do, at the end. You'll do it too, one day. Don't let anyone tell you it isn't healing." } },
      choices = {
        { text = "I'll remember.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "That sounds unbearable.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    novice = {
      lines = { { id = "n_default", text = "I thought I knew the face. You used to fall asleep in the back of the library. Well. Someone did. Every novice does. Welcome home." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 3, standing = { northshire = 2 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A priestess of Northshire. I came to the Abbey to read, and stayed to bandage. The reading waits." } },
    advice = { { id = "tp_ad", text = "Kobolds bite low. Watch your ankles, and keep a prayer ready for whoever forgot to." } },
    northshire_abbey = { { id = "tp_abbey", text = "Mind the library steps. Recruits read standing up and fall down standing up." } },
    kobolds = { { id = "tp_kobolds", text = "I see what they leave behind. Mostly in the infirmary." } },
    _none = { { id = "tp_none", text = "I've no answer for that, but I'll pray you find one." } },
  },
}

-- Khelden Bremen: teaches novice mages the fundamentals, up the stairs.
P:NPC {
  key = "khelden", id = TODO_NPC("Khelden Bremen"), name = "Khelden Bremen", title = "Mage Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "proud" }, values = { "curious", "ambitious" },
  notices = { "arcane" },

  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "Ready to face your destiny? Good. Close the door, the draught scatters my notes." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "Don't touch anything glowing. Or humming. Or warm." },
  },

  notice = {
    { id = "n_burn", cat = "arcane", when = { class = "MAGE", durability = { max = 0.3 } },
      text = "Singed sleeves. You stood too close to your own fire again. Everyone does once. Do it twice and I'll start charging you for robes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Khelden Bremen. I teach the fundamentals. Everyone wants the dramatic parts. The fundamentals are what keep the dramatic parts from killing you." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Glyphic Letter"), days = 1 } },
          text = "McBride's letter. So you've a spark. Knowledge and power are out there for the taking, whatever gods or men think of it. Let's see how much you can carry." },
        { id = "h_other", when = { ["not"] = { class = "MAGE" } },
          text = "Magic is dangerous to the untrained. You're untrained. I'm only pointing out the arithmetic." },
        { id = "h_level", when = { class = "MAGE", minLevel = 10 },
          text = "You've outgrown my little room. Goldshire, the Lion's Pride, upstairs. Wefhellt will take you from here. Try not to set the inn alight." },
        { id = "h_basics", when = { metBefore = true }, text = "Back for more fundamentals? Good. Everyone else wants fireballs. You'd be amazed how many of them set the library curtains alight." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why do mages chase power?", next = "power" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    power = {
      big = true,
      lines = { { id = "p_default", text = "Because it's there. Because someone else will take it if we don't. Because it's beautiful. Pick whichever lets you sleep." } },
      choices = {
        { text = "Because it's beautiful.", next = "END", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Because someone has to keep it from the wrong hands.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
  },

  topics = {
    northshire_abbey = { { id = "tp_abbey", text = "Too many stairs and not enough shelves. Otherwise ideal." } },
    _none = { { id = "tp_none", text = "Not in any book I own, and I own most of them." } },
  },
}

-- Jorik Kerridan: behind the abbey, out of sight.
P:NPC {
  key = "jorik", id = TODO_NPC("Jorik Kerridan"), name = "Jorik Kerridan", title = "Rogue Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "sharp" }, values = { "cunning", "honest" },
  notices = { "stealth" },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Took you long enough to find me. That's good. It means I'm doing my job." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "Lost? Your trainer's out front somewhere. Go find them." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Nice try. I heard your buckle. Lose the buckle." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jorik. I teach the quiet arts back here where the Brothers don't have to watch. They prefer it. So do I." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Encrypted Letter"), days = 1 } },
          text = "You read the letter, or you couldn't have found me. Good. Lesson one: never trust anything you didn't decode yourself." },
        { id = "h_defias", when = { class = "ROGUE", topicKnown = "defias" },
          text = "The Brotherhood will try to recruit you. People who move like you are worth a lot to them. Don't let anyone own you. Whoever asks." },
        { id = "h_seen", when = { metBefore = true }, text = "Heard you coming three steps off. Better than last time. Last time it was ten." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Who do rogues answer to?", next = "answer", when = { class = "ROGUE" } },
        { text = "I'll go.", next = "END" },
      },
    },
    answer = {
      lines = { { id = "a_default", text = "Ourselves, mostly. And the crown, through people in Old Town you'll meet when you're ready. Not before." } },
      choices = { { text = "I'll be ready.", next = "END", fx = { affinity = 1, align = { order = 1 } } } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "They want spies in Stormwind. Don't be one. That's the whole of my advice." } },
    _none = { { id = "tp_none", text = "Back here we deal in what's useful. That isn't." } },
  },
}

-- Drusilla La Salle: among the graves, beside Dane Winslow.
P:NPC {
  key = "drusilla", id = TODO_NPC("Drusilla La Salle"), name = "Drusilla La Salle", title = "Warlock Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "sharp" }, values = { "ambitious", "cunning" },
  notices = { "pet", "fel" },

  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Patience. Prudence. Then power. In that order, or not at all." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "This isn't for you. Go away." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp's making faces at the gravestones. Correct it. Small disobediences grow." },
    { id = "n_taint", cat = "fel", when = { class = "WARLOCK", taint = { min = 20 } },
      text = "You're reaching faster than you're learning. I can smell it on you. Slow down, or you'll be one of the weak ones." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "La Salle. I teach out here among the dead because the Brothers prefer not to see me. The dead don't mind. They're very good listeners." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tainted Letter"), days = 1 } },
          text = "McBride's letter, and his nose wrinkled as he wrote it, I'm sure. Welcome. The arcane devours the weak. We'll see what it makes of you." },
        { id = "h_level", when = { class = "WARLOCK", minLevel = 10 },
          text = "Goldshire. The cellar of the Lion's Pride. Ask for Marcot. Don't ask for anything else down there." },
        { id = "h_brothers", when = { metBefore = true }, text = "The Brothers prayed for me again this morning. Loudly. I find it touching, in its way." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Why do the Brothers tolerate you?", next = "tolerate" },
        { text = "I'll go.", next = "END" },
      },
    },
    tolerate = {
      lines = { { id = "t_default", text = "Because the kingdom needs every weapon it has, and I am a very good weapon. They pray about it. I let them." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    northshire_abbey = { { id = "tp_abbey", text = "Very holy. Very loud bells. I'm out here for the quiet." } },
    _none = { { id = "tp_none", text = "Ask the dead. They know more than you'd think." } },
  },
}

---------------------------------------------------------------------------
-- Goldshire
---------------------------------------------------------------------------

-- Lyria Du Lac: behind the smithy, next to Brother Wilhelm.
P:NPC {
  key = "lyria", id = TODO_NPC("Lyria Du Lac"), name = "Lyria Du Lac", title = "Warrior Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "proud" }, values = { "brave", "stern" },
  notices = { "kit" },

  greetings = {
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Shield up. Always. Even when you're greeting me." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "This is for fighters. Try something safer. Knitting, maybe." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "You let them hit you. A lot. Stormwind's warriors take a beating; they don't invite one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Du Lac. I make Stormwind's soldiers out of Elwynn's farm hands. The kingdom's strength isn't its walls. It's whoever's standing on them." },
        { id = "h_training", tags = { "news" }, when = { questActive = TODO_QUEST("A Warrior's Training") },
          text = "Your training's not finished. There's someone you need to see, and you'll have to go and find them. That's part of it." },
        { id = "h_wilhelm", when = { class = "PALADIN" },
          text = "Wilhelm's round the side. Tell him I'll have the practice yard back by noon. He'll know what that means." },
        { id = "h_dawn", when = { metBefore = true }, text = "You're up early. Good. The recruits weren't. They are now." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What makes a good warrior?", next = "good" },
        { text = "I'll go.", next = "END" },
      },
    },
    good = {
      lines = { { id = "g2_default", text = "Getting up. Everyone gets knocked down. Warriors are the ones who are annoyed about it." } },
      choices = { { text = "I'll remember.", next = "END", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
  },

  topics = {
    hogger = { { id = "tp_hogger", text = "Every warrior I train goes after him too early. Every one. Go after him late." } },
    _none = { { id = "tp_none", text = "Not my business. My business is the practice yard." } },
  },
}

-- Priestess Josetta: upstairs at the Lion's Pride; wishes she'd been braver when young.
P:NPC {
  key = "josetta", id = TODO_NPC("Priestess Josetta"), name = "Priestess Josetta", title = "Priest Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "steady" }, values = { "pious", "kind" },
  spiritSensitive = true,
  notices = { "travel" },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Welcome, friend in the Light. Come in from the noise." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "Don't turn away from the Light, friend, whatever road you're on." },
  },

  notice = {
    { id = "n_travel", cat = "travel", when = { minLevel = 20 },
      text = "You've been far, haven't you. I can tell by your boots. I always meant to go far. I meant to for thirty years." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Josetta. I teach the Light up here, above the noise of the common room. Mostly above it." },
        { id = "h_garments", when = { questActive = TODO_QUEST("Garments of the Light") },
          text = "There are folk on the road who need mending more than they'll admit. Find them. Heal them. Don't wait to be asked." },
        { id = "h_prayer", key = true, when = { questActive = TODO_QUEST("Desperate Prayer") },
          text = "There's more for you beyond Goldshire. Go and learn it. I'll be here, envying you a little." },
        { id = "h_favor", tags = { "news" }, when = { questActive = TODO_QUEST("In Favor of the Light") },
          text = "Anetta sent you down from the Abbey. She only sends the ones she's proud of. Don't tell her I told you." },
        { id = "h_forever", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Confounding Flash") }, { questActive = TODO_QUEST("Divine Grace") } } },
          text = "A new lesson. Even I'm still learning them. Don't tell the Cathedral that either." },
        { id = "h_young", when = { maxLevel = 12 },
          text = "When I was your age I wanted to see the whole world. I stayed in Goldshire instead. Don't do that. Go." },
        { id = "h_go", when = { metBefore = true }, text = "You're still here? Good, and not good. The world's bigger than Goldshire, little one. Go and see it, and come back and tell me." },
        { id = "h_far", tags = { "news" }, when = { class = "PRIEST", minLevel = 30, metBefore = true },
          text = "You came back. You actually came back, from wherever that tan's from. Sit. Tell me everything. Start with the sea." },
      },
      again = { { id = "h_again", text = "What else? Mind the floorboard; it squeaks to Farley." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why didn't you travel?", next = "travel" },
        { text = "Where would you have gone?", next = "where" },
        { text = "Tell me about the Cathedral.", next = "cathedral", when = { class = "PRIEST" } },
        { text = "I've been far. Want to hear about it?", next = "stories", when = { minLevel = 30 } },
        { text = "Thank you.", next = "END" },
      },
    },
    travel = {
      big = true,
      lines = { { id = "t_default", text = "Courage, mostly. Or the lack of it. There was always a reason to stay one more season. Seasons add up." } },
      choices = {
        { text = "It's not too late.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Goldshire needed you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Everywhere! The sea first. I've never seen it. Then the mountains, and the forests where the elves live, and a desert, just to feel too hot once." } },
      choices = {
        { text = "I'll bring you back something from the sea.", next = "BACK", fx = { affinity = 3, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral = {
      lines = { { id = "c_default", text = "Bigger than you'd think, and quieter. High Priestess Laurena will teach you there when you're ready. She's stern. She's also right, which is worse." } },
      choices = {
        { text = "Why didn't you go to the Cathedral?", next = "cathedral_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral_why = {
      lines = { { id = "cw_default", text = "Someone has to be here for the ones who aren't ready yet. That's what I tell myself. Some days it's even true." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    stories = {
      lines = {
        { id = "s_default", text = "Yes! Sit down. Did you see the sea? What colour was it? Don't say blue. Everyone says blue." },
        { id = "s_booty", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "You've been to Booty Bay? With the pirates? Oh, I'd have fainted. Tell me slowly." },
      },
      choices = {
        { text = "Grey, mostly. And loud.", next = "BACK", fx = { affinity = 3 } },
        { text = "Green, near the shore. Like old glass.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A priestess of Goldshire, above the noise of the inn, for longer than I meant to be.", next = "travel" } },
    advice = { { id = "tp_ad", text = "Go somewhere you've never been, once a year at least. The Light looks different from a new place." } },
    lions_pride = { { id = "tp_inn", text = "Lovely inn. Thin floors. I know all of Farley's stories by heart." } },
    _none = { { id = "tp_none", text = "I've never been far enough to know that. Ask someone who's travelled." } },
  },
}

-- Zaldimar Wefhellt: upstairs at the Lion's Pride, left at the top of the stairs.
P:NPC {
  key = "zaldimar", id = TODO_NPC("Zaldimar Wefhellt"), name = "Zaldimar Wefhellt", title = "Mage Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "proud" }, values = { "curious" },
  notices = { "arcane" },

  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "Ah, a colleague. Junior colleague. Come in, mind the books." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "Magic hurts the untrained. Please stand over there. Further." },
  },

  notice = {
    { id = "n_skyborne", cat = "arcane", when = { race = "Skyborne", class = "MAGE" },
      text = "A High Order mage, in my little room above an inn. The Kirin Tor will be jealous. I intend to enjoy that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Wefhellt, of the Wizard's Sanctum, currently of the upstairs room at the Lion's Pride. The view is of a stable. One makes do." },
        { id = "h_jennea", tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Jennea") },
          text = "Jennea in the city wants a word with you. She's sharper than I am. Don't tell her I said so; she'll have it engraved." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Jennea") },
          text = "Jennea again. Twice in one apprenticeship. She must like you. I'd be worried." },
        { id = "h_stable", when = { metBefore = true }, text = "The stable boy has taken to whistling beneath my window. Every morning. In a key I'm fairly certain doesn't exist." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Farewell.", next = "END" },
      },
    },
  },

  topics = {
    morganth = { { id = "tp_morganth", text = "The Redridge business. A student who went wrong. Every teacher's nightmare. Theocritus takes it personally, and he's right to." } },
    lions_pride = { { id = "tp_inn", text = "Comfortable, if you don't mind the singing. I mind the singing." } },
    _none = { { id = "tp_none", text = "Outside my field. My field is large, but that's outside it." } },
  },
}

-- Keryn Sylvius: SI:7's eye in Goldshire, in the reading room.
P:NPC {
  key = "keryn", id = TODO_NPC("Keryn Sylvius"), name = "Keryn Sylvius", title = "Rogue Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "cunning", "witty" },
  notices = { "stealth" },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Well, well. Look who crawled up the stairs." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "Wrong room. Door's behind you." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "You're sneaking. In a reading room. Where everyone's quiet already. Think about that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sylvius. I train the quiet ones in Goldshire and I read a lot of books I don't need. Both are cover. Neither is your business." },
        { id = "h_si7", tags = { "news" }, when = { questActive = TODO_QUEST("Seek out SI:7") },
          text = "Old Town, in the city. Don't ask anyone for directions. If you can't find SI:7 without help, SI:7 doesn't need you." },
        { id = "h_si7_done", when = { questDone = TODO_QUEST("Seek out SI:7") },
          text = "So the Master's seen you. Did he smile? He doesn't, as a rule. If he did, start worrying." },
        { id = "h_book", when = { metBefore = true }, text = "I'm on chapter nine. It's dreadful. I'll finish it anyway. Everyone needs a vice that isn't the job." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Who's the Master?", next = "master", when = { class = "ROGUE" } },
        { text = "Wrong room. Sorry.", next = "END" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "Shaw. You'll meet him. Or he'll meet you, which is different, and worse." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "SI:7 has files. I have opinions. Neither leaves this room." } },
    _none = { { id = "tp_none", text = "Even if I knew, I wouldn't say. Especially if I knew." } },
  },
}

-- Remen Marcot: the Lion's Pride cellar, with Crowe and Darkheart.
P:NPC {
  key = "remen", id = TODO_NPC("Remen Marcot"), name = "Remen Marcot", title = "Warlock Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "steady" }, values = { "cunning", "ambitious" },
  notices = { "pet" },

  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Down the stairs and out of the light. You found us. Good." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "The wine cellar's the other door. This one's private." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Still on the imp? It's a start. It's not a finish. There's something heavier waiting for you, when you're ready to carry it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Marcot. Farley thinks this is a storeroom. It is. We store knowledge, mostly. Some of it bites." },
        { id = "h_gakin", tags = { "news" }, when = { questActive = TODO_QUEST("Gakin's Summons") },
          text = "Gakin wants you in the city. That means he thinks you're ready for a voidwalker. He's usually right. Usually." },
        { id = "h_drusilla", when = { class = "WARLOCK", maxLevel = 12 },
          text = "La Salle sent you down from Northshire? She sends the patient ones. Don't disappoint her. She has a long memory and short temper." },
        { id = "h_farley", when = { metBefore = true }, text = "Farley came down for a barrel yesterday and looked straight at us. Then he took the barrel and left. I've grown fond of him." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Does Farley know what you do down here?", next = "farley" },
        { text = "I'll go.", next = "END" },
      },
    },
    farley = {
      lines = { { id = "f_default", text = "Farley knows we pay on time and don't break the furniture. That's all an innkeeper wants to know." } },
      choices = { { text = "Ha.", next = "END", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    lions_pride = { { id = "tp_inn", text = "Best cellar in Elwynn. Dry, quiet, and nobody asks questions." } },
    _none = { { id = "tp_none", text = "Ask upstairs. They like questions upstairs." } },
  },
}
