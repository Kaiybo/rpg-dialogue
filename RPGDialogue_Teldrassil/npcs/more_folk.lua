-- Teldrassil, folk we had missed: Sentinel Shayla Nightbreeze (the road west of Dolanaar), Porthannius
-- (Shadowglen, the herb delivery), and Dolanaar's druid trainer Kal, pet trainer Keldas, armorer Meri
-- Ironweave, weaponsmith Shalomon and cook Danlyia. Classic only.
-- Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Sentinel Shayla Nightbreeze
---------------------------------------------------------------------------
P:NPC {
  key = "shayla", id = TODO_NPC("Sentinel Shayla Nightbreeze"), name = "Sentinel Shayla Nightbreeze",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest", gender = "female",
  communities = { "dolanaar" }, temper = { "stern", "steady" }, values = { "dutiful", "lawful" },
  notices = { "class", "race" },

  impression = {
    first = "She keeps a list of who has wronged the forest.",
    third = "{name} met Sentinel Shayla Nightbreeze, who patrols the road west of Dolanaar and speaks for the Council of the Forest.",
  },

  greetings = {
    { id = "g_hello", text = "Halt a moment. The Council of the Forest has orders for those who walk this road." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Walk with me, then; I don't stop on this road." },
    { id = "g_zenn", when = { questDone = TODO_QUEST("Zenn's Bidding") }, text = "The Council knows what you did for the satyr Foulhoof. We should speak." },
    { id = "g_bounty", when = { questActive = TODO_QUEST("Gnarlpine Bounty") }, text = "Have you the fangs? The Council's decree stands until the Gnarlpine are no longer a danger." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Circle. Then you, of all people, should understand why the Council is so stern about the creatures of this forest." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "An outlander on Teldrassil. You are welcome here, but the forest has laws, and you'll keep them as we do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Sentinel Shayla Nightbreeze, and I carry the word of the Council of the Forest along this road. The Gnarlpine furbolgs have fallen to corruption, and the Council has decreed a bounty on them, by strict order." },
        { id = "h_zenn", tags = { "news" }, when = { any = { { questDone = TODO_QUEST("Zenn's Bidding") }, { questActive = TODO_QUEST("Seek Redemption!") } } },
          text = "The Council has learned that you aided Zenn Foulhoof. The satyr is an enemy of the forest, and you killed nature's creatures at his bidding, so you must redeem yourself if you would remain a friend of Teldrassil." },
        { id = "h_redeemed", when = { questDone = TODO_QUEST("Seek Redemption!") },
          text = "Foulhoof croaks in the grass by Dolanaar, and the Council considers your debt paid. I'll not speak of it again, and neither should you." },
      },
      again = {
        { id = "h_again", text = "What else? Speak while we walk." },
        { id = "h_again2", text = "Ask, and be brief. The road is long." },
      },
      choices = {
        { text = "What happened to the Gnarlpine?", next = "gnarlpine" },
        { text = "How do I redeem myself?", next = "redeem", when = { any = { { questDone = TODO_QUEST("Zenn's Bidding") }, { questActive = TODO_QUEST("Seek Redemption!") } } } },
        { text = "What is the Council of the Forest?", next = "council" },
        { text = "You never stop walking, do you?", next = "patrol" },
        { text = "I'll keep to the forest's laws.", next = "END" },
      },
    },

    gnarlpine = {
      lines = { { id = "gn_default", text = "They were friends to our people once, gentle and wise in their way, and they lived beside us in peace. Something has poisoned them, body and mind, and now they attack anyone who walks near Ban'ethil Hollow or the Fel Rock." } },
      choices = {
        { text = "What does the bounty require?", next = "bounty" },
        { text = "Killing old friends seems a cruel answer.", next = "cruel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bounty = {
      lines = { { id = "bo_default", text = "Bring me twenty Gnarlpine fangs as proof of your deeds, and the Council will reward you for clearing the menace from Kalidar. I take no pleasure in the asking, but I'll take the fangs." } },
      choices = {
        { text = "The Council has decided. I'll see it done.", next = "BACK", reply = "Good. The decree is clear, and so should our hands be.", fx = { align = { order = 1 } } },
        { text = "I'll hunt them, but not because a council says so.", next = "BACK", reply = "Your reasons are your own affair, so long as the fangs are real. Go carefully.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cruel = {
      lines = { { id = "cr_default", text = "It is cruel, and the Council knows it. But a furbolg mad with corruption will tear the throat from a child on this road, and I'd rather mourn them than bury our young." } },
      choices = {
        { text = "Mercy can be a blade, too.", next = "BACK", reply = "It can. I think the old Gnarlpine would understand, if any of them were left to ask.", fx = { align = { light = 1 } } },
        { text = "They chose to turn. They earned it.", next = "BACK", reply = "I don't think they chose anything, but the end is the same either way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    redeem = {
      lines = { { id = "re_default", text = "Fel cones fall from the sick trees of this forest, corrupted seeds that billow green smoke. Gather some and give them to Foulhoof outside Dolanaar; he'll think you've brought him a harmless snack, and he'll learn otherwise." } },
      choices = {
        { text = "What will the cones do to him?", next = "cones" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cones = {
      lines = { { id = "co_default", text = "Nothing he doesn't deserve. Syral Bladeleaf says the corruption that made those cones will turn back on whatever corruption eats them, and I am content not to ask how." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    council = {
      lines = { { id = "cu_default", text = "The elders who keep the laws of Teldrassil, so that the new forest grows as it should. They speak through Sentinels like me, and through Syral Bladeleaf and Kyra Starsong in Dolanaar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    patrol = {
      lines = { { id = "pa_default", text = "Not on this road. If I stop, something stops me, and the Council would rather that didn't happen. Walk with me as far as the bridge if you've more to say." } },
      choices = { { text = "Lead on. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I patrol the road between Dolanaar and Darnassus and carry the Council's orders. It is enough." } },
    sentinels = { { id = "tp_sentinels", text = "We guard the forest while the druids sleep and the priestesses pray. Someone must stay awake." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine have gone mad with corruption. The Council has set a bounty on them, and I carry it." } },
    _none = { { id = "tp_none", text = "That is not the Council's concern, and so it isn't mine." } },
  },
}

---------------------------------------------------------------------------
-- Porthannius
---------------------------------------------------------------------------
P:NPC {
  key = "porthannius", id = TODO_NPC("Porthannius"), name = "Porthannius",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "male",
  communities = { "shadowglen" }, temper = { "gentle", "earnest" }, values = { "kind", "dutiful" },
  notices = { "class", "race" },

  impression = {
    first = "He is apologetic in a kindly, slightly fussy way.",
    third = "{name} met Porthannius in Shadowglen, who sends herbs to the Dolanaar inn.",
  },

  greetings = {
    { id = "g_hello", text = "Greetings, young one. Can you offer me aid? It's a small thing, I promise." },
    { id = "g_back", when = { metBefore = true }, text = "Back in Shadowglen? I'm still here, as you see. The druids have kept me talking." },
    { id = "g_active", when = { questActive = TODO_QUEST("Dolanaar Delivery") }, text = "Is the package still in your pack? Keldamyr will be waiting, so don't dawdle too long." },
    { id = "g_done", when = { questDone = TODO_QUEST("Dolanaar Delivery") }, text = "Keldamyr has the herbs, then. Thank you; you've saved an old elf a long walk." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "Another of Shadowglen's druids, freshly woken to the world. The Conservator speaks well of the young ones this season." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You're far from your own lands to be starting out in Shadowglen. The forest will be kind to you, if you're kind to it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Porthannius. I have a package of herbs that must reach Dolanaar, but I still have business with the druids of Shadowglen and cannot yet leave. Would you take it to Innkeeper Keldamyr at the inn, along the road to the south?" },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dolanaar Delivery") },
          text = "Follow the road south out of Shadowglen and you can't miss Dolanaar. Keldamyr keeps the inn there, and he'll know the herbs by their smell before you've unwrapped them." },
        { id = "h_done", when = { questDone = TODO_QUEST("Dolanaar Delivery") },
          text = "You delivered the herbs, and Keldamyr is satisfied, I hope. He's a fine host, and a fine friend, though we've seasons of talk between us still unspoken." },
      },
      again = {
        { id = "h_again", text = "Something else, young one?" },
        { id = "h_again2", text = "Ask away. The druids won't miss me for a moment." },
      },
      choices = {
        { text = "What sort of herbs are they?", next = "herbs" },
        { text = "What business keeps you here?", next = "business" },
        { text = "Who is Keldamyr?", next = "keldamyr" },
        { text = "You could carry it yourself in an afternoon.", next = "lazy" },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    herbs = {
      lines = { { id = "he_default", text = "Peacebloom and silverleaf, gathered in the glade, and a few others the druids grow by the moonwell. Keldamyr uses them for his guests: a tea for the weary, a poultice for the wounded, that sort of thing." } },
      choices = {
        { text = "Does he need them urgently?", next = "urgent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    urgent = {
      lines = { { id = "ur_default", text = "Not urgently, but those who come down from Shadowglen are tired and bruised, and the Gnarlpine have made the road worse this season. Every guest he can mend is one less who goes to Darnassus to be mended." } },
      choices = {
        { text = "Then I'll hurry. They need it.", next = "BACK", reply = "You're kind. I'll tell the druids that Shadowglen's young ones are as good as they look.", fx = { align = { light = 1 } } },
        { text = "They'll manage. A bruise never killed anyone.", next = "BACK", reply = "Perhaps not, but it has made a great many people very cross. Go when you're ready.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    business = {
      lines = { { id = "bu_default", text = "The druids are watching the creatures of the glade more closely than usual. Something has troubled the grells and the nightsabers, and I've been helping them count and record what they find." } },
      choices = {
        { text = "What troubles them?", next = "trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = { { id = "tr_default", text = "Corruption, the druids say, though they don't say it loudly. The new tree is young, and young trees catch sickness more easily than old ones; I trust the Conservator to watch it, and I count what I'm asked to count." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    keldamyr = {
      lines = { { id = "ke_default", text = "The innkeeper of Dolanaar, and as fine a host as you'll find on Teldrassil. He believes that heroes must rest when they can, and he'll tell you so at length." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    lazy = {
      lines = { { id = "la_default", text = "I could, and I'd spend the afternoon talking with Keldamyr and the evening walking back, and the druids would be waiting for me cross. Besides, the walk will do you more good than it would me." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I help the druids of Shadowglen and send what's needed down to Dolanaar. Small work, but it matters to someone." } },
    teldrassil = { { id = "tp_teldrassil", text = "The World Tree is young yet, and young things need watching. I try to be one of the watchers." } },
    _none = { { id = "tp_none", text = "I'm afraid I couldn't say. Ask Keldamyr when you see him; he hears everything at that inn." } },
  },
}

---------------------------------------------------------------------------
-- Kal
---------------------------------------------------------------------------
P:NPC {
  key = "kal", id = TODO_NPC("Kal"), name = "Kal", title = "Druid Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "quest", gender = "male",
  communities = { "dolanaar" }, temper = { "calm", "patient" }, values = { "nature", "balance" },
  notices = { "class", "form" },

  impression = {
    first = "Every word he speaks sounds weighed and found sufficient.",
    third = "{name} met Kal, the druid trainer of Dolanaar, who sends young druids on to Mathrengyl Bearwalker in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Peace to you. Dolanaar welcomes those who walk gently." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Excuse me, friend. Word has come for you from Darnassus." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Good; there's more to learn." },
    { id = "g_done", when = { questDone = TODO_QUEST("Heeding the Call") }, text = "You've met Mathrengyl, and the bear walks with you now. I can see it in your shoulders." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You've grown since Shadowglen. The Conservator would be pleased." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ah, the bear. You wear it well, though you might stand more lightly in town." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kal, and I teach the young druids of Dolanaar what they're ready to learn. Those who aren't druids I simply wish well, and that is a lesson too." },
        { id = "h_druid", when = { class = "DRUID", level = { min = 10 } },
          text = "Mathrengyl Bearwalker has put out word that he wishes to speak with you. Your training as a druid is about to take on a new life, and he will train you himself, in the Cenarion Enclave of Darnassus, on the second floor of the Arch Druid's tree." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Heeding the Call") },
          text = "Mathrengyl awaits you in the Enclave. Don't keep him waiting; he's the Arch Druid's own assistant, and his patience is long but not endless." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak; there's time." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Who is Mathrengyl Bearwalker?", next = "mathrengyl" },
        { text = "What happens when I meet him?", next = "bear", when = { class = "DRUID" } },
        { text = "What does a druid learn in Dolanaar?", next = "learn" },
        { text = "Dolanaar seems peaceful.", next = "peace" },
        { text = "Farewell, Kal.", next = "END" },
      },
    },

    mathrengyl = {
      lines = { { id = "ma_default", text = "The direct assistant to Arch Druid Fandral Staghelm himself, and one of the most sage and august druids on Teldrassil. When he sends for a student, the student goes." } },
      choices = {
        { text = "Is he a hard teacher?", next = "mathrengyl2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mathrengyl2 = {
      lines = { { id = "m2_default", text = "Hard, and fair, and very slow to praise. He'll ask more of you than I have, and he'll be right to, because the bear asks more of you than anything I've taught." } },
      choices = {
        { text = "Good. I want to be tested.", next = "BACK", reply = "You will be, I promise you. Remember that you asked.", fx = { align = { order = 1 } } },
        { text = "I'll learn at my own pace, whatever he asks.", next = "BACK", reply = "Then you and Mathrengyl will have an interesting conversation. Go gently with each other.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bear = {
      lines = { { id = "be_default", text = "He'll teach you the ways of the bear, and strength of body and heart. The bear is the first great shape, and the one that teaches a druid that strength and patience are the same thing seen from two sides." } },
      choices = {
        { text = "Strength and patience, the same?", next = "bear2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bear2 = {
      lines = { { id = "b2_default", text = "A bear sleeps all winter and wakes with the strength to move a tree. You'll understand it once you've worn the shape, and not before, so don't trouble yourself with it now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    learn = {
      lines = { { id = "le_default", text = "To heal, to strike with the forest's wrath, to tend the roots and the wounded alike. The great shapes come later; first a druid must learn to listen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    peace = {
      lines = { { id = "pe_default", text = "It is, inside the village. Outside, the Gnarlpine grow wilder each season, and the Sentinels walk the roads with their glaives drawn. Peace is something we keep, not something we're given." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I teach the young druids of Dolanaar, and send them on to Darnassus when they are ready." } },
    cenarion_circle = { { id = "tp_circle", text = "Every druid of Teldrassil is a child of the Circle. Mathrengyl and the Arch Druid lead it from the Enclave." } },
    _none = { { id = "tp_none", text = "I don't know. The forest doesn't tell me everything, and I've learned not to mind." } },
  },
}

---------------------------------------------------------------------------
-- Keldas
---------------------------------------------------------------------------
P:NPC {
  key = "keldas", id = TODO_NPC("Keldas"), name = "Keldas", title = "Pet Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "dolanaar" }, temper = { "warm", "patient" }, values = { "nature", "kind" },
  notices = { "class", "pet" },

  impression = {
    first = "He talks to the animals before he talks to their owners.",
    third = "{name} met Keldas, the pet trainer of Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Hello, and hello to whoever's with you, if anyone is." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "And who is this? Hello, {pet}. Your hunter can wait a moment." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me see how your companion's coming along." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Have you found your first companion yet, or are you still looking?" },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} looks well fed and well treated. That's half of what I teach, and you've already learned it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Keldas, and I help hunters teach their companions what they need to know. The beasts do most of the learning; I mostly teach the hunters to listen." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend?" },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Train my pet.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you train a beast?", next = "train" },
        { text = "What beast should I tame here?", next = "tame", when = { class = "HUNTER" } },
        { text = "Animals don't need teaching. They need leading.", next = "leading" },
        { text = "Good day.", next = "END" },
      },
    },

    train = {
      lines = { { id = "tr_default", text = "Patiently, and with respect. A beast learns what you show it, so if you show it fear, it learns fear, and if you show it trust, it learns to put itself between you and harm." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tame = {
      lines = { { id = "ta_default", text = "The nightsabers of the glades are the pride of our people, quick and quiet. The striders are sturdier than they look, and the owls are clever, if you can stand the hooting." } },
      choices = {
        { text = "Dazalar sent me to learn the beast's ways.", next = "dazalar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dazalar = {
      lines = { { id = "da_default", text = "Then you're in good hands. Dazalar teaches the taming and I teach what comes after, and between the two of us we've sent a great many fine pairs out into the world." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    leading = {
      lines = { { id = "le_default", text = "Some hunters think so, and their beasts follow them, right up until the day they don't. A companion who trusts you will follow you anywhere, and one who only obeys will follow you only as far as it must." } },
      choices = {
        { text = "Trust, then. You've convinced me.", next = "BACK", reply = "Good. Your companion will thank you, in its way.", fx = { align = { order = -1 } } },
        { text = "Obedience keeps a beast alive in a fight.", next = "BACK", reply = "It does, I'll grant you, so long as you're there to give the order.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I train hunters' companions in Dolanaar. The beasts are better students than the hunters." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask me about beasts, and I'll be more use." } },
  },
}

---------------------------------------------------------------------------
-- Meri Ironweave
---------------------------------------------------------------------------
P:NPC {
  key = "meri", id = TODO_NPC("Meri Ironweave"), name = "Meri Ironweave", title = "Armorer & Shieldcrafter",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "dolanaar" }, temper = { "brisk", "cheerful" }, values = { "craft", "practical" },
  notices = { "class", "kit" },

  impression = {
    first = "She seems faintly amused by her own name.",
    third = "{name} met Meri Ironweave, the armorer of Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Mail, shields, and a strap or two. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Still standing? Good, then my shields are doing their work." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. You'll want a shield before you go near the Gnarlpine, trust me." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter? I've some light mail that won't spoil your aim, if you're interested." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Meri Ironweave, armorer and shieldcrafter of Dolanaar. Most of what I sell goes out the door on young shoulders heading for the Gnarlpine or the Fel Rock." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else can I do for you?" },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Ironweave? That's not a night elf name.", next = "name" },
        { text = "What should a newcomer wear?", next = "newcomer" },
        { text = "Good day.", next = "END" },
      },
    },

    name = {
      lines = { { id = "na_default", text = "It is now, since it's mine. My family took it for our craft, weaving rings of iron into mail, and the dwarves who come through always laugh and ask whether I've a beard hidden somewhere." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    newcomer = {
      lines = { { id = "ne_default", text = "Something that lets you run. The Gnarlpine are strong and the spiders at the Fel Rock are quick, and a newcomer in heavy armor tends to stand still and learn about both." } },
      choices = {
        { text = "Better to stand and fight than run.", next = "BACK", reply = "Then buy a shield, and buy the stout one. I'll be here when you need the next.", fx = { align = { honor = 1 } } },
        { text = "Running away is sound tactics.", next = "BACK", reply = "It is, and it's kept a great many young elves alive. Take the light mail, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell mail and shields in Dolanaar. It's honest work, and it keeps the young ones alive." } },
    _none = { { id = "tp_none", text = "I wouldn't know. Ask me about rivets and I'll talk your ear off." } },
  },
}

---------------------------------------------------------------------------
-- Shalomon
---------------------------------------------------------------------------
P:NPC {
  key = "shalomon", id = TODO_NPC("Shalomon"), name = "Shalomon", title = "Weaponsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "dolanaar" }, temper = { "quiet", "dry" }, values = { "craft", "respect" },
  notices = { "class", "race" },

  impression = {
    first = "He says little and means all of it.",
    third = "{name} met Shalomon, the weaponsmith of Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Blades and staves. Take your time choosing." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Did the last blade serve you well?" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You hold yourself like someone who's been taught by a good master. The Warrior's Terrace, or your own people?" },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. You'll find my steel light by your standards, I expect, but you'll also find it doesn't break." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Shalomon, and I sell weapons to those who must defend Dolanaar and the roads beyond it. I would rather sell fewer, but there's no sign of that happening soon." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why would you sell fewer?", next = "fewer" },
        { text = "What weapon suits me?", next = "suits" },
        { text = "Good day.", next = "END" },
      },
    },

    fewer = {
      lines = { { id = "fe_default", text = "Because each blade I sell means something on this island needs killing. When I was young, Teldrassil was barely a sapling and the forest asked nothing of us but care. Now the Gnarlpine have gone mad, and I sell more every season." } },
      choices = {
        { text = "Weapons protect. There's no shame in selling them.", next = "BACK", reply = "No shame, perhaps. But no joy either, and I'd like a little joy in my work.", fx = { align = { light = 1 } } },
        { text = "The forest has always needed killing. That's nature.", next = "BACK", reply = "Spoken like a hunter, and you may be right. I'll sell the blades either way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    suits = {
      lines = {
        { id = "su_default", text = "Whatever you can hold without thinking about it. A blade you have to think about is a blade that slows you down." },
        { id = "su_rogue", when = { class = "ROGUE" }, text = "Something short and sharp, by the look of you, and something you can hide. I'll not ask why." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell weapons in Dolanaar. More every season, for worse reasons every season." } },
    _none = { { id = "tp_none", text = "I don't know. I keep to my blades." } },
  },
}

---------------------------------------------------------------------------
-- Danlyia
---------------------------------------------------------------------------
P:NPC {
  key = "danlyia", id = TODO_NPC("Danlyia"), name = "Danlyia", title = "Food & Drink",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "dolanaar" }, temper = { "cheerful", "chatty" }, values = { "hospitality", "friendly" },
  notices = { "race", "weary" },

  impression = {
    first = "She tells you who is quarrelling with whom while wrapping your bread.",
    third = "{name} met Danlyia, who sells food and drink in Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Hungry? Thirsty? Both? Come in, everything's fresh today." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! I saved you a moonberry, or I meant to." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { resting = true },
      text = "You look worn through. Eat something before Keldamyr sees you, or he'll give you a lecture about rest." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! I've some cheese from Darnassus you might like; I'm told it's not as good as Ironforge's, but it's closer." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Danlyia, and I keep Dolanaar fed when Keldamyr's kitchen is busy. Bread, water, cheese and fruit, all of it from the island, or near enough." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've time, the bread's still rising." },
        { id = "h_again2", text = "What else, friend?" },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "What's the news in Dolanaar?", next = "news" },
        { text = "You and Keldamyr are rivals, then?", next = "keldamyr" },
        { text = "Good day.", next = "END" },
      },
    },

    news = {
      lines = { { id = "ne_default", text = "The Gnarlpine have been seen near the road again, and the Sentinels are all grim about it. And Zenn Foulhoof, that dreadful satyr by the lake, has been trying to get young adventurers to hunt for him, so if he asks, say no." } },
      choices = {
        { text = "What's wrong with helping him?", next = "zenn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zenn = {
      lines = { { id = "ze_default", text = "He's a satyr, friend, and satyrs serve nothing but their own hungers. The Council knows everything that happens on this island, too, so if you help him, you'll hear about it from a Sentinel soon enough." } },
      choices = {
        { text = "Good advice. I'll stay clear of him.", next = "BACK", reply = "Good. I'd hate to see you turned into an example.", fx = { align = { order = 1 } } },
        { text = "I'll judge him for myself.", next = "BACK", reply = "Well, don't say I didn't warn you. Come and tell me how it goes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    keldamyr = {
      lines = { { id = "ke_default", text = "Rivals? Goodness, no. He has the inn and the beds, and I have the bread and the gossip, and we each send folk to the other. He just thinks everyone should rest more, and I think everyone should eat more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell food and drink in Dolanaar. I also know everyone's business, but that's free." } },
    _none = { { id = "tp_none", text = "Oh, I haven't heard a thing about that, and I hear most things. Ask Keldamyr?" } },
  },
}
