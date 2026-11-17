-- Cenarion Hold: the Circle's fort in the middle of the Silithus desert, neutral ground for Alliance and Horde. Voice: bibles/silithus.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "maralith", id = TODO_NPC("Commander Mar'alith"), name = "Commander Mar'alith",
  bible = "bibles/silithus.md", role = "soldier", tier = "major",
  communities = { "cenarion_hold" }, temper = { "steady", "proud" }, values = { "dutiful", "loyal", "kind" },
  notices = { "class", "race", "form" },

  impression = {
    first = "Commander Mar'alith runs Cenarion Hold with perfect courtesy and half his mind elsewhere. His wife is missing, and he keeps stopping mid-sentence as if he'd heard her name.",
    third = "{name} met Commander Mar'alith, who holds Cenarion Hold for the Circle while his wife is lost somewhere in the hives.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, and welcome to Cenarion Hold. Keep your blade for the silithid, and you'll find no quarrel here." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back from the desert, which is more than I can say for many. Sit, if you have a moment, and let Elune's light rest on you a while." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The hives are loudest at night, when the moon is high. I find I listen for them now, whether I want to or not, as my people once listened for the Legion." },
    { id = "g_after", when = { questDone = TODO_QUEST("Into The Maw of Madness") }, text = "Ah, it's you. Forgive me if I don't smile; I'm glad to see you, all the same." },
    { id = "g_away", when = { away = 14 }, text = "You've been away from the Hold {away}, and the hives have not been idle in that time. Sit, if you have a moment, and tell me what you've seen beyond the desert." },
    { id = "g_away_long", when = { away = 60 }, text = "It's been {away}, and you walk back into the Hold as though the desert simply let you go. It rarely lets anyone go, and I find I'm more glad of it than I can easily say." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown much stronger since we first spoke, and the Hold has need of that strength, closer to the hives than I once dared to send you." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I'm told you parted from one of the Hold's people on bitter terms, and the Hold is too small and too beset for quarrels. I would ask you to make it right." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Hold speaks well of you, and I've heard your name at the fires more than once this week, which matters in a place where so few come back to be thanked." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. My wife wore robes not unlike yours, and for a moment, with the sun behind you, I thought you were someone else. You're welcome here, all the same." },
    { id = "n_shadow", cat = "form", place = "before", when = { form = "shadow" },
      text = "Put that shadow away while you stand in my hall, if you would. I have seen what it does to the faithful, and I don't care to see it again." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "One of the Circle's own, and come all this way. Good; we need every druid who can stand the heat and the hum." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "A child of Elune in Silithus again, after a thousand years of leaving it to the sand. Our ancestors bled for this desert; I'd like us to finish what they started." },
  },

  start = "hello",
  nodes = {
    op_fandral = {
      lines = {
        { id = "opf_q", text = "I don't ask, but travellers tell me anyway, and it helps me know which way the wind blows at home. You've likely heard Fandral Staghelm speak, so what do you make of the Arch Druid?" },
      },
      choices = {
        { text = "A strong leader. Darnassus needs his certainty while Malfurion sleeps.", next = "op_fandral_r1", fx = { affinity = 1, align = { order = 1 }, opinion = { fandral = "admire" } } },
        { text = "Proud and cold. He shut the tauren out of the Circle.", next = "op_fandral_r2", fx = { align = { order = -1 }, trait = { skeptical = 1 }, opinion = { fandral = "distrust" } } },
        { text = "Teldrassil was his idea. I'm not sure it was a good one.", next = "op_fandral_r3", fx = { trait = { curious = 1 }, opinion = { fandral = "mixed" } } },
        { text = "He's my Arch Druid, Commander, and I'll not speak against him.", next = "op_fandral_r4", fx = { opinion = { fandral = "loyal" } }, when = { race = "NightElf" } },
        { text = "I'd rather not speak of him, Commander.", next = "BACK" },
      },
    },
    op_fandral_r1 = {
      lines = {
        { id = "op_fandral_r1", text = "Certainty, yes, he has that in abundance. It's a useful thing in a war, and a heavy thing to argue with." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_fandral_r2 = {
      lines = {
        { id = "op_fandral_r2", text = "He opposed teaching them, and he lost that argument, which he has not forgotten. I'd keep that observation out of Darnassus if I were you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_fandral_r3 = {
      lines = {
        { id = "op_fandral_r3", text = "Many of us wonder about the tree, quietly, though few would say so aloud in Darnassus. You'll find I'm one of the quiet ones." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_fandral_r4 = {
      lines = {
        { id = "op_fandral_r4", text = "Loyal, and careful about it. That's a good habit in Darnassus, and a better one in a war camp." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_maralith = {
      big = true,
      lines = { { id = "xpt_maralith_default", text = "I'll gladly put you to work, but understand that the Hold is a druids' camp first and a fortress second, and my soldiers don't take orders from adventurers. Fight with us, follow the signals, and don't go chasing a hive on your own because you've counted five swords and think it enough." } },
      choices = {
        { text = "We'll follow your signals, Commander. The Hold's order comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We fight our own way. Just point us at the hives.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_aq20 = {
      big = true,
      lines = { { id = "xcl_aq20_default", text = "Quiet is not empty, and the Circle has learned that lesson in blood. Natalia went out toward those hives to understand them, and I have spent every day since wondering whether the thing you killed ever knew her name." } },
      choices = {
        { text = "Grieve later, Commander. The hives must be burned while they're weak.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Go and look for her. The Hold can spare you a day.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "What drew your wife to the hives?", next = "xcl_aq202" },
      },
    },
    xcl_aq202 = {
      lines = { { id = "xcl_aq202_default", text = "Curiosity, at first, because she was the finest scholar in the Hold and the silithid were a puzzle she could not leave alone. Toward the end she spoke of voices under the sand, and I told myself it was only the heat." } },
      choices = {
        { text = "Voices under that sand mean nothing good. Be careful, Commander.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Where my wife has gone, and whether she lives. You have walked back from death with the Light in your hands, so perhaps you understand what it is to be lost and found, and perhaps you can tell me whether the Light finds everyone." } },
      choices = {
        { text = "The Light finds those who are sought, Commander. Keep hope.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light didn't find me. I found it. Seek her yourself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Whether a mind that has been touched by something old and hungry can ever be called back, paladin. I ask for a friend, or so I tell myself, and the druids have no remedy, and the silithid do not wait while I search for one." } },
      choices = {
        { text = "The Light can mend what seems lost. Don't give up hope.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some things can't be called back. Duty must come first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "By reading the sand as you would read a forest floor, for the hives send their scouts along the dunes before every swarm. Natalia could tell a silithid's track from a scorpid's at a glance, and forgive me, I did not mean to speak of my wife; watch the dunes for us, and tell my captain what you find." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would serve the Hold well on the perimeter, for a beast's senses reach where a sentry's cannot, and I would welcome every advantage against the hives." },
      },
      choices = {
        { text = "I'll report to your captain. The Hold needs order, not heroics.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I hunt alone and strike wherever I see fit.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Healers for the riders who come back from the hives, and steady hands that do not tremble at what they find in the sand. The silithid wound the body and the Twilight's Hammer wound the mind, and the Hold has too few who can mend either." } },
      choices = {
        { text = "Then put me where the wounded come in, Commander.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let others nurse the broken. I'd rather see the cult suffer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Perhaps, if a rogue went where my scouts cannot, into the Twilight camps and the empty places in the south. I will not order anyone to look for my wife, {class}; the Hold comes first, and I must keep reminding myself of that." } },
      choices = {
        { text = "Duty first, Commander. The Hold needs you whole.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget orders. I'll look for her myself.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll keep my eyes open.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Larksbane believes they stir the hives, and I have learned to trust her ear for stone. Something beneath the Scarab Wall is awake and listening, and I would rather a mage studied that than any of us fed it." } },
      choices = {
        { text = "Then let it be studied carefully, under the Circle's watch.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Smash the crystals. Study is a luxury here.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll speak with Larksbane.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I fear anyone who mistakes power for wisdom, and the cult is full of them. Fight beside us and you will be treated as any ally, but if I hear of a demon loose among the tents, I will not ask whose it was." } },
      choices = {
        { text = "That's fair. My demons answer to me, and to the Hold's peace.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The cult were weak. I am not.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I understand, Commander.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_maralith", tags = { "news" }, when = { party = { size = 4 } },
          text = "A full company at Cenarion Hold. Good, because the silithid don't come at us one at a time, and neither should anyone who goes out to meet them." },
        { id = "h_cl_aq20", tags = { "news" }, when = { cleared = "Ruins of Ahn'Qiraj" }, text = "They say you went into the Ruins of Ahn'Qiraj and that Ossirian the Unscarred lies broken in the sand. The Hold will sleep easier tonight, and perhaps, for once, so will I." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin of the Alliance, at Cenarion Hold. You are welcome, as is anyone who will stand against the swarm, though I confess I hoped the Light might have answers I have not found." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. Vish Kozus will have marked you before you reached the gate, so do not take it amiss if he watches you; he watches everyone twice since... since the dig went wrong." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. The arcane lies thick and strange in this desert, and the crystals out in the sand sing with it; Larksbane will tell you more than I can, if you have the patience for a dwarf." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, on the Circle's ground. You are welcome so long as you fight what threatens the Hold, but the Twilight's Hammer began, I think, with people who were sure they could master what they summoned." },
        { id = "h_default", key = true,
          text = "I am Commander Mar'alith, and I hold this fort for the Cenarion Circle. From here we watch the hives, and the cult, and the wall our ancestors raised against something far worse than either, in a war my people still remember as if it were yesterday." },
        { id = "h_dearest", tags = { "news" }, when = { questActive = TODO_QUEST("Dearest Natalia") },
          text = "Have you been to the dwarves' camp yet? I keep thinking I should ride there myself, and then a report arrives, and another, and the day is gone." },
        { id = "h_maw", tags = { "news" }, when = { questActive = TODO_QUEST("Into The Maw of Madness") },
          text = "Hive'Regal lies to the south. I gave you an order I cannot carry out myself, {name}, and I'll not pretend it sits easily with me." },
        { id = "h_maw_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Into The Maw of Madness"), days = 7 } },
          text = "I have read your report a dozen times, and I still can't make the words mean anything but what they say. She called on that name as she fought you, didn't she?" },
        { id = "h_purpose", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Terrible Purpose"), days = 7 } },
          text = "The deserter's parchment has changed our battle plans more than any scout's report this season. We had thought the cult a nuisance at our flank, and it is nothing of the kind." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There you are. I find the Hold steadier when you're in it, which is a strange thing to say of someone who's rarely here." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde at Cenarion Hold. You are welcome here, as are all who stand against the swarm, though forgive me if my thoughts wander when I see a priest." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. The Circle has need of keen eyes in this desert, for the silithid move beneath the sand where no sentry can follow them." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Horde, and one of the Forsaken, at Cenarion Hold. You are welcome, as anyone is who stands against the swarm, though I confess I hoped the Light might have answers I have not found." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Ask, before the next runner finds me; even a kaldorei's patience has limits tonight." },
        { id = "h_again2", text = "Go on. I've a hundred things to see to, and I'd rather talk to you than to any of them." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask what you like. I won't be sleeping for a while yet." },
      },
      choices = {
        { text = "What brings the Circle to this desert?", next = "circle" },
        { text = "You seem troubled, Commander.", next = "natalia" },
        { text = "What do you know of the Twilight's Hammer here?", next = "cult" },
        { text = "You must have good officers serving under you here.", next = "hold" },
        { text = "Natalia was a priestess. I'd like to understand her.", next = "priest", when = { class = "PRIEST" } },
        { text = "The Circle's druids stand with you, Commander.", next = "druid", when = { class = "DRUID" } },
        { text = "Our people sealed this place once, didn't they?", next = "kaldorei", when = { race = "NightElf" } },
        { text = "What will you do now, Commander?", next = "after", when = { questDone = TODO_QUEST("Into The Maw of Madness") } },
        { text = "My blade is yours, Commander.", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "The elements here are in torment, Commander.", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "A rogue might find out what happened on that dig.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What do the crystals have to do with the silithid?", next = "xmage", when = { class = "MAGE" } },
        { text = "You seem to fear warlocks will join the Twilight's Hammer.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What does the Hold need from a priest, Commander?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "How can a hunter best serve the Hold, Commander?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What answers are you looking for, Commander?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "What answers do you seek from the Light, Commander?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Ossirian is dead, Commander. The Ruins are quiet for now.", next = "xcl_aq20", when = { cleared = "Ruins of Ahn'Qiraj" } },
        { text = "Put us to work, Commander. We'll hold the line.", next = "xpt_maralith", when = { party = { size = 4 } } },
        { text = "I'll leave you to your work, Commander.", next = "END", fx = { affinity = 1, standing = { cenarion_hold = 1 } } },
      },
    },

    circle = {
      big = true,
      lines = {
        { id = "c_default", key = true, fx = { learn = { "cenarion_circle", "silithid", "ahn_qiraj" } },
          text = "The silithid. Their hives have swollen past anything the Circle has seen, and they spread further every season, south and east toward Tanaris and Un'Goro. Beyond them, behind the Scarab Wall, lies Ahn'Qiraj, which our ancestors sealed and which we have sworn will stay sealed." },
        { id = "c_purpose", when = { questDone = TODO_QUEST("A Terrible Purpose") },
          text = "The silithid first, but I've learned not to say 'only'. Thanks to you, we know the cult in the west is no sideshow, and I've had to move soldiers I could barely spare to watch them." },
      },
      choices = {
        { text = "Alliance and Horde, under one roof?", next = "circle_peace" },
        { text = "What lies behind the Scarab Wall?", next = "circle_wall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_peace = {
      lines = { { id = "cp_default", text = "The Circle serves the land, not a banner, as Malfurion taught us, and the bugs have never asked anyone's allegiance before they bite. The infantry keep the peace inside these walls, and they've had to remind a few hotheads of it rather firmly." } },
      choices = {
        { text = "Then I'll keep the peace here, whatever banner they fly.", next = "BACK", fx = { affinity = 1, align = { order = 1 }, standing = { cenarion_hold = 1 } } },
        { text = "I'll keep it as long as they do, and not a moment longer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_wall = {
      lines = { { id = "cw_default", text = "A city older than ours, and the things that built it. I wasn't on this sand when our people fought here, and those who were don't speak of it lightly; I've heard enough to want the wall to hold until the sand buries it." } },
      choices = {
        { text = "I doubt the whole Circle agrees on that.", next = "circle_fandral" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_fandral = {
      lines = { { id = "cf_default", text = "The Circle agrees on very little these days, between Darnassus and Moonglade. But on Silithus, at least, the Arch Druid and the Keeper both send me soldiers, and I don't ask either of them what they say about the other." } },
      choices = {
        { text = "What do you think of Staghelm yourself?", next = "op_fandral" },
        { text = "That's diplomatic of you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    natalia = {
      big = true,
      lines = {
        { id = "n_default", key = true, fx = { learn = { "natalia" } },
          text = "Forgive me. My wife, Natalia, is missing. She came here with the Circle's expedition, a priestess who loved old ruins more than was good for her, and she was last seen walking south toward Bronzebeard's camp under a waning moon." },
        { id = "n_dearest_done", when = { questDone = TODO_QUEST("Dearest Natalia") },
          text = "You've heard the dwarves' tale, so you know as much as I do now. She went into Hive'Regal, and the bugs let her pass, and I can't make myself understand either half of that." },
        { id = "n_maw_done", when = { questDone = TODO_QUEST("Into The Maw of Madness") },
          text = "You found her, and you did what I asked of you. I don't regret the order, {name}, but I'll grieve it for the rest of my days." },
      },
      choices = {
        { text = "Tell me about her.", next = "nat_who" },
        { text = "She must have been acting strangely before she left.", next = "nat_before" },
        { text = "I'll find her, Commander.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } }, when = { questBefore = TODO_QUEST("Into The Maw of Madness") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nat_who = {
      lines = { { id = "nw_default", text = "Quick, curious, impossible to keep in a tent. She was the first of us to join the dwarves when they went digging in the hives, and she came back from every trip with sand in her hair and some new carving she wanted to show me." } },
      choices = {
        { text = "You must miss her terribly.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nat_before = {
      lines = { { id = "nb_default", text = "For weeks she spoke to herself when she thought no one was near, and when I asked, she told me she was perfectly well and must be allowed to go on with her work. She was so certain that I let it be." } },
      choices = {
        { text = "Did you actually believe her, Commander?", tag = "Persuade", next = "nat_doubt",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { trait = "kind" } } } },
          fail = { next = "nat_duty", fx = { affinity = -1 } } },
        { text = "Madness can hide very well behind calm.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nat_doubt = {
      big = true,
      lines = { { id = "nd_default", text = "No. I saw her three times, talking to the empty air as if someone answered, and each time I told myself it was prayer, because I wanted it to be. I've commanded soldiers for centuries, and I looked away from the one thing in front of me." } },
      choices = {
        { text = "You loved her. That isn't a failing.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then don't look away again, Commander.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nat_duty = {
      lines = { { id = "nu_default", text = "What I believed is my own affair. I'm bound to this post whatever I believe, and the Hold doesn't stop needing me while I grieve." } },
      choices = { { text = "Of course, Commander.", next = "BACK" } },
    },

    cult = {
      big = true,
      lines = {
        { id = "cu_default", key = true, fx = { learn = { "twilights_hammer" } },
          text = "They've raised camps across the west of the desert and they chant at their stones day and night. Larksbane is reading their tablets, and the Wildmane brothers watch them for me, but I confess I had thought them a nuisance at our flank and no more." },
        { id = "cu_purpose", when = { questDone = TODO_QUEST("A Terrible Purpose") },
          text = "Your deserter's parchment cured me of thinking them a nuisance. They have a purpose here, and orders from something above them, and I've changed our plans to meet it." },
      },
      choices = {
        { text = "They must want something here in Silithus.", next = "cult_want" },
        { text = "Strike now, Commander, before they're ready.", next = "BACK", fx = { align = { order = -1 }, opinion = { twilights_hammer = "strike" } } },
        { text = "Learn their plans first. Then strike where it hurts.", next = "BACK", fx = { align = { order = 1 }, opinion = { twilights_hammer = "patience" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult_want = {
      lines = { { id = "cw2_default", text = "Huum thinks their rituals and the crystals in the sand are tied together somehow. What I know is that they welcome every calamity as if it were good news, and a desert full of hives is the best news they've had in years." } },
      choices = {
        { text = "Then the bugs and the cult may be allies.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hold = {
      lines = {
        { id = "ho_default", text = "Captain Kozus commands the guard from the watchtower. Windcaller Proudhorn keeps us fed and supplied, Geologist Larksbane listens to the stones, the Wildmane brothers watch the cult, and Aurel Goldleaf makes whatever we ask of her. Layo Starstrike keeps Valor's Rest for us at the top of the Un'Goro road." },
      },
      choices = {
        { text = "Tell me about Captain Kozus.", next = "hold_vish" },
        { text = "And the dwarves to the south?", next = "hold_dwarves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold_vish = {
      lines = { { id = "hv_default", text = "He's the finest blade in the Hold and the worst at pretending he isn't worried about me. If he's rude to you, he likes you; if he's polite, keep your hand near your sword." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    hold_dwarves = {
      lines = { { id = "hd_default", fx = { learn = { "explorers_league" } },
        text = "Brann Bronzebeard's people, digging in the ruins for Ironforge's explorers, though Brann himself has wandered off again, I'm told. Natalia spent more time at their camp than at ours, toward the end." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    priest = {
      big = true,
      lines = {
        { id = "pr_default", text = "She served Elune as a priestess, and she healed half this fort at one time or another. I've no head for prayers, so I can't tell you what she studied, only that she read by lamplight long after I'd given up and slept." },
        { id = "pr_spells", when = { questDone = TODO_QUEST("Dearest Natalia") },
          text = "The dwarves say she screamed them into flight and then tore at their minds with words they could hear inside their skulls. You know those prayers better than I do, priest: are they a priestess's prayers?" },
      },
      choices = {
        { text = "They're shadow, Commander, and shadow is only a tool.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Those are shadow's prayers. No servant of Elune should know them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Can someone come back from that?", next = "priest_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_back = {
      lines = {
        { id = "pb_default", text = "I was going to ask you that. Tell me honestly, when you know, and not before; I'd rather wait for the truth than live on a kind word." },
        { id = "pb_after", when = { questDone = TODO_QUEST("Into The Maw of Madness") },
          text = "You've answered that already, in the only way it could be answered. I don't blame you for it, and I'd thank you not to blame yourself." },
      },
      choices = { { text = "I understand, Commander.", next = "BACK", fx = { affinity = 1 } } },
    },

    druid = {
      lines = { { id = "dr_default", text = "Then the Circle sent me the right sort. This land has been sick for a thousand years, and the hives are the fever; I don't expect to cure it in one lifetime, even a kaldorei's, but I mean to stop it spreading." } },
      choices = {
        { text = "Burn the hives, and the wild will heal itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The land needs keepers, Commander, and soldiers too.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kaldorei = {
      lines = { { id = "ka_default", fx = { learn = { "ahn_qiraj" } },
        text = "We did, a thousand years ago, at a cost the old ones still won't count aloud. The wall at Ahn'Qiraj is our people's work, and every day it holds is a day their sacrifice still means something." } },
      choices = {
        { text = "Tell me about that war.", next = "kaldorei_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kaldorei_war = {
      lines = { { id = "kw_default", text = "The War of the Shifting Sands, they call it, though I've never heard anyone who fought in it call it anything at all. The insects came out of the south like a tide, and we drove them back behind the wall and sealed it, and then we went home and tried very hard to forget." } },
      choices = { { text = "Then we'll remember it for them.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },

    after = {
      big = true,
      lines = {
        { id = "af_default", key = true, fx = { learn = { "cthun" } },
          text = "Hold this fort, as I always have, and learn what C'Thun is before it learns any more about us. Larksbane and the dwarves are working on those crystals, and I mean to give them every soldier they ask for." },
      },
      choices = {
        { text = "She wasn't herself at the end, Commander.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What is C'Thun?", next = "after_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_name = {
      lines = { { id = "an_default", text = "I don't know, and that frightens me more than anything you could have said. Whatever it is, it sits somewhere behind that wall, and it can reach through stone to whisper to a priestess who only wanted to read old carvings." } },
      choices = { { text = "Then we'll find out together.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "My soldiers are spread thinner than I would wish, and every one of them stands between this Hold and the hives, as the Sentinels once stood between Ashenvale and the Legion. A warrior who keeps the peace in my courtyard and fights where I send them is worth more to me than any number of promises." },
        { id = "xw_watch", when = { origin = "nightelf_auberdine_watch" }, text = "You carry yourself like one of the Auberdine watch. Then you already know how long a night can be when you are counting soldiers who have not returned." },
      },
      choices = {
        { text = "I'll go where you send me, Commander.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { cenarion_hold = 1 } } },
        { text = "I'll fight where I judge best, Commander.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    x_shaman = {
      lines = {
        { id = "xsh_default", text = "The Circle's druids say the same of the land, and now the Horde's shamans say it of the stones and the wind; I have stopped believing it a coincidence. Tell Windcaller Proudhorn or the Wildmanes what you hear, for I confess I no longer have the patience to listen well." },
      },
      choices = {
        { text = "What is the cult doing out there?", next = "cult" },
        { text = "I'll tell them what the spirits say.", next = "BACK", fx = { affinity = 1, standing = { cenarion_hold = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every scout's report crosses my table before it goes to Moonglade. I'll tell you what I can of any of these." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've earned straight answers in this Hold. Ask about any of these, and I'll hold nothing back that I'm free to give." },
    },
    background = {
      { id = "tp_bg", text = "I've fought more wars than I care to name, and I came to the Circle late, when I'd learned that soldiers alone don't save anything. Now I command the Circle's soldiers, which I suppose is a joke at my own expense." },
      { id = "tp_bg2", text = "A commander of the Circle, and a husband, for as long as I'm allowed to be both.", next = "natalia" },
    },
    advice = { { id = "tp_ad", text = "Never sleep near a hive's mouth, however tired you are; the ground itself carries their footsteps. And whatever you hear out there under the moon, don't answer it." } },
    natalia = {
      { id = "tp_natalia", text = "My wife. You've heard, then; the whole Hold has, I suppose.", next = "natalia" },
      { id = "tp_natalia2", text = "She'd have liked you. She liked anyone who asked questions." },
    },
    twilights_hammer = { { id = "tp_hammer", text = "A cult that prays for the end of the world, camped in the one desert where the world might oblige them.", next = "cult" } },
    silithid = { { id = "tp_silithid", text = "There are three great hives, Hive'Ashi, Hive'Zora and Hive'Regal, and a thousand small ones, and every one of them is louder than last month.", fx = { learn = { "silithid_hives" } } } },
    ahn_qiraj = { { id = "tp_aq", text = "The city behind the wall, and the reason this fort exists at all. Pray you never see the inside of it." } },
    cenarion_circle = { { id = "tp_circle", text = "We serve the land and keep its balance, as Malfurion taught, and the land is in danger here. That's all the politics I have time for." } },
    cthun = { { id = "tp_cthun", text = "A name my wife shouted at you as she died. I'll learn what it means if it's the last thing this Hold does." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives are spreading, slowly, and every one of them tunnels toward the old city in the south. We burn them back, and next season they're there again." } },
    bronze_dragonflight = { { id = "tp_bronze_dragonflight", text = "The old songs say a bronze dragon helped seal the city a thousand years ago, and then left, and nobody has seen it since. I'd like very much to ask it why it left." } },
    malfurion = { { id = "tp_malfurion", text = "Malfurion sleeps, and Fandral leads the Circle in his stead, and I serve where Fandral sends me. I do not think the Arch Druid knows how bad it is out here." } },
    tyrande = { { id = "tp_tyrande", text = "High Priestess Tyrande keeps Darnassus, and she has sent Sentinels south to hold this desert with us. I pray to her goddess for my wife, every night." } },
    elune = { { id = "tp_elune", text = "Natalia used to say Elune hears everything, even in the desert. I hope she is right, because I have been saying a great deal." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids of the Circle walk in the Dream, and some of them say the Dream is uneasy. I have no time for dreams, not while my wife is missing." } },
    thrall = { { id = "tp_thrall", text = "The Horde sends its warriors here as the Alliance does, and they fight beside us against the swarm. I am grateful, and I keep them on opposite sides of the Hold." } },
    _none = { { id = "tp_none", text = "I'm afraid that's outside my reports. Larksbane or the Wildmanes might know, Elune willing." } },
  },
}

P:NPC {
  key = "larksbane", id = TODO_NPC("Geologist Larksbane"), name = "Geologist Larksbane",
  bible = "bibles/silithus.md", role = "scholar", tier = "major",
  communities = { "cenarion_hold" }, temper = { "steady", "gentle" }, values = { "curious", "patient", "honest" },
  notices = { "race", "class", "craft" },

  impression = {
    first = "Geologist Larksbane is a dwarf who listens to rocks, and the rocks of Silithus are humming. She asked whether I could hear it too, and I'm not sure my answer was honest.",
    third = "{name} met Geologist Larksbane, who studies the humming crystals of Silithus for the Cenarion Circle.",
  },

  greetings = {
    { id = "g_default", text = "Mind the crates, friend; half of them are full of rocks, and the other half are full of more interesting rocks." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Come and listen to this sample and tell me I'm imagining things." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's quieter at night, so ye can hear it properly. Shh, now." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' the hum's grown louder in that time, I'd swear it on my hammer an' my beard both. Come an' listen, an' tell me I'm wrong." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown a fair bit since ye last came by my crates, an' I can feel it the way I feel a seam o' good ore. The crystals might take notice o' ye now, so mind yerself near them." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear ye talked someone at the Hold round tae yer view, which is more than I've managed wi' the Circle about my crystals. Mebbe ye could put in a word for a dwarf wi' a feelin'." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Come and stand by the samples a moment and tell me if your fingers tingle, because mine have been tingling all week." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A face from home! Ye'll forgive me if I talk your ear off; the elves are lovely, but none of them knows a geode from a gallstone." },
    { id = "n_miner", cat = "craft", when = { profession = { "Mining" } },
      text = "Ye've got thorium dust on your boots and slime on your gloves, so you've been in the tunnels. Did ye hear anything strange down there, besides the bugs?" },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, eh? Natalia used to sit where you're standing. She said the crystals sounded like a choir a long way off, and I didn't like the way she smiled when she said it." },
  },

  start = "hello",
  nodes = {
    op_magni = {
      lines = {
        { id = "opm_q", text = "Ironforge sends me letters and no help, and every letter has the king's seal on it. You've been through the mountain, so I'll ask ye straight: what do ye make of King Magni?" },
      },
      choices = {
        { text = "A good king. He holds the Alliance together as much as anyone.", next = "op_magni_r1", fx = { affinity = 1, align = { order = 1 }, opinion = { magni = "admire" } } },
        { text = "He forgets the dwarves who work far from the throne.", next = "op_magni_r2", fx = { affinity = 1, align = { order = -1 }, opinion = { magni = "distant" } } },
        { text = "Kings are kings. I'd rather trust the stone.", next = "op_magni_r3", fx = { trait = { witty = 1 }, opinion = { magni = "mixed" } } },
        { text = "He's my king, and there's none better under the mountain.", next = "op_magni_r4", fx = { affinity = 2, opinion = { magni = "loyal" } }, when = { race = "Dwarf" } },
        { text = "I've never met the man, Larksbane.", next = "BACK" },
      },
    },
    op_magni_r1 = {
      lines = {
        { id = "op_magni_r1", text = "Aye, he does, and he's a fine dwarf to share a drink with, they say. I only wish he'd spare a few for Silithus." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_magni_r2 = {
      lines = {
        { id = "op_magni_r2", text = "Ye've been reading my letters, I think! Still, he's got a whole kingdom to look after, and I've only got a desert full of humming rocks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_magni_r3 = {
      lines = {
        { id = "op_magni_r3", text = "Now that's a geologist's answer! The stone never lies, though it does mumble an awful lot down here." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_magni_r4 = {
      lines = {
        { id = "op_magni_r4", text = "Spoken like a true Bronzebeard! I'll raise my next mug to him, and to ye." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They hum near anythin' with a bit o' power in it, which worries me more than it pleases me. Down in the hives the bugs guard them like treasure, an' I've a nasty feelin' the crystals are listenin' tae somethin' much older than the Light or any o' us." } },
      choices = {
        { text = "Then the crystals should be destroyed before they spread.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Study them carefully first. Rash work gets diggers killed.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not to yer arm, but maybe to yer head, because I've watched silithid fight like they'd gone mad around them, and I'd not like to learn what that hum does to a body standing too close. If ye're holding a line near the crystals, keep yer wits about ye and yer shield up." } },
      choices = {
        { text = "A clear head holds the line. I'll keep my discipline.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the madness come. Fury's served me well enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, I'd stake my hammer on it, though the Circle wants proof before it'll believe a dwarf with a feeling. Their tracks circle the crystals like moths round a lamp, and a good tracker could map the whole pull of them, if they were brave enough to follow." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Watch how {pet} acts near the crystals, will ye? If it goes stiff or won't settle, I'd like to know, because a beast hears what I can only feel through my boots." },
      },
      choices = {
        { text = "Study the crystals carefully before anyone acts on them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Smash the crystals and be done with the mystery.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "That's what I'd like tae know, because they hum for the Twilight's Hammer too, an' I'd hate tae think ye had anythin' in common wi' them. It's somethin' in yer power, Light or shadow, an' the rocks o' Silithus are listenin' for it." } },
      choices = {
        { text = "Then let them hear the Light, and nothing the cult brings.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shadow speaks louder here. Perhaps the stones prefer it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Aye, they can, through the sand, an' they swarm a heavy walker faster than ye'd believe. A light step gets ye closer tae the crystals, an' that's where I need samples taken, before the hum gets any louder." } },
      choices = {
        { text = "I'll get your samples, quick and quiet.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather burn the hives and be done with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll mind my feet.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I think they're connected tae somethin' big an' old an' angry, an' I'd sooner not find out what. Whatever it is, it's no' demonic, mind, but it's no' friendly either, an' I'd keep yer imp well away from it." } },
      choices = {
        { text = "I'll keep my demon away. Caution is wise.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd like to see what my demon makes of it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "That's unsettling.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Both, I fear, though the land's slower to complain. The ground round the big clusters has gone dead as slag, not a root nor a beetle in it, and I can't say whether the stones did that or only moved in after something else did." } },
      choices = {
        { text = "Study them first. Breaking what we don't understand is how deserts start.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Smash the lot. Some things aren't worth understanding.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, aye! Stand still a moment, would ye, for I've a mind tae see whether the crystals hum louder near the Light or quieter, an' ye're the first holy sort tae walk in." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, aye? Then ye'll have quiet feet, an' I'll need 'em, because the bugs out by the crystals feel every footstep in the sand." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, is it? Then tell me, when ye listen tae those crystals, does the hum sound like anythin' ye've heard from yer demons? Because it's no natural sound tae me." },
        { id = "h_ss_resolved", tags = { "news" }, when = { thread = { id = "silithus_stirring", state = "resolved" } },
          text = "Ye've been talkin' tae the bronze fellow, I hear. He told me once that the hum's older than my whole clan, an' I've counted it a bit more respectfully since." },
        { id = "h_default", key = true,
          text = "Can ye hear that? It's the crystals out in the sand, and the hum gets louder every day I'm here. I'm the Circle's geologist, for my sins, and I'm fair sure those stones are what's driving the bugs out of their heads." },
        { id = "h_mystery", tags = { "news" }, when = { questActive = TODO_QUEST("The Twilight Mystery") },
          text = "The fragments are scattered around that ruined camp in the northwest, and the elementals there won't make it easy. Bring me every bit ye can find, and we'll see what the cult was so keen to write down." },
        { id = "h_deserter", tags = { "news" }, when = { questActive = TODO_QUEST("The Deserter") },
          text = "Have ye found the hermit yet? He's jumpy, I'm told, so don't go stomping up to his door like a dwarf on market day." },
        { id = "h_purpose", when = { questDone = TODO_QUEST("A Terrible Purpose") },
          text = "The Commander's moved half the patrols west on the strength of that parchment, and I can't say I blame him. I just wish the cult's terrible purpose had been a bit less terrible." },
        { id = "h_prism", tags = { "news" }, when = { questRecent = { TODO_QUEST("Unraveling the Mystery"), days = 7 } },
          text = "I've barely put that prism down since ye brought it. The outer layer turns, ye see, and only when it lines up with the marks inside does the message come through, which is clever, and I hate it." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There's my favourite pair of ears! Pull up a crate, the comfortable one with the agate in it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest o' the Horde! Ye'll not mind if I ask ye tae hold still a moment, because the stones in my satchel have started hummin' since ye walked in." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, aye, and ye've the look of someone who'd swing at a crystal if it hummed at ye wrong. Please don't, because I need them in one piece." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Ye'll have noticed the silithid don't walk straight out there, then, all twitchy and turned about, like something's pulling at them." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the Circle, and about time too. Ye'll feel the crystals better than my instruments do, I'd wager, so tell me if they make yer teeth ache as well." },
      },
      again = {
        { id = "h_again", text = "What else, {g:lad|lass}? I've got rocks to sort, but they're nae going anywhere; they've waited since the titans set them down." },
        { id = "h_again2", text = "Go on, ask. It's nice to talk to something that answers back." },
      },
      choices = {
        { text = "Do the crystals harm the land, or only the bugs?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What is that humming?", next = "crystals" },
        { text = "A geologist seems an odd fit for the Circle.", next = "work" },
        { text = "What do the cult's tablets say?", next = "tablets", when = { questDone = TODO_QUEST("The Twilight Mystery") } },
        { text = "What's the Twilight's Hammer doing with stones?", next = "tablets", when = { questBefore = TODO_QUEST("The Twilight Mystery") } },
        { text = "A dwarf, this far from the mountains?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I hear something in the crystals too.", next = "priest_hum", when = { class = "PRIEST" } },
        { text = "This ore's coated in some kind of slime.", next = "mining", when = { profession = { "Mining" } } },
        { text = "What did the prism tell you?", next = "prism", when = { questDone = TODO_QUEST("Unraveling the Mystery") } },
        { text = "Those crystals hum with arcane power, don't they?", next = "x_mage", when = { class = "MAGE" } },
        { text = "The earth spirits are speaking here. Can't you hear them?", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "I'd guess the silithid can feel footsteps through the sand.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You think the crystals have a dark power?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The stones seem to hum when a priest comes near.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Those crystals look like a danger to fighters, Larksbane.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Have the crystals changed how the silithid move, Larksbane?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "The crystals seem to answer the Light, Geologist.", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll let you get back to your rocks.", next = "END" },
      },
    },

    crystals = {
      big = true,
      lines = {
        { id = "c_default", key = true, fx = { learn = { "silithid", "silithid_hives" } },
          text = "Great glyphed things, standing in the sand and down in the hives, and every one of them hums. The closer ye get, the angrier the silithid are, so either the bugs are guarding them or the crystals are telling the bugs what to do." },
      },
      choices = {
        { text = "Those crystals ought to be destroyed.", next = "crystals_break" },
        { text = "Is the hum getting faster, too?", tag = "Persuade", next = "hum_count",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Dwarf" }, { class = "PRIEST" } } } },
          fail = { next = "hum_shrug", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crystals_break = {
      lines = { { id = "cb_default", text = "Maybe, with enough powder and a fool to light it, but I'd sooner know what they are first. Breaking a thing ye don't understand is how the Dark Irons got a fire lord in their basement." } },
      choices = { { text = "Fair point.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    hum_count = {
      big = true,
      lines = { { id = "hc_default", text = "Aye, it is, and I've told no one but you. There's a beat under the hum, slow at first, and I've counted it every night for a month; it's quicker now, like something counting down, and I can't prove a word of it to the Commander." } },
      choices = {
        { text = "Then keep counting. I'll believe you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The Commander should hear this anyway.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hum_shrug = {
      lines = { { id = "hs_default", text = "A hum's a hum, friend. I'll tell ye when I've got numbers, and not a moment before; geologists don't trade in hunches." } },
      choices = { { text = "Right, then.", next = "BACK" } },
    },

    work = {
      lines = { { id = "w_default", text = "The druids know trees and beasts better than anyone living, but this trouble's in the stone, and they had the sense to ask someone who knows stone. Between the crystals, the red ones out by the cult's camps and the ore down in the tunnels, I've never been so busy or so worried." } },
      choices = {
        { text = "Why would druids trust a dwarf with this?", next = "work_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_why = {
      lines = { { id = "ww_default", text = "Because I don't pretend to know more than I do, which is rarer than ye'd think among scholars. The Commander asked me one question when I arrived, whether I'd tell him bad news straight, and I said aye, and here I am." } },
      choices = { { text = "That's a good answer.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },

    tablets = {
      lines = {
        { id = "t_default", fx = { learn = { "twilights_hammer" } },
          text = "There was a camp of Twilight's Hammer cultists northwest of here, until something blew it to kindling and left elementals walking where the tents stood. They wrote everything on clay tablets, and I'd give a lot to know what was worth writing down out there." },
        { id = "t_done", when = { questDone = TODO_QUEST("The Twilight Mystery") },
          text = "I can read every word on those fragments, and not one sentence makes sense, which means it's a code. The cult does that; whoever knows the key is the only one who can tell us what they're up to." },
      },
      choices = {
        { text = "Someone must be able to break their code.", next = "deserter" },
        { text = "Burn the tablets. The cult's words poison whoever reads them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Read every word. Knowledge is a weapon, whatever its source.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    deserter = {
      lines = { { id = "d_default", fx = { learn = { "ortell" } },
        text = "A man who used to wear their robes and ran off, called Ortell, hiding out in the hills east of the hives. The cult wants him dead, which makes him the best friend we're likely to get." } },
      choices = {
        { text = "A deserter is hard to trust.", next = "deserter_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deserter_trust = {
      lines = { { id = "dt_default", text = "Trusted to hate the people hunting him, aye, and out here that passes for a code. Whether ye'd leave your purse with him is another matter." } },
      choices = {
        { text = "If he's turned his back on them, I'll take his word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Use him, then watch him closely.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dwarf = {
      lines = { { id = "dw_default", text = "Ironforge has never minded its miners wandering, so long as they send home samples. I came for a season to look at the thorium seams and stayed when the crystals started singing, and now I'd not leave if the King himself wrote to me." } },
      choices = {
        { text = "You must miss the mountain in this heat.", next = "dwarf_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf_home = {
      lines = { { id = "dh_default", text = "Every day it's this hot, which is every day. But stone's stone wherever ye find it, and this stone's got more to say than any I've met." } },
      choices = {
        { text = "What do you think of King Magni?", next = "op_magni" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_hum = {
      lines = {
        { id = "ph_default", text = "Ye do? Then I'll ask ye what I asked Natalia: does it sound like words to you, or only like a hum? She said words, and I wish she'd said a hum." },
      },
      choices = {
        { text = "Only a hum. I'm sure of it.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Words, I think, though I can't make them out.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mining = {
      lines = { { id = "mi_default", text = "Silithid leavings, mostly, and something in it I can't name. The thorium underneath is the best I've seen, which is the desert's idea of a joke: the richest seams sit right where the bugs nest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    prism = {
      lines = { { id = "pz_default", text = "That the crystals are how something talks to the silithid, from a very long way off, and that the key to listening in isn't anything we can lay hands on yet. The one clue on the surface looks grim, and I'll say no more until I'm sure." } },
      choices = { { text = "I'll be ready when you are.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    x_mage = {
      lines = {
        { id = "xm_default", text = "Arcane, ye say? I'd taken it for the stone itself, but ye mages hear things in a rock that a geologist only feels in her back teeth. Put your hand on one, then, and tell me whether it's louder for ye than it was last week." },
      },
      choices = {
        { text = "It's louder. And it doesn't feel like anything of ours.", next = "x_mage_louder" },
        { text = "I hear nothing but stone.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_mage_louder = {
      lines = { { id = "xml_default", text = "Aye, that's what I was afraid of, and I'll thank ye not to say it so loud near the commander's tent. Write down what ye felt, every word, and leave it on my table, because two of us noticing is the start of proof." } },
      choices = {
        { text = "I'll write it all down.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else, Larksbane.", next = "BACK" },
      },
    },
    x_shaman = {
      lines = {
        { id = "xs_default", text = "I hear the stone, which isn't quite the same as hearing spirits, though I'll grant ye they might be one thing with two names. Whatever's in those crystals is making the ground restless, and if your spirits have an opinion on the humming, I'd dearly like to hear it." },
        { id = "xs_dwarf", when = { race = "Dwarf", class = "SHAMAN" }, text = "A dwarf who talks to the stone and hears it talk back! My granddad would've called that a tall tale told over ale, but here ye stand, so I'm not too proud to ask what it says." },
      },
      choices = {
        { text = "The stone is afraid. It doesn't like what the crystals carry.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "The spirits keep their counsel from outsiders.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Rocks, bugs and cultists, in about that order of how much I like them. Ask away." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, I'll even put down the hammer. What would ye know?" },
    },
    background = { { id = "tp_bg", text = "A geologist from Ironforge who goes wherever the rocks are strangest. The Circle needed someone to tell them what this desert's made of, and nobody else wanted the job." } },
    advice = { { id = "tp_ad", text = "Never sleep with your ear to the ground out here. Ye'll dream things ye don't want to have dreamed." } },
    silithid = { { id = "tp_silithid", text = "Clever, for bugs, and cleverer near the crystals. That's the part that keeps me up at night.", next = "crystals" } },
    twilights_hammer = { { id = "tp_hammer", text = "They write a lot down for people who claim to want the world to end. I'd like to read it all." } },
    ortell = { { id = "tp_ortell", text = "The deserter in the eastern hills. Bring him something to decode and he'll be your friend for life, or at least until the cult finds him." } },
    natalia = { { id = "tp_natalia", text = "She sat with me and listened to the stones, and she heard more than I did. I've wondered since whether that's what started it." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives aren't built, they're grown, and the rocks around them hum like a struck bell. I've sat beside Hive'Ashi with a listening rod for a week, and the note keeps getting lower." } },
    cthun = { { id = "tp_cthun", text = "Natalia shouted it, they tell me, a name I'd never heard and don't much like the shape of. The rocks don't say names, but they've been saying something for a long time." } },
    bronze_dragonflight = { { id = "tp_bronze_dragonflight", text = "The old stories say the bronze dragons sealed the city in the south with a scepter. I'm a geologist, so I don't believe stories, but I'd like to see the scepter." } },
    magni = { { id = "tp_magni", text = "Magni would want to know what I'm finding here, and I'd tell him if I could get a letter out of this desert. The post comes once a fortnight, if the wind riders aren't eaten." } },
    uldaman = { { id = "tp_uldaman", text = "Uldaman's stones hum too, in a different key, older and calmer. I spent a season there, and I'd give anything to have it back instead of this." } },
    _none = { { id = "tp_none", text = "If it isn't a rock, I'm the wrong dwarf to ask, and that's the long and short of it." } },
  },
}

P:NPC {
  key = "proudhorn", id = TODO_NPC("Windcaller Proudhorn"), name = "Windcaller Proudhorn",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "steady", "proud" }, values = { "dutiful", "practical" },
  notices = { "race", "class", "kit" },

  impression = {
    first = "Windcaller Proudhorn talks about the war against the silithid in terms of grain carts and worm counts. She is quite certain of victory, provided the supplies hold.",
    third = "{name} met Windcaller Proudhorn, the tauren druid who keeps Cenarion Hold supplied.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Cenarion Hold, {class}. If you've come to lend a hand, I have several needing lent, and the Earth Mother knows I can't spare a single one." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again. The caravans have been safer since your last visit, and I keep a tally, as carefully as my grandmother counted the herd." },
    { id = "g_done", when = { questDone = TODO_QUEST("Stepping Up Security") }, text = "The worms have learned to keep their distance from the road, {name}, and I know whom to thank." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Earth Mother keep you, child of the plains. This sand is hard on hooves, but it remembers being grassland, if you listen closely." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Circle. You'll want to report to the Commander, but you'll want to eat first, and that, I can arrange." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour's half in pieces. Vargus at the forge can see to that, and you'll see to it before you go back out." },
  },

  start = "hello",
  nodes = {
    op_circle = {
      lines = {
        { id = "opc_q", text = "Alliance and Horde both supply this fort, and both grumble that the Circle asks too much of them. You've carried our crates, so tell me: what do you think of the Cenarion Circle?" },
      },
      choices = {
        { text = "The Circle stands above the war. That makes it worth supporting.", next = "op_circle_r1", fx = { affinity = 2, align = { honor = 1 }, opinion = { cenarion_circle = "admire" } } },
        { text = "It talks about balance and asks everyone else to bleed for it.", next = "op_circle_r2", fx = { affinity = -1, align = { honor = -1 }, opinion = { cenarion_circle = "distrust" } } },
        { text = "It's useful, as long as both sides keep showing up.", next = "op_circle_r3", fx = { trait = { practical = 1 }, opinion = { cenarion_circle = "useful" } } },
        { text = "I'm a druid, Windcaller. The Circle is my home.", next = "op_circle_r4", fx = { affinity = 2, opinion = { cenarion_circle = "loyal" } }, when = { class = "DRUID" } },
        { text = "I'll carry crates and leave the opinions to you.", next = "BACK" },
      },
    },
    op_circle_r1 = {
      lines = {
        { id = "op_circle_r1", text = "That's the spirit the supply lines run on. I'll note you down as a reliable carter, which from me is high praise." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_circle_r2 = {
      lines = {
        { id = "op_circle_r2", text = "Everyone bleeds out here, druid and soldier alike, and the silithid don't keep a ledger of whose blood it was. I'll still take your crates." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_circle_r3 = {
      lines = {
        { id = "op_circle_r3", text = "Useful is exactly the word I'd use in my reports, and the only one the Commander reads closely." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_circle_r4 = {
      lines = {
        { id = "op_circle_r4", text = "Then you'll understand why I count grain carts as carefully as any worm. The Circle is only as strong as its supply." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They tear at the air like a beast at a snare, and my caravans suffer for it. Tauren or dwarf, a shaman who can calm the winds is worth more to me than a dozen guards." } },
      choices = {
        { text = "I'll calm what I can, Windcaller.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Calming is too slow. Strike at the cult that stirs them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Supply, mostly, which is where wars are won. The cult raids our carts on the road from Un'Goro, and I would like to know which of their camps has been sending the raiders, before I lose another load of grain to people who want the world to end." } },
      choices = {
        { text = "I'll find their camp and report it to the Hold.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leave it to me. They won't raid anything again.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Patience, chiefly, assuming you can stand in the heat and watch an empty road for hours without wandering off after a scorpid. The worms take a cart from beneath, so a guard who keeps his eyes on the sand is worth ten who charge the dunes." } },
      choices = {
        { text = "Holding the road matters more than chasing glory.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Better to kill the worms in their nests than wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Grain comes in by caravan, and every wagon must be guarded across the open sand, where the silithid like to rise up beneath the wheels. A healer on the supply road is worth a dozen carts, because a driver who lives keeps driving." } },
      choices = {
        { text = "I'll ride with the next caravan, Windcaller.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Caravans make easy targets. Let soldiers forage for themselves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They've soured them; there's no better word. Storms rise out of nowhere near the Twilight camps and scatter my supply carts across the dunes, and a windcaller who can't call the wind is, I'm sorry to say, a quartermaster." } },
      choices = {
        { text = "Then the summoners must be stopped before the next cart.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The winds will settle on their own. Send more carts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They come up beneath the carts, assuming the sand is soft enough, and take wagon and driver both. A mage who can strike them from a distance keeps the carts rolling, and while the carts roll, the Hold stands." } },
      choices = {
        { text = "I'll protect your carts. Supplies win wars.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the drivers fend for themselves.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll keep an eye on the worms.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I would trust a warlock who has proven reliable, assuming the proof is in the counting. Every crate that reaches the Hold is a victory, and I do not much care whose demon defended it, provided it doesn't eat the grain." } },
      choices = {
        { text = "I'll prove myself reliable, crate by crate.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll guard what I like, when I like.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll keep my demon out of the grain.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Provided the supply carts keep reaching us, the healers keep the wounded on their feet and the hives don't learn to dig faster than we do, then yes, I'm quite certain of it. It is a great many provisos, I'll admit, but a war is mostly provisos." } },
      choices = {
        { text = "Careful planning wins wars. Your provisos are the right ones.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wars are won by nerve, Windcaller, not by ledgers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Often enough that I count the drivers as carefully as the sacks, because the silithid hear the wheels through the sand and come up beneath them. A paladin riding beside the carts would steady the drivers, provided the paladin doesn't mind the dust." } },
      choices = {
        { text = "Guarding the carts is honest work, and I'd be glad of it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather take the fight to the hives than guard grain.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = { "Hive'Ashi", "Hive'Zora", "Hive'Regal" }, min = 50 } },
          text = "My scouts report the hives are quieter on the near side, and the worm counts have dropped for the first time this season. That is your doing, I think, and it means the grain carts get through." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue at Cenarion Hold. The swarm cannot be outwitted the way men can, but the Twilight's Hammer can, and the Hold has use for anyone who keeps their footsteps light." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman of the Horde! The Hold is glad of you, and so am I, because the winds have been foul since the cult began its summonings, and every caravan I send needs fair weather." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, provided you can keep the sand out of your robes, will be a great help to the supply lines. Fire is very effective against the larger worms." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, here at the Hold. Provided your demons fight the silithid and not the supply carts, I see no reason we cannot work together." },
        { id = "h_default", key = true,
          text = "From this fort we strike at the silithid where they're strongest, and while we hold it, I'm convinced we cannot lose. Provided, of course, the supplies keep coming, which is where I come in; a herd that eats well walks far." },
        { id = "h_lines", tags = { "news" }, when = { questActive = TODO_QUEST("Securing the Supply Lines") },
          text = "The dredge strikers lie under the sand along the northern road and burst out under the carts. Thin them out, {name}, before I lose another wagon of grain." },
        { id = "h_security", tags = { "news" }, when = { questActive = TODO_QUEST("Stepping Up Security") },
          text = "With the strikers gone, the crushers from the south are moving into their old hunting grounds. Bigger worms, same road, and the same carts I can't spare." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde! The Hold needs every healer it can get, and I would rather spend my grain carts feeding soldiers than burying them." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Alliance, and very welcome, because the Hold goes through bandages faster than grain, and nobody has yet found a way to grow linen in sand." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I should like to put you down as a guard for the supply carts, provided you'll forgive me for writing your name in the same column as the grain." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Good; provided you can hold a cart road as well as you hold that blade, I have more work than I have soldiers." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman from Ironforge! The Hold is glad of you, and so am I, because the winds have been foul since the cult began its summonings." },
      },
      again = {
        { id = "h_again", text = "What else? I have ledgers, but I have ears too, and tauren ears are larger than most." },
        { id = "h_again2", text = "Ask, then. A well-informed soldier eats less of my bread worrying." },
      },
      choices = {
        { text = "What have the cult's summonings done to the winds?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Why are supplies so important here?", next = "supply" },
        { text = "You're certain we'll win?", next = "victory" },
        { text = "The Circle's emissary sent me to you.", next = "emissary", when = { questDone = TODO_QUEST("Taking Back Silithus") } },
        { text = "This desert must be hard on a child of the plains.", next = "tauren", when = { race = "Tauren" } },
        { text = "I've never quite known what a windcaller does.", next = "druid", when = { class = "DRUID" } },
        { text = "I could scout the supply roads for you.", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "Why are the worms such a threat to the supplies?", next = "xmage", when = { class = "MAGE" } },
        { text = "Few would trust a warlock to guard their supplies.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Can the Hold really win against the silithid, Windcaller?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How do you keep the soldiers fed and whole, Windcaller?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Your supply carts must come under attack often.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does holding the supply roads actually require, Windcaller?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What use does the Hold have for a quiet one, Windcaller?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What have the cult's summonings done to the winds?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll keep an eye on the roads.", next = "END", fx = { standing = { cenarion_hold = 1 } } },
      },
    },

    supply = {
      lines = { { id = "s_default", text = "Because nothing grows here that we can eat, and nothing flows here that we can drink but the oasis. Every arrow, every bandage and every sack of morrowgrain comes up the road from Un'Goro, and the desert wants all of it." } },
      choices = {
        { text = "I'd guess the silithid threaten the caravans most.", next = "supply_worms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply_worms = {
      lines = { { id = "sw_default", text = "Not the silithid, if you can believe it, but the worms. They hear the wheels through the sand and come up underneath, and a whole shipment of morrowgrain went down one morning before the drivers could shout." } },
      choices = {
        { text = "Morrowgrain?", next = "supply_grain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply_grain = {
      lines = { { id = "sg_default", text = "Grain the Circle coaxes up in a single night with a little magic and a lot of patience. It's not the tastiest thing you'll eat, but a soldier can march all day on it, and it doesn't go green in the packs, which is more than I can say for the bread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    victory = {
      lines = { { id = "v_default", text = "Certain, provided we hold this fort, provided the supplies keep coming, and provided Alliance and Horde remember who the enemy is. That's a great many provideds, I'll grant you, but I've seen worse odds turn." } },
      choices = {
        { text = "What do the factions think of the Circle?", next = "op_circle" },
        { text = "Then I'll keep the road open for you.", next = "BACK", fx = { affinity = 1, align = { order = 1 }, standing = { cenarion_hold = 1 } } },
        { text = "Wars aren't won from ledgers, Windcaller.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    emissary = {
      lines = {
        { id = "em_default", text = "Good. The Circle sent emissaries to Ironforge and Orgrimmar both, asking for anyone who could stand the heat, and you're what the asking brought me." },
        { id = "em_alliance", when = { faction = "Alliance" },
          text = "Jademoon found you in Ironforge, then. I'm glad the dwarves let her speak; Ironforge is a busy place, and Silithus is a long way from its forges." },
        { id = "em_horde", when = { faction = "Horde" },
          text = "Blackhoof found you in Orgrimmar, then. The Warchief's city has never lacked for fighters, and I'm glad he spared us a few." },
      },
      choices = { { text = "I'm glad to be here.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "It is, and it isn't. The Earth Mother is here too, under all this sand, though she's hurt and she's tired, and I think she's glad of us." } },
      choices = { { text = "Then we'll help her heal.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "We call the winds, mostly, and read what they carry: rain coming, sand rising, bugs moving where they shouldn't. Out here it's half druidry and half keeping the weather off the grain." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_hunter = {
      lines = {
        { id = "xh_default", text = "Provided you watch the ground as closely as the horizon, I accept gladly. The dredge strikers come up beneath a caravan rather than at it, and a hunter's eyes are little use if the attack arrives from below." },
      },
      choices = {
        { text = "Then I'll track them back to their burrows.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 }, standing = { cenarion_hold = 1 } } },
        { text = "Your caravans need guards, not scouts.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what comes up the road and what doesn't make it. Pick something." } },
    background = { { id = "tp_bg", text = "A windcaller of the Circle, sent here because someone has to count the grain, and I count better than most. My mother said the winds taught me patience and the Earth Mother taught me arithmetic." } },
    advice = { { id = "tp_ad", text = "Carry twice the water you think you'll need, then carry a little more. The sand is no gentle plain, and the Earth Mother's rain rarely finds it." } },
    cenarion_circle = { { id = "tp_circle", text = "Tauren and night elves, druids all, and more of us in this fort than anywhere outside Moonglade. We argue about everything but the bugs." } },
    silithid = { { id = "tp_silithid", text = "Dangerous, but at least they're predictable, which is more than I can say for the worms." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "Every hive costs us a cart of oil, a dozen torches and two healers for a week. I keep the numbers, and the numbers say we can keep it up, as long as the supplies hold." } },
    cairne = { { id = "tp_cairne", text = "Cairne sent tauren to Silithus because the Circle asked, and because he knows that a swarm doesn't stop at a border. He is wiser than most kings." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother is sick here, I think, poisoned by something deep under the sand. We'll heal her one dune at a time." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream is the world as it should be, and Silithus looks nothing like it. That's why we're here." } },
    _none = { { id = "tp_none", text = "That's not on any manifest of mine. Ask the Commander, and walk with the Earth Mother while you do." } },
  },
}

P:NPC {
  key = "vish_kozus", id = TODO_NPC("Vish Kozus"), name = "Vish Kozus", title = "Captain of the Guard",
  bible = "bibles/silithus.md", role = "soldier", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "sharp", "gruff" }, values = { "loyal", "stern" },
  notices = { "class", "status" },

  impression = {
    first = "Captain Vish Kozus watches the Hold from the top of the tower with a blindfold over his eyes, and somehow missed nothing about me. He was rude, which Mar'alith told me means he likes me.",
    third = "{name} met Vish Kozus, the blindfolded Captain of the Guard at Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "You climbed all these stairs to talk to me? Then talk, and I'll listen, as my people have listened through ten thousand years of night." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good; the last one who climbed up here wanted directions to the privy." },
    { id = "g_deathclasp", when = { questDone = TODO_QUEST("Wanted - Deathclasp, Terror of the Sands") }, text = "The southern patrols came back whole this week. I counted twice." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and your footsteps on these stairs haven't changed a bit. Come up and talk, then." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You climb those stairs heavier than you used to, and I don't mean you've been eating Calandrath's cakes, because you've grown stronger and I can hear it in every step." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear somebody down in the Hold caught you lying, and I hear everything from up here sooner or later. Don't try it on a blind man, because we listen too closely." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "Word climbed the tower that you frightened one of the Hold's people, and fear has a sound I know well, so save yours for the bugs." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk like someone who's used to not being heard. Up here, everyone is heard; remember that." },
    { id = "n_horde", cat = "status", when = { faction = "Horde" },
      text = "Horde. Fine, so long as you leave your quarrels with the Alliance at the gate. My infantry aren't fond of paperwork." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance. Fine, so long as you leave your quarrels with the Horde at the gate. My infantry aren't fond of paperwork." },
  },

  start = "hello",
  nodes = {
    xpt_vish_kozus = {
      big = true,
      lines = { { id = "xpt_vish_kozus_default", text = "I don't see, I listen, and listening has kept me alive longer than my eyes ever did. The silithid tunnel under the sand before they strike, and a healer who stands too near the edge of a fight hears them a moment too late." } },
      choices = {
        { text = "We guard our healer first, Captain. That's only sense.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Our healer can look after themself. We all carry our weight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It's big, it's old, and it's killed every fool who went after it thinking a scorpid is just a scorpid. Bring me a pincer and I'll believe you killed it, and bring me a story and I'll believe you ran." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And don't send {pet} in first, unless you want it back in two pieces, because Deathclasp doesn't care who's holding the leash." },
      },
      choices = {
        { text = "I'll face it myself. That's the only honest kill.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Traps and poison work. I'll take it any way I can.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Fewer prayers and more bandaging, mostly, because my guards come back from Hive'Ashi with holes in places nobody should have holes. If you can keep a sentry on his feet through the night, you'll have earned your place on the wall." } },
      choices = {
        { text = "Then I'll stand the night watch with your sentries, Captain.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm nobody's bandage, Captain. I'll fight as I see fit.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every night, up through the floor of this tower and into my teeth. The bugs dig deeper every season, and I don't need eyes to know the ground under the Hold isn't as solid as the Commander likes to think." } },
      choices = {
        { text = "Then the Hold must be ready to fight from below.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ground that hollow can't be held. Be ready to leave it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I don't need to tell you, and I won't. What I will tell you is that I saw you coming from the road, and I can see the scorch marks on your sleeve, so don't waste your time wondering." } },
      choices = {
        { text = "Your secret's yours. I respect that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll figure it out sooner or later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Understood, Captain.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I trust the Commander, and I trust my guards to follow orders, and that is the list. Everyone else, including you, I watch, because the Twilight's Hammer has eyes in places you wouldn't think." } },
      choices = {
        { text = "Good. Watching everyone keeps the Hold safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your suspicion will drive away allies.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Watch all you like.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They hold, because I make them, but the hives breed faster than we can burn their dead, and a guard who's been stung three times starts seeing bugs in every shadow. A word from a priest wouldn't hurt, though don't tell them I sent you." } },
      choices = {
        { text = "I'll speak with them. Fear eases when it's shared.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pride keeps them standing. I'd leave them their pride.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Badly, though he'd have my rank for saying so, because Mar'alith was never a man to sit still, and now he sits and stares south. Natalia went out on a dig in the southern desert and never came back, and I've watched the horizon for her every day since." } },
      choices = {
        { text = "Then tell him plainly. A captain owes his commander the truth.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then keep quiet. A grieving man needs his hope more than truth.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Circle's druids would tell you the land guards itself, and I'd tell them the land didn't stop the bugs from taking Southwind Village. I keep soldiers on the walls and druids in the tents, and between the two we've lost nobody this month." } },
      choices = {
        { text = "Swords keep people alive. Trust your guards first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Trust the land. Walls only slow the swarm down.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_vish_kozus", tags = { "news" }, when = { party = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" } } },
          text = "You've brought a healer. I can hear it in how the rest of you walk, like people who expect to be patched up, so keep {companion} in the middle where the bugs can't reach." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? I can hear your totems knocking together from up here, so don't bother sneaking. If the elements have anything useful to say about the hives, I'm listening; if not, the poster's by the door." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Don't bother casting anything to see behind the blindfold; better minds than yours have tried, and none of them got an answer." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Warlock. I can feel that thing at your heel from up here, so keep it close and keep it quiet, or my guards will put it down." },
        { id = "h_default", key = true,
          text = "Vish Kozus, Captain of the Guard. The Commander hasn't been himself since his wife vanished on a dig in the southern desert, without a trace, so I watch twice as hard. If you're looking for work, there's a poster by the door; do I need to draw you a picture?" },
        { id = "h_deathclasp", tags = { "news" }, when = { questActive = TODO_QUEST("Wanted - Deathclasp, Terror of the Sands") },
          text = "Deathclasp's gone to ground in the southern mountains, behind the dwarves' camp. Bring me her pincer, and only her pincer; I've been offered a lot of stories in my time, and not one of them had claws." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. I heard your robes before I heard your feet, and I'd guess Forsaken or troll from the way you walk, though I'm far too polite to say which." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. The barracks could use you more than the inn could, because half my guards come off the walls with stings they're too proud to mention." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. I can hear the plate from here, so don't bother creeping, and don't bother telling me how bright your Light is either, because I wouldn't see it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Fine, you can make yourself useful, because Deathclasp is still out there and nobody's brought me a pincer yet." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Good; the Commander trusts your kind more than he trusts swords, and lately he trusts very little at all." },
      },
      again = {
        { id = "h_again", text = "Anything else? The view won't watch itself, and I've been watching it longer than your grandfather's grandfather lived." },
        { id = "h_again2", text = "Go on, and be quick about it." },
      },
      choices = {
        { text = "Should druids guard this hold instead of soldiers?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The hives make the earth itself tremble. Have you felt it?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Something seems wrong with the Commander.", next = "cmd" },
        { text = "Tell me about this Deathclasp.", next = "deathclasp" },
        { text = "Keeping the peace here can't be easy.", next = "guard" },
        { text = "You can't see much through that blindfold.", next = "blindfold" },
        { text = "I move quietly. Does that worry you?", next = "rogue", when = { class = "ROGUE" } },
        { text = "You could use another blade on the walls, Captain.", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "How do you see with that blindfold on?", next = "xmage", when = { class = "MAGE" } },
        { text = "You don't seem to trust anyone at the Hold.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Are your guards holding up against the silithid?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does the Hold's guard need from a priest, Captain?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "How does the Commander fare since his wife vanished?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What makes Deathclasp so hard to bring down, Captain?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "How can you see anything with that blindfold, Captain?", next = "xpt_vish_kozus", when = { party = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" } } } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },

    cmd = {
      lines = { { id = "c_default", fx = { learn = { "natalia" } }, text = "His wife, Natalia, went south with the dwarves and didn't come back the same, and then didn't come back at all. He still gives good orders, but he forgets to eat, and a commander who forgets to eat forgets other things." } },
      choices = {
        { text = "You're worried for him.", next = "cmd_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cmd_worry = {
      lines = { { id = "cw_default", text = "I'm the Captain of his guard; worry is the job. The rest is none of your business, and mostly none of mine." } },
      choices = {
        { text = "What are you really guarding him from, Captain?", tag = "Persuade", next = "vish_cmd",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Into The Maw of Madness") }, { class = "ROGUE" } } } },
          fail = { next = "vish_curt", fx = { affinity = -1 } } },
        { text = "Aye, Captain. I'll mind it.", next = "BACK" },
      },
    },
    vish_cmd = {
      big = true,
      lines = { { id = "vc_default", text = "From her, if you must know, or from whatever has her now. A man who's lost his wife to madness can be reached through her, so I've doubled his guard without telling him, and if anything with her face comes to the gate, my people know what to do." } },
      choices = {
        { text = "That's a hard thing to have planned.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Good. Someone has to think of it.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    vish_curt = {
      lines = { { id = "vu_default", text = "From questions, mostly, so off you go." } },
      choices = { { text = "As you say.", next = "BACK" } },
    },

    deathclasp = {
      lines = { { id = "d_default", text = "A scorpid the size of a house who used to hunt the open sand. The hives pushed her back into the southern mountains, and now she sits across the one path that would let our patrols go round the hives instead of through them." } },
      choices = {
        { text = "And if she's gone?", next = "deathclasp_route" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deathclasp_route = {
      lines = {
        { id = "dr_default", text = "Then the southern range is ours, and my outriders can reach the dwarves' camp without riding past Hive'Regal's front door. I'd like that very much." },
        { id = "dr_done", when = { questDone = TODO_QUEST("Wanted - Deathclasp, Terror of the Sands") },
          text = "And she is gone, so the outriders take the mountain path now. It's slower, and nobody's been eaten, which I'll take every time." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guard = {
      lines = { { id = "g_default2", text = "With the infantry, and with a short temper. Anyone who spills blood inside these walls finds out what a night elf sentinel can do with a blade when she's been told to stop a fight quickly." } },
      choices = {
        { text = "Neutral ground should stay neutral.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some fights are worth starting anywhere.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blindfold = {
      lines = { { id = "b_default", text = "Well enough to see you coming up the stairs, and well enough to see you staring now. Ask me about something else." } },
      choices = { { text = "Something else, then.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    rogue = {
      lines = { { id = "r_default", text = "Not in the least. The quiet ones I can hear perfectly well; it's the loud ones who hide things, because nobody listens to them closely." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "Need? I count the patrols that come back, not the ones that go out, so yes, I need. Stand a night on the tower if you like, and keep your sword sheathed in my courtyard, whatever colors walk past you." },
      },
      choices = {
        { text = "Horde or Alliance, I'll keep the peace here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If someone draws on me, I won't wait for your leave.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know who comes and goes, and what they say when they think the tower's empty. Ask." } },
    background = { { id = "tp_bg", text = "I'm the Captain of the Guard, and I've served the kaldorei long enough to lose my eyes to it. That's all the story you need." } },
    advice = { { id = "tp_ad", text = "Bring proof. Everyone at this fort has heard enough stories to last a thousand years." } },
    natalia = { { id = "tp_natalia", text = "The Commander's wife. Don't bring her up with him unless you've news.", next = "cmd" } },
    silithid = { { id = "tp_silithid", text = "They don't sleep, they don't retreat, and they don't stop. Neither do we." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives grow while you sleep, and I don't sleep much, so I've watched them grow. Hive'Regal's taller this month than last, and nobody wants to hear it." } },
    ortell = { { id = "tp_ortell", text = "There's a deserter hiding in the hills to the east, a cultist who got cold feet. He thinks nobody knows where he is, and everybody knows where he is." } },
    thrall = { { id = "tp_thrall", text = "The orc chief's warriors are good fighters and bad at keeping quiet on watch. I can hear them from up here, and so can the bugs." } },
    ahn_qiraj = { { id = "tp_ahn_qiraj", text = "The old city in the south is behind a wall nobody can cross, and something behind it wants out. I don't need eyes to know that." } },
    _none = { { id = "tp_none", text = "Not my business. Find someone whose business it is, and Elune guide your feet on the stairs." } },
  },
}

P:NPC {
  key = "calandrath", id = TODO_NPC("Calandrath"), name = "Calandrath", title = "Innkeeper",
  bible = "bibles/silithus.md", role = "innkeeper", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "warm", "gentle" }, values = { "kind", "generous" },
  notices = { "kit", "craft", "race" },

  impression = {
    first = "Calandrath keeps the Oasis Inn and fussed over the sand in my hair before I'd said a word. She misses the birds of Auberdine and is trying to learn to cook worms.",
    third = "{name} rested at the Oasis Inn, where Calandrath of Auberdine keeps the only soft beds in Silithus.",
  },

  greetings = {
    { id = "o_fan_distrust", when = { gossip = { topic = "fandral", stance = "distrust" } }, text = "The Commander mentioned you've no great love for the Arch Druid. Hush now, the sand has ears in a place like this, and some of them are Darnassian." },
    { id = "g_default", text = "Oh, look at you, sand from head to foot! Ishnu-alah, dear, and come in out of the sun." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to the oasis, dear. Your usual corner's free." },
    { id = "g_dumplings", when = { questDone = TODO_QUEST("Kitchen Assistance") }, text = "The dumplings are a hit, you know. I haven't told anyone where the recipe came from." },
    { id = "g_away", when = { away = 14 }, text = "Oh, you've been gone {away}, dear, and you've brought half the desert back in your hair again! Come in out of the sun, and I'll find you a bowl of something." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone came in today all smiles and said it was something you'd told them, and smiles are rarer than shade in Silithus. Thank you, dear." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The whole Hold's been talking about how you helped, and I've heard it over every bowl of worm stew I served today. Sit down and have a bowl yourself, dear." },
  },

  notice = {
    { id = "n_sand", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You poor thing, your gear's been chewed half to pieces. Sit down; you'll mend better on a full stomach." },
    { id = "n_leather", cat = "craft", when = { profession = { "Leatherworking" } },
      text = "You're a leatherworker, aren't you? I'd know that smell of cured hide anywhere; my father's workshop smelled of nothing else." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "Another of our people! Tell me you've come from Darkshore, and tell me the birds are still singing over Auberdine." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The last imp that came through ate a whole tray of honey cakes and then set fire to the tray. I don't hold it against its master, not too much, but the birds of Auberdine never did that to me, and I miss them dreadfully." } },
      choices = {
        { text = "I'll keep it outside. Your kitchen deserves some peace.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My imp has a mind of its own. I can't promise anything.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A few, on their way to fight the bugs, and they all sit very straight and say their prayers over my worm stew, which I suppose is fair. I'm still learning to cook with what Silithus gives us, and a blessing can't hurt, though I'd rather you just told me it tasted good." } },
      choices = {
        { text = "It tastes good, Calandrath, and I mean that kindly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd sooner pray over it, myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every day, and the warriors are the worst, because they'll fight a silithid all afternoon and then walk in without a word about the stinger still in their leg. I've learned to feed them first and ask questions after, the way we did for the sailors back in Auberdine." } },
      choices = {
        { text = "Rest and care keep a soldier alive. You do good work.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A real warrior doesn't need fussing over.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Sandworm, mostly, which is bitter however long I stew it, though I'm told the cult cooks it well enough, which I find very irritating. A hunter brought me a scorpid tail once, and I'm still not sure whether he meant it as a gift or a dare." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} looks thirsty, you poor thing, so let it rest in the shade by the door while you're here, and don't let it near the worm stew." },
      },
      choices = {
        { text = "A hunter should feed the Hold before himself.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I hunt for my own pot first. Others can manage.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Some of them do, dear, because they come back from the Twilight camps with nightmares that a bowl of worm stew won't touch. I'm only an innkeeper, so I give them a blanket and a lamp, but a priest might give them something more." } },
      choices = {
        { text = "I'll sit with them tonight, and keep the lamp lit.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Nightmares harden a soldier. Let them face their own.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Barely, and only because the druids tend it. The sand creeps in a little every week and the silithid dig underneath, so there are mornings the water tastes of the hive, and I boil it twice before I let anyone drink." } },
      choices = {
        { text = "Water like this is precious. Guard it closely.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If the desert wants the oasis, it'll take it. Water moves on.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A few, and they always pick the bed nearest the window and leave before dawn. I don't ask what they're doing, but I leave a little bread by the door, because nobody should go into that desert hungry." } },
      choices = {
        { text = "That's kind of you. Everyone needs a little care.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Kindness is wasted on rogues.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll take the window bed.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Worm stew, if you can believe it, because the cult's cooks seem to manage it and I'm too proud to be outdone. It's nothing like Auberdine's fish, but a cook works with what the desert gives." } },
      choices = {
        { text = "Making do is a virtue. I admire that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather go hungry than eat worm.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll try a bowl.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every day, and the gulls most of all, which nobody believes when I tell them. Here there's only the wind and the hives, and I pray each night that the Circle wins this war quickly, so I can go home before I forget what the sea sounds like." } },
      choices = {
        { text = "Then I'll pray with you. Home is worth waiting for.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't end this war, Calandrath. Swords will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The oasis gives it, and I take only what the guests drink, which is a habit I learned in Ashenvale long before I ever saw sand. The druids say this spring once fed a great forest, and some nights I almost believe I can smell it." } },
      choices = {
        { text = "Take only what you need. The oasis will repay you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Hold needs water more than the oasis does. Take it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Oh, you look just like a {altrace} who stayed here not long ago, dear, {alt}, from the other side of all this fighting. I gave {alt} the bed by the window and a bowl of soup, and I'd like to see you rest just as well, whatever banner you carry." },
        { id = "h_alt_kin", when = { alt = { kin = true } },
          text = "One of your people stayed with me a little while ago, dear, a {altclass} named {alt}, who ate everything I put out and still asked for more. If that's the family appetite, I'd better put another pot on." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, at the Oasis Inn. Sit wherever you like, dear, only keep your little friend away from the kitchen, because I've only just got the worms to stay in the pot." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, at the Oasis Inn! Take off that plate a while, dear, because the sand gets underneath it, and I've seen grown knights cry over what it does to their knees." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at the Oasis Inn? You're welcome, of course, and if you can ask the water here to stay sweet a while longer, I'll be grateful to you and to it." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Oh, you poor thing, you've been crouching in the sand all day, haven't you? Sit down, sit, and let me shake some of that grit out of your cloak." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Can you conjure water? I've got the oasis, of course, but it's warm and brackish, and I'd love a bucket of something cold for my soup." },
        { id = "h_default", key = true,
          text = "Welcome to the Oasis Inn, the only place in Silithus with soft beds and clean water, and the nearest thing to a moonwell this side of Feralas. Rest here as long as you like; the desert will still be there when you're ready, more's the pity." },
        { id = "h_recipe", tags = { "news" }, when = { questActive = TODO_QUEST("Desert Recipe") },
          text = "If you go by the cult's camp to the west, keep an eye out for anything they cook from. Sandworm's so bitter I can't get it past my own lips, and they eat it every day." },
        { id = "h_kitchen", tags = { "news" }, when = { questActive = TODO_QUEST("Kitchen Assistance") },
          text = "Smoked desert dumplings, from a cultist's cookbook! I'll never live it down if anyone finds out, so help me make a batch quickly, before I lose my nerve." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, at the Oasis Inn! Sit, dear, and rest your feet, whether you pray to the Light or the loa or something I'd rather not ask about." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Sit down and let me shake the sand from your robes, because I've seen Elune's priestesses come in tidier after a sandstorm, and you've clearly been through two." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "Oh, you poor thing, look at your armor, there's more sand in those joints than in the whole of Tanaris. Sit down before you creak yourself to pieces." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, oh, and your poor beast is covered in sand too! In Auberdine the worst it would have brought home was a little sea salt." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid at my hearth! The Circle keeps its own tents out by the Hold, but your kind always seem to end up here when the sand gets into their fur." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? I've a pot on, but it'll keep, and so will I; my people are good at waiting." },
        { id = "h_again2", text = "Go on. It's nice to talk to someone who isn't counting arrows." },
      },
      choices = {
        { text = "How do you keep the water clean in Silithus?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does the oasis water hold out against all this sand?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You're a long way from home.", next = "auberdine" },
        { text = "There can't be much to eat out here.", next = "food" },
        { text = "Your father was a leatherworker?", next = "southwind", when = { profession = { "Leatherworking" } } },
        { text = "I've come from Darkshore, as it happens.", next = "darkshore", when = { race = "NightElf" } },
        { text = "Keeping everyone fed out here must be hard work.", next = "inn" },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Have you heard of my people, the shen'dorei?", next = "x_skyborne", when = { race = "Skyborne" } },
        { text = "Do many rogues stay at the Oasis Inn?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Whatever you're cooking smells strange.", next = "xmage", when = { class = "MAGE" } },
        { text = "You must miss Auberdine, Calandrath.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the guests at the Oasis need more than a bed, Calandrath?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do many soldiers come back from the hives in a bad way?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What have hunters brought you to cook out here, Calandrath?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do many paladins come through the Oasis Inn, Calandrath?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would my demon really cause trouble in your kitchen?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Thank you, Calandrath.", next = "END", fx = { affinity = 1 } },
      },
    },

    auberdine = {
      lines = { { id = "a_default", text = "Auberdine, on the Darkshore coast, where the trees come down to the water and the birds wake you every morning. Here the only things that wake you are the bugs, and they don't sing." } },
      choices = {
        { text = "Why did you come here?", next = "auberdine_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    auberdine_why = {
      lines = { { id = "aw_default", text = "Because the Circle asked who'd keep an inn in a desert, and nobody else put their hand up. Soldiers fight better with a bed and a meal behind them, and I can't hold a bow to save my life." } },
      choices = { { text = "Takes nerve to admit that.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    food = {
      lines = { { id = "f_default", text = "Precious little that grows, so it all comes up the road from Un'Goro, and what doesn't come up the road I've been trying to learn. There aren't many desert herbs, and the sandworms taste the way old boots smell." } },
      choices = {
        { text = "The cult seems to manage.", next = "food_cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    food_cult = {
      lines = {
        { id = "fc_default", text = "That's what puzzles me! I've seen them hunting worms from the camp out west, and they don't look like they're starving. There must be a trick to it." },
        { id = "fc_done", when = { questDone = TODO_QUEST("Kitchen Assistance") },
          text = "And there was a trick to it, and it's delicious, and I'm not sure how I feel about that. Whatever else they are, someone in that cult knows his way around a smokehouse." },
      },
      choices = {
        { text = "A good recipe is a good recipe.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'd not eat anything those people made.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    southwind = {
      lines = { { id = "s_default", fx = { learn = { "southwind" } },
        text = "He was, and he used to tell stories about a famous artisan who lived in Southwind Village, centuries ago. It's in ruins now, out past Valor's Rest, and nobody goes there but the bugs and, they say, the dead." } },
      choices = {
        { text = "The dead?", next = "southwind_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    southwind_dead = {
      lines = { { id = "sd_default", text = "So the scouts say. One of them swears there's a lady upstairs in the old houses who'll teach a leatherworker her craft if she likes the look of them. I'd go and see, if I didn't have a kitchen to run, and if I weren't a coward." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    darkshore = {
      lines = { { id = "dk_default", text = "Oh, tell me everything! No, don't; I'll only cry into the soup. Just tell me the moonwells still shine, and I'll be happy for a week." } },
      choices = {
        { text = "They still shine, Calandrath.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Darkshore has its own troubles now.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    inn = {
      lines = { { id = "i_default", text = "With a ledger, a good memory and Windcaller Proudhorn's grain carts. When a caravan's late, I water the soup and say nothing, and when it's very late, I say a prayer to Elune and water it some more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_skyborne = {
      lines = {
        { id = "xs_default", text = "I've heard the name on travellers' lips, and now here you sit in my inn, looking like a cousin I never knew I had. You poor thing, this desert must feel terribly low to the ground after wherever you've been." },
      },
      choices = {
        { text = "It does. The air here is heavy.", next = "BACK", fx = { affinity = 1 } },
        { text = "Our peoples were one, once, long ago.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Everyone eats here sooner or later, and everyone talks while they eat. Ask me something." } },
    background = { { id = "tp_bg", text = "A girl from Auberdine who grew up in a leatherworker's shop and now runs an inn in a desert, a long way from the moonlit shore. Life's strange, even when you've lived a few centuries of it." } },
    advice = { { id = "tp_ad", text = "Shake your boots out every morning, dear. Every single morning." } },
    southwind = { { id = "tp_southwind", text = "An old village of ours, out past Valor's Rest. Ruins now, and sad ones.", next = "southwind" } },
    twilights_hammer = { { id = "tp_hammer", text = "Dreadful people, by all accounts. Good cooks, though; don't tell anyone I said so." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hunters bring silithid meat back from the hives, and I'm trying to learn to cook it, and it's going very poorly. It tastes like a boot that's been in a pond." } },
    teldrassil = { { id = "tp_teldrassil", text = "I miss Teldrassil and the birds in the high branches, and the sound of rain on leaves. Here it's all sand and clicking." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I hear there's a faire that travels about with fortune-tellers and strange foods. If it ever comes to Silithus, I'll be the first in line, just to eat something that isn't a worm." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "The goblins from Gadgetzan come through with spices and charge me for the sand in the jar. I pay it, because the spices hide the taste of everything else." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. Ask the Commander, or ask the guards; they hear more than I do, Elune bless them." } },
  },
}

P:NPC {
  key = "beetix", id = TODO_NPC("Beetix Ficklespragg"), name = "Beetix Ficklespragg",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "sharp", "warm" }, values = { "loyal", "practical" },
  notices = { "craft", "status" },

  impression = {
    first = "Beetix Ficklespragg is a goblin alchemist nursing her cousin Noggle through a scorpid's venom. She prices everything and fusses over him like a mother hen, both at once.",
    third = "{name} met Beetix Ficklespragg, a goblin alchemist at Cenarion Hold whose cousin Noggle came back poisoned from the desert.",
  },

  greetings = {
    { id = "g_default", text = "Beetix Ficklespragg, at your service, pal, and if you've got a strong stomach, I've got work that pays. It's mostly venom sacs, so don't wear your good gloves, because I don't cover laundry." },
    { id = "g_back", when = { metBefore = true }, text = "Hey, it's you, pal! Noggle's still breathing, so you're still my favourite customer." },
    { id = "g_saved", when = { questDone = TODO_QUEST("Noggle's Last Hope") }, text = "Look at him, sleeping like a baby, pal. A baby who owes me a fortune in antidotes, but still." },
    { id = "g_away", when = { away = 14 }, text = "Hey, you're back after {away}! Noggle's still breathing, I'm still brewing, and my prices have only gone up a little, pal, so welcome home." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word around the Hold is you spun somebody a story they bought whole, and as a goblin, pal, I've got to say I'm proud. Just don't try it on me, because I wrote the book and I sell copies." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "Word is you talked somebody round today, pal, and that's a skill worth good money, so try it on Noggle and his antidote sometime and I'll call you a genius." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy" } },
      text = "Ooh, an alchemist! You can tell by the singed eyebrows, pal. Don't touch anything on the left side of the bench, because the left side is where things go boom." },
    { id = "n_poison", cat = "status", when = { debuffType = "Poison" },
      text = "You're a funny colour, pal, and I've seen that colour on Noggle. Sit down before you fall down, and don't lick anything, because I charge for antidotes." },
  },

  start = "hello",
  nodes = {
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Maybe, pal, though I've a suspicion that what he really needs is for somebody to fetch the venom samples so I can finish the cure. He's not as sick as he says, but he's not as well as he thinks, either, and the scorpids out there aren't getting any friendlier." } },
      choices = {
        { text = "I'll lay hands on him and see what the Light can do.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll fetch the samples. Prayer won't mix your potion.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Somethin' with a stinger and a bad attitude, out north where he had no business picking herbs, and now I'm brewing antidotes at cost, which hurts me nearly as much as the venom hurts him. If you're fighting out there, pal, buy your own antidotes before you go, because I'm not nursing two of you for free." } },
      choices = {
        { text = "Look after your own first. That's what family is for.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "He knew the risks. Let him pay the price.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every one, pal, because you can't brew an antidote without the poison, and the poison doesn't come in a jar. A hunter who knows where to cut gets me a clean sac, and a warrior who doesn't gets me a splattered mess I can't use or sell." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} back from the stingers when you're cutting them, though, pal, because I'm already nursing one patient and I don't do animals, whatever Noggle says about my bedside manner." },
      },
      choices = {
        { text = "I'll bring you what heals people. That's worth the hunt.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I hunt for the coin. What you brew is your business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Only if you start charging, pal, and then we'd have to talk about splitting the market. Between you and me, the venom out of those stingers is nasty stuff, and if your Light or your loa can ease Noggle where my potions can't, I'll call it a fair trade and a cheap one." } },
      choices = {
        { text = "I'll tend Noggle for nothing. Keep your potions for others.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My healing has a price too, Beetix. Name your cut.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The stingers out here feed on things that oughtn't be eaten, pal, and the silithid poison whatever they don't eat. I've tested samples from the edge of Hive'Ashi that would fell a thunder lizard, and the closer to the hives they come from, the worse it gets and the more it's worth." } },
      choices = {
        { text = "Antidotes won't fix this land. It needs healing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Venom that strong must be worth something. Sell it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Bad enough that I'm spendin' every copper on antidotes, and every hour watching him sleep, which is time I could be billing. If a mage could slow the venom with a frost spell, pal, I'd pay good coin for the experiment, but nobody seems keen." } },
      choices = {
        { text = "I'll help Noggle however I can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "That's your problem, not mine.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll look for samples.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't know, pal, which is why I'm asking, and I'm desperate enough to try anything that won't kill him faster. Mind you, if your trick costs extra, it's going on Noggle's tab." } },
      choices = {
        { text = "I won't experiment on your cousin. It's too risky.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll try a curse, if you're paying.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I don't know any such trick.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Bad enough that he's started calling me by his mother's name, pal, and Noggle's mother was a terrifying woman who audited her own children, so that's no compliment. I've slowed the venom with every tonic I know, but slowing isn't curing, and I'll take a prayer, a potion or a miracle, whichever turns up first and cheapest." } },
      choices = {
        { text = "Prayer and potions together. Neither should have to work alone.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Trust your tonics. A prayer won't draw venom out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Maybe, pal, if your healing's as good as everybody says. The druids here sang over him for an hour and he stopped twitching, but the venom's still in him, so I figure magic slows it and chemistry finishes it, and I'm the chemistry, at very reasonable rates." } },
      choices = {
        { text = "Work with the druids. Noggle's life matters more than credit.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep your own cure. The druids would only take the credit.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Huh, you've got the same face as a {altrace} named {alt}, pal, from the other side, who brought me a sack of stingers and didn't haggle, which I'm still suspicious of. Related? Doesn't matter, as long as you've got the same habit of bringing me venom." },
        { id = "h_alt_higher", when = { alt = { higher = true } },
          text = "{alt} was in here last week, all scars and stingers, and Noggle hasn't stopped talking about it, which is a mercy, because it beats his moaning. You've got the look of someone headed the same way, pal, and I'll have the jars ready." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Stonelash", min = 20 } },
          text = "You've been squashing scorpids by the dozen, I hear, pal, which is lovely, because every one you kill is one less that can sting Noggle again. Mind you, he'd find a way, he always does." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Oh, you're just what I need, pal, because Noggle's been moaning for a miracle all week, and I'd much rather you supplied one than I paid for another potion." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you heal venom with a totem, or a chant, or anything else that doesn't cost me reagents, pal? Noggle's eating my profits faster than the venom's eating him." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! You don't happen to have a spell for curing scorpid venom, do you, pal? No? Then you're about as useful as a priest who's run dry, and I'll need samples instead." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! Your kind know poison, don't you, all that curse business? Maybe you'll know a trick I don't for drawing venom out of a goblin, pal, and I'd pay to learn it." },
        { id = "h_default", key = true,
          text = "My cousin Noggle gathers rare herbs for the alchemists here, pal, or he did until he came back with enough venom in him to drop a kodo. I've slowed it down, but slowing isn't stopping, and I need samples of whatever bit him." },
        { id = "h_venom", tags = { "news" }, when = { questActive = TODO_QUEST("Deadly Desert Venom") },
          text = "He came in from the north, so it's stonelash scorpids or sand skitterers, pal, and I'd bet my shirt and my shop on it. Stingers and fangs, as many as you can carry." },
        { id = "h_hope", tags = { "news" }, when = { questActive = TODO_QUEST("Noggle's Last Hope") },
          text = "The first antidote didn't take, pal, which means somethin' nastier got him down south, and that's a whole batch of reagents down the drain. I need fewer samples this time, but from more kinds of nasty, so this is our last shot." },
        { id = "h_satchel", when = { questActive = TODO_QUEST("Noggle's Lost Satchel") },
          text = "He's awake and already moaning about his bag, pal. If you find it, check the reagents are all there before he does, or I'll never hear the end of it, and he'll bill me for the missing ones." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and just in time, pal, because Noggle's been moaning about dying all morning, and I'd love a second opinion that doesn't cost me reagents." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Oh, thank the Cartel, could you look at Noggle, pal? I'll still need the samples, mind, because whatever's in him is too stubborn for one prayer." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You look tough enough to take a scorpid's sting and walk it off, pal, which is more than my idiot cousin managed." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Bring me venom sacs and stingers, pal, because every bug and scorpid in this desert is a cure for somethin', eventually, and a cure's worth money." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Perfect, you know poisons from the leaves out, pal, and my cousin Noggle could use whatever trick you've got for silithid venom." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I've got a pot about to boil over, and the last one that boiled over took the tent flap with it, so make it snappy." },
        { id = "h_again2", text = "Go ahead, pal, ask. Noggle's not going anywhere, and neither is his bill." },
      },
      choices = {
        { text = "Can druid craft cure Noggle where alchemy can't?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why is the venom in Silithus so much worse than elsewhere?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How is Noggle doing?", next = "noggle" },
        { text = "You must brew a great deal for the Hold.", next = "work" },
        { text = "I know a little alchemy myself.", next = "alchemist", when = { profession = { "Alchemy" } } },
        { text = "A goblin working for druids is a strange sight.", next = "goblin" },
        { text = "Venom like that would coat a blade nicely.", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "Noggle's poisoning looks bad.", next = "xmage", when = { class = "MAGE" } },
        { text = "Could a curse really help draw out venom?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How bad is Noggle's poisoning, really?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "A priest's healing could put you out of business, Beetix.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What stung Noggle so badly, Beetix?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters' kills really help you make cures, Beetix?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Can a paladin really help Noggle, Beetix?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll keep an eye out for nasty things with stingers.", next = "END" },
      },
    },

    noggle = {
      lines = {
        { id = "n_default", text = "He's lying on that bench asking who he is and where he is, pal, which is an improvement on yesterday, when he was asking who I was. The poison's in his blood and I can keep it from his heart, but not forever." },
        { id = "n_saved", when = { questDone = TODO_QUEST("Noggle's Last Hope") },
          text = "He jumped up off the bench yelling that he was cured, and then fell straight back down again, which I'm calling a success, pal. He'll be weak for a while, but he'll live to annoy me and pay me back." },
      },
      choices = {
        { text = "What stung him?", next = "noggle_sting" },
        { text = "Something else.", next = "BACK" },
      },
    },
    noggle_sting = {
      lines = {
        { id = "ns_default", text = "Somethin' big, he says, when he's making sense, pal. The rest is mumbling about a scorpid and a nest and his satchel, mostly the satchel." },
        { id = "ns_known", when = { questDone = TODO_QUEST("Noggle's Last Hope") },
          text = "Deathclasp, the big scorpid in the southern mountains, chased him into a whole nest of stonelash flayers, pal. The idiot ran straight from one into the other, and lost his bag doing it, with a week's herbs inside." },
      },
      choices = {
        { text = "Someone should deal with Deathclasp.", next = "noggle_deathclasp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    noggle_deathclasp = {
      lines = { { id = "nd_default", text = "Captain Kozus has a poster up about her, and a reward, which is nice, pal. I'd add to it myself if I didn't need every coin for antidotes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "w_default", text = "Potions for the soldiers, mostly, pal: healing, antivenom, something for the heat. Noggle brings in the herbs from the wild, I turn them into something worth drinkin', and the Circle pays on time, which is more than I can say for most." } },
      choices = {
        { text = "So it's a family business.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alchemist = {
      lines = { { id = "al_default", text = "Then you know venom's tricky, pal: every critter brews its own, and the cure has to match. If you've got samples you don't need, I'm buying, and if you've got advice, I'm listening, for once, and for free." } },
      choices = {
        { text = "I'd share what I know for nothing.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Advice costs extra, Beetix.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    goblin = {
      lines = { { id = "g_default3", text = "Making money, pal, same as anywhere. The druids need potions, the potions need herbs, and nobody else wanted to come to a desert full of bugs, so the prices are excellent and the competition's dead, or stung." } },
      choices = {
        { text = "Profit before people, then?", next = "goblin_family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblin_family = {
      lines = { { id = "gf_default", text = "Profit before people, sure, but family before profit, pal, and don't you tell anybody in Gadgetzan I said so. Noggle's an idiot, but he's my idiot." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    x_rogue = {
      lines = {
        { id = "xr_default", text = "It would, pal, and it'd coat your fingers just as nicely if you hold the vial like that, because Noggle's still half green from one sting. I'll sell what I can spare at the going rate, but anything off those southern stingers goes into his antidote first, family before business." },
      },
      choices = {
        { text = "Family first. I'd do the same.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Everything has a price, Beetix. Name yours.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Herbs, poisons, or who owes who, pal, and that last one's a long list. Pick one." } },
    background = { { id = "tp_bg", text = "Steamwheedle born, Steamwheedle trained, and stuck in a desert because the money's good, pal. What else is there?" } },
    advice = { { id = "tp_ad", text = "If somethin' in this desert has a tail, pal, assume the tail's poisoned, and you'll be right nine times in ten." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel doesn't run this fort, pal, but it sells to it, which is better: all the profit, none of the bugs." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got the best alchemy suppliers in Kalimdor, and I'd be there right now if Noggle hadn't gone and got himself stung. He's an investment, you see, and I protect my investments." } },
    silithid_hives = { { id = "tp_silithid_hives", text = "The hives are full of venoms and ichors that'd make an alchemist rich, sweetheart, if she lived long enough to sell them. I've got the bottles, I just need someone else's arm." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's a fine market, but you can't sell scorpid venom to sailors, not twice anyway. I'm sticking to the desert, where the customers are desperate." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and unless it's poisonous or pays well, I don't much care." } },
  },
}
