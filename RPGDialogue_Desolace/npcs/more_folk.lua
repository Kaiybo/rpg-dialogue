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
        { text = "You've strange neighbours out here.", next = "neighbours" },
        { text = "The Dark Lady's interest reaches a long way.", next = "lady", when = { race = "Scourge" } },
        { text = "The elements don't care for what you study.", next = "elements", when = { class = "SHAMAN" } },
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
    neighbours = {
      lines = {
        { id = "neighbours_d", text = "A goblin called Bibbly F'utzbuckle shares the hut and pays for kodo bones from the graveyard, and the Gizelton caravan rattles past whenever it has not been robbed. I find the kodo graveyard better company than either." },
      },
      choices = {
        { text = "What does Bibbly make of your work?", next = "neighbours_bibbly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours_bibbly = {
      lines = {
        { id = "neighbours_bibbly_d", text = "He has asked what it is worth four times, and I have given him four different answers. As long as he cannot put a price on it, he will leave it alone, which is the only use I have ever found for a goblin's mind." },
      },
      choices = {
        { text = "Clever. He can't steal what he can't value.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lady = {
      lines = {
        { id = "lady_d", text = "Naturally it does. The Royal Apothecary Society does not send its people to the far side of Kalimdor for the air, and I would be obliged if you did not repeat that to the tauren." },
      },
      choices = {
        { text = "Not a word.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "They deserve to know what's under their feet.", next = "BACK", reply = "How principled. They will know when there is something to know, and not a moment before.", fx = { trait = { stern = 1 } } },
      },
    },
    elements = {
      lines = {
        { id = "elements_d", text = "I dare say they don't. The earth in Maraudon has been spoken to by older things than your Earthen Ring, and I am only writing down what it says in its sleep." },
      },
      choices = {
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
    { id = "g_back2", when = { metBefore = true }, text = "You are back, and your beasts remember you. They heard your step before I did." },
    { id = "g_away", when = { away = 14 }, text = "{away} away. The beasts counted the days better than I did." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the tribes, this far west. You will want to see the graveyard, and you will not want to speak for a while afterward." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. Your raptor may stay, but it will keep its teeth off my kodo, or we will have words." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} is tired from the road. It would rest well here, if you let it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Aboda, and I keep the stables here at Shadowprey. Desolace is hard on beasts, harder than on people, so they need someone to look after them." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Aboda, and I keep the stables at Shadowprey. You travel with a beast at your heel, so you know already that this land frightens them more than it frightens us." },
      },
      again = {
        { id = "h_again3", text = "Yes? Speak softly, the old one is sleeping." },
        { id = "h_again", text = "What else? The beasts can wait a moment." },
        { id = "h_again2", text = "Ask. I am in no hurry." },
      },
      choices = {
        { text = "I'd like to stable a beast.", next = "BUSINESS" },
        { text = "Why is Desolace hard on beasts?", next = "hard" },
        { text = "Do you see the Kodo Graveyard from here?", next = "graveyard" },
        { text = "How does a tauren come to a troll village?", next = "village" },
        { text = "What beasts do travellers leave with you?", next = "beasts" },
        { text = "The sea air can't be good for a kodo.", next = "sea" },
        { text = "My beast has been uneasy since we crossed into Desolace.", next = "pet", when = { class = "HUNTER" } },
        { text = "The graveyard is sacred ground to our people.", next = "sacred", when = { race = "Tauren" } },
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
    village = {
      lines = {
        { id = "village_d", text = "The Darkspear built Shadowprey for the fishing, and the tauren came for the kodo, and it turned out each had need of the other. Innkeeper Sikewa and Thalon are of my people as well, so I am not as far from home as I look." },
      },
      choices = {
        { text = "Do the trolls understand your beasts?", next = "village_trolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_trolls = {
      lines = {
        { id = "village_trolls_d", text = "They understand raptors, which is a different thing, because a raptor wants to be feared a little and a kodo wants to be left in peace. Lui'Mala keeps trying to feed mine fish, and they look at him as if he had insulted their mothers." },
      },
      choices = {
        { text = "He means well, I'm sure.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = {
        { id = "beasts_d", text = "Raptors from the Darkspear, wolves from the orcs who pass through to Ghost Walker Post, and now and then a great cat somebody tamed in Feralas and cannot control. The cats are the worst, because they are clever enough to be bored." },
      },
      choices = {
        { text = "And the easiest?", next = "beasts_easy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_easy = {
      lines = {
        { id = "beasts_easy_d", text = "The old kodo, always. They ask for water, shade and quiet, and they give you their whole trust in return, which is more than I can say for most of the travellers who ride them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sea = {
      lines = {
        { id = "sea_d", text = "It is not, and they tell me so every morning. The salt dries their hides and the gulls steal their feed, so I rub them down with fat that Wulan saves for me from her cooking pots." },
      },
      choices = {
        { text = "Why not stable them inland?", next = "sea_inland" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sea_inland = {
      big = true,
      lines = {
        { id = "sea_inland_d", text = "Because inland is where the centaur are, and the demons beyond them. A kodo with a dry hide is unhappy, and a kodo in a Kolkar pot is dead, so I choose the salt." },
      },
      choices = {
        { text = "Safety first. They'll forgive the salt.", next = "BACK", reply = "So I tell them, in the evenings. I think the old ones believe me.", fx = { align = { order = 1 } } },
        { text = "A beast should roam. You're penning them by the sea.", next = "BACK", reply = "I would let them roam if this land would let them live. Come back when you have made Desolace safe, and I will open the gate myself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet = {
      lines = {
        { id = "pet_d", text = "It smells the graveyard and the demons both, and it does not know which to fear. Keep a hand on it when the wind is from the east, and speak to it by name, because a name is a rope that a frightened beast can hold." },
      },
      choices = {
        { text = "I'll do that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sacred = {
      lines = {
        { id = "sacred_d", text = "It is, and I am glad you know it. Gurda Wildmane tends the dying there from Ghost Walker Post, and when one of mine grows too old to carry anyone, I walk it to her myself and do not ride back." },
      },
      choices = {
        { text = "That is the right way.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Water your mount before you water yourself in this country. It carries you, and it cannot ask." } },
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
    { id = "g_back2", when = { metBefore = true }, text = "Back again, mon! The fish missed you, or maybe dey didn't, hard to tell with fish." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone! I caught three big ones while you were away, and you got to take my word for it." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc on my dock! You fish like you fight, ya? Lots of splashin' and shoutin'? I fix that." },
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
        { id = "h_fisher", when = { profession = { name = "Fishing", min = 75 } }, text = "I be Lui'Mala. You got the squint of somebody who's watched a float all day, so maybe I don't teach you, maybe we just trade lies about the big ones." },
      },
      again = {
        { id = "h_again3", text = "Ya? Keep your voice down, somethin' be nibblin'." },
        { id = "h_again", text = "What else, mon? The knife be gettin' bored. The tide's comin' in." },
        { id = "h_again2", text = "Ask, ask. I got all day, and so do the fish." },
      },
      choices = {
        { text = "Teach me fishing.", next = "BUSINESS" },
        { text = "What's in the water here?", next = "water" },
        { text = "Is it better than the Echo Isles?", next = "isles" },
        { text = "Who else lives off this dock?", next = "dock" },
        { text = "The naga come that close to your lines?", next = "naga" },
        { text = "You miss the Echo Isles, I think.", next = "home" },
        { text = "I've pulled fish from waters all over Kalimdor.", next = "skill", when = { profession = { name = "Fishing", min = 150 } } },
        { text = "The Darkspear fished long before this village.", next = "troll", when = { race = "Troll" } },
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
    dock = {
      lines = {
        { id = "dock_d", text = "Mai'Lahii sells de hooks and line, and she swears I lose more of dem than I use. Drulzegar Skraghook, the orc, he fishes for clams and other things he don't talk about, and old Thalon keeps his wind riders at the far end where they can frighten the gulls." },
      },
      choices = {
        { text = "What's Drulzegar after?", next = "dock_drul" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dock_drul = {
      lines = {
        { id = "dock_drul_d", text = "Somethin' on Ranazjar Isle, out past the shallows, where the naga keep their ruins. He asks every strong swimmer who comes through, so if he looks at you twice, mon, you know why." },
      },
      choices = {
        { text = "I'll hear him out.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga = {
      lines = {
        { id = "naga_d", text = "Close enough to cut my line and laugh about it, mon. The Slitherblade hold Ethel Rethor up the coast and the isle out in the bay, and dey think every fish between the two belongs to dem." },
      },
      choices = {
        { text = "Has the village fought them?", next = "naga_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_fight = {
      big = true,
      lines = {
        { id = "naga_fight_d", text = "A few times, when dey come up the sand at night. Jinar'Zillen says leave dem be unless dey come first, and I say a neighbour who steals your catch already came first." },
      },
      choices = {
        { text = "Jinar'Zillen's right. Don't start a war over fish.", next = "BACK", reply = "Ya, ya, dat's what a wise mon says. I be a hungry mon, and it's harder.", fx = { align = { order = 1 } } },
        { text = "You're right. Drive them off the coast.", next = "BACK", reply = "Ha! You and me, we take the isle tomorrow, ya? Bring a big net.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "home_d", text = "Every troll here does, mon, and we don't say it much. Zalazane took the isles with his voodoo, and Vol'jin took us to Sen'jin, and some of us kept walkin' west till the land ran out." },
      },
      choices = {
        { text = "Why keep walking?", next = "home_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_why = {
      lines = {
        { id = "home_why_d", text = "Because Sen'jin Village looks across the water at what we lost, every single mornin'. Here I look at a different sea, and I can pretend I chose it." },
      },
      choices = {
        { text = "That's an honest answer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skill = {
      lines = {
        { id = "skill_d", text = "Den you tell me, since you been everywhere: is there a better eatin' fish than a Desolace snapper off this dock? Think careful before you answer, mon, I be holdin' a knife." },
      },
      choices = {
        { text = "None better. I'd swear to it.", next = "BACK", reply = "Ha! A liar, but a polite one. You can fish beside me any day.", fx = { affinity = 1, trait = { charming = 1 } } },
        { text = "Feralas has it beaten, I'm afraid.", next = "BACK", reply = "Bah, Feralas. You got no taste, but you got nerve, and dat's somethin'.", fx = { trait = { witty = 1 } } },
      },
    },
    troll = {
      lines = {
        { id = "troll_d", text = "Ya, since before the Gurubashi had walls, the old ones say. A Darkspear with a line and a spear never goes hungry, and never needs to ask nobody's leave." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Fish the turn of the tide, mon, not the high and not the low. Dat's when the big ones get careless." } },
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
    { id = "g_back2", when = { metBefore = true }, text = "You again. Show me what you skinned, and I tell you what you did wrong." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone. I hope you kept your knife sharper than your manners." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. Good. You got a proper knife on you, or one of dem orc cleavers?" },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Den you make the holes I spend my days complainin' about. Aim for the eye, mon." },
    { id = "n_skin", cat = "craft", when = { profession = { name = "Skinning", min = 150 } },
      text = "Clean cuts on that leather. Somebody taught you right, mon." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Malux. I teach skinnin', and in Desolace there be plenty to skin, so you won't run out of practice." },
        { id = "h_skinner", when = { profession = "Skinning" }, text = "I be Malux. You got a skinner's knife on your belt and it's been used, so I skip the part where I tell you which end be sharp." },
      },
      again = {
        { id = "h_again3", text = "Ya? Talk, I can cut and listen." },
        { id = "h_again", text = "What else, mon? The knife be gettin' bored." },
        { id = "h_again2", text = "Go on, I be listenin'." },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "What's worth skinning in Desolace?", next = "worth" },
        { text = "You're very attached to that knife.", next = "knife" },
        { text = "Who takes your hides once they're off the beast?", next = "hides" },
        { text = "Nothing seems to impress you.", next = "dry" },
        { text = "Have you skinned anything out of Mannoroc?", next = "demon" },
        { text = "I make my own leather from what I skin.", next = "lw", when = { profession = "Leatherworking" } },
        { text = "A Darkspear and his knife. I know how that is.", next = "troll", when = { race = "Troll" } },
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
    hides = {
      lines = {
        { id = "hides_d", text = "Lah'Mawhani buys the plain ones for her trade shelves, and the good scorpid goes up the road to Narv Hidecrafter at Ghost Walker Post. He's a tauren and he talks to the hide before he cuts it, but his work be better than mine, so I keep my mouth shut." },
      },
      choices = {
        { text = "And the hides nobody wants?", next = "hides_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides_rest = {
      lines = {
        { id = "hides_rest_d", text = "Dere be no such thing, mon. Hyena makes bad boots and good drumheads, and vulture skin makes a fine pouch if you can stand the smell for a week." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dry = {
      lines = {
        { id = "dry_d", text = "I been skinnin' since I could hold a blade, mon, and after the first thousand it takes a lot to raise my eyebrow. Bring me a thunder lizard hide with no holes in it, and den you see me smile." },
      },
      choices = {
        { text = "How do I take one without holes?", next = "dry_lizard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dry_lizard = {
      lines = {
        { id = "dry_lizard_d", text = "You don't use an axe, for a start. Hit it on the head, hard, or have a friend do the killin' with somethin' blunt, and keep your spellcasters from settin' it on fire." },
      },
      choices = {
        { text = "Blunt and unburned. Understood.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    demon = {
      big = true,
      lines = {
        { id = "demon_d", text = "No, and I won't, and I tell every student the same. What walks at Mannoroc Coven didn't come from dis world, and a hide dat was never born don't belong on anybody's back." },
      },
      choices = {
        { text = "A sensible rule. Some things shouldn't be worn.", next = "BACK", reply = "Ya. The loa don't like it, and I don't like it. We agree, you and me.", fx = { align = { light = 1 } } },
        { text = "Demon hide would fetch a fortune somewhere.", next = "BACK", reply = "It would, from the kind of buyer who don't come back twice. Take dat trade to the Burning Blade, not to me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lw = {
      lines = {
        { id = "lw_d", text = "Den you know why I be fussy. One slip of the knife in the field, and you be stitchin' round the hole for the rest of the week." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = {
        { id = "troll_d", text = "Ya, you do. My father gave me mine on the Echo Isles, and it came across the sea with me when most things didn't." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Cut from the belly out, mon, and let the weight of the hide do the pullin'. You fight it, you tear it." } },
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
    { id = "g_back2", when = { metBefore = true }, text = "You have come back. Either you broke something, or you have the sense to want a second one." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you stood here. I have made eleven maces in that time, and each was better than the last." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You have the arm for a proper mace, as all our people do. Do not let anyone talk you into a sword." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You have burn scars on your knuckles. A smith, then, and one who does not always wear gloves." },
    { id = "n_arms", cat = "class", when = { class = { "SHAMAN", "WARRIOR" } },
      text = "You have the arms to swing one of mine properly. Most don't." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Muuran. I make maces, and I make them better than anyone between Feralas and Stonetalon. The Kolkar have learned that, and so have the demons at Mannoroc." },
        { id = "h_orc", when = { race = "Orc" }, text = "I am Muuran, and I make maces. I know an orc loves his axe, but hold one of these before you decide, because I have changed stubborner minds than yours." },
      },
      again = {
        { id = "h_again3", text = "Yes? Speak, the glue needs a moment to take." },
        { id = "h_again", text = "What else? I have a haft to wrap." },
        { id = "h_again2", text = "Ask, friend." },
      },
      choices = {
        { text = "Show me your maces.", next = "BUSINESS" },
        { text = "Why maces, and not blades?", next = "why" },
        { text = "What makes a superior mace?", next = "superior" },
        { text = "Who carries your maces at this post?", next = "post" },
        { text = "You don't lack for pride, Muuran.", next = "pride" },
        { text = "Let me feel the weight of one.", next = "weight", when = { class = { "WARRIOR", "SHAMAN", "DRUID" } } },
        { text = "I've smithed. Tell me how you set the head.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "A tauren's weapon, the mace.", next = "tauren", when = { race = "Tauren" } },
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
    post = {
      lines = {
        { id = "post_d", text = "Maurin Bonesplitter carried one of mine into the Kolkar village and brought it back with the haft still true, which is all the praise I need. Takata Steelblade prefers an edge, as his name tells you, and I have forgiven him for it." },
      },
      choices = {
        { text = "And Felgur?", next = "post_felgur" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_felgur = {
      lines = {
        { id = "post_felgur_d", text = "Felgur Twocuts is an orc, and an orc would sooner be seen without his trousers than without an axe. He has hefted my work, though, and I saw his face when he did." },
      },
      choices = {
        { text = "One day he'll buy one.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pride = {
      lines = {
        { id = "pride_d", text = "Why would I? A crafter who calls his own work middling is either lying or right, and in neither case should you buy from him." },
      },
      choices = {
        { text = "Is there anyone better?", next = "pride_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pride_better = {
      big = true,
      lines = {
        { id = "pride_better_d", text = "Etu Ragetotem in Thunder Bluff sells a fine mace, and he will tell you so at great length. He sells them, friend, and I make them, and that is all the difference there is." },
      },
      choices = {
        { text = "Pride in honest work is no fault.", next = "BACK", reply = "It is not. The Earth Mother gave me these hands, and it would be poor thanks to belittle what they do.", fx = { align = { honor = 1 } } },
        { text = "A humbler smith would still sell good maces.", next = "BACK", reply = "And nobody would walk across Desolace to find him. Humility is for those who can afford to be overlooked.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    weight = {
      narr = "He sets a mace across your palms and steps back with his arms folded.",
      lines = {
        { id = "weight_d", text = "Take it by the end of the haft, not the middle, and let the head fall where it wants to. There, you feel that? It does half the work for you, and it never gets tired." },
      },
      choices = {
        { text = "That is a fine balance.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = {
        { id = "smith_d", text = "I set it hot and let it shrink onto the haft as it cools, and then I pin it through, because a wedge alone will work loose in a dry country. If you have been using wedges, friend, stop." },
      },
      choices = {
        { text = "I'll pin them from now on.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_d", text = "It is the oldest one we have. Before we had forges we had a stone bound to a branch, and I do not think we have improved on the idea so much as polished it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Swing through the target, not at it. A mace that stops at the skin has only knocked on the door." } },
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
    { id = "g_back2", when = { metBefore = true }, text = "Back in one piece. Then whatever you're wearing is doing its job." },
    { id = "g_away", when = { away = 14 }, text = "{away} out in that waste. I'd half written you off, and I'm glad to be wrong." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A Stormwind accent, or near enough. Say something else, friend, I've not heard one in months." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armour's been through the centaur and lost. Let me see it before a spear finishes the argument." },
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
        { id = "h_again3", text = "Yes? Talk away, the rings won't oil themselves but they'll wait." },
        { id = "h_again", text = "What else? Mind the oil pot." },
        { id = "h_again2", text = "Go on, friend." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "Why did you come to Desolace?", next = "why" },
        { text = "The sand must be a nuisance.", next = "sand" },
        { text = "Who else keeps shop at the Point?", next = "shops" },
        { text = "What do you make of the night elves here?", next = "elves" },
        { text = "How is Stormwind? I've been there lately.", next = "stormwind", when = { race = "Human" } },
        { text = "I need mail that will last out here.", next = "last", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "I've forged a few rings myself.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "You've a captive market in the garrison.", next = "profit" },
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
    shops = {
      lines = {
        { id = "shops_d", text = "Christi Galvanis has the general goods, Janet Hommers has the food, and Innkeeper Lyshaerya has the only roof in Desolace I'd sleep under. Between the four of us we are the whole of commerce west of Stonetalon, and it shows." },
      },
      choices = {
        { text = "Do you get on with them?", next = "shops_get" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shops_get = {
      lines = {
        { id = "shops_get_d", text = "Well enough. Janet thinks I overcharge and I think she undersalts, and Christi keeps the peace by selling us both lamp oil at the same price. You learn to be neighbourly when the next shop is a week's ride off." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      lines = {
        { id = "elves_d", text = "They hold this place, when it comes down to it. Keeper Marandis and Talendria were watching these hills before Stormwind had a wall, and Pentigast is clever enough to ask them things before he gives an order." },
      },
      choices = {
        { text = "And do they buy your armour?", next = "elves_buy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_buy = {
      lines = {
        { id = "elves_buy_d", text = "Not a link of it. They wear leaves and moonlight, as far as I can tell, and Shelgrayn at the stables once told me my hauberks were 'loud'. I've been turning that over for a year." },
      },
      choices = {
        { text = "She's right. Mail does rattle.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Loud armour has saved more lives than quiet leaves.", next = "BACK", reply = "That's what I should have said! I'll use it next time, and I'll not credit you.", fx = { affinity = 1 } },
      },
    },
    stormwind = {
      lines = {
        { id = "stormwind_d", text = "Have you! Then tell me the canals still stink and the Trade District still shouts, because I'd be heartbroken to hear it had changed. Is old Weller still selling plate by the gate?" },
      },
      choices = {
        { text = "Stormwind hasn't changed a stone.", next = "BACK", reply = "Good. A man likes to think home is waiting just as he left it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    last = {
      lines = {
        { id = "last_d", text = "Then you want it heavy at the shoulder and oiled twice a week, and you want to pay for the riveted rings and not the butted ones. The Kolkar fight with spears, and a spear finds a cheap ring the way water finds a crack." },
      },
      choices = {
        { text = "Riveted it is.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = {
        { id = "smith_d", text = "Then you've my sympathy, because there's no duller work than drawing wire. I buy mine by the coil from Ironforge these days and pretend I don't miss the forge." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    profit = {
      big = true,
      lines = {
        { id = "profit_d", text = "Now there's a question for a merchant's conscience. The soldiers pay what I ask because there is nobody else to ask, and I could ask more." },
      },
      choices = {
        { text = "Charge fairly. They're dying out here for the Alliance.", next = "BACK", reply = "I do, more or less, and I sleep the better for it. Don't tell Janet I said so.", fx = { align = { honor = 1 } } },
        { text = "Charge what the market bears. That's trade.", next = "BACK", reply = "Spoken like a Booty Bay man. I'll think on it the next time Pentigast's quartermaster comes round short.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Shake your mail out every night in this country. Sand in the rings will wear them through faster than any centaur." } },
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
    { id = "g_back2", when = { metBefore = true }, text = "You have returned, and your beasts knew your step. They always do." },
    { id = "g_away", when = { away = 14 }, text = "{away}, by your reckoning. The beasts found it long, even if I did not." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You have a horseman's hands, a little too firm on the rein. Your mount will forgive you, as they generally do." },
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
        { id = "h_again3", text = "Yes? Speak gently, the mare is newly calmed." },
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask, if you wish, for I have time." },
      },
      choices = {
        { text = "I'd like to stable a beast.", next = "BUSINESS" },
        { text = "Why does a night elf serve at a human outpost?", next = "why" },
        { text = "What do the beasts fear here?", next = "fear" },
        { text = "Who else keeps this outpost running?", next = "point" },
        { text = "What mounts come through Nijel's Point?", next = "mounts" },
        { text = "The Legion never truly left this land.", next = "legion" },
        { text = "My companion has been restless since Sargeron.", next = "pet", when = { class = "HUNTER" } },
        { text = "Ishnu-alah, sister. It is long since Ashenvale.", next = "elf", when = { race = "NightElf" } },
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
    point = {
      lines = {
        { id = "point_d", text = "Captain Pentigast commands, and Keeper Marandis advises him, which is the proper order of things whatever the captain believes. Baritanas Skyriver keeps the hippogryphs above us, and Innkeeper Lyshaerya keeps everyone else from despair." },
      },
      choices = {
        { text = "And the humans? How do you find them?", next = "point_humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    point_humans = {
      lines = {
        { id = "point_humans_d", text = "Brief. They arrive, they do a great deal very quickly, and they are gone before I have learned their names. Corporal Melkins has been here long enough that I have learned his, and I find I would be sorry to lose him." },
      },
      choices = {
        { text = "Short lives can still be worth knowing.", next = "BACK", reply = "So I am learning, late. It is an uncomfortable lesson for one of my people.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mounts = {
      lines = {
        { id = "mounts_d", text = "Horses that hate the footing, rams that hate the heat, and nightsabers that hate everything except their riders. The mechanical striders the gnomes bring are the only ones that do not complain, and I do not count them as beasts." },
      },
      choices = {
        { text = "Which do you favour?", next = "mounts_favour" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mounts_favour = {
      lines = {
        { id = "mounts_favour_d", text = "The sabers, though I should not say so. They pretend they do not need me, and then in the dead of night one will come and lie across the stable door, between me and the dark." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    legion = {
      lines = {
        { id = "legion_d", text = "It did not. Mannoroc Coven sits to the south like an unhealed bite, and the satyrs at Sargeron on our own doorstep were kaldorei once, before they chose what they chose." },
      },
      choices = {
        { text = "Can such a land ever be cleansed?", next = "legion_cleanse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_cleanse = {
      big = true,
      lines = {
        { id = "legion_cleanse_d", text = "I have watched this place for longer than your kingdoms have stood, and it has only grown greyer. Marandis believes it can be healed, and I have decided to believe Marandis, because the other belief is not one I could tend beasts beside." },
      },
      choices = {
        { text = "Hope is a duty in a place like this.", next = "BACK", reply = "You put it better than I did. I will tell the Keeper someone else agrees with him.", fx = { align = { light = 1 } } },
        { text = "Some lands are lost. Better to admit it.", next = "BACK", reply = "Perhaps. But you will forgive me if I go on feeding the horses as though it mattered.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet = {
      lines = {
        { id = "pet_d", text = "It scents the satyrs, and it is right to mistrust them. Leave it with me a while if you must go that way, or keep it very close, for they take a cruel pleasure in tormenting a hunter's companion." },
      },
      choices = {
        { text = "I'll keep it close.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elf = {
      lines = {
        { id = "elf_d", text = "Ishnu-alah. It is long since anywhere green, for all of us here. When you next stand under real trees, sister or brother, breathe once for those who are keeping watch on the stones." },
      },
      choices = {
        { text = "I will. Elune light your watch.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Do not ride after dark in Desolace. Your mount sees what walks here better than you do, and it will not thank you for making it look." } },
    background = { { id = "tp_bg", text = "I tend beasts. I have done so in Ashenvale, in Darkshore, and now here." } },
    _none = { { id = "tp_none", text = "I do not know of that. Perhaps Talendria would." } },
  },
}

---------------------------------------------------------------------------
-- Azore Aldamort: Argent Dawn mage at Ethel Rethor. Classic: Sceptre of Light, Book of the Ancients.
---------------------------------------------------------------------------
P:NPC {
  key = "azore", id = TODO_NPC("Azore Aldamort"), name = "Azore Aldamort", title = "The Argent Dawn",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "learned", "guarded" }, values = { "knowledge", "vigilance" },
  notices = { "class" },
  impression = {
    first = "Azore Aldamort is a mage of the Argent Dawn who keeps a lonely tower at Ethel Rethor, between the naga and the sea. He spoke of demon cults as a scholar speaks of weather, and trusted me by careful degrees.",
    third = "{name} met Azore Aldamort, an Argent Dawn mage studying from a tower at Ethel Rethor.",
  },
  greetings = {
    { id = "g_hi", text = "A visitor, and one who came by the stair and not the window. That alone sets you above my usual callers." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. Come in, and close the door; the naga have learned to listen at it." },
    { id = "g_sceptre", when = { questActive = TODO_QUEST("Sceptre of Light") }, text = "The Sceptre of Light is held by the Burning Blade's seer in Thunder Axe Fortress. Do not attempt to use it yourself; simply bring it to me." },
    { id = "g_away", when = { away = 14 }, text = "{away} since your last visit. I have read the same four pages in that time, and they have not grown kinder." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A colleague, of a sort. You will forgive my wards for bristling; they do that to anyone who could unpick them." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You traffic with the very forces I am here to study. I shall not lecture you, but I shall watch your hands while you are in my tower." },
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "You serve the Light, or something like it. The Dawn has need of such as you, and so, as it happens, do I." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Azore Aldamort, of the Argent Dawn. We oppose the Scourge and the Legion wherever they take root, and in Desolace the Legion's roots run deeper than anyone has troubled to measure." },
        { id = "h_sceptre", when = { questActive = TODO_QUEST("Sceptre of Light") }, text = "The Burning Blade's seer carries a relic called the Sceptre of Light, which his kind cannot use and will not surrender. I require it, and I am not suited to storming fortresses." },
        { id = "h_book", when = { questActive = TODO_QUEST("Book of the Ancients") }, text = "With the Sceptre you may rouse the serpent statue on Ranazjar Isle, and Lord Kragaru will come to answer it. He guards the Book of the Ancients, and I would have it out of naga hands." },
        { id = "h_done", when = { questDone = TODO_QUEST("Book of the Ancients") }, text = "The Book lies on my table, and I have barely slept since you brought it. Whatever becomes of this land, you have put a weapon in the right hands." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I answer what I safely can." },
        { id = "h_again2", text = "Ask. My reading will wait a little longer." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "What is the Argent Dawn doing in Desolace?", next = "dawn" },
        { text = "Why build a tower among naga ruins?", next = "tower" },
        { text = "Tell me about the Burning Blade.", next = "blade" },
        { text = "What is the Book of the Ancients?", next = "book" },
        { text = "One mage to another: what are you truly after?", next = "mage", when = { class = "MAGE" } },
        { text = "I've walked among demons, and some walk with me. Ask what you like.", next = "lock", when = { class = "WARLOCK" } },
        { text = "Does the Dawn take oaths from such as me?", next = "oath", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Keep your wards strong, Azore.", next = "END" },
      },
    },
    dawn = {
      lines = {
        { id = "dawn_d", text = "Watching, chiefly. Our strength is in the Plaguelands, where the need is plainest, but some of us hold that the Scourge is only the Legion's instrument, and that one must study the hand as well as the knife." },
      },
      choices = {
        { text = "And does the Dawn agree with you?", next = "dawn_agree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn_agree = {
      big = true,
      lines = {
        { id = "dawn_agree_d", text = "The Dawn has allowed me a tower and no assistants, which is an answer of a kind. I do not resent it, for every sword is needed in the north, and my work asks for patience more than numbers." },
      },
      choices = {
        { text = "They should send you help. This matters.", next = "BACK", reply = "I think so too, on my more wounded days. But I have seen Stratholme's walls, and I would not take one soldier from them.", fx = { align = { order = -1 } } },
        { text = "The Dawn is right to hold the north first.", next = "BACK", reply = "It is. A disciplined order spends itself where it is needed, and not where its scholars are lonely.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tower = {
      lines = {
        { id = "tower_d", text = "Because the Highborne who raised Ethel Rethor chose the site for its strength in the arcane, and that strength remains. The naga are their descendants, in a sense, and they resent a human reading over their shoulder." },
      },
      choices = {
        { text = "How do you hold them off?", next = "tower_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tower_hold = {
      lines = {
        { id = "tower_hold_d", text = "With wards, with a locked door, and with the reputation of being more trouble than I am worth. The Slitherblade have tested all three, and so far the third has served me best." },
      },
      choices = {
        { text = "A reputation is a fine ward.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade = {
      lines = {
        { id = "blade_d", text = "A cult of orcs, for the most part, who never ceased to worship the demons that enslaved their people. They hold Thunder Axe Fortress in the north, and they treat with the Legion's servants at Mannoroc Coven." },
      },
      choices = {
        { text = "Thrall's Horde disowns them.", next = "blade_horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade_horde = {
      lines = {
        { id = "blade_horde_d", text = "So I am told, and I have seen Horde warriors kill them with real feeling. It is one of the few matters on which your Warchief and the Alliance's captains would speak the same sentence." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    book = {
      lines = {
        { id = "book_d", text = "A record of the Highborne's summoning, kept by the naga who inherited their ambitions. With it I may learn how the Legion was first invited into this land, and from that, perhaps, how the door is properly shut." },
      },
      choices = {
        { text = "And if it teaches you how to open one?", next = "book_open" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book_open = {
      lines = {
        { id = "book_open_d", text = "Then I will know what to look for when another fool tries. I am aware of how that sounds, and you are right to ask it, for it is the question the Dawn asked me before they let me come." },
      },
      choices = {
        { text = "Knowledge of the enemy is worth the risk.", next = "BACK", fx = { trait = { curious = 1 }, affinity = 1 } },
        { text = "Some books are better burned than read.", next = "BACK", reply = "Many are. This one I shall read first, and you may hold the torch if you wish.", fx = { trait = { cautious = 1 } } },
      },
    },
    mage = {
      lines = {
        { id = "mage_d", text = "Then I will be exact with you. I wish to know whether a land the Legion has touched can ever be made clean, or whether we are merely holding a line around a stain. Dalaran never settled the question, and Dalaran is rubble." },
      },
      choices = {
        { text = "Then let's settle it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lock = {
      lines = {
        { id = "lock_d", text = "Very well. When you call one of them, does it come from elsewhere, or was it already near? I have a theory about Desolace, and it is not a comfortable one." },
      },
      choices = {
        { text = "Here, they come quickly. Too quickly, and too hungry.", next = "BACK", reply = "As I feared. Thank you for your candour; I shall record it without your name.", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oath = {
      lines = {
        { id = "oath_d", text = "We ask no oath that would set you against your own people. The Dawn takes anyone, of either banner, who will stand against the Scourge and the Legion, and it does not ask where they prayed before." },
      },
      choices = {
        { text = "Then I'll count myself a friend of the Dawn.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a mage of Dalaran, when there was a Dalaran. The Argent Dawn found a use for what I learned there." } },
    advice = { { id = "tp_ad", text = "Do not linger near Mannoroc Coven after dark. What walks there is patient, and it notices who notices it." } },
    _none = { { id = "tp_none", text = "That lies outside my studies, and I do not guess. Enquire at Nijel's Point or Shadowprey, as your allegiance allows." } },
  },
}

---------------------------------------------------------------------------
-- Hornizz Brimbuzzle: goblin at the Kodo Graveyard. Classic: Ghost-o-plasm Round Up; ends Get Me Out of Here! (sister Melizza).
---------------------------------------------------------------------------
P:NPC {
  key = "hornizz", id = TODO_NPC("Hornizz Brimbuzzle"), name = "Hornizz Brimbuzzle",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "pushy", "fretful" }, values = { "profit", "family" },
  notices = { "class", "craft", "race" },
  impression = {
    first = "Hornizz Brimbuzzle is a goblin camped at the edge of the Kodo Graveyard, bottling ghosts to sell to the centaur. He is all sales talk until his sister is mentioned, and then he is only frightened.",
    third = "{name} met Hornizz Brimbuzzle, a goblin harvesting ghost-o-plasm beside the Kodo Graveyard.",
  },
  greetings = {
    { id = "g_hi", text = "Hey, hey, a customer! Or an employee, I ain't fussy. Ya ever hear of ghost-o-plasm, friend? No? Then this is your lucky day." },
    { id = "g_back", when = { metBefore = true }, text = "There ya are! Listen, listen, the market's still hot, so tell me ya brought product." },
    { id = "g_ghost", when = { questActive = TODO_QUEST("Ghost-o-plasm Round Up") }, text = "Set the magnet down in the Valley of Bones, pal, stand back, and collect what drips off the ghosts. Simple as a ledger." },
    { id = "g_away", when = { away = 14 }, text = "{away} without a word! I thought the spooks got ya, and I'd already written off the magnets." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Uh, a tauren. Listen, pal, about the graveyard, I ain't touchin' the kodo, I swear on my mother's ledger. It's the centaur ghosts I'm after." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Is that a spanner on your belt? Sparks and sprockets, somebody who'll appreciate the magnets! Patent pending, so don't look too close." },
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You're one of them spirit-talker types, huh? Don't go tellin' the ghosts what I'm chargin' for 'em, it'd only cause bad feeling." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hornizz Brimbuzzle, importer, exporter, and the only fella in Kalimdor with a working supply of ghost-o-plasm. The Magram centaur pay through the nose for it, and I intend to let 'em." },
        { id = "h_active", when = { questActive = TODO_QUEST("Ghost-o-plasm Round Up") }, text = "Here's the job, pal: take my ghost magnets to the Valley of Bones, south of here, and plant one. The Magram spectres come runnin', you knock the plasm off 'em, and we both get rich, me first." },
        { id = "h_done", when = { questDone = TODO_QUEST("Ghost-o-plasm Round Up") }, text = "Eight jars, all glowin', none cracked. You're a professional, friend. Now if only I could buy back what the Maraudine took as easy as that." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time's money, but I got a little of both." },
        { id = "h_again2", text = "Go on, ask, I'm only countin' jars." },
        { id = "h_again3", text = "Yeah?" },
      },
      choices = {
        { text = "What is ghost-o-plasm, exactly?", next = "plasm" },
        { text = "Why would centaur buy their own ghosts?", next = "magram" },
        { text = "You're camped by a tauren holy place.", next = "graveyard" },
        { text = "You said something about your sister.", next = "sister" },
        { text = "How do those magnets work?", next = "magnet", when = { profession = "Engineering" } },
        { text = "The dead aren't merchandise, goblin.", next = "dead", when = { class = { "SHAMAN", "PRIEST", "PALADIN" } } },
        { text = "Good luck with your ghosts, Hornizz.", next = "END" },
      },
    },
    plasm = {
      lines = {
        { id = "plasm_d", text = "It's what's left on a ghost when ya shake it, friend. Sticky, glows in the dark, smells like a wet campfire. I got no idea what it does, and that ain't my end of the business." },
      },
      choices = {
        { text = "You sell it without knowing what it does?", next = "plasm_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plasm_sell = {
      lines = {
        { id = "plasm_sell_d", text = "Pal, I once sold forty crates of left boots. The customer knows what he wants it for, and it ain't polite to ask. Margins like these, I'd sell it to the ghosts themselves." },
      },
      choices = {
        { text = "That's honest, in its way.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    magram = {
      lines = {
        { id = "magram_d", text = "The Magram are big on their ancestors, see, and the Valley of Bones is where their dead khans are stacked. I figure their shamans use the stuff to talk to granddad, or to curse the Gelkis, or both." },
      },
      choices = {
        { text = "And if the Gelkis offered more?", next = "magram_gelkis" },
        { text = "Something else.", next = "BACK" },
      },
    },
    magram_gelkis = {
      big = true,
      lines = {
        { id = "magram_gelkis_d", text = "Then the Gelkis got themselves a supplier, friend! I'm a neutral party. If the two clans wanna outbid each other over a jar of spook-juice, it'd be rude of me to interfere." },
      },
      choices = {
        { text = "Fair enough. Their feud isn't your doing.", next = "BACK", reply = "That's what I say! I didn't start the war, pal, I'm just providin' refreshments.", fx = { align = { honor = -1 } } },
        { text = "Arming both sides of a war is filthy work.", next = "BACK", reply = "Arming? It's jars, pal! ...Fine, yeah, I heard it as I said it. I still got overhead.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    graveyard = {
      lines = {
        { id = "graveyard_d", text = "Yeah, and don't think it don't cost me. That tauren lady, Gurda Wildmane, comes by and just looks at me, real sad, for like an hour. I'd rather she yelled." },
      },
      choices = {
        { text = "Have you taken anything from the kodo?", next = "graveyard_kodo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    graveyard_kodo = {
      lines = {
        { id = "graveyard_kodo_d", text = "Not a tooth, friend, and I'll tell ya why: I tried once, early on, and a kodo with no skin on it walked outta the dust and stared at me till I put it back. I do centaur ghosts now. Centaur ghosts don't stare." },
      },
      choices = {
        { text = "The kodo did you a kindness.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister = {
      lines = {
        { id = "sister_d", text = "Melizza. Smartest Brimbuzzle there ever was, and she went to make a deal with the Maraudine down in the Valley of Spears, and they put her in a cage instead. I been savin' every copper from the plasm to buy her out, and they won't even name a price." },
      },
      choices = {
        { text = "Has anyone tried to free her?", next = "sister_free" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister_free = {
      narr = "For once his hands stop moving, and he looks south toward the Valley of Spears.",
      lines = {
        { id = "sister_free_d", text = "Who am I gonna send, pal? I sell jars. But if somebody handy with a blade happened to be down that way and happened to open a cage, I'd be grateful in ways I ain't ever been grateful before." },
      },
      choices = {
        { text = "If I find her, I'll bring her out.", next = "BACK", reply = "Ya mean it? Don't say it if ya don't mean it, pal, because I'll hold ya to it, and I'll thank ya every day after.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What's it worth to you?", next = "BACK", reply = "Everything in the strongbox, and I'd throw in the strongbox. First time in my life I ain't hagglin'.", fx = { trait = { practical = 1 } } },
      },
    },
    magnet = {
      lines = {
        { id = "magnet_d", text = "Lodestone core, copper windings, and a little somethin' from a Gadgetzan fella that hums when there's a spook about. It draws 'em in from a hundred paces, and it draws 'em in angry, which I shoulda put on the label." },
      },
      choices = {
        { text = "Angry. Good to know.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = {
        { id = "dead_d", text = "Whoa, whoa, easy! Look, pal, they're already dead, I ain't makin' 'em any deader. And the plasm goes right back to their own kin. Call it a family reunion with a handling fee." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Brimbuzzle and Brimbuzzle, outta Ratchet. I'm the one who does the talkin', and Melizza's the one who does the thinkin', which is why I need her back." } },
    advice = { { id = "tp_ad", text = "Don't stand downwind of a ghost magnet, friend. Trust me, the smell don't wash out." } },
    _none = { { id = "tp_none", text = "Not in my inventory, pal. Try the big folks at Ghost Walker Post." } },
  },
}

---------------------------------------------------------------------------
-- Bibbly F'utzbuckle: goblin at Kormek's Hut. Classic: Bone Collector.
---------------------------------------------------------------------------
P:NPC {
  key = "bibbly", id = TODO_NPC("Bibbly F'utzbuckle"), name = "Bibbly F'utzbuckle",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "jittery", "gleeful" }, values = { "profit", "novelty" },
  notices = { "class", "race" },
  impression = {
    first = "Bibbly F'utzbuckle is a goblin at Kormek's Hut who pays for kodo bones and cannot stand still while he talks about them. He broke into a little dance twice during our conversation and did not seem to notice.",
    third = "{name} met Bibbly F'utzbuckle, a goblin bone-buyer at Kormek's Hut.",
  },
  greetings = {
    { id = "g_hi", text = "Bones! Ya got bones, pal? Well, ya look like somebody who could get bones, so come in, come in, and mind the dead lady, she's workin'." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, it's my bone guy! Tell me ya got some, pal, my feet are itchin'." },
    { id = "g_bones", when = { questActive = TODO_QUEST("Bone Collector") }, text = "Kodo Graveyard, friend, big bones lyin' right there in the dust. Just grab 'em and run, and I do mean run." },
    { id = "g_away", when = { away = 14 }, text = "{away}! I been dancin' on the spot the whole time. Look at the floor, I wore a groove." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Oh. A tauren. Uh, listen, big fella, about the bones, it's purely scientific, real respectful, I got a permit somewhere." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Another dead one, and no offence meant, pal! Say, how attached are ya to all of your, uh... no, forget it, forget I asked." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Quick hands, light feet. Friend, you are exactly the build for this job, the ghosts'll never catch ya." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bibbly F'utzbuckle! Dealer in rare and unusual skeletal goods. I got a buyer back east who pays by the pound for kodo bone, and there's a whole graveyard of it just lyin' there unsold." },
        { id = "h_active", when = { questActive = TODO_QUEST("Bone Collector") }, text = "Ten kodo bones, pal, the big clean ones. Fair warnin', every now and then ya pick one up and the previous owner shows up to discuss it, so stay loose." },
        { id = "h_done", when = { questDone = TODO_QUEST("Bone Collector") }, text = "Beautiful! Look at the grain on that. Friend, ya done good, and I ain't even gonna ask how many ghosts ya had to outrun." },
      },
      again = {
        { id = "h_again", text = "What else, what else? I got a rhythm goin'." },
        { id = "h_again2", text = "Ask, pal, I can jig and listen." },
        { id = "h_again3", text = "Yeah?" },
      },
      choices = {
        { text = "Who buys kodo bones?", next = "buyer" },
        { text = "Why are you dancing?", next = "dance" },
        { text = "How do you get on with Willow?", next = "willow" },
        { text = "The tauren won't thank you for this.", next = "tauren" },
        { text = "Those are my people's dead you're pricing.", next = "mine", when = { race = "Tauren" } },
        { text = "I could get in and out without waking anything.", next = "sneak", when = { class = "ROGUE" } },
        { text = "Keep dancing, Bibbly.", next = "END" },
      },
    },
    buyer = {
      lines = {
        { id = "buyer_d", text = "A fella in Booty Bay who carves 'em into dice, combs, pipe stems, ya name it. Kodo bone don't crack and it takes a polish like ivory, and there ain't a tusk-hunter's licence to pay on it." },
      },
      choices = {
        { text = "And he knows where they come from?", next = "buyer_knows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyer_knows = {
      lines = {
        { id = "buyer_knows_d", text = "He knows they come from me, pal, and that's all a good customer wants to know. Ya start tellin' folks the dice are haunted and the price goes up, sure, but so do the complaints." },
      },
      choices = {
        { text = "Are the dice haunted?", next = "BACK", reply = "Only a little! Mostly they just roll low. Don't spread it around.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dance = {
      lines = {
        { id = "dance_d", text = "Was I? Huh. It's the nerves, friend, I can't help it. A goblin sits still out here, he starts hearin' the kodo ghosts moanin' in the night, so I keep the feet movin' and I hum real loud." },
      },
      choices = {
        { text = "The ghosts frighten you that much?", next = "dance_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dance_fear = {
      big = true,
      lines = {
        { id = "dance_fear_d", text = "They don't scare me, pal, they disappoint me, which is worse. Big sad eyes, and they just stand there outside the hut lookin' in. Makes a fella wonder about his line of work, and I can't afford to wonder." },
      },
      choices = {
        { text = "Perhaps you should wonder. Leave the bones be.", next = "BACK", reply = "Yeah, yeah. Ya sound like the one in my head. Him I can drown out with a jig, you I gotta listen to.", fx = { align = { light = 1 } } },
        { text = "Ghosts can't spend coin. Take what's lying there.", next = "BACK", reply = "That's the spirit, so to speak! See, this is why I like you, pal, you got a head for business.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    willow = {
      lines = {
        { id = "willow_d", text = "The dead lady and me, we got an understandin'. She don't touch my bones, I don't touch her carvings, and neither of us asks what the other one's up to, which makes her the best neighbour I ever had." },
      },
      choices = {
        { text = "What do you think she's up to?", next = "willow_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    willow_what = {
      lines = {
        { id = "willow_what_d", text = "Somethin' that pays, or she wouldn't be sittin' in a hut in Desolace, pal. I asked her what her carvings were worth and got four different numbers, so either she don't know or she knows exactly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_d", text = "They ain't thanked me yet, that's for sure. The big lady from Ghost Walker Post came by once and didn't say a word, just set a kodo skull on my doorstep facin' in. I moved it. It was back in the mornin'." },
      },
      choices = {
        { text = "I'd take that as a warning.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine = {
      lines = {
        { id = "mine_d", text = "Whoa, hey, easy, big fella! Look, I, uh, I only take the ones that already fell off, I don't dig, I swear. And they'd just be lyin' there. Right? ...You're doin' the starin' thing too. They all do the starin' thing." },
      },
      choices = {
        { text = "Take no more, and we've no quarrel.", next = "BACK", reply = "Sure, sure, absolutely, I hear ya. I, uh, I got enough stock for now anyway.", fx = { trait = { stern = 1 } } },
        { text = "The dead have no use for bones. Carry on.", next = "BACK", reply = "Yeah? Huh! First tauren ever told me that. Don't let Gurda hear ya.", fx = { trait = { practical = 1 } } },
      },
    },
    sneak = {
      lines = {
        { id = "sneak_d", text = "That's what I like to hear! Go at midday when the dust's up, stay low, and don't take the skulls, friend, never the skulls. The rest they'll let slide if you're quick." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "F'utzbuckle Fine Bone Goods, est. last year. Before that I sold hats, but hats don't keep in this heat." } },
    advice = { { id = "tp_ad", text = "If a kodo ghost follows ya, pal, don't run in a straight line. They're slow on the corners." } },
    _none = { { id = "tp_none", text = "Ya got me, friend. Ask the dead lady, she reads." } },
  },
}

---------------------------------------------------------------------------
-- Narv Hidecrafter: leatherworking trainer at Ghost Walker Post.
---------------------------------------------------------------------------
P:NPC {
  key = "narv", id = TODO_NPC("Narv Hidecrafter"), name = "Narv Hidecrafter", title = "Leatherworking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ghost_walker" }, temper = { "deliberate", "reverent" }, values = { "craft", "respect" },
  notices = { "craft", "race" },
  impression = {
    first = "Narv Hidecrafter teaches leatherworking at Ghost Walker Post, within sight of the Kodo Graveyard, and speaks to each hide before he cuts it. He would not say where one particular hide on his rack had come from.",
    third = "{name} met Narv Hidecrafter, the leatherworking trainer at Ghost Walker Post.",
  },
  greetings = {
    { id = "g_hi", text = "Peace. Sit across from me, and do not put your hand on that hide until I have told you whose it was." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. I have a scorpid shell soaking that will be ready for your hands by evening." },
    { id = "g_away", when = { away = 14 }, text = "{away} away. The leather you left has cured in that time, and it has cured well." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You have a leatherworker's thumb, flattened at the pad. Then we need not start with how to hold the knife." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You are of the tribes, and you looked first toward the graveyard. Good. Everything I teach here begins with that." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. Malux at Shadowprey sends me his best hides and his worst jokes, and I am grateful for the first." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Narv Hidecrafter. I teach the working of leather in a land that gives little of it, and so I teach first that nothing may be wasted, and second that not everything may be taken." },
        { id = "h_lw", when = { profession = "Leatherworking" }, text = "I am Narv Hidecrafter. You know the craft already, so I will show you scorpid shell and thunder lizard, which will humble you as they humbled me." },
        { id = "h_orc", when = { race = "Orc" }, text = "I am Narv Hidecrafter. Orcs make hard, plain leather that lasts, and I respect it. Sit, and I will show you what a little more patience adds." },
      },
      again = {
        { id = "h_again", text = "What else? I listen while the hide soaks." },
        { id = "h_again2", text = "Ask. There is no hurry in this work." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "Why speak to a hide before cutting it?", next = "speak" },
        { text = "What leather does Desolace give?", next = "leather" },
        { text = "Do you ever work kodo hide, so near the graveyard?", next = "kodo" },
        { text = "Who else keeps this post?", next = "post" },
        { text = "Show me how scorpid shell is worked.", next = "scorpid", when = { profession = "Leatherworking" } },
        { text = "I'd say the words with you, if you'll teach them.", next = "words", when = { race = "Tauren" } },
        { text = "Walk with the Earth Mother, Narv.", next = "END" },
      },
    },
    speak = {
      lines = {
        { id = "speak_d", text = "Because it was alive, and I am about to change it for ever. I tell it what it will become and who will wear it, and I have found that my hands are steadier after." },
      },
      choices = {
        { text = "Does it ever answer?", next = "speak_answer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    speak_answer = {
      lines = {
        { id = "speak_answer_d", text = "Not in words. But there are hides that will not lie flat whatever I do, and I have learned to set those aside and ask how the beast died. The answer is never a good one." },
      },
      choices = {
        { text = "Leather remembers. I believe that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Or the hide was badly cured.", next = "BACK", reply = "That too is a way of dying badly. We may both be right.", fx = { trait = { skeptical = 1 } } },
      },
    },
    leather = {
      lines = {
        { id = "leather_d", text = "Scorpid shell, which is more armour than hide, and the skins of hyena and thunder lizard. Basilisk scale, when the hunters are bold. All of it is hard and dry, like the land, and all of it must be coaxed." },
      },
      choices = {
        { text = "Who brings it to you?", next = "leather_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_who = {
      lines = {
        { id = "leather_who_d", text = "Malux sends hides up from Shadowprey, and the braves here bring what they kill on patrol. Kireena sells me salt and thread, and tells me every time that I use too much of both." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    kodo = {
      lines = {
        { id = "kodo_d", text = "Only when Gurda Wildmane brings one to me herself, from a beast she sat beside to the end. Then I work it for three days without speaking, and it goes to someone she names, and never to a stranger for coin." },
      },
      choices = {
        { text = "And if a hunter brought you one?", next = "kodo_hunter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kodo_hunter = {
      big = true,
      lines = {
        { id = "kodo_hunter_d", text = "I would ask where he got it, and if he had taken it in the graveyard, I would send him to Gurda to explain himself. I have done so once. He left Desolace that night, and I do not think he hunts any more." },
      },
      choices = {
        { text = "That was justly done.", next = "BACK", reply = "It was what the place asked of me. I took no pleasure in it.", fx = { align = { order = 1 } } },
        { text = "A hide is a hide. You drove off a customer.", next = "BACK", reply = "I did, and I would again. There are customers this post is better without.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    post = {
      lines = {
        { id = "post_d", text = "Felgur Twocuts commands, and Maurin Bonesplitter and Takata Steelblade do the hardest of the fighting. Harnor feeds us and Muuran arms us, and Gurda reminds us all what the post is here to guard." },
      },
      choices = {
        { text = "And what is that?", next = "post_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_guard = {
      lines = {
        { id = "post_guard_d", text = "The road the old kodo walk. If the centaur or the demons ever close it, the great beasts will have nowhere to go to die, and I do not know what becomes of a people whose oldest friends cannot rest." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    scorpid = {
      lines = {
        { id = "scorpid_d", text = "You do not cut it, you split it along the seam where the plates meet, and then you soak it until it bends. Hurry it and it shatters; I have a basket of my own failures that I keep to show students." },
      },
      choices = {
        { text = "May I see the basket?", next = "BACK", reply = "You may, and you may add to it. Everyone does.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    words = {
      lines = {
        { id = "words_d", text = "They are short. 'You ran well, and you will go on.' Say them with your hand flat on the hide, and mean them, and that is the whole of it." },
      },
      choices = {
        { text = "You ran well, and you will go on.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My family has borne this name longer than the tribes have had a home. I came to Ghost Walker Post because the work here needed a careful hand." } },
    advice = { { id = "tp_ad", text = "Oil your leather twice as often in Desolace as you would in Mulgore. This land drinks the life out of everything." } },
    _none = { { id = "tp_none", text = "I cannot tell you that. Felgur Twocuts knows more of what passes on the roads." } },
  },
}

---------------------------------------------------------------------------
-- Lah'Mawhani: trade supplies vendor at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "lahmawhani", id = TODO_NPC("Lah'Mawhani"), name = "Lah'Mawhani", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "shadowprey" }, temper = { "sharp", "teasing" }, values = { "trade", "kin" },
  notices = { "craft", "race" },
  impression = {
    first = "Lah'Mawhani sells trade supplies at Shadowprey Village and bargains as if it were a game she expects to win. She teased me about what I bought and then told me, quite seriously, what I had forgotten.",
    third = "{name} met Lah'Mawhani, who sells trade supplies at Shadowprey Village.",
  },
  greetings = {
    { id = "g_hi", text = "Come in, come in, don't stand dere drippin' on my thread. What you be makin', and what you be missin'?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, mon! You used it all up already, or you just like my company?" },
    { id = "g_away", when = { away = 14 }, text = "{away} gone, and my shelves been full de whole time. I nearly forgot how to count your coin." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear face! Sit, tell me who your people are; I bet I know an auntie of yours." },
    { id = "n_craft", cat = "craft", when = { profession = { "Leatherworking", "Tailoring", "Blacksmithing", "Alchemy" } },
      text = "You got maker's hands, mon. Good, makers always come back, and dey never argue long." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of de big folk. Mind your horns on de drying racks, ya? Aboda already took two down dis season." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Lah'Mawhani. Thread, salt, dye, vials, flux; if you make somethin' with your hands, I sell de part you can't make yourself." },
        { id = "h_troll", when = { race = "Troll" }, text = "I be Lah'Mawhani, and it does me good to see another Darkspear dis far west. Buy somethin', mon, and den tell me de news from Sen'jin." },
        { id = "h_crafter", when = { profession = { "Leatherworking", "Tailoring", "Blacksmithing", "Alchemy" } }, text = "I be Lah'Mawhani. I see de stains on your fingers, so don't pretend you only came to look; tell me de craft, and I find de shelf." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I got time, and you got coin." },
        { id = "h_again2", text = "Ask, ask. Talk be free, it's de only thing here dat is." },
        { id = "h_again3", text = "Ya?" },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "How do goods reach a village like this?", next = "reach" },
        { text = "Who buys from you here?", next = "buy" },
        { text = "You like to bargain.", next = "bargain" },
        { text = "Tell me the news of the village.", next = "news", when = { race = "Troll" } },
        { text = "What sells to a crafter passing through?", next = "sells", when = { profession = { "Leatherworking", "Tailoring", "Blacksmithing", "Alchemy" } } },
        { text = "Do you think of this as home?", next = "home" },
        { text = "Good trading, Lah'Mawhani.", next = "END" },
      },
    },
    reach = {
      lines = {
        { id = "reach_d", text = "By wind rider from Thunder Bluff, when Thalon's beasts got room, and by de Gizelton caravan when it gets through. Dose goblins lose a wagon to de centaur every other trip, and den I got no dye for a month." },
      },
      choices = {
        { text = "Can't the village guard the caravan?", next = "reach_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reach_guard = {
      lines = {
        { id = "reach_guard_d", text = "We be fishers, mon, not soldiers. Ghost Walker Post got de braves, and dey got demons and three clans of centaur to watch. So de caravan hires who it can, and prays to whatever goblins pray to." },
      },
      choices = {
        { text = "Their ledgers, I'd guess.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buy = {
      lines = {
        { id = "buy_d", text = "Malux takes my salt for his hides, Wulan takes my spice for her pots, and Mai'Lahii takes more thread dan anyone, for de nets. Hae'Wilani buys flux and complains it's not hot enough, like I make de stuff." },
      },
      choices = {
        { text = "And the orc on the dock?", next = "buy_drul" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buy_drul = {
      lines = {
        { id = "buy_drul_d", text = "Drulzegar? He buys rope, lots of rope, and oilcloth, and he pays without hagglin', which be how I know he's up to somethin'. A mon who don't haggle got his mind on bigger money." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bargain = {
      lines = {
        { id = "bargain_d", text = "It be de only fun in sellin', mon! You name a price, I laugh, I name a price, you cry, and we meet in de middle and both go home thinkin' we won." },
      },
      choices = {
        { text = "And who really wins?", next = "bargain_wins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bargain_wins = {
      big = true,
      lines = {
        { id = "bargain_wins_d", text = "Me, mon, always me. But I make sure you don't feel it, and dat's de skill." },
      },
      choices = {
        { text = "Then name your price and I'll pay it. Haggling wastes time.", next = "BACK", reply = "Bah! You talk like an orc. Where's de joy in dat? Fine, fine, but I be disappointed.", fx = { align = { order = 1 } } },
        { text = "We'll see. I've out-haggled goblins.", next = "BACK", reply = "Ha! Now you're talkin', mon. Sit down, dis gonna take a while.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    news = {
      lines = {
        { id = "news_d", text = "Jinar'Zillen been in a mood since de naga came up de beach last moon. Lui'Mala says he caught a fish as long as de dock, and Malux says Lui'Mala never caught nothin' longer dan his own arm. Dat's all of it, mon; it's a small village." },
      },
      choices = {
        { text = "Small villages have the best gossip.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = {
        { id = "sells_d", text = "Vials, if you brew, because nobody remembers to bring enough. Coarse thread and salt if you work hides, since dis land gives plenty of scorpid and nothin' to cure it with." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "home_d", text = "Dis be home now, mon. I had a stall on de Echo Isles once, under a palm, with de sea at my back. Dis one got de sea at its back too, and I tell myself dat's close enough." },
      },
      choices = {
        { text = "It's a good stall.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = { { id = "tp_car", text = "De Gizelton brothers, Rigger and Cork, dey run de only wagons crazy enough to cross Kolkar land. I pray for dem, mon, mostly for my own sake." } },
    background = { { id = "tp_bg", text = "I sold on de Echo Isles, den at Sen'jin, den here. A trader goes where de customers be, even if it's de edge of nowhere." } },
    advice = { { id = "tp_ad", text = "Buy your thread before de caravan's due, mon, not after. After, dere might be no caravan." } },
    _none = { { id = "tp_none", text = "Don't know, mon, and I don't sell what I don't know. Ask Jinar'Zillen." } },
  },
}

---------------------------------------------------------------------------
-- Mai'Lahii: fishing supplies vendor at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "mailahii", id = TODO_NPC("Mai'Lahii"), name = "Mai'Lahii", title = "Fishing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "shadowprey" }, temper = { "easy", "superstitious" }, values = { "sea", "spirits" },
  notices = { "class", "craft", "race" },
  impression = {
    first = "Mai'Lahii sells fishing supplies on the Shadowprey docks and ties a charm onto every line she sells. She is easy and unhurried, and she would not say what the charms were for until I had bought one.",
    third = "{name} met Mai'Lahii, who sells fishing supplies on the docks of Shadowprey Village.",
  },
  greetings = {
    { id = "g_hi", text = "Hooks, line, bait? Sit on de barrel, mon, and tell me what you be fishin' for. De sea likes to know." },
    { id = "g_back", when = { metBefore = true }, text = "You be back! De charm worked, den, or you'd be at de bottom." },
    { id = "g_away", when = { away = 14 }, text = "{away} off de water. De fish got fat and lazy waitin' for you." },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You got a fisher's burn on de back of your neck, mon. Dat's from lookin' down at de float all day, and I like you already." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! You grew up with salt in your hair like me, I can tell. Sit, sit." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Den you know de water got spirits in it, and you won't laugh at my charms like de orcs do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Mai'Lahii. I sell de line and de hooks, and Lui'Mala teaches what to do with dem, and between us nobody in Shadowprey goes hungry." },
        { id = "h_fisher", when = { profession = "Fishing" }, text = "I be Mai'Lahii. You fish already, so I don't sell you de cheap hooks, mon; I got de good bone ones in de back for people who know." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I be Mai'Lahii. Tauren don't fish much, I know, but de ones who try it out here don't ever go back to chasin' plainstriders, so watch yourself." },
      },
      again = {
        { id = "h_again", text = "What else, mon? De tide's slow today, so I got time." },
        { id = "h_again2", text = "Ask. I be only mendin' net." },
        { id = "h_again3", text = "Ya?" },
      },
      choices = {
        { text = "Show me your tackle.", next = "BUSINESS" },
        { text = "What are the charms for?", next = "charm" },
        { text = "Is the fishing good off Shadowprey?", next = "good" },
        { text = "You and Lui'Mala work close.", next = "lui" },
        { text = "What bait takes the big ones here?", next = "bait", when = { profession = "Fishing" } },
        { text = "Which loa watches fishers?", next = "loa", when = { race = "Troll" } },
        { text = "Who shares the dock with you?", next = "dock" },
        { text = "Fair tides, Mai'Lahii.", next = "END" },
      },
    },
    charm = {
      lines = {
        { id = "charm_d", text = "For de naga, mon. A little knot of red thread and a fish bone, tied just so, and de Slitherblade don't see your line in de water. My grandmother made dem on de Echo Isles for de murlocs." },
      },
      choices = {
        { text = "Do they work?", next = "charm_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    charm_work = {
      lines = {
        { id = "charm_work_d", text = "Lui'Mala lost three lines last moon and he don't use dem, and I lost none, so you tell me, mon." },
      },
      choices = {
        { text = "Then I'll take a charm with my line.", next = "BACK", reply = "Smart. It be already tied on; I don't sell a line without one.", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Luck. The naga just prefer his bait.", next = "BACK", reply = "Maybe so, maybe so. You go on thinkin' dat, and I go on catchin' fish.", fx = { trait = { skeptical = 1 } } },
      },
    },
    good = {
      lines = {
        { id = "good_d", text = "Better dan it should be, next to a land dis dead. De cold water comes up from deep along dis coast, and it brings de big fish with it. De sea don't care what happened on de shore." },
      },
      choices = {
        { text = "And the naga don't spoil it?", next = "good_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_naga = {
      big = true,
      lines = {
        { id = "good_naga_d", text = "Dey take dere share and dey cut our nets when dey feel like it. Jinar'Zillen says we leave dem be, and I say fine, but I mark where each net was cut, and I be keepin' count." },
      },
      choices = {
        { text = "Keep count. One day they should answer for it.", next = "BACK", reply = "Ya. A fisher got a long memory, mon; we wait all day for one bite.", fx = { align = { light = -1 } } },
        { text = "Let it go. The sea is big enough to share.", next = "BACK", reply = "Dat's what my grandmother would say. She was a better woman dan me, and she never had her best net cut.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lui = {
      lines = {
        { id = "lui_d", text = "We been arguin' on dis dock since it was built, mon. He says it's all in de wrist, I say it's all in de tackle, and we both know it's de fish dat decides." },
      },
      choices = {
        { text = "Who catches more?", next = "lui_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lui_more = {
      lines = {
        { id = "lui_more_d", text = "Him, on a good day, and he never lets me forget it. But he fishes with my hooks, on my line, so I count half of his as mine." },
      },
      choices = {
        { text = "That seems fair.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bait = {
      lines = {
        { id = "bait_d", text = "Shrimp from under de dock for de snapper, and a bit of bright cloth for de big ones dat hunt by sight. And fish de north side, mon, away from de wind riders; Thalon's beasts drop tings in de water you don't want on a hook." },
      },
      choices = {
        { text = "North side. Thank you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    loa = {
      lines = {
        { id = "loa_d", text = "My grandmother gave her first catch each season to de sea itself, and never said a name. Some tings be older dan de names we got for dem, mon, and it's safer not to guess." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dock = {
      lines = {
        { id = "dock_d", text = "Drulzegar at de far end, starin' at Ranazjar Isle like it owes him money. Thalon and his wind riders. And de Shadowprey Guardians, who tell me every mornin' my barrels be in de way." },
      },
      choices = {
        { text = "Are they in the way?", next = "BACK", reply = "Ya. Dey been in de way for three years.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = { { id = "tp_cen", text = "Dey don't come down to de water, mon, and dat's de best thing about dem. A centaur on a dock be a centaur in de sea." } },
    background = { { id = "tp_bg", text = "I grew up on a boat, mon. I got more sea in me dan land, and I mean to keep it dat way." } },
    advice = { { id = "tp_ad", text = "Wet your line before you cast, and never whistle on de dock. One's for de knots and de other's for luck." } },
    _none = { { id = "tp_none", text = "Dat I don't know, mon. Ask up in de village; I only know what swims." } },
  },
}

---------------------------------------------------------------------------
-- Wulan: cooking supplies vendor at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "wulan", id = TODO_NPC("Wulan"), name = "Wulan", title = "Cooking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "shadowprey" }, temper = { "motherly", "firm" }, values = { "hospitality", "thrift" },
  notices = { "craft", "race" },
  impression = {
    first = "Wulan sells cooking supplies at Shadowprey Village, a tauren among trolls, and has opinions about how each of them seasons a fish. She pressed a twist of dried herbs into my hand and told me not to waste it.",
    third = "{name} met Wulan, who sells cooking supplies at Shadowprey Village.",
  },
  greetings = {
    { id = "g_hi", text = "You look as though you have been eating out of your saddlebag. Come here, and let us see what can be done about that." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back. Did you use the herbs as I told you, or did you boil them?" },
    { id = "g_away", when = { away = 14 }, text = "{away} on the road, and thinner for it. Sit down, child." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You carry a pan that has been properly blackened. I am glad to see somebody on this coast knows how to treat one." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the tribes! It has been too long since I heard a proper Mulgore greeting. Say something, child, anything at all." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. I love your people dearly, and I will say again that not everything needs that much pepper." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Wulan. Spices, salt, flour and oil, carried a long way and sold to people who mostly put them on fish. I have made my peace with the fish." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "I am Wulan, and you are a cook, so we shall get along. I keep the good spices under the mat, away from the damp, for those who will know the difference." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "I am Wulan. You are far from the plains, child, as I am, and I will tell you what I tell myself: the sea is only a very flat prairie, and you grow used to it." },
      },
      again = {
        { id = "h_again", text = "What else, child? I am only sorting salt." },
        { id = "h_again2", text = "Ask, and hand me that jar while you do." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "How did a tauren come to cook for trolls?", next = "came" },
        { text = "What does Shadowprey eat?", next = "eat" },
        { text = "Everything here comes a long way, I think.", next = "far" },
        { text = "What would you do with Desolace's game?", next = "game", when = { profession = "Cooking" } },
        { text = "Do you miss Mulgore's cooking fires?", next = "miss", when = { race = "Tauren" } },
        { text = "Tell me about Innkeeper Sikewa.", next = "sikewa" },
        { text = "Thank you, Wulan.", next = "END" },
      },
    },
    came = {
      lines = {
        { id = "came_d", text = "I followed Sikewa, who keeps the inn, because she is my oldest friend and could not be trusted to feed herself. I meant to stay a season, and that was a good many seasons ago." },
      },
      choices = {
        { text = "And the trolls took to you?", next = "came_trolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    came_trolls = {
      lines = {
        { id = "came_trolls_d", text = "They laughed at my cooking for a year, and then one winter the fish ran thin and I showed them what can be done with roots and dried kodo. Nobody has laughed since, and Lui'Mala asks for the roots." },
      },
      choices = {
        { text = "You earned your place.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eat = {
      lines = {
        { id = "eat_d", text = "Fish, and then fish, and on feast days a different fish. Snapper off the dock, clams when Drulzegar brings them in, and crab when the tide leaves any. I add what I can, so they do not all turn to scales." },
      },
      choices = {
        { text = "And the pepper?", next = "eat_pepper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eat_pepper = {
      lines = {
        { id = "eat_pepper_d", text = "The Darkspear would put it in their water if I let them. I ration it, child, for their own good and because the caravan brings one sack a season, and they call me a tyrant to my face." },
      },
      choices = {
        { text = "A tyrant with the only pepper wins.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    far = {
      lines = {
        { id = "far_d", text = "Every grain of it. Flour from Mulgore by wind rider, salt and oil by the Gizelton caravan, and spice from wherever the goblins found it. When a wagon is lost to the Kolkar, the whole village eats plainer for a month." },
      },
      choices = {
        { text = "That's a thin thread to hang a village on.", next = "far_thin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    far_thin = {
      big = true,
      lines = {
        { id = "far_thin_d", text = "It is, and I keep a second store under the inn floor that nobody knows about but Sikewa. When the caravan fails, I bring it out a little at a time and let them think I am only being clever with what is left." },
      },
      choices = {
        { text = "You should tell them. They'd worry less.", next = "BACK", reply = "They would also eat it, child, by the second week. I know my village.", fx = { align = { order = -1 } } },
        { text = "Wise. A hidden reserve is a village's backbone.", next = "BACK", reply = "So my mother taught me, in the wandering days. One sack that nobody counts is worth three that everybody does.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    game = {
      lines = {
        { id = "game_d", text = "Scorpid tail, split and roasted in its own shell, which is better than it has any right to be. Hyena I would not feed to a hyena. And never the kodo, child, not here, not ever." },
      },
      choices = {
        { text = "Never the kodo. I understand.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = {
        { id = "miss_d", text = "I miss the smell of sweetgrass smoke more than I can say. Aboda brings me a twist of it when the riders come from Thunder Bluff, and I burn a little under the pot and tell the trolls it is a spice." },
      },
      choices = {
        { text = "That's a secret worth keeping.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sikewa = {
      lines = {
        { id = "sikewa_d", text = "She runs the inn as if every guest were a calf with a cough. Trolls, orcs, the Forsaken who come through to that hut of Willow's; all of them get a blanket and a scolding." },
      },
      choices = {
        { text = "I'll brace myself for the scolding.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = { { id = "tp_cen", text = "The Kolkar take one wagon in three from the caravan, child, and every one they take is a month of plain eating for this village. I have no kind word for them." } },
    background = { { id = "tp_bg", text = "I am a Mulgore cook on a troll dock at the edge of a dead land. I did not plan it, and I would not undo it." } },
    advice = { { id = "tp_ad", text = "Dry your fish before you carry it inland, child. Nothing turns faster than a wet fish in Desolace heat." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask Sikewa at the inn; travellers tell her everything." } },
  },
}

---------------------------------------------------------------------------
-- Tukk: general goods vendor at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "tukk", id = TODO_NPC("Tukk"), name = "Tukk", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "shadowprey" }, temper = { "easy", "sly" }, values = { "trade", "the village" },
  notices = { "travel", "race", "class" },
  impression = {
    first = "Tukk sells general goods at Shadowprey Village and can tell how far a traveller has come by what has run out in their pack. He is easy company, and he sold me a waterskin while I was still telling him I had one.",
    third = "{name} met Tukk, who sells general goods at Shadowprey Village.",
  },
  greetings = {
    { id = "g_hi", text = "Hey, mon, come out of dat grey dust and into de sea air. You crossed Desolace to get here, so I already know half of what you need." },
    { id = "g_back", when = { metBefore = true }, text = "Back at Tukk's, ya? Good, de land out dere eats supplies, and I be de one who sells dem again." },
    { id = "g_away", when = { away = 14 }, text = "{away}, mon! I thought de centaur had you. Sit, show me de pack, and we see what's left in it." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! You come all de way from de Echo Isles side to de far side of de world, and still you find a troll sellin' torches. Dat's us, mon." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and one who's been shootin' at somethin' big, by how light dat quiver sits. I got arrows and shot both, so don't be shy." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of de tauren, like Taiga and her kin up de hill. Your people buy slow and never haggle, and I can't decide if I like dat or miss de fight." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Tukk. Bags, waterskins, torches, arrows and shot, and whatever else de road took from you between Ghost Walker Post and here, which is a long, dry way." },
        { id = "h_troll", when = { race = "Troll" }, text = "I be Tukk, and it's good to hear a Darkspear step on de boards. Buy what you need, and den tell me if Sen'jin Village still smells of smoked fish, because I dream about it." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I be Tukk. You be wantin' arrows or shot, hunter, and plenty, because de kodo out dere take a lot of convincin' and de scorpids take more." },
      },
      again = {
        { id = "h_again", text = "What else, mon? De tide's not goin' anywhere fast." },
        { id = "h_again2", text = "Ask away, I be listenin'." },
        { id = "h_again3", text = "Ya, mon?" },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What does Desolace use up fastest?", next = "uses" },
        { text = "Shadowprey is a long way from anywhere.", next = "far" },
        { text = "Who else trades in the village?", next = "village" },
        { text = "Do the naga trouble your trade?", next = "naga" },
        { text = "Sen'jin still smells of smoked fish.", next = "senjin", when = { race = "Troll" } },
        { text = "What should I carry for kodo?", next = "kodo", when = { class = "HUNTER" } },
        { text = "Stay easy, Tukk.", next = "END" },
      },
    },
    uses = {
      lines = {
        { id = "uses_d", text = "Water first, mon, always water. Dere's not a clean stream between here and de Stonetalon pass, and what pools you find got demon stink or kodo bones in dem." },
      },
      choices = {
        { text = "And after water?", next = "uses_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    uses_after = {
      lines = {
        { id = "uses_after_d", text = "Torches, because de sky over Desolace be grey all day and black all night, and folk get caught out. After dat it's bags, for all de bones and horns everyone carries back and nobody ever tells me why." },
      },
      choices = {
        { text = "I've carried a few bones myself.", next = "BACK", reply = "See? Everybody. One day I'm gonna ask what dey for, and I bet I don't like de answer.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    far = {
      lines = {
        { id = "far_d", text = "Dat's de point of it, mon. De fish be thick here, de Horde wanted a dock on dis coast, and nobody else wanted de place. We got de sea in front and all dat dead land behind, and most days I only look at de sea." },
      },
      choices = {
        { text = "How do your goods reach you?", next = "far_goods" },
        { text = "Something else.", next = "BACK" },
      },
    },
    far_goods = {
      lines = {
        { id = "far_goods_d", text = "Some come by wyvern with Thalon, de small things, and de rest come overland from Sun Rock Retreat when de centaur let de road alone. I order double and hope for half, and dat's about what gets here." },
      },
      choices = {
        { text = "The centaur take the rest?", next = "far_centaur" },
        { text = "Something else.", next = "BACK" },
      },
    },
    far_centaur = {
      big = true,
      lines = {
        { id = "far_centaur_d", text = "De Kolkar or de Magram or whoever be winnin' dat week, ya. Dey don't even use most of it, mon, dey just cut de packs open and leave it in de dust, and I find my own torches on de road goin' north." },
      },
      choices = {
        { text = "The Horde should guard that road properly.", next = "BACK", reply = "I been sayin' so to Vark Battlescar, and he says he got demons to think about first. He's right, and I'm still short of torches.", fx = { align = { order = 1 } } },
        { text = "Pay one clan to leave your packs alone.", next = "BACK", reply = "Ha, I thought of it! Den de other clans want payin' too, and now I'm feedin' every centaur in Desolace.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = {
        { id = "village_d", text = "Lah'Mawhani got de makers' supplies and she'll talk you out of your boots. Mai'Lahii has de fishin' gear, Wulan de spices, and Hae'Wilani makes axes dat I wouldn't want to argue with." },
      },
      choices = {
        { text = "Do you and Lah'Mawhani compete?", next = "village_lah" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_lah = {
      lines = {
        { id = "village_lah_d", text = "We tried it one season, mon, and she won so bad I had to borrow thread from her to mend my own awning. Now she sells to de makers and I sell to de walkers, and we both sleep better." },
      },
      choices = {
        { text = "A wise surrender.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga = {
      lines = {
        { id = "naga_d", text = "Dey don't come up on de docks, not yet. But de boats stay closer in dan dey used to, since Drulzegar Skraghook came back alone, and fewer boats means fewer fishers buyin' from Tukk." },
      },
      choices = {
        { text = "Do you speak with Drulzegar?", next = "naga_drul" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_drul = {
      lines = {
        { id = "naga_drul_d", text = "I bring him a waterskin most evenings and set it down beside him, and he don't say thanks and I don't need him to. A troll who lost his whole crew gets to be quiet as long as he likes." },
      },
      choices = {
        { text = "That is kindly done.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    senjin = {
      lines = {
        { id = "senjin_d", text = "Ahh, don't tell me dat, mon, now I got to sit down. De fish here be bigger, but nobody smokes dem right, and Wulan keeps tellin' me it's de pepper when I know it's de wood." },
      },
      choices = {
        { text = "It's de wood, mon. Always de wood.", next = "BACK", reply = "Thank you! Go tell Wulan, and stand back when you do.", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kodo = {
      lines = {
        { id = "kodo_d", text = "Heavy shot or broad arrows, and twice what you think. An old kodo can walk a long way with a quiver's worth in him, and it's a bad thing for you both if he does." },
      },
      choices = {
        { text = "I'll make it quick for the beast.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = { { id = "tp_cen", text = "Four clans of dem, mon, all fightin' each other, and somehow dey still find time for my supply packs." } },
    background = { { id = "tp_bg", text = "I came over with de first boats to build de docks. When de buildin' was done, somebody had to sell de nails, and I never left." } },
    advice = { { id = "tp_ad", text = "Fill your waterskins here, mon. De next clean water north of dis village be a very long walk." } },
    _none = { { id = "tp_none", text = "Dat's past what Tukk knows, mon. Ask Sikewa at de inn, she hears it all." } },
  },
}

---------------------------------------------------------------------------
-- Hae'Wilani: axecrafter at Shadowprey Village.
---------------------------------------------------------------------------
P:NPC {
  key = "haewilani", id = TODO_NPC("Hae'Wilani"), name = "Hae'Wilani", title = "Axecrafter",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "shadowprey" }, temper = { "exacting", "fierce" }, values = { "craft", "strength" },
  notices = { "kit", "class", "craft" },
  impression = {
    first = "Hae'Wilani makes axes at Shadowprey Village and complains that nothing on this coast burns hot enough for proper steel. She weighed my weapon in one hand and found it wanting before I had spoken.",
    third = "{name} met Hae'Wilani, the axecrafter at Shadowprey Village.",
  },
  greetings = {
    { id = "g_hi", text = "Stand dere, where I can see how you carry your weight. I don't sell an axe to anyone till I know which side dey lean on." },
    { id = "g_back", when = { metBefore = true }, text = "You be back, and de edge is still on it. So you been usin' it right, or you not been usin' it at all." },
    { id = "g_away", when = { away = 14 }, text = "{away}, and look at dat haft, all dried out by de dust. Give it here before it splits in your hand." },
  },
  notice = {
    { id = "n_axe", cat = "class", when = { class = { "WARRIOR", "SHAMAN", "HUNTER" } },
      text = "Now here's an arm dat knows what an axe is for. Good, mon, I get tired of sellin' to folk who only want one to hang on a wall." },
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "You be a smith, ya? Den tell me true, does your flux run clean, because what I get here spits like a wet cat." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Your people and mine both love de axe, and we never agree how long de haft should be. Yours be too short, mon, I'm only sayin'." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Hae'Wilani, and I make axes, one-hand and two-hand, and nothin' else. A smith who makes everything makes nothin' well, and dere's enough in one axe to keep me learnin' all my life." },
        { id = "h_axe", when = { class = { "WARRIOR", "SHAMAN", "HUNTER" } }, text = "I be Hae'Wilani. You got de shoulders for my work, so hold out your arm and let me see de reach, because I don't sell de same axe to two different bodies." },
        { id = "h_smith", when = { profession = { "Blacksmithing", "Mining" } }, text = "I be Hae'Wilani, axecrafter. You know de forge, so you know what it means when I say I do dis with driftwood charcoal and a sea wind in de bellows." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while de steel cools." },
        { id = "h_again2", text = "Go on, mon, I can hammer and hear." },
        { id = "h_again3", text = "Ya?" },
      },
      choices = {
        { text = "Show me your axes.", next = "BUSINESS" },
        { text = "Why only axes?", next = "only" },
        { text = "A forge by the sea must be hard to keep.", next = "sea" },
        { text = "Who carries your work?", next = "carry" },
        { text = "What do you make of Desolace?", next = "land" },
        { text = "Fit an axe to my reach, then.", next = "reach", when = { class = { "WARRIOR", "SHAMAN", "HUNTER" } } },
        { text = "Lah'Mawhani says you complain about her flux.", next = "flux", when = { profession = { "Blacksmithing", "Mining" } } },
        { text = "Strong steel to you, Hae'Wilani.", next = "END" },
      },
    },
    only = {
      lines = {
        { id = "only_d", text = "Because de axe is honest, mon. A sword asks you to be clever and a mace asks you to be strong, but an axe asks for both and forgives neither, and I like a thing dat don't flatter." },
      },
      choices = {
        { text = "Who taught you the craft?", next = "only_taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    only_taught = {
      lines = {
        { id = "only_taught_d", text = "My mother, on de Echo Isles, with stone and bone before we ever had much iron. When de Darkspear came to Durotar, de orcs showed me deir steel, and I showed dem how a troll balances a throw. It was a fair trade." },
      },
      choices = {
        { text = "So your axes are part troll and part orc.", next = "BACK", reply = "Troll in de balance and orc in de weight, ya. Dat be de Horde in one piece of steel, if you want to be pretty about it.", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sea = {
      lines = {
        { id = "sea_d", text = "It be a curse, mon. De salt air rusts a blade while I'm still lookin' at it, de driftwood burns too cool, and Lah'Mawhani's flux is not hot enough, which I tell her every time and she laughs every time." },
      },
      choices = {
        { text = "Then why not forge inland?", next = "sea_inland" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sea_inland = {
      big = true,
      narr = "She turns a half-finished axe head over in the tongs and holds it up against the grey light.",
      lines = {
        { id = "sea_inland_d", text = "Because dis is where de axes be needed. Dere's naga in de water and demons at Mannoroc and centaur everywhere between, and de fishers here had nothin' but gaffs till I came. A good forge far away is no use to dem." },
      },
      choices = {
        { text = "A smith belongs where the need is greatest.", next = "BACK", reply = "Dat's how I see it, mon. I complain about de forge all day, and I'd not move it one step.", fx = { align = { light = 1 } } },
        { text = "Your skill is wasted on fishers. Orgrimmar would pay more.", next = "BACK", reply = "Orgrimmar got a hundred smiths, and Shadowprey got me. I know which one misses me if I go.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry = {
      lines = {
        { id = "carry_d", text = "De village guardians, every one, and Vark Battlescar, who dented his on a demon's skull and brought it back like it was my fault. Drulzegar Skraghook asked for one last, and he didn't want it for choppin' wood." },
      },
      choices = {
        { text = "You made Drulzegar his axe?", next = "carry_drul" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carry_drul = {
      lines = {
        { id = "carry_drul_d", text = "I did, mon, and I put more care in it dan in any I ever made. He lost five of his crew to de Slitherblade, and if an axe is all I can give him for dat, den it's gonna be de best axe on dis coast." },
      },
      choices = {
        { text = "He'll put it to good use.", next = "BACK", fx = { affinity = 1 } },
        { text = "An axe won't bring his crew back.", next = "BACK", reply = "No, it won't, and he knows it, and I know it. I made it anyway.", fx = { trait = { honest = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    land = {
      lines = {
        { id = "land_d", text = "It's a dead land, and it makes everything in it hard. De centaur be hard, de kodo be hard, even de tauren up de hill got a look in deir eye dey don't have in Mulgore. I suppose I got harder too." },
      },
      choices = {
        { text = "Hard land makes good steel, they say.", next = "BACK", reply = "Dey say dat who never had to find charcoal here. But ya, maybe, a little.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    reach = {
      narr = "She measures your arm from shoulder to knuckle with a knotted cord, and then does it again.",
      lines = {
        { id = "reach_d", text = "Longer in de arm dan you look, so you want de haft a hand shorter dan you been carryin'. You been swingin' wide to make up for it, mon, and it's a wonder nobody's stepped inside and gutted you." },
      },
      choices = {
        { text = "A hand shorter. I'll trust your eye.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flux = {
      lines = {
        { id = "flux_d", text = "Ha, she told you dat! It's true, and I'll say it to her face and to yours. It does de job, I admit, but it does it slow, and I never yet met a smith who was happy with what dey could get." },
      },
      choices = {
        { text = "No smith ever is.", next = "BACK", reply = "Dere, you see? You understand. Now go tell her you agree with me.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    naga = { { id = "tp_naga", text = "De Slitherblade got scales, mon, and scales turn a thin edge. I grind my axes thicker behind de bite because of dem." } },
    background = { { id = "tp_bg", text = "I learned on de Echo Isles and finished learnin' in Durotar. I came here because dere was no smith, and a village with no smith is only waitin'." } },
    advice = { { id = "tp_ad", text = "Oil de head every night on dis coast, mon. De sea don't sleep, and neither does rust." } },
    _none = { { id = "tp_none", text = "I don't know, and I got steel coolin'. Ask Sikewa, or Tukk, who never stops listenin'." } },
  },
}
