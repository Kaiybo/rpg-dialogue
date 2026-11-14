-- The Cathedral of Light and the Trade District: the people a young paladin meets on the
-- way to Redemption, and the man who leads the Church.
-- Voices: bibles/benedictus.md, bibles/gazin.md, bibles/stephanie.md, bibles/timmy.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Archbishop Benedictus: kind, soft-spoken, Faol's student. (Nothing later is hinted at.)
P:NPC {
  key = "benedictus", id = TODO_NPC("Archbishop Benedictus"), name = "Archbishop Benedictus",
  bible = "bibles/benedictus.md", role = "priest", tier = "major",
  communities = { "stormwind" }, temper = { "steady" }, values = { "pious", "kind" },
  spiritSensitive = true,
  notices = { "light", "affliction" },

  greetings = {
    { id = "g_peace", text = "Peace, child. The Cathedral is open to everyone. Even the tired." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "One of ours. Sit, if you've a moment. You rarely will, later." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "Duthorian's latest, I suspect. He speaks well of very few. Welcome." },
  },

  notice = {
    { id = "n_light", cat = "light", when = { alignment = { axis = "light", min = 50 } },
      text = "You carry the Light quietly. That's the rarest way. Most people wear it like a badge, and badges come off." },
    { id = "n_sick", cat = "affliction", place = "before", when = { debuffType = { "Disease", "Curse" } },
      text = "Something sits on you that shouldn't. Come closer to the altar a moment. There. Does that ease it?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Benedictus. I tend the Church as Archbishop Faol tended it before me. He built it to hold people. I try to keep the doors open." },
        { id = "h_priest", when = { class = "PRIEST", minLevel = 20 },
          text = "You've grown since you first knelt here. The Light hasn't changed. You have. That's how it's meant to work." },
        { id = "h_eye", when = { questActive = TODO_QUEST("Cleansing the Eye") },
          text = "The Eye of Paleth. A cursed thing. Bring it here, to the altar, and we'll see what the Light makes of it." },
        { id = "h_dark", when = { alignment = { axis = "light", max = -40 } },
          text = "There's a heaviness about you. I'm not going to ask. If you ever want to set it down, this is a good place to do it." },
      },
      choices = {
        { text = "What did Archbishop Faol teach?", next = "faol" },
        { text = "Does the Light ever abandon anyone?", next = "abandon" },
        { text = "Thank you, Your Grace.", next = "END" },
      },
    },
    faol = {
      lines = {
        { id = "f_default", text = "That the Light isn't owned by the strong. A farmer at his plough can carry as much of it as a king on his throne. I believed him. I look like a farmer; it helped." },
      },
      choices = { { text = "That's a kind teaching.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
    abandon = {
      big = true,
      lines = {
        { id = "a_default", key = true,
          text = "I asked that when Lordaeron fell. The prince, the king, the Silver Hand. I asked it every night for a year. I won't tell you I found the answer. I found I could keep working without it." },
      },
      choices = {
        { text = "That takes faith.", next = "END", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Maybe there's no answer.", next = "none", fx = { trait = { skeptical = 1 } } },
      },
    },
    none = {
      lines = { { id = "n_default", text = "Maybe. Then the work is still worth doing. That was always the point." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian's test. I've read the book. I've never had the patience to teach from it. He has." } },
    northshire_abbey = { { id = "tp_abbey", text = "Where many of us began. The bells there are older than this Cathedral." } },
    defias = { { id = "tp_defias", text = "I pray for the masons. I pray for the people they rob. Some days I run out of prayers before I run out of names." } },
    _none = { { id = "tp_none", text = "I don't know, child. I'd rather say that than pretend." } },
  },
}

-- Gazin Tenorm: a dwarf at the altar, frightened for his friend.
P:NPC {
  key = "gazin", id = TODO_NPC("Gazin Tenorm"), name = "Gazin Tenorm",
  bible = "bibles/gazin.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "brave", "lawful" },
  notices = { "paladin" },

  greetings = {
    { id = "g_altar", text = "Aye? Make it quick, I've a friend tae worry about." },
    { id = "g_symbol", when = { questActive = TODO_QUEST("The Symbol of Life") }, text = "Ye've got the Symbol? Then go. Henze cannae wait." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Symbol of Life") }, text = "There's the {g:lad|lass} who brought Henze back. Stand a moment so I can look at ye." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", maxLevel = 15 },
      text = "Rall sent ye? Ye're young. Good. Young legs get places quicker. Listen close." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gazin Tenorm. Henze Faulk an' me were gatherin' proof on the Defias for the king's advisors. They found us first. I got away. Henze didnae." },
        { id = "h_tome", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity") },
          text = "He's out by Heroes' Vigil, or what's left of him is. Rall says the Light can bring him back, if the hand holding it is steady." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Symbol of Life"), days = 3 } },
          text = "He's alive. Grumblin', bruised, alive. I owe ye more than I can pay, an' I'm a dwarf, so I'll try anyway." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf in the Cathedral. We're rarer here than ale. Glad tae see a friendly beard." },
      },
      choices = {
        { text = "What were you investigating?", next = "proof" },
        { text = "I'll bring him back.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    proof = {
      lines = {
        { id = "p_default", text = "Who's feedin' the Defias, who's armin' them. Papers, mostly. Henze had the papers. That's why they went for him." },
      },
      choices = { { text = "Then the papers matter.", next = "END", fx = { learn = { "defias" } } } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Organized, well-armed, an' meaner than they look. They look plenty mean." } },
    tome_of_divinity = { { id = "tp_tome", text = "Rall's book. I'm no paladin, but I've seen what it does tae the ones who finish it." } },
    _none = { { id = "tp_none", text = "Cannae help ye there. I'm a worrier, no' a scholar." } },
  },
}

-- Stephanie Turner: she and her husband run the orphanage.
P:NPC {
  key = "stephanie", id = TODO_NPC("Stephanie Turner"), name = "Stephanie Turner",
  bible = "bibles/stephanie.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "craft", "child" },

  greetings = {
    { id = "g_busy", text = "Sorry, love, I'm in a hurry. Always am. Children don't wait." },
    { id = "g_tome", when = { questActive = TODO_QUEST("The Tome of Divinity") }, text = "Did Duthorian send you? He does that. Bless him." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You sew! Oh, if you've ever a spare afternoon, there are thirty children who'd love a coat that fits." },
    { id = "n_young", cat = "child", when = { maxLevel = 8 },
      text = "You look barely older than some of mine. Eat something. That's an order from someone's mother." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Stephanie Turner. My husband and I run the orphanage. I make their clothes and keep them fed; John's off begging for the rest. Neither of us sleeps much." },
        { id = "h_tome", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity") },
          text = "You'd help? Linen. Plain linen cloth. I've more children than shirts this winter. Ten pieces of linen cloth and I'll have something to sew." },
        { id = "h_john", text = "John's up in Ironforge asking the dwarves for help. They're generous, once they've decided you're not a fool. It takes them a while." },
        { id = "h_war", when = { origin = "human_lordaeron_refugee" },
          text = "Some of my little ones came south from Lordaeron, same as you. They don't talk about it. Maybe you'd sit with them sometime." },
      },
      choices = {
        { text = "How many children do you look after?", next = "children" },
        { text = "I'll keep you in mind.", next = "END" },
      },
    },
    children = {
      lines = {
        { id = "c_default", text = "Too many, and not enough beds. The wars made orphans faster than anyone could build homes for them." },
      },
      choices = {
        { text = "That's a hard thing.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, align = { light = 1 } } },
        { text = "Someone should do something.", next = "someone" },
      },
    },
    someone = {
      lines = { { id = "s_default", text = "Someone is. Me. You're welcome to join in." } },
      choices = { { text = "Ha. Fair.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian's young paladins come to me. I put them to work. They go away a little kinder." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, love. Ask me about children's sizes." } },
  },
}

-- Lil Timmy: has a kitten. Needs a good home for it. Dad says no.
P:NPC {
  key = "timmy", id = TODO_NPC("Lil Timmy"), name = "Lil Timmy",
  bible = "bibles/timmy.md", role = "child", tier = "service",
  communities = { "stormwind" }, temper = { "cowardly" }, values = { "kind" },
  notices = { "pet", "wonder" },

  barks = {
    { id = "b_kitten", text = "Kitten for a good home! Very good kitten! Hardly scratches!" },
    { id = "b_dad", text = "Dad says I can't keep her. Dad says a lot of things." },
  },
  greetings = {
    { id = "g_kitten", text = "Do you want a kitten? Please say yes." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Did you change your mind? Say you changed your mind." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "You've already got an animal! Does {pet} like cats? She's very small. She won't be any trouble. Probably." },
    { id = "n_cat", cat = "wonder", place = "replace", when = { form = "cat" },
      text = "Look, kitty! A big one! Are you her mum? You're not her mum. You're a person. That's even better." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Timmy. This is my kitten. She needs a good home and my dad says ours isn't one. For cats. He likes it fine for me." },
        { id = "h_rich", when = { money = { min = 10000 } },
          text = "You look like you've got a nice house. With a fire. Cats love fires. Just saying." },
      },
      choices = {
        { text = "Let me see her.", next = "BUSINESS" },
        { text = "Sorry, Timmy.", next = "END" },
      },
    },
  },

  topics = { _none = { { id = "t_none", text = "I don't know. Do you want a kitten, though?" } } },
}
