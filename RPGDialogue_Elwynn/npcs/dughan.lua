-- Marshal Dughan, Goldshire. Voice: bibles/dughan.md
-- Agenda: keep Goldshire calm with too few guards, so he plays the Defias down.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dughan", id = TODO_NPC("Marshal Dughan"), name = "Marshal Dughan",
  bible = "bibles/dughan.md", role = "questgiver", tier = "major",
  communities = { "goldshire" }, temper = { "proud" }, values = { "stern", "brave" },
  notices = { "reputation", "bounty" },

  greetings = {
    { id = "g_desk", text = "Make it quick. I've half of Elwynn on this desk." },
    { id = "g_liked", when = { townStanding = { town = "goldshire", min = 30 } }, text = "Good to see you. Truly. Don't let it go to your head." },
    { id = "g_distrust", when = { townStanding = { town = "goldshire", max = -20 } }, text = "You. Keep your hands where my guards can see them." },
    { id = "g_mine", when = { questActive = TODO_QUEST("The Fargodeep Mine") }, text = "Fargodeep won't scout itself." },
  },

  notice = {
    { id = "n_bounty", cat = "bounty", place = "before", when = { questReady = TODO_QUEST("WANTED: \"Hogger\"") },
      text = "Is that what I think it is? Put it on the desk. Slowly. I want the guards to see it." },
    { id = "n_town_hero", cat = "reputation", when = { townStanding = { town = "goldshire", min = 55 } },
      text = "Half the town wants to buy you a drink. The other half wants to name a pig after you. I've told them both to wait." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Marshal Dughan. If you've a complaint, take a number. If you've a sword, take a job." },
        { id = "h_from_mcbride", key = true, tags = { "news" }, when = { questRecent = { TODO_QUEST("Report to Goldshire"), days = 2 } },
          text = "McBride's papers. He speaks well of you, which is rare. Don't make him a liar." },
        { id = "q_hogger_before", when = { questBefore = TODO_QUEST("WANTED: \"Hogger\""), band = "Greenhorn" },
          text = "You've seen the poster. Don't go after Hogger alone at your size. He's sent better back on a cart." },
        { id = "q_hogger_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("WANTED: \"Hogger\""), days = 3 } },
          text = "Hogger's claw on my desk. Goldshire will drink to you tonight, and I'll pretend not to notice.",
          fx = { standing = { goldshire = 10 }, expose = "hogger_unbeatable" } },
        { id = "q_hogger_later", when = { questLater = { TODO_QUEST("WANTED: \"Hogger\""), days = 7 } },
          text = "The gnolls have gone quiet since Hogger. Too quiet. They're choosing a new one, mark me." },
        { id = "q_fargodeep", when = { questActive = TODO_QUEST("The Fargodeep Mine") },
          text = "Kobolds in the tunnels at Fargodeep. Count them and come back. Don't try to fight all of them." },
        { id = "q_concerns", when = { questActive = TODO_QUEST("Further Concerns") },
          text = "Remy's murlocs. I'd have laughed, but Thomas hasn't sent word from the bridge in days." },
        { id = "q_concerns_later", tags = { "news" }, when = { questDone = TODO_QUEST("Further Concerns"), heardClaim = "murlocs_in_elwynn" },
          text = "Murlocs. Remy was right. Don't tell him I said so; he'll repeat it until the Light takes us all.",
          fx = { expose = "murlocs_in_elwynn" } },
        { id = "lie_hogger", tags = { "news" }, once = true, priority = 10, when = { lieCaught = "player_killed_hogger" },
          text = "Farley's telling the whole inn you killed Hogger. Strange. There's no claw on my desk.",
          fx = { standing = { goldshire = -6 }, npcFlag = { set = { "caught_lying" } } } },
        { id = "h_standing_low", when = { townStanding = { town = "goldshire", max = -20 } },
          text = "I hear things about you. None of them good. Give me a reason to stop hearing them." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Sky elves. Stormwind's calling your people friends now. Good. I'll take friends. Keep the peace in my town and we'll get along fine." },
        { id = "q_jasperlode", when = { questActive = TODO_QUEST("The Jasperlode Mine") },
          text = "Jasperlode's further out. East along the road to the Tower of Azora, then north into the foothills. Scout it. Don't clear it." },
        { id = "q_jasperlode_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Jasperlode Mine"), days = 2 } },
          text = "Kobolds in Jasperlode too. Every report's worse than the last. Thank you for it anyway. I'd sooner know." },
        { id = "q_manhunt", tags = { "news" }, when = { questRecent = { TODO_QUEST("Manhunt"), days = 3 } },
          text = "The Collector won't be collecting again. But that ring. Why does a thief in a pumpkin patch carry a Stonemasons' Guild ring?",
          fx = { learn = { "the_collector", "defias" } } },
        { id = "h_veteran", when = { minLevel = 20, metBefore = true },
          text = "Look who's back. You carried McBride's papers to this desk once. Now half my reports have your name in them." },
      },
      again = {
        { id = "h_again", text = "What else? The desk isn't getting any emptier." },
        { id = "h_again2", text = "Next. Quickly, now." },
        { id = "h_again3", when = { townStanding = { town = "goldshire", min = 30 } }, text = "Go on. For you, I've a minute more." },
      },
      choices = {
        { text = "Any work for me?", next = "BUSINESS" },
        { text = "What about the Defias?", next = "defias" },
        { text = "McBride says someone is training them.", next = "confront",
          when = { any = { { heardLine = "mcbride.d_default" }, { heardClaim = "defias_trained" } } } },
        { text = "Tell me about Hogger.", next = "hogger", when = { questBefore = TODO_QUEST("WANTED: \"Hogger\"") } },
        { text = "How bad is Elwynn, really?", next = "threats" },
        { text = "Where's the rest of the army?", next = "army" },
        { text = "I'm from Westfall. Nobody came for us.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "My family has a name in the city.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "I could say words for the footmen you lost.", next = "footmen", when = { class = "PRIEST", questDone = TODO_QUEST("Discover Rolf's Fate") } },
        { text = "Good day, Marshal.", next = "END" },
      },
    },

    defias = {
      lines = {
        { id = "d_common_thieves", key = true,
          text = "The Defias? Common thieves with matching scarves. Westfall's problem, mostly. Goldshire is safe.",
          fx = { hear = "defias_common_thieves", learn = { "defias" } } },
      },
      choices = {
        { text = "Glad to hear it.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's not what I've seen.", next = "confront", fx = { trait = { skeptical = 1 } } },
      },
    },

    confront = {
      big = true,
      lines = {
        { id = "c_default", text = "McBride sees an army in every bandit. Somebody has to keep this town from panicking, and it's me." },
        { id = "c_collector", when = { questDone = TODO_QUEST("The Collector") },
          text = "...Fine. Someone is paying them, and paying well. You've seen the schedule. That stays between us.",
          fx = { expose = "defias_common_thieves" } },
        { id = "c_ring", when = { questDone = TODO_QUEST("Manhunt") },
          text = "...You found the ring. Stonemasons' Guild. A thief with an artisan's ring, collecting gold from my mines. I can't call that common, can I? Not to you.",
          fx = { expose = "defias_common_thieves" } },
      },
      choices = {
        { text = "[Persuade] The town deserves to know what it's facing.", tag = "Persuade", next = "admit",
          fail = { next = "rebuff", fx = { affinity = -1 } } },
        { text = "Calm streets matter. I understand.", next = "BACK",
          fx = { align = { order = 2 }, trait = { cautious = 1 }, affinity = 1 } },
        { text = "Then you're lying to them.", next = "BACK",
          fx = { align = { honor = 2 }, affinity = -2, standing = { goldshire = -1 } } },
      },
    },
    admit = {
      lines = {
        { id = "ad_default", key = true,
          text = "You're right, and I hate that you're right. They're organized. Someone's training them, and I don't have the guards to say it out loud.",
          fx = { expose = "defias_common_thieves", hear = "defias_trained" } },
      },
      choices = {
        { text = "Then let me help.", next = "BACK", fx = { affinity = 2, standing = { goldshire = 3 }, trait = { brave = 1 } } },
        { text = "Who do you think is training them?", next = "admit_who" },
      },
    },
    admit_who = {
      lines = {
        { id = "aw_default", text = "Someone who was owed money and never got it. That's all I'll guess aloud. A marshal who guesses aloud is a marshal who starts riots." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
    rebuff = {
      lines = { { id = "rb_default", text = "I don't take lessons in keeping the peace from someone who hasn't kept any. Good day." } },
      choices = { { text = "Good day, Marshal.", next = "END" } },
    },

    hogger = {
      lines = {
        { id = "hg_default", text = "A gnoll the size of a cart horse, with the temper of two. He's been in the southwest for weeks, and he's sent every hunter home on a cart.",
          fx = { learn = { "hogger" } } },
      },
      choices = {
        { text = "Why hasn't the army dealt with him?", next = "hogger_army" },
        { text = "I'll bring you his claw.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Not my problem.", next = "BACK", fx = { standing = { goldshire = -1 } } },
      },
    },
    hogger_army = {
      lines = {
        { id = "ha_default", text = "The army put a bounty on him. That's what the army does when it can't spare a squad. He's beaten every attempt to take him so far." },
      },
      choices = {
        { text = "How big is the bounty?", next = "BUSINESS", fx = { trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    threats = {
      hub = true,
      lines = {
        { id = "t_default", text = "Kobolds in the mines, north and south. Gnolls and thieves to the west. And Remy swears there are murlocs in the east. Pick one." },
      },
      again = {
        { id = "t_again", text = "Another? There's no shortage." },
        { id = "t_again2", text = "Which one next? They all keep me up." },
      },
      choices = {
        { text = "The mines.", next = "mines" },
        { text = "The west.", next = "west" },
        { text = "Murlocs? Really?", next = "murlocs" },
        { text = "Back to other business.", next = "hello" },
      },
    },
    mines = {
      lines = {
        { id = "m_default", text = "Fargodeep, due south between the Stonefield and Maclure farms. Jasperlode, past the Tower of Azora in the foothills. Northshire's mine isn't the only one with kobolds.",
          fx = { learn = { "kobolds" } } },
      },
      choices = {
        { text = "Who's working the mines now?", next = "mines_gold" },
        { text = "Another threat.", next = "BACK" },
      },
    },
    mines_gold = {
      big = true,
      lines = {
        { id = "mg_default", text = "Nobody of ours. We haven't had our people in those mines for months. So whoever's taking gold out of them isn't working for the crown." },
        { id = "mg_schedule", when = { questDone = TODO_QUEST("The Collector") },
          text = "You saw the schedule. Gold from my mines, picked up at the Brackwell pumpkin patch by this Collector. Who he collects for, I can't say.",
          fx = { learn = { "the_collector" } } },
      },
      choices = {
        { text = "The kobolds, then?", next = "BACK", fx = { learn = { "gold_dust" } } },
        { text = "Remy buys gold dust.", next = "mines_remy" },
      },
    },
    mines_remy = {
      lines = {
        { id = "mr_default", text = "Remy buys what the kobolds drop, a pouch at a time. It's legal. Barely. Whoever's taking it by the shipment is another matter." },
      },
      choices = { { text = "Another threat.", next = "BACK", fx = { learn = { "gold_dust" } } } },
    },
    west = {
      lines = {
        { id = "w_default", text = "Westbrook Garrison, on the western border. Gnolls and thieves, more every week. Deputy Rainer wants soldiers. I've none to spare, so I send him people like you." },
      },
      choices = {
        { text = "And past Westbrook? Westfall?", next = "westfall" },
        { text = "Another threat.", next = "BACK" },
      },
    },
    westfall = {
      lines = {
        { id = "wf_default", text = "Not mine to hold. Gryan Stoutmantle holds Sentinel Hill with farmers and whatever help walks in. When you're ready, I'll send you to him.",
          fx = { learn = { "westfall", "people_militia" } } },
      },
      choices = { { text = "Another threat.", next = "BACK" } },
    },
    murlocs = {
      lines = {
        { id = "mu_default", text = "I respect Remy as a merchant. As a scout, less. Until I get a military report of murlocs, I can't send troops east on a rumor." },
        { id = "mu_confirmed", when = { questDone = TODO_QUEST("Further Concerns") },
          text = "Thomas confirmed it. Murlocs settled in the eastern streams, aggressive, and cleverer than they look. Remy was right. Once.",
          fx = { learn = { "murlocs_east", "eastvale" } } },
        { id = "mu_lost", when = { questDone = TODO_QUEST("Discover Rolf's Fate") },
          text = "Rolf Hartford and Malakai Stone. Two of mine, sent north along the river. The murlocs had them before I'd believed a word of Remy's.",
          fx = { learn = { "lost_footmen" } } },
      },
      choices = {
        { text = "That wasn't your fault.", next = "BACK", when = { questDone = TODO_QUEST("Discover Rolf's Fate") }, fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Another threat.", next = "BACK" },
      },
    },

    army = {
      lines = {
        { id = "ar_default", text = "Abroad. Doing who knows what, for who knows which noble. I keep the order here with whoever's left, and whoever walks through that door." },
      },
      choices = {
        { text = "That sounds like a complaint, Marshal.", next = "army_politics" },
        { text = "Then I'll walk through it more often.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    army_politics = {
      lines = {
        { id = "ap_default", text = "It's a report. Politics is hard to keep track of these days. I've stopped trying. I keep track of kobolds." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    farmhand = {
      big = true,
      lines = {
        { id = "fh_default", text = "I know. I'd nothing to send, and Westfall got nothing. Gryan Stoutmantle holds Sentinel Hill with farmers like you. That's the truth, and I'm not proud of it.",
          fx = { learn = { "westfall" } } },
      },
      choices = {
        { text = "Then send me.", next = "BACK", fx = { affinity = 3, align = { order = 1 }, trait = { brave = 1 } } },
        { text = "Stormwind should be ashamed.", next = "farmhand_shame" },
      },
    },
    farmhand_shame = {
      lines = {
        { id = "fs_default", text = "Some of it is. Not the part that's sitting at this desk. Say it in the city if you like. Say it louder than I'm allowed to." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { align = { order = -1 }, opinion = { defias = "sympathetic" } } } },
    },

    noble = {
      lines = {
        { id = "no_default", text = "Then tell your family Goldshire would like its soldiers back. Politely. I'm told that's how it's done in the city." },
      },
      choices = {
        { text = "I'll tell them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My family doesn't listen to me.", next = "noble_listen" },
      },
    },
    noble_listen = {
      lines = {
        { id = "nl_default", text = "Then we've something in common. Take a sword and be useful out here. The younger ones of good houses used to, before the city got comfortable." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    footmen = {
      lines = {
        { id = "fo_default", text = "Would you? There's been no one to do it. Say them at the bridge, where Thomas stands. I'd like to think they'd want it there." },
      },
      choices = {
        { text = "I will. And one for you, Marshal.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 }, standing = { goldshire = 2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Marshal of Goldshire. Too much forest, too few guards, and a desk I see more of than my bed.", next = "army" } },
    advice = { { id = "tp_ad", text = "Scout before you fight. Report before you rest. And never believe a rumor until a soldier's seen it. Even Remy's." } },
    defias = { { id = "t_defias", text = "Thieves. Westfall's thieves. I'd thank you not to say otherwise in the inn.", fx = { hear = "defias_common_thieves" } } },
    hogger = { { id = "t_hogger", text = "There's a bounty. Bring me proof, not stories." } },
    murlocs_east = { { id = "t_murlocs", text = "Rumors, until Guard Thomas tells me otherwise." } },
    the_collector = { { id = "t_collector", text = "Where did you hear that name? Don't repeat it in the inn." } },
    gold_dust = { { id = "t_dust", text = "Remy's trade. It's legal. Barely. I keep an eye on it." } },
    kobolds = { { id = "tp_kobolds", text = "In Fargodeep, in Jasperlode, in my sleep. Count them before you fight them.", next = "threats" } },
    westfall = { { id = "tp_westfall", text = "Not mine to hold. I wish it were, some days. Other days I'm glad it isn't." } },
    _none = { { id = "t_none", text = "Not a matter for the Guard." } },
  },
}
