-- More Loch Modan folk: Pilot Hammerfoot at the North Gate Outpost, Dargh Trueaim at the Farstrider Lodge,
-- Deek Fizzlebizz on the Stonewrought Dam, and Greishan Ironstove on the road with his bread.
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
      lines = { { id = "lf_default", text = "Vyrin Swiftwind, an elf from the far north wi' a grudge against a bear, an' a handful o' traders who sell us powder, leather an' bowstrings. It's a quiet hall till somebody brings in a kill, an' then ye cannae hear yerself think." } },
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
  notices = { "hunger" },
  impression = {
    first = "He knows every hungry mountaineer along the road.",
    third = "{name} met Greishan Ironstove, a travelling bread merchant on the roads of Loch Modan.",
  },
  greetings = {
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
    thelsamar = { { id = "tp_thel", text = "Home, an' the best wee town on the loch. Ye'll smell Vidra's sausages before ye see the roofs." } },
    mountaineers = { { id = "tp_mount", text = "Good lads an' lasses, an' hungry every one. They keep the troggs off the road an' I keep them fed, an' that's Loch Modan in a sentence." } },
    background = { { id = "tp_bg", text = "I'm a baker an' a walker. That's my life." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, but have some bread anyway." } },
  },
}
