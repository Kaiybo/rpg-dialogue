-- Cenarion Hold's tradesfolk (0.39.0): the enchanting supplier upstairs at the inn, the reagent and poison
-- seller, and the stable master. Voice: bibles/silithus.md ("Hold tradesfolk")
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "kania", id = TODO_NPC("Kania"), name = "Kania", title = "Enchanting Supplies",
  bible = "bibles/silithus.md", role = "vendor", tier = "service",
  communities = { "cenarion_hold" }, temper = { "precise" }, values = { "craft", "careful" },
  notices = { "craft", "arcane" },

  impression = {
    first = "Kania sells enchanting supplies from a quiet corner upstairs in the inn at Cenarion Hold, away from the sand. She keeps her formulae wrapped in cloth and speaks about them like rare plants.",
    third = "{name} met Kania, who sells enchanting supplies upstairs at the inn in Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "Please, brush the sand from your boots before you come near the table. Rods and dusts don't care for grit any more than I do." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "There's arcane dust under your fingernails, enchanter, and you've wiped some on your sleeve. You'll want to see what I have, then, and I've a formula or two you won't find in Darnassus." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage, all the way out here! Mind your spells near my table, if you would; a stray spark among these dusts would be a very bright mistake." },
  },

  start = "hello",
  nodes = {
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I think both take something unseen and bind it into the world, but I'm only an enchanter, and I sell rods and dust, not theology. The sand scours everything here, so whatever you've bound into your armour, I'd keep it under a cloak when the storms come." } },
      choices = {
        { text = "The Light is faith, not a craft. They aren't alike.", next = "BACK", reply = "Perhaps not, and I meant no offence to your faith, though I'll admit I've seen paladins polish a hammer much as I polish a rod.", fx = { align = { light = 1 } } },
        { text = "Power is power. I'll bind whatever pays.", next = "BACK", reply = "Then you'll find me a poor partner, because I sell what I sell to those I'd trust with it, and pay alone doesn't earn that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A great deal, if you'd let us, though warriors always want their weapons to glow and never their armor to hold. A cloak enchanted against nature's venom would do more for you at the hives than any shining edge, but no warrior has ever thanked me for one." } },
      choices = {
        { text = "Sound defence before showy edges. You're right about that.", next = "BACK", reply = "It's rare to hear a warrior say so, and I'll set aside my best cloak for you, wrapped and ready for the hives.", fx = { align = { order = 1 } } },
        { text = "A deadlier blade ends fights faster. I'll take the glow.", next = "BACK", reply = "As you like, though I'll warn you a glowing sword lights up nicely for the silithid to aim at in the dark.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A truer draw and a steadier hand, yes, if you let me enchant your gloves and bracers rather than fuss over the bow itself. Most hunters only ask for agility, which is wise enough, if rather dull to enchant." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} is welcome to wait on the stair, where it can watch the door and keep its fur well away from my vellum." },
      },
      choices = {
        { text = "A hunter's own skill matters more than any enchantment.", next = "BACK", reply = "True enough, and I'd never claim otherwise, but even the best hand trembles in this heat, and a little help steadies it.", fx = { align = { honor = 1 } } },
        { text = "I'll take every enchantment that gives me an edge.", next = "BACK", reply = "Then I'll make you a list, though it will be a long one and a costly one, so I hope your edge is a profitable one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Against some of it, I think, though not the worst, because the Twilight's Hammer deal in powers that care little for runes and vellum. A ward holds best when someone faithful stands behind it, and I would rather sell to a priest than to a cultist with gold." } },
      choices = {
        { text = "Then sell your wards to the faithful, and turn the cult away.", next = "BACK", reply = "That's my rule already, and I'm glad to hear it from someone else, because some days the cult's coin looks very bright.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Gold is gold, Kania. Sell to whoever pays.", next = "BACK", reply = "Gold is gold, perhaps, but a ward sold to the Hammer is a ward someone else will have to break, so I'll keep my rule.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It does, and I wish it didn't. My dusts settle in strange patterns when the wind blows from the Crystal Vale, and a rod I'd charged before I came here went quite dead within a week of arriving." } },
      choices = {
        { text = "The land's power isn't meant to be caught in rods.", next = "BACK", reply = "You may be right, and the rods seem to agree with you, given how sulkily they've behaved since I arrived.", fx = { align = { honor = 1 } } },
        { text = "Then use the crystals. Their hum could charge stronger rods.", next = "BACK", reply = "I've thought of it, I'll confess, but the Circle would have my formulae burned if I tried it without asking, so I'm asking.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Some do, and they always want the strongest dusts, the ones that hold a lasting enchantment. I sell them what they need and ask nothing, but I keep my best formulae for those who'll make cloaks against the silithid, not curses." } },
      choices = {
        { text = "Fair. Your formulae should serve the Hold.", next = "BACK", reply = "I'm glad you think so, because the Hold has been good to me, and it's the least my craft can do in return.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Knowledge should go to whoever can pay.", next = "BACK", reply = "Some knowledge, perhaps, but the kind that turns a cloak into a shield is too precious to sell to whoever happens by.", fx = { align = { order = -1 } } },
        { text = "I'll take the dusts.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "An enchantment on a dagger lasts longer than poison, and doesn't wash off in the rain, not that it rains here. I keep a few formulae for weapons, though they cost more than the cloaks, since they're rarer." } },
      choices = {
        { text = "A good enchantment beats poison any day.", next = "BACK", reply = "I'm glad you think so, and so do my ledgers, since an enchantment lasts a season and a vial lasts a fight.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Poison's cheaper and works just as well.", next = "BACK", reply = "Cheaper, yes, and it works, but it also washes off on the first silithid you cut, so you'll buy it again and again.", fx = { align = { honor = -1 } } },
        { text = "I'll keep it in mind.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every day, and then I sell them anyway. Magic has to come from somewhere, and I'd rather it came from a broken trinket than from the land, though I know some druids see little difference between the two." } },
      choices = {
        { text = "You choose the gentler source. That counts for something.", next = "BACK", reply = "It does, I think, and it lets me sleep, though I know the druids still wince a little when I open a new crate.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Magic is a tool. Where it comes from hardly matters.", next = "BACK", reply = "You sound like the mages of Dalaran, and they're very successful, so I won't argue, though I'll keep my gentler habits.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, among my formulae. Some say an enchanter's craft and your Light are distant cousins, and I wonder whether you would agree, or whether you'd call it blasphemy." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your totems carry a little magic of their own, I think, though not the kind I sell, so look all you like, but please don't let them rattle near the vellum." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, browsing my formulae. Some say a priest's power and an enchanter's are distant cousins, and you may tell me if they're wrong." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock. If you're buying vellum for anything dark, I'd rather not know, but I'll warn you the sand ruins every scroll unless you wrap it twice." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You've come up the stairs very quietly, which I appreciate, because the sand-shakers who stomp up here ruin my dusts." },
        { id = "h_default", key = true,
          text = "I am Kania, and I sell enchanting supplies to the Hold. Rods, vellum, dusts and a few rare formulae, kept up here in the inn where the sandstorms can't scour them, and where I can see the moon rise over the dunes." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Please stand still while you're in here, because every step in those boots shakes sand into my dusts." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. If your beast sheds, keep it on the stair, please, for fur in a formula ruins it as surely as sand does." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. The dusts I sell came out of things you'd probably rather were left whole, so I'll not take offence if you wrinkle your nose." },
      },
      again = {
        { id = "h_again", text = "Was there something more you wished to ask? My people learned patience long before they learned enchanting." },
        { id = "h_again2", text = "I'm listening, though I'll keep sorting while we talk." },
      },
      choices = {
        { text = "Do you ever think about where your dusts come from?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does the hum in the crystals here touch your enchanting?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Why keep your shop upstairs?", next = "upstairs" },
        { text = "I wouldn't have thought anyone needs enchanting out here.", next = "who" },
        { text = "Do warlocks buy much from you?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "A rogue could make use of your enchantments, I think.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can enchantment ward against what the cult calls up, Kania?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "An enchanter can't do much for a warrior, I'd guess.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Can enchanting do anything for a hunter, Kania?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Is an enchanter's craft like the Light, Kania?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    upstairs = {
      lines = { { id = "u_default", text = "Because sand gets into everything on the ground floor, and a grain of it in a powdered dust can spoil an enchantment completely. Calandrath was kind enough to give me this corner, and I've kept it spotless ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "Everyone who fights the silithid, sooner or later. Their claws and their acid wear through plain steel, so the soldiers come to me for something that will keep a cloak whole and a blade sharp a little longer." } },
      choices = {
        { text = "Do the formulae help against the hives?", next = "who_resist" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_resist = {
      lines = { { id = "wr_default", text = "Some of them do. A cloak that turns away fire or poison has saved more than one scout in these dunes, and I'd rather sell those than anything prettier." } },
      choices = {
        { text = "Useful work matters more than beauty.", next = "BACK", reply = "I couldn't agree more, and I'd rather sell a dull cloak that saves a life than a pretty one that only catches the eye.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A fine enchantment is its own reward.", next = "BACK", reply = "It is, I'll grant you, and I'll keep a few fine ones on the shelf for those who think so, at a fine price.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sell supplies to enchanters. I came to the Hold because they needed them here more than anywhere else." } },
    advice = { { id = "tp_ad", text = "Keep your dusts sealed, always. One sandstorm and you'll be enchanting with a pinch of desert and a dead beetle." } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle holds the line against the hives. I make sure the people holding it have what they need." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The shards that come back from the hives are full of strange magic, old and humming. I enchant with them very carefully, and never at night." } },
    elune = { { id = "tp_elune", text = "I keep a prayer to Elune tucked in each formula, written very small. My teacher said it was superstition, and my teacher's enchantments never held." } },
    dalaran = { { id = "tp_dalaran", text = "The mages of Dalaran think enchanting is a lesser art, and they have never once asked a kaldorei enchanter to teach them. Their loss, I say." } },
    _none = { { id = "tp_none", text = "I'm afraid I know very little outside my craft, though Elune may know more." } },
  },
}

P:NPC {
  key = "khur", id = TODO_NPC("Khur Hornstriker"), name = "Khur Hornstriker", title = "Reagents",
  bible = "bibles/silithus.md", role = "vendor", tier = "service",
  communities = { "cenarion_hold" }, temper = { "calm" }, values = { "careful", "nature" },
  notices = { "class" },

  impression = {
    first = "Khur Hornstriker sells reagents and poisons at Cenarion Hold and handles both with the same unhurried care. He finds it no stranger for a tauren of the Circle to sell poison than to sell herbs.",
    third = "{name} met Khur Hornstriker, the tauren who sells reagents and poisons at Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "Reagents for spellcasters, and poisons for those who need them. Tell me which you need, and keep your hands away from the second shelf until I've handed it to you." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You'll be wanting the poison makings, I expect. I sell them freely, but use them on the silithid, little one, not on anybody standing in this Hold." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman's ankh will need replacing, sooner or later, out in a land this angry. I keep plenty in stock, because the spirits here are restless." },
  },

  start = "hello",
  nodes = {
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the Earth Mother made the scorpid's sting and the flower's nectar both, and she did not ask which was more righteous. I sell to those who fight the swarm, and if a rogue's blade ends a silithid faster than your hammer does, I count it as the same good work." } },
      choices = {
        { text = "A clean fight is better. Poison has no honour in it.", next = "BACK", reply = "Your heart is good, and the Earth Mother sees it, but a silithid does not fight cleanly, and I would not have you die proud.", fx = { align = { honor = 1 } } },
        { text = "Whatever ends the swarm is honourable enough.", next = "BACK", reply = "You understand, then, and I am glad of it, because I would rather sell venom than bury another scout in the sand.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Against an orc or a man, perhaps, but against the silithid there is little honour to lose, for they do not fight as we do. The Earth Mother gave us venom and medicine from the same roots, and I do not think she meant one only for the rogues." } },
      choices = {
        { text = "My blade stays clean. Honour isn't something I set aside.", next = "BACK", reply = "Then keep it clean, and may your honour be a good shield to you, because the swarm will test it every day.", fx = { align = { honor = 1 } } },
        { text = "Against the swarm, any edge is fair. Coat the blade.", next = "BACK", reply = "Wise words, young one, and I will choose a venom for you that does its work quickly, as a mercy to both of you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That a beast's tracks tell you where the water is, and a scorpid's tracks tell you where not to sleep. We crossed the Barrens and the Needles together, and not one of us went thirsty, because the hunters read the land like a book." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has the look of those beasts on the long road, steady and watchful, and I think it would have kept good company with them." },
      },
      choices = {
        { text = "The land teaches those who listen. I listen.", next = "BACK", reply = "Then you will walk this land a long while, and the Earth Mother will not let you go thirsty.", fx = { align = { light = 1 } } },
        { text = "The land's an obstacle. I just push through it.", next = "BACK", reply = "Push hard enough and the land pushes back, young one, and out here the land is very patient and very strong.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "As easily as the scorpid sits beside the cactus, friend, because both belong to the land and both serve a purpose. A priest who heals and a hunter who poisons may both be keeping the Hold alive, and I do not judge which is the gentler work." } },
      choices = {
        { text = "Healing is the better path. I'll not carry your poisons.", next = "BACK", reply = "I respect your path, priest, and I will not press you, but if you ever need it, you know where I keep my jars.", fx = { align = { light = 1 } } },
        { text = "A priest can carry poison too. Sell me some.", next = "BACK", reply = "You surprise me, and I like being surprised, so I will sell you a gentle one, for a gentle hand.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A few, and they always want powder for the portal home. I don't blame them, since the desert is a hard place, but I'd ask them to stay a while and help the Circle before they vanish." } },
      choices = {
        { text = "I'll stay and help. The Hold needs it.", next = "BACK", reply = "Then the Circle will be grateful, and so will I, because every hand that stays is a hand the hives cannot take.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll leave when I want to.", next = "BACK", reply = "As you like, friend, and the winds will carry you safely home, though the desert will remember who left early.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll take some powder.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I trust everyone the same, which is to say a little, and no more. A tauren sells poison and a warlock buys reagents, and the Earth Mother judges us both by what we do with them." } },
      choices = {
        { text = "Then I'll use them well, against the hives.", next = "BACK", reply = "Then you have my trust, and the Earth Mother will judge you kindly, as I will.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What I do with them is my affair.", next = "BACK", reply = "It is, until it becomes the Hold's affair, and then it will be mine too, so use them well.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll take what I need.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Poison is only a plant that has learned to defend itself, druid, and I sell it to those who fight the swarm. The Circle knows what I keep, and they have never told me to stop." } },
      choices = {
        { text = "A tool is a tool. The swarm deserves every venom.", next = "BACK", reply = "You speak as a hunter speaks, druid, and I think the Circle would agree with you, though some of them will not say so.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Poison has no place among healers.", next = "BACK", reply = "Then the scorpion is not a healer either, druid, but she keeps her young alive with what she carries, and so do I.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. You will want candles for your prayers, I think, and I sell those, and poisons for darker work, and I find no shame in either, though you may." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. You'll be wanting arcane powder for your portals, I expect, and I keep plenty, since the Hold's a long way from any city." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock. I sell the candles and powders your kind use, and I don't ask what they're for, so long as they're used against the hives." },
        { id = "h_default", key = true,
          text = "I am Khur Hornstriker, and I sell reagents and poisons to those who stand with the Hold. Candles and powders for the casters, venom makings for the rogues, and plain good sense for anyone who'll take it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. I sell candles for your prayers, friend, and poisons for less gentle work, and I find no shame in either." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You will want my herbs more than my poisons, I think, though I have seen warriors coat their blades when the hives grew close." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. I walked from Mulgore with hunters who knew more of the land than I did, and I have been glad of their kind since." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, and welcome. I keep your herbs and seeds dry in the back, away from the sand, because the Earth Mother gives little enough in this place." },
      },
      again = {
        { id = "h_again", text = "What else would you know, friend, while the desert wind is quiet and the Earth Mother listens?" },
        { id = "h_again2", text = "Ask. I am in no hurry, and neither is the desert." },
      },
      choices = {
        { text = "Is it right to sell poisons under the Circle's roof?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Let me see your reagents.", next = "BUSINESS" },
        { text = "A druid's ally who sells poison?", next = "poison" },
        { text = "What do the silithid do to people here?", next = "silithid" },
        { text = "Not many mages would come out this far.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you trust warlocks to use their reagents well?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does selling poison sit easily beside holy candles, Khur?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "A warrior who poisons his blade has no honour, Khur.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What did the hunters teach you on the road from Mulgore?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "How can you sell poison with a clear conscience, Khur?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    poison = {
      lines = { { id = "p_default", text = "The scorpion and the spider carry poison too, and the Earth Mother made them. A poison on a blade that cuts through a silithid's shell serves the land as well as any herb, if it's used against the right enemy." } },
      choices = {
        { text = "Poison is a coward's tool, whoever it's used on.", next = "BACK", reply = "You may think so, young one, and I will not quarrel, but the swarm has never once given us a fair fight.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Whatever brings the hives down is worth using.", next = "BACK", reply = "You have the right heart for this land, and I will sell you whatever you need to end them.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithid = {
      lines = { { id = "s_default", text = "They poison and they burrow, and they spread their hives across the dunes like a sickness. Half of what I sell for healing goes to treating their stings, and the soldiers come back to me with burns from their acid." } },
      choices = {
        { text = "Where do they come from?", next = "silithid_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithid_where = {
      lines = { { id = "sw_default", text = "From the south, beyond the hives, where the old walls stand. The Watchers and the commander know more than I do, and they keep it to themselves, which tells me it's nothing good." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I walked from Mulgore to stand with the Circle. What I left behind there is my own business." } },
    advice = { { id = "tp_ad", text = "Carry an antivenom in Silithus, always. The scorpids here don't warn you before they strike." } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle protects the land from those who would poison it, which is why I sell poison only to its friends." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives give me the best venoms in Kalimdor, and the bugs don't give them up willingly. I sell what the hunters bring, and I tell them to wash their hands." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made poison as well as medicine, and she made them both for a reason. I only sell what she made." } },
    cairne = { { id = "tp_cairne", text = "Cairne would not approve of poison, I think, but he would approve of a tauren who sells honestly. That will have to do." } },
    _none = { { id = "tp_none", text = "I don't know that, friend, but the Commander might. Walk with the Earth Mother." } },
  },
}

P:NPC {
  key = "leoren", id = TODO_NPC("Squire Leoren Mal'derath"), name = "Squire Leoren Mal'derath", title = "Stable Master",
  bible = "bibles/silithus.md", role = "stablemaster", tier = "service",
  communities = { "cenarion_hold" }, temper = { "earnest" }, values = { "dutiful", "kind" },
  notices = { "pet" },

  impression = {
    first = "Squire Leoren Mal'derath keeps the stables at Cenarion Hold and takes the title of squire very seriously. He's earnest and a little young, and he treats every boarded beast as a soldier in his charge.",
    third = "{name} met Squire Leoren Mal'derath, the young night elf who keeps the stables at Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to the Hold's stables! Every animal here is fed, watered and brushed free of sand twice a day, and I'll swear to it." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Your {pet} has sand in its coat, friend. Let me brush it out before you go back into the dunes, because sand rubs a beast raw in a day." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The ground hums at night, and they won't settle. Squires aren't taught about spirits, so I'd be grateful if you'd tell me what to do." } },
      choices = {
        { text = "Soothe them gently, Squire. Fear spreads in a stable.", next = "BACK", reply = "I'll try, I really will, and I'll hum to them the way my mother hummed to me, which seems to work on wolves too.", fx = { align = { light = 1 } } },
        { text = "Work them harder, Squire. A tired beast sleeps.", next = "BACK", reply = "I tried that, but they only paced harder, and one of the cats bit my sleeve to tell me what it thought of the idea.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Hard enough to send a grown tauren into the water trough, which I saw happen last week, and I wasn't allowed to laugh. If you need to slip in and out quietly, use the side door, and I'll pretend I didn't see you, but only if you're on the Hold's business." } },
      choices = {
        { text = "I'm always on the Hold's business, squire.", next = "BACK", reply = "Of course, I didn't think otherwise, and I'll keep the side door unlatched for the Hold's business, then.", fx = { align = { order = 1 } } },
        { text = "Pretend you didn't see me, and leave it at that.", next = "BACK", reply = "Yes, of course, I'll pretend very hard, though I'm not very good at pretending, so you'd better be quick.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oh, I'm kaldorei, so the Light isn't really our way, but I do dream of being a proper knight of the Hold, with a mount of my own and a banner. Until then I keep the stables, and every boarded beast is a soldier in my charge, and I'll not have one of them come back hurt if I can help it." } },
      choices = {
        { text = "Keep that spirit, squire. It'll serve you well.", next = "BACK", reply = "I'll try, and thank you, because the commander says I'm too eager, but I'd rather be eager than idle.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Dreams are fine, but stable work is still stable work.", next = "BACK", reply = "It is, I know, and I'll do it well, but I'll keep dreaming all the same, because nobody can stop me doing that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a squire serves the ones who fight, and I mean to earn the right to fight beside them one day. For now I serve their beasts, and I'd sooner throw a scorpid over the wall than let one near a stall in my charge." } },
      choices = {
        { text = "Service is honourable. Earn it slowly and you'll earn it well.", next = "BACK", reply = "That's what I keep telling myself, and it means more coming from someone who's already earned their sword.", fx = { align = { honor = 1 } } },
        { text = "Titles mean nothing. Pick up a sword and fight now.", next = "BACK", reply = "I'd like to, truly, but I'd be dead within the hour, and then the beasts would have nobody to fan them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I don't know, and that's what frightens me, because there isn't a mark on him, only a way of staring west as though something there were calling. I've tended him as well as a squire can, but this feels like work for a priest." } },
      choices = {
        { text = "Let me see him. Whatever's calling, I'll quiet it.", next = "BACK", reply = "Would you? Oh, please, he's in the back stall, and I'll hold the lantern if you'll tell me what you're doing.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let him go west. I'd like to see what calls him.", next = "BACK", reply = "I couldn't let him go, he's in my charge, and whatever's calling him, I don't think it means him well.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The ground, I think, because they all go quiet together a moment before the sand shivers. The commander says it's the hives digging, but the wolves all turn their heads the same way, south, and it isn't toward the nearest hive." } },
      choices = {
        { text = "Trust the beasts' instincts. They feel what we can't.", next = "BACK", reply = "I do, I think, and it frightens me a little, because whatever they feel is something the rest of us can't.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Keep them calm and disciplined. Fear spreads through a stable.", next = "BACK", reply = "I'm trying my best, but it's hard to stay calm myself when the whole stable turns to stare at the same patch of sand.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Not yet, and I hope I never must, because a frightened beast in a stall can hurt itself badly. Every animal here is in my charge, and this is my first post, so I mean to keep every one of them safe." } },
      choices = {
        { text = "I understand. I'll keep my demon away.", next = "BACK", reply = "Thank you, truly, because they'd panic the moment they smelled it, and I'd be up all night mending stalls.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon's just as worthy as any beast.", next = "BACK", reply = "Perhaps, but the beasts don't think so, and they'd tell you as much, very loudly, if you brought it inside.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Sorry about that.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Shade, water, and a lot of fanning, and I do most of it myself. A squire serves where he's needed, and right now that's in a stable full of panting cats and wolves." } },
      choices = {
        { text = "Your dedication is admirable, Squire.", next = "BACK", reply = "Thank you, that's kind of you to say, though I think the cats would say I could fan faster.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Seems a waste of effort to me.", next = "BACK", reply = "Perhaps it is, but a beast that dies of the heat isn't much use to its rider, and I'd rather fan than bury.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll leave you to your fanning.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Poorly, and the wolves worst of all. I keep wet cloths over the cages at midday and walk them only at dusk, and still they pine for forests they've never seen, which seems a cruel thing to be born with." } },
      choices = {
        { text = "Send them north. No beast should suffer here.", next = "BACK", reply = "I'd send them all north if I could, truly, but their riders need them here, and so I'll keep them as cool as I can.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're fighting animals. Hardship will make them stronger.", next = "BACK", reply = "Maybe so, but they're still creatures, and I'll not stop caring for them because they're meant for fighting.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! I don't suppose you've any beast for the stables, but you're welcome all the same, and please don't sneak up on the horses, because they kick." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Welcome to the stables, and if your charger needs grooming, you'll find I treat every mount here as I would the commander's own, which is to say very well." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman of the Horde! Welcome, welcome; the beasts in my care have been restless lately, and I've wondered whether something in the earth unsettles them, so you're exactly who I hoped would come." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde! Welcome to the stables, and please, if you've a blessing to spare, one of my mounts came back from the Twilight camps and hasn't eaten since." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! I'm sorry, but I can't stable demons, not even little ones, because the beasts here are frightened enough of the desert as it is." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Could you cool the stables with a spell, perhaps? The desert heat is terrible for the beasts, and I'm running out of water to keep them comfortable." },
        { id = "h_default", key = true,
          text = "Squire Leoren Mal'derath, stable master of Cenarion Hold! I board the companions of every hunter who comes to fight for the Circle, and I treat them as I would the nightsabers of Darnassus." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Is your mount well? Not that I'd presume, but a war-mount in this sand needs looking after, and I'm the one who looks after them." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Then you'll understand my charges better than most of their own masters do, and you'll forgive me if I ask how the desert beasts seem to you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! Welcome; the beasts in my care have been restless lately, and I've wondered whether something in the earth unsettles them." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I've three stalls to muck out before the heat." },
        { id = "h_again2", text = "Please, ask whatever you like. I enjoy the company." },
      },
      choices = {
        { text = "How do the beasts fare in this heat?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What unsettles the beasts here at the Hold?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "I'd like to see my stabled pets.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Why call yourself a squire?", next = "squire" },
        { text = "Keeping beasts out here must be hard.", next = "sand" },
        { text = "Would you really turn away a demon?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How do you keep the beasts cool in the desert?", next = "xmage", when = { class = "MAGE" } },
        { text = "What happened to the mount from the Twilight camps, Leoren?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why do you take the title of squire so seriously, Leoren?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "I'd guess you dream of being a paladin yourself.", next = "xapala", when = { class = "PALADIN" } },
        { text = "These horses look like they kick hard, Leoren.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What unsettles the beasts here at the Hold?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    squire = {
      lines = { { id = "sq_default", text = "Because I serve the Hold, and everyone here serves something greater than themselves. A stable master can be a squire too, if he keeps the beasts as well as a squire keeps his knight's arms." } },
      choices = {
        { text = "That's a fine way to see your work.", next = "BACK", reply = "Thank you, it's how my teacher saw it too, and it makes the long afternoons with the shovel a little easier.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A stable's a stable, whatever you call it.", next = "BACK", reply = "It is, but I'd like to think I'm more than the shovel, and some days the beasts seem to agree with me.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sand = {
      lines = { { id = "sa_default", text = "Sand and heat, and the scorpids that crawl in under the walls at night. I check every stall with a lantern before I sleep, and I've caught three of them so far this month." } },
      choices = {
        { text = "What do you do with the scorpids?", next = "sand_scorpid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sand_scorpid = {
      lines = { { id = "ss_default", text = "I take them outside on the end of a pitchfork and throw them as far as I can. Captain Kozus says I should just kill them, but they're only doing what scorpids do, and I'd rather not." },
        { id = "ss_hunter", when = { class = "HUNTER" }, text = "I carry them out on a pitchfork and throw them over the wall, though I suppose a hunter would just tame one. Captain Kozus says I should kill them, but I haven't the heart." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm young, as my people count it, which means barely a century, and this is my first post. I mean to do it well." } },
    advice = { { id = "tp_ad", text = "Shake out your boots every morning in Silithus, because scorpids love a warm boot." } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle guards Silithus for all of Kalimdor, and I'm proud to keep its stables." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The beasts in my stables shy whenever the wind blows from the hives. I've learned to listen to them, because they hear what we don't." } },
    holy_light = { { id = "tp_holy_light", text = "I'm only a squire, but I pray to the Light every morning that I'll be a knight someday. Then I'll ride out to the hives and burn them myself." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Bolvar is the greatest knight in Stormwind, and I'd give anything to squire for him. Someday, perhaps, when I'm older." } },
    silver_hand = { { id = "tp_silver_hand", text = "The Knights of the Silver Hand are what every squire dreams of becoming, and I'm no different. I hear they're scattered now, but there must still be room for a few more." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. Ask Captain Kozus; he knows everything that happens in the Hold, and has for longer than I've been alive." } },
  },
}
