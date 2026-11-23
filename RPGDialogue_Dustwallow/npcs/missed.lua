-- Dustwallow, the missed folk (1 of 3): Theramore's townsfolk. The Pierce family (Mikal, Amie, Sara, Dahne),
-- the inn (Bartender Lillian, Smiling Jim, Ingo Woolybush upstairs), Brant Jasperbloom, Jensen Farran,
-- Decedra Willham on the docks, Dwane Wertle and Clerk Lendry in Foothold Citadel. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Mikal Pierce: father of the Pierce family.
P:NPC {
  key = "mikal_pierce", id = TODO_NPC("Mikal Pierce"), name = "Mikal Pierce", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "theramore" }, temper = { "steady" }, values = { "family", "loyal" },
  notices = { "soldier", "race" },
  impression = {
    first = "Mikal Pierce is a Theramore householder with a wife, two children and a firm opinion that the island is the safest place left to raise them. He kept one eye on the door the whole time, in case either child came through it running.",
    third = "{name} met Mikal Pierce, a father of two who lives in Theramore.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you, {class}. Mind your step coming in, for my son leaves his toys wherever he happens to drop them." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The children asked after you, which means they want to hear about monsters." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've a soldier's bearing, and I'm glad of it. Every sword that passes through Theramore lets me sleep a little sounder." },
    { id = "n_orc", cat = "race", when = { faction = "Horde" },
      text = "I've no quarrel with you, but I have children in this house. Say what you came to say, and say it gently." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mikal Pierce. My wife Amie and I came over the sea with Lady Proudmoore's fleet, and both our children were born inside these walls. Theramore's all the home they've ever known, and I mean to keep it standing for them." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you?" },
        { id = "h_again2", text = "Go on, while the house is quiet." },
      },
      choices = {
        { text = "What was the crossing like?", next = "crossing" },
        { text = "Is Theramore a good place for children?", next = "children" },
        { text = "A marsh seems a hard place to settle.", next = "marsh" },
        { text = "Light keep your family.", next = "END" },
      },
    },
    crossing = {
      lines = { { id = "c_default", text = "Long, and frightened, and we didn't know what we were sailing toward. We only knew what was behind us in Lordaeron, and that Lady Jaina said to follow her, and I've never once been sorry that we did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    children = {
      lines = { { id = "ch_default", text = "Inside the walls it is, and Amie and I make sure they stay inside them. Sara would follow a frog clear out to the Quagmire if we let her, and Dahne would be a step behind her with a wooden sword." } },
      choices = {
        { text = "They sound like a handful.", next = "handful" },
        { text = "Something else.", next = "BACK" },
      },
    },
    handful = {
      lines = { { id = "ha_default", text = "They're two handfuls, and I wouldn't trade either one. After what we left behind, a house that's noisy with children is the finest sound I know." } },
      choices = { { text = "Well said. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    marsh = {
      lines = { { id = "m_default", text = "It is, and I won't pretend the damp doesn't get into everything. But the marsh is a wall of its own, and since the Shady Rest burned I've been glad to have water on every side of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Lordaeron born, like most here. I work where the town needs hands, and I go home to my family at night." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask one of the guards, or up at the citadel." } },
  },
}

-- Amie Pierce: mother of the Pierce family.
P:NPC {
  key = "amie_pierce", id = TODO_NPC("Amie Pierce"), name = "Amie Pierce", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "theramore" }, temper = { "warm", "watchful" }, values = { "family" },
  notices = { "kit", "class" },
  impression = {
    first = "Amie Pierce runs the Pierce household in Theramore, and she can hold a conversation while counting two children without turning her head. She asked if I'd eaten before she asked what I wanted.",
    third = "{name} met Amie Pierce, who keeps the Pierce household in Theramore.",
  },
  greetings = {
    { id = "g_default", text = "Hello, {class}. Wipe the marsh off your boots, if you'd be so kind, for I've only just swept." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sara's been telling everyone she knows a real adventurer, so you've a reputation to keep up." },
  },
  notice = {
    { id = "n_muddy", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Goodness, look at the state of you. The smith's just up the road, and you'll want to see him before you see anything else with teeth." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! We've few enough on the island, and I'd take it kindly if you said a word for this house before you go." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Amie Pierce, and this is our home, such as it is. My husband Mikal keeps the roof on, and I keep Sara and Dahne out of the harbour, which is the harder job by a long way." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I'm listening, even if I'm looking at the children." },
        { id = "h_again2", text = "Go on, dear." },
      },
      choices = {
        { text = "Tell me about your children.", next = "children" },
        { text = "How does a family manage out here?", next = "manage" },
        { text = "The town seems uneasy lately.", next = "uneasy" },
        { text = "Good day, Mistress Pierce.", next = "END" },
      },
    },
    children = {
      lines = { { id = "c_default", text = "Sara's the elder, and small for her age, and she makes up for it by being afraid of nothing at all. Dahne follows wherever she leads, so I really only have to watch the one of them." } },
      choices = {
        { text = "What is Sara after these days?", next = "sara" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sara = {
      lines = { { id = "s_default", text = "She wants to be a guard like the ones in the training yard, and she's told Captain Thomas so to his face. He was good enough to salute her, and she's talked of nothing else since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    manage = {
      lines = { { id = "m_default", text = "With fish from the docks, flour off the ships from Menethil, and neighbours who look out for one another. We all came across the sea with nothing, so nobody here is too proud to borrow a cup of anything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    uneasy = {
      lines = { { id = "u_default", text = "It has been since the inn burned on the north road. The Hyals had a little boy not much older than my Dahne, and there isn't a mother in Theramore who hasn't thought of that at night." } },
      choices = {
        { text = "I'm sorry. It weighs on everyone.", next = "BACK", reply = "It does. Thank you for saying so, and for not telling me who to blame.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a farmer's daughter in Lordaeron, a long time ago now. Here I'm a mother, and that's work enough." } },
    _none = { { id = "tp_none", text = "I'm sure I don't know, dear. Mikal might, or the guards." } },
  },
}

-- Sara Pierce: the Pierces' daughter (a child).
P:NPC {
  key = "sara_pierce", id = TODO_NPC("Sara Pierce"), name = "Sara Pierce", gender = "female",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "theramore" }, temper = { "bold" }, values = { "adventure" },
  notices = { "class", "pet" },
  impression = {
    first = "Sara Pierce is a very small girl in Theramore with a very large opinion of her own courage. She told me she is going to be a guard, and asked whether my sword was heavy, all in one breath.",
    third = "{name} met Sara Pierce, a fearless little girl who lives in Theramore.",
  },
  greetings = {
    { id = "g_default", text = "Are you a real adventurer? You look like one, because you're all muddy and you've got scratches." },
    { id = "g_back", when = { metBefore = true }, text = "It's you! Did you fight anything since last time, and did you win?" },
  },
  notice = {
    { id = "n_guard", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've got armor like the guards have! I'm going to have armor like that when I'm big, only mine will be shinier." },
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "Is that {pet}? Does {pet} bite, and can I pat {pet} anyway?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Sara, and that's my brother Dahne, and he's littler than me even though everyone says I'm little. I'm going to be a Theramore guard, and I already know how to salute." },
      },
      again = {
        { id = "h_again", text = "Ask me something else! I know lots of things." },
        { id = "h_again2", text = "What else, what else?" },
      },
      choices = {
        { text = "Show me your salute.", next = "salute" },
        { text = "What's the scariest thing in the marsh?", next = "scary" },
        { text = "Does your brother want to be a guard too?", next = "dahne" },
        { text = "Carry on, Guard Sara.", next = "END" },
      },
    },
    salute = {
      lines = { { id = "s_default", text = "Like this, with your hand flat and your back straight! Captain Thomas saluted me back once, so that means it counts, and Mama says I'm not to do it at dinner anymore." } },
      choices = { { text = "A fine salute. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    scary = {
      lines = { { id = "sc_default", text = "The spiders, because they're bigger than our door and they've got too many eyes. Papa says there are dragons too, far away in the south, but I think he only says that so I'll stay inside the walls." } },
      choices = {
        { text = "Would you fight a spider?", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "I would if I had a sword, and I'd hit it right in all of its eyes. But I'm not allowed a sword yet, so I'd probably have to throw Dahne's boot at it and run." } },
      choices = { { text = "A sound plan. Something else.", next = "BACK" } },
    },
    dahne = {
      lines = { { id = "d_default", text = "He wants to be whatever I am, because he copies me. So I'm going to be the captain and he can be the guard who carries things." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born right here in Theramore, and I've never been anywhere else, but I'm going to." } },
    _none = { { id = "tp_none", text = "I don't know that one. Ask my Papa, he knows nearly everything." } },
  },
}

-- Dahne Pierce: the Pierces' son (a child).
P:NPC {
  key = "dahne_pierce", id = TODO_NPC("Dahne Pierce"), name = "Dahne Pierce", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "theramore" }, temper = { "shy" }, values = { "his_sister" },
  notices = { "race", "pet" },
  impression = {
    first = "Dahne Pierce is a small boy in Theramore who goes wherever his sister Sara goes and stands half a step behind her. He answered my questions by looking at her first.",
    third = "{name} met Dahne Pierce, a shy little boy who lives in Theramore.",
  },
  greetings = {
    { id = "g_default", text = "Hello. Sara says I'm allowed to talk to you, as long as you're not a murloc." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. I remembered you, and I told Sara I would." },
  },
  notice = {
    { id = "n_small", cat = "race", when = { race = { "Gnome", "Dwarf" } },
      text = "You're nearly as short as me! Are you a grown-up, though, because you've got a grown-up face?" },
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "I like {pet}. I asked for one of those and Mama said we've got a cat already, but it isn't the same." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Dahne. I've got a wooden sword that Papa made, and a sister, and she says when she's the captain I get to carry the flag." },
      },
      again = {
        { id = "h_again", text = "Um, did you want to ask something else?" },
        { id = "h_again2", text = "I'm still here." },
      },
      choices = {
        { text = "That's a fine sword. Do you practise?", next = "sword" },
        { text = "What do you like best in Theramore?", next = "best" },
        { text = "You don't have to do what Sara says.", next = "sara" },
        { text = "Goodbye, Dahne.", next = "END" },
      },
    },
    sword = {
      lines = { { id = "s_default", text = "Every day, on the fence post, because it doesn't hit back. Sara hits back, and she's got sharp elbows, so I mostly practise on the post." } },
      choices = { { text = "A wise choice. Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "b_default", text = "The docks, when the big ship comes in from far away and everybody carries boxes off it. Once a sailor gave me a shell that you can hear the sea in, even though the sea is right there already." } },
      choices = {
        { text = "Do you still have the shell?", next = "shell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shell = {
      lines = { { id = "sh_default", text = "It's under my bed, in a sock, so Sara can't find it. Please don't tell her about the sock." } },
      choices = { { text = "Your secret is safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sara = {
      lines = { { id = "sa_default", text = "I know, but she has the best ideas, and when I have ideas they're mostly about the same thing she already thought of. I don't mind carrying the flag." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm the littlest one in our house, but I'm going to be bigger than Sara one day, Papa said." } },
    _none = { { id = "tp_none", text = "I don't know. Sara might know, she's older." } },
  },
}

-- Smiling Jim (James Hyal): sits beside the inn; kept the Shady Rest before it burned.
P:NPC {
  key = "smiling_jim", id = TODO_NPC("Smiling Jim"), name = "Smiling Jim", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "theramore" }, temper = { "broken", "distant" }, values = { "his_family" },
  notices = { "class" },
  impression = {
    first = "They call him Smiling Jim, and he sits beside the Theramore inn with a smile fixed on his face and nothing at all behind it. He kept the Shady Rest until it burned with his wife and son inside, and he talks as though they were only late.",
    third = "{name} met Smiling Jim, the innkeeper of the burned Shady Rest, who sits beside the inn at Theramore.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, welcome, friend, and sit yourself down. There'll be a table free in a moment, I'm sure of it, once Lynn has cleared the plates." },
    { id = "g_back", when = { metBefore = true }, text = "I know you, don't I? You've stayed with us before, and you'll have your usual." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "A servant of the Light, at my door. You'll want a quiet room, away from the taproom, and my boy will show you up when he comes back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "They call me Smiling Jim, for I've a smile for every traveller on the north road. Mead or beer, a bed and a hot plate, and nobody's ever left my house hungry." },
      },
      again = {
        { id = "h_again", text = "What'll it be, friend? Only say the word, and I'll fetch it." },
        { id = "h_again2", text = "Yes, yes, I'm with you. I was only listening for the door." },
      },
      choices = {
        { text = "Tell me about your inn.", next = "inn" },
        { text = "Who is Lynn?", next = "lynn" },
        { text = "Jim, this isn't the Shady Rest.", next = "truth" },
        { text = "Rest easy, Jim.", next = "END" },
      },
    },
    inn = {
      lines = { { id = "i_default", text = "The Shady Rest, on the road through the marsh, with the best kitchen between Theramore and the Barrens. My brother Vincent said I was mad to build out there, and every full table since has proved him wrong." } },
      choices = {
        { text = "Your brother, Vincent?", next = "vincent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vincent = {
      lines = { { id = "v_default", text = "He's across the sea in Menethil Harbor, and he writes when he remembers to. I ought to write to him, and I will, as soon as things are a little less busy here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lynn = {
      lines = { { id = "l_default", text = "My wife, and the real head of the house, as she'll tell you herself. She's only stepped out to the back with little Jimmy, and they'll be along directly, they always are." } },
      choices = {
        { text = "I'm sure they will, Jim.", next = "BACK", reply = "Of course they will. Sit, sit, and I'll tell her we've company.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    truth = {
      lines = { { id = "t_default", text = "No, I suppose it isn't. There was a smell of smoke, and then I was walking, and I don't remember the road. You'll forgive me, friend, but I'd sooner talk about what you'll have to drink." } },
      choices = { { text = "Of course. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm an innkeeper, friend, and so was my father. My brother went to sea and I stayed by the hearth." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend. Ask Lynn when she comes in; she'll know." } },
  },
}

-- Ingo Woolybush: Explorers' League, upstairs in the Theramore inn.
P:NPC {
  key = "ingo_woolybush", id = TODO_NPC("Ingo Woolybush"), name = "Ingo Woolybush", gender = "male",
  bible = "bibles/missed.md", role = "scholar", tier = "service",
  communities = { "theramore" }, temper = { "hearty", "stubborn" }, values = { "discovery" },
  notices = { "race", "craft" },
  impression = {
    first = "Ingo Woolybush is a dwarf of the Explorers' League who has taken a room upstairs at the Theramore inn and covered every flat surface in it with maps. He talks about the marsh as other dwarves talk about a mountain nobody has dug into yet.",
    third = "{name} met Ingo Woolybush of the Explorers' League, who keeps a room above the Theramore inn.",
  },
  greetings = {
    { id = "g_default", text = "Mind the maps, {g:lad|lass}, they're in an order even if ye cannae see it! Now then, what can the Explorers' League do for ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Ach, it's yerself again. Step over the big chart there, the ink's not dry." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "By my beard, a proper dwarf in this bog! Sit down and tell me the news from Ironforge, and whether the ale there is still better than what they pour below." },
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "That's a miner's pick on yer pack, and well used. Ye'll know good stone when ye see it, then, which is more than I can say for anyone else on this island." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ingo Woolybush, of the Explorers' League, at yer service. The League sent me west to see what's under all this mud, and I'll tell ye, there's a good deal more than the humans think." },
      },
      again = {
        { id = "h_again", text = "What else are ye after? I've maps for most of it." },
        { id = "h_again2", text = "Aye, go on, I can talk and draw." },
      },
      choices = {
        { text = "What's under the mud?", next = "under" },
        { text = "Why work from an inn?", next = "inn" },
        { text = "A swamp is a strange place for a dwarf.", next = "swamp" },
        { text = "I'll mind the maps. Farewell.", next = "END" },
      },
    },
    under = {
      lines = { { id = "u_default", text = "Bones, for a start, great dragon bones down in the Wyrmbog that are older than any kingdom. And ruins where the ogres used to live, which were somebody else's ruins before that, if I'm reading the stonework right." } },
      choices = {
        { text = "Have you seen them yourself?", next = "seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "From a distance, aye, and a healthy one. The bones have living dragonkin walking among them, and I'm an explorer, not a fool, so I draw what I can see from the high ground and I come home for supper." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    inn = {
      lines = { { id = "i_default", text = "Because it's dry, {g:lad|lass}, and that's a rare thing in Dustwallow. Paper rots in a tent out here in a week, and Lillian downstairs keeps a decent keg, so I've no cause to complain." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    swamp = {
      lines = { { id = "sw_default", text = "It is, and my boots will never forgive me for it. But the League goes where the old secrets are, and nae dwarf ever found anything worth finding by staying where it was comfortable." } },
      choices = { { text = "Spoken like an explorer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Explorers' League, and proud of it. I've dug in Loch Modan and the Badlands, and this is the wettest hole yet." } },
    _none = { { id = "tp_none", text = "That's not on any o' my maps, I'm afraid. Ask the humans; it's their island." } },
  },
}

-- Jensen Farran: bowyer.
P:NPC {
  key = "jensen_farran", id = TODO_NPC("Jensen Farran"), name = "Jensen Farran", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "plain" }, values = { "craft" },
  notices = { "class", "pet" },
  impression = {
    first = "Jensen Farran makes and sells bows on Theramore Isle, and the guard's archers buy from nobody else. He speaks plainly and sights along every arrow before it leaves his hand.",
    third = "{name} met Jensen Farran, the bowyer of Theramore.",
  },
  greetings = {
    { id = "g_default", text = "Good day, {class}. If you're after a bow, tell me what you mean to shoot at, because a raptor and a murloc want different arrows." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more shafts? The marsh eats arrows, I've always said so." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and one who looks after the string, I see. We'll get on well, for I've little patience with those who don't." },
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "That's a fine animal at your heel. Keep {pet} out of the fletching, if you would, for feathers bring out the worst in them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jensen Farran, bowyer. I string for the Theramore Guard and for any hunter with sense enough to come by, and I've not had a bow come back broken that wasn't the owner's fault." },
      },
      again = {
        { id = "h_again", text = "What else did you want to know?" },
        { id = "h_again2", text = "Go on, I'm only fletching." },
      },
      choices = {
        { text = "What do the guard's archers shoot at?", next = "guard" },
        { text = "How does a bow fare in this damp?", next = "damp" },
        { text = "I hunt. What would you carry out there?", next = "hunter", when = { class = "HUNTER" } },
        { text = "What do you think of Lady Proudmoore?", next = "kt_jaina" },
        { text = "Straight shooting, Jensen.", next = "END" },
      },
    },
    guard = {
      lines = { { id = "g_default", text = "Straw targets, mostly, and thank the Light for that. Guard Lasiter's at the butts from morning to dusk, and he goes through more of my arrows than the rest of the garrison put together." } },
      choices = {
        { text = "Is he any good?", next = "lasiter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lasiter = {
      lines = { { id = "l_default", text = "He's the best shot on the island, and he'd be better still if he believed it. I've told him a man who never misses the straw ought to stop apologising to it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    damp = {
      lines = { { id = "d_default", text = "Badly, unless you wax the string and keep the wood oiled, and I'll tell every customer so until I'm hoarse. This air will take the spring out of good yew in a season if you let it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "h2_default", text = "Something with a heavy draw, and twice the arrows you think you need. The raptors north of the road don't go down to one shaft, and the crocolisks hardly notice the first two." } },
      choices = { { text = "Twice the arrows, then. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    kt_jaina = {
      big = true,
      lines = { { id = "ktj_default", text = "I made bows for the Admiral's marines for twenty years, and I made them for his daughter's guard after he fell, so you can guess how often I've chewed on that. She chose the right side, I think, but I'll never understand how she could watch her own father go down and still call it the right side." } },
      choices = {
        { text = "Watch a father die? She should have stopped it.", next = "BACK", reply = "Aye, that's the part I can't get past either. A daughter ought to have found some other way.", fx = { align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "She chose peace over a war he couldn't win.", next = "BACK", reply = "Maybe so, and the marsh is quieter for it. I'll keep stringing her guards' bows and keep my thoughts to myself.", fx = { align = { light = 1 }, opinion = { jaina = "admire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    jaina = { { id = "tp_ktjaina", text = "The Lady? She chose the right side, I suppose, though I'll never understand how she bore the cost of it." } },
    background = { { id = "tp_bg", text = "I learned the trade in Kul Tiras, making bows for ships' marines. I came over with the fleet and never found a reason to stop." } },
    _none = { { id = "tp_none", text = "Couldn't say. I know wood and string, and that's the length of it." } },
  },
}

-- Decedra Willham: on the Theramore docks, directing travellers to the ship.
P:NPC {
  key = "decedra_willham", id = TODO_NPC("Decedra Willham"), name = "Decedra Willham", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "theramore" }, temper = { "brisk", "cheerful" }, values = { "order" },
  notices = { "travel", "race" },
  impression = {
    first = "Decedra Willham stands on the Theramore docks and tells every traveller where the ship is going before they can ask. She knows the tides and the sailing times by heart, and I doubt anyone has missed a boat on her watch.",
    third = "{name} met Decedra Willham, who directs travellers on the docks of Theramore.",
  },
  greetings = {
    { id = "g_default", text = "Good day, {class}! This is the pier for Menethil Harbor, and if that's not where you're bound, you're standing in the wrong place." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Coming or going this time?" },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Gnome" } },
      text = "Bound for home, I'd guess? From Menethil it's the road through the Wetlands and up to Loch Modan, and you'll want dry socks for all of it." },
    { id = "n_mount", cat = "travel", when = { mounted = true },
      text = "You'll need to lead that animal aboard on foot, if you please. The captain's very particular about his deck." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Decedra Willham, and I see that folk get on the right ship and off at the right end. The vessel from this pier crosses to Menethil Harbor in the Wetlands, and she's the only regular passage east we have." },
      },
      again = {
        { id = "h_again", text = "Anything else before she sails?" },
        { id = "h_again2", text = "Quick as you like, I've an eye on the tide." },
      },
      choices = {
        { text = "What's the crossing like?", next = "crossing" },
        { text = "What comes in on the ship?", next = "cargo" },
        { text = "You must see everyone who comes and goes.", next = "everyone" },
        { text = "Do the Kul Tiras folk here love Lady Proudmoore?", next = "kt_jaina" },
        { text = "Thank you. Fair tides.", next = "END" },
      },
    },
    crossing = {
      lines = { { id = "c_default", text = "Long, but easy enough in fair weather, around the cape and across the Great Sea. Keep to the middle of the deck if your stomach's unsure, and don't lean over the rail to look at the sharks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cargo = {
      lines = { { id = "ca_default", text = "Flour, iron and letters, in that order of weight and the opposite order of importance. Half the people on this island have family in the east, and you should see the pier on the days a mail sack comes ashore." } },
      choices = {
        { text = "Do letters go the other way too?", next = "letters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters = {
      lines = { { id = "l_default", text = "Every sailing, and I carry the sack aboard myself. There's a man in Menethil who writes to his brother here every month, and it's been hard lately, knowing what the answers can't say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    everyone = {
      lines = { { id = "e_default", text = "I do, and I remember most of them. More swords and fewer families are coming ashore these days, which tells you what the east thinks is happening out here." } },
      choices = { { text = "And what do you think?", next = "BACK", reply = "I think Lady Proudmoore has kept us safe this long, and I'll keep meeting the ship until she says otherwise." } },
    },
    kt_jaina = {
      big = true,
      lines = { { id = "ktj_default", text = "Love her? Half the old quay families still won't say her name, and the other half say it too often, as if to prove something. My own father served the Admiral, and he took the first ship home to Boralus once he heard the Lady had stood with the orcs, so I'll let you guess which half I was raised in." } },
      choices = {
        { text = "Your father was right to go home.", next = "BACK", reply = "He thought so, and he writes every season to say so. I stayed for the sea air, and for nothing else.", fx = { align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "She saved this town. Your father was wrong.", next = "BACK", reply = "Perhaps, but you'd not say it to him twice. I'll grant you she keeps the ships sailing on time.", fx = { align = { light = 1 }, opinion = { jaina = "admire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    jaina = { { id = "tp_ktjaina", text = "My father went home to Boralus when the Lady sided with the orcs. I stayed, and I've not decided yet which of us was the fool." } },
    background = { { id = "tp_bg", text = "I grew up on the quays of Kul Tiras, so a pier is the nearest thing I have to a home street." } },
    _none = { { id = "tp_none", text = "That's not come in on any ship of mine. Ask up in the town." } },
  },
}

-- Dwane Wertle: chef in Foothold Citadel.
P:NPC {
  key = "dwane_wertle", id = TODO_NPC("Dwane Wertle"), name = "Dwane Wertle", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "bossy", "generous" }, values = { "a_full_plate" },
  notices = { "craft", "soldier" },
  impression = {
    first = "Dwane Wertle is the chef of Foothold Citadel, and she runs her kitchen the way the captains wish they could run the garrison. She handed me a bowl and an order to eat it in the same motion.",
    third = "{name} met Dwane Wertle, the chef who feeds the garrison at Foothold Citadel.",
  },
  greetings = {
    { id = "g_default", text = "In or out, {class}, but not in the doorway, for I've hot pots coming through. If you're hungry, say so, and I'll see to it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, so the food can't have been that bad. Sit where you sat before." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You're eyeing my pots like someone who knows what's in them. Go on then, taste it, and tell me what it wants, though the answer had better not be salt." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Another fighter to feed. You lot eat like wolves and say thank you like wolves, but I'll not see you go out hungry." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dwane Wertle, chef to the citadel, and before you ask, yes, it's my name and my father wanted a boy. I feed the Theramore Guard three times a day, and not a man of them has gone on watch with an empty belly." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I stir." },
        { id = "h_again2", text = "Go on, and pass me that ladle." },
      },
      choices = {
        { text = "What does the garrison eat?", next = "eat" },
        { text = "Do you know Morgan Stern at the inn?", next = "morgan" },
        { text = "Feeding soldiers must be thankless.", next = "thankless" },
        { text = "What do the old fleet hands think of Lady Proudmoore?", next = "kt_jaina" },
        { text = "I'll get out of your doorway.", next = "END" },
      },
    },
    eat = {
      lines = { { id = "e_default", text = "Fish, mostly, because the sea's free and the ships are slow. Clam chowder when the lads bring me clams, and bread every morning, and a stew on feast days that I'll not give anyone the making of." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    morgan = {
      lines = { { id = "m_default", text = "Know him? I've been arguing with him since the day the inn opened. He cooks for travellers who'll eat anything strange, and I cook for soldiers who want it hot and plenty, and each of us thinks the other has the easy job." } },
      choices = {
        { text = "Who's the better cook?", next = "better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    better = {
      lines = { { id = "b_default", text = "He's the cleverer, and I'll say it once and never again. But I've fed three hundred on a morning when the supply ship was late, and I'd like to see him try that with his tortoise soup." } },
      choices = { { text = "I won't tell him you said so. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    thankless = {
      lines = { { id = "t_default", text = "It would be, if I listened for thanks. I watch the bowls instead, and they come back empty, and Captain Thomas once sent a recruit to ask what was in the chowder, which is as good as a medal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kt_jaina = {
      big = true,
      lines = { { id = "ktj_default", text = "I cooked for the Admiral's own crew, and I've fed his daughter's soldiers every day since he died on this island, and there's not a night I don't think about that. She let the orcs and those trolls cut down her own father, and then she asked us to set the table for the Warchief's envoys." } },
      choices = {
        { text = "That's betrayal, plain and simple.", next = "BACK", reply = "It is, and I've said it to my pots every night for years. They're the only ones who don't argue.", fx = { align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "The Admiral attacked allies. She had to choose.", next = "BACK", reply = "Allies, he calls them. Well, maybe you're right, but I'll not be the one to tell the old crew so.", fx = { align = { light = 1 }, opinion = { jaina = "admire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    jaina = { { id = "tp_ktjaina", text = "I set the Lady's table and say nothing, which is more than her father's crew would do." } },
    background = { { id = "tp_bg", text = "I cooked on a ship of the Kul Tiras fleet all the way across the sea. A kitchen that doesn't roll is a luxury I've never got used to." } },
    _none = { { id = "tp_none", text = "Not my kitchen, not my business. Ask one of the officers." } },
  },
}

-- Clerk Lendry (Classic name; later "Paymaster Lendry"): Foothold Citadel. Ends "James Hyal" from Vincent Hyal.
P:NPC {
  key = "clerk_lendry", id = TODO_NPC("Clerk Lendry"), name = "Clerk Lendry", gender = "male",
  bible = "bibles/missed.md", role = "clerk", tier = "quest",
  communities = { "theramore" }, temper = { "precise", "decent" }, values = { "records", "duty" },
  notices = { "class", "purse" },
  impression = {
    first = "Clerk Lendry keeps the rolls and records of Theramore in Foothold Citadel, and there's no soul on the island whose name he hasn't written down at least once. He is a careful, dry man, and some of what's in his ledgers plainly troubles him.",
    third = "{name} met Clerk Lendry, who keeps Theramore's records in Foothold Citadel.",
  },
  greetings = {
    { id = "g_default", text = "Yes, {class}? State your business plainly, if you would, and I'll find the right ledger for it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. I've your last visit noted, so we needn't begin from the beginning." },
    { id = "g_hyal", when = { questActive = TODO_QUEST("James Hyal") }, text = "You've a look of someone carrying a question from across the sea. Sit down, and tell me who's asking." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've been reading my ledger upside down while I spoke, and rather well. I'd thank you to ask for what you want; the answer is usually yes." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Then you'll understand the Lady's fondness for good records, for she reads every one of mine and corrects my sums." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Clerk Lendry, keeper of the rolls. Births, deaths, enlistments, deeds and debts all pass over this desk, and if a thing happened in Theramore and isn't in my ledgers, I'd like to be told of it." },
        { id = "h_quest", when = { questActive = TODO_QUEST("James Hyal") },
          text = "Vincent Hyal sent you, from Menethil? Then he doesn't know, and I'm sorry to be the one who must write it. His brother's inn is ash, and there are two graves where James's family should be." },
        { id = "h_done", when = { questDone = TODO_QUEST("James Hyal") },
          text = "I've written to Vincent Hyal, as plainly and as kindly as I could manage. It's the hardest entry I've made since we landed, and I've made a good many." },
      },
      again = {
        { id = "h_again", text = "Was there another matter for the record?" },
        { id = "h_again2", text = "Go on. I'll note it as we speak." },
      },
      choices = {
        { text = "What happened to James Hyal?", next = "hyal", when = { any = { { questActive = TODO_QUEST("James Hyal") }, { questDone = TODO_QUEST("James Hyal") } } } },
        { text = "What do you keep in all these ledgers?", next = "ledgers" },
        { text = "You must know everyone on the island.", next = "everyone" },
        { text = "Do the records say who burned the inn?", next = "inn" },
        { text = "That's all, Clerk.", next = "END" },
      },
    },
    hyal = {
      big = true,
      lines = { { id = "hy_default", text = "He kept the Shady Rest on the north road, and he was away from it the night it burned. His wife Lynn and their boy were not, and James walked into Theramore the next day and has hardly spoken sense since." } },
      choices = {
        { text = "Where is he now?", next = "hyal_now" },
        { text = "What will you tell his brother?", next = "hyal_brother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyal_now = {
      lines = { { id = "hn_default", text = "He sits beside the inn here, greeting guests who aren't there, and the town still calls him Smiling Jim. Lillian sees that he eats, and nobody has the heart to correct him." } },
      choices = {
        { text = "Should I speak with him?", next = "hyal_speak" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyal_speak = {
      lines = { { id = "hs_default", text = "If you do, let him pour you his imaginary ale and thank him for it. Doctor VanHowzen says a hard word might bring him back or might break what's left, and none of us is willing to find out which." } },
      choices = { { text = "I'll be gentle. Something else.", next = "BACK" } },
    },
    hyal_brother = {
      lines = { { id = "hb_default", text = "The truth, since he asked for it, and since a ledger that lies is worth nothing. But I shall tell him too that his brother is among people who knew him in better days, and that we haven't forgotten what he was." } },
      choices = { { text = "That's the right letter to write.", next = "BACK", fx = { affinity = 1 } } },
    },
    ledgers = {
      lines = { { id = "l_default", text = "Everything a town needs to remember about itself. Who came on which ship, who's owed pay, who holds which house, and lately a column I never wanted, for guardsmen who've left their posts without leave." } },
      choices = {
        { text = "The deserters. How many?", next = "deserters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deserters = {
      lines = { { id = "d_default", text = "More than Captain Vimes would like spoken aloud, so I'll not give you the number. Most were Kul Tiras marines before they were Theramore guards, and I think some of them never quite changed their coats." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    everyone = {
      lines = { { id = "e_default", text = "By name, at least, and by what they owe. I entered the Pierce children on the day each was born, and I've a page waiting for every recruit Captain Andrews and Captain Thomas are shouting at in the yard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    inn = {
      lines = { { id = "i_default", text = "They say what was found and where, and nothing more, because that's all anyone knows. Captain Vimes has asked me to keep my guesses out of the margins, and I'd advise you to do the same until he's finished." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a harbour clerk in Lordaeron. I kept the fleet's manifest on the crossing, and I've simply never been told to stop." } },
    _none = { { id = "tp_none", text = "I've no entry for that, I'm afraid. If you learn the answer, do come back so I can write it down." } },
  },
}
