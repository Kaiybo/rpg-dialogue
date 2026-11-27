-- Sun Rock Retreat's service folk: Tharm the wind rider master, Gereck at the stables, Kulwia with trade supplies. Voice: bibles/sunrock_folk.md
-- Classic roster names from memory (TODO_NPC until captured). Nothing after Year 1.
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Tharm: tauren wind rider master on the rock.
---------------------------------------------------------------------------
P:NPC {
  key = "stn_tharm", id = TODO_NPC("Tharm"), name = "Tharm", title = "Wind Rider Master",
  bible = "bibles/sunrock_folk.md", role = "flightmaster", tier = "service",
  communities = { "sun_rock" }, temper = { "calm", "proud" }, values = { "loyal", "practical" },
  notices = { "race", "weary" },
  impression = {
    first = "He speaks of the winds the way other tauren speak of family.",
    third = "{name} met Tharm, the tauren who keeps the wind riders at Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, friend. Mind the tails, but they know you by now. Choose your rider and fly well." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Mind the tails, {class}. The riders sting first and think later, and so might I." },
    { id = "g_default", text = "Mind the tails, {class}, for the riders on this rock sting first and think about it afterward. Where do the winds carry you today?" },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the rock in one piece, and the riders remember you, so they will only hiss a little." },
    { id = "g_word_brave", when = { word = "brave" }, text = "The braves say you went where most would not. That is good, because a wind rider can smell fear on a passenger, and you will give them none." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Stand downwind of the riders a moment, Forsaken, and let them grow used to you. They know the smell of carrion, and they are still deciding whether you are a meal." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look as though the harpies had their way with you on the climb. Have your armor mended before you fly, because a rider banks hard over the ridges and loose straps come undone." },
  },

  start = "hello",
  nodes = {
    dd_falling = {
      lines = {
        { id = "dd_fa_default", text = "It happens to everyone in Stonetalon at least once, and to the young and hurried twice. The paths are old and narrow and the wind pushes from the side, so a careless step becomes a long drop, and my riders would have carried you down for a few coins." },
      },
      choices = {
        { text = "I'd rather climb my own way. Falling's part of it.", next = "BACK", reply = "Then you are as stubborn as the mountain, and the mountain is older than you. I suppose the spirit healer will see you again.", fx = { align = { order = -1 } } },
        { text = "Next time I'll pay for a wind rider.", next = "BACK", reply = "That is wise, and the riders will be glad of the work. They will only try to bite you once, as I said.", fx = { align = { order = 1 } } },
        { text = "Something else, Tharm.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_falling", when = { deathCause = "falling" },
          text = "You came down off a cliff without one of my wind riders beneath you, did you not? I can always tell, because those who fall walk a little stiff for a day after the spirit healer sends them back." },
        { id = "h_default", key = true,
          text = "I am Tharm, and I keep the wind riders of Sun Rock. They will carry you to Thunder Bluff or down to the Crossroads faster than any kodo, and they will only try to bite you once." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc, a long way from Durotar's red dust. I am Tharm, and I keep the wind riders here, and your people taught mine to fly them, so the riders always settle a little for an orc." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Welcome, child of the Earth Mother; may the winds be kind to you. I am Tharm, and I keep the wind riders on this rock, as I kept them on the mesas of Thunder Bluff." },
      },
      again = {
        { id = "h_again", text = "What else would you know? The riders are fed, so I have a moment." },
        { id = "h_again2", text = "Ask, then, but stand clear of that one on the end, for the west wind has put her in a mood." },
      },
      choices = {
        { text = "I fell from a cliff, Tharm. It happens.", next = "dd_falling", when = { deathCause = "falling" } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Where do your wind riders come from?", next = "wild" },
        { text = "Do the harpies trouble your riders?", next = "harpies" },
        { text = "How did you come to keep riders here?", next = "orc" },
        { text = "How do you keep your beast from fighting the riders?", next = "hunter", when = { class = "HUNTER" } },
        { text = "The winds over these ridges feel restless, Tharm.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Will your riders carry me, given what I am?", next = "dead", when = { race = "Scourge" } },
        { text = "Safe winds, Tharm.", next = "END" },
      },
    },

    wild = {
      lines = {
        { id = "wi_default", text = "Some come from these very mountains. Wild wyverns nest on the ridges, the Pridewings, and they are bigger and fiercer than anything I keep, so I watch them the way a herder watches a strong young bull." },
      },
      choices = {
        { text = "You'd take wild ones and break them?", next = "wild2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wild2 = {
      big = true,
      lines = {
        { id = "wi2_default", text = "Not break them, for a broken rider is no use in a storm. You take a young one before it learns to hate you, and you earn its trust, and even then it decides for itself whether you are worth carrying." },
        { id = "wi2_hunter", when = { class = "HUNTER" }, text = "You would know this better than most, hunter, because you do not own a beast, you only convince it you are worth following. A wind rider takes longer to convince than most, that is all." },
      },
      choices = {
        { text = "Wild things should be left wild. The ridges are theirs.", next = "BACK", reply = "Many of my people think so too, and I would never take one that did not wish to come. The ridges will keep their wild ones, as the Earth Mother intends.", fx = { align = { order = -1 } } },
        { text = "The Horde needs riders. Raise all the young ones you can.", next = "BACK", reply = "We raise all we can, but the young ones choose for themselves, and no one hurries a wind rider. The Horde will have to learn patience, as the plains did.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    harpies = {
      lines = {
        { id = "ha_default", text = "The Bloodfury come off the western cliffs in flocks, and a wind rider alone cannot turn more than three of them at once. I have lost two riders to those shrieking harpies since I came here, and I have not forgotten either one." },
        { id = "ha_done", when = { questDone = TODO_QUEST("Bloodfury Bloodline") },
          text = "There are fewer flocks since their Ripper fell, and I am told that was your work. The riders fly the western wind again, and I no longer hold my breath the whole way." },
      },
      choices = {
        { text = "What happened to the riders you lost?", next = "harpies2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harpies2 = {
      big = true,
      lines = {
        { id = "ha2_default", text = "They were dragged down over the Charred Vale with their riders still fighting on their backs, and the harpies picked the bones clean before Maggran's braves could reach them. Maggran says to let the anger go, and I am trying, but it sits in me like a stone." },
      },
      choices = {
        { text = "Keep your anger, Tharm. It'll sharpen your aim.", next = "BACK", reply = "Perhaps I will, and every harpy over the Charred Vale will feel it. The Earth Mother may forgive me for that.", fx = { align = { light = -1 } } },
        { text = "Maggran's right. Anger only clouds the eye.", next = "BACK", reply = "He usually is, and one day I may let it go. Not while those harpies still nest on the cliffs, though.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    orc = {
      lines = {
        { id = "or_default", text = "Cairne asked for riders in the mountains, and I raised mine on the mesas of Thunder Bluff, so I came. The winds here are wilder than at home, but Maggran keeps the rock fairly, and the riders have learned the new air." },
      },
      choices = {
        { text = "Does everyone on the rock get along?", next = "orc2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc2 = {
      lines = {
        { id = "or2_default", text = "Mostly, for orcs and tauren both know what it is to fight for a home. It is Braelyn Firehand you must watch, since she would burn every druid out of the mountains tomorrow, and Tammra would be planting flowers in the ashes before the smoke cleared." },
      },
      choices = {
        { text = "Then I'll stay out of that argument.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hunter = {
      lines = {
        { id = "hu_default", text = "Keep it at your heel and keep it quiet, and do not let it stare at the riders, because a wyvern takes a stare as a challenge. Your {pet} may ride with you, but it will arrive with its fur standing on end." },
      },
      choices = {
        { text = "My beast has faced worse than a wyvern.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman = {
      big = true,
      lines = {
        { id = "sh_default", text = "Restless is a gentle word for it. The riders feel it too, and they fight the updrafts over Windshear Crag where the goblins cut the trees away, as if the wind has lost its resting place." },
      },
      choices = {
        { text = "The goblins must be driven out before the wind will settle.", next = "BACK", reply = "Maggran says the same, and the riders agree with him. Clear the goblins, and perhaps the wind will settle back into the trees.", fx = { align = { light = -1 } } },
        { text = "Give the land time and care, and the wind will follow.", next = "BACK", reply = "That is the old way of my people, and the land usually proves it true. I hope you are right, for my riders are tired of fighting the air.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = {
        { id = "de_default", text = "They will, for the Forsaken are Horde and a wind rider goes where I ask it. Only do not pick at your stitches in the saddle, because if one of them catches the smell, it will turn its head around to look." },
      },
      choices = {
        { text = "I'll keep my stitches to myself.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I raised riders on the mesas of Thunder Bluff before Cairne sent me to the mountains. Stonetalon's winds are harder, and so are its wyverns." } },
    advice = { { id = "tp_ad", text = "Never stand behind a wind rider, and never stand in front of one that is hungry." } },
    _none = { { id = "tp_none", text = "The winds have not told me that. Ask Jayka at the inn, for everyone tells her everything sooner or later." } },
  },
}

---------------------------------------------------------------------------
-- Gereck: orc stable master.
---------------------------------------------------------------------------
P:NPC {
  key = "stn_gereck", id = TODO_NPC("Gereck"), name = "Gereck", title = "Stable Master",
  bible = "bibles/sunrock_folk.md", role = "stablemaster", tier = "service",
  communities = { "sun_rock" }, temper = { "gruff", "proud" }, values = { "nature", "loyal" },
  notices = { "pet", "class" },
  impression = {
    first = "He is gruff with people and gentle with every beast in his pens.",
    third = "{name} met Gereck, the orc stable master at Sun Rock Retreat.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, you. You can talk as loud as you like near the pens, friend. The new ones like you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Keep your voice down near the pens, {class}. The new ones are nervous, and you make me nervous." },
    { id = "g_default", text = "Keep your voice down near the pens, {class}, because the new ones are still nervous. You got a beast that needs a rest?" },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and your beasts still remember the water here. That says more good about you than anything you could tell me." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} carries itself well, but its paws are sore from the stone paths. Let it drink before you go anywhere, and it will fight harder for you." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. The beasts in my pens are calmer around you already, so they know something about you that I don't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dd_deepmoss", when = { killed = { name = "Deepmoss", min = 15 } },
          text = "You stink of Deepmoss webbing, and my beasts don't like it one bit. Good work thinning those spiders, though, because I lost two wolves to their venom this season alone." },
        { id = "h_default", key = true,
          text = "I'm Gereck, and I keep the stables on Sun Rock for any hunter who needs a beast kept safe. They eat well here and sleep out of the wind, which is more than these mountains give them." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Welcome, tauren; this is your people's rock, and I only keep its stables. I'm Gereck, and if you carry a companion, I'll watch over it like one of my own wolves." },
      },
      again = {
        { id = "h_again", text = "What else? The pens are quiet enough for now." },
        { id = "h_again2", text = "Ask, then. The beasts don't mind talk, so long as nobody shouts." },
      },
      choices = {
        { text = "I need the stable.", next = "BUSINESS" },
        { text = "What beasts come through here?", next = "beasts" },
        { text = "Did the fires in the vale reach the animals?", next = "fire" },
        { text = "Will you take good care of my {pet}?", next = "care", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "How do orcs see a hunter's bond with a beast?", next = "bond", when = { class = "HUNTER" } },
        { text = "Who's Besseleth, that marked Maggran?", next = "besseleth" },
        { text = "The kodos must hate this climb.", next = "kodo" },
        { text = "Rest easy, Gereck.", next = "END" },
      },
    },

    beasts = {
      lines = {
        { id = "be_default", text = "Wolves from Durotar, cats from the Barrens, and now and then a great spider some fool hunter has charmed off the Webwinder Path. The spiders frighten the kodos, so I keep them at the far end, and I keep my distance too." },
      },
      choices = {
        { text = "You're afraid of spiders?", next = "spiders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spiders = {
      lines = {
        { id = "sp_default", text = "Not afraid, only careful. Maggran wears the scar of Besseleth's fang to this day, and a raptor already took two of my fingers, so I approach anything with eight legs slowly." },
      },
      choices = {
        { text = "That's sensible, Gereck.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fire = {
      lines = {
        { id = "fi_default", text = "It did. The deer and the striders came up toward the rock with their coats singed, and I tended what I could, but many were never seen again. Tammra says the vale will grow back, and I want to believe her." },
      },
      choices = {
        { text = "Who started the fires?", next = "fire2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire2 = {
      big = true,
      lines = {
        { id = "fi2_default", text = "Most say the goblins' machines, though Braelyn blames the druids for everything that burns, and the harpies laugh from the cliffs while the beasts suffer for all of it. I only know the creatures didn't choose a side, and they burned anyway." },
      },
      choices = {
        { text = "Whoever did it should answer for it, whatever side they're on.", next = "BACK", reply = "They should, and I don't care what banner they carry. Some of these beasts came to me with burns on their paws.", fx = { align = { honor = 1 } } },
        { text = "Blame doesn't matter now. Sun Rock should look after its own.", next = "BACK", reply = "Sun Rock does what it can, and I'll keep doing my part. But somebody owes these beasts a debt, and an orc doesn't forget a debt.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    care = {
      lines = {
        { id = "ca_default", text = "Your {pet} will have clean water, a warm corner and someone to talk to it at night, because a beast left alone goes sour. You have my word on that, and I keep my word to beasts better than to people." },
      },
      choices = {
        { text = "Then it's in good hands.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll stable it now.", next = "BUSINESS" },
      },
    },
    bond = {
      big = true,
      lines = {
        { id = "bo_default", text = "I handled wolves for the clans before the camps, and the camps taught me what a chain does to anything with a heart. A beast who walks beside you by choice honors you, and one held only by fear shames you both, so which kind walks with you, {class}?" },
      },
      choices = {
        { text = "Mine walks with me by choice, and I honor that.", next = "BACK", reply = "Then you're a better hunter than most, {class}. I can see it in the way it watches you, even now.", fx = { align = { light = 1 } } },
        { text = "A beast follows the strongest. That's the way of things.", next = "BACK", reply = "Strength holds a beast for a while, but it doesn't keep it. I wore chains once, and the day they came off, I didn't stay.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    besseleth = {
      lines = { { id = "bs_default", text = "A great spider of the Webwinder Path, older and bigger than the rest, that nests in the hollows south of here. She bit Maggran years ago and he nearly lost the arm, and the young hunters dare each other to go and find her." } },
      choices = {
        { text = "Has anyone killed her?", next = "besseleth2" },
        { text = "A spider worth fearing, then.", next = "besseleth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    besseleth2 = {
      lines = { { id = "bs2_default", text = "Not yet, and Maggran would pay well for her fang, I think, though he'd never say it's about revenge. If you go down the Webwinder, carry antivenom and keep your beast close, {class}, because she takes the smaller ones first." } },
      choices = { { text = "I'll keep my beast close. Something else.", next = "BACK" } },
    },
    kodo = {
      lines = { { id = "kd_default", text = "They don't love it, but they're too proud to say so. A kodo coming up from the Barrens will stop at every switchback and look at you like you've insulted its mother, and then it'll keep climbing, because it'd sooner die than turn round." } },
      choices = {
        { text = "That sounds like an orc, honestly.", next = "kodo2" },
        { text = "Do you stable the caravan kodos too?", next = "kodo2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kodo2 = {
      lines = { { id = "kd2_default", text = "Ha! It does, and the tauren say the same about me. The caravan kodos stay with me a night before they go back down, and I rub their feet with fat and talk to them about the Barrens, which they seem to like. A beast misses the plains same as anyone." } },
      choices = {
        { text = "I'm an orc. We'd all sooner die than turn round.", next = "BACK", reply = "Then you and the kodos will get on fine. Go on, stubborn one.", when = { race = "Orc" } },
        { text = "Something else, Gereck.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Water your beast before yourself on the mountain paths, because it works harder than you do." } },
    _none = { { id = "tp_none", text = "Don't know. I know beasts and little else, and that's always been enough for me." } },
  },
}
