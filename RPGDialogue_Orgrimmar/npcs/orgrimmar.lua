-- Orgrimmar. Voice: bibles/orgrimmar.md
-- Neeru Fireblade's secret (he runs the Burning Blade) never slips from his own mouth;
-- Thrall's lines show he already suspects.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thrall", id = TODO_NPC("Thrall"), name = "Thrall",
  bible = "bibles/orgrimmar.md", role = "noble", tier = "major",
  communities = { "orgrimmar" }, temper = { "steady" }, values = { "honorable", "compassionate", "cunning" },
  spiritSensitive = true,
  notices = { "race", "class" },

  greetings = {
    { id = "g_warchief", text = "Lok'tar. Speak freely, warrior. In this hall, every voice of the Horde is heard." },
    { id = "g_orc", when = { race = "Orc" }, text = "Brother. Sister. We were slaves once, and now we have a home. Never let anyone make us forget either." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. The Horde is stronger for every warrior who comes back. Sit." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The elements spoke to me when I had nothing else. Listen to them, and they'll never leave you alone." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. The Horde has a long, bitter history with your arts. I'll judge you by what you do with them. So will everyone else." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "The Forsaken stand with us. I won't pretend I understand the Dark Lady. But I understand being made into something you never chose." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thrall, Warchief of the Horde. Orgrim Doomhammer gave me his hammer and his people with his last breath. I've spent every day since trying to deserve both." },
        { id = "h_hidden", tags = { "news" }, when = { questActive = TODO_QUEST("Hidden Enemies") },
          text = "Some in my city wear the Horde's colours and serve older masters. I need someone they'll trust. Gain it. Then bring me what they know." },
        { id = "h_hidden_done", when = { questDone = TODO_QUEST("Hidden Enemies") },
          text = "You did well in the chasm. The rot isn't gone; it never is entirely. But it's weaker, and it knows I'm watching." },
        { id = "h_neeru", when = { heardLine = "neeru.h_default" },
          text = "The Cleft, was it? Neeru Fireblade is very helpful, isn't he? Keep being helpful back. Quietly. And tell me what he says." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Horde" },
          text = "The Windshapers. The Earthen Ring vouched for you, and the tauren took you in. That's good enough for me. Welcome to the Horde." },
      },
      choices = {
        { text = "What does the Horde stand for?", next = "horde" },
        { text = "What of the humans at Theramore?", next = "theramore" },
        { text = "For the Horde.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    horde = {
      big = true,
      lines = {
        { id = "hd_default", text = "Once it stood for conquest. The demons made us into a weapon and pointed us at the world. Now it stands for survival, and for honour, and for each other. I mean to keep it that way." },
      },
      choices = {
        { text = "I'll help you keep it.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Not everyone agrees.", next = "agree" },
      },
    },
    agree = {
      lines = { { id = "a_default", text = "No. Some still dream of the old fire. I watch them. I give them chances. And when they betray us, I don't miss." } },
      choices = { { text = "...", next = "END" } },
    },
    theramore = {
      lines = { { id = "t_default", text = "Jaina Proudmoore is a friend, though her people and mine aren't. We keep the peace between us with our own hands, because nobody else will. It is harder than any battle I've fought." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The tauren walk with them. I'm glad of it. The world needs more who heal than wound." } },
    wailing_caverns = { { id = "tp_caverns", text = "The tauren have told me. Something sick under the Barrens. When our young warriors are ready, they'll go in." } },
    _none = { { id = "tp_none", text = "I don't know. Ask my advisors. Then come and tell me what they said, in plain words." } },
  },
}

P:NPC {
  key = "neeru", id = TODO_NPC("Neeru Fireblade"), name = "Neeru Fireblade",
  bible = "bibles/orgrimmar.md", role = "questgiver", tier = "major",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "ambitious", "proud" },
  notices = { "class", "fel" },

  greetings = {
    { id = "g_cleft", text = "The Cleft of Shadow welcomes you. Don't be alarmed by the dark. It keeps the curious out, and the useful in." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my capable friend. I was hoping you'd return. I have more work for capable friends." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", when = { class = "WARLOCK" },
      text = "A fellow student of the deeper arts. We're misunderstood, you and I. Thankfully, we understand each other." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. How quaint. The elements are so... polite. Do come back if you ever want more than politeness." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Neeru Fireblade, loyal servant of the Warchief. I keep an eye on those in the Horde who still play with fire. Someone with experience must, after all." },
        { id = "h_burning", tags = { "news" }, when = { questActive = TODO_QUEST("Burning Shadows") },
          text = "An eye, taken from a cultist's body? How dreadful. Bring it to me. I'll see that it's dealt with properly." },
        { id = "h_akzeloth", when = { questActive = TODO_QUEST("Ak'Zeloth") },
          text = "My assistant will guide you. There's a seed of something unpleasant in the Barrens. We wouldn't want it growing where the wrong people could tend it." },
        { id = "h_hidden", when = { questActive = TODO_QUEST("Hidden Enemies") },
          text = "The Searing Blade in Ragefire are so eager. So eager to prove themselves. Deal with their leaders. It will... clarify things." },
      },
      choices = {
        { text = "What is the Burning Blade?", next = "blade" },
        { text = "What do you think of Thrall?", next = "thrall" },
        { text = "I'll be going.", next = "END" },
      },
    },
    blade = {
      big = true,
      lines = {
        { id = "b_default", text = "Fanatics. Leftovers from the old days, who still crave the fire the demons gave us. Dangerous, foolish, and ever so useful to watch. I watch them very closely." },
      },
      choices = {
        { text = "Good. Keep watching.", next = "END", fx = { affinity = 1 } },
        { text = "You seem to know them well.", next = "know", fx = { trait = { skeptical = 1 } } },
      },
    },
    know = {
      lines = { { id = "k_default", text = "One studies one's enemies. Surely you know that. Now, I'm terribly busy." } },
      choices = { { text = "...", next = "END" } },
    },
    thrall = {
      lines = { { id = "t_default", text = "A great leader. Such vision. Such patience. Such faith in people. It's very touching." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I couldn't say. But do tell me if you hear anything interesting. I collect interesting things." } },
  },
}

P:NPC {
  key = "gryshka", id = TODO_NPC("Innkeeper Gryshka"), name = "Innkeeper Gryshka",
  bible = "bibles/orgrimmar.md", role = "innkeeper", tier = "service",
  communities = { "orgrimmar" }, temper = { "hearty" }, values = { "generous" },
  notices = { "weary", "hunger" },

  greetings = {
    { id = "g_tusk", text = "Sit, warrior. Food first, then you tell me who you fought. That's the price of a seat at the Tusk." },
    { id = "g_home", when = { homeInn = { "Orgrimmar", "Valley of Strength" } }, text = "The Tusk missed you! Your bed's warm and there's a haunch on the spit. Good timing." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Blood everywhere. Some of it's yours. Sit down and eat before you fall down. Meat first. Always meat first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gryshka. I keep the Broken Tusk, and I keep it fed. Nobody leaves my inn hungry. A few leave too full to walk." },
        { id = "h_zargh", when = { questActive = TODO_QUEST("Meats to Orgrimmar") },
          text = "From Zargh? Choice cuts from the Barrens. He remembered. Of course he remembered. Tell him... tell him the meat was very good." },
        { id = "h_zargh_ack", when = { heardLine = "zargh.h_default" },
          text = "Zargh, at the Crossroads? Did he mention me? He did? What did he say? No, don't tell me. Yes, tell me." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "What's the best thing you cook?", next = "best" },
        { text = "Just resting.", next = "END" },
      },
    },
    best = {
      lines = { { id = "b_default", text = "Kodo, slow-roasted. Boar, if the hunters are lucky. Anything Zargh sends, if I'm lucky." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the regulars. They know everything and drink to the rest." } },
  },
}

P:NPC {
  key = "gamon", id = TODO_NPC("Gamon"), name = "Gamon",
  bible = "bibles/orgrimmar.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "resigned" }, values = { "patient" },
  notices = { "class", "drink" },

  greetings = {
    { id = "g_sigh", text = "Oh. Hello. You're not going to hit me, are you? Everyone hits me. I've stopped asking why." },
    { id = "g_low", when = { maxLevel = 5 }, text = "Another young one. Let me guess. You heard there's a tauren in the inn you can beat up. There is. Please don't." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. I was one too, once. Then I started drinking. Then people started hitting me. I'm not sure which came first anymore." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You're drunk too! Finally, someone who understands. Sit. Don't hit me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gamon. I help Tazan with his trade, when I'm sober. I'm usually here. And I'm usually lying on the floor, because someone's knocked me down again." },
      },
      choices = {
        { text = "Why does everyone attack you?", next = "why" },
        { text = "I won't hit you.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Bye, Gamon.", next = "END" },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "I'm here, I suppose. And I always get back up. Maybe that's the trouble. Maybe if I stayed down, they'd get bored." },
      },
      choices = {
        { text = "Never stay down, Gamon.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "...", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know. I spend most days looking at the ceiling. It's a nice ceiling." } },
  },
}
