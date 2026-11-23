-- Searing Gorge: folk a roster scan found with no conversation yet. Voice: bibles/gorge_roads.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC = P.TODO_NPC

-- Graw Cornerstone: Ironforge mail armor merchant at Thorium Point.
P:NPC {
  key = "sg_graw_cornerstone", id = TODO_NPC("Graw Cornerstone"), name = "Graw Cornerstone", title = "Mail Armor Merchant", gender = "male",
  bible = "bibles/gorge_roads.md", role = "vendor", tier = "service",
  communities = { "thorium_point" }, temper = { "dour", "steady" }, values = { "craft", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "Graw Cornerstone sells mail from a pack of rings and rivets at Thorium Point, and he keeps one eye on the Dark Irons around him the whole time he talks.",
    third = "{name} met Graw Cornerstone, an Ironforge dwarf who sells mail armor in the Searing Gorge.",
  },
  greetings = {
    { id = "g_default", text = "Mail, {g:lad|lass}, good Ironforge links, an' the only honest armor ye'll find on this side o' the Gorge. Mind the cinders on yer boots." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' yer mail's still in one piece. That's more than I can say for most folk who come through here." },
  },
  notice = {
    { id = "n_mail", cat = "class", when = { class = { "HUNTER", "SHAMAN" } },
      text = "A {class} wearin' mail, aye, that's the sensible choice. Leather burns in this heat an' plate cooks ye like a pie." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another o' the clans, an' a welcome sight among all these Dark Iron faces. Keep yer voice down when ye speak o' Thaurissan, though." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Graw Cornerstone, mail smith an' merchant, late o' Ironforge an' now, Light help me, a guest o' the Thorium Brotherhood. They pay good coin for news from home, an' I sell armor to whoever's brave enough to walk the Gorge." } },
      again = {
        { id = "h_again", text = "Aye, what else can I tell ye?" },
        { id = "h_again2", text = "Ask away, {g:lad|lass}, the rivets'll keep." },
      },
      choices = {
        { text = "An Ironforge dwarf trading with Dark Irons?", next = "brotherhood" },
        { text = "What's the Gorge like for a traveller?", next = "gorge" },
        { text = "Your mail looks light for the heat.", next = "mail" },
        { text = "Let me see your wares.", next = "END" },
      },
    },
    brotherhood = {
      lines = { { id = "b_default", text = "Strange, isn't it? These ones broke with the Emperor an' his fire lord, or so they swear, an' they want trade an' craftsmen more than they want old grudges. I watch my purse an' my back, an' so far both are still where I left them." } },
      choices = {
        { text = "A Dark Iron is a Dark Iron. Don't trust them.", next = "BACK", reply = "Ye'd not be the first to say it, an' I've thought it myself on a long night. Still, their coin spends.", fx = { align = { order = 1 } } },
        { text = "If they broke with Thaurissan, they deserve a chance.", next = "BACK", reply = "Aye, maybe so. My grandfather would spit, but my grandfather never had to make a living out here.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorge = {
      lines = { { id = "g2_default", text = "Hot as a forge an' twice as smoky, wi' fire elementals in the slag an' Dark Iron slavers in the Cauldron. The Brotherhood's camp here at Thorium Point is the only place I'd sleep wi' my boots off." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mail = {
      lines = { { id = "m_default", text = "Light, aye, an' riveted loose so the air can move through it, or ye'll faint before ye ever reach Blackrock. I learned that the hard way my first summer here." } },
      choices = { { text = "Something else, Graw.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm an Ironforge smith who came south for the trade, an' I've stayed longer than I meant to." } },
    _none = { { id = "tp_none", text = "Cannae say, {g:lad|lass}. Ask one o' the Brotherhood, if ye can get a straight word out o' them." } },
  },
}

-- Thorium Brotherhood Lookout: a Dark Iron sentry at Thorium Point.
P:NPC {
  key = "sg_thorium_lookout", id = TODO_NPC("Thorium Brotherhood Lookout"), name = "Thorium Brotherhood Lookout", gender = "male",
  bible = "bibles/gorge_roads.md", role = "guard", tier = "service",
  communities = { "thorium_point" }, temper = { "wary", "terse" }, values = { "duty", "loyal" },
  notices = { "race" },
  impression = {
    first = "A Dark Iron lookout of the Thorium Brotherhood, scanning the Gorge from the scaffolds of Thorium Point. He didn't lower his crossbow much when I spoke.",
    third = "{name} spoke with a lookout of the Thorium Brotherhood at Thorium Point.",
  },
  greetings = {
    { id = "g_default", text = "Stop there and keep your hands open. Thorium Point welcomes traders and fighters, but I've seen too many of the Emperor's spies wearing honest faces." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Go on up, then, and don't make me regret remembering you." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Bronzebeard, by the look of you. Yes, I'm Dark Iron, and no, I've no wish to talk about the War of the Three Hammers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep watch for the Brotherhood, and from up here I can see the whole Gorge, from the Cauldron to the Blackrock road. Anything that comes this way, I see it first, and I'd prefer it was you rather than a war party." } },
      again = { { id = "h_again", text = "Anything else? Be quick, I'm meant to be watching." } },
      choices = {
        { text = "What are you watching for?", next = "watch" },
        { text = "Why did the Brotherhood leave Thaurissan?", next = "why" },
        { text = "You don't trust outsiders much.", next = "trust" },
        { text = "I'll go on up.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Slavers from the Cauldron, fire elementals that wander up out of the slag, and the Emperor's own agents, who'd dearly love to see this camp burned. The Brotherhood has a price on its head down in Blackrock Depths." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "y_default", text = "Because a smith wants to make things, not bow to a lord of fire who'd burn the whole world for his own glory. Ragnaros owns the Emperor body and soul, and we decided we'd rather own ourselves." } },
      choices = {
        { text = "Breaking from your own people took real courage.", next = "BACK", reply = "Courage, or stubbornness. Among Dark Irons there's not much difference.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A traitor once is a traitor always.", next = "BACK", reply = "Say that a little louder and see how far you get up these stairs.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "Would you, in my boots? Half the world wants my kind dead for what the Emperor did, and the other half works for him. You earn trust here by work, the same as anyone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm Dark Iron born, Thorium Brotherhood by choice, and a lookout because I've the sharpest eyes in camp." } },
    _none = { { id = "tp_none", text = "Not my business. Ask Lokhtos, if you've got the gold to make it his." } },
  },
}

---------------------------------------------------------------------------
-- Enslaved Archaeologist: dwarven diggers held by the Dark Iron in the Slag Pit.
---------------------------------------------------------------------------
P:NPC {
  key = "sg_enslaved_archaeologist", id = 8402, name = "Enslaved Archaeologist", gender = "male",
  role = "captive", tier = "service",
  communities = { "ironforge" }, temper = { "weary" }, values = { "knowledge", "survival" },
  notices = { "race" },
  impression = {
    first = "A gaunt dwarf in a torn Explorers' League coat chips at the rock deep in the Slag Pit, his ankles chained and his hands black with soot.",
    third = "{name} spoke with an enslaved archaeologist in the Slag Pit.",
  },
  greetings = {
    { id = "g_default", text = "Quiet, quiet! If the overseers see me talkin', they'll take it out of my hide." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I came to the Gorge with the Explorers' League, and the Dark Irons caught us before we'd dug a single trench. Now we dig for them instead, and they're not kind employers." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "One of our own, free and armed! By my beard, I thought I'd never see it again." },
      },
      again = { { id = "h_again", text = "Quickly, what else?" } },
      choices = {
        { text = "What are they making you dig for?", next = "dig" },
        { text = "How did you get captured?", next = "captured" },
        { text = "I'll find a way to help.", next = "END" },
      },
    },
    dig = {
      lines = { { id = "d_default", text = "Ore and old relics, both, though they care more for the ore. Thaurissan's folk need iron for their forges, and the Gorge is full of it if you don't mind dyin' for it." } },
      choices = {
        { text = "The Dark Irons will pay for this.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep your head down and live. Revenge can wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "They're dwarves too. Why do this?", next = "why" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because they've hated us since the War of the Three Hammers, and Ragnaros has their ear now. Whatever's down in the mountain has turned them crueller than they ever were." } },
      choices = { { text = "Then someone must stop them.", next = "BACK" } },
    },
    captured = {
      lines = { { id = "c_default", text = "We were mapping the old tunnels west of the pit when they came out of the dark with chains ready. Two of my friends fought back, and they're not with us any more." } },
      choices = { { text = "I'm sorry.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I cannae think of anythin' but getting out of here. Ask me again when I'm free." } } },
}
