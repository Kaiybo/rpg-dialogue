-- The Crossroads. Voice: bibles/crossroads.md
-- Thork holds the walls, Sergra holds the road, Mankrik holds a grudge.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thork", id = TODO_NPC("Thork"), name = "Thork",
  bible = "bibles/crossroads.md", role = "soldier", tier = "quest",
  communities = { "crossroads" }, temper = { "firm" }, values = { "loyal", "dutiful" },
  notices = { "race", "kit" },

  greetings = {
    { id = "g_home", text = "Crossroads. Make yourself at home. Just mind your own business while you do." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the road, I see. The Crossroads is glad of you. Don't let it go to your head." },
  },

  notice = {
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "An Alliance face at the Crossroads. Bold. You'll get the same welcome as anyone, once. Don't make me regret it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been out among the centaur, by the look of it. Get patched up. The Horde needs you standing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thork. I keep the Crossroads for the Warchief. Every road in the Barrens meets here, and so does every kind of trouble." },
        { id = "h_journey", tags = { "news" }, when = { questActive = TODO_QUEST("Journey to the Crossroads") },
          text = "So they sent you to me. Good. I've more work than warriors. Rest a night, then let's see what you're made of." },
        { id = "h_disrupt", when = { questActive = TODO_QUEST("Disrupt the Attacks") },
          text = "Kolkar raiders hit our caravans and run. Hit them first. Make them think twice before they ride at the Crossroads." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Supplies for the Crossroads") },
          text = "Raiders took our supplies. Bring back what you can find. Every crate is a week we hold." },
        { id = "h_mankrik", when = { heardLine = "mankrik.h_default" },
          text = "Mankrik told you his story. I'm sorry for his loss. I won't send soldiers to die for a man who can't see past his anger. Someone has to say no." },
      },
      choices = {
        { text = "What's the hardest part of holding the Crossroads?", next = "hardest" },
        { text = "What threatens the Crossroads?", next = "threats" },
        { text = "I'm loyal to the Horde.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Farewell, Thork.", next = "END" },
      },
    },
    threats = {
      big = true,
      lines = {
        { id = "t_default", text = "Centaur, quilboar, harpies and the Alliance, in no particular order. They all want the same thing: the road. The Horde needs the road. So we hold it." },
      },
      choices = {
        { text = "Then I'll help hold it.", next = "END", fx = { affinity = 2, standing = { crossroads = 1 } } },
        { text = "That's a lot of enemies.", next = "lot" },
      },
    },
    lot = {
      lines = { { id = "l_default", text = "It is. The trick is that they hate each other too. Most days that's what keeps us alive." } },
      choices = { { text = "...", next = "END" } },
    },
    hardest = {
      lines = {
        { id = "h_sieve", text = "Every caravan wants an escort, every scout wants a rest, and the centaur raid on the one night I've got neither. The Warchief asked me for a crossroads. Some days I'm holding a sieve." },
      },
      choices = { { text = "You're holding it well.", next = "END", fx = { affinity = 2, standing = { crossroads = 1 } } } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "The druids' business. Tonga worries about it enough for all of us." } },
    _none = { { id = "tp_none", text = "Not my concern. My concern's the walls." } },
  },
}

P:NPC {
  key = "sergra", id = TODO_NPC("Sergra Darkthorn"), name = "Sergra Darkthorn",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "fierce" }, values = { "proud", "fair" },
  notices = { "gender", "kit" },

  greetings = {
    { id = "g_road", text = "You're new. Good. The Barrens eats the timid. You don't look timid. Prove it." },
    { id = "g_back", when = { metBefore = true }, text = "You made it back. Most do, the first few times. Then the Barrens gets serious." },
  },

  notice = {
    { id = "n_woman", cat = "gender", when = { gender = "female" },
      text = "A woman out on the Barrens, making her own name. Good. The Horde has more of us than the old clans liked to admit. Show them." },
    { id = "n_man", cat = "gender", when = { gender = "male" },
      text = "Before you say it: yes, I lead here. If that bothers you, the road out is that way. If it doesn't, we'll get along fine." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sergra Darkthorn. I run the Crossroads. Thork holds the walls; I send people out past them. The Barrens doesn't tame itself." },
        { id = "h_plainstrider", tags = { "news" }, when = { questActive = TODO_QUEST("Plainstrider Menace") },
          text = "The plainstriders are out of hand, and they breed faster than we hunt them. Thin the flock and bring me proof." },
        { id = "h_zhevra", when = { questActive = TODO_QUEST("The Zhevra") },
          text = "Zhevra. Fast, mean, and they kick like a falling rock. Bring me their hooves, and you'll have earned a meal." },
        { id = "h_prowlers", when = { questActive = TODO_QUEST("Prowlers of the Barrens") },
          text = "Prowlers, stalking the roads. Hunt them down. Show them who the predator is out here." },
        { id = "h_echeyakee", tags = { "news" }, when = { questActive = TODO_QUEST("Echeyakee") },
          text = "Out on the plains is a white savannah cat the hunters call Echeyakee. Old, clever, and hungry. Call it out the way I showed you, and bring luck." },
        { id = "h_jorn", when = { questActive = TODO_QUEST("Jorn Skyseer") },
          text = "Go and see Jorn Skyseer at Camp Taurajo. He'll teach you things about the Barrens that I never could. Tauren listen to the land better than orcs." },
      },
      choices = {
        { text = "Why do some orcs resent you?", next = "resent" },
        { text = "What does the Barrens need?", next = "need" },
        { text = "I'll get to it.", next = "END", fx = { affinity = 1 } },
      },
    },
    resent = {
      big = true,
      lines = {
        { id = "r_default", text = "Because I'm a woman who gives orders, and some of the old warriors still think the Horde is a boys' war-band. They'll learn. Or they'll stay grunts. Either suits me." },
      },
      choices = {
        { text = "They'll learn.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Who resents you?", next = "who" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Kargal Battlescar, for one. He's welcome to resent me from wherever I send him." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
    need = {
      lines = { { id = "n_default", text = "Everything back in its place. When one part of the Barrens sickens, the rest follow it down. Lately it's the water." } },
      choices = { { text = "...", next = "END", fx = { learn = { "wailing_caverns" } } } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "Something's wrong in the deep places, and it's seeping into the oases. Tonga knows more. Listen to him." } },
    _none = { { id = "tp_none", text = "Ask Thork. Or better, go and find out yourself." } },
  },
}

P:NPC {
  key = "mankrik", id = TODO_NPC("Mankrik"), name = "Mankrik",
  bible = "bibles/crossroads.md", role = "soldier", tier = "quest",
  communities = { "crossroads" }, temper = { "grieving" }, values = { "loyal", "vengeful" },
  notices = { "kit", "kin" },

  greetings = {
    { id = "g_horizon", text = "Hm? Oh. You. Stand aside, I'm watching the horizon. If they come, I want to see them first." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Did you see them out there? The pigs? Did you see her?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Lost in Battle") }, text = "She's found. I know where she lies now. That's something. It's not enough. It's something." },
  },

  notice = {
    { id = "n_orc", cat = "kin", when = { race = "Orc" },
      text = "An orc with fire in you. Good. Point it at the quilboar. They've earned all of it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The pigs got to you too? Then you understand. Then you're angry. Good. Stay angry." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mankrik. My wife Olgra and I fought the quilboar side by side until they split us up and swarmed us. A tauren found me half-dead on the road. Nobody found her." },
        { id = "h_hatred", tags = { "news" }, when = { questActive = TODO_QUEST("Consumed by Hatred") },
          text = "Kill them. As many as you can. Bring me proof. Thork won't send anyone, so I'm sending you. Every one you kill, I'll sleep a little." },
        { id = "h_lost", tags = { "news" }, when = { questActive = TODO_QUEST("Lost in Battle") },
          text = "She's out there somewhere. Find her for me. Alive or not. I need to know. I can't stand on this wall not knowing much longer." },
      },
      choices = {
        { text = "Tell me about Olgra.", next = "olgra" },
        { text = "Revenge won't bring her back.", next = "revenge" },
        { text = "I'll keep an eye out.", next = "END", fx = { affinity = 1 } },
      },
    },
    olgra = {
      big = true,
      lines = {
        { id = "o_default", text = "She fought better than me. Laughed louder. She'd have told me to stop standing on this wall moping. I would, if I knew where she was." },
      },
      choices = {
        { text = "I'll find her.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "I'm sorry.", next = "END", fx = { affinity = 2 } },
      },
    },
    revenge = {
      lines = { { id = "r_default", text = "Thork said the same. I'll tell you what I told him. I know. I don't care. Now leave me to the horizon." } },
      choices = { { text = "...", next = "END", fx = { affinity = -1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't know. Don't care. Ask me about quilboar." } },
  },
}

P:NPC {
  key = "tonga", id = TODO_NPC("Tonga Runetotem"), name = "Tonga Runetotem",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "measured" }, values = { "balanced", "patient" },
  notices = { "form", "class" },

  greetings = {
    { id = "g_calm", text = "Peace, friend. The land is restless lately. All the more reason for us not to be." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Druid-kin. Good. I need eyes that see the land the way I do. Sit, and I'll tell you what's wrong with it." },
  },

  notice = {
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "You came in on four legs and fast. Good. The Barrens is big. The faster we move, the more we can save." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tonga Runetotem. Thunder Bluff sent me to find where a strange power in the Barrens was coming from. I found it. I wish I hadn't." },
        { id = "h_oases", tags = { "news" }, when = { questActive = TODO_QUEST("The Barrens Oases") },
          text = "The oases are the Barrens' heart. Something's poisoning them. Bring me samples from the water and we'll see how deep the sickness goes." },
        { id = "h_stagnant", when = { questActive = TODO_QUEST("The Stagnant Oasis") },
          text = "The Stagnant Oasis is worst of all. Go carefully. Things that drink from it aren't themselves anymore." },
        { id = "h_hamuul", when = { questActive = TODO_QUEST("Hamuul Runetotem") },
          text = "Take what we've found to the Arch Druid. He'll want to see it with his own eyes. So would I, in his place." },
        { id = "h_cure", when = { questActive = TODO_QUEST("Gathering the Cure") },
          text = "The gazelles near Dreadmist Peak are sick. Moonglade's lore and the Barrens' water together might make them well. Bring me what's needed." },
      },
      choices = {
        { text = "What did you find?", next = "found" },
        { text = "Farewell, Tonga.", next = "END" },
      },
    },
    found = {
      big = true,
      lines = {
        { id = "f_default", key = true,
          text = "The Wailing Caverns. Druids went into them to heal the land, and something in the dark turned their dream bad. Now the sickness comes up with the water." },
      },
      choices = {
        { text = "Can it be stopped?", next = "stop", fx = { learn = { "wailing_caverns" } } },
        { text = "Druids did this?", next = "druids", fx = { learn = { "wailing_caverns" } } },
      },
    },
    stop = {
      lines = { { id = "s_default", text = "By someone braver than me. Go into the caverns when you're strong, and find who started this. Start with the water. Always start with the water." } },
      choices = { { text = "I will.", next = "END", fx = { affinity = 2, align = { light = 1 } } } },
    },
    druids = {
      lines = { { id = "d_default", text = "Druids meant well. That's the most frightening part, friend. Anyone can mean well and still go wrong in the dark." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "A cave with a poisoned dream at the bottom. That's the plain version. The plain version is bad enough." } },
    cenarion_circle = { { id = "tp_circle", text = "Hamuul brought us into it. The Barrens needs every druid it can get, and the Circle needs to hear about this place." } },
    _none = { { id = "tp_none", text = "I don't know. The land might. Listen to it a while." } },
  },
}

P:NPC {
  key = "helbrim", id = TODO_NPC("Apothecary Helbrim"), name = "Apothecary Helbrim",
  bible = "bibles/crossroads.md", role = "scholar", tier = "quest",
  communities = { "crossroads" }, temper = { "clinical" }, values = { "curious", "practical" },
  notices = { "craft", "race" },

  greetings = {
    { id = "g_samples", text = "Hands! Living ones, even. Excellent. Mine shake a little, these days." },
    { id = "g_back", when = { metBefore = true }, text = "Back with something for me? The Barrens is full of things worth bottling." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "You work with reagents. Good. We'll talk shop, you and I. The others here only ask what's in my bottles so they can avoid it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Don't look at me like that. We're on the same side. The Society only wants to study the Barrens, not harm it. Mostly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Helbrim, of the Royal Apothecary Society. The Society sent me to see what grows out here that might be useful. A great deal, it turns out." },
        { id = "h_spores", tags = { "news" }, when = { questActive = TODO_QUEST("Fungal Spores") },
          text = "Spores, from the fungus out by the water. Don't breathe near them. Well, you breathe. I'd advise against it." },
        { id = "h_zamah", when = { questActive = TODO_QUEST("Apothecary Zamah") },
          text = "Zamah needs this, in Thunder Bluff, by the Pools of Vision. The tauren don't entirely trust the Society, but they trust Zamah." },
        { id = "h_dizzywig", when = { questActive = TODO_QUEST("Wharfmaster Dizzywig") },
          text = "A delivery for Dizzywig at Ratchet. The goblins move anything for the right price. Some of my shipments need moving very discreetly." },
      },
      choices = {
        { text = "What are you studying?", next = "study" },
        { text = "Good luck with your work.", next = "END" },
      },
    },
    study = {
      big = true,
      lines = {
        { id = "s_default", text = "Everything that grows, festers or stings out here. Remedies, mostly. Some of us still remember being sick. We'd like no one else to be." },
      },
      choices = {
        { text = "That's kind of you.", next = "END", fx = { affinity = 2 } },
        { text = "Mostly remedies?", next = "mostly" },
      },
    },
    mostly = {
      lines = { { id = "m_default", text = "You listen closely. Mostly remedies. Science is science. What people do with it is their own affair." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "A poisoned dream leaking into the water? Fascinating. Terrible, of course. But fascinating." } },
    _none = { { id = "tp_none", text = "Not my field. Bring me a sample and I'll make it my field." } },
  },
}

P:NPC {
  key = "darsok", id = TODO_NPC("Darsok Swiftdagger"), name = "Darsok Swiftdagger",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "boastful" }, values = { "proud" },
  notices = { "class", "stealth" },

  greetings = {
    { id = "g_blade", text = "Need someone dead? I'm the best there is. Need someone dead quietly? Still me. Cheaper, too." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, my favourite errand-runner. How many feathers today?" },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A fellow blade. Don't get any ideas; I saw you coming from the gate. Nobody sneaks up on Darsok." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Ha! Nice try. I can smell a shadow from twenty paces. Come out, before I come in." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Darsok Swiftdagger. Throats, backs, the soft bits between armour plates. That's my trade, and I'm good at it." },
        { id = "h_harpy", tags = { "news" }, when = { questActive = TODO_QUEST("Harpy Raiders") },
          text = "Harpies, up in the hills. Filthy screeching things. Bring me their talons. I'd go myself, but I'd enjoy it too much." },
        { id = "h_lieutenants", when = { questActive = TODO_QUEST("Harpy Lieutenants") },
          text = "Now the ones who give the orders. Their lieutenants. Cut the head off a flock and the rest fly in circles." },
        { id = "h_serena", tags = { "news" }, when = { questActive = TODO_QUEST("Serena Bloodfeather") },
          text = "Serena Bloodfeather. Their matriarch. Bring me her head. Then they'll know the Crossroads bites back." },
        { id = "h_jinzil", when = { questActive = TODO_QUEST("Letter to Jin'Zil") },
          text = "My old friend Jin'Zil gets this letter. Witch doctor, in Stonetalon. He'll have a use for you. Don't read it; he'll know." },
      },
      choices = {
        { text = "Are you really the best?", next = "best" },
        { text = "I'll handle the harpies.", next = "END", fx = { affinity = 1 } },
      },
    },
    best = {
      lines = { { id = "b_default", text = "Ask the harpies. Oh wait, you can't. That's how good I am." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } }, { text = "Charming.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If it doesn't bleed, I'm not interested." } },
  },
}

P:NPC {
  key = "zargh", id = TODO_NPC("Zargh"), name = "Zargh",
  bible = "bibles/crossroads.md", role = "vendor", tier = "quest",
  communities = { "crossroads" }, temper = { "jolly" }, values = { "generous" },
  notices = { "hunger", "craft" },

  greetings = {
    { id = "g_meat", text = "Fresh meat! Well. Recent meat. Stock up before you head out; the Barrens won't feed you kindly." },
    { id = "g_back", when = { metBefore = true }, text = "Hungry again? Course you are. Everyone's hungry out here." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Take a look at these cuts. Prime zhevra. Well, zhevra. Prime is a strong word for anything in the Barrens." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zargh. Butcher. I sell meat to everyone who passes through the Crossroads, which is everyone. Business is good. Everything else is the Barrens." },
        { id = "h_meats", tags = { "news" }, when = { questActive = TODO_QUEST("Meats to Orgrimmar") },
          text = "Choice cuts for Gryshka at the inn in Orgrimmar. Get them there fresh. And tell her... tell her they're from me. She'll know what that means." },
        { id = "h_return", when = { questDone = TODO_QUEST("Return to the Crossroads") },
          text = "She liked them? She said that? Good. Good! If there's a wedding, you're invited. If. I'm not saying there's a wedding." },
        { id = "h_bones", when = { metBefore = true }, text = "Gryshka sent back the bones. Clean. I don't know what that means. I've decided it's a good sign." },
      },
      choices = {
        { text = "What happened to your finger?", next = "finger" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Not hungry.", next = "END" },
      },
    },
    finger = {
      big = true,
      lines = {
        { id = "f_default", text = "An accident with the cleaver. Long time ago. Don't look at the sausages like that. I looked for it, I promise. Mostly." },
      },
      choices = { { text = "...I'll pass on the sausages.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't know, friend. I know meat. Ask me about meat." } },
  },
}

P:NPC {
  key = "boorand", id = TODO_NPC("Innkeeper Boorand Plainswind"), name = "Innkeeper Boorand Plainswind",
  bible = "bibles/crossroads.md", role = "innkeeper", tier = "service",
  communities = { "crossroads" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Rest your hooves, or your feet. Whatever you've got. Everyone's welcome under this roof." },
    { id = "g_home", when = { homeInn = { "The Crossroads" } }, text = "Back to the Crossroads! Your bedroll's where you left it. I swept the dust off twice." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "The Barrens beat you up, little one. Sit. Eat. The Barrens will still be out there in the morning, sadly." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy. The floor's flat in here, but it won't feel like it. Sit down before it proves me wrong." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Boorand Plainswind. I keep the inn at the Crossroads. Orcs, trolls, tauren, the odd Forsaken: they all sleep the same once they're tired enough." },
        { id = "h_mankrik", when = { heardLine = "mankrik.h_default" },
          text = "Mankrik's been on that wall since before I got here. He eats when someone puts food in his hands. I put food in his hands." },
        { id = "h_roof", when = { metBefore = true }, text = "A goblin from Ratchet stayed three nights and tried to sell me a better roof. This roof is fine. It has holes. That's how the stars get in." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night at the Crossroads is never quiet. Riders coming in, wind riders grumbling on the tower. I'd miss it if it stopped." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Any news?", next = "news" },
        { text = "Just resting.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "Everyone coming through asks the same question. Where's Mankrik's wife. If you find out, tell him first, and then tell me. I'm tired of not knowing either." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Tonga, by the inn. He knows the Barrens better than anyone." } },
  },
}
