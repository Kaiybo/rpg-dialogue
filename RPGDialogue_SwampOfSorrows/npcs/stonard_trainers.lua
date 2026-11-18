-- Stonard's trainers: Kartosh the warlock trainer, Ogromm the hunter trainer, Grokor the pet trainer and Rogvar the alchemist. Voice: bibles/stonard_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kartosh", id = TODO_NPC("Kartosh"), name = "Kartosh", title = "Warlock Trainer",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "calm", "severe" }, values = { "disciplined", "wary" },
  notices = { "class" },

  impression = {
    first = "He speaks of the fel as a jailer speaks of his keys.",
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
        { id = "h_dd_kazzak", when = { killed = { name = "Kazzak" } },
          text = "I felt the Tainted Scar go quiet from here, a mile from the Portal, and now I hear you were there when Kazzak fell. My students will sleep better, and I will not, because power that great never stays gone for long." },
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
        { text = "The old warlocks were traitors. Their craft should die with them.", next = "BACK", reply = "Many would agree, and I'll not call them wrong. But a craft left unstudied is a craft the next fool stumbles into blind, and I'd rather he learned it from me.", fx = { align = { light = 1 } } },
        { text = "Their mistake was trusting demons, not wielding the power.", next = "BACK", reply = "That's the thought that damned them, student, almost word for word. Mind you don't finish the sentence the way they did.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lesson = {
      lines = {
        { id = "le_default", text = "Humility comes first, then control, and only after both of those comes power. The young ones want them in the opposite order, and Greshka the grimoire seller sells to them in that order, which is why I teach and she doesn't." },
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
        { id = "lh_default", text = "It's the strangest lesson and the most needed, because the moment a warlock believes his demon serves out of fear, the demon starts to plan. I've buried students who forgot that, and there wasn't much of them left to bury." },
      },
      choices = {
        { text = "Strict rules keep a warlock alive. I'd follow yours.", next = "BACK", reply = "Then you may live long enough to teach it yourself. Rule one: never believe your demon likes you.", fx = { align = { order = 1 } } },
        { text = "Rules are for the timid. A real warlock finds his own way.", next = "BACK", reply = "Every warlock in the old Horde found his own way, and I helped bury what was left of them. Come back when you've lost a finger.", fx = { align = { order = -1 } } },
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
        { text = "Let the students choose their own risks. It's their fire.", next = "BACK", reply = "Their fire, aye, until it reaches the next hut. That's why I worry about Greshka, and why I watch her.", fx = { align = { order = -1 } } },
        { text = "Then her trade should be limited. The Warchief makes the laws.", next = "BACK", reply = "The Warchief makes the laws, and I'll take this to him if I must. But laws come slow, and students burn quick.", fx = { align = { order = 1 } } },
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
        { text = "Fear is all a demon understands. I'll rule mine with it.", next = "BACK", reply = "Fear works, until it doesn't, and then the demon remembers every lash. Rule it with fear and watch your back forever.", fx = { align = { light = -1 } } },
        { text = "I'll call on mine sparingly, and only for the Horde.", next = "BACK", reply = "Sparingly, and for the Horde. That's the only answer I like to hear from a student.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      big = true,
      lines = {
        { id = "xs_default", text = "They do, and they're right to, and I'll not argue with them or with you. I teach so that the next warlock who touches the fel knows exactly what it cost us, which is more than my own teachers ever told me." },
      },
      choices = {
        { text = "The Warchief allows your craft, so I'll respect his word.", next = "BACK", reply = "Respect his word, and his reasons, and you'll do well here. Thrall knows what this craft cost us better than anyone.", fx = { align = { order = 1 } } },
        { text = "Warchief or not, this craft should end with you.", next = "BACK", reply = "Perhaps it should, shaman, and I've thought it myself. But it won't, so I'll teach it as safely as I can.", fx = { align = { order = -1 } } },
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
    first = "He thinks Grokor spoils the beasts and says so to anyone.",
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
    dd_crocs = {
      lines = {
        { id = "dd_crocs_1",
          text = "I read everyone's tracks; it's the only thing in this swamp that doesn't lie. Yours go in fast and come out slow, which tells me you fight hard and bleed a little, and you don't wait for the crocolisk to make the first move." },
        { id = "dd_crocs_2",
          text = "Grokor would say you should've tamed one instead of killing it. Grokor would make a pet of an ogre if it sat still long enough." },
      },
      choices = {
        { text = "Killing them is cleaner than taming them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Grokor's right. A tamed beast is worth ten dead ones.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Ogromm.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_crocs", when = { killed = { name = "Sawtooth", min = 30 } },
          text = "The Sawtooth tracks along the river are thinner this week, and I've seen your boot prints over most of them. Not bad, for someone I didn't train." },
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
        { text = "You've been reading my tracks?", next = "dd_crocs", when = { killed = { name = "Sawtooth", min = 30 } } },
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
        { text = "Patience is the whole craft. A hunter waits for the right shot.", next = "BACK", reply = "It is, and you'll do well in this swamp with that in your head. The crocolisks reward impatience.", fx = { align = { order = 1 } } },
        { text = "Sometimes you charge in and trust your instincts.", next = "BACK", reply = "Instinct, aye, and a long scar to show for it. The swamp teaches that lesson to everyone once.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    quarry = {
      lines = {
        { id = "qu_default", text = "Swamp jaguars for the skins, sawtooth crocolisks for the meat Tok'Kar the beach cook is always short of, and the deathstrike tarantulas if you've a death wish. Leave the dragon whelps near the ruins to the green dragons, because I don't care to find out how their elders feel about it." },
      },
      choices = {
        { text = "Do you hunt for the town or for yourself?", next = "quarry_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarry_why = {
      lines = {
        { id = "qw_default", text = "For the town, which Dar keeps supplied, and Thultash sells what's left. The old Horde hunted for sport and glory and left nothing standing behind it, and look how well that ended for everyone." },
      },
      choices = {
        { text = "Take only what the town needs. The swamp has to last.", next = "BACK", reply = "That's the Horde as Thrall would have it, and as I'd have it. The swamp will last if we let it.", fx = { align = { light = 1 } } },
        { text = "The swamp's endless. Take what you like and sell the rest.", next = "BACK", reply = "Endless? It's not, and the old Horde thought the same about Draenor. Take what the town needs.", fx = { align = { light = -1 } } },
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
        { text = "We hunt it down, mon. A debt's a debt.", next = "BACK", reply = "A debt's a debt, aye, and the crocolisk pays it. You'll fit in here, troll.", fx = { align = { honor = 1 } } },
        { text = "Nothing. It was hungry, and we were careless.", next = "BACK", reply = "Hungry and careless, aye, and that's the swamp in a word. You've a hunter's honesty.", fx = { align = { honor = -1 } } },
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
    first = "He rode wolves as a boy, before the camps.",
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
          text = "I'm Grokor, and I teach hunters' beasts what their masters can't. Jaguars, crocolisks and even the big spiders out past the Pool of Tears, I've trained them all, and each of them learned faster than the hunter who brought it in." },
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
        { text = "A companion eats before I do. That's only right.", next = "BACK", reply = "Right, and your beast will know it. Bring it by the pens, and I'll find it something better than swamp rat.", fx = { align = { light = 1 } } },
        { text = "A beast is a tool. It eats when it's earned it.", next = "BACK", reply = "Earned it, eh? Then you'll be back here wondering why it ran off. Feed it first.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    swamp = {
      lines = {
        { id = "sw_default", text = "Swamp jaguars first and best, because they're quick and quiet and they don't mind the water a bit. The sawtooth crocolisks make a hard-shelled companion if a slow one, and some hunters fancy the deathstrike tarantulas, though I'd sooner not have one in my pens." },
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
        { text = "A beast doesn't need to love you, only obey you.", next = "BACK", reply = "Obey, aye, until something tastier comes along. A spider's obedience lasts as long as its last meal.", fx = { align = { light = -1 } } },
        { text = "Love's the only bond worth having with a beast.", next = "BACK", reply = "It is, and I'd say the same. But try telling that to a spider.", fx = { align = { light = 1 } } },
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
        { text = "The camps are behind us. Look forward, Grokor.", next = "BACK", reply = "Forward, aye, I try. But some nights I hear the old wolves howl, and I can't help looking back.", fx = { align = { light = 1 } } },
        { text = "The humans took your wolves. They should pay for it.", next = "BACK", reply = "Pay? The humans paid in their own blood when Thrall broke the camps. I'll leave it there.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdruid = {
      big = true,
      lines = {
        { id = "xd_default", text = "I'd guess they're thinking about the frogs, the water and whether you'd make a good meal, in roughly that order. You'd know better than me, having worn the shape, but I'd like to hear whether a druid thinks I'm doing right by them." },
      },
      choices = {
        { text = "Wild beasts belong to the wild, Grokor, not the pens.", next = "BACK", reply = "They do, and I let as many go as I can. But a hurt beast is better here than in a crocolisk's jaws.", fx = { align = { order = -1 } } },
        { text = "A beast cared for is a beast at peace. You do right.", next = "BACK", reply = "Thank you, druid. That's what I try to give them, peace and a full belly.", fx = { align = { order = 1 } } },
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
    first = "He is the only orc here who seems glad of the swamp.",
    third = "{name} met Rogvar, Stonard's cheerful alchemy trainer, who was sent there by Thrall himself.",
  },

  greetings = {
    { id = "g_default", text = "Mind the bench, friend, and mind the green flask especially. It's been bubbling since morning and I'm not entirely sure why." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist! Come and smell this, and tell me straight whether it smells like progress or like something died in it." },
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
          text = "A shaman! I always thank the earth when I pull a root, though most herbalists don't bother, so I hope the spirits haven't any complaints about me." },
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
        { text = "The Warchief chose well. Serve him gladly.", next = "BACK", reply = "He did, and I do. Every flask that goes north keeps a grunt alive in the Barrens.", fx = { align = { order = 1 } } },
        { text = "Serve the work, not the Warchief. Herbs don't care who rules.", next = "BACK", reply = "The herbs don't care, aye, but the grunts do, and the Warchief cares for them. I serve both.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    herbs = {
      lines = {
        { id = "he_default", text = "Blindweed in the wettest corners, so my eyes water every evening, and Sungrass where the light breaks through the trees. There's Liferoot near the Pool of Tears too, though the trolls in those old ruins make gathering it a nervous business." },
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
        { text = "Then move the bench. A town has to live together.", next = "BACK", reply = "Move it? Where, into the swamp? But aye, I'll think on it, if only to stop Karakul complaining.", fx = { align = { order = 1 } } },
        { text = "Work where you like. Karakul can open a window.", next = "BACK", reply = "Ha! That's what I keep telling him. He opens the window, I keep boiling, and we both live.", fx = { align = { order = -1 } } },
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
        { text = "Testing on yourself first is the honest way.", next = "BACK", reply = "It is, and the only way I know. The burn on my wrist is proof I mean it.", fx = { align = { light = 1 } } },
        { text = "A few soldiers' risk could save hundreds. Use them.", next = "BACK", reply = "Use them? Not while I'm the alchemist here. I test on myself first, or not at all.", fx = { align = { light = -1 } } },
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
        { text = "Thank them from the heart. Empty words mean nothing to spirits.", next = "BACK", reply = "From the heart, aye, and I mean it every time. I'll keep thanking them properly.", fx = { align = { honor = 1 } } },
        { text = "The earth gives freely. Thanks are just a habit.", next = "BACK", reply = "A habit, maybe, but a good one. I've never once pulled a root without saying it, and the roots keep coming.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      big = true,
      lines = {
        { id = "xf_default", text = "They do, and their letters come on the zeppelin to Grom'gol asking for swamp samples, very politely. I've sent a few, though I'd dearly like to know what the Royal Apothecaries want with this much Blindweed and bog water." },
      },
      choices = {
        { text = "They serve the Dark Lady. That's reason enough to trust them.", next = "BACK", reply = "Reason enough, aye, and I'll keep sending samples. But I'd still like to know what they do with them.", fx = { align = { order = 1 } } },
        { text = "Don't send them anything more. I don't trust them either.", next = "BACK", reply = "You don't trust them either? Then I'll send less, and ask more questions. Thank you for that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I mixed salves in the camps out of whatever the guards threw away, and I've been mixing things ever since. Now the Warchief sends me letters, and I keep them all in a box by my bedroll." } },
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
    first = "He says the elements must be asked, never told.",
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
      text = "A child of the Earth Mother. Your people taught mine much when we were new to Kalimdor, and I have not forgotten it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Haromm, and I teach the shamans who come east, since there is no other teacher for them this side of the sea. The swamp is a hard classroom, but the water here has much to say, if one is patient enough to hear it grieve." },
        { id = "h_mastery", when = { class = "SHAMAN", minLevel = 50 },
          text = "You have grown strong, and there is one who has asked to see shamans of your wisdom. Bath'rah the Windwatcher waits in the hills north of Tarren Mill, and he will want a sample of each element before he speaks with you." },
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
        { text = "Then we should listen and honor it.", next = "BACK", reply = "Listen, aye, and honor it. That's what I teach, and what I hope you'll remember.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Grief is a waste. The water should let it go.", next = "BACK", reply = "Let it go? The water does not forget, student, and neither should we. Grief has its purpose.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    asked = {
      lines = {
        { id = "as_default", text = "Always. The elements are not slaves, and a shaman who forgets that soon finds they have stopped answering. I teach my students to whisper, because the ones who shout are the ones the spirits turn from first." },
      },
      choices = {
        { text = "Respect is the only way. I'll whisper.", next = "BACK", reply = "Good, and the elements will hear you better for it. Whisper, and they'll answer.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Sometimes the elements need a firm hand.", next = "BACK", reply = "A firm hand, aye, until they stop answering. Mind you don't learn that the hard way.", fx = { align = { order = -1 } } },
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
        { text = "Then someone must go in and end it.", next = "BACK", reply = "Someone must, and I hope it's someone who knows what they face. Go carefully, if you go.", fx = { align = { honor = 1 } } },
        { text = "Leave it drowned. Some doors stay shut.", next = "BACK", reply = "Some doors, yes, but this one's already opening. I'd rather we knew what came through.", fx = { align = { honor = -1 } } },
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

-- Stonard's trainers: Ogromm (hunter), Grokor (pet trainer), Kartosh (warlock), Rogvar (alchemy).
-- Voice: bibles/stonard_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST
