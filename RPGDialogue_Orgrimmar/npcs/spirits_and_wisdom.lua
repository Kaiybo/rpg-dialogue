-- The Valley of Spirits and the Valley of Wisdom: the priest, mage and shaman trainers,
-- the first aid trainer and the herbalist. Vol'jin and Kardris are in their own files.
-- Voices: bibles/<key>.md for each.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Ur'kyo: the Darkspear priest trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "urkyo", id = TODO_NPC("Ur'kyo"), name = "Ur'kyo", title = "Priest Trainer",
  bible = "bibles/urkyo.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "wise", "devout" },
  notices = { "class", "form" },
  impression = {
    first = "Ur'kyo trains priests in the Valley of Spirits and speaks of the loa and the Light as if they were neighbours who don't get along. He is patient, amused and hard to surprise, and he keeps an offering bowl at his feet that anyone may drop something into.",
    third = "{name} met Ur'kyo, the Darkspear priest trainer in Orgrimmar's Valley of Spirits.",
  },
  greetings = {
    { id = "g_hi", text = "The spirits be quiet today, mon. Come and sit, and let's see if they wake up for you." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "A Forsaken priest, and you still pray. That be the strangest thing in this whole valley, and I like it." },
    { id = "g_bowl", text = "Drop something in the bowl if you like, mon, a coin or a button or a bad memory, because the spirits not be fussy." },
  },
  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "You wear the shadow like a cloak, mon, and it suits you a little too well. Take it off now and then, so you remember what you look like." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ur'kyo, and I teach priests, mon, whatever they be praying to. The Light, the shadow, the loa, they all answer if you ask properly, and they all want something back." },
        { id = "h_troll", when = { race = "Troll" }, text = "Ur'kyo, and you be Darkspear, so you already know the loa be listening. Let's see what else you can learn." },
      },
      again = {
        { id = "h_again", text = "What else, mon? The spirits have time, and so do I." },
        { id = "h_again2", text = "Go on, mon, ask. The loa be terrible gossips, and they love a good question." },
      },
      choices = {
        { text = "Do the loa and the Light get along?", next = "loa" },
        { text = "What do the spirits want back?", next = "want" },
        { text = "What's that bowl by your feet?", next = "bowl" },
        { text = "Can you tell which spirit watches over me?", next = "watching" },
        { text = "Teach me, Ur'kyo.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Farewell, Ur'kyo.", next = "END" },
      },
    },
    loa = {
      lines = { { id = "lo_default", text = "They be like two old women at the same market, mon, polite to each other's faces and grumbling behind their backs. I don't take sides, I just listen to whichever one be talking loudest." } },
      choices = {
        { text = "Which one talks loudest?", next = "loudest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loudest = {
      big = true,
      lines = { { id = "ld_default", text = "The shadow, these days, because it always has something to say and it never runs out of words. But the Light be the one that heals, and a priest who forgets that ends up talking to himself in the dark." } },
      choices = {
        { text = "Healing matters most. I'll keep to the Light.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The shadow has power. I'll listen to it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    want = {
      lines = { { id = "wa_default", text = "Respect, mostly, and a little bit of your time. The loa want offerings, the Light wants you to be good, and the shadow wants you to keep coming back, which be the dangerous one." } },
      choices = {
        { text = "I'm a priest. What do I owe them?", next = "want_priest", when = { class = "PRIEST" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    want_priest = {
      lines = { { id = "wp_default", text = "More than the others, mon, because you be asking every day. And pray quietly, because the ones who shout their prayers be mostly trying to be heard by the people around them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bowl = {
      lines = { { id = "bo_default", text = "Offerings, mon, for whichever spirit be hungry today. Last week somebody left a goblin's IOU in there, and I think the loa be still laughing about it." } },
      choices = {
        { text = "What's the strangest offering you've had?", next = "bowl_strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bowl_strange = {
      lines = { { id = "bs_default", text = "A Forsaken once left his own finger, very politely, and told me he didn't need it any more. I gave it back to him, mon, because some gifts be too generous even for the loa." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watching = {
      lines = { { id = "wt_default", text = "Maybe, mon, but it be much easier if you just tell me. When things go very bad and nobody be looking, who do you call on?" } },
      choices = {
        { text = "The Light. Always the Light.", next = "watch_light", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "The loa, the way my grandmother did.", next = "watch_loa", when = { race = "Troll" }, fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "The Earthmother.", next = "watch_earth", when = { race = "Tauren" }, fx = { trait = { pious = 1 } } },
        { text = "Nobody answered when I died.", next = "watch_dead", when = { race = "Scourge" }, fx = { trait = { skeptical = 1 } } },
        { text = "Nobody. I get myself out.", next = "watch_self", fx = { trait = { independent = 1 } } },
      },
    },
    watch_light = {
      lines = { { id = "wl_default", text = "Then the Light be hearing you, mon, and it be a good listener, though it doesn't laugh much. Keep it company, but say hello to the loa now and then so they don't sulk." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch_loa = {
      lines = { { id = "wo_default", text = "Good, mon, then your grandmother taught you right. The loa remember who calls them, and they remember who stops." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch_earth = {
      lines = { { id = "we_default", text = "The Earthmother be a big quiet one, mon, and she never gossips with the loa, which they don't like at all. Keep her close, because she be steadier than most." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch_dead = {
      lines = { { id = "wd_default", text = "Then you be calling now, mon, and that be the start of something. The dead make the most interesting people to pray with, because they already know what be waiting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch_self = {
      lines = { { id = "ws_default", text = "Ha! A lot of people say that, mon, right up until the night they can't. When that night comes, call somebody, and don't be too proud about who answers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask the loa about that, mon, because they gossip more than me. Then come back and tell me what they said, since they never tell me anything good." } },
  },
}

---------------------------------------------------------------------------
-- Uthel'nay: the Darkspear mage trainer of the Darkbriar Lodge.
---------------------------------------------------------------------------
P:NPC {
  key = "uthelnay", id = TODO_NPC("Uthel'nay"), name = "Uthel'nay", title = "Mage Trainer",
  bible = "bibles/uthelnay.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "sharp" }, values = { "ambitious", "curious" },
  notices = { "arcane", "class" },
  impression = {
    first = "Uthel'nay teaches magic in the Darkbriar Lodge in the Valley of Spirits and has no patience at all for slow students. She expects the Horde's mages to match any in Dalaran, she says so often, and her curtains are always slightly singed.",
    third = "{name} met Uthel'nay, a Darkspear mage trainer in Orgrimmar's Valley of Spirits.",
  },
  greetings = {
    { id = "g_hi", text = "Speak quick, mon, I've got students setting fire to the curtains again." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, maybe this time you'll remember what I taught you." },
    { id = "g_smoke", text = "If you smell smoke, mon, don't tell me about it, because I already know." },
    { id = "g_troll_mage", when = { race = "Troll", class = "MAGE" }, text = "A Darkspear mage! Good, stand up straight, because the Forsaken be watching and I won't have them thinking we be slow." },
  },
  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "Your fingers be twitching, mon. Too much arcane and not enough sleep will do that, so go and rest before you blow something up." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock in my lodge, and I can smell the brimstone from here. Don't touch anything, mon, and especially not the books." },
  },
  start = "hello",
  nodes = {
    xorig_vstud = {
      lines = { { id = "xvs_default", text = "Ha! Let them look, mon, because there be nothing green in there but your own stubbornness. Your people learned their magic from demons, so of course they worry, but the arcane be older than any demon and it only ask for your patience. Are you patient?" } },
      choices = {
        { text = "Not very, but I'm learning.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "More than my clan thinks.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xorig_vmage = {
      lines = { { id = "xvm_default", text = "You say that like you expect me to argue, mon, but I been saying it to orcs for years and they just walk faster. The witch doctors and the Kirin Tor pull at the same threads, only one of them writes it all down. Which of them taught you more?" } },
      choices = {
        { text = "The witch doctors. The books came later.", next = "BACK", fx = { affinity = 1 } },
        { text = "The books. The witch doctors just laughed at me.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Uthel'nay, and I teach mages in the Darkbriar Lodge. The humans in Dalaran think nobody else knows magic, and I mean to prove them wrong one student at a time." },
        { id = "h_forsaken", when = { race = "Scourge", class = "MAGE" }, text = "Uthel'nay, and you be one of the Forsaken who studied in Dalaran before you died, I think. Don't tell me they taught you better, mon, because they didn't." },
      },
      again = {
        { id = "h_again", text = "Anything else, mon? Quickly, quickly." },
        { id = "h_again2", text = "Ask, mon, and don't dawdle, because a slow question be a waste of a fast mind." },
      },
      choices = {
        { text = "What do you think of Dalaran?", next = "dalaran" },
        { text = "Magic sounds dangerous.", next = "danger" },
        { text = "Why are your curtains burned?", next = "curtains" },
        { text = "What do you make of the shamans?", next = "shamans" },
        { text = "Teach me, Uthel'nay.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "My clan still checks my eyes for green, Uthel'nay.", next = "xorig_vstud", when = { origin = "orc_valley_of_spirits_student" } },
        { text = "Mojo and arcane come from the same place, Uthel'nay.", next = "xorig_vmage", when = { origin = "troll_valley_of_spirits_mage" } },
        { text = "Farewell, Uthel'nay.", next = "END" },
      },
    },
    dalaran = {
      lines = { { id = "da_default", text = "A city full of humans who think they invented magic, mon, and then hid behind a big wall when the Scourge came. They be clever, I'll give them that, but clever isn't the same as wise." } },
      choices = {
        { text = "I studied in Dalaran, once.", next = "dalaran_forsaken", when = { race = "Scourge", class = "MAGE" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_forsaken = {
      lines = { { id = "df_default", text = "Then you know how they look down their noses at everyone, mon, and you know they didn't save you when it counted. You be one of mine now, so stop sounding homesick." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "dg_default", text = "Very, mon, so I don't teach fools. Too much arcane and you start wanting more and more, and then one day you be hungry for nothing else, and that be the end of you." } },
      choices = {
        { text = "You sound like you've seen that happen.", next = "danger_seen" },
        { text = "Then why teach it at all?", next = "teach_why" },
        { text = "Warlocks handle power better than mages.", next = "danger_warlock", when = { class = "WARLOCK" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_seen = {
      big = true,
      lines = { { id = "ds_default", text = "Once, to a student who wouldn't stop, even when his hands shook and his eyes went pale. He left for the north looking for more power, and I never heard from him again, which be the best thing I can say." } },
      choices = {
        { text = "Magic needs limits. Discipline keeps you alive.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power should be pursued, whatever the cost.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_warlock = {
      lines = { { id = "dw_default", text = "Warlocks handle power the way a drunk handles a cliff, mon, very confidently and only once. Go back to the Cleft before you touch something of mine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teach_why = {
      lines = { { id = "tw_default", text = "Because somebody has to, mon, and better me than some warlock in the Cleft. Now you tell me, and quickly, why does someone like you want power at all?" } },
      choices = {
        { text = "To protect the people I care about.", next = "pw_protect", fx = { trait = { kind = 1 } } },
        { text = "To be the best. Nothing less will do.", next = "pw_best", fx = { affinity = 1, trait = { ambitious = 1 } } },
        { text = "Curiosity. I want to know how it works.", next = "pw_curious", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },
    pw_protect = {
      lines = { { id = "pp_default", text = "A good answer, mon, and a slow one, because protecting people takes years of very boring practice. You'll manage it, if you don't get bored first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pw_best = {
      lines = { { id = "pb_default", text = "Ha, now that be my kind of answer! Be the best, mon, but be the best and alive, because the dead ones don't get to brag." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pw_curious = {
      lines = { { id = "pc_default", text = "Curious be good, mon, because curious be how I started. Just remember that the arcane be curious about you too, and it be much hungrier." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    curtains = {
      lines = { { id = "cu_default", text = "My students, mon, every season, and always the same spell. One fireball too eager and there go the curtains, and then I walk down to the Drag and buy new ones from Magar, who has stopped asking." } },
      choices = {
        { text = "Why not stop hanging curtains?", next = "curtains_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    curtains_why = {
      lines = { { id = "cw_default", text = "Because a mage who can't cast in a room with curtains can't cast in a room with people, mon. When a student stops burning them, I know that one be ready." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shamans = {
      lines = { { id = "sh_default", text = "Searn and his kind ask the fire nicely and wait for it to answer, mon, which be very polite and very slow. I tell the fire what to do, and it does it, and we both get on with our day." } },
      choices = {
        { text = "I'm a shaman. We don't need to ask twice.", next = "shaman_reply", when = { class = "SHAMAN" } },
        { text = "Searn has a point. Fire bites back.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "You're right. It's only fire.", next = "BACK", fx = { affinity = 1, trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman_reply = {
      lines = { { id = "sr_default", text = "Then you be a better shaman than Searn, or a worse one, and I can't tell which from here. Go and argue it out with him, mon, because I've got students to shout at." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That be a waste of a good question, mon, and I haven't got time for those. Quickly, ask me about magic instead." } },
  },
}

---------------------------------------------------------------------------
-- Searn Firewarder: a shaman trainer in the Valley of Wisdom.
---------------------------------------------------------------------------
P:NPC {
  key = "searn", id = TODO_NPC("Searn Firewarder"), name = "Searn Firewarder", title = "Shaman Trainer",
  bible = "bibles/searn.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "fierce" }, values = { "proud", "devout" },
  notices = { "class" },
  impression = {
    first = "Searn Firewarder trains shamans in the Valley of Wisdom and speaks of fire as if it were an old friend with a temper. He is warmer than his name, though not by much, and he never lets the brazier beside him burn low.",
    third = "{name} met Searn Firewarder, a shaman trainer in Orgrimmar's Valley of Wisdom.",
  },
  greetings = {
    { id = "g_hi", text = "The fire spirits are restless today, so stand back from the brazier, if you value your eyebrows." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "A shaman, come to learn more. Good, because the elements always have more to teach." },
    { id = "g_brazier", text = "Come in, but mind the brazier, because it has burned since this city's first wall went up and I'll not have you kick it over." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage, so keep your hands at your sides in here, because the fire spirits remember every fireball." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the stink of the Cleft on you, warlock. The fire spirits don't like it, and neither do I." },
  },
  start = "hello",
  nodes = {
    xorig_lapsed = {
      lines = { { id = "xlp_default", text = "Fire forgives nothing, but it does forget, if you feed it honestly for long enough. The anger that still reaches for fel is the same anger fire answers to, so give it to the flame before the old craft can take it. Do you feel the itch often?" } },
      choices = {
        { text = "Every time I'm angry, Searn.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Less than I used to.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Searn Firewarder, and I teach shamans to speak with the elements, though fire is the one I know best. Fire is honest, because it shows you exactly what it wants and burns you if you don't listen." },
        { id = "h_orc", when = { race = "Orc", class = "SHAMAN" }, text = "Searn Firewarder, and you're an orc shaman, so you'll know our people forgot the spirits once and paid for it. We won't forget them again, not while I'm teaching." },
      },
      again = {
        { id = "h_again", text = "What else? The fire is waiting." },
        { id = "h_again2", text = "Speak, then, and keep it short, because the coals are settling." },
      },
      choices = {
        { text = "Why fire, of all the elements?", next = "fire" },
        { text = "What happened when the orcs forgot the spirits?", next = "forgot" },
        { text = "Why does that brazier matter so much?", next = "brazier" },
        { text = "What do you make of the mages?", next = "mages" },
        { text = "Teach me, Searn.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "I was a warlock's apprentice once, Searn. Will fire forgive me?", next = "xorig_lapsed", when = { origin = "orc_lapsed_warlock_shaman" } },
        { text = "Farewell, Searn.", next = "END" },
      },
    },
    fire = {
      lines = { { id = "fi_default", text = "Because fire cleanses, and the orcs needed cleansing after the demon blood. It burned the old poison out of us, and it reminded us that some things can't be tamed, only respected." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forgot = {
      lines = { { id = "fo_default", text = "The warlocks came, and they offered power that didn't ask for respect, so our people took it and turned green. The spirits went silent for a whole generation, and only the Frostwolves kept the old ways until Thrall brought them home to the rest of us." } },
      choices = {
        { text = "The warlocks in the Cleft must trouble you.", next = "warlocks" },
        { text = "My family fought in the old Horde. I carry that.", next = "forgot_orc", when = { race = "Orc" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forgot_orc = {
      lines = { { id = "fr_default", text = "Many of us do, and the fire doesn't hold it against you, so don't hold it against yourself. Carry it like a scar, and let it remind you, but never let it rule you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warlocks = {
      big = true,
      lines = { { id = "wa_default", text = "Every day, and every day the Warchief tells me they're useful, and every day I swallow my words. I don't trust them, but I trust Thrall, so I watch and I wait." } },
      choices = {
        { text = "The Warchief knows best. Trust his judgement.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some dangers shouldn't be tolerated, whatever the Warchief says.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brazier = {
      lines = { { id = "br_default", text = "I lit it from a cookfire on the day the first wall of Orgrimmar went up, and I've fed it every morning since. A people who let their fire go out once should be careful about letting it happen again." } },
      choices = {
        { text = "May I stand close to it?", next = "brazier_close" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brazier_close = {
      lines = { { id = "bc_default", text = "Go on, stand there and be still a moment, and tell me what you feel. Don't give me the answer you think I want to hear." } },
      choices = {
        { text = "Warmth, and a little welcome.", next = "bc_warm", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Heat, and nothing else.", next = "bc_nothing", fx = { trait = { skeptical = 1 } } },
        { text = "It feels like it's watching me.", next = "bc_watch", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "I feel it answering me.", next = "bc_shaman", when = { class = "SHAMAN" }, fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    bc_warm = {
      lines = { { id = "bw_default", text = "Then it likes you, and it doesn't like everyone, so take that with you. Come and stand by it again when this city has been hard on you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bc_nothing = {
      lines = { { id = "bn_default", text = "Then you're not listening yet, or it isn't talking to you yet, and either one can change. Fire is patient with those who keep coming back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bc_watch = {
      lines = { { id = "bt_default", text = "It is, and it's deciding about you, the way it decided about me when I was young and angry. Don't flinch, and it may make up its mind in your favor." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bc_shaman = {
      lines = { { id = "bs_default", text = "Good, then it knows your name already, and it'll know it in the Barrens and the mountains too. Never take that for granted, because the spirits once left my people for less." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mages = {
      lines = { { id = "ma_default", text = "They throw fire the way a peon throws stones, without asking it first and without thanking it after. Uthel'nay's students set her curtains alight every season, and I can hear the fire spirits laughing about it from here." } },
      choices = {
        { text = "I'm a mage. Fire does what I tell it.", next = "mages_mage", when = { class = "MAGE" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mages_mage = {
      lines = { { id = "mm_default", text = "It does, for now, the way a wolf does what you tell it until the day it's hungry. Respect it a little, mage, and it may still be on your side when you need it most." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The fire hasn't shown me that, and I don't guess at what it hasn't shown me. Ask again when the coals are hotter." } },
  },
}

---------------------------------------------------------------------------
-- Arnok: the first aid trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "arnok", id = TODO_NPC("Arnok"), name = "Arnok", title = "First Aid Trainer",
  bible = "bibles/arnok.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk" }, values = { "kind", "practical" },
  notices = { "craft", "weary" },
  impression = {
    first = "Arnok teaches first aid and spends most of his time patching up grunts from the training yards. He is kind, quick and tired of seeing the same wounds every day, and he keeps a chalk tally of every one on his wall.",
    third = "{name} met Arnok, who teaches first aid in Orgrimmar.",
  },
  greetings = {
    { id = "g_hi", text = "If you're bleeding, sit down, and if you're not, stand over there and wait your turn." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece, I see. The grunts I patch up are rarely so lucky twice." },
    { id = "g_tally", text = "Don't lean on that wall, because those chalk marks are every grunt I've patched this season and I'm not counting them twice." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior, so you'll be back on my bench before long. I'll keep the linen ready for you." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You've got the grey look of someone who just came back from the spirit healer. Sit for a moment before you go anywhere." },
    { id = "n_fa", cat = "craft", when = { profession = { name = "First Aid", min = 100 } },
      text = "Your bandages are tighter than they were. Good, because a loose bandage is worse than none at all." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Arnok, and I teach first aid to anyone who wants to keep their friends alive. Most of my days go to patching up grunts from the Valley of Honor, so if you're here to learn, you'll have plenty of practice." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got a grunt bleeding in the corner." },
        { id = "h_again2", text = "Go on, but if you start bleeding while we talk, say so before you sit on anything." },
      },
      choices = {
        { text = "What's the worst wound you've treated?", next = "worst" },
        { text = "Why should anyone learn first aid?", next = "why" },
        { text = "What are all those chalk marks?", next = "tally" },
        { text = "You look tired. What wears you down?", next = "peeve" },
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Farewell, Arnok.", next = "END" },
      },
    },
    worst = {
      lines = { { id = "wo_default", text = "A grunt who tried to catch a thrown axe with his bare hands, during a training match, to impress a girl. He kept the hand, just barely, and she married somebody else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "wh_default", text = "Because shamans and priests can't be everywhere, and a bandage costs less than a funeral. Every orc who learns to tie a proper knot saves a life someday, even if it's only his own." } },
      choices = {
        { text = "Every grunt should be made to learn.", next = "everyone" },
        { text = "I can heal with a prayer. Why bandage?", next = "why_healer", when = { class = { "PRIEST", "SHAMAN" } } },
        { text = "My bandages are getting good, you know.", next = "fa_good", when = { profession = { name = "First Aid", min = 150 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_healer = {
      lines = { { id = "wy_default", text = "Then you know how tired you get, and how many grunts there are, and how few of you. Learn to tie a bandage anyway, because one day your prayers will run out before the bleeding does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fa_good = {
      lines = { { id = "fg_default", text = "Then show me, and if the knot holds when I pull it, I'll believe you. Tight, flat and clean is the whole craft, and most people only manage two of the three." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    everyone = {
      big = true,
      lines = { { id = "ev_default", text = "I've asked Overlord Runthak a dozen times, and he says the grunts have enough to learn already. I say they'd learn faster if they weren't bleeding all the time, but nobody listens to the bandage man." } },
      choices = {
        { text = "Make it law. Every grunt should know first aid.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let each grunt choose. Nobody likes being told.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tally = {
      lines = { { id = "ta_default", text = "Every grunt I've patched since the spring, one mark each, and a second mark for the ones who came back with the same wound. That crowded corner is all Grezz's recruits." } },
      choices = {
        { text = "Do you ever wipe it clean?", next = "tally_clean" },
        { text = "Is there a mark for me up there?", next = "tally_me", when = { class = "WARRIOR" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tally_clean = {
      lines = { { id = "tc_default", text = "At the end of every season, and I always stand and look at it first. Every mark on that wall is a grunt who walked out of here, and I like to remember that before the next lot comes in." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tally_me = {
      lines = { { id = "tm_default", text = "Not yet, but give it a week of training with Grezz and there'll be one by the door. I keep that spot for warriors, because they always come back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    peeve = {
      lines = { { id = "pe_default", text = "A grunt who takes off a perfectly good bandage to show his friends the wound, and then comes back to me surprised when it goes bad. Be truthful now, have you ever done that?" } },
      choices = {
        { text = "Never. I leave them on until they're done.", next = "pv_good", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Once or twice. Scars impress people.", next = "pv_show", fx = { affinity = -1, trait = { proud = 1 } } },
        { text = "I let the priests heal me instead.", next = "pv_priest", fx = { trait = { practical = 1 } } },
      },
    },
    pv_good = {
      lines = { { id = "pg_default", text = "Good, then you're the first sensible thing I've seen today. Tell your friends, though they won't listen to you either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pv_show = {
      lines = { { id = "ps_default", text = "They impress people right up until they turn green, and then the only one impressed is me, by the smell. Leave the bandage on, and show off the scar once it's a scar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pv_priest = {
      lines = { { id = "pp_default", text = "Priests are a fine thing when there's one nearby, and there never is when you need one. Learn to tie a bandage, and you won't have to wait for anybody." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know about that, and I've no time to find out between grunts. I know blood and bandages, and that's enough for one orc." } },
  },
}

---------------------------------------------------------------------------
-- Jandi: the herbalism trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "jandi", id = TODO_NPC("Jandi"), name = "Jandi", title = "Herbalism Trainer",
  bible = "bibles/jandi.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "patient", "kind" },
  notices = { "craft" },
  impression = {
    first = "Jandi teaches herbalism in the Valley of Spirits and always has dirt under the fingernails. Jandi treats every plant like a small, stubborn patient, and gives every seedling in the shop a name.",
    third = "{name} met Jandi, the herbalism trainer in Orgrimmar's Valley of Spirits.",
  },
  greetings = {
    { id = "g_hi", text = "Watch your feet, mon, there be seedlings everywhere." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and you smell of the Barrens. You've been picking peacebloom, I can tell." },
    { id = "g_seedling", text = "Say hello to Little Karolek by the door, mon, he be the prickly one, and don't step on him." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "A tauren! Come in, come in, mon, and tell me what be growing in Mulgore this season." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { name = "Herbalism", min = 100 } },
      text = "You pull the roots out with the leaves, mon, I can see it on your hands. Leave the roots, and the plant grows back for the next one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jandi, and I teach herbalism, mon. Durotar be a hard land for plants, so every one that grows here be stubborn, and the stubborn ones make the strongest medicine." },
      },
      again = {
        { id = "h_again", text = "Anything else, mon? The seedlings need water." },
        { id = "h_again2", text = "Ask, mon, but softly, because the silverleaf be sleeping." },
      },
      choices = {
        { text = "What grows in Durotar?", next = "durotar" },
        { text = "Do you sell to the alchemists?", next = "alchemists" },
        { text = "Do those seedlings have names?", next = "names" },
        { text = "Who taught you about plants?", next = "grandmother" },
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "Farewell, Jandi.", next = "END" },
      },
    },
    durotar = {
      lines = { { id = "du_default", text = "Peacebloom and silverleaf, mostly, and earthroot if you know where to dig. Not much, mon, but enough, and the tauren bring better herbs from Mulgore if you ask them nicely." } },
      choices = {
        { text = "Which herb is hardest to find here?", next = "hardest", when = { profession = { name = "Herbalism" } } },
        { text = "Mulgore's herbs are better, it's true.", next = "mulgore", when = { race = "Tauren" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = { { id = "hd_default", text = "Earthroot, mon, because it hides under the rocks and it be the same color as the dirt. Look where the ground be cracked and a little damp, and dig with your fingers, not your knife." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mulgore = {
      lines = { { id = "mu_default", text = "Better and greener, mon, and you tauren be too polite to say so to my face, so thank you for saying it. Bring a little mageroyal next time you go home, and I'll grow it in a pot by the door and see if it sulks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alchemists = {
      lines = { { id = "al_default", text = "To Yelmak on the Drag, mostly, though I don't always like what becomes of my herbs in that shop. A plant be meant to heal, mon, and some of those potions turn grunts blue." } },
      choices = {
        { text = "Herbs should only be used for healing.", next = "heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal = {
      big = true,
      lines = { { id = "he_default", text = "That be what I believe, mon, but the world needs fire potions too, I suppose. I just wish the alchemists would ask the plants first, the way my grandmother taught me." } },
      choices = {
        { text = "Herbs should heal. That's their purpose.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A weapon is a weapon, even if it grows.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    names = {
      lines = { { id = "na_default", text = "Every one, mon, because a plant with a name gets watered on time. That prickly earthroot be Karolek, because it won't grow where I tell it, and the one leaning toward the door be Felika, because she always be watching for customers." } },
      choices = {
        { text = "Do they know they have plants named after them?", next = "names_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    names_know = {
      lines = { { id = "nk_default", text = "Karolek knows, and he grunted at me, which I think be the nicest thing he ever said. Felika asked if she could sell cuttings of herself, so she missed the point entirely, mon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grandmother = {
      lines = { { id = "gr_default", text = "My grandmother, on the Echo Isles, before Zalazane went mad and we had to leave them. She taught me to ask a plant before I pick it, to thank it after, and never to take the last one." } },
      choices = {
        { text = "Do you still ask them?", next = "ask_plants" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask_plants = {
      lines = { { id = "ap_default", text = "Every time, mon, out loud, and the grunts on the road laugh at me for it. What about you, when you pick a herb, do you thank it?" } },
      choices = {
        { text = "I do, now that you mention it.", next = "ap_yes", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "My grandmother taught me the same.", next = "ap_troll", when = { race = "Troll" }, fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "I'll start. It can't hurt.", next = "ap_start", fx = { trait = { patient = 1 } } },
        { text = "It's a weed. It doesn't hear me.", next = "ap_no", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    ap_yes = {
      lines = { { id = "ay_default", text = "Good, mon, then the plants be talking about you kindly, and they remember. The silverleaf will feel a little easier to find from now on, even if that be only in your head." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ap_troll = {
      lines = { { id = "at_default", text = "Then she and mine might have picked the same hills, mon, back on the islands. Keep doing it, and teach the young ones, because they be forgetting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ap_start = {
      lines = { { id = "as_default", text = "It can't, mon, and it costs you nothing but a breath. Grandmother always said a thankful hand be a gentle one, and gentle hands leave the roots." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ap_no = {
      lines = { { id = "an_default", text = "Maybe it doesn't, mon, but you hear yourself, and dat be the point of it. A picker who never says it pulls up everything and then wonders why the hills be bare." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That be no plant I know, mon, so I can't help you. Ask me about roots and leaves, and I'll talk until the seedlings need water." } },
  },
}
