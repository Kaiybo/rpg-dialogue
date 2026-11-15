-- Out in the Steppes: Cyrus Therepentous, a black dragonspawn in his cave at Slither Rock. Voice: bibles/burningsteppes.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "cyrus", id = TODO_NPC("Cyrus Therepentous"), name = "Cyrus Therepentous",
  bible = "bibles/burningsteppes.md", role = "questgiver", tier = "quest",
  communities = { "slither_rock" }, temper = { "sharp", "proud" }, values = { "proud", "greedy" },
  notices = { "class", "deed" },

  greetings = {
    { id = "g_default", text = "Only a fool disturbs me in my own lair. Are you a fool, mortal, or merely lost?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, still unburned and still impertinent. I'm almost impressed." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You reek of the Light, mortal, that thin little candle your kind waves at the dark. It will not warm you in this cave." },
    { id = "n_molt", cat = "deed", when = { questDone = TODO_QUEST("Divine Retribution") },
      text = "The Flight knows what you did in the Searing Gorge, little one. We know a great deal more than you would like." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Cyrus Therepentous, of the Flight, and I am deciding whether to devour you whole or let you live to be useful. Choose your next words with care." },
        { id = "h_proof", when = { questActive = TODO_QUEST("A Taste of Flame") },
          text = "You seek the Flight's favour, then prove yourself worthy of it: bring me the molt, or face my minion and live. Either will do, and I suspect neither will be easy for you." },
        { id = "h_fire", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Taste of Flame"), days = 7 } },
          text = "The mountain's fire still burns in me, and it is sweeter than anything you could imagine. Take your prize and leave my sight before I remember that I am hungry." },
      },
      again = {
        { id = "h_again", text = "You are still here, mortal, and still talking. Go on, then; amuse me." },
        { id = "h_again2", text = "Speak. My patience is long, but my appetite is longer." },
      },
      choices = {
        { text = "What are you?", next = "who" },
        { text = "What do you want from me?", next = "want" },
        { text = "Why not just eat me?", next = "devour" },
        { text = "I have a molt from Kalaran Windblade.", next = "molt", when = { questDone = TODO_QUEST("Divine Retribution") } },
        { text = "The Light isn't afraid of you, dragon.", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'll be going.", next = "END" },
      },
    },

    who = {
      lines = { { id = "w_default", fx = { learn = { "black_dragonflight" } },
        text = "A servant of the black dragonflight, the true power in these mountains, though the orcs below like to think otherwise. The Flight was old when your ancestors were still learning to hold a spear." } },
      choices = {
        { text = "Who leads the Flight?", next = "who_leader" },
        { text = "The orcs serve your Flight?", next = "who_orcs" },
      },
    },
    who_leader = {
      lines = { { id = "wl_default", text = "You would like a name to carry back to your little marshal, wouldn't you? I will give you nothing of the sort, and you will thank me for the restraint someday." } },
      choices = {
        { text = "It was worth asking.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_orcs = {
      lines = { { id = "wo_default", fx = { learn = { "blackrock" } },
        text = "The Blackrock carry what they're given and attack whatever they're pointed at, which is what they're for. They think they serve their own warchief, and we let them think it." } },
      choices = {
        { text = "You're telling me a great deal.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    want = {
      lines = { { id = "wa_default", text = "Fire. The searing heat at the mountain's heart, the flame that Ragnaros's children carry in their bodies, poured across my scales. I crave it as you crave water." } },
      choices = {
        { text = "Where would I find it?", next = "want_where" },
        { text = "That's a strange hunger.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    want_where = {
      lines = { { id = "ww_default", fx = { learn = { "blackrock_depths" } },
        text = "In the Depths of Blackrock, where a giant made of pure flame stands guard over the Dark Irons. Kill it, catch its inner fire in the molt before it gutters out, and bring it to me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    devour = {
      lines = { { id = "d_default", text = "Because a dead mortal fetches me nothing, and a living one might fetch me a great deal. Do not mistake my patience for affection, little one." } },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'm not afraid of you.", next = "BACK", fx = { trait = { brave = 1 }, affinity = -1 } },
      },
    },
    molt = {
      lines = { { id = "m_default", text = "Kalaran's molt, given to you for your work in the Searing Gorge, yes, I know all about it. Show it to me, imbecile, and we will see whether you are entirely useless." } },
      choices = { { text = "Here it is.", next = "BACK", fx = { affinity = 1 } } },
    },
    light = {
      lines = { { id = "l_default", text = "Then the Light is a fool, and so are you, which is at least consistent. Walk carefully, priest; the dark is very large, and it has been patient for a very long time." } },
      choices = {
        { text = "So has the Light.", next = "BACK", fx = { align = { light = 2 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am of the Flight, and that is all the history a mortal needs.", next = "who" } },
    advice = { { id = "tp_ad", text = "Never wake a sleeping dragon, mortal. And never assume that it was sleeping." } },
    black_dragonflight = { { id = "tp_dragons", text = "We were masters of this world before it had a name, and we will be masters of it after.", next = "who" } },
    _none = { { id = "tp_none", text = "You bore me with your questions. Go and ask a goblin." } },
  },
}
