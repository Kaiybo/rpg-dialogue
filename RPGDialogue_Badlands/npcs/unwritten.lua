-- Badlands: folk a roster scan found with no conversation yet. Voice: bibles/badlands_wanderers.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC = P.TODO_NPC

-- Thorkaf Dragoneye: the orc dragonscale leatherworker of Dustwind Gulch.
P:NPC {
  key = "bad_thorkaf_dragoneye", id = TODO_NPC("Thorkaf Dragoneye"), name = "Thorkaf Dragoneye", title = "Dragonscale Leatherworking Trainer", gender = "male",
  bible = "bibles/badlands_wanderers.md", role = "trainer", tier = "service",
  communities = { "badlands" }, temper = { "gruff", "proud" }, values = { "craft", "strength" },
  notices = { "craft", "race" },
  impression = {
    first = "Thorkaf Dragoneye keeps a lonely camp in Dustwind Gulch, scraping whelp hides beside a fire. He looked at my armor before he looked at my face.",
    third = "{name} met Thorkaf Dragoneye, the orc who teaches dragonscale leatherworking in the Badlands.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return to Dustwind Gulch, and you've learned the whelps' ways, I see. Sit by my fire, friend, and I'll show you a hide worth seeing." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll teach you, because the craft is older than my dislike, but I've no warmth to spare for you." },
    { id = "g_default", text = "You walked a long way into dragon country, stranger, so either you are lost or you want to learn something worth the walk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with all your limbs. The whelps must be getting slow, or you are getting quick." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Your hands smell of tanning salt, so you already know the craft. Good, because I do not teach beginners how to hold a knife." },
    { id = "n_ally", cat = "race", when = { faction = "Alliance" },
      text = "I teach the Horde, and you are not the Horde, so do not waste my fire. Talk if you must, but keep your hands where I can see them." },
  },
  start = "hello",
  nodes = {
    ycamps = {
      lines = { { id = "ycamps_x", text = "Grey. Everything was grey, the walls, the food, our skin. The humans gave us knives only to tan the hides of cattle we were not allowed to eat. I learned the work there. I hated every hide. Now I love it. Strange." } },
      choices = {
        { text = "A dragonscale should be earned by the hunter who wears it.", next = "BACK", reply = "So it should. A hide bought from a trader never fits right, and every leatherworker knows it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Buy the scales cheap from others. Why risk the whelps yourself?", next = "BACK", reply = "Because the one who bought it cheap will die in it, and I'll not have my craft blamed.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you hate the humans still?", next = "yhate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhate = {
      lines = { { id = "yhate_x", text = "Thrall says we must not hate, and Thrall was a slave longer than I. But some nights, by the fire, I remember the guard who broke my brother's arm. Should I forgive, as Thrall says, or remember, as my blood says?" } },
      choices = {
        { text = "Forgive. Hatred is another camp.", next = "BACK", reply = "Hm. Another camp. I will remember those words.", fx = { align = { light = 1 } } },
        { text = "Remember. Your brother deserves it.", next = "BACK", reply = "Aye. My brother's arm never healed straight. I will remember.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygrown = {
      lines = { { id = "ygrown_x", text = "Once, at a distance, flying over Lethlor Ravine. Its shadow covered my whole camp. I lay in the dust until it passed. I am brave, stranger, not stupid." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yfamily = {
      lines = { { id = "yfamily_x", text = "A brother, Garthok, who works the forges in Orgrimmar. He sends me a letter every winter and complains about the heat. I send him a whelp scale and complain about the dust. That is our way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Thorkaf Dragoneye, and I work the hides of dragons, which is the hardest leather in the world to cut and the best in the world to wear. The black flight's whelps nest all over these canyons, so I am never short of material." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "A tauren, in dragon country. Your people know hides. Sit, and see what a black whelp's scale does under the knife." },
      },
      again = {
        { id = "h_again", text = "What else, then? The fire will not wait forever." },
        { id = "h_again2", text = "Speak, and be quick about it." },
      },
      choices = {
        { text = "How did you earn the name Dragoneye?", next = "name" },
        { text = "Hunting whelps for leather sounds dangerous work.", next = "whelps" },
        { text = "Why camp out here instead of Kargath?", next = "camp" },
        { text = "What were the internment camps like?", next = "ycamps" },
        { text = "Have you ever met a grown dragon?", next = "ygrown" },
        { text = "Do you have any family?", next = "yfamily" },
        { text = "Teach me what you know.", next = "END" },
      },
    },
    name = {
      lines = { { id = "nm_default", text = "I learned to read the scales the way a shaman reads the wind, and I can tell you which flight a hide came from by the light that falls through it. The grunts said I must have a dragon's eye, and the name stuck to me like tar." } },
      choices = {
        { text = "So you can read any dragon's scales?", next = "flights" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flights = {
      lines = { { id = "fl_default", text = "Black scale drinks the heat and gives it back slowly, and that is what you want against fire. Blue and green are rarer out here, and I trade for them when a caravan is foolish enough to come this far." } },
      choices = { { text = "Something else, Thorkaf.", next = "BACK" } },
    },
    whelps = {
      lines = { { id = "w_default", text = "Dangerous, yes, and that is why the armor is worth wearing. A whelp is small, but its mother is not, and the black dragons do not forgive a hunter who gets careless near Lethlor Ravine." } },
      choices = {
        { text = "Killing young dragons is a hard thing to justify.", next = "BACK", reply = "Hard? These are the brood of Deathwing, and they would burn Kargath to ash given the chance. I will not weep for them.", fx = { align = { light = 1 } } },
        { text = "Deathwing's brood deserves no mercy. Skin them all.", next = "BACK", reply = "Now you speak like an orc. Bring me hides and I will show you what they are good for.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Kargath is full of shouting and smoke, and a tanner needs quiet and clean water, which is rare enough in the Badlands. Out here the gulch keeps the wind off my racks, and nobody steals my hides but the vultures." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    lethlor_ravine = { { id = "ytp_lr", text = "The ravine is where the black dragons nest. Go carefully, or not at all." } },
    internment_camps = { { id = "ytp_ic", text = "The camps taught me leather and patience. I keep the leather." } },
    background = { { id = "tp_bg", text = "I am an orc of the Horde, and I have worked hides since the internment camps, where it was the only work they let us do with knives." } },
    _none = { { id = "tp_none", text = "I know leather and dragons, stranger. Ask someone in Kargath about the rest." } },
  },
}

---------------------------------------------------------------------------
-- High Executioner Nuzrak: Kargath's headsman, who keeps the Horde's grudge against the Dark Irons.
---------------------------------------------------------------------------
P:NPC {
  key = "bad_nuzrak", id = 9538, name = "High Executioner Nuzrak", role = "guard", tier = "service",
  temper = { "grim", "stern" }, values = { "honor", "duty" },
  notices = { "faction" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back, and Kargath remembers your deeds. Stand easy, {class}; my axe has no business with you today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. My axe remembers faces, and yours is one I would not mind seeing on the block." },
    { id = "g_default", text = "You stand before the executioner of Kargath. Speak plainly, for I have little patience for wasted words." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "An Alliance face, this close to my axe. Speak your business and pray it is a good one." },
  },
  start = "hello",
  nodes = {
    yold = {
      lines = { { id = "yold_x", text = "I was a grunt under Kargath Bladefist himself, in the days of the Second War. He wore a blade where his hand had been. We named this place for him. Some say he went back through the Dark Portal before it closed, and no word has come since. His name on our gate reminds us who we were." } },
      choices = {
        { text = "The Warlord's justice is harsh, but Kargath needs it.", next = "BACK", reply = "It does. Without the axe, this outpost would be overrun by its own grunts within a season.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "A true orc settles his quarrels himself, not by your block.", next = "BACK", reply = "So did the old Horde, and we buried half of it. Bring your quarrels to me.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Did any of his warriors stay behind?", next = "ybladefist" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybladefist = {
      lines = { { id = "ybladefist_x", text = "Some. A few of them went into the mountain with Rend and wear Blackrock colours now. One was my shield-brother. If he walked through our gate tomorrow, should I take his head, or hear him first?" } },
      choices = {
        { text = "Take his head. A traitor is a traitor.", next = "BACK", reply = "Aye. That is the law of Kargath, and I am its hand.", fx = { align = { order = 1 } } },
        { text = "Hear him first. He was your chieftain once.", next = "BACK", reply = "Hm. Perhaps. Then I would take his head anyway, but I would listen first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yweigh = {
      lines = { { id = "yweigh_x", text = "Each head is a name. I keep them all. When I sleep, I count them, as a shaman counts the stars. It does not weigh, but it does not go away, and that is the same thing in the end." } },
      choices = {
        { text = "How do you tell a spy from a deserter?", next = "ywatch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywatch = {
      lines = { { id = "ywatch_x", text = "The Dark Irons send spies dressed as traders, and the Blackrock send orcs who claim to have deserted. I look at their eyes. A true deserter is ashamed. A spy is only careful." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Nuzrak, and when the Horde judges a traitor in the Badlands, it is my axe that carries out the sentence. Kargath watches the Blackrock and the Dark Irons both, and my work is never finished." },
        { id = "yh_orc", when = { race = "Orc" }, text = "I am Nuzrak, executioner of Kargath. An orc, good. You know the weight of blood, then. Speak plainly, brother, and I will answer the same." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "I am Nuzrak, executioner of Kargath. A tauren, far from the plains. The Badlands will not be kind to your hooves, but my axe will not trouble you unless you give it cause." },
      },
      again = { { id = "h_again", text = "What else, {class}?" } },
      choices = {
        { text = "Whom have you executed?", next = "traitors" },
        { text = "What do you know of the Dark Irons below?", next = "darkiron" },
        { text = "How did you become executioner?", next = "xbecome" },
        { text = "Have you ever spared a traitor?", next = "xspare" },
        { text = "What is Kargath to you?", next = "xkargath" },
        { text = "I'm a warrior. Is your axe ever heavy?", next = "BACK", when = { class = "WARRIOR" }, reply = "Always heavy. A warrior who forgets the weight of his axe is no warrior. Remember that, when you swing yours." },
        { text = "Do you remember the old Horde?", next = "yold" },
        { text = "Does the work weigh on you?", next = "yweigh" },
        { text = "Lok'tar.", next = "END", when = { faction = "Horde" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    traitors = {
      lines = { { id = "t_default", text = "Orcs who forgot their blood and sold themselves to the Blackrock clan, mostly. Grark Lorkrub was one. He sold our plans to the Blackrock, and when he was dragged to the Searing Gorge in chains, my axe was waiting." } },
      choices = {
        { text = "Traitors deserve the axe.", next = "BACK", reply = "They do. A Horde that forgives betrayal will not be a Horde for long.", fx = { align = { order = 1 } } },
        { text = "Perhaps they had their reasons.", next = "BACK", reply = "Every traitor has reasons. That is why we do not listen to them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkiron = {
      lines = { { id = "d_default", text = "They build their city beneath the mountain and bow to a fire lord, and the Blackrock orcs above them bow to a dragon. If there is a nest of serpents in all of Azeroth, it is that peak." } },
      choices = {
        { text = "Then it should be cleansed.", next = "BACK", reply = "Yes. Go down there, and come back with the proof, and I will remember your name." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbecome = {
      lines = {
        { id = "xxbecome_0", text = "The warlord asked who among us could swing true and never miss. I said nothing, and the others pointed at me. I have not missed since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xspare = {
      lines = {
        { id = "xxspare_0", text = "Once. A young grunt, caught carrying a Blackrock message he could not read. Some said I should have killed him anyway. What would you have done?" },
      },
      choices = {
        { text = "Spare him. He didn't know the message.", next = "BACK", reply = "That is what I decided. He serves well now.", fx = { align = { order = -1 } } },
        { text = "Kill him. Ignorance excuses nothing.", next = "BACK", reply = "Hard words. I have heard them before, from the warlord.", fx = { align = { order = 1 } } },
      },
    },
    xkargath = {
      lines = {
        { id = "xxkargath_0", text = "A stronghold in a wasteland, named for a chieftain of the old Horde. We hold it against the Dark Irons and the Blackrock both, and we remember who betrayed us." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    kargath_bladefist = { { id = "ytp_kb", text = "Kargath Bladefist led the Shattered Hand. He went back through the Portal, and his name stays on our gate." } },
    badlands = { { id = "ytp_bl", text = "The Badlands are dry and cruel, like the Blackrock. We hold them anyway." } },
    dark_irons = { { id = "tp_xdark_irons", text = "They live below the mountain and serve a fire lord. They will answer for it." } },
    blackrock = { { id = "tp_xblackrock", text = "Orcs who chose the dragon over the Horde." } },
    _none = { { id = "tp_none", text = "I am an executioner, not a scholar. Ask someone with softer hands." } },
  },
}
