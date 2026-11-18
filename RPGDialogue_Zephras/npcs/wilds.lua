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
    first = "Urs'endris, the Great Windborne Bear Spirit, speaks slowly from his little isle in the east, and his grief sits on him like weather. He says strength is facing what's wrong inside you as much as what's wrong in the world.",
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Urs'endris. For more generations than your elders can count, the druids of the shen'dorei have come to this place to learn my shape. The strength I teach is not only in the arms and the back; it is in standing firm against what troubles you from outside and what troubles you from within, and that is what it is to wear my shape." },
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
        { id = "me_default", text = "I would have her suffering ended, and I cannot do it myself. I have asked it of the young ones who come to learn my shape, because there is no strength in the bear's way that does not also know mercy. Tell me, child: is it mercy to end a life that has lost itself, or should one wait, in case it finds its way back?" },
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
    first = "Brother Zendraas wears the Al'Aketh's grey robes and says the words, but he's a tailor from Falaath Village who only wanted to live through the cult's occupation. He's very proud of the robes, which he designed.",
    third = "{name} met Brother Zendraas, a tailor in grey robes who joined the Al'Aketh only to survive and designed most of their clothes.",
  },

  greetings = {
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
    first = "Raan Wildwind has a fire going on the road to Shen'dar Village and an adventurer's way of making a camp look like home. He talks about fortune and glory like a man who has found a little of each and liked them.",
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
