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
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. Come and watch the boats with me a while. You always notice the ones I miss." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. I am watching the boats. Please, let me watch them in peace." },
    { id = "g_default", text = "Ishnu-alah, traveller. You have the look of someone just off a boat, or about to board one." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to Auberdine. Most pass through only once, so I am glad of it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "A fair night to you. The mist has lifted enough to show the moon, which does not happen often here." },
    { id = "yg_0", when = { race = "Gnome" }, text = "A gnome, on our dock! Please do not take anything apart. The last of your kind dismantled our bell, and we still have not put it back together." },
  },
  notice = {
    { id = "n_outlander", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "Another guest from across the sea. There were none of you on this dock a few years ago, and now your tongue is spoken here every day." },
  },
  start = "hello",
  nodes = {
    y_watch = {
      lines = {
        { id = "y_y_watch", text = "I watch the boats, mostly. Who comes and who goes, and who never comes back. My mother did the same, and her mother before her. We have no trade, but we have a long memory, and someone in Auberdine must keep it." },
      },
      choices = {
        { text = "Remembering those who never came back matters.", next = "BACK", reply = "It does. Someone must, or they are lost twice.", fx = { align = { light = 1 } } },
        { text = "Watching the boats won't bring anyone home.", next = "BACK", reply = "No. But it keeps them from being forgotten. Please, go on your way.", fx = { align = { light = -1 } } },
        { text = "Who never came back?", next = "y_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_lost = {
      lines = {
        { id = "y_y_lost", text = "My brother Saeldris took a boat to Menethil forty years ago, to see the human kingdoms. He wrote once, from Stormwind, and then nothing. I still watch every boat. I tell myself it is a habit." },
        { id = "y_y_lost_v0", when = { race = "Human" }, text = "My brother Saeldris went to your kingdoms forty years ago. He wrote once, from Stormwind. If you ever hear his name, tell him his sister watches the boats." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_murloc = {
      lines = {
        { id = "y_y_murloc", text = "The murlocs are building nearer every season. Glynda's Sentinels drive them back, and they return. I have heard that the dwarves would burn the whole beach to be rid of them. I do not think the beach would thank them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "Some in Auberdine want to close the dock to outlanders, now that the shore is strange. Others say we need the Alliance more than ever. What do you think?" },
      },
      choices = {
        { text = "Keep the dock open. We need allies.", next = "BACK", reply = "Yes. Even the noisy ones. Especially the noisy ones, perhaps.", fx = { align = { order = 1 } } },
        { text = "Close it. Kaldorei should guard their own.", next = "BACK", reply = "I hear you. I think you are wrong, but I have heard worse from wiser mouths.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "What do you do all day?", next = "y_watch" },
        { text = "What of the murlocs?", next = "y_murloc" },
        { text = "Should the dock stay open to outlanders?", next = "y_stance" },
        { text = "I'm kaldorei too.", next = "BACK", when = { race = "NightElf" }, reply = "Then you know the grey of this place hides more than it shows. Welcome home, or near enough." },
        { text = "What did Auberdine look like before?", next = "w_before" },
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
    w_before = {
      lines = {
        { id = "w_before_default", text = "Smaller, and brighter, and full of the smell of kelp drying on the racks. Children swam off the long pier in summer, and nobody worried about what was under the water, and the lamps were for beauty and not for keeping things out." },
      },
      choices = {
        { text = "Do the children still swim?", next = "w_before2" },
        { text = "It sounds like a lovely town.", next = "w_before2" },
      },
    },
    w_before2 = {
      lines = {
        { id = "w_before2_default", text = "Not anymore. Sentinel Glynda forbade it after a boy was pulled under by something near the shallows, and the Sentinels brought him back, but he does not talk about it. Now the children watch the water from the dock, the way I do." },
      },
      choices = {
        { text = "One day they'll swim again.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Yalda.", next = "BACK" },
      },
    },
  },
  topics = {
    menethil = { { id = "tp_ymenethil", text = "The boat to Menethil Harbor goes south across the sea. My brother took it once." } },
    murlocs = { { id = "tp_ymurlocs", text = "The murlocs build their huts nearer every year. They are noisy neighbours." } },
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
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend, softly now. The Ancient remembers you kindly, and so do I. What can I find for you?" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Softly. The Ancient is thinking. Buy what you need, and please be quick about it." },
    { id = "g_default", text = "Ishnu-alah, and softly, please. The Ancient is thinking, and I would not like to be the reason he stops." },
    { id = "g_back", when = { metBefore = true }, text = "You are back at the grove, {class}. Onu has moved one root since you left, so it has been a busy season." },
    { id = "yg_0", when = { race = "Gnome" }, text = "A gnome, at the grove? Softly, little one. Your people tick, and Onu can hear it." },
  },
  notice = {
    { id = "n_craft", cat = "profession", when = { profession = { "Tailoring", "Leatherworking", "Alchemy", "Herbalism" } },
      text = "You work a craft, I think, for your fingers are stained with it. Travellers of your sort are the reason I keep a shop this far down the coast." },
  },
  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I was a weaver in Darnassus, once, and a good one. Then I came south to rest, and Onu asked me to stay. I opened a shop because I could not sit idle, and I have been here a hundred years. It does not feel like it." },
      },
      choices = {
        { text = "Onu deserves our quiet and our respect.", next = "BACK", reply = "Yes. He is very old, and very wise. Thank you for understanding.", fx = { align = { order = 1 } } },
        { text = "An Ancient's just a tree that talks.", next = "BACK", reply = "Shh! Please, go, before he hears you.", fx = { align = { order = -1 } } },
        { text = "Do you miss weaving?", next = "y_weave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_weave = {
      lines = {
        { id = "y_y_weave", text = "I still weave, in the evenings, when the light is low and the grove is quiet. I am making a tapestry of the coast, as it was before the Sundering. My grandmother described it to me. I do not know if I am getting it right." },
        { id = "y_y_weave_v0", when = { profession = "Tailoring" }, text = "I still weave, as you would understand. I am making a tapestry of the coast before the Sundering, from my grandmother's stories." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_twilight = {
      lines = {
        { id = "y_y_twilight", text = "The Twilight's Hammer frighten me more than the furbolgs. Furbolgs are mad, but they are only mad. The cultists choose ruin, and they choose it carefully. Onu says they are digging for something under the Master's Glaive." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "Some say the grove should be warded and closed, so the cultists cannot reach Onu. Others say Onu must be open to all who need him. Which is right?" },
      },
      choices = {
        { text = "Keep the grove open. Onu is for everyone.", next = "BACK", reply = "That is what Onu himself says. I am glad you agree.", fx = { align = { order = 1 } } },
        { text = "Close it. Protect Onu at all costs.", next = "BACK", reply = "Perhaps. I worry, too. But I do not think Onu would allow it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "How did you come to the grove?", next = "y_hist" },
        { text = "Do the Twilight's Hammer frighten you?", next = "y_twilight" },
        { text = "Should the grove be closed?", next = "y_stance" },
        { text = "I'm a druid. How is Onu?", next = "BACK", when = { class = "DRUID" }, reply = "Troubled, as you would expect. Speak to him. He will be glad of a druid's ear." },
        { text = "What do you weave in the evenings?", next = "w_weave" },
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
    w_weave = {
      lines = {
        { id = "w_weave_default", text = "A long band, as wide as my hand, with a little picture of the grove for every season I have lived here. Onu in the spring, the furbolgs in the autumn before they changed, and now the cultists' fires in the south, in grey thread." },
      },
      choices = {
        { text = "Why put the fires in it?", next = "w_weave2" },
        { text = "It must be very long by now.", next = "w_weave2" },
      },
    },
    w_weave2 = {
      lines = {
        { id = "w_weave2_default", text = "Because a weaving that leaves out the sad parts is a lie, and Onu taught me that the grove remembers everything. If the fires go out one day, I shall weave that too, in the brightest green I have." },
        { id = "w_weave2_w1", when = { profession = "Tailoring" }, text = "You work cloth yourself, so you will know: grey is the hardest colour to weave beautifully. I have been trying for years." },
      },
      choices = {
        { text = "Weave the green soon.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Ullanna.", next = "BACK" },
      },
    },
  },
  topics = {
    darnassus = { { id = "tp_ydarnassus", text = "I was a weaver in Darnassus, long ago. I have not been back in a century." } },
    masters_glaive = { { id = "tp_ymasters_glaive", text = "The Master's Glaive, to the south. Old, cursed, and full of cultists." } },
    background = { { id = "tp_bg", text = "I came to the grove to rest a season, long ago, and opened a shop instead. Onu did not object, which I took for a welcome." } },
    twilights_hammer = { { id = "tp_tw", text = "A cult that worships ruin. Onu has an eye on them at the Master's Glaive, and so should the Sentinels." } },
    _none = { { id = "tp_none", text = "I only keep thread and vials, friend. Put that to Onu, if you have the patience to wait for his answer." } },
  },
}
