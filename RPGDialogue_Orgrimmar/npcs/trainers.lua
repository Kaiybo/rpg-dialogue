-- Orgrimmar's trainers, from the Valley of Honor to the Cleft of Shadow. Voice: bibles/orgrimmar.md
-- Zevrost never names Neeru; the Cleft keeps its own secrets.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "grezz", id = TODO_NPC("Grezz Ragefist"), name = "Grezz Ragefist",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "fierce" }, values = { "brave", "proud" },
  notices = { "class" },
  impression = {
    first = "Grezz Ragefist trains the warriors of Orgrimmar in the Valley of Honor, a loud, scarred orc who believes every lesson should leave a bruise.",
    third = "{name} met Grezz Ragefist, the warrior trainer in Orgrimmar's Valley of Honor.",
  },
  greetings = {
    { id = "g_hi", text = "Into the Valley of Honor, are you? Then stand like you mean it." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not the axe, and not the rage, though the Horde has plenty of both. The demon blood gave our fathers rage without end and it nearly killed us all, so I teach control first, and the warriors who learn it live long enough to teach the next ones." } },
      choices = {
        { text = "Control first. Rage is a tool, not a master.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rage won the old wars. I'll let it run free.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Should a hunter learn to breathe? Your beast will hold most things off, but one day a raptor will get past it, and on that day you'll want to know how to block with an axe rather than how to run, so spend a week sparring with my recruits and you'll thank me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has better footwork than half my students, and it doesn't talk back. I might start charging it for lessons." },
      },
      choices = {
        { text = "I'll learn the axe. A hunter shouldn't hide behind a beast.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My beast takes the blows. That's what it's for.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If you call it to your hand and look your enemy in the eye, yes, and I'll fight anyone who says otherwise. What I won't have is a shaman hiding behind a totem while the grunts bleed for him, because that isn't a fight, it's a hiding place." } },
      choices = {
        { text = "I'll call the storm face to face, never from cover.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A wise shaman fights from wherever he's safest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Strength used for the Horde is always honorable, whatever shape it comes in. I only ask that you don't turn into a cat halfway through a duel, because my warriors find that insulting." } },
      choices = {
        { text = "A fair fight is fought face to face.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Victory matters more than how it's won.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Results, is it? I've buried better orcs than you who thought the same thing, and the honorable ones still won more fights than they lost, so hit me from behind and I'll forgive you once, but do it twice and I'll stop teaching you anything." },
      },
      choices = {
        { text = "Results win wars. Honor fills graves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Perhaps you're right. Honor counts for something.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What does honor mean to you?", next = "honor" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Some do, and I'll fight beside one if the Warchief asks it of me. But the warlocks of the Shadow Council sold our people to demons, and every orc who fought in the old Horde gets that taste in his mouth whenever he sees an imp." },
      },
      choices = {
        { text = "I'll earn your respect openly, in battle.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I don't need respect. I need results.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who else trains in the valley?", next = "valley" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Grezz Ragefist, and I train the Warchief's warriors. The Valley of Honor is named for what we earn here, so don't waste my time with anything less." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Another warrior come for lessons? Good, because the Horde can never have enough strong arms." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid on my training ground? Fine, because a tauren in bear form hits harder than most of my students, and I'm not too proud to say so." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman on my training ground! The Warchief swings the Doomhammer and calls the storm with the same arm, so don't tell me your kind are too soft for real fighting." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "Back again, warrior? Show me your stance before you say a word, because your feet tell me more than your mouth ever will." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter in the Valley of Honor? Ormak's lot are over by the range, but stay if you like, because a hunter who can hold a blade survives longer." },
      },
      choices = {
        { text = "Is it honorable to strike with lightning, Grezz?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is a druid's strength honorable, Grezz?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What does honor mean to you?", next = "honor" },
        { text = "Who else trains in the valley?", next = "valley" },
        { text = "Honor doesn't win wars, Grezz. Results do.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What makes a warrior of the Horde, Grezz?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should a hunter learn to fight up close, Grezz?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do warlocks have any honor, Grezz?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Farewell, Grezz.", next = "END" },
      },
      again = { { id = "h_again", text = "Still standing there? Then ask, and ask loudly." } },
    },
    honor = {
      lines = { { id = "o_default", text = "It means you face your enemy and you don't strike his back, even when he'd strike yours. The Warchief taught us that our fathers forgot it, and I won't let my students forget it twice." } },
      choices = {
        { text = "Honor is what makes us more than beasts.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Honor is fine until it gets you killed.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    valley = {
      lines = { { id = "v_default", text = "Ormak teaches the hunters across the way, and the smiths work the forges behind us. Every one of them answers to the Warchief, and every one of them thinks his trade matters most." } },
      choices = { { text = "And which matters most?", next = "valley_best" } },
    },
    valley_best = {
      lines = { { id = "vb_default", text = "Mine, of course, because a smith's blade is just iron until a warrior swings it. Don't tell the smiths I said so, though." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know steel and I know sweat. Anything else, ask Gryshka at the inn." } },
  },
}

P:NPC {
  key = "ormak", id = TODO_NPC("Ormak Grimshot"), name = "Ormak Grimshot",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Ormak Grimshot trains Orgrimmar's hunters in the Valley of Honor, a dry, patient orc who would rather watch a student's pet than the student.",
    third = "{name} met Ormak Grimshot, the hunter trainer in Orgrimmar.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the beasts. Most of them bite, and the rest are thinking about it." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Patience, and how to read the ground before you charge across it. I've seen grunts run straight into a scorpid nest in the Barrens because they never looked down, so watch the tracks and the wind, and you'll pick your fights instead of falling into them." } },
      choices = {
        { text = "I'll learn to read the ground before I charge.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A fast charge beats any amount of tracking.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "With food, with patience and with your own voice, every day, until it knows yours from any other. Durotar's beasts stay half wild even when they're tamed, so start with a boar if you're nervous, and move to the raptors only when you've learned to read a temper." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks well kept. Good, because I judge my students by their beasts more than by their aim." },
      },
      choices = {
        { text = "A beast is my partner. I'll earn its trust.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A beast obeys, or it goes back to the wild.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "You hear its spirits and I read its tracks, and most days we come to the same answer. The difference is that when the earth's angry you ask it why, and I just pack up and hunt somewhere else." } },
      choices = {
        { text = "Facing the land's anger is the honest path.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "There's no shame in leaving a fight you can't win.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "A hunter tracks prey to feed someone and a rogue tracks prey to rob it, so I'd say the hunter's better, though I've seen rogues track as well as any of mine. Durotar is hard ground, and anyone who can follow a trail across it has my respect." },
      },
      choices = {
        { text = "Then I'll track to protect, not to rob.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Prey is prey, whatever the reason.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Where's the best hunting near Orgrimmar?", next = "hunt" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Turning a boar into a sheep isn't taming it, friend, it's only confusing it. A tamed beast chooses to stay at your side, and no spell ever made a creature choose anything." },
      },
      choices = {
        { text = "Fair. Trust is earned, not forced.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Choice is overrated. A spell works faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How do you choose a companion?", next = "pet" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Ormak Grimshot, and I teach the hunters of the Horde. Durotar is a hard land for game, so a hunter here learns to track things that would rather not be found." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Your companion is with you, good. Now let's see if you've been worthy of it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You've come to the wrong trainer, but stay a while, because your kind and mine both learned long ago that the land watches us back." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior at the hunters' range? Stay a while, because you could do worse than learn to throw an axe straight." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "One of mine, and with a beast in tow. Show me how it heels, because a pet that doesn't heel is a pet that gets you killed." },
      },
      choices = {
        { text = "Do shamans and hunters see the land differently?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How do you choose a companion?", next = "pet" },
        { text = "Where's the best hunting near Orgrimmar?", next = "hunt" },
        { text = "Hunters and rogues both track prey. Which is better?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My polymorph tames a beast faster than you can.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What can a warrior learn from a hunter, Ormak?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How should I train my companion, Ormak?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Farewell, Ormak.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? Make it quick, the wolves need feeding." } },
    },
    pet = {
      lines = { { id = "p_default", text = "You don't choose it, not truly, because the beast chooses whether to follow you. Feed it well, fight beside it, and never leave it behind in a fight." } },
      choices = {
        { text = "A companion is family.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A companion is a tool, a good one.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    hunt = {
      lines = { { id = "h1_default", text = "The Barrens, past the Crossroads, where the zhevra and the lions run. Durotar's scorpids make poor sport and worse eating." } },
      choices = { { text = "And further than that?", next = "hunt_far" } },
    },
    hunt_far = {
      lines = { { id = "h2_default", text = "Ashenvale, if you dare the night elves, and Stonetalon beyond it. A hunter goes where the game is, whatever the warlords say about borders." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Unless it leaves tracks or wears fur, I've nothing to teach you about it." } },
  },
}

P:NPC {
  key = "kardris", id = TODO_NPC("Kardris Dreamseeker"), name = "Kardris Dreamseeker",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "wise", "devout" },
  notices = { "class" },
  impression = {
    first = "Kardris Dreamseeker trains the shaman of Orgrimmar in the Valley of Wisdom, near the Warchief's own teachers, and speaks of the spirits with quiet certainty.",
    third = "{name} met Kardris Dreamseeker, a shaman trainer in Orgrimmar's Valley of Wisdom.",
  },
  greetings = {
    { id = "g_hi", text = "The spirits are restless in the city today. Come, sit where they are quieter." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The earth holds up the warrior's feet and the fire fills his blood, so yes, though most warriors never stop to listen. Before the demons came, our warriors went to the shaman before every battle to ask the spirits' blessing, and I would see that custom return." } },
      choices = {
        { text = "Then I'll seek the spirits' blessing before I fight.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My axe needs no spirit's blessing, Kardris.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every beast has a spirit, and the spirits of the wild watch over those who walk with them honestly. Our ancestors hunted Draenor with wolves at their side long before the demons taught them to hunt their own kind, and the spirits remember that better than we do." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a calm spirit. That comes from you, {class}, so keep it that way." },
      },
      choices = {
        { text = "I'll honour my companion's spirit in all I do.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast's spirit is its own concern, not mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The same land, I think, but different voices in it. The elements speak to us as they rage and settle, and you hear the slower voice beneath them, the one that grows things." } },
      choices = {
        { text = "Each path should keep to its own ways.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The two paths should learn from each other freely.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Our shamans listened to the elements and never needed the arcane, and the first orcs to grasp at stranger powers became Gul'dan's warlocks. The trolls teach you a cleaner kind of magic, I'm told, but I'd ask you never to forget there's more to the world than what you can grasp." },
      },
      choices = {
        { text = "I'll remember. The world is more than power.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What I can grasp is what I'll use.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What were the orcs before the demons?", next = "before" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They don't hate you, but they turn away from you, and that's worse. When our people began bargaining with demons, the spirits of Draenor went silent, and it took Thrall years to coax them back, so I'll ask you not to walk too near my students." },
      },
      choices = {
        { text = "I understand. I'll keep my distance from them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them turn away. I don't need the spirits.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why are the spirits restless?", next = "restless" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kardris Dreamseeker, and I guide the shaman of the Horde. The Valley of Wisdom is where the orcs came to remember what they were before the demons." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "Welcome, shaman. Tell me, have the elements spoken to you clearly since we last met?" },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the tauren, welcome to the Valley of Wisdom. Your people kept faith with the Earth Mother while mine forgot the spirits entirely, and we have learned a great deal at your elders' fires." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior in the Valley of Wisdom. Good, because the elements respect a strong spirit as much as a wise one, and you may have more of the first than you think." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and a beast who walks with you. The spirits of the wild are close to the elements, and I can feel them gathered around you both." },
      },
      choices = {
        { text = "Do shaman and druid hear the same voices?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What were the orcs before the demons?", next = "before" },
        { text = "Why are the spirits restless?", next = "restless" },
        { text = "Did the orc shamans ever study the arcane?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the elements care for warriors, Kardris?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the spirits watch over my companion, Kardris?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The spirits must hate me, Kardris.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
      again = { { id = "h_again", text = "Ask what you wish. Wisdom grows by sharing it." } },
    },
    before = {
      lines = { { id = "b_default", text = "Clans who honored the land and its spirits, and shaman who listened rather than commanded. The warlocks taught us to take, and the Warchief is teaching us again to ask." } },
      choices = { { text = "Can the old ways truly return?", next = "before_return" } },
    },
    before_return = {
      lines = { { id = "br_default", text = "They already have, in every shaman who answers the elements' call. It is slow, and some orcs still long for the fel, but the spirits are patient with us." } },
      choices = {
        { text = "Then those who cling to the fel must be stopped.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Each orc must find his own way back.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    restless = {
      lines = { { id = "r_default", text = "A city is many voices, and some of them are angry. The spirits feel every grudge in Orgrimmar, and there are a great many of those." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The spirits have not shown me that. Perhaps they will, in time." } },
  },
}

P:NPC {
  key = "zevrost", id = TODO_NPC("Zevrost"), name = "Zevrost",
  bible = "bibles/orgrimmar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "ambitious", "cunning" },
  notices = { "class" },
  impression = {
    first = "Zevrost trains warlocks in the Cleft of Shadow, smooth-voiced and careful, and he insists that the power he teaches is a tool and nothing more.",
    third = "{name} met Zevrost, the warlock trainer in Orgrimmar's Cleft of Shadow.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the Cleft. The shadows here are friendlier than the faces above, I promise you." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every use, I assure you, though most warriors don't care for the answer. A demon guards the front of a fight well enough, but a warrior beside us keeps the enemy's eyes off the caster, and a warlock who isn't being stabbed is a warlock who wins." } },
      choices = {
        { text = "I'd never fight beside a demon. The Horde learned that lesson.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If a demon wins the fight, I'll fight beside it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Your beast loves you, and mine would devour me the moment I faltered, so I suppose the difference is trust. A hunter tames by patience and a warlock binds by will, and only one of us sleeps soundly at night, though I'll leave you to guess which." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} doesn't care for me, I see. Animals never do; they can smell the Twisting Nether on our robes." },
      },
      choices = {
        { text = "Trust is stronger than any binding, warlock.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Binding by will sounds more reliable than trust.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It burned a world and carried us through the Dark Portal, and it cost us everything else, so I suppose that depends on how you count. The Warchief keeps us on a short chain, and I teach my students to remember why, which is more than the Shadow Council ever did." } },
      choices = {
        { text = "Nothing the demons gave was worth what it cost us.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power, and only fools refuse a weapon.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Friendly is a strong word, but we understand one another, which is rarer. The rogues keep their secrets and we keep ours, and the Warchief's guards watch us both, so we all behave impeccably." },
      },
      choices = {
        { text = "Good. The Warchief's watch keeps us all honest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Secrets are what keep the Cleft alive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What is the Cleft of Shadow?", next = "cleft" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Cleaner, you say, and yet it was the arcane that first drew the Legion's eye to this world. I'll grant your craft has a better name in Orgrimmar, but power is power, and both of us study it because we want more of it." },
      },
      choices = {
        { text = "I want power to protect, not to hold.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "True enough. We both want more, and that's fine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Isn't this the magic that ruined the orcs?", next = "ruin" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Zevrost, and I teach those with the will to command what others fear. The Warchief permits us, so long as we remember who serves whom." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "Ah, one of mine. Your demon is well leashed, I hope, because the guards above notice when it isn't." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Cleft of Shadow. Your path and mine both began with the shamans of Draenor, though you'd rather forget it, so do try not to glare at my students." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, here among the warlocks? How brave of you, or how lost. The Valley of Honor is up the stairs and well away from us." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, with a pet of flesh and fur. We warlocks keep pets as well, though ours are rather harder to feed." },
      },
      choices = {
        { text = "Your kind traded the elements for demons. Was it worth it?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Isn't this the magic that ruined the orcs?", next = "ruin" },
        { text = "What is the Cleft of Shadow?", next = "cleft" },
        { text = "Rogues and warlocks share the Cleft. Friendly neighbors?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The arcane is cleaner than what you teach, Zevrost.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do warlocks have any use for warriors, Zevrost?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How is a demon different from a hunter's beast, Zevrost?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'll go.", next = "END" },
      },
      again = { { id = "h_again", text = "More questions? Curiosity is the first step to power, after all." } },
    },
    ruin = {
      lines = { { id = "r_default", text = "The orcs were ruined by bowing to demons, not by learning their names. A warlock commands, and a slave obeys, and there is all the difference in the world between them." } },
      choices = { { text = "And if the demon wins?", next = "ruin_wins" } },
    },
    ruin_wins = {
      lines = { { id = "rw_default", text = "Then the warlock was weak, and the Horde is better rid of him. That is the price of the art, and every student of mine pays it willingly." } },
      choices = {
        { text = "Power like that should be watched closely.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Strength takes risks. The weak can stay above.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    cleft = {
      lines = { { id = "c_default", text = "The lowest part of the city, where rogues and warlocks and the less welcome trades keep their shops. The Warchief knows we are here, and that is enough for most of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Some things are better left unasked in the Cleft, friend." } },
  },
}
