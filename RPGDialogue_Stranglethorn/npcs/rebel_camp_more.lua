-- The Rebel Camp, the rest of the roster: Corporal Sethman (keeps the patrol schedules), Private Merle (a rebel soldier,
-- and in canon the camp's traitor, which these lines never say) and Corporal Bluth (camp trader).
-- Voice: bibles/rebel_camp_more.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Corporal Sethman
---------------------------------------------------------------------------
P:NPC {
  key = "sethman", id = TODO_NPC("Corporal Sethman"), name = "Corporal Sethman",
  bible = "bibles/rebel_camp_more.md", role = "soldier", tier = "quest",
  communities = { "rebel_camp" }, temper = { "fussy", "dutiful" }, values = { "order", "loyal" },
  notices = { "kit", "soldier" },

  impression = {
    first = "He never puts down his ledger, and my name is in it.",
    third = "{name} spoke with Corporal Sethman, who keeps the patrol rosters at the Rebel Camp and remembers who walked with whom.",
  },

  greetings = {
    { id = "g_default", text = "Name and business, please, and spell the name, because I've had three Thomases this month and I'm not having a fourth." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. You're in my ledger, so you're welcome, more or less." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}. I'd marked you as missing on the river road, and I'm glad to cross it out again." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in a worse state than our stores, and that's saying something. Corporal Bluth, who keeps our stores, might have a strap or two, if you're polite to him." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You stand like you've stood a watch or two. Good, then you'll understand why I write everything down." },
  },

  start = "hello",
  nodes = {
    dd_seth_k = {
      lines = {
        { id = "dd_seth_k_a", text = "Over for him, maybe, but his men are still out there in the jungle, the ones who followed him into madness, and some of them were my friends. What do we do with them now?" },
      },
      choices = {
        { text = "Bring back the ones who'll come. Mercy for those who want it.", next = "dd_seth_k2", fx = { align = { light = 1 } } },
        { text = "They chose Kurzen. Hunt them down like he would have.", next = "dd_seth_k2", fx = { align = { light = -1 } } },
      },
    },
    dd_seth_k2 = {
      lines = {
        { id = "dd_seth_k2a", text = "I'll write that down in the margin, and Doren can decide, because that's his job and not mine. But I'll sleep better tonight knowing the man at the top of it is gone." },
      },
      choices = { { text = "Something else, Corporal.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "dd_kurzen_seth", tags = { "news" }, when = { questDone = TODO_QUEST("Colonel Kurzen") },
          text = "Lieutenant Doren says Colonel Kurzen's dead, and he says you did it. I've crossed his name off the patrol ledger, and I'll admit my hand shook a bit, because I took my orders from that man for six years." },

        { id = "h_default", key = true,
          text = "Corporal Sethman. I keep the patrol schedules for the Lieutenant, who walks where and when, and with whom. In a camp this small, the roster is the only thing standing between us and Kurzen's men walking in at supper." },
        { id = "h_patrol", tags = { "news" }, when = { questActive = TODO_QUEST("Patrol Schedules") },
          text = "The Lieutenant sent you about the roster? Then you know what he's asking, and you know I'll not shout the answer across a camp with a traitor in it. Come closer, and keep your voice down." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Doren") },
          text = "You have what you need, so take it to the Lieutenant and nobody else. Walk normally, and don't look at anyone as you go." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("Report to Doren") },
          text = "The Lieutenant has the name now, and it's his to deal with. I've gone back to my ledger, and I find I don't sleep much better for knowing." },
        { id = "h_secrets", when = { questActive = TODO_QUEST("Jungle Secrets") },
          text = "You're looking into what happened to Private Thorsen? He walked his last patrol with someone from this camp, and that someone talked. I've the roster, if the Lieutenant ever asks for it." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a roster to finish before the dusk watch." },
        { id = "h_again2", text = "Go on. Quietly, if you please." },
        { id = "h_again3", text = "What else? Mind the ink." },
      },
      choices = {
        { text = "Kurzen is dead, Corporal. It's over.", next = "dd_seth_k", when = { questDone = TODO_QUEST("Colonel Kurzen") } },

        { text = "Why does a rebel camp need so much paperwork?", next = "ledger" },
        { text = "Who patrolled with Thorsen?", next = "thorsen" },
        { text = "What were you, before the jungle?", next = "before" },
        { text = "How do the men feel about the spy?", next = "camp" },
        { text = "Do you track who's on watch at night?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll leave you to your ledger.", next = "END" },
      },
    },

    ledger = {
      lines = { { id = "le_default", text = "Because the Colonel kept none, at the end, and men started disappearing without anyone knowing when. When we walked away from Kurzen I swore that every soldier in this camp would have his name written down, so that if he goes missing, somebody knows the hour." } },
      choices = {
        { text = "The Colonel kept no records?", next = "kurzen_records" },
        { text = "Something else, Corporal.", next = "BACK" },
      },
    },
    kurzen_records = {
      big = true,
      lines = { { id = "kr_default", text = "He kept them in the first months, neat as a quartermaster. Then he burned them in a pot one night and told us the jungle didn't need to know our names, and the men around him cheered, and that's the night I started thinking about leaving." } },
      choices = {
        { text = "An army without records is a mob. You were right to leave.", next = "BACK", reply = "That's what I told myself the night I walked out, and I've kept a roster every day since. A man with a name can be counted, and a man who's counted can be missed.", fx = { align = { order = 1 }, learn = { "kurzen" } } },
        { text = "Maybe he was right. Names are only a leash.", next = "BACK", reply = "A leash, maybe, but it's also how your mother learns where you're buried. I'll keep writing them down, even if the jungle doesn't care.", fx = { align = { order = -1 }, learn = { "kurzen" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thorsen = {
      lines = {
        { id = "th_default", text = "That's for the Lieutenant to ask and for me to answer, and I'll not say it to a stranger in the open. If Doren sends you with a note, it's a different matter." },
        { id = "th_patrol", when = { questActive = TODO_QUEST("Patrol Schedules") },
          text = "Here, I've copied out last week's roster for the Lieutenant. Don't read it on the way, and if anyone asks what you're carrying, it's a requisition for boot nails." },
        { id = "th_done", when = { questDone = TODO_QUEST("Report to Doren") },
          text = "You carried the roster yourself, so you know as much as I do. I'd rather we both kept it behind our teeth until the Lieutenant says otherwise." },
      },
      choices = {
        { text = "You don't trust anyone here, do you?", next = "trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "tr_default", text = "I trust my ledger. Every man in this camp walked out on the Colonel, and one of them walked back in at night, and I sat at supper with all of them. You'd keep a ledger too." } },
      choices = {
        { text = "I'd keep a sharper knife.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "That must be a lonely way to live.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },

    before = {
      lines = { { id = "be_default", text = "A clerk in the Stormwind barracks, copying out pay records for men who were off fighting somewhere I'd never see. I asked to join an expedition so I could see one, and I got Kurzen's, so you might say the Light has a sense of humor." } },
      choices = {
        { text = "Do you want to go home?", next = "home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Every night. But Stormwind would call us deserters, and the Lieutenant says we'll go home when the Colonel's finished and not a day sooner. I've the date already written in the ledger, in pencil." } },
      choices = {
        { text = "Then let's make that date come sooner.", next = "BACK", fx = { affinity = 1, standing = { rebel_camp = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    camp = {
      big = true,
      lines = { { id = "ca_default", text = "Quiet. Too quiet, because everyone's watching everyone and nobody says it. Some of the men want the Lieutenant to line us all up and question us one by one, and some say that's just what Kurzen would do." } },
      choices = {
        { text = "Question everyone. One traitor can kill the whole camp.", next = "BACK", reply = "You sound like half the camp, and maybe half the camp is right. But line us up like prisoners and you might lose more good men than one traitor ever could.", fx = { align = { light = -1 } } },
        { text = "Find the traitor without treating every man like one.", next = "BACK", reply = "That's the hard way and the right one, I think, and the Lieutenant agrees. Keep your eyes open, though, because I can't watch every tent at once.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rogue = {
      lines = { { id = "rg_default", text = "Every watch, every hour, and who relieved whom. If you're thinking of slipping out past the sentries at night, don't, because I'll know by morning, and so will the Lieutenant." } },
      choices = {
        { text = "I was thinking of slipping in, Corporal.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    kurzen = { { id = "tp_kurzen", text = "I have his last order of the day written down, from the morning before we left. I read it sometimes, and it still makes sense, which is the worst of it." } },
    _none = { { id = "tp_none", text = "I don't have that in the ledger. Ask the Lieutenant, or Brother Nimetz if it's something holy." } },
  },
}

---------------------------------------------------------------------------
-- Private Merle
---------------------------------------------------------------------------
P:NPC {
  key = "merle", id = TODO_NPC("Private Merle"), name = "Private Merle",
  title = "Rebel Soldier",
  bible = "bibles/rebel_camp_more.md", role = "soldier", tier = "quest",
  communities = { "rebel_camp" }, temper = { "friendly", "guarded" }, values = { "survival" },
  notices = { "class" },

  impression = {
    first = "He is friendly and asks a great deal about where I walk.",
    third = "{name} shared a fire with Private Merle, a rebel soldier who left Colonel Kurzen with the others, or says he did.",
  },

  greetings = {
    { id = "g_default", text = "Sit down, friend, sit, the fire's the only dry place in this camp and you look like you've walked the river road." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Where have you been walking, then? Anything stirring out by the Colonel's camp?" },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You move quiet, friend. Quieter than most who come through here, and I notice that sort of thing, being on the watch so often." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Private Merle, and glad to know you. I came into this jungle with the Colonel same as the rest, and walked out with the Lieutenant same as the rest, and now I mostly stand watch and wait for something to happen." },
        { id = "h_secrets", tags = { "news" }, when = { questActive = TODO_QUEST("Jungle Secrets") },
          text = "You're asking around about Private Thorsen, aren't you? Terrible business, him getting caught like that. Did the Lieutenant say who he thinks did it?" },
        { id = "h_herod", when = { questActive = TODO_QUEST("Bookie Herod") },
          text = "Bookie Herod? I've heard the name, everyone has. Some of the lads used to put a few coppers on cards with him, back before, and I couldn't say who still does." },
        { id = "h_patrol", tags = { "news" }, when = { questActive = TODO_QUEST("Patrol Schedules") },
          text = "Off to see Sethman, are you? He'll bury you in paper, that one. Here, sit a moment first, there's no hurry, is there?" },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("Report to Doren") },
          text = "The Lieutenant's been looking at me strangely since you brought him that roster. I expect he looks at everyone strangely now, doesn't he?" },
      },
      again = {
        { id = "h_again", text = "What else, friend? I've nowhere to be till the watch changes." },
        { id = "h_again2", text = "Go on, I like the company, and it's a long night out here." },
      },
      choices = {
        { text = "Why did you leave Kurzen?", next = "leave" },
        { text = "Do you know Private Thorsen well?", next = "thorsen" },
        { text = "You ask a lot of questions, Merle.", next = "questions" },
        { text = "What do you think of the Lieutenant?", next = "doren" },
        { text = "That isn't river mud on your boots, Merle.", next = "boots", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "Good night, Merle.", next = "END" },
      },
    },

    leave = {
      lines = { { id = "le_default", text = "Same as everyone, friend: the Colonel went strange and the Lieutenant didn't, and a man who isn't hearing voices is the better one to follow. That's the right answer, isn't it? It's the one everyone gives." } },
      choices = {
        { text = "It's a strange way to put it.", next = "leave_odd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave_odd = {
      lines = { { id = "lo_default", text = "Is it? I'm not one for speeches, that's all. The Colonel gave good speeches, mind, better than the Lieutenant's, and some nights out there I miss them." } },
      choices = {
        { text = "Careful who hears you say that.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thorsen = {
      lines = {
        { id = "th_default", text = "We walked a few patrols together, same as most of the camp. Brave lad, Thorsen, going into the Colonel's camp alone like that, and brave isn't always the same thing as clever, is it?" },
        { id = "th_spy", when = { questActive = TODO_QUEST("The Spy Revealed!") },
          text = "A note, you say, signed with a letter? Could be anyone, friend. Half the men here can't write their own names, and the other half write them badly." },
      },
      choices = {
        { text = "What do you mean by that?", next = "thorsen_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thorsen_more = {
      big = true,
      lines = { { id = "tm_default", text = "Only that he told too many people where he was going and when, and talk travels in a camp like this. I'm not blaming him, mind, but if I'd been the one going in, I'd have kept my mouth shut." } },
      choices = {
        { text = "Thorsen trusted his comrades. That's no crime.", next = "BACK", reply = "You're right, and I'd never say different over his grave. He was a good man, and good men trust people, more's the pity.", fx = { align = { honor = 1 } } },
        { text = "He should have trusted no one. That's how spies live.", next = "BACK", reply = "That's how I'd have done it, but then nobody ever called me a hero. Out here the quiet ones live longest, I reckon.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    questions = {
      lines = { { id = "qu_default", text = "Do I? It's the watch, friend, it gets into you. You stand out there all night listening for the Colonel's men, and when someone finally comes along to talk to, you want to know everything." } },
      choices = {
        { text = "Of course. The nights must be long.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll keep my answers short, then.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    doren = {
      lines = { { id = "do_default", text = "A good man, a careful man. Too careful, some say, sitting here in the mud when he could have marched on the Colonel months ago. But I'm only a private, and nobody asks a private." } },
      choices = {
        { text = "Who says he's too careful?", next = "doren_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boots = {
      lines = { { id = "bo_default", text = "Isn't it? The river runs red up past the falls, friend, everyone knows that, from the clay. You've sharp eyes, I'll give you that, and I'd keep them on the jungle rather than on a tired man's boots." } },
      choices = {
        { text = "My mistake. Red clay, then.", next = "BACK" },
        { text = "I'll keep my eyes where I like.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    doren_who = {
      lines = { { id = "dw_default", text = "Oh, nobody in particular, it's just talk around the fire. Forget I said it, friend, and don't go repeating it to the Lieutenant, he's enough on his mind." } },
      choices = {
        { text = "I'll forget it.", next = "BACK" },
        { text = "I might mention it, Merle.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    kurzen = { { id = "tp_kurzen", text = "The Colonel? A great man once, they say, and maybe still. Not that I'd know, friend, I've been here with the rest of you." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. But tell me, where did you hear about it?" } },
  },
}

---------------------------------------------------------------------------
-- Corporal Bluth, camp trader
---------------------------------------------------------------------------
P:NPC {
  key = "bluth", id = TODO_NPC("Corporal Bluth"), name = "Corporal Bluth",
  title = "Camp Trader",
  bible = "bibles/rebel_camp_more.md", role = "vendor", tier = "service",
  communities = { "rebel_camp" }, temper = { "weary", "wry" }, values = { "thrift", "loyal" },
  notices = { "kit", "purse" },

  impression = {
    first = "He apologizes for his prices before you have seen them.",
    third = "{name} traded with Corporal Bluth, who keeps what little the Rebel Camp has to sell.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and I'm glad of it, though I'm sorry the shelves haven't grown since you left. You're one of the few who never complains." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'm sorry about the prices, as always, but today I'm not very sorry, if I'm honest." },
    { id = "g_default", text = "Camp stores, such as they are. If you need it and I have it, it's yours for coin, and if I don't have it, it's probably in Booty Bay at twice the price." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and I've still not restocked, before you ask." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Light, look at the state of you. I can sell you food and arrows, but for that armor you want a smith, and the nearest is in Booty Bay." },
    { id = "n_purse", cat = "purse", when = { money = { max = 500 } },
      text = "Short on coin? Join the camp, then. None of us have been paid since the Colonel stopped writing to Stormwind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "dd_deaths_bluth", when = { deaths = { min = 15 } },
          text = "Sorry about the prices, but you've died out there often enough that I suspect you'll be back for more bandages before the week's out. The jungle takes everyone eventually, but it seems to like taking you over and over." },

        { id = "h_default", key = true,
          text = "Corporal Bluth, and I keep the stores for the Rebel Camp, which mostly means I keep count of how little we have left. Food, water, arrows and shot, and a few odds and ends the men bring back from the river." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! You'll want arrows or shot, and I've a little of each, though the damp gets into the powder if you leave it in the pack too long." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm counting tins, and I keep losing my place." },
        { id = "h_again2", text = "What else? The stores aren't going anywhere, more's the pity." },
      },
      choices = {
        { text = "Share the stores fairly, even if an officer asks for more.", next = "BACK", reply = "I do, and Lieutenant Doren's never asked for more than his share, to his credit. The men see that, and it matters.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Keep a private stash; the camp won't miss a little.", next = "BACK", reply = "The camp would miss it, believe me; I count every arrow twice. And I'd never look the men in the eye again.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Where do your supplies come from?", next = "supply" },
        { text = "How does the camp eat, out here?", next = "eat" },
        { text = "Why did you leave Kurzen's command?", next = "why" },
        { text = "Nobody's been paid? How does the camp hold together?", next = "pay" },
        { text = "Your powder's damp. Let me show ye how to keep it.", next = "powder", when = { race = "Dwarf" } },
        { text = "Does Brother Nimetz have help with the wounded?", next = "nimetz", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Nothing for now.", next = "END" },
      },
    },

    supply = {
      big = true,
      lines = { { id = "su_default", text = "From the goblins in Booty Bay, mostly, at goblin prices, and from whatever we take off the Colonel's supply runs. The Lieutenant doesn't like that second part, but a man can't eat principles, and Kurzen's crates are full of good Stormwind biscuit." } },
      choices = {
        { text = "Take what you need from Kurzen. He owes you that much.", next = "BACK", reply = "My thinking exactly, and I've told the Lieutenant as much. Every crate the Colonel loses is one less he can use to keep his deserters fed.", fx = { align = { honor = -1 } } },
        { text = "Stealing makes you no better than him. Buy what you need.", next = "BACK", reply = "Tell that to the lads with no boots, friend. I'll buy what I can at goblin prices, but the Colonel's stores are closer and a good deal cheaper.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "The Colonel brought us down here to fight the trolls, and for a while that's what we did. Then he changed, and men went into his compound and didn't come out the same, and one night the Lieutenant said he was leaving and asked who'd come." } },
      choices = {
        { text = "Changed how?", next = "wh_changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wh_changed = {
      lines = { { id = "whc_default", text = "Quieter, and colder, and he stopped looking at a man when he gave an order. There was talk of things in the dark of his compound that weren't soldiers, and I was the one counting the rations, so I noticed when the men started eating less and staring more." } },
      choices = {
        { text = "Do you think he can be saved?", next = "wh_saved" },
        { text = "Something else.", next = "BACK", fx = { learn = { "kurzen" } } },
      },
    },
    wh_saved = {
      lines = { { id = "whs_default", text = "The Lieutenant still hopes so, some nights, and I don't argue with him. Me, I think whatever's in that compound wants us all, and the kindest thing we could do for the Colonel is end it." } },
      choices = {
        { text = "He was your commander. Bring him home for trial.", next = "BACK", fx = { align = { order = 1 } },
          reply = "If we can, aye. Stormwind would want its answers. I just doubt they'd like them." },
        { text = "Kill him and be done. Orders died with his mind.", next = "BACK", fx = { align = { order = -1 } },
          reply = "That's what half the camp says when the Lieutenant isn't listening. Light help me, I'm one of them." },
        { text = "Something else.", next = "BACK", fx = { learn = { "kurzen" } } },
      },
    },

    pay = {
      lines = { { id = "pa_default", text = "Stubbornness, mostly, and the Lieutenant. Doren doesn't promise us anything he can't give, which in this jungle makes him the most trustworthy man south of Westfall, so we stay." } },
      choices = {
        { text = "Has anyone tried writing to Stormwind?", next = "pa_write" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pa_write = {
      lines = { { id = "paw_default", text = "Corporal Sethman writes a report every week and sends it with the Booty Bay boats, and every week nothing comes back. Either the letters sink, or someone in Stormwind reads 'deserters' at the top and stops there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    powder = {
      lines = { { id = "po_default", text = "Would you? Light bless you, master dwarf, half my shot misfires and the hunters blame me for it. Show me, and I'll pass it on to the men, and maybe the trolls will stop laughing at us." } },
      choices = {
        { text = "Wax-sealed horn, kept close to the body. Simple.", next = "BACK", fx = { affinity = 1 },
          reply = "Close to the body. Of course. I've been keeping it in the crates, under the tarp, like a fool." },
        { text = "Something else.", next = "BACK" },
      },
    },

    nimetz = {
      lines = { { id = "ni_default", text = "None, {class}, and he could use it. He prays over every man who comes back cut, and he does it well, but there's one of him and a jungle full of spears. If you've a spare hour, he'd take it without a word of thanks, and mean the thanks all the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    eat = {
      lines = { { id = "ea_default", text = "Badly. Boar when the hunters are lucky, fish when the river is kind, and Stormwind biscuit when neither is. Brother Nimetz blesses it all before supper, and I've noticed it doesn't help the biscuit." } },
      choices = {
        { text = "I'll bring back meat if I find any.", next = "BACK", fx = { affinity = 1, standing = { rebel_camp = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. Ask Sethman, he writes everything down." } },
    kurzen = { { id = "tp_kurzen", text = "He changed, and men went into his compound and came out wrong. That's why we left." } },
    doren = { { id = "tp_doren", text = "He never promises what he can't give. That's why we stay." } },
    advice = { { id = "tp_ad", text = "Keep your powder dry and your boots on. The river leeches don't sleep." } },
  },
}
