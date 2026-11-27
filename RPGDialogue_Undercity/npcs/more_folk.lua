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
    d2_home = {
      lines = {
        { id = "d2_home_1", text = "Always. The Plaguelands lie a day's ride east, and every week my people count more of the Scourge's dead walking out of Andorhal and Stratholme. The Bulwark holds them for now, but holding is not the same as winning." },
      },
      choices = {
        { text = "What do your agents see there?", next = "d2_home2" },
        { text = "The Bulwark seems strong enough.", next = "d2_home2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_home2 = {
      lines = {
        { id = "d2_home2_1", text = "Necromancers coming and going from the school at Caer Darrow, and cultists with fresh faces recruited from the living. The Cult of the Damned is as busy in Lordaeron as it is in the Barrens, and I send the Dark Lady a list every week of who they've taken." },
      },
      choices = {
        { text = "A long list, I'd imagine.", next = "BACK", reply = "Long enough that I've stopped reading the names aloud. I still read them." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_bad = {
      lines = {
        { id = "d2_bad_1", text = "Expectation is a luxury, {class}, and I'd rather report what is than what I hope for. Every hopeful report I ever read in life came before a disaster, and the last of them came before the plague." },
      },
      choices = {
        { text = "Which report was that?", next = "d2_bad2" },
        { text = "A grim outlook.", next = "d2_bad2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_bad2 = {
      lines = {
        { id = "d2_bad2_1", text = "That the grain from Andorhal was safe, signed by a magistrate who had looked at it and seen nothing wrong. I was a clerk who filed that report, and I've filed my own reports very differently ever since." },
      },
      choices = {
        { text = "You couldn't have known.", next = "BACK", reply = "No one could, and that is the lesson. Assume the grain is poisoned, and you'll be wrong less often." },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    d2_voice = {
      lines = {
        { id = "d2_voice_1", text = "No, and anyone who says they do should be reported at once. What I hear is the silence where he was, and I listen to it every night, because the day it changes is the day I'll need to send my last report." },
      },
      choices = {
        { text = "Then listen for us both.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "Is the Scourge stirring closer to home?", next = "d2_home" },
        { text = "You don't seem to expect good news ever.", next = "d2_bad" },
        { text = "Do you still hear him, Brownell, in the quiet?", next = "d2_voice", when = { race = "Scourge" } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're early, for once, and I find I don't mind. Sit; we'll begin with something truly frightening." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You're late again, and unwelcome besides. Stand at the back and try not to summon anything." },
    { id = "g_default", text = "If you're not a warlock, you're in the wrong room, and if you are, you're late." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Another student. Show me what you've learned, and then I'll show you how little it is." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, which means you either learned something or forgot it, and we shall shortly see which." },
    { id = "g_taint", when = { class = "WARLOCK", taint = { min = 40 } }, text = "You reek of the Nether, student, the way a drunk reeks of the cask. Stand over there, downwind of my circles, until I've decided what to do about you." },
  },

  notice = {
    { id = "n_notlock", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You've the look of someone who prays. Pray quietly, please, because it distracts the imps." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Mistress Hatebringer's hall is further round the quarter, and she will tell you our art is a shortcut, though you'll notice she says it from a safe distance." },
    { id = "n_lock_pet", cat = "class", when = { class = "WARLOCK", minLevel = 10 },
      text = "Your demon is fidgeting, student. A servant that fidgets is a servant that has been allowed to think, and I do not recommend it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Luther Pickman. I teach the shadow and the flame to those with the stomach for them, and I am not patient with those without it." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Luther Pickman, and you may call me master while you study under me. You have already made your first pact, so the easy part is behind you, and everything I teach from here costs more." },
        { id = "h_lock_scourge", when = { class = "WARLOCK", race = "Scourge" }, text = "Luther Pickman. You spent a season as the Lich King's puppet, as did I, and I will not have a student of mine become anyone's puppet again, least of all a demon's, so you will work harder here than anywhere you have been." },
      },
      again = {
        { id = "h_again", text = "Well? I have other students waiting, and they are less interesting than you only by a little." },
        { id = "h_again2", text = "Ask, then, and be brief about it." },
        { id = "h_again3", text = "You are still here, so I assume there is another question. Ask it properly." },
      },
      choices = {
        { text = "A warlock should never lie to the demon he binds.", next = "BACK", reply = "Lie to it and it learns. Then it lies back, and better than you.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Deceive the demon. It would gladly deceive you first.", next = "BACK", reply = "It would, and it will. Make sure your lie is the better one.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Then teach me the lessons that cost more, master.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "My first summoning nearly went wrong.", next = "first", when = { class = "WARLOCK" } },
        { text = "Teach me to make them run.", next = "fear", when = { class = "WARLOCK" } },
        { text = "The Legion's servants serve us. Does the Legion know that?", next = "masters", when = { class = "WARLOCK", race = "Scourge" } },
        { text = "What makes a good warlock?", next = "good" },
        { text = "Do you work with the other trainers here?", next = "others" },
        { text = "This hall smells of brimstone and chalk.", next = "hall" },
        { text = "What do you think of the mages next door?", next = "mages" },
        { text = "My first summoning very nearly ate me alive.", next = "first", when = { class = "WARLOCK" } },
        { text = "I'll go.", next = "END" },
      },
    },

    good = {
      lines = { { id = "gd_default", text = "Control, before anything else. The fel will give you whatever you ask and take twice as much in return, and the warlock who lets it take is no warlock at all, only a meal with ambitions." } },
      choices = {
        { text = "And how does one keep control?", next = "good2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    good2 = {
      big = true,
      lines = { { id = "g2_default", text = "By never forgetting what you're touching. Some say the Forsaken are suited to this art because we've nothing left to lose, and I say that is exactly why we must be careful. Where do you stand, {class}?" } },
      choices = {
        { text = "Power is a tool. Use all of it.", next = "BACK", reply = "Then you'll be powerful, and briefly. I've buried students who thought as you do, for the second time.", fx = { align = { order = -1 } } },
        { text = "Discipline first. Power after.", next = "BACK", reply = "That answer might keep you alive long enough to be useful to me.", fx = { align = { order = 1 } } },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },

    fear = {
      lines = { { id = "fe_default", text = "Fear is the cheapest spell I teach and the most useful. You reach into a man and pull out the thing he's most afraid of, and hold it before his eyes, and he runs, and while he runs he is not hitting you." } },
      choices = {
        { text = "Does it work on the Scourge?", next = "fear2" },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },
    fear2 = {
      lines = { { id = "fe2_default", text = "On the Scourge it works less often than you'd like, since there is sometimes very little left in them to frighten, and you'll find that a humbling lesson. On the Scarlets it works beautifully, because they are afraid of nearly everything, which is why they shout so much." } },
      choices = {
        { text = "And on a Forsaken?", next = "BACK", reply = "Ask me again after you've tried it, and I'll tell you whether I'll still be teaching you." },
        { text = "The Scarlets it is.", next = "BACK", reply = "Good. Don't let one run into a second pack of them, because then you have three problems." },
      },
    },

    masters = {
      big = true,
      lines = { { id = "ma_default", text = "The Legion believes every warlock is a servant who hasn't yet noticed his collar. We wore a collar once, the Lich King's, and the Dark Lady broke it, and I will not see a student of mine buckle on another for the sake of a few more spells. Do you understand me?" } },
      choices = {
        { text = "I understand. I serve no master but her.", next = "BACK", reply = "Good. Then the demons serve you, and you serve the Dark Lady, and the order of it never changes.", fx = { align = { order = 1 } } },
        { text = "I serve no master at all, ever again.", next = "BACK", reply = "Then you'd better be very strong, because a warlock with no master is the first thing the Legion goes looking for.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    others = {
      lines = { { id = "o_default", text = "Richard Kerwin and I share this hall, and Kaal Soulreaper shares it when he isn't brooding, and Carendin Halgar keeps to his own studies with the demons. We disagree on method, but we agree that the Dark Lady's warlocks should be the best in the Horde." } },
      choices = {
        { text = "And are they?", next = "BACK", reply = "They will be, once they stop asking me questions and start practising." },
        { text = "What do you disagree about?", next = "others2" },
      },
    },
    others2 = {
      lines = { { id = "o2_default", text = "Kerwin thinks a careful student is a safe one, and Soulreaper thinks a frightened student is a safe one, and they are both half right, which is the most irritating way to be. I think a disciplined student is a safe one, and I have the fewest graves to prove it." } },
      choices = { { text = "I'll keep that in mind.", next = "BACK" } },
    },

    hall = {
      lines = { { id = "ha_default", text = "It smells of work, {class}. Every circle on this floor is redrawn each night by the acolytes, because a line a finger's width out of true is the difference between a servant and a visitor, and I do not entertain visitors." } },
      choices = {
        { text = "Who draws the circles?", next = "hall2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hall2 = {
      lines = { { id = "ha2_default", text = "The acolytes do, Zeglo Kruptorr chief among them, and he scowls through every stroke as though the chalk had insulted him. He wants a pact before he has earned one, and so he will scrub until wanting teaches him patience." } },
      choices = {
        { text = "He might surprise you one day.", next = "BACK", reply = "He might. I have a ward prepared for that day, and I advise you to stand behind it." },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },

    mages = {
      lines = { { id = "m_default", text = "Kaelystia Hatebringer and Pierce Shackleton teach a tidy art with tidy limits, and they look down the stairs at us for dealing with demons. I notice they are glad enough of a felhunter whenever a Scarlet spellcaster comes calling." } },
      choices = {
        { text = "So you work together when it counts.", next = "mages2" },
        { text = "They may have a point about demons.", next = "mages2", reply = "They may, and they may keep it on their side of the quarter." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    mages2 = {
      lines = { { id = "m2_default", text = "We serve the same queen, and neither of us forgets it. Bethor Iceshard keeps the peace of this quarter, and when he asks for warlocks I send him my best without argument, because a quarrel between halls is a luxury for cities that are not besieged." } },
      choices = {
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },

    first = {
      narr = "He sets down his chalk, which you suspect is the most attention he has given anyone today.",
      lines = { { id = "f_default", text = "Then you have learned the most useful lesson I teach, and you learned it without my help. Tell me what went wrong, briefly, and do not flatter yourself in the telling." } },
      choices = {
        { text = "I rushed the circle. I wanted it too badly.", next = "first2" },
        { text = "The imp whispered, and I listened far too long.", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      lines = { { id = "f2_default", text = "Of course you did, since every student does one or the other, and the ones who admit it are the ones I can teach. Carendin Halgar keeps the deeper rites further in, and when you are ready for a greater servant it is he who will test you, not I." } },
      choices = {
        { text = "I'll be ready for him, and for whatever he calls up.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "tp_legion", text = "We use their servants, and we do not serve them. Remember the difference, or the Legion will remember it for you." } },
    sylvanas = { { id = "tp_syl", text = "The Dark Lady asks for warlocks who obey her and fear nothing else. I supply them, and she has not yet had cause to complain of my work." } },
    scarlet_crusade = { { id = "tp_sc", text = "They burn us for what we are and would burn my students twice for what they study. It is one of the few subjects on which my demons and I are in perfect agreement." } },
    advice = { { id = "tp_ad", text = "Never summon anything while you are angry at it. The circle holds the demon, and nothing at all holds you." } },
    _none = { { id = "tp_none", text = "That is not my concern, and therefore not yours while you're in my hall." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. I've honed a fresh blade, and I'd let you try it on the next hide that comes in." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Keep your hands off my knives; I clean them, and I don't care to clean them twice." },
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
        { text = "Skin the beast quickly and cleanly. It's owed that much.", next = "BACK", reply = "Aye. A clean cut, and no waste. That's the whole of the craft.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Rip the hide off and sell it. The beast won't complain.", next = "BACK", reply = "It won't. But the hide will, in tears and holes, and so will your buyer.", fx = { align = { honor = -1 } } }, -- dp_stance
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
      lines = { { id = "k2_default", key = true, text = "I hone them myself, but the steel comes from Charles Seaton, who sells blades just along the canal. He sells them to cut-throats as well, and I've asked him to keep mine on a separate shelf, which he finds funnier than I do." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, a depositor I don't mind counting twice. Your vault, as always, is exactly as you left it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Speak clearly and slowly. I'll be counting every coin you hand me, and then again." },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you're back, and quiet on your feet. Those soles of mine are serving you well, I see." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll sell you boots, but I'd rather hear you coming, so don't expect my quietest pair." },
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
        { text = "Quiet boots are for scouts, not for creeping into honest homes.", next = "BACK", reply = "You'd be surprised who buys them, and I don't ask. Still, I like the sentiment.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Soft soles are for getting in and out of anywhere unnoticed.", next = "BACK", reply = "Exactly what they're for, and I'll not ask where you're going.", fx = { align = { honor = -1 } } }, -- dp_stance
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back. Good. I've a new crate of salt in. It's very good salt. It's salt." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Thread's there, salt's there. Take what you need and leave the counter as you found it." },
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
        { text = "Sell the full measure of salt, every time, to everyone.", next = "BACK", reply = "Yes. That's how I do it. It's dull, and it's right, and I'm proud of both.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Short the measure a little. Leatherworkers never weigh their salt.", next = "BACK", reply = "They do. I've seen them. They also come back with knives.", fx = { align = { honor = -1 } } }, -- dp_stance
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, the customer with the well-packed bags! I've a new one with five pockets, and I saved it for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again, with your things spilling out. I'll sell you a bag, but I can't help what you put in it." },
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
        { text = "Stitch a bag to last a lifetime, even if it costs a sale.", next = "BACK", reply = "And it will last two, down here. I've had customers come back dead.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Make bags that wear out. Then they have to buy another.", next = "BACK", reply = "Then they'll buy it from someone else, and blame me for the mess.", fx = { align = { honor = -1 } } }, -- dp_stance
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
      lines = { { id = "m2_default", key = true, text = "Especially the students' work! Dan Golthas sent me a satchel last month with the strap sewn on the inside, and I've kept it under the counter ever since. I show it to anyone who's having a worse day than mine." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, you're standing up straight already. Well done. Come in, I've a new robe in dreadful black." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Do try not to drag your hem through my shop this time." },
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
        { text = "A robe should be cut to the wearer, not to the fashion.", next = "BACK", reply = "Thank you. The fashion is mostly dreadful, and the wearer often worse.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Cut every robe the same, and let the buyer make it fit.", next = "BACK", reply = "And then they slouch to hide it. I won't have it, darling.", fx = { align = { honor = -1 } } }, -- dp_stance
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my discerning patron returns! I've a fine silk vest that I've kept back for someone of your quality." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The Von Croy name has standards, and I'm sorry to say you've fallen beneath them." },
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
        { text = "A good name should be earned again by every generation.", next = "BACK", reply = "Quite so. The Von Croys have always earned it, and I continue to.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good name opens doors. Use it while people still remember.", next = "BACK", reply = "They remember less each year, I'm afraid. Still, the doors aren't all shut yet.", fx = { align = { honor = -1 } } }, -- dp_stance
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are! Mind the blue one; it's new, and I've only singed myself twice with it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Point that one away from me, and keep it pointed away until you're gone." },
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
        { text = "Test every wand before you sell it, scorches and all.", next = "BACK", reply = "That's why my coat looks like this. It's a merchant's honour.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell them untested. If one backfires, that's the buyer's lesson.", next = "BACK", reply = "Lessons like that end with customers who can't come back to complain.", fx = { align = { honor = -1 } } }, -- dp_stance
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again. I've a staff of Tirisfal ash, close grain, and I thought of you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Look, if you must. Don't touch the grain." },
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
        { text = "Cut only the dead wood. Let the living trees stand.", next = "BACK", reply = "Yes. Dead wood is sweeter anyway, if you ask me. Like most things here.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Fell the whole grove. Wood is wood, however it's got.", next = "BACK", reply = "Wood is not wood. Grain matters, and so does how it was taken.", fx = { align = { honor = -1 } } }, -- dp_stance
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you! I've saved you the freshest mushroom in the city, which means it's only mildly sad." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The water's free from the canal, if you'd rather not pay for mine." },
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
        { text = "Sell clean water to the living, even if the dead can't tell.", next = "BACK", reply = "Too right. The orcs drink it too, and I'd hate to poison an ally.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Fill the bottles from the canal. The dead won't taste it.", next = "BACK", reply = "The dead won't, but our living friends will, and they'll complain to the Dark Lady.", fx = { align = { honor = -1 } } }, -- dp_stance
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
      lines = { { id = "o_default", key = true, text = "Tawny Grisette sells mushrooms in the Trade Quarter, and hers are prettier than mine, I'll admit. Innkeeper Norman keeps a table for the living, and Jeremiah Payson sells cockroaches under the bridge, which I'm told are pets and not supper." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. I've a hauberk that'll stop a Scarlet bolt, and I want it on someone who'll use it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Mail and plate are there. Don't ask me about the shiny ones; I don't sell for show." },
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
        { text = "Armour should be built to keep a soldier alive, not to impress.", next = "BACK", reply = "Exactly that. Polish doesn't stop a sword. Good rivets do.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Make it shine. Looking dangerous wins half the fight.", next = "BACK", reply = "And the other half is won by the fellow with heavier plate.", fx = { align = { honor = -1 } } }, -- dp_stance
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back. I've a charter ready for you whenever your guild cares to sign." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll take your fee and file your papers, nothing more." },
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

---------------------------------------------------------------------------
-- Bragor Bloodfist: the Warchief's orc in the Royal Quarter, watching the Forsaken and the Scourge alike.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_bragor", id = TODO_NPC("Bragor Bloodfist"), name = "Bragor Bloodfist",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "blunt", "watchful" }, values = { "honor", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "Bragor Bloodfist stands in the Dark Lady's throne room as the Warchief's eyes, and he does not pretend to be comfortable there. He trusts the Forsaken to fight the Scourge and very little further than that.",
    third = "{name} met Bragor Bloodfist, the orc Thrall posted to the Royal Quarter of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Speak, {class}, and keep it short. I stand a long watch in this room, and I don't spend it on idle talk." },
    { id = "g_orc", when = { race = "Orc" }, text = "Lok'tar, {class}. It's good to hear a voice in here that has breath behind it." },
    { id = "g_books", when = { questActive = TODO_QUEST("The Power to Destroy...") }, text = "The books from Ragefire, do you have them? Hand them to me, and to nobody else in this city." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, I remember who's useful." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. I've watched what that craft did to my people, so understand me: I'll judge you by what you do with it, and I'll be watching while you do." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's own. You fight well, your kind, and I've said so to the Warchief. I've said a few other things to him as well." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Bragor Bloodfist. The Warchief sent me to stand beside the Dark Lady's throne, and so I stand, and I listen, and what I hear goes back to Orgrimmar." },
        { id = "h_before", when = { minLevel = 13, questBefore = TODO_QUEST("The Power to Destroy...") }, text = "Listen up, {class}. Orgrimmar has a nest of Shadow Council cultists in Ragefire Chasm, the Searing Blade, and they hold two books I want out of their hands. I'll not trust it to the grunts there, and I'll not have those books fall to anyone in this city either." },
        { id = "h_malcin", when = { questActive = TODO_QUEST("An Unholy Alliance") }, text = "That scroll carried a Scourge seal I last saw in Northrend. The one who wrote it, Malcin, waits outside Razorfen Downs, and I want him dead before his offer reaches any ear that might listen." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Power to Destroy...") }, text = "The books are locked away, and the Searing Blade is weaker for it. There's always something that needs doing here, so check back with me." },
      },
      again = {
        { id = "h_again", text = "What else? Say it plainly." },
        { id = "h_again2", text = "Go on. The dreadlord's listening anyway, so you may as well speak up." },
        { id = "h_again3", text = "Hrm. Ask." },
      },
      choices = {
        { text = "Why does Thrall keep a watchman here?", next = "watch" },
        { text = "What are these books in Ragefire?", next = "books" },
        { text = "You were in Northrend?", next = "north" },
        { text = "You stand ten paces from a dreadlord.", next = "dread" },
        { text = "How does an orc bear this place?", next = "orc", when = { race = "Orc" } },
        { text = "Do you trust us at all?", next = "trust", when = { race = "Scourge" } },
        { text = "Strength and honor, Bragor.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Because an ally you never look at is an ally you don't know. The Forsaken joined the Horde because they had nowhere else to go, and the Warchief took them in with his eyes open. I'm the eyes." } },
      choices = {
        { text = "And what have you seen?", next = "watch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch2 = {
      big = true,
      lines = { { id = "w2_default", text = "Soldiers who don't break, and apothecaries who never say what they're brewing. I report both. The Dark Lady has never once asked what I send to Orgrimmar, and I've not decided whether that's honesty or contempt." } },
      choices = {
        { text = "Allies deserve trust. You insult them by spying.", next = "BACK", reply = "Trust is earned on the field, and they're earning it. The watching stays until they've finished.", fx = { align = { honor = 1 } } },
        { text = "You're right to watch. They hide too much.", next = "BACK", reply = "Then keep your own eyes open down here, and tell me what the apothecaries won't.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    books = {
      lines = { { id = "b_default", text = "Spells of Shadow and Incantations from the Nether. They're Shadow Council work, the same poison that chained my people to demons, and the Searing Blade are orcs who've learned nothing from it." } },
      choices = {
        { text = "Why bring them to you and not burn them?", next = "books2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    books2 = {
      lines = { { id = "b2_default", text = "Because the Warchief will want to know what's in them before they burn, and because I'd sooner hold them than wonder where they went. The last thing the Horde needs is a strong Shadow Council rising again, here or anywhere." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    north = {
      lines = { { id = "n_default", text = "I've seen the Lich King's work closer than I ever wanted to, and that's all I'll say of it. It's enough that I know a Scourge seal when I see one, and I know how they talk when they want something." } },
      choices = {
        { text = "How do they talk?", next = "north2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    north2 = {
      lines = { { id = "n2_default", text = "Politely. They offer power, and lands, and ask only for a little freedom to act. Every word of it is a hook. The day someone in this room answers one of those letters is the day I stop standing and start swinging." } },
      choices = {
        { text = "I'd swing beside you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dread = {
      lines = { { id = "d_default", text = "I do, and I've never turned my back to him. The Dark Lady says Varimathras serves her, and she may be right. I fought the Legion, {class}, and I've yet to meet a demon who served anyone but the Legion for long." } },
      choices = {
        { text = "Does he know you think so?", next = "BACK", reply = "He knows. He smiles about it. I let him, and I keep my axe where I can reach it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "o_default", text = "Badly. There's no sky, the air tastes of the grave, and nothing here laughs. But the Warchief asked it of me, and I've stood worse posts for worse masters, back when we had masters. I'll stand this one until he calls me home." } },
      choices = {
        { text = "Durotar remembers you, brother.", next = "BACK", reply = "Then tell them at the gates of Orgrimmar that Bloodfist still holds his post. That's all I want said.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "I trust you to hate the Scourge, because I've seen it in every one of you. I trust your blades. What I don't know is what your people want when the Scourge is gone, and I don't think you all want the same thing." } },
      choices = {
        { text = "We want to be left to exist.", next = "BACK", reply = "I believe that of you. Say it loudly, and often, where your apothecaries can hear.", fx = { affinity = 1 } },
        { text = "We want what we're owed.", next = "BACK", reply = "Hrm. That's the answer that keeps me standing here. At least you gave it to my face." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    thrall = { { id = "tp_thrall", text = "He broke our chains and gave us a home. When he says stand in a tomb and watch, I stand in a tomb and watch." } },
    sylvanas = { { id = "tp_syl", text = "A general, and a good one. She's never lied to me that I've caught, and I've been trying to catch her." } },
    scourge = { { id = "tp_scourge", text = "They want Kalimdor next. They'll not have it while I've an arm to lift." } },
    burning_legion = { { id = "tp_legion", text = "We drank their blood once. I'll die before I see an orc kneel to that again." } },
    _none = { { id = "tp_none", text = "That's not my watch. Ask someone with time to gossip." } },
  },
}

---------------------------------------------------------------------------
-- Genavie Callow: lost her family and estate, then her last heirlooms to the Dabyries; wants their heads.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_genavie", id = TODO_NPC("Genavie Callow"), name = "Genavie Callow",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "bitter", "proud" }, values = { "vengeful", "status" },
  notices = { "class", "origin" },
  impression = {
    first = "Genavie Callow lost her family to the plague and her estate to looters, and the last of her heirlooms to a farming family called Dabyrie. She talks of nothing else, and she no longer wants the heirlooms back.",
    third = "{name} met Genavie Callow in the Trade Quarter, a Forsaken gentlewoman who wanted a family of thieves dead.",
  },

  greetings = {
    { id = "g_default", text = "Don't stand so close, I've had quite enough taken from me already." },
    { id = "g_active", when = { questActive = TODO_QUEST("To Steal From Thieves") }, text = "Well? Have you been to Arathi? I want all three heads, and I want hers most of all." },
    { id = "g_done", when = { questDone = TODO_QUEST("To Steal From Thieves") }, text = "My figure of vengeance returns. I slept the better for it, or I would have, if I slept." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've a thief's hands. I ought to send you away, but the plain truth is that I need someone with exactly those." },
    { id = "n_noble", cat = "origin", when = { origin = "human_minor_noble" },
      text = "You were raised in a house with a name, I can hear it. Then you'll understand what it means to have the family silver sold off a cart by a farmer's brat." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Genavie Callow. I had a family, and the plague took it, and I had an estate, and the war burned it. What little I carried out with me was stolen afterwards, and I know exactly who has it." },
        { id = "h_before", when = { minLevel = 30, questBefore = TODO_QUEST("To Steal From Thieves") }, text = "The harlot Kenata Dabyrie still lives, {class}, with her family healthy and prospering on a farm in Arathi while I rot in a sewer. I don't care about the things they stole any more. What I want now are their heads." },
        { id = "h_done", when = { questDone = TODO_QUEST("To Steal From Thieves") }, text = "With that cow dead, and her brood with her, I find I can think about other things. I hope you looted the farmstead after you'd finished, because I'd hate to think of it going to waste." },
      },
      again = {
        { id = "h_again", text = "What is it now?" },
        { id = "h_again2", text = "Go on. I've nothing left to do but talk and wait." },
        { id = "h_again3", text = "Yes? Do get on with it." },
      },
      choices = {
        { text = "Who are the Dabyries?", next = "dabyrie" },
        { text = "What did they take from you?", next = "taken" },
        { text = "What was the Callow estate like?", next = "estate" },
        { text = "Where is this farmstead?", next = "where" },
        { text = "I've lost a house and a name myself.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "I'll leave you to your grievances.", next = "END" },
      },
    },
    dabyrie = {
      lines = { { id = "d_default", text = "Farmers. Kenata was a tenant's wife on land that bordered ours, and she curtsied to my mother every market day. When the plague came, she and her children Fardel and Marcel went through our house before the ashes were cold." } },
      choices = {
        { text = "They robbed the dead, then.", next = "dabyrie2" },
        { text = "Desperate people take what they can carry.", next = "dabyrie2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dabyrie2 = {
      big = true,
      lines = { { id = "d2_default", text = "They robbed me, and I was not yet dead enough for their liking. Now they farm in the Arathi Highlands under Stromgarde's protection, alive and fat, with my family's things on their shelves. And I'm told the world calls us the monsters." } },
      choices = {
        { text = "They'll pay for it. All three.", next = "BACK", reply = "Yes. Say it again, slowly. It's the first pleasant thing I've heard this year.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Heirlooms aren't worth three lives, Genavie.", next = "BACK", reply = "They are worth precisely three, and I have counted. Keep your mercy for someone who was shown some.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    taken = {
      lines = { { id = "t_default", text = "A locket of my mother's, my father's signet, and a set of silver spoons that had been in the family since King Terenas was a boy. They were all I'd saved, and I'd sewn them into my hem." } },
      choices = {
        { text = "And you no longer want them back?", next = "taken2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taken2 = {
      lines = { { id = "t2_default", text = "What would I do with spoons? I can't eat. I can't wear a locket without it falling through my collarbone. No, the things are spoiled now that she's handled them, and all I want is to know she has stopped breathing." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    estate = {
      lines = { { id = "e_default", text = "A stone house with a walled garden, an hour's ride from the capital. We were not a great family, but we were a known one, and we kept eleven servants. I couldn't tell you now what colour the drawing room was, and it torments me." } },
      choices = {
        { text = "Is anything left of it?", next = "estate2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    estate2 = {
      lines = { { id = "e2_default", text = "A chimney, I'm told. Sheldon Von Croy, who sells caps in the Magic Quarter, rode past it once and was kind enough to lie about how it looked. He is a pompous man, but he knew to lie, and I've thought better of him since." } },
      choices = {
        { text = "That was a kindness.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = {
        { id = "wh_default", text = "The Dabyrie Farmstead, in the Arathi Highlands, north and east of the Alliance camp they call Refuge Point. You'll know it by the smug look of the place." },
        { id = "wh_active", when = { questActive = TODO_QUEST("To Steal From Thieves") }, text = "North and east of Refuge Point, as I told you. Kenata keeps to the house, and her whelps work the fields. Bring me all three heads." },
      },
      choices = {
        { text = "The Alliance will defend them.", next = "BACK", reply = "Then go around the Alliance. I'm told that people of your sort are good at that." },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble = {
      lines = { { id = "no_default", text = "Then you know. It isn't the money, is it? It's that nobody will ever again know who you were without being told, and that the telling sounds like boasting." } },
      choices = {
        { text = "That's it exactly.", next = "BACK", reply = "Well. It is something to be understood, even down here. Sit a moment, if you like.", fx = { affinity = 1 } },
        { text = "I let the name go. It was only a name.", next = "BACK", reply = "How fortunate for you. Mine is all I have, and I intend to keep it sharp." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lord", text = "It was a kingdom in which people knew their place, and mine was a good one. I see no reason to pretend I don't miss it." } },
    forsaken = { { id = "tp_fs", text = "Forsaken indeed. The word might have been cut to my measure." } },
    background = { { id = "tp_bg", text = "A daughter of the Callows, of Lordaeron. You won't have heard of us, and that is precisely my complaint." } },
    syndicate = { { id = "tp_syn", text = "Half of them are gentry gone to seed. I knew two of their mothers, and I'm not in the least surprised." } },
    sylvanas = { { id = "tp_syl", text = "She at least understands a grievance. I'm told she has kept hers very carefully." } },
    _none = { { id = "tp_none", text = "I neither know nor care. I've one subject, and you've heard it." } },
  },
}

---------------------------------------------------------------------------
-- Oran Snakewrithe: the Magic Quarter's scholar of the Witherbark trolls; wants the Highvale elves kept isolated.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_oran", id = TODO_NPC("Oran Snakewrithe"), name = "Oran Snakewrithe",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "precise", "cool" }, values = { "knowledge", "loyal" },
  notices = { "race", "class" },
  impression = {
    first = "Oran Snakewrithe studies the Witherbark trolls of the Hinterlands from a desk in the Magic Quarter, and she guards that knowledge jealously. She would rather burn another scholar's notes than see them shared with the Alliance.",
    third = "{name} met Oran Snakewrithe, a Forsaken scholar of the Witherbark trolls in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_default", text = "One moment. There, the line is finished. Now, what do you want of me?" },
    { id = "g_tablet", when = { questActive = TODO_QUEST("Rin'ji's Secret") }, text = "Well, now, what is this you're carrying? Set it down where the light is better." },
    { id = "g_lines", when = { questActive = TODO_QUEST("Lines of Communication") }, text = "Keeping the Highvale elves isolated is the key. Have you found the lodge?" },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. I mean no offence when I say your Witherbark cousins interest me more, since yours is a tribe that still writes its own history." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You'll have been taught that troll script is crude. It isn't, and I can show you a Witherbark tally that would shame a Dalaran ledger." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You've spent time in wild country. Good. I may ask you presently how tall a Hinterlands troll stands, since my sources disagree by a full head." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Oran Snakewrithe. I study the Witherbark trolls of the Hinterlands, their marks and their movements, and I am told I'm the best authority this side of the mountains. I see no reason to dispute it." },
        { id = "h_before", when = { minLevel = 43, questBefore = TODO_QUEST("Lines of Communication") }, text = "The Quel'Danil Lodge is where the high elves of the Hinterlands keep everything they know of the Witherbark, and they have begun sharing it with other races. We don't need the Highvale building alliances, {class}. I want their documents burned." },
        { id = "h_tablet_done", when = { questDone = TODO_QUEST("Rin'ji's Secret") }, text = "That tablet of Rin'ji's was quite unusual, and I am still working through the last of its markings. You did well to bring it to me, and not to someone who would only have admired it." },
      },
      again = {
        { id = "h_again", text = "Yes? I can spare you another question." },
        { id = "h_again2", text = "Go on, but be exact. I dislike vague questions." },
        { id = "h_again3", text = "Ask. My ink is drying in any case." },
      },
      choices = {
        { text = "Why the Witherbark, of all tribes?", next = "wither" },
        { text = "What have the Highvale elves done to you?", next = "highvale" },
        { text = "How does one study trolls from a cellar?", next = "method" },
        { text = "I can read some of those marks for you.", next = "troll", when = { race = "Troll" } },
        { text = "I've been among the Witherbark. They aren't what you think.", next = "been", when = { minLevel = 42 } },
        { text = "I'll leave you to your notes.", next = "END" },
      },
    },
    wither = {
      lines = { { id = "w_default", text = "Because they hold the southern Hinterlands and the ruins of Zun'watha and Shadra'Alor, and nobody has troubled to learn why. They keep to themselves, they trade with no one, and they have a hatred of elves that I find instructive." } },
      choices = {
        { text = "Instructive how?", next = "wither2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wither2 = {
      lines = { { id = "w2_default", text = "A people who hate the same enemy for three thousand years have learned things about that enemy. The Witherbark know how the high elves build, patrol and retreat, and all of it is cut into their tablets for anyone with the patience to read." } },
      choices = {
        { text = "You'd use the trolls against the elves.", next = "BACK", reply = "I would use a book against the elves, if it were heavy enough. The trolls are simply a better book." },
        { text = "Something else.", next = "BACK" },
      },
    },
    highvale = {
      lines = { { id = "h2_default", text = "Nothing, yet. They are a remnant, living at a lodge and writing reports. But they are writing them for the dwarves of Aerie Peak and whoever else will listen, and a remnant with allies does not stay a remnant." } },
      choices = {
        { text = "So you'd burn a library to keep them alone.", next = "highvale2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    highvale2 = {
      big = true,
      lines = { { id = "h3_default", text = "Three sets of documents, {class}, and not a library. I am a scholar, and I don't say this lightly, but knowledge shared with our enemies is knowledge turned upon us. While they recover what was lost, we close the lines further." } },
      choices = {
        { text = "Knowledge shouldn't be burned, even theirs.", next = "BACK", reply = "A pretty principle. I held it too, until Dalaran shut its gates on me with my own books inside.", fx = { align = { order = -1 } } },
        { text = "The Dark Lady's interests come before any archive.", next = "BACK", reply = "Just so. I shall copy what is useful first, naturally. One isn't a barbarian.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    method = {
      lines = { { id = "m_default", text = "Through other people's feet. The Horde keeps a village of Revantusk trolls on the Hinterlands coast, and their traders send me rubbings and sketches. Deathstalkers bring the rest, when they remember that I asked." } },
      choices = {
        { text = "Wouldn't you rather go yourself?", next = "method2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    method2 = {
      lines = { { id = "m2_default", text = "I should like nothing better. But the Apothecary Society has first call on every escort that leaves this city, and a scholar of trolls ranks somewhere beneath a crate of jars. So I sit, and I wait for travellers such as you." } },
      choices = {
        { text = "I'll bring you whatever I find out there.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "Can you! Then look at this one, the hooked stroke beneath the tally. I have it as a count of the dead, and a Revantusk trader swore it means a debt. Which is it?" } },
      choices = {
        { text = "Both. A death is a debt, to a troll.", next = "BACK", reply = "Both. Of course it is both. That resolves four tablets at a stroke, and I am most sincerely obliged to you.", fx = { affinity = 1 } },
        { text = "It's a boast. Whoever carved it was lying.", next = "BACK", reply = "A lying tablet! I had not allowed for vanity. How very like the living, and how tiresome for my index.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    been = {
      lines = { { id = "be_default", text = "Then you have the advantage of me, and I'll hear it. Tell me one thing you saw with your own eyes, and I'll tell you whether my tablets agree." } },
      choices = {
        { text = "They keep prisoners alive, for reasons of their own.", next = "BACK", reply = "That agrees with Rin'ji's account, and with nothing else I have. I'll mark it as confirmed, on your word.", fx = { affinity = 1 } },
        { text = "They're fewer than your tallies say.", next = "BACK", reply = "Then the tallies count their dead among the living. That is worth knowing, and I thank you for it.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dal", text = "I had a carrel in its library and eleven years of notes. The carrel is behind the dome, and I've rebuilt the notes from memory, twice." } },
    kirin_tor = { { id = "tp_kt", text = "They prize knowledge until it is held by someone inconvenient. I have learned from their example." } },
    advice = { { id = "tp_ad", text = "Write down what you see before you decide what it means. Most error comes from doing those in the wrong order." } },
    forsaken = { { id = "tp_fs", text = "Death has been excellent for my concentration. I recommend it to no one, but I note the effect." } },
    _none = { { id = "tp_none", text = "That lies outside my field, and I don't speculate outside my field." } },
  },
}

---------------------------------------------------------------------------
-- Apothecary Keever: Faranell's assistant, damaged by his first death; turns caged subjects into animals and speaks of himself as Keever.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_keever", id = TODO_NPC("Apothecary Keever"), name = "Apothecary Keever",
  bible = "bibles/more_folk.md", role = "scholar", tier = "service",
  communities = { "undercity", "apothecarium" }, temper = { "muttering", "fussy" }, values = { "curious", "loyal" },
  notices = { "profession", "class", "race" },
  impression = {
    first = "Apothecary Keever tests serums on caged subjects in the Apothecarium and is disappointed, each time, by the small animal that results. He speaks of himself as Keever, as if he were his own assistant.",
    third = "{name} met Apothecary Keever, Master Faranell's muttering assistant in the Apothecarium.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it is you. Keever is pleased. Keever will even let you stand a little nearer the vials today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Keever has not forgotten. Stand far over there, by the cages." },
    { id = "g_default", text = "Hmm? Oh. Keever did not send for anyone. Stand over there, away from the vials, and Keever will attend to you presently." },
    { id = "g_back", when = { metBefore = true }, text = "It is the one from before. Keever remembers, and Keever does not remember many." },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "A living one, and walking about loose! Keever was not told of a new subject. No? A visitor. How disappointing." },
  },

  notice = {
    { id = "n_alch", cat = "profession", when = { profession = "Alchemy" },
      text = "Those are an alchemist's stains. Keever approves. Perhaps the visitor can tell Keever whether earthroot weakens a transmuting serum, because Keever has begun to suspect it." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Mages make sheep with a word and a wave, and Keever needs three vials and a subject. Keever finds this unjust." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "So large! Keever wonders what the serum would make of so much subject. No, no, Keever only wonders. Keever has been told not to wonder aloud at guests." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "This is Apothecary Keever, assistant to Master Faranell, of the Royal Apothecary Society. Keever is seeking a serum that will make a weapon of great power out of a prisoner, and so far Keever has made a frog." },
        { id = "h_alch", when = { profession = "Alchemy" }, text = "Apothecary Keever, and the visitor is of the craft, so Keever will speak plainly. Three batches, three subjects, and not one result of any military value. Keever is most unhappy." },
      },
      again = {
        { id = "h_again", text = "Yes, yes. Keever is listening with one ear." },
        { id = "h_again2", text = "Another question. Keever will allow it, while the third batch settles." },
        { id = "h_again3", text = "Speak, then, before the subject wakes." },
      },
      choices = {
        { text = "What exactly are you trying to make?", next = "weapon" },
        { text = "Who are the subjects in the cages?", next = "subjects" },
        { text = "Why do you speak of yourself that way?", next = "keever" },
        { text = "You work under Master Faranell.", next = "master" },
        { text = "You've added too much earthroot.", next = "earth", when = { profession = { "Alchemy", "Herbalism" } } },
        { text = "I'll leave Keever to his work.", next = "END" },
      },
    },
    weapon = {
      lines = { { id = "w_default", text = "Something large, with teeth. The Dark Lady has enemies with armies, and Keever reasoned that a prisoner might be turned into a beast and sent back among his own. It is a sound idea, and only the serum disagrees." } },
      choices = {
        { text = "What has the serum produced so far?", next = "weapon2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weapon2 = {
      lines = { { id = "w2_default", text = "A frog, a rabbit, a snake of no great size, and yesterday a sheep. Did Keever ask for a sheep? Keever wanted a weapon of great power, and all he got was a sheep. It is still in the cage, and it looks at Keever." } },
      choices = {
        { text = "Perhaps a larger dose.", next = "BACK", reply = "A larger dose! Keever had thought the same. The visitor has the makings of an apothecary." },
        { text = "Perhaps the idea itself is wrong.", next = "BACK", reply = "The idea is Keever's, and so it cannot be wrong. It is the earthroot. Keever is nearly sure of it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    subjects = {
      lines = { { id = "s_default", text = "Scarlet zealots, mostly, brought in by the Deathstalkers, and a few others who were found where they ought not to have been. Keever does not ask their names, as it makes the notes untidy." } },
      choices = {
        { text = "They're people, Keever.", next = "subjects2" },
        { text = "Better them than us.", next = "subjects2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    subjects2 = {
      big = true,
      lines = { { id = "s2_default", text = "They were people who would have burned Keever, and now they are subjects, and soon they will be something small with fur. Master Faranell says there is no cruelty in science, only results. Does the visitor say otherwise?" } },
      choices = {
        { text = "I do. A prisoner is not a reagent.", next = "BACK", reply = "Keever will write that down under objections. It is a short page, and the visitor is the second entry.", fx = { align = { light = 1 } } },
        { text = "No. The Crusade earned every vial.", next = "BACK", reply = "Just so. Keever is pleased to be understood, and will name the next frog for the visitor.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keever = {
      lines = { { id = "k_default", text = "Which way? Oh. Keever died badly, and something was mislaid in the dying. There is the one who thinks, and there is Keever who does the work, and it is tidier to keep the two of them apart." } },
      choices = {
        { text = "Does it trouble you?", next = "BACK", reply = "It troubled the one who thinks, for a while. Keever has the serums to see to, and is not troubled by anything but sheep.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "Keever has that honour. Master Faranell sets the great questions, and Keever is permitted the small ones. Keever also has a rival, a fool named Abernathy, who keeps taking Keever's subjects for his own bench without asking." } },
      choices = {
        { text = "Have you complained to the Master?", next = "master2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master2 = {
      lines = { { id = "m2_default", text = "Keever does not carry tales. But if that fool keeps taking Keever's subjects, Keever may have to have a word with him, and Keever has a vial set aside for the occasion. It is the one that made the snake." } },
      choices = {
        { text = "I'd like to see that.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    earth = {
      lines = { { id = "e_default", text = "Too much earthroot! Keever said so. Keever said so aloud, to the frog, on the very first day. And what would the visitor put in its place, to bind the change without shrinking it?" } },
      choices = {
        { text = "Kingsblood. It strengthens what it touches.", next = "BACK", reply = "Kingsblood. Bold, and costly. Keever will try it on the next Scarlet, and credit the visitor in a footnote.", fx = { affinity = 1 } },
        { text = "Nothing. Leave it out and halve the dose.", next = "BACK", reply = "Less of everything? How very unlike an apothecary. Keever will consider it, when all else has failed." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    new_plague = { { id = "tp_np", text = "That is the Master's work and not Keever's. Keever makes frogs, and is not asked about anything else." } },
    scarlet_crusade = { { id = "tp_sc", text = "Excellent subjects. They shout a good deal before the serum, and not at all after." } },
    sylvanas = { { id = "tp_syl", text = "The Dark Lady has not yet visited Keever's bench. Keever would like to have something larger than a sheep to show her first." } },
    forsaken = { { id = "tp_fs", text = "Keever is Forsaken, and so is the one who thinks. It is the only matter on which they are in full agreement." } },
    advice = { { id = "tp_ad", text = "Label every vial. Keever did not, once, and that is why there is a rabbit." } },
    _none = { { id = "tp_none", text = "Keever does not know, and Keever is busy. Ask the one who thinks, if he ever comes back." } },
  },
}

---------------------------------------------------------------------------
-- Lexington Mortaim: portal trainer in the Magic Quarter; knows the roads between the Horde's cities better than any map.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_lexington", id = TODO_NPC("Lexington Mortaim"), name = "Lexington Mortaim", title = "Portal Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "dry", "exact" }, values = { "knowledge", "order" },
  notices = { "class", "race" },
  impression = {
    first = "Lexington Mortaim teaches mages to open portals to the Undercity, and he treats distance as a clerical error that he is paid to correct. He has not walked further than the Trade Quarter in a year and sees no reason to.",
    third = "{name} met Lexington Mortaim, the portal trainer of the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you've stepped round the mark. Splendid. I've a portal rune polished and waiting for a sensible student." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Stand on the mark, if you like. I can't promise what will arrive on top of you." },
    { id = "g_default", text = "Mind the mark on the floor. That is where things arrive, and they do not look first." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage. Then you have walked here, I suppose, and you would like never to do so again." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned by the stairs. I had hoped to see you step out of the air by now." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You hold your focus like one of Kaelystia's students, all in the wrist. It will serve for a bolt of frost, and it will tear a portal in half." },
    { id = "n_notmage", cat = "class", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } },
      text = "You have no gift for this, and I mean no slight by it. Stand clear of the mark, and I shall answer what I can." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. Your own mages open their doors by a different road than ours, and I should like to compare notes with one before I die again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lexington Mortaim, portal trainer. I teach mages of sufficient skill to fold the road between here and anywhere into a single step, and I keep the Undercity's own arrival mark from drifting, which it likes to do." },
        { id = "h_mage_low", when = { class = "MAGE", maxLevel = 39 }, text = "Lexington Mortaim. You are a mage, but not yet a strong enough one to hold a door open for others. Come back when you have more behind you, and meanwhile learn the theory, since it costs nothing." },
        { id = "h_mage", when = { class = "MAGE", minLevel = 40 }, text = "Lexington Mortaim. You are ready for the larger working, I think, the door that others may walk through after you. It is a responsibility, and I shall treat it as one even if you do not." },
      },
      again = {
        { id = "h_again", text = "Yes? Be exact, if you please." },
        { id = "h_again2", text = "Another question. Very well; I have until the next arrival." },
        { id = "h_again3", text = "Go on. Nothing is due on the mark for a quarter of an hour." },
      },
      choices = {
        { text = "A portal should only open where the mage has truly been.", next = "BACK", reply = "Quite right. Guesswork gets students delivered in pieces.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Open a portal anywhere. If it fails, try again elsewhere.", next = "BACK", reply = "Elsewhere is the problem. Some of the elsewheres don't send you back.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me the way to the Undercity.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "How does a portal actually work?", next = "theory" },
        { text = "What happens when one goes wrong?", next = "wrong" },
        { text = "Where can a mage of the Horde travel?", next = "roads" },
        { text = "You've not left the city in a year, I hear.", next = "stay" },
        { text = "I learned the short step in Dalaran.", next = "dalaran", when = { origin = "forsaken_dalaran_apprentice" } },
        { text = "I can step home alone. Is a portal so different?", next = "m_diff", when = { class = "MAGE", minLevel = 20 } },
        { text = "My first portal opened crooked. What went wrong?", next = "m_crooked", when = { class = "MAGE", minLevel = 40 } },
        { text = "I'm living. Will you teach me the Undercity's door?", next = "m_living", when = { class = "MAGE", race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'll take the stairs.", next = "END" },
      },
    },
    m_diff = {
      lines = { { id = "md_default", text = "Entirely. A teleport needs only to be right about one person, who is you, and who will forgive you. A portal must be right about everyone who steps through after you, and none of them will have read the theory." } },
      choices = {
        { text = "Then I'll study until I'm right for all of them.", next = "BACK", reply = "That is the only acceptable answer, and I have heard it perhaps four times.", fx = { align = { order = 1 } } },
        { text = "If they step through, the risk is theirs.", next = "BACK", reply = "They do not know there is a risk. That is precisely why it is yours.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_crooked = {
      big = true,
      lines = { { id = "mc_default", text = "You pictured the mark as it looked to you on the day you first arrived, tired and hurried, with the floor seeming to tilt. Picture it as it is: level, cold, scrubbed, and eleven paces from the eastern arch, because a portal wants exactness and not feeling." } },
      choices = {
        { text = "I'll practise until it opens true.", next = "BACK", reply = "Good. Come back and open one onto my mark, and I shall measure it.", fx = { align = { order = 1 } } },
        { text = "Crooked will do. They arrived, and that's what matters.", next = "BACK", reply = "They arrived on a slant, and one of them arrived in the canal. Exactness is not a vanity.", fx = { align = { order = -1 } } },
        { text = "I tested it on a rat first.", next = "BACK", reply = "A rat. How very sensible, and how very Forsaken of you, whatever you are.", fx = { trait = { cautious = 1 } } },
      },
    },
    m_living = {
      lines = {
        { id = "ml_default", text = "I teach our door to any mage of the Horde who can hold it, living or otherwise. You will find our mark hard to picture, because you remember nothing of this place that is not unpleasant, and that is the first thing we must correct." },
        { id = "ml_orc", when = { race = "Orc" }, text = "I teach our door to any mage of the Horde who can hold it, and an orc mage is rare enough that I shall take notes. Orcs picture places by their smell, I am told, which here will be a disadvantage." },
      },
      choices = {
        { text = "I'll learn your city properly, then.", next = "BACK", reply = "Then walk it once, all of it, and look at the floors. You will open a better door than most of our own.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll picture it as I like. It's only a ruin.", next = "BACK", reply = "Then you will arrive in one, precisely as you pictured it, and I shall not come to fetch you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    theory = {
      lines = { { id = "t_default", text = "You do not travel, strictly. You persuade two places that they are the same place for a moment, and you step across before they notice the error. The skill lies in knowing the far place well enough to describe it without a single mistake." } },
      choices = {
        { text = "And a rune helps you describe it?", next = "theory2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theory2 = {
      lines = { { id = "t2_default", text = "The rune is a memory you can hold in your hand. Hannah Akeley sells them along the way, and I advise carrying more than you think you need, because a mage without a rune is merely a person a long way from home." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "w_default", text = "Usually nothing happens, and the mage is embarrassed. Occasionally the door opens on the right place at the wrong height. I have a student who arrived in the canal, and another who arrived above it." } },
      choices = {
        { text = "And the worst you've seen?", next = "wrong2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong2 = {
      big = true,
      lines = { { id = "w2_default", text = "A young man who pictured the Undercity as he remembered it from life, with the palace whole and the sun on the square. The door opened. I shut it at once, and I have never been certain what it opened onto. Was I right to shut it?" } },
      choices = {
        { text = "Yes. Some doors should stay shut.", next = "BACK", reply = "So I told him. He has not forgiven me, and I have not asked him to.", fx = { align = { order = 1 } } },
        { text = "No. You should have looked through.", next = "BACK", reply = "Perhaps. I think of it most nights, and on most nights I am glad I did not.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads = {
      lines = { { id = "r_default", text = "To this city, to Orgrimmar and to Thunder Bluff, and each is taught in its own city by one who knows its mark. I teach ours. For Orgrimmar you want the trainer there, a troll named Thuul, who is competent and rather loud." } },
      choices = {
        { text = "And beyond the three cities?", next = "BACK", reply = "Beyond them you walk, or you pay a goblin. I recommend walking, since it is merely slow." },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "Why should I? Everything that matters arrives on that mark sooner or later. Pierce Shackleton calls it a failure of curiosity. I call it the natural result of knowing precisely how far away everything is." } },
      choices = {
        { text = "There's more to a place than its distance.", next = "BACK", reply = "So travellers tell me, usually while complaining of their feet.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran = {
      lines = { { id = "d_default", text = "Then you had it from the same school as I, and you will remember the practice hall with the brass circles. I could open a door to that hall tonight, in theory. In practice the dome would have a good deal to say about it." } },
      choices = {
        { text = "Have you ever been tempted?", next = "BACK", reply = "Daily. I resist by reminding myself what the Kirin Tor do to uninvited guests, which is thorough.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dal", text = "I know its arrival mark as I know my own name. I shall very likely never use it again, and I keep it polished in my memory all the same." } },
    kirin_tor = { { id = "tp_kt", text = "They taught me to cross the world in a step, and then drew a line I may not cross. I admire the consistency of the first lesson more than the second." } },
    advice = { { id = "tp_ad", text = "Never open a door to a place you have only heard described. Go there on foot first, once, and look at the floor." } },
    forsaken = { { id = "tp_fs", text = "We have no pulse to steady before a casting, which is a real advantage. I mention it to living mages whenever they become tiresome." } },
    sylvanas = { { id = "tp_syl", text = "Her Majesty travels by her own means and has never needed mine. I keep the mark exact regardless, in case she should." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's shamans do not use portals and are suspicious of them. I am told the suspicion is mutual, at the Orgrimmar end." } },
    _none = { { id = "tp_none", text = "That is neither here nor there, and those are the only two places I concern myself with." } },
  },
}

---------------------------------------------------------------------------
-- Martha Strain: demon trainer in the Magic Quarter; sells the grimoires that teach a warlock's servants their tricks.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_strain", id = TODO_NPC("Martha Strain"), name = "Martha Strain", title = "Demon Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "brisk", "wry" }, values = { "practical", "knowledge" },
  notices = { "pet", "class" },
  impression = {
    first = "Martha Strain sells grimoires to warlocks and speaks of demons the way a kennel keeper speaks of hounds. She is fonder of the creatures than of the people who command them, and says so.",
    third = "{name} met Martha Strain, who trains warlocks' demons in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. The grimoires remember you fondly, and so do I. Come and look at the new imp primer." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Keep your hands off the grimoires; they've told me what they think of you." },
    { id = "g_default", text = "Grimoires on the left, and don't open one unless you mean to buy it, because they bite the idle." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Let's have a look at what you've brought me. Stand it where I can see it, and tell it to stop that." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another book? Your servant must be learning faster than you are." },
    { id = "g_morzul", when = { questActive = TODO_QUEST("Mor'zul Bloodbringer") }, text = "Still here? Mor'zul won't wait in the Burning Steppes for ever, and neither, I suspect, will the Dark Iron dwarves around him." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "That imp's been at somebody's candle wax, I can see it on his chin. Feed him properly and he'll leave the furniture be." },
    { id = "n_fel", cat = "pet", when = { pet = { family = "Felhunter" } },
      text = "Your felhunter's been sniffing at my shelf since you came in, because the grimoires have a little magic in the bindings. Pull him off before he eats a chapter." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "A priest. You'll not find anything here for you, but you may look, and I'll thank you not to mutter at the shelves." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You've a steady hand on the leash, by the look of it, and that's rarer than talent and worth a good deal more." },
  },

  start = "hello",
  nodes = {
    hello = {
      narr = "She runs a thumb along a row of spines without looking at them, the way someone counts sheep in a pen.",
      lines = {
        { id = "h_default", key = true, text = "Martha Strain, demon trainer. The masters down the hall teach the warlock, and I teach the demon, by way of a book the warlock reads aloud, which is the more honest half of the trade, since the demon at least knows what it is." },
        { id = "h_mount", when = { class = "WARLOCK", minLevel = 60, questBefore = TODO_QUEST("Mor'zul Bloodbringer") }, text = "Martha Strain. You've come as far as this hall can take you, so I'll tell you what I tell very few. There's a human named Mor'zul Bloodbringer in the Burning Steppes, near the Altar of Storms, and he knows a working that will put a dreadsteed under you." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the voidwalker in the corner, he's sulking." },
        { id = "h_again2", text = "Go on, then, I can shelve and listen at the same time." },
        { id = "h_again3", text = "Ask it, before something in here gets bored." },
      },
      choices = {
        { text = "A warlock should treat his demons with care, like good hounds.", next = "BACK", reply = "Exactly so. A kicked hound bites, and so does a kicked imp.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Demons are tools. Use them up and summon another.", next = "BACK", reply = "And one day the tool turns round. I'll sell you a grimoire for that day.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the grimoires, and the ones you keep back.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "My demon's stopped obeying the small commands.", next = "obey", when = { class = "WARLOCK" } },
        { text = "Tell me about this dreadsteed.", next = "dread", when = { class = "WARLOCK", minLevel = 58 } },
        { text = "My felhunter eats everything with a spell on it.", next = "fel", when = { class = "WARLOCK", pet = { family = "Felhunter" } } },
        { text = "How do you train a demon with a book?", next = "book" },
        { text = "You sound fond of them.", next = "fond" },
        { text = "Which servant gives the most trouble?", next = "trouble" },
        { text = "How do you get on with the warlock masters?", next = "masters" },
        { text = "My demon has started testing its chains. Not with the small orders yet.", next = "obey", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your shelves.", next = "END" },
      },
    },

    dread = {
      lines = { { id = "dr_default", text = "A steed out of the Nether that makes a felsteed look like a pony at a fair. Mor'zul will tell you the working, and it means a ritual in the ruins of Dire Maul, where the elves once opened doors they shouldn't have, and you'll want friends with you who don't run." } },
      choices = {
        { text = "Why does an orc in the Steppes know this?", next = "dread2" },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },
    dread2 = {
      big = true,
      lines = { { id = "dr2_default", text = "Because he's an old Horde warlock who never stopped studying, and he'd rather trade what he knows than take it to the grave. I don't trust him, but I trust his greed, which is steadier. Some say a warlock should stop before a thing like that. Do you?" } },
      choices = {
        { text = "No. I'll ride it, and it'll know who's master.", next = "BACK", reply = "Then go and ask Mor'zul, and come back and let me look at it. I've only ever read about them.", fx = { align = { light = -1 } } },
        { text = "Perhaps. Some power is better left unridden.", next = "BACK", reply = "There's a thought I don't hear in this hall very often. Keep it, whatever you decide.", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    fel = {
      lines = { { id = "fe_default", text = "Of course he does, because that's what they're for. A felhunter is a hound bred to hunt magic and eat it, which is why the mages upstairs go quiet when one walks by, and why you'll never lose one to a Scarlet's spells for long." } },
      choices = {
        { text = "Can I stop him eating the wrong things?", next = "BACK", reply = "Feed him from your own hand now and then, a scrap of mana, and he'll learn whose table to wait at. Kaal's hasn't learned yet, but Kaal's is a glutton." },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },

    book = {
      lines = { { id = "b_default", text = "Each grimoire holds one trick, written so the demon can't pretend to misunderstand it. The warlock reads, the demon listens, and after that it can't say it was never told, which is half of demonology, really, removing excuses." } },
      choices = {
        { text = "Who writes them?", next = "book2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    book2 = {
      lines = { { id = "b2_default", text = "I copy most myself, from masters kept under lock by Carendin Halgar. It's slow work, because a grimoire copied carelessly teaches the trick to the wrong party, and I've no wish to meet a warlock who fetches on command." } },
      choices = {
        { text = "Has that ever happened?", next = "BACK", reply = "Once, in Dalaran, to a man I disliked. I've been careful ever since, and a little wistful.", fx = { trait = { witty = 1 } } },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },

    fond = {
      lines = { { id = "f_default", text = "Of the creatures, yes. An imp is a liar and a felhunter is a glutton, but neither pretends otherwise, and after a year among the dead I value that, since it's the warlocks who tell themselves stories." } },
      choices = {
        { text = "What stories?", next = "fond2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    fond2 = {
      big = true,
      lines = { { id = "f2_default", text = "That the demon likes them, and that it's loyal, when it is neither, and the moment the leash slips it will prove it. I tell every student so, and they nod, and then they give the thing a pet name. Do you think I'm too hard on them?" } },
      choices = {
        { text = "No. A leash is a leash. Never forget it.", next = "BACK", reply = "Then say that to yourself each night, and you may keep all your fingers.", fx = { align = { order = 1 } } },
        { text = "Yes. Even a demon answers to decent treatment.", next = "BACK", reply = "It answers to it, certainly, and takes note of it, and waits. But I've heard worse philosophies.", fx = { align = { order = -1 } } },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },

    trouble = {
      lines = { { id = "tr_default", text = "The succubus, without question. A voidwalker wants only to be left alone and a felhunter wants only to eat, but the succubus wants to know what you want, and that is a far more dangerous kind of attention." } },
      choices = {
        { text = "And the easiest?", next = "BACK", reply = "The voidwalker. Feed him a shard now and then and he'll stand between you and anything, sighing all the while." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    masters = {
      lines = { { id = "m_default", text = "Well enough. Richard Kerwin sends his students to me with a list, which is civil of him, and Luther Pickman sends his with a warning about me, which is flattering, and Kaal Soulreaper's felhound has eaten two of my ledgers." } },
      choices = {
        { text = "Only the ledgers?", next = "BACK", reply = "And a shoe that belonged to their acolyte, the sour boy. He was more upset about the shoe than his foot would have been." },
        { text = "Back to the books, then.", next = "BACK" },
      },
    },

    obey = {
      lines = { { id = "o_default", text = "Then it's testing whether you still mean it. They do that when the warlock's tired, or distracted, or newly sure of himself, so which are you?" } },
      choices = {
        { text = "Tired. I've been bleeding for it on the road.", next = "obey2" },
        { text = "Sure of myself. Perhaps a little too sure.", next = "obey2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    obey2 = {
      lines = { { id = "o2_default", text = "Then say the small commands aloud for a week, every one, as if it were the first day. It will sulk, and then it will obey, because you'll have reminded it that you're paying attention, and it's nearly always that." } },
      choices = {
        { text = "I'll remind it who holds the chain. Thank you, Martha.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    burning_legion = { { id = "tp_legion", text = "The Legion breeds them and we borrow them. I'd not call it theft, exactly, but I'd not send the Legion a receipt either." } },
    dalaran = { { id = "tp_dal", text = "They pretended nobody there studied what I studied, and kept a locked floor for the nobody." } },
    advice = { { id = "tp_ad", text = "Never thank a demon, because it keeps count, and it will mention it later." } },
    forsaken = { { id = "tp_fs", text = "We make careful warlocks, most of us. Once you've been something's puppet, you don't hold a leash lightly." } },
    scourge = { { id = "tp_scourge", text = "They bind the dead the way a bad warlock binds a demon, with no terms and no end. I've never forgiven the workmanship." } },
    _none = { { id = "tp_none", text = "That's not in any book of mine. Try the masters, since they like being asked." } },
  },
}

---------------------------------------------------------------------------
-- Randolph Montague: the fourth Montague at the Trade Quarter bank; the affable one.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_rmontague", id = TODO_NPC("Randolph Montague"), name = "Randolph Montague", title = "Banker",
  bible = "bibles/more_folk.md", role = "banker", tier = "service",
  communities = { "undercity" }, temper = { "affable", "shrewd" }, values = { "discretion", "profit" },
  notices = { "purse", "race" },
  impression = {
    first = "Randolph Montague is the one banker in the Trade Quarter who smiles at his depositors, and he watches their hands while he does it. He seems to enjoy the vault as other men enjoy a good cellar.",
    third = "{name} met Randolph Montague, one of the Montague bankers of the Undercity.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, a favourite depositor. The vault's been very quiet without you, and I've dusted your shelf." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Good evening. I'll look after your things as I'm paid to, and I'll watch your hands as I please." },
    { id = "g_default", text = "Good evening, and welcome to the safest hole in Lordaeron. What shall we look after for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a familiar face. Your box has missed you, or I have, and at my age it is hard to tell the difference." },
    { id = "g_rich", when = { money = { min = 1000000 } }, text = "Now there is a purse that wants a rest. Do come to my end of the counter; Mortimer will only make you feel guilty about it." },
  },

  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 5000 } },
      text = "Travelling light, I see. No shame in it, friend. Every great account at this counter began as three coppers and a button." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of our living allies. You'll find your Orgrimmar box is our box, to the last coin, though I can't promise it will smell the same." },
  },

  start = "hello",
  nodes = {
    d2_odd = {
      lines = {
        { id = "d2_odd_1", text = "A deathstalker who deposits a single sealed jar every month and withdraws the one from the month before. I don't know what's in them, and I've been very firmly advised by Ophelia not to guess aloud." },
      },
      choices = {
        { text = "Have you guessed quietly?", next = "d2_odd2" },
        { text = "Discretion is part of the trade.", next = "d2_odd2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_odd2 = {
      lines = {
        { id = "d2_odd2_1", text = "Every month, and each guess is worse than the last. The jars are always exactly the same weight, which is the part that keeps me awake, or would, if I slept." },
      },
      choices = {
        { text = "Best not to know.", next = "BACK" },
        { text = "Ask you something else, Randolph.", next = "BACK" },
      },
    },
    d2_thieves = {
      lines = {
        { id = "d2_thieves_1", text = "It would be, if the vault were where you think it is. The counter is here, but the boxes are kept somewhere considerably deeper and better guarded, and the Rogues' Quarter is on excellent terms with us because many of them bank here." },
      },
      choices = {
        { text = "Thieves trust a bank?", next = "d2_thieves2" },
        { text = "Clever arrangement.", next = "d2_thieves2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_thieves2 = {
      lines = {
        { id = "d2_thieves2_1", text = "More than honest folk do, since they know exactly how hard a vault is to rob. A thief who's tried once becomes our most loyal customer, and we've two or three of those who still send William a card on the anniversary." },
      },
      choices = {
        { text = "A card?", next = "BACK", reply = "Unsigned, naturally. William keeps them in a drawer and pretends not to be touched." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_rogue = {
      lines = {
        { id = "d2_rogue_1", text = "I'm certain you could get into a vault, my friend, though perhaps not ours. Do feel free to try, so long as you'll let us know how far you got, because William pays very well for that kind of information." },
      },
      choices = {
        { text = "Then I'll keep my secrets.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Randolph Montague, banker, at your service. There are four of us Montagues at this counter, and I am the one who doesn't mind being asked questions, so the others send the talkative customers down to me." },
        { id = "h_met", when = { metBefore = true }, text = "Randolph Montague, as before. You'll find everything as you left it. We have never lost so much as a copper, though Mortimer once mislaid a decimal and didn't speak for a week." },
      },
      again = {
        { id = "h_again", text = "Anything else I can do for you?" },
        { id = "h_again2", text = "Go on, I'm in no hurry. Money is very patient company." },
        { id = "h_again3", text = "Ask away. William is glaring, but he glares at everyone." },
      },
      choices = {
        { text = "I'd like my box.", next = "BUSINESS" },
        { text = "What are the other Montagues like?", next = "four" },
        { text = "What do the Forsaken keep in a bank?", next = "keep" },
        { text = "Does trade still reach the Undercity?", next = "trade" },
        { text = "How's the Horde's credit, between cities?", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Who's your strangest depositor?", next = "d2_odd" },
        { text = "A vault beside the Rogues' Quarter seems unwise.", next = "d2_thieves" },
        { text = "I could get into that vault, you know.", next = "d2_rogue", when = { class = "ROGUE" } },
        { text = "That'll be all.", next = "END" },
      },
    },
    four = {
      lines = { { id = "f_default", text = "William is the senior and guards the keys as if they were his own ribs. Ophelia has the best head for figures of any of us. Mortimer counts everything twice, and I am told I talk too much, which I consider a service to the customer." } },
      choices = {
        { text = "Are you truly all one family?", next = "four2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    four2 = {
      lines = { { id = "f2_default", text = "We answer to one name and we woke within a street of one another, and that is all any of us can swear to. I've decided we are cousins. It costs nothing, and it gives me someone to be exasperated by at the end of the day." } },
      choices = {
        { text = "That's as good a family as any.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "A name isn't blood.", next = "BACK", reply = "No, but it is on the door, and the door is what the customers trust." },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = { { id = "k_default", text = "Less gold than you'd think, and more keepsakes. A wedding band, a child's shoe, a letter they can no longer bring themselves to read. We charge the same for a shoe as for a sovereign, and we guard it rather more carefully." } },
      choices = {
        { text = "Why more carefully?", next = "keep2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep2 = {
      lines = { { id = "k2_default", text = "Because gold can be made good, and the shoe can't. I had a woman come every week for a year only to open her box and look. One week she took the thing out and left, and I've never been sure whether to count that as a loss to the bank." } },
      choices = {
        { text = "I'd call it the bank doing its work.", next = "BACK", reply = "So would I, privately. Don't tell Mortimer; he has it entered as a closed account.", fx = { affinity = 1 } },
        { text = "A bank isn't a shrine, Randolph.", next = "BACK", reply = "Quite right, and I'd never say otherwise in front of the ledgers." },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "t_default", text = "More each season. The goblins fly in from Orgrimmar and Grom'gol, the auctioneers across the hall never close, and Tarren Mill sends up what Hillsbrad gives it. We are a dead city with a very lively market." } },
      choices = {
        { text = "Who spends the most?", next = "BACK", reply = "The Apothecary Society, by a wide margin, and always on glassware. I've stopped asking what happens to the old glassware." },
        { text = "Something else.", next = "BACK" },
      },
    },
    living = {
      lines = { { id = "l_default", text = "Excellent, and I say it as one who checks. Your Warchief's treasurers pay on the day, the tauren pay early, which unsettles me, and the trolls pay in full and argue about it afterwards. I'd lend to any of them." } },
      choices = {
        { text = "And would they lend to the Forsaken?", next = "living2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    living2 = {
      big = true,
      lines = { { id = "l2_default", text = "They do, with a little more counting than they give each other. I don't take offence. We are new neighbours, and a careful lender is a neighbour who intends to stay. Do you think they're wrong to count twice with us?" } },
      choices = {
        { text = "Yes. Allies should deal as equals.", next = "BACK", reply = "A generous view, and I'll repeat it to the next Orgrimmar clerk who asks for a third signature.", fx = { align = { honor = 1 } } },
        { text = "No. Trust is earned, and yours is young.", next = "BACK", reply = "Fairly said, and a banker can hardly object to anyone checking the sums.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lord", text = "A rich kingdom, and a careless one. It kept its treasury above ground, where anyone could set fire to it." } },
    forsaken = { { id = "tp_fs", text = "We make excellent bankers. We've no appetites to speak of, and nothing whatever to retire to." } },
    syndicate = { { id = "tp_syn", text = "They tried Mortimer's end of the vault twice. Nobody ever tries mine, and I've begun to feel rather slighted." } },
    advice = { { id = "tp_ad", text = "Put a little aside when times are good. They are never good for as long as you expect." } },
    sylvanas = { { id = "tp_syl", text = "The Dark Lady's treasury is the soundest in the north, and I say it as one who is shown only a corner of it." } },
    thrall = { { id = "tp_thrall", text = "A ruler who pays his debts on the day. I had not met one before, and I've been a banker in two lifetimes." } },
    _none = { { id = "tp_none", text = "Not a thing I've an account of, I'm afraid. Try the auctioneers; they hear everything." } },
  },
}

---------------------------------------------------------------------------
-- Eunice Burch: cooking trainer in the Trade Quarter; teaches the dead to cook for the living Horde.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_eburch", id = TODO_NPC("Eunice Burch"), name = "Eunice Burch", title = "Cooking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "brisk", "motherly" }, values = { "craft", "community" },
  notices = { "race", "profession" },
  impression = {
    first = "Eunice Burch teaches cooking in the Trade Quarter to students who cannot taste what they make. She has worked out a whole method around that, and she is proud of it and a little fierce about it.",
    third = "{name} met Eunice Burch, the cooking trainer of the Undercity.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are, feet wiped, hands washed, I hope. I've a new recipe that relies on smell alone." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Wash your hands twice, and don't touch my good pans." },
    { id = "g_default", text = "Wipe your feet and wash your hands, in that order. I don't care that you're dead, the food does." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook already, are you? Let me see your hands. Hm. You stir too fast, but we can mend that." },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "A customer with a tongue in their head! Sit down, you're tasting for me today, and I won't hear no." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people roast better than anyone living, and I'll thank you to tell me how you keep kodo from going tough." },
    { id = "n_fisher", cat = "profession", when = { profession = "Fishing" },
      text = "You fish. Then bring me what you catch in the Tirisfal lakes, and I'll show my students which of it is supper and which of it is a warning." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Eunice Burch, and I teach cooking. Most of my students can't taste a thing, so I teach them to cook by eye and ear and the clock, and I'll put their stew against any living cook's in Lordaeron." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Eunice Burch. I teach the dead to cook for folk like you, since the Horde eats and somebody in this city has to feed it. You'll tell me honestly what you think of the pot, and I'll thank you for it either way." },
      },
      again = {
        { id = "h_again", text = "What else, dear? Mind that pan, it's hot." },
        { id = "h_again2", text = "Go on, I can talk and stir." },
        { id = "h_again3", text = "Ask away. The dumplings want another minute." },
      },
      choices = {
        { text = "Cook properly even for the dead, though they can't taste it.", next = "BACK", reply = "That's my whole method, and it's why my students are the best in the city.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Nobody here can taste it. Throw it together any old way.", next = "BACK", reply = "And our living allies can taste it perfectly well. You'll learn the proper way.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "How do you cook without tasting?", next = "taste" },
        { text = "Who eats what your students make?", next = "eats" },
        { text = "Where do your ingredients come from?", next = "larder" },
        { text = "Raleigh Andrean was a chef. Does he help you?", next = "raleigh", when = { heardLine = "uc_raleigh.h_default" } },
        { text = "Let me taste the pot for you.", next = "tastes", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'll leave you to your stove.", next = "END" },
      },
    },
    taste = {
      lines = { { id = "t_default", text = "You listen to the fat, for a start. A pan tells you when it's ready, and a stew changes its bubble when it thickens. I've a sand-glass for every dish and a colour card for every sauce, and I drill them like a sergeant." } },
      choices = {
        { text = "And the seasoning?", next = "taste2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taste2 = {
      lines = { { id = "t2_default", key = true, text = "By weight, to the grain. I kept my mother's recipes in my head, and when I woke I wrote out every one with the salt measured, before I could forget. They're on that shelf, and I'd go back into a burning house for them." } },
      choices = {
        { text = "That's a real inheritance.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eats = {
      lines = { { id = "e_default", text = "Innkeeper Norman's guests, first. Then the orcs who come in on the zeppelin half starved, and the deathguards' living auxiliaries. And a good many of our own, who can't taste it and eat anyway, because a hot bowl in the hands is a comfort." } },
      choices = {
        { text = "Is it wrong to cook for those who can't taste?", next = "eats2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eats2 = {
      big = true,
      lines = { { id = "e2_default", text = "Some of the apothecaries say I waste good provisions on a habit. I say that a people who sit down to supper together are still a people. I'll not be told otherwise in my own kitchen, but I'll hear your view." } },
      choices = {
        { text = "You're right. Keep the table laid.", next = "BACK", reply = "I will, dear. There'll be a bowl for you whenever you're through.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The apothecaries are right. It's waste.", next = "BACK", reply = "Then you'll not want any, and there's more for those who do. Mind the door on your way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    larder = {
      lines = { { id = "l_default", text = "Ronald Burch sells me the flour and spices from his stall, and Tawny Grisette the mushrooms. The meat comes down from Brill, darkhound and bat mostly, and the fish from the lakes when Armand Cromwell's students have had a good day." } },
      choices = {
        { text = "Darkhound and bat?", next = "larder2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    larder2 = {
      lines = { { id = "l2_default", text = "Don't make that face. A darkhound haunch braised long with Tirisfal pumpkin is as good as mutton, and I've had orcs ask for a second plate. The bat I'll grant you is mostly for soup, and mostly for the brave." } },
      choices = {
        { text = "I'd try the haunch.", next = "BACK", reply = "Good! That's the spirit that built the Horde. Sit, and I'll cut you some.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    raleigh = {
      lines = { { id = "r_default", text = "He won't hold a spoon, poor man, but he answers my students' questions, and he's never once been wrong. I send him the clever ones. I think it does him as much good as it does them, though he'd never own to it." } },
      choices = {
        { text = "He said he lasted a morning here.", next = "BACK", reply = "He lasted a morning at the stove. He's lasted a year at the door, and that's the part that counts." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tastes = {
      lines = { { id = "ts_default", text = "Would you? There's a dear. It's the spiced bat broth, and I want to know two things: is there too much pepper, and can you taste the pumpkin at all? Take your time, and don't be polite." } },
      choices = {
        { text = "Too much pepper. The pumpkin's lost.", next = "BACK", reply = "I knew it! Halve the pepper, and write it on the card. Thank you, that's a week of guessing saved.", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "It's perfect as it is.", next = "BACK", reply = "Is it, now? You've a kind face and watering eyes, dear. I'll halve the pepper." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "We don't hunger, but we remember hungering, and I think that's why they still come to my table." } },
    lordaeron = { { id = "tp_lord", text = "I kept a cookshop two streets from the palace gate. The street's still up there, and my chimney with it, for all I know." } },
    advice = { { id = "tp_ad", text = "Low heat and patience, dear. There's hardly a dish in the world that's improved by hurrying." } },
    thrall = { { id = "tp_thrall", text = "I've never met him, dear, but his orcs clean their plates and say thank you, and you can tell a great deal about a chief from that." } },
    scarlet_crusade = { { id = "tp_sc", text = "They burned the wheat fields north of Brill rather than let us have them. I've no time for anyone who'll burn bread." } },
    sylvanas = { { id = "tp_syl", text = "She doesn't eat, they say, and never did sit down much even in life. I'd cook for her all the same, if she ever asked." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, dear. If it can't be boiled, baked or fried, it's past me." } },
  },
}

---------------------------------------------------------------------------
-- Tawny Grisette: wandering mushroom seller of the Trade Quarter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_tawny", id = TODO_NPC("Tawny Grisette"), name = "Tawny Grisette", title = "Mushroom Seller",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "soft_spoken", "dreamy" }, values = { "practical", "community" },
  notices = { "profession", "class" },
  impression = {
    first = "Tawny Grisette wanders the Trade Quarter with a basket of mushrooms and talks to them under her breath between customers. She knows every damp corner of the city and speaks of them like a gardener speaks of beds.",
    third = "{name} met Tawny Grisette, who sells mushrooms in the Undercity's Trade Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you're back. The mushrooms by the old well have been asking after you, in their quiet way." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The mushrooms shrink when you walk past, and I'd rather they didn't." },
    { id = "g_default", text = "Mushrooms? They're fresh this hour. I picked them where the old well drips, and they've hardly noticed yet." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. The ones you had last time came from the same bed, so they'll remember you." },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "You're warm! I can feel it from here. Come and choose, the caps like a warm hand." },
  },

  notice = {
    { id = "n_herb", cat = "profession", when = { profession = "Herbalism" },
      text = "You gather growing things, don't you? You've soil under your nails that isn't from here. I'd love to know what the ground is like where the sun still reaches it." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Oh, I've wanted to meet one. Would you tell my mushrooms they're doing well? They'd take it better from you." },
  },

  start = "hello",
  nodes = {
    d2_strange = {
      lines = {
        { id = "d2_strange_1", text = "A little white cap that glows in the dark, from a bed by the Apothecarium drains. It glows a pale green, like the lamps along the canals, and I've never been sure if that's a good thing or a very bad one." },
      },
      choices = {
        { text = "Did you sell it?", next = "d2_strange2" },
        { text = "That sounds like the Apothecarium's doing.", next = "d2_strange2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_strange2 = {
      lines = {
        { id = "d2_strange2_1", text = "No, an apothecary came and took the whole bed away in a jar, and gave me a silver for my trouble. He said they were very interesting, in a voice that meant they weren't for eating, and I've not grown anything near those drains since." },
      },
      choices = {
        { text = "Wise choice, Tawny.", next = "BACK" },
        { text = "Ask you something else.", next = "BACK" },
      },
    },
    d2_buyers = {
      lines = {
        { id = "d2_buyers_1", text = "The troll who comes on the zeppelin every week, first of all, who says my red caps taste like home. Then Innkeeper Norman, for his stew, and Eunice Burch, who buys a handful each time and says they're for her students to practise on." },
      },
      choices = {
        { text = "What does the troll do with them?", next = "d2_buyers2" },
        { text = "Eunice sounds like a good customer.", next = "d2_buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_buyers2 = {
      lines = {
        { id = "d2_buyers2_1", text = "He dries them and grinds them and burns them, I think, for some kind of ceremony, because he once asked me if they'd been grown in the dark with proper respect. I told him I sang to them, and he seemed to think that was respectful enough." },
      },
      choices = {
        { text = "I'd say it was.", next = "BACK", reply = "So would I, though the mushrooms have never said." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_glades = {
      lines = {
        { id = "d2_glades_1", text = "Never, because the sun's no good for my kind of growing and the Scarlets shoot at anything that bends in a field. Ask Martine down at the water, though, because she gathers in the Glades and sends me the odd puffball when she finds one." },
      },
      choices = {
        { text = "I'll ask her.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Tawny Grisette. I walk the Trade Quarter with my basket, and I sell what grows in the quiet parts of the city. They're good mushrooms, and I raised every one of them from a speck." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "I'm Tawny Grisette. You'll want the forest caps and the red-speckled ones, and they're all safe for the living, I promise. I've a troll who comes every week, and he's never been ill once." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I'm only walking my round." },
        { id = "h_again2", text = "Go on, I'm listening. So are they, a little." },
        { id = "h_again3", text = "Yes? Walk with me, if you like, I'm going as far as the bridge." },
      },
      choices = {
        { text = "Pick a few and leave the rest to spread again.", next = "BACK", reply = "That's it exactly. Leave a little, and they come back ever so grateful.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Clear the whole patch. Mushrooms grow back on their own.", next = "BACK", reply = "Not if you take the little ones too, they don't. Oh, you are cruel.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see the basket.", next = "BUSINESS" },
        { text = "Where do you grow them?", next = "beds" },
        { text = "You talk to them.", next = "talk" },
        { text = "Why do you wander, when others keep stalls?", next = "wander" },
        { text = "Morley Bates says yours are prettier than his.", next = "morley", when = { heardLine = "uc_bates.o_default" } },
        { text = "The earth here is sick. Do they mind?", next = "sick", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "What's the strangest thing you've grown?", next = "d2_strange" },
        { text = "Who buys the most from your basket?", next = "d2_buyers" },
        { text = "Do you ever forage up in the Glades?", next = "d2_glades", when = { profession = "Herbalism" } },
        { text = "Good growing, Tawny.", next = "END" },
      },
    },
    beds = {
      lines = { { id = "b_default", text = "All over, wherever the stone weeps. There's a bed behind the bank where the old cistern cracked, and one under the bat roost, which is the richest. And one in a crypt I shan't name, where it's very peaceful." } },
      choices = {
        { text = "Under the bat roost?", next = "beds2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beds2 = {
      lines = { { id = "b2_default", text = "Patrick Garrett sweeps it all into a corner for me. He says it's beneath a Garrett to be thanked for it, so I leave a basket by his broom instead, and we've never spoken of it. He's very proud, and very kind, and he thinks nobody's noticed." } },
      choices = {
        { text = "I won't tell him you have.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk = {
      lines = { { id = "t_default", text = "I do. They grow better for it, I'm sure they do. And they're good listeners, which you can't say for most of this quarter, where everyone's shouting prices over everyone else." } },
      choices = {
        { text = "What do you tell them?", next = "talk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk2 = {
      big = true,
      lines = { { id = "t2_default", text = "The news, mostly. Who's come in on the zeppelin, what the auctioneers are cross about. And I tell them they'll be eaten by somebody who needs them, because I think it's only fair they should know. Is that a foolish thing to do?" } },
      choices = {
        { text = "No. It's a gentle thing. Keep doing it.", next = "BACK", reply = "I will, then. I'll tell them you said so, they like to hear of visitors.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Yes. They're mushrooms, Tawny.", next = "BACK", reply = "I know what they are. I was a great many things once myself, and nobody talked to me either.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wander = {
      lines = { { id = "w_default", text = "A stall is one place, and the beds are in twenty. If I walked only to fetch and carry, I might as well sell on the way. And I like to see who's about. Jeremiah Payson under the bridge always has a new roach to show me." } },
      choices = {
        { text = "Roaches and mushrooms. A natural friendship.", next = "BACK", reply = "Isn't it? We're the only two in the quarter selling things that are glad of the dark.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    morley = {
      lines = { { id = "m_default", text = "Did he say that? Oh, that's generous of him. His are hardier, though, and they keep twice as long. I gave him spores from my speckled bed last winter when his went black, and he gave me a jug and wouldn't look at me." } },
      choices = {
        { text = "He seemed glad of the trade.", next = "BACK", reply = "He'd never say so. That's how I know he was." },
        { text = "Something else.", next = "BACK" },
      },
    },
    sick = {
      lines = { { id = "s_default", text = "I've wondered. They grow so eagerly here, more than they ever did in my mother's cellar. I can't tell whether that's because the ground's ill, or because they're the first thing trying to mend it." } },
      choices = {
        { text = "They're mending it. That's what they do.", next = "BACK", reply = "Oh. Oh, I had hoped so. I'll tell every bed tonight, they ought to know what they're for.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "They're feeding on the sickness. Be careful.", next = "BACK", reply = "Then I'll watch them more closely, and thank you. I'd not want to carry harm about in a basket.", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "We're a bit like what I grow, aren't we? We came up in the dark, out of things that had died, and here we are." } },
    advice = { { id = "tp_ad", text = "Pick them young and carry them gently. That's true of mushrooms, and I've found it's true of most things." } },
    background = { { id = "tp_bg", text = "I kept my mother's cellar beds in the capital. It's the one thing I did before that I can still do." } },
    lordaeron = { { id = "tp_lord", text = "It's still up there, over the beds. Sometimes the rain comes down through the old palace floor, and they like that best of all." } },
    sylvanas = { { id = "tp_syl", text = "I saw her once, crossing the bridge. I don't think she saw me, and I didn't mind. I told the mushrooms about it for a week." } },
    scourge = { { id = "tp_scourge", text = "Nothing grew where they walked. That's how you can tell we're different, I think, because things grow for us." } },
    _none = { { id = "tp_none", text = "I don't know that. I could ask the mushrooms, but they only know what I've told them." } },
  },
}

---------------------------------------------------------------------------
-- Victor Ward: tailor of the Magic Quarter, Angela Ward's brother; hums while he works and teaches anyone who will sit still.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_vward", id = TODO_NPC("Victor Ward"), name = "Victor Ward",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "genial", "talkative" }, values = { "craft", "community" },
  notices = { "profession", "kit" },
  impression = {
    first = "Victor Ward teaches tailoring in the Magic Quarter and hums the same four bars over every seam. He sewed palace liveries with his sister for thirty years, and he talks about thread as if it were good news.",
    third = "{name} met Victor Ward, a tailor who teaches in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you're back! Mind the pins, come in; I've a new bolt of mageweave and I'm humming already." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Mind the pins, and mind the door on your way out, if you please." },
    { id = "g_default", text = "Come in, come in, and mind the pins. I've a hem to finish, but I talk better with my hands busy." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor! Sit down, sit down. Show me your running stitch, and we'll see where you've got to." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again. I was only just humming, and here's company. Splendid." },
  },

  notice = {
    { id = "n_tailor", cat = "profession", when = { profession = "Tailoring" },
      text = "You've a needle callus on the second finger. Good. That's the only honest sign of a tailor, and my sister will tell you the same, at greater length." },
    { id = "n_torn", cat = "kit", when = { durability = { max = 0.4 } },
      text = "Forgive me, but you've a seam going at the shoulder. It's all I can see. Stand still a moment and I'll put two stitches in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Victor Ward, tailor. I'll teach anyone who can thread a needle, and a fair few who can't yet. My sister Angela sells the patterns along the way, so between the pair of us a beginner can leave this quarter knowing how to make something." },
        { id = "h_angela", when = { heardLine = "uc_angela_ward.h_default" }, text = "Victor Ward. You've met my sister, I hear, and she'll have told you I hum. I do. It keeps the stitches even, and after thirty years beside her I'm astonished she still notices." },
      },
      again = {
        { id = "h_again", text = "What else? I've yards to go, so ask away." },
        { id = "h_again2", text = "Go on. I'm only basting." },
        { id = "h_again3", text = "Hm hm hm. Oh, I beg your pardon. You were saying?" },
      },
      choices = {
        { text = "A tailor should finish every seam, even the ones nobody sees.", next = "BACK", reply = "Thirty years of palace livery taught me that, and so did my sister.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Rush the hidden seams. Only the outside ever matters.", next = "BACK", reply = "Then the whole garment unravels, and you'll wonder what happened.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me to sew.", next = "BUSINESS" },
        { text = "What's the tune you keep humming?", next = "tune" },
        { text = "Tell me about the other tailors here.", next = "tailors" },
        { text = "What do the Forsaken need sewn?", next = "need" },
        { text = "Angela says you sewed the pages' liveries.", next = "livery", when = { heardLine = "uc_angela_ward.cl_default" } },
        { text = "How do I get past plain linen?", next = "learn", when = { profession = "Tailoring" } },
        { text = "I'll leave you to your hem.", next = "END" },
      },
    },
    tune = {
      lines = { { id = "tu_default", text = "Do you know, I've no idea. It's four bars of something, and I woke up with it. Angela says it was a street song the ribbon sellers sang outside our shop. She won't sing me the rest, because she says four bars are quite enough." } },
      choices = {
        { text = "Maybe someone else remembers it.", next = "tune2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tune2 = {
      lines = { { id = "tu2_default", text = "I ask everyone. A deathguard knew the fifth bar, and a woman at the bank knew the words to the sixth, which were not respectable. One day I'll have the whole of it, and I shall hum it straight through and astonish my sister." } },
      choices = {
        { text = "I hope you find the rest.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailors = {
      lines = { { id = "ta_default", text = "We're a proper little guild. I take the beginners, Rhiannon Davis takes them when they're past me, and Josephine Lister teaches the finest work in the city to the few who'll ever manage it. Millie Gregorian keeps us all in thread." } },
      choices = {
        { text = "And Lucille Castleton sells the results.", next = "tailors2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailors2 = {
      lines = { { id = "ta2_default", text = "She does, and she sends back one in four with a note pinned to it. My students dread those notes. I keep every one, because she's never been wrong yet, and a tailor who can please Lucille can please anybody living or dead." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Everything the living do, and one thing more. Robes for the casters, shirts for the deathguards, and a great deal of plain mending, because we can't feel a tear until it's past saving. And shrouds, now and then, for those who don't get up a third time." } },
      choices = {
        { text = "You sew shrouds for the Forsaken?", next = "need2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need2 = {
      big = true,
      lines = { { id = "n2_default", text = "For any who fall and are brought home. The apothecaries would sooner have the bodies for their studies, and they say a shroud is sentiment. I say that anyone who died twice for this city has earned a clean hem. What would you say?" } },
      choices = {
        { text = "Sew the shroud. They've earned their rest.", next = "BACK", reply = "Thank you. I'll go on doing it, then, with a lighter heart.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead can still serve. Give them to the Society.", next = "BACK", reply = "That's the Society's argument, and it's a tidy one. I'll go on sewing all the same, if it's all one to you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    livery = {
      lines = { { id = "li_default", text = "Blue and gold, three hundred a year, and the last set for the prince's homecoming. She's told you, then. I think of the stitching and not the day, and I've told her to do the same, though I know she can't always." } },
      choices = {
        { text = "You're easier about it than she is.", next = "BACK", reply = "I'm easier about most things. One of us had to be, and she'd already taken the other part." },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "le_default", text = "Wool next, then silk, and don't hurry between them. Wool forgives a crooked seam and silk remembers it forever. When you can set a sleeve in wool without a pucker, go and see Rhiannon, and tell her I said you were ready." } },
      choices = {
        { text = "I'll practise the sleeve.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lordaeron = { { id = "tp_lord", text = "It kept me in work for thirty years, and I was happy in it. I'll not pretend otherwise because of how it ended." } },
    arthas = { { id = "tp_arthas", text = "I sewed for his homecoming. They were very good liveries, and that's as far as I go with it." } },
    advice = { { id = "tp_ad", text = "Press every seam as you sew it. Nobody does, and it's the whole difference between made and well made." } },
    forsaken = { { id = "tp_fs", text = "We keep coming apart at the seams, and I mean that kindly. It's steady work for a tailor." } },
    sylvanas = { { id = "tp_syl", text = "I should dearly love to make her a cloak. I've never dared offer, and Angela says I'd only hum at her." } },
    dalaran = { { id = "tp_dal", text = "The Kirin Tor wore the best violet cloth I ever handled. I've a scrap of it still, pinned inside my sewing box." } },
    _none = { { id = "tp_none", text = "I've not the faintest idea, but sit down and tell me about it anyway." } },
  },
}
