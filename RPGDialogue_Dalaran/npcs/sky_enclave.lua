-- The skycutter landing and the Sky Enclave at Dalaran's north end: Arcanist Laurain, Denaaris Stargale,
-- Belanaa Windveil and Alfina Nightgaze. Voice: bibles/dalaran.md
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dal_laurain", id = TODO_NPC("Arcanist Laurain"), name = "Arcanist Laurain",
  bible = "bibles/dalaran.md", role = "scholar", tier = "quest",
  communities = { "dalaran", "kirin_tor" }, temper = { "nervous", "chatty" }, values = { "kind", "dutiful" },
  notices = { "class", "skyborne" },

  impression = {
    first = "Arcanist Laurain welcomes everyone off the skycutter with a cheerful speech about exits and a laugh that doesn't quite believe itself. She is kinder than she is calm, and she knows it.",
    third = "{name} met Arcanist Laurain, who greets travellers at Dalaran's skycutter landing.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Dalaran! Mind the scaffolding, please." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again! Nothing's exploded since you were last here, so that's nice." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Oh! Um. Hello. Welcome, I suppose, if you're expected?" },
    { id = "g_away", when = { away = 14 }, text = "Oh, you're back after {away} away, and nothing has exploded in all that time, which is the official line and also mostly true!" },
    { id = "g_word_angered", when = { word = "angered" }, text = "Oh dear, someone in the city is rather upset after speaking with you, and I'm only the greeter, so I'll just say welcome and smile very hard." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! If anyone comes off the next skycutter green in the face, would you see to them? The Light is gentler than my bucket." },
    { id = "n_skyborne", cat = "skyborne", when = { race = "Skyborne" },
      text = "Did you come over on the skycutter? Was it bumpy? It's always bumpy, and I tell everyone to hold on, and nobody ever does." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Eek! Oh, it's only you. Please don't do that near the landing; I nearly fell off it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Welcome to Dalaran, {class}! Pay no mind to the building work, and should anything glowing and angry come round a corner, find a magus first and the way out second, at a sensible walk." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Welcome down from Zephras! Take a moment to find your feet; they always seem to arrive a little after the rest of you." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're... Horde. Is someone expecting you? No, don't answer that; just keep to the main streets and I'll pretend I've seen nothing at all." },
        { id = "h_helped", when = { questDone = TODO_QUEST("Friend of the Kirin Tor") },
          text = "You're the one who went up through the sewers! Everyone at the landing has been talking about it, which is to say, me, to the skycutter crew." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage! You'll know what I mean about the anomalies, then. They're mostly harmless now, mostly, and I'm sure the last one was an accident." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "Oh, good, someone with a sword. Not that we need one, of course, everything's perfectly fine, but it's nice to have one about." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "That's... a demon, isn't it? Is it yours? It's yours. Please keep it close; I've a list of procedures for demons, and none of them are pleasant." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've time until the next skycutter comes in, and I'd much rather talk than watch the sky." },
        { id = "h_again2", text = "Go on, ask away. Visitors are the best part of this post." },
      },
      choices = {
        { text = "What's the skycutter?", next = "skycutter" },
        { text = "What kind of trouble should I expect here?", next = "trouble" },
        { text = "Is the city really safe?", next = "safe" },
        { text = "How long have you kept this post?", next = "post" },
        { text = "Can I ride that ship home to Valanaar?", next = "xhome", when = { race = "Skyborne" } },
        { text = "You laughed just now. Is it really that bad?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does a Horde visitor frighten you, Arcanist?", next = "xhorde", when = { faction = "Horde" } },
        { text = "Thank you, Arcanist.", next = "END" },
      },
    },

    skycutter = {
      lines = {
        { id = "sc_default", key = true, text = "It's the ship that runs between this landing and Valanaar on Zephras Isle, which is up in Skywall, in the Plane of Air, if you can believe it. Archmage Ansirem worked a long while to make the crossing steady, and steady is a generous word for it." },
      },
      choices = {
        { text = "Can anyone ride it?", next = "skycutter_any" },
        { text = "Something else.", next = "BACK" },
      },
    },
    skycutter_any = {
      lines = {
        { id = "sa_default", text = "Anyone at all, though it's mostly Skyborne coming and going and the odd scholar who wanted to see the sky from the wrong side. Hold on to something, is my advice, and don't look down while you're between the planes." },
      },
      choices = {
        { text = "What's it like, between the planes?", next = "skycutter_between" },
        { text = "Something else.", next = "BACK" },
      },
    },
    skycutter_between = {
      lines = {
        { id = "sb_default", text = "I wouldn't know; I've never been! I've seen what people look like when they come off, though, and it's the face you make when a stair isn't where you thought it was, except for an hour." },
      },
      choices = {
        { text = "I'll be sure to hold on.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    trouble = {
      lines = {
        { id = "tr_default", text = "Anomalies, mostly, little knots of loose magic that wandered off from the Citadel and got into things. We had worse in the bad days, demons and so on, and I'm told that's all finished, but I keep the list of exits memorized anyway." },
      },
      choices = {
        { text = "And if one comes at you?", next = "trouble2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble2 = {
      lines = {
        { id = "t2_default", text = "I scream, quite loudly and very professionally, and then a magus comes. It has worked every time so far, though I'd rather not keep testing it." },
      },
      choices = {
        { text = "Next time, shout for me as well.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    safe = {
      big = true,
      lines = {
        { id = "sf_default", text = "Archmage Modera says it is, and the guards say it is, and I say it is too, because that's my job. Between us, I still flinch whenever the lamps flicker." },
        { id = "sf_after", when = { killed = { name = "Shade of the Archmage", min = 1 } },
          text = "It is now, I think, truly! The lamps haven't flickered since whatever was in the Citadel stopped, and I've only flinched twice this week." },
      },
      choices = {
        { text = "Courage is flinching and staying anyway. You're doing fine.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If you're that frightened, find a quieter post.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    post = {
      lines = {
        { id = "po_default", text = "Only since the dome came down, so not long. They wanted someone cheerful at the landing, and I am cheerful, mostly, whenever the ship comes in on time." },
      },
      choices = {
        { text = "Are you a magus of the Kirin Tor?", next = "post_rank" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_rank = {
      lines = {
        { id = "pr_default", text = "An arcanist, which is one rung below the people who are allowed to argue with archmagi. I hope to climb another rung before I'm old, if the city stays in one piece that long." },
      },
      choices = {
        { text = "You'll get there.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xhome = {
      lines = {
        { id = "xh_default", text = "Of course! It goes back to Valanaar whenever it comes in. Though everyone I've seen step off it looks as if they've no intention of going back soon, so you'd be the first." },
      },
      choices = {
        { text = "There's not much left to go back to.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xm_default", text = "Oh, that? That's just how I laugh when the honest answer is 'a little'. The Citadel's calmer than it was, and the anomalies are fewer, and I'm sure the scorch on the landing was there before." },
      },
      choices = {
        { text = "What anomalies, exactly?", next = "trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhorde = {
      big = true,
      lines = {
        { id = "xho_default", text = "A little, I admit, though Archmage Modera says you're here at her leave. I'm trying very hard to be welcoming, and I'd appreciate it if you didn't make that difficult." },
      },
      choices = {
        { text = "I'm here to help. You've nothing to fear from me.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Fear's healthy, Arcanist. Keep it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the landing, the ship and the way to every exit, and a little gossip besides. What would you like?" } },
    advice = { { id = "tp_ad", text = "Walk, don't run, and always know where the nearest magus is. That's the whole of the procedure, really." } },
    _none = { { id = "tp_none", text = "Oh, I couldn't say! Try one of the magi in the Citadel; they know everything, or say they do." } },
  },
}

P:NPC {
  key = "dal_denaaris", id = TODO_NPC("Denaaris Stargale"), name = "Denaaris Stargale",
  bible = "bibles/dalaran.md", role = "citizen", tier = "quest",
  communities = { "dalaran", "high_order" }, temper = { "steady" }, values = { "loyal", "kind" },
  notices = { "skyborne" },

  impression = {
    first = "Denaaris Stargale minds the Skyborne portal to Stormwind with the patience of a man who has counted every flagstone in the floor twice. He is homesick and too courteous to say so unless asked.",
    third = "{name} met Denaaris Stargale of the High Order, who keeps the Skyborne portal to Stormwind in Dalaran's Sky Enclave.",
  },

  greetings = {
    { id = "g_default", text = "Wind's greetings, friend." },
    { id = "g_skyborne", when = { race = "Skyborne" }, text = "Winds be with you, {g:kinsman|kinswoman}. Stormwind is only a step away." },
  },

  notice = {
    { id = "n_skyborne", cat = "skyborne", when = { race = "Skyborne", band = { "Greenhorn", "Blooded" } },
      text = "You've the look of someone fresh off the skycutter. Sit a moment if your legs are still somewhere over Skywall; everyone's are, the first time." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wind's greetings, friend. This portal goes to Stormwind, though I'm only permitted to send our own people through it, so if you aren't shen'dorei, I'm afraid the road is yours." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Wind's greetings! The portal behind me goes straight to Stormwind whenever you need it, and between you and me, it's a great deal warmer there than in these mountains." },
        { id = "h_arrived", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Magical City of Dalaran"), days = 3 } },
          text = "You made the crossing, and in one piece! Welcome to Dalaran, and welcome to Azeroth, which I'm told is the proper way to put it." },
        { id = "h_welcome", when = { questActive = TODO_QUEST("Welcome to Azeroth") },
          text = "Go on, then, Azeroth is waiting, and it's larger than every isle we ever had put together." },
        { id = "h_human", when = { race = "Human" },
          text = "Wind's greetings. You're from Stormwind, perhaps? I'd ask you a hundred questions about it, if I didn't think it would be rude." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've nowhere to be but here." },
      },
      choices = {
        { text = "Why only Skyborne through the portal?", next = "only" },
        { text = "What's this part of the city?", next = "enclave" },
        { text = "What did you make of Stormwind?", next = "stormwind" },
        { text = "Do you miss Zephras?", next = "xmiss", when = { race = "Skyborne" } },
        { text = "I'm from Stormwind, as it happens.", next = "xhuman", when = { race = "Human" } },
        { text = "Winds be with you.", next = "END" },
      },
    },

    only = {
      lines = {
        { id = "on_default", text = "The Kirin Tor were generous to open a door for us at all, and they asked that it stay a door for the High Order and not a public road. I don't argue with the people holding up the roof I sleep under." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    enclave = {
      lines = {
        { id = "en_default", key = true, text = "The Sky Enclave, the corner of Dalaran the Kirin Tor set aside for the High Order. Belanaa takes in cloth for our people, Alfina teaches our druids, and the cats wander through as if they signed the agreement." },
      },
      choices = {
        { text = "Who's Alfina?", next = "alfina" },
        { text = "Why do your people need cloth?", next = "cloth" },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    alfina = {
      lines = {
        { id = "al_default", text = "A night elf, if you can imagine, a druid teaching in the Kirin Tor's city. Our druids are few, and the ones we have lean toward the winds before the moon, so she has her hands full with them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cloth = {
      lines = {
        { id = "cl_default", text = "Because we came down from Skywall with what we could carry, and these mountains are colder than any wind on Zephras. Belanaa can tell you better than I can; it's her charge." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    stormwind = {
      big = true,
      lines = {
        { id = "sw_default", text = "Grey stone, enormous walls, and more people in one market than lived in all of Valanaar. They stared at us at first, and then a crier started calling us friends of the Kirin Tor, and they stared a little more politely." },
      },
      choices = {
        { text = "Give them time. Most folk are kind underneath.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them stare. Respect is earned, not handed out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xmiss = {
      big = true,
      lines = {
        { id = "xm_default", text = "Every hour, and I'd not go back if the ship were free and the winds were kind. There's nothing there that isn't drifting away from everything else, and here, at least, the ground stays where you left it." },
      },
      choices = {
        { text = "Zephras can still be saved. I believe that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let it go. Our future is down here now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xhu_default", text = "Then tell me, are the bakers by the canal as good as they smell? I've passed them twice, and both times I was too shy to buy anything." },
      },
      choices = {
        { text = "Better. Buy the honey bread next time.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    two_orders = { { id = "tp_orders", text = "Our cousins chose the Horde and the old spirits; we chose the Alliance and the arcane. I'd rather not say more than that in a city that's been kind to us." } },
    _none = { { id = "tp_none", text = "I'm afraid I've only been on Azeroth a little while. Ask one of the Kirin Tor." } },
  },
}

P:NPC {
  key = "dal_belanaa", id = TODO_NPC("Belanaa Windveil"), name = "Belanaa Windveil", title = "High Order Cloth Quartermaster",
  bible = "bibles/dalaran.md", role = "questgiver", tier = "service",
  communities = { "dalaran", "high_order" }, temper = { "steady" }, values = { "dutiful", "kind" },
  notices = { "skyborne" },

  impression = {
    first = "Belanaa Windveil gathers cloth for the High Order and thanks people for it as if each bolt were a personal favour, though her fingers are already testing the weave while she does. She is careful not to say much about her people's crafts to outsiders.",
    third = "{name} met Belanaa Windveil, who collects cloth for the High Order in Dalaran's Sky Enclave.",
  },

  greetings = {
    { id = "g_default", text = "Have you any cloth to spare for the High Order?" },
    { id = "g_skyborne", when = { race = "Skyborne" }, text = "Winds be with you. Come to help clothe our people?" },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and I remember your last bundle, so I hope this one's been kept out of the rain." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "You've a tailor's hands, I can see the needle calluses from here. Come in, but please don't judge my seams, for I sew them in a hurry these days." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Belanaa Windveil, and I act for the High Order here on Azeroth, in matters of cloth at least. If you've any to give, we'd be most grateful, and I promise every thread of it will be looked over properly." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Winds be with you. Every bolt you bring me becomes a cloak for someone still learning what snow is, so bring what you can." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "You're a mage, so perhaps you can tell me why the Kirin Tor dye every curtain in this city the same violet. I've asked three of them, and each gave me a lecture instead of an answer." },
      },
      again = {
        { id = "h_again", text = "Anything else I can tell you?" },
        { id = "h_again2", text = "Go on, I'm listening, though I'll keep sorting while you talk, if you don't mind." },
        { id = "h_again3", text = "What else? This wool won't grade itself, more's the pity." },
      },
      choices = {
        { text = "Why does the High Order need cloth?", next = "why" },
        { text = "Does clothcraft matter to your people?", next = "craft" },
        { text = "What happens to the cloth once I give it?", next = "sorting" },
        { text = "What do you make of Dalaran?", next = "violet" },
        { text = "How are our people faring down here?", next = "kin", when = { race = "Skyborne" } },
        { text = "I'm a tailor. Could I learn a Skyborne stitch?", next = "stitch", when = { profession = "Tailoring" } },
        { text = "I have cloth for you.", next = "BUSINESS" },
        { text = "Winds be with you.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "wy_default", text = "Because we came down from Skywall with what we could carry, and Azeroth's mountains are colder than any wind on Zephras. Every bolt goes to someone who needs it before the next snow." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    craft = {
      lines = {
        { id = "cr_default", text = "It does, though I'm careful not to make too much of it to outsiders. Our weavers kept the old patterns alive through every drift of the isles, and I'd like them to have something worth weaving down here." },
      },
      choices = {
        { text = "I hope they do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sorting = {
      lines = {
        { id = "so_default", text = "Every bundle is opened, shaken out and graded by hand, because a cloak is only as warm as its worst thread. Linen goes to wraps for the children, wool to cloaks, and silk I set aside for our weavers, who can do things with it I won't describe to you." },
      },
      choices = {
        { text = "Graded? You sound particular.", next = "sorting_fussy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sorting_fussy = {
      lines = {
        { id = "sf_default", text = "Particular is a kind word for it, and my own cousin uses a less kind one. I've unpicked whole hems that came to me stitched by someone in a hurry, because a seam that gives way in the first snow is worse than no seam at all." },
      },
      choices = {
        { text = "Don't people mind you unpicking their work?", next = "sorting_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sorting_ask = {
      lines = {
        { id = "sk_default", text = "They never see it, so they never mind. May I ask where your cloth tends to come from, though? Some of it reaches me with stains I'd rather not explain to a weaver." },
      },
      choices = {
        { text = "From those I've fought. They had no further use for it.", next = "sk_fought", fx = { trait = { practical = 1 } } },
        { text = "I bought it honestly, at market.", next = "sk_bought", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "Better you don't ask, I think.", next = "sk_secret", fx = { trait = { discreet = 1 } } },
      },
    },
    sk_fought = {
      lines = {
        { id = "skf_default", text = "Then I'll scrub it twice and say nothing to the weavers, and the cloak won't know the difference. Still, I'd thank you to bring me less of the bloodied kind when you can manage it." },
      },
      choices = { { text = "I'll do what I can.", next = "BACK" } },
    },
    sk_bought = {
      lines = {
        { id = "skb_default", text = "Then you've paid for it twice, once at market and once by giving it away, and I'm grateful for both. I'll mark your name in the ledger beside the clean bundles, which is a very short list." },
      },
      choices = { { text = "Something else, Belanaa.", next = "BACK" } },
    },
    sk_secret = {
      lines = {
        { id = "sks_default", text = "Then I won't, and the snow won't ask either. I've learned a kind of tact on Azeroth, and I'm told it's mostly a matter of not looking too closely at a gift." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    violet = {
      lines = {
        { id = "vi_default", text = "It's a kind city to us, and I'd never say otherwise to the Kirin Tor's faces. But they dye every curtain, banner and robe the same violet, and after a month of it I've started to dream in purple." },
      },
      choices = {
        { text = "What's wrong with violet?", next = "violet_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    violet_why = {
      big = true,
      lines = {
        { id = "vw_default", text = "Nothing at all, in its place. At home a weaver chose a colour for the sky it would be worn under, pale for the high winds and dark for the storms, and here it seems colour is chosen so everyone knows who owns the building." },
      },
      choices = {
        { text = "A city should show who keeps it. That's only right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Colour should belong to the wearer, not the council.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = {
        { id = "ki_default", text = "Better than when we first came down, and worse than I'd like. The young ones love the snow until their fingers go numb, and the elders ask me every day whether the isles have settled, which is not a question cloth can answer." },
      },
      choices = {
        { text = "Then we'll keep them warm in the meantime.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stitch = {
      lines = {
        { id = "st_default", text = "I'm afraid not, though it's kind of you to ask so nicely. The old patterns belong to the weavers who keep them, and I'd sooner give away my own cloak than one of their stitches." },
      },
      choices = {
        { text = "I understand. A craft is its keepers' to share.", next = "BACK", fx = { affinity = 1 } },
        { text = "Not even one small stitch?", next = "stitch_push" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stitch_push = {
      lines = {
        { id = "sp_default", text = "Well, there's one every Skyborne child learns, a double turn at the hem so the wind can't get under it, and you'd have worked it out yourself within a week. That's all you'll have from me, and you didn't hear it here." },
      },
      choices = { { text = "My lips are sealed, Belanaa.", next = "BACK" } },
    },
  },

  topics = {
    two_orders = { { id = "tp_orders", text = "I keep the High Order's accounts, not its quarrels. Ask someone with a louder voice than mine." } },
    _none = { { id = "tp_none", text = "Forgive me, I only know cloth and the people who need it, and I'd rather not guess at the rest in a city where everyone else knows everything." } },
  },
}

P:NPC {
  key = "dal_alfina", id = TODO_NPC("Alfina Nightgaze"), name = "Alfina Nightgaze", title = "Druid Trainer",
  bible = "bibles/dalaran.md", role = "trainer", tier = "quest",
  communities = { "dalaran", "kirin_tor" }, temper = { "steady", "sharp" }, values = { "learned", "wary" },
  notices = { "class", "arcane" },

  impression = {
    first = "Alfina Nightgaze teaches druids in a city of mages and makes no secret that the place unsettles her. She watches the Kirin Tor's magic the way a farmer watches a river in flood.",
    third = "{name} met Alfina Nightgaze, a night elf druid who teaches in Dalaran's Sky Enclave.",
  },

  greetings = {
    { id = "g_default", text = "Wondrous, isn't it? It sets my teeth on edge." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A druid among the towers! Come, stand with me a moment." },
    { id = "g_nightelf", when = { race = "NightElf" }, text = "Ishnu-alah. You're a long way from the great tree." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You'll forgive me if I keep an eye on your hands near my seedlings, magus. This city has made me nervous of spellwork." },
    { id = "n_druid", cat = "class", when = { class = "DRUID", race = "Skyborne" },
      text = "One of my Skyborne pupils, or soon to be. You pray to the winds before the moon, I know, and I've stopped trying to change that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "This city is a wonder, and I'll admit it unsettles me. My people once gathered too much magic in one place, and the sea still sits where our capital used to be." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, here among the towers! Sit with me a moment, {class}, and let's both remember what living ground feels like." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "Ishnu-alah. Yes, I'm a long way from Darnassus, and no, I can't quite explain how I came to be teaching in a city of mages." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Welcome. Your druids are few, and I teach every one of them who'll come, so if you've the calling, you know where to find me." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. You tend the wound and I tend the soil under it; between us, perhaps this valley mends someday." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, in the Sky Enclave. I've no quarrel with you here, so long as you leave the plants where they grow." },
      },
      again = { { id = "h_again", text = "What else? I've seedlings to see to, but they're patient." } },
      choices = {
        { text = "Why would a druid teach in Dalaran?", next = "why" },
        { text = "What does all this magic do to the land?", next = "land" },
        { text = "The Skyborne have druids?", next = "skydruids" },
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Does Darnassus know you're here?", next = "xnightelf", when = { race = "NightElf" } },
        { text = "Do my spells trouble you?", next = "xmage", when = { class = "MAGE" } },
        { text = "Elune keep you.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because the Skyborne asked for a teacher, and there are few enough druids willing to live inside a mage's city. Someone has to remind these towers that there's soil underneath them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    land = {
      lines = {
        { id = "la_default", text = "It drinks it in, the way a field drinks floodwater, until there's too much and things grow that shouldn't. I've seen the blossoms in the Kirin Tor's central garden lately, and I don't like their colour." },
      },
      choices = {
        { text = "What colour?", next = "garden" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garden = {
      big = true,
      lines = {
        { id = "ga_default", key = true, text = "Green, but the wrong green, the sickly kind any Sentinel who's walked Felwood would know on sight. The Kirin Tor say their garden is under control, and the Kirin Tor say a great many things." },
        { id = "ga_sample", when = { questDone = TODO_QUEST("A Green Sample") },
          text = "You've seen it yourself, then, if you cut a blossom from it. Felwood's green, in a mage's garden, and they call it botany." },
      },
      choices = {
        { text = "Cleanse it. Even tainted ground can heal.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burn it out before it spreads.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    skydruids = {
      lines = {
        { id = "sd_default", text = "A handful, and more each season. They honour the winds first and Elune hardly at all, and I've decided that's between them and the Dream, not between them and me." },
      },
      choices = {
        { text = "That's generous of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xnightelf = {
      lines = {
        { id = "xn_default", text = "Darnassus knows, and Darnassus sighed, which is how our elders say yes. I said the Cenarion Circle ought to know what the Skyborne druids are learning, and somehow that made me the one sent to find out." },
      },
      choices = {
        { text = "That's usually how it goes.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xm_default", text = "Your spells don't, but your certainty might. Every mage I've met here believes the power will always do what it's told, and my people believed that too, once." },
      },
      choices = {
        { text = "You're right. I'll respect the limits.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear of power never built anything worth having.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The Circle keeps the balance where it can, and it would like to know what grows in a city like this one." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask the trees, if you can find one here." } },
  },
}
