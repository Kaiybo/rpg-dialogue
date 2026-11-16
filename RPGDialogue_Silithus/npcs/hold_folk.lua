-- Cenarion Hold's skipped folk: a goblin chemist, a doomsayer, and the Horde and Alliance war-effort envoys camped in the Hold.
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "noggle", id = TODO_NPC("Noggle Ficklespragg"), name = "Noggle Ficklespragg",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Noggle Ficklespragg lies in a sickbed at Cenarion Hold, poisoned by the desert's creatures and determined to be cured by somebody else's hard work.",
    third = "{name} met Noggle Ficklespragg, a poisoned goblin at Cenarion Hold in Silithus.",
  },
  greetings = {
    { id = "g_main", text = "Ugh, another visitor. Unless you've got an antidote, keep your voice down." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Tell me you've brought something that'll make me feel less like death." },
  },
  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A stinger the size of a wagon, out in the dunes, and I'd only stopped to pick one herb. If you see any of them out there, take their venom sacs, and maybe I'll cure myself before Beetix finishes worrying me to death." } },
      choices = {
        { text = "I'll get those sacs. You'll be fine.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You should have watched your step.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Rest easy, Noggle.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "There's one, if someone brings me enough venom sacs to brew an antidote. It's slow work, and I'm a terrible patient, but I'll get it done, and then I'm leaving this desert and never coming back." } },
      choices = {
        { text = "I'll help you brew it. Hang on.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Maybe you'll learn some patience.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Good luck, Noggle.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You know poisons, don't you? Tell me honestly, how long have I got, because my cousin keeps saying I'll be fine and she's a terrible liar." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Can you magic this venom out of me? No? Then what good is all that study, I ask you, when a goblin can't even get a decent cure?" },
        { id = "h_default", key = true, text = "Noggle Ficklespragg, and yes, I'm related to Beetix, and no, I don't want to talk about it. I got stung by something nasty out in the desert, and now I'm stuck here until somebody brings me the makings of a cure." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Noggle's Last Hope") }, text = "The venom sacs, friend, from the stingers out there. Bring me enough and I can brew my own cure, and then I'm leaving Silithus forever." },
      },
      again = { { id = "h_again", text = "What else? Talking hurts, so make it quick." }, { id = "h_again2", text = "Ask, if you must." } },
      choices = {
        { text = "What happened to you?", next = "b1_1" },
        { text = "How's Beetix?", next = "b2_1" },
        { text = "Why come to Silithus?", next = "b3_1" },
        { text = "Let me see if I can ease your pain.", next = "x_1", when = { class = { "PRIEST", "DRUID", "SHAMAN" } } },
        { text = "Is profit worth this risk?", next = "s_1" },
        { text = "How did you get poisoned?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is there truly no cure for your venom?", next = "xmage", when = { class = "MAGE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I was out collecting samples for a little side business, and one of those big silithid things got me in the leg. Next thing I know, I'm shaking, sweating, and seeing things." } },
      choices = { { text = "Something goblin?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The druids here have done what they can, but their nature magic only slows it down. I need something stronger, something goblin." } },
      choices = { { text = "I'll help.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "So I'm brewing my own cure, or I would be if I could get out of this bed. That's where you come in." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Beetix is fine, Beetix is always fine, Beetix never gets stung. Ask her yourself; she's around the Hold somewhere." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Money, what else? The silithids have all kinds of interesting bits, and the right buyers pay for them. I just didn't account for the stinging." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "It helps, it really does, thank you. But it'll come back, so I still need those sacs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "I'd have told you yes a week ago. Lying here, I'm not so sure anymore, but I'll probably go back out anyway." } },
      choices = { { text = "Your health matters more than gold.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "No risk, no profit. That's the goblin way.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "No idea, friend, and right now I don't care." } } },
}

P:NPC {
  key = "jonathan_revelator", id = TODO_NPC("Jonathan the Revelator"), name = "Jonathan the Revelator",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Jonathan the Revelator preaches the end of the world from the edge of Cenarion Hold, and the silithid hives give him plenty of material.",
    third = "{name} met Jonathan the Revelator, a doomsayer at Cenarion Hold in Silithus.",
  },
  greetings = {
    { id = "g_main", text = "Hear me, traveler! The end draws near, and you would do well to listen." },
    { id = "g_back", when = { metBefore = true }, text = "You return! Have you come to hear the truth at last?" },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A heartbeat, slow and vast, under the hives and under the wall, and every night it beats a little closer to the surface. The druids call it the land's grief, but I have listened longer than they have, and grief does not hunger." } },
      choices = {
        { text = "Prophecy breeds panic. Keep such fears among the wise.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Shout it from the walls. People deserve to know.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The end comes on its own, from beneath the sand, but those who bargain with darkness will meet it sooner and with less surprise. Repent, warlock, while there is still time to choose a better master." } },
      choices = {
        { text = "I'll consider your warning.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll choose my own master, preacher.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Sure, sure.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "An army older than the kaldorei, waiting for the walls to fall. The Circle builds forts and the dwarves dig, but none of them listen, and when the end comes they will wish they had." } },
      choices = {
        { text = "Maybe you're right. We should prepare.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You're a madman, nothing more.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Interesting theory.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You hear the earth, so you must hear it too: the sand groans, the stones weep, and the swarm below gnaws at the roots of the world." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! You bear the mark of the fallen, the bargain of the damned, and the hives below will rise to meet you in the end of all things." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, who reads the stars and the books and thinks they are wise! Wisdom will not save you when the hives open, but perhaps it will let you understand your doom." },
        { id = "h_default", key = true, text = "I am Jonathan the Revelator, and I have seen what lies beneath these sands. The silithid swarm is only the beginning, and something older and darker stirs below them." },
      },
      again = { { id = "h_again", text = "Ask while there's still time to ask, for the end draws nearer with every grain of sand!" }, { id = "h_again2", text = "Ask, while there is still time!" } },
      choices = {
        { text = "What do you hear beneath these sands, Revelator?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What lies beneath the sands?", next = "b1_1" },
        { text = "Why should I believe you?", next = "b2_1" },
        { text = "Do the druids listen to you?", next = "b3_1" },
        { text = "The Light will stand against any darkness.", next = "x_1", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Is there any hope?", next = "s_1" },
        { text = "Do you think warlocks will bring the end?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What do you think is beneath the sand?", next = "xmage", when = { class = "MAGE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "The silithid hives go deeper than any of the druids believe. Beneath them lie the ruins of an empire older than the night elves, and whatever ruled it is not dead." } },
      choices = { { text = "Whispering?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The druids talk about scarabs and gongs and ancient walls, but they do not truly understand what they guard. I have heard it in my dreams, whispering." } },
      choices = { { text = "And then?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "When the walls of Ahn'Qiraj fall, and they will fall, the world will learn what I have been trying to tell them." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "You shouldn't, perhaps, but look around you. The insects grow bolder every day, and the druids grow more worried. Does that not tell you something?" } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "They tolerate me, which is not the same thing. They think me mad, but I would rather be mad and right than sane and dead." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "May you be right, servant of the Light. I have prayed for that myself, but my dreams answer otherwise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say we must prepare for war, and others say we must flee. I say the choice may not be ours to make." } },
      choices = { { text = "We fight. There is always hope.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Prepare for the worst. Hope is a luxury.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That has not been revealed to me, traveler." } } },
}

P:NPC {
  key = "krug", id = TODO_NPC("Krug Skullsplit"), name = "Krug Skullsplit",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Krug Skullsplit represents the Horde's war effort at Cenarion Hold and has little patience for anyone who can't hold an axe.",
    third = "{name} met Krug Skullsplit, a Horde war-effort commander at Cenarion Hold.",
  },
  greetings = {
    { id = "g_main", text = "Lok'tar, warrior! Speak quickly; the Horde has a war to prepare." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good, the Horde needs every blade." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "With axes, mostly, and with shaman like you calling down fire where the bugs swarm thickest. The ground is hollow with their tunnels, so we strike fast and pull back before it opens under us, and that is not a fight orcs were made for." } },
      choices = {
        { text = "Then the Horde must fight smarter, not only harder.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Orcs were made for every fight. Charge in.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Eyes in the hives, and knives in the bug-queens' guards, so my warriors can push in. The Alliance has its own soldiers here, and I'd rather the Horde's name was on the victory than theirs." } },
      choices = {
        { text = "I'll fight for the Horde's honor.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I fight for myself, Krug.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll see what I can do.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Well enough, if they stand their ground and don't hide behind their pets. The bugs swarm fast, and a demon can hold a line while you burn them, so long as you keep your nerve." } },
      choices = {
        { text = "I'll stand my ground and fight beside you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My demon fights. I stay back.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll do my part.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman of the Horde! Good, that is the Warchief's own path, and we need your lightning at this front more than we need anyone's prayers." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue of the Horde! I prefer an axe in the open, but I won't turn away a blade in the shadows, not with the bugs breeding faster than we can kill them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock. I've seen your demons fight, and I'll admit they hit hard, so bring them to the hives and let them earn their keep." },
        { id = "h_default", key = true, text = "I am Krug Skullsplit, and I speak for the Horde's forces here in Silithus. The silithids are a threat to all of Kalimdor, and the Horde will not let them overrun our lands." },
        { id = "h_c0", when = { faction = "Horde" }, text = "A child of the Horde, here at the front! The Warchief's eyes are on Silithus, and your service will be remembered." },
      },
      again = { { id = "h_again", text = "Anything else?" }, { id = "h_again2", text = "Speak, and quickly." } },
      choices = {
        { text = "The earth here is sick with hives. How does the Horde fight it?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What is the Horde doing here?", next = "b1_1" },
        { text = "What of the Alliance?", next = "b2_1" },
        { text = "How do I help?", next = "b3_1" },
        { text = "My axe is ready for the swarm.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Should we fight beside the Alliance?", next = "s_1" },
        { text = "What does the Horde need from a rogue here?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do warlocks fight well against the silithid?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Gathering strength, supplies and warriors for the war to come. When the time comes, the Horde will be ready to march on the silithid hives." } },
      choices = { { text = "Strange allies?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The Alliance is here too, of course, and we tolerate them for now. A common enemy makes strange allies, and this enemy is common to us all." } },
      choices = { { text = "The Horde's axes?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "But when the fighting starts, it'll be the Horde's axes that break the swarm. Mark my words." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "They have their own commanders here, and we keep our distance. Some of my warriors grumble, but Thrall wants this war won, and that comes before old grudges." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Bring supplies, kill silithids and keep your blade sharp. The Hold's quartermasters can tell you what's needed most." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Good, warrior! Sharpen it often, for the silithids have hard shells and harder numbers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some of my warriors say we should never fight beside humans. I say the swarm doesn't care what side you're on." } },
      choices = { { text = "Victory first, grudges later.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } }, { text = "The Horde fights alone. Always.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "If I cannot fight it or sharpen a blade on it, I know nothing about it." } } },
}

P:NPC {
  key = "merok", id = TODO_NPC("Merok Longstride"), name = "Merok Longstride",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Merok Longstride represents the Alliance's war effort at Cenarion Hold, a steady soldier with an eye on the swarm and another on his Horde counterparts.",
    third = "{name} met Merok Longstride, an Alliance war-effort commander at Cenarion Hold.",
  },
  greetings = {
    { id = "g_main", text = "Well met, friend. You've come to the front lines, then." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again. The Alliance needs every hand it can get." },
  },
  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Watching everyone, I'd imagine, including the Circle and the cult. I keep my soldiers honest and my eyes on the swarm, and whatever the spies do in the shadows is their business, not mine." } },
      choices = {
        { text = "Spies keep the Alliance strong. I'd join them.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Honest soldiers win more battles than spies.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll keep that in mind.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Slowly, and bloodily, and the Horde's not helping as much as they claim. But we hold the line, and every mage who comes to Silithus is one more reason the bugs stay in their hives." } },
      choices = {
        { text = "I'll fight at your side. The line will hold.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Horde's doing more than you think.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll see where I'm needed.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue of the Alliance. I'd not be surprised if SI:7 had people in Silithus already, though they'd never report to a soldier like me." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage of the Alliance! The bugs burn well, I'm told, and we could use every fireball you've got on the front lines." },
        { id = "h_default", key = true, text = "Merok Longstride, Alliance commander here at Cenarion Hold. The silithids threaten everyone, and the Alliance has sent me to make sure we're ready when the time comes to strike." },
        { id = "h_c0", when = { faction = "Alliance" }, text = "A fellow member of the Alliance! Stormwind and Ironforge have both pledged support, and soldiers like you make that pledge real." },
      },
      again = { { id = "h_again", text = "Anything else?" }, { id = "h_again2", text = "Ask, friend." } },
      choices = {
        { text = "What is the Alliance doing here?", next = "b1_1" },
        { text = "How do you feel about the Horde here?", next = "b2_1" },
        { text = "How can I help?", next = "b3_1" },
        { text = "Our people have fought worse than bugs.", next = "x_1", when = { race = { "Human", "Dwarf" } } },
        { text = "Should we trust the Horde here?", next = "s_1" },
        { text = "Is SI:7 watching the Horde here?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How goes the fight against the silithid?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Gathering supplies and soldiers for the push into Ahn'Qiraj. The druids believe the silithids are only a part of a larger threat, and we mean to be ready." } },
      choices = { { text = "The gates?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The Horde's here too, with their own commander and their own plans. We keep the peace for now, because the swarm is a bigger enemy than either of us." } },
      choices = { { text = "Who stood firm?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "When the gates open, I want our soldiers in the front ranks. Silithus will remember who stood firm." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Uneasy, honestly. Krug Skullsplit and I keep our distance, and so do our soldiers, but so far there's been no blood spilled between us." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Bring supplies, fight the swarm and keep your eyes open. The war effort needs everything from cloth to bandages, and every bit counts." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Aye, and we'll fight these too. But don't underestimate them, friend; the silithids are more than bugs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some of my officers say we should keep the Horde at arm's length. Others say we'll need them before this is over." } },
      choices = { { text = "Work with them. The swarm is the real enemy.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } }, { text = "Never trust the Horde. Watch your back.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Not something I know, friend." } } },
}
