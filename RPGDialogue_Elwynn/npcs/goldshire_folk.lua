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
      { id = "h_default", key = true, text = "Dobbins. When Farley shouts my name, I fetch. When he doesn't, I pour. It's a good life." },
      { id = "h_farley", when = { heardLine = "farley.h_default" },
        text = "Farley told you the family's never watered a drink? True. I've seen him check. He holds it up to the lamp." },
      { id = "h_armwrestle", when = { metBefore = true }, text = "Lively night last night. A lad fresh from Northshire tried to arm-wrestle a dwarf. The dwarf's still at the bar. The lad's still under it." },
      { id = "h_forget", when = { metBefore = true }, text = "People think a barkeep hears everything. I do. Then I forget it. That's the real job, the forgetting." },
      { id = "h_night", when = { timeOfDay = "night" }, text = "This is the hour the farmers come in, and the adventurers start telling lies about wolves. The farmers tell better lies." },
    },
    choices = { { text = "Heard any news?", next = "news" }, { text = "Pour me something.", next = "BUSINESS" }, { text = "Not tonight.", next = "END" } },
  },
    news = {
      lines = {
        { id = "n_westfall", text = "Westfall folk keep passing through, on their way to Stormwind. They don't say much. They don't need to. You can see it on them." },
        { id = "n_dughan", text = "The Marshal comes in now and then. One cup. He makes it last an hour and watches the door the whole time." },
      },
      choices = { { text = "Thanks, Dobbins.", next = "END", fx = { affinity = 1 } }, { text = "Pour me something.", next = "BUSINESS" } },
    }, },
  topics = {
    lions_pride = { { id = "tp_inn", text = "Best inn in Elwynn. Only inn in Elwynn, near enough. Still best." } },
    _none = { { id = "tp_none", text = "Ask Farley. He hears it all; I just hear him." } },
    defias = { { id = "tp_defias", text = "Westfall folk talk about the Defias like bad weather. Bad weather that steals your plough and your boots." } },
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
      { id = "h_rope", when = { metBefore = true }, text = "Sold six coils of rope yesterday. Six. Nobody ever tells me what they're climbing." },
      { id = "h_flint", when = { metBefore = true }, text = "Adventurers always buy the flint last. Then they're back at midnight, because they forgot the flint." },
      { id = "h_night", when = { timeOfDay = "night" }, text = "Shop stays open as long as the inn does. Someone always needs a torch at this hour." },
    },
    choices = { { text = "What do adventurers forget most?", next = "forget" }, { text = "Let me see.", next = "BUSINESS" }, { text = "Just looking.", next = "END" } },
  },
    forget = {
      lines = {
        { id = "f_water", text = "Water. Every time. Three swords and not a drop to drink. Then they drink from the lake, and then they come back for something for their stomach." },
      },
      choices = { { text = "I'll take some water.", next = "BUSINESS" }, { text = "Noted.", next = "END", fx = { affinity = 1 } } },
    }, },
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
      { id = "h_default", key = true, text = "Toddrick. I cut the meat, Farley cooks it, and everyone agrees whose job is harder. It's mine." },
      { id = "h_princess", when = { questDone = TODO_QUEST("Princess Must Die!") },
        text = "You did for the Brackwells' prize sow? Pity you didn't bring her here. I'd have made Goldshire's finest sausages." },
      { id = "h_boar", when = { metBefore = true }, text = "Boar's good this week. Wolf's not. Don't let anyone sell you wolf. Not even me." },
      { id = "h_second", when = { metBefore = true }, text = "Farley says my sausages are the second-best thing in this inn. I asked him what the first was. He pointed at himself." },
      { id = "h_dobbins", when = { heardLine = "dobbins.h_default" }, text = "Dobbins says he fetches when Farley shouts? He fetches when I shout too. Slower. Much slower." },
    },
    choices = { { text = "Where does your meat come from?", next = "meat" }, { text = "What's good today?", next = "BUSINESS" }, { text = "Goodbye.", next = "END" } },
  },
    meat = {
      lines = {
        { id = "m_farms", text = "Farms east of here, mostly. And adventurers. You lot bring in more boar than the farmers ever did. I'm not complaining." },
      },
      choices = { { text = "Glad to help.", next = "END", fx = { affinity = 1 } }, { text = "Let me see the cuts.", next = "BUSINESS" } },
    }, },
  topics = { _none = { { id = "tp_none", text = "If it's not meat, I'm no use to you." } }, hogger = { { id = "tp_hogger", text = "I've seen what's left of a cow after Hogger's gnolls are done. Not even I could sell that." } }, },
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
    lines = { { id = "h_default", text = "Bouden. I sell what crafters need and nothing they don't. Fighters buy once. Crafters buy forever." }, { id = "h_shop", when = { metBefore = true }, text = "One day I'll have a shop in the Trade District. Proper sign, gold letters. Until then, a corner of an inn." },
        { id = "h_gossip", when = { metBefore = true }, text = "Crafters gossip more than anyone. A tailor in here last week knew every wedding in Elwynn for the next year." }, },
    choices = { { text = "Why trade supplies?", next = "trade" }, { text = "Show me.", next = "BUSINESS" }, { text = "Later.", next = "END" } },
  },
    trade = {
      lines = {
        { id = "t_steady", text = "A sword breaks once. A tailor needs thread every day of her life. Steady money beats exciting money." },
      },
      choices = { { text = "Smart.", next = "END", fx = { affinity = 1 } }, { text = "Show me.", next = "BUSINESS" } },
    }, },
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
    lines = { { id = "h_default", text = "Krighton. Argus makes things sharp; I make things that stop sharp things. We get on." }, { id = "h_plate", when = { metBefore = true }, text = "Every recruit from Northshire walks in wanting plate. Then they try to lift it." },
        { id = "h_shield", when = { class = { "PALADIN", "WARRIOR" } }, text = "A shield isn't for hiding behind. It's for being the thing everyone else hides behind. Remember that." }, },
    choices = { { text = "How did you learn the trade?", next = "trade" }, { text = "Show me your armor.", next = "BUSINESS" }, { text = "Not now.", next = "END" } },
  },
    trade = {
      lines = {
        { id = "t_rebuild", text = "Apprenticed in Stormwind while they were still rebuilding it. More armor wanted than hands to make it. You learn fast like that." },
      },
      choices = { { text = "Show me your work.", next = "BUSINESS" }, { text = "Thanks.", next = "END", fx = { affinity = 1 } } },
    }, },
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
      { id = "h_default", key = true, text = "Corina Steele. Yes, really. With a name like that it was this or juggling." },
      { id = "h_warrior", when = { class = "WARRIOR" }, text = "Lyria sends me all her students. Half come back for a heavier blade. The other half come back for a lighter one." },
      { id = "h_kurran", when = { metBefore = true }, text = "Kurran and I share a name and an argument. The argument's older." },
      { id = "h_balance", when = { metBefore = true }, text = "A sword's balance tells you who it was made for. Most of mine are made for whoever pays." },
      { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin. You'll want a hammer, I'd guess. Your lot always seem to." },
      { id = "h_heard_kurran", when = { heardLine = "kurran.h_default" }, text = "Kurran called himself the other Steele? He likes being the other one. Less pressure, he says. More time to sit." },
    },
    choices = { { text = "What makes a good blade?", next = "blade" }, { text = "Let me see your weapons.", next = "BUSINESS" }, { text = "Goodbye.", next = "END" } },
  },
    blade = {
      lines = {
        { id = "b_good", text = "Good steel, patient hands, and an owner who cleans it. I can sell you the first two." },
      },
      choices = { { text = "Let me see your weapons.", next = "BUSINESS" }, { text = "I'll clean mine.", next = "END", fx = { affinity = 1 } } },
    }, },
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
      { id = "h_default", key = true, text = "Kurran. The other Steele. Corina sells you the sword; I sell you the coat you'll bleed on. Family business, in a way." },
      { id = "h_corina", when = { metBefore = true }, text = "Corina says leather's for people who can't commit. I say plate's for people who can't run." },
      { id = "h_buyers", when = { metBefore = true }, text = "Rogues buy dark colors. Druids buy anything that stretches. Hunters buy whatever's got the most pockets." },
      { id = "h_heard_corina", when = { heardLine = "corina.h_default" }, text = "Corina told you the juggling joke? She tells everyone. I've heard it a hundred times. It's getting better. Slowly." },
    },
    choices = { { text = "Why cloth and leather?", next = "why" }, { text = "Show me.", next = "BUSINESS" }, { text = "Later.", next = "END" } },
  },
    why = {
      lines = {
        { id = "w_quiet", text = "Quiet, light, and you can mend it yourself by a campfire. Try mending plate by a campfire." },
      },
      choices = { { text = "Fair point.", next = "END", fx = { affinity = 1 } }, { text = "Show me.", next = "BUSINESS" } },
    }, },
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
      { id = "h_sing", when = { metBefore = true }, text = "Had a mare in last week who wouldn't eat unless someone sang to her. I sang. You didn't hear that from me." },
      { id = "h_night", when = { timeOfDay = "night" }, text = "Shh. They're settling. Horses sleep standing up, did you know? Lightly. Like old soldiers." },
    },
    choices = { { text = "Do you have a favorite?", next = "favorite" }, { text = "The stable, please.", next = "BUSINESS" }, { text = "Just visiting.", next = "END" } },
  },
    favorite = {
      lines = {
        { id = "f_grey", text = "The old grey in the end stall. His rider rode out for Redridge and didn't come back. I kept him. Someone had to." },
      },
      choices = { { text = "That's kind of you.", next = "END", fx = { affinity = 2 } } },
    }, },
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
      { id = "h_faint", when = { metBefore = true }, text = "Most of my students faint the first time. The ones who don't, I keep a closer eye on." },
      { id = "h_linen", when = { metBefore = true }, text = "Linen's cheap. Carry plenty. The wolves out there don't care what it costs." },
    },
    choices = { { text = "Why teach bandaging?", next = "why" }, { text = "Teach me.", next = "BUSINESS" }, { text = "Later.", next = "END" } },
  },
    why = {
      lines = {
        { id = "w_father", text = "My father patched soldiers in the Second War. He said more men bled out than were cut down. So I teach people to stop the bleeding." },
      },
      choices = { { text = "Teach me.", next = "BUSINESS" }, { text = "Thank you.", next = "END", fx = { affinity = 1 } } },
    }, },
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
    lines = { { id = "h_default", text = "Crowe. Marcot handles the introductions; I handle the lessons. Darkheart handles the things that come when called." }, { id = "h_debt", when = { metBefore = true, class = "WARLOCK" }, text = "Remember what I told you. Power is a debt. Pay it on your terms, never theirs." },
        { id = "h_lost", when = { metBefore = true, ["not"] = { class = "WARLOCK" } }, text = "Still lost? The stairs are behind you. They go up. Use them." }, },
    choices = { { text = "Why train down here?", next = "cellar" }, { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } }, { text = "I'll go.", next = "END" } },
  },
    cellar = {
      lines = {
        { id = "c_quiet", text = "Upstairs, people would rather not know what we teach. Down here, nobody has to pretend otherwise." },
      },
      choices = { { text = "Fair enough.", next = "END" } },
    }, },
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
    lines = { { id = "h_default", text = "Darkheart. I teach your pets new tricks. Not the kind you'd show a crowd." }, { id = "h_keys", when = { metBefore = true }, text = "My imp took Dobbins' keys again. Dobbins thinks he's losing his mind. I haven't had the heart to tell him." }, },
    choices = { { text = "What's your imp's name?", next = "imp" }, { text = "Show me.", next = "BUSINESS", when = { class = "WARLOCK" } }, { text = "I'll go.", next = "END" } },
  },
    imp = {
      lines = {
        { id = "i_name", text = "He has one. Say it aloud and he gets smug. He's smug enough already." },
      },
      choices = { { text = "Fair.", next = "END", fx = { affinity = 1 } } },
    }, },
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
    lines = { { id = "h_default", text = "Lee Brown. I fish, and I teach fishing, and on good days I can't tell which I'm doing." }, { id = "h_long", when = { metBefore = true }, text = "Caught one this long yesterday. No, longer. It grows every time I tell it. That's fishing." },
        { id = "h_dawn", when = { timeOfDay = "dawn" }, text = "Best hour there is. Mist on the lake, fish rising, and nobody here but me. And now you." }, },
    choices = { { text = "Why fishing?", next = "why" }, { text = "Teach me.", next = "BUSINESS" }, { text = "Good fishing.", next = "END" } },
  },
    why = {
      lines = {
        { id = "w_quiet", text = "Quietest work in Elwynn. Nobody shouts at a fisherman. Nobody but the fish, and they don't shout loud." },
      },
      choices = { { text = "Good fishing.", next = "END", fx = { affinity = 1 } }, { text = "Teach me.", next = "BUSINESS" } },
    }, },
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
      { id = "h_default", key = true, text = "Helene Peltskinner. Wolves, boars, the odd bear. Everything out there has a coat, and every coat's worth something." },
      { id = "h_eagan", when = { heardLine = "eagan.h_default" },
        text = "You've met Eagan up in Northshire? The name's a coincidence, or it isn't. I'll let you wonder." },
      { id = "h_pelts", when = { metBefore = true }, text = "Wolf pelts sell best in winter. Boar hides, all year. Murloc skin, never. Don't bring me murloc." },
    },
    choices = { { text = "How did you learn?", next = "learn" }, { text = "Teach me.", next = "BUSINESS" }, { text = "Later.", next = "END" } },
  },
    learn = {
      lines = {
        { id = "l_mother", text = "My mother skinned, and her mother before her. You don't get a name like Peltskinner from baking bread." },
      },
      choices = { { text = "Teach me.", next = "BUSINESS" }, { text = "Makes sense.", next = "END", fx = { affinity = 1 } } },
    }, },
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
    lines = { { id = "h_default", key = true, text = "Adele Fielder. Boots, belts, jerkins. The things adventurers wear out fastest and complain about loudest." }, { id = "h_fix", when = { metBefore = true }, text = "Half my work is fixing what adventurers stitched themselves. The other half is telling them it wasn't so bad." }, { id = "h_helene", when = { heardLine = "helene.h_default" }, text = "Helene told you every coat's worth something? True. Until an adventurer stitches it himself. Then it's worth less." }, },
    choices = { { text = "What's hardest to make?", next = "hard" }, { text = "Teach me.", next = "BUSINESS" }, { text = "Later.", next = "END" } },
  },
    hard = {
      lines = {
        { id = "h_boots", text = "Boots. Everyone's feet are different, and everyone's sure theirs are normal." },
      },
      choices = { { text = "Teach me.", next = "BUSINESS" }, { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    }, },
  topics = { _none = { { id = "tp_none", text = "Can you stitch it? No? Then I'm no help." } } },
}
