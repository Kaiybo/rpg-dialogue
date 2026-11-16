-- Nighthaven's shopkeepers (0.39.0): Daeolyn Summerleaf's general goods, Malvor the herbalist and
-- Narianna the bowyer. Moonglade is neutral ground, so nobody assumes the player's faction.
-- Voices: bibles/unsung.md.
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC = P.TODO_NPC

-- Daeolyn Summerleaf: general goods in Nighthaven.
P:NPC {
  key = "daeolyn", id = TODO_NPC("Daeolyn Summerleaf"), name = "Daeolyn Summerleaf", title = "General Goods",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "serene", "welcoming" }, values = { "peace", "hospitality" },
  notices = { "race", "weary" },
  impression = {
    first = "Daeolyn Summerleaf sells supplies in Nighthaven and treats every traveler, Horde or Alliance, as a guest of the grove. She seems to believe the peace of Moonglade can rub off on anyone who stays long enough.",
    third = "{name} met Daeolyn Summerleaf, who keeps Nighthaven's general store open to all.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Nighthaven. However you came here, and whoever you came with, you're a guest of the grove now." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the grove. It does that to people; they always come back." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Welcome, friend of the Earth Mother. Your people's druids have made Nighthaven a little louder and a good deal warmer, and I'm glad of both." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You've come through Felwood, haven't you? Everyone who does looks like that. Rest here for a while; nothing in the grove will trouble you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Daeolyn Summerleaf, and I keep the general goods for Nighthaven: water, thread, bags and the small things that travelers run short of. Most who come here are druids, but anyone the grove lets in may buy from me." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? The grove is in no hurry." },
        { id = "h_again2", text = "Ask what you like. Peace makes for long conversations." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Horde and Alliance both trade here?", next = "both" },
        { text = "How did you come to live in Moonglade?", next = "came" },
        { text = "Farewell, Daeolyn.", next = "END" },
      },
    },
    both = {
      lines = {
        { id = "bo_default", text = "They do, and nobody draws a blade, because the Keeper won't allow it and the Circle would be ashamed of it. A tauren druid and a night elf druid will stand at this counter side by side, and some days they even talk to each other." },
      },
      choices = {
        { text = "Do you think that peace could spread?", next = "both2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    both2 = {
      lines = {
        { id = "bo2_default", text = "I'd like to believe it could, but Moonglade has Remulos, and Ashenvale doesn't. Out there it's axes and arrows, and in here it's only two travelers buying water." },
      },
      choices = {
        { text = "If peace works here, it can work anywhere.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1, learn = { "cenarion_circle" } } },
        { text = "Peace only lasts where someone enforces it.", next = "BACK", fx = { align = { honor = -1 }, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    came = {
      lines = {
        { id = "ca_default", text = "I followed a druid here, a long time ago, and stayed after he went into the Dream. Someone had to keep the bread coming while the druids were busy being wise." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_cc", text = "The Circle keeps Moonglade for every druid, whoever they march with outside. I only keep the shop." } },
    background = { { id = "tp_bg", text = "I sell supplies in Nighthaven. I came for a druid and stayed for the quiet." } },
    advice = { { id = "tp_ad", text = "If you take the road through Felwood, keep to the Timbermaw tunnels and say nothing rude to the furbolgs." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Rabine Saturna might; he knows most things that happen in the grove." } },
  },
}

-- Malvor: herbalist in Nighthaven (his Classic title; he trains herbalism).
P:NPC {
  key = "malvor", id = TODO_NPC("Malvor"), name = "Malvor", title = "Herbalist",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "nighthaven" }, temper = { "dreamy", "gentle" }, values = { "nature", "wonder" },
  notices = { "craft", "form" },
  impression = {
    first = "Malvor teaches herbalism in Nighthaven and speaks of the plants of Moonglade as though they were half asleep and dreaming. He is gentle, and a little hard to bring back to earth.",
    third = "{name} met Malvor, Nighthaven's dreamy herbalist.",
  },

  greetings = {
    { id = "g_default", text = "Shh, step lightly. The silverleaf by the lake is just opening." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. The grove remembers your footsteps, and so do I." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You carry a satchel of herbs from places I've never been. May I look? I promise not to keep anything." },
    { id = "n_tree", cat = "form", when = { form = { "bear", "cat", "moonkin" } },
      text = "Please watch where you put those feet. The young plants here grow slowly, and they have very little patience for paws." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Malvor, and I tend the herbs of Moonglade and teach those who wish to learn herbalism. Everything here grows a little differently, because the grove sits so close to the Dream." },
      },
      again = {
        { id = "h_again", text = "Is there another herb on your mind, or something else entirely?" },
        { id = "h_again2", text = "Go on. I was only listening to the leaves." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What grows differently here?", next = "grows" },
        { text = "What do you mean, close to the Dream?", next = "dream" },
        { text = "Farewell, Malvor.", next = "END" },
      },
    },
    grows = {
      lines = {
        { id = "gr_default", text = "The silverleaf by the lake glows faintly at night, and the peacebloom opens before sunrise rather than after. Picked here, they're no stronger than anywhere else, but I like to think they remember where they came from." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = {
        { id = "dr_default", text = "The druids say Moonglade lies near the Emerald Dream, closer than anywhere else in the world, and that's why they come here to sleep and study. I'm no druid, but even I dream more clearly in Nighthaven." },
      },
      choices = {
        { text = "Is it dangerous, to be so close?", next = "dream2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream2 = {
      lines = {
        { id = "dr2_default", text = "The Keeper doesn't seem to think so, and I trust him. But I've heard the druids speak quietly about sleepers who don't wake, and I don't ask them more than they want to say." },
      },
      choices = {
        { text = "Some mysteries are better left alone.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 }, learn = { "malfurion" } } },
        { text = "If something's wrong, someone should find out.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 }, learn = { "malfurion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    malfurion = { { id = "tp_mal", text = "The Shan'do sleeps in the Dream, they say. I hope his dreams are gentler than mine." } },
    background = { { id = "tp_bg", text = "I tend the herbs of Nighthaven. I came to study them, and they've been studying me ever since." } },
    _none = { { id = "tp_none", text = "I don't know, but if you ask the plants, perhaps they'll tell you. They tell me things sometimes." } },
  },
}

-- Narianna: bowyer in Nighthaven.
P:NPC {
  key = "narianna", id = TODO_NPC("Narianna"), name = "Narianna", title = "Bowyer",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "practical", "dry" }, values = { "readiness", "honesty" },
  notices = { "class" },
  impression = {
    first = "Narianna sells bows in Nighthaven and sees no contradiction in arming travelers in the most peaceful place in Kalimdor. She is dry and practical about it.",
    third = "{name} met Narianna, the practical bowyer of Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Yes, a bowyer in a sanctuary. You aren't the first to look surprised, and you won't be the last." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Run out of arrows in Winterspring, did you?" },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Your beast won't need to hunt here, so let it rest while you shop." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Narianna, and I sell bows, arrows and quivers here in Nighthaven. Nobody fights inside the grove, but everyone who comes here has to leave again, and the roads out are not so kind." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Go on, ask." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Isn't selling bows here a bit odd?", next = "odd" },
        { text = "Where do people go from here?", next = "roads" },
        { text = "Farewell, Narianna.", next = "END" },
      },
    },
    odd = {
      lines = {
        { id = "od_default", text = "Only if you think peace means nobody's armed. Peace here means nobody draws, and the Keeper doesn't care what's on your back, as long as it stays there." },
      },
      choices = {
        { text = "A real peace would need no weapons at all.", next = "odd2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    odd2 = {
      lines = {
        { id = "od2_default", text = "Perhaps, and when the world outside agrees with you, I'll start selling flowers. Until then, every druid who walks to Felwood comes back alive more often with a bow than without one." },
      },
      choices = {
        { text = "True peace starts with laying weapons down.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Peace is kept by those ready to fight for it.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads = {
      lines = {
        { id = "ro_default", text = "South through the furbolg tunnels to Felwood, or north into the snows of Winterspring. Druids can fly from the hippogryph and wind rider posts here, but everyone else walks, and both roads are rough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell bows in Nighthaven. I used to be a Sentinel, and I still like to see people leave well armed." } },
    advice = { { id = "tp_ad", text = "In Felwood, don't drink from anything green. You'll thank me." } },
    _none = { { id = "tp_none", text = "I don't know. I sell bows; that's my whole wisdom." } },
  },
}
