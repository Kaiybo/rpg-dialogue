-- Ironforge's great and learned: the High Tinker, the Royal Historian, the Explorers' League,
-- a senator in the quarry, and the man who keeps the Stonefire's kegs.
-- Voice: bibles/ironforge_court.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mekkatorque", id = TODO_NPC("High Tinker Mekkatorque"), name = "High Tinker Mekkatorque",
  bible = "bibles/ironforge_court.md", role = "noble", tier = "major",
  communities = { "ironforge" }, temper = { "quick" }, values = { "inventive", "compassionate" },
  notices = { "craft", "kin" },

  greetings = {
    { id = "g_tinker", text = "Hello, hello! Mind the floor, there's a gear loose somewhere. There's always a gear loose somewhere." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "A gnome! Good, good. Are you eating? Sleeping? Someone has to ask, and it may as well be me." },
    { id = "g_back", when = { metBefore = true }, text = "Splendid, you came back! I've had four ideas since you left. Three were terrible." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! What are you working on? No, let me guess. Something that explodes. Everyone starts with something that explodes." },
    { id = "n_gnome_rad", cat = "kin", when = { race = "Gnome", deed = "dungeon:Gnomeregan" },
      text = "You've seen the city, haven't you. Our city. It's in your face. I know that look; I see it in the mirror most mornings." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gelbin Mekkatorque, High Tinker of Gnomeregan. Elected, I'll have you know. Gnomeregan isn't fit to live in just now, so we tinker in Ironforge, by the King's kindness." },
        { id = "h_betrayal", tags = { "news" }, when = { questActive = TODO_QUEST("The Grand Betrayal") },
          text = "Thermaplugg. My own advisor. He's in the city still, ruling the poor sick souls we left behind. I sentenced him. Now someone has to carry the sentence down there." },
        { id = "h_betrayal_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Grand Betrayal") },
          text = "So. Thermaplugg is finished. I expected to feel lighter. I feel tired. Thank you all the same. Truly." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "A people whose island the winds carried into the sky! I have questions. Many questions. About winds, and loads, and whether the islands creak. Do they creak?" },
        { id = "h_refugee", when = { origin = "gnome_gnomeregan_refugee" },
          text = "You got out. I say it to everyone who did: you got out, and I'm glad. The rest we'll sort out together." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Splendid. Gnomes never kept priests; we kept wrenches. The dwarves in the Hall of Mysteries have been very patient with us." },
      },
      again = {
        { id = "h_again", text = "Where were we? I've lost the thread. I lose a lot of threads; I keep them in a drawer." },
        { id = "h_again2", text = "Ask away. The brain's still warm." },
      },
      choices = {
        { text = "What happened to Gnomeregan?", next = "fall" },
        { text = "What are you building?", next = "build" },
        { text = "Tell me about Thermaplugg.", next = "thermaplugg" },
        { text = "How do gnomes manage in Ironforge?", next = "exiles" },
        { text = "Can the Light do anything for your people?", next = "light", when = { class = "PRIEST" } },
        { text = "Will we ever go home, High Tinker?", next = "home_q", when = { race = "Gnome" } },
        { text = "I'm an engineer myself.", next = "eng", when = { profession = "Engineering" } },
        { text = "I'll let you work.", next = "END" },
      },
    },

    fall = {
      big = true,
      lines = {
        { id = "f_default", text = "Troggs came up from below, and we fought them in secret for years. Then a plan to flush them out went wrong, and the poison found our homes instead. Most of my people died in a day." },
      },
      choices = {
        { text = "I'm sorry.", next = "sorry", fx = { affinity = 2, trait = { kind = 1 }, learn = { "gnomeregan" } } },
        { text = "Whose plan was it?", next = "whose", fx = { learn = { "gnomeregan" } } },
        { text = "Why fight them in secret?", next = "secret" },
      },
    },
    sorry = {
      lines = { { id = "s_default", text = "So am I, every morning. Then I get up and draw something. The drawing helps. Gnomes are built to fix things, even the things we broke." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    whose = {
      lines = { { id = "w_default", text = "Thermaplugg proposed it. I approved it. Both of those are true, and I'll thank you not to let anyone tell you only one of them." } },
      choices = {
        { text = "That's a heavy thing to carry.", next = "BACK", fx = { affinity = 2 } },
        { text = "Then you share the blame.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Did he know it would fail?", next = "thermaplugg" },
      },
    },
    secret = {
      lines = {
        { id = "sc_default", text = "Lordaeron was burning, and the Alliance had cries for help enough. So we didn't cry. We held the troggs off ourselves, for five years." },
      },
      choices = {
        { text = "That was brave.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "That was proud.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Where did the troggs come from?", next = "troggs" },
      },
    },
    troggs = {
      lines = {
        { id = "tg_default", text = "Dwarven digs at Uldaman woke them, and our machines drew them like moths to a lamp. Nobody's fault. Everybody's problem." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } } },
    },

    build = {
      lines = { { id = "b_default", text = "A way home. Bits of it, anyway. Filters, suits, a better tram car. The tram was mine too, you know. That one went rather well." } },
      choices = {
        { text = "How did you build the tram?", next = "tram" },
        { text = "How do filters get you home?", next = "home_plan" },
        { text = "It's a marvel.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    tram = {
      lines = {
        { id = "tm_default", text = "Magni wanted a faster road to Stormwind. My first model was made of pie tins. The real one had rats for a month. We don't talk about the rats." },
      },
      choices = {
        { text = "Tell me about the rats.", next = "rats" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rats = {
      lines = {
        { id = "ra_default", text = "Large ones. I had to report them to General Turalyon himself. Four pages, with diagrams. I like to think he read them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    home_plan = {
      lines = {
        { id = "hp_default", text = "Suits that keep the poison out. Filters that scrub the air. And enough gnomes alive and willing to walk back in. The last part is the hard one." },
      },
      choices = {
        { text = "I'd walk in with you.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thermaplugg = {
      lines = {
        { id = "th_default", text = "My best friend, once. We graduated together; he gave me these lenses. Then he became my chief advisor, and he wanted my chair more than anything." },
      },
      choices = {
        { text = "Why keep the lenses?", next = "lenses" },
        { text = "Where is he now?", next = "thermaplugg_now" },
      },
    },
    lenses = {
      lines = {
        { id = "le_default", text = "Because they're very good lenses. And because I'd like to remember that I didn't see it. That's the useful part to remember." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thermaplugg_now = {
      lines = {
        { id = "tn_default", text = "Down in the city, ruling the ones we couldn't save. They're sick, he's mad, and he calls himself king of it. The king of nothing." },
        { id = "tn_done", when = { questDone = TODO_QUEST("The Grand Betrayal") },
          text = "Gone, thanks to you. I keep waiting to feel something tidy about it. Engineers like things tidy." },
      },
      choices = {
        { text = "I'll go down there.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    exiles = {
      lines = {
        { id = "ex_default", text = "Very well, mostly. The dwarves stare, and then they lend you a hammer. Tinker Town is ours by the King's kindness, and we try to be worth the room." },
      },
      choices = {
        { text = "Do the stares bother you?", next = "stares" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stares = {
      lines = {
        { id = "st_default", text = "Less than the cold. A gnome in Ironforge learns to be twice as clever and half as loud. I'm still working on the half as loud." },
      },
      choices = {
        { text = "Ha. Keep working on it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    light = {
      lines = {
        { id = "lt_default", text = "Can it? I'd dearly love to know. The priests in the Hall of Mysteries pray over the sick; I take readings. Neither of us has cured anyone yet." },
      },
      choices = {
        { text = "Then let me try.", next = "light_try" },
        { text = "Faith and readings can work together.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    light_try = {
      lines = {
        { id = "lr_default", text = "Then try, and tell me what you find, good or bad. Especially bad. Bad results are the ones that teach." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } } },
    },

    home_q = {
      big = true,
      lines = {
        { id = "hq_default", text = "Yes. I don't know when, and I won't lie to you about how. But yes. Hold on to your tools." },
      },
      choices = {
        { text = "I'll be ready.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I've stopped hoping.", next = "home_q2" },
      },
    },
    home_q2 = {
      lines = {
        { id = "hq2_default", text = "Then let me do the hoping for a while. That's what you elected me for. That, and the mechanostrider." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    eng = {
      lines = {
        { id = "en_default", text = "Then you know the rule: measure twice, and keep your eyebrows somewhere safe. What are you building?" },
      },
      choices = {
        { text = "Something that explodes.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something that helps people.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Nothing that works yet.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Gearshaft University, then the mechanostrider, then a great many awards. My apprentices made me build a trophy case. I keep spare parts in it." } },
    advice = { { id = "tp_ad", text = "Test it before you trust it. I learned that one the most expensive way there is.", next = "fall" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our home. Radiant, now, and not in a good way. Troggs in the halls, and worse in the deep workshops. We'll go back. I've drawn the plans." } },
    dark_iron = { { id = "tp_dark_iron", text = "Magni's business, and he carries it heavily. I'd lend him every gnome I have if he asked. He hasn't asked." } },
    explorers_league = { { id = "tp_league", text = "Wonderful people. They write everything down. I wish we had. We'd lost half our records before we knew what we'd lost." } },
    uldaman = { { id = "tp_uldaman", text = "Where the troggs first woke, I'm told. I'd rather not visit. I've met enough troggs for one lifetime." } },
    troggs = { { id = "tp_troggs", text = "They came up under our city first. Whatever they are, they're not finished.", next = "troggs" } },
    _none = { { id = "tp_none", text = "Not my department, I'm afraid. I have only the one department, and it's on fire." } },
  },
}

P:NPC {
  key = "archesonus", id = TODO_NPC("Royal Historian Archesonus"), name = "Royal Historian Archesonus",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "curious", "honest" },
  notices = { "lore" },

  greetings = {
    { id = "g_voice", text = "That's a step I don't know. Come closer and speak, so I can learn yer voice. That's how I keep my visitors." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I know that voice. Sit, sit. Where did we leave off?" },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "Ye've read The Seven Kingdoms. Ye can hear it in how ye say 'Khaz Modan', proper-like. Good. Most don't bother." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Archesonus, historian to the King. My eyes went long ago; my memory didn't. Ask me anything about Ironforge and I'll tell ye more than ye wanted." },
        { id = "h_thaurissan", tags = { "news" }, when = { questActive = TODO_QUEST("The Smoldering Ruins of Thaurissan") },
          text = "Sit, and I'll tell ye of Thaurissan, the Dark Iron city that stood where the Burning Steppes are now. Mind, it's not a short story, and it doesn't end well for anyone." },
        { id = "h_books", when = { metBefore = true },
          text = "I wrote on the fall of Lordaeron, ye know, and on plagues and curses. Dictated it, rather. My scribe has the patience of a mountain." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "A voice I can't place. Elven, but with wind in it. There's nothing about yer folk in my books. Come back and tell me things, and there will be." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest; I can hear the vestments. I wrote a book on plagues and curses. Priests either thank me for it or argue with it. I enjoy both." },
      },
      again = {
        { id = "h_again", text = "Where were we? Ah, I remember. I always remember." },
        { id = "h_again2", text = "Go on, ask. I've nowhere to be. I'm a historian." },
      },
      choices = {
        { text = "Tell me about Thaurissan.", next = "thaurissan" },
        { text = "What's happening with the Dark Iron now?", next = "now" },
        { text = "What have you written?", next = "books" },
        { text = "How did Ironforge begin?", next = "three_hammers" },
        { text = "I was there when Lordaeron fell.", next = "witness", when = { origin = "human_lordaeron_refugee" } },
        { text = "Your plague book. Did the Light help anyone?", next = "plague_light", when = { class = "PRIEST" } },
        { text = "Another time.", next = "END" },
      },
    },

    thaurissan = {
      big = true,
      lines = {
        { id = "t_default", key = true,
          text = "The dwarven clans were at war with each other then. The Dark Iron city burned in one great blast, and the land round it turned to ash. What crawled out of the ash went into the mountain and built again." },
      },
      choices = {
        { text = "What made the blast?", next = "burn" },
        { text = "What did they build?", next = "build", fx = { learn = { "dark_iron" } } },
        { text = "A dark story.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } },
      },
    },
    burn = {
      lines = {
        { id = "bu_default", text = "We do not know. Every account I've read stops at the same place, like a road that ends at a cliff." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    build = {
      lines = { { id = "b_default", text = "Blackrock Spire. Fortresses in the Searing Gorge. A kingdom under the ash. Some say something old and hot sits beneath them all, giving the orders. I record that it's said." } },
      choices = {
        { text = "Something old and hot?", next = "old_evil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old_evil = {
      lines = {
        { id = "oe_default", text = "I record what's said. I don't record what I can't confirm. Go into that mountain and find out, if ye're ever able, and I'll write it down properly." },
      },
      choices = {
        { text = "Maybe one day.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Some things are better unconfirmed.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    now = {
      lines = { { id = "n_default", text = "Busier than they've been in a long while. Forts in the Badlands, diggers in Uldaman, and they struck the dam at Loch Modan. Ye don't do all that without a plan." } },
      choices = {
        { text = "Why the dam?", next = "dam" },
        { text = "Thank you, Historian.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron", "uldaman" } } },
      },
    },
    dam = {
      lines = {
        { id = "d_default", key = true,
          text = "There's an irony there. The stonewrought method of building was a Dark Iron architect's, one Franclorn Forgewright. Draw yer own conclusions about the Stonewrought Dam." },
      },
      choices = {
        { text = "Does the dam's engineer know that?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },

    books = {
      lines = {
        { id = "bk_default", text = "The Fall of Lordaeron and the Scouring of the Eastweald. And On Plagues, Curses, and Blights. Neither one gets read aloud at weddings." },
      },
      choices = {
        { text = "Why write about Lordaeron?", next = "books_lordaeron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    books_lordaeron = {
      lines = {
        { id = "bl_default", text = "Because somebody had to, before the people who saw it stopped talking. Grief makes poor witnesses and worse historians. I tried to be neither." },
      },
      choices = {
        { text = "That's a hard thing to write.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    three_hammers = {
      lines = {
        { id = "th_default", text = "Three clans under one high king, Modimus Anvilmar. When he died, Bronzebeard, Wildhammer and Dark Iron fought for his throne. We kept the mountain. Nobody kept the peace." },
      },
      choices = {
        { text = "What became of the Anvilmars?", next = "anvilmar" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    anvilmar = {
      lines = {
        { id = "an_default", text = "Madoran Bronzebeard gave them a seat in the Senate for good, so they'd never turn enemy. A beaten family with a chair argues instead of fights." },
      },
      choices = {
        { text = "Clever.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    witness = {
      big = true,
      lines = {
        { id = "wi_default", text = "Then sit, and tell me. Not the battles; I have those. Tell me what people carried when they ran. Nobody ever writes that down." },
      },
      choices = {
        { text = "Bread. Children. Holy books.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "I'd rather not remember.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    plague_light = {
      lines = {
        { id = "pl_default", text = "From what I gathered, the Light eased the dying better than it stopped the dying. The plague came in the grain, and the grain kept coming." },
      },
      choices = {
        { text = "Then we must be quicker next time.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "That's grim, Historian.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Historian to the King. My eyes went, my memory didn't, and a patient scribe writes down what I say. Between us we've filled a shelf." } },
    advice = { { id = "tp_ad", text = "Write down what ye saw on the day ye saw it. By the next day ye'll have improved it." } },
    dark_iron = { { id = "tp_dark_iron", text = "Our kin, once. Our enemies for longer. History doesn't forgive, but it remembers both.", next = "thaurissan" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes kept poor records and lost the rest. I've offered my scribe to Mekkatorque. He's thinking about it." } },
    explorers_league = { { id = "tp_league", text = "They dig it up, I write it down. Magellas and I argue about which is the harder job. I'm right." } },
    stonewrought_dam = { { id = "tp_dam", text = "A wonder of the world, built by a method its keepers would rather not trace.", next = "dam" } },
    _none = { { id = "tp_none", text = "Not in my memory, and my memory's longer than most." } },
  },
}

P:NPC {
  key = "magellas", id = TODO_NPC("High Explorer Magellas"), name = "High Explorer Magellas",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "eager" }, values = { "curious", "serious" },
  notices = { "lore", "travel" },

  greetings = {
    { id = "g_league", text = "This is the Hall of Explorers. Touch nothing with a label. Touch nothing without one, either. Ask first." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've come back. Seen anything worth writing down?" },
  },

  notice = {
    { id = "n_far", cat = "travel", when = { visited = "Darkshire" },
      text = "You've been south, past the forest. Did you write anything down? Nobody ever writes anything down." },
    { id = "n_miner", cat = "lore", when = { profession = "Mining" },
      text = "A miner! If you ever break into a hall that isn't on any map, stop swinging and send for us. Please." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Muninn Magellas, High Explorer of the Explorers' League. We map the world, catalogue what lives in it, and dig up what used to. My Prospectors dig; I worry." },
        { id = "h_discs", tags = { "news" }, when = { questActive = TODO_QUEST("The Platinum Discs") },
          text = "Discs from Uldaman, and they speak? Do you understand what this might mean? Where we came from. What we are. Let me sit down." },
        { id = "h_brann", key = true, when = { minLevel = 30 },
          text = "Brann should be here for this. He's been gone too long in the field, even for Brann. I keep a chair for him all the same." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "We have no entry for you. None! An entire people, and the League's never written a line. Please, sit, and let me fix that." },
        { id = "h_prism", tags = { "news" }, when = { questRecent = { TODO_QUEST("Prehistoric Prism"), days = 7 } },
          text = "The relic from the Wetlands dig. Titan marks, unmistakable. It's been on my desk three days and I keep finding excuses to touch it." },
        { id = "h_apprentice", when = { origin = "dwarf_explorers_league" },
          text = "One of ours! Don't tell me which Prospector you trained under. Let me guess from the state of your boots." },
      },
      again = {
        { id = "h_again", text = "What else? The catalogue can wait. It always does." },
        { id = "h_again2", text = "Go on. Questions are the one thing we never run short of here." },
      },
      choices = {
        { text = "What does the League do?", next = "league" },
        { text = "What are you hoping to find?", next = "hope" },
        { text = "Where's Brann?", next = "brann" },
        { text = "Where are your people digging now?", next = "sites" },
        { text = "I trained with the League, High Explorer.", next = "apprentice", when = { origin = "dwarf_explorers_league" } },
        { text = "About that relic from the Wetlands...", next = "prism", when = { questDone = TODO_QUEST("Prehistoric Prism") } },
        { text = "Good luck with your work.", next = "END" },
      },
    },

    league = {
      lines = { { id = "l_default", text = "Everything nobody else has time for. Ruins, relics, beasts, maps. If it's old, odd or underground, someone of ours has a notebook out." } },
      choices = {
        { text = "Who started it?", next = "league_start" },
        { text = "Sounds like my kind of work.", next = "BACK", fx = { affinity = 1, learn = { "explorers_league" } } },
      },
    },
    league_start = {
      lines = {
        { id = "ls_default", text = "The King, when our miners broke into halls older than Ironforge. He told a kingdom of miners to start digging for answers instead of ore." },
      },
      choices = {
        { text = "Did the League go north, too?", next = "northrend" },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    northrend = {
      big = true,
      lines = {
        { id = "nr_default", text = "Muradin Bronzebeard himself led an expedition of ours to Northrend before the war. We lost him there, and we never heard from most of the others again." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hope = {
      big = true,
      lines = {
        { id = "h2_default", text = "Where the dwarves came from. Truly came from. There are halls in the old places that weren't built to our size. I want to know whose they were." },
      },
      choices = {
        { text = "I hope you find out.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Some things should stay buried.", next = "buried" },
      },
    },
    buried = {
      lines = { { id = "b_default", text = "Spoken like someone who's never held a thing older than their kingdom in their hands. Do that once. Then tell me again." } },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } },
        { text = "I stand by it.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    brann = {
      lines = {
        { id = "bn_default", text = "Gone months, without a letter, and Brann writes letters the way other dwarves drink. The King's stopped hoping. I keep the chair. That's not hope, exactly. It's tidiness." },
      },
      choices = {
        { text = "Where was he last?", next = "brann_last" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brann_last = {
      lines = {
        { id = "bl_default", text = "With Brann, 'last' is a big word. His letters used to arrive from three places at once. Now they don't arrive at all." },
      },
      choices = {
        { text = "He'll write.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sites = {
      lines = {
        { id = "si_default", text = "Ironband's dig by Thelsamar, slower than I'd like. Gol'Bolar. Uldaman, where the troggs and the Dark Irons got in first. And Darkshore, of all places." },
      },
      choices = {
        { text = "Why so slow at Ironband's?", next = "sites_ironband" },
        { text = "Darkshore? My people's shore.", next = "sites_darkshore", when = { race = "NightElf" } },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman", "explorers_league" } } },
      },
    },
    sites_ironband = {
      lines = {
        { id = "sb_default", text = "Troggs came up through his trench right after his crew lifted a cache of carved idols. Ironband thinks the idols stirred them. I'm inclined to agree." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sites_darkshore = {
      lines = {
        { id = "sd_default", text = "Ruins your people left, older than ours. Your Sentinels watch our diggers like hawks. Fair; I'd watch us too." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    apprentice = {
      lines = {
        { id = "ap_default", text = "Then what have you found? Anything? Don't be modest. Modest explorers never get their next expedition paid for." },
      },
      choices = {
        { text = "Nothing yet.", next = "BACK", fx = { affinity = 1 } },
        { text = "A few pots and a great deal of dirt.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    prism = {
      lines = {
        { id = "pr_default", text = "A titan relic, carried here by hand, whole. Do you know how rare that is? Most of our finds arrive in pieces, along with the Prospector." },
      },
      choices = {
        { text = "What will it tell you?", next = "prism_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prism_what = {
      lines = {
        { id = "pw_default", text = "Who made the old halls, if I'm right. And if I'm wrong, something stranger. I'd settle for stranger." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Curious since I could crawl, and paying for it since I could read. Now I steer the League and answer all its letters." } },
    advice = { { id = "tp_ad", text = "Write it down: dates, places, who was with you. Memory is a liar with very good manners." } },
    explorers_league = { { id = "tp_league", text = "Mine to steer, for my sins. Hundreds of Prospectors across the world, and every one of them writes to me at once.", next = "league" } },
    dark_iron = { { id = "tp_dark_iron", text = "They're digging in Uldaman, and they're not digging for history. That frightens me more than their axes." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "We sent a team to chart the outer halls. They came back with maps and a terrible cough." } },
    uldaman = { { id = "tp_uldaman", text = "Ours first, then the troggs', then the Dark Irons'. One day it'll be ours again, and I'd like to be alive for it." } },
    _none = { { id = "tp_none", text = "Not catalogued yet. Write it down for me, would you? Dates, places. Sketches, if you can." } },
  },
}

P:NPC {
  key = "stormpike_p", id = TODO_NPC("Prospector Stormpike"), name = "Prospector Stormpike",
  bible = "bibles/ironforge_court.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "hot" }, values = { "proud" },
  notices = { "craft" },

  greetings = {
    { id = "g_busy", text = "What. I'm reading. I'm always reading. Make it quick." },
    { id = "g_back", when = { metBefore = true }, text = "You. Fine. Speak." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner. At least ye know which end o' the pick goes in the rock. That's more than half the folk who come in here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Stormpike. Prospector. Explorers' League. That's my name, my job and my lodge, and that's all the chat ye're getting today." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Ironforge") },
          text = "A report? About time. Hand it here. No, don't read it to me. I can read." },
        { id = "h_powder", when = { questActive = TODO_QUEST("Powder to Ironband") },
          text = "Ironband's supplies. Get them to his dig in Loch Modan in one piece, an' don't dawdle." },
        { id = "h_uldaman", tags = { "news" }, when = { questActive = TODO_QUEST("Stormpike's Deciphering") },
          text = "Somethin' out o' Uldaman that needs readin'. Bring it here an' leave me be for a week." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("Letter to Stormpike") },
          text = "A cipher? From Dibbs? Hand it here. Hm. Somebody clever wrote this. No' clever enough." },
        { id = "h_chamber", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Hidden Chamber"), days = 7 } },
          text = "Ye saw Khaz'mul's chamber. Baelog was right, an' I had my doubts. Don't repeat that tae him." },
      },
      again = {
        { id = "h_again", text = "What now?" },
        { id = "h_again2", text = "Still here. Fine. Quickly." },
      },
      choices = {
        { text = "What are you reading?", next = "reading" },
        { text = "I hear Ironband's short of blastpowder.", next = "powder" },
        { text = "They say you can read any cipher.", next = "cipher" },
        { text = "What happened at Uldaman?", next = "uldaman" },
        { text = "I met a Mountaineer Stormpike at Algaz.", next = "clan", when = { questDone = TODO_QUEST("Mountaineer Stormpike's Task") } },
        { text = "Sorry to bother you.", next = "END" },
      },
    },

    reading = {
      lines = { { id = "r_default", text = "Prospector business. Which is to say, none o' yours. Off ye go." } },
      choices = {
        { text = "Charming.", next = "charm" },
        { text = "Going.", next = "END" },
      },
    },
    charm = {
      lines = { { id = "c_default", text = "Charm doesnae dig tunnels. Come back when ye've something for me to read." } },
      choices = { { text = "Fine. Something else, then.", next = "BACK" } },
    },

    powder = {
      lines = {
        { id = "pw_default", text = "I sent that man a load o' blastpowder weeks ago, an' his report doesnae mention it. So either Ironband's lyin' or somebody's stealin'. Ironband cannae lie." },
      },
      choices = {
        { text = "Who'd steal blastpowder?", next = "powder_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    powder_who = {
      lines = {
        { id = "pd_default", text = "Somebody who wants a hole where it shouldnae be. Dark Irons, if ye want my guess. My guesses are usually better than other folks' facts." },
        { id = "pd_saean", when = { questDone = TODO_QUEST("Protecting the Shipment") },
          text = "A porter. Saean. Near a year on our payroll, an' sellin' us tae the Dark Irons the whole time. I'm readin' every name on that payroll twice." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },

    cipher = {
      lines = {
        { id = "ci_default", text = "Codes, ciphers, the scrawl o' men who think they're clever. Loremaster Dibbs in Southshore sends me half his work an' none o' his gratitude." },
      },
      choices = {
        { text = "Teach me?", next = "cipher_teach" },
        { text = "I've broken a cipher or two myself.", next = "BACK", when = { class = "ROGUE" }, fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cipher_teach = {
      lines = {
        { id = "ct_default", text = "No. But here's the first lesson free: every cipher's written by somebody lazy. Find where they got lazy." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    uldaman = {
      lines = {
        { id = "ul_default", text = "Ours, once. A dig full o' things older than the mountain. Then the troggs came up so fast we left people behind. Baelog an' his lads among 'em." },
      },
      choices = {
        { text = "Are they alive?", next = "uldaman_baelog" },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },
    uldaman_baelog = {
      lines = {
        { id = "ub_default", text = "If anyone's stubborn enough tae outlive troggs, it's Baelog. Find him, if ye're ever strong enough tae walk in there." },
        { id = "ub_found", when = { questDone = TODO_QUEST("The Lost Dwarves") },
          text = "Alive, an' bettin' wi' Olaf about the length o' his beard. Of course he is." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    clan = {
      lines = {
        { id = "cl_default", text = "There's Stormpikes all over Khaz Modan. Proud clan, an' a rich one, an' we never let anybody forget either. Did he send ye south for a Longbeard shield?" },
      },
      choices = {
        { text = "He did.", next = "BACK", fx = { affinity = 1 } },
        { text = "Proud and rich. I noticed.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Prospector. League. Stormpike. I told ye that already. Ye weren't listenin'." } },
    advice = { { id = "tp_ad", text = "Read it twice before ye act on it. Then read it again, because ye skimmed." } },
    explorers_league = { { id = "tp_league", text = "Magellas runs it. I do the work. That's not a complaint, it's a description." } },
    dark_iron = { { id = "tp_dark_iron", text = "Diggin' where they've no business diggin'. If they find what they're after before we do, we'll all hear about it." } },
    uldaman = { { id = "tp_uldaman", text = "We'll have it back. Then I'll have the readin' o' it, an' no one'll bother me for a year.", next = "uldaman" } },
    _none = { { id = "tp_none", text = "Not my business. Prospector business only." } },
  },
}

P:NPC {
  key = "stonehallow", id = TODO_NPC("Senator Mehr Stonehallow"), name = "Senator Mehr Stonehallow",
  bible = "bibles/ironforge_court.md", role = "noble", tier = "quest",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "kit", "greenness" },

  greetings = {
    { id = "g_quarry", text = "Watch yer footing. The troggs come up out o' the quarry like water from a cracked pipe." },
    { id = "g_back", when = { metBefore = true }, text = "Fewer o' the beasts since ye were last here, I'll grant. Not none, mind." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Ye're young yet. Good. The troggs are no' much older. Ye'll learn on each other." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Senator Mehr Stonehallow, o' Ironforge's Senate, an' a League man besides. I could be debatin' in the warm. Instead I'm countin' heads in a quarry. Someone has to." },
        { id = "h_public", tags = { "news" }, when = { questActive = TODO_QUEST("The Public Servant") },
          text = "Rockjaw troggs, all over Gol'Bolar. Thin the brutes out. The Senate'll thank ye. Eventually. In writin'. It's how the Senate does things." },
        { id = "h_public_done", when = { questDone = TODO_QUEST("The Public Servant") },
          text = "That's a quieter quarry than I've seen in months. I'll mention ye in my next speech. Briefly. They're long speeches." },
        { id = "h_campfire", when = { questActive = TODO_QUEST("A Visitor to Dun Morogh") },
          text = "A campfire on the ridge above my quarry? I saw it. I took it for troggs learnin' fire. Go an' look, then; I'm busy." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Quick, now; the troggs don't take recess." },
        { id = "h_again2", text = "Go on. I've a speech tae write, an' I'd welcome the delay." },
      },
      choices = {
        { text = "Why not leave it to the guards?", next = "why" },
        { text = "Where did the troggs come from?", next = "troggs" },
        { text = "What does the Senate do, exactly?", next = "senate" },
        { text = "What's the quarry for?", next = "quarry" },
        { text = "I grew up in the mines under the mountain.", next = "miner", when = { origin = "dwarf_ironforge_miner" } },
        { text = "A Wildhammer's camped above your quarry.", next = "farsen", when = { questDone = TODO_QUEST("Farsen's Watch") } },
        { text = "Good luck, Senator.", next = "END" },
      },
    },

    why = {
      lines = { { id = "w_default", text = "The guards are on the walls, an' the walls are where they belong. A senator who won't get his boots dirty for his own district isn't worth the chair." } },
      choices = {
        { text = "Respect.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "And it wins votes.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
    troggs = {
      lines = {
        { id = "tg_default", text = "Out o' the ground. We dug deep, an' they poured out an' smashed every tool they found. Nobody knows what wakes 'em. Everybody has an opinion." },
      },
      choices = {
        { text = "What's yours?", next = "troggs_think" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs_think = {
      lines = {
        { id = "tt_default", text = "Diggin'. Ours. I'm a League man, an' I'll say it in the Senate: we dig where we shouldnae an' then act surprised. Doesnae mean we stop." },
      },
      choices = {
        { text = "Honest of you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Maybe you should stop.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    senate = {
      lines = {
        { id = "se_default", text = "Looks into threats, keeps the mines producin', sets coin aside for defense. An' argues. Mostly argues. Some senators think the Dark Irons are a bedtime story." },
      },
      choices = {
        { text = "Do you?", next = "senate_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    senate_dark = {
      lines = {
        { id = "sd_default", text = "I've seen soot on a few beards that came from no forge o' ours. I say so. They tell me I've been in the quarry too long. Maybe I have." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    quarry = {
      lines = {
        { id = "qu_default", text = "Stone for the city an' ore for the forges. When it's runnin', a hundred miners eat. When it's not, they drink at the Stonefire an' blame the Senate." },
      },
      choices = {
        { text = "Then let's get them back to work.", next = "BACK", fx = { affinity = 1, standing = { ironforge = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    miner = {
      lines = {
        { id = "mi_default", text = "Then ye know what it is when the work stops. Help me make liars o' the troggs, an' the miners'll be back in by spring." },
      },
      choices = { { text = "Count on it.", next = "BACK", fx = { affinity = 2, standing = { ironforge = 1 } } } },
    },
    farsen = {
      lines = {
        { id = "fa_default", text = "A Wildhammer, watchin' over my quarry wi' wind-magic. Well. As long as it's the Dark Irons he's watchin', an' no' my miners." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Senator, League member, an' the only one o' either with boots this muddy." } },
    advice = { { id = "tp_ad", text = "If a job's worth a speech, do the job first. The speech goes better after." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The troggs came up through the gnomes first. Now they're coming up through us. Draw yer own conclusions." } },
    explorers_league = { { id = "tp_league", text = "I'm a member. I pay my dues an' dig my own holes. Some o' them in quarries." } },
    troggs = { { id = "tp_troggs", text = "Rockjaw, here. Stupid, strong, an' bad for business.", next = "troggs" } },
    _none = { { id = "tp_none", text = "Raise it in the Senate. Bring a cushion, it'll be a while." } },
  },
}

P:NPC {
  key = "firebrew", id = TODO_NPC("Innkeeper Firebrew"), name = "Innkeeper Firebrew",
  bible = "bibles/ironforge_court.md", role = "innkeeper", tier = "service",
  communities = { "ironforge" }, temper = { "jolly" }, values = { "generous" },
  notices = { "drink", "weary" },

  greetings = {
    { id = "g_tavern", text = "Welcome tae the Stonefire! Grab a stool, grab a mug, an' if ye've a story, grab the room's attention." },
    { id = "g_home", when = { homeInn = { "Ironforge", "Stonefire Tavern" } }, text = "There ye are! Yer bed's warm. Everythin' in Ironforge is warm. It's the forges." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ye're well on yer way! Good. That's what the place is for. Sit down before ye do it by accident." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Ye've had a hard road. Sit by the fire an' let the mountain hold ye a while. It's good at that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Firebrew. I keep the Stonefire. The beer's strong, the fire's stronger, an' the stories get taller as the kegs get lighter." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Well now, an elf from the clouds, in my tavern! Sit near the fire. Ye'll be cold up here. Well, down here. Under here." },
        { id = "h_druid_call", when = { minLevel = 47 },
          text = "Word's come from Darnassus: Arch Druid Staghelm wants seasoned hands for some research o' his. If ye go, wipe yer boots before ye come back in." },
      },
      again = {
        { id = "h_again", text = "Another? Story or ale, ye're welcome either way." },
        { id = "h_again2", text = "What else? The kegs aren't goin' anywhere. That's the trouble." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Tell me a story.", next = "story" },
        { text = "Who drinks here?", next = "regulars" },
        { text = "Just a drink.", next = "END" },
      },
    },
    story = {
      lines = { { id = "s_default", text = "Ye want a story, ye tell one first. That's the rule o' the Stonefire. Then the old greybeard by the fire'll tell ye about the time he arm-wrestled a gryphon." } },
      choices = { { text = "Did he win?", next = "won" }, { text = "Maybe later.", next = "BACK" } },
    },
    won = {
      lines = { { id = "w_default", text = "Depends which night ye ask him. Twice he's won. Once he's lost an arm. He's got both his arms." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Miners off shift, the King's guard after theirs, gnomes from Tinker Town drinkin' half-measures. An' John Turner, nursin' water an' askin' for coin for orphans." },
      },
      choices = {
        { text = "Does anyone give him coin?", next = "regulars_john" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars_john = {
      lines = {
        { id = "rj_default", text = "More than ye'd think. A dwarf cannae stand bein' asked twice in front o' his friends. John knows it, too. Clever man." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Kept the Stonefire's kegs longer than some o' my regulars have had beards. Longer than some o' the beards have had regulars." } },
    advice = { { id = "tp_ad", text = "Never drink wi' a gnome engineer who's brought his work along. Somethin' always goes off." } },
    dark_iron = { { id = "tp_dark_iron", text = "Don't say that name loud in here. The lads get worked up, an' worked-up dwarves break furniture." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our little friends drink half-measures an' tip double. I'll no' hear a word against them." } },
    _none = { { id = "tp_none", text = "Ask the room. Someone in here'll know, an' three more'll argue." } },
  },
}
