-- More of Stormwind: the Cathedral's paladin trainers, the Dwarven District's master smith,
-- the Royal Library, and the cheesemonger who isn't only a cheesemonger.
-- Voices: bibles/city2.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Lord Grayson Shadowbreaker: a lord of the Silver Hand; demanding, methodical.
P:NPC {
  key = "grayson_sb", id = TODO_NPC("Lord Grayson Shadowbreaker"), name = "Lord Grayson Shadowbreaker", title = "Paladin Trainer",
  bible = "bibles/city2.md", role = "trainer", tier = "major",
  communities = { "stormwind" }, temper = { "proud" }, values = { "pious", "lawful", "stern" },
  spiritSensitive = true,
  notices = { "kit", "readiness" },

  greetings = {
    { id = "g_paladin", when = { class = "PALADIN" }, text = "The Light's protection on you today. Now, what have you learned since I saw you last?" },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "The Light's protection on you. You'll find no lessons for your path here." },
    { id = "g_veteran", when = { class = "PALADIN", minLevel = 50 }, text = "You've come far. Far enough that we should speak about what comes next." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "PALADIN", durability = { max = 0.3 } },
      text = "Your harness is neglected. A paladin who can't care for their own gear will not care for a charger. Remember that; you'll need it someday." },
    { id = "n_ready", cat = "readiness", when = { class = "PALADIN", minLevel = 40 },
      text = "You carry yourself like someone who's been tested. Good. The tests don't end. They only grow quieter, and harder." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Grayson Shadowbreaker, of the Silver Hand. I train the paladins who pass through this Cathedral, and I am not easily satisfied." },
        { id = "h_young", when = { class = "PALADIN", maxLevel = 20 },
          text = "Rall's student, are you? He'll teach you compassion. I'll teach you discipline. You'll find you need both, usually on the same day." },
        { id = "h_charger", when = { class = "PALADIN", minLevel = 55 },
          text = "A charger isn't a horse with better armor. It's a bond with something beyond this world. The barding, the spirit, the rider. Each must be worthy." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Your people have no paladins, I'm told. No matter. The Cathedral's doors are as open to you as to anyone." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "What does the Silver Hand stand for now?", next = "hand" },
        { text = "May the Light protect you too.", next = "END", fx = { affinity = 1 } },
      },
    },
    hand = {
      big = true,
      lines = { { id = "hd_default", text = "What it always did, with fewer of us to stand for it. Lordaeron took our best. The rest of us hold the line they left." } },
      choices = {
        { text = "Then I'll help hold it.", next = "END", fx = { affinity = 2, align = { light = 1, order = 1 } } },
        { text = "Some say the Hand died with Uther.", next = "uther", fx = { trait = { skeptical = 1 } } },
      },
    },
    uther = {
      lines = { { id = "u_default", text = "Some say a great many things. The Hand is the people who keep its oaths. Count us, and decide for yourself." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    tome_of_divinity = { { id = "tp_tome", text = "The first trial. There are many more. The last ones are not written in any book." } },
    _none = { { id = "tp_none", text = "That is not my concern. My concern is whether you're ready." } },
  },
}

-- Arthur the Faithful: the Cathedral's east wing; devout.
P:NPC {
  key = "arthur", id = TODO_NPC("Arthur the Faithful"), name = "Arthur the Faithful", title = "Paladin Trainer",
  bible = "bibles/city2.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "steady" }, values = { "pious", "kind" },
  spiritSensitive = true,
  notices = {},

  greetings = {
    { id = "g_paladin", when = { class = "PALADIN" }, text = "{g:Brother|Sister}. Come and kneel a moment before we begin." },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "The Light keep you, friend. The Cathedral has a quiet corner for anyone who needs one." },
  },

  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", text = "Arthur. They call me the Faithful. I've never been sure I earned it. I keep trying to." },
      { id = "h_grayson", when = { class = "PALADIN" }, text = "Lord Shadowbreaker will test you. Katherine will correct you. I'll pray with you. Between the three of us, you'll survive." },
    },
    choices = { { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } }, { text = "Thank you.", next = "END" } },
  } },

  topics = { _none = { { id = "tp_none", text = "I don't know. I'll pray on it, if that helps." } } },
}

-- Grimand Elmore: the Dwarven District's master weaponsmith and barding-maker.
P:NPC {
  key = "elmore", id = TODO_NPC("Grimand Elmore"), name = "Grimand Elmore",
  bible = "bibles/city2.md", role = "blacksmith", tier = "quest",
  communities = { "stormwind" }, temper = { "proud" }, values = { "honest", "ambitious" },
  notices = { "craft", "kit" },

  greetings = {
    { id = "g_anvil", text = "Finest craftsmanship on the continent. It isnae cheap. It's worth it." },
    { id = "g_task", when = { questActive = TODO_QUEST("Elmore's Task") }, text = "Argus sent ye? Then let's see what ye've brought me." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Smith's hands. Let me see the burns. Aye, ye've been at it. Keep at it. In twenty years ye might be adequate." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.2 } },
      text = "Who made that armor? No, dinnae tell me. Whoever it was, it's given up." },
  },

  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", key = true, text = "Elmore. I make weapons, and I make barding for paladins' chargers, and nobody in Azeroth makes it better. Ask Lord Shadowbreaker whose work his mount wears." },
      { id = "h_argus", when = { heardLine = "argus.s_default" },
        text = "Argus told ye never tae let the apprentice near the quench? Good lad. My apprentice Furen's still not allowed near mine." },
      { id = "h_paladin", when = { class = "PALADIN", minLevel = 50 },
        text = "Ye'll be wantin' barding someday, if Shadowbreaker thinks ye're worth a charger. Save yer coin now. Save a lot of it." },
    },
    choices = { { text = "Let me see your work.", next = "BUSINESS" }, { text = "Another time.", next = "END" } },
  } },

  topics = {
    _none = { { id = "tp_none", text = "If it doesnae ring when ye strike it, I've no interest." } },
  },
}

-- Milton Sheaf: the Royal Library.
P:NPC {
  key = "milton", id = TODO_NPC("Milton Sheaf"), name = "Milton Sheaf", title = "Librarian",
  bible = "bibles/city2.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "cowardly" }, values = { "curious" },
  notices = { "lore" },

  greetings = {
    { id = "g_hush", text = "Shh. Whisper, please. The books are sleeping." },
    { id = "g_book", when = { questActive = TODO_QUEST("An Old History Book") }, text = "Have you found it? The old history? Gently, gently, it's older than both of us." },
  },

  notice = {
    { id = "n_reader", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "You've read The Seven Kingdoms! Properly, I can tell, not just the pictures. Come back any time. Bring clean hands." },
  },

  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", text = "Milton Sheaf, keeper of the Royal Library. I collect books from all over the kingdom. Mostly I collect people to collect books for me." },
      { id = "h_foe", text = "Know your enemy, they say. I'd go further. Know everything about everyone. It saves so much trouble later." },
    },
    choices = { { text = "Need anything found?", next = "BUSINESS" }, { text = "I'll let you read.", next = "END" } },
  } },

  topics = {
    seven_kingdoms = { { id = "tp_kingdoms", text = "A classic. A bit generous to Alterac, I always felt." } },
    _none = { { id = "tp_none", text = "There'll be a book about it. There's a book about everything. I just haven't found that one yet." } },
  },
}

-- Elling Trias: Trias' Cheese, Trade District. Cheesemaker. Also not.
P:NPC {
  key = "elling", id = TODO_NPC("Elling Trias"), name = "Elling Trias", title = "Cheesemaker",
  bible = "bibles/city2.md", role = "vendor", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "cunning", "witty" },
  notices = { "watch" },

  greetings = {
    { id = "g_cheese", text = "Cheese. We sell cheese. That's all we do here. Cheese." },
    { id = "g_diplomat", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "Keep your voice down and buy some cheddar. Look natural." },
  },

  notice = {
    { id = "n_watch", cat = "watch", when = { class = "ROGUE" },
      text = "You looked at the cellar door before you looked at the cheese. Everyone who does that ends up working for the same people. Hello, colleague." },
  },

  start = "hello",
  nodes = { hello = {
    lines = {
      { id = "h_default", key = true, text = "Elling Trias. My wife Elaine makes the cheese, my boy Ben sells it, and I stand here looking honest. It's a family business." },
      { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
        text = "A diplomat goes missing in the middle of Stormwind, and nobody's surprised. That should worry you more than the diplomat." },
      { id = "h_shaw", when = { heardLine = "shaw.h_default" },
        text = "You've met the Master? Then you know where I stand. Don't say it out loud. The cheese has ears. Well. The customers do." },
    },
    choices = { { text = "I'll take some cheese.", next = "BUSINESS" }, { text = "Just passing.", next = "END" } },
  } },

  topics = {
    defias = { { id = "tp_defias", text = "Terrible customers. Steal the samples." } },
    _none = { { id = "tp_none", text = "Couldn't say. Have you tried the gouda?" } },
  },
}
