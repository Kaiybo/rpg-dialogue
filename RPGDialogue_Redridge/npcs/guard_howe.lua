-- Guard Howe, just south of the Lakeshire bridge. Voice: bibles/guard_howe.md
-- Wants the Blackrock clan destroyed; speaks of the King's sovereign right like a creed.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "guard_howe", id = TODO_NPC("Guard Howe"), name = "Guard Howe",
  bible = "bibles/guard_howe.md", role = "guard", tier = "quest",
  communities = { "lakeshire" }, temper = { "grim" }, values = { "duty", "loyal" },
  notices = { "race", "soldier" },

  impression = {
    first = "Guard Howe talks about the Blackrock the way a preacher talks about sin. He wants them gone from Redridge, every one, and I don't think he'd rest even then.",
    third = "{name} met Guard Howe by the Lakeshire bridge, who wants the Blackrock clan driven out of the King's lands for good.",
  },

  greetings = {
    { id = "g_bridge", text = "Halt. These mountains belong to the King of Stormwind, and I'd like to know you're on his side." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. How many Blackrock have you put down since we spoke?" },
    { id = "g_active", when = { questActive = TODO_QUEST("Blackrock Bounty") }, text = "Return once you've slain fifteen of their champions. Not before." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. They raided twice while you were away, and I counted every torch." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You're a different fighter than the one who first stopped at this bridge. The Blackrock will learn that too." },
    { id = "g_word_helped", when = { word = "helped" }, text = "They tell me you've been serving the township well. That's what I like to hear." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody in Lakeshire has a grievance with you. Settle it, because I need this town of one mind against the orcs." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, at my bridge. Whatever colours you wear, keep your hands where I can see them." },
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR" },
      text = "A warrior. Good; I've no use for anyone in Redridge who can't swing a blade." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Guard Howe. The Blackrock clan has invaded our lands, and these mountains fall under the sovereign right of the King of Stormwind. I mean to see them driven out." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Blackrock Bounty") },
          text = "Our sources tell us the leaders of each unit in the clan are called champions. They're camped to the north, just west of the road to the Burning Steppes, and I want them dead." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Blackrock Bounty"), days = 3 } },
          text = "You've fought well against the Blackrock, and your service to this township is great indeed. Fifteen fewer champions means a good many leaderless orcs." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin of the Light. My father fought beside your order in the last war, and I've never forgotten what that meant to him." },
      },
      again = {
        { id = "h_again", text = "What else? The orcs won't wait for us." },
        { id = "h_again2", text = "Speak. I'm watching the ridge while you do." },
      },
      choices = {
        { text = "Why do you hate the Blackrock so much?", next = "why" },
        { text = "Why champions and not the rest?", next = "champions" },
        { text = "Can the orcs ever be driven out for good?", next = "forgood" },
        { text = "I've fought orcs before, and they bleed like anyone.", next = "veteran", when = { minLevel = 20 } },
        { text = "I'll take the bounty.", next = "BUSINESS" },
        { text = "Stay vigilant, Howe.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because they burned the farms up the valley, and because they're on land that isn't theirs. Some men here want coin for it, or glory, and I just want them gone." },
      },
      choices = {
        { text = "Just gone? Or revenge?", next = "why_revenge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_revenge = {
      big = true,
      lines = { { id = "wr_default", text = "Call it what you like. A Blackrock killed a friend of mine at the old farmstead, and the King's law and my own grudge happen to point the same way." },
      },
      choices = {
        { text = "Fight for the kingdom, not your grudge.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A grudge is as good a reason as any.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'm sorry for your friend.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    champions = {
      lines = { { id = "c_default", text = "Cut off the head and the body flounders. Orcs follow strength, and a unit without its champion argues among itself instead of raiding our farms." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forgood = {
      lines = { { id = "f_default", text = "Not by Lakeshire alone, and not with the soldiers Stormwind has sent us, which is too few. But every one we kill is one less at the walls." },
      },
      choices = {
        { text = "Then Stormwind should send more.", next = "forgood_crown" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forgood_crown = {
      lines = { { id = "fc_default", text = "Write to the House of Nobles and see how far it gets you. Marshal Marris has, three times, and we've had nothing back but promises." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    veteran = {
      lines = { { id = "v_default", text = "They do, and that's the only comfort I've found in this. You'll know, then, that they don't stop coming until someone stops them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Guard of Lakeshire, posted at the bridge. Before that, I farmed. The Blackrock settled that question for me." } },
    advice = { { id = "tp_ad", text = "Kill the champion first. Everything else in Redridge follows from that." } },
    blackrock = { { id = "tp_blackrock", text = "Invaders on the King's land, and I'll see them gone.", next = "why" } },
    _none = { { id = "tp_none", text = "Not my concern. My concern is north of this bridge." } },
  },
}
