-- Stormwind, part three: a lord in the library, a brawler in Old Town, Elmore's student,
-- a beggar behind the Auction House and the man who'd rather nobody heard about the Stockade.
-- Voice: bibles/city3.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Lord Gregor Lescovar. Canon secret: he works with the Defias. He never says so.
P:NPC {
  key = "lescovar", id = TODO_NPC("Lord Gregor Lescovar"), name = "Lord Gregor Lescovar",
  bible = "bibles/city3.md", role = "noble", tier = "quest",
  communities = { "stormwind" }, temper = { "smooth" }, values = { "proud", "ambitious" },
  notices = { "deed", "status" },

  greetings = {
    { id = "g_library", text = "Quietly, please. This is a library, not a market, whatever the Trade District has taught you." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again, still adventuring, I see. How very tireless of you." },
  },

  notice = {
    { id = "n_deadmines", cat = "deed", when = { deed = "dungeon:The Deadmines" },
      text = "You've been down in that dreadful Westfall mine, I hear. Did you bring anything back, papers or ledgers? Purely out of curiosity, of course." },
    { id = "n_rogue", cat = "status", when = { class = "ROGUE" },
      text = "Shaw's sort, by the look of you. Tell him I'm reading; it's all I ever do here, reading." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lord Gregor Lescovar, of the House of Nobles. I come here to think. The House is very loud, and very little of what's said there is worth hearing." },
        { id = "h_diplomat", when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "A missing diplomat, you say? How very careless of someone. Stormwind loses so many things these days: diplomats, patience, masons." },
        { id = "h_prestor", when = { heardLine = "katrana.h_default" },
          text = "So Lady Prestor has received you. A remarkable woman, who sees what needs doing and does not trouble the Regent with the details, and I admire that enormously." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Alliance" },
          text = "So you're one of the new elves, and the Kirin Tor vouched for you, I'm told. How generous of the Kirin Tor, when they're so rarely the ones who pay for anything." },
        { id = "h_noble", when = { origin = "human_minor_noble" },
          text = "One of the lesser houses, I see. I know your family's name, because it appears on several of my ledgers." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Clergy, in the library, how refreshing. The Cathedral is so generous with its opinions on the treasury; do give the Archbishop my regards." },
        { id = "h_baros", when = { heardLine = "baros.e_default" },
          text = "Alexston told you his sad story, I see. He kept his post and his friend kept his pride. Both have done rather well out of the arrangement." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I do have reading to do." },
        { id = "h_again2", text = "Yes? Briefly. Silence is the whole point of a library." },
      },
      choices = {
        { text = "What troubles the House of Nobles?", next = "house" },
        { text = "What about the masons?", next = "masons" },
        { text = "Why read here, my lord?", next = "library" },
        { text = "The Church says the masons were wronged.", next = "church", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "The Defias took my family's farm.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I found papers in the Deadmines.", next = "papers", when = { deed = "dungeon:The Deadmines" } },
        { text = "I'll leave you to your reading.", next = "END" },
      },
    },
    house = {
      lines = {
        { id = "ho_default", text = "Money, mostly. The kingdom spends like a king and the King isn't here. Someone has to say no. I find I'm very good at saying no." },
      },
      choices = {
        { text = "To whom?", next = "whom" },
        { text = "Someone has to.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    whom = {
      lines = { { id = "w_default", text = "To anyone who asks. That's rather the point of the word." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    masons = {
      big = true,
      lines = {
        { id = "m_default", text = "The masons were paid what the city could bear. They disagreed, loudly, and left. Whatever they've become out west is their own choice, not the House's." },
      },
      choices = {
        { text = "They rebuilt your city.", next = "rebuilt", fx = { trait = { stern = 1 }, opinion = { westfall = "abandoned" } } },
        { text = "That's fair.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    rebuilt = {
      lines = { { id = "r_default", text = "And were thanked. Thanks is a currency too, you know. Not everyone has the sense to accept it." } },
      choices = {
        { text = "Thanks doesn't feed a family.", next = "rebuilt_queen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rebuilt_queen = {
      big = true,
      lines = { { id = "rq_default", text = "Their riot killed a queen. Tiffin went into the street to calm them and someone threw a stone. Forgive me if their wages move me less than they move you." } },
      choices = {
        { text = "That was one hand, not a whole guild.", next = "BACK", fx = { affinity = -1, align = { honor = 1 }, opinion = { defias = "masons_wronged" } } },
        { text = "I didn't know.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then the masons got what they had coming.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    library = {
      lines = { { id = "li_default", text = "Because no one shouts in a library. I come to meditate. The guards know to leave me be, and Sheaf knows better than to recommend me books." } },
      choices = {
        { text = "Do you feel watched here?", next = "library_watch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    library_watch = {
      lines = { { id = "lw_default", text = "Constantly. Master Shaw's little creatures creak on the stairs. Let them listen. A man reading is very dull to spy on." } },
      choices = { { text = "I'm sure it is.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    church = {
      lines = { { id = "ch_default", text = "Does it? The masons built its Cathedral too. Has His Grace paid them a copper of his own? Do ask him, before he lectures the House again." } },
      choices = {
        { text = "He's said so in the Keep, at least.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Then His Grace is no better than the rest of you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmhand = {
      lines = { { id = "fa_default", text = "How dreadful. The House sympathises enormously. Sympathy is, unfortunately, the only thing the treasury has in abundance." } },
      choices = { { text = "Keep your sympathy.", next = "BACK", fx = { affinity = -2, trait = { stern = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    papers = {
      lines = { { id = "pa_default", text = "Did you? How enterprising, and where are they now? Purely for the archive, you understand, because history is so easily lost." } },
      choices = {
        { text = "With Gryan Stoutmantle.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I burned them.", next = "papers_burned", fx = { trait = { cautious = 1 } } },
      },
    },
    papers_burned = {
      lines = { { id = "pb_default", text = "Burned? What a pity, what a terrible, terrible pity. Do be more careful with history in future." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A senior member of the House of Nobles, with a library to think in. The rest is not the business of adventurers." } },
    advice = { { id = "tp_ad", text = "Never say yes on the first asking. People value what they have to wait for. Even refusals." } },
    defias = { { id = "tp_defias", text = "Bandits. A Westfall matter. I can't imagine why anyone in this city would trouble themselves over it." } },
    westfall = { { id = "tp_westfall", text = "Dust and complaints. The farms will recover, or they won't. The House can't plough fields for them." } },
    seven_kingdoms = { { id = "tp_seven", text = "Seven, then five, then fewer. Kingdoms come and go, but houses endure; noble ones, I mean." } },
    _none = { { id = "tp_none", text = "I'm sure I couldn't say. Ask a librarian; Sheaf is about somewhere." } },
  },
}

-- Dashel Stonefist: dwarf brawler in Old Town, the Missing Diplomat's rough middle.
P:NPC {
  key = "dashel", id = TODO_NPC("Dashel Stonefist"), name = "Dashel Stonefist",
  bible = "bibles/city3.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "brawler" }, values = { "proud" },
  notices = { "body", "drink" },

  greetings = {
    { id = "g_fist", text = "What're you lookin' at? No, go on, I'm askin'. I like to know what folk are lookin' at before I hit 'em." },
    { id = "g_back", when = { metBefore = true }, text = "You! Ha, pull up a stool, but mind the leg, I broke it on a fella last week." },
  },

  notice = {
    { id = "n_big", cat = "body", when = { class = "WARRIOR" },
      text = "Now there's a pair o' shoulders. Fancy a round? Not o' drinks, mind, the other kind." },
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye're drunk. Good. Makes it fair, since I am too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dashel. Folk call me Fist, on account o' the fists. I drink in Old Town and I settle arguments in Old Town. Usually the same evening." },
        { id = "h_diplomat", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "A diplomat? Never met one. Ask me again an' ye'll be askin' from the floor." },
        { id = "h_after", when = { questDone = TODO_QUEST("The Missing Diplomat"), heardLine = "dashel.h_diplomat" },
          text = "No hard feelings. Ye hit like a mule, an' I respect a mule, so buy me a drink an' we'll call it square." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Pig an' Whistle's still pourin'. That's the only clock I keep." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Did Ironforge send ye tae fetch me home? Tell 'em I'm busy, an' tell 'em I'm winnin'." },
      },
      again = {
        { id = "h_again", text = "What else? Talk's thirsty work." },
        { id = "h_again2", text = "Aye? Make it quick or make it a fight." },
      },
      choices = {
        { text = "Why do you fight so much?", next = "fight" },
        { text = "Who are your friends?", next = "friends" },
        { text = "What's Old Town like?", next = "oldtown" },
        { text = "What was your part in it, Fist?", next = "plan", when = { questActive = TODO_QUEST("The Missing Diplomat") } },
        { text = "Fancy a round? The other kind.", next = "spar", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I'm not looking for trouble.", next = "END" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Because nobody pays me to think. They pay me to stand in a door an' look unfriendly, an' it's honest work, mostly." } },
      choices = { { text = "Who pays you?", next = "who" }, { text = "Fair enough.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "Folk who'd rather I didnae say. That's what the extra coin's for." } },
      choices = { { text = "I'll find out.", next = "BACK", fx = { trait = { brave = 1 } } }, { text = "Keep your secrets.", next = "BACK", fx = { affinity = 1 } } },
    },
    friends = {
      lines = { { id = "fr_default", text = "The lads. Old Town's finest, by their own count. They come runnin' when I whistle an' they go home when I say. Mostly." } },
      choices = {
        { text = "Do they ever lose?", next = "friends_practice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friends_practice = {
      lines = { { id = "fp_default", text = "Tae you, maybe, but they'd call it practice. They call everythin' practice, losin' especially." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    oldtown = {
      lines = { { id = "ot_default", text = "Oldest part o' the city. The orcs didnae burn it, so nobody rebuilt it, so nobody cleans it, but the best ale's here, an' the worst smell too." } },
      choices = {
        { text = "And SI:7, right next door?", next = "oldtown_si7" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldtown_si7 = {
      lines = { { id = "os_default", text = "Aye, the barracks, an' they watch me drink. I drink slower, out o' respect." } },
      choices = { { text = "Very considerate.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    plan = {
      lines = { { id = "pl_default", text = "My bit finished when the first plan went sour, thanks tae adventurers again. The second plan was a Menethil man they called Slim, so go an' bother him, no' me." } },
      choices = { { text = "Thanks, Fist.", next = "BACK", fx = { affinity = 1 } }, { text = "If you're lying, I'll be back.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    spar = {
      lines = { { id = "sp_default", text = "Ha! No' here, the guards get sniffy. But I like ye. That's rarer than ye'd think, an' it's free." } },
      choices = { { text = "Another time, then.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Came tae Stormwind, found the ale an' the arguments, stayed for both. That's the whole tale." } },
    advice = { { id = "tp_ad", text = "Hit first. If ye cannae hit first, hit last. Never hit in the middle." } },
    defias = { { id = "tp_defias", text = "Westfall lot, an' not my crowd. I work in the city, where the ale's better." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. D'ye want a fight instead?" } },
  },
}

-- Furen Longbeard: shieldsmith and armorsmith, Grimand Elmore's student.
P:NPC {
  key = "furen", id = TODO_NPC("Furen Longbeard"), name = "Furen Longbeard",
  bible = "bibles/city3.md", role = "blacksmith", tier = "quest",
  communities = { "stormwind" }, temper = { "earnest" }, values = { "craft", "loyal" },
  notices = { "kit", "craft" },

  greetings = {
    { id = "g_shop", text = "Shields an' mail, made right. If it's got a dent, I'll take it out. If it's got a hole, I'll tell ye how ye got it." },
    { id = "g_back", when = { metBefore = true }, text = "Back wi' more dents, are ye? Let's see the damage, then." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state o' that! Who did this tae ye, a gnoll? It looks like a gnoll did it, so leave it wi' me." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Fellow smith. Ye'll know the master, then, by reputation if no' by temper. Everyone knows the temper." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Furen Longbeard. Shields an' armour. I learned from Grimand Elmore, an' I'm still learning, which he tells me daily." },
        { id = "h_elmore", when = { heardLine = "elmore.h_default" },
          text = "Ye've met the master, then. Did he say anything about me? No? That means he's pleased, because when he's not pleased, he says a great deal." },
        { id = "h_shield", when = { class = { "WARRIOR", "PALADIN" } },
          text = "Ye'll want a shield ye can trust, no' a pretty one, because pretty shields get folk killed." },
        { id = "h_stormpike", tags = { "news" }, when = { questActive = TODO_QUEST("Stormpike's Order") },
          text = "A letter from Loch Modan? Let's see it. A Stormpike wants a shield, which is good, for they're a proud clan an' they pay on time." },
        { id = "h_scalder", tags = { "news" }, when = { questActive = TODO_QUEST("The Shieldsmith") },
          text = "Is that Barleybrew Scalder? So Yorus sent ye, did he? Then I owe him, an' you'll have yer shield, so sit, sit." },
        { id = "h_mail", when = { questActive = TODO_QUEST("Fire Hardened Mail") },
          text = "Spider fangs from the Wetlands, chimaera horn from Stonetalon, an' that vial from the Kraul, an' I'll have the forge ready. Mind the chimaeras." },
      },
      again = {
        { id = "h_again", text = "Aye? What else needs fixin'?" },
        { id = "h_again2", text = "Go on, I'm listenin', since the hammer's restin' anyway." },
      },
      choices = {
        { text = "What's Elmore like to learn from?", next = "master" },
        { text = "Who orders from you?", next = "orders" },
        { text = "Why live so far from Ironforge?", next = "why_here" },
        { text = "Can you make me something harder than this?", next = "mail", when = { class = "WARRIOR", minLevel = 22 } },
        { text = "Can you fix this?", next = "BUSINESS" },
        { text = "Later.", next = "END" },
      },
    },
    master = {
      big = true,
      lines = {
        { id = "m_default", text = "Hard. He makes ye hammer the same plate till the hundredth is right, then melts it an' says do another. Best thing that ever happened tae me." },
      },
      choices = {
        { text = "That's devotion.", next = "BACK", fx = { affinity = 2 } },
        { text = "That sounds miserable.", next = "miserable" },
        { text = "Does he know you're good?", next = "master_notes" },
      },
    },
    miserable = {
      lines = { { id = "mi_default", text = "Aye, it is. Misery's how the good stuff gets in. Ask any smith worth the name." } },
      choices = { { text = "I'll take your word.", next = "BACK" } },
    },
    master_notes = {
      lines = { { id = "mn_default", text = "I've a trick or two he hasnae seen. One day I'll write them down an' send them over. Then I'll hide behind the bellows." } },
      choices = { { text = "I'd pay to see his face.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    orders = {
      lines = { { id = "o_default", text = "The Stormpikes, mostly, up in Loch Modan. Mountaineers write all the way down here for a Longbeard shield. Makes a dwarf proud." } },
      choices = {
        { text = "Why yours?", next = "orders_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders_why = {
      lines = { { id = "ow_default", text = "Because mine have never come back split. Well, once, but we dinnae talk about once." } },
      choices = { { text = "Now I want to know.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    why_here = {
      lines = { { id = "wh_default", text = "The master's here, so I'm here. An' Stormwind's walls are new. New walls need good shields behind them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mail = {
      lines = { { id = "ma_default", text = "Aye, if ye'll fetch the makings for fire-hardened mail: spider fangs, chimaera horn, an' worse. It's a long list an' a longer road." } },
      choices = { { text = "I'll fetch them.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Elmore's student. That's the only part that matters, an' he'd say it doesnae matter much yet.", next = "master" } },
    advice = { { id = "tp_ad", text = "Check yer straps before every fight. A good shield on a bad strap is a lid on a pot." } },
    _none = { { id = "tp_none", text = "Ask the master, if ye dare." } },
  },
}

-- Topper McNabb: beggar behind the Auction House, once a farmer, never short of a story.
P:NPC {
  key = "topper", id = TODO_NPC("Topper McNabb"), name = "Topper McNabb",
  bible = "bibles/city3.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "dramatic" }, values = { "hopeful" },
  notices = { "wealth", "kit" },

  barks = {
    { id = "b_spare", text = "A copper for an honest man! Or a dishonest one, I'm not proud!" },
    { id = "b_shine", text = "Armour shined, two coppers! One copper if you don't look too closely!" },
  },
  greetings = {
    { id = "g_coin", text = "Friend! That's a kind face, a generous face. Has anyone ever told you you've a generous face?" },
    { id = "g_back", when = { metBefore = true }, text = "My favourite benefactor returns! I've told everyone about you, though nobody believed me." },
  },

  notice = {
    { id = "n_rich", cat = "wealth", when = { money = { min = 1000000 } },
      text = "Oh, that purse is heavy, I can hear it from here. It's calling to me, and it's saying 'Topper'." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Rough day? I know rough days; I've had nothing but, since the farm. Sit down, though not too close, because you smell like a fight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Topper McNabb, at your service, and a farmer once. Now I sit here and let the city walk past, and it never stops, but it rarely tips." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Bless me, would you, holy one? Go on, because I've been told I need it, mostly by the guards." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend? I've all day, and I've had all day for years." },
        { id = "h_again2", text = "Still here? Wonderful, because company's free." },
      },
      choices = {
        { text = "What happened to your farm?", next = "farm" },
        { text = "Here's a coin.", next = "coin", fx = { affinity = 2, trait = { generous = 1 } } },
        { text = "I lost a farm too, to the Defias.", next = "farmer", when = { origin = "human_westfall_farmhand" } },
        { text = "Not today.", next = "END" },
      },
    },
    farm = {
      big = true,
      lines = {
        { id = "f_default", text = "Orcs burned it. Or the army built a guard tower right in front of it and the orcs came for the tower. Either way, I got the fire and the army got a medal." },
      },
      choices = {
        { text = "That's a hard story.", next = "BACK", fx = { affinity = 1 } },
        { text = "Is any of that true?", next = "truth" },
      },
    },
    truth = {
      lines = { { id = "t_default", text = "Some of it, depending on who's paying. If you're paying, then it's all true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    coin = {
      lines = { { id = "c_default", text = "Bless you! I'll spend it wisely, on bread, probably bread, or possibly ale, but bread-adjacent ale." } },
      choices = { { text = "Take care, Topper.", next = "END" }, { text = "Something else.", next = "BACK" } },
    },
    farmer = {
      lines = { { id = "fa_default", text = "Did you! Then you know, because nobody tells it right, the losing of a farm. You tell me yours sometime and I'll tell you mine, though mine's got more orcs." } },
      choices = { { text = "Mine's got more thieves.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Farmer, then not. The middle bit changes depending on who's listening and what they've got in their purse.", next = "farm" } },
    advice = { { id = "tp_ad", text = "Never build your house in front of anyone's tower; that one's free. The rest costs a copper." } },
    defias = { { id = "tp_defias", text = "They asked me to join, once, and I said I'd think about it. I'm still thinking, and it's very restful, thinking." } },
    _none = { { id = "tp_none", text = "I know nothing, friend. But for a copper I'll know something." } },
  },
}

-- Warden Thelwater: runs the Stockade, and would like the riots never mentioned again.
P:NPC {
  key = "thelwater", id = TODO_NPC("Warden Thelwater"), name = "Warden Thelwater",
  bible = "bibles/city3.md", role = "guard", tier = "quest",
  communities = { "stormwind" }, temper = { "anxious" }, values = { "self-preserving" },
  notices = { "soldier", "stealth" },

  greetings = {
    { id = "g_quiet", text = "Yes? Quickly, and quietly, please, because everything about this place should be quiet, especially lately." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you, good. No, I mean it: you're the only one who's ever made things better down there." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Don't. Whatever you're thinking of doing, don't. I've enough people trying to get out without people trying to get in." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Warden Thelwater, of the Stockade. I keep Stormwind's worst under its canals most days, and the other days I'd thank you not to mention." },
        { id = "h_thredd", tags = { "news" }, when = { questActive = TODO_QUEST("Bazil Thredd") },
          text = "Thredd, the Defias' man inside, is behind all of it, I'm certain. Deal with him, and nobody has to write a report, please." },
        { id = "h_riots", tags = { "news" }, when = { questActive = TODO_QUEST("The Stockade Riots") },
          text = "They're loose on the lower tiers again, and if the Captain finds out, I'm finished. So he won't find out, will he?" },
        { id = "h_visitor", when = { questActive = TODO_QUEST("The Curious Visitor") },
          text = "Thredd's had a visitor, a strange one. Nobody signed him in, and nobody can tell me what he looked like, so I'd very much like to know who he was." },
        { id = "h_darkshire", when = { heardLine = "millstipe.h_ward" },
          text = "Darkshire writes to me about one of my prisoners. The House of Nobles writes to me about the same prisoner. I've stopped opening either." },
        { id = "h_mac", when = { questActive = TODO_QUEST("The Color of Blood") },
          text = "Nikova sent you, Mac's grandmother. He was fourteen, and a guard because the men had gone to the front, so don't say anything; just get her what she asked for." },
        { id = "h_quiet", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Stockade Riots"), days = 3 } },
          text = "Thredd's dead and the cells are filling back up, quietly. I'm sleeping again, badly, but again." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Half my guards could use a priest, and the other half need a better excuse than the one they gave the Captain." },
      },
      again = {
        { id = "h_again", text = "Yes, what else? Be quick about it, please." },
        { id = "h_again2", text = "Something more? Not too loudly." },
      },
      choices = {
        { text = "What happened in the Stockade?", next = "riots" },
        { text = "Who do you keep down there?", next = "cells" },
        { text = "Who was Thredd's visitor?", next = "visitor", when = { questDone = TODO_QUEST("The Stockade Riots") } },
        { text = "Your prisoners could use a priest.", next = "priest", when = { class = "PRIEST" } },
        { text = "I'll be discreet.", next = "END", fx = { affinity = 2 } },
      },
    },
    riots = {
      big = true,
      lines = {
        { id = "r_default", text = "Nothing happened, only a small disturbance. Some prisoners are out of their cells and some of my guards are, well... it's being handled, by you, I hope." },
      },
      choices = {
        { text = "I'll handle it.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Your prisoners can sort themselves out, Warden.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "You should tell someone.", next = "tell" },
      },
    },
    tell = {
      lines = { { id = "t_default", text = "I am telling someone: I'm telling you. You seem very capable and very unlikely to file anything." } },
      choices = {
        { text = "And the Captain?", next = "tell_captain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tell_captain = {
      lines = { { id = "tc_default", text = "The Captain hears the Stockade lost its own prisoners, and I'm guarding a fishmonger's cart by the end of the week, if I'm lucky. So he'll hear it's handled." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } }, { text = "He deserves the truth.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } } },
    },
    cells = {
      lines = { { id = "ce_default", text = "Thieves, murderers, insurgents, and a few the House of Nobles would rather keep breathing. Targorr the Dread, for one, a Blackrock executioner sentenced and still waiting.",
        fx = { learn = { "blackrock" } } } },
      choices = {
        { text = "Why is he still alive?", next = "cells_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cells_hold = {
      lines = { { id = "ch_default", text = "Ask the nobles, because every time the rope's ready, a letter arrives. It's the same with Dextren Ward, who sold Raven Hill's dead to a necromancer, and Darkshire wants his hand." } },
      choices = {
        { text = "Robbing graves. The dead deserve better.", next = "BACK", when = { class = "PRIEST" }, fx = { align = { light = 1 } } },
        { text = "The dead don't need their bodies, so let the man go.", next = "BACK", when = { class = "PRIEST" }, fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } },
      },
    },
    visitor = {
      lines = { { id = "v_default", text = "Maelik, his papers said, and he came once or twice a week for months, after years of nobody. His papers were in perfect order, and that should have told me something." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    priest = {
      lines = { { id = "p_default", text = "Minister to them? Half would steal your vestments and the other half would confess to crimes they didn't do, for the company." } },
      choices = {
        { text = "Is there anyone who'd want a prayer?", next = "priest_mac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_mac = {
      big = true,
      lines = { { id = "pm_default", text = "One. Mac, a guard of fourteen, stopped them tearing blankets into red scarves, and one of them stabbed him for it. Say one for him, if you're saying them." } },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Prayers won't help Mac now, but justice for his killer might.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Warden of the Stockade. Before that, a man who thought being warden would be quiet. Never take a job for its quiet." } },
    advice = { { id = "tp_ad", text = "Check the papers, then check the person, and then check the papers again. I didn't, once." } },
    defias = { { id = "tp_defias", text = "Half my cells are full of them, and the other half of their friends. They organise better in prison than the guards do outside it." } },
    _none = { { id = "tp_none", text = "That's not a Stockade matter, thank the Light." } },
  },
}
