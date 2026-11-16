-- Refuge Pointe (Alliance): Skuerto, Apprentice Kryten, Cedrik Prose, Vikki Lonsav. Voice: bibles/arathi.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "skuerto", id = TODO_NPC("Skuerto"), name = "Skuerto",
  bible = "bibles/arathi.md", role = "questgiver", tier = "quest",
  communities = { "refuge_pointe" }, temper = { "prickly" }, values = { "proud", "practical" },
  notices = { "race", "class" },

  impression = {
    first = "Skuerto is a dwarf scout working for Archmage Malin, and he was rude to me before I'd finished saying hello. He apologized later, which I gather is rare.",
    third = "{name} met Skuerto, a touchy dwarf scout at Refuge Pointe recovering Archmage Trelane's artifacts for Archmage Malin.",
  },

  greetings = {
    { id = "g_default", text = "Aye, what? I'm busy, an' if Malin sent ye, ye can still wait yer turn." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. I was rough wi' ye last time, an' I'll own it, so let's start again." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' mine, from the mountain! Good, then ye'll know a proper scout when ye see one, which is more than these humans do." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, is it? Then ye'll be more use to Kryten than to me, but stick around, for Trelane's things need someone who knows which end o' a wand to point." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Mages o' old Arathor, so Kryten tells me, an' they did it tae guard somethin' best left buried. Now the Syndicate an' the ogres go pokin' at the stones, an' the bindin's are frayin'." } },
      choices = {
        { text = "Then the bindings must hold, whatever they guard.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Spirits shouldn't be chained, whoever forged the chains.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A night elf druid! Ye'll be wantin' a look at the old stone circles in the hills, I expect, though I'll warn ye the things bound in them havenae taken kindly tae visitors." },
        { id = "h_default", key = true,
          text = "Skuerto. Archmage Malin sent me an' the lad Kryten up here tae recover what his old master Trelane left behind when Stromgarde fell. I do the scoutin', Kryten does the readin', an' neither of us gets enough sleep." },
        { id = "h_malin", tags = { "news" }, when = { questRecent = { TODO_QUEST("Malin's Request"), days = 2 } },
          text = "Malin's letter, is it? Grand, but I'm in the middle o' somethin', so go an' bother Kryten, an' I'll come find ye when I'm done." },
        { id = "h_wand", when = { questActive = TODO_QUEST("Wand over Fist") },
          text = "Kor'gresh has Trelane's wand in Boulderfist Hall, south an' then east o' Thandol Span. He's been throwin' ice at his own kin wi' it, so he's close tae workin' the whole thing out." },
        { id = "h_defenses", when = { questActive = TODO_QUEST("Trelane's Defenses") },
          text = "The Boulderfist shaman took the tower's gems, an' we need one tae wake its defenses. Get one o' those agates tae Kryten, an' he'll turn it into a key." },
        { id = "h_tower", tags = { "news" }, when = { questActive = TODO_QUEST("Attack on the Tower") },
          text = "Phylactery, orb an' the ember agate, all in chests in the Tower of Arathor. The defenses'll help, but they'll no' do the fightin' for ye, so keep yer weapon out." },
        { id = "h_tower_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Attack on the Tower"), days = 3 } },
          text = "Every piece on my list, in one bag, an' nobody dead. I've scouted for a lot o' wizards, an' that's never happened before." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, I've maps tae draw." },
        { id = "h_again2", text = "Still here? Go on, then." },
      },
      choices = {
        { text = "Who bound the elementals in those stone circles?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who was Trelane?", next = "trelane" },
        { text = "What's in the tower?", next = "tower" },
        { text = "Why are you so prickly?", next = "prickly" },
        { text = "Where did you learn to scout?", next = "scouting" },
        { text = "I'd scout quieter than you, dwarf.", next = "rogue", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "I could carry word to Malin in Stormwind.", next = "priest", when = { race = "Human" } },
        { text = "Off I go.", next = "END" },
      },
    },
    trelane = {
      lines = { { id = "t_default", text = "Malin's old master, an archmage o' Stromgarde. When the city came under siege he held the Tower of Arathor as long as he could, an' it wasnae long enough." } },
      choices = {
        { text = "What did he leave behind?", next = "tower" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tower = {
      big = true,
      lines = { { id = "to_default", text = "A wand, a phylactery, an orb an' an ember agate, an' the Boulderfist have their hands on most of it. Ogres wi' an archmage's toys is a thing nobody wants, least of all the ogres' neighbours." } },
      choices = {
        { text = "What does Malin want with them?", next = "tower_malin" },
        { text = "Better in Malin's hands than an ogre's.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Better smashed. No one should have that kind of power.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    tower_malin = {
      lines = { { id = "tm_default", text = "He says study, an' safekeepin'. I'm a scout, no' a philosopher; I find things, I bring them back, an' I try no' tae wonder what wizards do wi' them at night." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    prickly = {
      lines = { { id = "p_default", text = "Because every human in this camp thinks a dwarf's only good for diggin', an' every one o' them asks if I've scouted the tower yet. I'll scout it when it's ready tae be scouted." } },
      choices = {
        { text = "Fair. Your scouting's been sound.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouting = {
      lines = { { id = "sc_default", text = "In the hills round Ironforge, as a lad, trackin' troggs an' worse. A good scout comes home, an' I've come home every time, whatever Kryten says." } },
      choices = {
        { text = "What does Kryten say?", next = "scouting_kryten" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouting_kryten = {
      lines = { { id = "sk_default", text = "That I'm 'in the middle o' somethin'' an' that I 'mean well'. The lad's polite about me tae strangers, which is worse than if he just complained." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    rogue = {
      lines = { { id = "r_default", text = "Quieter, maybe; better, no. But aye, if ye can get past the ogres at the tower door wi'out wakin' them, I'll buy ye an ale an' say it in front o' Kryten." } },
      choices = { { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = { { id = "pr_default", text = "Would ye? Then put in a word wi' him for me, for I've no' had a letter in a month, an' I'm runnin' out o' patience along wi' everythin' else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the Highlands an' where the ogres sleep. Ask about those." } },
    background = { { id = "tp_bg", text = "A scout from Ironforge, workin' for a Stormwind wizard on a Stromgarde problem. Makes sense if ye don't think about it.", next = "scouting" } },
    advice = { { id = "tp_ad", text = "Never walk into Stromgarde wi'out knowin' how ye'll walk out. I always know." } },
    _none = { { id = "tp_none", text = "No idea, an' I'm busy. Ask the lad." } },
  },
}

P:NPC {
  key = "kryten", id = TODO_NPC("Apprentice Kryten"), name = "Apprentice Kryten",
  bible = "bibles/arathi.md", role = "scholar", tier = "quest",
  communities = { "refuge_pointe" }, temper = { "earnest" }, values = { "curious", "polite" },
  notices = { "class", "race" },

  impression = {
    first = "Apprentice Kryten is Archmage Malin's polite young apprentice, keeping notes in a journal while his dwarf companion scouts. He apologized for Skuerto before I'd even met him.",
    third = "{name} met Apprentice Kryten, Archmage Malin's apprentice at Refuge Pointe, who studies Witherbark reagents and enchants Trelane's keys.",
  },

  greetings = {
    { id = "g_default", text = "Oh, hello! If Skuerto barked at you on the way in, I do apologize; he's in the middle of something, as usual." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, good, you're back! I've filled three more pages since you left." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Another student of the arcane! Were you trained in Stormwind? Perhaps you know my master, Archmage Malin." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! I'd love to hear how your people would enchant an agate, if you've a moment; mine is, well, rather by the book." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Is it true your magic draws nothing from the arcane at all? Archmage Malin says all power comes from somewhere, and I can't decide whether yours comes from the trees or from you." } },
      choices = {
        { text = "Magic should be studied and governed, as yours is.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Nature isn't something to be studied from a tower.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "Oh, a druid, and from Darnassus, I'd guess! I have a hundred questions about how your magic differs from ours, though Skuerto says I ask too many." },
        { id = "h_default", key = true,
          text = "Apprentice Kryten, in Archmage Malin's service. While Skuerto scouts the tower, I study what I can, and frankly the Witherbark have more to teach a young enchanter than you'd think." },
        { id = "h_gold", when = { questActive = TODO_QUEST("Worth Its Weight in Gold") },
          text = "Tusks from any Witherbark, medicine pouches from their witch doctors, and the knife a shadow hunter carries after his rites. That last one you'll only find by fighting them, I'm afraid." },
        { id = "h_gold_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Worth Its Weight in Gold"), days = 3 } },
          text = "I've been up all night with the pouches, and some of those herbs aren't in any book in Stormwind. Malin will be delighted, and slightly jealous." },
        { id = "h_enchant", tags = { "news" }, when = { questActive = TODO_QUEST("An Apprentice's Enchantment") },
          text = "The agate's enchanted, and it should open the tower's defenses, if my reading of Trelane's notes is right. Take it to Skuerto, and do tell him I was right." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've plenty of ink." },
        { id = "h_again2", text = "Do go on; I'll take notes, if you don't mind." },
      },
      choices = {
        { text = "Ask your question, apprentice.", next = "druid_q", when = { class = "DRUID" } },
        { text = "What can trolls teach an enchanter?", next = "witherbark" },
        { text = "Tell me about your master.", next = "malin" },
        { text = "How do you put up with Skuerto?", next = "skuerto" },
        { text = "I trained in Stormwind's Mage Quarter too.", next = "mage", when = { class = "MAGE" } },
        { text = "Is it wise to study troll magic?", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    witherbark = {
      big = true,
      lines = { { id = "w_default", text = "Their witch doctors work with herbs and bones in ways no Kirin Tor text ever records. Most of it is crude, but some of it is remarkably clever, and I'd hate to see it lost just because we don't like the people who know it." } },
      choices = {
        { text = "What have you learned so far?", next = "witherbark_learned" },
        { text = "Knowledge is knowledge, whoever holds it.", next = "BACK", fx = { align = { light = -1 }, trait = { curious = 1 } } },
        { text = "Some knowledge should stay with the trolls.", next = "BACK", fx = { align = { light = 1 } } },
      },
    },
    witherbark_learned = {
      lines = { { id = "wl_default", text = "That a shadow hunter's knife isn't just a blade; it's given after a rite, and they won't use another. I'm not sure yet what that means for an enchanter, but I've written it down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    malin = {
      lines = { { id = "m_default", text = "Archmage Malin, in the Wizard's Sanctum in Stormwind. He studied under Archmage Trelane here before Stromgarde fell, and he wants his master's artifacts out of the ogres' hands." } },
      choices = {
        { text = "Is he a good teacher?", next = "malin_teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    malin_teacher = {
      lines = { { id = "mt_default", text = "Strict, and very good, and he sends me to places like this to learn what books can't teach. I've learned a great deal about ogres, mostly how to avoid them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    skuerto = {
      lines = { { id = "s_default", text = "He's very good at what he does, and very sensitive about anyone suggesting otherwise. I've learned to say 'he's busy' instead of 'he's late', and we get along famously." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "mg_default", text = "Then you've walked the Mage Quarter too! Malin keeps to his rooms mostly; if you've met him, you'll know he takes his tea strong and his apprentices seriously." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest = {
      lines = { { id = "pr_default", text = "I asked myself the same thing, and I decided that understanding a thing isn't the same as using it. If the Witherbark's magic ever starts whispering back, I promise I'll stop." } },
      choices = {
        { text = "See that you do.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Enchanting, reagents and a little history. Ask, and I'll check my notes." } },
    background = { { id = "tp_bg", text = "An apprentice from Stormwind, sent north to learn and to carry things.", next = "malin" } },
    advice = { { id = "tp_ad", text = "Label everything you collect. The witch doctors' pouches all look alike after a day in a pack." } },
    _none = { { id = "tp_none", text = "I'm afraid that isn't in my notes. Skuerto might know, if you catch him in a good mood." } },
  },
}

P:NPC {
  key = "cedrik", id = TODO_NPC("Cedrik Prose"), name = "Cedrik Prose",
  bible = "bibles/arathi.md", role = "flightmaster", tier = "service",
  communities = { "refuge_pointe" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Cedrik Prose keeps the gryphons at Refuge Pointe and flies Stromgarde's dispatches south. He talks about the Highlands' weather as if it were another enemy.",
    third = "{name} met Cedrik Prose, the gryphon master at Refuge Pointe.",
  },

  greetings = {
    { id = "g_default", text = "Need a gryphon? They're fed and fresh, and the weather's holding for now." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the Pointe. Where shall it be this time?" },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! The birds settle better when one of you is near. Aerie Peak bred half of them, after all." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Cedrik Prose, gryphon master. I fly the Captain's letters south and her soldiers home, and anyone else who needs to be somewhere other than the Highlands." },
        { id = "h_badges", when = { questDone = TODO_QUEST("Stromgarde Badges") },
          text = "Those badges you brought back went south in my saddlebags. I don't usually think about what I carry, but I thought about those." },
      },
      again = {
        { id = "h_again", text = "Anything more? The gryphons smell trolls on the wind and won't settle until we're done." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "What do you carry south?", next = "letters" },
        { text = "Are the skies safe here?", next = "skies" },
        { text = "Not now.", next = "END" },
      },
    },
    letters = {
      lines = { { id = "l_default", text = "Pleas for soldiers, mostly, and letters to the families of the fallen. Few of the first get answered, and I've stopped counting the second." } },
      choices = {
        { text = "Does Stormwind answer?", next = "letters_answer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters_answer = {
      lines = { { id = "la_default", text = "Sometimes with coin, rarely with soldiers. The Captain reads every reply twice and then goes out to count the tents again." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    skies = {
      lines = { { id = "s_default", text = "Safer than the roads, though the Horde keep wind riders at Hammerfall, and the Witherbark throw spears at anything that flies low. I keep the birds high." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the routes and the weather, so ask me about either one." } },
    background = { { id = "tp_bg", text = "I flew for Stromgarde before the keep fell. I still do, from a tent." } },
    advice = { { id = "tp_ad", text = "Never feed a gryphon from your hand unless you've a spare hand." } },
    _none = { { id = "tp_none", text = "That's for someone on the ground. Ask the Captain." } },
  },
}

P:NPC {
  key = "vikki", id = TODO_NPC("Vikki Lonsav"), name = "Vikki Lonsav",
  bible = "bibles/arathi.md", role = "vendor", tier = "service",
  communities = { "refuge_pointe" }, temper = { "brisk" }, values = { "practical" },
  notices = { "kit" },

  impression = {
    first = "Vikki Lonsav sells general goods out of a tent at Refuge Pointe, and keeps careful count of every arrow and loaf she has left.",
    third = "{name} met Vikki Lonsav, who sells general goods at Refuge Pointe.",
  },

  greetings = {
    { id = "g_default", text = "Rope, bread, flasks and thread, and not much of any of it, so buy what you need before the soldiers do." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I've a bit more stock since the last wagon, but don't get excited." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look half torn to pieces. I sell thread, not miracles, but the thread helps." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Vikki Lonsav, general goods. If the Pointe runs out of something, it's my fault, so I make sure it doesn't run out of much." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a tally to finish." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "How do supplies reach you?", next = "supplies" },
        { text = "What runs out first?", next = "first" },
        { text = "That's all.", next = "END" },
      },
    },
    supplies = {
      lines = { { id = "s_default", text = "By wagon from the south when the road's clear, and by gryphon when it isn't. Neither comes often enough, so I count everything twice." } },
      choices = {
        { text = "Why is the road so dangerous?", next = "supplies_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_road = {
      lines = { { id = "sr_default", text = "Syndicate on the hills, ogres near the Span and trolls in the south. A wagon that gets through with half its load counts as a good week here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "Arrows, every time, and then bandages, and then patience, which I don't sell. The soldiers always find more of that than I'd expect." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "What's in stock and what isn't. That's my whole trade." } },
    background = { { id = "tp_bg", text = "I sold goods in Stromgarde before the keep fell. Now I sell them in a tent, and I'm glad of the tent." } },
    advice = { { id = "tp_ad", text = "Carry more water than you think. The Highlands are drier than they look." } },
    _none = { { id = "tp_none", text = "I don't stock that, and I don't know about it either." } },
  },
}
