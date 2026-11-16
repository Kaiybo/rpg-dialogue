-- Everlook's shopkeepers (0.39.0): the auction house, the weapon seller, the trade goods counter,
-- the stables by the gate and the alchemy stall. Voice: bibles/winterspring.md ("Everlook's shopkeepers")
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "grizzlin", id = TODO_NPC("Auctioneer Grizzlin"), name = "Auctioneer Grizzlin",
  bible = "bibles/winterspring.md", role = "auctioneer", tier = "service",
  communities = { "everlook" }, temper = { "brisk" }, values = { "profit" },
  notices = { "purse" },

  impression = {
    first = "Auctioneer Grizzlin runs Everlook's auction house with gloves on and an ear for every bid. Grizzlin sells to Horde and Alliance alike and finds the cold good for business, since nobody lingers to haggle.",
    third = "{name} met Auctioneer Grizzlin, who runs the neutral auction house in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Shut the door behind you, friend, the heat's worth more than half the lots on the board. Now, buying or selling?" },
  },

  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Light purse, eh? Then sell before you buy, friend, because in Everlook the selling's the easy part and the buying will cost you." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every day it costs us, between the blizzards closing the pass and the furbolgs making trouble along the roads. The Cartel prices it all in, of course, so the snow pays its share of every bid. If your spirits could arrange a mild winter, I'd consider that a sound investment." } },
      choices = {
        { text = "For the right cut, I'd ask them for a mild winter.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The spirits can't be bought, Grizzlin, and neither can I.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, welcome to the auction house. Totems sell slowly up here, but if you've anything fire-charged, the cold makes it worth double." },
        { id = "h_default", key = true,
          text = "Auctioneer Grizzlin, Everlook auction house, Steamwheedle Cartel. Horde and Alliance both bid here, and the Cartel takes its share for keeping the peace, so you pay a bit more, but you sell to twice the buyers." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night in Winterspring and you've come to look at the auction board? Either you're very keen or very cold, and I'll take your coin either way." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, the brazier's going out." },
        { id = "h_again2", text = "Still here? Then you might as well bid on something." },
      },
      choices = {
        { text = "Does the land up here ever cost the Cartel, Grizzlin?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Let me see the auctions.", next = "BUSINESS" },
        { text = "What sells well up here?", next = "sells" },
        { text = "Why put an auction house in the snow?", next = "why" },
        { text = "Goodbye.", next = "END" },
      },
    },
    sells = {
      lines = { { id = "s_default", text = "Runecloth and thorium, because everybody's making something warm or something sharp. Frostsaber pelts go well too, and so does anything off a Winterfall furbolg, though I never ask the seller how they came by it." } },
      choices = {
        { text = "Do the Winterfall bother Everlook?", next = "sells_furbolg" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_furbolg = {
      lines = { { id = "sf_default", text = "They've got meaner lately, and nobody can agree on why. Ask Donova Snowden by the hot springs, because she spends more time watching them than anybody I know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    why = {
      lines = { { id = "w_default", text = "Because everyone who comes through Winterspring comes through Everlook, and everyone who comes through Everlook has something to sell. The cold keeps the fruit fresh and the bandits lazy, and both of those are good for business." } },
      choices = {
        { text = "A town that welcomes both sides is a good thing.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Goblins would sell to anyone, that's all.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I go where the Cartel sends me, and the Cartel sent me somewhere cold. That's all the story you'll get without a bid." } },
    advice = { { id = "tp_ad", text = "List your runecloth in stacks, friend, because single bolts sit on the board for days." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel built Everlook, guards Everlook and takes a share of everything sold in Everlook. That's how a town stays neutral." } },
    _none = { { id = "tp_none", text = "If I can't list it, I can't tell you about it." } },
  },
}

P:NPC {
  key = "wixxrak", id = TODO_NPC("Wixxrak"), name = "Wixxrak", title = "Weaponsmith & Gunsmith",
  bible = "bibles/winterspring.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "eager" }, values = { "profit", "craft" },
  notices = { "class" },

  impression = {
    first = "Wixxrak sells blades and guns in Everlook and swears every one of them works in the cold, which is apparently a real concern. He takes more pride in his gun oil than seems reasonable.",
    third = "{name} met Wixxrak, who sells weapons and guns in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Blades, guns, shot and powder, all of it kept warm! Cold steel's a saying, friend, not a selling point." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Let me guess: your gun froze up on the road from Felwood, and you're here for proper oil. Everybody's does, sooner or later." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "That blade's seen some furbolgs, I can tell from the nicks. Come and look at something that's seen fewer." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Everybody who walks the road to the springs, and a few who should've stayed home! The Winterfall come down out of their camps drunk on that firewater and swinging like madmen, so I sell an axe a day and a rifle to anyone who'd rather not get close. I wouldn't expect a shaman to buy a rifle, but there's always a first time." } },
      choices = {
        { text = "Sell them all the rifles they want. Business is business.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The furbolgs are sick, not wicked. Arm against them sparingly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Now, I know your lot like a good mace or axe, and I've got ones that hold an edge even when your fingers won't." },
        { id = "h_default", key = true,
          text = "Wixxrak, weaponsmith and gunsmith to everybody who comes through Everlook. Swords, axes, rifles and enough shot to keep you busy all winter, which in Winterspring is the whole year." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you about, before I go back to telling you what to buy?" },
        { id = "h_again2", text = "Go on, friend, ask, and I'll keep polishing." },
      },
      choices = {
        { text = "Who in Winterspring arms against the Winterfall furbolgs?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Does the cold really hurt a gun?", next = "cold" },
        { text = "Who buys weapons up here?", next = "buyers" },
        { text = "Goodbye.", next = "END" },
      },
    },
    cold = {
      lines = { { id = "c_default", text = "It thickens the oil and cracks the stock, and then your shot goes wide at the worst possible moment. I keep my stock by the stove and oil it with something I mix myself, and I'm not saying what's in it." } },
      choices = {
        { text = "Go on, what's in it?", next = "cold_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold_secret = {
      lines = { { id = "cs_default", text = "Nice try, friend. I'll tell you it doesn't freeze, and that it smells terrible, and that's all a customer needs to know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Hunters chasing frostsabers and chimaeras, and folk heading into the Winterfall dens, and the odd fool who thinks he'll go up Mazthoril alone. I sell to all of them, and I hope to see most of them again." } },
      choices = {
        { text = "You'd sell a gun to anyone?", next = "buyers_anyone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_anyone = {
      lines = { { id = "ba_default", text = "To anyone with coin who isn't fighting inside Everlook, because the Bruisers see to that part. What they do with it outside the gate is between them and their consciences." } },
      choices = {
        { text = "Fair enough. A weapon's just a tool.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A merchant should care who he arms.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've sold guns in warmer places, and I'll sell them in warmer places again, but right now the money's in the snow." } },
    advice = { { id = "tp_ad", text = "Keep your powder inside your coat, friend, next to your chest, where it stays dry." } },
    _none = { { id = "tp_none", text = "If it doesn't fire or cut, I've no idea." } },
  },
}

P:NPC {
  key = "qia", id = TODO_NPC("Qia"), name = "Qia", title = "Trade Supplies",
  bible = "bibles/winterspring.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "dry" }, values = { "profit", "careful" },
  notices = { "craft" },

  impression = {
    first = "Qia sells trade supplies in Everlook from the building that holds the bank, and she knows to the copper what every tailor in town is short of. She treats thread as a serious matter, and she's probably right.",
    third = "{name} met Qia, who sells trade supplies in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Thread, vials, spices and flux, and a few patterns for anyone who can read them. What are you making?" },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! You'll want rune thread, then, and I've some, though not much, so don't tell the others in town." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Twice a winter at least, and every crafter in town learns to count their thread when it happens. The pass down to Felwood closes, the tunnels through Timbermaw Hold stay open only so long as the furbolgs like us, and then it's just whatever's on my shelves. Your spirits would make a fortune up here, if they could shovel." } },
      choices = {
        { text = "Then keep good stores, and keep faith with the Timbermaw.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules mean little in a blizzard. Take what you need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll want leather and heavy thread, I expect, because nothing you carry survives a Winterspring winter without mending." },
        { id = "h_default", key = true,
          text = "Qia, trade supplies, right here beside the bank and the auction house. Every crafter in Everlook buys from me sooner or later, because the next shop with thread is a long, cold walk away." },
      },
      again = {
        { id = "h_again", text = "Anything else, or have I sold you enough thread for one day?" },
        { id = "h_again2", text = "Still thinking? Take your time, the shop's warm." },
      },
      choices = {
        { text = "Do the storms up here ever cut Everlook off, Qia?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What do crafters here need most?", next = "needs" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "Goodbye.", next = "END" },
      },
    },
    needs = {
      lines = { { id = "n_default", text = "Thread, for sewing runecloth into something warm enough to wear outdoors. After that it's vials for the alchemists and flux for the smiths, and spices for anyone who's sick of eating plain chimaera." } },
      choices = {
        { text = "People eat chimaera?", next = "needs_chimaera" },
        { text = "Something else.", next = "BACK" },
      },
    },
    needs_chimaera = {
      lines = { { id = "nc_default", text = "People eat anything when it's cold enough, friend. Himmik sells food and drink here in town, and he'll sell you worse, though I'd bring your own spices either way." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    stock = {
      lines = { { id = "s_default", text = "Through the Timbermaw tunnel from Felwood, mostly, when the furbolgs there are in a mood to let a goblin pass. When they aren't, prices go up and I don't apologise for it." } },
      choices = {
        { text = "Raising prices when people are desperate seems unfair.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "That's just good business.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sell supplies. I've always sold supplies, and I expect I'll be selling them when the snow finally melts." } },
    advice = { { id = "tp_ad", text = "Buy thread before you need it, because nobody likes running out halfway through a cloak." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, and I don't stock it either." } },
  },
}

P:NPC {
  key = "azzleby", id = TODO_NPC("Azzleby"), name = "Azzleby", title = "Stable Master",
  bible = "bibles/winterspring.md", role = "stablemaster", tier = "service",
  communities = { "everlook" }, temper = { "cheerful" }, values = { "kind" },
  notices = { "pet" },

  impression = {
    first = "Azzleby keeps the stables by Everlook's gate, where the animals sleep warmer than most of the travelers. He seems to like the beasts far more than their owners, and he doesn't hide it.",
    third = "{name} met Azzleby, the goblin stable master by Everlook's gate.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in, but shut the gate! The beasts have the only warm straw in Winterspring and I mean to keep it that way." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Look at your {pet}, shivering! Bring it here a minute, the stove's lit, and it's earned a warm-up even if you haven't." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The wild ones do better than you'd think, with fur thicker than a goblin's purse and the hot springs to drink from when everything else freezes. It's the ones that wander too near the Winterfall camps that worry me, because some of them come back wrong somehow. I don't know what's poisoning them, but I'd thank any shaman who found out." } },
      choices = {
        { text = "I'll look into it. The beasts deserve that much.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sick beasts are weak beasts. Better they're culled.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The beasts in my stable perk up when your kind come by, so stand near the stalls as long as you like and warm them up a bit." },
        { id = "h_default", key = true,
          text = "Azzleby, stable master, right by the gate so the hunters don't have to drag their beasts all the way through town. I board pets for anyone who's tamed one, and I keep them warmer than the inn keeps its guests." },
      },
      again = {
        { id = "h_again", text = "Anything else? There's a bear back there that wants its dinner." },
        { id = "h_again2", text = "Go on, I've time; the animals are all asleep." },
      },
      choices = {
        { text = "Do the wild beasts of Winterspring fare well, Azzleby?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'd like to see my stabled pets.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you keep them warm up here?", next = "warm" },
        { text = "Do hunters tame much in Winterspring?", next = "tame" },
        { text = "Goodbye.", next = "END" },
      },
    },
    warm = {
      lines = { { id = "w_default", text = "Straw, blankets, a stove I never let go out, and a lot of hay hauled in at a terrible price. Some of the beasts from the south never quite get used to it, so they sleep closest to the fire." } },
      choices = {
        { text = "That's kind of you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sounds like a waste of good coin.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame = {
      lines = { { id = "t_default", text = "Frostsabers, mostly, the white cats, and the odd bear from the woods. A frostsaber's a beautiful animal, but it sulks if you board it with a wolf, so I keep them apart." },
        { id = "t_nelf", when = { race = "NightElf" }, text = "Frostsabers, mostly, and you'd know more about those cats than I would, being a night elf. They sulk if you board them beside a wolf, so I keep them well apart." } },
      choices = {
        { text = "Why do they sulk?", next = "tame_sulk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame_sulk = {
      lines = { { id = "ts_default", text = "Cats think they own the place, and wolves think the same, and neither of them is right, since I own the place. A little distance keeps everyone from finding that out the hard way." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I like animals more than I like people, and the Cartel was kind enough to give me a job where that counts as a skill." } },
    advice = { { id = "tp_ad", text = "Feed your pet before a long walk in the snow, because it burns food faster than you do." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask me about a beast and I'll talk your ear off." } },
  },
}

P:NPC {
  key = "evie", id = TODO_NPC("Evie Whirlbrew"), name = "Evie Whirlbrew", title = "Alchemy Supplies",
  bible = "bibles/winterspring.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "eager" }, values = { "craft", "profit" },
  notices = { "craft" },

  impression = {
    first = "Evie Whirlbrew sells alchemy supplies in Everlook and keeps her bottles packed in straw so the cold won't crack them. She seems delighted by every herb that grows in the snow.",
    third = "{name} met Evie Whirlbrew, who sells alchemy supplies in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Careful with the shelf, those vials are cold and brittle! Now, what are you brewing?" },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Your fingers are stained green, so you're one of us! Have you tried brewing with something that grows in the snow yet? It's not like anything down south." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Oh, I'd love to know, and I've bottled that water three times to find out! It stays warm for an hour and then it's just water, which means either there's nothing in it or it only works where the earth wants it to. Donova Snowden would call it science, and you'd call it spirits, and I'd say you both owe me a vial." } },
      choices = {
        { text = "Keep bottling it. If it works, sell it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The springs' gift should stay at the springs.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! I've no totems to sell, but I've vials aplenty for your water spirits, packed in straw so they won't crack in this cold." },
        { id = "h_default", key = true,
          text = "Evie Whirlbrew, alchemy supplies, the only shop in Everlook where the bottles are packed in straw. Vials, a recipe or two and the odd potion for anyone who doesn't have the patience to brew their own." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a pot on the boil." },
        { id = "h_again2", text = "Go on, ask me something; I love talking about this." },
      },
      choices = {
        { text = "Do the hot springs here hold any power, Evie?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Why pack everything in straw?", next = "straw" },
        { text = "What grows in Winterspring worth brewing?", next = "herbs" },
        { text = "Goodbye.", next = "END" },
      },
    },
    straw = {
      lines = { { id = "s_default", text = "Because cold glass cracks if you so much as breathe on it, and I lost a whole crate my first week. Now I keep it all in straw by the stove, and I've only lost two vials since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    herbs = {
      lines = { { id = "h2_default", text = "Mountain silversage up in the high places, and some very interesting things around the hot springs, where the snow melts. Herbalists come back from Frostfire with their packs full and their boots soaking." } },
      choices = {
        { text = "Are the hot springs dangerous?", next = "herbs_springs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_springs = {
      lines = { { id = "hs_default", text = "The water won't hurt you, but the Winterfall furbolgs who roam that valley might. A clever herbalist picks fast and leaves before the furbolgs notice, and a brave one picks slowly and fights them." } },
      choices = {
        { text = "I'd pick slowly. Let them come.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fast and quiet is smarter.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I mix potions and I sell what other people need to mix theirs. The snow is new to me, but the bubbling isn't." } },
    advice = { { id = "tp_ad", text = "Keep your potions inside your coat in Winterspring, because a frozen potion is just a cold rock." } },
    _none = { { id = "tp_none", text = "Oh, I don't know about that, but I'd love to know if it can go in a potion." } },
  },
}
