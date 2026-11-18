-- Sun Rock Retreat's service folk: Tharm the wind rider master, Gereck at the stables, Kulwia with trade supplies. Voice: bibles/sunrock_folk.md
-- Classic roster names from memory (TODO_NPC until captured). Nothing after Year 1.
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Tharm: orc wind rider master on the rock.
---------------------------------------------------------------------------
P:NPC {
  key = "stn_tharm", id = TODO_NPC("Tharm"), name = "Tharm", title = "Wind Rider Master",
  bible = "bibles/sunrock_folk.md", role = "flightmaster", tier = "service",
  communities = { "sun_rock" }, temper = { "gruff", "proud" }, values = { "loyal", "practical" },
  notices = { "race", "weary" },
  impression = {
    first = "Tharm keeps the wind riders on Sun Rock and talks about the wild wyverns on the ridges as if they were rivals he means to beat. He is gruff with people and patient with beasts, and he does not pretend otherwise.",
    third = "{name} met Tharm, the orc who keeps the wind riders at Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_default", text = "Mind the tails, {class}, because the riders on this rock sting first and apologize never. Where are you bound?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. The riders remember you, so they'll only hiss a little." },
    { id = "g_word_brave", when = { word = "brave" }, text = "The braves say you went where most wouldn't. Good, because a wind rider can smell fear on a passenger, and you won't give them any." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Stand downwind of the riders a moment, Forsaken, and let them get used to you. They know the smell of carrion, and they keep trying to decide whether you're a meal." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look like the harpies had a go at you on the way up. Get your armor seen to before you fly, because a rider banks hard over the ridges and loose straps come undone." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Tharm, and I keep the wind riders on Sun Rock. They'll carry you to Thunder Bluff or down to the Crossroads faster than any kodo, and they'll only try to bite you once." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Another orc, and a long way from Durotar. I'm Tharm, and I keep the wind riders here, because the tauren are fine people but they fly like they're apologizing to the sky." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Welcome, child of the Earth Mother, and don't take what I say about tauren riders to heart. I'm Tharm, and I keep the wind riders on this rock for the Horde." },
      },
      again = {
        { id = "h_again", text = "What else? The riders are fed, so I've got a moment." },
        { id = "h_again2", text = "Ask, then, but stand clear of that one on the end; she's in a mood." },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Where do your wind riders come from?", next = "wild" },
        { text = "Do the harpies trouble your riders?", next = "harpies" },
        { text = "What's an orc doing this far into tauren country?", next = "orc" },
        { text = "How do you keep your beast from fighting the riders?", next = "hunter", when = { class = "HUNTER" } },
        { text = "The winds over these ridges feel restless, Tharm.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Will your riders carry me, given what I am?", next = "dead", when = { race = "Scourge" } },
        { text = "Safe winds, Tharm.", next = "END" },
      },
    },

    wild = {
      lines = {
        { id = "wi_default", text = "From these very mountains, some of them. There are wild wyverns nesting out on the ridges, the Pridewings, and they're bigger and meaner than anything I keep, so I watch them the way a blacksmith watches good ore." },
      },
      choices = {
        { text = "You'd take wild ones and break them?", next = "wild2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wild2 = {
      big = true,
      lines = {
        { id = "wi2_default", text = "Not break them, because a broken rider is no use in a storm. You take a young one before it learns to hate you, and you earn it, and even then it decides for itself whether you're worth carrying." },
        { id = "wi2_hunter", when = { class = "HUNTER" }, text = "You'd know this better than most, hunter: you don't own a beast, you just convince it you're worth following. A wind rider takes longer to convince than most, that's all." },
      },
      choices = {
        { text = "Wild things should be left wild. The ridges are theirs.", next = "BACK", reply = "Some of us think so too, and I'd never take one that didn't want to come. The ridges will always have their wild ones, I promise you that.", fx = { align = { order = -1 } } },
        { text = "The Horde needs riders. Raise all the young ones you can.", next = "BACK", reply = "We raise all we can, but the young ones decide for themselves, and you can't hurry a wind rider. The Horde will have to be patient.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    harpies = {
      lines = {
        { id = "ha_default", text = "The Bloodfury come off the western cliffs in flocks, and a wind rider alone can't turn more than three of them at once. I've lost two riders to those shrieking hags since I came here, and I've not forgotten either one." },
        { id = "ha_done", when = { questDone = TODO_QUEST("Bloodfury Bloodline") },
          text = "Fewer flocks since their Ripper fell, and I'm told that was your work. The riders fly the western route again without me holding my breath the whole time." },
      },
      choices = {
        { text = "What happened to the riders you lost?", next = "harpies2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harpies2 = {
      big = true,
      lines = {
        { id = "ha2_default", text = "They were dragged down over the Charred Vale with their riders still fighting on their backs, and the harpies picked the bones clean before Maggran's braves could reach them. Maggran says to let the anger go, but I'd rather keep it and use it." },
      },
      choices = {
        { text = "Keep your anger, Tharm. It'll sharpen your aim.", next = "BACK", reply = "I mean to, and every harpy over the Charred Vale is going to feel it. Maggran can preach all he likes.", fx = { align = { light = -1 } } },
        { text = "Maggran's right. Anger only clouds the eye.", next = "BACK", reply = "Maybe he is, and maybe one day I'll be able to let it go. Not while those harpies still nest on the cliffs, though.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    orc = {
      lines = {
        { id = "or_default", text = "The Warchief wants the Horde's roads to reach every corner of Kalimdor, and roads need riders. The tauren gave us this rock to share, and Maggran runs it fairly, so I've got no complaints that a good meal won't settle." },
      },
      choices = {
        { text = "Do orcs and tauren really get along here?", next = "orc2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc2 = {
      lines = {
        { id = "or2_default", text = "Mostly, yes, because orcs and tauren both know what it is to fight for a home. It's Braelyn Firehand you need to watch on this rock, since she'd burn every druid out of the mountains tomorrow, and Tammra would be planting flowers in the ashes before the smoke cleared." },
      },
      choices = {
        { text = "Then I'll stay out of that argument.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hunter = {
      lines = {
        { id = "hu_default", text = "Keep it at your heel and keep it quiet, and don't let it stare at the riders, because a wyvern takes a stare as a challenge. Your {pet} can ride along with you, but it'll arrive with its fur standing on end." },
      },
      choices = {
        { text = "My beast has faced worse than a wyvern.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman = {
      big = true,
      lines = {
        { id = "sh_default", text = "Restless is a soft word for it. The riders feel it too, and they fight the updrafts over Windshear Crag where the goblins have cut the trees away, as if the wind itself has nowhere to settle." },
      },
      choices = {
        { text = "The goblins must be driven out before the wind will settle.", next = "BACK", reply = "That's what Maggran says too, and I can't argue with the riders. Clear the goblins, and maybe the wind will come home.", fx = { align = { light = -1 } } },
        { text = "Give the land time and care, and the wind will follow.", next = "BACK", reply = "That's the tauren talking, and they're usually right about the land. I hope you're right, because my riders are tired of fighting the air.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = {
        { id = "de_default", text = "They will, because the Warchief says the Forsaken are Horde and a wind rider goes where I tell it. Just don't pick at your stitches in the saddle, because if one of them catches the smell, it'll turn its head around to look." },
      },
      choices = {
        { text = "I'll keep my stitches to myself.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I kept riders in Durotar before the Warchief sent me west. Stonetalon's winds are harder, and so are its wyverns." } },
    advice = { { id = "tp_ad", text = "Never stand behind a wind rider, and never stand in front of one that's hungry." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Jayka at the inn, because everybody tells her everything sooner or later." } },
  },
}

---------------------------------------------------------------------------
-- Gereck: tauren stable master.
---------------------------------------------------------------------------
P:NPC {
  key = "stn_gereck", id = TODO_NPC("Gereck"), name = "Gereck", title = "Stable Master",
  bible = "bibles/sunrock_folk.md", role = "stablemaster", tier = "service",
  communities = { "sun_rock" }, temper = { "gentle", "slow" }, values = { "nature", "patient" },
  notices = { "pet", "class" },
  impression = {
    first = "Gereck keeps the beasts at Sun Rock and speaks of every animal in his care as if it had a name and a mother waiting for it. He is slow to speak, and gentle in a way that makes the stables quiet.",
    third = "{name} met Gereck, the tauren stable master at Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_default", text = "Speak softly near the pens, friend, because the new ones are still nervous. Have you a companion who needs a rest?" },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and your companions still remember the water here. That pleases me more than I can say." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} carries itself well, though its paws are sore from the stone paths. Let it drink before you go anywhere, and it will thank you in its own way." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. The beasts in my pens are calmer around you already, and they know something I don't about who you are." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Gereck, and I tend the beasts of Sun Rock for any hunter who needs a companion kept safe. They eat well here and sleep out of the wind, which is more than the mountains offer them." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Earth Mother keep you, little cousin. I am Gereck, and I tend the beasts of Sun Rock, so if you carry a companion, I'll watch over it as I would my own." },
      },
      again = {
        { id = "h_again", text = "What else would you know? The pens are quiet enough." },
        { id = "h_again2", text = "Ask, if you like. The beasts don't mind the talk, so long as it's gentle." },
      },
      choices = {
        { text = "I need the stable.", next = "BUSINESS" },
        { text = "What beasts come through here?", next = "beasts" },
        { text = "Did the fires in the vale reach the animals?", next = "fire" },
        { text = "Will you take good care of my {pet}?", next = "care", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "How do tauren see a hunter's bond with a beast?", next = "bond", when = { class = "HUNTER" } },
        { text = "Rest easy, Gereck.", next = "END" },
      },
    },

    beasts = {
      lines = {
        { id = "be_default", text = "Wolves from Durotar, cats from the Barrens, and now and then a great spider some brave hunter has charmed off the Webwinder Path. The spiders frighten the kodos, so I keep them at the far end, and I keep my distance too." },
      },
      choices = {
        { text = "You're afraid of spiders?", next = "spiders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spiders = {
      lines = {
        { id = "sp_default", text = "Not afraid, only respectful. Maggran wears the scar of Besseleth's fang to this day, and a tauren who has seen that wound learns to approach anything with eight legs slowly." },
      },
      choices = {
        { text = "That's sensible, Gereck.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fire = {
      lines = {
        { id = "fi_default", text = "It did. The deer and the striders fled up toward the rock with their coats singed, and I tended what I could, but many were never seen again. Tammra says the vale will green once more, and I want to believe her." },
      },
      choices = {
        { text = "Who started the fires?", next = "fire2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire2 = {
      big = true,
      lines = {
        { id = "fi2_default", text = "Most say the goblins' machines, though Braelyn blames the druids for everything that burns, and the harpies laugh from the cliffs while the beasts suffer for all of it. I only know that the creatures didn't choose a side, and they burned anyway." },
      },
      choices = {
        { text = "Whoever did it should answer for it, whatever side they're on.", next = "BACK", reply = "They should, and I'd not care what banner they wear. The beasts deserve that much from us.", fx = { align = { honor = 1 } } },
        { text = "Blame doesn't matter now. Sun Rock should look after its own.", next = "BACK", reply = "Sun Rock does what it can, and I'll keep doing my part. But blame matters to the beasts' spirits, I think.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    care = {
      lines = {
        { id = "ca_default", text = "Your {pet} will have clean water, a warm corner and someone to speak to it at night, because a beast left alone grows sad. I promise you that much, and I keep my promises to beasts more carefully than to people." },
      },
      choices = {
        { text = "Then it's in good hands.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll stable it now.", next = "BUSINESS" },
      },
    },
    bond = {
      big = true,
      lines = {
        { id = "bo_default", text = "As a gift from the Earth Mother, given and not taken. A beast who walks beside you by choice honors you, and one held only by fear shames you both, so tell me, {class}, which kind walks beside you?" },
      },
      choices = {
        { text = "Mine walks with me by choice, and I honor that.", next = "BACK", reply = "Then the Earth Mother smiles on you both, {class}. Honor that choice, and your companion will never leave your side.", fx = { align = { light = 1 } } },
        { text = "A beast follows the strongest. That's the way of things.", next = "BACK", reply = "Strength holds a beast for a while, but it doesn't keep it. One day you'll need it to choose you, and it may not.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Water your companion before yourself on the mountain paths. It works harder than you do." } },
    _none = { { id = "tp_none", text = "I don't know, friend. I know beasts, and little else, and that has always been enough for me." } },
  },
}
