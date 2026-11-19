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

-- Dane Winslow: demon trainer in the Northshire graveyard, beside Drusilla La Salle.
P:NPC {
  key = "dane_winslow", id = TODO_NPC("Dane Winslow"), name = "Dane Winslow", title = "Demon Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "service", communities = { "northshire" },
  temper = { "dry", "tidy" }, values = { "discretion", "craft" }, notices = { "craft" },
  impression = {
    first = "Dane Winslow stands among the graves beside Northshire Abbey, close to Drusilla La Salle and well out of the brothers' sight. He speaks of demons the way a kennel master speaks of hounds, and he has no business with anyone who doesn't keep one.",
    third = "{name} met Dane Winslow, who trains warlocks' demons in the graveyard at Northshire.",
  },
  greetings = {
    { id = "g_default", when = { ["not"] = { class = "WARLOCK" } }, text = "You've wandered into the wrong corner of the abbey grounds, {class}. There's nothing here that you would care to buy." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Come closer, and keep your voice down. The brothers tolerate us best when they can pretend we aren't here." },
    { id = "g_back", when = { metBefore = true, class = "WARLOCK" }, text = "Back again, I see. I trust your servant has been minding its manners?" },
  },
  notice = {
    { id = "n_pet", cat = "craft", when = { class = "WARLOCK", pet = true },
      text = "Your creature is slouching, which means it has stopped being afraid of you. We can mend that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", when = { ["not"] = { class = "WARLOCK" } }, text = "Dane Winslow. I teach a certain kind of servant its lessons, on behalf of a certain kind of master, and since you aren't one of them we have very little to discuss." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "Dane Winslow. Drusilla teaches you how to call a demon, and I teach the demon what it's for, which is the half of the work that students always forget to pay for." },
      },
      again = {
        { id = "h_again", text = "Was there something more? Quietly, if you please." },
        { id = "h_again2", text = "Go on, then, while there's nobody at the chapel door." },
      },
      choices = {
        { text = "What does a demon trainer teach?", next = "teach" },
        { text = "Why keep shop in a graveyard?", next = "graves" },
        { text = "My imp has started talking back. Is that usual, or is it testing me?", next = "imp", when = { class = "WARLOCK" } },
        { text = "A foul trade, beside an abbey.", next = "foul", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "An imp arrives knowing how to throw fire and how to complain, and everything else it must be shown. I sell the grimoires that do the showing, a page at a time, to those with the right to open them." } },
      choices = {
        { text = "And what if the demon won't learn?", next = "wontlearn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wontlearn = {
      lines = { { id = "wl_default", text = "It always learns, because the alternative is a master who has lost patience with it, and every demon understands that arrangement perfectly. The warlock who won't learn is the rarer problem, and by far the messier one." } },
      choices = { { text = "A sobering thought. Something else.", next = "BACK" } },
    },
    graves = {
      lines = { { id = "g_default", text = "It's quiet, the brothers seldom walk here after the morning prayers, and nobody lingers to ask what's in the books. Drusilla chose the spot before I came, and I've never seen a reason to argue with her choice." } },
      choices = {
        { text = "Do the brothers know what you teach?", next = "brothers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers = {
      lines = { { id = "b_default", text = "They know, and they have decided that a warlock taught under their eye is safer than one who teaches himself in a cellar. I happen to agree with them, though I doubt they'd thank me for saying so." } },
      choices = { { text = "A strange truce. Something else.", next = "BACK" } },
    },
    imp = {
      lines = { { id = "i_default", text = "Entirely usual, and you're not to mistake it for wit. An imp chatters to learn where your temper lies, so answer it seldom, feed it less, and never once let it choose the subject." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    foul = {
      lines = { { id = "f_default", text = "So I'm told, usually by people standing exactly where you are. The abbey has borne my presence longer than it has borne yours, {class}, and I've yet to trouble a single grave." } },
      choices = { { text = "See that it stays so.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I see to the schooling of demons, for those in Northshire who keep them. It's quieter work than you'd suppose." } },
    _none = { { id = "tp_none", text = "That's no concern of mine, and I'd advise you to make it no concern of yours." } },
  },
}

-- Donni Anthania: the Crazy Cat Lady, in her cottage between Northshire, Goldshire and Stormwind.
P:NPC {
  key = "donni_anthania", id = TODO_NPC("Donni Anthania"), name = "Donni Anthania", title = "Crazy Cat Lady", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service", communities = {},
  temper = { "dotty", "fond" }, values = { "kind" }, notices = { "pet" },
  impression = {
    first = "Donni Anthania shares a cottage off the Stormwind road with more cats than I could count, and she introduced several of them before she introduced herself. She will part with one only if she likes the look of whoever is asking.",
    third = "{name} met Donni Anthania, the cat lady who keeps a cottage of cats north of Goldshire.",
  },
  greetings = {
    { id = "g_default", text = "Oh, a visitor! Do mind your feet, dear, because there's usually somebody asleep just where you mean to step." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! The tabbies have been asking after you, in their way, which is to say they sat in the window." },
  },
  notice = {
    { id = "n_hunter", cat = "pet", when = { class = "HUNTER" },
      text = "You've a beast of your own somewhere, haven't you? Leave it by the gate, please, because my darlings do not care for surprises." },
    { id = "n_druid", cat = "pet", place = "replace", when = { form = { "cat" } },
      text = "Well, aren't you a big one! I haven't a carrier your size, I'm afraid, but you're very welcome to the rug by the fire." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Donni Anthania, and these are my cats, or I am theirs, since we've never quite settled which. I find homes for the ones that want homes, and the rest stay here with me and have opinions." } },
      again = {
        { id = "h_again", text = "What else, dear? Don't mind Whiskers, he sits on everyone." },
        { id = "h_again2", text = "Ask away, and do keep stroking her, she's decided you're hers." },
      },
      choices = {
        { text = "What sorts of cat do you keep?", next = "sorts" },
        { text = "How many cats live here?", next = "many" },
        { text = "Whose is the little stone outside?", next = "stone" },
        { text = "Folk call you the crazy cat lady.", next = "crazy" },
        { text = "Good day, Donni.", next = "END" },
      },
    },
    sorts = {
      lines = { { id = "s_default", text = "Bombays, black as a cellar and twice as quiet, and tabbies in orange and in silver, and the Cornish rexes with their curly coats. Each has its own temper, so I like to know something about a person before I say which would suit." } },
      choices = {
        { text = "Which would suit me?", next = "suit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    suit = {
      lines = {
        { id = "su_default", text = "An orange tabby, I should think, since they'll follow anybody into anything and never hold a grudge about it. You'll want one who forgives a hard road." },
        { id = "su_dark", when = { class = { "WARLOCK", "ROGUE" } }, text = "A Bombay, without a doubt. They like the dark, they keep their own counsel, and they don't ask where you've been all night." },
        { id = "su_mage", when = { class = { "MAGE", "PRIEST" } }, text = "A silver tabby, dear, because they'll sit on an open book for hours and look as though they've read it. You bookish sorts always get on with them." },
      },
      choices = { { text = "I can see it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    many = {
      lines = { { id = "m_default", text = "I stopped counting at the tea party last spring, when there weren't enough saucers to go round. More than a dozen and fewer than the neighbours claim, and every one of them knows its own name and ignores it." } },
      choices = {
        { text = "You hold tea parties for them?", next = "tea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tea = {
      lines = { { id = "t_default", text = "Every week, with the good cloth on the table and cream instead of tea, since they're particular. The Bombays sit nicely, and the rexes walk through the saucers, and it's the best hour I spend." } },
      choices = { { text = "It sounds a fine hour. Something else.", next = "BACK" } },
    },
    stone = {
      lines = { { id = "st_default", text = "That's Lord Underfoot, bless him, who earned the name on every stair in this house. He was the first of them, and when my own time comes I mean to have a Bombay laid beside me, so I shan't be the only one of us without company." } },
      choices = { { text = "He's well remembered. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    crazy = {
      lines = { { id = "c_default", text = "They do, and they still come up the path when the mice get into their grain. I've been called worse by people with fewer friends, dear, and my friends at least keep their feet clean." } },
      choices = { { text = "Fairly said. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept cats in this cottage for longer than I'd care to say. Stormwind is just up the road, and I very seldom need it." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, dear. If it doesn't purr, I'm afraid I've rather lost track of it." } },
  },
}

-- Jason Mathers: fishmonger on the Crystal Lake pier, at the far end from Lee Brown.
P:NPC {
  key = "jason_mathers", id = TODO_NPC("Jason Mathers"), name = "Jason Mathers", title = "Fishmonger", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest", communities = { "goldshire" },
  temper = { "easygoing", "stubborn" }, values = { "practical", "patient" }, notices = { "craft" },
  impression = {
    first = "Jason Mathers sells the day's catch from the far end of the little pier on Crystal Lake, and argues with Lee Brown at the other end without either of them raising his voice. The murlocs have been at his nets, and it's the one subject that spoils his temper.",
    third = "{name} met Jason Mathers, the fishmonger on the Crystal Lake pier.",
  },
  greetings = {
    { id = "g_default", text = "Fresh from the lake this morning, friend, and I'll tell you honestly which ones were caught yesterday." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The fish are the same, and so is the argument with Lee, if you came for either." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "You're up early, and so are the fish. Lee will tell you that proves his point, and I'd ask you not to encourage him." },
  },
  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "That's a fisherman's squint if ever I saw one. You'll have an opinion about dawn and dusk, then, and I'd like to hear it before Lee does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jason Mathers, fishmonger. Lee teaches folk to catch them and I sell what's caught, and between the two of us this pier feeds half of Goldshire." },
        { id = "h_murloc", tags = { "news" }, when = { questActive = TODO_QUEST("A Man About a Murloc") },
          text = "You've seen them for yourself by now, I expect, down in the reeds by the east shore. Tell me how many there were, because I've been hoping I miscounted." },
        { id = "h_nets", tags = { "news" }, when = { questActive = TODO_QUEST("A Net Disaster") },
          text = "Any luck with the nets? I've a dozen torn through already, and good cord isn't cheap, even this close to Stormwind." },
        { id = "h_slimy", tags = { "news" }, when = { questDone = TODO_QUEST("Slimy Menace") },
          text = "I've pulled the nets up whole three mornings running, and that's your doing. The lake hasn't been this quiet since before they came up the river." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? The fish aren't going anywhere, and neither am I." },
        { id = "h_again2", text = "Go on, friend. I've a line in the water, but it can mind itself." },
      },
      choices = {
        { text = "What's troubling your nets?", next = "murlocs" },
        { text = "Lee says dawn at this pier is best.", next = "lee" },
        { text = "What comes out of Crystal Lake?", next = "catch" },
        { text = "This pier's an odd place for a shop.", next = "pier" },
        { text = "I fish a little myself.", next = "fisher", when = { profession = "Fishing" } },
        { text = "Good fishing, Jason.", next = "END" },
      },
    },
    murlocs = {
      hub = true,
      lines = { { id = "m_default", text = "Murlocs, and more of them every month. They came up the stream from the east, and now they cut my nets open for the catch and leave me the knots.", fx = { learn = { "murlocs_east" } } } },
      again = { { id = "m_again", text = "What more about the murlocs? I could talk about them all day, and none of it kindly." } },
      choices = {
        { text = "Where do they come from?", next = "m_where" },
        { text = "What's been done about them?", next = "m_done" },
        { text = "Nets can be mended, surely.", next = "m_mend" },
        { text = "Enough about murlocs.", next = "BACK" },
      },
    },
    m_where = {
      lines = { { id = "mw_default", text = "They've huts along the east shore of the lake and more on the Stone Cairn water beyond, built of reeds and whatever they've stolen. Adele Fielder can see their fires from her window some nights, and she's stopped sitting out of an evening." } },
      choices = {
        { text = "Has anyone gone in after them?", next = "m_done" },
        { text = "Back to the murlocs.", next = "BACK" },
      },
    },
    m_done = {
      lines = { { id = "md_default", text = "Guard Thomas sent two men up the river to look, and neither came back, so the Marshal's short of volunteers. Mostly it falls to whoever walks down this pier with a blade and an hour to spare." } },
      choices = {
        { text = "Then it may fall to me.", next = "BACK", reply = "I'd be glad of it, and so would every cook in Goldshire. Mind the ones with the spears, because they're braver than they look.", fx = { affinity = 1 } },
        { text = "Back to the murlocs.", next = "BACK" },
      },
    },
    m_mend = {
      lines = { { id = "mm_default", text = "They can, and I mend them every night by lamplight, but a mended net is half knots and catches half as well. What I need is a week when nobody cuts them, and I haven't had one since the spring." } },
      choices = { { text = "Back to the murlocs.", next = "BACK" } },
    },
    lee = {
      lines = { { id = "l_default", text = "Lee has said so every morning for ten years, and he's a fine teacher, so folk believe him. The big ones feed at dusk off the deep end, where I happen to stand, and my slab is the proof of it." } },
      choices = {
        { text = "Has either of you ever given ground?", next = "ground" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ground = {
      lines = { { id = "gr_default", text = "Not an inch, and I hope we never do, for it's the best conversation on the lake. He teaches my customers to cast, and I sell his students' first catch for them, so you can judge for yourself how bitter the feud runs." } },
      choices = { { text = "A friendly war, then. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    catch = {
      lines = { { id = "c_default", text = "Brilliant smallfish by the basket, and longjaw mud snapper when the water's warm. Neither's a king's supper, but Innkeeper Farley takes all I can bring, and nobody at the Lion's Pride has complained yet." } },
      choices = { { text = "Honest fare. Something else.", next = "BACK" } },
    },
    pier = {
      lines = { { id = "p_default", text = "It's the freshest shop in the kingdom, since the stock swims up to the counter. Folk walk down from Goldshire for their supper, and the walk back gives them an appetite for it." } },
      choices = { { text = "Hard to argue with. Something else.", next = "BACK" } },
    },
    fisher = {
      lines = { { id = "f_default", text = "Then you'll know that the bait matters more than the hour, whatever Lee tells you. Try the deep end with something that shines, and if you land a snapper longer than your forearm, bring it past his end of the pier slowly." } },
      choices = { { text = "I'll walk it past him twice. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold fish off this pier since I was old enough to gut one. Crystal Lake's been good to me, murlocs aside." } },
    murlocs_east = { { id = "tp_mur", text = "They came up the river from the east and they're at my nets every week. Somebody ought to thin them out before the lake's theirs." } },
    _none = { { id = "tp_none", text = "That's deeper water than I fish in, friend. Ask up at the inn, where the talk is." } },
  },
}
