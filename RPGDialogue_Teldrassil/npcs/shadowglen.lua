-- Shadowglen: the glade under Aldrassil where young night elves begin. Voice: bibles/teldrassil.md
-- Classic Shadowglen only (the zone was rebuilt in Cataclysm; those quests are not used).
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ilthalaine", id = TODO_NPC("Conservator Ilthalaine"), name = "Conservator Ilthalaine",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "delighted" }, values = { "kind", "devout" },
  notices = { "greenness", "class" },

  greetings = {
    { id = "g_glade", text = "Look at the light through the leaves. Every morning it's new, and every morning I'm glad of it." },
    { id = "g_back", when = { metBefore = true }, text = "In the glade again. Does it still take your breath? It still takes mine." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 2 },
      text = "Newly woken to the world, and already sent to me! Let us begin gently, for the forest will be less gentle with you later." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A young druid! There's word waiting for you from your teacher. The glade has been expecting you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Conservator Ilthalaine, and I keep the balance in Shadowglen. It's a lovely place, and lovely places need keeping more than most." },
        { id = "h_balance", tags = { "news" }, when = { questActive = TODO_QUEST("The Balance of Nature") },
          text = "The spring rains were heavy, and now there are more young nightsabers and thistle boars than the glade can feed. Thin them gently, for balance is a matter of numbers, not of hatred." },
        { id = "h_sigil", when = { any = {
            { questActive = TODO_QUEST("Verdant Sigil") }, { questActive = TODO_QUEST("Hallowed Sigil") },
            { questActive = TODO_QUEST("Simple Sigil") }, { questActive = TODO_QUEST("Etched Sigil") },
            { questActive = TODO_QUEST("Encrypted Sigil") } } },
          text = "Your teacher's sigil came for you by messenger. Read it, then find them in Aldrassil. They'll show you the next step." },
        { id = "h_cubs", when = { metBefore = true }, text = "I counted the nightsaber cubs this morning and found seven, where last spring there were five. The glade is generous this year, and that worries me a little." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Elune's light on the glade. This is the hour I remember why I asked to keep it." },
        { id = "h_grown", when = { minLevel = 20 },
          text = "You've grown since the glade last saw you. Out there in the world, is the balance kept any better than in here?" },
      },
      again = {
        { id = "h_again", text = "What else? The light's moving; walk with me a little." },
        { id = "h_again2", text = "Ask away. I'll keep counting cubs while you do." },
      },
      choices = {
        { text = "What does keeping the balance mean?", next = "balance" },
        { text = "Why so many beasts this year?", next = "rains" },
        { text = "Who sends the sigils?", next = "sigils" },
        { text = "I've seen the world since. It's not balanced.", next = "world", when = { minLevel = 20 } },
        { text = "I'm a long way from home here.", next = "stranger", when = { ["not"] = { race = "NightElf" } } },
        { text = "Thank you, Conservator.", next = "END" },
      },
    },
    balance = {
      big = true,
      lines = {
        { id = "b_default", text = "It means that nothing takes more than its share: not the beasts, not the furbolgs, and not us. When one thing grows too much, the rest of the forest pays for it." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, learn = { "cenarion_circle" } } },
        { text = "The strong take what they can, and that's the forest's way too.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Even if it means killing?", next = "balance_kill" },
      },
    },
    balance_kill = {
      lines = { { id = "bk_default", text = "Even then. Killing for balance is a sorrow, but killing for pleasure is where corruption begins, so learn the difference here while it's easy to see." } },
      choices = {
        { text = "A necessary sorrow, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hunting needs no excuse, since it's the oldest thing in the forest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll try to tell them apart.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    rains = {
      lines = { { id = "r_default", text = "Heavy spring rains. Some creatures flourished, others suffered, and the glade can only feed so many mouths. Nature is generous and careless in the same breath." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sigils = {
      lines = { { id = "s_default", text = "Your trainers in Aldrassil. Mardant for the druids, Shanda for the priests, and the others for theirs. They watch for new students the way I watch for cubs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    world = {
      lines = { { id = "w_default", text = "No, I don't suppose it is. Sit with me a moment and tell me: was it the beasts that were out of balance, or the people?" } },
      choices = {
        { text = "The people. Always the people.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "The beasts. Something's sickening them.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Both. I don't know where to start.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    stranger = {
      lines = { { id = "st_default", text = "Then welcome twice over. The glade doesn't mind who walks in it, so long as they walk gently." } },
      choices = { { text = "I'll walk gently.", next = "BACK", fx = { affinity = 1, standing = { shadowglen = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep Shadowglen. That's the whole of my story, and it's plenty." } },
    advice = { { id = "tp_ad", text = "Walk softly in a young forest, because it remembers everything." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle teaches what I try to practice. They're better at it than I am, but I'm more cheerful about it." } },
    _none = { { id = "tp_none", text = "I have no idea! Isn't it lovely, though, not knowing things? It leaves room for wonder." } },
  },
}

P:NPC {
  key = "melithar", id = TODO_NPC("Melithar Staghelm"), name = "Melithar Staghelm",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "earnest" }, values = { "dutiful", "patient" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_tree", text = "Peace, young one. Aldrassil is listening, as it always is. Speak kindly near it." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the glade. The first lessons are the slowest. They're also the ones you'll lean on longest." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Ah, you've found the bear. Careful of the steps; Aldrassil's roots were not made for paws." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Melithar Staghelm. I tend Aldrassil's roots and the young ones who come to it, and both of them need patience." },
        { id = "h_woodland", tags = { "news" }, when = { questActive = TODO_QUEST("The Woodland Protector") },
          text = "Tarindrella the dryad has come back to Shadowglen, after years unseen. A Sentinel spotted her southwest of Aldrassil. Find out why she's come." },
        { id = "h_hum", when = { metBefore = true }, text = "Aldrassil hums when the wind is right, so put your ear to the bark one day and listen. Tenaron finds it undignified, but Tenaron is wrong." },
        { id = "h_moss", when = { questDone = TODO_QUEST("The Woodland Protector") },
          text = "Fel Moss on the grells. Tarindrella was right to come. If it's in them, I fear it's in the Gnarlpine too." },
      },
      again = {
        { id = "h_again", text = "Ask on. Aldrassil's in no hurry." },
        { id = "h_again2", text = "Something else? The roots can wait a moment." },
      },
      choices = {
        { text = "What's it like, tending Aldrassil?", next = "tending" },
        { text = "Are you kin to the Arch Druid?", next = "kin" },
        { text = "Who is Tarindrella?", next = "dryad" },
        { text = "Teach me what you know.", next = "druid_m", when = { class = "DRUID" } },
        { text = "I'll help.", next = "END", fx = { affinity = 1 } },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Everyone asks me that. My work is here, at the roots, and whatever name I carry, the tree doesn't care, and neither should you." } },
      choices = {
        { text = "Fair enough.", next = "BACK" },
        { text = "Would you tell me if you were?", next = "kin2", fx = { trait = { witty = 1 } } },
      },
    },
    kin2 = {
      lines = { { id = "k2_default", text = "Probably not, for a name is heavy enough without anyone else's hung on it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tending = {
      lines = {
        { id = "t_slow", text = "Slowly. A tree this old hurries for no one, and I've learned to measure my days in new leaves and my years in rings I'll never see." },
      },
      choices = {
        { text = "A patient life.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Does the tree tell you things?", next = "hum" },
      },
    },
    hum = {
      lines = { { id = "hu_default", text = "Not in words. It creaks when it's thirsty and goes quiet before storms. I've learned to hear the difference." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dryad = {
      lines = { { id = "d_default", text = "A dryad, a protector of the woods. She hasn't been felt in Kalimdor's forests for years, and she doesn't wander without reason." } },
      choices = {
        { text = "What reason, this time?", next = "dryad2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dryad2 = {
      lines = { { id = "d2_default", text = "Fel Moss, I fear. The grells have been at it, and the Gnarlpine furbolgs have left their homes in the hills. Athridas in Dolanaar watches them closest." } },
      choices = { { text = "I'll look into it.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    druid_m = {
      lines = { { id = "dm_default", text = "I'm no trainer; Mardant upstairs is. But I will tell you something he won't: the bear is easy to learn, and patience is not." } },
      choices = { { text = "I'll work on patience.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I tend Aldrassil's roots. I'm better at roots than at stories." } },
    advice = { { id = "tp_ad", text = "Stay on the paths until you know which roots trip." } },
    fel_moss = { { id = "tp_moss", text = "It's in the grells. Tarindrella thinks the furbolgs too. I hope she's wrong." } },
    cenarion_circle = { { id = "tp_circle", text = "Every druid in Shadowglen hopes the Circle will notice them one day. Few say so aloud." } },
    _none = { { id = "tp_none", text = "I couldn't say, but Tenaron might, at the top of Aldrassil." } },
  },
}

P:NPC {
  key = "tenaron", id = TODO_NPC("Tenaron Stormgrip"), name = "Tenaron Stormgrip",
  bible = "bibles/teldrassil.md", role = "noble", tier = "major",
  communities = { "shadowglen" }, temper = { "warm" }, values = { "wise", "kind" },
  notices = { "greenness", "race" },

  greetings = {
    { id = "g_aldrassil", text = "Welcome to the top of Aldrassil. From here you can see most of Shadowglen, and it looks small from up here, though it isn't." },
    { id = "g_back", when = { metBefore = true }, text = "You've made the climb again. I always have time for those who climb." },
  },

  notice = {
    { id = "n_ready", cat = "greenness", when = { minLevel = 5, maxLevel = 9 },
      text = "You've grown since you came to the glade. It shows in how you stand. Soon you'll go down for the last time." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "Child of the kaldorei, the forest remembers us even when we forget it, so remember it in turn." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tenaron Stormgrip. I watch over Shadowglen from Aldrassil's crown. Every young elf who leaves the glade passes me on the way." },
        { id = "h_summons", tags = { "news" }, when = { questActive = TODO_QUEST("Tenaron's Summons") },
          text = "You came when I called, and that is good. There is a task that will take you beyond the glade, and you are ready for it." },
        { id = "h_crown", when = { questActive = TODO_QUEST("Crown of the Earth") },
          text = "Take this vial to the moonwell and fill it. Then carry it down to Dolanaar. Corithras will know what to do with it." },
        { id = "h_count", when = { metBefore = true }, text = "Every morning I watch the young ones walk the path down to Dolanaar. Most come back one day, taller. That's the part I like." },
        { id = "h_returned", when = { minLevel = 20 },
          text = "You came back up the tree. Most don't, once the world below has them. Sit, and tell me what you've seen down there." },
        { id = "h_visitor", when = { ["not"] = { race = "NightElf" } },
          text = "A visitor, all the way up to Aldrassil's crown! You are either very curious or very lost, and both are welcome here." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The view will keep." },
        { id = "h_again2", text = "Go on. I've been up here a long while; I can listen a while longer." },
      },
      choices = {
        { text = "What lies beyond the glade?", next = "beyond" },
        { text = "Why fill a phial at the moonwell?", next = "crown" },
        { text = "What happened at Hyjal?", next = "hyjal" },
        { text = "What do you see from up here?", next = "view" },
        { text = "I've been down in the world. It's hard.", next = "world_t", when = { minLevel = 20 } },
        { text = "I'm not kaldorei. Am I welcome here?", next = "welcome", when = { ["not"] = { race = "NightElf" } } },
        { text = "Corithras told me the rest of the story.", next = "story", when = { questDone = TODO_QUEST("Crown of the Earth") } },
        { text = "I'll go when I'm ready.", next = "END" },
      },
    },
    beyond = {
      big = true,
      lines = {
        { id = "bd_default", text = "First Dolanaar, then Darnassus, and then the whole world below the tree. Some of it is beautiful and some of it is sick, and you will learn to tell which. Go with my blessing." },
      },
      choices = {
        { text = "Thank you.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { shadowglen = 1 } } },
        { text = "I'll go, but I'll make my own way, blessing or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Which parts are sick?", next = "sick" },
      },
    },
    sick = {
      lines = { { id = "si_default", text = "Starbreeze Village, where the Gnarlpine turned. The moonwells, if Corithras is right. And the tree itself grows faster than any tree should." } },
      choices = {
        { text = "Then someone should look into it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crown = {
      lines = { { id = "c_default", text = "The druids in Darnassus use the moonwells' water, and the wells must be watched. The phial is a lesson as much as an errand. Corithras will teach you the rest." } },
      choices = {
        { text = "What lesson?", next = "crown2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crown2 = {
      lines = { { id = "c2_default", text = "Our history since Hyjal. Nordrassil spent its power to destroy Archimonde, and our immortality went with it. The young ought to know what that cost." } },
      choices = { { text = "I'll listen to Corithras.", next = "BACK", fx = { affinity = 1 } } },
    },
    hyjal = {
      lines = { { id = "hy_default", text = "We fought the Legion beside orcs and humans, and the World Tree gave everything it had to end Archimonde. We won, and we have been paying for it ever since." } },
      choices = {
        { text = "Paying how?", next = "hyjal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyjal2 = {
      lines = { { id = "hy2_default", text = "We grow old now, and we sicken, and some of my people cannot bear it. I find I don't mind the years, so long as I spend them up here." } },
      choices = {
        { text = "That's a good way to spend them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I'd mind. I'd mind a great deal.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    view = {
      lines = { { id = "v_default", text = "Every path in Shadowglen, the spider cave to the north, the road south to Dolanaar. And every young elf who walks it. I watch until the trees take them." } },
      choices = {
        { text = "Do they come back?", next = "view2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    view2 = {
      lines = { { id = "v2_default", text = "Most of them do, one day, and taller than they left. A few never return, and I remember those names and say them up here, where the wind carries them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    world_t = {
      lines = { { id = "wt_default", text = "It is. Sit with me a moment, and tell me what the worst of it is, down there." } },
      choices = {
        { text = "The Horde, cutting Ashenvale.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "The corruption. It's everywhere.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Honestly? Being far from home.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    welcome = {
      lines = { { id = "we_default", text = "You climbed Aldrassil, and that is welcome enough. The glade asks only that you walk gently and leave it as you found it." } },
      choices = { { text = "I will. Thank you.", next = "BACK", fx = { affinity = 1, standing = { shadowglen = 1 } } } },
    },
    story = {
      lines = { { id = "so_default", text = "Then you know about the dragons' refusal, and the furbolgs. It is better that you hear it from us than learn it from the sickness itself." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I watch over Shadowglen from up here. Someone should see the whole glade at once." } },
    advice = { { id = "tp_ad", text = "Stay on the road to Dolanaar. The forest has grown dangerous beasts of late." } },
    teldrassil = { { id = "tp_teldrassil", text = "Young, tall, and still growing. Too quickly, some say. I only see it from the top." } },
    _none = { { id = "tp_none", text = "That is beyond what I can see from here, and I can see a long way." } },
  },
}

P:NPC {
  key = "dirania", id = TODO_NPC("Dirania Silvershine"), name = "Dirania Silvershine",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "wistful" }, values = { "kind", "loyal" },
  notices = { "pet" },

  greetings = {
    { id = "g_home", text = "All isn't well in the glade, I know. But coming back here always feels like coming home." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "What a fine companion! Be good to it, for friends are what get us through the dark parts of the forest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Dirania Silvershine. Shadowglen always feels like home, even now. Though a friend of mine is worrying me today." },
        { id = "h_friend", tags = { "news" }, when = { questActive = TODO_QUEST("A Good Friend") },
          text = "Iverron visits me at the same hour every day, and today he hasn't. He spends far too long by that spider cave. Please, look for him." },
        { id = "h_antidote", when = { questActive = TODO_QUEST("Iverron's Antidote") },
          text = "Hyacinth mushrooms, moonpetal lilies, and ichor from the very spiders that bit him. Bring them, and I'll make the antidote. Hurry, if you can." },
        { id = "h_saved", when = { questDone = TODO_QUEST("Iverron's Antidote") }, text = "Iverron's on his feet already, and talking about going back into the cave. Some friends you have to keep saving. Thank you for this time." },
        { id = "h_bitten", tags = { "news" }, when = { questActive = TODO_QUEST("A Friend in Need") },
          text = "Bitten by Githyiss? I've warned him about those spiders more times than I can count! All right, then, we can make an antidote." },
      },
      again = {
        { id = "h_again", text = "What else? Sorry, I keep looking toward the cave." },
        { id = "h_again2", text = "Ask. It helps to talk while I wait." },
      },
      choices = {
        { text = "Tell me about Iverron.", next = "iverron" },
        { text = "What's wrong in Shadowglen?", next = "glen" },
        { text = "Where do I find what the antidote needs?", next = "herbs", when = { questActive = TODO_QUEST("Iverron's Antidote") } },
        { text = "I'll help him.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    iverron = {
      lines = {
        { id = "i_brave", text = "He comes by at the same hour every day, and he explores where he shouldn't. He's brave the way that worries everyone who cares about him." },
      },
      choices = {
        { text = "He's lucky to have you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Why does he keep going to the cave?", next = "iverron2" },
      },
    },
    iverron2 = {
      lines = { { id = "i2_default", text = "He says the spiders are bigger than they ought to be, and he wants to know why. Gilshalan on the steps says the same, from much further away." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    glen = {
      lines = { { id = "gl_default", text = "Grells to the south, spiders to the north, and the furbolgs gone strange... All isn't well, I know, but it is still home." } },
      choices = {
        { text = "What's wrong with the furbolgs?", next = "glen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glen2 = {
      lines = { { id = "gl2_default", text = "Ask Melithar; he's had word from a dryad about it. Or Athridas, down in Dolanaar. I only know the Gnarlpine have left their homes in the hills." } },
      choices = { { text = "I'll ask them.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    herbs = {
      lines = { { id = "he_default", text = "Hyacinth mushrooms grow under the trees, and the grells to the south hoard them, while moonpetal lilies only grow by the pools. The ichor you'll have to take from the spiders themselves." } },
      choices = { { text = "I'll be quick.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "These woods feel like home every time I come back, and that is my whole story. Iverron's is longer, and more foolish." } },
    advice = { { id = "tp_ad", text = "Never go into a spider cave alone. Tell Iverron that, if you see him." } },
    _none = { { id = "tp_none", text = "I'm sorry, my mind is on Iverron." } },
  },
}

P:NPC {
  key = "gilshalan", id = TODO_NPC("Gilshalan Windwalker"), name = "Gilshalan Windwalker",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "shadowglen" }, temper = { "solitary" }, values = { "curious" },
  notices = { "craft" },

  greetings = {
    { id = "g_steps", text = "Oh, hello. I was only sitting; the steps are good for sitting." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You work with venoms and draughts? Then you'll understand why I need what I need." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Gilshalan Windwalker, and I study the Webwood spiders in the cave to the north, from a distance, mostly." },
        { id = "h_venom", tags = { "news" }, when = { questActive = TODO_QUEST("Webwood Venom") },
          text = "I need their venom sacs. I believe the new world tree has changed these spiders, and their venom will tell me how." },
        { id = "h_egg", when = { questActive = TODO_QUEST("Webwood Egg") },
          text = "There's a nest deep in Shadowthread Cave. Bring me an egg, unhatched. A live spider is more than either of us should handle." },
        { id = "h_summons", when = { questActive = TODO_QUEST("Tenaron's Summons") },
          text = "Tenaron is asking for you, at the very top of the tree. He is a patient elf, but I wouldn't test it." },
        { id = "h_shipped", when = { questDone = TODO_QUEST("Webwood Egg") },
          text = "The egg has gone to Darnassus with the venom, and I'll follow when I'm done here, or when it hatches, whichever comes first." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm only sitting, after all." },
        { id = "h_again2", text = "Ask away. The spiders aren't going anywhere, which is rather the problem." },
      },
      choices = {
        { text = "Why study spiders?", next = "why" },
        { text = "Why sit out here on the steps?", next = "steps" },
        { text = "What's in Shadowthread Cave?", next = "cave" },
        { text = "I'm an alchemist. Venom interests me.", next = "alch", when = { profession = "Alchemy" } },
        { text = "I'll go to the cave.", next = "END", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    why = {
      lines = {
        { id = "w_silk", text = "Their silk is stronger than it has any right to be, and in the right hands their venom heals. And they frighten me, if I'm honest, so I'd like them to frighten me less." },
      },
      choices = {
        { text = "Good luck with that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Has the tree really changed them?", next = "tree_g" },
      },
    },
    tree_g = {
      lines = { { id = "tg_default", text = "They're cousins of a much smaller spider. Here they've grown huge. Something in Teldrassil feeds them more than it should." } },
      choices = {
        { text = "That's unsettling.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    steps = {
      lines = { { id = "s_default", text = "Inside, everyone asks me about spiders, but out here only you do, which is a much better ratio." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    cave = {
      lines = { { id = "c_default", text = "Webwood spiders, their nest, and deep at the back one big enough that the Sentinels name it: Githyiss the Vile. Don't go that far unless you mean to." } },
      choices = {
        { text = "Githyiss bit Iverron.", next = "cave2",
          when = { any = { { questActive = TODO_QUEST("A Friend in Need") }, { questActive = TODO_QUEST("Iverron's Antidote") } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave2 = {
      lines = { { id = "c2_default", text = "Then Dirania will be furious, and rightly. Her antidote needs the spiders' own ichor. There's a lesson in that I haven't finished learning." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alch = {
      lines = { { id = "a_default", text = "Then you know a venom that kills can cure, measured right. Dirania's antidote uses their ichor for exactly that reason." } },
      choices = { { text = "I'll keep a sac or two.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came to Shadowglen to watch spiders, and I'm still watching them, from the steps, mostly." } },
    advice = { { id = "tp_ad", text = "Never stand under a web you can't see the end of." } },
    _none = { { id = "tp_none", text = "Spiders, I know. Most other things, less so." } },
  },
}
