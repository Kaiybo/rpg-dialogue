-- Elwynn folk a roster scan found missing, part one: the six children who march out of Goldshire's
-- northernmost house (Aaron, Cameron, Dana, John, Jose, Lisa), Bo's friends Joshua and Mark, Markus in
-- Clara Charles's garden, Merissa Stilwell and Dane Winslow at Northshire, Donni Anthania and her cats,
-- and Jason Mathers on the Crystal Lake pier. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Aaron: one of the six marching children; keeps the rules and counts the steps.
P:NPC {
  key = "aaron", id = TODO_NPC("Aaron"), name = "Aaron", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "goldshire" },
  temper = { "serious" }, values = { "order" }, notices = { "soldier" },
  impression = {
    first = "Aaron marches at the front corner of a ring of Goldshire children and counts his steps under his breath. He told me the rules of the game twice, in case I'd missed one.",
    third = "{name} met Aaron, one of the six children who march together out of Goldshire.",
  },
  greetings = {
    { id = "g_default", text = "You have to walk beside us if you want to talk, because we aren't allowed to stop until Cameron says so." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! I've counted four thousand steps since you last came by, and I only lost my place once." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You march like a real soldier, with your shoulders back. Lisa never does, and I keep telling her so." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Aaron, and I keep the front corner. We're the King's guard, you see, and Cameron is the king, so he walks in the middle and the rest of us walk all around him." } },
      again = {
        { id = "h_again", text = "What else did you want to know? I can talk and count at the same time, mostly." },
        { id = "h_again2", text = "Go on, but keep walking, please." },
      },
      choices = {
        { text = "What are the rules of this game?", next = "rules" },
        { text = "Where does the guard march to?", next = "march" },
        { text = "You take your post very seriously.", next = "serious" },
        { text = "March on, guardsman.", next = "END" },
      },
    },
    rules = {
      lines = { { id = "r_default", text = "Nobody leaves their corner, nobody walks in front of the king, and nobody stops unless the king stops first. I made up the third rule myself, after John sat down in the road and we lost him for a whole hour." } },
      choices = {
        { text = "What happens to a guard who breaks one?", next = "breaks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    breaks = {
      lines = { { id = "b_default", text = "He has to walk at the back for a whole day, where the dust is, and that's usually Jose because he keeps stopping to pick things up. He doesn't seem to mind it, which rather spoils the punishment." } },
      choices = { { text = "A fair sentence. Something else.", next = "BACK" } },
    },
    march = {
      lines = { { id = "m_default", text = "We go up to Northshire to see the abbey, and then all the way to the gates of Stormwind, and then home to Goldshire before supper. It's eleven thousand steps if nobody dawdles, and somebody always dawdles." } },
      choices = { { text = "That's a long patrol. Something else.", next = "BACK" } },
    },
    serious = {
      lines = { { id = "s_default", text = "Somebody has to, because Dana wants to be king and Jose wants to look at beetles. When I'm grown I'm going to join the real guard at Goldshire, and Marshal Dughan won't have to tell me anything twice." } },
      choices = { { text = "He'll be lucky to have you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in the big house at the north end of Goldshire, upstairs with the others. We march nearly every day." } },
    _none = { { id = "tp_none", text = "I don't know about that, and I've lost count now, so I'll have to start again from the last tree." } },
  },
}

-- Cameron: the child in the middle of the ring; the "king" of the game.
P:NPC {
  key = "cameron", id = TODO_NPC("Cameron"), name = "Cameron", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "goldshire" },
  temper = { "bossy" }, values = { "proud" }, notices = { "status" },
  impression = {
    first = "Cameron walks in the middle of five other Goldshire children as though the road had been laid for him. He granted me permission to speak before I'd asked for it.",
    third = "{name} met Cameron, the boy who walks in the middle of Goldshire's marching children.",
  },
  greetings = {
    { id = "g_default", text = "You may approach the king, but you mustn't step inside the ring, because the guards get upset." },
    { id = "g_back", when = { metBefore = true }, text = "I remember you! You were very polite last time, so you may approach the king again." },
  },
  notice = {
    { id = "n_mage", cat = "status", when = { class = "MAGE" },
      text = "A wizard! Every king has a court wizard, and I haven't got one yet. Would you like to be mine, just as far as the bridge?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Cameron, and I'm the king today, the same as every day. The others are my royal guard, and they walk all around me so nothing can get at me, not even wolves." } },
      again = {
        { id = "h_again", text = "The king will hear one more question, and then we really must get on." },
        { id = "h_again2", text = "What else do you want to ask the king?" },
      },
      choices = {
        { text = "How did you come to be king?", next = "king" },
        { text = "Where is Your Majesty bound?", next = "bound" },
        { text = "Stormwind already has a king, you know.", next = "anduin" },
        { text = "By your leave, Majesty.", next = "END" },
      },
    },
    king = {
      lines = { { id = "k_default", text = "I thought of the game, so I got to choose, and I chose king. Dana says we should take turns, but a real king doesn't take turns, and I told her so." } },
      choices = {
        { text = "What did Dana say to that?", next = "dana" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dana = {
      lines = { { id = "d_default", text = "She said a real king doesn't need five friends to keep the wolves off, which wasn't very loyal of her. I let her keep her corner anyway, because she's the best of us at spotting things in the trees." } },
      choices = { { text = "A merciful king. Something else.", next = "BACK" } },
    },
    bound = {
      lines = { { id = "b_default", text = "To Northshire, to inspect the abbey, and then to Stormwind to inspect the gates. The guards at the gate salute us sometimes, and once one of them bowed, though Aaron says he was only picking up his glove." } },
      choices = { { text = "I'm sure it was a bow. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    anduin = {
      lines = { { id = "a_default", text = "I know, and he's a boy the same as me, which is why I thought of it. If he ever wants to come and march with us he can be king and I'll be the marshal, and I've already decided that." } },
      choices = { { text = "That's generous of you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live upstairs in the big house in Goldshire with the others. I'm in the middle because it was my game first." } },
    _none = { { id = "tp_none", text = "The king doesn't know about that. You could ask Lisa, because she knows everybody's business on this road." } },
  },
}

-- Dana: one of the six; sharp-eyed, and thinks she'd make a better king.
P:NPC {
  key = "dana_goldshire", id = TODO_NPC("Dana"), name = "Dana", gender = "female",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "goldshire" },
  temper = { "bold" }, values = { "brave" }, notices = { "wonder" },
  impression = {
    first = "Dana keeps her corner of the children's ring with her eyes on the trees, and she saw me long before the others did. She thinks the game needs a new king, and she has a candidate in mind.",
    third = "{name} met Dana, the sharpest-eyed of the six children who march out of Goldshire.",
  },
  greetings = {
    { id = "g_default", text = "I saw you coming from all the way back at the bend, before anybody else did. I always see things first." },
    { id = "g_back", when = { metBefore = true }, text = "I spotted you first again! Cameron didn't even look up." },
  },
  notice = {
    { id = "n_hunter", cat = "wonder", when = { class = "HUNTER" },
      text = "You're a hunter, aren't you? I can tell by the way you look at the trees and not the road, because that's how I do it too." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Dana, and I'm the lookout, though Cameron calls it being a guard. I watch the left side of the road for wolves and kobolds, and I haven't missed one yet." } },
      again = {
        { id = "h_again", text = "What else? I can listen and keep watch at the same time." },
        { id = "h_again2", text = "Ask me quickly, because there's something moving by that stump." },
      },
      choices = {
        { text = "What have you spotted on the road?", next = "spotted" },
        { text = "Cameron says he's the king.", next = "king" },
        { text = "You've good eyes for a lookout.", next = "eyes" },
        { text = "Keep watching, Dana.", next = "END" },
      },
    },
    spotted = {
      lines = { { id = "s_default", text = "Mostly wolves, and they stay back in the trees if we all keep together. Once I saw a kobold with a candle on its head near the road to Northshire, and it ran away before I could show anyone." } },
      choices = {
        { text = "Did the others believe you?", next = "believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    believe = {
      lines = { { id = "b_default", text = "Lisa did, and John said I made it up, but then the guard at the abbey told us there's a whole mine full of them. John walked a great deal closer to the middle after that." } },
      choices = { { text = "Then you were right. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    king = {
      lines = { { id = "k_default", text = "He's king because he said so first, and that isn't how you get to be king. I'd be a better one, because I'd let everybody have a turn in the middle, even Jose." } },
      choices = { { text = "Queen Dana has a ring to it. Something else.", next = "BACK" } },
    },
    eyes = {
      lines = { { id = "e_default", text = "Thank you! When we get to Stormwind I look up for the gryphons coming in over the walls, and I've counted nine in one afternoon. I want to ride one when I'm big enough to hold on." } },
      choices = { { text = "Hold on tight when you do. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in Goldshire with the others, in the big house at the north end. I'm the lookout." } },
    _none = { { id = "tp_none", text = "I haven't seen anything like that, and I'd have seen it if it came down this road." } },
  },
}

-- John: one of the six; footsore, hungry and sure the others walk too far.
P:NPC {
  key = "john_goldshire", id = TODO_NPC("John"), name = "John", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "goldshire" },
  temper = { "grumbling" }, values = { "comfort" }, notices = { "food" },
  impression = {
    first = "John trails half a step behind his corner of the children's ring and sighs whenever the road tilts uphill. He asked whether I had anything to eat before he asked my name.",
    third = "{name} met John, the most footsore of the six children who march out of Goldshire.",
  },
  greetings = {
    { id = "g_default", text = "Have you come from Goldshire? Is it far behind us? It feels like it's ever so far behind us." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. We're still walking, in case you wondered, because we're always still walking." },
  },
  notice = {
    { id = "n_cook", cat = "food", when = { profession = "Cooking" },
      text = "You smell like a kitchen, in a good way. I don't suppose you're carrying a pie about, are you?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm John, and my feet hurt. We've walked to Northshire and now we're walking to Stormwind, and nobody will tell me why we can't just play in the square like Bo and his friends do." } },
      again = {
        { id = "h_again", text = "Was there something else? Ask slowly, so I've a reason to walk slowly." },
        { id = "h_again2", text = "Go on, I don't mind talking, since it's better than counting steps." },
      },
      choices = {
        { text = "Why not stay behind in Goldshire?", next = "stay" },
        { text = "What's the best part of the walk?", next = "best" },
        { text = "You look ready to drop, lad.", next = "drop" },
        { text = "Keep your chin up, John.", next = "END" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "I tried that once, and it was worse, because there was nobody to play with and I kept wondering what they were seeing without me. So I go, and I complain, and Aaron says that's allowed as long as I keep my corner." } },
      choices = { { text = "A sensible bargain. Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "b_default", text = "Coming home, when you can see the inn and smell the supper. Sometimes Innkeeper Farley's cooking drifts right across the square, and then even Cameron walks faster." } },
      choices = {
        { text = "What's your favourite supper?", next = "supper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supper = {
      lines = { { id = "su_default", text = "Boar ribs, the sticky kind, though we only get them when a hunter's had a good day at the Stonefield farm. I think about them from about the second mile onward, if I'm honest." } },
      choices = { { text = "Now I'm hungry too. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    drop = {
      lines = { { id = "d_default", text = "I am, but I shan't, because the last time I sat down in the road Aaron made a rule about it. It's named after me, he says, which is the only thing I've ever had named after me." } },
      choices = { { text = "That's fame of a sort. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in Goldshire, upstairs in the big house, when I'm allowed to stay in it. Mostly I'm out here walking." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, and I'm too tired to guess." } },
  },
}

-- Jose: one of the six; laughs easily and fills his pockets along the road.
P:NPC {
  key = "jose_goldshire", id = TODO_NPC("Jose"), name = "Jose", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "goldshire" },
  temper = { "merry" }, values = { "curious" }, notices = { "wonder" },
  impression = {
    first = "Jose giggles his way along the road with his pockets bulging, and darts out of the children's ring whenever something shiny catches his eye. He showed me a beetle as if it were a crown jewel.",
    third = "{name} met Jose, the laughing collector among the six children who march out of Goldshire.",
  },
  greetings = {
    { id = "g_default", text = "Hello! Do you want to see what I found? It's in this pocket, or it might be in the other one." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I've found three new things since you went, and one of them is still alive." },
  },
  notice = {
    { id = "n_herb", cat = "wonder", when = { profession = "Herbalism" },
      text = "You pick things up off the ground as well! I can tell by your fingers, because mine go green just the same." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Jose! I'm supposed to be guarding the king, but there's such a lot on the ground between here and Stormwind, and nobody else ever looks down." } },
      again = {
        { id = "h_again", text = "What else? I've got more pockets if you want to see more things." },
        { id = "h_again2", text = "Ask me another one, I like questions!" },
      },
      choices = {
        { text = "What have you found today?", next = "found" },
        { text = "Aaron says you walk at the back.", next = "back" },
        { text = "You laugh a good deal, Jose.", next = "laugh" },
        { text = "Mind the beetles, Jose.", next = "END" },
      },
    },
    found = {
      lines = { { id = "f_default", text = "A feather, a bent nail, a river stone with a stripe right round it, and a beetle that's green on top and purple underneath. The beetle's the best one, but he keeps walking out of my pocket." } },
      choices = {
        { text = "Where do you keep it all?", next = "keep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = { { id = "k_default", text = "In a box under my bed, upstairs in the big house. Lisa says it smells, and it does a little, but that's only because of the mushroom, and I'm not throwing the mushroom away." } },
      choices = { { text = "Every collection has one mushroom. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    back = {
      lines = { { id = "b_default", text = "That's my punishment for leaving my corner, only it's the best place to be! You can see what everyone else kicked up and didn't notice, and nobody tells you to hurry." } },
      choices = { { text = "Don't tell Aaron that. Something else.", next = "BACK" } },
    },
    laugh = {
      lines = { { id = "l_default", text = "Everything's funny if you look at it properly, like John's face when the road goes uphill. He sighs like a great big bellows, and then I laugh, and then he sighs at me for laughing." } },
      choices = { { text = "Poor John. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in Goldshire with the others, and I've got the bed by the window, and the box under it." } },
    _none = { { id = "tp_none", text = "I don't know that one! Is it something you can find on the ground?" } },
  },
}

-- Lisa: one of the six; knows every face on the road and what they're about.
P:NPC {
  key = "lisa_goldshire", id = TODO_NPC("Lisa"), name = "Lisa", gender = "female",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "goldshire" },
  temper = { "chatty" }, values = { "friendly" }, notices = { "stranger" },
  impression = {
    first = "Lisa waves at everyone the marching children pass, and most of them wave back by name. She told me more about the Goldshire road in a minute than a guard would in an hour.",
    third = "{name} met Lisa, who knows every face on the road among the six children who march out of Goldshire.",
  },
  greetings = {
    { id = "g_default", text = "Hello! I haven't seen you on this road before, and I know nearly everybody on this road." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I told Guard Thomas about you, and he said he thinks he knows who I mean." },
  },
  notice = {
    { id = "n_elf", cat = "stranger", when = { race = "NightElf" },
      text = "You're one of the elves from over the sea! Your ears are even longer than people said, and I think they're lovely." },
    { id = "n_dwarf", cat = "stranger", when = { race = { "Dwarf", "Gnome" } },
      text = "You've come all the way from the mountains, haven't you? Smith Argus says the best hammers come from there." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Lisa. We march to Northshire and Stormwind and back, and I say hello to everybody on the way, because it's rude not to and because they tell you things." } },
      again = {
        { id = "h_again", text = "What else would you like to know? I know lots." },
        { id = "h_again2", text = "Go on, ask me about anybody." },
      },
      choices = {
        { text = "Who do you meet on the road?", next = "who" },
        { text = "What have people told you lately?", next = "told" },
        { text = "You must be the friendly one.", next = "friendly" },
        { text = "Goodbye, Lisa.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Guard Thomas at the east bridge when we go that far, and the wagon man by the crossroads, and the brothers at the abbey. Brother Neals gave us each a grape once, and Cameron said it was tribute." } },
      choices = {
        { text = "Who's the nicest of them?", next = "nicest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nicest = {
      lines = { { id = "n_default", text = "The guards at the Stormwind gate, because they pretend we're a real patrol and ask for our report. I always give it, and I always say the road is safe, even when Dana's seen a wolf." } },
      choices = { { text = "A good report. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    told = {
      lines = { { id = "t_default", text = "That there are bandits in red masks in the woods, and that a great big gnoll called Hogger lives down past the Stonefield farm. We aren't allowed to march that way, and I don't want to, whatever Dana says." } },
      choices = { { text = "Stay well away from him. Something else.", next = "BACK" } },
    },
    friendly = {
      lines = { { id = "f_default", text = "Somebody has to be, because Aaron's counting and Cameron's being grand and John's cross about his feet. If nobody waved, people would think we were a very strange lot of children." } },
      choices = { { text = "Nobody could think that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in the big house in Goldshire with the others, and I walk on the right-hand corner at the back." } },
    _none = { { id = "tp_none", text = "Nobody's told me about that yet, but I'll ask at the gate when we get there." } },
  },
}

-- Joshua: plays behind the Goldshire smithy with Bo and Mark; the doubter of the three.
P:NPC {
  key = "joshua_goldshire", id = TODO_NPC("Joshua"), name = "Joshua", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "goldshire" },
  temper = { "doubting" }, values = { "clever" }, notices = { "kit" },
  impression = {
    first = "Joshua plays behind Goldshire's forge with two other boys and believes nothing until he's seen it. He looked me over for some time before deciding I was probably a real adventurer.",
    third = "{name} met Joshua, a Goldshire boy who plays behind the smithy with Bo and Mark.",
  },
  greetings = {
    { id = "g_default", text = "Are you a real adventurer, or do you only dress like one? Bo says every one of you is real, but Bo believes anything." },
    { id = "g_back", when = { metBefore = true }, text = "It's you. I've decided you're real, so you needn't prove it again." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { minLevel = 20 },
      text = "That's proper gear, that is, with real dents in it. You didn't get those in Elwynn." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Joshua. Me and Bo and Mark play back here behind the forge, where it's warm and where Smith Argus can only see us if he turns right round." } },
      again = {
        { id = "h_again", text = "What else? I've still got questions for you after, mind." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "What do you three play at?", next = "play" },
        { text = "Bo told me you didn't believe him.", next = "believe" },
        { text = "I could show you something real.", next = "show", when = { class = { "MAGE", "WARLOCK", "PRIEST", "DRUID", "SHAMAN" } } },
        { text = "Stay out of the smith's way.", next = "END" },
      },
    },
    play = {
      lines = { { id = "p_default", text = "Guards and Defias, mostly, and nobody wants to be the Defias, so we draw straws. Mark's got a red kerchief his mother doesn't know about, and whoever loses has to wear it." } },
      choices = {
        { text = "Who wins, the guards or the Defias?", next = "wins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wins = {
      lines = { { id = "w_default", text = "The guards are supposed to, but Mark's too quick when he's the bandit, and he gets clean away to the pond every time. I've told Bo we need a fourth so we can surround him properly." } },
      choices = { { text = "Sound tactics. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    believe = {
      lines = { { id = "b_default", text = "Well, he says a lot of things. He said he saw a bear that talked, and he said Hogger was as tall as the inn, and you can't believe all of it, can you?" } },
      choices = { { text = "Some of it might be true. Something else.", next = "BACK" } },
    },
    show = {
      lines = { { id = "s_default", text = "Real magic? Go on, then, but do it small, because Argus threw a bucket of water at the last person who made sparks near his coal. I'll believe it when I've seen it." } },
      choices = { { text = "Small it is. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've always lived in Goldshire. We play behind the smithy most days, till somebody's mother calls." } },
    _none = { { id = "tp_none", text = "I don't know that, and I'm not going to pretend I do, like some people." } },
  },
}

-- Mark: plays behind the Goldshire smithy with Bo and Joshua; quick, cheeky, always in trouble with Argus.
P:NPC {
  key = "mark_goldshire", id = TODO_NPC("Mark"), name = "Mark", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = { "goldshire" },
  temper = { "cheeky" }, values = { "fun" }, notices = { "wonder" },
  impression = {
    first = "Mark is the fastest of the three boys behind Goldshire's forge, and by the smith's shouting he is also the one who gets blamed. He grinned the whole time we spoke, as if he'd just got away with something.",
    third = "{name} met Mark, the quick, cheeky Goldshire boy who plays behind the smithy with Bo and Joshua.",
  },
  greetings = {
    { id = "g_default", text = "I didn't do it! Oh, you're not Argus. Hello, then." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Is Argus looking this way? Stand just there, would you, so he can't see me." },
  },
  notice = {
    { id = "n_pet", cat = "wonder", when = { class = "HUNTER" },
      text = "Do you have an animal that follows you about? I had a lamb once for a whole afternoon, till Argus found it by the forge." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Mark! I'm the fastest runner in Goldshire, faster than Bo and loads faster than Joshua, and I can get from the forge to the pond before Argus has finished saying my name." } },
      again = {
        { id = "h_again", text = "What else? Quick, before somebody's it." },
        { id = "h_again2", text = "Go on, ask me!" },
      },
      choices = {
        { text = "Why does the smith shout at you?", next = "argus" },
        { text = "Bo says you laugh at his sword practice.", next = "bo" },
        { text = "I heard something about a lamb.", next = "lamb" },
        { text = "Run along, Mark.", next = "END" },
      },
    },
    argus = {
      lines = { { id = "a_default", text = "Because I'm always the nearest one when something falls over. It's only that I'm the quickest, so I get there first, and then it looks like it was me." } },
      choices = {
        { text = "And was it you?", next = "wasit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wasit = {
      lines = { { id = "w_default", text = "Sometimes, but not the time with the horseshoes, and that's the one he's still cross about. That was Joshua, and I never told, so you mustn't either." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    bo = {
      lines = { { id = "b_default", text = "Only because he holds his stick like he's sweeping the step! He's getting better, though, and I'd never say so to him, because then he'd stop trying to show me." } },
      choices = { { text = "That's kinder than it sounds. Something else.", next = "BACK" } },
    },
    lamb = {
      lines = { { id = "l_default", text = "It followed me from the Maclure fence, honest, and I only wanted it to get warm by the forge. Argus said no more animals near the coals ever again, so now it's a rule, and it's my fault it's a rule." } },
      choices = { { text = "A warm lamb is a fair cause. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in Goldshire, and I play behind the smithy with Bo and Joshua. I'm the fast one." } },
    _none = { { id = "tp_none", text = "Don't know! Ask Joshua, he likes knowing things." } },
  },
}

-- Markus: the boy in Clara Charles's garden, digging for treasure in the cabbages.
P:NPC {
  key = "markus", id = TODO_NPC("Markus"), name = "Markus", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service", communities = {},
  temper = { "eager" }, values = { "brave" }, notices = { "kit" },
  impression = {
    first = "Markus digs in the garden outside Clara Charles's farmhouse with a wooden spoon and enormous purpose. He is quite certain there is treasure under the cabbages, and he asked what I'd found under mine.",
    third = "{name} met Markus, the boy who plays in the garden of Clara Charles's farm.",
  },
  greetings = {
    { id = "g_default", text = "Mind the cabbages! Well, mind the ones that are left, because I've had to move a few." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! I played at being you all week, and I beat four gnolls, but they were fence posts really." },
  },
  notice = {
    { id = "n_miner", cat = "kit", when = { profession = "Mining" },
      text = "Is that a real pick? I've only got a spoon, and it bends when I hit a stone." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Markus, and this is my dig. There's treasure under here somewhere, because farms always have treasure buried on them, and I've only got this row and the next one left to try." } },
      again = {
        { id = "h_again", text = "Did you want something else? I can dig and talk." },
        { id = "h_again2", text = "Ask me another, and then I've got to get back to it." },
      },
      choices = {
        { text = "What have you dug up so far?", next = "dug" },
        { text = "What does Clara say about the cabbages?", next = "clara" },
        { text = "What will you do with the treasure?", next = "treasure" },
        { text = "Good digging, Markus.", next = "END" },
      },
    },
    dug = {
      lines = { { id = "d_default", text = "A button, some worms, half a horseshoe and a stone that looks a bit like a tooth. I'm keeping the tooth one, in case it's off a dragon." } },
      choices = {
        { text = "It might well be a dragon's.", next = "dragon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragon = {
      lines = { { id = "dr_default", text = "That's what I said! Clara says it's only flint, but she didn't look at it properly, and she's never seen a dragon either, so she can't know." } },
      choices = { { text = "Keep it somewhere safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    clara = {
      lines = { { id = "c_default", text = "She says I'm to put every one back the way I found it, with the roots down. I do try, but they don't stand up as well afterwards, and I think the cabbages are just being difficult." } },
      choices = { { text = "Cabbages are like that. Something else.", next = "BACK" } },
    },
    treasure = {
      lines = { { id = "t_default", text = "Buy a real sword and a horse from the stables at Eastvale, and go and be an adventurer like you. I'd leave some for Clara as well, for a new fence, because the gnolls keep looking at ours." } },
      choices = { { text = "That's a good plan. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live here on the farm with Clara. The garden's mine to play in, as long as I'm careful, and I'm nearly always careful." } },
    _none = { { id = "tp_none", text = "I don't know. Is it buried? I could look for it after this row." } },
  },
}

-- Merissa Stilwell: greets new arrivals at Northshire Abbey.
P:NPC {
  key = "merissa_stilwell", id = TODO_NPC("Merissa Stilwell"), name = "Merissa Stilwell", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service", communities = { "northshire" },
  temper = { "warm" }, values = { "kind", "hopeful" }, notices = { "newcomer" },
  impression = {
    first = "Merissa Stilwell stands near Northshire Abbey with a smile for every recruit who comes up the road, and she remembers the ones who look frightened. She made the valley feel a good deal less like a muster ground.",
    third = "{name} met Merissa Stilwell, who welcomes new arrivals at Northshire.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Northshire, {class}! You've picked a fine morning to arrive, kobolds notwithstanding." },
    { id = "g_back", when = { metBefore = true }, text = "It's good to see you again, {name}. The valley's been quieter since you started lending a hand." },
    { id = "g_voucher", when = { questActive = TODO_QUEST("Welcome!") }, text = "Ah, you've a voucher with you, I see! Let me have a look at it, and welcome to Northshire." },
  },
  notice = {
    { id = "n_new", cat = "newcomer", when = { maxLevel = 5 },
      text = "You've the look of someone on their first day, and there's no shame in it. Everyone the abbey ever sent out started just where you're standing." },
    { id = "n_old", cat = "newcomer", when = { minLevel = 30 },
      text = "You're a long way past needing a welcome, by the look of you, but you shall have one all the same." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Merissa Stilwell. The brothers train the recruits and Marshal McBride sets them to work, and I see to it that somebody says a kind word to them first." } },
      again = {
        { id = "h_again", text = "Is there anything else I can tell you about the valley?" },
        { id = "h_again2", text = "Ask away, {class}; I've the time." },
      },
      choices = {
        { text = "Why does Northshire need a welcomer?", next = "why" },
        { text = "What should a newcomer know?", next = "know" },
        { text = "I've seen the name Stilwell before.", next = "name", when = { minLevel = 10 } },
        { text = "Thank you for the welcome.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because most of them are farm lads and shop girls who've never held a blade, and the first thing they hear is a marshal shouting about vermin. A friendly face costs nothing, and I think it sends them out a little braver." } },
      choices = {
        { text = "Do they all come back?", next = "comeback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    comeback = {
      lines = { { id = "cb_default", text = "Not all of them, and I won't pretend otherwise. The ones who do come back stop here to tell me where they've been, and that's the part of my day I'd not trade for anything." } },
      choices = { { text = "Then I'll stop by with my own news.", next = "BACK", reply = "I'd like that very much, and I shall hold you to it.", fx = { affinity = 1 } } },
    },
    know = {
      lines = { { id = "k_default", text = "That Marshal McBride is in the abbey hall and has work for anyone willing, and that Brother Danil sells bread enough to see you through it. Keep clear of the vineyards to the east until you've found your feet, because the Defias have made themselves at home there." } },
      choices = { { text = "Sound advice. Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "n_default", text = "I shouldn't wonder, for there are Stilwells scattered right across the kingdom, and a stubborn lot we are. I'm the one who stayed in Elwynn, where the trees are green and the worst of our troubles carries a candle on its head." } },
      choices = { { text = "A wise choice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm an Elwynn woman, and I greet those who come to the abbey to begin. It's small work, and I'm fond of it." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond me, dear. One of the brothers in the library might know." } },
  },
}
