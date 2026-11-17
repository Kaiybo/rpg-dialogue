-- The Violet Citadel: Archmage Modera, Archmage Celindra, and the Kirin Tor's quartermaster. Voice: bibles/dalaran.md
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dal_modera", id = TODO_NPC("Archmage Modera"), name = "Archmage Modera",
  bible = "bibles/dalaran.md", role = "scholar", tier = "major",
  communities = { "dalaran", "kirin_tor" }, temper = { "proud", "steady" }, values = { "loyal", "learned", "dutiful" },
  notices = { "class", "arcane", "faction" },

  impression = {
    first = "Archmage Modera holds herself like someone carrying a heavy tray through a crowded room, gracious and never quite at rest. She bent her own council's rules to save her city, and she doesn't seem sorry.",
    third = "{name} met Archmage Modera of the Kirin Tor in the Violet Citadel, who called for outside help when her council would not.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to the Violet Citadel. Mind the stairs; some of them are newer than others." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good. These halls could use a face that isn't worried about wards." },
    { id = "g_helped", when = { questDone = TODO_QUEST("Friend of the Kirin Tor") },
      text = "Ah, {name}. You're always welcome in these halls, after what you did for us." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You're here because I allowed it. Let's both remember that." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "You've been away {away}, and the city kept rebuilding without you, though more slowly than I'd like. It's good to see you on these stairs again." },
    { id = "g_away_long", when = { away = 60 }, text = "After {away} away I wondered whether you'd forgotten us, and I'd not have blamed you. Dalaran is glad of you, even if the council won't say so." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown in power since we last spoke, and I can feel it from here. Do be careful near the wards, for they notice that sort of thing before I do." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told someone in the city caught you in a falsehood. Dalaran has had enough secrets from its own council, so I'd ask you not to add to them." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word reaches even the Citadel that you've done the city a kindness. The council won't thank you aloud, so I shall." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You'll feel the ley lines tugging at you on the upper stairs. That's what's left of the disruption, and it fades a little every day." },
    { id = "n_warlock", cat = "arcane", when = { class = "WARLOCK" },
      text = "This city once let Kel'Thuzad study in its own towers, warlock, so forgive me if I watch your hands while we talk." },
    { id = "n_forsaken", cat = "faction", when = { race = "Scourge" },
      text = "Some of the dead who walk with your queen wore the violet once. I try not to look for their faces, and I don't always manage it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Modera of the Kirin Tor. You've caught the Citadel at an untidy hour, I'm afraid, with half our wards held up by tired magi and the other half by stubbornness, all because of what broke at the top of the Citadel, and the council would rather nobody heard of it." },
        { id = "h_helped", key = true, when = { questDone = TODO_QUEST("Friend of the Kirin Tor") },
          text = "There you are, {name}. You came through our sewers when we were too proud to ask anyone else, and as far as I'm concerned, Dalaran owes you a seat by its fire." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Friend of the Kirin Tor"), days = 3 } },
          text = "Celindra tells me the mote reached her safely, and that the council has had a great deal to say about how it got there. Let them talk; the city is quiet for the first time since the crash." },
        { id = "h_heart", tags = { "news" }, when = { questActive = TODO_QUEST("Heart of Disruption") },
          text = "You found your way in, then. Up, {name}, to the top of the Citadel, where all of this began, and don't stop for anything that glows." },
        { id = "h_shade", tags = { "news" }, when = { killed = { name = "Shade of the Archmage", min = 1 } },
          text = "Whatever stood in the Purple Parlor is gone, and I've climbed those stairs more than once since to be certain of it. I still can't bring myself to sit in that room." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "One of Elaadrin's people! Ansirem has talked of little else for months, and I confess I've started reading the Supreme Magister's letters over his shoulder." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "I said I would deal with the Horde if it kept this city standing, and I meant it. Keep to the paths I've opened for you, and we'll both pretend to be comfortable." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Light, in the Citadel. Some of our apprentices were on the upper stairs when it happened, and they could use gentler hands than ours." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A fellow magus! If you've ever wondered what the Kirin Tor looks like with its sleeves rolled up, take a good look around you." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin of the Silver Hand, or what's left of it. Dalaran and your order buried a great many friends together, and I haven't forgotten." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "You walk very quietly for someone in a city full of wards. Every one of them noticed you, {class}, even if I almost didn't." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I'll answer what I'm permitted to, and perhaps a little more." },
        { id = "h_again2", text = "Go on. The wards can spare me a few minutes more." },
      },
      choices = {
        { text = "What happened at the top of the Citadel?", next = "crash" },
        { text = "Why did the Kirin Tor keep it quiet?", next = "secrecy" },
        { text = "Why lower the dome while the city's half built?", next = "dome" },
        { text = "Tell me about the Skyborne in your city.", next = "skyborne" },
        { text = "What's down in the Underbelly?", next = "underbelly" },
        { text = "Emissary Jacques found me in Southshore.", next = "jacques", when = { questDone = TODO_QUEST("An Alarming Request") } },
        { text = "Do your apprentices need healing, Archmage?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "I'd serve the Kirin Tor, if it would have me.", next = "xmage", when = { class = "MAGE" } },
        { text = "Does my pact with the Nether trouble you?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Will the Kirin Tor keep helping my people?", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "Why let the Horde through your sewers?", next = "xhorde", when = { faction = "Horde" } },
        { text = "Isn't so much magic in one place dangerous?", next = "xnightelf", when = { race = "NightElf" } },
        { text = "Are there other gnomes in the Kirin Tor?", next = "xgnome", when = { race = "Gnome" } },
        { text = "My masters in Stormwind studied here. They never let me forget it.", next = "xorig_mq", when = { origin = "human_mage_quarter" } },
        { text = "I'll leave you to your wards.", next = "END" },
      },
    },
    xorig_mq = {
      lines = {
        { id = "xmq_default", text = "Stormwind's Mage Quarter is full of our old students, and most of them still write to us as though the Violet Citadel had been waiting by the door for their letters. I'd wager your masters told you Dalaran was the finest city in the world, and that it would never fall." },
      },
      choices = {
        { text = "They did. Now I'm standing in what's left of it.", next = "xorig_mq2", fx = { trait = { skeptical = 1 } } },
        { text = "They said it would rise again. I believed them.", next = "xorig_mq2", fx = { trait = { brave = 1 }, affinity = 1 } },
        { text = "What would you have told me, in their place?", next = "xorig_mq2", fx = { trait = { curious = 1 } } },
      },
    },
    xorig_mq2 = {
      lines = {
        { id = "xmq2_default", text = "That a city of mages is only as wise as its least careful student, and that we had a great many careless ones, Kel'Thuzad among them. Write that to your masters, if you like; they won't enjoy it, but it's the truest thing I know." },
      },
      choices = {
        { text = "I think I'll enjoy writing that letter.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },

    crash = {
      lines = {
        { id = "cr_default", text = "It began in the parlors at the very top, with a crash like a bell dropped down a well. Every ley line under the city bucked at once, and the constructs we built to guard our streets began treating our own people as intruders." },
      },
      choices = {
        { text = "What was in the parlor?", next = "crash_what" },
        { text = "Was anyone hurt?", next = "crash_hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crash_what = {
      big = true,
      lines = {
        { id = "cw_default", text = "I wish I could tell you. Whatever answered us from that room wore the shape of an archmage, and none of us could say which one, and that frightens me more than all the rest." },
      },
      choices = {
        { text = "Seal that parlor, Archmage, and never open it again.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Study what's left of it. Dalaran should learn from its wounds.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    crash_hurt = {
      lines = {
        { id = "ch_default", text = "Apprentices, mostly, the ones posted on the upper stairs. They're resting in the lower halls, and the ones who can still hold a book are already arguing about what went wrong." },
      },
      choices = {
        { text = "I'll sit with them a while.", next = "BACK", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } },
          fx = { affinity = 2, trait = { kind = 1 } },
          journal = { first = "Sat with the hurt apprentices in the Violet Citadel's lower halls, at Archmage Modera's leave.",
                      third = "{name} tended the apprentices hurt when the Violet Citadel's parlors broke open." } },
        { text = "Arguing already? They'll mend.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    secrecy = {
      big = true,
      lines = {
        { id = "se_default", key = true, text = "The council decided the Kirin Tor could not be seen to lose control of its own city, not again. I disagreed, so I sent Jacques to Southshore and my image to the lakeshore without anyone's blessing." },
      },
      choices = {
        { text = "Would you defy them again, Archmage?", tag = "Persuade", next = "secret_true",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Friend of the Kirin Tor") }, { class = "MAGE" } } } },
          fail = { next = "secret_no", fx = { affinity = -1 } } },
        { text = "You were right to break their silence.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A council's word should be kept. They had their reasons.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret_true = {
      lines = {
        { id = "st_default", text = "Again, and gladly, though I'll deny I said so if you repeat it upstairs. The council remembers the dome as the thing that saved us, and I remember it as the place we hid while the world needed us." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret_no = {
      lines = {
        { id = "sn_default", text = "That is between me and the council, {class}. Ask me something I'm permitted to answer." },
      },
      choices = { { text = "Never mind. Something else, then.", next = "BACK" } },
    },

    dome = {
      lines = {
        { id = "do_default", text = "Because a city behind a wall forgets what it's for. Lordaeron is gone and the Alliance is spread thin, and Dalaran can't rebuild its towers and its friendships both in the dark." },
      },
      choices = {
        { text = "Wasn't the dome there to protect you?", next = "dome_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dome_why = {
      big = true,
      lines = {
        { id = "dw_default", text = "Some said it was for protection, and some said we hid in there to study and scheme, and both were partly right. What I know is that we were alone under it, and being alone nearly killed us when the ley lines broke." },
      },
      choices = {
        { text = "Better behind a wall and safe than open and overrun.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Opening the city was right. Allies are worth the risk.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    skyborne = {
      lines = {
        { id = "sk_default", text = "Ansirem found them, or they found him, through letters across a gulf I still don't entirely understand. Their isle was coming apart beneath them, so we sent magi to help, and they came back with us as allies." },
      },
      choices = {
        { text = "Do you trust them?", next = "skyborne_trust" },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    skyborne_trust = {
      lines = {
        { id = "skt_default", text = "They study the arcane the way we did before we grew comfortable, hungrily and with a little fear. I trust that, though I'd trust it more if they'd stop staring at our ley lines like starving men at a feast." },
      },
      choices = {
        { text = "That sounds like an apprentice I'd like.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    underbelly = {
      lines = {
        { id = "ub_default", text = "Sewers, cellars and old foundations, and since the crash, something worse. Our wards held the streets, but they didn't hold the depths, and someone down there has been raising the dead beneath our floors." },
      },
      choices = {
        { text = "One of your own, raising the dead?", next = "underbelly_own" },
        { text = "Something else.", next = "BACK" },
      },
    },
    underbelly_own = {
      big = true,
      lines = {
        { id = "uo_default", text = "One of ours once, yes. Dalaran taught Kel'Thuzad too, and you'd think we would have learned to look in our own cellars after that." },
        { id = "uo_cleared", when = { killed = { name = "Atrexis", min = 1 } },
          text = "One of ours once, and dead now, by your hand, I'm told. I'm not sorry, though I'll be reading his notes for a month to learn how we missed him." },
      },
      choices = {
        { text = "Necromancy is an abomination. Destroy every trace of it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Keep their books under guard. Know your enemy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    jacques = {
      lines = {
        { id = "ja_default", text = "Then he did better than I hoped. Jacques hates asking for anything, and I made him ask the whole Alliance, so be kind to him if you pass through Southshore again." },
      },
      choices = {
        { text = "He was very polite about it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xpriest = {
      lines = {
        { id = "xp_default", text = "Some do, the ones who were nearest the parlor when it broke. We have hands enough to hold the wards and too few that know how to mend a burn, so if you'd sit with them a while, I'd be grateful." },
      },
      choices = {
        { text = "I'll go to them now.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } },
          journal = { first = "Archmage Modera asked me to look in on the apprentices burned when the Citadel's parlor broke open.",
                      third = "{name} offered the Light's healing to the Kirin Tor's injured apprentices." } },
        { text = "What burned them, exactly?", next = "crash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xm_default", text = "The Kirin Tor takes its members slowly, after years of study and an apprenticeship and more patience than most can spare. But a mage who walked our sewers when we needed it will find doors open that were shut a month ago." },
      },
      choices = {
        { text = "Then I'll go on with the next step.", next = "xmage2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage2 = {
      big = true,
      lines = {
        { id = "xm2_default", text = "Then here is your first lesson, and it's free: never trust a ward you didn't check yourself. We trusted ours, and you've seen what that cost us." },
      },
      choices = {
        { text = "I'll earn my place the proper way, through study.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules are for quiet times. Put me to work now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "Trouble is the wrong word. This city let Kel'Thuzad work in its towers and paid for it, so I watch anyone who keeps company with the Nether, and I'll ask you not to summon anything inside the Citadel." },
      },
      choices = {
        { text = "My servants stay on a short leash. You have my word.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your caution didn't save you last time, Archmage.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xskyborne = {
      big = true,
      lines = {
        { id = "xs_default", text = "We already have, and we will again, but between the two of us: we're holding our own city together with string this season. Elaadrin knew that and came anyway, which tells me how bad things were on Zephras." },
      },
      choices = {
        { text = "Then we'll stand with Dalaran, as you stood with us.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Zephras comes first. Dalaran must understand that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhorde = {
      big = true,
      lines = {
        { id = "xh_default", text = "Because if Dalaran falls, it takes everything with it, your Undercity included, and your masters know that as well as I do. I'd rather have you in my sewers under my eye than outside my walls guessing." },
      },
      choices = {
        { text = "Then we're allies, for now. I'll keep faith.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "We'll take what we came for, Archmage.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnightelf = {
      big = true,
      lines = {
        { id = "xn_default", text = "Alfina Nightgaze tells me so every week, and I've stopped arguing because she's usually right. Your people learned that lesson at a price we can barely imagine, and we're trying to learn it more cheaply." },
      },
      choices = {
        { text = "Then let some of it go, before it breaks you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Careful hands can hold it. Yours seem careful.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "More than you'd think, and they argue more than the rest of us together. Lizi Silverstone could tell you, if you can get her to stop working long enough to talk." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Most of what happens in this city crosses my desk sooner or later, usually later. Ask, and I'll tell you what I can." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } },
        text = "Ask, then, but keep it short. I have wards to see to, and I haven't decided what to make of you." },
    },
    background = { { id = "tp_bg", text = "I've served the Kirin Tor most of my life, through the dome and the fall and now this. I'd rather talk about the city than about myself." } },
    advice = { { id = "tp_ad", text = "Don't touch anything in the Citadel that hums, and don't trust anything that hums politely. Those are the dangerous ones." } },
    alterac = { { id = "tp_alterac", text = "A dead kingdom on our doorstep, and its thieves in our hills. We kept them out with the dome, and now we keep them out with patrols." } },
    burning_legion = { { id = "tp_legion", text = "Archimonde stood in our streets and broke this city with a gesture. I don't speak of it lightly, and I'd rather not speak of it at all." } },
    two_orders = { { id = "tp_orders", text = "The High Order came to us; their cousins went to the Horde. I'm told the two don't speak, and I'm in no position to lecture anyone about family quarrels." } },
    _none = { { id = "tp_none", text = "That's outside what I can speak to, I'm afraid. Try the library, once it has a roof." } },
  },
}

P:NPC {
  key = "dal_celindra", id = TODO_NPC("Archmage Celindra"), name = "Archmage Celindra",
  bible = "bibles/dalaran.md", role = "scholar", tier = "major",
  communities = { "dalaran", "kirin_tor" }, temper = { "sharp", "proud" }, values = { "learned", "stern" },
  notices = { "class", "faction" },

  impression = {
    first = "Archmage Celindra treats every minute as borrowed from a ward that needs her. Underneath the impatience is real grief for Antonidas, and she guards it as carefully as her study.",
    third = "{name} met Archmage Celindra in the Violet Citadel, a brusque archmage and an old friend of Antonidas.",
  },

  greetings = {
    { id = "g_default", text = "Yes? Be quick, please; I'm very busy." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Is it urgent, or merely interesting?" },
    { id = "g_helped", when = { questDone = TODO_QUEST("Friend of the Kirin Tor") }, text = "Ah, the mote-bearer. Come in, but mind the circle on the floor." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the wards have not been quiet once in that time. Is it urgent, then, or merely a visit?" },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I hear you frightened someone in the streets. This city has had enough of fear, so please take yours outside the walls." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Someone in the city was misled, I'm told, and your name came up. I am very busy, but not too busy to remember that." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Then you can hear the wards humming, and you'll understand why I can't stop to chat while they do." },
    { id = "n_horde", cat = "faction", when = { faction = "Horde" },
      text = "Horde, in the Citadel. I'll be counting the books on my shelves after you leave, so don't take it personally." },
    { id = "n_texts", cat = "origin", when = { origin = "gnome_forbidden_texts" },
      text = "You have the look of a reader who doesn't ask permission first. Dalaran lost a great many books when it fell, and some of the worst of them turned up later in hands that shouldn't have held them, so keep yours away from my shelves." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Yes? I'm Celindra, and I have three wards to recalibrate and only one pair of hands, and a mote of loose power to keep watch on besides, so please be brief." },
        { id = "h_mote", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Friend of the Kirin Tor"), days = 3 } },
          text = "So you're the one who carried the mote. Thank you, sincerely, and now let me work, because your errand is the reason the council has been in my study all morning." },
        { id = "h_mote_active", when = { questActive = TODO_QUEST("Friend of the Kirin Tor") },
          text = "Modera sent you with something for me? Give it here, carefully, and don't jostle it." },
        { id = "h_shrewd", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Shrewd Negotiations"), days = 3 } },
          text = "You brought the mote back on your master's terms, which was clever and also rather rude. The Kirin Tor will remember both." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A magus. Then you'll forgive me for not looking up, because if I look away from this circle, it unravels." },
        { id = "h_quarter", when = { origin = "human_mage_quarter" },
          text = "Stormwind-trained, by that accent and that very particular way of standing back from a ward. Your masters were ours once, so tell them from me that the circle is still drawn clockwise, whatever they've been teaching." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. If you're looking for the apprentices who were hurt, they're in the lower halls; Modera will have told you." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Another of the High Order. Your people ask more questions in an hour than my last three apprentices did in a year, and I mean that as a compliment, mostly." },
      },
      again = {
        { id = "h_again", text = "Something else? Quickly, please." },
        { id = "h_again2", text = "Go on, then. The ward will hold another minute." },
      },
      choices = {
        { text = "What exactly is the mote?", next = "mote" },
        { text = "What are you working on?", next = "work" },
        { text = "Is the city safe now?", next = "safe" },
        { text = "Did you know Archmage Antonidas?", next = "antonidas" },
        { text = "Can you teach me anything, Archmage?", next = "xmage", when = { class = "MAGE" } },
        { text = "The Horde means you no harm, Archmage.", next = "xhorde", when = { faction = "Horde" } },
        { text = "When will the High Order see your libraries?", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    mote = {
      lines = {
        { id = "mo_default", text = "A piece of the power that broke loose at the top of the Citadel, caught and held. While we keep it, we can measure how far the disruption spread, and while someone else keeps it, we sleep badly." },
      },
      choices = {
        { text = "Who else wanted it?", next = "mote_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mote_who = {
      big = true,
      lines = {
        { id = "mw_default", text = "The Forsaken, for one, and I'd wager half the magisters left in the world. Power that's been torn loose always finds a buyer, which is why I'd prefer you didn't mention where it's kept." },
      },
      choices = {
        { text = "Destroy it, then. Some power isn't worth keeping.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Keep it and study it. Power's only dangerous in fools' hands.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    work = {
      lines = {
        { id = "wo_default", text = "Wards, mostly, holding up the parts of the city that aren't rebuilt yet. A dome over a city is simple next to a hundred small wards over a hundred broken rooftops, and every one of them complains in a different key." },
      },
      choices = {
        { text = "Can I help?", next = "work_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_help = {
      lines = {
        { id = "wh_default", text = "Not with the wards, unless you've studied in secret for twenty years. But Alvareaux is always short of something, and the crews on the Path of Renewal could use someone who isn't a magus to tell them which way is up." },
      },
      choices = {
        { text = "I'll look in on them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    safe = {
      big = true,
      lines = {
        { id = "sa_default", text = "Safer than it was, which isn't the same thing. The streets are calm and the constructs are quiet, and I still look in on the Purple Parlor every night before I sleep." },
      },
      choices = {
        { text = "Then rest. Someone else can watch the parlor tonight.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Good. Vigilance is the only real ward.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    antonidas = {
      lines = {
        { id = "an_default", key = true, text = "He was my friend, and the finest mind this city ever produced, and he died in these streets when the dead came for us. I put a great deal of work aside after that, because some of it was his as much as mine." },
      },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What work did you put aside?", next = "antonidas_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    antonidas_work = {
      lines = {
        { id = "aw_default", text = "Things he trusted me to study, and that I couldn't face alone afterward. Ask me again when the towers are finished, and perhaps I'll have an answer for you." },
        { id = "aw_warm", when = { disposition = { min = 70 } },
          text = "Things he trusted me to study, and I couldn't bear to open them without him. I may, someday, and if I do, I think I'd like someone like you to know about it." },
      },
      choices = {
        { text = "I'll ask again, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xmage = {
      lines = {
        { id = "xm_default", text = "I can teach you that a tired archmage is a poor teacher. Come back when the wards stop humming, and bring me a question I haven't heard before." },
      },
      choices = {
        { text = "What question haven't you heard?", next = "xmage2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage2 = {
      lines = {
        { id = "xm2_default", text = "If I could tell you, I'd have heard it, wouldn't I? That was your first lesson, and it was cheaper than most." },
      },
      choices = { { text = "Fair. Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    xhorde = {
      big = true,
      lines = {
        { id = "xh_default", text = "Your master in Tarren Mill wanted a seat at our table, and he bargained with our own property to get one. I'd call that a poor beginning, whatever he meant by it." },
      },
      choices = {
        { text = "Then let's begin better. I'll deal honestly with you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It worked. He got his seat, and that's what counts.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xskyborne = {
      lines = {
        { id = "xs_default", text = "When the roofs are on, and not a day before. Your people want every book at once, the way Antonidas's students did, and I can't decide whether that pleases me or exhausts me." },
      },
      choices = {
        { text = "Both, I'd guess.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know wards, portals and the state of this Citadel's foundations, which is to say, poor. Choose one." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "Ask quickly, and I'll answer if it's short." },
    },
    background = { { id = "tp_bg", text = "I've been Kirin Tor since before the dome, and I'll be Kirin Tor when it's long forgotten. That's all the history I have time for." } },
    trade = { { id = "tp_trade", text = "Wards today, and portals when the city stops shaking. Neither is a trade for the impatient." } },
    burning_legion = { { id = "tp_legion", text = "I was here when Archimonde came. I'll not describe it, and you shouldn't ask anyone else who was." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, and less time to find out." } },
  },
}

P:NPC {
  key = "dal_alvareaux", id = TODO_NPC("Archmage Alvareaux"), name = "Archmage Alvareaux", title = "Kirin Tor Quartermaster",
  bible = "bibles/dalaran.md", role = "vendor", tier = "service",
  communities = { "dalaran", "kirin_tor" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "class" },

  impression = {
    first = "Archmage Alvareaux keeps the Kirin Tor's stores, and apologizes for them before anyone can complain. He has the patient look of a man who counts everything twice.",
    third = "{name} met Archmage Alvareaux, the Kirin Tor's quartermaster in the Violet Citadel.",
  },

  greetings = {
    { id = "g_default", text = "Supply and logistics, at your service, such as it is." },
    { id = "g_back", when = { metBefore = true }, text = "Back to see if the stock has changed? Sometimes it has." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and yes, the stock has changed, though mostly by getting smaller. Cloth and metal go to the scaffolds first, I'm afraid." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been helping the city, which is more than most wizards manage for my ledgers. Do have a look round; it's the least a quartermaster can offer." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A magus! You'll want our robes, I expect, and I'll have more when the weavers stop being drafted onto the scaffolds." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Archmage Alvareaux, and I see to supply and logistics for the Kirin Tor. We've precious little to offer our friends just now, I'm afraid, but stock changes, so do look in again." },
        { id = "h_helped", when = { questDone = TODO_QUEST("Friend of the Kirin Tor") },
          text = "Modera's adventurer! The tabard's yours if you want it; you've earned the colours, even if I can't give you much to wear under them." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Ah, the High Order. Your weavers' patterns sell faster than anything else on my shelves, and I've stopped pretending to understand why." },
      },
      again = { { id = "h_again", text = "Anything else? I've a ledger that won't balance itself." } },
      choices = {
        { text = "Why are your stores so thin?", next = "thin" },
        { text = "Who buys from the Kirin Tor?", next = "who" },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Good day, Archmage.", next = "END" },
      },
    },
    thin = {
      lines = {
        { id = "th_default", text = "Every bolt of cloth and every ingot in Dalaran goes into scaffolds and wards before it goes onto anyone's shoulders. When the Citadel's roof stops leaking, I'll have more to spare." },
      },
      choices = {
        { text = "And when will that be?", next = "thin_when" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thin_when = {
      lines = {
        { id = "tw_default", text = "Ask the masons, then ask the archmagi, then take the difference between their answers and add a season. That's how logistics works in a city of wizards." },
      },
      choices = { { text = "I'll check back, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    who = {
      lines = {
        { id = "wh_default", text = "Friends of the Kirin Tor, which lately means anyone who went into the sewers for us, and a good many Skyborne asking after any pattern with azure in its name." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Tabards, patterns and whatever the vaults can spare, which this season is mostly tabards." } },
    _none = { { id = "tp_none", text = "If it isn't in my ledger, I couldn't tell you about it." } },
  },
}
