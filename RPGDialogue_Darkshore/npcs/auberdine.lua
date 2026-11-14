-- Auberdine. Voice: bibles/auberdine.md
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thundris", id = TODO_NPC("Thundris Windweaver"), name = "Thundris Windweaver",
  bible = "bibles/auberdine.md", role = "noble", tier = "major",
  communities = { "auberdine" }, temper = { "steady" }, values = { "fair", "wise" },
  spiritSensitive = true,
  notices = { "class", "race" },

  greetings = {
    { id = "g_elder", text = "Auberdine is glad of you, traveller. Rest, eat, and when you're ready, I may ask something of you. The village has troubles enough to share." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've returned. Sit with an old elf a moment. Tell me what the forest told you." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin of the Silver Hand. I'll confess I trust your order more than some of my own kin. Don't tell them I said so." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Humans in Darkshore, coming off the boats every week now. Some of my people frown at it. I judge each of you by your own deeds, not your kings'." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Kin from Eldre'Thalas, after so long. Welcome. Whatever your ancestors did or didn't do, it was before my time and yours." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thundris Windweaver, elder of Auberdine. I see to the village's daily needs, which lately means seeing to its fears. The land is sickening, and I want to know why." },
        { id = "h_bashal", tags = { "news" }, when = { questActive = TODO_QUEST("Bashal'Aran") },
          text = "A blue glow among the old ruins at Bashal'Aran. Old magic doesn't wake on its own. Find out what woke it." },
        { id = "h_highborne", when = { questActive = TODO_QUEST("Tools of the Highborne") },
          text = "Highborne relics, out at Ameth'Aran. Bring them to me and I'll see them destroyed. The magic in them has done enough harm for one world." },
        { id = "h_river", tags = { "news" }, when = { questActive = TODO_QUEST("The Cliffspring River") },
          text = "The river's turning foul, and I suspect it starts in Felwood. Bring me water from the falls to the north, and we'll know." },
        { id = "h_blackwood", when = { questActive = TODO_QUEST("The Blackwood Corrupted") },
          text = "Something is feeding corruption to the Blackwood furbolgs. If we can draw it out into the open, we can be rid of it." },
        { id = "h_kor", tags = { "news" }, when = { questActive = TODO_QUEST("Seeking the Kor Gem") },
          text = "A Kor gem, for your order? You'll find them in Blackfathom Deeps, though not clean. Bring the tainted ones to me and I'll purify them." },
        { id = "h_ashenvale", when = { questActive = TODO_QUEST("Onward to Ashenvale") },
          text = "Raene Wolfrunner in Astranaar is an old friend and short of help. Go to her. She'll make better use of you than I can." },
      },
      choices = {
        { text = "What's sickening the land?", next = "sick" },
        { text = "Why trust the Silver Hand?", next = "silverhand" },
        { text = "I'll help Auberdine.", next = "END", fx = { affinity = 2, standing = { auberdine = 1 } } },
      },
    },
    sick = {
      big = true,
      lines = {
        { id = "s_default", text = "Corruption from Felwood, seeping down the rivers. A red crystal maddening the moonkin. Moss that turns furbolgs savage. One cause or many, I can't say yet. But it's coming from the north." },
      },
      choices = {
        { text = "I'll find the source.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Felwood?", next = "felwood" },
      },
    },
    felwood = {
      lines = { { id = "f_default", text = "Where the demons trod during the Third War. The forest there never healed. Now it's spreading its sickness to its neighbours." } },
      choices = { { text = "...", next = "END" } },
    },
    silverhand = {
      lines = { { id = "sh_default", text = "Because they came when they were needed and asked for nothing. That's rarer than it should be, among elves or anyone." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "I'm of the Circle, in my small way. Darnassus argues; Moonglade dreams; Auberdine just tries to keep its rivers clean." } },
    _none = { { id = "tp_none", text = "I don't know. But I'll find someone who does." } },
  },
}

P:NPC {
  key = "terenthis", id = TODO_NPC("Terenthis"), name = "Terenthis",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "auberdine" }, temper = { "intent" }, values = { "determined", "curious" },
  notices = { "form", "class" },

  greetings = {
    { id = "g_moss", text = "Careful where you step. That moss on your boots? Look closer. That's what I'm here to stop." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Thank Elune. I need someone who can feel what's wrong with this place, not just see it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Terenthis. I came to Darkshore to learn how far the Fel Moss has spread. Farther than I feared. I mean to find out why, and to end it." },
        { id = "h_threat", tags = { "news" }, when = { questActive = TODO_QUEST("How Big a Threat?") },
          text = "The furbolg camps to the south. Go and see how many have turned, and how badly. I need numbers before I can hope." },
        { id = "h_grimclaw", tags = { "news" }, when = { questActive = TODO_QUEST("A Lost Master") },
          text = "This bear, Grimclaw, came to me himself. His master was taken by furbolgs. A bear asking for help. You don't refuse that." },
        { id = "h_escape", when = { questActive = TODO_QUEST("Escape Through Stealth") },
          text = "Get him out quietly if you can. The furbolgs are sick, not evil. I'd rather we didn't have to kill more of them than we must." },
      },
      choices = {
        { text = "What is Fel Moss?", next = "moss" },
        { text = "I'll help.", next = "END", fx = { affinity = 2 } },
      },
    },
    moss = {
      big = true,
      lines = {
        { id = "m_default", text = "Moss that grew where demons walked, and kept something of them in it. The furbolgs eat it, or sleep on it, and it changes them. Slowly, then all at once." },
      },
      choices = { { text = "Then we cut it out.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The Circle sent me, more or less. I came anyway. Someone had to look at this up close." } },
    _none = { { id = "tp_none", text = "Not now. The moss, first. Everything else after." } },
  },
}

P:NPC {
  key = "gwennyth", id = TODO_NPC("Gwennyth Bly'Leggonde"), name = "Gwennyth Bly'Leggonde",
  bible = "bibles/auberdine.md", role = "priest", tier = "quest",
  communities = { "auberdine" }, temper = { "gentle" }, values = { "devout", "curious" },
  notices = { "class" },

  greetings = {
    { id = "g_temple", text = "The Temple of the Moon sent me to help Auberdine. The sea, it turns out, has its own ideas about what help means." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gwennyth, of the Sisterhood. I came to tend Auberdine's troubled people, and found the shore covered in great dead creatures. The sea's giving up its dead, and I'd like to know why." },
        { id = "h_washed", tags = { "news" }, when = { questActive = TODO_QUEST("Washed Ashore") },
          text = "Something huge came ashore down the coast. Bring me what's left of it, so I can read what happened. Mind the murlocs; they've been at it too." },
        { id = "h_creature", when = { questActive = TODO_QUEST("Beached Sea Creature") },
          text = "Another one. That's too many to be chance. Bring me a piece; Darnassus will want to see." },
        { id = "h_turtle", when = { questActive = TODO_QUEST("Beached Sea Turtle") },
          text = "Even the old turtles. They've swum these waters since before Teldrassil was a seed. Something is very wrong out there." },
      },
      choices = {
        { text = "What's killing them?", next = "killing" },
        { text = "Elune keep you.", next = "END" },
      },
    },
    killing = {
      lines = { { id = "k_default", text = "Nobody knows yet. The sea doesn't speak plainly. But I listen, and I write everything down. One day the pattern will show itself." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm sorry. I only know the shore, and lately not even that." } },
  },
}

P:NPC {
  key = "glynda", id = TODO_NPC("Sentinel Glynda Nal'Shea"), name = "Sentinel Glynda Nal'Shea",
  bible = "bibles/auberdine.md", role = "soldier", tier = "quest",
  communities = { "auberdine" }, temper = { "urgent" }, values = { "protective", "dutiful" },
  notices = { "kit" },

  greetings = {
    { id = "g_watch", text = "Staying in Auberdine? Then you're under the Sentinels' eye. Don't take it personally. We watch everyone." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The murlocs got their claws into you, by the look of it. Get mended, then go and pay them back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sentinel Glynda Nal'Shea. Corruption creeps into the groves, murlocs creep up the beaches, and I'm one Sentinel. I could use another pair of hands." },
        { id = "h_crystal", tags = { "news" }, when = { questActive = TODO_QUEST("The Red Crystal") },
          text = "Somewhere in the hills to the east sits a red crystal, and the moonkin around it have gone mad. Find it. Don't touch it." },
        { id = "h_cascade", when = { questActive = TODO_QUEST("As Water Cascades") },
          text = "Bring water from the moonwell. Pure water, to test against what the crystal's done. Don't let it spill." },
        { id = "h_murkdeep", tags = { "news" }, when = { questActive = TODO_QUEST("WANTED: Murkdeep!") },
          text = "Murkdeep. The murlocs' big brute. He's sunk boats leaving our harbour. The council's put a price on him. Collect it." },
      },
      choices = {
        { text = "What happened to the moonkin?", next = "moonkin" },
        { text = "I'll help.", next = "END", fx = { affinity = 2, standing = { auberdine = 1 } } },
      },
    },
    moonkin = {
      big = true,
      lines = {
        { id = "m_default", text = "They were gentle. Strange, but gentle. Then that crystal came from Felwood and they turned on everyone who came near. It isn't their fault. That doesn't stop their claws." },
      },
      choices = { { text = "I'll be careful.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the elder. I only watch the roads." } },
  },
}

P:NPC {
  key = "cerellean", id = TODO_NPC("Cerellean Whiteclaw"), name = "Cerellean Whiteclaw",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "auberdine" }, temper = { "melancholy" }, values = { "devoted", "loyal" },
  notices = { "class" },

  greetings = {
    { id = "g_dock", text = "Hm? Forgive me. I was watching the water. I do a great deal of that." },
    { id = "g_after", when = { questDone = TODO_QUEST("For Love Eternal") }, text = "You freed her. I'll never be able to thank you properly. I'll try anyway, every time I see you." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Have you slept the long sleep yet? Don't, if you can help it. The dreams find out what you love and keep it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Cerellean Whiteclaw. Before the Sundering I loved a woman named Anaya, in Ameth'Aran. The war took her and her city. I slept for thousands of years, and she was in every dream." },
        { id = "h_love", tags = { "news" }, when = { questActive = TODO_QUEST("For Love Eternal") },
          text = "Her spirit still walks the ruins. I should have set her free myself. I couldn't. Please. Do what I can't, and bring me her pendant." },
        { id = "h_after", when = { questDone = TODO_QUEST("For Love Eternal") },
          text = "She came to me, after. Just for a moment. She said we'll find each other again. I believe her. I've waited ten thousand years; I can wait a little more." },
      },
      choices = {
        { text = "Tell me about Anaya.", next = "anaya" },
        { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    anaya = {
      big = true,
      lines = {
        { id = "a_default", text = "She laughed at my bad poetry and kept every page. She was braver than me and kinder than me. Ten thousand years, and I still turn around expecting her to be there." },
      },
      choices = {
        { text = "She sounds wonderful.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You have to let her go.", next = "go" },
      },
    },
    go = {
      lines = { { id = "g_default", text = "Yes. Knowing has never once made it easier. Perhaps you'll find that out one day. I hope not." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm sorry. My mind is on the water, and on older things." } },
  },
}

P:NPC {
  key = "shaussiy", id = TODO_NPC("Innkeeper Shaussiy"), name = "Innkeeper Shaussiy",
  bible = "bibles/auberdine.md", role = "innkeeper", tier = "service",
  communities = { "auberdine" }, temper = { "warm" }, values = { "kind", "devout" },
  notices = { "weary" },

  greetings = {
    { id = "g_rest", text = "Your spirit's tired, I can tell. Rest here. The waves are loud, but they sing you to sleep after a night or two." },
    { id = "g_home", when = { homeInn = { "Auberdine" } }, text = "Back to Auberdine. The sea air's good for you. Mostly." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Furbolgs? Murlocs? Moonkin? It's always one of the three. Sit, and Elune guard your dreams tonight." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Shaussiy. I keep the inn by the docks. Travellers off the boats from Teldrassil and Menethil, mostly, and they all arrive seasick." },
        { id = "h_cerellean", when = { heardLine = "cerellean.h_default" },
          text = "You've spoken with Cerellean. He stands on that dock every day. I bring him tea. He forgets to drink it. I bring more." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just resting.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the elder, love. He knows everything worth knowing in Auberdine." } },
  },
}
