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
    { id = "g_back", when = { metBefore = true }, text = "Back again. Any news from the hills?" },
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
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What's the secret to a good shot?", next = "shot" },
        { text = "What do the Farstriders hunt?", next = "farstriders" },
        { text = "Tell me about the Lodge.", next = "lodge" },
        { text = "That's a great many trophies on the wall.", next = "trophies" },
        { text = "What should a hunter take first in Loch Modan?", next = "first", when = { class = "HUNTER" } },
        { text = "Farewell, Dargh.", next = "END" },
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
        { text = "Train me in engineering.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "Tell me about the dam.", next = "dam" },
        { text = "Why train here, and not Ironforge?", next = "why" },
        { text = "Who works the dam with you?", next = "crew" },
        { text = "You keep looking over the edge.", next = "edge" },
        { text = "How do the sluice gears work?", next = "gears", when = { any = { { profession = "Engineering" }, { race = "Gnome" } } } },
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
    hello = {
      lines = {
        { id = "h_default", text = "Greishan Ironstove, travellin' merchant. I bake in Thelsamar an' walk the roads sellin' tae the mountaineers an' travellers, for they get hungry out here an' there's no inn for miles." },
      },
      again = {
        { id = "h_again3", text = "Walk wi' me if ye've more tae ask, for the loaves get nae fresher standin' still." },
        { id = "h_again", text = "What else? I've a long road ahead." },
        { id = "h_again2", text = "Go on, I've a minute." },
      },
      choices = {
        { text = "Show me your bread.", next = "BUSINESS" },
        { text = "Isn't the road dangerous?", next = "road" },
        { text = "What's the news on the road?", next = "news" },
        { text = "Where does the bread come from?", next = "bakery" },
        { text = "You must know every mountaineer by name.", next = "posts" },
        { text = "I bake a little myself.", next = "cook", when = { profession = "Cooking" } },
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
-- Vyrin Swiftwind: high elf of the Farstrider Lodge who wants Daryl the Youngling taken down a peg.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_vyrin", id = TODO_NPC("Vyrin Swiftwind"), name = "Vyrin Swiftwind",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "lochmodan" }, temper = { "dry", "teasing" }, values = { "skill", "honest" },
  notices = { "class", "race" },
  impression = {
    first = "Vyrin Swiftwind is a high elf who keeps the beds at the Farstrider Lodge and outshoots most of the dwarves in it. She speaks softly, smiles rarely, and has a quiet plan for puncturing a young hunter's pride.",
    third = "{name} met Vyrin Swiftwind, a high elf of the Farstrider Lodge who wants the bear Ol' Sooty killed to humble Daryl the Youngling.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome to the Lodge. Wipe your boots, mind the trophies, and do not encourage Daryl." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned, and His Boldness is still talking. I had hoped one of those things might change." },
    { id = "g_active", when = { questActive = TODO_QUEST("Vyrin's Revenge") }, text = "Ol' Sooty keeps to his lair in the cave to the north. Bring me word when it is done, and bring Daryl the head." },
    { id = "g_done", when = { questDone = TODO_QUEST("Vyrin's Revenge") }, text = "Ah, the bear-slayer. Daryl has been very quiet at supper since, and I have enjoyed every silent mouthful." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You carry yourself as a hunter does, weight on the back foot and eyes on the door. The dwarves here will like you, once they have finished comparing rifles." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "One of the kaldorei. Our peoples parted a very long time ago, and I will not pretend we are kin, but it is pleasant to hear a bow spoken of with respect." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Vyrin Swiftwind. My people hunted beside the dwarves in the old wars, and this hall was named for our rangers, so I keep its beds and now and then its peace." },
        { id = "h_offer", when = { questDone = TODO_QUEST("The Joy of Boar Hunting") }, text = "I am Vyrin Swiftwind, and I hear you have been running errands for Daryl. I don't suppose you would be interested in a little payback for His Boldness?" },
        { id = "h_done", when = { questDone = TODO_QUEST("Vyrin's Revenge (2)") }, text = "You did what the whole Lodge could not, and you were gracious about it, which Daryl would not have been. Sit wherever you like." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I have linen to air, but it will wait." },
        { id = "h_again2", text = "Ask. It is quieter than listening to the dwarves argue calibres." },
        { id = "h_again3", text = "Yes? You have my attention, which is more than Daryl ever manages." },
      },
      choices = {
        { text = "What's this about payback?", next = "payback" },
        { text = "An elf in a dwarven hunting lodge.", next = "lodge" },
        { text = "Tell me about the hunters here.", next = "hunters" },
        { text = "Bow against rifle. Which is the better weapon?", next = "bow", when = { class = "HUNTER" } },
        { text = "Good day, Vyrin.", next = "END" },
      },
    },
    payback = {
      lines = { { id = "pb_default", text = "Daryl does have some skill, and it pains me to say so. A year ago a great bear called Ol' Sooty was the quarry of every hunter in this Lodge, and none of them could take him, so Daryl went alone. All he brought back was that scar over his eye." } },
      choices = {
        { text = "And you want the bear dead to spite him.", next = "payback_spite" },
        { text = "Something else.", next = "BACK" },
      },
    },
    payback_spite = {
      lines = { { id = "ps_default", text = "I want Daryl to be speechless for once in his life, and I think a stranger walking in with that bear's head would do it. If you would rather call that spite, I will not argue the word." } },
      choices = {
        { text = "Is humbling him worth a bear's life?", next = "payback_worth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    payback_worth = {
      big = true,
      lines = { { id = "pw_default", text = "A fair question. Ol' Sooty has mauled more than one hunter and will maul more, so the bear must be dealt with either way. Whether Daryl should be made to watch a stranger do it is another matter, and I admit I have decided that one for my own amusement." } },
      choices = {
        { text = "Pride like his gets hunters killed. He needs the lesson.", next = "BACK", reply = "That is what I tell myself, and it happens also to be true. Marek thinks so too, though he is kinder about it.", fx = { align = { order = 1 } } },
        { text = "Let him be proud. He earned that scar honestly.", next = "BACK", reply = "Hm. He did go alone, when the rest of us would not. I had almost managed to forget that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lodge = {
      lines = { { id = "lo_default", text = "It is less strange than it looks. The rangers of my homeland and the dwarven hunters of this loch shared camps and quarry in the wars against the Horde, and when the fighting ended, some of us found we preferred the company." } },
      choices = {
        { text = "Do you miss your homeland?", next = "lodge_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lodge_home = {
      lines = { { id = "lh_default", text = "Quel'Thalas is ash and silence since the Scourge came through it, and there is little left there to miss that I could bear to look at. Here there is a lake, a full larder and a great deal of noise, and I have come to think that is not a poor trade." } },
      choices = { { text = "I'm sorry for what was lost.", next = "BACK", reply = "Thank you. Most here do not know what to say, and so they pour me ale, which is their way of saying the same.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    hunters = {
      lines = { { id = "hu_default", text = "Marek Ironheart is the best of them and the least inclined to say so. Dargh Trueaim teaches the young ones patience, which they forget by supper, and Daryl is Daryl. The traders upstairs sell us everything else." } },
      choices = {
        { text = "Who would you trust at your back?", next = "hunters_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters_trust = {
      lines = { { id = "ht_default", text = "Marek, without a second thought. And Daryl, though I would deny it to his face, because a boy who walks into a bear's cave alone is a fool, but he is not a coward." } },
      choices = { { text = "I won't repeat that to him.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    bow = {
      lines = { { id = "bw_default", text = "The bow, and I say so in a hall full of gunsmiths. A rifle announces you to every beast in the valley, and a bow lets you choose which one learns you are there. But I have seen Marek drop a crocolisk at two hundred paces, so I keep my opinion to this corner." } },
      choices = { { text = "A quiet shot has its uses.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    farstriders = { { id = "tp_far", text = "My people's rangers bore that name first, and the dwarves here took it up out of respect. I have not told them how the elder rangers would have looked upon the rifles." } },
    ol_sooty = { { id = "tp_sooty", text = "A great black bear with a lair in the caves to the north. He has outlasted every hunter in this Lodge, which says something for him and less for us." } },
    daryl = { { id = "tp_daryl", text = "Talented, tireless and unbearable. I expect he will be a fine hunter in ten years, if somebody can arrange for him to listen for one of them." } },
    background = { { id = "tp_bg", text = "I am a ranger's daughter from the north, and I keep a hunters' hall by a dwarven lake. That is all there is to tell." } },
    _none = { { id = "tp_none", text = "I could not say. Ask one of the dwarves, and allow an hour for the answer." } },
  },
}

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
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "What do hunters forget most?", next = "forget" },
        { text = "How do supplies reach the Lodge?", next = "carts" },
        { text = "That is a remarkable beard.", next = "beard" },
        { text = "What should I pack for the loch's far shore?", next = "pack", when = { class = "HUNTER" } },
        { text = "What's the oddest thing a hunter has asked you for?", next = "odd" },
        { text = "Good day, Xandar.", next = "END" },
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
    hello = {
      lines = {
        { id = "h_default", text = "Irene Sureshot, gunsmith tae the Farstriders. Every rifle on that rack has put ten balls through a plank at eighty paces before I'd hang it there, an' I did the shootin' myself." },
        { id = "h_bow", when = { race = "NightElf" }, text = "Irene Sureshot, gunsmith. Ye'll be wantin' Cliff Hadin an' his bows, I expect, an' I'll no' take it personal. Come back when ye're ready tae be heard as well as felt." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, I've a barrel coolin'." },
        { id = "h_again2", text = "Go on, ask. I'll tell ye straight." },
        { id = "h_again3", text = "Aye? Speak up over the porch, somebody's testin' a fowler." },
      },
      choices = {
        { text = "Let me see your rifles.", next = "BUSINESS" },
        { text = "What makes a rifle shoot true?", next = "true_shot" },
        { text = "A gunsmith and a bowyer under one roof.", next = "cliff" },
        { text = "Did you earn the name Sureshot?", next = "name" },
        { text = "Look over my rifle for me.", next = "mine", when = { class = "HUNTER" } },
        { text = "What's the best shot you ever saw?", next = "best" },
        { text = "Good day, Irene.", next = "END" },
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
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "A bowyer among riflemen.", next = "rifles" },
        { text = "How do you make a good bow?", next = "craft" },
        { text = "What brought a human to this lodge?", next = "came" },
        { text = "What draw weight would suit me?", next = "draw", when = { class = "HUNTER" } },
        { text = "What do you think of arrows, as a craft?", next = "arrows" },
        { text = "Good day, Cliff.", next = "END" },
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
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "Which hides make the best armour here?", next = "hides" },
        { text = "How does a human end up at a dwarven lodge?", next = "lodge" },
        { text = "The hunters keep you supplied, then.", next = "hunters" },
        { text = "I skin my own kills. What will you buy?", next = "skin", when = { profession = { "Skinning", "Leatherworking" } } },
        { text = "How long does a jerkin take you?", next = "jerkin" },
        { text = "Good day, Kat.", next = "END" },
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
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Do hunters buy much cloth?", next = "hunters" },
        { text = "What should a traveller wear on the loch?", next = "wear" },
        { text = "You're very particular for a hunting lodge.", next = "fussy" },
        { text = "What do you think of my robes?", next = "robes", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "What's the worst you've had to mend?", next = "worst" },
        { text = "Who else trades at the Lodge?", next = "traders" },
        { text = "Good day, Aldren.", next = "END" },
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
    hello = {
      lines = {
        { id = "h_default", text = "Gothor Brumn, armorer. I've put mail on near every mountaineer in Loch Modan, an' I can tell ye which o' them have grown since by the links I've had tae add." },
        { id = "h_cloth", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Gothor Brumn, armorer. Ye'll no' be wantin' a hauberk, I take it, for ye'd fold up under one. There's Rann Flamespinner for cloth, though I'll talk if ye've a mind." },
      },
      again = {
        { id = "h_again", text = "What else? I've rings tae rivet." },
        { id = "h_again2", text = "Go on, I'm listenin'." },
        { id = "h_again3", text = "Aye? Ask, an' dinnae lean on the shields." },
      },
      choices = {
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "You outfit the mountaineers?", next = "mountaineers" },
        { text = "What does a trogg do to armour?", next = "troggs" },
        { text = "Who else works metal in Thelsamar?", next = "smiths" },
        { text = "Check my armour's fit for me.", next = "fit", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "Mail or plate, for these hills?", next = "mail" },
        { text = "Good day, Gothor.", next = "END" },
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
    hello = {
      lines = {
        { id = "h_default", text = "Nillen Andemar, macecrafter. I make them in Thelsamar an' sell them up here on the dam, for the guards on this wall want somethin' that'll no' turn on a trogg's skull the way an edge does." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "Nillen Andemar, macecrafter, an' ye're a smith yerself, by the burns. Then tell me, why does every apprentice want tae make swords, when a mace is twice the work an' half the breakage?" },
      },
      again = {
        { id = "h_again", text = "What else? Mind the edge o' the walkway while ye think." },
        { id = "h_again2", text = "Go on, ask. I've the whole afternoon an' a fine view." },
        { id = "h_again3", text = "Aye? Speak up over the water." },
      },
      choices = {
        { text = "Show me your maces.", next = "BUSINESS" },
        { text = "Why a mace over a blade?", next = "why" },
        { text = "Why sell on the dam?", next = "dam" },
        { text = "What makes a good mace?", next = "craft" },
        { text = "Fit me for a hammer.", next = "fit", when = { class = { "PALADIN", "WARRIOR", "PRIEST" } } },
        { text = "What do the wall guards buy?", next = "guards" },
        { text = "Good day, Nillen.", next = "END" },
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
