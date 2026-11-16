-- Barkeep Daniels, Lakeshire Inn. Voice: bibles/daniels.md
-- The orcs have cut off his shipments, and a dry bar is a sad bar.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "daniels", id = TODO_NPC("Barkeep Daniels"), name = "Barkeep Daniels",
  bible = "bibles/daniels.md", role = "innkeeper", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "generous", "witty" },
  notices = { "drink", "travel" },

  impression = {
    first = "Barkeep Daniels has a bar and very little to put behind it since the orcs cut the road. He's cheerful about it in the way of a man trying hard not to be miserable.",
    third = "{name} met Barkeep Daniels of Lakeshire, whose shipment of drink never came after the orcs struck the road.",
  },

  greetings = {
    { id = "g_bar", text = "What'll it be? Don't say ale, because I'm nearly out of ale." },
    { id = "g_dry", when = { questActive = TODO_QUEST("Dry Times") }, text = "Any luck? Tell me there's a keg in that pack." },
    { id = "g_after", when = { questDone = TODO_QUEST("Dry Times") }, text = "My saviour! The good bottles are back on the shelf, thanks to you." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You've had plenty somewhere else, which is a shame; I could've used the custom." },
    { id = "n_travel", cat = "travel", when = { visited = "Darkshire" },
      text = "You've been to Darkshire! Did you try the moonshine? Course you did, you've got the look." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      lines = { { id = "xro_default", text = "Smugglers might, and I'd not ask too many questions if one turned up with a cask of Stormwind ale, I'll tell you that for free. But Bailiff Conacher drinks here, so keep your voice down when you say that word." } },
      choices = {
        { text = "I'll keep it quiet. A barkeep needs his ale.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Conacher's right to watch. Laws matter here.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What's the news in Lakeshire?", next = "news" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Your lot in Stormwind drink at the Blue Recluse, I've heard, and argue about spells all night. Here they drink what I've got, which is mostly water and complaints, until the road's open again." } },
      choices = {
        { text = "Water's fine. A clear head keeps the spells sharp.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then I'll drink and complain like everyone else.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Why is the bar so dry?", next = "dry" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I didn't think you were, but thanks for saying it out loud, because the regulars were starting to stare. Order something and smile, and they'll forget the glow round your hands quick enough." } },
      choices = {
        { text = "I'll smile. These folk have seen enough.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them stare. Fear keeps people careful.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How many guards does Lakeshire have?", next = "guards" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Daniels. I keep the bar, or I did when there was something to keep, but the orcs hit the road and my shipment never came." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Dry Times") },
          text = "Thunderbrew lager from the hills in Westfall, merlot from Stormwind, moonshine from Darkshire, sweet rum from Goldshire. A proper bar needs all four, and I've got none." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dry Times") },
          text = "Bring each one, mind, and don't drink them on the way. I'll know; I always know." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dry Times"), days = 3 } },
          text = "Listen to that room. That's the sound of Lakeshire forgetting about orcs for an evening, and you did that." },
        { id = "h_wiley", when = { metBefore = true },
          text = "Wiley's in the corner, if you're looking for him. Nobody's ever looking for Wiley. Except the ones who are." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Do sky folk drink? I'd wager they do, and whatever they pour up there, down here you'll get whatever I've got left." },
        { id = "h_barrel", when = { metBefore = true }, text = "A whole barrel came in yesterday, full, and I almost cried. The regulars did cry; Lakeshire's had a hard year." },
      },
      again = {
        { id = "h_again", text = "Anything else? The stool's yours as long as you want it." },
        { id = "h_again2", text = "Go on, I'm listening; a barkeep's half ears anyway." },
      },
      choices = {
        { text = "Pour me whatever you've got.", next = "BUSINESS" },
        { text = "Heard anything?", next = "news" },
        { text = "Why is the bar so dry?", next = "dry" },
        { text = "Who's that in the corner?", next = "wiley" },
        { text = "Who keeps this place running?", next = "inn" },
        { text = "A dwarf brewed your lager, I hope.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I've been to Darkshire. The moonshine's real.", next = "moonshine", when = { visited = "Darkshire" } },
        { text = "Do you get many kaldorei through Lakeshire?", next = "nightelf", when = { race = "NightElf" } },
        { text = "The road's cut, but smugglers must still get through.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "This bar could use some of the Blue Recluse's cheer.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The Blackrock have warlocks, Daniels. I'm not one of theirs.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Just passing through.", next = "END" },
      },
    },

    news = {
      lines = {
        { id = "n_default", text = "Guards drink, and guards talk. The orcs are getting bolder, the bridge is getting nowhere, and the magistrate's writing another letter." },
      },
      choices = {
        { text = "What do the guards say about the orcs?", next = "guards" },
        { text = "Sounds about right.", next = "BACK", fx = { learn = { "blackrock" } } },
      },
    },
    guards = {
      lines = { { id = "gu_default", text = "That there's more of them every week, and they march like soldiers. Guards don't like saying that sober, so they say it here." } },
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
      lines = { { id = "wi_default", text = "That's Wiley. He pays on time, tips nothing and sees everything, and now and then somebody comes up from Westfall asking for him." } },
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
      lines = { { id = "wf_default", text = "She's the finest seamstress in Redridge. She thanks people with cloaks and I thank them with drinks, and hers last longer." } },
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
    nightelf = {
      lines = { { id = "ne_default", text = "You're the first I've poured for, and I've been wondering all evening what your lot drinks. If it's moonlight and dew, I'm afraid I'm out of both, along with everything else." } },
      choices = {
        { text = "Water from a clean spring will do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Whatever the dwarves drink.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A barkeep hears everything said over a mug, and Lakeshire says plenty. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I pour, and before the orcs, I poured more." } },
    advice = { { id = "tp_ad", text = "Never drink the last bottle in the house. It's bad luck, and it's mine." } },
    blackrock = { { id = "tp_blackrock", text = "They stopped my wagons, and that's personal." } },
    everstill_bridge = { { id = "tp_bridge", text = "The bridge crew drink here. They drink like men who've rebuilt the same thing three times." } },
    _none = { { id = "tp_none", text = "A barkeep hears everything and remembers nothing; that's the house rule." } },
  },
}

-- Innkeeper Brianna, Lakeshire Inn. Voice: bibles/daniels.md (Brianna section)
-- Makes the inn a home for tired travelers; has a pet, Narnie.
P:NPC {
  key = "brianna", id = TODO_NPC("Innkeeper Brianna"), name = "Innkeeper Brianna",
  bible = "bibles/daniels.md", role = "innkeeper", tier = "service",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "guest", "pet" },

  impression = {
    first = "Innkeeper Brianna keeps Lakeshire's rooms and, between her and Daniels, its nerves. She made me feel at home before I'd decided whether I wanted to be.",
    third = "{name} found a room with Innkeeper Brianna, who keeps the beds in Lakeshire and does her best to keep the town calm.",
  },

  greetings = {
    { id = "g_home", text = "Out of the wind, now. Make yourself at home; that's what an inn's for." },
    { id = "g_bound", when = { homeInn = { "Lakeshire", "Lakeshire Inn" } }, text = "Back home! Narnie's kept your chair warm, so shoo her off; she won't mind. Well, she'll mind." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Oh, mind Narnie; she's not fond of other animals. {pet} looks friendly enough, but Narnie won't care, she never does." },
    { id = "n_guest", cat = "guest", when = { durability = { max = 0.25 } },
      text = "Been up Render's Valley? You look it, so sit down before you fall down, and let me find you some soup." },
  },

  start = "hello",
  nodes = {
    xmage = {
      lines = { { id = "xma_default", text = "That's a lovely offer, and the wounded upstairs would thank you for the warmth. Only mind the rafters, because Daniels swears the whole roof is held up by old varnish and good intentions." } },
      choices = {
        { text = "Carefully, then. One hearth at a time.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A roaring fire cheers everyone. Let's go big.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How are the wounded?", next = "wounded" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Quiet I can give you, but if your work makes smoke or screaming, I'll ask you to take it out past the stables. There are soldiers upstairs who've seen enough of the Blackrock's shadow magic for one lifetime." } },
      choices = {
        { text = "I'll work outside. They need their rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They'll survive a little shadow.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How is the town holding up?", next = "town" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Brianna. I keep the rooms and Daniels keeps the bar, when he has anything to keep, and between us we keep Lakeshire from losing its mind." },
        { id = "h_dry", when = { questDone = TODO_QUEST("Dry Times") },
          text = "You found Daniels his drink! He's been whistling ever since, and it's terrible, and I've never been happier to hear it." },
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
        { text = "I could light every hearth in the inn tonight.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'll need somewhere quiet to work, Brianna.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
      lines = { { id = "ng_default", text = "She likes the warm side of the hearth, and guests sit there, so no. She tolerates the ones who leave early." } },
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
        { text = "They'll mend on their own, and I've other work.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the rooms and Narnie keeps me; that's the arrangement." } },
    advice = { { id = "tp_ad", text = "Make an inn your home before you need one. You'll come back to it more than you think." } },
    blackrock = { { id = "tp_blackrock", text = "We hear the drums some nights. Everyone goes very quiet and orders another round." } },
    _none = { { id = "tp_none", text = "No idea, dear; I keep rooms, not secrets." } },
  },
}
