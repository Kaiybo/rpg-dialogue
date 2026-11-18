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
      again = { { id = "h_again", text = "What else? I've customers, and an orc's time is worth steel." }, { id = "h_again2", text = "Go on, then." } },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Where do your weapons come from?", next = "source" },
        { text = "Which of these would get me killed?", next = "killed" },
        { text = "I'll look elsewhere.", next = "END" },
      },
    },
    source = {
      lines = { { id = "s_default", text = "Orgrimmar's forges, mostly, carried down by kodo caravan, and some from Ratchet when the goblins have something worth buying. The goblins' steel is good, but they charge for the shipping as if they'd carried it on their backs." } },
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
    _none = { { id = "tp_none", text = "Don't know, grunt. If it's not sharp, I don't keep track of it." } },
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
    first = "Jahan Hawkwing sells leather armor at the Crossroads and knows which beast every piece came from. He is calm and unhurried, and he reads a customer's boots the way a hunter reads tracks.",
    third = "{name} met Jahan Hawkwing, the tauren leather merchant of the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, friend. Leather breathes in this heat, which is more than you can say for plate, and the kodo who gave it walked these same plains." },
    { id = "g_back", when = { metBefore = true }, text = "You've walked a long way since I last saw those boots, friend. Come, stand in the shade, and let the dust settle before we talk." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Come in, and tell me what you've taken this season, and how much of it you used." },
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
      again = {
        { id = "h_again", text = "What else, friend? There is no hurry under An'she's sky." },
        { id = "h_again2", text = "Ask what you like." },
        { id = "h_again3", text = "Take your time. The leather isn't going anywhere, and neither am I." },
      },
      choices = {
        { text = "Let me see your armor.", next = "BUSINESS" },
        { text = "What beasts does your leather come from?", next = "beasts" },
        { text = "What do you mean, hunted with respect?", next = "respect" },
        { text = "Why do you keep looking at my boots?", next = "boots" },
        { text = "What do you make of Nargal next door?", next = "nargal" },
        { text = "I've hides to sell, if you're buying.", next = "hunter_hides", when = { class = "HUNTER" } },
        { text = "I've worn a beast's shape myself.", next = "druid", when = { class = "DRUID" } },
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
    boots = {
      lines = {
        { id = "bo_default", text = "Because boots tell the truth when people don't. Yours have walked through red dust and over stone, and the left heel's worn more than the right, so you favour that side when you're tired." },
        { id = "bo_low", when = { maxLevel = 12 }, text = "Because boots tell the truth when people don't, and yours are barely scuffed. You haven't walked far yet, friend, but the Barrens will see to that soon enough." },
        { id = "bo_high", when = { minLevel = 25 }, text = "Because boots tell the truth, and yours have been mended more times than they've been cleaned. You've walked further than most who stop at my stall, and I'd guess you ran a fair bit of it." },
      },
      choices = {
        { text = "What else can you read in them?", next = "boots_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boots_ask = {
      lines = { { id = "ba_default", text = "Only where they've been, and never why, and that part I'd have to ask you. So tell me, friend, what brings you walking across the Barrens?" } },
      choices = {
        { text = "Duty. Someone has to keep these roads safe.", next = "bk_duty", fx = { trait = { brave = 1 } } },
        { text = "Gold, mostly. There's good work out here.", next = "bk_gold", fx = { trait = { greedy = 1 } } },
        { text = "I want to see the whole land.", next = "bk_see", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },
    bk_duty = {
      lines = { { id = "bkd_default", text = "Then your boots and your heart agree, which is rarer than you'd think. Walk carefully, and remember that the land you keep safe was here long before the roads were." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bk_gold = {
      lines = { { id = "bkg_default", text = "An honest answer, at least, and the Barrens has gold enough for those who earn it. Only don't take more from the land than you need, because it remembers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bk_see = {
      lines = { { id = "bks_default", text = "Then you have the right reason, and the right boots for it, if you mend them. My father once walked from Mulgore to the Thousand Needles just to see the mesas, and he called it the best walk of his life." } },
      choices = { { text = "Something else, Jahan.", next = "BACK" } },
    },
    nargal = {
      lines = { { id = "na_default", text = "Nargal judges a buyer by the grip, and I judge by the boots, and between us we don't miss much. He's a hard one, and he sells weapons to fools on purpose, but he has never once sold a bad blade as a good one." } },
      choices = {
        { text = "Do you two ever disagree?", next = "nargal_disagree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nargal_disagree = {
      lines = { { id = "nd_default", text = "Every time a hunter brings me a hide with three arrows' worth of holes in it. Nargal says it shows the hunter is keen, and I say it shows the hunter can't shoot, and we sit with that until the sun goes down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter_hides = {
      big = true,
      lines = { { id = "hh_default", text = "Perhaps, friend, but first tell me what you left behind on the plain. I buy from hunters who take the meat and the sinew as well as the hide, and I've turned away finer leather than mine from those who don't." } },
      choices = {
        { text = "Every part gets used. Nothing's left to rot.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I take the hide and move on. Scavengers eat too.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then you know better than any of us that a beast is not a coat to be taken off and hung up. The druids I've met wear leather gladly, though, so I think the Earthmother allows it, so long as we remember who wore it first." } },
      choices = {
        { text = "We remember. That's what matters.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That's not something I know about. Leather I know, and boots, and the people standing in them." } },
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
    first = "Wrahk sells thread, dye and cloth at the Crossroads, complains about the dust getting into all of it, and brushes the counter between sentences. Wrahk is fussy and quick, with a sharp eye for a badly stitched hem.",
    third = "{name} met Wrahk, who sells tailoring supplies at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Wipe your hands before you touch the cloth, please. The dust in this place gets into everything." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Stand there, on the mat, where the dust can't follow you in." },
    { id = "g_robe", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "A robe-wearer! Let me see the hem before you say anything, because I can always tell how a caster's been treating their clothes." },
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
      again = {
        { id = "h_again", text = "What else? Quickly, before the wind picks up." },
        { id = "h_again2", text = "Go on, I'm listening, though I'll be brushing while I do it." },
        { id = "h_again3", text = "What else? And mind your sleeve on the dye pots." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why sell cloth out here?", next = "why" },
        { text = "Those dyes didn't come from anywhere in the Barrens.", next = "dye" },
        { text = "You keep glaring at the bakery.", next = "flour" },
        { text = "Why are you staring at my hem?", next = "hem" },
        { text = "Show me the good thread under the counter.", next = "good_thread", when = { profession = "Tailoring" } },
        { text = "How do I keep a robe clean out here?", next = "robe", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
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
    flour = {
      lines = { { id = "fl_default", text = "Moorane's bakery sits upwind of my stall, and every morning a fine white cloud of flour comes drifting over my black wool. Flour, dust and kodo hair, that's the Crossroads for you, and only one of them ever apologizes." } },
      choices = {
        { text = "Have you told her?", next = "flour_told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flour_told = {
      lines = { { id = "ft_default", text = "Told her? I marched over there with a ruined bolt in my hands, and she gave me a warm loaf and called me little one. How is anyone supposed to stay angry at that?" } },
      choices = {
        { text = "Then eat the bread and forgive her.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hem = {
      lines = { { id = "he_default", text = "Because I can't help it, and I've been looking at it since you walked in. Who stitched that hem, if you don't mind my asking, and you'd better not say a goblin." } },
      choices = {
        { text = "I stitched it myself.", next = "he_self", fx = { trait = { independent = 1 } } },
        { text = "I bought it. I don't sew.", next = "he_bought", fx = { trait = { practical = 1 } } },
        { text = "It came off a quilboar, actually.", next = "he_quil", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
    he_self = {
      lines = {
        { id = "hs_default", text = "Then you've patient hands and a crooked eye, which is better than the other way around. Take the stitches smaller and pull them tighter, and the dust won't get into the seam." },
        { id = "hs_tailor", when = { profession = "Tailoring" }, text = "Then you're a tailor who's been too busy to look after your own clothes, which is the oldest sin in our trade. Fix it tonight, before anyone else notices." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    he_bought = {
      lines = { { id = "hb_default", text = "Then whoever sold it to you owes you an apology, and a better needle. Bring it here when it splits, and I'll sell you the thread to do it properly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    he_quil = {
      lines = { { id = "hq_default", text = "Off a quilboar, and you've worn it into a cloth shop, which explains the smell and half the dust. Stand a little further from the silk, please." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    good_thread = {
      lines = { { id = "gt_default", text = "Fine, but only because you'll appreciate it, and only to look. That's silk thread from Ratchet, dyed blue, and it cost more than this stall, so I keep it wrapped in three cloths where the Barrens can't get at it." } },
      choices = {
        { text = "That's beautiful thread.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    robe = {
      lines = { { id = "ro_default", text = "You don't, not truly, but you can shake it out every evening, brush it every morning and never sit on the ground. The orcs laugh at me for brushing my sleeves, and the orcs smell of kodo, so I know whose laugh I trust." } },
      choices = {
        { text = "I'll brush it every morning, then.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "A little dust never hurt anyone.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, and I've no time to find out. These hems won't stitch themselves, and the dust certainly won't brush itself off them." } },
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
    first = "Moorane Hearthgrain bakes bread for the Crossroads garrison and fusses over anyone who looks underfed. Her loaves are heavy, plain and warm, and she talks about the crock of sourdough she carried from Mulgore as if it were one of the family.",
    third = "{name} met Moorane Hearthgrain, the tauren baker of the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Come in out of the sun, little one. The bread's just out, baked from Mulgore grain the Earth Mother grew, and it smells better than anything else in the Barrens." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, little one? Good, because you still look too thin to me, and we'll see about that." },
    { id = "g_undead", when = { race = "Scourge" }, text = "Come in out of the sun, little one, though I suppose the sun doesn't trouble you much any more." },
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
        { id = "h_default", key = true, text = "I'm Moorane Hearthgrain, and I bake for the Crossroads, which means a great many hungry grunts and very little grain. Back home the wheat stands taller than a calf; here I make do. Buy a loaf, and eat it while it's warm." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A child of Mulgore! Come and tell me whether this crust tastes like home, because I've been arguing with this oven since the spring rains." },
      },
      again = {
        { id = "h_again", text = "Anything else, little one? The oven is patient, and so am I." },
        { id = "h_again2", text = "What else, little one? Talk while I knead, for the dough doesn't mind listening." },
        { id = "h_again3", text = "Go on, but don't let the bread go cold while you think." },
      },
      choices = {
        { text = "I'll buy some bread.", next = "BUSINESS" },
        { text = "Where do you get grain out here?", next = "grain" },
        { text = "I'd guess the orcs aren't used to tauren bread.", next = "orcs" },
        { text = "What makes your bread different?", next = "starter" },
        { text = "You fuss over everyone, don't you?", next = "fuss" },
        { text = "I don't really need to eat any more.", next = "undead", when = { race = "Scourge" } },
        { text = "I cook too. Any advice for a fellow cook?", next = "cook", when = { profession = "Cooking" } },
        { text = "Earthmother keep you.", next = "END" },
      },
    },
    grain = {
      lines = { { id = "gr_default", text = "From Mulgore, by kodo caravan, and the caravans get raided more than I'd like. The Kolkar and the quilboar take it, and I'm left making smaller loaves and listening to grunts complain." } },
      choices = {
        { text = "The raiders should be punished for it.", next = "raid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raid = {
      lines = { { id = "r_default", text = "Sergra Darkthorn sends soldiers after them, and they come back with the grain more often than not. I'd rather the Kolkar learned to farm, but I don't think they're interested." } },
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
    starter = {
      lines = { { id = "st_default", text = "The mother, little one, a crock of sourdough I carried down from Bloodhoof Village, and every loaf in the Crossroads starts with a spoonful of her. She's older than half the grunts in this garrison, and better behaved than most of them." } },
      choices = {
        { text = "You talk about it like it's alive.", next = "starter_alive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    starter_alive = {
      lines = { { id = "sa_default", text = "She is alive, and she's hungry, so I feed her every morning before I feed anyone else. A grunt knocked her off the shelf once, and the whole Crossroads ate flatbread for three days while I coaxed her back, and they still won't let him forget it." } },
      choices = { { text = "Something else, Moorane.", next = "BACK" } },
    },
    fuss = {
      lines = { { id = "fu_default", text = "Of course I do, somebody has to, and the soldiers here think a strip of dried kodo and a swallow of grog counts as supper. Now look at me, little one, and tell me when you last sat down to a proper meal." } },
      choices = {
        { text = "This morning, honestly. I eat well.", next = "fu_well", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "I can't remember, to tell the truth.", next = "fu_forgot", fx = { affinity = 2 } },
        { text = "Meat and grog is a proper meal.", next = "fu_grog", fx = { trait = { stubborn = 1 } } },
      },
    },
    fu_well = {
      lines = { { id = "fw_default", text = "Good, then I'll only worry about you a little, which is the least I can manage for anyone. Buy a loaf for the road all the same, and don't let it go stale at the bottom of your pack." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fu_forgot = {
      lines = { { id = "ff_default", text = "You can't remember! Earthmother's mercy, sit down this instant, and don't get up again until you've eaten something with a crust on it, because I've chased bigger warriors than you back to a bench." } },
      choices = { { text = "Yes, Moorane.", next = "BACK" } },
    },
    fu_grog = {
      lines = { { id = "fg_default", text = "That's what Thork says, and Thork eats two of my loaves a day while he's saying it. You'll come round, little one, they all do, and it only takes one cold night on the road." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    undead = {
      lines = { { id = "un_default", text = "Oh, oh dear, I didn't think, and here I am pushing bread at you like a fool. Well, stand by the oven anyway, little one, because warmth does anyone good, and you can tell me whether you remember what fresh bread smelled like." } },
      choices = {
        { text = "I remember. It smelled like home.", next = "BACK", fx = { affinity = 2 } },
        { text = "I don't remember, and I don't miss it.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    cook = {
      lines = { { id = "co_default", text = "Don't hurry the dough, and don't trust an orc who says he likes it burnt, because he's only being polite to the cook. And salt it more than you think, little one, because everyone out here sweats." } },
      choices = {
        { text = "I'll remember that, Moorane.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know about that, little one, but I know a good loaf, and you look like you need one more than you need an answer." } },
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
    first = "Halga Bloodeye trades at the Crossroads and bargains as if every copper were owed her personally. She is blunt and loud, treats a haggle like a duel, and speaks well of Sergra Darkthorn to anyone who'll listen.",
    third = "{name} met Halga Bloodeye, a sharp-tongued orc trader at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Buying or browsing? Browsers stand to the left, and buyers come right up." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, our last haggle was too easy, and I've been sharpening my prices since." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior. You'll know a fair fight when you see one, so come and haggle like you mean it." },
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
      again = {
        { id = "h_again", text = "Anything else? Make it worth my while, {class}." },
        { id = "h_again2", text = "Speak up, I've been shouting prices since dawn and I can't hear quiet talk." },
        { id = "h_again3", text = "Well? A bargain doesn't wait, and neither do I." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What do you think of Sergra Darkthorn?", next = "sergra" },
        { text = "There must be a story behind your name.", next = "name" },
        { text = "Do you ever lose a haggle?", next = "haggle" },
        { text = "What about the goblin selling blades on the road?", next = "lizzarik" },
        { text = "Goblins drive harder bargains than orcs.", next = "goblin", when = { race = "Goblin" } },
        { text = "I'd rather fight you than haggle with you.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Not today.", next = "END" },
      },
    },
    sergra = {
      lines = { { id = "s_default", text = "She's the best war leader this outpost has, and the one who kept it standing through the first Kolkar summer. Half the grunts grumble about taking orders from a woman, and the other half have the sense to shut up and follow her." } },
      choices = {
        { text = "Did anyone else want her post?", next = "kargal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kargal = {
      lines = { { id = "k_default", text = "Kargal Battlescar did, and that old boar sulks in his watchtower up north because the Warchief favored her. He's a fine soldier, I'll grant him that, but he's never forgiven her for being better at it." } },
      choices = {
        { text = "Command should go to whoever earns it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Seniority should count for something.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "It's from a burst vessel in my eye, from the time I carried a crate up the Crossroads tower on my own, because the peons were too slow. It never cleared up, and now nobody tries to haggle me down." } },
      choices = {
        { text = "It suits you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    haggle = {
      lines = { { id = "ha_default", text = "Not since the eye, and not often before it. A haggle is a fight with copper instead of axes, and the one who blinks first pays full price, so I made sure I'd never blink again." } },
      choices = {
        { text = "Try me, then.", next = "haggle_try" },
        { text = "Something else.", next = "BACK" },
      },
    },
    haggle_try = {
      lines = { { id = "ht_default", text = "Ha! It's only practice, mind, so keep your hand off your purse. Here's a waterskin, good leather, and I say it's worth a silver, so what do you offer me, and look me in the eye when you say it?" } },
      choices = {
        { text = "A silver. Your price, fair and square.", next = "hg_full", fx = { affinity = -1, trait = { honest = 1 } } },
        { text = "Twenty copper, and you'll thank me for it.", next = "hg_low", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Nothing. I'll come back when you're desperate.", next = "hg_walk", fx = { affinity = 1, trait = { patient = 1 } } },
      },
    },
    hg_full = {
      lines = { { id = "hf_default", text = "Full price, without a fight? Bah, you've no blood in you, and I'd take your silver and think less of you for the rest of the day. Next time, insult me a little, because that's half the fun." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hg_low = {
      lines = { { id = "hl_default", text = "Twenty copper! You've got a nerve, and I like a nerve, though if this were a real sale I'd have thrown you out by the ear. We'd have met at sixty, mind, and we'd both have told the story differently." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hg_walk = {
      lines = { { id = "hw_default", text = "Desperate, me? I'll be here when the Crossroads is dust and you're bones, but I'll grant you that walking away is the one move I can't answer, so somebody's taught you something." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lizzarik = {
      big = true,
      lines = { { id = "li_default", text = "Lizzarik, with his cart and his two hired lumps? He sets up on the road, out of sight of the tower, and sells the same caravan steel as Nargal without paying a copper to keep the walls up, so every blade he sells is a blade the Crossroads levy never sees." } },
      choices = {
        { text = "Then he should pay what the rest of you pay.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The road's free. Let the better trader win.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblin = {
      lines = { { id = "go_default", text = "Harder? Goblins drive longer bargains, and they talk until you agree just to make them stop. An orc tells you the price once, and if you don't like it, you can carry your own crate up the tower." } },
      choices = {
        { text = "Then haggle with me, and we'll see.", next = "haggle_try" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Then you'd lose twice, once with your axe and once with your purse, because I've done both and I'm still standing. Save your strength for the Kolkar, warrior, and leave the haggling to those with the stomach for it." } },
      choices = {
        { text = "Some other day, then, Halga.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    sergra = { { id = "tp_sergra", text = "Sergra Darkthorn is the best war leader in the Barrens, and you can tell Kargal Battlescar I said so.", next = "sergra" } },
    _none = { { id = "tp_none", text = "No idea. Ask me about prices, and I'll answer loud enough for the whole Crossroads to hear." } },
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
    first = "Lizzarik sells weapons from the back of his cart on the road between Ratchet and the Crossroads, with two bodyguards and a smile that never reaches his prices. He talks faster than any merchant I've met, and he'd rather die than pay rent to a wall.",
    third = "{name} met Lizzarik, a goblin weapons dealer working the Barrens roads.",
  },
  greetings = {
    { id = "g_default", text = "Friend, friend, step right up! The finest weapons in the Barrens, sold right here on the road, no tower climbing and no Crossroads markup." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, it's my repeat customer! Repeat customers get my warmest smile, which is the same smile, pal, but I mean it more." },
    { id = "g_green", when = { maxLevel = 15 }, text = "Whoa, kid, you look fresh off the road. Starter rack's on the left, and nothin' on it'll cut you worse than it cuts the quilboar." },
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
        { id = "h_goblin", when = { race = "Goblin" }, text = "Hey, a fellow goblin out on the road! You know the drill, pal: you don't undercut my cart, I don't undercut yours, and we both smile at the orcs." },
      },
      again = {
        { id = "h_again", text = "What else, chum? My boys are getting restless, and restless costs extra." },
        { id = "h_again2", text = "Talk while you browse, chum, because it's the same price either way." },
        { id = "h_again3", text = "Still here? Good, standin' near the cart is free, for now." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Who are your two friends?", next = "guards" },
        { text = "The road must be dangerous for a merchant.", next = "road" },
        { text = "Why not sell at the Crossroads like everyone else?", next = "rivals" },
        { text = "What's stopping me from just taking a blade?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Who do you work for, the Cartel or yourself?", next = "cartel", when = { race = "Goblin" } },
        { text = "Not interested.", next = "END" },
      },
    },
    guards = {
      lines = { { id = "g2_default", text = "Bodyguards, hired by the month, with a bonus for every raider they scare off and a penalty clause for every crate they drop. They're cheaper than a caravan and cheaper than an army, and they don't ask for days off." } },
      choices = {
        { text = "They look like they've never had to fight.", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Once, against Kolkar, and they did fine, though one of 'em lost a tooth and billed me for it. I paid, because a bodyguard with a grudge is the worst kind of liability, and now I call him Discount, which he hates even more than the Kolkar." } },
      choices = {
        { text = "Pay your people well. It's only fair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd have docked his wages for losing the tooth.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Sure it is, which is why my prices are so reasonable for what you're gettin'. Every raider on the road is a cost line, and every cost line gets passed along with a smile, on my mother's ledger." } },
      choices = {
        { text = "So where's safe, then?", next = "road_ask" },
        { text = "Then I'll see what you've got.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_ask = {
      lines = { { id = "ra_default", text = "Depends where you're goin', pal, and I price advice by the mile. So which is it, Ratchet, somewhere with more teeth, or are you the quiet type?" } },
      choices = {
        { text = "Ratchet, to catch the boat.", next = "ra_ratchet", fx = { trait = { cautious = 1 } } },
        { text = "Wherever the fighting is.", next = "ra_fight", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "That's my business, not yours.", next = "ra_private", fx = { trait = { discreet = 1 } } },
      },
    },
    ra_ratchet = {
      lines = { { id = "rr_default", text = "Ratchet's a fine town, full of honest goblins, by which I mean goblins who only rob you inside a shop. Keep to the road and buy a blade before you go, because the pirates down on the coast don't accept apologies." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ra_fight = {
      lines = { { id = "rf_default", text = "Now that's a customer after my own heart, because the fightin' kind always comes back for a second blade. Head south past the Crossroads if you want trouble, and the Kolkar and the quilboar have plenty to share." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ra_private = {
      lines = { { id = "rp_default", text = "Ha! Now that's a businessman's answer, and I respect it, I really do. Just remember whose cart you passed when you get wherever you're goin' and find out what they charge there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rivals = {
      lines = { { id = "rv_default", text = "And pay for a roof, a wall, a guard tower and the Crossroads levy on top of the steel, like Nargal and that loud one, Halga? I sell blades off the same caravans, and the only overhead I carry is two bodyguards and a wheel that squeaks." } },
      choices = {
        { text = "Doesn't the Crossroads keep the road safe for you?", next = "rivals_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals_safe = {
      big = true,
      lines = { { id = "rs_default", text = "Sure, and I tip my hat to every grunt I pass, which is my contribution to the war effort. But a levy's a levy, pal, and I never paid for anything I could get by standin' a little further down the road." } },
      choices = {
        { text = "If the Horde guards the road, you should pay your share.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Smart. Why pay for walls you don't sleep behind?", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      big = true,
      lines = { { id = "ro_default", text = "Two reasons, pal, and they're both standin' right behind you. Besides, I've already priced the theft into everybody else's blades, so if you rob me, you're really robbin' the next customer, and that's on your conscience." } },
      choices = {
        { text = "I'd never steal from an honest trader.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your boys look slow. I'm not.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cartel = {
      lines = { { id = "ca_default", text = "Myself, mostly, with a Steamwheedle stamp on the paperwork so the Ratchet boys don't ask questions. The Cartel takes its cut, I take mine, and the customer takes whatever's left, which is usually a very nice axe." } },
      choices = {
        { text = "Sounds like a good arrangement.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know it, can't sell it, so I'm not interested, chum. Ask me about blades, though, and I'll talk till the cart wheel falls off." } },
  },
}
