-- Beyond the Sepulcher: deathstalkers on the southern roads, and the bat handler. Voice: bibles/roads.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "erland", id = TODO_NPC("Deathstalker Erland"), name = "Deathstalker Erland",
  bible = "bibles/roads.md", role = "soldier", tier = "quest",
  communities = { "sepulcher" }, temper = { "jumpy" }, values = { "dutiful", "careful" },
  notices = { "race" },
  impression = {
    first = "Deathstalker Erland is supposed to be a silent killer of the Dark Lady's enemies, and he is, mostly, except at night, in Silverpine, near worgen. He'd like company on the road.",
    third = "{name} met Deathstalker Erland, a Forsaken scout who needed an escort through worgen country in Silverpine.",
  },

  greetings = {
    { id = "g_road", text = "Quietly, please. Every tree in this forest has ears, and some of them have teeth as well." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Living Horde, out here. The worgen will smell you a mile off, which I suppose means they'll go for you first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathstalker Erland, of the Sepulcher. I'm to report to Rane Yorick down the road, but the worgen have been thick along it, and one deathstalker alone is only a meal." },
        { id = "h_escort", tags = { "news" }, when = { questActive = TODO_QUEST("Escorting Erland") },
          text = "You'll walk with me? Good, then stay close, keep your blade out, and if you hear howling, don't stop to admire it." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You're no friend of the Sepulcher, so I'll keep my hand on my knife while we talk. Still, you've not drawn on me, and the worgen won't care which flag either of us flies." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out here! Good, because I'd much rather the worgen were frightened of your lightning than hungry for my legs." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, good. You'll smell them before I do, and you'll know a worgen's scent from a wolf's, which I never can." },
      },
      choices = {
        { text = "Do the worgen fear the storm, Erland?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Are the worgen beasts, Erland, or something worse?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I hunt worgen in these woods. Any advice?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I was a deathstalker recruit. Tell me what to watch for.", next = "recruit", when = { origin = "forsaken_deathstalker_recruit" } },
        { text = "What are the worgen?", next = "worgen" },
        { text = "Who is Rane Yorick?", next = "yorick" },
        { text = "A deathstalker afraid of the dark?", next = "afraid" },
        { text = "Good luck on the road.", next = "END" },
      },
      again = { { id = "h_again", text = "What else? Speak low; the trees are listening." } },
    },
    worgen = {
      lines = {
        { id = "wo_default", text = "Arugal's work, the mage from Dalaran who called them up to fight us and then lost his mind to them. They walk like men and hunt like wolves, and they don't stay dead the first time." },
      },
      choices = { { text = "Where did Arugal go?", next = "worgen_arugal" } },
    },
    worgen_arugal = {
      lines = {
        { id = "wa_default", text = "Shadowfang Keep, on the hill south of Pyrewood. He calls the worgen his children, and they're the only family that would still have him." },
      },
      choices = {
        { text = "Arugal must be destroyed, whatever it costs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Sepulcher should plan it carefully first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = "worgen" } },
      },
    },
    yorick = {
      lines = {
        { id = "yo_default", text = "One of our best, keeping watch on the south road and on Pyrewood village. She collects reports from all the scouts in the woods, and she doesn't like waiting for mine." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    afraid = {
      lines = {
        { id = "af_default", text = "Not of the dark, of what's in it. I was killed once already, by the Scourge, and I'd rather not be killed again by something with fleas." },
      },
      choices = { { text = "Fair. I'll watch your back.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Hunt them in daylight and never alone, and don't follow a wounded one into the trees, because that's exactly what it wants. They're cleverer than wolves and crueler than men." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "{pet} will smell them before you do, and that's the one advantage you'll have out here, so trust its nose over your eyes. Just don't let it chase a wounded one into the trees, because that's exactly what the worgen want." },
      },
      choices = {
        { text = "I'll face them openly, and finish what I wound.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll set traps and let them come to me.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    recruit = {
      lines = { { id = "rc_default", text = "Then you'll know the drill, at least. Watch the tree line, not the road, because the worgen come from the side and never from the front." } },
      choices = { { text = "The tree line. Understood.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They don't fear much, but they don't like loud things they can't bite, and thunder is louder than I am, at least. Walk with me to Yorick's farm, would you, and if you hear howling, call down something bright before they reach us." } },
      choices = {
        { text = "I'll stay at your side all the way to Yorick.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go where the worgen are and draw them off.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Worse, because a beast hunts when it's hungry, and they hunt when they're bored. The old foresters say Arugal didn't make them so much as call them from somewhere, and I'd like to know where, so I can avoid it." } },
      choices = {
        { text = "Whatever they are, theirs is a curse to be broken.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Cursed or not, I'll kill them like any beast.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "Wolves that walk like men. Keep your fire bright and your back to a wall." } },
    _none = { { id = "tp_none", text = "Ask Yorick; she knows the woods, and I know the road." } },
  },
}

P:NPC {
  key = "yorick", id = TODO_NPC("Rane Yorick"), name = "Rane Yorick",
  bible = "bibles/roads.md", role = "soldier", tier = "quest",
  communities = { "sepulcher" }, temper = { "cool" }, values = { "dutiful", "sharp" },
  notices = { "class" },
  impression = {
    first = "Rane Yorick watches the south road from a dead farm's window, and she has been watching long enough to tell a worgen's gait from a wolf's at a hundred paces. She is unimpressed by most things.",
    third = "{name} met Rane Yorick, a Forsaken deathstalker keeping watch over Pyrewood and the southern roads of Silverpine.",
  },

  greetings = {
    { id = "g_window", text = "You're in my light. Step to the side, slowly, and tell me why you're here." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. Then you'll understand why I don't sit near the door." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rane Yorick, deathstalker. I watch Pyrewood and the south road for the Sepulcher, and I collect the reports the other scouts bring, when they live long enough to bring them." },
        { id = "h_erland", tags = { "news" }, when = { questDone = TODO_QUEST("Escorting Erland") },
          text = "You got Erland here in one piece, which is more than he usually manages himself. I'll have his report, and then I'll have a word with him about the noise he makes." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your totems are bright enough to be seen from Pyrewood, so plant them somewhere other than under my window." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'll be wondering about Pyrewood, I expect; everyone with fur does." },
      },
      choices = {
        { text = "Do the worgen fear anything, Yorick?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could the worgen curse be broken, Yorick?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You keep watch alone out here, Yorick?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Do the gnolls trouble you this far south?", next = "gnolls" },
        { text = "What's happening in Pyrewood?", next = "pyrewood" },
        { text = "What do the scouts report?", next = "reports" },
        { text = "I'm a deathstalker too. Any orders?", next = "deathstalker", when = { origin = "forsaken_deathstalker_recruit" } },
        { text = "I'll leave you to your window.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? Be quick, the light's going." } },
    },
    pyrewood = {
      lines = {
        { id = "py_default", text = "The villagers are living, by day, and they lock their doors well before dusk. By night, something else walks their streets, and I've not yet decided whether they know." },
      },
      choices = { { text = "You think the villagers are the worgen?", next = "pyrewood_curse" } },
    },
    pyrewood_curse = {
      lines = {
        { id = "pc_default", text = "I think nobody in Pyrewood has been seen after dark, and that worgen walk out of Pyrewood every night. Draw what lines you like between those two facts; I already have." },
      },
      choices = {
        { text = "They might be cursed innocents. We should be careful.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Cursed or not, they're a threat. Burn it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    reports = {
      lines = {
        { id = "re_default", text = "Worgen to the south, gnolls to the west, Dalaran's mages at Ambermill, and the Scourge never far off. High Executor Hadrec gets all of it, and he reads every word." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    deathstalker = {
      lines = {
        { id = "de_default", text = "Then you'll know orders come from the Sepulcher, not from me. But if you're going south anyway, count the worgen you see and tell me the number, because nobody else is counting properly." },
      },
      choices = { { text = "I'll count them.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Alone is the job, warrior, and I'm good at it. Shadowfang Keep sits on that ridge full of horrors, and somebody has to count them so the Sepulcher knows when to worry." } },
      choices = {
        { text = "Then I'll stand with you a while.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Better you than me. I'd rather go where the fighting is.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    gnolls = {
      lines = { { id = "gn_default", text = "Less than the worgen, because the gnolls are afraid of them too. It's the one thing I'd thank Arugal for, if he were the sort to accept thanks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Fire, and a deathstalker who doesn't blink. Your lightning might put them off for a night, but a pack that's been put off comes back angrier, so if you mean to fight them, mean it." } },
      choices = {
        { text = "Then I'll mean it, and finish what I start.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll strike and fade. Let them chase shadows.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Perhaps, if anyone knew what it was, and nobody in the Sepulcher does. I watch Pyrewood every night, druid, and I've seen a woman bolt her shutters at dusk and a worgen climb out of the same window an hour later." } },
      choices = {
        { text = "Then the villagers deserve mercy, if it can be found.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then the village is the danger, and it should burn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's not my concern, for Pyrewood is my concern." } },
  },
}

P:NPC {
  key = "karos", id = TODO_NPC("Karos Razok"), name = "Karos Razok",
  bible = "bibles/roads.md", role = "flightmaster", tier = "service",
  communities = { "sepulcher" }, temper = { "dry" }, values = { "patient" },
  notices = { "race", "pet" },
  impression = {
    first = "Karos Razok keeps the Sepulcher's bats, and speaks to them more gently than he speaks to anyone else. He seems to find the living tiresome and the dead only a little better.",
    third = "{name} met Karos Razok, the bat handler of the Sepulcher.",
  },

  greetings = {
    { id = "g_bats", text = "Don't wave your arms about; the bats think it's a challenge." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. The bats will grumble at the weight, but they'll carry you, if you sit still." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} away from the perches, if you please. My bats have lost friends to a hunter's beast before, and they remember." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Karos Razok, bat handler to the Sepulcher. If you want the Undercity or Tarren Mill, I've a bat for you, and if you want conversation, I've very little." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The bats can smell a storm coming, and they're smelling one now, so keep your hands still." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You can outrun my bats on the flat, I'm told, but you'll not run across Lordamere Lake." },
      },
      choices = {
        { text = "Do your bats trust the living, Karos?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you trade your bats for a living beast, Karos?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Will the bats carry a hunter's beast, Karos?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Where do the bats come from?", next = "bats" },
        { text = "Are the roads really that bad?", next = "roads" },
        { text = "Just passing.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? The bats are getting restless." } },
    },
    bats = {
      lines = {
        { id = "ba_default", text = "Bred under the Undercity, in the dark where they're happiest. They're loyal, quiet and never ask questions, which makes them better company than most." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "They'll carry it if it's well behaved and doesn't try to eat them, which you'd be surprised how many try. Keep it calm on the flight and the bat will keep calm too." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet}? My bats will carry it if it behaves and doesn't try to eat them, and you'd be surprised how many try. Keep it calm on the flight and the bat will keep calm too." },
      },
      choices = {
        { text = "My companion's well trained. It won't trouble them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If it bites a bat, the bat should have been quicker.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    roads = {
      lines = {
        { id = "ro_default", text = "Worgen at night and gnolls by day, so yes. The bats fly over all of it, which is why I'm the most popular person in the Sepulcher, and the least thanked." },
      },
      choices = { { text = "Thank you, then, Karos.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They trust whoever feeds them and doesn't wave about, and they don't care which side of the grave you're on. Tauren are heavier than they'd like and trolls fidget, but the orcs sit still, I'll give them that, as if they'd ridden worse." } },
      choices = {
        { text = "I'll sit still and respect the beast.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A mount should carry whoever pays.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "No. A living beast would spook at me, and a bat doesn't, and that's all I need from a creature. You'll understand that better than most, druid, since you're half beast yourself on a good day." } },
      choices = {
        { text = "Every beast deserves a keeper who cares for it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Use what serves you, Karos. Sentiment slows a keeper.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask someone with fewer bats to feed." } },
  },
}
