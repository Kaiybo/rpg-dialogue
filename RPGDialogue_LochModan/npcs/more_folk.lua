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
        { id = "h_again", text = "What else? The light's good for shootin', an' I'd like tae get back to it." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What's the secret to a good shot?", next = "shot" },
        { text = "What do the Farstriders hunt?", next = "farstriders" },
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
  },
  topics = {
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
        { id = "h_again", text = "What else? I've a sluice gate to check, but I can talk!" },
        { id = "h_again2", text = "Go on, ask me anything!" },
      },
      choices = {
        { text = "Train me in engineering.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "Tell me about the dam.", next = "dam" },
        { text = "Why train here, and not Ironforge?", next = "why" },
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
  },
  topics = {
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
        { id = "h_again", text = "What else? I've a long road ahead." },
        { id = "h_again2", text = "Go on, I've a minute." },
      },
      choices = {
        { text = "Show me your bread.", next = "BUSINESS" },
        { text = "Isn't the road dangerous?", next = "road" },
        { text = "What's the news on the road?", next = "news" },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a baker an' a walker. That's my life." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, but have some bread anyway." } },
  },
}
