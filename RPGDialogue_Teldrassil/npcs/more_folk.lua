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
    first = "Sentinel Shayla Nightbreeze walks the road between Dolanaar and Darnassus and carries the Council's orders as if each one were carved in stone. She keeps a list of who has wronged the forest.",
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
    first = "Porthannius has a package of herbs for Dolanaar and too much business with the druids of Shadowglen to carry it himself. He is apologetic about it, in a kindly, slightly fussy way.",
    third = "{name} met Porthannius in Shadowglen, who sends herbs to the Dolanaar inn.",
  },

  greetings = {
    { id = "g_hello", text = "Greetings, young one. Can you offer me aid? It's a small thing, I promise." },
    { id = "g_back", when = { metBefore = true }, text = "Back in Shadowglen? I'm still here, as you see. The druids have kept me talking." },
    { id = "g_active", when = { questActive = TODO_QUEST("Dolanaar Delivery") }, text = "Is the package still in your pack? Keldamyr will be waiting, so don't dawdle too long." },
    { id = "g_done", when = { questDone = TODO_QUEST("Dolanaar Delivery") }, text = "Keldamyr has the herbs, then. Thank you; you've saved an old elf a long walk." },
  },

  notice = {
    { id = "n_herb", cat = "class", when = { profession = "Herbalism" },
      text = "Those are an herbalist's stained fingers, if I am any judge. Then you will carry my package the right way up, which is more than I can say for the last messenger." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "Another of Shadowglen's druids, freshly woken to the world. The Conservator speaks well of the young ones this season." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You're far from your own lands to be starting out in Shadowglen. The forest will be kind to you, if you're kind to it." },
  },

  start = "hello",
  nodes = {
    folk = {
      lines = { { id = "fk_default", text = "After so many seasons, I ought to. Conservator Ilthalaine watches the balance of the glade, Melithar Staghelm sees to the young who have just woken, and Tenaron Stormgrip sits atop Aldrassil and thinks about the tree itself. I carry word and bundles between them, since none of the three cares to leave his post." } },
      choices = {
        { text = "And which of them worries most?", next = "folk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk2 = {
      lines = { { id = "fk2_default", text = "Tenaron, though he hides it best. He has had water drawn from the moonwell and sent up to Darnassus more than once this year, and a druid does not send vials to the Arch Druid's own people because he is content. I do not ask, and I do notice." } },
      choices = {
        { text = "The young should be told if the tree is ailing.", next = "BACK", reply = "Perhaps so. I think they will be, when Tenaron knows what to tell them, and no sooner.", fx = { align = { order = -1 } } },
        { text = "Let the elders be sure before they speak.", next = "BACK", reply = "That is my own feeling, young one. A half-known fear does more harm than a whole one.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } },
      },
    },
    xherb = {
      lines = { { id = "xh_default", text = "By all means, only do not loosen the twine. You will see the silverleaf is cut above the second joint so that the plant comes again, and the peacebloom is taken with the dew still on it. The druids here are particular, and they have made me so." } },
      choices = { { text = "It's well gathered. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xbalance = {
      lines = { { id = "xb_default", text = "So he told me, and I wrote your tally in my record beside his. It is a hard first lesson, to be asked to kill in order to keep a place whole, and I thought no less of the young ones who came back quiet from it." } },
      choices = {
        { text = "It was needed. I'd do it again.", next = "BACK", reply = "That is the Conservator's own view, and he has kept this glade a long while. Good.", fx = { align = { order = 1 } } },
        { text = "It sat badly with me, needed or not.", next = "BACK", reply = "Then it sat as it should. I would worry for a druid's glade if it sat easily with everyone.", fx = { align = { order = -1 } } },
      },
    },
    xdruid = {
      lines = { { id = "xdr_default", text = "More grells than last year by a third, and bolder ones, and nightsabers ranging closer to Aldrassil than they ought. The webwood spiders at Shadowthread Cave are larger with every count as well. I only record it, but Ilthalaine reads my pages twice." } },
      choices = { { text = "I'll keep my own eyes open. Something else.", next = "BACK", fx = { learn = { "teldrassil" } } } },
    },
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
        { id = "h_again3", text = "Yes, young one? I am glad of the company, truth be told, for counting grells is lonely work." },
        { id = "h_again", text = "Something else, young one?" },
        { id = "h_again2", text = "Ask away. The druids won't miss me for a moment." },
      },
      choices = {
        { text = "What sort of herbs are they?", next = "herbs" },
        { text = "What business keeps you here?", next = "business" },
        { text = "Who is Keldamyr?", next = "keldamyr" },
        { text = "You could carry it yourself in an afternoon.", next = "lazy" },
        { text = "You know the folk of Shadowglen well.", next = "folk" },
        { text = "I gather herbs myself. Let me see the bundle.", next = "xherb", when = { profession = "Herbalism" } },
        { text = "The Conservator set me to thinning the glade.", next = "xbalance", when = { questDone = TODO_QUEST("The Balance of Nature") } },
        { text = "I'm of the Circle. What did your count show?", next = "xdruid", when = { class = "DRUID" } },
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
    advice = { { id = "tp_advice", text = "Keep to the road between Shadowglen and Dolanaar, young one. It is short, and the Sentinels watch it, which they cannot do for the woods." } },
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
    first = "Kal teaches young druids in Dolanaar and speaks as if every word had been weighed and found sufficient. He is the first to tell a druid when the Enclave is ready for them.",
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
    first = "Keldas trains hunters' companions in Dolanaar and talks to the animals before he talks to their owners. He seems to think that's the right order.",
    third = "{name} met Keldas, the pet trainer of Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Hello, and hello to whoever's with you, if anyone is." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "And who is this? Hello, {pet}. Your hunter can wait a moment." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me see how your companion's coming along." },
  },

  notice = {
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "HUNTER" },
      text = "A dwarf hunter! Your people favour bears and boars, I'm told, and good stout ones. I should like to meet one, if you ever bring it this far." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Have you found your first companion yet, or are you still looking?" },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} looks well fed and well treated. That's half of what I teach, and you've already learned it." },
  },

  start = "hello",
  nodes = {
    talk = {
      lines = { { id = "tk_default", text = "I do, because the animal will tell me the truth. A hunter says the bond is strong, and then I watch the beast flinch when a hand is raised, and I know what I am really here to mend. I say nothing sharp about it, and I simply begin with the hand." } },
      choices = {
        { text = "And when the hunter won't learn?", next = "talk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk2 = {
      lines = { { id = "tk2_default", text = "Then I tell Dazalar, and he has a quiet word, and usually that is enough. Once it was not, and the nightsaber walked back into the glade of her own accord, and nobody here stopped her. A beast is a companion and never a possession, whatever was paid for the collar." } },
      choices = {
        { text = "You did right to let her go.", next = "BACK", reply = "I think so. The hunter did not, at the time, though he came back a year later and said it.", fx = { align = { light = 1 } } },
        { text = "A tamed beast belongs to its hunter.", next = "BACK", reply = "So some believe, and their beasts know it. I would ask you to watch your own companion's eyes when you say that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stable = {
      lines = { { id = "sb_default", text = "Every day. Seriadne houses and feeds them, and I see to their schooling, and she tells me which ones were restless in the night before I have even asked. Between us we know every companion that has passed through Dolanaar this past century, and a fair number of their hunters." } },
      choices = { { text = "A good arrangement. Something else.", next = "BACK" } },
    },
    sick = {
      lines = { { id = "sk_default", text = "No, they are not, and you have a good eye to have seen it. The nightsabers nearest Ban'ethil have turned short-tempered, and the owls about the Oracle Glade fly by day as if something drove them from their roosts. I do not let my students tame from either place until the druids can tell me why." } },
      choices = {
        { text = "What do the druids say?", next = "sick2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sick2 = {
      lines = { { id = "sk2_default", text = "That the tree is young and that young things take ill easily, which is what they say of everything this season. Denalan at Lake Al'Ameth is franker than most, and he tells me the plants have changed too. I trust the beasts' judgment above anyone's, and the beasts are uneasy." } },
      choices = { { text = "Then I'll watch them as I travel. Something else.", next = "BACK", fx = { learn = { "teldrassil" } } } },
    },
    xdruid = {
      lines = { { id = "xd_default", text = "A druid's way is the deepest there is, for you can ask the cat what troubles her in her own shape. I envy it a little. If you pass the kennels as a nightsaber, go gently, because my students' beasts will not know what to make of you." } },
      choices = { { text = "I'll walk past on two legs. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Keldas, and I help hunters teach their companions what they need to know. The beasts do most of the learning; I mostly teach the hunters to listen." },
      },
      again = {
        { id = "h_again3", text = "Ask what you like. The young strider behind me has finished sulking, so I've a moment." },
        { id = "h_again", text = "Anything else, friend?" },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Train my pet.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you train a beast?", next = "train" },
        { text = "What beast should I tame here?", next = "tame", when = { class = "HUNTER" } },
        { text = "Animals don't need teaching. They need leading.", next = "leading" },
        { text = "You talk to the animals before their owners.", next = "talk" },
        { text = "Seriadne keeps the stable here. You must work together.", next = "stable" },
        { text = "Not all the island's beasts are as they should be.", next = "sick" },
        { text = "I'm no hunter, but I've always had a way with animals.", next = "xdruid", when = { class = "DRUID" } },
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
    teldrassil = { { id = "tp_teldrassil", text = "The beasts were the first to notice that something on this island is amiss. They usually are, if anyone troubles to watch them." } },
    advice = { { id = "tp_advice", text = "Feed your companion before yourself at the end of a day's march. It costs you a few minutes and buys you a great deal." } },
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
    first = "Meri Ironweave sells mail and shields in Dolanaar, cheerfully, and seems faintly amused by her own name. Her goods are plain and well made.",
    third = "{name} met Meri Ironweave, the armorer of Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Mail, shields, and a strap or two. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Still standing? Good, then my shields are doing their work." },
  },

  notice = {
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf" },
      text = "A dwarf! Go on, then, say it. Ironweave. I've heard every jest your people have, and I've started keeping a tally of the good ones." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. You'll want a shield before you go near the Gnarlpine, trust me." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter? I've some light mail that won't spoil your aim, if you're interested." },
  },

  start = "hello",
  nodes = {
    young = {
      lines = { { id = "yo_default", text = "Most of them do, I'm glad to say, and they come back with dents to show me as if I were their mother. Sentinel Kyra Starsong sends them up to Ban'ethil, and Tallonkai sends them to Gaerolas at the barrow, and I get to see what the Gnarlpine did to my shields on the way." } },
      choices = {
        { text = "What do the dents tell you?", next = "young2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    young2 = {
      lines = { { id = "yo2_default", text = "That the furbolgs are hitting harder than they used to. I've a shield on the back wall with the boss stove right in, and the girl who carried it swears a single Gnarlpine did it with a club. Ten years ago they'd have run from a raised voice." } },
      choices = {
        { text = "Then the young ones shouldn't be sent at all.", next = "BACK", reply = "I've thought it, some nights. But somebody must go, and I'd rather it were someone carrying my work.", fx = { align = { light = 1 } } },
        { text = "Hard knocks make hard fighters. Send them.", next = "BACK", reply = "They do, when the fighter lives through them. That's my half of the bargain.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    smiths = {
      lines = { { id = "sm_default", text = "They are, and good ones. Shalomon sells the blades and says about six words a day, Jeena Featherbow strings the bows, and Sinda cuts the leathers. We share one fire in the cold months, and I do all the talking for the four of us." } },
      choices = {
        { text = "Shalomon seems heavy-hearted.", next = "smiths2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smiths2 = {
      lines = { { id = "sm2_default", text = "He is, bless him. He minds what his blades are used for, and it weighs on him more each season. I tell him that a shield is only ever a kindness, and that he ought to have taken up my trade, and once in a while he nearly smiles." } },
      choices = { { text = "He's lucky in his neighbour. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xdwarf = {
      lines = { { id = "xd_default", text = "Ha! That's one for the tally, though it's the commonest. No beard, but I'll match rings with any smith in Ironforge, and I once made a dwarf from the boats admit my rivets were tidy, which I'm told is as near as your people come to weeping." } },
      choices = { { text = "Tidy is high praise. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    xsmith = {
      lines = { { id = "xs_default", text = "Gladly. Each ring's riveted, never butted, with a flat peen so nothing catches the cloth under it, and I work four into one the old way. It takes a week for a shirt, and I've never had one come back split." } },
      choices = { { text = "That's patient work. Something else.", next = "BACK" } },
    },
    xwar = {
      lines = { { id = "xw_default", text = "Then take the round one with the iron rim, and keep your elbow tucked. Kyra Windblade teaches the stance at the edge of the village, and she'll tell you what I do: the shield isn't there to hide behind, it's there so somebody else can." } },
      choices = { { text = "So somebody else can. I'll remember that.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Meri Ironweave, armorer and shieldcrafter of Dolanaar. Most of what I sell goes out the door on young shoulders heading for the Gnarlpine or the Fel Rock." },
      },
      again = {
        { id = "h_again3", text = "Go on, ask! I can link rings in my sleep, so you'll not be keeping me from anything." },
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else can I do for you?" },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Ironweave? That's not a night elf name.", next = "name" },
        { text = "What should a newcomer wear?", next = "newcomer" },
        { text = "You must know which young ones come back.", next = "young" },
        { text = "Dolanaar's other smiths are your neighbours.", next = "smiths" },
        { text = "Any beard hidden, then?", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I've worked a forge. Show me how you close the rings.", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "I'll be holding the line with this shield.", next = "xwar", when = { class = { "WARRIOR", "PALADIN" } } },
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
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine hit harder every season. I can read it in the shields that come back to me." } },
    advice = { { id = "tp_advice", text = "Oil your mail after rain, every time. This island's damp will rust a shirt in a week if you let it." } },
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
    first = "Shalomon sells weapons in Dolanaar and handles every blade as if it might still be useful to someone he cares about. He says little and means all of it.",
    third = "{name} met Shalomon, the weaponsmith of Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Blades and staves. Take your time choosing." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Did the last blade serve you well?" },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. I keep a few staves of Teldrassil wood, fallen and never cut. I thought you would wish to know that before you asked." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You hold yourself like someone who's been taught by a good master. The Warrior's Terrace, or your own people?" },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. You'll find my steel light by your standards, I expect, but you'll also find it doesn't break." },
  },

  start = "hello",
  nodes = {
    fire = {
      lines = { { id = "fi_default", text = "We do. Meri Ironweave talks, Jeena Featherbow mends her strings, and I listen. It is the best hour of my day, though I have never found the way to say so to either of them." } },
      choices = {
        { text = "Meri worries for you.", next = "fire2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire2 = {
      lines = { { id = "fi2_default", text = "I know it, and I am sorry to be a cause of worry. She believes a shield is a kindness and a blade is a grief, and she is not wrong. But someone must sell the blades, and it had better be someone who takes no pleasure in it." } },
      choices = {
        { text = "That is exactly who should sell them.", next = "BACK", reply = "So I tell myself each morning. It is good to hear it in another voice.", fx = { align = { honor = 1 } } },
        { text = "A trade you grieve over is the wrong trade.", next = "BACK", reply = "Perhaps. I have thought of bows, or of ploughs. But the Gnarlpine would not wait while I learned.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    once = {
      lines = { { id = "on_default", text = "I did, at Hyjal, with a great many others. I will not make a tale of it. I came home and found that I could no longer bear to sharpen an edge for my own hand, and so I sharpen them for others, who still can." } },
      choices = {
        { text = "What do you tell the young who buy from you?", next = "once2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    once2 = {
      lines = { { id = "on2_default", text = "To come back. I say it to every one, and Sentinel Kyra Starsong has told me it has become a kind of blessing among her recruits, which I never intended. If it helps even one of them remember to turn for home, I do not mind." } },
      choices = { { text = "It's a good blessing. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xsmith = {
      lines = { { id = "xs_default", text = "Slowly, in water from the moonwell, and never twice. Our steel is folded thin and trusts its edge more than its weight. A dwarf would call it a kitchen knife, until he had seen it turn a furbolg's club without a notch." } },
      choices = { { text = "I'd like to see that. Something else.", next = "BACK" } },
    },
    xguard = {
      lines = { { id = "xg_default", text = "Then I will not grieve over this one. Tallonkai Swiftroot will tell you where the Gnarlpine press hardest, and Athridas Bearmantle will tell you why. Listen to both before you draw it." } },
      choices = { { text = "I'll hear them first. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Shalomon, and I sell weapons to those who must defend Dolanaar and the roads beyond it. I would rather sell fewer, but there's no sign of that happening soon." },
      },
      again = {
        { id = "h_again3", text = "Ask. I am in no hurry, and the blades are in less." },
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why would you sell fewer?", next = "fewer" },
        { text = "What weapon suits me?", next = "suits" },
        { text = "Meri says you share a fire in the cold months.", next = "fire" },
        { text = "You carried a blade yourself once, I think.", next = "once" },
        { text = "Light steel has its uses. Tell me how you temper it.", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "I'll use what I buy to guard this village.", next = "xguard", when = { race = "NightElf" } },
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
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine were neighbours once. I think of that with every blade I hand across." } },
    advice = { { id = "tp_advice", text = "Come back. That is all the advice I have, and I give it to everyone." } },
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
    first = "Danlyia sells food and drink in Dolanaar and talks while she wraps it. By the time the bread is in your pack, she has told you who in the village is quarrelling with whom.",
    third = "{name} met Danlyia, who sells food and drink in Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Hungry? Thirsty? Both? Come in, everything's fresh today." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! I saved you a moonberry, or I meant to." },
  },

  notice = {
    { id = "n_druid", cat = "race", when = { class = "DRUID" },
      text = "A druid! Kal will have been at you about balance already, I expect. Have a pear, it's the only balanced thing I sell." },
    { id = "n_weary", cat = "weary", when = { resting = true },
      text = "You look worn through. Eat something before Keldamyr sees you, or he'll give you a lecture about rest." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! I've some cheese from Darnassus you might like; I'm told it's not as good as Ironforge's, but it's closer." },
  },

  start = "hello",
  nodes = {
    quarrel = {
      lines = { { id = "qu_default", text = "Well, since you ask. Zarrin and Nyoma are not speaking, because he changed her soup recipe in front of a student, and Syral Bladeleaf has told Tallonkai Swiftroot twice that he frets too much about the furbolgs, which only makes him fret more. It is all very gentle, as quarrels go, but it is what we have." } },
      choices = {
        { text = "And what does Tallonkai fret about?", next = "quarrel2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarrel2 = {
      lines = { { id = "qu2_default", text = "The Gnarlpine, friend, and I think he is right to. They were quiet neighbours at Ban'ethil when I was young, and now they snarl at the road and paint themselves with something green that glows. Athridas Bearmantle has been sending young ones up there to find out what has got into them." } },
      choices = {
        { text = "The village should stop bickering and stand together.", next = "BACK", reply = "Oh, it will, when it matters. We only bicker because nothing has frightened us quite enough yet.", fx = { align = { order = 1 } } },
        { text = "A little bickering keeps a village honest.", next = "BACK", reply = "That's what I always say! Nobody thanks me for it, mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    island = {
      lines = { { id = "is_default", text = "Near enough! The pears and moonberries grow along the road to Darnassus, the cheese comes down from the city, and the water I draw at the moonwell with Corithras Moonrage's leave. He blesses it, I think, or at any rate he looks at it very seriously." } },
      choices = {
        { text = "Has the food changed since the tree was planted?", next = "island2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    island2 = {
      lines = { { id = "is2_default", text = "What a clever question. The fruit grows faster than it ever did on the mainland, and bigger, and Denalan down at the lake says some of the plants have gone strange besides. My pears are only large, thank Elune, and I mean to keep selling them until one of them looks back at me." } },
      choices = { { text = "I'll check mine before I bite. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    xnelf = {
      lines = { { id = "xn_default", text = "Then you know I am doing the village a service! Somebody has to carry the news from the inn to the moonwell and back, and it might as well be someone who brings bread with it. Which village was yours? I shall know someone there, I always do." } },
      choices = { { text = "I'll tell you when the bread's wrapped. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xcook = {
      lines = { { id = "xc_default", text = "Nyoma's, for the bread, and my grandmother's for everything else. If you want to learn properly, Zarrin teaches at the inn, but for pity's sake praise Nyoma's soup in front of him and let me watch." } },
      choices = { { text = "I'll keep out of that quarrel. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Danlyia, and I keep Dolanaar fed when Keldamyr's kitchen is busy. Bread, water, cheese and fruit, all of it from the island, or near enough." },
      },
      again = {
        { id = "h_again3", text = "Oh, do ask! I've been dying to tell somebody something all morning." },
        { id = "h_again", text = "Anything else? I've time, the bread's still rising." },
        { id = "h_again2", text = "What else, friend?" },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "What's the news in Dolanaar?", next = "news" },
        { text = "You and Keldamyr are rivals, then?", next = "keldamyr" },
        { text = "So who is quarrelling with whom this week?", next = "quarrel" },
        { text = "Everything from the island, you said.", next = "island" },
        { text = "I grew up in a village like this. Nothing stays secret.", next = "xnelf", when = { race = "NightElf" } },
        { text = "I cook a little. Whose recipes do you use?", next = "xcook", when = { profession = "Cooking" } },
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
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine used to trade honey for my bread at the edge of the village. Now Tallonkai won't let me walk the Ban'ethil road alone." } },
    advice = { { id = "tp_advice", text = "Eat something before you go up to the Fel Rock, friend. Everyone who comes back from there says they lost their appetite for a week." } },
    background = { { id = "tp_bg", text = "I sell food and drink in Dolanaar. I also know everyone's business, but that's free." } },
    _none = { { id = "tp_none", text = "Oh, I haven't heard a thing about that, and I hear most things. Ask Keldamyr?" } },
  },
}

---------------------------------------------------------------------------
-- Tarindrella
---------------------------------------------------------------------------
P:NPC {
  key = "tarindrella", id = TODO_NPC("Tarindrella"), name = "Tarindrella",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "female",
  communities = { "shadowglen" }, temper = { "watchful", "gentle" }, values = { "nature", "dutiful" },
  notices = { "class", "race" },

  impression = {
    first = "Tarindrella is a dryad who has come back to Shadowglen after years away, because something foul is growing on the creatures of the new World Tree. She is gentle in manner and entirely serious about what she has found.",
    third = "{name} met the dryad Tarindrella in Shadowglen, who is tracing a taint among the glade's creatures.",
  },

  greetings = {
    { id = "g_hello", text = "Softly, young one. The glade is listening, and I should like to know what it hears when you walk in it." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to me. The forest remembers your step, and so do I." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Woodland Protector") }, text = "Have you the fel moss? Handle it with a leaf, never with your bare fingers." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Woodland Protector") }, text = "The moss is burned and the ash is buried deep. You did the glade a service, and I have told the Conservator so." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A young druid, newly woken. Then you may feel it as I do, a sourness under the green, like a note sung a little flat." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You will have seen it in the eyes of the grells before you loosed, a meanness that was not there in years past." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "A child of the far lands, here under Aldrassil! The trees do not know your scent yet. Walk gently, and they will learn it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tarindrella, a daughter of Cenarius and a keeper of the wood. I had not thought to walk under this tree, for it was raised without my father's blessing. But the forest spirits whispered of a taint in Shadowglen, and I could not stay away." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Woodland Protector") }, text = "The grells and grellkin to the north-west carry a moss upon them that is not of this world. Gather it from them, eight pieces if you can, so that I may see how far it has spread." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Woodland Protector") }, text = "It was fel moss, as I feared, and it grows on the grells because something has fed it. The Gnarlpine furbolgs carry it too, I think. Tell Melithar that the dryad's worry was well founded." },
      },
      again = {
        { id = "h_again", text = "Ask, young one. The wood is patient, and so am I." },
        { id = "h_again2", text = "What more would you know? Speak softly, and I will answer the same way." },
        { id = "h_again3", text = "Something else? The spirits and I are listening." },
      },
      choices = {
        { text = "Why has a dryad come to Shadowglen?", next = "why" },
        { text = "What is the taint you sense?", next = "taint" },
        { text = "The tree was raised without Cenarius's blessing?", next = "blessing" },
        { text = "I burned the moss. What fed it, do you think?", next = "xdone", when = { questDone = TODO_QUEST("The Woodland Protector") } },
        { text = "I am of the Circle. Teach me to hear what you hear.", next = "xdruid", when = { class = "DRUID" } },
        { text = "I've never met one of your kind. What are you?", next = "xrace", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Walk in peace, Tarindrella.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "why_default", text = "Because the small things called to me. A forest speaks first through its least creatures, the moths and the mice, and those of Shadowglen have been uneasy for a season. Melithar Staghelm sensed that I was near, and he was wise enough to send someone to ask rather than assume." },
      },
      choices = {
        { text = "The druids here didn't notice themselves?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = {
        { id = "why2_default", text = "Conservator Ilthalaine noticed that the beasts were too many and too bold, and he set the young to thinning them. That was sound. But he looked at the numbers, and I looked at the fur, and the answer was in the fur." },
      },
      choices = {
        { text = "The druids should have looked closer.", next = "BACK", reply = "Perhaps. But they are few, and the tree is vast, and they asked for help when it was offered.", fx = { align = { order = -1 } } },
        { text = "They did their duty. You saw what they couldn't.", next = "BACK", reply = "That is kindly put, and true. We each see a different part of the wood.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    taint = {
      lines = {
        { id = "taint_default", text = "A growth, green and faintly bright, that clings to the grells like lichen to a stone. It is fel moss, a thing that feeds where demon magic has touched. It makes the creature that bears it quarrelsome first, and cruel after." },
      },
      choices = {
        { text = "Demon magic, on Teldrassil?", next = "taint2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taint2 = {
      lines = {
        { id = "taint2_default", text = "So it would seem, and I do not yet know whence. The Legion was broken at Hyjal, but its leavings are in the soil of half Kalimdor, and this tree drank from that soil as it grew. I would rather you heard that from me than guessed it." },
      },
      choices = {
        { text = "Better to know. Something else.", next = "BACK", fx = { learn = { "fel_moss" } } },
      },
    },
    blessing = {
      lines = {
        { id = "blessing_default", text = "It was. The Arch Druid Staghelm and his followers planted Teldrassil to win back what our people lost at Hyjal, and they did not wait for the consent of Nature or the Aspects. I do not say this to shame them. I say it because a tree with no blessing has no shield." },
      },
      choices = {
        { text = "They were wrong to plant it. Pride has a price.", next = "BACK", reply = "It has, and the wood pays it before the planters do. Yet the tree lives, and living things deserve tending.", fx = { align = { order = 1 } } },
        { text = "They saved their people's home. I'd have done it too.", next = "BACK", reply = "Many would. I only ask that those who planted it now watch over it as closely as I do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } },
      },
    },
    xdone = {
      lines = {
        { id = "xdone_default", text = "I think the furbolgs of Ban'ethil have found something in their barrow that should have been left buried, and that the grells have been stealing scraps of it. Athridas Bearmantle in Dolanaar fears the same. When you go south, tell him what we burned here." },
      },
      choices = {
        { text = "I'll carry word to Athridas. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "Then sit, and be still, and do not try. Let the nearest sound go, and the next, until you hear the one beneath them, which is the wood breathing. Where the breath catches, there is the hurt. It took me a hundred years, so do not be discouraged by an afternoon." },
      },
      choices = {
        { text = "I'll begin this afternoon. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xrace = {
      lines = {
        { id = "xrace_default", text = "I am a dryad, a daughter of the forest lord Cenarius, with a deer's four legs and a woman's two hands, and I do admire how hard you are trying not to stare. We keep the wild places. You are the first of your people I have spoken with, and you are less noisy than I was told." },
      },
      choices = {
        { text = "I'll take that as praise. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I am a dryad, a keeper of the wood. I came to Shadowglen because its smallest creatures were afraid." } },
    fel_moss = { { id = "tp_fel_moss", text = "It grows where demon magic has touched, and it turns a creature's temper before it turns its heart. Burn it, and bury the ash." } },
    teldrassil = { { id = "tp_teldrassil", text = "The tree is young and unblessed, and so it sickens easily. I would see it tended, whatever I think of its planting." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids are my father's students, and I love them as an elder sister does: dearly, and with some exasperation." } },
    _none = { { id = "tp_none", text = "The wood has not told me that, young one. Ask the druids of Aldrassil, who read more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Dazalar
---------------------------------------------------------------------------
P:NPC {
  key = "dazalar", id = TODO_NPC("Dazalar"), name = "Dazalar", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "quest", gender = "male",
  communities = { "dolanaar" }, temper = { "quiet", "exacting" }, values = { "patience", "nature" },
  notices = { "class", "pet" },

  impression = {
    first = "Dazalar trains Dolanaar's hunters and gives each of them a taming rod and a long silence in which to think about what they are doing. He measures a student by how the beast looks at them afterward.",
    third = "{name} met Dazalar, who trains hunters in Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "You walk loudly. That can be mended. What brings you to me?" },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Stand there, where the wind is behind you, and tell me what you smell." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Let me see how you carry your bow before you speak." },
    { id = "g_done", when = { questDone = TODO_QUEST("Taming the Beast") }, text = "You have a companion at your side, and it chose to stay. Good. That is all the proof I ask." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} watches me and does not hide behind you. You have been fair to it, and it shows." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Your string hand is steady, but your eyes go to the target too soon. Watch the ground first, and the beast will tell you where it means to go." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dazalar. I teach those of Dolanaar who would hunt, and before I teach them to kill I teach them to befriend, for a hunter alone in the forest is only half a hunter." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Taming the Beast") }, text = "Take the rod and find the beast I named. Stand your ground while it tests you, and do not strike it. When it stops fighting, it has decided, and you will know." },
        { id = "h_done", when = { questDone = TODO_QUEST("Taming the Beast") }, text = "You have tamed the stalker, the owl and the spider, and released each as I asked. Now choose one for yourself, and go to Jocaste in Darnassus, who will teach you to train it." },
      },
      again = {
        { id = "h_again", text = "Ask. I will answer in as few words as it needs." },
        { id = "h_again2", text = "What else would you learn?" },
        { id = "h_again3", text = "Speak. The forest will wait a moment." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How does a hunter tame a beast?", next = "tame" },
        { text = "Which beasts do you send your students to?", next = "beasts" },
        { text = "Keldas says you leave the schooling to him.", next = "keldas" },
        { text = "Why make me release the ones I tamed?", next = "xrelease", when = { questDone = TODO_QUEST("Taming the Beast") } },
        { text = "I hunt with a rifle. Does that offend you?", next = "xdwarf", when = { race = "Dwarf", class = "HUNTER" } },
        { text = "A druid needs no rod. The beasts know me.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Keen eyes, Dazalar.", next = "END" },
      },
    },
    tame = {
      lines = {
        { id = "tame_default", text = "By standing still while it tries to drive you off. The rod carries a small enchantment that lets the beast feel your intent, and nothing more. If your intent is to own it, it will fight until one of you falls. If it is to walk beside it, it will tire of fighting and look at you." },
      },
      choices = {
        { text = "And if it never stops fighting?", next = "tame2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame2 = {
      lines = {
        { id = "tame2_default", text = "Then you were not ready, or it was not, and you let it go and try another day. I have had students who took a season to tame a single owl. They are among my best now, because they learned what the quick ones never had to." },
      },
      choices = {
        { text = "Patience is the hunter's first weapon.", next = "BACK", reply = "It is the only one I teach first. The bow comes after.", fx = { align = { order = 1 } } },
        { text = "A season for one owl? I'd find a faster way.", next = "BACK", reply = "There are faster ways. The beasts they make do not stay when the leash breaks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = {
        { id = "beasts_default", text = "Three, each harder than the last. A nightsaber stalker, for courage, since it will come straight at you. A strigid screecher, for patience, since it will not. And a webwood lurker from the caves, for nerve, since nobody likes to hold still before a spider." },
      },
      choices = {
        { text = "Why a spider at all?", next = "beasts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts2 = {
      lines = {
        { id = "beasts2_default", text = "Because the forest is not made only of things we find beautiful. A hunter who will befriend the cat and not the spider has learned to love what pleases him, which is no lesson at all. Few keep the lurker, but all remember it." },
      },
      choices = {
        { text = "I'll remember it too. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    keldas = {
      lines = {
        { id = "keldas_default", text = "I do. I can bring a beast and a hunter together, and after that I have little to say to either. Keldas has the gift of talking to them both, and Seriadne houses them between lessons. A village does well when each does the part that suits him." },
      },
      choices = {
        { text = "Three hands, one craft. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xrelease = {
      lines = {
        { id = "xrelease_default", text = "So that you would know you could. The first taming is a lesson, and a lesson is not a companion. A hunter who cannot open his hand does not have a friend, only a captive. Now that you have let three go, the fourth will trust that you might." },
      },
      choices = {
        { text = "It was hard, and it was right.", next = "BACK", reply = "Then you have learned it properly. Go and choose well.", fx = { align = { light = 1 } } },
        { text = "It seemed a waste of three good beasts.", next = "BACK", reply = "They are still in the forest, and still good. Nothing was wasted but your wish to keep them.", fx = { align = { light = -1 } } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdwarf_default", text = "It startles me, and it startles the game for a league around. But I have seen your people shoot, and they do not miss, and a clean death is a clean death. I would only ask that you tame with the rod and not the noise." },
      },
      choices = {
        { text = "Rod first, thunder after. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "They know you as kin, and that is a different bond from mine, and perhaps a deeper one. Kal teaches your path, by the moonwell. I will say only that a beast which walks beside a hunter does so by choice, each morning, and I have always thought that worth the trouble." },
      },
      choices = {
        { text = "Chosen each morning. That's well said.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach hunters in Dolanaar. First the taming, then the bow, and never the other way about." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine frighten the game toward the village and then follow it. My students have had more targets than I wished them." } },
    teldrassil = { { id = "tp_teldrassil", text = "The beasts of this tree are larger than their kin on the mainland, and quicker to anger. I teach my students to notice it." } },
    advice = { { id = "tp_advice", text = "Feed your companion before you feed yourself. It is watching to see which of you matters more." } },
    _none = { { id = "tp_none", text = "I do not know. I know tracks and wind, and little that cannot be read from them." } },
  },
}

---------------------------------------------------------------------------
-- Huntress Nhemai
---------------------------------------------------------------------------
P:NPC {
  key = "nhemai", id = TODO_NPC("Huntress Nhemai"), name = "Huntress Nhemai",
  bible = "bibles/more_folk.md", role = "guard", tier = "service", gender = "female",
  communities = { "dolanaar" }, temper = { "terse", "alert" }, values = { "dutiful", "loyal" },
  notices = { "class", "race" },

  impression = {
    first = "Huntress Nhemai rides the road between Dolanaar and Darnassus beside Moon Priestess Amara, and her eyes are on the trees even when she is speaking. She says what is needed and no more.",
    third = "{name} met Huntress Nhemai, who guards Moon Priestess Amara on the Darnassus road.",
  },

  greetings = {
    { id = "g_hello", text = "Keep to the middle of the road, traveler. The verges belong to the Gnarlpine this season." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The road has been kind to you so far." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Road to Darnassus") }, text = "The ambushers are thinned, and the Priestess rides easier. You have a huntress's thanks." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You watch the left treeline while I watch the right. Good. I did not have to ask." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior on foot. If the furbolgs come, stand by the Priestess's saber and let us do the riding." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "An outlander on the temple road. The Priestess says you are welcome. I say stay where I can see you, and we shall both be right." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Huntress Nhemai. Yaeliura and I ride escort for Moon Priestess Amara from Dolanaar to the city gate and back. The Gnarlpine have taken to lying in wait near the path to Ursal's den, so we no longer ride it carelessly." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Road to Darnassus") }, text = "The Priestess has asked you to deal with the ambushers. They gather in the hollows either side of the road west of here. Strike the ones with the green on their fur first." },
      },
      again = {
        { id = "h_again", text = "Ask. I am listening, though I may not look at you." },
        { id = "h_again2", text = "Go on. Briefly." },
        { id = "h_again3", text = "What else, traveler?" },
      },
      choices = {
        { text = "Why does a priestess need huntresses?", next = "escort" },
        { text = "Tell me about the ambushes.", next = "ambush" },
        { text = "Who is Ursal?", next = "ursal" },
        { text = "You ride well. Who trained your saber?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I'd ride escort with you, if you'd have me.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Safe road, Huntress.", next = "END" },
      },
    },
    escort = {
      lines = {
        { id = "escort_default", text = "She would tell you that she does not. Amara walks the road for the sake of those who use it, and she would do so alone. The Temple asked two of us to see that she did not, and we have never regretted the posting." },
      },
      choices = {
        { text = "You admire her.", next = "escort2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    escort2 = {
      lines = {
        { id = "escort2_default", text = "I have ridden behind her for many years. When the furbolgs first attacked, she dismounted to tend one of theirs that Yaeliura had shot. I thought it folly. The creature wept, and went back into the trees, and that stretch of road was quiet for a month." },
      },
      choices = {
        { text = "Mercy like that is strength.", next = "BACK", reply = "So I have come to think. I did not learn it easily.", fx = { align = { light = 1 } } },
        { text = "Mercy like that gets escorts killed.", next = "BACK", reply = "It may yet. That is what we are here for.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambush = {
      lines = {
        { id = "ambush_default", text = "They come from both sides at once, four or six together, and they go for the mounts first. A year ago a Gnarlpine would not have dared the road at all. Now they do it at midday, with something green and shining matted in their fur." },
      },
      choices = {
        { text = "Has anyone been lost?", next = "ambush2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambush2 = {
      lines = {
        { id = "ambush2_default", text = "Two travelers, before we began riding the full length. None since. Sentinel Shayla Nightbreeze walks this road as well, and carries the Council's bounty on Gnarlpine fangs, so between us there is always a blade within call." },
      },
      choices = {
        { text = "Then it's well kept. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    ursal = {
      lines = {
        { id = "ursal_default", text = "The Gnarlpine's great bear, the Mauler, who dens up the path to the north. He is older than this tree and twice as ill-tempered. The furbolgs revere him, and I suspect they ambush here because it is his doorstep." },
      },
      choices = {
        { text = "Kill the Mauler and the ambushes end.", next = "BACK", reply = "Perhaps. Or they find a new totem and a new road. But I would not weep for him.", fx = { align = { order = -1 } } },
        { text = "Leave the old bear. He's not the cause.", next = "BACK", reply = "No. The cause is whatever glows in their fur, and that is the druids' to find.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xhunter_default", text = "I trained her myself, from a cub, on the slopes below the city. Lelanai on the Warrior's Terrace breeds the best of the line, and Dazalar in Dolanaar taught me to be worth her. You sit a hunter's seat. Keep your weight further back in a turn." },
      },
      choices = {
        { text = "Further back. I'll try it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "Then fall in behind Yaeliura and keep ten paces. Do not speak unless you see something, and if you see something, do not speak, point. We shall see by the bridge whether you ride as well as you offer." },
      },
      choices = {
        { text = "Ten paces, and silent. Something else first.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I ride escort for Moon Priestess Amara on the Darnassus road. It is a short road and it wants watching." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine ambush at midday now. Something has made them bold, and it is not courage." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Sisters heal and we guard them while they do it. It is an old arrangement, and a good one." } },
    advice = { { id = "tp_advice", text = "On this road, watch the mounts. They hear the furbolgs before you do." } },
    _none = { { id = "tp_none", text = "I do not know. Ask the Priestess. She will answer more gently than I would." } },
  },
}

---------------------------------------------------------------------------
-- Janna Brightmoon
---------------------------------------------------------------------------
P:NPC {
  key = "janna", id = TODO_NPC("Janna Brightmoon"), name = "Janna Brightmoon", title = "Clothier",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "shadowglen" }, temper = { "warm", "fussy" }, values = { "care", "community" },
  notices = { "class", "race" },

  impression = {
    first = "Janna Brightmoon sells cloth armor inside Aldrassil and sees off every young elf who leaves Shadowglen with a straightened collar. She worries about them in general and by name.",
    third = "{name} met Janna Brightmoon, the clothier of Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "Come in, come in, and let me look at you. Is that what you mean to go out into the world wearing?" },
    { id = "g_back", when = { metBefore = true }, text = "There you are, and still in one piece. Turn round, let me see the hem." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "One of Shanda's young ones. She sends you all to me with your sleeves too long, and I shorten them, and she lengthens them again." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, under Aldrassil! I have only ever cut for druids and priestesses. Tell me where you need the cloth to give, and I shall learn something." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Oh, look at the state of that. No, do not apologise, only stand still while I find a needle." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Janna Brightmoon, and I clothe the young of Shadowglen before they go down the road to Dolanaar. Robes, gloves and good soft shoes, all cut to last longer than their owners expect to need them." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "Another of ours setting out. I have dressed every child of this glade for more years than I shall admit to, and I mean to see you go properly, too." },
      },
      again = {
        { id = "h_again", text = "Yes, dear? Ask, I have only the one sleeve left to pin." },
        { id = "h_again2", text = "What else can I tell you?" },
        { id = "h_again3", text = "Go on. I talk better with a needle in my hand." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "You've dressed every young one in Shadowglen?", next = "young" },
        { text = "Who are your neighbours in the tree?", next = "tree" },
        { text = "Is cloth enough, out there?", next = "enough" },
        { text = "I sew. Why the double stitch at the shoulder?", next = "xtailor", when = { profession = "Tailoring" } },
        { text = "I'll come back and show you it lasted.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Thank you, Janna.", next = "END" },
      },
    },
    young = {
      lines = {
        { id = "young_default", text = "Every one, and I remember what each of them took. Some want the plainest thing I have, and I know they will be careful. Some want the finest, and I sew the seams twice, because those are the ones who run at things." },
      },
      choices = {
        { text = "Do they come back?", next = "young2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    young2 = {
      lines = {
        { id = "young2_default", text = "Most do, taller in the way they stand, and they bring me their first torn robe as if it were a trophy. I keep one from each year, on the shelf behind me. Melithar says I am sentimental. I say he keeps a whole tree." },
      },
      choices = {
        { text = "Keep them. A place should remember its children.", next = "BACK", reply = "That is just what I think. Thank you, dear; I shall tell Melithar I have an ally.", fx = { align = { order = 1 } } },
        { text = "Let them go. The young shouldn't be clung to.", next = "BACK", reply = "I do let them go, every one. I only keep the sleeve. Allow an old seamstress that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tree = {
      lines = {
        { id = "tree_default", text = "Khardan Proudblade sells the blades across the way, and Dellylah the food, and between us nobody leaves Aldrassil unarmed, hungry or cold. The trainers are on the upper boughs, and they send their students down to us with lists." },
      },
      choices = {
        { text = "And what do the trainers ask for?", next = "tree2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tree2 = {
      lines = {
        { id = "tree2_default", text = "Shanda wants her priests in white, Mardant Strongoak wants his druids in anything that will survive being a bear, and Frahun Shadewhisper wants his in grey and asks me not to say so. I oblige all three, and I say nothing, as you see." },
      },
      choices = {
        { text = "Your secret's safe. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    enough = {
      lines = {
        { id = "enough_default", text = "Against a grell's claws, no, and I never tell them it is. Cloth keeps the rain off and the hands free, and for the rest they must rely on what the trainers taught them. But I do line the cuffs, where a caster is bitten first." },
      },
      choices = {
        { text = "You've seen what comes back torn.", next = "enough2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enough2 = {
      lines = {
        { id = "enough2_default", text = "I have. This past year it is more at the forearm and the throat, which means the creatures of the glade are leaping, where they used to snap and run. I told Conservator Ilthalaine. A seamstress sees these things before a druid does." },
      },
      choices = {
        { text = "He should listen to you. Something else.", next = "BACK", fx = { learn = { "teldrassil" } } },
      },
    },
    xtailor = {
      lines = {
        { id = "xtailor_default", text = "Because that is where a pack strap rubs, and where a young one first wears through. A single stitch looks finer, and it lasts a month. I had rather they thought me plain and came home with both sleeves." },
      },
      choices = {
        { text = "Plain and whole. I'll use it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "See that you do. Bring it torn, bring it stained, only bring it on your own back. That is all I ask of any of you." },
      },
      choices = {
        { text = "On my own back. I promise.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell cloth armor inside Aldrassil. I have seen off every young elf of this glade, and I worry about all of them." } },
    teldrassil = { { id = "tp_teldrassil", text = "The creatures of the glade tear a sleeve higher than they used to. I notice, because I am the one who mends it." } },
    advice = { { id = "tp_advice", text = "Keep a needle and thread in your pack. A small tear mended tonight is a robe saved next month." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids are hard on their clothes, dear. I have stopped asking what happens to the robe when they turn into a bear." } },
    _none = { { id = "tp_none", text = "Oh, I would not know, dear. Ask Melithar, by the roots; he knows everything that happens in this tree." } },
  },
}

---------------------------------------------------------------------------
-- Byancie
---------------------------------------------------------------------------
P:NPC {
  key = "byancie", id = TODO_NPC("Byancie"), name = "Byancie", title = "First Aid Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "dolanaar" }, temper = { "calm", "practical" }, values = { "care", "dutiful" },
  notices = { "class", "kit" },

  impression = {
    first = "Byancie teaches bandaging at the inn in Dolanaar and has a habit of looking a traveler over for injuries while they are still saying hello. She is calm in the way of someone who has seen a good deal of blood.",
    third = "{name} met Byancie, who teaches first aid in Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Good day. You are favouring your left foot, did you know? Sit down and tell me what you need." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me see how that last wound closed before we talk of anything else." },
    { id = "g_aid", when = { profession = "First Aid" }, text = "Someone has taught you to tie a proper knot. Good. Shall we go on from there?" },
  },

  notice = {
    { id = "n_hurt", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor is in ribbons, and I would guess the skin under it is not much better. Hold still, please." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You can close a wound with a word, and I envy it. But the word fails when you are spent, and a bandage does not, so learn both." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. You are the sort who says it is only a scratch. Show me the scratch." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Byancie, and I teach the binding of wounds to anyone going out past the village. Linen, pressure and a clean knot have saved more young elves on this island than any spell, simply because they are always to hand." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk while I roll these." },
        { id = "h_again2", text = "Ask. My hands know the work without me." },
        { id = "h_again3", text = "Something more?" },
      },
      choices = {
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "What injuries do you see most?", next = "wounds" },
        { text = "You work out of Keldamyr's inn.", next = "inn" },
        { text = "Isn't healing the Temple's business?", next = "temple" },
        { text = "I heal by the Light. What can linen do that I can't?", next = "xheal", when = { class = { "PRIEST", "PALADIN", "DRUID" } } },
        { text = "I've bandaged in the field. Tell me what I do wrong.", next = "xaid", when = { profession = "First Aid" } },
        { text = "Steady hands, Byancie.", next = "END" },
      },
    },
    wounds = {
      lines = {
        { id = "wounds_default", text = "Claw wounds, long and shallow, from the Gnarlpine, and those I can teach anyone to dress. Spider bites from the Fel Rock and the webwood caves, which swell and want a poultice. And burns, lately, from young ones who went into Ban'ethil Barrow Den and will not say what burned them." },
      },
      choices = {
        { text = "Burns, in a barrow?", next = "wounds2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounds2 = {
      lines = {
        { id = "wounds2_default", text = "So I asked. One of them told me the furbolg shamans throw green fire, which I had never heard of a furbolg doing. I dressed it as I would any burn and I sent word to Athridas Bearmantle, because a wound is also a message, if someone reads it." },
      },
      choices = {
        { text = "You did right. The druids need to know.", next = "BACK", reply = "I thought so. I am only a bandager, but I can count, and the count is rising.", fx = { align = { order = 1 } } },
        { text = "You should have kept his confidence.", next = "BACK", reply = "I named no one. But I will not sit on a thing that may burn the next child worse.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    inn = {
      lines = {
        { id = "inn_default", text = "I do. Keldamyr gives me the corner by the hearth and a kettle, and in return his guests are mended before they bleed on his floors. Zarrin feeds them after. It is the nearest thing Dolanaar has to an infirmary, and it smells of soup." },
      },
      choices = {
        { text = "Keldamyr believes in rest.", next = "inn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn2 = {
      lines = {
        { id = "inn2_default", text = "He does, and he is right, though he says it too often. Half of what I mend would not have happened to someone who had slept. I bind the wound, and he tells them to lie down, and between us they sometimes listen." },
      },
      choices = {
        { text = "A good partnership. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    temple = {
      lines = {
        { id = "temple_default", text = "For the grave wounds, yes, and I send those up the road to the Sisters without delay. But the Temple is an hour away, and a cut bleeds now. I teach what can be done in that hour by whoever happens to be standing nearest." },
      },
      choices = {
        { text = "Everyone should learn it, then.", next = "BACK", reply = "I say so to every traveler. One in five stays for the lesson.", fx = { align = { light = 1 } } },
        { text = "Leave healing to the healers.", next = "BACK", reply = "And when the healer is the one bleeding? No, I will keep teaching.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xheal = {
      lines = {
        { id = "xheal_default", text = "It can be done by a friend while you are the one lying in the road. It can be done in silence, with an enemy near. And it asks nothing of you but your hands, when your spirit is spent. I do not say it is better, only that it is there." },
      },
      choices = {
        { text = "Then I'll carry linen as well. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xaid = {
      lines = {
        { id = "xaid_default", text = "Show me your knot. There, you tie over the wound, and so the knot presses on it and it weeps. Tie to the side, on sound flesh, and fold the linen flat first. It is a small thing, and it halves the healing time." },
      },
      choices = {
        { text = "To the side, on sound flesh. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach first aid in Dolanaar, from a corner of the inn. Most of the island's young adventurers have bled on my linen." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine's claws I know how to dress. It is the burns from their barrow that trouble me." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Sisters mend what I cannot, and I keep their patients alive on the road to them. We think well of each other." } },
    advice = { { id = "tp_advice", text = "Wash the wound before you bind it, every time, however much of a hurry you are in." } },
    _none = { { id = "tp_none", text = "That is outside my learning. If it bleeds, bring it to me; otherwise ask Keldamyr." } },
  },
}

---------------------------------------------------------------------------
-- Aldia
---------------------------------------------------------------------------
P:NPC {
  key = "aldia", id = TODO_NPC("Aldia"), name = "Aldia", title = "General Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "dolanaar" }, temper = { "practical", "friendly" }, values = { "community", "thrift" },
  notices = { "class", "race" },

  impression = {
    first = "Aldia keeps Dolanaar's general supplies and packs a traveler's bag for them if they let her, in the order they will need things. She has opinions about how much rope is enough.",
    third = "{name} met Aldia, who sells general supplies in Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome to Dolanaar. Whatever you have forgotten to pack, I probably sell it." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? You ran out of something. Let me guess: torches." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You will want arrows from Jeena, but the quiver oil and the spare string you can have from me, and you will want both." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! I have a small pack that nobody here will buy because it sits too high on the shoulders. I think I have been keeping it for you." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look as if the road has been using you for a doormat. Sit, and I will see what can be replaced." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Aldia, and I sell the plain things: packs, rope, torches, flint and a skin for water. Nobody thanks me for them until they are halfway to the Fel Rock without one." },
      },
      again = {
        { id = "h_again", text = "Anything else? I am only counting flints." },
        { id = "h_again2", text = "Ask away." },
        { id = "h_again3", text = "What else do you need to know?" },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What does a traveler here forget most?", next = "forget" },
        { text = "Dolanaar seems well supplied.", next = "supply" },
        { text = "You know everyone who passes through.", next = "pass" },
        { text = "I'm off to Darkshore. What should I carry?", next = "xnelf", when = { race = "NightElf" } },
        { text = "I skin what I hunt. Do you buy pelts?", next = "xskin", when = { profession = "Skinning" } },
        { text = "Good day, Aldia.", next = "END" },
      },
    },
    forget = {
      lines = {
        { id = "forget_default", text = "Light, always. They leave at noon under a bright sky and forget that the barrows and the spider caves are black as a sealed jar. I sell more torches to people coming back than to people going out." },
      },
      choices = {
        { text = "And rope?", next = "forget2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget2 = {
      lines = {
        { id = "forget2_default", text = "Never enough of it. Twenty paces, I tell them, and they buy ten, and then they come back from the Oracle Glade asking for twenty. I have stopped arguing. I simply keep the second ten ready behind the counter." },
      },
      choices = {
        { text = "Prepare properly, or don't go.", next = "BACK", reply = "That is my view exactly. It would spare me a great many sheepish faces.", fx = { align = { order = 1 } } },
        { text = "Travel light. You can't plan for everything.", next = "BACK", reply = "True, and half of them say so. The other half are the ones buying torches at dusk.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      lines = {
        { id = "supply_default", text = "Because the city is an hour's walk and Narret Shadowgrove and I send a cart every third day. He trades in thread and ore and such, and I carry the common goods, and we split the cost of the saber that pulls it." },
      },
      choices = {
        { text = "Does the cart get through?", next = "supply2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply2 = {
      lines = {
        { id = "supply2_default", text = "It has so far. The driver has begun to ask for a Sentinel on the stretch past Ursal's den, since the Gnarlpine took to watching it. Sentinel Shayla walks with him when she can. I have started ordering a little more each time, in case the day comes that it does not." },
      },
      choices = {
        { text = "A sensible precaution. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    pass = {
      lines = {
        { id = "pass_default", text = "Everyone needs a water skin, so yes. The young from Shadowglen, all eagerness, and lately folk from across the sea, who look up at the branches as if they expect them to fall. I like the outlanders. They ask what things are for." },
      },
      choices = {
        { text = "What do you tell them?", next = "pass2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pass2 = {
      lines = {
        { id = "pass2_default", text = "That the island is gentler than it looks and less gentle than it was. That Keldamyr's beds are good, and Corithras Moonrage at the moonwell will answer a courteous question. And that the satyr by the lake is to be left alone, which they never do." },
      },
      choices = {
        { text = "Nobody ever does. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "Then pack for wet. A waxed cloak, a second pair of foot wraps, and salt, because nothing dries on that coast and food spoils in a day. And coin for the boat. I have seen proud young Sentinels turned back at Rut'theran for want of it." },
      },
      choices = {
        { text = "Wet, salt and coin. Thank you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xskin = {
      lines = {
        { id = "xskin_default", text = "Soft ones, yes, if they are clean. Nightsaber and strider, for lining packs. Take the heavy hides to Nadyia Maneweaver on the road north; she and her brother work them, and she pays better than I can for anything fit to be armor." },
      },
      choices = {
        { text = "Soft to you, heavy to Nadyia. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell general supplies in Dolanaar. Packs, rope and light, mostly, to people who thought they would not need them." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine watch the cart road now. I order a little extra each time, to be safe." } },
    advice = { { id = "tp_advice", text = "Twenty paces of rope and two torches more than you think. I have never had anyone come back to complain of the weight." } },
    teldrassil = { { id = "tp_teldrassil", text = "The island is gentler than it looks, and less gentle than it was. I tell every newcomer both halves." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask Keldamyr at the inn; travelers tell him what they would never tell a shopkeeper." } },
  },
}

---------------------------------------------------------------------------
-- Narret Shadowgrove
---------------------------------------------------------------------------
P:NPC {
  key = "narret", id = TODO_NPC("Narret Shadowgrove"), name = "Narret Shadowgrove", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "dolanaar" }, temper = { "dry", "precise" }, values = { "craft", "thrift" },
  notices = { "craft", "race" },

  impression = {
    first = "Narret Shadowgrove sells trade supplies in Dolanaar and knows what every crafter on the island is working on by what they have run out of. He is dry, exact, and mildly disappointed in most people's stitching.",
    third = "{name} met Narret Shadowgrove, the trade supplier of Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Thread, flux, vials, dye and salt. Tell me your craft and I shall tell you what you have forgotten." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. You ran short of thread, I expect; everyone underestimates thread." },
    { id = "g_craft", when = { profession = { "Tailoring", "Leatherworking", "Alchemy", "Blacksmithing", "Enchanting" } }, text = "A working crafter, by your hands. Good. I can speak to you in plain terms." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Stained fingertips and a smell of peacebloom. Cyndra Kindwhisper's student, or soon will be. You will want the leaded vials; the plain ones cloud." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor. I shall say nothing about that hem. You may buy the fine thread and draw your own conclusions." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. You will ask whether my flux is any good, and I will tell you that it came from Ironforge by way of Auberdine, and then we may both relax." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Narret Shadowgrove. I supply the crafters of Dolanaar and those passing through with what their work consumes. I do not make anything myself, which leaves me free to notice how everyone else makes theirs." },
      },
      again = {
        { id = "h_again", text = "Yes? Ask. I am only tallying spools." },
        { id = "h_again2", text = "Go on." },
        { id = "h_again3", text = "Something further?" },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You can tell what people are making?", next = "tell" },
        { text = "Who are Dolanaar's crafters?", next = "crafters" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "What do my purchases say about me?", next = "xcraft", when = { profession = { "Tailoring", "Leatherworking", "Alchemy", "Blacksmithing", "Enchanting" } } },
        { text = "An elf who sells Ironforge flux. Times change.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Good day, Narret.", next = "END" },
      },
    },
    tell = {
      lines = {
        { id = "tell_default", text = "Invariably. A sudden demand for coarse thread means someone is making packs, which means someone is leaving. Vials by the dozen mean Cyndra has a new student. And when Meri Ironweave doubles her order of flux, the Sentinels are expecting trouble from Ban'ethil." },
      },
      choices = {
        { text = "And what is the village making this month?", next = "tell2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tell2 = {
      lines = {
        { id = "tell2_default", text = "Bandages and shields. Byancie has had every bolt of linen I could bring down from the city, and Meri has not slept. I draw no conclusions aloud. I merely order more linen." },
      },
      choices = {
        { text = "You should warn people what you see.", next = "BACK", reply = "I tell Athridas Bearmantle, who is the one to tell. A shopkeeper crying alarm sells only panic.", fx = { align = { order = 1 } } },
        { text = "Wise. No use frightening folk over thread.", next = "BACK", reply = "Quite. Though I notice you are now looking at the shields.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    crafters = {
      lines = {
        { id = "crafters_default", text = "Cyndra Kindwhisper teaches alchemy and wastes nothing. Malorne Bladeleaf gathers her herbs and overcharges her for them, affectionately. Nadyia Maneweaver works leather up the road with her brother Radnaal, and their work is the only stitching on this island I have never been able to fault." },
      },
      choices = {
        { text = "High praise, from you.", next = "crafters2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crafters2 = {
      lines = {
        { id = "crafters2_default", text = "It is the only praise I have given this decade, and I should thank you not to repeat it to her. She would raise her prices, and I buy my own boots there." },
      },
      choices = {
        { text = "Not a word. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    stock = {
      lines = {
        { id = "stock_default", text = "From Darnassus, by Aldia's cart and mine, every third day. The metals and flux come further, across the sea from the dwarves, and I pay what the boats ask. I do not haggle with a people who have been smelting since before we had a word for it." },
      },
      choices = {
        { text = "The outlanders have been good for trade.", next = "stock2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock2 = {
      lines = {
        { id = "stock2_default", text = "They have been good for my shelves. Whether they are good for the island is a question for the Arch Druid. I will say that a dwarf examined my whetstones for a quarter hour last spring and then bought all of them, and I have rarely felt so well understood." },
      },
      choices = {
        { text = "Trade binds peoples. The alliance is a good thing.", next = "BACK", reply = "On the evidence of the whetstones, I am inclined to agree.", fx = { align = { order = -1 } } },
        { text = "We managed ten thousand years without them.", next = "BACK", reply = "We did. We also managed without good flux. I know which I prefer.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcraft = {
      lines = {
        { id = "xcraft_default", text = "That you buy slightly less than you need and return slightly sooner than you planned. It is the commonest fault in a young crafter, and the most curable. Buy the extra spool. It will not spoil." },
      },
      choices = {
        { text = "The extra spool, then. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdwarf_default", text = "They do. I resisted for a century and then tried the flux, and I have not looked back. I am told there is a human saying about old dogs. I should prefer you did not finish it." },
      },
      choices = {
        { text = "I'd never dream of it. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell trade supplies in Dolanaar. I make nothing, and I see everything that is made." } },
    furbolgs = { { id = "tp_furbolgs", text = "When the village buys linen and flux together, I know what is expected from Ban'ethil. It has bought a great deal of both." } },
    advice = { { id = "tp_advice", text = "Buy the extra spool. It is the cheapest lesson I can offer, and nobody takes it the first time." } },
    explorers_league = { { id = "tp_explorers_league", text = "The dwarves ask precise questions and pay without sighing. I have no complaint of them whatever." } },
    _none = { { id = "tp_none", text = "I do not know, and I prefer not to speculate. Athridas Bearmantle may; he has the leisure for large questions." } },
  },
}

---------------------------------------------------------------------------
-- Nyoma
---------------------------------------------------------------------------
P:NPC {
  key = "nyoma", id = TODO_NPC("Nyoma"), name = "Nyoma", title = "Cooking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "dolanaar" }, temper = { "generous", "teasing" }, values = { "hospitality", "friendship" },
  notices = { "craft", "race" },

  impression = {
    first = "Nyoma sells cooking supplies in Dolanaar and keeps the village's recipes in a book she lends more readily than she admits. She and the cook Zarrin disagree about nearly everything in a pot.",
    third = "{name} met Nyoma, who sells cooking supplies in Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Spices, flour, sweet milk and salt. And if you are hungry now, say so, for there is always something on my own fire." },
    { id = "g_back", when = { metBefore = true }, text = "You are back! Good, taste this and tell me it does not need more thyme, because Zarrin says it does." },
    { id = "g_active", when = { questActive = TODO_QUEST("Reminders of Home") }, text = "Sister Aquinne sent you for my recipes, did she? That is so like her. Sit a moment while I find the book." },
    { id = "g_done", when = { questDone = TODO_QUEST("Return to Nyoma") }, text = "Aquinne has her book and I have her letter, and I have read it four times. Thank you for carrying both." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You have a cook's burn on that knuckle. Then you and I shall get on, so long as you do not side with Zarrin about the soup." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I have a jar of something your people call mustard, which I bought from a sailor and am afraid to open. You must tell me what it is for." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Nyoma, and I keep Dolanaar's cooks in spices and its recipes in order. Zarrin teaches the craft at the inn, and I supply it, and we have been arguing about salt since before this tree was planted." },
        { id = "h_done", when = { questDone = TODO_QUEST("Return to Nyoma") }, text = "Aquinne writes that the Temple kitchen smells of Dolanaar now, and that the novices ask for the spiced bread by name. It does me good to think of it. She was the best friend I had in this village before she took her vows." },
      },
      again = {
        { id = "h_again", text = "What else, dear? Stir that for me while you ask." },
        { id = "h_again2", text = "Go on, I am listening, and so is the soup." },
        { id = "h_again3", text = "Something more? There is always time." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You and Zarrin argue about salt?", next = "zarrin" },
        { text = "Tell me about your recipe book.", next = "book" },
        { text = "What grows on Teldrassil that's worth cooking?", next = "grows" },
        { text = "Sister Aquinne misses this village, I think.", next = "xaquinne", when = { questDone = TODO_QUEST("Return to Nyoma") } },
        { text = "I cook. Lend me one recipe to carry with me.", next = "xcook", when = { profession = "Cooking" } },
        { text = "Thank you, Nyoma.", next = "END" },
      },
    },
    zarrin = {
      lines = {
        { id = "zarrin_default", text = "About salt, thyme, how long to rest a roast, and whether soup should be seen through. He is a very fine cook and he is wrong about all four. He changed my moonberry broth in front of a student last month, and I have not yet decided to forgive him." },
      },
      choices = {
        { text = "Will you?", next = "zarrin2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zarrin2 = {
      lines = {
        { id = "zarrin2_default", text = "By the next new moon, I expect, when he will come by for sweet milk and pretend nothing happened, and I shall pretend to believe him. We have done it for centuries. A village needs one good quarrel that nobody means." },
      },
      choices = {
        { text = "Forgive him now. Life's uncertain these days.", next = "BACK", reply = "Oh, now you have made it serious. Very well, I shall take him a loaf tonight.", fx = { align = { light = 1 } } },
        { text = "Make him apologise first. He was in the wrong.", next = "BACK", reply = "He was! I knew you had sense. One more week of sulking, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    book = {
      lines = {
        { id = "book_default", text = "It is every dish Dolanaar has cooked since the village was a camp, written in six hands, mine the worst. Spiced bread, spider kabobs for the brave, the charred wolf Zarrin swears by. I say I do not lend it, and then I lend it." },
      },
      choices = {
        { text = "Who have you lent it to?", next = "book2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book2 = {
      lines = {
        { id = "book2_default", text = "Sister Aquinne, most lately, up at the Temple. She and I learned to cook at the same fire, and when she took her vows she said she would miss the food more than the company, and I chose to be flattered. A copy has gone to her kitchen." },
      },
      choices = {
        { text = "A good use for it. Something else.", next = "BACK", fx = { learn = { "sisterhood_of_elune" } } },
      },
    },
    grows = {
      lines = {
        { id = "grows_default", text = "More than on the mainland, and faster. Moonberries the size of a fist, a mushroom under the roots that tastes of smoke, and the strider here is plump where Darkshore's is all leg. Danlyia sells the fruit. I only sell what makes it taste of something." },
      },
      choices = {
        { text = "Fruit that large seems strange.", next = "grows2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows2 = {
      lines = {
        { id = "grows2_default", text = "It is strange, and I say so, and Danlyia says a large pear is a blessing. Denalan at the lake has plants that have grown teeth, mind you. I cook with what I know and I taste everything twice, and so far the island has been kind to my pot." },
      },
      choices = {
        { text = "Taste twice. Sound advice. Something else.", next = "BACK", fx = { learn = { "teldrassil" } } },
      },
    },
    xaquinne = {
      lines = {
        { id = "xaquinne_default", text = "She says not, and writes eight pages. The Temple is a great honour and a cold kitchen, I think. I shall send her thyme with the next cart, and a note saying Zarrin has not improved." },
      },
      choices = {
        { text = "She'll be glad of both. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xcook = {
      lines = {
        { id = "xcook_default", text = "One! You bargain like a Sentinel. Very well, the spiced bread, since it travels and forgives a bad fire. Mild spice, not hot, whatever a dwarf tells you, and let the dough rest twice as long as seems reasonable." },
      },
      choices = {
        { text = "Rest it twice as long. Thank you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell cooking supplies in Dolanaar and I keep the village's recipes. I also keep an argument going with Zarrin, as a public service." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "My dearest friend serves in the Temple kitchen. I think of the Sisterhood kindly, and I think they are underfed." } },
    teldrassil = { { id = "tp_teldrassil", text = "Everything grows large on this tree, and quickly. I taste it twice before it goes in the pot." } },
    advice = { { id = "tp_advice", text = "Carry salt and one spice you love. They weigh nothing, and they make a cold camp bearable." } },
    _none = { { id = "tp_none", text = "I have no idea, dear. Ask Danlyia; if it has been said aloud in Dolanaar, she has heard it." } },
  },
}

---------------------------------------------------------------------------
-- Khardan Proudblade
---------------------------------------------------------------------------
P:NPC {
  key = "khardan", id = TODO_NPC("Khardan Proudblade"), name = "Khardan Proudblade", title = "Weaponsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "shadowglen" }, temper = { "proud", "kindly" }, values = { "craft", "tradition" },
  notices = { "class", "race" },

  impression = {
    first = "Khardan Proudblade sells weapons inside Aldrassil to the young of Shadowglen and makes each of them hold a blade properly before he will take their coin. He is proud of his steel and prouder of the hands it goes to.",
    third = "{name} met Khardan Proudblade, the weaponsmith of Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome, young one. Do not touch the edge to see whether it is sharp. It is." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and your blade with you. Let me see what you have done to it." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "One of Alyissia's students. Stand straight, then, and show me your grip before you show me your purse." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You hold your hands as Frahun's students do, a little too still. I have daggers for you. They are honest steel, whatever use you put them to." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Keina sells the bows, by the door, but you will want a knife for close work, and that is mine to provide." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "An outlander, in Aldrassil. You will find our blades lighter than you are used to. Swing one before you judge it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Khardan Proudblade. I arm the young of Shadowglen for their first steps beyond this tree, as my mother did before the Sundering for those who marched against the Legion. The steel is plainer now, but the purpose is the same." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I am in no haste." },
        { id = "h_again2", text = "Speak, young one." },
        { id = "h_again3", text = "Something more? The whetstone will keep." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Your family has armed elves since the Sundering?", next = "family" },
        { text = "What does a young one need first?", next = "first" },
        { text = "Who else outfits the glade?", next = "glade" },
        { text = "Check my grip, then, smith.", next = "xwar", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "I've worked a forge. Is this folded steel?", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "Elune guard you, Khardan.", next = "END" },
      },
    },
    family = {
      lines = {
        { id = "family_default", text = "Longer. The Proudblades forged glaives for the Sentinels when Zin-Azshari still stood. I have my mother's hammer, and her habit of testing a buyer before a blade. She held that a weapon given to the wrong hand was the smith's shame as much as the wielder's." },
      },
      choices = {
        { text = "Have you ever refused a sale?", next = "family2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family2 = {
      lines = {
        { id = "family2_default", text = "Three times in my life. Once to a youth who smiled at the edge in a way I did not like. He came back a year on, steadier, and I sold him the same sword. The other two I have never seen again, and I do not regret them." },
      },
      choices = {
        { text = "A smith should judge who he arms.", next = "BACK", reply = "So my mother taught. It has cost me coin and never sleep.", fx = { align = { honor = 1 } } },
        { text = "A smith sells steel. Judging isn't his place.", next = "BACK", reply = "Then I am a poor smith by your measure, and content to be.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "first_default", text = "A blade short enough to control and plain enough to lose without grief. They all want the long one on the wall. I tell them they may have it when they bring me the short one worn down by use, and not before." },
      },
      choices = {
        { text = "Do they bring it back?", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      lines = {
        { id = "first2_default", text = "The good ones do. They come in from Dolanaar with a nicked and sharpened dagger and a different look, and I take the long sword down myself. It is the best part of my trade. Alyissia sends me word when one is ready, though I can generally tell." },
      },
      choices = {
        { text = "That's a proud moment. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    glade = {
      lines = {
        { id = "glade_default", text = "Janna Brightmoon clothes them, and frets. Dellylah feeds them. Keina strings their bows and Andiss fits their first mail. We are all within a few steps of one another around the trunk, and no child of Shadowglen leaves without passing every one of us." },
      },
      choices = {
        { text = "A whole tree seeing them off.", next = "glade2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glade2 = {
      lines = {
        { id = "glade2_default", text = "It is how it should be. When I was young we were sent off by a whole city. There are fewer of us now, and fewer children, and so each one is seen off the more carefully. I do not think they know how closely they are watched down that road." },
      },
      choices = {
        { text = "They'll know one day. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xwar = {
      lines = {
        { id = "xwar_default", text = "Hold it out. Thumb along the spine, there, and loosen the last two fingers, for you are strangling it. A blade is held as one holds a bird, firmly enough that it cannot fly and gently enough that it lives. Better. Again, and slower." },
      },
      choices = {
        { text = "Like a bird. I'll practise. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xsmith = {
      lines = {
        { id = "xsmith_default", text = "It is, eight folds, quenched in moonwell water. You will find it harder than dwarven steel and less forgiving, and it must be oiled, for Teldrassil is damp. If you have a forge of your own, I should be glad to hear how your people draw out a tang." },
      },
      choices = {
        { text = "We'll trade methods. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I am the weaponsmith of Aldrassil. My family has armed our people's young since before the Sundering." } },
    burning_legion = { { id = "tp_burning_legion", text = "My mother's glaives went to the war against the Legion. I pray mine never need go to another." } },
    teldrassil = { { id = "tp_teldrassil", text = "The damp of this tree rusts a blade in a week. I tell every young one to oil it nightly, and half of them remember." } },
    advice = { { id = "tp_advice", text = "Oil the blade each night and learn the short one before the long. Everything else is practice." } },
    _none = { { id = "tp_none", text = "That I do not know, young one. Ask Tenaron Stormgrip, at the crown; he has thought about most things." } },
  },
}

---------------------------------------------------------------------------
-- Dellylah
---------------------------------------------------------------------------
P:NPC {
  key = "dellylah", id = TODO_NPC("Dellylah"), name = "Dellylah", title = "Food & Drink",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "shadowglen" }, temper = { "bright", "motherly" }, values = { "hospitality", "community" },
  notices = { "race", "weary" },

  impression = {
    first = "Dellylah sells food and drink inside Aldrassil and is usually the first to feed a young elf on the morning they set out. She remembers what each of them liked, long after they have forgotten Shadowglen.",
    third = "{name} met Dellylah, who sells food and drink in Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "Good morning, or evening, I lose track under the boughs. Have you eaten? No, I can see you have not." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The same as last time, or shall I surprise you?" },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { resting = true },
      text = "You are worn to a thread. Sit on the root there and drink this before you say another word." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "Oh! A visitor from over the sea. I have never fed one of your people before. You must tell me honestly if any of this is not to your taste." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "One of Mardant's young druids. He works you till you forget your supper, I know. Take two, and say I insisted." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dellylah, and I keep the young of Shadowglen fed: spring water, moonberry juice, bread and whatever fruit the glade has given this week. Nobody starts a long road well on an empty stomach." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "Another one setting out! You all have the same look, half brave and half hungry. I can do something about the second half, at least." },
      },
      again = {
        { id = "h_again", text = "What else, dear? There is no hurry in Aldrassil." },
        { id = "h_again2", text = "Ask! I like company while I slice." },
        { id = "h_again3", text = "Something more? Have a berry while you think." },
      },
      choices = {
        { text = "Let me see your food.", next = "BUSINESS" },
        { text = "You remember what everyone liked?", next = "remember" },
        { text = "Where does your fruit come from?", next = "fruit" },
        { text = "What's the talk in the tree?", next = "talk" },
        { text = "I started out here. Do you remember me?", next = "xnelf", when = { race = "NightElf" } },
        { text = "I cook a little. What's in the juice?", next = "xcook", when = { profession = "Cooking" } },
        { text = "Thank you, Dellylah.", next = "END" },
      },
    },
    remember = {
      lines = {
        { id = "remember_default", text = "Every one. Alyissia's warriors want bread and plenty of it, Shanda's priests ask for the juice and then are too shy to ask for more, and Ayanna Everstride's hunters would live on dried strider if I let them. It is a way of knowing people, what they reach for first." },
      },
      choices = {
        { text = "And what do the ones who leave reach for?", next = "remember2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    remember2 = {
      lines = {
        { id = "remember2_default", text = "Something to carry. They stand here on their last morning and suddenly want a loaf for the road, though Dolanaar is barely an hour's walk. I wrap it for them, and I put a moonberry in the cloth, and I do not tell them it is there." },
      },
      choices = {
        { text = "Small kindnesses hold a people together.", next = "BACK", reply = "I think so. It is the only kind I am any good at.", fx = { align = { light = 1 } } },
        { text = "You coddle them. The world won't.", next = "BACK", reply = "No, it will not. All the more reason they should remember one place that did.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fruit = {
      lines = {
        { id = "fruit_default", text = "From the glade itself, mostly. The moonberries grow by the pool to the north, and I gather them at first light before the grells are about. They used to scatter when I came. Now they sit and watch me, and I gather rather faster." },
      },
      choices = {
        { text = "The grells have grown bold.", next = "fruit2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fruit2 = {
      lines = {
        { id = "fruit2_default", text = "Bold, and mean with it. One threw a stone at me last week, which I have never known a grell do. Gilshalan Windwalker has been sending the young ones to deal with them, and I am sorry for it, but I should like to pick my berries in peace." },
      },
      choices = {
        { text = "So you should. Something else.", next = "BACK", fx = { learn = { "teldrassil" } } },
      },
    },
    talk = {
      lines = {
        { id = "talk_default", text = "That a dryad has been seen south-west of the tree, which nobody can remember happening before. Melithar Staghelm went quite still when he heard. And Janna Brightmoon says the robes are coming back torn higher up, whatever that means, and she has told the Conservator." },
      },
      choices = {
        { text = "You hear a great deal, selling bread.", next = "talk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk2 = {
      lines = {
        { id = "talk2_default", text = "Everybody eats, dear, and nobody minds what they say in front of the bread seller. I do not carry tales. But if a young one asks me whether the glade is as safe as it was, I tell them the truth, and I give them a second loaf." },
      },
      choices = {
        { text = "Good. The young deserve the truth.", next = "BACK", reply = "They do. It sits better with something to eat.", fx = { align = { order = -1 } } },
        { text = "Better not to frighten them before they've begun.", next = "BACK", reply = "I thought so once. Then one came back hurt, and asked why nobody had said.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "Let me look at you. Yes! Bread with the crust torn off, and you took the juice and pretended you did not want it. You have grown into your shoulders. Sit, and tell me everything since." },
      },
      choices = {
        { text = "Crust torn off. You do remember.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xcook = {
      lines = {
        { id = "xcook_default", text = "Moonberries, crushed and strained through linen, a spoon of honey from the hives above Dolanaar, and a leaf of mint if I have it. The trick is to let it stand a night in the cool of the roots. It is never as good made in a hurry." },
      },
      choices = {
        { text = "A night in the cool. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell food and drink inside Aldrassil. I have fed nearly every young elf of this glade on the morning they left it." } },
    teldrassil = { { id = "tp_teldrassil", text = "The grells sit and watch me pick berries now, where once they ran. I do not like it, and I have said so." } },
    advice = { { id = "tp_advice", text = "Eat before you set out, and carry one thing you can eat walking. The road always takes longer than they tell you." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids forget their suppers when they are learning a new shape. I send it up to them and they send back the bowl licked clean." } },
    _none = { { id = "tp_none", text = "Oh, I would not know that, dear. Ask Melithar; he is down by the roots and he likes to be asked." } },
  },
}

---------------------------------------------------------------------------
-- Alanna Raveneye
---------------------------------------------------------------------------
P:NPC {
  key = "alanna", id = TODO_NPC("Alanna Raveneye"), name = "Alanna Raveneye", title = "Enchanting Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "teldrassil_wilds" }, temper = { "absorbed", "gentle" }, values = { "learning", "craft" },
  notices = { "craft", "class" },

  impression = {
    first = "Alanna Raveneye teaches enchanting in the Oracle Glade, well away from the villages, because she says the work wants quiet. She tends to answer a question a moment after it is asked, as though returning from somewhere.",
    third = "{name} met Alanna Raveneye, who teaches enchanting in the Oracle Glade.",
  },

  greetings = {
    { id = "g_hello", text = "Hm? Oh, forgive me. I was listening to a ring. You are welcome here; do sit, and mind the dust on that stone." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the Glade. Good. I think I have remembered what I meant to tell you last time." },
    { id = "g_ench", when = { profession = "Enchanting" }, text = "You carry a rod, and it has been used. Then we may skip the part where I explain what dust is." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "There is strange dust on your gloves, and a little essence under the nail. You have been unmaking things. Was it hard, the first time? It is for everyone." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You pull magic out of the air, and I only coax out what is already sleeping in a thing. I should think my way would seem very slow to you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Alanna Raveneye, and I teach the art of enchantment to those willing to walk this far for it. I keep to the Oracle Glade because the craft is half listening, and one cannot listen in a village." },
        { id = "h_ench", when = { profession = "Enchanting" }, text = "You have begun the art already. There is more I can show you, when you have gathered the dusts and essences for it and are ready to give up something you made." },
      },
      again = {
        { id = "h_again", text = "Yes? Ask. I am here, mostly." },
        { id = "h_again2", text = "What else would you know? Speak, and I shall catch up." },
        { id = "h_again3", text = "Something more? One moment. There. Go on." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "Why teach so far from Dolanaar?", next = "far" },
        { text = "How does one enchant a thing?", next = "how" },
        { text = "The Oracle Glade isn't as safe as it was.", next = "glade" },
        { text = "Unmaking a fine blade for dust feels like waste.", next = "xench", when = { profession = "Enchanting" } },
        { text = "Our ancestors' enchantments nearly ended the world.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Quiet hours, Alanna.", next = "END" },
      },
    },
    far = {
      lines = {
        { id = "far_default", text = "Because every made thing hums, very faintly, and in Dolanaar there are a thousand made things humming at once. Here there is the wind, the Oracle Tree and the sea below the bough, and I can hear a single ring across the clearing. My students complain of the walk and stop complaining after the first lesson." },
      },
      choices = {
        { text = "Does no one else live out here?", next = "far2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    far2 = {
      lines = {
        { id = "far2_default", text = "Sentinel Arynia Cloudsbreak keeps the watch by the Oracle Tree, and we share a fire some evenings without saying much, which suits us both. There is a great nightsaber called Mist who goes where she pleases. And harpies, on the rise to the north, whom I could do without." },
      },
      choices = {
        { text = "Quiet company, harpies aside. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    how = {
      lines = {
        { id = "how_default", text = "You begin by unmaking. A thing that has held magic can be persuaded to give it up, as dust or essence or a shard, and then it is no longer a thing. With what you have gathered you may wake a new property in something else. So every enchantment is paid for with another's ending." },
      },
      choices = {
        { text = "That seems a sad sort of craft.", next = "how2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how2 = {
      lines = {
        { id = "how2_default", text = "I find it honest. Nothing is conjured from nothing; I cannot pretend to more than I was given. The Highborne forgot that. They thought power was a well with no bottom, and you know what came of it." },
      },
      choices = {
        { text = "Magic with a cost is magic kept in check.", next = "BACK", reply = "That is the whole of what I teach, under the formulas. I am glad it shows.", fx = { align = { order = 1 } } },
        { text = "Limits are for the timid. Power should be sought.", next = "BACK", reply = "So said Queen Azshara's court, very beautifully. I shall keep to my dust.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "highborne" } } },
      },
    },
    glade = {
      lines = {
        { id = "glade_default", text = "No. The Bloodfeather harpies have grown in number and come lower than they did, and I have had to set a ward on my worktable, which I resent. Sentinel Arynia has been asking travelers to thin them. I hear their belts when they fly over, cheap charms, badly made." },
      },
      choices = {
        { text = "You can hear a harpy's belt?", next = "glade2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glade2 = {
      lines = {
        { id = "glade2_default", text = "One hears what one has trained to hear. It is a nasty little sound, like a cracked bell. Someone is making trinkets for them, or they are stealing them, and either way I should like to know from whom. If you find one intact, bring it to me before you sell it." },
      },
      choices = {
        { text = "I'll bring one if I can. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    xench = {
      lines = {
        { id = "xench_default", text = "It should feel so, a little, every time. On the day it stops, put down the rod for a season. I still thank each piece before I unmake it, under my breath, and my students laugh at me, and then I notice the better ones doing the same." },
      },
      choices = {
        { text = "I'll thank the next one. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "They did, and that is why some of the elders would have me teach nothing at all. But the arcane and the enchanter's art are cousins and not twins. I draw nothing from any well. I only move what is already in the world from one small vessel to another, and I ask first." },
      },
      choices = {
        { text = "A fair distinction. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach enchanting in the Oracle Glade. It is a long walk, and that is partly the point." } },
    highborne = { { id = "tp_highborne", text = "They believed power had no bottom. Every lesson I give begins by showing that it has." } },
    teldrassil = { { id = "tp_teldrassil", text = "The tree hums, too, if you are quiet enough. Of late the note has not been quite true, and I cannot tell you why." } },
    advice = { { id = "tp_advice", text = "Before you unmake a thing, be sure you will not want it tomorrow. Dust does not go back into a sword." } },
    _none = { { id = "tp_none", text = "I do not know. Forgive me, I am seldom thinking of anything further off than this table." } },
  },
}
