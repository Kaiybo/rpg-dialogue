-- Splintertree Post (Horde). Voice: bibles/ashenvale.md
-- Classic quests only (Mastok's Befouled Element is a later quest; his Classic errand is
-- Stonetalon Standstill).
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "senani", id = TODO_NPC("Senani Thunderheart"), name = "Senani Thunderheart",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "splintertree" }, temper = { "reflective" }, values = { "reverent", "kind" },
  notices = { "pet", "class" },

  greetings = {
    { id = "g_forest", text = "Look at this forest, truly look at it. Whatever happens tomorrow, it was beautiful today." },
    { id = "g_back", when = { metBefore = true }, text = "Still in one piece, I see; the Hunt hasn't eaten you yet, and that is good." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then you'll understand that the Hunt isn't about killing; it's about knowing a beast well enough to earn the right." },
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Your companion walks proudly. Treat it well, for the forest is watching how we treat its children." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Senani Thunderheart. I came here to hunt and stayed because this forest is the most beautiful thing I have ever seen, and that we are at war in it is a sorrow I carry." },
        { id = "h_hunt", tags = { "news" }, when = { questActive = TODO_QUEST("The Ashenvale Hunt") },
          text = "Three great beasts walk this forest: Ursangous the bear, Shadumbra the nightsaber and Sharptalon the hippogryph. The bear is the gentlest test and the cat the quickest, but the bird will try to kill you." },
        { id = "h_bear", when = { questActive = TODO_QUEST("Ursangous's Paw") },
          text = "Ursangous walks near the Talondeep Path, west of Mystral Lake, and he is old, strong and slow to anger. Honour him with a clean kill; he deserves that much." },
        { id = "h_cat", when = { questActive = TODO_QUEST("Shadumbra's Head") },
          text = "Shadumbra's fur is the colour of pitch, and you won't see her until she wants you to, so listen more than you look." },
        { id = "h_bird", tags = { "news" }, when = { questActive = TODO_QUEST("Sharptalon's Claw") },
          text = "Sharptalon is proud and fierce, and the most dangerous of the three. Bring friends with you, for that isn't shameful but wise." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Hunt Completed") },
          text = "All three! The forest knows your name now, hunter, so carry it gently." },
        { id = "h_call", when = { metBefore = true },
          text = "Can you hear the Hunt calling? It is quiet, and it doesn't come from the trees; it comes from somewhere deep inside you." },
      },
      again = {
        { id = "h_again", text = "What else? Speak softly; the forest is listening." },
        { id = "h_again2", text = "Ask, and then go and listen to the trees a while." },
      },
      choices = {
        { text = "Why hunt them, if you love the forest?", next = "why" },
        { text = "Tell me about the three beasts.", next = "beasts" },
        { text = "Does it trouble you, fighting a war here?", next = "war_s" },
        { text = "I'm a hunter. Where should I start?", next = "start", when = { class = "HUNTER" } },
        { text = "The Earth Mother would weep at this war.", next = "mother", when = { race = "Tauren" } },
        { text = "I'll take on the Hunt.", next = "END", fx = { affinity = 1 } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because loving a forest means knowing all of it, teeth included. The beasts don't hate us; they test us, and I would rather we passed." },
      },
      choices = {
        { text = "That's a good way to see it.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } },
        { text = "And the night elves?", next = "elves_s" },
      },
    },
    elves_s = {
      lines = { { id = "es_default", text = "They tame these beasts; Ursangous's paw bears a crescent that I believe is their mark. To them we are poachers in their home, and I understand why they hate us, even when I cannot agree." } },
      choices = {
        { text = "That's generous.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'd do the same to us.", next = "BACK", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "Ursangous troubles the road to Stonetalon, Shadumbra makes the walk west to the Zoram Strand a gamble, and Sharptalon tears at the peons coming from the lumber camps. Ending them is a service as well as a test." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    war_s = {
      lines = { { id = "ws_default", text = "Every day. The orcs need the wood and the elves need the forest, and I need both sides to stop long enough to see what they are fighting over." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    start = {
      lines = { { id = "st_default", text = "Start with the bear, near the Talondeep Path. He will teach you what the cat won't forgive and the bird won't wait for." } },
      choices = { { text = "The bear, then.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    mother = {
      lines = { { id = "mo_default", text = "She would, and I think she does, every time an axe bites. But she also made both the hunter and the hunted, and I try to honour them both." } },
      choices = { { text = "May she watch over us.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a hunter who came for the Hunt and never quite left." } },
    advice = { { id = "tp_ad", text = "When you hunt, learn your quarry first; the kill is the smallest part of it." } },
    warsong = { { id = "tp_warsong", text = "They cut what they need, and a little more. I tell them so, and they don't listen." } },
    cenarion_circle = { { id = "tp_circle", text = "The druids would weep to see this war, and some of them do. I've met a few under the trees, where neither side was looking." } },
    _none = { { id = "tp_none", text = "I don't know. But walk out under those trees a while, and you might find out." } },
  },
}

P:NPC {
  key = "mastok", id = TODO_NPC("Mastok Wrilehiss"), name = "Mastok Wrilehiss",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "splintertree" }, temper = { "gruff" }, values = { "practical" },
  notices = { "kit" },

  greetings = {
    { id = "g_gruff", text = "What is it? I'm counting wagons, so speak fast or speak elsewhere." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you. Fine; you're one of the few who doesn't waste my time." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like a wagon the elves got to. Get yourself mended, because I can't count you if you're dead." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Name's Mastok. I track every caravan in and out of Splintertree, because people are trouble and wagons are just wagons, and I prefer wagons." },
        { id = "h_element", tags = { "news" }, when = { questDone = TODO_QUEST("Stonetalon Standstill") },
          text = "Somebody churned that lake up good, I hear, and the transports to Stonetalon are moving again. That's what I call useful." },
        { id = "h_standstill", when = { questActive = TODO_QUEST("Stonetalon Standstill") },
          text = "The lake by the Talondeep Path has come alive and attacks anything on the road, so the transports to Stonetalon are at a standstill. Put it down, and while you're there, scout that gazebo on Mystral Lake." },
        { id = "h_count", when = { metBefore = true }, text = "Seventeen wagons this week, and the elves burned three of them. I count the burned ones too, so I remember who to be angry at." },
      },
      again = {
        { id = "h_again", text = "What now? Make it quick, because I've wagons to count." },
        { id = "h_again2", text = "Still here? Then ask your question and let me count." },
      },
      choices = {
        { text = "Why count everything?", next = "count" },
        { text = "Why don't you like people?", next = "people" },
        { text = "What's going on at Mystral Lake?", next = "mystral" },
        { text = "For the Horde, Mastok.", next = "orc_m", when = { race = "Orc" } },
        { text = "Fine. Bye.", next = "END" },
      },
    },
    people = {
      lines = { { id = "p_default", text = "People ask questions, like that one. Wagons never ask anything, so go away now." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
    count = {
      lines = {
        { id = "c_lumber", text = "The Warchief asked for lumber, and lumber doesn't lie. Grunts lie all the time, but wagons don't." },
      },
      choices = {
        { text = "Where does it all go?", next = "lumber2" },
        { text = "Fair.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    lumber2 = {
      lines = { { id = "l2_default", text = "Down the road to Orgrimmar, where it comes back as walls and roofs and boats. Every plank's a fight with the elves, so I count every plank." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mystral = {
      lines = { { id = "my_default", text = "Water elementals, risen out of the lake, and an Alliance outpost at Silverwind with a pretty gazebo looking right at it. Somebody watching from that gazebo could see everything the elves get up to." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    orc_m = {
      lines = { { id = "or_default", text = "Yeah, yeah, for the Horde. The Horde needs wood, the wood needs counting, and I'm the orc who counts it, so that's my part done." } },
      choices = { { text = "Lok'tar.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I count wagons. That's my whole story, and it's a good one." } },
    advice = { { id = "tp_ad", text = "Never ride on top of the lumber wagons, because the elves shoot at those first." } },
    warsong = { { id = "tp_warsong", text = "Grom's clan. They cut what the Warchief needs, and I count it." } },
    _none = { { id = "tp_none", text = "That's not a wagon, so it's not my problem." } },
  },
}

P:NPC {
  key = "kuraybin", id = TODO_NPC("Kuray'bin"), name = "Kuray'bin",
  bible = "bibles/ashenvale.md", role = "soldier", tier = "quest",
  communities = { "splintertree" }, temper = { "wary" }, values = { "loyal", "cunning" },
  notices = { "stealth", "race" },

  greetings = {
    { id = "g_wary", text = "Easy, mon. Eyes open and back to the wall, that be how we live in these woods." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "A shadow-walker, good. We need folk who can see the elves before the elves see us." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! Good to see a cousin this far from the Echo Isles; the forest be strange to us, but we be stranger to it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Kuray'bin, and I watch the paths into Splintertree. The night elves send runners through the trees, quick and quiet, and I make sure they don't get home." },
        { id = "h_outrunners", tags = { "news" }, when = { questActive = TODO_QUEST("Ashenvale Outrunners") },
          text = "Outrunners from Silverwing Outpost be sneakin' round our ground, countin' our numbers for their captains. Hunt them in the forest south of here before they get home." },
        { id = "h_creak", when = { metBefore = true }, text = "Every night the trees creak and I think it be elves, and every morning I still be alive. Either I'm lucky, mon, or the trees be on my side." },
        { id = "h_blind", when = { questDone = TODO_QUEST("Ashenvale Outrunners") },
          text = "Those outrunners won't be tellin' anybody nothin' now. Blind the Alliance, mon, and they think twice before they come." },
      },
      again = {
        { id = "h_again", text = "What else you be needin', mon? Keep your voice down out here." },
        { id = "h_again2", text = "Ask it quick, and then back to watchin' the trees." },
      },
      choices = {
        { text = "Do you miss the islands?", next = "islands" },
        { text = "How bad is the fighting?", next = "fighting" },
        { text = "What are the outrunners after?", next = "outrun" },
        { text = "Echo Isles born, cousin?", next = "cousin", when = { race = "Troll" } },
        { text = "I can slip past their scouts.", next = "rogue_k", when = { class = "ROGUE" } },
        { text = "Stay sharp.", next = "END" },
      },
    },
    fighting = {
      big = true,
      lines = {
        { id = "f_default", text = "The elves think every tree we cut be a murder, and we think we need the wood to live. Both of us be right a little, and that never stopped a war, mon." },
      },
      choices = {
        { text = "Who's winning?", next = "winning" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    winning = {
      lines = { { id = "wi_default", text = "Nobody, mon. Maybe the forest be winnin', because it grows back and we don't." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    islands = {
      lines = {
        { id = "i_sand", text = "Every day, mon. Warm sand and salt wind back there, and here it be all shadow and bark, but the Horde needs wood and the Darkspear pay their debts." },
      },
      choices = {
        { text = "What debt?", next = "debt" },
        { text = "The Horde's lucky to have you.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    debt = {
      lines = { { id = "de_default", text = "Thrall saved our people when the sea witch and the humans had us cornered, and he gave us a place in the Horde. Darkspear don't forget a debt like that, mon." } },
      choices = {
        { text = "A debt like that is worth honoring.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Thrall bought loyal soldiers cheaply. That was smart of him.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    outrun = {
      lines = { { id = "ou_default", text = "Numbers, mon: how many grunts, how many wagons, where the walls be weak. When they be blind, the Alliance thinks twice before it comes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cousin = {
      lines = { { id = "co_default", text = "That I be. Here it be all wind in the leaves instead of the sea, so tell me, how be things back home?" } },
      choices = {
        { text = "Sen'jin Village is holding.", next = "BACK", fx = { affinity = 2 } },
        { text = "I haven't been back in a long time.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    rogue_k = {
      lines = { { id = "rk_default", text = "Then go south of the post and east of Silverwing, quiet-like. The outrunners be fast, but they never look up into the branches." } },
      choices = { { text = "I'll be in the branches.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I be a Darkspear far from home, watchin' trees for elves. Not much more to it than that, mon." } },
    advice = { { id = "tp_ad", text = "Listen to the birds, mon, because when they stop singin', somebody be comin'." } },
    _none = { { id = "tp_none", text = "Don't know, mon, so ask the shamans; they be talkin' to the spirits, not me." } },
  },
}
