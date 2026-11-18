-- Kargath Expeditionary Force: the shaman, the marksman and the grunts who watch Blackrock Mountain for the Warchief. Voice: bibles/kargath_force.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Thunderheart: tauren shaman of the Expeditionary Force; feels the elements disturbed under Blackrock.
P:NPC {
  key = "bl_thunderheart", id = TODO_NPC("Thunderheart"), name = "Thunderheart",
  bible = "bibles/kargath_force.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "calm", "grim" }, values = { "wise", "dutiful", "nature" },
  notices = { "race", "class" },

  impression = {
    first = "Thunderheart is a tauren shaman at Kargath who feels the fire under Blackrock Mountain the way others feel a fever. He speaks slowly and means every word, and his worry sits on him like a heavy cloak.",
    third = "{name} met Thunderheart, a tauren shaman of the Kargath Expeditionary Force who listens to the troubled elements of Blackrock.",
  },

  greetings = {
    { id = "g_default", text = "Sit a moment, young one, if you have it to spare. The ground here is warm, and not with the sun." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the earth is no calmer for it, though I am glad to see you." },
    { id = "g_away", when = { away = 14 }, text = "{away} you have been gone, and the fire below has not slept a single night of it. Sit, and I will tell you what I have felt." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown strong since we last spoke. The Earth Mother sees it, and so do I." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Kargath speaks well of you. The orcs do not praise easily, so I listen when they do." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You hear them too, don't you? The fire under the mountain does not speak; it screams." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the children of the Earth Mother, so far from the grass of Mulgore. These stones must feel harsh beneath your hooves, as they do beneath mine." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken. The elements do not know what to make of you, and I confess I do not either, but you are welcome at my fire." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Thunderheart, of the Kargath Expeditionary Force, and I listen to the elements beneath Blackrock Mountain. They are not well; something below has made them sick with anger, and the anger is spreading." },
        { id = "h_flame", tags = { "news" }, when = { questActive = TODO_QUEST("Disharmony of Flame") },
          text = "Go through the Chasm of Flame into the quarry, and find the foul spirit the Dark Irons have called up. It is called Pyron, and while it lives, the flame cannot rest." },
        { id = "h_flame_done", when = { questDone = TODO_QUEST("Disharmony of Flame"), ["not"] = { questDone = TODO_QUEST("Disharmony of Fire") } },
          text = "Pyron is dead, but his death only lifted a veil, and what I feel behind it is worse. The corruption runs deeper into Blackrock than I had feared." },
        { id = "h_fire", tags = { "news" }, when = { questActive = TODO_QUEST("Disharmony of Fire") },
          text = "Deeper in the mountain, in the Dark Irons' own city, a lord of fire sits bound to their will. Go carefully, for he is far stronger than Pyron was." },
        { id = "h_fire_done", when = { questDone = TODO_QUEST("Disharmony of Fire") },
          text = "The fire is quieter now, though it will never be quiet while the Firelord sleeps in the mountain's heart. You have given the elements a little peace, and that is no small thing." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "You know the songs of the Earth Mother, so you will understand me when I say the earth here has forgotten its own." },
        { id = "h_orc", when = { race = "Orc" },
          text = "The orcs once called on the elements and then forgot them, but the Warchief has called them home. I am glad to stand among those who remember." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind? Speak slowly; the fire does not hurry, and neither should we." },
        { id = "h_again2", text = "Ask what you will. I have time, though the mountain may not." },
        { id = "h_again3", text = "Go on, young one. I am listening, and so is the ground." },
      },
      choices = {
        { text = "What's wrong with the elements here?", next = "sick" },
        { text = "Who is Pyron?", next = "pyron" },
        { text = "Why is a tauren with the Expeditionary Force?", next = "why" },
        { text = "Tell me about the Firelord.", next = "firelord" },
        { text = "I hear the fire too, Thunderheart.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "What's become of the land around Kargath?", next = "land" },
        { text = "Earth Mother keep you.", next = "END" },
      },
    },

    sick = {
      lines = {
        { id = "sk_default", text = "The Dark Irons have bound spirits of fire and forced them into service, and a spirit in chains does not stay sane. Their rage spills out into the stone, and the stone carries it for leagues." },
      },
      choices = {
        { text = "Can the spirits be freed?", next = "sick_free" },
        { text = "Then the binders must be stopped.", next = "sick_binders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sick_free = {
      lines = {
        { id = "sf_default", text = "Some, perhaps, if the bindings are broken. Others are too far gone, and the kindest thing is to return them to the fire they came from, though it grieves me to say it." },
      },
      choices = {
        { text = "Mercy means freeing them, whatever the cost.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A mad spirit must simply be destroyed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sick_binders = {
      lines = {
        { id = "sb_default", text = "Yes, and that is why Kargath sends warriors as well as shamans. But a binder dies and another takes his place, so we must also mend what they have broken, or the land will never heal." },
      },
      choices = {
        { text = "Fight first. Healing can come later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fighting without mending is wasted blood.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    pyron = {
      big = true,
      lines = {
        { id = "py_default", text = "Overmaster Pyron, a foul spirit the Dark Irons summoned and set to guard the quarry beyond the Chasm of Flame. He is the nearest source of the sickness, and the first I would see ended." },
        { id = "py_done", when = { questDone = TODO_QUEST("Disharmony of Flame") },
          text = "Pyron is ended, and I thank you. But his death showed me a deeper wound, and the Dark Irons' own lord of fire sits at the heart of it." },
      },
      choices = {
        { text = "How strong is he?", next = "pyron_strong" },
        { text = "I'll face Pyron.", next = "END", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pyron_strong = {
      lines = {
        { id = "ps_default", text = "Strong enough that I would not send you alone, and I would not go alone myself. Take a healer, and others to strike, and do not stand in his flame longer than you must." },
      },
      choices = {
        { text = "I'll gather companions before I go.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because the Warchief asked for shamans who could feel what the mountain hides, and Cairne said my ears were the best he knew. I did not want to leave Mulgore, but a debt to the Horde is a debt to the people who gave us back our lands." },
      },
      choices = {
        { text = "The Horde is stronger for your coming.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "The tauren owe the orcs nothing now.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Do you miss Mulgore?", next = "why_home" },
      },
    },
    why_home = {
      lines = {
        { id = "wh_default", text = "Every morning, when I wake and there is no grass. I keep a little sweetroot in a pouch, and when the fire's screaming grows too loud, I smell it and remember the wind across the plains." },
      },
      choices = {
        { text = "Mulgore will be there when you return.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    firelord = {
      lines = {
        { id = "fl_default", text = "Ragnaros, the lord of all fire, called up by the Dark Irons long ago and never sent back. He sleeps beneath the mountain, if a thing like him sleeps, and every flame in Blackrock bends toward him." },
      },
      choices = {
        { text = "Can he be defeated?", next = "firelord_beat" },
        { text = "Something else.", next = "BACK", fx = { learn = { "blackrock_depths" } } },
      },
    },
    firelord_beat = {
      lines = {
        { id = "fb_default", text = "I do not know, and I am wary of anyone who says they do. For now I would be content to keep his servants from burning the world down a piece at a time." },
      },
      choices = {
        { text = "Then we'll start with his servants.", next = "BACK", fx = { learn = { "blackrock_depths" } } },
      },
    },

    land = {
      lines = {
        { id = "ld_default", text = "Dry and cracked and full of old anger, from Deathwing's dragons, from the ogres, from the dwarves who dug too deep. The Earth Mother does not forget a wound, and this land is covered in them." },
      },
      choices = {
        { text = "Can it be healed?", next = "land_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    land_heal = {
      lines = {
        { id = "lh_default", text = "In time, if the fire is calmed and the stone is left to rest. Not in my lifetime, perhaps, but a tauren plants for his grandchildren." },
      },
      choices = {
        { text = "That's a patient way to live.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
      },
    },

    xshaman = {
      lines = {
        { id = "xs_default", text = "Then you know why I sleep so poorly. Tell me, when you call on fire here, does it answer you willingly, or does it answer because it must?" },
      },
      choices = {
        { text = "It answers, but I ask gently, never command.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "It answers because I am stronger than its anger.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what the fire and stone tell me, and they speak of old fire under every ridge in this place." } },
    background = { { id = "tp_bg", text = "A shaman of Mulgore, sent east by the Warchief's request and Cairne's word." } },
    advice = { { id = "tp_ad", text = "Listen to the ground before you march over it. It will tell you who has been there first." } },
    blackrock_depths = { { id = "tp_brd", text = "The Dark Irons' city beneath the mountain, where they bind fire and call it craft." } },
    dark_iron = { { id = "tp_di", text = "They called the Firelord and paid for it, and they are paying still." } },
    _none = { { id = "tp_none", text = "I do not know that, young one. The elements do not speak of everything." } },
  },
}

-- Galamav the Marksman: tauren hunter; sends the Horde into Blackrock after Gor'shak and the worg mother Halycon.
P:NPC {
  key = "bl_galamav", id = TODO_NPC("Galamav the Marksman"), name = "Galamav the Marksman",
  bible = "bibles/kargath_force.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "steady", "dry" }, values = { "practical", "brave", "loyal" },
  notices = { "class", "pet", "race" },

  impression = {
    first = "Galamav the Marksman is a tauren hunter at Kargath who watches Blackrock Mountain down the length of a rifle. He is quiet, exact and amused by very little, and he talks about worgs the way a farmer talks about wolves.",
    third = "{name} met Galamav the Marksman, a tauren hunter of the Kargath Expeditionary Force.",
  },

  greetings = {
    { id = "g_default", text = "Stand to the side, if you would. You're between me and the mountain, and I like to keep an eye on it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Good; the mountain's been quiet, and I don't trust it when it's quiet." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone. I counted the days, the way I count everything that leaves Kargath, and I'm glad the count came back." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Your beast walks well on the hot stone; you've trained it to keep its pads off the cinders." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} close near the mountain. The worgs of Blackrock smell another beast from a long way off, and they don't share." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of Mulgore. You'll want to keep your horns low on the ridge; the Dark Iron rifles carry farther than a spear's throw and twice as true." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Galamav, called the Marksman, of the Kargath Expeditionary Force. I watch Blackrock for the Warchief, and when I see something worth killing, I send someone like you to kill it." },
        { id = "h_gorshak", tags = { "news" }, when = { questActive = TODO_QUEST("Commander Gor'shak") },
          text = "Gor'shak is somewhere in the Dark Irons' detention block, if he's alive. Find him, and hear what he has to say before you decide whether to believe it." },
        { id = "h_gorshak_done", when = { questDone = TODO_QUEST("Commander Gor'shak") },
          text = "So Gor'shak lives, and says he let himself be taken to learn the Dark Irons' plans. He's a hard orc, and he may even be telling the truth." },
        { id = "h_pack", tags = { "news" }, when = { questActive = TODO_QUEST("The Pack Mistress") },
          text = "Halycon, the den mother of the Bloodaxe worgs, in the lower halls of the Spire. Mind her pups, and mind her mate Gizrul; he'll come when she calls." },
        { id = "h_pack_done", when = { questDone = TODO_QUEST("The Pack Mistress") },
          text = "You came back from Halycon's den with all your limbs and her mate's blood on you. I've known hunters who'd give a year of their lives for that kill." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and a careful one, I'd guess, if you've walked this far. Let me know when you're ready for the mountain's beasts; they're worth the trouble." },
      },
      again = {
        { id = "h_again", text = "What else? Speak low; sound carries strangely off these rocks." },
        { id = "h_again2", text = "Ask. I'll keep watching the mountain while you do, so don't take it amiss." },
        { id = "h_again3", text = "Go on. My eyes are on the ridge, but my ears are yours." },
      },
      choices = {
        { text = "What do you see from here?", next = "watch" },
        { text = "Who is Commander Gor'shak?", next = "gorshak" },
        { text = "Tell me about the worgs of Blackrock.", next = "worgs" },
        { text = "Why do they call you the Marksman?", next = "name" },
        { text = "What makes a good hunter, Galamav?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "What do you make of Warlord Goretooth?", next = "goretooth" },
        { text = "Good hunting, Galamav.", next = "END" },
      },
    },

    watch = {
      lines = {
        { id = "wt_default", text = "Dark Iron patrols on the high paths, smoke from the forges, orcs of the Blackrock clan coming and going from the Spire. Each one I count is one fewer surprise for Kargath." },
      },
      choices = {
        { text = "Blackrock orcs? Our own blood?", next = "watch_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_orcs = {
      lines = {
        { id = "wo_default", text = "Not anymore. They kept the old ways, the demon's blood and the warlord's whip, and they serve a black dragon now; the Warchief has no use for them, and nor do I." },
      },
      choices = {
        { text = "They chose their side. Show them no mercy.", next = "BACK", fx = { align = { light = -1 }, learn = { "blackrock_spire" } } },
        { text = "Some of them might still be saved.", next = "BACK", fx = { align = { light = 1 }, learn = { "blackrock_spire" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "blackrock_spire" } } },
      },
    },

    gorshak = {
      big = true,
      lines = {
        { id = "gs_default", text = "An orc commander the Dark Irons captured, and we'd counted him dead. Word came that he's held in their prison, and the Horde doesn't leave its own in Dark Iron chains." },
        { id = "gs_done", when = { questDone = TODO_QUEST("Commander Gor'shak") },
          text = "A stubborn old orc who claims he was captured on purpose. I've met orcs who'd do that, and I've met orcs who'd lie about it after, and I can't yet tell which he is." },
      },
      choices = {
        { text = "Why would anyone let himself be captured?", next = "gorshak_why" },
        { text = "I'll find him.", next = "END", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorshak_why = {
      lines = {
        { id = "gw_default", text = "To learn what the Dark Irons are planning, he says, from the inside, where no scout could reach. It's either the bravest thing an orc has done this year, or the best story a captured one could tell." },
      },
      choices = {
        { text = "Take him at his word. He's earned it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Trust nothing until his story's proven.", next = "BACK", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    worgs = {
      lines = {
        { id = "wg_default", text = "The Bloodaxe worgs, bred big and mean in the Spire to run beside the Blackrock orcs. Their den mother is called Halycon, and every worg in that mountain came out of her litters." },
      },
      choices = {
        { text = "Kill the mother, and the pack dies.", next = "worgs_mother" },
        { text = "Can they be tamed?", next = "worgs_tame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgs_mother = {
      lines = {
        { id = "wm_default", text = "Not dies, but dwindles, which is enough. Her mate Gizrul guards her, and her pups are rabid little things that bite at your ankles while she goes for your throat." },
      },
      choices = {
        { text = "Then I'll take her down.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgs_tame = {
      lines = {
        { id = "wt2_default", text = "I've seen a hunter try, once, with a pup he'd stolen. It took his hand off at the wrist when it was grown, and he still talks about it like it was his child." },
      },
      choices = {
        { text = "Every beast can be tamed with patience.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some beasts are meant to stay wild.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    name = {
      lines = {
        { id = "nm_default", text = "Because I don't miss, or not often enough for anyone to notice. An orc in Kargath gave me the name, mocking, after I shot a buzzard off his supper from across the camp, and I decided to keep it." },
      },
      choices = {
        { text = "Where did you learn to shoot?", next = "name_learn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_learn = {
      lines = {
        { id = "nl_default", text = "From a goblin in Ratchet who sold me my first rifle and then charged me a copper a lesson. He was a bad teacher and a worse merchant, but the rifle was good." },
      },
      choices = {
        { text = "A good weapon makes up for a bad teacher.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    goretooth = {
      lines = {
        { id = "gt_default", text = "He's an orc who'd rather be fighting than watching, and the Warchief has set him to watch. He does it well, and he hates every hour of it, and I respect him more for the second than the first." },
      },
      choices = {
        { text = "A leader should bend to his orders.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A warlord wasted on watching. He should attack.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xhunter = {
      lines = {
        { id = "xh_default", text = "Patience, and a good beast, and knowing when not to shoot. Too many young hunters think the kill is the hunt; the kill is only where it ends." },
      },
      choices = {
        { text = "The hunt is the waiting. You're right.", next = "BACK", fx = { align = { order = 1 }, trait = { patient = 1 } } },
        { text = "The kill is all that matters in the end.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what moves on that mountain, and when. Ask." } },
    background = { { id = "tp_bg", text = "A hunter of Mulgore, sent to Kargath because I could see further than the orcs." } },
    advice = { { id = "tp_ad", text = "Count your enemy before you fight him, then count him again." } },
    blackrock_spire = { { id = "tp_brs", text = "The top of the mountain, where the Blackrock orcs and their worgs live under a black dragon's wing." } },
    _none = { { id = "tp_none", text = "Not something I've seen from this ridge. Ask Goretooth; he hears more than I see." } },
  },
}

-- Razal'blade: Darkspear troll of the Expeditionary Force.
P:NPC {
  key = "bl_razalblade", id = TODO_NPC("Razal'blade"), name = "Razal'blade",
  bible = "bibles/kargath_force.md", role = "soldier", tier = "service",
  communities = { "kargath" }, temper = { "wry", "fierce" }, values = { "loyal", "cunning" },
  notices = { "race", "class" },

  impression = {
    first = "Razal'blade is a Darkspear troll of the Kargath Expeditionary Force who misses the sea and says so often. He is quick, sly and loyal to the Warchief, and he thinks the Badlands are a joke the spirits played on him.",
    third = "{name} met Razal'blade, a Darkspear troll serving with the Kargath Expeditionary Force.",
  },

  greetings = {
    { id = "g_default", text = "Ey, mon, you come lookin' for Razal'blade, or you just lost like the rest of us out here?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, eh? Kargath grows on you, mon, like a rash." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! Tell me you smelled the sea on your way here, because I ain't smelled it in a year." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Soft feet and quick hands. You and me, we gonna get along, so long as you keep them hands outta my pack." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Razal'blade, of the Darkspear, an' now of this here Expeditionary Force, which is a big name for a few tents an' a lot of dust. The Warchief say watch the mountain, so we watch the mountain." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A Darkspear here, so far from the islands! Sit, mon, an' tell me how Sen'jin is gettin' on." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Ain't nothin' else to do but talk." },
        { id = "h_again2", text = "Go on, ask, before Goretooth find me somethin' to do." },
      },
      choices = {
        { text = "What do you do here?", next = "job" },
        { text = "How does a Darkspear end up in the Badlands?", next = "darkspear" },
        { text = "What do you think of the mountain?", next = "mountain" },
        { text = "See you around, Razal'blade.", next = "END" },
      },
    },
    job = {
      lines = {
        { id = "jb_default", text = "I go up the ridge at night, close as I dare, an' I see what the Dark Irons doin'. Mostly they doin' forge work an' shoutin', but sometimes they doin' somethin' worse, an' then Kargath want to know." },
      },
      choices = {
        { text = "Scouting at night takes courage.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "What's the worst you've seen?", next = "job_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    job_worst = {
      lines = {
        { id = "jw_default", text = "A line of slaves goin' into the mountain, mon, an' none comin' out. I count them goin' in, an' I stop countin' after a while, 'cause the number don't help nobody." },
      },
      choices = {
        { text = "Someone should go in after them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A scout's job is to count, not to grieve.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkspear = {
      lines = {
        { id = "dk_default", text = "Same way as anyone, mon: Thrall ask, an' Vol'jin say go. Darkspear owe the Warchief our lives from the islands, an' a debt like that you pay where he send you." },
      },
      choices = {
        { text = "A debt honoured is a people honoured.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No debt should send you this far from home.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mountain = {
      lines = {
        { id = "mt_default", text = "Big an' hot an' angry, an' full of things that want us dead. The spirits don't like it neither; my mojo go cold every time I walk too close." },
      },
      choices = {
        { text = "Your mojo goes cold? What does that mean?", next = "mountain_mojo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mountain_mojo = {
      lines = {
        { id = "mm_default", text = "Mean the loa ain't watchin' there, mon, or they don't want to. A troll learn to listen when the loa go quiet, 'cause that's usually when somethin' bad comin'." },
      },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darkspear from the islands, then Durotar, now here. Next stop, who knows, mon." } },
    advice = { { id = "tp_ad", text = "Don't walk the ridge in daylight, an' don't trust a quiet mountain." } },
    _none = { { id = "tp_none", text = "Never heard of it, mon. Ask somebody who sleep better than me." } },
  },
}

-- Grunt Gargal: big orc grunt of the Expeditionary Force.
P:NPC {
  key = "bl_gargal", id = TODO_NPC("Grunt Gargal"), name = "Grunt Gargal",
  bible = "bibles/kargath_force.md", role = "soldier", tier = "service",
  communities = { "kargath" }, temper = { "gruff", "steady" }, values = { "loyal", "brave", "protective" },
  notices = { "class", "race" },

  impression = {
    first = "Grunt Gargal is a huge orc with a huge shield, and he stands in front of things for a living. He doesn't say much, but what he says comes out like a wall coming down.",
    third = "{name} met Grunt Gargal, a towering orc grunt of the Kargath Expeditionary Force.",
  },

  greetings = {
    { id = "g_default", text = "Lok'tar. You stand behind me if anything comes over that ridge, understand?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and still standing, which is good." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Let me see your shield arm; if it's not sore, you're not using it right." },
    { id = "n_small", cat = "race", when = { race = { "Troll", "Scourge" } },
      text = "You're thin. That's fine; you can stand behind me, and there's plenty of room back there." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gargal, grunt of Kargath. When the Dark Irons come, I stand in front, and they hit my shield instead of the ones behind me, and that's my whole job." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere." },
        { id = "h_again2", text = "Speak. I'm listening, but my shield's facing the ridge." },
      },
      choices = {
        { text = "Tell me about your shield.", next = "shield" },
        { text = "What do you fight for, Gargal?", next = "fight" },
        { text = "Who are you protecting?", next = "protect" },
        { text = "Lok'tar, Gargal.", next = "END" },
      },
    },
    shield = {
      lines = {
        { id = "sh_default", text = "Dark Iron steel, taken off a Dark Iron who didn't need it anymore. It's ugly and it's heavy, and it's turned more blows than any shield in Kargath." },
      },
      choices = {
        { text = "Fitting, to use their steel against them.", next = "BACK", fx = { affinity = 1 } },
        { text = "How many blows has it turned?", next = "shield_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shield_count = {
      lines = {
        { id = "sc_default", text = "I stopped counting after a hundred, when I ran out of scratches to count with. Now I count the dents, and there are fewer of those, because the dents are from the big ones." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    fight = {
      lines = {
        { id = "fg_default", text = "For the Warchief, and for the grunts on either side of me. I was a slave in the camps once; now I choose who I stand in front of." },
      },
      choices = {
        { text = "Fighting for comrades is the truest cause.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Fight for yourself first. Comrades come and go.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    protect = {
      lines = {
        { id = "pr_default", text = "Amakkar, mostly, who runs in too fast, and the shaman, who walks in too slow. Someone has to stand between them and the axe, and it might as well be the biggest." },
      },
      choices = {
        { text = "Who's Amakkar?", next = "protect_amakkar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    protect_amakkar = {
      lines = {
        { id = "pa_default", text = "An initiate, quick with a knife and quicker with his mouth. He'll be a good fighter if he lives, and he'll live if I'm in front of him." },
      },
      choices = {
        { text = "The young need someone to shield them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let him learn by bleeding. That's how orcs learn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Internment camp, then the Warchief's army, then here. I've carried a shield the whole way." } },
    advice = { { id = "tp_ad", text = "Keep your shield up. Your arm gets tired before your enemy does, so train the arm." } },
    _none = { { id = "tp_none", text = "I don't know that. Ask someone who talks more than I do." } },
  },
}

-- Initiate Amakkar: young orc rogue of the Expeditionary Force.
P:NPC {
  key = "bl_amakkar", id = TODO_NPC("Initiate Amakkar"), name = "Initiate Amakkar",
  bible = "bibles/kargath_force.md", role = "soldier", tier = "service",
  communities = { "kargath" }, temper = { "eager", "sharp" }, values = { "ambitious", "cunning" },
  notices = { "class", "level" },

  impression = {
    first = "Initiate Amakkar is a young orc with a quick knife and a quicker mouth, keen to prove he's more than an initiate. He talks as if Blackrock Mountain were a door he means to kick down personally.",
    third = "{name} met Initiate Amakkar, a young and restless orc of the Kargath Expeditionary Force.",
  },

  greetings = {
    { id = "g_default", text = "Another one come to look at the mountain? Look all you like; I'm the one who's going in it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you go up the mountain yet? I'll go with you, if Goretooth ever lets me." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue! Show me how you hold your knife. No, really, I want to know." },
    { id = "n_vet", cat = "level", when = { minLevel = 55 },
      text = "You've been in the mountain already, haven't you? I can see it on your armour, all the scorch marks." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Amakkar, initiate, though not for long, if I get my chance. Every orc in Kargath has been inside that mountain but me, and I'm sick of hearing about it." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue! Teach me something, anything, so I can show Gargal I'm more than a mouth." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quick; Gargal says I talk too much, and he's watching." },
        { id = "h_again2", text = "Go on. I've got nothing to do but sharpen this, and it's already sharp." },
      },
      choices = {
        { text = "Why are you so keen to get inside?", next = "keen" },
        { text = "What's an initiate?", next = "initiate" },
        { text = "Gargal says he stands in front of you.", next = "gargal", when = { heardLine = "bl_gargal.pa_default" } },
        { text = "Patience, Amakkar. Your time will come.", next = "patience" },
        { text = "Good luck, Amakkar.", next = "END" },
      },
    },
    keen = {
      lines = {
        { id = "kn_default", text = "Because that's where the honour is, and the loot, and the stories. My father fought at Blackrock in the old war, and I want a story of my own to tell him." },
      },
      choices = {
        { text = "Glory is worth chasing while you're young.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Glory gets young orcs killed. Wait for orders.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your father fought at Blackrock?", next = "keen_father" },
      },
    },
    keen_father = {
      lines = {
        { id = "kf_default", text = "In the Horde of Doomhammer, when the mountain was ours. He doesn't talk about it much, which means it was either very good or very bad, and I mean to find out which." },
      },
      choices = {
        { text = "Some stories are best left untold.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    initiate = {
      lines = {
        { id = "in_default", text = "The one who carries the water and keeps the watch fires going, and gets told 'next time' every time. It means I'm in the Force, but nobody trusts me with anything sharp, except this." },
      },
      choices = {
        { text = "Everyone starts carrying water.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Don't wait to be trusted. Take your chance.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gargal = {
      lines = {
        { id = "gg_default", text = "He said that? The big lump. He says I run in too fast, and I say he walks in too slow, and somehow we both come back. I'll never tell him I'm glad he's there, so don't you either." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    patience = {
      lines = {
        { id = "pt_default", text = "Everyone says that, and they all say it the same way, like they've been saving it up. I'll be patient when I'm old and grey, and not a day before." },
      },
      choices = {
        { text = "Then at least be careful.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in the camps, raised in Durotar, sent out here to fetch water. Glorious." } },
    advice = { { id = "tp_ad", text = "Keep your knife sharp. You never know when someone's going to finally let you use it." } },
    _none = { { id = "tp_none", text = "No idea. Ask Gargal; he doesn't know either, but he'll take longer to say so." } },
  },
}
