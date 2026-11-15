-- Barkeep Daniels, Lakeshire Inn. Voice: bibles/daniels.md
-- The orcs have cut off his shipments, and a dry bar is a sad bar.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "daniels", id = TODO_NPC("Barkeep Daniels"), name = "Barkeep Daniels",
  bible = "bibles/daniels.md", role = "innkeeper", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "generous", "witty" },
  notices = { "drink", "travel" },

  greetings = {
    { id = "g_bar", text = "What'll it be? Don't say ale. I'm nearly out of ale." },
    { id = "g_dry", when = { questActive = TODO_QUEST("Dry Times") }, text = "Any luck? Tell me there's a keg in that pack." },
    { id = "g_after", when = { questDone = TODO_QUEST("Dry Times") }, text = "My saviour! The good bottles are back on the shelf, thanks to you." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You've had plenty somewhere else. Shame. I could've used the custom." },
    { id = "n_travel", cat = "travel", when = { visited = "Darkshire" },
      text = "You've been to Darkshire! Did you try the moonshine? Course you did. You've got the look." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Daniels. I keep the bar. Or I did, when there was something to keep. The orcs hit the road and my shipment never came." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Dry Times") },
          text = "Thunderbrew lager from the hills in Westfall, merlot from Stormwind, moonshine from Darkshire, sweet rum from Goldshire. A proper bar needs all four. I've got none." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dry Times") },
          text = "Each one, mind. Don't drink them on the way. I'll know. I always know." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dry Times"), days = 3 } },
          text = "Listen to that room. That's the sound of Lakeshire forgetting about orcs for an evening. You did that." },
        { id = "h_wiley", when = { metBefore = true },
          text = "Wiley's in the corner, if you're looking for him. Nobody's ever looking for Wiley. Except the ones who are." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Sky folk drink? Course they do. Whatever they pour up there, down here it's whatever I've got left." },
        { id = "h_barrel", when = { metBefore = true }, text = "A whole barrel came in yesterday. Full. I almost cried. The regulars did cry. Lakeshire's had a hard year." },
      },
      again = {
        { id = "h_again", text = "Anything else? Stool's yours as long as you want it." },
        { id = "h_again2", text = "Go on. A barkeep's half ears anyway." },
      },
      choices = {
        { text = "Pour me whatever you've got.", next = "BUSINESS" },
        { text = "Heard anything?", next = "news" },
        { text = "Why is the bar so dry?", next = "dry" },
        { text = "Who's that in the corner?", next = "wiley" },
        { text = "Who keeps this place running?", next = "inn" },
        { text = "A dwarf brewed your lager, I hope.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I've been to Darkshire. The moonshine's real.", next = "moonshine", when = { visited = "Darkshire" } },
        { text = "Just passing through.", next = "END" },
      },
    },

    news = {
      lines = {
        { id = "n_default", text = "Guards drink, guards talk. The orcs are getting bolder, the bridge is getting nowhere, and the magistrate's writing another letter." },
      },
      choices = {
        { text = "What do the guards say about the orcs?", next = "guards" },
        { text = "Sounds about right.", next = "BACK", fx = { learn = { "blackrock" } } },
      },
    },
    guards = {
      lines = { { id = "gu_default", text = "That there's more of them every week, and they march like soldiers. Guards don't like saying that sober. They say it here." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },
    dry = {
      lines = { { id = "dr_default", text = "The last shipment's long overdue. The orcs own half the roads and the gnolls own the rest. A bar runs on four roads, and I've lost all four." } },
      choices = {
        { text = "Four roads?", next = "four" },
        { text = "Something else.", next = "BACK" },
      },
    },
    four = {
      lines = { { id = "fo_default", text = "One from each: the Westfall hills, Stormwind, Darkshire, Goldshire. A proper bar's a map of the kingdom, and mine's gone blank." } },
      choices = {
        { text = "I'll fill in your map.", next = "BUSINESS", fx = { affinity = 2, standing = { lakeshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wiley = {
      lines = { { id = "wi_default", text = "Wiley. Pays on time, tips nothing, sees everything. Now and then somebody comes up from Westfall asking for him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    inn = {
      lines = { { id = "in_default", text = "Brianna has the rooms, I have the bar, and my wife has the needle. Half the cloaks in Lakeshire are her stitching." } },
      choices = {
        { text = "Your wife sews?", next = "wife" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wife = {
      lines = { { id = "wf_default", text = "Finest seamstress in Redridge. She thanks people with cloaks; I thank them with drinks. Hers last longer." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Grimbooze Thunderbrew, up in the Westfall hills. Best lager this side of Ironforge, he says, and I've never had the nerve to argue." } },
      choices = { { text = "He's right.", next = "BACK", fx = { affinity = 2 } } },
    },
    moonshine = {
      lines = { { id = "mo_default", text = "Then you know what I'm missing. Darkshire's moonshine could strip paint, and some nights that's what Lakeshire needs." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I pour. Before the orcs, I poured more." } },
    advice = { { id = "tp_ad", text = "Never drink the last bottle in the house. It's bad luck, and it's mine." } },
    blackrock = { { id = "tp_blackrock", text = "They stopped my wagons. That's personal." } },
    everstill_bridge = { { id = "tp_bridge", text = "The bridge crew drink here. They drink like men who've rebuilt the same thing three times." } },
    _none = { { id = "tp_none", text = "A barkeep hears everything and remembers nothing. House rule." } },
  },
}

-- Innkeeper Brianna, Lakeshire Inn. Voice: bibles/daniels.md (Brianna section)
-- Makes the inn a home for tired travelers; has a pet, Narnie.
P:NPC {
  key = "brianna", id = TODO_NPC("Innkeeper Brianna"), name = "Innkeeper Brianna",
  bible = "bibles/daniels.md", role = "innkeeper", tier = "service",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "guest", "pet" },

  greetings = {
    { id = "g_home", text = "Out of the wind, now. Make yourself at home; that's what an inn's for." },
    { id = "g_bound", when = { homeInn = { "Lakeshire", "Lakeshire Inn" } }, text = "Back home! Narnie's kept your chair warm. Shoo her off, she won't mind. She'll mind." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Oh, mind Narnie, she's not fond of other animals. {pet} looks friendly. Narnie won't care. She never does." },
    { id = "n_guest", cat = "guest", when = { durability = { max = 0.25 } },
      text = "Been up Render's Valley? You look it. Sit down before you fall down, and let me find you some soup." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Brianna. I keep the rooms and Daniels keeps the bar, when he has anything to keep. Between us we keep Lakeshire from losing its mind." },
        { id = "h_dry", when = { questDone = TODO_QUEST("Dry Times") },
          text = "You found Daniels his drink! He's been whistling. It's terrible. I've never been happier to hear it." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you? The kettle's on and Narnie's asleep." },
        { id = "h_again2", text = "Go on. Narnie's listening too, though she'll pretend she isn't." },
      },
      choices = {
        { text = "A room, please.", next = "BUSINESS" },
        { text = "Who's Narnie?", next = "narnie" },
        { text = "How's the town holding up?", next = "town" },
        { text = "Are there wounded under your roof?", next = "wounded", when = { class = "PRIEST" } },
        { text = "Just passing through.", next = "END" },
      },
    },
    narnie = {
      lines = { { id = "n_default", text = "My pet, and the real owner of this inn. I just pay the bills." } },
      choices = {
        { text = "Ha.", next = "BACK", fx = { affinity = 1 } },
        { text = "Does she like guests?", next = "narnie_guests" },
      },
    },
    narnie_guests = {
      lines = { { id = "ng_default", text = "She likes the warm side of the hearth, and guests sit there. So, no. She tolerates the ones who leave early." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    town = {
      lines = { { id = "t_default", text = "Better on a full stomach. Worse when the drums start in the hills. Mostly we keep the fire lit and the door open, and hope that's enough." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },
    wounded = {
      lines = { { id = "w_default", text = "Two upstairs from the last raid, and a guard who won't admit his arm's broken. I've done what soup can do. They'd be glad of you." } },
      choices = {
        { text = "Show me to them.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { lakeshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the rooms. Narnie keeps me. That's the arrangement." } },
    advice = { { id = "tp_ad", text = "Make an inn your home before you need one. You'll come back to it more than you think." } },
    blackrock = { { id = "tp_blackrock", text = "We hear the drums some nights. Everyone goes very quiet and orders another round." } },
    _none = { { id = "tp_none", text = "No idea, dear. I keep rooms, not secrets." } },
  },
}
