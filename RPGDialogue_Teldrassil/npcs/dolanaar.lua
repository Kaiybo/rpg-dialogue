-- Dolanaar: Teldrassil's crossroads village between Shadowglen and Darnassus. Voice: bibles/teldrassil.md
-- Classic quests only. Nobody blames the Arch Druid for the tree's troubles; they only notice them.
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
          text = "Tenaron sent the vessel. Good. Fill a phial at each well I name, and bring it back. The waters will tell us what the tree won't." },
        { id = "h_third", when = { metBefore = true }, text = "I tasted the third well again at dawn. Still wrong. I've stopped telling the Sentinels. They think I fuss." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The wells shine brightest now. It's easier to see what's wrong in them with Elune watching too." },
        { id = "h_delivered", when = { questDone = TODO_QUEST("Crown of the Earth") },
          text = "The vessel reached the Archdruid, I hear. He said we took our time over it. We did. The wells deserve that much." },
      },
      again = {
        { id = "h_again", text = "What else? Speak softly near the well." },
        { id = "h_again2", text = "Ask. The water is patient, and so am I." },
      },
      choices = {
        { text = "What's wrong with the wells?", next = "wells" },
        { text = "Tell me the story Tenaron began.", next = "story" },
        { text = "Which wells do you watch?", next = "which" },
        { text = "I can feel something in the water too.", next = "feel", when = { class = { "PRIEST", "DRUID" } } },
        { text = "I'll carry the vial.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    wells = {
      big = true,
      lines = {
        { id = "w_default", text = "Small things. A taste that wasn't there. A shimmer that's a shade off. Teldrassil is young, and young things are easily hurt." },
      },
      choices = {
        { text = "I'll help you find out.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 }, standing = { dolanaar = 1 } } },
        { text = "Is it the tree itself?", next = "wells2" },
      },
    },
    wells2 = {
      lines = { { id = "w2_default", text = "The tree grew without the dragons' blessing. Nozdormu called the asking arrogant, and Alexstrasza agreed. Since then its growth has been... unpredictable." } },
      choices = {
        { text = "Then someone should find out why.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    story = {
      lines = { { id = "s_default", text = "After Hyjal we were lost. Nordrassil smoked, our immortality was gone, Malfurion vanished. The Arch Druid convinced the Circle it was time to rebuild." } },
      choices = {
        { text = "And so, Teldrassil.", next = "story2", fx = { learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    story2 = {
      lines = { { id = "s2_default", text = "With the Circle's approval, Staghelm and the strongest druids grew it. It is magnificent. It is also young, and I watch it the way you'd watch a feverish child." } },
      choices = {
        { text = "I hope the fever breaks.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    which = {
      lines = { { id = "wh_default", text = "The one by Starbreeze Village, the one at the Pools of Arlithrien, and the first and strongest, under the Oracle Tree. Each tells me something different." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feel = {
      lines = { { id = "f_default", text = "Then I'm not imagining it. Thank you. You don't know how much I needed to hear that from someone who isn't me." } },
      choices = { { text = "You're not imagining it.", next = "BACK", fx = { affinity = 2, standing = { dolanaar = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I listen to the moonwells. Someone ought to. They don't shout." } },
    advice = { { id = "tp_ad", text = "Drink from a moonwell if a priestess says it's well. Even then, sip." } },
    teldrassil = { { id = "tp_teldrassil", text = "Young, and not as well as it looks. The wells say so before anyone else does." } },
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
          text = "Ursal and the Fel Moss? By the stars. Then Gaerolas was right to fear for the barrow den, and we may already be late." },
        { id = "h_relics", when = { questActive = TODO_QUEST("The Relics of Wakening") },
          text = "Gnarlpine raiders are in the Ban'ethil Barrow Den. The sleeping druids can't wake without the Relics of Wakening. Bring them to me." },
        { id = "h_ursal", when = { questActive = TODO_QUEST("Ursal the Mauler") },
          text = "Ursal drove the Gnarlpine mad with Fel Moss. The waking ritual can't be finished while he lives. End him." },
        { id = "h_breeze", when = { questActive = TODO_QUEST("A Troubling Breeze") },
          text = "Gaerolas Talvethren hasn't sent word from Starbreeze Village. He wards the sleeping Druids of the Talon. Go east and bring me his report." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly." },
        { id = "h_again2", text = "Speak. The Gnarlpine won't wait on us." },
      },
      choices = {
        { text = "Were the Gnarlpine ever friends?", next = "friends" },
        { text = "Can the furbolgs be saved?", next = "saved" },
        { text = "Who are the sleeping druids?", next = "talon" },
        { text = "I can tell a sick beast from an angry one.", next = "druidtest", when = { class = "DRUID" } },
        { text = "I'll look into it.", next = "END", fx = { affinity = 1 } },
      },
    },
    saved = {
      lines = { { id = "s_default", text = "Some. Not all. That's the hardest lesson a druid learns: you can't heal everything that's sick. Sometimes you can only stop it spreading." } },
      choices = {
        { text = "That's hard.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then we stop it spreading.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    friends = {
      lines = {
        { id = "f_trade", text = "When the tree was young, yes. They kept to their hills in peace, and the Sentinels called them friends. I miss that more than I expected to." },
      },
      choices = {
        { text = "What changed them?", next = "moss" },
        { text = "Maybe they'll be friends again.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    moss = {
      lines = { { id = "m_default", text = "Fel Moss. Ursal, their chieftain, uses its power to drive them mad. Where it spreads, they turn." } },
      choices = {
        { text = "Then Ursal's the root.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    talon = {
      lines = { { id = "t_default", text = "Druids of the Talon, hibernating in the Ban'ethil Barrow Den by a pact with Ysera. Gaerolas guards them. Disturb the ritual wrongly and they could be lost in the Dream." } },
      choices = {
        { text = "Lost in the Dream?", next = "talon2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talon2 = {
      lines = { { id = "t2_default", text = "Their spirits walk the Dream while they sleep. Without the right relics, the waking can't be done, and they'd sleep forever without knowing it." } },
      choices = {
        { text = "Then the relics matter.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druidtest = {
      lines = { { id = "dt_default", text = "Then tell me which the Gnarlpine are. ... Both. That's what makes this so hard. Remember it when you're standing over one." } },
      choices = { { text = "I'll remember.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A druid of Dolanaar. The Gnarlpine are my charge now, whether I wanted it or not." } },
    advice = { { id = "tp_ad", text = "Don't fight a furbolg in its own hills. Draw it out where you can see the trees around you." } },
    fel_moss = { { id = "tp_moss", text = "The Gnarlpine's ruin. Where it grows, they turn." } },
    furbolgs = { { id = "tp_furbolgs", text = "Peaceful, once. Ask me again when Ursal is dead." } },
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
          text = "Tallonkai Swiftroot. The Gnarlpine have grown bold, and they hold something of mine. I'd like it back, and I'd like them to stop." },
        { id = "h_dreamcatcher", tags = { "news" }, when = { questActive = TODO_QUEST("The Emerald Dreamcatcher") },
          text = "My dreamcatcher is still in my dresser in Starbreeze Village, and the furbolgs hold Starbreeze now. Bring it back, please." },
        { id = "h_ferocitas", when = { questActive = TODO_QUEST("Ferocitas the Dream Eater") },
          text = "Ferocitas the Dream Eater has the jewel from my dreamcatcher. He's north of Starbreeze. Bring it back, and I can mend the thing." },
        { id = "h_twisted", when = { questActive = TODO_QUEST("Twisted Hatred") },
          text = "Lord Melenas. A satyr, gathering grells in Fel Rock to the north. Quickly and quietly, please. Bring me his head, and say nothing of it." },
      },
      again = {
        { id = "h_again", text = "Anything else, young one?" },
        { id = "h_again2", text = "Go on. I'm listening." },
      },
      choices = {
        { text = "What was the dreamcatcher to you?", next = "dreamcatcher" },
        { text = "What happened to Starbreeze Village?", next = "starbreeze" },
        { text = "Who is Lord Melenas?", next = "melenas", when = { questActive = TODO_QUEST("Twisted Hatred") } },
        { text = "I'll protect the village.", next = "END", fx = { affinity = 2, standing = { dolanaar = 1 } } },
      },
    },
    dreamcatcher = {
      lines = {
        { id = "d_gift", text = "A gift from Gaerolas Talvethren, who wards the sleeping druids. It draws a little luck out of the Emerald Dream. Few are ever given one." },
      },
      choices = {
        { text = "I understand.", next = "BACK", fx = { affinity = 2 } },
        { text = "Luck from the Dream?", next = "dream2" },
      },
    },
    dream2 = {
      lines = { { id = "d2_default", text = "A little. Enough to tip things your way. I'd hate to tell Gaerolas his gift is sitting in a furbolg's den." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    starbreeze = {
      lines = { { id = "sb_default", text = "The Gnarlpine overran it. It was a quiet place once. My dresser is still there, and so is everything else we left behind." } },
      choices = {
        { text = "Will you go back?", next = "starbreeze2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    starbreeze2 = {
      lines = { { id = "sb2_default", text = "When it's safe. Not before. Teldrassil has enough brave fools in it already; I'd rather be a careful one." } },
      choices = {
        { text = "Wise.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll make it safe.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    melenas = {
      lines = { { id = "me_default", text = "A satyr, and his story shames us. It's too close to home for me to tell it. Let it be enough that trust must be earned." } },
      choices = { { text = "I won't ask again.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My dresser is still in Starbreeze Village, if that tells you anything. These days I stay wherever the Gnarlpine aren't." } },
    advice = { { id = "tp_ad", text = "Help where the forest needs it. Dolanaar notices who does." } },
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
          text = "The Council knows you ran errands for Zenn Foulhoof. Feed that satyr a few fel cones, and the forest will call it even." },
        { id = "h_denalan", when = { questActive = TODO_QUEST("Denalan's Earth") },
          text = "Denalan studies Teldrassil's plants at Lake Al'Ameth. His rare earth from Darnassus came late. Take it to him, please." },
        { id = "h_sort", when = { metBefore = true }, text = "The Council sends more orders than Dolanaar has hands. I sort them by which ones get someone hurt if they wait." },
      },
      again = {
        { id = "h_again", text = "What else? There are always more orders." },
        { id = "h_again2", text = "Speak. I'll find you something useful." },
      },
      choices = {
        { text = "What is the Council of the Forest?", next = "council" },
        { text = "Who is Denalan?", next = "denalan" },
        { text = "Who is Zenn Foulhoof?", next = "zenn" },
        { text = "I'm an herbalist. What grows here?", next = "herbs", when = { profession = "Herbalism" } },
        { text = "I'll take on the Council's orders.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Those who speak for the forest around Dolanaar. I carry their word to anyone who'll act on it." } },
      choices = {
        { text = "Who sits on it?", next = "council2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council2 = {
      lines = { { id = "c2_default", text = "That's the Council's business. Mine is the orders. You'd be surprised how much quieter my life is that way." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    denalan = {
      lines = { { id = "d_default", text = "A colleague, camped by Lake Al'Ameth, testing what grows in the new soil. The timberlings there have him worried." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zenn = {
      lines = { { id = "z_default", text = "A satyr by the road who asks young ones for favours. He calls it business. The Council keeps track of who helps him." } },
      choices = {
        { text = "I helped him. I didn't know.", next = "zenn2", when = { questDone = TODO_QUEST("Zenn's Bidding") } },
        { text = "I'll stay away from him.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    zenn2 = {
      lines = { { id = "z2_default", text = "Then set it right. Fel cones fall under the trees, smoking green. Feed him a few. He'll think you've brought a snack." } },
      choices = {
        { text = "I'll set it right.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "That's a dirty trick.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    herbs = {
      lines = { { id = "h2_default", text = "Then you'll see what I mean about the soil: the plants are still deciding what to be. Show Denalan whatever looks wrong to you." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I carry the Council's orders. If I had a story, I'd have had to file it." } },
    advice = { { id = "tp_ad", text = "Don't make bargains with anything that has hooves and smiles." } },
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
          text = "Herbs from Porthannius? Good. A pity he couldn't bring them himself; we've a great deal to talk about, he and I." },
        { id = "h_joke", when = { metBefore = true }, text = "A Sentinel told me a joke last night. It wasn't funny, but she laughed so hard I laughed too. That's the inn on a good night." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Late. The Sentinels coming off watch will want tea. They always want tea, and they never admit they're cold." },
        { id = "h_corithras", when = { heardLine = "corithras.h_default" }, text = "Corithras and his wells. He tastes every one himself, you know, to find the trouble. I keep peppermint tea for him after." },
      },
      again = {
        { id = "h_again", text = "Anything else? There's tea." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "How's the inn?", next = "inn" },
        { text = "Any word from the road?", next = "road" },
        { text = "Just rest, thank you.", next = "END" },
      },
    },
    inn = {
      lines = {
        { id = "i_guests", text = "Young elves on their way to Darnassus, Sentinels off watch, and now and then a druid who forgets to change back before coming in. I've learned to keep the door wide." },
      },
      choices = {
        { text = "A druid, forgetting?", next = "druids_k" },
        { text = "Ha. Good to know.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    druids_k = {
      lines = { { id = "dk_default", text = "It happens. A bear at the hearth is good for business, right up until it tries a chair." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    road = {
      lines = { { id = "r_default", text = "The Gnarlpine grow bolder every week. Sentinel Kyra takes her rest here when she's off the road; ask her, she'll tell you plainly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep a fire lit between Shadowglen and Darnassus. It's a good place for a fire." } },
    advice = { { id = "tp_ad", text = "Rest when you can. A body and mind left without peace give out at the worst moment." } },
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
        { id = "h_stars", when = { metBefore = true }, text = "Last night I counted the stars through the leaves until I fell asleep. I got to forty. That's further than usual." },
      },
      again = {
        { id = "h_again", text = "Anything else? The fire's still going." },
      },
      choices = {
        { text = "Teach me.", next = "teach", fx = { affinity = 2, learn = { "camping" } } },
        { text = "Why sleep outdoors?", next = "why" },
        { text = "Where have you camped?", next = "where" },
        { text = "I'm a cook. What can I bring to a camp?", next = "cook", when = { profession = "Cooking" } },
        { text = "Not now.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "Sit by the fire and rest. Stay a few minutes and you'll feel it settle in. Then learn a trade in Dolanaar; every trade brings something to a camp." } },
      choices = {
        { text = "What does each trade bring?", next = "trades" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trades = {
      lines = { { id = "tr_default", text = "A leatherworker's tent. A fisher's rack. A cook's pot. Put them round a fire and a camp starts to feel like a house without walls." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } } },
    },
    why = {
      lines = { { id = "w_default", text = "Roofs keep the rain off and the stars out. I'd rather get wet." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    where = {
      lines = { { id = "wh_default", text = "Wherever the road ran out. I don't keep a list. Lists are for innkeepers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "c_default", text = "The first thing: the fire. A basic campfire is a cook's trick, and everything else in a camp gathers round it." } },
      choices = { { text = "Then I'll build one.", next = "BACK", fx = { affinity = 1, learn = { "camping" } } } },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "A fire, first. Then each trade brings its piece: a tent, a rack for fish, a pot. Anyone who passes may share it." } },
    background = { { id = "tp_bg", text = "I'd rather sleep under the canopy than under a roof. That's most of my story." } },
    advice = { { id = "tp_ad", text = "Sit by a fire before you sleep, even a small one. You wake up a different person." } },
    _none = { { id = "tp_none", text = "I'm only passing through. Ask in the village." } },
  },
}
