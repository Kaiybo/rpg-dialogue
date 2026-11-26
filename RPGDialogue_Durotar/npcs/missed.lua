-- Durotar folk the roster scan found missing, part one: the Den's Nartok (warlocks), Rwag (rogues) and
-- Hraug (demon grimoires), the Valley of Trials' Huklah (cloth and leather) and Rarc (armor and shields),
-- and Razor Hill's Magga (voucher keeper), Ophek (Gan'rul's messenger), Rawrk (bandages) and the wounded
-- Grunt Kor'ja on the south road. Voices: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Magga: Razor Hill; takes the gift vouchers some newcomers carry.
P:NPC {
  key = "magga", id = TODO_NPC("Magga"), name = "Magga", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "razor_hill" }, temper = { "warm", "curious" }, values = { "welcome" },
  notices = { "pet" },
  impression = {
    first = "Magga stands in Razor Hill and greets newcomers as though each one were expected. A few of them arrive carrying a voucher with her name on it, and she keeps a basket of small, strange creatures for those few.",
    third = "{name} met Magga of Razor Hill, who greets newcomers and trades vouchers for small companions.",
  },
  greetings = {
    { id = "g_default", text = "Hello, {class}! It's a pleasure to see a new face come up the road in one piece." },
    { id = "g_voucher", when = { questActive = TODO_QUEST("Welcome!") }, text = "Hello! Is that a voucher I see in your pack? Bring it here, because I've been keeping something for whoever carried it." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again. Razor Hill's a little less dusty with you in it." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER" },
      text = "A hunter! Please keep your beast clear of my basket, because the little ones in it frighten easily, and one of them bites back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Magga. I welcome the ones who come up from the Valley of Trials, since the grunts are too busy to do it and Gar'Thok only knows how to give orders." } },
      again = {
        { id = "h_again", text = "Was there something more, {class}?" },
        { id = "h_again2", text = "Ask away. Welcoming people is the whole of my day." },
      },
      choices = {
        { text = "What's in the basket?", next = "basket" },
        { text = "What should a newcomer know about Razor Hill?", next = "town" },
        { text = "How long have you welcomed newcomers?", next = "ylong" },
        { text = "Where did the creatures come from?", next = "ycreatures" },
        { text = "What do you think of the young ones?", next = "yyoung" },
        { text = "I came through the Valley too.", next = "yorc", when = { race = "Orc" } },
        { text = "I'm glad of the welcome. Farewell.", next = "END" },
      },
    },
    basket = {
      lines = { { id = "b_default", text = "Small companions, and odd ones, from places I couldn't point to on a map. Some travellers arrive with a voucher that entitles them to choose one, and all I do is keep the creatures fed until the right hand comes along." } },
      choices = {
        { text = "Odd in what way?", next = "odd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    odd = {
      lines = { { id = "o_default", text = "One is a fat little bear that's black and white like a painted shield, and it eats nothing but reeds. Another has more teeth than body and runs in circles until it falls over, and I won't tell you about the third, because it looks at me." } },
      choices = { { text = "I'd leave the third one be. Something else.", next = "BACK" } },
    },
    town = {
      lines = { { id = "t_default", text = "Sleep at Grosk's inn, and listen to Gar'Thok even when he shouts. Don't go east to Tiragarde Keep alone either, because the humans there are Proudmoore's leftovers and they've nowhere to run, which makes them fight harder." } },
      choices = { { text = "Good counsel. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ylong = {
      lines = {
        { id = "yylong_d", text = "Since the first young ones came up from the Valley. Gar'Thok said somebody should, and he looked at me, and I didn't say no fast enough. I've never regretted it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ycreatures = {
      lines = {
        { id = "yycreatures_d", text = "Some of them come from the goblins in Ratchet, and some from a strange old troll in Sen'jin who won't say where he found them. I ask no questions. They're small and they don't bite, mostly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yyoung = {
      lines = {
        { id = "yyyoung_d", text = "They're brave and loud and foolish, and some of them die too soon. I tell them to be careful, and they never listen. Some say we should send them out to fight young, to make them strong. Others say we should keep them home a little longer." },
      },
      choices = {
        { text = "Send them out. They learn by fighting.", next = "BACK", reply = "That is Gar'Thok's view. He was young once too.", fx = { align = { honor = -1 } } },
        { text = "Keep them home. Teach them first.", next = "BACK", reply = "I agree. Though they never listen to me.", fx = { align = { honor = 1 } } },
      },
    },
    yorc = {
      lines = {
        { id = "yyorc_v0", when = { race = "Orc" }, text = "You came up through the Valley yourself, I think. You have the look. Welcome home, and come back if you need a meal or a friendly face." },
        { id = "yyorc_d", text = "You came up through the Valley yourself, I think. You have the look. Welcome home, then, and come back if you need a meal or a friendly face." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gar_thok = { { id = "ytp_gar_thok", text = "Gar'Thok gives orders and I give welcomes. We each do the job we're good at." } },
    valley_of_trials = { { id = "ytp_valley_of_trials", text = "The Valley of Trials is where the young ones learn. I wish it taught them caution." } },
    background = { { id = "tp_bg", text = "I came to Durotar with the first wagons and I've been greeting the later ones ever since." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that, {class}. Ask at the barracks, and smile when you do, because it confuses them." } },
  },
}

-- Grunt Kor'ja: wounded on the road just south of Razor Hill.
P:NPC {
  key = "grunt_korja", id = TODO_NPC("Grunt Kor'ja"), name = "Grunt Kor'ja", gender = "female",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "razor_hill" }, temper = { "stubborn", "proud" }, values = { "duty", "honor" },
  notices = { "class" },
  impression = {
    first = "Grunt Kor'ja holds the road just south of Razor Hill with one arm bound against her side and blood dried down her leg. She took the wounds from Tiragarde's marines, and she plainly intends to go back for more.",
    third = "{name} met Grunt Kor'ja, wounded on the road south of Razor Hill and still at her post.",
  },
  greetings = {
    { id = "g_default", text = "Keep walking, {class}, and don't stare. I've had worse than this and so has the other side." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "A priest, and not before time. I won't ask for it twice, but I wouldn't turn away your help either." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I'm still standing, in case you came to check." },
  },
  notice = {
    { id = "n_healer", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "You've a healer's look, but Tai'jin said she'd send one of her own, so I'll wait for that. A grunt takes her orders as they're given, even the kind ones." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_garm", when = { questActive = TODO_QUEST("Garments of Spirituality") },
          text = "Tai'jin sent you, then. Do what you came to do, priest, and be quick, because the humans won't wait politely while you pray over me." },
        { id = "h_default", text = "Grunt Kor'ja, Razor Hill. This is my stretch of road, and a few holes in me don't change whose it is." },
      },
      again = {
        { id = "h_again", text = "What else? Make it short, because I'm watching the road." },
        { id = "h_again2", text = "Speak, {class}." },
      },
      choices = {
        { text = "Who did that to you?", next = "who" },
        { text = "You should be in the barracks, not on the road.", next = "barracks" },
        { text = "How many marines did you face?", next = "ymany" },
        { text = "What will you do when you heal?", next = "yheal" },
        { text = "Why not let others fight for a while?", next = "yrest" },
        { text = "A troll priest sent me. Are you friends?", next = "ytaijin" },
        { text = "Hold fast, grunt.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "A patrol out of Tiragarde Keep, four of Proudmoore's old marines who came up the gully thinking the road was unwatched. I put two of them down and the other two ran, though not before they'd left me these to remember them by." } },
      choices = {
        { text = "Why do they still fight? Their admiral is dead.", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because they've no ship to leave on and no orders to stop. I almost respect it, {class}, since I'd do the same in their place, but respect has never yet stopped me from killing a man." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    barracks = {
      lines = { { id = "b_default", text = "Rawrk would wrap me up and Gar'Thok would put some whelp on my road, and by nightfall the humans would be at the gate. I'll go in when I'm relieved or when I fall over, and I don't plan on falling over." } },
      choices = { { text = "Then I hope you're relieved soon.", next = "BACK", fx = { affinity = 1 } } },
    },
    ymany = {
      lines = {
        { id = "yymany_d", text = "Six, maybe seven. I killed two before the third put a spear through my arm. The rest ran back to the keep. Humans are brave when there are more of them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yheal = {
      lines = {
        { id = "yyheal_d", text = "Go back, and finish what they started. Tiragarde is close, and it should not be there. Every day it stands, the humans think Durotar is theirs to take." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yrest = {
      lines = {
        { id = "yyrest_d", text = "Because if I rest, the humans win another day. A grunt doesn't rest while her blood is still warm. My father fought in the old Horde, and he never rested." },
      },
      choices = {
        { text = "Then rest, and come back stronger.", next = "BACK", reply = "Maybe. But I'll only rest an hour.", fx = { align = { honor = -1 } } },
        { text = "Your courage honours your father.", next = "BACK", reply = "Thank you. I will tell him so, when I see him again.", fx = { align = { honor = 1 } } },
      },
    },
    ytaijin = {
      lines = {
        { id = "yytaijin_v0", when = { class = "PRIEST" }, text = "Tai'jin sent you? Then you're a priest, and she trusts you. Her hands are steady, and so should yours be. I'd trust her with my life, and I have." },
        { id = "yytaijin_d", text = "Tai'jin is a good healer, for a troll. She talks too much, but her hands are steady. I'd trust her with my life, and I have." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    tiragarde_keep = { { id = "ytp_tiragarde_keep", text = "Tiragarde Keep is a human fort on our coast. It shouldn't be there." } },
    razor_hill = { { id = "ytp_razor_hill", text = "Razor Hill is home. I'll defend it till I can't stand." } },
    background = { { id = "tp_bg", text = "I'm a grunt of Razor Hill, and that tells you everything about me worth knowing." } },
    _none = { { id = "tp_none", text = "I watch a road, {class}. Ask me about the road or ask someone else." } },
  },
}
