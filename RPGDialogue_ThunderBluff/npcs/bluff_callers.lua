-- Voices that call people onward from the bluffs: Xanis Flameweaver, who sends young shaman to
-- their elements; Bluff Runner Windstrider, the town crier; and Ghede, barking at soil piles on
-- the Elder Rise. Voices: bibles/bluff_callers.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Xanis Flameweaver: sends shaman out to Kranal, Islen and Prate.
---------------------------------------------------------------------------
P:NPC {
  key = "xanis", id = TODO_NPC("Xanis Flameweaver"), name = "Xanis Flameweaver",
  bible = "bibles/bluff_callers.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "warm", "calm" }, values = { "loyal", "honest" },
  notices = { "class", "race" },
  impression = {
    first = "He knows a shaman is ready before they do.",
    third = "{name} met Xanis Flameweaver, a shaman on Thunder Bluff's Spirit Rise who sends young shaman to their elements.",
  },

  greetings = {
    { id = "g_hi", text = "Sit by the fire a while, {class}. It has been burning since morning and it likes company." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "The earth is steady under you now, I can see it in the way you stand. Come, let us talk about what comes next." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc", class = "SHAMAN" },
      text = "An orc shaman, here on the Spirit Rise. Thrall's people relearned the elements from us and from their own grandmothers both, and I'm glad to see it." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "The fire leans away from you, stranger. It knows the other kind of flame when it smells it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Xanis Flameweaver, and I tend the fire on the Spirit Rise and the young shaman who come to sit by it. Earth, fire, water and air each teach a different lesson, and none of them teach it gently." },
        { id = "h_fire", when = { class = "SHAMAN", minLevel = 10, questBefore = TODO_QUEST("Call of Fire") },
          text = "Long has it been since you were last tested, {name}, and I think you are strong enough in the ways of earth to learn fire. Find Kranal Fiss in the Barrens, north of the Crossroads, and tell him I sent you." },
        { id = "h_water", when = { class = "SHAMAN", minLevel = 20, questDone = TODO_QUEST("Call of Fire"), questBefore = TODO_QUEST("Call of Water") },
          text = "Your spirit is already warmed by fire, so it is time to learn about the purity of water. Islen Waterseer keeps a fishing hut on the Barrens coast, south of Ratchet, and she is waiting for you, whether she knows it or not." },
        { id = "h_air", when = { class = "SHAMAN", minLevel = 30, questBefore = TODO_QUEST("Call of Air") },
          text = "The winds of Kalimdor rush to meet you now, and air is the hardest element to hold. Go to the very south of the Barrens and into Thousand Needles, and find Prate Cloudseer." },
      },
      again = {
        { id = "h_again", text = "What else? The fire isn't going anywhere, and neither am I." },
        { id = "h_again2", text = "Speak, {class}. The flames are listening too." },
      },
      choices = {
        { text = "What does each element teach?", next = "elements" },
        { text = "Why do they call you Flameweaver?", next = "name" },
        { text = "What is the Spirit Rise?", next = "rise" },
        { text = "Tell me about Kranal Fiss.", next = "kranal", when = { class = "SHAMAN" } },
        { text = "Tell me about Islen Waterseer.", next = "islen", when = { class = "SHAMAN", minLevel = 20 } },
        { text = "What happens to a shaman who fails a trial?", next = "fail" },
        { text = "Your fire burns without wood.", next = "nowood" },
        { text = "Thrall taught the orcs the old ways again.", next = "thrall_ways", when = { race = "Orc" } },
        { text = "I'll leave you to your fire.", next = "END" },
      },
    },
    fail = {
      lines = { { id = "fail_d", text = "They come back to the fire, and they sit with it, and they try again. The elements do not punish failure, {class}, but they do not forget it either, and the second trial is always harder than the first." } },
      choices = {
        { text = "Harder? Why?", next = "fail_harder" },
        { text = "So failure is only a lesson.", next = "BACK", reply = "It is, if you learn it. If you do not, it becomes a habit." },
        { text = "Something else.", next = "BACK" },
      },
    },
    fail_harder = {
      lines = { { id = "fail_harder_d", text = "Because the shaman now knows what failure feels like, and the fear of it sits in the heart like a stone. The elements test the heart before they test the hands, and a frightened heart is the hardest thing in the world to calm." } },
      choices = {
        { text = "Then I'll calm my heart first.", next = "BACK", reply = "That is the whole of the lesson, said in a breath." },
        { text = "Another question.", next = "BACK" },
      },
    },
    nowood = {
      lines = { { id = "nowood_d", text = "It burns on the spirit of fire, which I have asked to stay with me. The wood is only for those who cannot speak to the flame, and once you can, you will never need to gather kindling again." } },
      choices = {
        { text = "Can anyone learn to do it?", next = "nowood_learn" },
        { text = "That must save you a great deal of trouble.", next = "BACK", reply = "It does, though I sometimes miss the smell of cedar." },
        { text = "Something else.", next = "BACK" },
      },
    },
    nowood_learn = {
      lines = { { id = "nowood_learn_d", text = "Any shaman who has earned the fire, yes. But a shaman who asks the flame to stay must also be willing to let it go, and that is harder than it sounds, for fire loves to be kept." } },
      choices = {
        { text = "Fire loves to be kept. I'll remember.", next = "BACK" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    thrall_ways = {
      lines = { { id = "thrall_ways_d", text = "He did, and the elements were glad of it. The orcs forgot the spirits when the demons came to them, and Thrall brought them back, and now orc and tauren sit by the same fire and learn the same lessons." } },
      choices = {
        { text = "The spirits forgive, then.", next = "BACK", reply = "They forgive those who return. That is all they have ever asked." },
        { text = "Something else.", next = "BACK" },
      },
    },
    elements = {
      lines = { { id = "el_default", text = "Earth teaches patience and stubbornness, fire teaches that destruction and creation are one breath, water teaches renewal, and air teaches that nothing can be held for long. A shaman who learns only one lesson is a danger to everyone near him." } },
      choices = {
        { text = "Fire seems the most dangerous lesson.", next = "fire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire = {
      big = true,
      lines = { { id = "fi_default", text = "It is the one young shaman love best and understand least. Some think fire must be mastered and held tight, and others say it must be let run, because a fire held too tightly goes out." } },
      choices = {
        { text = "A shaman must master the fire, always.", next = "BACK", reply = "Many shaman have said so, and the fire has burned many of them for it. Hold it firmly if you must, but never so tightly that it has nothing left to give you.", fx = { align = { order = 1 } } },
        { text = "Fire has to run free, or it isn't fire.", next = "BACK", reply = "You speak like someone the fire has already chosen. Let it run, then, but run beside it, or you will find it has run straight through your village.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "When I was young I tried to weave a fire into a rope to show off for a girl at Bloodhoof, and I burned down half her family's tent. The name was a joke, and then it stuck, and now the young ones think it means something grand." } },
      choices = { { text = "Something else, Xanis.", next = "BACK" } },
    },
    rise = {
      lines = { { id = "ri_default", text = "The Spirit Rise is where we keep the Pools of Vision and where the dead are remembered, and lately it is also where the Forsaken come to study with the shaman. Some of the elders don't like that, but the spirits haven't complained." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kranal = {
      lines = { { id = "kr_default", text = "Kranal Fiss is an orc who lives north of the Crossroads, strong in the ways of the elements and stronger in his opinions. He will send you to Telf Joolam at the Shrine of the Dormant Flame in Durotar, and then you'll walk a long way for a little fire." } },
      choices = { { text = "Something else, Xanis.", next = "BACK" } },
    },
    islen = {
      lines = { { id = "is_default", text = "Islen Waterseer is the oldest friend I have, and the spirits of water listen to her the way children listen to a grandmother. She lives alone on the coast, among the humans' patrols, and she says she has never once been afraid of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I walked the four elements when the tauren still wandered, and I've been sending others after them ever since." } },
    advice = { { id = "tp_ad", text = "Never call on an element you haven't thanked, {class}. They remember rudeness longer than we do." } },
    _none = { { id = "tp_none", text = "The fire hasn't told me about that, and I haven't asked it." } },
  },
}

---------------------------------------------------------------------------
-- Bluff Runner Windstrider: Thunder Bluff's town crier.
---------------------------------------------------------------------------
P:NPC {
  key = "windstrider", id = TODO_NPC("Bluff Runner Windstrider"), name = "Bluff Runner Windstrider",
  bible = "bibles/bluff_callers.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "cheerful", "proud" }, values = { "loyal" },
  notices = { "class", "weary" },
  impression = {
    first = "He is breathless, cheerful and very proud of how fast he is.",
    third = "{name} met Bluff Runner Windstrider, the town crier of Thunder Bluff.",
  },

  greetings = {
    { id = "g_hi", text = "Hear ye, hero, hear ye! I've fresh news from both continents and further besides, and it's yours for the listening!" },
    { id = "g_back", when = { metBefore = true }, text = "You again! I've run the rises twice since we last spoke, and there's fresh news, I promise." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { minLevel = 20 },
      text = "You look like you've walked further than I've run, and I've run a long way. Where have you been?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Bluff Runner Windstrider, and I carry word from the lifts to the rises and back again faster than anyone on the bluff. The Horde is pushing outward on every side, and every outpost wants strong hands." },
        { id = "h_young", when = { minLevel = 20, maxLevel = 30 },
          text = "Attention, young adventurer! The wilds of Ashenvale await you, and the Horde has outposts at Splintertree and on the Zoram Strand. Senani Thunderheart at Splintertree Post is looking for those who would join the hunt." },
        { id = "h_feralas", when = { minLevel = 40, maxLevel = 50 },
          text = "News from the south! Camp Mojache stands in Feralas now, and the frontier there is wide open for those with the nerve for it." },
        { id = "h_plague", when = { minLevel = 50 },
          text = "A call to arms! The Plaguelands need every strong arm the Horde can send, and the Forsaken would welcome help against the Scourge." },
      },
      again = {
        { id = "h_again", text = "More news? I have plenty, and I talk as fast as I run!" },
        { id = "h_again2", text = "Ask me anything, hero, I've heard it all this morning." },
      },
      choices = {
        { text = "What's the news from Ashenvale?", next = "ashenvale" },
        { text = "What's happening in Feralas?", next = "feralas" },
        { text = "What about the Plaguelands?", next = "plague" },
        { text = "What exactly is a Bluff Runner?", next = "runner" },
        { text = "I could run these rises faster than you.", next = "race", when = { race = "Tauren" } },
        { text = "Is there any word out of Orgrimmar?", next = "org", when = { race = { "Orc", "Troll" } } },
        { text = "Do you carry news down to the Pools of Vision?", next = "pools", when = { race = "Scourge" } },
        { text = "Thanks for the news.", next = "END" },
      },
    },
    ashenvale = {
      lines = { { id = "as_default", text = "Splintertree Post stands strong north of the Barrens, and the Warsong cut timber for the Horde under the night elves' very noses. Senani Thunderheart runs a hunt there for those who want to prove themselves, and she's always short of hunters." } },
      choices = {
        { text = "Should we be cutting the night elves' forest?", next = "forest" },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    forest = {
      big = true,
      lines = { { id = "fo_default", text = "The elders argue about it every evening, and I only carry the news, I don't choose it. The Warchief says the Horde needs timber to live, and the night elves say every tree is sacred, and somebody always ends up dead." } },
      choices = {
        { text = "The Horde needs timber. Ashenvale has plenty.", next = "BACK", reply = "Many in the Horde agree, and the Warchief must feed and house his people. Only remember that the sentinels count every tree, and they count the dead as well.", fx = { align = { light = -1 } } },
        { text = "We should leave their forest alone.", next = "BACK", reply = "Some of the elders would cheer to hear you, and some would call you soft. I only cry the news, but I would be glad to cry less of it from Ashenvale.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    feralas = {
      lines = { { id = "fe_default", text = "Camp Mojache stands among the Grimtotem's old haunts and the ogres of Dire Maul, and they say the forests there grow trees taller than the bluff. It's a new frontier, and the Horde wants it held." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    plague = {
      lines = { { id = "pl_default", text = "The Scourge still holds the east of Lordaeron, and the Forsaken fight it every day from their outposts. The Horde has called for heroes to go and help, and those who return speak of it very quietly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    runner = {
      lines = { { id = "ru_default", text = "We carry word up and down the rises, because the lifts are slow and the elders are impatient. I've run from the Elder Rise to the Hunter Rise and back before the kettle boiled, and I'll do it again for anyone who doubts me." } },
      choices = {
        { text = "I doubt you.", next = "doubt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    doubt = {
      lines = { { id = "do_default", text = "Then watch the Hunter Rise bridge at sunset, hero, and you'll see a blur, and that blur will be me. I won't wave, though, because the wind would knock me clean off the bridge." } },
      choices = { { text = "Something else, Windstrider.", next = "BACK" } },
    },
    race = {
      lines = {
        { id = "race_d", text = "Ha! Every calf on the bluff says so, and every one of them is bent double by the second bridge. Meet me at the totem on the high rise at dawn some day, and we will see which of us still has breath to call the news at the far end." },
      },
      choices = {
        { text = "At dawn, then. Bring water.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    org = {
      lines = {
        { id = "org_d", text = "Always, and it comes in faster than I can call it. The Warchief's riders say the city grows by the week, and that there is work for every pair of hands in the Barrens and beyond, so nobody up here need sit idle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pools = {
      lines = {
        { id = "pools_d", text = "As far as the top of the ramp, and then I shout it down. Your apothecaries listen politely and never ask me to repeat anything, which makes them the best audience on the bluff." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I ran messages for Cairne's war bands when we still lived on the plains. The bluff is smaller, but the stairs are worse." } },
    advice = { { id = "tp_ad", text = "Never stop at the top of a lift to catch your breath, hero, someone will always walk into you." } },
    _none = { { id = "tp_none", text = "No news on that, I'm afraid, but ask me tomorrow, because I'll have run past someone who knows." } },
  },
}

---------------------------------------------------------------------------
-- Ghede: barks at Un'Goro soil on the Elder Rise for the Cenarion Circle.
---------------------------------------------------------------------------
P:NPC {
  key = "ghede", id = TODO_NPC("Ghede"), name = "Ghede",
  bible = "bibles/bluff_callers.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "gruff", "sharp" }, values = { "practical", "loyal" },
  notices = { "class", "kit" },
  impression = {
    first = "He calls everyone Private and is sarcastic about everything.",
    third = "{name} met Ghede, who keeps the Cenarion Circle's Un'Goro soil piles on Thunder Bluff's Elder Rise.",
  },

  greetings = {
    { id = "g_hi", text = "You there, Private! Don't just stand there admiring my dirt, it won't pile itself." },
    { id = "g_soil", when = { questActive = TODO_QUEST("Un'Goro Soil") }, text = "Twenty samples, Private, not nineteen, not twenty-one, and dirt from Un'Goro, not dirt from my own rise." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, so you're one of Hamuul's, and you'll want to tell me how to pile soil properly. Don't." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear's in tatters, Private. Did somebody's dirt fight back?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ghede, and I keep the Circle's soil on this rise, because somebody has to, and the druids are too busy thinking. Arch Druid Runetotem wants Un'Goro soil studied in large quantities, and large quantities need someone shouting at them." },
        { id = "h_done", when = { questDone = TODO_QUEST("Un'Goro Soil") },
          text = "Oh, splendid work, Private {name}, dropping the sacks at the bottom and leaving me to haul them up! I suppose the Great Spirits will carry them for me, will they? Go on, the Arch Druid wants a word with you." },
      },
      again = {
        { id = "h_again", text = "Still here, Private? Ask, then, and quickly." },
        { id = "h_again2", text = "Well? The dirt's waiting, and so am I." },
      },
      choices = {
        { text = "Why does the Circle want dirt?", next = "soil" },
        { text = "Why do you call me Private?", next = "private" },
        { text = "Do you want help with the piles?", next = "piles" },
        { text = "Hamuul's druids sent me to help.", next = "druids", when = { class = "DRUID" } },
        { text = "How long have you been hauling dirt?", next = "howlong" },
        { text = "You seem to enjoy complaining.", next = "complain" },
        { text = "I'll get out of your way.", next = "END" },
      },
    },
    howlong = {
      lines = { { id = "howlong_d", text = "Since the Circle decided that Un'Goro soil was the key to everything, Private, which feels like forever. Every sack comes up the lifts from the crater by caravan, and every sack is heavier than the last, and every one of them is mine to sort." } },
      choices = {
        { text = "Why Un'Goro soil, of all things?", next = "howlong_ungoro" },
        { text = "That's a lot of dirt.", next = "BACK", reply = "Oh, you noticed! I'll have them carve that on my grave." },
        { text = "Something else.", next = "BACK" },
      },
    },
    howlong_ungoro = {
      lines = { { id = "howlong_ungoro_d", text = "Because it grows things that won't grow anywhere else, Private, and the druids want to know why. They've got theories, and I've got dirt under my nails, and between us we're almost making progress." } },
      choices = {
        { text = "Almost is something.", next = "BACK", reply = "Almost is all I ever get. I'm used to it." },
        { text = "Another question.", next = "BACK" },
      },
    },
    complain = {
      lines = { { id = "complain_d", text = "Enjoy it? Private, it's the only thing that keeps me sane. If I didn't complain about the dirt, I'd have to think about it, and if I thought about it, I'd go and join the quilboar." } },
      choices = {
        { text = "You like your work, really.", next = "complain_like" },
        { text = "I'd complain too, in your place.", next = "BACK", reply = "Finally, someone with sense! I knew you'd be useful for something." },
        { text = "Something else.", next = "BACK" },
      },
    },
    complain_like = {
      lines = { { id = "complain_like_d", text = "Don't you dare tell anyone that, Private. If the druids found out I liked it, they'd give me twice as much, and I'd have nothing left to complain about." } },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    soil = {
      lines = { { id = "so_default", text = "The soil of Un'Goro Crater is enriched with magic, they say, and things grow there that grow nowhere else. The Circle thinks it can learn something from it, and I think it's dirt, but I'm not paid to think." } },
      choices = {
        { text = "What do you think they'll learn?", next = "soil2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    soil2 = {
      lines = { { id = "s2_default", text = "Hamuul talks of the land healing, and of old powers in the crater, and of things buried under Silithus that frighten even the dragons. Mostly I think he wants to grow a better squash, and I'll keep that between us." } },
      choices = { { text = "Something else, Ghede.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    private = {
      lines = { { id = "pr_default", text = "Because I drilled braves for Cairne's war bands against the centaur, and old habits are harder to kill than centaur. Everyone who carries soil for me is a private, and the soil is the sergeant." } },
      choices = {
        { text = "And what does that make you?", next = "private2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    private2 = {
      lines = { { id = "p2_default", text = "The only one on this rise who knows how to make a proper pile, Private. Don't let the druids tell you any different." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    piles = {
      big = true,
      lines = { { id = "pi_default", text = "Do I want help? Every Private who's ever dropped soil here has walked off and left me to haul it up alone, so yes, I'd like help, if you're offering, which you aren't." } },
      choices = {
        { text = "I am offering. Hand me a shovel.", next = "BACK", reply = "Well, that's a first, and I'll believe it when the dirt moves. The shovel's by the pile, and mind you don't scatter any, because the Circle counts every handful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hauling dirt is your job, not mine.", next = "BACK", reply = "There it is, same as every Private, and I'd have bet my boots on it. Go on, then, walk off, and the dirt and I will keep each other company again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druids = {
      lines = { { id = "dr_default", text = "Hamuul's druids sent you to help, did they? Then pick up a sack and stop telling me about the Emerald Dream, because the Emerald Dream doesn't carry dirt." } },
      choices = { { text = "Something else, Ghede.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Thirty years drilling braves, and now I drill dirt. The dirt listens better." } },
    advice = { { id = "tp_ad", text = "Lift with the legs, Private, not with the back. Nobody ever listens to that one." } },
    _none = { { id = "tp_none", text = "I don't know, Private, and I don't have to, because I have dirt to see to." } },
  },
}
