-- Dolanaar: Teldrassil's crossroads village between Shadowglen and Darnassus. Voice: bibles/teldrassil.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "corithras", id = TODO_NPC("Corithras Moonrage"), name = "Corithras Moonrage",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "grave" }, values = { "devout", "dutiful" },
  notices = { "class" },

  greetings = {
    { id = "g_well", text = "The moonwells of Teldrassil each have a voice. Listen, and you'll hear that they don't all sing the same note." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "DRUID" } },
      text = "You serve Elune, or the wild. Either way, you'll feel what I feel in the wells. Tell me if I'm wrong." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Corithras Moonrage. I watch the moonwells of Teldrassil. Something is wrong with them, and I mean to learn what." },
        { id = "h_crown", tags = { "news" }, when = { questActive = TODO_QUEST("Crown of the Earth") },
          text = "Tenaron sent the vial. Good. Fill it at each well I name, and bring it back. The waters will tell us what the tree won't." },
      },
      choices = {
        { text = "What's wrong with the wells?", next = "wells" },
        { text = "I'll carry the vial.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    wells = {
      big = true,
      lines = {
        { id = "w_default", text = "Small things. A taste that wasn't there. A shimmer that's a shade off. Teldrassil is young, and young things are easily hurt." },
      },
      choices = { { text = "I'll help you find out.", next = "END", fx = { affinity = 2, trait = { curious = 1 }, standing = { dolanaar = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The Circle says the tree will grow strong in time. I hope so. The wells are less certain." } },
    _none = { { id = "tp_none", text = "The wells don't speak of that, and neither can I." } },
  },
}

P:NPC {
  key = "athridas", id = TODO_NPC("Athridas Bearmantle"), name = "Athridas Bearmantle",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "stern" }, values = { "protective", "dutiful" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_druid", text = "Speak plainly. The forest has troubles, and I've no patience for riddles today." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Good. I need one who can tell a sick animal from an angry one. There's a difference, and it matters." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "You wear the bear well. Ursal won't care. Be careful." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Athridas Bearmantle. I'm a druid of Dolanaar, and the Gnarlpine furbolgs are my concern. They were never our enemies. Now they are." },
        { id = "h_corruption", tags = { "news" }, when = { questActive = TODO_QUEST("Gnarlpine Corruption") },
          text = "Something has twisted the Gnarlpine from the inside. Find out what. I'd rather cure them than fight them." },
        { id = "h_relics", when = { questActive = TODO_QUEST("The Relics of Wakening") },
          text = "The relics of wakening were taken from Ban'ethil. Recover them. They belong to the Circle, not to thieves." },
        { id = "h_ursal", when = { questActive = TODO_QUEST("Ursal the Mauler") },
          text = "Ursal. A furbolg who's gone past saving. End him. It's the kindest thing left." },
        { id = "h_breeze", when = { questActive = TODO_QUEST("A Troubling Breeze") },
          text = "There's a foulness on the wind from the barrow den. Go and see what stirs there, and tell me." },
      },
      choices = {
        { text = "Can the furbolgs be saved?", next = "saved" },
        { text = "I'll look into it.", next = "END", fx = { affinity = 1 } },
      },
    },
    saved = {
      lines = { { id = "s_default", text = "Some. Not all. That's the hardest lesson a druid learns: you can't heal everything that's sick. Sometimes you can only stop it spreading." } },
      choices = { { text = "That's hard.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "I serve the Circle as best I can from Dolanaar. They have bigger worries than furbolgs. Somebody has to have this one." } },
    _none = { { id = "tp_none", text = "Not my concern. The Gnarlpine are." } },
  },
}

P:NPC {
  key = "tallonkai", id = TODO_NPC("Tallonkai Swiftroot"), name = "Tallonkai Swiftroot",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "approving" }, values = { "protective", "kind" },
  notices = { "greenness" },

  greetings = {
    { id = "g_groves", text = "Good to see the young taking a hand in guarding the groves. Come, I've work for willing hands." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh from Shadowglen. The road to Darnassus runs through here; most of what you'll need, you'll learn on the way." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tallonkai Swiftroot. The Gnarlpine have grown bold, and they've taken something of mine. I'd like it back, and I'd like them to stop." },
        { id = "h_dreamcatcher", tags = { "news" }, when = { questActive = TODO_QUEST("The Emerald Dreamcatcher") },
          text = "My dreamcatcher was stolen. It matters more than it looks. Find it, please." },
        { id = "h_ferocitas", when = { questActive = TODO_QUEST("Ferocitas the Dream Eater") },
          text = "Ferocitas. The furbolgs call him the Dream Eater. End him, and bring back what he took." },
        { id = "h_twisted", when = { questActive = TODO_QUEST("Twisted Hatred") },
          text = "The hatred that twisted the Gnarlpine didn't come from nowhere. Follow it to its root." },
      },
      choices = { { text = "I'll protect the village.", next = "END", fx = { affinity = 2, standing = { dolanaar = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Athridas; he knows the furbolgs. I know only what they've done." } },
  },
}

P:NPC {
  key = "syral", id = TODO_NPC("Syral Bladeleaf"), name = "Syral Bladeleaf",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "composed" }, values = { "dutiful", "loyal" },
  notices = { "craft" },

  greetings = {
    { id = "g_council", text = "Dolanaar welcomes those who welcome the land. Do you?" },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Alchemy" } },
      text = "You know your herbs. Teldrassil's soil is new; the plants here are still deciding what they'll be. Watch them closely." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Syral Bladeleaf. I carry the Council of the Forest's orders to those who'll follow them. There are always more orders than hands." },
        { id = "h_redemption", tags = { "news" }, when = { questActive = TODO_QUEST("Seek Redemption!") },
          text = "Redemption is earned, not bought. Do what's asked, and do it honestly." },
        { id = "h_denalan", when = { questActive = TODO_QUEST("Denalan's Earth") },
          text = "Denalan studies the timberlings at Lake Al'Ameth. Take him this soil. He'll know what it means; I only know it matters." },
      },
      choices = { { text = "I'll take on the Council's orders.", next = "END", fx = { affinity = 1, align = { order = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "The Council hasn't spoken on that, so neither will I." } },
  },
}

P:NPC {
  key = "keldamyr", id = TODO_NPC("Innkeeper Keldamyr"), name = "Innkeeper Keldamyr",
  bible = "bibles/teldrassil.md", role = "innkeeper", tier = "service",
  communities = { "dolanaar" }, temper = { "gentle" }, values = { "generous" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Rest a while. The inn is yours as long as you need it." },
    { id = "g_home", when = { homeInn = { "Dolanaar" } }, text = "Welcome home. The fire's low and warm, the way you like it." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've had a hard road back from somewhere grey. Sit. Elune's light reaches the inn too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Keldamyr. Travelers between Shadowglen and Darnassus all stop here, sooner or later. I like to think they leave lighter." },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Dolanaar Delivery") },
          text = "A delivery for the inn? Wonderful. Set it down there; I'll see it put to use tonight." },
      },
      choices = { { text = "Just rest, thank you.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I hear only the gentle gossip. Ask a Sentinel for the other kind." } },
  },
}

-- Forever's camping: the adventurer by the road near Dolanaar.
P:NPC {
  key = "lyreena", id = TODO_NPC("Lyreena Duskblade"), name = "Lyreena Duskblade",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "easy" }, values = { "curious", "generous" },
  notices = { "craft" },

  greetings = {
    { id = "g_fire", text = "Come, sit. The fire's small, but it's honest, and there's room." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook. Then you already hold the first secret of a good camp: the fire. Everything else gathers around it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lyreena Duskblade. I'd rather sleep under the canopy than under a roof. If you want to learn how, I'll teach you." },
        { id = "h_outdoors", tags = { "news" }, when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire and stay there until you feel rested through. It comes slowly, then all at once." },
      },
      choices = { { text = "Teach me.", next = "END", fx = { affinity = 2, learn = { "camping" } } } },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "A fire, first. Then each trade brings its piece: a tent, a rack for fish, a pot. Anyone who passes may share it." } },
    _none = { { id = "tp_none", text = "I'm only passing through. Ask in the village." } },
  },
}
