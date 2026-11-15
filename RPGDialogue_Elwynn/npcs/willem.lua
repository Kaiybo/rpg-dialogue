-- Deputy Willem, outside Northshire Abbey. Voice: bibles/willem.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "willem", id = TODO_NPC("Deputy Willem"), name = "Deputy Willem",
  bible = "bibles/willem.md", role = "questgiver", tier = "quest",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "newcomer", "thief", "stranger" },

  greetings = {
    { id = "g_morning", when = { timeOfDay = { "dawn", "day" } }, text = "Morning! Keep to the road and you'll keep your purse." },
    { id = "g_tally", when = { questObjective = { TODO_QUEST("Brotherhood of Thieves"), left = { min = 1 } } }, text = "More bandanas for the tally? You're short a few yet." },
    { id = "g_piece", text = "Still in one piece? Good, see that you keep it that way." },
  },

  notice = {
    { id = "n_rogue", cat = "thief", when = { class = "ROGUE" },
      text = "A rogue, is it? I'll count the bandanas twice when you hand them in, and it's nothing personal." },
    { id = "n_level1", cat = "newcomer", when = { maxLevel = 1, metBefore = false },
      text = "Look at you, not a scratch on you yet. That won't last, mind; it never does." },
    { id = "n_far", cat = "stranger", when = { outOfPlace = "far", race = { "NightElf", "Skyborne" } },
      text = "Don't get many of your sort coming down the Abbey road. Lost, or looking for work?" },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Don't do that. Every time someone does that around here, a crate goes missing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Willem, deputy to the Marshal. If it's trouble in this valley, I've likely heard of it already." },
        { id = "h_new", when = { questBefore = TODO_QUEST("A Threat Within"), band = "Greenhorn" },
          text = "Fresh off the road? Head on inside the Abbey; Marshal McBride sees every new recruit himself." },
        { id = "q_thieves_before", when = { questBefore = TODO_QUEST("Brotherhood of Thieves"), questDone = TODO_QUEST("A Threat Within") },
          text = "Red bandanas in the vineyard. If you see one, it isn't fashion. Come to me when you're ready to do something about it." },
        { id = "q_thieves_short", when = { questObjective = { TODO_QUEST("Brotherhood of Thieves"), left = { min = 1 } } },
          text = "Not enough bandanas yet. The Marshal won't believe a short count. He barely believes a full one." },
        { id = "q_thieves_active", when = { questActive = TODO_QUEST("Brotherhood of Thieves") },
          text = "How many bandanas so far? I keep a tally on the stable door. Don't laugh, it's the only way the Marshal believes me." },
        { id = "q_thieves_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Brotherhood of Thieves"), days = 2 } },
          text = "Fewer red bandanas in the vineyard since you went through. Milly might even sleep tonight." },
        { id = "q_garrick_active", when = { questActive = TODO_QUEST("Bounty on Garrick Padfoot") },
          text = "Garrick Padfoot's holed up in a shack on the hillside, bold as you like. Bring me proof and the bounty's yours." },
        { id = "q_garrick_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Bounty on Garrick Padfoot"), days = 3 } },
          text = "Garrick's done for. The rest of them will pick a new leader by week's end, mind; they always do." },
        { id = "e_mcbride_defias", tags = { "news" }, when = { heardLine = "mcbride.d_default" },
          text = "The Marshal talked to you about the Defias? He's been chewing on that for weeks. Says they march like soldiers." },
        { id = "o_mercy", tags = { "news" }, when = { gossip = { topic = "defias", stance = "mercy" } },
          text = "The Marshal says you'd give the Defias a chance to surrender. He couldn't decide if that was brave or soft. Neither can I." },
        { id = "o_hardline", tags = { "news" }, when = { gossip = { topic = "defias", stance = "hardline" } },
          text = "Heard you told the Marshal a thief's a thief. Good, somebody had to say it to his face." },
        { id = "o_leaders", tags = { "news" }, when = { gossip = { topic = "defias", stance = "follow_the_leaders" } },
          text = "You asked the Marshal who's behind the Defias? He's been pacing about it ever since, so thanks for that." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Long way from the mountains, aren't you? You'll find our hills a bit gentle." },
        { id = "h_novice", when = { origin = "human_abbey_novice" },
          text = "One of the brothers' novices, out the front door with a weapon? The Abbey must be emptying its pews for the Marshal. I'm not complaining." },
        { id = "h_veteran", when = { minLevel = 20, metBefore = true },
          text = "Look at you! I sent you up those steps with nothing but a shirt and a stick, and now look at you. I'll be telling the new ones about you." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a road to watch, and it won't watch itself." },
        { id = "h_again2", text = "Go on, I'm listening. One eye on the road, mind." },
      },
      choices = {
        { text = "Any trouble I can help with?", next = "BUSINESS" },
        { text = "Tell me about these thieves.", next = "thieves" },
        { text = "Who else in the valley needs a hand?", next = "valley" },
        { text = "You don't sound like a deputy.", next = "beat" },
        { text = "The Defias took my farm in Westfall.", next = "westfall", when = { origin = "human_westfall_farmhand" } },
        { text = "Does Stormwind take volunteers from far away?", next = "far", when = { race = { "Dwarf", "Gnome", "NightElf", "Skyborne" } } },
        { text = "Just passing through.", next = "END" },
      },
    },
    thieves = {
      lines = {
        { id = "t_default", key = true, text = "Defias. Red bandanas, sharp knives, and they've decided the vineyard is theirs now.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Who leads them up here?", next = "garrick" },
        { text = "Why would anyone join them?", next = "why", fx = { trait = { curious = 1 } } },
        { text = "Then I'll clear them out.", next = "BACK", fx = { align = { order = 1 }, trait = { brave = 1 }, affinity = 1 } },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Hungry, mostly, or angry. Some say Stormwind owes them, but I'm a deputy, not a judge, so I'll leave that to the judges." },
      },
      choices = {
        { text = "Maybe Stormwind does owe them.", next = "BACK", fx = { align = { order = -2 }, opinion = { defias = "sympathetic" } } },
        { text = "Owed or not, theft is theft.", next = "BACK", fx = { align = { order = 2 }, opinion = { defias = "hardline" } } },
      },
    },
    garrick = {
      lines = {
        { id = "ga_default", text = "Garrick Padfoot. A cutthroat with a gang of thugs and a shack east of the vineyards, over the bridge. He's been bleeding the farmers and merchants for weeks." },
        { id = "ga_done", when = { questDone = TODO_QUEST("Bounty on Garrick Padfoot") },
          text = "That was Garrick Padfoot, and you saw to him. Someone else wears his bandana now, I'd bet, but nobody's sitting in his shack yet." },
      },
      choices = {
        { text = "Is there a bounty?", next = "BUSINESS", fx = { trait = { greedy = 1 } } },
        { text = "Weeks? And nobody's gone after him?", next = "garrick_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garrick_why = {
      lines = {
        { id = "gw_default", text = "Who? I'm one deputy with a door to watch. That's why I put bounties up. People like you are the nearest thing to a patrol I've got." },
      },
      choices = {
        { text = "Then I'm your patrol.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { northshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley = {
      lines = {
        { id = "v_default", text = "Eagan, round the side of the Abbey, has more wolves this season than he can skin, and Milly, with her wagon by the stable, has Defias in her vines. Help either one, or both if you've the legs for it." },
      },
      choices = {
        { text = "Tell me about Milly.", next = "valley_milly" },
        { text = "And Eagan?", next = "valley_eagan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley_milly = {
      lines = {
        { id = "vm_default", text = "She's a friend, and as stubborn as her vines. She'll tell you I'm stuck at this door and can't help her, and she's right, which is why I'm sending you." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    valley_eagan = {
      lines = {
        { id = "ve_default", text = "Says ten words a day and means all of them. He wants the wolves for the pot and the pelts for his wife's orders. Don't get between him and either." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    beat = {
      lines = {
        { id = "b_default", text = "Because I'm not, really; I'm a city guard. I'd be walking a beat in Stormwind if half the guard weren't off fighting in other lands, so here I am, deputized and handing out bounties." },
      },
      choices = {
        { text = "Fighting where?", next = "beat_where" },
        { text = "You seem good at it.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    beat_where = {
      lines = {
        { id = "bw_default", text = "Wherever they're sent. I don't ask; I'd only get an answer I didn't like. Meanwhile we've kobolds, wolves and thieves, and a Marshal who won't sleep." },
      },
      choices = {
        { text = "Then I'll help where I can.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Somebody should ask.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    westfall = {
      big = true,
      lines = {
        { id = "wf_default", text = "Then you know them better than I do. Tell the Marshal what you saw out there; he listens to anyone who's lost something to them." },
      },
      choices = {
        { text = "I'd rather take it back from them.", next = "BACK", fx = { trait = { stern = 1 }, opinion = { defias = "hardline" } } },
        { text = "Some of them were my neighbours.", next = "westfall_neighbours" },
      },
    },
    westfall_neighbours = {
      lines = {
        { id = "wn_default", text = "That's the worst of it, isn't it? I don't know what I'd do if it were folk I knew under those bandanas. I hope I never find out." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, opinion = { defias = "sympathetic" } } } },
    },
    far = {
      lines = {
        { id = "f_default", text = "Anyone willing to defend their home, and their alliance. That's what the Marshal said, and the alliance is yours as much as ours. Welcome to Northshire." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Stormwind guard, deputized and stuck at a door when I'd rather be out on patrol. Don't tell the Marshal I said so.", next = "beat" } },
    advice = { { id = "tp_ad", text = "Stay on the road after dark. The wolves don't, and neither do the Defias, so be where they aren't." } },
    northshire_abbey = { { id = "tp_abbey", text = "The Marshal's inside, the brothers are inside, and I'm outside. That's the order of things." } },
    defias = { { id = "t_defias", text = "They wear red so we know who to chase. Very considerate of them." } },
    kobolds = { { id = "t_kobolds", text = "Kobolds are the Marshal's worry; I've got thieves to count." } },
    _none = { { id = "t_none", text = "Not something a deputy would know. Try the brothers in the Abbey." } },
  },
}
