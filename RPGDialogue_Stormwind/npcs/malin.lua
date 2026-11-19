-- Archmage Malin, Wizard's Sanctum, Mage Quarter, Stormwind. Voice: bibles/malin.md
-- Student of Archmage Trelane of Stromgarde; sends Skuerto and Apprentice Kryten to Refuge Pointe
-- to recover his master's artifacts. Quest: Malin's Request (-> Skuerto, Arathi Highlands).
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q = TODO_QUEST("Malin's Request")
local TOWER = TODO_QUEST("Attack on the Tower")
local WAND = TODO_QUEST("Wand over Fist")

P:NPC {
  key = "malin", id = TODO_NPC("Archmage Malin"), name = "Archmage Malin",
  bible = "bibles/malin.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "stern", "dry" }, values = { "learned", "loyal" },
  notices = { "arcane", "fel", "student" },

  impression = {
    first = "He speaks of his dead master as though he only stepped out.",
    third = "{name} met Archmage Malin of the Wizard's Sanctum, who wants his old master's artifacts brought out of Stromgarde's ruins.",
  },

  greetings = {
    { id = "g_default", text = "Mind the circle on the floor, if you please; it took me a fortnight to chalk, and I'm not starting again because someone came in with muddy boots." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've come back. Sit, if you can find a chair under the books, and tell me what brings you up the stairs this time." },
    { id = "g_quest", when = { questActive = Q }, text = "You've not gone north yet? Skuerto is a patient dwarf, which is to say he is not patient at all, and he'll be waiting at Refuge Pointe." },
    { id = "g_tower", when = { questDone = TOWER }, text = "There you are. Kryten wrote to me about the tower, and about you, and I'll admit I read that part of the letter twice." },
    { id = "g_away", when = { away = 21, metBefore = true }, text = "Gone {away}, and I hadn't noticed until now, which says more about my reading than about you. Come in, then." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 10 }, text = "You've grown into your power since I last saw you; I can feel it from here, and so can the wards, which are sulking." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The Mage Quarter gossips worse than any fishwife, and lately it gossips well of you. Come in." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I've heard your name in the Quarter, and not kindly. I'll hear you out, but keep your hands where my wards can see them." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "One of ours, I see, though I can't place your teacher from the way you hold your hands. Who taught you to channel like that?" },
    { id = "n_lock", cat = "fel", when = { class = "WARLOCK" },
      text = "You've a smell about you, {class}, like a hearth after something wrong has burned in it. I'll ask you not to summon anything in my rooms." },
    { id = "n_student", cat = "student", when = { origin = "human_mage_quarter" },
      text = "I know your face from the Quarter, though I can't put a master to it. Whoever they were, they let you out of the library, which is more than mine ever did." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Archmage Malin, of the Wizard's Sanctum. I teach a little, write far too much, and spend more of my evenings than I'd like worrying about the Arathi Highlands." },
        { id = "h_before", key = true, tags = { "news" }, when = { questBefore = Q, minLevel = 28 },
          text = "You look like someone who has been north and lived to complain of it. I have a matter in the Arathi Highlands, if you'll hear it, and it concerns my old master's tower." },
        { id = "h_active", tags = { "news" }, when = { questActive = Q },
          text = "Skuerto has my letter by now, or he will when you hand it to him. Go to Refuge Pointe and do as he and Kryten ask, and do try to keep the boy out of the ogres' cooking pots." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { Q, days = 3 } },
          text = "So Skuerto has you running errands already? Good. He'll be rude about it, but he only wastes his rudeness on people he expects to see again." },
        { id = "h_wand", tags = { "news" }, when = { questDone = WAND },
          text = "I've heard the ogre Kor'gresh no longer has my master's wand, and that he had some trouble letting go of it. I won't ask how hard you had to pull." },
        { id = "h_tower", tags = { "news" }, when = { questDone = TOWER },
          text = "The phylactery, the orb and the ember agate are on their way south, Kryten says, and the Boulderfist are short a few shamans. I've waited a long while to hear that, and I thank you for it." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, and you've come up all these stairs! Skuerto says the Sanctum's steps are a crime against short legs, and I've never found the courage to disagree with him." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome in the Sanctum is always welcome, for your people ask better questions than mine do. I'm sorry about Gnomeregan; I had friends who wrote to me from there, once." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A kaldorei, in a mage's rooms. I've read that your people have little love for the arcane, so you're either very curious or very lost." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the circle as you think." },
        { id = "h_again2", text = "Go on, then. I've a whole pot of tea and nowhere to be." },
        { id = "h_again3", text = "Ask away. Answering questions is most of what an archmage is for." },
      },
      choices = {
        { text = "Who was your master?", next = "trelane" },
        { text = "What do you need in the Highlands?", next = "arathi" },
        { text = "Tell me about Skuerto and Kryten.", next = "pair" },
        { text = "What happened to Stromgarde?", next = "stromgarde" },
        { text = "What do you make of Dalaran these days?", next = "dalaran" },
        { text = "What's it like, teaching in the Mage Quarter?", next = "quarter" },
        { text = "Who taught me? Someone in this very Quarter.", next = "xapprentice", when = { origin = "human_mage_quarter" } },
        { text = "I studied in Dalaran, before it burned.", next = "xstray", when = { origin = "human_dalaran_stray" } },
        { text = "I fought for Stromgarde. I've seen those ruins.", next = "xsellsword", when = { origin = "human_stromgarde_sellsword" } },
        { text = "I was among Gnomeregan's last arcane students.", next = "xgnome", when = { origin = "gnome_last_student" } },
        { text = "Your master's things are safe. The tower's done.", next = "xtower", when = { questDone = TOWER } },
        { text = "You don't trust people like me, then, Archmage?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you have work for me?", next = "BUSINESS" },
        { text = "I'll leave you to your books.", next = "END" },
      },
    },

    -- Trelane
    trelane = {
      lines = {
        { id = "t_default", text = "Archmage Trelane, of Stromgarde, and the finest teacher I ever had, though I'd not have said so at fourteen. He kept a tower in the Highlands full of wards and odd treasures, and when Stromgarde fell he stayed to hold it." },
      },
      choices = {
        { text = "What was he like?", next = "trelane_like" },
        { text = "Why did he stay?", next = "trelane_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trelane_like = {
      lines = {
        { id = "tl_default", text = "Impatient with fools and endlessly patient with the slow, which I didn't understand was a kindness until much later. He made me copy his notes by candle every night for a year, and I still write my sevens the way he did." },
        { id = "tl_mage", when = { class = "MAGE" }, text = "He'd have liked you, {class}, or at least he'd have set you to copying. He said a mage who hadn't copied a thousand pages hadn't earned the right to burn one." },
      },
      choices = {
        { text = "It sounds like he shaped you more than you admit.", next = "trelane_shaped" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trelane_shaped = {
      lines = {
        { id = "ts_default", text = "More than I'd admit to anyone but a stranger, which you are, so there it is. Most of the rules I give my own apprentices are his, and the rest I made because he never had to deal with Kryten." },
      },
      choices = {
        { text = "Then honour him by doing what he would have.", next = "BACK", reply = "That's what I try to do every day, though Trelane would have found fault with how I do it. He found fault with everything, which is why he was so good.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Make your own rules. He's gone, and you're not him.", next = "BACK", reply = "Bold advice from a stranger, and not entirely wrong. Still, a mage who throws out every rule his master gave him usually finds out why they were given.", fx = { align = { order = -1 } } },
        { text = "What would he think of Kryten?", next = "pair_kryten" },
      },
    },
    trelane_stay = {
      lines = {
        { id = "ty_default", text = "Because the tower held things no one should hand to an ogre, and because he was stubborn, which is much the same reason in an old wizard. He sent his students south with the last of his letters, and I was one of them." },
      },
      choices = {
        { text = "You wish you'd stayed with him.", next = "trelane_guilt" },
        { text = "He chose well. A teacher should save his students.", next = "trelane_guilt", fx = { align = { honor = -1 } } },
        { text = "A real master would have saved himself and the tower both.", next = "trelane_guilt", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    trelane_guilt = {
      lines = {
        { id = "tg_default", text = "I wish a great many things, most of them foolish. What I can do is get his work out of the ogres' hands and into a library, where he always meant it to end up, and that's what Skuerto and Kryten are for." },
      },
      choices = {
        { text = "What exactly did he leave behind?", next = "arathi_items" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Highlands and the request
    arathi = {
      lines = {
        { id = "a_default", text = "My master's tower, or what's left of it, and the things the Boulderfist carried out of it. I sent a dwarf and an apprentice to Refuge Pointe to get them back, and they write to me weekly about how they need more help." },
        { id = "a_active", when = { questActive = Q }, text = "You have the letter already, so you know as much as I can put in ink. Skuerto will tell you the rest, at length, and with opinions." },
        { id = "a_done", when = { questDone = TOWER }, text = "The work is done, thanks to you. The pieces will come south in a sealed chest, and I mean to sit up a whole night with them, the way I used to with him." },
      },
      choices = {
        { text = "What did he leave behind?", next = "arathi_items" },
        { text = "Have you been back there yourself?", next = "arathi_ask" },
        { text = "Why not go and get them yourself?", next = "arathi_self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    arathi_items = {
      big = true,
      lines = {
        { id = "ai_default", text = "A wand, a phylactery, an orb of power, an ember agate that held the tower's defenses, and his notes, if the ogres haven't burned them for warmth. In a Boulderfist shaman's hands they're dangerous, and in mine they're the last of a good man's work." },
      },
      choices = {
        { text = "Then they belong in a Stormwind vault.", next = "arathi_vault", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things are better broken than kept.", next = "arathi_vault", fx = { affinity = -1, align = { order = -1 } } },
        { text = "What would you do with them?", next = "arathi_vault" },
      },
    },
    arathi_vault = {
      lines = {
        { id = "av_default", text = "Study them, and then lock them where nobody can find them without asking me first. I'm not sentimental enough to keep a dangerous thing on my desk, whatever Skuerto says about wizards and their trinkets." },
      },
      choices = {
        { text = "Skuerto has a lot to say about wizards.", next = "pair_skuerto" },
        { text = "Something else.", next = "BACK" },
      },
    },
    arathi_ask = {
      lines = {
        { id = "aa_default", text = "Not since I was a young man, and I prefer to remember the Highlands green rather than see them as they are now. You've been, though, haven't you? Tell me, does anyone still hold Stromgarde's walls?" },
      },
      choices = {
        { text = "The Syndicate and the ogres hold most of it now.", next = "arathi_answer", when = { minLevel = 30 } },
        { text = "Refuge Pointe holds, and Stromgarde's soldiers won't give up.", next = "arathi_answer", fx = { affinity = 1 } },
        { text = "I haven't been. I'd rather hear it from you.", next = "stromgarde" },
      },
    },
    arathi_answer = {
      lines = {
        { id = "aw_default", text = "That's much what Kryten writes, though he's kinder about it, being young. Thank you for telling it plainly; I'd rather have it plain than have it gentle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    arathi_self = {
      lines = {
        { id = "as_default", text = "Because I'm sixty years old and my knees have opinions, and because an archmage walking into Boulderfist Hall would be a feast for them and a funeral for me. I'm better use here, writing letters and reading what comes back." },
      },
      choices = {
        { text = "Sending others to bleed for you is a coward's bargain.", next = "BACK", reply = "Coward is a strong word to use in a Sanctum full of people who throw fire for a living. I send them because they'll come back, and I wouldn't.", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "That's sense. Let those who can fight do it.", next = "BACK", reply = "Thank you. My apprentices think I'm only being lazy, and they're half right, but the other half is arithmetic.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Skuerto and Kryten
    pair = {
      lines = {
        { id = "p_default", text = "Skuerto is the best scout I could afford and the rudest dwarf I've ever met, and Kryten is the most promising apprentice I've had in twenty years. Between them they make one sensible person, most days." },
      },
      choices = {
        { text = "Why send an apprentice into ogre country?", next = "pair_kryten" },
        { text = "How did you find Skuerto?", next = "pair_skuerto" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pair_kryten = {
      lines = {
        { id = "pk_default", text = "Because books won't teach him what a Witherbark witch doctor keeps in her pouch, and because my master sent me to worse places at his age. I'll admit I read his letters faster than I read anything else." },
      },
      choices = {
        { text = "He's lucky to have a master who worries.", next = "BACK", fx = { affinity = 1 } },
        { text = "You're testing him. That's fair.", next = "BACK", reply = "I am, and he knows it, which is half the test. If he can keep his wits in the Arathi hills, he'll keep them anywhere.", fx = { align = { light = -1 } } },
        { text = "That's no place for a boy, Malin.", next = "BACK", reply = "It's exactly the place for a boy who wants to be a man someday, and I was younger when Trelane sent me further. I'll worry, but I'll not call him back.", fx = { align = { light = 1 } } },
      },
    },
    pair_skuerto = {
      lines = {
        { id = "pz_default", text = "He found me, in truth; he came into the Sanctum one wet morning, told me my maps of the Highlands were wrong, and was right on every count. I hired him before he'd finished being rude about the shading." },
        { id = "pz_dwarf", when = { race = "Dwarf" }, text = "Through an Ironforge friend who said he was the best and the worst-tempered scout in Dun Morogh. You'll know the sort, I expect, and I'll not ask which half you are." },
      },
      choices = {
        { text = "He was rude to me too.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Stromgarde
    stromgarde = {
      lines = {
        { id = "s_default", text = "It was a fortress of a city, proud and cold and full of men who thought a wall could solve anything. When the Alliance broke apart, the Syndicate and the ogres and the trolls came at it from three sides, and the walls weren't enough.",
          fx = { learn = { "syndicate" } } },
      },
      choices = {
        { text = "Who are the Syndicate?", next = "stromgarde_syndicate" },
        { text = "Could Stormwind have saved it?", next = "stromgarde_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stromgarde_syndicate = {
      lines = {
        { id = "sy_default", text = "Alterac's nobles and their hired knives, who lost everything when Perenolde betrayed the Alliance and decided the rest of us owed them. They'll sell anything Trelane left to anyone who pays, so I mean to have it first." },
      },
      choices = {
        { text = "Then we beat them to it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stromgarde_help = {
      lines = {
        { id = "sh_default", text = "Perhaps, if Stormwind hadn't been rebuilding itself from the ash at the time, and if anyone at court had cared to look north. I've said as much to the House of Nobles, and they thanked me politely and moved on to the price of grain." },
      },
      choices = {
        { text = "Stormwind should look after its own first.", next = "BACK", reply = "That's what the court said, and look where it got Stromgarde. I'll not argue with you, but I'll remember you said it.", fx = { align = { order = 1 } } },
        { text = "The Alliance left Stromgarde to die. That's shameful.", next = "BACK", reply = "It is, and I've said so to faces that didn't want to hear it. Trelane gave his life for that city, and Stormwind sent a letter.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Dalaran
    dalaran = {
      lines = {
        { id = "d_default", text = "Rebuilding, slowly, and in no hurry to open its gates to those of us who weren't there when the demons came. I studied two summers in the Violet Citadel as a young man, and I find I can't think about it for long." },
      },
      choices = {
        { text = "Do you blame the Kirin Tor?", next = "dalaran_blame" },
        { text = "Would you go back if they asked?", next = "dalaran_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_blame = {
      lines = {
        { id = "db_default", text = "For the city falling? No, for Archimonde came on them like a flood, and nobody could have held against that. For keeping the doors shut afterwards, I blame them a little, though I understand it; a man who's been burned once keeps his hands from the fire." },
      },
      choices = {
        { text = "They should open their doors to every mage.", next = "BACK", reply = "Every mage? You've not met some of the ones I've taught, then. Still, a locked library helps nobody, and Dalaran's has been locked too long.", fx = { align = { order = -1 } } },
        { text = "Caution is right. Their secrets nearly ended the world.", next = "BACK", reply = "They did, and there's a reason I don't sign every petition to open the vaults. Caution I can respect, though I'd like it to answer its letters.", fx = { align = { order = 1 } } },
      },
    },
    dalaran_back = {
      lines = {
        { id = "dk_default", text = "I'd go to see it, certainly, but I'd come back here to work. Stormwind needs mages who'll stay, and there are few enough of us since the war that I'd feel I was deserting." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Mage Quarter
    quarter = {
      lines = {
        { id = "q_default", text = "Busy, crowded, and louder than a library ought to be, though I'd not live anywhere else. Maginor Dumas keeps the trainers in order, and I keep to my rooms, and between us we've only set the roof on fire twice." },
      },
      choices = {
        { text = "What about the warlocks below the Slaughtered Lamb?", next = "quarter_lamb" },
        { text = "Do you take apprentices?", next = "quarter_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter_lamb = {
      lines = {
        { id = "ql_default", text = "Everyone knows, and nobody says, and the city finds the arrangement convenient. I think warlocks are mages who stopped asking questions, and I'd sooner they did their asking somewhere other than three doors from my window." },
      },
      choices = {
        { text = "Then they should be driven out.", next = "BACK", reply = "Easier said than done, and the city has tried it before. Still, I'll not lose sleep if somebody else finally manages it.", fx = { align = { light = 1 } } },
        { text = "Power is power. You use what works.", next = "BACK", reply = "That's exactly what every warlock I've known told me, a few years before it stopped working. Mind yourself.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter_teach = {
      lines = {
        { id = "qt_default", text = "One at a time, and only when I've the patience, which is rarely. Kryten is the one I have now, and he's in Arathi, so the Sanctum is very quiet and I've been reading everything twice." },
        { id = "qt_mage", when = { class = "MAGE" }, text = "Not ones as far along as you, {class}; you'd want a trainer, and Elsharin or Maginor would serve you better than I would. Come and argue theory with me, though, whenever you like." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    xapprentice = {
      lines = {
        { id = "xa_default", text = "Then I've probably shouted at you on the stairs at some point, and I apologise for it now in case I did. Did they teach you the old Dalaran forms, or the quick Stormwind ones?" },
      },
      choices = {
        { text = "The old forms. Slow, but they hold.", next = "BACK", reply = "Good. They'll save your life when the quick ones fail, and they always fail at the worst possible moment.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The quick ones. The world won't wait for slow casting.", next = "BACK", reply = "The world doesn't wait, no, but it does bury those who rush. Learn the old forms anyway, if only so you know what you're skipping.", fx = { align = { order = -1 } } },
      },
    },
    xstray = {
      lines = {
        { id = "xs_default", text = "Then you saw what I only read about, and I'll not ask you to tell it. If the Citadel ever opens its doors again, I hope you're first through them, and if it doesn't, there's a chair here." },
      },
      choices = {
        { text = "I'll go back. Dalaran was home.", next = "BACK", reply = "I hope you do, and I hope they deserve you when you get there. Dalaran was home to a great many of us once.", fx = { align = { honor = 1 } } },
        { text = "I won't. Dalaran shut me out; I'll build elsewhere.", next = "BACK", reply = "I can't blame you for that, though it grieves me. Build well, then, and build somewhere they'll be glad of you.", fx = { align = { honor = -1 } } },
      },
    },
    xsellsword = {
      lines = {
        { id = "xw_default", text = "Then you've stood where my master stood, more or less, and seen what's left of it. Is the tower still standing, from the walls? I've never had a straight answer from Skuerto." },
      },
      choices = {
        { text = "It stands, but the ogres have made it a den.", next = "BACK", fx = { affinity = 1 } },
        { text = "I never looked. I was busy staying alive.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "Then you carried Gnomeregan's learning out on your back, and that's a heavier load than any pack. If there's a text you lost that you can still recite, write it down for me; I'll find it a shelf and a guard." },
      },
      choices = {
        { text = "I'll write it down for you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtower = {
      lines = {
        { id = "xt_default", text = "I know, and I've been rehearsing what to say to you, which is a ridiculous thing for an old man to do. Thank you, plainly, from me and from a man who isn't here to say it himself." },
      },
      choices = {
        { text = "He'd be proud of you, Malin.", next = "BACK", fx = { affinity = 2 } },
        { text = "I did it for the coin, but you're welcome.", next = "BACK", fx = { trait = { greedy = 1 } } },
      },
    },
    xlock = {
      lines = {
        { id = "xl_default", text = "I don't trust what you bargain with, which isn't quite the same thing. You may be a perfectly decent sort, {class}, but every warlock I've known believed that right up to the end." },
      },
      choices = {
        { text = "I hold the leash, Archmage. What's on the other end obeys.", next = "BACK", reply = "Every one who walks your road says so, and every one of them was right until the day he wasn't. I'll take you at your word, for now.", fx = { align = { light = -1 } } },
        { text = "You're right to be wary. I watch myself.", next = "BACK", reply = "That's the first sensible thing anyone from the Lamb has said to me in this Sanctum. Keep watching, {class}, and I'll keep watching you.", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stromgarde-trained, two summers in Dalaran, and thirty years in this Sanctum. My master would say I've been sitting still too long.", next = "trelane" } },
    advice = { { id = "tp_ad", text = "Copy before you cast, and read a spell twice before you trust it once. That was Trelane's, and it's served me well." } },
    _none = { { id = "tp_none", text = "I've no idea, and I'm too old to pretend otherwise. Try the library downstairs; someone's always asleep in it who knows." } },
  },
}
