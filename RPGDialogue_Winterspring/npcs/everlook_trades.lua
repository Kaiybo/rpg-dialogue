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
    first = "The cold is good for business, since nobody lingers to haggle.",
    third = "{name} met Auctioneer Grizzlin, who runs the neutral auction house in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Shut the door behind you, friend, shut it, because the heat costs more than most of the lots on the board and I'm not billing the snow. Now, buying or selling?" },
  },

  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Light purse, eh, chum? Then sell before you buy, because in Everlook the selling's the easy part and the buying will cost you, plus the Cartel's cut." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because it comes out of Felwood's satyrs and the Shadow Council's lot at Jaedenar, and nobody likes fetching it. Tailors want it, warlocks want it, and the fellows who bring it want danger money, so the bidding gets hot even when the weather doesn't." } },
      choices = {
        { text = "I'll fetch my own felcloth before I pay those prices.", next = "BACK", reply = "Go right ahead, pal, and while you're in Jaedenar, bring me back a spare bolt or two on consignment. Half the felcloth in this house came from folks who said exactly that.", fx = { align = { order = 1 } } },
        { text = "Then I'll buy it all and sell it back at twice the price.", next = "BACK", reply = "Ha! Now you're thinkin' like a trade prince, friend, and I'll take my listing fee on every bolt both ways. The house always wins, see, that's the beauty of it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I sell whatever comes through the door with a fair reserve on it, friend, and I don't check the pedigree. Steamwheedle's neutral, which means a hammer is just a hammer here, whoever swung it last and whatever they believed while they did." } },
      choices = {
        { text = "A weapon's history matters. I'll not buy a fanatic's hammer.", next = "BACK", reply = "Suit yourself, friend, and somebody less picky will walk out with a fine hammer at a fine price. Conscience is a luxury item, and I don't stock it.", fx = { align = { honor = 1 } } },
        { text = "Good steel is good steel. I'll bid on it.", next = "BACK", reply = "That's the spirit, and the reserve is reasonable, I promise you. Whatever it smashed before, it's your hammer now, and nobody's asking.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Scholomance, Stratholme, the Spire, and the backs of people who didn't come home, though the Cartel prefers not to ask which. Warriors are my best buyers and my best sellers both, because you lot never stop trading up." } },
      choices = {
        { text = "I'd rather earn my plate than wear a dead man's.", next = "BACK", reply = "Noble of you, pal, and the Spire will gladly give you the chance to earn it. Just remember the fella who wore it last probably said the same thing on his way up.", fx = { align = { honor = 1 } } },
        { text = "A dead man's plate fits just as well. Show me the cheapest.", next = "BACK", reply = "Now that's a customer I like, practical and cold-blooded, and the dead fella doesn't need it. Bottom shelf, left side, and don't mind the dent in the chest.", fx = { align = { honor = -1 } } },
        { text = "Something else, Grizzlin.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because the Wintersaber Trainers up the valley take it very personally, that's why, and night elves with long memories are bad for business. I sell what comes through the door, but I don't mention it when the Sentinels are in town." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because the Wintersaber Trainers up the valley take it very personally, and night elves with long memories are bad for business. And keep {pet} off the counter, please, because the last beast that sat there knocked over a stack of thorium." },
      },
      choices = {
        { text = "I don't hunt frostsabers. Some things shouldn't be for sale.", next = "BACK", reply = "Fine by me, friend, it saves me a talk with the Wintersaber Trainers. One less pelt is one less angry night elf at my counter.", fx = { align = { honor = 1 } } },
        { text = "A pelt's a pelt. I'll sell you every frostsaber I skin.", next = "BACK", reply = "Whoa, whoa, not through my house, pal, I've got enough trouble with those trainers already. Take 'em to some fence down in Gadgetzan, where the elves don't shop.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every day it costs us, between the blizzards closing the pass and the furbolgs making trouble along the roads. The Cartel prices it all in, of course, so the snow pays its share of every bid. If your spirits could arrange a mild winter, I'd consider that a sound investment." } },
      choices = {
        { text = "For the right cut, I'd ask them for a mild winter.", next = "BACK", reply = "Ha! If you can swing that, pal, I'll take a cut of the thaw and call you a partner. A mild winter would save the Cartel a fortune in shovels.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The spirits can't be bought, Grizzlin, and neither can I.", next = "BACK", reply = "No offence meant, friend, and none taken, I hope. Everybody's got a price except the honest ones, and I've learned to stay out of their way.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Tried, plenty of times, pal, and every one of 'em ended up owing the Cartel more than they took, with interest. We've got contracts with folk in Booty Bay who find people for a living, so the smart rogue sells through us and keeps their fingers." } },
      choices = {
        { text = "The Cartel's rules keep trade honest. I'll sell through them.", next = "BACK", reply = "Smart, pal, very smart, and the Cartel thanks you for your business. Those listing fees keep the bruisers fed, and the bruisers keep you breathing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules only stop people who aren't clever enough.", next = "BACK", reply = "Sure, and I've got a whole drawer of IOUs from clever people, pal, most of 'em signed in a very shaky hand. Try it, and you'll meet our friends from Booty Bay.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll stick to bidding, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Enchanting dusts, mostly, and the odd scroll from somebody's tower. Mostly you buy, which suits me, because a mage who needs runecloth before a raid on Blackrock will pay whatever the board says." } },
      choices = {
        { text = "I'll pay a fair price and nothing more.", next = "BACK", reply = "A fair price is all I ask, friend, plus the listing fee, plus a little consideration for the house. You'll find we're very fair about our unfairness.", fx = { align = { order = 1 } } },
        { text = "I'll undercut the lot of them and corner the market.", next = "BACK", reply = "Ha! You and every apprentice from Dalaran, pal, and they all paid me listing fees while they tried. Corner what you like, the house still gets its cut.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll check the board later.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Coin's the same colour in any hand, friend, and the Cartel keeps the peace better than any treaty, because nobody burns down the auction house they're selling at. Call it greed if you like, but nobody's died in Everlook this year over a banner." } },
      choices = {
        { text = "The Cartel's rules keep the peace. I'll respect them.", next = "BACK", reply = "You've got sense, friend, and sense is good for business. Nobody's ever started a war in an auction house, and I mean to keep it that way.", fx = { align = { order = 1 } } },
        { text = "Rules bought with gold can be broken with more of it.", next = "BACK", reply = "True enough, pal, but nobody's had enough gold yet, and the Cartel's got plenty more. You're welcome to try outbidding a trade prince, and I'll take the listing fee.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Honest work, if they're open about the price, and that's a higher bar than most of the bidders in this room can clear. Horde or Alliance, a priest still needs reagents and a meal, and I've never seen a holy candle sell itself." } },
      choices = {
        { text = "My healing isn't for sale, Grizzlin.", next = "BACK", reply = "Admirable, friend, truly admirable, and I won't try to sell you on it. Just don't knock the bidders who do, because they keep the lights on.", fx = { align = { honor = 1 } } },
        { text = "Everyone has a price. Mine's just better hidden.", next = "BACK", reply = "Ha! Now there's a priest I could do business with, friend. Hidden prices are the best kind, the mark never sees 'em coming.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Cartel doesn't ask where things come from, druid, that's how we keep the peace. If a hunter brings me pelts, I sell 'em, and if your Circle wants fewer pelts on the market, it can come and outbid the buyers. That's not cruelty, it's business, and business is the only law in Everlook." } },
      choices = {
        { text = "Business without conscience is still cruelty, Grizzlin.", next = "BACK", reply = "Maybe so, druid, but cruelty's not on the ledger, so I can't price it. Bring the Circle round with a better offer and I'll listen, I promise.", fx = { align = { light = 1 } } },
        { text = "The Cartel keeps the peace up here. I'll take that trade.", next = "BACK", reply = "Smart folks, you druids, when you want to be. Peace is the best product the Cartel's got, and it's the only one I can't put up for auction.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Never mind the pelts.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! You'll be after felcloth, I'll wager, and so is half of Everlook, so if you want it, bid early and bid high, pal, because the prices only go one way and it ain't down." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Now, you'll be wanting a fine warhammer, I expect, and I've got three on the block, though one of them came from a Scarlet fella and I'd not ask too many questions about him." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You'll want to see the plate and the blades, I expect, and I've a fine run of 'em this week, mostly from adventurers who stopped needing 'em, so the estate sales are booming." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Leather and hides, then, and frostsaber pelts, which go for a pretty price in the cities, provided nobody asks where the cat came from." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, welcome to the auction house. Totems sell slowly up here, but if you've anything fire-charged, the cold makes it worth double." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue? Lovely. Now, before you get any ideas, every item in my vaults is logged, sealed and watched by Cartel bruisers who are much bigger than you." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! You folk buy runecloth like it's going out of style, and I've always got a few stacks in the vaults if your tailor's been slacking." },
        { id = "h_default", key = true,
          text = "Auctioneer Grizzlin, Everlook auction house, Steamwheedle Cartel. Horde and Alliance both bid here, pal, and the Cartel takes its cut for keeping the peace, so you pay a bit more, but you sell to twice the buyers, and that's just good arithmetic." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night in Winterspring and you've come to look at the auction board? Either you're very keen or very cold, and I'll take your coin either way." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! You lot hardly ever sell anything, you just buy linen for bandages, which makes you my favourite customers, because you never haggle." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Bless the auction house if you like; it couldn't hurt the bidding, and Steamwheedle doesn't charge for prayers, yet." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Do you know how many Winterspring frostsabre pelts go across this counter every week? You'd better not, because you'd want to lecture me about it." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, pal, because the brazier's going out and coal ain't free." },
        { id = "h_again2", text = "Still here? Then you might as well bid on somethin', friend, because loitering's the one thing in Everlook that doesn't turn a profit." },
      },
      choices = {
        { text = "Does the land up here ever cost the Cartel, Grizzlin?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Let me see the auctions.", next = "BUSINESS" },
        { text = "Something must sell well up here.", next = "sells" },
        { text = "Why put an auction house in the snow?", next = "why" },
        { text = "Someone must have tried robbing a Steamwheedle auction house.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do mages sell much through the auction house?", next = "xmage", when = { class = "MAGE" } },
        { text = "Doesn't it trouble you, selling to both Horde and Alliance?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Priests selling their services must seem odd to you, Grizzlin.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Where does all that armour come from, Grizzlin?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why wouldn't anyone ask where a frostsaber pelt came from?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you ever turn away goods taken cruelly?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you sell gear taken from the Scarlet Crusade, Grizzlin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why is felcloth so dear in Everlook, Grizzlin?", next = "xlock", when = { class = "WARLOCK" } },
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
      lines = { { id = "w_default", text = "Because everyone who comes through Winterspring comes through Everlook, pal, and everyone who comes through Everlook has something to sell. The cold keeps the fruit fresh and the bandits lazy, and both of those are lovely for the margins." } },
      choices = {
        { text = "A town that welcomes both sides is a good thing.", next = "BACK", reply = "It is, pal, a very good thing, for the town and for my commission. The Horde bids in the morning, the Alliance bids after lunch, and I win both times.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Goblins would sell to anyone, that's all.", next = "BACK", reply = "Anyone with coin, pal, and we're proud of it, so you'll get no argument here. You'd be surprised how much peace you can buy with fair trade.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I go where the Cartel sends me, and the Cartel sent me somewhere cold. That's all the story you'll get without a bid, chum, and the reserve's high." } },
    advice = { { id = "tp_ad", text = "List your runecloth in stacks, friend, because single bolts sit on the board for days." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel built Everlook, guards Everlook and takes a share of everything sold in Everlook. That's how a town stays neutral." } },
    everlook = { { id = "tp_everlook", text = "Everlook's the best place in the world to run an auction house, because nobody stands about in the snow to haggle. They bid fast, and they bid high, and I like that." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got an auction house too, and the bidding is cutthroat, and now and then it's cutthroat in the other sense too. I prefer Everlook, where the only thing that freezes is the price." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the other neutral house, down in Tanaris, and the Cartel likes to keep an eye on all three. A price set in Booty Bay on Monday is in my ledger by Thursday." } },
    _none = { { id = "tp_none", text = "If I can't list it, pal, I can't tell you about it, and I can't take a cut of it either." } },
  },
}

P:NPC {
  key = "wixxrak", id = TODO_NPC("Wixxrak"), name = "Wixxrak", title = "Weaponsmith & Gunsmith",
  bible = "bibles/winterspring.md", role = "vendor", tier = "service",
  prejudice = { race = "Dwarf", amount = 8, why = "a gunsmith's trade grudge: every dwarf tells him Ironforge does it better, and Ironforge powder cost a cousin his eyebrows" },
  communities = { "everlook" }, temper = { "eager" }, values = { "profit", "craft" },
  notices = { "class" },

  impression = {
    first = "He takes more pride in his gun oil than seems reasonable.",
    third = "{name} met Wixxrak, who sells weapons and guns in Everlook.",
  },

  greetings = {
    { id = "g_pj_dwarf", when = { prejudiced = true }, text = "A dwarf, in my shop. Lemme guess, pal, you're gonna pick up my best rifle, squint down the barrel and tell me Ironforge does it better, and then you're gonna buy it anyway." },
    { id = "g_pj_over", when = { prejudiced = "overcome" }, text = "My favourite dwarf! I never thought I'd say those words, so I wrote 'em in the ledger in case I needed proof, but you've never once said Ironforge to me, and that's worth a line item." },
    { id = "g_default", text = "Blades, guns, shot and powder, pal, all of it kept warm by the stove! Cold steel's a saying, friend, not a selling point, and it's sure not my selling point." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Let me guess, pal, your gun froze up on the road from Felwood and you're here for proper oil. Everybody's does, sooner or later, and sooner's better for business." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "That blade's seen some furbolgs, buddy, I can tell from the nicks. Come and look at something that's seen fewer, and I'll even give you a fair price for the scrap." },
  },

  start = "hello",
  nodes = {
    pj_wixx = {
      lines = { { id = "pj_wixx_default", text = "Against their mouths, sure. Every dwarf who comes through Everlook tells me the Ironforge stock is better, the Ironforge powder's drier and the Ironforge barrels are straighter, and then they walk out with my rifle anyway and tell their friends they got robbed." } },
      choices = {
        { text = "Is Ironforge powder really better?", next = "pj_wixx2" },
        { text = "Your guns speak for themselves. I won't run them down.", next = "BACK", reply = "Now that's a customer with taste, pal, and somebody who knows quality when it's pointed at a yeti. You'll go far, and probably come back for more shot.", fx = { align = { honor = 1 } } },
        { text = "I'll say whatever gets me a better price, Wixxrak.", next = "BACK", reply = "Ha! Honest about bein' dishonest, I like that, chum. But I know every trick in the bartering book, because I wrote half the chapters myself.", fx = { align = { honor = -1 } } },
        { text = "Show me what you've got, and I'll judge the steel.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pj_wixx2 = {
      lines = { { id = "pj_wixx2_default", text = "Drier, maybe, because Dun Morogh's cold is a dry cold and ours comes off the snowfields wet, but better? My cousin lost both eyebrows to a keg of Ironforge powder that went off sealed, so don't tell me those dwarves know everything about keeping a charge quiet." } },
      choices = {
        { text = "So the grudge is about eyebrows. I can respect that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because demons are fickle, friend, and steel isn't. I sold a lovely dagger to a warlock last winter who swore he'd never need it, and he came back a month later, without his voidwalker, to thank me personally, and he bought a second one in case." } },
      choices = {
        { text = "Sound advice. A wise warlock doesn't rely on demons alone.", next = "BACK", reply = "There's a warlock who'll live to come back, friend, and I'll see you here when you do. Steel doesn't sulk, and it's never once demanded a soul shard.", fx = { align = { order = 1 } } },
        { text = "My demon will never leave me. Keep your dagger.", next = "BACK", reply = "Never say never, friend, that's what the last one said too, and he came back crawling. When your little pal walks off, the dagger'll still be here, waiting.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Cheap steel, friend, folded fast and quenched in a bucket by some fella saving a copper, and the frost gets into it like a bad rumour. I've seen a dwarf's axe snap clean on a Winterfall furbolg's skull, and the furbolg was more surprised than he was." } },
      choices = {
        { text = "Good steel is worth paying for. I won't cut corners.", next = "BACK", reply = "Music to my ears, pal, because a customer who pays for quality never comes back angry. That's Gadgetzan steel, double-tempered, and it'll hold an edge at forty below.", fx = { align = { honor = 1 } } },
        { text = "I'll buy cheap and loot a better one off a furbolg.", next = "BACK", reply = "Sure, sure, and the furbolg's axe will snap right where the cheap one did, friend. But hey, it's your neck, and I don't sell those.", fx = { align = { honor = -1 } } },
        { text = "Something else, Wixxrak.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It doesn't thicken in the cold, pal, that's what, and I won't tell you what's in it, except that one part comes from the springs and one part I'd rather not say. A rifle that seizes up with a frostsaber charging you is just an expensive club, and I don't sell clubs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It doesn't thicken in the cold, pal, and that's all I'll tell you about what's in it. Mind {pet} doesn't lick it off the barrel, though, because it'll be sick on my floor." },
      },
      choices = {
        { text = "A hunter keeps the weapon in order. I'll learn the oil myself.", next = "BACK", reply = "Ha, a hunter with standards, and I respect that, pal, truly. But the recipe stays secret, so you'll just have to keep buying it from me.", fx = { align = { order = 1 } } },
        { text = "I don't care what's in it, so long as the rifle fires.", next = "BACK", reply = "That's what I like to hear, pal, somebody who cares about results. It fires every time, cold or not, and that's the only promise that matters on a gun.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Everybody who walks the road to the springs, and a few who should've stayed home! The Winterfall come down out of their camps drunk on that firewater and swinging like madmen, so I sell an axe a day and a rifle to anyone who'd rather not get close. I wouldn't expect a shaman to buy a rifle, but there's always a first time." } },
      choices = {
        { text = "Sell them all the rifles they want. Business is business.", next = "BACK", reply = "Music to my ears, friend, and I'll pass the word around the camps. A little trouble on the road is very good for the shot trade.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The furbolgs are sick, not wicked. Arm against them sparingly.", next = "BACK", reply = "Sparingly, sure, and I'll sell you exactly enough to be sparing with, friend. But when one comes at you swinging, you'll be glad you bought the extra box.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Cheap steel goes brittle in the frost, my friend, and a blade that snaps in a yeti's hide is a short, sad story with no refund at the end. Mine are forged in Gadgetzan and oiled with my own mixture, so they keep their temper when you need to keep yours." } },
      choices = {
        { text = "Good steel's worth paying for.", next = "BACK", reply = "Now you're talking my language, pal, and I'll knock the dust off the good stock for you. I've sold a lot of cheap blades in my time, and I've sold a lot of second blades to the same folks.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good rogue doesn't need a fancy blade.", next = "BACK", reply = "Maybe not, pal, but the yeti doesn't know that, and the yeti's hide is very, very thick. I've seen a cheap dirk bounce right off one.", fx = { align = { order = -1 } } },
        { text = "I'll keep that in mind.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "When the yeti's in your face and your mana's gone, you'll want something sharp in your hand, trust me on that. I've sold more daggers to robed folk than to rogues this winter, and not one of them complained." } },
      choices = {
        { text = "Fair point. Every fighter needs a backup.", next = "BACK", reply = "Exactly, pal, and you'll thank me the first time the frost bolt fizzles. I sell more backups than front-ups, if you follow me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll freeze the yeti first. No dagger needed.", next = "BACK", reply = "Sure, sure, until the yeti's breathing on your nose and you're out of mana. I'll be right here, friend, with the knives polished and my price unchanged.", fx = { align = { honor = -1 } } },
        { text = "I'll consider it.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Anyone who pays and doesn't start trouble inside Everlook, and the Bruisers see to the second part. A blade's just steel, friend, and it's the hand holding it that does good or evil, which I'd think a paladin would agree with." } },
      choices = {
        { text = "A merchant shares the guilt of every blade he sells.", next = "BACK", reply = "Then you'd better not buy a sword from anybody, pal, because we're all guilty together. I'll sleep fine tonight, and so will my ledger.", fx = { align = { light = 1 } } },
        { text = "Agreed. Steel is steel, and the wielder answers for it.", next = "BACK", reply = "Now that's sound thinking, friend, and good for business besides. I make it sharp, you make it righteous, and everybody goes home happy.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Plenty, especially the Forsaken ones, who say a bullet saves mana. I don't judge, I just oil the barrels so they fire in the cold, and the yetis out there don't much care whose prayers come after." } },
      choices = {
        { text = "I'd rather mend wounds than make them.", next = "BACK", reply = "Good for you, pal, mend away, and I'll keep making the work for you. Between the two of us, everybody stays busy.", fx = { align = { light = 1 } } },
        { text = "A bullet's a fine prayer for a yeti.", next = "BACK", reply = "Ha! A prayer with a muzzle velocity, I like it, friend, and the Forsaken would agree with you. Shot's on the left, powder's on the right.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Sure do, and to the hunters who chase the hunters, too. The frostsabres up by Starfall have gotten bold, chasing travelers right down to the road, and I've sold more shot this winter than any I can remember. Your kind would say the cats are hungry, and I'd say so's everybody." } },
      choices = {
        { text = "Thin the frostsabres if you must, but don't wipe them out.", next = "BACK", reply = "Thin 'em gently, friend, sure, and I don't want 'em gone either, since that'd hurt business. If the cats go, the hunters go, and then who buys my shot?", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If they hunt travelers, they're fair game. Keep selling shot.", next = "BACK", reply = "You'll find no arguments here, pal, and I'll put your name on the regulars list. Every cat on that road is another box of shot sold, so I'm practically cheering for 'em.", fx = { align = { order = -1 } } },
        { text = "Something else, Wixxrak.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Hey, pal, I sold a rifle to a {altrace} named {alt} not long ago, other side of the war, and you've got the same look of somebody who's gonna ask for a discount. The answer's the same for both sides, and it's no, but I said it real friendly." },
        { id = "h_alt_class", when = { alt = { sameClass = true } },
          text = "Another {altclass}! {alt} bought steel off me a while back and complained the whole time about the cold, so you've got a lot to live up to, pal, or down to, depending how you look at it." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! You don't need much from me, I suppose, but every warlock I've met has wished for a good dagger the day their demon wandered off, so take a look at the case." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Now you're my sort of customer, and I'll tell you straight that most swords in Kalimdor go brittle at forty below, but not mine." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You'll want a rifle that fires in the snow, and I've got just the thing, with a lock that won't freeze and an oil I mix myself." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Now, I know your lot like a good mace or axe, and I've got ones that hold an edge even when your fingers won't." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You want something light, sharp and quiet, and I've got daggers that'll hold an edge at forty below, which is more than the dwarves can promise." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! I don't sell staves, sorry, pal, but I've got wands on order and a very nice dagger a spellcaster can carry without hurtin' themselves, mostly." },
        { id = "h_default", key = true,
          text = "Wixxrak, pal, weaponsmith and gunsmith to everybody who comes through Everlook. Swords, axes, rifles and enough shot to keep you busy all winter, which in Winterspring is the whole year, and by my last copper, it all fires." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Now there's a customer who appreciates a good hammer, and I've got maces that won't go brittle in the cold, which you'd be surprised how many smiths can't say." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, eh? Most of your kind buy a mace and nothing else, but I'll sell you a rifle too, if your prayers ever need a little extra reach." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You've got claws, so you don't need a sword, but do your friends need a rifle? Because I've got rifles, and Winterspring's full of things that bite back." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you about, pal, before I go back to telling you what to buy?" },
        { id = "h_again2", text = "Go on, friend, ask, and I'll keep polishing, because shiny sells." },
      },
      choices = {
        { text = "Who in Winterspring arms against the Winterfall furbolgs?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "I wouldn't have thought the cold could hurt a gun.", next = "cold" },
        { text = "Who buys weapons up here?", next = "buyers" },
        { text = "Why would cold weather ruin a dagger?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do mages really need a dagger?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'd guess you sell weapons to anyone who pays, Wixxrak.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do priests ever buy your guns, Wixxrak?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would a sword go brittle in the cold, Wixxrak?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Your gun oil must be something special.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you sell to the hunters who chase the frostsabres?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why would a warlock need one of your daggers, Wixxrak?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "You've got something against dwarves, Wixxrak?", next = "pj_wixx", when = { prejudiced = true } },
        { text = "Goodbye.", next = "END" },
      },
    },
    cold = {
      lines = { { id = "c_default", text = "It thickens the oil and cracks the stock, and then your shot goes wide at the worst possible moment. I keep my stock by the stove and oil it with something I mix myself, and I'm not saying what's in it." } },
      choices = {
        { text = "Go on, you can tell me what's in it.", next = "cold_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold_secret = {
      lines = { { id = "cs_default", text = "Nice try, pal! I'll tell you it doesn't freeze, and that it smells terrible, and that's all a paying customer needs to know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Hunters chasing frostsabers and chimaeras, and folk heading into the Winterfall dens, and the odd fool who thinks he'll go into the caves of Mazthoril alone. I sell to all of 'em, buddy, and I hope to see most of 'em again, because the dead don't come back for powder." } },
      choices = {
        { text = "You'd sell a gun to anyone?", next = "buyers_anyone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_anyone = {
      lines = { { id = "ba_default", text = "To anyone with coin who isn't fighting inside Everlook, because the Bruisers see to that part. What they do with it outside the gate is between them and their consciences." } },
      choices = {
        { text = "Coin's coin. What they do outside is their business.", next = "BACK", reply = "You and me both, friend, and the Bruisers keep the inside of the gate tidy. Out past the gate, every fella needs a sword, and every sword was bought somewhere.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A merchant should care who he arms.", next = "BACK", reply = "Sure, pal, and I'll start the very day the other fellas stop buying. Until then, I sell to everyone, and everyone thanks me for it.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've sold guns in warmer places, pal, and I'll sell 'em in warmer places again, but right now the money's in the snow, and I go where the money is." } },
    advice = { { id = "tp_ad", text = "Keep your powder inside your coat, friend, next to your chest, where it stays dry." } },
    everlook = { { id = "tp_everlook", text = "Everlook's cold enough to freeze a gun barrel, so I sell only the ones that work in the cold. Gun oil's the secret, pal, and I've got the best there is." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got good gunsmiths, but they don't know the first thing about the cold. Try firing one of their pieces up here, and you'll see what I mean." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw don't use guns, and they don't like them either. I keep my stock out of sight when they come through." } },
    _none = { { id = "tp_none", text = "If it doesn't fire or cut, pal, I've no idea and no margin in it." } },
  },
}

P:NPC {
  key = "qia", id = TODO_NPC("Qia"), name = "Qia", title = "Trade Supplies",
  bible = "bibles/winterspring.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "dry" }, values = { "profit", "careful" },
  notices = { "craft" },

  impression = {
    first = "She treats thread as a serious matter, and she's probably right.",
    third = "{name} met Qia, who sells trade supplies in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Thread, vials, spices and flux, friend, and a few patterns for anyone who can read 'em, all priced to the copper and not a copper under. What are you making?" },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! You'll want rune thread, then, and I've some, though not much, so don't tell the others in town, because scarcity's the only thing up here that keeps my prices honest." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Enough to know what they want before they ask. I don't care what they're up to after they leave, since the Bruisers watch the gate, but I'd ask you not to practise your craft in the bank downstairs, because the Cartel takes that very personally." } },
      choices = {
        { text = "I'd never rob the Cartel. It's bad for everyone.", next = "BACK", reply = "Good, because the last fellow who tried is still paying it off in Booty Bay, pal. You'll find it's cheaper to be an honest customer.", fx = { align = { order = 1 } } },
        { text = "The Cartel's vault would be a fine challenge, Qia.", next = "BACK", reply = "It would, and you'd meet the folk who guard it, and then you'd meet the folk who collect for the Cartel. Leave the vault alone and buy your thread, pal.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every winter, without fail, and nobody believes me until it happens to them. I sell thread and leather and runecloth by the bolt, and I tell every paladin who comes through to oil their straps, and the ones who listen come back to thank me, and the ones who don't come back to buy more." } },
      choices = {
        { text = "I'll take your advice and oil the straps tonight.", next = "BACK", reply = "Good, and you'll thank me when your shoulder plate doesn't fall off halfway up the pass. Oil is cheap, and frozen leather is very expensive to replace.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My armour has held through worse than snow.", next = "BACK", reply = "I'm sure it has, and every paladin who's said so has come back holding a strap in one hand. I'll keep the oil on the counter for when you do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It keeps in the sweat, which is the trouble, because the cold freezes it and Vizzie's fire thaws it, over and over until the padding rots. Every warrior who comes through Everlook smells of it, and I sell more heavy thread to your kind than to the tailors." } },
      choices = {
        { text = "I'll mend it properly myself. A warrior keeps the kit in order.", next = "BACK", reply = "Glad to hear it, pal, and I'll sell you the thread at the usual rate. A warrior who mends his own kit lasts longer and smells a little better.", fx = { align = { order = 1 } } },
        { text = "I'll wear it till it falls apart and find new off a corpse.", next = "BACK", reply = "Your choice, pal, and the furbolgs aren't known for washing, so it won't smell any better. I'll be here when you need a proper patch.", fx = { align = { order = -1 } } },
        { text = "Something else, Qia.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Frostsaber and chimaera, though the chimaera's tough enough to break a needle, and the bear pelts from the shardtooths. The tailors want felcloth more, but the leatherworkers will pay well for anything thick enough to keep the wind out." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Frostsaber and chimaera, and the bear pelts from the shardtooths, because the leatherworkers pay well for anything thick enough to keep the wind out. If {pet} drags in anything with fur on it, I won't ask whose it was, only how fresh." },
      },
      choices = {
        { text = "I'll skin only what I kill cleanly, and waste none of it.", next = "BACK", reply = "That's the way, and the leatherworkers pay best for a clean hide anyway. I've had hides come in so hacked about I couldn't sell 'em as boot liners.", fx = { align = { light = 1 } } },
        { text = "I'll strip every beast in the valley if the price is right.", next = "BACK", reply = "I'll buy what comes through the door, pal, as long as it's not a cub. But you strip that valley bare this year, and next winter I'll have nothing to buy from you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Twice a winter at least, and every crafter in town learns to count their thread when it happens. The pass down to Felwood closes, the tunnels through Timbermaw Hold stay open only so long as the furbolgs like us, and then it's just whatever's on my shelves at whatever I say it costs. Your spirits would make a fortune up here, friend, if they could shovel." } },
      choices = {
        { text = "Then keep good stores, and keep faith with the Timbermaw.", next = "BACK", reply = "Sound advice, pal, and I keep both, because the Timbermaw remember who treated them fairly. I sold one of 'em a wool blanket three winters back, and his clan's been trading with me since.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules mean little in a blizzard. Take what you need.", next = "BACK", reply = "Not in my shop, you don't, pal, blizzard or no blizzard. The Bruisers don't care about the weather, and neither does the Cartel's ledger.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Off the satyrs and the fel-touched things in Felwood and Azshara, cut from their robes by people braver than me. Tailors want it for the strongest garments, and it smells of brimstone however much you wash it, so I keep it in the back." } },
      choices = {
        { text = "I won't wear anything stitched from fel.", next = "BACK", reply = "Suit yourself, and I'll admit the smell bothers me too. There's plenty of runecloth on the left shelf for folk with delicate noses.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power, whatever it smells like.", next = "BACK", reply = "Sure, pal, but it's a power that makes your eyes water, and I sell it by the bolt anyway. Just don't wear it near Vizzie's fire.", fx = { align = { light = -1 } } },
        { text = "I'll stick with runecloth.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A few, and they're my best customers for felcloth and soul pouches both. I don't ask what goes in the pouches, because I'd rather not know and it doesn't change the price, but I do ask 'em to pay before they open the box." } },
      choices = {
        { text = "Wise. Some things are best left unasked.", next = "BACK", reply = "Exactly, pal, and the pouches don't get any lighter if I ask. I like my customers alive and my questions short.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should know what you're selling, and to whom.", next = "BACK", reply = "I know whom, pal, they're the ones with coin and a little red friend. As for what, the Cartel doesn't pay me to wonder.", fx = { align = { order = 1 } } },
        { text = "I'll take a look at the stock.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every one that passes through, Horde or Alliance, since the cold eats a robe faster than any battle does. A troll priest bought rune thread from me last month and told me her loa liked a neat hem, and I've thought better of the loa ever since." } },
      choices = {
        { text = "A neat robe shows a disciplined mind.", next = "BACK", reply = "That's what I tell every customer, pal, and none of them believe me. I've seen archmages with mud on their hems, and they still get the spells right.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My robes go ragged, and the loa don't mind.", next = "BACK", reply = "Ha! That's what the troll said too, and he bought more thread than anyone. The loa might not mind, but the wind up here goes straight through the holes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Gadgetzan, Ratchet and Booty Bay, mostly, on the goblin caravans, and a few furs from the hunters who winter up here. I don't buy from anyone who skins frostsabre cubs, because there are lines even a goblin won't cross, and the Cartel's happy enough to let me draw them." } },
      choices = {
        { text = "Good on you, Qia. More merchants should draw that line.", next = "BACK", reply = "It's not about goodness, it's about not having angry elves in my shop. But I'll take the compliment, pal, since nobody else is giving them out.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Lines are bad for business. Someone else will just sell cubs.", next = "BACK", reply = "Someone else can, and they'll answer to the Wintersaber Trainers, not me. Some lines are good business, pal, because they keep you breathing.", fx = { align = { honor = -1 } } },
        { text = "Something else, Qia.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You'll want thread that doesn't creak, I expect, and dark dye, and leather soft enough not to squeak on the snow, so let me show you what I keep for quiet folk." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You'll want rugged leather for the straps under that plate, I expect, because cold leather cracks and then your pauldron's down by your elbow in the middle of a fight." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You'll be after heavy thread to mend the padding under that armour, I expect, because the frost rots it in a season." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You'll be selling me hides, I hope, because rugged leather fetches a fair price here, and the skinners in town are always short." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll want leather and heavy thread, I expect, because nothing you carry survives a Winterspring winter without mending." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! You're wearing cloth in Winterspring, so I'll assume you either have a spell for the cold or you're mad, and I sell felcloth to both kinds." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! You'll be wanting felcloth, I expect, since your lot never want anything else. I keep it in the back so it doesn't stink up the thread." },
        { id = "h_default", key = true,
          text = "Qia, trade supplies, right here beside the bank and the auction house, which is the best address in Everlook. Every crafter in town buys from me sooner or later, pal, because the next shop with thread is a long, cold walk away, and I've priced in every step of it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! You'll be after thread for your robes, I expect, because nothing tears a robe faster than a Winterspring wind." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You'll find plenty of furs and threads in my shop, though I suspect you'd rather see the furs still on the animals, wouldn't you?" },
      },
      again = {
        { id = "h_again", text = "Anything else, or have I sold you enough thread for one day? I can always sell you more." },
        { id = "h_again2", text = "Still thinking? Take your time, friend, the shop's warm, and browsing's the only thing in here I don't charge for." },
      },
      choices = {
        { text = "Do the storms up here ever cut Everlook off, Qia?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "The crafters here must be short of something.", next = "needs" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "I've never known where felcloth comes from.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do many warlocks buy from you?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do priests often come to you for robe cloth, Qia?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I'd have thought the padding under armour would keep in the cold.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What hides sell best in Everlook, Qia?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Where do your trade goods come from, Qia?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does the cold really crack armour straps, Qia?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you sell to many rogues in Everlook, Qia?", next = "xrogue", when = { class = "ROGUE" } },
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
      lines = { { id = "s_default", text = "Through the Timbermaw tunnel from Felwood, mostly, when the furbolgs there are in a mood to let a goblin pass. When they aren't, prices go up, pal, and I don't apologise for it, because that's what supply and demand looks like with snow on it." } },
      choices = {
        { text = "Raising prices when people are desperate seems unfair.", next = "BACK", reply = "It's the price of the risk, pal, and the risk's real, I promise you. When the tunnel opens, the prices come down, and nobody thanks me for that either.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "That's just good business.", next = "BACK", reply = "There's someone with sense, pal, and I'm glad to see it. Up here, everybody needs a warmer coat by the second week.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sell supplies, friend. I've always sold supplies, my mother sold supplies, and I expect I'll be selling 'em at a fair markup when the snow finally melts." } },
    advice = { { id = "tp_ad", text = "Buy thread before you need it, because nobody likes running out halfway through a cloak." } },
    everlook = { { id = "tp_everlook", text = "Everlook's tailors are always short of something, and I know exactly what to the copper. Thread is a serious matter up here, because a torn seam in this cold is the end of you." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw make their own cloth from their own fur, and it's warmer than anything I sell. I've tried to buy some, and they looked at me as though I'd asked for their ears." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's tailors sell silk and nothing else, and silk is no use at all up here. I'll take wool every time." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend, and I don't stock it either, which in my book is the same thing." } },
  },
}

P:NPC {
  key = "azzleby", id = TODO_NPC("Azzleby"), name = "Azzleby", title = "Stable Master",
  bible = "bibles/winterspring.md", role = "stablemaster", tier = "service",
  communities = { "everlook" }, temper = { "cheerful" }, values = { "kind" },
  notices = { "pet" },

  impression = {
    first = "He likes the beasts better than their owners and doesn't hide it.",
    third = "{name} met Azzleby, the goblin stable master by Everlook's gate.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in, but shut the gate, pal! The beasts have the only warm straw in Winterspring, and at what I paid for it, I mean to keep it that way." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Look at your {pet}, shivering! Bring it here a minute, pal, the stove's lit, and it's earned a warm-up even if you haven't, and I won't even put it on your bill." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Oats, mostly, and dried fish for the cats, a little at a time, so I don't notice until the bins are half empty and I've lost a week's margin. I've an idea it's a hungry trapper and not a thief, but I've no time to sit up all night and catch 'em." } },
      choices = {
        { text = "I'll watch the bins tonight. The animals shouldn't go hungry.", next = "BACK", reply = "Would you, pal? I'd owe you one, and I mean that in the ordinary way, not the Cartel way. Just don't spook the cats while you're at it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hungry trapper needs oats more than your animals do.", next = "BACK", reply = "Huh, maybe so, pal, and I've half a mind to leave a sack out for him anyway. But not out of the bears' bin, they get cranky when they're hungry.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "He talked to his horse like it was a soldier and to me like I was a stable boy, and I'll tell you which one of us he paid more attention to. The horse was a fine beast, though, and if you treat yours like a friend rather than a servant, we'll get along well." } },
      choices = {
        { text = "A charger is a companion. I treat mine as one.", next = "BACK", reply = "Then you're a better rider than most, pal, and I'll tell you a secret: the horse can tell. A charger knows when it's loved, and it carries you farther for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A warhorse is a tool of war. It doesn't need coddling.", next = "BACK", reply = "Sure, and that's how you end up with a horse that bites, pal. I've got three teeth marks on this arm from a warhorse nobody coddled.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because warriors shout, pal, it's in the training, and every time one of you bellows a war cry by the gate, my bears wake up and my cats go under the hay. A beast that's frightened in the stable is a beast that bites its own hunter later, and I don't refund for bites." } },
      choices = {
        { text = "I'll save my war cry for the furbolgs, then.", next = "BACK", reply = "I'd appreciate that, pal, more than you know. My bears would too, if they could talk, and some days I think they nearly can.", fx = { align = { order = 1 } } },
        { text = "A beast that can't stand a shout won't last in Winterspring.", next = "BACK", reply = "Maybe so, pal, but they don't have to last out there, they have to sleep in here. Shout outside the gate, and we'll all get along fine.", fx = { align = { order = -1 } } },
        { text = "Something else, Azzleby.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The wild ones manage, with fur thicker than a goblin's purse and the hot springs to drink from when everything else freezes. It's the ones that wander too near the Winterfall camps that worry me, pal, because some of 'em come back wrong somehow. I don't know what's poisoning 'em, but I'd thank any shaman who found out." } },
      choices = {
        { text = "I'll look into it. The beasts deserve that much.", next = "BACK", reply = "Thank you, pal, truly, and I'll give you whatever I've noticed. A sick beast in my stable can take the whole place down with it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sick beasts are weak beasts. Better they're culled.", next = "BACK", reply = "That's a hard thing to say in a stable, pal, and I'll not hear it twice. I've seen sick beasts get better with a little care.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A pet loves its hunter, and you can see it in the way it waits by my gate. Your demon serves you because it must, and every beast in my stable knows the difference the moment it smells one." } },
      choices = {
        { text = "You're right. A beast's loyalty is the honest kind.", next = "BACK", reply = "You get it, pal, and my bears get it too, which is why they growl at you. A beast that loves you will follow you into a blizzard.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear works just as well as love.", next = "BACK", reply = "Maybe so, pal, but fear doesn't wait by the gate when you're gone. You'll find that out one day, and I hope it's somewhere safe.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep my demon away from the bears.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only until it turns back into an angry dwarf in the middle of the night, pal, and I've a dent in my lantern and a bill from the tinker to prove it. No, I'll stick with hunters' pets, which are what they look like and stay that way." } },
      choices = {
        { text = "Fair. A sheep's no proper pet.", next = "BACK", reply = "Not much of one, no, and it bleats at night besides. I'll stick to my bears and my cats, pal, they at least stay what they are.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Polymorph's a fine joke. You should laugh more.", next = "BACK", reply = "Laugh? Pal, I laughed until the sheep turned back into a dwarf and threw my lantern across the stable. I've been laughing more carefully since.", fx = { align = { order = -1 } } },
        { text = "I'll keep my sheep elsewhere.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Some do, the ones from the Barrens and the jungles, who were never meant for snow. I keep them warm and fed, and the frostsabers sniff at their stalls like they're laughing at them, which I suppose they are." } },
      choices = {
        { text = "Then I'll bless the ones from the warm lands.", next = "BACK", reply = "You're a kind one, pal, and they'll take any warmth they can get. That raptor in the corner hasn't stopped shivering since he got off the boat.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast that can't stand the cold shouldn't be here.", next = "BACK", reply = "Then where should they be, pal, frozen in the pass? Their owners brought them here, so I keep them alive until they go home.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Better than the guests at the inn, I'd say. I keep them in straw, I feed them before I feed myself and I talk to them more than I talk to people, which suits us all. A druid might hear what's really bothering them, but my guess is they just miss the sun, same as me." } },
      choices = {
        { text = "They're lucky to have you. Keep them warm, Azzleby.", next = "BACK", reply = "I will, pal, and thank you for saying so. Most folk just toss me the reins and run off to Vizzie's for soup.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A tamed beast loses something. They'd be happier in the wild.", next = "BACK", reply = "Maybe, pal, but these ones don't seem to mind the straw and the dinner. If they ever ask me to let them go, I'll listen.", fx = { align = { order = -1 } } },
        { text = "Something else, Azzleby.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. You've no beast to stable, I'd guess, and I'll ask you to keep your hands out of the feed bins, because somebody's been helping themselves and the animals go hungry for it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. Your charger's been in my stalls before, I think, or one like it, and it was far better company than its owner, though you might be the exception." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You've no beast to stable, I expect, unless you count the bear-sized grudge you're carrying, so I'll just ask you to keep your voice down near the stalls." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The beasts in my stable perk up when your kind come by, so stand near the stalls as long as you like and warm them up a bit." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock. I board beasts, pal, not demons, so don't ask me to stable your voidwalker, because the last one frightened my bears so badly they wouldn't eat, and a bear that won't eat is money I already spent on fish." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. I suppose you've no beast to stable, unless you count the sheep you turn people into, and I don't board those either." },
        { id = "h_default", key = true,
          text = "Azzleby, stable master, pal, right by the gate so the hunters don't have to drag their beasts all the way through town. I board pets for anyone who's tamed one at a fair Cartel rate, and I keep 'em warmer than the inn keeps its guests." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. I don't get many of you at the stables unless a pet's ailing, so if you've a blessing to spare, the beasts in the back need it more than the folk in the inn." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I've got a stable full of animals that'd love a word with you, if you can talk to them, because some of them haven't stopped complaining since the snow came." },
      },
      again = {
        { id = "h_again", text = "Anything else, pal? There's a bear back there that wants its dinner, and he don't take credit." },
        { id = "h_again2", text = "Go on, I've time; the animals are all asleep." },
      },
      choices = {
        { text = "Do the wild beasts of Winterspring fare well, Azzleby?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'd like to see my stabled pets.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Keeping beasts warm up here can't be easy.", next = "warm" },
        { text = "Do hunters tame much in Winterspring?", next = "tame" },
        { text = "Is a demon really so different from a pet?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Would a polymorphed sheep be welcome in your stables?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the beasts in your stable suffer the cold, Azzleby?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why keep my voice down near the stalls?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Are the animals well cared for in this cold?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The last paladin who stabled here must have left an impression.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Someone's stealing from your feed bins, Azzleby?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    warm = {
      lines = { { id = "w_default", text = "Straw, blankets, a stove I never let go out and a lot of hay hauled in at a price that'd make a pirate blush. Some of the beasts from the south never quite get used to it, so they sleep closest to the fire, and they pay for it in purring." } },
      choices = {
        { text = "That's kind of you.", next = "BACK", reply = "Kindness costs money up here, pal, but they're worth every copper. A warm bear's a happy bear, and a happy bear doesn't eat the stable boy.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sounds like a waste of good coin.", next = "BACK", reply = "Waste? Pal, you try telling a shivering raptor it's a waste. He'll show you what he thinks with his teeth.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame = {
      lines = { { id = "t_default", text = "Frostsabers, mostly, the white cats, and the odd bear from the woods. A frostsaber's a beautiful animal, but it sulks if you board it with a wolf, so I keep them apart." },
        { id = "t_nelf", when = { race = "NightElf" }, text = "Frostsabers, mostly, and you'd know more about those cats than I would, being a night elf. They sulk if you board them beside a wolf, so I keep them well apart." } },
      choices = {
        { text = "Why do the cats sulk beside a wolf?", next = "tame_sulk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame_sulk = {
      lines = { { id = "ts_default", text = "Cats think they own the place, and wolves think the same, and neither of them is right, since I own the place. A little distance keeps everyone from finding that out with their teeth." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I like animals more than I like people, pal, and the Cartel was kind enough to give me a job where that counts as a skill and draws a wage." } },
    advice = { { id = "tp_ad", text = "Feed your pet before a long walk in the snow, because it burns food faster than you do." } },
    everlook = { { id = "tp_everlook", text = "Everlook's stables are the warmest in the north, and the animals sleep better than most of their owners. I like it that way." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw keep no mounts that I've ever seen, and I can't say I blame them. Their tunnels are too low for a horse." } },
    thrall = { { id = "tp_thrall", text = "Orcs ride wolves, and they treat them better than most folk treat their horses. I've a soft spot for an orc and his wolf." } },
    _none = { { id = "tp_none", text = "No idea, pal. Ask me about a beast and I'll talk your ear off, free of charge." } },
  },
}

P:NPC {
  key = "evie", id = TODO_NPC("Evie Whirlbrew"), name = "Evie Whirlbrew", title = "Alchemy Supplies",
  bible = "bibles/winterspring.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "eager" }, values = { "craft", "profit" },
  notices = { "craft" },

  impression = {
    first = "She seems delighted by every herb that grows in the snow.",
    third = "{name} met Evie Whirlbrew, who sells alchemy supplies in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Careful with the shelf, love, those vials are cold and brittle, and the last fellow who leaned on it paid for six, plus the straw! Now, what are you brewing?" },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Your fingers are stained green, so you're one of us! Have you tried brewing with something that grows in the snow yet? It's not like anything down south." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the last time somebody knocked one over, the whole shop smelled of Felwood for a week, and my icecap went brown, and that was forty gold of icecap, love. I don't mind selling the stuff, because a sale's a sale, but I won't have it near the good herbs, so you'll have to ask for it nicely." } },
      choices = {
        { text = "Fel has no place near clean herbs. I'll mind the shelf.", next = "BACK", reply = "Oh, would you, love? Thank you, and I'll keep the good icecap on the top shelf, well away from your elbows. Forty gold is a lot to lose to a sneeze.", fx = { align = { light = 1 } } },
        { text = "Your icecap will survive. Bring the whole shelf down.", next = "BACK", reply = "Oh no, no, no, not the shelf, love, please don't even joke about that! I'll take my chances with the icecap in the back room, thank you very much.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I think everything's a little bit alchemy, if you look closely enough, and that includes prayers! But I'll grant that my potions never made anyone braver, and I've seen paladins walk into the snow with nothing but a hammer and a hymn, so maybe there's something to it after all." } },
      choices = {
        { text = "The Light is faith, not alchemy. You'll see it someday.", next = "BACK", reply = "Maybe I will, love, but until then I'll keep brewing, and you keep praying, and we'll call it a tie. Both work best when you're scared, I think.", fx = { align = { light = 1 } } },
        { text = "If a potion does the same work, I'll take the potion.", next = "BACK", reply = "There's a practical sort, love, and I'll sell you three for the road. Nothing against the Light, but a potion never asks if you've been good.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, more than anyone, because you're the ones standing in front when the Winterfall come swinging. I brew mine with a pinch of icecap, which keeps them clear in the cold, and I'd like to think one of my bottles has saved a warrior or two." } },
      choices = {
        { text = "I'd rather trust my shield and my training than a bottle.", next = "BACK", reply = "Training is lovely until you're bleeding, love, and then a bottle is lovelier. Keep one on your belt anyway, just in case.", fx = { align = { order = 1 } } },
        { text = "Give me the strongest you've got. I'll drink anything in a fight.", next = "BACK", reply = "Oh, careful with that, love, because some of mine taste worse than the Winterfall smell. But the strong ones are on the top shelf, and they do work.", fx = { align = { order = -1 } } },
        { text = "Something else, Evie.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I'd buy anything clean, love, because the herbs up here are pure as the snow, mostly, and pure herbs make clear potions that fetch a clear price. Don't bring me anything from near the Winterfall camps, though, because whatever's in their firewater has got into the roots there too, I'm sure of it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I'd buy anything clean, love, but nothing from near the Winterfall camps, because their firewater has got into the roots there. And mind {pet} doesn't eat the icecap, because I once watched a wolf walk in circles for an hour after." },
      },
      choices = {
        { text = "I'll gather only where the land is clean. Your potions deserve that.", next = "BACK", reply = "Oh, you're a dear, love, and the clean herbs do make the potions come out brighter. I can tell a Felwood leaf from across the shop by the smell.", fx = { align = { light = 1 } } },
        { text = "I'll bring whatever I find. Your customers won't know the difference.", next = "BACK", reply = "They won't, love, until one of them sprouts a tail, and then they'll know exactly where it came from. Bring me clean, or don't bring me anything.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Oh, I'd love to know, and I've bottled that water three times to find out! It stays warm for an hour and then it's just water, which means either there's nothing in it or it only works where the earth wants it to, and either way I can't sell it. Donova Snowden would call it science, you'd call it spirits, and I'd say you both owe me a vial." } },
      choices = {
        { text = "Keep bottling it. If it works, sell it.", next = "BACK", reply = "I'm trying, love, but water that cools in an hour isn't much of a product. Still, if I ever bottle the warmth, I'll call it Whirlbrew's Wonder.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The springs' gift should stay at the springs.", next = "BACK", reply = "Hmm, maybe you're right, love, and the springs do seem to sulk when I bottle them. I'll leave them be and just drink the tea.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not me, love, I sell what poisons go into, and what they're carried in, and I leave the brewing to you. The rogues' masters in the cities sell the real recipes, so ask them, and come back to me when your vials run out." } },
      choices = {
        { text = "Poison's a fair tool. Steel's no kinder.", next = "BACK", reply = "Steel's no kinder, love, that's true, and I've seen what a sword does. I just sell the ingredients and let you make the choices.", fx = { align = { honor = -1 } } },
        { text = "I use poison sparingly. It's not an honest fight.", next = "BACK", reply = "That's very honourable of you, love, for a rogue. I'll still sell you a vial or two, just for emergencies.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll be back for the vials.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Here and there, in the coldest corners, and it's worth a fortune to any alchemist who can find it, love. They say it makes flasks fit for the strongest fights, but I've never tried, because I'd rather sell it than drink it, and so would any goblin with sense." } },
      choices = {
        { text = "Better to sell it to someone who'll put it to use.", next = "BACK", reply = "A sensible answer, love, and you'd make a good merchant. Ask at the auction house, then, because Grizzlin knows who's buying.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd keep it all and brew the flasks myself.", next = "BACK", reply = "Oh, ambitious, love, I like that! Just don't blow anything up near the shop, because my insurance doesn't cover alchemy accidents.", fx = { align = { order = -1 } } },
        { text = "I'll keep an eye out for it.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Near enough, from where I'm standing, because a wound's closed either way, but a potion doesn't care who drinks it and I'm told the Light's a bit pickier. Then again, a potion can't comfort anyone, so I suppose you've got me there." } },
      choices = {
        { text = "The Light is for everyone. It only asks a willing heart.", next = "BACK", reply = "That's very sweet, love, and I hope you're right. I'll stick to my potions, though, because I've never had much luck with the willing part.", fx = { align = { light = 1 } } },
        { text = "A potion that works for anyone sounds more reliable.", next = "BACK", reply = "There's someone who knows a good product, love. Reliable, portable and no faith required, that's my motto.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Well, it glows a little, and it keeps its cold even in a warm hand, so it's either holy or very stubborn. A troll priest told me once that every herb has a little loa in it, and I can't prove her wrong, so I've started thanking mine." } },
      choices = {
        { text = "Thank them, then. Respect keeps the world in balance.", next = "BACK", reply = "I'll do that, love, and I'll mention you to them too. A little thank you never cost an alchemist anything.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Herbs are herbs. Grind them and stop wondering.", next = "BACK", reply = "You sound like my cousin, love, and he once ground up something that ground him back. I'll keep wondering, it's safer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hardly anywhere, and that's why they're dear. A few of the herbalists bring up what grows by Timbermaw Hold and the Moonglade road, but I've noticed the plants near the Frostwhisper Gorge come in strange and pale, and I've stopped buying them, just to be safe." } },
      choices = {
        { text = "Trust your instincts and keep refusing them. Something's wrong there.", next = "BACK", reply = "I will, love, and I'm glad someone else thinks so. Pale plants make pale potions, and I don't sell anything I wouldn't drink.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pale or not, they're herbs. Test them before you throw them out.", next = "BACK", reply = "Oh, I've tested them, love, and they came out cloudy and smelled of nothing at all. That's somehow worse than smelling bad.", fx = { align = { order = -1 } } },
        { text = "Never mind the herbs.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! Oh, you'll be after my felcloth dye and maybe a little demonic ink, though I'll confess I keep those on the high shelf, because they do smell dreadful." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I've a theory about you lot, which is that your Light works just like a healing potion, only slower and cheaper, and I'd love to watch you test it against one of mine." },
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
          text = "Evie Whirlbrew, love, alchemy supplies, and the only shop in Everlook where the bottles are packed in straw, so they arrive in one piece and so does my profit. Vials, a recipe or two and the odd potion for anyone who doesn't have the patience to brew their own." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! You won't want healing potions, will you, not with the real thing in your hands, and here's me with all my bottles packed in straw." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I've always wondered whether a potion and a prayer are cousins, because icecap from these hills feels half holy when you cut it fresh." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I keep some herbs from the Moonglade road on my shelves, and you'll know better than me whether they're worth what I paid for them." },
      },
      again = {
        { id = "h_again", text = "Anything else, love? I've a pot on the boil, and if I leave it too long it'll take the roof off again." },
        { id = "h_again2", text = "Go on, ask me something, love, because I could talk alchemy all day and I very nearly do." },
      },
      choices = {
        { text = "Do the hot springs here hold any power, Evie?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Why pack everything in straw?", next = "straw" },
        { text = "Something in Winterspring must be worth brewing.", next = "herbs" },
        { text = "Do you sell poisons too?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I didn't know black lotus grew in Winterspring.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you think potions and prayer do the same work?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you really think icecap is half holy, Evie?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do warriors really drink that many potions, Evie?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "I find plenty of herbs out in the wild, if you're buying.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I can't think where you'd find herbs in all this snow.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you really think the Light is just a slow potion, Evie?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why keep the fel reagents on the high shelf, Evie?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    straw = {
      lines = { { id = "s_default", text = "Because cold glass cracks if you so much as breathe on it, love, and I lost a whole crate my first week, which was a whole month's profit gone in one crunch. Now I keep it all in straw by the stove, and I've only lost two vials since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    herbs = {
      lines = { { id = "h2_default", text = "Mountain silversage up in the high places, and some very interesting things around the hot springs, where the snow melts. Herbalists come back from the Frostfire Hot Springs with their packs full and their boots soaking." } },
      choices = {
        { text = "Are the hot springs dangerous?", next = "herbs_springs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_springs = {
      lines = { { id = "hs_default", text = "The water won't hurt you, but the Winterfall furbolgs who roam that valley might. A clever herbalist picks fast and leaves before the furbolgs notice, and a brave one picks slowly and fights them." } },
      choices = {
        { text = "I'd pick slowly. Let them come.", next = "BACK", reply = "Brave, love, and I'll sell you a few healing potions for the trip. Let me know how the furbolgs feel about slow herbalists, if you come back.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fast and quiet is smarter.", next = "BACK", reply = "That's what I always say, love, and I've still got all my fingers. Fast and quiet, and come straight back to me with the haul.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I mix potions and I sell what other people need to mix theirs, love, at prices that keep the stove lit. The snow is new to me, but the bubbling isn't, and neither are the little explosions." } },
    advice = { { id = "tp_ad", text = "Keep your potions inside your coat in Winterspring, because a frozen potion is just a cold rock." } },
    everlook = { { id = "tp_everlook", text = "Everlook's the best place in the world for snow herbs, and I find a new one every week. The cold keeps them fresh, and my bottles packed in straw keep them safe." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got herbs too, but they're all sweaty and wilting. I like a herb that stands up straight in the snow." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "I've heard the druids say every herb has a twin in their Dream, all greener and finer. I'd love to see it, but I'm told it's not a place you can buy a ticket to." } },
    _none = { { id = "tp_none", text = "Oh, I don't know about that, love, but I'd love to know if it can go in a potion, and what it'd sell for if it did." } },
  },
}
