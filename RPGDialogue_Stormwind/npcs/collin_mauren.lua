-- Collin Mauren, spellcrafter in Stormwind's Mage Quarter. Voice: bibles/collin_mauren.md
-- Creates spells from odd reagents; friend of the gnome Gaxim Rustfizzle; politely obsessed with basilisk scales.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "collin_mauren", id = TODO_NPC("Collin Mauren"), name = "Collin Mauren",
  bible = "bibles/collin_mauren.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "gentle" }, values = { "curious", "patient" },
  notices = { "arcane", "travel" },

  impression = {
    first = "Collin Mauren makes spells the way a cook makes soup, from whatever odd thing the world gives him. He is courteous and unhurried, and I suspect a great deal cleverer than he lets on.",
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
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I've heard pleasant things about you in the Quarter. That's rarer than you'd think among wizards." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A colleague! Do you work from reagents or from pure formula? I'm always curious, and I promise not to judge." },
    { id = "n_travel", cat = "travel", when = { minLevel = 20 },
      text = "You've been to Kalimdor, I think, from the dust on your boots. Did you pass through Stonetalon, by any chance?" },
  },

  start = "hello",
  nodes = {
    op_gnomes = {
      lines = {
        { id = "op_gnomes_a", text = "Half the Mage Quarter thinks Gaxim's people poisoned their own city out of carelessness, and the other half is quietly buying their devices. I've never quite decided myself, so I'll ask you: what do you think of gnomish tinkering?" },
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
      lines = {
        { id = "h_default", key = true, text = "Collin Mauren. I create spells, mostly from things other people throw away, and I find that the oddest reagents make the most interesting results. Lately it's basilisk scales from the Charred Vale I'm after." },
        { id = "h_scroll", tags = { "news" }, when = { questActive = TODO_QUEST("A Scroll from Mauren") },
          text = "Gaxim sent you? Now, a spell that lets you detonate explosives from a distance, hmm. I believe a messaging spell would carry the effect he wants." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Retrieval for Mauren"), minLevel = 20 },
          text = "Travellers keep asking me about the Stonetalon Mountains. There used to be basilisks in the Charred Vale whose scales, ground fine, make a wonderful reagent, if they still live." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Retrieval for Mauren"), days = 3 } },
          text = "These are perfect, thank you. Perhaps one day I'll be able to help you as you've helped me." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm happy to talk while the mortar's grinding." },
        { id = "h_again2", text = "Go on. Questions are the best reagent of all." },
      },
      choices = {
        { text = "I don't see how you make a spell from scales.", next = "craft" },
        { text = "Who is Gaxim Rustfizzle?", next = "gaxim", when = { any = { { questActive = TODO_QUEST("A Scroll from Mauren") }, { questDone = TODO_QUEST("A Scroll from Mauren") } } } },
        { text = "Why the Charred Vale basilisks?", next = "vale" },
        { text = "Show me how you work your reagents.", next = "mage", when = { class = "MAGE" } },
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
        { text = "What do people here make of gnomes, after Gnomeregan?", next = "op_gnomes" }, { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    vale = {
      lines = { { id = "v_default", text = "The Charred Vale was burned black, and the creatures that stayed took on something of the fire. I've never been myself; I'm better at grinding than travelling." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
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
    background = { { id = "tp_bg", text = "A spellcrafter of the Mage Quarter, neither famous nor dangerous, which I've found is the best combination." } },
    advice = { { id = "tp_ad", text = "Always ask where your power comes from. It's polite, and it keeps you alive." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Try the Wizard's Sanctum; they collect everything there, including gossip." } },
  },
}
