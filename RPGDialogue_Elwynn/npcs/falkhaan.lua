-- Falkhaan Isenstrider, by the road out of Northshire. Voice: bibles/falkhaan.md
-- Sends tired recruits down the road to his best friend's inn.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "falkhaan", id = TODO_NPC("Falkhaan Isenstrider"), name = "Falkhaan Isenstrider",
  bible = "bibles/falkhaan.md", role = "questgiver", tier = "quest",
  communities = { "northshire", "goldshire" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "weary", "drink", "lock_soulstone" },
  impression = {
    first = "He sends tired travelers to bed with a herald's pride.",
    third = "{name} was pointed toward Goldshire's inn by Falkhaan Isenstrider, who keeps watch over the road and cares that travelers rest.",
  },

  greetings = {
    { id = "g_op_refugees_welcome", when = { opinion = { topic = "westfall_refugees", stance = "welcome" } }, text = "Ah, you're back! Two more carts came up from Westfall this week, and I told them a friend of the road had spoken up for them." },
    { id = "g_road", text = "The road south's the best road in Elwynn, friend, because it ends at a warm fire and a soft bed." },
    { id = "g_back", when = { questDone = TODO_QUEST("Rest and Relaxation") }, text = "Well? Is the Lion's Pride everything I said?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's late to be walking, friend, but the inn's lamps are lit, so follow them." },
    { id = "g_far", when = { minLevel = 25 }, text = "Look who's back on my road. You've worn out a few pairs of boots since I saw you last." },
    { id = "g_away", when = { away = 14 }, text = "There's a face I haven't seen on my road for {away}! You'll want a hot meal and a soft bed, so you know exactly where to go." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown a good deal since I last pointed you south, friend. I'd say Farley's stew did that, but I suspect it was the road." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Folk up the road have been saying kind things about you, and I like to think I sent you off on the right foot." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like you've been dead, and by the grey on you I'd say you have. Go and sit by a fire for an hour before you do anything else." },
    { id = "n_battered", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Was it kobolds or wolves that did that? You've the look of someone who's had a morning of both." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, you've found the inn already, I see, or else a bottle found you first." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "There's a pale look about you, as if part of your soul were set aside somewhere for safekeeping. I've sent young soldiers through that door with less, but I never thought to see one carrying their own way back from the grave." },
  },

  start = "hello",
  nodes = {
    op_refugees = {
      lines = {
        { id = "op_refugees_a", text = "Depends who you ask, and when. Farley feeds them, the farmers hire them, and a few people at the bar say every Westfall cart brings a Defias in the bottom of it. You've walked the road, so what do you say?" },
      },
      choices = {
        { text = "They're our own people. Goldshire should take in every one.", next = "op_refugees_1", fx = { opinion = { westfall_refugees = "welcome", westfall = "abandoned" }, align = { light = 1 }, affinity = 2 } },
        { text = "Some of them are thieves. Goldshire's right to watch them close.", next = "op_refugees_2", fx = { opinion = { westfall_refugees = "trouble", defias = "hardline" }, align = { light = -1 } } },
        { text = "Feed them, yes, but somebody has to take Westfall back for them.", next = "op_refugees_3", fx = { opinion = { westfall_refugees = "welcome", westfall = "send_soldiers" }, trait = { brave = 1 } } },
        { text = "I came up that road myself. Most of us only want work.", next = "op_refugees_4", when = { origin = "human_westfall_farmhand" }, fx = { opinion = { westfall_refugees = "welcome" }, affinity = 3 } },
        { text = "I've no strong view on it.", next = "BACK" },
      },
    },
    op_refugees_1 = {
      lines = { { id = "op_refugees_r1", text = "That's what Farley says, and he's got the empty pantry to prove it. I'll keep pointing them his way, then, and tell them a stranger spoke up for them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_refugees_2 = {
      lines = { { id = "op_refugees_r2", text = "Some, maybe, but I've watched a hundred of those carts go by and I've seen more children in them than knives. Watch close if you like; just watch fair." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_refugees_3 = {
      lines = { { id = "op_refugees_r3", text = "Gryan Stoutmantle's trying, up on Sentinel Hill, with farmers and pitchforks. Tell him I sent you, and that Goldshire misses Westfall's harvest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_refugees_4 = {
      lines = { { id = "op_refugees_r4", text = "Did you, now? Then I'll stop talking about it as if I knew, and you can tell the next cart where the work is. They'll listen to you before me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_falkhaan = {
      big = true,
      lines = { { id = "xpt_falkhaan_default", text = "More than anyone gives you credit for, because every gnoll you put down on your way to Goldshire is one that won't trouble a farmer's cart next week. But a company that rides through too fast doesn't see the trouble at all, so slow down now and then." } },
      choices = {
        { text = "We'll take the time to deal with what we find.", next = "BACK", reply = "That's the spirit, and Goldshire will be the safer for it. The Lion's Pride will have a hot meal waiting.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "We've places to be. The guards can clear the roads.", next = "BACK", reply = "They can, if they had enough of them. Ride on, then, and mind the gnolls.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They come every day, from every corner of the Alliance. A shaman is a new one, I'll grant you, but the inn's welcome is the same for all." } },
      choices = {
        { text = "A fair welcome for everyone is good order, Falkhaan.", next = "BACK", reply = "It is, and it's the only order I care about. You'll find the beds soft and the ale cold.", fx = { align = { order = 1 } } },
        { text = "Welcome is cheap. Let them earn their beds.", next = "BACK", reply = "They earn them by walking here, friend. Farley's not running a barracks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A little, because I send tired farmhands and young soldiers through that same door. Maximillian Crowe keeps his students quiet and Farley keeps his mouth shut, and as long as nobody upstairs comes to harm, I suppose it's not my place to say." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A little, because I send tired farmhands and young soldiers through that same door, and none of them ever came back up with something like that at their heel. Maximillian Crowe keeps his students quiet and Farley keeps his mouth shut, and as long as nobody upstairs comes to harm, I suppose it's not my place to say." },
      },
      choices = {
        { text = "Nobody upstairs will come to harm from me, Falkhaan.", next = "BACK", reply = "I'll hold you to that, and so will Farley. Go on down.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What happens in the cellar isn't their business.", next = "BACK", reply = "Maybe not, but they sleep above it, friend. Keep it quiet.", fx = { align = { light = -1 } } },
        { text = "Something else, Falkhaan.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Crystal Lake at dusk, when the fishermen have gone home and the deer come down to drink, and I've stood there longer than I'd admit. Keep clear of the murlocs on the far shore, though, because they don't care much for quiet." } },
      choices = {
        { text = "I'll go quietly and leave the deer in peace.", next = "BACK", reply = "That's the way to see it, and the deer will thank you. Mind the murlocs.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Deer that drink at dusk make for easy hunting.", next = "BACK", reply = "They do, aye, and I'd rather you didn't. Leave them that one quiet hour.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because they fight everything between Northshire and Goldshire, the wolves, the kobolds and each other, and nobody told them a wolf can be walked around. Rest well, and pick your fights tomorrow." } },
      choices = {
        { text = "I'll rest tonight and choose my fights more carefully.", next = "BACK", reply = "That's the wisest thing a warrior's said to me this week. Farley will have a bed ready.", fx = { align = { order = 1 } } },
        { text = "If it's in my way, I'll fight it.", next = "BACK", reply = "Then you'll be fighting all the way to Goldshire and sleeping in a ditch. Suit yourself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More every season, and I can tell them by their boots, since a hunter walks the edges and never the road. The wolves have learned to keep off the road too, so you'll find them in the trees." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "More every season, and I can tell them by their boots, since a hunter walks the edges and never the road. Your {pet} looks like it's walked far today, so get it fed before yourself, and you'll both sleep better." },
      },
      choices = {
        { text = "I'll leave the road wolves be unless they come near.", next = "BACK", reply = "Good, and most of them will learn to leave you be. Mind the ones that don't.", fx = { align = { honor = 1 } } },
        { text = "I'll take every wolf in those trees, near or not.", next = "BACK", reply = "Then you'll be back on this road tired and bitten, I expect. Mind yourself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a body that sleeps in hedges wakes up stiff and slow, and slow is the last thing your trade can afford. Rest properly at the Lion's Pride and you'll be sharper for it, and Farley won't ask what you do for a living." } },
      choices = {
        { text = "Then I'll rest at the inn like an honest traveller.", next = "BACK", reply = "Good, and Farley will be glad of you. He keeps a quiet room for folk like you.", fx = { align = { order = 1 } } },
        { text = "A hedge costs nothing and keeps no ledger. I'll keep my hedge.", next = "BACK", reply = "Suit yourself, but don't come complaining to me about your back. Farley's beds are better.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It does when your hands start shaking at Jasperlode and you set the mine's timbers alight instead of the kobolds. I've seen it happen to a young mage from the Abbey, and he was very sorry about it afterwards." } },
      choices = {
        { text = "I'll take your advice and rest, Falkhaan.", next = "BACK", reply = "Good. Jasperlode's timbers will thank you, and so will the miners under them.", fx = { align = { order = 1 } } },
        { text = "I'll sleep when the work is done, not before.", next = "BACK", reply = "The work's never done, friend, and you'll find that out. The inn's down the road when you do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I try, and they never listen, and some of them come back down this road on a cart. A paladin who won't rest is a paladin who fails when it matters, and I'd tell Brother Sammuel that to his face if he ever sat down long enough." } },
      choices = {
        { text = "Rest is a duty too. I'll take it when it's due.", next = "BACK", reply = "That's the right way to see it, and I'd like Sammuel to hear you say it one day.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll rest when the work is done, and not before.", next = "BACK", reply = "The work's never done, paladin, and they'll carry you down this road if you're not careful. Rest a little.", fx = { align = { order = -1 } } },
        { text = "Something else, Falkhaan.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_falkhaan", tags = { "news" }, when = { party = true },
          text = "A company on the road! You'll want rooms at the Lion's Pride, all of you, and do tell Farley that Falkhaan sent you, because he likes to know I'm doing my job." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, down from the Abbey! Rest at the inn tonight, because I've seen Brother Sammuel's students, and they never know when to stop." },
        { id = "h_default", text = "Falkhaan Isenstrider, at your service. I stand by this road and tell tired people where to sleep, because somebody has to and it may as well be me." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Rest and Relaxation") },
          text = "You've been fighting kobolds since sunup, by the look of you. Rest when you're worn down, and the Lion's Pride in Goldshire is the place for it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Rest and Relaxation") },
          text = "Straight down the road south; you can't miss it. Tell Farley I sent you, and he'll pretend to grumble about it." },
        { id = "h_after", when = { questDone = TODO_QUEST("Rest and Relaxation") },
          text = "Farley's my oldest friend, so tell me true: is he still telling that story about the hunter on the cart? He is, isn't he." },
        { id = "h_home", when = { homeInn = { "Goldshire", "Lion's Pride Inn" } },
          text = "So you've made the Lion's Pride your home. Good choice; it's mine too, most nights." },
        { id = "h_recruit", when = { maxLevel = 5, timesTalked = { max = 1 } },
          text = "You're a new recruit; I can always tell. You still look at every wolf as though it's personal." },
        { id = "h_far", when = { minLevel = 25 },
          text = "I sent you south a recruit, and you've come back walking like someone who sleeps on rocks. The inn's still there, if you've forgotten what a bed is." },
        { id = "h_priest", when = { class = "PRIEST", maxLevel = 9 },
          text = "Another one out of the Abbey with sore knees, because the brothers pray hard. Go and rest them somewhere soft." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You look like someone who sleeps in hedges and calls it an inn. The Lion's Pride has beds, you know, and real ones." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you're the sort who forgets to sleep, I can see it in your eyes. Reading by candlelight again, were you?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior on my road. You've had a hard day of it, I'd wager; the Lion's Pride has a bed with your name on it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, with a beast in tow and mud to the knees. Farley lets animals sleep by the fire, so long as they don't eat the cat." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf on the Goldshire road! The Lion's Pride has a soft bed and a hot meal, though I expect your kind would sooner sleep in a tree." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Everybody needs somewhere to sleep, and I'll point you to the Lion's Pride like anyone else, though I suspect you know the cellar already." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and tired, I'd say! Rest at the Lion's Pride, friend. Farley never waters his drinks, and the beds are clean." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? The road's quiet just now, and I've time." },
        { id = "h_again2", text = "Go on. Nobody's coming down from the Abbey for a while yet." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask, then, but the inn's warmer than this road at night." },
      },
      choices = {
        { text = "Tell me about the inn.", next = "inn" },
        { text = "You stand out here all day, it seems.", next = "road" },
        { text = "Any advice for the road?", next = "advice" },
        { text = "Is Melika at the inn some relation of yours?", next = "melika", when = { questDone = TODO_QUEST("Rest and Relaxation") } },
        { text = "The brothers say rest is its own prayer.", next = "priest", when = { class = "PRIEST" } },
        { text = "I walked this road as a novice once.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "I've been a long way since you sent me south.", next = "far", when = { minLevel = 20 } },
        { text = "My people sleep beneath the stars, not under roofs.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "Why should a rogue pay for a bed in town?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A little lost sleep never hurt a mage.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do warriors always look so tired on this road?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess you see plenty of hunters on this road.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You must try to stop the tired from going on, Falkhaan.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is there anywhere quiet in Elwynn, away from the road?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does it bother you, knowing who you send down to the inn's cellar?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do many travellers come through Goldshire, Falkhaan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Do companies like ours keep the roads safe, Falkhaan?", next = "xpt_falkhaan", when = { party = true } },
        { text = "I'll find my own bed, thanks.", next = "END" },
      },
    },

    inn = {
      lines = {
        { id = "i_default", text = "It's warm and honest, and the stew's the same stew it's been for twenty years. That's a compliment, whatever Farley says." },
      },
      choices = {
        { text = "What's Farley like?", next = "farley", fx = { learn = { "lions_pride" } } },
        { text = "You must get a cut.", next = "cut", fx = { trait = { skeptical = 1 } } },
        { text = "I'll go and see.", next = "BACK", fx = { learn = { "lions_pride" }, affinity = 1 } },
      },
    },
    cut = {
      lines = { { id = "c_default", text = "A cut of what, the stew? I get a chair by the fire, a friend who listens and whatever's left in the pot, which beats coin most weeks." } },
      choices = {
        { text = "Can't argue with free stew.", next = "BACK" },
        { text = "Everyone gets paid somehow.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = -1 } },
      },
    },
    farley = {
      lines = {
        { id = "fa_default", text = "He's loud and kind, and he's never let a guest leave hungry in his life. Don't tell him I said kind, or he'll be unbearable for a week." },
      },
      choices = {
        { text = "I'm surprised you don't work at the inn with him.", next = "farley_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farley_why = {
      lines = {
        { id = "fw_default", text = "Somebody has to stand at this end of the road. Farley keeps the fire; I point people at it. We argue about who has the harder job." },
      },
      choices = {
        { text = "Sounds like you both win.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "He does, Falkhaan. A fire can't walk out to meet anyone.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },

    road = {
      lines = {
        { id = "r_default", text = "I do, because recruits come down from the Abbey with kobold wax in their hair and no idea where to sleep. Somebody ought to tell them." },
      },
      choices = {
        { text = "Who comes down this road?", next = "road_who" },
        { text = "Kind of you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    road_who = {
      lines = {
        { id = "rw_default", text = "Novices, recruits and farmers going to market, and last week a dwarf who'd taken a very wrong turn. All of them are tired, and all of them are sure they aren't." },
        { id = "rw_westfall", when = { minLevel = 8 },
          text = "Lately there's Westfall folk too, coming up the road with their carts. They don't ask me where to sleep; they ask where there's work." },
      },
      choices = {
        { text = "What do you tell the Westfall folk?", next = "road_westfall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_westfall = {
      lines = {
        { id = "rx_default", text = "The Eastvale camp always wants hands, and Farley always wants a dishwasher. It's not much, but it's what this end of the road has." },
      },
      choices = {
        { text = "How does Goldshire feel about the Westfall folk?", next = "op_refugees" },
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
      choices = { { text = "Spoken like a true Elwynn family.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    priest = {
      lines = {
        { id = "p_default", text = "Do they? Then I've been praying at the side of this road for years and never knew it. Don't tell the Abbey, or they'll want me at vespers." },
      },
      choices = {
        { text = "Your secret's safe with the Light.", next = "BACK", reply = "Thank you, and I'll keep it there. The road's a good place for prayer.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A prayer by the roadside isn't much of a prayer.", next = "BACK", reply = "Maybe not to the Abbey, but it's done me well enough. I'll keep at it.", fx = { align = { light = -1 } } },
        { text = "Vespers would do you good.", next = "BACK", fx = { trait = { pious = 1 } } },
      },
    },
    novice = {
      lines = {
        { id = "nv_default", text = "Then you know the walk. The first night out of the Abbey is the loneliest. The second's at the Lion's Pride, and it's much better." },
      },
      choices = {
        { text = "I must have passed you then.", next = "novice_pass" },
        { text = "Something else.", next = "BACK" },
      },
    },
    novice_pass = {
      lines = {
        { id = "np_default", text = "Probably. I don't remember faces, I remember shoulders, and novices walk with theirs up round their ears. Yours have come down a good way." },
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
    westfall = { { id = "tp_westfall", text = "I see Westfall on the faces coming up this road, tired and too proud to say so." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask in the inn, or ask Farley; he knows everything, though mostly wrong." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The brothers up at the Abbey teach every recruit who comes through, and they ask nothing back but a prayer now and then. Not many in Stormwind can say the same." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire comes to Goldshire, Farley's inn is full to the rafters and he's happy as a pig in mud. I tell the recruits to ask for a bed early." } },
    heroes_vigil = { { id = "tp_heroes_vigil", text = "That stone ring on the lake is for the folk who died when the orcs burned Goldshire. Farley won't hear a word against it, and nor will I." } },
    echo_ridge = { { id = "tp_echo_ridge", text = "Recruits who come back from Echo Ridge come back muddy and proud, and they walk past me grinning. That's how I know the brothers have done their work." } },
  },
}
