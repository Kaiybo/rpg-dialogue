-- Light's Hope Chapel: the Argent Dawn's heart in the Eastern Plaguelands. Voice: bibles/easternplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tyrosus", id = TODO_NPC("Lord Maxwell Tyrosus"), name = "Lord Maxwell Tyrosus",
  bible = "bibles/easternplaguelands.md", role = "noble", tier = "major",
  communities = { "light_hope", "argent_dawn" }, temper = { "reserved" }, values = { "devout", "pragmatic" },
  notices = { "race", "class", "form" },

  impression = {
    first = "Lord Maxwell Tyrosus leads the Argent Dawn and says he's out of practice with visitors, though he hardly seemed it. He asks nothing about whose crown anyone serves, only whether they'll stand.",
    third = "{name} met Lord Maxwell Tyrosus, who leads the Argent Dawn from the chapel at Light's Hope.",
  },

  greetings = {
    { id = "g_rare", text = "I don't often receive visitors here at the chapel, and I'm out of practice at being a host." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good. Few return from the Plaguelands twice, and fewer bother to call on me." },
    { id = "g_xknight", when = { origin = "forsaken_risen_knight" }, text = "A knight of the old Hand, risen. I'm not at ease with it, but the Light answers you, and in this chapel I'll not argue with the Light." },
    { id = "g_away", when = { away = 14 }, text = "I hadn't expected to see you again after {away} away, and I'm glad to be mistaken. The chapel's doors remain open to you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown formidable since we last spoke. The Dawn needs exactly that, and I'll not pretend otherwise." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told someone at the chapel caught you in an untruth. The Dawn stands on trust between people who have little else, so I'd ask you to guard it." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word around the chapel speaks well of the help you've given. The Dawn keeps careful records, and your name is in the good ones." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "The Crusade would never have let you through the gate looking like that, but the Dawn will take your help. That's the whole difference between us, really." },
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Horde. Some of my officers still flinch, but I don't. The Scourge doesn't care whose blood it spills, and neither will I, when it's spilled for this." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I left the Silver Hand when it became the Scarlet Crusade, and you may yet show me there was something worth keeping." },
  },

  start = "hello",
  nodes = {
    op_forsaken = {
      big = true,
      lines = {
        { id = "opfk_default", text = "Most of them do, and some grumble, and a few have asked me outright whether I've lost my wits. You've seen Leonid at our altar, so I'll ask you: should the dead fight beside the living?" },
      },
      choices = {
        { text = "Anyone who fights the Scourge belongs here.", next = "op_forsaken_r1", fx = { align = { light = 1 }, opinion = { forsaken = "trust" } } },
        { text = "The dead are too close to the Scourge to trust.", next = "op_forsaken_r2", fx = { align = { light = -1 }, trait = { cautious = 1 }, opinion = { forsaken = "distrust" } } },
        { text = "I'm Forsaken, my lord. Judge me by my blade.", next = "op_forsaken_r3", fx = { affinity = 1, opinion = { forsaken = "trust" } }, when = { race = "Scourge" } },
        { text = "That's for the Dawn to decide, my lord.", next = "BACK" },
      },
    },
    op_forsaken_r1 = {
      lines = { { id = "opfk_r1", text = "That's the Dawn's whole creed in a sentence, and I'm glad to hear someone say it plainly. I'll tell the grumblers you said so." } },
      choices = { { text = "Something else, my lord.", next = "BACK" } },
    },
    op_forsaken_r2 = {
      lines = { { id = "opfk_r2", text = "I understand the fear, and I won't call it foolish. But Leonid has bled for this chapel, after his fashion, and I'll judge him by that." } },
      choices = { { text = "Something else, my lord.", next = "BACK" } },
    },
    op_forsaken_r3 = {
      lines = { { id = "opfk_r3", text = "Then that is exactly how I'll judge you, and gladly. Light's Hope keeps its door open to anyone who keeps faith with the fight." } },
      choices = { { text = "Something else, my lord.", next = "BACK" } },
    },
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "Then fight it as the Dawn does, with patience, because Stratholme won't fall to a single charge and the Scourge have more dead to spend than we have living. A company that comes back again and again does more good than a hero who dies gloriously on the first day." } },
      choices = {
        { text = "Patience, then. We'll come back as often as it takes.", next = "BACK", reply = "Good. That's the Dawn's whole strategy, and it's never failed us yet.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "One bold strike at the heart beats a hundred patrols.", next = "BACK", reply = "I've seen many bold strikes at Stratholme, {class}, and buried most of them. Patience has outlived them all.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The Dawn welcomes anyone who stands against the Scourge, and you stand with the Light besides, which is more than many of my knights can say on a bad day. Some of them will look at you and see what they lost, and you'll have to forgive them that, because it's grief, not hatred." } },
      choices = {
        { text = "I'll forgive them. Grief is something I understand.", next = "BACK", reply = "Then you're a better soul than many of my knights, and I'll trust you with the ones who struggle.", fx = { align = { light = 1 } } },
        { text = "Their grief is theirs to carry. I'll not bend for it.", next = "BACK", reply = "That's your right, and I won't ask you to. Only keep your blade sheathed when they glare.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Dawn asks for a strong arm and a clear conscience, and the Light is welcome but never required. Some of the best I've known were soldiers of Lordaeron's old army who simply refused to stop fighting when their kingdom did." } },
      choices = {
        { text = "Then I'll fight for the Dawn as Lordaeron's soldiers did.", next = "BACK", reply = "Then you're welcome here, and you'll find good company among the old soldiers.", fx = { align = { order = 1 } } },
        { text = "I fight for myself, my lord, though the Dawn may follow.", next = "BACK", reply = "The Dawn won't mind, so long as you're pointed at the Scourge. Welcome, {class}.", fx = { align = { order = -1 } } },
        { text = "Something else, my lord.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plaguebats roosting in daylight, wolves running toward Stratholme in packs too large to be natural, and birds that won't fly over Corin's Crossing at all. I'm a soldier, not a woodsman, but I know a sign of the enemy when I see one." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks well fed and clear-eyed, and in these lands I've seen wolves with the plague's grey in their gums. The Dawn's stables are open to it, {class}, if it needs a quiet night." },
      },
      choices = {
        { text = "I'll scout carefully and bring every report to your officers.", next = "BACK", reply = "Good. A careful scout brings back more than reports; she brings back herself.", fx = { align = { order = 1 } } },
        { text = "I'll follow the packs alone and strike when I see fit.", next = "BACK", reply = "Strike when you see fit, but send word before you do. I'd like to know where to send help.", fx = { align = { order = -1 } } },
        { text = "Something else, my lord.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Hold it, first, for there is nothing to heal while the dead still march out of Stratholme and the Plaguewood. When they stop rising, I'll hand you every acre of this ground gladly and pray you know what to do with it." } },
      choices = {
        { text = "Hold the line first. Healing follows victory.", next = "BACK", reply = "It does, and I'm glad you see it. Hold with us, and the healing will have a place to stand.", fx = { align = { order = 1 } } },
        { text = "The land can't wait for your war to end.", next = "BACK", reply = "It may not, and I'll grieve for every acre we lose. But it can't heal under the dead's feet.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It is, and there are knights here who still find that hard, and I don't scold them for it, only for letting it slow their hand. The chapel stands on ground that refused the Scourge when everything around it fell, and I've never been sure whether that was the Light's doing, or the land's, or both." } },
      choices = {
        { text = "Both, I think. The Light and the land stand together.", next = "BACK", reply = "I believe so too, and I'm glad to hear it from you. The chapel welcomes both.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land did it alone. Your Light just took the credit.", next = "BACK", reply = "Perhaps it did, and the Light won't mind sharing. Neither will I.", fx = { align = { order = -1 } } },
        { text = "Something else, my lord.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_schard", tags = { "news" }, when = { gossip = { topic = "scarlet_crusade", stance = "hardline" } }, text = "Duke Zverenhoff says you'd break the Crusade outright. I may need that resolve before long, but I'd ask you to save it for those who won't yield." },
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 } },
          text = "A company of five at the chapel, and I'll not pretend I'm not counting swords, for the Dawn needs every one it can get in the east of Lordaeron." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at Light's Hope. The Dawn welcomes any who stand against the Scourge, and I suspect you grieve for these lands more openly than my knights do." },
        { id = "h_default", key = true,
          text = "Maxwell Tyrosus. I served in the Silver Hand once, and now I lead the Argent Dawn, since Lord Raymond George fell, and we fight the Scourge and anything else that would end this world. We ask no one which crown they serve." },
        { id = "h_summoned", tags = { "news" }, when = { questActive = TODO_QUEST("Lord Maxwell Tyrosus") },
          text = "The Duke sent you, so he trusts you, and Nicholas trusts very few. Sit; there's much to discuss, and Stratholme won't wait." },
        { id = "h_hold", when = { questActive = TODO_QUEST("The Argent Hold") },
          text = "The Argent Hold is open to you now. What's inside was made to be used against the dead, so use it." },
        { id = "h_quiet", when = { metBefore = true },
          text = "I walk the chapel at dawn, before the guards change, because it's the only hour the Plaguelands are quiet. I've come to treasure it." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, and welcome, {class}. We lost many of the Kirin Tor when Lordaeron fell, and those who came to the Dawn brought fire the Scourge still remembers." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You came in quieter than most of my knights, {class}, which shames them more than it ought to impress me, though it does both." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and welcome. Half my knights were squires of the Silver Hand who never took their oaths, {class}, and they could stand to watch a soldier who learned to fight without one." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter at Light's Hope. My scouts tell me the beasts of the Eastweald have gone strange, {class}, and I'd value an expert's eye on what it means." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and welcome to Light's Hope. The Dawn asks no one which crown they serve, {class}, and we've learned that the spirits of the land are as much the Scourge's enemy as the Light is." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. I left the Silver Hand when it became the Crusade, and I never imagined the Light would still answer the dead it failed to save, but here you stand, and I'm glad of it." },
      },
      again = { { id = "h_again", text = "What else? Speak freely; the chapel keeps no secrets from its own." } },
      choices = {
        { text = "Does the Dawn mean to heal the land, or only hold it?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You must have left the Silver Hand for a reason.", next = "left" },
        { text = "You don't seem a man who sought to lead the Dawn.", next = "lead" },
        { text = "Stratholme seems the heart of all this.", next = "stratholme" },
        { text = "The Silver Hand is gone. Where does a paladin belong now?", next = "paladin", when = { class = "PALADIN" } },
        { text = "My training ended when the Hand broke apart.", next = "squire", when = { origin = "human_paladin_squire" } },
        { text = "Gregor Greystone in Everlook sends his regards.", next = "gregor", when = { heardLine = "gregor.h_default" } },
        { text = "What does the Dawn need from a healer?", next = "priest_dawn", when = { class = "PRIEST" } },
        { text = "Will the Dawn take a warlock's help?", next = "x_warlock", when = { class = "WARLOCK" } },
        { text = "Ironforge sends you little, my lord. I came anyway.", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Why would Kirin Tor mages join the Dawn and not Dalaran?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'd guess the Argent Dawn has little use for rogues.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can a warrior serve the Dawn without the Light?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What strangeness have your scouts seen in the beasts?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Does the Dawn really take shamans, my lord?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Will the Argent Dawn welcome a Forsaken paladin, Lord Tyrosus?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "We came north to fight the Scourge, my lord.", next = "xpt_company", when = { party = { size = 4 } } },
        { text = "How can I help?", next = "END", fx = { affinity = 2, standing = { light_hope = 1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Dawn has a use for anyone who fights the Scourge, and you'd be surprised how many of our best scouts once picked locks for a living. I ask no one what they did before, only what they'll do now, and the dead in Stratholme give us plenty to do." } },
      choices = {
        { text = "The past shouldn't define anyone. I agree.", next = "BACK", reply = "It shouldn't, and here it doesn't. Welcome, {class}.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some pasts should still be answered for.", next = "BACK", reply = "Some should, aye, but not at my door. Answer for them to the Scourge, and we'll call it square.", fx = { align = { order = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some had nothing left in Dalaran to go back to, and some couldn't bear to watch from behind a dome while their families walked the fields as ghouls. The Dawn asks no one to choose a crown, so they came here and kept fighting." } },
      choices = {
        { text = "They did right. People come before institutions.", next = "BACK", reply = "They did, and the Dawn is richer for it. People are what we fight for.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Dalaran needed them too. They should have stayed.", next = "BACK", reply = "Perhaps, and Dalaran would agree. But they came here, and I'll not turn them away.", fx = { align = { order = 1 } } },
        { text = "Something else, Lord Tyrosus.", next = "BACK" },
      },
    },
    left = {
      big = true,
      lines = {
        { id = "l_default", key = true, text = "I didn't leave it; it left. The Hand I knew healed the sick and shielded the weak, and what became the Scarlet Crusade burns villages to save them. When they stopped asking whether someone was dead or only different, I walked away, and others came with me." },
      },
      choices = {
        { text = "You made the right choice.", next = "BACK", reply = "I believe so, though it cost me a great many friends. Thank you.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The Crusade's methods are harsh, but harsh times need them.", next = "BACK", reply = "Harsh, yes, and they burn their own to prove it. I'll not follow them into that.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "The Crusade does fight the Scourge.", next = "crusade" },
      },
    },
    crusade = {
      lines = {
        { id = "c_default", text = "It does, with fire and fear, at whatever cost. I won't call them enemies, and I won't call them friends; out here, that distinction matters less every year." },
      },
      choices = { { text = "I understand.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } } },
    },
    lead = {
      lines = { { id = "ld_default", text = "Lord Raymond George fell, and someone had to stand where he stood. I'd have chosen anyone else, but nobody else was offered." } },
      choices = {
        { text = "What was he like?", next = "lead_raymond" },
        { text = "Do your knights accept the Forsaken among them?", next = "op_forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lead_raymond = {
      lines = { { id = "lr_default", text = "Patient, and kind to fools, which I am not always. He'd have liked you; he liked anyone who came east of their own will." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    stratholme = {
      lines = { { id = "s_default", text = "The heart of the plague, still beating. The Scourge holds most of it, the Crusade holds a corner, and between them lies everything that once lived there. Duke Zverenhoff has plans, and so do I." } },
      choices = {
        { text = "Plans?", next = "stratholme_plans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stratholme_plans = {
      lines = { { id = "sp_default", text = "When you're ready to walk into that city and walk out again, I'll share them, and not before. I've buried enough of the merely brave." } },
      choices = {
        { text = "I've walked out of Stratholme already. Tell me.", tag = "Persuade", next = "stratholme_truth",
          check = { pass = { any = { { deed = "dungeon:Stratholme" }, { disposition = { min = 70 } }, { all = { { class = "PRIEST" }, { minLevel = 55 } } } } } },
          fail = { next = "stratholme_not_yet", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    paladin = {
      big = true,
      lines = { { id = "p_default", text = "Wherever the dead walk and someone stands against them. The Hand was a banner, but the Light was never in the banner; stand here long enough and you'll see it doesn't need one." } },
      choices = {
        { text = "Then I'll stand here.", next = "BACK", reply = "Then stand here, and you'll find the Light where you stand.", fx = { affinity = 3, align = { light = 2 }, standing = { light_hope = 2 } } },
        { text = "I still miss the banner.", next = "BACK", reply = "So do I, some nights, and there's no shame in it, because it flew over good men. But a banner can burn, and the Light we carried under it never once went out.", fx = { affinity = 1, trait = { kind = 1 }, align = { order = 1 } } },
      },
    },
    squire = {
      lines = { { id = "sq_default", text = "Then you're one of hundreds who were halfway to something when the ground fell away, so finish it here. The Dawn knights people; we just don't make a fuss about it." } },
      choices = {
        { text = "I'd like that.", next = "BACK", reply = "Then kneel, when you're ready, and we'll see it done properly.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "I'll fight beside the Dawn, but I don't need a title.", next = "BACK", reply = "Nor do any of us, truly. Fight beside us, and you'll be one of ours regardless.", fx = { align = { order = -1 } } },
      },
    },
    gregor = {
      lines = { { id = "g_default", text = "Good man, Gregor. He writes the longest reports in the Dawn and every word is useful, which is rarer than courage." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest_dawn = {
      lines = { { id = "pd2_default", text = "More than it needs swords. A sword stops the dead; a healer keeps the living from joining them. Stay a while at the chapel, priest, and Leonid and the wounded will both be glad of you." } },
      choices = {
        { text = "I'll stay a while.", next = "BACK", reply = "Thank you. Leonid will be glad, and so will the wounded.", fx = { affinity = 3, align = { light = 2 }, standing = { light_hope = 2 } } },
        { text = "The wounded will keep, and my place is out on the fields, burning the dead.", next = "BACK", reply = "Burn them, then, and bring back the wounded you find on the way. Both are the Dawn's work.", fx = { align = { light = -2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stratholme_truth = {
      big = true,
      lines = {
        { id = "st_default", text = "Then hear it as the Duke and I say it to each other: the Dawn hasn't the soldiers to take that city, and won't have them in my lifetime. So we send small companies like yours to cut the heads off, the Baron in his ziggurats first, and we pray the body falls after." },
        { id = "st_crusade", when = { deed = "dungeon:Stratholme" },
          text = "You've seen the Crusade's corner of it, so you'll understand the rest. I don't trust whatever holds that bastion any more than I trust the Baron, and I'd not say that in front of my officers, some of whom still have brothers in red." },
      },
      choices = {
        { text = "Then I'll go back in.", next = "BACK", fx = { affinity = 2, standing = { light_hope = 1 }, trait = { brave = 1 } } },
        { text = "Then the Crusade's leaders bear watching too.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stratholme_not_yet = {
      lines = {
        { id = "sn_default", text = "Saying you've walked out of a place and having done it are different things, and I've learned to wait for the second. Come back with the city's ash on your boots and ask me again." },
      },
      choices = { { text = "Then I'll bring you the ash.", next = "BACK" } },
    },
    x_warlock = {
      lines = {
        { id = "xw_default", text = "The Dawn will take help from anyone who stands against the Scourge and keeps their word, which is the very reason I left the Silver Hand when it stopped believing that. I ask only that you keep your demons outside these walls; this chapel has seen enough of things that do not belong here." },
      },
      choices = {
        { text = "My demons stay outside. You have my word.", next = "BACK", reply = "Thank you. Your word is enough for me.", fx = { affinity = 2, align = { honor = 1 }, standing = { light_hope = 1 } } },
        { text = "What I bring with me is my own affair, my lord.", next = "BACK", reply = "Within the chapel walls, it's mine. Keep them outside, or keep yourself outside with them.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_dwarf = {
      lines = {
        { id = "xd_default", text = "Ironforge has its own wars under the mountain, and I don't fault the dwarves who stayed; I honor the ones who came. Some of the steadiest guards on this wall have beards to their belts, and they curse the cold in a way I've come to find almost comforting." },
        { id = "xd_hand", when = { origin = "dwarf_silver_hand" }, text = "You trained with the Silver Hand, before it broke apart? Then you'll find more of your old order in this chapel than in all of the Crusade's halls, though fewer of us than I would like." },
      },
      choices = {
        { text = "Where do you need me, my lord?", next = "BACK", fx = { affinity = 1 } },
        { text = "I came for the Scourge, not for the Dawn.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Dawn's riders cover the whole Eastweald, and a fair part of what they hear reaches this chapel. These are the matters I can speak to with some authority." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've earned plain answers from me, and I don't give many. Ask me about any of these and I'll hold nothing back that the Dawn can spare." },
    },
    background = { { id = "tp_ba", text = "A paladin of the Silver Hand, until the Hand forgot what it was for. Now the Argent Dawn, which hasn't forgotten yet.", next = "left" } },
    advice = { { id = "tp_ad", text = "Carry the Dawn's tokens, and never fight the Scourge alone at night. It doesn't sleep, but you must." } },
    argent_dawn = { { id = "tp_dawn", text = "No crown and no warchief, only the work, and the dead who'd undo it." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "My old brothers, gone hard and blind. I pray for them, and I also post guards." } },
    scourge = { { id = "tp_scourge", text = "The Scourge holds Stratholme, Naxxramas and every field from here to the sea, and it doesn't need to sleep or eat. We hold one chapel on consecrated ground, and I've learned to be grateful for small things." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad rules the Scourge from his necropolis in the sky over the east, and his reach stretches across all of Lordaeron. The Dawn watches him, and we wait for the day we're strong enough to do more than watch." } },
    holy_light = {
      { id = "tp_holy_light", text = "The Light belongs to anyone who stands against the dark, whatever banner they march under. The Crusade forgot that, and I left the Silver Hand rather than forget it with them." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "You carry the Light, so carry it well, and don't let anyone tell you it belongs to them alone. The Crusade has made that mistake already." },
    },
    silver_hand = { { id = "tp_silver_hand", text = "I was a knight of the Silver Hand, and I left when it turned Scarlet. The order is broken now, and I've stopped hoping it'll mend." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken fight the Scourge as hard as anyone, and some of them stand with the Dawn. I judge them by their deeds, which is all I can do." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's people send good fighters to the Dawn, and they've never once given me cause to doubt them. I don't care whose crown they serve, only whether they'll stand." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme is the Scourge's great fortress in the east, and the Crusade wastes its soldiers on the gates. The Dawn will take it one day, but not yet." } },
    bolvar = { { id = "tp_bolvar", text = "Lord Bolvar sends what he can to the north, which is less than I'd like and more than I'd feared. He has a kingdom to hold, and I don't envy him." } },
    _none = { { id = "tp_none", text = "Not my concern while the Scourge stands." } },
  },
}

P:NPC {
  key = "leonid", id = TODO_NPC("Leonid Barthalomew the Revered"), name = "Leonid Barthalomew the Revered",
  bible = "bibles/easternplaguelands.md", role = "questgiver", tier = "quest",
  communities = { "light_hope", "argent_dawn" }, temper = { "gentle" }, values = { "devout", "selfless" },
  notices = { "race", "class", "form" },

  impression = {
    first = "Leonid Barthalomew apologized for his face before anything else. He is dead and knows it, and has decided to use that, with a calm I found more unsettling than any rage.",
    third = "{name} met Leonid Barthalomew the Revered, the undead priest who serves the Argent Dawn at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_hello", text = "Don't be alarmed by my face. The Light still hears me, whatever I've become." },
    { id = "g_xchapel", when = { origin = "forsaken_chapel_priest" }, text = "You preached in Lordaeron's chapels too, and the Light still answers you, though it hurts. It hurts me as well, friend, and I've come to think the hurting is how it tells us it's still there." },
    { id = "g_away", when = { away = 14 }, text = "You've returned after {away} away, and the Light kept you, as I prayed it would. Sit, and don't mind my face." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone here carries anger from a talk with you. Anger is a poor thing to bring into a chapel, so perhaps you'll seek them out." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear you brought someone at the chapel a little gladness. In this land that counts as a miracle, and I don't use the word lightly." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadow, at the chapel. The Dawn turns away no one who'll stand against the Scourge, but the wounded here have seen enough darkness. Step out of it when you visit them." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One who was freed, as I was. We owe the Banshee Queen our minds, but what we do with them is our own." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You serve the Light, and so do I. It surprises people; it surprised me most of all." },
  },

  start = "hello",
  nodes = {
    op_the_light = {
      big = true,
      lines = {
        { id = "optl_default", text = "I've wondered whether I'm the exception or the beginning of something. What do you think, {class}: can the Light truly belong to the dead as well as the living?" },
      },
      choices = {
        { text = "Yes. If it answers you, it can answer anyone.", next = "op_the_light_r1", fx = { affinity = 1, align = { light = 1 }, opinion = { the_light = "faith" } } },
        { text = "No. The Light abandoned the dead. You're an accident.", next = "op_the_light_r2", fx = { affinity = -1, align = { light = -1 }, opinion = { the_light = "abandoned" } } },
        { text = "It answers me too, Revered. You're not alone.", next = "op_the_light_r3", fx = { affinity = 2, trait = { pious = 1 }, opinion = { the_light = "faith" } }, when = { race = "Scourge", class = { "PRIEST", "PALADIN" } } },
        { text = "I don't know, Revered.", next = "BACK" },
      },
    },
    op_the_light_r1 = {
      lines = { { id = "optl_r1", text = "That's what I pray for, and it means a great deal to hear it from someone else. Perhaps I'm not the last, then, only the first." } },
      choices = { { text = "Something else, Revered.", next = "BACK" } },
    },
    op_the_light_r2 = {
      lines = { { id = "optl_r2", text = "Perhaps I am, and if so I'll be the most grateful accident in Lordaeron. It still answers, whatever the reason, and I'll not waste it." } },
      choices = { { text = "Something else, Revered.", next = "BACK" } },
    },
    op_the_light_r3 = {
      lines = { { id = "optl_r3", text = "Then the Light is kinder than I dared hope, and I've one more reason to stand at this altar. Thank you for telling me." } },
      choices = { { text = "Something else, Revered.", next = "BACK" } },
    },
    xpt_priest = {
      big = true,
      lines = { { id = "xpt_priest_default", text = "Because so many died here holding it, and died in faith, that the ground itself remembers, and the dead cannot rise where the Light has been paid for so dearly. I tell the young priests that the chapel is a prayer that never ended." } },
      choices = {
        { text = "Then faith is the strongest weapon we have against them.", next = "BACK", reply = "It is, and the dead fear it more than any blade. Hold to it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith didn't save those who died here. Better steel might have.", next = "BACK", reply = "Perhaps it might have, and I won't dismiss the thought. But faith kept the ground clean after they fell.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They trust my blade, which is more than I expected, but they won't share a fire with me. I understand it, for a soldier who has fought the Scourge for years learns to strike at anything that looks like me, and that instinct has kept them alive." } },
      choices = {
        { text = "I'll judge you by your deeds, Leonid, not by your face.", next = "BACK", reply = "Thank you, {class}. That's more than I hoped for.", fx = { align = { light = 1 } } },
        { text = "I'm with your soldiers. The dead get no place at my fire.", next = "BACK", reply = "Then sit with them, and I'll keep my fire on the other side. I understand.", fx = { align = { light = -1 } } },
        { text = "Something else, Revered.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They can't, and they're right not to try, for I smell exactly as the Scourge smells. I've been bitten twice by the Dawn's own horses, and I took it as a compliment to their training." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is growling at me, {class}, and I'd ask you not to quiet it. A beast that hates the smell of the plague is a sentry worth keeping." },
      },
      choices = {
        { text = "My beast will learn to tell friend from foe, given time.", next = "BACK", reply = "I hope so. It would be a kindness to both of us.", fx = { align = { order = 1 } } },
        { text = "My beast's instincts are sound. I'll let it growl.", next = "BACK", reply = "Wise of you. The horses have the same instinct, and I've the bites to prove it.", fx = { align = { order = -1 } } },
        { text = "Something else, Revered.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "It feels like kinship, which is the cruellest thing the Scourge left me. The plague in the soil and the plague in my bones answer to the same masters, and I mean to see both cut off from them." } },
      choices = {
        { text = "Then turn what you are against it.", next = "BACK", reply = "That's what I mean to do. If the Scourge made me, then I'll be its undoing.", fx = { align = { light = 1 } } },
        { text = "What's made of plague can never cleanse it.", next = "BACK", reply = "Perhaps not, but I'll try all the same. The Light has worked stranger things.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the Banshee Queen gave me back my mind, and I didn't think it right to hand it straight back to her. I owe her my freedom, and I'll never speak against her, but the Dawn fights the Scourge for everyone, and that's a cause I can carry without looking over my shoulder." } },
      choices = {
        { text = "A free mind should serve the many. You chose well.", next = "BACK", reply = "Thank you. I'll serve them as well as I can.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You owe the Dark Lady more than you've given her.", next = "BACK", reply = "Perhaps I do, and I'll repay her when the Scourge is gone. For now, the Dawn needs me.", fx = { align = { light = -1 } } },
        { text = "Something else, Revered.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I've asked two shamans that, and one turned away and the other wept, so I've stopped asking. I think the land knows what was done to me, and knows I didn't choose it, and I take some comfort in thinking it holds no grudge, even if I can't be sure." } },
      choices = {
        { text = "The land holds no grudge. You chose your path well.", next = "BACK", reply = "Thank you. I'll hold on to that, on the nights it's hardest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead belong in the earth, Revered. Even you.", next = "BACK", reply = "Perhaps I do, and perhaps one day I'll go. But not until the Scourge goes first.", fx = { align = { light = -1 } } },
        { text = "Something else, Revered.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_tlaband", tags = { "news" }, when = { opinion = { topic = "the_light", stance = "abandoned" } }, text = "They tell me you've decided the Light abandoned the dead. I won't argue with you; I'll only ask you to watch what happens at this altar." },
        { id = "o_fkdistrust", tags = { "news" }, when = { gossip = { topic = "forsaken", stance = "distrust" } }, text = "I'm told you'd rather the dead kept away from the Dawn. I understand, and I'll try to be useful all the same." },
        { id = "h_pt_priest", tags = { "news" }, when = { party = { class = "PRIEST" } },
          text = "{companion} has the look of a priest, and you've brought them to the one chapel in all of Lordaeron where the Scourge has never set foot. Kneel a while, both of you, if you've the time; this ground has a way of mending more than wounds." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid. I was told your kind can feel the sickness in the earth, and I wonder whether you feel it in me too, for I am made of the same plague." },
        { id = "h_default", key = true,
          text = "Leonid Barthalomew. I died in the Scourging and rose a mindless thing, until the Banshee Queen freed my mind, and I gave it to the Argent Dawn. My undeath is a sickness, but it is also a weapon, and I mean to use it." },
        { id = "h_ras", when = { metBefore = true },
          text = "I was in Stratholme when Ras Frostwhisper became what he is. I remember his face as it changed. I'd like very much for him to stop." },
        { id = "h_sacrifice", when = { metBefore = true },
          text = "They call me Revered, though I'd rather they didn't. I only did what anyone would, if they'd already lost everything else." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock. The Dawn's living members flinch at us both, {class}, but I think the Scourge flinches more, and that is all I ask of my own darkness." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Forgive my face, {class}, for the plague took it before the Banshee Queen gave me back my mind, and mages in particular tend to stare." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You needn't grip your sword so tightly, {class}, for I am dead, but I am on your side, and the dead of Light's Hope are the only ones you may safely turn your back on." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. The beasts of these lands flinch from me as they would from any Scourge, {class}, so don't be alarmed if your companions bare their teeth." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You walk quietly, {class}, like the Deathstalkers who came looking for me after I joined the Dawn. I sent them away, but gently, for they were only doing what the Banshee Queen asked." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, here in the chapel. The spirits must find me a puzzle, {class}, for I'm dead and the Light answers me anyway, and I'm not sure I understand it either." },
      },
      again = { { id = "h_again", text = "Yes? I have time; it's one of the few things the dead have plenty of." } },
      choices = {
        { text = "Do you feel the blight in the land, Leonid?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd not have thought the Light would answer you.", next = "light" },
        { text = "I'd have expected you to serve the Banshee Queen.", next = "why" },
        { text = "Who is Ras Frostwhisper?", next = "ras", when = { heardLine = "leonid.h_ras" } },
        { text = "We're the same, you and I.", next = "forsaken", when = { race = "Scourge" } },
        { text = "The Light answers me too, Revered.", next = "x_paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "Do you see your undeath as a weapon too?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What does the Dawn ask of its mages, Leonid?", next = "xmage", when = { class = "MAGE" } },
        { text = "The Dawn's living soldiers can't trust you easily, Leonid.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "I doubt beasts can tell you aren't Scourge, Leonid.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why didn't you join the Deathstalkers, Revered?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "How do the spirits see you, Revered?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why has the Scourge never taken this chapel?", next = "xpt_priest", when = { party = { class = "PRIEST" } } },
        { text = "I'd like to help the Dawn, if you'll have me.", next = "END", reply = "The Dawn will have you gladly, {class}. Tell the quartermaster I sent you, and walk in the Light.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll work with the dead when I must, but I won't trust them.", next = "END", reply = "That is fair, and I will not ask more of you. Go in the Light, whatever you think of me.", fx = { align = { light = -1 } } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Fire, mostly, and patience, for the Scourge in Stratholme and the Plaguewood rebuild their ranks faster than we burn them. A mage who keeps burning after the hundredth ghoul is worth ten who burn brightly once and go home." } },
      choices = {
        { text = "Then I'll keep burning, as long as it takes.", next = "BACK", reply = "Good. The hundredth ghoul is where most mages give up.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "One great blow is worth a hundred small ones.", next = "BACK", reply = "Perhaps, if you can find one. The Scourge never gives us one place to strike.", fx = { align = { order = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I do, for the plague cannot sicken what is already dead, and I walk where living knights would choke. Your demons are a weapon too, and I would only ask what I ask of myself, that you remember who you are when the weapon starts to feel like you." } },
      choices = {
        { text = "I know who I am. The darkness doesn't change that.", next = "BACK", reply = "Good. Hold on to that, and the darkness will be only a tool.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Maybe the weapon is who I am now.", next = "BACK", reply = "Then I'll pray it's a weapon pointed the right way. Be careful.", fx = { align = { light = -1 } } },
        { text = "Something else, Leonid.", next = "BACK" },
      },
    },
    light = {
      lines = {
        { id = "l_default", text = "It burns, a little, like warmth on frostbitten hands. I've decided the burning is the Light reminding me what I'm for." },
      },
      choices = {
        { text = "Can the Light belong to the dead as well?", next = "op_the_light" },
        { text = "That's beautiful, and terrible.", next = "BACK", fx = { affinity = 3 } },
      },
    },
    why = {
      big = true,
      lines = { { id = "w_default", text = "She gave me back my mind, and I'm grateful, but I'd rather spend it ending the Scourge than settling scores. The Dawn has no other cause, and that suits me." } },
      choices = {
        { text = "Does she know?", next = "why_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_know = {
      lines = { { id = "wk_default", text = "I imagine the Banshee Queen knows more than she says. She hasn't come for me, and I take that as permission, or indifference. Either serves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ras = {
      lines = { { id = "r_default", text = "A man I knew, once, who wanted to live forever and found a way that cost everything worth living for. He teaches in Scholomance now, and I'd like his lessons to end." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "f_default", text = "In what we are, yes; in what we choose, we'll see. Choose well, and you'll find the living here are kinder than you expect, some of them." } },
      choices = {
        { text = "I'll choose well.", next = "BACK", reply = "Good. I'll be glad to see it.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll choose what keeps me standing, and kindness rarely does.", next = "BACK", reply = "It does, sometimes, more than you'd think. I'll hope you find that out.", fx = { align = { light = -1 } } },
      },
    },
    x_paladin = {
      lines = {
        { id = "xp_default", text = "Then we are two of a strange kind, you and I, and I am glad of the company. The living will tell you it should not be possible, and some mornings I think they are right, but the warmth comes anyway, and I have stopped asking it why." },
      },
      choices = {
        { text = "The Light judges what we do, not what we are.", next = "BACK", reply = "I believe so, and it's the only thing that lets me rise each morning.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Perhaps it isn't the Light that answers us.", next = "BACK", reply = "Perhaps not, but something does, and it hasn't failed me yet.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've had a long death and a short second life to learn things in, and I'll share what I can. Ask me about any of these, friend." },
    },
    background = { { id = "tp_ba", text = "I lived, I died in Stratholme, and I rose. The third life is the one I mean to spend well.", next = "why" } },
    advice = { { id = "tp_ad", text = "If you're bitten, go to a priest at once, not tomorrow, at once." } },
    argent_dawn = { { id = "tp_dawn", text = "They took me in when no one else would have. I'll serve them until there's nothing left to serve with." } },
    scourge = { { id = "tp_scourge", text = "The Scourge made me what I am, and I've decided to use it against them. My face frightens the living, but it doesn't frighten the dead, and that's useful." } },
    holy_light = { { id = "tp_holy_light", text = "The Light still warms my hands, even now, and I don't understand why. I've stopped asking and started using it." } },
    forsaken = { { id = "tp_forsaken", text = "I'm not Forsaken, though I'm dead as they are. I serve the Dawn, and the Dawn doesn't ask what I am, only what I'll do." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad made me a servant of the Scourge, for a time. I'd like to return the favor, if I ever get close enough." } },
    stratholme = { { id = "tp_stratholme", text = "The Scourge marched me through Stratholme's streets more than once, though I remember little of it. I would rather not remember more." } },
    _none = { { id = "tp_none", text = "I don't know, friend. I know the Scourge, and that's knowledge enough for one unlife." } },
  },
}
