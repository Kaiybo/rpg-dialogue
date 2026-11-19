-- Darkshore's missed folk, in their Classic places: Jaelysia, stable master of Auberdine; Yalda, a quiet
-- resident of Auberdine; Ullanna, who sells trade supplies at the Grove of the Ancients. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Yalda: a resident of Auberdine with no listed trade.
P:NPC {
  key = "yalda", id = TODO_NPC("Yalda"), name = "Yalda", gender = "female",
  bible = "bibles/missed.md", role = "villager", tier = "service",
  communities = { "auberdine" }, temper = { "wistful", "soft-spoken" }, values = { "home", "memory" },
  notices = { "race", "travel" },
  impression = {
    first = "Yalda lives in Auberdine and spends her evenings watching the boats come in from Teldrassil and Menethil. She loves the grey town more than it seems to deserve, and she speaks of it very gently.",
    third = "{name} met Yalda, a soft-spoken resident of Auberdine.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. You have the look of someone just off a boat, or about to board one." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to Auberdine. Most pass through only once, so I am glad of it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "A fair night to you. The mist has lifted enough to show the moon, which does not happen often here." },
  },
  notice = {
    { id = "n_outlander", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "Another guest from across the sea. There were none of you on this dock a few years ago, and now your tongue is spoken here every day." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Yalda, and Auberdine is my home, though I have no post or trade to give you. I watch the ships and the weather, and I try to remember the town as it was before the shore turned strange." },
      },
      again = {
        { id = "h_again", text = "What else would you hear of Auberdine?" },
        { id = "h_again2", text = "Ask on. The next boat is a while off yet." },
      },
      choices = {
        { text = "How has the shore turned strange?", next = "strange" },
        { text = "You see many outlanders on the dock.", next = "outlanders" },
        { text = "Why stay in so grey a town?", next = "stay" },
        { text = "Fair evenings to you, Yalda.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "The sea gives up dead creatures on the sand, and the murlocs build their huts nearer every season. The forest behind us is no better, for the Blackwood furbolgs who traded with my mother now attack anyone they see.", fx = { learn = { "furbolgs" } } } },
      choices = {
        { text = "Does the town feel safe to you?", next = "safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "sa_default", text = "Within the lamps it does, because the Sentinels walk the edges day and night. I do not go as far as the Long Wash any more, and I used to gather shells there as a child." } },
      choices = { { text = "I hope you may again. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    outlanders = {
      lines = { { id = "o_default", text = "Dwarves who want to dig everything up, gnomes who want to take everything apart, and humans who want to know where the inn is. I find I like them, for they are noisy, and Auberdine has been quiet a very long time." } },
      choices = { { text = "We do bring noise. Something else.", next = "BACK" } },
    },
    stay = {
      lines = { { id = "st_default", text = "Because it is grey in the way a moonstone is grey, if you wait for the light. Darnassus is fairer, and I visit, but I was born to the sound of this surf and I sleep badly without it." } },
      choices = { { text = "Then you are where you belong. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born on this shore and have never wished to leave it for long. That is the whole of my story." } },
    furbolgs = { { id = "tp_fur", text = "The Blackwood were good neighbours when I was young. I do not know what changed them, and it grieves me." } },
    _none = { { id = "tp_none", text = "I am afraid I know only the tides and the boats. Thundris Windweaver would be the one to ask." } },
  },
}

-- Ullanna: trade supplies at the Grove of the Ancients (Classic placement).
P:NPC {
  key = "ullanna", id = TODO_NPC("Ullanna"), name = "Ullanna", title = "Trade Supplies", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "grove_of_ancients" }, temper = { "hushed", "content" }, values = { "reverent", "craft" },
  notices = { "profession", "class" },
  impression = {
    first = "Ullanna sells thread and vials at the Grove of the Ancients and lowers her voice whenever Onu stirs. She keeps shop in the shadow of an Ancient of Lore, and she has never quite got used to it.",
    third = "{name} met Ullanna, who sells trade supplies at the Grove of the Ancients in Darkshore.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, and softly, please. The Ancient is thinking, and I would not like to be the reason he stops." },
    { id = "g_back", when = { metBefore = true }, text = "You are back at the grove, {class}. Onu has moved one root since you left, so it has been a busy season." },
  },
  notice = {
    { id = "n_craft", cat = "profession", when = { profession = { "Tailoring", "Leatherworking", "Alchemy", "Herbalism" } },
      text = "You work a craft, I think, for your fingers are stained with it. Travellers of your sort are the reason I keep a shop this far down the coast." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_druid", when = { class = "DRUID" }, text = "I am Ullanna, and I keep trade supplies here for those who walk the grove. A druid will have come for Onu and not for my thread, but I am glad to see you all the same." },
        { id = "h_default", text = "I am Ullanna, and I sell trade supplies at the Grove of the Ancients, halfway down a coast with no other shop on it. Crafters bound for Ashenvale stop with me, and so does anyone who has torn a pack on the way from Auberdine." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice low, if you would." },
        { id = "h_again2", text = "Ask on, quietly." },
      },
      choices = {
        { text = "Show me your trade goods.", next = "BUSINESS" },
        { text = "What is it like, living beside an Ancient?", next = "onu" },
        { text = "This is a lonely place for a shop.", next = "lonely" },
        { text = "What lies south of here?", next = "south" },
        { text = "Peace to you and the grove.", next = "END" },
      },
    },
    onu = {
      lines = { { id = "o_default", text = "It is like living beside a mountain that sometimes clears its throat. Onu has watched this coast since before my grandmother was born, and when he speaks, I put down whatever I am counting and listen." } },
      choices = {
        { text = "What does he speak of?", next = "speaks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    speaks = {
      lines = { { id = "sp_default", text = "Lately, of the Twilight's Hammer, who have crept into the old ruins at the Master's Glaive to the south. He does not frighten easily, so when he asks travellers to go and see for themselves, I take it very seriously.", fx = { learn = { "twilights_hammer" } } } },
      choices = { { text = "Then I will hear him out. Something else.", next = "BACK" } },
    },
    lonely = {
      lines = { { id = "l_default", text = "It is, and I chose it for that. Auberdine frets about its beach, and Astranaar frets about the orcs, while the grove only stands as it has always stood and lets the fretting go by on the road." } },
      choices = { { text = "I can see the appeal. Something else.", next = "BACK" } },
    },
    south = {
      lines = { { id = "s_default", text = "More forest, Blackwood furbolgs who are no longer safe to greet, and at last the border of Ashenvale. Sentinels ride that road, but not often enough, so travel it by day and with your weapon loose.", fx = { learn = { "ashenvale" } } } },
      choices = { { text = "My thanks for the warning. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to the grove to rest a season, long ago, and opened a shop instead. Onu did not object, which I took for a welcome." } },
    twilights_hammer = { { id = "tp_tw", text = "A cult that worships ruin. Onu has an eye on them at the Master's Glaive, and so should the Sentinels." } },
    _none = { { id = "tp_none", text = "I only keep thread and vials, friend. Put that to Onu, if you have the patience to wait for his answer." } },
  },
}
