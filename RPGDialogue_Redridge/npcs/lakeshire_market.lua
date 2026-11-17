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
    hello = {
      lines = {
        { id = "h_default", text = "Lamar Veisilli, and I sell fruit, which in Lakeshire these days is a bit like selling sunshine. The soldiers eat it by the barrel, the children steal it by the pocketful, and I'm happy enough with both." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid! Tell me honestly, do the trees mind when I sell their apples? I've always wondered, and nobody else in Lakeshire can ask them." },
        { id = "h_troll", when = { race = "Troll" }, text = "You'll be wanting bananas, I suppose, and I'm sorry to say I've none. Redridge is apple country, though I'll find you a sweet one." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Take an apple, take two, and don't tell me you're not hungry, because everyone who carries a sword in Redridge is hungry." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you'll know your way around the hills, then, which is where my orchards are, or where they were." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the basket; it's my last good one." },
        { id = "h_again2", text = "Ask on, friend; the apples need polishing either way." },
      },
      choices = {
        { text = "Let me buy some fruit.", next = "BUSINESS" },
        { text = "Where does your fruit come from?", next = "orchards" },
        { text = "The children steal from you?", next = "children" },
        { text = "How has the war changed Lakeshire?", next = "war" },
        { text = "Where do your apples come from now, Lamar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Are there beasts in the orchards, Lamar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    hello = {
      lines = {
        { id = "h_default", text = "Karen Taylor. I sell what smiths and miners need, and mostly I sell it to Verner Osgood, who'd buy every bar of iron in Redridge if the Guard let him keep any of it." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Good, then you'll not try to tell me that copper and tin are the same thing, like the last three humans did." },
        { id = "h_bridge", when = { questDone = TODO_QUEST("The Everstill Bridge") }, text = "You're the one who got Oslow's iron back from the gnolls. Good work, because I'd no more to sell him, and he'd been looking at my anvil." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Now, if you know how to swing a weapon, you might know how to swing a hammer too, and I'd respect you twice as much." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll be wanting ammunition, then, and I'll tell you now Henry Chapal's the man for shot, but I've the best whetstones for arrowheads." },
      },
      again = {
        { id = "h_again", text = "What else? Quick about it." },
        { id = "h_again2", text = "Ask, then, but I'll keep unpacking while you do." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why can't Verner keep his iron?", next = "verner" },
        { text = "Is there ore in these hills?", next = "ore" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "I'm a smith myself.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "I prefer lockboxes to ore, Karen.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Surely a mage has no use for a pick.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you sell anything for a warrior's gear, Karen?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do arrowheads need sharpening, Karen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    hello = {
      lines = {
        { id = "h_default", text = "Kara Adams, and I make shields for the Lakeshire watch and anyone else who means to stand between the town and the hills. A sword wins a fight, but a shield gets you home from it." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage, looking at shields? Your people think a spell is all the armour you need, but I've seen a mage take an orc's axe, and you'll forgive me if I recommend a buckler." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! I learned my best rim-work from a dwarven smith, so you'll find nothing here to shame you, I hope." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and I can tell by your stance you know which way to hold a shield, which is more than I can say for half the guard." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll not want a shield, I suppose, but you'll want something to stand behind when a goretusk charges, and a tree's not always handy." },
      },
      again = {
        { id = "h_again", text = "Anything more? This rim won't rivet itself, and the watch wants it by dusk." },
        { id = "h_again2", text = "Ask away, friend; my hammer keeps time while you talk." },
      },
      choices = {
        { text = "Show me your shields.", next = "BUSINESS" },
        { text = "What makes a good shield?", next = "good" },
        { text = "Who carries your shields?", next = "who" },
        { text = "Have you ever fought yourself?", next = "fought" },
        { text = "Which shield would you trust against the Blackrock, Kara?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters ever buy your shields, Kara?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Good day, Kara.", next = "END" },
      },
    },
    good = {
      lines = { { id = "g2_default", text = "A good shield is one you can lift all day without your arm shaking. The heavy ones look grand, but a tired soldier drops his guard, and a dropped guard is how the Blackrock win." } },
      choices = {
        { text = "So lighter is better?", next = "good_light" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_light = {
      lines = { { id = "gl_default", text = "Lighter is better until it breaks, and then it's worse than nothing. The trick is knowing where to put the weight, which is my job, and why I don't tell anyone how I do it." } },
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
    hello = {
      lines = {
        { id = "h_default", text = "Vernon Hale. I sell fishing tackle to anyone fool enough to fish Lake Everstill with the murlocs about, and there are more fools in Lakeshire than you'd think." },
        { id = "h_poachers", when = { questDone = TODO_QUEST("Murloc Poachers") }, text = "You're the one who cleared the murlocs off the shore for Baren! My customers have started catching fish again, and I'm selling hooks faster than I can bend them." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf on the docks! Your people fish Loch Modan, don't they? Then you'll find Everstill a good deal less friendly, I'm afraid." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, on my dock? You'll not catch much with that sword, though you might scare the murlocs off long enough for someone else to." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll know patience, then, and patience is the whole of fishing, so you're halfway to being a customer." },
      },
      again = {
        { id = "h_again", text = "Something else? I've line to untangle." },
        { id = "h_again2", text = "Go on. The fish aren't going anywhere, more's the pity." },
      },
      choices = {
        { text = "Let me see your tackle.", next = "BUSINESS" },
        { text = "How bad are the murlocs?", next = "murlocs" },
        { text = "Who teaches fishing here?", next = "hooper" },
        { text = "Any good fishing stories?", next = "story" },
        { text = "Have the murlocs ruined the fishing on the lake, Vernon?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the murlocs hunt the same fish as us, Vernon?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    hello = {
      lines = {
        { id = "h_default", text = "Sherman Femmel, butcher, and before you ask, no, it's not gnoll. Everything on this block came from a boar, a bear or a condor, and the inn's kitchen takes the best of it." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "A cook! Chef Breanna will want to talk to you, and so do I, because you'll know good meat from the stringy stuff the hills mostly give." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "Oh! Now, there's no beef on this block, I promise you that, and I'll not be selling any while you're standing there." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want something hearty before you go out, and I've a goretusk shank that'd put iron in a gnoll's spine, if gnolls had spines." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and a proper one, I'd say, by the look of you. Bring me what you kill, and I'll tell you if you did it right." },
      },
      again = {
        { id = "h_again", text = "Anything more before I get back to this side of pork?" },
        { id = "h_again2", text = "Speak up; I can't hear over the chopping." },
      },
      choices = {
        { text = "Show me your meat.", next = "BUSINESS" },
        { text = "Where does your meat come from?", next = "meat" },
        { text = "You said no gnoll. Has anyone asked?", next = "gnoll" },
        { text = "Who eats the most?", next = "eaters" },
        { text = "What do the soldiers eat before a march, Sherman?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What makes a clean kill, Sherman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    meat = {
      lines = { { id = "m_default", text = "Hunters and adventurers, mostly, since nobody in town wants to go into the hills alone any more. Condor, boar and the odd tarantula leg, which tastes better than you'd think, if you don't look at it." } },
      choices = {
        { text = "Tarantula? Really?", next = "meat_spider" },
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
    hello = {
      lines = {
        { id = "h_default", text = "Gretchen Vogel, and I carry Chef Breanna's food to every soldier who can't come and get it, which lately is most of them. If you're hungry, the kitchen's that way, and if you're not, you've come to the wrong end of town." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! Could you stop by the barracks before you go? There are a few lads there who'd rather see a priest than another bowl of goulash, though don't tell Chef I said so." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "One of the Silver Hand, here! The soldiers will be glad to see you, and so am I; it's been a long while since anyone came from Stormwind who wasn't carrying orders." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Do you know any of the soldiers out at the watchtowers? I've bowls for six of them and I've not seen half of them in days." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll be out in the hills, then, and you'll see the watchtowers, so would you tell me if the soldiers there look well fed?" },
      },
      again = {
        { id = "h_again", text = "What else, love? I've six more bowls to carry." },
        { id = "h_again2", text = "Quickly, then, before the stew goes cold." },
      },
      choices = {
        { text = "How many soldiers do you feed?", next = "soldiers" },
        { text = "What's Chef Breanna like?", next = "breanna" },
        { text = "Don't you ever rest?", next = "rest" },
        { text = "You know which soldiers are missing. I could look for them.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Which soldiers haven't you seen lately, Gretchen?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the soldiers out in the hills eat well, Gretchen?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Some of your soldiers stare at me like I'm an orc.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
        { text = "Do you mind being paid in soup?", next = "breanna_soup" },
        { text = "Something else.", next = "BACK" },
      },
    },
    breanna_soup = {
      lines = { { id = "bs_default", text = "Not with her soup, I don't. Crystal and I eat better than most of the town, and there's always a bowl to carry home, so I'd say Chef's the best employer in Redridge." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rest = {
      lines = { { id = "r_default", text = "When the soldiers do, love, and they never do. I sleep a bit after the last bowl's back and before Chef lights the fire, and that's enough for now." } },
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
