-- Sun Rock Retreat's traders: Grawnal (general goods), Kulwia (trade supplies), Krond (butcher),
-- Borand (bowyer). All Horde, all service tier. Voice: bibles/sun_rock_traders.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC = P.TODO_NPC

-- Grawnal: orc general goods vendor.
P:NPC {
  key = "grawnal", id = TODO_NPC("Grawnal"), name = "Grawnal", title = "General Goods",
  bible = "bibles/sun_rock_traders.md", role = "vendor", tier = "service",
  communities = { "sun_rock" }, temper = { "gruff", "practical" }, values = { "practical", "loyal" },
  notices = { "race", "purse", "weary" },
  impression = {
    first = "Grawnal sells bread, water and bags at Sun Rock and counts every crate twice, because every crate came up the mountain on a kodo's back. He grumbles like an old sergeant and means about half of it.",
    third = "{name} met Grawnal, the orc who keeps Sun Rock Retreat stocked with bread, water and bags.",
  },

  greetings = {
    { id = "g_default", text = "Bread, water, bags and thread, all of it carried up the mountain the hard way. Buy something, so the kodo's back ache was worth it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, because the last caravan made it up without losing a crate, and I'd like to sell what's in them." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the prices haven't moved while you were away, which is more than I can say for the road." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Another of the clans, this far from Durotar. Sit if you like, because the tauren built these benches and they're the only good thing in the place that I didn't haul up myself." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Forsaken. You don't eat much, I'm told, so I'll guess you want thread and a bag and none of the bread." },
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "Your purse sounds light from here, {class}. Water's cheap, and I don't sell credit to anyone, not even Maggran." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Your gear's falling off you. Borand can mend it next door, and I'll sell you bread for while you wait." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grawnal, and this is my stall. Everything Sun Rock eats, drinks or carries comes up the road from the Barrens on a kodo, and I'm the one who counts it when it gets here." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Earth Mother keep you, as your people say. Most of what I sell came up the road on your people's kodos, so you've more right to it than most." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A Darkspear this far into the mountains. The witch doctor down at Malaka'jin buys from me sometimes, and I don't ask what he does with the empty flasks." },
        { id = "h_young", when = { maxLevel = 16 },
          text = "You're young to be up here, {class}. Buy water, keep to the road, and stay away from the webs to the south, because Besseleth doesn't care how young you are." },
      },
      again = {
        { id = "h_again", text = "What else? I've crates to count, but I can count and listen." },
        { id = "h_again2", text = "Go on, then. The kodo's not unloading itself." },
      },
      choices = {
        { text = "How does it all get up here?", next = "road" },
        { text = "What sells best at Sun Rock?", next = "sells" },
        { text = "What's the trouble on the road?", next = "trouble" },
        { text = "How did an orc end up up here?", next = "why_here" },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Farewell, Grawnal.", next = "END" },
      },
    },

    road = {
      lines = {
        { id = "rd_default", text = "On a kodo, up from the Barrens, through the pass and past the Grimtotem, who watch every caravan go by like they're pricing it. The drovers are tauren and they're braver than I'd be, because I only count the crates once they're safe." },
      },
      choices = {
        { text = "Have the Grimtotem ever attacked a caravan?", next = "road_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_grim = {
      big = true,
      lines = {
        { id = "rg_default", text = "Twice since the thaw, and they took the water and left the bread, which tells you something about the Grimtotem. Maggran wants an escort on every caravan, and the tauren want to talk to the Grimtotem first, and while they argue I lose water." },
      },
      choices = {
        { text = "Talk first. They're still tauren.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Escort every caravan and strike back hard.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sells = {
      lines = {
        { id = "se_default", text = "Water, by a long way, because the springs up here taste of ash since the vale burned. After that it's bags, since everyone who comes through here is carrying something back for somebody." },
        { id = "se_lock", when = { class = "WARLOCK" }, text = "Water and bags, mostly, though I've had warlocks ask for odder things, and I tell them all the same. Ask Jeeda upstairs in the inn, and don't tell me what it's for." },
      },
      choices = {
        { text = "The springs taste of ash?", next = "sells_ash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_ash = {
      lines = {
        { id = "sa_default", text = "Ever since the Venture Company set the Charred Vale burning. Tammra says the land will clean the water in time, and I believe her, but I've a business to run in the meantime." },
      },
      choices = {
        { text = "Then the goblins owe you for every barrel.", next = "BACK", fx = { trait = { witty = 1 }, learn = { "venture_company" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },

    trouble = {
      lines = {
        { id = "tr_default", text = "Harpies on the cliffs, spiders on the Webwinder Path, and goblins cutting down anything with bark on it. Maggran keeps the braves busy, and I keep them fed, and neither of us gets much sleep." },
      },
      choices = {
        { text = "Which is the worst?", next = "trouble_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_worst = {
      big = true,
      lines = {
        { id = "tw_default", text = "The goblins, because harpies and spiders only want to eat you, and the goblins want to sell the mountain out from under all of us. Still, a goblin pays in coin, and I've taken their coin before, when they came up the road honest." },
      },
      choices = {
        { text = "Coin is coin. Sell to whoever pays.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I wouldn't sell a single loaf to the Venture Company.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why_here = {
      lines = {
        { id = "wh_default", text = "Orgrimmar needed someone to keep the post supplied, and I'd kept a warband in boots and bread through worse country than this. The tauren run the place, and I run the stall, and we get along because I never tell them how to pray." },
      },
      choices = {
        { text = "Do you miss Durotar?", next = "why_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_miss = {
      lines = {
        { id = "wm_default", text = "I miss the heat, and I miss being able to see a raider coming from a mile off. Here everything comes at you round a corner, and that's no way to live, though the air's better." },
      },
      choices = {
        { text = "The mountains suit you more than you admit.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Farewell, Grawnal.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Quartermaster to a warband once, shopkeeper now, and the work's the same, only the customers pay." } },
    advice = { { id = "tp_ad", text = "Carry more water than you think you'll need, because the springs past the vale aren't fit to drink." } },
    _none = { { id = "tp_none", text = "Don't know, and it's not on my shelves, so ask someone with more time than me." } },
  },
}

-- Kulwia: tauren trade supplies vendor; sells the enchanting formulas Hgarth's students need.
P:NPC {
  key = "kulwia", id = TODO_NPC("Kulwia"), name = "Kulwia", title = "Trade Supplies",
  bible = "bibles/sun_rock_traders.md", role = "vendor", tier = "service",
  communities = { "sun_rock" }, temper = { "patient", "warm" }, values = { "craft", "nature" },
  notices = { "craft", "race" },
  impression = {
    first = "Kulwia sells thread, vials, rods and a few enchanting formulas from a corner of Sun Rock, and she talks about craft the way other tauren talk about the Earth Mother. She asked what I make before she asked what I wanted.",
    third = "{name} met Kulwia, the patient tauren who sells trade supplies at Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, {class}. Tell me what you make, and I'll tell you what you need, which is not always the same thing." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to my corner. Good; I've new thread from Thunder Bluff, and it's finer than the last." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "You carry the smell of dust from a broken enchantment. Have you found Hgarth on his cliff yet? Few do on their first try." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor's fingers, I can see the needle calluses. My thread comes from Thunder Bluff, and it won't snap on you the way the goblins' thread does." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, so you'll want vials, and you'll want more of them than you think, because the mountain is hard on glass." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Earth Mother's blessing on you, kinsman. It's good to see a tauren face that isn't worried about the Grimtotem for once." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kulwia, and I sell what crafters need: thread, vials, rods, and a few formulas for those who work with enchantments. The traders come from Thunder Bluff twice a season, and in between I make do with what the mountain gives." },
        { id = "h_ench", when = { profession = "Enchanting" },
          text = "An enchanter, so you've come for my formulas, or for directions to Hgarth, or both. Most enchanters who reach Sun Rock want both, and they want the directions first." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I'm only sorting thread." },
        { id = "h_again2", text = "Ask, {class}. Craft goes better with talk." },
      },
      choices = {
        { text = "Where do I find Hgarth?", next = "hgarth" },
        { text = "Why do you sell enchanting formulas here?", next = "formulas" },
        { text = "What does the mountain give a crafter?", next = "mountain" },
        { text = "I'm no crafter. Should I learn something?", next = "learn", when = { maxLevel = 30 } },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Earth Mother keep you.", next = "END" },
      },
    },

    hgarth = {
      lines = {
        { id = "hg_default", text = "Up on the cliff above the town, on a ledge you would never find by looking for it. There's a narrow path from a nook behind the largest tent, steep enough that I've watched orcs climb it on their hands." },
      },
      choices = {
        { text = "Why does he live up there?", next = "hgarth_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hgarth_why = {
      big = true,
      lines = {
        { id = "hw_default", text = "He says the wind keeps the enchantments clean, and that anyone who won't climb for his teaching doesn't want it badly enough. I say he dislikes company, but I sell his students their rods, so I keep that to myself." },
      },
      choices = {
        { text = "A teacher should be easy to find.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The climb is a fair test. Let him keep it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    formulas = {
      lines = {
        { id = "fo_default", text = "Because Hgarth sends his students down to me when they need one, and because a formula weighs less than a crate of iron on a kodo's back. A tauren trader taught me to sell what travels light." },
      },
      choices = {
        { text = "Do tauren trust enchanting?", next = "formulas_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    formulas_trust = {
      lines = {
        { id = "ft_default", text = "Some of the elders don't, because they say it binds a spirit into a thing that never asked for one. I think a cloak that keeps a brave alive is a good thing, whatever is bound into it, but I don't argue with elders in public." },
      },
      choices = {
        { text = "The elders may have a point.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "A living brave matters more than old rules.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mountain = {
      lines = {
        { id = "mo_default", text = "Wood that has stood a thousand winters, if you can find any the goblins haven't cut, and stone, and the hides of beasts that climb. The Charred Vale gave us ash for a while, and the dyers used it, though nobody was glad of it." },
      },
      choices = {
        { text = "You used the ash from the fires?", next = "mountain_ash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mountain_ash = {
      big = true,
      lines = {
        { id = "ma_default", text = "We did, for grey dye, and some at Sun Rock said it was wrong to make anything from that burning. I said wasting it was worse, since the trees had already given everything they had." },
      },
      choices = {
        { text = "Nothing should be wasted, not even ash.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some things should be left alone to mourn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    learn = {
      lines = {
        { id = "le_default", text = "Everyone should make something with their hands, even a warrior, because a thing you've made is a thing nobody can take from you the way they take land. Learn to sew, or to skin, or to draw ore from rock, and you'll never go hungry on the road." },
      },
      choices = {
        { text = "I'll think on it, Kulwia.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I traded between Thunder Bluff and the Crossroads for years before I came up here. The mountain is quieter, most days." } },
    advice = { { id = "tp_ad", text = "Wrap your vials in cloth before you climb, because glass doesn't forgive a fall." } },
    _none = { { id = "tp_none", text = "I don't know that, {class}. Ask Jayka, because everyone tells the innkeeper everything eventually." } },
  },
}

-- Krond: orc butcher.
P:NPC {
  key = "krond", id = TODO_NPC("Krond"), name = "Krond", title = "Butcher",
  bible = "bibles/sun_rock_traders.md", role = "vendor", tier = "service",
  communities = { "sun_rock" }, temper = { "loud", "jovial" }, values = { "practical", "hearty" },
  notices = { "race", "hunger", "pet" },
  impression = {
    first = "Krond sells meat at Sun Rock with his sleeves rolled up and his voice at full volume, and he judges people by what they eat. He thinks the tauren are wrong about most things to do with dinner.",
    third = "{name} met Krond, the loud orc butcher of Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_default", text = "Meat! Ham, mutton, haunch and quail, and none of it harpy, whatever the braves tell you." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Good; a hungry fighter is a bad fighter, and a well-fed one is a regular customer." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for meat, but I'm still here, and so's the ham, so let's not waste the evening." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Tauren don't buy my mutton, and I've stopped asking why, because the last one explained it for an hour. There's quail, though, and nobody's ever been offended by a quail." },
    { id = "n_hunter_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} has been staring at my haunches since you came up the path. I don't give scraps away, but I'll sell you some cheap enough." },
    { id = "n_hungry", cat = "hunger", when = { resting = true },
      text = "You've the look of someone who's been living on trail bread. Sit down and eat something that used to walk." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Krond, butcher to Sun Rock, and the only orc for a hundred miles who can dress a mountain goat in the time it takes a tauren to apologise to it. The hunters bring the beasts in and I make them into dinner." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Good to see a proper orc appetite up here, because the tauren eat like birds and the trolls eat things I won't sell. Haunch, then? I can see it in your face." },
        { id = "h_scourge", when = { race = "Scourge" },
          text = "A Forsaken at the butcher's stall. I'll sell to anyone, but if you're buying for the smell, I'd rather not know." },
      },
      again = {
        { id = "h_again", text = "What else? Talk quick, the flies are bad today." },
        { id = "h_again2", text = "Still here? Then you're hungry, or curious, and I can help with both." },
      },
      choices = {
        { text = "Where does the meat come from?", next = "meat" },
        { text = "What's this about the tauren?", next = "tauren" },
        { text = "Any harpy on the menu?", next = "harpy" },
        { text = "Let me see what you've got.", next = "BUSINESS" },
        { text = "I'm not hungry. Farewell.", next = "END" },
      },
    },

    meat = {
      lines = {
        { id = "me_default", text = "Goats from the high slopes, boar when the hunters go down to the foothills, and mutton that comes up from the Barrens salted, because sheep don't climb. The quail are from Mirkfallon Lake, where they're fat and foolish." },
      },
      choices = {
        { text = "Do you hunt it yourself?", next = "meat_hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat_hunt = {
      lines = {
        { id = "mh_default", text = "Not anymore, because my knees gave out on the slopes and the braves are faster. I buy from anyone who brings it in clean, mind, and I can tell when a beast died badly, because it tastes of it." },
        { id = "mh_hunter", when = { class = "HUNTER" }, text = "Not anymore, but a hunter like you could bring me goats and I'd buy them fair. Kill clean, though, because I can taste a bad death, and so can my customers." },
      },
      choices = {
        { text = "A bad death has a taste?", next = "meat_taste" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat_taste = {
      big = true,
      lines = {
        { id = "mt_default", text = "It does, sour and tough, and the tauren say it's the spirit's anger and I say it's the fear in the blood. Either way, kill quick or don't bother bringing it to me." },
      },
      choices = {
        { text = "Then the spirits are right to be angry.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It's only meat. Spirits have nothing to do with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tauren = {
      lines = {
        { id = "ta_default", text = "They thank every beast before they eat it, which I respect, and they don't eat kodo, which I also respect, since I've met kodo. But a tauren once told me my mutton was cruel, and I've been trying to work that out for three winters." },
      },
      choices = {
        { text = "Maybe they meant the way you cut it.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "They honour the beast. You could too.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    harpy = {
      lines = {
        { id = "hp_default", text = "No, and anyone who says otherwise is a liar, because I tried it once when we were short, and it tasted of feathers and spite. The braves still bring them in as a joke, and I throw them off the cliff, which is where they came from." },
      },
      choices = {
        { text = "Fair. I won't bring you any.", next = "BACK", fx = { affinity = 1 } },
        { text = "Farewell, Krond.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Cooked for a warband, then for a camp, and now for a town, so I'm working my way up, aren't I?" } },
    advice = { { id = "tp_ad", text = "Never eat anything the trolls cook without asking what it was first, and then don't eat it anyway." } },
    _none = { { id = "tp_none", text = "Don't know, but if it was meat, I'd know it, so it wasn't meat." } },
  },
}

-- Borand: orc bowyer.
P:NPC {
  key = "borand", id = TODO_NPC("Borand"), name = "Borand", title = "Bowyer",
  bible = "bibles/sun_rock_traders.md", role = "vendor", tier = "service",
  communities = { "sun_rock" }, temper = { "dry", "steady" }, values = { "craft", "practical" },
  notices = { "class", "race", "weary" },
  impression = {
    first = "Borand is an orc who sells bows, which he admits is odd for an orc, and he defends it with the calm of someone who has watched harpies fly over axe-men. He mends gear while he talks and doesn't look up much.",
    third = "{name} met Borand, the orc bowyer of Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_default", text = "Bows, arrows and quivers, and I'll mend what you're wearing while you look. Mind the shavings." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did the last string hold? It should have; I waxed it myself." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, at last someone who'll know what they're looking at. Most here buy a bow by the colour." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior at the bowyer's. You'll want a bow for pulling harpies down off the rocks, which is wise, because they won't come down to your axe on their own." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. Your people throw and shoot better than mine, and I'll admit it, which I don't do for many." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "That gear's hanging off you in strips. Let me mend it before you buy anything, or you'll be back tomorrow in pieces." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Borand, bowyer. I make bows from mountain ash and sell arrows by the bundle, and I mend armour when the smith's away, which is always, because there isn't one." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Yes, an orc who makes bows, and yes, my father would have spat. My father never had to fight harpies on a cliff, though, so he can keep his opinions." },
      },
      again = {
        { id = "h_again", text = "Anything else? I can talk and string at the same time." },
        { id = "h_again2", text = "Go on. The glue's drying either way." },
      },
      choices = {
        { text = "Why does an orc make bows?", next = "why" },
        { text = "What makes a good bow up here?", next = "wood" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "Farewell, Borand.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because I watched three good grunts die on these cliffs with axes in their hands and nothing to swing them at. The harpies sat on the rocks and laughed, and I went and learned the bow the next season." },
      },
      choices = {
        { text = "Did the others mock you for it?", next = "why_mock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_mock = {
      big = true,
      lines = {
        { id = "wm_default", text = "Some did, until I shot a harpy off the rock above their heads. An orc fights with what wins, and anyone who says an axe is more honourable than an arrow hasn't buried enough friends." },
      },
      choices = {
        { text = "Honour is in how you fight, not what you carry.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Winning matters. Honour can wait for the songs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wood = {
      lines = {
        { id = "wd_default", text = "Mountain ash from above the tree line, because it grows slow and bends without breaking. The goblins cut the good stands down for their mills, and I have to climb higher every year to find a stave worth the work." },
      },
      choices = {
        { text = "So the Venture Company costs you too?", next = "wood_venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_venture = {
      lines = {
        { id = "wv_default", text = "It costs everyone, but I notice it in my arms when I'm climbing. Tell Maggran's braves to save me any ash they find when they burn a Venture camp, and I'll string them a bow each for it." },
      },
      choices = {
        { text = "I'll tell them, Borand.", next = "BACK", fx = { affinity = 1, learn = { "venture_company" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },

    buyers = {
      lines = {
        { id = "bu_default", text = "The braves, mostly, and hunters passing through to Desolace, and the odd tauren who'd rather shoot a harpy than fight it. Trolls buy arrows and laugh at my bows, so I charge them full price." },
      },
      choices = {
        { text = "Serves them right.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Farewell, Borand.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Grunt first, bowyer second. The second one keeps more people alive." } },
    advice = { { id = "tp_ad", text = "Shoot harpies when they land, not when they're in the air, because they always land to gloat." } },
    _none = { { id = "tp_none", text = "I don't know. I make bows, so ask me about bows." } },
  },
}
