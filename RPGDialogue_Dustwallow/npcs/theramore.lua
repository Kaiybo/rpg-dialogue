-- Theramore Isle: Jaina Proudmoore's city on the edge of Dustwallow Marsh. Voice: bibles/dustwallow.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jaina", id = TODO_NPC("Lady Jaina Proudmoore"), name = "Lady Jaina Proudmoore",
  bible = "bibles/dustwallow.md", role = "noble", tier = "major",
  communities = { "theramore" }, temper = { "earnest", "sharp" }, values = { "wise", "kind", "dutiful" },
  notices = { "class", "race", "form" },

  greetings = {
    { id = "g_tower", text = "Welcome to Theramore, and speak freely; I'd rather hear bad news early than good news late." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, good. I have few enough people I can rely on outside these walls." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadowform... Dalaran kept books on that in rooms apprentices weren't allowed into, and I was an apprentice for a long time. I'm told it's safe, but I'm told a lot of things are safe." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Dalaran trained me, once. Whoever trained you, I hope they taught you that power is the easy part." },
    { id = "n_highborne", cat = "race", when = { race = "NightElf" },
      text = "Your people and mine stood together at Mount Hyjal, and I haven't forgotten. I hope we never have to again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jaina Proudmoore. I brought the survivors of Lordaeron across the sea and built Theramore with them. We keep the peace here, even when it costs us." },
        { id = "h_thrall", when = { heardLine = "thrall.h_default" },
          text = "You've stood before Thrall, so you know he's no monster. Not everyone in Stormwind wants to hear that from me." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "Whatever Tervosh has you chasing, see it through. Someone has been working against us from the shadows, and I mean to learn who." },
        { id = "h_night", when = { timeOfDay = "night" },
        { id = "h_warm", when = { disposition = { min = 75 } },
          text = "I'm glad you came back. Sit, if you like; Tervosh says I don't sit nearly enough, and he's usually right." },
          text = "Still awake? So am I. The tower's quiet at night, and it's the only time I can hear myself think about anything but the next letter." },
      },
      again = {
        { id = "h_again", text = "What else? I have a few minutes before the next dispatch." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Why keep peace with the Horde?", next = "peace" },
        { text = "How did Theramore begin?", next = "lordaeron" },
        { text = "Tell me about the city.", next = "theramore" },
        { text = "I'm sorry about your father.", next = "father" },
        { text = "What did Dalaran teach you?", next = "mage", when = { class = "MAGE" } },
        { text = "I came out of Lordaeron too.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "The Kirin Tor know my people. Do you?", next = "skyborne", when = { race = "Skyborne" } },
        { text = "I've met Thrall.", next = "thrall", when = { heardLine = "thrall.h_default" } },
        { text = "Does the Light still answer you, after everything?", next = "priest_light", when = { class = "PRIEST" } },
        { text = "Farewell, my lady.", next = "END" },
      },
    },

    peace = {
      big = true,
      lines = {
        { id = "p_default", text = "Because I fought beside them at Hyjal, and I saw what they are when no one is using them. Peace is harder than war, but it's also worth more." },
      },
      choices = {
        { text = "I agree.", next = "BACK", fx = { affinity = 2, align = { honor = 1 }, standing = { theramore = 1 }, opinion = { peace = "for" } } },
        { text = "I'd break that treaty the day it stopped serving us.", next = "BACK", fx = { affinity = -2, align = { honor = -1 } } },
        { text = "I'm not sure they'd do the same.", next = "doubt" },
      },
    },
    doubt = {
      lines = { { id = "d_default", text = "Some wouldn't, and some of ours wouldn't either. That's exactly why the rest of us have to try." } },
      choices = {
        { text = "Who'd want it broken?", next = "peace_breakers", fx = { trait = { curious = 1 } } },
        { text = "Fair. Something else.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
      },
    },
    peace_breakers = {
      lines = { { id = "pb_default", text = "People with old grudges and new reasons. Captain Vimes thinks someone is working at it right now, on our own road. I've learned to trust his hunches." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    lordaeron = {
      big = true,
      lines = {
        { id = "l_default", text = "We crossed the sea because we were told the east was lost, and it was. Humans, dwarves, some of the quel'dorei: everyone who would listen. I still dream about the docks." },
      },
      choices = {
        { text = "Who told you?", next = "lordaeron_prophet" },
        { text = "What did you lose?", next = "lordaeron_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lordaeron_prophet = {
      lines = { { id = "lp_default", text = "A prophet who spoke in riddles and was right about everything. That's the most frightening thing I can say about anyone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lordaeron_lost = {
      lines = { { id = "ll_default", text = "My teachers, my friends, Antonidas, a whole kingdom. I try to build something here he'd have been proud of, and some days I manage it." } },
      choices = {
        { text = "You have.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    theramore = {
      lines = {
        { id = "t_default", text = "An island, because islands are easy to defend. I'd rather it were easy to visit. Everyone here comes from somewhere that isn't there any more." },
      },
      choices = {
        { text = "Who should I know here?", next = "theramore_who" },
        { text = "Is it safe?", next = "theramore_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theramore_who = {
      lines = { { id = "tw_default", text = "Tervosh, if you need something understood. Captain Vimes, if you need something solved. Janene, if you need feeding. I rely on all three." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    theramore_safe = {
      lines = { { id = "ts_default", text = "From the Horde, yes, as long as Thrall and I keep our word. From the marsh, never entirely. Mind the crocolisks on the causeway." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    father = {
      lines = {
        { id = "f_default", text = "He came to fight a war I had already ended. I couldn't stop him, and I couldn't follow him. Please, ask me something else." },
      },
      choices = {
        { text = "Of course.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You did what you had to.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your father should have come first, my lady.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
        { text = "You can tell me, my lady. It won't leave this room.", tag = "Persuade", next = "father_true",
          check = { pass = { any = { { disposition = { min = 70 } }, { origin = "human_lordaeron_refugee" }, { all = { { class = "PRIEST" }, { trait = "kind" } } } } } },
          fail = { next = "father_no", fx = { affinity = -1 } } },
      },
    },

    mage = {
      lines = { { id = "m_default", text = "That every spell has a cost, and the wise pay it before it's due. Antonidas taught me the first half. I'm still learning the second." } },
      choices = {
        { text = "What would you teach me?", next = "mage_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_teach = {
      lines = { { id = "mt_default", text = "Restraint. Anyone can throw fire; knowing when not to is the whole art, and almost nobody wants to learn it." } },
      choices = {
        { text = "I'll remember.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Fire's been working for me.", next = "BACK", fx = { affinity = -1, trait = { brave = 1 } } },
      },
    },

    refugee = {
      big = true,
      lines = { { id = "r_default", text = "On the ships, or the long road south? Either way, you know what it cost. I think about the ones I couldn't bring, every day." } },
      choices = {
        { text = "You saved who you could.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "We made a life here. That counts.", next = "BACK", fx = { affinity = 2, standing = { theramore = 1 } } },
      },
    },

    skyborne = {
      lines = { { id = "sk_default", text = "Dalaran wrote to me about your people, two letters, both very careful. I'd like to hear it in your own words, someday." } },
      choices = {
        { text = "Our patrons fell silent. We had to leave.", next = "BACK", fx = { affinity = 2 } },
        { text = "Someday.", next = "BACK" },
      },
    },

    thrall = {
      lines = { { id = "th_default", text = "Then he's still keeping our word, or you'd have said otherwise by now. Tell me: how did he seem?" } },
      choices = {
        { text = "Tired, but steady.", next = "BACK", fx = { affinity = 2 } },
        { text = "Watchful. Like you.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    priest_light = {
      lines = { { id = "pl_default", text = "I was never a priest. But I prayed on the docks, with the dead behind us and the sea ahead, and something answered. I've decided not to ask what; I just keep listening." } },
      choices = {
        { text = "It was the Light.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Desperate people hear answers in the wind, my lady.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_true = {
      lines = {
        { id = "ft_default", text = "When my father's fleet came, I told my own soldiers to stand aside, and I sent word to Thrall instead of standing with my family. I chose the peace over my father, and I would choose it again, and I still don't know what kind of daughter that makes me." },
        { id = "ft_refugee", when = { origin = "human_lordaeron_refugee" },
          text = "You were on the ships, so you know what this peace cost us to build. When my father came to tear it down I told my soldiers to stand aside and chose it over him, and I'd choose it again, though I've stopped pretending it doesn't hurt." },
      },
      choices = {
        { text = "It makes you the one who kept the peace.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_no = {
      lines = {
        { id = "fn_default", text = "I appreciate it, truly, but no. Some things I'll only say once, and I've already said them to myself." },
        { id = "fn_mage", when = { class = "MAGE" },
          text = "Dalaran taught us both to keep our own counsel, I think. Ask me something else, please, and I'll answer it gladly." },
      },
      choices = {
        { text = "Of course, my lady.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Theramore hears from both sides of every border, and most of it reaches my desk eventually. Ask, and I'll tell you what I can." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "Ask me anything; you've earned plain answers in this tower. I'll tell you as much as I'd tell Tervosh." },
    },
    background = { { id = "tp_bg", text = "Kul Tiras, Dalaran, Lordaeron, and now a tower in a swamp. Every step was further from home and closer to where I'm needed.", next = "lordaeron" } },
    advice = { { id = "tp_ad", text = "Learn the other side's words before you need them. Captain Vimes speaks orcish, and it's saved more lives than his sword." } },
    grimtotem = { { id = "tp_grimtotem", text = "There are tauren who'd like a war with us. Thrall isn't one of them, and neither am I. That's where we start." } },
    burning_blade = { { id = "tp_blade", text = "Thrall's problem, and he knows it. I'll help if he asks, though he won't ask." } },
    _none = { { id = "tp_none", text = "I don't know, but Tervosh might, and if he doesn't, he'll find out." } },
  },
}

P:NPC {
  key = "tervosh", id = TODO_NPC("Archmage Tervosh"), name = "Archmage Tervosh",
  bible = "bibles/dustwallow.md", role = "scholar", tier = "quest",
  communities = { "theramore" }, temper = { "brisk" }, values = { "loyal", "curious" },
  notices = { "class", "craft" },

  greetings = {
    { id = "g_tower", text = "Quickly, please. There's a great deal to do and not much day to do it in." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Another mage. Kirin Tor? I never cared for committees myself; I prefer to be useful on my own." },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "An herbalist! Have you seen my garden? Don't step on the briarthorn; it holds a grudge." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Archmage Tervosh. I advise the Lady, I read more than is good for me, and I tend a garden when the world allows it, which is rarely." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "The diplomat's trail ran cold, and then it ran somewhere I didn't like. Follow it, but carefully." },
        { id = "h_shards", when = { questActive = TODO_QUEST("Shadowshard Fragments") },
          text = "Shadowshard fragments. There's an unusual energy in them, and if you bring me enough I can make something of it." },
        { id = "h_garden", when = { metBefore = true }, text = "The marsh air is wonderful for herbs and terrible for parchment, so I've chosen the herbs. My notes forgive me, mostly." },
      },
      again = { { id = "h_again", text = "Yes, yes, what else? Keep it short, if you would." }, { id = "h_again2", text = "Another question? Good, ask it while I water these." } },
      choices = {
        { text = "What's this business with the diplomat?", next = "diplomat" },
        { text = "Tell me about your garden.", next = "garden" },
        { text = "You're not with the Kirin Tor?", next = "independent" },
        { text = "What's the Lady like to serve?", next = "jaina" },
        { text = "What do the shadowshards do?", next = "shards", when = { questActive = TODO_QUEST("Shadowshard Fragments") } },
        { text = "Any advice for a mage on their own?", next = "mage", when = { class = "MAGE" } },
        { text = "I'll be quick.", next = "END", fx = { affinity = 1 } },
      },
    },
    diplomat = {
      lines = { { id = "d_default", text = "Someone we were expecting never arrived. Diplomats don't simply wander off. Somebody wanted him gone, and somebody else wanted it to look like nobody did." } },
      choices = {
        { text = "Who do you suspect?", next = "diplomat_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    diplomat_who = {
      lines = { { id = "dw_default", text = "Everyone, politely; that's what advisors are for. The Lady trusts people and I check them, and between us, we're very nearly sensible." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    garden = {
      lines = { { id = "g_default", text = "Mageroyal by the wall, briarthorn by the steps, and something from the marsh I haven't named yet. It keeps trying to bite the bees." } },
      choices = {
        { text = "Name it after yourself.", next = "garden_name", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    garden_name = {
      lines = { { id = "gn_default", text = "Tervosh's Folly? Too accurate. I'll name it after a committee instead, since something that bites would suit one." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    independent = {
      lines = { { id = "i_default", text = "I prefer to be useful without asking six people first. The Lady asks, I answer, things get done. Committees can read about it afterwards." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jaina = {
      lines = { { id = "j_default", text = "Brilliant, stubborn, and far too willing to carry everything herself. Don't tell her I said stubborn, but do tell her to sleep." } },
      choices = {
        { text = "I'll tell her.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards = {
      lines = { { id = "s_default", text = "They hold energy the way a sponge holds water: badly, and everywhere. With enough of them I can shape something that holds it properly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "m_default", text = "Keep your own notes, in your own hand. Committees lose things, but you won't, if it's your handwriting nobody else can read." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I read more than is good for me, so I know a little about a great many things. Ask, and I'll try to be brief." },
    },
    background = { { id = "tp_bg", text = "A great many books, and then the Lady's tower, because she asked and I'd run out of better reasons to say no." } },
    advice = { { id = "tp_ad", text = "Never eat anything from the marsh you can't name. I can name most of them, and I still don't eat them." } },
    _none = { { id = "tp_none", text = "Not in any book I own, which means it's either very new or very dangerous." } },
  },
}

P:NPC {
  key = "vimes", id = TODO_NPC("Captain Garran Vimes"), name = "Captain Garran Vimes",
  bible = "bibles/dustwallow.md", role = "soldier", tier = "quest",
  communities = { "theramore" }, temper = { "direct", "sharp" }, values = { "dutiful", "lawful" },
  notices = { "race", "kit" },

  greetings = {
    { id = "g_citadel", text = "Captain Vimes, Theramore Guard. If you've come about the inn, sit down; if not, be quick." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Tell me you found something." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar. Yes, I speak a bit of your tongue, more than most here; it's useful in a land full of misunderstandings." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out there has been at you, so get mended. I need my witnesses alive." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Someone burned the Shady Rest Inn on the road north, and James Hyal lost his wife and child in it. Everyone says the Horde did it, but I'm not everyone." },
        { id = "h_ruins", tags = { "news" }, when = { questActive = TODO_QUEST("Inspecting the Ruins") },
          text = "Go to what's left of the inn and look at everything. Don't decide what it means until you've seen it all." },
        { id = "h_hoofprints", when = { questActive = TODO_QUEST("Suspicious Hoofprints") },
          text = "Hoofprints, around a building orcs supposedly burned. Interesting, and let's not tell the taverns yet." },
        { id = "h_reethe", when = { questActive = TODO_QUEST("Lieutenant Paval Reethe") },
          text = "Paval Reethe was one of ours, until he wasn't. If he's involved, I want to hear it from him." },
        { id = "h_shield", when = { questActive = TODO_QUEST("The Black Shield") },
          text = "A black shield, found where it shouldn't be. Somebody's trying very hard to make this look like something it isn't." },
      },
      again = { { id = "h_again", text = "Next question, then; I've a case on." }, { id = "h_again2", text = "Go on." } },
      choices = {
        { text = "Why don't you think it was the Horde?", next = "why" },
        { text = "Who were the Hyals?", next = "hyal" },
        { text = "What are people saying in the taverns?", next = "taverns" },
        { text = "You speak orcish?", next = "orcish" },
        { text = "Let me read the tracks myself.", next = "tracks", when = { class = { "HUNTER", "ROGUE", "DRUID" } } },
        { text = "I could sit with James Hyal.", next = "priest_hyal", when = { class = "PRIEST" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2, align = { order = 1 }, standing = { theramore = 1 } } },
        { text = "It was the Horde, and everyone knows it.", next = "END", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because it's too convenient. Because the Lady and the Warchief have a peace that someone would dearly like to break. And because I've been a soldier long enough to know a setup." },
      },
      choices = {
        { text = "Then who benefits?", next = "why_who" },
        { text = "Maybe it really was the Horde.", next = "why_horde", fx = { trait = { skeptical = 1 } } },
        { text = "Then let's find who set it.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
      },
    },
    why_who = {
      lines = { { id = "ww_default", text = "Anyone who'd rather Theramore and Orgrimmar were at each other's throats. That's a long list, and not all of it is on their side of the marsh." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why_horde = {
      lines = { { id = "wh_default", text = "Maybe, and then I'll say so, and I'll hang whoever did it whatever colour he wears. But I'll have proof first; that's the difference between a guard and a mob." } },
      choices = {
        { text = "Fair.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Proof takes too long, so hang the likely ones.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    hyal = {
      lines = { { id = "hy_default", text = "James kept the Shady Rest: good ale, honest prices. He came home to ash and two graves, and he hasn't said a word to me since. I don't blame him." } },
      choices = {
        { text = "Then let's give him an answer.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "An answer won't bring his family back.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    taverns = {
      lines = { { id = "ta_default", text = "That the orcs did it, that the Lady's too soft, that we should march on Brackenwall tomorrow. Taverns always know everything and never get up off the bench." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcish = {
      lines = { { id = "o_default", text = "Enough to be understood and not enough to be poetic. Orcs respect a man who tries. They respect him more if he gets the insults right." } },
      choices = {
        { text = "Teach me an insult.", next = "orcish_insult", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcish_insult = {
      lines = { { id = "oi_default", text = "No. You'd use it at the wrong moment, and I'd be the one explaining it to Krog." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tracks = {
      lines = { { id = "tr_default", text = "Then look properly: those aren't orc boots, they're something heavier, with a split hoof. Tell me I'm wrong; I'd almost like to be." } },
      choices = {
        { text = "You're not wrong.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "I'll need to see more.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    priest_hyal = {
      lines = { { id = "ph_default", text = "He hasn't spoken to anyone since. Your kind knows how to sit with grief better than mine does. Just sit with him, and leave the hoofprints to me." } },
      choices = {
        { text = "Just sitting. I promise.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "His grief is his own business, and I'll keep my distance.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Asking questions is my job, but I'll answer a few of yours for a change. Pick one." },
    },
    background = { { id = "tp_bg", text = "Soldier, then sergeant, then the man the Lady asks when something smells wrong. The last one's the job I'm good at." } },
    advice = { { id = "tp_ad", text = "Never believe the first story, especially when everyone agrees on it." } },
    grimtotem = { { id = "tp_grimtotem", text = "Tauren who want the Horde to break its peace. I've no proof of it, yet." } },
    _none = { { id = "tp_none", text = "Not my investigation. I've got one already, and it's plenty." } },
  },
}

P:NPC {
  key = "tesoran", id = TODO_NPC("Adjutant Tesoran"), name = "Adjutant Tesoran",
  bible = "bibles/dustwallow.md", role = "soldier", tier = "quest",
  communities = { "theramore" }, temper = { "orderly" }, values = { "dutiful", "practical" },
  notices = { "kit" },

  greetings = {
    { id = "g_records", text = "Name, unit, business? Sorry, that's habit; I keep the Guard's records, and everyone's a form to me." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Equipment damaged in the field. I'd file a report, but you're not one of ours, so get it fixed anyway." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Adjutant Tesoran. Every soldier in the Theramore Guard has a record, and I keep it, including the ones who walked away." },
        { id = "h_reethe", when = { questActive = TODO_QUEST("Lieutenant Paval Reethe") },
          text = "Reethe's file. Here, read it, and then tell the Captain I never said you could." },
        { id = "h_daelin", tags = { "news" }, when = { questActive = TODO_QUEST("Daelin's Men") },
          text = "Some of the Admiral's men never accepted that his war was over, and our records say where they went. Our records are very thorough." },
        { id = "h_ink", when = { metBefore = true }, text = "I ran out of ink yesterday and had to borrow from the Archmage, and his ink glows. My records glow now, and nobody will take them seriously." },
      },
      again = { { id = "h_again", text = "Anything else? I'll note it either way." } },
      choices = {
        { text = "What do the records say about the Guard?", next = "records" },
        { text = "The ones who walked away?", next = "deserters" },
        { text = "How do you keep track of it all?", next = "system" },
        { text = "Do you have a file on me?", next = "file", when = { townStanding = { town = "theramore", min = 20 } } },
        { text = "Thank you.", next = "END", fx = { affinity = 1 } },
      },
    },
    records = {
      lines = { { id = "r_default", text = "That we're stretched, damp and loyal, mostly loyal. The marsh takes more of us than the Horde does, and I have the columns to prove it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    deserters = {
      lines = { { id = "d_default", text = "Men who came over with the Admiral and couldn't stomach the Lady's peace. They didn't resign. They just stopped turning up, and started turning up elsewhere." } },
      choices = {
        { text = "Where?", next = "deserters_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deserters_where = {
      lines = { { id = "dw_default", text = "That's in the files the Captain reads, not the ones I hand out. Ask him, and tell him I sent you; he'll sigh, but he'll answer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    system = {
      lines = { { id = "s_default", text = "Three ledgers, one for who they are, one for where they are, one for what they've done. When the three disagree, someone's lying. Usually the second ledger." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    file = {
      lines = { { id = "f_default", text = "Of course, a short one, very complimentary. The Captain wrote 'useful' and underlined it, and he doesn't underline things." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every soldier's record passes through this office, and a fair bit of news comes with it. Ask, and I'll check my files." },
    },
    background = { { id = "tp_bg", text = "Joined the Guard, discovered I could spell, and was never allowed near a sword again. I've made my peace with it." } },
    advice = { { id = "tp_ad", text = "Write things down. Memory flatters you, but paper doesn't." } },
    _none = { { id = "tp_none", text = "There's no file on that, which is itself worth noting." } },
  },
}

P:NPC {
  key = "janene", id = TODO_NPC("Innkeeper Janene"), name = "Innkeeper Janene",
  bible = "bibles/dustwallow.md", role = "innkeeper", tier = "service",
  communities = { "theramore" }, temper = { "steady" }, values = { "loyal", "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Come in out of the damp. Dustwallow gets into your bones; a hot meal gets it out again." },
    { id = "g_home", when = { homeInn = { "Theramore Isle", "Theramore" } }, text = "Back home on the isle! Your room's dry, and in Dustwallow, that's a promise worth making." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've come a long way back from somewhere cold. Sit down, and I'll bring soup." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "One more and you'll be swimming home. The crocolisks would enjoy that more than you would." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Janene. Soldiers, sailors, mages, merchants: they all end up at my tables sooner or later. Theramore is my home, and this inn is its kitchen." },
        { id = "h_lady", when = { metBefore = true }, text = "Lady Jaina came down to the kitchen last week to thank the cooks, in person, and half of them still won't wash the hand she shook." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The sea's loud tonight. Sailors say a loud sea is a lucky sea, but sailors say a lot of things." },
      },
      again = { { id = "h_again", text = "Anything else, love?" } },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "What's the talk at the tables?", next = "talk" },
        { text = "What's good to eat?", next = "food" },
        { text = "Just passing through.", next = "END" },
      },
    },
    talk = {
      lines = { { id = "t_default", text = "The burned inn on the north road, mostly. Half the room says orcs, the other half says it's too easy to say orcs. Captain Vimes drinks in the corner and says nothing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    food = {
      lines = { { id = "f_default", text = "Fish stew, because we're on an island, and bread, because the dwarves insisted. And something the quel'dorei like that nobody else will touch." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone in Theramore eats at my tables, and they talk while they eat. Ask me what you like." },
    },
    background = { { id = "tp_bg", text = "I cook. I've cooked here since the walls were half built, and I'll cook here when they're finished, though they're never finished." } },
    advice = { { id = "tp_ad", text = "Dry your boots by the fire every night you're in the marsh. Rot starts in the toes." } },
    _none = { { id = "tp_none", text = "Plenty gets said over my bar, but not that. Ask at the citadel." } },
  },
}
