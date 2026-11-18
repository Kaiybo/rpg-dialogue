-- Tirisfal folk an earlier pass missed: the Deathknell watch (Bartrand, Oliver, Phillip, Randolph), the road
-- patrol (Lundmark), Deathguard Kel, Harold Raims, Maquell Ebonwood and Maximillion in Deathknell, the dwarf in
-- the tavern cellar, Ratslin Maime in Brill and the two zeppelin masters. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Deathguard Bartrand: Deathknell watch.
P:NPC {
  key = "deathguard_bartrand", id = TODO_NPC("Deathguard Bartrand"), name = "Deathguard Bartrand", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "deathknell" }, temper = { "dry" }, values = { "dutiful" },
  notices = { "race" },
  impression = {
    first = "Deathguard Bartrand keeps watch over Deathknell with the patience of a man who has already been buried once. He counts the newly risen as they come up the hill and seems faintly surprised by each one.",
    third = "{name} met Deathguard Bartrand, one of the Deathknell watch.",
  },
  greetings = {
    { id = "g_default", text = "Keep moving, {class}. Deathknell is a small place, and I like to know where everyone in it is standing." },
    { id = "g_back", when = { metBefore = true }, text = "You're still on your feet, I see. That puts you ahead of half the ones who climbed out with you." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A warm one, here among the graves. The Dark Lady calls you an ally, so I'll call you one too, though you'll forgive me if I keep count of you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deathguard Bartrand, of the Deathknell watch. I stand here and see that what comes out of the crypt is one of ours, and that what comes down from the hills is dealt with before it reaches the chapel." } },
      again = {
        { id = "h_again", text = "Was there something else? The graves don't watch themselves." },
        { id = "h_again2", text = "Go on, then, but be brief about it." },
      },
      choices = {
        { text = "What comes out of the crypt that isn't one of ours?", next = "crypt" },
        { text = "What comes down from the hills?", next = "hills" },
        { text = "It's a quiet post you have.", next = "quiet" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    crypt = {
      lines = { { id = "c_default", text = "Some wake with their wits and walk up to Mordo like sensible corpses, and some wake with nothing behind the eyes at all. The second sort wander off toward the fields, and Shadow Priest Sarvis sends the first sort to put them down." } },
      choices = {
        { text = "That's hard work to give the newly risen.", next = "hard" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    hard = {
      lines = { { id = "hd_default", text = "It's the kindest lesson Deathknell teaches, because it shows them what they nearly were. Nobody who has cut down a mindless neighbour ever asks me again why we serve the Dark Lady." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    hills = {
      lines = { { id = "hl_default", text = "Scarlet zealots, mostly, who have decided that we're the plague and they're the cure. They hold a camp over the rise, and Executor Arren keeps a list of the ones he'd like removed from it." } },
      choices = { { text = "I'll speak to Arren. Another matter.", next = "BACK" } },
    },
    quiet = {
      lines = { { id = "q_default", text = "It is, and I've come to prefer it that way. I was a noisy man when I was alive, by all accounts, and it did me very little good in the end." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I died in Lordaeron's fall and woke in service to the Dark Lady, like every other soldier on this hill." } },
    scarlet_crusade = { { id = "tp_sc", text = "Fanatics in red, camped closer to Deathknell than I care for. Arren wants them thinned." } },
    _none = { { id = "tp_none", text = "That's no business of the watch. Ask Executor Arren, if you must ask someone." } },
  },
}

-- Deathguard Oliver: Deathknell watch.
P:NPC {
  key = "deathguard_oliver", id = TODO_NPC("Deathguard Oliver"), name = "Deathguard Oliver", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "deathknell" }, temper = { "wry" }, values = { "dutiful", "loyal" },
  notices = { "class" },
  impression = {
    first = "Deathguard Oliver stands his post in Deathknell with a soldier's straight back and a gravedigger's sense of humour. He seems to find the whole business of being dead mildly ridiculous.",
    third = "{name} met Deathguard Oliver, a dry-humoured guard of the Deathknell watch.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Deathknell, {class}, where the air is foul and the company is worse. Mind the open graves on your way through." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Most people only need to visit a graveyard once, and I include myself in that." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You hold that blade as though you remember how. Dannal Stern drills the warriors here, and he's been short of anyone worth shouting at." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deathguard Oliver. I served in Lordaeron's garrison when it had a king, and I serve in Deathknell's now that it has a queen, and I'll confess the second posting has fewer parades." } },
      again = {
        { id = "h_again", text = "What else can a dead man tell you?" },
        { id = "h_again2", text = "Ask away, since I've nowhere to be until the world ends." },
      },
      choices = {
        { text = "You served the old king?", next = "king" },
        { text = "Where should someone newly risen go first?", next = "first" },
        { text = "You take death lightly.", next = "lightly" },
        { text = "Carry on, Deathguard.", next = "END" },
      },
    },
    king = {
      lines = { { id = "k_default", text = "I stood a wall for Terenas, and then his son came home and put a sword through him, and through a good many of the rest of us after. I don't raise a glass to the house of Menethil these days." } },
      choices = {
        { text = "And now you serve Sylvanas.", next = "queen" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    queen = {
      lines = { { id = "qn_default", text = "She cut the Lich King's leash from my neck, which is more than any living lord ever did for me. I'd follow the Dark Lady into the sea for that, though I'd complain about the damp the whole way." } },
      choices = { { text = "Let's talk of something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "Undertaker Mordo will look you over when you climb out, and Shadow Priest Sarvis will find you something to kill. After that it's the road north to Brill, where Executor Zygand has work for anyone who can hold a weapon." } },
      choices = { { text = "Let's talk of something else.", next = "BACK" } },
    },
    lightly = {
      lines = { { id = "l_default", text = "I've tried taking it seriously, friend, and it made no difference to the smell. A man who can't laugh at his own funeral will find eternity a very long watch." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Garrison soldier under Terenas, and Deathguard under the Dark Lady. The pay was better the first time." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, and I've had a long time to think about most things." } },
  },
}

-- Deathguard Phillip: Deathknell watch.
P:NPC {
  key = "deathguard_phillip", id = TODO_NPC("Deathguard Phillip"), name = "Deathguard Phillip", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "deathknell" }, temper = { "stern" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "Deathguard Phillip watches the road out of Deathknell as if he expects the Scarlet Crusade over the hill within the hour. He has no patience for idlers and says as much.",
    third = "{name} met Deathguard Phillip, a stern guard of the Deathknell watch.",
  },
  greetings = {
    { id = "g_default", text = "State your business or walk on, {class}. The Crusade doesn't rest, and neither does this watch." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I hope you've been useful to someone since we last spoke." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Scourge" },
      text = "One of Dark Cleric Duesten's flock, by the look of you. See that your faith is of some use on the field, because the Scarlets certainly believe theirs is." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deathguard Phillip. My post is this road, and my orders are that nothing in a red tabard walks it, so unless you've seen one I can't think what we have to discuss." } },
      again = {
        { id = "h_again", text = "Well? Speak, and then let me get back to it." },
        { id = "h_again2", text = "Is there more, or may I return to my duty?" },
      },
      choices = {
        { text = "How close does the Crusade come?", next = "crusade" },
        { text = "You don't think much of the newly risen.", next = "risen" },
        { text = "As you were, Deathguard.", next = "END" },
      },
    },
    crusade = {
      lines = { { id = "c_default", text = "Close enough that I can smell their torches when the wind turns. They've a camp in the hills east of the village, and they send their converts down to prove themselves on whoever is slowest out of the crypt." } },
      choices = {
        { text = "Why hasn't the watch burned the camp?", next = "burn" },
        { text = "Enough of that.", next = "BACK" },
      },
    },
    burn = {
      lines = { { id = "b_default", text = "Because there are six of us and a village of half-woken dead to mind, and the Deathguard doesn't abandon its post to go hunting. Executor Arren sends the new ones against the camp, which bloods them and thins the Scarlets at one stroke." } },
      choices = { { text = "Enough of that.", next = "BACK" } },
    },
    risen = {
      lines = { { id = "r_default", text = "I think nothing of them until they've earned it, which is how I was taught and how I teach. Prove you can follow an order and keep your head, and you'll find me civil enough." } },
      choices = { { text = "I'll remember it. Enough of that.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a soldier before the plague and I am a soldier after it. Very little else about me is worth your time." } },
    scarlet_crusade = { { id = "tp_sc", text = "Zealots who would burn every one of us and call it mercy. Kill them when you find them." } },
    _none = { { id = "tp_none", text = "That isn't a matter for the watch. Take it to the Executor." } },
  },
}

-- Deathguard Randolph: Deathknell watch.
P:NPC {
  key = "deathguard_randolph", id = TODO_NPC("Deathguard Randolph"), name = "Deathguard Randolph", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "deathknell" }, temper = { "calm" }, values = { "dutiful", "patient" },
  notices = { "race" },
  impression = {
    first = "Deathguard Randolph speaks slowly and misses nothing. He has the look of a man who was old before he died and saw no reason to change his habits afterwards.",
    third = "{name} met Deathguard Randolph, the oldest hand on the Deathknell watch.",
  },
  greetings = {
    { id = "g_default", text = "Easy now, {class}. There's no call to hurry in Deathknell, since everyone here has already been late for the last time." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. Stand a while if you like, for the hill is quiet tonight." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You've the stare of someone not long out of the ground. It passes, and what replaces it is mostly anger, which you'll find more useful." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deathguard Randolph. I've watched this hill since the Dark Lady freed us, and I have seen a great many of our people climb out of that crypt and stand blinking at the sky." } },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask, and I'll answer if I can." },
      },
      choices = {
        { text = "What do you say to them, when they wake?", next = "wake" },
        { text = "What was Deathknell, before?", next = "before" },
        { text = "You sound almost fond of the place.", next = "fond" },
        { text = "Good watch to you.", next = "END" },
      },
    },
    wake = {
      lines = { { id = "w_default", text = "I tell them their name, if I know it, and I tell them they are free. Most of them don't believe the second part until they've walked to Brill and nobody has stopped them." } },
      choices = {
        { text = "And the ones who never believe it?", next = "never" },
        { text = "Tell me of something else.", next = "BACK" },
      },
    },
    never = {
      lines = { { id = "nv_default", text = "Some walk into the hills and don't come back, and a few go south looking for families who will scream at the sight of them. I can't stop them, and I've learned not to try, because every one of us has to find out for himself what he is now." } },
      choices = { { text = "Tell me of something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "A village with a chapel, where the farms of Tirisfal buried their dead under good stone. The plague filled the crypt faster than the diggers could manage, and now it empties itself, which I doubt the old priests had in mind." } },
      choices = { { text = "Tell me of something else.", next = "BACK" } },
    },
    fond = {
      lines = { { id = "f_default", text = "Fond is a warm word, and I've no warmth left to spend on it. Call it habit, since a man must stand somewhere, and I've stood here long enough to know every stone." } },
      choices = { { text = "Tell me of something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was an old soldier when the plague took me, and death hasn't made me any younger." } },
    _none = { { id = "tp_none", text = "I can't help you there. I know this hill, and not a great deal beyond it." } },
  },
}

-- Deathguard Lundmark: walks the road between Deathknell and the Undercity; gives directions.
P:NPC {
  key = "deathguard_lundmark", id = TODO_NPC("Deathguard Lundmark"), name = "Deathguard Lundmark", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "brill" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "travel" },
  impression = {
    first = "Deathguard Lundmark walks the road between Deathknell and the Undercity and knows every milestone on it. He gives directions the way other men give orders.",
    third = "{name} met Deathguard Lundmark, who patrols the Tirisfal road and points lost travellers on their way.",
  },
  greetings = {
    { id = "g_default", text = "Lost already, {class}? Walk with me a moment and say where you're bound, because I don't stop for anyone." },
    { id = "g_back", when = { metBefore = true }, text = "You found your way back to the road, then. That's more than some manage." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The road's darker than it looks, and the hounds hunt it after sundown. Tell me where you're going and be quick." },
  },
  notice = {
    { id = "n_low", cat = "travel", when = { race = "Scourge", maxLevel = 9 },
      text = "You've the look of someone fresh from the crypt and pointed at the wrong horizon. Brill is north along this road, and you won't miss the gallows." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deathguard Lundmark, road patrol. I walk from Deathknell to the gates of the Undercity and back again, so if there's a place in the Glades you can't find, I've likely tripped over it." } },
      again = {
        { id = "h_again", text = "Where else do you need pointing?" },
        { id = "h_again2", text = "Keep up, and ask as we go." },
      },
      choices = {
        { text = "Which way to Brill?", next = "brill" },
        { text = "How do I reach the Undercity?", next = "undercity" },
        { text = "What should I stay away from on this road?", next = "danger" },
        { text = "I know my way. Farewell.", next = "END" },
      },
    },
    brill = {
      lines = { { id = "b_default", text = "Follow the road north and east from Deathknell and it runs straight through the middle of the town. The Gallows' End Tavern has beds, and Executor Zygand at the town hall has work for anyone who asks." } },
      choices = { { text = "Thank you. Another thing.", next = "BACK" } },
    },
    undercity = {
      lines = { { id = "u_default", text = "Past Brill the road bends south-east to the ruins of Lordaeron's capital. Walk through the old courtyard and the throne room, and the lifts beyond will take you down to the city proper." } },
      choices = {
        { text = "And the tower I can see outside the walls?", next = "tower" },
        { text = "Another thing.", next = "BACK" },
      },
    },
    tower = {
      lines = { { id = "t_default", text = "That's the goblins' zeppelin tower, north of the gates. One airship crosses to Orgrimmar and the other goes down to Grom'gol in Stranglethorn, and the goblins at the top will tell you which is which if you can bear the noise." } },
      choices = { { text = "Another thing.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "Keep clear of the Agamand Mills to the north-west, where the Scourge still holds the family crypts, and of the Scarlet tower up the road from Brill. The murlocs along the north coast are a nuisance too, though only a fool gets killed by them twice." } },
      choices = { { text = "I'll keep to the road. Another thing.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried messages on these roads when Lordaeron lived, and I walk them still. Only the company has changed." } },
    _none = { { id = "tp_none", text = "If it isn't on my road, I can't tell you. Ask in Brill." } },
  },
}

-- Deathguard Kel: north of the Brill cemetery; the priest lesson Garments of Darkness mends him.
P:NPC {
  key = "deathguard_kel", id = TODO_NPC("Deathguard Kel"), name = "Deathguard Kel", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "brill" }, temper = { "gruff" }, values = { "dutiful", "brave" },
  notices = { "class" },
  impression = {
    first = "Deathguard Kel stands his ground north of Brill's cemetery with fresh cuts in his armour and no intention of going back to have them seen to. He would sooner bleed dust than leave a gap in the line.",
    third = "{name} met Deathguard Kel, who holds the ground north of the Brill cemetery.",
  },
  greetings = {
    { id = "g_default", text = "Mind where you tread, {class}. The dogs out here have the plague, and they don't care whose leg they take." },
    { id = "g_active", when = { questActive = TODO_QUEST("Garments of Darkness") }, text = "Beryl sent you, did she? Then do what you came to do, priest, because I've a hole in my side that's letting the wind in." },
    { id = "g_done", when = { questDone = TODO_QUEST("Garments of Darkness") }, text = "The priest who patched me up. I'm holding together well enough, and I told Beryl so." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, out past the graves. If you've any mending in you, there's always a Deathguard on this line who could use it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deathguard Kel. I keep the ground north of the cemetery clear, so the hounds and the Scarlet scouts don't come wandering in among the headstones while decent folk are trying to rise." } },
      again = {
        { id = "h_again", text = "What else? I've a field to watch." },
        { id = "h_again2", text = "Speak up, then." },
      },
      choices = {
        { text = "You look wounded.", next = "wounds" },
        { text = "What comes at you out here?", next = "threats" },
        { text = "Why not fall back to Brill?", next = "fallback" },
        { text = "Hold fast, Deathguard.", next = "END" },
      },
    },
    wounds = {
      lines = { { id = "w_default", text = "I am, and I'll be wounded again before the week is out. A darkhound opened my side at dusk, and I've stuffed the gap with a rag until Dark Cleric Beryl sends someone who can do better." } },
      choices = {
        { text = "Does it hurt?", next = "hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurt = {
      lines = { { id = "hu_default", text = "Less than it would have when I was breathing, and more than the apothecaries claim. What troubles me is the weakness, because a guard who can't lift his sword is only a scarecrow in good armour." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threats = {
      lines = { { id = "t_default", text = "Hounds with the plague rotting them, bats the size of a dog, and now and then a Scarlet scout creeping down from their tower. The beasts I can manage alone, but the Scarlets come in threes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fallback = {
      lines = { { id = "f_default", text = "Because Deathguard Burgess has the town and I have the field, and if I leave it there's nothing between the cemetery and the hills. I'll go back to Brill when I'm relieved or when I'm in pieces." } },
      choices = { { text = "Stubborn. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Deathguard of Brill, posted north of the graves. There's not much more to me than the post." } },
    _none = { { id = "tp_none", text = "I wouldn't know. I watch a field, and the field doesn't gossip." } },
  },
}

-- Harold Raims: apprentice weaponsmith, Deathknell.
P:NPC {
  key = "harold_raims", id = TODO_NPC("Harold Raims"), name = "Harold Raims", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "deathknell" }, temper = { "dry", "earnest" }, values = { "craft", "practical" },
  notices = { "class" },
  impression = {
    first = "Harold Raims sells plain blades in Deathknell and calls himself an apprentice, though his master is nowhere to be seen. He handles each dagger as though it might be the one that finally earns him the better title.",
    third = "{name} met Harold Raims, the apprentice weaponsmith who arms the newly risen in Deathknell.",
  },
  greetings = {
    { id = "g_default", text = "You'll want something with an edge before you leave this hill, {class}. I've daggers, short swords and a mace or two, all of them plain and all of them sound." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another, or did you break the first? I've seen both today already." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "ROGUE" } },
      text = "You look at a blade the way a buyer should, by the balance and not the shine. That's rarer on this hill than you'd think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Harold Raims, apprentice weaponsmith. Most of my customers climbed out of a grave an hour ago with nothing but a shroud, so I don't sell them anything they'd need a lesson to swing." } },
      again = {
        { id = "h_again", text = "Anything else? The whetstone's waiting on me." },
        { id = "h_again2", text = "Go on, I can talk and sharpen." },
      },
      choices = {
        { text = "Apprentice to whom?", next = "master" },
        { text = "What do the newly risen buy?", next = "buy" },
        { text = "Your blades are very plain.", next = "plain" },
        { text = "I'll look at your stock later.", next = "END" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "To a smith in Lordaeron who never woke, which leaves me with half a trade and nobody to sign off the other half. Blacksmith Rand lets me use his forge, and corrects me when he's bored." } },
      choices = {
        { text = "So you'll stay an apprentice forever?", next = "forever" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forever = {
      lines = { { id = "f_default", text = "Forever is a real prospect for our kind, so I've given it some thought. I mean to finish a blade that Rand can't find fault with, and on that day I'll change the sign myself." } },
      choices = { { text = "I hope you manage it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    buy = {
      lines = { { id = "b_default", text = "Daggers, nine times in ten, because a dagger asks nothing of an arm that's been lying still for a year. The ones who buy a mace usually come back the next day for a dagger." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    plain = {
      lines = { { id = "p_default", text = "They are, and I won't apologise for it. A fancy hilt has never yet stopped a Scarlet zealot, whereas four inches of honest steel does it every time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was learning the forge in Lordaeron when the plague came. I'm still learning it, only more slowly." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. I know steel, and not much that isn't made of it." } },
  },
}

-- Maquell Ebonwood: a Forsaken woman in Deathknell.
P:NPC {
  key = "maquell_ebonwood", id = TODO_NPC("Maquell Ebonwood"), name = "Maquell Ebonwood", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "deathknell" }, temper = { "cold", "sharp" }, values = { "practical", "proud" },
  notices = { "race" },
  impression = {
    first = "Maquell Ebonwood stands in Deathknell watching the newly risen stumble past, and she judges each of them in a glance. She speaks like a woman who once ran a household and resents having nothing left to run.",
    third = "{name} met Maquell Ebonwood, a sharp-tongued Forsaken woman of Deathknell.",
  },
  greetings = {
    { id = "g_default", text = "Stand up straight, {class}. You may be dead, but there's no reason to look it." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and with all your limbs. I had wondered." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Breathing, and in Deathknell of all places. You'll find the smell improves once you stop noticing it, or so I assume." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Maquell Ebonwood. I woke on this hill some while ago and have stayed, because somebody ought to tell these poor creatures to brush the grave dirt off before they present themselves to an Executor." } },
      again = {
        { id = "h_again", text = "Yes? What else?" },
        { id = "h_again2", text = "Go on, I'm listening, after a fashion." },
      },
      choices = {
        { text = "Why stay in Deathknell?", next = "stay" },
        { text = "What do you make of the newly risen?", next = "risen" },
        { text = "You sound as though you miss your old life.", next = "miss" },
        { text = "Good day, madam.", next = "END" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "Brill has a tavern and the Undercity has sewers, and I care for neither. Here at least there is a chapel roof, a little order, and a use for someone who remembers how things ought to be done." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    risen = {
      lines = { { id = "r_default", text = "Half of them weep, a quarter of them rage, and the rest stand about waiting to be told what they are. I tell them they are Forsaken, and that the name is a fact and not a complaint." } },
      choices = {
        { text = "Which were you?", next = "which" },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    which = {
      lines = { { id = "w_default", text = "I was the sort who looked at her own hands for a long while and then asked where she might find a comb. One keeps up standards, {class}, because once those go there is very little left of a person." } },
      choices = { { text = "Tell me something else.", next = "BACK" } },
    },
    miss = {
      lines = { { id = "m_default", text = "I miss having a table to set and people worth setting it for. But the people are ash and the table is firewood, so I'll thank you not to be sentimental on my behalf." } },
      choices = { { text = "As you wish. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a respectable house in Tirisfal once. The plague had no respect for it." } },
    _none = { { id = "tp_none", text = "I'm sure I don't know, and I'm sure it's none of my concern." } },
  },
}

-- Maximillion: warlock trainer, Deathknell.
P:NPC {
  key = "maximillion", id = TODO_NPC("Maximillion"), name = "Maximillion", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "deathknell" }, temper = { "smooth", "cold" }, values = { "ambitious", "cunning" },
  notices = { "class" },
  impression = {
    first = "Maximillion teaches the shadow arts in the ruined chapel at Deathknell, and he teaches them like a man who enjoys being right. He was pleased to see a new student, and more pleased to tell me how many of the old ones had failed.",
    third = "{name} met Maximillion, who trains the Forsaken's warlocks in Deathknell.",
  },
  greetings = {
    { id = "g_default", text = "You've wandered into a lesson, {class}. Sit quietly at the back, or better still, don't sit at all." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Ah, one of mine. Come in, and let us find out whether death has left you with any talent worth the trouble of teaching." },
    { id = "g_scroll", when = { questActive = TODO_QUEST("Tainted Scroll") }, text = "You have my scroll, I see, and you had the sense to bring it rather than read it. That is a promising start." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and in one piece. I confess I had a small wager with Kayla on the matter." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" }, faction = "Alliance" },
      text = "I can smell the incense on you from here. The Light had a chapel on this very spot once, and you may judge by the roof how well it defended it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Maximillion, and I instruct those of the Forsaken who would rather command a demon than fear one. It is a narrow path with a long drop on either side, and I am told my manner on it is not encouraging." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "I am Maximillion, and for as long as you are on this hill you are my student. I shall teach you to bind what the living are too frightened to name, and you will oblige me by surviving the lessons." },
      },
      again = {
        { id = "h_again", text = "Was there another question? I do enjoy them, within reason." },
        { id = "h_again2", text = "Continue, and do try to be interesting." },
      },
      choices = {
        { text = "Why teach demon-binding to the newly risen?", next = "why" },
        { text = "How many of your students fail?", next = "fail" },
        { text = "Who is Kayla?", next = "kayla" },
        { text = "What is the first thing a warlock learns?", next = "first", when = { class = "WARLOCK" } },
        { text = "The Light forbids what you teach.", next = "light", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I'll take my leave.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because we are few and our enemies are many, and the Dark Lady cannot afford to be squeamish about where her strength comes from. A mind that has already thrown off the Lich King is not easily mastered by an imp." } },
      choices = {
        { text = "The orcs trusted demons once.", next = "orcs" },
        { text = "Speak of something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "They did, and it is the most instructive mistake in the history of the craft. The orcs drank what the demons offered them, whereas a warlock of the Forsaken takes what he wants and offers nothing at all." } },
      choices = {
        { text = "And if the demon takes you instead?", next = "taken" },
        { text = "Speak of something else.", next = "BACK" },
      },
    },
    taken = {
      lines = { { id = "t_default", text = "Then you were a poor student, and Undertaker Mordo will see to what remains. I do not say it to be cruel, only so that you understand the art has no patience for the half-hearted." } },
      choices = { { text = "Speak of something else.", next = "BACK" } },
    },
    fail = {
      lines = { { id = "f_default", text = "Fewer than my reputation suggests, though I see no reason to correct it. Most who fail simply find they have no stomach for the work and go off to swing a sword for Dannal Stern, which is a kind of failure but not a fatal one." } },
      choices = { { text = "Speak of something else.", next = "BACK" } },
    },
    kayla = {
      lines = { { id = "k_default", text = "Kayla Smithe trains the demons, as I train those who hold their leashes. She has a firmer hand with an imp than anyone I have met, and she has never once let me forget that I said so." } },
      choices = { { text = "Speak of something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "fi_default", text = "That a demon's name is a chain, and that whoever speaks it with enough will holds the other end. Your first servant will be an imp, which is a spiteful little thing, but it will teach you to keep your grip while something clever argues with you." } },
      choices = { { text = "I'll keep my grip. Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "The Light forbade a great many things in Lordaeron, and the plague was not among the things it prevented. I bear your faith no grudge, but you will understand if my people have stopped asking its permission." } },
      choices = { { text = "We'll not agree. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied things in life that I was careful not to mention in company. Death has made me a good deal more candid." } },
    warlocks = { { id = "tp_wl", text = "We take the demons' strength and give them only orders. Anyone who tells you it is the other way about has met the wrong warlocks." } },
    _none = { { id = "tp_none", text = "That lies outside my studies, and I do not pretend to knowledge I lack. It is a habit I recommend." } },
  },
}

-- Captured Mountaineer: a dwarf held in the cellar of the Gallows' End Tavern, Brill (Johaan's A New Plague).
P:NPC {
  key = "captured_mountaineer", id = TODO_NPC("Captured Mountaineer"), name = "Captured Mountaineer", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "brill" }, temper = { "gruff", "fierce" }, values = { "brave", "loyal" },
  notices = { "race" },
  impression = {
    first = "The Forsaken keep a dwarf in the cellar of the Gallows' End Tavern, a mountaineer of Ironforge taken somewhere on the road. He is thin and filthy and has not stopped cursing his captors since they brought him in.",
    third = "{name} met a captured dwarven mountaineer, held in the cellar of the Gallows' End Tavern in Brill.",
  },
  greetings = {
    { id = "g_default", text = "Come tae gawp at the dwarf, have ye? Take a good long look, ye walking carcass, for I'm the liveliest thing in this whole stinking town." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "By my beard, a friendly face in this pit! Keep yer voice down, {g:lad|lass}, for the dead have ears even when they've nae got any." },
    { id = "g_pumpkin", when = { questActive = TODO_QUEST("A New Plague") }, text = "What's that ye've brought me, then? If it's food I'll take it, and if it's a trick I'm too hungry tae care." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'm still here and still breathing, which I'll wager annoys the lot of ye." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, keeping company with corpses! My grandfather fought yer kind at Blackrock Spire, and he'd have said ye'd fallen a long way since." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm a mountaineer of Ironforge, and that's all the name ye'll have from me. They took me on the road and chained me down here among the ale barrels, and nae a drop of it have they let me taste." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf, down here, and walking free! I'll nae ask how ye managed it, but if ye see Ironforge again, tell them a mountaineer held his tongue in Brill." },
      },
      again = {
        { id = "h_again", text = "Well? I've naught but time, and ye're wasting it." },
        { id = "h_again2", text = "Say yer piece, then." },
      },
      choices = {
        { text = "How were you taken?", next = "taken" },
        { text = "What do they want with you?", next = "want" },
        { text = "You're a long way from the mountains.", next = "mountains" },
        { text = "I can't free you, but I won't forget you.", next = "pity", when = { faction = "Alliance" } },
        { text = "Enjoy the cellar, dwarf.", next = "END" },
      },
    },
    taken = {
      lines = { { id = "t_default", text = "I was carrying word north through the hills when a pack of them rose up out of a ditch, quiet as fog. I put two back in the ground with my axe before the rest had me, and I count that a fair trade for one evening." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    want = {
      lines = { { id = "w_default", text = "They ask me nothing, which is what frets me. That apothecary of theirs comes down and looks me over like a butcher pricing a ram, and writes in his wee book, and goes away again." } },
      choices = {
        { text = "The apothecary is Johaan.", next = "johaan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    johaan = {
      lines = { { id = "j_default", text = "Aye, that'd be the one, with a stink of vinegar about him. A soldier I could spit at, but a man who never raises his voice and keeps taking notes is another matter, and I'll confess he turns my stomach." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mountains = {
      lines = { { id = "m_default", text = "Aye, and I feel every mile of it. I'd give my left boot for one breath of cold air off Dun Morogh and a mug of anything that hasn't been within smelling distance of a corpse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pity = {
      lines = { { id = "p_default", text = "That's more than I'd hoped tae hear down here, and I'll nae ask ye tae throw yer life after mine. Get yerself out, and raise a mug in Ironforge for the one that didn't." } },
      choices = { { text = "I will. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Mountaineer of Ironforge, and that's the whole of what I'll tell anyone in this town." } },
    _none = { { id = "tp_none", text = "Ye'll get nothing from me on that, nor on anything else." } },
  },
}

-- Ratslin Maime: a Forsaken who keeps to himself in Brill.
P:NPC {
  key = "ratslin_maime", id = TODO_NPC("Ratslin Maime"), name = "Ratslin Maime", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "brill" }, temper = { "sharp", "wry" }, values = { "cunning", "careful" },
  notices = { "stealth" },
  impression = {
    first = "Ratslin Maime keeps to the edge of things in Brill, where he can see who comes and goes without being part of it. He answered my questions with questions of his own until I gave up counting.",
    third = "{name} met Ratslin Maime, a watchful Forsaken who keeps to himself in Brill.",
  },
  greetings = {
    { id = "g_default", text = "You've a heavy tread, {class}. I heard you coming from the road, and so did everyone else in Brill worth worrying about." },
    { id = "g_back", when = { metBefore = true }, text = "The same boots again. Sit, if you're staying, because standing over a man makes him nervous." },
  },
  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Now you I didn't hear until you chose to be heard. Marion Call would have a use for feet like those, if she hasn't found you already." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Ratslin Maime, and that's a name I give out sparingly. I keep my ears open in Brill, which is easy work, since a town full of the dead has very little to do except talk." } },
      again = {
        { id = "h_again", text = "What else are you fishing for?" },
        { id = "h_again2", text = "Ask it quietly, whatever it is." },
      },
      choices = {
        { text = "What does a town of the dead talk about?", next = "talk" },
        { text = "Who are you listening for?", next = "listen" },
        { text = "You don't trust anyone, do you?", next = "trust" },
        { text = "I'll leave you to your listening.", next = "END" },
      },
    },
    talk = {
      lines = { { id = "t_default", text = "The Scarlets up the road, who took whose house, and what the apothecary is brewing in his corner that he won't discuss. Innkeeper Renee hears the most, though she tells it as stories, and you have to know which parts are true." } },
      choices = {
        { text = "What is the apothecary brewing?", next = "brew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew = {
      lines = { { id = "b_default", text = "Something he tests on hounds and murlocs, and lately on a dwarf they keep under the tavern. I haven't asked what it's for, because a man who asks the Royal Apothecary Society too many questions tends to become one of the answers." } },
      choices = { { text = "Wise of you. Something else.", next = "BACK" } },
    },
    listen = {
      lines = { { id = "l_default", text = "Anyone who is somewhere they shouldn't be, saying something they oughtn't. I don't claim it's noble work, but Brill sleeps easier for it, and nobody has yet come to thank me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "tr_default", text = "I trusted a king, a church and a city wall, and you can see for yourself how I was repaid. These days I trust what I've heard twice from people who dislike each other." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I made my living on other people's secrets when I breathed, and I've seen no cause to learn a new trade." } },
    _none = { { id = "tp_none", text = "If I knew, I'd want to know why you were asking." } },
  },
}

-- Zapetta: Durotar Zeppelin Master, the tower north of the Undercity gates.
P:NPC {
  key = "zapetta", id = TODO_NPC("Zapetta"), name = "Zapetta", gender = "male",
  bible = "bibles/missed.md", role = "flightmaster", tier = "service",
  communities = { "brill" }, temper = { "brisk", "chatty" }, values = { "profit", "practical" },
  notices = { "travel" },
  impression = {
    first = "Zapetta runs the Orgrimmar zeppelin from the tower outside the Undercity, with one eye on the sky and the other on a schedule nobody else can read. He talks about crossing the Great Sea as if it were a trip to the market.",
    third = "{name} met Zapetta, the goblin who minds the zeppelin to Durotar from the tower in Tirisfal.",
  },
  greetings = {
    { id = "g_default", text = "Orgrimmar, pal? She's due any minute, and by any minute I mean sometime before your friends down there finish rotting." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, a repeat customer! That's the best kind, because it means the last trip didn't kill ya." },
  },
  notice = {
    { id = "n_first", cat = "travel", when = { race = "Scourge", maxLevel = 15 },
      text = "First time off the ground, am I right? You hold the rail and you don't look down, kid, and you'll be in Durotar before you've had time to regret it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Zapetta's the name, and I run the Durotar line. She docks here, she crosses the Great Sea, and she ties up at the tower outside Orgrimmar, and the whole trip's faster than any boat and only a little more flammable." } },
      again = {
        { id = "h_again", text = "What else, friend? I got a ship to flag in." },
        { id = "h_again2", text = "Talk fast, the wind's shifting." },
      },
      choices = {
        { text = "What's Durotar like?", next = "durotar" },
        { text = "Is the zeppelin safe?", next = "safe" },
        { text = "And the other airship?", next = "other" },
        { text = "I'll wait for the ship.", next = "END" },
      },
    },
    durotar = {
      lines = { { id = "d_default", text = "Red rock, red dust and a sun that'll cook a goblin in his boots, and the orcs love it like it was paradise. The tower sets you down right by the gates of Orgrimmar, and from there it's Razor Hill to the south if you want work." } },
      choices = {
        { text = "The Forsaken must find it warm.", next = "warm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warm = {
      lines = { { id = "w_default", text = "Listen, I've shipped plenty of your Undercity folks over, and every one of 'em steps off complaining about the light. Then the orcs complain about the smell, and everybody's even, which is what I call a healthy alliance." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "s_default", text = "She's goblin-built, so she's as safe as anything that's a big bag of gas with engines strapped under it. We ain't lost one on my line yet, and I'd know, because the paperwork on a lost airship would bury me." } },
      choices = { { text = "That's not much comfort. Something else.", next = "BACK" } },
    },
    other = {
      lines = { { id = "o_default", text = "That's Hin Denburg's line, down to Grom'gol in Stranglethorn. My brother Nez'raz works the tower at the jungle end, so if you see a goblin there who looks like me but sweatier, tell him he still owes me twelve silver." } },
      choices = { { text = "I'll pass it on. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Zeppelin master on contract to the Horde, pal. It's steady money and the view's free." } },
    zeppelins = { { id = "tp_zep", text = "Two lines out of this tower: mine to Orgrimmar, and Hin's to Grom'gol. Don't get on the wrong one." } },
    _none = { { id = "tp_none", text = "Not on my schedule, friend, so not my department." } },
  },
}

-- Hin Denburg: Stranglethorn Vale Zeppelin Master, the same tower.
P:NPC {
  key = "hin_denburg", id = TODO_NPC("Hin Denburg"), name = "Hin Denburg", gender = "male",
  bible = "bibles/missed.md", role = "flightmaster", tier = "service",
  communities = { "brill" }, temper = { "jovial", "chatty" }, values = { "profit", "careful" },
  notices = { "travel" },
  impression = {
    first = "Hin Denburg minds the zeppelin that runs from Tirisfal down to Grom'gol, and he cannot stand near an open flame without flinching. He told me the airship was perfectly safe three separate times, which is twice more than I wanted.",
    third = "{name} met Hin Denburg, the goblin who minds the zeppelin to Stranglethorn from the tower in Tirisfal.",
  },
  greetings = {
    { id = "g_default", text = "Grom'gol Base Camp, departing when she gets here! No smoking on the platform, friend, and I mean that from the bottom of my heart." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another ride? See, I told ya she was safe, and here you are, living proof, more or less." },
  },
  notice = {
    { id = "n_mage", cat = "travel", when = { class = { "MAGE", "WARLOCK", "SHAMAN" } },
      text = "Whoa, whoa, you're one of the fire-throwing types, ain't ya? Keep your hands in your pockets till you're on the ground in Stranglethorn, and we'll get along fine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Hin Denburg, Stranglethorn line. My ship takes you from this nice cool graveyard of a country straight down to Grom'gol Base Camp, which is the Warchief's foothold in the jungle, and I do it without one single explosion so far." } },
      again = {
        { id = "h_again", text = "Anything else, pal? She ain't in sight yet." },
        { id = "h_again2", text = "Go ahead, I'm only watching the sky." },
      },
      choices = {
        { text = "Tell me about Grom'gol.", next = "gromgol" },
        { text = "You seem nervous about fire.", next = "fire" },
        { text = "And the other airship?", next = "other" },
        { text = "I'll wait for the ship.", next = "END" },
      },
    },
    gromgol = {
      lines = { { id = "g_default", text = "It's an orc stockade on the west coast of Stranglethorn Vale, with the sea on one side and about a million things that want to eat you on the other. The Horde hunts and scouts from there, and the goblins at Booty Bay are a long walk south if you got business with my people." } },
      choices = {
        { text = "What wants to eat me?", next = "eat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eat = {
      lines = { { id = "e_default", text = "Tigers, panthers, raptors, crocolisks, and I hear the trolls ain't picky either. I'm not tryin' to scare off a paying passenger, you understand, I'm only saying the jungle's no place for somebody who was a farmer last year." } },
      choices = { { text = "I'll manage. Something else.", next = "BACK" } },
    },
    fire = {
      lines = { { id = "f_default", text = "Friend, I stand under a bag of gas the size of a town hall every day of my life, so yeah, I got opinions about sparks. It's a perfectly safe way to travel, and it stays that way as long as nobody does anything stupid near it." } },
      choices = { { text = "I'll keep my torch away. Something else.", next = "BACK" } },
    },
    other = {
      lines = { { id = "o_default", text = "That's Zapetta, on the Orgrimmar run. He'll tell ya his line's the important one, on account of the Warchief living at the end of it, but mine's got the better weather and nobody's ever been sunburnt in Tirisfal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fly folks to the jungle for the Horde, and I get paid whether they come back or not." } },
    zeppelins = { { id = "tp_zep", text = "Mine goes to Grom'gol, and Zapetta's goes to Orgrimmar. Check the sign before you step off the platform." } },
    _none = { { id = "tp_none", text = "Couldn't tell ya, pal. If it don't fly, I don't follow it." } },
  },
}
