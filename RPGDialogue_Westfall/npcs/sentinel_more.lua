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
    first = "Christopher Hewen sells thread, dye and flux to whoever on Sentinel Hill still makes things, and he reckons the hill's health by how much thread it buys. Lately, he says, it's mending more than it's making.",
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
      lines = { { id = "xdsham_default", text = "Thread sales say so. Folk are patching old clothes instead of sewing new. Your spirits might help them heal, in their way." } },
      choices = {
        { text = "Mending is a kindness. Keep the thread flowing, Christopher.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Mending is weakness. Make something new.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Black thread and dark dye, I'd guess, and the quieter sort of needle, though I'd sooner not know why you want them. Half the Defias were stonemasons once, and they bought their thread from men like me, so I've learned not to ask what a customer is mending." },
      },
      choices = {
        { text = "I'm mending my cloak, Hewen, nothing more. You'll see coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Best not ask, then. And best not count your spools.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Hewen.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not this month, because they're mending more than they're making. A tabard that's been in a fight is a tabard that needs thread, and the militia's tabards have been in a lot of fights." } },
      choices = {
        { text = "Then I'll buy some thread and mend my own.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll get a new tabard when this one's done.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than anyone, because the Goretusk hides sell in Stormwind if they're cured right. Half my salt goes to hunters and the other half to Salma's kitchen, and I can never decide which is more important." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps sniffing at my salt. Good thing it's not the dye, or we'd both be blue." },
      },
      choices = {
        { text = "I'll cure the hides properly and sell them fairly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll sell them raw. It's quicker.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Mage robes, is it? You'll want the dyed linen, then, since the Stormwind tailors swear the colour holds an enchantment better, though I've never seen a scrap of proof. I'll sell it to you either way, and gladly." } },
      choices = {
        { text = "Proof matters. I'll test it before I believe it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If it feels right, it works. That's half of magic.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How's trade on the hill?", next = "thread" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "The darkest I've got is a black from Duskwood that stains your hands for a week, and I'll not ask what it's for. Folk on this hill have enough to fear without me selling the cloth to make them fear it more." } },
      choices = {
        { text = "It's for robes, nothing more. Rest easy.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear keeps the Defias off this hill too.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Do the wagons still get through?", next = "wagons" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Slower than the tabards, I'd say, since you can't stitch a man back together with thread. The ones who've buried someone stop buying anything but the plainest wool, and I see more of that every month." } },
      choices = {
        { text = "Then I'll go among them and help them grieve.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grief passes. Better they keep busy than mourn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Christopher.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I blame the men who wouldn't pay them first, and the masons second, but I blame them all the same. A wrong done to you doesn't give you the right to burn your neighbour's barn." } },
      choices = {
        { text = "The masons must answer for their crimes, grievance or not.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stormwind cheated them first. I'd have done the same.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Christopher.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Precious little, since the madder and the woad grew on the farms and the farms grew dust. I buy most of it from Elwynn now, and the bit that grows wild up here gives a brown so dull the militia say it suits them." } },
      choices = {
        { text = "Then sow dye crops again. Someone has to start.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave the wild plants be. Dull brown is honest enough.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "What does 'all thread and no dye' mean?", next = "thread" },
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
        { text = "Share fairly. The hill needs you both.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Take the bigger share when she isn't looking.", next = "BACK", fx = { align = { honor = -1 }, trait = { witty = 1 } } },
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
    trade = { { id = "tp_trade", text = "Thread, dye, flux, salt and spice: what keeps a crafter working.", next = "thread" } },
    defias = { { id = "tp_defias", text = "They were customers once, some of them. That's the part that sticks in my throat." } },
    stonemasons = { { id = "tp_masons", text = "Good men with chalk on their sleeves. I sold them line for their plumb bobs, and look where the line led." } },
    _none = { { id = "tp_none", text = "If it isn't sold by the spool or the pinch, I couldn't tell you." } },
  },
}

-- Gina MacGregor: the other trade-goods seller; William MacGregor's relative (relation unstated).
P:NPC {
  key = "gina", id = TODO_NPC("Gina MacGregor"), name = "Gina MacGregor", title = "Trade Supplies",
  bible = "bibles/sentinel_more.md", role = "vendor", tier = "service",
  communities = { "sentinel_hill" }, temper = { "brisk" }, values = { "practical", "family" },
  notices = { "craft", "hunger" },
  impression = {
    first = "Gina MacGregor drives a hard bargain and doesn't apologise for it, since every spool on her table came down a road full of thieves. She seems to think Christopher Hewen undercharges, and she wasn't shy in saying so.",
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
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "He does, and he'll go broke for it. I charge what the road costs me. Your spirits should understand that." } },
      choices = {
        { text = "A fair price for a dangerous road is honest, Gina.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Undercut him and take his customers.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Warlocks pay, mostly, because they've other things to worry about than a copper here and there, and I like that in a customer. What I don't like is a demon sniffing at my cloth, so keep it back from the stall and we'll do business at the full price." },
      },
      choices = {
        { text = "Fair terms, Gina. I'll keep it back.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Full price for that? I'll let the imp decide.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gina.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Badly, because they think it's a fight, and they come at it head on. A trade's not a fight; it's a dance, and I've been dancing longer than you've been swinging, so pay the price and save us both the trouble." } },
      choices = {
        { text = "I'll pay your price and save the trouble.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll haggle, and I'll win this time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because mine's from the coast and his is from a wagon, and mine doesn't have dirt in it. A hide cured with dirty salt goes off in a week, and then you'll come back to me anyway, so save yourself the walk." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps nosing at my stall. If it eats anything, you're paying for it." },
      },
      choices = {
        { text = "I'll buy the good salt. The hides deserve it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll buy the cheap salt and take my chances.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "I'd sell you water if you were thirsty, but I'll not trade good thread for something that vanishes come morning. Bring me silver, which doesn't." } },
      choices = {
        { text = "Silver it is, then. I'll count it twice.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pity. Conjured coin would've fooled you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why are your prices so high?", next = "price" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "No, and don't look at me like that, because if I gave it away there'd be no stall next month for anyone. William gives enough away for the both of us, and somebody in this family has to count." } },
      choices = {
        { text = "Charity has its own worth, Gina. Think on it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. An empty stall helps no one.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Gina.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Two lads from the militia, when Gryan can spare them, and when he can't, we hope the Defias are busy elsewhere. That's in the price too, if you were wondering." } },
      choices = {
        { text = "Then I'll ride with the next wagon myself.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hire your own guards. The militia has bigger work.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gina.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only when the seller can tell me exactly where they picked them, because I've been sold Westfall weeds as Elwynn peacebloom before. You I'd trust a little more, since you'd know a weed from a flower at twenty paces." } },
      choices = {
        { text = "Good. Honest trade starts with honest goods.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Weeds or flowers, if it sells, it sells.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gina MacGregor. I sell trade goods, and I sell them for what they cost to bring here, which is more than Christopher charges and exactly what they're worth." },
        { id = "h_stew", when = { questActive = TODO_QUEST("Westfall Stew") },
          text = "Making Westfall Stew for Salma? Then you'll want a pinch of salt, since murloc eyes taste of nothing and vulture tastes of worse." },
        { id = "h_watchers", when = { questDone = TODO_QUEST("The Killing Fields") },
          text = "You smashed Saldean's scarecrows, didn't you? He came up the hill to buy seed for the first time in a year. Seed, mind you, which is a hopeful thing to buy." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf will haggle, I know that much. Go on, then, and we'll see which of us gives way first. It won't be me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior at my stall. You'll haggle, I suppose, like everyone else, and you'll lose, like everyone else." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want salt, I suppose, and I'll sell it for exactly what it's worth, which is more than Christopher charges." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll ask me for charity, I suppose, and I'll say no, but you're welcome to ask." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Honest folk, your sort, so you'll pay what it's worth and not haggle, I hope." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'll say before you ask that I don't take payment in acorns, however blessed they are, so bring coin." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I don't sell soul shards, so don't ask, and I don't buy them either." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. My prices are fair, considering every spool came down a road full of thieves. Your spirits won't haggle, I hope." },
      },
      again = {
        { id = "h_again", text = "Anything else? Haggling's thirsty work, and I've had no water since dawn." },
        { id = "h_again2", text = "Go on, I'm listening, though not to offers below cost." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Why charge more than Christopher?", next = "price" },
        { text = "You must be kin to William, the bowyer.", next = "william" },
        { text = "Surely you could knock a few coppers off.", next = "haggle", when = { any = { { race = "Dwarf" }, { race = "Gnome" }, { class = "ROGUE" } } } },
        { text = "Would you take conjured water in trade, Gina?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Warriors must haggle well, Gina.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why is your salt dearer than Christopher's, Gina?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever give to those who can't pay, Gina?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does anyone guard the wagons that bring your goods?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever buy wild herbs, Gina, or only crated goods?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do warlocks pay your prices, Gina, or do they bargain too?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Christopher seems to undercharge, Gina.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    price = {
      big = true,
      lines = { { id = "p_default", text = "Because one wagon in two gets here, and someone has to pay for the other one. Christopher eats his losses and calls it kindness. I'd rather still be selling next year." } },
      choices = {
        { text = "Hard roads cost coin. Your price is fair.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Then I'll buy from Christopher and let him eat the loss.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1, trait = { greedy = 1 } } },
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
    booty_bay = { { id = "tp_booty_bay", text = "The goblins of Booty Bay know how to haggle, and I learned from one of them when I was a girl. Hewen never did, which is why he's always undercharging and I'm always right." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias are buying thread and canvas from somebody, and I'd bet my stall it's going down into the Moonbrook mines. I don't sell to them, but somebody does, and that somebody is undercharging, I'd wager." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire drives a harder bargain than any goblin, and I've the empty purse to prove it. I respect them for it, though I'll not go back." } },
    background = { { id = "tp_bg", text = "I've sold goods on this hill since the militia came. Before that I sold them to farmers, and they haggled harder." } },
    advice = { { id = "tp_ad", text = "Buy salt. It keeps meat, it keeps wounds clean, and it keeps its price." } },
    trade = { { id = "tp_trade", text = "Spice, salt and thread at an honest price for a dishonest road.", next = "price" } },
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
    first = "Kirk Maxwell keeps the stables on Sentinel Hill and talks to the animals in a low, even voice, as if they were the only sensible folk in Westfall. He may be right.",
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
        { text = "Then keep the beasts calm, Kirk. They deserve it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Beasts are beasts. They don't need calming.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not the spells so much as what comes after, the cold in the air and that sharp smell like a storm about to break. The hunters' beasts smell it first and go to the back of the stall, and the militia horses just put their ears flat and wait, the way old soldiers do." },
      },
      choices = {
        { text = "I'll keep my distance and let them rest.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They'll learn to live with it. Everyone does.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kirk.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Raids and fire and men falling off them, and some of them don't settle now when they hear steel. A warrior who rides one will need a soft hand, because they've been through as much as their riders." } },
      choices = {
        { text = "I'll ride gently. They've earned it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A horse should be used to steel. I'll ride hard.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Then you're quieter than the Defias, who've been trying to rob my stable since spring and never once got past the old grey mare. She bites, and she knows a stranger's step." } },
      choices = {
        { text = "I'd never steal a farmer's horse.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Good mare. I'd have tried the back gate.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What beasts do you keep?", next = "beasts" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "No, and I can see why, since there's a smell on you like a struck match and they don't care for it. Stand downwind of the stalls and speak low, and they'll get used to you, same as they got used to me." } },
      choices = {
        { text = "I'll stand downwind. They've been through enough.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They'll learn to fear me. That's fine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Can anyone tame the vultures?", next = "beasts_vulture" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The horses take ill of their memories more than anything, and I don't know whether a prayer reaches a horse. Try it on the grey in the end stall if you like, because he startles at shadows and he's earned some peace." } },
      choices = {
        { text = "Every creature deserves comfort. I'll sit with him a while.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A horse that's broken should be put down, Kirk.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kirk.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They'd carry you, but they'd not like the clank, and they'd like the charging even less, since they've seen what waits at the end of one. You'll want a proper charger for that, trained to it from a foal." } },
      choices = {
        { text = "They've earned their rest. I'll walk rather than ask it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A horse is a tool, Kirk. Saddle one anyway.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kirk.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Go on, then, and talk low, because he was at Moonbrook when the Defias burned it and he's not forgotten the smell. If you can get him to eat from your hand, you'll have done more than I have in a month." } },
      choices = {
        { text = "He served the militia. He's earned whatever time he needs.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A horse that bolts gets riders killed. Retire him.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "A militia horse that's seen too much?", next = "horse" },
        { text = "What would you tame, out here?", next = "tame", when = { class = "HUNTER" } },
        { text = "Horses don't spook when I sneak up on them.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Animals don't like me much, Kirk.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Your militia horses look like they've seen a great deal, Kirk.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your animals ever take ill, Kirk? I could pray over them.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could one of your militia horses carry a paladin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Let me sit with your grey awhile. Beasts tend to trust my kind.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do my spells unsettle your animals, Kirk?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your animals seem to sense the spirits, Kirk.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just looking in.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "Coyotes from the plains, goretusks, the odd vulture somebody swore they could train. The vultures don't settle. Nobody's ever told the hunter they couldn't, so I just keep them fed." } },
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
      lines = { { id = "h2_default", text = "Carried a rider out of Moonbrook the night the thieves took it, and won't go south of the hill since. The militia wants him put to work, and I say he's done his share." } },
      choices = {
        { text = "He's earned his rest. Keep him.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Everyone works on this hill, horses included.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame = {
      lines = { { id = "t_default", text = "A goretusk, if you want something that won't quit. They're ugly and bad-tempered, and they'll stand in front of you till they drop, which is more than most soldiers will." } },
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
    moonbrook = { { id = "tp_moonbrook", text = "Ask the grey in the third stall. He won't go near the place, and I don't blame him.", next = "horse" } },
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
    first = "Mike Miller sells bread on Sentinel Hill, baked from Elwynn flour, in what used to be the breadbasket of the kingdom. The irony isn't lost on him, and he mentions it before you can.",
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
      lines = { { id = "xdsham_default", text = "It troubles me every day. Westfall fed the kingdom once. Now Elwynn feeds Westfall. If your earth spirits can wake these fields, I'd bake with their wheat again." } },
      choices = {
        { text = "Then let's help Westfall grow again, Mike.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The fields are dead. Accept it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The ones in masks don't, because they've got their own kitchens down in the mine, I'm told. The hungry ones without masks do, and I put the day-old loaves out back for them and don't ask questions, since stealing bread never made a man a villain in my book." },
      },
      choices = {
        { text = "That's decent of you, Mike, and I'll pay for mine.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Day-old loaves? The masked ones eat better than that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Mike.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because there isn't any, not since the Defias burned the fields and the farmers fled. I buy flour from Elwynn and bake it here, and every loaf reminds me what we lost." } },
      choices = {
        { text = "I'll fight so Westfall grows its own wheat again.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Elwynn flour is good enough. Let the past go.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Goretusk, if there's a hunter about, and nothing but bread if there isn't. A sandwich with boar in it keeps a man on watch all night, and a sandwich without keeps him grumbling." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} wants my bread too, I see. Does it eat it? Some of them do, and some of them just pretend." },
      },
      choices = {
        { text = "I'll keep the militia in meat.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hunt for my own table, thank you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "So I've heard, and so the soldiers tell me every time they buy a loaf, as if I'd not heard it the first hundred times. Conjured bread has no crust worth the name, and there's no man in Westfall who'll call it a proper loaf." } },
      choices = {
        { text = "A proper loaf deserves a proper oven.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bread's bread, Mike. Hunger doesn't care.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where does your flour come from?", next = "flour" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "One just like it ate a sweet roll off my counter last week, and I'll thank you not to tell me it was a different imp. Keep it on your shoulder and off my shelves." } },
      choices = {
        { text = "I'll pay for anything it takes.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It was hungry, and your shelves were open.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who buys your bread?", next = "eaters" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They do, and I send them down to Salma's, because she gives it away and I'd go under in a week if I did. I keep the burnt loaves aside for them, though, and nobody's ever complained about the burnt bits." } },
      choices = {
        { text = "Then bake a few unburnt ones for them too, Mike.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burnt loaves are kindness enough. Business is business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Mike.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Peace on the roads, and farmers who'd dare to plant without wondering who'll harvest. The Defias, the gnolls and the walking scarecrows all need clearing first, and I'm a baker, so I'll leave that to you." } },
      choices = {
        { text = "Then I'll clear them, field by field.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The farms are lost. Bake with Elwynn flour and be glad.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Mike.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The old men say the soil's still good a foot down, and it's only the top that's dead and blowing, so maybe it could. But nobody will plough a field the Defias can burn in a night, and nobody will stop the Defias while the fields are empty." } },
      choices = {
        { text = "Then break the Defias first. Fields follow safety.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Plant anyway. Waiting for safety means waiting forever.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Why flour from Elwynn?", next = "flour" },
        { text = "That's a great deal of bread for one hill.", next = "eaters" },
        { text = "Blessed bread feeds the soul as well. May I bless today's batch?", next = "bless", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I can conjure bread, you know.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Don't worry, my imp won't eat your bread.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
      lines = { { id = "f_default", text = "Because nobody's grown wheat in Westfall since the farms emptied. The fields are full of thieves and those walking scarecrows, and nobody plants where the scarecrows walk." } },
      choices = {
        { text = "Then someone should clear the fields.", next = "flour_fields" },
        { text = "Something else.", next = "BACK", fx = { learn = { "harvest_watchers" } } },
      },
    },
    flour_fields = {
      lines = { { id = "ff_default", text = "Saldean's been asking for that for a year. Go and see him, if you've the stomach, and tell him Mike sent you, so he'll know at least one man up here's listening." } },
      choices = { { text = "I'll go and see him.", next = "BACK", fx = { affinity = 1, learn = { "harvest_watchers" } } } },
    },
    eaters = {
      big = true,
      lines = { { id = "e_default", text = "The militia, mostly, who don't pay, and Heather's guests, who do. And now and then a farmer who's walked off his land comes asking. I give them the day-old loaves and don't make a fuss." } },
      choices = {
        { text = "That's a decent thing to do.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Charity won't keep your ovens hot.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
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
    harvest_watchers = { { id = "tp_watchers", text = "Scarecrows that walk, in fields that should be wheat. That's Westfall now in a sentence.", next = "flour" } },
    westfall = { { id = "tp_westfall", text = "The kingdom's breadbasket, people used to say. Now it's a basket, and that's about all." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I know flour and fire, and not much else." } },
  },
}
