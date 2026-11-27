-- Doraan, a dragon resting south of Theramore Isle (Forever only). Voice: bibles/doraan.md
-- The wiki gives one gossip line: "It's a beautiful day, is it not?" He is serene, courteous and gives nothing away:
-- no flight is named, nothing of his purpose is confirmed.
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dw_doraan", id = TODO_NPC("Doraan"), name = "Doraan",
  bible = "bibles/doraan.md", role = "citizen", tier = "service",
  temper = { "calm", "sharp" }, values = { "patient", "wise", "beauty" },
  notices = { "small", "druid", "mage" },

  impression = {
    first = "He was courteous and amused, and told me nothing about himself.",
    third = "{name} met Doraan, a courteous dragon resting in the marsh south of Theramore Isle.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "It is a beautiful day, friend, and lovelier for your company. Sit, if you like." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "It is a beautiful day. Please, let me enjoy it alone." },
    { id = "g_default", text = "It's a beautiful day, is it not?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, small one. Have you come to admire the day with me?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "A beautiful night, is it not? The marsh sings louder in the dark." },
  },

  notice = {
    { id = "n_small", cat = "small", when = { race = "Gnome" },
      text = "Oh, you are very small, even for one of your kind. I shall be careful where I put my tail." },
    { id = "n_druid", cat = "druid", when = { class = "DRUID" },
      text = "A druid. You may tell your Circle that I have harmed no tree and eaten no traveller, and that I intend to keep it so." },
    { id = "n_mage", cat = "mage", when = { class = "MAGE" },
      text = "You smell of the arcane, little mage. Do not try anything clever; I have met cleverer, and they were very sorry." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am called Doraan, and I am lying in the sun, which is a thing even dragons are allowed to do. You may stay, if you are quiet, and you may ask, if you are polite." },
        { id = "h_theramore", when = { faction = "Alliance" },
          text = "Your lady's soldiers watch me from their walls and pretend they are not watching. I find it charming, and I have done nothing to deserve their worry, yet." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "A child of the Horde, walking up to a dragon in a marsh. Either you are very brave or you have not met many dragons." },
      },
      again = {
        { id = "h_again", text = "Something else? The day is long, and so am I." },
        { id = "h_again2", text = "Ask, small one, before the sun moves." },
      },
      choices = {
        { text = "What are you doing here?", next = "why" },
        { text = "Which flight do you belong to?", next = "flight" },
        { text = "Aren't you afraid of the soldiers at Theramore?", next = "theramore" },
        { text = "There's a dragon's lair to the south.", next = "lair" },
        { text = "It is a beautiful day.", next = "day" },
        { text = "Do you ever fly, or only lie in the sun?", next = "w7_fly" },
        { text = "I'll leave you to your sun.", next = "END" },
      },
    },
    w7_fly = {
      lines = {
        { id = "w7_fly_l1", text = "I fly at dusk, small one, when the marsh is dim and the soldiers' ballistae cannot see me against the clouds. I go out over the sea, very high, and come back before the moon is up. Then I lie in the sun again." },
      },
      choices = {
        { text = "Where do you fly to?", next = "w7_fly2" },
        { text = "That sounds lonely.", next = "w7_fly3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_fly2 = {
      lines = {
        { id = "w7_fly2_l1", text = "Nowhere, which is the point of it. Your kind always fly toward something, but a dragon may fly only to feel the air. I recommend it, if you ever grow wings." },
        { id = "w7_fly2_l2", when = { class = "DRUID" }, text = "Nowhere, and you of all small ones may understand that, if you have ever taken wing yourself. The air does not need a destination, only a creature willing to be carried." },
      },
      choices = {
        { text = "I'll try it someday.", next = "BACK", reply = "Do. And then come and tell me how it felt." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_fly3 = {
      lines = {
        { id = "w7_fly3_l1", text = "Is it? I have been alone a long time, and I have never yet found the sky to be poor company." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Enjoying the day, as I said. The marsh is warm, the water is still, and nobody asks me to be anything but a large shape in the reeds. You would be surprised how rare that is." },
      },
      choices = {
        { text = "There is wisdom in enjoying a quiet day.", next = "BACK", reply = "There is. Few understand it.", fx = { align = { light = 1 } } },
        { text = "Sitting in the reeds all day is a waste of life.", next = "BACK", reply = "Perhaps. But it is my life to waste.", fx = { align = { light = -1 } } },
        { text = "Surely a dragon has more to do than sunbathe.", next = "why_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_more = {
      lines = {
        { id = "wm_default", text = "Surely a dragon does, and surely this one is doing it, and surely you will not find out what it is by asking twice. Sit, and enjoy the day; that is my answer and my advice." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    flight = {
      lines = {
        { id = "fl_default", text = "That is a very direct question for so small a creature. I belong to the sun on my back and the marsh under my belly today, and tomorrow I may belong somewhere else." },
      },
      choices = {
        { text = "I'd like to trust you, Doraan.", next = "flight_trust" },
        { text = "A dragon who won't say his flight is no friend.", next = "flight_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flight_trust = {
      lines = {
        { id = "ft_default", text = "Trust me as far as you can throw me, which is a dragon's old joke and still a good one. I have harmed nobody here, and you may judge me by that, or not at all." },
      },
      choices = {
        { text = "Then I'll judge you by your deeds.", next = "BACK", reply = "That is all I ask, and more than most of your kind offer. Watch me as long as you like, and you will see nothing worth the trouble.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Dragons should answer to someone. I'll keep watch.", next = "BACK", reply = "Keep it, then, and keep it well, since I have nothing to hide from you. Mortals watching dragons is an old and honest custom.", fx = { align = { order = 1 } } },
      },
    },

    theramore = {
      lines = {
        { id = "th_default", text = "Afraid? They have ballistae and good intentions, and I have wings and a long memory. I like Lady Proudmoore, from what I hear; she wants peace, and peace lets an old creature lie in the sun." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    lair = {
      lines = {
        { id = "la_default", text = "There is, in the Wyrmbog, and I do not go there, and I advise you not to either unless you have a great many friends and no wish to see the morning. Ask me something pleasant." },
      },
      choices = {
        { text = "Then the dragon there is no friend of yours?", next = "lair_friend" },
        { text = "Something pleasant, then.", next = "BACK" },
      },
    },
    lair_friend = {
      lines = {
        { id = "lf_default", text = "I have said what I will say about the Wyrmbog, small one. The day is too beautiful to spend it on that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    day = {
      lines = {
        { id = "da_default", text = "It is! You understand, then. Most of your kind run past this marsh with their heads down and never once look at the light on the water, and I pity them for it." },
      },
      choices = {
        { text = "The world's worth slowing down for.", next = "BACK", reply = "It is, and you say it as if you mean it, which pleases me more than you would guess. Come back at dusk sometime, when the water turns gold.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Beauty doesn't win wars.", next = "BACK", reply = "No, and it was never meant to, which is rather the point of it. The wars end eventually, and someone ought to remember what they were fought for.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am older than your grandmother's grandmother, and I am lying in a marsh. Both are true, and neither is your business." } },
    advice = { { id = "tp_ad", text = "Look up now and then. Most of what will kill you comes from above, and most of what is worth seeing does too." } },
    _none = { { id = "tp_none", text = "I could tell you, but then the day would be less beautiful for both of us." } },
  },
}
