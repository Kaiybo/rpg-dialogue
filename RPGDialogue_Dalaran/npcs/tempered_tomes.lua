-- Tempered Tomes: three High Order scholars, Kae'la Brightsong, La'tanja Brightgale and Ysa'bel Brightwind,
-- reading their way through Dalaran's books for whatever might help the drifting isles.
-- Skyborne facts only from BRIEF.md §10 and the wiki; their reasons for being here follow
-- Elaadrin Evengale's call for explorers (A Grand Adventure). Voice: bibles/tempered_tomes.md
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dal_kaela", id = TODO_NPC("Kae'la Brightsong"), name = "Kae'la Brightsong",
  bible = "bibles/tempered_tomes.md", role = "scholar", tier = "quest",
  communities = { "dalaran", "high_order" }, temper = { "eager", "chatty" }, values = { "curious", "kind" },
  notices = { "skyborne", "class" },

  impression = {
    first = "Kae'la Brightsong of the High Order reads everything Azeroth has ever written down, and wants to talk about all of it at once. Her friends roll their eyes at her; she doesn't seem to notice.",
    third = "{name} met Kae'la Brightsong, a young High Order scholar reading her way through Tempered Tomes in Dalaran.",
  },

  greetings = {
    { id = "g_default", text = "Winds be with you! Have you read this one? You must!" },
    { id = "g_skyborne", when = { race = "Skyborne" }, text = "Winds be with you! Oh, it's so good to hear a voice from home." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! I've read four more books since, and I've opinions on all of them." },
  },

  notice = {
    { id = "n_skyborne", cat = "skyborne", when = { race = "Skyborne" },
      text = "Did you bring anything to read from home? I left in such a hurry that I packed three shawls and no books, and La'tanja still hasn't let me forget it." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Are you Kirin Tor-trained? Could you tell me if this diagram is upside down? I've been reading it both ways for an hour." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Winds be with you! I'm Kae'la Brightsong, of the High Order, and I'm meant to be reading these tomes for anything that might help our isles, which I am, mostly. There's simply so much here, and all of it written by people I've never heard of!" },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Winds be with you, and oh, you've no idea how good it is to see a face from home! Sit, sit, and tell me everything, and then I'll tell you about the human who wrote nine hundred pages on barley." },
        { id = "h_human", when = { race = "Human" },
          text = "Winds be with you! You're human, aren't you? Then perhaps you can tell me, are all your histories this long, or only the ones about kings?" },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Oh! Winds be with you, I suppose. I'm only reading, I promise; La'tanja does all the talking with strangers, and she's just stepped out." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've lost my page again anyway." },
        { id = "h_again2", text = "Ask me something! I like it far better than reading alone." },
      },
      choices = {
        { text = "What brought you all the way to Dalaran?", next = "why" },
        { text = "What are you reading right now?", next = "reading" },
        { text = "Who are your two friends?", next = "friends" },
        { text = "What's Azeroth like, after the sky?", next = "azeroth" },
        { text = "Which isle are you from?", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "I studied with the Kirin Tor, as it happens.", next = "xmage", when = { class = "MAGE" } },
        { text = "Happy reading, Kae'la.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wy_default", key = true, text = "The Supreme Magister called for explorers, anyone willing to come down to Azeroth and bring home whatever might keep the isles together. The Kirin Tor let us in as guests, and somebody had to read all their books, so here we are." },
      },
      choices = {
        { text = "What's wrong with your isles?", next = "isles" },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    isles = {
      lines = {
        { id = "is_default", text = "They're drifting apart, slowly, since the wind spirits went away. The old pylons are failing, and some settlements have broken off entirely, and nobody knows whether the people on them made it." },
      },
      choices = {
        { text = "That sounds frightening.", next = "isles2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles2 = {
      lines = {
        { id = "i2_default", text = "It is, and that's why I read so much, I think, because when I'm reading I'm not thinking about it. La'tanja says that's not a method, but it gets me through the afternoons." },
      },
      choices = {
        { text = "Whatever gets you through. That's a method too.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    reading = {
      lines = {
        { id = "re_default", text = "A history called The Seven Kingdoms, about the human lands, and there are so many kings in it that I've started drawing them on a scrap of paper. Half of them are dead, and the other half seem to be cross with each other." },
      },
      choices = {
        { text = "Should you share what you learn with the Windshapers?", next = "share" },
        { text = "Something else.", next = "BACK", fx = { learn = { "seven_kingdoms" } } },
      },
    },
    share = {
      big = true,
      lines = {
        { id = "sh_default", text = "I think so, because their islands are drifting too, and a book doesn't care who reads it. La'tanja says they chose their side and their spirits, and that we owe them nothing after what happened in the highlands." },
      },
      choices = {
        { text = "Share it. Knowledge belongs to everyone who needs it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "La'tanja's right. They chose another road.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    friends = {
      lines = {
        { id = "fr_default", text = "La'tanja keeps the list of what the High Order wants us to find, and she's very cross with me for reading things that aren't on it. Ysa'bel reads about our ancestors, mostly, and goes to talk to a dead elf in the Linguists Lounge, which I think is very brave." },
      },
      choices = {
        { text = "A dead elf?", next = "friends2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friends2 = {
      lines = {
        { id = "f2_default", text = "A Highborne shade, Ranath, who reads old tongues for the Kirin Tor and has four cats. Ysa'bel says he won't tell her anything, but she keeps going back, because she's like that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    azeroth = {
      big = true,
      lines = {
        { id = "az_default", text = "Heavy, is the only word I have for it. Everything stays exactly where it's put, the rain falls straight down, and nobody looks over the edge of anything before they step. Do you love it here, or have you simply never known anything else?" },
      },
      choices = {
        { text = "I love it. It's worth defending, every stone.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's dirt and war. Don't get attached.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xskyborne = {
      lines = {
        { id = "xs_default", text = "Valanaar, though I spent every summer I could in Siroccas with my aunt, before the ferries stopped. I don't know whether her house is still there, and I've stopped asking people who might know." },
      },
      choices = {
        { text = "I'm sorry, Kae'la.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xm_default", text = "Then you're exactly who I need! This diagram is meant to show a ward anchored to stone, and either it's upside down or I am. It's for La'tanja's list, so please don't laugh." },
      },
      choices = {
        { text = "It's upside down. Turn it over.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a little about everything in this shop and not very much about anything else! What would you like?" } },
    background = { { id = "tp_bg", text = "I grew up in Valanaar with my nose in a book, and now I've my nose in a different book on a different world. Not much else has changed." } },
    advice = { { id = "tp_ad", text = "Read the last page first. That way, whatever happens in the middle, you're never frightened." } },
    seven_kingdoms = { { id = "tp_seven", text = "Seven! And they kept making more and losing them. I'm on the part where Alterac does something dreadful, and I can tell it's going to be dreadful." } },
    two_orders = { { id = "tp_orders", text = "We were one people on one isle once, and now we hardly speak. I wish I knew how it went so wrong." } },
    _none = { { id = "tp_none", text = "Oh, I haven't read about that yet! Give me a week." } },
  },
}

P:NPC {
  key = "dal_latanja", id = TODO_NPC("La'tanja Brightgale"), name = "La'tanja Brightgale",
  bible = "bibles/tempered_tomes.md", role = "scholar", tier = "quest",
  communities = { "dalaran", "high_order" }, temper = { "brisk", "sharp" }, values = { "dutiful", "wary" },
  notices = { "skyborne", "class" },

  impression = {
    first = "La'tanja Brightgale keeps the High Order's list of what to find in Dalaran's books and crosses things off it like a soldier counting arrows. She is polite to the Kirin Tor and watches them closely.",
    third = "{name} met La'tanja Brightgale, a High Order scholar at Tempered Tomes in Dalaran.",
  },

  greetings = {
    { id = "g_default", text = "Winds be with you. If you're here to browse, please browse quietly." },
    { id = "g_skyborne", when = { race = "Skyborne" }, text = "Winds be with you. Any news from Valanaar?" },
    { id = "g_horde", when = { faction = "Horde" }, text = "Winds be with you. The Kirin Tor say anyone may read here, so read." },
  },

  notice = {
    { id = "n_skyborne", cat = "skyborne", when = { race = "Skyborne" },
      text = "If you came over on the last skycutter, tell me how the pylons by the landing looked. Nobody writes to me about the pylons, and they're the only thing I want to hear about." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A trained magus. I've three questions about ward anchors that the Kirin Tor keep answering politely and uselessly; perhaps you'll do better." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "La'tanja Brightgale, of the High Order. I keep the list of what our people need from these books, and Kae'la keeps finding things that aren't on it, so if you've come to help, I'd be glad of it." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Winds be with you. You've come from the isles more recently than I have, so tell me, are the outer anchors still holding? I'd sooner hear it from you than read it in a letter." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Winds be with you. You're Horde, and the Windshapers are Horde, so I'll assume you've heard their side of things. I'd ask you to keep it out of this shop." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A magus. Good, because I have a question about anchoring wards to stone, and the Kirin Tor keep answering it with a smile and a different question." },
      },
      again = {
        { id = "h_again", text = "Anything else? The list is long, and the afternoon isn't." },
        { id = "h_again2", text = "Go on. I can listen and read at the same time." },
      },
      choices = {
        { text = "What's on the list?", next = "list" },
        { text = "How are the Kirin Tor treating you?", next = "kirintor" },
        { text = "Kae'la says you're hard on her.", next = "kaela" },
        { text = "What happened between your people and the Windshapers?", next = "windshapers" },
        { text = "The pylons near the landing looked weak.", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "Ask me your question about wards.", next = "xmage", when = { class = "MAGE" } },
        { text = "I'll let you work.", next = "END" },
      },
    },

    list = {
      lines = {
        { id = "li_default", key = true, text = "Wards that hold stone to stone, anchors that don't need a spirit to keep them, and anything at all about the planes of the elements. Our pylons are failing without the wind spirits, and if a human magus ever pinned a tower to the sky, I want to know how." },
      },
      choices = {
        { text = "Have you found anything yet?", next = "list2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    list2 = {
      lines = {
        { id = "l2_default", text = "Pieces. A treatise on wards that holds up a bridge, a chapter on the founding of this city's walls, and a footnote that names a book nobody here can find. Pieces add up, eventually, if you're patient and the isles are more patient still." },
      },
      choices = {
        { text = "I'll keep an eye out for that book.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    kirintor = {
      lines = {
        { id = "kt_default", text = "Kindly, and with great care, which isn't the same thing. They've opened their libraries and their portal and their Sky Enclave to us, and every kindness comes with a magus who wants to know exactly what we're reading." },
      },
      choices = {
        { text = "Do you trust them?", next = "trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      big = true,
      lines = {
        { id = "tr_default", text = "I trust them as far as I can read them, which grows a little every week. Our people hid in the sky for a long time, and I've no wish to trade one set of patrons who wouldn't explain themselves for another." },
      },
      choices = {
        { text = "They opened their gates to you. Trust them.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Keep watching them. Generosity always has a price.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    kaela = {
      lines = {
        { id = "ka_default", text = "I am, and she's earned it, because the isles are coming apart and she's reading poetry. But she remembers every word she reads, and twice now she's found the very thing I was looking for in a book I told her not to open." },
      },
      choices = {
        { text = "Maybe let her read what she likes.", next = "BACK", fx = { affinity = 1 } },
        { text = "And Ysa'bel?", next = "ysabel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysabel = {
      lines = {
        { id = "ys_default", text = "Ysa'bel reads about the dead, and I read about keeping the living on solid ground. I love her dearly, and I'd love her more if she spent less time with that Highborne ghost and more with the ward texts." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    windshapers = {
      big = true,
      lines = {
        { id = "ws_default", text = "In the Shen'dar Highlands our apprentices studied the new ley lines, and the Windshapers called them scars and tried to heal them shut, and people died on both sides over it. I've heard their version, and I don't need to hear it again." },
      },
      choices = {
        { text = "Blood on both sides. Someone has to forgive first.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "They brought it on themselves. Don't apologise for it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },

    xskyborne = {
      lines = {
        { id = "xs_default", text = "Weak, but standing, which is better than I feared and worse than I hoped. Thank you for telling me plainly; everyone else tells me the winds will provide, as if the winds hadn't already left." },
      },
      choices = {
        { text = "We'll find a way to hold them.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xm_default", text = "If a ward is anchored to stone and the stone itself begins to move, does the ward hold the stone in place, or does it travel with it? The Kirin Tor say 'it depends', and I would very much like to know on what." },
      },
      choices = {
        { text = "On the anchor. Tie it to something that doesn't move.", next = "xmage2" },
        { text = "I don't know either, I'm afraid.", next = "BACK", fx = { trait = { honest = 1 } } },
      },
    },
    xmage2 = {
      lines = {
        { id = "x2_default", text = "Something that doesn't move, in a sky where everything moves. That's the first useful answer I've had since I came, and it's a terrible one, so thank you." },
      },
      choices = {
        { text = "Glad to help, I think.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what's on the list and what isn't, and a fair amount about the isles. Ask quickly." } },
    background = { { id = "tp_bg", text = "I was a ward-keeper's apprentice in Valanaar, and I watched the pylon by our house go dark. That's why I'm here, and that's all of it." } },
    advice = { { id = "tp_ad", text = "Keep a list and cross things off it, because the world falls apart much slower when you do." } },
    two_orders = { { id = "tp_orders", text = "We sought the arcane and they sought the spirits who abandoned us, and now they sit with the Horde in Mulgore. That's the short version, and the long one is worse." } },
    _none = { { id = "tp_none", text = "That isn't on the list. Ask Kae'la; she reads everything that isn't." } },
  },
}

P:NPC {
  key = "dal_ysabel", id = TODO_NPC("Ysa'bel Brightwind"), name = "Ysa'bel Brightwind",
  bible = "bibles/tempered_tomes.md", role = "scholar", tier = "quest",
  communities = { "dalaran", "high_order" }, temper = { "calm", "gentle" }, values = { "learned", "loyal" },
  notices = { "skyborne", "race" },

  impression = {
    first = "Ysa'bel Brightwind reads about the Highborne the way some people read old family letters, slowly and a little afraid of what she'll find. She speaks softly and listens even more carefully.",
    third = "{name} met Ysa'bel Brightwind, a High Order scholar studying her people's Highborne past at Tempered Tomes in Dalaran.",
  },

  greetings = {
    { id = "g_default", text = "Winds be with you. Forgive me, I was far away." },
    { id = "g_skyborne", when = { race = "Skyborne" }, text = "Winds be with you, cousin. Sit, if you like; I'm only reading." },
    { id = "g_nightelf", when = { race = "NightElf" }, text = "Winds be with you. Forgive me for staring; you look like the pictures in my books." },
  },

  notice = {
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Your people and mine parted ways a very long time ago, and I've never had the chance to ask one of you what you remember. May I, some day?" },
    { id = "n_skyborne", cat = "skyborne", when = { race = "Skyborne" },
      text = "You wear an heirloom, don't you? I can always tell; people touch them without thinking when they're somewhere strange." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Winds be with you. I'm Ysa'bel Brightwind, of the High Order, and while my friends look for ways to save our isles, I read about the people we were before them. Someone ought to know where we came from, before we decide where we're going." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Winds be with you, cousin. Did you know there are books in this shop that name Eldre'Thalas? Written by humans, who'd never seen it, and still they knew more than we were ever taught at home." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "Winds be with you, and pardon my staring. My ancestors left your people's lands so long ago that you've become a story to us, and here you are, standing in a bookshop." },
        { id = "h_tortheldrin", when = { killed = { name = "Prince Tortheldrin", min = 1 } },
          text = "They say you've walked the halls of Eldre'Thalas, the ruin your maps call Dire Maul, and faced the prince who still sat there. I don't know whether to thank you or grieve, and I suspect I'll do both." },
      },
      again = {
        { id = "h_again", text = "Is there more? I'm in no hurry; the dead have waited this long." },
        { id = "h_again2", text = "Go on. I'd rather talk than read, for a little while." },
      },
      choices = {
        { text = "Where did your people come from?", next = "ancestors" },
        { text = "Kae'la says you visit a dead elf.", next = "ranath" },
        { text = "What's the heirloom you keep touching?", next = "heirloom" },
        { text = "How do you three get along?", next = "friends" },
        { text = "What do you remember of the old days?", next = "xnightelf", when = { race = "NightElf" } },
        { text = "What do you hope to find, cousin?", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "Winds be with you.", next = "END" },
      },
    },

    ancestors = {
      lines = {
        { id = "an_default", key = true, text = "From Eldre'Thalas, in the south-west of Kalimdor, where a prince named Tortheldrin tried to draw power from beyond the world. The ones who opposed him were purged, and the survivors followed the Shal'nan west across the sea, and the winds lifted us into the sky." },
      },
      choices = {
        { text = "Who was the Shal'nan?", next = "shalnan" },
        { text = "Were your ancestors Highborne, then?", next = "highborne" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shalnan = {
      lines = {
        { id = "sn_default", text = "The Veiled One, who led the rebellion in a golden mask and never once took it off. He gave up his rule once we were safe, and later he vanished, the same as the wind spirits, and nobody on the isles can say where either went." },
      },
      choices = {
        { text = "Do you think he's still alive?", next = "shalnan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shalnan2 = {
      lines = {
        { id = "s2_default", text = "I think I'd like him to be, and I know that isn't the same as thinking it. The old soldiers who guarded him won't guess, and they knew him better than any book will." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    highborne = {
      big = true,
      lines = {
        { id = "hb_default", text = "Some were, the magisters the High Order descends from, and some were ordinary folk of the city. I came here hoping to read that the Highborne were wise and good, and so far I've read about the Well of Eternity and a queen who called demons into the world." },
      },
      choices = {
        { text = "Your ancestors fled a tyrant. Be proud of that.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Highborne blood carries Highborne hunger. Watch for it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "highborne" } } },
      },
    },

    ranath = {
      lines = {
        { id = "ra_default", text = "Ranath Nightstride, in the Linguists Lounge, who was Highborne when the world was young. I've gone to him three times now, and three times he's been very courteous and told me nothing at all." },
      },
      choices = {
        { text = "Why do you keep going back?", next = "ranath2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ranath2 = {
      lines = {
        { id = "r2_default", text = "Because he looks at me as if he recognises something, and then he looks away. Whatever he isn't telling me, I think it's the thing I came all this way to hear." },
      },
      choices = {
        { text = "He said he doesn't know if you'll thank him.", next = "ranath3", when = { heardLine = "dal_ranath.s2_default" } },
        { text = "Give him time. He has plenty.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ranath3 = {
      lines = {
        { id = "r3_default", text = "Did he? Then he's afraid of disappointing me, and that's kinder than I'd thought him. I'll go back tomorrow and tell him I'd rather be disappointed than ignorant." },
      },
      choices = {
        { text = "That's the right answer.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    heirloom = {
      lines = {
        { id = "he_default", text = "This brooch was my grandmother's, given to me when I came of age, as every heirloom passes from the dead to the young among us. Her ashes went to the wind years ago, and I touch it when I'm somewhere she never was, which, lately, is everywhere." },
      },
      choices = {
        { text = "She'd be proud of you, I think.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    friends = {
      lines = {
        { id = "fr_default", text = "La'tanja carries the weight and Kae'la carries the light, and I try to remember where we've been. We argue about it every evening, and I wouldn't cross an ocean with anyone else." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xnightelf = {
      lines = {
        { id = "xn_default", text = "I'd hoped you might tell me, though I suppose your people were busy surviving what mine left behind. Do the kaldorei speak of Eldre'Thalas at all, or have you forgotten it as thoroughly as we were taught to?" },
      },
      choices = {
        { text = "We remember. Mostly as a warning.", next = "BACK", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xskyborne = {
      lines = {
        { id = "xs_default", text = "Something to tell the children back home when they ask who we were. 'Rebels who ran' is true, but it isn't enough, and I'd like to bring them more than that." },
      },
      choices = {
        { text = "Rebels who ran, and lived. That's plenty.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a little of where we came from, and less of where we're going. Ask, and I'll tell you what the books say." } },
    background = { { id = "tp_bg", text = "A scholar of the High Order, and my grandmother's granddaughter. The rest I'm still reading about." } },
    advice = { { id = "tp_ad", text = "Learn where you come from before someone else tells you. They'll always tell it worse." } },
    highborne = { { id = "tp_hb", text = "Brilliant, proud, and very nearly the end of the world. I'm trying to decide how much of that I inherited." } },
    _none = { { id = "tp_none", text = "I'm afraid that's further from home than my books go." } },
  },
}
