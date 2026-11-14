-- Chillwind Camp: Stormwind's foothold at the southern edge of the Plaguelands. Voice: bibles/westernplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "valorfist", id = TODO_NPC("Commander Ashlam Valorfist"), name = "Commander Ashlam Valorfist",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "major",
  communities = { "chillwind_camp" }, temper = { "steady", "proud" }, values = { "dutiful", "brave" },
  notices = { "class", "kit" },

  greetings = {
    { id = "g_camp", text = "On your feet or on your way. Chillwind doesn't have room for anyone sitting down." },
    { id = "g_back", when = { metBefore = true }, text = "Back in one piece. Good. I counted you out; I'll count you in." },
    { id = "g_hero", when = { questDone = TODO_QUEST("Mission Accomplished!") }, text = "There's the hero of the cauldrons! Somebody find this soldier a stool." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Shadowbreaker's sending me paladins again. Good. I asked for twenty. I'll take one who doesn't flinch at a ghoul." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in worse shape than my palisade. Get it mended before Sorrow Hill finishes the job." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Commander Ashlam Valorfist. Stormwind sent me to hold this camp and break Andorhal with a handful of soldiers, a priestess, an alchemist and whoever walks through that gate. Today, that's you." },
        { id = "h_paladin_call", tags = { "news" }, when = { questActive = TODO_QUEST("Chillwind Camp") },
          text = "Lord Shadowbreaker's letter said you'd come. He also said you'd be steady. We'll find out which part of his letter was true." },
        { id = "h_clear", tags = { "news" }, when = { questActive = TODO_QUEST("Clear the Way") },
          text = "Andorhal's west and north roads are walls of the dead. The east road runs through Sorrow Hill, and that's only skeletons and ghouls. Thin them out, and we have a door." },
        { id = "h_cleared", when = { questRecent = { TODO_QUEST("Clear the Way"), days = 3 } },
          text = "Sorrow Hill's quieter. It won't stay that way; the dead don't tire. But quieter is a start, and I've learned to be grateful for starts." },
        { id = "h_towers", tags = { "news" }, when = { questActive = TODO_QUEST("All Along the Watchtowers") },
          text = "Four towers in Andorhal, and the Scourge moves its troops by them. Mark all four with the beacon torch. And bring the torch back. It's the only one we have." },
        { id = "h_araj", tags = { "news" }, when = { questActive = TODO_QUEST("Alas, Andorhal") },
          text = "Araj the Summoner. A lich, at the heart of the city. Don't go alone. I mean it. I've written enough letters to mothers this year." },
        { id = "h_araj_dead", when = { questDone = TODO_QUEST("Alas, Andorhal") },
          text = "The lich of Andorhal is dust; I said it three times this morning to believe it. The dead still walk there, and without a master they walk worse." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "At night you can hear Andorhal from here. Not the dead. The bells. Nobody's rung them in years. Nobody living." },
        { id = "h_back", when = { metBefore = true },
          text = "I count the camp every morning and every night. Same number, most days. On the days it isn't, I write the letters myself." },
      },
      choices = {
        { text = "What do you need?", next = "need" },
        { text = "Why is Stormwind fighting here?", next = "why" },
        { text = "Point me at the dead.", next = "END", fx = { affinity = 1, standing = { chillwind_camp = 1 }, trait = { brave = 1 } } },
      },
    },
    need = {
      lines = {
        { id = "nd_default", text = "I need soldiers I don't have, and people like you who'll go where soldiers can't. MacDonnell has the cauldrons. Arbington has the rest, if you can stand him." },
      },
      choices = { { text = "I'll find them.", next = "END", fx = { affinity = 1 } } },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "These were Lordaeron's farmers and millers, and now they're the enemy's army. If the plague isn't stopped here, it walks south to Southshore, the Wetlands, then home. I'd rather fight it here." },
      },
      choices = {
        { text = "Then we stop it here.", next = "END", fx = { affinity = 2, align = { honor = 1, order = 1 } } },
        { text = "Stormwind's generous with other people's lands.", next = "END", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    plague_cauldrons = { { id = "tp_cauldrons", text = "Eight of them, four in the west. They breathe the plague over the farms. MacDonnell means to make them breathe something worse. I've stopped asking what." } },
    andorhal = { { id = "tp_andorhal", text = "A city once. Now a fortress for the dead, with a lich at its heart. It's the reason this camp exists." } },
    scholomance = { { id = "tp_scholomance", text = "The Barovs' old home on Caer Darrow. Necromancers learn their trade there. Arbington knows more than any sane man should." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They're holding Hearthglen and they don't want our help. Fine. They don't get to shoot at my scouts either, and they do." } },
    argent_dawn = { { id = "tp_dawn", text = "Pureheart's people. They'll fight beside anyone. I don't agree with all their company. I don't turn down swords either." } },
    _none = { { id = "tp_none", text = "If it isn't a threat to this camp, it isn't on my desk. Try Pureheart. She has more patience." } },
  },
}

P:NPC {
  key = "macdonnell", id = TODO_NPC("High Priestess MacDonnell"), name = "High Priestess MacDonnell",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "sharp" }, values = { "devout", "fierce" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_light", text = "The Light keep you. And keep you upwind of the farms." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Tell me a cauldron coughed and choked. Make my day." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "One of the Light's own. Good. Out here you'll learn it isn't only for healing. It burns, too, if you ask it right." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Banshee's... I'm sorry. That's the old soldier in me. The Dawn would have me welcome you, and I'll try. Don't stand too near the holy water." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "High Priestess MacDonnell. The commander handles the war; I handle the cauldrons, the Scourge's great pots breathing plague on every farm in the west. I mean to give them a dose of their own brew." },
        { id = "h_brief", tags = { "news" }, when = { questActive = TODO_QUEST("The Scourge Cauldrons") },
          text = "Four cauldrons, each guarded by a cauldron lord with the key on his belt. Kill him, take the key, fill a bottle with the muck. I'll do the rest." },
        { id = "h_felstone", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Felstone Field") },
          text = "Felstone Field first. The farm's crawling with skeletons, and something worse sits by the cauldron with the key. Bring me a sample, the fouler the better." },
        { id = "h_dalson", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Dalson's Tears") },
          text = "Dalson's Tears. The farm takes its name from the family who wept there, and I don't care to find out why. Get me that sample." },
        { id = "h_haunt", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Writhing Haunt") },
          text = "The Writhing Haunt. There's a tauren in the house there, they say, a druid, and dying. If you pass him, be kind. Then get me my sample." },
        { id = "h_gahrron", tags = { "news" }, when = { questActive = TODO_QUEST("Target: Gahrron's Withering") },
          text = "Gahrron's Withering, the last of the four, and the worst. Ghosts there. Wraiths. You'll want the Light close." },
        { id = "h_returned", when = { questRecent = { TODO_QUEST("Return to Chillwind Camp"), days = 2 } },
          text = "Arbington's been up all night with your sample. He smells like a crypt and he's happier than I've seen him in months. Well done." },
        { id = "h_jars", when = { metBefore = true },
          text = "I label every sample jar myself. Felstone, Dalson's, the Haunt, Gahrron's. Arbington says my handwriting's worse than the plague. Arbington can write his own labels." },
      },
      choices = {
        { text = "What happens when you dose a cauldron?", next = "dose" },
        { text = "I'll get your samples.", next = "END", fx = { affinity = 1, standing = { chillwind_camp = 1 }, learn = { "plague_cauldrons" } } },
      },
    },
    dose = {
      lines = {
        { id = "d_default", text = "We change the brew, so the plague from the pot eats the Scourge instead of the farmers. It lasts a day or two, then someone has to do it again. Welcome to the war.", fx = { learn = { "plague_cauldrons" } } },
      },
      choices = {
        { text = "Poison against poison.", next = "END", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Is that the Light's way?", next = "light" },
      },
    },
    light = {
      big = true,
      lines = {
        { id = "l_default", text = "The Light's way is to protect the living. If that means stirring a necromancer's soup until it chokes him, I'll stir. I'll pray first. I'll stir after." },
      },
      choices = {
        { text = "Fair.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd rather it burned clean.", next = "END", fx = { affinity = 1, align = { light = 1, order = 1 } } },
      },
    },
  },

  topics = {
    plague_cauldrons = { { id = "tp_cauldrons", text = "Kel'Thuzad's work, or his servants'. Eight pots across Lordaeron, keeping the land sick. We can't break them. We can spoil the recipe." } },
    andorhal = { { id = "tp_andorhal", text = "Andorhal's dead were people once. I keep that in my prayers. I keep the rest of me for burning them." } },
    _none = { { id = "tp_none", text = "Unless it's in a jar, I don't know it. Try the commander." } },
  },
}

P:NPC {
  key = "arbington", id = TODO_NPC("Alchemist Arbington"), name = "Alchemist Arbington",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "cowardly" }, values = { "curious", "honest" },
  notices = { "craft", "greenness" },

  greetings = {
    { id = "g_busy", text = "Mind the cauldron. Mind the bottles. Mind... actually, just stand there. Thank you." },
    { id = "g_back", when = { metBefore = true }, text = "You again! You're a terrible influence. Every time you visit, I end up doing something brave by proxy." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! Wonderful. Don't touch the quickener. It's thirty minutes from useless and thirty seconds from my eyebrows." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 50 },
      text = "You're... young for the Plaguelands. Not judging. I'm old for it, and look how that's going." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Arbington, alchemist: the counter agent for MacDonnell's cauldrons, the quickener, and more reading about the Scholomance than anyone should do. Don't ask what I've read. Please." },
        { id = "h_fragments", tags = { "news" }, when = { questActive = TODO_QUEST("Skeletal Fragments") },
          text = "A skeleton key, made from skeletons. Yes, I hear it. Everyone says it. Just bring me the fragments, the ones from Andorhal hold up best." },
        { id = "h_mold", tags = { "news" }, when = { questActive = TODO_QUEST("Mold Rhymes With...") },
          text = "Krinkle Goodsteel, in Gadgetzan, makes molds for nasty things and charges like it. I'd pay him myself, but if I had gold, would I be living here?" },
        { id = "h_scarab", tags = { "news" }, when = { questActive = TODO_QUEST("Araj's Scarab") },
          text = "The key needs a head: Araj's signet, his scarab. He ran the Scholomance before he took Andorhal, so it should open his old door. Should. I'm fairly confident. Moderately." },
        { id = "h_key", when = { questDone = TODO_QUEST("The Key to Scholomance") },
          text = "You have the key. You'll go in, won't you. I'd tell you to write and tell me what's inside, but I already know, and I'd rather not hear it in your handwriting." },
        { id = "h_pay", when = { metBefore = true },
          text = "Stormwind pays me in coin, mud and the occasional ghoul through the tent wall. I did the sums once. I stopped doing sums." },
      },
      choices = {
        { text = "Tell me about the Scholomance.", next = "scholo" },
        { text = "I'll get what you need.", next = "END", fx = { affinity = 1 } },
      },
    },
    scholo = {
      lines = {
        { id = "s_default", text = "The Barovs' keep on Caer Darrow, given to Kel'Thuzad and made a school for necromancers. Its door doesn't open for the likes of us. Hence the key, and my nightmares.", fx = { learn = { "scholomance" } } },
      },
      choices = {
        { text = "How do you know so much?", next = "know" },
        { text = "Thanks.", next = "END", fx = { affinity = 1 } },
      },
    },
    know = {
      lines = {
        { id = "k_default", text = "Somebody had to study it, and better me, who'll never set foot there. I read, I take notes. Then I wash my hands for a long time." },
      },
      choices = { { text = "That sounds hard.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    scholomance = { { id = "tp_scholomance", text = "Don't go in without a key, don't go in without friends, and if you can manage it, don't go in." } },
    plague_cauldrons = { { id = "tp_cauldrons", text = "Bring me what the creatures carry, with the focuser on you, or it's just bones. Osseous, somatic, ectoplasmic. It sounds grand. It isn't." } },
    _none = { { id = "tp_none", text = "Out of my field. Most things are, out here. My field is small and full of bones." } },
  },
}

P:NPC {
  key = "weldon", id = TODO_NPC("Weldon Barov"), name = "Weldon Barov",
  bible = "bibles/westernplaguelands.md", role = "noble", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "cowardly", "proud" }, values = { "greedy", "vengeful" },
  notices = { "race", "kit" },

  greetings = {
    { id = "g_who", text = "Who sent you? State your business. Slowly. Hands where I can see them." },
    { id = "g_back", when = { metBefore = true }, text = "Ah. The hired help. Any news of my brother? Good news, I mean. Dead news." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Stay back! Guards! ...Oh. A Forsaken, wearing the Alliance's colors? No. No, you're not, are you. Then how did you... Never mind. Stay back." },
    { id = "n_fine", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look dreadful. Rags and dents. Find the family fortune for me and you'll never dress like a peasant again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Weldon Barov, the last living Barov and the rightful heir to Caer Darrow, Brill, Tarren Mill and Southshore. My brother disagrees. My brother is also dead; he just won't lie down.",
          fx = { hear = "barov_heir" } },
        { id = "h_fortune", tags = { "news" }, when = { questActive = TODO_QUEST("Barov Family Fortune") },
          text = "Four deeds, somewhere in the Scholomance: find them before Alexi's hired cutthroats do. I spared his life once, because that corpse wore my brother's face. Never again." },
        { id = "h_last", tags = { "news" }, when = { questActive = TODO_QUEST("The Last Barov") },
          text = "The deeds are mine. Now there's only one thing between me and the fortune, and he's sitting at the Bulwark like a vulture on a fence. End him." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Last Barov") },
          text = "Alexi's gone. Truly gone. I thought I'd feel... something. I feel rich. That will do." },
        { id = "h_sleep", when = { metBefore = true },
          text = "I sleep with my back to the cliff and a sword under my blanket. Assassins, you see. He sends them. I'd do the same." },
      },
      choices = {
        { text = "What happened at Caer Darrow?", next = "darrow" },
        { text = "Your brother has a claim too.", next = "claim" },
        { text = "I'll see what I can find.", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    darrow = {
      big = true,
      lines = {
        { id = "d_default", text = "My father bargained with Kel'Thuzad for immortality, and the whole house got it, after a fashion. I ran. I was the only one with the sense to run." },
      },
      choices = {
        { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You ran and left them?", next = "END", fx = { affinity = -2, align = { honor = 1 } } },
      },
    },
    claim = {
      lines = {
        { id = "c_default", text = "A claim? He's a corpse! Corpses don't inherit. They get buried. I'd have done him the courtesy myself, if I'd had a shovel and a little more spine." },
      },
      choices = { { text = "Noted.", next = "END" } },
    },
  },

  topics = {
    scholomance = { { id = "tp_scholomance", text = "My home. It was beautiful once. Now they teach the dead to walk in my mother's ballroom." } },
    _none = { { id = "tp_none", text = "Does it concern my inheritance? Then it doesn't concern me." } },
  },
}

P:NPC {
  key = "pureheart", id = TODO_NPC("Argent Officer Pureheart"), name = "Argent Officer Pureheart",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp", "argent_dawn" }, temper = { "steady" }, values = { "devout", "fair" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_dawn", text = "For the Dawn, friend. Whatever else you fight for, add that." },
    { id = "g_back", when = { metBefore = true }, text = "Well met again. Any scourgestones in your pack? The Dawn always takes them." },
  },

  notice = {
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "Horde, in an Alliance camp. Easy. Nobody draws steel at my table. The Dawn doesn't ask what colors you wear, only whether you fight the dead." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Silver Hand? I was too, until Mograine fell and the order went red. Tyrosus and I walked out the same day, and don't let them tell you which side the Light chose." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Argent Officer Pureheart, of the Argent Dawn. We're no kingdom; we fight the Scourge, and anyone who fights it is our friend. Alliance, Horde, it's all one to the dead." },
        { id = "h_commission", tags = { "news" }, when = { questActive = TODO_QUEST("Argent Dawn Commission") },
          text = "Wear the commission, and you'll find the Scourge carry stones: the dark power that binds them, made solid. Bring me the stones. The Dawn remembers who helps." },
        { id = "h_everlook", tags = { "news" }, when = { questActive = TODO_QUEST("The Everlook Report") },
          text = "Gregor's report? Good man. I sent him to Everlook to keep the Dawn's ear among the goblins. Let me read it while it's still warm." },
        { id = "h_gregor", when = { heardLine = "gregor.h_default" },
          text = "You've been to Everlook? Then you've met Gregor Greystone. He's one of mine. Tell me he's eating. He forgets." },
        { id = "h_tyrosus", when = { heardLine = "tyrosus.h_default" },
          text = "You've spoken with Lord Tyrosus? Then you've had more of his time than I have this year. He's well? He'd never say if he wasn't." },
      },
      choices = {
        { text = "Why did you leave the Silver Hand?", next = "left" },
        { text = "I'll bring you stones.", next = "END", fx = { affinity = 1, learn = { "argent_dawn" } } },
      },
    },
    left = {
      big = true,
      lines = {
        { id = "l_default", text = "When Mograine died, the order's grief turned to hate, and the hate turned on anyone who wasn't them. That's the Scarlet Crusade. Some of us wanted to fight the plague, not every face that looked different.", fx = { learn = { "argent_dawn", "scarlet_crusade" } } },
      },
      choices = {
        { text = "You chose rightly.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The Crusade still fights the Scourge.", next = "crusade" },
      },
    },
    crusade = {
      lines = {
        { id = "c_default", text = "They do. Bravely. And they'd burn half the people in this camp for being the wrong sort of alive. I'll pray for them. I won't march with them." },
      },
      choices = { { text = "Understood.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    argent_dawn = { { id = "tp_dawn", text = "Lord Tyrosus leads us from Light's Hope. Out here it's me, a few defenders, and whoever answers. More answer every month." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "My old brothers and sisters. I miss who they were. I fear who they are." } },
    _none = { { id = "tp_none", text = "I couldn't say. If it's to do with the Scourge, ask again. Anything else, the commander." } },
  },
}

P:NPC {
  key = "dumah", id = TODO_NPC("Nathaniel Dumah"), name = "Nathaniel Dumah",
  bible = "bibles/westernplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_camp" }, temper = { "steady" }, values = { "loyal", "stubborn" },
  notices = { "race", "craft" },

  greetings = {
    { id = "g_mill", text = "Afternoon. Or whatever this is. The sky never decides up here." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Any word from Northridge? Bad word counts. I like knowing." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You've a northern face. Lordaeron, before? No, don't tell me if it hurts. Most of us who got out don't talk about it." },
    { id = "n_lumber", cat = "craft", when = { profession = { "Engineering", "Blacksmithing" } },
      text = "You work with your hands. My father would have liked you. He judged a man by his calluses." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nathaniel Dumah. My father ran the Northridge Lumber Mill before the plague, and we fled to Stormwind with what we could carry. Now the Scarlet Crusade's in our mill, so I'm back." },
        { id = "h_termites", tags = { "news" }, when = { questActive = TODO_QUEST("A Plague Upon Thee") },
          text = "Swords didn't work, so: termites, a Plaguewood breed that lived through the plague and the Scourge both. Fill this jar. Let's see the Crusade hold a mill that's being eaten." },
        { id = "h_done", when = { questDone = TODO_QUEST("A Plague Upon Thee") },
          text = "I almost feel sorry for them. Almost. It was never their mill to begin with." },
        { id = "h_father", when = { metBefore = true },
          text = "Father used to say a mill's only as good as the river. The river's still there. Sick, but there. That's more than I can say for most of Northridge." },
      },
      choices = {
        { text = "What happened to your family?", next = "family" },
        { text = "I'll help you take it back.", next = "END", fx = { affinity = 2, standing = { chillwind_camp = 1 } } },
      },
    },
    family = {
      lines = {
        { id = "f_default", text = "We lost friends and cousins, some we buried and some we never got the chance to. Father made it to Stormwind and never stopped talking about the mill. I'm not here for the wood." },
      },
      choices = {
        { text = "You're here for him.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Revenge, then.", next = "END", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They fight the Scourge, I'll grant them that. They also took a family's home and called it holy work." } },
    _none = { { id = "tp_none", text = "Don't know it. I know timber, and I know grief. Pick one." } },
  },
}

P:NPC {
  key = "bibilfaz", id = TODO_NPC("Bibilfaz Featherwhistle"), name = "Bibilfaz Featherwhistle", title = "Gryphon Master",
  bible = "bibles/westernplaguelands.md", role = "flightmaster", tier = "service",
  communities = { "chillwind_camp" }, temper = { "jovial" }, values = { "cheerful" },
  notices = { "race" },

  greetings = {
    { id = "g_fly", text = "Wings ready! Well, their wings. Mine are purely theoretical." },
    { id = "g_back", when = { metBefore = true }, text = "Back for a ride? Good timing. Snowtail's in a mood, so I'll give you the nice one." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Out here! Do you know how rare that is? I've been talking to gryphons for weeks. They're lovely. They're not conversationalists." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bibilfaz Featherwhistle, gryphon master! Ironforge, Aerie Peak, or Light's Hope if you're brave. The birds hate the smell up here as much as you do, so they fly fast." },
        { id = "h_home", when = { metBefore = true },
          text = "I tell the gryphons about Ironforge at night. The forges, the tram, the pastries in the Commons. They're homesick too, I think. Or hungry. Hard to tell." },
      },
      choices = { { text = "Let's fly.", next = "BUSINESS" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea! But I can fly you to someone who might." } },
  },
}
