-- Marshal's Refuge's quiet hands (0.39.0): the supply seller and the flight master.
-- Voice: bibles/ungoro.md ("Refuge hands")
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "nergal", id = TODO_NPC("Nergal"), name = "Nergal", title = "General Goods",
  bible = "bibles/ungoro.md", role = "vendor", tier = "service",
  communities = { "marshals_refuge" }, temper = { "gruff" }, values = { "careful", "profit" },
  notices = { "race", "hunger" },

  impression = {
    first = "Nergal sells food, drink and supplies at Marshal's Refuge, and he won't buy a thing that grew down in the crater. He's a gruff dwarf with a long memory for every expedition that went down and didn't come back.",
    third = "{name} met Nergal, the dwarf who sells supplies at Marshal's Refuge.",
  },

  greetings = {
    { id = "g_default", text = "Food, drink and shot, and all of it hauled up from Gadgetzan, so don't ask why it costs what it costs." },
    { id = "g_back", when = { metBefore = true }, text = "Back up the hill in one piece, are ye? Good, I hate losing a customer to a lizard." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf in this steaming pit! Ye've my sympathy, friend; there's no proper stone down there, only mud and teeth." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nergal, and I keep the stores for the Refuge. Bread, meat, water and ammunition, all carried up here by people braver than me, so the expedition doesn't have to eat what lives in the crater." },
      },
      again = {
        { id = "h_again", text = "Anything more ye need from the stores, friend, before I get back to my crates?" },
        { id = "h_again2", text = "Ask away, but I'll keep stacking while ye do." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Why not eat what's in the crater?", next = "crater_food" },
        { text = "What happened to the expedition?", next = "expedition" },
        { text = "Goodbye.", next = "END" },
      },
    },
    crater_food = {
      lines = { { id = "cf_default", text = "Because half the plants down there want to eat ye first, and the other half make ye sick. The meat's all right if ye can kill it, but most of what's worth eating down there is bigger than a kodo and twice as angry." } },
      choices = {
        { text = "I could hunt something for the Refuge.", next = "crater_hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crater_hunt = {
      lines = { { id = "ch_default", text = "Ye could, and ye'd be welcome to sell it to somebody braver than me. I'll stick to food that came in a crate, thank ye very much." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    expedition = {
      lines = { { id = "e_default", text = "The Marshals came down here thinking it was a garden, and the crater taught them otherwise. They lost their camps to the beasts and climbed up here to the high ground, and Williden's been trying to make the best of it ever since." } },
      choices = {
        { text = "They were brave to try.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They were foolish to come unprepared.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep the stores. Where I kept them before is between me and my old employers." } },
    advice = { { id = "tp_ad", text = "Carry more food than ye think, because ye'll not be wanting to eat anything ye find down there." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye. Ask Williden, he knows more about this place than I'd ever want to." } },
  },
}

P:NPC {
  key = "gryfe", id = TODO_NPC("Gryfe"), name = "Gryfe", title = "Flight Master",
  bible = "bibles/ungoro.md", role = "flightmaster", tier = "service",
  communities = { "marshals_refuge" }, temper = { "cheerful" }, values = { "profit" },
  notices = { "race" },

  impression = {
    first = "Gryfe runs the flights out of Marshal's Refuge for anyone who pays, Horde or Alliance. He's a cheerful goblin who considers a beast that doesn't land in Un'Goro a beast that comes back.",
    third = "{name} met Gryfe, the goblin flight master at Marshal's Refuge.",
  },

  greetings = {
    { id = "g_default", text = "Need a ride out of the crater? Smartest thing anyone's said to me all day, and I haven't even heard you say it yet." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You're a big one, friend! The flyer will carry you, don't worry, but it'll grumble about it all the way to Gadgetzan." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gryfe, flight master for Marshal's Refuge. I'll fly anybody to Gadgetzan or to Cenarion Hold, Horde or Alliance alike, because coin's the same colour whichever side pays it." },
      },
      again = {
        { id = "h_again", text = "What else? The flyer's getting twitchy." },
        { id = "h_again2", text = "Go on, ask, but don't take too long." },
      },
      choices = {
        { text = "Where can I fly?", next = "BUSINESS" },
        { text = "Why fly anyone, Horde or Alliance?", next = "neutral" },
        { text = "Is flying over the crater safe?", next = "safe" },
        { text = "Goodbye.", next = "END" },
      },
    },
    neutral = {
      lines = { { id = "n_default", text = "Because the Cartel keeps this place running, and the Cartel doesn't take sides. The Bruisers keep everyone civil, and I keep everyone moving, and it's a fine arrangement for all of us." } },
      choices = {
        { text = "More places should work like that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't trust anyone who'd fly my enemies.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Safer than walking it, friend. Pterrordax come up off the cliffs now and then and take a look at the flyers, but my beasts are faster, and they've got plenty of reason to be." } },
      choices = {
        { text = "What's a pterrordax?", next = "safe_ptero" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_ptero = {
      lines = { { id = "sp_default", text = "A flying lizard with a beak like a pickaxe and no manners at all. Spraggle Frock can tell you all about them, since she's been warning people for weeks." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I go where the flight paths go, and right now they go here. That's the whole story." } },
    advice = { { id = "tp_ad", text = "Fly over Un'Goro whenever you can, because everything down there wants to eat you, and none of it can catch a flyer." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel pays my wages and keeps the Bruisers here. That's all the politics I need." } },
    _none = { { id = "tp_none", text = "Don't know. I only know where things are from the air." } },
  },
}
