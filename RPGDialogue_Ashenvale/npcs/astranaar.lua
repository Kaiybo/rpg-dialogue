-- Astranaar and Maestra's Post (Alliance). Voice: bibles/ashenvale.md
-- Classic quests only: Trek to Ashenvale (Sentinel Selarin) is the road in, not the later
-- Onward to Ashenvale; Faldreas sends travellers to Stonetalon Peak, not to the Edunes.
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "raene", id = TODO_NPC("Raene Wolfrunner"), name = "Raene Wolfrunner",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "major",
  communities = { "astranaar" }, temper = { "fierce" }, values = { "protective", "loyal" },
  notices = { "pet", "form", "class" },
  impression = {
    first = "Raene Wolfrunner would sooner face every furbolg and orc in Ashenvale alone than watch another tree fall. When she speaks of her friend Teronis, the grief sits close under all that fierceness.",
    third = "{name} met Raene Wolfrunner, who commands the scouts of Astranaar and fights for every tree in Ashenvale.",
  },

  greetings = {
    { id = "g_forest", text = "Ashenvale needs you, truly. The forest needs every blade it can get, and every pair of eyes." },
    { id = "g_back", when = { metBefore = true }, text = "Home from the trees! Tell me what you saw out there, every bit of it." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Ashenvale has satyrs enough already, warlock, and they started out much like you. Keep that imp on a short leash inside my walls." },
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "That's a good companion. Korra likes the look of it, though Dagri isn't sure yet; he's never sure about anyone at first." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Then you know the forest isn't a place but a living thing, so help me keep it that way." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A druid, and the trees will be glad of you. So will I, because something is making the furbolgs sick, and you'll see it sooner than I can." },
  },

  start = "hello",
  nodes = {
    warrior_r = {
      lines = {
        { id = "wr_default", text = "There is no front, warrior, and that's the trouble with this war. The Warsong come through the trees from the east wherever they like, so a good warrior here learns to fight from behind a trunk, the way my scouts do." },
        { id = "wr_watch", when = { origin = "nightelf_auberdine_watch" },
          text = "A veteran of the Auberdine watch, and you still want more? Good. Ashenvale needs exactly that kind of stubbornness, because the Warsong have plenty of their own." },
      },
      choices = {
        { text = "Then I'll learn to fight like a scout.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'll stand in the open and let them come.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
      },
    },
    rogue_r = {
      big = true,
      lines = {
        { id = "rr_default", text = "Could you? The Warsong post guards on their saws and their wolves smell elves at fifty paces, but a rogue who can get close could learn how many axes they have, and where they mean to cut next." },
        { id = "rr_watch", when = { origin = "nightelf_watcher_trained" },
          text = "You move like the Watchers, and I'll not ask where you learned it. Scout the lumber camps for me and I'll count it a debt between us." },
      },
      choices = {
        { text = "I'll scout and report. No killing unless I must.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll do more than count. Their foremen won't wake.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    human_r = {
      big = true,
      lines = {
        { id = "hmr_default", text = "I know, and I've heard Stormwind's soldiers talk about it around our fires. Your people kept the orcs in camps after that war, and their young Warchief broke them out and brought them across the sea, and here are his axes in my trees." },
      },
      choices = {
        { text = "Orcs can change. Some of them have.", next = "human_r2", fx = { align = { light = 1 } } },
        { text = "An orc with an axe is an orc with an axe.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    human_r2 = {
      lines = {
        { id = "hmr2_default", text = "Maybe, and maybe one day I'll meet one. Until then I'll judge them by what reaches Astranaar, which is smoke and stumps and the bodies of my scouts." },
      },
      choices = { { text = "Something else, Raene.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Raene Wolfrunner, and I command the scouts of Astranaar. The furbolgs are going mad to the north and the Horde is cutting the forest to the east, and I would rather face them all alone than watch another tree fall." },
        { id = "h_trek", tags = { "news" }, when = { questActive = TODO_QUEST("Trek to Ashenvale") },
          text = "You've come from Darkshore, and Selarin sent you on quickly; good. I wish you'd come under happier circumstances, but there's more wrong in this forest than one scout can mend, so start by talking to the people of Astranaar." },
        { id = "h_aggressive", when = { questActive = TODO_QUEST("An Aggressive Defense") },
          text = "The Foulweald have been falling on travellers along the road east, before the Falfarren River. Their camps are south of the road, so show them the same mercy they've shown our people." },
        { id = "h_cull", tags = { "news" }, when = { questActive = TODO_QUEST("Culling the Threat") },
          text = "My scouts say the Thistlefur north of Astranaar have grown greatly in number these past months, and if they grow much more they may find the courage to attack us. Bring me their chieftain Dal Bloodclaw's skull." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Raene's Cleansing") },
          text = "Teronis was my friend, and he died seeking a way to slow the furbolgs. I would rest much easier knowing his death was not in vain, so finish his work." },
        { id = "h_ran", when = { questDone = TODO_QUEST("Raene's Cleansing") },
          text = "You took up Teronis's work when no one else would, and that means a great deal to me. He would have been proud of whoever finishes it." },
        { id = "h_thundris", when = { heardLine = "thundris.h_ashenvale" },
          text = "Thundris Windweaver sent you down from Auberdine? Then he thinks well of you, and he doesn't think well of many." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, good. My scouts come back from the Thistlefur hills with wounds that need more than bandages." },
      },
      again = {
        { id = "h_again", text = "What else? Korra's getting restless, and so am I." },
        { id = "h_again2", text = "Ask away; I have a moment before the scouts report." },
      },
      choices = {
        { text = "Who are Korra and Dagri?", next = "pets" },
        { text = "Why are the furbolgs attacking?", next = "furbolgs" },
        { text = "Tell me about Teronis.", next = "teronis" },
        { text = "What about the Horde?", next = "horde" },
        { text = "How do you keep two companions at once?", next = "hunter_r", when = { class = "HUNTER" } },
        { text = "What do you need from a druid?", next = "druid_r", when = { class = "DRUID" } },
        { text = "Do your scouts need a healer?", next = "priest_r", when = { class = "PRIEST" } },
        { text = "Put me at the front when the Warsong come.", next = "warrior_r", when = { class = "WARRIOR" } },
        { text = "I could get into their lumber camps unseen.", next = "rogue_r", when = { class = "ROGUE" } },
        { text = "My people fought the orcs in our own fields.", next = "human_r", when = { race = "Human" } },
        { text = "I'll help defend the forest.", next = "END", fx = { affinity = 2, standing = { astranaar = 1 } } },
      },
    },
    pets = {
      lines = { { id = "p_default", text = "Korra is my saber cat and Dagri is my wolf. They don't like each other much, but they like me, and they both hate furbolgs, and that's enough for a family." } },
      choices = {
        { text = "Good family.", next = "BACK", fx = { affinity = 1 } },
        { text = "How do they get along?", next = "pets2" },
      },
    },
    pets2 = {
      lines = { { id = "p2_default", text = "They tolerate each other for my sake, the way two old soldiers share a fire. It's more courtesy than either of them shows a furbolg." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    furbolgs = {
      big = true,
      lines = {
        { id = "f_default", text = "They didn't use to. The furbolgs were peaceful once, even wise, but something is poisoning them, and until I know what it is, I keep them away from the town with arrows." },
      },
      choices = {
        { text = "I'll find out what it is.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Why not just kill them all?", next = "all" },
      },
    },
    all = {
      lines = { { id = "a_default", text = "Because they were our friends, and because something made them like this. I would rather kill whatever that is." } },
      choices = {
        { text = "Fair.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teronis = {
      lines = { { id = "te_default", text = "He was a longtime friend, aiding the Sentinels here. He went looking for a gem for a rod made by Dartol, an evil wizard long dead, because he thought it could slow the furbolgs, and we found him dead on the shrine island in Lake Falathim." } },
      choices = {
        { text = "A dead wizard's rod?", next = "rod" },
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You blame yourself for letting him go alone.", tag = "Persuade", next = "teronis_guilt",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "kind" }, { class = "HUNTER" } } } },
          fail = { next = "teronis_no", fx = { affinity = -1 } } },
      },
    },
    rod = {
      lines = { { id = "ro_default", text = "I know how it sounds. But Teronis believed the rod could let someone walk among the furbolgs as one of them and learn what poisoned them, and I trust what Teronis believed." } },
      choices = {
        { text = "Then I'll finish what he started.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Walking among them in their own skins is a fine trick, and I like tricks.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "A wizard's tool sounds risky.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    horde = {
      lines = { { id = "ho_default", text = "The Warsong cut to the east from their post at Splintertree, and my Sentinels answer every axe they swing. I would rather face them alone than watch them hack their way through these trees." } },
      choices = {
        { text = "Can't there ever be peace here?", next = "horde2" },
        { text = "Then I'll fight them with you.", next = "BACK", fx = { affinity = 2, standing = { astranaar = 1 } } },
      },
    },
    horde2 = {
      lines = { { id = "ho2_default", text = "Perhaps, on the day they stop cutting. Ask Delgren at Maestra's Post; he's a human paladin who learned their tongue, and he'll give you a more patient answer than I can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter_r = {
      lines = { { id = "hr_default", text = "With patience, and by never favouring one where the other can see. Your own companion will teach you the rest, if you let it." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid_r = {
      lines = { { id = "dr_default", text = "Eyes that can see sickness. Walk the Thistlefur hills north of town and tell me whether the trees are sick too, or only the furbolgs." } },
      choices = { { text = "I'll go and look.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    priest_r = {
      lines = { { id = "pr_default", text = "They always do. The ones who come back from the Thistlefur hills come back torn, and some nights Kimlya's inn is more hospice than inn, so sit with them if you have the time." } },
      choices = {
        { text = "I'll go there now.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { astranaar = 1 } } },
        { text = "The ones who went into the Thistlefur hills chose their wounds.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    teronis_guilt = {
      lines = {
        { id = "tg_default", text = "Every day. He asked whether I could spare a scout to walk with him, and with the Warsong at the river I said no, so he went to the Zoram Strand alone and the naga found him before anyone else did." },
        { id = "tg_hunter", when = { class = "HUNTER" },
          text = "You know what it is to answer for another life, hunter. I let Teronis go to the Zoram Strand alone because I wouldn't spare a scout from the Warsong line, and I have answered for it every night since." },
      },
      choices = {
        { text = "You couldn't have known.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Then let me finish what he started.", next = "rod" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teronis_no = {
      lines = {
        { id = "tn_default", text = "Blame is for later, when the forest is safe again. Ask me something I can use." },
        { id = "tn_kin", when = { race = "NightElf" },
          text = "You know better than to pick at a Sentinel's wounds, {g:brother|sister}. Ask me something I can use." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "My scouts bring me word of everything that moves in this forest, and Korra brings me the rest. Ask what you need." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } },
        text = "I'll answer, because the forest needs every pair of hands, even yours. Be quick about it." },
    },
    background = { { id = "tp_bg", text = "I'm a hunter of the Sentinels, and Ashenvale is the only home I care about. Korra and Dagri are all the family I need." } },
    advice = { { id = "tp_ad", text = "Learn the forest as if it were part of you, and remember there is always more danger hidden in it than you can see." } },
    furbolgs = { { id = "tp_furbolgs", text = "They were peaceful once, even wise. Something poisoned them, and I mean to find out what.", next = "furbolgs" } },
    warsong = { { id = "tp_warsong", text = "Their axes are the sound I hate most in this whole forest." } },
    cenarion_circle = { { id = "tp_circle", text = "The druids could help here, if they'd look up from their arguments in Darnassus. A few have, but not nearly enough." } },
    _none = { { id = "tp_none", text = "That's not mine to know. Ask a Sentinel, or the trees, if you know how." } },
  },
}

P:NPC {
  key = "pelturas", id = TODO_NPC("Pelturas Whitemoon"), name = "Pelturas Whitemoon",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "astranaar" }, temper = { "anxious" }, values = { "loving", "determined" },
  notices = { "class" },
  impression = {
    first = "Pelturas Whitemoon asked me to speak softly for his daughter's sake, then listened for her the whole time we talked. He has tried nearly every cure there is, and he has not once stopped hoping.",
    third = "{name} met Pelturas Whitemoon of Astranaar, a father searching for any cure for his daughter Relara's fever and nightmares.",
  },

  greetings = {
    { id = "g_worried", text = "Please, speak softly; my daughter is sleeping. At least, I hope she's sleeping." },
    { id = "g_back", when = { metBefore = true }, text = "Thank you for coming back. Every time someone comes back, I can breathe a little easier." },
  },

  notice = {
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "DRUID", "PALADIN" } },
      text = "You have healing in you; I can feel it. Would you look at her? Only look, please, and I'll be grateful for anything." },
  },

  start = "hello",
  nodes = {
    mage_p = {
      lines = {
        { id = "mp_default", text = "A spell? My mother would have thrown you out of the house for saying it, and the Sentinels would agree with her. But I've tried every herb in Ashenvale, so tell me plainly: can your magic touch a fever that comes from a dream?" },
      },
      choices = {
        { text = "No. Honestly, it can't. I'm sorry.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "It might. I'd try anything, as you have.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Pelturas Whitemoon. My daughter Relara has a fever no herb can touch and nightmares that make her scream in her sleep, and I will try anything; I have tried most things already." },
        { id = "h_orendil", tags = { "news" }, when = { questActive = TODO_QUEST("Orendil's Cure") },
          text = "This is from Orendil? His skill with herbs and healing is great, and this cure gives me hope where before I had very little." },
        { id = "h_tear", when = { questActive = TODO_QUEST("Elune's Tear") },
          text = "Orendil's cure only slowed the sickness. He told me of Elune's Tear, a stone found only on the isle in Iris Lake, east of here, that washes corruption away, so please bring it to me." },
        { id = "h_stardust", when = { questActive = TODO_QUEST("The Ruins of Stardust") },
          text = "The tear washed away some of the sickness and her nightmares have lessened, but the fever still rages. Orendil spoke of a frosted dust in the Ruins of Stardust to the south; bring me some, and I'll make a poultice." },
        { id = "h_moonstone", tags = { "news" }, when = { questActive = TODO_QUEST("Fallen Sky Lake") },
          text = "Her fever has passed, but she is so weak. We used to gather moonstones together at Fallen Sky Lake before the Shadethicket came, and now their Oracle hoards every one; I need one to give her strength back." },
        { id = "h_better", when = { questDone = TODO_QUEST("Fallen Sky Lake") },
          text = "She's eating! She asked for honey cakes this morning, and I cried in front of the baker, and I don't care who knows it." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? Forgive me, I keep listening for her." },
        { id = "h_again2", text = "Go on, please. Talking helps with the waiting." },
      },
      choices = {
        { text = "What's wrong with her?", next = "wrong" },
        { text = "Who is Orendil?", next = "orendil" },
        { text = "Fallen Sky Lake?", next = "lake" },
        { text = "Let me look at her.", next = "look", when = { class = { "PRIEST", "DRUID", "PALADIN" } } },
        { text = "I'm a mage. Let me try a spell on her fever.", next = "mage_p", when = { class = "MAGE" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    wrong = {
      big = true,
      lines = {
        { id = "w_default", text = "No one is sure. It's a fever that comes from magic rather than sickness, with dreams that hurt her, as if something in this forest reaches into sleep, and I want it out of my daughter." },
      },
      choices = {
        { text = "We'll get it out.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "If it takes dark magic to drive it out, I'll use it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something in the forest?", next = "forest" },
      },
    },
    forest = {
      lines = { { id = "f_default", text = "The furbolgs went mad, the water is wrong in places, and now my girl dreams of things she has never seen. I'm no druid, but I'm not a fool either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orendil = {
      lines = { { id = "o_default", text = "Orendil Broadleaf is a healer, and his skill with herbs is greater than anyone's in the forest. Each remedy he sends helps a little, and each time I pray it will be the last one we need." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lake = {
      lines = { { id = "l_default", text = "We used to go there together, she and I, and gather the fallen moonstones. Then the Shadethicket bog beasts came, and their Oracle took every stone for himself." } },
      choices = {
        { text = "Then I'll take one back.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    look = {
      lines = { { id = "lo_default", text = "Would you really? Please be gentle with her. Whatever you can do, even if it only eases her for one night, I'll be grateful." } },
      choices = {
        { text = "I'll pray over her.", next = "BACK", fx = { affinity = 3, align = { light = 2 } } },
        { text = "Prayer won't reach a magic fever, but I know darker remedies that might.", next = "BACK", fx = { align = { light = -2 } } },
        { text = "I'll do what I can.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've asked everyone in Astranaar about everything, looking for something that might help Relara. Ask me; perhaps some of it will help you." },
    },
    background = { { id = "tp_bg", text = "I'm Relara's father. That's all I am at the moment, and it's enough." } },
    advice = { { id = "tp_ad", text = "Hold on to the people you love while you can. I'm learning that the hard way." } },
    _none = { { id = "tp_none", text = "I'm sorry, I can't think about anything else right now." } },
  },
}

P:NPC {
  key = "relara", id = TODO_NPC("Relara Whitemoon"), name = "Relara Whitemoon",
  bible = "bibles/ashenvale.md", role = "child", tier = "quest",
  communities = { "astranaar" }, temper = { "frightened" }, values = { "gentle" },
  notices = { "pet" },
  impression = {
    first = "Small and sick as she is, Relara Whitemoon still means to become a Sentinel or a hippogryph, whichever gets to fly. Her papa, she assured me, is fixing everything.",
    third = "{name} met Relara Whitemoon, Pelturas's young daughter, who faces her fevered nightmares with a child's stubborn hope.",
  },

  greetings = {
    { id = "g_sleep", text = "Is it morning yet? It's always dark when I wake up... is Papa here?" },
    { id = "g_better", when = { questDone = TODO_QUEST("Fallen Sky Lake") }, text = "Hello! I'm better now, and Papa says I mustn't run yet, but I'm going to run anyway, later." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Is that yours? Oh, can it come closer? I won't pull its ears, I promise!" },
  },

  start = "hello",
  nodes = {
    gnome_r = {
      lines = {
        { id = "gnr_default", text = "Yes! Is it that you're all really children? Papa says you're not, but you're the same size as me, and you've got a much better hat." },
      },
      choices = {
        { text = "No, but we build machines that walk.", next = "BACK", fx = { affinity = 2 } },
        { text = "It's a secret. Get well and I'll tell you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Relara, and I'm sick, but Papa's fixing it. The dreams are bad, but you're not in them, so that's good." },
        { id = "h_better", when = { questDone = TODO_QUEST("Fallen Sky Lake") },
          text = "The bad dreams stopped, and now I just dream about honey cakes. Papa says that's normal, but I think it's the best dream there is." },
        { id = "h_sentinel", when = { metBefore = true }, text = "When I'm better, Papa says I can watch the Sentinels practise, and I'm going to be a Sentinel, or a hippogryph, whichever one gets to fly." },
      },
      again = {
        { id = "h_again", text = "Are you still here? Good, then tell me something." },
        { id = "h_again2", text = "Will you stay a little longer? Papa's busy talking to the Sentinels." },
      },
      choices = {
        { text = "What do you dream about?", next = "dreams", when = { questBefore = TODO_QUEST("Fallen Sky Lake") } },
        { text = "What's your papa like?", next = "papa" },
        { text = "Do you like the Sentinels?", next = "sentinels_r" },
        { text = "Would you like to meet my companion?", next = "pet_r", when = { pet = true } },
        { text = "Want to know a secret about gnomes?", next = "gnome_r", when = { race = "Gnome" } },
        { text = "Get well soon.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    dreams = {
      lines = { { id = "d_default", text = "Everything's dark and twisty, and something keeps whispering, and I don't like it... can we talk about something else?" } },
      choices = {
        { text = "Of course. Tell me about the Sentinels.", next = "sentinels_r", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Of course. Get some rest.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    papa = {
      lines = { { id = "pa_default", text = "He's the best papa, and he knows everything except how to make the dreams stop. He used to take me to the lake to find moonstones, before the bog monsters came." } },
      choices = {
        { text = "Bog monsters?", next = "bog" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bog = {
      lines = { { id = "bo_default", text = "Papa says they're called Shadethicket, and they're big and squelchy and they took all the moonstones, so when I'm better I'm going to go and tell them off." } },
      choices = { { text = "I'll tell them off for you.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    sentinels_r = {
      lines = { { id = "se_default", text = "They're the bravest people in the whole forest, and they have owls and big cats! Raene's cat looked at me once, and I think she liked me." } },
      choices = { { text = "I'm sure she did.", next = "BACK", fx = { affinity = 1 } } },
    },
    pet_r = {
      lines = { { id = "pe_default", text = "Yes, yes, please! Hello, {pet}, you're very handsome. Do you like honey cakes? Everybody should like honey cakes." } },
      choices = { { text = "{pet} likes you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Relara Whitemoon, and I live in Astranaar with Papa, and I'm going to be a Sentinel when I'm better." } },
    advice = { { id = "tp_ad", text = "Always tell your papa when you have a bad dream, because he'll sit with you until morning." } },
    _none = { { id = "tp_none", text = "Papa would know. Papa knows everything except how to make the dreams stop." } },
  },
}

P:NPC {
  key = "faldreas", id = TODO_NPC("Faldreas Goeth'Shael"), name = "Faldreas Goeth'Shael",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "astranaar" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "kit" },
  impression = {
    first = "Faldreas keeps a list of everyone who goes out on Astranaar's roads and everyone who ought to have come back. Crossing names off the right way, he says, is the best part of his day.",
    third = "{name} met Faldreas Goeth'Shael, who keeps track of every traveller leaving Astranaar and listens to the forest spirits.",
  },

  greetings = {
    { id = "g_road", text = "Ishnu-alah, traveller. The roads out of Astranaar are long and not as safe as they look, so mind them." },
  },

  start = "hello",
  nodes = {
    pet_f = {
      lines = {
        { id = "pf_default", text = "Nobody has ever asked me that. Very well; {pet}, out on the roads with you, and I'll want to see both names come back through this gate, so look after each other." },
      },
      choices = {
        { text = "We always do.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Faldreas. I keep track of who goes out on the roads and who ought to have come back by now, and the second list is longer than I'd like." },
        { id = "h_edunes", tags = { "news" }, when = { questActive = TODO_QUEST("Journey to Stonetalon Peak") },
          text = "The forest spirits tell me you are brave and willing to travel. Take the Talondeep Path near Mystral Lake into the Stonetalon Mountains, then climb to Stonetalon Peak, where Keeper Albagorm is waiting for you." },
        { id = "h_crossed", when = { metBefore = true }, text = "Three travellers came back yesterday and I crossed them off the list. Crossing names off the right way is the best part of my day." },
        { id = "h_albagorm", when = { questDone = TODO_QUEST("Journey to Stonetalon Peak") },
          text = "Keeper Albagorm sent word that you arrived, and that I'd listened well to the forest spirits. I usually do; they're better at keeping lists than I am." },
      },
      again = {
        { id = "h_again", text = "What else? I've a list to keep." },
        { id = "h_again2", text = "Ask, and then tell me where you're headed next, so I can write it down." },
      },
      choices = {
        { text = "Why keep the list?", next = "list" },
        { text = "The forest spirits speak to you?", next = "spirits" },
        { text = "Where do the roads go from here?", next = "roads" },
        { text = "I'm a long way from home. Will you remember me?", next = "far", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Put my companion on your list too.", next = "pet_f", when = { class = "HUNTER", pet = { named = true } } },
        { text = "I'll keep my eyes open.", next = "END", fx = { affinity = 1 } },
      },
    },
    list = {
      lines = {
        { id = "l_remember", text = "Because someone has to remember who went out. If nobody remembers, nobody goes looking, and I would rather be the one who remembers." },
      },
      choices = { { text = "I'll check in when I'm back.", next = "BACK", fx = { affinity = 2, standing = { astranaar = 1 } } } },
    },
    spirits = {
      lines = { { id = "sp_default", text = "They whisper, mostly, and they aren't always clear, but they told me about you before you arrived. I've learned not to argue with them." } },
      choices = {
        { text = "What do they say about Ashenvale?", next = "spirits2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits2 = {
      lines = { { id = "sp2_default", text = "That it's hurting: the furbolgs in the north, the Horde's axes in the east, and Mystral Lake, which has come alive and attacks anyone on the path. I write it all down, like everything else." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    roads = {
      lines = { { id = "ro_default", text = "South through the Talondeep Path to Stonetalon, west to Maestra's Post and the coast, and east toward the Horde's camps, which I'd advise against." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    far = {
      lines = { { id = "fa_default", text = "I remember everyone who goes out, whatever their kingdom. Tell me where home is, so I know where to send word if I ever have to." } },
      choices = {
        { text = "Stormwind.", next = "BACK", fx = { affinity = 1 } },
        { text = "Ironforge, under the mountain.", next = "BACK", fx = { affinity = 1 } },
        { text = "Nowhere, these days.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Keeping track of the roads means hearing about everything on them. Ask, and I'll tell you what my lists say." },
    },
    background = { { id = "tp_bg", text = "I keep the list of who's out on the roads. It's a small job, until someone doesn't come back." } },
    advice = { { id = "tp_ad", text = "Tell someone where you're going before you go, and tell me, if there's no one else." } },
    _none = { { id = "tp_none", text = "Raene would know; she knows everything that moves in this forest." } },
  },
}

P:NPC {
  key = "kimlya", id = TODO_NPC("Innkeeper Kimlya"), name = "Innkeeper Kimlya",
  bible = "bibles/ashenvale.md", role = "innkeeper", tier = "service",
  communities = { "astranaar" }, temper = { "warm" }, values = { "kind" },
  notices = { "weary" },
  impression = {
    first = "Every night Innkeeper Kimlya sends broth up to a sick child, knowing the father will eat it if the girl won't. Astranaar's inn seems to run on that sort of quiet kindness.",
    third = "{name} rested at Innkeeper Kimlya's inn on Astranaar's island, a refuge for scouts, healers and weary travellers.",
  },

  greetings = {
    { id = "g_rest", text = "You look worn through, body and spirit both. Rest here a while, and may Elune keep your dreams gentle." },
    { id = "g_home", when = { homeInn = { "Astranaar" } }, text = "Your bed's ready, and the island's quiet tonight; the lake keeps the worst of the forest out." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Was it the furbolgs, or the Horde? Never mind; sit down, because whoever it was, they can't reach you in here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Kimlya, and I keep the inn for scouts, healers, travellers and the occasional lost adventurer. Most of them leave in better shape than they came." },
        { id = "h_relara", when = { heardLine = "pelturas.h_default" },
          text = "So Pelturas told you about Relara. I send broth up for her every night, and she doesn't eat it, but he does, and someone has to look after him." },
        { id = "h_sentinel", when = { metBefore = true }, text = "A Sentinel fell asleep at that table last night, sitting up with her spear still in her hand, and I didn't have the heart to wake her." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The lake's black as ink at night, and Astranaar's lanterns float on it. It's the prettiest thing in Ashenvale, and nobody stops to look." },
      },
      again = {
        { id = "h_again", text = "Anything else? Take your time; the fire's lit." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Who stays here?", next = "guests" },
        { text = "How is Relara?", next = "relara_k" },
        { text = "I can tend wounds. Do your scouts need a healer?", next = "healer_k", when = { class = { "PRIEST", "PALADIN", "DRUID" } } },
        { text = "It's a long way from Stormwind to here.", next = "far_k", when = { race = "Human" } },
        { text = "Just resting.", next = "END" },
      },
    },
    guests = {
      lines = { { id = "gu_default", text = "Raene's scouts, mostly, when they're back from the Thistlefur hills, and travellers waiting on the hippogryphs. The scouts pay their way in stories as often as in coin." } },
      choices = {
        { text = "Any stories worth hearing?", next = "story" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story = {
      lines = { { id = "st_default", text = "Only the worried kind, lately. The scouts say the Thistlefur grow bolder every month, and nobody laughs at the old jokes quite as much as they used to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    relara_k = {
      lines = { { id = "re_default", text = "Better some days and worse on others. Her father hardly sleeps, so I make sure he at least eats." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    healer_k = {
      lines = {
        { id = "hk_default", text = "Always, and more than I can manage with bandages and broth. Two of Raene's scouts are upstairs with Thistlefur claw marks that won't close cleanly, and they'd be glad of better hands than mine." },
        { id = "hk_priest", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
          text = "Your Light, in a Sentinel's sickroom? They'd be surprised, and glad, I think. Two of Raene's scouts are upstairs with Thistlefur claw marks that won't close cleanly." },
      },
      choices = {
        { text = "I'll see to them before I sleep.", next = "BACK", fx = { align = { light = 1 }, affinity = 2, standing = { astranaar = 1 } } },
        { text = "Scouts who get clawed should learn to dodge.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
      },
    },
    far_k = {
      lines = { { id = "fk_default", text = "So I hear, and you're the third human this month to tell me so. Delgren's paladins come through on their way to Maestra's Post, and they all ask for something they call mutton." } },
      choices = {
        { text = "Do you have any mutton?", next = "far_k2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    far_k2 = {
      lines = { { id = "fk2_default", text = "No, but I have venison and a good mushroom stew, and the paladins eat both and say grace over them. You may do the same, love, if it makes it taste more like home." } },
      choices = { { text = "Venison it is.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Scouts talk while I bandage them, and I remember more than they think. Ask me what you like." },
    },
    background = { { id = "tp_bg", text = "I keep the inn on the island. There's not much more to me than a warm bed and a full pot." } },
    advice = { { id = "tp_ad", text = "Sleep when you can and eat when you can, because Ashenvale gives you fewer chances than you'd think." } },
    _none = { { id = "tp_none", text = "Ask Raene, outside. She'll know, or she'll find out." } },
  },
}

P:NPC {
  key = "delgren", id = TODO_NPC("Delgren the Purifier"), name = "Delgren the Purifier",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "maestras_post" }, temper = { "earnest" }, values = { "devout", "brave" },
  spiritSensitive = true,
  notices = { "class" },
  impression = {
    first = "Delgren the Purifier greets everyone with the Light's blessing and a cheerful word, a long way from home and glad of company. He is earnest and warm, though I would not want to be a warlock standing near his hammer.",
    third = "{name} met Delgren the Purifier at Maestra's Post, a servant of the Light hunting the Dark Strand cult in Ashenvale.",
  },

  greetings = {
    { id = "g_light", text = "Light keep you, friend! Maestra's Post bids you welcome; it's a long way from home, but there's work for the righteous everywhere." },
    { id = "g_human", when = { race = "Human" }, text = "A human! You've no idea how good that is to see, this far into elf country." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Another servant of the Light, and a paladin at that! We'll trade stories later, but for now there's a cult to stop." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. I'll be honest: my hand wants my hammer, but I'll keep it still if you keep yours still too." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest of the Light, out here! Bless you; I've been teaching young Balthule what I know of it, and I could use someone who knows it better." },
  },

  start = "hello",
  nodes = {
    warlock_d = {
      big = true,
      lines = {
        { id = "wd_default", text = "I'd guessed what you were, friend, and I've been trying to decide whether to say it. If you can read what they read, you can tell me what they want, but the Light will be watching what you do with the knowing, and so will I." },
      },
      choices = {
        { text = "Read it and burn it. That's my offer.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "What I learn from their books is mine.", next = "BACK", fx = { align = { light = -1 }, affinity = -2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Delgren, called the Purifier. Our company came to help the night elves against demons and the walking dead, and instead we found a cult, the Dark Strand, nesting in the old tower to the north." },
        { id = "h_tower", tags = { "news" }, when = { questActive = TODO_QUEST("The Tower of Althalaxx") },
          text = "The Dark Strand gather at the Tower of Althalaxx to work their warlock's magic. Balthule keeps watch there and Feero carries word to Auberdine, and I'd be glad of your help with the rest." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Supplies to Auberdine") },
          text = "Feero is carrying supplies and messages to Sentinel Starbreeze in Auberdine. The elves there have been generous to us, and it's time we returned the favour." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Sky-elves, truly! I'd heard of you, and the Light shines in strange places these days, which is all the more reason to look for it." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The cult won't wait on us." },
        { id = "h_again2", text = "Go on, I'm listening. The Light's in no hurry, even when I am." },
      },
      choices = {
        { text = "Who are the Dark Strand?", next = "strand" },
        { text = "Why learn Orcish?", next = "orcish" },
        { text = "How do you find the night elves?", next = "elves_d" },
        { text = "I'm a paladin too. How can I help?", next = "pal_d", when = { class = "PALADIN" } },
        { text = "Would your company welcome a priest's blessing?", next = "priest_d", when = { class = "PRIEST" } },
        { text = "I know the Dark Strand's craft. I could read their tomes.", next = "warlock_d", when = { class = "WARLOCK" } },
        { text = "Light keep you.", next = "END", fx = { affinity = 1 } },
      },
    },
    strand = {
      big = true,
      lines = {
        { id = "s_default", text = "They're warlocks, hungry for power that should have stayed lost and willing to deal with demons to get it. I've seen what that bargain costs, but they haven't, yet." },
      },
      choices = {
        { text = "Then we stop them.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Power is power, and I can't blame them for wanting it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why do people join them?", next = "elves" },
      },
    },
    elves = {
      lines = { { id = "e_default", text = "Grief and pride make fools of every people, mine included. I don't judge anyone by their worst; I just stop it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcish = {
      lines = { { id = "o_default", text = "Many in my order scoffed when I chose to learn it, but understanding your enemy is half of beating him. Their writing's little better than a child's scribbles, mind you, though it served me well enough with the warlock Ilkrud's notes." } },
      choices = {
        { text = "Only to beat them?", next = "orcish2" },
        { text = "Wise.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    orcish2 = {
      lines = { { id = "o2_default", text = "For now, yes. If there's ever a day when it's good for more than that, I'll be glad I already know the words." } },
      choices = {
        { text = "I hope that day comes.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'd rather learn it to hear what they're plotting before they strike.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    elves_d = {
      lines = { { id = "ed_default", text = "I was unused to their manners at first, I'll admit, but I've grown to respect them greatly as allies. They fight this forest's battles with more patience than we would ever have." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    pal_d = {
      lines = { { id = "pd_default", text = "Then pray with me before you go into the satyrs' country, because their blood-soaked temples unsettle even seasoned fighters. After that, swing hard." } },
      choices = {
        { text = "Let's pray, then.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Save the prayers. I'll trust my hammer in satyr country.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    priest_d = {
      lines = { { id = "pq_default", text = "We'd be grateful for it. It's been months since anyone but me prayed over these lads, and I'm a better hammer than a priest." } },
      choices = {
        { text = "Then gather them round.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, standing = { maestras_post = 1 } } },
        { text = "These lads need sleep more than sermons, so I'll let them rest.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A paladin in a strange land learns to listen, friend, and I've learned a fair bit here. Ask, and I'll share it." },
    },
    background = { { id = "tp_bg", text = "I'm a paladin a long way from home, with a company that came to help our allies. That's all there is that matters." } },
    advice = { { id = "tp_ad", text = "If you meet a warlock in these woods, assume he isn't alone." } },
    dark_strand = {
      { id = "tp_strandnext", text = "The cult at the Tower of Althalaxx. Ask, and I'll tell you what I know.", next = "strand" },
      { id = "tp_strand", text = "Warlocks who think demons will keep their bargains. They're always wrong about that." },
    },
    _none = { { id = "tp_none", text = "I don't know, friend, but I'll pray on it, and that's a start." } },
  },
}
