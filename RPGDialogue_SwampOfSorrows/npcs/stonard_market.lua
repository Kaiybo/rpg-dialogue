-- Stonard, the prisoner and the stalls: Infiltrator Marksen under guard, Rogvar the alchemist, Thultash's meat, Hartash's blades, Hekkru's stables. Voice: bibles/stonard_market.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marksen", id = TODO_NPC("Infiltrator Marksen"), name = "Infiltrator Marksen",
  bible = "bibles/stonard_market.md", role = "citizen", tier = "quest",
  communities = { "stonard" }, temper = { "nervous", "sly" }, values = { "self-preserving", "loyal" },
  notices = { "race", "faction", "drink" },

  impression = {
    first = "Infiltrator Marksen is a human spy the orcs caught near Duskwood and keep under guard in Stonard. He swears he knows something that goes beyond Alliance and Horde, and he means to trade it for his freedom.",
    third = "{name} met Infiltrator Marksen, a captured human spy held in Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Another visitor for the prisoner! Come closer, friend, the grunts don't bite unless I talk too loudly." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Either you're curious, or they've sent you to soften me up, and I don't much mind which." },
    { id = "g_scourge", when = { race = "Scourge" }, text = "Stay back! No, no, I'll keep my voice down, I swear it. Just stay where the grunts can see you." },
    { id = "g_brew", when = { questReady = TODO_QUEST("Nothing But The Truth") }, text = "Is that ale I smell? Please tell me that's ale, because it's been days since they've let me drink anything but swamp water." },
    { id = "g_after", when = { questDone = TODO_QUEST("Nothing But The Truth") }, text = "Do I know you? Your face swims at me, like something out of a fever I can't quite remember." },
  },

  notice = {
    { id = "n_alliance", cat = "faction", when = { faction = "Alliance" },
      text = "Alliance colors, here! Light above, either you're very brave or very lost, and I'll take either if it gets word out of this place." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've been drinking. I can smell it from here, and I'd trade every secret I have for a single swallow of whatever it was." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_scourge", when = { race = "Scourge" },
          text = "You're one of them. I've nothing to say to you, nothing at all, and if you've come to finish what your friends started, the orcs will want to know why." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Listen, there's no time. I was sent to watch the roads near Deadwind, and I saw something there that Stormwind needs to know, and the orcs need to know it too, strange as that sounds." },
        { id = "h_brew", when = { questReady = TODO_QUEST("Nothing But The Truth") },
          text = "A drink for me? How kind. Let me drink it down, and then I'll tell you what I've learned, because I've a feeling you're the one they'll actually listen to." },
        { id = "h_default", key = true,
          text = "Have mercy on me, friend. I have information that goes beyond Alliance and Horde, and I'm no friend to your Warchief, but there's treachery afoot that has to come out. I'll tell all of it, once someone guarantees I walk out of here alive." },
        { id = "h_after", when = { questDone = TODO_QUEST("Nothing But The Truth") },
          text = "Something happened to me, and the grunts won't say what. My hands shake, my mouth tastes of graves, and every time I reach for what I meant to tell you, it slips away like a fish." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm not going anywhere, as you can see." },
        { id = "h_again2", text = "Go on, ask. Talking is the only thing they haven't taken from me." },
      },
      choices = {
        { text = "Who are you, really?", next = "who" },
        { text = "What did you see?", next = "secret" },
        { text = "How do the orcs treat you?", next = "guards" },
        { text = "Here. Drink up, Marksen.", next = "brew", when = { questReady = TODO_QUEST("Nothing But The Truth") } },
        { text = "Before you drink, there's something you should know.", next = "warn", when = { questReady = TODO_QUEST("Nothing But The Truth") } },
        { text = "What should I tell Stormwind?", next = "word", when = { faction = "Alliance" } },
        { text = "I've heard enough.", next = "END" },
      },
    },

    who = {
      lines = {
        { id = "wh_default", text = "Marksen, an infiltrator in the service of Stormwind, which is a grand title for a man who lies in ditches and counts wagons. I was watching the old scout tower in north Duskwood when the orcs came over the hill and took me for a spy, which, to be fair, I am." },
      },
      choices = {
        { text = "What were you watching the tower for?", next = "secret" },
        { text = "A spy's life is cheap. You knew the risk.", next = "who_risk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_risk = {
      lines = {
        { id = "wr_default", text = "I knew it, aye, and I took the coin anyway, and here I am. But a cheap life is still the only one I've got, and I'd like to keep it a while longer." },
      },
      choices = {
        { text = "Every life is worth saving, even a spy's.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Then you'd better make your secret worth something.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    secret = {
      lines = {
        { id = "se_default", text = "Not yet, and not here. I'll say only that Beggar's Haunt isn't empty, and the ones using it aren't who your Warchief thinks they are. The rest waits until someone promises me a road home." },
        { id = "se_alliance", when = { faction = "Alliance" },
          text = "The old tower at Beggar's Haunt, in Duskwood, isn't empty. The Forsaken have a camp there, brewing something in the dark, and I think their own allies don't know a thing about it." },
        { id = "se_scourge", when = { race = "Scourge" },
          text = "Ask your own masters. They know better than I do, and they'd be very glad to learn how much I saw, wouldn't they?" },
      },
      choices = {
        { text = "Tell me now and I'll speak for you.", next = "secret_push" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret_push = {
      lines = {
        { id = "sp_default", text = "You might, and they might not listen, and then I've thrown away the only coin I have. I've been a spy too long to spend it on a kind face, friend, so forgive me." },
      },
      choices = {
        { text = "Smart. Keep your bargain until it pays.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Hoarding the truth won't save you. Honesty might.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    guards = {
      lines = {
        { id = "gu_default", text = "Better than I'd treat them, if I'm honest. Tharlak growls at me and Zuul pretends I'm not here, but they feed me, and nobody's cut anything off yet, which is more than the stories promised." },
      },
      choices = {
        { text = "The Horde keeps its prisoners fairly.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "They should have broken you by now.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "What do the orcs want from you?", next = "guards_want" },
      },
    },
    guards_want = {
      lines = {
        { id = "gw_default", text = "What I saw, of course, and what Stormwind's planning, which I don't know and they don't believe. They're waiting for someone with rank to come and question me properly, and I'm waiting too, and we're all getting very bored." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    brew = {
      lines = {
        { id = "br_default", text = "It's been days since they've let me drink, friend, days! Give it here, and when I've wet my throat, I'll tell you everything, because I've a feeling you're the one who'll carry it straight." },
      },
      choices = {
        { text = "Drink, then talk. The Horde needs to hear you.", next = "BUSINESS", fx = { align = { honor = -1 } } },
        { text = "I don't know what's in it. Drink at your own risk.", next = "BUSINESS", fx = { align = { honor = 1 } } },
        { text = "Here. Drink it down.", next = "BUSINESS" },
        { text = "Not yet.", next = "BACK" },
      },
    },
    warn = {
      lines = {
        { id = "wa_default", text = "Something I should know? That it's watered, I suppose, or that it came from the bottom of a barrel. I don't care, friend, I'd drink it out of a boot, so don't you dare take it away from me now." },
      },
      choices = {
        { text = "This came from the Forsaken. Don't drink it.", next = "warn_told" },
        { text = "Nothing. Enjoy it.", next = "BACK" },
      },
    },
    warn_told = {
      lines = {
        { id = "wt_default", text = "The Forsaken? Then they know I'm here, and that means they know what I saw. Light help me, I'd rather the orcs hang me than have those things reach me in the dark." },
      },
      choices = {
        { text = "Nobody deserves to die like that, not even a spy.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "I've warned you. What you do now is your own affair.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    word = {
      lines = {
        { id = "wo_default", text = "Tell Darkshire, the Night Watch, that the tower at Beggar's Haunt has new tenants and they're not ghosts. And if anyone in Stormwind asks after Marksen, say he kept his mouth shut, which is mostly true." },
      },
      choices = {
        { text = "I'll carry word to Darkshire.", next = "BACK", fx = { affinity = 2 } },
        { text = "Can't you escape?", next = "escape" },
        { text = "Something else.", next = "BACK" },
      },
    },
    escape = {
      lines = {
        { id = "es_default", text = "Through a town full of orcs and a swamp full of crocolisks, with legs that haven't walked in a week? I'd get as far as the bridge, and that's being generous to myself." },
      },
      choices = {
        { text = "Then wait. Stormwind may yet bargain for you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd risk the bridge. Waiting gets you hanged.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Stormwind trained me to listen and lie, and the orcs caught me doing both. That's all you'll get for free." } },
    advice = { { id = "tp_ad", text = "Never drink anything offered by someone who smiles too much. Don't ask me why I've been thinking about that." } },
    _none = { { id = "tp_none", text = "I don't know, and if I did, I'd be saving it for someone with a key." } },
  },
}

P:NPC {
  key = "rogvar", id = TODO_NPC("Rogvar"), name = "Rogvar",
  bible = "bibles/stonard_market.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "cheerful", "steady" }, values = { "loyal", "craft" },
  notices = { "craft", "race" },

  impression = {
    first = "Rogvar teaches alchemy in Stonard and calls the swamp the best garden in the Horde. The Warchief asked him to come here himself, and he still talks about it as if it happened yesterday.",
    third = "{name} met Rogvar, Stonard's alchemy trainer, who came to the swamp at Thrall's own request.",
  },

  greetings = {
    { id = "g_default", text = "Mind the drying racks! Everything on them is either medicine or poison, and I'm the only one who knows which." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Come to learn, or come to smell the blindweed? Both are good reasons." },
    { id = "g_alch", when = { profession = { name = "Alchemy" } }, text = "An alchemist! Sit, sit, and tell me what's bubbling in your flasks these days." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { name = "Alchemy", min = 225 } },
      text = "Your fingers are stained yellow at the tips. That's sungrass, and too much of it, so wear gloves, or you'll be yellow till winter." },
    { id = "n_herb", cat = "craft", when = { profession = { name = "Herbalism" } },
      text = "An herbalist! The swamp's thick with blindweed, if you can stand the leeches, and I pay for good stems." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "The apothecaries in Undercity do strange work, I hear. I'd like to see their notes some day, and I'd like to wash my hands afterwards." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Warchief Thrall himself asked me to come out here, and I was honored to obey, and it's no hardship at all. I couldn't have asked for a better posting than Stonard, because just about any herb I need grows in the muck here." },
        { id = "h_alch", when = { profession = { name = "Alchemy", min = 225 } },
          text = "You've come far in the craft, and I can take you further, as far as anyone in the Horde can. The swamp will give you the herbs; I'll give you the patience to use them." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk and grind at the same time." },
        { id = "h_again2", text = "Ask away, while the kettle's on." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS", when = { profession = { name = "Alchemy" } } },
        { text = "Thrall asked you personally?", next = "thrall" },
        { text = "What grows out here?", next = "herbs" },
        { text = "Where do I buy supplies?", next = "supplies" },
        { text = "Why alchemy, of all things?", next = "why" },
        { text = "Farewell, Rogvar.", next = "END" },
      },
    },
    thrall = {
      lines = {
        { id = "th_default", text = "He did, in Orgrimmar, with his own voice, and I don't think I said a sensible word back. The Horde needs healing draughts more than it needs another axe, he told me, and that the swamp was wasted on the frogs." },
      },
      choices = {
        { text = "The Warchief chose well.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = {
        { id = "he_default", text = "Blindweed in the shallows, sungrass on the high ground, and liferoot wherever the water runs a little cleaner. Half the swamp is a cure for something and the other half will kill you, and the trick is learning which half you're standing in." },
      },
      choices = {
        { text = "The swamp is a garden, if you know how to look.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "It's a sewer with a few useful weeds in it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Which half kills you?", next = "herbs_poison" },
      },
    },
    herbs_poison = {
      lines = {
        { id = "hp_default", text = "The pretty half, as usual. If a flower out here is bright and smells sweet, leave it, because it's either poison or it's feeding something that will be." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    supplies = {
      lines = {
        { id = "su_default", text = "Rartar keeps vials and the plain stock, and Thultazor has the reagents, if you can stand his prices. Tell them I sent you, and they'll still charge you full, but they'll say it more politely." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = {
        { id = "wy_default", text = "Because I watched too many grunts die of a fever after the battle was won, and an axe can't cure a fever. And you, friend, what would you brew, if you had my racks and my swamp?" },
      },
      choices = {
        { text = "Healing draughts. The Horde bleeds enough.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Poisons. Our enemies should do the bleeding.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I mixed potions in Orgrimmar until the Warchief sent me somewhere wetter. Best thing that ever happened to me." } },
    advice = { { id = "tp_ad", text = "Never taste anything to see what it is. Smell it, then ask me." } },
    _none = { { id = "tp_none", text = "Couldn't say. If it isn't growing or boiling, I don't pay it much mind." } },
  },
}

P:NPC {
  key = "thultash", id = TODO_NPC("Thultash"), name = "Thultash",
  bible = "bibles/stonard_market.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "gruff", "proud" }, values = { "practical", "generous" },
  notices = { "hunger", "race" },

  impression = {
    first = "Thultash sells meat and drink in Stonard and takes it personally if you call any of it swamp food. He smokes everything twice against the damp and argues with Tok'Kar's cooking from three miles away.",
    third = "{name} met Thultash, Stonard's meat and drink seller.",
  },

  greetings = {
    { id = "g_default", text = "Meat, smoked twice, and water boiled once, which is once more than the swamp does it. What'll it be?" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Then you've learned what everyone learns: out here, you eat what's dry or you don't eat." },
  },

  notice = {
    { id = "n_hunger", cat = "hunger", when = { resSick = true },
      text = "You look half dead, and the other half isn't much better. Eat something before you fall over in my stall." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. I've no plainsrunner here, only swamp beast, so don't look at the meat like that." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll. You'll want it spicier, I suppose, and I'll tell you what I tell everyone: the swamp is spicy enough." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thultash, and that's my meat you're smelling. Everything in the swamp rots by sundown, so I smoke it twice and salt it hard, and it'll keep in your pack longer than you'll keep in that swamp." },
      },
      again = {
        { id = "h_again", text = "Anything else, or are you buying?" },
        { id = "h_again2", text = "Ask quick, the smoke's drifting." },
      },
      choices = {
        { text = "Let me see what you've got.", next = "BUSINESS" },
        { text = "What sort of meat is it?", next = "meat" },
        { text = "How does Tok'Kar's cooking compare?", next = "tokkar" },
        { text = "How do you keep meat from rotting here?", next = "smoke" },
        { text = "Doesn't Karakul feed people at the inn?", next = "karakul" },
        { text = "Not hungry.", next = "END" },
      },
    },
    meat = {
      lines = {
        { id = "me_default", text = "Boar from the caravans when they come, and crocolisk when they don't, and you'd be surprised how few people can tell the difference once it's smoked. I never lie about it, mind, I just don't volunteer." },
      },
      choices = {
        { text = "You should tell people what they're eating.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it tastes good, nobody needs to know.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tokkar = {
      lines = {
        { id = "tk_default", text = "Tok'Kar boils everything in one pot on the beach and calls it cooking, and his soldiers eat it because they've no choice. He says the same about mine, of course, and Dar carries the insults back and forth for both of us." },
      },
      choices = {
        { text = "Who's the better cook, then?", next = "tokkar_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tokkar_better = {
      lines = {
        { id = "tb_default", text = "Me, obviously, but don't tell him I said so, because he'll come up from the beach to argue it, and then who's watching his pot?" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smoke = {
      lines = {
        { id = "sm_default", text = "Smoke it over swamp oak, which burns slow and stinks, then hang it a second night over the hearth, then salt it till it squeaks. It's two days' work for every haunch, and the swamp still tries to get into it." },
      },
      choices = {
        { text = "Two days of care. That's worth respecting.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd just eat it fast, before it turns.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    karakul = {
      lines = {
        { id = "ka_default", text = "He does, a bowl of whatever's boiling, and he buys half his meat from me to do it. We get on, because he sells the drink and I sell the meat, and neither of us has to be nice to anyone before noon." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I fed grunts in Durotar, and now I feed grunts here. Grunts are the same everywhere; it's the meat that changes." } },
    advice = { { id = "tp_ad", text = "Keep your food in waxed cloth. The swamp gets into everything else." } },
    _none = { { id = "tp_none", text = "No idea. Ask Karakul at the inn; he hears everything over his ale." } },
  },
}

P:NPC {
  key = "hartash", id = TODO_NPC("Hartash"), name = "Hartash",
  bible = "bibles/stonard_market.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "gruff", "sharp" }, values = { "craft", "proud" },
  notices = { "class", "gear" },

  impression = {
    first = "Hartash sells weapons in Stonard and spends half his day oiling them against the damp. He holds that a blade left dry in this swamp is a blade that's been cared for, and that the rest are scrap.",
    third = "{name} met Hartash, Stonard's weapon merchant.",
  },

  greetings = {
    { id = "g_default", text = "Blades, axes, maces, all oiled this morning. Touch them and you oil them again." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me see your weapon first, because I can smell the rust from here." },
  },

  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior's hands, and a warrior's notches on that edge. You've been hitting armor with it, and the armor's been winning." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. Daggers are on the left, and I count them, so keep your hands where I can see them." },
    { id = "n_gear", cat = "gear", when = { durability = { max = 0.3 } },
      text = "That weapon's on its last legs. Buy a new one or have it mended, but don't take it back into the swamp like that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hartash. I sell weapons, and in this swamp that means I mostly oil them, because the damp gets into the steel overnight and eats it from the inside. A dry blade here is a cared-for blade, and the rest is scrap." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it quick, the oil's warming." },
        { id = "h_again2", text = "Ask. My hands are busy, not my ears." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Where does the steel come from?", next = "steel" },
        { text = "How do I keep my weapon from rusting?", next = "rust" },
        { text = "Axe or blade, Hartash?", next = "choice" },
        { text = "Who works the forge here?", next = "gharash" },
        { text = "What sells best in Stonard?", next = "sells" },
        { text = "Later.", next = "END" },
      },
    },
    steel = {
      lines = {
        { id = "st_default", text = "Ore comes in with the caravans, when they come, and Gharash works it with what he can get. It's good steel, better than the swamp deserves, and some of what we make here would shame a smith in Orgrimmar." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rust = {
      lines = {
        { id = "ru_default", text = "Oil it every night, wipe it every morning, and never sheathe it wet. Most folk think that's too much bother, and then they come to me and buy a new one, so I suppose I shouldn't complain." },
      },
      choices = {
        { text = "Care for your weapon and it cares for you.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A weapon's a tool. Use it up and buy another.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    choice = {
      lines = {
        { id = "ch_default", text = "Axe, always, because an axe does the same work whether it's sharp or not. A sword's a fine thing in dry country, but out here you want something that still hurts when the edge has gone dull." },
      },
      choices = {
        { text = "A blade for skill. An axe is for brutes.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Whatever kills fastest. Pride doesn't matter.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gharash = {
      lines = {
        { id = "gh_default", text = "Gharash, at the anvil, and he sells the smiths' supplies too, when he has any to sell. When the caravans are late he goes quiet and starts melting down broken blades, and that's when I know to raise my prices." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sells = {
      lines = {
        { id = "se_default", text = "Long knives, for cutting through reeds, and heavy maces for the crocolisks, because a blade bounces off their hide. What do you swing, then, and don't tell me a stick?" },
      },
      choices = {
        { text = "An axe, like any orc should.", next = "BACK", when = { race = "Orc" }, fx = { affinity = 1 } },
        { text = "Whatever's in my hand when the fight starts.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "I let my spells do the work.", next = "BACK", when = { class = { "MAGE", "WARLOCK", "PRIEST", "SHAMAN" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I swung an axe in the camps until my shoulder went. Now I sell them to people whose shoulders still work." } },
    advice = { { id = "tp_ad", text = "Never sheathe a wet blade. Ever." } },
    _none = { { id = "tp_none", text = "Don't know. I know steel and I know rust, and that's enough to be going on with." } },
  },
}

P:NPC {
  key = "hekkru", id = TODO_NPC("Hekkru"), name = "Hekkru",
  bible = "bibles/stonard_market.md", role = "stablemaster", tier = "service",
  communities = { "stonard" }, temper = { "gruff", "patient" }, values = { "loyal", "kind" },
  notices = { "pet", "class" },

  impression = {
    first = "Hekkru keeps the stables in Stonard, a big scarred orc who talks to the animals more gently than he talks to anyone else. He checks every beast for leeches and every owner for excuses.",
    third = "{name} met Hekkru, the stable master at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Bring the beast here and let me look at it. Leeches first, talk after." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and your beast looks well. Good, that means you listened last time." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "There's {pet}. Come here, you, and let's see your feet." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} has mud between the pads and a leech behind the left ear. Hold still while I take it off; don't worry, it won't miss the blood." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. If you're stabling one beast and taking another, tell me now, because I won't have an animal waiting here for someone who's not coming back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hekkru, stable master. I keep your beasts dry, fed and free of leeches while you're out getting yourself killed, and I don't ask what you did to them before they got here." },
      },
      again = {
        { id = "h_again", text = "Anything else? The beasts want their supper." },
        { id = "h_again2", text = "Go on, I'm listening, and so are they." },
      },
      choices = {
        { text = "I need the stables.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do beasts fare in the swamp?", next = "swamp" },
        { text = "Do people ever leave their beasts here?", next = "left" },
        { text = "Who trains the hunters here?", next = "trainers" },
        { text = "Where did you learn to keep beasts?", next = "past" },
        { text = "Farewell, Hekkru.", next = "END" },
      },
    },
    swamp = {
      lines = {
        { id = "sw_default", text = "Badly, unless someone cares for them. Leeches, foot rot, fevers from the water, and a cough that goes round the pens every spring. I've lost three this year, and I remember all three." },
      },
      choices = {
        { text = "A beast in your care is a debt you owe.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Beasts die. That's the way of things.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    left = {
      lines = {
        { id = "le_default", text = "Some do, and they never come back for them, and I keep the animals anyway. There's an old cat in the back pen that's been waiting two winters for a troll who went into the temple and stayed there." },
      },
      choices = {
        { text = "You're kinder than you let on.", next = "BACK", fx = { affinity = 1 } },
        { text = "Will the troll come back for the cat?", next = "left_cat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    left_cat = {
      lines = {
        { id = "lc_default", text = "No. Nobody comes back from that temple after two winters, and the cat knows it too, I think, though it still sits facing the gate every evening. I'll keep feeding it until it stops eating, and then I'll bury it by the pens." },
      },
      choices = {
        { text = "Loyalty like that should be kept, to the end.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Give it to a hunter who'll use it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past = {
      lines = {
        { id = "pa_default", text = "With the wolves of Frostwolf Village, in Alterac, when I was young and the snow came up to my waist. Wolves taught me everything: feed the pack before yourself, and never turn your back on a beast you've wronged." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trainers = {
      lines = {
        { id = "tr_default", text = "Ogromm teaches the hunters and Grokor teaches their beasts, and between the two of them I mostly patch up what's left. Ogromm won't waste words on anyone else, so don't take it personally if he ignores you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I kept wolves for the Frostwolves once, long ago. Now I keep anything that walks in on four legs." } },
    advice = { { id = "tp_ad", text = "Check your beast's feet every night. The swamp starts with the feet." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask the beasts; they've been here longer than I have." } },
  },
}
