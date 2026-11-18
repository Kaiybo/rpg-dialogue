-- More of Desolace: the Centaur Pariah (The Pariah's Instructions), Willow at Kormek's Hut (Twisted Evils),
-- Shadowprey's Aboda, Lui'Mala and Malux, Ghost Walker Post's Muuran, and Nijel's Point's Maxton Strang
-- and Shelgrayn. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Centaur Pariah: exiled heretic who would unite the tribes.
---------------------------------------------------------------------------
P:NPC {
  key = "pariah", id = TODO_NPC("Centaur Pariah"), name = "Centaur Pariah",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "fierce", "proud" }, values = { "unity", "heritage" },
  notices = { "race", "class" },
  impression = {
    first = "He believes the centaur should stop fighting and unite as one people.",
    third = "{name} met the Centaur Pariah, an exile who dreams of uniting the centaur tribes.",
  },
  greetings = {
    { id = "g_hi", text = "You do not run from me. Good; then perhaps you will listen, which is more than my own people would do." },
    { id = "g_back", when = { metBefore = true }, text = "You again, outsider. Have you thought on what I told you?" },
    { id = "g_active", when = { questActive = TODO_QUEST("The Pariah's Instructions") }, text = "What did you decide? Will you set foot on holy ground to help me forge one great centaur tribe?" },
    { id = "g_done", when = { questDone = TODO_QUEST("The Pariah's Instructions") }, text = "The amulet is mine, and the great task has begun. I hope that when we meet again, it will be on very different terms." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. My people hunted yours across the plains for generations, and I will not pretend otherwise. Perhaps that is why it must be someone like you who helps me." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "A night elf. You think your heritage noble; ours is just as noble, though my brothers have forgotten it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I need no home to know I still have a place in this world. The tribes fight one another, and for what? Scraps left by vultures, and lands crawling with the Legion's filth." },
        { id = "h_active", when = { questActive = TODO_QUEST("The Pariah's Instructions") }, text = "Read my instructions well. Maraudon is a tomb my people guard, and only the most devout are ever allowed inside; you are neither, and that is exactly why it must be you." },
      },
      again = {
        { id = "h_again", text = "What else? Speak, outsider. I have no tribe to hear me but you." },
        { id = "h_again2", text = "Ask. An exile has more time than he wants." },
      },
      choices = {
        { text = "Why were you cast out?", next = "exile" },
        { text = "What would you have me do?", next = "task" },
        { text = "The centaur are only raiders and butchers.", next = "raiders" },
        { text = "Your people hunted mine for generations.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll leave you to your wandering.", next = "END" },
      },
    },
    exile = {
      lines = { { id = "ex_default", text = "For heresy, they say, because I told the Khans that the Gelkis and the Magram and the Kolkar are one people and should act like it. The Khans do not like to hear that their tribe is not the only one that matters." } },
      choices = {
        { text = "And you still believe it?", next = "exile_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    exile_believe = {
      big = true,
      lines = { { id = "eb_default", text = "Though exiled as a heretic, my beliefs still ring true, and that alone drives me onward. The centaur should be proud of their heritage; it is time we started acting like it." } },
      choices = {
        { text = "A people united is stronger. You're right.", next = "BACK", reply = "Then you see what my brothers will not. Help me make them see it.", fx = { align = { order = 1 } } },
        { text = "United centaur would be a danger to everyone.", next = "BACK", reply = "To those who hunt us, perhaps. Better a strong people than a hundred starving warbands.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    task = {
      lines = { { id = "ta_default", text = "To enter the holy halls of Maraudon, where the first Khans of my people lie, and take from them what I need to forge an amulet of union. With it, I can speak to every tribe and be heard." } },
      choices = {
        { text = "You'd send me to rob your own ancestors?", next = "task_rob" },
        { text = "Something else.", next = "BACK" },
      },
    },
    task_rob = {
      big = true,
      lines = { { id = "tr_default", text = "I would send you to wake them. The Khans' spirits are bound to quarrel forever in that tomb, as their children quarrel above it, and only when they are joined can my people be joined too." } },
      choices = {
        { text = "Then I'll do it. For a people made whole.", next = "BACK", reply = "Then nod, and I will pass you my instructions. Read them well.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll do it, but only for what's in it for me.", next = "BACK", reply = "Honest, at least. I will reward you, outsider; it is the outcome I care about.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    raiders = {
      lines = { { id = "ra_default", text = "That is what we have become, and I will not deny it. But our heritage is as noble as any night elf's or orc's, and a people can be more than what hunger has made of them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "tn_default", text = "They did, and I will not ask you to forgive it. I will only say that a united people with a homeland has less need to raid anyone else's." } },
      choices = {
        { text = "That's a fair hope.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a centaur of a tribe. Now I am a centaur of all of them, whether they like it or not." } },
    maraudon = { { id = "tp_maraudon", text = "The holy tomb of my people, guarded by the most devout. I cannot enter; you can." } },
    _none = { { id = "tp_none", text = "Bah, I care nothing for that. Ask me of the tribes, or leave me be." } },
  },
}

---------------------------------------------------------------------------
-- Willow: a Forsaken "scholar" at Kormek's Hut (secretly Twilight's Hammer). Twisted Evils.
---------------------------------------------------------------------------
P:NPC {
  key = "willow", id = TODO_NPC("Willow"), name = "Willow",
  bible = "bibles/more_folk.md", role = "scholar", tier = "quest",
  communities = {}, temper = { "smooth", "sly" }, values = { "secrets", "power" },
  notices = { "race", "class" },
  impression = {
    first = "She grew less friendly when I asked what the carvings were for.",
    third = "{name} met Willow, a Forsaken researcher at Kormek's Hut who wants relics from Maraudon.",
  },
  greetings = {
    { id = "g_hi", text = "A visitor, out here? How lovely. Do come in; mind the bones." },
    { id = "g_back", when = { metBefore = true }, text = "Ha! I knew you'd be back. They always come back." },
    { id = "g_active", when = { questActive = TODO_QUEST("Twisted Evils") }, text = "Don't ask questions. You have my request; bring me the carvings." },
    { id = "g_done", when = { questDone = TODO_QUEST("Twisted Evils") }, text = "So easy to convince, and so very useful. Thank you again, darling." },
  },
  notice = {
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Another of the Lady's children, so far from the Undercity. Don't tell them where I am, and I won't tell them where you've been." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. How interesting. You hear the elements whisper too, don't you?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Willow, a humble researcher, here purely for the sake of science. The crystal caverns of Terramok lie to the west, deep within Maraudon, and there's so much history hidden down there just waiting for someone to study it." },
        { id = "h_active", when = { questActive = TODO_QUEST("Twisted Evils") }, text = "Bring me the theradric crystal carvings you find in Maraudon, and I'll make it worth your while. Once I have them, I will be able to... study them." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, darling, I have notes to burn... to write, I mean." },
        { id = "h_again2", text = "Go on, ask. I'll decide whether to answer." },
      },
      choices = {
        { text = "What are you looking for in Maraudon?", next = "carvings" },
        { text = "Why live all the way out here?", next = "hut" },
        { text = "You don't seem like a scholar to me.", next = "suspicion" },
        { text = "I'll leave you to your research.", next = "END" },
      },
    },
    carvings = {
      lines = { { id = "ca_default", text = "Carvings of theradric crystal, from behind the great doors of Terramok. Relics of a very old power, older than the centaur, older than the elves; powers that have been too long at rest." } },
      choices = {
        { text = "Too long at rest? That sounds ominous.", next = "carvings_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carvings_rest = {
      big = true,
      lines = { { id = "cr_default", text = "Ominous? It's history, darling, and history is only ominous to those who don't understand it. Will you fetch them for me, or must I find someone with fewer scruples?" } },
      choices = {
        { text = "I'll fetch them, and I'll keep an eye on you.", next = "BACK", reply = "Keep both eyes on me if you like. I'll be right here, studying.", fx = { align = { light = 1 } } },
        { text = "I'll fetch them. Your business is your own.", next = "BACK", reply = "That's the spirit. The best helpers never ask.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hut = {
      lines = { { id = "hu_default", text = "Because no one comes out here, and no one asks questions. The Undercity's apothecaries and I had a small disagreement about what's worth studying, so I found a quieter place." } },
      choices = {
        { text = "What disagreement?", next = "hut_disagree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hut_disagree = {
      lines = { { id = "hd_default", text = "Oh, nothing worth repeating. They prefer the dead and their diseases, and I prefer the living earth and what sleeps beneath it. Shall we leave it there?" } },
      choices = {
        { text = "We'll leave it there. For now.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    suspicion = {
      big = true,
      lines = { { id = "su_default", text = "Don't I? And what do scholars look like, darling, in your vast experience? I pay well and I ask for very little, which should be enough for anyone." } },
      choices = {
        { text = "Coin doesn't make you honest. I'll be watching.", next = "BACK", reply = "Watch all you like. I've nothing to hide that you'd understand.", fx = { align = { honor = 1 } } },
        { text = "Coin's enough for me.", next = "BACK", reply = "Good. I knew we'd get along.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a researcher. That's all you need to know, and frankly it's more than most get." } },
    maraudon = { { id = "tp_maraudon", text = "Full of wonderful things, darling, and some of them still asleep." } },
    _none = { { id = "tp_none", text = "Don't ask questions. I'm told it's a rule of mine." } },
  },
}

---------------------------------------------------------------------------
-- Aboda: stable master at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "aboda", id = TODO_NPC("Aboda"), name = "Aboda", title = "Stable Master",
  bible = "bibles/more_folk.md", role = "stablemaster", tier = "service",
  communities = { "shadowprey" }, temper = { "calm", "gentle" }, values = { "beasts", "patience" },
  notices = { "class" },
  impression = {
    first = "He seems happiest with a kodo's head resting on his shoulder.",
    third = "{name} met Aboda, the gentle tauren stable master at Shadowprey Village.",
  },
  greetings = {
    { id = "g_hi", text = "Peace. If you have a beast to leave, I will care for it as my own." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Your beasts have been well; I sang to them last night." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} is tired from the road. It would rest well here, if you let it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Aboda, and I keep the stables here at Shadowprey. Desolace is hard on beasts, harder than on people, so they need someone to look after them." },
      },
      again = {
        { id = "h_again", text = "What else? The beasts can wait a moment." },
        { id = "h_again2", text = "Ask. I am in no hurry." },
      },
      choices = {
        { text = "I'd like to stable a beast.", next = "BUSINESS" },
        { text = "Why is Desolace hard on beasts?", next = "hard" },
        { text = "Do you see the Kodo Graveyard from here?", next = "graveyard" },
        { text = "Farewell, Aboda.", next = "END" },
      },
    },
    hard = {
      lines = { { id = "ha_default", text = "There is little grass and less water, and the land itself feels sick in places, where the demons walked. A beast knows when the earth is wrong, and it frets." } },
      choices = {
        { text = "Can you calm them?", next = "hard_calm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard_calm = {
      big = true,
      lines = { { id = "hc_default", text = "With patience and a song. Some say a beast should be broken to the bit, but I say a beast that trusts you will carry you further than one that fears you." } },
      choices = {
        { text = "Trust is better than fear.", next = "BACK", reply = "Yes. You understand beasts, I think.", fx = { align = { light = 1 } } },
        { text = "Fear works faster, and the road is long.", next = "BACK", reply = "Faster, yes, but it does not last. I will keep my songs.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    graveyard = {
      lines = { { id = "gy_default", text = "Not from here, but I feel it. The old kodo walk there to die, and their spirits linger, and the beasts in my care grow quiet whenever the wind blows from that way." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep beasts. I have always kept beasts, since I was a calf myself." } },
    _none = { { id = "tp_none", text = "I don't know that. Ask the beasts; they know more than they say." } },
  },
}

---------------------------------------------------------------------------
-- Lui'Mala: fishing trainer at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "luimala", id = TODO_NPC("Lui'Mala"), name = "Lui'Mala", title = "Fishing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "shadowprey" }, temper = { "jovial", "chatty" }, values = { "sea", "ease" },
  notices = { "race", "craft" },
  impression = {
    first = "He laughs at his own stories more than anyone else does.",
    third = "{name} met Lui'Mala, the troll fishing trainer at Shadowprey Village.",
  },
  greetings = {
    { id = "g_hi", text = "Hey, mon, you come to fish? The sea be generous here, if you be patient." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Catch anything, or did the sea laugh at you?" },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! Tell me, you miss the Echo Isles? I miss dem every morning, and forget them by noon." },
    { id = "n_fish", cat = "craft", when = { profession = { name = "Fishing", min = 150 } },
      text = "You hold that pole like you mean it, and dat be half of fishin', mon." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Lui'Mala, and I teach fishin' here at Shadowprey. Somebody gotta feed the village, and de fish don't catch themselves." },
      },
      again = {
        { id = "h_again", text = "What else, mon? The knife be gettin' bored. The tide's comin' in." },
        { id = "h_again2", text = "Ask, ask. I got all day, and so do the fish." },
      },
      choices = {
        { text = "Teach me fishing.", next = "BUSINESS" },
        { text = "What's in the water here?", next = "water" },
        { text = "Is it better than the Echo Isles?", next = "isles" },
        { text = "Later, Lui'Mala.", next = "END" },
      },
    },
    water = {
      lines = { { id = "wa_default", text = "Big fish, mon, and bigger things that eat them. The Slitherblade naga swim close sometimes, so don't fish too far out, or you be de one gettin' caught." } },
      choices = {
        { text = "I'll keep close to shore.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles = {
      big = true,
      lines = { { id = "is_default", text = "Today I say yes, because the fish be bitin'. Tomorrow I say no, because I miss home, and the day after I say dat a troll who can't be happy in two places can't be happy anywhere." } },
      choices = {
        { text = "Home is wherever the Darkspear stand.", next = "BACK", reply = "Ha! Dat be true, mon, and Vol'jin would say the same.", fx = { align = { order = 1 } } },
        { text = "Home is wherever the fish bite.", next = "BACK", reply = "Now you talkin' like a real fisherman! Ha!", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fish, mon. I fished on the Echo Isles, and now I fish here, and the fish don't know the difference." } },
    _none = { { id = "tp_none", text = "Dunno, mon, but I can tell you where the fish be." } },
  },
}

---------------------------------------------------------------------------
-- Malux: skinning trainer at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "malux", id = TODO_NPC("Malux"), name = "Malux", title = "Skinning Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "shadowprey" }, temper = { "dry", "blunt" }, values = { "craft", "hunt" },
  notices = { "craft", "class" },
  impression = {
    first = "Only the hides of Desolace's scorpids make him almost cheerful.",
    third = "{name} met Malux, the troll skinning trainer at Shadowprey Village.",
  },
  greetings = {
    { id = "g_hi", text = "You want to learn skinnin', or you just lookin' at my knife? Most people only look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, mon. Show me your hides, and I tell you what you did wrong." },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = { name = "Skinning", min = 150 } },
      text = "Clean cuts on that leather. Somebody taught you right, mon." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Malux. I teach skinnin', and in Desolace there be plenty to skin, so you won't run out of practice." },
      },
      again = {
        { id = "h_again", text = "What else, mon? The knife be gettin' bored." },
        { id = "h_again2", text = "Go on, I be listenin'." },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "What's worth skinning in Desolace?", next = "worth" },
        { text = "You're very attached to that knife.", next = "knife" },
        { text = "Later, Malux.", next = "END" },
      },
    },
    worth = {
      lines = { { id = "wo_default", text = "Scorpid hide, mon, tough as stone and light as a feather once you work it. Kodo hides be good too, but don't you dare take them from the graveyard, because dem kodo came there to die in peace." } },
      choices = {
        { text = "Why not the graveyard?", next = "worth_grave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worth_grave = {
      big = true,
      lines = { { id = "wg_default", text = "Because the spirits be watchin', and the tauren here would never forgive you. Some skinners don't care, and they sell those hides in Orgrimmar like dey be anythin' else." } },
      choices = {
        { text = "Some places should be left alone.", next = "BACK", reply = "Right, mon. You got sense.", fx = { align = { light = 1 } } },
        { text = "A hide is a hide. The dead don't need it.", next = "BACK", reply = "Say dat to a tauren, mon, and see what happens, but not in my village.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    knife = {
      lines = { { id = "kn_default", text = "A skinner without his knife be like a fisherman without his pole, mon, useless and lonely. This one I made myself from a scorpid's tail, and it never needs sharpenin'." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I skin, and I teach skinnin', and dat be all there is, mon." } },
    _none = { { id = "tp_none", text = "Don't know, mon, but if it got a hide, I know how to skin it." } },
  },
}

---------------------------------------------------------------------------
-- Muuran: superior macecrafter at Ghost Walker Post.
---------------------------------------------------------------------------
P:NPC {
  key = "muuran", id = TODO_NPC("Muuran"), name = "Muuran", title = "Superior Macecrafter",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ghost_walker" }, temper = { "proud", "gruff" }, values = { "craft", "strength" },
  notices = { "class" },
  impression = {
    first = "He calls himself a superior macecrafter without a hint of modesty.",
    third = "{name} met Muuran, the proud macecrafter of Ghost Walker Post.",
  },
  greetings = {
    { id = "g_hi", text = "Maces, friend, the finest in Desolace. Take one in your hand and feel what a weapon is meant to be." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Is the mace I sold you still in one piece? It should be." },
  },
  notice = {
    { id = "n_arms", cat = "class", when = { class = { "SHAMAN", "WARRIOR" } },
      text = "You have the arms to swing one of mine properly. Most don't." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Muuran. I make maces, and I make them better than anyone between Feralas and Stonetalon. The Kolkar have learned that, and so have the demons at Mannoroc." },
      },
      again = {
        { id = "h_again", text = "What else? I have a haft to wrap." },
        { id = "h_again2", text = "Ask, friend." },
      },
      choices = {
        { text = "Show me your maces.", next = "BUSINESS" },
        { text = "Why maces, and not blades?", next = "why" },
        { text = "What makes a superior mace?", next = "superior" },
        { text = "Farewell, Muuran.", next = "END" },
      },
    },
    why = {
      big = true,
      lines = { { id = "wh_default", text = "A blade can be turned, a blade can be broken, and a blade must be kept sharp. A mace only needs to be swung, and it does not care what it hits; centaur, demon or Burning Blade, they all fall the same." } },
      choices = {
        { text = "Simple and honest. A good weapon.", next = "BACK", reply = "Exactly. You have sense.", fx = { align = { order = 1 } } },
        { text = "A blade takes more skill. I prefer that.", next = "BACK", reply = "Skill, yes, and more maintenance. Take a mace as well, for when the blade breaks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    superior = {
      lines = { { id = "su_default", text = "Balance, first; a head too heavy will pull your arm down after the third swing. Then a haft that will not crack, and I wrap mine in kodo leather, tight as a drum." } },
      choices = {
        { text = "Where do you get your iron?", next = "superior_iron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    superior_iron = {
      lines = { { id = "si_default", text = "From the traders who come through from Stonetalon, and sometimes from the Burning Blade's own weapons, once they have no more use for them. I melt them down and make something honest out of them." } },
      choices = {
        { text = "That's fitting.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I make maces. My father made maces. It is good, honest work." } },
    _none = { { id = "tp_none", text = "I don't know that. Ask me about maces." } },
  },
}

---------------------------------------------------------------------------
-- Maxton Strang: mail armor merchant at Nijel's Point.
---------------------------------------------------------------------------
P:NPC {
  key = "maxton", id = TODO_NPC("Maxton Strang"), name = "Maxton Strang", title = "Mail Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "nijels_point" }, temper = { "wry", "brisk" }, values = { "practical", "trade" },
  notices = { "class" },
  impression = {
    first = "He seems to measure everyone for a hauberk on sight.",
    third = "{name} met Maxton Strang, the Stormwind mail armour merchant at Nijel's Point.",
  },
  greetings = {
    { id = "g_hi", text = "Mail armour, friend, good Stormwind links. Sand gets in everything out here, so I oil it twice a day." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Rings holding up? If they're squeaking, it's the sand." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "SHAMAN" } },
      text = "You look the type to want light mail. I've a few pieces that won't slow you down." },
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "WARRIOR" } },
      text = "You'll be wanting the heavy links, I'd guess. Step over here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Maxton Strang, mail armour. I came out from Stormwind with Captain Pentigast's lot, thinking it'd be a short posting, and here I am still oiling rings in the desert." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the oil pot." },
        { id = "h_again2", text = "Go on, friend." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "Why did you come to Desolace?", next = "why" },
        { text = "The sand must be a nuisance.", next = "sand" },
        { text = "Farewell, Maxton.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Coin, mostly, and a promise of more. Soldiers posted somewhere this dangerous need armour, and they need it replaced often, because the centaur and the Burning Blade don't care much for good craftsmanship." } },
      choices = {
        { text = "And do you regret it?", next = "why_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_regret = {
      big = true,
      lines = { { id = "wr_default", text = "Some days. But Pentigast's soldiers need what I sell, and if I'd stayed in Stormwind, someone else would be selling them cheaper links that break at the first spear." } },
      choices = {
        { text = "Then you're doing good work here.", next = "BACK", reply = "I like to think so. Doesn't stop the sand, though.", fx = { align = { honor = 1 } } },
        { text = "You came for the coin. Own it.", next = "BACK", reply = "I do, friend, and I'm not ashamed of it. But the soldiers still need the links.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sand = {
      lines = { { id = "sa_default", text = "It gets into the rings, it grinds them thin, and then they snap when you least want them to. Oil your mail every night out here, or it'll be in pieces before the month's out." } },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Stormwind armourer, out of Old Town. Now a desert armourer, out of my mind." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. I know rings and oil, not much else." } },
  },
}

---------------------------------------------------------------------------
-- Shelgrayn: night elf stable master at Nijel's Point.
---------------------------------------------------------------------------
P:NPC {
  key = "shelgrayn", id = TODO_NPC("Shelgrayn"), name = "Shelgrayn", title = "Stable Master",
  bible = "bibles/more_folk.md", role = "stablemaster", tier = "service",
  communities = { "nijels_point" }, temper = { "calm", "formal" }, values = { "beasts", "balance" },
  notices = { "class", "race" },
  impression = {
    first = "She is polite with owners, though she clearly prefers the beasts.",
    third = "{name} met Shelgrayn, the night elf stable master at Nijel's Point.",
  },
  greetings = {
    { id = "g_hi", text = "Ishnu-alah. If you have a companion that needs rest, I will keep it safe." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your companion has been well cared for." },
  },
  notice = {
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Elune-adore, {g:brother|sister}. It is good to see a kaldorei face so far from Ashenvale." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} is a fine creature. It has travelled far, I think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Shelgrayn, and I tend the beasts at Nijel's Point. This land is cruel to them, so I try to be kind." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask, if you wish. I have time." },
      },
      choices = {
        { text = "I'd like to stable a beast.", next = "BUSINESS" },
        { text = "Why does a night elf serve at a human outpost?", next = "why" },
        { text = "What do the beasts fear here?", next = "fear" },
        { text = "Farewell, Shelgrayn.", next = "END" },
      },
    },
    why = {
      big = true,
      lines = { { id = "wh_default", text = "The Alliance asked for help holding this place against the demons and the centaur, and Talendria and I answered. Some of my people think we should keep to our forests; I think the Legion does not stop at the edge of Ashenvale." } },
      choices = {
        { text = "The Alliance must stand together. You're right.", next = "BACK", reply = "Thank you. It is good to hear it said aloud.", fx = { align = { order = 1 } } },
        { text = "Your people should guard their own lands first.", next = "BACK", reply = "Perhaps. But if Desolace falls, our forests are next.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear = {
      lines = { { id = "fe_default", text = "The demons at Mannoroc Coven, most of all. Beasts know the smell of the Legion, and on nights when the wind comes from the south, none of them sleep." } },
      choices = {
        { text = "And you?", next = "fear_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear_you = {
      lines = { { id = "fy_default", text = "My people have not forgotten the Legion in ten thousand years, and neither, it seems, have the beasts. I do not sleep on those nights either." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I tend beasts. I have done so in Ashenvale, in Darkshore, and now here." } },
    _none = { { id = "tp_none", text = "I do not know of that. Perhaps Talendria would." } },
  },
}
