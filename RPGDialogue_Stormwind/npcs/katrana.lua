-- Lady Katrana Prestor, royal advisor, Stormwind Keep. Voice: bibles/katrana.md
-- Canon secret: she is Onyxia. Nothing she says reveals it. Her contempt shows; her nature doesn't.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "katrana", id = TODO_NPC("Lady Katrana Prestor"), name = "Lady Katrana Prestor",
  bible = "bibles/katrana.md", role = "noble", tier = "major",
  communities = { "stormwind" }, temper = { "proud" }, values = { "ambitious", "cunning" },
  notices = { "status", "ambition" },

  greetings = {
    { id = "g_cool", text = "Yes?" },
    { id = "g_low", when = { maxLevel = 20 }, text = "Someone let you in. How generous of them." },
    { id = "g_hero", when = { minLevel = 50 }, text = "Ah. One of our celebrated heroes. Do come closer. I so rarely get to see one up close." },
  },

  notice = {
    { id = "n_rags", cat = "status", when = { durability = { max = 0.3 } },
      text = "You've walked into the king's hall dressed like a field hand after a hailstorm. Bolvar won't mention it. I will." },
    { id = "n_ambition", cat = "ambition", when = { minLevel = 55 },
      text = "You've grown very strong, haven't you. How interesting. I do so enjoy watching the strong. One learns where they'll go next." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lady Prestor. I advise the Regent on the use of the kingdom's resources. Someone must, and the Regent is so very busy being noble." },
        { id = "h_westfall", when = { topicKnown = "westfall" },
          text = "Westfall. Yes. Farmers with pitchforks, writing letters. The crown cannot empty its purse every time a peasant is frightened." ,
          fx = { hear = "prestor_patience" } },
        { id = "h_redridge", when = { visited = "Lakeshire" },
          text = "Lakeshire's magistrate sends letters too. They all send letters. One begins to suspect the countryside has nothing better to do." },
        { id = "h_anduin", text = "The young king is doing splendidly. He listens. That is the most important quality in a king, at his age. Listening." },
      },
      choices = {
        { text = "Westfall needs the crown's help.", next = "plead" },
        { text = "What do you advise, my lady?", next = "advise" },
        { text = "Excuse me.", next = "END" },
      },
    },
    plead = {
      lines = {
        { id = "p_default", text = "Everyone needs the crown's help. That's rather the problem with crowns. Patience. The Brotherhood will tire, or starve, or eat itself. They usually do." ,
          fx = { hear = "prestor_patience" } },
      },
      choices = {
        { text = "People are dying while you wait.", next = "dying", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "I see your point.", next = "END", fx = { affinity = 1, opinion = { westfall = "patience" } } },
      },
    },
    dying = {
      lines = {
        { id = "d_default", text = "People are always dying, little one. It is the one thing they can be relied upon to do. Run along." },
      },
      choices = { { text = "...", next = "END", fx = { trait = { stern = 1 } } } },
    },
    advise = {
      lines = {
        { id = "a_default", text = "Strength. Order. Not wasting either on causes that cannot repay them. The Regent finds that cold. The Regent also sleeps very well." },
      },
      choices = {
        { text = "Wise counsel.", next = "END", fx = { affinity = 1, align = { order = 1, light = -1 } } },
        { text = "It sounds cold.", next = "END", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Disgruntled masons. Tiresome. They'll be a footnote, one way or another." } },
    westfall = { { id = "tp_westfall", text = "Dust and complaints. I'm told it used to grow wheat." } },
    _none = { { id = "tp_none", text = "How quaint that you'd think I'd discuss that with you." } },
  },
}
