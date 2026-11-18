-- More of the Undercity: Andrew Brownell and the Coldbringer, the warlock and skinning trainers,
-- a Montague banker, the guild master, and the merchants of the Magic, Rogues' and War Quarters.
-- Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Andrew Brownell: watches the Scourge abroad; wants Amnennar the Coldbringer's skull.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_brownell", id = TODO_NPC("Andrew Brownell"), name = "Andrew Brownell",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "grave", "precise" }, values = { "dutiful", "knowledge" },
  notices = { "race", "class" },
  impression = {
    first = "His reports are thorough, and none of them are good news.",
    third = "{name} met Andrew Brownell in the Magic Quarter, who studies the Scourge's reach into Kalimdor.",
  },

  greetings = {
    { id = "g_default", text = "Come in, but quietly. I'm in the middle of a report, and none of it is pleasant." },
    { id = "g_active", when = { questActive = TODO_QUEST("Bring the End") }, text = "Razorfen Downs, {class}, and the Coldbringer's skull. I'll not rest easy until I see it on this table." },
    { id = "g_done", when = { questDone = TODO_QUEST("Bring the End") }, text = "The one who ended the Coldbringer. My reports have grown a little shorter since, and I thank you for it." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, here in the Undercity. You'll know more of the quilboar than any of my agents, I suspect, and I'd be glad of what you know." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You'll understand, better than most, what it means for a lich to bind the dead to its will." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Andrew Brownell. The Dark Lady has eyes on the Scourge wherever it reaches, and some of those eyes report to me, which is why I seldom have good news for anyone." },
        { id = "h_before", tags = { "news" }, when = { minLevel = 33, questBefore = TODO_QUEST("Bring the End") },
          text = "In the Barrens lies a tangle of vines and thorn called Razorfen Downs. Our first look at it told us little, but what we've learned since is far more serious, {class}, and I need someone who can act on it." },
        { id = "h_active", when = { questActive = TODO_QUEST("Bring the End") },
          text = "Amnennar the Coldbringer rules the quilboar of Razorfen Downs now, and every one of them moves to his will. Kill him and bring me his skull, and the Scourge loses a foothold in Kalimdor." },
        { id = "h_done", when = { questDone = TODO_QUEST("Bring the End") },
          text = "The Coldbringer's skull is on its way to the Apothecarium, where it will be studied with great care. The bond he held to the Lich King is cut, and the quilboar are only quilboar again." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly; I've no time for riddles." },
        { id = "h_again2", text = "Go on. The report can wait a moment." },
      },
      choices = {
        { text = "What's happening in Razorfen Downs?", next = "downs" },
        { text = "Who is Amnennar the Coldbringer?", next = "amnennar" },
        { text = "Who reports to you out there?", next = "agents" },
        { text = "My people have fought the quilboar for generations.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll leave you to your report.", next = "END" },
      },
    },
    downs = {
      lines = { { id = "d_default", text = "The quilboar of the Downs have thrown in with the Scourge, {class}. They were always vicious, but now they march together and fight without fear, and that is not a thing quilboar do on their own." } },
      choices = {
        { text = "Why would the Scourge want quilboar?", next = "downs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    downs2 = {
      lines = { { id = "d2_default", text = "Bodies, first, and a foothold on Kalimdor, second. Every quilboar that falls in the Downs can be raised again, and the Barrens are a short march from Orgrimmar and Thunder Bluff both." } },
      choices = {
        { text = "Then the Horde must strike first.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    amnennar = {
      lines = { { id = "a_default", text = "A lich, and a powerful one, sent to rule the Downs in the Lich King's name. He holds the quilboar with the weight of his mind alone, and through him the Lich King's will reaches all the way to the Barrens." } },
      choices = {
        { text = "How can one lich hold so many?", next = "bond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bond = {
      lines = { { id = "b_default", text = "He has a direct link to Ner'zhul himself, the Lich King in his frozen throne. We must sever that bond, and the only certain way to sever a lich's bond is to end the lich." } },
      choices = {
        { text = "Would the bond break if he chose to turn?", next = "loyalty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loyalty = {
      big = true,
      lines = { { id = "l_default", text = "A lich's loyalty is unswerving, {class}. We broke free of the Lich King because he faltered, but the Coldbringer never will, and such loyalty will bring him only destruction. Does that trouble you?" } },
      choices = {
        { text = "No. Some enemies can only be destroyed.", next = "BACK", reply = "Just so. Pity is a luxury for those who aren't fighting the Scourge on three continents.", fx = { align = { light = -1 } } },
        { text = "It does. He was someone once, like us.", next = "BACK", reply = "He was, and so were the quilboar he leads. Remember it if you like, but don't let it stay your hand in the Downs.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    agents = {
      lines = { { id = "ag_default", text = "Forsaken who travel, mostly, and a few of the living who are paid to keep their eyes open. I'll not give you their names, {class}, because the Scourge has ways of learning names." } },
      choices = {
        { text = "You trust the living with this?", next = "BACK", reply = "I trust them to want their coin, and to want the Scourge kept away from their homes. That's enough to build a report on." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "Then you'll know what a quilboar looks like when it fights for itself, and you'll see the difference in the Downs at once. They don't flee and they don't scatter, and your people should be told." } },
      choices = {
        { text = "I'll tell the elders in Thunder Bluff.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scourge = { { id = "tp_scourge", text = "Wherever there are dead, there is the Scourge, and wherever there is the Scourge, I have a report to write. I've written a great many." } },
    kelthuzad = { { id = "tp_kt", text = "His name comes up in more of my reports than I'd like, though seldom with anything I can act upon." } },
    _none = { { id = "tp_none", text = "That's not in any of my reports. Ask someone who isn't busy." } },
  },
}

---------------------------------------------------------------------------
-- Luther Pickman: warlock trainer in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_lpickman", id = TODO_NPC("Luther Pickman"), name = "Luther Pickman", title = "Warlock Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "cold", "condescending" }, values = { "power", "knowledge" },
  notices = { "class" },
  impression = {
    first = "He believes fear is the first thing a student should learn.",
    third = "{name} met Luther Pickman, a warlock trainer in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "If you're not a warlock, you're in the wrong room, and if you are, you're late." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Another student. Show me what you've learned, and then I'll show you how little it is." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, which means you either learned something or forgot it. We shall see which." },
  },

  notice = {
    { id = "n_notlock", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You've the look of someone who prays. Pray quietly, please; it distracts the imps." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Mistress Hatebringer's hall is further round the quarter, and she will tell you our art is a shortcut. She says it from a safe distance, you will notice." },
    { id = "n_lock_pet", cat = "class", when = { class = "WARLOCK", minLevel = 10 },
      text = "Your demon is fidgeting, student. A servant that fidgets is a servant that has been allowed to think, and I do not recommend it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Luther Pickman. I teach the shadow and the flame to those with the stomach for them, and I am not patient with those without it." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Luther Pickman, and you may call me master while you study under me. You have already made your first pact, so the easy part is behind you, and everything I teach from here costs more." },
      },
      again = {
        { id = "h_again", text = "Well? I've other students." },
        { id = "h_again2", text = "Ask, then, and be brief." },
        { id = "h_again3", text = "You are still here, so I assume there is another question. Ask it properly." },
      },
      choices = {
        { text = "I'm ready to learn.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What makes a good warlock?", next = "good" },
        { text = "Do you work with the other trainers here?", next = "others" },
        { text = "This hall smells of brimstone and chalk.", next = "hall" },
        { text = "What do you think of the mages next door?", next = "mages" },
        { text = "My first summoning nearly went wrong.", next = "first", when = { class = "WARLOCK" } },
        { text = "I'll go.", next = "END" },
      },
    },
    good = {
      lines = { { id = "gd_default", text = "Control. The fel will give you anything you ask, and take twice as much in return, and the warlock who lets it take is no warlock at all, only a meal with ambitions." } },
      choices = {
        { text = "And how does one keep control?", next = "good2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good2 = {
      big = true,
      lines = { { id = "g2_default", text = "By never forgetting what you're touching. Some say the Forsaken are suited to this art because we've nothing left to lose. I say that's precisely why we must be careful. Where do you stand, {class}?" } },
      choices = {
        { text = "Power is a tool. Use all of it.", next = "BACK", reply = "Then you'll be powerful, and briefly. I've buried students who thought as you do, the second time.", fx = { align = { order = -1 } } },
        { text = "Discipline first. Power after.", next = "BACK", reply = "Good. That answer might keep you alive long enough to be useful.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Richard Kerwin and I share this hall, and Carendin Halgar keeps to his own studies with the demons. We disagree on method, but we agree that the Dark Lady's warlocks should be the best in the Horde." } },
      choices = {
        { text = "And are they?", next = "BACK", reply = "They will be, once they stop asking me questions and start practising." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall = {
      lines = { { id = "ha_default", text = "It smells of work, {class}. Every circle on this floor is redrawn each night by the acolytes, because a line a finger's width out of true is the difference between a servant and a visitor, and I do not entertain visitors." } },
      choices = {
        { text = "Who draws the circles?", next = "hall2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall2 = {
      lines = { { id = "ha2_default", text = "The acolytes do, Zeglo Kruptorr chief among them, and he scowls through every stroke as though the chalk had insulted him. He wants a pact before he has earned one, and so he will scrub until wanting teaches him patience." } },
      choices = {
        { text = "He might surprise you one day.", next = "BACK", reply = "He might. I have a ward prepared for that day, and I advise you to stand behind it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    mages = {
      lines = { { id = "m_default", text = "Kaelystia Hatebringer and Pierce Shackleton teach a tidy art with tidy limits, and they look down the stairs at us for dealing with demons. I notice they are glad enough of a felhunter whenever a Scarlet spellcaster comes calling." } },
      choices = {
        { text = "So you work together when it counts.", next = "mages2" },
        { text = "They may have a point about demons.", next = "mages2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mages2 = {
      lines = { { id = "m2_default", text = "We serve the same queen, and neither of us forgets it. Bethor Iceshard keeps the peace of this quarter, and when he asks for warlocks I send him my best without argument, because a quarrel between halls is a luxury for cities that are not besieged." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Then you have learned the most useful lesson I teach, and you learned it without my help. Tell me what went wrong, briefly, and do not flatter yourself in the telling." } },
      choices = {
        { text = "I rushed the circle.", next = "first2" },
        { text = "The imp talked, and I listened.", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      lines = { { id = "f2_default", text = "Of course you did. Every student does one or the other, and the ones who admit it are the ones I can teach. Carendin Halgar keeps the deeper rites further in, and when you are ready for a greater servant it is he who will test you, not I." } },
      choices = {
        { text = "I'll be ready for him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "tp_legion", text = "We use their servants. We do not serve them. Remember the difference, or the Legion will remember it for you." } },
    sylvanas = { { id = "tp_syl", text = "The Dark Lady asks for warlocks who obey her and fear nothing else. I supply them, and she has not yet had cause to complain of my work." } },
    scarlet_crusade = { { id = "tp_sc", text = "They burn us for what we are and would burn my students twice for what they study. It is one of the few subjects on which my demons and I are in perfect agreement." } },
    advice = { { id = "tp_ad", text = "Never summon anything while you are angry at it. The circle holds the demon, and nothing at all holds you." } },
    _none = { { id = "tp_none", text = "That is not my concern, and therefore not yours, while you're in my hall." } },
  },
}

---------------------------------------------------------------------------
-- Killian Hagey: skinning trainer in the Rogues' Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_hagey", id = TODO_NPC("Killian Hagey"), name = "Killian Hagey", title = "Skinning Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "matter_of_fact", "dry" }, values = { "craft", "practical" },
  notices = { "profession", "class", "race" },
  impression = {
    first = "His knives are the cleanest things in the Undercity.",
    third = "{name} met Killian Hagey, the Undercity's skinning trainer.",
  },

  greetings = {
    { id = "g_default", text = "Knife, steady hand, and no stomach for nonsense. That's all skinning needs, and two of those I can teach." },
    { id = "g_skinner", when = { profession = "Skinning" }, text = "A skinner. Let's see how your cuts are coming along." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with all your fingers. That's a better record than some of my students keep." },
  },

  notice = {
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" },
      text = "A leatherworker. Arthur will want you to learn skinning too, if you haven't, and so will your purse." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll have been skinning your own kills already, I'd wager, and doing it roughly. Let me see your knife before I say more." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people waste nothing of a kill, I've heard, and say a word over it besides. I can't teach you the word, but the cuts are the same." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Killian Hagey, skinning trainer. I'll teach anyone who can hold a knife without shaking, and in this city, that's most people." },
        { id = "h_skinner", when = { profession = "Skinning" }, text = "Killian Hagey. You've the trade already, by the look of your hands, so I'll spare you the speech about holding a knife and we can talk like two people who know which end cuts." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a blade to hone." },
        { id = "h_again2", text = "Go on." },
        { id = "h_again3", text = "The blade's nearly done. What else did you want?" },
      },
      choices = {
        { text = "Teach me to skin.", next = "BUSINESS" },
        { text = "Is skinning easier now that you're dead?", next = "dead" },
        { text = "Who buys the hides?", next = "hides" },
        { text = "Your knives are the cleanest thing in this quarter.", next = "knives" },
        { text = "What's worth skinning around here?", next = "beasts" },
        { text = "The plagued hides in the east are worthless.", next = "plague", when = { profession = "Skinning" } },
        { text = "Not now.", next = "END" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Easier on the stomach, harder on the fingers. I don't mind the smell any more, but my hands don't always do what I tell them, so I've had to learn the cuts all over again." } },
      choices = {
        { text = "How did you relearn them?", next = "dead2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead2 = {
      big = true,
      lines = { { id = "d2_default", text = "Slowly, on Tirisfal wolves, until the cuts came clean. Some of my students want to practise on things that walk on two legs, and I send them away. Do you think I'm too fussy, {class}?" } },
      choices = {
        { text = "No. There are lines even we shouldn't cross.", next = "BACK", reply = "Good. The apothecaries can do as they like with the Crusade; in my hall, we skin beasts.", fx = { align = { light = 1 } } },
        { text = "A hide's a hide. The Crusade would skin us.", next = "BACK", reply = "Maybe they would. But I teach a trade, not a grudge, and you'll learn it my way here.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "h2_default", text = "Arthur Moore for his leatherworkers, Joseph Moore's shop for the supplies, and the auction house for whatever's left. A good hide never goes to waste in this city." } },
      choices = {
        { text = "Then I'll bring good hides.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knives = {
      lines = { { id = "k_default", text = "They have to be. A dirty knife drags, and a dragging knife ruins a hide, and I've no feeling left in my fingertips to tell me when it's dragging. So I keep them clean enough that I never need to wonder." } },
      choices = {
        { text = "Where do you get them sharpened?", next = "knives2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knives2 = {
      lines = { { id = "k2_default", text = "I hone them myself, but the steel comes from Charles Seaton, who sells blades just along the canal. He sells them to cut-throats as well, and I've asked him to keep mine on a separate shelf, which he finds funnier than I do." } },
      choices = {
        { text = "A skinner among assassins must feel odd.", next = "quarter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter = {
      lines = { { id = "q_default", text = "It's a quiet quarter, whatever its name says. Carolyn Ward's rogues practise on dummies, Ezekiel Graves brews his poisons, and nobody troubles a man who's holding a skinning knife. I think they assume I know more than I do." } },
      choices = {
        { text = "Let them keep assuming.", next = "BACK", reply = "That's my plan. It's worked so far.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "Start outside the gates. Tirisfal has duskbats and darkhounds enough for a beginner, and the hounds' hides are thin but they take a clean cut. When you can skin one of those without a nick, go south to Silverpine for the bears." } },
      choices = {
        { text = "And after Silverpine?", next = "beasts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts2 = {
      lines = { { id = "b2_default", text = "Hillsbrad, for the mountain lions and the grey bears, and the deathguards at Tarren Mill will point you to them. The yeti in the caves up there carry a heavy hide that Arthur Moore pays well for, if you can get one off in a single piece." } },
      choices = {
        { text = "I'll bring him a whole one.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plague = {
      lines = {
        { id = "p_default", text = "They are, and I tell every student so. A plaguehound's hide comes off in your hand like wet paper, and whatever's in it gets into the knife, so I burn the knife after." },
        { id = "p_high", when = { minLevel = 50 }, text = "You've been out there, then, and you've seen it for yourself. I tell every student that a plagued hide isn't worth the knife it ruins, and one in three goes east to check." },
      },
      choices = {
        { text = "So nothing out there is worth the cut?", next = "BACK", reply = "The bears in the far hills are still sound, some of them. If it runs from you, skin it, and if it runs at you, leave it lying." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_sc", text = "They wear good leather, I'll say that for them, and they don't sell it. I only know because of what the deathguards bring back." } },
    advice = { { id = "tp_ad", text = "Cut away from yourself, and keep the hide dry until it's salted. That's the whole trade, and the rest is practice." } },
    forsaken = { { id = "tp_fs", text = "We don't feel the cold or mind the smell, and that makes us good at the trades nobody living wants. I'd call it a fair exchange on most nights." } },
    _none = { { id = "tp_none", text = "I skin things. That one I can't help you with." } },
  },
}

---------------------------------------------------------------------------
-- Mortimer Montague: one of the Trade Quarter's Montague bankers.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_mmontague", id = TODO_NPC("Mortimer Montague"), name = "Mortimer Montague", title = "Banker",
  bible = "bibles/more_folk.md", role = "banker", tier = "service",
  communities = { "undercity" }, temper = { "fussy", "dry" }, values = { "order", "discretion" },
  notices = { "purse", "class", "race" },
  impression = {
    first = "He counts everything twice and trusts nobody once.",
    third = "{name} met Mortimer Montague, one of the bankers of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Deposit or withdrawal? Speak clearly; the vault has an echo." },
    { id = "g_back", when = { metBefore = true }, text = "Your box is exactly where you left it. I checked, twice." },
    { id = "g_rich", when = { money = { min = 500000 } }, text = "Ah. A depositor of substance, if I'm any judge, and I am paid to be one. Do step up to the counter." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "You're carrying rather a lot of gold on your person. I'd be happy to relieve you of the worry." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I know that walk from the quarter next door. Your own box is yours to open, and every other box in this vault is no concern of yours." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A living depositor. Do keep your receipt somewhere dry, because your kind perspires, and I have had to recopy three ledgers on account of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mortimer Montague, banker. What goes into my vault stays in it until you ask for it back, which is more than can be said for anything else in this city." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Mortimer Montague, banker. Your gold is as safe here as it would be in Orgrimmar, and considerably quieter, since nobody at this counter will slap you on the back while you count it." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Yes? I'm listening, and counting." },
        { id = "h_again3", text = "I've lost my place in the column, so you may as well ask." },
      },
      choices = {
        { text = "I'd like to open my box.", next = "BUSINESS" },
        { text = "There are a lot of Montagues at this counter.", next = "family" },
        { text = "Who would rob a bank of the dead?", next = "rob" },
        { text = "This vault feels like a tomb.", next = "vault" },
        { text = "How does the bank stand with the other cities?", next = "cities" },
        { text = "I banked in Lordaeron, before all this.", next = "old", when = { race = "Scourge" } },
        { text = "Not today.", next = "END" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "So there are, and I'd thank you not to ask how we're related, because none of us is entirely sure. The name came back with us; the family tree didn't." } },
      choices = {
        { text = "That must be strange.", next = "BACK", reply = "Strange is a word for the living. For us it's simply the paperwork." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rob = {
      lines = { { id = "r_default", text = "The Syndicate, the occasional rogue who thinks the Rogues' Quarter is an invitation, and once, a newly risen fellow who swore the box was his from before he died. It wasn't." } },
      choices = {
        { text = "What happened to him?", next = "rob2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rob2 = {
      big = true,
      lines = { { id = "r2_default", text = "I showed him the ledger, and he went away very quietly. Some say I should have helped him look for whatever he lost. I say a bank that bends its rules for a sad story is no bank at all. Wouldn't you agree?" } },
      choices = {
        { text = "Rules are rules. You were right.", next = "BACK", reply = "Thank you. Not everyone at this counter appreciates a ledger.", fx = { align = { order = 1 } } },
        { text = "You could have helped him. It costs nothing.", next = "BACK", reply = "It costs time, which I have plenty of, admittedly. I'll consider it, should he come back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vault = {
      lines = { { id = "v_default", text = "It was one, or near enough. These were the old city's undercrofts, and the masons who built them meant them for kings, so the walls are a yard thick and the doors are better than anything we could forge today." } },
      choices = {
        { text = "Who guards it?", next = "vault2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vault2 = {
      lines = { { id = "v2_default", text = "The Deathguard stand at the stair, and the abominations walk the ring outside, which discourages the casual thief. Beyond that there are William, Ophelia, Randolph and myself, and we each count the others' drawers at the close of every day." } },
      choices = {
        { text = "You don't trust your own colleagues?", next = "BACK", reply = "I trust them completely. That is precisely why I count." },
        { text = "Something else.", next = "BACK" },
      },
    },
    cities = {
      lines = { { id = "c_default", text = "Our ledgers agree with Orgrimmar's and with Thunder Bluff's, to the copper, and what you set down here you may take up there. The goblins carry the tallies between us on their zeppelins and charge a fee I consider piracy." } },
      choices = {
        { text = "But you pay it.", next = "cities2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cities2 = {
      lines = { { id = "c2_default", text = "We pay it, because the alternative is sending a courier on foot through Silverpine and Hillsbrad with the accounts of a kingdom under his arm. I ran the figures once, and the goblins are cheaper than the funerals." } },
      choices = {
        { text = "A banker's arithmetic.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    old = {
      lines = { { id = "o_default", text = "Then you'll remember the counting house on the king's square, with the brass rail. I'm sorry to tell you that its ledgers burned with the city, and no claim from before the Plague can be honoured at this counter." } },
      choices = {
        { text = "I didn't expect it could.", next = "old2" },
        { text = "That gold was mine by right.", next = "old2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old2 = {
      lines = { { id = "o2_default", text = "I hear it weekly, and I take no pleasure in the answer. Royal Overseer Bauhaus keeps the census of who we were, so if you want your old name set down somewhere, take it to him, because a bank can only record what you bring it now." } },
      choices = {
        { text = "Then I'll start again with what I have.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    syndicate = { { id = "tp_syn", text = "They have tried my vault twice. They have not succeeded twice." } },
    lordaeron = { { id = "tp_lord", text = "It had a treasury, a mint and a king who spent beyond both. I say so as one who watched the columns, and not as a critic of the crown." } },
    advice = { { id = "tp_ad", text = "Keep a tenth of everything where you cannot reach it in a hurry. Most ruin is done in a hurry." } },
    sylvanas = { { id = "tp_syl", text = "Her Majesty does not bank with us, so far as I am permitted to say. The city's own accounts are in excellent order, and I shall leave it there." } },
    _none = { { id = "tp_none", text = "I'm a banker. If it isn't counted, I don't know it." } },
  },
}

---------------------------------------------------------------------------
-- Gillian Moore: leather armor merchant in the Rogues' Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_gmoore", id = TODO_NPC("Gillian Moore"), name = "Gillian Moore", title = "Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "sly", "brisk" }, values = { "practical", "profit" },
  notices = { "class", "profession" },
  impression = {
    first = "She knows what a customer wants before they decide to lie.",
    third = "{name} met Gillian Moore, who sells leather armor in the Undercity's Rogues' Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Soft soles, dark leather, no creaks. Whatever you're up to, I've something that won't give you away." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "One of the quarter's regulars, or soon to be. You'll want the dark tan; everyone does." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and I never heard you on the stair. Either the last pair fits, or you've come for a quieter one." },
  },

  notice = {
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You clank. Down here, that's a confession. The War Quarter sells plate; I sell silence." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll want something that turns a claw and doesn't scare the game, and I'd sooner fit you properly than have you blame my leather when you miss." },
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" },
      text = "You work leather yourself, I can see it in the way you're reading my seams. Go on and look, I've nothing to hide, and Arthur taught half the hands that made them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gillian Moore. I sell leather armor in a quarter full of people who'd prefer not to be heard coming, and business has never been better." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Gillian Moore. You're one of the quarter's own, so I'll skip the patter and tell you plainly that the dark tan is in, the soles are soft, and nobody will hear from me what size you took." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quietly, if you please." },
        { id = "h_again2", text = "Go on." },
        { id = "h_again3", text = "Still here? Then ask it low, the canal carries voices." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Who are your customers?", next = "customers" },
        { text = "Is this leather from Killian's skins?", next = "source" },
        { text = "Tell me about the quarter.", next = "quarter" },
        { text = "Your armor doesn't creak at all.", next = "creak" },
        { text = "I need something for close, quiet work.", next = "work", when = { class = "ROGUE" } },
        { text = "Not today.", next = "END" },
      },
    },
    customers = {
      lines = { { id = "c_default", text = "Rogues, hunters, the odd apothecary going somewhere they shouldn't. I don't ask, and they don't tell, and that's the oldest arrangement in this quarter." } },
      choices = {
        { text = "Even the Syndicate?", next = "customers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers2 = {
      big = true,
      lines = { { id = "c2_default", text = "If a Syndicate man came to my counter, how would I know? They don't wear a sign. Would you turn away coin on a guess, {class}?" } },
      choices = {
        { text = "I would. Enemies of the Dark Lady get nothing.", next = "BACK", reply = "Very loyal of you. I'll leave the guessing to the Deathguard, then, and sell to whoever's left.", fx = { align = { honor = 1 } } },
        { text = "Coin's coin. Sell, and keep your ears open.", next = "BACK", reply = "Now you're thinking like the quarter. A merchant hears a great deal, if she doesn't ask questions.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "s_default", text = "Some of it. Killian's students bring in Tirisfal wolf and boar, Joseph sells the thread and dye, and the leatherworkers turn it into something worth wearing. I just put it on the shelf." } },
      choices = {
        { text = "A whole quarter in one jerkin.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter = {
      lines = { { id = "q_default", text = "It's the safest ring of the city, if you mind your own purse. Carolyn Ward and Miles Dexter train the Dark Lady's knives at the far end, Mennet Carkad hands out the work nobody admits to, and the rest of us sell them what they need for it." } },
      choices = {
        { text = "And who keeps order among thieves?", next = "quarter2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter2 = {
      lines = { { id = "q2_default", text = "They keep it themselves, which is tidier than a watch. Nobody steals from a neighbour here, because every neighbour knows three ways to make you regret it, and Jonathan Chambers on the canal would talk about it for a month besides." } },
      choices = {
        { text = "The bag seller? He seems harmless.", next = "BACK", reply = "He is, and he's the only one. That's why everyone tells him things, and why I don't." },
        { text = "Something else.", next = "BACK" },
      },
    },
    creak = {
      lines = { { id = "cr_default", text = "That's the oiling, and the cut. New leather creaks at the shoulder and the knee, so I have it worked there until it's soft as a glove, and I won't put a buckle anywhere it might catch the light." } },
      choices = {
        { text = "Who does the working for you?", next = "creak2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    creak2 = {
      lines = { { id = "cr2_default", text = "Dan Golthas, mostly, who's still learning under Arthur and needs the practice. He over-oils everything, so the jerkins come to me smelling like a lamp, and I hang them a week by the canal, which cures one smell with another." } },
      choices = {
        { text = "I'd wondered about the smell.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Then you want the fitted set and nothing loose at the wrist. I'll not ask where you're wearing it, but if it's the Scarlet side of Tirisfal, take the darker pair, because their lanterns are brighter than ours." } },
      choices = {
        { text = "You know a good deal for someone who doesn't ask.", next = "work2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work2 = {
      lines = { { id = "w2_default", text = "I listen, which isn't the same as asking. People talk while they're being measured, and I've fitted most of Mennet's people at one time or another, so I know where the work is even when I don't know what it is." } },
      choices = {
        { text = "Then show me the darker pair.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    syndicate = { { id = "tp_syn", text = "I don't know any Syndicate, and if I did, I'd still say that." } },
    scarlet_crusade = { { id = "tp_sc", text = "They wear red and carry lanterns, which makes them the easiest people in Lordaeron to sneak up on. My customers thank them for it." } },
    advice = { { id = "tp_ad", text = "Buy your boots a little loose and bind them. A tight boot squeaks, and a squeak has killed better people than you." } },
    forsaken = { { id = "tp_fs", text = "We don't breathe hard and we don't sweat, and that's half of sneaking done before I've sold you anything." } },
    _none = { { id = "tp_none", text = "Not a thing I sell, so not a thing I know." } },
  },
}

---------------------------------------------------------------------------
-- Joseph Moore: leatherworking supplies in the Rogues' Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_jmoore", id = TODO_NPC("Joseph Moore"), name = "Joseph Moore", title = "Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "plain", "patient" }, values = { "craft", "practical" },
  notices = { "profession", "class" },
  impression = {
    first = "He is the dullest man in the quarter and proud of it.",
    third = "{name} met Joseph Moore, who sells leatherworking supplies in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Thread, salt, dye and handles. If you work leather, you'll need all of it sooner or later." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker. Coarse thread or fine? I've both, and the salt's fresh in." },
    { id = "g_back", when = { metBefore = true }, text = "You were here before. I have it written down, along with what you bought, if you'd like to check." },
  },

  notice = {
    { id = "n_skin", cat = "profession", when = { profession = "Skinning" },
      text = "A skinner. Salt your hides before they come to me, or Arthur will hear about it." },
    { id = "n_tailor", cat = "profession", when = { profession = "Tailoring" },
      text = "A tailor. You'll want Millie Gregorian in the Magic Quarter for your thread, since mine is waxed for leather and would tear a silk to pieces." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "If it's black dye you're after, I've a barrel of it, and I'll write the purchase down the same as anyone's." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Joseph Moore, leatherworking supplies. I sell the small things that turn a hide into armor, and nobody ever remembers buying them until they run out." },
        { id = "h_lw", when = { profession = "Leatherworking" }, text = "Joseph Moore, leatherworking supplies. You're in the trade, so you already know that the salt and the thread matter more than the hide, and that nobody will ever praise you for either." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Go on. I've a list to finish." },
        { id = "h_again3", text = "I've a moment between entries, if there's more." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You keep a list of every customer?", next = "list" },
        { text = "Quiet trade, for this quarter.", next = "quiet" },
        { text = "Where do your supplies come from?", next = "supply" },
        { text = "Tell me about the leatherworkers here.", next = "workers" },
        { text = "Which dye holds best on heavy hide?", next = "dye", when = { profession = "Leatherworking" } },
        { text = "Not now.", next = "END" },
      },
    },
    list = {
      lines = { { id = "l_default", text = "Every one, by name and by purchase. It tells me when to order salt, and it tells me who's been working leather and who's been buying black dye by the barrel for no honest reason." } },
      choices = {
        { text = "Does anyone ask to see the list?", next = "list2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    list2 = {
      big = true,
      lines = { { id = "l2_default", text = "The Deathguard, now and then, and once someone from the Royal Apothecary Society. I let the Deathguard look and I told the apothecary I'd lost it. Which would you have done?" } },
      choices = {
        { text = "Shown them both. The city's safety comes first.", next = "BACK", reply = "Spoken like a loyal citizen. The apothecary had a smile I didn't like, though.", fx = { align = { order = 1 } } },
        { text = "Neither. Your customers trust you.", next = "BACK", reply = "They do, and that trust is worth more than the salt. I'll keep your answer in mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = { { id = "q_default", text = "It is, and I like it that way. Gillian sells the finished armor and gets all the interesting customers, and I sell salt and get none of them." } },
      choices = {
        { text = "Dull is underrated.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      lines = { { id = "s_default", text = "The salt comes up from the coast by way of Silverpine, and the thread I buy from spinners in Brill who work by lamplight because they've no need of sleep. The dyes are the trouble, since the good ones used to come from Dalaran." } },
      choices = {
        { text = "And now that Dalaran is shut?", next = "supply2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply2 = {
      lines = { { id = "s2_default", text = "Now I make do. The black I boil myself from oak gall, the green comes from something the Apothecarium throws out, and I've agreed not to ask what. It holds its colour remarkably well, which is the part that worries me." } },
      choices = {
        { text = "I'd not wear the green, then.", next = "BACK", reply = "Most don't, once I've told them. I tell them all, and I note that I told them." },
        { text = "Something else.", next = "BACK" },
      },
    },
    workers = {
      lines = { { id = "w_default", text = "Arthur Moore teaches the craft across the way, and Dan Golthas takes the beginners off his hands. Killian Hagey teaches the skinning, and between the three of them every hide in the city passes within ten paces of my counter." } },
      choices = {
        { text = "Three Moores in one quarter.", next = "workers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    workers2 = {
      lines = { { id = "w2_default", text = "Three Moores and no agreement on whether we're kin. Arthur thinks we may be cousins, Gillian thinks it's a common name, and I think that if we were family, one of us would have borrowed money from the others by now." } },
      choices = {
        { text = "That does sound like family.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dye = {
      lines = { { id = "d_default", text = "The oak gall black, without question. It bites into a heavy hide and stays there, and it covers a bad cut, which I mention only because every leatherworker asks eventually." } },
      choices = {
        { text = "And for something finer?", next = "dye2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dye2 = {
      lines = { { id = "d2_default", text = "For fine work you want the grey I get from a goblin at the zeppelin tower, twice a season, at a price I resent. Take it to Arthur before you use it, because he'll show you how to thin it, and a pot wasted is a pot I can't replace before winter." } },
      choices = {
        { text = "I'll ask him first. Thank you, Joseph.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dal", text = "They made the best dyes in the north and sold them dear. Now they sell them to nobody, and my shelves show it." } },
    advice = { { id = "tp_ad", text = "Write things down. Memory is the first thing to go when you die, and a list never forgets what you owe." } },
    scarlet_crusade = { { id = "tp_sc", text = "I've never sold them so much as a needle. I'd have it written down if I had." } },
    forsaken = { { id = "tp_fs", text = "We're a tidy people when we're let alone. The dead have a great deal of time for keeping records." } },
    _none = { { id = "tp_none", text = "I sell supplies. You want Gillian for gossip." } },
  },
}

---------------------------------------------------------------------------
-- Jonathan Chambers: bag vendor in the Rogues' Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_chambers", id = TODO_NPC("Jonathan Chambers"), name = "Jonathan Chambers", title = "Bag Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "cheerful", "chatty" }, values = { "practical", "profit" },
  notices = { "class", "profession" },
  impression = {
    first = "He sincerely blames the world's troubles on having nowhere to put things.",
    third = "{name} met Jonathan Chambers, who sells bags in the Undercity's Rogues' Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Bags! Bags for everything, and everything in its bag. Come and look." },
    { id = "g_back", when = { metBefore = true }, text = "Back already? I knew it; you're full up. Everyone always is." },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "A living customer! You'll be carrying food, then, and food wants its own bag, well away from everything else. Come and see." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! You'll want a quiver, I expect, and the bag vendor in the War Quarter will tell you he has better ones, but he doesn't." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of the quarter's own! I've a pouch with a false bottom that I'm not supposed to mention, so I shan't, but it's on the left." },
    { id = "n_herb", cat = "profession", when = { profession = { "Herbalism", "Alchemy" } },
      text = "You gather herbs, I can smell them from here, or I could if my nose still worked. They'll bruise in an ordinary pack, you know, so ask me about that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jonathan Chambers, bag vendor. I sell the most useful thing in the Undercity, and nobody ever thanks me until they're standing in a crypt with a pocket full of loot and nowhere to put it." },
        { id = "h_met", when = { metBefore = true }, text = "Jonathan Chambers, still here and still selling bags. I knew you'd be back, because nobody has ever once come to me and said they had too much room." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a bag for that, I'm sure." },
        { id = "h_again2", text = "Go on!" },
        { id = "h_again3", text = "What else can I tell you? I've all night, and all the nights after." },
      },
      choices = {
        { text = "Let me see your bags.", next = "BUSINESS" },
        { text = "You're very cheerful for the Undercity.", next = "cheer" },
        { text = "What do people carry, mostly?", next = "carry" },
        { text = "Who makes your bags?", next = "makers" },
        { text = "You seem to know everyone on this canal.", next = "canal" },
        { text = "My herbs keep getting crushed.", next = "herbs", when = { profession = { "Herbalism", "Alchemy" } } },
        { text = "Not today.", next = "END" },
      },
    },
    cheer = {
      lines = { { id = "c_default", text = "Why wouldn't I be? I died, I came back, and I found a trade that will never go out of fashion. Some of my neighbours think a smile is bad manners on a Forsaken." } },
      choices = {
        { text = "What do you think?", next = "cheer2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheer2 = {
      big = true,
      lines = { { id = "c2_default", text = "I think we were given a second go at things, and I'd rather spend mine selling bags than sulking. But I've been told that's naive. Is it, {class}?" } },
      choices = {
        { text = "It isn't. Keep smiling, Jonathan.", next = "BACK", reply = "I will! And I'll sell you a bag to carry the smile in, if you like.", fx = { align = { light = 1 } } },
        { text = "It is. This unlife isn't a gift.", next = "BACK", reply = "Perhaps not. But it's the one we've got, and it still needs bags.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = { { id = "ca_default", text = "Rogues carry lockpicks and other people's purses, apothecaries carry vials, and the newly risen carry everything they find, because they don't know yet what's worth keeping. That's why they come back to me." } },
      choices = {
        { text = "And what do you carry?", next = "BACK", reply = "More bags, of course. You never know when someone will need one." },
        { text = "Something else.", next = "BACK" },
      },
    },
    makers = {
      lines = { { id = "m_default", text = "The tailors in the Magic Quarter sew the cloth ones, and I take the leather satchels from Arthur Moore's students, who need somebody to buy their practice pieces. I check every seam myself, because a bag that splits is a customer lost." } },
      choices = {
        { text = "Even the students' work?", next = "makers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    makers2 = {
      lines = { { id = "m2_default", text = "Especially the students' work! Dan Golthas sent me a satchel last month with the strap sewn on the inside, and I've kept it under the counter ever since. I show it to anyone who's having a worse day than mine." } },
      choices = {
        { text = "Show me, then.", next = "BACK", reply = "There, you see? You can't even get your hand in. Marvellous. It cheers me every time.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    canal = {
      lines = { { id = "cn_default", text = "I do, and they all pretend they don't know me. Gillian Moore sells her leathers along the way and never tells me anything, Joseph Moore writes down everything and tells me less, and Killian Hagey only talks about knives." } },
      choices = {
        { text = "And yet you like them.", next = "canal2" },
        { text = "They sound like poor company.", next = "canal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    canal2 = {
      lines = { { id = "cn2_default", text = "They're my neighbours, and I'd not swap them. When my awning fell in the canal it was Killian who fished it out and Gillian who stitched it, and neither said a word about it after, which in this quarter is as good as a hug." } },
      choices = {
        { text = "That's a good street to live on.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = { { id = "h2_default", text = "Of course they do, if you've got them in with your whetstone and your boots! You want a proper herb pouch, with the stiff sides, so the stalks lie flat and nothing leans on them." } },
      choices = {
        { text = "Do you stock one?", next = "herbs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs2 = {
      lines = { { id = "h3_default", text = "I stock the plain bags, and good ones, but for the true herb pouches you'll need a tailor with the pattern, and I'd ask Victor Ward in the Magic Quarter. Tell Martha Alliestar I sent you if you see her, because she's been saying the same for a year." } },
      choices = {
        { text = "Let me see the plain ones for now.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "We're a gloomy lot, I'll grant you, but we've a city and a queen and each other. That's three more things than I woke up with." } },
    advice = { { id = "tp_ad", text = "Always carry one more bag than you think you need. I'd say that even if I didn't sell them." } },
    syndicate = { { id = "tp_syn", text = "I sold a sack to a fellow in an orange mask once, and Gillian wouldn't speak to me for a week. I still don't know what I did." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, but I can sell you somewhere to keep the answer once you find it." } },
  },
}

---------------------------------------------------------------------------
-- Lucille Castleton: robe vendor in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_castleton", id = TODO_NPC("Lucille Castleton"), name = "Lucille Castleton", title = "Robe Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "refined", "tart" }, values = { "taste", "craft" },
  notices = { "class", "profession", "race" },
  impression = {
    first = "She has opinions about every hem that walks past her.",
    third = "{name} met Lucille Castleton, who sells robes in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Robes for the learned, the devout and the dreadful. Do come in, and do stand up straight." },
    { id = "g_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Ah, a caster in need of something better than that. Let me see what would suit you." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, dear, and wearing the same thing. We really must do something about that." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, in a robe shop. Are you lost, or buying a gift?" },
    { id = "n_tailor", cat = "profession", when = { profession = "Tailoring" },
      text = "You sew, dear, I can tell by the way you looked at my hems before you looked at me. Go on, say what you think; I've heard worse from Josephine Lister." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll, in my shop! You people wear colour as though it cost nothing, and I mean that as the highest praise I have." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lucille Castleton. I dressed half the mages of Lordaeron once, or I sold their tailors the cloth, which is nearly the same thing, and now I dress the Dark Lady's casters instead." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Lucille Castleton. You carry yourself like someone who's read a book or two, dear, and it's a shame to see it wrapped in that. I dressed Lordaeron's learned once, and I can certainly dress you." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear?" },
        { id = "h_again2", text = "Go on. And mind the sleeves." },
        { id = "h_again3", text = "Yes, dear? I'm only pinning." },
      },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "What did Lordaeron's mages wear?", next = "court" },
        { text = "Does fashion matter to the dead?", next = "matter" },
        { text = "Who sews the robes you sell?", next = "sewn" },
        { text = "You've an opinion on every hem that passes.", next = "hems" },
        { text = "What should a caster of my sort wear?", next = "wear", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Not today.", next = "END" },
      },
    },
    court = {
      lines = { { id = "c_default", text = "Violet and silver, for those who'd studied in Dalaran, and anything that dragged on the floor, for those who wanted you to think they had. The priests wore white, of course, and the Plague made short work of that." } },
      choices = {
        { text = "Do you miss it?", next = "court2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court2 = {
      big = true,
      lines = { { id = "c2_default", text = "I miss the colours. We wear black and purple and green now, because it suits the rot, and I'm told I ought to be proud of that. Should I be, {class}?" } },
      choices = {
        { text = "Yes. We've no need to dress like the living.", next = "BACK", reply = "Spoken like the Dark Lady's own herald. Black it is, then, and plenty of it.", fx = { align = { order = 1 } } },
        { text = "No. Wear what colours you like.", next = "BACK", reply = "Careful, you'll have me stocking yellow. Imagine the looks in the Magic Quarter!", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    matter = {
      lines = { { id = "m_default", text = "More than ever, dear. When your face is falling off, a good collar draws the eye elsewhere, and I've made a study of collars." } },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sewn = {
      lines = { { id = "s_default", text = "The quarter's own tailors, dear. Josephine Lister does the finest work in the city, Rhiannon Davis the steadiest, and Victor Ward's students do the rest, which I sell at the back where the light is kinder." } },
      choices = {
        { text = "And you choose what's fit to sell?", next = "sewn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sewn2 = {
      lines = { { id = "s2_default", text = "I do, and I send back one robe in four. A sleeve set crooked will pull at the shoulder every time you raise your arm to cast, and I'll not have some poor mage miss a Scarlet inquisitor because of my shelf." } },
      choices = {
        { text = "That's a higher standard than I expected.", next = "BACK", reply = "Everyone expects less of a robe shop in a sewer, dear. I find it very useful.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hems = {
      lines = { { id = "h2_default", text = "I have, and I'll share a few. Bethor Iceshard wears his robes too long and trips on the stairs, the warlocks singe every cuff they own, and the apothecaries ought not to be allowed cloth at all, given what they spill on it." } },
      choices = {
        { text = "And the Dark Lady's court?", next = "hems2" },
        { text = "Does anyone here dress well?", next = "hems2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hems2 = {
      lines = { { id = "h3_default", text = "The Dark Lady wears leather and a hood, and wears them better than any queen I ever saw in silk, so I've nothing to say there. Sharlindra has no need of clothes at all, being a banshee, and I confess I envy her the saving." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wear = {
      lines = {
        { id = "w_default", text = "Something with a high collar and a sleeve cut close at the wrist, dear, so nothing drags through your reagents. You want a cloth that takes an enchantment, too, and not all of them will." },
        { id = "w_lock", when = { class = "WARLOCK" }, text = "For a warlock, dear, a dark wool that won't show scorching, and a sleeve cut close so your imp has nothing to swing from. I've lost good robes to imps." },
      },
      choices = {
        { text = "Which cloth takes an enchantment best?", next = "wear2" },
        { text = "Show me what you'd choose.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wear2 = {
      lines = { { id = "w2_default", text = "Silk, and after it the mageweave the goblins bring up from the south. Josef Gregorian will tell you the same if you ask him, since he's the one who has to lay the enchantment in, and he complains to me whenever a customer brings him sackcloth." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dal", text = "The Kirin Tor had the worst taste in sleeves of any order in the world, and the best cloth. A cruel combination." } },
    lordaeron = { { id = "tp_lord", text = "The capital had a draper on every corner, dear, and a ball every month to wear it all to. I try not to think about what's become of the ballroom." } },
    sylvanas = { { id = "tp_syl", text = "She dresses like a ranger still, and she's quite right to. One doesn't argue with a queen who looks like that in a hood." } },
    advice = { { id = "tp_ad", text = "Buy one good robe instead of three poor ones, dear, and keep it away from candles." } },
    _none = { { id = "tp_none", text = "I've no idea, dear, and frankly, no interest. Try a robe on instead." } },
  },
}

---------------------------------------------------------------------------
-- Sheldon Von Croy: cloth armor merchant in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_voncroy", id = TODO_NPC("Sheldon Von Croy"), name = "Sheldon Von Croy", title = "Cloth Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "pompous", "dry" }, values = { "status", "craft" },
  notices = { "class", "race" },
  impression = {
    first = "He still expects his name to open doors.",
    third = "{name} met Sheldon Von Croy, who sells cloth armor in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Sheldon Von Croy, at your service. Cloth armor, of quality, for those who appreciate it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've returned. A discerning customer, I see." },
    { id = "g_noble", when = { origin = "human_minor_noble" }, text = "Ah. You have the bearing of a house with a name, if I'm not mistaken. Von Croy, and I'm delighted to find manners still walking." },
  },

  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "A spellcaster. You'll want something that doesn't catch fire easily, I imagine. I have a few." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I shall thank you to keep your hands where a gentleman can see them. The quarter you want is two rings round, and it sells leather." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, at my counter. Your Warchief keeps a civil house, I'm told, and I'm prepared to extend the same courtesy to his people." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Von Croy, with a capital V, if you please. The family had lands in Lordaeron, once, and now I sell gloves and caps in a sewer, but one does maintain standards." },
        { id = "h_caster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } }, text = "Von Croy, with a capital V. You are a caster, I see, and so you'll understand that what I sell is armor in everything but weight, and that one does not economise on the thing between oneself and a crossbow." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Do go on." },
        { id = "h_again3", text = "You have my attention, such as it is at this hour." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What became of the family lands?", next = "lands" },
        { text = "Lucille sells robes nearby. Rivals?", next = "lucille" },
        { text = "How does a gentleman end up in trade?", next = "trade" },
        { text = "Cloth doesn't sound like much armor.", next = "cloth" },
        { text = "I remember the Von Croy name, I think.", next = "name", when = { race = "Scourge" } },
        { text = "Not today.", next = "END" },
      },
    },
    lands = {
      lines = { { id = "l_default", text = "Scourge, Crusade, Scourge again, and now I'm told nothing lives there at all. I haven't been to see, and I don't intend to; I'd rather remember the orchard than meet whatever's living in it." } },
      choices = {
        { text = "Wouldn't you want them back?", next = "lands2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lands2 = {
      big = true,
      lines = { { id = "l2_default", text = "The Dark Lady says all of Lordaeron is ours, and the old titles mean nothing. Some of us find that harder to accept than others. What would you tell me, {class}?" } },
      choices = {
        { text = "She's right. The old titles died with the kingdom.", next = "BACK", reply = "So they did, and here I am selling caps. You needn't be so cheerful about it.", fx = { align = { order = 1 } } },
        { text = "Keep your name. Nobody can take that.", next = "BACK", reply = "Quite right. Von Croy, capital V. Someone has to remember it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lucille = {
      lines = { { id = "lu_default", text = "Hardly. Mistress Castleton sells robes, which are for show, and I sell armor, which is for survival. We nod to each other, and that's quite enough." } },
      choices = {
        { text = "She'd say the same of you, I expect.", next = "BACK", reply = "She'd say it with more adjectives. She's very fond of adjectives." },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "t_default", text = "By rising from a ditch outside the capital with nothing but his name, as you ask. The Royal Overseer wrote down my former station, looked at my hands, and observed that I had never done a day's work, which I took as a compliment and he did not intend as one." } },
      choices = {
        { text = "So he found you a counter.", next = "trade2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade2 = {
      lines = { { id = "t2_default", text = "He found me a counter, and I found that I rather like it. One meets people, one keeps accounts, and nobody expects one to hunt. I would not say so to Mistress Castleton, who believes I suffer, and whose sympathy I enjoy." } },
      choices = {
        { text = "Your secret is safe with me.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "You've fallen a long way and landed well.", next = "BACK", reply = "I have landed, at any rate. One learns not to ask for more than that." },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "c_default", text = "Padded cloth turns a blade better than you'd credit, and it doesn't cook a man when the spells start flying. The caps and gloves on that shelf are quilted nine layers deep, and I have had them tested, though not personally." } },
      choices = {
        { text = "Tested by whom?", next = "cloth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth2 = {
      lines = { { id = "c2_default", text = "By Zane Bradford, the wand seller, who will shoot at anything if one asks him politely. He put three bolts into a quilted cap for me and it merely smouldered. I gave him the cap afterward, and he wears it, which does my trade no favours." } },
      choices = {
        { text = "I've seen the scorch marks on him.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "Do you indeed? Then you are the first in a year, and I'm obliged to you. We kept an orchard and a small hall east of the capital, and we were on nodding terms with rather better families than ourselves." } },
      choices = {
        { text = "I think I passed your orchard once.", next = "name2" },
        { text = "I only knew the name, not the house.", next = "name2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name2 = {
      lines = { { id = "n2_default", text = "Then let us leave it there, and let it stay as it was when you passed it. I shall tell you the apples were the best in Lordaeron, you will be good enough to agree, and neither of us need inquire what grows there now." } },
      choices = {
        { text = "The best in Lordaeron. I remember them.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lord", text = "It was a fine kingdom with a great many fine families in it. I was one of them, I'll have you know." } },
    sylvanas = { { id = "tp_syl", text = "Her Majesty was a general of Quel'Thalas and carries herself as one. I find it a great relief to be ruled by someone with posture." } },
    scarlet_crusade = { { id = "tp_sc", text = "Several of them were at school with my cousins, and they were tiresome then. Zeal has not improved them." } },
    advice = { { id = "tp_ad", text = "Stand up straight, pay your accounts, and never let them see you count your change." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beneath my notice." } },
  },
}

---------------------------------------------------------------------------
-- Zane Bradford: wand vendor in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_bradford", id = TODO_NPC("Zane Bradford"), name = "Zane Bradford", title = "Wand Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "eager", "nervous" }, values = { "knowledge", "craft" },
  notices = { "class", "profession" },
  impression = {
    first = "The scorch marks on his coat come from testing his own wands.",
    third = "{name} met Zane Bradford, who sells wands in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Wands! Mind where you point that one. Actually, mind where you point all of them." },
    { id = "g_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "A caster! You'll appreciate these. Every one tested, personally, some of them twice." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you! The one from before worked, then? Nothing came off? Good, good." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "ROGUE" } },
      text = "Oh, these won't work for you, I'm afraid. You need a bit of magic in you to make them go, and you'd only be waving a stick." },
    { id = "n_ench", cat = "profession", when = { profession = "Enchanting" },
      text = "You're an enchanter, aren't you? Your fingertips have that glow, or maybe I've been looking at wands too long. Could I ask you something about lesser magic wands, after?" },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Not wands for you, I'm afraid, but your bow's lovely. Does it ever fire backwards? No? How restful that must be." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zane Bradford, wands. I stock everything from a novice's twig to something with real bite, and I can tell you exactly how each one feels when it goes off, because I've felt it." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Zane Bradford, wands, and you're exactly who I stock them for! A caster with a good wand never has to stand about waiting for their strength to come back, and I can tell you the kick of every one on this wall." },
      },
      again = {
        { id = "h_again", text = "Anything else? Don't touch that one." },
        { id = "h_again2", text = "Go on, go on." },
        { id = "h_again3", text = "Yes? Oh, sorry, that was me, I leaned on one. Go on." },
      },
      choices = {
        { text = "Show me the wands.", next = "BUSINESS" },
        { text = "You test them all yourself?", next = "test" },
        { text = "Where do the wands come from?", next = "source" },
        { text = "Your coat is still smoking.", next = "coat" },
        { text = "What do the trainers here think of your wands?", next = "trainers" },
        { text = "I make wands myself, now and then.", next = "ench", when = { profession = "Enchanting" } },
        { text = "Not today.", next = "END" },
      },
    },
    test = {
      lines = { { id = "t_default", text = "Every one. It's the only way to know they work, and I can't feel the burns anymore, which makes me ideal for the job. My coat has suffered more than I have." } },
      choices = {
        { text = "Is that wise?", next = "test2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test2 = {
      big = true,
      lines = { { id = "t2_default", text = "Wise? Probably not. But somebody has to, and the apothecaries would charge me for the bandages. Should I stop, do you think?" } },
      choices = {
        { text = "Yes. Be careful with yourself.", next = "BACK", reply = "That's kind. I'll try, though the wands rarely agree.", fx = { align = { order = 1 } } },
        { text = "No. A merchant who knows his wares is rare.", next = "BACK", reply = "Exactly what I keep telling everyone! Thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "s_default", text = "Enchanters in the city make most of them, and some come up from the Magic Quarter's own students, practising. The students' wands are cheaper, and much more exciting." } },
      choices = {
        { text = "Exciting how?", next = "BACK", reply = "Sometimes they fire both ways. Buy the enchanters' ones, is my advice." },
        { text = "Something else.", next = "BACK" },
      },
    },
    coat = {
      lines = { { id = "c_default", text = "Is it? Oh, so it is. That'll be the fire wand from this morning, which was very lively. I've been through four coats this year, and Sheldon Von Croy has started selling me quilted ones, which smoulder instead of burning." } },
      choices = {
        { text = "He told me you shot at one of his caps.", next = "coat2" },
        { text = "You might stand further back.", next = "coat2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coat2 = {
      lines = { { id = "c2_default", text = "He asked me to! Three bolts, and it barely singed, so I'd recommend his caps to anyone. As for standing back, I did try testing them from across the room, but then I couldn't tell which wand had done what, and that's the whole point of testing." } },
      choices = {
        { text = "There's a method in it, I'll grant you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers = {
      lines = { { id = "tr_default", text = "They send me their students, so they can't mind too much. Pierce Shackleton says a wand is a crutch, but he buys his apprentices one each anyway, and Aelthalyste's priests over in the War Quarter buy more than anybody." } },
      choices = {
        { text = "Why would priests buy the most?", next = "trainers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers2 = {
      lines = { { id = "tr2_default", text = "Because a priest who's spent everything on mending the others still wants to hit something, I think. Father Lazarus came in himself once and tried six before he chose, and he was very polite about the one that went off in his sleeve." } },
      choices = {
        { text = "You do have an exciting shop.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ench = {
      lines = { { id = "e_default", text = "Do you really? Then you'll know about the rods and the dust, and you can tell me whether it's normal for a greater magic wand to hum before it's been charged. Josef Gregorian says it isn't, but he said it while backing away." } },
      choices = {
        { text = "It isn't normal. I'd put that one down.", next = "ench2" },
        { text = "Some of them hum. It's usually harmless.", next = "ench2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ench2 = {
      lines = { { id = "e2_default", text = "Right. Well, I'll put it in the bucket of sand with the others, to be safe. If you ever have spare wands of your own to sell, the auction house in the Trade Quarter is the place, and I'll very likely be the one who buys them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dal", text = "The best wands in the world came out of Dalaran, and I'd give a coat to see inside one of their workshops. I'd give two coats, actually; I've plenty of ruined ones." } },
    forsaken = { { id = "tp_fs", text = "Not feeling pain is terribly useful in my line. I do have to check myself for fires more often than I used to, though." } },
    advice = { { id = "tp_ad", text = "Never look down the end of a wand to see why it hasn't gone off. I mean that most sincerely." } },
    _none = { { id = "tp_none", text = "Sorry, wands only. Ask me about wands!" } },
  },
}

---------------------------------------------------------------------------
-- Sydney Upton: staff merchant in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_upton", id = TODO_NPC("Sydney Upton"), name = "Sydney Upton", title = "Staff Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "laconic", "dry" }, values = { "craft", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "He talks of wood grain like wine, and of little else.",
    third = "{name} met Sydney Upton, who sells staves in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Staves. Good wood, well cut. Have a look." },
    { id = "g_druid", when = { class = { "MAGE", "PRIEST", "WARLOCK", "SHAMAN", "DRUID" } }, text = "You'll want something to lean on and channel through. I've ash and yew both." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. The staff held up, then, or you'd have come back sooner." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people know wood, I'm told. Tell me what you think of the grain on that one." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You'll hear the wood better than I do, I expect. I'd take it kindly if you told me what the yew says." },
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "ROGUE" } },
      text = "You'd snap these over somebody's head inside a week. The War Quarter sells what you want." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sydney Upton. I sell staves to the Magic Quarter's casters, and I've learned more about wood since I died than I did in all the years before it." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK", "SHAMAN", "DRUID" } }, text = "Sydney Upton. You'll be wanting a staff that carries a spell as well as your weight, and I've a few that do both, though I'd have you hold one a while before you decide." },
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "Go on." },
        { id = "h_again3", text = "Take your time. The wood isn't in a hurry, and neither am I." },
      },
      choices = {
        { text = "Show me the staves.", next = "BUSINESS" },
        { text = "Where does the wood come from?", next = "wood" },
        { text = "Why learn wood after death?", next = "why" },
        { text = "How do you choose a staff for someone?", next = "choose" },
        { text = "You don't say much about your neighbours.", next = "neighbours" },
        { text = "The yew here is grieving, not twisted.", next = "druid", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "Not now.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Tirisfal yew, mostly, and some from Silverpine when the carts get through. Tirisfal wood is dark and twisted now, which casters seem to like, and it holds a charge better than you'd think." } },
      choices = {
        { text = "Twisted by the Plague?", next = "wood2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood2 = {
      big = true,
      lines = { { id = "w2_default", text = "Likely. The trees took sick the same as we did, and like us, they didn't die properly. Some of my customers won't touch Plague wood. Would you?" } },
      choices = {
        { text = "Gladly. It's the wood of our land now.", next = "BACK", reply = "Good answer. The yew and I have a lot in common.", fx = { align = { light = -1 } } },
        { text = "I'd rather have something clean.", next = "BACK", reply = "Silverpine, then, when it comes. It costs more, and it's worth less, but it's clean.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because I needed something to do with my hands that didn't involve remembering. Wood doesn't ask who you were." } },
      choices = {
        { text = "That's a good reason.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose = {
      lines = { { id = "c_default", text = "I watch how they stand. Somebody who leans wants ash, which gives a little and comes back. Somebody who plants their feet wants yew, which doesn't give at all, and will crack before it bends." } },
      choices = {
        { text = "And which am I?", next = "choose2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose2 = {
      lines = {
        { id = "c2_default", text = "You shift your weight while you're listening, so I'd say ash. Try the long one by the door, and if it feels like it's leaning back at you, that's the right one." },
        { id = "c2_tauren", when = { race = "Tauren" }, text = "You stand like a hill, so yew, and the heaviest I have. Most of my stock would be a walking stick to you, but there's a long one by the door that might answer." },
      },
      choices = {
        { text = "Let me try it.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = { { id = "n_default", text = "They talk enough for all of us. Zane Bradford sets fire to himself twice a week next door, and Lucille Castleton has told me my collar is wrong every day for a year. I nod, mostly." } },
      choices = {
        { text = "Is there anyone you do talk to?", next = "neighbours2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours2 = {
      lines = { { id = "n2_default", text = "Josef Gregorian, the enchanter, when he comes for staves to work on. He holds a length of wood and goes quiet for a while before he says anything, and that's a man I can deal with." } },
      choices = {
        { text = "Two quiet men in a loud quarter.", next = "BACK", reply = "It works well enough. We've said perhaps forty words this year, and all of them were useful.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "d_default", text = "Grieving. I'd not have put it that way, but I'll not say you're wrong. It grows slow and dark and it holds on to what's poured into it, and I'd thought that was only the sickness." } },
      choices = {
        { text = "It remembers what the land was.", next = "druid2" },
        { text = "The sickness and the grief are one thing.", next = "druid2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid2 = {
      lines = { { id = "d2_default", text = "Then I'll cut it with more care. I've only ever taken deadfall and storm-broken limbs, never a standing tree, and I'm glad of that now. Thank you for telling me, and I'll think on it for a good while." } },
      choices = {
        { text = "That's the right way to take it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lord", text = "It had good forests. I walked past them for thirty years and never looked at a tree properly." } },
    forsaken = { { id = "tp_fs", text = "We're like the yew. We stopped growing, and we hold what's put into us." } },
    advice = { { id = "tp_ad", text = "Oil a staff twice a year and never leave it standing in water. That's all it asks." } },
    _none = { { id = "tp_none", text = "Don't know. Ask me about wood." } },
  },
}

---------------------------------------------------------------------------
-- Morley Bates: fungus and drink vendor in the Magic Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_bates", id = TODO_NPC("Morley Bates"), name = "Morley Bates", title = "Fungus Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "gloomy", "wry" }, values = { "practical", "community" },
  notices = { "race", "profession", "class" },
  impression = {
    first = "He thinks it funny that his customers can't taste what he sells.",
    third = "{name} met Morley Bates, who sells fungus and drink in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Mushrooms and water. The finest the Undercity has to offer, which isn't saying much." },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "A living customer! You'll actually taste these. I'm almost jealous." },
    { id = "g_back", when = { metBefore = true }, text = "You came back for more, which either means they were good or you're not fussy. I shan't ask which." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Take the brown cap, not the spotted one. The spotted one is for us." },
    { id = "n_cook", cat = "profession", when = { profession = "Cooking" },
      text = "A cook. You'll find I'm no use to you at all, because Ronald Burch in the Trade Quarter sells the proper supplies, and all I have is what grows in the dark." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and you'll conjure your own water, I suppose. Every mage in this quarter does, and then they come to me anyway, because conjured bread tastes of nothing even to the living." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Morley Bates. I sell food to the dead, which is a joke I've been telling for so long that I've forgotten it isn't funny." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Morley Bates. You're alive, so you'll actually want what I sell, and you'll want to know which caps are for your sort. I keep those on the right, and I've only mixed them up the once." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm not going anywhere." },
        { id = "h_again2", text = "Go on." },
        { id = "h_again3", text = "Still here? Good. It's a long night, and they all are." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Why do the dead buy food?", next = "why" },
        { text = "Where do the mushrooms grow?", next = "grow" },
        { text = "Who else feeds this city?", next = "others" },
        { text = "You've a stall among mages and warlocks.", next = "quarter" },
        { text = "Which of these can the living eat safely?", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Not now.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Habit, mostly. Some of us still need a little something to keep the flesh together, and some just like to sit and chew, the way we used to. It passes the time." } },
      choices = {
        { text = "Is that sad, or comforting?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      big = true,
      lines = { { id = "w2_default", text = "Depends who you ask. The apothecaries call it a weakness, clinging to the living. I call it business. Which is it to you?" } },
      choices = {
        { text = "A weakness. We should let it go.", next = "BACK", reply = "Then you'll not be buying, I take it. Pity.", fx = { align = { light = -1 } } },
        { text = "A comfort. Let them have it.", next = "BACK", reply = "My thoughts exactly, and my purse agrees.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow = {
      lines = { { id = "gr_default", text = "In the dark, under the city, where the old cellars meet the sewers. They thrive on what the Undercity gives them, and I'd rather not say more than that." } },
      choices = {
        { text = "I won't ask.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Tawny Grisette sells mushrooms in the Trade Quarter, and hers are prettier than mine, I'll admit. Innkeeper Norman keeps a table for the living, and Jeremiah Payson sells cockroaches under the bridge, which I'm told are pets and not supper." } },
      choices = {
        { text = "You don't mind the competition?", next = "others2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others2 = {
      lines = { { id = "o2_default", text = "There's little enough to compete for. Tawny and I trade spores when one of our beds goes bad, and we've agreed that she takes the travellers off the zeppelin and I take the scholars, who forget to eat until they fall over." } },
      choices = {
        { text = "That's almost neighbourly.", next = "BACK", reply = "Don't tell anyone. We've a reputation for misery to keep up down here.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter = {
      lines = { { id = "q_default", text = "It's the only quarter where nobody remembers supper. The mage students study until they sway, and then one of Mistress Hatebringer's people sends down for a basket, and I put in the brown caps and a jug." } },
      choices = {
        { text = "And the warlocks?", next = "quarter2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter2 = {
      lines = { { id = "q2_default", text = "The warlocks buy for their imps, if you can believe it. Zeglo Kruptorr comes by with a face like a wet week and takes whatever's gone soft, because it's cheaper than the creatures eating his sleeves again." } },
      choices = {
        { text = "So even demons are customers.", next = "BACK", reply = "A sale's a sale. The imps complain less than the mages, as it happens." },
        { text = "Something else.", next = "BACK" },
      },
    },
    living = {
      lines = { { id = "l_default", text = "The brown caps and the pale flat ones, and nothing with spots. The spotted ones do no harm to us, because there's little left in us to harm, but an orc who ate one last spring saw his ancestors for two days." } },
      choices = {
        { text = "Was he all right afterwards?", next = "living2" },
        { text = "Some shamans would pay for that.", next = "living2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    living2 = {
      lines = { { id = "l2_default", text = "He came back for more, so I suppose he was. I wouldn't sell them to him, and he called me a coward, and I told him I'd died once already for other people's bad ideas and I'd not do it for his." } },
      choices = {
        { text = "A fair answer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "We don't need to eat, strictly, and most of us do it anyway. I've stopped trying to decide whether that's hope or habit." } },
    lordaeron = { { id = "tp_lord", text = "The capital had a market every morning, with cheeses. I think about the cheeses more than I think about the king." } },
    advice = { { id = "tp_ad", text = "If it glows, don't eat it. That's served me well in two lives." } },
    _none = { { id = "tp_none", text = "No idea. Want a mushroom?" } },
  },
}

---------------------------------------------------------------------------
-- Mirelle Tremayne: heavy armor merchant in the War Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_tremayne", id = TODO_NPC("Mirelle Tremayne"), name = "Mirelle Tremayne", title = "Heavy Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "blunt", "hard" }, values = { "strength", "practical" },
  notices = { "class", "kit", "profession" },
  impression = {
    first = "She has no patience for anyone who thinks armor is for show.",
    third = "{name} met Mirelle Tremayne, who sells heavy armor in the Undercity's War Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Mail and plate. If it's not heavy, it's not mine." },
    { id = "g_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "A fighter. Good; you'll know what you're looking at." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and still in one piece. Then the last lot did its job." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor's a disgrace. Fix it or replace it, and preferably the second." },
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You're in cloth. I've nothing you can lift, so try the Magic Quarter, and stay behind someone who shops here." },
    { id = "n_smith", cat = "profession", when = { profession = "Blacksmithing" },
      text = "A smith. Then look at the rivets before you look at the price, and tell me if you'd have done them better." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mirelle Tremayne. I sell armor to the War Quarter, and the War Quarter is hard on armor, so I sell a great deal of it." },
        { id = "h_fighter", when = { class = { "WARRIOR", "PALADIN" } }, text = "Mirelle Tremayne. You fight in the front, so I'll talk to you straight: everything on that wall has been hit before I'd sell it, and anything that dented went back to the forge." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Speak up." },
        { id = "h_again3", text = "Go on. I can talk and count stock." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "Do the Forsaken need heavy armor?", next = "need" },
        { text = "Who are your customers?", next = "customers" },
        { text = "Who forges what you sell?", next = "forge" },
        { text = "You size people up like a sergeant.", next = "sergeant" },
        { text = "What would you put on me?", next = "fit", when = { class = { "WARRIOR", "PALADIN", "SHAMAN", "HUNTER" } } },
        { text = "Not today.", next = "END" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "More than the living do. We don't heal the way they do, so every blow that lands stays landed. Plate keeps the pieces where they belong." } },
      choices = {
        { text = "Then why do some go without?", next = "need2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need2 = {
      big = true,
      lines = { { id = "n2_default", text = "Pride, or poverty, or both. Some think being dead makes them hard to kill. It doesn't. What do you think, {class}, is armor for cowards?" } },
      choices = {
        { text = "No. Only fools fight unarmored.", next = "BACK", reply = "Good. You'll live, or whatever we do, a while longer.", fx = { align = { honor = 1 } } },
        { text = "A real warrior doesn't need it.", next = "BACK", reply = "A real warrior is in pieces on the Crusade's doorstep. Buy the plate.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = { { id = "c_default", text = "Warriors from the trainers down the way, Deathguard who've outgrown their issue kit, and orcs who come through the city and find our plate fits better than they expected." } },
      choices = {
        { text = "Orcs, in Forsaken plate?", next = "BACK", reply = "Plate doesn't care who wears it, and neither do I, so long as they pay." },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge = {
      lines = { { id = "f_default", text = "James Van Brunt's forge, mostly, just across the quarter. His journeymen do the mail and he does the plate himself, and Velora Nitely does the pieces that have to be perfect, though you'll pay for her time." } },
      choices = {
        { text = "And you trust their work?", next = "forge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge2 = {
      lines = { { id = "f2_default", text = "I trust it after I've tested it. I hang every breastplate on that post and put a mace into it, and what cracks goes back with my compliments. Van Brunt swears at me for it, and his work's the better for the swearing." } },
      choices = {
        { text = "That's an honest way to sell armor.", next = "BACK", fx = { affinity = 1 } },
        { text = "He must dread seeing you.", next = "BACK", reply = "He does. I count that as part of my wages." },
        { text = "Something else.", next = "BACK" },
      },
    },
    sergeant = {
      lines = { { id = "s_default", text = "I was a quartermaster's wife in the old army, and I ran the stores better than he did. When I came back I knew what a soldier needs before he knows it himself, and I saw no reason to waste that." } },
      choices = {
        { text = "So you still serve an army.", next = "sergeant2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sergeant2 = {
      lines = { { id = "s2_default", text = "A better one. Angela Curthas and Christoph Walker drill the warriors down the way, and they send every recruit to me before the first march. I've turned some back to the yard, because I'll not fit plate on someone who can't yet stand in it." } },
      choices = {
        { text = "Do the trainers mind that?", next = "BACK", reply = "Curthas thanked me. Walker sulked for a day, and then he thanked me too." },
        { text = "Something else.", next = "BACK" },
      },
    },
    fit = {
      lines = {
        { id = "fi_default", text = "Mail on the body and something solid on the shoulders, since that's where the blows land when you're tired. Turn round and let me see how you carry your shield arm." },
        { id = "fi_plate", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 40 }, text = "Plate, all of it, and heavier than what you've got. You're strong enough to carry more than you're wearing, and the Scarlets swing maces, so the extra weight is worth it." },
      },
      choices = {
        { text = "Show me what you'd pick.", next = "BUSINESS" },
        { text = "I've managed well enough so far.", next = "fit2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fit2 = {
      lines = { { id = "fi2_default", text = "So has everyone, until the day they haven't. I'll not push you, but I've sold replacement kit to a good many who said those very words, and I recognised the dents." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_sc", text = "Good steel, well kept, and worn by fanatics. I'd buy their armory tomorrow if anyone would bring it to me." } },
    forsaken = { { id = "tp_fs", text = "We don't tire and we don't mend. That makes us good soldiers for one battle and poor ones for ten, unless we're armored." } },
    advice = { { id = "tp_ad", text = "Mend it before it breaks. Armor fails at the worst moment because that's the only moment it's being tested." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Buy something." } },
  },
}

---------------------------------------------------------------------------
-- Christopher Drakul: guild master in the Trade Quarter, among the bolts of tabard cloth.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_drakul", id = TODO_NPC("Christopher Drakul"), name = "Christopher Drakul", title = "Guild Master",
  bible = "bibles/more_folk.md", role = "clerk", tier = "service",
  communities = { "undercity" }, temper = { "formal", "dry" }, values = { "order", "community" },
  notices = { "race", "class", "level" },
  impression = {
    first = "He carries a priest's staff and never says why.",
    third = "{name} met Christopher Drakul, the guild master of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "A guild charter, perhaps? Or only browsing the cloth?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have you found your fellows yet?" },
    { id = "g_guild", when = { guild = true }, text = "You wear a company's colours already. Then you'll know my hand, since I very likely wrote your charter." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A charter from the Undercity carries the Dark Lady's seal, but it serves the whole Horde. You needn't be Forsaken to sign." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You have looked twice at my staff already, and I'd be obliged if we began with the business of charters." },
    { id = "n_new", cat = "level", when = { maxLevel = 12 },
      text = "You're newly risen, or newly arrived. There's no hurry to sign anything, because a name on a charter outlasts most things, and it ought to be chosen with care." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Christopher Drakul, guild master. I register companies, write charters, and keep the cloth for their tabards, and in a city of the dead, that's as close to a christening as we get." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Christopher Drakul, guild master. You are of the living Horde, and you're welcome at this desk, since the Warchief's people and the Dark Lady's sign the same parchment here and wear the same cloth." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Go on." },
        { id = "h_again3", text = "I am at your disposal. The ink will keep." },
      },
      choices = {
        { text = "I'd like to see about a guild.", next = "BUSINESS" },
        { text = "Why do the Forsaken form guilds?", next = "why" },
        { text = "You carry a priest's staff.", next = "staff" },
        { text = "What goes into a charter?", next = "charter" },
        { text = "You keep a great deal of cloth here.", next = "cloth" },
        { text = "What sort of companies sign here?", next = "companies" },
        { text = "I knew that staff's make, once.", next = "priest", when = { class = "PRIEST" } },
        { text = "Not today.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "For the same reason the living do: no one survives alone. The Forsaken came back without families, most of us, and a guild is a family you choose, with a tabard to prove it." } },
      choices = {
        { text = "Is a guild truly a family?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      big = true,
      lines = { { id = "w2_default", text = "Some are, and some are merely a convenience with a crest on it. I write the charter either way. Which sort would you make, {class}?" } },
      choices = {
        { text = "A family. Loyal to the last.", next = "BACK", reply = "Then I'll write it with care. Those are the charters that last.", fx = { align = { honor = 1 } } },
        { text = "A convenience. Loyalty is earned by results.", next = "BACK", reply = "Honest, at least. Those charters come back to me torn, usually, but they come back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    staff = {
      lines = { { id = "s_default", text = "I do. It was mine before, and it came back with me, which is more than most of my memories did. I find it steadies the hand when I sign." } },
      choices = {
        { text = "I won't pry.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    charter = {
      lines = { { id = "c_default", text = "A name, a founder, and the marks of those willing to stand with them. I ask for signatures before I'll seal it, because a company of one is only a person with a tabard, and I have seen enough of the dead standing alone." } },
      choices = {
        { text = "And once it's sealed?", next = "charter2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    charter2 = {
      lines = { { id = "c2_default", text = "Then it is entered in the city's rolls, a copy goes to Royal Overseer Bauhaus, and the company may carry its colours anywhere the Horde is welcome. I keep the original myself, in a dry chest, which is a rarer thing in this city than gold." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = { { id = "cl_default", text = "Every colour I can get, though the bright ones go slowly here. Merill Pleasance sells the finished tabards beside me, and between us we have dressed every company in Lordaeron, from the grand ones to the four friends who lasted a week." } },
      choices = {
        { text = "Which colours do the Forsaken choose?", next = "cloth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth2 = {
      lines = { { id = "cl2_default", text = "Black and purple, nine in ten, with a skull on it. I do not discourage them, but I admit to a small pleasure whenever some newly risen farmer asks for green and gold because those were his village's colours at the fair." } },
      choices = {
        { text = "I'd wear a village's colours gladly.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Black suits us better now.", next = "BACK", reply = "So most of them tell me. I cut the cloth as I am asked." },
        { text = "Something else.", next = "BACK" },
      },
    },
    companies = {
      lines = { { id = "co_default", text = "Soldiers, chiefly, who mean to take the fight to the Scarlets or the Scourge and want to know who stands beside them. Then there are merchants' leagues, and scholars from the Magic Quarter, and once a company of fishermen led by a student of Armand Cromwell." } },
      choices = {
        { text = "Fishermen need a charter?", next = "BACK", reply = "They needed a boat, and nobody would lend one to four strangers. They lent it to a guild.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "p_default", text = "Then you know more of it than I do. I recall a chapel with a blue door, and that I carried this up an aisle on feast days, and I can go no further than that without the rest slipping away." } },
      choices = {
        { text = "Have you asked the priests in the War Quarter?", next = "priest2" },
        { text = "Perhaps it's kinder not to chase it.", next = "priest2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest2 = {
      lines = { { id = "p2_default", text = "Father Lazarus has offered to sit with me and see what returns, and I have not yet accepted. I write other people's beginnings every day, and I find I am in no haste to read my own ending." } },
      choices = {
        { text = "It will keep until you're ready.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "We were raised as a mob and freed as a people. A people needs companies, rolls and records, and so here I sit." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's seal sits beside the Dark Lady's on every charter I write. I'm told he insisted, and I think the better of him for it." } },
    advice = { { id = "tp_ad", text = "Choose your company for who will come when you call at the worst hour. The crest matters a great deal less." } },
    _none = { { id = "tp_none", text = "That's not a matter of charters, I'm afraid." } },
  },
}
