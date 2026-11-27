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
    first = "He keeps the best part of his news back on purpose.",
    third = "{name} met Harlo Wigglesworth, a nosy and friendly goblin of Everlook who passes on what he hears.",
  },

  greetings = {
    { id = "g_default", text = "Hey there, pal, hey! You look like somebody who wants to hear who's been stealin' the inn's pickled herring, and I've got it on good authority, which is to say mine." },
    { id = "g_winna", when = { questActive = TODO_QUEST("A Strange One") }, text = "Did you meet Winna at Bloodvenom Post yet? No, no, don't tell me, chum, I want to imagine your face, and I'm savin' the story for a rainy day." },
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
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Steamwheedle runs it, pal, and everybody pays the Cartel's prices with a smile because there's nowhere else to buy a blanket for a hundred miles. Between you an' me, what do you make of us goblins runnin' the place?" },
      },
      choices = {
        { text = "A neutral town in a frozen wilderness. That's good work.", next = "op_r1", fx = { affinity = 1, align = { order = 1 }, opinion = { steamwheedle = "respect" } } },
        { text = "Thieves with a ledger. Everyone here pays too much.", next = "op_r2", fx = { affinity = -1, align = { order = -1 }, trait = { skeptical = 1 }, opinion = { steamwheedle = "distrust" } } },
        { text = "Useful. Everyone needs somewhere both sides can trade.", next = "op_r3", fx = { trait = { practical = 1 }, opinion = { steamwheedle = "useful" } } },
        { text = "I'll keep my thoughts and my coin.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Ha! I'm gonna quote you to Vizzie, and she's gonna pretend she don't care, and then she's gonna repeat it to everybody." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Too much compared to what, friend, freezin' to death or walkin' back to Felwood? Everything's got a price, and up here the price includes the walk you didn't take." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Now that's a businessman talkin'. Useful is what keeps the lights on, and the lights up here are very expensive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dd_yeti = {
      lines = {
        { id = "dd_yeti_1",
          text = "Frightened? She went straight up like a rocket with a short fuse, and I've seen a few of those, believe me. Then she came down and started taking notes on the thing's joints, because she's a goblin first and a victim second." },
        { id = "dd_yeti_2",
          text = "Now she wants one of her own to scare Legacki back, and I've got a bet running on who blows up first. You want in? The odds are terrible, which is the fun of it." },
      },
      choices = {
        { text = "Put me down for Legacki. She started it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll pass. Somebody's going to get hurt.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Harlo.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_yeti", tags = { "news" }, when = { questDone = TODO_QUEST("Are We There, Yeti?") },
          text = "Pal, I heard about the yeti! Legacki's mechanical monster walked right up to Umi's door, and the scream they heard from the bank was worth the price of the whole season, and word is you were the one holding the controls." },
        { id = "o_dark_iron_hate", tags = { "news" }, when = { gossip = { topic = "dark_iron", stance = "hate" } },
          text = "Word round the inn is you told the Dark Iron smith what you think of his clan. Brave or daft, pal, I'm still decidin' which." },
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
        { text = "Was Umi really that frightened by the yeti?", next = "dd_yeti", when = { questDone = TODO_QUEST("Are We There, Yeti?") } },
        { text = "What did you see in Felwood?", next = "felwood" },
        { text = "Any news from out in the wilds?", next = "camp" },
        { text = "You seem to hear everything that goes on.", next = "ears" },
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
        { text = "Someone has to study the poison. Good for her.", next = "BACK", reply = "That's what I told my cousin, pal, because somebody's got to know what's in that muck before it crawls up here. Better a curious scholar than a surprised town.", fx = { align = { order = -1 } } },
        { text = "Some things shouldn't be meddled with.", next = "BACK", reply = "You sound like my mother, and she was right about most things, except the rocket. Still, I'd keep clear of anyone who smiles at a poisoned forest like that.", fx = { align = { order = 1 } } },
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
        { text = "Secrets should cost something. Charge for them.", next = "BACK", reply = "Don't you start, pal, I get enough of that at family dinners. The trouble is, once I put a price on a rumour, everybody stops tellin' me the good ones.", fx = { align = { honor = -1 } } },
        { text = "Good news should be free. Keep giving it.", next = "BACK", reply = "See, you get it! Gossip's like a fire in the inn, chum, because it's only worth anything if everybody gets to stand around it and warm up.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    everlook = {
      lines = {
        { id = "ev_default", text = "Umi's building something furry again, and Legacki's going to scream about it, which is the best news I've had all week, pal. And the furbolgs out at Winterfall have gone nasty, which Donova Snowden at the hot springs can tell you more about than me, and for once I mean that." },
      },
      choices = {
        { text = "Who really runs Everlook, Harlo?", next = "op_ask" },
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
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are a strange bunch, but they keep their word, and in Everlook that makes them nearly unique. Go see for yourself, if you can get past the guards." } },
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
    first = "She forgets the important thing she meant to say halfway through.",
    third = "{name} met Meggi Peppinrocker, an Everlook goblin who loves the wilds and loses the thread of every story.",
  },

  greetings = {
    { id = "g_default", text = "There's trouble in Winterspring, you know, sweetie! Oh, and hello, and you didn't come to buy anything, did you, because I've left the shop somewhere." },
    { id = "g_donova", when = { questActive = TODO_QUEST("Trouble in Winterspring!") }, text = "Donova Snowden, at the hot springs, that's who you want! I knew I'd remember." },
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
    dd_seril = {
      lines = {
        { id = "dd_seril_1",
          text = "He did! Well, it was more of a twitch, but on Seril that's a smile, and I'd know because I've been watching him scowl at the snow for two whole winters. He's got a story, that one, and it starts and ends in Stratholme, though he'll never tell it to a goblin." },
        { id = "dd_seril_2",
          text = "My family says I should leave the man alone and mind the shop. I say the hills are the shop, and the people in them are the merchandise, in a nice way, you understand." },
      },
      choices = {
        { text = "Leave Seril be. Some men need their silence.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep asking. People need someone to pry them open.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Meggi.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_seril", when = { questDone = TODO_QUEST("Corruption") },
          text = "Sweetie, Seril the swordsmith smiled at me this morning, and he never smiles, so I asked around. They say you got his stolen plans back from the Black Guard in Stratholme, which is a terrible place, and now what was I saying?" },
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
        { text = "You were saying Seril smiled at you.", next = "dd_seril", when = { questDone = TODO_QUEST("Corruption") } },
        { text = "What trouble, Meggi?", next = "trouble" },
        { text = "Why do you love the wilds so much?", next = "hills" },
        { text = "I never thought I'd meet a goblin who likes the outdoors.", next = "goblin" },
        { text = "I know the wilds too. I'm a hunter.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Does anyone in Everlook share your love of the wilds?", next = "w9_share" },
        { text = "I'll let you get on, Meggi.", next = "END" },
      },
    },

    w9_share = {
      lines = { { id = "w9_share_d", text = "Not a soul, sweetie, not one! The rest of them think \"outdoors\" is the walk between the inn and the bank, and Gogo laughs every time I come back with pine needles in my hair. Azzleby understands a little, since he likes animals, though he prefers them indoors." } },
      choices = {
        { text = "Doesn't that get lonely?", next = "w9_share2" },
        { text = "Maybe you could take Gogo with you.", next = "w9_share2" },
        { text = "Something else.", next = "BACK" },
      },
    },

    w9_share2 = {
      lines = { { id = "w9_share2_d", text = "Gogo, in the hills! She'd want a carriage and a hot drink and someone to carry her coat, sweetie, and I love her for it, but no. I like it lonely out there, because the hills don't interrupt me, which is more than I can say for anybody in town." } },
      choices = {
        { text = "I won't interrupt, then.", next = "BACK", reply = "Oh, you're no trouble, sweetie. Now, where was I?" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = {
        { id = "t_default", text = "The furbolgs, the Winterfall, out east by the hot springs. Something's got into them, and they've gone savage, and Donova Snowden's out there watching them and getting more worried by the day." },
      },
      choices = {
        { text = "You keep mentioning Donova Snowden.", next = "donova" },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    donova = {
      lines = {
        { id = "d_default", text = "A dwarf, and a clever one, who studies the springs and the beasts around them. She's got a kind heart, so the furbolgs going bad is hurting her terribly, and she'd be glad of help." },
      },
      choices = {
        { text = "I'll go and see her.", next = "donova_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    donova_go = {
      big = true,
      lines = {
        { id = "dg_default", text = "Good! Watch the furbolgs, though, because they're not themselves. Donova will tell you they can be helped, and maybe she's right, but they'll still bite while she's working it out." },
      },
      choices = {
        { text = "If they can be saved, I'll try to save them.", next = "BACK", reply = "That's the spirit, and Donova will be glad of you, because she says each one saved is a cub that grows up remembering. Just keep your hands where their teeth can't reach.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they bite, they'll be put down.", next = "BACK", reply = "Hmph, well, you're not wrong that they bite, and I've got the scar to prove it. Only be sure it's really needed before you do it, because Donova will ask.", fx = { align = { light = -1 } } },
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
    steamwheedle = { { id = "tp_sw", text = "Everlook's a cartel town, sweetie, and very safe, and very dull, and everything in it costs double, so I go out into the hills." } },
    everlook = { { id = "tp_everlook", text = "Everlook is the loveliest place in the world, all snow and sky and quiet, and I'd tell you all about it if I could remember where I started. Where was I?" } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw live in the tunnels to the south, and they're very particular about who comes through. I meant to tell you something important about them, but it's gone right out of my head." } },
    booty_bay = { { id = "tp_booty_bay", text = "I've never been to Booty Bay, but I hear it's very warm and very loud. I like the snow better, though I can't remember why I came up here in the first place." } },
    _none = { { id = "tp_none", text = "I knew that once, sweetie, I'm sure of it, and it was probably worth somethin'. It'll come back to me, probably when you've gone." } },
  },
}
