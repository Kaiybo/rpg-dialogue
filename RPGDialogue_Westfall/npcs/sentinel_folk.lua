-- Sentinel Hill's working people: the inn, the stores, the gryphons, the tower and the bows.
-- Voice: bibles/sentinel_folk.md
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "heather", id = TODO_NPC("Innkeeper Heather"), name = "Innkeeper Heather",
  bible = "bibles/sentinel_folk.md", role = "innkeeper", tier = "service",
  communities = { "sentinel_hill" }, temper = { "steady" }, values = { "kind", "practical" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "In off the road with you. Dust on the mat, please, not on my floor. It's the one clean thing in Westfall." },
    { id = "g_home", when = { homeInn = { "Sentinel Hill" } }, text = "Your bed's made. I shook the grit out of the blankets. It'll be back by morning. It always is." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for the road. Sit down before the militia mistakes you for a bandit. It happens more than they'd admit." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "You've been out to Moonbrook, or somewhere like it. Sit. Stew first, questions after." },
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "That'll do for tonight. The militia's got a cell for brawlers, and it's mostly full of hay." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Heather. I keep the inn on the hill. Most of my guests are militia between watches, and most of them sleep in their boots." },
        { id = "h_salma", when = { heardLine = "salma.h_default" },
          text = "You've eaten at Salma's? Then you've had the best stew in Westfall and you'll be disappointed in mine. I've made my peace with it." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves, out here? We've only dust and gulls to offer. The gulls are rude. The dust gets everywhere." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "How's the hill holding up?", next = "hill" },
        { text = "Just resting.", next = "END" },
      },
    },
    hill = {
      lines = { { id = "hi_default", text = "Better than the farms. We've walls of a sort and Gryan's word. Out there they've only got locks, and the Defias have keys." } },
      choices = { { text = "...", next = "END", fx = { learn = { "people_militia" } } } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Some of them drank here, before. Masons, a few. Nice enough. I try not to think about that." } },
    people_militia = { { id = "tp_militia", text = "Farmers with spears and no pay. They eat for free here. Gryan pays when he can. He usually can't." } },
    _none = { { id = "tp_none", text = "Ask Gryan. Or ask the gulls, they'll tell you just as much." } },
  },
}

P:NPC {
  key = "lewis", id = TODO_NPC("Quartermaster Lewis"), name = "Quartermaster Lewis",
  bible = "bibles/sentinel_folk.md", role = "vendor", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "harried" }, values = { "dutiful", "practical" },
  notices = { "kit" },

  greetings = {
    { id = "g_stores", text = "Stores are open. Stores are always open. Stores are also always half empty. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "More business? Good. Buy something, it'll make my ledger feel useful." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "I can mend that. Don't tell me how it happened. I'll only have to write it down." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Lewis, quartermaster. I keep Sentinel Hill fed, armed and patched, which is a lot to ask of one ledger and a wagon that keeps getting robbed." },
        { id = "h_message", tags = { "news" }, when = { questActive = TODO_QUEST("A Swift Message") },
          text = "This needs to reach the city faster than a wagon can, and without a Defias reading it first. Take it to Thor. He'll have you in the air." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to Lewis") },
          text = "Stormwind and back by gryphon, and the message delivered. Splendid. Now you know the way. Use it often; the roads are worse." },
      },
      choices = {
        { text = "Why so short on supplies?", next = "short" },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Later.", next = "END" },
      },
    },
    short = {
      big = true,
      lines = {
        { id = "s_default", text = "Every wagon from the city comes past three farms the Defias hold. If one in two arrives, it's a good week. I've stopped counting the bad weeks. I keep the ledger for those." },
      },
      choices = {
        { text = "I'll clear the road.", next = "END", fx = { affinity = 2, standing = { sentinel_hill = 1 } } },
        { text = "Can't the city send guards?", next = "guards" },
      },
    },
    guards = {
      lines = { { id = "g2_default", text = "The city sends forms. I fill them in. That's the arrangement." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "They eat better than we do, I'm told. Off our wagons. I'd like that told to someone who can do something." } },
    _none = { { id = "tp_none", text = "Not in my ledger. If it's not in my ledger it doesn't exist, or it's been stolen." } },
  },
}

P:NPC {
  key = "thor", id = TODO_NPC("Thor"), name = "Thor",
  bible = "bibles/sentinel_folk.md", role = "flightmaster", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "brisk" }, values = { "proud" },
  notices = { "travel", "animal" },

  greetings = {
    { id = "g_fly", text = "Need a ride? The birds are fed and cross. Best time to fly; they get you there quicker to be rid of you." },
    { id = "g_back", when = { metBefore = true }, text = "Landed well, did you? Good. The birds talk about the bad ones." },
  },

  notice = {
    { id = "n_hunter", cat = "animal", when = { pet = true },
      text = "Keep that beast back from my gryphons. They don't share, and they've had a hard week." },
    { id = "n_druid", cat = "animal", when = { class = "DRUID" },
      text = "A druid. Don't go turning into anything with feathers near my birds. They get jealous, and then they get bitey." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thor. I keep the gryphons. Fastest way out of Westfall, and the only one the Defias can't rob, so far." },
        { id = "h_message", tags = { "news" }, when = { questActive = TODO_QUEST("A Swift Message") },
          text = "From Lewis? Urgent? They're all urgent. Up you go, then. Hold on with your knees, not your hands; the bird hates being strangled." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You lot glide, I hear. Off cliffs and the like. Gryphons don't glide, they haul. Strap in. It's not the same." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "What are the gryphons like?", next = "birds" },
        { text = "Not today.", next = "END" },
      },
    },
    birds = {
      lines = { { id = "b_default", text = "Proud, hungry and loyal, in that order. Treat them like soldiers and they'll treat you like cargo. That's a compliment, from a gryphon." } },
      choices = { { text = "I'll be good cargo.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    westfall = { { id = "tp_westfall", text = "From up there it's all gold and grey. Pretty, if you don't know what's in the grey." } },
    _none = { { id = "tp_none", text = "I fly birds. Ask someone who walks." } },
  },
}

P:NPC {
  key = "riell", id = TODO_NPC("Scout Riell"), name = "Scout Riell",
  bible = "bibles/sentinel_folk.md", role = "militia", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "watchful" }, values = { "dutiful", "loyal" },
  notices = { "stealth", "kit" },

  greetings = {
    { id = "g_tower", text = "Up here you can see every road into the hill. Which means I see you coming long before you say hello." },
    { id = "g_back", when = { metBefore = true }, text = "Saw you on the north track an hour ago. You walk like you're looking for a fight. Good." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { stealthed = true },
      text = "Nice try. You can hide from the road. Not from the tower." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Riell, scout for the People's Militia. I watch from the tower and tell Gryan what's coming. Lately it's always the same answer: more." },
        { id = "h_silk", tags = { "news" }, when = { questActive = TODO_QUEST("Red Silk Bandanas") },
          text = "Red silk off Defias necks. Bring me the bandanas. Every one on my table is one less on the road." },
        { id = "h_silk_done", when = { questDone = TODO_QUEST("Red Silk Bandanas") },
          text = "Fewer red silks on the roads this week. The ones that are left look nervous. I like them nervous." },
        { id = "h_gryan", when = { heardLine = "gryan.w_default" },
          text = "Gryan told you how it was. He tells it like he was there because he was. We all were. That's why we stayed." },
      },
      choices = {
        { text = "What can you see from the tower?", next = "see" },
        { text = "Carry on, scout.", next = "END" },
      },
    },
    see = {
      lines = { { id = "s_default", text = "Smoke from Moonbrook. Riders on the coast road at odd hours. Lights at the old farms that shouldn't have lights. I write it all down. Gryan reads it all." } },
      choices = { { text = "I'll look into it.", next = "END", fx = { affinity = 1, learn = { "moonbrook" } } } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Organised. That's what scares me. Bandits don't post watches. These do." } },
    people_militia = { { id = "tp_militia", text = "We're what's left when the lords leave. Not much. More than nothing." } },
    _none = { { id = "tp_none", text = "Not from up here. Ask someone on the ground." } },
  },
}

P:NPC {
  key = "macgregor", id = TODO_NPC("William MacGregor"), name = "William MacGregor",
  bible = "bibles/sentinel_folk.md", role = "vendor", tier = "service",
  communities = { "sentinel_hill" }, temper = { "dry" }, values = { "craft" },
  notices = { "class" },

  greetings = {
    { id = "g_bows", text = "Bows, arrows, a quiver if you've the coin. Strings are extra. Strings are always extra." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Show me your bow. Hm. It'll do. It'll do better with a new string. They're extra." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior buying arrows. For pulling things to you, I suppose. Fair. The things out here usually come anyway." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "MacGregor. I make bows for the militia, and sell what's left to whoever walks up. Westfall wood's poor, so I make it up with patience." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Poor wood?", next = "wood" },
        { text = "Just looking.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Dry country, crooked trees. Elwynn wood's better, but the wagons don't get through often enough. So I bend what we've got, slowly." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I sell bows. Ask me about bows." } },
  },
}
