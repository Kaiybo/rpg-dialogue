-- Brill's teachers: the priest trainer who tests the Light before the dark, and the mage,
-- rogue and herbalist trainers at the Gallows' End and around the square.
-- Voices: bibles/brill_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Dark Cleric Beryl: Brill's priest trainer.
P:NPC {
  key = "tir_beryl", id = TODO_NPC("Dark Cleric Beryl"), name = "Dark Cleric Beryl", title = "Priest Trainer",
  bible = "bibles/brill_trainers.md", role = "trainer", tier = "quest",
  communities = { "brill" }, temper = { "calm", "cold" }, values = { "wise", "stern" },
  notices = { "class", "race", "light", "form" },
  impression = {
    first = "She seems to find the Light more useful than holy.",
    third = "{name} met Dark Cleric Beryl, Brill's priest trainer, who tests her students on the Light before teaching them darker things.",
  },

  greetings = {
    { id = "g_default", text = "Speak plainly and quietly. I've students who are trying to listen to things you can't hear." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "A priest. Good; come closer, and let me see how much of the Light still answers you." },
    { id = "g_active", when = { questActive = TODO_QUEST("Garments of Darkness") }, text = "Deathguard Kel is north of the cemetery, waiting on a healer. Mend him, shield him, and come back to me." },
    { id = "g_done", when = { questDone = TODO_QUEST("Garments of Darkness") }, text = "You passed my little test easily enough. Wear the robe as though you meant it, because others will be watching." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}. I hope you've been practising, because the shadow doesn't wait for anyone who stops." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You carry more power than when I first tested you. Be careful with it, because power is the easy part." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "You wear the shadow openly in the street. Bold, but I'd sooner my students learned discretion before they learned to show off." },
    { id = "n_troll", cat = "race", when = { class = "PRIEST", race = "Troll" },
      text = "A troll priest, in Brill. Your loa are not my concern, but I'll teach you what I know of the Light and the dark both, if you've the patience." },
    { id = "n_light", cat = "light", when = { class = "PALADIN" },
      text = "A paladin, among the Forsaken. You'll find we have a more practical relationship with the Light than you were taught, and fewer hymns." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dark Cleric Beryl. I teach the priests of Brill, and before I teach them anything of the shadow, I make certain they understand the Light, since you can't master the dark if you don't know what it's the absence of." },
        { id = "h_before", when = { class = "PRIEST", race = "Scourge", questBefore = TODO_QUEST("Garments of Darkness") },
          text = "I have a test for you, and it isn't the one you're expecting. You'll heal with the Light first, and shield with it, and only then will I trust you with anything darker." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Garments of Darkness"), days = 3 } },
          text = "Deathguard Kel says you mended him well, and he isn't easily impressed. Take the robe, and know that more will be asked of you, and darker powers offered, soon enough." },
        { id = "h_notpriest", when = { ["not"] = { class = "PRIEST" } },
          text = "You're no priest, so I've nothing to teach you, but I don't mind questions as long as they're quiet ones." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it brief, and keep it low." },
        { id = "h_again2", text = "Ask, then. Silence is a lesson too, but not one you seem ready for." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why test the Light, if we serve the shadow?", next = "test" },
        { text = "Who is Deathguard Kel?", next = "kel" },
        { text = "Does the Light still answer the dead?", next = "light" },
        { text = "What is the Forgotten Shadow?", next = "shadow" },
        { text = "What becomes of a priest after your robe?", next = "after", when = { questDone = TODO_QUEST("Garments of Darkness") } },
        { text = "I'll go.", next = "END" },
      },
    },

    test = {
      lines = { { id = "t_default", text = "Because the Light is a tool, and a good one, and I'll not have my students throw it away out of spite. A priest who can't mend a wounded Deathguard is no use to anyone, however dark the words she whispers." } },
      choices = {
        { text = "Isn't the Light our enemy now?", next = "test_enemy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test_enemy = {
      lines = { { id = "te_default", text = "The Crusade is our enemy, and it wields the Light, but that's not the same thing. The Light didn't burn us; men did, and they'd have burned us with torches if they'd had no prayers at all." } },
      choices = {
        { text = "So the Light is only a weapon?", next = "test_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test_stance = {
      big = true,
      lines = { { id = "ts_default", text = "It's a power, and powers don't care who uses them. That troubles some of my students, who want the Light to have hated them, because then their anger would have somewhere to go." } },
      choices = {
        { text = "The Light abandoned us. I'll not forgive it.", next = "BACK", reply = "Then don't forgive it, and see whether the anger makes a good priest of you. Shadow will take that anger gladly, though it won't thank you for it.", fx = { align = { light = -1 } } },
        { text = "The Light didn't abandon us. People did.", next = "BACK", reply = "That's the wiser view, and the harder one to live with, because people can still be punished. Keep that thought and you'll understand the shadow better than most.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    kel = {
      lines = { { id = "k_default", text = "A Deathguard who keeps watch north of the cemetery, and comes off worse from it more often than he admits. He's my test because he's honest, and he'll tell me whether your healing held or whether he had to bandage himself afterwards." } },
      choices = {
        { text = "Does he mind being practised on?", next = "kel_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kel_mind = {
      lines = { { id = "km_default", text = "He minds the clumsy ones. He told me last month that one of my students healed him so hard his teeth rattled, which I'm told isn't possible, though I wasn't there to see it." } },
      choices = { { text = "I'll be gentle with him.", next = "BACK", fx = { affinity = 1 } } },
    },

    light = {
      lines = {
        { id = "l_default", text = "It does, though it stings us to call it, and some can't bear the sting. The Light doesn't seem to ask whether the hand reaching for it is warm or cold, and I find that more interesting than the priests of Lordaeron ever did." },
        { id = "l_scourge", when = { race = "Scourge", class = "PRIEST" }, text = "You know it does, because you've felt it burn in your hands when you heal. The Light doesn't ask whether the hand is warm or cold, only whether it's willing to bear the pain." },
      },
      choices = {
        { text = "Why does it sting?", next = "light_sting" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_sting = {
      lines = { { id = "ls_default", text = "I have a theory, and Sarvis in Deathknell has a different one, and we argue about it whenever we meet. Mine is that the Light remembers what we were made by, and it hurts to be reminded of the Scourge's touch, even for the Light." } },
      choices = {
        { text = "And Sarvis's theory?", next = "light_sarvis" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_sarvis = {
      lines = { { id = "lsa_default", text = "Sarvis says it stings because we won't be afraid of it, and fear is what it's used to being given. He's a better priest than he is a philosopher, but I'll admit his theory is the more cheerful of the two." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shadow = {
      lines = { { id = "sh_default", text = "It's our faith, such as it is. The Cult of Forgotten Shadow teaches that death is a door we've already walked through, so there's nothing left behind it to fear, and the shadow is simply the power of standing on the other side." } },
      choices = {
        { text = "Is it a faith or a philosophy?", next = "shadow_faith" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_faith = {
      big = true,
      lines = { { id = "sf_default", text = "Both, and neither, depending on which of us you ask and how late it is. I've no gods to offer you, only the knowledge that you've already lost everything once and you're still here, which is more comfort than most gods give." } },
      choices = {
        { text = "That's comfort enough for me.", next = "BACK", reply = "Then you're further along than most of my students, who spend months mourning the gods who never came. Survival is a quiet sort of faith, but it holds.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'd rather have something to believe in.", next = "BACK", reply = "Most of us would, and some of the cult find their way back to something. I'll not stop you looking, so long as you don't let it make a fool of you.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    after = {
      lines = { { id = "a_default", text = "More lessons, and harder ones, and the Undercity's priests will start to notice you. The robe tells them you've been tested and passed, which is more than many who wear one can say." } },
      choices = {
        { text = "What will they ask of me?", next = "after_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_ask = {
      big = true,
      lines = { { id = "aa_default", text = "Obedience, at first, and then judgement, and the hard part is knowing which one they want on a given day. Serve the Dark Lady well and the cult will reward you, but serve your own mind first, or you'll make a poor priest of any kind." } },
      choices = {
        { text = "I'll serve the cult as it asks.", next = "BACK", reply = "The cult will find good use for you, then, and that's a safe road. Only remember that the cult is made of people, and people get things wrong.", fx = { align = { order = 1 } } },
        { text = "My own mind first, then. Always.", next = "BACK", reply = "A dangerous answer to give in the Undercity, but the right one to give me. Keep your own mind, and serve the Dark Lady with it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not a matter for a priest. Ask Magistrate Sevren, or ask nobody." } },
  },
}

-- Cain Firesong: mage trainer at the Gallows' End.
P:NPC {
  key = "tir_cain", id = TODO_NPC("Cain Firesong"), name = "Cain Firesong", title = "Mage Trainer",
  bible = "bibles/brill_trainers.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "chatty", "proud" }, values = { "curious", "ambitious" },
  notices = { "class", "arcane" },
  impression = {
    first = "He has not forgiven Dalaran for anything.",
    third = "{name} met Cain Firesong, who trains mages at the Gallows' End in Brill.",
  },
  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage! Sit down, sit down, and mind Innkeeper Renee's tablecloth, she's very particular after last time." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "You're not one of mine, but you may watch, provided you stand well back. My students have enthusiasm, and not all of it aims where they mean it to." },
    { id = "g_anastasia", when = { questActive = TODO_QUEST("Speak with Anastasia") }, text = "Anastasia Hartwell is waiting in the Undercity's Magic Quarter, so go, and give her my regards, and don't tell her about the tablecloth." },
  },
  notice = {
    { id = "n_arcane", cat = "arcane", when = { class = { "MAGE", "WARLOCK" }, race = "Scourge" },
      text = "Your hands still remember the gestures, I can see it. Death steals the names and faces, but it leaves the spellwork, and I find that says something about where the mind keeps its treasures." },
    { id = "n_living", cat = "class", when = { class = "MAGE", race = "Troll" },
      text = "You cast with your whole arm, I notice, where we were taught to keep the elbow still. Don't change it on my account, because I want to see whether it's worse or only different." },
    { id = "n_lock", cat = "arcane", when = { class = "WARLOCK" },
      text = "One of Rupert's. He and I share a wall and a low opinion of each other's reading, but I'll say this for him, his pupils never set fire to the furniture." },
  },
  start = "hello",
  nodes = {
    pupils = {
      lines = { { id = "pu_default", text = "They have, and I point to each one with pride. That long scorch is a girl from Deathknell who had never held a flame before, and the round one is a clerk who sneezed halfway through the incantation, and both of them are in the Undercity now, doing well." } },
      choices = {
        { text = "What does Renee say about her ceiling?", next = "pupils2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pupils2 = {
      lines = { { id = "pu2_default", text = "A great deal, and all of it deserved. I pay for the whitewash and I teach frost on the days she's cross, and we've agreed that the upstairs rooms are forbidden to anyone who can't yet put a fire out as fast as they can start one." } },
      choices = {
        { text = "That seems a fair treaty.", next = "BACK", reply = "It's the only one in Lordaeron that's being kept, so I'm rather proud of it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals = {
      lines = { { id = "rv_default", text = "Colleagues, please. Rupert Boch has the warlocks and thinks mages are timid, Marion Call has the rogues and thinks everyone is loud, and Dark Cleric Beryl has the priests and thinks about things I prefer not to ask after." } },
      choices = {
        { text = "And what do they think of you?", next = "rivals2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals2 = {
      big = true,
      lines = { { id = "rv2_default", text = "That I talk too much and that I enjoy it too much, and they're right on both counts. Rupert says a Forsaken has no business being cheerful about magic after what magic did to Lordaeron, and I've never found the answer that shuts him up." } },
      choices = {
        { text = "Joy in your craft dishonours no one. Keep it.", next = "BACK", reply = "There! I shall quote you to him at supper, and watch him chew on it. Thank you, that's the answer I wanted.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He's right. Magic is a weapon, not a pleasure.", next = "BACK", reply = "Then you'll make a very efficient mage and a very dull one. I'll teach you all the same, and hope the fire changes your mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    school = {
      lines = { { id = "sc_default", text = "Fire, because it's honest and it answers quickly, and nothing in these Glades likes it. Learn frost second, for the days when something is running at you faster than you can burn it, and leave the arcane until your hands have stopped shaking." } },
      choices = {
        { text = "Fire first, then. I'll mind the tablecloth.", next = "BACK", reply = "See that you do. I've used up all of Renee's forgiveness for this season.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Cain Firesong, at your service, and yes, it's the name I chose. When you come back from the grave you may as well come back as something memorable." },
        { id = "h_troll", when = { race = "Troll", class = "MAGE" }, text = "A troll mage, and I'm told your people's magic is mostly whispers and bones. Let me show you what a Lordaeron education can do, and you can tell me which you prefer." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm happy to talk; it's the listening I've trouble with." },
        { id = "h_again2", text = "Go on. The fire's warm, or so they tell me." },
        { id = "h_again3", text = "What else shall we talk about? I've a lesson in an hour, and until then I am entirely yours." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why Firesong?", next = "name" },
        { text = "What do you think of Dalaran?", next = "dalaran" },
        { text = "Why teach in a tavern?", next = "tavern" },
        { text = "Who is Anastasia Hartwell?", next = "anastasia", when = { class = "MAGE" } },
        { text = "Your pupils have left marks on Renee's ceiling.", next = "pupils" },
        { text = "You share the inn with a good many other trainers.", next = "rivals" },
        { text = "What school should a mage of Brill learn first?", next = "school", when = { class = "MAGE" } },
        { text = "Tell me about the road ahead, Cain.", next = "m_road", when = { class = "MAGE" } },
        { text = "I'm an orc, learning fire in a Forsaken tavern.", next = "m_orc", when = { class = "MAGE", race = "Orc" } },
        { text = "A tauren mage among the dead. Strange, isn't it?", next = "m_tauren", when = { class = "MAGE", race = "Tauren" } },
        { text = "Farewell, Cain.", next = "END" },
      },
    },
    m_road = {
      hub = true,
      lines = {
        { id = "mr_default", text = "The road, yes! It runs from this tablecloth to the Magic Quarter and then out into the wide unkind world, and I've walked the first stretch of it so often I could teach it asleep, if I slept." },
        { id = "mr_high", when = { minLevel = 30 }, text = "You've come back to Brill, at your level! Either you're sentimental or you've left something upstairs, and I hope it's the first." },
      },
      again = {
        { id = "mr_again", text = "What else about the road? I've a lesson in an hour, and I'd much rather talk." },
        { id = "mr_again2", text = "Go on, go on. Renee's not listening, for once." },
      },
      choices = {
        { text = "Polymorph on a Scarlet. Is that cruel?", next = "m_poly", when = { minLevel = 8 } },
        { text = "Frost Nova saved me in the Scarlet fields.", next = "m_nova", when = { minLevel = 10 } },
        { text = "Slow Fall seems a frivolous spell.", next = "m_slowfall", when = { minLevel = 12 } },
        { text = "I can step home now. Why visit Brill at all?", next = "m_twenty", when = { minLevel = 20 } },
        { text = "The trainers speak of Tabetha in the marsh.", next = "m_tabetha", when = { minLevel = 26 } },
        { text = "Enough of the road, Cain.", next = "BACK" },
      },
    },
    m_poly = {
      big = true,
      lines = { { id = "mp_default", text = "Cruel to whom? The Crusader spends a minute as a sheep, which is the only peaceful minute he's had since he took the oath. I've sometimes wondered whether they'd be happier left that way." } },
      choices = {
        { text = "Perhaps a sheep is kinder than a zealot.", next = "m_road", reply = "Exactly what I said to Rupert, and he didn't laugh either.", fx = { align = { light = 1 } } },
        { text = "I turn him back so I can burn him.", next = "m_road", reply = "Practical, grim and very Forsaken of you. I can't fault the logic, only the mood.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_nova = {
      lines = { { id = "mn_default", text = "Of course it did; it's the best spell in the book for a mage caught too close, which in the Scarlet fields is every mage. Freeze them, step back three paces, and decide what they deserve while they're still deciding whether to pray." } },
      choices = {
        { text = "I'll freeze them and let them flee, if they will.", next = "m_road", reply = "Generous. They won't flee, mostly, but it's nice to offer.", fx = { align = { light = 1 } } },
        { text = "Frozen men don't flee. I finish them.", next = "m_road", reply = "Efficient. Rupert would approve, and I'm not sure that's a compliment.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_slowfall = {
      lines = { { id = "msf_default", text = "Frivolous until something large throws you off a cliff in Silverpine, and then it's the only spell in the world you want. Buy light feathers from Hannah Akeley in the Undercity and keep a few in every pocket, because you'll never know you need one until you're already falling." } },
      choices = { { text = "Back to the road.", next = "m_road" } },
    },
    m_twenty = {
      lines = { { id = "mt_default", text = "Because Renee's fire is warm, and because the Magic Quarter is full of people who won't let me finish a sentence. Come back now and then and tell me where you've been, because I live on other people's travels these days." } },
      choices = {
        { text = "I'll come back and tell you everything.", next = "m_road", reply = "Promise? Then I'll keep the good chair for you, and I'll tell Renee it's for a hero.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll be too busy for taverns.", next = "m_road", reply = "Of course you will; they all are. The ceiling will remember you, at least.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_tabetha = {
      lines = { { id = "mtb_default", text = "Tabetha! A living woman who lives in a swamp and teaches anyone with the nerve to find her, and I'm told she's never once asked a Forsaken pupil to explain himself. That's more courtesy than the Kirin Tor ever gave me when I had a pulse." } },
      choices = {
        { text = "Then she'll have my courtesy in return.", next = "m_road", reply = "Good. Give her my compliments, and don't mention that I set fire to things for a living.", fx = { align = { honor = 1 } } },
        { text = "Courtesy won't stop me taking what I can learn.", next = "m_road", reply = "Nor should it, I suppose. Only take it politely; she lives alone with a great deal of fire.", fx = { align = { honor = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_orc = {
      big = true,
      lines = { { id = "mo_default", text = "An orc, in my tavern, learning my fire! Rupert will be beside himself, because he thinks every orc with a spell is secretly one of his. Are you?" } },
      choices = {
        { text = "No. I've seen what that path did to my people.", next = "BACK", reply = "Then you're wiser than half the Horde's elders gave you credit for. Sit down, and mind the tablecloth.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Who's to say what I'll become, in time?", next = "BACK", reply = "That's exactly what Rupert's students say. I'd rather you didn't, but I'll teach you anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_tauren = {
      lines = { { id = "mta_default", text = "A tauren mage out here in the Glades, among the dead! Your people must think you've lost your senses, and I'd like to think you've found them. What brought you to fire?" } },
      choices = {
        { text = "A grassfire on the plains, and how it answered me.", next = "BACK", reply = "It answered you! That's how it was for me too, waking in the dark. Fire's a friend who comes when called.", fx = { affinity = 1 } },
        { text = "Curiosity. The Earth Mother made fire too.", next = "BACK", reply = "Then she and I would get along, and I'd ask her what she thinks of Renee's ceiling." },
      },
    },
    name = {
      lines = { { id = "n_default", text = "Because I couldn't remember my old one, and fire is the first spell I remembered when I woke. It seemed only polite to take the name of the friend who came back with me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dalaran = {
      lines = { { id = "d_default", text = "I think they sat behind their walls arguing about protocol while Kel'Thuzad walked out of their halls with the plague in his pocket. Then they sent mages to Ambermill in Silverpine to guard a ruin, which tells you everything about their priorities." } },
      choices = {
        { text = "They suffered too, Cain.", next = "dalaran_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_stance = {
      big = true,
      lines = { { id = "ds_default", text = "They did, and the demons laid their city low, and I'm not cruel enough to cheer it. But they had the knowledge to see it coming and the pride not to, and pride is a sin I'm qualified to recognise." } },
      choices = {
        { text = "Dalaran's pride doomed Lordaeron. They earned it.", next = "BACK", reply = "Earned it, perhaps, though I'd not say so over their graves. Whatever they deserved, Lordaeron paid the bill for them, and we're still paying it.", fx = { align = { honor = -1 } } },
        { text = "Hindsight is cheap. They did what they could.", next = "BACK", reply = "Hindsight's all the dead have left, and I find it very cheap indeed. Still, you're more generous than I am, and perhaps that's a virtue worth keeping.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tavern = {
      lines = { { id = "t_default", text = "Because the Undercity has proper tutors, and Brill has me, and I'm cheaper and better company. Also, Renee keeps a bucket of water by the door, which is the most useful teaching aid I've ever had." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    anastasia = {
      lines = { { id = "a_default", text = "A tutor in the Undercity's Magic Quarter, and a much more serious mage than me. When you're ready, I'll send you to her, and she'll set you a task that will teach you something I can't, mostly patience." } },
      choices = {
        { text = "I'll be ready soon.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    kirin_tor = { { id = "tp_kirin", text = "I applied to them twice in life and was told I lacked discipline. They may have had a point, but I've outlasted most of the committee." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They burn mages along with everyone else, and they're rather good at it, which I take as a professional insult." } },
    advice = { { id = "tp_ad", text = "Finish the incantation before you admire the result. Most of the marks on that ceiling come from pupils who did it the other way round." } },
    forsaken = { { id = "tp_forsaken", text = "We came back with our spellwork and without our names. I chose a new name to match the part I'd kept, and I recommend it to anyone." } },
    _none = { { id = "tp_none", text = "Not my subject. Mine is fire, and occasionally frost, when Renee complains." } },
  },
}

-- Marion Call: rogue trainer at the Gallows' End.
P:NPC {
  key = "tir_marion", id = TODO_NPC("Marion Call"), name = "Marion Call", title = "Rogue Trainer",
  bible = "bibles/brill_trainers.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "smooth", "watchful" }, values = { "cunning", "careful" },
  notices = { "class", "stealth" },
  impression = {
    first = "Five minutes told her more about me than I meant to tell.",
    third = "{name} met Marion Call, who trains rogues at the Gallows' End in Brill.",
  },
  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "There you are. I heard you on the stairs, which we'll work on." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "You've walked into the wrong corner, friend, but sit if you like. I don't bite, and I only listen when it's worth it." },
    { id = "g_mennet", when = { questActive = TODO_QUEST("Mennet Carkad") }, text = "Mennet Carkad waits in the Undercity's Rogues' Quarter. He'll find you before you find him, so don't worry about the finding." },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Very good, but your shadow's on the wall behind you. Lamps, {class}; always know where the lamps are." },
    { id = "n_living", cat = "class", when = { class = "ROGUE", race = { "Orc", "Troll" } },
      text = "You breathe when you creep, which none of my other pupils do. We'll work on timing it, because you can't give it up and I can't teach around it." },
    { id = "n_purse", cat = "class", when = { money = { min = 50000 } },
      text = "That's a heavy purse to wear on the outside in a town full of my students. I've told them guests are off limits, but I'd not test how well they listen." },
  },
  start = "hello",
  nodes = {
    corner = {
      lines = { { id = "co_default", text = "I chose it with care. From here I can see the door, the stairs and the cellar hatch, and Renee's lamp doesn't reach me unless she trims the wick, which she does on purpose when she thinks I've been listening too long." } },
      choices = {
        { text = "The innkeeper keeps an eye on you, then.", next = "corner2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corner2 = {
      lines = { { id = "co2_default", text = "Renee keeps an eye on everyone, and she's better at it than I am, because nobody suspects the woman pouring the drinks. If she'd come to me young enough, I'd have made something frightening of her." } },
      choices = {
        { text = "Perhaps she already is.", next = "BACK", reply = "Now you're thinking the way I teach. Don't say it where she can hear, or she'll trim the lamp on both of us.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pupils = {
      lines = { { id = "pp_default", text = "Poachers, pickpockets and one or two who were something worse and are honest about it. Death is a fine thing for a rogue, because we don't breathe and we don't tire, but it makes them careless about being seen, since they think nothing more can happen to them." } },
      choices = {
        { text = "And you teach them otherwise.", next = "pupils2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pupils2 = {
      lines = { { id = "pp2_default", text = "I take them out to the Scarlet tower on the west road and let them watch what the Crusade does with a Forsaken it catches. After that they listen. The ones who do well I send down to Mennet Carkad in the Undercity, and I don't ask what he does with them." } },
      choices = {
        { text = "A hard lesson, but it sticks.", next = "BACK", reply = "The soft ones don't. I've buried pupils twice, and I'd like not to make it three times." },
        { text = "Something else, Marion.", next = "BACK" },
      },
    },
    fix = {
      lines = {
        { id = "fx_default", text = "Your eyes. You look at the thing you want, and anybody watching your face knows what it is before your hand moves. Look at the door, look at the barmaid, look at anything else, and let your fingers do the wanting." },
        { id = "fx_high", when = { minLevel = 20 }, text = "Very little, at this point, and I don't say that often. You still check your purse after a job, though, with a little pat, and a watchman who knows the habit can pick you out of a crowd by it." },
      },
      choices = {
        { text = "I'll practise on Renee's patrons.", next = "BACK", reply = "Practise looking, not taking. Guests of the inn are under the magistrate's eye, and so am I." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Marion Call. I teach the quiet arts to anyone with quick hands and a reason to use them. Brill's a small town, so I also hear most of what's said in it, and I tell Magistrate Sevren the parts that matter." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice low; Renee's tables have ears." },
        { id = "h_again2", text = "Go on. I'm listening, as always." },
        { id = "h_again3", text = "Is there more? Lean in if there is, I'd sooner not raise my voice." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Who is Mennet Carkad?", next = "mennet", when = { class = "ROGUE" } },
        { text = "You report to the magistrate?", next = "sevren" },
        { text = "What's worth hearing in Brill?", next = "gossip" },
        { text = "Who were you before?", next = "past" },
        { text = "You picked the darkest corner of the inn.", next = "corner" },
        { text = "What sort of pupils does Brill send you?", next = "pupils" },
        { text = "What's the first thing you'd fix in me, Marion?", next = "fix", when = { class = "ROGUE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    mennet = {
      lines = { { id = "m_default", text = "A deathstalker, and a teacher of the sharper sort, in the Undercity. When you've learned what I can show you, he'll show you what the Dark Lady needs from people like us, which is mostly letters that aren't ours to read." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "syndicate" } } } },
    },
    sevren = {
      lines = { { id = "s_default", text = "I tell him what matters, and he pretends he'd have found it out anyway. It's a good arrangement; he keeps his town, and I keep my corner, and the deathstalkers don't have to bother either of us." } },
      choices = {
        { text = "So you're an informer.", next = "sevren_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sevren_stance = {
      big = true,
      lines = { { id = "ss_default", text = "I'm a citizen with good hearing, and that's a much nicer word for it. Every town needs someone who listens, and better me than someone with a grudge." } },
      choices = {
        { text = "Someone has to keep order. Good on you.", next = "BACK", reply = "Order, yes, and a quiet word to the magistrate keeps it better than a blade in an alley. I'm glad someone in Brill appreciates the service.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A thief who reports to magistrates isn't much of one.", next = "BACK", reply = "Not much of a thief, perhaps, but a very long-lived one. The rogues who scorned the magistrates are mostly hanging from the gallows outside, if you'd care to ask them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip = {
      lines = { { id = "go_default", text = "Coleman Farthing still talks to the Agamands' portrait when he thinks nobody's listening, and Johaan's been buying more vials than his work could possibly need. There's also a courier who passes through from the Sepulcher with very clean boots, and I don't trust clean boots." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    past = {
      lines = { { id = "p_default", text = "I was someone who knew which windows in Lordaeron's merchant quarter didn't latch. I don't miss it, though I miss the bread from the bakery across the way, which I never once paid for." } },
      choices = {
        { text = "Then you were a thief.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    syndicate = { { id = "tp_syndicate", text = "The Syndicate are Alterac's old nobles playing at thieves. They're not as clever as they think, but they're cleverer than the Deathguard think." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They've no rogues to speak of, only zealots, and a zealot always looks where he's told. It makes them easy to walk behind and very hard to bribe." } },
    advice = { { id = "tp_ad", text = "Know where the lamps are and where the door is before you sit down. Everything else I teach is a refinement of that." } },
    forsaken = { { id = "tp_forsaken", text = "We're a people who survive by being underestimated. I'd keep it that way as long as we can." } },
    _none = { { id = "tp_none", text = "Haven't heard that one. Give me a day." } },
  },
}

-- Faruza: Brill's herbalism trainer.
P:NPC {
  key = "tir_faruza", id = TODO_NPC("Faruza"), name = "Faruza", title = "Herbalism Trainer",
  bible = "bibles/brill_trainers.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "calm", "earnest" }, values = { "craft", "patient" },
  notices = { "craft", "race" },
  impression = {
    first = "She treats the blighted plants as patients rather than lost causes.",
    third = "{name} met Faruza, Brill's herbalism trainer.",
  },
  greetings = {
    { id = "g_default", text = "Wipe your boots, please; you've brought half of the cemetery in on them." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "An herbalist! Let me smell your satchel: peacebloom, earthroot, and something at the bottom that's gone off." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, in Brill! Your people know more about growing things than all of Lordaeron ever did. I'd learn from you, if you'd let me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Faruza, and I teach herbalism to anyone patient enough to kneel in the mud for it. Tirisfal's soil is sick, but things still grow in it, and the apothecaries pay well for the ones that grow strangely." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I've seeds to sort." },
        { id = "h_again2", text = "Go on. Plants don't mind waiting." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What grows in Tirisfal?", next = "grows" },
        { text = "Do the apothecaries buy from you?", next = "apoth" },
        { text = "Why herbs, for one of the dead?", next = "why" },
        { text = "Do you keep a garden of your own?", next = "garden" },
        { text = "What's the first thing an herbalist learns?", next = "lesson" },
        { text = "Here. Smell my satchel and tell me what's off.", next = "xherb", when = { profession = "Herbalism" } },
        { text = "The Earth Mother could heal this soil, in time.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Good day, Faruza.", next = "END" },
      },
    },
    grows = {
      lines = { { id = "gr_default", text = "Peacebloom and silverleaf near the roads, earthroot in the hills, and mageroyal by the water if you're lucky. Then there's doom weed, which Holland pays for, and which you should never, ever touch without gloves." } },
      choices = {
        { text = "Why gloves, for doom weed?", next = "grows2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows2 = {
      lines = { { id = "g2_default", text = "Because it grows where the plague sank deepest, and it carries some of it in the sap. I picked a sickly-looking stalk bare-handed once, early on, and my fingers went black to the knuckle for a week." } },
      choices = {
        { text = "What happened after that?", next = "grows3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows3 = {
      lines = { { id = "g3_default", text = "The apothecaries came asking where I'd found it, very politely, with their notebooks out. Holland still asks, every month, whether I've seen any more of it, and I always say no, whether or not it's true." } },
      choices = {
        { text = "You don't trust him.", next = "BACK", fx = { learn = { "new_plague" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    garden = {
      lines = { { id = "ga_default", text = "A little one behind the inn, in three old crates of soil I carried up from the Glades. Half of it is weeds the apothecaries want, and the other half is marigolds, which nobody wants at all except me." } },
      choices = {
        { text = "Why marigolds?", next = "garden2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garden2 = {
      lines = { { id = "a2_default", text = "My mother grew them on her windowsill in Brill, before Brill was what it is now. I can't smell them properly anymore, but I remember they smelled of summer, and that's near enough." } },
      choices = {
        { text = "Keep growing them, Faruza.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson = {
      lines = { { id = "le_default", text = "To take only what you need and leave the root, so there's something next season. The dead forget that, because we've stopped thinking about next season, and I won't teach anyone who strips a hillside bare." } },
      choices = { { text = "Leave the root in the ground. I'll remember.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    xherb = {
      lines = { { id = "xh_default", text = "Peacebloom, silverleaf, and yes, there, a bit of earthroot you packed wet that's gone soft at the bottom. Dry them in the sun before you bag them, even Tirisfal's poor excuse for sun." } },
      choices = { { text = "I'll do better next time. Thank you, Faruza.", next = "BACK", fx = { affinity = 1 } } },
    },
    xtauren = {
      lines = { { id = "xt_default", text = "Do you think so? I've read that your people sing to the soil, and I'd laugh, except that I talk to mine every morning and it's the only thing in Brill that listens. Would she hear a prayer from one of us, do you think?" } },
      choices = {
        { text = "The Earth Mother hears all who tend her.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    apoth = {
      lines = { { id = "a_default", text = "Apothecary Johaan does, and Apothecary Holland, for anything that grew in plague-soaked ground. I sell them what they ask for and I don't ask what it's for, because I've learned the answers are usually long and full of words I don't like." } },
      choices = {
        { text = "You should ask, Faruza.", next = "apoth_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apoth_stance = {
      big = true,
      lines = { { id = "as_default", text = "Perhaps, but I'm one woman with a basket, and they're the Royal Apothecary Society. I'll grow what grows, and leave the questions to someone with more to lose than I have." } },
      choices = {
        { text = "Knowledge is never wasted. Ask them.", next = "BACK", reply = "Then you ask them, and do let me know what they say. I'll be here with my basket, growing whatever they'll pay for.", fx = { align = { order = -1 } } },
        { text = "Wise of you. Leave the Society to its work.", next = "BACK", reply = "It's the only sensible thing to do, if you ask me, and nobody ever does. The Society has its work and I have my garden, and we leave each other well alone.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because they're alive, and I'm not, and I like to be near something that is. When a seed I planted comes up green, I feel a little less like what I am." } },
      choices = {
        { text = "That's a gentle way to live.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    new_plague = { { id = "tp_plague", text = "I sell weeds. Ask Apothecary Johaan what he does with them." } },
    forsaken = { { id = "tp_forsaken", text = "We're the dead who kept our minds, and some of us use them to brew poisons and some to grow marigolds. I know which I'd rather be remembered for." } },
    advice = { { id = "tp_ad", text = "Gloves for doom weed, a knife for earthroot, and patience for everything else. Leave the root, always." } },
    _none = { { id = "tp_none", text = "I know plants and not much else. Ask Innkeeper Renee at the inn." } },
  },
}
