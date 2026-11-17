-- Magistrate Solomon, Lakeshire Town Hall. Voice: bibles/solomon.md
-- Elected, besieged, and out of patience with everyone who isn't sending help.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "solomon", id = TODO_NPC("Magistrate Solomon"), name = "Magistrate Solomon",
  bible = "bibles/solomon.md", role = "noble", tier = "major",
  communities = { "lakeshire" }, temper = { "sharp" }, values = { "lawful", "stern" },
  notices = { "reputation", "deputy" },

  impression = {
    first = "Magistrate Solomon asked me to be brief and then wrote another letter nobody will answer. He carries Lakeshire's danger the way a clerk carries a stack of papers, carefully and too long.",
    third = "{name} was received by Magistrate Solomon, Lakeshire's elected leader, whose letters asking for help mostly go unanswered.",
  },

  greetings = {
    { id = "g_brief", text = "Be brief, if you please; the orcs never are." },
    { id = "g_letters", when = { questActive = TODO_QUEST("Messenger to Westfall") }, text = "Why are you still standing in my hall? Take the letter to Westfall, and go quickly." },
    { id = "g_hero", when = { townStanding = { town = "lakeshire", min = 55 } }, text = "Ah, Lakeshire's champion. Sit, if you like; you're the only visitor I don't mind." },
    { id = "g_distrust", when = { townStanding = { town = "lakeshire", max = -20 } }, text = "The court has heard your name, and not kindly." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and in that time I've written Stormwind four more letters. None has been answered, so do sit down." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "The court notes you've returned after {away}, and rather more formidable than you left. Lakeshire could use formidable, so you are welcome in this hall." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "It has come to the court's attention that you were caught in a falsehood in this town. I'll have the truth in my hall, or I'll have nothing at all." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The court has heard you've done Lakeshire real service these past days. It is noted, and I note very few things kindly." },
  },

  notice = {
    { id = "n_deputy", cat = "deputy", place = "before", when = { questDone = TODO_QUEST("The True Masters") },
      text = "So you're the Regent's deputy. I asked Stormwind for an army and it sent me you, and I've stopped being insulted by that, because you've earned it." },
    { id = "n_hero", cat = "reputation", when = { townStanding = { town = "lakeshire", min = 30 } },
      text = "The fishermen say your name now when they talk about the lake being safe. The fishermen never agree on anything." },
  },

  start = "hello",
  nodes = {
    xcl_ubrs = {
      big = true,
      lines = { { id = "xcl_ubrs_default", text = "I said so in forty letters, and the forty-first is on my desk now, informing the Keep that the matter was resolved by a private citizen at no cost to the crown. I'd hoped to feel vindicated, but mostly I feel tired, because the Blackrock are still in my hills and no dragon's death will move them." } },
      choices = {
        { text = "Send the letter anyway, Magistrate. The record matters.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stop writing. Stormwind won't listen, so Lakeshire should act alone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who was Drakkisath, Magistrate?", next = "xcl_ubrs2" },
      },
    },
    xcl_ubrs2 = {
      lines = { { id = "xcl_ubrs2_default", text = "A general of the black dragonflight, by the reports, who commanded the orcs from the top of the Spire while his masters stayed out of sight. The court does not know who those masters are, and it has stopped guessing aloud, because guessing aloud in this kingdom is how a magistrate loses his post." } },
      choices = {
        { text = "Keep guessing quietly, then, and I'll keep listening.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not one of them. I carry Lakeshire's danger carefully, and too long. Your spirits might reach where my letters can't." } },
      choices = {
        { text = "Keep writing, Magistrate. Someone will listen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stop writing. Act yourself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "I've had that same unpleasant thought, and it's why I seal every one with wax and my own ring. If someone in Stormwind is reading Lakeshire's mail and doing nothing about it, I'd sooner know it than suspect it." } },
      choices = {
        { text = "Then I'll find out quietly who reads them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Seal them and trust the crown. That's proper.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What do the letters say?", next = "letters" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "It was Ilgalar's tower, a wizard dead long before my time, and now a necromancer squats in it. I've written to the Mage Quarter about Morganth twice, and they've answered neither letter." } },
      choices = {
        { text = "I'll carry word to the Mage Quarter, properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget Stormwind. I'll deal with Morganth myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who is Morganth?", next = "morganth" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Lakeshire has noticed, I assure you, though Stormwind has yet to read my letters about it. The Blackrock clan cuts what it needs for its war machines and burns the rest. If you can slow them, I will put it in writing to the Keep." } },
      choices = {
        { text = "Then I'll drive them off the slopes myself.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your letters won't save a single tree.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_ubrs", tags = { "news" }, when = { cleared = "Upper Blackrock Spire", faction = "Alliance" },
          text = "The court is informed that General Drakkisath is dead in Blackrock Spire, and that you were present. The court would like it entered in the record that Lakeshire said so first, and was told it lacked proof." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid of the kaldorei in Lakeshire. I confess I have little notion what your people make of ours." },
        { id = "h_default", key = true,
          text = "I am Solomon, elected Magistrate of Lakeshire, which means the people chose me to be the one who writes the letters nobody answers." },
        { id = "h_new", when = { maxLevel = 17 },
          text = "You've come up from Elwynn? Good, because Lakeshire needs every blade it can borrow, even the short ones." },
        { id = "h_westfall", tags = { "news" }, when = { questActive = TODO_QUEST("Messenger to Westfall") },
          text = "I hear they've raised a militia in Westfall, farmers with spears holding their own. Take my letter to their leader; if anyone understands our plight, it's him." },
        { id = "h_westfall_done", tags = { "news" }, when = { questDone = TODO_QUEST("Messenger to Westfall") },
          text = "Stoutmantle can't spare a man. I'd be angrier if I didn't know exactly how he feels." },
        { id = "h_gath", when = { questActive = TODO_QUEST("Wanted: Gath'Ilzogg") },
          text = "Gath'Ilzogg sits in Stonewatch Keep as if he built it, but he didn't; we did. Bring me his head, and the court will consider the matter closed." },
        { id = "h_fangore", when = { questActive = TODO_QUEST("Wanted: Lieutenant Fangore") },
          text = "Fangore leads Morganth's Shadowhides in the eastern hills. The court has ruled him a betrayer of the kingdom. You carry out the sentence." },
        { id = "h_masters", tags = { "news" }, when = { questActive = TODO_QUEST("The True Masters") },
          text = "Orcs don't plan like this. Somebody is directing them, and the letter you carried names who. Take it to the Keep before the next raid." },
        { id = "h_masters_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The True Masters"), days = 5 } },
          text = "The Highlord read it all and still won't send soldiers without more proof, so he sent a deputy instead, which is to say you. I suppose that's an answer." },
        { id = "h_maxwell", when = { heardLine = "maxwell.h_default" },
          text = "You've been up to Morgan's Vigil and met Marshal Maxwell, then. He and I write to the same deaf ears in Stormwind, and his letters are angrier than mine, which I hadn't thought possible." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "An elf from the sky, is it? If your people could fly I'd want a dozen on the walls, but I'm told you glide, and I'll gladly take gliders." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, in my hall. I asked the kingdom for soldiers and bandages. It seems to have sent the next best thing." },
        { id = "h_letters", when = { metBefore = true }, text = "Another letter to Stormwind this morning. The court notes that it is the fortieth. The court also notes that it expects no reply." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The court is closed, but the magistrate is not. Say what you came to say, and say it briefly." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, you. The court is glad of a friendly face, and so, for that matter, is the magistrate. Sit, if you can find a chair under the letters." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "The court recognises you, which is not the same as welcoming you. State your business." },
        { id = "h_redridge_born", when = { origin = "human_redridge_born" },
          text = "One of our own, back from the wider world. The court remembers your family's name, and it would rather see you on the walls than on a list of the missing." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Be brief. A shaman. I'll write another letter nobody will answer. Do your spirits carry letters?" },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, if you would; the docket is long and the day is not." },
        { id = "h_again2", text = "Go on. You have the court's attention, which is more than Stormwind gives it." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask what you like. The letters will keep, as they always do." },
      },
      choices = {
        { text = "The orcs are stripping the Redridge hills bare for timber.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What does Lakeshire need?", next = "need" },
        { text = "Why won't Stormwind help?", next = "stormwind" },
        { text = "What happened at Stonewatch Keep?", next = "stonewatch" },
        { text = "Tell me about the Court of Lakeshire.", next = "court" },
        { text = "I can tend your wounded, Magistrate.", next = "priest", when = { class = "PRIEST" } },
        { text = "The Light sends you a paladin, Magistrate.", next = "paladin", when = { class = "PALADIN" } },
        { text = "My family sits in the House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "I came south from Lordaeron.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "The Blackrock are Ironforge's enemies too.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Highlord Bolvar's deputy, reporting.", next = "deputy", when = { questDone = TODO_QUEST("The True Masters") } },
        { text = "Put me on the walls, Magistrate. I can hold a line.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I've been tracking gnolls through your hills.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Morganth's tower. What do you know of his arts?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Gnomeregan knows what it is to lose a city.", next = "gnome", when = { race = "Gnome" } },
        { text = "Someone in Stormwind may be reading your letters before the nobles do.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Morganth's tower belonged to a wizard once, didn't it?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Has Stormwind answered your letters, Magistrate?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Drakkisath is dead, Magistrate. Dragons stood behind the orcs, as you said.", next = "xcl_ubrs", when = { cleared = "Upper Blackrock Spire", faction = "Alliance" } },
        { text = "I'll leave you to your letters.", next = "END" },
      },
    },

    need = {
      lines = {
        { id = "n_default", text = "A bridge that stays up and walls that stay manned. And for once, a week where nobody walks into this office carrying someone else's blood." },
      },
      choices = {
        { text = "What's the worst of it?", next = "need_worst" },
        { text = "I'll help where I can.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { lakeshire = 1 } } },
        { text = "That's a lot to ask.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },
    need_worst = {
      big = true,
      lines = {
        { id = "nw_default", text = "Bandages, of all things. We ran out of them before we ran out of courage, and I put that in a report to the King. It still shames me." },
        { id = "nw_priest", when = { class = "PRIEST" },
          text = "Bandages, and someone who knows what to do when the bandages aren't enough. You'll have guessed why I'm telling you." },
      },
      choices = {
        { text = "Who did you send that report to?", next = "letters" },
        { text = "Stormwind can't ignore that.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Stormwind won't help, so Lakeshire must look after itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stormwind = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "I've asked every territory of the kingdom, one after another. The answers were all polite, and none of them were soldiers." },
        { id = "s_heard", when = { heardLine = "bolvar.t_westfall" },
          text = "The Highlord told Westfall the kingdom is stretched thin? He told me the same, almost word for word. I begin to think someone is writing his answers for him." },
      },
      choices = {
        { text = "Who did you write to?", next = "letters" },
        { text = "The kingdom's failing you.", next = "BACK", fx = { opinion = { westfall = "abandoned" }, affinity = 1 } },
        { text = "Maybe the city has its reasons.", next = "reasons", fx = { opinion = { westfall = "patience" } } },
      },
    },
    reasons = {
      lines = { { id = "r_default", text = "Reasons don't man walls. Come back when you've buried someone, and tell me about reasons." } },
      choices = {
        { text = "I've buried people, Magistrate.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Fair. Something else.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    letters = {
      lines = {
        { id = "le_default", text = "General Jonathan in Stormwind, who answered kindly. Gryan Stoutmantle in Westfall, who answered honestly. Lord Ebonlocke in Darkshire, who answered as if I'd gone mad." },
      },
      choices = {
        { text = "What did the General say?", next = "letters_general" },
        { text = "And Stoutmantle?", next = "letters_gryan" },
        { text = "I've met General Jonathan. He spares what he can.", next = "letters_marcus", when = { heardLine = "marcus.h_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters_general = {
      lines = {
        { id = "lg_default", text = "That Lakeshire has the army's support, and soldiers will march when the throne gives the word. Then a line about the throne I won't repeat in an open hall." },
      },
      choices = {
        { text = "What about the throne?", next = "amiss" },
        { text = "Then soldiers are coming.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Soldiers won't come, and Lakeshire should stop waiting for them.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    letters_gryan = {
      lines = {
        { id = "lgr_default", text = "Gryan's farmers are holding Westfall by their fingernails, and he'd have sent men if he had any. His reply asked me where Stormwind's army had gone, which is what I've been asking ever since." },
      },
      choices = {
        { text = "Westfall and Lakeshire should stand together.", next = "BACK", fx = { affinity = 1, learn = { "westfall", "people_militia" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "westfall" } } },
      },
    },
    letters_marcus = {
      lines = { { id = "lm_default", text = "'What the kingdom can spare.' I've read that phrase in his hand more than once, and it means none, said by a decent man." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    amiss = {
      big = true,
      lines = {
        { id = "am_default", key = true,
          text = "Only that something in Stormwind is amiss. Westfall left to its farmers, Darkshire to its Night Watch, Lakeshire to me. One neglect is bad luck; three is a pattern.",
          fx = { learn = { "westfall", "night_watch" } } },
      },
      choices = {
        { text = "You think someone at court wants Lakeshire to fall?", next = "amiss_court" },
        { text = "Lady Prestor counsels patience at court.", next = "prestor", when = { heardClaim = "prestor_patience" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    amiss_court = {
      lines = { { id = "ac_default", text = "The court makes no accusation it can't prove, so write that down. Then write down that I didn't say no." } },
      choices = {
        { text = "Careful, Magistrate. Stormwind's walls have ears.", next = "BACK", fx = { trait = { cautious = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Off the record, Magistrate. What do you really suspect?", tag = "Persuade", next = "amiss_record",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PRIEST", "PALADIN" } }, { questDone = TODO_QUEST("Messenger to Westfall") } } } },
          fail = { next = "amiss_seal", fx = { affinity = -1 } } },
      },
    },
    prestor = {
      lines = {
        { id = "pr_default", text = "Patience, is it? The court notes that Lady Prestor has never stood a night on Lakeshire's wall, and it would gladly lend her a spear." },
        { id = "pr_masters", when = { questDone = TODO_QUEST("The True Masters") },
          text = "She called me paranoid, I'm told, with the Highlord standing beside her. A paranoid magistrate with a letter about dragons; very well, I'll wear it." },
      },
      choices = {
        { text = "She has the Regent's ear.", next = "BACK", fx = { opinion = { stormwind = "abandoned_its_own" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stonewatch = {
      big = true,
      lines = {
        { id = "sk_default", text = "We kept a platoon at Stonewatch Keep. Gath'Ilzogg's Blackrock took it, with Morganth's sorcery driving them on. Then the warlock turned on the orcs, and now we have two enemies instead of one.",
          fx = { learn = { "blackrock", "morganth" } } },
      },
      choices = {
        { text = "Who is Gath'Ilzogg?", next = "gath" },
        { text = "Morganth turned on his own allies?", next = "morganth" },
        { text = "Was anyone taken alive?", next = "keeshan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gath = {
      lines = {
        { id = "ga_default", text = "The Blackrock warlord who led the assault, now sitting in our keep. There's a price on his head, and I mean it plainly." },
        { id = "ga_done", when = { questDone = TODO_QUEST("Wanted: Gath'Ilzogg") },
          text = "Was, you mean. His head sat on this desk for a day before I let them take it away, and that was the first step toward taking the keep back." },
      },
      choices = {
        { text = "Can the keep be retaken?", next = "gath_retake" },
        { text = "He'll answer for Stonewatch.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gath_retake = {
      lines = { { id = "gr_default", text = "With an army, which brings us back, as everything in this hall comes back, to the letters." } },
      choices = {
        { text = "Then tell me about the letters.", next = "letters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morganth = {
      lines = {
        { id = "mo_default", text = "He did, soon after the victory. He raised a tower in the northeast and took the Shadowhide gnolls for his own, with Fangore at their head.",
          fx = { learn = { "morganth" } } },
      },
      choices = {
        { text = "Why would he betray the orcs?", next = "morganth_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morganth_why = {
      lines = { { id = "mw_default", text = "I can only speculate, and a judge dislikes speculating. Ask Theocritus at the Tower of Azora. He has made a study of Morganth, and he's welcome to it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    keeshan = {
      lines = {
        { id = "ke_default", text = "Corporal Keeshan was seen dragged off by the Blackrock. The notice outside the inn is mine: whoever brings him home, Marris rewards." },
        { id = "ke_done", when = { questDone = TODO_QUEST("Missing In Action") },
          text = "Keeshan walked back into this town and reported for duty with his head still bleeding. It's in the court's record, and it's in mine too, privately." },
      },
      choices = {
        { text = "Then I'll look for him.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll look for him if the reward's worth it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    court = {
      lines = {
        { id = "co_default", text = "The township elected a magistrate, and the magistrate sits as its judge. Bailiff Conacher carries out what I rule. Lately I rule mostly on orcs." },
      },
      choices = {
        { text = "What does the law say about the gnolls?", next = "court_law" },
        { text = "Has Lakeshire always been this embattled?", next = "court_history" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court_law = {
      lines = { { id = "cl_default", text = "That aiding an enemy of the kingdom is a hanging matter. Morganth is an enemy, and the Shadowhides aid him. Conacher will walk you through it; he enjoys procedure." } },
      choices = {
        { text = "Hanging gnolls seems excessive.", next = "court_mercy" },
        { text = "Good. The law should have teeth.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Fighting gnolls is a soldier's job, not a hangman's.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    court_mercy = {
      lines = { { id = "cm_default", text = "We don't hang them, because we can't catch them. The law is a statement of what we would do if we had the time." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    court_history = {
      big = true,
      lines = {
        { id = "ch_default", text = "Blackhand's raiders took this town in the first war. After the second, Turalyon's Alliance gave it back and brought our families home. I won't be the magistrate who loses it twice." },
      },
      choices = {
        { text = "You won't. Not while I'm here.", next = "BACK", fx = { affinity = 2, standing = { lakeshire = 1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      big = true,
      lines = {
        { id = "pt_default", text = "Lakeshire has no chapel and no priest. The wounded lie wherever there's a bed, and the bandages ran out a fortnight ago. If you mean it, the guards will show you." },
        { id = "pt_novice", when = { origin = "human_abbey_novice" },
          text = "Northshire trained you? Then you know how to work on an empty stomach and no sleep. You'll need both here." },
      },
      choices = {
        { text = "Take me to them.", next = "BACK", fx = { affinity = 3, standing = { lakeshire = 2 }, align = { light = 1 } },
          journal = { first = "Magistrate Solomon told me Lakeshire has no priest of its own. I said I'd see to the wounded.",
                      third = "{name} offered to tend Lakeshire's wounded." } },
        { text = "I'm not here to nurse anyone, Magistrate.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Has the Church sent no one?", next = "priest_church" },
      },
    },
    priest_church = {
      lines = { { id = "pc_default", text = "I asked the Cathedral too, but they're stretched like everyone else, and they sent prayers. I'll take prayers gladly, though I'd rather take you." } },
      choices = {
        { text = "Prayers matter more than you think.", next = "BACK", fx = { align = { light = 1 }, trait = { pious = 1 } } },
        { text = "I'll tell the Archbishop what I saw here.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    paladin = {
      lines = { { id = "pl_default", text = "I asked for a regiment and the Light sends one paladin. I've learned not to argue with the Light; it doesn't answer letters either. Stand where the guards can see you." } },
      choices = {
        { text = "I'll stand on the walls.", next = "BACK", fx = { affinity = 2, align = { light = 1, order = 1 } } },
        { text = "I'll go where I'm needed, not where I'm posted.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble = {
      lines = { { id = "nb_default", text = "Then perhaps your family has heard my letters read aloud, just before someone says 'next item'. Ask them what Lakeshire must do to become the item." } },
      choices = {
        { text = "I'll raise it with them.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } },
          journal = { first = "Promised Magistrate Solomon I'd raise Lakeshire's letters with my family in the House of Nobles.",
                      third = "{name} promised Magistrate Solomon to raise Lakeshire's plight in the House of Nobles." } },
        { text = "They have bigger concerns than Redridge.", next = "BACK", fx = { align = { honor = -1 }, affinity = -2 } },
      },
    },
    lordaeron = {
      lines = { { id = "ld_default", text = "Then Lakeshire owes your kingdom. It was the Alliance of Lordaeron that rebuilt this town after the second war. I'm sorry we've nothing to repay it with but a bed." } },
      choices = {
        { text = "What do you hear from the north?", next = "lordaeron_north" },
        { text = "A bed is enough.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    lordaeron_north = {
      lines = { { id = "ln_default", text = "Nothing good, I'm afraid. I wrote to the King that something darker than any orc is brewing up there, and nobody answered that part either." } },
      choices = {
        { text = "You were right. I've seen it.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "That's what I reasoned too, so we sent envoys to King Magni months ago, asking for help against the Blackrock. No dwarves have come over the mountains yet." } },
      choices = {
        { text = "Ironforge keeps its word. Give it time.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I wouldn't count on Ironforge keeping that promise.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "They came. Princess Moira was taken on the road.", next = "dwarf_moira", when = { questDone = TODO_QUEST("Kharan's Tale") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf_moira = {
      big = true,
      lines = { { id = "dm_default", text = "The princess herself, for Lakeshire? Light help me, I wrote that letter. Lakeshire will remember her name, whatever comes of this." } },
      choices = {
        { text = "It wasn't your doing.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    deputy = {
      lines = { { id = "dp_default", text = "When you handed me that decree, the court had something in its eye. The court would like that left out of the record." } },
      choices = {
        { text = "It's safe with me.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "One deputy beats no army.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    amiss_record = {
      big = true,
      lines = {
        { id = "ar_default", text = "Nothing is off the record in a court, but very well. I have kept every reply from the Keep, and laid them side by side on this table, and they are written in four different hands and they all use the same word: patience." },
        { id = "ar_after", text = "Four clerks don't choose the same word by accident; somebody chooses it for them. I've sealed copies in a box with instructions for the court, should anything befall its magistrate, and I'll thank you to forget I said so." },
        { id = "ar_priest", when = { class = { "PRIEST", "PALADIN" } }, text = "You wear the Light's colours, so I'll say it plainly: I don't believe the Regent means us harm, and I don't believe the Regent is the one writing." },
      },
      choices = {
        { text = "I've heard that word in the Keep myself.", next = "BACK", when = { heardClaim = "prestor_patience" }, fx = { affinity = 2 } },
        { text = "Your secret's safe, Magistrate.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's a dangerous thing to suspect.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    amiss_seal = {
      lines = {
        { id = "as_default", text = "The court has said what it's prepared to say, and it has said it to you once already. I'm a magistrate, not a gossip at the Lakeshire Inn." },
        { id = "as_default2", text = "Suspicions are for people who have time to entertain them. I have orcs on the ridge and a stack of letters to answer, so ask me something useful." },
      },
      choices = {
        { text = "Fair enough, Magistrate.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "The court would take a hundred of you if Stormwind would send them, and it will take one gladly. Marshal Marris decides who stands where, but tell him I said the east wall first." },
        { id = "wa_guard", when = { origin = "human_city_guard" },
          text = "City Guard, by your bearing. Then you know how it feels to be told the kingdom has no soldiers to spare while the kingdom's soldiers polish the Trade District." },
      },
      choices = {
        { text = "Why the east wall?", next = "warrior_east" },
        { text = "A town should fight for itself before it begs for soldiers.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll stand where the Marshal puts me.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { lakeshire = 1 } } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    warrior_east = {
      lines = { { id = "we_default", text = "Because the Blackrock come down from Render's Valley and the east wall is the one they test, every time, the way a man worries a loose tooth. The day it gives, the court will be holding session in the lake." } },
      choices = {
        { text = "Then it won't give.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", fx = { learn = { "redridge_gnolls" } },
          text = "Then you've seen more of Redridge than my bailiff has this month. The court would be grateful for an honest count of the Redridge gnolls, and more grateful still for fewer of them." },
        { id = "hu_human", when = { race = "Human" },
          text = "A Stormwind hunter, and not a ranger from the north. I'd heard the young ones were taking up the bow and the beast; I hadn't expected one in my hall." },
      },
      choices = {
        { text = "Are they working with the orcs?", next = "hunter_orcs" },
        { text = "I'll bring you a count.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hunter_orcs = {
      lines = { { id = "ho_default", text = "The court has no proof, and the court hates guessing aloud. But gnolls never raided this boldly before the Blackrock came over the mountains, and I don't believe in coincidences that cost me farms." } },
      choices = {
        { text = "Then I'll find your proof.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", fx = { learn = { "morganth" } },
          text = "I know he raises the dead and calls things out of the dark in that tower, and I know you've just asked me about it with more interest than I'd like. The court will assume that was professional curiosity." },
      },
      choices = {
        { text = "It was. Know your enemy, Magistrate.", next = "warlock_enemy" },
        { text = "Power isn't evil. It's how a man uses it.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
        { text = "Morganth's arts are a sickness. I mean to end him.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock_enemy = {
      lines = { { id = "wle_default", text = "A fair principle, and one I've heard from a great many people shortly before they joined the enemy. Do your work in the hills, not in my town, and the court won't ask what you carry in your pack." } },
      choices = {
        { text = "Understood.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "It does, and I'm sorry for it; I read the reports when they came through. Lakeshire hasn't fallen yet, and I'd be glad of advice from anyone who has seen how a city is lost." } },
      choices = {
        { text = "It starts when help is promised and doesn't come.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
        { text = "Build your defenses before you need them.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every report from the ridge and every letter from the Keep crosses this table, so the court is well informed, if poorly defended. Ask me about any of this." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "The court will answer on these matters, and only these." },
    },
    background = { { id = "tp_bg", text = "The township elected me to judge its quarrels and keep its peace. Lately the quarrels carry axes.", next = "court" },
                   { id = "tp_bg2", text = "I'm the Magistrate of Lakeshire, and the rest of my story is in the letters, which nobody reads." } },
    advice = { { id = "tp_ad", text = "Keep to the roads, and never trust a quiet night in Redridge. The orcs count on both." } },
    stonewatch_keep = { { id = "tp_stonewatch", text = "It was ours until Morganth's sorcery and Gath'Ilzogg's axes took it. The court has not ruled it lost, only taken.", next = "stonewatch" } },
    keeshan = { { id = "tp_keeshan", text = "Of the 12th Sabre Regiment, dragged off the walls at Stonewatch. The notice by the inn carries my seal." } },
    night_watch = { { id = "tp_watch", text = "Lord Ebonlocke's lantern-bearers, you mean. I asked him for them anyway, which tells you how desperate Lakeshire has become." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "There are two packs: one steals our horses, and the other serves a warlock. I've put a price on the second." } },
    defias = { { id = "tp_defias", text = "That's Westfall's trouble, and Stoutmantle's reply told me enough to stop asking him for men." } },
    blackrock = { { id = "tp_blackrock", text = "They hold Render's Valley and Stonewatch Keep, and there are too many of them, too well organized, and getting bolder by the week." } },
    everstill_bridge = { { id = "tp_bridge", text = "Oslow says it'll be finished before the rains, but Oslow said that last year." } },
    westfall = { { id = "tp_westfall", text = "They have it worse than we do, and I wrote to them anyway. Desperation makes for poor manners." } },
    morganth = { { id = "tp_morganth", text = "He holds the tower in the eastern hills, and the gnolls there serve him. That's all I know, and it's more than I like." } },
    _none = { { id = "tp_none", text = "If it's not a threat to Lakeshire, it can wait until there aren't any." } },
  },
}
