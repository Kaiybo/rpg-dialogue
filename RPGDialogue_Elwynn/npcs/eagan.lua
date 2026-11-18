-- Eagan Peltskinner, Northshire Valley. Voice: bibles/eagan.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eagan", id = TODO_NPC("Eagan Peltskinner"), name = "Eagan Peltskinner",
  bible = "bibles/eagan.md", role = "questgiver", tier = "quest",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "beast", "form", "skinner" },
  impression = {
    first = "Eagan Peltskinner walks his trap lines like a man who knows where every snare is buried, and he'd much rather I stepped where he stepped. He looks at every creature as a coat first.",
    third = "{name} met Eagan Peltskinner, the Northshire trapper who judges every creature by the quality of its pelt.",
  },

  greetings = {
    { id = "g_traps", text = "Step where I step, friend. There are traps all through here." },
    { id = "g_fur", text = "Bring me something with fur on it." },
  },

  notice = {
    { id = "n_bear", cat = "form", place = "replace", when = { form = "bear" },
      text = "I've skinned bears before, so don't take it personally." },
    { id = "n_cat", cat = "form", place = "replace", when = { form = "cat" },
      text = "Hold still, I'm only looking at the coat. It's a good coat, too." },
    { id = "n_pet", cat = "beast", when = { pet = { type = "Beast" } },
      text = "That's a good animal. Feed it before you feed yourself and it'll keep you alive." },
    { id = "n_skinner", cat = "skinner", when = { profession = "Skinning" },
      text = "You skin. I can tell from your knife. Most folk hack at a pelt like it owes them money." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Easy, now. I've no quarrel with bears that pay their way." },
    { id = "r_pet", on = "pet", when = { pet = { type = "Beast" } }, text = "Where'd that one come from? Healthy, too, and well kept." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I've never asked them, and I'm not about to start. A pelt's a living to me, and I don't waste any part of the animal. If that offends a spirit, it can tell me itself." } },
      choices = {
        { text = "Take what you need and waste nothing. That's fair.", next = "BACK", reply = "That's how my grandfather did it, and his before him. You'll do all right.", fx = { align = { honor = 1 } } },
        { text = "Trap them all, Eagan. The forest has plenty.", next = "BACK", reply = "It had plenty once, and then it didn't. I'll take what I need and leave the rest.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "For a night, maybe, but they're hungry, and hunger comes back faster than fear does. Kill the worst of them and bring me their meat, and the rest will think twice about the ridge." } },
      choices = {
        { text = "I'll kill them cleanly and spare the pelts.", next = "BACK", reply = "Good, and I'll pay fair for every pelt. Clean kills, mind.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll burn them out. Pelts aren't my concern.", next = "BACK", reply = "They're mine, friend, and I'll not pay for ashes. Burn something else.", fx = { align = { order = -1 } } },
        { text = "Something else, Eagan.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "From behind, and in pairs, the way hungry ones always do. One shows you its teeth while the other goes for your legs, so watch the one you can't see and let the noisy one wait." } },
      choices = {
        { text = "I'll watch my back and fight them properly.", next = "BACK", reply = "Good, that's the way to come home with both legs. Mind the quiet one.", fx = { align = { order = 1 } } },
        { text = "Then I'll charge the noisy one and be done fast.", next = "BACK", reply = "You'll be done fast, aye, with the other one hanging off your leg. Suit yourself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Clean, and close to the ridge, before they're down among the recruits. A hungry wolf's a sad thing, but it'll still take a lamb from the Abbey's fold, so I don't let it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Clean, and close to the ridge, before they're down among the recruits. That {pet} of yours has a good nose, so let it find their trail, but keep it off the she-wolves still nursing." },
      },
      choices = {
        { text = "I'll take the hungry ones and spare the young.", next = "BACK", reply = "That's a hunter who thinks ahead, and I'll be glad of you on the ridge. The young ones grow up to be next year's trouble, but they're not this year's.", fx = { align = { honor = 1 } } },
        { text = "A wolf's a wolf. I'll take every one on the ridge.", next = "BACK", reply = "They'll come back with every litter, friend, and you'll be up there forever. Take the hungry ones.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It would, because the young ones scatter before a man gets within a stone's throw of them, and then they come back for my drying racks after dark. If you can get close enough to see the whites of their eyes, you'll do better than most of the Abbey's recruits." } },
      choices = {
        { text = "I'll thin the pack so they leave your drying racks alone.", next = "BACK", reply = "That's what I need, and I'll thank you for it. Mind the racks on your way back.", fx = { align = { light = 1 } } },
        { text = "I'll kill every wolf on that ridge, pups and all.", next = "BACK", reply = "Then you'll leave nothing for next year, and the deer will eat my crops instead. Take the hungry ones.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Every animal smells it, and the wolves have been in a temper since you came up the road. A wolf knows something wrong when it smells it, and I trust a wolf's nose over a man's word." } },
      choices = {
        { text = "The wolves are right to fear it. I'll keep it leashed.", next = "BACK", reply = "Thank you. A wolf's nose has never been wrong yet, and I'd like them settled before lambing.", fx = { align = { light = 1 } } },
        { text = "Let them howl. Fear keeps beasts in their place.", next = "BACK", reply = "Fear keeps them howling all night, friend, and none of us sleep. Keep it leashed.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "My grandfather did, every one, and I thought it was soft until the year I stopped and the wolves got bolder. Now I mutter something before I skin them, and I'll thank you not to tell my wife Helene, because she'd laugh." } },
      choices = {
        { text = "Every creature deserves a word at the end, Eagan.", next = "BACK", reply = "Grandfather would've liked you. Keep it between us, mind.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A wolf's a wolf. Save your prayers for people.", next = "BACK", reply = "That's what I thought too, until the wolves got bolder. Try it once and see.", fx = { align = { light = -1 } } },
        { text = "Something else, Eagan.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not yet, but they're hungry, and hungry wolves get brave, so it's the recruits walking the vineyards at dusk that worry me. I'd rather thin them now, cleanly, than bury a novice come winter." } },
      choices = {
        { text = "Then I'll thin them quickly, and spare the pups.", next = "BACK", reply = "That's the way, and the pups will grow up warier for it. I'll be glad of you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Kill the lot, pups and all. The Abbey comes first.", next = "BACK", reply = "Then there'll be nothing left to keep the deer off the crops, and the Abbey will thank you for that too. Take the hungry ones.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A healer, eh? Keep your linen handy, because the wolves on the ridge don't bite clean." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, up here with the wolves. They'll smell you coming in all that plate, so don't expect them to sit still for a sermon." },
        { id = "h_default", key = true, text = "Wolves are pushing over the ridge, hungry ones, and they take whatever they can carry." },
        { id = "h_willem", when = { questRecent = { TODO_QUEST("Eagan Peltskinner"), days = 1 } },
          text = "Deputy Willem sent you? Then he thinks you can hold a knife, and we'll soon see if he's right." },
        { id = "q_wolves_active", when = { questActive = TODO_QUEST("Wolves Across the Border") },
          text = "Those wolves you're bringing in are tough meat, not tender, so they're the hungry ones off the ridge, right enough." },
        { id = "q_wolves_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Wolves Across the Border"), days = 2 } },
          text = "The nights are quieter since you thinned those wolves, and their pelts will keep somebody warm in the Abbey come winter." },
        { id = "h_hunter", when = { race = "Human", class = "HUNTER" },
          text = "A human hunter. My grandfather would've called you a trapper with ambitions, and he'd not have meant it kindly." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "You're one of the ones who turns into the animals. Hard to know whether to shake your hand or check your teeth." },
        { id = "h_steaks", when = { questDone = TODO_QUEST("Wolves Across the Border") },
          text = "I ate the last of the wolf meat you brought me last night, slow over coals with a bit of salt. Tough as a boot, and I'd not change a thing." },
        { id = "h_veteran", when = { minLevel = 20 },
          text = "You've a better knife than you came here with, and a few scars from things bigger than wolves, by the look of you. That's good." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk light, like a hunter who's learned not to step on twigs. Good; the wolves on the ridge hear everything else." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Keep whatever that is on a short leash, because the wolves smell it and it puts them in a temper." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, by the look of those shoulders. The wolves won't care how hard you swing, so keep your back to a tree." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter in Northshire. Good; the wolves pushing over the ridge need thinning by someone who knows the job." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Burn those wolves if you must, but leave me the pelts, for a scorched pelt's worth nothing in Goldshire." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, stepping on my snare line. Step where I step, and ask your spirits to keep the wolves off my traps while you're at it." },
      },
      again = {
        { id = "h_again", text = "Something else? Be quick about it; the traps don't check themselves." },
        { id = "h_again2", text = "Well? I've traps to see to." },
      },
      choices = {
        { text = "What do you need?", next = "BUSINESS" },
        { text = "What do you do with the wolves you take?", next = "meat" },
        { text = "There seem to be more wolves than ever this year.", next = "why" },
        { text = "I almost feel sorry for the wolves.", next = "pity" },
        { text = "Teach me a cleaner cut?", next = "skin", when = { profession = "Skinning" } },
        { text = "Would you skin me, if I were a bear?", next = "druid", when = { class = "DRUID" } },
        { text = "Would a quiet step get me close to those wolves?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The wolves on the ridge seem to smell my demon, Eagan.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How do wolves fight a warrior, Eagan?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How would you have a hunter take these wolves?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever say a word over the wolves you kill, Eagan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The wolves could be a danger to the Abbey itself, Eagan.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would fire drive the wolves back over the ridge, Eagan?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the spirits mind you trapping the beasts, Eagan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I used to flush game for the lords' hunts, Eagan.", next = "xorig_beater", when = { origin = "human_elwynn_beater" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    xorig_beater = {
      lines = {
        { id = "xobeater_default", text = "A beater, eh? Then you know these woods better than the lords who shoot in them, and you'll know the wolves don't run the way the deer do. Here, was it you that took the great boar, the year the hunt came home empty?" },
      },
      choices = {
        { text = "I might have. It fed my family all winter.", next = "BACK", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "A good hunter never tells, Eagan.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat = {
      lines = {
        { id = "m_default", text = "I eat them. I hate those timber wolves, but I do like a wolf steak, funny as that sounds. The pelts go down to Goldshire." },
      },
      choices = {
        { text = "Who takes the pelts?", next = "meat_helene" },
        { text = "Wolf steak? Really?", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    meat_helene = {
      lines = {
        { id = "mh_default", text = "Helene, my wife. She skins and sews down in Goldshire, and she's more orders than I've wolves. If you skin, go and learn from her; she's better at it than me." },
      },
      choices = {
        { text = "High praise, from you.", next = "meat_praise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat_praise = {
      lines = {
        { id = "mp_default", text = "It's not praise, it's a fact. I hunt and she makes something of it, and most folk only ever see the second half." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = {
        { id = "w_default", text = "Hungry ones, come over the border from the hills: young wolves mostly, and the timber wolves after them. It's easy pickings down here, and recruits are the easiest pickings of all." },
      },
      choices = {
        { text = "Then I'll thin them out.", next = "BUSINESS", fx = { trait = { brave = 1 } } },
        { text = "What about the kobolds?", next = "why_kobolds" },
      },
    },
    why_kobolds = {
      lines = {
        { id = "wk_default", text = "Kobolds have no pelt worth taking, so they're not my trouble. The wolves keep clear of their mine, though, so even a wolf has standards." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pity = {
      lines = { { id = "p_default", text = "Sorry for them? They'd eat me if I let them, and I don't let them." } },
      choices = {
        { text = "Then keep them off your doorstep.", next = "BACK", reply = "That's the plan, aye. And I'll keep doing it till I'm too old to lift a trap.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Seems a hard way to see it.", next = "pity_hard", fx = { align = { light = 1 }, trait = { kind = 1 }, affinity = -1 } },
      },
    },
    pity_hard = {
      lines = {
        { id = "ph_default", text = "Soft folk keep pets and I keep a larder, so we both feed something. It only looks hard to folk who've never gone hungry." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    skin = {
      lines = {
        { id = "s_default", text = "Keep the knife flat and follow the fat; don't saw at it. If you hear it tearing, you've already ruined it. Helene teaches it properly, down in Goldshire." },
      },
      choices = { { text = "Knife flat, follow the fat. Thanks, Eagan.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid = {
      lines = { { id = "d_default", text = "Depends on the coat. Don't look at me like that; you asked." } },
      choices = { { text = "Fair.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a trapper and a skinner, here in Northshire, and that's the lot." } },
    advice = { { id = "tp_ad", text = "Feed your animal before yourself and clean your knife before you sleep, and never turn your back on a wolf that's stopped growling." } },
    kobolds = { { id = "t_kobolds", text = "Kobolds don't wear anything worth taking." } },
    hogger = { { id = "t_hogger", text = "A gnoll that big has a hide like a door. I'd like it, but I'd not like to be the one taking it." } },
    _none = { { id = "t_none", text = "Ask someone who talks more." } },
    echo_ridge = { { id = "tp_echo_ridge", text = "Wolves won't go near Echo Ridge anymore, and wolves aren't fools. The kobolds dig there day and night, and the whole ridge stinks of candle wax." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Faire folk buy my wolf pelts to make their tents look wild. I don't ask what they tell the children, and they don't ask what the wolf did." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The brothers pay a fair price for pelts and don't haggle, and that's rare among holy folk with a purse. I'll speak well of them for that." } },
  },
}
