-- The Crossroads' traders and keepers not written elsewhere: Nargal Deatheye's weapons, Jahan
-- Hawkwing's leathers, Wrahk's cloth, Moorane Hearthgrain's bread, Reggifuz's stables, Halga
-- Bloodeye, and Lizzarik, the goblin who sells blades off the road between here and Ratchet.
-- Voices: bibles/nargal.md, bibles/jahan.md, bibles/wrahk.md, bibles/moorane.md,
-- bibles/reggifuz.md, bibles/halga.md, bibles/lizzarik.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Nargal Deatheye: the Crossroads' weaponsmith. Sells what the caravans bring and judges
-- every buyer by their grip.
---------------------------------------------------------------------------
P:NPC {
  key = "nargal", id = TODO_NPC("Nargal Deatheye"), name = "Nargal Deatheye", title = "Weaponsmith",
  bible = "bibles/nargal.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "gruff" }, values = { "proud", "practical" },
  notices = { "kit", "class" },
  impression = {
    first = "Nargal Deatheye sells weapons at the Crossroads and judges a buyer by how they hold a blade before he'll name a price. He has opinions about every edge on his rack and most of the people who buy them.",
    third = "{name} met Nargal Deatheye, the Crossroads' weaponsmith.",
  },
  greetings = {
    { id = "g_default", text = "Looking for steel? Pick it up, feel the weight, and don't wave it near my face." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Either you broke what I sold you, or you liked it enough to want another." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That weapon's been through a few fights it didn't win. I can't mend it, but I can sell you one that'll win the next." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. You'll want the daggers on the left, and you'll want to keep your hands where I can see them while you choose." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Nargal Deatheye. I sell blades, axes and maces to anyone at the Crossroads who can pay, and I tell them which ones will get them killed, which is a service nobody thanks me for." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior. Good, you'll know a real axe from a pretty one, which saves us both time." },
      },
      again = { { id = "h_again", text = "What else? I've customers." }, { id = "h_again2", text = "Go on, then." } },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Where do your weapons come from?", next = "source" },
        { text = "Which of these would get me killed?", next = "killed" },
        { text = "I'll look elsewhere.", next = "END" },
      },
    },
    source = {
      lines = { { id = "s_default", text = "Orgrimmar's forges, mostly, carried down by kodo caravan, and some from Ratchet when the goblins have something worth buying. Their steel's good, but they charge for the shipping as if they'd carried it on their backs." } },
      choices = {
        { text = "Goblin steel's worth the price if it holds.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Horde steel from Horde forges. That's how it should be.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    killed = {
      lines = { { id = "k_default", text = "That sword with the gold on the hilt, for a start, because the gold's the only thing holding the blade on. Buy plain, buy heavy, and buy something you can swing all day without your arm giving out." } },
      choices = {
        { text = "Then why do you sell it?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because someone always wants it, and I'd rather sell it to a fool here than have him buy worse in Ratchet. I warn them, and they buy it anyway, and the Barrens sorts out the rest." } },
      choices = {
        { text = "Fools make their own choices.", next = "BACK" },
        { text = "I'll take a look at your stock.", next = "BUSINESS" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know. If it's not sharp, I don't keep track of it." } },
  },
}

---------------------------------------------------------------------------
-- Jahan Hawkwing: a tauren who sells leather armor at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "jahan", id = TODO_NPC("Jahan Hawkwing"), name = "Jahan Hawkwing", title = "Leather Armor Merchant",
  bible = "bibles/jahan.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "calm" }, values = { "practical", "kind" },
  notices = { "craft", "race" },
  impression = {
    first = "Jahan Hawkwing sells leather armor at the Crossroads and knows which beast every piece came from. He is calm and unhurried, and he sizes up a customer the way a hunter reads tracks.",
    third = "{name} met Jahan Hawkwing, the tauren leather merchant of the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Welcome. Leather breathes in this heat, which is more than you can say for plate." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = { "Skinning", "Leatherworking" } },
      text = "You work hides yourself, I can tell by the stains. Feel the stitching on these, and tell me honestly if you've done better." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Mulgore leather fits a tauren better than anything the orcs make. I've a few pieces cut for our shoulders, if you want them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Jahan Hawkwing. I sell leather armor cut from the beasts of the Barrens and Mulgore, and every piece was hunted with respect, so wear it with respect." },
      },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "Ask what you like." } },
      choices = {
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "What beasts does your leather come from?", next = "beasts" },
        { text = "What do you mean, hunted with respect?", next = "respect" },
        { text = "Farewell.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "Kodo and plainstrider mostly, with zhevra for the light pieces. Zhevra hide is tough and thin, which is why the hunters here chase them, and why the zhevra kick so hard when they're caught." } },
      choices = {
        { text = "You look like you've hunted them yourself.", next = "hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunt = {
      lines = { { id = "hu_default", text = "I did, when I was young and quick. Now I buy from the hunters who come through, and I don't buy from the ones who leave carcasses rotting in the grass." } },
      choices = {
        { text = "Waste dishonors the hunt.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A dead beast doesn't care what happens to it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    respect = {
      lines = { { id = "r_default", text = "The hunter thanks the beast's spirit, and uses all of it, and takes no more than the herd can spare. It's the Earthmother's way, and the orcs are learning it, slowly." } },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's not something I know about. Leather, I know." } },
  },
}

---------------------------------------------------------------------------
-- Wrahk: sells tailoring supplies at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "wrahk", id = TODO_NPC("Wrahk"), name = "Wrahk", title = "Tailoring Supplies",
  bible = "bibles/wrahk.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "fussy" }, values = { "practical" },
  notices = { "craft", "kit" },
  impression = {
    first = "Wrahk sells thread, dye and cloth at the Crossroads and complains about the dust getting into all of it. Fussy and quick, with a sharp eye for a badly stitched hem.",
    third = "{name} met Wrahk, who sells tailoring supplies at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Wipe your hands before you touch the cloth, please. The dust in this place gets into everything." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Finally, someone who'll understand why I keep the good thread under the counter." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your clothes are falling off you in pieces. I can't mend them, but I could sell you enough thread to do it yourself." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Wrahk, and yes, I sell thread, dye and bolts of cloth here, of all places. The Crossroads gets more tailors passing through than you'd think, because everyone's clothes come apart on the road." },
      },
      again = { { id = "h_again", text = "What else? Quickly, before the wind picks up." } },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why sell cloth out here?", next = "why" },
        { text = "Those dyes didn't come from anywhere in the Barrens.", next = "dye" },
        { text = "Good day.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because nobody else would, and every soldier at the Crossroads needs a new shirt eventually. The dust eats cloth faster than moths do, so business never slows down." } },
      choices = {
        { text = "Does the dust ever stop?", next = "dust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dust = {
      lines = { { id = "d_default", text = "Not since I arrived, and I've been here three summers. The tauren say the Barrens was green once, and some days I'd give my best bolt of silk to see it." } },
      choices = {
        { text = "Maybe it will be green again.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dye = {
      lines = { { id = "dy_default", text = "Orgrimmar for the reds, the tauren of Mulgore for the earth colors, and goblins in Ratchet for anything bright, at goblin prices. I'd rather pay the goblins than go without blue." } },
      choices = {
        { text = "Fair trade with goblins is still fair trade.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Horde should make its own dyes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, and I've no time to find out. These hems won't stitch themselves." } },
  },
}

---------------------------------------------------------------------------
-- Moorane Hearthgrain: a tauren baker feeding the Crossroads garrison.
---------------------------------------------------------------------------
P:NPC {
  key = "moorane", id = TODO_NPC("Moorane Hearthgrain"), name = "Moorane Hearthgrain", title = "Baker",
  bible = "bibles/moorane.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "warm" }, values = { "kind", "generous" },
  notices = { "hunger", "race" },
  impression = {
    first = "Moorane Hearthgrain bakes bread for the Crossroads garrison and fusses over anyone who looks underfed. Her loaves are heavy, plain and warm, and she talks about grain the way others talk about gold.",
    third = "{name} met Moorane Hearthgrain, the tauren baker of the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Come in out of the sun, little one. The bread's just out, and it smells better than anything else in the Barrens." },
  },
  notice = {
    { id = "n_hungry", cat = "hunger", when = { hp = { max = 0.5 } },
      text = "You look half-starved and half-beaten, and bread won't fix the second, but it'll certainly help the first." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Another orc who thinks bread is what you eat when there's no meat. Try a slice before you decide, and you'll come back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Moorane Hearthgrain, and I bake for the Crossroads, which means a great many hungry grunts and very little grain. Buy a loaf, and eat it while it's warm." },
      },
      again = { { id = "h_again", text = "Anything else, little one?" } },
      choices = {
        { text = "I'll buy some bread.", next = "BUSINESS" },
        { text = "Where do you get grain out here?", next = "grain" },
        { text = "I'd guess the orcs aren't used to tauren bread.", next = "orcs" },
        { text = "Earthmother keep you.", next = "END" },
      },
    },
    grain = {
      lines = { { id = "g_default", text = "From Mulgore, by kodo caravan, and the caravans get raided more than I'd like. The Kolkar and the quilboar take it, and I'm left making smaller loaves and listening to grunts complain." } },
      choices = {
        { text = "The raiders should be punished for it.", next = "raid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raid = {
      lines = { { id = "r_default", text = "Sergra sends soldiers after them, and they come back with the grain more often than not. I'd rather the Kolkar learned to farm, but I don't think they're interested." } },
      choices = {
        { text = "Give them seed instead of swords, and see.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Raiders understand swords better than seed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "They complain, and then they come back every morning. Thork eats two loaves a day and tells everyone it's terrible, which I take as the highest compliment an orc can give." } },
      choices = {
        { text = "That sounds like Thork.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know about that, little one, but I know a good loaf, if you're hungry." } },
  },
}

---------------------------------------------------------------------------
-- Reggifuz: the goblin stable master at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "reggifuz", id = TODO_NPC("Reggifuz"), name = "Reggifuz", title = "Stable Master",
  bible = "bibles/reggifuz.md", role = "stablemaster", tier = "service",
  communities = { "crossroads" }, temper = { "pushy" }, values = { "greedy", "practical" },
  notices = { "pet", "class" },
  impression = {
    first = "Reggifuz runs the stables at the Crossroads like a counting-house, pricing every beast's feed and every risk out loud. He talks fast and never stops selling, even while he's shoveling.",
    third = "{name} met Reggifuz, the goblin who runs the Crossroads stables.",
  },
  greetings = {
    { id = "g_default", text = "Pal! Got a beast that needs boardin', or a beast that needs sellin'? I do one of those and I'm open to discussin' the other." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Whoa, whoa, look at your {pet}, now there's a beast with a good return on investment. Feed costs extra for the big ones, but I'll write it down on account." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! My favorite kind of customer, because you always come back, and you always bring somethin' with teeth." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Reggifuz, stable master, at your service and on the clock. I keep your beasts fed, watered and not eaten by the other beasts, which is harder than it sounds and worth every copper of the fee." },
      },
      again = { { id = "h_again", text = "What else, buddy? Time's money, and I'm losing both." } },
      choices = {
        { text = "I need the stable.", next = "BUSINESS" },
        { text = "Why does a goblin run a Horde stable?", next = "why", when = { faction = "Horde" } },
        { text = "What's the hardest beast you've boarded?", next = "hardest" },
        { text = "Will you take good care of my {pet}?", next = "care", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Later.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Horde's got beasts and I've got a shovel and a ledger, so it's a natural partnership, see? The Steamwheedle Cartel don't mind who I work for, as long as the books balance at the end of the month." } },
      choices = {
        { text = "A neutral trader is a useful thing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Pick a side, goblin.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = { { id = "h2_default", text = "A raptor some hunter dragged up from the south, and I'm still payin' for the stable door. It ate two buckets of feed, one kodo saddle and most of my cousin's eyebrows, and he says he'll invoice me for the eyebrows." } },
      choices = {
        { text = "Will he really invoice you?", next = "cousin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    care = {
      lines = { { id = "cr_default", text = "Pal, your {pet} gets the premium package: fresh water, a dry stall, and nobody pokes it with a stick unless it pokes first. That's in the contract, and I never break a contract I wrote myself." } },
      choices = {
        { text = "Then it's in good hands.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cousin = {
      lines = { { id = "c_default", text = "Already did, with interest, and I'm disputin' the interest on principle. Family's family, but a ledger's a ledger, and you don't let either one walk all over ya." } },
      choices = {
        { text = "Good luck with the dispute.", next = "BACK" },
        { text = "I'll stable my beast now.", next = "BUSINESS" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if I can't sell it or stable it, I'm not interested." } },
  },
}

---------------------------------------------------------------------------
-- Halga Bloodeye: an orc trader at the Crossroads.
---------------------------------------------------------------------------
P:NPC {
  key = "halga", id = TODO_NPC("Halga Bloodeye"), name = "Halga Bloodeye",
  bible = "bibles/halga.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "blunt" }, values = { "proud", "practical" },
  notices = { "gender", "kit" },
  impression = {
    first = "Halga Bloodeye trades at the Crossroads and bargains as if every copper were owed her personally. She is blunt and loud, and speaks well of Sergra Darkthorn to anyone who'll listen.",
    third = "{name} met Halga Bloodeye, a sharp-tongued orc trader at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Buying or browsing? Browsers stand to the left, and buyers come right up." },
  },
  notice = {
    { id = "n_woman", cat = "gender", when = { gender = "female", faction = "Horde" },
      text = "Another woman of the Horde on the road. Good, there are more of us out here every season, and Sergra likes to see it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's in a sorry state. Whatever you've been fighting, you've been losing a little each time." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Halga Bloodeye. I trade at the Crossroads because this is where the roads meet, and where the roads meet, there's always someone who needs something they didn't pack." },
      },
      again = { { id = "h_again", text = "Anything else? Make it worth my while." } },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What do you think of Sergra?", next = "sergra" },
        { text = "There must be a story behind your name.", next = "name" },
        { text = "Not today.", next = "END" },
      },
    },
    sergra = {
      lines = { { id = "s_default", text = "Best commander this outpost could have, and the only one who'd have kept it standing through the first Kolkar summer. Half the grunts grumble that a woman commands them, and the other half have the sense to shut up and follow her." } },
      choices = {
        { text = "What about Kargal Battlescar?", next = "kargal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kargal = {
      lines = { { id = "k_default", text = "That old boar sulks on his hill because the Warchief didn't give him the Crossroads. He's a fine soldier, I'll grant him that, but he's never forgiven her for being better at it." } },
      choices = {
        { text = "Command should go to whoever earns it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Seniority should count for something.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "A burst vessel in my eye from the time I carried a crate up the Crossroads tower on my own, because the peons were too slow. It never cleared up, and now nobody tries to haggle me down." } },
      choices = {
        { text = "It suits you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    sergra = { { id = "tp_sergra", text = "The best commander in the Barrens, and you can tell Kargal I said so.", next = "sergra" } },
    _none = { { id = "tp_none", text = "No idea. Ask me about prices." } },
  },
}

---------------------------------------------------------------------------
-- Lizzarik: a goblin weapons dealer who sells off the road between Ratchet and the
-- Crossroads, with hired muscle to keep his stock his own.
---------------------------------------------------------------------------
P:NPC {
  key = "lizzarik", id = TODO_NPC("Lizzarik"), name = "Lizzarik", title = "Weapon Dealer",
  bible = "bibles/lizzarik.md", role = "vendor", tier = "service",
  temper = { "pushy", "sly" }, values = { "greedy", "cunning" },
  notices = { "purse", "class" },
  impression = {
    first = "Lizzarik sells weapons from the back of his cart on the road between Ratchet and the Crossroads, with two bodyguards and a smile that never reaches his prices. He talks faster than any merchant I've met.",
    third = "{name} met Lizzarik, a goblin weapons dealer working the Barrens roads.",
  },
  greetings = {
    { id = "g_default", text = "Friend, friend, step right up! The finest weapons in the Barrens, sold right here on the road, no tower climbing and no Crossroads markup." },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Listen, listen, I can hear your purse from here, pal, and it's singin' my song. Let's find you somethin' with a little more shine on the blade." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Sparks and sprockets, I've got an axe here with your name on it, metaphorically speakin', because engravin' costs extra." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lizzarik, weapons and armaments, by appointment or on the road. I go where the customers go and charge for the convenience, and my two friends here make sure the convenience is mine." },
      },
      again = { { id = "h_again", text = "What else, chum? My boys are getting restless, and restless costs extra." } },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Who are your two friends?", next = "guards" },
        { text = "The road must be dangerous for a merchant.", next = "road" },
        { text = "Not interested.", next = "END" },
      },
    },
    guards = {
      lines = { { id = "g2_default", text = "Bodyguards, hired by the month, with a bonus for every raider they scare off and a penalty clause for every crate they drop. Cheaper than a caravan, cheaper than an army, and they don't ask for days off." } },
      choices = {
        { text = "They look like they've never had to fight.", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Once, against Kolkar, and they did fine, though one of 'em lost a tooth and billed me for it. I paid, because a bodyguard with a grudge is the worst kind of liability." } },
      choices = {
        { text = "Pay your people well. It's only fair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd have docked his wages for losing the tooth.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Sure it is, which is why my prices are so reasonable for what you're gettin'. Every raider on the road is a cost line, and every cost line gets passed along with a smile, on my mother's ledger." } },
      choices = {
        { text = "Then I'll see what you've got.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know it, can't sell it, so I'm not interested, chum." } },
  },
}
