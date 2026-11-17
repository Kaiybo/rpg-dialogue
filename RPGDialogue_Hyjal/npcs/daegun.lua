-- Yashiro, the orc blademaster burning the demons out of Dae'gun. Voice: bibles/hyjal.md
local P = RPGDialogueAPI:Pack("rpgd.hyjal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hyj_yashiro", id = TODO_NPC("Yashiro"), name = "Yashiro", title = "Blademaster",
  bible = "bibles/hyjal.md", role = "questgiver", tier = "major",
  communities = { "hyjal" }, temper = { "proud", "steady" }, values = { "brave", "stern", "loyal" },
  notices = { "class", "race", "kit" },

  impression = {
    first = "Yashiro is an orc blademaster who speaks quietly and means every word of it. He is hunting the demons in Dae'gun with a patience that looks a great deal like grief.",
    third = "{name} met Yashiro, a solitary orc blademaster waging his own war on the demons who still hide on Mount Hyjal.",
  },

  greetings = {
    { id = "g_default", text = "Stand still a moment and let the wind tell me who you are." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. The mountain has not finished testing you, then." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Lok'tar. It is good to see the Horde's colours this far from home." },
    { id = "g_after", when = { questDone = TODO_QUEST("Yashiro's Windwalk") }, text = "Blade-friend. Sit by my fire whenever you pass; you have earned the warmth." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You carry your weapon like it is part of your arm. That is the beginning of the path, though only the beginning." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You move without sound. Good; a blademaster learns that the wind is quiet before it cuts." },
    { id = "n_warlock", cat = "class", place = "before", when = { class = "WARLOCK" },
      text = "Fel clings to you like ash to a burned hut. My people drank that poison once, and we are still paying for the cup." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Brother of the blood, up here among the trees. Our people fought on these slopes, and the mountain has not forgotten it." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A kaldorei, and you have not drawn on me. That is a better start than most of our meetings in Ashenvale." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armour is cut to ribbons. A blade is only as good as the warrior it is guarding, so mend it before Dae'gun." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "I hear the grass bending under you. Come out, and speak like a warrior." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Yashiro, a blademaster, and I have come to finish a war that ended too soon. The demons who fled when Archimonde fell are still on this mountain, hiding in Dae'gun, and I mean to show them that hiding was a mistake." },
        { id = "h_bonfire", tags = { "news" }, when = { questActive = TODO_QUEST("Blademaster's Bonfires") },
          text = "Light the fires and stand ready. Demons cannot abide a challenge left unanswered, and every flame is a challenge." },
        { id = "h_windwalk", tags = { "news" }, when = { questActive = TODO_QUEST("Yashiro's Windwalk") },
          text = "The fires are lit and the warlord will come looking for whoever dared light them. Stay at my shoulder, and we will meet him together." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Yashiro's Windwalk"), days = 3 } },
          text = "Xarkul is dead, and Dae'gun is quieter than it has been since the battle. I have not slept so well in years, and I owe some of that sleep to you." },
        { id = "h_human", when = { race = "Human", faction = "Alliance" },
          text = "A human. Your sorceress and our Warchief stood together on this mountain, and I have not forgotten it, even if Ashenvale has." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Light. Good; a blade needs someone at its back who keeps it swinging, and I have never been too proud to be kept alive." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Shu'halo, so far from the plains. Your people stood with ours against the Legion too, and the Earth Mother must be glad to see you tending her mountain." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A Darkspear, up here in the cold. I have heard there is a camp of your people on the slopes who cannot get free of the fighting; perhaps you came to help them." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid. Your kind tends the mountain and mine cleans it, and I think we will get along, if you do not lecture me about the fires." },
      },
      again = {
        { id = "h_again", text = "Ask what you need. I am listening." },
        { id = "h_again2", text = "There is more you want to know. Speak plainly; I prefer it." },
      },
      choices = {
        { text = "Why do you hunt these demons?", next = "why" },
        { text = "What are the bonfires for?", next = "bonfires" },
        { text = "What is Dae'gun?", next = "daegun" },
        { text = "What does a blademaster do?", next = "path" },
        { text = "Tell me about the spirit bead you offered.", next = "bead", when = { questDone = TODO_QUEST("Yashiro's Windwalk") } },
        { text = "Our peoples fought together here, didn't they?", next = "xally", when = { faction = "Alliance" } },
        { text = "I heal, but I'll stand behind you.", next = "xhealer", when = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" } } },
        { text = "Teach me to walk like the wind.", next = "xblade", when = { class = { "WARRIOR", "ROGUE" } } },
        { text = "Do you hate those who bargain with demons?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why fight alone, brother?", next = "xorc", when = { race = "Orc" } },
        { text = "May the wind guide your blade.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "w_default", text = "Because the Legion made my people its slaves, and on this mountain we finally stood against it. We won, but the ones who ran were never hunted down, and a war that leaves its enemy breathing is not over, only resting." },
      },
      choices = {
        { text = "Is this vengeance, or duty?", next = "why_vengeance" },
        { text = "What happened to you here?", tag = "Persuade", next = "why_secret",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Orc" }, { questDone = TODO_QUEST("Yashiro's Windwalk") } } } },
          fail = { next = "why_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_vengeance = {
      big = true,
      lines = {
        { id = "wv_default", text = "Vengeance, I think, though I tell myself it is duty on the days I want to sleep. The demons will come seeking dominance when they see my fires, and they will find vengeance waiting instead, and I will not pretend to be sorry." },
      },
      choices = {
        { text = "Vengeance keeps the blade sharp. Use it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Fight for the living, not the dead.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_secret = {
      lines = {
        { id = "ws_default", text = "I stood in the line below the summit with my brothers of the blade, and when the wisps came, we were told to fall back and let the night elves finish it. Three of my brothers did not hear the order in time, and I have carried their names up this mountain every year since." },
      },
      choices = {
        { text = "They'd be proud of what you're doing.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_no = {
      lines = {
        { id = "wn_default", text = "That is mine to carry, not yours to ask about. Fight beside me first, and perhaps one night by the fire I will tell you." },
      },
      choices = { { text = "I understand.", next = "BACK" } },
    },

    bonfires = {
      lines = {
        { id = "bf_default", text = "Fire is a challenge the demons understand. A doomguard who sees flames on his ground thinks someone has come to take it, and he comes out of hiding to prove otherwise, and then I am waiting for him." },
        { id = "bf_done", when = { questDone = TODO_QUEST("Blademaster's Bonfires") }, text = "You lit them well. I watched the smoke from the ridge, and I watched the demons stir under it like ants under a kicked hill." },
      },
      choices = {
        { text = "Won't the fires hurt the forest?", next = "bonfires_forest" },
        { text = "And when the warlord comes?", next = "windwalk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bonfires_forest = {
      big = true,
      lines = {
        { id = "bff_default", text = "A little, yes, and the druids frown at me for it. But a burned clearing grows back in a season, and a demon left alone poisons the ground for a hundred years, so I will take the frowns." },
      },
      choices = {
        { text = "A small wound to heal a greater one. Agreed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Ask the druids first. It's their mountain.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    windwalk = {
      lines = {
        { id = "ww_default", text = "Then we walk the wind. A blademaster moves where the eye cannot follow and strikes where the enemy is not looking, and this is the moment when the will of the mountain speaks through us." },
        { id = "ww_done", when = { questDone = TODO_QUEST("Yashiro's Windwalk") }, text = "You walked it with me, and you saw how Xarkul fell. A warlord who has ruled by fear does not know what to do when the wind does not fear him back." },
      },
      choices = {
        { text = "Who is the warlord?", next = "xarkul" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xarkul = {
      lines = {
        { id = "xk_default", text = "A doomguard named Xarkul, who has made Dae'gun his kingdom since the battle. The lesser demons answer to him, and when he falls, they will scatter like crows." },
        { id = "xk_dead", when = { questDone = TODO_QUEST("Yashiro's Windwalk") }, text = "Xarkul was a doomguard who made Dae'gun his kingdom, and now he is a carcass that Marrosis would probably refuse to eat. The lesser ones are scattering, and I will hunt them as they go." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    daegun = {
      lines = {
        { id = "dg_default", text = "Dae'gun is the slope to the north and east, where the Horde made its camp when the Legion marched up this mountain. The demons have taken it for their own since then, which is an insult I do not intend to let stand." },
      },
      choices = {
        { text = "The Horde camped there?", next = "daegun_camp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    daegun_camp = {
      big = true,
      lines = {
        { id = "dc_default", text = "Thrall brought us across the sea and up this mountain to stand with the humans and the night elves, enemies who had every reason to want us dead. We held our ground until the end, and now demons sleep where our warriors slept, and that is why I light the fires there first." },
      },
      choices = {
        { text = "That alliance should have lasted.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Alliances of need end when the need does.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    path = {
      lines = {
        { id = "pa_default", text = "A blademaster gives his life to the sword the way a shaman gives his to the spirits. We learn to move like wind and to cut like it, and we learn that the blade is only a part of it; the rest is stillness." },
      },
      choices = {
        { text = "Stillness?", next = "path_still" },
        { text = "Something else.", next = "BACK" },
      },
    },
    path_still = {
      big = true,
      lines = {
        { id = "ps_default", text = "A warrior who rages swings wide and dies tired. A blademaster waits until the enemy has shown him everything, and then he ends it in one stroke, and the stroke is the easy part; the waiting is the discipline." },
      },
      choices = {
        { text = "Patience is the harder strength.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather strike first and keep striking.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bead = {
      lines = {
        { id = "be_default", text = "That bead was given to me by an old shaman when I first took up the blade, and I have worn it into every fight since. I offered it to you because a warrior who walks the wind beside me deserves to carry some of its luck." },
      },
      choices = { { text = "I'll carry it with honor.", next = "BACK", fx = { affinity = 1 } } },
    },

    xally = {
      big = true,
      lines = {
        { id = "xa_default", text = "We did. Your sorceress brought her people over the sea, and Thrall brought ours, and the night elves held the summit while we held the slopes. Now your people and mine kill each other in Ashenvale over firewood, and I wonder sometimes what the dead would make of it." },
      },
      choices = {
        { text = "I'd fight beside the Horde again, gladly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hyjal was one battle. Ashenvale is the war.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhealer = {
      big = true,
      lines = {
        { id = "xh_default", text = "Then I will gladly have you there. I used to scorn healers when I was young and stupid, and then a shaman closed a wound in my side that I had decided to die of, and I have not scorned one since." },
        { id = "xh_priest", when = { class = "PRIEST" }, text = "A priest at my back, in Dae'gun. My grandfather would choke on his grog, but my grandfather never fought a doomguard, and I will take any light that keeps me standing." },
      },
      choices = {
        { text = "Mend first. Glory can wait.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll keep you standing, and the demons won't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xblade = {
      big = true,
      lines = {
        { id = "xb_default", text = "I cannot teach you in a day what took me twenty years, but I can tell you where to start. Stop watching the blade in your enemy's hand and watch his feet instead, because the feet always tell you where the blade will be." },
      },
      choices = {
        { text = "I'll learn it the patient way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I learn faster by fighting. Point me at a demon.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "I do not hate you, warlock, though I watch you. My people learned what demons give and what they take in return, and I hope you are wiser than we were, because we were not wise at all." },
      },
      choices = {
        { text = "I command them. They never command me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I know the price. I'll pay it carefully.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      big = true,
      lines = {
        { id = "xo_default", text = "Because Orgrimmar has its own wars, and I could not ask anyone to carry my debts up a mountain. Hellscream broke the blood-curse with his own life, and I think every one of us owes the Legion something for that." },
      },
      choices = {
        { text = "Then I'll stand with you. That's the Horde.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Debts are personal. Pay yours alone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know blades and demons and the slopes between here and Dae'gun. Ask about those, and I will answer honestly." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "Ask, if you must. I will decide if the question deserves an answer." },
    },
    background = { { id = "tp_bg", text = "I was born in the camps, freed by Thrall, and taught the blade by an old master who never told me his true name. That is all of my story worth telling." } },
    advice = { { id = "tp_ad", text = "In Dae'gun, never fight with your back to the open ground. Doomguard come from the sky." } },
    burning_legion = { { id = "tp_bl", text = "They enslaved my people and broke this mountain. I need no other reason." } },
    malfurion = { { id = "tp_malf", text = "The night elves' shaman, whose horn called the wisps. I never saw him, only the light at the summit, and I have never seen anything like it since." } },
    _none = { { id = "tp_none", text = "I know nothing of that. Ask someone who spends less time with a sword in hand." } },
  },
}
