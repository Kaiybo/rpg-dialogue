-- Elwynn folk a roster scan found missing, part two: Eastvale Logging Camp (Eldrin the tailor and the
-- camp's children Eric, Jay, Kevin, Kyle and Solomon), Morley Eberlein in the Tower of Azora, and the
-- three merchants in Westbrook Garrison's store room (Quartermaster Hicks, Quartermaster Hudson,
-- Veldan Lightfoot). Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Eric: an Eastvale child who watches the loggers and wants an axe of his own.
P:NPC {
  key = "eric_eastvale", id = TODO_NPC("Eric"), name = "Eric", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "eastvale" },
  temper = { "eager" }, values = { "strong" }, notices = { "kit" },
  impression = {
    first = "Eric hangs about the Eastvale Logging Camp with a stick over his shoulder like a woodsman's axe. He knows which tree every logger is cutting and how long it ought to take.",
    third = "{name} met Eric, a boy at the Eastvale Logging Camp who means to be a logger.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Are you here to help with the wolves? Everybody who comes with a sword is here about the wolves." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Did you get any wolves? How many?" },
  },
  notice = {
    { id = "n_axe", cat = "kit", when = { class = { "WARRIOR", "SHAMAN" } },
      text = "Is that a real axe? The loggers won't let me hold theirs, not even the little one for kindling." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Eric. I'm going to be a logger when I'm big, and I already know how to tell which way a tree's going to fall, mostly." } },
      again = {
        { id = "h_again", text = "What else? I know loads about the camp." },
        { id = "h_again2", text = "Ask me another one!" },
      },
      choices = {
        { text = "How do you tell which way it falls?", next = "fall" },
        { text = "Tell me about the wolves.", next = "wolves" },
        { text = "Who else plays around the camp?", next = "others" },
        { text = "Keep clear of the saws, Eric.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "f_default", text = "You look where the heavy branches are, and where they cut the notch, and then you stand on the other side. I only got it wrong once, and Supervisor Raelen shouted so loud the horses jumped." } },
      choices = {
        { text = "What did the Supervisor say?", next = "raelen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raelen = {
      lines = { { id = "r_default", text = "That I'm to stay behind the woodpile till I'm taller than it. I measure myself against it every morning, and I've only got about two logs to go." } },
      choices = { { text = "Two logs isn't long. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wolves = {
      lines = { { id = "w_default", text = "They come right up to the edge of the cutting now, the big grey ones, and the bears as well. The men won't go out to the far trees without a guard, so there's less chopping to watch, and it's boring." } },
      choices = { { text = "I'll see what I can do. Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "o_default", text = "There's Jay, who's my friend, and Solomon, who's older and thinks he's in charge of us. Kevin and Kyle have to stay in the house, so we shout to them through the window." } },
      choices = { { text = "A good crew. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live at the logging camp. It's the best place, because there's always something falling over." } },
    _none = { { id = "tp_none", text = "I don't know. Is it to do with trees? I only really know trees." } },
  },
}

-- Jay: an Eastvale child who would rather be at the stables than the woodpile.
P:NPC {
  key = "jay_eastvale", id = TODO_NPC("Jay"), name = "Jay", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "eastvale" },
  temper = { "gentle" }, values = { "kind" }, notices = { "mount" },
  impression = {
    first = "Jay drifts from the woodpile to the stable fence at the Eastvale Logging Camp whenever nobody is watching him. He knows the horses by name and spoke of them more warmly than of most people.",
    third = "{name} met Jay, a boy at the Eastvale Logging Camp who loves the stable horses.",
  },
  greetings = {
    { id = "g_default", text = "Hello. Did you come on a horse? I didn't hear one, and I always listen for them." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. The chestnut mare had her shoes done since you were here, and she didn't like it one bit." },
  },
  notice = {
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Oh, you've brought one! May I stroke his nose? I'll go slowly, so he knows I'm coming." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Jay. Eric likes watching the trees come down, but I'd sooner be over at the Hunters' stables, because the horses don't shout and they remember you." } },
      again = {
        { id = "h_again", text = "Was there anything else? I don't mind." },
        { id = "h_again2", text = "You can ask me about the horses, if you like." },
      },
      choices = {
        { text = "Which horse is your favourite?", next = "favourite" },
        { text = "Do the Hunters let you help?", next = "help" },
        { text = "You're a quiet one for a logging camp.", next = "quiet" },
        { text = "Goodbye, Jay.", next = "END" },
      },
    },
    favourite = {
      lines = { { id = "f_default", text = "The chestnut mare, because she puts her whole head over the fence when she sees me. Katie says she does that to everybody with an apple, but I haven't always got an apple, and she still does it." } },
      choices = {
        { text = "Then she likes you for yourself.", next = "herself" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herself = {
      lines = { { id = "hs_default", text = "That's what I think as well. I'm going to buy her when I'm grown, if nobody else has, and I count the people who come to look at her and hope they all choose the pinto." } },
      choices = { { text = "I'll choose the pinto, then. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    help = {
      lines = { { id = "hp_default", text = "Randal lets me carry the water and fill the hay nets, as long as I stay out from behind them. He says a horse can't see what's behind it, so that's where it kicks, and I've never forgotten." } },
      choices = { { text = "Good sense. Something else.", next = "BACK" } },
    },
    quiet = {
      lines = { { id = "q_default", text = "It's loud enough here without me adding to it, with the saws and Supervisor Raelen and Eric. If you're quiet the animals come nearer, and I saw a fawn at the edge of the trees once, before the wolves got so many." } },
      choices = { { text = "That's worth being quiet for. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live at the camp, and I go to the stables every day I'm let." } },
    _none = { { id = "tp_none", text = "I don't know about that, sorry. Katie Hunter might, since she talks to all the travellers." } },
  },
}

-- Kevin: one of two boys kept indoors at Eastvale; restless, and the plotter of the pair.
P:NPC {
  key = "kevin_eastvale", id = TODO_NPC("Kevin"), name = "Kevin", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "eastvale" },
  temper = { "restless" }, values = { "daring" }, notices = { "kit" },
  impression = {
    first = "Kevin paces the floor of a house at the Eastvale Logging Camp like a small prisoner planning his escape. He is kept in because of the wolves, and he has worked out several ways around that.",
    third = "{name} met Kevin, a restless boy kept indoors at the Eastvale Logging Camp.",
  },
  greetings = {
    { id = "g_default", text = "Did you come in from outside? What's it like out there today? We aren't allowed." },
    { id = "g_back", when = { metBefore = true }, text = "It's you! Are the wolves gone yet? Please say the wolves are gone." },
  },
  notice = {
    { id = "n_rogue", cat = "kit", when = { class = "ROGUE" },
      text = "You walk ever so quietly. Could you show me how, for getting past doors and things?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Kevin, and that's Kyle. We have to stay in the house till the wolves stop coming up to the camp, and it's been days and days, and I've counted every board in this floor." } },
      again = {
        { id = "h_again", text = "What else? I've got all day, and so has Kyle." },
        { id = "h_again2", text = "Ask me something, anything, it's so dull in here." },
      },
      choices = {
        { text = "How many boards are there?", next = "boards" },
        { text = "Have you tried to slip out?", next = "slip" },
        { text = "The wolves are real enough, Kevin.", next = "real" },
        { text = "Hold fast in there, Kevin.", next = "END" },
      },
    },
    boards = {
      lines = { { id = "b_default", text = "A hundred and twelve downstairs, and the fourth one from the door squeaks. Kyle says it's a hundred and thirteen, but he counted the doorstep, and a doorstep isn't a board." } },
      choices = { { text = "I side with you on doorsteps. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    slip = {
      lines = { { id = "s_default", text = "Twice by the door and once by the window, and I got as far as the woodpile the second time. Eric saw me and waved, which gave it all away, so now I've a new plan that doesn't have Eric in it." } },
      choices = {
        { text = "What's the new plan?", next = "plan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan = {
      lines = { { id = "p_default", text = "I can't tell you all of it, but it's got a blanket and the squeaky board in it, and Kyle has to cough at the right time. He keeps coughing too early, so we're still practising." } },
      choices = { { text = "Practice makes perfect. Something else.", next = "BACK" } },
    },
    real = {
      lines = { { id = "r_default", text = "I know they are, because I heard them last night, right up by the horses. I'm not scared, I only want to see one from a long way off, with somebody big standing next to me." } },
      choices = { { text = "That's the right way to see one. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live here at the camp, in this house, and lately only in this house." } },
    _none = { { id = "tp_none", text = "I don't know. I haven't been outside in ages, so I don't know anything new." } },
  },
}

-- Kyle: the other boy kept indoors at Eastvale; the careful one, who has made his peace with it.
P:NPC {
  key = "kyle_eastvale", id = TODO_NPC("Kyle"), name = "Kyle", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "eastvale" },
  temper = { "careful" }, values = { "sensible" }, notices = { "wonder" },
  impression = {
    first = "Kyle walks the same slow circuit of a house at the Eastvale Logging Camp and seems to have made a game of it. He is the careful one of the two boys shut in there, and keeps an eye on the other.",
    third = "{name} met Kyle, a careful boy kept indoors at the Eastvale Logging Camp.",
  },
  greetings = {
    { id = "g_default", text = "Hello. Wipe your feet, please, because we get the blame for the mud whoever brings it in." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. Kevin's still here, in case you wondered, and so that's one more day I've managed." },
  },
  notice = {
    { id = "n_healer", cat = "wonder", when = { class = { "PRIEST", "PALADIN" } },
      text = "Are you one of the ones who can mend people with the Light? One of the loggers got bitten, and a brother came from the abbey and did that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Kyle. I walk round and round the house, since there's nowhere else to walk, and I make sure Kevin doesn't climb out of anything while I'm at it." } },
      again = {
        { id = "h_again", text = "Did you want to know something else? I'll keep walking, if you don't mind." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Don't you mind being shut in?", next = "mind" },
        { text = "Kevin tells me there's a plan.", next = "plan" },
        { text = "What do you see from the window?", next = "window" },
        { text = "Look after him, Kyle.", next = "END" },
      },
    },
    mind = {
      lines = { { id = "m_default", text = "A bit, but I'd mind being eaten more. I saw what a wolf did to one of the cart horses' legs, and after that I thought the house was a very good house." } },
      choices = { { text = "Sensible lad. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    plan = {
      lines = { { id = "p_default", text = "There's always a plan, and my part is to cough. I cough too early on purpose, every time, and he hasn't worked that out yet." } },
      choices = {
        { text = "That's rather clever of you.", next = "clever" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clever = {
      lines = { { id = "c_default", text = "Please don't tell him, because he'd only think of a plan without coughing in it. When the wolves are gone I'll cough at the right time and he can have his adventure, as far as the woodpile." } },
      choices = { { text = "Not a word. Something else.", next = "BACK" } },
    },
    window = {
      lines = { { id = "w_default", text = "The sawmill and the stable fence, and Marshal Haggard's porch if you lean. Eric and Jay come and shout up what's happening, and Jay tells it properly but Eric makes every wolf twice as big." } },
      choices = { { text = "Trust Jay's count, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live at the logging camp, and for now I live indoors. It isn't so bad once you've got a route." } },
    _none = { { id = "tp_none", text = "I don't know that. You'd do better to ask a grown-up outside." } },
  },
}

-- Solomon: the eldest of the Eastvale children, self-appointed watchman of the camp.
P:NPC {
  key = "solomon_eastvale", id = TODO_NPC("Solomon"), name = "Solomon", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "eastvale" },
  temper = { "solemn" }, values = { "dutiful" }, notices = { "soldier" },
  impression = {
    first = "Solomon stands about the Eastvale Logging Camp with his arms folded, as near to Marshal Haggard's manner as a boy can get. He considers himself responsible for the younger ones, and for me too while I was in sight.",
    third = "{name} met Solomon, the eldest of the children at the Eastvale Logging Camp.",
  },
  greetings = {
    { id = "g_default", text = "Good day. If you've business in the camp, Marshal Haggard's house is the one with the porch, and I can show you." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, then. Nothing's got past me since you left, if you were wondering." },
  },
  notice = {
    { id = "n_guard", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You're a proper fighter. Guard Thomas says a watchman's first duty is to notice things, and I noticed you from the bridge road." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Solomon, and I keep watch here. Nobody asked me to, but the guards are stretched thin and somebody has to mind the little ones." } },
      again = {
        { id = "h_again", text = "Is there anything else? I'm on watch, but I can spare a moment." },
        { id = "h_again2", text = "Go on, I'm listening, and watching the tree line too." },
      },
      choices = {
        { text = "What does your watch cover?", next = "watch" },
        { text = "Who are the little ones?", next = "little" },
        { text = "You sound like the Marshal.", next = "marshal" },
        { text = "Carry on, watchman.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "From the sawmill to the stable fence, and the road as far as I can see it. If a wolf comes out of the trees I'm to shout for a guard and not do anything brave, and I've promised that." } },
      choices = {
        { text = "Have you had to shout yet?", next = "shout" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shout = {
      lines = { { id = "s_default", text = "Once, at dusk, when a grey one came for the horses. The guard was there before I'd finished shouting, and afterwards Marshal Haggard nodded at me, which he doesn't do for anybody." } },
      choices = { { text = "You earned that nod. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    little = {
      lines = { { id = "l_default", text = "Eric and Jay, who never stay where they're put, and Kevin and Kyle, who are shut in the house and oughtn't to get out. Kevin tries most days, so I check the window on every round." } },
      choices = { { text = "They're in good hands. Something else.", next = "BACK" } },
    },
    marshal = {
      lines = { { id = "m_default", text = "Do I? I've been practising. I'm going to join the Stormwind guard as soon as they'll have me, and I'd like to be posted here, since I already know where everything is." } },
      choices = { { text = "They'd be wise to take you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've lived at the logging camp all my life. I'm the eldest of us, so I look out for the rest." } },
    _none = { { id = "tp_none", text = "I can't say. You should ask the Marshal, and I can take you to him." } },
  },
}

-- Morley Eberlein: clothier on the fourth floor of the Tower of Azora.
P:NPC {
  key = "morley_eberlein", id = TODO_NPC("Morley Eberlein"), name = "Morley Eberlein", title = "Clothier", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service", communities = {},
  temper = { "fussy", "proud" }, values = { "craft", "appearances" }, notices = { "kit" },
  impression = {
    first = "Morley Eberlein keeps a clothier's shop four floors up the Tower of Azora, among mages who notice nothing and gnomes who singe everything. He dresses Theocritus and takes it as a personal wound when the old mage spills something.",
    third = "{name} met Morley Eberlein, the clothier in the Tower of Azora.",
  },
  greetings = {
    { id = "g_default", text = "You've climbed four flights for a clothier, so you must be in earnest. Do come in, and don't touch the grey bolt." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've returned, and wearing the same thing, I see. We must talk about that." },
  },
  notice = {
    { id = "n_cloth", cat = "kit", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Now, here's someone who lives in cloth and ought to know better. That hem has been dragged through three counties." },
    { id = "n_plate", cat = "kit", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You clank, friend, and I sell nothing that clanks. Mind the mannequin on your way round." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Morley Eberlein, clothier to the Tower of Azora. I keep Theocritus and his household decently covered, which is harder than guarding the place, because a robe has more enemies here than the tower does." } },
      again = {
        { id = "h_again", text = "Was there something further? I've a cuff to finish." },
        { id = "h_again2", text = "Do go on. I can pin and listen." },
      },
      choices = {
        { text = "What enemies does a robe have here?", next = "enemies" },
        { text = "What's it like dressing Theocritus?", next = "theo" },
        { text = "What do you sell?", next = "sell" },
        { text = "He called my robes dreadful.", next = "dreadful", when = { class = "MAGE" } },
        { text = "Good day, Master Eberlein.", next = "END" },
      },
    },
    enemies = {
      lines = { { id = "e_default", text = "Ink, candle wax, whatever the gnomes are brewing downstairs, and sparks from experiments nobody admits to. I've mended a burn the exact shape of a gnome's hand, and I've never had a satisfactory account of it." } },
      choices = {
        { text = "The gnomes don't own up?", next = "gnomes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes = {
      lines = { { id = "gn_default", text = "They apologise at great length and with diagrams, and then they do it again. I'm fond of them, you understand, but I have begun cutting their sleeves an inch short, purely to keep the cloth out of the flames." } },
      choices = { { text = "A tailor's revenge. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    theo = {
      lines = { { id = "t_default", text = "He stands still for a fitting about as well as a cat, and he has opinions about everyone's dress but his own. Still, he keeps a clothier in his tower when most mages keep only dust, and I shan't hear a word against him." } },
      choices = { { text = "Loyal to a fault. Something else.", next = "BACK" } },
    },
    sell = {
      lines = { { id = "s_default", text = "Knitted goods, plain and sound: tunics, trousers, gloves, belts and sandals, such as an apprentice can afford and a master needn't be ashamed of. The finer work I keep for the household, since they ruin it faster than I can make it." } },
      choices = { { text = "Sound and plain suits me. Something else.", next = "BACK" } },
    },
    dreadful = {
      lines = { { id = "d_default", text = "He was being kind, I fear. The cut is passable, but that colour was a mistake before it faded, and no robe should be asked to survive what yours has plainly survived." } },
      choices = { { text = "It has been a hard season. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a clothier by trade, and the tower's by appointment. I came up these stairs years ago and have seldom seen cause to go down them." } },
    _none = { { id = "tp_none", text = "I measure and I cut, friend, and beyond that I know little. Ask Theocritus, on the days he's answering questions." } },
  },
}
