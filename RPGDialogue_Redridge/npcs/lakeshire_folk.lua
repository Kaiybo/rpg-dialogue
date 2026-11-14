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

  greetings = {
    { id = "g_court", text = "The Court of Lakeshire is in session whenever the Magistrate is at his desk, which is always. State your matter." },
    { id = "g_back", when = { metBefore = true }, text = "Citizen. The court recognises you. Approach." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "PALADIN", "WARRIOR" } },
      text = "You carry yourself like someone who's been sworn to something. Good. The law appreciates people who keep their oaths." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "I'll note for the record that you came in quietly. The record notes everything. Remember that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bailiff Conacher, of the Court of Lakeshire. The Magistrate rules; I see the rulings carried out. It's less glamorous than it sounds, and it doesn't sound glamorous." },
        { id = "h_law", tags = { "news" }, when = { questActive = TODO_QUEST("Solomon's Law") },
          text = "Morganth commands the Shadowhide gnolls from the eastern hills. Aiding an enemy of the kingdom is a hanging matter under Lakeshire law. The Shadowhides have aided him. Bring me their pendants." },
        { id = "h_law_done", when = { questDone = TODO_QUEST("Solomon's Law") },
          text = "The pendants are entered into evidence. All of them. The clerk has asked me, politely, to stop bringing him gnoll jewellery." },
        { id = "h_solomon", when = { heardLine = "solomon.s_default" },
          text = "The Magistrate told you about his letters. I carry them to the courier. They are very thorough letters. They come back very thin." },
        { id = "h_morning", when = { metBefore = true }, text = "Long morning. Short temper. Talk fast." },
      },
      choices = {
        { text = "What does a bailiff do?", next = "duty" },
        { text = "How is the town holding?", next = "town" },
        { text = "Good day, Bailiff.", next = "END" },
      },
    },
    duty = {
      lines = {
        { id = "d_default", text = "Serve writs, keep order in the hall, swear in witnesses. These days it's mostly writing death warrants for orcs who'll never read them." },
      },
      choices = {
        { text = "Someone has to keep the law.", next = "END", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Sounds like a lot of paper.", next = "paper" },
      },
    },
    paper = {
      lines = { { id = "p_default", text = "Paper is how a town remembers it was a town. Without it we're a camp by a lake." } },
      choices = { { text = "...", next = "END" } },
    },
    town = {
      lines = { { id = "t_default", text = "Holding. The court has ruled that it will continue to hold. The orcs have not yet been informed." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    morganth = { { id = "tp_morganth", text = "A sorcerer in the eastern foothills, with the Shadowhides at his heel. Formally an enemy of the kingdom. Informally, worse." } },
    blackrock = { { id = "tp_blackrock", text = "Every warrant on my desk has a Blackrock name on it. Not one has been served." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "Redridge gnolls, Shadowhide gnolls. The law makes a distinction. The gnolls don't." } },
    _none = { { id = "tp_none", text = "Not a matter before the court. Take it up with the Magistrate if you must." } },
  },
}

P:NPC {
  key = "feldon", id = TODO_NPC("Deputy Feldon"), name = "Deputy Feldon",
  bible = "bibles/lakeshire_folk.md", role = "soldier", tier = "quest",
  communities = { "lakeshire" }, temper = { "anxious" }, values = { "dutiful" },
  notices = { "kit" },

  greetings = {
    { id = "g_bridge", text = "Keep to the bridge, keep to the road. What's south of here bites." },
    { id = "g_back", when = { metBefore = true }, text = "Still walking. Good. Fewer gnolls on the road this week, I think. I hope." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Gnolls had a go at you, did they? Get that mended before you cross back over. They smell weakness." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Deputy Feldon. I watch the south end of the bridge and count gnolls. The count keeps going up, which is not how counting's meant to go." },
        { id = "h_parker", tags = { "news" }, when = { questActive = TODO_QUEST("Encroaching Gnolls") },
          text = "Parker sent you? Camps to the north and east, he says. Then it's worse than I reported. And I reported it bad." },
        { id = "h_assess", when = { questActive = TODO_QUEST("Assessing the Threat") },
          text = "Thin them out along the road, and look hard while you're at it. I need numbers I can put in a letter that Stormwind can't wave away." },
        { id = "h_assess_done", when = { questDone = TODO_QUEST("Assessing the Threat") },
          text = "Good work. It's in the report. If Stormwind reads past the first page, they'll be very worried. They won't read past the first page." },
      },
      choices = {
        { text = "How bad is it?", next = "bad" },
        { text = "Stay safe, Deputy.", next = "END" },
      },
    },
    bad = {
      big = true,
      lines = {
        { id = "b_default", text = "Bad enough that if they push through here, there's nothing between them and Elwynn but farmers. And Elwynn doesn't know it." },
      },
      choices = {
        { text = "Then we hold them here.", next = "END", fx = { affinity = 2, standing = { lakeshire = 1 }, learn = { "redridge_gnolls" } } },
        { text = "Elwynn has the city's guard.", next = "guard" },
      },
    },
    guard = {
      lines = { { id = "g2_default", text = "Elwynn has a few men by a bridge and the Lion's Pride. I've been to Goldshire. I know." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    redridge_gnolls = { { id = "tp_gnolls", text = "Redridge clans, mostly. Bigger than the Riverpaw in Westfall, meaner than the Elwynn ones. They've started building." } },
    blackrock = { { id = "tp_blackrock", text = "The gnolls are the hands. I think the orcs are the arms. Don't tell anyone I said so until I can prove it." } },
    _none = { { id = "tp_none", text = "Not my patrol. Ask in town." } },
  },
}

P:NPC {
  key = "parker", id = TODO_NPC("Guard Parker"), name = "Guard Parker",
  bible = "bibles/lakeshire_folk.md", role = "guard", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "dutiful", "shy" },
  notices = { "kit", "travel" },

  greetings = {
    { id = "g_road", text = "Hold up. Where are you headed? The road's watched, but not as well as I'd like." },
    { id = "g_back", when = { metBefore = true }, text = "Road's been quiet. Too quiet, or just quiet. Never can tell out here." },
  },

  notice = {
    { id = "n_dusk", cat = "travel", when = { visited = "Darkshire" },
      text = "Come up from Darkshire? You've got the fog on you. It takes a day to wash off." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Parker. I walk this road between Lakeshire and the Duskwood line and keep an eye on the hills. Eye on the job, always. That's the whole trick." },
        { id = "h_gnolls", tags = { "news" }, when = { questActive = TODO_QUEST("Encroaching Gnolls") },
          text = "Camps north and east of here, more every week. Get word to Deputy Feldon at the bridge. He'll know what to do. I hope he does." },
        { id = "h_lunch", tags = { "news" }, when = { questActive = TODO_QUEST("A Free Lunch") },
          text = "Lunch? From Darcy? That's... that's very kind of her. Tell her it was very kind. No, tell her something better than that. I'll think of something." },
        { id = "h_herbalist", when = { questActive = TODO_QUEST("Visit the Herbalist") },
          text = "Martie grows flowers by the lake. Ask her for something nice. For a thank-you. Don't make a thing of it." },
        { id = "h_after", when = { questDone = TODO_QUEST("Delivering Daffodils") },
          text = "She liked them? She said so? Good. Good. Eyes on the road, Parker. Eyes on the road." },
      },
      choices = {
        { text = "What's out on the road?", next = "road" },
        { text = "So, Darcy...", next = "darcy" },
        { text = "Carry on.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Gnolls in the hills, worse in the woods past the Duskwood line. Things come up out of that fog I don't have names for." } },
      choices = { { text = "Stay sharp.", next = "END", fx = { learn = { "redridge_gnolls" } } } },
    },
    darcy = {
      lines = { { id = "d_default", text = "Darcy's a friend. A good friend. She works at the inn. That's all there is to say. Why, has she said something?" } },
      choices = {
        { text = "She asks after you.", next = "END", fx = { affinity = 2 } },
        { text = "Nothing at all.", next = "END", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    redridge_gnolls = { { id = "tp_gnolls", text = "They move at dusk and they're getting bolder. Last week one came right down to the road and looked at me. Just looked." } },
    worgen = { { id = "tp_worgen", text = "Heard them, past the line. Never seen one. I'd like to keep it that way." } },
    _none = { { id = "tp_none", text = "I just walk the road. Ask in Lakeshire." } },
  },
}

P:NPC {
  key = "darcy", id = TODO_NPC("Darcy"), name = "Darcy",
  bible = "bibles/lakeshire_folk.md", role = "citizen", tier = "quest",
  communities = { "lakeshire" }, temper = { "bright" }, values = { "kind", "romantic" },
  notices = { "hunger", "drink" },

  greetings = {
    { id = "g_inn", text = "Sit anywhere, love, I'll be right round. Anywhere but that table. That one wobbles." },
    { id = "g_back", when = { metBefore = true }, text = "There you are! Same as last time? I remember. I always remember." },
  },

  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy, easy. Water next. I'm not having you fall in the lake on my shift." },
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half-starved and fully beaten. Sit. Breanna's got something on. I'll bring it out." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Darcy. I wait tables at the inn, I hear all the gossip, and I pass on only the nice parts. Mostly." },
        { id = "h_lunch", tags = { "news" }, when = { questActive = TODO_QUEST("A Free Lunch") },
          text = "It's only lunch. For Parker, out on the road. He forgets to eat. Somebody has to remember for him. Don't tell him I said that." },
        { id = "h_daffodils", tags = { "news" }, when = { questActive = TODO_QUEST("Delivering Daffodils") },
          text = "Daffodils! From Parker? Oh. Oh, they're lovely. They're Martie's favourites, though. Did she pick these? On purpose?" },
        { id = "h_after", when = { questDone = TODO_QUEST("Delivering Daffodils") },
          text = "They're in a jar on the windowsill. I've moved them twice. Don't say anything." },
        { id = "h_parker", when = { heardLine = "parker.h_default" },
          text = "You met Parker? On the road? Was he eating? He never eats. Did he say anything? About anything?" },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Is it true your folk wear feathers in your hair? Hippogryph, a traveller told me. I'd never get them to stay put." },
      },
      choices = {
        { text = "Anything good tonight?", next = "food" },
        { text = "Heard any gossip?", next = "gossip" },
        { text = "Just passing through.", next = "END" },
      },
    },
    food = {
      lines = { { id = "f_default", text = "Whatever Breanna's making, and she's making goulash. She's always making goulash. You'll like it. Everyone pretends not to, then has seconds." } },
      choices = { { text = "Goulash it is.", next = "END", fx = { affinity = 1 } } },
    },
    gossip = {
      lines = { { id = "g2_default", text = "Martie's boar's been in her garden again. The Marshal's named it. Bellygrub. Now nobody can take it seriously, which is a problem, because it's enormous." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    blackrock = { { id = "tp_blackrock", text = "Every soldier who comes through here talks about them and then orders a second drink. That tells you enough." } },
    _none = { { id = "tp_none", text = "Couldn't say, love. I just carry the plates. Ask Daniels, he hears more." } },
  },
}

P:NPC {
  key = "martie", id = TODO_NPC("Martie Jainrose"), name = "Martie Jainrose",
  bible = "bibles/lakeshire_folk.md", role = "farmer", tier = "quest",
  communities = { "lakeshire" }, temper = { "warm" }, values = { "patient", "proud" },
  notices = { "craft", "animal" },

  greetings = {
    { id = "g_garden", text = "Step round the beds, dear, they're only just coming up. Lovely weather for it, if it holds." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! The tulips have opened. Well, two have. Two's a start." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "An herbalist! Then you'll know not to step on anything green. Thank you in advance." },
    { id = "n_pet", cat = "animal", when = { pet = true },
      text = "Keep your animal off my garden, please. I've had enough animals in my garden for one season." },
    { id = "n_druid", cat = "animal", when = { class = "DRUID" },
      text = "A druid! You'll know how to talk to plants, then. Mine won't listen to me. Perhaps they'll listen to you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Martie Jainrose. I keep the garden by the lake and grow what the town needs. Herbs for the healer, flowers for nobody in particular." },
        { id = "h_boar", tags = { "news" }, when = { questActive = TODO_QUEST("An Unwelcome Guest") },
          text = "That boar. That great fat boar. The Marshal calls it Bellygrub, as if it's a pet. It's trampled the beds I'd dug for new daffodils. That's a season gone. Bring me its tusk." },
        { id = "h_boar_done", when = { questDone = TODO_QUEST("An Unwelcome Guest") },
          text = "No more hoofprints. I keep looking for them, out of habit. I almost miss the brute. No, I don't." },
        { id = "h_parker", tags = { "news" }, when = { questActive = TODO_QUEST("Visit the Herbalist") },
          text = "Flowers from Parker? How sweet. For... oh. For Darcy. Of course they are. Daffodils, then. Never mind which are my favourites." },
      },
      choices = {
        { text = "What grows well here?", next = "grow" },
        { text = "You seem sad about the flowers.", next = "sad" },
        { text = "Good day.", next = "END" },
      },
    },
    grow = {
      lines = { { id = "g_default", text = "Peacebloom, silverleaf, a little briarthorn by the wall. Anything, really, if the boars and the orcs leave it alone." } },
      choices = { { text = "Thanks.", next = "END" } },
    },
    sad = {
      big = true,
      lines = {
        { id = "s_default", text = "Sad? No. A garden teaches you that some things you plant come up in someone else's yard. That's all. Pass me that trowel, would you?" },
      },
      choices = {
        { text = "Here you are.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    blackrock = { { id = "tp_blackrock", text = "They burned a farm last month. Smoke all day. You could smell it over the lake." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "They've never come for the garden. Small mercies. The boar's worse." } },
    _none = { { id = "tp_none", text = "I'm only a gardener, dear. Ask the Magistrate." } },
  },
}

P:NPC {
  key = "breanna", id = TODO_NPC("Chef Breanna"), name = "Chef Breanna",
  bible = "bibles/lakeshire_folk.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "harried" }, values = { "generous", "practical" },
  notices = { "craft", "soldier" },

  greetings = {
    { id = "g_pots", text = "Here to eat? Sit. Here to help? Wash your hands. Here to complain? Gretchen will see you out." },
    { id = "g_back", when = { metBefore = true }, text = "The goulash brought you back. Or you've nowhere else to go. Either way, sit." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook. Crystal will want to meet you; she teaches the craft. I just make enough of it to feed an army. An actual one." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "You eat like a soldier, I can tell from here. Big portions. I'll tell the kitchen." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Breanna. I feed every soldier Stormwind's stationed in Lakeshire, and they're hungry, and there aren't nearly enough of them. Both of those are problems." },
        { id = "h_goulash", tags = { "news" }, when = { questActive = TODO_QUEST("Redridge Goulash") },
          text = "Goulash for the garrison. I need meat, and the snouts off the big goretusks. Don't make that face. It's where the flavour lives." },
        { id = "h_goulash_done", when = { questDone = TODO_QUEST("Redridge Goulash") },
          text = "The whole garrison's eaten twice today. First time in weeks. You'd think they'd won a battle, the way they were singing." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves eat goulash? Course you do. Everyone eats goulash in Lakeshire. It's that or the lake." },
      },
      choices = {
        { text = "How are the soldiers?", next = "soldiers" },
        { text = "Smells good.", next = "END", fx = { affinity = 1 } },
      },
    },
    soldiers = {
      big = true,
      lines = {
        { id = "s_default", text = "Tired. Thin. They eat like it might be the last hot meal, and some days it is. Stormwind keeps promising more of them. I keep cooking for the ones I've got." },
      },
      choices = {
        { text = "They're lucky to have you.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "More are coming.", next = "coming" },
      },
    },
    coming = {
      lines = { { id = "c_default", text = "So everyone says. I'll set an extra pot on when I see them on the bridge. Not before." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    blackrock = { { id = "tp_blackrock", text = "I count the bowls that don't come back to the kitchen. That's how I know how the fighting's going." } },
    _none = { { id = "tp_none", text = "Ask someone who isn't up to her elbows in onions." } },
  },
}
