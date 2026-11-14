-- Astranaar and Maestra's Post (Alliance). Voice: bibles/ashenvale.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "raene", id = TODO_NPC("Raene Wolfrunner"), name = "Raene Wolfrunner",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "major",
  communities = { "astranaar" }, temper = { "fierce" }, values = { "protective", "loyal" },
  notices = { "pet", "form", "class" },

  greetings = {
    { id = "g_forest", text = "Ashenvale needs you. Truly. The forest needs every blade it can get, and every pair of eyes." },
    { id = "g_back", when = { metBefore = true }, text = "Home from the trees. What did you see out there? Tell me everything." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "A good companion. Korra likes the look of it. Dagri's not sure yet. He's not sure about anyone, at first." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then you know the forest isn't a place, it's a living thing. Help me keep it that way." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A druid. The trees will be glad of you. So will I. Something's making the furbolgs sick, and you'll see it sooner than I can." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Raene Wolfrunner. I command the scouts in Astranaar. The furbolgs are going mad to the north, the Horde is cutting the forest to the east, and I'd rather fight them all alone than watch another tree fall." },
        { id = "h_trek", tags = { "news" }, when = { questActive = TODO_QUEST("Onward to Ashenvale") },
          text = "Thundris sent you? Good, he said he would. There's more wrong in this forest than one scout can mend. Sit, and I'll tell you where to start." },
        { id = "h_aggressive", when = { questActive = TODO_QUEST("An Aggressive Defense") },
          text = "The Foulweald have been falling on travellers along the roads. Thin their camp before they grow bold enough to come here." },
        { id = "h_cull", tags = { "news" }, when = { questActive = TODO_QUEST("Culling the Threat") },
          text = "The Thistlefur grow in number every week, my scouts tell me. Dal Bloodclaw leads them. Bring him down, and the rest will scatter. Mostly." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Raene's Cleansing") },
          text = "Teronis was my friend. He was trying to learn why the furbolgs turned. Now he's dead in the forest and his work is scattered. Finish it. For him." },
        { id = "h_ran", when = { questDone = TODO_QUEST("Raene's Cleansing") },
          text = "Ran Bloodtooth's skull hangs where the Thistlefur scouts can see it. I don't enjoy it. But they keep their distance now." },
      },
      choices = {
        { text = "Who are Korra and Dagri?", next = "pets" },
        { text = "Why are the furbolgs attacking?", next = "furbolgs" },
        { text = "I'll help defend the forest.", next = "END", fx = { affinity = 2, standing = { astranaar = 1 } } },
      },
    },
    pets = {
      lines = { { id = "p_default", text = "Korra's my wintersaber; Dagri's my wolf. They don't like each other much, but they like me, and they both hate furbolgs. That's enough for a family." } },
      choices = { { text = "Good family.", next = "END", fx = { affinity = 1 } } },
    },
    furbolgs = {
      big = true,
      lines = {
        { id = "f_default", text = "They didn't use to. The furbolgs were peaceful, wise even, once. Something's poisoning them. Until I know what, I keep them away from the town with arrows." },
      },
      choices = {
        { text = "I'll find out what it is.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Why not just kill them all?", next = "all" },
      },
    },
    all = {
      lines = { { id = "a_default", text = "Because they were our friends. And because something made them like this. I'd rather kill that." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The druids could help here, if they'd look up from their arguments in Darnassus. A few have. Not enough." } },
    _none = { { id = "tp_none", text = "Not mine to know. Ask a Sentinel. Or the trees, if you know how." } },
  },
}

P:NPC {
  key = "pelturas", id = TODO_NPC("Pelturas Whitemoon"), name = "Pelturas Whitemoon",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "astranaar" }, temper = { "anxious" }, values = { "loving", "determined" },
  notices = { "class" },

  greetings = {
    { id = "g_worried", text = "Please, speak softly. My daughter's sleeping. At least, I hope she's sleeping." },
    { id = "g_back", when = { metBefore = true }, text = "Thank you for coming back. Every time someone comes back, I can breathe a little." },
  },

  notice = {
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "DRUID", "PALADIN" } },
      text = "You have healing in you. I can feel it. Would you look at her? Just look? I'll take anything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Pelturas Whitemoon. My daughter Relara has a fever no herb can touch, and nightmares she screams through. I'll try anything. I've tried most things." },
        { id = "h_orendil", tags = { "news" }, when = { questActive = TODO_QUEST("Orendil's Cure") },
          text = "Orendil Broadleaf knows healing better than anyone in the forest. Find him, please. Tell him it's a child." },
        { id = "h_tear", when = { questActive = TODO_QUEST("Elune's Tear") },
          text = "Elune's Tear. If the Mother Moon weeps for anyone, let her weep for my girl." },
        { id = "h_stardust", when = { questActive = TODO_QUEST("The Ruins of Stardust") },
          text = "Stardust, from the old ruins. For a poultice to bring her fever down. Hurry, if you can. Please." },
        { id = "h_moonstone", tags = { "news" }, when = { questActive = TODO_QUEST("Fallen Sky Lake") },
          text = "A moonstone, from the Shadethicket Oracle at Fallen Sky Lake. It's the last piece. After this she'll be strong again. She has to be." },
        { id = "h_better", when = { questDone = TODO_QUEST("Fallen Sky Lake") },
          text = "She's eating. She asked for honey cakes this morning. Honey cakes! I cried in front of the baker. I don't care who knows it." },
      },
      choices = {
        { text = "What's wrong with her?", next = "wrong" },
        { text = "I'll help.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    wrong = {
      big = true,
      lines = {
        { id = "w_default", text = "No one's sure. A fever that comes from magic, not sickness, and dreams that hurt her. Something in this forest reaches into sleep. I want it out of my daughter." },
      },
      choices = {
        { text = "We'll get it out.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something in the forest?", next = "forest" },
      },
    },
    forest = {
      lines = { { id = "f_default", text = "The furbolgs went mad. The water's wrong in places. And now my girl dreams of things she's never seen. I'm not a druid. But I'm not a fool, either." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm sorry, I can't think about anything else right now." } },
  },
}

P:NPC {
  key = "relara", id = TODO_NPC("Relara Whitemoon"), name = "Relara Whitemoon",
  bible = "bibles/ashenvale.md", role = "child", tier = "quest",
  communities = { "astranaar" }, temper = { "frightened" }, values = { "gentle" },
  notices = { "pet" },

  greetings = {
    { id = "g_sleep", text = "Is it morning? It's always dark when I wake up. Is Papa here?" },
    { id = "g_better", when = { questDone = TODO_QUEST("Fallen Sky Lake") }, text = "Hello! I'm better. Papa says I mustn't run yet. I'm going to run anyway. Later." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Is that yours? Can it come closer? I won't pull its ears. Promise." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Relara. I'm sick. Papa's fixing it. The dreams are bad, but you're not in them, so that's good." },
        { id = "h_better", when = { questDone = TODO_QUEST("Fallen Sky Lake") },
          text = "The bad dreams stopped. Now I just dream about honey cakes. Papa says that's normal. I think it's the best dream." },
        { id = "h_sentinel", when = { metBefore = true }, text = "When I'm better, Papa says I can watch the Sentinels practise. I'm going to be a Sentinel. Or a hippogryph. Whichever one gets to fly." },
      },
      choices = {
        { text = "What do you dream about?", next = "dreams", when = { questBefore = TODO_QUEST("Fallen Sky Lake") } },
        { text = "Get well soon.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    dreams = {
      lines = { { id = "d_default", text = "Everything's dark and twisty, and something's whispering. I don't like it. Can we talk about something else?" } },
      choices = { { text = "Of course. Get some rest.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Papa would know. Papa knows everything except how to make the dreams stop." } },
  },
}

P:NPC {
  key = "faldreas", id = TODO_NPC("Faldreas Goeth'Shael"), name = "Faldreas Goeth'Shael",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "astranaar" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "kit" },

  greetings = {
    { id = "g_road", text = "Ishnu-alah, traveller. The roads out of Astranaar are long and not as safe as they look. Mind them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Faldreas. I keep track of who's out on the roads and who should have come back by now. The list of the second kind is longer than I'd like." },
        { id = "h_edunes", tags = { "news" }, when = { questActive = TODO_QUEST("Check in on the Edunes") },
          text = "The Edunes haven't sent word in too long. Look in on them for me. I hope it's nothing. It's usually something." },
        { id = "h_crossed", when = { metBefore = true }, text = "Three travellers came back yesterday. I crossed them off the list. Crossing names off the right way is the best part of my day." },
      },
      choices = { { text = "Why keep the list?", next = "list" }, { text = "I'll keep my eyes open.", next = "END", fx = { affinity = 1 } } },
    },
    list = {
      lines = {
        { id = "l_remember", text = "Because someone has to remember who went out. If nobody remembers, nobody goes looking. I'd rather be the one who remembers." },
      },
      choices = { { text = "I'll check in when I'm back.", next = "END", fx = { affinity = 2, standing = { astranaar = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Raene would know. She knows everything that moves in this forest." } },
  },
}

P:NPC {
  key = "kimlya", id = TODO_NPC("Innkeeper Kimlya"), name = "Innkeeper Kimlya",
  bible = "bibles/ashenvale.md", role = "innkeeper", tier = "service",
  communities = { "astranaar" }, temper = { "warm" }, values = { "kind" },
  notices = { "weary" },

  greetings = {
    { id = "g_rest", text = "Worn through, body and spirit both, by the look of you. Rest here a while. Elune keep your dreams gentle." },
    { id = "g_home", when = { homeInn = { "Astranaar" } }, text = "Your bed's ready. The island's quiet tonight. The lake keeps the worst of the forest out." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "The furbolgs, was it? Or the Horde? Never mind. Sit. Whoever it was, they can't reach you in here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kimlya. I keep the inn for scouts, healers, travellers and the occasional lost adventurer. Most of them leave in better shape than they came." },
        { id = "h_relara", when = { heardLine = "pelturas.h_default" },
          text = "So Pelturas told you. Poor man. I send broth up for little Relara every night. She doesn't eat it, but he does, and someone has to look after him." },
        { id = "h_sentinel", when = { metBefore = true }, text = "A Sentinel fell asleep at that table last night, sitting up, spear still in her hand. I didn't have the heart to wake her." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The lake's black as ink at night, and Astranaar's lanterns float on it. Prettiest thing in Ashenvale, and nobody stops to look." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just resting.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Raene, outside. She'll know, or she'll find out." } },
  },
}

P:NPC {
  key = "delgren", id = TODO_NPC("Delgren the Purifier"), name = "Delgren the Purifier",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "maestras_post" }, temper = { "earnest" }, values = { "devout", "brave" },
  spiritSensitive = true,
  notices = { "class" },

  greetings = {
    { id = "g_light", text = "Light keep you, friend! Maestra's Post bids you welcome. It's a long way from Lordaeron, but there's work for the righteous everywhere." },
    { id = "g_human", when = { race = "Human" }, text = "Human! You've no idea how good that is to see, this far into elf country." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A brother of the Light! Which chapter? Doesn't matter. We'll trade stories later. For now, there's a cult to stop." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Warlock. I'll be honest: my hand wants my hammer. I'll keep it still. You keep yours still too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Delgren, called the Purifier. Our company came to help the night elves against demons and the walking dead. We found a cult instead: the Dark Strand, nesting in the old tower to the north." },
        { id = "h_tower", tags = { "news" }, when = { questActive = TODO_QUEST("The Tower of Althalaxx") },
          text = "The Tower of Althalaxx. The Dark Strand gather there to call something they shouldn't. Balthule and Feero have their parts in this; I have mine. Will you take yours?" },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Supplies to Auberdine") },
          text = "Supplies for Auberdine, across the water. The elves there have been generous to us. It's time we returned the favour." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Sky-elves, truly! I'd heard. The Light shines in strange places these days. All the more reason to look for it." },
      },
      choices = {
        { text = "Who are the Dark Strand?", next = "strand" },
        { text = "Why learn Orcish?", next = "orcish" },
        { text = "Light keep you.", next = "END", fx = { affinity = 1 } },
      },
    },
    strand = {
      big = true,
      lines = {
        { id = "s_default", text = "A cult hungry for power that should have stayed lost, and willing to deal with demons to get it. I've seen what that bargain costs. They haven't, yet." },
      },
      choices = {
        { text = "Then we stop them.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Why do people join them?", next = "elves" },
      },
    },
    elves = {
      lines = { { id = "e_default", text = "Grief and pride make fools of every people. Mine too. I don't judge anyone by their worst. I just stop it." } },
      choices = { { text = "...", next = "END" } },
    },
    orcish = {
      lines = { { id = "o_default", text = "Because one day there'll be peace, and someone will need to say so in both languages. I'd like to be there for it." } },
      choices = { { text = "I hope you are.", next = "END", fx = { affinity = 2, align = { honor = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, friend. But I'll pray on it, and that's a start." } },
  },
}
