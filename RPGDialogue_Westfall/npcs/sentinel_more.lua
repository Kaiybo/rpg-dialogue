-- More of Sentinel Hill: the two trade-goods sellers, the stable master and the bread merchant.
-- Voice: bibles/sentinel_more.md
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Christopher Hewen: trade supplies (thread, dye, flux, spice) for a hill at war.
P:NPC {
  key = "hewen", id = TODO_NPC("Christopher Hewen"), name = "Christopher Hewen", title = "Trade Supplies",
  bible = "bibles/sentinel_more.md", role = "vendor", tier = "service",
  communities = { "sentinel_hill" }, temper = { "wry" }, values = { "practical", "craft" },
  notices = { "craft" },
  impression = {
    first = "He says the hill is mending more than it's making lately.",
    third = "{name} met Christopher Hewen, who sells trade goods on Sentinel Hill and keeps an eye on what the militia mends.",
  },
  greetings = {
    { id = "g_goods", text = "Thread, dye, flux and spice. If you make things, I've what you need, and if you mend things, I've more of it." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more thread? The militia bought me out of the coarse stuff again, so it'll have to be the fine." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Do you know how many torn tabards I see in a week? Stay a month and you'd never want for work." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've the forearms of a smith. There's flux in that crate, and an anvil out back the militia beats on when they've a mind to." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The thread sales say so, because folk are patching old clothes instead of sewing new. Your spirits might help them heal, in their way." } },
      choices = {
        { text = "Mending is a kindness. Keep the thread flowing, Christopher.", next = "BACK", reply = "It is, and it keeps me in business, which is a kindness of another sort. I'll keep the spools coming as long as the wagons do.", fx = { align = { light = 1 } } },
        { text = "Mending is weakness. Make something new.", next = "BACK", reply = "New cloth costs coin nobody on this hill has, friend. I've patched Gryan's own cloak four times, and he's never once complained of the wind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Black thread and dark dye, I'd guess, and the quieter sort of needle, though I'd sooner not know why you want them. Half the Defias were stonemasons once, and they bought their thread from men like me, so I've learned not to ask what a customer is mending." },
      },
      choices = {
        { text = "I'm mending my cloak, Hewen, nothing more. You'll see coin.", next = "BACK", reply = "Then mend away, and I'll take the coin gladly and believe every word. Mostly.", fx = { align = { honor = 1 } } },
        { text = "Best not ask, then. And best not count your spools.", next = "BACK", reply = "I count them every night, friend, and I'll count them twice tonight. Pleasure doing business.", fx = { align = { honor = -1 } } },
        { text = "Something else, Hewen.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not this month, because they're mending more than they're making. A tabard that's been in a fight is a tabard that needs thread, and the militia's tabards have been in a lot of fights." } },
      choices = {
        { text = "Then I'll buy some thread and mend my own.", next = "BACK", reply = "That's the spirit, and you'll find my thread holds better than the militia's tailoring. Mind the needle.", fx = { align = { order = 1 } } },
        { text = "I'll get a new tabard when this one's done.", next = "BACK", reply = "Then you'll be back for thread soon after, I'd wager. Tabards don't last long on this hill.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than anyone, because the Goretusk hides sell in Stormwind if they're cured right. My salt goes to the hunters or to Salma's kitchen, and I can never decide which matters more." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps sniffing at my salt. Good thing it's not the dye, or we'd both be blue." },
      },
      choices = {
        { text = "I'll cure the hides properly and sell them fairly.", next = "BACK", reply = "That's how it's done, and Stormwind will pay you properly for it. You'll want plenty of salt.", fx = { align = { honor = 1 } } },
        { text = "I'll sell them raw. It's quicker.", next = "BACK", reply = "Quicker, aye, and they'll stink before you reach the Westbrook Garrison. Cure them, friend, trust me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Mage robes, is it? You'll want the dyed linen, then, since the Stormwind tailors swear the colour holds an enchantment better, though I've never seen a scrap of proof. I'll sell it to you either way, and gladly." } },
      choices = {
        { text = "Proof matters. I'll test it before I believe it.", next = "BACK", reply = "A careful customer, and a rare one. Test away, and let me know if the tailors were lying.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If it feels right, it works. That's half of magic.", next = "BACK", reply = "Then you'll like the blue, which feels very magical, I'm told. I'll wrap it for you.", fx = { align = { order = -1 } } },
        { text = "How's trade on the hill?", next = "thread" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "The darkest I've got is a black from Duskwood that stains your hands for a week, and I'll not ask what it's for. Folk on this hill have enough to fear without me selling the cloth to make them fear it more." } },
      choices = {
        { text = "It's for robes, nothing more. Rest easy.", next = "BACK", reply = "Then I'll rest easy, and so will the hill. Black robes are in fashion with your sort, I hear.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear keeps the Defias off this hill too.", next = "BACK", reply = "Maybe, but it keeps the farmers awake too. I'll sell you the dye and say no more about it.", fx = { align = { light = -1 } } },
        { text = "Do the wagons still get through?", next = "wagons" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Slower than the tabards, I'd say, since you can't stitch a man back together with thread. The ones who've buried someone stop buying anything but the plainest wool, and I see more of that every month." } },
      choices = {
        { text = "Then I'll go among them and help them grieve.", next = "BACK", reply = "That'd be kind, and they'd be glad of it, though they'd never say so. They buy wool and stare at nothing.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grief passes. Better they keep busy than mourn.", next = "BACK", reply = "Maybe it does, for some, but the plain wool keeps selling. I don't think it's passing fast.", fx = { align = { light = -1 } } },
        { text = "Something else, Christopher.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I blame the men who wouldn't pay them first, and the masons second, but I blame them all the same. A wrong done to you doesn't give you the right to burn your neighbour's barn." } },
      choices = {
        { text = "The masons must answer for their crimes, grievance or not.", next = "BACK", reply = "They must, and they will, one way or another. I only hope the nobles answer too, someday.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stormwind cheated them first. I'd have done the same.", next = "BACK", reply = "Then I hope you'd have spared the farmers, at least. The masons didn't.", fx = { align = { order = -1 } } },
        { text = "Something else, Christopher.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Precious little, since the madder and the woad grew on the farms and the farms grew dust. I buy most of it from Elwynn now, and the bit that grows wild up here gives a brown so dull the militia say it suits them." } },
      choices = {
        { text = "Then sow dye crops again. Someone has to start.", next = "BACK", reply = "Someone does, and I'd cheer whoever tried it. Not many plant dye, though, when they can't even plant wheat.", fx = { align = { order = 1 } } },
        { text = "Leave the wild plants be. Dull brown is honest enough.", next = "BACK", reply = "Honest it is, and the militia agree. I'll keep selling it as rustic.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Christopher Hewen, trade supplies. I can tell you how Sentinel Hill's doing by what it buys from me, and this month it's all thread and no dye." },
        { id = "h_stonemason", when = { topicKnown = "stonemasons" },
          text = "You've heard about the masons, then. Some of them bought their chalk and line from me once, before the city stopped paying them. I sold to them gladly, and now I wish I hadn't." },
        { id = "h_deadmines", tags = { "news" }, when = { deed = "dungeon:The Deadmines" },
          text = "Word is you went under Moonbrook and came back. The militia's been buying dye this week, to paint their shields, and I've not sold dye in a year." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, out in the dust! I've no gears or springs, I'm sorry to say, only thread and flux. You'll have to make do with plain old human trade." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Thread and flux, I'm afraid, nothing for the sword; but if you've a torn tabard, I've a needle." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Salt for the hides, I'd guess, and maybe a needle for the leather; I've both, and not much else." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want plain thread for mending robes, I'd guess, and there's a lot of mending on this hill." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. If your tabard's torn, I've a needle and gold thread both, though the gold costs extra." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I'd wager you can tell me which weeds on this hill still give a decent colour, because I've stopped being able to." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You crept up on my stall, and I'll be counting my spools when you go, no offence meant." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! The hill's mending more than making these days. If your spirits mend too, you'll be busy." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a crate to unpack, if it hasn't been robbed." },
        { id = "h_again2", text = "Go on. I'm counting spools, but I can count and listen." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What sells best on the hill these days?", next = "thread" },
        { text = "Your goods must come a long way to get here.", next = "wagons" },
        { text = "I worked these fields before the thieves came.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I'll need fine thread for robes, Christopher.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'll need dark dye, the darkest you have.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Nobody here seems to buy anything but thread.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the hunters here buy much salt, Hewen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You say the hill is mending. Are its people mending too?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you blame the Stonemasons for what Westfall became?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does Westfall still give you for dyes, Hewen?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What would sell best to someone in my line of work?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Sentinel Hill seems to mend more than it makes, Christopher.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },
    thread = {
      lines = { { id = "t_default", text = "Thread's for mending and dye's for making new. A town that's growing buys dye, and a town that's holding on buys thread. We've been holding on for a long while." } },
      choices = {
        { text = "Then let's give them reason to buy dye.", next = "BACK", fx = { affinity = 1, standing = { sentinel_hill = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagons = {
      lines = { { id = "w_default", text = "By wagon from Stormwind, the same as Lewis's, and robbed on the same road. I've started packing spools at the bottom under the turnips, since thieves don't steal turnips." } },
      choices = {
        { text = "Who loses more, you or Lewis?", next = "wagons_gina" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagons_gina = {
      big = true,
      lines = { { id = "wg_default", text = "Lewis, but he writes it down, so it feels worse. Gina MacGregor and I split what gets through, though some days I'd sooner the Defias had it than argue with her over a crate of salt." } },
      choices = {
        { text = "Share fairly. The hill needs you both.", next = "BACK", reply = "I'll try, though she makes it difficult. You're right, the hill does need us both.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Take the bigger share when she isn't looking.", next = "BACK", reply = "Ha, and have her find out? I'd sooner face the Defias. I'll share fair, thank you.", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmhand = {
      lines = { { id = "f_default", text = "Did you? Then you'll have bought your twine from a peddler on the old farm road, and so did everyone else. I'd like to sell twine to farmers again, one day, instead of bowstrings to soldiers." } },
      choices = { { text = "One day you will.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },
  topics = {
    deadmines = { { id = "tp_deadmines", text = "The Defias are holed up in the mines under Moonbrook, and they're buying more thread than this whole hill. Sails, I'd guess, though what they want with sails underground I couldn't tell you." } },
    booty_bay = { { id = "tp_booty_bay", text = "The best dye in the world comes out of Booty Bay, red as a sunset and twice as dear. I'd stock it, but the Bloodsail would want it too, and they've a better way of getting it than paying." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I bought a bolt of cloth at the Darkmoon Faire that changed colour in the moonlight, and I've never seen its like since. I made it into a shirt, and I still don't know which colour it is." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes used to sell me flux that never failed, back when they had a city to make it in. Since Gnomeregan fell, I make do with dwarven flux, which works, but not with any charm." } },
    background = { { id = "tp_bg", text = "I sell trade goods on a hill full of soldiers. That's about all there is to know about me." } },
    advice = { { id = "tp_ad", text = "Learn to mend your own gear. Out here, nobody's coming to do it for you." } },
    trade = { { id = "tp_trade", text = "I sell thread, dye, flux, salt and spice, which is what keeps a crafter working.", next = "thread" } },
    defias = { { id = "tp_defias", text = "They were customers once, some of them. That's the part that sticks in my throat." } },
    stonemasons = { { id = "tp_masons", text = "They were good men with chalk on their sleeves, and I sold them line for their plumb bobs, and look where the line led." } },
    _none = { { id = "tp_none", text = "If it isn't sold by the spool or the pinch, I couldn't tell you." } },
  },
}

-- Gina MacGregor: the other trade-goods seller; William MacGregor's relative (relation unstated).
P:NPC {
  key = "gina", id = TODO_NPC("Gina MacGregor"), name = "Gina MacGregor", title = "Trade Supplies",
  bible = "bibles/sentinel_more.md", role = "vendor", tier = "service",
  communities = { "sentinel_hill" }, temper = { "brisk" }, values = { "practical", "family" },
  notices = { "craft", "hunger", "lock_stones" },
  impression = {
    first = "She drives a hard bargain and doesn't apologise for it.",
    third = "{name} met Gina MacGregor, who sells trade goods on Sentinel Hill and drives a hard bargain for them.",
  },
  greetings = {
    { id = "g_goods", text = "Spices, salt, thread and dye. The price is the price, friend, and it came down the Westfall road to get here." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Buying, or just hoping I'll have changed my prices?" },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook, are you? Salma Saldean buys her spices from me when she can get up the hill, and she'd tell you to buy the mild ones." },
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half starved and twice robbed. Mike Miller's got bread over there; buy that first and come back to me." },
    { id = "n_lock_healthstone", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "That's a healthstone in your pocket, and I'd stock them if I could, because the militia's always bleeding. Since I can't, keep it close and use it on a farmer if you find one dying." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "He does, and he'll go broke for it. I charge what the road costs me, and your spirits should understand that." } },
      choices = {
        { text = "A fair price for a dangerous road is honest, Gina.", next = "BACK", reply = "It is, and I'll not apologise for it. The road doesn't care how kind Christopher is.", fx = { align = { honor = 1 } } },
        { text = "Undercut him and take his customers.", next = "BACK", reply = "He's doing that himself, friend. I'd rather he stayed in business so I've someone to complain about.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Your sort pay, mostly, because you've other things to worry about than a copper here and there, and I like that in a customer. What I don't like is that thing sniffing at my cloth, so keep it back from the stall and we'll do business at the full price." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Warlocks pay, mostly, and I like that in a customer, but your demon's standing close enough to my cloth that I can smell the sulphur in the weave already. Step it back two paces from the stall and we'll do business at the full price." },
      },
      choices = {
        { text = "Fair terms, Gina. I'll keep it back.", next = "BACK", reply = "Good, then we'll get along. Keep the beast where I can see it.", fx = { align = { order = 1 } } },
        { text = "Full price for that? Perhaps my companion should do the haggling.", next = "BACK", reply = "The little beast can decide, and the price stays the same. Try me.", fx = { align = { order = -1 } } },
        { text = "Something else, Gina.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Badly, because they think it's a fight, and they come at it head on. A trade's not a fight; it's a dance, and I've been dancing longer than you've been swinging, so pay the price and save us both the trouble." } },
      choices = {
        { text = "I'll pay your price and save the trouble.", next = "BACK", reply = "Wise choice, and you'll not regret it. Here's your thread.", fx = { align = { order = 1 } } },
        { text = "I'll haggle, and I'll win this time.", next = "BACK", reply = "You'll haggle, and I'll smile, and the price will stay where it is. Go on, then.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because mine's from the coast and his is from a wagon, and mine doesn't have dirt in it. A hide cured with dirty salt goes off in a week, and then you'll come back to me anyway, so save yourself the walk." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because mine's from the coast and his is from a wagon, and mine doesn't have dirt in it. Your {pet} keeps nosing at my stall, mind, and if it eats anything, you're paying for it." },
      },
      choices = {
        { text = "I'll buy the good salt. The hides deserve it.", next = "BACK", reply = "Good choice, and you'll thank me when the hides fetch a fair price. Clean salt, clean coin.", fx = { align = { order = 1 } } },
        { text = "I'll buy the cheap salt and take my chances.", next = "BACK", reply = "Your coin, your hides, and your stink in a week. Come back when it goes off.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "I'd sell you water if you were thirsty, but I'll not trade good thread for something that vanishes come morning. Bring me silver, which doesn't." } },
      choices = {
        { text = "Silver it is, then. I'll count it twice.", next = "BACK", reply = "Count it as many times as you like; the price won't change. Good doing business.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pity. Conjured coin would've fooled you.", next = "BACK", reply = "It might have, but I'd have found out by morning and found you by noon. Silver, please.", fx = { align = { honor = -1 } } },
        { text = "Why are your prices so high?", next = "price" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "No, and don't look at me like that, because if I gave it away there'd be no stall next month for anyone. William gives enough away for the both of us, and somebody in this family has to count." } },
      choices = {
        { text = "Charity has its own worth, Gina. Think on it.", next = "BACK", reply = "I think on it every day, priest, while I count. Somebody in this family has to.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. An empty stall helps no one.", next = "BACK", reply = "Exactly, and I'm glad someone on this hill sees it. Kindness doesn't pay for the next wagon.", fx = { align = { light = -1 } } },
        { text = "Something else, Gina.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Two lads from the militia, when Gryan can spare them, and when he can't, we hope the Defias are busy elsewhere. That's in the price too, if you were wondering." } },
      choices = {
        { text = "Then I'll ride with the next wagon myself.", next = "BACK", reply = "Would you? Then that wagon gets through, and I'll take a little off the risk. Not the price, mind.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hire your own guards. The militia has bigger work.", next = "BACK", reply = "With what, friend, the coin I make on thread? The militia helps when it can.", fx = { align = { honor = -1 } } },
        { text = "Something else, Gina.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only when the seller can tell me exactly where they picked them, because I've been sold Westfall weeds as Elwynn peacebloom before. You I'd trust a little more, since you'd know a weed from a flower at twenty paces." } },
      choices = {
        { text = "Good. Honest trade starts with honest goods.", next = "BACK", reply = "It does, and I'm glad you understand. Bring me something real, and I'll pay what it's worth.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Weeds or flowers, if it sells, it sells.", next = "BACK", reply = "It sells once, and then never again. I'll not deal in weeds.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gina MacGregor. I sell trade goods, and I sell them for what they cost to bring here, which is more than Christopher charges and exactly what they're worth." },
        { id = "h_stew", when = { questActive = TODO_QUEST("Westfall Stew") },
          text = "Making Westfall Stew for Salma? Then you'll want a pinch of salt, since murloc eyes taste of nothing and vulture tastes of worse." },
        { id = "h_watchers", when = { questDone = TODO_QUEST("The Killing Fields") },
          text = "You smashed Saldean's scarecrows, didn't you? He came up the hill to buy seed for the first time in a year, and seed's a hopeful thing for a Westfall man to buy." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf will haggle, I know that much. Go on, then, and we'll see which of us gives way first. It won't be me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior at my stall. You'll haggle, I suppose, like everyone else, and you'll lose, like everyone else." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want salt, I suppose, and I'll sell it for exactly what it's worth, which is more than Christopher charges." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll ask me for charity, I suppose, and I'll say no, but you're welcome to ask." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Honest folk, your sort, so you'll pay what it's worth and not haggle, I hope." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'll say before you ask that I don't take payment in acorns, however blessed they are, so bring coin." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Whatever you're after, I don't sell soul shards, so don't ask, and I don't buy them either." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. My prices are fair, considering every spool came down a road full of thieves. Your spirits won't haggle, I hope." },
      },
      again = {
        { id = "h_again", text = "Anything else? Haggling's thirsty work, and I've had no water since dawn." },
        { id = "h_again2", text = "Go on, I'm listening, though not to offers below cost." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Why charge more than the other stall?", next = "price" },
        { text = "You must be kin to William, the bowyer.", next = "william" },
        { text = "Surely you could knock a few coppers off.", next = "haggle", when = { any = { { race = "Dwarf" }, { race = "Gnome" }, { class = "ROGUE" } } } },
        { text = "Would you take conjured water in trade, Gina?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Warriors must haggle well, Gina.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why is your salt dearer than Christopher's, Gina?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever give to those who can't pay, Gina?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does anyone guard the wagons that bring your goods?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever buy wild herbs, Gina, or only crated goods?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the folk who smell of sulphur pay your prices, Gina?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the other trader undercharge, Gina?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    price = {
      big = true,
      lines = { { id = "p_default", text = "Because one wagon in two gets here, and someone has to pay for the other one. Christopher eats his losses and calls it kindness. I'd rather still be selling next year." } },
      choices = {
        { text = "Hard roads cost coin. Your price is fair.", next = "BACK", reply = "It is, and I'm glad someone says so. Christopher will learn eventually.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Then I'll buy from Christopher and let him eat the loss.", next = "BACK", reply = "Then he'll go broke, and you'll be back here. Your choice.", fx = { align = { honor = -1 }, affinity = -1, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    william = {
      lines = { { id = "w_default", text = "Everyone asks that, and Will and I let them guess. He makes the bows and I sell the string to make them with, and we've never once argued about the price." } },
      choices = {
        { text = "He says strings are always extra.", next = "william_string", when = { heardLine = "macgregor.h_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    william_string = {
      lines = { { id = "ws_default", text = "He would say that! The strings are extra because they're mine, and he won't give away a thing that isn't his. That's the most generous thing about him." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } } },
    },
    haggle = {
      lines = { { id = "hg_default", text = "Not one copper, and not for that face, either. Go and ask Christopher; he'll give you a discount and then complain to me about it all evening." } },
      choices = { { text = "Worth a try. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "The goblins of Booty Bay know how to haggle, and I learned from one of them when I was a girl. Hewen never did, so he's always undercharging and I'm always right." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias are buying thread and canvas from somebody, and I'd bet my stall it's going down into the Moonbrook mines. I don't sell to them, but somebody does, and that somebody is undercharging, I'd wager." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire drives a harder bargain than any goblin, and I've the empty purse to prove it. I respect them for it, though I'll not go back." } },
    background = { { id = "tp_bg", text = "I've sold goods on this hill since the militia came. Before that I sold them to farmers, and they haggled harder." } },
    advice = { { id = "tp_ad", text = "Buy salt. It keeps meat, it keeps wounds clean, and it keeps its price." } },
    trade = { { id = "tp_trade", text = "I sell spice, salt and thread at an honest price for a dishonest road.", next = "price" } },
    defias = { { id = "tp_defias", text = "They've robbed me more often than they've robbed Lewis, and he gets all the sympathy." } },
    _none = { { id = "tp_none", text = "Not my trade, friend, and not my business. Ask at the inn." } },
  },
}

-- Kirk Maxwell: the stable master. In this era, stable masters keep hunters' beasts.
P:NPC {
  key = "kirk", id = TODO_NPC("Kirk Maxwell"), name = "Kirk Maxwell", title = "Stable Master",
  bible = "bibles/sentinel_more.md", role = "stablemaster", tier = "service",
  communities = { "sentinel_hill" }, temper = { "calm" }, values = { "kind", "patient" },
  notices = { "pet" },
  impression = {
    first = "He thinks the animals are the only sensible folk in Westfall.",
    third = "{name} met Kirk Maxwell, the stable master of Sentinel Hill, who keeps hunters' beasts safe while the hill fights.",
  },
  greetings = {
    { id = "g_stable", text = "Easy, now. Keep your voice low near the stalls; half of them came in skittish." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Bringing someone in, or taking someone out? Either way, they've been well looked after." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet}'s favouring a paw. Thorns, likely, from the scrub by the Dagger Hills; let me look before you go." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They sense everything, and they're calmer around you. Your spirits must speak in the same low voice I use." } },
      choices = {
        { text = "Then keep the beasts calm, Kirk. They deserve it.", next = "BACK", reply = "They do, and I'll keep at it. You've a gentle way about you, too.", fx = { align = { order = 1 } } },
        { text = "Beasts are beasts. They don't need calming.", next = "BACK", reply = "Maybe not to you, but they think otherwise. A calm horse lives longer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not the spells so much as what comes after, the cold in the air and that sharp smell like a storm about to break. The hunters' beasts smell it first and go to the back of the stall, and the militia horses just put their ears flat and wait, the way old soldiers do." },
      },
      choices = {
        { text = "I'll keep my distance and let them rest.", next = "BACK", reply = "That's kind of you, and they'll thank you by not kicking. Downwind, if you can.", fx = { align = { light = 1 } } },
        { text = "They'll learn to live with it. Everyone does.", next = "BACK", reply = "They learn to live with all sorts, aye, but it's no reason to make them. I'd thank you to keep back.", fx = { align = { light = -1 } } },
        { text = "Something else, Kirk.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Raids and fire and men falling off them, and some of them don't settle now when they hear steel. A warrior who rides one will need a soft hand, because they've been through as much as their riders." } },
      choices = {
        { text = "I'll ride gently. They've earned it.", next = "BACK", reply = "Then you'll get the best ride out of them they've got. They know a kind hand.", fx = { align = { honor = 1 } } },
        { text = "A horse should be used to steel. I'll ride hard.", next = "BACK", reply = "They'll throw you, then, and I'll not blame them. Gently, or not at all.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Then you're quieter than the Defias, who've been trying to rob my stable since spring and never once got past the old grey mare. She bites, and she knows a stranger's step." } },
      choices = {
        { text = "I'd never steal a farmer's horse.", next = "BACK", reply = "Good, because the grey mare would make sure you didn't. She's a fine judge of character.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Good mare. I'd have tried the back gate.", next = "BACK", reply = "The back gate has a goose, friend, and the goose is worse than the mare. I'll take that as a compliment.", fx = { align = { honor = -1 } } },
        { text = "What beasts do you keep?", next = "beasts" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "No, and I can see why, since there's a smell on you like a struck match and they don't care for it. Stand downwind of the stalls and speak low, and they'll get used to you, same as they got used to me." } },
      choices = {
        { text = "I'll stand downwind. They've been through enough.", next = "BACK", reply = "That's decent of you, and they'll come round. Give them time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They'll learn to fear me. That's fine.", next = "BACK", reply = "Then they'll fear you, and you'll never get a good ride out of one. Your loss, friend.", fx = { align = { light = -1 } } },
        { text = "Can anyone tame the vultures?", next = "beasts_vulture" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The horses take ill of their memories more than anything, and I don't know whether a prayer reaches a horse. Try it on the grey in the end stall if you like, because he startles at shadows and he's earned some peace." } },
      choices = {
        { text = "Every creature deserves comfort. I'll sit with him a while.", next = "BACK", reply = "That's a kindness, and he'll know it, I think. Sit low and speak soft.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A horse that's broken should be put down, Kirk.", next = "BACK", reply = "Not while I keep this stable, he won't be. He's done his share and more.", fx = { align = { light = -1 } } },
        { text = "Something else, Kirk.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They'd carry you, but they'd not like the clank, and they'd like the charging even less, since they've seen what waits at the end of one. You'll want a proper charger for that, trained to it from a foal." } },
      choices = {
        { text = "They've earned their rest. I'll walk rather than ask it.", next = "BACK", reply = "That's the right of it, and they'd thank you if they could. I'll find you a charger elsewhere.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A horse is a tool, Kirk. Saddle one anyway.", next = "BACK", reply = "He's not a tool, he's a horse, and he's had enough of charging. I'll not saddle him for that.", fx = { align = { honor = -1 } } },
        { text = "Something else, Kirk.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Go on, then, and talk low, because the grey in the end stall was at Moonbrook when the Defias burned it and he's not forgotten the smell. If you can get him to eat from your hand, you'll have done more than I have in a month." } },
      choices = {
        { text = "He served the militia. He's earned whatever time he needs.", next = "BACK", reply = "That's what I've been telling Gryan, and it's good to hear from someone who knows beasts. Thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A horse that bolts gets riders killed. Retire him.", next = "BACK", reply = "Retire him, aye, but not put him down. He'll rest here as long as I do.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Kirk Maxwell. I keep the stables, which on this hill means hunters' beasts and the odd militia horse that's seen too much." },
        { id = "h_human_hunter", when = { race = "Human", class = "HUNTER" },
          text = "A human hunter. There weren't many of you when I started, but Westfall's making more of them, since a farmer who's lost his farm still knows how to track." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "Kaldorei keep their animals closer than we do, I've heard, more like kin than stock. I'll keep yours the way you'd want, then." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Quiet, now. They've all settled, except the boar in the end stall, and he's never settled in his life." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll be wanting a horse, I suppose, but I've only militia horses here, and they've seen too much." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The horses settle around your sort, I've noticed, and maybe they know something I don't." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want a warhorse one day, I suppose, but these lads have seen too much for charging." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The horses went quiet when you walked up, which is either a very good sign or a very bad one, and I'll take it as good." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Mind the horses, they don't care for sparks, and one bolted last week at a cookfire." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The animals like you; I can hear it. They're the only sensible folk in Westfall, you know." },
      },
      again = {
        { id = "h_again", text = "Anything else? Gently, though; they're listening." },
        { id = "h_again2", text = "Go on. I'll keep brushing while you talk." },
      },
      choices = {
        { text = "The stable, please.", next = "BUSINESS" },
        { text = "What beasts do hunters bring you here?", next = "beasts" },
        { text = "Does any horse here have a story?", next = "horse" },
        { text = "What would you tame, out here?", next = "tame", when = { class = "HUNTER" } },
        { text = "Horses don't spook when I sneak up on them.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Animals don't like me much, Kirk.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Your militia horses look like they've been through the wars, Kirk.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your animals ever take ill, Kirk? I could pray over them.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could one of your militia horses carry a paladin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Let me sit with your most skittish horse. Beasts tend to trust me.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do my spells unsettle your animals, Kirk?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your animals seem to sense the spirits, Kirk.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just looking in.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "Coyotes from the plains and goretusks, mostly, and the odd vulture somebody swore they could train. The vultures never settle, but nobody's had the heart to tell the hunter, so I just keep them fed." } },
      choices = {
        { text = "Can a vulture be trained?", next = "beasts_vulture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_vulture = {
      lines = { { id = "bv_default", text = "Not by anyone I've met. They'll follow you, mind, but only because they're waiting for you to fall over." } },
      choices = { { text = "Comforting. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    horse = {
      big = true,
      lines = { { id = "h2_default", text = "The grey in the end stall carried a rider out of Moonbrook the night the thieves took it, and he won't go south of the hill since. The militia wants him put to work, and I say he's done his share." } },
      choices = {
        { text = "He's earned his rest. Keep him.", next = "BACK", reply = "I will, and I'll thank you for saying it. The militia can find another horse.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Everyone works on this hill, horses included.", next = "BACK", reply = "Everyone does, but some have already done their work. He's one of them.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame = {
      lines = { { id = "t_default", text = "A goretusk, if you want something that won't quit. They're ugly and bad-tempered, and they'll stand in front of you till they drop, and you can't say that of every soldier on this hill." } },
      choices = { { text = "I'll find a good one.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    deadmines = { { id = "tp_deadmines", text = "The Defias steal horses for their carts into the Moonbrook mines, and I've lost two good mares to them already. I'd like them back, but I'd settle for knowing they're being fed." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has a stable full of beasts I've never seen the like of, striped and spotted and stranger. I'd give a year's wages to tend them for a single night." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammers ride gryphons the way we ride horses, without saddles, and they talk to them the same way I talk to my beasts. I've great respect for them, and none at all for anyone who kicks a mount." } },
    ratchet = { { id = "tp_ratchet", text = "A hunter came back from Ratchet with a raptor that bit everything it saw except him. I've never been so frightened in my own stable, and never so impressed." } },
    background = { { id = "tp_bg", text = "I keep the animals while the people fight. Someone has to, and I'm better with animals." } },
    advice = { { id = "tp_ad", text = "Water your beast before yourself. It's carrying more than you are." } },
    moonbrook = { { id = "tp_moonbrook", text = "Ask the grey in the end stall. He won't go near the place, and I don't blame him.", next = "horse" } },
    _none = { { id = "tp_none", text = "Couldn't say. If it's not in a stall, it's not my business." } },
  },
}

-- Mike Miller: the bread merchant.
P:NPC {
  key = "miller", id = TODO_NPC("Mike Miller"), name = "Mike Miller", title = "Bread Merchant",
  bible = "bibles/sentinel_more.md", role = "vendor", tier = "service",
  communities = { "sentinel_hill" }, temper = { "rueful" }, values = { "kind", "practical" },
  notices = { "hunger" },
  impression = {
    first = "He bakes with Elwynn flour, and the irony isn't lost on him.",
    third = "{name} met Mike Miller, who sells bread on Sentinel Hill from flour that has to come all the way from Elwynn.",
  },
  greetings = {
    { id = "g_bread", text = "Fresh this morning, or fresh yesterday. On this hill that counts as fresh." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Good, because I bake for two hundred and sell to twenty, and the gulls get the rest." },
  },
  notice = {
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "You've the look of someone who's been eating dust. Take a roll; you can pay me when you've stopped shaking." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It troubles me every day, because Westfall fed the kingdom once and now Elwynn feeds Westfall. If your earth spirits can wake these fields, I'd bake with their wheat again." } },
      choices = {
        { text = "Then let's help Westfall grow again, Mike.", next = "BACK", reply = "Let's, and I'll bake the first loaf from it myself. That'd be a day to remember.", fx = { align = { light = 1 } } },
        { text = "The fields are dead. Accept it.", next = "BACK", reply = "Maybe, and I'll keep baking with Elwynn flour. But I'll not stop hoping.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The ones in masks don't, because they've got their own kitchens down in the mine, I'm told. The hungry ones without masks do, and I put the day-old loaves out back for them and don't ask questions, since stealing bread never made a man a villain in my book." },
      },
      choices = {
        { text = "That's decent of you, Mike, and I'll pay for mine.", next = "BACK", reply = "Bless you, and I'll take the coin gladly. There's not many who'd say that.", fx = { align = { honor = 1 } } },
        { text = "Day-old loaves? The masked ones eat better than that.", next = "BACK", reply = "Maybe they do, but the hungry ones don't. I'll keep putting out the loaves.", fx = { align = { honor = -1 } } },
        { text = "Something else, Mike.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because there isn't any, not since the Defias burned the fields and the farmers fled. I buy flour from Elwynn and bake it here, and every loaf reminds me what we lost." } },
      choices = {
        { text = "I'll fight so Westfall grows its own wheat again.", next = "BACK", reply = "Do that, and I'll bake you the first loaf of Westfall wheat in years. Light knows I'd like to.", fx = { align = { honor = 1 } } },
        { text = "Elwynn flour is good enough. Let the past go.", next = "BACK", reply = "It's good flour, but it's not ours. I'll not let go just yet.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Goretusk, if there's a hunter about, and nothing but bread if there isn't. A sandwich with boar in it keeps a man on watch all night, and a sandwich without keeps him grumbling." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Goretusk, if there's a hunter about, and nothing but bread if there isn't. Your {pet} wants my bread too, I see, though some of them only pretend to eat it." },
      },
      choices = {
        { text = "I'll keep the militia in meat.", next = "BACK", reply = "Then the militia will sleep with full bellies. You'll be the hill's favourite.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt for my own table, thank you.", next = "BACK", reply = "Fair enough, and I'll keep the bread coming. They'll grumble, but they'll eat.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "So I've heard, and so the soldiers tell me every time they buy a loaf, as if I'd not heard it the first hundred times. Conjured bread has no crust worth the name, and there's no man in Westfall who'll call it a proper loaf." } },
      choices = {
        { text = "A proper loaf deserves a proper oven.", next = "BACK", reply = "It does, and mine's the only proper one on the hill. Come and smell the crust.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bread's bread, Mike. Hunger doesn't care.", next = "BACK", reply = "It doesn't, but a man can tell the difference. Buy a real loaf; you'll see.", fx = { align = { order = -1 } } },
        { text = "Where does your flour come from?", next = "flour" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "One just like it ate a sweet roll off my counter last week, and I'll thank you not to tell me it was a different one. Keep it on your shoulder and off my shelves." } },
      choices = {
        { text = "I'll pay for anything it takes.", next = "BACK", reply = "Good, then we'll get along. I'll keep the sweet rolls out of reach anyway.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It was hungry, and your shelves were open.", next = "BACK", reply = "It was, and it was rude. Keep it on your shoulder, please.", fx = { align = { honor = -1 } } },
        { text = "Who buys your bread?", next = "eaters" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They do, and I send them down to Salma's, because she gives it away and I'd go under in a week if I did. I keep the burnt loaves aside for them, though, and nobody's ever complained about the burnt bits." } },
      choices = {
        { text = "Then bake a few unburnt ones for them too, Mike.", next = "BACK", reply = "I might, if business picks up. I'll think on it, priest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burnt loaves are kindness enough. Business is business.", next = "BACK", reply = "It is, for now. I'm a baker, not a saint.", fx = { align = { light = -1 } } },
        { text = "Something else, Mike.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Peace on the roads, and farmers who'd dare to plant without wondering who'll harvest. The Defias, the gnolls and the walking scarecrows all need clearing first, and I'm a baker, so I'll leave that to you." } },
      choices = {
        { text = "Then I'll clear them, field by field.", next = "BACK", reply = "Then I'll bake with your wheat someday. Go careful, friend.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The farms are lost. Bake with Elwynn flour and be glad.", next = "BACK", reply = "Glad, aye, and grateful. But I'll miss our own wheat until I'm gone.", fx = { align = { honor = -1 } } },
        { text = "Something else, Mike.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The old men say the soil's still good a foot down, and it's only the top that's dead and blowing, so maybe it could. But nobody will plough a field the Defias can burn in a night, and nobody will stop the Defias while the fields are empty." } },
      choices = {
        { text = "Then break the Defias first. Fields follow safety.", next = "BACK", reply = "That's the order of it, and I'll trust you to start. Bring me peace, and I'll bring the bread.", fx = { align = { order = 1 } } },
        { text = "Plant anyway. Waiting for safety means waiting forever.", next = "BACK", reply = "Brave talk, and maybe someone will listen. I'll bake for whoever plants first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Mike Miller, bread merchant. Westfall used to feed half the kingdom, and now I bake with flour that comes by wagon from Elwynn. Put that in a song, somebody." },
        { id = "h_farmhand", when = { origin = "human_westfall_farmhand" },
          text = "You're from round here, aren't you? Then you'll remember when the mills on the Westfall streams still turned. I miss the noise of them more than I'd ever have thought." },
        { id = "h_fields", when = { questDone = TODO_QUEST("The Killing Fields") },
          text = "Saldean's got his fields back from the walking scarecrows, they say. If he grows wheat again, I'll buy every sack and bake till my arms fall off." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Do your folk eat bread, where you come from? Try a roll and tell me. If it's terrible, tell me kindly." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want bread, I suppose, and I'll sell you a loaf, though I wish I'd baked it from Westfall wheat." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll be bringing in meat, I hope, so the militia have something to put between my bread." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Bless the bread if you like, Light knows it could use the help after coming all that way from Elwynn." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll be wanting bread for the road, and a fair bit of it, by the size of that armor." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I don't suppose you could make wheat grow in Westfall again, could you, because I'd write that song myself." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Light-footed one, aren't you? I nearly dropped the tray, and that's a day's flour on the floor." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Bread from Elwynn flour, in the breadbasket of the kingdom. Ironic, isn't it? Your spirits might laugh." },
      },
      again = {
        { id = "h_again", text = "Anything else? The next batch won't knead itself." },
        { id = "h_again2", text = "Go on. Have a crust while you think." },
      },
      choices = {
        { text = "Let me buy some bread.", next = "BUSINESS" },
        { text = "Where does your flour come from?", next = "flour" },
        { text = "That's a lot of bread for one hill.", next = "eaters" },
        { text = "Blessed bread feeds the soul as well. May I bless today's batch?", next = "bless", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I can conjure bread, you know.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Don't worry, the little thing at my heel won't touch your bread.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why don't you bake with Westfall wheat anymore?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do the militia eat, apart from your bread?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The hungry must come to you when they can't pay, Mike.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would bring the wheat back to Westfall, Mike?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could Westfall's fields ever grow wheat again?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'd guess the Defias come for your bread now and then, Mike.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does it trouble you, selling Elwynn bread in Westfall, Mike?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not hungry, thanks.", next = "END" },
      },
    },
    flour = {
      lines = { { id = "f_default", text = "From Elwynn, because nobody's grown wheat in Westfall since the farms emptied. The fields are full of thieves and those walking scarecrows, and nobody plants where the scarecrows walk." } },
      choices = {
        { text = "Then someone should clear the fields.", next = "flour_fields" },
        { text = "Something else.", next = "BACK", fx = { learn = { "harvest_watchers" } } },
      },
    },
    flour_fields = {
      lines = { { id = "ff_default", text = "Farmer Saldean's been asking for that for a year. Go and see him, if you've the stomach, and tell him Mike sent you, so he'll know at least one man up here's listening." } },
      choices = { { text = "I'll go and see him.", next = "BACK", fx = { affinity = 1, learn = { "harvest_watchers" } } } },
    },
    eaters = {
      big = true,
      lines = { { id = "e_default", text = "The militia, mostly, who don't pay, and Heather's guests, who do. And now and then a farmer who's walked off his land comes asking. I give them the day-old loaves and don't make a fuss." } },
      choices = {
        { text = "That's a decent thing to do.", next = "BACK", reply = "It's the least I can do, and sometimes it's all I can do. Thank you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Charity won't keep your ovens hot.", next = "BACK", reply = "No, but my conscience would go cold without it. A few loaves won't break me.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bless = {
      lines = { { id = "b_default", text = "I'd not say no. The militia eat it in a hurry, standing up, but I'd like to think it does them some good on the way down." } },
      choices = { { text = "There. May it carry them home.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 }, standing = { sentinel_hill = 1 } } } },
    },
  },
  topics = {
    deadmines = { { id = "tp_deadmines", text = "The Defias are dug into the mines under Moonbrook, eating bread made from flour they stole off the farms that should've been making mine. That's the whole tragedy of Westfall, in one loaf." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I sold sweet rolls at the Darkmoon Faire once and ran out by noon. I've never baked so fast in my life, and I've never been so proud of a sore arm." } },
    booty_bay = { { id = "tp_booty_bay", text = "A sailor once told me they bake bread in Booty Bay with coconut, and I nearly believed him until he said it was good. I'll stick with Elwynn wheat, thank you, even if it does come the long way." } },
    holy_light = { { id = "tp_holy_light", text = "I bless every loaf before it goes in the oven, the way my mother taught me. The Light's never burnt a single one, and the oven's burnt a good many." } },
    background = { { id = "tp_bg", text = "I'm a baker. With a name like Miller, folk expect flour on my sleeves, and they're never disappointed." } },
    advice = { { id = "tp_ad", text = "Carry bread, not cake. Cake's lovely until it's crumbs in your pack." } },
    harvest_watchers = { { id = "tp_watchers", text = "They're scarecrows that walk, in fields that should be wheat, and that's Westfall now in a sentence.", next = "flour" } },
    westfall = { { id = "tp_westfall", text = "The kingdom's breadbasket, people used to say. Now it's a basket, and that's about all." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I know flour and fire, and not much else." } },
  },
}

-- Agent Kearnen: an SI:7 agent hidden near a Defias-held watchtower in southern Westfall; meets rogues sent by Mathias Shaw about Klaven's Tower.
P:NPC {
  key = "agent_kearnen", id = TODO_NPC("Agent Kearnen"), name = "Agent Kearnen", gender = "female",
  bible = "bibles/sentinel_more.md", role = "questgiver", tier = "quest",
  communities = { "westfall_farms" }, temper = { "reserved", "clipped" }, values = { "duty", "discretion" },
  notices = { "stealth", "class", "kit" },
  impression = {
    first = "Agent Kearnen watches a Defias-held tower in southern Westfall from cover so good I nearly walked past her. She answers to Mathias Shaw, wastes no words, and plainly would rather not have been found.",
    third = "{name} met Agent Kearnen of SI:7, keeping watch on a Defias tower in southern Westfall.",
  },
  greetings = {
    { id = "g_default", text = "Keep your voice down and step out of the sightline. Now, who told you where to find me?" },
    { id = "g_2", when = { metBefore = true }, text = "You again. You came in from the east this time. Better." },
    { id = "g_3", when = { class = "ROGUE", questActive = TODO_QUEST("Klaven's Tower") }, text = "You know the job. The tower's still there, and so is the chest. Don't come back to chat until it's open." },
  },
  notice = {
    { id = "n_1", cat = "stealth", when = { class = "ROGUE" },
      text = "You moved well coming in, though I heard you at twenty paces. Shaw's people usually manage fifteen." },
    { id = "n_2", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You clank. If you mean to stand here, stand still, and don't let the sun find that breastplate." },
    { id = "n_3", cat = "kit", when = { class = "HUNTER" },
      text = "Keep your animal low and quiet. The Defias in that tower aren't clever, but they do notice a wolf." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Agent Kearnen, and that's all the name you need. I'm watching that tower, and the people in it don't know I'm here, and I intend to leave Westfall with both of those things still true." },
        { id = "hello_2", when = { class = "ROGUE" }, text = "Agent Kearnen, SI:7. If Shaw sent you, you know why I'm here. That tower was the Alliance's once. The Defias hold it now, and a man named Klaven Mortwake keeps something inside that Stormwind wants read." },
        { id = "hello_3", when = { questDone = TODO_QUEST("Klaven's Tower") }, text = "Agent Kearnen. You got Mortwake's journal out of his own chest, under his own nose. I told Shaw as much in my report, in one line, which is as much praise as he reads." },
      },
      again = {
        { id = "hello_again1", text = "Anything else? Be quick about it." },
        { id = "hello_again2", text = "Go on, and keep it low." },
        { id = "hello_again3", text = "Ask." },
      },
      choices = {
        { text = "What's so important about that tower?", next = "tower" },
        { text = "How long have you been watching?", next = "watching" },
        { text = "Skulking in the grass isn't honest soldiering.", next = "skulking" },
        { text = "How do I get into the tower?", next = "getin", when = { class = "ROGUE" } },
        { text = "What was in Mortwake's journal?", next = "journal", when = { class = "ROGUE", questDone = TODO_QUEST("Klaven's Tower") } },
        { text = "Does Sentinel Hill know you're out here?", next = "sentinel" },
        { text = "Who is Klaven Mortwake?", next = "mortwake" },
        { text = "I was never here.", next = "END" },
      },
    },
    tower = {
      lines = {
        { id = "tower_1", text = "It was a watch post on the south road, when Stormwind still kept soldiers in Westfall. The Defias took it without a fight and put their own guards on every floor. They don't garrison a ruin for the view, so something inside is worth guarding.", fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "What do you think it is?", next = "inside" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inside = {
      lines = {
        { id = "inside_1", text = "Papers. Mortwake writes things down, which is a weakness in his trade and a gift to mine. Names, routes, who's paid and who's promised. I can't get at it alone without being seen, which is why Shaw sends me help." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    watching = {
      lines = {
        { id = "watching_1", text = "Long enough to know the guard changes, and which of them drinks, and which one sleeps on the third landing. I eat cold and I sleep in pieces. It's not a complaint; it's the work." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    skulking = {
      big = true,
      lines = {
        { id = "skulking_1", text = "No, it isn't. Honest soldiering lost this tower. Stoutmantle's militia would charge it, and half of them would die on the stairs, and Mortwake would burn his papers before they reached the top. I'd rather be thought a sneak and get the papers." },
      },
      choices = {
        { text = "Some fights are won by whoever isn't seen.", next = "BACK", reply = "That's the trade. Glad to hear someone say it without a sneer.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Deceit is deceit, whoever it serves.", next = "BACK", reply = "Tell that to the farmers they've robbed. Then tell me a cleaner way.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    getin = {
      lines = {
        { id = "getin_1", text = "Not by the door. The drones that patrol outside carry a key; lift it off one without waking the rest. Inside, stay off the centre of the stair, and don't fight Mortwake if you can help it. The chest is at the top. Open it, take the journal, and leave the way you came." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    journal = {
      lines = {
        { id = "journal_1", text = "That's for Shaw to say, not me. I'll tell you he read it twice and then sent three riders out before dawn. Whatever you carried down those stairs, it's moved more of SI:7 than I've seen move in a year." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinel = {
      lines = {
        { id = "sentinel_1", text = "Stoutmantle knows there's someone. He doesn't know who, or where, and he's had the sense not to ask. His militia are brave and loud, and I need them to stay well north of here until this is done." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mortwake = {
      lines = {
        { id = "mortwake_1", text = "A Defias lieutenant, quick with a blade and quicker to run, who holds that tower for VanCleef. He's vain, and he keeps a journal. If he'd been a duller man I'd have nothing to steal." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I work for Stormwind, in the part of it that doesn't wear a tabard. That's all there is to tell." } },
    defias = { { id = "tp_defias", text = "Stonemasons once, thieves now, and better organised than the crown admits. They've a leader with a grievance and a plan, and I'd like to read the plan." } },
    advice = { { id = "tp_advice", text = "Count the guards twice, and then look for the one you didn't count." } },
    rumors = { { id = "tp_rumors", text = "I don't deal in rumour. I deal in what I've seen, and I've seen wagons going into Moonbrook that don't come out." } },
    westfall = { { id = "tp_westfall", text = "Dry fields and empty houses. Good country to hide in, which is the trouble." } },
    _none = { { id = "tp_none", text = "I've no information on that. If I had, I'd likely not share it." } },
  },
}

-- Protector Bialon: a militiaman at Sentinel Tower who stands guard over the Defias Traitor.
P:NPC {
  key = "protector_bialon", id = TODO_NPC("Protector Bialon"), name = "Protector Bialon", title = "The People's Militia", gender = "male",
  bible = "bibles/sentinel_more.md", role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "watchful", "gruff" }, values = { "duty", "justice" },
  notices = { "soldier", "class", "kit" },
  impression = {
    first = "Protector Bialon guards the Defias Traitor at Sentinel Tower and has not taken his eyes off the man in days. He was a farmer until the Brotherhood took his land, and he guards their turncoat with a farmer's long memory.",
    third = "{name} met Protector Bialon of the People's Militia, who guards the Defias Traitor at Sentinel Hill.",
  },
  greetings = {
    { id = "g_default", text = "Stand back from the prisoner, if you please. You can talk to him, but you'll do it where I can see your hands." },
    { id = "g_2", when = { metBefore = true }, text = "You again. He's still here, and so am I." },
    { id = "g_3", when = { questActive = TODO_QUEST("The Defias Brotherhood") }, text = "You're the one Stoutmantle's sending out with him. Then listen; he walks in front, always, and you don't turn your back." },
  },
  notice = {
    { id = "n_1", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A real soldier. Stoutmantle will want you. We've pitchforks and courage here, and not enough of either." },
    { id = "n_2", cat = "class", when = { class = "ROGUE" },
      text = "I know your sort by the walk. You may be on our side, and I'll still thank you to stay an arm's length from my prisoner." },
    { id = "n_3", cat = "kit", when = { maxLevel = 12 },
      text = "You're green for Westfall, friend. Stay inside the tower's shadow until you've better gear than that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Protector Bialon, People's Militia. That man there wore the red mask until last week, and now he says he'll lead us to their hideout. Stoutmantle believes him. I believe him as far as this spear reaches." },
        { id = "hello_2", when = { questDone = TODO_QUEST("The Defias Brotherhood") }, text = "Protector Bialon, People's Militia. So the traitor kept his word, and you saw to the rest. I was wrong about him, by a little. I'd have stood here another year to be wrong like that." },
      },
      again = {
        { id = "hello_again1", text = "What else? I'm watching him, but I can listen." },
        { id = "hello_again2", text = "Go on." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "Why did he turn on the Defias?", next = "turned" },
        { text = "What was your life before the militia?", next = "before" },
        { text = "A traitor once is a traitor always.", next = "traitor" },
        { text = "Any advice for escorting him?", next = "escort", when = { questActive = TODO_QUEST("The Defias Brotherhood") } },
        { text = "How does the militia train?", next = "train", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Who else guards the tower?", next = "others" },
        { text = "Has he tried to run?", next = "run" },
        { text = "Keep a close watch, Protector.", next = "END" },
      },
    },
    turned = {
      lines = {
        { id = "turned_1", text = "He says he'd had enough of robbing farmers. I'd say he fell out with somebody over his share. Either way he knows where they've gone to ground, and that's worth feeding him for.", fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "before_1", text = "I'd forty acres south of the Molsen farm, and wheat on thirty. The Defias came for the harvest and then for the house. I walked to Sentinel Hill with my wife and a hoe, and Stoutmantle gave me a spear for the hoe." },
      },
      choices = {
        { text = "Will you go back?", next = "goback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goback = {
      lines = {
        { id = "goback_1", text = "When it's safe, and not a day before. The harvest watchers are walking my rows now, those straw things with the scythes. Whoever set them loose out there, I mean to see him answer for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    traitor = {
      big = true,
      lines = {
        { id = "traitor_1", text = "That's what I said to Stoutmantle. He said a man who's done wrong has to be let turn round somewhere, or he never will. I don't know that I agree. But I've not put my spear through the fellow, so I suppose I've agreed that far." },
      },
      choices = {
        { text = "Stoutmantle's right. People must be allowed to change.", next = "BACK", reply = "Maybe so. It's a hard thing to grant the man who burned your barn.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Use him, then hang him. He's earned no mercy.", next = "BACK", reply = "I've thought it. Stoutmantle would have my tabard for saying it aloud.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    escort = {
      lines = {
        { id = "escort_1", text = "Keep him in front and keep moving. His old friends will come out of the hedges when they see who you're with, and they'll go for him first. If he dies, the hideout dies with him, so you fight for him whether you like him or not." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    train = {
      lines = {
        { id = "train_1", text = "At dawn, in the yard, with whatever came off the farms. Captain Danuvin drills us in the line and Stoutmantle teaches us when to break it. We're not the king's army. But the king's army isn't here, and we are." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_1", text = "Dutfield walks the foot of the tower, Gariel has the door, and Weaver's up top with the best eyes in Westfall. There are more of us down by the mill. Every one was a farmer or a farmer's child a year ago." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    run = {
      lines = {
        { id = "run_1", text = "Once, the first night, as far as the gate. Gariel had him by the collar before he'd cleared the wall. Since then he's sat very quiet, and I've come to think he's more afraid of his old friends than he is of us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "A wheat farmer, with a spear. There's a great many of us in Westfall now." } },
    people_militia = { { id = "tp_people_militia", text = "Stoutmantle made soldiers of farmers because nobody else would come. We hold this hill, and we mean to take back the rest." } },
    advice = { { id = "tp_advice", text = "Don't trust a mask, and don't trust a man who's just taken one off. Watch his hands." } },
    rumors = { { id = "tp_rumors", text = "The traitor mutters about a mine under Moonbrook, and a door at the back of it. He says no more until Stoutmantle's listening." } },
    westfall = { { id = "tp_westfall", text = "Good soil, once the dust is laid. I'll plough it again, and I'll do it with this spear across my back." } },
    _none = { { id = "tp_none", text = "Couldn't say. My whole job's standing here, and I've not looked at much else." } },
  },
}

-- Protector Weaver: the militia's lookout on top of Sentinel Tower.
P:NPC {
  key = "protector_weaver", id = TODO_NPC("Protector Weaver"), name = "Protector Weaver", title = "The People's Militia", gender = "male",
  bible = "bibles/sentinel_more.md", role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "quiet", "far-sighted" }, values = { "vigilance", "home" },
  notices = { "travel", "class", "soldier" },
  impression = {
    first = "Protector Weaver keeps the lookout on top of Sentinel Tower and can name every farm in Westfall by the shape of its roof. Most are empty now, and he watches them anyway, as if they might be lit again.",
    third = "{name} met Protector Weaver, the People's Militia's lookout atop Sentinel Tower.",
  },
  greetings = {
    { id = "g_default", text = "You've a head for heights, climbing up here. Mind the edge; the wind comes off the sea without warning." },
    { id = "g_2", when = { metBefore = true }, text = "Back up the stairs again. I saw you on the road an hour ago, by the dust." },
    { id = "g_3", when = { timeOfDay = "night" }, text = "Careful, there's no rail. At night I watch for fires, and there are always fires." },
  },
  notice = {
    { id = "n_1", cat = "travel", when = { minLevel = 20 },
      text = "You've come a long road, and lately from the south, by the colour of that dust. Was there smoke over Moonbrook when you passed?" },
    { id = "n_2", cat = "class", when = { class = "HUNTER" },
      text = "You've a hunter's eyes. Look south-west, past the second windmill, and tell me if that's a wagon or a trick of the heat." },
    { id = "n_3", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A soldier, up my tower. Stoutmantle's below, if it's work you want. If it's the view, you're welcome to it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Protector Weaver, People's Militia. From up here I can see the Dagger Hills, the coast, and near every farm between. I watch for dust on the roads and smoke on the fields, and I shout down to Stoutmantle when I see either." },
        { id = "hello_2", when = { origin = "human_westfall_farmhand" }, text = "Protector Weaver, People's Militia. You're Westfall born, I can hear it. Then you'll know which roofs I mean when I say there's a dozen I look at every dawn, hoping for chimney smoke." },
      },
      again = {
        { id = "hello_again1", text = "Something else? I can talk, so long as I keep looking." },
        { id = "hello_again2", text = "Go on. My eyes are busy, but my ears aren't." },
        { id = "hello_again3", text = "Aye?" },
      },
      choices = {
        { text = "What can you see from up here?", next = "see" },
        { text = "How do you tell friend from foe at that distance?", next = "tell" },
        { text = "Watching won't win Westfall back.", next = "watching" },
        { text = "Can you see the old Saldean place from here?", next = "saldean", when = { origin = "human_westfall_farmhand" } },
        { text = "That's a wagon, with outriders.", next = "wagon", when = { class = "HUNTER" } },
        { text = "What have you seen lately that worries you?", next = "worries" },
        { text = "Which farms are still worked?", next = "farms" },
        { text = "Keep a sharp eye, Protector.", next = "END" },
      },
    },
    see = {
      lines = {
        { id = "see_1", text = "North to the river and the Elwynn woods, west to the lighthouse on a clear day, south to the roofs of Moonbrook. The whole of Westfall, near enough. It was all gold, once, at this season, and now it's the colour of a dry bone.", fx = { learn = { "westfall" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tell = {
      lines = {
        { id = "tell_1", text = "By how they move. Farmers walk the road. Our patrols walk it in pairs. The Defias cut across the fields in a line, quick, and they never raise dust if they can help it. And the gnolls don't care who sees them." },
      },
      choices = {
        { text = "And the harvest watchers?", next = "watchers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watchers = {
      lines = {
        { id = "watchers_1", text = "Those I know by the glint, when the sun catches the blades. They walk the rows back and forth, as if there were still a crop to bring in. I've watched one work an empty field for a week. I'd pity it if it hadn't killed the farmer.", fx = { learn = { "harvest_watchers" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    watching = {
      big = true,
      lines = {
        { id = "watching_1", text = "No, it won't. But Stoutmantle can't be everywhere with sixty militia, and I can tell him where to be. Twice this month a patrol's reached a farm before the Defias did, because I saw their dust." },
      },
      choices = {
        { text = "Knowing where to strike is half the battle.", next = "BACK", reply = "That's what Stoutmantle says. I'm glad it sounds true from someone else.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "You're hiding on a tower while others fight.", next = "BACK", reply = "I've said that to myself, on quiet days. Then I see dust, and I've no time for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    saldean = {
      lines = {
        { id = "saldean_1", text = "I can. There's smoke from the chimney every morning, and Salma's washing on the line. It's one of the few I don't have to worry about, and I look at it first, for luck." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wagon = {
      lines = {
        { id = "wagon_1", text = "Is it? Then your eyes are better than mine. A wagon with outriders, off the road, heading for Moonbrook. That's no farmer. Go down and tell Captain Danuvin, would you? He'll want it before it reaches the hills." },
      },
      choices = {
        { text = "I'll tell him. Something else.", next = "BACK" },
      },
    },
    worries = {
      lines = {
        { id = "worries_1", text = "Lights at Moonbrook, late, where there should be nobody. And wagons going in heavy and coming out light. Whatever the Defias are building down there, they're feeding it timber and iron by the cartload." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    farms = {
      lines = {
        { id = "farms_1", text = "The Saldeans', north of here. The Furlbrows are camped by the road with their cart, which isn't the same as farming. Beyond that it's militia fields round this hill and nothing else. I can count the working chimneys on one hand." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "My family farmed by the Gold Coast Quarry. I learned the land from our roof, mending thatch, and I've been looking at it from above ever since." } },
    people_militia = { { id = "tp_people_militia", text = "Sixty farmers and Gryan Stoutmantle. From up here we look like very little. We've held, though." } },
    advice = { { id = "tp_advice", text = "Watch the dust, not the road. Anyone honest raises it and anyone else tries not to." } },
    rumors = { { id = "tp_rumors", text = "The lighthouse keeper's lamp has been going out and coming back at odd hours. I've told Stoutmantle. He says the keeper's been dead for years." } },
    defias = { { id = "tp_defias", text = "They move at dusk and at dawn, when the light's flat. They know exactly how well I can see, and I don't like how they know." } },
    _none = { { id = "tp_none", text = "I've not seen that from here, and if I can't see it from here, I don't know it." } },
  },
}

-- Protector Dutfield: patrols the foot of Sentinel Tower and fights off the gnolls that come too close.
P:NPC {
  key = "protector_dutfield", id = TODO_NPC("Protector Dutfield"), name = "Protector Dutfield", title = "The People's Militia", gender = "male",
  bible = "bibles/sentinel_more.md", role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "hearty", "stubborn" }, values = { "courage", "comrades" },
  notices = { "soldier", "kit", "drink" },
  impression = {
    first = "Protector Dutfield walks the foot of Sentinel Tower and charges every gnoll that comes within sight of it. He is still learning the sword, and he makes up the difference by being the first one there.",
    third = "{name} met Protector Dutfield of the People's Militia, who patrols the foot of Sentinel Tower.",
  },
  greetings = {
    { id = "g_default", text = "Ho there! Friend, by the look of you. Good, I've had enough of the other sort for one morning." },
    { id = "g_2", when = { metBefore = true }, text = "You again! Mind the patch by the fence; I've only just finished with a gnoll there." },
    { id = "g_3", when = { timeOfDay = "night" }, text = "Who's that? Step into the torchlight. Ah, it's you. The gnolls like the dark, so I've stopped liking it." },
  },
  notice = {
    { id = "n_1", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now there's somebody who can use that. Watch my swing for a moment, would you, and tell me why I keep hitting the shield and not the gnoll?" },
    { id = "n_2", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You've been in the thick of it! So have I. There's no smith on this hill, only a whetstone in the tower, and you're welcome to it." },
    { id = "n_3", cat = "drink", when = { drunk = true },
      text = "You've been at Heather's ale, I can smell it. Save me a mug. I'm on till dusk, and the gnolls don't care that I'm thirsty." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Protector Dutfield, People's Militia. My round is the foot of the tower, from the gate to the stable and back. The gnolls come up from the south most days to test us, and I go and meet them, so they don't get the notion they can walk in." },
        { id = "hello_2", when = { questDone = TODO_QUEST("The People's Militia") }, text = "Protector Dutfield, and you've fought the Defias for Stoutmantle already, I hear. Then you've done more than half the folk on this hill. Shake my hand; I'd like to be able to say I had." },
      },
      again = {
        { id = "hello_again1", text = "What else? I've a moment before the next one comes sniffing." },
        { id = "hello_again2", text = "Go on, friend." },
        { id = "hello_again3", text = "Aye, ask!" },
      },
      choices = {
        { text = "How often do the gnolls come?", next = "often" },
        { text = "How long have you carried a sword?", next = "sword" },
        { text = "Charging every gnoll will get you killed.", next = "charging" },
        { text = "Show me that swing. I'll tell you what's wrong.", next = "swing", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I'm fighting the Defias for Stoutmantle.", next = "militia", when = { questActive = TODO_QUEST("The People's Militia") } },
        { text = "Who do you stand watch with?", next = "with" },
        { text = "What's the best thing about Sentinel Hill?", next = "best" },
        { text = "Fight well, Protector.", next = "END" },
      },
    },
    often = {
      lines = {
        { id = "often_1", text = "Every day, in twos and threes. Riverpaw, from the hills to the south and east. They come to see if we're still here, and one of us goes out and shows them. I've a tally scratched on the gatepost, and it's past forty." },
      },
      choices = {
        { text = "Why do they keep coming?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "why_1", text = "Captain Danuvin says they're being pushed. Something in the hills has them more afraid of going home than of coming here. I don't like to think what frightens a gnoll, so I mostly don't." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sword = {
      lines = {
        { id = "sword_1", text = "Since the spring. Before that it was a scythe, and I was a fair hand with it. A sword wants you to stab, and my arms want to reap. Captain Danuvin says I fight like a man cutting hay, and that the hay ought to be worried." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    charging = {
      big = true,
      lines = {
        { id = "charging_1", text = "Gariel says so too. But if I wait at the wall, they reach the wall, and there are children in that inn. I'd sooner meet them a hundred paces out and be a bit reckless than be careful on my own doorstep." },
      },
      choices = {
        { text = "That's courage. Somebody has to go out and meet them.", next = "BACK", reply = "Ha! That's it, and I'll tell Gariel you said so.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A dead guard protects nobody. Hold the wall.", next = "BACK", reply = "Aye, you may be right. I'll think on it, the next time, for as long as I can stand still.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    swing = {
      lines = {
        { id = "swing_1", text = "There, like that. Too wide, is it? Captain Danuvin says the same. So I bring it in close, and step as I cut, and keep the shield up while I do. That's three things at once. I was better at one." },
      },
      choices = {
        { text = "You'll get there. Something else.", next = "BACK" },
      },
    },
    militia = {
      lines = {
        { id = "militia_1", text = "Good hunting, then! They wear red masks and they work the roads north and west of here. Bring Stoutmantle their bandanas, and he'll know you're in earnest. I'd come along, only the gnolls would notice I'd gone." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    with = {
      lines = {
        { id = "with_1", text = "Bialon, who's got the prisoner and a face like thunder. Gariel on the door, who's cleverer than the pair of us. And Weaver up top, who sees the gnolls before I do and shouts which way to run." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = {
        { id = "best_1", text = "Heather's stew, at the inn, with bread from Mike Miller. And knowing every face on the hill. In a year we've had weddings up here, and a baby. Folk think Westfall's finished, and they've not seen us of an evening." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "A reaper, at harvest, for any farm that'd hire me. There's no harvest now, so I reap gnolls." } },
    people_militia = { { id = "tp_people_militia", text = "The best thing that's happened to Westfall since rain. Stoutmantle asked who'd stand, and nearly everyone who could, did." } },
    advice = { { id = "tp_advice", text = "Don't wait for a gnoll to come to you. They get braver with every step you let them take." } },
    rumors = { { id = "tp_rumors", text = "They say there's a great brute of a gnoll in the hills that the rest answer to. If he comes down, I've called first swing." } },
    riverpaw = { { id = "tp_riverpaw", text = "Mangy, loud, and they smell like a wet dog in a midden. They fight dirty, but they break if you don't." } },
    _none = { { id = "tp_none", text = "No idea, friend! Ask Gariel. She's the one who knows things." } },
  },
}

-- Protector Gariel: keeps the door of Sentinel Tower and decides who gets in to see Gryan Stoutmantle.
P:NPC {
  key = "protector_gariel", id = TODO_NPC("Protector Gariel"), name = "Protector Gariel", title = "The People's Militia", gender = "female",
  bible = "bibles/sentinel_more.md", role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "sharp", "level" }, values = { "judgement", "duty" },
  notices = { "soldier", "stealth", "class" },
  impression = {
    first = "Protector Gariel keeps the door of Sentinel Tower and weighs each visitor before they reach Gryan Stoutmantle. She caught the Defias Traitor by the collar the night he ran, and has been the militia's judge of character since.",
    third = "{name} met Protector Gariel of the People's Militia, who keeps the door of Sentinel Tower.",
  },
  greetings = {
    { id = "g_default", text = "Hold a moment. State your business with the tower, and I'll say whether Stoutmantle has time for it." },
    { id = "g_2", when = { metBefore = true }, text = "You again. Go on in; you've been no trouble yet." },
    { id = "g_3", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") }, text = "You've a report for Stoutmantle? He's inside, by the map. Go straight in, and keep it short; he's not slept." },
  },
  notice = {
    { id = "n_1", cat = "stealth", when = { class = "ROGUE" },
      text = "You came up the hill without my hearing you, and I hear most things. I'll let it pass. Don't do it leaving." },
    { id = "n_2", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You're what we've been asking Stormwind for. One of you, anyway. Stoutmantle will see you now, and I shan't make you wait." },
    { id = "n_3", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "The Light's welcome on this hill. We've wounded in the inn's back room and nobody to tend them but Heather and a pot of hot water." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", text = "Protector Gariel, People's Militia. Gryan Stoutmantle is inside, and half of Westfall wants a word with him. My work is to let in the ones who'll help and send the rest to the inn, and I'm seldom wrong about which is which." },
        { id = "hello_2", when = { origin = "human_westfall_farmhand" }, text = "Protector Gariel, People's Militia. You're Westfall folk; I can tell by the hands. Then you've as much right to this tower as I have. Stoutmantle's inside." },
        { id = "hello_3", when = { faction = "Horde" }, text = "Protector Gariel, People's Militia. You've no business on this hill, and I've sixty reasons within shouting distance why you should leave it." },
      },
      again = {
        { id = "hello_again1", text = "Anything else? There's a line forming." },
        { id = "hello_again2", text = "Go on, but briefly." },
        { id = "hello_again3", text = "Yes?" },
      },
      choices = {
        { text = "How do you judge who gets in?", next = "judge" },
        { text = "You caught the Defias Traitor yourself.", next = "caught" },
        { text = "A farmer has no business judging who sees a commander.", next = "business" },
        { text = "Show me to your wounded.", next = "wounded", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "How did you hear the traitor, that night?", next = "hear", when = { class = "ROGUE" } },
        { text = "What's Stoutmantle like to serve under?", next = "gryan" },
        { text = "What does the militia need most?", next = "need" },
        { text = "Carry on, Protector.", next = "END" },
      },
    },
    judge = {
      lines = {
        { id = "judge_1", text = "I look at their boots, and at what they do with their hands while they wait. A man with a grievance fidgets. A man with a plan stands still. And the ones the Defias send to count our spears always ask how many of us there are." },
      },
      choices = {
        { text = "Have the Defias sent many?", next = "sent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sent = {
      lines = {
        { id = "sent_1", text = "Three that I've caught. A pedlar, a preacher, and a woman who said she was looking for her husband. I sent each of them back down the road with a wrong number. It's the only lie I tell, and I tell it gladly.", fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    caught = {
      lines = {
        { id = "caught_1", text = "By the collar, at the wall. I'd watched him all that day. He kept looking at the gate and then looking away from it, and a man only does that when he's measuring the distance. So I stood by the gate at dusk, and he ran straight to me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    business = {
      big = true,
      lines = {
        { id = "business_1", text = "I kept the tally at the Moonbrook grain market for nine years. I've been lied to about weights and measures by better liars than any Defias. I know when a person isn't what they say, and Stoutmantle knows that I know." },
      },
      choices = {
        { text = "Reading people is a skill, wherever you learned it.", next = "BACK", reply = "It is. The market was a harder school than any barracks.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A commander's door should be kept by a trained soldier.", next = "BACK", reply = "Stormwind's welcome to send one. Until it does, there's me.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounded = {
      lines = {
        { id = "wounded_1", text = "Would you? They're in the inn's back room. Four of ours, cut up on the Moonbrook road. Heather's done what she can with clean linen. If you can do more than that, you'll have every hand on this hill in your debt." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hear = {
      lines = {
        { id = "hear_1", text = "I didn't hear him. I saw him decide. You'd know the look, I think. It's the breath a person takes just before they go quiet. I've been watching for it on every face since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gryan = {
      lines = {
        { id = "gryan_1", text = "He was a knight, and he gave it up to stand with farmers. He's never once reminded us of it. He learns every name, and he's dug graves with the rest of us. I'd keep his door until the tower fell down." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    need = {
      lines = {
        { id = "need_1", text = "Swords, and people who can teach them. Quartermaster Lewis does miracles with what Stormwind spares us, and it's never enough. If you want to help, fight the Defias on the roads, and bring Stoutmantle proof." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "A tally-clerk at the Moonbrook market, when Moonbrook had one. I counted grain, and now I count who comes up this hill." } },
    people_militia = { { id = "tp_people_militia", text = "It was Stoutmantle's notion, and it's our hands. We've nobody's leave to exist but our own, and so far that's been enough." } },
    advice = { { id = "tp_advice", text = "Watch what people do while they wait. Nobody thinks to guard that." } },
    rumors = { { id = "tp_rumors", text = "Moonbrook's full of strangers who pay in Stormwind silver and ask no directions. They know the town better than I do, and I was born there." } },
    moonbrook = { { id = "tp_moonbrook", text = "It was a good town. There was a school, and a smithy, and a market on fourth-days. I'll not go and look at it now." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't guess. Ask inside." } },
  },
}
