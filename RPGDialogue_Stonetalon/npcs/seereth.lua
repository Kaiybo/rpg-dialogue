-- Seereth Stonebreak, orc shaman camped by the Greatwood Vale, who hears Stonetalon's angry spirits (0.72.0). Voice: bibles/seereth.md
-- Classic: The Spirits of Stonetalon (turn-in), Goblin Invaders, Shredding Machines, The Elder Crone.
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "seereth", id = TODO_NPC("Seereth Stonebreak"), name = "Seereth Stonebreak",
  bible = "bibles/seereth.md", role = "questgiver", tier = "quest",
  communities = { "stonetalon_border" }, temper = { "intense", "earnest" }, values = { "spirits", "duty" },
  notices = { "class", "craft" },
  impression = {
    first = "Seereth Stonebreak hears the spirits of Stonetalon screaming as the goblins cut, and she has not slept well since. She is young for a shaman, and she knows it, and she has asked for help without shame.",
    third = "{name} met Seereth Stonebreak, an orc shaman on the Stonetalon border who hears the mountains' spirits raging at the Venture Company.",
  },

  greetings = {
    { id = "g_hello", text = "Listen, do you hear them? No, I suppose you don't, and I envy you." },
    { id = "g_loggers", when = { questActive = TODO_QUEST("Goblin Invaders") }, text = "The Windshear Crag, beyond the Greatwood Vale. Show the loggers the language they understand." },
    { id = "g_shred", when = { questActive = TODO_QUEST("Shredding Machines") }, text = "XT:4 and XT:9, the marks I saw in my vision. Find those machines, and stop them." },
    { id = "g_crone", when = { questActive = TODO_QUEST("The Elder Crone") }, text = "Magatha, on Elder Rise in Thunder Bluff. Tell her what the spirits suffer here, and ask for her wisdom." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the spirits still rage, though a little less, I think. Perhaps that's your doing." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown strong since we first stood here and listened to the trees. The spirits would know you now, I think." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The braves at the Crossroads say you've been a help to folk. The spirits hear that kind of thing, whatever else they hear." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! Then listen with me a moment, and tell me I am not imagining the scream under the wind." },
    { id = "n_lumber", cat = "craft", when = { profession = "Engineering" },
      text = "You smell of oil and gears, like the goblins' machines. I know you're Horde, but forgive me if I flinch." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Seereth Stonebreak, sent from Orgrimmar to Stonetalon. The goblins of the Venture Company are plundering and burning the forest, and the spirits of these mountains are nearly blind with pain and rage." },
        { id = "h_arrive", tags = { "news" }, when = { questActive = TODO_QUEST("The Spirits of Stonetalon") },
          text = "Ah, a {class}, very good! We'll need your skills to deal with these plunderers, and quickly." },
        { id = "h_loggers_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Goblin Invaders"), days = 3 } },
          text = "Bravely done. Ridding the Venture Company of its workers is a good first move, but the spirits still rage, and I fear we'll need the tauren elders' wisdom to calm them." },
        { id = "h_shred_before", when = { questBefore = TODO_QUEST("Shredding Machines"), questDone = TODO_QUEST("Goblin Invaders") },
          text = "I had a vision, {class}, clear as daylight: two man-shaped machines in the Windshear Crag, felling trees with impossible speed. They were marked XT:4 and XT:9, and they must be stopped." },
        { id = "h_shred_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Shredding Machines"), days = 3 } },
          text = "The machines are broken, and many of the spirits are soothed. Let us hope the Venture Company takes the hint and leaves, because if it doesn't, worse will follow." },
        { id = "h_crone_done", when = { questDone = TODO_QUEST("The Elder Crone") },
          text = "Magatha listened, you say, and promised her wisdom. Good; I knew no other name among the tauren elders, but hers was spoken with great respect." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "One of the Earth Mother's children! The tauren hear the land better than we orcs do, so tell me, do you feel the wrongness here?" },
      },
      again = {
        { id = "h_again", text = "What else would you ask? Speak; the spirits are loud, but I can hear you." },
        { id = "h_again2", text = "Go on, {class}. I'll answer while I can still think over the noise." },
      },
      choices = {
        { text = "What do the spirits say?", next = "spirits" },
        { text = "Why do goblins want this forest?", next = "venture" },
        { text = "Why go to the tauren elders?", next = "elders", when = { any = { { questDone = TODO_QUEST("Goblin Invaders") }, { questActive = TODO_QUEST("The Elder Crone") } } } },
        { text = "Tell me about your vision.", next = "vision", when = { any = { { questActive = TODO_QUEST("Shredding Machines") }, { questDone = TODO_QUEST("Shredding Machines") } } } },
        { text = "I hear them too, Seereth.", next = "shaman_s", when = { class = "SHAMAN" } },
        { text = "What can I do?", next = "BUSINESS" },
        { text = "May the spirits calm, Seereth.", next = "END" },
      },
    },

    spirits = {
      lines = {
        { id = "sp_default", text = "Mostly they scream, and the screaming has no words in it. But under it there's grief, the grief of trees that stood a thousand years and fell in an afternoon." },
      },
      choices = {
        { text = "Can they be calmed?", next = "spirits_calm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_calm = {
      lines = {
        { id = "sc_default", text = "Not by me alone, I fear; I am young, and this is beyond my training. The druids and the shaman together might do it, for the magic of the one is kin to the magic of the other." },
      },
      choices = {
        { text = "Then why send you alone?", next = "spirits_alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_alone = {
      big = true,
      lines = {
        { id = "sa_default", text = "Because the Horde has many fights and few shaman, and someone had to come. I asked for help when I got here, and I'm not ashamed of it." },
      },
      choices = {
        { text = "Asking for help is wisdom, not weakness.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Orgrimmar should have sent more. That's their duty.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    venture = {
      big = true,
      lines = {
        { id = "ve_default", text = "Wood, and whatever lies under the wood, and they don't care what dies to get at it. They're not Alliance or Horde, only greed with a hard hat on." },
      },
      choices = {
        { text = "Then they get no mercy from me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Drive them out, but the hired hands just want wages.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },

    elders = {
      lines = {
        { id = "el_default", text = "The tauren have lived with the spirits of this land longer than any orc, and their elders know rites I've never learned. I know only one name, Magatha, and they say she is very old and knows a great deal." },
      },
      choices = {
        { text = "What else do you know of her?", next = "elders_magatha" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elders_magatha = {
      lines = {
        { id = "em_default", text = "Nothing more, I'm afraid, except that she lives on Elder Rise in Thunder Bluff. If she can marshal the tauren's spiritual aid for Stonetalon, I'll be grateful to her for the rest of my life." },
      },
      choices = {
        { text = "I'll go and ask her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Goodbye, Seereth.", next = "END" },
      },
    },

    vision = {
      lines = {
        { id = "vi_default", text = "It came while I slept, and it wasn't a dream, because dreams don't hurt like that. Two iron giants among the trees, with symbols painted on their chests, and the forest falling before them like grass under a scythe." },
      },
      choices = {
        { text = "The spirits sent it to you.", next = "BACK", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman_s = {
      lines = {
        { id = "ss_default", text = "Then I'm not mad, and that's the best news I've had in a month. Stand with me a while and lend them your voice, because they listen to more than one of us better than to one alone." },
      },
      choices = {
        { text = "I'll lend my voice.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A shaman of Orgrimmar, young and promising, or so they told me before they sent me here. Now I'm only tired." } },
    advice = { { id = "tp_ad", text = "Listen to a place before you fight in it. The spirits will tell you where not to stand, if you let them." } },
    venture_company = { { id = "tp_venture", text = "Goblins with axes and no shame. Every tree they fell is a voice that stops singing.", next = "venture" } },
    _none = { { id = "tp_none", text = "I don't know, {class}. Ask the spirits; they're louder than I am." } },
  },
}
