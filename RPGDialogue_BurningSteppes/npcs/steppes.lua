-- Out in the Steppes: Cyrus Therepentous, a black dragonspawn in his cave at Slither Rock. Voice: bibles/burningsteppes.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "cyrus", id = TODO_NPC("Cyrus Therepentous"), name = "Cyrus Therepentous",
  bible = "bibles/burningsteppes.md", role = "questgiver", tier = "quest",
  communities = { "slither_rock" }, temper = { "sharp", "proud" }, values = { "proud", "greedy" },
  notices = { "class", "deed" },

  impression = {
    first = "Cyrus Therepentous wondered aloud whether to eat me, and I'm not certain he was joking. He speaks of the Flight with a reverence he gives to nothing else.",
    third = "{name} met Cyrus Therepentous, a scornful dragonspawn of the black Flight who lairs at Slither Rock.",
  },

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
    op_blackflight = {
      lines = {
        { id = "opb_default", text = "Fear them? Oh, mortal, I would never tell you what to feel, only that it would be wise. But I'm curious what a creature like you makes of the true lords of these mountains." },
      },
      choices = {
        { text = "Your masters are tyrants, and they'll fall like any other.", next = "op_bf_hate", fx = { affinity = -1, align = { honor = 1 }, opinion = { black_dragonflight = "hate" } } },
        { text = "Power is its own right. I respect it.", next = "op_bf_respect", fx = { affinity = 1, align = { honor = -1 }, opinion = { black_dragonflight = "respect" } } },
        { text = "The red flight was chained at Grim Batol. No dragon is untouchable.", next = "op_bf_hate", fx = { opinion = { black_dragonflight = "hate", dragons = "pity" } }, when = { race = "Orc" } },
        { text = "I'll keep my thoughts out of your hearing.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    op_bf_hate = {
      lines = {
        { id = "opbh_default", text = "How brave, and how short-lived. Do give my regards to the marshal at the Vigil when you run back to him, and tell him the mountain heard you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_bf_respect = {
      lines = {
        { id = "opbr_default", text = "Now that is an answer worth the walk. Remember it when you are next in Morgan's Vigil, and see how much respect they show you for it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Against me, quite useless, but against my enemies in this land, perhaps not. The Flight has use for a strong arm that does what it is told and asks for payment afterwards, if it lives to ask." } },
      choices = {
        { text = "I'm no dragon's sword. I'll fight my own battles.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Point me at your enemies. Payment afterwards suits me fine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I will speak of something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "We hunt, little one, as you never could, with the whole sky for a blind and fire for a bow. Your hunters track a stag for a day, while I have tracked a single enemy for a hundred years, and I am patient enough to wait a hundred more." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "We hunt, little one, as you never could, with the whole sky for a blind and fire for a bow. Your {pet} has the good sense to be afraid of me, and you would do well to learn from it." },
      },
      choices = {
        { text = "Patience is a hunter's first virtue. I respect that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A hunter who waits a hundred years has already lost.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I will speak of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Humility, first, though few of you survive the lesson. Your spells are borrowed light, mortal, and fire like mine was old before your first wizard drew breath, so study it if you must, but from a distance." } },
      choices = {
        { text = "Then I'll study from a distance, great one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll master your fire someday, dragon. Mark that.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Bold, and foolish, which in mortals is the same thing. A dragon's hoard is a lifetime of tribute and a thief's is a week of luck, and when we meet over the same treasure, only one of us walks away." } },
      choices = {
        { text = "Then I'll rob smaller prey. No shame in that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd face you openly, dragon, not as a thief.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "On to other things.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That they are dreamers who mistake sleep for wisdom, while the true heirs of this world wake and act. Your Circle bows to them, I know, and bowing is the only thing mortals do well, so perhaps you will be useful after all." } },
      choices = {
        { text = "The green dragons guard the Dream well. I'll not hear them mocked.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Perhaps they sleep too much. I'll keep my own counsel, Cyrus.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because the earth was my Flight's long before your people learned to speak to it, and it remembers whom it served first. Pray to your spirits as much as you like, little one, but when the mountain shakes, ask yourself whose breath is moving it." } },
      choices = {
        { text = "The elements serve no master, dragon. Not even yours.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then perhaps your Flight and I could come to terms.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You beg favors from fire and stone, little one, and you think they answer out of friendship, which amuses me more than you can know." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A thief. I can smell gold on your fingers, little one, and none of it was given to you freely." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Your kind toy with sparks and call it mastery, while my flight was born in the deep fire of the world. Still, you interest me, and very little does." },
        { id = "h_default", key = true,
          text = "I am Cyrus Therepentous, of the Flight, and I am deciding whether to devour you whole or let you live to be useful. Choose your next words with care." },
        { id = "h_proof", when = { questActive = TODO_QUEST("A Taste of Flame") },
          text = "You seek the Flight's favour, then prove yourself worthy of it: bring me the molt, or face my minion and live. Either will do, and I suspect neither will be easy for you." },
        { id = "h_fire", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Taste of Flame"), days = 7 } },
          text = "The mountain's fire still burns in me, and it is sweeter than anything you could imagine. Take your prize and leave my sight before I remember that I am hungry." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You stand as though steel could save you from me, little one, which is either courage or stupidity, and among your kind I have rarely seen the difference." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. How charming that you think yourself the predator here." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Your kind speaks of a great Dream and the green ones who keep it, mortal, and the Flight has opinions about those green ones, which you have not earned the right to hear." },
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
        { text = "I bargain with demons. A dragon doesn't frighten me.", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "What would a dragon teach a mage?", next = "xmage", when = { class = "MAGE" } },
        { text = "Dragons hoard and I take. We're not so different.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Steel would serve me well enough against you, dragon.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do dragons hunt, Cyrus, or only hoard?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What does the Flight think of the green dragons, Cyrus?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why does my bond with the elements amuse you, dragon?", next = "xhsham", when = { class = "SHAMAN" } },
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
        { text = "And what of your masters? Should I fear them too?", next = "op_blackflight" },
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
        { text = "Charming. Moving on.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'm not afraid of you.", next = "BACK", fx = { trait = { brave = 1 }, affinity = -1 } },
      },
    },
    molt = {
      lines = { { id = "m_default", text = "Kalaran's molt, given to you for your work in the Searing Gorge, yes, I know all about it. Show it to me, imbecile, and we will see whether you are entirely useless." } },
      choices = { { text = "Here it is.", next = "BACK", fx = { affinity = 1 } } },
    },
    light = {
      lines = { { id = "l_default", text = "Then the Light is a fool, and so are you, which is at least consistent. Walk carefully, little one; the dark is very large, and it has been patient for a very long time." } },
      choices = {
        { text = "So has the Light.", next = "BACK", fx = { align = { light = 2 }, affinity = -1 } },
        { text = "You might be right. The dark does seem to keep winning.", next = "BACK", fx = { align = { light = -2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_lock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Demons. Little things from the Nether that you bind with circles and call yourself a master. I am older than your circles, mortal, so do not mistake my patience for your power." },
      },
      choices = {
        { text = "Every power can be bound, dragon.", next = "BACK", fx = { align = { light = -1 }, trait = { brave = 1 } } },
        { text = "I meant no insult. What do you want?", next = "want" },
        { text = "Then I'll go no further down this road.", next = "BACK", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am of the Flight, and that is all the history a mortal needs.", next = "who" } },
    advice = { { id = "tp_ad", text = "Never wake a sleeping dragon, mortal. And never assume that it was sleeping." } },
    black_dragonflight = { { id = "tp_dragons", text = "We were masters of this world before it had a name, and we will be masters of it after.", next = "who" } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The Spire belongs to the Flight, mortal, and the orcs and dwarves who squabble beneath it are guests who have forgotten their manners. They will be reminded." } },
    onyxia = { { id = "tp_onyxia", text = "The Lady in Dustwallow is of the Flight, and she is far beyond your concern, mortal. Speak her name again and I may decide you're food." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons and their fire lord dwell beneath the mountain, and the Flight tolerates them for now. Their time will come." } },
    second_war = { { id = "tp_second_war", text = "The Flight fought beside the orcs in your Second War, mortal, and the orcs were fools to think it was an alliance. We used them, as we use everyone." } },
    _none = { { id = "tp_none", text = "You bore me with your questions. Go and ask a goblin." } },
  },
}
