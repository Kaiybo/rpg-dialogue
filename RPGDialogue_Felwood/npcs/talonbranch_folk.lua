-- Talonbranch Glade: Taronn Redfeather, who studies the wildkin, and Malygen, the glade's reagent seller. Voice: bibles/talonbranch_folk.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "taronn", id = TODO_NPC("Taronn Redfeather"), name = "Taronn Redfeather",
  bible = "bibles/talonbranch_folk.md", role = "questgiver", tier = "quest",
  communities = { "talonbranch" }, temper = { "curious", "earnest" }, values = { "wise", "devout" },
  notices = { "class", "race" },

  impression = {
    first = "Taronn Redfeather watches the wildkin of Winterspring the way other scholars watch the stars, with patience and a little awe. He worries that the creatures have gone mad from what they guard.",
    third = "{name} met Taronn Redfeather, a night elf at Talonbranch Glade who studies the wildkin.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, and welcome to Talonbranch. If you're bound north toward Winterspring, I'd like a word before you go." },
    { id = "g_active", when = { questActive = TODO_QUEST("Wild Guardians") }, text = "You're back from the north already? Tell me what you saw of the owlbeasts, and leave nothing out." },
    { id = "g_secrets", when = { questActive = TODO_QUEST("Guarding Secrets") }, text = "Have you found what they were guarding? I've hardly slept since you left, wondering." },
    { id = "g_done", when = { questDone = TODO_QUEST("Guarding Secrets") }, text = "There you are, the one who carried Elune's answer out of the snow. I still turn that over in my mind every evening." },
    { id = "g_back", when = { metBefore = true }, text = "Back by the moonwell again. Sit, if you like; the wildkin can wait a moment." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, and I'd wager you've worn feathers yourself, or wished to. Then the wildkin of Talonbranch will speak to something in you." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf of Ironforge, in Felwood. Your scholars dig for the past and I watch birds for it, so perhaps we're in the same trade." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Taronn Redfeather, and I study the wildkin, the great owlbeasts who roost in Winterspring and the old places of our people. Something has gone wrong with them, and I mean to learn what before the Sentinels decide the only answer is arrows." },
        { id = "h_active", when = { questActive = TODO_QUEST("Wild Guardians") }, text = "The moontouched ones are north of the Timbermaw tunnels, and the berserk ones keep near the small caves further south. Look at their eyes before you fight them, if you can manage it, and tell me what you see there." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I can talk about wildkin until the moon sets." },
        { id = "h_again2", text = "Ask, friend. I've had no one to talk to but the hippogryphs." },
      },
      choices = {
        { text = "What are the wildkin?", next = "wildkin" },
        { text = "What's gone wrong with them?", next = "mad" },
        { text = "How do I reach Winterspring from here?", next = "road" },
        { text = "Why study them from Felwood?", next = "felwood" },
        { text = "Elune made them, didn't she?", next = "xpriest", when = { class = "PRIEST", race = "NightElf" } },
        { text = "I've worn feathers in moonkin form, Taronn.", next = "xdruid", when = { class = "DRUID" } },
        { text = "I've seen what sick beasts do. Some can't be helped.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Farewell, Taronn.", next = "END" },
      },
    },
    wildkin = {
      lines = {
        { id = "w_default", text = "They are older than our cities, and some of the old songs say they were placed to watch over Elune's sacred places when the Kaldorei were young. You'll find them wherever something holy was left behind and forgotten, which in Kalimdor is a great many places." },
      },
      choices = {
        { text = "What sort of holy places?", next = "wildkin_places" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wildkin_places = {
      lines = {
        { id = "wp_default", text = "Shrines, mostly, and barrow-groves, and the odd ruin that even our histories have lost the name of. The wildkin don't care whether anyone remembers what they guard; they guard it anyway, which I find more moving than any statue in Darnassus." },
      },
      choices = {
        { text = "What happens if someone comes near?", next = "wildkin_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wildkin_guard = {
      big = true,
      lines = {
        { id = "wg_default", text = "They drive them off, and lately they kill them, Kaldorei or not. I believe the old secrets should stay where Elune put them, but the Sentinels say a guardian that kills our own people has failed in its charge." },
      },
      choices = {
        { text = "Then leave the secrets buried. The guardians are doing their duty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Secrets hidden from us aren't worth killing for. Uncover them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mad = {
      lines = {
        { id = "m_default", text = "Some are ragged and raging, and some are berserk, and the ones in the north have a strange light in them that I call moontouched for want of a better word. A wildkin is fierce but never mad, so whatever they guard up there has done something to them." },
        { id = "m_done", when = { questDone = TODO_QUEST("Wild Guardians") }, text = "You've seen them now, so you know what I mean. They fight like creatures who've forgotten everything but the fighting, and that isn't the wildkin I read about as a boy." },
      },
      choices = {
        { text = "Could it be Felwood's corruption reaching north?", next = "mad_fel" },
        { text = "What do you want done about them?", next = "mad_task" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mad_fel = {
      lines = {
        { id = "mf_default", text = "I thought so at first, and it would have been the easy answer. But the Winterspring wildkin have no fel in them that the druids can find, so I think it is something older, something in what they guard, and that frightens me more than the demons do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mad_task = {
      big = true,
      lines = {
        { id = "mt_default", text = "Thin the worst of them, and bring me whatever they wear or carry, because a wildkin doesn't carry trinkets without a reason. I hate to ask it, but a dead guardian can still tell me what a living one would not." },
      },
      choices = {
        { text = "I'll do it, and I'll make it quick for them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mad beasts are mad beasts. I'll cut through them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "r_default", text = "North through Felwood to the Timbermaw tunnels, and through the furbolgs' hold to the snow beyond. The Timbermaw will let you pass if they don't hate you, so be careful which furbolgs you kill on the way." },
      },
      choices = {
        { text = "Which furbolgs are safe to fight?", next = "road_furbolgs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_furbolgs = {
      lines = {
        { id = "rf_default", text = "The Deadwood, who live in the corrupted camps along the road, and nobody at the hold will mourn them aloud. Don't lift a hand against anyone wearing Timbermaw colours, or you'll be walking to Winterspring the long way, through Azshara and the mountains." },
      },
      choices = {
        { text = "Thanks for the warning.", next = "BACK", fx = { affinity = 1, learn = { "furbolgs" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood = {
      lines = {
        { id = "f_default", text = "Because Talonbranch is the last place in the north with a moonwell and a Sentinel's bow between me and the forest. Mishellena's birds can have me in Winterspring by nightfall, and I can be back before the satyrs notice I've gone." },
      },
      choices = {
        { text = "You don't like it here.", next = "felwood_dislike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood_dislike = {
      lines = {
        { id = "fd_default", text = "I grew up hearing how beautiful this forest was, and now the streams burn your hands and the trees whisper at night. Golhine tells the young druids they must learn the sick places, and he's right, but I'd rather learn them from far away." },
      },
      choices = {
        { text = "Somebody has to stay and fight for it.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I don't blame you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "So the old songs say, priest, and I believe them. If Elune set them to watch, then whatever is driving them mad is something she would want found, and that is the only reason I can ask anyone to raise a blade against her guardians." },
      },
      choices = {
        { text = "Then I'll go with her blessing.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = {
        { id = "xd_default", text = "Then you've felt a little of what they feel, and I envy you for it. Tell me, when you wear that shape, does the moon seem nearer, or is that only a story the young druids tell each other?" },
      },
      choices = {
        { text = "It's nearer. It hums in the bones.", next = "BACK", fx = { affinity = 2 } },
        { text = "Only a story. It's just feathers.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    xhunter = {
      big = true,
      lines = {
        { id = "xh_default", text = "I've heard hunters say so, and I've heard druids say the opposite, and I've never been sure which of you to believe. The wildkin aren't ordinary beasts, though, and I'd ask you to remember that before you loose an arrow at one." },
      },
      choices = {
        { text = "I'll remember. Some creatures deserve more care than others.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast that kills is a beast that dies. That's all.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furb", text = "The Timbermaw are the only sane furbolgs left in the north, and they guard the only good road to Winterspring. Be polite to them." } },
    cenarion_circle = { { id = "tp_circ", text = "The druids of the Emerald Circle are working in the south of the forest. They're braver than I am, and I've told them so." } },
    advice = { { id = "tp_ad", text = "Look at a creature's eyes before you decide it's a monster. Most of the time you'll be right, but not always." } },
    _none = { { id = "tp_none", text = "I'm afraid I know about owlbeasts and very little else. Ask Golhine, who knows a little about everything and says almost none of it." } },
  },
}

-- Talonbranch Glade's keepers: Kaerbrus (hunter trainer, with his cat Shi'alune), Malygen (general goods),
-- Mylini Frostmoon (weapon merchant).
-- Voice: bibles/talonbranch_folk.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kaerbrus
---------------------------------------------------------------------------
P:NPC {
  key = "kaerbrus", id = TODO_NPC("Kaerbrus"), name = "Kaerbrus", title = "Hunter Trainer",
  bible = "bibles/talonbranch_folk.md", role = "trainer", tier = "service",
  communities = { "talonbranch" }, temper = { "quiet", "watchful" }, values = { "nature", "loyal" },
  notices = { "pet", "hunter" },

  impression = {
    first = "Kaerbrus trains hunters at Talonbranch Glade with his nightsaber Shi'alune lying at his feet. He looks at your pet before he looks at you.",
    third = "{name} met Kaerbrus, the night elf hunter trainer at Talonbranch Glade, and his cat Shi'alune.",
  },

  greetings = {
    { id = "g_default", text = "Shi'alune doesn't mind you, so neither do I. What do you need?" },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, this far into Felwood. Come, let's see what you've learned on the way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Shi'alune remembered you before I did." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} away from the streams, and away from anything in Felwood that's still moving after it should be dead. Beasts trust their noses, and their noses lie here." },
    { id = "n_hunter", cat = "hunter", when = { class = "HUNTER", minLevel = 58 },
      text = "You've the look of someone who could speak to the Ancients in the Irontree Woods. They don't talk to many hunters, but they might talk to you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kaerbrus, and I train hunters for the Sentinels here at Talonbranch. Shi'alune and I have kept this glade for a long time, and between us we've learned what Felwood does to a beast that drinks the wrong water." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Good, then you can learn from me, and you can also learn from this forest, which is a harsher teacher. Watch the bears and wolves here, because the corruption has made them strong and stupid in the same breath." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're Horde, and this is a Sentinel glade, so I'd keep your weapons put away. I'll answer what you ask, though Shi'alune has her own opinions about your people." },
      },
      again = {
        { id = "h_again", text = "Something else? Shi'alune is asleep, so speak quietly." },
        { id = "h_again2", text = "Ask. I have the time while the glade is quiet." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Tell me about Shi'alune.", next = "cat" },
        { text = "What does the corruption do to beasts?", next = "beasts" },
        { text = "What are the Ancients in the Irontree Woods?", next = "ancients", when = { class = "HUNTER" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    cat = {
      lines = { { id = "ca_default", text = "She was a cub when I found her by a dead moonwell in Ashenvale, too weak to stand. She's been at my side since, and she has never once drunk from a Felwood stream, because I taught her to smell the sickness before she tasted it." } },
      choices = {
        { text = "She's beautiful.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Can you teach that to my pet?", next = "beasts" },
      },
    },
    beasts = {
      big = true,
      lines = { { id = "be_default", text = "It makes them grow big and angry, and then it makes them rot while they're still walking. Some hunters here won't tame anything in Felwood at all. Others say a beast that survives the corruption is the strongest companion there is." } },
      choices = {
        { text = "A corrupted beast should be put down, not tamed.", next = "beasts_end", fx = { align = { order = 1 } } },
        { text = "If it's strong and survives, I'll tame it.", next = "beasts_end", fx = { align = { order = -1 } } },
        { text = "What do you do?", next = "beasts_end" },
      },
    },
    beasts_end = {
      lines = { { id = "bee_default", text = "I put them down, and I do it quickly, and I don't enjoy it. Shi'alune watches me do it every time, and I like to think she understands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ancients = {
      lines = { { id = "an_default", text = "Spirits of the Ancients of Lore, who died at Hyjal and never quite left. Vartrus and his brothers speak to hunters who've proven themselves, and what they ask is hard, but I've never heard of a hunter who regretted it." } },
      choices = { { text = "I'll seek them out. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Beasts, the glade, and the hunters who train here." } },
    advice = { { id = "tp_ad", text = "Watch your pet's nose. If it won't drink, neither should you." } },
    sentinels = { { id = "tp_sent", text = "I train their scouts. They come to me green and leave knowing which bushes bite." } },
    _none = { { id = "tp_none", text = "I don't know. Ask Shi'alune, and she'll tell you just as much." } },
  },
}
