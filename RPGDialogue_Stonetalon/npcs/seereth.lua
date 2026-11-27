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
    first = "She hears the spirits screaming and has not slept well since.",
    third = "{name} met Seereth Stonebreak, an orc shaman on the Stonetalon border who hears the mountains' spirits raging at the Venture Company.",
  },

  greetings = {
    { id = "g_hello", text = "Listen, do you hear them? No, I suppose you don't, and I envy you, for I have not slept a whole night since I left Orgrimmar." },
    { id = "g_loggers", when = { questActive = TODO_QUEST("Goblin Invaders") }, text = "The loggers are at Windshear Crag, beyond the Greatwood Vale, so show them the language they understand, the one the Horde speaks with steel." },
    { id = "g_shred", when = { questActive = TODO_QUEST("Shredding Machines") }, text = "Find the machines marked XT:4 and XT:9, the ones I saw in my vision, and stop them." },
    { id = "g_crone", when = { questActive = TODO_QUEST("The Elder Crone") }, text = "Go to Magatha Grimtotem on Elder Rise in Thunder Bluff, tell her what the spirits suffer here, and ask for her wisdom." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the spirits still rage, though a little less, I think. Perhaps that's your doing." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown strong since we first stood here and listened to the trees. The spirits would know you now, and so would any orc of the Horde." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The braves at the Crossroads say you've been a help to folk. The spirits hear that kind of thing, whatever else they hear." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! Then listen with me a moment, and tell me I am not imagining the scream under the wind." },
    { id = "n_lumber", cat = "craft", when = { profession = "Engineering" },
      text = "You smell of oil and gears, like the goblins' machines. I know you're Horde, but don't be hurt if I flinch." },
  },

  start = "hello",
  nodes = {
    dd_earthen = {
      lines = {
        { id = "dd_ea_default", text = "That something old was disturbed beneath Boulderslide, and that it is quieter now. The earth spirits don't think in days, as we do, so they speak of it as though it happened a moment ago and also long ago. You did well, though I fear the kobolds will keep digging as long as there are candles to light their way." },
      },
      choices = {
        { text = "Then the kobolds should be driven out of the ravine.", next = "BACK", reply = "Perhaps, though the spirits don't hate the kobolds as they hate the goblins. The kobolds only dig; the goblins devour.", fx = { align = { order = 1 } } },
        { text = "The kobolds only dig. Let the spirits judge them.", next = "BACK", reply = "Wisely spoken, and the spirits would agree. Save your anger for the Venture Company, who deserve it more.", fx = { align = { order = -1 } } },
        { text = "Something else, Seereth.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_earthen", tags = { "news" }, when = { questDone = TODO_QUEST("Earthen Arise") },
          text = "Mor'rogal tells me you went into Boulderslide Ravine and faced what the kobolds were digging toward. The spirits of the mountain have spoken of it all week, and for once they sound less angry." },
        { id = "h_default", key = true,
          text = "I am Seereth Stonebreak, sent from Orgrimmar to Stonetalon by the Warchief's own shaman. The goblins of the Venture Company are plundering and burning the forest, and the spirits of these mountains are nearly blind with pain and rage." },
        { id = "h_arrive", tags = { "news" }, when = { questActive = TODO_QUEST("The Spirits of Stonetalon") },
          text = "Ah, a {class}, very good! We'll need your strength to deal with these plunderers, and quickly; deeds will serve us better than talk." },
        { id = "h_loggers_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Goblin Invaders"), days = 3 } },
          text = "Bravely done, and with honor. Ridding the Venture Company of its workers is a good first blow, but the spirits still rage, and I fear we'll need the tauren elders' wisdom to calm them." },
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
        { id = "h_again", text = "What else would you ask? Speak plainly, as an orc would; the spirits are loud, but I can hear you." },
        { id = "h_again2", text = "Go on, {class}. I'll answer while I can still think over the noise." },
      },
      choices = {
        { text = "What did the spirits say about the ravine, Seereth?", next = "dd_earthen", when = { questDone = TODO_QUEST("Earthen Arise") } },
        { text = "What do the spirits say?", next = "spirits" },
        { text = "The goblins seem to want this whole forest.", next = "venture" },
        { text = "Why go to the tauren elders?", next = "elders", when = { any = { { questDone = TODO_QUEST("Goblin Invaders") }, { questActive = TODO_QUEST("The Elder Crone") } } } },
        { text = "Tell me about your vision.", next = "vision", when = { any = { { questActive = TODO_QUEST("Shredding Machines") }, { questDone = TODO_QUEST("Shredding Machines") } } } },
        { text = "I hear them too, Seereth.", next = "shaman_s", when = { class = "SHAMAN" } },
        { text = "What can I do?", next = "BUSINESS" },
        { text = "How do you sleep, with the spirits so loud?", next = "w5_sleep" },
        { text = "May the spirits calm, Seereth.", next = "END" },
      },
    },

    w5_sleep = {
      lines = { { id = "w5_sleep_l", text = "Badly. I sleep on bare stone, because the earth spirits are quieter when I am close to them, and I wake at every shriek from the Charred Vale. Mor'rogal brought me a bedroll last moon. I gave it to a brave who needed it more." } },
      choices = {
        { text = "Is there no way to quiet them?", next = "w5_sleep2" },
        { text = "I hear them too. Sleeping in running water helps a little.", next = "BACK", when = { class = "SHAMAN" }, reply = "Running water? I will try it. Thank you, {class}. A shaman's trick from one who knows." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w5_sleep2 = {
      lines = { { id = "w5_sleep2_l", text = "Only by healing what makes them scream. The goblins are cutting the mountain to pieces, and the spirits cry out with every tree that falls. Until the cutting stops, the spirits will not rest, and neither will I. I am an orc. I can bear it longer than the trees can." } },
      choices = {
        { text = "Then stop the cutting, whatever it takes.", next = "BACK", reply = "That is what I tell the elders. They tell me to be patient. I am tired of patience.", fx = { align = { order = -1 } } },
        { text = "Patience. The Horde must choose its battles carefully.", next = "BACK", reply = "Patience for whom? The spirits do not have it. But I hear you.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
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
        { id = "sa_default", text = "Because the Horde has many fights and few shaman, and someone had to come. I asked for help when I got here, and I'm not ashamed of it; there's no dishonor in knowing your own strength." },
      },
      choices = {
        { text = "Asking for help is wisdom, not weakness.", next = "BACK", reply = "It is, and I'm glad to hear it said without being taught. My own teacher had to shout it at me for a year.", fx = { align = { order = -1 } } },
        { text = "Orgrimmar should have sent more. That's their duty.", next = "BACK", reply = "Perhaps they should, but Orgrimmar has a whole Horde to look after. I'd rather do what I can here than wait for help that may not come.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    venture = {
      big = true,
      lines = {
        { id = "ve_default", text = "Wood, and whatever lies under the wood, and they don't care what dies to get at it. They're not Alliance or Horde, only greed with a hard hat on, and they have no more honor than a kobold." },
      },
      choices = {
        { text = "Then they get no mercy from me.", next = "BACK", reply = "Then the spirits of these hills will be glad of you. Start at Windshear Crag, where the saws never stop.", fx = { align = { light = -1 } } },
        { text = "Drive them out, but the hired hands just want wages.", next = "BACK", reply = "That's a kinder heart than mine, and maybe a wiser one. Spare the ones who run, then, but break the machines.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },

    elders = {
      lines = {
        { id = "el_default", text = "The tauren have lived with the spirits of this land longer than any orc, and their elders know rites I've never learned. The name I hear spoken with the most respect is Magatha's, so she is the one I would ask." },
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
    background = { { id = "tp_bg", text = "A shaman of Orgrimmar, young and promising, or so they told me before they sent me here. I was born in the camps and found the spirits only after Thrall freed us, and now I'm only tired." } },
    advice = { { id = "tp_ad", text = "Listen to a place before you fight in it. The spirits will tell you where not to stand, if you let them, and an orc who listens lives long enough to swing twice." } },
    venture_company = { { id = "tp_venture", text = "Goblins with axes and no shame. Every tree they fell is a voice that stops singing.", next = "venture" } },
    the_elements = { { id = "tp_the_elements", text = "The spirits of Stonetalon scream when the goblins cut, and I hear every scream. I am young for a shaman, but I know pain when I hear it." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother is weeping in Stonetalon, and I am trying to comfort her. It is a big task for a small shaman, but I will not give up." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a shaman, and he would understand what I hear. I wish he would come to Stonetalon and see the Charred Vale for himself." } },
    cairne = { { id = "tp_cairne", text = "Cairne sent Maggran to Sun Rock to protect the land, and I am glad he did. But even Maggran cannot stop the goblins alone." } },
    _none = { { id = "tp_none", text = "I don't know, {class}. My people forgot the spirits once, under the demon's shadow, and I'll not pretend to know what they haven't told me." } },
  },
}
