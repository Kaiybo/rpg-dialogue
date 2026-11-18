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
        { text = "Then I'll end it cleanly, as a mercy.", next = "BACK", reply = "Then you understand what the helm is for, and it will sit well on you. Go quickly, and let her rest under the Earth Mother at last.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A kill is a kill. I'll do it for the helm.", next = "BACK", reply = "A kill is never only a kill, young one, and the helm will remember it even if you don't. Bring me the horn, but think on what I said while you ride.", fx = { align = { light = -1 } } },
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
        { text = "Tell me about learning the forge in Durotar.", next = "durotar" },
        { text = "What should a new smith make first?", next = "first" },
        { text = "Should I learn armour or weapons?", next = "special", when = { profession = "Blacksmithing" } },
        { text = "An orc taught you? Then you know the old ways.", next = "orc_forge", when = { race = "Orc" } },
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
        { text = "The old ways matter. Keep them.", next = "BACK", reply = "I will, and my apprentices will grumble about it as they always do. A little grumbling never hurt the old ways, so long as the thanks still get said.", fx = { align = { order = 1 } } },
        { text = "New skills keep the people strong. Let them change.", next = "BACK", reply = "Change, yes, but not forgetting, and those are different beasts. A smith who forgets where the iron came from soon forgets who he makes it for.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orm = {
      lines = { { id = "or_default", text = "I am, and he makes the finest helms on the bluffs, and he will tell you so if you wait long enough. He only makes them for the worthy, while I teach anyone, and we both think the other is foolish for it." } },
      choices = {
        { text = "Which of you is right?", next = "orm_right" },
        { text = "Something else, Karn.", next = "BACK" },
      },
    },
    orm_right = {
      lines = { { id = "rr_default", text = "Both of us, which is the trouble with brothers. A helm from Orm will save a great warrior's life and a lesson from me will save a hundred ordinary ones, and neither of us will ever admit the other has a point." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    durotar = {
      lines = { { id = "du_default", text = "I went down to Orgrimmar when the orcs had barely finished building it, and an old orc smith took me on because I could carry twice what his apprentices could. He swore at me in Orcish for a full season, and at first I learned more of the language than the craft." } },
      choices = {
        { text = "What do you make of the orcs?", next = "durotar_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    durotar_orcs = {
      lines = { { id = "do_default", text = "They're loud and proud and they burn their bread, and they came to us as friends when the centaur were burning our camps. Thrall's people taught us iron, and we taught them to share a meal without fighting over it, mostly." } },
      choices = {
        { text = "Something else, Karn.", next = "BACK" },
        { text = "Farewell, Karn.", next = "END" },
      },
    },
    first = {
      lines = { { id = "fi_default", text = "A rough sharpening stone and a copper chain belt, as every smith does, and then a hundred more until your hands know the work better than your head. There's no shortcut through the anvil, and anyone who sells you one is lying." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    special = {
      lines = { { id = "sp_default", text = "Not yet, and not for a long while. Learn everything, the dull parts most of all, and when your hands are ready the choice will make itself, as it did for Orm and his helms." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orc_forge = {
      lines = { { id = "of_default", text = "I know the loud ways, which I suspect are the same thing. Your people beat iron the way they fight, all heart and no hesitation, and I've tried to keep a little of that and leave the rest by the water trough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    thrall = { { id = "tp_th", text = "The Warchief brought iron to Mulgore and asked only friendship for it. I've thought well of him ever since." } },
    earth_mother = { { id = "tp_em", text = "She gave us the ore. My students thank her for it before they melt a single nugget." } },
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
        { text = "Any advice for curing hides?", next = "curing", when = { profession = "Leatherworking" } },
        { text = "My mother tanned hides too.", next = "tauren_mother", when = { race = "Tauren" } },
        { text = "Does it trouble you, a druid seeing your hides?", next = "druid", when = { class = "DRUID" } },
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
        { text = "The old way is better. Hunt what you wear.", next = "BACK", reply = "Then you can tell the hunters to bring me more, and I'll stitch whatever they carry in. My knees and I will stay here and thank the beasts from a stool.", fx = { align = { order = 1 } } },
        { text = "Trade lets everyone do what they do best.", next = "BACK", reply = "That's how I see it too, and it keeps my old knees off the plains. The hunter hunts, I cut and stitch, and the beast is thanked twice over.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jahan = {
      lines = { { id = "ja_default", text = "Jahan Hawkwing has a stall at the Crossroads, where every traveller in the Barrens passes sooner or later. I'm a good stitcher and a poor seller, and Jahan is the reverse, so we've worked together for years." } },
      choices = {
        { text = "How did the two of you meet?", next = "jahan_meet" },
        { text = "Something else, Ahanu.", next = "BACK" },
      },
    },
    jahan_meet = {
      lines = { { id = "jm_default", text = "He came up the lifts years ago with a cart and a terrible sales pitch, and I bought his whole load of thread out of pity. Then he sold my first jerkins at the Crossroads for twice what I'd have asked, and I stopped pitying him." } },
      choices = {
        { text = "What's the Crossroads like?", next = "jahan_crossroads" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jahan_crossroads = {
      lines = { { id = "jc_default", text = "Loud and dusty and full of orcs arguing over the price of everything, or so Jahan tells me. I went once, and the Razormane were raiding the road that week, so I came straight home and haven't gone back since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    curing = {
      lines = { { id = "cu_default", text = "Salt them the same day, stretch them in the shade and never in the sun, and don't be tempted to hurry. A hide cured in a rush cracks the first winter, and then you've wasted the beast and your own work besides." } },
      choices = { { text = "Thank you, Ahanu.", next = "BACK" } },
    },
    tauren_mother = {
      lines = { { id = "tm_default", text = "Then you'll know the smell of the tanning pits in your sleep, as I do. Give her my greetings, and tell her an old leatherworker on the bluff says she raised you well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Sometimes I wonder what a druid thinks, seeing a bear hide on my table. I'd like to believe the bear wouldn't mind, since nothing of it is wasted, though I admit I've never been brave enough to ask one of you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    armory = {
      lines = { { id = "ar_default", text = "Hewa keeps the cloth and I keep the leather, and between us we dress most of the young hunters who come up from Bloodhoof. We're at the foot of the wind rider tower, so whoever lands here sees us first." } },
      choices = {
        { text = "Tell me about Hewa.", next = "hewa" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hewa = {
      lines = { { id = "hw_default", text = "Hewa runs the cloth side and keeps the coin, because he can count and I can't be trusted to. He tells me I give away too much, and he's right, but he's never turned away a young hunter in torn leathers either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    quilboar = { { id = "tp_qb", text = "The Razormane on the Barrens road ruin more good hides in a season than I can mend in a year." } },
    earth_mother = { { id = "tp_em", text = "Every hide is her gift, given through the beast. I thank them both when I cut." } },
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
        { text = "What beasts do the hunters bring you?", next = "beasts" },
        { text = "What songs do you sing to them?", next = "songs" },
        { text = "My companion doesn't like the stables.", next = "pet_stable", when = { class = "HUNTER" } },
        { text = "Would you stable a raptor?", next = "raptor", when = { race = "Troll" } },
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
        { text = "A home on the bluffs keeps the people safe.", next = "BACK", reply = "Safe, yes, and I'm grateful for it every winter when the wind comes off the plains. Still, safety and freedom don't always graze the same grass.", fx = { align = { order = 1 } } },
        { text = "Then go wander. The beasts can come with you.", next = "BACK", reply = "Ha, the kodo would like that more than you know, and so might I. But somebody has to keep the stables, and the plains will still be there tomorrow.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    favourite = {
      lines = { { id = "fa_default", text = "The old cat in the far stall, whose hunter never came back from the Barrens. Nobody has claimed her in two years, so I feed her and she lets me, which is as close to friendship as a cat allows." } },
      choices = {
        { text = "Does she have a name?", next = "cat_name" },
        { text = "Something else, Bulrug.", next = "BACK" },
      },
    },
    cat_name = {
      lines = { { id = "cn_default", text = "Her hunter called her Dusk, and I've kept it, because it would be rude to change it while he might still come back. Kary Thunderhorn says he won't, and I know she's right, but I keep the name all the same." } },
      choices = {
        { text = "What happened to her hunter?", next = "cat_hunter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cat_hunter = {
      lines = { { id = "ch_default", text = "He stabled her here, went south past Camp Taurajo after a Kolkar raiding party, and never came home. She still watches the lift every evening, as if he might step off it." } },
      choices = {
        { text = "That's a sad story, Bulrug.", next = "BACK" },
        { text = "Farewell, Bulrug.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "be_default", text = "Cats and wolves and boars mostly, a bear now and then, and once a troll's bat that hung from my rafters and screamed all night. The bat turned out to be the politest guest I've had, once she'd eaten." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    songs = {
      lines = { { id = "so_default", text = "Old herding songs, the ones my grandfather sang to the kodo on the long walks before we had a home. I won't sing them for you, but they're mostly about rain and grass and how far it is to the next water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pet_stable = {
      lines = { { id = "ps_default", text = "Few do, the first time. Leave something of yours in the stall with them, a glove or an old cloak, and they'll settle, because then they'll know you're coming back." } },
      choices = { { text = "I'll try that.", next = "BACK" } },
    },
    raptor = {
      lines = { { id = "ra_default", text = "I would, and I have, and I'll thank you to keep it well away from the kodo. Darkspear raptors are clever beasts, and the last one learned to open the stall latch on her second night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    centaur = { { id = "tp_ce", text = "The Kolkar have taken more than one hunter from these stables. The beasts remember, even when we try not to." } },
    earth_mother = { { id = "tp_em", text = "She made the beasts gentle and the wind kind, and between the two of them my work is easy." } },
    background = { { id = "tp_bg", text = "I herded kodo for the Bloodhoof before Cairne brought us up here. The stables are only a smaller herd." } },
    _none = { { id = "tp_none", text = "I don't know, but the kodo might. Ask her, if you're brave." } },
  },
}
