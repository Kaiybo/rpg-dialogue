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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hello again. Stand on the old course, if you would; it's set, and so's my good opinion of you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'd sooner you stayed off the bridge. Say what you need, and mind the fresh stone on your way out." },
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
        { text = "Where did you learn to lay stone?", next = "ylearn" },
        { text = "Does anything about the work worry you?", next = "yworry" },
        { text = "Where did you get that plumb line?", next = "e3_plumb" },
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
    ylearn = {
      lines = {
        { id = "yle_default", text = "In Stormwind, rebuilding the city walls after the Second War, under the Stonemasons' Guild. I was a boy carrying mortar buckets, and an old master named Thane Kellar taught me to true a course by eye. Then the guild's wages stopped, and most of the crew went west angry." },
        { id = "yle_dwarf", when = { race = "Dwarf" }, text = "In Stormwind, rebuilding the walls under the Stonemasons' Guild. There was a dwarf on our crew from Ironforge who could true a course by the sound of the chisel. I never managed it, but I still listen." },
      },
      choices = {
        { text = "You didn't go west with them?", next = "ywest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywest = {
      narr = "He runs his thumb along a joint in the stone, slowly, and doesn't look up.",
      lines = { { id = "ywe_default", text = "No. Some of those men are Defias now, Kellar among them, I hear. The nobles cheated them, and I've never said otherwise. But I'd sooner build a bridge for folk who need it than burn one for the ones who wronged me. Was I right, do you think?" } },
      choices = {
        { text = "You were. Building is better than burning.", next = "BACK", reply = "I hope so. I tell myself it every morning.", fx = { align = { honor = 1 } } },
        { text = "They had cause. You might have stood with them.", next = "BACK", reply = "Maybe. I've wondered it on long nights.", fx = { align = { honor = -1 } } },
      },
    },
    yworry = {
      lines = { { id = "ywo_default", text = "The third pier. The Foreman wants it raised before the rains, and the footing's not had the time it needs to settle. If it shifts, the whole span shifts with it. I've told him, and he says we haven't the luxury of time with orcs in the hills." } },
      choices = { { text = "I hope it holds. Something else.", next = "BACK" } },
    },
    e3_plumb = {
      lines = {
        { id = "e3_plumb_l0", text = "From the master who taught me on the Stormwind walls, the day I finished my first course true. It's a lead bob on a waxed cord, nothing special to look at, but he said a man who owns his own plumb can never blame the line for a crooked wall." },
      },
      choices = {
        { text = "Is your old master still in Stormwind?", next = "e3_plumb2" },
        { text = "It's served you well, by the look of the bridge.", next = "BACK" },
      },
    },
    e3_plumb2 = {
      lines = {
        { id = "e3_plumb2_l0", text = "He died the winter before the guild broke, which I've sometimes thought was a mercy. He'd not have gone west with the others, and he'd not have stayed quiet either, and I don't know which would have finished him first." },
      },
      choices = {
        { text = "He'd be proud of this bridge. Something else.", next = "BACK" },
        { text = "Some men are spared the worst.", next = "BACK" },
      },
    },
  },
  topics = {
    oslow = { { id = "yt_oslow", text = "Foreman Oslow shouts and works harder than any of us. I'd lay stone for him anywhere." } },
    defias = { { id = "yt_defias", text = "Some of my old guild went to Westfall and took up the red mask. I don't hold with it, but I understand it." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, {class}. I'd trust you on the wall with a bow beside me, and I don't say that often." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Move along, {class}. I've a good eye, and it'll be on you until you leave." },
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
    d6_learn = {
      lines = { { id = "d6_learn_a", text = "On the lakeshore, shooting at bottles Kimberly set on the dock posts, and she'd make me fetch every arrow that went in the water. I learned to hit the bottle fast, because the lake's cold in spring." } },
      choices = {
        { text = "I'm a hunter. What's your longest shot?", next = "d6_learn2", when = { class = "HUNTER" } },
        { text = "Does the watch train its own archers?", next = "d6_learn2" },
        { text = "Cold water's a good teacher.", next = "d6_learn2" },
      },
    },
    d6_learn2 = {
      lines = {
        { id = "d6_learn2_a", text = "Not enough of them, and that's the trouble. Most of the watch are farmers with swords, and I've put a bow in the hands of six this season, and four of them can hit a gnoll now, which is four more than before." },
        { id = "d6_learn2_hunter", when = { class = "HUNTER" }, text = "Two hundred paces, from the west wall to a gnoll on the far ridge, with the wind behind me. It's the only shot I've ever boasted about, so I'll thank you to remember it and not ask me to repeat it." },
      },
      choices = {
        { text = "Four more archers is no small thing.", next = "BACK" },
        { text = "Something else, guard.", next = "BACK" },
      },
    },
    d6_marris = {
      lines = { { id = "d6_marris_a", text = "He's hard, and he's fair, and his curfew keeps children off the streets at night, whatever the grumblers say. He lost a whole company up at Stonewatch, and he hasn't stopped trying to get them back." } },
      choices = {
        { text = "Bravo Company, you mean?", next = "d6_marris2" },
        { text = "Hard men make for safe towns.", next = "d6_marris2" },
        { text = "Let's leave the Marshal be.", next = "BACK" },
      },
    },
    d6_marris2 = {
      lines = { { id = "d6_marris2_a", text = "Bravo Company, aye, Keeshan's lot, lost behind the Blackrock lines. Marris goes up the tower every night and looks toward Stonewatch, and the watch pretend not to see him, because we all know what he's looking for." } },
      choices = {
        { text = "Then someone should go and find them.", next = "BACK", fx = { learn = { "blackrock" } } },
        { text = "Something else, Hiett.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", text = "Guard Hiett, Lakeshire watch. I keep this post by day and a place on the wall when the horn goes, and of the two I'd choose the wall." } },
      again = {
        { id = "h_again", text = "Anything else? Make it short." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
        { text = "Lakeshire's watch keeps the gnolls out, so its rules should be kept.", next = "BACK", reply = "They should, and the Marshal's earned that much. Tell it to the farmhands who sneak out past curfew.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Marris's curfew does more harm than the gnolls do.", next = "BACK", reply = "Say that after you've seen a farmhand dragged off the road at night. The curfew stays, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Hiett? Like the fletcher?", next = "kim" },
        { text = "Why do you prefer the wall?", next = "wall" },
        { text = "How is the watch holding up?", next = "holding" },
        { text = "Where do the gnolls hide from arrows?", next = "shoot", when = { class = "HUNTER" } },
        { text = "Have you lost friends on the wall?", next = "ylost" },
        { text = "What would Lakeshire need to win?", next = "ywin" },
        { text = "Where did you learn to shoot?", next = "d6_learn" },
        { text = "What do you make of Marshal Marris?", next = "d6_marris" },
        { text = "What's the west wall like on a bad night?", next = "e3_wall" },
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
    ylost = {
      narr = "She checks the string of her bow, though it doesn't need checking.",
      lines = { { id = "ylo_default", text = "Two this season. Corwin took a gnoll spear on the west wall, and old Tam went out after a lost calf and we found his lantern in the morning. I don't count them aloud. Kim does, and it's harder on her than on me." } },
      choices = { { text = "I'm sorry. Something else.", next = "BACK" } },
    },
    ywin = {
      lines = {
        { id = "ywi_default", text = "Fifty more bows and a wall that doesn't leak, or a strike force up to Stonewatch to burn out the Blackrock. Marris wants to wait for Stormwind. I want to go now, with whoever will come. Which would you choose?" },
        { id = "ywi_orc", when = { race = "Orc" }, text = "Odd, asking that of an orc. Fifty more bows, or a strike on Stonewatch. Your Horde has nothing to do with the Blackrock, I'm told. Well then, which would you choose?" },
      },
      choices = {
        { text = "Wait for Stormwind's soldiers. Hold the wall.", next = "BACK", reply = "That's the Marshal's answer. Sensible, and slow.", fx = { align = { order = 1 } } },
        { text = "Go now. Waiting is how towns burn.", next = "BACK", reply = "Finally, someone with sense. Find me when you're ready.", fx = { align = { order = -1 } } },
      },
    },
    e3_wall = {
      lines = {
        { id = "e3_wall_l0", text = "Wet, mostly, since it leaks at the joint by the third post and nobody's had the stone to mend it. The gnolls come up the gully below it in the dark, and you shoot at the sound of them, and in the morning you go down and count what you hit." },
      },
      choices = {
        { text = "How do you aim at a sound?", next = "e3_wall2" },
        { text = "That's grim work, Hiett.", next = "BACK" },
      },
    },
    e3_wall2 = {
      lines = {
        { id = "e3_wall2_l0", text = "You learn where the gully bends, and you loose at the bend when the stones start rattling. Kimberly says it's a waste of arrows, and then she counts the gnoll paws in the morning and goes quiet." },
        { id = "e3_wall2_l1", when = { class = "HUNTER" }, text = "You'll know already, I'd guess: learn the ground by day and loose at the bend when the stones rattle. Kimberly calls it wasted arrows until she counts the paws at dawn." },
      },
      choices = {
        { text = "Then it works. Something else.", next = "BACK" },
        { text = "Fix the leak first.", next = "BACK" },
      },
    },
  },
  topics = {
    kimberly = { { id = "yt_kim", text = "Kimberly Hiett feathers our arrows, and complains about how fast we lose them. She's right to." } },
    marris = { { id = "yt_marris", text = "Marshal Marris is a careful man. Too careful, some nights." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Well, well, my favourite repeat bidder! Step right up, pal, because you're the kind of customer who keeps my Bruisers bored." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Fees are fees, pal, posted and final, and the Bruisers have your description." },
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
        { text = "An auction's only worth anything if every bid is honest.", next = "BACK", reply = "Honest bids, honest fees, honest Bruisers! Trust is the cheapest overhead a house can buy, pal.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A few fake bids push the price up nicely.", next = "BACK", reply = "Whoa, whoa, not so loud, pal! Shill bidding is a Cartel fine, and fines come outta my cut.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why Three Corners?", next = "why" },
        { text = "Isn't it dangerous out here, with the gnolls?", next = "gnolls" },
        { text = "Let's see the auctions.", next = "BUSINESS" },
        { text = "What's the Azeroth Commerce Authority, anyway?", next = "aca" },
        { text = "What sells in Redridge?", next = "sells" },
        { text = "Don't you work the Crossroads too?", next = "both" },
        { text = "Lakeshire could use your gold more than you.", next = "lakeshire" },
        { text = "I'm from Stormwind. Do you pay the king's taxes?", next = "taxes", when = { race = "Human" } },
        { text = "Tell me about your two Bruisers.", next = "e3_bruisers" },
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
    e3_bruisers = {
      lines = {
        { id = "e3_bruisers_l0", text = "Gorgo and Little Pete, pal, both on the Cartel payroll and both worth every copper, which is a lot of coppers. Gorgo's the big one, and Little Pete's the bigger one, and neither of 'em has said more than six words in a row since I hired 'em." },
      },
      choices = {
        { text = "Who pays them, you or the Cartel?", next = "e3_bruisers2" },
        { text = "Six words is plenty for a bruiser.", next = "BACK" },
      },
    },
    e3_bruisers2 = {
      lines = {
        { id = "e3_bruisers2_l0", text = "Me, out of my cut, and the Cartel takes a cut of my cut for the privilege of lendin' 'em, which is what you call a vertical margin. I'm workin' on a deal where they pay me for the fresh air, but so far Gorgo just looks at me." },
      },
      choices = {
        { text = "Good luck with that. Something else.", next = "BACK" },
        { text = "Pay them properly, Quickcoin.", next = "BACK" },
      },
    },
  },
  topics = {
    redridge = { { id = "tp_redridge", text = "Gnolls, fish, and folks who need a market. My kind of trouble, pal." } },
    steamwheedle = { { id = "tp_sw", text = "The Cartel? Sells to everybody, owes nobody, and charges a fee for the privilege, pal. Best family a goblin ever had." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if it ain't up for auction, I ain't gonna start now." } },
  },
}

-- Steamwheedle Courier (Three Corners): Cartel mail-runner for the Commerce Authority camp.
P:NPC {
  key = "sw_courier_threecorners", id = TODO_NPC("Steamwheedle Courier"), name = "Steamwheedle Courier", gender = "male",
  role = "worker", tier = "service",
  temper = { "harried" }, values = { "diligent" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hey, it's my favourite sender! Got a parcel for me, pal? I'll squeeze ya in between the Goldshire run and the Darkshire one." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Send somethin' or move along, pal, 'cause every minute you stand there costs me copper." },
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
        { id = "h_again", text = "Anything else? Quick, pal, this bag's heavy and the gnolls can smell parcels." },
      },
      choices = {
        { text = "The gnolls steal the mail?", next = "gnolls" },
        { text = "I'll send something.", next = "BUSINESS" },
        { text = "What's the run like to Lakeshire?", next = "run" },
        { text = "You look like you've been chased.", next = "chased" },
        { text = "Do soldiers write home much from here?", next = "letters" },
        { text = "Ever delivered to Darkshire?", next = "darkshire" },
        { text = "Who's the strangest customer you've had?", next = "ystrange" },
        { text = "What's in the bag today?", next = "e3_bag" },
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
    ystrange = {
      narr = "He sets the mailbag down and leans on it like an old friend.",
      lines = {
        { id = "yst_default", text = "Old fella at Three Corners who sends a letter to his wife every week, pal, and she's buried in the Goldshire churchyard. Pays full rate every time. I deliver it to the headstone, because a paid letter gets delivered, and don't let anybody tell you goblins ain't got standards." },
        { id = "yst_horde", when = { faction = "Horde" }, text = "Old fella at Three Corners who writes his dead wife every week and pays full rate. I deliver it to the headstone in Goldshire. You Horde folk think goblins ain't got standards? A paid letter gets delivered." },
      },
      choices = { { text = "That's oddly touching. Something else.", next = "BACK" } },
    },
    e3_bag = {
      lines = {
        { id = "e3_bag_l0", text = "Letters for Lakeshire, a parcel o' seed for some farm in Elwynn that I'm guardin' with my life this time, and a sealed tube for the Magistrate that I'm not allowed to shake. I shook it anyway, pal, and it rattles, so it's either a map or a very small rocket." },
      },
      choices = {
        { text = "Why aren't you allowed to shake it?", next = "e3_bag2" },
        { text = "Don't shake it again.", next = "BACK" },
      },
    },
    e3_bag2 = {
      lines = {
        { id = "e3_bag2_l0", text = "On account of it's got a wax seal from Stormwind Keep, and the last courier who opened one of those lost his licence and his eyebrows. I just deliver, sweetheart, and whatever's inside is the Magistrate's headache, not mine." },
      },
      choices = {
        { text = "Wise courier. Something else.", next = "BACK" },
        { text = "You'd make a poor spy.", next = "BACK" },
      },
    },
  },
  topics = {
    darkshire = { { id = "yt_dark", text = "Darkshire's mail I'll carry for double, and only in daylight. Read the small print, pal." } },
    steamwheedle = { { id = "yt_steam", text = "The Steamwheedle Cartel takes a cut of every stamp in the kingdom. It's a beautiful business, pal." } },
    three_corners = { { id = "yt_three", text = "Three Corners is where Elwynn, Redridge and Duskwood meet, and where my feet go to complain." } },
    lakeshire = { { id = "yt_lake", text = "Lakeshire's mayor wants his mail before I've even got off the kodo. Fine fella, terrible handwriting." } },
    gnolls = { { id = "yt_gnolls", text = "The Redridge gnolls stole one bag and ate the seed packets. Somewhere in those hills there's a very confused gnoll farm." } },
    mail = { { id = "tp_mail", text = "It gets there, mostly. The gnolls take a cut now and then." } },
    _none = { { id = "tp_none", text = "No idea, pal, I just carry the bags. Ask the auctioneer, he's got an opinion on everything with a price." } },
  },
}
