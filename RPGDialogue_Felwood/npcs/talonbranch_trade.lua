-- Talonbranch Glade's two shopkeepers: Malygen (general goods) and Mylini Frostmoon (weapons).
-- Voice: bibles/talonbranch_trade.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Malygen, General Goods
---------------------------------------------------------------------------
P:NPC {
  key = "malygen", id = TODO_NPC("Malygen"), name = "Malygen", title = "General Goods",
  bible = "bibles/talonbranch_trade.md", role = "vendor", tier = "service",
  communities = { "talonbranch" }, temper = { "steady", "warm" }, values = { "practical", "kind" },
  notices = { "race", "class" },

  impression = {
    first = "Malygen sells bread, bags and firewood at Talonbranch Glade, and every one of them has come a long way. He speaks of clean water the way other people speak of gold.",
    third = "{name} met Malygen, the night elf who keeps the general goods at Talonbranch Glade in northern Felwood.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Talonbranch, friend. Everything on my table came from outside Felwood, so it's safe to eat." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You're a long way from Bloodvenom, and the Sentinels here will be watching you. Buy what you need and keep your weapons sheathed." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, and still breathing. Felwood hasn't had you yet, then." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! You'll want something stronger than moonwell water, I expect, and I'm sorry to tell you I don't sell it." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Don't cook anything you kill in this forest, however hungry you get; buy your meat from me, even at my prices." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Malygen, and I keep the stores for Talonbranch Glade: bread, water, bags, flint and tinder, and a few recipes for anyone who can cook. It all comes up the road from Ashenvale or across from Darkshore, because nothing that grows in Felwood is fit to put in your mouth." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Circle? Then you know why I don't sell anything picked in this forest. The moonwell keeps our corner clean, but the rest of Felwood would poison a bear." },
      },
      again = {
        { id = "h_again", text = "Something else you need, friend?" },
        { id = "h_again2", text = "Ask away. Customers are rare enough up here." },
      },
      choices = {
        { text = "What's Talonbranch Glade like?", next = "glade" },
        { text = "How do you get supplies up here?", next = "supplies" },
        { text = "Is the forest food really so bad?", next = "food" },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Farewell, Malygen.", next = "END" },
      },
    },
    glade = {
      lines = {
        { id = "g_glade", text = "Small and stubborn, like most things kaldorei that are still standing in Felwood. We have the moonwell, a few Sentinels, Mishellena's hippogryphs and Golhine to teach the druids, and that's about all of us." },
      },
      choices = {
        { text = "Why hold a post here at all?", next = "glade_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glade_why = {
      big = true,
      lines = {
        { id = "gw_default", text = "Because if we left, the forest would forget it was ever ours, and so would we. Some in Darnassus say Felwood is lost and we should stop spending lives on it, and I understand them, but I don't agree." },
      },
      choices = {
        { text = "You're right to hold on. This land is worth it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Darnassus has a point. Spend your lives where they count.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies = {
      lines = {
        { id = "s_default", text = "Carts from Ashenvale when the road's clear, and hippogryphs when it isn't. The riders hate carrying flour sacks, so I pay them in sweet bread, which they eat on the way, so I order more flour." },
      },
      choices = {
        { text = "Is the road dangerous?", next = "road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "r_default", text = "Between the satyrs at Jadefire Run, the Deadwood and the beasts gone wrong in the woods, every cart that arrives feels like a small miracle. I've lost two drivers this year, and I knew both their families." },
      },
      choices = {
        { text = "I'm sorry. I'll watch the road when I travel it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    food = {
      lines = {
        { id = "f_default", text = "Worse. I've seen a Sentinel eat a handful of berries from beside the Bloodvenom River and spend three days seeing things that weren't there. The deer taste of rust, and the water tastes of nothing at all, which is somehow the most frightening part." },
      },
      choices = {
        { text = "Will it ever be clean again?", next = "food_clean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    food_clean = {
      big = true,
      lines = {
        { id = "fc_default", text = "The Emerald Circle believes so, and the druids at the sanctuary plant something new every day. I'll believe it when I can sell a Felwood apple without lying about where it came from." },
      },
      choices = {
        { text = "Have faith. The druids will mend it in time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Waiting won't fix it. Burn out the rot and replant.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_cc", text = "The Circle's druids buy half my bandages. I've stopped asking what they need them for." } },
    satyrs = { { id = "tp_sat", text = "They've taken Jadefire Run and they raid the road from there. I'd pay a good deal to never hear one laugh again." } },
    _none = { { id = "tp_none", text = "I sell bread, friend, not answers. Try the Sentinels." } },
  },
}

---------------------------------------------------------------------------
-- Mylini Frostmoon, Weapon Merchant
---------------------------------------------------------------------------
P:NPC {
  key = "mylini", id = TODO_NPC("Mylini Frostmoon"), name = "Mylini Frostmoon", title = "Weapon Merchant",
  bible = "bibles/talonbranch_trade.md", role = "vendor", tier = "service",
  communities = { "talonbranch" }, temper = { "proud", "sharp" }, values = { "craft", "brave" },
  notices = { "class" },

  impression = {
    first = "Mylini Frostmoon sells blades at Talonbranch Glade and judges a customer by the state of the weapon at their hip. She thinks Felwood is hard on steel and harder on the people holding it.",
    third = "{name} met Mylini Frostmoon, the sharp-eyed weapon merchant of Talonbranch Glade.",
  },

  greetings = {
    { id = "g_default", text = "Let me see your blade. No, really, let me see it; I can tell a lot about someone from their edge." },
    { id = "g_worn", when = { durability = { max = 0.3 } }, text = "Elune's mercy, what have you been hitting with that? Put it on the counter before it falls apart in your hand." },
    { id = "g_horde", when = { faction = "Horde" }, text = "I don't sell steel to the Horde, and I'd think twice before drawing yours in this glade. Move along." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, and you hold yourself like someone who's broken a few weapons in their time. That's good for my business and, I hope, bad for the satyrs." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You keep your hands where I can't see them, which I'll take as habit rather than intent. I sell daggers, if you're running short." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Mylini Frostmoon, and I sell swords, axes, maces and staves to whoever is brave or foolish enough to fight in this forest. I keep everything well oiled, because the damp in Felwood eats an edge in a week if you let it." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Most of you want bows from the glade's bowyers, but the beasts here don't always die from arrows, so you might want something for when they get close." },
      },
      again = {
        { id = "h_again", text = "Anything else, or shall I get back to my whetstone?" },
        { id = "h_again2", text = "Ask, then. The blades aren't going anywhere." },
      },
      choices = {
        { text = "Why does Felwood ruin steel?", next = "steel" },
        { text = "Who buys weapons out here?", next = "buyers" },
        { text = "What should I fight with here?", next = "advice" },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "I'll be going, Mylini.", next = "END" },
      },
    },
    steel = {
      lines = {
        { id = "s_default", text = "The water's tainted and so is the air, and both get into everything. A blade that's been through a few satyrs comes back stained green along the fuller, and you can scrub until your hands bleed and it won't come out." },
      },
      choices = {
        { text = "Is that stain dangerous?", next = "stain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stain = {
      big = true,
      lines = {
        { id = "st_default", text = "I don't know, and that's what bothers me. I've a sword in the back I won't sell because it's drunk so much fel blood it hums at night, and some would say I should melt it down, and others would pay me a fortune for it." },
      },
      choices = {
        { text = "Melt it down. Nothing good comes of fel steel.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A weapon that hums is still a weapon. Sell it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "Sentinels mostly, and adventurers on their way to Jaedenar, and the occasional dwarf who's lost his axe in a Deadwood and wants to go back for it. I sell the same steel to all of them and pray it's enough." },
      },
      choices = {
        { text = "Do many come back for more?", next = "buyers_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_back = {
      lines = {
        { id = "bb_default", text = "Some, with their blades notched and their faces older. The ones who don't come back I try not to count, because I'd stop selling to anyone if I did." },
      },
      choices = {
        { text = "I'll make sure to come back.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Something heavy for the corrupted beasts, because they don't feel pain the way they ought to, and something quick for the satyrs, because they're faster than they look. If you can only carry one, take the heavy one and duck." },
      },
      choices = {
        { text = "What about the furbolgs?", next = "advice_furbolg" },
        { text = "Something else.", next = "BACK" },
      },
    },
    advice_furbolg = {
      big = true,
      lines = {
        { id = "af_default", text = "The Deadwood fight like cornered bears, and they were people once, which some find hard. I tell my customers to strike fast and not think about it until afterwards, and some of them tell me I'm cold." },
      },
      choices = {
        { text = "You're not cold. Mercy is a quick death.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Every life deserves a thought, even a mad one's.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    satyrs = { { id = "tp_sat", text = "Fast and nasty, and their hides turn a cheap blade. Buy a good one." } },
    furbolgs = { { id = "tp_fb", text = "The Timbermaw are decent folk, I'm told. The Deadwood have blunted more of my blades than anything else in this forest." } },
    _none = { { id = "tp_none", text = "If it isn't about steel, I'm the wrong elf to ask." } },
  },
}
