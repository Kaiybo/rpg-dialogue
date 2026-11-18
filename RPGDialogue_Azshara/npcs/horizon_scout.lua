-- The rest of the Horizon Scout's story: Second Mate Shandril (on a spit of land, watching the wreck)
-- and Roland Geardabbler (the gnome below, holding a water-breathing ward over the trapped crew).
-- Voice: bibles/horizon_scout.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Second Mate Shandril
---------------------------------------------------------------------------
P:NPC {
  key = "shandril", id = TODO_NPC("Second Mate Shandril"), name = "Second Mate Shandril",
  bible = "bibles/horizon_scout.md", role = "soldier", tier = "quest",
  communities = { "ruined_reaches" }, temper = { "steady", "anxious" }, values = { "loyal", "dutiful" },
  notices = { "swimmer", "healer" },

  impression = {
    first = "She won't leave until the crew still trapped aboard come up.",
    third = "{name} met Second Mate Shandril, who keeps watch over the sunken Horizon Scout off the coast of Azshara.",
  },

  greetings = {
    { id = "g_default", text = "Mind the tide line, it comes in fast. And if you're going swimming, don't go near the wreck without telling me first." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Nothing's come up from the wreck since you left, not a bubble's worth." },
    { id = "g_crew", when = { questDone = TODO_QUEST("A Crew Under Fire") }, text = "You held the beach with the captain, I heard. Thank you. I could see the fires from here and I couldn't do a thing." },
  },

  notice = {
    { id = "n_swim", cat = "swimmer", when = { form = "aquatic" },
      text = "A seal! No, a druid, Light bless you. If you can breathe down there, you're the most useful soul who's walked onto this beach in a month." },
    { id = "n_heal", cat = "healer", when = { class = { "PRIEST", "PALADIN", "SHAMAN" } },
      text = "A healer. If you're heading to the captain's camp, Alexandra Blazen, our priestess, will thank you with tears in her eyes; she's been mending sailors alone since the night we sank." },
  },

  start = "hello",
  nodes = {
    dd_drown = {
      lines = {
        { id = "dd_drown_1",
          text = "Every sailor has, but never so many in one night as when the Horizon Scout went down. The naga came up under the hull and we didn't see them until the water was in the hold, and half the watch went over the side before I could call them back." },
        { id = "dd_drown_2",
          text = "So mind the deep water here, friend, and mind it at night above all. The sea doesn't hate anyone, but the things living in this bay certainly do." },
      },
      choices = {
        { text = "I'll respect the water from now on.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll swim where I please. The sea won't scare me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Shandril.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_drown", when = { deathCause = "drowning" },
          text = "I heard the water took you somewhere along this coast, and you came back gasping. I've seen too many go under who didn't, so forgive me if I look at you like a ghost." },
        { id = "h_default", key = true,
          text = "Second Mate Shandril, of the Horizon Scout, or what's left of her. She's down there, under the water just off this point, and some of our crew are still inside, alive, because a gnome named Roland is keeping them breathing with some sort of spell. I'm waiting for them to come up, and I won't go anywhere until they do." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage! Can you tell me how long a ward like Roland's can hold? Nobody here understands magic, and I've been counting the days on my fingers." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'll keep my eyes on the water while you ask." },
        { id = "h_again2", text = "Go on. I talk better when I'm not just watching." },
      },
      choices = {
        { text = "You've lost sailors to the sea before?", next = "dd_drown", when = { deathCause = "drowning" } },
        { text = "What happened to the Horizon Scout?", next = "wreck" },
        { text = "Who's trapped down there?", next = "trapped" },
        { text = "Why not swim down and get them?", next = "swim" },
        { text = "What were you doing in Azshara?", next = "why" },
        { text = "How long can a ward like that hold?", next = "ward", when = { class = "MAGE" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },

    wreck = {
      lines = { { id = "wr_default", text = "Naga, in the night. We heard singing, and then the hull went, and the sea came in so fast the lower decks never had a chance. The captain got most of us to the beach, and she hasn't forgiven herself for the ones she didn't." } },
      choices = {
        { text = "Why would the naga sink you?", next = "wreck_why" },
        { text = "Something else.", next = "BACK", fx = { learn = { "horizon_scout" } } },
      },
    },
    wreck_why = {
      lines = { { id = "ww_default", text = "I've asked myself that every night since. We were carrying passengers and cargo, nothing a naga should want, unless it was something one of the passengers brought aboard. There was a funny blue stone rolling about on the forward stair, and I've wondered about it since." } },
      choices = {
        { text = "A blue stone?", next = "wreck_stone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wreck_stone = {
      lines = { { id = "ws_default", text = "Azsharite, the captain thinks, the crystal they dig out of the cliffs here. Somebody aboard was carrying it, and the naga came for it, or for whoever had it. I don't know who, and the ones who'd know are either dead or keeping quiet." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    trapped = {
      lines = { { id = "tr_default", text = "Roland Geardabbler, a gnome passenger who knows magic, and three or four of the crew who were below when we sank. Roland put up a ward that lets them breathe, and he's been holding it ever since. I can't think how he sleeps, or if he does." } },
      choices = {
        { text = "And the other passengers?", next = "trapped_pass" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trapped_pass = {
      lines = { { id = "tp_default", text = "Alexandra Blazen, a priestess, and a paladin named Patrick Mills came ashore with the captain, and a mage, Lindros, who's been very quiet about his business in Azshara. They all paid for passage, and none of them will say why they wanted to come here of all places." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    swim = {
      big = true,
      lines = { { id = "sw_default", text = "Because the naga patrol the water around the wreck, and the last sailor who tried came back in pieces. The captain says we wait for help, and I follow orders, but some nights I think we should all go down together and drag them out, naga or no naga." } },
      choices = {
        { text = "Follow your captain. A rash rescue loses everyone.", next = "swim_end", fx = { align = { order = 1 } } },
        { text = "Orders be damned. Your crew is drowning.", next = "swim_end", fx = { align = { order = -1 } } },
        { text = "Could I help?", next = "swim_end" },
      },
    },
    swim_end = {
      lines = { { id = "se_default", text = "If you can get close to the wreck and back without the naga noticing, then tell Roland we haven't forgotten him. It's not much, but I think it would help him hold on." } },
      choices = { { text = "I'll try.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    why = {
      lines = { { id = "wy_default", text = "Our passengers paid well for a run up the coast of Azshara, and the captain doesn't ask questions when the gold's good. In hindsight, we should have asked a great many questions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ward = {
      lines = { { id = "wa_default", text = "That's what I hoped you'd tell me. Roland said he could hold it 'as long as the gears in his head keep turning', which isn't the sort of answer a sailor finds comforting." } },
      choices = {
        { text = "A strong mage could hold it for weeks.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Not much longer, I fear.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The wreck, the crew, and the tide tables. I'm a sailor." } },
    horizon_scout = { { id = "tp_hs", text = "Best ship I ever served on. She deserved a better end than this." } },
    spitelash = { { id = "tp_sl", text = "They sang before they struck. I still hear it in my sleep." } },
    _none = { { id = "tp_none", text = "Couldn't say. Ask me about knots or tides." } },
  },
}

---------------------------------------------------------------------------
-- Roland Geardabbler
---------------------------------------------------------------------------
P:NPC {
  key = "roland_geardabbler", id = TODO_NPC("Roland Geardabbler"), name = "Roland Geardabbler",
  bible = "bibles/horizon_scout.md", role = "scholar", tier = "quest",
  communities = { "ruined_reaches" }, temper = { "nervous", "cheerful" }, values = { "loyal", "inventive" },
  notices = { "gnome", "mage" },

  impression = {
    first = "He chatters cheerfully, as if stopping might break his ward.",
    third = "{name} met Roland Geardabbler, the gnome keeping the Horizon Scout's trapped crew alive at the bottom of the sea.",
  },

  greetings = {
    { id = "g_default", text = "Oh! A visitor! Don't mind the ward, it's perfectly safe, mostly, and do come in out of the water, so to speak." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Twice in one lifetime! The crew will be thrilled, or they would be if they weren't asleep." },
  },

  notice = {
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "A fellow gnome! At the bottom of the sea! If this were Gnomeregan I'd say we were having a perfectly ordinary day." },
    { id = "n_mage", cat = "mage", when = { class = "MAGE" },
      text = "A mage, oh, thank goodness. Would you look at my ward's lattice and tell me it's holding? I've been staring at it so long the runes have started looking back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Roland Geardabbler, passenger, tinkerer, part-time arcanist and now full-time air supply! When the ship went down, I threw up a water-breathing ward over everyone I could reach, and I've been holding it ever since, which is a wonderful exercise for the mind, though I'd not recommend it." },
        { id = "h_shandril", when = { heardLine = "shandril.h_default" },
          text = "Shandril sent you? Oh, that's lovely, tell her we're still here, still breathing and still bored. The crew have played every card game sailors know, and two I invented, and they've started cheating at those too." },
      },
      again = {
        { id = "h_again", text = "What else? Talk, please, talking helps me keep the runes straight." },
        { id = "h_again2", text = "Go on, go on, I'm listening, and holding, and listening." },
      },
      choices = {
        { text = "How long can you hold the ward?", next = "ward" },
        { text = "Why don't you just swim out?", next = "out" },
        { text = "What was aboard that the naga wanted?", next = "cargo" },
        { text = "Who's down here with you?", next = "crew" },
        { text = "Can't Gnomeregan's engineers do something?", next = "gnomer", when = { race = "Gnome" } },
        { text = "Hold on, Roland. I'll go.", next = "END" },
      },
    },

    ward = {
      lines = { { id = "wa_default", text = "As long as the gears in my head keep turning! Which is a funny thing to say, and not entirely a joke. I eat, I nap in tiny pieces, I hum, and the ward stays up, and I try very hard not to think about what happens when I sneeze." } },
      choices = {
        { text = "That's remarkable, Roland.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What happens when you sneeze?", next = "ward_sneeze" },
      },
    },
    ward_sneeze = {
      lines = { { id = "ws_default", text = "It flickers, and everyone holds their breath, and then it comes back, and the bosun says something very rude. It's happened twice. I've stopped eating pepper." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    out = {
      big = true,
      lines = { { id = "ou_default", text = "Because the naga circle the wreck, and the moment the ward leaves the ship, it'll be a great glowing sign that says 'snacks'. I could get myself out, perhaps, but not the crew, and I'm not leaving them. Some of them think I should go and fetch help, and they may be right." } },
      choices = {
        { text = "Stay with them. A crew doesn't abandon its own.", next = "out_end", fx = { align = { honor = 1 } } },
        { text = "Go. One saved is better than all lost.", next = "out_end", fx = { align = { honor = -1 } } },
        { text = "What will you do?", next = "out_end" },
      },
    },
    out_end = {
      lines = { { id = "oe_default", text = "I'll stay, I think, because I put the ward up, and you finish what you start, my mother always said. Well, she said it about soup, but it applies." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cargo = {
      lines = { { id = "ca_default", text = "I have theories! There's a lump of azsharite on the forward stair, which shouldn't be there, and I didn't bring it, and the crew swear they didn't either. That leaves the other passengers, and I've been too busy breathing for everyone to ask them." } },
      choices = {
        { text = "Which passenger, do you think?", next = "cargo_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cargo_who = {
      lines = { { id = "cw_default", text = "I don't like to accuse anyone, but the mage, Lindros, never once came to dinner, and he kept his trunk chained to his bunk. That's not proof of anything, of course; I chain my trunk too, but that's because my inventions try to get out." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    crew = {
      lines = { { id = "cr_default", text = "Four of the crew, all asleep at the moment, because sleeping uses less air, and a ship's cat called Biscuit who refuses to be impressed by anything. They're good folk, and they've been very patient with a gnome they'd barely spoken to before the sinking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnomer = {
      lines = { { id = "gn_default", text = "Gnomeregan's engineers are all in Ironforge, or still in Gnomeregan, which is worse, and none of them know I'm here. If you're ever in Tinker Town, do tell someone. I'd like to be rescued by a gnome, if I'm to be rescued at all." } },
      choices = { { text = "I'll tell them.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Wards, gears, and how much air four sailors need. Ask away!" } },
    horizon_scout = { { id = "tp_hs", text = "A fine ship! Well, a fine ship upside down at the moment." } },
    gnomeregan = { { id = "tp_gn", text = "Home, once. I try not to think about it while I'm concentrating." } },
    _none = { { id = "tp_none", text = "No idea! But if you work it out, come and tell me; I need the distraction." } },
  },
}
