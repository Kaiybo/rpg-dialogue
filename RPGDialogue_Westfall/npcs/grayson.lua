-- Captain Grayson, the ghost of Westfall Lighthouse. Voice: bibles/grayson.md
-- A pirate whose ship struck the coast the night the lamp went dark.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "grayson", id = TODO_NPC("Captain Grayson"), name = "Captain Grayson",
  bible = "bibles/grayson.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "steady" }, values = { "honest", "kind" },
  spiritSensitive = true,
  notices = { "death", "sea" },

  greetings = {
    { id = "g_flame", text = "Keep clear of the lamp. It's the only thing here still alive, in its way." },
    { id = "g_murkeye", when = { questActive = TODO_QUEST("The Coastal Menace") }, text = "Murk-Eye still breathes. I can feel it in the tide." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Coastal Menace") }, text = "The beach is quiet. Quiet enough that I can hear the gulls again." },
  },

  notice = {
    { id = "n_ghost", cat = "death", place = "replace", when = { ghost = true },
      text = "Ha! Another one of us, is it? Don't get comfortable; your body's waiting for you, and it won't wait forever. Mine didn't." },
    { id = "n_undead", cat = "death", when = { race = "Scourge" },
      text = "Dead, but walking about in your own skin, you lucky soul. Mine's somewhere at the bottom of this bay." },
    { id = "n_fish", cat = "sea", when = { profession = "Fishing" },
      text = "A fisher. Then you know the sea keeps what it takes. Respect it and it might give a little back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Captain Grayson, of a ship that isn't, from a crew that aren't. I mean no harm to the living; I mean only to keep this flame lit." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Keeper of the Flame") },
          text = "The night my ship came in, this lamp was dark and we hit the rocks. I'd not wish that on any captain, honest or otherwise." },
        { id = "h_flame", tags = { "news" }, when = { questActive = TODO_QUEST("Keeper of the Flame") },
          text = "The flame needs feeding, and I can't lift so much as a candle. You can." },
        { id = "h_coast", when = { questActive = TODO_QUEST("The Coast Isn't Clear") },
          text = "The murlocs on the shore grow bolder every tide. Thin them, and the next keeper might live to see old age." },
        { id = "h_menace", tags = { "news" }, when = { questActive = TODO_QUEST("The Coastal Menace") },
          text = "Old Murk-Eye drove the keeper's family off once, and when they came back and lit the lamp, he came back too. I watched it all, and I couldn't do a thing." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Coastal Menace"), days = 3 } },
          text = "He's gone; I felt it in the tide. The family's beyond thanking you, so I'll do it for them: thank you." },
        { id = "h_pirate", when = { class = "ROGUE" },
          text = "You've a pirate's way of standing, weight on the balls of the feet and one hand near the knife. I'd have signed you on." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The flame burns brightest when nobody's looking at it, and I'm always looking at it. That comes with being dead, I find." },
      },
      again = {
        { id = "h_again", text = "Ask on. The dead have nothing but time, and I've more than most." },
        { id = "h_again2", text = "What else? The tide's turning, as it always is." },
      },
      choices = {
        { text = "Why do you stay?", next = "stay" },
        { text = "Were you really a pirate?", next = "pirate" },
        { text = "Tell me about Old Murk-Eye.", next = "murkeye" },
        { text = "What's it like, being dead?", next = "dead" },
        { text = "I could help you find rest, captain.", next = "priest", when = { class = "PRIEST" } },
        { text = "We're both dead. Why aren't you bitter?", next = "scourge", when = { race = "Scourge" } },
        { text = "Rest easy, captain.", next = "END" },
      },
    },
    stay = {
      big = true,
      lines = {
        { id = "s_default", text = "Because a dark lamp killed my crew, and a dark lamp killed that family. If keeping it lit is the only good I do, dead, it'll be enough." },
      },
      choices = {
        { text = "That's a noble penance.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A dead man keeping a lamp lit is just stubbornness.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You don't owe anyone anything now.", next = "owe", fx = { trait = { kind = 1 } } },
        { text = "Who was the keeper's family?", next = "family" },
      },
    },
    owe = {
      lines = { { id = "o_default", text = "Maybe not. But I've nothing else to do, and the gulls are poor conversation." } },
      choices = { { text = "I'll visit, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    family = {
      lines = { { id = "fa_default", text = "The keeper and his kin. I never learned their names; nobody introduces themselves to a ghost. They lit the lamp twice, and the second time, Murk-Eye came back for them." } },
      choices = {
        { text = "I'm sorry you had to watch.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirate = {
      lines = { { id = "p_default", text = "A pirate, a privateer, a merchant with flexible morals. Depends who you asked and what they'd lost." } },
      choices = {
        { text = "Ha. Fair.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "What was your ship called?", next = "ship" },
      },
    },
    ship = {
      lines = { { id = "sh_default", text = "Depends which year you mean. She wore a few names and a few coats of paint. The sea knows which one stuck. I'll let it keep that." } },
      choices = {
        { text = "A careful answer.", next = "pirate_wrecks", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirate_wrecks = {
      lines = { { id = "pw_default", text = "Careful's a habit, that's all. Look along the beach and you'll see mine's not the only wreck; the Great Sea is hard on ships, and harder on ships with no light to steer by." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    murkeye = {
      lines = {
        { id = "mu_default", text = "An old murloc with a long memory. He leads the weaker ones the way a gull leads a flock to scraps. The lighthouse family were scraps, to him." },
        { id = "mu_active", when = { questActive = TODO_QUEST("The Coastal Menace") },
          text = "He walks the shore with his kin about him, so wait till he wanders clear of them. Then bring me one of his scales." },
      },
      choices = {
        { text = "Then I'll put him down.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Why does he hate the lighthouse?", next = "murkeye_why" },
      },
    },
    murkeye_why = {
      lines = { { id = "mw_default", text = "I've wondered that myself. Light on the water means boats, and boats mean nets, so maybe he's no fool, but he's a murderer all the same." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    dead = {
      lines = { { id = "de_default", text = "Cold, mostly, and quiet. You'd think the dead would have plenty to say to each other, but we don't." } },
      choices = {
        { text = "Are there others like you here?", next = "dead_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_others = {
      lines = { { id = "do_default", text = "If there are, they keep to themselves. I see the lamp, the rocks and the gulls. That's company enough for a man who earned less." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      big = true,
      lines = { { id = "pr_default", text = "Rest? Kind of you. But I've a lamp to keep, and I'd not trust the next fellow to keep it. When this coast is safe, ask me again." } },
      choices = {
        { text = "Then I'll make it safe.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Suit yourself. The lamp can keep you company forever.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me at least pray for your crew.", next = "priest_crew" },
      },
    },
    priest_crew = {
      lines = { { id = "pc_default", text = "Do, by all means. They were rough men and they'd laugh at you for it, but pray anyway; somebody should, and it can't be me." } },
      choices = {
        { text = "Light keep them, wherever the sea put them.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "If they'd laugh at prayer, I'll spare them one.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    scourge = {
      lines = { { id = "sc_default", text = "Bitter? A dark lamp killed me, not a plague. No one did this to me but the rocks, and it's hard to hate rocks. You've better reason than I have." } },
      choices = {
        { text = "I do.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Maybe I'll try your way.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a captain once, of a ship that ran this coast, and then came the rocks, and then this. The middle was more fun than the end.", next = "pirate" } },
    advice = { { id = "tp_ad", text = "Never sail a strange coast at night without a light to steer by. I'd know." } },
    defias = { { id = "tp_defias", text = "I've seen their ships slip along this coast at night, running dark. I know the trick; I used it myself." } },
    westfall = { { id = "tp_westfall", text = "From up here it looks peaceful. That's the trouble with lighthouses. Everything looks peaceful from a height." } },
    _none = { { id = "tp_none", text = "The dead hear less than you'd think. Mostly waves." } },
  },
}
