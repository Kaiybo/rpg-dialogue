-- Stonard's trainers: Haromm the shaman, Ogromm and Grokor for hunters and their beasts, Kartosh the warlock. Voice: bibles/stonard_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "haromm", id = TODO_NPC("Haromm"), name = "Haromm",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "calm", "grave" }, values = { "wise", "dutiful" },
  notices = { "class", "race" },

  impression = {
    first = "Haromm trains shamans in Stonard, the only one who does on this side of the sea. He says the elements must be asked, never told, and he says it like someone who has seen what happens otherwise.",
    third = "{name} met Haromm, the shaman trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Peace, traveler. Speak softly here; the water is listening, and it has been sad a long time." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The spirits of this place remember you, and so do I." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "A shaman, come so far east. Sit, and let us hear what the swamp has to say to you." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Your totems are worn smooth at the grip. You use them often, and that is good, but you hold the earth totem too tightly, as if you expect it to run away." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the smell of the other place, warlock. The spirits shrink from it, and I think they are right to." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the Earth Mother. Your people taught mine much when we were young in this world again, and I have not forgotten it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Haromm, and I teach the shamans who come east, since there is no other teacher for them this side of the sea. The swamp is a hard classroom, but the water here has much to say, if one is patient enough to hear it grieve." },
        { id = "h_mastery", when = { class = "SHAMAN", minLevel = 50 },
          text = "You have grown strong, and there is one who has asked to see shamans of your wisdom. Bath'rah the Windwatcher waits in the hills east of Tarren Mill, and he will want a sample of each element before he speaks with you." },
        { id = "h_nonsham", when = { class = { "WARRIOR", "ROGUE", "MAGE", "PRIEST", "HUNTER", "DRUID", "PALADIN" } },
          text = "I teach only those the spirits have already chosen, and you are not one of them. Still, you may sit and listen, because listening harms no one." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The water is patient, and so am I." },
        { id = "h_again2", text = "Speak. I am listening." },
      },
      choices = {
        { text = "Teach me, Haromm.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "Why does the water grieve?", next = "water" },
        { text = "Who is Bath'rah?", next = "bathrah", when = { class = "SHAMAN", minLevel = 50 } },
        { text = "Must the elements always be asked?", next = "asked" },
        { text = "What troubles the spirits near the temple?", next = "temple" },
        { text = "Farewell, Haromm.", next = "END" },
      },
    },
    water = {
      lines = {
        { id = "wa_default", text = "Something was drowned here, long ago, a temple and the people who served in it. The water closed over them and never forgot, and you can feel it when the mist comes off the Pool of Tears." },
      },
      choices = {
        { text = "Then we should listen and honor it.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Grief is a waste. The water should let it go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    asked = {
      lines = {
        { id = "as_default", text = "Always. The elements are not slaves, and a shaman who forgets that soon finds they have stopped answering. I teach my students to whisper, because the ones who shout are the ones the spirits turn from first." },
      },
      choices = {
        { text = "Respect is the only way. I'll whisper.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Sometimes the elements need a firm hand.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bathrah = {
      lines = {
        { id = "ba_default", text = "A wise old troll who keeps watch over the winds in Alterac's foothills. Follow the river north from Tarren Mill until you find the ruins where he waits, and bring him air, fire, earth and water, to show him you are ready." },
      },
      choices = {
        { text = "Where do I find the elements?", next = "bathrah_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bathrah_where = {
      lines = {
        { id = "bw_default", text = "The elementals of the Arathi Highlands carry them, near the old stone circles. Take only what you need, and thank them for it, even as they fall." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    temple = {
      lines = {
        { id = "te_default", text = "The trolls who worship in that drowned place call on something that is not a spirit of this world, or not one I know. The earth there flinches when I come close, and I have learned not to come close." },
      },
      choices = {
        { text = "Then someone must go in and end it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Leave it drowned. Some doors stay shut.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I learned from those who learned from Thrall's own teachers, and now I teach. It is a long chain, and I try to be a good link in it." } },
    advice = { { id = "tp_ad", text = "Before you call on an element, ask whether it wishes to be called. You will know the answer." } },
    _none = { { id = "tp_none", text = "The spirits have not spoken to me of that. Perhaps they think it is not my business." } },
  },
}

P:NPC {
  key = "ogromm", id = TODO_NPC("Ogromm"), name = "Ogromm",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "curt", "gruff" }, values = { "practical", "proud" },
  notices = { "class", "pet" },

  impression = {
    first = "Ogromm trains hunters in Stonard and has nothing at all to say to anyone else. To a hunter he talks for as long as it takes, and most of it is about patience.",
    third = "{name} met Ogromm, the hunter trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Don't waste my time. If you're not a hunter, the inn's that way." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Good, then you can stay, and we can talk." },
    { id = "g_back", when = { metBefore = true, class = "HUNTER" }, text = "Back again. Let's see if you've learned to keep still yet." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "{pet} watches me the way a beast watches something it hasn't decided about. That's good; it means you haven't spoiled it." },
    { id = "n_troll", cat = "race", when = { class = "HUNTER", race = "Troll" },
      text = "A troll hunter. Your people hunted these swamps before mine ever came, so don't let me catch you making it look easy." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_nonhunter", when = { class = { "WARRIOR", "ROGUE", "MAGE", "PRIEST", "SHAMAN", "WARLOCK", "DRUID", "PALADIN" } },
          text = "I train hunters, and you're not one, so we haven't much to talk about. Ask your question if you must, but be quick about it." },
        { id = "h_default", key = true,
          text = "Ogromm. I teach hunters, and in this swamp I mostly teach them to stand still. Everything out there hears you coming before you see it, so the hunter who waits longest eats." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it short." },
        { id = "h_again2", text = "Speak, then. Quietly." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What's worth hunting out here?", next = "game" },
        { text = "How should a hunter hunt?", next = "way", when = { class = "HUNTER" } },
        { text = "Who teaches the beasts?", next = "grokor" },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    game = {
      lines = {
        { id = "ga_default", text = "Swamp jaguars, if you can see them, and the shadow panthers deeper in, which you mostly can't. Crocolisks on the shore are slow until they aren't, and the spiders are only worth it if you like spiders." },
      },
      choices = {
        { text = "How do you hunt a shadow panther?", next = "panther" },
        { text = "Something else.", next = "BACK" },
      },
    },
    panther = {
      lines = {
        { id = "pa_default", text = "You don't, mostly; it hunts you, and you let it think it's winning. Sit downwind by the water at dusk, still as a stump, and when it comes to drink, you'll get one shot, so make it count." },
        { id = "pa_hearts", when = { questObjective = { TODO_QUEST("Nothing But The Truth"), left = { min = 1 } } },
          text = "You want their hearts, I hear, for some dead apothecary in Duskwood. Sit downwind by the water at dusk and wait, and don't ask me what the hearts are for, because I don't want to know." },
      },
      choices = {
        { text = "Can you keep still that long, Ogromm?", next = "still" },
        { text = "Something else.", next = "BACK" },
      },
    },
    still = {
      lines = {
        { id = "st_default", text = "I once lay in the reeds a whole night with a leech on my neck, so the panther wouldn't see me move. Could you?" },
      },
      choices = {
        { text = "I could. The hunt is worth any discomfort.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd pull the leech and find another panther.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    way = {
      lines = {
        { id = "wy_default", text = "Patient, quiet, and fair to the prey. A hunter who kills what he doesn't need will find the swamp empty in a season, and then he's a hunter with nothing to do but complain." },
      },
      choices = {
        { text = "Take only what you need. That's the hunter's law.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The swamp's endless. I'll hunt as I please.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grokor = {
      lines = {
        { id = "gr_default", text = "Grokor, by the pens, and he talks more than I do, which isn't hard. He'll teach your beast what it can learn, and Hekkru will keep it alive afterward, and I'll teach you to deserve it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I hunted. Now I teach hunting. That's enough of a story." } },
    advice = { { id = "tp_ad", text = "Keep still. Then keep still longer." } },
    _none = { { id = "tp_none", text = "Don't know, and I won't guess. Ask someone who talks." } },
  },
}

P:NPC {
  key = "grokor", id = TODO_NPC("Grokor"), name = "Grokor",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "friendly", "chatty" }, values = { "kind", "curious" },
  notices = { "pet", "class" },

  impression = {
    first = "Grokor trains hunters' pets in Stonard and greets the beasts before he greets their owners. He's cheerful, talkative, and a little sad about every animal the swamp has taken.",
    third = "{name} met Grokor, the pet trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Ah, friend, I only help hunters and their pets, but you're welcome to stand and admire the beasts." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "You've come for training, to pass it on to your pet? Good, good, let me see who you've brought." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "And who's this? Hello, {pet}, hello. Yes, you're very handsome, and you know it." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet}'s growl is good and deep, but it's lazy on the second note. We can work on that, the two of us, if your hunter will be patient." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER", ["not"] = { pet = true } },
      text = "A hunter with no beast at your side? Either it's in the stables or something's gone wrong, and I hope it's the stables." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grokor, and I train the beasts that hunters bring me, which is the best work in Stonard and I'll argue with anyone who says otherwise. A pet learns faster than its hunter, if you're kind to it, and slower than a stone if you're not." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The beasts don't mind waiting, but I do." },
        { id = "h_again2", text = "Ask, ask. I love questions about beasts." },
      },
      choices = {
        { text = "Train my pet.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What can a pet learn from you?", next = "learn" },
        { text = "What beasts in the swamp are worth taming?", next = "tame", when = { class = "HUNTER" } },
        { text = "How should a hunter treat a pet?", next = "treat" },
        { text = "Do Ogromm and Hekkru help you?", next = "neighbors" },
        { text = "Goodbye, Grokor.", next = "END" },
      },
    },
    learn = {
      lines = {
        { id = "le_default", text = "To growl, so the enemy looks at it and not at you, and to shrug off frost and fire and the like. The rest they learn in the wild, from the beasts you tame, and that's the real school, out there in the reeds." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tame = {
      lines = {
        { id = "ta_default", text = "A shadow panther, if you can find one before it finds you, because it'll teach your other beasts a thing or two about moving quiet. The crocolisks bite hard and know it, and they make a stubborn, loyal pet if you've the patience." },
      },
      choices = {
        { text = "A pet should be strong. That's what matters.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "A pet should be a friend first.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    treat = {
      lines = {
        { id = "tr_default", text = "Like a friend who happens to have very sharp teeth. Feed it before you feed yourself, let it rest when it's hurt, and never, ever leave it behind in the swamp, because they wait, you know, longer than anyone should." },
      },
      choices = {
        { text = "A friend is never abandoned. Never.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Sometimes a hunter has to move on.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "You sound like you've seen it happen.", next = "waiting" },
      },
    },
    waiting = {
      lines = {
        { id = "wa_default", text = "Too often. Hekkru has a cat in his back pen that's been waiting for its troll for two winters, and every time I pass, it looks up to see if I'm him. I bring it a scrap, and it eats, and then it goes back to watching the gate." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbors = {
      lines = {
        { id = "ne_default", text = "Ogromm teaches the hunters, and he says about ten words a day, so I say the rest for him. Hekkru keeps the beasts alive, and he's softer than he looks, but don't tell him I told you, because he'll growl at me for a week." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've trained beasts since I could walk, and I'll train them till I can't." } },
    advice = { { id = "tp_ad", text = "Talk to your pet. It doesn't understand the words, but it understands that you're talking." } },
    _none = { { id = "tp_none", text = "I don't know about that, friend. Ask me about beasts instead." } },
  },
}

P:NPC {
  key = "kartosh", id = TODO_NPC("Kartosh"), name = "Kartosh",
  bible = "bibles/stonard_trainers.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "cold", "measured" }, values = { "ambitious", "dutiful" },
  notices = { "class", "race" },

  impression = {
    first = "Kartosh trains warlocks in Stonard, and he weighs every visitor like a sum. He keeps to the Warchief's rules about the fel, and he wants that noticed.",
    third = "{name} met Kartosh, the warlock trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Your will is not strong enough to manipulate the forces we control, {class}. Speak, if you must, but do not touch anything." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "You know enough to be dangerous, {name}, but you still look like you need training to me." },
    { id = "g_back", when = { metBefore = true, class = "WARLOCK" }, text = "Back again, and your demon is still on its leash. Good." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your imp has scorched the hem of your robe, and you've let it. Never let them take liberties, even small ones, because they remember every one." },
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "You glow, and it stings the eyes. Stand further back, if you please; the circles here do not like the Light." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge", class = "WARLOCK" },
      text = "A Forsaken warlock. Your Dark Lady's people have a feel for this work, I'm told, and less to lose to it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kartosh. I train warlocks, under the Warchief's terms and the Warchief's eye, and I keep both in mind at every lesson. Stonard is near enough to the Blasted Lands that the fel is never far, which makes it a good place to learn and a bad place to grow careless." },
      },
      again = {
        { id = "h_again", text = "Is there more? Be precise." },
        { id = "h_again2", text = "Ask. I will answer what is useful." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What are the Warchief's terms?", next = "terms" },
        { text = "Why learn so near the Blasted Lands?", next = "portal" },
        { text = "Do you know Fel'zerul?", next = "felzerul" },
        { text = "Did warlocks walk Stonard in the old days?", next = "old" },
        { text = "I'll go.", next = "END" },
      },
    },
    terms = {
      lines = {
        { id = "te_default", text = "That we serve the Horde, and nothing else, and that no demon is ever master of the one who called it. The old Horde forgot that, and drank, and you know how that ended, so we do not forget." },
      },
      choices = {
        { text = "Rules keep the fel in its place. They're wise.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Rules are for the weak. Power answers to the strong.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    portal = {
      lines = {
        { id = "po_default", text = "Because the demons that still wander out there are real, and a student who has faced one learns faster than one who has only read about them. It is dangerous, of course, and that is the lesson." },
      },
      choices = {
        { text = "Danger teaches respect. It's the right way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Danger teaches power. That's what I want.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    felzerul = {
      lines = {
        { id = "fe_default", text = "Of course. The Warchief sent him to watch the sunken temple, and he does it well, and he keeps to the line more strictly than I do. Greshka thinks him a fool for it, which tells you more about Greshka than about Fel'zerul." },
      },
      choices = {
        { text = "What about Greshka?", next = "greshka" },
        { text = "Something else.", next = "BACK" },
      },
    },
    greshka = {
      lines = {
        { id = "gr_default", text = "She sells grimoires and she wants more than that, and she has not decided yet how much she is willing to pay for it. I watch her, and she knows I watch her, and that is the arrangement." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    old = {
      lines = {
        { id = "ol_default", text = "When the old Horde built this place, there were warlocks in every hall, and they were not teachers; they were masters, and the clans were their tools. I teach in the same stones, and I remind myself of that every morning before the first student comes." },
      },
      choices = {
        { text = "Then the stones keep you honest. Good.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "The old masters had real power. That's worth studying.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I learned this art in the camps, and I kept it when the Warchief allowed it. That is all you need to know." } },
    advice = { { id = "tp_ad", text = "Never let your demon take a liberty, however small. It will remember." } },
    _none = { { id = "tp_none", text = "That is not my concern, and I suspect it is not yours either." } },
  },
}
