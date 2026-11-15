-- Magistrate Solomon, Lakeshire Town Hall. Voice: bibles/solomon.md
-- Elected, besieged, and out of patience with everyone who isn't sending help.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "solomon", id = TODO_NPC("Magistrate Solomon"), name = "Magistrate Solomon",
  bible = "bibles/solomon.md", role = "noble", tier = "major",
  communities = { "lakeshire" }, temper = { "sharp" }, values = { "lawful", "stern" },
  notices = { "reputation", "deputy" },

  greetings = {
    { id = "g_brief", text = "Be brief, if you please; the orcs never are." },
    { id = "g_letters", when = { questActive = TODO_QUEST("Messenger to Westfall") }, text = "Why are you still standing in my hall? Take the letter to Westfall, and go quickly." },
    { id = "g_hero", when = { townStanding = { town = "lakeshire", min = 55 } }, text = "Ah, Lakeshire's champion. Sit, if you like; you're the only visitor I don't mind." },
    { id = "g_distrust", when = { townStanding = { town = "lakeshire", max = -20 } }, text = "The court has heard your name, and not kindly." },
  },

  notice = {
    { id = "n_deputy", cat = "deputy", place = "before", when = { questDone = TODO_QUEST("The True Masters") },
      text = "So you're the Regent's deputy. I asked Stormwind for an army and it sent me you, and I've stopped being insulted by that, because you've earned it." },
    { id = "n_hero", cat = "reputation", when = { townStanding = { town = "lakeshire", min = 30 } },
      text = "The fishermen say your name now when they talk about the lake being safe. The fishermen never agree on anything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
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
      },
      again = {
        { id = "h_again", text = "What else? Quickly, if you would; the docket is long and the day is not." },
        { id = "h_again2", text = "Go on. You have the court's attention, which is more than Stormwind gives it." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask what you like. The letters will keep, as they always do." },
      },
      choices = {
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
  },

  topics = {
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
