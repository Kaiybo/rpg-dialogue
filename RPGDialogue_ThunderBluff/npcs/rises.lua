-- Thunder Bluff's rises: the Forsaken apothecary on Spirit Rise and the trainers of Hunter Rise. Voice: bibles/thunderbluff.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zamah", id = TODO_NPC("Apothecary Zamah"), name = "Apothecary Zamah",
  bible = "bibles/thunderbluff.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "dry" }, values = { "curious", "ambitious" },
  notices = { "race" },
  impression = {
    first = "Apothecary Zamah works for the Royal Apothecary Society in the Pools of Vision beneath Spirit Rise, a Forsaken among tauren who seems to enjoy their unease. She wants serpentbloom and other samples, and she is politely vague about why.",
    third = "{name} met Apothecary Zamah, the Forsaken apothecary beneath Thunder Bluff's Spirit Rise.",
  },
  greetings = {
    { id = "o_sylv_admire", when = { opinion = { sylvanas = "admire" } }, text = "I'm told you'd die again for the Dark Lady. How refreshing, among all these cattle who only ever stare." },
    { id = "g_hi", text = "Do come in, and don't mind the smell. The tauren tell me it's an acquired tolerance." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still breathing. How refreshing." },
    { id = "g_rise", when = { origin = "tauren_spirit_rise" }, text = "Ah, the water-carrier! You used to haul jugs past my door for the seers every morning, and now I'm told the elements speak to you. Do tell them the smell from my workshop is entirely deliberate." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and you're still breathing, which is more than I can say for most of my samples. Do come in." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "The tauren are whispering that one of them believed a tale of yours, and I find that terribly amusing. They're such trusting creatures, aren't they?" },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear one of your fibs was seen through up on the rises. A pity, really, because a lie should be handled with the same care as any other poison." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren who comes down here willingly? Your elders mostly cross the pools to avoid me." },
    { id = "n_undead", cat = "race", when = { race = "Undead" },
      text = "Ah, a fellow citizen of the Undercity. It's pleasant to talk to someone who doesn't flinch." },
  },
  start = "hello",
  nodes = {
    op_tauren = {
      lines = {
        { id = "opt_q", text = "I'll tell you a secret: I find them fascinating, in the way one finds a very large and very polite cow fascinating. What do you make of our hosts?" },
      },
      choices = {
        { text = "They're the kindest people in the Horde. Mind your manners here.", next = "op_tauren_r1", fx = { affinity = -1, align = { light = 1 }, opinion = { tauren = "admire" } } },
        { text = "They're slow and sentimental. The Forsaken carry the Horde's real work.", next = "op_tauren_r2", fx = { affinity = 2, align = { light = -1 }, opinion = { tauren = "soft" } } },
        { text = "They gave your people a home. You owe them for it.", next = "op_tauren_r3", fx = { opinion = { tauren = "respect" } } },
        { text = "I'm tauren, apothecary, and I'd thank you to stop staring back.", next = "op_tauren_r4", fx = { affinity = 1, trait = { proud = 1 }, opinion = { forsaken = "distrust" } }, when = { race = "Tauren" } },
        { text = "I'll leave the tauren to speak for themselves.", next = "BACK" },
      },
    },
    op_tauren_r1 = {
      lines = {
        { id = "op_tauren_r1", text = "Kind, yes, and kindness is a lovely thing in a host, though a poor defence against anything sharper. I'll mind my manners, since you ask so sweetly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_tauren_r2 = {
      lines = {
        { id = "op_tauren_r2", text = "You'd fit nicely in the Undercity, I think. Do keep that opinion off the lifts, though, because the tauren are very large." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_tauren_r3 = {
      lines = {
        { id = "op_tauren_r3", text = "We owe the Chieftain, yes, and the Society always pays its debts in the end. How it pays them is another matter." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_tauren_r4 = {
      lines = {
        { id = "op_tauren_r4", text = "Oh, spirit! Perhaps there's hope for the herd after all. I'll stare a little less, and you may stare a little more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_wc = {
      big = true,
      lines = { { id = "xcl_wc_default", text = "And you came back with all your limbs, which the deviate creatures down there do not usually allow. Serpentbloom grows in those caves and carries a toxin the Society finds very instructive, so a quieter cavern makes my collectors' work a good deal safer. The tauren speak of the place as a wound, and I speak of it as a laboratory, and we are both quite sincere." } },
      choices = {
        { text = "The Society should study it, whatever it finds.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "That place should be healed, Zamah, not harvested.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "What makes the creatures there deviate?", next = "xcl_wc2" },
      },
    },
    xcl_wc2 = {
      lines = { { id = "xcl_wc2_default", text = "As far as we can tell, the druid's dream leaked into the water and the water leaked into everything else. The changes are fast and unpredictable, which in a living thing is a sign of something powerful at work, and if it could be understood it might be very useful, though I wouldn't say so to Hamuul." } },
      choices = { { text = "I'll keep that between us, Zamah.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because the Silver Hand was Lordaeron's, and Lordaeron hunted us when we woke. Some of its knights still ride the Plaguelands against us. You call on their Light, and the Dark Lady likes to know whose loyalties outlived the grave." } },
      choices = {
        { text = "Mine belong to the Dark Lady. Write that down.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My loyalty is to the Light, apothecary. Note that.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They trust the Earth Mother's healing, and they tolerate ours because Cairne asks them to. A troll's prayer or a Forsaken's shadow both make them twitch, though they'll still bring you a fevered calf when the shaman are out on the plains. I find that rather sweet of them, in a bovine sort of way." } },
      choices = {
        { text = "Healing is healing, whoever does it. They'll learn that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them twitch. Their fear makes them easier to manage.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Deviate raptors, deviate crocolisks and a family of druids who have dreamed themselves quite mad. The blooms I need grow among all of them, so a warrior who keeps the beasts busy while someone else does the picking is worth his weight in silverleaf." } },
      choices = {
        { text = "I'll guard the gatherers and keep them alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go for the loot. The picking's your problem.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Something in the dream, if the druids are to be believed, or something in the water, if you ask me. The deviate creatures down there are twisted in ways I've never seen, and I'd give a great deal for a fresh sample of one, preferably not attached to the rest of it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Do keep your {pet} out of the caverns' pools, by the way. Whatever twists the beasts down there isn't particular about whose beast it twists." },
      },
      choices = {
        { text = "I'll bring samples to cure the sickness, Zamah.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Samples are worth coin, apothecary. I'll name my price.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "It does, and I'd be a poor apothecary if I couldn't name a dozen of them, but the tauren believe I'm making medicine, and so I am, mostly. Bring the blooms up from the Wailing Caverns and keep your guesses to yourself, and we'll both stay welcome on Spirit Rise." },
      },
      choices = {
        { text = "Secrets suit me. Your work is safe with me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "If it harms the tauren, they should know.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What do you really want serpentbloom for?", next = "serpent" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They mind, quietly, the way tauren mind everything, with long looks and longer silences. The Pools of Vision are holy to them, so I'd keep your spells in your pocket down here, whatever you think of their spirits." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "They mind me already, so a second Forsaken in a mage's robe is hardly going to ruin anyone's day. Keep your spells in your pocket down here, though, because the Pools of Vision are holy to them, and Cairne's patience is what keeps us all welcome." },
      },
      choices = {
        { text = "Their pools, their rules. I'll keep my spells still.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Holy or not, the pools don't own my magic.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How do the tauren treat you here?", next = "tauren" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They look at me the same way, and I didn't even bring a demon. The tauren know what fel fire does to grass and to people, so you might as well get used to the looks, because they won't stop." },
      },
      choices = {
        { text = "Their fear is fair. I'll keep my imp leashed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them stare. Fear keeps people polite.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why are the Forsaken in Thunder Bluff?", next = "why" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I gather serpentbloom from the Wailing Caverns, where druids were lost to a dream gone foul, and your elders can't decide whether I study the plant or the sickness. I study both, of course, which is exactly what they fear." } },
      choices = {
        { text = "Then say plainly what you study, because secrets breed distrust.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep your notes close. They needn't know everything.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, here among our tauren friends. How curious. The Society keeps notes on Forsaken who cling to the old Light, and I'm afraid you've just become one." },
        { id = "h_default", key = true,
          text = "I am Apothecary Zamah, and I represent the Royal Apothecary Society here among our tauren friends. Cairne lets us study, and in return we share our cures, mostly." },
        { id = "h_serpent", when = { questActive = TODO_QUEST("Serpentbloom") },
          text = "The serpentbloom grows in the Wailing Caverns, among the druids who've gone wrong down there. Bring me what you can, and mind the fumes." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Ah, a shaman. The elements are such fascinating subjects, and so very poor at holding still to be studied." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Splendid; the Wailing Caverns are full of things that bite, and I find warriors far more useful down there than poetry." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know a sick beast from a healthy one, which makes you more useful to the Society than most of the tauren I've asked." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, down here among the Pools of Vision. The tauren will assume you've come to bless the water, and I'd rather you didn't, because blessed water spoils my samples." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, and so another of Hamuul's watchers. His students on Elder Rise are always terribly polite to me, which in my experience is how the living say they don't trust you." },
        { id = "h_cl_wc", tags = { "news" }, when = { cleared = "Wailing Caverns", faction = "Horde" }, text = "You've been to the bottom of the Wailing Caverns, I'm told, and come out unpoisoned, which is remarkable considering what grows down there." },
      },
      choices = {
        { text = "Do the tauren trust a priest's healing, Zamah?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why are the Forsaken in Thunder Bluff?", next = "why" },
        { text = "What do you want serpentbloom for?", next = "serpent" },
        { text = "How do the tauren treat you?", next = "tauren" },
        { text = "What does the Society really study?", next = "society", when = { race = "Undead" } },
        { text = "Do the spirits of the Pools trouble you, Zamah?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Serpentbloom has other uses, I'd imagine.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the tauren mind mages walking their sacred pools?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What bites in the Wailing Caverns, Zamah?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What makes the beasts in the Wailing Caverns sick, Zamah?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The tauren look at my imp as if it were plague.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why do the druids distrust you, Zamah?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Why does the Society keep notes on paladins, Zamah?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I went to the bottom of the Wailing Caverns, Zamah.", next = "xcl_wc", when = { cleared = "Wailing Caverns", faction = "Horde" } },
        { text = "I'll be going.", next = "END" },
      },
      again = {
        { id = "h_again", text = "More questions? I do like a curious mind, while it lasts." },
        { id = "h_again2", text = "Ask what you will, child; the healing waters of the Spirit Rise are patient." },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because Cairne Bloodhoof, bless his enormous heart, spoke for us when the rest of the Horde would sooner have burned us. The tauren believe we can be healed of our curse, and we are happy to let them believe it." } },
      choices = { { text = "You don't believe you can be healed?", next = "why_heal" } },
    },
    why_heal = {
      lines = { { id = "wh_default", text = "I believe in study, and the tauren have herbs and spirits we have never examined. Whether that ends in a cure or in something more useful, the Dark Lady will decide." } },
      choices = { { text = "Something more useful?", next = "why_useful" } },
    },
    why_useful = {
      lines = { { id = "wu_default", text = "A cure for the Scourge's plague, of course, for the living as well as the dead. What else could I possibly mean?" } },
      choices = {
        { text = "Cairne trusted you. Don't betray that.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Use what you learn however you must.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    serpent = {
      lines = { { id = "s_default", text = "Its venom has properties the Society finds remarkable, and the druids of the Fang have made it grow strange and strong. I would very much like to know how." } },
      choices = { { text = "I'll gather some.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      lines = { { id = "t_default", text = "With courtesy and a good deal of staring. Magatha Grimtotem is the only one who looks at me as though she understands me, which I find rather more worrying than the staring." } },
      choices = {
        { text = "And what do you make of them?", next = "op_tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    society = {
      lines = { { id = "so_default", text = "Plagues, my dear, and everything that cures them or carries them. One must understand a weapon before one can turn it away, or turn it around." } },
      choices = { { text = "I'll keep that between us.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The tauren say the Pools of Vision show the spirits of their ancestors, and I'll admit some of my samples behave oddly near the water. The dead and the elements are not good neighbors, I find, which is why your elders watch me so closely, and why I smile at them." } },
      choices = {
        { text = "The tauren trusted you here, so repay that with honest work.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever you find down there, keep it from the elders.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I'm afraid that falls outside my research, and my interest." } },
  },
}

P:NPC {
  key = "holt", id = TODO_NPC("Holt Thunderhorn"), name = "Holt Thunderhorn",
  bible = "bibles/thunderbluff.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "patient", "wise" },
  notices = { "class" },
  impression = {
    first = "Holt Thunderhorn trains hunters on Hunter Rise, a patient elder whose family is known across Mulgore for its archers.",
    third = "{name} met Holt Thunderhorn, the hunter trainer on Thunder Bluff's Hunter Rise.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to Hunter Rise. The wind is good for archery today." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd hunt beside anyone who respects the beast. The tauren never needed the Light, but I'm curious what it does to a hunter's patience. If it makes you steady, it may do you more good than you think." } },
      choices = {
        { text = "It makes me steady. I'll respect the hunt.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm no hunter, Holt. I'll take what I need.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "More often than their pride would let them say. A plainstrider's kick or a quilboar's spear in the thigh, and they limp up the lift hoping I won't notice. The shaman mend them well enough, but I've seen a troll priest close a wound in a single breath, and it impressed even this old hunter." } },
      choices = {
        { text = "I'll mend any hunter who limps up that lift.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pain teaches them caution. Let them limp a while.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To hunt your enemy as a hunter hunts a kodo, patiently and with respect, and to strike only when the moment is right. The centaur of the Barrens charge without thinking, and the warriors who wait for the charge to break are the ones who win the day." } },
      choices = {
        { text = "I'll wait for the right moment, Holt.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Waiting loses battles. I strike first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Patience, respect and a steady hand, in that order, because the Thunderhorns have hunted Mulgore since long before the bluffs had bridges. We honour the beast we take and we never take more than the tribe needs, and a hunter who forgets that is no Thunderhorn, whatever his name." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} walks proudly, {class}. That pride comes from you, and I hope you've earned it." },
      },
      choices = {
        { text = "I'll honour every beast I take, Holt.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good kill is its own honour, Holt.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "That's true, and I've watched a troll rogue sit so still in the grass that a plainstrider stepped on him. But a hunter is patient so the beast can be honoured, and I'm not sure a rogue is patient for anything but the purse at the end of it." },
      },
      choices = {
        { text = "Patience for its own sake, then. I'll learn that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The purse at the end is reason enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What does the Earth Mother ask of hunters?", next = "mother" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Perhaps, but then the arrow would be the mage's and not the archer's. The Thunderhorns have shot true for generations with nothing but good wood and good eyes, and I'll keep teaching it that way." },
      },
      choices = {
        { text = "Tradition has its strength. I'll respect it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A truer arrow is a truer arrow, whatever moves it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Are you kin to Mull Thunderhorn?", next = "kin" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hamuul tells no one anything, but his students like to ask, quietly, how many kodo we took this season and whether we spared the calves. I grumble about it and then I count, because they're usually right about what the herds can bear." } },
      choices = {
        { text = "Someone should keep count, or the herds won't last.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A hunter's own judgment should be enough, without anyone counting.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because they smell what doesn't belong in the world, and your demon doesn't belong in it. The Thunderhorns have hunted Mulgore for generations without needing anything from the Twisting Nether, but the Horde takes all kinds, and so will I." },
      },
      choices = {
        { text = "Then I'll walk slowly, out of respect.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your beasts will learn their place.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. The Thunderhorns have hunted Mulgore for generations, and we've never hunted beside one of you." },
        { id = "h_default", key = true, text = "I am Holt Thunderhorn, and I teach the hunters of Thunder Bluff. The Thunderhorns have hunted Mulgore since long before the bluffs had bridges." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Your bow has seen use since we last met, hunter. Let me see what you have learned." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman on Hunter Rise? You're welcome here, though my students will want to know if you can call the wind to steady an arrow." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior on Hunter Rise. Stay a while, because the Thunderhorns have taught more than hunters to read the plains." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "One of mine comes home. Tell me what you've tracked since we last spoke, and let me see how your companion carries itself." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, up on Hunter Rise? You're far from the healers' fires, friend, but sit if you like, for my students come back bloodied often enough." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. In my grandfather's day nobody walked among us to tell the hunters how many plainstriders were too many, and some of my students still miss those days." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock on Hunter Rise. My students' beasts will bristle at you, so walk slowly." },
        { id = "h_narache", when = { origin = "tauren_narache_hunter" }, text = "Narache blood, by the way you came up the ramp, slow and watching the ground for tracks. Your mother tracked the mesa for the Hawkwind's camp, I think, and the old hunters still argue over whether she or a Thunderhorn took the most plainstriders in a season." },
      },
      choices = {
        { text = "Do your hunters ever need a priest's mending, Holt?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Are you kin to Mull Thunderhorn?", next = "kin" },
        { text = "What does the Earth Mother ask of hunters?", next = "mother" },
        { text = "Can a shaman's wind really steady an arrow, Holt?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A hunter and a rogue both learn patience, Holt.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can magic make an arrow fly truer?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What would a Thunderhorn teach a warrior, Holt?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What makes a Thunderhorn hunter, Holt?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the druids tell your hunters how to hunt, Holt?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Why do the beasts bristle at me, Holt?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would a Thunderhorn hunt beside a paladin, Holt?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good hunting.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? A hunter's patience includes listening." } },
    },
    kin = {
      lines = { { id = "k_default", text = "Mull is family, yes, though he prefers the village to the bluffs. He keeps an eye on the young braves at Bloodhoof, and I keep an eye on him." } },
      choices = { { text = "Does he need watching?", next = "kin_watch" } },
    },
    kin_watch = {
      lines = { { id = "kw_default", text = "Every Thunderhorn does, because we all think the next hunt will be the greatest. Mull simply says it louder than the rest of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mother = {
      lines = { { id = "m_default", text = "That we take only what the herd can spare, and that we waste nothing of what we take. A hunter who forgets this soon finds the plains empty." } },
      choices = {
        { text = "The herd comes before the hunter.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A hunter must feed his family first.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My grandfather swore a shaman did it for him once, on a hunt near the Red Rocks, and he never missed again the rest of that day. I think the spirits helped and I think his own patience helped more, and I've never decided which to thank first." } },
      choices = {
        { text = "Thank the spirits first. They gave him the day.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thank his own eye. The spirits get too much credit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I have not heard of that. The plains keep many secrets." } },
  },
}

P:NPC {
  key = "ker", id = TODO_NPC("Ker Ragetotem"), name = "Ker Ragetotem",
  bible = "bibles/thunderbluff.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "firm" }, values = { "brave", "honorable" },
  notices = { "class" },
  impression = {
    first = "Ker Ragetotem trains the warriors of Thunder Bluff, a broad, stern tauren who reminds every student that strength is for protecting the herd.",
    third = "{name} met Ker Ragetotem, the warrior trainer in Thunder Bluff.",
  },
  greetings = {
    { id = "g_hi", text = "Stand firm, young one. The bluffs are high, and the wind is not kind to the unsteady." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, young one, and I hope you kept your stance while you were gone. Show me." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown strong since you first stood in my yard, and you hold yourself steadier on the bluffs now. Remember that strength is for protecting the herd." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "I hear you made someone in the city back down. Strength that frightens our own people protects no one, so be careful with it." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Anything that can protect the herd can hurt it. The orcs remember the Light from the camps, where it guarded their cages. Use it to guard the herd, not to cage anyone, and you'll be welcome among my warriors." } },
      choices = {
        { text = "I'll guard the herd with it, Ker.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll use it however the fight requires.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Behind it, I would say, close enough to reach the wounded and far enough back that the first charge doesn't fall on you. A warrior who knows a healer stands at his back will hold a little longer, and a little longer is often the whole battle. Strength protects the herd, and so does whoever keeps the strong on their feet." } },
      choices = {
        { text = "I'll stand behind them and keep them standing.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I fight where I choose, not where warriors need me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Carefully, as I tell every tauren who comes to me, because a tauren swing can break a centaur's back or a friend's shield. The braves who guard Thunder Bluff learn to measure every blow, so that the strength the Earth Mother gave them is only ever used to protect." } },
      choices = {
        { text = "I'll measure every blow, Ker.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A blow held back is a blow wasted.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not as often as they should, though I'd change that if the hunters would come down from their rise. A warrior who knows where the arrows will fall can hold the line longer, and a hunter who knows where the line will hold can shoot more freely." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would make a fine sparring partner for my braves. Bring it to the ring someday, if you trust me with it." },
      },
      choices = {
        { text = "I'll train beside the warriors, Ker.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Warriors can learn my ways, not I theirs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They count, and I'd be a fool to say otherwise, but my warriors are too big to be silent and too proud to be quick. So we stand in front where the enemy can see us, and you can do whatever it is you do behind them." },
      },
      choices = {
        { text = "Standing in front takes courage. I respect that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The enemy you can't see is the one who wins.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why must strength be careful?", next = "careful" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They're trained to fight whatever threatens the herd, and a demon off its leash would qualify. I'll not hide that some of my warriors look at your kind and think of the Burning Blade, so be glad the Warchief speaks for you, warlock." },
      },
      choices = {
        { text = "I'm grateful for his word. I'll keep my demon leashed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't need the Warchief's word to defend myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who do the warriors fight?", next = "fight" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "None that I've heard of, because the Grimtotem hold to the old shamans and sneer at what Hamuul learned from the night elves. They'd say a tauren who borrows a stranger's teachings has forgotten the herd, and I'd say a tauren who turns his spear on his own kin has forgotten more." } },
      choices = {
        { text = "Our own old ways should come first, before borrowed ones.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Learning from the night elves made us stronger, not weaker.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "By standing behind the warriors and burning whatever tries to get past them, which is all a warrior ever asks. The centaur raid the edges of Mulgore and they've learned to fear fire, so use it on them and not on the grass." },
      },
      choices = {
        { text = "I'll protect the herd, Ker.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll protect myself first. The herd can follow.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. A tauren's strength is great, and so is the Light, I'm told. Both must be used carefully." },
        { id = "h_default", key = true, text = "I am Ker Ragetotem, and I train the warriors who guard Thunder Bluff. A tauren's strength is great, so we must learn to use it carefully." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Come for more training, warrior? Good, because the centaur do not rest, and neither should we." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, then. Your strength comes from outside you, so you must learn to carry it even more carefully than a warrior does." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior comes back to Ragetotem's ring. Good, because strength without care only breaks things, and I've more care to teach." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter in the warriors' ring. Come in, then, because the braves of the bluffs could use a lesson in patience from you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, for my students learn to take a blow before they learn to give one, and someone must patch them up afterward." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll stand as a bear before the herd one day, so you're closer to my warriors than you know, and I'll expect the same restraint of you that I expect of them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. Strength is for protecting the herd, and magic is strength too, of a sort, so I'll expect you to use it that way." },
        { id = "h_grim", when = { origin = "tauren_grimtotem_born" }, text = "You were born Grimtotem, and the whole city knows it, so I'll say plainly that you're welcome in my ring. Your old kin will come for you one day because you left, and I mean you to be standing when they do." },
        { id = "h_walk", when = { origin = "tauren_long_migration" }, text = "You walked out of the Barrens with the rest of us, young one, and you'll remember the centaur better than my students do. Stand firm, then, because you know already what it costs when the herd breaks." },
      },
      choices = {
        { text = "Should a priest stand in the line beside your warriors, Ker?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Who do the warriors fight?", next = "fight" },
        { text = "Why must strength be careful?", next = "careful" },
        { text = "Does a shaman need a warrior's training, Ker?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Strength isn't everything. Speed and silence count too.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "How should a warrior use great strength, Ker?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do warriors and hunters train together here, Ker?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Are your warriors trained to fight demons?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the Grimtotem have druids of their own, Ker?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "How can a mage protect the herd, Ker?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Must the Light be used carefully, Ker?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
      again = { { id = "h_again", text = "Ask what you will. A warrior should understand before he swings." } },
    },
    fight = {
      lines = { { id = "f_default", text = "The centaur have hunted our people for generations, and only with the orcs' help did we finally drive them from Mulgore. Now the quilboar and the Venture Company test our borders instead." } },
      choices = { { text = "Will the centaur return?", next = "fight_return" } },
    },
    fight_return = {
      lines = { { id = "fr_default", text = "They are in the Barrens still, and in Desolace, and they remember us as well as we remember them. One day they will try, and on that day I want my students ready." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    careful = {
      lines = { { id = "c_default", text = "Because a tauren who loses his temper can kill a friend as easily as a foe. Cairne taught us that strength without restraint is only another kind of beast." } },
      choices = {
        { text = "Restraint is a warrior's real strength.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some foes deserve no restraint at all.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every shaman who guards the herd stands close enough to be struck, so yes, learn to take a blow. The Grimtotem out in Stonetalon have shamans of their own, and they won't hesitate to turn the earth on our braves." } },
      choices = {
        { text = "I'll learn to stand and take a blow for the herd.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A wise shaman shouldn't be close enough to be hit.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I am a warrior, not an elder. Ask on Elder Rise." } },
  },
}
