-- Two who keep shop in the Eastern Plaguelands: Augustus the Touched, still open for business
-- in ruined Terrordale, and Quartermaster Miranda Breechlock, the Argent Dawn's stores at
-- Light's Hope. Voices: bibles/plague_traders.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Augustus the Touched
---------------------------------------------------------------------------
P:NPC {
  key = "augustus", id = TODO_NPC("Augustus the Touched"), name = "Augustus the Touched",
  bible = "bibles/plague_traders.md", role = "vendor", tier = "service",
  communities = { "terrordale" }, temper = { "manic" }, values = { "greedy", "cheerful" },
  notices = { "purse", "race" },

  impression = {
    first = "Augustus the Touched is a Forsaken merchant who never stopped trading when Terrordale died around him, and he is as cracked as his prices. He lets Egan the dwarf work in his back room, and talks about him as his best customer, though Egan has never bought a thing.",
    third = "{name} met Augustus the Touched, a mad Forsaken merchant still keeping shop in the ruins of Terrordale.",
  },

  greetings = {
    { id = "g_default", text = "A customer, in Terrordale, of all places! Come in, come in, before something with fewer manners gets here first!" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Nobody comes back, except Egan, and he never buys anything!" },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Oh, that purse is singing to me, it's singing! Gold that heavy wants to be spent, friend, and I am the man to help it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf! Are you here for Egan? He's in the back with his machine, and he pays no rent, but I don't mind, I don't mind at all." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Welcome to Augustus's! Before the Scourge came I bought and sold everything in Terrordale, everything, and my prices were the talk of the town, and they still are, if you can find anybody left to talk!" },
        { id = "h_egan", when = { questActive = TODO_QUEST("The Restless Souls") },
          text = "You're here for Egan, aren't you? Everyone's here for Egan! He's in the back with his gadget, and if you buy something on the way through, I'll tell him you're a very nice person." },
      },
      again = {
        { id = "h_again", text = "What else, what else? Ask me anything, and then buy something!" },
        { id = "h_again2", text = "You're still here, and I like that, because I like everyone who's still here!" },
      },
      choices = {
        { text = "Show me what you're selling.", next = "BUSINESS" },
        { text = "What happened to Terrordale?", next = "town" },
        { text = "Who's the dwarf in your back room?", next = "egan" },
        { text = "Are you well, Augustus?", next = "touched" },
        { text = "I'll be going.", next = "END" },
      },
    },
    town = {
      lines = { { id = "t_default", text = "The plague came in on the grain carts, and then the dead got up and walked, which was very bad for business, I can tell you. First the customers stopped paying, then they stopped breathing, then they started biting, and I said to myself, Augustus, this is a buyer's market!" } },
      choices = {
        { text = "Why didn't you leave?", next = "town2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town2 = {
      lines = { { id = "t2_default", text = "Leave the shop? I was upstairs at the inn counting stock when it happened, and when I woke up I was still counting, so I simply carried on. Nobody in Terrordale has ever beaten my prices and nobody ever will, because nobody else is here!" } },
      choices = { { text = "That's one way to corner a market.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    egan = {
      lines = { { id = "e_default", text = "That's Egan, a dwarf, a very angry dwarf, but angry at the right things, which is the Scourge and not me. He builds machines in my back room to help the poor ghosts of Stratholme, and he pays me in conversation, which is the only currency I can't sell on." } },
      choices = {
        { text = "Do you mind him staying?", next = "egan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    egan2 = {
      lines = { { id = "e2_default", text = "Mind? He's the best customer I've ever had, and he's never bought a thing! He tells me about his mother and I tell him about my prices, and we both feel much better afterwards." } },
      choices = { { text = "That's a kind arrangement, Augustus.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    touched = {
      big = true,
      lines = { { id = "to_default", text = "Well? I'm marvelous! The Scourge leave me alone because I'm too busy to fight, and the Argent Dawn leave me alone because I'm too strange to recruit, and so here I am, open for business, every day, forever!" } },
      choices = {
        { text = "Someone should take you somewhere safe, Augustus.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave him be. He's happier here than anywhere.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, I don't know, but I'll buy it from you if you find out, at a very reasonable price!" } },
  },
}

---------------------------------------------------------------------------
-- Quartermaster Miranda Breechlock
---------------------------------------------------------------------------
P:NPC {
  key = "breechlock", id = TODO_NPC("Quartermaster Miranda Breechlock"), name = "Quartermaster Miranda Breechlock", title = "The Argent Dawn",
  bible = "bibles/plague_traders.md", role = "vendor", tier = "service",
  communities = { "light_hope", "argent_dawn" }, temper = { "gruff" }, values = { "dutiful", "practical" },
  notices = { "race", "status" },

  impression = {
    first = "Quartermaster Miranda Breechlock keeps the Argent Dawn's stores at Light's Hope Chapel and counts everything twice. She came north from Ironforge to keep a tally of the dead that she means to see come out in the living's favor.",
    third = "{name} met Quartermaster Miranda Breechlock, the dwarf who keeps the Argent Dawn's stores at Light's Hope.",
  },

  greetings = {
    { id = "g_default", text = "Argent Dawn stores, and speak up, because I'm halfway through a count." },
    { id = "g_honored", when = { reputation = { faction = "Argent Dawn", min = "honored" } },
      text = "Ah, I know that face! The Dawn speaks well of ye, and so does my ledger, which is harder to please." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf, this far north! Ye'll find the ale here's thin and the company's mostly dead, but the work's honest." },
    { id = "n_dawn", cat = "status", when = { reputation = { faction = "Argent Dawn", min = "revered" } },
      text = "Revered among the Dawn! I've plans and patterns in the back I keep for folk like ye, so ask and I'll fetch them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Quartermaster Miranda Breechlock, Argent Dawn stores at Light's Hope. If the Dawn has heard good things about ye, I've goods that'll help ye kill the dead more efficiently, and if it hasn't, there's always work to be done." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, before I lose my count." },
      },
      choices = {
        { text = "Show me the Dawn's stock.", next = "BUSINESS" },
        { text = "What brings a dwarf this far north?", next = "north" },
        { text = "What does the Dawn need most?", next = "need" },
        { text = "I'll leave you to your count.", next = "END" },
      },
    },
    north = {
      lines = { { id = "n_default", text = "The Dawn put out a call and Ironforge sent a few of us, and I was the one who couldn't stop counting things, so they gave me the stores. I lost a cousin to the plague near Hearthglen early on, and I reckoned I owed him a tally of the dead that came out in our favor." } },
      choices = {
        { text = "Is the tally in your favor yet?", next = "north2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    north2 = {
      lines = { { id = "n2_default", text = "Not yet, not by a long way, but it's closer than it was when I came, and that's what I write at the bottom of every page. Bring me Scourgestones and I'll write it a little closer still." } },
      choices = { { text = "I'll bring them. Something else.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    need = {
      big = true,
      lines = { { id = "ne_default", text = "Hands, mostly, and then steel, and then more hands to carry the steel, since the Scourge never run short of either. The Duke pays for what he can and Lord Tyrosus prays for the rest, and I keep the ledger honest between them." } },
      choices = {
        { text = "Every crown should send soldiers. This is everyone's war.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The crowns failed Lordaeron. Trust the Dawn, not kings.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's not in my ledger, so I can't help ye. Try Lord Tyrosus, or the Duke." } },
  },
}
