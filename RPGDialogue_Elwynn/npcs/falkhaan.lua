-- Falkhaan Isenstrider, by the road out of Northshire. Voice: bibles/falkhaan.md
-- Sends tired recruits down the road to his best friend's inn.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "falkhaan", id = TODO_NPC("Falkhaan Isenstrider"), name = "Falkhaan Isenstrider",
  bible = "bibles/falkhaan.md", role = "questgiver", tier = "quest",
  communities = { "northshire", "goldshire" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "weary", "drink" },
  impression = {
    first = "Falkhaan Isenstrider stands by the road telling tired people where to sleep, and he does it with all the pride of a herald. He seemed genuinely pleased to send me on to the Lion's Pride.",
    third = "{name} was pointed toward Goldshire's inn by Falkhaan Isenstrider, who keeps watch over the road and cares that travelers rest.",
  },

  greetings = {
    { id = "g_road", text = "The road south's the best road in Elwynn, friend, because it ends at a warm fire and a soft bed." },
    { id = "g_back", when = { questDone = TODO_QUEST("Rest and Relaxation") }, text = "Well? Is the Lion's Pride everything I said?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be walking. The inn's lamps are lit; follow them." },
    { id = "g_far", when = { minLevel = 25 }, text = "Look who's back on my road. You've worn out a few pairs of boots since." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like you've been dead, and by the grey on you I'd say you have. Go and sit by a fire for an hour before you do anything else." },
    { id = "n_battered", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Was it kobolds or wolves that did that? You've the look of someone who's had a morning of both." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, you've found the inn already, I see, or else a bottle found you first." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because they fight everything between Northshire and Goldshire, the wolves, the kobolds and each other, and nobody told them a wolf can be walked around. Rest well, and pick your fights tomorrow." } },
      choices = {
        { text = "I'll rest tonight and choose my fights more carefully.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it's in my way, I'll fight it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More every season, and I can tell them by their boots, since a hunter walks the edges and never the road. The wolves have learned to keep off the road too, so you'll find them in the trees." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has the look of a creature that's walked far today. Get it fed before yourself, and you'll both sleep better." },
      },
      choices = {
        { text = "I'll leave the road wolves be unless they come near.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take every wolf in those trees, near or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a body that sleeps in hedges wakes up stiff and slow, and slow is the last thing your trade can afford. Rest properly at the Lion's Pride and you'll be sharper for it, and Farley won't ask what you do for a living." } },
      choices = {
        { text = "Then I'll rest at the inn like an honest traveller.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A hedge costs nothing and keeps no ledger. I'll keep my hedge.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It is when your hands start shaking at Jasperlode and you set the mine's timbers alight instead of the kobolds. I've seen it happen to a young mage from the tower, and he was very sorry about it afterwards." } },
      choices = {
        { text = "I'll take your advice and rest, Falkhaan.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll sleep when the work is done, not before.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Falkhaan Isenstrider, at your service. I stand by this road and tell tired people where to sleep, because somebody has to and it may as well be me." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Rest and Relaxation") },
          text = "Kobolds since sunup, by the look of you. Rest when you're worn down. The Lion's Pride in Goldshire is the place for it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Rest and Relaxation") },
          text = "Straight down the road south; you can't miss it. Tell Farley I sent you, and he'll pretend to grumble about it." },
        { id = "h_after", when = { questDone = TODO_QUEST("Rest and Relaxation") },
          text = "Farley's my oldest friend, so tell me true: is he still going on about the cow? He is, isn't he." },
        { id = "h_home", when = { homeInn = { "Goldshire", "Lion's Pride Inn" } },
          text = "So you've made the Lion's Pride your home. Good choice; it's mine too, most nights." },
        { id = "h_recruit", when = { maxLevel = 5, timesTalked = { max = 1 } },
          text = "You're a new recruit; I can always tell. You still look at every wolf as though it's personal." },
        { id = "h_far", when = { minLevel = 25 },
          text = "I sent you south a recruit, and you've come back walking like someone who sleeps on rocks. The inn's still there, if you've forgotten what a bed is." },
        { id = "h_priest", when = { class = "PRIEST", maxLevel = 9 },
          text = "Another one out of the Abbey with sore knees. The brothers pray hard. Go and rest them somewhere soft." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You look like someone who sleeps in hedges and calls it an inn. The Lion's Pride has beds, you know, and real ones." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you're the sort who forgets to sleep, I can see it in your eyes. Reading by candlelight again, were you?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior on my road. You've had a hard day of it, I'd wager; the Lion's Pride has a bed with your name on it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, with a beast in tow and mud to the knees. Farley lets animals sleep by the fire, so long as they don't eat the cat." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? The road's quiet just now, and I've time." },
        { id = "h_again2", text = "Go on. Nobody's coming down from the Abbey for a while yet." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask, then. But the inn's warmer than this road at night." },
      },
      choices = {
        { text = "Tell me about the inn.", next = "inn" },
        { text = "Why stand out here all day?", next = "road" },
        { text = "Any advice for the road?", next = "advice" },
        { text = "Who's Melika?", next = "melika", when = { questDone = TODO_QUEST("Rest and Relaxation") } },
        { text = "The brothers say rest is a kind of prayer.", next = "priest", when = { class = "PRIEST" } },
        { text = "I walked this road as a novice once.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "I've been a long way since you sent me south.", next = "far", when = { minLevel = 20 } },
        { text = "My people sleep beneath the stars, not under roofs.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "Why should a rogue pay for a bed in town?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is a little lost sleep so bad for a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do warriors always look so tired on this road?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you see many hunters on this road?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll find my own bed, thanks.", next = "END" },
      },
    },

    inn = {
      lines = {
        { id = "i_default", text = "Warm, honest, and the stew's the same stew it's been for twenty years. That's a compliment, whatever Farley says." },
      },
      choices = {
        { text = "What's Farley like?", next = "farley", fx = { learn = { "lions_pride" } } },
        { text = "You must get a cut.", next = "cut", fx = { trait = { skeptical = 1 } } },
        { text = "I'll go and see.", next = "BACK", fx = { learn = { "lions_pride" }, affinity = 1 } },
      },
    },
    cut = {
      lines = { { id = "c_default", text = "A cut of what, the stew? I get a chair by the fire and a friend who listens, and that's the best pay there is." } },
      choices = {
        { text = "Fair enough.", next = "BACK" },
        { text = "Everyone gets paid somehow.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = -1 } },
      },
    },
    farley = {
      lines = {
        { id = "fa_default", text = "Loud, kind, and he's never let a guest leave hungry in his life. Don't tell him I said kind. He'll be unbearable for a week." },
      },
      choices = {
        { text = "Why don't you work at the inn with him?", next = "farley_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farley_why = {
      lines = {
        { id = "fw_default", text = "Somebody has to stand at this end of the road. Farley keeps the fire; I point people at it. We argue about who has the harder job." },
      },
      choices = {
        { text = "Sounds like you both win.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "He does. Fires don't walk.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    road = {
      lines = {
        { id = "r_default", text = "Recruits come down from the Abbey with kobold wax in their hair and no idea where to sleep. Somebody ought to tell them." },
      },
      choices = {
        { text = "Who comes down this road?", next = "road_who" },
        { text = "Kind of you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    road_who = {
      lines = {
        { id = "rw_default", text = "Novices, recruits, farmers going to market. A dwarf last week who'd taken a very wrong turn. All of them tired, and all of them sure they aren't." },
        { id = "rw_westfall", when = { minLevel = 8 },
          text = "Lately, Westfall folk too, going the other way with their carts. They don't ask me where to sleep. They ask where there's work." },
      },
      choices = {
        { text = "What do you tell the Westfall folk?", next = "road_westfall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_westfall = {
      lines = {
        { id = "rx_default", text = "The Eastvale camp always wants hands, and Farley always wants a dishwasher. It's not much. It's what this end of the road has." },
      },
      choices = {
        { text = "It's more than the city gives them.", next = "BACK", fx = { opinion = { westfall = "abandoned" }, learn = { "westfall" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "eastvale" } } },
      },
    },

    advice = {
      lines = {
        { id = "a_default", text = "Rest before you need to, not after. The wolves don't care how brave you were this morning." },
      },
      choices = {
        { text = "And if I've no coin for a room?", next = "advice_coin" },
        { text = "I'll rest when I'm dead.", next = "advice_dead", fx = { trait = { brave = 1 } } },
      },
    },
    advice_coin = {
      lines = {
        { id = "ac_default", text = "Then sit by Farley's fire and keep your coin. Rest finds anyone under that roof, paying or not. Just don't tell him I told you." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    advice_dead = {
      lines = {
        { id = "ad_default", text = "Plenty of recruits have said that on this road. The spirit healer by the Abbey knows most of them by name." },
      },
      choices = {
        { text = "Point taken.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    melika = {
      lines = {
        { id = "m_default", text = "Melika's family, and she works the main room. If she rolls her eyes when you say my name, that's how you know she's family." },
      },
      choices = {
        { text = "Family how?", next = "melika_family" },
        { text = "I'll say hello.", next = "BACK" },
      },
    },
    melika_family = {
      lines = {
        { id = "mf_default", text = "Close enough to argue, far enough to forgive it by supper. That's all the family tree you're getting out of me." },
      },
      choices = { { text = "Fair enough.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    priest = {
      lines = {
        { id = "p_default", text = "Do they? Then I've been praying at the side of this road for years and never knew it. Don't tell the Abbey, or they'll want me at vespers." },
      },
      choices = {
        { text = "Your secret's safe with the Light.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A prayer by the roadside isn't much of a prayer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Vespers would do you good.", next = "BACK", fx = { trait = { pious = 1 } } },
      },
    },
    novice = {
      lines = {
        { id = "nv_default", text = "Then you know the walk. The first night out of the Abbey is the loneliest. The second's at the Lion's Pride, and it's much better." },
      },
      choices = {
        { text = "Did I pass you then?", next = "novice_pass" },
        { text = "Something else.", next = "BACK" },
      },
    },
    novice_pass = {
      lines = {
        { id = "np_default", text = "Probably. I don't remember faces, I remember shoulders. Novices walk with them up round their ears. Yours have come down a good way." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    far = {
      lines = {
        { id = "fr_default", text = "I can see it on you. One night in a real bed won't hurt your reputation, though Farley will want every story, so lie a little; he does." },
      },
      choices = {
        { text = "I'll save the best ones for him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Some stories aren't for an inn.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    kaldorei = {
      lines = { { id = "kaldorei_l", text = "So I've heard, and I've watched a few of your people try Farley's beds and give up by midnight. There's a meadow behind the inn where the last one slept; Farley charged her nothing, and she left a flower on the pillow anyway." } },
      choices = {
        { text = "The meadow, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll try the bed, for the experience.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Not much to tell. I stand here, Farley stands there, and between us everybody gets to bed." } },
    advice = {
      { id = "tp_ad", text = "Rest before you need to. Every recruit learns it the hard way; you could be the first to learn it the easy way.", next = "advice" },
      { id = "tp_ad2", text = "Follow the lamps after dark. Wolves don't like lamps, and Farley does." },
    },
    lions_pride = { { id = "tp_inn", text = "Best inn this side of the city. I'd say that even if Farley weren't listening." } },
    northshire_abbey = { { id = "tp_abbey", text = "Good people up there. They work recruits hard, then send them past me looking half-dead." } },
    defias = { { id = "tp_defias", text = "Not on my road, they don't. They keep to the vineyards and the woods, so far at least." } },
    westfall = { { id = "tp_westfall", text = "I see Westfall on the faces coming up this road. Tired, and too proud to say so." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask in the inn, or ask Farley; he knows everything, though mostly wrong." } },
  },
}
