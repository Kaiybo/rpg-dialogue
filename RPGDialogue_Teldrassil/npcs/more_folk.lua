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
