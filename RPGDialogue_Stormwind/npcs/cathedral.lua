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
  notices = { "light", "affliction", "form" },

  greetings = {
    { id = "g_peace", text = "Peace, child. The Cathedral is open to everyone. Even the tired." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "One of ours. Sit, if you've a moment. You rarely will, later." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "Duthorian's latest, I suspect. He speaks well of very few. Welcome." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Step out of the shadow while you're under this roof, child. Not because the Light minds. Because I'd like to see your face while we talk." },
    { id = "n_light", cat = "light", when = { alignment = { axis = "light", min = 50 } },
      text = "You carry the Light quietly. That's the rarest way. Most people wear it like a badge, and badges come off." },
    { id = "n_sick", cat = "affliction", place = "before", when = { debuffType = { "Disease", "Curse" } },
      text = "Something sits on you that shouldn't. Come closer to the altar a moment. There. Does that ease it?" },
  },

  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Ah. I wondered whether you'd studied that. Mind the novices; it frightens them." },
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
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Winds be with you, I'm told your people say. And the Light with you, say mine. I don't see why anyone can't have both." },
        { id = "h_gnome_priest", when = { race = "Gnome", class = "PRIEST" },
          text = "A gnome in the vestments of the Light. Gnomeregan's loss brought you to us, perhaps, or something else did. Either way, the Light has never asked anyone's height." },
        { id = "h_novice", when = { origin = "human_abbey_novice" },
          text = "Northshire's novices always kneel a little straighter than the rest. The brothers there are strict about posture. And about everything else, I'm told." },
        { id = "h_bell", when = { timeOfDay = "dusk" },
          text = "Listen. The sunset bell. We ring it for the kaldorei in the city, who never grew used to walls. I've grown to need it myself." },
      },
      again = {
        { id = "h_again", text = "What else is on your heart, child?" },
        { id = "h_again2", text = "Go on. The Cathedral is in no hurry, and neither am I." },
      },
      choices = {
        { text = "What did Archbishop Faol teach?", next = "faol" },
        { text = "Does the Light ever abandon anyone?", next = "abandon" },
        { text = "Tell me about the Cathedral.", next = "cathedral" },
        { text = "Why let the Scarlet Crusade recruit downstairs?", next = "crusade" },
        { text = "I followed Crowley's road to its end, Your Grace.", next = "crusade_road", when = { thread = { id = "scarlet_path", beat = "b3_raleigh" } } },
        { text = "Your Grace, how do I become a better priest?", next = "priest", when = { class = "PRIEST" } },
        { text = "What does the Church make of shadow, in a priest?", next = "shadow", when = { class = "PRIEST", minLevel = 20 } },
        { text = "I came out of Lordaeron, Your Grace.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "Thank you, Your Grace.", next = "END" },
      },
    },
    faol = {
      lines = {
        { id = "f_default", text = "That the Light isn't owned by the strong. A farmer at his plough can carry as much of it as a king on his throne. I believed him. I look like a farmer; it helped." },
      },
      choices = {
        { text = "That's a kind teaching.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "What was he like?", next = "faol_man" },
      },
    },
    faol_man = {
      lines = { { id = "fm_default", text = "Patient with fools, impatient with cruelty, and never once too grand to kneel beside someone. I've never managed to be half of him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    abandon = {
      big = true,
      lines = {
        { id = "a_default", key = true,
          text = "I asked that when Lordaeron fell. The prince, the king, the Silver Hand. I asked it every night for a year. I won't tell you I found the answer. I found I could keep working without it." },
      },
      choices = {
        { text = "That takes faith.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Maybe there's no answer.", next = "none", fx = { trait = { skeptical = 1 } } },
      },
    },
    none = {
      lines = { { id = "n_default", text = "Maybe. Then the work is still worth doing. That was always the point." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cathedral = {
      lines = { { id = "c_default", text = "Rebuilt after the second war, brighter than before. I carried stones for it when I was younger and had a back. The stonemasons did the rest, and I still pray for every one of them." } },
      choices = {
        { text = "The stonemasons? The ones who were never paid?", next = "cathedral_masons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral_masons = {
      big = true,
      lines = { { id = "cm_default", text = "The same. Their hands built this house of the Light, and the city's purse forgot them. I've said so in the Keep. I'll say it again. It's not much, but it's what an old priest has." } },
      choices = {
        { text = "It's more than most said.", next = "BACK", fx = { affinity = 2, learn = { "defias" }, opinion = { defias = "masons_wronged" } } },
        { text = "Saying isn't doing.", next = "BACK", fx = { trait = { stern = 1 }, learn = { "defias" } } },
      },
    },
    crusade = {
      lines = { { id = "cr_default", text = "Because the doors stay open, even to people I worry about. Brother Crowley believes he fights the plague. Perhaps he does. I pray for the ones he sends west, and for him." } },
      choices = {
        { text = "And if they're doing harm?", next = "crusade_harm" },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    crusade_road = {
      big = true,
      lines = { { id = "cro_default", text = "To Southshore, I think, and a man who left them. I know what's said about the Monastery. I let Crowley keep his corner because some of the Crusade's people are good, and they come through these doors too. What did you find?" } },
      choices = {
        { text = "Innocents tortured as plagued. Raleigh saw it.", next = "crusade_road2", fx = { align = { honor = 1 } } },
        { text = "Nothing I can prove.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    crusade_road2 = {
      lines = { { id = "cr2_default", text = "Then I'll stop pretending not to know. I won't close the doors; that isn't who we are. But no one goes down those stairs again without praying with me first." } },
      choices = {
        { text = "That's something.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "It isn't enough.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    crusade_harm = {
      lines = { { id = "ch_default", text = "Then the Light will see it, and so will we, and the doors will still be open for them to come home through. That's the hardest part of keeping a church, child. Hope that outlasts reason." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    priest = {
      big = true,
      lines = { { id = "p_default", text = "Heal the people who annoy you. Bless the ones who don't thank you. Sit with the dying even when you can do nothing. The spells come with practice. That comes with choosing, every day." } },
      choices = {
        { text = "That's harder than any spell.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "And when I fail?", next = "priest_fail" },
      },
    },
    priest_fail = {
      lines = { { id = "pf_default", text = "Then you come back here, kneel, get up, and try again tomorrow. I've done it more times than any priest in this city. That's not a confession. It's a qualification." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shadow = {
      big = true,
      lines = { { id = "s_default", text = "That it's a blade with no handle. Some of our brothers and sisters learn to hold it, and do good with it. I've never learned. I'd ask you to watch your hands, and come and see me if they start to feel cold." } },
      choices = {
        { text = "I'll keep to the Light.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "Shadow is a tool. I'll use what works.", next = "BACK", fx = { affinity = -1, align = { light = -2 }, trait = { stern = 1 } } },
        { text = "Has a priest ever gone too far into it?", next = "shadow_far" },
      },
    },
    shadow_far = {
      big = true,
      lines = { { id = "sf_default", key = true, text = "Once, that I know of. A bishop, after the First War. She went looking for what the orcs' death-priests knew, so that we could fight it, and she kept looking long after the fighting stopped. She preached that we need the dark as much as the light. It ended badly for her, and the magi of Dalaran took every book she wrote. I've never read a page of them. I've never wanted to." } },
      choices = {
        { text = "Was she wrong?", next = "shadow_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_wrong = {
      lines = { { id = "sw_default", text = "About the need? Perhaps not. About how much of herself to pay for it, yes. That's all I'd ask of you. Count what it costs, every time. And if you ever stop counting, come and see me." } },
      choices = {
        { text = "I'll keep count.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Some costs are worth paying.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    lordaeron = {
      lines = { { id = "lo_default", text = "Then you've seen what I only heard about, and heard about every night for a year. You're welcome here. You always will be. Light a candle for someone, if you'd like. Many do." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, trait = { pious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A student of Archbishop Faol who never stopped being one. The robes came later. The look of a farmer never left.", next = "faol" } },
    advice = { { id = "tp_ad", text = "Pray when you're grateful, not only when you're frightened. The Light enjoys being thanked, I think. Most of us do." } },
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
        { id = "h_bit", when = { metBefore = true }, text = "One of the kittens bit me today. I still love him. You should love him too." },
      },
      choices = {
        { text = "Let me see her.", next = "BUSINESS" },
        { text = "Sorry, Timmy.", next = "END" },
      },
    },
  },

  topics = { _none = { { id = "t_none", text = "I don't know. Do you want a kitten, though?" } } },
}

-- The Cathedral's priest trainers and the Scarlet Crusade's emissary downstairs.
-- Sources: High Priestess Laurena, Brother Joshua, Brother Benjamin, Brother Crowley and
-- Desperate Prayer (Cathedral Square) on warcraft.wiki.gg; bibles/benedictus.md.

-- High Priestess Laurena: the Cathedral's senior priest trainer; promising priests are sent to her.
P:NPC {
  key = "laurena", id = TODO_NPC("High Priestess Laurena"), name = "High Priestess Laurena", title = "Priest Trainer",
  bible = "bibles/benedictus.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "steady", "sharp" }, values = { "pious", "dutiful" },
  spiritSensitive = true,
  notices = { "light", "affliction", "form" },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Come. Stand where the light from the windows falls. I like to see who I'm teaching." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "Do not turn your back on the Light, friend. It notices who keeps facing it." },
  },

  notice = {
    { id = "n_shadow", cat = "form", place = "before", when = { form = "shadow" },
      text = "Out of that shape, please. You can't call on the Light while you wear it, and I can't teach someone who can't hear the lesson." },
    { id = "n_hurt", cat = "affliction", place = "before", when = { durability = { max = 0.25 } },
      text = "You've been bleeding into your armour. Stand still. There. The Light first, then the lesson." },
    { id = "n_light", cat = "light", when = { class = "PRIEST", alignment = { axis = "light", min = 40 } },
      text = "Your prayers are getting quieter. That's good. Loud prayers are usually for the person praying." },
  },

  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "And there goes the Light. Step back out when you want to learn something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Laurena. I teach the priests the Abbey and Goldshire send me, once they've shown they can be trusted with more. Some of them can." },
        { id = "h_prayer", tags = { "news" }, when = { questActive = TODO_QUEST("Desperate Prayer") },
          text = "Josetta sent you. Good. She sends me very few, and she's never wrong. There are lessons every servant of the Light must learn, and this is the first of the hard ones." },
        { id = "h_prayer_done", when = { questDone = TODO_QUEST("Desperate Prayer") },
          text = "You've carried that prayer a while now. Have you needed it yet? You will. Be glad it's there." },
        { id = "h_young", when = { class = "PRIEST", maxLevel = 12 },
          text = "Young, for the Cathedral. That's no fault. It only means the hard lessons are still ahead. Most of them are not in books." },
      },
      again = { { id = "h_again", text = "What else? Quietly; there's a service soon." }, { id = "h_again2", text = "Ask. I'll answer what I can, and tell you when I can't." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What lessons aren't in books?", next = "lessons", when = { class = "PRIEST" } },
        { text = "What does a high priestess do?", next = "duty" },
        { text = "Josetta speaks well of you.", next = "josetta", when = { heardLine = "josetta.h_prayer" } },
        { text = "The Abbey raised me. I'm one of theirs.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "Thank you, High Priestess.", next = "END" },
      },
    },
    lessons = {
      big = true,
      lines = { { id = "l_default", text = "That you can't save everyone. That you'll be thanked least by the people you helped most. That the Light doesn't make you good; it shows everyone whether you are." } },
      choices = {
        { text = "That's frightening.", next = "lessons_fear", fx = { trait = { cautious = 1 } } },
        { text = "I'm ready for that.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { brave = 1 } } },
      },
    },
    lessons_fear = {
      lines = { { id = "lf_default", text = "Good. A priest who isn't frightened by it hasn't understood it. Be frightened, and come back anyway. That's all courage is, in this house." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    duty = {
      lines = { { id = "d_default", text = "Teach, mostly. Bless the services when His Grace is at the Keep. Sit up with the city's sick when they come to the doors at night. They always come at night." } },
      choices = {
        { text = "Why at night?", next = "duty_night" },
        { text = "Something else.", next = "BACK" },
      },
    },
    duty_night = {
      lines = { { id = "dn_default", text = "Pride, by day. Fear, by night. Fear is the more honest of the two. It knocks louder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    josetta = {
      lines = { { id = "j_default", text = "Josetta could have stood where I stand. She chose Goldshire. I've never decided whether she was wise or afraid. Perhaps she hasn't either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    novice = {
      lines = { { id = "n_default", text = "Then you were taught by people who'd sooner scrub a floor than preach about it. Keep that. The Cathedral has marble. Marble makes some priests forget floors." } },
      choices = { { text = "I won't forget.", next = "BACK", fx = { affinity = 3, align = { light = 1, order = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A priest who stayed when others went home. That's how most high priestesses happen. Stubbornness, mistaken for calling." } },
    advice = { { id = "tp_ad", text = "Heal first and ask questions after. The questions will still be there. The wounded may not be." } },
    northshire_abbey = { { id = "tp_abbey", text = "Where the Light learns your name. The Cathedral only learns what you've done with it." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They heal no one. I've never trusted a faith that only burns." } },
    _none = { { id = "tp_none", text = "I don't know. Ask the library, and if the library doesn't know, ask the Light. It's better at waiting for an answer than I am." } },
  },
}

-- Brother Joshua: priest trainer by the altar.
P:NPC {
  key = "joshua", id = TODO_NPC("Brother Joshua"), name = "Brother Joshua", title = "Priest Trainer",
  bible = "bibles/benedictus.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "gentle" }, values = { "pious", "patient" },
  spiritSensitive = true,
  notices = { "light", "form" },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Kneel if you like. The altar doesn't mind company." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "The Light is patient with everyone, friend. Even me." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadowform, at the altar. The altar doesn't mind. I'll pray for you twice, though. Once for each road you're walking." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brother Joshua. I teach by the altar, because people pay attention near it. They don't always notice they're doing it." },
        { id = "h_dawn", when = { timeOfDay = "dawn" }, text = "First light through the east window. I've watched it every morning for years. It's never once been the same." },
      },
      again = { { id = "h_again", text = "Something else?" } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why teach by the altar?", next = "altar" },
        { text = "How do you pray, Brother?", next = "pray" },
        { text = "Goodbye, Brother.", next = "END" },
      },
    },
    altar = {
      lines = { { id = "a_default", text = "Because it reminds the students, and me, that none of this is ours. We only borrow it, and we're expected to give it back better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "p_default", text = "Badly, and often. Mostly I say thank you and then I listen. The listening is the part people skip." } },
      choices = { { text = "Something else.", next = "BACK", fx = { align = { light = 1 }, trait = { pious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A brother of the Cathedral, and nothing else I'd want to be." } },
    advice = { { id = "tp_ad", text = "When you heal someone, look at their face, not the wound. The wound is the easy part." } },
    _none = { { id = "tp_none", text = "I don't know. I'll pray on it, if you'd like." } },
  },
}

-- Brother Benjamin: priest trainer who paces the eastern hall.
P:NPC {
  key = "benjamin", id = TODO_NPC("Brother Benjamin"), name = "Brother Benjamin", title = "Priest Trainer",
  bible = "bibles/benedictus.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "restless" }, values = { "pious", "curious" },
  spiritSensitive = true,
  notices = { "light", "form" },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Walk with me. I think better moving, and so will you." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "Don't turn your back on the Light, friend. It walks faster than you'd think." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Oh, now that's interesting. Does it feel cold, inside it? Joshua won't ask. I will. Walk with me and tell me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brother Benjamin. I teach on my feet, up and down this hall. Brother Joshua says I'll wear a groove in the floor. He's probably right." },
      },
      again = { { id = "h_again", text = "Keep walking. What else?" } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why pace?", next = "pace" },
        { text = "What's the hardest thing to teach?", next = "hardest" },
        { text = "Goodbye, Brother.", next = "END" },
      },
    },
    pace = {
      lines = { { id = "p_default", text = "Sitting still makes me think about myself. Walking makes me think about everyone else. One of those is the job." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hardest = {
      lines = { { id = "h2_default", text = "Rest. Young priests heal until they fall over and call it devotion. It's vanity. The Light doesn't need you exhausted." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A brother of the Cathedral who can't sit still. That's all; the rest is pacing." } },
    advice = { { id = "tp_ad", text = "Sleep. Eat. Then pray. In that order, whatever the abbots say." } },
    _none = { { id = "tp_none", text = "Couldn't say. Walk with me and we'll think about it." } },
  },
}

-- Brother Crowley: the Scarlet Crusade's emissary in the Cathedral's lower levels.
-- Unreliable: he believes in the Crusade; he never says what it has become.
P:NPC {
  key = "crowley", id = TODO_NPC("Brother Crowley"), name = "Brother Crowley", title = "Scarlet Crusade Emissary",
  bible = "bibles/benedictus.md", role = "priest", tier = "quest",
  communities = { "stormwind" }, temper = { "zealous", "sharp" }, values = { "devout", "proud" },
  notices = { "light", "race", "form" },

  greetings = {
    { id = "g_default", text = "You've found your way downstairs. Good. The Crusade needs people who don't mind a few steps for the Light." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadow, on a priest, in the Cathedral of Light? In Lordaeron the Crusade would have some very hard questions for you. Here I'll only ask you to take it off." },
    { id = "n_paladin", cat = "light", when = { class = { "PALADIN", "PRIEST" } },
      text = "A servant of the Light. You'll have heard of the Crusade, then. Most of it lies, and the rest is the plague's own work." },
    { id = "n_elf", cat = "race", when = { race = { "NightElf", "Skyborne" } },
      text = "An elf, in Stormwind's catacombs. The Crusade asks only that you hate the dead as much as we do." },
  },

  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "What is that? Take it off. Now." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Brother Crowley, emissary of the Scarlet Crusade. The dead walk in Lordaeron, and the Crusade stands against them while Stormwind counts its coins. I send the brave to Brother Anton, in Desolace." },
        { id = "h_anton", tags = { "news" }, when = { questActive = TODO_QUEST("Brother Anton") },
          text = "Brother Anton is waiting at Nijel's Point. Tell him I sent you, and tell him the Cathedral still lets me in. He worries." },
        { id = "h_back", when = { questDone = TODO_QUEST("Brother Anton") },
          text = "Anton writes that you went into the Valley of Bones. Good. Come back to me when you're ready for Lordaeron itself." },
        { id = "h_monastery", tags = { "news" }, when = { questDone = TODO_QUEST("In the Name of the Light") },
          text = "You went to the Monastery and came back with the Crusade's blood on you. I know who sent you. Raleigh always did love a confession." },
      },
      again = { { id = "h_again", text = "What else? The dead don't wait for questions." } },
      choices = {
        { text = "What is the Scarlet Crusade?", next = "crusade" },
        { text = "I've heard they burn villages.", next = "burn" },
        { text = "Why recruit in the Cathedral?", next = "why" },
        { text = "Tyrosus of the Argent Dawn told me why he left.", next = "tyrosus", when = { heardLine = "tyrosus.l_default" } },
        { text = "Raleigh told me what the Monastery does.", next = "raleigh", when = { thread = { id = "scarlet_path", beat = "b3_raleigh" } } },
        { text = "I'll go to Brother Anton.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    crusade = {
      big = true,
      lines = { { id = "c_default", text = "What's left of the Silver Hand that still remembers what it swore. We hold the line in Lordaeron, where the plague began. We purify what we must. Someone has to." },
        },
      choices = {
        { text = "Purify how?", next = "burn" },
        { text = "Someone does have to.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    burn = {
      big = true,
      lines = { { id = "b_default", key = true, text = "Lies, spread by the cowards and the Forsaken. When a village is sick with the plague, you cleanse it. Everyone who's watched the dead rise knows what that means. Those who haven't, judge." } },
      choices = {
        { text = "You're talking about burning people.", next = "burn_people", fx = { align = { light = 2 } } },
        { text = "I've seen the plague. I understand.", next = "BACK", fx = { affinity = 2, align = { light = -1, order = 1 } } },
      },
    },
    burn_people = {
      lines = { { id = "bp_default", text = "I'm talking about stopping it before it reaches Stormwind. If you'd rather pray over a village and leave it to rise, the Cathedral's upstairs. It's very beautiful. It's never seen a ghoul." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = -1 } } },
    },
    raleigh = {
      big = true,
      lines = { { id = "ra_default", text = "Raleigh couldn't stomach the work, so now he calls it a crime. Every army has its deserters with stories. Ours just pray louder." } },
      choices = {
        { text = "He said innocents were tortured.", next = "raleigh_innocent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raleigh_innocent = {
      lines = { { id = "ri_default", text = "Innocent. Nobody in Lordaeron is innocent of the plague until they're proven clean. If that offends you, the stairs are behind you." } },
      choices = {
        { text = "The Light doesn't work that way.", next = "BACK", fx = { affinity = -2, align = { light = 2 } } },
        { text = "Something else.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because this is where the faithful come. And because the Archbishop is a good man who lets the doors stay open. I'm grateful. I'm also using it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tyrosus = {
      lines = { { id = "t_default", text = "Tyrosus left because the work got hard. The Dawn asks politely and hopes. The Crusade doesn't hope. It acts. Tell him that, next time." } },
      choices = {
        { text = "He'd say you've lost your way.", next = "BACK", fx = { affinity = -2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A priest who saw what the plague does and stopped pretending prayer alone would hold it back." } },
    advice = { { id = "tp_ad", text = "If someone you love is bitten, don't wait to be sure. Waiting is how Lordaeron fell." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "The last true servants of the Light in the north. Whatever you've heard, that's the heart of it." } },
    raleigh = { { id = "tp_raleigh", text = "A deserter in a Southshore inn, telling tales to anyone who'll buy him a drink.", next = "raleigh" } },
    scarlet_monastery = { { id = "tp_monastery", text = "Our stronghold in Tirisfal. If you're worthy, you'll see it. If you're not, you'll hear lies about it." } },
    argent_dawn = { { id = "tp_dawn", text = "Well-meaning. Soft. They'll make peace with the Forsaken and be eaten for it." } },
    _none = { { id = "tp_none", text = "Does it touch the plague? No? Then ask upstairs." } },
  },
}
