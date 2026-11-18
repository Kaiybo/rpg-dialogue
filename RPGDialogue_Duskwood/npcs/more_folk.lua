-- More of Darkshire: the council's ambassador, a Carevin who sells mushrooms, and six of the Night
-- Watch who walk the town and its roads. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Ambassador Berrybuck: a member of the Council of Darkshire in the town hall.
P:NPC {
  key = "berrybuck", id = TODO_NPC("Ambassador Berrybuck"), name = "Ambassador Berrybuck", title = "Council of Darkshire", gender = "male",
  bible = "bibles/more_folk.md", role = "noble", tier = "service",
  communities = { "darkshire" }, temper = { "pompous" }, values = { "order", "status" },
  notices = { "status", "kin" },
  impression = {
    first = "He wears his best coat in a town where nobody else bothers.",
    third = "{name} met Ambassador Berrybuck of the Council of Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the town hall of Darkshire. If you've come from Stormwind, I have several letters I'd like you to carry back." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Any word from the city? No, I thought not." },
  },
  notice = {
    { id = "n_status", cat = "status", when = { minLevel = 30 },
      text = "You've the look of someone who's been places and been listened to. Perhaps Stormwind would listen to you, where it won't listen to me." },
    { id = "n_human", cat = "kin", when = { race = "Human" },
      text = "A subject of the crown! Then you'll understand the indignity of a town that pays its taxes and gets no soldiers for them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ambassador Berrybuck, of the Council of Darkshire. My office is to speak for this town to the House of Nobles, which I do, often and at length, and which they ignore with equal diligence." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I have a letter to finish." },
        { id = "h_again2", text = "Go on. The council's business can wait a moment." },
      },
      choices = {
        { text = "What do you ask Stormwind for?", next = "ask" },
        { text = "Who sits on the council?", next = "council" },
        { text = "Darkshire should look after itself.", next = "itself" },
        { text = "Good day, Ambassador.", next = "END" },
      },
    },
    ask = {
      lines = { { id = "a_default", text = "Soldiers, chiefly, and lamp oil, and a priest or two for the dead who won't stay buried. What we receive is a letter thanking us for our patience, and I have a drawer full of them." } },
      choices = {
        { text = "Why won't Stormwind send help?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Defias are closer to their gates than the worgen are, and the nobles fear for their own houses first. I don't say they're wrong to, only that Darkshire's houses burn just as well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    council = {
      lines = { { id = "c_default", text = "Lord Ello presides, of course, and Councilman Millstipe keeps the grievances, which he does with great passion. I carry them to the city, and Commander Ebonlocke tells us what the Watch needs, which is everything.", fx = { learn = { "night_watch" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    itself = {
      big = true,
      lines = { { id = "i_default", text = "It does, sir, every night, with lamps and a handful of farmers in the Watch's colours. But we are subjects of the crown and we pay its taxes, and a crown that takes and gives nothing is no crown worth the name." } },
      choices = {
        { text = "You're right. The crown owes you its protection.", next = "BACK", reply = "Thank you! Would you put that in writing? I'd attach it to my next letter.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Waiting on nobles won't save anyone. Act yourselves.", next = "BACK", reply = "We do act, but a council can't hold a sword, and I can only write letters.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a clerk in Stormwind once, and I came here to speak for Darkshire. I've been speaking ever since, and nobody's been listening." } },
    night_watch = { { id = "tp_nw", text = "Brave men and women, and far too few of them. The council pays them in lamp oil and gratitude." } },
    _none = { { id = "tp_none", text = "That's not a matter for the council, I'm afraid." } },
  },
}

-- Scott Carevin: a Carevin who sells mushrooms in Darkshire.
P:NPC {
  key = "scott_carevin", id = TODO_NPC("Scott Carevin"), name = "Scott Carevin", title = "Mushroom Seller", gender = "male",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "cheerful" }, values = { "practical" },
  notices = { "craft" },
  impression = {
    first = "He is the only one in town pleased by dark and damp.",
    third = "{name} met Scott Carevin, who sells mushrooms in Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "Mushrooms, fresh from the forest! Well, as fresh as anything is around here." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I knew you'd come round to mushrooms. Everyone does, eventually." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you'll know a good mushroom when you see one, and these are good ones, I promise you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Scott Carevin, and I sell the only thing that grows well in Duskwood, which is mushrooms. The forest's dark and it's wet, and the mushrooms love it." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a basket to sort." },
        { id = "h_again2", text = "Go on, then. Mushrooms don't mind waiting." },
      },
      choices = {
        { text = "Show me your mushrooms.", next = "BUSINESS" },
        { text = "Where do you pick them?", next = "pick" },
        { text = "Carevin? Are you kin to the hunters?", next = "kin" },
        { text = "How can you be so cheerful here?", next = "cheerful" },
        { text = "Good day.", next = "END" },
      },
    },
    pick = {
      lines = { { id = "p_default", text = "Wherever they grow, which is everywhere, though the best are near the graveyards, I'm sorry to say. I go out in the morning, when the worgen are sleeping, and I'm back by noon." } },
      choices = {
        { text = "Near the graveyards? Is that safe?", next = "safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Safe enough, in daylight, with the Watch nearby. The dead don't care much for mushrooms, as far as I can tell." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "We're all Carevins, aye, though I'm the one who sells mushrooms and leaves the hunting to the others. Somebody in the family has to do something that doesn't involve a crossbow.", fx = { learn = { "carevins" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cheerful = {
      big = true,
      lines = { { id = "c_default", text = "Because if I wasn't, I'd be like everyone else here, staring into the dark and waiting for something to come out of it. I'd rather sell mushrooms and smile." } },
      choices = {
        { text = "That's a good way to live.", next = "BACK", reply = "It's the only way I know. Thank you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Smiling won't keep the worgen away.", next = "BACK", reply = "No, but it keeps me from going mad, and that's something.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A Carevin, and a mushroom man. That's all there is to it." } },
    _none = { { id = "tp_none", text = "I only know mushrooms, I'm afraid. Ask me about mushrooms." } },
  },
}

-- Watcher Callahan: guards the road north of Darkshire, near the goblin trader's wagon.
P:NPC {
  key = "watcher_callahan", id = TODO_NPC("Watcher Callahan"), name = "Watcher Callahan", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "wry" }, values = { "dutiful" },
  notices = { "watch" },
  impression = {
    first = "He isn't sure whether he guards the road or the goblin.",
    third = "{name} met Watcher Callahan of the Night Watch, posted on the road north of Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "Halt, {class}, and state your business. Unless it's with the goblin, in which case go on, he's expecting you." },
    { id = "g_back", when = { metBefore = true }, text = "Back on this road? It's not much of a road, but it's mine." },
  },
  notice = {
    { id = "n_watch", cat = "watch", when = { minLevel = 20 },
      text = "You look like you can handle yourself. The road north gets worse past the bend, so keep your eyes open." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Callahan, Night Watch, posted on the north road. Commander Ebonlocke sent me to keep it clear, and somewhere along the way I became the goblin's guard as well." },
      },
      again = {
        { id = "h_again", text = "Anything else? The road's quiet, for now." },
        { id = "h_again2", text = "Go on. I've nowhere to be." },
      },
      choices = {
        { text = "Why guard the goblin?", next = "goblin" },
        { text = "What's on the road north?", next = "road" },
        { text = "Does the Watch pay well?", next = "pay" },
        { text = "Good day.", next = "END" },
      },
    },
    goblin = {
      lines = { { id = "g_goblin", text = "Because he sells things the town needs, and if the worgen eat him, nobody else will. He also pays a little for the trouble, which the Commander says I'm not to take, and which I'm not taking." } },
      choices = { { text = "Of course not. Something else.", next = "BACK" } },
    },
    road = {
      lines = { { id = "r_default", text = "Worgen in the woods, the odd gnoll from Redridge, and the dead from the graveyards when the night's dark. Nothing good, in short, and plenty of it.", fx = { learn = { "worgen" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pay = {
      big = true,
      lines = { { id = "p_default", text = "In lamp oil, mostly, and the knowledge that we're keeping Darkshire safe. Some nights that's enough, and some nights I wonder." } },
      choices = {
        { text = "Keeping folk safe is worth more than coin.", next = "BACK", reply = "It is, most nights. Thank you for reminding me.", fx = { align = { light = 1 } } },
        { text = "Then take the goblin's coin. You've earned it.", next = "BACK", reply = "Maybe I have, but the Commander wouldn't see it that way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A Darkshire farmer's son who joined the Watch when the farms went dark." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask the goblin; he claims to know everything." } },
  },
}

-- Watcher Brownell: a young watcher in Darkshire, fond of Watcher Backus.
P:NPC {
  key = "watcher_brownell", id = TODO_NPC("Watcher Brownell"), name = "Watcher Brownell", title = "The Night Watch", gender = "female",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "earnest" }, values = { "dutiful", "loyal" },
  notices = { "watch" },
  impression = {
    first = "She asks after Watcher Backus more often than duty strictly requires.",
    third = "{name} met Watcher Brownell, a young watcher of Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "Good evening, {class}. Have you come in from the west road? Did you see any of the Watch out there?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you happen to pass the western road?" },
  },
  notice = {
    { id = "n_watch", cat = "watch", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry a sword like you know how to use it. The Watch could use you, if you ever wanted to stay." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Brownell, of the Night Watch. I keep watch in town, though I've asked to be posted on the western road, and the Commander says I'm not ready yet." },
      },
      again = {
        { id = "h_again", text = "Anything else, {class}?" },
        { id = "h_again2", text = "Go on. I'm listening." },
      },
      choices = {
        { text = "Why the western road?", next = "west" },
        { text = "How long have you been in the Watch?", next = "long" },
        { text = "You're too young for this.", next = "young" },
        { text = "Good evening.", next = "END" },
      },
    },
    west = {
      lines = { { id = "w_default", text = "Because that's where the danger is, and that's where Watcher Backus is. He's the bravest man in the Watch, and he knows the road better than anyone." } },
      choices = {
        { text = "You admire Backus, then.", next = "backus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    backus = {
      lines = { { id = "b_default", text = "Everyone in the Watch admires him, and so do I. Not in any other way, mind; don't go telling him otherwise." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    long = {
      lines = { { id = "l_default", text = "A year, nearly, since my father's farm went dark. The Watch took me in, and I've been learning ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    young = {
      big = true,
      lines = { { id = "y_default", text = "I'm old enough to hold a lamp and a sword, and that's all the Watch needs. The worgen don't ask how old you are before they come for you." } },
      choices = {
        { text = "Fair enough. You've got courage.", next = "BACK", reply = "Thank you, {class}. I'll need it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Courage won't save you out there.", next = "BACK", reply = "Then what will? I'll take my chances.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A farmer's daughter who joined the Watch. That's most of us, really." } },
    _none = { { id = "tp_none", text = "I don't know, sorry. Ask Watcher Backus; he knows everything." } },
  },
}

-- Watcher Keefer: an old hand of the Night Watch in Darkshire.
P:NPC {
  key = "watcher_keefer", id = TODO_NPC("Watcher Keefer"), name = "Watcher Keefer", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "gruff" }, values = { "dutiful" },
  notices = { "watch" },
  impression = {
    first = "He has buried more friends than he cares to count.",
    third = "{name} met Watcher Keefer, an old hand of the Night Watch in Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "Another stranger in Darkshire. Keep your lamp lit and your blade close, {class}, and you might live to leave." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, then, and that's more than most can say." },
  },
  notice = {
    { id = "n_watch", cat = "watch", when = { class = "PRIEST" },
      text = "A priest. We could use you at the graveyard; there's more dead there than prayers to go round." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Keefer, Night Watch, and I've walked these streets since before the Commander took charge. I've seen the worst of what Duskwood has to offer, and it keeps finding new ways to surprise me." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Go on, then, but be quick about it." },
      },
      choices = {
        { text = "What's the worst you've seen?", next = "worst" },
        { text = "How many have you lost?", next = "lost" },
        { text = "You sound tired, Keefer.", next = "tired" },
        { text = "Good night.", next = "END" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "The dead walking out of Raven Hill, and the men I'd buried walking with them. You don't forget a face like that, not when you know it.", fx = { learn = { "raven_hill" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lost = {
      lines = { { id = "l_default", text = "Too many to count, and I've stopped counting. The Commander keeps the names; I just keep walking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tired = {
      big = true,
      lines = { { id = "t_default", text = "Tired, aye, but somebody's got to do it, and I'm still standing. The day I stop walking these streets is the day Darkshire falls." } },
      choices = {
        { text = "Then keep walking. Darkshire needs you.", next = "BACK", reply = "I will, and thank you for saying it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Darkshire should be abandoned. It's not worth dying for.", next = "BACK", reply = "Then you don't know Darkshire. Good night.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Night Watch since the day it was formed, and a farmer before that, though it feels like a long time ago." } },
    _none = { { id = "tp_none", text = "Don't know, and don't much care." } },
  },
}

-- Watcher Mocarski: guards the southern entrance to Darkshire.
P:NPC {
  key = "watcher_mocarski", id = TODO_NPC("Watcher Mocarski"), name = "Watcher Mocarski", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "nervous" }, values = { "dutiful" },
  notices = { "watch" },
  impression = {
    first = "Every sound from the trees startles him, and he holds his post.",
    third = "{name} met Watcher Mocarski, who guards Darkshire's southern entrance.",
  },
  greetings = {
    { id = "g_default", text = "Who's there? Oh, thank the Light, you're not a worgen. Come in, come in, quickly." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and in one piece! The woods didn't get you, then." },
  },
  notice = {
    { id = "n_watch", cat = "watch", when = { minLevel = 25 },
      text = "You look like you've seen worse than Duskwood. Have you? I'd love to hear that there's something worse." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Mocarski, south gate. Everything that comes up from the south road comes past me, and most of it has teeth." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm watching the trees, but I can listen." },
        { id = "h_again2", text = "Go on, I'm listening, only did you hear that just now? No? Then go on." },
      },
      choices = {
        { text = "What comes up the south road?", next = "south" },
        { text = "You seem nervous.", next = "nervous" },
        { text = "I'll keep watch with you a while.", next = "keep" },
        { text = "Good night.", next = "END" },
      },
    },
    south = {
      lines = { { id = "s_default", text = "Worgen, mostly, from the woods, and the odd traveller from Deadwind Pass who's gone a little strange. Nobody comes from the south who doesn't have a story." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nervous = {
      lines = { { id = "n_default", text = "Wouldn't you be? I've been on this gate for three months, and I've seen things I won't sleep through. But I'm still here, and I'm not going anywhere." } },
      choices = { { text = "That's brave of you. Something else.", next = "BACK" } },
    },
    keep = {
      big = true,
      lines = { { id = "k_default", text = "Would you? That's kind of you, {class}, truly. Most folk just hurry past me to get inside." } },
      choices = {
        { text = "Nobody should stand watch alone.", next = "BACK", reply = "Thank you. I'll sleep better tonight, I think.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Only a while. I've my own business.", next = "BACK", reply = "Of course. A while is more than I usually get.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A Darkshire boy who joined the Watch because there wasn't anything else to do." } },
    _none = { { id = "tp_none", text = "I don't know, sorry, and was that a worgen in the trees just now? No, it was nothing, good." } },
  },
}

-- Watcher Royce: a watcher with a sense of humour.
P:NPC {
  key = "watcher_royce", id = TODO_NPC("Watcher Royce"), name = "Watcher Royce", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "wry" }, values = { "loyal" },
  notices = { "watch" },
  impression = {
    first = "He jokes on watch because, he says, somebody has to.",
    third = "{name} met Watcher Royce, the Night Watch's joker.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Darkshire, where the nights are long and the days are longer! Mind the dead; they're grumpy." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You must like it here. Nobody likes it here." },
  },
  notice = {
    { id = "n_watch", cat = "watch", when = { race = "Gnome" },
      text = "A gnome! You're the perfect height for a Duskwood night; the worgen will look right over you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Royce, at your service, and the Night Watch's only comedian, by default. Somebody's got to keep spirits up around here, and it certainly isn't the spirits." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got a joke about a ghoul, if you're interested." },
        { id = "h_again2", text = "Go on, I'm all ears, unlike the worgen, who are mostly teeth." },
      },
      choices = {
        { text = "Tell me a joke.", next = "joke" },
        { text = "How can you joke in a place like this?", next = "how" },
        { text = "This is no laughing matter.", next = "matter" },
        { text = "Good day.", next = "END" },
      },
    },
    joke = {
      lines = { { id = "j_default", text = "Why don't the dead in Raven Hill ever win at cards? Because they've got no skin in the game, and Morbent Fel keeps the deck." } },
      choices = {
        { text = "That's terrible.", next = "BACK", reply = "Thank you! I've got worse." },
        { text = "Who's Morbent Fel?", next = "fel" },
      },
    },
    fel = {
      lines = { { id = "f_default", text = "A necromancer up at Raven Hill, and the reason the dead won't lie still. Less of a joke, that one, and more of a warning.", fx = { learn = { "morbent_fel" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    how = {
      lines = { { id = "h_how", text = "How can I not? If I stopped laughing, I'd start crying, and nobody wants a crying watcher." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    matter = {
      big = true,
      lines = { { id = "m_default", text = "No, it isn't, and I know that better than most. But a laugh keeps a man on his feet, and on his feet is where the Watch needs him." } },
      choices = {
        { text = "You're right. Laughter has its place.", next = "BACK", reply = "It does, and I'm glad you see it.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Discipline keeps a man on his feet, not jokes.", next = "BACK", reply = "Then you and the Commander would get along.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A Darkshire boy who joined the Watch and never stopped telling jokes." } },
    _none = { { id = "tp_none", text = "No idea, but if you find out, let me know; I could use the material." } },
  },
}

-- Watcher Hartin: a devout watcher in Darkshire.
P:NPC {
  key = "watcher_hartin", id = TODO_NPC("Watcher Hartin"), name = "Watcher Hartin", title = "The Night Watch", gender = "male",
  bible = "bibles/more_folk.md", role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "steady" }, values = { "devout", "dutiful" },
  notices = { "light" },
  impression = {
    first = "He believes the Light walks Darkshire's streets with the Watch.",
    third = "{name} met Watcher Hartin, a devout watcher of Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "The Light keep you, {class}. You've come to a dark place, but you're not alone in it." },
    { id = "g_back", when = { metBefore = true }, text = "The Light brought you back, I see. I'm glad of it." },
  },
  notice = {
    { id = "n_light", cat = "light", when = { class = { "PRIEST", "PALADIN" } },
      text = "One of the Light's own! I've prayed for someone like you to come to Darkshire, and here you are." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Watcher Hartin, of the Night Watch. I walk the streets and I pray, and between the two I think we keep the darkness back, a little." },
      },
      again = {
        { id = "h_again", text = "Anything else, {class}?" },
        { id = "h_again2", text = "Go on. The Light has time, and so do I." },
      },
      choices = {
        { text = "Does the Light really walk here?", next = "light" },
        { text = "What do you pray for?", next = "pray" },
        { text = "Prayers won't stop the worgen.", next = "worgen" },
        { text = "Good day.", next = "END" },
      },
    },
    light = {
      lines = { { id = "l_default", text = "It does, though you have to look for it. It's in every lamp the Watch lights, and every family that stays when they could leave.", fx = { learn = { "holy_light" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "p_default", text = "For the dead to rest, for the living to be safe, and for Stormwind to remember us. The first two I think the Light hears, and the last I'm not so sure." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worgen = {
      big = true,
      lines = { { id = "w_default", text = "No, but they steady the hand that holds the sword, and that's a start. A man who believes he's not alone fights harder than one who thinks he is." } },
      choices = {
        { text = "That's true. Faith gives strength.", next = "BACK", reply = "It does, {class}. The Light keep you.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Steel stops worgen. Prayer's just comfort.", next = "BACK", reply = "Then you'll need both, I think. I'll pray for you anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was meant for the Church, but the Watch needed me more." } },
    holy_light = { { id = "tp_hl", text = "It's here, even in Duskwood. You just have to carry it with you." } },
    _none = { { id = "tp_none", text = "I couldn't say. I'll pray on it." } },
  },
}
