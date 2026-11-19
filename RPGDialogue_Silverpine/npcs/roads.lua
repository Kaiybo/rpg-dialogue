-- Beyond the Sepulcher: deathstalkers on the southern roads, and the bat handler. Voice: bibles/roads.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "erland", id = TODO_NPC("Deathstalker Erland"), name = "Deathstalker Erland",
  bible = "bibles/roads.md", role = "soldier", tier = "quest",
  communities = { "sepulcher" }, temper = { "jumpy" }, values = { "dutiful", "careful" },
  notices = { "race", "lock_steed" },
  impression = {
    first = "For a silent killer, he badly wants company on the night road.",
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
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "A horse with burning hooves would see us down the south road faster than any worgen could run. I'd ride behind you, if it'd have me, and I wouldn't complain about the smell." },
  },

  start = "hello",
  nodes = {
    op_varimathras = {
      big = true,
      lines = {
        { id = "opvm_default", text = "To Lord Varimathras, and most of us would rather not think too hard about what that means. Does it bother you, a dreadlord standing at the Dark Lady's side?" },
      },
      choices = {
        { text = "Yes. A demon serves no one but himself.", next = "op_varimathras_r1", fx = { align = { order = -1 }, trait = { cautious = 1 }, opinion = { varimathras = "distrust" } } },
        { text = "She chose him. That's enough for me.", next = "op_varimathras_r2", fx = { align = { order = 1 }, opinion = { varimathras = "trust" } } },
        { text = "Demons can be bound. She's clearly bound him well.", next = "op_varimathras_r3", fx = { trait = { practical = 1 }, opinion = { varimathras = "useful" } }, when = { class = "WARLOCK" } },
        { text = "Not my business, Erland.", next = "BACK" },
      },
    },
    op_varimathras_r1 = {
      lines = { { id = "opvm_r1", text = "Keep your voice down, even out here. I think the same, and I think it very quietly, and I'm still alive, more or less." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_varimathras_r2 = {
      lines = { { id = "opvm_r2", text = "That's what the Sepulcher's officers say, and I'd like to believe them. I'll go on watching the woods and leave the dreadlord to the Dark Lady." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_varimathras_r3 = {
      lines = { { id = "opvm_r3", text = "If anyone would know, it's you, so I'll take that as a comfort. Just don't tell me how the binding works, because I'll sleep worse for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcl_sfk = {
      big = true,
      lines = { { id = "xcl_sfk_default", text = "Then I owe you, and so does every deathstalker who's had to walk this road at night. Adamant and Vincent went into that keep before I ever joined the Sepulcher, and the older stalkers still talk about it in low voices, so now they'll have something better to talk about." } },
      choices = {
        { text = "Tell them it was done for the deathstalkers who went before.", next = "BACK", reply = "I'll tell them exactly that, and I'll cut Vincent's name a little deeper for it. Thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Tell them whatever makes the road easier. The truth won't.", next = "BACK", reply = "You may be right, and the truth has never made this road easier for me. Still, they'll hear it from me.", fx = { align = { honor = -1 } } },
        { text = "Will the worgen scatter, now that Arugal's gone?", next = "xcl_sfk2" },
      },
    },
    xcl_sfk2 = {
      lines = { { id = "xcl_sfk2_default", text = "Rane Yorick says they will, and Rane Yorick is never wrong, except about how dangerous things are, which she always says are less dangerous than they are. I'll keep my blade out either way, because a scattered worgen still has teeth." } },
      choices = {
        { text = "Keep your blade out, Erland. That's wise.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I've no idea, but they fear something, because they howl at the Sepulcher and never come close. I'd like to believe it's a paladin's glow that keeps them off, and I'd like it even more if you'd let me believe it as far as Rane's farm." } },
      choices = {
        { text = "Walk behind me, then. I'll see you there safely.", next = "BACK", reply = "Behind a paladin in the dark woods? It's an odd sort of comfort, but I'll take it gladly.", fx = { align = { honor = 1 } } },
        { text = "Believe what you like. You'll be walking alone.", next = "BACK", reply = "Alone, then, as usual. I'm used to it, though I'd hoped for better company tonight.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I'm afraid of being torn apart and still awake for it, which is a different thing, and the worgen don't seem to mind which bits they eat. The Dark Lady gave me a second life, and I'd like to keep it in one piece. A priest walking beside me makes the road to the Sepulcher feel a good deal shorter." } },
      choices = {
        { text = "Then I'll walk with you, Erland. Stay close.", next = "BACK", reply = "Close, yes, very close. You're kinder than most who wear the Light around the dead.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your fear is your problem, Erland, not mine.", next = "BACK", reply = "It is, and I'll carry it the way I always have. Quietly, and in front.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Use one? I'd beg for one, if deathstalkers were allowed to beg. Walk in front where the worgen can see you, and I'll stay behind where they can't, and between us we might reach Yorick with all our limbs." } },
      choices = {
        { text = "I'll walk in front. Someone has to take the first blow.", next = "BACK", reply = "Then the worgen will see you first, and I'll see them second, and we'll both get home. Thank you.", fx = { align = { honor = 1 } } },
        { text = "You walk in front, Erland. I'll watch from behind.", next = "BACK", reply = "Charming. I'll walk in front, then, and try not to take it personally when they eat me.", fx = { align = { honor = -1 } } },
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
        { text = "You seem afraid of the dark, for a deathstalker.", next = "afraid" },
        { text = "How does a rogue move through Silverpine unseen, Erland?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Fire should keep the worgen off, Erland.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Could a demon run down a worgen, Erland? I'd like to watch.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "You could use a shield beside you on the road, Erland.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the worgen really fear the Light, Erland?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "It's true, Erland. Arugal is dead, and his keep is quiet.", next = "xcl_sfk", when = { cleared = "Shadowfang Keep", faction = "Horde" } },
        { text = "Who do the deathstalkers answer to?", next = "op_varimathras" },
        { text = "Good luck on the road.", next = "END" },
      },
      again = { { id = "h_again", text = "What else? Speak low; the trees are listening." } },
    },
    worgen = {
      lines = {
        { id = "wo_default", text = "Arugal's work, the mage from Dalaran who called them up to fight us and then lost his mind to them. They walk like men and hunt like wolves, and they don't stay dead the first time." },
      },
      choices = { { text = "Arugal must be hiding somewhere close.", next = "worgen_arugal" } },
    },
    worgen_arugal = {
      lines = {
        { id = "wa_default", text = "Shadowfang Keep, on the hill south of Pyrewood. He calls the worgen his children, and they're the only family that would still have him." },
      },
      choices = {
        { text = "Arugal must be destroyed, whatever it costs.", next = "BACK", reply = "It will cost plenty, and the Sepulcher will pay it. I only hope I'm still standing when it's done.", fx = { align = { order = -1 } } },
        { text = "The Sepulcher should plan it carefully first.", next = "BACK", reply = "Carefully, yes, but not slowly. Every week we plan is another deathstalker's name on the wall.", fx = { align = { order = 1 } } },
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
        { text = "I'll face them openly, and finish what I wound.", next = "BACK", reply = "Openly, then, and finish it, but mind the trees. That's where they'll want you to follow.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll set traps and let them come to me.", next = "BACK", reply = "Clever, and safer, and very much how I'd do it. They're hungry enough to walk into anything.", fx = { align = { honor = -1 } } },
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
        { text = "I'll stay at your side all the way to Yorick.", next = "BACK", reply = "Thank you. Between your thunder and my blade, Yorick will hear us long before he sees us.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go where the worgen are and draw them off.", next = "BACK", reply = "Brave, and probably foolish, but I'll not argue if it keeps them off my back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Worse, because a beast hunts when it's hungry, and they hunt when they're bored. The old foresters say Arugal didn't make them so much as call them from somewhere, and I'd like to know where, so I can avoid it." } },
      choices = {
        { text = "Whatever they are, theirs is a curse to be broken.", next = "BACK", reply = "Broken, yes, if anyone knew how. Until then, I'll put them down as I find them.", fx = { align = { light = 1 } } },
        { text = "Cursed or not, I'll kill them like any beast.", next = "BACK", reply = "That's how I see it too. Whatever they were, they're beasts now, and beasts bleed.", fx = { affinity = 1, align = { light = -1 } } },
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
        { text = "Patience and stealth. I'll keep to the shadows.", next = "BACK", reply = "Good. Move slowly, and the shadows will keep you better than any armor in the Sepulcher.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "If a worgen finds me, I'll stand and fight.", next = "BACK", reply = "Then you'll be fighting more than one, because they never come alone. Keep to the shadows if you can.", fx = { align = { honor = 1 } } },
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
        { text = "Dalaran's mistakes are mine to burn away, then.", next = "BACK", reply = "Burn them, then, and I'll cheer you on from a safe distance. Dalaran made this mess, and fire's a fine apology.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dalaran's done nothing for me. I owe it nothing.", next = "BACK", reply = "Fair, and I'd not argue. Still, your fire keeps them off me, and I'll take that whoever it's for.", fx = { align = { order = -1 } } },
        { text = "Who is Rane Yorick?", next = "yorick" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I'd not want to be in the woods when it found one, since I can't decide which of the two I'd rather run from. Try it if you like, but try it in daylight, and somewhere a long way from me." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "A demon and a worgen fighting over the same patch of Silverpine sounds like the sort of thing the Dark Lady would enjoy hearing about. Go and try it, and I'd be glad to tell her the story myself." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "I'd not want to be in the woods when it found one, and having seen yours up close, I still can't decide which of the two I'd rather run from. Try it if you like, but try it in daylight, and somewhere a long way from me." },
      },
      choices = {
        { text = "I'll set it loose at night, when it hunts best.", next = "BACK", reply = "At night, then, and I'll be indoors. Do let me know which of them won.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll do it in daylight, openly, as you say.", next = "BACK", reply = "Thank you. I'd rather see your demon coming than hear it in the dark.", fx = { align = { honor = 1 } } },
        { text = "You seem afraid of the dark, for a deathstalker.", next = "afraid" },
      },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "Wolves that walk like men. Keep your fire bright and your back to a wall." } },
    shadowfang = { { id = "tp_shadowfang", text = "Arugal's worgen pour out of that keep like water out of a broken dam. I've no wish to go anywhere near it, and I'll admit it freely." } },
    gilneas = { { id = "tp_gilneas", text = "The Gilneans built a wall to keep the world out, and now they've got worgen inside it, I hear. Serves them right, though I wouldn't say so near the woods at night." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are meant to be fearless, and mostly we are. Silverpine at night is the exception, and you'll understand once you've heard the howling." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady wants her enemies dead and her roads safe. I'm working on the roads, and I'd appreciate a little company while I do it." } },
    _none = { { id = "tp_none", text = "Ask Rane Yorick; she knows the woods, and I know the road." } },
  },
}

P:NPC {
  key = "yorick", id = TODO_NPC("Rane Yorick"), name = "Rane Yorick",
  bible = "bibles/roads.md", role = "soldier", tier = "quest",
  communities = { "sepulcher" }, temper = { "cool" }, values = { "dutiful", "sharp" },
  notices = { "class", "lock_eyes" },
  impression = {
    first = "She can tell a worgen's gait from a wolf's at distance.",
    third = "{name} met Rane Yorick, a Forsaken deathstalker keeping watch over Pyrewood and the southern roads of Silverpine.",
  },

  greetings = {
    { id = "g_window", text = "You're in my light. Step to the side, slowly, and tell me why you're here." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. Then you'll understand why I don't sit near the door." },
    { id = "n_lock_eyes", cat = "lock_eyes", when = { aura = { 132, 2970, 11743 } },
      text = "Your eyes have that sheen, the one that sees what hides in the dark. Use it on Pyrewood after nightfall, and tell me what you see, because my own eyes have stopped believing what they find there." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It would draw everything out, worgen and Scourge and every Dalaran mage in the wood with an eye for strange lights. I'd rather you didn't, but if you mean to, tell me first, so I can count how many come and report it properly." } },
      choices = {
        { text = "I'll tell you first. Your reports matter.", next = "BACK", reply = "Good. My reports are the only thing keeping the Sepulcher from walking into Pyrewood blind.", fx = { align = { order = 1 } } },
        { text = "I'll draw them out when I see fit.", next = "BACK", reply = "Then don't be surprised when everything you draw out comes for you. I'll be watching from the hill.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The villagers bar their doors at dusk, and by moonrise the whole of Pyrewood is worgen, howling down the south road. By morning they're farmers again and none the wiser, or so they pretend. I don't know what a priest could do for them, but I've never seen anyone try." } },
      choices = {
        { text = "They're cursed, not damned. Someone should try.", next = "BACK", reply = "They might be, and I've wondered it myself on long nights. But someone else will have to be the one who tries.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to burn the village and end it.", next = "BACK", reply = "The Sepulcher's said the same, more than once. I'm not sure yet that they're wrong.", fx = { align = { light = -1 } } },
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
        { text = "I'll report what I find, Yorick, and leave it there.", next = "BACK", reply = "Good. Leave the following to me; I know these woods.", fx = { align = { order = 1 } } },
        { text = "I'll follow the prints wherever they go.", next = "BACK", reply = "Then follow carefully, and come back to tell me where they went. Most don't.", fx = { align = { order = -1 } } },
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
        { text = "You keep watch alone out here, Yorick.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I'd guess the gnolls trouble you even this far south.", next = "gnolls" },
        { text = "Something is wrong in Pyrewood.", next = "pyrewood" },
        { text = "What do the scouts report?", next = "reports" },
        { text = "I'm a deathstalker too. Any orders?", next = "deathstalker", when = { origin = "forsaken_deathstalker_recruit" } },
        { text = "What can a mage do against the worgen, Yorick?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I could send an imp to spy on Pyrewood for you.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What can a hunter learn from the worgen tracks, Yorick?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The Light might draw the worgen out for you, Yorick.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll leave you to your window.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? Be quick, the light's going." } },
    },
    pyrewood = {
      lines = {
        { id = "py_default", text = "The villagers are living, by day, and they lock their doors well before dusk. By night, something else walks their streets, and I've not yet decided whether they know." },
      },
      choices = { { text = "You think the villagers are the worgen.", next = "pyrewood_curse" } },
    },
    pyrewood_curse = {
      lines = {
        { id = "pc_default", text = "I think nobody in Pyrewood has been seen after dark, and that worgen walk out of Pyrewood every night. Draw what lines you like between those two facts; I already have." },
      },
      choices = {
        { text = "They might be cursed innocents. We should be careful.", next = "BACK", reply = "Careful, yes, and that's why I'm still watching and not burning. But my patience isn't endless.", fx = { align = { light = 1 } } },
        { text = "Cursed or not, they're a threat. Burn it.", next = "BACK", reply = "You and half the Sepulcher agree, and one day you'll get your way. Not tonight, though.", fx = { align = { light = -1 } } },
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
        { text = "Then I'll stand with you a while.", next = "BACK", reply = "Thank you. The ridge is a long, quiet watch, and company makes it shorter.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Better you than me. I'd rather go where the fighting is.", next = "BACK", reply = "Fair enough. Go and find your fight, and I'll keep my eyes on the ridge.", fx = { align = { order = -1 } } },
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
        { text = "Then I'll mean it, and finish what I start.", next = "BACK", reply = "Then you'll do. Packs like that respect anything that doesn't run.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll strike and fade. Let them chase shadows.", next = "BACK", reply = "Shadows, yes, but they hunt by smell. Strike and fade quickly, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Perhaps, if anyone knew what it was, and nobody in the Sepulcher does. I watch Pyrewood every night, druid, and I've seen a woman bolt her shutters at dusk and a worgen climb out of the same window an hour later." } },
      choices = {
        { text = "Then the villagers deserve mercy, if it can be found.", next = "BACK", reply = "If it can be found, yes, and I'd welcome it. Bring me something better than fire.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then the village is the danger, and it should burn.", next = "BACK", reply = "You sound like the High Executor, and she may be right. I'd like to be sure first.", fx = { align = { light = -1 } } },
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
        { text = "Old faces or not, I'll report what I find.", next = "BACK", reply = "Good. Old faces are no excuse for poor reports.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll deal with Ambermill my own way, Yorick.", next = "BACK", reply = "Your own way, then, but bring me what you see. That's all I ask.", fx = { align = { order = -1 } } },
        { text = "What do the scouts report?", next = "reports" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "An imp in Pyrewood would be noticed, since the villagers there are human by day and something else entirely by night, and both kinds would chase it. I'll keep my own eyes on the road, thank you, though I appreciate the thought." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc warlock in Silverpine is farther from home than any of us, and I'll not turn down an extra pair of eyes. Keep your imp off my windowsill, though; it leaves scorch marks." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Anything of yours in Pyrewood would be noticed, since the villagers there are human by day and something else entirely by night. I'll keep my own eyes on the road, thank you, though your demon seems keen to keep its eyes on me, which I appreciate rather less." },
      },
      choices = {
        { text = "Then I'll go myself and keep the imp close.", next = "BACK", reply = "Close, yes, and quiet, and you might come back with your skin. Mind the moonrise.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The imp goes where I send it, Yorick. Even to its death.", next = "BACK", reply = "Then I'll be ready to write down what happened to it. Briefly.", fx = { align = { order = -1 } } },
        { text = "Something is wrong in Pyrewood.", next = "pyrewood" },
      },
    },
  },

  topics = {
    shadowfang = { { id = "tp_shadowfang", text = "Shadowfang Keep sits on the hill above Pyrewood, and its master breeds the wolves that walk on two legs. I watch the road for them, and I've seen enough to fill a ledger." } },
    forsaken = { { id = "tp_forsaken", text = "My brother Quinn and I rose together, which is more than most Forsaken can say, and I'd take that over a beating heart any day." } },
    scourge = { { id = "tp_scourge", text = "The Scourge's ghouls shamble past the farm sometimes, and I let them pass if they don't stop. Worgen are a different story." } },
    _none = { { id = "tp_none", text = "That's not my concern. Pyrewood is my concern, and it keeps me busy enough." } },
  },
}

P:NPC {
  key = "karos", id = TODO_NPC("Karos Razok"), name = "Karos Razok",
  bible = "bibles/roads.md", role = "flightmaster", tier = "service",
  communities = { "sepulcher" }, temper = { "dry" }, values = { "patient" },
  notices = { "race", "pet", "lock_shards" },
  impression = {
    first = "He finds the living tiresome and the dead only a little better.",
    third = "{name} met Karos Razok, the bat handler of the Sepulcher.",
  },

  greetings = {
    { id = "g_bats", text = "Don't wave your arms about; the bats think it's a challenge." },
    { id = "g_kback", when = { metBefore = true }, text = "You again. The bats remember you; most of my visitors leave nothing behind worth remembering." },
    { id = "g_knight", when = { timeOfDay = "night" }, text = "Night flights are the best flights, if you ask the bats, and nobody ever does but me." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. The bats will grumble at the weight, but they'll carry you, if you sit still." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} away from the perches, if you please. My bats have lost friends to a hunter's beast before, and they remember." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "The bats don't like whatever is humming in your bag. Keep it shut, and they'll fly." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Only that you chose to keep something the rest of us lost, and that the keeping seems to hurt. I lost a good deal when I died, and I've not missed most of it, so I suppose I'm curious what makes the Light worth the trouble." } },
      choices = {
        { text = "It's worth the pain because it's still good.", next = "BACK", reply = "Then it's a kind of strength I don't have anymore. I'm glad someone does.", fx = { align = { light = 1 } } },
        { text = "It isn't worth it. I keep it because it's mine.", next = "BACK", reply = "Yours, yes, and that's reason enough, I suppose. I've kept a few things myself for the same reason.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They sense everything, which is why I like them better than people. They grew used to the Forsaken quickly enough, though they still go quiet when a priest walks past the roost. Either they're showing respect, or they're wondering whether you'd make a meal." } },
      choices = {
        { text = "Then I'll walk past gently and let them rest.", next = "BACK", reply = "They'll notice, and they'll fly gentler for you. Bats remember a soft step better than a coin.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them stay wary. Fear keeps a creature obedient.", next = "BACK", reply = "Fear makes a bat obedient and a rider dead. I'll keep my bats trusting, thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They can, and they will, though they'll sulk about it for a day afterward, and a sulking bat is no fun to feed. Strap your shield down and keep still, and you'll be in Tarren Mill before the worgen notice you've gone." } },
      choices = {
        { text = "I'll strap it down and keep still, Karos.", next = "BACK", reply = "Good. The bats hate a rattling rider, and they'll take the long way round to punish one.", fx = { align = { order = 1 } } },
        { text = "My shield stays on my arm, sulking bat or not.", next = "BACK", reply = "Then the bat will sulk, and you'll pay for it over Lordamere. Your choice.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because your spells take you to the Undercity and nowhere else, and my bats go to Tarren Mill and back again. They don't care for magic, though, so keep your hands still in the saddle and they won't drop you in the lake." },
      },
      choices = {
        { text = "I'll ride gently. Your bats deserve that.", next = "BACK", reply = "They'll know, believe me, and they'll carry you smooth as still water over Lordamere.", fx = { align = { light = 1 } } },
        { text = "A bat that drops me becomes a frozen bat.", next = "BACK", reply = "Then you'll be walking to Tarren Mill, frozen bat and all. I'd reconsider.", fx = { align = { light = -1 } } },
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
        { id = "h_dd_falling", when = { deathCause = "falling" },
          text = "You fell to your death, didn't you? Everyone who does it has the same crumpled look afterwards, and my bats would have set you down gently for far less trouble." },
      },
      choices = {
        { text = "Do the bats sense what you are, Karos?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your bats trust the living, Karos?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you trade your bats for a living beast, Karos?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Will the bats carry a hunter's beast, Karos?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "These bats must come from somewhere dark.", next = "bats" },
        { text = "Are the roads really that bad?", next = "roads" },
        { text = "Can I ride a bat out quietly, Karos?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Would your bats bear a demon riding along?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I doubt your bats can carry a warrior in full mail, Karos.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why would a mage need your bats, Karos?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Does anything about a paladin interest you, Karos?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Just passing.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? The bats are getting restless, and they've more patience with the dead than I have with the living." } },
    },
    bats = {
      lines = {
        { id = "ba_default", text = "Bred under the Undercity, in the dark where they're happiest. They're loyal, quiet and never ask questions, which makes them better company than most." },
      },
      choices = {
        { text = "Do you name them?", next = "bats_names" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bats_names = {
      lines = {
        { id = "bn_default", text = "Every one, though I don't tell the riders, because nobody wants to hear that they're flying on Moppet. The big grey one is Hadrec, and I'd thank you not to mention that to the High Executor." },
      },
      choices = {
        { text = "Your secret's safe. Which one would I ride?", next = "bats_mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bats_mine = {
      big = true,
      lines = {
        { id = "bm_default", text = "That depends on you. The steady ones go to riders who sit still and say thank you, and the young ones go to riders who kick, so they'll learn better or fall off. Which sort are you, would you say?" },
      },
      choices = {
        { text = "The sort who sits still and says thank you.", next = "BACK", reply = "Then you'll get the steadiest bat in the roost, and a smooth flight to wherever you're going.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Give me the young one. I like a lively ride.", next = "BACK", reply = "The young one it is, and hold on tight over the lake. They like to show off.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "They'll carry it if it's well behaved and doesn't try to eat them, which you'd be surprised how many try. Keep it calm on the flight and the bat will keep calm too." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet}? My bats will carry it if it behaves and doesn't try to eat them, and you'd be surprised how many try. Keep it calm on the flight and the bat will keep calm too." },
      },
      choices = {
        { text = "My companion's well trained. It won't trouble them.", next = "BACK", reply = "Good. The last one that wasn't tried to eat a wing, and I had to listen to the shrieking for a week.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If it bites a bat, the bat should have been quicker.", next = "BACK", reply = "Then your beast will be walking, and so will you. Mind it.", fx = { align = { honor = -1 } } },
      },
    },
    roads = {
      lines = {
        { id = "ro_default", text = "Worgen at night and gnolls by day, so yes. The bats fly over all of it, so I'm the most popular person in the Sepulcher, and the least thanked." },
      },
      choices = {
        { text = "What do you see from up there?", next = "roads_view" },
        { text = "Thank you, then, Karos.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    roads_view = {
      lines = {
        { id = "rv_default", text = "The whole forest laid out like a sick man on a table: the Sepulcher, the smoke from Pyrewood, and the keep on its hill with lights in it all night. Out over the lake you'll see Dalaran's dome, glowing violet, as if the wizards wanted everyone to know they're still there." },
      },
      choices = {
        { text = "What do you make of Dalaran?", next = "roads_dalaran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads_dalaran = {
      big = true,
      lines = {
        { id = "rd_default", text = "I make nothing of it, except that the bats won't fly near the dome, and I trust their noses. The wizards sit behind their shield and send their people into Ambermill, and Hadrec grinds his teeth about it, and I feed bats." },
        { id = "rd_mage", when = { class = "MAGE", race = "Scourge" }, text = "You'd know better than I, mage, since you might have studied there once. The bats won't fly near the dome, and I trust their noses, so if you ever go back, you'll be walking." },
      },
      choices = {
        { text = "Dalaran should be left alone behind its wall.", next = "BACK", reply = "Left alone, yes, and the bats agree with you. They won't fly within a mile of it.", fx = { align = { order = 1 } } },
        { text = "Dalaran's walls should come down, the sooner the better.", next = "BACK", reply = "Sooner or later they will, and the bats will be glad of it. Until then, they keep away.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = "dalaran" } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They trust whoever feeds them and doesn't wave about, and they don't care which side of the grave you're on. Tauren are heavier than they'd like and trolls fidget, but the orcs sit still, I'll give them that, as if they'd ridden worse." } },
      choices = {
        { text = "I'll sit still and respect the beast.", next = "BACK", reply = "Then you'll be their favourite rider today, which is a short list.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A mount should carry whoever pays.", next = "BACK", reply = "It does carry whoever pays, but it chooses how gently. Mind yourself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "No. A living beast would spook at me, and a bat doesn't, and that's all I need from a creature. You'll understand that better than most, druid, since you're half beast yourself on a good day." } },
      choices = {
        { text = "Every beast deserves a keeper who cares for it.", next = "BACK", reply = "Every beast deserves one, yes, and mine have me. I'm fond of them, even if I can't show it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Use what serves you, Karos. Sentiment slows a keeper.", next = "BACK", reply = "Sentiment's all I have left, friend, and the bats seem to like it. I'll keep it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Bats are quiet enough in the air, but they shriek when they land, so if you're hoping to arrive unannounced, get off a mile early and walk. One deathstalker found that out over the Pyrewood rooftops, and the bat still won't let him ride it." },
        { id = "xrogue_troll", when = { race = "Troll" }, text = "The bats like trolls better than they like us, since you smell less of the grave. They'll still shriek when they land, mind, so get off a mile early if you want to arrive unannounced." },
      },
      choices = {
        { text = "I'll walk the last mile quietly, as you say.", next = "BACK", reply = "Good. That deathstalker I mentioned still has to walk everywhere, and I'd hate to add you to the list.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather arrive with a shriek and fight.", next = "BACK", reply = "Then you'll land in a fight, and I'll lose a bat. I'd rather you didn't.", fx = { align = { honor = 1 } } },
        { text = "Are the roads really that bad?", next = "roads" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They'd tolerate it for about as long as it takes to throw both of you off, and I'd not blame them. Dismiss the thing before you mount, and the bat will carry you as gently as any of the dead." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You smell of sulphur and grave dirt in equal measure, and the bats don't care for either, though they'll put up with the second. Send the demon home before you fly, and we'll get along." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "They'd tolerate it about as long as it takes to throw you both off, and I'd not blame them, because I feel the old shame in my own blood just looking at that thing. Dismiss it before you mount, and the bat will carry you as gently as any of the dead." },
      },
      choices = {
        { text = "I'll dismiss it first. The bats deserve that much.", next = "BACK", reply = "Thank you. Bats can't stand the smell of brimstone, and neither, frankly, can I.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The demon stays with me, Karos. Always.", next = "BACK", reply = "Then you'll both be walking to Tarren Mill. I'll not risk my bats.", fx = { align = { order = -1 } } },
        { text = "These bats must come from somewhere dark.", next = "bats" },
      },
    },
  },

  topics = {
    forsaken = { { id = "tp_forsaken", text = "The Forsaken ride bats because bats don't fear the dead the way horses do. I've grown fond of them, more than I'm fond of most people." } },
    scourge = { { id = "tp_scourge", text = "The Scourge has gargoyles that hunt in the night sky, and my bats know to fly low when they hear them. I've lost one or two, and I don't care to lose more." } },
    lordaeron = { { id = "tp_lordaeron", text = "The bats know every road from here to Tarren Mill, and they'll carry you over the ruins of Lordaeron in a night. Mind you don't fall off." } },
    _none = { { id = "tp_none", text = "Ask someone with fewer bats to feed, and fewer droppings in their hair." } },
  },
}
