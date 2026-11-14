-- Goldshire's everyday people: the inn's staff, the shops, the stables, the cellar, and the
-- trainers by Crystal Lake. Short voices for short visits. Voice notes: bibles/goldshire_folk.md
-- (Almost nothing is known about most of them beyond their trade; they're built from it.)
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST


-- Barkeep Dobbins: pours at the Lion's Pride; Farley shouts for him a lot.
P:NPC {
  key = "dobbins", id = TODO_NPC("Barkeep Dobbins"), name = "Barkeep Dobbins",
  bible = "bibles/goldshire_folk.md", role = "innkeeper", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "witty" }, notices = { "drink" },
  greetings = {
    { id = "g_pour", text = "What'll it be? Ale's good. Ale's always good. Don't ask about the wine." },
    { id = "g_regular", when = { timesTalked = { min = 5 } }, text = "The usual? I'll pretend I remember what that is." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Farley says water for you. I always do what Farley says. Mostly. Here. Water. It's very good water." },
  },
  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", text = "Dobbins. When Farley shouts my name, I fetch. When he doesn't, I pour. It's a good life." },
      { id = "h_farley", when = { heardLine = "farley.h_default" },
        text = "Farley told you the family's never watered a drink? True. I've seen him check. He holds it up to the lamp." },
    },
    choices = { { text = "Pour me something.", next = "BUSINESS" }, { text = "Not tonight.", next = "END" } },
  } },
  topics = {
    lions_pride = { { id = "tp_inn", text = "Best inn in Elwynn. Only inn in Elwynn, near enough. Still best." } },
    _none = { { id = "tp_none", text = "Ask Farley. He hears it all; I just hear him." } },
  },
}

-- Brog Hamfist: general supplies, inside the inn.
P:NPC {
  key = "brog", id = TODO_NPC("Brog Hamfist"), name = "Brog Hamfist", title = "General Supplies",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "honest" }, notices = {},
  greetings = {
    { id = "g_stock", text = "Rope, flint, flasks, thread. Everything you forgot to pack." },
    { id = "g_new", when = { maxLevel = 6 }, text = "Fresh out of Northshire? You'll want more bags than you think. Everyone does." },
  },
  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", text = "Hamfist. If an adventurer needs it and it isn't a sword, I've probably got it. If I haven't, I'll have it next week." },
    },
    choices = { { text = "Let me see.", next = "BUSINESS" }, { text = "Just looking.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "Don't sell that. Don't know that." } } },
}

-- Toddrick: the butcher, inside the inn.
P:NPC {
  key = "toddrick", id = TODO_NPC("Toddrick"), name = "Toddrick", title = "Butcher",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "honest" }, notices = {},
  greetings = {
    { id = "g_cut", text = "Best cuts in Goldshire. Ask anyone. Don't ask the boars." },
  },
  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", text = "Toddrick. I cut the meat, Farley cooks it, and everyone agrees whose job is harder. It's mine." },
      { id = "h_princess", when = { questDone = TODO_QUEST("Princess Must Die!") },
        text = "You did for the Brackwells' prize sow? Pity you didn't bring her here. I'd have made Goldshire's finest sausages." },
    },
    choices = { { text = "What's good today?", next = "BUSINESS" }, { text = "Goodbye.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "If it's not meat, I'm no use to you." } } },
}

-- Tharynn Bouden: trade supplies.
P:NPC {
  key = "tharynn", id = TODO_NPC("Tharynn Bouden"), name = "Tharynn Bouden", title = "Trade Supplies",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "ambitious" }, notices = {},
  greetings = {
    { id = "g_craft", text = "Thread, dye, flux, vials. For people who make things." },
    { id = "g_crafter", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing", "Alchemy" } }, text = "Ah, a crafter. My favourite kind of customer. You come back." },
  },
  start = "hello",
  nodes = { hello = {
    lines = { { id = "h_default", text = "Bouden. I sell what crafters need and nothing they don't. Fighters buy once. Crafters buy forever." } },
    choices = { { text = "Show me.", next = "BUSINESS" }, { text = "Later.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "Not a trade good. Can't help." } } },
}

-- Andrew Krighton: armorer and shieldcrafter.
P:NPC {
  key = "krighton", id = TODO_NPC("Andrew Krighton"), name = "Andrew Krighton", title = "Armorer & Shieldcrafter",
  bible = "bibles/goldshire_folk.md", role = "blacksmith", tier = "service", communities = { "goldshire" },
  temper = { "proud" }, values = { "honest" }, notices = { "kit" },
  greetings = {
    { id = "g_armor", text = "Mail, plate, shields. Something to stand behind." },
  },
  notice = {
    { id = "n_shield", cat = "kit", when = { class = { "WARRIOR", "PALADIN" }, durability = { max = 0.3 } },
      text = "That shield's taken a beating. Good. That's its job. Let me see if it can take another." },
  },
  start = "hello",
  nodes = { hello = {
    lines = { { id = "h_default", text = "Krighton. Argus makes things sharp; I make things that stop sharp things. We get on." } },
    choices = { { text = "Show me your armor.", next = "BUSINESS" }, { text = "Not now.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "Can I put it on your arm? No? Then I can't help." } } },
}

-- Corina Steele: weaponsmith.
P:NPC {
  key = "corina", id = TODO_NPC("Corina Steele"), name = "Corina Steele", title = "Weaponsmith",
  bible = "bibles/goldshire_folk.md", role = "blacksmith", tier = "service", communities = { "goldshire" },
  temper = { "sharp" }, values = { "proud" }, notices = { "kit" },
  greetings = {
    { id = "g_blade", text = "Swords, axes, maces. Pick one up. Feel the balance." },
  },
  notice = {
    { id = "n_dull", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your blade's notched like a saw. Did you fight something, or chop firewood with it?" },
  },
  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", text = "Corina Steele. Yes, really. With a name like that it was this or juggling." },
      { id = "h_warrior", when = { class = "WARRIOR" }, text = "Lyria sends me all her students. Half come back for a heavier blade. The other half come back for a lighter one." },
    },
    choices = { { text = "Let me see your weapons.", next = "BUSINESS" }, { text = "Goodbye.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "Ask me about edges. Otherwise, ask someone else." } } },
}

-- Kurran Steele: cloth and leather armor.
P:NPC {
  key = "kurran", id = TODO_NPC("Kurran Steele"), name = "Kurran Steele", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "witty" }, notices = {},
  greetings = {
    { id = "g_leather", text = "Not everyone wants to clank. Come and see what I've got." },
  },
  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", text = "Kurran. The other Steele. Corina sells you the sword; I sell you the coat you'll bleed on. Family business, in a way." },
    },
    choices = { { text = "Show me.", next = "BUSINESS" }, { text = "Later.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "I sell coats, not answers." } } },
}

-- Erma: the stable master.
P:NPC {
  key = "erma", id = TODO_NPC("Erma"), name = "Erma", title = "Stable Master",
  bible = "bibles/goldshire_folk.md", role = "stablemaster", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "kind" }, notices = { "pet" },
  greetings = {
    { id = "g_stable", text = "Watch your boots. Who've you brought me?" },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Oh, look at {pet}. Somebody feeds you properly. Somebody also forgets to brush you. Come here." },
  },
  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", text = "Erma. I keep the stables. Most of my guests have four legs and better manners than the ones with two." },
      { id = "h_hunter", when = { race = "Human", class = "HUNTER" }, text = "Not many humans keep a beast at heel. Bring yours by anytime; I'll treat it like visiting royalty." },
    },
    choices = { { text = "The stable, please.", next = "BUSINESS" }, { text = "Just visiting.", next = "END" } },
  } },
  topics = {
    hogger = { { id = "tp_hogger", text = "The horses won't go southwest. I don't make them." } },
    _none = { { id = "tp_none", text = "If it doesn't eat hay, I'm the wrong person." } },
  },
}

-- Michelle Belle: first aid, upstairs with Josetta.
P:NPC {
  key = "michelle", id = TODO_NPC("Michelle Belle"), name = "Michelle Belle", title = "Physician",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "kind" }, notices = { "wounds" },
  greetings = { { id = "g_bandage", text = "Bleeding? Sit. Not bleeding? Sit anyway, and learn how to stop it." } },
  notice = {
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.25 } },
      text = "Look at the state of you. Linen, a clean hand and five minutes. That's all it takes. Most people won't spare the five minutes." },
  },
  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", text = "Michelle Belle. I teach bandaging. It's not glamorous. It's why you'll still be alive next week." },
      { id = "h_josetta", text = "Josetta prays over the wounded; I wrap them. Between us, most of Goldshire's adventurers go home on their own feet." },
    },
    choices = { { text = "Teach me.", next = "BUSINESS" }, { text = "Later.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "I only know how to stop the bleeding. The rest is beyond me." } } },
}

-- Maximillian Crowe and Cylina Darkheart: the cellar, with Remen Marcot.
P:NPC {
  key = "crowe", id = TODO_NPC("Maximillian Crowe"), name = "Maximillian Crowe", title = "Warlock Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "proud" }, values = { "ambitious" }, notices = {},
  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Down here we speak quietly and learn quickly. Which are you here to do?" },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "The ale's upstairs. You took a wrong turn." },
  },
  start = "hello",
  nodes = { hello = {
    lines = { { id = "h_default", text = "Crowe. Marcot handles the introductions; I handle the lessons. Darkheart handles the things that come when called." } },
    choices = { { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } }, { text = "I'll go.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "Not a matter for this cellar." } } },
}

P:NPC {
  key = "cylina", id = TODO_NPC("Cylina Darkheart"), name = "Cylina Darkheart", title = "Demon Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "sharp" }, values = { "cunning" }, notices = { "pet" },
  greetings = { { id = "g_demon", text = "Mind my imp. He bites. I've told him not to. He bites anyway." } },
  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp and mine are glaring at each other. Leave them. It's how they say hello." },
  },
  start = "hello",
  nodes = { hello = {
    lines = { { id = "h_default", text = "Darkheart. I teach your pets new tricks. Not the kind you'd show a crowd." } },
    choices = { { text = "Show me.", next = "BUSINESS", when = { class = "WARLOCK" } }, { text = "I'll go.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "My imp might know. He won't tell you either." } } },
}

-- The trainers at the house by Crystal Lake.
P:NPC {
  key = "leebrown", id = TODO_NPC("Lee Brown"), name = "Lee Brown", title = "Fishing Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "kind" }, notices = { "craft" },
  greetings = { { id = "g_lake", text = "Quiet now. You'll scare the fish." } },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "Another angler! Crystal Lake's best at dawn. Don't tell anyone. Well, you can tell them. They won't get up." },
  },
  start = "hello",
  nodes = { hello = {
    lines = { { id = "h_default", text = "Lee Brown. I fish, and I teach fishing, and on good days I can't tell which I'm doing." } },
    choices = { { text = "Teach me.", next = "BUSINESS" }, { text = "Good fishing.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "Ask me about bait. Anything else, I'm out of my depth. Ha." } } },
}

P:NPC {
  key = "helene", id = TODO_NPC("Helene Peltskinner"), name = "Helene Peltskinner", title = "Skinning Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "honest" }, notices = { "craft" },
  greetings = { { id = "g_hides", text = "Careful, those hides are drying. Need something?" } },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "Show me your knife. Hm. Too dull. Hides tear when the knife's dull. Sharpen it tonight." },
  },
  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", text = "Helene Peltskinner. Wolves, boars, the odd bear. Everything out there has a coat, and every coat's worth something." },
      { id = "h_eagan", when = { heardLine = "eagan.h_default" },
        text = "You've met Eagan up in Northshire? The name's a coincidence, or it isn't. I'll let you wonder." },
    },
    choices = { { text = "Teach me.", next = "BUSINESS" }, { text = "Later.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "I know hides. Not that." } } },
}

P:NPC {
  key = "adele", id = TODO_NPC("Adele Fielder"), name = "Adele Fielder", title = "Leatherworking Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "ambitious" }, notices = { "craft" },
  greetings = { { id = "g_leather", text = "Helene skins it, I stitch it. Want to learn the stitching half?" } },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Your seams are crooked. Everyone's are, at first. Straighter by midsummer, if you practise." },
  },
  start = "hello",
  nodes = { hello = {
    lines = { { id = "h_default", text = "Adele Fielder. Boots, belts, jerkins. The things adventurers wear out fastest and complain about loudest." } },
    choices = { { text = "Teach me.", next = "BUSINESS" }, { text = "Later.", next = "END" } },
  } },
  topics = { _none = { { id = "tp_none", text = "Can you stitch it? No? Then I'm no help." } } },
}
