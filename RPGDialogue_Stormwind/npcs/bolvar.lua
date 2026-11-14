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
          text = "You're young for this hall. Good. The young still believe the kingdom's worth defending. Don't lose that in Westfall." },
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
      },
      choices = {
        { text = "What of Westfall?", next = "westfall" },
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
        { text = "Patience is wise.", next = "END", fx = { opinion = { westfall = "patience" }, affinity = 1, align = { order = 1 } } },
      },
    },
    help = {
      lines = {
        { id = "hp_default", text = "I can't empty the city's garrison into the fields on a feeling. I need proof of who leads them, and where. Bring me that, and I'll have something to argue with." },
      },
      choices = {
        { text = "I'll find it.", next = "END", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Proof won't feed Westfall.", next = "END", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    varian = {
      lines = {
        { id = "v_default", text = "None I can share. Lady Prestor advised that the crown pass to Anduin, to keep order. It has kept order. It hasn't brought his father home." },
      },
      choices = { { text = "I hope he returns.", next = "END", fx = { affinity = 1 } } },
    },
    bear = {
      big = true,
      lines = {
        { id = "b_default", text = "I don't act on suspicion, and I don't break faith with the people who serve. Some days that's all a regent has. It has to be enough." },
      },
      choices = {
        { text = "It's more than most have.", next = "END", fx = { affinity = 2, align = { order = 1, light = 1 } } },
        { text = "Sometimes suspicion is enough.", next = "suspicion", fx = { trait = { skeptical = 1 } } },
      },
    },
    suspicion = {
      lines = { { id = "s_default", text = "Then show me. I'm not a stubborn man. I'm a careful one. The difference matters, in this chair." } },
      choices = { { text = "Understood.", next = "END" } },
    },
  },

  topics = {
    king_anduin = {
      { id = "ta_anduin", text = "He listens better than most grown men at this court. He'll be a good king. My task is to see he lives long enough." },
    },
    varian = {
      { id = "ta_varian", text = "I will learn what happened to him. Until then I keep his son safe and his kingdom standing. That is the oath, and I keep my oaths." },
    },
    bolvar = {
      { id = "ta_self", text = "A soldier holding a crown that isn't his. Keep it that simple and you'll understand me well enough." },
    },
    little_secret = {
      { id = "ta_ls_no", text = "A regent with loose lips is a danger to his king. Ask me something else." },
      { id = "ta_ls", when = { any = { { affinity = { min = 3 } }, { timesTalked = 4 } } }, text = "I sleep badly since King Varian was lost. The boy knows. He never says so. He simply sends up tea." },
    },
    my_trade = {
      { id = "ta_trade", text = "Regent and Supreme Commander. I keep the kingdom whole until the king is grown. Everything else is detail, and there is a great deal of detail." },
    },
    background = {
      { id = "ta_bg", text = "I've served this kingdom as a soldier all my life. Ruling it, I'm still learning. I hope to give it back before I've learned too much." },
    },
    defias = { { id = "tp_defias", text = "Thieves with a grievance and better organization than I'd like. Westfall bleeds for it." } },
    westfall = { { id = "tp_westfall", text = "Stoutmantle holds it. Barely, and without us. I'm not proud of that." } },
    tome_of_divinity = { { id = "tp_tome", text = "Duthorian Rall's test. Pass it, and you'll have earned the right to call yourself one of us." } },
    _none = { { id = "tp_none", text = "Bring that to one of my officers. I have a kingdom on this desk." } },
  },
}
