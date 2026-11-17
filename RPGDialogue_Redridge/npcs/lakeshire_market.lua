-- Lakeshire's shopkeepers and kitchen hands: Lamar Veisilli's fruit, Karen Taylor's smithing
-- supplies, Kara Adams's shields, Vernon Hale's tackle, Sherman Femmel the butcher and
-- Gretchen Vogel in Breanna's kitchen. Voice: bibles/lakeshire_market.md
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Lamar Veisilli: fruit seller.
P:NPC {
  key = "lamar", id = TODO_NPC("Lamar Veisilli"), name = "Lamar Veisilli", title = "Fruit Seller",
  bible = "bibles/lakeshire_market.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "cheerful" }, values = { "kind", "practical" },
  notices = { "hunger" },
  impression = {
    first = "Lamar Veisilli sells fruit in Lakeshire and polishes every apple before he hands it over. He talks about the orchards the way other men talk about old friends they've lost touch with.",
    third = "{name} met Lamar Veisilli, Lakeshire's fruit seller.",
  },
  greetings = {
    { id = "g_default", text = "Apples, friend, and pears when the carts come through. Take your pick of the shiny ones." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? A man who eats fruit lives longer, my mother always said." },
  },
  notice = {
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "You look half starved and half beaten, friend. Buy something with a bit of juice in it before you go back out there." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I miss every one of them. They're full of gnolls now. Your earth spirits might know whether they'll grow again." } },
      choices = {
        { text = "They'll grow again, Lamar. Hold on to hope.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The orchards are gone. Grow something new.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A little, but I've sold apples to soldiers, gnoll-hunters and a man who swore he was a king, so you're not even the strangest customer this week. Just keep your pet away from the barrels, because I've no idea what a demon would do to my fruit." } },
      choices = {
        { text = "I'll keep it well away from the apples.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My pet goes where it likes, Lamar.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Lamar.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some of them do, now the cart can't get through from the old orchards every week. A barrel goes soft in the heat if it sits too long, and I've half a mind to ask a mage for a little frost in the cellar, if one ever stayed in Lakeshire long enough." } },
      choices = {
        { text = "I'll chill a barrel or two before I go.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My frost is for gnolls, Lamar, not fruit.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Lamar.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because I count them every evening, and because the children who take them leave the cores on my doorstep, bless them. A rogue would be harder to catch, I'll grant, but you'd have a guilty conscience, and that's worse than being caught." } },
      choices = {
        { text = "I'd pay for every apple, Lamar.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A guilty conscience never filled a stomach.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Lamar.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The orchards up the valley, though fewer every year, because the gnolls have taken a liking to them. If a warrior chased them off, I'd have fruit to sell and the children would have something to steal." } },
      choices = {
        { text = "I'll chase them off your orchards, Lamar.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Gnolls in an orchard aren't worth my blade.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Lamar.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boars, mostly, rooting up the windfalls, and they've grown fat and bold since the farmers fled. I'd not mind a boar or two, but they've started knocking the young trees down, and those take years to grow back." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it'd enjoy an apple, {class}, though I'd rather it didn't eat the whole crate. Here, a small one." },
      },
      choices = {
        { text = "I'll clear the boars and spare the trees.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fat boars make good meat. I'll hunt for the pot.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Lamar.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some do, and some had them before Stonewatch, and those are the ones I let take a second apple. I polish the best ones and leave them at the end of the cart, where a small hand can reach, and I never look to see whose hand it is." } },
      choices = {
        { text = "That's true kindness, Lamar. Keep leaving them there.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Theft is theft, Lamar. They'll never learn otherwise.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Lamar.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nobody, and that's the shame of it, because the orchards are up toward the hills and the gnolls own the hills. I go up with a cart once a fortnight and pick what I can before anything notices me, and so far nothing has." } },
      choices = {
        { text = "Next time you go, I'll ride with the cart.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then charge the soldiers double. You've earned it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Lamar.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Lamar Veisilli, and I sell fruit, which in Lakeshire these days is a bit like selling sunshine. The soldiers eat it by the barrel, the children steal it by the pocketful, and I'm happy enough with both." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid! Tell me honestly, do the trees mind when I sell their apples? I've always wondered, and nobody else in Lakeshire can ask them." },
        { id = "h_troll", when = { race = "Troll" }, text = "You'll be wanting bananas, I suppose, and I'm sorry to say I've none. Redridge is apple country, though I'll find you a sweet one." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Take an apple, take two, and don't tell me you're not hungry, because everyone who carries a sword in Redridge is hungry." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you'll know your way around the hills, then, which is where my orchards are, or where they were." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Take an apple, and bless the next one, because the children will be stealing it before sundown." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Take an apple; they're from the old orchards, grown by people who'd want you to have one." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! Take an apple, and don't take two when I'm not looking, because I always know." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Can you make an apple grow faster? No? Then can you keep one from going soft? I'd be glad of that." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Well, take an apple anyway; I'd think even warlocks get hungry." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! An apple? Polished, of course. The orchards were old friends once, before the orcs." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the basket; it's my last good one." },
        { id = "h_again2", text = "Ask on, friend; the apples need polishing either way." },
      },
      choices = {
        { text = "Let me buy some fruit.", next = "BUSINESS" },
        { text = "Where does your fruit come from?", next = "orchards" },
        { text = "I'd guess the children steal from you.", next = "children" },
        { text = "How has the war changed Lakeshire?", next = "war" },
        { text = "Where do your apples come from now, Lamar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Are there beasts in the orchards, Lamar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the children who steal from you have families, Lamar?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who's working your orchards now, Lamar?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you always know when apples go missing, Lamar?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do your apples spoil before they sell, Lamar?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Aren't you wary of warlocks, Lamar?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You must miss the orchards, Lamar.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Lamar.", next = "END" },
      },
    },
    orchards = {
      lines = { { id = "o_default", text = "There were orchards up the valley, east of town, before the Blackrock came through. Now I buy what Elwynn's carts bring over the pass and whatever the farms near the lake can still grow." } },
      choices = {
        { text = "What happened to the orchard folk?", next = "orchards_folk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orchards_folk = {
      lines = { { id = "of_default", fx = { learn = { "blackrock" } }, text = "Some came into town and some went west to Elwynn, and a few didn't get out at all. I don't ask anyone which they are any more; it isn't kind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    children = {
      lines = { { id = "c_default", text = "Every day, and they think I don't notice. Young Shawn from the docks is the boldest of them, and I let him, because the lad's got nothing much and a stolen apple tastes better than a bought one." } },
      choices = {
        { text = "Letting them steal teaches them to steal.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A kind turn. Children need that now.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      big = true,
      lines = { { id = "w_default", text = "The soldiers eat well and pay late, the bridge is half built, and Magistrate Solomon writes to Stormwind every week and gets nothing back. We used to have a fair at harvest, and now we have a curfew." } },
      choices = {
        { text = "Stormwind will come. Hold on.", next = "war_hope" },
        { text = "Lakeshire has to stand on its own now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The magistrate is right to keep asking.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    war_hope = {
      lines = { { id = "wh_default", text = "I'd like to believe that, friend, and some mornings I do. On the others I polish apples and keep my hopes small enough to fit in a basket." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My family grew apples up the valley for three generations, and I'm the one who ended up selling them instead." } },
    advice = { { id = "tp_ad", text = "Eat something green once a day, friend; it's cheaper than a priest." } },
    _none = { { id = "tp_none", text = "That's beyond me, I'm afraid. If it doesn't grow on a branch, I'm no use to you." } },
  },
}

-- Karen Taylor: blacksmithing and mining supplies.
P:NPC {
  key = "karen_taylor", id = TODO_NPC("Karen Taylor"), name = "Karen Taylor", title = "Blacksmithing & Mining Supplies",
  bible = "bibles/lakeshire_market.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "blunt" }, values = { "practical", "craft" },
  notices = { "craft" },
  impression = {
    first = "Karen Taylor sells picks, flux and coal in Lakeshire and has opinions about every smith in Redridge. She seemed to respect anyone who could swing a hammer and nobody who couldn't.",
    third = "{name} met Karen Taylor, who sells blacksmithing and mining supplies in Lakeshire.",
  },
  greetings = {
    { id = "g_default", text = "Picks, hammers, flux and coal. Buy them or move, friend; I've a crate to unpack." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Broke your pick already, or just bending it?" },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "You've got the forearms of someone who swings a hammer for a living, so I'll not waste your time with the cheap picks. The good ones are under the counter." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not much, no. A smith works with honest hands. Your spirits might help, but I'd still like to see you strike iron." } },
      choices = {
        { text = "Honest work earns respect. I'll swing a hammer gladly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Lightning's just as honest. Hammers aren't everything.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Cages, chains, I couldn't say, and I'd rather not know. Every bar I have is promised to Verner for the bridge or the watch's blades, so whatever you're building will have to wait until the gnolls are gone." } },
      choices = {
        { text = "The bridge comes first. I'd never take from it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Promises can be broken for the right coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Karen.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Sharpening stones, mostly, and coal for whoever does your repairs, because Verner's forge is cold half the time. A warrior who sharpens his own blade is a warrior I'd sell to before any other." } },
      choices = {
        { text = "I'll keep my own edge. A warrior should know his steel.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That's a smith's job. I pay for the work.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Karen.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every one, every time, and anyone who tells you otherwise has never put an arrow through a goretusk's hide. A dull arrowhead skids off the bone, and a skidding arrow means a charging boar." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has teeth that could use a whetstone too, {class}, though I'd not try sharpening them myself." },
      },
      choices = {
        { text = "I'll keep every arrowhead sharp. A clean kill matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll fire more arrows. Sharpening wastes time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Karen.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Then you'll find nothing for you here, because I don't sell boxes and I don't buy what's been in them. Honest ore is what Lakeshire needs, and Verner's forge is cold for want of it." } },
      choices = {
        { text = "Fair. I'll bring ore, not trinkets.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A cracked lockbox is honest enough for me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why is Verner so short of iron?", next = "verner" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "That's what they all say, until their robes need a clasp and their staff needs a ferrule and they're begging at the smith's door. Everything you carry was pulled out of a hill by somebody with a pick, mage." } },
      choices = {
        { text = "Fair point. I'll respect the craft.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll stick to spells and let others dig.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What ore do you buy?", next = "ore" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Fewer every month, since the gnolls started digging the Rethban seam themselves and don't care for company. The ones who come back buy more picks than before, because they dropped theirs running, and I sell them without asking what they ran from." } },
      choices = {
        { text = "Then I'll pray over the miners before they go up.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Miners know the risks, Karen. That's the trade.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Karen.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Can't blame them, I suppose, since a horse with no shoes hurts nobody and a guard with no sword hurts everybody. But Verner shoes the patrol horses too, and they forget that when they're carting his bars off." } },
      choices = {
        { text = "The Guard's need comes first. That's how a town survives.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Guard takes too much. Verner deserves his iron.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Karen.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not lately, since the gnolls took the Rethban seam and most of my miners took fright. Before that, aye, we dug wherever the iron showed, and I'll not pretend anyone asked the hill's permission." } },
      choices = {
        { text = "A town needs iron. Dig where it's needed and be thankful.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The hills aren't yours to empty. Take only what you need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Karen Taylor. I sell what smiths and miners need, and mostly I sell it to Verner Osgood, who'd buy every bar of iron in Redridge if the Guard let him keep any of it." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Good, then you'll not try to tell me that copper and tin are the same thing, like the last three humans did." },
        { id = "h_bridge", when = { questDone = TODO_QUEST("The Everstill Bridge") }, text = "You're the one who got Oslow's iron back from the gnolls. Good work, because I'd no more to sell him, and he'd been looking at my anvil." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Now, if you know how to swing a weapon, you might know how to swing a hammer too, and I'd respect you twice as much." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll be wanting ammunition, then, and I'll tell you now Henry Chapal's the man for shot, but I've the best whetstones for arrowheads." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, among the picks and coal? You'll want nothing here, I'd guess, but you're welcome to warm your hands at the brazier." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Now there's someone who knows what a hammer does to your shoulder by sundown, and I respect you for it already." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You'll not want to hear about mining, I'd guess, since I'm told your folk think a hole in a hill is a wound." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I sell coal, flux and iron bars, and none of it's any use to you, I'd guess, unless you're building something you shouldn't." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Can you swing a hammer, or just call lightning? I respect only one of those." },
      },
      again = {
        { id = "h_again", text = "What else? Quick about it." },
        { id = "h_again2", text = "Ask, then, but I'll keep unpacking while you do." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why can't Verner keep his iron?", next = "verner" },
        { text = "These hills must hold some ore.", next = "ore" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "I'm a smith myself.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "I prefer lockboxes to ore, Karen.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Surely a mage has no use for a pick.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you sell anything for a warrior's gear, Karen?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do arrowheads need sharpening, Karen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess fewer miners come back from the hills these days, Karen.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is the Guard's claim on Verner's iron fair, Karen?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your miners take more from the hills than they need?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What would a warlock build with iron, Karen?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you respect anyone who can't swing a hammer, Karen?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    verner = {
      lines = { { id = "v_default", text = "Because the Guard needs blades and arrowheads, and they come first. So Verner can't shoe a horse to save his life, and the gnolls take every horse that wanders off unshod, and round it goes." } },
      choices = {
        { text = "The soldiers have to come first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A town needs its horses too. That's poor planning.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore = {
      lines = { { id = "o_default", text = "Copper and tin in the hills, and some iron further in, if you don't mind gnolls breathing down your neck. Most miners do mind, which is why my prices are what they are." } },
      choices = {
        { text = "Would you buy ore from me?", next = "ore_buy" },
        { text = "Something else.", next = "BACK", fx = { learn = { "redridge_gnolls" } } },
      },
    },
    ore_buy = {
      lines = { { id = "ob_default", text = "Not me, friend; I sell, I don't buy. Take your ore to Verner, or smelt it yourself and save him the trouble, and he'll like you better for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stock = {
      lines = { { id = "s_default", text = "Over the pass from Elwynn, mostly, on carts that take twice as long as they should. Half the coal comes from Ironforge by way of Stormwind, and I pay for every mile of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smith = {
      lines = { { id = "sm_default", text = "Then you'll know a bad hammer when you hold one, and you'll know mine aren't. Buy your flux here and your coal in Stormwind, if you're going that way; I'll not pretend mine's cheaper." } },
      choices = { { text = "Honest advice. I appreciate it.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father was a miner in the Redridge hills before the orcs came, and I'd rather sell picks than swing them." } },
    advice = { { id = "tp_ad", text = "Keep your pick sharp and your back to a wall, friend. Gnolls like miners; we're slow and noisy." } },
    _none = { { id = "tp_none", text = "Not a thing I sell, so not a thing I know." } },
  },
}

-- Kara Adams: shield crafter.
P:NPC {
  key = "kara_adams", id = TODO_NPC("Kara Adams"), name = "Kara Adams", title = "Shield Crafter",
  bible = "bibles/lakeshire_market.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "duty", "craft" },
  notices = { "class", "kit" },
  impression = {
    first = "Kara Adams makes shields for Lakeshire's soldiers and checks every one by striking it herself. She believes a shield is the most important thing a soldier carries, and she is hard to argue with.",
    third = "{name} met Kara Adams, Lakeshire's shield crafter.",
  },
  greetings = {
    { id = "g_default", text = "Shields, strong and plain. Hold one up and I'll show you how." },
    { id = "g_back", when = { metBefore = true }, text = "Still carrying that shield of yours? Let me see the dents." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry a shield like you've needed one, and I like that. Raise it a hand higher, though; the Blackrock aim for the face." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That shield's taken a beating, and so have you. Go and see Verner before you go back out, and don't argue with me about it." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It matters more than anything. I strike every one myself before I sell it. Your spirits might protect you, but a shield won't fail." } },
      choices = {
        { text = "Then I'll trust your shields, Kara. Good work.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My spirits protect me well enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I've seen one of your lot's big brutes take a gnoll's axe on its chest and not even notice, so maybe not. I'd still feel better if whatever stands between Lakeshire and the hills was wearing proper steel instead of brimstone." } },
      choices = {
        { text = "Steel's a fine thing. I'd trust your shields.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My demon's worth ten of your shields, Kara.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kara.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not a big one, but a buckler on the arm has saved more throats than any trick I know. The gnolls fight dirty, and a rogue who gets caught in the open needs something between them and a rusty blade." } },
      choices = {
        { text = "I'll take your advice and carry one.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A rogue who's caught has already failed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kara.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A heavy one, banded with iron and with a good boss in the middle, because an orc's axe will split a light one in two swings. I strike every shield myself before I sell it, and if it cracks, it doesn't leave the shop." } },
      choices = {
        { text = "A heavy shield, then. Standing firm is half the battle.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Shields slow me down. I'd rather strike first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kara.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now and then, a small buckler for the off arm, because a boar's tusk will open you up quick if you've nothing to catch it on. Most of them laugh until they've been gored once." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is a fine shield in its own right, {class}, and it doesn't need striking to prove it." },
      },
      choices = {
        { text = "I'll take a buckler. Better safe than gored.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My beast and my aim are shield enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kara.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More of them than would have otherwise, and that's the only boast I make. When a shield comes back to me split, I hang it on the back wall until I know whether the one who carried it is mending or buried." } },
      choices = {
        { text = "Then I'll pray for every name behind those shields.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A split shield's just scrap. Melt it down, Kara.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kara.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Mine will, if you hold it high and let the edge take the blow, because an orc swings down like he's chopping wood. The Light can keep you standing, but it's the shield that keeps your arm on." } },
      choices = {
        { text = "I'll stand in front and take the blows for the guard.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A shield's for my own skin. The guard can fend for itself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kara.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A bear's hide gets you home, I'll grant you, so it does a shield's job by another road. But a bear can't stand in a doorway and hold it for the folk behind, and that's what my shields are really for." } },
      choices = {
        { text = "Then I'll stand in that doorway, shield or no shield.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Doorways are for soldiers. I fight where I choose.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Kara Adams, and I make shields for the Lakeshire watch and anyone else who means to stand between the town and the hills. A sword wins a fight, but a shield gets you home from it." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage, looking at shields? Your people think a spell is all the armour you need, but I've seen a mage take an orc's axe, and you'll forgive me if I recommend a buckler." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! I learned my best rim-work from a dwarven smith, so you'll find nothing here to shame you, I hope." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and I can tell by your stance you know which way to hold a shield, which is more than I can say for half the guard." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll not want a shield, I suppose, but you'll want something to stand behind when a goretusk charges, and a tree's not always handy." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, at a shield stall? Your faith's a shield of sorts, I'll grant, but it won't stop an axe." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! There's someone who knows what a shield is for, and I'd wager you hold it like you mean it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I've seen what your people carry into a fight, which is mostly nothing, so I suppose you've no use for my shields." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! You'll be wanting a buckler, I hope, because I've seen your sort try to parry with a dagger, and it ends badly." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. You'll not want a shield, I expect, but your demon might, if it's the sort that stands in front." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. A shield's the most important thing a soldier carries. Do your spirits shield you, or do you need one?" },
      },
      again = {
        { id = "h_again", text = "Anything more? This rim won't rivet itself, and the watch wants it by dusk." },
        { id = "h_again2", text = "Ask away, friend; my hammer keeps time while you talk." },
      },
      choices = {
        { text = "Show me your shields.", next = "BUSINESS" },
        { text = "What makes a good shield?", next = "good" },
        { text = "Who carries your shields?", next = "who" },
        { text = "You look like you've done some fighting yourself.", next = "fought" },
        { text = "Which shield would you trust against the Blackrock, Kara?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters ever buy your shields, Kara?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the soldiers who carry your shields come home, Kara?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Will a paladin's shield stand against the Blackrock, Kara?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why would I need a shield when I can wear a bear's hide?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Should a rogue really carry a shield, Kara?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think a demon needs a shield, Kara?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "A shield seems a small thing to fuss over, Kara.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Kara.", next = "END" },
      },
    },
    good = {
      lines = { { id = "g2_default", text = "A good shield is one you can lift all day without your arm shaking. The heavy ones look grand, but a tired soldier drops his guard, and a dropped guard is how the Blackrock win." } },
      choices = {
        { text = "So lighter is better, then.", next = "good_light" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_light = {
      lines = { { id = "gl_default", text = "Lighter is better until it breaks, and then it's worse than nothing. All the skill's in knowing where to put the weight, which is my job, and why I don't tell anyone how I do it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "The watch, mostly, and Corporal Keeshan's lot when they come in from the hills with their shields in splinters. Deputy Feldon orders a dozen every month and pays for eight." } },
      choices = {
        { text = "And you let him?", next = "who_feldon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_feldon = {
      big = true,
      lines = { { id = "wf_default", text = "What else would I do, let soldiers go out without them? Stormwind owes me for a wagon full of shields by now, and I'll never see the coin, but I'll see the soldiers come home." } },
      choices = {
        { text = "That's real duty. Lakeshire is lucky to have you.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Charge full price. Stormwind can afford it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fought = {
      lines = { { id = "f_default", text = "Once, when the orcs first came over the hills and every hand in Lakeshire picked something up. I picked up a shield, of course, and I learned that day exactly what was wrong with all of them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I apprenticed in Stormwind and came home to Lakeshire when I heard the watch was fighting with planks." } },
    advice = { { id = "tp_ad", text = "Keep your shield up and your chin down, friend, and you'll live long enough to argue about it." } },
    _none = { { id = "tp_none", text = "No idea. I only know what can be hammered into a rim." } },
  },
}

-- Vernon Hale: fishing supplies on the docks.
P:NPC {
  key = "vernon_hale", id = TODO_NPC("Vernon Hale"), name = "Vernon Hale", title = "Fishing Supplies",
  bible = "bibles/lakeshire_market.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "wry" }, values = { "patient", "practical" },
  notices = { "craft" },
  impression = {
    first = "Vernon Hale sells hooks and line on Lakeshire's docks and grumbles that the murlocs catch more fish than his customers do. He's probably right.",
    third = "{name} met Vernon Hale, who sells fishing supplies on the Lakeshire docks.",
  },
  greetings = {
    { id = "g_default", text = "Hooks, line, bait and patience. I only sell the first three." },
    { id = "g_back", when = { metBefore = true }, text = "Lost your line to the lake again? It happens to the best of us." },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You fish, I can tell by the way you looked at the water before you looked at me. Use the heavy line here; the lake's got teeth." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They catch most of them, I'd swear. They've overrun the lake shore, and my hooks go unsold." } },
      choices = {
        { text = "Then we'll drive them back fairly, Vernon.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Poison the water. Murlocs won't last.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Once, to a fellow who wanted the line for something else and wouldn't say what. I sold it anyway, because a sale's a sale, but I've wondered about it since, and I'd rather not wonder about you." } },
      choices = {
        { text = "If I buy line, it's for fish. You've my word.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Wonder all you like. I don't explain myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Vernon.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No, probably not, now I think of it, because the fish would freeze too and then where would I be? But a mage on the shore would make the fishermen braver, and brave fishermen buy tackle." } },
      choices = {
        { text = "I'll stand on the shore while they fish.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm not here to sell your tackle, Vernon.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Vernon.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They steal tackle, nets, catches and the odd boot, and nobody's managed to stop them. If you're quick and quiet, you might creep up on their camps and take some of it back, because the murlocs are poachers and I'd like to see them poached." } },
      choices = {
        { text = "I'll take back what they stole, Vernon.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever I take from them, I'll keep.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Vernon.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Ruined it? They've taken it over, and they catch more fish than every man in Lakeshire put together. If a warrior cleared the north shore, my customers might catch something besides a cold." } },
      choices = {
        { text = "I'll clear the shore. Lakeshire should fish its own lake.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fishing isn't my trade. The murlocs can keep it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Vernon.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The same fish and more besides, and they'll take a fisherman's catch straight off his line if he's slow reeling in. A hunter who could thin them out along the shore would have every angler in Lakeshire buying him a drink." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is watching the water like it wants to dive in, {class}, and I'd keep hold of it, because the murlocs bite." },
      },
      choices = {
        { text = "I'll thin the murlocs so the anglers can fish.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fish your own lake, Vernon. I hunt bigger prey.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Vernon.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "One, last autumn, a young fellow who went out at dusk because that's when the big ones bite. We found his rod and his hat on the shore, and I've kept the rod behind the counter ever since, because I can't sell it and I can't throw it away." } },
      choices = {
        { text = "I'll say words for him, Vernon, and you keep the rod.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fools who fish at dusk pay for it. Sell the rod.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Vernon.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "If you ask my customers, yes, and if you ask the Marshal, no, and I can't fault him for it. Murlocs take fish and the odd fool, but the Blackrock take whole towns, so I sell hooks and keep my mouth shut." } },
      choices = {
        { text = "The Marshal's right. The greater threat comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Marshal's wrong. Protect the folk right in front of you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Vernon.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They net the shallows with weed and bone and take every fish big or small, so the spawning beds round the north shore are nearly empty. I'll say this for them, though: they're better fishermen than half my customers." } },
      choices = {
        { text = "Then teach your customers to throw the young ones back.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Outfish the murlocs. Whoever empties the lake first wins.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Vernon Hale. I sell fishing tackle to anyone fool enough to fish Lake Everstill with the murlocs about, and there are more fools in Lakeshire than you'd think." },
        { id = "h_poachers", when = { questDone = TODO_QUEST("Murloc Poachers") }, text = "You're the one who cleared the murlocs off the shore for Baren! My customers have started catching fish again, and I'm selling hooks faster than I can bend them." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf on the docks! Your people fish Loch Modan, don't they? Then you'll find Everstill a good deal less friendly, I'm afraid." },
        { id = "h_lakeborn", when = { origin = "human_redridge_born" },
          text = "You don't need me to tell you about Everstill, do you? You've the look of somebody who learned to fish off this very dock, back before the murlocs got so bold." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, on my dock? You'll not catch much with that sword, though you might scare the murlocs off long enough for someone else to." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll know patience, then, and patience is the whole of fishing, so you're halfway to being a customer." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest on the docks. If you've a blessing for fishermen, there are a few here who'll need it before the murlocs are done." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin on my docks. The murlocs won't be impressed, but my customers will, and they'll fish braver for it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You'll be the sort who thinks the murlocs have as much right to the lake as anyone, I suppose." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! You'll be wanting a fishing line, I hope, and not a garrotte, because I only sell the one." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Could you freeze the lake? Only a bit, mind, so the murlocs would get stuck." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Not much fishing in your line, I'd guess, unless you count fishing for souls." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Murlocs catch more fish than my customers. Can your water spirits change that?" },
      },
      again = {
        { id = "h_again", text = "Something else? I've line to untangle." },
        { id = "h_again2", text = "Go on. The fish aren't going anywhere, more's the pity." },
      },
      choices = {
        { text = "Let me see your tackle.", next = "BUSINESS" },
        { text = "How bad are the murlocs?", next = "murlocs" },
        { text = "Who teaches fishing here?", next = "hooper" },
        { text = "A lake like this must have a few fishing stories.", next = "story" },
        { text = "Have the murlocs ruined the fishing on the lake, Vernon?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the murlocs hunt the same fish as us, Vernon?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have the murlocs ever taken one of your customers, Vernon?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the Marshal clear the murlocs before the orcs, Vernon?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the murlocs fish Lake Everstill bare, Vernon?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the murlocs steal from the fishermen, Vernon?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would freezing the lake really help, Vernon?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have you ever sold tackle to a warlock, Vernon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The murlocs seem to be catching all the fish, Vernon.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good fishing to you.", next = "END" },
      },
    },
    murlocs = {
      lines = { { id = "m_default", text = "Bad enough that Dockmaster Baren can't keep a boat on the water without losing the catch. They come up the shore at night and take whatever's in the nets, and they've started taking the nets too." } },
      choices = {
        { text = "Why have they come?", next = "murlocs_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    murlocs_why = {
      big = true,
      lines = { { id = "mw_default", text = "Same reason we did, I expect, which is the fish. Baren says they're poaching, and they'd likely say the same of us, if anyone could understand a word they said." } },
      choices = {
        { text = "The lake belongs to Lakeshire. Drive them out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Maybe there's enough lake for both.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hooper = {
      lines = { { id = "h2_default", text = "Matthew Hooper, further down the docks. He's a patient teacher and a better fisher than me, though he won't go out on the deep water alone any more, and he won't say why." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    story = {
      lines = { { id = "s_default", text = "There's an old tale of a beast in the deep middle of the lake that bites lines clean through, and the dockhands swear it's real. I've lost a few lines out there myself, but I've also had a few ales, so make of that what you will." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold tackle on these docks since before the bridge fell, and I'll sell it after they put it back." } },
    advice = { { id = "tp_ad", text = "Fish the morning, friend, when the murlocs are still asleep." } },
    _none = { { id = "tp_none", text = "Don't know. Doesn't bite, doesn't swim, doesn't interest me." } },
  },
}

-- Sherman Femmel: butcher at the Lakeshire Inn.
P:NPC {
  key = "sherman", id = TODO_NPC("Sherman Femmel"), name = "Sherman Femmel", title = "Butcher",
  bible = "bibles/lakeshire_market.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "gruff" }, values = { "practical", "hardworking" },
  notices = { "class" },
  impression = {
    first = "Sherman Femmel cuts meat at the Lakeshire Inn and talks while he works, with the cleaver doing most of the punctuation. He knows more about the hills' wildlife than most hunters.",
    third = "{name} met Sherman Femmel, the butcher at the Lakeshire Inn.",
  },
  greetings = {
    { id = "g_default", text = "Fresh cuts, salted and smoked. Stand back from the block, if you value your fingers." },
    { id = "g_back", when = { metBefore = true }, text = "Hungry again? Good, I've a haunch that wants eating." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, with a beast at your heel and meat on your belt, I'd wager. Bring me whatever you take in the hills; I'll pay fair for clean kills." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd wager so. Every beast I've cut tells me where it lived and what it ate. Your spirits might know the rest." } },
      choices = {
        { text = "Respect the beasts, Sherman. Waste nothing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Beasts are meat. Cut and sell.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Bones, blood, the odd heart, and I said no every time. A butcher's trade is feeding people, friend, and I'll not have my block mixed up in anything else, however much coin's on the counter." } },
      choices = {
        { text = "You're right. Your trade should stay clean.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bones and blood are only leftovers to you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sherman.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They did, and they ate everything in it and left the door hanging, the brutes. Without it I have to sell everything the day it's butchered, and a mage who could leave a chill in the cellar would be worth more to Lakeshire than a squad of soldiers." } },
      choices = {
        { text = "I'll leave a frost on it before I go.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My frost is for gnolls, not cellars.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Sherman.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They steal the meat, not the knives, and it's always the gnolls. They come down from the hills at night and take whatever's hanging in the yard, so if you're a sneak, go and sneak around their camps and see how they like it." } },
      choices = {
        { text = "I'll take the fight to the gnolls for you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hang your meat higher. That's not my trouble.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Sherman.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Boar, if they're lucky, and whatever Breanna can stretch into a stew if they're not. A soldier who marches on an empty belly fights like one, and I've seen too many come back hungry and hurt." } },
      choices = {
        { text = "Feed the soldiers first. I'll eat what's left.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll eat well first. A full warrior fights better.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Sherman.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "One arrow behind the shoulder, and none of this hacking at the haunch, because it ruins the meat. The goretusks up in the hills are big enough to take three arrows, so make the first one count." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like a fine hunter, {class}, and I'd wager it knows more about a clean kill than half the men who bring me meat." },
      },
      choices = {
        { text = "One clean arrow, and nothing wasted.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "As long as it's dead, the meat's good enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Sherman.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The best cuts go to Chef Breanna, and the best of hers go to the barracks, so in a roundabout way I feed them every day. I send a bone for broth along with it, because a man who can't chew can still drink, and I learned that from my father." } },
      choices = {
        { text = "That's a kindness, Sherman. They'll mend faster for it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Feed the fighting men first. The wounded can wait.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sherman.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Once, against a gnoll who'd come down off the hill after the smell, and I sent him back up with the flat of my cleaver and a lesson in manners. I'm not a fighting man, but nobody takes from my block without paying." } },
      choices = {
        { text = "A man defending his own does honest work, Sherman.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Next time, keep the gnoll and sell him as boar.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Sherman.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The condors have grown fat on the battlefields, and the bears have moved down toward the lake where the orcs don't go. I've cut tarantulas twice the size they used to be, too, which I'd rather not think about." } },
      choices = {
        { text = "Then thin the fattened condors. Keep their numbers in check.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The hills will balance themselves. Let the beasts be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Sherman Femmel, butcher, and before you ask, no, it's not gnoll. Everything on this block came from a boar, a bear or a condor, and the inn's kitchen takes the best of it." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "A cook! Chef Breanna will want to talk to you, and so do I, because you'll know good meat from the stringy stuff the hills mostly give." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "Oh! Now, there's no beef on this block, I promise you that, and I'll not be selling any while you're standing there." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want something hearty before you go out, and I've a goretusk shank that'd put iron in a gnoll's spine, if gnolls had spines." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and a proper one, I'd say, by the look of you. Bring me what you kill, and I'll tell you if you did it right." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at my block. You'll not want to watch the cleaver, I'd guess, but you're welcome to a bit of sausage." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want meat that'll keep you in that armour all day, and I've just the shank for it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Not one of the beasts on this block was killed cruelly, I'll have you know, so you can save the look." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! The knives on this block are mine, friend, and I count them every night." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! You couldn't keep my meat cold, could you? The ice house was the first thing the gnolls broke into." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Don't ask me for anything strange, mind; I sell boar, bear and condor, and that's all." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Sit down; I'll tell you about the hills' wildlife while I cut. The cleaver does the punctuating." },
      },
      again = {
        { id = "h_again", text = "Anything more before I get back to this side of pork?" },
        { id = "h_again2", text = "Speak up; I can't hear over the chopping." },
      },
      choices = {
        { text = "Show me your meat.", next = "BUSINESS" },
        { text = "Where does your meat come from?", next = "meat" },
        { text = "You said no gnoll. Someone must have asked.", next = "gnoll" },
        { text = "Who eats the most?", next = "eaters" },
        { text = "What do the soldiers eat before a march, Sherman?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What makes a clean kill, Sherman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever feed the wounded in the barracks, Sherman?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Have you ever had to defend your shop, Sherman?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What's changed in the hills' wildlife since the orcs came?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'd not have thought anyone stole from a butcher, Sherman.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Did the gnolls really break into your ice house, Sherman?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What strange things do warlocks ask a butcher for, Sherman?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you know the hills better than the hunters, Sherman?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    meat = {
      lines = { { id = "m_default", text = "Hunters and adventurers, mostly, since nobody in town wants to go into the hills alone any more. Condor, boar and the odd tarantula leg, which tastes better than you'd think, if you don't look at it." } },
      choices = {
        { text = "Tarantula sounds a strange thing to eat.", next = "meat_spider" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat_spider = {
      lines = { { id = "ms_default", text = "Ask Chef Breanna; she puts it in her goulash and the soldiers have never once complained. I don't tell them, and neither should you." } },
      choices = {
        { text = "They deserve to know what they're eating.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Meat is meat. Your secret's safe.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnoll = {
      lines = { { id = "g2_default", text = "A drunk soldier asked, once, and I threw him out the door myself. Gnolls eat our horses, and that's as close as I'll come to eating them back." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "redridge_gnolls" } } } },
    },
    eaters = {
      lines = { { id = "e_default", text = "The soldiers, by a mile. Breanna feeds the whole battalion, and every one of them eats like he'll not see supper again, which, the way things are, might be true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Lakeshire born, and I've cut meat at this inn longer than Brianna's kept it." } },
    advice = { { id = "tp_ad", text = "Cook it through, friend. Whatever it was, cook it through." } },
    _none = { { id = "tp_none", text = "Never heard of it, and unless you can roast it, I doubt I ever will." } },
  },
}

-- Gretchen Vogel: waitress in Chef Breanna's kitchen.
P:NPC {
  key = "gretchen_vogel", id = TODO_NPC("Gretchen Vogel"), name = "Gretchen Vogel", title = "Waitress",
  bible = "bibles/lakeshire_market.md", role = "citizen", tier = "service",
  communities = { "lakeshire" }, temper = { "harried" }, values = { "kind", "hardworking" },
  impression = {
    first = "Gretchen Vogel carries bowls from Chef Breanna's kitchen to half the soldiers in Lakeshire and never seems to sit down. She knows every soldier's name and which of them are missing.",
    third = "{name} met Gretchen Vogel, who waits on the soldiers from Chef Breanna's kitchen.",
  },
  greetings = {
    { id = "g_default", text = "Mind the tray, love, it's hot! Was there something you needed?" },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again! I'll find you a bowl in a moment, I promise." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Too many are. I carry bowls to empty seats sometimes, out of habit. Your spirits might know where they've gone." } },
      choices = {
        { text = "I'll help bring them back, Gretchen. That's a promise.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Stop carrying the bowls. They won't come back.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It would, though Breanna would never forgive me for saying so. The men on the far posts get one meal a day when I can carry it, and anything that fills a belly is welcome when the gnolls are coming up the hill." } },
      choices = {
        { text = "I'll leave some bread at the posts myself.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The soldiers can manage. I've my own work.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gretchen.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The ones posted out by Alther's Mill and the ridge past it, and that's not like them, because they always come for supper. I'd go myself, but Chef Breanna would skin me, so I'm asking anyone with a sword." } },
      choices = {
        { text = "I'll check on them, and bring you word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Soldiers go missing in war. I'll not chase them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gretchen.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They eat what I can carry to them, which isn't enough, and what they can hunt, which is less. If you'd leave a haunch at a watchtower now and then, I'd count it the kindest thing anyone's done for them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks better fed than the soldiers at the towers, {class}, and I mean that kindly, though it does make me sad." },
      },
      choices = {
        { text = "I'll leave them game whenever I pass.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hunt for myself. The army feeds its own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gretchen.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Would you? There's a whole list, and I've stopped reading it out loud because Breanna cries. Most of them went east toward Render's Valley and never came back down." } },
      choices = {
        { text = "I'll look for them, Gretchen, as many as I can.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Lost soldiers have lost purses. I'll look.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "How bad is it for the soldiers?", next = "soldiers_dying" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Some of them saw the Blackrock casters at Stonewatch, love, and they've nightmares still. Give them a nod and a kind word and they'll come round, because soldiers are softer than they look." } },
      choices = {
        { text = "I'll give them a kind word, then.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them stare. I'm not here to be liked.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How are the soldiers holding up?", next = "soldiers" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Tomas, in the corner bed, who took an arrow on the Stonewatch road and hasn't said a word since, and the two brothers who won't sleep unless the lamp's lit. I'd sit with them myself, but I've forty bowls to carry and only two hands." } },
      choices = {
        { text = "I'll sit with them tonight, Gretchen, as long as they need.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Silence and lamps aren't wounds. Others need me more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Gretchen.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It holds as long as the bowls keep coming and the names stay off the board in the barracks. The day that board fills faster than the pot empties, I don't know what they'll do, and I try not to think about it." } },
      choices = {
        { text = "Keep the bowls coming. Routine holds an army together.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Routine won't hold them. Let them grieve however they need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gretchen.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It might, if it tastes better than the broth, because they'll not drink anything bitter, the babies. Tomas in the corner bed hasn't slept a full night since Stonewatch, so start with him if you can." } },
      choices = {
        { text = "Wake them at dawn. A routine heals soldiers faster.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them sleep as long as they need. Rest is healing.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Gretchen Vogel, and I carry Chef Breanna's food to every soldier who can't come and get it, which lately is most of them. If you're hungry, the kitchen's that way, and if you're not, you've come to the wrong end of town." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! Could you stop by the barracks before you go? There are a few lads there who'd rather see a priest than another bowl of goulash, though don't tell Chef I said so." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "One of the Silver Hand, here! The soldiers will be glad to see you, and so am I; it's been a long while since anyone came from Stormwind who wasn't carrying orders." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Do you know any of the soldiers out at the watchtowers? I've bowls for six of them and I've not seen half of them in days." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll be out in the hills, then, and you'll see the watchtowers, so would you tell me if the soldiers there look well fed?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You'll know some herb for sleep, I hope, because half my soldiers lie awake every night and I've only soup to give them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Could you conjure a few loaves for the soldiers on the far posts? I've walked my feet raw carrying the kitchen's bread." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I know every soldier's name, and which of them are missing. Will you be one I remember?" },
      },
      again = {
        { id = "h_again", text = "What else, love? I've six more bowls to carry." },
        { id = "h_again2", text = "Quickly, then, before the stew goes cold." },
      },
      choices = {
        { text = "How many soldiers do you feed?", next = "soldiers" },
        { text = "What's Chef Breanna like?", next = "breanna" },
        { text = "You never seem to rest.", next = "rest" },
        { text = "You know which soldiers are missing. I could look for them.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Which soldiers haven't you seen lately, Gretchen?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the soldiers out in the hills eat well, Gretchen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Some of your soldiers stare at me like I'm an orc.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Which of the lads in the barracks needs a priest most, Gretchen?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is the soldiers' spirit holding, Gretchen?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would a draught of herbs help your soldiers sleep?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would conjured bread really help the soldiers, Gretchen?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Many soldiers seem to be missing, Gretchen.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll let you get on.", next = "END" },
      },
    },
    soldiers = {
      lines = { { id = "s_default", text = "Fewer every month. Chef still cooks for the full battalion out of habit, and I carry the extra bowls back to the kitchen, and we don't talk about it." } },
      choices = {
        { text = "Are they dying out there?", next = "soldiers_dying" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldiers_dying = {
      big = true,
      lines = { { id = "sd_default", fx = { learn = { "blackrock" } }, text = "Some, in the hills, and some just go home and don't come back. Stormwind promised more men, and the magistrate keeps asking, and the Blackrock keep coming whether anyone answers or not." } },
      choices = {
        { text = "Those who left are deserters. They should be punished.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I can't blame a man for going home.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    breanna = {
      lines = { { id = "b_default", text = "Kind, tired and loud, all at once. She'd feed the whole town from one pot if she could, and some weeks she nearly does, and she pays me in soup when the coin runs short." } },
      choices = {
        { text = "Being paid in soup seems a poor bargain.", next = "breanna_soup" },
        { text = "Something else.", next = "BACK" },
      },
    },
    breanna_soup = {
      lines = { { id = "bs_default", text = "Not with her soup, I don't. Crystal and I eat better than most of the town, and there's always a bowl to carry home, so I'd say Chef's the best employer in Redridge." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rest = {
      lines = { { id = "r_default", text = "When the soldiers do, love, and they never do. I sleep a bit after the last bowl's back and before Chef lights the fire, and my feet stopped knowing the difference a month ago." } },
      choices = {
        { text = "You deserve better than that.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up in Lakeshire and started carrying bowls for Chef the week the orcs came over the hills." } },
    advice = { { id = "tp_ad", text = "Eat while it's hot, love. Nothing stays hot long in Redridge." } },
    _none = { { id = "tp_none", text = "I wouldn't know, love; I only know who wants what for supper." } },
  },
}
