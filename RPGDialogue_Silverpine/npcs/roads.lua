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
    { id = "g_xremember", when = { origin = "forsaken_scourge_remembered" }, text = "You remember the Scourge years, don't you? Then you'll remember how quietly the dead moved through these pines, so move like that again, please, because the worgen hear everything else." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and I've walked these roads alone the whole time, which I didn't enjoy one bit. Quietly now, though; the trees are listening." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "I hear you made someone back down at the Sepulcher. I wish you'd come along at night and do the same to the worgen." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "Living Horde, out here. The worgen will smell you a mile off, which I suppose means they'll go for you first." },
  },

  start = "hello",
  nodes = {
    xcl_sfk = {
      big = true,
      lines = { { id = "xcl_sfk_default", text = "Then I owe you, and so does every deathstalker who's had to walk this road at night. Adamant and Vincent went into that keep before I ever joined the Sepulcher, and the older stalkers still talk about it in low voices, so now they'll have something better to talk about." } },
      choices = {
        { text = "Tell them it was done for the deathstalkers who went before.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Tell them whatever makes the road easier. The truth won't.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Will the worgen scatter, now that Arugal's gone?", next = "xcl_sfk2" },
      },
    },
    xcl_sfk2 = {
      lines = { { id = "xcl_sfk2_default", text = "Rane Yorick says they will, and Rane Yorick is never wrong, except about how dangerous things are, which he always says are less dangerous than they are. I'll keep my blade out either way, because a scattered worgen still has teeth." } },
      choices = {
        { text = "Keep your blade out, Erland. That's wise.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I've no idea, if I'm honest, but they fear something, because they howl at the Sepulcher and never come close. I'd like to believe it's a paladin's glow that keeps them off, and I'd like it even more if you'd let me believe it as far as Rane's farm." } },
      choices = {
        { text = "Walk behind me, then. I'll see you there safely.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Believe what you like. You'll be walking alone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I'm afraid of being torn apart and still awake for it, which is a different thing, and the worgen don't seem to mind which bits they eat. The Dark Lady gave me a second life, and I'd like to keep it in one piece. A priest walking beside me makes the road to the Sepulcher feel a good deal shorter." } },
      choices = {
        { text = "Then I'll walk with you, Erland. Stay close.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your fear is your problem, Erland, not mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Want it? I'd beg for it, if deathstalkers were allowed to beg. Walk in front where the worgen can see you, and I'll stay behind where they can't, and between us we might reach Yorick with all our limbs." } },
      choices = {
        { text = "I'll walk in front. Someone has to take the first blow.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You walk in front, Erland. I'll watch from behind.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathstalker Erland, of the Sepulcher. I'm to report to Rane Yorick down the road, but the worgen have been thick along it, and one deathstalker alone is only a meal." },
        { id = "h_escort", tags = { "news" }, when = { questActive = TODO_QUEST("Escorting Erland") },
          text = "You'll walk with me? Good, then stay close, keep your blade out, and if you hear howling, don't stop to admire it." },
        { id = "h_cl_sfk", tags = { "news" }, when = { cleared = "Shadowfang Keep", faction = "Horde" },
          text = "Is it true that Arugal's dead? The worgen on the road last night seemed less sure of themselves, and I'd like to believe it was that and not my imagination." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You're no friend of the Sepulcher, so I'll keep my hand on my knife while we talk. Still, you've not drawn on me, and the worgen won't care which flag either of us flies." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out here! Good, because I'd much rather the worgen were frightened of your lightning than hungry for my legs." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, good. You'll smell them before I do, and you'll know a worgen's scent from a wolf's, which I never can." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Thank the Dark Lady, because a deathstalker's knife is a fine thing in the dark, but it's no good against a worgen twice my size." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Wonderful, because if a worgen takes a bite out of me on this road, I'd like someone close by who knows what to do about it." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, on the road to Yorick's? Oh, please, walk with me, because I've heard the worgen hate holy light, and I'd very much like to find out if it's true from behind you." },
      },
      choices = {
        { text = "Are you afraid of dying again, Erland?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the worgen fear the storm, Erland?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Are the worgen beasts, Erland, or something worse?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I hunt worgen in these woods. Any advice?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I was a deathstalker recruit. Tell me what to watch for.", next = "recruit", when = { origin = "forsaken_deathstalker_recruit" } },
        { text = "What are the worgen?", next = "worgen" },
        { text = "Who is Rane Yorick?", next = "yorick" },
        { text = "A deathstalker afraid of the dark?", next = "afraid" },
        { text = "How does a rogue move through Silverpine unseen, Erland?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can fire keep the worgen off, Erland?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Could a demon track a worgen, Erland?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you want a shield beside you on the road, Erland?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the worgen really fear the Light, Erland?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "It's true, Erland. Arugal is dead, and his keep is quiet.", next = "xcl_sfk", when = { cleared = "Shadowfang Keep", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Slowly, and downwind, because the worgen hunt by smell and they've better noses than any hound in Lordaeron. Keep off the roads at night and out of the Dead Field, and if you hear howling behind you, don't stop to see what it is." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "The worgen can smell rot, which is a hard thing for the likes of us to hide, so the deathstalkers rub pine sap into their cloaks before they go south. It doesn't always work, but it works more often than not, and I've learned to be grateful for that." },
      },
      choices = {
        { text = "Patience and stealth. I'll keep to the shadows.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "If a worgen finds me, I'll stand and fight.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What are the worgen, exactly?", next = "worgen" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It keeps them off for a while, which is more than steel does, since they shrug off a blade far too easily for my liking. They're Arugal's creatures, and Arugal was Dalaran's, so I'd say your sort owes Silverpine a good deal of fire." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "If you studied in Dalaran, you'll have heard Arugal's name spoken with respect, back when he was the Kirin Tor's answer to the Scourge. Now his answer runs through these woods on four legs, and the Kirin Tor won't say his name at all." },
      },
      choices = {
        { text = "Dalaran's mistakes are mine to burn away, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dalaran's done nothing for me. I owe it nothing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who is Rane Yorick?", next = "yorick" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I'd not want to be in the woods when it found one, since I can't decide which of the two I'd rather run from. Try it if you like, but try it in daylight, and somewhere a long way from me." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "A demon and a worgen fighting over the same patch of Silverpine sounds like the sort of thing the Dark Lady would enjoy hearing about. Go and try it, and I'd be glad to tell her the story myself." },
      },
      choices = {
        { text = "I'll set it loose at night, where it hunts best.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll do it in daylight, openly, as you say.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A deathstalker afraid of the dark?", next = "afraid" },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It would draw everything out, worgen and Scourge and every Dalaran mage in the wood with an eye for strange lights. I'd rather you didn't, but if you mean to, tell me first, so I can count how many come and report it properly." } },
      choices = {
        { text = "I'll tell you first. Your reports matter.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll draw them out when I see fit.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The villagers bar their doors at dusk, and by moonrise they're worgen, every one of them, howling down the south road. By morning they're farmers again and none the wiser, or so they pretend. I don't know what a priest could do for them, but I've never seen anyone try." } },
      choices = {
        { text = "They're cursed, not damned. Someone should try.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to burn the village and end it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That they run like wolves and stand like men, and you'll find both kinds of print in the same mud. Where the prints turn upright, they're thinking, and that's when you should leave." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That they run like wolves and stand like men, and your {pet} will smell them before you see either kind of print. Where the prints turn upright, they're thinking, and that's when you should leave." },
      },
      choices = {
        { text = "I'll report what I find, Yorick, and leave it there.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll follow the prints wherever they go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rane Yorick, deathstalker. I watch Pyrewood and the south road for the Sepulcher, and I collect the reports the other scouts bring, when they live long enough to bring them." },
        { id = "h_erland", tags = { "news" }, when = { questDone = TODO_QUEST("Escorting Erland") },
          text = "You got Erland here in one piece, which is more than he usually manages himself. I'll have his report, and then I'll have a word with him about the noise he makes." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your totems are bright enough to be seen from Pyrewood, so plant them somewhere other than under my window." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'll be wondering about Pyrewood, I expect; everyone with fur does." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have seen worgen tracks on the way in, if you were looking, and they get bigger the closer you come to Pyrewood." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You can pray for Pyrewood if you like, but I've watched that village for months, and nothing has answered it yet." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. Bright, aren't you, and the worgen across the road can see you from Pyrewood, so either stand back from the window or make yourself useful by drawing them out." },
      },
      choices = {
        { text = "What happens in Pyrewood at night, Yorick?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the worgen fear anything, Yorick?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could the worgen curse be broken, Yorick?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You keep watch alone out here, Yorick?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Do the gnolls trouble you this far south?", next = "gnolls" },
        { text = "What's happening in Pyrewood?", next = "pyrewood" },
        { text = "What do the scouts report?", next = "reports" },
        { text = "I'm a deathstalker too. Any orders?", next = "deathstalker", when = { origin = "forsaken_deathstalker_recruit" } },
        { text = "What do your scouts see of Ambermill's mages, Yorick?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I could send an imp to watch Pyrewood for you.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What can a hunter learn from the worgen tracks, Yorick?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Would the Light draw the worgen out for you, Yorick?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Too much and not enough, since they've put wards around the place that turn my scouts' eyes aside like rain off oilcloth. Dalaran's mages are digging in Silverpine for something, and I'd very much like a mage of our own to tell me what." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "If you studied in Dalaran, you might know some of the faces at Ambermill, which could be useful or could be very painful. Either way, I'd rather know which before I send you down there." },
      },
      choices = {
        { text = "Old faces or not, I'll report what I find.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll deal with Ambermill my own way, Yorick.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do the scouts report?", next = "reports" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "An imp in Pyrewood would be noticed, since the villagers there are human by day and something else entirely by night, and both kinds would chase it. I'll keep my own eyes on the road, thank you, though I appreciate the thought." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc warlock in Silverpine is farther from home than any of us, and I'll not turn down an extra pair of eyes. Keep your imp off my windowsill, though; it leaves scorch marks." },
      },
      choices = {
        { text = "Then I'll go myself and keep the imp close.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The imp goes where I send it, Yorick.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's happening in Pyrewood?", next = "pyrewood" },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Only that you chose to keep something the rest of us lost, and that the keeping seems to hurt. I lost a good deal when I died, and I've not missed most of it, so I suppose I'm curious what makes the Light worth the trouble." } },
      choices = {
        { text = "It's worth the pain because it's still good.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It isn't worth it. I keep it because it's mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They sense everything, which is why I like them better than people. They grew used to the Forsaken quickly enough, though they still go quiet when a priest walks past the roost. Either they're showing respect, or they're waiting to see if you'll make a meal." } },
      choices = {
        { text = "Then I'll walk past gently and let them rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them stay wary. Fear keeps a creature obedient.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They can, and they will, though they'll sulk about it for a day afterward, and a sulking bat is no fun to feed. Strap your shield down and keep still, and you'll be in Tarren Mill before the worgen notice you've gone." } },
      choices = {
        { text = "I'll strap it down and keep still, Karos.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My shield stays on my arm, sulking bat or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because your spells take you to the Undercity and nowhere else, and my bats go to Tarren Mill and back again. They don't care for magic, though, so keep your hands still in the saddle and they won't drop you in the lake." },
      },
      choices = {
        { text = "I'll ride gently. Your bats deserve that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A bat that drops me becomes a frozen bat.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Karos Razok, bat handler to the Sepulcher. If you want the Undercity or Tarren Mill, I've a bat for you, and if you want conversation, I've very little." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The bats can smell a storm coming, and they're smelling one now, so keep your hands still." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You can outrun my bats on the flat, I'm told, but you'll not run across Lordamere Lake." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. My bats can carry your weight, but they'd rather you left some of that iron behind." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The bats don't need praying over, so if that's why you came, you can go back down the hill." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You could teleport, I suppose, but a bat doesn't need a reagent, so here we are." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. The bats don't care what you pray to, so neither do I, though I'd thank you not to glow in the roost." },
      },
      choices = {
        { text = "Do the bats sense what you are, Karos?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your bats trust the living, Karos?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you trade your bats for a living beast, Karos?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Will the bats carry a hunter's beast, Karos?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Where do the bats come from?", next = "bats" },
        { text = "Are the roads really that bad?", next = "roads" },
        { text = "Can I ride a bat out quietly, Karos?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Would your bats tolerate a demon riding along?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Can your bats carry a warrior in full mail, Karos?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why would a mage need your bats, Karos?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Does anything about a paladin interest you, Karos?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Bats are quiet enough in the air, but they shriek when they land, so if you're hoping to arrive unannounced, get off a mile early and walk. The deathstalkers learned that the hard way, and so did the bats." },
        { id = "xrogue_troll", when = { race = "Troll" }, text = "The bats like trolls better than they like us, since you smell less of the grave. They'll still shriek when they land, mind, so get off a mile early if you want to arrive unannounced." },
      },
      choices = {
        { text = "I'll walk the last mile quietly, as you say.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather arrive with a shriek and fight.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Are the roads really that bad?", next = "roads" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They'd tolerate it for about as long as it takes to throw both of you off, and I'd not blame them. Dismiss the thing before you mount, and the bat will carry you as gently as any of the dead." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You smell of sulphur and grave dirt in equal measure, and the bats don't care for either, though they'll put up with the second. Send the demon home before you fly, and we'll get along." },
      },
      choices = {
        { text = "I'll dismiss it first. The bats deserve that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The demon stays with me, Karos.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where do the bats come from?", next = "bats" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask someone with fewer bats to feed." } },
  },
}
