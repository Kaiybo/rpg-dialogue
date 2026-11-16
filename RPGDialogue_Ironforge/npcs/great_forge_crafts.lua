-- The Great Forge's crafts: the Great Anvil, Deepmountain Mining, the Bronze Kettle, the Physician and the Arcanery.
-- Voices: bibles/great_forge_crafts.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC = P.TODO_NPC

-- Bengus Deepforge: blacksmithing trainer at the center of the Great Forge.
P:NPC {
  key = "if_bengus", id = TODO_NPC("Bengus Deepforge"), name = "Bengus Deepforge",
  bible = "bibles/great_forge_crafts.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "gruff" }, values = { "proud", "practical" },
  notices = { "craft" },

  impression = {
    first = "Bengus Deepforge teaches smithing at the very heart of the Great Forge, where the heat would melt a lesser teacher. He judges people by their hands, and he says most hands are soft.",
    third = "{name} met Bengus Deepforge, the master blacksmith who trains smiths at the Great Forge.",
  },

  greetings = {
    { id = "g_default", text = "If ye've only come in tae warm yer hands, stand back from the anvil while ye do it." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the forge, are ye? Show me yer hands, then; let's see if they've hardened." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing" } },
      text = "Ye've a smith's burns on yer forearms, I see. Good, for a smith who's never been burned has never stood close enough tae the work." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bengus Deepforge, an' this is the Great Forge, the fire at the heart o' Ironforge, which has never once gone out. If ye want tae learn tae work metal, there's no better place on this world tae learn it." },
      },
      again = {
        { id = "h_again", text = "Speak up, the bellows are loud." },
        { id = "h_again2", text = "What else? Mind the sparks off the Great Anvil, for they'll singe a beard." },
      },
      choices = {
        { text = "Teach me the craft.", next = "BUSINESS" },
        { text = "Has the Great Forge truly never gone out?", next = "forge" },
        { text = "What makes a good smith?", next = "good" },
        { text = "Where should a new smith find ore?", next = "ore" },
        { text = "A paladin's hammer is only as good as its maker.", next = "k_pally", when = { class = "PALADIN" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    forge = {
      lines = {
        { id = "fo_default", text = "Never, no' since the mountain was first hollowed out, for the heat comes up from the deep rock itself. When the gnomes first saw it, they asked how we'd built it, an' the truth is we didnae; we only found it an' put an anvil next to it." },
      },
      choices = {
        { text = "That's a humble thing for a dwarf to admit.", next = "forge_humble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge_humble = {
      lines = {
        { id = "fh_default", text = "I'm humble about the fire, {g:lad|lass}, no' about what I make wi' it. Any dwarf can stand beside the Great Forge, but it takes a smith tae turn its heat intae a blade that'll hold an edge in Blackrock." },
      },
      choices = {
        { text = "Craft is worth more than any gift of nature.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Without the fire, your craft is nothing.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    good = {
      lines = {
        { id = "go_default", text = "Patience first, then strength, an' then a stubbornness that won't let ye hand over a blade ye know is flawed. I've sent apprentices back tae the anvil four times in a mornin', an' the good ones thanked me for it later." },
      },
      choices = {
        { text = "Did any of them quit?", next = "good_quit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_quit = {
      lines = {
        { id = "gq_default", text = "Plenty, an' they went tae sell their wares in the Commons, where folk don't know any better. I don't blame them for it, but I'd no' trust their work on my back in a fight." },
      },
      choices = {
        { text = "Not everyone can be a master. They still earn a living.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Bad work sold as good is a kind of lie.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
      },
    },

    ore = {
      lines = {
        { id = "or_default", text = "Copper in Dun Morogh, if ye can get past the troggs that have come up out o' Gnomeregan, an' tin out in Loch Modan. Geofram Bouldertoe teaches minin' just along the way, an' he'll tell ye more than ye ever wanted tae know." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } } },
    },

    k_pally = {
      lines = {
        { id = "kp_default", text = "Aye, an' many a paladin's walked away from this forge wi' a hammer they'll carry till they die. Bring me yours some day an' I'll tell ye honestly whether it's worthy o' the Light ye put through it." },
        { id = "kp_dwarf", when = { race = "Dwarf" },
          text = "Spoken like a son o' Ironforge. There's been a paladin's hammer on the Great Anvil every week since Uther's day, an' I've made a few that've seen more battles than their owners." },
      },
      choices = {
        { text = "The Light matters more than the hammer.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A good hammer wins more fights than prayer.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "The Deepforges have worked metal beside the Great Forge since before there was a king in this mountain, an' I'm the latest an' the loudest of them." } },
    advice = { { id = "tp_ad", text = "Quench slowly, an' never in front o' the customer." } },
    _none = { { id = "tp_none", text = "I hammer metal, {g:lad|lass}, no' rumors. Ask someone who's got the time." } },
  },
}

-- Geofram Bouldertoe: mining trainer at Deepmountain Mining on the north side of the Great Forge.
P:NPC {
  key = "if_geofram", id = TODO_NPC("Geofram Bouldertoe"), name = "Geofram Bouldertoe",
  bible = "bibles/great_forge_crafts.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "steady" }, values = { "practical", "patient" },
  notices = { "craft" },

  impression = {
    first = "Geofram Bouldertoe teaches mining at the north side of the Great Forge and talks about stone the way other dwarves talk about ale. He has a deep respect for tunnels and none at all for troggs.",
    third = "{name} met Geofram Bouldertoe, who teaches mining in the Great Forge.",
  },

  greetings = {
    { id = "g_default", text = "Lookin' tae learn the pick? I can teach ye, if ye've the shoulders for it." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the tunnels? Ye've still all yer fingers, which is a fine start." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { origin = "dwarf_ironforge_miner" },
      text = "I'd know a miner's walk anywhere, the way ye keep yer head low under a doorway that's plenty high. Which tunnels did ye work, before ye took up adventurin'?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Geofram Bouldertoe, o' Deepmountain Minin'. I teach folk how tae find a seam, how tae follow it, an' how tae come back out o' the tunnel afterwards, which is the part most forget." },
        { id = "h_miner", when = { profession = { "Mining" } },
          text = "Geofram Bouldertoe, o' Deepmountain Minin', an' I see ye're one o' us already, by the dust on ye. Come tae learn the next vein, have ye?" },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've a seam map tae finish." },
        { id = "h_again2", text = "Go on, I'm listenin'." },
      },
      choices = {
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "How do I find a seam?", next = "seam" },
        { text = "What happened to the mines near Gnomeregan?", next = "troggs" },
        { text = "Who sells the picks around here?", next = "golnir" },
        { text = "Good digging, Geofram.", next = "END" },
      },
    },

    seam = {
      lines = {
        { id = "se_default", text = "Look at the rock where it changes color, for ore likes tae sit where two kinds o' stone meet. Copper shows green at the edges, tin's darker, an' when ye see silver ye'll know it, for it'll make yer heart jump." },
      },
      choices = {
        { text = "And the deeper metals?", next = "seam_deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seam_deep = {
      lines = {
        { id = "sd_default", text = "Iron an' mithril an' the like come later, in harder country further from home. Ye'll need more skill than ye've got, an' a better pick, an' friends who'll stand guard while ye swing it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    troggs = {
      lines = {
        { id = "tr_default", text = "Troggs came up out o' the deep places when Gnomeregan fell, an' they took half the good tunnels in Dun Morogh. Ironband's lot out in Loch Modan are fightin' them for every cart o' ore now, an' it's no' gettin' easier." },
      },
      choices = {
        { text = "Then we should drive them back to the deeps.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "troggs" } } },
        { text = "Then dig somewhere they aren't.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 }, learn = { "troggs" } } },
      },
    },

    golnir = {
      lines = {
        { id = "go_default", text = "Golnir, at the next counter, sells picks an' flux an' the like, an' he'll tell ye my teachin's out o' date while he does it. Pay him no mind; he means it as a compliment." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I dug for forty years before my knees told me tae teach instead, an' I listened tae them for once." } },
    advice = { { id = "tp_ad", text = "If the tunnel goes quiet, stop swingin' an' listen. Stone talks before it falls." } },
    _none = { { id = "tp_none", text = "If it isnae in the rock, I couldnae tell ye about it." } },
  },
}

-- Daryl Riknussun: cooking trainer at the Bronze Kettle; brother of Emrul.
P:NPC {
  key = "if_daryl", id = TODO_NPC("Daryl Riknussun"), name = "Daryl Riknussun",
  bible = "bibles/great_forge_crafts.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "jovial" }, values = { "generous", "proud" },
  notices = { "hunger" },

  impression = {
    first = "Daryl Riknussun teaches cooking at the Bronze Kettle and believes that a good meal solves most of life's problems. He talks about his brother Emrul's spice prices as if they were a personal insult.",
    third = "{name} met Daryl Riknussun, who teaches cooking at the Bronze Kettle in Ironforge.",
  },

  greetings = {
    { id = "g_default", text = "Ye look hungry, friend, an' I can fix that or teach ye tae fix it yerself." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the Kettle! What've ye been cookin' since I saw ye last?" },
  },

  notice = {
    { id = "n_cook", cat = "hunger", when = { profession = { "Cooking" } },
      text = "Ye smell o' woodsmoke an' boar fat, which means ye've been cookin' over a campfire. Good, for that's how every great cook starts." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Daryl Riknussun, cook, an' welcome tae the Bronze Kettle. I teach anyone who wants tae learn, from a fresh recruit wi' a boar haunch tae a grizzled mountaineer who's lived on hard biscuits too long." },
      },
      again = {
        { id = "h_again", text = "What else would ye like tae know? Ask while the pot's on." },
        { id = "h_again2", text = "Another question? Ye'll make a cook yet." },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What should a beginner cook first?", next = "first" },
        { text = "What's the finest dish in Ironforge?", next = "finest" },
        { text = "Who's the dwarf selling spices out front?", next = "emrul" },
        { text = "Do dwarves eat anything that isn't meat?", next = "k_elf", when = { race = "NightElf" } },
        { text = "I'll come back hungry.", next = "END" },
      },
    },

    first = {
      lines = {
        { id = "fi_default", text = "Boar, an' plenty of it, for Dun Morogh's full o' the beasts an' they're no' hard tae cook. Roast a few haunches over a fire, an' when ye can do that wi'out burnin' it, come back an' I'll teach ye somethin' wi' spice in it." },
      },
      choices = {
        { text = "Why does food matter for adventurers?", next = "first_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_why = {
      lines = {
        { id = "fw_default", text = "Because ye'll heal faster wi' a full belly, an' ye'll fight better wi' a good one. I've seen hearty stew do more for a tired company than any speech from a captain." },
      },
      choices = {
        { text = "A good meal is worth sharing with the whole company.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll keep the best food for myself.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },

    finest = {
      lines = {
        { id = "fn_default", text = "Ask ten dwarves an' ye'll get ten answers, but mine's a proper roast wi' Thunderbrew ale in the gravy. The folk in Thelsamar will tell ye it's their blood sausages, an' they're wrong, but I'll no' say it tae their faces." },
      },
      choices = {
        { text = "I've had those sausages. They're very good.", next = "finest_sausage" },
        { text = "Something else.", next = "BACK" },
      },
    },
    finest_sausage = {
      lines = {
        { id = "fs_default", text = "Fine, fine, they're very good, but they're a breakfast, no' a feast. Don't tell anyone in Loch Modan I admitted that much." },
      },
      choices = { { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } } },
    },

    emrul = {
      lines = {
        { id = "em_default", text = "That's my brother Emrul, an' he sells the spices an' recipes I teach wi', at prices I'd call criminal if he werenae family. We've shared this shop for years an' argued in it every day." },
      },
      choices = {
        { text = "What do you argue about?", next = "emrul_argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    emrul_argue = {
      lines = {
        { id = "ea_default", text = "Salt, mostly, an' whose turn it is tae scrub the kettle, an' whether our mother's stew had carrots in it. It did, an' he knows it did, but he'll never say so." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    k_elf = {
      lines = {
        { id = "ke_default", text = "We eat bread, an' cheese, an' mushrooms from the deep caves, though I'll grant ye there's meat in most of it. Bring me somethin' from yer forests an' I'll find a way tae cook it that'd make a Darnassian smile." },
      },
      choices = {
        { text = "I'd like to see you try.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Our father ran a kitchen in the Military Ward, an' Emrul an' me grew up peelin' potatoes for half the army." } },
    advice = { { id = "tp_ad", text = "Taste as ye go. A cook who doesn't taste is only guessin'." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, friend. If it's no' edible, it's no' my business." } },
  },
}

-- Emrul Riknussun: cooking supplies at the Bronze Kettle; Daryl's brother.
P:NPC {
  key = "if_emrul", id = TODO_NPC("Emrul Riknussun"), name = "Emrul Riknussun",
  bible = "bibles/great_forge_crafts.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "sharp" }, values = { "practical", "proud" },
  notices = { "hunger" },

  impression = {
    first = "Emrul Riknussun sells spices and recipes at the Bronze Kettle and swears his prices are fair. He talks about his brother Daryl with a fondness he hides under a great deal of complaining.",
    third = "{name} met Emrul Riknussun, Daryl's brother, who sells spices and recipes beside the Bronze Kettle.",
  },

  greetings = {
    { id = "g_default", text = "Spices, salt an' recipes, all at honest prices, whatever my brother's told ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more spice? I knew ye'd get the taste for it." },
  },

  notice = {
    { id = "n_hungry", cat = "hunger", when = { profession = { "Cooking" } },
      text = "Ah, a cook. Let me guess: Daryl taught ye somethin' an' sent ye tae me for the spices, as he always does." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Emrul Riknussun, cookin' supplies, an' the better-lookin' Riknussun, no matter what ye've heard. If Daryl's taught ye a recipe, I've the spices for it, an' a few recipes he hasnae thought o' yet." },
      },
      again = {
        { id = "h_again", text = "What else, then? I've a customer behind ye, I think." },
        { id = "h_again2", text = "Go on, ask." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Daryl says your prices are criminal.", next = "prices" },
        { text = "Where do your spices come from?", next = "spices" },
        { text = "Which recipe would you recommend?", next = "recipe" },
        { text = "Goodbye, Emrul.", next = "END" },
      },
    },

    prices = {
      lines = {
        { id = "pr_default", text = "Of course he does, for he's never bought a thing in his life; he just sends his students tae me. Spice comes a long way tae reach a mountain, an' somebody has tae pay the gryphon." },
      },
      choices = {
        { text = "Fair prices are a duty to your customers.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Charge what they'll pay. That's business.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },

    spices = {
      lines = {
        { id = "sp_default", text = "Mild spices come up from Stormwind on the tram, an' the hot ones come by ship tae Menethil an' then over the mountains. Every time the Dragonmaw block the Wetlands road, my prices go up, an' Daryl calls me a thief." },
      },
      choices = {
        { text = "The tram brings spices?", next = "spices_tram" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } },
      },
    },
    spices_tram = {
      lines = {
        { id = "st_default", text = "It brings everythin', now that the gnomes have it runnin' under the sea tae Stormwind. I don't like ridin' it myself, for there's a great deal o' water above ye, but the spice doesnae mind." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    recipe = {
      lines = {
        { id = "re_default", text = "Start wi' somethin' hearty that ye can make from what ye kill on the road, like boar or crocolisk. Fancy dishes are for folk who sit at home, an' ye don't look like one o' them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Daryl got the cookin' an' I got the head for figures, an' between us we make one decent dwarf." } },
    advice = { { id = "tp_ad", text = "Keep yer salt dry. Ye'd be amazed how many adventurers don't." } },
    _none = { { id = "tp_none", text = "Never heard of it, an' I've heard of most things that come through the Great Forge." } },
  },
}

-- Nissa Firestone: first aid trainer at the Ironforge Physician; sends experts to Theramore.
P:NPC {
  key = "if_nissa", id = TODO_NPC("Nissa Firestone"), name = "Nissa Firestone",
  bible = "bibles/great_forge_crafts.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "practical", "compassionate" },
  notices = { "weary" },

  impression = {
    first = "Nissa Firestone teaches bandaging at the Ironforge Physician and has no patience for anyone who bleeds on her floor. She is gentle with wounds and brisk with everything else.",
    third = "{name} met Nissa Firestone, who teaches first aid at the Ironforge Physician.",
  },

  greetings = {
    { id = "g_default", text = "Sit down if ye're bleedin', an' stand if ye're no'. Which is it?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' still in one piece, I see. Good, keep it that way." },
  },

  notice = {
    { id = "n_hurt", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Yer armor's in tatters, so I'd guess what's under it's no' much better. Let me see, an' don't argue." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nissa Firestone, physician. I teach bandagin' tae anyone wi' sense enough tae learn it, for ye'll no' always have a priest nearby when the trouble starts." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Nissa Firestone, physician, an' I see ye're one o' the Light's lot. Don't scoff at bandages, priest, for there'll come a day when ye've no prayer left an' a friend still bleedin'." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've a patient upstairs." },
        { id = "h_again2", text = "Ask quickly, then." },
      },
      choices = {
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Why learn bandages when there are priests?", next = "why" },
        { text = "Who can teach me beyond what you know?", next = "beyond" },
        { text = "What sort of wounds do you see most?", next = "wounds" },
        { text = "Thank you, Nissa.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because priests get tired, an' priests get killed, an' some days there isnae one for a day's walk. A roll o' linen in yer pack never runs out o' mana." },
      },
      choices = {
        { text = "The Light provides, but it's wise to be ready.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'd trust linen over prayers any day.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },

    beyond = {
      lines = {
        { id = "be_default", text = "Once ye're past what I teach, ye'll want a book called Expert First Aid, sold by Deneb Walker at Stromgarde in the Arathi Highlands. After that, it's Doctor Gustaf VanHowzen in Theramore, who treats the wounded at the barracks there." },
      },
      choices = {
        { text = "Why go all the way to Theramore?", next = "beyond_theramore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beyond_theramore = {
      lines = {
        { id = "bt_default", text = "Because VanHowzen sees more wounded in a week than I see in a season, wi' Theramore holdin' the line in Dustwallow Marsh. He'll test ye on real soldiers, no' practice dummies, an' if ye pass, there's no better healer wi' a bandage in the Alliance." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    wounds = {
      lines = {
        { id = "wo_default", text = "Burns from the Great Forge, mostly, an' broken toes from dropped ingots. Then the mountaineers come in from Loch Modan wi' trogg bites, an' those are worse, for troggs don't wash." },
      },
      choices = {
        { text = "Do you ever treat anyone you shouldn't?", next = "wounds_who" },
        { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },
    wounds_who = {
      lines = {
        { id = "ww_default", text = "I treat whoever's bleedin', an' I ask their business afterwards. A guard once brought me a Dark Iron prisoner wi' a broken arm, an' I set it as well as I'd set the King's." },
      },
      choices = {
        { text = "That's right. A healer shouldn't take sides.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, learn = { "dark_iron" } } },
        { text = "I'd have left him for the guards.", next = "BACK", fx = { align = { order = 1 }, learn = { "dark_iron" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I patched up soldiers in the Second War, an' I've been patchin' up adventurers ever since. Adventurers are worse patients." } },
    advice = { { id = "tp_ad", text = "Bandage first, ask questions after. The wound won't wait for yer curiosity." } },
    _none = { { id = "tp_none", text = "That's no' a wound, so it's no' my concern." } },
  },
}

-- Gimble Thistlefuzz: enchanting trainer in Thistlefuzz Arcanery; jumpy and suspicious; kin to Tilli.
P:NPC {
  key = "if_gimble", id = TODO_NPC("Gimble Thistlefuzz"), name = "Gimble Thistlefuzz",
  bible = "bibles/great_forge_crafts.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "anxious" }, values = { "curious", "careful" },
  notices = { "arcane" },

  impression = {
    first = "Gimble Thistlefuzz teaches enchanting upstairs in Thistlefuzz Arcanery and jumps at every footstep on the stairs. Once he decides a visitor isn't there to steal his formulas, he cannot stop talking about them.",
    third = "{name} met Gimble Thistlefuzz, a nervous gnome who teaches enchanting in Ironforge.",
  },

  greetings = {
    { id = "g_default", text = "Who's there? Oh, a customer. You might have knocked, you know." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. I suppose you can come in, since you didn't steal anything last time." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = { "MAGE", "WARLOCK" } },
      text = "You're humming with magic, aren't you? Please don't touch the rods on the shelf, for they're very sensitive and so am I." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gimble Thistlefuzz, enchanter, and you've found the Arcanery, which most people don't. I can teach you to bind magic into cloth and steel, if you promise not to tell anyone how I do it." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, before someone else comes up the stairs." },
        { id = "h_again2", text = "Go on, then, but close the door first, if you please." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "Why are you so nervous?", next = "nervous" },
        { text = "How does enchanting actually work?", next = "how" },
        { text = "Who's the gnome downstairs?", next = "tilli" },
        { text = "I'll leave you in peace.", next = "END" },
      },
    },

    nervous = {
      lines = {
        { id = "ne_default", text = "I'm not nervous, I'm careful, which is different, and you'd be careful too if you'd lost everything once already. When Gnomeregan fell I left behind ten years of notes, and I've no intention of losing the next ten." },
      },
      choices = {
        { text = "I'm sorry you lost so much.", next = "nervous_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nervous_lost = {
      lines = {
        { id = "nl_default", text = "Kind of you, I suppose, though it doesn't bring the notes back. I keep copies of everything now, three copies, in three places, and I'm not telling you where any of them are." },
      },
      choices = {
        { text = "Knowledge should be shared, not hidden.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Guarding your work is only sensible.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },

    how = {
      lines = {
        { id = "hw_default", text = "You take something that already holds magic, a wand or a ring or even a cloak, and you break it down into dust and essence. Then you use a rod to put that magic back into something else, in a shape you choose, and that's the trick of it." },
      },
      choices = {
        { text = "So you destroy one thing to improve another?", next = "how_destroy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_destroy = {
      lines = {
        { id = "hd_default", text = "Exactly, and it's a shame sometimes, when a lovely old ring goes to dust. But the magic doesn't vanish, it only moves, and I'd rather it moved into a sword that's useful than sat in a ring nobody wears." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tilli = {
      lines = {
        { id = "ti_default", text = "That's Tilli, and she sells the rods and reagents, and she's family, so you can trust her, more or less. She knows more about my business than I'd like, which is the trouble with family." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I enchanted in Gnomeregan before the fall, and I enchant here now, upstairs, where I can hear people coming." } },
    advice = { { id = "tp_ad", text = "Never disenchant anything you might want back later. I've learned that the hard way." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, and I'd rather not, frankly." } },
  },
}
