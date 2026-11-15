-- Foreman Oslow, at the Everstill Bridge. Voice: bibles/oslow.md
-- On schedule, under budget, and with no tools.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "oslow", id = TODO_NPC("Foreman Oslow"), name = "Foreman Oslow",
  bible = "bibles/oslow.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "proud" }, values = { "ambitious", "honest" },
  notices = { "craft", "swim" },

  greetings = {
    { id = "g_busy", text = "Unless you're carrying a hammer, keep walking." },
    { id = "g_tools", when = { questActive = TODO_QUEST("The Lost Tools") }, text = "My toolbox? Have you got my toolbox? Then why are you dry?" },
    { id = "g_after", when = { questDone = TODO_QUEST("The Everstill Bridge") }, text = "Look at that span. Go on, look at it. That's craftsmanship." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { any = { { profession = "Blacksmithing" }, { profession = "Engineering" }, { profession = "Mining" } } },
      text = "You've a tradesman's hands. If you ever want honest work that isn't stabbing things, I'm hiring. I'm always hiring. Nobody stays." },
    { id = "n_wet", cat = "swim", when = { questReady = TODO_QUEST("The Lost Tools") },
      text = "You're dripping on my plans. Never mind. Is that my box? That's my box!" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Oslow. I'm rebuilding the Everstill Bridge, on schedule and under budget, before the rains. That was the plan. Then the orcs had opinions." },
        { id = "h_tools", when = { questBefore = TODO_QUEST("The Lost Tools") },
          text = "My tools came across the lake by boat. A catapult put the boat at the bottom. My tools are down there with it. My good hammer." },
        { id = "h_tools_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Lost Tools") },
          text = "Off the end of the wreck, at the bottom. Hold your breath, mind the murlocs, and don't drop it on the way up." },
        { id = "h_tools_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Lost Tools"), days = 3 } },
          text = "Rusted shut, but they're mine. Every one's got my mark on the handle. Back to work." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("The Everstill Bridge") },
          text = "Gnolls ran off with my iron from Stormwind. Pikes and rivets. What does a gnoll want with rivets? They don't even build." },
        { id = "h_rains", when = { questDone = TODO_QUEST("The Everstill Bridge") },
          text = "The rains are coming. The bridge will be done before they do. Write that down somewhere I can point at later." },
        { id = "h_ink", tags = { "news" }, when = { questActive = TODO_QUEST("Ink Supplies") },
          text = "A librarian wants ore. For ink. While I've got a town to fortify. Northshire has a funny idea of what matters this month." },
        { id = "h_rethban", when = { questActive = TODO_QUEST("Rethban Ore") },
          text = "Rethban Caverns, north of town. The gnolls are digging the seam out themselves now, so take it off them and carry it to Paxton yourself." },
        { id = "h_bridge", when = { metBefore = true }, text = "Laid another span yesterday. Straight as a ruler. I stood on it a while. Don't tell the crew. They'll think I've gone soft about bridges." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I measure. I can do both." },
        { id = "h_again2", text = "Go on. The bridge isn't going anywhere. That's rather the problem." },
      },
      choices = {
        { text = "Why does the bridge matter so much?", next = "why" },
        { text = "What happened to your tools?", next = "tools" },
        { text = "Where are your building supplies?", next = "supplies" },
        { text = "Brother Paxton needs Rethban ore for his ink.", next = "paxton", when = { questActive = TODO_QUEST("Ink Supplies") } },
        { text = "Northshire's library writes with your ore, I hear.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "I know my way around a forge. Show me the plans.", next = "plans", when = { profession = "Blacksmithing" } },
        { text = "Good luck with the rains.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "w_default", text = "Without it, every guard, every wagon, every sack of grain goes the long way round the lake. A bridge is just a town's way of not being alone." },
      },
      choices = {
        { text = "I'll help you finish it.", next = "BACK", fx = { affinity = 2, learn = { "everstill_bridge" } } },
        { text = "Pretty speech for a builder.", next = "speech", fx = { trait = { witty = 1 } } },
        { text = "How did it come down?", next = "collapse" },
      },
    },
    speech = {
      lines = { { id = "sp_default", text = "I had it carved on the last bridge. The orcs knocked that one down too." } },
      choices = { { text = "Ha. Fair.", next = "BACK" } },
    },
    collapse = {
      big = true,
      lines = {
        { id = "c_default", text = "The Blackrock hit the town so hard the bridge went with it. Blown out in an afternoon. Putting it back takes a season, if nobody sinks my tools." },
      },
      choices = {
        { text = "Will it hold this time?", next = "collapse_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    collapse_hold = {
      lines = { { id = "ch_default", text = "I build bridges to hold. Nobody builds them to hold against orcs with catapults. Somebody should. Give me ten years and it might be me." } },
      choices = {
        { text = "I believe it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Ten years? Lakeshire doesn't have ten weeks.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },

    tools = {
      lines = {
        { id = "t_default", text = "Shipped by wagon from Goldshire. The bridge was out, so we loaded them on a boat, and the orcs put a catapult stone through it. Toolbox went to the bottom, my good hammer with it." },
        { id = "t_done", when = { questDone = TODO_QUEST("The Lost Tools") },
          text = "Back on my bench now, thanks to you. I still look across the lake before I put anything in a boat." },
      },
      choices = {
        { text = "Where exactly did it sink?", next = "tools_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tools_where = {
      lines = { { id = "tw_default", text = "The deepest water east of the bridge. Murlocs on the way down, and something big out there the fishermen call the Lake Thresher. Ask Baren. Then swim fast." } },
      choices = {
        { text = "I'll fetch your toolbox.", next = "BUSINESS", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "everstill_bridge" } } },
      },
    },

    supplies = {
      lines = {
        { id = "su_default", text = "We smelted our own iron into swords and shot during the last attack. I sent to Stormwind for more. Redridge gnolls took the whole caravan into the hills behind town.",
          fx = { learn = { "redridge_gnolls" } } },
      },
      choices = {
        { text = "What do you need back?", next = "supplies_need" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_need = {
      lines = { { id = "sn_default", text = "Iron pikes and iron rivets. A bridge is mostly the bits nobody looks at. Take them off the gnolls and I'll have a span up before the rains." } },
      choices = {
        { text = "Consider it done.", next = "BUSINESS", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "Gnolls with good iron. Verner must be furious.", next = "supplies_verner" },
      },
    },
    supplies_verner = {
      lines = { { id = "sv_default", text = "He's begging for iron to shoe horses, and a gnoll's using a pike as a back-scratcher. Don't mention it near his forge. He's got hammers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    paxton = {
      lines = { { id = "px_default", text = "Paxton's my usual buyer, and a decent man. But I've walls to raise. If Northshire wants Rethban ore this month, Northshire can dig it." } },
      choices = {
        { text = "Where would I dig?", next = "rethban" },
        { text = "Fair. Something else.", next = "BACK" },
      },
    },
    rethban = {
      lines = { { id = "rb_default", text = "Rethban Caverns, north of town. Bart Rethban found the seam: soft for iron, but it smelts dark and flat, and scribes love it. Redridge gnolls dig there now." } },
      choices = {
        { text = "Then I'll take it off them.", next = "BUSINESS", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    novice = {
      lines = { { id = "nv_default", text = "Northshire? Then you've copied your prayers in my ore and never knew it. Paxton's ink. Tell him the price went up. It hasn't. Tell him anyway." } },
      choices = {
        { text = "Ha. I'll tell him.", next = "BACK", fx = { affinity = 2 } },
        { text = "Ore makes ink?", next = "rethban" },
      },
    },
    plans = {
      lines = { { id = "pl_default", text = "A tradesman! Look here: new piers on the old footings, iron where the stone gave out. What would you change?" } },
      choices = {
        { text = "Nothing. It's sound.", next = "BACK", fx = { affinity = 1 } },
        { text = "Deeper piers. The lake will find any weakness.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Build it faster.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Every job on time and under budget. That's my whole story, and I mean to keep it true.", next = "why" },
                   { id = "tp_bg2", text = "Foreman. Bridges, mostly. This one, lately, again." } },
    advice = { { id = "tp_ad", text = "Measure twice. Then look up for catapults." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "Thieves. They took my iron, and now they're digging Rethban's seam. Next they'll want my job." } },
    everstill_bridge = { { id = "tp_bridge", text = "Before the rains. That's not a hope, that's a schedule." } },
    blackrock = { { id = "tp_blackrock", text = "They knock down what I build. I build it again. One of us is going to get tired, and it isn't me." } },
    _none = { { id = "tp_none", text = "Is it load-bearing? Then I don't care." } },
  },
}
