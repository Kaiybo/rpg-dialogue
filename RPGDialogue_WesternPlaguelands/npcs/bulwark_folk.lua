-- The Bulwark's other residents: Argent Quartermaster Hasana, the troll who keeps the Dawn's stores on the
-- Horde side of the wall; Bardu Sharpeye, a tauren bound for Hearthglen; Werg Thickblade, the orc who sells
-- leather to anyone who'll stop long enough to buy. Voice: bibles/bulwark_folk.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hasana", id = TODO_NPC("Argent Quartermaster Hasana"), name = "Argent Quartermaster Hasana",
  title = "The Argent Dawn",
  bible = "bibles/bulwark_folk.md", role = "vendor", tier = "service",
  communities = { "bulwark", "argent_dawn" }, temper = { "cheerful", "shrewd" }, values = { "dutiful", "practical" },
  notices = { "status", "race" },

  impression = {
    first = "Argent Quartermaster Hasana keeps the Dawn's stores at the Bulwark and laughs more than anyone else behind that wall. She sells only to those the Dawn trusts, and she says it with a grin that makes it hard to argue.",
    third = "{name} met Argent Quartermaster Hasana, the troll who keeps the Argent Dawn's stores at the Bulwark.",
  },

  greetings = {
    { id = "g_default", text = "Ey, welcome to de Dawn's stores, mon. Everyting here be for de Dawn's friends, so tell me, be you one?" },
    { id = "g_stranger", when = { reputation = { faction = "Argent Dawn", max = "neutral" } }, text = "De Dawn don't know you yet, mon. Go see Garush, bring him some scourgestones, an' den come back to Hasana." },
    { id = "g_honored", when = { reputation = { faction = "Argent Dawn", min = "honored" } }, text = "Dere be one de officers talk about! Come, come, Hasana got good tings for you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, mon. De dead still walkin', an' you still breathin', so dat be a good day." },
  },

  notice = {
    { id = "n_revered", cat = "status", when = { reputation = { faction = "Argent Dawn", min = "revered" } },
      text = "Revered by de Dawn, eh? Den we should be talkin' about de mantles, mon." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, so far from de islands! Dis wall be cold for de likes of us, ya?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hasana, quartermaster for de Argent Dawn here at de Bulwark. Bandages, holy water, an' all de little tings dat keep a body alive, for dem dat de Dawn trust." },
        { id = "h_mantle", when = { reputation = { faction = "Argent Dawn", min = "revered" } },
          text = "You revered among us now, mon, so I can sell you de mantles of de Dawn, if you bring me ten valor tokens first. De tokens be your tribute, an' de tribute show you mean it." },
        { id = "h_mantle_done", when = { questDone = TODO_QUEST("Mantles of the Dawn") },
          text = "Your name be in de book now, mon, an' any quartermaster of de Dawn sell you a mantle while you keep your standin'." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "An Alliance face at de Bulwark! De Forsaken be twitchy about dat, so you best keep close to me an' Garush, mon." },
      },
      again = { { id = "h_again", text = "What else, mon? Hasana got time for you." } },
      choices = {
        { text = "Show me your stores.", next = "BUSINESS" },
        { text = "Why does a troll serve the Argent Dawn?", next = "why" },
        { text = "How do the Forsaken treat the Dawn here?", next = "forsaken" },
        { text = "Tell me about these mantles.", next = "mantles", when = { reputation = { faction = "Argent Dawn", min = "honored" } } },
        { text = "Which of your wares sells best?", next = "wares" },
        { text = "Farewell, Hasana.", next = "END" },
      },
    },

    why = {
      lines = { { id = "wy_default", text = "Because de Scourge don't care what tusks you got, mon, it eat everybody de same. De Dawn be de only ones fightin' it for everybody, an' Hasana like dat kind of fight." } },
      choices = {
        { text = "Does your tribe mind?", next = "why_tribe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_tribe = {
      big = true,
      lines = { { id = "wt_default", text = "Some say I should be fightin' for de Horde first an' de Dawn second. I say de Horde need a world to live in, an' dat come first, mon." } },
      choices = {
        { text = "You're right. The world first, banners second.", next = "BACK", reply = "Dat's it, mon, you see it plain. A banner don't mean much if dere's no ground left to plant it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Your tribe has a point. Loyalty starts at home.", next = "BACK", reply = "Loyalty start at home, sure, but home don't last long wit' de Scourge at de door. I'll keep my post here, mon.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },

    forsaken = {
      big = true,
      lines = { { id = "fs_default", text = "Dey be cold, but dey be fair, an' dey fight harder dan anybody on dis wall, because dey know what de Scourge do to you. De apothecaries, though, I keep my stores far from dem, mon." } },
      choices = {
        { text = "Wise. The apothecaries can't be trusted.", next = "BACK", reply = "Not much, mon, an' I'll keep my stores well away from dem. You do de same, eh?", fx = { align = { light = 1 } } },
        { text = "The apothecaries' work keeps this wall standing.", next = "BACK", reply = "Maybe it do, mon, but I still don't want dem near my crates. Wall can stand a little further from de vials.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mantles = {
      lines = { { id = "mn_default", text = "Mantles to put on your shoulders, mon, against fire, frost, shadow, nature an' de arcane. Revered with de Dawn, ten valor tokens, an' dey yours to buy from any of us quartermasters." } },
      choices = {
        { text = "I'll start collecting tokens.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wares = {
      lines = { { id = "wr_default", text = "Bandages, mon, always bandages, an' de holy water for dem dat need to burn a ghoul in a hurry. De Forsaken don't buy de bandages, of course, dey just stitch demselves back up an' keep walkin'." } },
      choices = {
        { text = "Handy trick, that.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darkspear, mon, from de islands, an' now quartermaster on a cold wall. Life be funny." } },
    argent_dawn = { { id = "tp_ad", text = "Everybody fightin' de Scourge together, mon. It be de only good idea dis land had in years." } },
    _none = { { id = "tp_none", text = "Hasana don't know dat one, mon. Ask Derrington, he know everyting an' tell nuttin'." } },
  },
}

P:NPC {
  key = "bardu", id = TODO_NPC("Bardu Sharpeye"), name = "Bardu Sharpeye",
  bible = "bibles/bulwark_folk.md", role = "citizen", tier = "service",
  communities = { "bulwark" }, temper = { "calm", "patient" }, values = { "curious", "careful" },
  notices = { "class", "race" },

  impression = {
    first = "Bardu Sharpeye is a tauren resting at the Bulwark before going on to Hearthglen, after a Scarlet mage's lost weapons. He speaks slowly and seems to have thought about every word first.",
    third = "{name} met Bardu Sharpeye, a tauren at the Bulwark preparing to search Hearthglen for a murdered Scarlet mage's weapons.",
  },

  greetings = {
    { id = "g_default", text = "Hello, {class}. I've set up camp here to make my preparations, so you'll hear me talk while I pack." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "One of the shu'halo, here among the dead! The Earth Mother walks a long way with us, it seems." },
    { id = "g_back", when = { metBefore = true }, text = "Still packing, yes. A tauren carries a long road's worth of things, and forgets half of them all the same." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Your bow has a good bend to it. Mine is older, but it shoots straight, and that's all I ask of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bardu Sharpeye, of the tauren tribes. I've heard that before the Scarlet Crusade lost their minds, they kept a mage who made bows and guns finer than any I've seen, and that they killed him before his work could leave Hearthglen." },
      },
      again = { { id = "h_again", text = "Something more? I have a little time yet." } },
      choices = {
        { text = "Why does a tauren care about Scarlet weapons?", next = "why" },
        { text = "How do the Forsaken treat you here?", next = "forsaken" },
        { text = "Do you miss Mulgore?", next = "mulgore" },
        { text = "How will you get into Hearthglen?", next = "hearthglen" },
        { text = "Earth Mother guide you, Bardu.", next = "END" },
      },
    },

    why = {
      big = true,
      lines = { { id = "wy_default", text = "Because a weapon that good shouldn't sit in the hands of men who burn the living for being afraid. I'd rather it were buried, or used against the Scourge, than left for them." } },
      choices = {
        { text = "Use it against the Scourge. That's what it's for.", next = "BACK", reply = "That is my hope as well, and the Earth Mother would want it so. Let it take the Scourge until the old blood is washed from it.", fx = { align = { light = -1 } } },
        { text = "Bury it. Weapons made by murderers carry their stain.", next = "BACK", reply = "Perhaps you are right, and it carries their hatred with it. I will think on it on the road to Hearthglen.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },

    forsaken = {
      lines = { { id = "fs_default", text = "Politely, and from a distance. They smell of the grave and I smell of the plains, and we've agreed not to mention it." } },
      choices = {
        { text = "Do you trust them?", next = "forsaken_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_trust = {
      big = true,
      lines = { { id = "ft_default", text = "Cairne trusts them, and so I give them the trust I'd give a stranger at a fire, which is enough to sit by and not enough to sleep by. Perhaps that will change, if they earn it." } },
      choices = {
        { text = "They're Horde. That should be enough.", next = "BACK", reply = "It should be, and for Cairne it is. I am slower, but I am trying, like the grass in spring.", fx = { align = { order = 1 } } },
        { text = "Trust is earned, not owed to a banner.", next = "BACK", reply = "That is how my people have always thought of it. Let them earn it, and I will give it freely.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mulgore = {
      lines = { { id = "mu_default", text = "Every day, and most of all at dusk, when the plains would be turning gold. Here the dusk is grey, and so is the dawn, and so is everything in between." } },
      choices = {
        { text = "You'll see the plains again.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hearthglen = {
      lines = { { id = "hg_default", text = "Slowly, and at night, and around the long way through the hills. A tauren is not easy to hide, so I'll rely on the Scarlets looking for the dead instead of the living." } },
      choices = {
        { text = "Be careful. They hate the living too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A hunter of the plains who followed a rumour too far east. My mother would laugh at me." } },
    scarlet_crusade = { { id = "tp_sc", text = "They fear everything, and fear makes them cruel. I pity them, a little, though I'd not turn my back on one." } },
    _none = { { id = "tp_none", text = "I don't know, {class}. I'm only a traveller here, as you are." } },
  },
}

P:NPC {
  key = "werg", id = TODO_NPC("Werg Thickblade"), name = "Werg Thickblade", title = "Leatherworking Supplies",
  bible = "bibles/bulwark_folk.md", role = "vendor", tier = "service",
  communities = { "bulwark" }, temper = { "gruff", "blunt" }, values = { "practical", "trade" },
  notices = { "craft", "race" },

  impression = {
    first = "Werg Thickblade sells leatherworking supplies at the Bulwark and complains about the smell of the place in the same breath. He's the only orc I've met who misses the Barrens' heat.",
    third = "{name} met Werg Thickblade, an orc selling leatherworking supplies at the Bulwark.",
  },

  greetings = {
    { id = "g_default", text = "Thread, dye, salt, the lot. Buy something or move along, because the Forsaken don't like crowds at the wall." },
    { id = "g_orc", when = { race = "Orc" }, text = "Lok'tar! A proper orc, at last, and not another walking corpse. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good; you paid last time." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker! Then you know what I mean about the hides here. Half of them are rotten before you skin them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Werg Thickblade. I sell leatherworking supplies to whoever stands still long enough, which out here is mostly the dead." },
      },
      again = { { id = "h_again", text = "What else? Make it quick." } },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "How's trade at the Bulwark?", next = "trade" },
        { text = "Why would an orc come here?", next = "why" },
        { text = "What do you think of the Forsaken?", next = "forsaken" },
        { text = "I'll be going.", next = "END" },
      },
    },

    trade = {
      lines = { { id = "tr_default", text = "Bad, and the hides are worse. Every wolf in the Plaguelands has the rot in it, and the Forsaken buy nothing but thread, because they don't feel the cold enough to want fur." } },
      choices = {
        { text = "What should I skin, then?", next = "trade_skin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_skin = {
      lines = { { id = "ts_default", text = "Anything that runs away from you instead of toward you, because it's still healthy. If it shambles, leave it be, and wash your hands after." } },
      choices = {
        { text = "Good advice. I'll remember it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      big = true,
      lines = { { id = "wy_default", text = "Thrall said the Forsaken are Horde, so somebody had to come and sell them things. I drew the short straw, and I'm not ashamed to say I miss the Barrens' heat." } },
      choices = {
        { text = "Thrall was right. The Forsaken are our kin now.", next = "BACK", reply = "Kin, aye, and kin are hard to love sometimes. Still, I'm here, and I'll sell to them.", fx = { align = { order = 1 } } },
        { text = "Thrall asks a lot. I'd have refused the straw.", next = "BACK", reply = "Hah! And then you'd be the one sweating in the Barrens and missing the cold. I'll take my straw.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    forsaken = {
      lines = { { id = "fs_default", text = "They pay on time and they never haggle, and few orcs manage either. But they smell like a week-old kill, and I've never once seen one eat." } },
      choices = {
        { text = "Does that bother you?", next = "forsaken_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_stance = {
      big = true,
      lines = { { id = "fst_default", text = "Some days. A warrior wants to know what drives the one standing next to him, and with them I can't tell, but they hold the wall, so I hold my tongue." } },
      choices = {
        { text = "They hold the wall. That's all that matters.", next = "BACK", reply = "It is, for now, and that's enough for a grunt like me. I'll keep my tongue held.", fx = { align = { honor = -1 } } },
        { text = "A comrade's heart matters as much as his blade.", next = "BACK", reply = "It does, and that's what keeps me up at night. Still, they hold, and I'll hold with them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Grew up in the camps, skinned my first boar in Durotar, and now I sell thread to corpses. That's my life." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Ask the Forsaken; they know everything and say it slowly." } },
  },
}
-- More of the Bulwark: Mickey Levine (A Plague Upon Thee: termites for the Scarlet lumber mill
-- at Northridge) and Argent Quartermaster Hasana (the Argent Dawn's stores).
-- Voices: bibles/bulwark_folk.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Mickey Levine
---------------------------------------------------------------------------
P:NPC {
  key = "mickey_levine", id = TODO_NPC("Mickey Levine"), name = "Mickey Levine",
  bible = "bibles/bulwark_folk.md", role = "questgiver", tier = "quest",
  communities = { "bulwark" }, temper = { "wry", "bitter" }, values = { "vengeful", "practical" },
  notices = { "race", "class" },

  impression = {
    first = "Mickey Levine keeps a jar of plague termites at the Bulwark and a grudge against the Scarlet Crusade that she means to settle one rotten beam at a time. She is cheerful about it in a way that is not cheerful at all.",
    third = "{name} met Mickey Levine at the Bulwark, who plans to bring down the Scarlet Crusade's lumber mill at Northridge with termites.",
  },

  greetings = {
    { id = "g_default", text = "Mind the jars. They're full of very hungry little friends, and they don't care what they eat." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Tell me you've come about the termites, because nobody else at the Bulwark wants to hear about them." },
  },

  notice = {
    { id = "n_scarlet", cat = "class", when = { class = "PALADIN" },
      text = "The Light still shines off you, {class}, which makes my teeth ache. I'll overlook it, since you're not wearing red." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mickey Levine. I've a grudge against the Scarlet Crusade, a plan to settle it, and a jar of insects to do the work for me, if you've the stomach for termites." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Plague Upon Thee") },
          text = "The mounds are in Plaguewood, up in the Eastern Plaguelands, and the barrel goes to Northridge Lumber Mill, west of the road up to Hearthglen. Put it somewhere high, open the lid, and let my little friends take care of the rest." },
        { id = "h_done", when = { questDone = TODO_QUEST("A Plague Upon Thee") },
          text = "I hear the Crusade's mill is groaning like an old man on the stairs, and every timber they cut turns to dust before it reaches Hearthglen. That's the best news I've had since I died." },
        { id = "h_young", when = { maxLevel = 47 },
          text = "You're a bit green for Plaguewood, if you don't mind my saying so. Come back when the Plaguelands can't eat you in one bite, and I'll have a job waiting." },
      },
      again = {
        { id = "h_again", text = "What else? I've all night, and so do the termites." },
        { id = "h_again2", text = "Go on, ask. It's not often anyone here wants to talk to me." },
      },
      choices = {
        { text = "Why termites?", next = "plan" },
        { text = "What did the Crusade do to you?", next = "grudge" },
        { text = "What's it like, living at the Bulwark?", next = "bulwark" },
        { text = "Termites, Mickey? I'd rather just shoot them.", next = "xhunt", when = { class = "HUNTER" } },
        { text = "I'll leave you to your insects.", next = "END" },
      },
    },

    -- The plan
    plan = {
      lines = { { id = "p_default", text = "Because the Crusade builds everything from Northridge timber: their palisades, their siege towers, and the pyres they burn folk like me on. Take away the wood and Hearthglen starts to look very bare, and bare walls don't keep out the Dark Lady's armies." } },
      choices = {
        { text = "And the termites won't spread anywhere else?", next = "plan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan2 = {
      big = true,
      lines = { { id = "p2_default", text = "They might, I suppose, and the forests of Lordaeron might have a hard few years of it. I can't say it keeps me up at night, since nothing does any more." } },
      choices = {
        { text = "The land has suffered enough. Use them carefully.", next = "BACK", reply = "Carefully, then, though I can't promise the Society will be. I'll pass your view along, for whatever it's worth.", fx = { align = { light = 1 } } },
        { text = "Let them spread. These forests belong to the dead now.", next = "BACK", reply = "A cold sort of thought, and I can't say it's wrong. The forests haven't been anybody else's for years.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Her grudge
    grudge = {
      lines = { { id = "g_default", text = "They burned my sister on the green at Hearthglen while she was still breathing, because she'd nursed a plague victim and they called that taint. I came along a few weeks later in a cart of corpses, and by the time I woke up, they'd forgotten both our names." } },
      choices = {
        { text = "I'm sorry, Mickey.", next = "grudge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grudge2 = {
      lines = { { id = "g2_default", text = "Don't be sorry, be useful, because sorry never rotted a single beam. The Crusade remembers its enemies by their deeds, so I mean to give them a deed they'll remember." } },
      choices = {
        { text = "Then I'll help you give it to them.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Bulwark
    bulwark = {
      lines = { { id = "b_default", text = "It's the last wall between Tirisfal and the Plaguelands, and the Scourge test it every night with whatever they can drag out of Andorhal. High Executor Derrington holds the gate, the apothecaries work on the cauldrons, and the Argent Dawn has set up beside us, which some of the Deathguard don't care for." } },
      choices = {
        { text = "Why don't they care for the Argent Dawn?", next = "bulwark2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulwark2 = {
      lines = { { id = "b2_default", text = "Because plenty of the Dawn wear the Light on their sleeves, and the last people who did that in Lordaeron burned us. Garush is an orc and Hasana is a troll, though, so I think the Dawn's quarrel is with the Scourge and not with us." } },
      choices = {
        { text = "Do you trust them?", next = "bulwark3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulwark3 = {
      big = true,
      lines = { { id = "b3_default", text = "I trust anyone who'll fight the Scourge beside me, which is a short list and getting shorter. Ask me again after they've stood on the wall through a bad night, and I'll tell you then." } },
      choices = {
        { text = "Light or no Light, they're welcome on the wall.", next = "BACK", reply = "That's the right attitude for a wall, and I'll hold you to it. A bad night doesn't care about the Light.", fx = { align = { light = 1 } } },
        { text = "Anyone who wears the Light will turn on us.", next = "BACK", reply = "Perhaps they will, and perhaps they won't. I'll watch them on a bad night and decide then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Hunters
    xhunt = {
      lines = { { id = "xh_default", text = "So would I, but an arrow kills one Crusader and a termite kills the house he sleeps in. Shoot all you like on the way to Northridge, {class}; the barrel will do the real work." } },
      choices = { { text = "Point taken. Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea, and I'm too busy thinking about termites to find out. Ask Derrington." } },
  },
}
