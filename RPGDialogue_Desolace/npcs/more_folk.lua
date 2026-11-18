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
    first = "The Centaur Pariah was cast out of his tribe for heresy, and he wanders the south of Desolace alone. He believes the centaur should stop fighting over scraps and unite as one great people, and he needs an outsider to help him do it.",
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
    first = "Willow is a Forsaken who lives in Kormek's Hut, northeast of the Kodo Graveyard, and calls herself a researcher. She wants carvings from the depths of Maraudon, and she grew noticeably less friendly when I asked what she meant to do with them.",
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
        { id = "neighbours_d", text = "A goblin called Bibbly F'utzbuckle shares the hut and hires out muscle to anyone who asks, and the Gizelton caravan rattles past whenever it has not been robbed. I find the kodo graveyard better company than either." },
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
    first = "Aboda keeps the stables at Shadowprey Village and speaks to the beasts more softly than he speaks to their owners. He seems happiest with a kodo's head resting on his shoulder.",
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
    first = "Lui'Mala teaches fishing off the docks at Shadowprey Village and tells every student the sea here is better than the Echo Isles, then tells them the opposite the next day. He laughs at his own stories more than anyone else does.",
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
    first = "Malux teaches skinning at Shadowprey Village with a knife he never seems to put down. He is dry and unimpressed by most things, though he grew almost cheerful talking about the hides of Desolace's scorpids.",
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
    first = "Muuran makes and sells maces at Ghost Walker Post, and he calls himself a superior macecrafter without a hint of modesty. He talks about the weight of a mace the way others talk about the weight of a promise.",
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
    first = "Maxton Strang sells mail armour at Nijel's Point, a long way from Stormwind, and he complains about the sand in his rings. He is wry and practical, and he seems to measure everyone for a hauberk on sight.",
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
    first = "Shelgrayn keeps the stables at Nijel's Point and speaks with the measured calm of her people. She is gentle with the beasts and polite with their owners, though she clearly prefers the beasts.",
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
        { id = "h_again2", text = "Ask, if you wish. I have time." },
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
