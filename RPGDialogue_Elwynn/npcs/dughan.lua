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
        { id = "h_standing_low", when = { townStanding = { town = "goldshire", max = -20 } },
          text = "I hear things about you. None of them good. Give me a reason to stop hearing them." },
      },
      choices = {
        { text = "Any work for me?", next = "BUSINESS" },
        { text = "What about the Defias?", next = "defias" },
        { text = "McBride says someone is training them.", next = "confront",
          when = { any = { { heardLine = "mcbride.d_default" }, { heardClaim = "defias_trained" } } } },
        { text = "Tell me about Hogger.", next = "hogger", when = { questBefore = TODO_QUEST("WANTED: \"Hogger\"") } },
      },
    },

    defias = {
      lines = {
        { id = "d_common_thieves", key = true,
          text = "The Defias? Common thieves with matching scarves. Westfall's problem, mostly. Goldshire is safe.",
          fx = { hear = "defias_common_thieves", learn = { "defias" } } },
      },
      choices = {
        { text = "Glad to hear it.", next = "END", fx = { affinity = 1 } },
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
      },
      choices = {
        { text = "[Persuade] The town deserves to know what it's facing.", tag = "Persuade", next = "admit",
          fail = { next = "rebuff", fx = { affinity = -1 } } },
        { text = "Calm streets matter. I understand.", next = "END",
          fx = { align = { order = 2 }, trait = { cautious = 1 }, affinity = 1 } },
        { text = "Then you're lying to them.", next = "END",
          fx = { align = { honor = 2 }, affinity = -2, standing = { goldshire = -1 } } },
      },
    },
    admit = {
      lines = {
        { id = "ad_default", key = true,
          text = "You're right, and I hate that you're right. They're organized. Someone's training them, and I don't have the guards to say it out loud.",
          fx = { expose = "defias_common_thieves", hear = "defias_trained" } },
      },
      choices = { { text = "Then let me help.", next = "END", fx = { affinity = 2, standing = { goldshire = 3 }, trait = { brave = 1 } } } },
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
        { text = "I'll bring you his claw.", next = "END", fx = { trait = { brave = 1 } } },
        { text = "Not my problem.", next = "END", fx = { standing = { goldshire = -1 } } },
      },
    },
  },

  topics = {
    defias = { { id = "t_defias", text = "Thieves. Westfall's thieves. I'd thank you not to say otherwise in the inn.", fx = { hear = "defias_common_thieves" } } },
    hogger = { { id = "t_hogger", text = "There's a bounty. Bring me proof, not stories." } },
    murlocs_east = { { id = "t_murlocs", text = "Rumors, until Guard Thomas tells me otherwise." } },
    the_collector = { { id = "t_collector", text = "Where did you hear that name? Don't repeat it in the inn." } },
    gold_dust = { { id = "t_dust", text = "Remy's trade. It's legal. Barely. I keep an eye on it." } },
    _none = { { id = "t_none", text = "Not a matter for the Guard." } },
  },
}
