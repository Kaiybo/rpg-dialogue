-- More Loch Modan folk: Pilot Hammerfoot at the North Gate Outpost, Dargh Trueaim at the Farstrider Lodge,
-- Deek Fizzlebizz on the Stonewrought Dam, and Greishan Ironstove on the road with his bread.
-- Also (added later): Vyrin Swiftwind and the Lodge traders, Gothor Brumn and Nillen Andemar.
-- Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Pilot Hammerfoot: gyrocopter pilot at the North Gate Outpost whose wingman never came home.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_hammerfoot", id = TODO_NPC("Pilot Hammerfoot"), name = "Pilot Hammerfoot",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "lochmodan" }, temper = { "grim", "loyal" }, values = { "loyal", "brave" },
  notices = { "race", "class" },
  impression = {
    first = "A fellow pilot went down in the hills, and he wants answers.",
    third = "{name} met Pilot Hammerfoot at the North Gate Outpost, a dwarf pilot grieving a lost comrade.",
  },
  greetings = {
    { id = "g_hi", text = "Ye've come through the North Gate, then. Did ye see any wreckage out there, any sign o' a gyrocopter?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Ye've the look o' someone who's been up in the hills; did ye see anythin' that glinted like a rotor?" },
    { id = "g_lost", when = { questActive = TODO_QUEST("The Lost Pilot") }, text = "Have ye found him yet? I know what ye'll likely find, but I need tae hear it." },
    { id = "g_revenge", when = { questActive = TODO_QUEST("A Pilot's Revenge") }, text = "Mangeclaw's still out there, I can feel it. Bring me its claw, an' I'll sleep again." },
    { id = "g_done", when = { questDone = TODO_QUEST("A Pilot's Revenge") }, text = "The beast's dead, an' my friend can rest. I'll no' forget what ye did, friend." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome. The gyrocopter he flew was gnome-made, an' it never once failed him; it was the beast that got him, no' the machine." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Ye'd know how tae track a bear, then, an' that's what I need." },
  },
  start = "hello",
  nodes = {
    w2_fly = {
      lines = {
        { id = "w2_fly_l0", text = "A gnome at Steelgrill's Depot owed my da money an' paid him in lessons, an' my da sent me. First time up, I was sick over the side onto a yeti, an' I've loved it ever since." },
      },
      choices = {
        { text = "And now you're stuck on foot at the gate.", next = "w2_fly_ground" },
        { text = "Flying machines are no place for a sensible dwarf.", next = "BACK", reply = "Aye, ye'll get nae argument from my mother. But the sensible dwarves never see the loch from above.", fx = { align = { order = 1 } } },
        { text = "The sky belongs to whoever dares climb into it.", next = "BACK", reply = "That's it exactly, an' that's what my friend said every mornin' before he took off.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_fly_ground = {
      lines = {
        { id = "w2_fly_ground_l0", text = "Till they send me a new machine, aye. Mine's in pieces at the depot waitin' on a part from Ironforge, an' every day I stand here watchin' the hills where he came down, I'm glad I'm no' flyin' over them yet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dw_riders = {
      lines = {
        { id = "dw_riders_default", text = "Like cats an' dogs. The Wildhammers say a flyin' machine is a coffin wi' a propeller, an' we say a gryphon's a coffin wi' feathers an' an opinion. We've both buried friends, so neither of us is entirely wrong." },
      },
      choices = {
        { text = "Machines are the future. The gryphons had their day.", next = "BACK", reply = "Spoken like a gnome, an' I'll drink tae it. Just don't say it within earshot o' Aerie Peak.", fx = { align = { order = 1 } } },
        { text = "A living beast beats any machine in a pinch.", next = "BACK", reply = "Aye, until it gets hungry or homesick. Still, I'll grant ye a gryphon doesnae run out o' fuel over the mountains.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dw_pray = {
      lines = {
        { id = "dw_pray_default", text = "That's kind of ye, kin. He was a Thelsamar lad, an' his da still keeps a lantern in the window. If ye ever bring back news, bring it tae me first, an' I'll be the one tae carry it home." },
      },
      choices = {
        { text = "I will, Hammerfoot.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Pilot Hammerfoot, an' one o' our pilots went down in the hills near here, an' I've had no word since. I'd go look myself, but my orders keep me at the Gate." },
        { id = "h_found", when = { questDone = TODO_QUEST("The Lost Pilot") }, text = "Ye found him, an' I thank ye for it, though I'd hoped for different news. There was a bear, a big one, an' I know its name: Mangeclaw." },
      },
      again = {
        { id = "h_again", text = "What else? I'm still watchin' the hills." },
        { id = "h_again2", text = "Go on, then. I've nothin' but time at this post." },
      },
      choices = {
        { text = "Tell me about your missing pilot.", next = "pilot" },
        { text = "What's Mangeclaw?", next = "mangeclaw" },
        { text = "What do you guard here?", next = "gate" },
        { text = "I know how to track a beast.", next = "track", when = { class = "HUNTER" } },
        { text = "Do pilots and gryphon riders get along?", next = "dw_riders" },
        { text = "I'll keep your pilot's name in my prayers, Hammerfoot.", next = "dw_pray", when = { race = "Dwarf" } },
        { text = "How did you come to fly gyrocopters?", next = "w2_fly" },
        { text = "Farewell, Hammerfoot.", next = "END" },
      },
    },
    pilot = {
      lines = { { id = "pi_default", text = "We flew together for six years, scoutin' the passes for Dark Irons an' troggs. He went out on a routine flight an' never came back, an' I've been starin' at those hills ever since." } },
      choices = {
        { text = "Where would he have gone down?", next = "pilot_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pilot_where = {
      lines = { { id = "pw_default", text = "Somewhere in the hills east o' here, if he was followin' the usual route. Look for wreckage, look for smoke, an' if ye find him, bring back somethin' I can give his family." } },
      choices = {
        { text = "And if he's dead?", next = "pilot_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pilot_dead = {
      big = true,
      lines = { { id = "pd_default", text = "Then I'll know, an' that's better than not knowin'. Some say a pilot should accept the risks an' move on when a comrade falls. Do ye agree?" } },
      choices = {
        { text = "No. You owe him the truth, and justice.", next = "BACK", reply = "Aye, that's how I feel. Thank ye for understandin'.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Yes. Grief won't fly the next mission.", next = "BACK", reply = "Maybe ye're right, but I cannae do it, no' yet.", fx = { align = { honor = -1 } } },
      },
    },
    mangeclaw = {
      lines = { { id = "ma_default", text = "A great bear that's been terrorisin' the hills these last months, bigger than any I've ever seen. If my friend survived the crash, I'd wager it was Mangeclaw that finished him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gate = {
      lines = { { id = "ga_default", text = "The North Gate's the road tae Dun Morogh an' Ironforge, through the tunnel at Algaz. If the Dark Irons ever push through Loch Modan, this is where we'll stop them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    track = {
      lines = { { id = "tr_default", text = "Then ye're the one I need. Mangeclaw's tracks will be bigger than any bear's ye've seen; follow them, an' ye'll find it." } },
      choices = { { text = "I'll find it.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a pilot. That's all I've ever been." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask someone who's no' starin' at hills all day." } },
  },
}

---------------------------------------------------------------------------
-- Dargh Trueaim: hunter trainer at the Farstrider Lodge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_dargh", id = TODO_NPC("Dargh Trueaim"), name = "Dargh Trueaim", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "lochmodan" }, temper = { "steady", "dry" }, values = { "patient", "nature" },
  notices = { "class" },
  impression = {
    first = "He measures people like the wind before a long shot.",
    third = "{name} met Dargh Trueaim, the hunter trainer at the Farstrider Lodge.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back at the Lodge, an' yer stance looked better from across the yard. Come, show me what ye've learned." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll train ye, for it's my job, but dinnae expect me tae enjoy it." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the Lodge. Did ye hit what ye aimed at, or what was standin' next tae it?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Nae shootin' in this light. Sit by the fire an' I'll talk, if talk's what ye're after." },
    { id = "g_hi", text = "Mind the trophies; Marek's very proud o' them. What brings ye tae the Lodge?" },
    { id = "g_hunt", when = { class = "HUNTER" }, text = "A hunter! Come in, an' let's see how yer aim's improved." },
  },
  notice = {
    { id = "n_pet", cat = "class", when = { pet = { type = "Beast" } },
      text = "{pet} is watchin' the trophies on the wall an' no' likin' them much. That's a sensible beast ye've got." },
    { id = "n_elf", cat = "class", when = { race = "NightElf" },
      text = "An elf at the Lodge. Vyrin'll be glad o' the company, for she's had tae listen tae dwarves talk about rifles for years." },
    { id = "n_hunt", cat = "class", when = { class = "HUNTER" },
      text = "Ye hold yer rifle like ye mean it, an' that's a good start." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dargh Trueaim, hunter trainer. The Farstriders have hunted Loch Modan since before Thelsamar had a wall, an' I teach the young ones how tae do it right." },
      },
      again = {
        { id = "h_again3", text = "Ask it, then. I can talk an' watch the wind at the same time." },
        { id = "h_again", text = "What else? The light's good for shootin', an' I'd like tae get back to it." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "A fair hunter gives the beast a fair chance.", next = "BACK", reply = "Aye, that's the Farstrider way: a clean shot an' nae cruelty, an' the hills will provide.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Bait, snares and poison all put meat on the table.", next = "BACK", reply = "They do, but they'll no' make ye a hunter. That takes patience, an' the wind.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What's the secret to a good shot?", next = "shot" },
        { text = "What do the Farstriders hunt?", next = "farstriders" },
        { text = "Tell me about the Lodge.", next = "lodge" },
        { text = "That's a great many trophies on the wall.", next = "trophies" },
        { text = "What should a hunter take first in Loch Modan?", next = "first", when = { class = "HUNTER" } },
        { text = "What lies down the hunter's road from here, Dargh?", next = "hp", when = { class = "HUNTER" } },
        { text = "The Lodge feels like a second home to a dwarf.", next = "hp_lodge", when = { race = "Dwarf", class = "HUNTER" } },
        { text = "My people hunt in silence. Dwarves are loud.", next = "hp_elf", when = { race = "NightElf" } },
        { text = "I'm a human hunter, if you can credit it.", next = "hp_human", when = { race = "Human", class = "HUNTER" } },
        { text = "Farewell, Dargh.", next = "END" },
      },
    },
    hp = {
      hub = true,
      lines = {
        { id = "hp_default", text = "Ye'll leave the Loch wi' a beast at yer heel an' the Hawk on yer shoulder, an' ye'll come back through, as they all do, older an' louder. Somewhere past thirty ye'll learn tae play dead, at forty ye'll trade yer leather for mail, an' after that the road runs tae places the Farstriders only tell stories about." },
        { id = "hp_low", when = { maxLevel = 15 }, text = "Ye're at the Loch, which means ye're at the start, so learn the wind an' the crocolisks before ye fret about the rest. Keep the Hawk up, keep a sting on whatever ye're shootin', an' feed yer beast before ye feed yerself." },
      },
      again = { { id = "hp_again", text = "What else? The wind's turnin'." } },
      choices = {
        { text = "How do I read the wind for a long shot?", next = "hp_wind" },
        { text = "Is playing dead worth learning?", next = "hp_feign", when = { minLevel = 20 } },
        { text = "What do the Farstriders' stories tell of?", next = "hp_end", when = { minLevel = 40 } },
        { text = "Something else, Dargh.", next = "hello" },
      },
    },
    hp_wind = {
      lines = { { id = "hpw_default", text = "Watch the reeds at the water's edge an' the smoke from Thelsamar's chimneys, an' aim a hand's width intae whatever they're tellin' ye. A rifle ball cares less than an arrow does, but at two hundred paces even a dwarven ball drifts, an' the crocolisk won't wait while ye work it out." } },
      choices = {
        { text = "I'll take the wind into every shot.", next = "BACK", reply = "Then ye'll hit more than ye miss, which is all any o' us can say.", fx = { align = { order = 1 } } },
        { text = "I'll get closer and skip the guesswork.", next = "BACK", reply = "Ye could, an' the crocolisk will be glad o' the company.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_feign = {
      lines = { { id = "hpf_default", text = "Worth more than any shot I teach. I'd ha' scoffed at it when I was young, but I've watched a Farstrider lie still in the mud while a Dark Iron patrol walked right over him, an' he's still drinkin' at the Stoutlager tonight." } },
      choices = {
        { text = "Then I'll learn it, and use it without shame.", next = "BACK", reply = "Good, an' if ye ever meet that Farstrider, buy him a drink from me.", fx = { align = { honor = -1 } } },
        { text = "I'd sooner fight than crawl in the mud.", next = "BACK", reply = "Then ye'll fight, an' maybe ye'll win, but the mud's never killed anyone.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_end = {
      big = true,
      lines = { { id = "hpe_default", text = "O' the Beaststalker mail, taken off the dead in Scholomance an' Stratholme an' Blackrock's spire, an' o' Rhok'delar, the bow an ancient in Felwood grows for the hunter who earns it. I've never held either, but there's a hook on the Lodge wall I've kept empty in case one o' my pupils comes home wi' somethin' worth hangin'." } },
      choices = {
        { text = "I'll fill that hook, Dargh.", next = "BACK", reply = "I'll hold ye tae it, an' I'll polish the hook while I wait.", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_lodge = {
      lines = { { id = "hpl_default", text = "It is, an' it's meant tae be. Every dwarf hunter worth the name comes through the Farstrider Lodge sooner or later, tae drink an' brag an' put somethin' on the wall, an' the Lodge remembers every one o' them." } },
      choices = {
        { text = "Then I'll earn my place on the wall.", next = "BACK", reply = "Aye, ye will, an' I'll be the one tae nail it up.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_elf = {
      lines = { { id = "hpe2_default", text = "We are, an' proud o' it! A rifle shot across the Loch tells every beast who's the hunter here, an' yer silent arrows only tell the one ye hit. Both work, I'll grant, but ours is better for the stories." } },
      choices = {
        { text = "Silence takes more skill than noise.", next = "BACK", reply = "Maybe, but noise takes more powder, an' powder's expensive, so we're even.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_human = {
      lines = { { id = "hph_default", text = "I can credit it, for I've seen a few o' ye come through lately, an' none o' ye were as hopeless as the Lodge expected. Hold yer breath before ye shoot an' dinnae let the crocolisks see ye flinch, an' ye'll do fine." } },
      choices = {
        { text = "High praise, from a Farstrider.", next = "BACK", reply = "It is, so dinnae waste it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shot = {
      lines = { { id = "sh_default", text = "Patience, an' knowin' the wind. Most young hunters shoot too fast, an' the beast is gone before the bullet lands." } },
      choices = {
        { text = "And if you miss?", next = "shot_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shot_miss = {
      big = true,
      lines = { { id = "sm_default", text = "Then ye've wounded somethin' that's no' dead yet, an' that's the worst sin a hunter can commit. D'ye follow a wounded beast, or let it go?" } },
      choices = {
        { text = "Follow it. You finish what you start.", next = "BACK", reply = "Aye, that's the right answer. Ye'll make a fine hunter.", fx = { align = { honor = 1 } } },
        { text = "Let it go. It's not worth the risk.", next = "BACK", reply = "Hmph. That's how hunters get eaten, an' how beasts suffer.", fx = { align = { honor = -1 } } },
      },
    },
    farstriders = {
      lines = { { id = "fa_default", text = "Bears, boars, crocolisks an' the odd trogg that wanders too close. We keep the wildlife in check so the farmers can sleep." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lodge = {
      lines = { { id = "lo_default", text = "The Farstrider Lodge sits on the east shore o' the loch, an' it's been a hunters' hall longer than I've been alive. Marek Ironheart keeps the trophies, Daryl the Youngling keeps boastin', an' I keep the young ones from shootin' each other." } },
      choices = {
        { text = "What do you make of Daryl?", next = "lodge_daryl" },
        { text = "Who else lives out here?", next = "lodge_folk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lodge_daryl = {
      lines = { { id = "ld_default", text = "He's a fine shot an' he knows it, an' the second part does him nae favours. He'll be the best o' us one day, if he learns that the beast doesnae care what his name is." } },
      choices = { { text = "He'll learn, or the loch will teach him.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    lodge_folk = {
      lines = { { id = "lf_default", text = "Vyrin Swiftwind, an elf from the far north who keeps the beds an' keeps Daryl humble, an' a handful o' traders who sell us powder, leather an' bowstrings. It's a quiet hall till somebody brings in a kill, an' then ye cannae hear yerself think." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trophies = {
      lines = { { id = "tp_default", text = "Marek's, mostly, an' he'll tell ye the story o' every one if ye stand still. The big crocolisk is his pride, though the one that hangs there is no' the one he's still after." } },
      choices = {
        { text = "A hunter should take only what he needs.", next = "BACK", reply = "That's the old Farstrider way, an' I hold tae it. Marek would say a trophy is a kind o' need, an' we've argued it for years.", fx = { align = { light = 1 } } },
        { text = "A wall like that is worth the powder.", next = "BACK", reply = "Marek'll like ye. I'll only say the wall doesnae feed anybody.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "fr_default", text = "The boars on the hills above the Lodge, tae learn their charge, an' then the bears. Leave the crocolisks on the islands till ye can put a shot through an eye at fifty paces, for their hide turns anythin' less." } },
      choices = { { text = "Boars, bears, then crocolisks. Understood.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    daryl = { { id = "tp_daryl", text = "A gifted lad who thinks the gift is the whole o' it. He'll learn, an' I hope it's from me an' no' from a bear." } },
    marek = { { id = "tp_marek", text = "Marek Ironheart's the heart o' this Lodge, an' a better hunter than me, though he shoots for the wall an' I shoot for the pot." } },
    crocolisks = { { id = "tp_croc", text = "They lie on the islands like logs till ye're close, an' then they're no' logs. Dinnae wade where ye cannae see the bottom." } },
    background = { { id = "tp_bg", text = "I'm a Farstrider an' a trainer. My aim speaks for itself." } },
    _none = { { id = "tp_none", text = "I couldnae say. Ask me about huntin'." } },
  },
}

---------------------------------------------------------------------------
-- Deek Fizzlebizz: gnome engineering trainer on the Stonewrought Dam.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_deek", id = TODO_NPC("Deek Fizzlebizz"), name = "Deek Fizzlebizz", title = "Engineering Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "lochmodan", "gnomeregan" }, temper = { "eager", "talkative" }, values = { "craft", "curious" },
  notices = { "craft", "race" },
  impression = {
    first = "He loves the dam's gears almost as much as explosions.",
    third = "{name} met Deek Fizzlebizz, a gnome engineering trainer on the Stonewrought Dam.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! I recalibrated the number three sluice by four percent since your visit, and I've been dying to show someone who'll appreciate it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The dam is very busy, and so am I, so please state your engineering business." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Nobody comes back, they say the wind's too much. Come and see what I've done to the number three sluice." },
    { id = "g_hi", text = "Hello, hello! Isn't the dam marvellous? Six thousand tons of stone, and every gear in it calculated to the last tooth!" },
    { id = "g_eng", when = { profession = "Engineering" }, text = "A fellow engineer! Come, come, I've something to show you." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome on the dam! Come and look at the sluice housing with me, because nobody else here appreciates a properly cut worm gear." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Your grandfathers cut this stone, and I tell everyone so, because the dwarves on the dam are far too modest to mention it more than hourly." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Your goggles are scorched on the left side, which suggests a gunpowder mishap. Common, very common, don't worry." },
  },
  start = "hello",
  nodes = {
    w2_fail = {
      narr = "He stops smiling, which on Deek looks almost like pain.",
      lines = {
        { id = "w2_fail_l0", text = "The loch would empty down the valley in an afternoon and take Thelsamar's lower houses with it, and the farms, and probably the road to Ironforge. That's why I check the sluices every morning, even the ones nobody else thinks matter." },
      },
      choices = {
        { text = "Does anyone else check them?", next = "w2_fail_who" },
        { text = "I'd sleep badly in your place.", next = "BACK" },
      },
    },
    w2_fail_who = {
      lines = {
        { id = "w2_fail_who_l0", text = "The wall guards walk the top, and Hinderweir's people do the stonework, but the gears are mine. I'd trust the stone for a thousand years; it's the gears I worry about, because I know exactly how clever I was when I made them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Deek Fizzlebizz, engineering trainer, and I've the best view in Loch Modan. The dwarves built this dam, but the gnomes helped with the clever bits, and I keep them working." },
      },
      again = {
        { id = "h_again3", text = "More questions? Wonderful! Stand on this side of the rail, though, the other one's wet." },
        { id = "h_again", text = "What else? I've a sluice gate to check, but I can talk!" },
        { id = "h_again2", text = "Go on, ask me anything!" },
      },
      choices = {
        { text = "An engineer should credit everyone whose work they build on.", next = "BACK", reply = "Yes, yes! Proper attribution is the foundation of all good science, and all good dams!", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Patent a rival's idea first, and the glory is yours.", next = "BACK", reply = "That's exactly how Gnomeregan's worst feuds started, and they ended in smoke and lawsuits!", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me in engineering.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "Tell me about the dam.", next = "dam" },
        { text = "Why train here, and not Ironforge?", next = "why" },
        { text = "Who works the dam with you?", next = "crew" },
        { text = "You keep looking over the edge.", next = "edge" },
        { text = "How do the sluice gears work?", next = "gears", when = { any = { { profession = "Engineering" }, { race = "Gnome" } } } },
        { text = "What would happen if the dam ever failed?", next = "w2_fail" },
        { text = "Goodbye, Deek.", next = "END" },
      },
    },
    dam = {
      lines = { { id = "da_default", text = "It holds back the whole loch, and if it ever broke, the valley below would be underwater in an hour. That's why we're so careful about it, and why the Chief Engineer checks every crack personally." } },
      choices = {
        { text = "Could it break?", next = "dam_break" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dam_break = {
      big = true,
      lines = { { id = "db_default", text = "Not if we keep it maintained, and not unless someone tried to blow it up, which the Dark Irons would love to do. Should we guard it more heavily, do you think, or trust the stone?" } },
      choices = {
        { text = "More guards. The Dark Irons are always plotting.", next = "BACK", reply = "That's what I've told the Chief Engineer, and he agrees, mostly.", fx = { align = { order = 1 } } },
        { text = "Trust the stone. Dwarven work doesn't fail.", next = "BACK", reply = "That's very trusting, and probably right, but I worry anyway.", fx = { align = { order = -1 } } },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because Tinker Town's full, and because the dam is the finest piece of engineering in Khaz Modan! Where better to learn than in the middle of it?" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crew = {
      lines = { { id = "cw_default", text = "Chief Engineer Hinderweir runs everything, and he's the seventh Hinderweir to do it, which he mentions slightly more often than necessary. The mountaineers keep everyone else off the walkway, and I keep the gears turning and the apprentices from oiling the wrong side of anything." } },
      choices = {
        { text = "What's Hinderweir like to work for?", next = "crew_chief" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_chief = {
      lines = { { id = "cc_default", text = "Thorough! He walks the full length every morning with a little hammer, tapping, and he can hear a hairline crack the way I can hear a loose bolt. I've suggested a listening device and he says he already has two, one on each side of his head." } },
      choices = {
        { text = "He sounds hard to impress.", next = "crew_impress" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_impress = {
      lines = { { id = "ci_default", text = "Very, and that's why I like it here. In Tinker Town everybody says an idea is brilliant before they've finished hearing it, and on the dam somebody actually checks the arithmetic." } },
      choices = { { text = "Checked arithmetic is a comfort.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    edge = {
      lines = { { id = "ed_default", text = "Do I? I suppose I do. It's a very long way down on the north side, and when you know exactly how much water is leaning on the south side, the comparison is hard to stop thinking about." } },
      choices = {
        { text = "Best not to think about it, then.", next = "BACK", reply = "That's the dwarven approach, and it seems to work for them. I'll try it for an afternoon." },
        { text = "Something else.", next = "BACK" },
      },
    },
    gears = {
      lines = { { id = "ge_default", text = "Oh, I hoped you'd ask! Each gate is far too heavy to lift directly, so there's a worm drive that trades speed for force, about three hundred turns of the wheel to one foot of gate. It's slow on purpose, because a gate that opens quickly is a flood." } },
      choices = {
        { text = "Slow on purpose. That's good design.", next = "BACK", reply = "Isn't it? The dwarves wanted it slow and the gnomes made it smooth, and that's the best sort of partnership.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stonewrought_dam = { { id = "tp_dam", text = "Dwarven stone and gnomish gearing, holding back an entire loch. I've measured most of it and I'm still not tired of it." } },
    tinker_town = { { id = "tp_tinker", text = "Crowded and brilliant and loud. I visit for parts and leave the same day, before someone talks me into a committee." } },
    hinderweir = { { id = "tp_hind", text = "The Chief Engineer, seventh of his name, and the most careful person I've ever met. If he's worried about something, I start worrying immediately." } },
    dark_iron = { { id = "tp_dark", text = "They'd like nothing better than to crack this dam, and they're good with powder, which I say with professional regret. The mountaineers watch the north approach for exactly that reason." } },
    background = { { id = "tp_bg", text = "I'm a gnome engineer, and I love this dam." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, unless it has gears in it." } },
  },
}

---------------------------------------------------------------------------
-- Greishan Ironstove: travelling bread merchant on the road between the Valley of Kings and Dun Algaz; he bakes in Thelsamar.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_greishan", id = TODO_NPC("Greishan Ironstove"), name = "Greishan Ironstove", title = "Traveling Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "cheerful", "chatty" }, values = { "practical", "community" },
  notices = { "hunger", "craft", "race" },
  impression = {
    first = "He knows every hungry mountaineer along the road.",
    third = "{name} met Greishan Ironstove, a travelling bread merchant on the roads of Loch Modan.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my favourite fellow traveller! I've a heel o' the good rye saved, an' it's yers if ye'll walk wi' me a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Bread's for sale, but I'll no' be walkin' wi' ye today." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ye're on the road late! So am I, mind. Have a heel o' bread an' walk wi' me as far as the next post." },
    { id = "g_hi", text = "Bread! Fresh bread, or as fresh as it gets after a day on the road. Hungry?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Ye must like my bread, or ye're just hungry." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then ye'll no' mind me sayin' the secret's in a long slow prove, an' that I'll no' tell ye a word more than that." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf on the road wi' an appetite, I'd wager. I've a dark loaf that tastes like the ones they bake under the mountain." },
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "Ye look half-starved an' half-dead. Buy some bread, an' eat it before ye fall over." },
  },
  start = "hello",
  nodes = {
    w2_buy = {
      lines = {
        { id = "w2_buy_l0", text = "The Algaz lads, by a mile, for they've nae oven an' Rockgar's cookin' would put a trogg off his supper. I leave them the burnt ends free, an' they pretend tae complain about it." },
      },
      choices = {
        { text = "Free bread for soldiers is a fine thing.", next = "BACK", fx = { affinity = 1 } },
        { text = "What about the dig? Do you go out there?", next = "w2_buy_dig" },
      },
    },
    w2_buy_dig = {
      lines = {
        { id = "w2_buy_dig_l0", text = "Once, an' never again. I took a basket out tae Ironband's, an' the troggs had the basket an' I had the run o' my life back tae the road. Now I leave the dig's loaves wi' Jern in Thelsamar, an' he sends them on wi' the powder." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Greishan Ironstove, travellin' merchant. I bake in Thelsamar an' walk the roads sellin' tae the mountaineers an' travellers, for they get hungry out here an' there's no inn for miles." },
      },
      again = {
        { id = "h_again3", text = "Walk wi' me if ye've more tae ask, for the loaves get nae fresher standin' still." },
        { id = "h_again", text = "What else? I've a long road ahead." },
        { id = "h_again2", text = "Go on, I've a minute, though the loaves are coolin' in the basket." },
      },
      choices = {
        { text = "Day-old bread should be sold as day-old, not fresh.", next = "BACK", reply = "Aye, an' it is, every loaf. A baker's word ought tae be as good as his crust.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Call it fresh. Nobody on the road knows the difference.", next = "BACK", reply = "The mountaineers know, believe me, for they've tasted every loaf I've ever baked.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your bread.", next = "BUSINESS" },
        { text = "Isn't the road dangerous?", next = "road" },
        { text = "What's the news on the road?", next = "news" },
        { text = "Where does the bread come from?", next = "bakery" },
        { text = "You must know every mountaineer by name.", next = "posts" },
        { text = "I bake a little myself.", next = "cook", when = { profession = "Cooking" } },
        { text = "Who buys the most bread on your round?", next = "w2_buy" },
        { text = "Farewell, Greishan.", next = "END" },
      },
    },
    road = {
      lines = { { id = "ro_default", text = "Dangerous? Aye, there's troggs an' bears an' the odd Dark Iron, but the mountaineers look after me. They'd starve without my bread, an' they know it, so they keep a close eye on me." } },
      choices = {
        { text = "You're brave to walk it alone.", next = "road_brave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_brave = {
      big = true,
      lines = { { id = "rb_default", text = "Brave or daft, my wife says, an' she's no' sure which. Would ye do it, if it was yer living?" } },
      choices = {
        { text = "Yes. The mountaineers need you.", next = "BACK", reply = "That's what I tell her, an' ye're a good sort for sayin' it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "No. Not worth dying for bread.", next = "BACK", reply = "Hmph. Ye'd be hungry, then, an' so would they.", fx = { align = { light = -1 } } },
      },
    },
    news = {
      lines = { { id = "ne_default", text = "The troggs are worse near the excavation, the dam's still standin', an' Mountaineer Stormpike's lookin' for someone tae run errands. That's about all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bakery = {
      lines = { { id = "bk_default", text = "My own oven in Thelsamar, lit well before dawn. Honni Goldenoat has the bakery in town an' the town's custom wi' it, so I took the road instead, an' we've no' had a cross word since." } },
      choices = {
        { text = "Two bakers and no quarrel?", next = "bakery_honni" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bakery_honni = {
      lines = { { id = "bh_default", text = "She bakes sweet an' I bake hard, for a road loaf has tae last three days in a pack. Folk who want a honey bun go tae her, an' folk who want somethin' tae break a trogg's skull wi' come tae me." } },
      choices = { { text = "A fair division of the trade.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    posts = {
      lines = { { id = "ps_default", text = "Every one, an' how they like their crust. Cobbleflint an' Gwarth at the Valley o' Kings want it dark, Kadrell in town wants it soft, an' the lads at the Algaz gate will eat whatever's left an' thank me for it." } },
      choices = {
        { text = "Which post is the hardest walk?", next = "posts_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    posts_hard = {
      lines = { { id = "ph_default", text = "North, up tae the gate at Dun Algaz, for the road climbs the whole way an' the wind comes down it like a slammed door. I do it twice a week, an' Pilot Hammerfoot always buys a loaf an' never eats it while I'm there." } },
      choices = {
        { text = "He's grieving a friend, I think.", next = "BACK", reply = "Aye, I'd heard. I leave him an extra heel o' bread an' say nothin', which is all a baker can do.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = { { id = "ck_default", text = "Do ye, now? Then here's one thing free: bake hotter than ye think an' shorter than ye think, an' let it cool on stone, no' on wood. The rest ye can pry out o' Vidra Hearthstove, if ye're brave." } },
      choices = { { text = "Hotter and shorter. Thank you, Greishan.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    honni = { { id = "tp_honni", text = "Honni Goldenoat, the town baker. She's the sweeter hand o' the two of us, an' I'll no' hear a word against her buns." } },
    dun_algaz = { { id = "tp_algaz", text = "The pass north tae the Wetlands. It's a steep road, an' there's been orc trouble on the far side, so I turn round at the gate." } },
    thelsamar = { { id = "tp_thel", text = "Home, an' the best wee town on the loch. Ye'll smell Vidra's sausages before ye see the roofs." } },
    mountaineers = { { id = "tp_mount", text = "Good lads an' lasses, an' hungry every one. They keep the troggs off the road an' I keep them fed, an' that's Loch Modan in a sentence." } },
    background = { { id = "tp_bg", text = "I'm a baker an' a walker. That's my life." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, but have some bread anyway." } },
  },
}

---------------------------------------------------------------------------
-- Missed folk (added later): Vyrin Swiftwind and the Farstrider Lodge traders (Xandar Goodbeard, Irene Sureshot,
-- Cliff Hadin, Kat Sampson, Aldren Cordon), Gothor Brumn in Thelsamar and Nillen Andemar on the Stonewrought Dam.
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Xandar Goodbeard: general supplies at the Farstrider Lodge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_xandar", id = TODO_NPC("Xandar Goodbeard"), name = "Xandar Goodbeard", title = "General Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "easygoing", "talkative" }, values = { "practical", "community" },
  notices = { "class", "kit" },
  impression = {
    first = "Xandar Goodbeard sells rope, rations and everything else a hunter forgets to pack from a counter in the Farstrider Lodge. His beard lives up to the name, and he combs it between customers.",
    third = "{name} met Xandar Goodbeard, who sells general supplies at the Farstrider Lodge in Loch Modan.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back from the hills! I knew ye'd come, so I've set aside a coil o' good rope an' some dry tinder." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Buy what ye need, but I'll no' be tellin' ye what ye forgot this time." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ye're in late! The hunters are all at the fire tellin' lies, but I'm still open, if ye need somethin' for the mornin'." },
    { id = "g_hi", text = "Come in, come in! If ye're headed out after game, tell me what ye've packed an' I'll tell ye what ye've forgotten." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the hills! An' I'd wager ye ran out o' somethin', for everybody does." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, an' travellin' light, I see. That's grand till the third day out, when ye'd trade yer rifle for a dry pair o' socks." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Yer kit's seen better days, friend. I cannae mend it, but I can sell ye the oil an' thread tae stop it gettin' worse." },
  },
  start = "hello",
  nodes = {
    w2_winter = {
      lines = {
        { id = "w2_winter_l0", text = "Wool next tae the skin, oilcloth over it, an' twice the lamp oil ye think ye'll need, for the dark comes early an' the fog comes off the water like a wall. An' a second pair o' boots, dry, in a sealed pack." },
      },
      choices = {
        { text = "A second pair of boots seems excessive.", next = "w2_winter_boots" },
        { text = "I'll take that advice gladly.", next = "BACK" },
      },
    },
    w2_winter_boots = {
      lines = {
        { id = "w2_winter_boots_l0", text = "That's what Daryl said last winter, an' he came back in January wi' his toes the colour o' a gnome's beard. I sold him the boots at full price, an' I'd do it again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Xandar Goodbeard, general supplies. The hunters here think only o' powder an' shot, so I'm the one who remembers they need tae eat, sleep dry an' find their way home." },
        { id = "h_skin", when = { profession = "Skinning" }, text = "Xandar Goodbeard. Ye've a skinnin' knife on yer belt, so ye'll want salt for the hides, an' I've a barrel o' it just in from Thelsamar." },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere tae be but behind this counter." },
        { id = "h_again2", text = "Go on, ask, I like a bit o' talk between sales." },
        { id = "h_again3", text = "Aye? I'm listenin', an' combin', but mostly listenin'." },
      },
      choices = {
        { text = "A shopkeeper should tell a hunter what they truly need.", next = "BACK", reply = "Aye, an' that's how I've kept my customers alive these twenty years.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell them more than they need. They'll lose half anyway.", next = "BACK", reply = "They might, but they'll no' come back here if they think I've fleeced them.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "What do hunters forget most?", next = "forget" },
        { text = "How do supplies reach the Lodge?", next = "carts" },
        { text = "That is a remarkable beard.", next = "beard" },
        { text = "What should I pack for the loch's far shore?", next = "pack", when = { class = "HUNTER" } },
        { text = "What's the oddest thing a hunter has asked you for?", next = "odd" },
        { text = "What's Marek Ironheart like to work for?", next = "xg_marek" },
        { text = "The bears around the loch seem restless.", next = "xg_bears" },
        { text = "What would you pack for a winter on the loch?", next = "w2_winter" },
        { text = "Good day, Xandar.", next = "END" },
      },
    },
    xg_marek = {
      lines = {
        { id = "xg_marek_1", text = "Fair, an' gruff, an' he's never once asked me how the ledger's doin', which suits us both. Marek runs the Lodge like a hunt, wi' everyone off doin' their part an' no one standin' about, so I keep the shelves full an' he keeps the hunters fed on work." },
      },
      choices = {
        { text = "What work does he send hunters on?", next = "xg_work" },
        { text = "A gruff master who leaves you be. Ideal.", next = "BACK", reply = "Aye, it is, an' I'd no' trade him for a softer one." },
      },
    },
    xg_work = {
      lines = {
        { id = "xg_work_1", text = "Bears an' boars, mostly, an' the odd elusive beast the lads like tae boast about over the fire. Marek wants the valley's game thinned so the farms by Thelsamar can keep their stock, an' he pays in coin an' in respect, which hunters value about equal." },
      },
      choices = {
        { text = "Coin and respect. I'll ask him for work.", next = "BACK", fx = { affinity = 1 } },
        { text = "Thinning the game for the farmers. Something else.", next = "BACK" },
      },
    },
    xg_bears = {
      lines = {
        { id = "xg_bears_1", text = "They are, an' the hunters say it's the troggs pushin' them down out o' the hills, so they come lookin' for an easier meal. I've had a black bear on the porch twice this month, an' the second time it took a sack o' oats wi' it." },
      },
      choices = {
        { text = "A bear stole your oats?", next = "xg_oats" },
        { text = "I'm a hunter. I'll deal with your bear.", next = "xg_oats", when = { class = "HUNTER" } },
        { text = "Troggs pushing bears. That's a chain of trouble.", next = "BACK" },
      },
    },
    xg_oats = {
      lines = {
        { id = "xg_oats_1", text = "Bold as ye like, an' Irene shot at it off the back porch an' missed, which she'll deny tae her last breath. I'd ask ye no' tae mention it, for she's still sore about it." },
      },
      choices = {
        { text = "I'll keep Irene's secret.", next = "BACK" },
        { text = "Even Sureshot misses sometimes. Something else.", next = "BACK" },
      },
    },
    forget = {
      lines = { { id = "fo_default", text = "Water, if ye'd believe it, beside a loch the size o' this one. They think they'll drink from the shore, an' then they find a crocolisk has had the same idea first." } },
      choices = {
        { text = "And after water?", next = "forget_next" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget_next = {
      lines = { { id = "fn_default", text = "A second flint, for the first always gets wet. Daryl the Youngling came back last autumn havin' eaten a boar haunch raw because he'd nae fire, an' he told the whole Lodge it was how the old hunters did it." } },
      choices = { { text = "And did anyone believe him?", next = "BACK", reply = "No' a soul, but Marek let him finish the story, which was kinder than I'd have been.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    carts = {
      lines = { { id = "ca_default", text = "By cart from Thelsamar, round the south end o' the loch, when the road's clear. Yanni Stoutheart packs my orders in town, an' the mountaineers walk the cart past the ogre country at Mo'grosh when they can spare the rifles." } },
      choices = {
        { text = "And when they can't spare them?", next = "carts_cant" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carts_cant = {
      big = true,
      lines = { { id = "cc_default", text = "Then I wait, or I pay a couple o' the Lodge's hunters tae ride along. Marek says I should raise my prices tae cover it, an' I say a hunter who cannae afford rations goes out wi'out them. What would ye do?" } },
      choices = {
        { text = "Hold your prices. People need what you sell.", next = "BACK", reply = "That's how I see it. I'll no' get rich, but nobody starves on the east shore on my account.", fx = { align = { light = 1 } } },
        { text = "Raise them. Your risk deserves its price.", next = "BACK", reply = "Marek'll be pleased somebody agrees wi' him. I'll think on it, though I doubt I'll do it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beard = {
      lines = { { id = "be_default", text = "Thank ye! It's the family's pride, an' the name came from my great-grandfather's, which they say reached his belt buckle. I use a boar-bristle comb an' a wee drop o' lamp oil, an' I'll no' be told that's vanity." } },
      choices = { { text = "It's plainly working.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    pack = {
      lines = { { id = "pk_default", text = "Two days' rations for a one-day hunt, a coil o' rope, an' somethin' tae burn that's already dry. If ye're goin' north toward the ogres, add bandages, an' if ye're goin' out tae the islands, add a second pair o' boots." } },
      choices = { { text = "Then set me up properly.", next = "BUSINESS" }, { text = "Good advice. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    odd = {
      lines = { { id = "od_default", text = "A gnome came through wantin' forty yards o' rope, a bucket an' a live chicken, an' wouldnae say what for. I sold him the rope an' the bucket. He came back a week later lookin' very pleased, an' he still wouldnae say." } },
      choices = { { text = "Now I want to know too.", next = "BACK", reply = "So do I, friend. It keeps me awake some nights.", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    thelsamar = { { id = "tp_thel", text = "Across the loch. I go in twice a season for stock an' sausages, an' I'm always glad tae get back tae the quiet." } },
    marek = { { id = "tp_marek", text = "Marek Ironheart runs the Lodge, in so far as hunters let themselves be run. He's fair, an' he pays his bill." } },
    farstrider_lodge = { { id = "tp_lodge", text = "The best hall on the loch, an' the loudest after a good hunt. There's a bed here for anybody who can tell a true story about a beast." } },
    mogrosh = { { id = "tp_mog", text = "Ogres, up in the north-east hills. They leave the Lodge alone, mostly, but they'll take a cart if they find one unguarded." } },
    background = { { id = "tp_bg", text = "I'm a Goodbeard, an' I keep the Lodge's stores. I've never shot anythin' bigger than a rabbit, an' I'm content wi' that." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, friend. Ask the hunters, for they wander further than I do." } },
  },
}

---------------------------------------------------------------------------
-- Irene Sureshot: gunsmith at the Farstrider Lodge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_irene", id = TODO_NPC("Irene Sureshot"), name = "Irene Sureshot", title = "Gunsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "sharp", "exacting" }, values = { "craft", "skill" },
  notices = { "class", "craft" },
  impression = {
    first = "Irene Sureshot sells rifles and shot at the Farstrider Lodge and tests every barrel herself off the back porch. She has little patience for hunters who blame the gun.",
    third = "{name} met Irene Sureshot, the gunsmith at the Farstrider Lodge in Loch Modan.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you've come back. Yer rifle sounded true out on the range, an' I'll take that as a compliment tae my work." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Buy yer shot an' go, an' dinnae blame my barrel for yer own aim." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf, good, then ye'll want a rifle that outlasts ye, same as yer grandsire's did. Step up an' let me see what ye're carryin' now." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "I dinnae test barrels after dark, so it's quiet for once. What are ye after?" },
    { id = "g_hi", text = "Rifles, shot an' powder. If ye've come tae tell me yer last one pulled left, I'll ask tae see ye shoot it first." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did it shoot true, or did ye?" },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Let me see the lock on that piece o' yours. Aye, ye clean it, which puts ye ahead o' most who walk in here." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Ye build yer own, by the look o' yer hands. I'll no' sell ye a rifle, then, but I'll sell ye a barrel that's bored straighter than ye'll manage at a bench." },
  },
  start = "hello",
  nodes = {
    w2_damp = {
      lines = {
        { id = "w2_damp_l0", text = "It troubles everythin'. Powder cakes, locks rust, an' a stock left by the window swells till the barrel sits crooked in it. I keep every gun on the rack oiled each night, an' I'll oil yours too, if ye bring it in before it's ruined." },
      },
      choices = {
        { text = "Bows must fare worse, surely.", next = "w2_damp_bows" },
        { text = "I'll bring it by.", next = "BACK" },
      },
    },
    w2_damp_bows = {
      lines = {
        { id = "w2_damp_bows_l0", text = "Ye'd think so, but Cliff waxes his strings like a priest at prayer, an' his bows come through the winter better than half my rifles. I'll deny I said that if ye repeat it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Irene Sureshot, gunsmith tae the Farstriders. Every rifle on that rack has put ten balls through a plank at eighty paces before I'd hang it there, an' I did the shootin' myself." },
        { id = "h_bow", when = { race = "NightElf" }, text = "Irene Sureshot, gunsmith. Ye'll be wantin' Cliff Hadin an' his bows, I expect, an' I'll no' take it personal. Come back when ye're ready tae be heard as well as felt." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, I've a barrel coolin'." },
        { id = "h_again2", text = "Go on, ask. I'll tell ye straight, same as I'd tell ye a barrel's bent." },
        { id = "h_again3", text = "Aye? Speak up over the porch, somebody's testin' a fowler." },
      },
      choices = {
        { text = "A rifle should be sold with an honest account of its faults.", next = "BACK", reply = "Aye, an' every one I sell is, for I'd no' let a bad rifle leave this Lodge.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell a bent barrel to a fool. They'll never notice.", next = "BACK", reply = "They'll notice when it bursts in their face, an' so will everyone else at the Lodge.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see your rifles.", next = "BUSINESS" },
        { text = "What makes a rifle shoot true?", next = "true_shot" },
        { text = "A gunsmith and a bowyer under one roof.", next = "cliff" },
        { text = "Did you earn the name Sureshot?", next = "name" },
        { text = "Look over my rifle for me.", next = "mine", when = { class = "HUNTER" } },
        { text = "What's the best shot you ever saw?", next = "best" },
        { text = "Who taught you to make rifles?", next = "is_taught" },
        { text = "What do the Farstriders hunt with your guns?", next = "is_hunt" },
        { text = "Does the damp off the loch trouble your rifles?", next = "w2_damp" },
        { text = "Good day, Irene.", next = "END" },
      },
    },
    is_taught = {
      lines = {
        { id = "is_taught_1", text = "My father, in a workshop off the Great Forge, an' he taught me tae shoot before he'd let me file a sight. He said a gunsmith who cannae shoot is like a brewer who doesnae drink, an' I've found that tae be true." },
      },
      choices = {
        { text = "Is your father still in Ironforge?", next = "is_father" },
        { text = "A brewer who doesn't drink. That's a fine line.", next = "BACK", reply = "It's his line, an' he'd be pleased ye liked it." },
      },
    },
    is_father = {
      lines = {
        { id = "is_father_1", text = "Aye, still at the bench, though his eyes are no' what they were. He sends me barrels by the Thelsamar carts an' I send him back my targets, so he can see I'm still holdin' tight on the trigger." },
      },
      choices = {
        { text = "That's a good way to stay close.", next = "BACK", fx = { affinity = 1 } },
        { text = "A craft passed down. Something else.", next = "BACK" },
      },
    },
    is_hunt = {
      lines = {
        { id = "is_hunt_1", text = "Bears, boars an' the big mountain buzzards, an' anythin' that comes out o' Stonesplinter Valley wi' a trogg on its back. A rifle drops a beast at a distance where a bow just annoys it, whatever Cliff might tell ye." },
      },
      choices = {
        { text = "Cliff would say the bow is quieter.", next = "is_quiet" },
        { text = "I'm a hunter. I've seen both work.", next = "is_quiet", when = { class = "HUNTER" } },
        { text = "Troggs riding beasts?", next = "BACK", reply = "No' quite, but they'd try, if they were clever enough." },
      },
    },
    is_quiet = {
      lines = {
        { id = "is_quiet_1", text = "Quieter, aye, an' slower, an' more polite, which is Cliff all over. A rifle tells the whole valley ye're there, an' I say that's no bad thing when the valley's full o' troggs." },
      },
      choices = {
        { text = "Loud has its uses.", next = "BACK" },
        { text = "Something else, Irene.", next = "BACK" },
      },
    },
    true_shot = {
      lines = { { id = "ts_default", text = "A straight bore, a tight breech an' a hunter who squeezes instead o' yankin'. I can sell ye the first two, an' Dargh Trueaim downstairs will try tae teach ye the third." } },
      choices = {
        { text = "Which matters most?", next = "true_most" },
        { text = "Something else.", next = "BACK" },
      },
    },
    true_most = {
      lines = { { id = "tm_default", text = "The hunter, an' I say that as the one who makes the gun. I've watched Marek Ironheart take a boar wi' a rusted fowlin' piece I'd no' have used as a poker, an' I've watched lads miss a barn wi' my best work." } },
      choices = { { text = "That's honest, for a seller.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    cliff = {
      lines = { { id = "cl_default", text = "Cliff Hadin's a decent man wi' a daft trade. We've an arrangement: I dinnae tell his customers a bow is a bent stick, an' he doesnae tell mine that a rifle scares off the supper." } },
      choices = {
        { text = "And does the arrangement hold?", next = "cliff_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cliff_hold = {
      big = true,
      lines = { { id = "ch_default", text = "Till the second mug, most evenin's. Then he says a true hunter should feel the draw in his own arm, an' I say a true hunter should bring home meat by whatever means works. Go on, settle it for us." } },
      choices = {
        { text = "The old ways teach more. Earn the shot.", next = "BACK", reply = "Ach, ye're one o' his. Well, at least ye said it tae my face, which is more than he does sober.", fx = { align = { order = 1 } } },
        { text = "Use what works. The pot doesn't care.", next = "BACK", reply = "Ha! That's the truth o' it, an' I'll be quotin' ye at him tonight.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "My grandmother earned it, an' I've only tried no' tae shame it. Every Sureshot is handed a rifle at ten an' told the name comes off the door the day one of us misses a still target." } },
      choices = { { text = "And has one of you ever missed?", next = "BACK", reply = "No' that any of us has admitted. That's the other family tradition.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    mine = {
      lines = { { id = "mi_default", text = "Hand it here. The bore's clean an' the lock's sound, but yer flint's worn tae a nub an' the ramrod's bent, which is why ye've been seatin' the ball crooked. Fix those two an' ye'll gain ten paces." } },
      choices = { { text = "I'll fix both. Thank you.", next = "BACK", fx = { affinity = 1 } }, { text = "Sell me what I need.", next = "BUSINESS" } },
    },
    best = {
      lines = { { id = "bs_default", text = "Marek, three winters back, on a crocolisk that had a mountaineer by the boot out on the ice. One ball, through the eye, at a distance I'd have called a waste o' powder. The mountaineer kept the boot, an' Marek never mentions it." } },
      choices = { { text = "That's a shot worth a rifle's price.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    powder = { { id = "tp_powder", text = "Keep it dry, keep it in horn an' no' in tin, an' never borrow a stranger's. Half the misfires I'm blamed for are somebody else's damp powder." } },
    farstriders = { { id = "tp_far", text = "The best shots on the loch, an' the worst at cleanin' up after themselves. I'd no' live anywhere else." } },
    cliff_hadin = { { id = "tp_cliff", text = "The bowyer. He makes a bonny bow, I'll give him that, for all the good it does anybody." } },
    background = { { id = "tp_bg", text = "I'm a Sureshot an' a gunsmith. I make them, I test them, an' I sell the ones that pass." } },
    _none = { { id = "tp_none", text = "I couldnae say. If it cannae be measured wi' a bore gauge, I've likely no opinion." } },
  },
}

---------------------------------------------------------------------------
-- Cliff Hadin: human bowyer at the Farstrider Lodge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_cliff", id = TODO_NPC("Cliff Hadin"), name = "Cliff Hadin", title = "Bowyer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "mild", "stubborn" }, values = { "craft", "patient" },
  notices = { "class", "race" },
  impression = {
    first = "Cliff Hadin is a human who makes bows in a lodge full of dwarven riflemen and has made his peace with being outvoted. He works slowly, speaks slowly, and will not be hurried over a stave.",
    third = "{name} met Cliff Hadin, a human bowyer at the Farstrider Lodge in Loch Modan.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. I've a new stave curing in the corner, and I'd value your opinion on it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The bows are on the rack, and the prices are on the tags." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Good evening. I've put the tools away, but I'm happy to talk, if you don't mind the smell of glue." },
    { id = "g_hi", text = "Good day to you. Bows and arrows here, for the few in this lodge who still care for a quiet shot." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. How is the string holding? Loch Modan's damp is hard on a string." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You've an archer's shoulders, or you could have, with a little work. Don't let the dwarves talk you into a rifle before you've tried a proper longbow." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "An elf! I'll be honest, I'm a little nervous showing my work to one of your people. Be kind, if you can, and truthful if you can't." },
  },
  start = "hello",
  nodes = {
    w2_finest = {
      lines = {
        { id = "w2_finest_l0", text = "A yew longbow for a ranger passing through on the way north, years ago. I spent a whole winter on it, and he paid me in silver and a story, and I've never been sure which was worth more." },
      },
      choices = {
        { text = "What was the story?", next = "w2_finest_story" },
        { text = "A whole winter on one bow is too long.", next = "BACK" },
      },
    },
    w2_finest_story = {
      lines = {
        { id = "w2_finest_story_l0", text = "He'd been in Quel'Thalas during the war, and he said the elves there laughed at human bows, until one of ours put an arrow through a troll at a range their own archers wouldn't try. I suspect he improved it in the telling, but I liked it anyway." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Cliff Hadin, bowyer. I came up from Stormwind's country years ago to learn how the Farstriders season their wood, and I never quite got round to leaving." },
        { id = "h_human", when = { race = "Human" }, text = "Cliff Hadin, bowyer, and it's good to hear a voice from home. You'll have noticed everyone here is rather shorter and louder than us, and you get used to it." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm only waxing a string." },
        { id = "h_again2", text = "Go on. There's no hurrying this glue anyway." },
        { id = "h_again3", text = "Yes? Take your time; I always do." },
      },
      choices = {
        { text = "A bowyer's mark should mean a bow that won't fail you.", next = "BACK", reply = "It should, and mine does. I'd sooner burn a bad stave than sell it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the warped bows to the rifle crowd. They'd never know.", next = "BACK", reply = "They might not, but I would, and I'd lose sleep over it for a month.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "A bowyer among riflemen.", next = "rifles" },
        { text = "How do you make a good bow?", next = "craft" },
        { text = "What brought a human to this lodge?", next = "came" },
        { text = "What draw weight would suit me?", next = "draw", when = { class = "HUNTER" } },
        { text = "What do you think of arrows, as a craft?", next = "arrows" },
        { text = "How do the Farstriders season their wood?", next = "ch_season" },
        { text = "Do you miss the south?", next = "ch_south" },
        { text = "What's the finest bow you ever made?", next = "w2_finest" },
        { text = "Good day, Cliff.", next = "END" },
      },
    },
    ch_season = {
      lines = {
        { id = "ch_season_1", text = "Slowly, which is what I came to learn, and what I've had the most trouble teaching anyone else. They cut the staves in winter when the sap is down and leave them in the lodge rafters over the fire for two full years, and the smoke does the rest." },
      },
      choices = {
        { text = "Two years? That's a long wait for a bow.", next = "ch_wait" },
        { text = "Smoke-cured wood. That's clever.", next = "BACK", reply = "It's old, and I think the old ways are the clever ones." },
      },
    },
    ch_wait = {
      lines = {
        { id = "ch_wait_1", text = "It is, and the dwarves think I'm mad to bother when a rifle needs no waiting at all. But a bow made that way will outlast its archer, and I've two in the rafters now that I'll finish when I'm old." },
      },
      choices = {
        { text = "Patience is its own craft.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Cliff.", next = "BACK" },
      },
    },
    ch_south = {
      lines = {
        { id = "ch_south_1", text = "Some days, when the snow comes early, I think of the fields round Goldshire and the smell of the bakery. But Stormwind's full of bowyers, and up here I'm the only one, and that's a kind of home in its own right." },
      },
      choices = {
        { text = "The only bowyer among riflemen.", next = "ch_only" },
        { text = "I'm from Elwynn too. Goldshire's still there.", next = "ch_only", when = { race = "Human" } },
        { text = "Home is where you're needed.", next = "BACK" },
      },
    },
    ch_only = {
      lines = {
        { id = "ch_only_1", text = "The only one, and I've made a peace with it. Daryl the Youngling comes by now and then to try a bow, and he's the closest I've had to a student, though he keeps asking when I'll teach him to shoot a rifle." },
      },
      choices = {
        { text = "Daryl might come round to the bow.", next = "BACK" },
        { text = "Even your students want rifles. Something else.", next = "BACK" },
      },
    },
    rifles = {
      lines = { { id = "ri_default", text = "It's a lonely trade here, I'll admit. Irene Sureshot tells me daily that I sell bent sticks, and the dwarves buy from me mostly when the powder carts are late. But Vyrin Swiftwind shoots my bows, and one customer like her is worth twenty." } },
      choices = {
        { text = "What does Vyrin think of your work?", next = "rifles_vyrin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rifles_vyrin = {
      lines = { { id = "rv_default", text = "She said my first bow was adequate, and I didn't sleep for two nights from pride. Her people have made bows for longer than mine have had kings, so I took adequate as a very great compliment." } },
      choices = { { text = "From her, I think it was.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    craft = {
      lines = { { id = "cr_default", text = "You start three years before you need it, because the stave has to season. Then you follow one ring of the grain down the whole length of the back, and you never cut through it, however much easier that would be." } },
      choices = {
        { text = "Three years is a long wait for one bow.", next = "craft_wait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_wait = {
      big = true,
      lines = { { id = "cw_default", text = "It is, and there are faster ways. You can dry a stave by the fire in a month and sell it by spring, and most buyers will never know until it cracks on some cold morning. Plenty of bowyers do it, and I can't say they starve." } },
      choices = {
        { text = "Do it properly, or don't do it.", next = "BACK", reply = "That's how I was taught, and it's why I'm poor and my bows are not. Thank you for saying it.", fx = { align = { honor = 1 } } },
        { text = "A man has to eat. Sell the quick ones too.", next = "BACK", reply = "I've been tempted, some winters. But I'd know, every time I heard one draw.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    came = {
      lines = { { id = "ca_default", text = "The wood, at first. There's a yew grows on the islands in this loch with a grain like nothing in Elwynn, and the Farstriders know how to cut it without killing the tree. I came to learn that, and then the fishing turned out to be good as well." } },
      choices = { { text = "Good wood and good fishing. Fair reasons.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    draw = {
      lines = { { id = "dr_default", text = "Hold your arm out and pull back as if there were a string. No, don't hunch. I'd start you a little lighter than you think you want, because a bow you can hold steady will always beat a bow you can barely draw." } },
      choices = { { text = "Lighter and steady. Show me those.", next = "BUSINESS" }, { text = "I'll think on it. Something else.", next = "BACK" } },
    },
    arrows = {
      lines = { { id = "ar_default", text = "That they're the half of the work nobody praises. A bow lasts for years, but an arrow is made to be lost, and it still has to fly true the once. I fletch with goose from the loch, and I can tell my own shafts in another man's quiver." } },
      choices = { { text = "Made to be lost, and still made well.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    loch_modan = { { id = "tp_loch", text = "It's a handsome country, all water and pine. A man could do worse than grow old beside a lake with good timber on its islands." } },
    vyrin = { { id = "tp_vyrin", text = "Vyrin Swiftwind keeps the beds and shoots better than any of us. She's the one person here whose opinion of a bow I'd lose sleep over." } },
    irene = { { id = "tp_irene", text = "Irene Sureshot, the gunsmith. She's the best at her trade I've ever met, and I'd thank you not to tell her I said it." } },
    farstriders = { { id = "tp_far", text = "They hunted with elven rangers once, and they still keep a few of the old ways about wood and patience, under all the gunsmoke." } },
    background = { { id = "tp_bg", text = "I'm a bowyer from the south who came for the timber. That's the whole of it." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. I spend most of my days looking at wood grain." } },
  },
}

---------------------------------------------------------------------------
-- Kat Sampson: human leather armor merchant at the Farstrider Lodge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_kat", id = TODO_NPC("Kat Sampson"), name = "Kat Sampson", title = "Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "brisk", "plain-spoken" }, values = { "practical", "craft" },
  notices = { "craft", "class" },
  impression = {
    first = "Kat Sampson sells leather armour at the Farstrider Lodge, most of it cut from what the hunters bring in. She pinches every hide between two fingers before she will talk about a price.",
    third = "{name} met Kat Sampson, who sells leather armour at the Farstrider Lodge in Loch Modan.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and still in one piece. I'll take that as proof my stitching holds." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Pick what you want and pay for it, because I've no time for chatter." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Good, then you'll have hides for me, or you'll want something to keep yours whole. Which is it?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "I'm stitching by lamplight, so mind you don't stand in it. What do you need?" },
    { id = "g_hi", text = "Leather armour, cut and stitched here at the Lodge. Have a look, and tell me what's been biting you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Did the last piece hold, or did something get through it?" },
  },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = { "Skinning", "Leatherworking" } },
      text = "You work hides, I can see it in your knife hand. If you've anything clean from the bears up north, I'll look at it before the dwarves get a chance." },
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You're wearing more metal than I sell in a year. Still, a leather jerkin under all that would stop it chafing, and nobody ever thinks of that." },
  },
  start = "hello",
  nodes = {
    w2_self = {
      lines = {
        { id = "w2_self_l0", text = "Gloves, mostly. I've made myself the same pair eleven times, trying to get the thumb right, and I haven't managed it yet. Leatherwork's like that: the one thing you make for nobody is the one you can't finish." },
      },
      choices = {
        { text = "Show me the latest pair.", next = "w2_self_show" },
        { text = "Perfection's a waste of good leather.", next = "BACK" },
      },
    },
    w2_self_show = {
      narr = "She pulls a pair of soft brown gloves from under the counter and turns the left one over.",
      lines = {
        { id = "w2_self_show_l0", text = "There. See how the thumb pulls when you close your fist? Nobody else would notice, but I do, every time I pick up the awl." },
      },
      choices = {
        { text = "They look perfect to me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Kat Sampson. The hunters bring me hides, I turn them into something that'll stop a tusk, and then I sell it back to the same hunters. It's a tidy arrangement for everyone except the boars." },
        { id = "h_leather", when = { class = { "HUNTER", "ROGUE", "DRUID" } }, text = "Kat Sampson, and you're my sort of customer. Leather moves with you and doesn't clank, and out by the loch, quiet matters more than thick." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a jerkin half stitched." },
        { id = "h_again2", text = "Go on, I can sew and talk." },
        { id = "h_again3", text = "Yes? Ask, and pass me that awl while you're there." },
      },
      choices = {
        { text = "A hunter should sell you hides as they are, scars and all.", next = "BACK", reply = "Exactly, and I pay a fair price for honest hides, scars included.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Patch the holes and sell the hide as perfect.", next = "BACK", reply = "Not in my shop. A hide that tears at the wrong moment costs somebody their skin.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "Which hides make the best armour here?", next = "hides" },
        { text = "How does a human end up at a dwarven lodge?", next = "lodge" },
        { text = "The hunters keep you supplied, then.", next = "hunters" },
        { text = "I skin my own kills. What will you buy?", next = "skin", when = { profession = { "Skinning", "Leatherworking" } } },
        { text = "How long does a jerkin take you?", next = "jerkin" },
        { text = "What's the strangest hide anyone's brought you?", next = "ks_strange" },
        { text = "Do the hunters treat you as one of them?", next = "ks_treat" },
        { text = "What do you make for yourself, when there's no order?", next = "w2_self" },
        { text = "Good day, Kat.", next = "END" },
      },
    },
    ks_strange = {
      lines = {
        { id = "ks_strange_1", text = "A trogg's, which I refused, and then a buzzard's, which I didn't know what to do with. The trogg hide was a dare from one of the younger dwarves, and Marek made him bury it before it made the whole lodge smell." },
      },
      choices = {
        { text = "Why refuse the trogg hide?", next = "ks_trogg" },
        { text = "A dare gone very wrong.", next = "BACK", reply = "And a smell that lasted a week." },
      },
    },
    ks_trogg = {
      lines = {
        { id = "ks_trogg_1", text = "Because a trogg isn't a beast, whatever the dwarves say, and I'll not wear what used to walk on two feet. They come up out of the earth by Stonesplinter, and the mountaineers fight them every week, but I'll have no part of their skins." },
      },
      choices = {
        { text = "That's a fair line to draw.", next = "BACK", fx = { affinity = 1 } },
        { text = "Troggs aren't beasts. I agree.", next = "BACK" },
      },
    },
    ks_treat = {
      lines = {
        { id = "ks_treat_1", text = "Mostly, though I'm the only one here who can't grow a beard, and they won't let me forget it. I came up from the farms near Thelsamar to learn tanning, and I stayed because nobody at the lodge ever tells me how a hide should be cut." },
      },
      choices = {
        { text = "They trust your judgment, then.", next = "ks_trust" },
        { text = "I'm a leatherworker. I'd trust it too.", next = "ks_trust", when = { profession = "Leatherworking" } },
        { text = "No beard and no orders. A good trade.", next = "BACK" },
      },
    },
    ks_trust = {
      lines = {
        { id = "ks_trust_1", text = "They do, and they trust me with their boots, which is about the highest honour a dwarf can give. Marek Ironheart wore a pair of mine to Ironforge last year and came back telling everyone a human made them." },
      },
      choices = {
        { text = "That's high praise.", next = "BACK" },
        { text = "Something else, Kat.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Bear for warmth, boar for toughness, and crocolisk if you want something that sheds water and turns a claw. The crocolisk is the best of them and the hardest to come by, because the crocolisk generally objects." } },
      choices = {
        { text = "Who brings in the crocolisk?", next = "hides_croc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides_croc = {
      lines = { { id = "hc_default", text = "Marek Ironheart, mostly, and he keeps the best skins for his wall before I ever see them. I've told him a hide on a wall keeps nobody dry, and he tells me a hide on a wall keeps him happy." } },
      choices = { { text = "You'll not win that argument.", next = "BACK", reply = "No, but I'll keep having it. It's cheaper than buying from Menethil.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    lodge = {
      lines = { { id = "lo_default", text = "I followed the hides. A leatherworker goes where the hunting is, and there's no better hunting in the eastern kingdoms than round this loch. The dwarves took a season to stop calling me 'the tall one', and we've got on well since." } },
      choices = { { text = "And what do they call you now?", next = "BACK", reply = "Kat, mostly. 'The tall one' when I'm not supposed to hear.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    hunters = {
      lines = { { id = "hu_default", text = "Too well, some seasons. When the hunting's good I've more hides than hands, and half of them are hacked off by lads who think skinning is the dull part after the shot." } },
      choices = {
        { text = "What do you do with a badly cut hide?", next = "hunters_bad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters_bad = {
      big = true,
      lines = { { id = "hb_default", text = "Cut it small for straps and patches, and pay the lad half. Some of them say I should pay full price, since the beast was just as hard to kill. I say an animal that died for a ruined hide died for nothing, and that ought to cost somebody." } },
      choices = {
        { text = "You're right. Waste a kill and you owe for it.", next = "BACK", reply = "That's it exactly. Dargh says the same to his students, and they listen to him even less than to me.", fx = { align = { light = 1 } } },
        { text = "Pay them full. The risk was the same.", next = "BACK", reply = "Then they'd never learn to use the knife properly. But I can tell you've done the killing yourself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skin = {
      lines = { { id = "sk_default", text = "Whole hides, no holes through the back, and scraped while they're fresh. Bring me bear from the northern caves like that and I'll not haggle. Bring me something that looks as though it lost a fight with a rake and I'll haggle a great deal." } },
      choices = { { text = "Clean cuts only. Understood.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    jerkin = {
      lines = { { id = "je_default", text = "Three days, if the hide's already cured, and most of that is the stitching. I punch every hole by hand and wax the thread twice, because a seam that opens in the rain out here can cost somebody more than a jerkin." } },
      choices = { { text = "Then it's worth the three days.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dargh = { { id = "tp_dargh", text = "Dargh Trueaim teaches the young ones to shoot, and I wish he'd teach them to skin while he's about it." } },
    farstrider_lodge = { { id = "tp_lodge", text = "A good hall and a loud one. Everyone here kills for a living, and they're the gentlest lot I've ever worked beside." } },
    crocolisks = { { id = "tp_croc", text = "The best hide on the loch, wrapped round the worst temper. I'd pay well for more of it and I've never once gone to fetch it myself." } },
    background = { { id = "tp_bg", text = "I'm a leatherworker from the south. I go where the hides are good, and they're good here." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask me about leather and I'll talk all day." } },
  },
}

---------------------------------------------------------------------------
-- Aldren Cordon: clothier at the Farstrider Lodge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_aldren", id = TODO_NPC("Aldren Cordon"), name = "Aldren Cordon", title = "Clothier",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "fussy", "kindly" }, values = { "craft", "tidy" },
  notices = { "kit", "class" },
  impression = {
    first = "Aldren Cordon sells cloaks, shirts and robes to hunters who would rather not think about clothes at all. He straightens a customer's collar before he has learned their name.",
    third = "{name} met Aldren Cordon, the clothier at the Farstrider Lodge in Loch Modan.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, ye're back, an' yer collar's sittin' straight for once! I'm proud o' ye, I truly am." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Stand still, an' dinnae drip on the silk this time." },
    { id = "g_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "A robe! Come in, come in, an' dinnae mind the hunters starin'. They've never seen cloth that reaches the floor." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Still up? I'm only pressin' tomorrow's shirts. Come in, an' mind the iron." },
    { id = "g_hi", text = "Ah, a customer! Stand still a moment. Aye, ye've a button hangin' by a thread, an' I cannae talk tae ye till that's seen tae." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! An' ye've been through a bramble since, by the state o' that hem." },
  },
  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "By my beard, ye're half undressed, an' the wind off the loch would freeze a trogg. Come here before ye catch yer death." },
    { id = "n_robe", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A robe! At last, somebody who wears cloth on purpose. Let me see the weave. Hm, it's decent, but it's no' been pressed since it was bought." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Aldren Cordon, clothier. The hunters here would wear the same shirt till it walked off on its own, so I'm the one who sees they've a dry cloak an' a clean collar under all that leather." },
        { id = "h_tailor", when = { profession = "Tailoring" }, text = "Aldren Cordon, clothier, an' I see ye sew. Then ye'll understand what it is tae make a good shirt for a dwarf who'll wipe his knife on it." },
      },
      again = {
        { id = "h_again", text = "What else? Hold still while ye ask, I've a pin in my mouth." },
        { id = "h_again2", text = "Go on, I'm only foldin'." },
        { id = "h_again3", text = "Aye? Ask away, an' mind the bolts on the bench." },
      },
      choices = {
        { text = "Good cloth should be sold as good cloth, not cheap linen.", next = "BACK", reply = "Bless ye, I couldnae agree more, for linen pretendin' tae be silk is a crime.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A bit of dye makes cheap cloth look fine enough.", next = "BACK", reply = "Fine enough until it rains, an' then ye'll have a purple shirt an' blue skin.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Do hunters buy much cloth?", next = "hunters" },
        { text = "What should a traveller wear on the loch?", next = "wear" },
        { text = "You're very particular for a hunting lodge.", next = "fussy" },
        { text = "What do you think of my robes?", next = "robes", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "What's the worst you've had to mend?", next = "worst" },
        { text = "Who else trades at the Lodge?", next = "traders" },
        { text = "What do the mountaineers wear under their mail?", next = "ac_mountain" },
        { text = "Where does your cloth come from?", next = "ac_cloth" },
        { text = "Good day, Aldren.", next = "END" },
      },
    },
    ac_mountain = {
      lines = {
        { id = "ac_mountain_1", text = "Wool padding, an' they'd wear it till it rotted if I didnae make them buy new. Mail on bare skin will rub a dwarf raw in a day, an' the mountaineers at Thelsamar walk their patrols in the same shirt for a month." },
      },
      choices = {
        { text = "Do they listen to you?", next = "ac_listen" },
        { text = "I'll keep my padding fresh, then.", next = "BACK", reply = "See that ye do, for yer skin'll thank ye." },
      },
    },
    ac_listen = {
      lines = {
        { id = "ac_listen_1", text = "Only after the rash, which is how most dwarves learn. Captain Rugelfuss on his hill is the worst, for he says he's too busy fightin' troggs tae worry about his shirt." },
      },
      choices = {
        { text = "Does the dam need watching too?", next = "ac_dam" },
        { text = "A busy captain still needs a clean shirt.", next = "BACK" },
      },
    },
    ac_dam = {
      lines = {
        { id = "ac_dam_1", text = "Aye, for Chief Engineer Hinderweir swears he's seen Dark Irons skulkin' round the Stonewrought at night. If the dam goes, half the valley goes wi' it, so I'll forgive the guards there their shirts as well." },
      },
      choices = {
        { text = "I'll look in on Hinderweir.", next = "BACK", fx = { learn = { "stonewrought_dam" } } },
        { text = "Something else, Aldren.", next = "BACK" },
      },
    },
    ac_cloth = {
      lines = {
        { id = "ac_cloth_1", text = "Linen from the Thelsamar weavers, wool from the rams in Dun Morogh, an' silk now an' then from a trader passin' through tae Menethil. Silk's no good for a hunter, mind, but it's good for a dwarf who wants tae look respectable in Ironforge." },
      },
      choices = {
        { text = "Do many hunters care about looking respectable?", next = "ac_respect" },
        { text = "I'm a tailor. Linen or wool, for these hills?", next = "ac_respect", when = { profession = "Tailoring" } },
      },
    },
    ac_respect = {
      lines = {
        { id = "ac_respect_1", text = "More than they'll admit, when there's a wedding or a feast. The rest o' the year they want warm an' dry, an' for that it's wool, every time, for it stays warm even when it's wet through." },
      },
      choices = {
        { text = "Warm when wet. That's the secret.", next = "BACK" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hunters = {
      lines = { { id = "hu_default", text = "More than they'd admit. A cloak, mostly, in a colour that'll no' show against the hillside, an' wool socks by the dozen. Marek Ironheart buys a new shirt every spring an' tells nobody, an' I've been sworn tae secrecy, so ye didnae hear it from me." } },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "What colour hides a hunter best?", next = "hunters_colour" },
      },
    },
    hunters_colour = {
      lines = { { id = "hc_default", text = "A grey-green, like wet slate wi' moss on it. I get the dye from Rann Flamespinner in Thelsamar, an' he mixes it by eye, so nae two bolts quite match. The hunters say that's all the better, for nothin' on a hillside matches either." } },
      choices = { { text = "That's clever. Something else.", next = "BACK" } },
    },
    wear = {
      lines = { { id = "we_default", text = "Wool next tae the skin, whatever ye put over it, for wool keeps ye warm even when it's wet, an' on this shore it will be wet. An' a hood, always, for the rain here comes sideways off the water." } },
      choices = { { text = "Wool and a hood. I'll remember.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    fussy = {
      big = true,
      lines = { { id = "fu_default", text = "I am, an' I've heard every joke about it. The lads say a hunter's meant tae look rough, an' that a beast doesnae care if yer collar's straight. I say a dwarf who keeps himself tidy keeps his rifle tidy, an' it's all the one habit. Am I wrong?" } },
      choices = {
        { text = "You're right. Small disciplines make the large ones.", next = "BACK", reply = "Thank ye! I'll be repeatin' that at supper, an' I'll say a well-travelled stranger told me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A straight collar never killed a boar.", next = "BACK", reply = "Hmph. Ye sound like Daryl. Well, come back when yer cloak's fallen apart, an' we'll see who was right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    robes = {
      lines = { { id = "ro_default", text = "The cloth's good an' the cut's fair, but ye've scorched the left cuff, an' the hem's been taken up by somebody in a hurry. I'd say ye're a caster who's better at the spell than the laundry, which is the right way round, I suppose." } },
      choices = { { text = "That's uncomfortably accurate.", next = "BACK", fx = { affinity = 1 } }, { text = "Sell me something better.", next = "BUSINESS" } },
    },
    worst = {
      lines = { { id = "wo_default", text = "A cloak that had been intae a crocolisk an' out again, wi' the hunter still attached tae the far end o' it. He wanted it patched, for luck. It took me a week an' more thread than cloth, an' he's worn it every day since." } },
      choices = { { text = "A lucky cloak is worth a week.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    traders = {
      lines = { { id = "td_default", text = "Xandar Goodbeard for supplies, Irene Sureshot for guns, Cliff Hadin for bows an' Kat Sampson for leather. We share a landing an' a kettle, an' Irene an' Cliff share an argument that's older than the kettle." } },
      choices = { { text = "A lively landing, by the sound of it.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    daryl = { { id = "tp_daryl", text = "A fine shot who's never once hung up his own cloak. I've told him a hero wi' a crumpled collar is only half a hero." } },
    farstrider_lodge = { { id = "tp_lodge", text = "A fine hall full o' fine shots, an' no' one of them can fold a shirt. I do what I can." } },
    rann = { { id = "tp_rann", text = "Rann Flamespinner, in Thelsamar. He's the best dyer on the loch, an' the only dwarf I ken who's quieter than his own thread." } },
    background = { { id = "tp_bg", text = "I'm a clothier, an' I keep the Farstriders decent. Somebody must." } },
    _none = { { id = "tp_none", text = "I couldnae say, I'm afraid. Unless it's made o' cloth, I've likely no' looked at it closely." } },
  },
}

---------------------------------------------------------------------------
-- Gothor Brumn: armorer in Thelsamar.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_gothor", id = TODO_NPC("Gothor Brumn"), name = "Gothor Brumn", title = "Armorer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "thelsamar" }, temper = { "steady", "blunt" }, values = { "practical", "honest" },
  notices = { "kit", "class" },
  impression = {
    first = "Gothor Brumn sells mail and shields in Thelsamar and judges every customer by the dents they walk in with. He has outfitted most of the mountaineers on the loch and remembers each fitting.",
    third = "{name} met Gothor Brumn, the armorer in Thelsamar.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, ye've come back, an' that plate's held up fine. I take that as a compliment, {g:lad|lass}." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Buy yer armour an' dinnae haggle, for I'm in nae mood for it." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Armour, shields an' helms, cut for a proper frame. Step up, {g:lad|lass}, an' I'll no' have tae shorten anythin'." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The forge is banked, but the shop's open. If ye've been out on the hills after dark, ye'll be needin' me." },
    { id = "g_hi", text = "Armour, shields an' helms. Turn round an' let me see what the troggs have done tae what ye're wearin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back, an' wi' fresh dents. I'll take that as a compliment tae whatever stopped them." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armour's holdin' together out o' habit. Morhan Coppertongue can beat it straight, an' when he says it's past savin', come back tae me." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Now there's somebody who wears it properly. Yer shield strap's set too low, mind, an' ye'll feel that in the elbow by nightfall." },
  },
  start = "hello",
  nodes = {
    w2_dent = {
      lines = {
        { id = "w2_dent_l0", text = "Low on the left side, right above the hip. That's a trogg club swung by somethin' short that cannae reach higher, an' I've beaten out more o' those this summer than in the five before put together." },
      },
      choices = {
        { text = "So the troggs are getting bolder.", next = "w2_dent_bold" },
        { text = "Then make the armour thicker there.", next = "BACK" },
      },
    },
    w2_dent_bold = {
      lines = {
        { id = "w2_dent_bold_l0", text = "Bolder, or more o' them, or both. I told the mountaineers' sergeant, an' he said he'd look intae it, which is what a sergeant says when he means he's too busy. I'm puttin' an extra plate on every hip regardless." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Gothor Brumn, armorer. I've put mail on near every mountaineer in Loch Modan, an' I can tell ye which o' them have grown since by the links I've had tae add." },
        { id = "h_cloth", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Gothor Brumn, armorer. Ye'll no' be wantin' a hauberk, I take it, for ye'd fold up under one. There's Rann Flamespinner for cloth, though I'll talk if ye've a mind." },
      },
      again = {
        { id = "h_again", text = "What else? I've rings tae rivet." },
        { id = "h_again2", text = "Go on. An' while ye talk, let me see that dent in yer shield." },
        { id = "h_again3", text = "Aye? Ask, an' dinnae lean on the shields." },
      },
      choices = {
        { text = "Armour should be sold with every flaw shown plainly.", next = "BACK", reply = "Aye, an' so it is here. I'd no' send a soul out wi' a crack I knew about.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Hide the flaw under fresh paint and sell it full price.", next = "BACK", reply = "Paint doesnae stop a trogg's club, an' ye'd ken that if ye'd ever been hit by one.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "You outfit the mountaineers?", next = "mountaineers" },
        { text = "What does a trogg do to armour?", next = "troggs" },
        { text = "Who else works metal in Thelsamar?", next = "smiths" },
        { text = "Check my armour's fit for me.", next = "fit", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "Mail or plate, for these hills?", next = "mail" },
        { text = "Who's the hardest mountaineer to fit?", next = "gb_hard" },
        { text = "What's your shield work like?", next = "gb_shield" },
        { text = "Which dent have you seen most often this season?", next = "w2_dent" },
        { text = "Good day, Gothor.", next = "END" },
      },
    },
    gb_hard = {
      lines = {
        { id = "gb_hard_1", text = "Mountaineer Cobbleflint, for he's broad as a door an' insists his mail is still the size it was ten years ago. I've added two rows o' links tae his hauberk an' told him it shrank in the rain, which keeps the peace." },
      },
      choices = {
        { text = "You're a kind armorer.", next = "gb_kind" },
        { text = "He'll find out one day.", next = "BACK", reply = "Maybe, but no' from me." },
      },
    },
    gb_kind = {
      lines = {
        { id = "gb_kind_1", text = "Kind is cheaper than an argument wi' a mountaineer. Cobbleflint is the best fighter in Thelsamar, an' if he wants tae believe his waist is what it was, I'll let him, so long as the mail fits." },
      },
      choices = {
        { text = "A fitting truth for a fighting man.", next = "BACK" },
        { text = "Something else, Gothor.", next = "BACK" },
      },
    },
    gb_shield = {
      lines = {
        { id = "gb_shield_1", text = "Heavy oak, iron rim, an' a boss ye could use as a hammer if ye'd a mind tae. The troggs in Stonesplinter Valley fight wi' clubs an' teeth, so a good shield here is worth more than a good sword." },
      },
      choices = {
        { text = "Clubs and teeth? Troggs fight like beasts.", next = "gb_troggs2" },
        { text = "I fight with shield and hammer myself.", next = "gb_troggs2", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "A boss for a hammer. I like that.", next = "BACK" },
      },
    },
    gb_troggs2 = {
      lines = {
        { id = "gb_troggs2_1", text = "They do, an' they come in a rush, so ye want somethin' tae put between ye an' the rush. Mountaineer Kadrell will tell ye the same, an' he's lost more shields tae trogg teeth than anyone in the valley." },
      },
      choices = {
        { text = "I'll ask Kadrell about the troggs.", next = "BACK", fx = { learn = { "troggs" } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    mountaineers = {
      lines = { { id = "mo_default", text = "Aye. Captain Rugelfuss sends the new ones tae me before they've stood a single watch, an' I fit them wi' room tae grow. Kadrell's on his third hauberk, an' Cobbleflint's still in his first, patched so often it's more mine than his." } },
      choices = {
        { text = "Do they pay, or does the crown?", next = "mountaineers_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mountaineers_pay = {
      big = true,
      lines = { { id = "mp_default", text = "Ironforge pays for the first set, an' after that it comes out o' the mountaineer's own wage. I've been known tae lose a bill or two for a lad wi' a family, an' Magistrate Bluntnose says I'll ruin myself. What d'ye say tae that?" } },
      choices = {
        { text = "Keep losing them. They guard your town.", next = "BACK", reply = "That's how I reckon it. A mountaineer wi' good mail is a wall I dinnae have tae build.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A debt is a debt. Charge them all the same.", next = "BACK", reply = "The magistrate would shake yer hand. I'll keep my own counsel on it, all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs = {
      lines = { { id = "tr_default", text = "They dinnae cut, they batter. A trogg hits ye wi' a rock or a bone club, an' it's the bruise under the mail that puts ye down, so I tell everybody tae spend on the paddin' before the steel." } },
      choices = {
        { text = "And the Dark Irons?", next = "troggs_iron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs_iron = {
      lines = { { id = "ti_default", text = "Different trouble altogether. A Dark Iron carries a good axe an' kens exactly where the gaps in dwarven mail are, for they wear the same pattern. I close the armpit an' the neck tighter on anybody posted north for that reason." } },
      choices = { { text = "That's worth knowing. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    smiths = {
      lines = { { id = "sm_default", text = "Morhan Coppertongue has the forge an' does the mendin', an' old Bailor Stonehand sits by an' tells us both what we've done wrong. Vrok Blunderblast sells guns, which I'm told is also metalwork, though I've my doubts." } },
      choices = { { text = "Bailor has opinions, I gather.", next = "BACK", reply = "He has, an' the worst o' it is he's usually right.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    fit = {
      lines = { { id = "fi_default", text = "Lift yer arms for me, higher than that, an' there, ye see how the shoulder rides up an' leaves yer ribs open? It was fitted for somebody broader, or ye've lost weight on the road. A leather lace through the back would take it in for now." } },
      choices = { { text = "I'll lace it. Thank you, Gothor.", next = "BACK", fx = { affinity = 1 } }, { text = "Show me something that fits.", next = "BUSINESS" } },
    },
    mail = {
      lines = { { id = "ma_default", text = "Mail, for anybody who has tae climb. Plate's grand on a wall, but the loch's all slopes an' shale, an' I've seen a dwarf in full plate slide forty feet intae a trogg camp on his backside. He lived, an' he bought mail the next day." } },
      choices = { { text = "Mail it is. Show me.", next = "BUSINESS" }, { text = "I'd have paid to see that slide.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },
  topics = {
    rugelfuss = { { id = "tp_rugel", text = "Captain Rugelfuss commands the mountaineers from the tower south o' town. He's hard on his troops an' harder on my delivery dates." } },
    thelsamar = { { id = "tp_thel", text = "A town that's had tae fight for its sleep. Good folk, an' they pay their armourer, mostly." } },
    mountaineers = { { id = "tp_mount", text = "The best o' Ironforge's young ones, sent out tae stand in the cold. I'd give them plate if they could climb in it." } },
    background = { { id = "tp_bg", text = "I'm an armorer, same as my father. I rivet rings an' I fit shoulders." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. I ken what stops a blow, an' no' much past that." } },
  },
}

---------------------------------------------------------------------------
-- Nillen Andemar: macecrafter on the Stonewrought Dam.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_nillen", id = TODO_NPC("Nillen Andemar"), name = "Nillen Andemar", title = "Macecrafter",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "lochmodan" }, temper = { "hearty", "single-minded" }, values = { "craft", "brave" },
  notices = { "class", "kit" },
  impression = {
    first = "Nillen Andemar makes maces and sells them from the Stonewrought Dam, where the wall guards are his steadiest customers. He believes any problem can be solved with enough weight on the end of a haft.",
    third = "{name} met Nillen Andemar, a macecrafter who sells his work on the Stonewrought Dam in Loch Modan.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again! I've a new hammer wi' a head like a boulder, an' I was waitin' for ye tae try it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Pick a mace an' pay, for I'll no' talk hammers wi' ye today." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Maces an' hammers! A dwarf kens what a hammer's for, in the forge an' out o' it. Have a heft o' this one." },
    { id = "g_hi", text = "Maces an' hammers, friend! Pick one up an' feel the head pull. That's what a trogg feels, only faster." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! How did she swing? Dinnae tell me ye've chipped the flanges already." },
  },
  notice = {
    { id = "n_pal", cat = "class", when = { class = "PALADIN" },
      text = "A paladin! Now there's a callin' that understands a hammer. I've one wi' a longer haft that'd suit ye, an' it rings like a bell on a helm." },
    { id = "n_blade", cat = "class", when = { class = "ROGUE" },
      text = "Ye're a knife sort, I can tell by the way ye're lookin' at my stock as if it were furniture. Nae matter. Ye'd be surprised what a wee cudgel can do from behind." },
  },
  start = "hello",
  nodes = {
    w2_drop = {
      lines = {
        { id = "w2_drop_l0", text = "Three, that I know of, an' one o' them was me. Ye can see it on a clear day, if ye lean over the rail by the second sluice, sittin' on a rock at the bottom an' rustin' in peace." },
      },
      choices = {
        { text = "You could dive for it.", next = "w2_drop_dive" },
        { text = "A fine monument to your craft.", next = "BACK" },
      },
    },
    w2_drop_dive = {
      lines = {
        { id = "w2_drop_dive_l0", text = "In that water? It's cold enough tae stop a dwarf's heart, an' there's things in the deep end o' the loch the fishers dinnae like tae talk about. Let it lie; I'll make another." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Nillen Andemar, macecrafter. I make them in Thelsamar an' sell them up here on the dam, for the guards on this wall want somethin' that'll no' turn on a trogg's skull the way an edge does." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "Nillen Andemar, macecrafter, an' ye're a smith yerself, by the burns. Then tell me, why does every apprentice want tae make swords, when a mace is twice the work an' half the breakage?" },
      },
      again = {
        { id = "h_again", text = "What else? Mind the edge o' the walkway while ye think." },
        { id = "h_again2", text = "Go on, ask. I've the whole afternoon, a fine view, an' a hammer in my hand." },
        { id = "h_again3", text = "Aye? Speak up over the water." },
      },
      choices = {
        { text = "A mace should be built to last a lifetime, not a season.", next = "BACK", reply = "Aye! A good hammer outlives the dwarf who swings it, an' that's how it should be.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Make them weak, and they'll come back to buy another.", next = "BACK", reply = "That's a merchant's trick, no' a smith's, an' I'd sooner starve than sell a soft head.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your maces.", next = "BUSINESS" },
        { text = "Why a mace over a blade?", next = "why" },
        { text = "Why sell on the dam?", next = "dam" },
        { text = "What makes a good mace?", next = "craft" },
        { text = "Fit me for a hammer.", next = "fit", when = { class = { "PALADIN", "WARRIOR", "PRIEST" } } },
        { text = "What do the wall guards buy?", next = "guards" },
        { text = "How do you get maces up to the dam?", next = "na_haul" },
        { text = "Does Hinderweir ever buy from you?", next = "na_hinder" },
        { text = "Has anyone ever dropped a mace off the dam?", next = "w2_drop" },
        { text = "Good day, Nillen.", next = "END" },
      },
    },
    na_haul = {
      lines = {
        { id = "na_haul_1", text = "On my own back, mostly, for a cart on the dam road costs more than the maces are worth. I carry six at a time, an' by the time I reach the wall I've the shoulders o' a mountaineer an' the temper o' a trogg." },
      },
      choices = {
        { text = "Six maces? That's a heavy load.", next = "na_load" },
        { text = "A strong back is a smith's best tool.", next = "BACK", reply = "So my father said, an' then he made me carry the anvil." },
      },
    },
    na_load = {
      lines = {
        { id = "na_load_1", text = "It is, an' it's the best test o' a mace ye'll find, for I ken the balance o' every one by the time I've carried it up. If it doesnae sit right on my shoulder, it doesnae sit right in a guard's hand either." },
      },
      choices = {
        { text = "Testing by carrying. Clever.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Nillen.", next = "BACK" },
      },
    },
    na_hinder = {
      lines = {
        { id = "na_hinder_1", text = "The Chief Engineer? No, he's no use for maces, for he'd sooner fix a problem than hit it. He's the seventh Hinderweir tae keep the Stonewrought Dam, an' he worries about it like it was a child." },
      },
      choices = {
        { text = "What does he worry about?", next = "na_worry" },
        { text = "I'm an engineer. I'd like to meet him.", next = "na_worry", when = { profession = "Engineering" } },
      },
    },
    na_worry = {
      lines = {
        { id = "na_worry_1", text = "Cracks, leaks, Dark Irons, the weight o' the water, an' whether his great-great-grandfather would approve o' him. Talk tae him yerself, but bring a stool, for he'll talk for an hour." },
      },
      choices = {
        { text = "I'll bring a stool, then.", next = "BACK" },
        { text = "An engineer's worries. Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because an edge needs a gap an' a mace makes its own. Mail, plate, a trogg's thick head, it's all the same tae a pound o' iron on the end o' a stick. Ye never have tae sharpen it, an' it doesnae care if ye hit wi' the wrong side." } },
      choices = {
        { text = "It's a brute's weapon, some would say.", next = "why_brute" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_brute = {
      big = true,
      lines = { { id = "wb_default", text = "They do say it, an' they say a sword's the honourable weapon because it takes skill. I say there's nae honour in losin' a fight wi' a pretty blade in yer hand. What's yer own view?" } },
      choices = {
        { text = "How you fight matters as much as winning.", next = "BACK", reply = "Hm. That's a swordsman's answer, an' I'll no' mock it. I'll only say the troggs havenae read the same book.", fx = { align = { honor = 1 } } },
        { text = "Winning is the honour. Use what works.", next = "BACK", reply = "Aye! That's a mace-wielder talkin', whether ye carry one or no'.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dam = {
      lines = { { id = "da_default", text = "Because this is where the customers stand. The mountaineers on the wall cannae leave their posts tae walk tae Thelsamar, so I bring the rack tae them. Chief Engineer Hinderweir lets me set up so long as I keep clear o' the sluice housin'." } },
      choices = {
        { text = "Has the dam seen much fighting?", next = "dam_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dam_fight = {
      lines = { { id = "df_default", text = "No' on the wall itself, but the Dark Irons have been seen pokin' about below it, an' everybody up here kens what they'd like tae do. Deek Fizzlebizz checks the gears an' I check the guards' arms, an' between us we feel a wee bit better." } },
      choices = { { text = "It's worth guarding well.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    craft = {
      lines = { { id = "cr_default", text = "The haft, before anythin'. Folk look at the head, but it's the wood that breaks, so I use ash, cut in winter, an' I wedge the head on from the top so it tightens every time ye swing. A loose head's a danger tae everybody but the enemy." } },
      choices = { { text = "Wedged from the top. I'd not have guessed.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    fit = {
      lines = {
        { id = "fi_default", text = "Hold this one out at arm's length an' count tae ten. If the head dips before eight, she's too heavy for ye, an' if ye're smilin' at ten, she's too light. There's nae shame in the lighter one, for ye'll swing it twice as often." },
        { id = "fi_priest", when = { class = "PRIEST" }, text = "A priest wantin' a mace! Good, for prayers are grand but a wee iron head settles things quicker. Try this one, it's light in the haft an' ye can carry it under a robe." },
      },
      choices = { { text = "Let me try a few.", next = "BUSINESS" }, { text = "Something else.", next = "BACK" } },
    },
    guards = {
      lines = { { id = "gs_default", text = "The short flanged ones, for there's nae room on a walkway for a long swing. I make them wi' a wrist loop, an' all, since a mace dropped off this dam is a mace ye'll no' see again, an' it's a long while before ye hear the splash." } },
      choices = { { text = "A wrist loop. Sensible.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    thelsamar = { { id = "tp_thel", text = "My forge is there, in a lean-to behind Morhan Coppertongue's. I work nights an' sell days, an' sleep on the cart between." } },
    hinderweir = { { id = "tp_hind", text = "The Chief Engineer. He's fussy about where I put my rack, an' I dinnae blame him, for it's his wall I'm standin' on." } },
    stonewrought_dam = { { id = "tp_dam", text = "The greatest wall the dwarves ever built, holdin' back the whole loch. I like tae think my maces are the second-best thing on it." } },
    troggs = { { id = "tp_troggs", text = "Heads like boulders. A sword skips off, an' a mace doesnae, an' that's my whole trade explained." } },
    background = { { id = "tp_bg", text = "I make maces. My father made maces. We've never seen a reason tae make anythin' else." } },
    _none = { { id = "tp_none", text = "I couldnae say, friend. If ye cannae hit it wi' a mace, I've no' given it much thought." } },
  },
}
