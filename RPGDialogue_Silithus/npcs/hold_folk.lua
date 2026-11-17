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
    { id = "g_main", text = "Ugh, another visitor. Unless you've got an antidote to sell, buddy, keep your voice down, because my head's charging me interest." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, buddy! Tell me you've brought somethin' that'll make me feel less like death, and tell me it's cheap." },
  },
  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because it's a very good soul, thank you, and I've been told it's worth a fortune on the open market! But if you've a curse to spare for those scorpids out in the sand, buddy, I'd call that a fair trade, and I'd not even charge you for the idea." } },
      choices = {
        { text = "Your soul is safe, Noggle. I'll deal with the scorpids.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Careful what you offer a warlock, goblin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Well, maybe not dyin', exactly, but I've been stung by every scorpid in Silithus and they all had opinions about me! Beetix says she needs samples to finish the cure, but I don't see why I should wait for a potion, buddy, when you've got the Light right there in your gauntlets for free." } },
      choices = {
        { text = "I'll do what I can, Noggle. Rest easy now.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You'll live. Fetching samples is better than coddling you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I'd rather you went and fought all of it, every stinger in the desert, but I'll settle for you bringing back the bits I need, buddy. The thing that got me came out of the sand so fast I never saw it, so keep your shield low and your boots moving, and don't end up on the bench next to mine." } },
      choices = {
        { text = "I'll bring back what you need. Nobody should suffer like this.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You picked a fight with the desert. You'll heal or you won't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I was picking herbs with my head down, countin' what they'd fetch, and then my leg was on fire and something was skittering off into the dunes. Beetix says scorpid, the druids say worse, and I say whatever it was, buddy, I hope a hunter's beast eats it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Can {pet} smell the venom on me? Because if it can, take it out and follow the stink back to whatever did this, buddy, and I'll be grateful, even if I'm too broke to show it." },
      },
      choices = {
        { text = "Next time take a guard. The desert punishes the careless.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Bad luck, nothing more. It could have happened to anyone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Once, when a shipment of mine fell off a zeppelin, and it never came back, and neither did my deposit, so I've not bothered since. But I'll make an exception today, buddy, because this venom's got me seeing things, and one of them looked a lot like a bill from Beetix." } },
      choices = {
        { text = "I'll pray for you anyway, Noggle. Rest now.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pain teaches better than prayer. You'll heal when you've learned.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A stinger the size of a wagon, out in the dunes, buddy, and I'd only stopped to pick one herb worth maybe two silver. If you see any of them out there, take their venom sacs, and maybe I'll cure myself before Beetix finishes worrying me to death or invoicing me to death." } },
      choices = {
        { text = "I'll get those sacs. You'll be fine.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You should have watched your step.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Rest easy, Noggle.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "There's one, buddy, if somebody brings me enough venom sacs to brew an antidote. It's slow work, and I'm a terrible patient and a worse customer, but I'll get it done, and then I'm leaving this desert and never comin' back." } },
      choices = {
        { text = "I'll help you brew it. Hang on.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Maybe you'll learn some patience.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Good luck, Noggle.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! You're not here to take my soul, are you, buddy? Because I'm still using it, and I've already been stung half to death this week, and it's not for sale at these prices." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Oh, perfect, put your hands on my forehead and do the glowy thing, buddy, because I'm dying, honestly I am, and Beetix won't believe me, and the glowy thing doesn't cost reagents." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You know poisons, don't you? Tell me honestly, buddy, how long have I got, because my cousin keeps sayin' I'll be fine and she's a terrible liar, which is a real handicap for a goblin." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Can you magic this venom out of me? No? Then what good is all that study, I ask you, when a goblin can't even get a decent cure at a decent price?" },
        { id = "h_default", key = true, text = "Noggle Ficklespragg, and yes, I'm related to Beetix, and no, I don't want to talk about it, buddy. I got stung by somethin' nasty out in the desert, and now I'm stuck here until somebody brings me the makings of a cure, and every day on this bench is a day I'm not earning." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Noggle's Last Hope") }, text = "The venom sacs, buddy, from the stingers out there. Bring me enough and I can brew my own cure and cut out the middle-goblin, and then I'm leaving Silithus forever." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Finally, somebody who can fix me without makin' me drink anything, so lay on hands, or chant, or whatever it is you lot do, buddy, and be quick about it." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior? Great, more muscle wanderin' past my bed while I lie here sweating out poison and money. Don't suppose you've got a stinger in your pocket, buddy?" },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, eh? You lot know where the nasty things nest, buddy, so maybe you can tell me what bit me, because nobody else here will, not even for a fee." },
      },
      again = { { id = "h_again", text = "What else, buddy? Talkin' hurts, and hurtin' should cost extra, so make it quick." }, { id = "h_again2", text = "Ask, if you must, buddy, but every question's another minute I'm not gettin' better." } },
      choices = {
        { text = "You look like something chewed you up.", next = "b1_1" },
        { text = "How's Beetix?", next = "b2_1" },
        { text = "I can't think why a goblin would come to Silithus.", next = "b3_1" },
        { text = "Let me see if I can ease your pain.", next = "x_1", when = { class = { "PRIEST", "DRUID", "SHAMAN" } } },
        { text = "No profit seems worth this risk.", next = "s_1" },
        { text = "How did you get poisoned?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "There seems to be no cure for this venom.", next = "xmage", when = { class = "MAGE" } },
        { text = "Have you ever prayed for anything yourself, Noggle?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Would you rather I went and fought what stung you, Noggle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do you really not know what stung you, Noggle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You talk like a dying man, Noggle.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why would a warlock want your soul, Noggle?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I was out collecting samples for a little side business, buddy, and one of those big silithid things got me in the leg. Next thing I know, I'm shakin', sweating, seeing things, and owing my cousin money." } },
      choices = { { text = "Something goblin?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The druids here have done what they can, and they don't even charge, which makes me suspicious, but their nature magic only slows it down. I need somethin' stronger, buddy, somethin' goblin." } },
      choices = { { text = "I'll help.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "So I'm brewing my own cure, buddy, or I would be if I could get out of this bed. That's where you come in, and I'll owe you, which is a big thing for a goblin to say." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Beetix is fine, Beetix is always fine, Beetix never gets stung, buddy. Ask her yourself, she's around the Hold somewhere countin' what I owe her." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Money, what else, buddy? The silithids have all kinds of interesting bits, and the right buyers pay for them, by the ounce. I just didn't put the stinging in the budget." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "It helps, buddy, it really does, thank you. But it'll come back, so I still need those sacs, and I'm good for the debt, mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "I'd have told you yes a week ago, buddy. Lying here, I'm not so sure anymore, but the margins are too good, so I'll probably go back out anyway." } },
      choices = { { text = "Your health matters more than gold.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "No risk, no profit. That's the goblin way.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got doctors, buddy, and they'd have me cured by now, at triple the price. Here I'm getting cured slow and cheap, and I can't decide which is worse." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The bugs from the hives bite, did you know that? And they don't bill you first, which is unprofessional." } },
    booty_bay = { { id = "tp_booty_bay", text = "I sold insurance in Booty Bay, once, before the pirates sank the business. Ironic, isn't it, me not having any now." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel doesn't cover poison, I checked, so this one's all on my own ledger. Remind me to renegotiate when I'm feeling better." } },
    _none = { { id = "tp_none", text = "No idea, buddy, and right now I don't care unless it's an antidote." } },
  },
}

P:NPC {
  key = "jonathan_revelator", id = TODO_NPC("Jonathan the Revelator"), name = "Jonathan the Revelator",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Jonathan the Revelator preaches the end of the world from the edge of Cenarion Hold, and the silithid hives give him plenty of material.",
    third = "{name} met Jonathan the Revelator, a doomsayer at Cenarion Hold in Silithus.",
  },
  greetings = {
    { id = "g_main", text = "Hear me, traveler! The end draws near, and the bugs are already under your feet, so stop scratching and listen!" },
    { id = "g_back", when = { metBefore = true }, text = "You return! Have you come to hear the truth at last?" },
  },
  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Something older than the hives, older than the wall, older than the dragons that watch it! The silithid are only its fingers, and when it wakes, there is no hole in the world deep enough to hide you from it, so repent now, while there is time." } },
      choices = {
        { text = "You're a madman, Jonathan, but I'll listen anyway.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "If there's danger below, the Hold should hear of it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Fought, yes, and fought, and fought again, until the arms of every warrior in Kalimdor are heavy as stone. The swarm does not tire, and what stirs beneath it does not sleep forever, so fight if you must, but do not mistake it for winning." } },
      choices = {
        { text = "Even a losing fight is worth fighting, for others' sake.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then I'll take what I can before the end comes.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Tunnels where no worm dug them, and hives that hum like a great heart beating, and once a silithid that stopped and looked at me as a hunter looks at prey. The beasts of the desert flee north, and you should ask yourself what they know." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} knows, I think, for it watches the ground and not the sky, and the beasts were always wiser than the prophets." },
      },
      choices = {
        { text = "Then we watch the beasts and prepare. Panic helps nobody.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the beasts flee, I'll go with them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They say the swarm is only the hands, priest, and that whatever moves those hands is still sleeping far below! Pray with me while there is still time to pray, because soon there will only be time to run." } },
      choices = {
        { text = "I'll pray, Jonathan, but I'll stand and fight rather than run.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If something sleeps below, I'd like to hear what it says.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Something that was old when your people's first forests were seedlings, and it is not dead, only waiting. I have heard it in the deep hours, {class}, and I tell everyone, though few of them thank me for it." } },
      choices = {
        { text = "I believe you. The Circle must be warned.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You've been in the sun too long, old man.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You walk in shadow, so you must have seen it too, the darkness beneath the sand that waits for the end of all things!" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You hear the earth, so you must hear it too: the sand groans, the stones weep, and the swarm below gnaws at the roots of the world." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde! Then you have heard them too, in your prayers, the voices beneath the sand that whisper of the end of all things!" },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! You bear the mark of the fallen, the bargain of the damned, and the hives below will rise to meet you in the end of all things." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, who reads the stars and the books and thinks they are wise! Wisdom will not save you when the hives open, but perhaps it will let you understand your doom." },
        { id = "h_default", key = true, text = "I am Jonathan the Revelator, and I have seen what lies beneath these sands. The silithid swarm is only the beginning, and something older and darker stirs below them." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior comes to the edge of the end! Sharpen your blade, then, for there will be more of them than you have strokes left in your arm." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You track the beasts, but who tracks the hunter? The swarm does, from beneath, and it is very patient." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You hear the earth, so surely you hear it too, the slow heartbeat under the sand. Tell me I'm not the only one." },
      },
      again = { { id = "h_again", text = "Ask while there's still time to ask, for the end draws nearer with every grain of sand!" }, { id = "h_again2", text = "Ask, while there is still time!" } },
      choices = {
        { text = "What do you think lies beneath the sands, Revelator?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What do you hear beneath these sands, Revelator?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What lies beneath the sands?", next = "b1_1" },
        { text = "I've no reason to believe you.", next = "b2_1" },
        { text = "I doubt the druids listen to you.", next = "b3_1" },
        { text = "The Light will stand against any darkness.", next = "x_1", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Is there any hope?", next = "s_1" },
        { text = "Do you think warlocks will bring the end?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What do you think is beneath the sand?", next = "xmage", when = { class = "MAGE" } },
        { text = "What do the voices beneath the sand say, Jonathan?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The swarm can be fought, Revelator.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What have you seen beneath the sands, Revelator?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What darkness do you think waits beneath the sand?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "The silithid hives go deeper than any of the druids believe. Beneath them lie the ruins of an empire older than the night elves, and whatever ruled it is not dead." } },
      choices = { { text = "Whispering?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The druids talk about scarabs and gongs and ancient walls, but they do not understand what they guard. I have heard it in my dreams, whispering." } },
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
  topics = {
    cthun = { { id = "tp_cthun", text = "The bugs speak a name in the dark, traveler, and I have heard it with my own ears, and I dare not say it! Pray the wall holds." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives are mouths, I tell you, mouths in the sand, and they're hungry, and they're patient! Everyone laughs at me until they look closely." } },
    bronze_dragonflight = { { id = "tp_bronze_dragonflight", text = "The bronze dragons sealed the city once, and they will not come again, mark my words! They have left us to the bugs." } },
    scourge = { { id = "tp_scourge", text = "The dead walk in the north, the bugs dig in the south, and the world is ending at both ends! Nobody listens to Jonathan." } },
    holy_light = { { id = "tp_holy_light", text = "The Light won't save you from the bugs, friend, not when the bugs come out of the ground. Nothing will save you, but you might as well pray." } },
    _none = { { id = "tp_none", text = "That has not been revealed to me, traveler." } },
  },
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
    { id = "g_back", when = { metBefore = true }, text = "You return. Good, the Horde needs every blade, and half of mine are on their backs with the runs from bad oasis water, which is no death for an orc." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It'll burn them if you swing hard enough. The swarm threatens all of Kalimdor, and I don't care whether the Horde's paladins are dead or alive, as long as they're at the front when the hives open." } },
      choices = {
        { text = "Put me at the front. The Horde needs me there.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll fight the swarm, but on my own terms.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Fire, and a lot of it, thrown at the silithid before they reach our lines. The druids want us to be careful, and the Alliance wants to be first, and I want the hives burned to the ground, so a mage who can do that is worth three of the Circle's tree-talkers." } },
      choices = {
        { text = "I'll burn every hive you point me toward.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The druids know this land. Their caution may save lives.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Scouts who can read the sand and come back alive to tell me what they read. Any fool can die in the hives, but a hunter who returns with numbers is worth ten warriors who return with nothing but scars." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep {pet} close and quiet in the dunes, for a beast that bays at the swarm brings the swarm, and I have buried enough scouts this season." },
      },
      choices = {
        { text = "I'll scout and report as ordered. That's how wars are won.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll strike when I see the chance, orders or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "It needs them badly, and I would say so to the Warchief's face, because the silithid poison every wound they make. Keep my grunts breathing long enough to swing an axe, and I will call you as much a warrior as any of them." } },
      choices = {
        { text = "Then I'll serve wherever the Horde needs me, Krug.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I walk my own path, Krug, not the Horde's war effort.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "We fight beside whoever kills silithids, druid, and the Circle kills its share. Thrall sent us to guard Kalimdor, and I won't let pride with the night elves at the Hold cost us a single warrior." } },
      choices = {
        { text = "Stand with the Circle. The swarm is the real enemy.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Trust no night elf, even here.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage of the Horde. Good, your fire burns bugs as well as it burns Alliance, and the Horde needs every bit of it here." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman of the Horde! Good, that is the Warchief's own path, and we need your lightning at this front more than we need anyone's prayers." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. I have said we need lightning more than prayers, but the healers here have kept enough of my warriors standing that I would take it back, if you asked." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue of the Horde! I prefer an axe in the open, but I won't turn away a blade that works from behind, not with the bugs breeding faster than we can kill them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock. I've seen your demons fight, and I'll admit they hit hard, so bring them to the hives and let them earn their keep." },
        { id = "h_default", key = true, text = "I am Krug Skullsplit, and I speak for the Horde's forces here in Silithus. The silithids are a threat to all of Kalimdor, and the Horde will not let them overrun our lands. I lost eleven grunts this month and buried four, because the bugs took the rest whole." },
        { id = "h_c0", when = { faction = "Horde" }, text = "A child of the Horde, here at the front! The Warchief's eyes are on Silithus, and your service will be remembered." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter of the Horde. Your arrows will not stop a swarm, but your eyes might see one coming, and that is worth more." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid, standing with the Horde in this wasteland. The Earth Mother must weep to see what the bugs have done to her desert." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. Can you hold an axe? No, a hammer, then, and I hear the Light burns bugs as well as anything." },
      },
      again = { { id = "h_again", text = "Anything else? Speak it plainly, warrior." }, { id = "h_again2", text = "Speak, and quickly." } },
      choices = {
        { text = "Will the Horde fight beside the Circle here?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "The earth here is sick with hives. How does the Horde fight it?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What is the Horde doing here?", next = "b1_1" },
        { text = "What of the Alliance?", next = "b2_1" },
        { text = "How do I help?", next = "b3_1" },
        { text = "My axe is ready for the swarm.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "We may have to fight beside the Alliance here.", next = "s_1" },
        { text = "What does the Horde need from a rogue here?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Warlocks should fight well against the silithid.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "The Horde's war effort must need priests, Krug.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What does the Horde need from its hunters here, Krug?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do you need from a mage, Krug?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Will the Light burn the silithid, Krug?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
  topics = {
    thrall = { { id = "tp_thrall", text = "The Warchief sent me to hold this desert against the bugs, and I'll hold it until the bugs are dead or I am. Thrall doesn't send warriors where they're not needed." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives must burn, every one, and the Horde will burn them. Bring me oil and axes and stop asking questions." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Banshee Queen sends her dead to fight in the north. Good, then they don't come here and smell up the camp." } },
    tyrande = { { id = "tp_tyrande", text = "The night elves' priestess sends archers here too, and they fight well, for elves. I'll tell her so to her face, if she ever comes." } },
    _none = { { id = "tp_none", text = "If I cannot fight it or sharpen a blade on it, I know nothing about it." } },
  },
}

P:NPC {
  key = "merok", id = TODO_NPC("Merok Longstride"), name = "Merok Longstride",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Merok Longstride represents the Alliance's war effort at Cenarion Hold, a steady soldier with an eye on the swarm and another on his Horde counterparts.",
    third = "{name} met Merok Longstride, an Alliance war-effort commander at Cenarion Hold.",
  },
  greetings = {
    { id = "g_main", text = "Well met, friend. You've come to the front lines, then, so mind where you sit; the scorpids got into the latrine trench again." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again. The Alliance needs every hand it can get, and my last two went home with sunstroke and a scorpid in the boot." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The hives move under us, and the Horde's shamans warn their own people before ours. If you can hear what they hear, the Alliance won't be the last to know." } },
      choices = {
        { text = "I'll share what I hear with everyone at the Hold.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll tell the Alliance first, and the Horde when it suits us.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the Twilight's Hammer calls to things it cannot control, and I'd rather not see what happens when a demon hears the call. You keep a firm hand on your creature, and I'll keep a firm hand on my men, and we'll get on well enough." } },
      choices = {
        { text = "A firm hand it is. My demon answers to me alone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the cult call it. I'll see what answers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than I'd like to admit, and more than Krug admits for his own side. The druids do what they can, but they're stretched thin coaxing grass out of poisoned sand, so a priest who'll sit up with the wounded is worth a dozen fresh swords to me." } },
      choices = {
        { text = "I'll tend the wounded tonight, Horde and Alliance alike.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll tend our own first. The Horde can see to theirs.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Someone to stand at the front when the bugs come, and to keep the men steady when the cult starts its chanting. The Horde has Krug, and he's no fool, but I'd like the Alliance to show that we can hold a line without needing to shout about it." } },
      choices = {
        { text = "I'll stand at the front, and set an example.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I didn't come to impress the Horde. I came to fight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "There's a truce, and I keep it, because the silithid don't care whose banner they're tearing down. But every time Krug's warriors come back from the hives with more kills than mine, I hear about it, and I'd sooner my soldiers did the talking." } },
      choices = {
        { text = "We fight the swarm side by side. Keep the truce.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let our kills speak louder than theirs. Pride matters too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I trust them to report what the Circle wants reported, and that's not quite the same as what Stormwind needs to know. A hunter of ours who watched the hives and the Horde camps both would be worth more to me than another squad of footmen." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} would make a fine sentry by the Alliance tents at night, because Krug's lot don't sneak much, but the silithid do." },
      },
      choices = {
        { text = "I'll share what I see with everyone. The Circle earns honesty.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll watch the Horde for you. Trust has its limits.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Watching everyone, I'd imagine, including the Circle and the cult. I keep my soldiers honest and my eyes on the swarm, and whatever the spies get up to after dark is their business, not mine." } },
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
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That they don't break, for one. Men break, orcs break, even the Scourge can be scattered, but kill a hundred silithids and the hundred behind them just keep coming, and I've had to rewrite every plan I brought from Stormwind." } },
      choices = {
        { text = "Then we hold the line and never give ground.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then we strike their hives and stop fighting fair.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock of the Alliance. I'll not ask what you've bound, so long as it fights the swarm and not my soldiers, and so long as it stays well clear of the cult." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Alliance, at the Hold. We need you badly, because the swarm doesn't take prisoners, and our wounded fill the inn every evening." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin of the Alliance! Good, the Light shines bright against the swarm, and the Horde here could do with seeing what proper discipline looks like." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue of the Alliance. I'd not be surprised if SI:7 had people in Silithus already, though they'd never report to a soldier like me." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage of the Alliance! The bugs burn well, I'm told, and we could use every fireball you've got on the front lines." },
        { id = "h_default", key = true, text = "Merok Longstride, Alliance commander here at Cenarion Hold. The silithids threaten everyone, and the Alliance has sent me to make sure we're ready when the time comes to strike. Until then we drill, we dig latrines, and we shake scorpids out of the bedrolls." },
        { id = "h_c0", when = { faction = "Alliance" }, text = "A fellow member of the Alliance! Stormwind and Ironforge have both pledged support, and soldiers like you make that pledge real." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior of the Alliance. Good, there are more Horde blades in this courtyard than ours, and I'd like that balance to change." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter of the Alliance! The Circle's scouts are good, but I'd trust one of our own to tell me plainly what's moving out by the hives." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of Darnassus at the Hold. Good; Tyrande's people know this foe better than Stormwind's generals do, and I could use the counsel." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! The Horde shamans here hear the swarm under the sand, I'm told, and I'd very much like an Alliance ear on that too." },
      },
      again = { { id = "h_again", text = "Anything else?" }, { id = "h_again2", text = "Ask, friend." } },
      choices = {
        { text = "What don't the generals understand about the silithids?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What is the Alliance doing here?", next = "b1_1" },
        { text = "You don't seem easy about the Horde being here.", next = "b2_1" },
        { text = "How can I help?", next = "b3_1" },
        { text = "Our people have fought worse than bugs.", next = "x_1", when = { race = { "Human", "Dwarf" } } },
        { text = "Should we trust the Horde here?", next = "s_1" },
        { text = "I'd wager SI:7 is watching the Horde here.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How goes the fight against the silithid?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is there rivalry with the Horde here, Commander?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "You don't seem to trust the Circle's scouts, Commander.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do you need from a paladin here, Merok?", next = "xapala", when = { class = "PALADIN" } },
        { text = "There seem to be a great many wounded, Merok.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why should my demon stay clear of the cult, Merok?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would you have an Alliance shaman listen for, Merok?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
  topics = {
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives keep growing, and we keep burning them, and neither side's winning yet. I'd like more men and fewer scorpids in my boots." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Bolvar sends what he can spare from Stormwind, which is never enough. He's a good man doing a hard job." } },
    magni = { { id = "tp_magni", text = "The dwarves sent a few rifles and a promise of more, and the rifles arrived. I'm still waiting on the promise." } },
    thrall = { { id = "tp_thrall", text = "The Horde fights the bugs here as hard as we do, and I'll say that to anyone who asks. I'll also keep my eye on them, and they keep their eye on me." } },
    _none = { { id = "tp_none", text = "Not something I know, friend." } },
  },
}
