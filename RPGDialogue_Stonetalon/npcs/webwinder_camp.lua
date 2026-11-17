-- The little Alliance camp above Windshear Crag: Gaxim Rustfizzle, gnome mage of the EAAAES, and
-- Kaela Shadowspear, the Sentinel sent with him (0.72.0). Voice: bibles/webwinder_camp.md
-- Classic: On Guard in Stonetalon, A Gnome's Respite, An Old Colleague, Covert Ops - Alpha/Beta (Gaxim);
-- Enraged Spirits, Wounded Ancients, Kaela's Update (Kaela).
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gaxim", id = TODO_NPC("Gaxim Rustfizzle"), name = "Gaxim Rustfizzle",
  bible = "bibles/webwinder_camp.md", role = "questgiver", tier = "quest",
  communities = { "webwinder_camp" }, temper = { "excitable", "talkative" }, values = { "invention", "ambitious" },
  notices = { "race", "craft" },
  impression = {
    first = "Gaxim Rustfizzle means to save the night elves' forests with magic, mixtures and mechanisms, chiefly high explosives. He swears they're not as dangerous as everyone thinks, which is the most frightening thing anyone has said to me.",
    third = "{name} met Gaxim Rustfizzle, a gnome mage of the Enlightened Assembly camped above Windshear Crag with a plan to blow up the Venture Company.",
  },

  greetings = {
    { id = "g_hello", text = "Oh, good, a visitor! Don't touch the crate with the red stripe. Or the blue one, actually." },
    { id = "g_respite", when = { questActive = TODO_QUEST("A Gnome's Respite") }, text = "Loggers and deforesters in the Crag, ten of each! Every one you stop buys me an hour at the workbench." },
    { id = "g_lomac", when = { questActive = TODO_QUEST("An Old Colleague") }, text = "Lomac's in Tinker Town, in Ironforge. Be charming! He hates charming, but try anyway." },
    { id = "g_alpha", when = { questActive = TODO_QUEST("Covert Ops - Alpha") }, text = "The plans, the plans, the plans! The explosions are a lovely bonus, but it's the plans we need." },
    { id = "g_done", when = { questDone = TODO_QUEST("Covert Ops - Alpha") }, text = "I've been reading the Venture Company's own engineering plans every night since you brought them. Shoddy welding, all of it! I'm thrilled." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}! I've built two things and blown up one of them, so you've not missed much." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You look sturdier than when you first ran errands for me! Sturdier is good, in my line of work." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, out here among all these trees! Are you EAAAES? If not, you should be; we have excellent biscuits at the meetings." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! Lomac will like you, or at least he'll dislike you less, which for him is the same thing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gaxim Rustfizzle, of the Enlightened Assembly of Arcanology, Alchemy and Engineering Sciences! It's my duty to show the night elves that a blend of magic, mixtures and mechanisms can help save their forests." },
        { id = "h_arrive", tags = { "news" }, when = { questActive = TODO_QUEST("On Guard in Stonetalon") },
          text = "Someone from Ashenvale, come to check on us? Kaela will be thrilled, and I'm thrilled too, because I need a pair of hands that isn't holding a bow." },
        { id = "h_respite_before", when = { questBefore = TODO_QUEST("A Gnome's Respite") },
          text = "It's a hard-fought war out here, and the goblins breed like rabbits, I swear it. I haven't even had time to build my newest inventions, so I need someone to keep them busy in Windshear Crag." },
        { id = "h_respite_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Gnome's Respite"), days = 3 } },
          text = "You're back just in time, because I've got the perfect plan, and it involves explosives. No, the explosives aren't the plan, they're only part of it, but they're my favourite part." },
        { id = "h_ng5", when = { questActive = TODO_QUEST("Ineptitude + Chemicals = Fun") },
          text = "Lomac wants potions before he'll make the NG-5? Of course he does. Bring him what he asks for, and try not to stand too close while he mixes it." },
        { id = "h_alpha_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Covert Ops - Alpha"), days = 3 } },
          text = "Truly amazing! A huge blow to the Venture Company, and we'll learn every weakness in their machines from their own drawings." },
        { id = "h_young", when = { maxLevel = 18 },
          text = "You're a bit new to be out here, aren't you? The Crag's full of goblins with axes, so come back when you're a little more explosion-proof." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk and calibrate at the same time, mostly, with about a seven percent margin for error." },
        { id = "h_again2", text = "Go on, go on! Questions are good for the brain, and the brain is good for detonators." },
      },
      choices = {
        { text = "What is the Enlightened Assembly?", next = "eaaaes" },
        { text = "Explosives? In a forest?", next = "boom" },
        { text = "I've never heard of Lomac Gearstrip.", next = "lomac" },
        { text = "How do you and Kaela get along?", next = "kaela_g" },
        { text = "Show me what you're building.", next = "eng_gx", when = { any = { { profession = "Engineering" }, { race = "Gnome" } } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Good luck, Gaxim.", next = "END" },
      },
    },

    eaaaes = {
      lines = {
        { id = "ea_default", text = "A society of the finest minds who refuse to choose between the arcane, the alchemical and the mechanical. Most gnomes pick one, which is fine, I suppose, if you like being bored." },
      },
      choices = {
        { text = "And the night elves? Do they like you?", next = "eaaaes_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eaaaes_elves = {
      lines = {
        { id = "ee_default", text = "They're suspicious of everything with a gear in it, which is fair, because the goblins have given gears a terrible name round here. That's why I'm here: to show them a gear can be a friend." },
      },
      choices = {
        { text = "Can it, though?", next = "eaaaes_friend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eaaaes_friend = {
      big = true,
      lines = {
        { id = "ef_default", text = "Of course it can! A shredder cuts a forest down; a better machine could plant one, or put out a fire, or knock a goblin into a lake. It's all in who's holding the wrench." },
      },
      choices = {
        { text = "The forest should be left to the druids.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If machines can help, use every one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    boom = {
      big = true,
      lines = {
        { id = "bo_default", text = "Carefully placed! Along the mountains' edges, I can herd the goblins back with a few key detonations, and the trees don't mind as long as I aim at the cliffs. Don't worry, they're not as dangerous as everyone thinks." },
      },
      choices = {
        { text = "Blow them all off the mountain.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Scare them off, but don't kill if you can help it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "How dangerous are they, exactly?", next = "boom_how" },
      },
    },
    boom_how = {
      lines = {
        { id = "bh_default", text = "Well, I've still got all my fingers, and most of my eyebrows. That's a better record than anyone else in the Assembly, I'll have you know." },
      },
      choices = {
        { text = "That is not reassuring.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lomac = {
      lines = {
        { id = "lo_default", text = "An old friend in Tinker Town, and the only person alive who can make Nitromirglyceronium, which we call NG-5 because nobody can say it twice. He's grumpy and suspicious and brilliant, and he'll accuse you of lying the moment you mention my name." },
      },
      choices = {
        { text = "Why would he think I'm lying?", next = "lomac_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lomac_why = {
      lines = {
        { id = "lw_default", text = "Because I owe him money, a little, and a workbench, a slightly larger amount. Don't mention the workbench, actually." },
      },
      choices = {
        { text = "My lips are sealed.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Goodbye, Gaxim.", next = "END" },
      },
    },

    kaela_g = {
      lines = {
        { id = "kg_default", text = "Splendidly! She thinks I'm going to blow us both up, and I think she's too gloomy about the trees, and we're both a little right. She's the bravest person I know, and I'd never tell her that, so you mustn't either." },
      },
      choices = {
        { text = "I won't say a word.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eng_gx = {
      lines = {
        { id = "eg_default", text = "A detonator with a timer, so I can be somewhere else when it goes off. It's revolutionary, honestly; you'd be amazed how few designs bother with that part." },
      },
      choices = {
        { text = "Very sensible, Gaxim.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Mage, alchemist, engineer and Assembly member in good standing! Mostly good standing. There was an incident with a teapot." } },
    advice = { { id = "tp_ad", text = "Always label your crates, every one of them, and don't ask me why; just do it." } },
    venture_company = { { id = "tp_venture", text = "Greedy, wasteful and terrible engineers, and that last one offends me most of all." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "I'd rather not talk about Gnomeregan, if it's all the same to you. That's why I'm out here saving somebody else's home." } },
    _none = { { id = "tp_none", text = "No idea! But give me a week and a workbench, and I'll have an opinion." } },
  },
}

P:NPC {
  key = "kaela", id = TODO_NPC("Kaela Shadowspear"), name = "Kaela Shadowspear",
  bible = "bibles/webwinder_camp.md", role = "soldier", tier = "quest",
  communities = { "webwinder_camp" }, temper = { "melancholy", "steady" }, values = { "nature", "loyal" },
  notices = { "form", "class" },
  impression = {
    first = "Kaela Shadowspear almost wept the first time she saw the Charred Vale, and she still hasn't quite stopped. She misses Ashenvale and her friends there, and she stays here because somebody has to.",
    third = "{name} met Kaela Shadowspear, a Sentinel sent from Ashenvale to watch over Stonetalon and the gnome mage who came with her.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah, {class}. Watch the valley with me a moment, if you've time, beneath Elune's patient eye." },
    { id = "g_embers", when = { questActive = TODO_QUEST("Enraged Spirits") }, text = "The fire elementals of the Charred Vale, and their smoldering embers. Bring them to me, and the Vale may breathe again." },
    { id = "g_ancients", when = { questActive = TODO_QUEST("Wounded Ancients") }, text = "Shrapnel from a wounded treant, {class}. Gaxim thinks the goblins' weapons poisoned them, and I'd like to know if he's right." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}. Did you pass through Ashenvale? Tell me the trees there are still green." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you first came up this path from Ashenvale. Thenysil would be proud of who she sent me." },
  },

  notice = {
    { id = "n_druid", cat = "form", when = { form = { "tree", "bear", "cat" } },
      text = "A druid of the Circle, in Stonetalon! If you see the treants of the Vale, speak to them gently, because they've forgotten what kindness looks like." },
    { id = "n_nelf", cat = "class", when = { race = "NightElf", class = { "HUNTER", "WARRIOR" } },
      text = "Kaldorei, and armed for the road. You remind me of Astranaar, {g:brother|sister}, and I'm glad of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kaela Shadowspear of the Sentinels. I was sent here to learn what's happening to the land, and to keep watch over the Venture Company, and over Gaxim, which is the harder of the two." },
        { id = "h_arrive", tags = { "news" }, when = { questActive = TODO_QUEST("On Guard in Stonetalon") },
          text = "You've come from Ashenvale, sent by my friend in Astranaar? How I miss her, and my homeland. It is a pleasure to meet you, {class}." },
        { id = "h_embers_before", when = { questBefore = TODO_QUEST("Enraged Spirits"), minLevel = 20 },
          text = "The Venture Company set the Charred Vale aflame, and in their ignorance they woke something: elementals of flame and stone and rage. The land has no chance to see Elune's smile while they roam free." },
        { id = "h_embers_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Enraged Spirits"), days = 3 } },
          text = "The remains of our enemy. Your strength serves us well, {class}, and thank you." },
        { id = "h_ancients_before", when = { questBefore = TODO_QUEST("Wounded Ancients"), questDone = TODO_QUEST("Enraged Spirits") },
          text = "The treants of the Vale must have helped drive the goblins back, but now even they have turned. Gaxim thinks it's the goblins' weapons, and I've told him I'll fetch him a sample from a wounded one." },
        { id = "h_ancients_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Wounded Ancients"), days = 3 } },
          text = "This should be more than enough for Gaxim to learn how the treants were corrupted. I'll take it to him now, and pray the answer is something we can mend." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? The valley's quiet for now, though the smoke still hangs where the old trees stood." },
        { id = "h_again2", text = "Go on. I'll keep one eye on the Crag while we talk." },
      },
      choices = {
        { text = "What happened to the Charred Vale?", next = "vale" },
        { text = "You miss Ashenvale.", next = "home" },
        { text = "You seem unsure of Gaxim.", next = "gaxim_k" },
        { text = "Why are the treants corrupted?", next = "treants", when = { any = { { questActive = TODO_QUEST("Wounded Ancients") }, { questDone = TODO_QUEST("Enraged Spirits") } } } },
        { text = "I know Thenysil in Astranaar.", next = "thenysil", when = { questDone = TODO_QUEST("On Guard in Stonetalon") } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Elune keep you, Kaela.", next = "END" },
      },
    },

    vale = {
      lines = {
        { id = "va_default", text = "The goblins came for the trees and found more than they bargained for, and when the Vale fought back, they burned it. The first time I saw it, {class}, I almost wept." },
      },
      choices = {
        { text = "It might heal, in time.", next = "vale_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vale_heal = {
      lines = {
        { id = "vh_default", text = "In time, if the fire spirits are put down and the goblins kept out. The druids at Stonetalon Peak say the ash makes good soil, which is a hard sort of comfort." },
      },
      choices = {
        { text = "Then we start with the fire spirits.", next = "vale_spirits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vale_spirits = {
      big = true,
      lines = {
        { id = "vs_default", text = "Yes, though they're only doing what fire does, and the goblins are the ones who set it loose. Sometimes I'd rather hunt the men with the torches than the flames." },
      },
      choices = {
        { text = "Then hunt the goblins too. They earned it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Mend the land first. Vengeance can wait.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    home = {
      lines = {
        { id = "ho_default", text = "Every day, because Ashenvale is green and quiet in the mornings, and here the mornings smell of smoke and goblin oil. But Sentinel Wolfrunner asked, and I came." },
      },
      choices = {
        { text = "That's loyalty.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gaxim_k = {
      big = true,
      lines = {
        { id = "gk_default", text = "I'm sure he'll blow us both off this mountain one day, and that he means well with every bit of him. I was angry when the Alliance sent a gnome mage with me, but he's cared for these trees as hard as any druid." },
      },
      choices = {
        { text = "His way works. Let him blast the goblins out.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "You should keep him on a short leash.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    treants = {
      lines = {
        { id = "tr_default", text = "Gaxim thinks it's the goblins' shrapnel, buried in their bark and rotting them from the inside. If he's right, every blade the goblins left behind is still killing the forest." },
      },
      choices = {
        { text = "Then I'll bring you a sample.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thenysil = {
      lines = {
        { id = "th_default", text = "Then you know she worries too much and laughs too little, and that she's the best friend I have. Tell her I'm well, and that the gnome hasn't blown me up yet." },
      },
      choices = {
        { text = "I'll tell her.", next = "BACK", fx = { affinity = 2 } },
        { text = "Goodbye, Kaela.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Sentinel of Ashenvale, posted far from home. That's all there is, {class}, and it's enough." } },
    advice = { { id = "tp_ad", text = "Stay off the Crag's lower roads after dark. The goblins post guards there, and they shoot at anything that moves." } },
    venture_company = { { id = "tp_venture", text = "They take what they want and burn what they don't, and they call it business." } },
    sentinels = { { id = "tp_sentinels", text = "We're spread thin from here to Feralas, and still we hold. Don't ask me how." } },
    _none = { { id = "tp_none", text = "I couldn't say. Gaxim might know; he knows a little about everything, and too much about explosives, which a Sentinel tries very hard not to hold against him." } },
  },
}
