-- Bloodhoof Village: Cairne's tribe on the plains below the bluffs. Voice: bibles/mulgore.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baine", id = TODO_NPC("Baine Bloodhoof"), name = "Baine Bloodhoof",
  bible = "bibles/mulgore.md", role = "noble", tier = "major",
  communities = { "bloodhoof" }, temper = { "calm" }, values = { "wise", "loyal", "kind" },
  notices = { "race", "form" },
  impression = {
    first = "Baine Bloodhoof would rather talk the goblins, gnolls and dwarves down than fight them, and he means it. He walks the village every evening and admits he is still learning a few of its faces.",
    third = "{name} met Baine Bloodhoof, Cairne's son, who keeps Bloodhoof Village and the plains below the bluffs.",
  },

  greetings = {
    { id = "g_tent", text = "Be welcome in Bloodhoof Village. My father keeps the bluffs; I keep the plains below them." },
    { id = "g_back", when = { metBefore = true }, text = "Friend, sit with me a moment; the village can spare me." },
    { id = "g_away", when = { away = 14 }, text = "You've been away from the plains {away}, friend, and the village asked after you more than once. Sit with me a moment and tell me where the road took you." },
    { id = "g_away_long", when = { away = { min = 60, levels = 5 } }, text = "It has been {away} since you walked these plains, and you come back carrying yourself like a seasoned warrior. My father will want to hear of it, and so do I." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The village has been telling me of the help you've given us, and I'm grateful for every bit of it. Bloodhoof does not forget its friends." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I heard that someone here was left angry after speaking with you. I would rather we settled our quarrels with patience, so I hope it can be mended." },
  },

  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the Windshapers. My father welcomed your people, and I'll do no less. Ask if you need anything of Mulgore." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, so far from the red city. Your Warchief helped bring my people here, and we remember that." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "A bear in my tent, and a polite one. The Earth Mother has a sense of humor." },
  },

  start = "hello",
  nodes = {
    xcl_rfk = {
      big = true,
      lines = { { id = "xcl_rfk_default", text = "Then you've seen that the quilboar are not only raiders, whatever the young braves say. They have a holy place and elders and a crone who speaks for them, which means there is someone who could be spoken to, if she weren't so set on war. I'd rather have had a word with Charlga than a fight, though I know she'd never have allowed it." } },
      choices = {
        { text = "There's always someone to speak with, Baine. You're right to try.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Talk wouldn't have stopped her, Baine. Only steel would.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Did your father ever try to make peace with them?", next = "xcl_rfk2" },
      },
    },
    xcl_rfk2 = {
      lines = { { id = "xcl_rfk2_default", text = "He tried, when the tribes first came to Mulgore, and the Razormane answered with spears. My father says a hand offered once and refused is still a hand worth offering, so I keep offering mine, and someday one of them may take it." } },
      choices = { { text = "I hope one of them does, Baine.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Every honest strength has a place here. The tauren never needed the Light, but I would rather talk the gnolls and the goblins down than fight them, and I suspect a paladin knows something about choosing mercy when a hammer would be easier." } },
      choices = {
        { text = "Mercy first, Baine, and the hammer only when needed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The hammer is quicker. Mercy can wait.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "With curiosity, mostly, and a little caution, because we have only known the Earth Mother and the spirits of our ancestors. But my father says the Horde is stronger for every way its people have of healing, and I have seen trolls mend braves our own shaman could not." } },
      choices = {
        { text = "Then let me prove your father right, Baine.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Caution is wise. Some of us pray to darker things.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Baine.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now and then, when a brave follows a kodo too far west and the Palemane gnolls take offence, or a hunter strays onto the goblins' claims. Most quarrels start with a hunt that went one step too far, so I ask our hunters to know where the borders lie." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a calm way about it. I find that the beasts of a peaceful hunter are always calm, and the restless ones belong to the restless." },
      },
      choices = {
        { text = "I'll respect the borders, Baine, and avoid quarrels.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A hunt goes where the prey goes, borders or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "You may be right, and I'll admit I've wished to know what the Venture Company tells its foremen. But a tauren caught listening at a goblin's tent can never sit across a fire from him again, so if you go, go knowing that my father's name goes with you." },
      },
      choices = {
        { text = "Secrets win more peace than open talk ever has.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Then I'll go openly and speak your words plainly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What troubles the plains most?", next = "troubles" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Perhaps it could, but my people's oldest stories tell of a time when magic broke the world apart. I'll take your help gladly against the gnolls and the goblins, though I'd ask you to keep your fire away from the grain fields." },
      },
      choices = {
        { text = "I'll respect the fields. Your village, your rules.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fire is fire, and I'll use it where it works.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why talk, if they won't listen?", next = "talk" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They will bear it because my father asks them to, but don't mistake that for welcome. Our hunters have heard what the Burning Blade did in Durotar, and a tauren who sees your imp will reach for a spear before he remembers we are allies, so keep it close and keep it quiet." },
      },
      choices = {
        { text = "I'll keep it leashed. Your people's peace matters.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them stare. My power protects the Horde too.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How did the tauren come to Mulgore?", next = "coming" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who carries the Light. My father says the Horde is made of peoples who were each cast out by someone. I think you were cast out twice." },
        { id = "h_default", key = true,
          text = "Baine Bloodhoof, Cairne's son. Goblins dig to the east, gnolls raid from the west, and dwarves blast the earth at Bael'dun. I'd rather talk them all down than fight them." },
        { id = "h_cairne", when = { heardLine = "cairne.h_default" },
          text = "You've met my father on the bluffs, so he'll have told you about the land. He tells everyone; he never tires of it." },
        { id = "h_rounds", when = { metBefore = true }, text = "I walk the village each evening, every tent and every fire. A leader should know every face, and I'm still learning a few." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Stars over Stonebull Lake, and on nights like this I can almost hear the old songs from when we wandered." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You carry totems, and the grass seems to lean toward you as you walk. My father calls the shamans the oldest memory of our people, so I'm glad to see one more." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The plains feed Bloodhoof, and those who hunt them well keep the peace better than any treaty I could make." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. My people do not pray as yours do, but anyone who mends the hurt is welcome in Bloodhoof, whatever voice answers them." },
        { id = "h_cl_rfk", tags = { "news" }, when = { cleared = "Razorfen Kraul", faction = "Horde" }, text = "You've been to Razorfen Kraul, I'm told. The quilboar raided our herds when the tribes crossed the Barrens, and I'm not sorry their crone has been humbled." },
        { id = "h_venture_resolved", tags = { "news" }, when = { thread = { id = "venture_mulgore", state = "resolved" } },
          text = "My father heard your counsel from my mouth, friend, and he nodded the way he does when he has already decided. The Venture Company's foremen will have one warning from Bloodhoof, as the dwarves did, and no more after it." },
        { id = "h_venture_soured", when = { thread = { id = "venture_mulgore", state = "soured" } },
          text = "Friend. I've turned over what you told me about the goblins more than once, and I still don't like the shape of it, though I can't say you were wrong." },
        { id = "h_walk", when = { origin = "tauren_long_migration" }, text = "You walked it too, didn't you, the long road out of the Barrens with the centaur at our heels? You were a calf and I was barely grown, and I remember the orcs' axes better than I remember my own feet, because I never once looked down." },
      },
      choices = {
        { text = "How did the tauren come to Mulgore?", next = "coming" },
        { text = "Do you remember the walk, Baine? I still dream of it.", next = "xwalk", when = { origin = "tauren_long_migration" } },
        { text = "What troubles the plains?", next = "troubles" },
        { text = "Why talk, if they won't listen?", next = "talk" },
        { text = "Does your father miss living on the plains?", tag = "Persuade", next = "baine_father",
          check = { pass = { any = { { disposition = { min = 65 } }, { heardLine = "cairne.h_default" }, { race = "Tauren" } } } },
          fail = { next = "baine_father_no", fx = { affinity = -1 } } },
        { text = "A warrior settles quarrels too, Baine.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Your father stood up for my people. Why?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I've begun to walk the druid's path.", next = "druid", when = { race = "Tauren", class = "DRUID" } },
        { text = "Are the Windshapers good neighbours?", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Do the spirits favor talking the Venture Company down, Baine?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Talking works better when you know their secrets first, Baine.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The arcane could help defend Bloodhoof, Baine.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the hunters cause you quarrels, Baine?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I bring a demon to Mulgore. Will your people bear it?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "How do the tauren see a priest like me, Baine?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the Light have a place in Mulgore, Baine?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've been to the heart of Razorfen Kraul, Baine.", next = "xcl_rfk", when = { cleared = "Razorfen Kraul", faction = "Horde" } },
        { text = "I've followed the Venture Company from the wells to Stonetalon.", next = "venture_word",
          when = { thread = { id = "venture_mulgore", beat = "b5_baine", state = { "stirring", "unfolding" } } } },
        { text = "Earth Mother guide you.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else, friend? The village is quiet for now, so ask." },
        { id = "h_again2", text = "Go on. I'd rather hear it from you than from the gossip at Kauth's fire, where every plainstrider grows a foot in the telling." },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "It does, and I've carried a weapon for my people and will again. But a warrior who only knows how to end a quarrel will start a great many of them, and the plains have had enough of that." },
        { id = "wa_tauren", when = { race = "Tauren" },
          text = "You'll stand with the braves at Bael'dun or against the Palemane one day, and I'll be glad of you. Only remember that the best fight is the one you were strong enough not to need." },
      },
      choices = {
        { text = "Strength is what makes them listen, Baine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Then I'll talk first and fight only if I must.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "Because you came to us asking for help, and the tauren remember what it is to be lost. My father believes your people can be cured of what was done to you, and that hope is why he spoke for you before the Warchief." },
        { id = "fk_farmer", when = { origin = "forsaken_brill_farmer" },
          text = "You farmed once, near Brill? Then you'll know what my father means when he speaks of the land, and I hope our fields remind you of yours more kindly than they hurt." } },
      choices = {
        { text = "I'm grateful to him.", next = "BACK", fx = { affinity = 2 } },
        { text = "Do you think there's a cure?", next = "forsaken_cure" },
      },
    },
    forsaken_cure = {
      lines = { { id = "fc_default", text = "I don't know, friend, and I'll not guess. But I've watched my father refuse to give up on things far longer than anyone thought sensible, and he's been right more often than not." } },
      choices = { { text = "Then I'll hope as long as he does.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then you'll go up to the Elder Rise and Hamuul will teach you to listen to the land, which my father says is the hardest thing a tauren ever learns. Come back and tell me what it says about Bael'dun; I'd like to know if I'm right to be worried." } },
      choices = { { text = "I'll come back and tell you.", next = "BACK", fx = { affinity = 2, standing = { bloodhoof = 1 } } } },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "Quiet ones, and respectful of the land, which is all a tauren asks. They watch the sky the way Harken does, as if they're waiting for it to call them home, and I haven't the heart to ask whether it will." } },
      choices = {
        { text = "Some of us are waiting for that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Mulgore is home enough now.", next = "BACK", fx = { affinity = 2, standing = { bloodhoof = 1 } } },
      },
    },
    baine_father = {
      lines = {
        { id = "bf_default", text = "Every season. He tells me the High Rise is a fine place to see the land from and a poor place to stand on it. He'd rather walk with the herds, I think, and he stays up there because the tribes need one place to look to. I've never told him I noticed." },
        { id = "bf_heard", when = { heardLine = "cairne.h_default" },
          text = "You've heard him speak of the land, so you know already. He talks about the plains the way old warriors talk about a battle they miss. I keep the village well so that he can at least look down and see it kept." },
      },
      choices = {
        { text = "He's lucky in his son.", next = "BACK", fx = { affinity = 2 } },
        { text = "I won't mention it to him.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    venture_word = {
      big = true,
      lines = { { id = "vw_default", text = "Then you've seen more of their work than I have, and I would hear it before my father asks me. Do I send their foremen one more warning, as I did the dwarves at Bael'dun, or do I stop speaking and let it be?" } },
      again = { { id = "vw_again", text = "So, friend, what shall I tell my father about the Venture Company?" } },
      choices = {
        { text = "Warn them once, as at Bael'dun. If they keep digging, break their tools.", next = "venture_hold",
          fx = { thread = { id = "venture_mulgore", state = "resolved" }, affinity = 3, align = { honor = 1 }, standing = { bloodhoof = 2 } },
          journal = { first = "Told Baine to warn the Venture Company once, as he warned the dwarves, and then to stop asking. He said his father would hear it from him by nightfall.",
                      third = "{name} counselled Baine Bloodhoof to warn the Venture Company once and then stop asking." } },
        { text = "Leave them be, Baine. They have more coin than you have braves.", next = "venture_doubt",
          fx = { thread = { id = "venture_mulgore", state = "soured" }, affinity = -2, align = { honor = -1 }, trait = { skeptical = 1 } },
          journal = { first = "Told Baine the Venture Company has more coin than he has braves. He thanked me, and didn't mean it.",
                      third = "{name} told Baine Bloodhoof the Venture Company had more coin than he had braves." } },
        { text = "What does your father say?", next = "venture_cairne" },
      },
    },
    venture_cairne = {
      lines = { { id = "vc_default", text = "He says the land was not for sale, and that the goblins are learning it slowly. He also says a chieftain's son should come to him with an answer and not a question, which is why I'm asking you." } },
      choices = { { text = "Then I'll give you an answer.", next = "venture_word" } },
    },
    venture_hold = {
      lines = { { id = "vh_default", text = "That is what I hoped to hear, and what I was afraid to say first. I'll tell my father tonight, and it will sound better coming from me than from Mull, who would rather say it with a spear." } },
      choices = { { text = "Earth Mother guide you, Baine.", next = "END" } },
    },
    venture_doubt = {
      lines = { { id = "vd_default", text = "Perhaps you're right, and that is what troubles me. I'll tell my father the goblins can't be talked down, and I'll hope he doesn't ask who taught me to think so." } },
      choices = { { text = "...", next = "END" } },
    },
    baine_father_no = {
      lines = {
        { id = "bn_default", text = "My father's heart is his own to speak of, friend." },
        { id = "bn_ask", text = "Ask him yourself, on the High Rise. He'll tell you more than I should." },
      },
      choices = { { text = "Of course.", next = "BACK" } },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", text = "The Venture Company cuts the land in the east, and the Palemane gnolls raid from the west. At Bael'dun, the dwarves blast the ground until the earth's spirits cry out. I warned them, and they kept digging." },
      },
      choices = {
        { text = "I'll help.", next = "BACK", fx = { affinity = 2, standing = { bloodhoof = 1 }, align = { honor = 1 } } },
        { text = "The Venture Company pays well, and I won't cross them for a few hills.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    talk = {
      lines = {
        { id = "tk_default", text = "Because sometimes they do. A spear settles one quarrel, but a word, spoken well, can settle a hundred." },
      },
      choices = { { text = "Wise words.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    coming = {
      lines = {
        { id = "c_default", text = "We wandered for longer than any elder remembers. My father met Thrall's orcs, and with them beside us we drove the centaur from these plains. Mulgore is the first home our people have held in centuries." },
      },
      choices = { { text = "A home worth guarding.", next = "BACK", fx = { affinity = 2, standing = { bloodhoof = 1 } } } },
    },
    xwalk = {
      big = true,
      lines = {
        { id = "xwk_default", text = "Every night for a year after we came here, and some nights still. The dream is always the same: we're walking, and the grass never ends, and I wake up and remember we stopped. My father says the walk taught us to share what little we carried, so tell me, friend, has the plains' plenty made us forget that?" },
      },
      choices = {
        { text = "Not me. I still share what I carry.", next = "BACK", fx = { affinity = 3, align = { honor = 1 }, trait = { generous = 1 } } },
        { text = "A little. We've earned a full belly, Baine.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Do you remember the orcs who fought for us?", next = "xwalk_orcs" },
      },
    },
    xwalk_orcs = {
      lines = {
        { id = "xwo_default", text = "I do, and I remember that they were as hungry as we were and fought anyway. That's why I'll hear an orc out in this village even when he's being a fool, because I owe the ones on that road more than patience, and patience is the cheapest thing I can give." },
      },
      choices = {
        { text = "Then I'll owe them patience too.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The earth spirits are furious with the goblins at the mine, and I can't blame them. But a furious spirit beside a furious tauren would leave nothing standing in the east, so I ask the shamans to calm the one while I try to calm the other." } },
      choices = {
        { text = "Calm first. Mulgore has seen enough fire.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the earth swallow their mine, and the goblins with it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The plains bring news to Bloodhoof from every road, and I try to hear all of it. Ask me about these, and I'll tell you what I know." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "Sit with me, friend; you've earned the long answers, and the village can spare me a while." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer, as I'd answer anyone who asks honestly, and I hope you are asking honestly." },
    },
    cenarion_circle = { { id = "tp_circle", text = "Hamuul studies with them. My father trusts them, and so do I. The land needs friends who listen to it." } },
    grimtotem = { { id = "tp_grimtotem", text = "They're tauren, whatever else they are. I'd rather reason with them than fight them, for as long as reason works." } },
    _none = { { id = "tp_none", text = "I don't know, but I'll ask, and I'll remember you asked first." } },
    venture_company = { { id = "tp_venture", text = "We refused them the right to mine, and they poisoned our wells anyway. I'd still rather they sat down and talked, though I'm starting to doubt they know how." } },
  },
}

P:NPC {
  key = "zarlman", id = TODO_NPC("Zarlman Two-Moons"), name = "Zarlman Two-Moons",
  bible = "bibles/mulgore.md", role = "priest", tier = "quest",
  communities = { "bloodhoof" }, temper = { "serene" }, values = { "wise", "patient" },
  notices = { "class", "affliction" },
  impression = {
    first = "As Baine tends the people of Bloodhoof, Zarlman Two-Moons tends its spirits. He speaks of them as if they were restless children, which may be exactly what they are.",
    third = "{name} met Zarlman Two-Moons, spiritual leader of Bloodhoof Village and keeper of the rite of vision.",
  },

  greetings = {
    { id = "g_spirit", text = "Peace, young one. Baine tends the village in this world. I tend it in the other." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the spirit lodge. The spirits remember your step." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, young one, and the spirits noticed your absence before I did. They are quieter now that your step is back on the plain." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "The village says one of your words was found to be false. The spirits hear what is spoken in this lodge, so I would speak plainly here." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in the village was warmed by what you said to them, and the spirits are restless children who like a kind word too. Come, sit a while." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "You walk close to the spirits already; I can see it. Don't be afraid of what they show you." },
    { id = "n_ghostly", cat = "affliction", place = "before", when = { resSick = true },
      text = "You've come back from the spirit's road not long ago, and it leaves a mark. Rest, and it fades." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Not fear. They do not know what to make of you: something that died and was not laid to rest, yet carries a warmth the dead should not have. I would like to know whether that warmth is yours or only borrowed." } },
      choices = {
        { text = "It's mine, earned in pain. I'll keep it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Borrowed or not, it serves me well.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The spirits mind very little, so long as they are not ignored, and a prayer is half listening anyway. Your shadow and your loa are strange to them, but they are patient, and they have heard stranger things since the Horde came to Mulgore." } },
      choices = {
        { text = "I'll honour your spirits as I would my own.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers answer to me, not to your spirits.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Zarlman.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They do, and they ask only that you fight for something worth their watching. The braves who fell to the centaur in the long years of wandering rest easier now that the tauren have a home, and a warrior who guards that home walks with their blessing." } },
      choices = {
        { text = "I'll fight to guard this home, as they did.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The dead can watch. My fight is my own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every hunter carries a few, and they stay as long as you remember them. The tauren give thanks for every plainstrider and every kodo so that their spirits return to the Earth Mother in peace, and I'd ask the same of you while you hunt these plains." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a living spirit among all those departed ones. It keeps them company, I think, and they seem to like it." },
      },
      choices = {
        { text = "I'll give thanks for every life I take.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The dead don't need my thanks, Zarlman.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They mind it the way a herd minds a stranger at the waterhole, child. The arcane does not belong to the land, and the spirits of Bloodhoof feel it pass like a cold draft, so they will not trouble you, but neither will they speak to you." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "The spirits are uneasy around the restless dead already, and the arcane only adds a cold draft to it. They will not trouble you, child, but neither will they speak to you, and I am sorry for it." },
      },
      choices = {
        { text = "Then I'll respect their silence, elder.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't need the spirits' approval to study.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What are the spirits saying?", next = "spirits" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They sensed it before you crested the hill, and every one of them has gone quiet and watchful. Fel magic is a wound, not a power, and I fear the spirits will never forgive what walks beside you." },
      },
      choices = {
        { text = "Then I'll keep it far from the village, elder.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The spirits' forgiveness means nothing to me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What are the spirits saying lately?", next = "spirits" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They mind deceit more than shadows, because a shadow is only a place the sun hasn't reached yet. Walk where you like, but don't lie to the spirits of this village, because they remember every word, and some of them still have tempers." },
      },
      choices = {
        { text = "I'll walk honestly, even in the shadows.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The spirits can't hear what I don't say.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who calls the Light. The spirits of this village are restless around you, as children are around a stranger. I am only curious." },
        { id = "h_default", key = true,
          text = "Zarlman Two-Moons is my name, and I look after the spirits of this village, and of the young ones passing through it." },
        { id = "h_vision", tags = { "news" }, when = { questActive = TODO_QUEST("Rite of Vision") },
          text = "The rite of vision asks you to see with more than your eyes. Drink, follow, and don't fight what you're shown." },
        { id = "h_young", when = { metBefore = true }, text = "The young ones come down from Narache shaking, from their first death or their first vision. At that age they look much the same." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The spirits are louder after dark, not angrier, only louder, like children who won't sleep." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The spirits of Bloodhoof's fallen braves watch the young ones who carry their weapons now, and they watch you as well." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and the spirits of the beasts you've taken walk close behind you. Don't worry; they seem content." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The spirits of this village have gone quiet around you, which means either they respect you or they are afraid, and I would like to know which." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue in Bloodhoof. The spirits notice even the quietest feet, young one, so walk respectfully among them." },
      },
      choices = {
        { text = "What are the spirits saying?", next = "spirits" },
        { text = "What does the rite show?", next = "vision" },
        { text = "The spirits answer me now, elder. What should I ask them?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Do the spirits mind what I am, elder?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Do the spirits mind the arcane, elder?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the spirits of fallen braves watch over warriors, Zarlman?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the spirits of my kills follow me, Zarlman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Can the spirits sense my demon, elder?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the spirits here mind a stranger's prayers, Zarlman?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the spirits mind a rogue, Zarlman?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do your spirits fear a Forsaken paladin, Zarlman?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Thank you, elder.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Is there more? The Earth Mother hears every question, and I will hear yours." },
      },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Ask them nothing at first. Sit by the water and let them ask you, because the elements are tired of being commanded, and they remember who listens." },
        { id = "sh_rise", when = { origin = "tauren_spirit_rise" },
          text = "The seers on the Spirit Rise taught you well, I can tell; you already lower your voice near the water. Go and sit at the wells with Mull, and tell him what they say to you." },
      },
      choices = { { text = "I'll let them ask first.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "They notice it, as a wind notices a stone. You walk where the dead should be resting and you are not, and the spirits here aren't sure what to make of that. They aren't angry, little one, only puzzled, as I am." } },
      choices = { { text = "So am I, elder.", next = "BACK", fx = { affinity = 2 } } },
    },
    vision = {
      lines = { { id = "v_default", text = "Something different for everyone: a path, usually, and sometimes the end of one. The spirits choose; I only open the door." } },
      choices = {
        { text = "I'm ready.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd rather walk my own path than one the spirits pick for me.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    spirits = {
      lines = {
        { id = "s_wells", text = "They're restless near the wells. The water's spirits don't understand why it tastes of oil. Mull is trying to explain it to them." },
        { id = "s_quiet", text = "Quiet, today, and quiet is good. Quiet means nobody is grieving." },
      },
      choices = { { text = "Thank you, elder.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "The spirits haven't spoken of that. I won't speak for them." } },
  },
}

P:NPC {
  key = "harken", id = TODO_NPC("Harken Windtotem"), name = "Harken Windtotem",
  prejudice = { race = "Scourge", amount = 8, why = "The Earth Mother's cycle ends in rest; he finds the walking dead an offence against it, though he is too kind to say so loudly." },
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "steady" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Harken Windtotem watches the sky over Mulgore out of a habit left from the wandering years. He reads the weather from his aching knees and calls it progress with a perfectly straight face.",
    third = "{name} met Harken Windtotem, who keeps watch over what flies above Mulgore, which lately means far too many swoops.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "Ah, one of the Forsaken. Forgive an old herder if he stands upwind of you; my people believe the dead should rest in the Earth Mother's arms, and seeing you walk about troubles the part of me that was taught it." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "It's good to see you, friend, and I mean it more than I did the first time. Whatever you are, you've the manners of the living, and that's more than I can say for some of the living." },
    { id = "g_plains", text = "Watch the sky over Mulgore for a while. You'll see what I mean about the swoops." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the sky over Mulgore has changed its mind a dozen times since. My knees could have told you it would." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone in the village round to your way of thinking. That's a rarer thing among tauren than you'd guess, because we're stubborn as old kodo." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter? Then you'll have a better eye for birds than most, so use it." },
  },

  start = "hello",
  nodes = {
    prej_harken = {
      big = true,
      lines = { { id = "prej_harken_default", text = "I suppose I do, and that's not fair to you, but it's honest. To my people, a death is the end of a long walk, and the Earth Mother takes the body back to feed the grass. You were robbed of that, and I can't look at you without thinking of the grass going hungry." } },
      choices = {
        { text = "I didn't choose to rise. Pity the robbery, not the one robbed.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Your Earth Mother never came for me. I'll walk where I like.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Then let me walk Mulgore gently, and you can judge me by it.", next = "prej_harken_calm", fx = { affinity = 1 } },
        { text = "Do the tauren bury their dead, then?", next = "prej_harken_why" },
      },
    },
    prej_harken_why = {
      lines = { { id = "prej_harken_why_default", text = "We do, under the open sky, with a song for the walk and a stone so the wind knows the spot. When I heard the Scourge dug up the dead of Lordaeron, I didn't sleep for a week, and then Thrall sent us the Forsaken as friends." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_harken" }, { text = "Something else.", next = "BACK" } },
    },
    prej_harken_calm = {
      lines = { { id = "prej_harken_calm_default", text = "That I can do, and gladly. The plains have room for a quiet walker, whatever's beating or not beating inside them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "We wandered for generations without it, and the Earth Mother kept us. But I've watched the sky long enough to know there are many lights in it, and I don't see why yours can't be one of them, even if it does look odd on a Forsaken." } },
      choices = {
        { text = "There's room for the Light under your sky.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light is mine alone, not the sky's.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "You can try, but they've ached since the centaur chased us across the Barrens, and I've grown fond of them as a weather vane. Say a word over the swoops instead, if you like, because there are far too many of them this year and something has made them bold." } },
      choices = {
        { text = "Pain isn't a keepsake, Harken. Let me ease it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep your weather vane, then. I won't waste a prayer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Harken.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To a grown warrior, no, but to the young ones out in the fields, very much so. There are too many of them this year and they've grown bold, so thin them where they nest, and the farmers of Bloodhoof will sleep easier for it." } },
      choices = {
        { text = "I'll thin them where they nest, for the farmers.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Swoops aren't worth a warrior's time, Harken.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then between us we'd see everything, and that's more than most of Bloodhoof manages. The Palemane gnolls creep in from the west at dusk, so if you have quiet feet and sharp eyes, watch the western road and tell the braves what you see." },
      },
      choices = {
        { text = "Better they never see me. Then they can't fight back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll watch, then meet them openly with the braves.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why do you watch the sky?", next = "sky" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, and the young hunters would never forgive you for stealing their practice. Swoops are a nuisance, not a war, and I'd rather the youngsters learned to drop them with an arrow than watched a stranger freeze them out of the sky." },
      },
      choices = {
        { text = "Then the young hunters can have them, and the bruised thumbs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A pest is a pest, and I'll clear them anyway.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why keep watch on the sky?", next = "sky" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "You could ask, but I suspect they'd blame the Windfury harpies, the same as I do, because the harpies have pushed every swoop off their ridge and down onto our fields. The druids tell me the plains keep their own balance, and I'm an old sky-watcher who isn't sure the plains have heard about harpies." } },
      choices = {
        { text = "Bloodhoof's fields come first, so we keep the swoops in check.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The plains will find their own balance without our hand on it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "My knees ache whenever a storm is coming, and they've ached since you walked up, so you can draw your own conclusions. The orcs have told us what the Burning Legion made of them once, and nobody in Bloodhoof wants its servants anywhere near our sky." },
      },
      choices = {
        { text = "I'll keep it leashed, elder. Mulgore deserves that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your knees aren't my concern, Harken.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin in Mulgore. My knees told me something strange was coming today, and they're seldom wrong." },
        { id = "h_default", key = true,
          text = "I'm Harken Windtotem, and I keep an eye on what flies over Mulgore. Lately it's mostly swoops, and too many of them." },
        { id = "h_swoop", tags = { "news" }, when = { questActive = TODO_QUEST("Swoop Hunting") },
          text = "The swoops are thick this season. Thin them, and bring me their quills. Nothing goes to waste in this village." },
        { id = "h_knees", when = { metBefore = true }, text = "My grandfather read the weather from how the birds flew. I read it from how my knees ache. The tribe calls that progress." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Even the swoops sleep at this hour, but I don't, much; it's an old habit from the wandering years." },
        { id = "h_walk", when = { origin = "tauren_long_migration" }, text = "You came out of the Barrens on the long walk, same as me. I spent that whole road watching the sky for vultures, because vultures meant the centaur had caught someone behind us, and I suppose I never really stopped." },
        { id = "h_maur", when = { heardLine = "maur.h_default" }, text = "Maur's after that beast again? He's tracked it longer than some of our braves have been alive." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? Then you'll know the wind is turning before my knees do, and I'd thank you to tell me when." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and a tall one. Watch the skies, because the swoops dive at anything that stands still long enough on the plains." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! My knees say rain is coming, and my eyes say a priest of the Horde has come, and I'm only certain about the knees." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, is it? Hamuul's students say they can hear what the birds are saying, so ask the swoops for me why there are so many of them this year." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The sky's been quiet over Mulgore, and I'd like it to stay that way, so keep your demon on the ground." },
      },
      choices = {
        { text = "You look at me like I'm a broken thing, Windtotem.", next = "prej_harken", when = { prejudiced = true } },
        { text = "Why watch the sky?", next = "sky" },
        { text = "Do the swoops ever come down at a hunter's beast?", next = "hunter", when = { class = "HUNTER" } },
        { text = "The air over Mulgore feels uneasy. Have you noticed, Harken?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I watch the ground the way you watch the sky.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I could bring down those swoops with frost.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Are the swoops a real danger, Harken?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Shall I see to those aching knees, Harken?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a druid ask the swoops why they've grown so bold?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Are you worried about my demon, Harken?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do the tauren think of the Light, Harken?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll see to it.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "Something else? Ask away, and I'll keep one eye on the swoops while you do." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Not at a grown one, but they'll take a kodo calf or a careless pup. Watch how they circle: two turns wide and one turn tight, and then they drop, so loose your arrow on the tight turn." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "{pet} has been watching them since you got here, see? A good beast reads the sky as well as I do. Let it tell you when one's about to stoop." },
      },
      choices = { { text = "Two wide, one tight. I'll remember.", next = "BACK", fx = { affinity = 2 } } },
    },
    sky = {
      lines = {
        { id = "s_map", text = "When we wandered, the sky was the only map we had. Now we've a home with walls of grass, and I still can't stop looking up." },
      },
      choices = { { text = "Keep watching for us.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Noticed it? The Windfury harpies have the swoops flying crooked over the whole plain, and the winds off their ridge smell of trouble. In the wandering years we'd simply have moved on, but we have a home now, so the wind will have to get used to us." } },
      choices = {
        { text = "We have a home now, so we hold it against the harpies.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The wind can't be owned. Maybe we should still move with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. Ask Baine; he hears more than I do." } },
  },
}

P:NPC {
  key = "maur", id = TODO_NPC("Maur Raincaller"), name = "Maur Raincaller",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "solemn" }, values = { "brave" },
  notices = { "kit" },
  impression = {
    first = "Rain followed every camp Maur Raincaller made on the long walk to Mulgore, and the name stuck. He tracks a beast the young hunters only whisper about, and he means to see its hide.",
    third = "{name} met Maur Raincaller, a solemn tauren hunter on the trail of the great beast Mazzranache.",
  },

  greetings = {
    { id = "g_rain", text = "Rain's coming; I can smell it on the wind. It's good for the grass, and bad for tracking." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the rain has come and gone a few times while you were gone. The tracks are fresh now, if you've a mind to hunt." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown stronger since we last spoke, and you walk like a hunter now instead of a calf. Perhaps one day you'll see that hide before I do." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out in the grass had a go at you. Get mended before you go after anything bigger." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd hunt beside anyone with patience. The beast I track is clever, and it won't be fooled by a glow. But I'm curious what the Light does to a creature like that, so if you see it, I'd like to hear about it." } },
      choices = {
        { text = "I'll hunt it with patience, as you would.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hunt it my own way, Maur.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A blessing would not hurt, though Mazzranache has walked these plains longer than most prayers I know. If I bring back its hide, I would want someone to speak for its spirit, because a beast that old deserves more than a skinning knife." } },
      choices = {
        { text = "I'll speak for its spirit when the hunt is done.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast is a beast. Bring back the hide and be done.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Maur.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The young hunters call it Mazzranache, and it's bigger than any prairie wolf or cougar I've seen, with tracks that cross the plains and vanish into the hills. If it comes at you, don't run, because nothing that size has ever been outrun on open ground." } },
      choices = {
        { text = "I'll stand my ground if it comes, Maur.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it comes, I'll run. There's no shame in living.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you'll be the first, because that beast has winded every hunter who's gone after it. It hunts by smell more than sight, so rub yourself in sage and keep downwind, and you might get close enough to see its eyes." },
      },
      choices = {
        { text = "I'll strike before it knows I'm there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I want it to see me. Let it be a fair hunt.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "How did you come by your name?", next = "name" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, but the hide would come back scorched, and I want that hide to hang in Bloodhoof. A hunt is a conversation between the hunter and the hunted, and fire is no kind of conversation at all." },
      },
      choices = {
        { text = "You're right. The beast deserves an honest hunt.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Hunting isn't a conversation. It's a kill.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How did you get your name?", next = "name" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Help me find it and I'll be glad of you, because no tracker in Bloodhoof has ever seen it twice in the same place. But a druid might also tell me that a beast so old belongs to the plains more than to my skinning knife, and I'm not certain I want to hear that." } },
      choices = {
        { text = "A beast that old has earned a fair hunt, face to face.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Old or not, it's a danger. Take it however you can.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "No, because the beasts smell it and run, and Mazzranache is cunning enough to hide without any help from you. If you want to be useful, hunt the swoops and prairie wolves along the trail while I watch for its tracks, and keep your demon close beside you." },
      },
      choices = {
        { text = "I'll send it away while you hunt, Maur.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My demon could drive the beast straight to you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. Rain followed me to Mulgore, and now strange company does too." },
        { id = "h_default", key = true,
          text = "I'm Maur Raincaller. There's a beast in Mulgore the young hunters whisper about, and I've seen its tracks. I'd like to see its hide." },
        { id = "h_mazz", tags = { "news" }, when = { questActive = TODO_QUEST("Mazzranache") },
          text = "The beast is called Mazzranache. Find it, end it, and bring me proof, and the young ones will stop whispering and start bragging." },
        { id = "h_slow", when = { metBefore = true }, text = "The young braves ask me how to track. I tell them: walk slower than you want to. Not one of them listens." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Something big moves out in the dark grass. I've heard it more than I've seen it, and that's the part I don't like." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You walk like a shaman, light on the grass, and that's a gift on a hunt. The beast I'm tracking would hear anyone else coming a mile off." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You won't track the beast I'm after, but if it ever turns on you, I'd like to know you can stand your ground." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Rain followed me all the way to Mulgore, and now a priest has followed the rain, so perhaps the spirits have a sense of humour." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. They say your kind learns to walk as the cat walks, and I'd give a good deal to move through the tall grass as quietly as you will." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your demon frightens the game for a mile around, so keep it away from me while I'm tracking." },
      },
      choices = {
        { text = "How did you get your name?", next = "name" },
        { text = "I'm a tracker too. What have its tracks told you?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Would the spirits frown on hunting Mazzranache, Maur?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Your beast won't see me coming, Maur.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can't a mage simply blast the beast from afar?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What is this beast you're after, Maur?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Will you want a blessing before you hunt Mazzranache, Maur?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Should a druid help you hunt Mazzranache, Maur?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Could my demon help you track, Maur?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would you hunt beside a paladin, Maur?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll find it.", next = "END", fx = { affinity = 1, trait = { brave = 1 } } },
      },
      again = {
        { id = "h_again", text = "Anything else? Speak softly; voices carry out on the grass." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "That it's heavy at the front and drags its left hind a little, so it's been hurt before and it lived. A beast that has survived a hunter is a beast that's learned, and that's why I go slowly." },
        { id = "hu_narache", when = { origin = "tauren_narache_hunter" },
          text = "Your mother or father hunted out of Narache, didn't they? Then you were raised on the same tracks I was. Look for where it drinks, and wait there; it's thirsty after a kill." },
      },
      choices = {
        { text = "Then we'll wait for it, and be patient.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'd rather drive it out and finish it fast.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    name = {
      lines = {
        { id = "n_rain", text = "It rained on every camp I made, the whole long walk to Mulgore. My mother said the clouds had adopted me, and the name stuck, and so did the clouds." },
      },
      choices = { { text = "It's a good name.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I asked an elder that once, and she told me the spirits don't frown on a hunt, only on a waste. If I take its hide, I'll honor every part of it, and I'll thank the earth for letting us meet." } },
      choices = {
        { text = "A clean hunt, honestly given. The spirits can't ask more.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A trap works better than a chase, and nobody's the wiser.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's not something I've tracked." } },
  },
}

P:NPC {
  key = "mull", id = TODO_NPC("Mull Thunderhorn"), name = "Mull Thunderhorn",
  bible = "bibles/mulgore.md", role = "priest", tier = "quest",
  communities = { "bloodhoof" }, temper = { "worried" }, values = { "devout", "protective" },
  notices = { "race" },
  impression = {
    first = "Mull Thunderhorn walks to every sacred well each morning and finds the water no better each time. His worry is plain, but so is his stubbornness, and he will walk again tomorrow.",
    third = "{name} met Mull Thunderhorn, who grieves for the sacred wells of Mulgore poisoned by the Venture Company's machines.",
  },

  greetings = {
    { id = "g_wells", text = "Forgive me, my mind is on the wells. It's always on the wells, lately." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Tell me the water runs clean somewhere, please." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You're of the plains, so the wells are yours too. Help me cleanse them." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I don't know, and I'd welcome anything that tried. The goblins poisoned them, and the Earth Mother is patient, but patience doesn't help the herd drink today. If your Light can heal, I'd ask you to try it here." } },
      choices = {
        { text = "I'll try. The wells deserve healing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The goblins need a hammer more than the wells need prayer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I have asked myself that every morning on the walk to the wells, and every morning the water tastes the same. Perhaps your prayers reach further than mine, but the Venture Company keeps digging, and no blessing holds while their machines are still pumping." } },
      choices = {
        { text = "I'll pray at the wells with you each morning, Mull.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer is too slow. Wreck their pumps instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Mull.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Venture Company thugs, mostly, with clubs and too much confidence. They've set up at the sacred wells and won't leave for any words of mine, so if they won't listen to reason, perhaps they'll listen to an axe, though I'd rather it didn't come to that." } },
      choices = {
        { text = "I'll drive them off, but only if words fail.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Words always fail with goblins. I'll start with the axe.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The plainstriders drink from the wells and sicken, and the wolves that eat them sicken in turn, and so the poison spreads across the plains. Bring down the sick ones mercifully when you find them, and help me cleanse the wells so the next ones drink clean." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} away from the wells near the goblin camps. I couldn't bear to see a hunter's companion fall to that poison too." },
      },
      choices = {
        { text = "I'll put the sick beasts down mercifully, Mull.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Sick beasts are easy kills. I'll take them for hides.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Would you? The goblins swear it's only water from their drills, but I've tasted the wells and I know better, so find out what they're pouring and where, and I'll know which well to save first." },
      },
      choices = {
        { text = "I'll wreck their drills while I'm in there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll find the truth and let the elders confront them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Who poisoned the wells?", next = "who" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I've asked myself that, because I'd take help from almost anywhere now. But the wells are alive in a way your magic doesn't understand, and I'd rather see them healed slowly by the Earth Mother than quickly by something that doesn't know what it's healing." },
      },
      choices = {
        { text = "Then I'll leave the healing to the Earth Mother.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Slow healing means more poisoned water. Let me try.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who's poisoning the wells?", next = "who" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "No, the goblins did it with their machines and their oil, I'm sure of that much. But I've learned to fear any power that takes more than it gives, and I'd ask you to think of the wells when you call on yours." },
      },
      choices = {
        { text = "I'll take only what I need, Mull.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power is power. I'll take whatever serves me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The sacred wells are sick, and I don't suppose the Light can make the water clean again?" },
        { id = "h_default", key = true,
          text = "I'm Mull Thunderhorn, and the sacred wells of Mulgore are sick. Goblins set up beside them, and now the water tastes of oil and worse." },
        { id = "h_poison", tags = { "news" }, when = { questActive = TODO_QUEST("Poison Water") },
          text = "The creatures that drink from the wells are sickening too. Bring me proof of it, so I know how deep the poison runs." },
        { id = "h_cleanse", when = { any = { { questActive = TODO_QUEST("Winterhoof Cleansing") }, { questActive = TODO_QUEST("Thunderhorn Cleansing") }, { questActive = TODO_QUEST("Wildmane Cleansing") } } },
          text = "Take the totem to the well and let it work. The earth remembers clean water; we only have to remind it." },
        { id = "h_totem", when = { any = { { questActive = TODO_QUEST("Thunderhorn Totem") }, { questActive = TODO_QUEST("Wildmane Totem") } } },
          text = "A totem must be made before a well can be cleansed. Gather what it needs, and I'll do the rest." },
        { id = "h_walk", when = { metBefore = true }, text = "I walked to every well this morning, and my hooves ache, and the water's no better. Tomorrow I'll walk again." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The goblins by the wells hire bruisers to guard their drills, and I'd sooner a warrior of the Horde dealt with them than any of my braves." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have seen what the goblins' oil has done to the beasts near the wells, then, and I wish I hadn't." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. If you can bless water, the sacred wells of Mulgore need it more than anyone in this village, though I fear the goblins' oil runs deeper than any prayer." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The wells are sick enough already, so please don't let your demon drink from them." },
      },
      choices = {
        { text = "Who poisoned them?", next = "who" },
        { text = "I could slip into the goblin camp and see what they're dumping.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could a mage purify the water, Mull?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Who guards the goblin drills, Mull?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What has the oil done to the beasts, Mull?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'll help cleanse them.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Could prayer cleanse the sacred wells, Mull?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could warlock magic have sickened the wells, Mull?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Could the Light cleanse the wells, Mull?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goblin oil means goblin coin, and I won't stand in its way.", next = "END", fx = { align = { light = -1 } } },
        { text = "The water spirits are frightened. I can hear them.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Can a druid help the land heal the wells?", next = "druid", when = { class = "DRUID" } },
      },
      again = {
        { id = "h_again", text = "Something more? Forgive me; half my mind is still at the wells." },
      },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "You can? Then tell me what they're saying, because I only feel the wrongness through the totem, and you hear it plainly. Do they blame us, for letting the goblins near?" },
      },
      choices = {
        { text = "They don't blame you. They're only confused.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "They blame anyone who did nothing.", next = "shaman_blame" },
      },
    },
    shaman_blame = {
      lines = { { id = "sb_default", text = "Then they're right, and I'll do more than walk to the wells and worry. Carry the totems for me, and let them see that someone is doing something." } },
      choices = { { text = "I'll carry them.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "The land under the wells is healthy still; it's the water that's been fouled from above. A druid can tend the grass around them while the totems do their work, and I'd be grateful for it." } },
      choices = { { text = "I'll tend the grass.", next = "BACK", fx = { affinity = 2 } } },
    },
    who = {
      lines = { { id = "w_default", text = "The Venture Company, with their machines and their spills. They don't mean it, I think; they simply don't care, and somehow that's worse." } },
      choices = { { text = "It is.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm sorry, my thoughts are with the water. Ask Baine." } },
    venture_company = { { id = "tp_venture", text = "They wanted to mine our mountains, and we said no, so they took the wells instead. That is how they listen." } },
  },
}

P:NPC {
  key = "ahab", id = TODO_NPC("Ahab Wheathoof"), name = "Ahab Wheathoof",
  bible = "bibles/mulgore.md", role = "farmer", tier = "quest",
  communities = { "bloodhoof" }, temper = { "anxious" }, values = { "kind" },
  notices = { "pet" },
  impression = {
    first = "Ahab Wheathoof cannot go two sentences without asking after his dog Kyle. It is plain the scruffy creature is his best friend in all the world.",
    third = "{name} met Ahab Wheathoof, a kindly rancher by the lake near Bloodhoof whose dog Kyle has a habit of running off.",
  },

  greetings = {
    { id = "g_kyle", text = "Oh! Hello, traveler, you haven't seen a dog, have you? He's brown and scruffy, and he never sits still, and he stole a whole fish off Kauth's rack last week." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you seen any sign of him, any at all?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine companion you have. Keep him close, and don't ever let him wander off." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Oh, well, nobody has. Kyle doesn't care what anyone is, living, dead or glowing, as long as they've got a treat. I suppose that makes him better than most folk, doesn't it?" } },
      choices = {
        { text = "He's right. Everyone deserves a kind welcome.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Dogs don't know any better. People should.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Would you? I'd be ever so grateful, because I've called and called and he won't come, and the only thing he ever came running for was a bit of tender wolf meat. Pray he's warm and fed, wherever he is, and pray he remembers the way home." } },
      choices = {
        { text = "A dog's spirit matters too. I'll pray for him.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers are for people, Ahab, not for strays.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Ahab.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Scruffy and brown and always hungry, with a tail that never stops wagging. He ran off after the smell of something tasty, and I'm afraid the wolves or the swoops might mistake him for supper, so a strong warrior keeping an eye out would ease my mind." } },
      choices = {
        { text = "I'll keep an eye out for Kyle, Ahab.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A lost dog isn't a warrior's concern, Ahab.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Kyle wants to be found, I'm sure of it, he's just got his nose in something he shouldn't. He loves tender meat more than he loves me, the scamp, so if you see a scruffy tail wagging by the lake, that's my boy." },
      },
      choices = {
        { text = "I'll find him, Ahab. You have my word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If I find him, I'll expect something for my trouble.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's Kyle like?", next = "kyle" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "If you can, you're a better mage than any I've heard of. Kyle doesn't answer to spells, he answers to tender meat, and he'll come running for a good bit of wolf if you leave it where he can smell it." },
      },
      choices = {
        { text = "Then I'll look the old way, for Kyle's sake.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Magic can find anything. I'll show you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What does Kyle look like?", next = "kyle" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "He might, because he walked right up to a wolf once and seemed to think they were friends, right up until the wolf disagreed. The druids say every beast knows its place on the plains, but nobody ever told Kyle, and I don't think I want anyone to." } },
      choices = {
        { text = "A dog belongs at home, Ahab. I'd bring him back.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Maybe Kyle wants to run with the plains for a while.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Oh, no, please don't send it after him, because Kyle frightens easily and he'd never come home again. He'll come for tender wolf meat if anyone feeds him, so if you see him, give him a bite and he'll trot home on his own." },
      },
      choices = {
        { text = "I'll find him gently. No demons, I promise.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A demon would bring him home faster.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin! Have you seen Kyle? He's a scruffy dog, and I don't suppose the Light helps you find dogs, does it?" },
        { id = "h_default", key = true,
          text = "I'm Ahab Wheathoof, and I keep a little ranch by the lake. I kept a dog, too, Kyle, until he ran off, and he's never been gone this long." },
        { id = "h_kyle", tags = { "news" }, when = { questActive = TODO_QUEST("Kyle's Gone Missing!") },
          text = "If you find him, he'll be hungry; he's always hungry. Bring him something tasty and he'll follow you anywhere." },
        { id = "h_kyle_done", when = { questDone = TODO_QUEST("Kyle's Gone Missing!") },
          text = "He's home! Look at him, Kyle, sit, Kyle, sit, oh, he won't sit and I don't care one bit. He's home!" },
        { id = "h_fence", when = { questDone = TODO_QUEST("Kyle's Gone Missing!"), metBefore = true }, text = "Kyle chewed through the fence again, but he didn't go anywhere; he just likes chewing fences. I've stopped mending it." },
        { id = "h_watch", when = { questDone = TODO_QUEST("Kyle's Gone Missing!"), timeOfDay = "night" }, text = "He sleeps across the door now, like he's afraid I'll be the one to wander off. Silly dog." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You're a shaman? Then maybe the spirits have seen my Kyle, because he's a scruffy little thing and he goes wherever his nose takes him." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! If you happen to see my dog Kyle while you're out fighting things, please don't fight him; he's only a little scruffy." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Would you say a prayer for my Kyle? He's only a dog, but I've a feeling the Earth Mother keeps an eye on dogs too." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! You understand animals, don't you? If you meet a scruffy dog called Kyle out on the plains, please tell him I'm not angry and he can come home." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock! Have you seen my dog, Kyle? And, er, that isn't your demon eating something, is it?" },
      },
      choices = {
        { text = "Tell me about Kyle.", next = "kyle" },
        { text = "I'm good at finding things that don't want to be found.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can a mage find a lost dog, do you think?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What does Kyle look like, Ahab?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'll keep an eye out for him.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Shall I say a prayer for Kyle, Ahab?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could my demon find Kyle for you, Ahab?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I haven't seen Kyle, Ahab. I'm sorry.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "It's only a dog.", next = "END", fx = { affinity = -2 } },
        { text = "My beast could follow Kyle's scent.", next = "hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Do the spirits ever watch over a lost dog, Ahab?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you think Kyle would come to a druid, Ahab?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
      },
      again = {
        { id = "h_again", text = "Anything else? Sorry, I keep looking at the lake shore in case he comes back." },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Could it? Oh, could it really? Here, this is the old blanket he sleeps on, so let {pet} have a good sniff. He likes the lake shore and the far end of the fields, and he never goes near the bluffs." } },
      choices = { { text = "We'll start at the lake.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } } },
    },
    kyle = {
      lines = {
        { id = "k_pup", text = "Found him as a pup down by the lake, soaking wet and barking at a frog. He's been barking at things ever since. Best friend I've got." },
      },
      choices = { { text = "He sounds wonderful.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I hope they do, because I leave a bowl by the door every night and every morning it's still full. If the wind carries his scent anywhere, it's probably toward the wolves, and Kyle is no match for a wolf, though he'd never believe it." } },
      choices = {
        { text = "The spirits look after small, loyal things. He'll come home.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the wolves got him, better to know and grieve now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Sorry, I can't think about anything else until Kyle's home." } },
  },
}

P:NPC {
  key = "kauth", id = TODO_NPC("Innkeeper Kauth"), name = "Innkeeper Kauth",
  bible = "bibles/mulgore.md", role = "innkeeper", tier = "service",
  communities = { "bloodhoof" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },
  impression = {
    first = "No traveller leaves Innkeeper Kauth's inn unfed, and he keeps bringing Mull stew that goes uneaten. He swears the bluff folk come down for his stew, not the view.",
    third = "{name} rested at Innkeeper Kauth's inn in Bloodhoof Village, where nobody leaves without a bowl of stew.",
  },

  greetings = {
    { id = "g_inn", text = "Come in from the grass and the wind. There's stew, and a hide to sleep on, and the hide only smells a little of kodo." },
    { id = "g_home", when = { homeInn = { "Bloodhoof Village" } }, text = "Your sleeping hide is aired and ready. The wind is kind tonight." },
    { id = "g_away", when = { away = 14 }, text = "You've been out on the grass {away}, and I kept a pot on for you most nights anyway. Come in from the wind and eat." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The whole village talks of the help you've given us, so tonight the stew is yours for nothing. Don't tell the bluff folk." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone came through grumbling about you, and they left my stew half eaten. Whatever passed between you, the inn is a peaceful place." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look worn thin. Sit by the fire until the color comes back." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "The village brew is stronger than it tastes, and most learn that once." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Mind? No, only curious. Some of the young braves will want to see the Light, and some of the old ones will keep their distance, since they've heard the orcs' stories of the camps. Sit, and let them look. That's how we learn about strangers." } },
      choices = {
        { text = "Let them look. I'll answer their questions.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm not here to be gawked at, Kauth.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Mull does, though he'd never say so, because he walks to those wells sick at heart and comes back sicker, and he won't touch my stew. Braves come down from Bael'dun bruised from the dwarves' blasting too, so you'd not want for work." } },
      choices = {
        { text = "I'll look in on Mull. A heavy heart needs tending too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mull's grief is his own. I'll tend the braves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kauth.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every young brave on the way down from Camp Narache, and plenty of orcs and trolls besides, now that we stand with the Horde. They eat like kodos and sleep like stones, and the next morning they're off to fight the gnolls or the centaur without so much as a thank you." } },
      choices = {
        { text = "Thank you for your fire, Kauth. It's appreciated.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "An inn is for sleeping. I'll be gone at dawn.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plainstrider and kodo, mostly, and a prairie wolf when the hunters are feeling generous. The tauren waste no part of a beast, so I make broth from the bones and send the hides up to Una on the bluffs, and nothing goes to waste in my kitchen." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And there's always a bowl for your {pet}. Every beast that walks into Bloodhoof gets fed, same as everyone else." },
      },
      choices = {
        { text = "I'll bring my game here, and waste none of it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep my game for myself. I caught it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Easy to rob and hard to carry, friend, because it's iron and it's hot and it's bigger than you. Besides, nobody in Bloodhoof needs to steal from me, since I feed anyone who asks, and that's the best lock any inn ever had." },
      },
      choices = {
        { text = "That's a good lock. I'd never rob a kind host.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A full belly never stopped a real thief.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's in the stew today?", next = "stew" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Your imp gets a bowl when the Earth Mother herself comes to supper and asks for one. I don't feed things from the Twisting Nether, friend, so it can wait outside the door and you can eat for the both of you." },
      },
      choices = {
        { text = "Fair. It waits outside, and I'll eat its share.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's hungry, and it's coming in whether you like it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What goes into the stew?", next = "stew" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Now and then, on their way out to the wells with Mull or to the Venture mine, to see what the goblins have done to the ground. They come back quiet and angry, so I feed them, because I've never seen anyone stay angry through a second bowl." } },
      choices = {
        { text = "The druids should face the goblins openly and drive them off.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Quiet anger is better spent spoiling the goblins' drills by night.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Troll mages, mostly, on the road up to Thunder Bluff, and now and then a Forsaken who won't eat a thing. The trolls eat like kodos and the Forsaken don't eat at all, so I've learned to cook for both by cooking too much." },
      },
      choices = {
        { text = "I'll pay my way, Kauth, like any other guest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If the bowl's on offer, I'll take it free.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. No traveller leaves my inn unfed, though I admit I'm not sure what feeds you." },
        { id = "h_default", key = true,
          text = "I'm Kauth. Travelers come through here on the way to the bluffs, and all of them leave my inn fed." },
        { id = "h_task", when = { questActive = TODO_QUEST("A Task Unfinished") },
          text = "There's a task left undone that weighs on me. You'll carry it further than I can." },
        { id = "h_view", when = { metBefore = true }, text = "The bluff folk come down for my stew and say they're here for the view. The view's fine, but the stew's better." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The wind's dropped, so listen: that's the lake against the shore, the best sound in Mulgore." },
        { id = "h_mull", when = { heardLine = "mull.h_default" }, text = "Mull's been to every well again, hasn't he? I bring him stew, and he forgets to eat it, so I bring more." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at my table! Sit near the fire, since your kind always seem to be listening to it, and I'll bring you a bowl of stew." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and I can hear your stomach from here. Sit down, friend, and let me feed you before you go off and fight something." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have game to share, I hope, because my pot's always open to a fresh plainstrider." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Sit and eat, because I've never met a healer yet who remembers to feed themselves, and stew mends more than you'd think." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, by the grass seed on your boots. Sit down, because the druids who come down from Elder Rise always forget to eat, and I take that personally." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage at my inn! Sit, and I'll bring you stew, because spellwork burns through a body like a fire through grass." },
      },
      again = {
        { id = "h_again", text = "Is there something more you need, friend? Sit while you ask it." },
        { id = "h_again2", text = "Ask what you like. The fire is warm, and I am in no hurry." },
      },
      choices = {
        { text = "What's in the stew?", next = "stew" },
        { text = "Do the elders still bless the hearths in Bloodhoof, Kauth?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Your stew pot would be easy to rob, Kauth.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do many warriors pass through Bloodhoof, Kauth?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do you cook from the plains, Kauth?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does my imp get a bowl too, Kauth?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does anyone in Bloodhoof need a healer, Kauth?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the druids from Elder Rise often stop here, Kauth?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do mages come through Bloodhoof often, Kauth?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the tauren mind a paladin at the inn, Kauth?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Just a meal, thank you.", next = "END" },
      },
    },
    stew = {
      lines = {
        { id = "s_roots", text = "Tallstrider, wild roots, and whatever the hunters bring in that they can't name. Don't ask more than that; it spoils the taste." },
      },
      choices = { { text = "Smells good.", next = "END", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Old Zarlman blesses everything from the well to my stewpot, and I let him, because it only costs me a bowl. Mull won't touch the stew, but he says the fire burns cleaner since, and I'll take a compliment wherever I find one." } },
      choices = {
        { text = "Old ways keep a village whole. I'm glad he blesses it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good fire needs good wood, not blessings.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I hear a little of everything and keep less. Ask Baine." } },
  },
}

-- Forever's camping: the adventurer camped just outside Bloodhoof Village.
P:NPC {
  key = "kaga", id = TODO_NPC("Kaga Wildhoof"), name = "Kaga Wildhoof",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "bloodhoof" }, temper = { "warm" }, values = { "generous", "brave" },
  notices = { "craft" },
  impression = {
    first = "Kaga Wildhoof wanders and camps and comes home to Mulgore when the wind turns. She has met more friends at campfires than in any town, she says, and after sitting at hers I can see why.",
    third = "{name} shared a fire with Kaga Wildhoof, a wandering tauren camped outside Bloodhoof who teaches the art of a good camp.",
  },

  greetings = {
    { id = "g_fire", text = "Earth Mother's blessing, traveler. Come and sit; the fire is big enough for two." },
    { id = "g_back", when = { metBefore = true }, text = "Back at my fire, are you? Good. Sit, and tell me where the road took you." },
  },

  notice = {
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work hides? Then you'll want to learn the tent. A night by a fire with a tent close by is a night well spent." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "We wandered a long time and met many peoples, and every one of them prayed to something. Yours just happens to shine. I'd rather hear how it answers you than argue about whether it should." } },
      choices = {
        { text = "It answers when I serve the living. Gladly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It answers. That's all I need to know.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A troll one in Sen'jin Village, who prayed to the loa so loudly the crabs scattered, and a Forsaken one in the Barrens, who never once raised her voice. They prayed to different things in different ways, and both of them shared my fire, and that's all I ask of anybody." } },
      choices = {
        { text = "Faith is faith, however it's spoken. I agree.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some prayers are best kept away from your fire.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kaga.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Up into the Stonetalon Mountains, out across the Barrens and down to the edge of Thousand Needles, and I've come back to Mulgore every time the wind turned. I've seen warriors guard caravans and warriors raid them, and I'll tell you the first kind sleeps a good deal better." } },
      choices = {
        { text = "Then I'll be the kind who guards caravans.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The raiders eat better, I'd wager.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you're missing the best part of camping, friend, which is the fire and whoever wanders up to it. I've met more good friends at a campfire than I've lost to bandits, and I'd rather take that wager than sleep cold and alone in the dark." },
      },
      choices = {
        { text = "Perhaps you're right. I'll light a fire tonight.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Friends find you too easily. Better cold and alone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What is it you love about camping?", next = "why" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Ha, that's true, and I once watched a troll mage light a campfire with a snap of his fingers. Still, striking flint makes a fire feel earned, so I'll keep doing it the old way, though I won't refuse your spark if the wood is wet." },
      },
      choices = {
        { text = "The old way has its place. I'll strike flint.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Flint is a waste of time when a spell works faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do you love about camping?", next = "why" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More every year, and that's new, because when I was a calf there were no druids among the tauren at all, only stories of the night elves in their faraway forest. Now I meet them at every other campfire, and they ask the fire's leave before they light it, which I've started doing too." } },
      choices = {
        { text = "The old ways came back to us for a reason. Keep them close.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A druid should learn from the open road, not just from teachers.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I share it with anyone who sits quietly and tells a good story, and I've met a warlock or two on the wandering roads. The Chief would frown at me, but I've found the folk who carry dark things often want a warm fire more than anyone." },
      },
      choices = {
        { text = "Then I'll tell you a story and keep the demon quiet.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My demon eats when I say, not last.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin by my fire! I've met all sorts at campfires, but I've never met one who glowed. Sit down." },
        { id = "h_default", key = true,
          text = "I'm Kaga Wildhoof. I wander, I camp, and I come back to Mulgore when the wind turns, and the Chief and I go back a long way." },
        { id = "h_bundle", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "A bundle from Chief Hawkwind? He never forgets a kindness. Tell him he owes me nothing, and that I said so twice." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire and let it work on you. The rest comes when it comes." },
        { id = "h_narache", when = { metBefore = true }, text = "I came past Camp Narache on the way in, where the young ones were fighting boars with sticks. I gave them a few pointers, and a few bandages." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at the campfire is good luck, the old wanderers used to say, because the fire burns brighter beside one of you. Sit down, and we'll test the saying." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Sit by my fire a while, because I've met warriors on every road I've ever walked, and they always have the best stories." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde at my campfire! I've shared fires with orcs, trolls and once a very lost goblin, but never a priest, so sit and tell me who you pray to." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! I once shared a fire with one of Hamuul's students out past the Red Rocks, and she spent half the night as a bear because she said the ground felt warmer that way." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, at my campfire? Sit down, then, but tell your demon it eats last." },
      },
      choices = {
        { text = "What is it you love about camping?", next = "why" },
        { text = "My people camped under a different sky.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "I hunt as I travel. Does that suit a camp?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Did the wandering bands keep shamans on the long road, Kaga?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I prefer camps with no fire, where nobody finds me.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A mage never needs flint to start a fire.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Where have your roads taken you, Kaga?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Have you met many priests on your travels, Kaga?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Have you met many druids on the roads, Kaga?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do you share your fire with warlocks, Kaga?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do the wandering tauren make of the Light, Kaga?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Earth Mother keep you.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? Throw a stick on the fire while you think of it, and not the one with the grub in it; that's supper." },
      },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "Did they? I'd love to hear how a fire behaves where the wind is a spirit and not just weather. Down here it only wants to blow my sparks into the grass, and I have to talk it out of that every night." } },
      choices = { { text = "Ask it nicely. The wind listens.", next = "BACK", fx = { affinity = 2 } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "It suits it best of all, because a hunter brings the supper and keeps the watch. Every camp I've shared with a hunter has eaten well and slept soundly." } },
      choices = { { text = "Then I'll bring the supper.", next = "BACK", fx = { affinity = 2 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Every fire is a small village for a night. Whoever passes can sit at it. I've met more friends at campfires than in any town." } },
      choices = { { text = "Teach me.", next = "BACK", fx = { affinity = 2, learn = { "camping" } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every band had one, and ours sang to the earth each night before we slept, so we'd know where the water hid. Now Mulgore is home and the shamans sit up on the bluffs, and I miss hearing that singing out on the plains." } },
      choices = {
        { text = "The bluffs keep the songs safe for everyone, and that's worth something.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A shaman belongs on the open road, singing for the people.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "Start with a fire, which any cook can make, and then add what your hands know how to make." } },
    _none = { { id = "tp_none", text = "I don't know. The wind hasn't told me." } },
  },
}
