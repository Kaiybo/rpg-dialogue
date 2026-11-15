-- Highlord Bolvar Fordragon, Stormwind Keep. Voice: bibles/bolvar.md
-- Regent for a ten-year-old king, with a missing king to find and a kingdom to hold.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "bolvar", id = TODO_NPC("Highlord Bolvar Fordragon"), name = "Highlord Bolvar Fordragon",
  bible = "bibles/bolvar.md", role = "noble", tier = "major",
  communities = { "stormwind" }, temper = { "steady" }, values = { "lawful", "brave", "honest" },
  spiritSensitive = true,
  notices = { "reputation", "paladin" },
  impression = {
    first = "Highlord Bolvar Fordragon holds the kingdom for a boy and an absent king, and he looks tired in the way only honest men get tired. He asked me to speak plainly, and he meant it.",
    third = "{name} stood before Highlord Bolvar Fordragon, Regent of Stormwind, who keeps the throne for a king who never came home.",
  },

  greetings = {
    { id = "g_court", text = "Speak plainly. The court has enough of the other kind." },
    { id = "g_hero", when = { townStanding = { town = "stormwind", min = 55 } }, text = "Ah. I've read your name in more reports than I can count. Good reports, mostly." },
    { id = "g_distrust", when = { townStanding = { town = "stormwind", max = -20 } }, text = "The Watch has spoken of you. Be brief, and be careful." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", minLevel = 20 },
      text = "A paladin of the Light in my hall. Uther would have liked to see more of you. So would I." },
    { id = "n_hero", cat = "reputation", place = "before", when = { minLevel = 50 },
      text = "Veterans of your kind are rare. Rarer every year. Stormwind is grateful, whether or not it remembers to say so." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bolvar Fordragon. I keep the kingdom for King Anduin until his father comes home, or until he's grown. Whichever the Light allows first." },
        { id = "h_new", when = { maxLevel = 15 },
          text = "You're young for this hall, and that's good, because the young still believe the kingdom's worth defending. Don't lose that in Westfall." },
        { id = "h_westfall", when = { thread = { id = "westfall_left", beat = "b3_danuvin" } },
          text = "You've been to Sentinel Hill. Stoutmantle is a better man than this court deserves. Tell him I said so, if he'll hear it from me." },
        { id = "h_varian", when = { minLevel = 30 },
          text = "The king left for Theramore and never arrived. Each morning I look at that empty seat and tell the boy it's only a while longer." },
        { id = "h_masquerade", tags = { "news" }, when = { questDone = TODO_QUEST("The Great Masquerade") },
          text = "I trusted her counsel for years. Every word of it. I'll be reading old decrees for months, looking for her hand in them." },
        { id = "h_solomon", tags = { "news" }, when = { questRecent = { TODO_QUEST("The True Masters"), days = 5 } },
          text = "Solomon's evidence isn't enough to march an army on, and too much to ignore. So I'm sending you. Lakeshire deserves an army; it gets my best instead." },
        { id = "h_light", when = { alignment = { axis = "light", min = 50 } },
          text = "There's something steady in you. The Light, or plain decency; on a good day they look the same." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Your High Order sought out the Kirin Tor, and through them, us. Stormwind keeps its friends. I hope your people find us worth the journey." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, it's you. Sit, if the guards will let you, because I'd rather hear how the roads really are from someone I trust than read it in a report." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "State your business. I've heard enough about you from the Watch to want this conversation short." },
      },
      again = {
        { id = "h_again", text = "What else? Briefly; the council sits at noon." },
        { id = "h_again2", text = "Go on. I have a moment, for once." },
      },
      choices = {
        { text = "What of Westfall?", next = "westfall" },
        { text = "What do you make of Lady Prestor?", next = "prestor" },
        { text = "Does the Church have the crown's ear?", next = "church", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Stormwind took my family in, after Lordaeron.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Any word of King Varian?", next = "varian" },
        { text = "How do you bear it?", next = "bear" },
        { text = "I'll take my leave, Highlord.", next = "END" },
      },
    },
    westfall = {
      big = true,
      lines = {
        { id = "t_westfall", key = true,
          text = "I know what they say out there. The kingdom is stretched thinner than any of us would like, and my council urges patience. I mislike it." },
      },
      choices = {
        { text = "Then send them help.", next = "help", fx = { opinion = { westfall = "abandoned" }, align = { honor = 1 } } },
        { text = "Patience is wise.", next = "BACK", fx = { opinion = { westfall = "patience" }, affinity = 1, align = { order = 1 } } },
      },
    },
    help = {
      lines = {
        { id = "hp_default", text = "I can't empty the city's garrison into the fields on a feeling. I need proof of who leads them, and where. Bring me that, and I'll have something to argue with." },
      },
      choices = {
        { text = "I'll find it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Proof won't feed Westfall.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    varian = {
      lines = {
        { id = "v_default", text = "None I can share. Lady Prestor advised that the crown pass to Anduin, to keep order, and it has kept order, but it hasn't brought his father home." },
      },
      choices = { { text = "I hope he returns.", next = "BACK", fx = { affinity = 1 } } },
    },
    bear = {
      big = true,
      lines = {
        { id = "b_default", text = "I don't act on suspicion, and I don't break faith with the people who serve. Some days that's all a regent has. It has to be enough." },
      },
      choices = {
        { text = "It's more than most have.", next = "BACK", fx = { affinity = 2, align = { order = 1, light = 1 } } },
        { text = "Faith alone won't stop a knife in the dark, my lord.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Sometimes suspicion is enough.", next = "suspicion", fx = { trait = { skeptical = 1 } } },
        { text = "You can tell me what it really costs you, Highlord.", tag = "Persuade", next = "bear_true",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { townStanding = { town = "stormwind", min = 55 } } } } },
          fail = { next = "bear_closed", fx = { affinity = -1 } } },
      },
    },
    bear_true = {
      big = true,
      lines = {
        { id = "bt_default", text = "Sleep, mostly. I sit up with the boy until he drops off, and then I sit up with the reports, and some nights I put my sword on the table just to remember I used to know what to do with my hands." },
        { id = "bt_patience", text = "And patience. My council tells me patience is strength, and I've said it to the court so often it sounds like my own voice, though some nights I wonder whether it's only patience after all." },
        { id = "bt_priest", when = { class = "PRIEST" },
          text = "You asked as a priest would, so I'll answer as a man would at confession: I pray every night that I'm keeping the kingdom and not just keeping the chair warm, and I don't always hear an answer." },
      },
      choices = {
        { text = "You're keeping more than a chair, my lord.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then trust your own voice more than your council's.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Thank you for telling me.", next = "BACK" },
      },
    },
    bear_closed = {
      lines = {
        { id = "bc_default", text = "What it costs me is my own affair, and I'll thank you not to make a confessor of yourself in the king's hall. The kingdom is what matters here, not the man holding it." },
        { id = "bc_default2", text = "I appreciate the concern, I'm sure, but a regent who shares his doubts with every visitor soon has a court full of them. Ask me about the kingdom instead." },
      },
      choices = {
        { text = "Of course, Highlord.", next = "BACK" },
        { text = "Then I'll ask about the kingdom.", next = "BACK" },
      },
    },
    prestor = {
      lines = { { id = "pr_default", text = "Her counsel has kept this city steady through a hard few years, and she's sharper than half the court together. Some find her cold; I find her useful, and a regent needs useful more than warm." } },
      choices = {
        { text = "Useful to whom?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    church = {
      big = true,
      lines = { { id = "ch_default", text = "His Grace has my ear whenever he wants it, and the Cathedral's doors are the one thing in this city nobody argues about. Pray for the king, both of them, if you would." } },
      choices = {
        { text = "I pray for them every day.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Prayers won't bring a king home, my lord.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "And for the people outside the walls?", next = "church_outside" },
      },
    },
    church_outside = {
      lines = { { id = "co_default", text = "Especially for them. They need it more, and they get less of everything else. Tell the Archbishop I said so; he'll pretend to be surprised." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    refugee = {
      lines = { { id = "rf_default", text = "Then you know what it is to have a home taken and another one offered. I hope Stormwind has been a good one, and if it hasn't, tell me, because I'd rather hear it from you than from a riot." } },
      choices = { { text = "It has, Highlord.", next = "BACK", fx = { affinity = 2, standing = { stormwind = 1 } } } },
    },
    suspicion = {
      lines = { { id = "s_default", text = "Then show me. I'm not a stubborn man but a careful one, and the difference matters, in this chair." } },
      choices = { { text = "Understood.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every report in the kingdom crosses this desk sooner or later, so I know a little of most things. Ask, and I'll tell you what a regent may." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you I'll spare the council a few more minutes. Ask me about any of this, and I'll answer as plainly as I'm able." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "My officers can answer most questions better than I can. If it must be me, keep to these." },
    },
    defias = { { id = "tp_defias", text = "Thieves with a grievance and better organization than I'd like. Westfall bleeds for it." } },
    westfall = { { id = "tp_westfall", text = "Gryan Stoutmantle holds Westfall with farmers and pitchforks, and he does it without a single soldier from this city. I'm not proud of that." } },
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian Rall's test. Pass it, and you'll have earned the right to call yourself one of us." } },
    _none = { { id = "tp_none", text = "Bring that to one of my officers. I have a kingdom on this desk." } },
  },
}
