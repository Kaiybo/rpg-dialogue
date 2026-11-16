-- The Crossroads. Voice: bibles/crossroads.md
-- Thork holds the walls, Sergra holds the road, Mankrik holds a grudge.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thork", id = TODO_NPC("Thork"), name = "Thork",
  bible = "bibles/crossroads.md", role = "soldier", tier = "quest",
  communities = { "crossroads" }, temper = { "firm" }, values = { "loyal", "dutiful" },
  notices = { "race", "kit" },
  impression = {
    first = "Thork keeps the Crossroads for the Warchief and treats every road in the Barrens as his to hold. He is firm and fair after his fashion, and he will not spend soldiers on a grieving man's vengeance.",
    third = "{name} met Thork, the steadfast orc who holds the Crossroads for the Warchief against every threat in the Barrens.",
  },

  greetings = {
    { id = "g_home", text = "Make yourself at home at the Crossroads, and mind your own business while you do." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the road, I see. The Crossroads is glad of you, so don't let it go to your head." },
  },

  notice = {
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "An Alliance face at the Crossroads? That's bold. You'll get the same welcome as anyone else, once, so don't make me regret it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been out among the centaur, by the look of it. Get yourself patched up; the Horde needs you standing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Thork, and I keep the Crossroads for the Warchief. Every road in the Barrens meets here, and so does every kind of trouble." },
        { id = "h_journey", tags = { "news" }, when = { questActive = TODO_QUEST("Journey to the Crossroads") },
          text = "So they sent you to me. Good, I've more work than warriors. Rest a night, and then we'll see what you're made of." },
        { id = "h_disrupt", when = { questActive = TODO_QUEST("Disrupt the Attacks") },
          text = "Kolkar raiders hit our caravans and run. I want you to hit them first, hard enough that they think twice before they ride at the Crossroads." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Supplies for the Crossroads") },
          text = "The raiders took our supplies. Bring back whatever you can find, because every crate is another week we hold." },
        { id = "h_mankrik", when = { heardLine = "mankrik.h_default" },
          text = "So Mankrik told you his story. I'm sorry for his loss, but I won't send soldiers to die for a man who can't see past his anger. Someone has to say no." },
      },
      choices = {
        { text = "What's the hardest part of holding the Crossroads?", next = "hardest" },
        { text = "What threatens the Crossroads?", next = "threats" },
        { text = "I'm loyal to the Horde.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I look out for myself first, and the Horde second.", next = "END", fx = { align = { honor = -1 } } },
        { text = "Give me a post on the wall, Thork.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Do you trust the Forsaken at your crossroads?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Farewell, Thork.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? The road doesn't stop for talk, so neither do I, for long." },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "The wall's the easy part, because it doesn't move. What I need are warriors who'll ride out with the caravans, since the Kolkar never attack a wall; they attack the wagons strung out on the road." },
        { id = "wa_tauren", when = { race = "Tauren" },
          text = "A tauren warrior on my wall would scare off half the raiders before they got close. But I'd rather have you out with the kodo caravans, where the Kolkar actually strike." },
      },
      choices = {
        { text = "Then I'll ride with the caravans.", next = "BACK", fx = { affinity = 2, standing = { crossroads = 1 } } },
        { text = "Why not strike the Kolkar camps first?", next = "warrior_camps" },
      },
    },
    warrior_camps = {
      lines = { { id = "wc_default", text = "Because I've got sixty soldiers and they've got the whole Barrens to run in. Hit them hard enough when they come, and they'll pick an easier target; that's all holding a road is." } },
      choices = { { text = "Understood.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "I trust Helbrim to brew what he's paid to brew, and to keep his bottles away from my well. The Warchief says your people are Horde, so you're Horde at my crossroads, but I count the bottles." } },
      choices = {
        { text = "Count them, then. We've earned some suspicion.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Your suspicion is an insult to the Dark Lady.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    threats = {
      big = true,
      lines = {
        { id = "t_default", text = "Centaur, quilboar, harpies and the Alliance, in no particular order, and they all want the same thing: the road. The Horde needs that road, so we hold it." },
      },
      choices = {
        { text = "Then I'll help hold it.", next = "BACK", fx = { affinity = 2, standing = { crossroads = 1 } } },
        { text = "That's a lot of enemies.", next = "lot" },
      },
    },
    lot = {
      lines = { { id = "l_default", text = "It is. The trick is that they hate each other too, and most days that's what keeps us alive." } },
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
    knows = {
      { id = "tp_knows", text = "I hear every report that reaches these walls, and these are the ones I'll speak to." },
    },
    wailing_caverns = { { id = "tp_caverns", text = "That's the druids' business, and Tonga worries about it enough for all of us." } },
    _none = { { id = "tp_none", text = "That's not my concern. My concern is the walls, and keeping them standing." } },
  },
}

P:NPC {
  key = "sergra", id = TODO_NPC("Sergra Darkthorn"), name = "Sergra Darkthorn",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "fierce" }, values = { "proud", "fair" },
  notices = { "gender", "kit" },
  impression = {
    first = "Sergra Darkthorn runs the Crossroads and dares anyone to be bothered by it. She sends people out past the walls with a grin, as if the Barrens were a test she enjoys setting.",
    third = "{name} met Sergra Darkthorn, the fierce orc who runs the Crossroads and sends new blood out to prove itself on the Barrens.",
  },

  greetings = {
    { id = "g_road", text = "You're new here. Good; the Barrens eats the timid, and you don't look timid to me. Now prove it." },
    { id = "g_back", when = { metBefore = true }, text = "You made it back. Most do, the first few times, and then the Barrens gets serious." },
  },

  notice = {
    { id = "n_woman", cat = "gender", when = { gender = "female" },
      text = "A woman out on the Barrens, making her own name. Good! The Horde has more of us than the old clans ever liked to admit, so go and show them." },
    { id = "n_man", cat = "gender", when = { gender = "male" },
      text = "Before you say it: yes, I lead here. If that bothers you, the road out is that way. If it doesn't, we'll get along fine." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Sergra Darkthorn, and I run the Crossroads. Thork holds the walls and I send people out past them, since the Barrens doesn't tame itself." },
        { id = "h_plainstrider", tags = { "news" }, when = { questActive = TODO_QUEST("Plainstrider Menace") },
          text = "The plainstriders are out of hand, and they breed faster than we hunt them. Thin the flock and bring me proof." },
        { id = "h_zhevra", when = { questActive = TODO_QUEST("The Zhevra") },
          text = "Zhevra are fast and mean, and they kick like a falling rock. Bring me their hooves and you'll have earned a meal." },
        { id = "h_prowlers", when = { questActive = TODO_QUEST("Prowlers of the Barrens") },
          text = "Prowlers have been stalking the roads. Hunt them down, and show them who the predator is out here." },
        { id = "h_echeyakee", tags = { "news" }, when = { questActive = TODO_QUEST("Echeyakee") },
          text = "Out on the plains is a white savannah cat the hunters call Echeyakee, old and clever and hungry. Call it out the way I showed you, and bring luck." },
        { id = "h_jorn", when = { questActive = TODO_QUEST("Jorn Skyseer") },
          text = "Go and see Jorn Skyseer at Camp Taurajo. He'll teach you things about the Barrens that I never could. Tauren listen to the land better than orcs." },
      },
      choices = {
        { text = "Why do some orcs resent you?", next = "resent" },
        { text = "What does the Barrens need?", next = "need" },
        { text = "My beast and I are ready to hunt.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do the trolls here answer to you too?", next = "troll", when = { race = "Troll" } },
        { text = "I'll get to it.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, the plainstriders don't wait." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Good, because half my hunting work is for people like you anyway. A hunter who can't bring down a zhevra has no business calling out Echeyakee, so start small and earn the big cat." },
        { id = "hu_runner", when = { origin = "tauren_plains_runner" },
          text = "A plains runner, out of Taurajo's grass. Then you know the Barrens better than I do, and you'll find Echeyakee before he finds you." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "And {pet} looks hungry. Out here a hunter's beast eats what it kills, so let it do some of my work for me." },
      },
      choices = {
        { text = "I'll take the zhevra first, and then the cat.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Why does Echeyakee matter so much?", next = "hunter_cat" },
      },
    },
    hunter_cat = {
      lines = { { id = "hc_default", text = "Because he's old enough to have taught every cat out there how to stalk a caravan. Kill him and the rest get clumsy, and the Crossroads breathes easier for a season." } },
      choices = { { text = "Then he dies.", next = "BACK", fx = { affinity = 1 } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "They answer to me when I give the orders, and they give me less trouble about it than the orcs do. The Darkspear have had women leading hunts for longer than the Horde has had a name, I'm told." } },
      choices = { { text = "We have. The orcs could learn from it.", next = "BACK", fx = { affinity = 2 } } },
    },
    resent = {
      big = true,
      lines = {
        { id = "r_default", text = "Because I'm a woman who gives orders, and some of the old warriors still think the Horde is a boys' war-band. They'll learn, or they'll stay grunts, and either one suits me." },
      },
      choices = {
        { text = "They'll learn.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Then don't wait for them to learn. Go around them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who resents you?", next = "who" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Kargal Battlescar, for one. He's welcome to resent me from wherever I send him." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
    need = {
      lines = { { id = "n_default", text = "What I need is everything back in its place. When one part of the Barrens sickens the rest follow it down, and lately it's the water." } },
      choices = { { text = "...", next = "END", fx = { learn = { "wailing_caverns" } } } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "Something's wrong in the deep places, and it's seeping into the oases. Tonga knows more than I do, so listen to him." } },
    _none = { { id = "tp_none", text = "Ask Thork, or better yet, go out there and find out for yourself." } },
  },
}

P:NPC {
  key = "mankrik", id = TODO_NPC("Mankrik"), name = "Mankrik",
  bible = "bibles/crossroads.md", role = "soldier", tier = "quest",
  communities = { "crossroads" }, temper = { "grieving" }, values = { "loyal", "vengeful" },
  notices = { "kit", "kin" },
  impression = {
    first = "Up on the wall, Mankrik watches the horizon as if Olgra might walk out of the grass at any moment. His grief has gone hard and angry, and it will not let him rest.",
    third = "{name} met Mankrik, a grieving orc who stands watch at the Crossroads waiting for word of his wife Olgra.",
  },

  greetings = {
    { id = "g_horizon", text = "Hm? Oh, it's you. Stand aside, I'm watching the horizon, and if they come I want to see them first." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Did you see the pigs out there? Did you see any sign of her?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Lost in Battle") }, text = "She's found, and I know where she lies now. It isn't enough, but it's something." },
  },

  notice = {
    { id = "n_orc", cat = "kin", when = { race = "Orc" },
      text = "There's fire in you, orc. Good! Point it at the quilboar; they've earned every bit of it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The pigs got to you too? Then you understand, and you're angry, and that's good. Stay angry." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mankrik. My wife Olgra and I fought the quilboar side by side until they split us up and swarmed us. A tauren found me half-dead on the road, but nobody ever found her." },
        { id = "h_hatred", tags = { "news" }, when = { questActive = TODO_QUEST("Consumed by Hatred") },
          text = "Kill them, as many as you can, and bring me proof. Thork won't send anyone, so I'm sending you, and for every one you kill I'll sleep a little." },
        { id = "h_lost", tags = { "news" }, when = { questActive = TODO_QUEST("Lost in Battle") },
          text = "She's out there somewhere, so find her for me, alive or not. I need to know, because I can't stand on this wall not knowing much longer." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "You came back, and you didn't have to. Olgra would have liked you, I think, and she didn't like many people." },
      },
      choices = {
        { text = "Tell me about Olgra.", next = "olgra" },
        { text = "Revenge won't bring her back.", next = "revenge" },
        { text = "I fight with an axe too. Tell me how she fought.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "A tauren found you on the road?", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll keep an eye out.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else? Say it, and then let me get back to the horizon." },
      },
    },
    warrior = {
      lines = { { id = "wr_default", text = "Two axes and no shield, always charging the biggest one first, and she never once let me take the front. That's how they split us: she charged, and I went after her, and there were more of them behind than either of us saw." } },
      choices = {
        { text = "That's how a warrior should die, charging.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "She should have held back, Mankrik.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "One of your people, a kodo herder heading for Taurajo, and he carried me to the Crossroads on his own back. I never got his name, and I'd give a great deal to thank him." } },
      choices = { { text = "I'll ask after him at Taurajo.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    olgra = {
      big = true,
      lines = {
        { id = "o_default", text = "She fought better than me, and laughed louder. She'd have told me to stop standing on this wall moping, and I would, if I knew where she was." },
      },
      choices = {
        { text = "I'll find her.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "I'm sorry.", next = "END", fx = { affinity = 2 } },
      },
    },
    revenge = {
      lines = { { id = "r_default", text = "Thork said the same, so I'll tell you what I told him: I know, and I don't care. Now leave me to the horizon." } },
      choices = {
        { text = "Why stand on this wall instead of searching yourself?", tag = "Persuade", next = "wall_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "kind" }, { questActive = TODO_QUEST("Lost in Battle") } } } },
          fail = { next = "wall_away", fx = { affinity = -1 } } },
        { text = "...", next = "END", fx = { affinity = -1 } },
      },
    },
    wall_truth = {
      big = true,
      lines = {
        { id = "wt_default", text = "Because as long as I stand here, she might still be out there alive. If I go and look, and I find her, then she isn't, and I'm a coward about that one thing, the only thing Olgra ever saw me run from." },
      },
      choices = {
        { text = "Then let me look for you.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "That isn't cowardice. It's love.", next = "END", fx = { affinity = 2 } },
      },
    },
    wall_away = {
      lines = {
        { id = "wa_default", text = "Because someone has to watch for the pigs, and I'm the one with the reason to. Go on, leave me to it." },
      },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I don't know much beyond the quilboar and this wall. Ask about these, if you must." },
    },
    _none = { { id = "tp_none", text = "I don't know and I don't care. Ask me about quilboar." } },
  },
}

P:NPC {
  key = "tonga", id = TODO_NPC("Tonga Runetotem"), name = "Tonga Runetotem",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "measured" }, values = { "balanced", "patient" },
  notices = { "form", "class" },
  impression = {
    first = "Tonga Runetotem found the strange power Thunder Bluff sent him looking for, and he wishes he had not. He speaks calmly about poisoned oases, which made what he said all the more unsettling.",
    third = "{name} met Tonga Runetotem, a tauren druid at the Crossroads tracing the sickness that poisons the oases of the Barrens.",
  },

  greetings = {
    { id = "g_calm", text = "Peace, friend. The land is restless lately. All the more reason for us not to be." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Druid-kin, good. I need eyes that see the land the way I do, so sit, and I'll tell you what's wrong with it." },
  },

  notice = {
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "You came in on four legs, and fast. That's good, because the Barrens is big, and the faster we move, the more we can save." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "My name is Tonga Runetotem. Thunder Bluff sent me to find where a strange power in the Barrens was coming from, and I found it, though I wish I hadn't." },
        { id = "h_oases", tags = { "news" }, when = { questActive = TODO_QUEST("The Barrens Oases") },
          text = "The oases are the heart of the Barrens, and something is poisoning them. Bring me samples from the water, and we'll see how deep the sickness goes." },
        { id = "h_stagnant", when = { questActive = TODO_QUEST("The Stagnant Oasis") },
          text = "The Stagnant Oasis is the worst of all, so go carefully. The things that drink from it aren't themselves anymore." },
        { id = "h_hamuul", when = { questActive = TODO_QUEST("Hamuul Runetotem") },
          text = "Take what we've found to the Arch Druid. He'll want to see it with his own eyes, as I would in his place." },
        { id = "h_cure", when = { questActive = TODO_QUEST("Gathering the Cure") },
          text = "The gazelles near Dreadmist Peak are sick. Moonglade's lore and the Barrens' own water together might make them well, if you bring me what's needed." },
      },
      choices = {
        { text = "What did you find?", next = "found" },
        { text = "I'm a druid too, Tonga. Can I help heal the oases?", next = "druid", when = { class = "DRUID" } },
        { text = "The water spirits here are crying out.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Farewell, Tonga.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something more, friend? The land isn't in a hurry, even if we must be." },
      },
    },
    druid = {
      lines = {
        { id = "dr_default", text = "You can, and you should, but carefully. The druids in those caverns were trying to heal the land too, and they walked into the Dream and didn't come out themselves. Heal from the waking world first." },
        { id = "dr_pupil", when = { origin = "tauren_hamuul_pupil" },
          text = "You studied under Hamuul as I did, so you've heard his warning about the Dream already. Those druids under the Barrens heard it too, and went anyway." },
      },
      choices = {
        { text = "The Dream is dangerous. I'll stay in the waking world.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "If the sickness is in the Dream, that's where I'll fight it.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "They are, and I can only feel it as a wrongness in the green, while you hear it in words. Tell me what they say, friend, and I'll write it down for Hamuul; he'll want the spirits' account beside mine." } },
      choices = { { text = "They say the water is dreaming badly.", next = "BACK", fx = { affinity = 2, learn = { "wailing_caverns" } } } },
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
      lines = { { id = "s_default", text = "By someone braver than me. Go into the caverns when you're strong and find who started this, and start with the water. Always start with the water." } },
      choices = {
        { text = "I will.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll go when there's coin in it, and not before.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    druids = {
      lines = { { id = "d_default", text = "Druids meant well. That's the most frightening part, friend. Anyone can mean well and still go wrong in the dark." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've listened to the Barrens a long while, and it tells me more than people do. Ask me about any of these, friend." },
    },
    wailing_caverns = { { id = "tp_caverns", text = "It's a cave with a poisoned dream at the bottom of it. That's the plain version, and the plain version is bad enough." } },
    cenarion_circle = { { id = "tp_circle", text = "Hamuul brought us into it. The Barrens needs every druid it can get, and the Circle needs to hear about this place." } },
    _none = { { id = "tp_none", text = "I don't know, friend, but the land might. Listen to it a while." } },
  },
}

P:NPC {
  key = "helbrim", id = TODO_NPC("Apothecary Helbrim"), name = "Apothecary Helbrim",
  bible = "bibles/crossroads.md", role = "scholar", tier = "quest",
  communities = { "crossroads" }, temper = { "clinical" }, values = { "curious", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Apothecary Helbrim swears the Society only wants to study the Barrens, not harm it, mostly. That 'mostly' has stayed with me longer than anything else he said.",
    third = "{name} met Apothecary Helbrim of the Royal Apothecary Society, who studies what grows, festers and stings in the Barrens.",
  },

  greetings = {
    { id = "g_samples", text = "Hands! Living ones, even, which is excellent. Mine shake a little, these days." },
    { id = "g_back", when = { metBefore = true }, text = "Back with something for me? The Barrens is full of things worth bottling." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "You work with reagents? Good, then we'll talk shop, you and I. The others here only ask what's in my bottles so they can avoid it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Don't look at me like that; we're on the same side. The Society only wants to study the Barrens, not harm it. Mostly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The name is Helbrim, of the Royal Apothecary Society. The Society sent me to see what grows out here that might be useful, and a great deal does, it turns out." },
        { id = "h_spores", tags = { "news" }, when = { questActive = TODO_QUEST("Fungal Spores") },
          text = "Spores from the fungus out by the water are what I need, and don't breathe near them. Well, you do still breathe, I suppose, so I'll simply advise against it." },
        { id = "h_zamah", when = { questActive = TODO_QUEST("Apothecary Zamah") },
          text = "Zamah needs this, up in Thunder Bluff by the Pools of Vision. The tauren don't entirely trust the Society, but they trust Zamah." },
        { id = "h_dizzywig", when = { questActive = TODO_QUEST("Wharfmaster Dizzywig") },
          text = "Dizzywig at Ratchet is to have this delivery. The goblins will move anything for the right price, and some of my shipments need moving very discreetly." },
      },
      choices = {
        { text = "What are you studying?", next = "study" },
        { text = "Does the Society send you word from Undercity?", next = "forsaken", when = { race = "Scourge" } },
        { text = "My people make medicine from these plants too.", next = "troll", when = { race = "Troll" } },
        { text = "Good luck with your work.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a sample warming, so be brief." },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "Every fortnight, by bat, and always the same thing: more samples, faster, and fewer questions from the tauren. Master Faranell is not a patient correspondent, though I'm told patience is a living virtue anyway." } },
      choices = {
        { text = "The Society's work comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The tauren deserve answers, Helbrim.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "Do they? Witch doctors' remedies, I suppose, which some of my colleagues sneer at. I don't, because half of what the Society knows about poisons began as someone's grandmother's cure, so do tell me which of these your people boil." } },
      choices = { { text = "Peacebloom, for fever. Never the fungus.", next = "BACK", fx = { affinity = 2 } } },
    },
    study = {
      big = true,
      lines = {
        { id = "s_default", text = "Everything that grows, festers or stings out here, and what I'm after is remedies, mostly. Some of us still remember being sick, and we'd like no one else to be." },
      },
      choices = {
        { text = "That's kind of you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Mostly remedies?", next = "mostly" },
      },
    },
    mostly = {
      lines = { { id = "m_default", text = "You listen closely. Mostly remedies, yes, but science is science, and what people do with it is their own affair." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "A poisoned dream leaking into the water? Terrible, of course, but quite fascinating." } },
    _none = { { id = "tp_none", text = "Not my field. Bring me a sample and I'll make it my field." } },
  },
}

P:NPC {
  key = "darsok", id = TODO_NPC("Darsok Swiftdagger"), name = "Darsok Swiftdagger",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "boastful" }, values = { "proud" },
  notices = { "class", "stealth" },
  impression = {
    first = "If Darsok Swiftdagger is to be believed, he is the best there is and cheaper besides. He is so pleased with himself that it is almost charming, though I would still keep an eye on my purse.",
    third = "{name} met Darsok Swiftdagger, a boastful blade at the Crossroads who wages his own war on the harpies of the hills.",
  },

  greetings = {
    { id = "g_blade", text = "Need someone dead? I'm the best there is. Need someone dead quietly? That's still me, and I'm cheaper, too." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, my favourite errand-runner. How many feathers today?" },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A fellow blade, eh? Don't get any ideas; I saw you coming from the gate, and nobody sneaks up on Darsok." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Ha! Nice try, but I can smell a shadow from twenty paces. Come out, before I come in." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The name's Darsok Swiftdagger. Throats, backs and the soft bits between armour plates are my trade, and I'm good at it." },
        { id = "h_harpy", tags = { "news" }, when = { questActive = TODO_QUEST("Harpy Raiders") },
          text = "Up in the hills you'll find harpies, filthy screeching things. Bring me their talons; I'd go myself, but I'd enjoy it too much." },
        { id = "h_lieutenants", when = { questActive = TODO_QUEST("Harpy Lieutenants") },
          text = "Now for the ones who give the orders: their lieutenants. Cut the head off a flock and the rest fly in circles." },
        { id = "h_serena", tags = { "news" }, when = { questActive = TODO_QUEST("Serena Bloodfeather") },
          text = "Serena Bloodfeather is their matriarch. Bring me her head, and then they'll know the Crossroads bites back." },
        { id = "h_jinzil", when = { questActive = TODO_QUEST("Letter to Jin'Zil") },
          text = "This letter goes to my old friend Jin'Zil, a witch doctor out in Stonetalon, and he'll have a use for you. Don't read it; he'll know." },
      },
      choices = {
        { text = "Are you really the best?", next = "best" },
        { text = "I'm a blade too. Teach me something.", next = "rogue", when = { class = "ROGUE" } },
        { text = "You know Jin'Zil? He's Darkspear, like me.", next = "troll", when = { race = "Troll" } },
        { text = "I'll handle the harpies.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, the harpies won't kill themselves, more's the pity." },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Something for free from Darsok, eh? Fine, here is one lesson: harpies look up and never down, so come at them from below the ridge and they'll never see the knife. That one's worth gold in Ratchet." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "A deathstalker, eh? The Dark Lady trains you lot to kill quiet and report back, and I only do the first part. Tell your masters Darsok sends his regards." },
      },
      choices = {
        { text = "A clean kill from hiding. That's the job.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I'd rather they saw me coming.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "Know him? He pulled a harpy talon out of my shoulder once and charged me for the voodoo. You trolls drive a hard bargain, and I respect that more than I'd tell the Warchief." } },
      choices = { { text = "Ha. I'll carry your letter, then.", next = "BACK", fx = { affinity = 2 } } },
    },
    best = {
      lines = { { id = "b_default", text = "Ask the harpies. Oh, wait, you can't, and that's how good I am." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } }, { text = "Charming.", next = "END" } },
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
  impression = {
    first = "Zargh the butcher sells meat to everyone who passes the Crossroads, which is everyone. Mention Gryshka in Orgrimmar and he goes as bashful as a butcher with a cleaver can.",
    third = "{name} met Zargh, the jolly butcher of the Crossroads, who has his heart set on a certain innkeeper in Orgrimmar.",
  },

  greetings = {
    { id = "g_meat", text = "Fresh meat! Well, recent meat. Stock up before you head out; the Barrens won't feed you kindly." },
    { id = "g_back", when = { metBefore = true }, text = "Hungry again? Course you are; everyone's hungry out here." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Take a look at these cuts of prime zhevra. Well, zhevra, anyway; prime is a strong word for anything in the Barrens." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Zargh, and I'm the butcher. I sell meat to everyone who passes through the Crossroads, which is everyone, so business is good. Everything else is the Barrens." },
        { id = "h_meats", tags = { "news" }, when = { questActive = TODO_QUEST("Meats to Orgrimmar") },
          text = "Take these choice cuts to Gryshka at the inn in Orgrimmar, and get them there fresh. And tell her, well, tell her they're from me; she'll know what that means." },
        { id = "h_return", when = { questDone = TODO_QUEST("Return to the Crossroads") },
          text = "She liked them, she actually said that? Good, good! If there's a wedding you're invited, but I'm only saying if, mind; I'm not saying there's a wedding." },
        { id = "h_bones", when = { metBefore = true }, text = "Gryshka sent back the bones, picked clean. I don't know what that means, but I've decided it's a good sign." },
      },
      choices = {
        { text = "What happened to your finger?", next = "finger" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "I hunt the plains. Want what I bring back?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Not hungry.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a zhevra on the block that won't cut itself." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "A hunter who brings it in already dressed? You're my favourite kind of customer, the kind who's also my supplier. Bring me zhevra flank and I'll cut the best of it for Gryshka's next delivery." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "That beast of yours has been staring at my block since you walked up. Here, {pet}, a scrap, and that's all; I've got a reputation for stinginess to keep up." },
      },
      choices = { { text = "Only the best cuts go to Gryshka.", next = "BACK", fx = { affinity = 2 } } },
    },
    finger = {
      big = true,
      lines = {
        { id = "f_default", text = "An accident with the cleaver, a long time ago. Don't look at the sausages like that; I looked for it, I promise. Mostly." },
      },
      choices = { { text = "...I'll pass on the sausages.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't know, friend. I know meat, so ask me about meat." } },
  },
}

P:NPC {
  key = "boorand", id = TODO_NPC("Innkeeper Boorand Plainswind"), name = "Innkeeper Boorand Plainswind",
  bible = "bibles/crossroads.md", role = "innkeeper", tier = "service",
  communities = { "crossroads" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },
  impression = {
    first = "Hooves, feet or whatever else comes through the door, Innkeeper Boorand Plainswind welcomes them all. He likes his leaky roof because that is how the stars get in, and he keeps putting food in Mankrik's hands.",
    third = "{name} rested at Innkeeper Boorand Plainswind's inn at the Crossroads, where every traveller of the Barrens sleeps sooner or later.",
  },

  greetings = {
    { id = "g_inn", text = "Rest your hooves, or your feet, or whatever you've got. Everyone's welcome under this roof." },
    { id = "g_home", when = { homeInn = { "The Crossroads" } }, text = "Back to the Crossroads! Your bedroll's where you left it. I swept the dust off twice." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "The Barrens beat you up, little one. Sit down and eat; the Barrens will still be out there in the morning, sadly." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy. The floor's flat in here, but it won't feel like it. Sit down before it proves me wrong." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Boorand Plainswind is my name, and I keep the inn at the Crossroads. Orcs, trolls, tauren, the odd Forsaken: they all sleep the same once they're tired enough." },
        { id = "h_mankrik", when = { heardLine = "mankrik.h_default" },
          text = "Mankrik's been on that wall since before I got here. He eats when someone puts food in his hands, so I put food in his hands." },
        { id = "h_roof", when = { metBefore = true }, text = "A goblin from Ratchet stayed three nights and tried to sell me a better roof. This roof is fine; it has holes, and that's how the stars get in." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night at the Crossroads is never quiet. Riders coming in, wind riders grumbling on the tower. I'd miss it if it stopped." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Any news?", next = "news" },
        { text = "I don't really sleep anymore, Boorand.", next = "forsaken", when = { race = "Scourge" } },
        { text = "Just resting.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else, little one? Ask it by the fire, where the Barrens wind can't reach us." },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "No, I suppose you don't, and I'm sorry for it. Sit by the fire anyway, because I've seen your people warm their hands like everyone else, and I don't think it's only habit." } },
      choices = { { text = "Maybe it isn't. Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
    news = {
      lines = { { id = "n_default", text = "Everyone coming through asks the same question: where's Mankrik's wife? If you find out, tell him first and then tell me, because I'm tired of not knowing either." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Tonga, by the inn. He knows the Barrens better than anyone." } },
  },
}
