-- Stonard's trainers: Kartosh the warlock trainer, Ogromm the hunter trainer, Grokor the pet trainer and Rogvar the alchemist. Voice: bibles/stonard_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kartosh", id = TODO_NPC("Kartosh"), name = "Kartosh", title = "Warlock Trainer",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "calm", "severe" }, values = { "disciplined", "wary" },
  notices = { "class" },

  impression = {
    first = "Kartosh teaches warlocks a mile from the Dark Portal and says the place keeps his students humble. He speaks softly, as if something in the room were listening, and he talks about the fel the way a jailer talks about his keys.",
    third = "{name} met Kartosh, the soft-spoken warlock trainer of Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Speak softly in this room, {class}. The things I teach about are listening, even when the students aren't." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A warlock. Sit down and tell me what you've bound lately, and whether it's still afraid of you." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, which means whatever you called up last time didn't eat you. That's a good start." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The Portal's glow shows on the clouds at night, if you know where to look to the south. I always know where to look." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "There's ash on your sleeves and brimstone in your hair. Either your imp has been careless with its fire, or you've been careless with your imp." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman at my door. The spirits turned away from my kind once, and with good reason, so I'll not ask you to come in." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kartosh, and I teach warlocks their craft, here where the old Horde's warlocks made the bargains that damned us. Your will isn't shaped for the forces I teach, {class}, but you may ask your questions." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "Kartosh. You know enough to be a danger to yourself, which is how every student arrives, so let's make you a danger to someone else instead. The Portal stands a short ride south of here to remind you what happens when we get that wrong." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "You'll tell me what my kind did to the elements, and you'll be right, so let's not spend the breath on it. Ask what you came to ask, shaman." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren. Your people took us in when we came to Kalimdor, and I'm told some of your elders asked what warlocks were for. I've never had a good answer for them, but I'm still working on one." },
        { id = "h_dead", when = { race = "Scourge" },
          text = "You've been dead, so you've seen things on the far side that my students only read about. Don't describe them in here, because the young ones would want to go and look." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down." },
        { id = "h_again2", text = "Go on. The demons aren't the only ones in Stonard with patience." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Why teach warlocks here, of all places?", next = "place" },
        { text = "What's the first thing you teach?", next = "lesson" },
        { text = "What do you make of Greshka?", next = "greshka" },
        { text = "Do you know Fel'zerul, who watches the temple?", next = "felzerul" },
        { text = "How do I keep my demons in hand?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The elements remember what your kind did, Kartosh.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I'll leave you to your lessons.", next = "END" },
      },
    },

    place = {
      lines = {
        { id = "pl_default", text = "The Dark Portal stands in the Blasted Lands to the south, and every warlock in the Horde wants to see it once, to stand where Gul'dan's council opened the way. Better they come through Stonard first and hear what I have to say before they go and look." },
      },
      choices = {
        { text = "What do you tell them?", next = "place_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    place_tell = {
      lines = {
        { id = "pt_default", text = "That the land out there is dead because of what our people did, and that the demons still wandering it were once called friends by orcs who thought they'd be rewarded. Then I let them go and look, and most of them come back much quieter than they left." },
      },
      choices = {
        { text = "The old warlocks were traitors. Their craft should die with them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Their mistake was trusting demons, not wielding the power.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lesson = {
      lines = {
        { id = "le_default", text = "Humility comes first, then control, and only after both of those comes power. The young ones want them in the opposite order, and Greshka sells to them in that order, which is why I teach and she doesn't." },
        { id = "le_lock", when = { class = "WARLOCK" },
          text = "Humility, then control, then power, and you'll want to skip the first two as every student does. Don't, because I've seen what's left of the ones who did." },
      },
      choices = {
        { text = "Isn't humility a strange lesson for a warlock?", next = "lesson_humble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson_humble = {
      lines = {
        { id = "lh_default", text = "It's the strangest lesson and the most needed, because the moment a warlock believes his demon serves out of fear, the demon starts to plan. I've buried students who forgot that, and there's more of this swamp in their graves than there is of them." },
      },
      choices = {
        { text = "Strict rules keep a warlock alive. I'd follow yours.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules are for the timid. A real warlock finds his own way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    greshka = {
      lines = {
        { id = "gr_default", text = "She's clever, and she knows her grimoires better than anyone south of Orgrimmar, but she'd sell a felhunter's lessons to a child if the child had the silver. We disagree about that quietly, and Karakul seats us at opposite ends of the hall." },
      },
      choices = {
        { text = "Isn't she right that power is just power?", next = "greshka_power" },
        { text = "Something else.", next = "BACK" },
      },
    },
    greshka_power = {
      lines = {
        { id = "gp_default", text = "Power is power the way fire is fire, and the fool who sets his own hut alight learns the difference between owning a fire and being owned by one. Greshka has never been burned, and that's exactly what worries me about her." },
      },
      choices = {
        { text = "Let the students choose their own risks. It's their fire.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Then her trade should be limited. The Warchief makes the laws.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    felzerul = {
      lines = {
        { id = "fe_default", text = "He's the Warchief's man, sent to watch the sunken temple, and some days he keeps the line Thrall drew for our kind better than I do. We don't talk much, because he thinks a teacher is a risk and I think a watcher is a waste, but I'd trust him at my back." },
      },
      choices = {
        { text = "What do you think is in that temple?", next = "felzerul_temple" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felzerul_temple = {
      lines = {
        { id = "ft_default", text = "Trolls who bargained with a blood god and sank for it, as far as I know and as far as I care. A warlock deals with demons who at least admit what they are, and I've always thought a god who demands that much blood is a demon with better manners." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll go and see for myself.", next = "END" },
      },
    },

    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "By never forgetting that the leash pulls at both ends. Speak to your demon as you would to a prisoner who's been promised a key, and never let it see you tired, frightened or pleased with yourself." },
      },
      choices = {
        { text = "Fear is all a demon understands. I'll rule mine with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll call on mine sparingly, and only for the Horde.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      big = true,
      lines = {
        { id = "xs_default", text = "They do, and they're right to, and I'll not argue with them or with you. I teach so that the next warlock who touches the fel knows exactly what it cost us, which is more than my own teachers ever told me." },
      },
      choices = {
        { text = "The Warchief allows your craft, so I'll respect his word.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Warchief or not, this craft should end with you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was young when the camps opened and old by the time they closed, and I learned this craft from someone who should never have been allowed to teach it. That's all the story you need." } },
    advice = { { id = "tp_ad", text = "If a demon ever thanks you, check your pockets, your soul and your back, in that order." } },
    _none = { { id = "tp_none", text = "That's nothing I teach, so it's nothing I'll discuss. Ask Karakul, who will discuss anything." } },
  },
}

P:NPC {
  key = "ogromm", id = TODO_NPC("Ogromm"), name = "Ogromm", title = "Hunter Trainer",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "curt", "gruff" }, values = { "patient", "proud" },
  notices = { "class", "pet" },

  impression = {
    first = "Ogromm trains Stonard's hunters and has no time for anyone else, though he'll talk tracks and tides all day with someone who carries a bow. He thinks Grokor spoils the beasts, and says so to anyone in earshot.",
    third = "{name} met Ogromm, the curt hunter trainer of Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Don't waste my time, {class}. If you've no bow and no beast, you've no business here." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, and with mud to the knee, so you've been out in the swamp already. Good, now we can talk." },
    { id = "g_back", when = { metBefore = true, class = "HUNTER" }, text = "Back again, and still in one piece. The swamp must be teaching you something, too." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} keeps its nose to the wind toward the Pool of Tears. It smells the jaguars over there, so trust it, because it's smarter than you about this swamp." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You'd make a fine quarry in cat shape, so don't go prowling round the hunters' camps after dark." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Ogromm, and I train hunters, which you are not. Ask your question quickly, because I've a swamp full of tracks to read and none of them are yours." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "Ogromm. I teach hunters to read this swamp, which is harder than reading any forest, because the water closes over a track before you've finished looking at it. Tell me what you need, and be quick about it." },
        { id = "h_tauren", when = { class = "HUNTER", race = "Tauren" },
          text = "A tauren hunter, raised on the open plains where a track stays in the dirt for days. The swamp will humble you, and I'll enjoy watching it, but you'll learn faster than most." },
        { id = "h_troll", when = { class = "HUNTER", race = "Troll" },
          text = "A Darkspear hunter. Your people hunted the jungle long before mine came to this world, so I'll not pretend I've much to teach you about wet ground, only about this particular wet ground." },
      },
      again = {
        { id = "h_again", text = "What else? The tracks are drying." },
        { id = "h_again2", text = "Ask, then, and keep it short." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you track anything in this swamp?", next = "tracking" },
        { text = "What's worth hunting out here?", next = "quarry" },
        { text = "You don't think much of Grokor, do you?", next = "grokor" },
        { text = "The swamp's not so different from home, Ogromm.", next = "xtroll", when = { race = "Troll", class = "HUNTER" } },
        { text = "I'm going.", next = "END" },
      },
    },

    tracking = {
      lines = {
        { id = "tr_default", text = "You don't track the prints, because the water swallows them, so you track the things the water can't hide. Broken reeds, frightened frogs, the way the birds go quiet ahead of something heavy, and the smell of a jaguar that's just been in the water." },
        { id = "tr_hunter", when = { class = "HUNTER" },
          text = "Forget the prints, because the water swallows them before you can kneel. Watch the reeds and the frogs, listen for the birds going quiet, and let your beast's nose do half the work, since it's better at this than you'll ever be." },
      },
      choices = {
        { text = "Who taught you that?", next = "tracking_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tracking_who = {
      lines = {
        { id = "tw_default", text = "The swamp did, mostly by letting me walk into crocolisks until I stopped. A hunter learns patience or he learns what the inside of a crocolisk looks like, and I've taught both lessons in my time." },
      },
      choices = {
        { text = "Patience is the whole craft. A hunter waits for the right shot.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sometimes you charge in and trust your instincts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    quarry = {
      lines = {
        { id = "qu_default", text = "Swamp jaguars for the skins, sawtooth crocolisks for the meat Tok'Kar's always short of, and the deathstrike tarantulas if you've a death wish. Leave the dragon whelps near the ruins to the green dragons, because I don't care to find out how their elders feel about it." },
      },
      choices = {
        { text = "Do you hunt for the town or for yourself?", next = "quarry_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarry_why = {
      lines = {
        { id = "qw_default", text = "For the town, and Dar sees that it's fed, and Thultash sells what's left. The old Horde hunted for sport and glory and left nothing standing behind it, and look how well that ended for everyone." },
      },
      choices = {
        { text = "Take only what the town needs. The swamp has to last.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The swamp's endless. Take what you like and sell the rest.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    grokor = {
      lines = {
        { id = "gk_default", text = "Grokor talks to the beasts as if they were children, and feeds them better than he feeds himself. I train the hunter and he trains the beast, which is fair, but I'd like the beasts to remember they're beasts." },
      },
      choices = {
        { text = "Is a coddled beast really worse in a fight?", next = "grokor_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grokor_fight = {
      lines = {
        { id = "gf_default", text = "No, and that's what annoys me most, because his beasts fight like demons and come when they're called. I've never told him so, and if you tell him I said it, I'll call you a liar to your face." },
      },
      choices = {
        { text = "Your secret's safe with me, Ogromm.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xtroll = {
      big = true,
      lines = {
        { id = "xt_default", text = "Then you'll do well here, but the jungle's beasts hunt you openly and these ones wait under the water for you to grow careless. What do the Darkspear do with a beast that's taken one of theirs?" },
      },
      choices = {
        { text = "We hunt it down, mon. A debt's a debt.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Nothing. It was hungry, and we were careless.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've hunted this swamp longer than most of Stonard's walls have been patched. That's all you'll get." } },
    advice = { { id = "tp_ad", text = "Never stand downwind of your quarry, and never stand at the water's edge with your back to the water." } },
    _none = { { id = "tp_none", text = "Don't waste my time with that. Ask about tracks or ask somebody else." } },
  },
}

P:NPC {
  key = "grokor", id = TODO_NPC("Grokor"), name = "Grokor", title = "Pet Trainer",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "warm", "patient" }, values = { "loyal", "gentle" },
  notices = { "pet", "class" },

  impression = {
    first = "Grokor trains hunters' beasts and looks at them before he looks at their owners. He rode wolves as a boy, before the camps, and he still talks about them the way other orcs talk about their old clans.",
    third = "{name} met Grokor, the gentle pet trainer of Stonard.",
  },

  greetings = {
    { id = "g_default", text = "If you've a beast with you, bring it closer so I can see it. If you haven't, you've come to the wrong orc." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "Let me look at your {pet} before you say a word, friend, because the beast tells me more than you will." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Let me see whether you've been feeding that beast properly." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} has mud to the shoulders and burrs in its coat. Brush it out tonight, because a beast that itches won't hold still in a fight." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Keep your demon away from the pens, warlock. The beasts can smell it, and they don't like what they smell." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Grokor, and I teach hunters' beasts what their masters can't. Jaguars, crocolisks and even the big spiders out past the Pool of Tears, I've trained them all, and every one of them learned faster than the hunter who brought it in." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "Grokor, and I teach your beast the things you can't, a harder bite, a thicker hide and a growl that makes an ogre think twice. Bring me a beast that trusts you and I'll send back one that keeps you alive." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid! You've worn more beasts' shapes than I've trained, so I'll not tell you your business, but you might tell me what the jaguars are thinking." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren. Your people raise kodos and mine raised wolves, and I've always thought we'd have a good deal to say to each other about it." },
      },
      again = {
        { id = "h_again", text = "What else? The beasts are dozing, so there's time." },
        { id = "h_again2", text = "Go on, I'm listening, and so is everything in the pens." },
      },
      choices = {
        { text = "Show me what you can teach my beast.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What does a beast actually learn from you?", next = "teach" },
        { text = "Which swamp beasts are worth taming?", next = "swamp" },
        { text = "How did you come to train beasts?", next = "past" },
        { text = "So, what are the jaguars thinking?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What would you ask a kodo herder, Grokor?", next = "xtauren", when = { race = "Tauren" } },
        { text = "Another time.", next = "END" },
      },
    },

    teach = {
      lines = {
        { id = "te_default", text = "Skills, which are only habits drilled until they stick. A beast learns to bite harder, to shrug off fire or frost, and to keep its feet when the ground gives way, and every lesson costs the beast effort and its master silver." },
      },
      choices = {
        { text = "Does the beast mind the lessons?", next = "teach_cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach_cost = {
      lines = {
        { id = "tc_default", text = "No more than you mind swinging an axe a thousand times, and it enjoys the praise far more than you would. The hunters who skimp on feeding are the ones whose beasts forget everything I taught them, and I can always tell." },
      },
      choices = {
        { text = "A companion eats before I do. That's only right.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast is a tool. It eats when it's earned it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    swamp = {
      lines = {
        { id = "sw_default", text = "Swamp jaguars first and best, because they're quick and quiet and they mind the water less than you'd think. The sawtooth crocolisks make a hard-shelled companion if a slow one, and some hunters fancy the deathstrike tarantulas, though I'd sooner not have one in my pens." },
      },
      choices = {
        { text = "Why not the spiders?", next = "swamp_spiders" },
        { text = "And the crocolisks along the shore?", next = "swamp_croc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swamp_spiders = {
      lines = {
        { id = "ss_default", text = "Because a spider never loves you, it only stops trying to eat you, and it's hard to teach a beast that doesn't care whether I'm pleased. Still, they're patient and their bite is poison, so I train them when I must." },
      },
      choices = {
        { text = "A beast doesn't need to love you, only obey you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Love's the only bond worth having with a beast.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    swamp_croc = {
      lines = {
        { id = "sc_default", text = "Tok'Kar on the beach will tell you the crocolisks are better eaten than tamed, and Dar sends hunters out for their flanks, so you'll not be popular for taming the cook's supper. Spare the young ones, though, because they grow into the big beasts I'd like to see." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll go and find one.", next = "END" },
      },
    },

    past = {
      lines = {
        { id = "pa_default", text = "I rode wolves before I could walk properly, back when the Horde kept them by the hundred, and when the wolves were gone I took whatever beasts the land gave me. A jaguar isn't a wolf, but it's honest in the same way, and I've had less luck with orcs." },
      },
      choices = {
        { text = "What happened to the wolves?", next = "past_wolves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_wolves = {
      lines = {
        { id = "pw_default", text = "Most died in the war, and the rest were lost or ran wild when we were penned in the humans' camps. The Frostwolves kept theirs, and the Warchief rides one, so the line isn't broken, but I've not had a wolf of my own since." },
      },
      choices = {
        { text = "The camps are behind us. Look forward, Grokor.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The humans took your wolves. They should pay for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdruid = {
      big = true,
      lines = {
        { id = "xd_default", text = "I'd guess they're thinking about the frogs, the water and whether you'd make a good meal, in roughly that order. You'd know better than me, having worn the shape, but I'd like to hear whether a druid thinks I'm doing right by them." },
      },
      choices = {
        { text = "Wild beasts belong to the wild, Grokor, not the pens.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A beast cared for is a beast at peace. You do right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      big = true,
      lines = {
        { id = "xt_default", text = "Whether a kodo can be taught anything at all, mostly, and how you keep one calm in a storm. The wolves I knew would bolt at thunder, and I've wondered for years whether it's the beast or the rider who's frightened first." },
      },
      choices = {
        { text = "The rider, always. Beasts read fear like tracks.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I grew up among wolves and I'll grow old among jaguars, and in between there were the camps, which I don't talk about." } },
    advice = { { id = "tp_ad", text = "Feed your beast before yourself, every night, and it'll die for you. Forget, and it'll only fight for you." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend. Ask me about something with four legs and I'll talk until dark." } },
  },
}

P:NPC {
  key = "rogvar", id = TODO_NPC("Rogvar"), name = "Rogvar", title = "Alchemy Trainer",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "cheerful", "earnest" }, values = { "curious", "loyal" },
  notices = { "craft", "class" },

  impression = {
    first = "Rogvar is the only orc in Stonard who seems glad to be there. Thrall himself sent him, he says, and he talks about the swamp's mud like a garden, though his own eyes stream from whatever's boiling on his bench.",
    third = "{name} met Rogvar, Stonard's cheerful alchemy trainer, who was sent there by Thrall himself.",
  },

  greetings = {
    { id = "g_default", text = "Mind the bench, friend, and mind the green flask especially. It's been bubbling since morning and I'm not entirely sure why." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist! Come and smell this, and tell me honestly whether it smells like progress or like something died in it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, because I've three new failures to show you and one thing that might be a success." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Your fingers are stained green to the knuckle, which means you've been working with swamp herbs or you've been very unlucky. Either way, wash before you eat." },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You've a pack full of herbs, I can smell them from here. If there's any Blindweed in it, Rartar by the wall will be glad of it, and so will I." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Rogvar, and I teach alchemy. Warchief Thrall himself asked me to come out here, and I was honored to obey, and I'll tell you it's no hardship, because just about any herb I could want grows in the muck around these walls." },
        { id = "h_alch", when = { profession = "Alchemy" },
          text = "Rogvar, and you've come to the right orc, because there's no better posting for an alchemist in the Eastern Kingdoms. Thrall sent me here himself, and every morning the swamp hands me something new to boil." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "A shaman! I always thank the earth when I pull a root, which is more than most herbalists do, so I hope the spirits haven't any complaints about me." },
      },
      again = {
        { id = "h_again", text = "What else? Keep talking, I'm only stirring." },
        { id = "h_again2", text = "Go on, the flask needs another few minutes anyway." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Alchemy" } },
        { text = "Thrall sent you here himself?", next = "thrall" },
        { text = "What grows in this swamp worth having?", next = "herbs" },
        { text = "What's in the green flask?", next = "flask" },
        { text = "Do you brew for anyone in Stonard?", next = "bengor" },
        { text = "Do the spirits mind you boiling their roots?", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I've heard the Undercity's apothecaries trade in swamp herbs.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    thrall = {
      lines = {
        { id = "th_default", text = "He did, and he said the Horde needed someone at Stonard who understood what grows here, because a war is won with potions as much as with axes. I'd have come for less than that, but I won't pretend I didn't stand a little taller afterward." },
      },
      choices = {
        { text = "Why would the Warchief care about swamp herbs?", next = "thrall_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thrall_why = {
      lines = {
        { id = "tw_default", text = "Because Orgrimmar sits in a desert, and the Barrens are dry, and a healing draught needs things that only grow where it's wet. Every flask I send north on Breyk's riders is one fewer warrior buried, and the Warchief can count as well as I can." },
      },
      choices = {
        { text = "The Warchief chose well. Serve him gladly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Serve the work, not the Warchief. Herbs don't care who rules.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    herbs = {
      lines = {
        { id = "he_default", text = "Blindweed in the wettest corners, which is why my eyes water every evening, and Sungrass where the light breaks through the trees. There's Liferoot near the Pool of Tears too, though the trolls in those old ruins make gathering it a nervous business." },
      },
      choices = {
        { text = "Why does Blindweed make your eyes water?", next = "herbs_blind" },
        { text = "Where do you get your vials, out here?", next = "herbs_vials" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_blind = {
      lines = {
        { id = "hb_default", text = "Because I boil it, and because I'm stubborn, and because nobody's shown me a better way to draw out the good in it. Karakul says the great hall smells of it on still nights, and he's asked me twice now to work further from the door." },
      },
      choices = {
        { text = "Then move the bench. A town has to live together.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Work where you like. Karakul can open a window.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_vials = {
      lines = {
        { id = "hv_default", text = "Rartar sells them by the wall, and Thultazor too, though they quarrel about who has the better glass. They both buy from the same caravan, so I've never seen the difference, but I've learned not to say so to either of them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll go and buy from both.", next = "END" },
      },
    },

    flask = {
      lines = {
        { id = "fl_default", text = "Swamp water, crocolisk bile and a pinch of something I'd rather not name, and I'm trying to learn whether it keeps the rot out of a wound. So far it keeps everything out of a wound, healing included, so I've some way to go yet." },
      },
      choices = {
        { text = "Would you test it on a soldier?", next = "flask_test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flask_test = {
      lines = {
        { id = "ft_default", text = "Not until I've tried it on myself, and there's a burn on my wrist that says I've started. An alchemist who tests on others first isn't an alchemist at all, just a poisoner with a tidier shelf." },
      },
      choices = {
        { text = "Testing on yourself first is the honest way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A few soldiers' risk could save hundreds. Use them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bengor = {
      lines = {
        { id = "be_default", text = "I brew a draught for old Bengor, who took a murloc's spear in the skull and can't walk or eat the way he used to. It dulls the pain, though he'll never admit there's any pain to dull, and he glares at me every morning, which I take as a sign it's working." },
      },
      choices = {
        { text = "Can't anything heal him properly?", next = "bengor_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bengor_heal = {
      lines = {
        { id = "bh_default", text = "Not that I know of, and I've read every recipe I own twice over looking. Some wounds go deeper than a potion reaches, so the best I can do is keep him comfortable, and keep trying, and not let him see me trying." },
      },
      choices = {
        { text = "Keep trying, Rogvar. He'd do the same for you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xshaman = {
      big = true,
      lines = {
        { id = "xs_default", text = "They've never told me so, and I thank the earth for every root, as I said. If they object, I expect they'll tell me with a bad batch, and I get plenty of those already, so perhaps they've been telling me for years." },
      },
      choices = {
        { text = "Thank them from the heart. Empty words mean nothing to spirits.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The earth gives freely. Thanks are just a habit.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      big = true,
      lines = {
        { id = "xf_default", text = "They do, and their letters come on the zeppelin to Grom'gol asking for swamp samples, very politely. I've sent a few, though I'd dearly like to know what the Royal Apothecaries want with this much Blindweed and bog water." },
      },
      choices = {
        { text = "They serve the Dark Lady. That's reason enough to trust them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Don't send them anything more. I don't trust them either.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I mixed salves in the camps out of whatever the guards threw away, and I've been mixing things ever since. Now the Warchief sends me letters, and I keep every one of them." } },
    advice = { { id = "tp_ad", text = "Never taste anything green before you've smelled it, and never smell anything that's smoking." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, friend, but if it grows in the swamp, ask me again and I'll talk your ears off." } },
  },
}
-- Stonard's trainers: Haromm the shaman, Ogromm and Grokor for hunters and their beasts, Kartosh the warlock. Voice: bibles/stonard_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "haromm", id = TODO_NPC("Haromm"), name = "Haromm",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "calm", "grave" }, values = { "wise", "dutiful" },
  notices = { "class", "race" },

  impression = {
    first = "Haromm trains shamans in Stonard, the only one who does on this side of the sea. He says the elements must be asked, never told, and he says it like someone who has seen what happens otherwise.",
    third = "{name} met Haromm, the shaman trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Peace, traveler. Speak softly here; the water is listening, and it has been sad a long time." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The spirits of this place remember you, and so do I." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "A shaman, come so far east. Sit, and let us hear what the swamp has to say to you." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Your totems are worn smooth at the grip. You use them often, and that is good, but you hold the earth totem too tightly, as if you expect it to run away." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the smell of the other place, warlock. The spirits shrink from it, and I think they are right to." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the Earth Mother. Your people taught mine much when we were young in this world again, and I have not forgotten it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Haromm, and I teach the shamans who come east, since there is no other teacher for them this side of the sea. The swamp is a hard classroom, but the water here has much to say, if one is patient enough to hear it grieve." },
        { id = "h_mastery", when = { class = "SHAMAN", minLevel = 50 },
          text = "You have grown strong, and there is one who has asked to see shamans of your wisdom. Bath'rah the Windwatcher waits in the hills east of Tarren Mill, and he will want a sample of each element before he speaks with you." },
        { id = "h_nonsham", when = { class = { "WARRIOR", "ROGUE", "MAGE", "PRIEST", "HUNTER", "DRUID", "PALADIN" } },
          text = "I teach only those the spirits have already chosen, and you are not one of them. Still, you may sit and listen, because listening harms no one." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The water is patient, and so am I." },
        { id = "h_again2", text = "Speak. I am listening." },
      },
      choices = {
        { text = "Teach me, Haromm.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "Why does the water grieve?", next = "water" },
        { text = "Who is Bath'rah?", next = "bathrah", when = { class = "SHAMAN", minLevel = 50 } },
        { text = "Must the elements always be asked?", next = "asked" },
        { text = "What troubles the spirits near the temple?", next = "temple" },
        { text = "Farewell, Haromm.", next = "END" },
      },
    },
    water = {
      lines = {
        { id = "wa_default", text = "Something was drowned here, long ago, a temple and the people who served in it. The water closed over them and never forgot, and you can feel it when the mist comes off the Pool of Tears." },
      },
      choices = {
        { text = "Then we should listen and honor it.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Grief is a waste. The water should let it go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    asked = {
      lines = {
        { id = "as_default", text = "Always. The elements are not slaves, and a shaman who forgets that soon finds they have stopped answering. I teach my students to whisper, because the ones who shout are the ones the spirits turn from first." },
      },
      choices = {
        { text = "Respect is the only way. I'll whisper.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Sometimes the elements need a firm hand.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bathrah = {
      lines = {
        { id = "ba_default", text = "A wise old troll who keeps watch over the winds in Alterac's foothills. Follow the river north from Tarren Mill until you find the ruins where he waits, and bring him air, fire, earth and water, to show him you are ready." },
      },
      choices = {
        { text = "Where do I find the elements?", next = "bathrah_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bathrah_where = {
      lines = {
        { id = "bw_default", text = "The elementals of the Arathi Highlands carry them, near the old stone circles. Take only what you need, and thank them for it, even as they fall." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    temple = {
      lines = {
        { id = "te_default", text = "The trolls who worship in that drowned place call on something that is not a spirit of this world, or not one I know. The earth there flinches when I come close, and I have learned not to come close." },
      },
      choices = {
        { text = "Then someone must go in and end it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Leave it drowned. Some doors stay shut.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I learned from those who learned from Thrall's own teachers, and now I teach. It is a long chain, and I try to be a good link in it." } },
    advice = { { id = "tp_ad", text = "Before you call on an element, ask whether it wishes to be called. You will know the answer." } },
    _none = { { id = "tp_none", text = "The spirits have not spoken to me of that. Perhaps they think it is not my business." } },
  },
}

P:NPC {
  key = "ogromm", id = TODO_NPC("Ogromm"), name = "Ogromm",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "curt", "gruff" }, values = { "practical", "proud" },
  notices = { "class", "pet" },

  impression = {
    first = "Ogromm trains hunters in Stonard and has nothing at all to say to anyone else. To a hunter he talks for as long as it takes, and most of it is about patience.",
    third = "{name} met Ogromm, the hunter trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Don't waste my time. If you're not a hunter, the inn's that way." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Good, then you can stay, and we can talk." },
    { id = "g_back", when = { metBefore = true, class = "HUNTER" }, text = "Back again. Let's see if you've learned to keep still yet." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "{pet} watches me the way a beast watches something it hasn't decided about. That's good; it means you haven't spoiled it." },
    { id = "n_troll", cat = "race", when = { class = "HUNTER", race = "Troll" },
      text = "A troll hunter. Your people hunted these swamps before mine ever came, so don't let me catch you making it look easy." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_nonhunter", when = { class = { "WARRIOR", "ROGUE", "MAGE", "PRIEST", "SHAMAN", "WARLOCK", "DRUID", "PALADIN" } },
          text = "I train hunters, and you're not one, so we haven't much to talk about. Ask your question if you must, but be quick about it." },
        { id = "h_default", key = true,
          text = "Ogromm. I teach hunters, and in this swamp I mostly teach them to stand still. Everything out there hears you coming before you see it, so the hunter who waits longest eats." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it short." },
        { id = "h_again2", text = "Speak, then. Quietly." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What's worth hunting out here?", next = "game" },
        { text = "How should a hunter hunt?", next = "way", when = { class = "HUNTER" } },
        { text = "Who teaches the beasts?", next = "grokor" },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    game = {
      lines = {
        { id = "ga_default", text = "Swamp jaguars, if you can see them, and the shadow panthers deeper in, which you mostly can't. Crocolisks on the shore are slow until they aren't, and the spiders are only worth it if you like spiders." },
      },
      choices = {
        { text = "How do you hunt a shadow panther?", next = "panther" },
        { text = "Something else.", next = "BACK" },
      },
    },
    panther = {
      lines = {
        { id = "pa_default", text = "You don't, mostly; it hunts you, and you let it think it's winning. Sit downwind by the water at dusk, still as a stump, and when it comes to drink, you'll get one shot, so make it count." },
        { id = "pa_hearts", when = { questObjective = { TODO_QUEST("Nothing But The Truth"), left = { min = 1 } } },
          text = "You want their hearts, I hear, for some dead apothecary in Duskwood. Sit downwind by the water at dusk and wait, and don't ask me what the hearts are for, because I don't want to know." },
      },
      choices = {
        { text = "Can you keep still that long, Ogromm?", next = "still" },
        { text = "Something else.", next = "BACK" },
      },
    },
    still = {
      lines = {
        { id = "st_default", text = "I once lay in the reeds a whole night with a leech on my neck, so the panther wouldn't see me move. Could you?" },
      },
      choices = {
        { text = "I could. The hunt is worth any discomfort.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd pull the leech and find another panther.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    way = {
      lines = {
        { id = "wy_default", text = "Patient, quiet, and fair to the prey. A hunter who kills what he doesn't need will find the swamp empty in a season, and then he's a hunter with nothing to do but complain." },
      },
      choices = {
        { text = "Take only what you need. That's the hunter's law.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The swamp's endless. I'll hunt as I please.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grokor = {
      lines = {
        { id = "gr_default", text = "Grokor, by the pens, and he talks more than I do, which isn't hard. He'll teach your beast what it can learn, and Hekkru will keep it alive afterward, and I'll teach you to deserve it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I hunted. Now I teach hunting. That's enough of a story." } },
    advice = { { id = "tp_ad", text = "Keep still. Then keep still longer." } },
    _none = { { id = "tp_none", text = "Don't know, and I won't guess. Ask someone who talks." } },
  },
}

P:NPC {
  key = "grokor", id = TODO_NPC("Grokor"), name = "Grokor",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "friendly", "chatty" }, values = { "kind", "curious" },
  notices = { "pet", "class" },

  impression = {
    first = "Grokor trains hunters' pets in Stonard and greets the beasts before he greets their owners. He's cheerful, talkative, and a little sad about every animal the swamp has taken.",
    third = "{name} met Grokor, the pet trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Ah, friend, I only help hunters and their pets, but you're welcome to stand and admire the beasts." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "You've come for training, to pass it on to your pet? Good, good, let me see who you've brought." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "And who's this? Hello, {pet}, hello. Yes, you're very handsome, and you know it." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet}'s growl is good and deep, but it's lazy on the second note. We can work on that, the two of us, if your hunter will be patient." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", ["not"] = { pet = true } },
      text = "A hunter with no beast at your side? Either it's in the stables or something's gone wrong, and I hope it's the stables." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grokor, and I train the beasts that hunters bring me, which is the best work in Stonard and I'll argue with anyone who says otherwise. A pet learns faster than its hunter, if you're kind to it, and slower than a stone if you're not." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The beasts don't mind waiting, but I do." },
        { id = "h_again2", text = "Ask, ask. I love questions about beasts." },
      },
      choices = {
        { text = "Train my pet.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What can a pet learn from you?", next = "learn" },
        { text = "What beasts in the swamp are worth taming?", next = "tame", when = { class = "HUNTER" } },
        { text = "How should a hunter treat a pet?", next = "treat" },
        { text = "Do Ogromm and Hekkru help you?", next = "neighbors" },
        { text = "Goodbye, Grokor.", next = "END" },
      },
    },
    learn = {
      lines = {
        { id = "le_default", text = "To growl, so the enemy looks at it and not at you, and to shrug off frost and fire and the like. The rest they learn in the wild, from the beasts you tame, and that's the real school, out there in the reeds." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tame = {
      lines = {
        { id = "ta_default", text = "A shadow panther, if you can find one before it finds you, because it'll teach your other beasts a thing or two about moving quiet. The crocolisks bite hard and know it, and they make a stubborn, loyal pet if you've the patience." },
      },
      choices = {
        { text = "A pet should be strong. That's what matters.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "A pet should be a friend first.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    treat = {
      lines = {
        { id = "tr_default", text = "Like a friend who happens to have very sharp teeth. Feed it before you feed yourself, let it rest when it's hurt, and never, ever leave it behind in the swamp, because they wait, you know, longer than anyone should." },
      },
      choices = {
        { text = "A friend is never abandoned. Never.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Sometimes a hunter has to move on.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "You sound like you've seen it happen.", next = "waiting" },
      },
    },
    waiting = {
      lines = {
        { id = "wa_default", text = "Too often. Hekkru has a cat in his back pen that's been waiting for its troll for two winters, and every time I pass, it looks up to see if I'm him. I bring it a scrap, and it eats, and then it goes back to watching the gate." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbors = {
      lines = {
        { id = "ne_default", text = "Ogromm teaches the hunters, and he says about ten words a day, so I say the rest for him. Hekkru keeps the beasts alive, and he's softer than he looks, but don't tell him I told you, because he'll growl at me for a week." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've trained beasts since I could walk, and I'll train them till I can't." } },
    advice = { { id = "tp_ad", text = "Talk to your pet. It doesn't understand the words, but it understands that you're talking." } },
    _none = { { id = "tp_none", text = "I don't know about that, friend. Ask me about beasts instead." } },
  },
}

P:NPC {
  key = "kartosh", id = TODO_NPC("Kartosh"), name = "Kartosh",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "cold", "measured" }, values = { "ambitious", "dutiful" },
  notices = { "class", "race" },

  impression = {
    first = "Kartosh trains warlocks in Stonard, and he weighs every visitor like a sum. He keeps to the Warchief's rules about the fel, and he wants that noticed.",
    third = "{name} met Kartosh, the warlock trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Your will is not strong enough to manipulate the forces we control, {class}. Speak, if you must, but do not touch anything." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "You know enough to be dangerous, {name}, but you still look like you need training to me." },
    { id = "g_back", when = { metBefore = true, class = "WARLOCK" }, text = "Back again, and your demon is still on its leash. Good." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your imp has scorched the hem of your robe, and you've let it. Never let them take liberties, even small ones, because they remember every one." },
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "You glow, and it stings the eyes. Stand further back, if you please; the circles here do not like the Light." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge", class = "WARLOCK" },
      text = "A Forsaken warlock. Your Dark Lady's people have a feel for this work, I'm told, and less to lose to it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kartosh. I train warlocks, under the Warchief's terms and the Warchief's eye, and I keep both in mind at every lesson. Stonard is near enough to the Blasted Lands that the fel is never far, which makes it a good place to learn and a bad place to grow careless." },
      },
      again = {
        { id = "h_again", text = "Is there more? Be precise." },
        { id = "h_again2", text = "Ask. I will answer what is useful." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What are the Warchief's terms?", next = "terms" },
        { text = "Why learn so near the Blasted Lands?", next = "portal" },
        { text = "Do you know Fel'zerul?", next = "felzerul" },
        { text = "Did warlocks walk Stonard in the old days?", next = "old" },
        { text = "I'll go.", next = "END" },
      },
    },
    terms = {
      lines = {
        { id = "te_default", text = "That we serve the Horde, and nothing else, and that no demon is ever master of the one who called it. The old Horde forgot that, and drank, and you know how that ended, so we do not forget." },
      },
      choices = {
        { text = "Rules keep the fel in its place. They're wise.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Rules are for the weak. Power answers to the strong.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    portal = {
      lines = {
        { id = "po_default", text = "Because the demons that still wander out there are real, and a student who has faced one learns faster than one who has only read about them. It is dangerous, of course, and that is the lesson." },
      },
      choices = {
        { text = "Danger teaches respect. It's the right way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Danger teaches power. That's what I want.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    felzerul = {
      lines = {
        { id = "fe_default", text = "Of course. The Warchief sent him to watch the sunken temple, and he does it well, and he keeps to the line more strictly than I do. Greshka thinks him a fool for it, which tells you more about Greshka than about Fel'zerul." },
      },
      choices = {
        { text = "What about Greshka?", next = "greshka" },
        { text = "Something else.", next = "BACK" },
      },
    },
    greshka = {
      lines = {
        { id = "gr_default", text = "She sells grimoires and she wants more than that, and she has not decided yet how much she is willing to pay for it. I watch her, and she knows I watch her, and that is the arrangement." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    old = {
      lines = {
        { id = "ol_default", text = "When the old Horde built this place, there were warlocks in every hall, and they were not teachers; they were masters, and the clans were their tools. I teach in the same stones, and I remind myself of that every morning before the first student comes." },
      },
      choices = {
        { text = "Then the stones keep you honest. Good.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "The old masters had real power. That's worth studying.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I learned this art in the camps, and I kept it when the Warchief allowed it. That is all you need to know." } },
    advice = { { id = "tp_ad", text = "Never let your demon take a liberty, however small. It will remember." } },
    _none = { { id = "tp_none", text = "That is not my concern, and I suspect it is not yours either." } },
  },
}
