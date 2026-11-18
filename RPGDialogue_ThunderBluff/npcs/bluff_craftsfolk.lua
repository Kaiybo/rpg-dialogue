-- Craftsfolk of the Lower and High Rise: Orm Stonehoof, who makes the brutal helm, Karn Stonehoof
-- at the smithing fire, Ahanu the leatherworker at Hewa's Armory, and Bulrug the stable master.
-- Voices: bibles/bluff_craftsfolk.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Orm Stonehoof: the helm-maker who asks for a chimaera's horn.
---------------------------------------------------------------------------
P:NPC {
  key = "orm_stonehoof", id = TODO_NPC("Orm Stonehoof"), name = "Orm Stonehoof",
  bible = "bibles/bluff_craftsfolk.md", role = "blacksmith", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "calm", "proud" }, values = { "honest", "loyal" },
  notices = { "craft", "class" },
  impression = {
    first = "Orm Stonehoof works near the pool by Thunder Bluff's great central totem, and he is respected across the bluffs for the helms he makes. He is slow to speak and slower to agree, and he will not make a helm for anyone who hasn't earned it.",
    third = "{name} met Orm Stonehoof, the Thunder Bluff smith who makes the brutal helm.",
  },

  greetings = {
    { id = "g_hi", text = "Greetings, {class}. Stand by the water if the forge is too warm for you." },
    { id = "g_horn", when = { questActive = TODO_QUEST("Chimaeric Horn") }, text = "The Charred Vale is a long walk, and the matriarch is not easy prey. Come back when you carry her horn." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You have a smith's shoulders, and a smith's burn on your wrist. Who taught you to hold the tongs so low?" },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Your helm has been struck hard on the left side, more than once. Do you always lead with that side of your head?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Orm Stonehoof, and I make helms, the kind that turn an axe and remind the one who wears it what it cost. The Earth Mother gives us iron, and I don't care to waste it on the unworthy." },
        { id = "h_thungrim", when = { questActive = TODO_QUEST("Orm Stonehoof and the Brutal Helm") },
          text = "Greetings, {class}. I am Orm, and Thun'grim tells me you wish a helm made, so let us see whether you are worth the iron." },
        { id = "h_done", when = { questDone = TODO_QUEST("Brutal Helm") },
          text = "You wear the helm well, and you have shown me your worth and your resolve. Keep it oiled, and it will keep your head." },
      },
      again = {
        { id = "h_again", text = "What else would you know, {class}?" },
        { id = "h_again2", text = "Speak. The forge can wait a moment." },
      },
      choices = {
        { text = "What must I do to earn a helm?", next = "helm" },
        { text = "How do you know Thun'grim?", next = "thungrim" },
        { text = "Are you kin to the other Stonehoofs?", next = "kin" },
        { text = "Why work beside the central totem?", next = "totem" },
        { text = "I'll leave you to the forge.", next = "END" },
      },
    },
    helm = {
      lines = { { id = "he_default", text = "In the southwest of the Stonetalon Mountains lies the Charred Vale, once green, now ashen, and the creatures left there are mad with pain. Find a chimaera matriarch, slay her, free her of her misery, and bring me her horn, galvanized by the magic of that place." } },
      choices = {
        { text = "Why the horn of a suffering beast?", next = "horn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horn = {
      big = true,
      lines = { { id = "ho_default", text = "Because the one who wears the helm should know that strength sometimes means ending pain, not causing it. The matriarch suffers every day the Vale burns, and killing her is the kindest thing anyone will do for her." } },
      choices = {
        { text = "Then I'll end it cleanly, as a mercy.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A kill is a kill. I'll do it for the helm.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thungrim = {
      lines = { { id = "th_default", text = "Thun'grim Firegaze is an orc who keeps a fire in the Barrens and sends me those he thinks worthy of the brutal armour. We disagree about nearly everything except iron, and that is enough to be friends." } },
      choices = {
        { text = "Who makes the rest of the set?", next = "set" },
        { text = "Something else.", next = "BACK" },
      },
    },
    set = {
      lines = { { id = "se_default", text = "Velora Nitely in the Undercity makes the legguards, and Thun'grim says she tells jokes while she works, though none of them ever land. I have never met her, and I think I am content with that." } },
      choices = { { text = "Something else, Orm.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "ki_default", text = "Karn is my brother, and he teaches smithing by the lower fires, and Melor on Hunter Rise is a cousin I see at every gathering. The Stonehoofs are many, and most of us work with our hands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    totem = {
      lines = { { id = "to_default", text = "Because the water cools the iron and the totem reminds me why I shape it. My father worked here, and his mother before him, when the bluffs were only a camp and the lifts were rope and willow." } },
      choices = { { text = "Something else, Orm.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was born on the plains before the bluff was ours, and I carried iron up the lifts the first winter we lived here." } },
    advice = { { id = "tp_ad", text = "A helm is only as good as the strap beneath the chin. Look there first." } },
    _none = { { id = "tp_none", text = "I do not know that. Ask an elder, or ask the wind." } },
  },
}

---------------------------------------------------------------------------
-- Karn Stonehoof: blacksmithing trainer, Orm's patient brother.
---------------------------------------------------------------------------
P:NPC {
  key = "karn_stonehoof", id = TODO_NPC("Karn Stonehoof"), name = "Karn Stonehoof", title = "Blacksmithing Trainer",
  bible = "bibles/bluff_craftsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm", "warm" }, values = { "practical" },
  notices = { "craft" },
  impression = {
    first = "Karn Stonehoof teaches blacksmithing on the bluffs with a patience his brother Orm doesn't share. He likes beginners, because they haven't learned any bad habits yet.",
    third = "{name} met Karn Stonehoof, the blacksmithing trainer of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Come and stand by the anvil, and don't be afraid of the sparks, because they're more frightened of you." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Your hammer's head is loose, I can hear it. Fix that before it flies off and finds someone's skull." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Karn Stonehoof, and I teach the shaping of metal to anyone willing to sweat for it. Our people came late to the forge, but we have taken to it well, I think." },
        { id = "h_smith", when = { profession = "Blacksmithing" },
          text = "Back for another lesson? Good, the iron is warm, and so is my patience today." },
      },
      again = { { id = "h_again", text = "What else would you know?" } },
      choices = {
        { text = "I'm ready to learn.", next = "BUSINESS", when = { profession = "Blacksmithing" } },
        { text = "How did tauren come to the forge?", next = "forge" },
        { text = "You're Orm's brother?", next = "orm" },
        { text = "Farewell, Karn.", next = "END" },
      },
    },
    forge = {
      lines = { { id = "fo_default", text = "From the orcs, mostly, when Thrall's people came to Mulgore and traded iron for hides. Before that we worked stone and bone and wood, and some of the elders still think the forge is too loud for the Earth Mother's ears." } },
      choices = {
        { text = "Do you think they're right?", next = "elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elders = {
      big = true,
      lines = { { id = "el_default", text = "I think the Earth Mother gave us the iron, so she must want it used. But I make my apprentices thank the ore before they melt it, all the same, because the old ways cost nothing to keep." } },
      choices = {
        { text = "The old ways matter. Keep them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "New skills keep the people strong. Let them change.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orm = {
      lines = { { id = "or_default", text = "I am, and he makes the finest helms on the bluffs, and he will tell you so if you wait long enough. He only makes them for the worthy, while I teach anyone, and we both think the other is foolish for it." } },
      choices = { { text = "Something else, Karn.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned at an orc's anvil in Durotar, and I burned myself every day for a season. It was worth it." } },
    _none = { { id = "tp_none", text = "I only know metal, friend. Ask someone with more patience for talk." } },
  },
}

---------------------------------------------------------------------------
-- Ahanu: leatherworker at Hewa's Armory, always waiting on a bundle of hides.
---------------------------------------------------------------------------
P:NPC {
  key = "ahanu", id = TODO_NPC("Ahanu"), name = "Ahanu", title = "Leather Armor Merchant",
  bible = "bibles/bluff_craftsfolk.md", role = "vendor", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "warm", "anxious" }, values = { "honest", "practical" },
  notices = { "craft", "kit" },
  impression = {
    first = "Ahanu stitches leather at Hewa's Armory, at the foot of the wind rider tower, and he is happiest when a fresh bundle of hides arrives. He makes goods for Jahan Hawkwing to sell at the Crossroads and fusses over them like a parent.",
    third = "{name} met Ahanu, a leatherworker at Hewa's Armory in Thunder Bluff.",
  },

  greetings = {
    { id = "g_hi", text = "Welcome to Hewa's Armory, friend. Mind the hides, some of them are still drying." },
    { id = "g_bundle", when = { questActive = TODO_QUEST("Ride to Thunder Bluff") }, text = "Is that a bundle of hides off the wind riders? Ah, wonderful, set it down here and let me see." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Your stitches are even, I can see it from here. Who taught you, if I may ask?" },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your leathers are torn at the seams, friend. A day in the Barrens will finish them off if you don't let someone mend them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ahanu, and I work the hides that come up from the plains, and I sell what I make here and down at the Crossroads. Thank you for stopping, because most travellers walk straight past to the lift." },
        { id = "h_after", when = { questDone = TODO_QUEST("Ride to Thunder Bluff") },
          text = "The hides you brought were good ones, friend, and I've already turned half of them into jerkins. You did me a great service, and I hope the coin was enough for your travels." },
        { id = "h_tal", when = { questActive = TODO_QUEST("Tal the Wind Rider Master") },
          text = "Take the leather goods to Tal at the top of the tower, and he'll arrange a wind rider to the Crossroads. Jahan Hawkwing, who sells my goods there, has been waiting on them all week." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend? I can stitch and talk." },
        { id = "h_again2", text = "Ask away. The hides are patient." },
      },
      choices = {
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Why does Jahan sell your goods?", next = "jahan" },
        { text = "What is Hewa's Armory?", next = "armory" },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Farewell, Ahanu.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Kodo and plainstrider from Mulgore, mostly, and some from the Barrens that come up on the wind riders from the Crossroads. Every hide comes from a hunt, and I try to waste none of it, because the beast gave all of itself." } },
      choices = {
        { text = "Do you hunt for them yourself?", next = "hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunt = {
      big = true,
      lines = { { id = "hu_default", text = "Not any longer, my knees won't allow it, so I buy from the hunters and I thank each beast as I cut. Some say a tauren should only wear what he has hunted himself, but I think the hide doesn't care whose hands it passes through." } },
      choices = {
        { text = "The old way is better. Hunt what you wear.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trade lets everyone do what they do best.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jahan = {
      lines = { { id = "ja_default", text = "Jahan Hawkwing has a stall at the Crossroads, where every traveller in the Barrens passes sooner or later. I'm a good stitcher and a poor seller, and Jahan is the reverse, so we've worked together for years." } },
      choices = { { text = "Something else, Ahanu.", next = "BACK" } },
    },
    armory = {
      lines = { { id = "ar_default", text = "Hewa keeps the cloth and I keep the leather, and between us we dress most of the young hunters who come up from Bloodhoof. We're at the foot of the wind rider tower, so whoever lands here sees us first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My mother tanned hides at Bloodhoof, and I learned at her side before I could walk properly." } },
    advice = { { id = "tp_ad", text = "Oil your leather before the rains, not after. Everyone learns that one the wet way." } },
    _none = { { id = "tp_none", text = "I don't know, friend. I mostly know hides, and which hunters lie about them." } },
  },
}

---------------------------------------------------------------------------
-- Bulrug: stable master on the Lower Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "bulrug", id = TODO_NPC("Bulrug"), name = "Bulrug", title = "Stable Master",
  bible = "bibles/bluff_craftsfolk.md", role = "stablemaster", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm", "cheerful" }, values = { "loyal" },
  notices = { "pet" },
  impression = {
    first = "Bulrug keeps the stables on the Lower Rise of Thunder Bluff, a broad, unhurried tauren who talks to the animals more than he talks to their owners. The beasts in his care seem to like it.",
    third = "{name} met Bulrug, the stable master of Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the kodo on your left, she bites when she's bored, and she's always bored." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, and a companion with you. Bring your friend over and let me have a look." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER" },
      text = "{pet} looks hungry, and a little cross with you about it. When did you last feed your friend?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Bulrug, and I keep the stables on the Lower Rise, so if you have a companion who needs rest, I have room. Every beast here is fed before I am, and that has always been my rule." },
      },
      again = { { id = "h_again", text = "What else, friend? The beasts don't mind me talking." } },
      choices = {
        { text = "I'd like to stable my companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you keep the beasts calm up here?", next = "calm" },
        { text = "Which beast here is your favourite?", next = "favourite" },
        { text = "Farewell, Bulrug.", next = "END" },
      },
    },
    calm = {
      lines = { { id = "ca_default", text = "The wind does most of it, because it carries the plains up to the bluff and they smell home. The rest is singing, and I won't sing for you, because the beasts are the only ones who don't laugh." } },
      choices = {
        { text = "Do you ever miss the plains yourself?", next = "plains" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plains = {
      big = true,
      lines = { { id = "pl_default", text = "Every morning, when I look down at Mulgore and see the herds moving. Some of the elders say the bluff made us forget how to wander, and I think on bad mornings they may be right." } },
      choices = {
        { text = "A home on the bluffs keeps the people safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then go wander. The beasts can come with you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    favourite = {
      lines = { { id = "fa_default", text = "The old cat in the far stall, whose hunter never came back from the Barrens. Nobody has claimed her in two years, so I feed her and she lets me, which is as close to friendship as a cat allows." } },
      choices = { { text = "Something else, Bulrug.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I herded kodo for the Bloodhoof before Cairne brought us up here. The stables are only a smaller herd." } },
    _none = { { id = "tp_none", text = "I don't know, but the kodo might. Ask her, if you're brave." } },
  },
}
