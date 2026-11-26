-- Redridge folk a roster scan found missing: Amy Davenport (trade goods), Bridge Worker Daniel,
-- Clyde Ranthal (leatherworking supplies), Franklin Hamar and Gloria Femmel in the Lakeshire Inn,
-- and two more of the watch, Guard Ashlock on the bridge and Guard Hiett in the town.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bridge Worker Daniel: one of Oslow's crew on the Lakeshire bridge; careful, sparing with words.
P:NPC {
  key = "bridge_daniel", id = TODO_NPC("Bridge Worker Daniel"), name = "Bridge Worker Daniel", gender = "male",
  bible = "bibles/missed.md", role = "worker", tier = "service",
  communities = { "lakeshire" }, temper = { "careful", "quiet" }, values = { "craft", "dutiful" },
  notices = { "craft" },
  impression = {
    first = "Bridge Worker Daniel sets stone on the Lakeshire bridge with a plumb line never far from his hand. He answered what I asked and nothing more, and went back to checking a course he had already checked.",
    third = "{name} met Bridge Worker Daniel, one of Foreman Oslow's crew on the Lakeshire bridge.",
  },
  greetings = {
    { id = "g_default", text = "Mind the fresh course there, if you would. It wants another day before anyone leans on it." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. The same stone's still drying, so the same warning stands." },
  },
  notice = {
    { id = "n_dwarf", cat = "craft", when = { race = "Dwarf" },
      text = "A dwarf on the bridge! I'd be glad of your eye on this arch, if you've a moment, since your folk were cutting stone before mine had learned to stack it." },
    { id = "n_miner", cat = "craft", when = { profession = { "Mining", "Engineering" } },
      text = "You know stone, or iron at any rate. You'll see why I keep looking at that pier, then." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Daniel, and I lay stone for Foreman Oslow. Dmitri does the talking for the crew, so if it's news you're after you'd do better with him, but I'll answer what I can." } },
      again = {
        { id = "h_again", text = "Was there something else? I can talk while this sets." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "How's the bridge coming along?", next = "bridge" },
        { text = "You check everything twice, I notice.", next = "twice" },
        { text = "What's the crew like to work with?", next = "crew" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    bridge = {
      lines = { { id = "b_default", text = "Slower than the Foreman wants and faster than it ought to go. We lost tools in the lake and iron to the gnolls, and the rains are coming, so every day he asks for a week's work out of us.", fx = { learn = { "everstill_bridge" } } } },
      choices = {
        { text = "Will it hold when it's done?", next = "hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      lines = { { id = "ho_default", text = "My part will, because I won't sign to a course I haven't trued. The orcs burned the last bridge from on top, and no mason can build against that, but nothing will bring this one down from underneath." } },
      choices = { { text = "That's a mason's promise. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    twice = {
      lines = { { id = "t_default", text = "A crooked stone at the bottom is a crooked bridge at the top, and by then it's too late to say so. Matthew mixes a good mortar and Trent can lift anything, but somebody has to hold the line, and I find I can't leave it to chance." } },
      choices = { { text = "The town's lucky you can't. Something else.", next = "BACK" } },
    },
    crew = {
      lines = { { id = "c_default", text = "They're good men, every one. Jess talks enough for the lot of us and Trent grumbles enough for two, so Alex and I are left free to get on, which suits us both." } },
      choices = {
        { text = "And Foreman Oslow?", next = "oslow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oslow = {
      lines = { { id = "o_default", text = "He shouts, but he's never asked a man to do what he wouldn't do himself, and he was first into the water after those tools. I've worked under quieter foremen and trusted them a good deal less." } },
      choices = { { text = "High praise from you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a mason on the bridge crew. I lay the stone and see that it's straight, and there isn't much more to tell." } },
    everstill_bridge = { { id = "tp_eb", text = "The orcs burned it, and we're building it back in stone. It'll be done when it's right, and not before, if I've any say." } },
    _none = { { id = "tp_none", text = "I wouldn't know, I'm afraid. Dmitri hears more than I do." } },
  },
}

-- Guard Hiett: Lakeshire watch; kin to Kimberly Hiett the fletcher, and the best shot on the wall.
P:NPC {
  key = "guard_hiett", id = TODO_NPC("Guard Hiett"), name = "Guard Hiett", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "lakeshire" }, temper = { "keen", "blunt" }, values = { "dutiful", "skill" },
  notices = { "soldier", "kit" },
  impression = {
    first = "Guard Hiett keeps her post in Lakeshire with a sword at her hip and an archer's habit of measuring distances. She shares a name and a bluntness with the town's fletcher, and has strong views on how many arrows the watch is owed.",
    third = "{name} met Guard Hiett of the Lakeshire watch.",
  },
  greetings = {
    { id = "g_default", text = "Move along or state your business, {class}. I don't mind which, so long as it's one of them." },
    { id = "g_back", when = { metBefore = true }, text = "You're still about, then. Good; the ones who stay are worth more than the ones who pass through." },
  },
  notice = {
    { id = "n_hunter", cat = "kit", when = { class = "HUNTER" },
      text = "That's a well-kept bow, and you carry it like you use it. We've a wall that could do with you, if you've an evening." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Another sword's always welcome. Marshal Marris is by the bridge road, if you've come to be useful." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Guard Hiett, Lakeshire watch. I keep this post by day and a place on the wall when the horn goes, and of the two I'd choose the wall." } },
      again = {
        { id = "h_again", text = "Anything else? Make it short." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
        { text = "Hiett? Like the fletcher?", next = "kim" },
        { text = "Why do you prefer the wall?", next = "wall" },
        { text = "How is the watch holding up?", next = "holding" },
        { text = "Where do the gnolls hide from arrows?", next = "shoot", when = { class = "HUNTER" } },
        { text = "As you were, guard.", next = "END" },
      },
    },
    kim = {
      lines = { { id = "k_default", text = "Kimberly's my kin, and she makes the arrows I shoot, which keeps it in the family. She says the watch looses them faster than she can feather them, and I tell her that's rather the purpose of an arrow." } },
      choices = {
        { text = "Does she take that well?", next = "takes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    takes = {
      lines = { { id = "t_default", text = "She throws a fletching jig at me, usually, and then hands me a full quiver. I bring back every shaft I can pull out of a gnoll, and we call that even." } },
      choices = { { text = "A thrifty family. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wall = {
      lines = { { id = "w_default", text = "Because I can do something up there. A sword on a street corner waits for trouble to arrive, but a bow on the wall goes out to meet it at two hundred paces, and I've never been much good at waiting." } },
      choices = { { text = "I know the feeling. Something else.", next = "BACK" } },
    },
    holding = {
      lines = { { id = "ho_default", text = "We're holding, and that's the honest word for it. There are gnolls to the south and west and Blackrock to the north, and Stormwind answers the Magistrate's letters with more letters.", fx = { learn = { "redridge_gnolls" } } } },
      choices = { { text = "Letters won't hold a wall. Something else.", next = "BACK" } },
    },
    shoot = {
      lines = { { id = "s_default", text = "In the gullies, where they think the slope covers them. Get above them before you loose, aim for the ones carrying torches, and the rest lose heart quicker than you'd credit." } },
      choices = { { text = "High ground and torchbearers. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Lakeshire watch, and a Hiett, so I grew up with a bow in my hand. The sword came with the uniform." } },
    redridge_gnolls = { { id = "tp_gn", text = "They're thick in the hills south and west. I've put arrows in a fair few, and there are always more." } },
    _none = { { id = "tp_none", text = "Not my post, not my business. Try the town hall." } },
  },
}

---------------------------------------------------------------------------
-- The Azeroth Commerce Authority camp at Three Corners (Forever): the same Steamwheedle
-- goblins who also work the Durotar Supply and Logistics camp outside the Crossroads.
---------------------------------------------------------------------------

-- Auctioneer Quickcoin (Three Corners): Booty Bay auctioneer with two Bruisers.
P:NPC {
  key = "quickcoin_threecorners", id = TODO_NPC("Auctioneer Quickcoin"), name = "Auctioneer Quickcoin", gender = "male",
  role = "vendor", tier = "service",
  temper = { "greedy" }, values = { "clever" },
  notices = { "race" },
  impression = {
    first = "He talks fast enough that you check your coin purse afterward.",
    third = "{name} met Auctioneer Quickcoin, the goblin who runs auctions for the Azeroth Commerce Authority at Three Corners.",
  },
  greetings = {
    { id = "g_default", text = "Step right up, friend, bids open, fees modest, and the Bruisers don't bite unless you do." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more, pal? I like a customer with a habit." },
  },
  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Another goblin this far from the coast? Don't go settin' up a stall next to mine, sweetheart, I'll know." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! You folks always know what ore's worth, which makes you the worst kind of customer and the best kind of seller." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Quickcoin, auctioneer, Booty Bay licensed and bonded, workin' the Azeroth Commerce Authority's stall here at Three Corners. Everything comin' down the road from Lakeshire, Darkshire and Stormwind goes past this crossroads, so I figured, why not take a little off the top on its way through?" },
      },
      again = {
        { id = "h_again", text = "What else, pal? The bids won't place themselves." },
        { id = "h_again2", text = "Go on, I can talk and count at the same time." },
      },
      choices = {
        { text = "Why Three Corners?", next = "why" },
        { text = "Isn't it dangerous out here, with the gnolls?", next = "gnolls" },
        { text = "Let's see the auctions.", next = "BUSINESS" },
        { text = "What's the Azeroth Commerce Authority, anyway?", next = "aca" },
        { text = "What sells in Redridge?", next = "sells" },
        { text = "Don't you work the Crossroads too?", next = "both" },
        { text = "Lakeshire could use your gold more than you.", next = "lakeshire" },
        { text = "I'm from Stormwind. Do you pay the king's taxes?", next = "taxes", when = { race = "Human" } },
        { text = "Not today.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Three roads, friend, three roads full of folks with things to sell and no time to haul 'em to Stormwind. Guard Parker keeps the gnolls honest, more or less, and the Commerce Authority pays my stall fees, so it's practically a charity, if you squint." } },
      choices = {
        { text = "So you take a cut from Lakeshire's hard times.", next = "BACK", reply = "Hard times need good prices, pal, and I'm the only one offerin' any prices at all. You're welcome, Lakeshire.", fx = { align = { honor = 1 } } },
        { text = "Sound business. Somebody ought to profit out here.", next = "BACK", reply = "Exactly what I keep tellin' the Bruisers! Finally, somebody with vision.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnolls = {
      lines = { { id = "g2_default", text = "Sure it is, which is why I pay those two big fellas, and why my fees have a little line for gnoll-related overhead. Redridge gnolls can't read a contract anyway, so they're terrible customers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    aca = {
      lines = { { id = "ac_default", text = "Bunch of money folks who figured the roads between towns need markets, pal, and markets need auctioneers, and auctioneers need a cut. They pay the stall fees, I run the bids, and everybody pretends the paperwork makes sense." } },
      choices = { { text = "Sounds like a sweet arrangement. Something else.", next = "BACK" } },
    },
    sells = {
      lines = { { id = "se_default", text = "Gnoll paws for the bounty-hunters, iron from the hills, fish from Lake Everstill, and a frankly alarming number of murloc fins. Somebody in Stormwind makes soup out of 'em, and I don't ask, I just take the fee." } },
      choices = {
        { text = "Murloc fin soup?", next = "sells_soup" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_soup = {
      lines = { { id = "ss_default", text = "Some cook in Old Town swears by it, buys the fins by the crate, and pays in good Stormwind silver. I tried a spoonful once, and let's just say my stomach filed a formal complaint with the Cartel." } },
      choices = { { text = "I'll pass on the soup. Something else.", next = "BACK" } },
    },
    both = {
      lines = { { id = "bo_default", text = "Sure I do, the Horde stall outside the Crossroads, and nobody here likes hearin' it. A goblin's got to be in two places at once if he's gonna be rich in either of 'em, pal." } },
      choices = {
        { text = "How do you manage both?", next = "both_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    both_how = {
      lines = { { id = "bh_default", text = "Trade secret, sweetheart, and it involves a zeppelin, a boat, and a cousin who looks a lot like me in bad light. Don't tell the Commerce Authority, they think they're payin' for one of me." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    lakeshire = {
      big = true,
      lines = { { id = "la_default", text = "Whoa, whoa, Lakeshire's got its bridge problems and its gnoll problems, and I'm a businessman, not a charity. You think a fella in my line ought to give it away?" } },
      choices = {
        { text = "Yes. Folk here are struggling, and you're profiting.", next = "BACK", reply = "Ugh, a conscience. Fine, fine, I'll waive the fee on one bridge plank. One.", fx = { align = { light = 1 } } },
        { text = "No. Charity makes poor business.", next = "BACK", reply = "Exactly! Charity's for priests, pal, and priests don't bid.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    taxes = {
      lines = { { id = "ta_default", text = "Taxes? I'm Booty Bay licensed, pal, and the Cartel's got an understanding with your king's tax men. The understanding is that I don't understand them, and they don't understand me, and everybody stays friendly." } },
      choices = { { text = "Very convenient. Something else.", next = "BACK" } },
    },
  },
  topics = {
    redridge = { { id = "tp_redridge", text = "Gnolls, fish, and folks who need a market. My kind of trouble, pal." } },
    steamwheedle = { { id = "tp_sw", text = "Neutral, bonded and very well guarded. That's the Cartel, pal." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, unless there's a percentage in it." } },
  },
}

-- Steamwheedle Courier (Three Corners): Cartel mail-runner for the Commerce Authority camp.
P:NPC {
  key = "sw_courier_threecorners", id = TODO_NPC("Steamwheedle Courier"), name = "Steamwheedle Courier", gender = "male",
  role = "worker", tier = "service",
  temper = { "harried" }, values = { "diligent" },
  greetings = {
    { id = "g_default", text = "Mail! Parcels! Letters to your sweetheart in Goldshire, no questions asked, small fee." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. Send somethin' or move along, pal, I got a schedule." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Steamwheedle Courier, contracted to the Azeroth Commerce Authority, which means I carry their mail and anybody else's who pays. Your letter gets to any mailbox in the kingdom, and the gnolls only got one bag off me this month, which is a personal record." },
      },
      again = {
        { id = "h_again", text = "Anything else? This bag's not gettin' any lighter." },
      },
      choices = {
        { text = "The gnolls steal the mail?", next = "gnolls" },
        { text = "I'll send something.", next = "BUSINESS" },
        { text = "What's the run like to Lakeshire?", next = "run" },
        { text = "You look like you've been chased.", next = "chased" },
        { text = "Do soldiers write home much from here?", next = "letters" },
        { text = "Ever delivered to Darkshire?", next = "darkshire" },
        { text = "Never mind.", next = "END" },
      },
    },
    gnolls = {
      lines = { { id = "g_default", text = "They took one bag, couldn't read a word of it, and ate the seed packets somebody was sendin' to a farm in Elwynn. The sender wants a refund, and I told 'em to take it up with the Redridge Gnolls, care of the hills." },
      },
      choices = {
        { text = "Refund the farmer. It's only fair.", next = "BACK", reply = "Fair? Fair ain't in the small print, pal. But fine, I'll ask the boss, and he'll say no.", fx = { align = { honor = 1 } } },
        { text = "The small print says no refunds. Good for you.", next = "BACK", reply = "That's what I said! Read the small print, folks, it's there for a reason, and the reason is me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    run = {
      lines = { { id = "ru_default", text = "Up the road past the gnoll camps, over the bridge that's always half fixed, and into Lakeshire, where the mayor wants his mail before I've even got off the kodo. Then back again, and then again, until my feet file for retirement." } },
      choices = { { text = "Sounds exhausting. Something else.", next = "BACK" } },
    },
    chased = {
      lines = { { id = "ch_default", text = "Because I was, pal, by a gnoll with a club and a terrible sense of humour. He chased me halfway to the bridge, and then he stopped to eat a seed packet, which saved my life, so I owe that farmer in Elwynn a thank-you note." } },
      choices = { { text = "Send it free of charge.", next = "BACK", reply = "Free? Ha! I'll knock off a copper, that's my best gratitude rate." } },
    },
    letters = {
      lines = { { id = "le_default", text = "All the time. The guards up at Lakeshire write to mothers in Stormwind, and the mothers write back about eating proper meals. I deliver it all, and I gotta say, the mothers are right, those guards are skinny." } },
      choices = {
        { text = "Do you ever deliver bad news?", next = "letters_bad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters_bad = {
      lines = { { id = "lb_default", text = "Sometimes, yeah, when a guard don't come back from the hills and the captain writes to his folks. Those ones I deliver quick and I don't charge extra, and don't you tell the boss, 'cause that's comin' out of my own pocket." } },
      choices = {
        { text = "That's decent of you.", next = "letters_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters_stance = {
      big = true,
      lines = { { id = "ls_default", text = "Decent's bad for business, pal. You think a goblin's got any business bein' soft like that?" } },
      choices = {
        { text = "Yes. Some things are worth more than a fee.", next = "BACK", reply = "Yeah, yeah, don't spread it around. I got a reputation for bein' a jerk, and it took years.", fx = { align = { light = 1 } } },
        { text = "No. Charge for the bad news too.", next = "BACK", reply = "Cold, pal, real cold. You'd make a great Cartel accountant.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkshire = {
      lines = { { id = "da_default", text = "Once, and never again if I can help it, because the woods out there are full of things that ain't alive and ain't dead either. The Night Watch signed for the parcel with a hand that was shakin', and they're the ones who live there." } },
      choices = { { text = "I'll keep that in mind. Something else.", next = "BACK" } },
    },
  },
  topics = {
    mail = { { id = "tp_mail", text = "It gets there, mostly. The gnolls take a cut now and then." } },
    _none = { { id = "tp_none", text = "No idea, pal, I just carry the bags. Ask the auctioneer, he's got an opinion on everything with a price." } },
  },
}
