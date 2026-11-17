-- Thousand Needles between the towns: the canyon paths, the Shimmering Flats crews, and the quieter folk of Freewind Post.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "paoka", id = TODO_NPC("Pao'ka Swiftmountain"), name = "Pao'ka Swiftmountain",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Pao'ka Swiftmountain is a young tauren who wandered too far into the Needles and needed help getting home safely.",
    third = "{name} met Pao'ka Swiftmountain, a young tauren lost in the canyons of Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Oh, you're not a centaur, thank the Earth Mother!" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I'm still here, sort of, if that's good news." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "My uncle says I'm too young to hold an axe properly, and after today I think he's right, because I dropped mine in the canyon running from the centaurs. When I'm older I want to stand with the braves at Freewind, if they'll have someone who gets lost this easily." } },
      choices = {
        { text = "Running was right. A warrior knows when not to fight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Next time, stand your ground. Courage only comes with practice.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I was following a hawk because I thought it would lead me to water, and then I was following another hawk, and then I wasn't sure which one I'd started with. I know now that hawks don't care where tauren need to go." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is {pet} friendly? It is, isn't it? Could it walk on my side, between me and the centaurs, just for a little while?" },
      },
      choices = {
        { text = "Learn the trails before you wander off again.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wandering is how you learn. Don't let this stop you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I did, I think, only later, after I'd seen something besides Mulgore. I thought the Earth Mother would still be there when I got back, and she will be, but I wasn't counting on the centaurs being here too." } },
      choices = {
        { text = "See the world first. The Circle will wait for you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Go home and study. Wandering nearly killed you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "You're a warrior! That's good, that's really good, because the Galak are big and there are lots of them, and I've only got a gathering knife." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! You must know the canyons, then, and which way is home, because I've walked past this same rock three times now." },
        { id = "h_default", key = true, text = "I'm Pao'ka Swiftmountain, and I came out here to gather things for my family, but I got turned around in the canyons. The Galak centaurs are everywhere, and I don't think I can make it back to Freewind alone." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Homeward Bound") }, text = "You'll walk me home? I'll stay close, I promise, and I'll run if I see centaurs, because I'm better at running than fighting." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You're a shaman! Could you ask the spirits for the way back to Freewind? I've gotten so turned around in these canyons." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "Are you a priest? My grandmother says priests can hear things the rest of us can't, so maybe you can hear the way back to Freewind." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "Are you a mage? Could you make a light? It gets dark in the canyons very fast, and I don't like the dark out here." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "You're a warlock? I'm not scared, honestly, but please keep that thing on your side of the path." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Oh! You scared me, because I didn't hear you at all. Can you teach me to walk like that, so the Galak won't hear me either?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "You're a druid, from Thunder Bluff maybe? My mother wanted me to study with the druids, but I wanted to see the canyons first, and now look at me." },
      },
      again = { { id = "h_again", text = "What else? I'm listening, just a bit nervous." }, { id = "h_again2", text = "Ask me anything; it helps to talk." } },
      choices = {
        { text = "Why didn't you want to study with the druids?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "How did you get lost?", next = "b1_1" },
        { text = "Who's your family?", next = "b2_1" },
        { text = "Why are the centaurs dangerous?", next = "b3_1" },
        { text = "Freewind is my kin's home too.", next = "x_1", when = { race = "Tauren" } },
        { text = "Are you frightened of the Galak, Pao'ka?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the Galak have magic of their own?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Where did you last see the Galak riders?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Should you have stayed home?", next = "s_1" },
        { text = "Have you ever thought of becoming a warrior, Pao'ka?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How did you lose your way in the canyons, Pao'ka?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I was following a herd of plainstriders because my father said their feathers are lucky, and before I knew it, I'd gone further than I've ever been. Then the centaurs came, and I hid." } },
      choices = { { text = "You'll be fine.", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "My family will be so worried, and my father especially, because he told me not to go past the lifts. I didn't listen, and now I'm sorry." } },
      choices = { { text = "Will you listen next time?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you get me home, I'll tell everyone a stranger helped me, and I'll listen next time. Maybe." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "The Swiftmountains, from Freewind Post up on the mesas. My father's a hunter and my mother keeps the hearth, and they've probably already sent half the post looking for me." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "The Galak centaurs think all of Thousand Needles belongs to them, and they don't like tauren very much. They've raided Freewind before, and they'd take me too if they could." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Then you'll know the way better than me! Please, take me back, and I'll tell everyone a cousin from Mulgore found me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "My father would say I should have, and maybe he'd be right, but I wanted to see the canyons for myself." } },
      choices = { { text = "Adventure is worth a little danger.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Listen to your father. The world is dangerous.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I think so, because I saw one of them shout at the sky and the wind came down like a hand. If you have magic too, maybe they'll leave us alone on the way home, and I really hope they do." } },
      choices = {
        { text = "Stay close to me. I'll keep you safe.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep up. I won't be waiting for you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "On the trail back toward Freewind, which is the trail I need, of course. There were three of them, and they stopped at the bend as if they were waiting for something, maybe for me." } },
      choices = {
        { text = "We'll go around them. No fighting if we can help it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then we'll ambush them at the bend first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Very, because they ride faster than I can run, and they shout things at me I don't understand. My grandmother says the earth won't let a tauren come to harm in the Needles, but I think the earth is very busy." } },
      choices = {
        { text = "Listen to your grandmother. The elders know these canyons.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Don't wait on elders or spirits. Trust your own feet.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, but I'm only young, so maybe that's fine." } } },
}

P:NPC {
  key = "kanati", id = TODO_NPC("Kanati Greycloud"), name = "Kanati Greycloud",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Kanati Greycloud is a tauren of Freewind Post who watches the Grimtotem and the Galak with equal wariness.",
    third = "{name} met Kanati Greycloud of Freewind Post in Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Peace, friend. You've come a long way up the mesas." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The winds bring you here often." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because I watch their camps and send word to Freewind, and they have learned whose eyes those are. A warrior at my side means they must come at me openly, and the Galak have never cared for a fair fight." } },
      choices = {
        { text = "I'll guard you, and Freewind can answer them properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let me hunt their killers down first, before they strike.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The ones that run down toward the dry riverbeds, because the Galak go down to water at dawn and grow careless there. Don't follow the trails that climb, though, because those lead to the Grimtotem, and they guard their paths more closely than any centaur." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} will smell the centaur long before you see them. Trust its nose, and when it stops, you stop." },
      },
      choices = {
        { text = "I'll scout and report. Freewind can decide what's done.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll strike them where they drink, while they're careless.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They claim the high places and drive off anything that isn't theirs, beast and tauren alike. The mesas were meant to be shared, and the Grimtotem have forgotten it." } },
      choices = {
        { text = "Cairne should send braves to drive them off.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let each camp defend its own mesa.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It would help, because they've grown bold, and my braves are too loud to get close. Find out how many warriors they keep at the pinnacle, and we'll know how many we need to send." } },
      choices = {
        { text = "I'll scout for Freewind gladly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll strike while I'm there.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kanati.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The winds fear what does not belong to this world, and your power is one of those things. I do not judge you for it, but I will not pretend the land welcomes you as gladly as I do." } },
      choices = {
        { text = "Then the land must learn to live with me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll walk carefully. I mean no harm here.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior of the Horde. The Galak have sent killers after me before, and I would welcome a strong arm on the path today." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. From this ledge I see every trail the Galak use, and I would trade all my watching for one day of following them as you can." },
        { id = "h_default", key = true, text = "I am Kanati Greycloud. Freewind Post sits above the canyons, and from here we watch both the centaurs below and the Grimtotem who think these mesas belong to them." },
        { id = "h_c0", when = { race = "Tauren" }, text = "A child of Mulgore here at Freewind! The Earth Mother keeps you, kin, and Cairne would be proud to see you so far from home." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid of the Earth Mother! Then you'll feel what the Grimtotem do to these mesas, even if the others only see it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You walk softly, friend. The Grimtotem and the Galak both keep watch, but neither of them would hear you coming." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock. The winds grow still when you pass, and I wonder what they fear. You are of the Horde, so I welcome you, but I ask you to walk carefully here." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Speak, friend." } },
      choices = {
        { text = "What are the Grimtotem doing to the mesas?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who are the Grimtotem?", next = "b1_1" },
        { text = "What of the Galak centaurs?", next = "b2_1" },
        { text = "How do you live up here?", next = "b3_1" },
        { text = "The spirits here feel restless.", next = "x_1", when = { class = "SHAMAN" } },
        { text = "Should the Grimtotem be forgiven?", next = "s_1" },
        { text = "Should I scout the Grimtotem for you, Kanati?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The winds fear my power?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why would the Galak send killers after you, Kanati?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Which of the Galak's trails should I follow, Kanati?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They are tauren, like us, but they follow Magatha Grimtotem and reject Cairne's way. They want the land to themselves and they don't care who they hurt to take it." } },
      choices = { { text = "Kin you once shared fires with?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Here in the Needles they've built camps on the high mesas, and they harass anyone who crosses their path. Some are kin we once shared fires with." } },
      choices = { { text = "Can they be reconciled?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "That is the hardest part, friend. It is one thing to fight a stranger, and another to fight a cousin." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "The Galak hold the canyon floors and raid anyone who comes near. They are cruel, but at least they are honest about being enemies, which is more than the Grimtotem offer." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Carefully, and with good lifts. The mesas keep us safe from the centaurs, and the wind keeps us company." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "They are, shaman. The Grimtotem disturb the land, and the spirits don't forget, even when we wish they would." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Cairne hopes they might return to us one day. I've seen what they do, and I'm not sure I share his hope." } },
      choices = { { text = "Cairne is wise. Leave the door open.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "They chose their path. Let them walk it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "The winds haven't spoken of that to me." } } },
}

P:NPC {
  key = "motega", id = TODO_NPC("Motega Firemane"), name = "Motega Firemane",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Motega Firemane is a tauren of Freewind Post who has had enough of the Grimtotem and isn't shy about saying so.",
    third = "{name} met Motega Firemane, a tauren at Freewind Post in Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Welcome, traveler. Come, but watch your step on the mesa edges." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Good." },
  },
  start = "hello",
  nodes = {
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Without thanks and without limit, because Magatha teaches them that the land is theirs by right and owes them nothing back. I have found kills left to rot on the canyon floor with only the hides taken, and that is not hunting, that is spite." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} walks beside you as an equal, I can see it. The Grimtotem would put a chain on such a beast and call that mastery." },
      },
      choices = {
        { text = "I take only what I need, and thank the land for it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The land gives what it gives. Thanks feed no one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Power, the same as she wants in Thunder Bluff, only out here no one watches her. The Grimtotem hold Darkcloud Pinnacle, and every season they take a little more of the canyon around it." } },
      choices = {
        { text = "Bring the matter before Cairne and let him judge.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Strike the Pinnacle without warning. She'd do the same.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "No, but power without the Earth Mother's blessing is power that goes astray. Magatha's followers forgot that, and now they kill their own kin for land that was never theirs to take." } },
      choices = {
        { text = "Power is power. I'll use it wisely.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You're right. I'll remember the Earth Mother.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I would have you strike them however they fall fastest, for they have stopped fighting with honor. I'd rather a clean fight in the open, but I'll not mourn a Grimtotem who never saw the blade." } },
      choices = {
        { text = "Even the Grimtotem deserve an honest fight.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Honor's wasted on traitors. I'll strike unseen.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. The Grimtotem hunt these mesas too, and they hunt like thieves, taking more than the land can give, which shames every tauren who sees it." },
        { id = "h_default", key = true, text = "I am Motega Firemane, and I keep watch over Freewind Post. The Grimtotem grow bolder each season, and someone has to stand against them before they take the whole of the Needles." },
        { id = "h_c0", when = { race = "Tauren" }, text = "A fellow tauren who walks the Earth Mother's path, not Magatha's. You are welcome at my fire." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "You walk the Earth Mother's path as a druid should, but Magatha's people bend the spirits to their will, and I would hear what you make of that." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Good, because the Grimtotem call on the elements too, and I want someone at Freewind who can call back louder." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The Grimtotem have shamans of their own and they'd love to prove the spirits favor them, so stand with Freewind and let your prayers answer theirs." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. The Grimtotem think the Needles belong to them, so I'd very much like to see your fire prove them wrong at Darkcloud Pinnacle." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "Warlock. The Grimtotem bargain with powers they do not understand, and I hope you understand yours better, because I have seen where that path leads." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue of the Horde. The Grimtotem are many, and they fight like cornered bulls, but a blade in the dark is something they don't expect." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Ask, if you have more." } },
      choices = {
        { text = "What does Magatha want from the Needles?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What are the Grimtotem doing?", next = "b1_1" },
        { text = "Why not go back to Mulgore?", next = "b2_1" },
        { text = "What of the goblins in the Flats?", next = "b3_1" },
        { text = "I'll take the fight to them.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "What would you have a shaman do against the Grimtotem, Motega?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How strong are the Grimtotem's spellcasters?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Are you being too harsh on them?", next = "s_1" },
        { text = "My power is not the Grimtotem's, Motega.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would you have me strike the Grimtotem unseen?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "How do the Grimtotem hunt the Needles, Motega?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They have taken the high mesas to the north and claim them for Magatha. They shoot at our riders and send warnings that we should leave." } },
      choices = { { text = "Why not fight them?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "We will not leave, of course, because Freewind is ours as much as anyone's. But we cannot fight them on every mesa at once." } },
      choices = { { text = "I'll strike at them.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you can strike at their camps, the others at Freewind will remember your name, and so will I." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Because the Needles are home to us too, and running is not the tauren way. The Earth Mother gave us this land as she gave us Mulgore." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Loud and strange, but harmless enough. They race their machines on the salt flats and pay well for help, which some of our young braves enjoy too much." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Then go with my blessing, and with your axe. The Grimtotem respect strength, even if they respect nothing else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say I'm too angry about the Grimtotem, but I've buried friends because of them. Anger seems fair." } },
      choices = { { text = "Your anger is earned. Use it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Anger will make you as bad as them.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Strong enough, and proud of it, because they believe the Earth Mother's spirits answer to their clan before any other. They are wrong, but being wrong has never made anyone weaker, so go carefully if you go up there." } },
      choices = {
        { text = "I'll face them openly and show them they're wrong.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find their weakness and strike there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Stand in front of them with your totems planted and show them the Earth Mother doesn't belong to their clan. Magatha's people think the spirits are theirs to command, and I'd like to watch them learn otherwise." } },
      choices = {
        { text = "The spirits belong to all tauren, and I'll say so openly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them think they command the spirits. Surprise works better.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That I do not know, friend." } } },
}

P:NPC {
  key = "razzeric", id = TODO_NPC("Razzeric"), name = "Razzeric",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Razzeric is a goblin racer at the Mirage Raceway who treats every lap like it's his last, and some of them almost were.",
    third = "{name} met Razzeric, a goblin racer at the Mirage Raceway in Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Hey! You lookin' at my car? Don't touch, it's still warm." },
    { id = "g_back", when = { metBefore = true }, text = "My biggest fan's back! Ha, I knew you'd come round." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nerve? Pal, I've got nerve coming out my ears, along with a fair bit of smoke from the last crash. Same as you charging into a fight, really, except your armor doesn't blow up when you hit a rock." } },
      choices = {
        { text = "Nerve is nothing without control. Know when to brake.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Full speed and no brakes. That's how you win.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "All the time! Last week a tortoise sat right on the finish line, and I swerved so hard I took out the timing post, and Daisy still hasn't let me forget it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} off the track, all right? I like animals fine, I just don't wanna hit one at full throttle, because that's a mess nobody wants to clean up." },
      },
      choices = {
        { text = "The beasts were here first. Slow down for them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If they sit on the track, that's their problem.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That's what the last one said too! Still, if you're honest, you're welcome to watch me win, because I don't need sabotage when I've got this engine." } },
      choices = {
        { text = "Fair races are the only ones worth winning.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A win's a win, however you get it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's the risk I take every lap anyway, friend! Pozzik won't let me try it, says it's cheating, but I say it's just engineering with a bit of sparkle." } },
      choices = {
        { text = "Pozzik's right. Magic in a race is cheating.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules are for slow racers. Try it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Afraid? Sure I'm afraid, friend, every single lap, and that's what makes it worth doing. If I go out in a blaze on the Shimmering Flats, at least they'll talk about it in Booty Bay for a month, and that's more than most goblins get." } },
      choices = {
        { text = "Your life is worth more than a month of gossip.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A blaze of glory beats a long and dull life.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "There's no wildlife on the Flats worth mentioning, unless you count the gnomes, and they frighten easily. A few basilisks come round to watch sometimes, and I swear one of them cheers." } },
      choices = {
        { text = "Race where you like. The flats belong to no one.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Mind the beasts. Even a salt flat has its residents.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "Whoa, armor! Hey, you wanna sit in the car? No? Smart, because the last guy in plate who sat in it cracked the axle clean through." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Hey, can you track a thief? Because somebody keeps moving my spare parts, and I'm pretty sure it's a gnome." },
        { id = "h_default", key = true, text = "Razzeric, the fastest goblin on the Shimmering Flats! I race for the goblin team, and every time I take the car out, the gnomes start sweating." },
        { id = "h_c0", when = { race = "Gnome" }, text = "Uh-oh, a gnome. You here to sabotage my car, or just to watch me beat your friends?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, huh? Can you make the wind blow at the gnomes' car and not mine? I'm kidding, mostly, unless you can." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Bless the car, would ya? I don't care which god does it, as long as the gnomes' car doesn't get blessed too." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock, huh? Is it true imps can run on fire? Because I've got an engine that could use a little enthusiasm." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You're not here to mess with my car, are you, friend? Because the gnomes hired someone like you last season and I lost two wheels before the first lap." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! You could make my car faster with a spell, couldn't you? A little fire in the engine, maybe, or a little ice in the tires?" },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, at the track? You'd better stand behind the barrels, because if this engine goes, you'll be busy patching me up before the dust settles." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! How fast can you run in that cat shape of yours, anyway? Because I bet I can beat you, and I know the gnomes can't." },
      },
      again = { { id = "h_again", text = "What else? Talk quick, like me." }, { id = "h_again2", text = "More? Sure, I got a minute between laps." } },
      choices = {
        { text = "Doesn't the racing frighten the wildlife out here?", next = "xdruid", when = { class = "DRUID" } },
        { text = "How do you race here?", next = "b1_1" },
        { text = "Is it safe?", next = "b2_1" },
        { text = "What's the prize?", next = "b3_1" },
        { text = "I bet you've got a trick or two in that car.", next = "x_1", when = { class = "ROGUE" } },
        { text = "Would you really cheat with the wind, Razzeric?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What could magic do for the goblin team?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Is racing worth the danger?", next = "s_1" },
        { text = "I don't sabotage cars, Razzeric.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Magic in your car might blow it apart, Razzeric.", next = "xmage", when = { class = "MAGE" } },
        { text = "Aren't you afraid of dying in that car?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does a racer need a warrior's nerve, Razzeric?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the flats' beasts ever wander onto the track, Razzeric?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "You strap yourself into the fastest machine money can buy, point it at the far end of the Flats, and pray. The salt's flat, but the rocks aren't, and neither are the gnomes." } },
      choices = { { text = "The gnomes cheat?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The gnomes have their own team with Fizzle and the rest, and they cheat, or at least I think they cheat. We'd never do that, of course." } },
      choices = { { text = "You'd cheat too?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Of course we would, actually, but we're better at it. Don't tell Kravel I said that." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Safe? Friend, I've crashed more times than I've won, and I've won a lot. That's just racing." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Glory, money and bragging rights over the gnomes, mostly the last one. Pozzik keeps the books, and he says we're up this season." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Ha! You've got a good eye, friend, and a quiet mouth, I hope. What's under the hood stays under the hood." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Pozzik says I'm crazy to keep racing. I say a goblin without risk is just a banker with a hat." } },
      choices = { { text = "Life's short. Race fast.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "You'll get killed for nothing. Slow down.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Pozzik says no magic on the track and Daisy writes everything down, so officially, nothing. Unofficially, if a little frost kept the engine cool between heats, I don't see how anybody could complain." } },
      choices = {
        { text = "Unofficially, I could cool your engine.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Rules are rules. Win it fair, Razzeric.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Cheat's a strong word, pal, and besides, Daisy would catch it on her stopwatch and Pozzik would dock my pay. The flats get gusty in the afternoons anyway, so I just make sure I'm racing in the mornings." } },
      choices = {
        { text = "Win it fairly, Razzeric, or the win means nothing.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A little wind on the gnomes' side wouldn't hurt anybody.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Never heard of it, but if it's fast, I want to drive it." } } },
}

P:NPC {
  key = "daisy", id = TODO_NPC("Daisy"), name = "Daisy",
  bible = "bibles/thousandneedles.md", role = "citizen", tier = "service",
  impression = {
    first = "Daisy keeps time at the Mirage Raceway and has no patience for anyone who slows the track down.",
    third = "{name} met Daisy, the timekeeper at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_main", text = "Hey! Step back from the line, the next lap's coming through." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Watching the races, or getting in the way?" },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They try, but I keep the stopwatch running whatever happens, and a racer who stops to throw a punch loses the heat. It's done wonders for the peace around here, because nobody fights while the clock's still ticking." } },
      choices = {
        { text = "Rules keep the peace. Good for you, Daisy.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some fights matter more than any race.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A good stopwatch and better eyes, though the dust off the flats doesn't help, and the heat makes the far end of the track shimmer like water. Some days I swear I've timed a mirage, and then the car turns up a minute later and makes a liar of me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} by you while the heats run. The last hunter's wolf chased a car to the finish line and set a better time than the gnomes did." },
      },
      choices = {
        { text = "Honest times matter. Nobody should ever doubt the clock.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A close race could go either way, and nobody would notice.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Far enough to cross the finish line before anyone else, and that's what matters. I've got enough trouble keeping the goblins and gnomes honest without mages making it worse." } },
      choices = {
        { text = "I'd never cheat a race with magic.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If you can't catch it, it's not cheating.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Both crews, on a bad day, and Kravel always seems to know who. I don't trust him, and I don't trust anyone who looks at my stopwatch too long, so keep your eyes on the track." } },
      choices = {
        { text = "Fixed times ruin the race. I'd never touch it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything's for sale out here.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A kodo, once, that got loose from somebody's caravan and ran half the track before anyone could catch it. I gave it a respectable time, too, and it beat two of the gnome cars, which nobody has let them forget." } },
      choices = {
        { text = "Let the kodo race next season. It earned it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Beasts belong in the wild, not on a racetrack.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. If you're here to brawl with the gnome crew, do it off the track, because I'm not stopping the clock for anybody's broken nose." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter? Good eyes, then, and you'll know how hard it is to watch something moving fast, which is my whole job." },
        { id = "h_default", key = true, text = "I'm Daisy, and I keep the times at the Mirage Raceway. If it happens on the track, I've got it on my stopwatch, so nobody argues about who won." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You're a shaman? Then don't go calling lightning down on my track, because the last storm cost me a whole afternoon of times." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. If you're praying for one team or the other, kindly do it off the track, because I don't time prayers." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Keep your demon off the track, because if it runs across during a heat it's getting a time, and you won't like what I write next to it." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Don't you dare blink across my finish line, because I can't time a racer who skips half a length, and the gnomes would argue about it for a week." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You've got quick hands, I can tell. Keep them away from my stopwatch, because there's more than one crew that would pay to have it run slow." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! If you ever want your running shape timed on the track, I'll do it, though the racers might get jealous." },
      },
      again = { { id = "h_again", text = "What else, hon?" }, { id = "h_again2", text = "Make it fast; the cars sure are." } },
      choices = {
        { text = "What's the strangest thing you've timed out here?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Who's winning?", next = "b1_1" },
        { text = "Is the job dangerous?", next = "b2_1" },
        { text = "Do the racers ever cheat?", next = "s_1" },
        { text = "Has a storm really stopped a race, Daisy?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Has anyone tried to use magic on the races?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Mages can't really blink that far, Daisy.", next = "xmage", when = { class = "MAGE" } },
        { text = "Who would pay to fix the times?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do brawls ever stop the races, Daisy?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "How do you keep time on cars that fast, Daisy?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Depends on the day and who's been tinkering with what. The goblins are fast, but the gnomes are clever, and clever wins when the goblins blow an engine." } },
      choices = { { text = "You don't take sides?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I don't take sides, though. My stopwatch is the only fair one on the Flats." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Only if you stand where the cars are, hon. I've learned to stand behind the rocks and duck when I hear the engines." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Everybody tries something, hon, from tweaked engines to bent fuel. My job's to time them, not to judge them, but I see it." } },
      choices = { { text = "Cheaters should be disqualified. Fair is fair.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } }, { text = "Racing's about winning. Let them cheat.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Only every other week, and they always think they're the first to try. The gnomes accused a goblin of hexing their engine last season, the goblins accused the gnomes of warding theirs, and I wrote both down as engine trouble." } },
      choices = {
        { text = "Good. Honest times matter, even here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A clever cheat deserves to win once in a while.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "One came off the salt flats last season and blew the gnomes' car clean off the track, and the gnomes blamed the goblins for it. I wrote it down as weather, because that's what the stopwatch says, and the stopwatch doesn't take sides." } },
      choices = {
        { text = "Good. The record should be honest, whoever it helps.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You could have sold that result to the goblins.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Couldn't tell you. I only know what happens on the track." } } },
}

P:NPC {
  key = "wizzle", id = TODO_NPC("Wizzle Brassbolts"), name = "Wizzle Brassbolts",
  bible = "bibles/thousandneedles.md", role = "citizen", tier = "service",
  impression = {
    first = "Wizzle Brassbolts works for the gnome racing team and is very serious about engineering, if less serious about modesty.",
    third = "{name} met Wizzle Brassbolts of the gnome racing team at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_main", text = "Oh, hello! Careful with that, that's a very expensive wrench." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have you come to see our new design?" },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In theory, absolutely, though in practice it weighs about as much as a dwarf and heats up in the sun. I did build a breastplate from a rocket car's front panel once, and it stopped a goblin wrench beautifully, right before it melted." } },
      choices = {
        { text = "Tried and tested plate is best. Leave the experiments.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Every great armor started as somebody's experiment.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Replace? No, no, improve upon, perhaps, with better gears and no need for dinner. Though I admit my last mechanical hound followed a smell of oil straight back to our own workshop and bit Fizzle on the ankle." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, may I look at {pet}'s legs? Just a quick look? The knee joint alone would solve three problems I've had with the rear suspension." },
      },
      choices = {
        { text = "No machine can match a living bond with a beast.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If a machine works better, I'd use it gladly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "So the trolls say, and I've no reason to doubt them! I'd like to know whether it's magic or something in the mallet itself, because if it's engineering, I want the blueprints." } },
      choices = {
        { text = "Some things should stay troll secrets.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If there's a secret, it's meant to be found.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Wizzle.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That's a shame, because I'd have hired one if you'd said otherwise. Still, fire's fire, and I'd love to know if demon fire burns hotter than coal, just for science, of course." } },
      choices = {
        { text = "Science shouldn't play with fel fire.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel fire would make your car unbeatable.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Faith? Well, I have faith in tolerances and a well-tightened bolt, which has never once let me down. Though I'll admit that when the car leaves the line, I do find myself hoping very hard at something, and perhaps that's what you'd call a prayer." } },
      choices = {
        { text = "That hope is a prayer, Wizzle, and the Light hears it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Trust your bolts. Faith won't hold a car together.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Fairly is the goal, and Daisy keeps the times very strictly, but the goblins do love a shortcut, and I won't pretend we've never answered one with a shortcut of our own. It's all in good fun, mostly, until someone's car catches fire." } },
      choices = {
        { text = "Win it fairly, or the victory means nothing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If the goblins cheat, beat them at their own game.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because everything is machinery if you look closely enough, or at least that's what they taught us in Gnomeregan. I imagine a druid is a very clever machine that doesn't know it, and I mean that as the highest compliment I have." } },
      choices = {
        { text = "Measure away. Understanding never hurt anyone.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Nature isn't a machine. Some things can't be measured.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Marvelous, because I've been testing crash plating and I need someone to tell me what it feels like to be hit very hard." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! I've been meaning to build a mechanical tracking hound, and I'd love to see a real one at work first, purely for research." },
        { id = "h_default", key = true, text = "Wizzle Brassbolts, gnome engineer, at your service! I help design the cars for our team, and I'm quite sure this season's model is the best yet, assuming it holds together." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Did you know Gahz'rilla, the hydra in Zul'Farrak, can be summoned with a special mallet? It's the most fascinating thing, and I'd love a mage's view on how it works." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! Do you suppose your imps could help with engines? They like fire, and engines like fire, and I like engines that go fast." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Splendid, would you stand near the finish line? Statistically speaking, someone always needs patching up after the third heat, and it's usually a goblin." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Do you know, your armor has a lovely articulation at the elbow, and I'd love a look at the hinge, purely for engineering reasons, of course." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Fascinating, simply fascinating; I'd love to know how your shapeshifting works, mechanically speaking, if you'd ever let me take a few measurements." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Questions? I love questions!" } },
      choices = {
        { text = "Shapeshifting isn't machinery, Wizzle. Why measure it?", next = "xdruid", when = { class = "DRUID" } },
        { text = "How do you beat the goblins?", next = "b1_1" },
        { text = "Are you related to Fizzle?", next = "b2_1" },
        { text = "Is racing a good use of engineering?", next = "s_1" },
        { text = "A mallet summons a hydra?", next = "xmage", when = { class = "MAGE" } },
        { text = "Imps make poor engineers, Wizzle.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is there room for faith in engineering, Wizzle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is the rivalry with the goblins ever settled fairly?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could racing armor plate work for a warrior, Wizzle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could a machine ever replace a hunter's beast, Wizzle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Engineering, friend! The goblins strap a rocket to a crate and call it a car, while we actually calculate things like aerodynamics and fuel ratios." } },
      choices = { { text = "Do the goblins cheat?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Of course, the goblins win sometimes, but that's only because their rockets are bigger and they don't care if they explode." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Fizzle's on the team too, and we share a workshop and the family name. We argue about every bolt, which is how good engineering happens." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some in Ironforge say racing's a waste of good engineers. I say there's no better way to test a machine than to push it to its limits." } },
      choices = { { text = "Pushing limits is how you learn.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "There are better uses for your brains.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I'm not sure, friend, but I could probably build something to find out!" } } },
}
