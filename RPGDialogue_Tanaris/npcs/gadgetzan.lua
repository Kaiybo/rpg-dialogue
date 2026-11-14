-- Gadgetzan: the Steamwheedle Cartel's desert town. Voice: bibles/tanaris.md
-- Neutral ground: both factions talk to everyone here.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marin", id = TODO_NPC("Marin Noggenfogger"), name = "Marin Noggenfogger",
  bible = "bibles/tanaris.md", role = "vendor", tier = "major",
  communities = { "gadgetzan" }, temper = { "eager" }, values = { "ambitious", "practical" },
  notices = { "purse", "drink" },

  greetings = {
    { id = "g_heat", text = "Hot! Hot, hot, hot. Every day, hot. Come in, come in, out of the sun. I've something to tell you about." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite partner in progress! Partner is a strong word. Associate. Customer!" },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Now that is a well-stuffed purse. Have you thought about investing in refreshment? Liquid refreshment? With side effects? Minor ones!" },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, you've been at the Road Warrior's ale. Amateur hour. Wait until you try my elixir." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Marin Noggenfogger, alchemist and businessgoblin. I'm working on an elixir that's going to make me rich. And you a bit thirstier, possibly. Small price." },
        { id = "h_thirsty", tags = { "news" }, when = { questActive = TODO_QUEST("The Thirsty Goblin") },
          text = "The dew collectors in Thistleshrub Valley, southwest of here. They carry a gland full of the stuff. Bring me one. Try not to squeeze it." },
        { id = "h_taste", when = { questActive = TODO_QUEST("In Good Taste") },
          text = "It works, but it tastes like a boot. Take it to Sprinkle. She knows how to make awful things palatable." },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Delivery for Marin") },
          text = "Sprinkle's powder! She says I owe her. She always says I owe her. She's usually right." },
        { id = "h_elixir", when = { questActive = TODO_QUEST("Noggenfogger Elixir") },
          text = "This is it. The finished thing. Drink one and tell me what happens. I'll take notes, and I'll stand back a little." },
      },
      choices = {
        { text = "What does the elixir do?", next = "elixir" },
        { text = "Good luck with it.", next = "END" },
      },
    },
    elixir = {
      big = true,
      lines = {
        { id = "e_default", text = "Refreshes you, mostly. Sometimes you shrink. Sometimes you float a bit. Sometimes you come out looking like a skeleton for a while. All very temporary! I'm almost sure." },
      },
      choices = {
        { text = "I'll take a dozen.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll pass.", next = "END", fx = { affinity = -1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    steamwheedle = { { id = "tp_cartel", text = "The Cartel takes its cut, the Bruisers keep the peace, and I keep inventing. Everybody wins. Me most." } },
    _none = { { id = "tp_none", text = "No idea. Is it thirsty? Then I might have something for it." } },
  },
}

P:NPC {
  key = "sprinkle", id = TODO_NPC("Sprinkle"), name = "Sprinkle",
  bible = "bibles/tanaris.md", role = "citizen", tier = "quest",
  communities = { "gadgetzan" }, temper = { "warm" }, values = { "loyal", "generous" },
  notices = { "craft" },

  greetings = {
    { id = "g_kitchen", text = "Hello, sweetie! You look like someone who hasn't eaten anything that tasted good in a week." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you know the secret: anything can taste good if you find the right ingredient. Anything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sprinkle. I fix things that taste wrong. Mostly food. Lately, mostly Marin's experiments. He calls it a partnership; I call it a favor he owes me." },
        { id = "h_taste", tags = { "news" }, when = { questActive = TODO_QUEST("In Good Taste") },
          text = "Noggy's elixir tastes like a swamp? Of course it does. There's a mushroom up in the Hinterlands that fixes anything. Bring me some." },
        { id = "h_secret", when = { questActive = TODO_QUEST("Sprinkle's Secret Ingredient") },
          text = "When I was little I couldn't stand my sister's cooking. Then I found the secret ingredient, and suddenly I could. Fetch me some, would you?" },
      },
      choices = {
        { text = "Noggy?", next = "noggy" },
        { text = "Thanks, Sprinkle.", next = "END" },
      },
    },
    noggy = {
      lines = { { id = "n_default", text = "That's my name for him. Mine. If anyone else calls him that, they'll be tasting my cooking without the secret ingredient." } },
      choices = { { text = "Understood.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't say, sweetie. Can I get you something to eat instead?" } },
  },
}

P:NPC {
  key = "bilgewhizzle", id = TODO_NPC("Chief Engineer Bilgewhizzle"), name = "Chief Engineer Bilgewhizzle",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "harried" }, values = { "practical", "proud" },
  notices = { "craft", "kit" },

  greetings = {
    { id = "g_water", text = "Water Company business only, please. If you're here about the pressure, take a number." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Look at this pump. No, really look at it. Tell me it's not beautiful. Then tell me why it isn't working." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Wastewanders got you. They get everybody. Get patched, then get even." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Water is everything out here. The Water Company keeps Gadgetzan drinking, and the Wastewander bandits keep stealing it. Guess which one of us is having a worse week." },
        { id = "h_justice", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Wastewander Justice") }, { questActive = TODO_QUEST("More Wastewander Justice") } } },
          text = "The Wastewanders camp around the water sources and take what they like. Teach them about consequences. In bulk." },
      },
      choices = {
        { text = "How does a desert town get water?", next = "water" },
        { text = "Good luck with the pressure.", next = "END" },
      },
    },
    water = {
      lines = { { id = "w_default", text = "Towers out at Waterspring Field, pulling it up from under the sand. Delicate machinery. Very delicate. Bandits are not delicate." } },
      choices = { { text = "I'll deal with the bandits.", next = "END", fx = { affinity = 2, standing = { gadgetzan = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Unless it's wet, it's not my department." } },
  },
}

P:NPC {
  key = "fizzledowser", id = TODO_NPC("Senior Surveyor Fizzledowser"), name = "Senior Surveyor Fizzledowser",
  bible = "bibles/tanaris.md", role = "scholar", tier = "quest",
  communities = { "gadgetzan" }, temper = { "cautious" }, values = { "practical", "dutiful" },
  notices = { "craft" },

  greetings = {
    { id = "g_maps", text = "Careful with the maps. Every one of those circles is a place we used to have water." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering", "Mining" } },
      text = "You know the ground, or the gadgets. Either one helps. Both would be a miracle." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Senior Surveyor Fizzledowser, Gadgetzan Water Company. The Wastewanders took half our sources. I find new ones. It's slower than it sounds." },
        { id = "h_survey", tags = { "news" }, when = { questActive = TODO_QUEST("Gadgetzan Water Survey") },
          text = "Take the dowsing widget to Sandsorrow Watch and sample the pool. Should be simple. I say that about everything; it rarely is." },
        { id = "h_lair", when = { questActive = TODO_QUEST("Noxious Lair Investigation") },
          text = "Giant insects, at a water hole? That's not natural. Bring me pieces from their lair; Pestlezugg can tell us what they are." },
        { id = "h_analysis", when = { questActive = TODO_QUEST("Insect Part Analysis") },
          text = "Pestlezugg's report. Let me see. Oh. Oh, that's worse than I hoped. I'd hoped for nothing at all." },
      },
      choices = {
        { text = "What are the insects?", next = "insects" },
        { text = "I'll go and look.", next = "END", fx = { affinity = 1 } },
      },
    },
    insects = {
      big = true,
      lines = {
        { id = "i_default", text = "Big, organized, and coming up out of the sand where they've no business being. I don't think this stops at Tanaris. I'd love to be wrong." },
      },
      choices = { { text = "Let's find out.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Haven't surveyed that. Not yet." } },
  },
}

P:NPC {
  key = "pestlezugg", id = TODO_NPC("Alchemist Pestlezugg"), name = "Alchemist Pestlezugg",
  bible = "bibles/tanaris.md", role = "vendor", tier = "quest",
  communities = { "gadgetzan" }, temper = { "brisk" }, values = { "curious", "practical" },
  notices = { "craft", "pet" },

  greetings = {
    { id = "g_shop", text = "In need of supplies? Vials, phials, the good flasks? Don't mind the rat. That's Rose. She's an assistant." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "A fellow alchemist! I've some insect samples you'd find fascinating. Or horrifying. Usually both." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep your pet away from Rose. She's small, but she bites, and she's been at the reagents." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Alchemist Pestlezugg. I sell supplies, and when the Water Company finds something nasty, I take it apart and tell them how nasty." },
        { id = "h_analysis", tags = { "news" }, when = { questActive = TODO_QUEST("Insect Part Analysis") },
          text = "These parts confirm what I feared. These aren't scattered bugs. They're organized. Take my report to Fizzledowser, quickly." },
        { id = "h_march", when = { questActive = TODO_QUEST("March of the Silithid") },
          text = "Gracina Spiritmight in Darnassus and Zilzibin Drumlore both have theories about where these things come from. Un'Goro, they think. I think they may be right." },
        { id = "h_bungle", when = { questActive = TODO_QUEST("Bungle in the Jungle") },
          text = "I need a scent gland from the hive's own and a handful of Un'Goro soil. With the two, I can build a lure. I'd rather not say for what yet." },
      },
      choices = { { text = "Just browsing.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If you can't distill it, dissect it or sell it, I'm not your goblin." } },
  },
}

P:NPC {
  key = "tranrek", id = TODO_NPC("Tran'rek"), name = "Tran'rek",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "evasive" }, values = { "cunning", "ambitious" },
  notices = { "purse" },

  greetings = {
    { id = "g_shifty", text = "What do I do? A bit of this, a bit of that. Profitable bits. You can't have any." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Somebody's doing well. You ever buy scarab shells? You should. Everybody should." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tran'rek. I buy what the desert's got and sell it to people who haven't got a desert. Business is good. Better than I'll tell you." },
        { id = "h_krazek", when = { any = { { questActive = TODO_QUEST("Tran'rek") }, { heardLine = "krazek.h_default" } } },
          text = "Krazek sent you? My cousin. He talks too much. I'm sure he told you so himself, at length." },
        { id = "h_shells", tags = { "news" }, when = { questActive = TODO_QUEST("Scarab Shells") },
          text = "Uncracked scarab shells. Uncracked is the important part. Cracked ones are worth exactly nothing." },
        { id = "h_valley", when = { questActive = TODO_QUEST("Thistleshrub Valley") },
          text = "Thistleshrub Valley has something I want. Don't ask me why I want it. Just bring it." },
      },
      choices = { { text = "What do the shells sell for?", next = "END", fx = { affinity = -1 } }, { text = "I'll bring them.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    steamwheedle = { { id = "tp_cartel", text = "The Cartel? Lovely people. Very fair. Is this conversation being written down?" } },
    _none = { { id = "tp_none", text = "Wouldn't know. Wouldn't tell you if I did. No offense." } },
  },
}

P:NPC {
  key = "fizzgrimble", id = TODO_NPC("Innkeeper Fizzgrimble"), name = "Innkeeper Fizzgrimble",
  bible = "bibles/tanaris.md", role = "innkeeper", tier = "service",
  communities = { "gadgetzan" }, temper = { "chatty" }, values = { "generous" },
  notices = { "drink", "weary" },

  greetings = {
    { id = "g_inn", text = "Welcome to the Road Warrior! Grab a stool, grab a drink, shake the sand out of your boots." },
    { id = "g_home", when = { homeInn = { "Gadgetzan", "The Road Warrior" } }, text = "You again! Room's ready. Sand's been swept out. Mostly." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy! You walk out in the heat like that and the Bruisers'll be scraping you off the street." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the desert chewed you up and spat you out. Sit. Drink something wet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Fizzgrimble, of the Road Warrior. Best inn in Gadgetzan. Only inn in Gadgetzan. Those facts are related." },
        { id = "h_sand", when = { metBefore = true }, text = "Sand in the stew again. I tell guests it's seasoning. Desert seasoning. Very exclusive." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night's when Gadgetzan cools off and the Bruisers relax. A little. Hear that? Somebody's arguing about water again." },
      },
      choices = { { text = "Just a drink, thanks.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Never heard of it. Want to hear about the weather? Hot. That's the weather." } },
  },
}

-- Steamwheedle Port, on the coast east of Gadgetzan.
P:NPC {
  key = "stoley", id = TODO_NPC("Stoley"), name = "Stoley",
  bible = "bibles/tanaris.md", role = "citizen", tier = "quest",
  communities = { "steamwheedle_port" }, temper = { "nervous" }, values = { "practical" },
  notices = { "purse" },

  greetings = {
    { id = "g_dock", text = "Who sent you? No, don't tell me. I know who sent you. It's always the same fellow." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "You wouldn't consider a small loan? To a man with excellent prospects? No. Nobody does." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Stoley. I work the port. I keep my head down. Some people in Booty Bay think I owe them money, and they're not entirely wrong." },
        { id = "h_mackinley", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Stoley's Debt") }, { heardLine = "mackinley.h_default" } } },
          text = "MacKinley. Of course it's MacKinley. All right. I'll make it good. I've got a shipment coming that'll square us." },
        { id = "h_shipment", when = { questActive = TODO_QUEST("Stoley's Shipment") },
          text = "My shipment. Get it here and we'll all be happier. Especially me. And MacKinley. Mostly me." },
        { id = "h_deliver", when = { questActive = TODO_QUEST("Deliver to MacKinley") },
          text = "Take it to the Sea Wolf, with my compliments. And tell him we're even. Please tell him we're even." },
      },
      choices = { { text = "You should pay your debts.", next = "END", fx = { affinity = -1, align = { order = 1 } } }, { text = "Good luck.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know anything. Knowing things gets a man in trouble." } },
  },
}
