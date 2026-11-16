-- Thelsamar's trades: the gryphon master, the metalsmith, the Stoutlager Inn's baker and the mining supplier.
-- Voices: bibles/thelsamar_shops.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC = P.TODO_NPC

-- Thorgrum Borrelson: gryphon master of Thelsamar.
P:NPC {
  key = "lm_thorgrum", id = TODO_NPC("Thorgrum Borrelson"), name = "Thorgrum Borrelson",
  bible = "bibles/thelsamar_shops.md", role = "flightmaster", tier = "service",
  communities = { "thelsamar" }, temper = { "steady" }, values = { "dutiful", "patient" },
  notices = { "mount" },

  impression = {
    first = "Thorgrum Borrelson keeps Thelsamar's gryphons and reads the weather over the loch better than any almanac. He trusts his birds more than most people, and says so.",
    third = "{name} met Thorgrum Borrelson, the gryphon master of Thelsamar.",
  },

  greetings = {
    { id = "g_default", text = "Need a gryphon? The wind's fair over the loch today, so ye'll have a smooth ride." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The birds remember ye, for they've stopped hissin'." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Get down off that beast before ye come near my gryphons, if ye please. They take a mount for supper if nobody stops them." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      lines = {
        { id = "xro_default", text = "Aye, they do, an' they tell me most o' it in their own way. I'd no' try sneakin' up on a gryphon, friend, for they've noses like hounds an' tempers like a cave bear wi' a sore head." },
      },
      choices = {
        { text = "I'll keep my distance and my respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Anything can be snuck up on, given patience.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Is the road dangerous these days?", next = "danger" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Ha, there's a mage wi' sense! Yer spell will get ye there quicker, but it'll no' show ye the loch from above or the mountains goin' by, an' that's half the reason tae go anywhere." },
      },
      choices = {
        { text = "There's no shame in the slow way, Thorgrum.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Next time I'll blink there and save the silver.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How do you train the gryphons?", next = "train" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thorgrum Borrelson, gryphon master o' Thelsamar. From here my birds fly tae Ironforge an' over the mountains tae Menethil Harbor, an' they fly it faster than any road." },
      },
      again = {
        { id = "h_again", text = "What else? The birds are restless, so I'll keep one eye on the roost." },
        { id = "h_again2", text = "Ask away, friend." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "What's it like flying over the loch?", next = "loch" },
        { text = "Are the gryphons ever in danger?", next = "danger" },
        { text = "How do you train them?", next = "train" },
        { text = "Your gryphons must see everything from up there.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'll have a teleport to Ironforge soon, but I'd rather fly.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Thanks, Thorgrum.", next = "END" },
      },
    },

    loch = {
      lines = {
        { id = "lo_default", text = "Like nothin' else in the world, for ye can see the whole loch an' the dam at the north end, holdin' it all back. On a clear mornin', the water's so still ye can see the gryphon's shadow on it." },
      },
      choices = {
        { text = "What happens if the dam breaks?", next = "loch_dam" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loch_dam = {
      lines = {
        { id = "ld_default", text = "Then the loch empties intae the Wetlands an' takes half o' Menethil wi' it, which is why Hinderweir sleeps on the thing. I fly over it every day, an' I've never seen a crack, but I'm no engineer." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "stonewrought_dam" } } } },
    },

    danger = {
      lines = {
        { id = "da_default", text = "Sometimes, over the Wetlands, for the Dragonmaw have been seen wi' red dragons near Grim Batol. My birds know tae fly high an' fast there, an' so far they've always come home." },
      },
      choices = {
        { text = "Someone should deal with the Dragonmaw.", next = "BACK", fx = { align = { order = 1 }, trait = { brave = 1 }, learn = { "dragonmaw" } } },
        { text = "Better to fly around trouble than into it.", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 }, learn = { "dragonmaw" } } },
      },
    },

    train = {
      lines = {
        { id = "tr_default", text = "Wi' patience, an' meat, an' a great deal o' talkin' to. A gryphon has tae trust ye before it'll carry ye, an' ye earn that trust one day at a time, no' all at once." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I flew wi' the gryphon riders in the Second War, an' I've kept birds ever since." } },
    advice = { { id = "tp_ad", text = "Hold on wi' yer knees, no' yer hands. The bird knows the way." } },
    _none = { { id = "tp_none", text = "Couldnae say, friend. My birds know more about that than I do, an' they're no' talkin'." } },
  },
}

-- Morhan Coppertongue: metalsmith in Thelsamar; mail armor for mountaineers and miners.
P:NPC {
  key = "lm_morhan", id = TODO_NPC("Morhan Coppertongue"), name = "Morhan Coppertongue",
  bible = "bibles/thelsamar_shops.md", role = "blacksmith", tier = "service",
  communities = { "thelsamar" }, temper = { "sharp" }, values = { "proud", "practical" },
  notices = { "kit" },

  impression = {
    first = "Morhan Coppertongue sells mail armor in Thelsamar and can talk a mountaineer into a heavier coat than he came in for. He is proud of his trade and prouder of his tongue.",
    third = "{name} met Morhan Coppertongue, a metalsmith in Thelsamar.",
  },

  greetings = {
    { id = "g_default", text = "Mail, friend, the finest in Loch Modan, an' I'll tell ye why if ye've a minute." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I knew ye'd come back for the heavier coat." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Now that's a sorry state for armor tae be in. The troggs did that, didn't they? Ye'll want somethin' thicker next time." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      lines = {
        { id = "xro_default", text = "Quieter? Mail's meant tae be heard, so the trogg knows he's in for a fight. If ye want somethin' that won't clink, ye want leather, an' that means a leatherworker an' no' a smith." },
      },
      choices = {
        { text = "Fair enough. A fight should be heard coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A fight they don't hear coming is half won.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's the trouble with the troggs?", next = "troggs" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Ye can keep yer hands an' yer magic away from my forge, thank ye. Steel wants honest heat from good coal, an' I've seen what happens tae a blade when somebody gets clever wi' it." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "A gnome mage at my forge? Yer people make fine things, I'll grant ye, but I've seen enchanted steel crack in the cold, so I'll stick tae coal." },
      },
      choices = {
        { text = "Respect to the forge, then. I'll stay out.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Honest heat is only slow heat, Morhan.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why do they call you Coppertongue?", next = "name" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Morhan Coppertongue, metalsmith, an' the mountaineers o' Thelsamar wear my mail when they go out after troggs. That's the best advertisement I could ask for, for none o' them has complained yet." },
      },
      again = {
        { id = "h_again", text = "What else can I talk ye intae, friend?" },
        { id = "h_again2", text = "Go on, I'm listenin', an' I've a fine coat behind me." },
      },
      choices = {
        { text = "Show me your mail.", next = "BUSINESS" },
        { text = "Why do they call you Coppertongue?", next = "name" },
        { text = "What's the trouble with the troggs here?", next = "troggs" },
        { text = "Do the mountaineers really never complain?", next = "complain" },
        { text = "Your mail's too noisy for my work. Got anything quieter?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could your forge use an extra hand with the fire?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Thanks, Morhan.", next = "END" },
      },
    },

    name = {
      lines = {
        { id = "na_default", text = "My grandfather could sell copper tae a copper mine, so they say, an' the name stuck tae the family. I'm no' as good as he was, but I've sold a breastplate tae a gnome, which is near enough." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    troggs = {
      lines = {
        { id = "tr_default", text = "They've come up out o' the ground at Stonesplinter Valley an' around Ironband's dig, an' they bite through leather like it's bread. Mail stops them, mostly, which is why business is good, though I'd rather it wasn't." },
      },
      choices = {
        { text = "You'd rather business was bad?", next = "troggs_bad" },
        { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },
    troggs_bad = {
      lines = {
        { id = "tb_default", text = "I'd rather the mountaineers didnae need my mail, aye. Every coat I sell is one more dwarf walkin' intae trouble, an' I've buried a few o' my customers." },
      },
      choices = {
        { text = "Your mail keeps more of them alive than not.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A trade is a trade. Don't think on it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    complain = {
      lines = {
        { id = "co_default", text = "Well, they complain about the weight, an' the price, an' the way it squeaks in the rain. But they don't complain about the troggs, which is the important thing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "The Coppertongues have sold metal in Loch Modan since before the dam was built, an' talked about it the whole time." } },
    advice = { { id = "tp_ad", text = "Oil yer mail after every rain. Loch Modan's damp, whatever the locals say." } },
    _none = { { id = "tp_none", text = "Now that's one thing I cannae talk about, an' there aren't many." } },
  },
}

-- Honni Goldenoat: baker at the Stoutlager Inn.
P:NPC {
  key = "lm_honni", id = TODO_NPC("Honni Goldenoat"), name = "Honni Goldenoat",
  bible = "bibles/thelsamar_shops.md", role = "vendor", tier = "service",
  communities = { "thelsamar" }, temper = { "warm" }, values = { "generous", "friendly" },
  notices = { "hunger" },

  impression = {
    first = "Honni Goldenoat bakes the bread at the Stoutlager Inn and is up before anyone else in Thelsamar. She is warm, floury, and of the firm opinion that sausages need bread to be a meal.",
    third = "{name} met Honni Goldenoat, the baker at Thelsamar's Stoutlager Inn.",
  },

  greetings = {
    { id = "g_default", text = "Fresh bread, still warm from the oven! Ye'll no' find better on this side o' the mountains." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I saved ye a loaf, or I would have if I'd known ye were comin'." },
  },

  notice = {
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 20 },
      text = "Ye look like ye've been livin' on rations, by the color o' ye. Have some bread; ye'll feel better." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      lines = {
        { id = "xro_default", text = "Is it? Well, it's Thelsamar, an' the worst that walks in is a hungry mountaineer after a loaf. Ye're no' plannin' tae take one yerself, are ye?" },
      },
      choices = {
        { text = "No, but I thought you ought to know.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I might, if the smell keeps up like this.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's the secret in your bread?", next = "secret" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Yer... imp? Get that thing out from under my ovens before it singes my rye! I'll serve ye, for coin's coin, but the wee horror waits outside." },
      },
      choices = {
        { text = "Of course. It'll wait outside.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It does no harm, and it's my business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Who are you baking for?", next = "who" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Honni Goldenoat, baker at the Stoutlager Inn, an' I've had flour on my hands since before the sun came up. If ye're hungry, ye've come tae the right counter." },
        { id = "h_dawn", when = { timeOfDay = "dawn" },
          text = "Mornin'! Ye're up early, so ye get the first loaf, still too hot tae hold, so mind yer fingers." },
      },
      again = {
        { id = "h_again", text = "Anythin' else, love?" },
        { id = "h_again2", text = "Ask away, while the oven warms." },
      },
      choices = {
        { text = "Let me buy some bread.", next = "BUSINESS" },
        { text = "What's the secret to good bread?", next = "secret" },
        { text = "Bread or Vidra's sausages, which is better?", next = "sausage" },
        { text = "Who comes in for your bread?", next = "who" },
        { text = "Your back door's unlocked, you know.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "My imp likes the warmth of your ovens.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Goodbye, Honni.", next = "END" },
      },
    },

    secret = {
      lines = {
        { id = "se_default", text = "Good flour, a warm oven, an' patience, for ye cannae rush a loaf no matter how hungry the miners are. An' a wee bit o' ale in the dough, which I'll deny if ye tell anyone." },
      },
      choices = { { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } } },
    },

    sausage = {
      lines = {
        { id = "sa_default", text = "Ha! They go together, love, like a hammer an' an anvil. A sausage wi'out bread is only half a meal, an' Vidra knows it, though she'll never admit it tae me." },
      },
      choices = {
        { text = "Then you two should work together.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A friendly rivalry keeps you both sharp.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },

    who = {
      lines = {
        { id = "wh_default", text = "The mountaineers, every mornin', an' the miners on their way tae the hills, an' the Explorers' League folk when they come back from their digs, starvin'. I've fed half o' Loch Modan, an' I'd feed the other half if they'd come in." },
      },
      choices = {
        { text = "What about the Explorers' League folk?", next = "who_league" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_league = {
      lines = {
        { id = "wl_default", text = "They come in from Ironband's dig covered in dust an' arguin' about old stones. I give them bread tae stop them talkin', an' it works, for a minute or two." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned tae bake from my mother, who baked for the dam workers when it was bein' built." } },
    advice = { { id = "tp_ad", text = "Never travel wi'out bread. It doesnae spoil as quick as meat." } },
    _none = { { id = "tp_none", text = "I wouldnae know about that, love. Ask someone who's no' covered in flour." } },
  },
}

-- Karm Ironquill: mining supplies in Thelsamar.
P:NPC {
  key = "lm_karm", id = TODO_NPC("Karm Ironquill"), name = "Karm Ironquill",
  bible = "bibles/thelsamar_shops.md", role = "vendor", tier = "service",
  communities = { "thelsamar" }, temper = { "gruff" }, values = { "practical", "honest" },
  notices = { "craft" },

  impression = {
    first = "Karm Ironquill sells picks and mining supplies in Thelsamar and keeps a careful eye on which mines are safe this week. He says little, but what he says is worth listening to.",
    third = "{name} met Karm Ironquill, who sells mining supplies in Thelsamar.",
  },

  greetings = {
    { id = "g_default", text = "Picks, flux an' blastin' powder, an' that's all I sell, so don't ask for bread." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are ye? Still diggin' in those hills, I suppose." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = { "Mining" } },
      text = "Ye've dust on yer boots from the Silver Stream, I'd guess, by the color. Mind the kobolds in there." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      lines = {
        { id = "xro_default", text = "So does a crowbar, an' I'll no' sell ye one if that's what ye're after. Picks are for the hills, an' if I hear o' one goin' through a strongbox in Thelsamar, I'll know where it was bought." },
      },
      choices = {
        { text = "Rock only, Karm. You have my word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A tool's a tool. What I open is my affair.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where's the best digging?", next = "where" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "For a mage? I've candles an' rope an' picks, an' no' a single thing wi' a glow on it. Ye'll want the reagent sellers in Ironforge, or if ye're desperate, a trogg's pockets." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "For a gnome mage? I've had a few o' yer folk through since Gnomeregan, an' they always ask, an' I always say the same: candles an' rope, an' Ironforge for the rest." },
      },
      choices = {
        { text = "I'll buy my reagents properly in Ironforge.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A trogg's pockets it is, then.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Is it safe out in the hills?", next = "safe" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Karm Ironquill, minin' supplies. If ye're goin' intae the hills tae dig, ye'll want a good pick an' a better reason, for it's no' safe out there these days." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Where's good mining around here?", next = "where" },
        { text = "Why isn't it safe?", next = "safe" },
        { text = "What brings you to Thelsamar?", next = "why" },
        { text = "A good pick opens more than rock, I find.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you stock anything for a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Thanks, Karm.", next = "END" },
      },
    },

    where = {
      lines = {
        { id = "wh_default", text = "Tin an' copper in the hills all around the loch, an' a bit o' silver if ye're lucky. The Silver Stream Mine in the north had the best seams, before the kobolds moved in an' made it theirs." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    safe = {
      lines = {
        { id = "sa_default", text = "Kobolds in the Silver Stream, troggs in the south an' around Ironband's dig, an' the Mo'grosh ogres out east, who'll eat a miner as soon as look at him. Take a friend, if ye've got one." },
      },
      choices = {
        { text = "I'll clear them out of the mine.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "troggs" } } },
        { text = "I'll dig where they aren't looking.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 }, learn = { "troggs" } } },
      },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Ore, same as everyone. Thelsamar's the closest town tae the hills, an' miners need picks, so here I am, an' here I'll stay while the ore holds out." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I worked the deep mines under Ironforge till the dust got intae my chest, an' now I sell picks tae younger lungs." } },
    advice = { { id = "tp_ad", text = "Carry two picks. One always breaks when ye need it most." } },
    _none = { { id = "tp_none", text = "Don't know an' don't care, so ye'd best ask at the inn." } },
  },
}
