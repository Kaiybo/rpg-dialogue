-- Everlook's two talkers: Harlo Wigglesworth, a goblin who passes on whatever he's heard,
-- and Meggi Peppinrocker, a goblin who loves the wilds more than she remembers what she was saying.
-- Voices: bibles/harlo.md, bibles/meggi.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Harlo Wigglesworth
---------------------------------------------------------------------------
P:NPC {
  key = "harlo_w", id = TODO_NPC("Harlo Wigglesworth"), name = "Harlo Wigglesworth",
  bible = "bibles/harlo.md", role = "questgiver", tier = "quest",
  communities = { "everlook" }, temper = { "chatty", "cheerful" }, values = { "curious", "gossip" },
  notices = { "travel", "race" },

  impression = {
    first = "Harlo Wigglesworth is an Everlook goblin who can't keep a piece of news to himself, though he likes to keep the best part back so you'll go and see for yourself. Curiosity seems to be his whole trade.",
    third = "{name} met Harlo Wigglesworth, a nosy and friendly goblin of Everlook who passes on what he hears.",
  },

  greetings = {
    { id = "g_default", text = "Hey there, pal, hey! You look like somebody who wants to hear who's been stealin' the inn's pickled herring, and I've got it on good authority, which is to say mine." },
    { id = "g_winna", when = { questActive = TODO_QUEST("A Strange One") }, text = "Did you meet her yet? No, no, don't tell me, chum, I want to imagine your face, and I'm savin' the story for a rainy day." },
    { id = "g_wildkin", when = { questActive = TODO_QUEST("Enraged Wildkin") }, text = "Found that survivor yet, pal? Starfall Village, west of here, you can't miss it, and I've got a whole page waiting for whatever you hear." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and you didn't send me so much as a postcard! What's new out there, pal, and don't leave out the good parts, because I'll know." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at you, all grown and dangerous since I first talked your ear off. That's a story I'd pay for, pal, and I don't pay for anything." },
    { id = "g_word_any", when = { word = { "pleased", "helped" } }, text = "I heard something nice about you today, from {source}! Don't ask me to repeat it, though, pal, because I like you better a little nervous, and nervous folks always come back for more." },
    { id = "g_word_bad", when = { word = { "angered", "intimidated" } }, text = "Word is you rubbed somebody the wrong way. I'm not judging, chum, I'm only collecting, and that one's already worth its weight in gossip." },
  },

  notice = {
    { id = "n_travel", cat = "travel", when = { minLevel = 55, timesTalked = { min = 2 } },
      text = "You've been everywhere, haven't you, pal? I can tell by the boots. Next time you go somewhere strange, come straight back here and tell me first, before you go selling it to anybody else." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Tell me, pal, is it true Gnomeregan's still full of your own folk gone strange? People say all sorts, and I'd like it from someone who'd know, because first-hand news is worth triple." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Harlo Wigglesworth, pal, and I'm the one in Everlook who knows what's going on, mostly because I ask and partly because I never stop. I've just got back from a trip through Felwood, and I've got news that'd curl your toes and probably your boots too." },
        { id = "h_strange", tags = { "news" }, when = { questDone = TODO_QUEST("A Strange One") },
          text = "So you met Winna at Bloodvenom! Isn't she somethin'? I couldn't decide if I wanted to help her or run, so I did the sensible goblin thing and subcontracted the job to you." },
        { id = "h_wildkin_done", when = { questDone = TODO_QUEST("Enraged Wildkin") },
          text = "You went and found that dwarf at Starfall, didn't you? Jaron, that's the one, and he tells the wildkin story better every time I hear it, and the wildkin get bigger, which is how you know a story's appreciating in value." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde or Alliance, it's all the same to me in Everlook, pal, because you've all got ears, and ears are my whole market." },
      },
      again = {
        { id = "h_again", text = "What else, pal? I've got more, I've always got more, and the stock never runs out." },
        { id = "h_again2", text = "Go on, ask me anything, chum, as long as you trade me something back, because even I've got to turn a profit somewhere." },
      },
      choices = {
        { text = "What did you see in Felwood?", next = "felwood" },
        { text = "What's this about a wrecked camp to the south?", next = "camp" },
        { text = "How do you hear so much?", next = "ears" },
        { text = "What's the news in Everlook?", next = "everlook" },
        { text = "I can find things out quietly, Harlo.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Later, Harlo.", next = "END" },
      },
    },
    felwood = {
      lines = {
        { id = "f_default", text = "I stopped at Bloodvenom Post on the way, pal, and I met a very odd character there, a woman who seemed intent on one thing and one thing only. I could tell you what it is, but I think she'd like to explain it to you herself, and I'd hate to undercut her." },
      },
      choices = {
        { text = "Just tell me, Harlo.", next = "felwood_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood_tell = {
      lines = {
        { id = "ft_default", text = "And spoil it? Never, pal, not for all the gold in Undermine! Her name's Winna Hazzard, and she laughs at the end of every other sentence, so go and see her, and come back and tell me if I was right to be nervous." },
      },
      choices = {
        { text = "Is she dangerous?", next = "felwood_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood_danger = {
      big = true,
      lines = {
        { id = "fd_default", text = "Dangerous? Maybe, though she seemed mostly interested in the forest, and in what it does to things. Felwood's poison, pal, and she's got a gleam about it like a goblin looking at an unclaimed mine, and I'm still not sure if that's science or madness." },
      },
      choices = {
        { text = "Someone has to study the poison. Good for her.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some things shouldn't be meddled with.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "c_default", text = "Have you seen it, the abandoned camp south of here? The wildkin went crazy and wrecked just about everything they could get their claws on, crates, tents, the lot, and somebody's insurance won't cover it. I heard one of the survivors is resting at Starfall Village, west of here, and I'm dyin' to know what happened." },
      },
      choices = {
        { text = "Why not go and ask yourself?", next = "camp_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_why = {
      lines = {
        { id = "cw_default", text = "Because it's cold out there, pal, and there are wildkin, and I'm a goblin of delicate constitution and no hazard pay. You, on the other hand, look like the cold's afraid of you." },
      },
      choices = {
        { text = "Fine, I'll go. Keep your delicate toes warm.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ears = {
      lines = {
        { id = "e_default", text = "Everlook's where everybody ends up, sooner or later, and everybody needs a drink when they get here. I just happen to be standing near the drinks, pal, and I'm very good at looking like I'm not listening, which is a skill worth more than gold up here." },
      },
      choices = {
        { text = "Do you sell what you hear?", next = "ears_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ears_sell = {
      big = true,
      lines = {
        { id = "es_default", text = "Sell it? I give it away, mostly, which is a terrible way for a goblin to do business, and believe me, I've done the sums. My cousins say I'm a disgrace to the Cartel, pal, but news is more fun when it's moving." },
      },
      choices = {
        { text = "Secrets should cost something. Charge for them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Good news should be free. Keep giving it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    everlook = {
      lines = {
        { id = "ev_default", text = "Umi's building something furry again, and Legacki's going to scream about it, which is the best news I've had all week, pal. And the furbolgs out at Winterfall have gone nasty, which Donova Snowden at the hot springs can tell you more about than me, and for once I mean that." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    xrogue = {
      lines = {
        { id = "xr_default", text = "I bet you can, pal, and I bet you've heard things I'd give my back teeth for. Tell you what, you bring me somethin' good one day, and I'll owe you a story you can't get anywhere else, and a goblin always settles his debts, eventually." },
      },
      choices = {
        { text = "Deal.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in a cartel town, raised on gossip, and I came to Everlook because it's where all the roads end, pal. Best place in the world to listen, and the cheapest." } },
    advice = { { id = "tp_ad", text = "Always ask one more question than is polite, pal, because that's where the good stuff lives and nobody charges for it." } },
    steamwheedle = { { id = "tp_sw", text = "Everlook's a Steamwheedle town, pal, so nobody fights in it and everybody talks in it, and the talk's tax-free. Perfect, really." } },
    furbolgs = { { id = "tp_furb", text = "The Winterfall used to trade a little, I hear, and now they bite. Something's got into them, and Donova's trying to find out what." } },
    everlook = { { id = "tp_everlook", text = "Everlook's the best town in the world for news, pal, because everybody passes through and nobody keeps their mouth shut. I keep mine shut least of all, but I always save the best part." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the most gossip south of here, but it's mostly about pirates. The news up here is better, because it's mostly about bears and furbolgs, which are more surprising." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's a fine town, if you like sand in your shoes and scorpids in your bed. I've heard stories about the Zul'Farrak trolls that'd curl your toes." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are a strange bunch, but they keep their word, and that's more than I can say for most. Go see for yourself, if you can get past the guards." } },
    _none = { { id = "tp_none", text = "I haven't heard about that one yet! Find out and come back and tell me, would you, pal, because I hate being outbid on news." } },
  },
}

---------------------------------------------------------------------------
-- Meggi Peppinrocker
---------------------------------------------------------------------------
P:NPC {
  key = "meggi", id = TODO_NPC("Meggi Peppinrocker"), name = "Meggi Peppinrocker",
  bible = "bibles/meggi.md", role = "questgiver", tier = "quest",
  communities = { "everlook" }, temper = { "chatty", "proud" }, values = { "nature", "proud" },
  notices = { "kit", "class" },

  impression = {
    first = "Meggi Peppinrocker loves the Winterspring hills and will tell you so at length, and somewhere in the telling she forgets what she meant to say. The thing she meant to say was important.",
    third = "{name} met Meggi Peppinrocker, an Everlook goblin who loves the wilds and loses the thread of every story.",
  },

  greetings = {
    { id = "g_default", text = "There's trouble in Winterspring, you know, sweetie! Oh, and hello, and you didn't come to buy anything, did you, because I've left the shop somewhere." },
    { id = "g_donova", when = { questActive = TODO_QUEST("Trouble in Winterspring!") }, text = "Donova Snowden, at the hot springs. That was it. I knew I'd remember." },
    { id = "g_done", when = { questDone = TODO_QUEST("Trouble in Winterspring!") }, text = "Donova says you've been a help with the furbolgs, sweetie. I knew you had the look of someone who appreciates the hills, and that's worth more than a pocketful of thorium, nearly." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, were you? Out in the hills, I hope, cultivating your reflexes." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "My, you've got that keen eye now, the one I was talking about, the one you can't buy for any price. Was I talking about it?" },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I heard good things about you, from someone, about something. It was good, anyway." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Look at the state of your gear, sweetie! That's what the hills do to you, and it's marvelous, though you'll want it mended before you go back out, and Everlook's smith don't work for smiles." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Then you'll understand, won't you, what it is to spend golden hours out there with nothing but the snow and your own wits?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Meggi Peppinrocker, sweetie, and I'm always mighty proud to say I spend my time out in the wilds instead of behind a counter like the rest of my family. It takes a cool head and a keen eye to appreciate the hills the way I do, and now, what was I talking about?" },
        { id = "h_before", when = { questBefore = TODO_QUEST("Trouble in Winterspring!") },
          text = "Trouble! That's what it was, trouble in Winterspring. Donova Snowden at the hot springs can tell you all about it, because she was the one who told me, I'm nearly sure." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, so you'll know about the hills already, sweetie, though not the way a goblin knows 'em, I'd wager. We notice where the good rocks are and what they'd fetch in Booty Bay." },
      },
      again = {
        { id = "h_again", text = "Where was I? Oh, yes, you were asking something." },
        { id = "h_again2", text = "Ask away, sweetie. I've got all day, and most of the night too, and neither one costs a copper." },
      },
      choices = {
        { text = "What trouble, Meggi?", next = "trouble" },
        { text = "Why do you love the wilds so much?", next = "hills" },
        { text = "A goblin who likes the outdoors?", next = "goblin" },
        { text = "I know the wilds too. I'm a hunter.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I'll let you get on, Meggi.", next = "END" },
      },
    },
    trouble = {
      lines = {
        { id = "t_default", text = "The furbolgs, the Winterfall, out east by the hot springs. Something's got into them, and they've gone savage, and Donova Snowden's out there watching them and getting more worried by the day." },
      },
      choices = {
        { text = "Who's Donova Snowden?", next = "donova" },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    donova = {
      lines = {
        { id = "d_default", text = "A dwarf, and a clever one, who studies the springs and the beasts around them. She's got a kind heart, which is why the furbolgs going bad is hurting her so much, and she'd be glad of help." },
      },
      choices = {
        { text = "I'll go and see her.", next = "donova_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    donova_go = {
      big = true,
      lines = {
        { id = "dg_default", text = "Good! Mind you watch the furbolgs, though, because they're not themselves. Donova will tell you they can be helped, and maybe she's right, but they'll still bite while she's working it out." },
      },
      choices = {
        { text = "If they can be saved, I'll try to save them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they bite, they'll be put down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hills = {
      lines = {
        { id = "hi_default", text = "Because the hours I spend out there are golden, sweetie, and I mean that, golden! You learn quick reflexes, and judgement, and a sort of maturity you can't buy in Booty Bay, though, by my mother's ledger, people have tried." },
      },
      choices = {
        { text = "What's the best spot you've found?", next = "hills_spot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hills_spot = {
      lines = {
        { id = "hs_default", text = "There's a ridge above the hot springs where you can see clear to Mazthoril on a good morning, with the steam rising and the snow going pink, and you couldn't put a price on it if you tried, and I did try. Of course, the last time I was up there I forgot why I'd gone, but the view was worth it." },
      },
      choices = {
        { text = "That sounds worth the climb.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblin = {
      lines = {
        { id = "go_default", text = "I know, I know, everyone says goblins only like gold and explosions, and I like those too, sweetie, especially the explosions. But you can't find the best ore veins from inside a shop, and once I got out there, I found I liked it better than the ore." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xh_default", text = "Then you know the hunting's half of it, and the rest is being out there with nothing but the wind and your own breath. Most folk in Everlook think I'm daft for it, so it's nice to meet someone who isn't." },
      },
      choices = {
        { text = "You're not daft, Meggi.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Goblin, Everlook, the hills, sweetie, in that order, though some days I'd swap the first two and sell the third." } },
    advice = { { id = "tp_ad", text = "Take your time out there, and keep your eyes open, and write down what you meant to do before you set out. I never do, but you should." } },
    furbolgs = { { id = "tp_furb", text = "The Winterfall have gone wrong, and it's a shame, because they used to keep to themselves. Donova knows why, or she will soon." } },
    steamwheedle = { { id = "tp_sw", text = "Everlook's a cartel town, sweetie, and very safe, and very dull, and everything in it costs double, which is why I go out into the hills." } },
    everlook = { { id = "tp_everlook", text = "Everlook is the loveliest place in the world, all snow and sky and quiet, and I'd tell you all about it if I could remember where I started. Where was I?" } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw live in the tunnels to the south, and they're very particular about who comes through. I meant to tell you something important about them, but it's gone right out of my head." } },
    booty_bay = { { id = "tp_booty_bay", text = "I've never been to Booty Bay, but I hear it's very warm and very loud. I like the snow better, though I can't remember why I came up here in the first place." } },
    _none = { { id = "tp_none", text = "I knew that once, sweetie, I'm sure of it, and it was probably worth somethin'. It'll come back to me, probably when you've gone." } },
  },
}
