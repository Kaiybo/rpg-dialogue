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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hi! I've counted every step since you left, and I didn't lose my place once!" },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Go away. You're not allowed to walk with us, and those are the rules." },
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
        { text = "Who taught you to march like that?", next = "ytaught" },
        { text = "Do the six of you ever quarrel?", next = "yquarrel" },
        { text = "I served in the real guard once.", next = "yguard", when = { class = { "WARRIOR", "PALADIN" } } },
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
    ytaught = {
      lines = {
        { id = "yt_default", text = "Nobody taught me, I watched. The guards outside the Lion's Pride change over at sunset, and they stamp twice and turn, so I practised it behind the inn until I had it right. Marshal Dughan saw me once and nodded, and that counts." },
        { id = "yt_human", when = { race = "Human" }, text = "I watched the Goldshire guards change over at sunset, the same as you must have seen a hundred times. They stamp twice and turn, and I practised it behind the inn until Marshal Dughan nodded at me." },
      },
      choices = {
        { text = "Why do you want to be a guard so badly?", next = "ywhy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywhy = {
      narr = "He loses his count and has to look at his boots to find it again.",
      lines = { { id = "yw_default", text = "My father was in the King's army, and he went away when I was small and didn't come back. Mother says he kept his post right to the end, so I want to keep mine, even if it's only a corner of a game." } },
      choices = {
        { text = "Then you honour him every step.", next = "BACK", reply = "That's what I think too, but don't tell the others, please.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yquarrel = {
      lines = { { id = "yq_default", text = "All the time, mostly about the rules. Dana says a guard ought to be allowed to leave her corner if she sees a wolf, and I say a guard who leaves her corner isn't guarding anything. Which of us is right, do you think?" } },
      choices = {
        { text = "You are. A post is a post.", next = "yquarrel2", reply = "I knew it! I'm going to tell her a grown-up said so.", fx = { align = { order = 1 } } },
        { text = "Dana is. Sometimes you must break ranks.", next = "yquarrel2", reply = "Oh. Well, I suppose she does see the wolves first.", fx = { align = { order = -1 } } },
      },
    },
    yquarrel2 = {
      lines = { { id = "yq2_default", text = "Either way, we always make friends again by the Northshire gate, because Brother Neals won't give out grapes to children who are sulking. That's the real rule, and it works better than mine." } },
      choices = { { text = "Grapes keep the peace. Something else.", next = "BACK" } },
    },
    yguard = {
      lines = { { id = "yg_default", text = "Did you really? Then you can tell me if I'm doing it properly. I keep my eyes front and my shoulders back, and I never scratch my nose, even when it itches dreadfully, which is nearly always." } },
      choices = { { text = "You'd pass inspection. Something else.", next = "BACK", reply = "I'm going to remember you said that forever.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    dughan = { { id = "yt_dughan", text = "Marshal Dughan is the most important man in Goldshire, and he never slouches, not even when he sits down." } },
    stormwind = { { id = "yt_sw", text = "The gate at Stormwind has a guard on each side, and I've counted the bricks between them. There are forty-one." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You may approach the king! You're my favourite grown-up, but you mustn't tell my mum." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "The king says you're banished, so I'm not playing with you today." },
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
        { text = "What does a king worry about?", next = "yworry" },
        { text = "What laws has the king made?", next = "ylaws" },
        { text = "I'm a noble of Stormwind, you know.", next = "ynoble", when = { race = "Human" } },
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
    yworry = {
      narr = "He glances over his shoulder at the ring of children, then lowers his voice.",
      lines = { { id = "ywo_default", text = "That one day the others won't want to play any more. Dana's getting bored of being a guard, and Aaron's going to join the real guard when he's older, and then I'll be a king with nobody around him at all." } },
      choices = {
        { text = "Then let Dana have a turn as king.", next = "yturn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yturn = {
      lines = { { id = "ytu_default", text = "But if I let her, she might be better at it than me, and then everyone will want her to stay king. Should a king share his crown, or keep it?" } },
      choices = {
        { text = "Share it. A good king lets others lead.", next = "BACK", reply = "Hmm. Maybe on Sundays, then. Only on Sundays.", fx = { align = { order = -1 } } },
        { text = "Keep it. A king must stay a king.", next = "BACK", reply = "That's what I thought! I'll tell Dana you said so.", fx = { align = { order = 1 } } },
      },
    },
    ylaws = {
      lines = {
        { id = "yl_default", text = "Everyone has to wash before supper, nobody is allowed to be sent to bed early, and on market days the king gets the first sweet. Lisa says the second law isn't a proper law because nobody can make grown-ups obey it." },
        { id = "yl_child", when = { race = "Gnome" }, text = "Everyone washes before supper, nobody is sent to bed early, and the king gets the first sweet. I'd make you the royal inventor, if you want it, because gnomes are the cleverest people in the whole kingdom." },
      },
      choices = {
        { text = "Who enforces them?", next = "yenforce" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yenforce = {
      lines = { { id = "ye_default", text = "Aaron does, mostly, because he likes rules better than anybody. He wrote them on a slate and hung it on our bedpost, but Jose rubbed half of it off with his sleeve while he was looking for a beetle." } },
      choices = { { text = "A setback for the crown. Something else.", next = "BACK" } },
    },
    ynoble = {
      lines = { { id = "yn_default", text = "Are you really? Then you must bow, because nobles bow to kings, but I'll bow back, because you're taller. That seems fair, and fair is the most important thing a king can be, Mother says." } },
      choices = { { text = "Your Majesty. Something else.", next = "BACK", reply = "Thank you, my lord. You may go about your business.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    anduin = { { id = "yt_anduin", text = "King Anduin is only a boy, like me. I think we'd get on, if he ever came to Goldshire." } },
    goldshire = { { id = "yt_gold", text = "Goldshire is my kingdom, from the inn to the smithy, and the pond counts too." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "I saw you first again, from way back at the bend! You're my favourite, but don't tell the others." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I saw you coming, so I told everyone to walk faster. I'm not playing with you today." },
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
        { text = "What's the scariest thing you've seen?", next = "yscary" },
        { text = "What will you be when you grow up?", next = "ygrow" },
        { text = "I'm an elf of Teldrassil, little lookout.", next = "yelf", when = { race = "NightElf" } },
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
    yscary = {
      narr = "She stops scanning the trees for a moment and looks straight at you.",
      lines = { { id = "ysc_default", text = "A man in a red mask, standing very still in the trees near the Jasperlode road, watching us go past. I didn't tell the others because they'd have run, and if you run, the wolves chase you, so I just kept walking and kept watching him." } },
      choices = {
        { text = "You should tell Marshal Dughan.", next = "ytell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytell = {
      lines = { { id = "yte_default", text = "But then he'd stop us marching to Northshire, and the march is the best part of everybody's day. Should I tell him, even if it means the game stops?" } },
      choices = {
        { text = "Tell him. Safety matters more than games.", next = "BACK", reply = "All right. I'll tell him, but only about the man.", fx = { align = { order = 1 } } },
        { text = "Keep watching yourself. You saw him first.", next = "BACK", reply = "I'll watch so hard he'll feel it, then.", fx = { align = { order = -1 } } },
      },
    },
    ygrow = {
      lines = {
        { id = "yg_default", text = "A ranger, like the ones Mother says used to walk the borders of Lordaeron, the ones with the long bows who could see a deer at a mile. I practise on the gryphons, because if you can follow a gryphon you can follow anything." },
        { id = "yg_hunter", when = { class = "HUNTER" }, text = "A hunter, like you! I practise on the gryphons over Stormwind, because if you can follow a gryphon you can follow anything. Will you tell me how you learned?" },
      },
      choices = {
        { text = "Who could teach you?", next = "yteach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yteach = {
      lines = { { id = "ytc_default", text = "There's a hunter trainer in Goldshire's inn who looked at my sling and laughed, but not unkindly. He said come back when I'm taller than the bar, and I measure myself against it every week." } },
      choices = { { text = "You'll be taller soon. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    yelf = {
      lines = { { id = "ye_default", text = "From the giant tree over the sea? I've heard your Sentinels can see in the dark, so you'd be a much better lookout than me, but please don't tell Cameron, because he'll make you join the game." } },
      choices = { { text = "Your secret is safe. Something else.", next = "BACK" } },
    },
  },
  topics = {
    hogger = { { id = "yt_hogger", text = "Hogger lives past the Stonefield farm. I've never seen him, but I've seen where the gnolls dragged things." } },
    defias = { { id = "yt_defias", text = "The red masks hide in the woods by the Jasperlode road. I've seen one, and he saw me back." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you! Have you got anything to eat? You're nicer than the others, so you might." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Go away. My feet hurt enough without you here as well." },
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
        { text = "Who are your mother and father?", next = "yfamily" },
        { text = "What would you rather do than walk?", next = "yrather" },
        { text = "Want some food, lad? I'm a cook.", next = "ycook", when = { profession = "Cooking" } },
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
    yfamily = {
      narr = "He kicks a pebble ahead of him and watches it roll into the grass.",
      lines = { { id = "yf_default", text = "My father carries sacks at the mill outside Stormwind, and Mother does washing for the inn. They're both tired all the time, which is probably where I get it from, so when I complain about my feet Mother says I come by it honestly." } },
      choices = {
        { text = "Do they mind you marching all day?", next = "ymind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymind = {
      lines = { { id = "ym_default", text = "Mother says it keeps me out from under her feet, and Father says it'll make a soldier of me. I don't want to be a soldier, I want to be a baker, but you can't say that to Aaron without him looking at you as if you'd fallen in a ditch." } },
      choices = {
        { text = "Be a baker. Follow your own heart.", next = "BACK", reply = "Really? Then I'll start with sticky buns, for you.", fx = { align = { order = -1 } } },
        { text = "Listen to your father. Duty comes first.", next = "BACK", reply = "Oh. I suppose soldiers eat buns too, though.", fx = { align = { order = 1 } } },
      },
    },
    yrather = {
      lines = { { id = "yr_default", text = "Sit by the pond and watch the fish, or lie under the big tree by the Maclure farm and count clouds instead of steps. Clouds don't need counting, either, which is what makes them so restful." } },
      choices = {
        { text = "Why don't you, then?", next = "ywhy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywhy = {
      lines = { { id = "ywh_default", text = "Because everybody would go without me, and then they'd talk about the walk at supper and I wouldn't know what they meant. It's worse to miss out on a thing than to be tired from it, I've found." } },
      choices = { { text = "That's wise of you, John. Something else.", next = "BACK" } },
    },
    ycook = {
      lines = { { id = "yc_default", text = "Do you mean it? I'd ever so like something, but Aaron says guards don't eat on the march. Could you leave it by the big house door, and I'll find it later? Nobody makes a rule about doors." } },
      choices = { { text = "I'll think on it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    hogger = { { id = "yt_hogger", text = "I don't want to meet Hogger, ever, and I've told Dana that if she goes looking for him, she's going without me." } },
    farley = { { id = "yt_farley", text = "Innkeeper Farley's kitchen smells best on Wednesdays, when he does the pies. I've checked every day to be sure." } },
    northshire = { { id = "yt_north", text = "Northshire is uphill all the way there, and somehow uphill on the way back too, which isn't fair." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! I saved you something from my pocket, but I can't remember which pocket." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'm not showing you anything from my pockets today, and I'm not playing with you either." },
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
        { text = "What's the rarest thing you've ever found?", next = "yrare" },
        { text = "Do your parents mind the collection?", next = "yparents" },
        { text = "I'm a gnome. We collect things too.", next = "ygnome", when = { race = "Gnome" } },
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
    yrare = {
      narr = "He lowers his voice and pats a pocket that clinks.",
      lines = { { id = "yra_default", text = "A coin with a lion on it, only the lion's wrong, it's got a crown with spikes. I found it by the old graveyard near Northshire, and Aaron says it might be from Lordaeron, from before the war, from somebody who isn't alive any more." } },
      choices = {
        { text = "Maybe you should give it back to the graveyard.", next = "ycoin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycoin = {
      lines = { { id = "yco_default", text = "Give it back? But nobody's looking after it there, and I'd look after it properly. Is it stealing if the person it belonged to isn't here any more?" } },
      choices = {
        { text = "Keep it safe. That honours them too.", next = "BACK", reply = "I will! I'll polish it every Sunday.", fx = { align = { honor = -1 } } },
        { text = "Put it back. It belongs to the dead.", next = "BACK", reply = "Oh. All right, but I'm saying sorry to it first.", fx = { align = { honor = 1 } } },
      },
    },
    yparents = {
      lines = { { id = "ypa_default", text = "I live with my aunt in the big house, because my mother's in Stormwind sewing for a lady, and she sends for me in the winter. Auntie doesn't mind the box as long as it stays under the bed and nothing in it climbs out at night." } },
      choices = {
        { text = "Does anything climb out?", next = "yclimb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yclimb = {
      lines = { { id = "ycl_default", text = "Only once, a frog, and it was a very small frog, and it was Lisa who screamed, not Auntie. Cameron made a law about frogs after that, but I don't think it applies to toads, so I'm being careful about which I pick up." } },
      choices = { { text = "A sound legal mind. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ygnome = {
      lines = { { id = "ygn_default", text = "Do you? What sort of things? Cogs and springs and little bits of brass? If you've got a spare cog I'd trade you my striped stone for it, and that's a very good trade, because the stripe goes all the way round." } },
      choices = { { text = "A generous offer. Something else.", next = "BACK" } },
    },
  },
  topics = {
    hogger = { { id = "yt_hogger", text = "If somebody killed Hogger, I'd like one of his teeth for the box. Just a small one, I'm not greedy." } },
    beetles = { { id = "yt_beetle", text = "The best beetles live under the logs by the Stonefield fence. The purple ones bite, but only a bit." } },
    northshire = { { id = "yt_north", text = "Northshire has the best stones, round the back of the abbey where the monks don't sweep." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's you! I told everybody on the road you'd come back, and nobody believed me!" },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You're mean, and I'm telling Guard Thomas all about you." },
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
        { text = "What's the biggest secret you know?", next = "ysecret" },
        { text = "Who looks after you all?", next = "ywho" },
        { text = "I came over the sea from Darnassus.", next = "ydarn", when = { race = "NightElf" } },
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
    ysecret = {
      narr = "She checks that Cameron isn't listening, then leans close.",
      lines = { { id = "yse_default", text = "That the man who sells the wagon goods at the crossroads isn't from Elwynn at all, he's from Westfall, and he left because his farm was taken by the red masks. He told me not to tell anyone, but you aren't anyone, you're a hero." } },
      choices = {
        { text = "You shouldn't share what he told you.", next = "yshare" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yshare = {
      lines = { { id = "ysh_default", text = "But if everybody knew, people would be kind to him, wouldn't they? Isn't it better to tell a sad secret so people can help?" } },
      choices = {
        { text = "A promise is a promise. Keep it.", next = "BACK", reply = "All right. I promise I'll keep it from now on.", fx = { align = { honor = 1 } } },
        { text = "Telling it might help him. Tell kindly.", next = "BACK", reply = "That's what I think! I'll only tell the nice people.", fx = { align = { honor = -1 } } },
      },
    },
    ywho = {
      lines = { { id = "ywh_default", text = "Missus Hargrove upstairs in the big house, mostly, and all the mothers take turns besides. When the six of us come home dusty she lines us up by the pump and scrubs us one at a time, and Cameron goes last because he's the king." } },
      choices = {
        { text = "Is she kind to you?", next = "ykind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ykind = {
      lines = { { id = "yk_default", text = "Ever so kind, though she pretends she isn't. She lost her own boy to the fever two winters ago, so she says she's got six now to make up the number, and she's very strict about bedtimes." } },
      choices = { { text = "You're lucky to have her. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ydarn = {
      lines = { { id = "yd_default", text = "Across the whole sea! Is it true your trees are so big you live inside them? Dana wants to go and see, but I want to go and say hello to everybody, because I bet nobody there has heard of Goldshire." } },
      choices = { { text = "Some have, now. Something else.", next = "BACK" } },
    },
  },
  topics = {
    stormwind = { { id = "yt_sw", text = "The gate guards at Stormwind always ask for our report, and I always give it properly." } },
    goldshire = { { id = "yt_gold", text = "Everybody in Goldshire waves at us, except the smith, who's always busy, and he still nods." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's you! I told Bo you were real, and this time I believed it myself." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Go away. I've decided I don't like you, real or not." },
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
        { text = "What do you want to be when you're grown?", next = "ygrown" },
        { text = "Have you ever seen a real Defias?", next = "ydefias" },
        { text = "I'm a dwarf, lad, and quite real.", next = "ydwarf", when = { race = "Dwarf" } },
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
    ygrown = {
      lines = {
        { id = "ygr_default", text = "A scholar, in the big library in Stormwind, where they write down everything that's true and nothing that isn't. I'd sort out all the stories Bo tells and put the true ones on one shelf and the rubbish on another." },
        { id = "ygr_mage", when = { class = "MAGE" }, text = "A wizard, maybe, like you, because wizards have to know what's true or their spells go wrong. Or a scholar in the Stormwind library, sorting Bo's stories into true ones and rubbish." },
      },
      choices = {
        { text = "Which shelf would be fuller?", next = "yshelf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yshelf = {
      lines = { { id = "ysh_default", text = "The rubbish shelf, easily, though I'll admit the bit about Hogger turned out truer than I thought. Bo says that proves everything he says is true, and I say it proves he got lucky once." } },
      choices = { { text = "A fair verdict. Something else.", next = "BACK" } },
    },
    ydefias = {
      narr = "He goes suddenly quiet and picks at the edge of the smithy's wall.",
      lines = { { id = "yd_default", text = "My uncle joined them. He was a stonemason in Stormwind, and the nobles never paid the masons what they were owed, so he went to Westfall angry and never came back. Father says he's a thief now, and we aren't to say his name." } },
      choices = {
        { text = "The nobles wronged him. He had cause.", next = "yuncle", reply = "That's what I think too, only I can't say it at home.", fx = { align = { order = -1 } } },
        { text = "Being cheated doesn't make thieving right.", next = "yuncle", reply = "No, I suppose it doesn't. Father says the same.", fx = { align = { order = 1 } } },
      },
    },
    yuncle = {
      lines = { { id = "yu_default", text = "That's why I always play the guard, and never the bandit if I can help it. If I'm a guard, maybe it means I won't turn out like him. That's not a silly thing to think, is it?" } },
      choices = { { text = "Not silly at all. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ydwarf = {
      lines = { { id = "ydw_default", text = "You are, aren't you? Bo said dwarves can drink a whole barrel of ale and still walk straight, and I said that was rubbish. Don't tell me if it's true, though, because I'll never hear the end of it." } },
      choices = { { text = "My lips are sealed. Something else.", next = "BACK" } },
    },
  },
  topics = {
    argus = { { id = "yt_argus", text = "Smith Argus pretends he doesn't see us behind the forge, but he leaves the side door open in winter so we're warm." } },
    defias = { { id = "yt_defias", text = "The Defias are only angry masons who turned bad. That's the truth, whatever the songs say." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's you! Stand right there, would you, so Argus can't see me." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Mum says I'm not to talk to you, and Argus would agree with her." },
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
        { text = "Have you ever run farther than the pond?", next = "yfar" },
        { text = "What are you afraid of?", next = "yafraid" },
        { text = "I'm a rogue. I know about running.", next = "yrogue", when = { class = "ROGUE" } },
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
    yfar = {
      lines = { { id = "yfa_default", text = "Once all the way to the Eastvale logging camp, to see if I could, and I could! But it was dark when I got back, and Mother was standing at the door with her arms folded, and that was the slowest walk home I've ever done." } },
      choices = {
        { text = "Was she very angry?", next = "yangry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yangry = {
      lines = { { id = "yan_default", text = "She wasn't angry, she was crying, which was worse. She said the woods are full of wolves and red masks now, and that I'm all she's got since Father went to fight the orcs. I still want to run to Stormwind one day, though. Should I?" } },
      choices = {
        { text = "Stay close. Your mother needs you.", next = "BACK", reply = "Yeah. I'll wait till I'm bigger, then.", fx = { align = { honor = 1 } } },
        { text = "Run while you're young. Tell her first.", next = "BACK", reply = "I'll leave her a note! A big one.", fx = { align = { honor = -1 } } },
      },
    },
    yafraid = {
      narr = "He stops bouncing on his toes for the first time since you arrived.",
      lines = { { id = "yaf_default", text = "Being slow, I suppose, because the slow ones get caught. Not in games, I mean really. When the gnolls took the Maclure sheep, the slow ones were the ones that went, and I've thought about that ever since." } },
      choices = {
        { text = "Speed isn't everything, Mark.", next = "yspeed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yspeed = {
      lines = { { id = "ysp_default", text = "That's what Joshua says, that clever matters more than quick. But clever didn't save the sheep either, did it? I'll keep running, just in case." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    yrogue = {
      lines = {
        { id = "yro_default", text = "You do? Then you know the trick is never to run in a straight line, because that's what the grown-ups expect. Go round the water trough, under the cart, and you're gone before they've turned." },
        { id = "yro_halfling", when = { race = "Gnome" }, text = "You must be quick, being so small! The trick is never to run in a straight line, so go round the trough and under the cart, and you're gone before anyone's turned." },
      },
      choices = { { text = "I'll remember that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    argus = { { id = "yt_argus", text = "Argus shouts the loudest of anyone in Goldshire, but he's never actually caught me." } },
    pond = { { id = "yt_pond", text = "The pond by the road is the finish line, always. Everybody knows that." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hello again! I dug up a real treasure in the cabbages, and you're the only one I'll show." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'm not playing with you today, and you have to stay out of the cabbages." },
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
        { text = "Why do you think the treasure is here?", next = "ywhy" },
        { text = "Where are your parents, Markus?", next = "yparents" },
        { text = "I'm a miner. Want a tip?", next = "ytip", when = { profession = "Mining" } },
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
    ywhy = {
      lines = { { id = "ywy_default", text = "Because Clara's grandfather was here before the orcs came, in the First War, and Clara says he buried the family silver so they wouldn't get it. Nobody ever found it again, because he forgot which row, and that's practically a treasure map." } },
      choices = {
        { text = "If you find it, it's Clara's, though.", next = "ysilver" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysilver = {
      lines = { { id = "ysi_default", text = "But I'd be the one who found it, after all this digging. Shouldn't the finder get some, or is that greedy?" } },
      choices = {
        { text = "It's hers. Give it all back.", next = "BACK", reply = "All right. But she'd better let me hold it first.", fx = { align = { honor = 1 } } },
        { text = "A finder's share is fair enough.", next = "BACK", reply = "That's what I'll tell her! Just a little share.", fx = { align = { honor = -1 } } },
      },
    },
    yparents = {
      narr = "His spoon stops halfway into the soil.",
      lines = { { id = "ypa_default", text = "My dad went to Westfall to work a farm there, and then the farms went bad, and nobody's heard from him since the harvest. Clara's my mum's cousin, so I stay here, and I dig, because if I find the silver he won't have to work anywhere." } },
      choices = {
        { text = "Has anyone looked for him?", next = "ylooked" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylooked = {
      lines = { { id = "ylo_default", text = "Clara wrote to Sentinel Hill, where the People's Militia is, and they wrote back that they'd keep an eye out. I think that means no, but I'm not supposed to say so, so I just dig faster instead." } },
      choices = { { text = "Keep hoping, Markus. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ytip = {
      lines = {
        { id = "yti_default", text = "A real miner's tip? Yes, please! Is it about where to dig, or how to dig, because I'm all right at the how, it's the where that's giving me trouble." },
        { id = "yti_dwarf", when = { race = "Dwarf" }, text = "A real dwarf miner! Is it about where to dig or how? I'm all right at the how, but the where is giving me trouble, and dwarves always know the where." },
      },
      choices = { { text = "Dig near the old fence posts. Something else.", next = "BACK", reply = "Fence posts! Of course! Why didn't I think of that?" } },
    },
  },
  topics = {
    clara = { { id = "yt_clara", text = "Clara pretends to be cross about the cabbages, but she saves me the burnt ends of the bread, which are the best bits." } },
    westfall = { { id = "yt_west", text = "Westfall is where my dad went. Everyone says it's gone bad there, but nobody says how." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend! Northshire always feels a little brighter when you come down the path." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Welcome to Northshire, I suppose, though I'll ask you to be quick about it." },
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
        { text = "Who were you before you came here?", next = "ybefore" },
        { text = "Does anything about the valley worry you?", next = "yworry" },
        { text = "I'm not from Elwynn at all.", next = "yfar", when = { race = { "Dwarf", "Gnome", "NightElf" } } },
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
    ybefore = {
      lines = { { id = "ybe_default", text = "A schoolteacher's daughter from Goldshire, and then a schoolteacher myself, until the Defias trouble emptied half the classroom. The abbey needed someone to meet the recruits, and Brother Sammuel thought I'd the right sort of voice for it." } },
      choices = {
        { text = "Why did the classroom empty?", next = "yempty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yempty = {
      narr = "She smooths the front of her dress, slowly, twice.",
      lines = { { id = "yem_default", text = "Families moved into Stormwind for the walls, or went east to Lakeshire, and a few of the older boys went to Westfall to join the masons' grievance. One of them was mine, a clever lad named Tobin, and I've wondered since whether I taught him to be angry." } },
      choices = {
        { text = "You taught him to think. That's no crime.", next = "BACK", reply = "Thank you, {name}. I shall try to believe that.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yworry = {
      lines = { { id = "ywo_default", text = "That we send them out too soon. A recruit kills a few kobolds and the Marshal hands him a letter for Goldshire, and the next I hear, he's in Westfall facing men with real swords. Should we hold them longer, do you think, or trust them to grow?" } },
      choices = {
        { text = "Hold them longer. Training saves lives.", next = "yworry2", reply = "I'll say so to Marshal McBride, though he'll sigh at me.", fx = { align = { order = 1 } } },
        { text = "Let them go. The road is the teacher.", next = "yworry2", reply = "Perhaps you're right. You came through it, after all.", fx = { align = { order = -1 } } },
      },
    },
    yworry2 = {
      lines = { { id = "yw2_default", text = "Either way, I say the same to every one of them as they leave: keep your boots dry, eat when you can, and write to your mother. It isn't much, but it's what I've got to give." } },
      choices = { { text = "It's more than most give. Something else.", next = "BACK" } },
    },
    yfar = {
      lines = {
        { id = "yf_default", text = "So I see, and you're no less welcome for it. We've had a dwarf or two come up from Dun Morogh to study with the brothers, and a gnome who took the abbey bell apart to see how it rang. It still rings, mostly." },
        { id = "yf_elf", when = { race = "NightElf" }, text = "So I see, and you're very welcome. You're the first of your people I've greeted at the abbey, and I hope you'll forgive me if I stare at Elwynn's oaks a little differently now." },
      },
      choices = { { text = "Thank you, Merissa. Something else.", next = "BACK" } },
    },
  },
  topics = {
    mcbride = { { id = "yt_mcb", text = "Marshal McBride is a good man with a loud voice, and he'd be lost without the brothers to soften it." } },
    defias = { { id = "yt_def", text = "The Defias were masons once, and some were my pupils' fathers. I'd sooner not speak ill of all of them." } },
    background = { { id = "tp_bg", text = "I'm an Elwynn woman, and I greet those who come to the abbey to begin. It's small work, and I'm fond of it." } },
    _none = { { id = "tp_none", text = "I'm afraid that's beyond me, dear. One of the brothers in the library might know." } },
  },
}
