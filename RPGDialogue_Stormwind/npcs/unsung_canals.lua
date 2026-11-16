-- Canal-side tradesfolk with no quests: the Cordells' enchanting shop, Catherine Leland's
-- fishing stall and the Canal Tailor and Fit Shop's clothier. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

-- Lucan Cordell: the city's foremost enchanter; supplies the Mage Quarter since Dalaran fell.
P:NPC {
  key = "lucan_cordell", id = TODO_NPC("Lucan Cordell"), name = "Lucan Cordell", title = "Expert Enchanter",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "measured" }, values = { "craft", "arcane" },
  notices = { "craft", "arcane" },
  impression = {
    first = "Lucan Cordell is the enchanter the rest of Stormwind's merchants name when they talk about where their good wares come from. He spoke slowly and chose his words like reagents, and he expected the same care from a student.",
    third = "{name} met Lucan Cordell, the foremost enchanter in Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Welcome. If you have what it takes, I'll gladly show you the way." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. I hope your rods have been keeping their charge." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" }, place = "before",
      text = "There's strange dust in the creases of your pack, which tells me you've been taking things apart. Good; every enchanter begins by unmaking." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" }, place = "before",
      text = "A mage, and you'll think enchanting is beneath you, because your spells fade and mine last. Stay a while, and you may change your mind." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lucan Cordell. I teach enchanting, and since Dalaran fell, much of the enchanted work sold in this city has passed through this shop first. It's more responsibility than I asked for, but someone had to take it." },
        { id = "h_nightelf", when = { race = "NightElf" }, text = "A kaldorei. Your people distrust the arcane, I know, and I won't try to argue you out of it. Enchanting is a careful craft, and I think even your elders would find little in it to fear." },
      },
      again = {
        { id = "h_again", text = "Is there more you'd learn? I have a little time before the next rod needs charging." },
        { id = "h_again2", text = "Go on; the rod can rest a moment." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "What does an enchanter actually do?", next = "craft" },
        { text = "You supply the whole Mage Quarter?", next = "supply" },
        { text = "Good day, Lucan.", next = "END" },
      },
    },
    craft = {
      lines = { { id = "c_default", text = "We take the magic out of one thing and bind it into another. You'll learn to break a glowing trinket into dust, and then to work that dust into a blade or a cloak with a copper rod." } },
      choices = {
        { text = "So you destroy things to make things?", next = "craft2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft2 = {
      lines = { { id = "c2_default", text = "Every craft does; the smith melts ore and the tailor cuts cloth. The difference is that what we unmake was often made by someone long dead, and I like to think we honour them by using it well." } },
      choices = {
        { text = "Old work should be preserved, not broken down.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Better used than gathering dust on a shelf.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      lines = { { id = "s_default", text = "Much of it, yes, with the help of a few others. When Dalaran fell and Quel'Thalas burned, the old suppliers went with them, and the shops had nowhere else to turn." } },
      choices = {
        { text = "Did you know anyone in Dalaran?", next = "dalaran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran = {
      lines = { { id = "d_default", text = "I studied there for a summer, long ago, and I wrote to an old teacher until the letters stopped coming. I don't speak of it often, and I'd rather not now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "An enchanter of Stormwind, trained in part in Dalaran, and teaching now because there are too few of us left." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't care to pretend that I do." } },
  },
}

-- Jessara Cordell: enchanting supplies in the family shop; brisk and protective of Lucan.
P:NPC {
  key = "jessara_cordell", id = TODO_NPC("Jessara Cordell"), name = "Jessara Cordell", title = "Enchanting Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "practical", "family" },
  notices = { "craft" },
  impression = {
    first = "Jessara Cordell sells rods, vials and formulae in the Cordells' shop and guards Lucan's time as fiercely as his stock. She was brisk with me and kind to the apprentices, which seemed the right way round.",
    third = "{name} met Jessara Cordell, who sells enchanting supplies in the Cordells' shop.",
  },
  greetings = {
    { id = "g_default", text = "Rods, vials and formulae. If you want Lucan, he's teaching, so please be quick about it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me guess: you've broken another rod." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" }, place = "before",
      text = "You'll want a runed copper rod soon, if you haven't got one already. Everyone thinks they can do without it, and nobody can." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jessara Cordell. Lucan teaches and I sell, and I keep the shop running while he talks about the old masters." },
      },
      again = {
        { id = "h_again", text = "Rods, vials or Lucan's time: which do you need next?" },
        { id = "h_again2", text = "Quickly, please, because I've orders to fill." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Whose orders are you filling?", next = "orders" },
        { text = "You keep Lucan's time well.", next = "lucan" },
        { text = "Thank you, Jessara.", next = "END" },
      },
    },
    orders = {
      lines = { { id = "o_default", text = "Half the Mage Quarter's: Stormwind Staves, Duncan's Textiles, Ancient Curios. They've all been sending to us since Dalaran fell, and Lucan won't refuse any of them." } },
      choices = {
        { text = "Is that too much for one shop?", next = "orders2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders2 = {
      lines = { { id = "o2_default", text = "It's too much for one man, which is why he teaches, so there'll be more of us. I'd sooner he turned a few away, but he says the city needs it." } },
      choices = {
        { text = "He's right. The city does need it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "He should look after himself first.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lucan = {
      lines = { { id = "l_default", text = "Someone must, because he never says no. Every apprentice who wanders in thinks they're the next archmage, and he gives each one an hour he hasn't got." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Cordell, and this shop is my family's. I sell what Lucan needs and what his students break." } },
    _none = { { id = "tp_none", text = "No idea. Ask Lucan, if you can catch him." } },
  },
}

-- Catherine Leland: fishing supplies on the canals; salty saleswoman, Arnold's fishing partner.
P:NPC {
  key = "catherine_leland", id = TODO_NPC("Catherine Leland"), name = "Catherine Leland", title = "Fishing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "salty" }, values = { "practical", "nature" },
  notices = { "craft" },
  impression = {
    first = "Catherine Leland sells poles and bait on the Stormwind canals beside Arnold Leland, and she swears her prices are the best in the city. She talked about fish the way soldiers talk about old campaigns.",
    third = "{name} met Catherine Leland, who sells fishing supplies on the Stormwind canals.",
  },
  greetings = {
    { id = "g_default", text = "Best deals in all of Stormwind, friend, you won't find better. Browsing, or after something in particular?" },
    { id = "g_back", when = { metBefore = true }, text = "There's my angler again! Did the lakes treat you kindly, or did the big one slip the hook?" },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" }, place = "before",
      text = "You've got the smell of the lake on you, friend, which is the best perfume there is. Need bait?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Catherine Leland. Arnold there teaches the fishing and I sell the poles, the line and the bait, and between us we've fished every water a day's walk from this city." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Your lot fish Loch Modan like it owes you money, and I respect that. You'll want a strong pole, then." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Ask away, friend; the bait keeps better than my temper, and that's saying something." },
      },
      choices = {
        { text = "Let me see your poles.", next = "BUSINESS" },
        { text = "Is there anything in these canals?", next = "canals" },
        { text = "What's the best fish you've caught?", next = "best" },
        { text = "Good day, Catherine.", next = "END" },
      },
    },
    canals = {
      lines = { { id = "c_default", text = "Small fry and old boots, mostly, and the odd fat fish nobody can explain. The children say there are crocolisks down there, but I've fished these canals for years and never seen so much as a tail." } },
      choices = {
        { text = "Are you sure there aren't?", next = "canals2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    canals2 = {
      lines = { { id = "c2_default", text = "Sure enough that I'd still dip my feet, though I won't tell the children that. A bit of fear keeps them away from the edge, and that's no bad thing." } },
      choices = {
        { text = "Better to tell them the truth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A useful story never hurt anyone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "b_default", text = "A longjaw mud snapper out of Crystal Lake, big as my arm, and Arnold still says it was smaller. He was there, so I suppose he'd know, but he's wrong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold tackle on these canals for years, beside Arnold. We fished together long before either of us made a living at it." } },
    _none = { { id = "tp_none", text = "Haven't a clue, friend; I know hooks, line and worms, and not much past the canal wall." } },
  },
}

-- Lisbeth Schneider: clothier at the Canal Tailor and Fit Shop; brisk, sizes people up.
P:NPC {
  key = "lisbeth_schneider", id = TODO_NPC("Lisbeth Schneider"), name = "Lisbeth Schneider", title = "Clothier",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "practical", "community" },
  notices = { "kit" },
  impression = {
    first = "Lisbeth Schneider sells cloth armour in the Canal Tailor and Fit Shop and measured me with her eyes before I'd said a word. She was brisk and good-humoured, and she knew the price of everything on the canals.",
    third = "{name} met Lisbeth Schneider, the clothier of the Canal Tailor and Fit Shop.",
  },
  greetings = {
    { id = "g_default", text = "Come in, friend, and mind the damp. Are you browsing, or do you need something fitted?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I remember your size, you know. I never forget a size." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } }, place = "before",
      text = "Look at the state of your sleeves, friend. Whatever it was, it won, and you'll want something new before you go out again." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lisbeth Schneider. Rema makes, Corbett carries, and I sell the finished pieces off these racks, and I'll fit you properly, which is more than the market stalls will do." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! The Cathedral sends us all its novices, and they come in looking like sacks of flour tied in the middle. Let me find you something that fits." },
      },
      again = {
        { id = "h_again", text = "Something more, friend? I'll keep measuring you while you think of it." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Why does everyone want armour lately?", next = "armour" },
        { text = "What's the canal like to work on?", next = "canal" },
        { text = "Good day, Lisbeth.", next = "END" },
      },
    },
    armour = {
      lines = { { id = "a_default", text = "Because the roads aren't safe from here to Westfall, and even the clerks want a padded vest under their coats. Rema thinks the nobles know something they're not telling us, and I'm starting to agree." } },
      choices = {
        { text = "What do you think they know?", next = "armour2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    armour2 = {
      lines = { { id = "a2_default", text = "That the king isn't coming home soon, and nobody wants to say it aloud. I could be wrong; I sell clothes, not secrets." } },
      choices = {
        { text = "Trust the regent, because he'll keep us safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the nobles hide things, people should demand answers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    canal = {
      lines = { { id = "c_default", text = "Damp, always, and the cloth hates it, so I keep everything on the top racks. But you see the whole city pass by on the bridges, and I wouldn't trade it for a dry shop anywhere else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept the racks at the Canal Tailor and Fit Shop for years, with Rema at her needle behind me." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, I'm afraid, but I can tell you anything about wool and linen." } },
  },
}
