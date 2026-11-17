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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Scholomance, Stratholme, the Spire, and the backs of people who didn't come home, though the Cartel prefers not to ask which. Warriors are my best buyers and my best sellers both, because you lot never stop trading up." } },
      choices = {
        { text = "I'd rather earn my plate than wear a dead man's.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A dead man's plate fits just as well. Show me the cheapest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Grizzlin.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because the Wintersaber Trainers up the valley take it very personally, that's why, and night elves with long memories are bad for business. I sell what comes through the door, but I don't mention it when the Sentinels are in town." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep {pet} off the counter, please, because the last beast that sat there knocked over a whole stack of thorium and the Cartel docked it from my wages." },
      },
      choices = {
        { text = "I don't hunt frostsabers. Some things shouldn't be for sale.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A pelt's a pelt. I'll sell you every frostsaber I skin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every day it costs us, between the blizzards closing the pass and the furbolgs making trouble along the roads. The Cartel prices it all in, of course, so the snow pays its share of every bid. If your spirits could arrange a mild winter, I'd consider that a sound investment." } },
      choices = {
        { text = "For the right cut, I'd ask them for a mild winter.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The spirits can't be bought, Grizzlin, and neither can I.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Tried, plenty of times, and every one of them ended up owing the Cartel more than they took. We've got contracts with folk in Booty Bay who find people for a living, so the smart rogue sells through us and keeps their fingers." } },
      choices = {
        { text = "The Cartel's rules keep trade honest. Fair enough.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules only stop people who aren't clever enough.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll stick to bidding, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Enchanting dusts, mostly, and the odd scroll from somebody's tower. Mostly you buy, which suits me, because a mage who needs runecloth before a raid on Blackrock will pay whatever the board says." } },
      choices = {
        { text = "I'll pay a fair price and nothing more.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll undercut the lot of them and corner the market.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll check the board later.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Coin's the same colour in any hand, friend, and the Cartel keeps the peace better than any treaty, because nobody burns down the auction house they're selling at. Call it greed if you like, but nobody's died in Everlook this year over a banner." } },
      choices = {
        { text = "The Cartel's rules keep the peace. I'll respect them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules bought with gold can be broken with more of it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Honest work, if they're open about the price, which is more than I can say for half the bidders in this room. Horde or Alliance, a priest still needs reagents and a meal, and I've never seen a holy candle sell itself." } },
      choices = {
        { text = "My healing isn't for sale, Grizzlin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Everyone has a price. Mine's just better hidden.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You'll want to see the plate and the blades, I expect, and I've a fine run of them this week, mostly from adventurers who stopped needing them." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Leather and hides, then, and frostsaber pelts, which go for a pretty price in the cities, provided nobody asks where the cat came from." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, welcome to the auction house. Totems sell slowly up here, but if you've anything fire-charged, the cold makes it worth double." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Lovely. Now, before you get any ideas, every item in my vaults is logged, sealed and watched by Cartel bruisers who are much bigger than you." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! You folk buy runecloth like it's going out of style, and I've always got a few stacks in the vaults if your tailor's been slacking." },
        { id = "h_default", key = true,
          text = "Auctioneer Grizzlin, Everlook auction house, Steamwheedle Cartel. Horde and Alliance both bid here, and the Cartel takes its share for keeping the peace, so you pay a bit more, but you sell to twice the buyers." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night in Winterspring and you've come to look at the auction board? Either you're very keen or very cold, and I'll take your coin either way." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! You lot hardly ever sell anything, you just buy linen for bandages, which honestly makes you my favourite customers, because you never haggle." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Bless the auction house if you like; it couldn't hurt the bidding, and Steamwheedle doesn't charge for prayers, yet." },
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
        { text = "Has anyone ever robbed a Steamwheedle auction house?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do mages sell much through the auction house?", next = "xmage", when = { class = "MAGE" } },
        { text = "Doesn't it trouble you, selling to both Horde and Alliance?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do you make of priests who sell their services, Grizzlin?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Where does all that armour come from, Grizzlin?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why wouldn't anyone ask where a frostsaber pelt came from?", next = "xhuntcl", when = { class = "HUNTER" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Cheap steel, friend, folded fast and quenched in a bucket, and the frost gets into it like a bad rumour. I've seen a dwarf's axe snap clean on a Winterfall furbolg's skull, and the furbolg was more surprised than he was." } },
      choices = {
        { text = "Good steel is worth paying for. I won't cut corners.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll buy cheap and loot a better one off a furbolg.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Wixxrak.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It doesn't thicken in the cold, that's what, and I won't tell you what's in it, except that one part comes from the springs and one part I'd rather not say. A rifle that seizes up with a frostsaber charging you is just an expensive club." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And mind {pet} doesn't lick the oil off the barrel, because it'll be sick on the floor of my shop and I'll never hear the end of it from Qia." },
      },
      choices = {
        { text = "A hunter keeps the weapon in order. I'll learn the oil myself.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't care what's in it, so long as the rifle fires.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Everybody who walks the road to the springs, and a few who should've stayed home! The Winterfall come down out of their camps drunk on that firewater and swinging like madmen, so I sell an axe a day and a rifle to anyone who'd rather not get close. I wouldn't expect a shaman to buy a rifle, but there's always a first time." } },
      choices = {
        { text = "Sell them all the rifles they want. Business is business.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The furbolgs are sick, not wicked. Arm against them sparingly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Cheap steel goes brittle in the frost, my friend, and a blade that snaps in a yeti's hide is a short, sad story. Mine are forged in Gadgetzan and oiled with my own mixture, so they keep their temper when you need to keep yours." } },
      choices = {
        { text = "Good steel's worth paying for.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good rogue doesn't need a fancy blade.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll keep that in mind.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "When the yeti's in your face and your mana's gone, you'll want something sharp in your hand, trust me on that. I've sold more daggers to robed folk than to rogues this winter, and not one of them complained." } },
      choices = {
        { text = "Fair point. Every fighter needs a backup.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll freeze the yeti first. No dagger needed.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll consider it.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Anyone who pays and doesn't start trouble inside Everlook, and the Bruisers see to the second part. A blade's just steel, friend, and it's the hand holding it that does good or evil, which I'd think a paladin would agree with." } },
      choices = {
        { text = "A merchant shares the guilt of every blade he sells.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Agreed. Steel is steel, and the wielder answers for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "More than you'd think, especially the Forsaken ones, who say a bullet saves mana. I don't judge, I just oil the barrels so they fire in the cold, and the yetis out there don't much care whose prayers come after." } },
      choices = {
        { text = "I'd rather mend wounds than make them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A bullet's a fine prayer for a yeti.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Now you're my sort of customer, and I'll tell you straight that half the swords in Kalimdor go brittle at forty below, but not mine." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You'll want a rifle that fires in the snow, and I've got just the thing, with a lock that won't freeze and an oil I mix myself." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Now, I know your lot like a good mace or axe, and I've got ones that hold an edge even when your fingers won't." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You want something light, sharp and quiet, and I've got daggers that'll hold an edge at forty below, which is more than the dwarves can promise." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! I don't sell staves, sorry, but I've got wands on order and a very nice dagger that a spellcaster can carry without hurting themselves." },
        { id = "h_default", key = true,
          text = "Wixxrak, weaponsmith and gunsmith to everybody who comes through Everlook. Swords, axes, rifles and enough shot to keep you busy all winter, which in Winterspring is the whole year." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Now there's a customer who appreciates a good hammer, and I've got maces that won't go brittle in the cold, which you'd be surprised how many smiths can't say." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, eh? Most of your kind buy a mace and nothing else, but I'll sell you a rifle too, if your prayers ever need a little extra reach." },
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
        { text = "Why would cold weather ruin a dagger?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do mages really need a dagger?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you sell weapons to anyone who pays, Wixxrak?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do priests ever buy your guns, Wixxrak?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would a sword go brittle in the cold, Wixxrak?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What's so special about your gun oil?", next = "xhuntcl", when = { class = "HUNTER" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The sweat does, and then the cold freezes it, and then it thaws by the fire at Vizzie's and does it all again. Every warrior who comes through Everlook smells of it, and I sell more heavy thread to your kind than to the tailors." } },
      choices = {
        { text = "I'll mend it properly myself. A warrior keeps the kit in order.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll wear it till it falls apart and find new off a corpse.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Qia.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Frostsaber and chimaera, though the chimaera's tough enough to break a needle, and the bear pelts from the shardtooths. The tailors want felcloth more, but the leatherworkers will pay well for anything thick enough to keep the wind out." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And if {pet} drags in anything with fur on it, I won't ask whose it was, only how fresh." },
      },
      choices = {
        { text = "I'll skin only what I kill cleanly, and waste none of it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll strip every beast in the valley if the price is right.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Twice a winter at least, and every crafter in town learns to count their thread when it happens. The pass down to Felwood closes, the tunnels through Timbermaw Hold stay open only so long as the furbolgs like us, and then it's just whatever's on my shelves. Your spirits would make a fortune up here, if they could shovel." } },
      choices = {
        { text = "Then keep good stores, and keep faith with the Timbermaw.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules mean little in a blizzard. Take what you need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Off the satyrs and the fel-touched things in Felwood and Azshara, cut from their robes by people braver than me. Tailors want it for the strongest garments, and it smells of brimstone however much you wash it, so I keep it in the back." } },
      choices = {
        { text = "I won't wear anything stitched from fel.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power, whatever it smells like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll stick with runecloth.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A few, and they're my best customers for felcloth and soul pouches both. I don't ask what goes in the pouches, because I'd rather not know, but I do ask them to pay before they open the box." } },
      choices = {
        { text = "Wise. Some things are best left unasked.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should know what you're selling, and to whom.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take a look at the stock.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every one that passes through, Horde or Alliance, since the cold eats a robe faster than any battle does. A troll priest bought rune thread from me last month and told me her loa liked a neat hem, and I've thought better of the loa ever since." } },
      choices = {
        { text = "A neat robe shows a disciplined mind.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My robes go ragged, and the loa don't mind.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You'll be after heavy thread to mend the padding under that armour, I expect, because the frost rots it faster than you'd think." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You'll be selling me hides, I hope, because rugged leather fetches a fair price here, and the skinners in town are always short." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll want leather and heavy thread, I expect, because nothing you carry survives a Winterspring winter without mending." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! You're wearing cloth in Winterspring, so I'll assume you either have a spell for the cold or you're mad, and I sell felcloth to both kinds." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! You'll be wanting felcloth, I expect, since your lot never want anything else. I keep it in the back so it doesn't stink up the thread." },
        { id = "h_default", key = true,
          text = "Qia, trade supplies, right here beside the bank and the auction house. Every crafter in Everlook buys from me sooner or later, because the next shop with thread is a long, cold walk away." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! You'll be after thread for your robes, I expect, because nothing tears a robe faster than a Winterspring wind." },
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
        { text = "Where does felcloth even come from?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do many warlocks buy from you?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do priests often come to you for robe cloth, Qia?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the cold really rot the padding under armour?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What hides sell best in Everlook, Qia?", next = "xhuntcl", when = { class = "HUNTER" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because warriors shout, friend, it's in the training, and every time one of you bellows a war cry by the gate, my bears wake up and my cats go under the hay. A beast that's frightened in the stable is a beast that bites its own hunter later." } },
      choices = {
        { text = "Fair enough. A warrior can keep the temper off the battlefield.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A beast that can't stand a shout won't last in Winterspring.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Azzleby.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The wild ones do better than you'd think, with fur thicker than a goblin's purse and the hot springs to drink from when everything else freezes. It's the ones that wander too near the Winterfall camps that worry me, because some of them come back wrong somehow. I don't know what's poisoning them, but I'd thank any shaman who found out." } },
      choices = {
        { text = "I'll look into it. The beasts deserve that much.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sick beasts are weak beasts. Better they're culled.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A pet loves its hunter, and you can see it in the way it waits by my gate. Your demon serves you because it must, and every beast in my stable knows the difference the moment it smells one." } },
      choices = {
        { text = "You're right. A beast's loyalty is the honest kind.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear works just as well as love.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep my demon away from the bears.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only until it turns back into an angry dwarf in the middle of the night, and I learned that one the hard way. No, I'll stick with hunters' pets, which are what they look like and stay that way." } },
      choices = {
        { text = "Fair. A sheep's no proper pet.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Polymorph's a fine joke. You should laugh more.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll keep my sheep elsewhere.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Some do, the ones from the Barrens and the jungles, who were never meant for snow. I keep them warm and fed, and the frostsabers sniff at their stalls like they're laughing at them, which I suppose they are." } },
      choices = {
        { text = "Then I'll bless the ones from the warm lands.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast that can't stand the cold shouldn't be here.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You've no beast to stable, I expect, unless you count the bear-sized grudge you're carrying, so I'll just ask you to keep your voice down near the stalls." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The beasts in my stable perk up when your kind come by, so stand near the stalls as long as you like and warm them up a bit." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock. I board beasts, friend, not demons, so don't ask me to stable your voidwalker, because the last one frightened my bears so badly they wouldn't eat." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. I suppose you've no beast to stable, unless you count the sheep you turn people into, and I don't board those either." },
        { id = "h_default", key = true,
          text = "Azzleby, stable master, right by the gate so the hunters don't have to drag their beasts all the way through town. I board pets for anyone who's tamed one, and I keep them warmer than the inn keeps its guests." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. I don't get many of you at the stables unless a pet's ailing, so if you've a blessing to spare, the beasts in the back need it more than the folk in the inn." },
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
        { text = "Is a demon really so different from a pet?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Would a polymorphed sheep be welcome in your stables?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the beasts in your stable suffer the cold, Azzleby?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why keep my voice down near the stalls?", next = "xwarcl", when = { class = "WARRIOR" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, more than anyone, because you're the ones standing in front when the Winterfall come swinging. I brew mine with a pinch of icecap, which keeps them clear in the cold, and I'd like to think one of my bottles has saved a warrior or two." } },
      choices = {
        { text = "I'd rather trust my shield and my training than a bottle.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Give me the strongest you've got. I'll drink anything in a fight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Evie.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I'd buy anything clean, because the herbs up here are pure as the snow, mostly, and pure herbs make clear potions. Don't bring me anything from near the Winterfall camps, though, because whatever's in their firewater has got into the roots there too, I'm sure of it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And mind {pet} doesn't eat the icecap, because it numbs the tongue something awful, and I once watched a wolf walk in circles for an hour." },
      },
      choices = {
        { text = "I'll gather only where the land is clean. Your potions deserve that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll bring whatever I find. Your customers won't know the difference.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Oh, I'd love to know, and I've bottled that water three times to find out! It stays warm for an hour and then it's just water, which means either there's nothing in it or it only works where the earth wants it to. Donova Snowden would call it science, and you'd call it spirits, and I'd say you both owe me a vial." } },
      choices = {
        { text = "Keep bottling it. If it works, sell it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The springs' gift should stay at the springs.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not me, love, I sell what poisons go into, and what they're carried in, and I leave the brewing to you. The rogues' masters in the cities sell the real recipes, so ask them, and come back to me when your vials run out." } },
      choices = {
        { text = "Poison's a fair tool. Steel's no kinder.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I use poison sparingly. It's not an honest fight.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll be back for the vials.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Here and there, in the coldest corners, and it's worth a fortune to any alchemist who can find it. They say it makes flasks fit for the strongest fights, but I've never tried, because I'd rather sell it than drink it." } },
      choices = {
        { text = "Better to sell it to someone who'll put it to use.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd keep it all and brew the flasks myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll keep an eye out for it.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Near enough, from where I'm standing, because a wound's closed either way, but a potion doesn't care who drinks it and I'm told the Light's a bit pickier. Then again, a potion can't comfort anyone, so I suppose you've got me there." } },
      choices = {
        { text = "The Light is for everyone. It only asks a willing heart.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A potion that works for anyone sounds more reliable.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Well, it glows a little, and it keeps its cold even in a warm hand, so it's either holy or very stubborn. A troll priest told me once that every herb has a little loa in it, and I can't prove her wrong, so I've started thanking mine." } },
      choices = {
        { text = "Thank them, then. Respect keeps the world in balance.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Herbs are herbs. Grind them and stop wondering.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You'll want healing potions, lots of them, because your kind drink them like Himmik's soup, and I've a fresh batch packed in straw." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You'll know where the icecap grows, I bet, and the mountain silversage, because you're always out tracking things across the hills." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! I've no totems to sell, but I've vials aplenty for your water spirits, packed in straw so they won't crack in this cold." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You'll want crystal vials for your poisons, I'll bet, and I've got the good ones that don't crack in the cold, packed snug in straw." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Can you tell me whether black lotus has any arcane use? Nobody up here has given me a straight answer, and I'd love to know before I sell my last one." },
        { id = "h_default", key = true,
          text = "Evie Whirlbrew, alchemy supplies, the only shop in Everlook where the bottles are packed in straw. Vials, a recipe or two and the odd potion for anyone who doesn't have the patience to brew their own." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! You won't want healing potions, will you, not with the real thing in your hands, and here's me with all my bottles packed in straw." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I've always wondered whether a potion and a prayer are cousins, because icecap from these hills feels half holy when you cut it fresh." },
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
        { text = "Do you sell poisons too?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Black lotus grows in Winterspring?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you think potions and prayer do the same work?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you really think icecap is half holy, Evie?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do warriors really drink that many potions, Evie?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Would you buy herbs a hunter finds in the wild?", next = "xhuntcl", when = { class = "HUNTER" } },
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
