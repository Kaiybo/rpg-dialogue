-- Tinker Town's shops: engineering supplies, Springspindle's Gadgets, Berryfizz's Potions and Mixed Drinks.
-- Voices: bibles/tinker_town_shops.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC = P.TODO_NPC

-- Gearcutter Cogspinner: engineering supplies in Tinker Town; fussy about parts.
P:NPC {
  key = "if_gearcutter", id = TODO_NPC("Gearcutter Cogspinner"), name = "Gearcutter Cogspinner",
  bible = "bibles/tinker_town_shops.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "careful", "practical" },
  notices = { "craft" },

  impression = {
    first = "Gearcutter Cogspinner sells engineering parts in Tinker Town and knows every washer in his stock by size and temperament. He thinks most explosions are caused by cheap flux.",
    third = "{name} met Gearcutter Cogspinner, who sells engineering supplies in Tinker Town.",
  },

  greetings = {
    { id = "g_default", text = "Tubes, flux, blasting powder and spanners, all sorted by size, so please don't unsort them." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more parts? I hope the last lot went where they were meant to go, and not up." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering" } },
      text = "Singed eyebrows, if I'm not mistaken. Welcome, fellow engineer; you'll want the coarse powder, not the rough, whatever you used last time." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gearcutter Cogspinner, engineering supplies, and every part in this shop is tested twice before it's sold. If something of mine blows up, it's because you meant it to, and that's the only kind of explosion I'll stand behind." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a box of springs to count." },
        { id = "h_again2", text = "Next question, please." },
      },
      choices = {
        { text = "Let me see your parts.", next = "BUSINESS" },
        { text = "What does a new engineer need?", next = "need" },
        { text = "Where do your parts come from now?", next = "parts" },
        { text = "Is engineering really so dangerous?", next = "danger" },
        { text = "Thanks, Gearcutter.", next = "END" },
      },
    },

    need = {
      lines = {
        { id = "ne_default", text = "A blacksmith hammer, an arclight spanner, a steady hand and a great deal of copper. Springspindle will teach you the rest next door, though he'll talk about wheels a great deal longer than you'd like." },
      },
      choices = {
        { text = "What's wrong with wheels?", next = "need_wheels" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need_wheels = {
      lines = {
        { id = "nw_default", text = "Nothing at all, as far as I can tell, but Springspindle thinks he's going to replace them with something better. I sell him the parts and I don't ask what for, because the answer usually takes an afternoon." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    parts = {
      lines = {
        { id = "pa_default", text = "From the Great Forge, mostly, which makes good bronze but very silly bolts. In Gnomeregan we had our own foundries, but those are full of troggs and leper gnomes now, and nobody's going back for the machinery." },
      },
      choices = {
        { text = "Then someone should go and reclaim it.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "gnomeregan" } } },
        { text = "Better to start over than die for old machines.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 }, learn = { "gnomeregan" } } },
      },
    },

    danger = {
      lines = {
        { id = "da_default", text = "Only if you're careless, and most engineers are, at first. Measure your powder, keep your sleeves rolled and never light a fuse indoors, and you'll lose far fewer eyebrows than the rest." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sorted parts in the great workshops of Gnomeregan, and I sort them here, though the workshops were rather larger." } },
    advice = { { id = "tp_ad", text = "Label your powders. Black powder and pepper look much the same in a dark tunnel." } },
    _none = { { id = "tp_none", text = "That's not a part I stock, I'm afraid, or one I've ever heard of." } },
  },
}

-- Springspindle Fizzlegear: engineering trainer at Springspindle's Gadgets; certain the wheel is doomed.
P:NPC {
  key = "if_springspindle", id = TODO_NPC("Springspindle Fizzlegear"), name = "Springspindle Fizzlegear",
  bible = "bibles/tinker_town_shops.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "eager" }, values = { "inventive", "proud" },
  notices = { "craft" },

  impression = {
    first = "Springspindle Fizzlegear teaches engineering in his shop in Tinker Town and announces the end of the wheel to anyone who will listen. He is either a genius or a gnome who has stood too close to too many explosions, and possibly both.",
    third = "{name} met Springspindle Fizzlegear, who teaches engineering at Springspindle's Gadgets.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Springspindle's Gadgets, where tomorrow is invented today, or by Thursday at the latest!" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! I've made progress on the wheel problem since you left, though I've also made a hole in the ceiling." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering" } },
      text = "An engineer! I can tell from the soot. Have you thought about specializing yet, because I have strong opinions on the matter." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Springspindle Fizzlegear, engineer, inventor and future destroyer of the wheel. If my calculations hold, wheels will be completely out of date within a generation, and I'll be the reason." },
      },
      again = {
        { id = "h_again", text = "More questions? Excellent, I love questions." },
        { id = "h_again2", text = "What else can I explain to you, at length?" },
      },
      choices = {
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "What's wrong with the wheel?", next = "wheel" },
        { text = "What's the difference between gnomish and goblin engineering?", next = "spec" },
        { text = "Have you ever been hurt by an invention?", next = "hurt" },
        { text = "I studied tinkering in Gnomeregan as well.", next = "k_tinker", when = { origin = "gnome_tinker_apprentice" } },
        { text = "I'll let you get back to it.", next = "END" },
      },
    },

    wheel = {
      lines = {
        { id = "wh_default", text = "It's round, it goes in one direction, and it gets stuck in mud, which, if you think about it, is very limiting. I'm working on a set of mechanical legs that can climb a mountain and step over a trogg at the same time." },
      },
      choices = {
        { text = "How close are you?", next = "wheel_close" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wheel_close = {
      lines = {
        { id = "wc_default", text = "The legs work splendidly, but only one at a time, so at the moment the machine hops. It hops very well, I'll say that for it, and I'm treating the hopping as an advantage until I fix it." },
      },
      choices = {
        { text = "Every great invention starts with failures.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Maybe the wheel is good enough.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
      },
    },

    spec = {
      lines = {
        { id = "sp_default", text = "Gnomish engineering is precise and clever and only occasionally turns you into a chicken, while goblin engineering is mostly explosives with a price tag. If you choose the gnomish way, come to me, and if you choose the goblin way, you'll have to go to Gadgetzan and talk to Nixx Sprocketspring." },
      },
      choices = {
        { text = "A chicken? Truly?", next = "spec_chicken" },
        { text = "I'd choose the gnomish way.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd choose the goblin way. More explosions.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },
    spec_chicken = {
      lines = {
        { id = "sc_default", text = "Only very briefly, and only if the device misfires, which is hardly ever. I've been a chicken three times myself, and I'm none the worse for it, apart from a fondness for seeds." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hurt = {
      lines = {
        { id = "hu_default", text = "Hurt is a strong word, but I have lost both eyebrows, one boot and the use of my left ear for a week. My apprentice says I've also lost my sense of caution, but he's an apprentice, so what does he know?" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    k_tinker = {
      lines = {
        { id = "kt_default", text = "Then you'll know what we lost, all those workshops and half-finished machines. I keep telling myself we'll have the city back soon, and then I'll finish everything I left on the bench, the legs included." },
      },
      choices = {
        { text = "I'd like to help build the new machines.", next = "BACK", fx = { affinity = 2, learn = { "gnomeregan" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I designed pumps in Gnomeregan, and now I design legs, and someday I'll design something that does both." } },
    advice = { { id = "tp_ad", text = "Always keep a bucket of water near your workbench. Two, if you're working with powder." } },
    _none = { { id = "tp_none", text = "I'm sure I could invent something to do with that, but I don't know anything about it yet." } },
  },
}

-- Tally Berryfizz: alchemy trainer at Berryfizz's Potions and Mixed Drinks in Tinker Town.
P:NPC {
  key = "if_tally", id = TODO_NPC("Tally Berryfizz"), name = "Tally Berryfizz",
  bible = "bibles/tinker_town_shops.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "eager" }, values = { "curious", "friendly" },
  notices = { "craft" },

  impression = {
    first = "Tally Berryfizz teaches alchemy in a Tinker Town shop that sells both potions and mixed drinks, and insists she keeps them on separate shelves. She is cheerful, quick, and smells faintly of peppermint and sulfur.",
    third = "{name} met Tally Berryfizz, who teaches alchemy in Tinker Town.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Berryfizz's Potions and Mixed Drinks! Potions on the left, drinks on the right, and please don't mix them up." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did that last potion agree with you? I hope so, because it was meant to." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism" } },
      text = "Oh, you've got peacebloom in your pockets, I can smell it from here. An herbalist and an alchemist should be the best of friends, you know." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tally Berryfizz, alchemist! I teach anyone who wants to learn how to turn a handful of weeds into something that'll save their life, and I've never yet lost a student, or not for very long." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "Tally Berryfizz, alchemist, and I think you'll be good at this, being a druid. You already know which plants heal and which ones bite, so I only have to teach you the boiling part." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I've a kettle on." },
        { id = "h_again2", text = "Ask away, while the potion bubbles." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "Why sell potions and mixed drinks together?", next = "drinks" },
        { text = "Where can I find herbs near Ironforge?", next = "herbs" },
        { text = "What's the most useful potion?", next = "useful" },
        { text = "Goodbye, Tally.", next = "END" },
      },
    },

    drinks = {
      lines = {
        { id = "dr_default", text = "Because the dwarves wanted a drink and the adventurers wanted a potion, and I thought, why not both? The mixed drinks pay the rent, and the potions pay for the next experiment, so everybody wins." },
      },
      choices = {
        { text = "Has anyone mixed them up?", next = "drinks_mixed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drinks_mixed = {
      lines = {
        { id = "dm_default", text = "Only once, and he turned a lovely shade of blue for an afternoon, and now he only orders the blue drinks, so I think he enjoyed it. That's why the shelves are labeled in very large letters now." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    herbs = {
      lines = {
        { id = "he_default", text = "Peacebloom and silverleaf grow all over Dun Morogh, if you look under the snow by the roads. Earthroot likes rocky ground, so try near the hills, and if you go to Loch Modan, you'll find more around the lake." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    useful = {
      lines = {
        { id = "us_default", text = "A healing potion, every time, because a dead adventurer can't buy anything else from me. After that, I'd say a potion that lets you breathe underwater, since half of Azeroth seems to be lakes." },
      },
      choices = {
        { text = "I'd rather save my potions for my friends.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Potions are for me first. Friends can buy their own.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I mixed potions in Gnomeregan, before, and I mixed drinks in Gnomeregan too, just never in the same shop." } },
    advice = { { id = "tp_ad", text = "Stir clockwise, unless the recipe says otherwise. And if it smokes, step back." } },
    _none = { { id = "tp_none", text = "I don't know about that, sorry! Ask me about potions instead." } },
  },
}
