-- Winterspring between Everlook and the hold (0.38.0): the saber trainers, the Timbermaw at the tunnel, an Altar priestess, a blue dragon, a repentant satyr, and Everlook's cook. Voice: bibles/winterspring.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "rivern", id = TODO_NPC("Rivern Frostwind"), name = "Rivern Frostwind", title = "Wintersaber Trainers",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "frostsaber_rock" }, temper = { "reserved" }, values = { "patient", "proud" },
  impression = {
    first = "Rivern Frostwind raises the white frostsabers of Winterspring, the finest mounts the Kaldorei know. She expects a rider to earn one with seasons of work, and she means seasons.",
    third = "{name} met Rivern Frostwind of the Wintersaber Trainers in Winterspring.",
  },

  greetings = {
    { id = "g_default", text = "Keep your voice low near the cubs, {class}. They remember a loud stranger for a long time." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and the cubs didn't hiss at you this time. That's a start." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "We don't keep them, druid, we earn them, and the bond goes both ways or not at all. The Winterfall would kill them for their pelts, so I'd rather they stand beside us than lie in a furbolg's hut." } },
      choices = {
        { text = "Then the bond is honest. Keep earning it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A saber should run free in the snow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Rivern Frostwind, and the Wintersaber Trainers raise the frostsabers of this valley. The Winterfall furbolgs and the cold give us trouble enough, and we don't hand a saber to anyone who hasn't helped us with both." },
        { id = "h_cond", when = { race = "NightElf" }, text = "A child of Elune, so you'll know what a wintersaber means to our people. They are not horses, and we do not sell them as horses." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the Circle, here in the frostsaber valley. The cubs know your kind by scent, I think, and they come to you more readily than to the Sentinels who train beside me." },
      },
      again = {
        { id = "h_again1", text = "What else? The cubs need feeding." },
        { id = "h_again2", text = "Ask, then, and quietly." },
      },
      choices = {
        { text = "Is it right to keep the wintersabers, Rivern?", next = "druid_q", when = { class = "DRUID" } },
        { text = "How does one earn a wintersaber?", next = "sabers" },
        { text = "What trouble do the Winterfall make?", next = "winterfall" },
        { text = "How do you bear the cold?", next = "cold" },
        { text = "My family rode sabers in the old days.", next = "elf", when = { race = "NightElf" } },
        { text = "I'll leave you to your cats.", next = "END" },
      },
    },
    sabers = {
      lines = {
        { id = "sabers_default", text = "By feeding the cubs, by driving the Winterfall back from our grounds, and by coming back day after day until we know your face. Many riders give up long before the trainers are satisfied." },
      },
      choices = {
        { text = "That sounds like a very long road.", next = "sabers2" },
      },
    },
    sabers2 = {
      lines = {
        { id = "sabers2_default", text = "It is meant to be, because a saber that is earned is a saber that's honoured. Some think the trainers are too proud and ought to share with every Sentinel, and some think we give them away too easily as it is." },
      },
      choices = {
        { text = "You're right to be strict. Earned is honoured.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Every Sentinel deserves a good mount, earned or not.", next = "BACK", fx = { align = { order = -1 }, trait = { generous = 1 } } },
      },
    },
    winterfall = {
      lines = {
        { id = "winterfall_default", text = "They've gone wild like their cousins to the south, drinking some foul brew, and they raid our grounds for meat. The Timbermaw say the corruption came from Felwood, and I've no reason to doubt them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cold = {
      lines = {
        { id = "cold_default", text = "The same way the sabers do, by not complaining about it. You learn to love the snow here or you go home to Darnassus, and I've never wanted to go home." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    elf = {
      lines = {
        { id = "elf_default", text = "Then they'd tell you the same thing I do: be patient, and the cat will choose you. Come back tomorrow, and the day after, and we'll see." },
      },
      choices = {
        { text = "I will.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I raise frostsabers, and I have done for longer than most humans live." } },
    _none = { { id = "tp_none", text = "I don't know. The cubs might, but they're not telling." } },
  },
}

P:NPC {
  key = "salfa", id = TODO_NPC("Salfa"), name = "Salfa", title = "",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_winterspring" }, temper = { "steady" }, values = { "loyal", "protective" },
  impression = {
    first = "Salfa guards the Winterspring end of Timbermaw Hold's tunnels. Like the rest of his tribe he is wary of outsiders, and he's fair about it.",
    third = "{name} met Salfa, the Timbermaw furbolg who guards the Winterspring mouth of Timbermaw Hold.",
  },

  greetings = {
    { id = "g_default", text = "You come out of the tunnel alive, so the Timbermaw have let you pass. Salfa will not argue with that." },
    { id = "g_back", when = { metBefore = true }, text = "Salfa sees you again. The snow has not frozen you yet, which is good." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "The young ones, perhaps, if the firewater is taken from them before it takes them. The old shamans who pour it are lost, Salfa thinks, and a druid who tries to save them will only be bitten." } },
      choices = {
        { text = "I'll try to cleanse even the shamans.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The shamans chose this. They must die.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Salfa, and I watch this end of the tunnel for the Timbermaw. The Winterfall furbolgs of this valley have gone the way of the Deadwood, and Salfa would see them stopped before the madness spreads further north." },
        { id = "h_cond", when = { class = "SHAMAN" }, text = "A shaman. The spirits here are cold and angry, and Salfa thinks you can feel it too." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "Salfa sees a druid, and Salfa is glad. The Cenarion Circle and the Timbermaw once spoke often, and Salfa thinks they should speak again now that the Winterfall have fallen." },
      },
      again = {
        { id = "h_again1", text = "Speak. Salfa is listening." },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Can the Winterfall be cleansed, Salfa?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What happened to the Winterfall?", next = "winterfall" },
        { text = "Where does the tunnel lead?", next = "tunnel" },
        { text = "Do the Timbermaw trade with Everlook?", next = "everlook" },
        { text = "I feel the spirits' anger here.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Stay warm, Salfa.", next = "END" },
      },
    },
    winterfall = {
      lines = {
        { id = "winterfall_default", text = "Firewater, Salfa thinks, a brew that came into the valley from the south, and the satyrs' whispers in it. They drink it and lose themselves, and the more they drink the less of them remains." },
      },
      choices = {
        { text = "Can anyone stop it?", next = "winterfall2" },
      },
    },
    winterfall2 = {
      lines = {
        { id = "winterfall2_default", text = "Find where the brew comes from and break it, and kill the shamans who pour it. Some Timbermaw want to save the young ones who have not drunk deeply yet, and some say the whole tribe is lost." },
      },
      choices = {
        { text = "Save the young ones. They had no choice.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Lost is lost. Don't risk more lives on them.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    tunnel = {
      lines = {
        { id = "tunnel_default", text = "Under the mountains to Felwood, through the heart of our hold. Only friends of the Timbermaw walk it safely, so be thankful you walked it at all." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    everlook = {
      lines = {
        { id = "everlook_default", text = "A little, for the goblins will trade with anyone and the Timbermaw need iron. Salfa does not like their noise, but their coin is honest enough." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    shaman = {
      lines = {
        { id = "shaman_default", text = "Then listen to them, and do not let them make you angry too. That is how the Winterfall began, Salfa thinks, by listening to the wrong voices." },
      },
      choices = {
        { text = "Wise words. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Salfa is Timbermaw, and Salfa keeps the cold door." } },
    _none = { { id = "tp_none", text = "Salfa does not know. Salfa watches tunnels, not the world." } },
  },
}

P:NPC {
  key = "ranshalla", id = TODO_NPC("Ranshalla"), name = "Ranshalla", title = "Priestess of Elune",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "earnest" }, values = { "devout", "brave" },
  impression = {
    first = "Ranshalla is a priestess of Elune who means to relight the old altars of Winterspring, whatever waits around them. She is braver than she is careful.",
    third = "{name} met Ranshalla, a priestess of Elune seeking the old altars of Winterspring.",
  },

  greetings = {
    { id = "g_default", text = "Elune's light on you, traveller. Have you come to walk with me to the altar?" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I hoped you would, because the road to the altar is no safer than it was." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Something, I think, because the beasts gather near them as though they remember the light. When I light the torches they grow restless, and I can't tell whether they're angry or only waking." } },
      choices = {
        { text = "Light them. The old ways should return.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Perhaps the beasts guard them for a reason.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I think they do, though I'm a priestess and not a shaman, so I feel it as Elune's light and you'll feel it as something else. The ground around each altar stays a little warmer, and the wild things gather there even when they're dangerous to us. Whatever lives in these hills remembers that the altars once meant something." } },
      choices = {
        { text = "Sacred places deserve protecting, whoever raised them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Elune's altars are no concern of the Horde's.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman of the Horde? I didn't think one of you would come to an altar of Elune, but the spirits and the Mother Moon both watch these hills, so perhaps you belong here more than I thought." },
        { id = "h_default", text = "I am Ranshalla, a priestess of Elune, and there are old altars in these hills that have been dark for far too long. I mean to light their torches again, but the wild things guard them now, and I can't go alone." },
        { id = "h_cond", when = { class = "PRIEST" }, text = "A priest! Then you'll feel it too, when we reach the altar, the way the Mother Moon still listens there." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! The altars I mean to light were raised before the Sundering, and I think the Circle would be glad to see them burning again." },
      },
      again = {
        { id = "h_again1", text = "What else, friend?" },
        { id = "h_again2", text = "Speak, the moon is patient tonight." },
      },
      choices = {
        { text = "Do the old altars still draw the land's spirits?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do the altars mean to the wild things, Ranshalla?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's at the altar?", next = "altar" },
        { text = "Why do the altars matter to Elune?", next = "elune" },
        { text = "What guards the altars now?", next = "danger" },
        { text = "I'd be honoured to pray at the altar with you.", next = "priest", when = { class = "PRIEST" } },
        { text = "Elune keep you, Ranshalla.", next = "END" },
      },
    },
    altar = {
      lines = {
        { id = "altar_default", text = "A shrine our people built before the Sundering, and the guardians who were bound to it, and a door I can only open with every torch lit. I don't know all that lies beyond it, and that frightens me a little." },
      },
      choices = {
        { text = "Then why open it at all?", next = "altar2" },
      },
    },
    altar2 = {
      lines = {
        { id = "altar2_default", text = "Because what we've forgotten can't protect us, and Winterspring is full of forgotten things. My sisters in Darnassus say some doors were closed for good reasons, but I think they're only afraid." },
      },
      choices = {
        { text = "Open it. Knowledge lost is strength lost.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Your sisters may be right. Some doors stay closed.", next = "BACK", fx = { align = { order = 1 }, trait = { careful = 1 } } },
      },
    },
    elune = {
      lines = {
        { id = "elune_default", text = "Every altar is a place where the Mother Moon was asked to watch over us, and she doesn't forget a promise. When they go dark, I think the watching goes dim too." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "danger_default", text = "Wild beasts mostly, and the Winterfall furbolgs, and sometimes worse things drawn to old magic. I'll do my part with prayers if you'll do yours with steel." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    priest = {
      lines = {
        { id = "priest_default", text = "Then we'll light the last torch together, and Elune will hear two voices instead of one. That's how the old priestesses did it, you know, always in pairs." },
      },
      choices = {
        { text = "I'll be ready.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a priestess of the Temple of the Moon, though I've spent more time in the snow than in the temple lately." } },
    _none = { { id = "tp_none", text = "I don't know that one, but I'll ask Elune tonight, if you like." } },
  },
}

P:NPC {
  key = "haleh", id = TODO_NPC("Haleh"), name = "Haleh", title = "",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "mazthoril" }, temper = { "cold" }, values = { "wise", "proud" },
  impression = {
    first = "Haleh is a blue dragon who keeps watch in the icy caves of Mazthoril. She speaks to mortals as if she is not sure they deserve it, and she is fairly sure they don't.",
    third = "{name} met Haleh, a blue dragon who keeps watch in Mazthoril in Winterspring.",
  },

  greetings = {
    { id = "g_default", text = "A mortal, in Mazthoril. You must be either brave or lost, and I suspect it's the second." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the caves, little one. Malygos's children remember those who come twice." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The ice was here long before us, mortal, for Winterspring has always been cold. We chose these caves because the frost keeps out the curious and keeps in what we guard. If the spirits of the ice speak to you, they will tell you they tolerate us, which is more than they offer you." } },
      choices = {
        { text = "Every power needs a keeper. The ice is in good hands.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No flight owns the ice, Haleh, nor the magic.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You at least bargain with the powers you use instead of stealing them, which puts you a step above the mages, though not a large one." },
        { id = "h_default", text = "I am Haleh of the blue dragonflight, and these caves are ours to guard. Magic has been stolen and misused across this world, and the blue flight does not forgive those who play with what they don't understand." },
        { id = "h_cond", when = { class = "MAGE" }, text = "A mage. You wield a power that belongs to my flight, you know, and you wield it like a child with a lantern." },
      },
      again = {
        { id = "h_again1", text = "What else would you ask the blue flight?" },
        { id = "h_again2", text = "Speak, and be brief." },
      },
      choices = {
        { text = "Is the ice of Mazthoril the blue flight's doing?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does the blue flight guard?", next = "magic" },
        { text = "What is Mazthoril?", next = "mazthoril" },
        { text = "Who leads your flight?", next = "malygos" },
        { text = "Then teach me to wield it properly.", next = "mage", when = { class = "MAGE" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    magic = {
      lines = {
        { id = "magic_default", text = "Magic itself, little one, the arcane that runs beneath the world. The Highborne nearly ended everything with it, and the Legion came through the door they opened." },
      },
      choices = {
        { text = "Mortals use magic every day now.", next = "magic2" },
      },
    },
    magic2 = {
      lines = {
        { id = "magic2_default", text = "They do, and they are rarely wise about it, which is why we watch. Some of my kin would take it from mortals entirely, and some say you must be allowed to learn from your own mistakes." },
      },
      choices = {
        { text = "Mortals must learn on their own, mistakes and all.", next = "BACK", fx = { align = { order = -1 }, trait = { independent = 1 } } },
        { text = "Some power is too dangerous. Guard it closely.", next = "BACK", fx = { align = { order = 1 }, trait = { careful = 1 } } },
      },
    },
    mazthoril = {
      lines = {
        { id = "mazthoril_default", text = "A warren of ice caves beneath the snow, full of creatures the cold has kept alive since before your kingdoms. It suits a dragon who does not wish to be disturbed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    malygos = {
      lines = {
        { id = "malygos_default", text = "Malygos, the Spell-Weaver, who was wounded long ago in ways mortals would not understand. We do not speak of him lightly, and neither should you." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK" },
      },
    },
    mage = {
      lines = {
        { id = "mage_default", text = "A dragon does not teach children, she watches them, and corrects them if they set the house on fire. Prove yourself careful first, and perhaps one day we will speak again." },
      },
      choices = {
        { text = "Fair. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am of the blue flight, and older than your oldest city." } },
    _none = { { id = "tp_none", text = "That is not a question worth a dragon's breath, little one." } },
  },
}

P:NPC {
  key = "lorax", id = TODO_NPC("Lorax"), name = "Lorax", title = "",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "bitter" }, values = { "regretful", "cunning" },
  impression = {
    first = "Lorax is a satyr living alone in Winterspring, cast out or fled from his own kind, and full of regret for the bargain that made him what he is. He has a tale to tell, and wants a hero to finish it.",
    third = "{name} met Lorax, a lonely satyr in Winterspring with a tale of a demon's bargain.",
  },

  greetings = {
    { id = "g_default", text = "Don't draw your blade, mortal, I'm no friend to the satyrs you've been killing. Sit, and hear what Lorax has to say." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to hear more of Lorax's tale. Few would." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Less than Felwood, but it reached. Demons still keep to Darkwhisper Gorge in the south of this valley, and the snow around it is never quite clean. I could tell you the spirits fled, shaman, but I think they simply turned their backs, which is what anyone sensible does with a satyr." } },
      choices = {
        { text = "Spirits forgive more than you'd think, if you make amends.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You chose your bargain. Your debts are your own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The spirits must loathe me, I suppose, and I would in their place, for I gave away everything they would have given me freely." },
        { id = "h_default", text = "I am Lorax, and once I was something better than this, before I bargained my soul away to the Legion. Now I want only to strike back at the demon who holds my debt, and I can't do it alone." },
        { id = "h_cond", when = { class = "WARLOCK" }, text = "A warlock, of all things. Then you know already how a demon's bargain works, and how it always ends." },
      },
      again = {
        { id = "h_again1", text = "There is more of the tale, if you have the stomach for it." },
        { id = "h_again2", text = "Ask. Lorax has nothing but time." },
      },
      choices = {
        { text = "Did the Legion's touch reach Winterspring's land too?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Tell me your tale, then.", next = "tale" },
        { text = "What about the other satyrs here?", next = "satyrs" },
        { text = "Why hide in Winterspring?", next = "winterspring" },
        { text = "Every bargain has a loophole.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I'll think on your tale.", next = "END" },
      },
    },
    tale = {
      lines = {
        { id = "tale_default", text = "I was Highborne once, and I wanted power, and the Legion gave it to me with horns and hooves attached. The demon who holds my soul has grown careless, and with the right help I could make him pay." },
      },
      choices = {
        { text = "Why should I trust a satyr?", next = "tale2" },
      },
    },
    tale2 = {
      lines = {
        { id = "tale2_default", text = "You shouldn't, and I'd think less of you if you did. But a satyr who regrets is rarer than a dragon's tooth, and some would say I deserve a second chance, while others would say I deserve the blade." },
      },
      choices = {
        { text = "Everyone deserves a chance to set things right.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "You chose this. Your debt is yours to pay.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    satyrs = {
      lines = {
        { id = "satyrs_default", text = "They chose their masters and they're happy in their chains, and they'd kill me if they found me. Lorax keeps to his cave and keeps his head down." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    winterspring = {
      lines = {
        { id = "winterspring_default", text = "Because demons hate the cold nearly as much as I do, and the snow covers tracks. It's a miserable place, and that's the best thing I can say for it." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    warlock = {
      lines = {
        { id = "warlock_default", text = "Every bargain has one, yes, and the demons write them in for themselves. Find mine for me, warlock, and Lorax will owe you more than a satyr can repay." },
      },
      choices = {
        { text = "We'll see.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was Highborne, once, and a fool. Now I'm only the fool." } },
    _none = { { id = "tp_none", text = "Lorax doesn't know, and Lorax has stopped pretending to." } },
  },
}

P:NPC {
  key = "himmik", id = TODO_NPC("Himmik"), name = "Himmik", title = "Food & Drink",
  bible = "bibles/winterspring.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "cheerful" }, values = { "comfort", "practical" },
  impression = {
    first = "Himmik is a goblin who sells hot food and drink in Everlook, which in Winterspring is the next best thing to sunshine. He talks up his soup like it's a war hero.",
    third = "{name} met Himmik, the goblin food vendor in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Hot food, hot drink, hotter than anywhere north of Felwood, guaranteed! Well, mostly guaranteed." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more, eh? Nobody leaves Himmik's hungry, or at least not for long." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Spoil them? It keeps them, friend, it's the best larder in Kalimdor! The trouble is getting the stores here at all, through the tunnels or over the pass, and the snow shuts one or the other every week. The way I see it, the frost spirits and I have a deal: they keep my meat cold, and I don't complain about the wind." } },
      choices = {
        { text = "That's a fair bargain. Keep your word to the frost.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No bargain binds the wind. It'll take what it likes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll be wanting something hot, I'll bet, because no spirit I ever heard of can make a stew in this cold." },
        { id = "h_default", text = "Himmik's the name, food and drink's the game, and in Everlook that's the most important trade there is. Everything I sell has to come over the pass or through the tunnels, so believe me, the prices are a bargain." },
        { id = "h_cond", when = { race = "Dwarf" }, text = "A dwarf! You'll want something that sticks to the ribs, and I've got a stew that'll hold up a mine shaft." },
      },
      again = {
        { id = "h_again1", text = "What else? The soup's getting cold." },
        { id = "h_again2", text = "Anything else for you?" },
      },
      choices = {
        { text = "Does the cold up here ever spoil your stores, Himmik?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's cooking?", next = "BUSINESS" },
        { text = "What's good today?", next = "food" },
        { text = "How's business in Everlook?", next = "everlook" },
        { text = "I'll try that stew.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Keep the soup warm.", next = "END" },
      },
    },
    food = {
      lines = {
        { id = "food_default", text = "The bread's fresh, the cheese is aged, and the meat, well, it was walking last week, which is about as fresh as Winterspring gets. Everything tastes better in the cold, that's what I always say." },
      },
      choices = {
        { text = "I'll take your word for it.", next = "BACK" },
      },
    },
    everlook = {
      lines = {
        { id = "everlook_default", text = "Booming, friend, booming! Every adventurer chasing furbolgs and frostsabers comes through here cold and starving, and the Steamwheedle Cartel don't care if you're Horde or Alliance so long as your coin's real." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = {
        { id = "dwarf_default", text = "Now there's a dwarf with sense, and if it doesn't warm you through I'll eat my hat, and it's a very nice hat, so you see how sure I am." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Steamwheedle through and through, and I feed Everlook." } },
    _none = { { id = "tp_none", text = "No idea, friend, but have you tried the soup?" } },
  },
}
