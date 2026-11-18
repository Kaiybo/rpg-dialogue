-- Sen'jin Village: the Darkspear's shore, within sight of the isles they lost. Voice: bibles/durotar.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gadrin", id = TODO_NPC("Master Gadrin"), name = "Master Gadrin",
  prejudice = { race = "Scourge", amount = 8, why = "Zalazane raises dead Darkspear as puppets on the Echo Isles; walking corpses are personal for him." },
  bible = "bibles/durotar.md", role = "priest", tier = "major",
  communities = { "senjin" }, temper = { "folksy" }, values = { "wise", "proud" },
  notices = { "race", "class", "origin" },
  impression = {
    first = "Master Gadrin taught Vol'jin and Zalazane both, and only one of them makes him proud. He jokes about his old teeth, but the shame of Zalazane plainly keeps him from sleeping through the night.",
    third = "{name} met Master Gadrin at Sen'jin Village, the old Darkspear witch doctor who once taught both Vol'jin and Zalazane.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "Ah, mon, you be one of the dead who walk. Gadrin be honest with you: Zalazane make our dead walk on the Echo Isles, and when Gadrin see a dead face moving, his old heart jump like a frightened lizard." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Come, come, sit. Gadrin been thinking about you, dead one, and he decide the loa sent you to teach an old troll something about walking dead who keep their own mind." },
    { id = "g_hut", text = "Come, come, Gadrin don't bite. Not anymore, anyway; the teeth be too old." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you visit the old man again. Sit; the fire be warm." },
    { id = "g_away", when = { away = 14 }, text = "Ah, you been gone {away}, and the old man worried a little, though he won't tell you how much. Sit by the fire, mon." },
    { id = "g_away_long", when = { away = 60 }, text = "You been away {away}, mon, and Gadrin started to fear he lost another student. Sit, and let the old man have a look at you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You got stronger since we last talk, mon, and Gadrin can see it in how you stand. A teacher likes that, even when it's not his teaching." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "The village say somebody caught you in a lie. Gadrin had a student once who lied with a smile, so forgive him if he watches your face a while." },
    { id = "g_apprentice", when = { origin = "troll_witch_doctor_apprentice" }, text = "Ah, the root-grinder! You still got the green under your nails, mon, and the old witch doctor you served still tell me you was the only apprentice who never let the pot boil over." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear child! Let me look at you, so strong. You going to do the tribe proud, I can tell." },
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST", "MAGE" } },
      text = "You got the spark, eh? Careful with it. I teach two boys with the spark once, and only one of them listen." },
    { id = "n_sailed", cat = "origin", when = { origin = "troll_sailed_with_thrall" },
      text = "You was on the boats when the Warchief come, eh? I see it in how you stand by the water, never with your back to it. Sen'jin swear our debt to the Horde that day, and you and me both hear him do it." },
  },

  start = "hello",
  nodes = {
    dd_deaths = {
      lines = {
        { id = "dd_de_default", text = "It changes everybody, mon, but slowly, like the tide on a rock. The spirit healers send you back, and the loa watch you come, and Bwonsamdi counts you every time you pass him by. He be patient, dat one, and he never forget a name." },
      },
      choices = {
        { text = "Let him count. I'll keep walking past him.", next = "BACK", reply = "Brave words, and I like dem, but say dem quieter. The loa of death hear better than he let on.", fx = { align = { order = -1 } } },
        { text = "I'll be more careful. I don't want him counting me.", next = "BACK", reply = "Good, because careful be how a troll gets old, and I be very old. Learn it from me now and save yourself the lesson later.", fx = { align = { order = 1 } } },
        { text = "Something else, Master.", next = "BACK" },
      },
    },
    prej_gadrin = {
      big = true,
      lines = { { id = "prej_gadrin_default", text = "Gadrin do, and it shame him a little. Zalazane take our dead from the burning grounds, put his hex on them and send them walking against their own kin, and they don't know their own names no more. Gadrin know you not the same, but his eyes, they don't listen to his head so good." } },
      choices = {
        { text = "I'm no puppet. Nobody pulls my strings, old man.", next = "BACK", reply = "No, child, you aren't, and Gadrin be glad of it. Forgive an old man his fears, because they be earned on the burning grounds.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "I serve the Dark Lady. Her will is mine.", next = "BACK", reply = "Her will, eh? Then Gadrin pray she use it gentler than Zalazane use his. The loa watch all masters, child.", fx = { align = { order = 1 } } },
        { text = "I'll help you free them, if I can.", next = "prej_gadrin_calm", fx = { affinity = 1 } },
        { text = "Were any of Zalazane's dead people you knew?", next = "prej_gadrin_why" },
      },
    },
    prej_gadrin_why = {
      lines = { { id = "prej_gadrin_why_default", text = "Gadrin's sister's boy, mon, a good fisher with a crooked tusk. Gadrin see him on the Isles last year, standing in the surf with Zalazane's mark on him, and he looked right at Gadrin and didn't know him at all." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_gadrin" }, { text = "Something else.", next = "BACK" } },
    },
    prej_gadrin_calm = {
      lines = { { id = "prej_gadrin_calm_default", text = "Ah, now that be a thing Gadrin didn't expect from a dead one. The loa got a sense of humour, mon, and Gadrin starting to like the joke." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcl_zf = {
      big = true,
      lines = { { id = "xcl_zf_default", text = "Then you see what Zalazane be wantin' to make of the Echo Isles. The Sandfury witch doctors drag their dead back up to guard the walls and call it devotion, but a spirit pulled back into rotten flesh never be grateful for it. I teach my students that the dead deserve rest, and Zul'Farrak be a whole city that forget it." } },
      choices = {
        { text = "The dead deserve their rest, whoever raised them.", next = "BACK", reply = "They do, and Gadrin be glad to hear you say it. Rest be the last gift we give our dead, and Zalazane steal even that.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the dead can still fight, it's a waste not to use them.", next = "BACK", reply = "A waste, you say, like the dead be tools on a shelf. That be how Zalazane talk, child, before he fall.", fx = { align = { light = -1 } } },
        { text = "You must have known the Sandfury witch doctors.", next = "xcl_zf2" },
      },
    },
    xcl_zf2 = {
      lines = { { id = "xcl_zf2_default", text = "No, mon, and Gadrin be glad of it. The Darkspear and the Sandfury both learn the old voodoo, but they learn different lessons from it, and the Sandfury lesson be that power over the dead be power enough. That be the same lesson Zalazane learn, and look where it take him." } },
      choices = { { text = "Then I'll remember the right lesson, Master Gadrin.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Fear you? No, mon, but watch you, yes. Zalazane twist the dead on the Echo Isles into his slaves, and you be dead with a power he never touch. Maybe that make you safe, maybe not. The loa decide, and I listen." } },
      choices = {
        { text = "I'll prove I'm no one's slave, Master.", next = "BACK", reply = "Then prove it, child, and Gadrin will watch with hope instead of fear. The loa love a spirit that chooses itself.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I serve the Dark Lady and the Horde. Ask no more.", next = "BACK", reply = "Fair, child, and Gadrin will ask no more. But the loa ask what they like, and they don't need permission.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "He take what the loa give for healin' and turn it to bindin' his own people, mon. Now the Echo Isles be full of Darkspear with his hex on them, and I wake up some nights thinkin' I should have seen it in him when he was small." } },
      choices = {
        { text = "Then I'll use the loa's gifts as they were meant.", next = "BACK", reply = "That be what they were meant for, healing and helping, not binding. Bless you, child, and may the loa guide your hands.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power given is power to use as you see fit.", next = "BACK", reply = "That be what Zalazane said, word for word, when he was young. Be careful, child, because the loa remember how you use their gifts.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Gently, if you can, and that be what a warrior find hardest. Zalazane's voodoo turn our own people against us, and when the hex break they wake up confused and ashamed, so knock them down if you must, but don't kill a troll who can still come home." } },
      choices = {
        { text = "I'll spare the hexed ones, Master Gadrin.", next = "BACK", reply = "Good, warrior, and the loa will thank you for every one. They be family under that hex, and they will wake.", fx = { align = { honor = 1 } } },
        { text = "A spear in my face is a spear. I'll do what I must.", next = "BACK", reply = "Gadrin understand, and he won't blame you for living. But try, warrior, try, because the hex break and they wake up.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Maybe, though Zalazane hides on the Echo Isles behind his voodoo and his hexed Darkspear, and they be our own people under the spell. Cut the witch doctor if you can reach him, but spare the hexed ones, because they be family still." },
      },
      choices = {
        { text = "I'll spare the hexed. They're Darkspear, after all.", next = "BACK", reply = "Thank you, child, and the loa see your kindness. Cut the witch doctor, and let the rest of them wake.", fx = { align = { light = 1 } } },
        { text = "In a fight, I can't stop to ask who's hexed.", next = "BACK", reply = "No, you can't, and Gadrin know it. Strike as you must, but strike the witch doctor first, and the rest might be saved.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The spirits, yes, once Zalazane be dead and his voodoo with him. The trolls he twisted, I don't know, and I pray to the loa every night that I find out." } },
      choices = {
        { text = "Then save every troll you can.", next = "BACK", reply = "Gadrin will try, child, every one he can reach. The loa willing, some of them come home to Sen'jin.", fx = { align = { light = 1 } } },
        { text = "His slaves are lost. End them cleanly.", next = "BACK", reply = "Maybe some be lost, child, but Gadrin will not give up on them yet. End them cleanly if you must, and pray for their spirits.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_seacall = {
      lines = { { id = "xsc_default", text = "The old women know more than any orc far seer, though don't you tell the orcs I said it. Zalazane's poison be in the water now, so when you call the sea spirits, do they come gladly, or do they come sick?" } },
      choices = {
        { text = "They come sick, Master, and grieving.", next = "BACK", fx = { trait = { pious = 1 }, learn = { "echo_isles" } } },
        { text = "They come gladly. They want us home.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_drowned", when = { deathCause = "drowning" },
          text = "You come back to me smellin' of brine, and I know dat look on a face, mon. The water between here and the Echo Isles takes more Darkspear than Zalazane ever did, so don't you try to swim it again without your breath." },
        { id = "h_dd_deaths", when = { deaths = { min = 8 } },
          text = "The spirit healers know your face by now, I think, and so do I. Every death leaves a little cold in a body, and you be carryin' plenty of it, so sit by my fire a while." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one wieldin' the Light. I teach witch doctors, and I tell them always to watch the dead careful. You be the strangest dead I ever see." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, mon, and one I didn't teach. That be good, because the last few I taught don't make me proud." },
        { id = "h_default", key = true,
          text = "I be Master Gadrin, and I teach the Darkspear witch doctors. I teach Vol'jin once, and Zalazane, and one of them I be proud of." },
        { id = "h_op_sylv", when = { opinion = { topic = "sylvanas", stance = "distrust" } },
          text = "Vol'jin tell me you watch the Dark Lady the way he do. Good, child, because the dead that walk on their own make old Gadrin's bones itch." },
        { id = "h_skull", when = { questActive = TODO_QUEST("Minshina's Skull") },
          text = "Minshina be a Darkspear witch doctor long gone, and her skull sit on the isles in Zalazane's hands. Bring it home to me, because she deserve better." },
        { id = "h_cl_zf", tags = { "news" }, when = { cleared = "Zul'Farrak", faction = "Horde" }, text = "You been to Zul'Farrak and back, eh? The Sandfury be cousins of a sort, mon, but cousins who raise their own dead to guard the gates, so Gadrin won't weep for them." },
        { id = "h_zalazane", tags = { "news" }, when = { questActive = TODO_QUEST("Zalazane") },
          text = "Zalazane be my student once, and now he be the shame of my years. End him, and maybe this old man sleep through the night." },
        { id = "h_hexed_resolved", tags = { "news" }, when = { thread = { id = "darkspear_isles", state = "resolved" } },
          text = "Vol'jin send word that the hexed be Darkspear still, and now the village say their names at the fire every night. Gadrin know some of those names from the lessons, child, and he be glad to say them aloud again." },
        { id = "h_hexed_soured", when = { thread = { id = "darkspear_isles", state = "soured" } },
          text = "Vol'jin tell the warriors to strike the hexed without lookin' at their faces, and he tell Gadrin it was a stranger's counsel. The old man don't ask whose, but he think he can guess." },
        { id = "h_orgnil", when = { questActive = TODO_QUEST("Report to Orgnil") },
          text = "Orgnil in Razor Hill need strong arms against the Burning Blade. Go to him, and tell him Gadrin say you be useful." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid come to Sen'jin! The loa of the islands and your Earth Mother be old friends, I think, but Zalazane be twisting the spirits on the Echo Isles so bad that they barely know each other now." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You move quiet as a raptor in the grass, mon. Zalazane's hexed ones never hear you coming, I bet." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon. Good, because the hexed Darkspear on the Echo Isles still swing their spears, even when Zalazane be the one pullin' the strings." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Hexed", min = 20 } }, text = "Fewer of the hexed trolls stagger about the Echo Isles now, and my people say a stranger has been giving them rest. Zalazane will feel that, and he'll not like it." },
        { id = "h_echo", when = { origin = "troll_echo_isles" }, text = "You born on the isles, child, I remember, and you cry the whole way across the water when we leave. Now you come back with a weapon on your back, and Gadrin think maybe the isles be crying for you instead." },
      },
      choices = {
        { text = "I've died more than once, Master. Does it change me?", next = "dd_deaths", when = { deaths = { min = 8 } } },
        { text = "You look at me the way you'd look at Zalazane's puppets.", next = "prej_gadrin", when = { prejudiced = true } },
        { text = "What did Zalazane do with the loa's gifts, Master Gadrin?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Can Zalazane's corruption be undone, Master Gadrin?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What happened on the Echo Isles?", next = "isles" },
        { text = "So Vol'jin was your student.", next = "voljin" },
        { text = "The loa been talking to me again, Master. Loudly.", next = "xloa", when = { origin = "troll_loa_speaker" } },
        { text = "What does the loa want from me, Master? I never asked.", next = "xwant", when = { origin = "troll_witch_doctor_apprentice" } },
        { text = "I hear a voice, Master, and it isn't a loa.", next = "warlock", when = { race = "Troll", class = "WARLOCK" } },
        { text = "The spirits answer me now. Teach me to listen better.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I studied the arcane, Master. Is that so strange?", next = "mage", when = { race = "Troll", class = "MAGE" } },
        { text = "I hunt heads for the tribe, the old way.", next = "headhunter", when = { race = "Troll", class = "HUNTER" } },
        { text = "A rogue could help you against Zalazane.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "How do I fight the hexed Darkspear, Master Gadrin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should a troll fear a Forsaken paladin, Master?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've been to the heart of Zul'Farrak, Master Gadrin.", next = "xcl_zf", when = { cleared = "Zul'Farrak", faction = "Horde" } },
        { text = "The old women on the shore taught me to call the sea, Master.", next = "xorig_seacall", when = { origin = "troll_sea_spirit_caller" } },
        { text = "Thank you, Master.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else, child? Old Gadrin got nothing but time and a warm fire." },
        { id = "h_again2", text = "Ask, ask. The questions keep this old head from rusting." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "Ah, child, sit down, because now I be afraid for you. Zalazane hear a voice that wasn't a loa too, and he tell me it was only power, and look at the isles now." },
        { id = "wl_other", when = { origin = "troll_other_voice" },
          text = "You hear it since you was small, eh? Zalazane too, and I tell him it be nothing. I don't make that mistake twice, so you tell me every time it speak." },
      },
      choices = {
        { text = "I'm not Zalazane. I command it, not the other way.", next = "warlock_command" },
        { text = "Then I'll come to you whenever it speaks.", next = "BACK", reply = "Good, child, and come often, because that voice be patient. Gadrin will listen, and the loa will listen too.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "The power's mine to use, Master, voice or no voice.", next = "BACK", reply = "That be what he said, child, those exact words. Come back to Gadrin before it be too late to come back at all.", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
    warlock_command = {
      lines = { { id = "wc_default", text = "He say that too, in this same hut, sitting where you sit. I believe you mean it, child, and I believe he meant it, and that be what keep me up at night." } },
      choices = { { text = "Then watch me, Master. I'll prove it.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Good, good! The Warchief bring the old ways back to the orcs, and now they come back to us too. You listen to the water first, because on this shore the sea always talk loudest." },
        { id = "sh_orc", when = { race = "Orc" },
          text = "An orc shaman, coming to an old troll for listening lessons, eh? The Warchief's teachers be good, but the sea here, it speak troll, and I translate." },
      },
      choices = {
        { text = "What does the sea say about the isles?", next = "shaman_sea" },
        { text = "I'll listen to the water.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    shaman_sea = {
      lines = { { id = "ss_default", text = "It say the isles be sick, and the sickness spread a little every tide. Zalazane's magic poison the water spirits too, so a shaman who help free the isles heal more than the Darkspear." } },
      choices = { { text = "Then I'll help free them.", next = "BACK", fx = { affinity = 2, learn = { "echo_isles" } } } },
    },
    mage = {
      lines = { { id = "ma_default", text = "Strange? A little, yes, because the Darkspear got the loa and the witch doctors and never need human books. But a sharp mind be a sharp mind, and Zalazane prove a witch doctor can go wrong too, so I judge the student and not the school." } },
      choices = {
        { text = "The tribe needs every kind of power it can get.", next = "BACK", reply = "It does, child, and Vol'jin say the same. Learn your books, and bring what you learn home to the tribe.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll keep the old ways close, beside the new.", next = "BACK", reply = "That be wisdom, child, more than most young ones have. The loa will watch over you, books and all.", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    headhunter = {
      lines = { { id = "hd_default", text = "The old way, eh? That be good to hear, child, so bring the tribe's enemies down clean and give their spirits to the loa proper, and never take a head for pride, because that be how a hunter turns into something else." } },
      choices = { { text = "Clean, and never for pride.", next = "BACK", reply = "Then the loa will be pleased with you, child. Go out clean, and come home clean to Sen'jin.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A head taken for pride still scares the enemy.", next = "BACK", reply = "It scares them, ya, but it scares the hunter's spirit too, after a while. Be careful, child, because pride be a hungry loa.", fx = { align = { honor = -1 } } } },
    },
    isles = {
      big = true,
      lines = {
        { id = "i_default", text = "Zalazane drink deep of power he shouldn't touch, and it drown him. He curse the isles and make our own people his puppets. We leave our home to save the rest." },
      },
      choices = {
        { text = "We'll take it back.", next = "END", reply = "Ya, child, one day we take them back, and Gadrin pray he live to see the Echo Isles again. Go with the loa.", fx = { affinity = 2, align = { honor = 1 }, learn = { "echo_isles" } } },
        { text = "Your people matter more than the isles, so let Zalazane keep them.", next = "END", reply = "Maybe you be right, child, and maybe not. Gadrin still dream of the isles every night, and he pray you never lose a home.", fx = { align = { honor = -1 }, learn = { "echo_isles" } } },
        { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, learn = { "echo_isles" } } },
      },
    },
    voljin = {
      lines = {
        { id = "vj_default", text = "Vol'jin be the best student I ever have. Zalazane listen too, but to the wrong voices. Now Vol'jin stand by the Warchief, and I watch the isles for him." },
      },
      choices = {
        { text = "He chose well.", next = "END", fx = { affinity = 2 } },
        { text = "Do the Darkspear truly belong in the orcs' Horde?", next = "horde_op" },
        { text = "And the student you aren't proud of?", tag = "Persuade", next = "zalazane_blame",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Troll" }, { trait = "kind" } } } },
          fail = { next = "zalazane_shame", fx = { affinity = -1 } } },
      },
    },
    horde_op = {
      lines = { { id = "ho_default", text = "That be the question the old ones chew on around the fire every night, child. The orcs save us from the sea witch and give us this shore, and some say that make us family, and some say it make us servants, so you tell Gadrin what you think." } },
      choices = {
        { text = "The Horde saved your people. That debt is worth honoring.", next = "ho_loyal", fx = { affinity = 1, align = { honor = 1 }, opinion = { horde = "loyal", darkspear = "ally" } } },
        { text = "The Darkspear should look to themselves, not to orcs.", next = "ho_alone", fx = { align = { honor = -1 }, opinion = { orcs = "distrust" } } },
        { text = "The orcs are good allies, but the isles come first.", next = "ho_isles", fx = { affinity = 2, opinion = { darkspear = "first" } } },
        { text = "Thrall stood with us. I'd stand with him anywhere.", next = "ho_thrall", when = { race = "Troll" }, fx = { affinity = 1, opinion = { warchief = "trust" } } },
        { text = "I'm still learning, Master.", next = "BACK" },
      },
    },
    ho_loyal = {
      lines = { { id = "hol_default", text = "Vol'jin say the same, and he say it with his father's blood on that beach, so Gadrin don't argue. A debt paid proper make you family in the end, mon." } },
      choices = { { text = "Something else, Master.", next = "BACK" } },
    },
    ho_alone = {
      lines = { { id = "hoa_default", text = "Zalazane say that too, child, right before he go looking for power of his own. Be careful whose words come out of your mouth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ho_isles = {
      lines = { { id = "hoi_default", text = "Ha! Now that be a Darkspear answer, whoever you are. The orcs be good friends, but friends don't bury our ancestors for us." } },
      choices = { { text = "Something else, Master.", next = "BACK" } },
    },
    ho_thrall = {
      lines = { { id = "hot_default", text = "Then you be your chief's student more than mine, and that make this old man proud twice over." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zalazane_blame = {
      lines = {
        { id = "zb_default", text = "Zalazane be the quicker of the two boys, quicker than Vol'jin even. I see the hunger in him early, and I teach him anyway, because I be proud to have such a clever student. So when you hear the isles be cursed, you remember an old fool help it happen." },
        { id = "zb_troll", when = { race = "Troll" },
          text = "You be Darkspear, so I tell you what I don't tell the chief. I see Zalazane reach too far and I say nothing, because he make me proud. Every puppet on those isles, I count as partly mine." },
      },
      choices = {
        { text = "You couldn't have known, Master.", next = "BACK", fx = { affinity = 2 } },
        { text = "Then help us undo it.", next = "BACK", fx = { affinity = 1, learn = { "echo_isles" } } },
      },
    },
    zalazane_shame = {
      lines = {
        { id = "zs_default", text = "That be an old man's business, and an old man's shame, and not for a stranger to pick at." },
        { id = "zs_easy", text = "Ha, you ask the hard question first, eh? Gadrin answer only the easy ones today." },
      },
      choices = { { text = "Another time, then.", next = "BACK" } },
    },
    xloa = {
      big = true,
      lines = {
        { id = "xl_default", text = "Loudly, eh? Then they be laughing at something, because the loa only shout when the joke be on somebody. You tell people what they say, sometimes, and I tell you this as an old man who did the same: the loa's truth be sharp, so you choose who you cut with it." },
      },
      choices = {
        { text = "I tell what the loa say. Softening it is lying.", next = "BACK", reply = "Truth be truth, child, but it can cut both ways. Speak it, then, and be ready for what it cut.", fx = { affinity = -1, align = { order = -1 }, trait = { stern = 1 } } },
        { text = "I keep most of it to myself, Master, like you taught.", next = "BACK", reply = "Good, child, you listened. The loa tell old Gadrin a great many things, and most of them he takes to his grave unspoken.", fx = { affinity = 2, align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Who are they laughing at this time?", next = "xloa_who" },
      },
    },
    xloa_who = {
      lines = {
        { id = "xlw_default", text = "Zalazane, I hope, because he think the spirits on the isles belong to him now, and no loa ever belong to anybody. Maybe they laugh at old Gadrin too, for waiting so long, and that be fair, mon, so Gadrin laugh along." },
      },
      choices = {
        { text = "Then I'll listen for the end of the joke.", next = "BACK", fx = { affinity = 1, learn = { "echo_isles" } } },
        { text = "Something else, Master.", next = "BACK" },
      },
    },
    xwant = {
      lines = {
        { id = "xw_default", text = "Ha! Your old master teach you to ask before you ask, and now you ask about yourself, eh? Every loa want something, child, and the ones who come to you without being called usually want you to finish something somebody else start, so think hard about what in your life be unfinished." },
      },
      choices = {
        { text = "The isles. That's unfinished for all of us.", next = "BACK", fx = { affinity = 2, learn = { "echo_isles" }, trait = { brave = 1 } } },
        { text = "I'll think on it before I answer, Master.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Old Gadrin hear everything eventually, because everybody come to the witch doctor sooner or later. Ask me about these, child." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You be good to this old man, so sit, and I tell you all of it, the long way round." },
    },
    echo_isles = { { id = "tp_isles", text = "Every morning I look at the Echo Isles across the water, and every morning they still there, waiting for us." } },
    burning_blade = { { id = "tp_blade", text = "Orcs playing with demons, eh? Bad magic be bad magic, whoever play with it, and Orgnil in Razor Hill know that." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin was my best student, and he was never the quickest, but he always listened. He leads the Darkspear now, and I am prouder of him than of anything I ever did." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear were a small tribe, and the sea nearly ended us, and Thrall saved what was left. Now we be strong again, but we remember what it was to be few." } },
    thrall = { { id = "tp_thrall", text = "The Warchief took us in when nobody else would, and he never asked us to forget who we are. That is a rare kind of chieftain, and the trolls know it." } },
    the_elements = { { id = "tp_the_elements", text = "The spirits of the sea and sky talk to me still, though my ears be getting old. They say the Echo Isles are sick, and I believe them." } },
    zul_gurub = {
      { id = "tp_zul_gurub", text = "The Gurubashi empire is dead, and the blood god's priests are trying to wake it again in Stranglethorn. The Darkspear want nothing to do with Hakkar, and I pray he stays asleep." },
      { id = "tp_zul_gurub2", when = { race = "Troll" }, text = "You know the stories as well as I do, child, because your grandmother told them to you. Hakkar wants blood, and the Gurubashi are fools to give it." },
    },
    _none = { { id = "tp_none", text = "Even an old witch doctor don't know everything, though he know most things, yes." } },
  },
}
