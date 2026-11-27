-- Zephras Isle beyond the villages: Urs'endris, the Great Windborne Bear Spirit, on his
-- small eastern isle; Brother Zendraas, the tailor who wore the grey robes to survive;
-- and Raan Wildwind, the adventurer camped on the road to Shen'dar Village.
-- Voice and sources: bibles/zep_wilds.md.
local P = RPGDialogueAPI:Pack("rpgd.zephras")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Urs'endris: the Great Windborne Bear Spirit. Has taught Skyborne druids
-- the bear's shape for generations; his mate Ur'endra has lost herself.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_ursendris", id = TODO_NPC("Urs'endris"), name = "Urs'endris", title = "The Great Windborne Bear Spirit",
  bible = "bibles/zep_wilds.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "patient", "grave" }, values = { "strength", "patience" },
  spiritSensitive = true,
  notices = { "form", "class", "origin" },

  impression = {
    first = "He says strength means facing what's wrong inside you too.",
    third = "{name} sat before Urs'endris, the Great Windborne Bear Spirit, who has taught the bear's shape to generations of Skyborne druids.",
  },

  greetings = {
    { id = "g_default", text = "The great ursera spirit turns its head toward you, slow as a cloud crossing the sun." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Child of the winds, you've come to learn my shape. Sit." },
    { id = "g_bear", when = { form = "bear" }, text = "You wear my shape. Let me see how it sits on you." },
  },

  notice = {
    { id = "n_bear", cat = "form", place = "replace", when = { form = "bear" },
      text = "The spirit studies you for a long moment, the way a parent studies a cub that's learned to stand. Something in its great shoulders eases." },
    { id = "n_nightclaw", cat = "origin", when = { origin = "skyborne_nightclaw" },
      text = "You come from the Nightclaw, from the shadowed forest. They sent their young to me once, long ago, and then they stopped coming, and I have missed them." },
    { id = "n_circle", cat = "origin", when = { origin = "skyborne_circle_student" },
      text = "You smell of strange trees, and of a moon I have never seen. The druids below the clouds have taught you; good. A shape can be learned in more than one place." },
  },

  start = "hello",
  nodes = {
    d_moonbear = {
      lines = { { id = "dr_ub_default", text = "The old one on the mountain by the lake, yes. I know of him the way one cloud knows another, from far off and by the shadow he casts. He teaches the heart before the body, I am told, and I teach the storm within before the storm without, and I suspect we say the same thing in two winds." } },
      choices = { { text = "Something else, great spirit.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    d_dire = {
      big = true,
      lines = { { id = "dr_ud_default", text = "The spirit looks you over slowly, from your paws to your shoulders. It grew because the storms you face grew, child, and the bear grows to meet them; that is all. Do not mistake the size of the shape for the size of the heart inside it." } },
      choices = {
        { text = "Then I'll keep the heart larger than the shape.", next = "BACK", reply = "Good. That is the whole of my teaching, child, and it took you only a lifetime to arrive at it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The storms are bigger. The shape is what matters now.", next = "BACK", reply = "The storms are bigger, yes, and the bear must be large to meet them. Only do not forget that a large bear can still be lost.", fx = { align = { light = -1 } } },
        { text = "Something else, great spirit.", next = "BACK" },
      },
    },
    d_circle = {
      big = true,
      lines = { { id = "dr_uc_default", text = "That is for the shen'dorei to decide, child, not for an old bear. The druids below the clouds are wise and would teach you much, but they would also teach you to look at the moon, and I have watched the winds fade from this isle, and I do not know who would remember them if you looked away." } },
      choices = {
        { text = "We should join them, and carry the winds with us.", next = "BACK", reply = "Then carry them carefully, child, for the winds are lighter than they used to be. Tell the old bear by the lake I said so.", fx = { affinity = 1, align = { order = -1 }, opinion = { druids = "united" } } },
        { text = "Our druids should keep the winds' ways, apart from theirs.", next = "BACK", reply = "Then someone will remember the winds, at least. Learn what the Circle offers, but bring it home to this sky.", fx = { align = { order = 1 }, opinion = { druids = "divided" } } },
        { text = "Something else, great spirit.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Urs'endris. For more generations than your elders can count, the druids of the shen'dorei have come to this place to learn my shape. The strength I teach is not only in the arms; it is in standing firm against what troubles you from outside and what troubles you from within." },
        { id = "h_mercy", tags = { "news" }, when = { questActive = TODO_QUEST("Strength and Mercy") },
          text = "Go to her, child of the winds. She will not know you, and she will not know herself, and that is why it must be done gently." },
        { id = "h_mercydone", tags = { "news" }, when = { questDone = TODO_QUEST("Strength and Mercy") },
          text = "It is done, then, and she is at peace. You have learned the hardest thing my shape can teach, that strength is sometimes only the courage to be merciful." },
        { id = "h_notdruid", when = { ["not"] = { class = "DRUID" } },
          text = "You are not of my shape, nor of any shape, I think, but you came across the water to sit with an old bear, and that is not nothing. I am Urs'endris, and I have taught the druids of the shen'dorei since before your elders were born." },
      },
      again = {
        { id = "h_again", text = "The great bear waits, unhurried. Ask, child." },
        { id = "h_again2", text = "The spirit settles lower, listening." },
      },
      choices = {
        { text = "What does it mean to take your shape?", next = "shape" },
        { text = "Why do you grieve, great spirit?", next = "mate" },
        { text = "Do you know where the wind spirits went?", next = "winds" },
        { text = "Who else teaches the shen'dorei druids?", next = "teachers" },
        { text = "Teach me your shape, Urs'endris.", next = "xlearn", when = { class = "DRUID" } },
        { text = "The Nightclaw kept to themselves. Why did they stop coming?", next = "xnightclaw", when = { origin = "skyborne_nightclaw" } },
        { text = "I've learned the cat's shape too.", next = "xcat", when = { class = "DRUID", form = "cat" } },
        { text = "In Moonglade, another great bear taught me too.", next = "d_moonbear", when = { class = "DRUID", minLevel = 10 } },
        { text = "My bear's shape has grown, Urs'endris. It's heavier now.", next = "d_dire", when = { class = "DRUID", minLevel = 40 } },
        { text = "Should the shen'dorei druids join the Cenarion Circle?", next = "d_circle", when = { class = "DRUID" } },
        { text = "I'll leave you in peace, great spirit.", next = "END" },
      },
    },
    shape = {
      lines = {
        { id = "sh_default", text = "The bear is heavy and slow and very hard to move, and that is its gift. When the storm comes, the bear does not run from it and does not fight it; it plants its feet and lets the storm wear itself out, and then it is still there." },
      },
      choices = {
        { text = "And the adversity within?", next = "shape2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shape2 = {
      big = true,
      lines = {
        { id = "s2_default", text = "That is the harder storm. Fear, and grief, and the anger that wants to break something because something has broken you. Some druids think strength is mastering those things, and some think it is letting them pass through you, and I have known great druids of both kinds." },
      },
      choices = {
        { text = "Master them. A bear that loses its temper is only a beast.", next = "BACK", reply = "Then you will be a fearsome bear, child, and a lonely one. Walk the path you have chosen with care.", fx = { affinity = 1, align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Let them pass through. Holding them only makes them heavier.", next = "BACK", reply = "That is the way of the old willows in the storm, and it has kept many druids whole. Walk it with care.", fx = { affinity = 1, align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mate = {
      lines = {
        { id = "ma_default", text = "Because my mate, Ur'endra, is lost. She lies in a cave in the Shen'dar Highlands with our young, and our young are dead, and she does not remember my name." },
      },
      choices = {
        { text = "How did she come to be lost?", next = "lost" },
        { text = "What of your young?", next = "cubs" },
        { text = "I'm sorry, great spirit.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost = {
      lines = {
        { id = "lo_default", text = "The winds' magic held this isle together, and held its creatures together too, and as it fades, some of them lose themselves. The beasts turn strange, and the hungry ones grow hungrier, and even a spirit's mate is not spared. She is still Ur'endra in shape, but nothing in her eyes knows me." },
      },
      choices = {
        { text = "What would you have done for her?", next = "mercy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mercy = {
      big = true,
      lines = {
        { id = "me_default", text = "I would have her suffering ended, and I cannot do it myself. I have asked it of the young ones who learn my shape, for there is no strength in the bear's way that does not also know mercy. Tell me, child: is it mercy to end a life that has lost itself, or should one wait for it to return?" },
      },
      choices = {
        { text = "End it. Suffering with no way back is no life.", next = "BACK", reply = "You speak as one who has seen suffering, child. Go gently, if you go.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Wait. Nobody should decide another's life is spent.", next = "BACK", reply = "That is the hope I cling to as well, and it has grown very thin. I will wait a little longer, then.", fx = { affinity = -1, align = { light = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cubs = {
      lines = {
        { id = "cu_default", text = "Dead, in the cave beside their mother. I will not tell you how, because the bear does not keep that memory where it can be easily reached. They were small and loud and always hungry, and now the cave is quiet, and quiet is not a sound a bear ever wanted to hear." },
      },
      choices = {
        { text = "(Sit with him in silence a while.)", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcat = {
      lines = {
        { id = "xc_default", text = "The shape of Saeyleenan, the Great Windborne Cat, sleek and quick, and it suits you, though I'd not tell the cat I said so. The cat teaches you when to strike and the bear teaches you when to stand, and a druid who knows only one of those will not live to learn the other." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    winds = {
      lines = {
        { id = "wi_default", text = "No. The wind spirits and I shared this sky a long, long time, and I never once heard them say goodbye. One season they were in every gust, and the next season the gusts were only air, and the bear does not know why, and that troubles the bear more than it can say." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    teachers = {
      lines = {
        { id = "te_default", text = "There are other great spirits of this sky, older than your people's coming. Saeyleenan, the Great Windborne Cat, teaches cunning where I teach endurance, and there are others for the feather and the branch, though they are harder to find now than they were." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xlearn = {
      lines = {
        { id = "xl_default", text = "My shape is not given; it is grown into, the way a cub grows into its paws. You will take it before you are ready, and you will be clumsy in it, and that is how every druid of your people has begun, so don't be ashamed." },
        { id = "xl_quest", when = { questActive = TODO_QUEST("The Great Ursera Spirit") },
          text = "You were sent to me, and I've been expecting you. My shape is not given; it is grown into, the way a cub grows into its paws, so take it, and be clumsy in it, and don't be ashamed." },
        { id = "xl_bear", when = { form = "bear" },
          text = "You have it already, and it sits on you well enough, though you hold your head too high. A bear keeps its head low, to see the ground in front of it, and to show the storm it isn't going anywhere." },
      },
      choices = {
        { text = "I'll wear your shape with care.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnightclaw = {
      lines = {
        { id = "xn_default", text = "I do not know. The Nightclaw kept their own counsel in the shadowed forest, and one year their young simply did not come. I thought perhaps they had found another teacher, and I hoped so, because the other thought was worse." },
      },
      choices = {
        { text = "I'll tell them you remember them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Plant your feet. Let the storm wear itself out. Then go on." } },
    al_aketh = { { id = "tp_aketh", text = "Those who kneel to the storm. The bear does not kneel, and the bear does not run." } },
    _none = { { id = "tp_none", text = "The great bear only blinks at you, slowly. Some things are not a bear's to know." } },
  },
}

---------------------------------------------------------------------------
-- Brother Zendraas: a tailor from Falaath Village who shaved his head and
-- wore the grey robes to survive the Al'Aketh. Designed most of their attire.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_zendraas", id = TODO_NPC("Brother Zendraas"), name = "Brother Zendraas",
  bible = "bibles/zep_wilds.md", role = "vendor", tier = "service",
  communities = { "zephras_isle" }, temper = { "dry", "wary" }, values = { "craft", "survival" },
  notices = { "class", "origin", "kit" },

  impression = {
    first = "He is very proud of the cult robes, which he designed.",
    third = "{name} met Brother Zendraas, a tailor in grey robes who joined the Al'Aketh only to survive and designed most of their clothes.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer. Come and look; I'll knock a little off for you, quietly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_default", text = "Why are you looking at me like that? Expecting lightning?" },
    { id = "g_again", when = { metBefore = true }, text = "You again, and no blade drawn. We're practically friends." },
  },

  notice = {
    { id = "n_alaketh", cat = "origin", when = { origin = "skyborne_former_alaketh" },
      text = "I know that face. You sat three rows behind me at Lorthuna's sermons and fell asleep during the long one. Your hair's grown back nicely." },
    { id = "n_peace", cat = "origin", when = { origin = "skyborne_peacekeeper" },
      text = "A Peacekeeper. Before you reach for anything, I've never hurt a soul; I only sew." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, in robes, saying prayers. You'll get looks on this isle, friend, and I say that as a man in grey robes who also gets looks." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Go on, I can see you deciding whether to run me through, and I'd hardly blame you. But not every one of us in grey is a zealot, whatever the ones shouting about the Windlord on the road would have you think. I'm a tailor, that's all, in a very well-made robe." },
      },
      again = {
        { id = "h_again", text = "What else? I've hems to finish." },
        { id = "h_again2", text = "Ask, then. Nobody else talks to me without shouting." },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Most cultists try to kill me on sight. Why don't you?", next = "story" },
        { text = "What trade do you ply for the cult?", next = "trade" },
        { text = "What do you make of Lorthuna?", next = "lorthuna" },
        { text = "I wore the grey robes too, Zendraas.", next = "xalaketh", when = { origin = "skyborne_former_alaketh" } },
        { text = "Farewell, Brother.", next = "END" },
      },
    },
    story = {
      lines = {
        { id = "st_default", text = "There's not much to it. I was a tailor in Falaath Village when the cult came, and I could tell which way things were blowing, so I took a razor to my head, put on the grey and recited whatever they asked me to. Since then I've kept quiet, sewn what I'm told, and stayed alive." },
      },
      choices = {
        { text = "So you did what you had to.", next = "survive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    survive = {
      big = true,
      lines = {
        { id = "su_default", text = "That's what I tell myself, most nights. The Peacekeepers might call it something else, and so might the families of the people the cult hurt, and I've never quite had the nerve to ask them." },
      },
      choices = {
        { text = "You survived. Nobody has the right to judge that.", next = "BACK", reply = "Thank you, friend. I'll try to believe you, though some nights I can't.", fx = { affinity = 2, align = { honor = -1 }, trait = { kind = 1 } } },
        { text = "You clothed them while they killed. That counts for something.", next = "BACK", reply = "It does, and I'll carry it for the rest of my days. Thank you for being honest with me.", fx = { affinity = -2, align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = {
        { id = "tr_default", text = "I'm a tailor, and I've more Al'Aketh garments piled up here than the cult has members left to wear them. Windstones will buy you any of them, and whatever you think of the cult's wits, you'll have to admit they dress well." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "The cult has style?", next = "style" },
        { text = "Something else.", next = "BACK" },
      },
    },
    style = {
      lines = {
        { id = "sy_default", text = "Well, I have, since I designed most of what they wear. The cut, the drape, the way the hood falls when someone calls down lightning: all mine. It's the best work I've ever done, and I'm never allowed to tell anyone, so thank you for asking." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lorthuna = {
      lines = {
        { id = "lo_default", text = "A crackpot, between you and me, and I'll deny I said it if anyone in grey asks. She talks about the Windlord as if he'd sent her a letter, and the people around her nod along because the alternative is a lightning bolt." },
        { id = "lo_done", when = { questDone = TODO_QUEST("Confront Lorthuna") },
          text = "Struck into the sky, I'm told, by the very thing she was praying to. I'd laugh, but I've a feeling half the robes I sewed went with her, and I'll never see that stitching again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xalaketh = {
      lines = {
        { id = "xa_default", text = "I know you did; I sewed the seams on yours. You've walked away from it, and I'm still standing here in grey, so tell me, is there anything on the other side worth leaving for?" },
      },
      choices = {
        { text = "There is. Take off the robes, Zendraas.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Not much. Stay where it's safe.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    al_aketh = { { id = "tp_aketh", text = "Not all of us are zealots. Some of us just liked having a roof and no lightning bolts aimed at it." } },
    windstones = { { id = "tp_stones", text = "Windstones, yes, that's my price. Robes for windstones, and everyone goes home dressed." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I mostly hear sermons and the sound of my own needle." } },
  },
}

---------------------------------------------------------------------------
-- Raan Wildwind: a Skyborne adventurer camped on the road to Shen'dar
-- Village. Teaches the young how to make camp and rest by a fire.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_raan", id = TODO_NPC("Raan Wildwind"), name = "Raan Wildwind", title = "Adventurer",
  bible = "bibles/zep_wilds.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "jovial", "easy" }, values = { "freedom", "craft" },
  notices = { "class", "race", "kin" },

  impression = {
    first = "He has found a little fortune and glory and liked both.",
    third = "{name} met Raan Wildwind, an adventurer camped on the road to Shen'dar Village who teaches the young how to make camp.",
  },

  greetings = {
    { id = "g_default", text = "Well met! Pull up a log; the fire's warm." },
    { id = "g_camping", when = { camping = true }, text = "You've got your own fire going, I see. Now you're an adventurer." },
    { id = "g_outdoors", tags = { "news" }, when = { questActive = TODO_QUEST("The Great Outdoors") }, text = "Sit near the fire and soak it in. Give it a few minutes; you'll feel it." },
  },

  notice = {
    { id = "n_young", cat = "kin", when = { race = "Skyborne", maxLevel = 6 },
      text = "Elder Aetheen sent you, didn't she? She sends me the ones with that look about them, the restless one. I had it too, and it never went away." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I hear your people can make camp in a snowdrift with nothing but a hammer and a sour temper. Teach me that one before you go." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the tauren! The Windshapers say your people live in tents half the year. I'll wager you know more about camping than I ever will." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dd_queen", when = { questDone = TODO_QUEST("The Cirrusfly Queen") },
          text = "Elatrell says you took down the cirrusfly queen in the grove. Good riddance; her children ate clean through my best bedroll last spring, and I've been sleeping on a cloak ever since." },
        { id = "h_dd_grown", when = { metBefore = true, levelsSince = 5 },
          text = "Look at you! You've grown since we last spoke; you walk like somebody who's slept under the open sky and woken up glad of it." },
        { id = "h_default", key = true, text = "Raan Wildwind, at your service. You've got that itch in your boots, I can tell, the one that sends a body out past the last village looking for gold and a good story. If you mean to live long enough to find either, you'll need to know how to look after yourself in the wilds, and I can show you." },
        { id = "h_adventurer", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "Well met! More and more of you young ones are leaving the grove to seek your fortunes, and somebody has to show you how to sleep outdoors without waking up in a cirrusfly nest." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Great Outdoors") },
          text = "You've got the basics now. Go into Shen'dar Village and learn a trade from the trainers there, because every trade has something it can add to a camp, and they'll show you what yours is." },
      },
      again = {
        { id = "h_again", text = "What else? The fire's not going anywhere." },
        { id = "h_again2", text = "Ask away. I like having company out here." },
      },
      choices = {
        { text = "How do I make a camp of my own?", next = "camp" },
        { text = "Why are so many young ones leaving the grove?", next = "restless" },
        { text = "What's the road ahead like?", next = "road" },
        { text = "I've made camp in stranger places than this.", next = "xoutsider", when = { ["not"] = { race = "Skyborne" } } },
        { text = "Winds be with you, Raan.", next = "END" },
      },
    },
    camp = {
      lines = {
        { id = "ca_default", text = "It starts with a fire, a plain one, and a cook can show you how to build it. After that you can set things up around it, and that tent behind me is one of them; a good enough leatherworker can stitch you one just like it." },
      },
      choices = {
        { text = "What other fixtures are there?", next = "fixtures", fx = { learn = { "camping" } } },
        { text = "What's the point of it all?", next = "rest", fx = { learn = { "camping" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fixtures = {
      lines = {
        { id = "fi_default", text = "Whatever trade you take up, there's something it can add, and that goes for the fishermen as much as anyone. The trainers in a village will show you what your trade puts beside a fire, and before long yours will be the most comfortable spot on the road." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rest = {
      lines = {
        { id = "re_default", text = "Rest, and the good kind. Sit by the fire for a few minutes and you'll get up stronger for the road, and if you linger a while by a tent like mine, you'll carry a little more away with you. Tired adventurers make mistakes, and rested ones live to tell about them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    restless = {
      lines = {
        { id = "rs_default", text = "Because the isle's coming apart and the young can feel it, and some of them would rather go and do something than sit at home and wait. The grove's safe enough, but there's a whole world past it, and some of us were never made for safe." },
      },
      choices = {
        { text = "Is it fortune you're after, or something more?", next = "glory" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glory = {
      big = true,
      lines = {
        { id = "gl_default", text = "I'll be honest, a bit of fortune wouldn't go amiss, and a bit of glory never hurt anyone either. But I've met adventurers who wander for the joy of it and adventurers who wander to bring something home, and I've never decided which kind I am." },
      },
      choices = {
        { text = "For the joy of it, mostly. I like the road.", next = "BACK", reply = "That's what I'd like to say, and most days I mean it. Sit down, the fire's warm.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "To bring something home. The isle needs us.", next = "BACK", reply = "That's the better reason, I'll admit, and the one I'd like to be true. Come back with something.", fx = { affinity = 1, align = { order = 1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "ro_default", text = "Shen'dar Village is just down the way, with an inn, trainers and Constable Aonda keeping order. Past it, mind the bandits in the lowlands and the grey robes near the old temple ruins, and if you see Hanaa Nightwind at her post on the road, tell her Raan says hello." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xoutsider = {
      lines = {
        { id = "xo_default", text = "I don't doubt it, and I'd love to hear them all. Tell me, what's the worst night you ever spent under the stars down there?" },
      },
      choices = {
        { text = "In the rain, with a wolf pack circling.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'd rather not talk about it.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    camping = { { id = "tp_camp", text = "A campfire first, then whatever your trade can add to it, and then sit down and let it work on you.", next = "camp" } },
    advice = { { id = "tp_ad", text = "A well-rested adventurer has a much better chance than a tired one. Sit by the fire when you can." } },
    al_aketh = { { id = "tp_aketh", text = "I give the grey robes a wide berth, and I'd advise you to do the same until you're good and ready for them." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. I know fires and roads and not much else." } },
  },
}

---------------------------------------------------------------------------
-- Genn Fairweather: stablemaster and riding trainer at Fairweather Stables.
-- (Wiki: teaches riding, sells galestriders; quests Learning to Ride, Swift
-- as the Wind, Your First Riding Galestrider; kin Fenn and Tenn Fairweather.)
---------------------------------------------------------------------------
P:NPC {
  key = "zep_genn", id = TODO_NPC("Genn Fairweather"), name = "Genn Fairweather", title = "Stablemaster and Riding Trainer",
  role = "stablemaster", tier = "quest",
  communities = { "zephras_isle" }, temper = { "easygoing", "proud" }, values = { "family", "craft" },
  notices = { "class", "race" },

  impression = {
    first = "He talks about his galestriders the way other men talk about their children.",
    third = "{name} met Genn Fairweather, who keeps Fairweather Stables and teaches riding on Zephras.",
  },

  greetings = {
    { id = "g_default", text = "Gale's greetings, and welcome to Fairweather Stables! Mind the young ones, they nip." },
    { id = "g_again", when = { metBefore = true }, text = "Back again, {name}! The galestriders remember you, I'm sure of it." },
    { id = "g_active", when = { questActive = TODO_QUEST("Learning to Ride") }, text = "Ready for your lesson? Sit tall, and don't grip with your knees." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, so you'll have a beast of your own. Keep it clear of the paddock, because my galestriders spook at anything that growls." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Winds above, I'll need my sturdiest galestrider for you, friend, and possibly two." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Genn Fairweather, and these are the Fairweather Stables, three generations of us raising galestriders on the best grass on the isle. If you want to learn to ride, there's no better teacher on Zephras, and I'll say that to anyone's face." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Your First Riding Galestrider") },
          text = "There's my rider! How's your galestrider taking to you? Be patient with it, because they decide whom they trust, and it takes a little while." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? I could talk galestriders till sunset." },
        { id = "h_again2", text = "Ask away, I'm only mucking out." },
      },
      choices = {
        { text = "Teach me to ride.", next = "BUSINESS" },
        { text = "What exactly is a galestrider?", next = "galestrider" },
        { text = "Three generations? Tell me about the family.", next = "family" },
        { text = "Which galestrider should I choose?", next = "choose" },
        { text = "These beasts look well kept, despite the hard times.", next = "times" },
        { text = "I ride a beast of my own. Any advice?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Where do your galestriders go, once sold?", next = "sold" },
        { text = "How's my lesson going?", next = "xlesson", when = { questActive = TODO_QUEST("Learning to Ride") } },
        { text = "Why ride at all, when we can glide on the wind?", next = "xglide", when = { race = "Skyborne" } },
        { text = "A wolf would run rings round your galestriders.", next = "xorc", when = { race = "Orc" } },
        { text = "My people ride nightsabers.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Winds be with you, Genn.", next = "END" },
      },
    },
    galestrider = {
      lines = { { id = "ga_default", text = "The finest mount there is, swift and sure-footed and light as the wind they're named for. They were bred here when the spirits still walked Zephras, or so my grandfather said, and they've never been happy anywhere the air is still." } },
      choices = {
        { text = "Can they fly?", next = "galestrider2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    galestrider2 = {
      lines = { { id = "g2_default", text = "No, though you'd swear they're trying when they hit a full gallop. I've had more than one rider swear they left the ground, and I never correct them, because it's good for business." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    family = {
      lines = { { id = "fa_default", text = "Fenn and Tenn are my kin, and between the three of us we've got the feeding, the breaking and the shouting covered. I'll leave you to guess which of those I do." } },
      choices = {
        { text = "The shouting, surely.", next = "family2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family2 = {
      lines = { { id = "f2_default", text = "Ha! You'd think so, but I'm the soft one. The shouting's for whichever of them let a gate swing open, and somehow it's never me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    choose = {
      lines = { { id = "ch_default", text = "Empyrean if you like to be looked at, Stormy if you like a bit of spirit, and Umber if you want one that will still be standing when the others have bolted. When you've some coin behind you, the swift ones are worth every windstone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    times = {
      big = true,
      lines = { { id = "ti_default", text = "They are, and it costs me. Feed's dearer every season, and some of the young ones I raise end up carrying riders off the isle for good, which breaks my heart a little each time." } },
      choices = {
        { text = "Then keep the best ones here. Zephras needs them.", next = "BACK", reply = "Spoken like a true islander. I'll think on it, though my purse won't like it.", fx = { align = { order = 1 } } },
        { text = "Let them go. They'll carry our people somewhere new.", next = "BACK", reply = "That's a kinder way to see it, and I'll try. Winds carry them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xh_default", text = "Ride upwind of it when you can, and let the galestrider get a good long sniff before you ask it to share a road. They're brave beasts, but they've long memories for anything with teeth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sold = {
      lines = { { id = "so_default", text = "All over Zephras, for the Peacekeepers and the Rangers and anyone with the coin. And lately onto the skycutters, to Dalaran and to Mulgore, which means some of mine have seen more of the world than I have." } },
      choices = {
        { text = "Does that bother you?", next = "sold2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sold2 = {
      lines = { { id = "s2_default", text = "It does and it doesn't. A galestrider's no good standing in a paddock, and they were bred to run, but I raised every one of them from a wobbly foal, and I'd like to know who's brushing them now." } },
      choices = {
        { text = "Do you sell to outsiders as well?", next = "sold3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sold3 = {
      big = true,
      lines = { { id = "s3_default", text = "That's what Fenn and Tenn and I argue about over supper. Fenn says a galestrider is a shen'dorei thing and ought to stay with our people, and Tenn says a good rider is a good rider wherever they're from. What do you say?" } },
      choices = {
        { text = "Keep them for our own people. They're part of who we are.", next = "BACK", reply = "Fenn will be pleased to hear it. I'm not sure I am, but I'll pass it on.", fx = { align = { order = 1 } } },
        { text = "Sell to anyone who'll treat them well.", next = "BACK", reply = "Tenn's side, and mine, if I'm honest. Thank you, that settles supper.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlesson = {
      lines = { { id = "xl_default", text = "Better than most, and that's the truth. You sit like you're afraid it'll bolt, which it won't, and the beast can feel it through the saddle, so breathe out and let your shoulders drop." } },
      choices = {
        { text = "What if it does bolt?", next = "xlesson2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlesson2 = {
      lines = { { id = "x2_default", text = "Then hold on and steer it uphill, because nothing tires a galestrider like a slope. I've chased plenty of runaways across this isle, and every one of them stopped at the top of a hill looking very pleased with itself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xglide = {
      lines = { { id = "xg_default", text = "Because walking on air will carry you off a ledge, not across the isle! The wind's a fine thing for a short step, but a galestrider will take you from here to Valanaar without your legs complaining once." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xorc = {
      lines = { { id = "xo_default", text = "Over a short sprint, maybe, and I'd like to see it. But a galestrider will go all day on a mouthful of grass, and I've never heard of a wolf that would carry you without wanting a share of the supper." } },
      choices = {
        { text = "A wolf is a partner, not a beast of burden.", next = "BACK", reply = "Then we're not so different, you and I. That's how I see mine.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = { { id = "xn_default", text = "Great cats, I've heard, as tall at the shoulder as a galestrider. I'd love to see one, though I suspect my young ones would take one look and run straight off the edge of the isle." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Sit tall, breathe out, and let the beast do the running. That's riding and most of life besides." } },
    two_orders = { { id = "tp_orders", text = "I sell to both orders, and so far nobody's asked my galestriders which they prefer." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. If it hasn't got four hooves, I'm the wrong man to ask." } },
  },
}

---------------------------------------------------------------------------
-- Baelann Swiftcurrent: fisher on Zephras Isle. (Wiki: vendor, exact spot
-- not given.) Patient, wry; fishes streams that run off the island's edge.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_baelann", id = TODO_NPC("Baelann Swiftcurrent"), name = "Baelann Swiftcurrent", title = "Fisher",
  role = "vendor", tier = "service",
  communities = { "zephras_isle" }, temper = { "patient", "dry" }, values = { "craft", "prudence" },
  notices = { "craft" },

  impression = {
    first = "He doesn't look up from his line, but he answers you all the same.",
    third = "{name} met Baelann Swiftcurrent, a fisher of Zephras Isle.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_default", text = "Gale's greetings. Keep your voice down, the fish are listening." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = { "Fishing" } },
      text = "You've a fisher's patience about you. Good, because it's the only bait that never runs out." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Baelann Swiftcurrent. I fish, and I sell what a fisher needs, and if you're willing to sit still and say nothing for an hour, I'll show you how it's done." },
      },
      again = { { id = "h_again", text = "Something more? Quietly, now." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Where do the fish even come from, up here?", next = "fish" },
        { text = "Fishing seems a peaceful life.", next = "peace" },
        { text = "What's the biggest fish you've ever caught?", next = "big" },
        { text = "Have the streams changed, with the isle drifting?", next = "streams" },
        { text = "Will you ever leave Zephras?", next = "leave" },
        { text = "I've fished the waters below the clouds.", next = "xbelow", when = { ["not"] = { race = "Skyborne" } } },
        { text = "On the Echo Isles, we fish with spears, mon.", next = "xtroll", when = { race = "Troll" } },
        { text = "Good fishing, Baelann.", next = "END" },
      },
    },
    fish = {
      lines = { { id = "fi_default", text = "The same place we do, I expect, carried up with the isle long ago. The streams run clear off the edges, and the fish that stay in them are the clever ones, so you need to be cleverer." } },
      choices = {
        { text = "What happens to the ones that go over?", next = "fish2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish2 = {
      lines = { { id = "f2_default", text = "They see the world below the clouds before any of us do. I like to think a few of them land somewhere pleasant, though I've never been brave enough to follow and find out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    peace = {
      big = true,
      lines = { { id = "pe_default", text = "It is, and that's why I keep at it. Everyone else is choosing between the orders or chasing cultists, and I'd rather sit by the water and feed my neighbours, though some call that hiding." } },
      choices = {
        { text = "Feeding people is its own duty. Keep at it.", next = "BACK", reply = "Thank you. I'll tell that to the next peacekeeper who sneers at my rod.", fx = { align = { order = 1 } } },
        { text = "It is hiding, and the isle needs every hand.", next = "BACK", reply = "Maybe so. But hungry hands don't fight well either.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    big = {
      lines = { { id = "bi_default", text = "Now there's a question every fisher lies about. Mine was a silver-backed thing as long as my arm, caught right at the lip of a fall, with half its body already over the edge." } },
      choices = {
        { text = "How did you land it?", next = "big2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    big2 = {
      lines = { { id = "b2_default", text = "I didn't, if I'm honest. I held it for a long moment with the line singing, and then I had to choose between the fish and following it off the isle, and I let go." } },
      choices = {
        { text = "Do you regret it?", next = "big3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    big3 = {
      lines = { { id = "b3_default", text = "Every day, and not at all. It was the best fight I ever had, and nobody can say I made it up, because nobody believes me anyway. That's the trouble with honest fish stories." } },
      choices = { { text = "I believe you.", next = "BACK", reply = "Then you're either kind or foolish. I'll take either.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    streams = {
      lines = { { id = "st_default", text = "They have. A stream I fished as a boy now runs off an edge that wasn't there, because the land it used to cross drifted away. The fish didn't know what to make of it, and neither did I." } },
      choices = {
        { text = "What should be done about the drifting?", next = "streams2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    streams2 = {
      big = true,
      lines = { { id = "s2_default", text = "Everyone asks a fisher that as though I'd know. The High Order wants to bind the pieces together with magic, and the Windshapers want to win back the spirits' favour, and I just want my stream back where it was." } },
      choices = {
        { text = "Mend it with magic. We can't wait on spirits.", next = "BACK", reply = "Maybe so. As long as somebody mends it before my next stream goes over.", fx = { align = { order = 1 } } },
        { text = "Make peace with the spirits first. Magic got us here.", next = "BACK", reply = "My father would have agreed. He talked to the water every morning, and I used to laugh at him.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave = {
      lines = { { id = "le_default", text = "I'm too old and too fond of my rock. The young ones go, and I sell them hooks for the journey, and I tell them the world below is full of fish that have never seen a shen'dorei and won't know to be clever." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbelow = {
      lines = { { id = "xb_default", text = "Have you, now? Then tell me something true, because I've wondered for years. Are the fish down there bigger than ours?" } },
      choices = {
        { text = "Much bigger. And some of them bite back.", next = "BACK", reply = "Then I'm glad I stayed up here. A fish should know its place.", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "About the same, but far more of them.", next = "BACK", reply = "More of them. Now that's a thought to keep a fisher up at night.", fx = { affinity = 1 } },
      },
    },
    xtroll = {
      lines = { { id = "xt_default", text = "Spears, is it? I'd like to see that, though I'd wager you'd miss more than you'd think, because the fish up here are cleverer than they look. You'll have to come back and show me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    two_orders = { { id = "tp_orders", text = "Both orders eat fish. That's all I need to know about them." } },
    _none = { { id = "tp_none", text = "Couldn't say. The water doesn't gossip." } },
  },
}

---------------------------------------------------------------------------
-- The Strange Hermit: a gnome engineer living rough in Shadowgale Forest (the wiki's infobox says
-- "Shadowglade"). Quests: Camping 101: Engineering, Free the Hollows, The Forest's Bounty,
-- The Strange Hermit. Quest text isn't captured, so how he reached a floating island stays his
-- own vague, cheerful mystery rather than an invented backstory.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_strange_hermit", id = TODO_NPC("Strange Hermit"), name = "Strange Hermit",
  bible = "bibles/zep_wilds.md", role = "questgiver", tier = "major",
  communities = { "zephras_isle" }, temper = { "excitable", "eccentric" }, values = { "invention", "solitude" },
  notices = { "race", "class", "profession" },

  impression = {
    first = "A gnome in a patched coat, living alone in a haunted forest on an island in the sky, and perfectly delighted about it.",
    third = "{name} met the Strange Hermit, a gnome engineer camped deep in Shadowgale Forest who won't say how he got there.",
  },

  greetings = {
    { id = "g_default", text = "Oh! A visitor! Mind the tripwire, it's attached to a kettle, and the kettle is attached to something I'd rather not set off." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still in one piece! That puts you well ahead of my last three prototypes." },
    { id = "g_found", when = { questActive = TODO_QUEST("The Strange Hermit") }, text = "Somebody sent you looking for me? How flattering, and how worrying, because I thought I'd hidden the camp rather well." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Up here! Oh, this is marvellous, I haven't heard a proper Gnomeregan vowel in ages, so say something technical, anything at all." },
    { id = "n_eng", cat = "profession", when = { profession = "Engineering" },
      text = "Is that a wrench on your belt? A fellow engineer, out here in the wilds, and I've got so much to show you." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Welcome to my camp, which is also my workshop, my laboratory and, on rainy nights, my bed. Folk call me the Strange Hermit, and I've decided to take that as a compliment." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "One of the feathered folk from the villages! You're the first to come this far into the forest in a while, because most of your people think the trees here are haunted, and frankly they're not wrong." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Engineering") },
          text = "You've come to learn camp engineering! Splendid, because a campfire is just a fire until someone clever bolts something useful onto it." },
        { id = "h_hollows", tags = { "news" }, when = { questActive = TODO_QUEST("Free the Hollows") },
          text = "Have you seen them yet, the hollowed ones? Something in this forest has them trapped, and I can't bear the way they drift about, so please be quick." },
        { id = "h_bounty", tags = { "news" }, when = { questActive = TODO_QUEST("The Forest's Bounty") },
          text = "Back with the forest's bounty, or still looking? The woods are stingy with the good bits, though generous with the teeth." },
        { id = "h_freed", when = { questDone = TODO_QUEST("Free the Hollows") },
          text = "The forest feels lighter since you freed the hollows, and I can hear birds again in the mornings. I'd forgotten I liked birds." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, before I get distracted by something shiny, which happens about every forty seconds." },
        { id = "h_again2", text = "Go on, go on, I'm listening with at least sixty percent of my attention." },
      },
      choices = {
        { text = "How does a gnome end up on a floating island?", next = "arrive" },
        { text = "Why live alone out here?", next = "alone" },
        { text = "Something's wrong with this forest.", next = "forest" },
        { text = "What are you building?", next = "build" },
        { text = "Teach me to engineer a proper camp.", next = "camp", when = { profession = "Engineering" } },
        { text = "Gnomeregan fell. Did you know?", next = "xgnome", when = { race = "Gnome" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    arrive = {
      lines = {
        { id = "ar_default", text = "That is a long story with a great many explosions in it, and I've told it so many different ways that I'm no longer sure which one is true. Let's say I came up, and the coming down part hasn't been sorted yet." },
      },
      choices = {
        { text = "You're dodging the question.", next = "arrive_dodge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    arrive_dodge = {
      big = true,
      lines = {
        { id = "ad_default", text = "I am, aren't I, and rather well too. Some of us leave home because home asks too many questions, my friend, and a hermit who answers them all isn't much of a hermit." },
      },
      choices = {
        { text = "Fair enough. Everyone's owed their secrets.", next = "BACK", reply = "Precisely! You'd make a fine hermit yourself, if you ever want the job.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "The elders deserve to know who's living on their island.", next = "BACK", reply = "And they're welcome to visit, though they'll have to step over the kettle like everyone else.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    alone = {
      lines = {
        { id = "al_default", text = "Because nobody out here tells me my inventions are dangerous, mostly because nobody is out here. It's very good for productivity, and only slightly bad for conversation." },
      },
      choices = {
        { text = "You seem awfully glad of the company.", next = "alone_company" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone_company = {
      lines = {
        { id = "ac_default", text = "Well, yes, I suppose I am, so don't tell anyone in the villages or they'll all come out here at once. A visitor now and then is lovely, but forty visitors is a crowd, and crowds touch things." },
      },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },

    forest = {
      lines = {
        { id = "fo_default", text = "You've noticed! Most don't. The shadows here sit too thick for the time of day, and there are spirits drifting between the trees that look scooped out, like empty shells of what they ought to be." },
      },
      choices = {
        { text = "The hollows. What are they?", next = "forest_hollows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forest_hollows = {
      lines = {
        { id = "fh_default", text = "I've measured them, and I don't understand them, which is my least favourite combination. They act trapped, held here by something, and whatever holds them doesn't want them to leave." },
      },
      choices = {
        { text = "Then we free them, whatever it takes.", next = "forest_choice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forest_choice = {
      big = true,
      lines = {
        { id = "fc_default", text = "That's the spirit, if you'll excuse the expression. But be careful, because I've no idea what's on the other end of whatever's holding them, and I'd like you back for tea." },
      },
      choices = {
        { text = "They suffer. Freeing them is simply right.", next = "BACK", reply = "Yes, I think so too, though I couldn't have proved it with an instrument.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I'll do it, but for what you can teach me.", next = "BACK", reply = "Ha! An honest bargain, and I've plenty of knowledge going spare.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    build = {
      lines = {
        { id = "bu_default", text = "A little of everything, out of whatever the forest provides, because there's no Tinker Town up here to buy sprockets from. That's why I need the forest's bounty, you see: wood, sap, odd bits that grow here and nowhere else." },
      },
      choices = {
        { text = "Does any of it actually work?", next = "build_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    build_work = {
      lines = {
        { id = "bw_default", text = "About thirty-eight percent of it works, and another twenty percent works in ways I didn't intend, which I count as a bonus. The rest makes a very satisfying noise." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    camp = {
      lines = {
        { id = "ca_default", text = "Any fool can light a fire, but an engineer makes the fire work for a living. Lanterns, a proper anvil stand, a little gadget to keep the kettle hot, and suddenly your camp is a workshop with a sky for a roof." },
      },
      choices = {
        { text = "That's all? It sounds simple.", next = "BACK", reply = "Simple's only the first bolt, friend. Raise your skill and the furnishings get grander." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "I knew. Word travels even up here, if slowly. I try not to think about it too much, because when I do I can't build anything, and building is the only thing that's ever helped." },
      },
      choices = {
        { text = "We'll take it back from Thermaplugg one day.", next = "BACK", reply = "I'd like to see that, I truly would. Send me a letter, if letters reach the sky.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Some things are better left behind.", next = "BACK", reply = "Maybe so. That's what I told myself, at least, the day I left.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gn", text = "Home, once. I don't talk about it before supper, or after, or much at all really." } },
    _none = { { id = "tp_none", text = "Haven't a clue, but give me a week and a box of parts and I'll have a theory, probably an explosive one." } },
  },
}
