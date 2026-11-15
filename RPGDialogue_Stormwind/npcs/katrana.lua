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
    { id = "g_low", when = { maxLevel = 20 }, text = "Someone let you in, I see. How very generous of them." },
    { id = "g_hero", when = { minLevel = 50 }, text = "Ah, one of our celebrated heroes. Do come closer; I so rarely get to see one up close." },
  },

  notice = {
    { id = "n_rags", cat = "status", when = { durability = { max = 0.3 } },
      text = "You've walked into the king's hall dressed like a field hand after a hailstorm. Bolvar is far too polite to mention it, but I am not." },
    { id = "n_ambition", cat = "ambition", when = { minLevel = 55 },
      text = "You've grown very strong, haven't you? How interesting. I do so enjoy watching the strong, because one learns where they'll go next." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lady Prestor. I advise the Regent on the use of the kingdom's resources. Someone must, and the Regent is so very busy being noble." },
        { id = "h_westfall", when = { topicKnown = "westfall" },
          text = "Westfall, yes: farmers with pitchforks, writing letters. The crown cannot empty its purse every time a peasant is frightened." ,
          fx = { hear = "prestor_patience" } },
        { id = "h_redridge", when = { visited = "Lakeshire" },
          text = "Lakeshire's magistrate sends letters too; they all send letters. One begins to suspect the countryside has nothing better to do." },
        { id = "h_anduin", text = "The young king is doing splendidly, because he listens, and that is the most important quality in a king at his age. Listening." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Ah. One of the elves who came down out of the sky. The Kirin Tor do collect such curiosities." },
      },
      again = { { id = "h_again", text = "Something else? Do be quick." } },
      choices = {
        { text = "Westfall needs the crown's help.", next = "plead" },
        { text = "The Church would say mercy is never wasted.", next = "mercy", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "How did you come to court, my lady?", next = "court" },
        { text = "And the young king?", next = "king" },
        { text = "What of the Defias, my lady?", next = "defias" },
        { text = "Lakeshire is begging for soldiers.", next = "letters", when = { visited = "Lakeshire" } },
        { text = "What do you advise, my lady?", next = "advise" },
        { text = "Excuse me.", next = "END" },
      },
    },
    plead = {
      lines = {
        { id = "p_default", text = "Everyone needs the crown's help, and that's rather the problem with crowns. Be patient, and the Brotherhood will tire, or starve, or eat itself, as they usually do." ,
          fx = { hear = "prestor_patience" } },
      },
      choices = {
        { text = "People are dying while you wait.", next = "dying", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "I see your point.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1, opinion = { westfall = "patience" } } },
      },
    },
    dying = {
      lines = {
        { id = "d_default", text = "People are always dying, little one. It is the one thing they can be relied upon to do. Run along." },
      },
      choices = { { text = "...", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    mercy = {
      big = true,
      lines = { { id = "m_default", text = "The Church says a great many lovely things, little priest, but it does not balance the treasury, raise the levies, or count the graves, and I do all three. Go and pray; it suits you." } },
      choices = {
        { text = "Someone has to remind you of the people.", next = "BACK", fx = { affinity = -2, align = { light = 2, honor = 1 } } },
        { text = "You're right; prayer doesn't balance a treasury.", next = "BACK", fx = { align = { order = 1, light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    court = {
      lines = { { id = "c_default", text = "Alterac's misfortunes were Stormwind's gain, as they say. I came south, I made myself useful, and the Regent was wise enough to notice. That's all there is to it, really." } },
      choices = {
        { text = "Do you miss Alterac?", next = "court_alterac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court_alterac = {
      lines = { { id = "ca_default", text = "Miss it? It was cold, and full of men who couldn't keep a kingdom. Stormwind is so much warmer, and so much better kept." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    king = {
      lines = { { id = "k_default", text = "A dear boy, who asks the most charming questions at council. We answer them, and then we decide things, and it's an arrangement that suits everyone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    defias = {
      lines = { { id = "d2_default", text = "Thieves with a grievance and a red scarf. Hang the loud ones and the quiet ones go home. It's always worked before." } },
      choices = {
        { text = "They were the stonemasons who rebuilt this city.", next = "BACK", fx = { affinity = -1, opinion = { defias = "masons_wronged" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters = {
      lines = { { id = "l_default", text = "Lakeshire is always begging for something. Soldiers this year, a bridge the last. If we answered every village, the city would be guarded by its cooks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advise = {
      lines = {
        { id = "a_default", text = "Strength and order, and not wasting either on causes that cannot repay them. The Regent finds that cold, but the Regent also sleeps very well." },
      },
      choices = {
        { text = "Wise counsel.", next = "BACK", fx = { affinity = 1, align = { order = 1, light = -1 } } },
        { text = "It sounds cold.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
      },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Disgruntled masons. Tiresome. They'll be a footnote, one way or another." } },
    westfall = { { id = "tp_westfall", text = "Dust and complaints. I'm told it used to grow wheat." } },
    _none = { { id = "tp_none", text = "How quaint that you'd think I'd discuss that with you." } },
  },
}
