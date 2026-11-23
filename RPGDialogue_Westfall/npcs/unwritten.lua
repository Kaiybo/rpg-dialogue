-- People's Militia protectors with no conversation yet: Protector Dorana (patrols to Saldean's
-- Farm), Protector Korelor (patrols to the Molsen farm), Protector Deni (by the mill on Sentinel
-- Hill) and Protector Leick (by the lumber pile at the foot of the hill).
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Protector Dorana: patrols the road from Sentinel Hill to Saldean's Farm.
P:NPC {
  key = "wfl_protector_dorana", id = TODO_NPC("Protector Dorana"), name = "Protector Dorana", title = "The People's Militia", gender = "female",
  role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "brisk", "stern" }, values = { "dutiful", "practical" },
  notices = { "watch", "travel" },
  impression = {
    first = "She walks the Saldean road and hates the scarecrows on it.",
    third = "{name} met Protector Dorana of the People's Militia, who patrols the road to Saldean's Farm.",
  },
  greetings = {
    { id = "g_default", text = "Keep walking if you're going my way, {class}. I don't stop on this road, and neither should you." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Walk with me a stretch, then, but keep your eyes on the fields." },
  },
  notice = {
    { id = "n_low", cat = "travel", when = { maxLevel = 12 },
      text = "You're a bit green for Westfall. Stay on the road between the farms and leave the Defias camps to the militia." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Protector Dorana, People's Militia. I walk from Sentinel Hill to Saldean's Farm and back, all day long, so the Saldeans know somebody's watching their road.", fx = { learn = { "people_militia" } } } },
      again = {
        { id = "h_again", text = "What else? Talk while we walk." },
        { id = "h_again2", text = "Go on, I'm listening, but I'm not stopping." },
      },
      choices = {
        { text = "What's the danger on this road?", next = "danger" },
        { text = "How are the Saldeans holding up?", next = "saldeans" },
        { text = "Those scarecrows give me the creeps.", next = "scarecrows" },
        { text = "Safe patrol, Protector.", next = "END" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "Defias footpads, gnolls up from the coast, and the odd hungry coyote, though the coyotes at least don't steal. The Brotherhood likes to hit lone carts on this stretch, which is why I walk it.", fx = { learn = { "defias" } } } },
      choices = {
        { text = "The Defias were farmers once, like you.", next = "farmers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmers = {
      lines = { { id = "f_default", text = "Some were, and some I grew up with, and that's the part that stings. They chose the mask, though, and they rob the folk who stayed and kept their hands clean." } },
      choices = {
        { text = "They had no choice when the crown abandoned them.", next = "BACK", reply = "Everyone had a choice. I had the same one, and I picked up a spear instead of a mask.", fx = { align = { order = -1 } } },
        { text = "Then they get no mercy from me.", next = "BACK", reply = "Good, because they'll show you none. Still, try not to enjoy it.", fx = { align = { order = 1 } } },
      },
    },
    saldeans = {
      lines = { { id = "s_default", text = "Farmer Saldean's stubborn as an old mule, and Salma's twice as stubborn, so they're holding. They've lost workers to the Brotherhood and crops to the gnolls, but they've not lost their farm, and they mean to keep it." } },
      choices = { { text = "Stubbornness is a virtue out here. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    scarecrows = {
      lines = { { id = "sc_default", text = "They should, because they walk. The Defias put some kind of machinery or magic in them, and they swing their scythes at anyone who gets close, so I knock one down every time I pass and there's always another.", fx = { learn = { "harvest_watchers" } } } },
      choices = { { text = "I'll knock down a few myself. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I worked a farm south of here till the Brotherhood burned it. Now I guard other people's farms, which is better than nothing." } },
    _none = { { id = "tp_none", text = "No idea. Ask at the tower; Stoutmantle knows more than I do, or likes to think he does." } },
  },
}

-- Protector Korelor: patrols the road between Sentinel Hill and the Molsen farm.
P:NPC {
  key = "wfl_protector_korelor", id = TODO_NPC("Protector Korelor"), name = "Protector Korelor", title = "The People's Militia", gender = "male",
  role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "gruff", "weary" }, values = { "dutiful" },
  notices = { "watch", "kit" },
  impression = {
    first = "He walks to an empty farm and back, every single day.",
    third = "{name} met Protector Korelor of the People's Militia, who patrols the road to the Molsen farm.",
  },
  greetings = {
    { id = "g_default", text = "Hold up, {class}. This road runs out to the Molsen place, and there's nothing out there but trouble now." },
    { id = "g_back", when = { metBefore = true }, text = "Back on my road, are you? Fine, but don't wander past the Molsen fence without good reason." },
  },
  notice = {
    { id = "n_hurt", cat = "kit", when = { health = { max = 0.4 } },
      text = "You're bleeding. Get yourself up to the hill and see someone before you fall over in the dust." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Protector Korelor, People's Militia. I walk the road out to the Molsen farm and back, and every day I hope I'll find somebody there who belongs." } },
      again = {
        { id = "h_again", text = "Anything else? Ask, then I've got to keep moving." },
        { id = "h_again2", text = "Go on. The road isn't going anywhere." },
      },
      choices = {
        { text = "What happened to the Molsens?", next = "molsens" },
        { text = "Why walk to an empty farm?", next = "why" },
        { text = "Safe walking, Korelor.", next = "END" },
      },
    },
    molsens = {
      lines = { { id = "m_default", text = "They left when the Brotherhood made the farm too dangerous to work, and the Defias moved into the fields after them. Now there's masked men in the barn and harvest golems in the crops, and the Molsens are somewhere in Stormwind, poorer than they ever were." } },
      choices = {
        { text = "Could the militia take it back?", next = "back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "With what, a dozen farmers and a few spears? Stoutmantle's got us stretched thin over half of Westfall, and we hold what we can. If you want to clear the Molsen fields, I'll not stop you, and I'll be glad of it." } },
      choices = {
        { text = "Stormwind should send soldiers to help.", next = "BACK", reply = "Stormwind should do a lot of things, and Stormwind doesn't. That's why there's a militia.", fx = { align = { order = 1 } } },
        { text = "Westfall doesn't need the crown. It has you.", next = "BACK", reply = "Kind words, but a few more spears wouldn't hurt. Still, we'll manage.", fx = { align = { order = -1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because if the Brotherhood thinks nobody's watching, they'll push their camps right up to the hill. Every time I walk out there, I'm telling them we haven't given up, and they hate that." } },
      choices = { { text = "Then keep walking. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Farmhand most of my life. Joined the militia when there weren't any farms left to work." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Gryan, up at the tower." } },
  },
}

-- Protector Deni: stands outside the mill on Sentinel Hill.
P:NPC {
  key = "wfl_protector_deni", id = TODO_NPC("Protector Deni"), name = "Protector Deni", title = "The People's Militia", gender = "female",
  role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "warm", "watchful" }, values = { "family", "dutiful" },
  notices = { "watch", "travel" },
  impression = {
    first = "She guards the mill because it feeds the hill.",
    third = "{name} met Protector Deni of the People's Militia, who guards the mill on Sentinel Hill.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Sentinel Hill, {class}. The mill's behind me, and so are the people who depend on it, so mind your manners." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again. The mill's still turning, which is something to be thankful for out here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Protector Deni, People's Militia. I watch the mill, because what little grain Westfall still grows comes through it, and the Brotherhood would love to burn it." } },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
        { id = "h_again2", text = "Go on, ask. It's a quiet hour." },
      },
      choices = {
        { text = "Why would the Defias burn a mill?", next = "burn" },
        { text = "How do the refugees here get by?", next = "refugees" },
        { text = "Good day, Protector.", next = "END" },
      },
    },
    burn = {
      lines = { { id = "b_default", text = "Because hungry people are easier to recruit, and Van Cleef knows it. Burn the mill and every family on this hill has to choose between starving and taking up the red mask.", fx = { learn = { "defias" } } } },
      choices = {
        { text = "Then the mill matters more than any wall.", next = "BACK", reply = "Exactly. Stoutmantle understood that before anyone, and that's why I'm here.", fx = { align = { light = 1 } } },
        { text = "Burn their camps first, then. Make them hungry.", next = "BACK", reply = "Some of the militia say that, and maybe they're right. I'll still guard the mill.", fx = { align = { light = -1 } } },
      },
    },
    refugees = {
      lines = { { id = "r_default", text = "Barely, but together, which counts for a lot. Families share their bread, the militia shares its watch, and Gryan Stoutmantle shares every coin he can scrape up, so nobody's left out in the cold." } },
      choices = {
        { text = "Who's in charge of the hill?", next = "gryan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gryan = {
      lines = { { id = "g_default", text = "Gryan Stoutmantle, in the tower at the top of the hill. He fought for Stormwind once, and when Stormwind forgot Westfall, he didn't." } },
      choices = { { text = "I'll pay him a visit. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Grew up a miller's daughter in Moonbrook, before the Brotherhood came. Now I guard someone else's mill." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Try Stoutmantle, or the scouts." } },
  },
}

-- Protector Leick: stands by the lumber at the foot of Sentinel Hill.
P:NPC {
  key = "wfl_protector_leick", id = TODO_NPC("Protector Leick"), name = "Protector Leick", title = "The People's Militia", gender = "male",
  role = "soldier", tier = "service",
  communities = { "sentinel_hill" }, temper = { "jovial", "wry" }, values = { "practical" },
  notices = { "craft", "watch" },
  impression = {
    first = "He guards a woodpile and jokes about it constantly.",
    third = "{name} met Protector Leick of the People's Militia, who guards the lumber at the foot of Sentinel Hill.",
  },
  greetings = {
    { id = "g_default", text = "Afternoon, {class}. Welcome to the most important woodpile in all of Westfall, or so they tell me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The wood's still here, I'm proud to report." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Protector Leick, People's Militia, and guardian of the lumber. Laugh if you like, but every wall and roof on this hill came out of this pile." } },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere, as you can see." },
        { id = "h_again2", text = "Ask away. The wood doesn't talk back much." },
      },
      choices = {
        { text = "Why guard lumber?", next = "lumber" },
        { text = "Where does the wood come from?", next = "source" },
        { text = "Good luck with the pile.", next = "END" },
      },
    },
    lumber = {
      lines = { { id = "l_default", text = "Because the Defias need wood too, for their ships and their stockades down in the Deadmines. Every plank they steal from us is one less roof over a family's head and one more mast on Van Cleef's boat.", fx = { learn = { "deadmines" } } } },
      choices = {
        { text = "They have a ship?", next = "ship" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ship = {
      lines = { { id = "s_default", text = "That's the rumour, a great ship hidden deep in the mines, though nobody who's seen it has come back to describe it properly. Sounds like madness to me, but the Brotherhood's full of stonemasons with grudges and time on their hands." } },
      choices = {
        { text = "The masons were cheated. I'd be angry too.", next = "BACK", reply = "Aye, and so would I, but I wouldn't build a pirate ship about it.", fx = { align = { order = -1 } } },
        { text = "A grudge is no excuse for banditry.", next = "BACK", reply = "Agreed, though try telling that to a man with no pay and a hammer.", fx = { align = { order = 1 } } },
      },
    },
    source = {
      lines = { { id = "so_default", text = "Whatever we can cut down the coast and drag up here without getting robbed on the way. Westfall's never had much forest, so every log's precious, and I count them twice a day." } },
      choices = { { text = "That's dedication. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a carpenter in Moonbrook. Now I'm a guard for the wood I'd rather be working." } },
    _none = { { id = "tp_none", text = "No idea, friend. I just watch the wood." } },
  },
}

-- Elder Skychaser: a tauren ancestor-spirit atop Sentinel Tower during the Lunar Festival.
P:NPC {
  key = "wfl_elder_skychaser", id = 15577, name = "Elder Skychaser", gender = "female",
  role = "elder", tier = "quest",
  temper = { "gentle", "curious" }, values = { "memory", "the land" },
  notices = { "race" },
  impression = {
    first = "An old tauren spirit stands at the top of Sentinel Tower, gazing over the empty fields.",
    third = "{name} climbed Sentinel Tower to honour Elder Skychaser at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a visitor. You climbed a long way, little one, and I am glad of it." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The new moon of the year is upon us, and the Lunar Festival with it. Few walk this far to honor an elder, and I will not forget it." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the tower. The wind is kinder up here than down among the fields." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Skychaser the Elder") }, text = "You seek the elders, I see. Come, the Earth Mother's blessing is yours." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" }, text = "A human, come to honour a tauren spirit. The festival makes strange friends, and good ones." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "A shu'halo in the heart of human lands! You walked a dangerous road to find me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Skychaser, and in life I watched the skies over the plains of Kalimdor. At the Lunar Festival my spirit wanders, and this year it brought me to a tower in a land I never knew." } },
      again = {
        { id = "h_again", text = "Ask on, little one. I have time enough." },
        { id = "h_again2", text = "What else stirs in your heart?" },
      },
      choices = {
        { text = "A tauren spirit in human lands is strange.", next = "strange" },
        { text = "What do you see from up here?", next = "fields" },
        { text = "Tell me of the Lunar Festival.", next = "festival" },
        { text = "These are my people's farms, Elder.", next = "farms", when = { race = "Human" } },
        { text = "Farewell, Elder.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "The dead are not bound by borders, child. The moon shines on Alliance and Horde alike, and the ancestors go where they are needed." } },
      choices = { { text = "That's a kind way to see it. Something else.", next = "BACK" } },
    },
    fields = {
      lines = { { id = "f_default", text = "Fields gone to weeds and farmhouses standing empty. The land is sad here, and it remembers when it was tended with love." } },
      choices = {
        { text = "What happened to the farmers?", next = "farmers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmers = {
      lines = { { id = "fa_default", text = "The soldiers at the foot of this tower speak of thieves in red masks and hungry folk driven from their homes. The People's Militia tries to hold what remains." } },
      choices = {
        { text = "The Defias must be crushed.", next = "BACK", reply = "Perhaps. But remember why they grew so many.", fx = { align = { order = 1 } } },
        { text = "Stormwind failed these people first.", next = "BACK", reply = "Hm. A hard truth, if it is true.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "fe_default", text = "It is when the living remember us and we bless them in turn. The heart of it lies in Moonglade, where the druids keep the old rites." } },
      choices = { { text = "I'll seek the other elders too. Something else.", next = "BACK" } },
    },
    farms = {
      lines = { { id = "fm_default", text = "Then I pray they bloom again. The land wants to give, child; it only needs hands willing to work it." } },
      choices = { { text = "I'll do what I can. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A tauren elder who once watched the stars over Kalimdor, and now wanders at the festival." } },
    _none = { { id = "tp_none", text = "I cannot say, child. Ask the soldiers below." } },
  },
}
