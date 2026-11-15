-- The Eastweald beyond the chapel: Tirion's cottage by the river, and the Marris Stead. Voice: bibles/easternplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tirion", id = TODO_NPC("Tirion Fordring"), name = "Tirion Fordring",
  bible = "bibles/easternplaguelands.md", role = "noble", tier = "major",
  communities = { "eastweald" }, temper = { "weary" }, values = { "honorable", "loyal", "kind" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_river", text = "A visitor, out here? Mind Mirador. He's old, and he doesn't like strangers. Neither did I, once. I've had time to change." },
    { id = "g_back", when = { metBefore = true }, text = "Back by the river. Sit. The fish don't bite, but the water's still pleasant to watch." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. I knew one, long ago. A good one. Defending him cost me everything I had. I'd do it again." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I was one, before they took it from me. Tell me the order still teaches mercy. Lie, if you must." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tirion Fordring. Once a knight of the Silver Hand, and lord of Hearthglen. Now an old man by a river, with a horse and a fishing line. It's a quieter life. I didn't choose it." },
        { id = "h_food", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Demon Dogs") }, { questActive = TODO_QUEST("Blood Tinged Skies") }, { questActive = TODO_QUEST("Carrion Grubbage") } } },
          text = "The plague is in everything here: the beasts, the birds, the meat. Thin out the sick ones, and bring me what's still clean. An old man has to eat." },
        { id = "h_redemption", when = { questActive = TODO_QUEST("Redemption") },
          text = "You've earned the story, then. Sit, and I'll tell you about my son." },
        { id = "h_memories", when = { any = { { questActive = TODO_QUEST("Of Forgotten Memories") }, { questActive = TODO_QUEST("Of Lost Honor") }, { questActive = TODO_QUEST("Of Love and Family") } } },
          text = "Pieces of a life I lost. A hammer, an honor, a painting. Bring them to me, and I'll find the courage to use them." },
        { id = "h_myranda", when = { questActive = TODO_QUEST("Find Myranda") },
          text = "Myranda can help you walk among the Crusade unseen. I don't trust her. I don't need to. I only need her to be good at what she does." },
      },
      again = { { id = "h_again", text = "Sit a while longer. The fish aren't biting anyway." } },
      choices = {
        { text = "What happened to you?", next = "story" },
        { text = "Tell me about your son.", next = "son" },
        { text = "Do the fish ever bite?", next = "fish" },
        { text = "Who's the horse?", next = "mirador" },
        { text = "Does the Light still hear you?", next = "paladin", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "An orc saved your life?", next = "eitrigg", when = { race = { "Orc", "Human", "Dwarf" } } },
        { text = "I'll help you.", next = "END", fx = { affinity = 2, align = { light = 1, honor = 1 } } },
      },
    },
    story = {
      big = true,
      lines = {
        { id = "s_default", text = "There was an orc, Eitrigg, living alone in the hills near Hearthglen. He saved my life. When my people came to kill him, I stood between them. For that they stripped me of the Light and of my lands, and named me traitor. My wife told my son I'd died. Perhaps that was a kindness." },
      },
      choices = {
        { text = "Do you regret it?", next = "regret" },
        { text = "That's a cruel reward for mercy.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    regret = {
      lines = {
        { id = "r_default", text = "Not for a moment. I regret what it cost my family. I'd never regret what I did. A paladin who only protects his own kind isn't a paladin. He's a sword with a prayer painted on it." },
      },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 3, align = { light = 2, honor = 1 }, trait = { kind = 1 } } } },
    },
    son = {
      lines = { { id = "so_default", text = "Taelan. A boy when I lost him, a man now, and wearing the Crusade's red. He thinks his father died a traitor. I think of him every morning, and I fish, and I don't go to Hearthglen." } },
      choices = {
        { text = "You should go to him.", next = "son_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    son_go = {
      lines = { { id = "sg_default", text = "Perhaps. When I've found the courage to be his father again, and not just a story his mother told. Ask me another day." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    fish = {
      lines = { { id = "f_default", text = "Rarely. The river's sick, like everything here. I don't fish for the fish. I fish because a man has to sit still somewhere, or he goes to Hearthglen and does something foolish." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mirador = {
      lines = { { id = "m_default", text = "Mirador. The last thing I kept. He's older than he looks and wiser than I am. He knew to leave Hearthglen before I did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    paladin = {
      big = true,
      lines = { { id = "p_default", text = "They took my right to call on it. They couldn't take the habit of listening. Some mornings I think I hear it. Some mornings I'm only an old man by a river." } },
      choices = {
        { text = "It hears you. I'm sure of it.", next = "BACK", fx = { affinity = 3, align = { light = 2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eitrigg = {
      lines = { { id = "e_default", text = "He did. Old, tired of war, living on his own. He pulled me out of a fight I'd have lost, and asked nothing for it. I've known few men, of any kind, better." } },
      choices = {
        { text = "Where is he now?", next = "eitrigg_now" },
        { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } },
      },
    },
    eitrigg_now = {
      lines = { { id = "en_default", text = "With his own people, in Orgrimmar, I'm told. I hope they treat him better than mine treated me. I suspect they do." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A lord, a paladin, a traitor, a fisherman. Each of them was true for a while.", next = "story" } },
    advice = { { id = "tp_ad", text = "Do the right thing, and pay what it costs without complaining. That's the whole of the Light, as far as I can tell." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Some of the finest people I knew joined them, to save Lordaeron. Now they burn what's left of it. My son is among them. I try not to think about that, and fail." } },
    argent_dawn = { { id = "tp_dawn", text = "Good people at the chapel. They'd have me, I think. I'm not ready. One day." } },
    _none = { { id = "tp_none", text = "I've been out of the world a long while, friend. Ask the chapel." } },
  },
}

P:NPC {
  key = "nathanos", id = TODO_NPC("Nathanos Blightcaller"), name = "Nathanos Blightcaller",
  bible = "bibles/easternplaguelands.md", role = "soldier", tier = "major",
  communities = { "marris_stead" }, temper = { "cold" }, values = { "loyal", "proud" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_stead", text = "You stand on my land. It was my family's, before the plague. Now it serves the Banshee Queen. As do I." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. I was the finest ranger in Lordaeron, once. The elves trained me, and hated that I was good at it. You may prove useful." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of the Queen's own. Then you know the debt we owe her. Repay it here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nathanos, Champion of the Banshee Queen. They call me the Blightcaller. The Scourge, the plaguebats, and the Scarlet zealots all crawl over these fields. I mean to clear them, and you'll help." },
        { id = "h_queen", when = { heardLine = "sylvanas.h_default" },
          text = "You've stood before my Queen. Then you know why I serve. She gave me back my mind. I'll give her everything else." },
        { id = "h_back", when = { metBefore = true },
          text = "Still alive. Adequate. Most of those she sends me are not." },
      },
      choices = {
        { text = "This was your home?", next = "home" },
        { text = "I'll clear the fields.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    home = {
      lines = {
        { id = "hm_default", text = "I was born in that house. I was a ranger lord when there were still lords in Lordaeron. The Scourge took it, and me. The Queen returned me. The house, I'll take back myself." },
      },
      choices = { { text = "Then let's take it back.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "Living fanatics who think fire cures death. They'll learn. Some of them, I'll teach personally." } },
    _none = { { id = "tp_none", text = "Irrelevant." } },
  },
}
