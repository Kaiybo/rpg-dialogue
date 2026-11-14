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
    { id = "g_back", when = { metBefore = true }, text = "Ah. You. Still adventuring? How tireless of you." },
  },

  notice = {
    { id = "n_deadmines", cat = "deed", when = { deed = "dungeon:The Deadmines" },
      text = "You've been down in that Westfall mine, I hear. Dreadful place. Did you bring anything back? Papers, ledgers? Purely curiosity, of course." },
    { id = "n_rogue", cat = "status", when = { class = "ROGUE" },
      text = "Shaw's sort, by the look of you. Tell him I'm reading. It's all I ever do, here. Reading." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lord Gregor Lescovar, of the House of Nobles. I come here to think. The House is very loud, and very little of what's said there is worth hearing." },
        { id = "h_diplomat", when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "A missing diplomat? How careless of someone. Stormwind loses so many things these days. Diplomats. Patience. Masons." },
        { id = "h_prestor", when = { heardLine = "katrana.h_default" },
          text = "So Lady Prestor has received you. A remarkable woman. She sees what needs doing, and does not trouble the Regent with the details. I admire that enormously." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Alliance" },
          text = "So you're one of the new elves. The Kirin Tor vouched for you, I'm told. How generous of the Kirin Tor. They're so rarely the ones who pay for anything." },
      },
      choices = {
        { text = "What troubles the House of Nobles?", next = "house" },
        { text = "What about the masons?", next = "masons" },
        { text = "I'll leave you to your reading.", next = "END" },
      },
    },
    house = {
      lines = {
        { id = "ho_default", text = "Money, mostly. The kingdom spends like a king and the King isn't here. Someone has to say no. I find I'm very good at saying no." },
      },
      choices = {
        { text = "To whom?", next = "whom" },
        { text = "Someone has to.", next = "END", fx = { affinity = 1 } },
      },
    },
    whom = {
      lines = { { id = "w_default", text = "To anyone who asks. That's rather the point of the word." } },
      choices = { { text = "...", next = "END" } },
    },
    masons = {
      big = true,
      lines = {
        { id = "m_default", text = "The masons were paid what the city could bear. They disagreed, loudly, and left. Whatever they've become out west is their own choice, not the House's." },
      },
      choices = {
        { text = "They rebuilt your city.", next = "rebuilt", fx = { trait = { stern = 1 }, opinion = { westfall = "abandoned" } } },
        { text = "That's fair.", next = "END", fx = { affinity = 1 } },
      },
    },
    rebuilt = {
      lines = { { id = "r_default", text = "And were thanked. Thanks is a currency too, you know. Not everyone has the sense to accept it." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Bandits. A Westfall matter. I can't imagine why anyone in this city would trouble themselves over it." } },
    westfall = { { id = "tp_westfall", text = "Dust and complaints. The farms will recover, or they won't. The House can't plough fields for them." } },
    seven_kingdoms = { { id = "tp_seven", text = "Seven, then five, then fewer. Kingdoms come and go. Houses endure. Noble ones, I mean." } },
    _none = { { id = "tp_none", text = "I'm sure I couldn't say. Ask a librarian. Sheaf's about somewhere." } },
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
    { id = "g_back", when = { metBefore = true }, text = "You! Ha! Pull up a stool. Mind the leg, I broke it on a fella last week." },
  },

  notice = {
    { id = "n_big", cat = "body", when = { class = "WARRIOR" },
      text = "Now there's a pair o' shoulders. Fancy a round? Not drinks. The other kind." },
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye're drunk. Good. Makes it fair, since I am too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dashel. Folk call me Fist, on account o' the fists. I drink in Old Town and I settle arguments in Old Town. Usually the same evening." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "A diplomat? Never met one. Ask me again an' ye'll be askin' from the floor." },
        { id = "h_after", when = { questDone = TODO_QUEST("The Missing Diplomat") },
          text = "No hard feelings. Ye hit like a mule. I respect a mule. Buy me a drink an' we'll call it square." },
      },
      choices = {
        { text = "Why do you fight so much?", next = "fight" },
        { text = "I'm not looking for trouble.", next = "END" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Because nobody pays me to think. They pay me to stand in a door an' look unfriendly. It's honest work. Mostly." } },
      choices = { { text = "Who pays you?", next = "who" }, { text = "Fair enough.", next = "END" } },
    },
    who = {
      lines = { { id = "w_default", text = "Folk who'd rather I didnae say. That's what the extra coin's for." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Westfall lot. Not my crowd. I work in the city. Better ale." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Want a fight?" } },
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
    { id = "g_back", when = { metBefore = true }, text = "Back wi' more dents? Let's see the damage." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state o' that. Who did this tae ye? Was it a gnoll? It looks like a gnoll did it. Leave it wi' me." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Fellow smith. Ye'll know the master, then, by reputation if no' by temper. Everyone knows the temper." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Furen Longbeard. Shields an' armour. I learned from Grimand Elmore, an' I'm still learning, which he tells me daily." },
        { id = "h_elmore", when = { heardLine = "elmore.h_default" },
          text = "Ye've met the master. Did he say anything about me? No? That means he's pleased. When he's not pleased, he says a great deal." },
        { id = "h_shield", when = { class = { "WARRIOR", "PALADIN" } },
          text = "Ye'll want a shield ye can trust. Not pretty. Trust. Pretty shields get folk killed." },
      },
      choices = {
        { text = "What's Elmore like to learn from?", next = "master" },
        { text = "Can you fix this?", next = "BUSINESS" },
        { text = "Later.", next = "END" },
      },
    },
    master = {
      big = true,
      lines = {
        { id = "m_default", text = "Hard. He makes ye hammer the same plate a hundred times till the hundredth is right. Then he melts it an' says do another. Best thing that ever happened tae me." },
      },
      choices = {
        { text = "That's devotion.", next = "END", fx = { affinity = 2 } },
        { text = "That sounds miserable.", next = "miserable" },
      },
    },
    miserable = {
      lines = { { id = "mi_default", text = "Aye, it is. Misery's how the good stuff gets in. Ask any smith worth the name." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the master. If ye dare." } },
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
    { id = "g_coin", text = "Friend! Kind face, that. Generous face. You've a generous face, has anyone ever told you?" },
    { id = "g_back", when = { metBefore = true }, text = "My favourite benefactor returns! I've told everyone about you. Nobody believed me." },
  },

  notice = {
    { id = "n_rich", cat = "wealth", when = { money = { min = 1000000 } },
      text = "Oh, that purse is heavy. I can hear it from here. It's calling to me. It's saying 'Topper'." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Rough day? I know rough days. I've had nothing but, since the farm. Sit down. Not too close. You smell like a fight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Topper McNabb, at your service. Farmer, once. Now I sit here and let the city walk past. It never stops, but it rarely tips." },
      },
      choices = {
        { text = "What happened to your farm?", next = "farm" },
        { text = "Here's a coin.", next = "coin", fx = { affinity = 2, trait = { generous = 1 } } },
        { text = "Not today.", next = "END" },
      },
    },
    farm = {
      big = true,
      lines = {
        { id = "f_default", text = "Orcs burned it. Or the army built a guard tower right in front of it and the orcs came for the tower. Either way, I got the fire and the army got a medal." },
      },
      choices = {
        { text = "That's a hard story.", next = "END", fx = { affinity = 1 } },
        { text = "Is any of that true?", next = "truth" },
      },
    },
    truth = {
      lines = { { id = "t_default", text = "Some of it. Depends who's paying. You paying? Then it's all true." } },
      choices = { { text = "...", next = "END" } },
    },
    coin = {
      lines = { { id = "c_default", text = "Bless you! I'll spend it wisely. On bread. Probably bread. Possibly ale, but bread-adjacent ale." } },
      choices = { { text = "Take care, Topper.", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "They asked me to join, once. I said I'd think about it. I'm still thinking. It's very restful, thinking." } },
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
    { id = "g_quiet", text = "Yes? Quickly. And quietly, please. Everything about this place should be quiet. Especially lately." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. Good. No, I mean it. You're the only one who's ever made things better down there." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Don't. Whatever you're thinking of doing, don't. I've enough people trying to get out without people trying to get in." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Warden Thelwater, the Stockade. I keep Stormwind's worst under its canals. Most days. The other days, I'd thank you not to mention." },
        { id = "h_thredd", tags = { "news" }, when = { questActive = TODO_QUEST("Bazil Thredd") },
          text = "Thredd. The Defias' man inside. He's behind all of it, I'm certain. Deal with him, and nobody has to write a report. Please." },
        { id = "h_riots", tags = { "news" }, when = { questActive = TODO_QUEST("The Stockade Riots") },
          text = "They're loose on the lower tiers again. If the Captain finds out, I'm finished. So he won't find out. Will he?" },
        { id = "h_visitor", when = { questActive = TODO_QUEST("The Curious Visitor") },
          text = "Thredd's had a visitor. A strange one. Nobody signed him in, and nobody can tell me what he looked like. I'd very much like to know who he was." },
        { id = "h_darkshire", when = { heardLine = "millstipe.h_ward" },
          text = "Darkshire writes to me about one of my prisoners. The House of Nobles writes to me about the same prisoner. I've stopped opening either." },
      },
      choices = {
        { text = "What happened in the Stockade?", next = "riots" },
        { text = "I'll be discreet.", next = "END", fx = { affinity = 2 } },
      },
    },
    riots = {
      big = true,
      lines = {
        { id = "r_default", text = "Nothing happened. A small disturbance. Some prisoners are out of their cells and some of my guards are, well. It's being handled. By you, I hope." },
      },
      choices = {
        { text = "I'll handle it.", next = "END", fx = { affinity = 2, align = { order = 1 } } },
        { text = "You should tell someone.", next = "tell" },
      },
    },
    tell = {
      lines = { { id = "t_default", text = "I am telling someone. I'm telling you. You seem very capable and very unlikely to file anything." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Half my cells are full of them, and the other half of their friends. They organise better in prison than the guards do outside it." } },
    _none = { { id = "tp_none", text = "Not a Stockade matter. Thank the Light." } },
  },
}
