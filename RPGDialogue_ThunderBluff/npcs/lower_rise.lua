-- The central mesa and lower rise: the sage who distrusts the new allies, the ceremony-keeper,
-- the last of the Stonespire, and the leather buyer. Voice: bibles/truthseeker.md, eyahn.md, auld.md, veren.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Sage Truthseeker: a scholar who trusts Cairne and very little else.
---------------------------------------------------------------------------
P:NPC {
  key = "truthseeker", id = TODO_NPC("Sage Truthseeker"), name = "Sage Truthseeker",
  bible = "bibles/truthseeker.md", role = "scholar", tier = "major",
  communities = { "thunder_bluff" }, temper = { "sharp" }, values = { "curious", "careful", "loyal" },
  notices = { "race", "dungeon", "lore" },
  impression = {
    first = "He trusts Cairne completely and the Forsaken not at all.",
    third = "{name} met Sage Truthseeker, a scholar of Thunder Bluff who gathers knowledge to advise the High Chieftain.",
  },

  greetings = {
    { id = "o_cairne_soft", when = { opinion = { cairne = "soft" } }, text = "I hear you've been telling people the Chieftain has grown soft. I write down who says that, you know, and I write down who they say it to." },
    { id = "o_sylv_trust", when = { gossip = { topic = "sylvanas", stance = "trust" } }, text = "They tell me you'd trust the Dark Lady with the Horde. I'd very much like to know what you've seen of her that I haven't." },
    { id = "g_hi", text = "Sit if you like, but keep your voice low. Everyone on this mesa listens for a living." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good, I had a question I meant to ask someone who travels." },
    { id = "g_comp", when = { questActive = TODO_QUEST("Compendium of the Fallen") }, text = "The Compendium is in the monastery's library wing, if the Scarlet zealots haven't burned it for being too honest." },
    { id = "g_comp_done", when = { questDone = TODO_QUEST("Compendium of the Fallen") }, text = "I've read the Compendium twice now, and I sleep worse for it, which is how I know it was worth having." },
    { id = "g_discs", when = { questActive = TODO_QUEST("The Platinum Discs") }, text = "The discs from Uldaman? Bring them to me before anyone on Elder Rise hears of them." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the council has changed its mind twice since. Sit down and tell me what the roads say." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's people, here at my table. I'll keep my notes face down while we talk, if it's all the same to you." },
    { id = "n_sm", cat = "dungeon", when = { cleared = "Scarlet Monastery" },
      text = "You've walked the halls of the Scarlet Monastery and come back out, which the zealots don't usually allow. Did you see their library?" },
    { id = "n_uld", cat = "lore", when = { cleared = "Uldaman" },
      text = "You've been down in Uldaman. There's stone dust in the seams of your boots that never came from Mulgore." },
  },

  start = "hello",
  nodes = {
    op_magatha = {
      lines = {
        { id = "opm_q", text = "Since you're here, let me ask you something I ask everyone who's been up to Elder Rise. What do you make of Magatha Grimtotem?" },
      },
      choices = {
        { text = "She's a viper, and Cairne should send her back to Stonetalon.", next = "op_magatha_r1", fx = { affinity = 2, align = { honor = 1 }, opinion = { magatha = "distrust" } } },
        { text = "She's clever, and she says what others only whisper. I respect that.", next = "op_magatha_r2", fx = { affinity = -2, align = { honor = -1 }, opinion = { magatha = "respect" } } },
        { text = "She's harmless while Cairne lives. After that, I'd worry.", next = "op_magatha_r3", fx = { trait = { cautious = 1 }, opinion = { magatha = "dangerous" } } },
        { text = "Her tribe threw mine out of my own grazing lands.", next = "op_magatha_r4", fx = { affinity = 1, opinion = { magatha = "hate" } }, when = { race = "Tauren" } },
        { text = "I've barely spoken with her, sage.", next = "BACK" },
      },
    },
    op_magatha_r1 = {
      lines = {
        { id = "op_magatha_r1", text = "I've said much the same to the council, though less politely. The Chieftain keeps her close for his own reasons, and I keep my notes for mine." },
      },
      choices = {
        { text = "Something else, sage.", next = "BACK" },
      },
    },
    op_magatha_r2 = {
      lines = {
        { id = "op_magatha_r2", text = "Clever, yes, and she lets you think she's being honest with you. That's the oldest trick on Elder Rise, and I'd hate to see you fall for it." },
      },
      choices = {
        { text = "Something else, sage.", next = "BACK" },
      },
    },
    op_magatha_r3 = {
      lines = {
        { id = "op_magatha_r3", text = "That's the part that keeps me awake, traveller. The High Chieftain won't live forever, and she knows it better than any of us." },
      },
      choices = {
        { text = "Something else, sage.", next = "BACK" },
      },
    },
    op_magatha_r4 = {
      lines = {
        { id = "op_magatha_r4", text = "Then you know more than any outsider could tell you. Write it down somewhere, calf, because one day the council may want to hear it." },
      },
      choices = {
        { text = "Something else, sage.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am called Truthseeker, which my grandmother meant as a blessing and the Elder Council treats as a warning. I gather what can be known, so that when the High Chieftain asks a question, someone in this city has an honest answer for him." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "I'll speak plainly, since you'd hear it from someone else anyway. I think the High Chieftain took your people into this alliance too quickly, and I have said so to his face, though I would follow him off this mesa if he asked." },
        { id = "h_comp_before", when = { questBefore = TODO_QUEST("Compendium of the Fallen"), minLevel = 30 },
          text = "The Forsaken say their intentions are pure, but I'd like to know more about our newest allies than they will tell me. There is a book in the Scarlet Monastery called the Compendium of the Fallen, and I think it could tell me what they won't." },
        { id = "h_comp_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Compendium of the Fallen"), days = 3 } },
          text = "I half believed the Compendium was a story the humans told to frighten their children, and here it sits on my table. You have served the tauren of Thunder Bluff well, {name}, whatever the council says about my methods." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A child of the Earth Mother who has seen the wider world, good. Come and tell me what the orcs and the Forsaken say when they think no tauren is listening." },
        { id = "h_dd_auld", tags = { "news" }, when = { questDone = TODO_QUEST("A Vengeful Fate") }, text = "Auld Stonespire walked past my door this morning and nodded to me, which is the first greeting Auld has given me since we both came to live on this rise. I hear Charlga Razorflank is dead and that you're the one to thank, so thank you, for my sake as much as for Auld's." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, and I'll answer as honestly as is wise, which the Earth Mother would say is honestly enough." },
        { id = "h_again2", text = "Go on. Questions are the only coin I collect." },
      },
      choices = {
        { text = "What do you make of the Forsaken, sage?", next = "forsaken" },
        { text = "Tell me about the Compendium of the Fallen.", next = "compendium" },
        { text = "What did the discs from Uldaman say?", next = "discs", when = { questDone = TODO_QUEST("The Platinum Discs") } },
        { text = "What is Uldaman, sage?", next = "discs" },
        { text = "Who has the Elder Council's ear, sage?", tag = "Persuade", next = "whisper",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Compendium of the Fallen") }, { race = "Tauren", trait = "skeptical" } } } },
          fail = { next = "whisper_closed", fx = { affinity = -1 } } },
        { text = "What does a sage actually do here?", next = "sage" },
        { text = "I'm Forsaken. Ask me what you want to know.", next = "f_ask", when = { race = "Scourge" } },
        { text = "I carried water for the seers on Spirit Rise.", next = "o_spirit", when = { origin = "tauren_spirit_rise" } },
        { text = "Have you work for me?", next = "BUSINESS" },
        { text = "Earth Mother keep you, sage.", next = "END" },
      },
    },

    forsaken = {
      lines = {
        { id = "fk_default", text = "I don't trust them, because nobody has told me what they want, and a people who will not say what they want usually want something you won't like. The Warchief's own advisors in Orgrimmar warned against them, and the High Chieftain spoke for them anyway, out of a kind heart." },
        { id = "fk_orc", when = { race = "Orc" }, text = "Ask your own elders in Orgrimmar, friend, because they warned the High Chieftain about the Forsaken before I ever did. He spoke for them anyway, out of a kind heart, and kind hearts are the easiest kind to use." },
      },
      choices = {
        { text = "What do you think they want?", next = "forsaken_want" },
        { text = "Something else, sage.", next = "BACK" },
      },
    },
    forsaken_want = {
      lines = { { id = "fw_default", text = "I think they want to be what they were, and that they'll take whatever path leads there, including paths through us. Apothecary Zamah smiles very nicely down in the Pools of Vision, and I have never once seen what she sends home to the Undercity." } },
      choices = {
        { text = "Then what should Cairne do?", next = "forsaken_do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_do = {
      big = true,
      lines = {
        { id = "fd_default", text = "Keep them close and keep them counted, the way he keeps Magatha on Elder Rise. I don't say cast them out, because the Earth Mother would not thank us for turning away the lost, but I do say watch them." },
        { id = "fd_warm", when = { disposition = { min = 70 } }, text = "Keep them close and keep them counted, which is what he does with Magatha, though he would never say so. I'll tell you the part I keep from the council, too: some days I think they're less dangerous than the people who pretend to love them." },
      },
      choices = {
        { text = "The lost deserve a second chance. Cairne is right.", next = "BACK", reply = "He is, and I'd never say otherwise in his hearing or out of it. A second chance is generous, though, and generosity doesn't mean we close our eyes.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "You're right to watch them. Trust is earned.", next = "BACK", reply = "Trust earned slowly is the kind that holds. Keep your eyes open on the lower caves, and tell me if you see anything that troubles you.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    compendium = {
      lines = {
        { id = "cp_default", text = "A human book, kept by the Scarlet Crusade in the library of their monastery in Tirisfal Glades. It is said to tell how the plague came to Lordaeron and how the dead were raised, and I would like to read that history from someone other than the dead." },
      },
      choices = {
        { text = "Why not just ask the Forsaken?", next = "compendium_ask", fx = { learn = { "scarlet_monastery" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_monastery" } } },
      },
    },
    compendium_ask = {
      lines = { { id = "ca_default", text = "Because everyone tells their own story kindly, and the Forsaken have more reason than most. The Scarlet zealots hate them so much they'd never trouble to lie on their behalf, which makes their books useful in a sour sort of way." } },
      choices = {
        { text = "And what did the book tell you?", next = "compendium_read", when = { questDone = TODO_QUEST("Compendium of the Fallen") } },
        { text = "Using one enemy to judge another. Clever.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    compendium_read = {
      big = true,
      lines = { { id = "cr_default", text = "That a man named Kel'Thuzad carried plague grain to villages full of hungry, frightened people, and that their own deaths made them soldiers. The Forsaken were victims before they were anything else, and that makes my suspicion harder to hold, though I'm still holding it." } },
      choices = {
        { text = "Then let it go. They suffered enough.", next = "BACK", reply = "Perhaps they have, and I find I'm softening even as I say it. Still, a sage who lets go of every doubt at the first sad story isn't much of a sage.", fx = { align = { honor = 1 } } },
        { text = "Victims can still be dangerous. Hold it tight.", next = "BACK", reply = "That's what my head tells me, and my heart grumbles at it. I'll hold it, then, but more gently than I did before I read those pages.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    discs = {
      lines = {
        { id = "ds_default", text = "An old dig in the Badlands, where the dwarves have been scratching at something older than their own city. The stone halls down there were built by hands that were not dwarven, whatever Ironforge tells itself." },
        { id = "ds_done", when = { questDone = TODO_QUEST("The Platinum Discs") }, text = "Uldaman is where the discs you brought me came from, and they spoke of the titans, the makers who shaped the world before any of us walked it, and of the earthen they made out of stone to tend it. The dwarves will tell you that's their history, and I suspect it's everybody's." },
      },
      choices = {
        { text = "The tauren must tell of the titans too.", next = "discs_titans", fx = { learn = { "uldaman" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },
    discs_titans = {
      lines = { { id = "dt_default", text = "Not by that name. We say the Earth Mother shaped the land and An'she and Mu'sha watch it, and the elders don't care for anyone suggesting builders came first. I care very much, because a story that disagrees with ours is the one most worth hearing." } },
      choices = {
        { text = "That must shake your faith.", next = "discs_faith" },
        { text = "Something else.", next = "BACK" },
      },
    },
    discs_faith = {
      big = true,
      lines = { { id = "df_default", text = "No, though the council fears it might. If the titans shaped the stone, someone gave them the stone to shape, and the Earth Mother is patient enough to have let them think they were in charge." } },
      choices = {
        { text = "Old truths should be dug up, whatever they say.", next = "BACK", reply = "Spoken like a seeker of truth, and the council would frown at you as they frown at me. Whatever the discs say, the Earth Mother will still be there afterward.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some things are better left buried in Uldaman.", next = "BACK", reply = "The council would agree with you, and maybe they're wiser than I am. But a truth left in the dark doesn't stop being true, it only waits for someone less careful.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    whisper = {
      big = true,
      lines = { { id = "w_default", text = "I can't prove it, so you will not repeat it. Magatha's people carry gifts to the elders' tents, and the elders come away talking about how the Bloodhoof are too friendly with outsiders, which is a Grimtotem song if ever I heard one." } },
      choices = {
        { text = "Then tell Cairne, before it spreads.", next = "whisper_cairne", fx = { learn = { "grimtotem" } } },
        { text = "Does the High Chieftain know?", next = "whisper_cairne", fx = { learn = { "grimtotem" } } },
      },
    },
    whisper_cairne = {
      lines = { { id = "wc_default", text = "He knows, and he lets it run, because a whisper you can hear is safer than one you can't. That's his way, and mine is to write everything down so that when he wants proof, I have it ready." } },
      choices = {
        { text = "I'll keep my ears open for you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    whisper_closed = {
      lines = { { id = "wcl_default", text = "Nobody worth naming, {class}, and certainly nobody I'd name to a stranger in the middle of the lower rise. Ask me something about books." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },

    sage = {
      lines = { { id = "sg_default", text = "Listens, mostly, and reads what other people would rather nobody read. The druids on Elder Rise keep the old ways and the shaman keep the spirits, and someone has to keep track of the world that's changing around both of them." } },
      choices = {
        { text = "That must be why the council distrusts you.", next = "sage_council" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sage_council = {
      lines = { { id = "sc_default", text = "The council distrusts anything it didn't think of first, and I think of so much. I don't mind, because the High Chieftain still sends for me, and the day he stops I'll know I've grown careless." } },
      choices = {
        { text = "Who on Elder Rise worries you most?", next = "op_magatha" },
        { text = "Something else, sage.", next = "BACK" },
      },
    },

    f_ask = {
      big = true,
      lines = { { id = "fa_default", text = "Very well. When you woke in the dark beneath Lordaeron, was the first thing you felt grief, or hunger? Think before you answer, because I'll know a polished reply when I hear one." } },
      choices = {
        { text = "Grief. I still carry it.", next = "f_answer", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hunger. Grief came later, and it's mostly gone.", next = "f_answer", fx = { align = { light = -1 } } },
      },
    },
    f_answer = {
      lines = { { id = "fan_default", text = "Thank you, and I mean that, because nobody else from the Undercity has given me a straight answer yet. I'll write it down, and I'll not write your name next to it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    o_spirit = {
      lines = { { id = "os_default", text = "Then you'll have heard more than the seers think you did, because nobody notices the one carrying the water. Tell me, did the Forsaken ever come up out of the Pools of Vision to speak with them?" } },
      choices = {
        { text = "Often, and quietly.", next = "BACK", fx = { affinity = 1 } },
        { text = "Never that I saw.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "That's a well-made compliment, and I can find no hook hidden in it, though I did look. Thank you." },
        { id = "s2", text = "You've noticed the work and not just the title, which is more than the council manages. I'll admit that pleases me." },
      },
      fail = {
        { id = "f1", text = "When someone praises me that warmly, I start asking what they're hoping I won't ask about. So tell me, what is it?" },
        { id = "f2", text = "I weigh words for a living, and those were light ones. Bring me something true, and I'll like you better for it." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha, now that was sharp, and it was aimed well. I spend all day among elders who never say what they mean, so you're a pleasant change." },
        { id = "s2", text = "You've caught me fairly, and I'll not pretend otherwise. Anyone who can find the soft spot in a sage that quickly is worth talking to." },
      },
      fail = {
        { id = "f1", text = "That was a guess dressed up as wit, and I've no time for guesses. Lower your voice, and try thinking before the next one." },
        { id = "f2", text = "Mockery is what people reach for when they've run out of questions. I'd hoped you had a few more in you." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "You needn't loom, because I've understood you perfectly well. I've read enough about people like you to know when to take them seriously." },
        { id = "s2", text = "Well. I make a study of dangerous things, and it seems one has sat down beside me. You have my full attention." },
      },
      fail = {
        { id = "f1", text = "I've had threats from Grimtotem who meant them, and I wrote every one down with the date. Yours will go at the bottom of the page." },
        { id = "f2", text = "Fear only works on those who don't know what's behind it, and finding out what's behind things is my whole trade. Sit down, and stop making a scene on the rise." },
      },
    },
  },
  confides = {
    { id = "cnf_1", text = "The Grimtotem on Elder Rise use a narrow rope path down the back of the bluff at night, and their messengers carry letters toward the Thousand Needles." },
    { id = "cnf_2", text = "The library in the Scarlet Monastery has a second floor that the zealots rarely guard, and the oldest books are kept there under lock." },
    { id = "cnf_3", text = "Magatha keeps her letters in a carved chest by her bed, and only one of her servants is allowed near it." },
  },
  blurts = {
    { id = "bl1", text = "The Grimtotem at Darkcloud Pinnacle in the Thousand Needles answer to Magatha, whatever she says on Elder Rise. I can't prove it yet, and the High Chieftain won't move until I can." },
    { id = "bl2", text = "The Compendium of the Fallen sits in the library of the Scarlet Monastery, and the zealots guard their books more closely than their lives. I want it back, and I'd take it from anyone's hands." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you ask good questions, {name}, which is rarer than you'd imagine. Most people ask questions they already know the answer to." },
      { id = "rg_2", when = { fondness = "earned" }, text = "You've brought me answers I couldn't have found alone, and you didn't pretend to know more than you did. That honesty is worth more to me than any tome." },
      { id = "rg_3", when = { fondness = "values" }, text = "You're careful and curious in equal measure, which is the right balance for a scholar or a scout. I've met few who manage both." },
      { id = "rg_al", when = { alignment = { axis = "order", min = 30 } }, text = "You respect the law and you keep your word, and those two things make you more trustworthy than half the council. I've checked." },
    },
    confide = {
      { id = "cf_1", text = "I've spent every season since we came to Mulgore trying to prove Magatha is behind the Grimtotem raids, and I'm closer than she thinks. The problem is that Cairne won't believe a word of it without evidence he can hold." },
      { id = "cf_2", text = "My grandmother taught me to ask who benefits from every story. I learned that rule too well, and now I can't hear even a kind word without wondering what it's for." },
    },
    trust = {
      { id = "tr_1", text = "Trust the High Chieftain, because Cairne has never once lied to me, even when it would have been easier. Trust the Arch Druid as well, who's as honest as he is slow." },
      { id = "tr_2", text = "Don't trust anyone on Elder Rise who smiles too often at the Grimtotem. Smiles are cheap, and Magatha buys them in bulk." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the Grimtotem who come and go from Elder Rise at night. They don't use the main lifts, and that's how I know they're up to something." },
      { id = "wo_2", text = "If you go to the Scarlet Monastery, guard any book you find there with your life. The zealots will kill you sooner for a page than for a sword." },
    },
    worries = {
      { id = "wy_1", text = "I worry I'll find proof against Magatha too late, after she's already done whatever she's planning. Cairne is wise, but he's too trusting of an old friend." },
      { id = "wy_2", text = "The Forsaken in the Pools of Vision are watching us as closely as we watch them, and I don't think their reasons are as innocent as ours." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to bring the Compendium of the Fallen back to Thunder Bluff and learn what the tauren have forgotten. Our history is scattered across the world, and I'd like to gather it." },
      { id = "hp_2", text = "I hope that someday the High Chieftain thanks me for being suspicious, and that I'm wrong about everything. I'd rather be wrong than right about Magatha." },
    },
    favor = {
      { id = "fv_1", text = "Keep your eyes open at Darkcloud Pinnacle, and tell me who gives the Grimtotem their orders. A name is all I need to begin." },
      { id = "fv_2", text = "If you ever go into the Scarlet Monastery's library, look for the Compendium of the Fallen. I'd be in your debt for the rest of my life." },
    },
    friendship = {
      { id = "fr_1", text = "I do, {name}, and I don't say that lightly, because I trust very few people. You're one of them." },
      { id = "fr_2", when = { fondness = { best = "earned" } }, text = "You've helped me when I needed it and asked for nothing, which is what a friend does. I'm grateful, more than I usually say." },
    },
    never_told = {
      { id = "nt_1", text = "I once accused an innocent tauren of working with the Grimtotem, and he was exiled for it before I found my mistake. I've never told the council, and I've never stopped looking for him." },
      { id = "nt_2", text = "Sometimes I wonder if Magatha is right that the tauren should stand alone, without the Horde. Then I remember who's saying it, and I stop wondering." },
    },
    grievance = {
      { id = "gv1", text = "I keep notes on everyone who passes through Thunder Bluff, and yours have grown rather long and rather unflattering. That's my problem, if you must have it." },
      { id = "gv_pers", when = { grudge = "persuade" }, text = "You tried to argue me round with half a fact and a confident voice. I've spent my life catching people doing exactly that, and I caught you." },
      { id = "gv_values", when = { grudge = "values" }, text = "You tell stories that flatter yourself and leave out who else was there. I asked around, and the others remember it rather differently." },
      { id = "gv_town", when = { grudge = "town" }, text = "Thunder Bluff talks, and I listen for a living. What it says about you has not improved my opinion." },
    },
    amends = {
      { id = "am1", text = "Bring me something true that I didn't already know, and bring it honestly. That's the only coin a sage accepts." },
      { id = "am_pers", when = { grudge = "persuade" }, text = "Next time, bring evidence instead of a raised voice. I'm very easy to convince with the right page." },
    },
    spite = {
      { id = "sp1", text = "I think you're a footnote, and not an interesting one. When I write the history of these years, I'll spell your name wrong on purpose." },
      { id = "sp_values", when = { grudge = "values" }, text = "I think you'd sell the High Chieftain to Magatha for a good story and a full purse. I've written that down, too." },
    },
    _gated = {
      { id = "gt1", text = "I know the answer, but I'm careful about whom I hand my findings to, and I don't know you well enough yet." },
      { id = "gt2", text = "That one stays in my notes for now. Give me cause to trust you with it, and I'll tell you all of it." },
    },
    knows = { { id = "tp_knows", text = "I know a little about a great many things, and rather more about the people who wish I didn't. Pick one." } },
    background = { { id = "tp_bg", text = "I was raised by a grandmother who asked why at every campfire, and I never learned to stop. The High Chieftain finds it useful, and the council finds it tiresome." } },
    advice = { { id = "tp_ad", text = "When someone tells you a story that flatters them, ask who else was there. Then go and find that person." } },
    scarlet_crusade = { { id = "tp_sc", text = "Zealots, cruel ones, but they keep very good libraries, and I'll take my knowledge from wherever it's shelved." } },
    grimtotem = { { id = "tp_gt", text = "Magatha's people. They smile on Elder Rise and they carry spears in Stonetalon, and I'd like to know which face is the real one." } },
    uldaman = { { id = "tp_ul", text = "A dig in the Badlands with halls older than any dwarf. Bring me anything you find written there, and I'll find someone to read it." } },
    _none = { { id = "tp_none", text = "I haven't anything on that yet, and it nags at me like a burr under a saddle. Ask me again after you've learned something about it, and bring the whole story, not just the wind of it." } },
  },
}

---------------------------------------------------------------------------
-- Eyahn Eagletalon: Ruul's brother, who keeps the ceremonies.
---------------------------------------------------------------------------
P:NPC {
  key = "eyahn", id = TODO_NPC("Eyahn Eagletalon"), name = "Eyahn Eagletalon",
  bible = "bibles/eyahn.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "devout", "patient", "proud" },
  notices = { "kin", "trophy" },
  impression = {
    first = "He is very proud of his brother Ruul and hides it badly.",
    third = "{name} met Eyahn Eagletalon, who keeps the ceremonies of Thunder Bluff and is brother to Ruul of Bloodhoof Village.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the feathers on the mat, friend. They're sorted for the ancestors, though I know it doesn't look it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've come back. Sit, and tell me if the harpies are still screaming on the cliffs north of the Bluff." },
    { id = "g_active", when = { questActive = TODO_QUEST("Preparation for Ceremony") }, text = "Azure feathers and bronze ones, six of each. The Windfury keep the best of them, so you'll have to take them from the harpies themselves." },
    { id = "g_done", when = { questDone = TODO_QUEST("Preparation for Ceremony") }, text = "The headdress is finished, and my brother complained it was too fine, which is how I knew it was right." },
  },

  notice = {
    { id = "n_ruul", cat = "kin", when = { questDone = TODO_QUEST("Dangers of the Windfury") },
      text = "You've the look of someone Ruul has tested. He tells me who's worth meeting, and he mentioned someone like you." },
    { id = "n_feather", cat = "trophy", when = { questObjective = { TODO_QUEST("Preparation for Ceremony"), left = { max = 3 } } },
      text = "There's harpy down caught in your collar. You're nearly done, I think." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Eyahn Eagletalon, and I prepare the ceremonies, for the living who are honored and for the dead who are remembered. Right now I'm making a headdress for my brother Ruul, who must stand before the High Chieftain and has no idea how to dress for it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Preparation for Ceremony") },
          text = "I need feathers to finish my brother's headdress before he goes before Chief Bloodhoof, azure ones and bronze ones. The harpies of the Windfury north and northwest of the Bluff carry the finest, though they won't hand them over kindly." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Preparation for Ceremony"), days = 3 } },
          text = "Thank you, {name}. My part in the ceremony is nearly done now, and whenever Ruul stands before the chieftain wearing those feathers, a little of your work stands with him." },
        { id = "h_tauren_f", when = { race = "Tauren", gender = "female" },
          text = "A daughter of the plains, good. You'll know a well-sewn headdress when you see one, which is more than my brother does." },
        { id = "h_dd_windfury", when = { killed = { name = "Windfury", min = 30 } }, text = "You've been among the Windfury, I can tell by the down still stuck to your boots. If you ever bring a few good feathers back with you, I could use them, because the ceremonies never seem to have enough." },
      },
      again = {
        { id = "h_again", text = "Was there more? I can talk and sew at the same time." },
        { id = "h_again2", text = "Ask on, friend. The feathers aren't going anywhere, and neither am I." },
      },
      choices = {
        { text = "Why does Ruul stand before the chieftain?", next = "ruul" },
        { text = "What ceremonies do you prepare?", next = "ceremony" },
        { text = "Why harpy feathers, of all things?", next = "feathers" },
        { text = "Ruul tested me at Bloodhoof Village.", next = "tested", when = { questDone = TODO_QUEST("Dangers of the Windfury") } },
        { text = "I'll get your feathers.", next = "BUSINESS" },
        { text = "Your workshop smells of cedar and feathers.", next = "workshop" },
        { text = "Do the Windfury ever come near the bluff?", next = "windfury" },
        { text = "Has Ruul ever worn something you made without complaining?", next = "w5_ruul" },
        { text = "Farewell, Eyahn.", next = "END" },
      },
    },
    w5_ruul = {
      lines = { { id = "w5_ruul_l", text = "Never. Not once, since we were calves. I made him a feathered cloak for his first hunt, and he said it rustled. I made him a pair of bracers, and he said they pinched. He wore both until they fell apart, and he still complains about them." } },
      choices = {
        { text = "He wore them until they fell apart?", next = "w5_ruul2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w5_ruul2 = {
      lines = { { id = "w5_ruul2_l", text = "He did. That is how my brother says thank you. He will grumble about this headdress the whole way to the High Chieftain, and then he will stand before Cairne with his chin up and his feathers straight, and I will be prouder than he will ever know." } },
      choices = {
        { text = "Then he'll stand tall because of you.", next = "BACK", reply = "He will. Do not tell him I said so. He would complain about that too." },
        { text = "Something else.", next = "BACK" },
      },
    },
    workshop = {
      lines = { { id = "workshop_d", text = "Cedar for the ceremonies of the dead, and feathers for the ceremonies of the living. I keep them on opposite sides of the room, for my grandmother said they should never mix, and I have never had the courage to find out why." } },
      choices = {
        { text = "Perhaps it's just tradition.", next = "workshop_trad" },
        { text = "Your grandmother sounds wise.", next = "BACK", reply = "She was. I still hear her every time I reach for the wrong shelf." },
        { text = "Something else.", next = "BACK" },
      },
    },
    workshop_trad = {
      lines = { { id = "workshop_trad_d", text = "Perhaps, but tradition is how our people remember what they have forgotten the reasons for. I keep the cedar on the left and the feathers on the right, and nobody has died of it yet." } },
      choices = {
        { text = "That's a good enough reason.", next = "BACK" },
        { text = "Another question.", next = "BACK" },
      },
    },
    windfury = {
      lines = { { id = "windfury_d", text = "They come close enough to frighten the herders, but never to the bluff itself, for the braves on the lifts would shoot them out of the sky. They nest in the cliffs north and northwest of here, and the young go out to face them when Ruul sends them." } },
      choices = {
        { text = "Ruul sends many young ones.", next = "windfury_ruul" },
        { text = "The harpies are a good test.", next = "BACK", reply = "They are. Ruul says they teach patience, and Ruul is usually right." },
        { text = "Something else.", next = "BACK" },
      },
    },
    windfury_ruul = {
      lines = { { id = "windfury_ruul_d", text = "He does, and most of them come back. The ones who do not, I prepare for the ceremony of the dead, and that is the hardest part of my work, for they are always so young." } },
      choices = {
        { text = "That's a heavy burden.", next = "BACK", reply = "It is, but someone must carry it. I am glad it is me, and not a stranger." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    ruul = {
      lines = { { id = "r_default", text = "Because he has sent more young tauren safely out of Mulgore than anyone in Bloodhoof Village, and the chieftain wishes to honor him. Ruul says he only did his work, and he says it in a voice that means he'd like us all to stop talking about it." },
      },
      choices = {
        { text = "You sound proud of him.", next = "ruul_proud" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruul_proud = {
      lines = { { id = "rp_default", text = "I am, though I'll deny it if you tell him. When we were calves he was the one who climbed after eagle nests, and I was the one who sat below holding the feathers he threw down, and in a way that's still how it is." } },
      choices = {
        { text = "I'd guess you mind that.", next = "ruul_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruul_mind = {
      big = true,
      lines = { { id = "rm_default", text = "Sometimes, when I was younger. Now I think the one who climbs and the one who catches are both needed, and the Earth Mother doesn't care which of us the songs remember." } },
      choices = {
        { text = "The quiet work matters as much as the glory.", next = "BACK", reply = "It does, and I'm glad someone outside the ceremonies sees it. The songs are loud, but the ground they're sung on was made by quiet hands.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather be the one who climbs.", next = "BACK", reply = "Then climb, and I'll wish you strong legs and good weather. Only remember someone below is holding the rope, and thank them when you reach the top.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ceremony = {
      lines = { { id = "c_default", text = "Namings, honorings, the rites for the dead out at the burial grounds. Every one needs the right paint, the right feathers and the right words, and if any of them is wrong the ancestors notice, even if the young ones don't." } },
      choices = {
        { text = "I doubt the dead really notice.", next = "ceremony_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ceremony_dead = {
      lines = { { id = "cd_default", text = "Ask the quilboar who dug through our burial grounds in Mulgore, and the restless spirits that followed them home. I'd rather do the rites properly and be laughed at than do them badly and find out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feathers = {
      lines = { { id = "f_default", text = "Because the harpies steal from every bird on the plains and keep the brightest feathers for themselves. Taking them back is old tauren justice, and the colors carry better than anything a trader in Orgrimmar could dye." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tested = {
      lines = { { id = "t_default", text = "Then you're one of his, and I'm glad to meet you. He told me he'd send word of anyone worth knowing, and he's never once been wrong about a young one, though he's often wrong about headdresses." } },
      choices = { { text = "He was a hard teacher.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Ruul's brother and the Bluff's ceremony-maker, and between the two of those I've very little time for anything else." } },
    advice = { { id = "tp_ad", text = "Dress properly when you go before your elders. They'll remember the stain on your hide long after they forget what you said." } },
    _none = { { id = "tp_none", text = "That's nothing I'd sew a feather for, friend. Ask someone with fewer beads in their lap, and may the eternal sun light your way." } },
  },
}

---------------------------------------------------------------------------
-- Auld Stonespire: one of the last of the Stonespire, who wants Charlga dead.
---------------------------------------------------------------------------
P:NPC {
  key = "auld", id = TODO_NPC("Auld Stonespire"), name = "Auld Stonespire",
  bible = "bibles/auld.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "gruff" }, values = { "proud", "loyal" },
  notices = { "dungeon", "class" },
  impression = {
    first = "He has not forgiven being driven from the southern Barrens.",
    third = "{name} met Auld Stonespire, an old shaman of the scattered Stonespire tribe who wants Charlga Razorflank dead.",
  },

  greetings = {
    { id = "g_hi", text = "Hm. Another young one who'll tell me to let go of the past, as if the land forgets." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Well, you're still listening, and the young rarely sit still for an old one's stories." },
    { id = "g_active", when = { questActive = TODO_QUEST("A Vengeful Fate") }, text = "Charlga's heart, {class}. Bring it here, and I'll die easier than I've lived." },
    { id = "g_done", when = { questDone = TODO_QUEST("A Vengeful Fate") }, text = "The crone is dead, and I slept the whole night through for the first time in years. Sit down, if you like." },
  },

  notice = {
    { id = "n_kraul", cat = "dungeon", when = { cleared = "Razorfen Kraul" },
      text = "You've been in the Kraul. You've got the thorn scratches, and the stink of quilboar that no river washes out." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The spirits told the Stonespire a great many things once, and none of them told us to run fast enough." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Auld, of the Stonespire, and there aren't many of us left to say it. My people lived in the southern Barrens, in land we held holy, until too many enemies drove us out, and now the quilboar crone Charlga Razorflank squats on it. I don't forgive that as easily as some of the elders up here." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A Vengeful Fate"), minLevel = 25 },
          text = "There's a crone named Charlga Razorflank in the thorns of Razorfen Kraul, raising a foul army of quilboar out of our old holy ground. She faces a vengeful fate, {name}, and I'd like you to be the one who brings it. Bring me her heart, so that I can die in peace." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Vengeful Fate"), days = 3 } },
          text = "Her heart, black and shrivelled, just as I imagined it. I'm told this should make me feel lighter, and some mornings it does, so I'll thank you for it." },
        { id = "h_dd_razorfen", tags = { "news" }, when = { killed = { name = "Razorfen", min = 40 } }, text = "The Razorfen are counting their dead, young one, and I'm told a good many of them are yours. I won't pretend that grieves me, because those thorns stand on Stonespire land." },
      },
      again = {
        { id = "h_again", text = "Well? I'm old, not deaf, and the Stonespire never were. Ask." },
        { id = "h_again2", text = "Something else on your mind, or are we finished?" },
      },
      choices = {
        { text = "What happened to the Stonespire?", next = "tribe" },
        { text = "Who is Charlga Razorflank?", next = "charlga" },
        { text = "The elders must think you should forgive.", next = "forgive" },
        { text = "I've been to Razorfen Kraul.", next = "kraul", when = { cleared = "Razorfen Kraul" } },
        { text = "I'll bring you her heart.", next = "BUSINESS" },
        { text = "I've thinned the Razorfen, Auld. Is it enough?", next = "dd_razorfen", when = { killed = { name = "Razorfen", min = 40 } } },
        { text = "The spirits must speak of your tribe still.", next = "spirits", when = { class = "SHAMAN" } },
        { text = "Our people don't forget their dead, elder.", next = "dead", when = { race = "Tauren" } },
        { text = "What did the Stonespire lands look like, before?", next = "w5_lands" },
        { text = "Earth Mother keep you, Auld.", next = "END" },
      },
    },
    w5_lands = {
      lines = { { id = "w5_lands_l", text = "Thorn and red stone, with springs hidden in the gullies, and spires of rock so tall our people named themselves for them. We buried our dead beneath the spires, so that they could look out over the land forever. Now the quilboar's brambles grow over the graves." } },
      choices = {
        { text = "Do you ever go back to see them?", next = "w5_lands2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w5_lands2 = {
      lines = { { id = "w5_lands2_l", text = "Once, after the Razorfen took it. I stood on a ridge and looked down and could not see a single spire for the thorns. I came back up the lift and I have not gone again. An old bull can carry only so much. I carry the memory, and I let you young ones carry the axes." } },
      choices = {
        { text = "Then we'll carry the axes, and clear the thorns.", next = "BACK", reply = "Good. Come back and tell me when you can see a spire again.", fx = { align = { honor = 1 } } },
        { text = "Let the past go, elder. The living need you here.", next = "BACK", reply = "The living have plenty of elders. The Stonespire dead have only me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_razorfen = {
      lines = {
        { id = "dd_razorfen_1", text = "Enough? The Stonespire hunted the southern Barrens since before the orcs came over the sea, and the quilboar took it with fire and thorns while the other tribes were busy forgiving. Every quilboar you kill is a debt paid, but it will never bring back the ones I buried." },
      },
      choices = {
        { text = "Then I'll keep paying that debt, Auld.", next = "BACK", reply = "Good, and don't let anyone on Elder Rise tell you to stop. They didn't watch the thorns grow over our camps.", fx = { align = { light = -1 } } },
        { text = "Killing them won't bring your people back, Auld.", next = "BACK", reply = "You sound like the elders, and I've had my fill of them. I know it won't, young one, but it lets me sleep, and that's something.", fx = { align = { light = 1 } } },
        { text = "Something else, Auld.", next = "BACK" },
      },
    },
    tribe = {
      lines = { { id = "tr_default", text = "Centaur from the north, quilboar from the thorns, and the dry years in between. We buried our grandmothers in that ground, and we left them there when we ran, and that's the part that wakes me at night." } },
      choices = {
        { text = "Where did the rest of your people go?", next = "tribe_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe_rest = {
      lines = { { id = "trr_default", text = "Some to Cairne's banner, some to Camp Taurajo, and a few to the Grimtotem, who promised them they'd take the old lands back. I don't speak to those ones, but I understand them better than I'd like to." } },
      choices = {
        { text = "You sound like you understand the Grimtotem.", next = "tribe_grim", fx = { learn = { "grimtotem" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "grimtotem" } } },
      },
    },
    tribe_grim = {
      big = true,
      lines = { { id = "tg_default", text = "I understand being angry, and being told by a city on a mesa that anger isn't the tauren way. Magatha offers them someone to blame, and Cairne offers them patience, and patience is very hard to eat." } },
      choices = {
        { text = "Patience is still the better road.", next = "BACK", reply = "Maybe it is, and I hear that every night from my own better sense. But patience hasn't brought my people back, and Charlga still breathes.", fx = { align = { order = 1 } } },
        { text = "Some wrongs should be answered, not waited out.", next = "BACK", reply = "You sound like Magatha's people, and I'm not sure I like that I agree with you. Still, I'll answer it my own way, not hers, and Charlga first.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    charlga = {
      lines = { { id = "ch_default", text = "A quilboar crone who calls herself a priestess and gathers the Razormane and their thorn-witches to her. She sits in the Kraul on top of what was ours, and every spring she sends her raiders a little further north." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forgive = {
      big = true,
      lines = { { id = "fg_default", text = "They say the Earth Mother holds no grudges, so neither should her children. I say the Earth Mother wasn't there when the Kraul's thorns grew over my mother's grave." } },
      choices = {
        { text = "Forgiveness would free you, Auld.", next = "BACK", reply = "Maybe it would, and maybe one day I'll have room for it. The thorns are still over the grave, though, and I'm not ready to stop seeing them.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Then let them answer for it.", next = "BACK", reply = "They will, if I have any say in it. Charlga Razorflank owes the Stonespire a debt, and I mean to see it paid before I go to the Earth Mother.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kraul = {
      lines = { { id = "k_default", text = "Did you see the old stones under the thorns, the ones with the carvings worn almost smooth? Those were ours, and if you saw them, you've seen more of my home than I have in thirty years." } },
      choices = { { text = "I saw them. They're still standing.", next = "BACK", fx = { affinity = 2 } } },
    },
    spirits = {
      lines = {
        { id = "spirits_d", text = "They do, and that is the trouble with being a shaman who has lost his people. I hear the Stonespire in every wind that comes up from the south, and they do not ask me for peace." },
      },
      choices = {
        { text = "What do they ask for?", next = "spirits_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_ask = {
      lines = {
        { id = "spirits_ask_d", text = "They ask to be remembered in the land they walked, and they cannot be while Charlga's thorns grow over it. The elders call that vengeance, and I call it setting a grave to rights." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = {
        { id = "dead_d", text = "No, we do not, and I am glad to hear a young one say it. Most on this bluff would have me sit quietly by the fire and let the Stonespire become a story the calves half remember." },
      },
      choices = {
        { text = "I'll remember them, elder.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stonespire, born in the south, too old to go back and too stubborn to stop wanting to." } },
    advice = { { id = "tp_ad", text = "Don't let anyone tell you how long to grieve. They'll always say it's been long enough." } },
    grimtotem = { { id = "tp_gt", text = "Angry people with a leader who knows how to use that. I've been angry for thirty years, so I know what it looks like." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I'm too old to start caring now. My ancestors' land is all the caring I've got left." } },
  },
}

---------------------------------------------------------------------------
-- Veren Tallstrider: buys leather and teaches the young to make a bag of it.
---------------------------------------------------------------------------
P:NPC {
  key = "veren", id = TODO_NPC("Veren Tallstrider"), name = "Veren Tallstrider",
  bible = "bibles/veren.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "warm" }, values = { "practical", "craft" },
  notices = { "profession" },
  impression = {
    first = "He talks about hides the way other people talk about family.",
    third = "{name} met Veren Tallstrider, who gathers leather in Thunder Bluff and teaches the young their first stitches.",
  },

  greetings = {
    { id = "g_hi", text = "Come in, come in, and step over the hides. They're drying, and the kodo who gave them deserve better than a careless hoof." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Let me see your hands, and I'll tell you whether you've been working." },
    { id = "g_bag", when = { questDone = TODO_QUEST("Kodo Hide Bag") }, text = "Still carrying that kodo hide bag you made? Good. The first one's always ugly and always the one you keep." },
  },

  notice = {
    { id = "n_skin", cat = "profession", when = { profession = "Skinning" },
      text = "Your knife hand has the calluses of a skinner, and you've been keeping your blade sharp. I can tell from the clean edges on that hide at your belt." },
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" },
      text = "Leatherworker's thumbs, I'd know them anywhere. Sit, and let's talk about stitching." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Veren Tallstrider, and I gather leather for the Bluff, which means I spend my days up to my elbows in hides and my nights explaining to my mate why I smell like a tannery. It's honest work, and the young ones who learn it never go cold." },
        { id = "h_gather", when = { questBefore = TODO_QUEST("Gathering Leather") },
          text = "If you've a skinning knife and a willing arm, I could use some light leather. Go out among the plainstriders and prairie wolves of Mulgore and bring back what you take, and you'll learn more doing it than I could ever teach you sitting here." },
        { id = "h_bag", when = { questBefore = TODO_QUEST("Kodo Hide Bag") },
          text = "Every leatherworker on the Bluff starts the same way, with a kodo hide bag stitched badly and carried proudly. Bring me the leather and I'll show you how it's done." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've hides to turn, but I can talk while I do it, same as my mother did." },
      },
      choices = {
        { text = "What makes good leather?", next = "leather" },
        { text = "Why do the young start with a kodo bag?", next = "bag" },
        { text = "Do tauren still hunt kodo?", next = "kodo" },
        { text = "I'm a druid. Should skinning trouble me?", next = "druid", when = { class = "DRUID" } },
        { text = "Have you work for me?", next = "BUSINESS" },
        { text = "Who buys the leather you gather?", next = "buyers" },
        { text = "Your mate must be very patient.", next = "mate" },
        { text = "What do you tell your mate about the smell?", next = "w5_smell" },
        { text = "Farewell, Veren.", next = "END" },
      },
    },
    w5_smell = {
      lines = { { id = "w5_smell_l", text = "The truth. That I spent the day with my hands in a kodo hide and a tub of tanning bark. She says she knew that from the far side of the rise. Then she makes me wash in the river before I come in, and I do it, because she is right." } },
      choices = {
        { text = "She sounds very patient.", next = "w5_smell2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w5_smell2 = {
      lines = { { id = "w5_smell2_l", text = "She is. She also wears the best leather on the Lower Rise, and everyone knows who made it. I think that is our bargain. I bring home the smell, and she gets the finest boots on the bluff. Neither of us mentions it. That is how you know a bargain is good." } },
      choices = {
        { text = "A bargain nobody mentions is the best kind.", next = "BACK", reply = "Exactly. You have been married, or you have paid attention to those who are." },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "buyers_d", text = "Una's tent on the middle rise takes most of it, and Ahanu on the lower rise takes what Una doesn't want. The rest goes to the young ones who are learning, so they have something to spoil that isn't worth much." } },
      choices = {
        { text = "Una must be particular.", next = "buyers_una" },
        { text = "The young need something to practise on.", next = "BACK", reply = "They do, and every hide they spoil is one they'll never spoil again." },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_una = {
      lines = { { id = "buyers_una_d", text = "She is, and she's right to be. She can tell a hide that was taken badly from across the tent, and she sends those back to me with a look that would curdle milk." } },
      choices = {
        { text = "Then you take care with every hide.", next = "BACK", reply = "I do now. Una taught me that, the hard way." },
        { text = "Another question.", next = "BACK" },
      },
    },
    mate = {
      lines = { { id = "mate_d", text = "She is, though she wouldn't call it patience. She calls it a long-suffering nose, and she makes me wash in the stream below the bluff before I'm allowed into the lodge." } },
      choices = {
        { text = "That seems fair.", next = "mate_fair" },
        { text = "Leather smells honest, at least.", next = "BACK", reply = "That's what I tell her! She says honest and pleasant aren't the same thing." },
        { text = "Something else.", next = "BACK" },
      },
    },
    mate_fair = {
      lines = { { id = "mate_fair_d", text = "It is, and I don't complain, not where she can hear. She knew what she was getting when we were joined, and she took me anyway, which I think is the bravest thing anyone on this bluff has ever done." } },
      choices = {
        { text = "She sounds remarkable.", next = "BACK" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    leather = {
      lines = { { id = "l_default", text = "A clean kill, a quick skinning and a patient tanning, in that order, with thanks to the beast at each step. Rush any of the three and you'll have something that cracks in the first cold rain on the Barrens." } },
      choices = {
        { text = "And a clean kill?", next = "leather_kill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_kill = {
      lines = { { id = "lk_default", text = "One that the beast barely knows about. Melor on Hunter Rise would tell you it's about respect, and he's right, but I'd tell you it's also about the hide, because a frightened animal makes poor leather." } },
      choices = {
        { text = "So respect is practical, too.", next = "leather_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_end = {
      big = true,
      lines = { { id = "le_default", text = "Most good things are, when you look at them long enough. My grandfather thanked every beast he skinned, and his hides were the best on the plains, and he never once said which was the cause." } },
      choices = {
        { text = "Thank the beast. It's the right thing.", next = "BACK", reply = "Your heart's in a good place, and so was my grandfather's. Thank the beast, then, and see if your hides come out better than mine.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hide's a hide. Skill makes it good.", next = "BACK", reply = "Spoken like a crafter, and you're not entirely wrong, I'll grant. But I've never met a skilled hand that didn't also have a grateful heart.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bag = {
      lines = { { id = "b_default", text = "Because kodo hide forgives a beginner's mistakes, and because a tauren carries her life with her. When we wandered, the bag you made was where everything you owned lived, so it's a good first lesson in why the work matters." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kodo = {
      lines = { { id = "k_default", text = "Only the old and the sick ones, and only what we need. We walked beside the kodo for generations, and it would be a poor thanks to hunt them the way the centaur do, for sport and nothing else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "It bothers some of Hamuul's students and not others. The Earth Mother gives the beast and takes it back, and what's left in between can keep a calf warm, so I've never thought it was disrespect, but you'll have to find your own answer." } },
      choices = { { text = "I'll think on it.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Leather, my whole life. My hands smelled of tannin before I could walk properly." } },
    advice = { { id = "tp_ad", text = "Carry a spare needle. You'll never need it until you're far from anyone who has one." } },
    _none = { { id = "tp_none", text = "That's not a hide I know how to work, friend. Ask someone with cleaner hands, and the Earth Mother keep you." } },
  },
}
