-- Lady Katrana Prestor, royal advisor, Stormwind Keep. Voice: bibles/katrana.md
-- Canon secret: she is Onyxia. Nothing she says reveals it. Her contempt shows; her nature doesn't.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "katrana", id = TODO_NPC("Lady Katrana Prestor"), name = "Lady Katrana Prestor",
  bible = "bibles/katrana.md", role = "noble", tier = "major",
  communities = { "stormwind" }, temper = { "proud" }, values = { "ambitious", "cunning" },
  notices = { "status", "ambition" },
  impression = {
    first = "Everyone in the king's hall seemed to agree with Lady Katrana Prestor before she had finished speaking. She was charming to me, and I couldn't decide whether I'd been welcomed or appraised.",
    third = "{name} was received by Lady Katrana Prestor, the Regent's gracious adviser, whose opinions soon seem to become everyone else's.",
  },

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
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "You again, and I find I don't mind. You have the look of someone who understands how things are actually decided, which is rarer at this court than gold." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "Oh, it's you. I had hoped the guards were better at their work than this." },
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
        { text = "You must find this court tiresome, my lady.", tag = "Persuade", next = "advise_true",
          check = { pass = { any = { { disposition = { min = 65 } }, { alignment = { axis = "honor", max = -30 } }, { minLevel = 55 } } } },
          fail = { next = "advise_shut", fx = { affinity = -1 } } },
      },
    },
    advise_true = {
      big = true,
      lines = {
        { id = "at_default", text = "Tiresome? My dear, it's a kennel. Every lord in the House has a bone he's afraid of losing, and once you know which bone, you need never raise your voice to him again." },
        { id = "at_bolvar", text = "The Regent is the best of them, and that's precisely his weakness. A good man will believe anything that lets him go on being good, and I have never once had to lie to Bolvar Fordragon; I only choose which truths to tell him first." },
      },
      choices = {
        { text = "That's a frightening way to see people.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "And which bone is mine, my lady?", next = "advise_mine" },
        { text = "I'll remember that.", next = "BACK" },
      },
    },
    advise_mine = {
      lines = {
        { id = "am_default", text = "Oh, I haven't decided yet, and that's the charming thing about you. Come back when you've grown a little more, and we'll see what you're afraid to lose." },
        { id = "am_hero", when = { minLevel = 55 }, text = "Yours is pride, I think, in being needed. Every hero has it. It's the easiest bone in the world to throw." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    advise_shut = {
      lines = {
        { id = "as_default", text = "What I find tiresome is being asked to confide in strangers who wander in off the street. Do run along and find someone simpler to flatter." },
        { id = "as_default2", text = "How sweet of you to wonder. The court is a great privilege, and I'm grateful for it every single day, as you'll no doubt repeat to anyone who asks." },
      },
      choices = {
        { text = "As you say, my lady.", next = "BACK" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I make it my business to know a little about everything that touches the crown. I suppose I could spare you a word or two on some of it." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "Ask away, then. It's so rare to be asked anything by someone who might actually understand the answer." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll indulge you on a very few things, and briefly, because the Regent is waiting." },
    },
    defias = { { id = "tp_defias", text = "Disgruntled masons. Tiresome. They'll be a footnote, one way or another." } },
    westfall = { { id = "tp_westfall", text = "Dust and complaints. I'm told it used to grow wheat." } },
    _none = { { id = "tp_none", text = "How quaint that you'd think I'd discuss that with you." } },
  },
}
