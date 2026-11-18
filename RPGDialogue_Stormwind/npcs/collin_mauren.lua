-- Collin Mauren, spellcrafter in Stormwind's Mage Quarter. Voice: bibles/collin_mauren.md
-- Creates spells from odd reagents; friend of the gnome Gaxim Rustfizzle; politely obsessed with basilisk scales.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local QS = TODO_QUEST("A Scroll from Mauren")
local QD = TODO_QUEST("Devils in Westfall")
local QR = TODO_QUEST("Retrieval for Mauren")

P:NPC {
  key = "collin_mauren", id = TODO_NPC("Collin Mauren"), name = "Collin Mauren",
  bible = "bibles/collin_mauren.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "gentle" }, values = { "curious", "patient" },
  notices = { "arcane", "travel", "race" },

  impression = {
    first = "Collin Mauren makes spells the way a cook makes soup, from whatever odd thing the world gives him. He is courteous and unhurried, and I suspect he's cleverer than he lets on by a good margin.",
    third = "{name} met Collin Mauren, a courteous spellcrafter in Stormwind's Mage Quarter who builds spells from strange reagents.",
  },

  greetings = {
    { id = "g_op_gnomes", when = { opinion = { topic = "gnomes", stance = "reckless" } }, text = "Ah, the one who thinks gnomes reckless! Gaxim wrote last month, and only two pages of the letter were singed, so I'm counting it as progress." },
    { id = "g_study", text = "Good day. Mind the scale dust on the table; a pinch of it costs more than your boots." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, hello again. Have you come back from somewhere interesting? People usually have." },
    { id = "g_scales", when = { questActive = TODO_QUEST("Retrieval for Mauren") }, text = "Have you already returned from the Charred Vale? Take your time; the dragonkin aren't going anywhere, and neither am I." },
    { id = "g_devil", when = { questActive = TODO_QUEST("Devils in Westfall") }, text = "Have you found the component I need? A dust devil is a peculiar thing to ask for, I know." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I've ground the last of my scales in that time. Welcome back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown in power since we last spoke; I can feel it from here, rather like a warm stove." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I've heard pleasant things about you in the Quarter. Wizards rarely say pleasant things about anyone, so I took note." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A colleague! Do you work from reagents or from pure formula? I'm always curious, and I promise not to judge." },
    { id = "n_travel", cat = "travel", when = { minLevel = 20 },
      text = "You've been to Kalimdor, I think, from the dust on your boots. Did you pass through Stonetalon, by any chance?" },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Forgive me for staring; my dearest friend is one of your people, and you all have the same way of looking at a room as if you'd like to take it apart." },
  },

  start = "hello",
  nodes = {
    op_gnomes = {
      lines = {
        { id = "op_gnomes_a", text = "The Mage Quarter loves to say Gaxim's people poisoned their own city out of carelessness, and then it goes and quietly buys their devices. I've never quite decided myself, so I'll ask you: what do you think of gnomish tinkering?" },
      },
      choices = {
        { text = "Brilliant work. Gnomes will build things men can't imagine.", next = "op_gnomes_1", fx = { opinion = { gnomes = "admire" }, align = { order = -1 }, trait = { curious = 1 }, affinity = 1 } },
        { text = "They lost a whole city to their own machines. That's reckless.", next = "op_gnomes_2", fx = { opinion = { gnomes = "reckless", gnomeregan = "their_fault" }, align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Useful allies. Their machines saved us more than once in the war.", next = "op_gnomes_3", fx = { opinion = { gnomes = "useful" }, trait = { practical = 1 } } },
        { text = "Gnomeregan was taken from us by a traitor. Mind that.", next = "op_gnomes_4", when = { race = "Gnome" }, fx = { opinion = { gnomeregan = "betrayed", gnomes = "admire" }, affinity = 2 } },
        { text = "I'd rather not judge a whole people.", next = "BACK" },
      },
    },
    op_gnomes_1 = {
      lines = { { id = "op_gnomes_r1", text = "That's Gaxim's view exactly, though he usually adds 'and then they explode'. I'll tell him you said it; he collects compliments the way I collect scales." } },
      choices = { { text = "Something else, Collin.", next = "BACK" } },
    },
    op_gnomes_2 = {
      lines = { { id = "op_gnomes_r2", text = "It's the very thing I worry about with my own craft: power first, understanding later. I'd only add that they were betrayed from inside, and that's harder to guard against." } },
      choices = { { text = "Something else, Collin.", next = "BACK" } },
    },
    op_gnomes_3 = {
      lines = { { id = "op_gnomes_r3", text = "Their flying machines, yes, and their cannons, all through the war against the Horde. A sensible answer, and the one I'd give at court." } },
      choices = { { text = "Something else, Collin.", next = "BACK" } },
    },
    op_gnomes_4 = {
      lines = { { id = "op_gnomes_r4", text = "Forgive me, I put that badly. Gaxim speaks of the traitor's name the way some men speak of the plague, and I should have remembered it." } },
      choices = { { text = "Something else, Collin.", next = "BACK" } },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Collin Mauren. I create spells, mostly from things other people throw away, and I find that the oddest reagents make the most interesting results. Lately it's basilisk scales from the Charred Vale I'm after." },
        { id = "h_scroll", tags = { "news" }, when = { questActive = TODO_QUEST("A Scroll from Mauren") },
          text = "Gaxim sent you? Now, a spell that lets you detonate explosives from a distance, hmm. I believe a messaging spell would carry the effect he wants." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Retrieval for Mauren"), minLevel = 20 },
          text = "Travellers keep asking me about the Stonetalon Mountains. There used to be basilisks in the Charred Vale whose scales, ground fine, make a wonderful reagent, if they still live." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Retrieval for Mauren"), days = 3 } },
          text = "These are perfect, thank you. Perhaps one day I'll be able to help you as you've helped me." },
        { id = "h_devils", when = { questActive = QD },
          text = "The dust devils in Westfall, yes; when they come apart they leave a little debris behind, and it still remembers spinning. Bring me some, and Gaxim will have his scroll." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "Collin Mauren, spellcrafter. I'll ask you the question I ask everyone, only a little more gently: where does your power come from, and does it ever ask for anything back?" },
      },
      again = {
        { id = "h_again", text = "Something else? I'm happy to talk while the mortar's grinding." },
        { id = "h_again2", text = "Go on. Questions are the best reagent of all." },
        { id = "h_again3", text = "What else can I tell you? I've nowhere to be, which is the great luxury of a man who never travels." },
      },
      choices = {
        { text = "I don't see how you make a spell from scales.", next = "craft" },
        { text = "Who is Gaxim Rustfizzle?", next = "gaxim", when = { any = { { questActive = TODO_QUEST("A Scroll from Mauren") }, { questDone = TODO_QUEST("A Scroll from Mauren") } } } },
        { text = "Why the Charred Vale basilisks?", next = "vale" },
        { text = "Why would anyone want a dust devil?", next = "devils" },
        { text = "Where did you learn your craft?", next = "learned" },
        { text = "You must have interesting neighbours in the Quarter.", next = "quarter" },
        { text = "Your fingers are stained to the second knuckle.", next = "hands" },
        { text = "Show me how you work your reagents.", next = "mage", when = { class = "MAGE" } },
        { text = "Gaxim is a gnome? Then he's one of mine.", next = "xgnome", when = { race = "Gnome" } },
        { text = "My power asks plenty back. I pay it.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "I studied in Dalaran myself, before the end.", next = "xdalaran", when = { origin = "human_dalaran_stray" } },
        { text = "I grew up a few doors down, Collin.", next = "xquarter", when = { origin = "human_mage_quarter" } },
        { text = "What will you make from the scales I brought?", next = "xdone", when = { questDone = QR } },
        { text = "Can I help?", next = "BUSINESS" },
        { text = "Good day, Collin.", next = "END" },
      },
    },
    craft = {
      lines = { { id = "c_default", text = "Everything that lives in a place drinks a little of its magic. A basilisk in a burned valley holds the fire in its scales, and if you grind them and bind them right, the spell remembers." },
      },
      choices = {
        { text = "Is that safe?", next = "craft_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_safe = {
      lines = { { id = "cs_default", text = "Mostly. The trouble comes when a spellcrafter stops asking where the power came from and starts only asking how much of it there is." },
      },
      choices = {
        { text = "That's what happened to Dalaran's worst, isn't it?", next = "craft_power" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_power = {
      big = true,
      lines = { { id = "cp_default", text = "Some of them, yes, and to a few who wore Stormwind's colours too. I'd rather make a small, honest spell than a great one I don't understand. Would you?" },
      },
      choices = {
        { text = "Yes. Understanding first, power after.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "No. Power first; understanding catches up.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gaxim = {
      lines = { { id = "g_default", text = "A gnome friend of mine, out in Kalimdor, who has a talent for explosions and a weakness for plans that need someone else's help. I enjoy hearing about his adventures, from a safe distance." },
      },
      choices = {
        { text = "What do people here make of gnomes, after Gnomeregan?", next = "op_gnomes" },
        { text = "How did a spellcrafter end up friends with a gnome?", next = "gaxim_met" },
        { text = "What does he want to blow up, exactly?", next = "gaxim_plan" },
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    gaxim_met = {
      lines = { { id = "gm_default", text = "He came through Stormwind years ago selling a device that sorted reagents by weight, and it sorted my whole shelf onto the floor in about a second. I bought it anyway, because nobody had ever tried to help me so enthusiastically, and we've written to each other ever since." },
      },
      choices = {
        { text = "Does the device still work?", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gaxim_plan = {
      lines = { { id = "gp_default", text = "He asked for a spell to set off his charges from a great distance, and he wouldn't say what they were meant for, which I took as a bad sign. I gave him a messaging spell instead, one that carries a signal on the wind, and let him decide what the signal means." },
        { id = "gp_active", when = { questActive = QS },
          text = "That's what his scroll is asking, isn't it? To set off explosives from far away. I'll help, but my way, with a message on the wind rather than a fuse, and he can decide what the message sets off." },
      },
      choices = {
        { text = "Clever. He gets what he needs, and you keep your hands clean.", next = "gaxim_hands" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gaxim_hands = {
      big = true,
      lines = { { id = "gh_default", text = "Clean is generous; I still made the thing that tells the fuse to burn. I've decided a friend's judgement is his own, and that I'd rather he blew things up carefully with my help than carelessly without it." },
      },
      choices = {
        { text = "A friend's judgement is his own. You did right to trust him.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "You should have refused until he told you the target.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vale = {
      lines = { { id = "v_default", text = "The Charred Vale was burned black, and the creatures that stayed took on something of the fire. I've never been myself; I'm better at grinding than travelling." },
      },
      choices = {
        { text = "What burned the Vale in the first place?", next = "vale_burned" },
        { text = "You've never been? You should see it for yourself.", next = "vale_travel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vale_burned = {
      lines = { { id = "vb_default", text = "I've read three explanations and believed none of them: a dragon's passing, a great fire set by the Venture Company's logging crews, and a druid's quarrel with something best left nameless. Whatever did it, the basilisks drank the heat in, and their scales have been warm ever since." },
      },
      choices = {
        { text = "My money's on the goblins.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vale_travel = {
      big = true,
      lines = { { id = "vt_default", text = "Everyone says so, and I'm sure they're right, but I get seasick on the boat to Auberdine and lost in Elwynn. I'm a man who reads about mountains, and I've decided to be at peace with it." },
      },
      choices = {
        { text = "Knowledge you haven't earned with your own feet is only borrowed.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Others can fetch it for you. That's only sensible.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Westfall's dust devils
    devils = {
      lines = { { id = "dv_default", text = "Because a dust devil is the wind remembering how to spin, and when it falls apart the debris keeps a little of that memory. Ground with the right binding, it makes a spell that travels, which is exactly what a message ought to do." },
      },
      choices = {
        { text = "So the message rides the wind?", next = "devil_spell" },
        { text = "Westfall's dangerous now. Was it worth sending someone?", next = "devil_westfall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    devil_spell = {
      lines = { { id = "ds_default", text = "In a manner of speaking. You write the words on the scroll and read them aloud, and the wind carries their shape to the one other scroll made from the same dust. It's slow, and it only says a few words, but it doesn't need a courier or a gryphon." },
      },
      choices = {
        { text = "That could change the way armies talk to each other.", next = "devil_army" },
        { text = "Something else.", next = "BACK" },
      },
    },
    devil_army = {
      big = true,
      lines = { { id = "da_default", text = "It could, and that's why I've told nobody at the Keep about it. Gaxim uses it for his charges, and I'd sooner it stayed a toy for a gnome than became a tool for a general." },
      },
      choices = {
        { text = "The Alliance needs every edge. You should tell the Keep.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep it quiet. Generals ruin every good invention.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    devil_westfall = {
      lines = { { id = "dw_default", text = "I wouldn't send anyone who couldn't look after themselves, and I'm told the devils wander well away from the bandits' camps. Still, I've read the reports from Sentinel Hill, and I don't sleep easily when I've asked someone to go out there.",
          fx = { learn = { "westfall" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    -- His learning
    learned = {
      lines = { { id = "l_default", text = "At the Academy here, badly, and then for one season at Dalaran, very well indeed. After that, mostly from my own mistakes, which are cheaper than tutors and teach a good deal harder." },
      },
      choices = {
        { text = "What was Dalaran like?", next = "learned_dalaran" },
        { text = "What sort of mistakes?", next = "craft_failure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned_dalaran = {
      lines = { { id = "ld_default", text = "Like walking into a library that was also a cathedral and also an argument, all at once. Everyone there was cleverer than me, and none of them would tell me anything for free, so I learned to watch what they threw away.",
          fx = { learn = { "dalaran", "kirin_tor" } } },
      },
      choices = {
        { text = "And what they threw away became your craft.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_failure = {
      lines = { { id = "cf_default", text = "I once tried a reagent of Duskwood fog, thinking it would make a spell of concealment, and instead my study was dim for a fortnight and my candles wouldn't stay lit. I've never been so glad to see sunlight, nor so careful about labelling jars." },
      },
      choices = {
        { text = "What other odd reagents have you tried?", next = "craft_reagents" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_reagents = {
      lines = { { id = "cr_default", text = "Murloc scales, which smell of the sea forever after, and wax from the kobolds' candles, which burns with a stubborn little flame. My best was ash from a Redridge chimney, which made a ward that held for exactly one night and then sighed." },
      },
      choices = {
        { text = "A ward that sighed? I'd like to have heard that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Quarter
    quarter = {
      lines = { { id = "q_default", text = "The Sanctum up the road, Mazen with his library and his nerves, a very good tavern, and a cellar under the Slaughtered Lamb that I try not to think about. It's a fine street, so long as you don't open the wrong door." },
      },
      choices = {
        { text = "The Lamb's cellar? What's down there?", next = "quarter_lamb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter_lamb = {
      big = true,
      lines = { { id = "ql_default", text = "Warlocks, and the city lets them be, because some of them are useful and all of them are dangerous. They're the very people I mean when I say ask where your power comes from, because they know, and they've decided they don't mind." },
      },
      choices = {
        { text = "The city should shut that cellar and be done with it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Better they study where the city can watch them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- An observation
    hands = {
      lines = { { id = "hd_default", text = "Basilisk dust does that, and there's no soap in Stormwind that will shift it. My mother says I look as though I've been digging coal, and I tell her it's the most expensive coal in the kingdom." },
      },
      choices = {
        { text = "Does it hurt?", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    xgnome = {
      lines = { { id = "xg_default", text = "One of yours, and proud of it, and he'll tell you about Gnomeregan if you let him, though he always stops at the same place in the story. He's out in Stonetalon now; if you pass that way, he'd be glad of a face from home." },
      },
      choices = {
        { text = "I'll look for him in Stonetalon.", next = "BACK", fx = { affinity = 1 } },
        { text = "What do people here make of gnomes now?", next = "op_gnomes" },
      },
    },
    xwarlock = {
      big = true,
      lines = { { id = "xw_default", text = "Then you're more honest than most, and I'll give you that freely. I only wonder whether the price stays the same, or whether it creeps up a little each time, the way prices do." },
      },
      choices = {
        { text = "I watch the price closely. That's the whole discipline.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Whatever it costs, the power is worth it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdalaran = {
      lines = { { id = "xd_default", text = "Then you'll know the smell of the violet halls, that mix of old paper and ozone. Did you ever see the reagent vaults below the Citadel? I only ever saw the door, and I've dreamed about that door for twenty years." },
      },
      choices = {
        { text = "I saw them once. They were very orderly.", next = "BACK", fx = { affinity = 1 } },
        { text = "Only the door, like you.", next = "BACK" },
      },
    },
    xquarter = {
      lines = { { id = "xq_default", text = "Then you're the one who used to throw pebbles at my window to see the wards spark! Don't deny it; I knew every child on this street by the sound of their pebble." },
      },
      choices = {
        { text = "Guilty. The sparks were worth it.", next = "BACK", fx = { affinity = 1 } },
        { text = "That was someone else, I promise.", next = "BACK" },
      },
    },
    xdone = {
      lines = { { id = "xdn_default", text = "A ward against fire, I hope, since the scales already know what fire is and should know how to refuse it. If it works, I'll name it after you, quietly, in my own notes, where names are safest." },
      },
      choices = {
        { text = "I'd be honoured, Collin.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "m_default", text = "Here, feel the dust between your fingers. You see the warmth? Don't draw on it, only listen to it, and you'll know what it wants to become." },
      },
      choices = {
        { text = "It wants to be fire.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "The Kirin Tor are rebuilding Dalaran, I'm told, and I'd give anything to see their libraries again. I studied there once, and I learned more in a week than in a year anywhere else." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are the finest mages in the world, and they're very slow to share what they know. I've learned to make my own spells from scraps, because I couldn't wait for them." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was a fine mage, before he turned to the dead, and I read his early work as a student. It's a terrible thing to admire a man's mind and despise everything he did with it." } },
    shadowfang = { { id = "tp_shadowfang", text = "Arugal was a fine mage too, before he summoned the worgen and lost himself in Shadowfang Keep. I'm always careful with the spells I make, because I've seen what happens when a mage isn't." } },
    westfall = { { id = "tp_westfall", text = "Westfall has the best dust devils in the kingdom and the worst bandits, and I'm afraid I only ever ask for the first. I hope someone at the Keep is asking about the second." } },
    background = { { id = "tp_bg", text = "A spellcrafter of the Mage Quarter, neither famous nor dangerous, which I've found is the best combination." } },
    advice = { { id = "tp_ad", text = "Always ask where your power comes from. It's polite, and it keeps you alive." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Try the Wizard's Sanctum; they collect everything there, including gossip." } },
  },
}
