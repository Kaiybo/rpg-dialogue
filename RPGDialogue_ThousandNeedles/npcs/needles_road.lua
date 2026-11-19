-- Thousand Needles between the towns: the canyon paths, the Shimmering Flats crews, and the quieter folk of Freewind Post.
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "paoka", id = TODO_NPC("Pao'ka Swiftmountain"), name = "Pao'ka Swiftmountain",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  impression = {
    first = "This young one wandered too far into the Needles.",
    third = "{name} met Pao'ka Swiftmountain, a young tauren lost in the canyons of Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Oh, you're not a centaur, thank the Earth Mother!" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I'm still here, sort of, if that's good news." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "A little, I won't lie, but the centaurs frighten me more, and you don't look like you want to eat me. If the Light walks with you, then I'd like to walk with you too, at least as far as Freewind." } },
      choices = {
        { text = "I'll get you home safe, Pao'ka. You have my word.", next = "BACK", reply = "Thank you, thank you, and I'll walk very close and very quiet, and I won't look at you funny, I promise.", fx = { align = { honor = 1 } } },
        { text = "Find your own way home. I've other work.", next = "BACK", reply = "Oh, I understand, everyone's busy, but if you see my uncle at Freewind, please tell him I'm still trying.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "My uncle says I'm too young to hold an axe properly, and after today I think he's right, because I dropped mine in the canyon running from the centaurs. When I'm older I want to stand with the braves at Freewind, if they'll have someone who gets lost this easily." } },
      choices = {
        { text = "Running was right. A warrior knows when not to fight.", next = "BACK", reply = "Really? Uncle said running was for cowards, but maybe he was only saying that so I'd practise harder.", fx = { align = { order = 1 } } },
        { text = "Next time, stand your ground. Courage comes with practice.", next = "BACK", reply = "I'll try, I really will, though my legs had other ideas, and they were very loud about them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I was following a hawk because I thought it would lead me to water, and then I was following another hawk, and then I wasn't sure which one I'd started with. I know now that hawks don't care where tauren need to go." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I followed one hawk, then another, and lost track of which was which. Is {pet} friendly? Could it walk on my side, between me and the centaurs, just for a little while?" },
      },
      choices = {
        { text = "Learn the trails before you wander off again.", next = "BACK", reply = "I will, I'll learn every one of them, and I'll never follow a hawk again, or at least not two hawks.", fx = { align = { order = 1 } } },
        { text = "Wandering is how you learn. Don't let this stop you.", next = "BACK", reply = "You think so? Then I'll keep wandering, but maybe with a map next time, and a lot more water.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I did want to, only later, after I'd seen something besides Mulgore. I thought the Earth Mother would wait for me, and she will, but I wasn't counting on the centaurs being out here too." } },
      choices = {
        { text = "See the world first. The Circle will wait for you.", next = "BACK", reply = "That's what I thought too, and I'm glad someone agrees, though I'll wait until my legs stop shaking.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Go home and study. Wandering nearly killed you.", next = "BACK", reply = "Maybe I should, but the books at home don't smell like the canyons, and I'd miss that.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "You're a warrior! That's good, that's really good, because the Galak are big and there are lots of them, and I've only got a gathering knife." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! You must know the canyons, then, and which way is home, because I've walked past this same rock three times now." },
        { id = "h_default", key = true, text = "I'm Pao'ka Swiftmountain, and I came out here to gather things for my family, but I got turned around in the canyons. The Galak centaurs are everywhere, and I don't think I can make it back to Freewind alone. I ate the last of my jerky yesterday, and my feet are all blisters." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Homeward Bound") }, text = "You'll walk me home? I'll stay close, I promise, and I'll run if I see centaurs, because I'm better at running than fighting." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You're a shaman! Could you ask the spirits for the way back to Freewind? I've gotten so turned around in these canyons." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "Are you a priest? My grandmother says priests can hear things the rest of us can't, so maybe you can hear the way back to Freewind." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "Are you a mage? Could you make a light? It gets dark in the canyons very fast, and I don't like the dark out here." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "I'm not scared, I promise. But please keep that thing on your side of the path." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Oh! You scared me, because I didn't hear you at all. Can you teach me to walk like that, so the Galak won't hear me either?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "You're a druid, from Thunder Bluff maybe? My mother wanted me to study with the druids, but I wanted to see the canyons first, and now look at me." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin? I've heard about the Forsaken, but nobody told me they could glow. Are you here to help me get back to Freewind?" },
      },
      again = { { id = "h_again", text = "What else? I'm listening, just a bit nervous, and the Earth Mother knows I've reason to be." }, { id = "h_again2", text = "Ask me anything; it helps to talk." } },
      choices = {
        { text = "Why didn't you want to study with the druids?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "You seem to have wandered a long way from home.", next = "b1_1" },
        { text = "Who's your family?", next = "b2_1" },
        { text = "Why are the centaurs dangerous?", next = "b3_1" },
        { text = "Freewind is my kin's home too.", next = "x_1", when = { race = "Tauren" } },
        { text = "You look frightened of the Galak, Pao'ka.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the Galak have magic of their own?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "You must have seen the Galak riders nearby.", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Maybe you should have stayed home.", next = "s_1" },
        { text = "Have you ever thought of becoming a warrior, Pao'ka?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How did you lose your way in the canyons, Pao'ka?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the Forsaken frighten you, Pao'ka?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
      lines = { { id = "b2_1_l", text = "The Swiftmountains, from Freewind Post up on the mesas. My father's a hunter and my mother keeps the hearth, and they've probably already sent every brave on the post looking for me." } },
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
      choices = { { text = "Adventure is worth a little danger.", next = "BACK", reply = "I think so too, and I'll remember it, though next time I'll bring more food and fewer hawks.", fx = { affinity = 1, align = { order = 1 } } }, { text = "Listen to your father. The world is dangerous.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I think so, because I saw one of them shout at the sky and the wind came down like a hand. If you have magic too, maybe they'll leave us alone on the way home, and I really hope they do." } },
      choices = {
        { text = "Stay close to me. I'll keep you safe.", next = "BACK", reply = "I will, as close as a calf to its mother, and I'll try not to step on your heels.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep up. I won't be waiting for you.", next = "BACK", reply = "I'll run, I promise, and I'm quite fast when there are centaurs behind me, so I'll keep up.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "On the trail back toward Freewind, which is the trail I need, of course. There were three of them, and they stopped at the bend as if they were waiting for something, maybe for me." } },
      choices = {
        { text = "We'll go around them. No fighting if we can help it.", next = "BACK", reply = "Yes, please, going around sounds much better than going through, and I know a little path by the rocks.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then we'll ambush them at the bend first.", next = "BACK", reply = "An ambush? I've never seen one, and I'm not sure I want to, but I'll stay behind you and be very small.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Very, because they ride faster than I can run, and they shout things at me I don't understand. My grandmother says the earth won't let a tauren come to harm in the Needles, but I think the earth is very busy." } },
      choices = {
        { text = "Listen to your grandmother. The elders know these canyons.", next = "BACK", reply = "I will, and I'll tell her you said so, and she'll be very pleased, because she always says she's right.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Don't wait on elders or spirits. Trust your own feet.", next = "BACK", reply = "My feet got me lost in the first place, but I'll try, if you'll walk in front of them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    centaur = { { id = "tp_centaur", text = "The Galak are big and fast and there are so many of them, and they chased me all the way across the canyon. I never want to see a centaur again, ever, unless it's from very far away." } },
    cairne = { { id = "tp_cairne", text = "Cairne is the High Chieftain, and my uncle says I'm too young to even think about meeting him. I think about it anyway, all the time." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother kept me safe, I think, or maybe it was you. Maybe it was both, and maybe she sent you, which would be very nice of her." } },
    grimtotem = { { id = "tp_grimtotem", text = "My uncle says the Grimtotem are tauren, but they don't act like tauren. I saw some of them on the canyon road, and they looked at me the way the centaur did." } },
    _none = { { id = "tp_none", text = "I don't know, but I'm only young, so maybe that's fine." } },
  },
}

P:NPC {
  key = "kanati", id = TODO_NPC("Kanati Greycloud"), name = "Kanati Greycloud",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  impression = {
    first = "He watches the Grimtotem and the Galak with equal wariness.",
    third = "{name} met Kanati Greycloud of Freewind Post in Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Peace, friend. You've come a long way up the mesas." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The wind keeps blowing you up here, same as the dust off the plains." },
  },
  notice = {
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Your soul has been set in a stone, I see, and it hangs on you like a tether running back to some warlock's hand. The winds up here would carry a spirit home on their own, but each of us walks our own path." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The Grimtotem think little of anyone who isn't Grimtotem, and less of the Horde's new allies. They would call you an abomination and I would call you a guest, and that difference is why they hold the pinnacles and we hold Freewind." } },
      choices = {
        { text = "I'll stand with Freewind against the Grimtotem.", next = "BACK", reply = "Then you are more than a guest, and Freewind will remember that, though the Grimtotem will too.", fx = { align = { order = 1 } } },
        { text = "The Grimtotem's quarrel isn't mine. I'll keep out of it.", next = "BACK", reply = "That is your right, and I will not press you, but they will not keep out of yours if you walk their canyons.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because I watch their camps and send word to Freewind, and they have learned whose eyes those are. A warrior at my side means they must come at me openly, and the Galak have never cared for a fair fight." } },
      choices = {
        { text = "I'll guard you, and Freewind can answer them properly.", next = "BACK", reply = "Then I will feel safer than I have in a long while, and the Galak will think twice before they come.", fx = { align = { order = 1 } } },
        { text = "Let me hunt their killers down first, before they strike.", next = "BACK", reply = "Brave, and perhaps foolish, but if you find them before they find me, I will thank the Earth Mother twice.", fx = { align = { order = -1 } } },
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
        { text = "I'll scout and report. Freewind can decide what's done.", next = "BACK", reply = "That is the wise path, and Freewind will act on what you bring back, I promise you that.", fx = { align = { order = 1 } } },
        { text = "I'll strike them where they drink, while they're careless.", next = "BACK", reply = "They will be careless, yes, but not foolish, so strike quickly and be gone before they gather.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They claim the high places and drive off anything that isn't theirs, beast and tauren alike. The mesas were meant to be shared, and the Grimtotem have forgotten it." } },
      choices = {
        { text = "Cairne should send braves to drive them off.", next = "BACK", reply = "He would, perhaps, but Cairne also hopes they will come home, and that hope keeps his hand still.", fx = { align = { order = 1 } } },
        { text = "Let each camp defend its own mesa.", next = "BACK", reply = "Then the weaker camps will fall, and the Grimtotem will grow, and I do not think that is what you want.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It would help, because they've grown bold, and my braves are too loud to get close. Find out how many warriors they keep at the pinnacle, and we'll know how many we need to send." } },
      choices = {
        { text = "I'll scout for Freewind, and gladly.", next = "BACK", reply = "Thank you, and bring back the count, because numbers are worth more to Freewind than any trophy.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll strike while I'm there.", next = "BACK", reply = "If you must, but come back alive, because a dead scout tells us nothing, however brave.", fx = { align = { order = -1 } } },
        { text = "Something else, Kanati.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The winds fear what does not belong to this world, and your power is one of those things. I do not judge you for it, but I will not pretend the land welcomes you as gladly as I do." }, { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "The winds fear what does not belong to this world, and they have died away entirely since your servant came to stand beside you. I do not judge you for it, but I will not pretend the land welcomes it, or you, as gladly as I do." } },
      choices = {
        { text = "Then the land will have to learn to live with me.", next = "BACK", reply = "Perhaps it must, but it will remember what you do, and I hope it remembers something kind.", fx = { align = { light = -1 } } },
        { text = "I'll walk carefully. I mean no harm here.", next = "BACK", reply = "Then walk carefully, and the winds may grow used to you, as I have, little by little.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Because they believe all the Needles are theirs, and every tauren who passes is a thief to them. I do not hate them for it, but I will not let them take another of our people, and I've seen too many of our wounded left in the canyons." } },
      choices = {
        { text = "I'll heal anyone the Galak hurt, and stand with you.", next = "BACK", reply = "Then you are welcome beside me, healer, and I will be glad of your hands when the spears fly.", fx = { align = { light = 1 } } },
        { text = "The Galak earned what's coming to them. I'll fight first.", next = "BACK", reply = "They have earned some of it, but not all, and I would rather we did not forget the difference.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They fear what they don't understand, like any people. The Galak have their own shamans, crude ones, but a ball of fire falling from the sky sends them running faster than anything my spear can do." } },
      choices = {
        { text = "I'll use only as much fire as I must.", next = "BACK", reply = "That is wise, and the canyon will thank you, because fire spreads faster than any of us can run.", fx = { align = { order = 1 } } },
        { text = "Then I'll rain fire until they never come back.", next = "BACK", reply = "They will come back eventually, as they always do, but I will not deny that the sight would please me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
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
          text = "The winds grow still when you pass, and I wonder what they fear. You are of the Horde, so I welcome you, but I ask you to walk carefully here." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, on the road beneath Freewind. I'd be glad of your company, because the Galak strike at travellers in the canyons, and they do not spare the wounded." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage of the Horde. The Galak fear fire more than spears, so I'd be glad to have you close if they come down from the cliffs." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Galak", min = 25 } }, text = "The Galak below the mesa are fewer than they were, and I have seen you on the canyon road often enough to know why. Be careful, because they will come looking for you." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin, with the Light still in you. Freewind watches everything that climbs these mesas, and you are a new thing to watch." },
      },
      again = { { id = "h_again", text = "What else, friend? Speak; the mesa has time, even if the Galak do not give us much of it." }, { id = "h_again2", text = "Speak, friend." } },
      choices = {
        { text = "What are the Grimtotem doing to the mesas?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I've heard little of the Grimtotem.", next = "b1_1" },
        { text = "What of the Galak centaurs?", next = "b2_1" },
        { text = "Living up here can't be easy.", next = "b3_1" },
        { text = "The spirits here feel restless.", next = "x_1", when = { class = "SHAMAN" } },
        { text = "Should the Grimtotem be forgiven?", next = "s_1" },
        { text = "Should I scout the Grimtotem for you, Kanati?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I didn't think the winds could fear anything.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why would the Galak send killers after you, Kanati?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Which of the Galak's trails should I follow, Kanati?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why do the Galak strike at travellers, Kanati?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the centaur fear magic, Kanati?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What would the Grimtotem think of a Forsaken paladin, Kanati?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They are tauren, like us, but they follow Magatha Grimtotem and reject Cairne's way. They want the land to themselves and they don't care who they hurt to take it." } },
      choices = { { text = "What are they doing here in the Needles?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Here in the Needles they've built camps on the high mesas, and they harass anyone who crosses their path. Some are kin we once shared fires with." } },
      choices = { { text = "Can they be reconciled?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "I don't know, friend, and that is the hardest part. It is one thing to fight a stranger, and another to fight a cousin." } },
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
      choices = { { text = "Cairne is wise. Leave the door open.", next = "BACK", reply = "Cairne is wiser than I am, and I will keep the door open, though I will keep my spear beside it.", fx = { affinity = 1, align = { light = 1 } } }, { text = "They chose their path. Let them walk it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem hold Darkcloud Pinnacle and look down on the rest of us, in more ways than one. I watch them as closely as I watch the Galak, and I trust them less." } },
    centaur = { { id = "tp_centaur", text = "The Galak raid the canyon roads, and the Grimtotem do nothing to stop them. I've begun to wonder if they've made some kind of bargain." } },
    cairne = { { id = "tp_cairne", text = "Cairne trusts the Grimtotem more than I would. He's a great chieftain, but he has a blind spot for Magatha, and it may cost us." } },
    razorfen = { { id = "tp_razorfen", text = "The Razorfen Downs lie to the north, and the quilboar there have gone strange. I've heard talk of a lich, and I'm not sure I believe it, but I'm not sure I don't." } },
    _none = { { id = "tp_none", text = "The winds haven't spoken of that to me." } },
  },
}

P:NPC {
  key = "motega", id = TODO_NPC("Motega Firemane"), name = "Motega Firemane",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  prejudice = { class = "WARLOCK", amount = 10, why = "Fights the Grimtotem's bargains with dark powers; sees warlockry as the same bargain." },
  impression = {
    first = "He has had enough of the Grimtotem and isn't shy about it.",
    third = "{name} met Motega Firemane, a tauren at Freewind Post in Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Welcome, traveler. Come, but watch your step on the mesa edges." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Good; the Earth Mother keeps those who walk her paths, though she lets them get very dusty on the way." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "The Grimtotem trade their honour for power they cannot hold, and so do you. I'll speak with you because Freewind needs help, not because I want to." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I have no kind words for those who bargain with demons. Tell me what you want, and do not offer me anything." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "I expected you to sell yourself to whatever you call, as the Grimtotem do. You haven't yet, and I've noticed." },
  },
  notice = {
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "You wear a demon's hide like armour, and I'll admit it would turn a Grimtotem spear better than my own leathers. Still, I'd rather not see what it does when you take it off." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They stand against everything that isn't theirs, the Light included. They want the Needles for their own and they'd see every tauren of Freewind thrown off the mesas, so if your Light burns them, it can burn them here." } },
      choices = {
        { text = "I'll fight them openly, as a paladin should.", next = "BACK", reply = "Then they will see the Light coming, and they will learn what it means to face it.", fx = { align = { honor = 1 } } },
        { text = "I'll strike where they least expect it.", next = "BACK", reply = "They will not expect it, and they will deserve it, so strike well and come back to us.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Without thanks and without limit, because Magatha teaches them that the land is theirs by right and owes them nothing back. I have found kills left to rot on the canyon floor with only the hides taken, and that is not hunting, that is spite." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Without thanks and without limit, and they would put a chain on a beast like {pet} and call it mastery. You let it walk beside you as an equal, and that is the difference." },
      },
      choices = {
        { text = "I take only what I need, and thank the land for it.", next = "BACK", reply = "Then you hunt as the Earth Mother intended, and the land will give you its best in return.", fx = { align = { honor = 1 } } },
        { text = "The land gives what it gives. Thanks feed no one.", next = "BACK", reply = "Thanks feed the spirit, if not the belly, and a hunter without thanks soon finds the land empty.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Power, the same as she wants in Thunder Bluff, only out here no one watches her. The Grimtotem hold Darkcloud Pinnacle, and every season they take a little more of the canyon around it." } },
      choices = {
        { text = "Bring the matter before Cairne and let him judge.", next = "BACK", reply = "Cairne is wise, and he will listen, but he is slow to act against his own kin, and Magatha knows it.", fx = { align = { honor = 1 } } },
        { text = "Strike the Pinnacle without warning. She'd do the same.", next = "BACK", reply = "She would, and that is exactly why I fear doing the same, because then we would be no better than her.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "No, but power without the Earth Mother's blessing is power that goes astray. Magatha's followers forgot that, and now they kill their own kin for land that was never theirs to take." }, { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "No, but power without the Earth Mother's blessing goes astray, and I can feel it straining at your side even now. Magatha's followers forgot that blessing, and now they kill their own kin for land that was never theirs to take, so hold yours tighter than they hold theirs." } },
      choices = {
        { text = "Power is power, Motega. I'll use it wisely, in my own way.", next = "BACK", reply = "Then use it wisely, and remember those who forgot, because their road ends at Darkcloud Pinnacle.", fx = { align = { light = -1 } } },
        { text = "You're right. I'll remember the Earth Mother.", next = "BACK", reply = "Good, and the Earth Mother will remember you too, which is more than she will do for Magatha's followers.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I would have you strike them however they fall fastest, for they have stopped fighting with honor. I'd rather a clean fight in the open, but I'll not mourn a Grimtotem who never saw the blade." } },
      choices = {
        { text = "Even the Grimtotem deserve an honest fight.", next = "BACK", reply = "They do, perhaps, but they have stopped giving one, and I will not ask you to fight with one hand tied.", fx = { align = { honor = 1 } } },
        { text = "Honour's wasted on traitors. I'll strike unseen.", next = "BACK", reply = "I cannot argue, though it grieves me to agree, and I hope my father would forgive me for saying so.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. The Grimtotem hunt these mesas too, and they hunt like thieves, taking more than the land can give, which shames every tauren who sees it." },
        { id = "h_default", key = true, text = "I am Motega Firemane, and I keep watch at Whitereach Post for Freewind. The Grimtotem grow bolder each season, and someone has to stand against them before they take the whole of the Needles." },
        { id = "h_c0", when = { race = "Tauren" }, text = "A fellow tauren who walks the Earth Mother's path, not Magatha's. You are welcome at my fire." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "You walk the Earth Mother's path as a druid should, but Magatha's people bend the spirits to their will, and I would hear what you make of that." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman! Good, because the Grimtotem call on the elements too, and I want someone at Freewind who can call back louder." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The Grimtotem have shamans of their own and they'd love to prove the spirits favor them, so stand with Freewind and let your prayers answer theirs." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. The Grimtotem think the Needles belong to them, so I'd very much like to see your fire prove them wrong at Darkcloud Pinnacle." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "The Grimtotem bargain with powers they do not understand. There is a smell on you that tells me you bargain too, and I hope you understand yours better." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I know a demon's bargain when I smell one, and you reek of it. Say what you came for, quickly." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You still bargain, I think, but you seem to keep the better end of it. Very well; speak." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue of the Horde. The Grimtotem are many, and they fight like cornered bulls, but a blade in the dark is something they don't expect." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The Grimtotem would spit at you, so you're already on my side." },
      },
      again = { { id = "h_again", text = "What else? Speak plainly, the way the Bloodhoof do." }, { id = "h_again2", text = "Ask, if you have more." } },
      choices = {
        { text = "What does Magatha want from the Needles?", next = "druid_q", when = { class = "DRUID" } },
        { text = "The Grimtotem seem to be up to something.", next = "b1_1" },
        { text = "Why not go back to Mulgore?", next = "b2_1" },
        { text = "What of the goblins in the Flats?", next = "b3_1" },
        { text = "I'll take the fight to them.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "What would you have a shaman do against the Grimtotem, Motega?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "The Grimtotem's spellcasters must be strong.", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "You seem hard on the Grimtotem.", next = "s_1" },
        { text = "What I hold is not the Grimtotem's kind of power, Motega.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would you have me strike the Grimtotem unseen?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "How do the Grimtotem hunt the Needles, Motega?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Would the Grimtotem stand against the Light, Motega?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They have taken the high mesas to the north and claim them for Magatha. They shoot at our riders and send warnings that we should leave." } },
      choices = { { text = "Why not fight them?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "We do, when they come at us, and we will not leave, because Freewind is ours as much as anyone's. But we cannot fight them on every mesa at once." } },
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
      choices = { { text = "Your anger is earned. Use it.", next = "BACK", reply = "I will, and it will be a weapon for Freewind, not for myself, or so I hope.", fx = { affinity = 1, align = { light = 1 } } }, { text = "Anger will make you as bad as them.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Strong enough, and proud of it, because they believe the Earth Mother's spirits answer to their clan before any other. They are wrong, but being wrong has never made anyone weaker, so go carefully if you go up there." } },
      choices = {
        { text = "I'll face them openly and show them they're wrong.", next = "BACK", reply = "Then go openly, and let them see it, because a lesson learned in front of everyone is a lesson that stays learned.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find their weakness and strike there.", next = "BACK", reply = "That is a hunter's wisdom, and it may serve you better than mine, so go carefully and strike true.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Stand in front of them with your totems planted and show them the Earth Mother doesn't belong to their clan. Magatha's people think the spirits are theirs to command, and I'd like to watch them learn otherwise." } },
      choices = {
        { text = "The spirits belong to all tauren, and I'll say so openly.", next = "BACK", reply = "Then say it loud enough for the Pinnacle to hear, and I will stand beside you when you do.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them think they command the spirits. Surprise works better.", next = "BACK", reply = "Surprise has its place, and perhaps the spirits will enjoy the joke, but they will not forgive you if you misuse them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem are a stain on the tauren, and I'm tired of pretending they're not. They murder our people and smile at our chieftain, and someone needs to say it." } },
    cairne = { { id = "tp_cairne", text = "Cairne is a great chieftain, but he's too patient with Magatha. One day she'll show him what she really is, and I hope it isn't too late." } },
    centaur = { { id = "tp_centaur", text = "The Galak are honest enemies, at least. They want to kill me, and they say so, and I respect that more than a Grimtotem smile." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother would weep to see what the Grimtotem have become. I've wept for her, and now I'm angry instead." } },
    _none = { { id = "tp_none", text = "That I do not know, friend." } },
  },
}

P:NPC {
  key = "razzeric", id = TODO_NPC("Razzeric"), name = "Razzeric",
  rivals = { "fizzle", "wizzle" },
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  impression = {
    first = "He treats every lap like his last, and some almost were.",
    third = "{name} met Razzeric, a goblin racer at the Mirage Raceway in Thousand Needles.",
  },
  greetings = {
    { id = "g_main", text = "Hey! You lookin' at my car, pal? Don't touch, it's still warm, and the last fella who touched it is still payin' off the burn ointment." },
    { id = "g_back", when = { metBefore = true }, text = "My biggest fan's back! Ha, I knew you'd come round, buddy, they always do once they've seen me crash." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nerve? Pal, I've got nerve coming out my ears, along with a fair bit of smoke from the last crash. Same as you charging into a fight, really, except your armor doesn't blow up when you hit a rock." } },
      choices = {
        { text = "Nerve is nothing without control. Know when to brake.", next = "BACK", reply = "Control? Pal, my brakes caught fire two races ago, so I've been controlling things with prayer and steering.", fx = { align = { order = 1 } } },
        { text = "Full speed and no brakes. That's how you win.", next = "BACK", reply = "Now that's a racer talking, buddy, and if you ever want a seat, I'll find one that's only blown up once.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "All the time, pal! Last week a tortoise sat right on the finish line, and I swerved so hard I took out the timing post, and Daisy, our timekeeper, is still billing me for it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "All the time, pal, so keep {pet} off the track, all right? I like animals fine, I just don't wanna hit one at full throttle, because the repairs come outta my wages." },
      },
      choices = {
        { text = "The beasts were here first. Slow down for them.", next = "BACK", reply = "I'm trying, pal, honest, but the tortoise isn't, and it's very good at sitting exactly where I need to be.", fx = { align = { honor = 1 } } },
        { text = "If they sit on the track, that's their problem.", next = "BACK", reply = "My thinking exactly, buddy, though Daisy still billed me for the timing post, so maybe it's my problem too.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That's what the last one said too, pal! Still, if you're honest, you're welcome to watch me win, because I don't need sabotage when I've got this engine, and this engine cost more than my house." } },
      choices = {
        { text = "Fair races are the only ones worth winning.", next = "BACK", reply = "Easy to say when you're not the one losing, pal, but sure, I'll win fair this time, mostly.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A win's a win, however you get it.", next = "BACK", reply = "There's a goblin philosophy if I ever heard one, buddy, and I'll drink to it after the heat.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's the risk I take every lap anyway, buddy! Pozzik won't let me try it, says it's cheating, but I say it's just engineering with a bit of sparkle, and sparkle sells tickets." } },
      choices = {
        { text = "Pozzik's right. Magic in a race is cheating.", next = "BACK", reply = "Pozzik says that too, and Pozzik's the boss, so I guess I'll keep my sparkle in my pocket.", fx = { align = { order = 1 } } },
        { text = "Rules are for slow racers. Try it.", next = "BACK", reply = "Ha, now you're my kind of fan, pal, and if I try it, I'll make sure you've got a front row seat.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Afraid? Sure I'm afraid, friend, every single lap, and that's what makes it worth doing. If I go out in a blaze on the Shimmering Flats, at least they'll talk about it in Booty Bay for a month, and most goblins only get talked about at their debt hearings." } },
      choices = {
        { text = "No gossip's worth your neck. Race a little slower.", next = "BACK", reply = "The cliff path's the only fun part, pal, but I'll think about it, maybe, after I win a few more.", fx = { align = { light = 1 } } },
        { text = "A blaze of glory beats a long, dull life.", next = "BACK", reply = "That's the spirit, buddy, and if I go, I'll make sure they hear it all the way to Booty Bay.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "There's no wildlife on the Flats worth mentioning, pal, unless you count the gnomes, and they frighten easily. A few basilisks come round to watch sometimes, and I swear one of 'em cheers, though it never buys a ticket." } },
      choices = {
        { text = "Race where you like. The flats belong to no one.", next = "BACK", reply = "Exactly, pal, the flats are mine on race day and the basilisks' on every other day, and that seems fair.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Mind the beasts. Even a salt flat has its residents.", next = "BACK", reply = "I'll try, buddy, but the basilisk that cheers is the only one I'm really worried about hurting.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I know they are, and they know I know, and they think I'm sabotaging them too, which I am, a little. It's racing, friend, and a race without a bit of mischief is just two cars driving in a circle." } },
      choices = {
        { text = "Win it honestly. Sabotage cheapens the race.", next = "BACK", reply = "Honestly, pal? That's a gnome word, but I'll give it a try, if they stop loosening my wheels.", fx = { align = { order = 1 } } },
        { text = "If they're cheating, you'd be a fool not to.", next = "BACK", reply = "Exactly what I keep telling Pozzik, buddy, and he keeps telling me to drive faster instead.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "You've been hangin' around the gnome pit, I hear. That's fine, pal, everybody loves a sad story, but come and watch a real car when you're done." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "The gnomes can't stand you, which means you've got taste. Want to see where I scraped the wall last heat?" },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "Whoa, armour! Hey, you wanna sit in the car? No? Smart, because the last guy in plate who sat in it cracked the axle clean through." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Hey, can you track a thief? Because somebody keeps moving my spare parts, and I'm pretty sure it's a gnome." },
        { id = "h_default", key = true, text = "Razzeric, the fastest goblin on the Shimmering Flats! I race for the goblin team, pal, and every time I take the car out, the gnomes start sweating, and so does my mechanic, 'cause I still owe him for the last engine and the one before that." },
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
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You've come to bless the car, I hope, because the gnomes have been at it with their spanners and I could use all the help I can get." },
      },
      again = { { id = "h_again", text = "What else, pal? Talk quick, like me, because the next heat won't wait." }, { id = "h_again2", text = "More? Sure, I got a minute between laps." } },
      choices = {
        { text = "Doesn't the racing frighten the wildlife out here?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Racing out here looks like madness.", next = "b1_1" },
        { text = "Is it safe?", next = "b2_1" },
        { text = "What's the prize?", next = "b3_1" },
        { text = "I bet you've got a trick or two in that car.", next = "x_1", when = { class = "ROGUE" } },
        { text = "Would you really cheat with the wind, Razzeric?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What could magic do for the goblin team?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Racing hardly seems worth the danger.", next = "s_1" },
        { text = "I don't sabotage cars, Razzeric.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Magic in your car might blow it apart, Razzeric.", next = "xmage", when = { class = "MAGE" } },
        { text = "Aren't you afraid of dying in that car?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does a racer need a warrior's nerve, Razzeric?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "The flats' beasts must wander onto the track sometimes, Razzeric.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you think the gnomes are sabotaging you, Razzeric?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "You strap yourself into the fastest machine money can buy, or the fastest Pozzik could afford, point it at the far end of the Flats, and pray. The salt's flat, pal, but the rocks aren't, and neither are the gnomes." } },
      choices = { { text = "The gnomes cheat?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The gnomes have their own team with Fizzle and the rest, and they cheat, or at least I think they cheat. We'd never do that, of course." } },
      choices = { { text = "You'd cheat too?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Of course we would, actually, but we're better at it. Don't tell Kravel I said that, because that dwarf tells the gnomes everything." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Safe? Buddy, I've crashed more times than I've won, and I've won a lot, and every crash comes with a repair bill. That's just racing." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Glory, money and braggin' rights over the gnomes, mostly the last one. Pozzik keeps the books, pal, and he says we're up this season, though he says that every season." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Ha! You've got a good eye, friend, and a quiet mouth, I hope. What's under the hood stays under the hood." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Pozzik says I'm crazy to keep racing, pal. I say a goblin without risk is just a banker with a hat." } },
      choices = { { text = "Life's short. Race fast.", next = "BACK", reply = "My kind of thinking, pal, and if you ever want a ride, I've got a spare seat that's only a little singed.", fx = { affinity = 1, align = { order = 1 } } }, { text = "You'll get killed for nothing. Slow down.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Pozzik says no magic on the track and Daisy writes everything down, so officially, nothing. Unofficially, if a little frost kept the engine cool between heats, I don't see how anybody could complain." } },
      choices = {
        { text = "Unofficially, I could cool your engine.", next = "BACK", reply = "Unofficially, pal, you're my new favourite person, so meet me behind the shed between heats.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Rules are rules. Win it fair, Razzeric.", next = "BACK", reply = "Fair, fair, everybody wants fair, pal, but fine, I'll win it fair and then gloat about it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Cheat's a strong word, pal, and besides, Daisy would catch it on her stopwatch and Pozzik would dock my pay. The flats get gusty in the afternoons anyway, so I just make sure I'm racing in the mornings." } },
      choices = {
        { text = "Win it fairly, Razzeric, or the win means nothing.", next = "BACK", reply = "Means plenty to the purse, pal, but fine, I'll race fair, and I'll still win by a length.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A little wind on the gnomes' side wouldn't hurt anybody.", next = "BACK", reply = "Ha, now you're thinking like a goblin, buddy, and I'll owe you a drink if the gnomes blow off course.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got the money, pal, and the money's what keeps this track running. Every bet on the Flats goes through a Gadgetzan bookie, and every bookie takes a cut." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel sponsors most of the races on the Flats, and they want to see goblins win. I want to see goblins win too, mostly because I'm the goblin in the car." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes lost their city, and now they've got nothing to do but build race cars. I'd feel sorry for 'em if they weren't so fast." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the best mechanics in the world, pal, and I've been tryin' to hire one for three seasons. They keep sayin' no, on account of my last three mechanics." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, but if it's fast, I want to drive it, and if it explodes, I want to drive it twice." } },
  },
}

P:NPC {
  key = "daisy", id = TODO_NPC("Daisy"), name = "Daisy",
  bible = "bibles/thousandneedles.md", role = "citizen", tier = "service",
  impression = {
    first = "She has no patience for anyone who slows the track down.",
    third = "{name} met Daisy, the timekeeper at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_main", text = "Hey! Step back from the line, hon, because the next lap's coming through, and I'm not paying for anybody's funeral." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Watching the races, or getting in the way?" },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They try, hon, but I keep the stopwatch running whatever happens, and a racer who stops to throw a punch loses the heat and the purse. It's done wonders for the peace around here, because nobody fights while there's money on the clock." } },
      choices = {
        { text = "Rules keep the peace. Good for you, Daisy.", next = "BACK", reply = "Thanks, hon, it's nice to be appreciated, especially by somebody who isn't trying to bribe me.", fx = { align = { order = 1 } } },
        { text = "Some fights matter more than any race.", next = "BACK", reply = "Maybe so, hon, but on my track, the race matters more, so take the fight outside the fence.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A good stopwatch and better eyes, though the dust off the flats doesn't help, and the heat makes the far end of the track shimmer like water. Some days I swear I've timed a mirage, and then the car turns up a minute later and makes a liar of me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A good stopwatch and better eyes, hon. Keep {pet} by you while the heats run, though, because the last hunter's wolf chased a car to the finish and set a better time than the gnomes." },
      },
      choices = {
        { text = "Honest times matter. Nobody should ever doubt the clock.", next = "BACK", reply = "That's my motto, hon, and I've got it painted on the back of my stopwatch so nobody forgets it.", fx = { align = { honor = 1 } } },
        { text = "A close race could go either way, and nobody would notice.", next = "BACK", reply = "Not on my watch, hon, and I mean that, because I'd notice, and the crews would notice, and then there'd be trouble.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Far enough to cross the finish line before anyone else, hon, and past that it's somebody else's problem and somebody else's insurance. I've got enough trouble keeping the goblins and gnomes honest without mages making it worse." } },
      choices = {
        { text = "I'd never cheat a race with magic.", next = "BACK", reply = "Good to hear, hon, because I've got a mage-proof stopwatch, and it's very touchy about cheaters.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If you can't catch it, it's not cheating.", next = "BACK", reply = "I catch everything, hon, so I'll be watching you, and the next time you get clever, I'll write that down too.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Both crews, on a bad day, and Kravel always seems to know who and for how much. I don't trust him, hon, and I don't trust anyone who looks at my stopwatch too long, so keep your eyes on the track." } },
      choices = {
        { text = "Fixed times ruin the race. I'd never touch it.", next = "BACK", reply = "Glad to hear it, hon, because Kravel's always looking for new friends, and I'd hate you to be one of them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything's for sale out here.", next = "BACK", reply = "Not my stopwatch, hon, and I'll thank you to keep your hands off it while I'm talking.", fx = { align = { honor = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A kodo, once, that got loose from somebody's caravan and ran most of the track before anyone could catch it. I gave it a respectable time, too, and it beat two of the gnome cars, which nobody has let them forget." } },
      choices = {
        { text = "Let the kodo race next season. It earned it.", next = "BACK", reply = "I'd give it a lane, hon, if Pozzik would let me, because it ran a cleaner race than half the drivers.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Beasts belong in the wild, not on a racetrack.", next = "BACK", reply = "You're probably right, hon, though it looked like it was having the time of its life out there.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "After every race, hon, from whoever came second and lost their bet. Pozzik and Fizzle both swear I favour the other side, which I take as proof I'm doing the job right, because if only one of 'em were angry I'd be in trouble." } },
      choices = {
        { text = "Fair times are worth a little anger. Stay honest.", next = "BACK", reply = "That's what I tell myself every night, hon, and it helps when somebody's shouting at me about their bet.", fx = { align = { order = 1 } } },
        { text = "Tilt the clock a little. Nobody would know.", next = "BACK", reply = "I'd know, hon, and that's one person too many, so the clock stays straight.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Enough that I keep a count of it on the back of my time sheets, and the count's not small. Pozzik says it's part of the sport, but I've seen a driver pulled from a fire, and I didn't think it looked much like sport." } },
      choices = {
        { text = "Then I'll stay close, and help when it happens.", next = "BACK", reply = "Bless you, hon, and I'll keep a bucket of water near the line for when you need it.", fx = { align = { light = 1 } } },
        { text = "They know the danger when they climb in.", next = "BACK", reply = "They do, hon, but that doesn't make it any easier to watch them pulled out of the wreck.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. If you're here to brawl with the gnome crew, do it off the track, because I'm not stopping the clock for anybody's broken nose." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter? Good eyes, then, and you'll know how hard it is to watch something moving fast, which is my whole job." },
        { id = "h_default", key = true, text = "I'm Daisy, hon, and I keep the times at the Mirage Raceway. If it happens on the track, I've got it on my stopwatch, so nobody argues about who won or who gets paid, and the goblins argue anyway, mostly with the stopwatch." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You're a shaman? Then don't go calling lightning down on my track, because the last storm cost me a whole afternoon of times." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. If you're praying for one team or the other, kindly do it off the track, because I don't time prayers." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "Keep that thing of yours off the track, because if it runs across during a heat it's getting a time, and you won't like what I write next to it." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Don't you dare blink across my finish line, because I can't time a racer who skips half a length, and the gnomes would argue about it for a week." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You've got quick hands, hon, I can tell. Keep 'em away from my stopwatch, because there's more than one crew that would pay good gold to have it run slow, and I've turned down better offers than yours." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! If you ever want your running shape timed on the track, I'll do it, though the racers might get jealous." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Good, maybe the drivers will stop accusing me of fixing the times if someone like you is standing next to me." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Stand over here, by the clock, because I'd rather you were close when the next car comes off the track." },
      },
      again = { { id = "h_again", text = "What else, hon? Make it quick, because the clock is running and it never stops for anybody." }, { id = "h_again2", text = "Make it fast; the cars sure are." } },
      choices = {
        { text = "What's the strangest thing you've timed out here?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Someone must be winning.", next = "b1_1" },
        { text = "Is the job dangerous?", next = "b2_1" },
        { text = "Do the racers ever cheat?", next = "s_1" },
        { text = "Has a storm really stopped a race, Daisy?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Someone must have tried to use magic on the races.", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Mages can't really blink that far, Daisy.", next = "xmage", when = { class = "MAGE" } },
        { text = "Someone must be paying to fix the times.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do brawls ever stop the races, Daisy?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "How do you keep time on cars that fast, Daisy?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "People must accuse you of cheating, Daisy.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do many racers get hurt, Daisy?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Depends on the day and who's been tinkering with what, hon. The goblins are fast, but the gnomes are clever, and clever wins when the goblins blow an engine, which is about every third heat." } },
      choices = { { text = "You don't take sides?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Not me, hon. My stopwatch is the only fair one on the Flats." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Only if you stand where the cars are, hon. I've learned to stand behind the rocks and duck when I hear the engines." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Everybody tries something, hon, from tweaked engines to bent fuel to a little gold slipped to the wrong official. My job's to time 'em, not to judge 'em, but I see it all." } },
      choices = { { text = "Cheaters should be disqualified. Fair is fair.", next = "BACK", reply = "They should be, hon, and I'd do it in a heartbeat, if anybody ever let me write the rules.", fx = { affinity = 1, align = { honor = 1 } } }, { text = "Racing's about winning. Let them cheat.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Only every other week, and they always think they're the first to try. The gnomes accused a goblin of hexing their engine last season, the goblins accused the gnomes of warding theirs, and I wrote both down as engine trouble." } },
      choices = {
        { text = "Good. Honest times matter, even out here.", next = "BACK", reply = "Glad you think so, hon, because I've had both crews threatening my stopwatch this season.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A clever cheat deserves to win once in a while.", next = "BACK", reply = "Once in a while, hon, maybe, but not on my watch, because my stopwatch doesn't care how clever you are.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "One came off the salt flats last season and blew the gnomes' car clean off the track, and the gnomes blamed the goblins for it. I wrote it down as weather, because that's what the stopwatch says, and the stopwatch doesn't take sides." } },
      choices = {
        { text = "Good. The record should be honest, whoever it helps.", next = "BACK", reply = "That's how I see it, hon, and if the gnomes don't like it, they can argue with the weather.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You could have sold that result to the goblins.", next = "BACK", reply = "I could have, hon, and I'd have been rich for a week and out of a job for the rest of my life.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's where the money comes from, and the money's what keeps me on this track. Every second you waste is coin out of somebody's pocket, so let's not waste any." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel likes a good race, and they like a fast one even better. I keep the races fast, and they keep paying me." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay runs a tight schedule on the boats, and I respect that. I'd run a tighter one, if they let me." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, hon. I only know what happens on the track, and what it pays." } },
  },
}

P:NPC {
  key = "wizzle", id = TODO_NPC("Wizzle Brassbolts"), name = "Wizzle Brassbolts",
  rivals = { "pozzik", "razzeric" },
  bible = "bibles/thousandneedles.md", role = "citizen", tier = "service",
  impression = {
    first = "He is very serious about engineering, and less so about modesty.",
    third = "{name} met Wizzle Brassbolts of the gnome racing team at the Mirage Raceway.",
  },
  greetings = {
    { id = "g_main", text = "Oh, hello! Careful with that, that's a very expensive wrench, calibrated to a sixteenth of a turn!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have you come to see our new design?" },
  },
  notice = {
    { id = "n_lock_stones", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "Ooh, is that a firestone? I'd love to know its operating temperature, purely for science, and the car could use a little extra kick off the line." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because gnomish engineering is precise and goblin engineering is loud, and somebody has to prove that precise wins. Ironforge and Gnomeregan have built things together for a long time, so you know exactly what I mean." } },
      choices = {
        { text = "Win it fairly, Wizzle. No gusts from me.", next = "BACK", reply = "Oh, thank you, that's very sporting of you, and if I win, I'll make sure to mention your restraint.", fx = { align = { honor = 1 } } },
        { text = "One little gust couldn't hurt. For the Alliance.", next = "BACK", reply = "That's very kind, but no, no, no, the whole point is to prove precision wins, not wind, though I'm touched.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In theory, absolutely, though in practice it weighs about as much as a dwarf and heats up in the sun. I did build a breastplate from a rocket car's front panel once, and it stopped a goblin wrench beautifully, right before it melted." } },
      choices = {
        { text = "Tried and tested plate is best. Leave the experiments.", next = "BACK", reply = "Fair enough, though I'd point out that tried and tested plate was somebody's experiment once too.", fx = { align = { order = 1 } } },
        { text = "Every great armour started as somebody's experiment.", next = "BACK", reply = "Exactly, and I'm so glad you said it, because I've been trying to convince Fizzle of that for weeks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Replace? No, no, improve upon, perhaps, with better gears and no need for dinner. Though I admit my last mechanical hound followed a smell of oil straight back to our own workshop and bit Fizzle on the ankle." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Improve upon one, perhaps, but first, may I look at {pet}'s legs? The knee joint alone would solve three problems I've had with the rear suspension." },
      },
      choices = {
        { text = "No machine can match a living bond with a beast.", next = "BACK", reply = "You may be right, though my hound did come to me when I called, which is more than Fizzle does.", fx = { align = { light = 1 } } },
        { text = "If a machine works better, I'd use it gladly.", next = "BACK", reply = "Oh, splendid, then you can be my first customer, once I've stopped it biting Fizzle on the ankle.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "So the trolls say, and I've no reason to doubt them! I'd like to know whether it's magic or something in the mallet itself, because if it's engineering, I want the blueprints." } },
      choices = {
        { text = "Some things should stay troll secrets.", next = "BACK", reply = "Perhaps, perhaps, though I'd love to have a look at the mallet, just for a minute, from a respectful distance.", fx = { align = { order = 1 } } },
        { text = "If there's a secret, it's meant to be found.", next = "BACK", reply = "That's the spirit of Gnomeregan, and I'll put it on a little plaque next to the workbench.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Wizzle.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That's a shame, because I'd have hired one if you'd said otherwise. Still, fire's fire, and I'd love to know if demon fire burns hotter than coal, just for science, of course." }, { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "That's a shame, because I'd have hired one if you'd said otherwise. Still, would your {pet} hold still a moment while I put a thermometer near it, because I'd love to know if demon heat burns hotter than coal, just for science, of course." } },
      choices = {
        { text = "Science shouldn't play with fel fire.", next = "BACK", reply = "You're right, of course, and I'll stick to coal, though I'll admit the idea was very tempting.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel fire would make your car unbeatable. I could arrange some.", next = "BACK", reply = "Unbeatable and probably explosive, which is the kind of combination Pozzik would love, so I'll stay away from it.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Faith? Well, I have faith in tolerances and a well-tightened bolt, which has never once let me down. Though I'll admit that when the car leaves the line, I do find myself hoping very hard at something, and perhaps that's what you'd call a prayer." } },
      choices = {
        { text = "That hope is a prayer, Wizzle, and the Light hears it.", next = "BACK", reply = "Is it? Then I'll keep hoping, and I'll keep tightening the bolts too, just in case the Light is busy.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Trust your bolts. Faith won't hold a car together.", next = "BACK", reply = "Exactly my position, and I'm delighted to hear it from a priest, which is very unusual.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Fairly is the goal, and Daisy keeps the times very strictly, but the goblins do love a shortcut, and between you and me, we've answered one or two with shortcuts of our own. It's all in good fun, mostly, until someone's car catches fire." } },
      choices = {
        { text = "Win it fairly, or the victory means nothing.", next = "BACK", reply = "That's what I keep telling everyone, though I admit we've answered a shortcut or two with one of our own.", fx = { align = { honor = 1 } } },
        { text = "If the goblins cheat, beat them at their own game.", next = "BACK", reply = "Oh, we try, but the goblins are very, very good at it, and we keep getting our own tricks backwards.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because everything is machinery if you look closely enough, or at least that's what they taught us in Gnomeregan. I imagine a druid is a very clever machine that doesn't know it, and I mean that as the highest compliment I have." } },
      choices = {
        { text = "Measure away. Understanding never hurt anyone.", next = "BACK", reply = "Thank you, and I'll start with your pulse and then move on to your spellcasting, if you'll allow it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Nature isn't a machine. Some things can't be measured.", next = "BACK", reply = "You may be right, though I'd still like to try, purely in the interests of science, with your permission.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Him, or somebody he pays, because parts don't just walk off a gnome's workbench. I've started keeping my fuel injector under my pillow, and I'll tell you, it's not comfortable, but it's there in the morning." } },
      choices = {
        { text = "I'll help you catch the thief, honestly.", next = "BACK", reply = "Thank you, truly, and I'll take my injector out from under my pillow the very moment you catch him.", fx = { align = { order = 1 } } },
        { text = "Steal one of his back. Fair's fair.", next = "BACK", reply = "Ooh, tempting, but I'd probably steal the wrong part and then have to give it back, so I'll leave that to you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because gnomish engineering is precise and goblin engineering is loud, and somebody has to prove that precise wins. I know the Horde favours the goblins, but a good machine is a good machine, and I'd like you to see ours run." } },
      choices = {
        { text = "I'll keep the winds out of it. Win it fairly.", next = "BACK", reply = "Thank you, and I'm grateful, because a win's only worth having if I know the car did it on its own.", fx = { align = { order = 1 } } },
        { text = "For the right price, the winds might shift.", next = "BACK", reply = "No, no, thank you, though I admire the business sense, and I'll tell Pozzik you'd make a fine goblin.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "I hear the goblins have been showing you their pit. Please tell me you didn't touch anything, because whatever they're running on isn't safe." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "The goblins are cross with you! Fizzle will be delighted. Come in, but do mind the wrench." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Marvelous, because I've been testing crash plating and I need someone to tell me what it feels like to be hit very hard." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! I've been meaning to build a mechanical tracking hound, and I'd love to see a real one at work first, purely for research." },
        { id = "h_default", key = true, text = "Wizzle Brassbolts, gnome engineer, at your service! I help design the cars for our team, and I'm quite sure this season's model is the best yet, assuming it holds together, which it will, because I've built a backup for the backup steering." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Did you know Gahz'rilla, the hydra in Zul'Farrak, can be summoned with a special mallet? It's the most fascinating thing, and I'd love a mage's view on how it works." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Ooh, you smell like brimstone! Do you suppose your little friends could help with engines? They like fire, and engines like fire, and I like engines that go fast." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Splendid, would you stand near the finish line? Statistically speaking, someone always needs patching up after the third heat, and it's usually a goblin." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Do you know, your armor has a lovely articulation at the elbow, and I'd love a look at the hinge, purely for engineering reasons, of course." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Fascinating, simply fascinating; I'd love to know how your shapeshifting works, mechanically speaking, if you'd ever let me take a few measurements." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Hold on, are you here from Pozzik's crew? Because you've got that sneaky look about you, and the last time I saw that look, my fuel line went missing." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman! Could you ask the winds to blow the goblin car off the track? No? Not even a little gust?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! Could you ask the winds to blow the goblin car off the track? Just a little gust, for the Alliance?" },
      },
      again = { { id = "h_again", text = "Questions? Oh, I love questions! Ask away, and if I don't know, I'll make a very educated guess and label it clearly." }, { id = "h_again2", text = "Questions? I love questions!" } },
      choices = {
        { text = "Shapeshifting isn't machinery, Wizzle. Why measure it?", next = "xdruid", when = { class = "DRUID" } },
        { text = "How do you beat the goblins?", next = "b1_1" },
        { text = "Do you have family on the team?", next = "b2_1" },
        { text = "Is racing a good use of engineering?", next = "s_1" },
        { text = "I never heard of a mallet that summons a hydra.", next = "xmage", when = { class = "MAGE" } },
        { text = "Imps make poor engineers, Wizzle. They eat the wiring.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is there room for faith in engineering, Wizzle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The rivalry with the goblins hardly seems settled fairly.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could racing armor plate work for a warrior, Wizzle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could a machine ever replace a hunter's beast, Wizzle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Has Pozzik really been stealing your parts, Wizzle?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why do you want to beat the goblins so badly, Wizzle?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Why do you want to beat the goblins so badly, Wizzle?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Engineering, friend! The goblins strap a rocket to a crate and call it a car, while we actually calculate things like aerodynamics and fuel ratios." } },
      choices = { { text = "Do the goblins ever win?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
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
      choices = { { text = "Pushing limits is how you learn.", next = "BACK", reply = "Exactly, and if something explodes, well, that's just more data, and I love data.", fx = { affinity = 1, align = { order = 1 } } }, { text = "There are better uses for your brains.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan was the greatest city of engineering in the world, and it'll be again, as soon as we get it back. Until then, we race, and we win." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's full of goblin engineers who think they're better than us. They're not, and we prove it every race." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel's goblins sponsor Pozzik's team, which is very unfair. We're sponsored by our own genius, which is much more reliable." } },
    magni = { { id = "tp_magni", text = "King Magni gave the gnomes a home in Ironforge after Gnomeregan fell. I'm grateful, though I'd rather he gave us a racing budget." } },
    _none = { { id = "tp_none", text = "I'm not sure, friend, but I could probably build something to find out!" } },
  },
}
