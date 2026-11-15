-- Lakeshire's law, its road, its kitchen, and a bunch of daffodils. Voice: bibles/lakeshire_folk.md
-- Bailiff Conacher, Deputy Feldon, Guard Parker on the Duskwood road, Darcy at the inn,
-- Martie Jainrose in her garden, Chef Breanna feeding the garrison.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "conacher", id = TODO_NPC("Bailiff Conacher"), name = "Bailiff Conacher",
  bible = "bibles/lakeshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "formal" }, values = { "lawful", "dutiful" },
  notices = { "soldier", "stealth" },

  impression = {
    first = "Bailiff Conacher carries out the Magistrate's rulings and says the work is less glamorous than it sounds. He addressed me as citizen, and somehow it felt like a summons.",
    third = "{name} was received by Bailiff Conacher of the Court of Lakeshire, who sees the Magistrate's rulings carried out.",
  },

  greetings = {
    { id = "g_court", text = "The Court of Lakeshire is in session whenever the Magistrate is at his desk, which is always, so state your matter." },
    { id = "g_back", when = { metBefore = true }, text = "Citizen, the court recognises you. You may approach." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "PALADIN", "WARRIOR" } },
      text = "You carry yourself like someone who's been sworn to something, and that's good. The law appreciates people who keep their oaths." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "I'll note for the record that you came in quietly. The record notes everything, so remember that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bailiff Conacher, of the Court of Lakeshire. The Magistrate rules; I see the rulings carried out. It's less glamorous than it sounds, and it doesn't sound glamorous." },
        { id = "h_law", tags = { "news" }, when = { questActive = TODO_QUEST("Solomon's Law") },
          text = "Morganth commands the Shadowhide gnolls from the eastern hills, and aiding an enemy of the kingdom is a hanging matter under Lakeshire law. Bring me their pendants." },
        { id = "h_law_done", when = { questDone = TODO_QUEST("Solomon's Law") },
          text = "The pendants are entered into evidence, every one of them, and the clerk has asked me, politely, to stop bringing him gnoll jewellery." },
        { id = "h_solomon", when = { heardLine = "solomon.s_default" },
          text = "The Magistrate told you about his letters? I carry them to the courier myself. They are very thorough letters, and they come back very thin." },
        { id = "h_morning", when = { metBefore = true }, text = "It's been a long morning and my temper's short, so talk fast." },
      },
      again = {
        { id = "h_again", text = "The court will hear further business." },
        { id = "h_again2", text = "Proceed, and briefly, if the court may ask." },
      },
      choices = {
        { text = "What does a bailiff do?", next = "duty" },
        { text = "How is the town holding?", next = "town" },
        { text = "Tell me about Magistrate Solomon.", next = "solomon" },
        { text = "Theocritus says Morganth stole a book from Stormwind's mages.", next = "theft", when = { heardLine = "theocritus.mo_default" } },
        { text = "I'm sworn to the Light, Bailiff.", next = "oath", when = { class = "PALADIN" } },
        { text = "Was justice done, Bailiff?", next = "justice", when = { questDone = TODO_QUEST("Solomon's Law") } },
        { text = "Good day, Bailiff.", next = "END" },
      },
    },
    duty = {
      lines = {
        { id = "d_default", text = "Serve writs, keep order in the hall, swear in witnesses. These days it's mostly writing death warrants for orcs who'll never read them." },
      },
      choices = {
        { text = "Someone has to keep the law.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Death warrants for orcs who'll never read them are a waste of ink.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Sounds like a lot of paper.", next = "paper" },
        { text = "Who's on your docket?", next = "docket" },
      },
    },
    paper = {
      lines = { { id = "p_default", text = "Paper is how a town remembers it was a town. Without it we're a camp by a lake." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    docket = {
      lines = { { id = "dk_default", text = "Gath'Ilzogg the warlord, Fangore the gnoll and Morganth the sorcerer. Not one has answered a summons, and the court has stopped sending them." } },
      choices = {
        { text = "What's the charge against Morganth?", next = "law" },
        { text = "Something else.", next = "BACK" },
      },
    },
    law = {
      big = true,
      lines = {
        { id = "lw_default", text = "Under the Law of Lakeshire, aiding an enemy of the kingdom carries death. Morganth is the enemy; the Shadowhides are the aid. The court finds the arithmetic simple.",
          fx = { learn = { "morganth", "redridge_gnolls" } } },
      },
      choices = {
        { text = "Then I'll carry out the sentence.", next = "BUSINESS", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Gnolls who only follow orders don't deserve death.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
      },
    },
    town = {
      lines = { { id = "t_default", text = "Holding. The court has ruled that it will continue to hold, though the orcs have not yet been informed." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
    solomon = {
      lines = { { id = "so_default", text = "The Honourable Magistrate works longer than anyone in this hall, which the court considers improper. He writes every letter himself; I only carry them." } },
      choices = {
        { text = "Does anyone answer?", next = "answers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    answers = {
      lines = { { id = "an_default", text = "Politely. The court keeps a drawer for polite, and it is a large drawer." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    theft = {
      lines = { { id = "th_default", text = "Then the court adds theft to the warrant. A small charge beside the others, but the court likes a complete record." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    oath = {
      lines = { { id = "oa_default", text = "Then you'll appreciate that the law is an oath too, only with more paperwork. Keep yours; I'll keep mine." } },
      choices = {
        { text = "Agreed.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I keep my oaths, but I've no patience for your paperwork.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    justice = {
      lines = { { id = "ju_default", text = "Justice was carried out on the Shadowhides, by the record. Whether it was done is for the Light to say, not a bailiff." } },
      choices = {
        { text = "That's an honest answer.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Bailiff to the Court of Lakeshire. I serve writs, swear in witnesses, and stand where the Magistrate points." } },
    advice = { { id = "tp_ad", text = "Answer a court plainly; it saves everyone a morning." } },
    morganth = { { id = "tp_morganth", text = "A sorcerer in the eastern foothills, with the Shadowhides at his heel. Formally he's an enemy of the kingdom, and informally he's worse." } },
    blackrock = { { id = "tp_blackrock", text = "Every warrant on my desk has a Blackrock name on it. Not one has been served." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "Redridge gnolls and Shadowhide gnolls: the law makes a distinction, even if the gnolls don't." } },
    _none = { { id = "tp_none", text = "Not a matter before the court. Take it up with the Magistrate if you must." } },
  },
}

P:NPC {
  key = "feldon", id = TODO_NPC("Deputy Feldon"), name = "Deputy Feldon",
  bible = "bibles/lakeshire_folk.md", role = "soldier", tier = "quest",
  communities = { "lakeshire" }, temper = { "anxious" }, values = { "dutiful" },
  notices = { "kit" },

  impression = {
    first = "Deputy Feldon counts gnolls at the south end of the bridge, and the count keeps going up. He has a dry sense of humour about it that I suspect keeps him upright.",
    third = "{name} met Deputy Feldon, who watches the south end of Lakeshire's bridge and keeps a rising count of gnolls.",
  },

  greetings = {
    { id = "g_bridge", text = "Keep to the bridge and keep to the road, because what's south of here bites." },
    { id = "g_back", when = { metBefore = true }, text = "Still walking? Good. I think there are fewer gnolls on the road this week, or I hope so." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Gnolls had a go at you, did they? Get that mended before you cross back over, because they smell weakness." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Deputy Feldon. I watch the south end of the bridge and count gnolls. The count keeps going up, which is not how counting's meant to go." },
        { id = "h_parker", tags = { "news" }, when = { questActive = TODO_QUEST("Encroaching Gnolls") },
          text = "Parker sent you? Camps to the north and east, he says, so it's worse than I reported, and I reported it bad." },
        { id = "h_assess", when = { questActive = TODO_QUEST("Assessing the Threat") },
          text = "Thin them out along the road, and look hard while you're at it. I need numbers I can put in a letter that Stormwind can't wave away." },
        { id = "h_assess_done", when = { questDone = TODO_QUEST("Assessing the Threat") },
          text = "Good work; it's in the report. If Stormwind reads past the first page they'll be very worried, but they won't read past the first page." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, please; I've lost count once today already." },
        { id = "h_again2", text = "Go on, and I'll keep one eye on the road." },
      },
      choices = {
        { text = "How bad is it?", next = "bad" },
        { text = "Why count gnolls at all?", next = "counting" },
        { text = "Who watches the road south?", next = "parker" },
        { text = "I'm good with numbers. Let me help.", next = "gnome", when = { race = "Gnome" } },
        { text = "I counted them for you. What now?", next = "after", when = { questDone = TODO_QUEST("Assessing the Threat") } },
        { text = "Stay safe, Deputy.", next = "END" },
      },
    },
    bad = {
      big = true,
      lines = {
        { id = "b_default", text = "Bad enough that if they push through here, there's nothing between them and Elwynn but farmers. And Elwynn doesn't know it." },
      },
      choices = {
        { text = "Then we hold them here.", next = "BACK", fx = { affinity = 2, standing = { lakeshire = 1 }, learn = { "redridge_gnolls" } } },
        { text = "Elwynn has the city's guard.", next = "guard" },
        { text = "What do you need from me?", next = "need" },
      },
    },
    guard = {
      lines = { { id = "g2_default", text = "Elwynn has a few men by a bridge and the Lion's Pride. I've been to Goldshire, so I know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "lions_pride" } } } },
    },
    need = {
      lines = { { id = "ne_default", text = "I need numbers. Scout the southern road, thin the camps and count what you see; I can't send men, so I'm sending you." } },
      choices = {
        { text = "I'll scout it.", next = "BUSINESS", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    counting = {
      lines = { { id = "c_default", text = "Because a report without numbers is only a complaint. Stormwind ignores complaints, and it ignores numbers more slowly." } },
      choices = {
        { text = "Who reads your reports?", next = "reports" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reports = {
      lines = { { id = "r_default", text = "The Marshal, then the Magistrate, then a courier, then someone in Stormwind who's very busy. I picture him often, sitting at a lovely desk." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    parker = {
      lines = { { id = "pa_default", text = "Guard Parker, out at the Three Corners. He sends me word, and now and then somebody's lunch goes past me on its way to him." } },
      choices = {
        { text = "Just Parker? Alone?", next = "alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = { { id = "al_default", text = "Alone, yes. That's our whole watch toward Elwynn, one guard and a crossroads, so don't repeat that." } },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, learn = { "redridge_gnolls" } } },
        { text = "Stormwind should hear that.", next = "BACK", fx = { opinion = { stormwind = "abandoned_its_own" } } },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Are you? Then tell me how many gnolls make a war. I've been trying to work it out, and every answer frightens me." } },
      choices = {
        { text = "More than you've got guards.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Fewer than you fear. Count again.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    after = {
      lines = { { id = "af_default", text = "Now the count goes up the hill, and the Magistrate adds it to his letter. You've made the letter heavier, and that's something." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a deputy at the south end of the bridge, and I count." } },
    advice = { { id = "tp_ad", text = "Stay on the road after dark. If the road's not safe, stay in town. If the town's not safe, tell me first." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "Redridge clans, mostly, bigger than the Riverpaw in Westfall and meaner than the Elwynn ones. They've started building." } },
    blackrock = { { id = "tp_blackrock", text = "The gnolls are the hands. I think the orcs are the arms. Don't tell anyone I said so until I can prove it." } },
    _none = { { id = "tp_none", text = "Not my patrol, friend; ask in town." } },
  },
}

P:NPC {
  key = "parker", id = TODO_NPC("Guard Parker"), name = "Guard Parker",
  bible = "bibles/lakeshire_folk.md", role = "guard", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "dutiful", "shy" },
  notices = { "kit", "travel" },

  impression = {
    first = "Guard Parker walks the road between Lakeshire and the Duskwood line and watches the hills like they owe him money. He wanted to know exactly where I was going.",
    third = "{name} was stopped on the road by Guard Parker, who patrols between Lakeshire and the Duskwood line.",
  },

  greetings = {
    { id = "g_road", text = "Hold up, where are you headed? The road's watched, but not as well as I'd like." },
    { id = "g_back", when = { metBefore = true }, text = "The road's been quiet. Too quiet, or just quiet; you can never tell out here." },
  },

  notice = {
    { id = "n_dusk", cat = "travel", when = { visited = "Darkshire" },
      text = "Come up from Darkshire? You've got the fog on you, and it takes a day to wash off." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Parker. I walk this road between Lakeshire and the Duskwood line and keep an eye on the hills, eye on the job always, and that's the whole trick." },
        { id = "h_gnolls", tags = { "news" }, when = { questActive = TODO_QUEST("Encroaching Gnolls") },
          text = "There are camps north and east of here, more every week. Get word to Deputy Feldon at the bridge; he'll know what to do, or I hope he does." },
        { id = "h_lunch", tags = { "news" }, when = { questActive = TODO_QUEST("A Free Lunch") },
          text = "Lunch, from Darcy? That's, er, that's very kind of her. Tell her it was very kind, no, tell her something better than that, once I've thought of something." },
        { id = "h_herbalist", when = { questActive = TODO_QUEST("Visit the Herbalist") },
          text = "Martie's garden is at the west end of town; ask her for something nice. And please don't tell her who it's from, or who it's for." },
        { id = "h_after", when = { questDone = TODO_QUEST("Delivering Daffodils") },
          text = "She liked them, and she said so? Well, that's good, that's... eyes on the road, Parker, eyes on the road." },
      },
      again = {
        { id = "h_again", text = "Something else? Talk while I watch; I can do both, mostly." },
        { id = "h_again2", text = "Go on. My eyes are on the road, but my ears are yours." },
      },
      choices = {
        { text = "What's out on the road?", next = "road" },
        { text = "So, Darcy...", next = "darcy" },
        { text = "What's the trouble in Redridge?", next = "trouble" },
        { text = "Darcy made you lunch.", next = "lunch", when = { questActive = TODO_QUEST("A Free Lunch") } },
        { text = "Darcy loved the daffodils.", next = "flowers", when = { questDone = TODO_QUEST("Delivering Daffodils") } },
        { text = "Carry on.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Gnolls in the hills, worse in the woods past the Duskwood line. Things come up out of that fog I don't have names for." } },
      choices = {
        { text = "Stay sharp.", next = "BACK", fx = { learn = { "redridge_gnolls" } } },
        { text = "Gnolls this close to Elwynn?", next = "elwynn" },
      },
    },
    elwynn = {
      big = true,
      lines = { { id = "e_default", text = "Camps north and east of here, more every week. If they push west, the first thing they find is Goldshire, and Goldshire's mostly farmers and one inn." } },
      choices = {
        { text = "I'll warn Deputy Feldon.", next = "BUSINESS", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darcy = {
      lines = { { id = "d_default", text = "Darcy's a friend, a good friend, and she works at the inn, and that's all there is to say. Why, has she said something?" } },
      choices = {
        { text = "She asks after you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Nothing at all.", next = "BACK", fx = { affinity = -1 } },
        { text = "You could just tell her.", next = "tell" },
      },
    },
    tell = {
      lines = { { id = "t_default", text = "Tell her what? I'm on this road from dawn to dark with my eye on the job... though maybe flowers. Flowers say things so you don't have to." } },
      choices = { { text = "Flowers, then.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    trouble = {
      lines = {
        { id = "tr_default", text = "Ill times. The Blackrock hold Stonewatch, the Shadowhides crowd round their tower, and the Redridge pack grows every season. I hope you didn't come for a holiday.",
          fx = { learn = { "blackrock", "redridge_gnolls" } } },
      },
      choices = {
        { text = "Which is worst?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "Whichever's closest to my road that night. Tonight I'd say the gnolls. Ask me again at dawn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lunch = {
      lines = { { id = "l_default", text = "She did? It's still warm, too. Tell her thank you, properly, and not the way I just said it." } },
      choices = { { text = "I'll tell her properly.", next = "BACK", fx = { affinity = 2 } } },
    },
    flowers = {
      lines = { { id = "f_default", text = "She did, and she said so? Daffodils, though... I only asked Martie for something nice, and she picked daffodils. Huh." } },
      choices = {
        { text = "Martie's favourites, I hear.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a Stormwind guard. They gave me a road and told me to watch it, and I'm watching it." } },
    advice = { { id = "tp_ad", text = "Keep your eye on the job, because everything else is how you get jumped." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "They move at dusk and they're getting bolder. Last week one came right down to the road and just looked at me." } },
    worgen = { { id = "tp_worgen", text = "I've heard them past the line, but never seen one, and I'd like to keep it that way." } },
    _none = { { id = "tp_none", text = "I just walk the road, friend; ask in Lakeshire." } },
  },
}

P:NPC {
  key = "darcy", id = TODO_NPC("Darcy"), name = "Darcy",
  bible = "bibles/lakeshire_folk.md", role = "citizen", tier = "quest",
  communities = { "lakeshire" }, temper = { "bright" }, values = { "kind", "romantic" },
  notices = { "hunger", "drink" },

  impression = {
    first = "Darcy called me love and seated me away from the wobbly table. She hears all the gossip in Lakeshire and swears she passes on only the nice parts.",
    third = "{name} was served at the Lakeshire inn by Darcy, who hears all the town's gossip and claims to repeat only the kind parts.",
  },

  greetings = {
    { id = "g_inn", text = "Sit anywhere, love, I'll be right round. Anywhere but that table, mind, because it wobbles." },
    { id = "g_back", when = { metBefore = true }, text = "There you are, and I bet it's the same as last time. I remember, love; I always remember." },
  },

  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy, easy, water next. I'm not having you fall in the lake on my shift." },
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half-starved and fully beaten, so sit down. Breanna's got something on, and I'll bring it out." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Darcy. I wait tables at the inn and I hear all the gossip, and I pass on only the nice parts, mostly." },
        { id = "h_lunch", tags = { "news" }, when = { questActive = TODO_QUEST("A Free Lunch") },
          text = "It's only lunch, for Parker out on the road. He forgets to eat, so somebody has to remember for him, but don't tell him I said that." },
        { id = "h_daffodils", tags = { "news" }, when = { questActive = TODO_QUEST("Delivering Daffodils") },
          text = "Daffodils from Parker? Oh, they're lovely, they really are! They're Martie's favourites, though, so did she pick these on purpose?" },
        { id = "h_after", when = { questDone = TODO_QUEST("Delivering Daffodils") },
          text = "They're in a jar on the windowsill, and I've moved them twice. Don't say anything." },
        { id = "h_parker", when = { heardLine = "parker.h_default" },
          text = "You met Parker, out on the road? Was he eating, because he never eats, and did he say anything, about anything at all?" },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Is it true your folk wear feathers in your hair? Hippogryph, a traveller told me. I'd never get them to stay put." },
      },
      again = {
        { id = "h_again", text = "What else, love? The tables can wait a minute." },
        { id = "h_again2", text = "Go on, I'm all ears, love. Well, ears and plates." },
      },
      choices = {
        { text = "Anything good tonight?", next = "food" },
        { text = "Heard any gossip?", next = "gossip" },
        { text = "So... Parker.", next = "parker" },
        { text = "I delivered the lunch. He ate every bite.", next = "lunch_done", when = { questDone = TODO_QUEST("A Free Lunch") } },
        { text = "Do you like the daffodils?", next = "daffodils", when = { questDone = TODO_QUEST("Delivering Daffodils") } },
        { text = "Just passing through.", next = "END" },
      },
    },
    food = {
      lines = { { id = "f_default", text = "Whatever Breanna's making, and she's always making goulash. You'll like it; everyone pretends not to, and then has seconds." } },
      choices = {
        { text = "Goulash it is.", next = "BACK", fx = { affinity = 1 } },
        { text = "Who's Breanna?", next = "breanna" },
      },
    },
    breanna = {
      lines = { { id = "br_default", text = "Chef Breanna, up the north end. She fed the whole Stormwind brigade through the last attack, and her cupboard's never recovered." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gossip = {
      lines = { { id = "g2_default", text = "Martie's boar's been in her garden again, and the Marshal's gone and named it Bellygrub. Now nobody can take it seriously, which is a problem, because it's enormous." } },
      choices = {
        { text = "Ha.", next = "BACK", fx = { affinity = 1 } },
        { text = "What about Martie herself?", next = "martie" },
      },
    },
    martie = {
      lines = { { id = "m_default", text = "Martie Jainrose? Sweet as honey to your face. I'd count my flowers after, that's all." } },
      choices = {
        { text = "That's unkind, Darcy.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
        { text = "You think she likes Parker?", next = "martie_parker" },
      },
    },
    martie_parker = {
      lines = { { id = "mp_default", text = "Everyone likes Parker, and that's the trouble with Parker." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    parker = {
      lines = { { id = "p_default", text = "Parker's a big, brave Stormwind guard who forgets his own lunch, so somebody has to remember. That's all it is." } },
      choices = {
        { text = "That's all?", next = "parker_all" },
        { text = "Something else.", next = "BACK" },
      },
    },
    parker_all = {
      lines = { { id = "pa_default", text = "That's all! Well, mostly, and don't you dare tell him." } },
      choices = {
        { text = "Not a word.", next = "BACK", fx = { affinity = 2 } },
        { text = "He might want to know.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    lunch_done = {
      lines = { { id = "ld_default", text = "Every bite? Did he say anything? What did he say, exactly, word for word?" } },
      choices = {
        { text = "That you have a kind heart.", next = "BACK", fx = { affinity = 3 } },
        { text = "He said it was tough work, guarding.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    daffodils = {
      lines = { { id = "da_default", text = "I love them. They're Martie's favourites, though, and I can't stop wondering whether she knew. If they wilt early, I'll know why." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear everything at the tables, though I only pass on the nice parts, mostly. Ask me about any of this!" },
    },
    background = { { id = "tp_bg", text = "I carry plates at the inn. Everyone talks to the one carrying the plates." } },
    advice = { { id = "tp_ad", text = "Eat something before you go out there, because nobody fights well hungry, and Parker certainly doesn't." } },
    blackrock = { { id = "tp_blackrock", text = "Every soldier who comes through here talks about them and then orders a second drink. That tells you enough." } },
    _none = { { id = "tp_none", text = "Couldn't say, love; I just carry the plates. Ask Daniels, he hears more." } },
  },
}

P:NPC {
  key = "martie", id = TODO_NPC("Martie Jainrose"), name = "Martie Jainrose",
  bible = "bibles/lakeshire_folk.md", role = "farmer", tier = "quest",
  communities = { "lakeshire" }, temper = { "warm" }, values = { "patient", "proud" },
  notices = { "craft", "animal" },

  impression = {
    first = "Martie Jainrose grows herbs for the healer and flowers for nobody in particular. Her garden by the lake is the gentlest thing I've seen in Redridge.",
    third = "{name} met Martie Jainrose, who keeps a garden by the lake in Lakeshire and grows herbs for the town's healer.",
  },

  greetings = {
    { id = "g_garden", text = "Step round the beds, dear, they're only just coming up. Lovely weather for it, if it holds." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! The tulips have opened, well, two of them have, and two's a start." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "An herbalist! Then you'll know not to step on anything green. Thank you in advance." },
    { id = "n_pet", cat = "animal", when = { pet = true },
      text = "Keep your animal off my garden, please. I've had enough animals in my garden for one season." },
    { id = "n_druid", cat = "animal", when = { class = "DRUID" },
      text = "A druid! You'll know how to talk to plants, then. Mine won't listen to me, so perhaps they'll listen to you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Martie Jainrose. I keep the garden by the lake and grow what the town needs: herbs for the healer, and flowers for nobody in particular." },
        { id = "h_boar", tags = { "news" }, when = { questActive = TODO_QUEST("An Unwelcome Guest") },
          text = "That great fat boar the Marshal calls Bellygrub has trampled the beds I'd dug for daffodils, and that's a whole season gone. Bring me his tusk, would you?" },
        { id = "h_boar_done", when = { questDone = TODO_QUEST("An Unwelcome Guest") },
          text = "No more hoofprints, though I keep looking for them out of habit. I almost miss the brute... no, I don't." },
        { id = "h_parker", tags = { "news" }, when = { questActive = TODO_QUEST("Visit the Herbalist") },
          text = "Flowers? You've hardly arrived and you're buying flowers, so somebody's caught your eye. Daffodils, then; they're my favourite." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? Just step around the seedling trays." },
        { id = "h_again2", text = "Go on, then. The weeds will wait; they always do." },
      },
      choices = {
        { text = "What grows well here?", next = "grow" },
        { text = "Tell me about Bellygrub.", next = "boar" },
        { text = "You seem sad about the flowers.", next = "sad" },
        { text = "I'm an herbalist too.", next = "herbs", when = { profession = "Herbalism" } },
        { text = "Your garden's struggling. Let me listen to it.", next = "druid", when = { class = "DRUID" } },
        { text = "The daffodils were from Parker. For Darcy.", next = "told", when = { questDone = TODO_QUEST("Delivering Daffodils") },
          fx = { align = { honor = -1 } } },
        { text = "Somebody asked me to deliver daffodils, and I won't say who.", next = "END", when = { questDone = TODO_QUEST("Delivering Daffodils") }, fx = { align = { honor = 1 } } },
        { text = "Good day.", next = "END" },
      },
    },
    grow = {
      lines = { { id = "g_default", text = "Peacebloom, silverleaf, a little briarthorn by the wall. Anything, really, if the boars and the orcs leave it alone." } },
      choices = {
        { text = "Thanks.", next = "BACK" },
        { text = "Who uses your herbs?", next = "buyers" },
      },
    },
    buyers = {
      lines = { { id = "bu_default", text = "Whoever's doing the healing, which is everyone lately. Peacebloom for the guards' cuts, silverleaf for the kitchen. Alma teaches the craft, if you want it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    boar = {
      lines = { { id = "bo_default", text = "That forsaken boar roots in the field southwest of town and comes calling at night. The Marshal gave him a name, so now he's a character instead of a menace." } },
      choices = {
        { text = "I'll deal with him.", next = "BUSINESS", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "Why not let him be?", next = "boar_be" },
      },
    },
    boar_be = {
      lines = { { id = "bb_default", text = "Because I can't replant until next season now. Let him be, and there'll be no next season either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sad = {
      big = true,
      lines = {
        { id = "s_default", text = "Sad? No, dear. A garden teaches you that some things you plant come up in someone else's yard, that's all. Pass me that trowel, would you?" },
      },
      choices = {
        { text = "Here you are.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Is it about Parker?", next = "parker" },
      },
    },
    parker = {
      lines = { { id = "pk_default", text = "Parker? He walks past the garden twice a day and says the weather's fine. It always is, when he says it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    herbs = {
      lines = { { id = "hb_default", text = "Then you'll know peacebloom bruises if you look at it wrong. Come and look at the silverleaf and tell me why it's sulking." } },
      choices = {
        { text = "Too much shade, I'd say.", next = "BACK", fx = { affinity = 2 } },
        { text = "It's sulking because of the boar.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "Well? What's it saying? Don't tell me it's the boar, because I know it's the boar." } },
      choices = { { text = "It's the boar.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
    told = {
      lines = { { id = "to_default", text = "Ah. For Darcy, of course they were. Well, they'll look lovely on her windowsill." } },
      choices = {
        { text = "I'm sorry, Martie.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the garden at the west end of town. It keeps me, too, some years." } },
    advice = { { id = "tp_ad", text = "Plant early, weed young, and never let a soldier name your boar." } },
    blackrock = { { id = "tp_blackrock", text = "They burned a farm last month, and the smoke went on all day; you could smell it over the lake." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "They've never come for the garden, small mercies, but the boar's worse." } },
    _none = { { id = "tp_none", text = "I'm only a gardener, dear, so you'd best ask the Magistrate." } },
  },
}

P:NPC {
  key = "breanna", id = TODO_NPC("Chef Breanna"), name = "Chef Breanna",
  bible = "bibles/lakeshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "harried" }, values = { "generous", "practical" },
  notices = { "craft", "soldier" },

  impression = {
    first = "Chef Breanna feeds every soldier Stormwind has sent to Lakeshire and makes it plain there aren't nearly enough of them. Her kitchen runs like a barracks, only louder.",
    third = "{name} met Chef Breanna, who cooks for every soldier stationed in Lakeshire and wishes there were more of them.",
  },

  greetings = {
    { id = "g_pots", text = "If you're here to eat, sit; if you're here to help, wash your hands. If you're here to complain, Gretchen will see you out." },
    { id = "g_back", when = { metBefore = true }, text = "The goulash brought you back, or you've nowhere else to go. Either way, sit down." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Crystal will want to meet you, since she teaches the craft. I just make enough of it to feed an army, and I mean an actual one." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "You eat like a soldier, I can tell from here, so I'll tell the kitchen to make it a big portion." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Breanna. I feed every soldier Stormwind's stationed in Lakeshire, and they're hungry, and there aren't nearly enough of them, and both of those are problems." },
        { id = "h_goulash", tags = { "news" }, when = { questActive = TODO_QUEST("Redridge Goulash") },
          text = "Goulash? My cupboard's bare; I fed the whole Stormwind brigade through the last attack. Bring me condor, spider and goretusk snouts, and your bowl's the first one filled." },
        { id = "h_goulash_done", when = { questDone = TODO_QUEST("Redridge Goulash") },
          text = "The pot's full again. You had your bowl, then the garrison smelled the rest and lined up, and that's how goulash works." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves eat goulash? Course you do; everyone eats goulash in Lakeshire, because it's that or the lake." },
      },
      again = {
        { id = "h_again", text = "What else, dear? You can talk while I get on with the chopping." },
        { id = "h_again2", text = "Go on. The onions won't cut themselves, but they'll wait." },
      },
      choices = {
        { text = "How are the soldiers?", next = "soldiers" },
        { text = "What goes in the goulash?", next = "goulash" },
        { text = "Who works your kitchen?", next = "kitchen" },
        { text = "I cook. Can I lend a hand?", next = "cook", when = { profession = "Cooking" } },
        { text = "Shall I bless the pot?", next = "priest", when = { class = "PRIEST" } },
        { text = "Smells good.", next = "END", fx = { affinity = 1 } },
      },
    },
    soldiers = {
      big = true,
      lines = {
        { id = "s_default", text = "Tired and thin. They eat like it might be their last hot meal, and some days it is. Stormwind keeps promising more of them; I keep cooking for the ones I've got." },
      },
      choices = {
        { text = "They're lucky to have you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "More are coming.", next = "coming" },
        { text = "How many do you feed?", next = "count" },
      },
    },
    coming = {
      lines = { { id = "c_default", text = "So everyone says. I'll set an extra pot on when I see them on the bridge, and not before." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    count = {
      lines = { { id = "ct_default", text = "As many as Stormwind sends, which isn't enough, and as many as come back, which is fewer. I've stopped setting places by name." } },
      choices = {
        { text = "That's a hard thing to carry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    goulash = {
      lines = { { id = "gl_default", text = "Condor, spider, and the snout off a great goretusk. Don't make that face; the snout's where the flavour lives." } },
      choices = {
        { text = "Spider?", next = "spider" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spider = {
      lines = { { id = "sp_default", text = "Crisp spider, and it crunches. Everyone has seconds, and nobody asks twice." } },
      choices = { { text = "I'll take your word for it.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    kitchen = {
      lines = { { id = "k_default", text = "Crystal teaches cooking to anyone who'll stand still, and Gretchen carries plates and opinions. I do the rest, which is most of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "ck_default", text = "Then you know a bare cupboard when you see one. Bring the meat and I'll show you the recipe, because that's how kitchens trade." } },
      choices = {
        { text = "Deal.", next = "BUSINESS", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Bless it if you like. Then bless the ones eating from it; they need it more than the pot does." } },
      choices = {
        { text = "I'll bless them both.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A blessing won't fill anyone's stomach.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I cook for Lakeshire's garrison, with the same pots as before the attacks and a good many more mouths." } },
    advice = { { id = "tp_ad", text = "Eat when there's food, because in Redridge that isn't every day." } },
    blackrock = { { id = "tp_blackrock", text = "I count the bowls that don't come back to the kitchen. That's how I know how the fighting's going." } },
    _none = { { id = "tp_none", text = "Ask someone who isn't up to her elbows in onions." } },
  },
}
