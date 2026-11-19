-- Durotar folk the roster scan found missing, part one: the Den's Nartok (warlocks), Rwag (rogues) and
-- Hraug (demon grimoires), the Valley of Trials' Huklah (cloth and leather) and Rarc (armor and shields),
-- and Razor Hill's Magga (voucher keeper), Ophek (Gan'rul's messenger), Rawrk (bandages) and the wounded
-- Grunt Kor'ja on the south road. Voices: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Rwag: rogue trainer in the Den; doesn't trust Nartok.
P:NPC {
  key = "rwag", id = TODO_NPC("Rwag"), name = "Rwag", title = "Rogue Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "sly", "guarded" }, values = { "cunning", "loyal" },
  notices = { "stealth" },
  impression = {
    first = "Rwag stands at the back of the Den where the light gives out, and he sees everyone who comes in before they see him. He trains the Valley's rogues, and he keeps one eye on the warlock by the door.",
    third = "{name} met Rwag of the Shattered Hand, who trains rogues in the Den.",
  },
  greetings = {
    { id = "g_default", text = "You walked in loudly enough, {class}. I heard you from the second torch, and so did everything else in this cave." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Softer than most, but I still heard your left foot. We'll work on that, if you last." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. You're getting quieter, or I'm getting old, and I know which one I'd bet on." },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I can see you, you know. It was a fair try, and it would have fooled a grunt, but I am not a grunt." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_parch", when = { questActive = TODO_QUEST("Encrypted Parchment") },
          text = "You read the parchment, then, or enough of it to find me. That was the first test, and plenty of young ones never get past it." },
        { id = "h_default", text = "I'm Rwag, and I teach the ones who'd rather end a fight before it starts. The Horde has plenty of orcs who'll charge a wall, and it needs a few who'll find the door." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down when you ask it." },
        { id = "h_again2", text = "Go on. I'm listening, and so is the cave." },
      },
      choices = {
        { text = "Is there honor in fighting from the shadows?", next = "honor" },
        { text = "You keep watching the warlock.", next = "nartok" },
        { text = "What's worth a rogue's time in this valley?", next = "valley" },
        { text = "What does the Shattered Hand want of me?", next = "hand", when = { class = "ROGUE" } },
        { text = "I'll go quietly.", next = "END" },
      },
    },
    honor = {
      lines = { { id = "ho_default", text = "A warrior asks that, and then he asks me to scout the camp he's about to charge. Honor is keeping faith with your own, {class}, and I've never once broken it, whatever I've done to the other side's sentries." } },
      choices = {
        { text = "And who are your own?", next = "honor2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    honor2 = {
      lines = { { id = "ho2_default", text = "The Shattered Hand, who serve the Warchief out of sight so the grunts can serve him in the sun. We answer to Orgrimmar, and the ones who forget that don't stay among us long." } },
      choices = {
        { text = "What happens to the ones who forget?", next = "honor3" },
        { text = "Something else, Rwag.", next = "BACK" },
      },
    },
    honor3 = {
      lines = { { id = "ho3_default", text = "They're found, which is the worst thing that can happen to one of us. I won't say more than that, because you've a quick mind and you can finish the thought yourself." } },
      choices = { { text = "I can. Something else.", next = "BACK" } },
    },
    nartok = {
      lines = { { id = "n_default", text = "I do, and I'll go on doing it. Nartok says the right words about chains and memory, but I've known too many orcs who said the right words, and a rogue who trusts a warlock deserves the knife he gets." } },
      choices = {
        { text = "Has he given you a reason?", next = "nartok2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nartok2 = {
      lines = { { id = "n2_default", text = "Not one, in all the time we've shared this cave, and that's what keeps me watching. If he ever does, I'll be the first to know and he'll be the second." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    valley = {
      lines = { { id = "v_default", text = "The Burning Blade keeps its secrets up in the northern cave, and secrets are a rogue's trade. Go and see how their lookouts stand, and notice which way they aren't looking, because they're cultists and they never look behind them.", fx = { learn = { "burning_blade" } } } },
      choices = { { text = "I'll mark where they don't look. Something else.", next = "BACK" } },
    },
    hand = {
      lines = { { id = "hd_default", text = "For now, only that you live through the Valley and learn to hold your tongue. When you've done both, there are masters in Orgrimmar's Cleft of Shadow who'll have harder questions for you than I do." } },
      choices = { { text = "Then I'll hold my tongue. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've served the Hand since before there was a Durotar to serve it in. The rest you can go without knowing." } },
    burning_blade = { { id = "tp_bb", text = "Cultists in the north cave, with demons on leashes. They post sentries who face one way only, and that tells you how they think." } },
    _none = { { id = "tp_none", text = "If I knew, I'd likely not say, and as it happens I don't know. Ask someone who talks for a living." } },
  },
}

-- Huklah: cloth and leather armor, Valley of Trials.
P:NPC {
  key = "huklah", id = TODO_NPC("Huklah"), name = "Huklah", title = "Cloth & Leather Armor Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "valley_of_trials" }, temper = { "plain", "patient" }, values = { "thrift" },
  notices = { "kit" },
  impression = {
    first = "Huklah sells cloth and leather to the Valley's newcomers, most of whom arrive in rags. He can tell at a glance what a recruit has been fighting from where the holes in their shirt are.",
    third = "{name} met Huklah, who sells cloth and leather armor in the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Throm-ka, {class}. Turn around and let me see what the valley has done to your clothes so far." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and with a new tear at the shoulder. That'll be a scorpid, by the height of it." },
    { id = "g_torn", when = { durability = { max = 0.3 } }, text = "You're wearing more holes than cloth, {class}. I sell armor and I don't mend it, but you ought to see someone who does, and soon." },
  },
  notice = {
    { id = "n_cloth", cat = "kit", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A robe-wearer. You'll want the cloth, then, and you'll want to stand well behind someone in plate." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Huklah, and I dress the recruits who can't carry mail yet or never will. It's plain work, but nobody leaves this valley for Razor Hill bare-backed while I'm standing here." } },
      again = {
        { id = "h_again", text = "What else can I tell you, {class}?" },
        { id = "h_again2", text = "Go on. The leather isn't going to sell itself, but it can wait a moment." },
      },
      choices = {
        { text = "You can read a fight from a torn shirt?", next = "holes" },
        { text = "Where does your leather come from?", next = "leather" },
        { text = "Leather suits a hunter better than mail, doesn't it?", next = "hunter", when = { class = { "HUNTER", "ROGUE" } } },
        { text = "Strength and honor, Huklah.", next = "END" },
      },
    },
    holes = {
      lines = { { id = "ho_default", text = "Easily. A boar tears low at the thigh, a scorpid punches one neat hole wherever the tail lands, and the imps in the northern cave leave a scorch with no tear at all. I see a dozen of each before the sun is high." } },
      choices = {
        { text = "And what do the worst ones look like?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "The worst are the ones I don't see, because the recruit never came back to show me. Sarkoth, the big scorpid up on the plateau, has sent me fewer customers than he should have, if you take my meaning." } },
      choices = { { text = "I take it. Something else.", next = "BACK" } },
    },
    leather = {
      lines = { { id = "l_default", text = "Boar hide, mostly, from the farms outside the valley and from the mottled boars the recruits kill for Gornek. It's stiff and it smells until the second rain, but it turns a tusk, and that's what I ask of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "For now it does, and you'll move better in it than Rarc's customers do in theirs. He'll tell you a shield beats a quick foot, and he's wrong, but don't say I said so within reach of his arm." } },
      choices = { { text = "I'll keep it between us. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I stitched tents in the camps, when we had nothing else to stitch. Armor is better work, and for better people than we were then." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, {class}. I know hide and thread, and the rest I leave to Kaltunk." } },
  },
}

-- Rarc: armorer and shieldcrafter, Valley of Trials.
P:NPC {
  key = "rarc", id = TODO_NPC("Rarc"), name = "Rarc", title = "Armorer & Shieldcrafter", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "valley_of_trials" }, temper = { "gruff", "proud" }, values = { "strength", "craft" },
  notices = { "soldier" },
  impression = {
    first = "Rarc sells mail and shields in the Valley of Trials, and he raps his knuckles on every shield before he hands it over, to hear whether it rings true. He has strong opinions about recruits who fight without one.",
    third = "{name} met Rarc, the armorer and shieldcrafter of the Valley of Trials.",
  },
  greetings = {
    { id = "g_default", text = "Lok'tar, {class}. Hold out your arm, because I want to see whether it can carry a shield yet." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior, and Frang's sent you to me with nothing on your arm. We'll fix that before a boar does it for you." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, I see. Either you bought a shield, or you've been lucky, and luck runs out." },
  },
  notice = {
    { id = "n_shaman", cat = "soldier", when = { class = "SHAMAN" },
      text = "Shaman carry shields too, and the good ones know why. The spirits may guard you, but a plank of ironwood never has a bad day." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Rarc, and I make the things that stand between a recruit and whatever wants to eat them. An axe wins the fight, but it's the shield that lets you live long enough to swing it twice." } },
      again = {
        { id = "h_again", text = "What else, {class}? Speak up over the hammering." },
        { id = "h_again2", text = "Go on. I can talk and rivet at once." },
      },
      choices = {
        { text = "What makes a shield a good one?", next = "shield" },
        { text = "Plenty of orcs fight with two hands on the axe.", next = "twohand" },
        { text = "What should a new warrior put on first?", next = "first", when = { class = "WARRIOR" } },
        { text = "Strength and honor, Rarc.", next = "END" },
      },
    },
    shield = {
      lines = { { id = "s_default", text = "It should ring when you knock it and stay quiet when something else does. I build mine from ironwood planks banded in iron, because the wood drinks the blow and the band keeps the wood together." } },
      choices = {
        { text = "Where do you find ironwood in Durotar?", next = "wood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "I don't, and that's the grief of this land. Every plank comes down the road from the lumber camps in the north, and Foreman Thazz'ril's peons would sooner sleep under a tree than cut one, so I wait and I curse." } },
      choices = { { text = "Something else, Rarc.", next = "BACK" } },
    },
    twohand = {
      lines = { { id = "t_default", text = "Plenty do, and some of them are still alive, so I won't call them fools to their faces. But I fitted the armor for half the grunts at Razor Hill, and I know which of them come back to be fitted a second time." } },
      choices = { { text = "The ones with shields, I suppose. Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "Cover the chest first, then take a shield, and worry about the rest after. A recruit who spends his first coin on fine gauntlets has well-dressed hands and a hole in his belly." } },
      choices = { { text = "Chest and shield. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned riveting from an old Blackrock smith in the camps, with scrap and a stone for a hammer. I've better tools now and the same hands." } },
    _none = { { id = "tp_none", text = "You're asking an armorer, {class}. If it can't be riveted, I've no opinion on it." } },
  },
}

-- Magga: Razor Hill; takes the gift vouchers some newcomers carry.
P:NPC {
  key = "magga", id = TODO_NPC("Magga"), name = "Magga", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "razor_hill" }, temper = { "warm", "curious" }, values = { "welcome" },
  notices = { "pet" },
  impression = {
    first = "Magga stands in Razor Hill and greets newcomers as though each one were expected. A few of them arrive carrying a voucher with her name on it, and she keeps a basket of small, strange creatures for those few.",
    third = "{name} met Magga of Razor Hill, who greets newcomers and trades vouchers for small companions.",
  },
  greetings = {
    { id = "g_default", text = "Hello, {class}! It's a pleasure to see a new face come up the road in one piece." },
    { id = "g_voucher", when = { questActive = TODO_QUEST("Welcome!") }, text = "Hello! Is that a voucher I see in your pack? Bring it here, because I've been keeping something for whoever carried it." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again. Razor Hill's a little less dusty with you in it." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER" },
      text = "A hunter! Please keep your beast clear of my basket, because the little ones in it frighten easily, and one of them bites back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Magga. I welcome the ones who come up from the Valley of Trials, since the grunts are too busy to do it and Gar'Thok only knows how to give orders." } },
      again = {
        { id = "h_again", text = "Was there something more, {class}?" },
        { id = "h_again2", text = "Ask away. Welcoming people is the whole of my day." },
      },
      choices = {
        { text = "What's in the basket?", next = "basket" },
        { text = "What should a newcomer know about Razor Hill?", next = "town" },
        { text = "I'm glad of the welcome. Farewell.", next = "END" },
      },
    },
    basket = {
      lines = { { id = "b_default", text = "Small companions, and odd ones, from places I couldn't point to on a map. Some travellers arrive with a voucher that entitles them to choose one, and all I do is keep the creatures fed until the right hand comes along." } },
      choices = {
        { text = "Odd in what way?", next = "odd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    odd = {
      lines = { { id = "o_default", text = "One is a fat little bear that's black and white like a painted shield, and it eats nothing but reeds. Another has more teeth than body and runs in circles until it falls over, and I won't tell you about the third, because it looks at me." } },
      choices = { { text = "I'd leave the third one be. Something else.", next = "BACK" } },
    },
    town = {
      lines = { { id = "t_default", text = "Sleep at Grosk's inn, and listen to Gar'Thok even when he shouts. Don't go east to Tiragarde Keep alone either, because the humans there are Proudmoore's leftovers and they've nowhere to run, which makes them fight harder." } },
      choices = { { text = "Good counsel. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to Durotar with the first wagons and I've been greeting the later ones ever since." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that, {class}. Ask at the barracks, and smile when you do, because it confuses them." } },
  },
}

-- Ophek: Razor Hill; carries Gan'rul Bloodeye's summons to young warlocks.
P:NPC {
  key = "ophek", id = TODO_NPC("Ophek"), name = "Ophek", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "razor_hill" }, temper = { "uneasy", "wry" }, values = { "duty" },
  notices = { "class" },
  impression = {
    first = "Ophek waits about in Razor Hill with the look of an orc who has been sent on someone else's errand and would like it finished. He carries messages for Gan'rul Bloodeye, the warlock master in Orgrimmar, and he doesn't enjoy the work.",
    third = "{name} met Ophek in Razor Hill, a messenger for the warlock Gan'rul Bloodeye.",
  },
  greetings = {
    { id = "g_default", text = "You're not the one I'm waiting for, {class}, but you may as well stand in the shade with me. Razor Hill has little enough of it." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "You there, the warlock. I may have been looking for you, so don't wander off before I've checked my list." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'm still here and still waiting, as you can see." },
  },
  notice = {
    { id = "n_pet", cat = "class", when = { pet = { type = "Demon" } },
      text = "Keep your demon where I can see it. The last imp I met lit my message pouch on fire, and I had to explain that to Gan'rul." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_summons", when = { questActive = TODO_QUEST("Gan'rul's Summons") },
          text = "You have the summons, so my part's done and yours has started. He's in the Cleft of Shadow with the senior warlocks, and I wouldn't keep him waiting if I were you." },
        { id = "h_default", text = "I'm Ophek. I carry word from Gan'rul Bloodeye in Orgrimmar to the young warlocks out here, when he decides one of them is ready for him. It's a long, hot walk, and nobody is ever pleased to see me at the end of it." },
      },
      again = {
        { id = "h_again", text = "What else? I've time, the spirits know." },
        { id = "h_again2", text = "Go on, {class}. Waiting is most of what I do." },
      },
      choices = {
        { text = "Who is Gan'rul Bloodeye?", next = "ganrul" },
        { text = "You don't sound fond of the work.", next = "work" },
        { text = "How does Razor Hill treat a warlock's messenger?", next = "town" },
        { text = "Has Gan'rul sent for me?", next = "forme", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your waiting.", next = "END" },
      },
    },
    ganrul = {
      lines = { { id = "g_default", text = "He's the eldest of the warlocks the Warchief permits in Orgrimmar, and he keeps a place in the Cleft of Shadow, down where the city doesn't have to look at it. He decides who learns the deeper bindings and who is sent home." } },
      choices = {
        { text = "What happens to the ones he sends home?", next = "ganrul2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ganrul2 = {
      lines = { { id = "g2_default", text = "The lucky ones take up farming and never speak of it. I've carried a summons to an orc who was one thing when I handed it over and something quieter when I saw him next, and I've never asked Gan'rul which sort of meeting that was." } },
      choices = {
        { text = "Then a summons can go either way.", next = "ganrul3" },
        { text = "Something else, Ophek.", next = "BACK" },
      },
    },
    ganrul3 = {
      lines = { { id = "g3_default", text = "It can, and I never know which when I hand it over. In my experience it's a very good thing or a very bad one, and Gan'rul doesn't trouble himself with anything in between." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "w_default", text = "I'm fond of being trusted, and I'm less fond of who it is that trusts me. Still, somebody has to walk between the warlocks and the rest of us, and I'd rather it were an orc who remembers why we fear them." } },
      choices = { { text = "That seems wise. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    town = {
      lines = { { id = "t_default", text = "Politely, and from the far side of the road. Dhugru Gorelust teaches the craft here, so the grunts are used to the smell of it, but Gar'Thok still looks at me as though I'd tracked something in on my boots." } },
      choices = {
        { text = "Do you blame him?", next = "town2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town2 = {
      lines = { { id = "t2_default", text = "Not in the least, with the Burning Blade nesting in half the caves in Durotar. A grunt can't easily tell Gan'rul's students from the cultists he's paid to kill, and some days I'm not certain I can either.", fx = { learn = { "burning_blade" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forme = {
      lines = { { id = "f_default", text = "If he has, I'll have a summons with your name on it, and you'll know because I'll have put it in your hand. If I haven't, then he's still watching you, which is a thing he does, and you should carry on as you are." } },
      choices = { { text = "Watching me from Orgrimmar? Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a runner for the warbands before I was a runner for warlocks. The walking's the same, but the letters are heavier now." } },
    burning_blade = { { id = "tp_bb", text = "Gan'rul hates them worse than the grunts do. They make every warlock in the Horde look like a traitor in waiting." } },
    _none = { { id = "tp_none", text = "I only carry the messages, {class}, and I don't read them. Whatever that is, it wasn't in one of mine." } },
  },
}

-- Rawrk: first aid (bandage) trainer in the Razor Hill Barracks.
P:NPC {
  key = "rawrk", id = TODO_NPC("Rawrk"), name = "Rawrk", title = "Bandage Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "razor_hill" }, temper = { "gruff", "practical" }, values = { "survival", "duty" },
  notices = { "class" },
  impression = {
    first = "Rawrk teaches bandaging in the Razor Hill barracks, with a roll of linen on his belt and old blood under his nails. He has patched more grunts than Gar'Thok has shouted at, and he is no gentler about it.",
    third = "{name} met Rawrk, who teaches first aid in the Razor Hill barracks.",
  },
  greetings = {
    { id = "g_default", text = "You're standing and you're not dripping on my floor, {class}, so you're already the best visitor I've had today." },
    { id = "g_sick", when = { resSick = true }, text = "You look like something the spirits handed back half finished. Sit down before you fall down, because linen won't mend what ails you and only time will." },
    { id = "g_back", when = { metBefore = true }, text = "Back in one piece, which means you listened. Most of them don't." },
  },
  notice = {
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "SHAMAN", "DRUID" } },
      text = "A healer. Learn the bandage anyway, because the day will come when your magic's spent and your friend is still bleeding." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_camp", when = { questActive = TODO_QUEST("Camping 101: First Aid") },
          text = "You're here about tending wounds at a campfire, so somebody has finally told the young ones that a fire is more than a place to cook. Good, and now pay attention." },
        { id = "h_default", text = "I'm Rawrk, and I teach grunts to stop each other bleeding. It isn't glorious work and nobody sings about it, but every warrior in this barracks has been glad of it at least once." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? I've linen to boil." },
        { id = "h_again2", text = "Go on, but talk while I roll these." },
      },
      choices = {
        { text = "What do you treat most, out here?", next = "wounds" },
        { text = "Surely a true warrior ignores his wounds.", next = "ignore" },
        { text = "What does a traveller need to tend wounds at camp?", next = "camp" },
        { text = "How good can I get with linen alone?", next = "skill", when = { profession = "First Aid" } },
        { text = "Stay busy, Rawrk. Or rather, don't.", next = "END" },
      },
    },
    wounds = {
      lines = { { id = "w_default", text = "Sword cuts and arrow holes from the Kul Tiras men at Tiragarde, mostly, and they're clean enough to wrap. The quilboar are worse, because a Razormane spear is filthy and the wound goes bad by morning if you don't wash it first." } },
      choices = {
        { text = "And scorpid stings?", next = "sting" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sting = {
      lines = { { id = "st_default", text = "A sting wants more than a bandage, since the venom goes on working under the wrap. There's a trick with the scorpid's own venom sac, and the witch doctors down in Sen'jin Village know it better than I do." } },
      choices = {
        { text = "The poison cures the poison?", next = "sting2" },
        { text = "Something else, Rawrk.", next = "BACK" },
      },
    },
    sting2 = {
      lines = { { id = "st2_default", text = "So the trolls say, and I've seen it work, so I've stopped arguing. Our people knew herbs and bone-setting on Draenor, but there is a great deal about this land's creatures that the Darkspear learned before we did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ignore = {
      lines = { { id = "i_default", text = "A true warrior ignores his wounds until the fight is over, and then he sits down and lets me bind them. The ones who go on ignoring them after that aren't brave, they're dead by the week's end, and they've left their brothers a spear short." } },
      choices = { { text = "Put that way, I'll sit down. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    camp = {
      lines = { { id = "c_default", text = "Clean cloth, clean water and a fire to boil the one in the other, and that's nearly all of it. A wound dressed properly by firelight heals better than one dressed badly in a barracks, so learn it before you're a day's walk from the nearest town.", fx = { learn = { "camping" } } } },
      choices = { { text = "Cloth, water and fire. Something else.", next = "BACK" } },
    },
    skill = {
      lines = { { id = "sk_default", text = "Good enough for Durotar, and no further. When linen stops being enough, you'll want wool and then silk, and by then you'll have outgrown what I can show you and you should look for a teacher in Orgrimmar." } },
      choices = { { text = "I'll remember. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried a litter in the last war before I carried an axe. I found I was better with the litter, so I went back to it." } },
    camping = { { id = "tp_camp", text = "A fire, clean water and clean cloth. Tend the wound before you eat, because you won't want to afterwards." } },
    _none = { { id = "tp_none", text = "If it isn't bleeding, {class}, it's not my trade. Ask Gar'Thok, and stand well back when you do." } },
  },
}

-- Grunt Kor'ja: wounded on the road just south of Razor Hill.
P:NPC {
  key = "grunt_korja", id = TODO_NPC("Grunt Kor'ja"), name = "Grunt Kor'ja", gender = "female",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "razor_hill" }, temper = { "stubborn", "proud" }, values = { "duty", "honor" },
  notices = { "class" },
  impression = {
    first = "Grunt Kor'ja holds the road just south of Razor Hill with one arm bound against her side and blood dried down her leg. She took the wounds from Tiragarde's marines, and she plainly intends to go back for more.",
    third = "{name} met Grunt Kor'ja, wounded on the road south of Razor Hill and still at her post.",
  },
  greetings = {
    { id = "g_default", text = "Keep walking, {class}, and don't stare. I've had worse than this and so has the other side." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "A priest, and not before time. I won't ask for it twice, but I wouldn't turn away your help either." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'm still standing, in case you came to check." },
  },
  notice = {
    { id = "n_healer", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "You've a healer's look, but Tai'jin said she'd send one of her own, so I'll wait for that. A grunt takes her orders as they're given, even the kind ones." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_garm", when = { questActive = TODO_QUEST("Garments of Spirituality") },
          text = "Tai'jin sent you, then. Do what you came to do, priest, and be quick, because the humans won't wait politely while you pray over me." },
        { id = "h_default", text = "Grunt Kor'ja, Razor Hill. This is my stretch of road, and a few holes in me don't change whose it is." },
      },
      again = {
        { id = "h_again", text = "What else? Make it short, because I'm watching the road." },
        { id = "h_again2", text = "Speak, {class}." },
      },
      choices = {
        { text = "Who did that to you?", next = "who" },
        { text = "You should be in the barracks, not on the road.", next = "barracks" },
        { text = "Hold fast, grunt.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "A patrol out of Tiragarde Keep, four of Proudmoore's old marines who came up the gully thinking the road was unwatched. I put two of them down and the other two ran, though not before they'd left me these to remember them by." } },
      choices = {
        { text = "Why do they still fight? Their admiral is dead.", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because they've no ship to leave on and no orders to stop. I almost respect it, {class}, since I'd do the same in their place, but respect has never yet stopped me from killing a man." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    barracks = {
      lines = { { id = "b_default", text = "Rawrk would wrap me up and Gar'Thok would put some whelp on my road, and by nightfall the humans would be at the gate. I'll go in when I'm relieved or when I fall over, and I don't plan on falling over." } },
      choices = { { text = "Then I hope you're relieved soon.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a grunt of Razor Hill, and that tells you everything about me worth knowing." } },
    _none = { { id = "tp_none", text = "I watch a road, {class}. Ask me about the road or ask someone else." } },
  },
}
