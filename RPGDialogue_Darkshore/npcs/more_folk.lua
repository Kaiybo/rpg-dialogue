-- Darkshore, Auberdine's shopkeepers we had missed: Harlon Thornguard (armor), Kyndri (bread),
-- Allyndia (food and drink), Shaldyn (cloth) and Mavralyn (leather). Classic Auberdine only.
-- Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Harlon Thornguard
---------------------------------------------------------------------------
P:NPC {
  key = "harlon", id = TODO_NPC("Harlon Thornguard"), name = "Harlon Thornguard", title = "Armorer & Shieldsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "auberdine" }, temper = { "gruff", "steady" }, values = { "craft", "protective" },
  notices = { "class", "kit" },

  impression = {
    first = "He talks about the furbolgs as if they owed him money.",
    third = "{name} met Harlon Thornguard, the armorer and shieldsmith of Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Armor and shields. If you're heading up the coast, you'll want both." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the coast with all your limbs, I see. Something of mine must have held." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior. Come in, I've a shield that's been waiting for a proper arm." },
  },

  notice = {
    { id = "n_dented", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armor's taken a beating. Murlocs, or furbolgs? The furbolgs leave bigger dents." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin in Auberdine. The priestesses will be curious about your Light, but I'm only curious about your plate." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Harlon Thornguard, armorer and shieldsmith of Auberdine. Darkshore's a hard coast these days, and I make sure those who walk it have something between them and the teeth." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else do you need?" },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What's so hard about this coast?", next = "coast" },
        { text = "Who buys most of your armor?", next = "buyers" },
        { text = "Night elves don't usually wear heavy armor.", next = "heavy" },
        { text = "Good day.", next = "END" },
      },
    },

    coast = {
      lines = { { id = "co_default", text = "The Blackwood furbolgs have gone mad, the murlocs crawl up the beaches every tide, and the moonkin north of here attack anyone who wanders near. Then there's the old ruins, which have things in them I'd rather not think about." } },
      choices = {
        { text = "What happened to the furbolgs?", next = "furbolgs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    furbolgs = {
      lines = { { id = "fu_default", text = "Corruption, the druids say, though they're still arguing about where it comes from. The Blackwood were good neighbours once, and now Sentinel Glynda sends people to cull them like wolves." } },
      choices = {
        { text = "It's sad. They were your friends.", next = "BACK", reply = "They were, and I'll not pretend otherwise. But my shields don't know the difference.", fx = { align = { light = 1 } } },
        { text = "A threat is a threat. Cull them.", next = "BACK", reply = "Glynda would agree with you. I'm not sure I do, but I'll sell you the shield.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    buyers = {
      lines = { { id = "bu_default", text = "Travelers off the boats from Menethil, mostly, who've heard Darkshore is a gentle place and learned otherwise at the first murloc. The Sentinels keep their own armorers, though they'll come to me when they're pressed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    heavy = {
      lines = { { id = "he_default", text = "Not usually, no, and I hear that from my own people every day. But not everyone who comes through Auberdine is a Sentinel, and the dwarves and humans like their armor thick, so I make it thick." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I make and sell armor in Auberdine. It's never been busier, which is not good news." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Blackwood furbolgs were peaceful once. Now they're why half my customers come in." } },
    _none = { { id = "tp_none", text = "I wouldn't know. Ask me about rivets and straps." } },
  },
}

---------------------------------------------------------------------------
-- Kyndri
---------------------------------------------------------------------------
P:NPC {
  key = "kyndri", id = TODO_NPC("Kyndri"), name = "Kyndri", title = "Baker",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "auberdine" }, temper = { "warm", "brisk" }, values = { "hospitality", "kind" },
  notices = { "race", "weary" },

  impression = {
    first = "She watches the harbor while she works, as if waiting for someone.",
    third = "{name} met Kyndri, Auberdine's baker.",
  },

  greetings = {
    { id = "g_hello", text = "Fresh bread, and water from the spring. You look like you could use both." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I baked extra today, in case." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { resting = true },
      text = "You've the look of someone who's walked from Bashal'Aran without stopping. Sit down before you fall down." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human! Tell me, is it true your bakers in Stormwind put sugar in everything?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kyndri, and I bake for Auberdine and for everyone who comes off the boats. Sailors from Menethil, pilgrims from Rut'theran, Sentinels off patrol: they all eat bread, whatever else they disagree about." },
      },
      again = {
        { id = "h_again", text = "Anything else? The oven's hot." },
        { id = "h_again2", text = "What else, dear?" },
      },
      choices = {
        { text = "Let me see your bread.", next = "BUSINESS" },
        { text = "You keep watching the harbor.", next = "harbor" },
        { text = "What do sailors talk about?", next = "sailors" },
        { text = "Good day.", next = "END" },
      },
    },

    harbor = {
      lines = { { id = "ha_default", text = "Do I? I suppose I do. The ships bring flour from the south, and when one is late, I start counting what's left in the bins. It's a baker's worry, nothing more." } },
      choices = {
        { text = "Are the ships often late?", next = "late" },
        { text = "Something else.", next = "BACK" },
      },
    },
    late = {
      lines = { { id = "la_default", text = "More often lately. The captains say the sea's rougher along the coast, and there are naga in the waters off the north, though no one likes to say so in front of the passengers." } },
      choices = {
        { text = "Then you should stock up while you can.", next = "BACK", reply = "I do, and then the bins fill up with mice. There's no winning with flour.", fx = { align = { order = 1 } } },
        { text = "Worry about it when it happens.", next = "BACK", reply = "Spoken like someone who's never run out of flour with a full inn waiting. Still, you're right, I fret too much.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sailors = {
      lines = { { id = "sa_default", text = "Menethil, mostly, and the swamps and the trolls around it, and how much they hate the crossing. The dwarves from the boats complain about the weather, the humans complain about the food, and they all buy my bread anyway." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I bake for Auberdine and the boats. It's simple work, and everyone's glad of it." } },
    advice = { { id = "tp_advice", text = "Carry bread in your pack, always. You never know when you'll be stuck on a beach with murlocs between you and the town." } },
    _none = { { id = "tp_none", text = "Oh, I've no idea, dear. Ask Shaussiy at the inn; she hears everything." } },
  },
}

---------------------------------------------------------------------------
-- Allyndia
---------------------------------------------------------------------------
P:NPC {
  key = "allyndia", id = TODO_NPC("Allyndia"), name = "Allyndia", title = "Food & Drink",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "auberdine" }, temper = { "cheerful", "chatty" }, values = { "friendly", "practical" },
  notices = { "race", "drink" },

  impression = {
    first = "She seems to know who is coming off every boat.",
    third = "{name} met Allyndia, who sells food and drink in Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome to Auberdine! You'll want something to eat, I expect. Everyone does, after the crossing." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Still alive, still hungry. That's how I like my customers." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I've a little ale from Menethil, but I warn you, it's not Thunderbrew." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Somebody's been enjoying the inn. Have some water, friend, and maybe some bread." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Allyndia, and I keep the travelers of Auberdine fed and watered. Fruit, cheese, a little meat when the hunters bring it, and the coldest water on the coast." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend?" },
        { id = "h_again2", text = "What else can I get you?" },
      },
      choices = {
        { text = "Show me your food.", next = "BUSINESS" },
        { text = "Who comes through Auberdine?", next = "who" },
        { text = "What's there to see in Darkshore?", next = "see" },
        { text = "Good day.", next = "END" },
      },
    },

    who = {
      lines = { { id = "wh_default", text = "Everyone, lately! Dwarves from the Explorers' League looking for ruins, humans who've never seen a night elf, gnomes asking about the moonwells, and our own young ones off to Ashenvale. It's never been so lively." } },
      choices = {
        { text = "Do the townsfolk mind the outsiders?", next = "mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mind = {
      lines = { { id = "mi_default", text = "Some of the elders do, and they grumble about axes and noise. But I like it; Auberdine was very quiet for a very long time, and I think we'd forgotten how to talk to strangers." } },
      choices = {
        { text = "Strangers bring new ideas. Good for you.", next = "BACK", reply = "That's what I keep telling the elders. They keep not listening.", fx = { align = { order = -1 } } },
        { text = "Your elders have reason to be careful.", next = "BACK", reply = "They do, I suppose. Ten thousand years of careful is still a lot of careful.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    see = {
      lines = { { id = "se_default", text = "The ruins of Bashal'Aran and Ameth'Aran, if you like old stones and older ghosts. The beaches, if you don't mind murlocs. And the great Cliffspring Falls to the north, which are lovely, though the furbolgs nearby are not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell food and drink in Auberdine. I know everyone, and everyone knows me." } },
    explorers_league = { { id = "tp_league", text = "The dwarves of the Explorers' League dig in our ruins. They're polite, mostly, and they eat a great deal." } },
    _none = { { id = "tp_none", text = "I haven't heard a thing about that. Strange, I usually hear everything." } },
  },
}

---------------------------------------------------------------------------
-- Shaldyn
---------------------------------------------------------------------------
P:NPC {
  key = "shaldyn", id = TODO_NPC("Shaldyn"), name = "Shaldyn",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "auberdine" }, temper = { "gentle", "precise" }, values = { "craft", "beauty" },
  notices = { "class", "craft" },

  impression = {
    first = "It pains her when a customer doesn't care about colour.",
    third = "{name} met Shaldyn, who sells cloth armor in Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Robes, gloves, and soft boots. Do look, and please don't drag them on the floor." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your robe's held up, I see. Mostly." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Your people do like their robes long, don't they? I've one or two that would suit." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor. Look at the stitching on the cuffs, then, and tell me honestly what you think." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Shaldyn, and I sell cloth armor to priests, mages, and anyone else who would rather move freely than be weighed down. The colours are dyed here in Auberdine, from plants along the shore." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else can I show you?" },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Tell me about the dyes.", next = "dyes" },
        { text = "Cloth won't stop a furbolg's claw.", next = "claw" },
        { text = "Good day.", next = "END" },
      },
    },

    dyes = {
      lines = { { id = "dy_default", text = "Blues from a kelp that washes up after storms, greens from the moss under the trees, and a silver we make from a flower that only opens under the moon. The silver takes a month, and it's worth every night." } },
      choices = {
        { text = "Beauty is worth the time.", next = "BACK", reply = "It is. I'm glad someone who wears my robes thinks so.", fx = { align = { order = 1 } } },
        { text = "I care more that it's sturdy.", next = "BACK", reply = "It's sturdy too, I promise. But you might at least notice the silver.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    claw = {
      lines = { { id = "cl_default", text = "No, and it isn't meant to. Cloth lets a priestess move her hands and a mage keep his mind clear; the claw is meant to stop before it gets to them. That's what the warriors are for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell cloth armor in Auberdine, dyed with colours from the shore." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, I'm afraid. Ask me about cloth and colour." } },
  },
}

---------------------------------------------------------------------------
-- Mavralyn
---------------------------------------------------------------------------
P:NPC {
  key = "mavralyn", id = TODO_NPC("Mavralyn"), name = "Mavralyn",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "auberdine" }, temper = { "dry", "practical" }, values = { "craft", "trade" },
  notices = { "craft", "class" },

  impression = {
    first = "She is blunt about bad skinning and generous about good.",
    third = "{name} met Mavralyn, who sells leather and leatherworking supplies in Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Leather armor, thread, dye, and salt for curing. What are you after?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Bring me anything worth curing?" },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker! I've thread and dye, and opinions, if you want them." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You skin, by the knife on your belt. Strider hides here are thin; cut slowly or you'll ruin them." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. Dark leather, I expect, and soft boots. I've both." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Mavralyn, and I sell leather armor and the makings of it. The hunters of Darkshore bring me their hides, and the travelers buy what I make of them." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What hides come from Darkshore?", next = "hides" },
        { text = "How do you tell good skinning from bad?", next = "skinning" },
        { text = "Good day.", next = "END" },
      },
    },

    hides = {
      lines = { { id = "hi_default", text = "Strider, mostly, and thistle bear, and the odd nightsaber from the hills. The bears are the best of it, thick and warm, though I don't buy from the furbolg dens; whatever's sick there gets into the hides." } },
      choices = {
        { text = "Sick hides? How can you tell?", next = "sick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sick = {
      lines = { { id = "si_default", text = "They smell wrong, and the leather cracks no matter how you cure it. The druids say it's the same corruption that's taken the Blackwood, and I believe them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    skinning = {
      lines = { { id = "sk_default", text = "Good skinning leaves the hide whole and the cuts straight; bad skinning looks as if a murloc did it with its teeth. I'll buy either, but I'll pay very differently." } },
      choices = {
        { text = "Fair. Quality should be paid for.", next = "BACK", reply = "Exactly. And a skinner who learns that soon earns well.", fx = { align = { honor = 1 } } },
        { text = "A hide's a hide. Pay the same.", next = "BACK", reply = "Then go and sell your murloc-chewed hides elsewhere, friend. I'll be here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell leather and leatherworking goods in Auberdine. I buy hides too, if they're worth it." } },
    _none = { { id = "tp_none", text = "Not my business. Leather is." } },
  },
}
