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
      text = "A druid, and I'd wager you've worn feathers yourself, or wished to. The wildkin will interest you more than most." },
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

P:NPC {
  key = "malygen", id = TODO_NPC("Malygen"), name = "Malygen", title = "Reagents",
  bible = "bibles/talonbranch_folk.md", role = "vendor", tier = "service",
  communities = { "talonbranch" }, temper = { "brisk" }, values = { "careful", "practical" },

  impression = {
    first = "Malygen sells reagents at Talonbranch Glade and is very particular about where every herb and powder came from. Nothing on the counter was grown in Felwood, and Malygen wants that understood.",
    third = "{name} met Malygen, who sells reagents at Talonbranch Glade.",
  },

  greetings = {
    { id = "g_default", text = "Reagents, and all of them clean, brought in from outside the forest. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good, someone in this glade actually buys things." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I keep powders, candles, seeds and thornroot for anyone who can make use of them, and I keep them dry, which in Felwood is harder than it sounds. Look all you like, but don't open the jars without asking." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid, so you'll want seeds and thornroot. I have both, and none of it was grown within a day's walk of this place." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage, so it's powder you're after. I keep it sealed, because the damp here gets into everything and leaves it clumped like old porridge." },
      },
      again = { { id = "h_again", text = "Anything else, or are you buying?" } },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Why does it matter where it was grown?", next = "clean" },
        { text = "How do you get supplies up here?", next = "supply" },
        { text = "Do you buy herbs from the forest?", next = "herbs", when = { profession = "Herbalism" } },
        { text = "Farewell.", next = "END" },
      },
    },
    clean = {
      lines = {
        { id = "c_default", text = "Because anything grown in this soil carries the forest's sickness, and a spell cast with a sick reagent goes wrong in ways nobody wants to explain to a healer afterward. I had a mage in here once who learned that the hard way, and he still won't tell anyone what happened to his eyebrows." },
      },
      choices = {
        { text = "That's a little alarming.", next = "clean_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clean_more = {
      big = true,
      lines = {
        { id = "cm_default", text = "It should be. The Shadow Council in Jaedenar grow their own reagents in that soil, and I think they like what it does to their spells, which tells you everything you need to know about them." },
      },
      choices = {
        { text = "Then clean reagents are worth paying extra for.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Power's power. If it works, I'd use it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      lines = {
        { id = "s_default", text = "Mishellena's hippogryphs bring crates up from Ashenvale and Darnassus when the weather allows, and when it doesn't, I ration. The birds hate carrying candles, for some reason, so I always tip their keeper." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = {
        { id = "hb_default", text = "Not from Felwood, no, not even the ones that look healthy, and the alchemists who'll pay for them are welcome to them. If you pick in Winterspring or Ashenvale and wash your hands first, then we can talk." },
      },
      choices = {
        { text = "I'll keep my Felwood herbs separate.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I sell reagents, and I don't gossip, because gossip doesn't keep dry. Ask Taronn, who will talk to anyone about anything with feathers." } },
  },
}
