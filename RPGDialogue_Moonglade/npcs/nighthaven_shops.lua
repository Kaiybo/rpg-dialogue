-- Nighthaven's shopkeepers: Kharedon (light armor), Meliri (weapons), My'lanna (food and drink)
-- and Darnall (tailoring supplies). Voice: bibles/nighthaven_shops.md
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Kharedon, Light Armor Merchant
---------------------------------------------------------------------------
P:NPC {
  key = "kharedon", id = TODO_NPC("Kharedon"), name = "Kharedon", title = "Light Armor Merchant",
  bible = "bibles/nighthaven_shops.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "dry", "gentle" }, values = { "craft", "patient" },
  notices = { "class", "level" },

  impression = {
    first = "Kharedon sells embroidered cloth and leather in Nighthaven, most of it sized for druids half my age who come up for their trials. He mends what you bring him and asks where it got torn.",
    third = "{name} met Kharedon, who sells light armor and does repairs for the young druids of Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in. If it's torn, I'll mend it, and if it's too small, I'm afraid that's all I stock." },
    { id = "g_worn", when = { durability = { max = 0.3 } }, text = "Elune's light, you look like you crawled here through a bramble. Let me see to that before it falls off you." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}? Let me guess: something needs stitching." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID", maxLevel = 20 },
      text = "Here for your trials? Then you'll want something that dries quickly after the lake; trust me, every young druid learns that the cold way." },
    { id = "n_high", cat = "level", when = { minLevel = 50 },
      text = "You're far past anything on my shelves, I'm afraid. But I can still mend what you're wearing, and I'll do it properly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kharedon, and I keep light armor for the Circle's visitors: embroidered robes, reinforced leather, a good cloak or two. Most of my customers are young druids who've come up for their first trials, so my stock runs small and sensible." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Circle. Leather's best for you, I think; it moves when you change shape, which cloth never quite forgives." },
      },
      again = {
        { id = "h_again", text = "Anything else? My needle's waiting." },
        { id = "h_again2", text = "Go on. I can stitch and talk at once." },
      },
      choices = {
        { text = "Why stock armor for the young?", next = "young" },
        { text = "What happens to armor when a druid shifts?", next = "shift" },
        { text = "Can you repair my gear?", next = "BUSINESS" },
        { text = "Farewell, Kharedon.", next = "END" },
      },
    },
    young = {
      lines = {
        { id = "y_default", text = "Because they're the ones who climb the path from Darnassus and Thunder Bluff, wide-eyed and badly dressed for the weather. The old druids come here too, but they've worn the same robes for three hundred years and won't hear of new ones." },
      },
      choices = {
        { text = "Do the young ones do well here?", next = "young_well" },
        { text = "Something else.", next = "BACK" },
      },
    },
    young_well = {
      big = true,
      lines = {
        { id = "yw_default", text = "Most do, and the ones who don't usually do the second time. I've seen a tauren calf come back from the lake in tears and walk out a week later with Dendrite's nod, and I gave her a cloak for free, which I'd ask you not to repeat." },
      },
      choices = {
        { text = "That was kind. Every young druid deserves help.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Coddling them won't make them stronger.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shift = {
      lines = {
        { id = "s_default", text = "It goes wherever the druid goes, somehow, and comes back when they do, and nobody in the Circle has ever explained it to me to my satisfaction. What I do know is that a bear tears seams that a night elf never would, so I double-stitch everything." },
      },
      choices = {
        { text = "Have you asked the druids how it works?", next = "shift_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shift_ask = {
      lines = {
        { id = "sa_default", text = "Once. Loganaar told me it was a matter of the spirit, not the body, and then he looked at my stitching for a long while and said I should keep doing whatever I was doing. I took it as a compliment and stopped asking." },
      },
      choices = {
        { text = "Wise of you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_cc", text = "They're very wise and very hard on their clothes." } },
    _none = { { id = "tp_none", text = "I know cloth and leather. For anything else, try the druids." } },
  },
}

---------------------------------------------------------------------------
-- Meliri, Weaponsmith
---------------------------------------------------------------------------
P:NPC {
  key = "meliri", id = TODO_NPC("Meliri"), name = "Meliri", title = "Weaponsmith",
  bible = "bibles/nighthaven_shops.md", role = "blacksmith", tier = "service",
  communities = { "nighthaven" }, temper = { "brisk", "wry" }, values = { "craft", "practical" },
  notices = { "class" },

  impression = {
    first = "Meliri sells swords and staves in Nighthaven, a village where the wardens forbid anyone to use them. She finds that funnier than the druids do.",
    third = "{name} met Meliri, the weaponsmith of Nighthaven in Moonglade.",
  },

  greetings = {
    { id = "g_default", text = "Weapons, repairs, sharpening. Just don't draw anything in the village, or the wardens will have words with both of us." },
    { id = "g_worn", when = { durability = { max = 0.3 } }, text = "That edge has seen better years. Put it on the anvil and let me look at it." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}. Still carrying my steel, I hope?" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } },
      text = "You're the first customer this week who looks as if you'd use a blade for something other than cutting bread. Welcome." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Meliri, and I keep the weapons for Nighthaven: swords, axes, maces, a dagger or two and a good staff for the druids. I'll repair anything you bring me, though I'd rather you didn't tell me what you used it on." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid? Most of you buy a staff, lean on it for a century, and never once hit anything with it. I'll sell you one anyway; it's good wood." },
      },
      again = {
        { id = "h_again", text = "Anything else? The forge doesn't watch itself." },
        { id = "h_again2", text = "Ask, then, while the iron heats." },
      },
      choices = {
        { text = "Who buys weapons in a peaceful village?", next = "peaceful" },
        { text = "Do the wardens trouble you?", next = "wardens" },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Farewell, Meliri.", next = "END" },
      },
    },
    peaceful = {
      lines = {
        { id = "p_default", text = "Travellers on the road to Felwood and Winterspring, mostly, who'd rather not meet a corrupted bear with an empty hand. Moonglade is peaceful; the roads out of it are another matter entirely." },
      },
      choices = {
        { text = "Does it bother you, selling weapons here?", next = "bother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bother = {
      big = true,
      lines = {
        { id = "b_default", text = "Sometimes, when I see a blade I made leave with someone I wouldn't trust with a kitchen knife. But a sword at someone's side keeps a good many fights from starting, and I've decided I'm in the business of keeping the peace, from a distance." },
      },
      choices = {
        { text = "A good blade in good hands keeps the peace.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Blades make fights. Don't fool yourself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wardens = {
      lines = {
        { id = "w_default", text = "Only when someone tries a sword out in the square, which happens oftener than the Keeper would like. The wardens are very good at stopping a fight before it starts, and very bad at believing me when I say I didn't sell it to them sharpened." },
      },
      choices = {
        { text = "I'll keep mine sheathed, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask me about steel, and I'll know. Anything else, and I'll guess, badly." } },
  },
}

---------------------------------------------------------------------------
-- My'lanna, Food and Drink
---------------------------------------------------------------------------
P:NPC {
  key = "mylanna", id = TODO_NPC("My'lanna"), name = "My'lanna", title = "Food & Drink",
  bible = "bibles/nighthaven_shops.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "warm", "chatty" }, values = { "generous", "kind" },
  notices = { "race", "weary" },

  impression = {
    first = "My'lanna feeds Nighthaven's visitors kaldorei cooking and moonberry juice, and she seems to take it personally if anyone leaves hungry. She knows everyone's favourite dish, including the Keeper's.",
    third = "{name} met My'lanna, who sells food and drink to the visitors of Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Hungry? You look hungry. Everybody who comes up the path looks hungry." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and you're thinner, I'm sure of it. Sit, sit." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Human" } },
      text = "You'll find our food lighter than you're used to, I expect. Eat two, then; nobody's counting." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "The tauren druids tell me my bread's too sweet. They still eat three loaves each, so I've stopped listening." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You've been in a fight, and a bad one. Eat first, and then go and see Kharedon or Meliri about the rest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm My'lanna, and I keep the food and drink for Nighthaven: kaldorei cooking, fresh bread, moonberry juice and cool water from springs the druids keep clean. Anyone who walks this far deserves a proper meal, Horde or Alliance or something in between." },
      },
      again = {
        { id = "h_again", text = "Something else? There's more bread if you're still hungry." },
        { id = "h_again2", text = "Ask away, dear, and take a roll while you do." },
      },
      choices = {
        { text = "What's kaldorei cooking like?", next = "cooking" },
        { text = "Who eats here besides travellers?", next = "who" },
        { text = "Let me buy something.", next = "BUSINESS" },
        { text = "Thank you, My'lanna.", next = "END" },
      },
    },
    cooking = {
      lines = {
        { id = "c_default", text = "Light and green, mostly: nuts, fruit, roots baked in leaves, and fish when the druids allow it. We don't cook much over open flame here; it upsets the wardens, and it upsets me more, because it's how you burn good bread." },
      },
      choices = {
        { text = "Do the druids eat meat?", next = "meat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat = {
      big = true,
      lines = {
        { id = "m_default", text = "Some do and some don't, and you'd be surprised how heated a dinner gets over it. A druid who spends half his life as a bear finds it hard to say no to fish, and a druid who spends it as a stag finds that hard to watch." },
      },
      choices = {
        { text = "Take only what you need from the wild.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A meal is a meal. Nature eats nature.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "The wardens, between watches, and the druids who'll admit they're hungry, which isn't all of them. Rabine sends his apprentices for bread every morning and swears it's for them, and they swear it's for him." },
      },
      choices = {
        { text = "And the Keeper?", next = "keeper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keeper = {
      lines = {
        { id = "k_default", text = "I've never once seen Keeper Remulos eat, and I've watched closely. But a basket of moonberries left by the path is always empty in the morning, and I've decided to believe that means he likes them." },
      },
      choices = {
        { text = "That's a charming thought.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_cc", text = "They feed the land, and I feed them. It seems a fair trade." } },
    _none = { { id = "tp_none", text = "I'm only the cook, dear. But eat something while you think of who to ask." } },
  },
}

---------------------------------------------------------------------------
-- Darnall, Tailoring Supplies
---------------------------------------------------------------------------
P:NPC {
  key = "darnall", id = TODO_NPC("Darnall"), name = "Darnall", title = "Tailoring Supplies",
  bible = "bibles/nighthaven_shops.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "fussy", "precise" }, values = { "craft", "careful" },
  notices = { "craft" },

  impression = {
    first = "Darnall sells thread and dyes in Nighthaven and holds strong opinions about both. He'll tell you which colours the moon approves of, if you let him.",
    third = "{name} met Darnall, the particular seller of tailoring supplies in Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Thread, dye, bleach, needles. Please don't touch the silks unless you mean to buy them." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and back with that same hem, I see. Never mind; I'll say nothing." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! At last, someone who'll appreciate the difference between my thread and the rubbish they sell in the cities." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Darnall, and I keep tailoring supplies for Nighthaven: threads of every weight, dyes in every colour the druids approve of, bleach for the ones they don't. Visitors forget how many robes a village of druids goes through." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, if you please; the dye's setting." },
        { id = "h_again2", text = "Yes? I'm listening, with half an ear." },
      },
      choices = {
        { text = "Which colours do the druids approve of?", next = "colours" },
        { text = "Why do druids need so many robes?", next = "robes" },
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Good day, Darnall.", next = "END" },
      },
    },
    colours = {
      lines = {
        { id = "c_default", text = "Greens and browns, of course, and a deep blue for the ones who walk at night, which is most of them. I once sold a young druid a bright red dye, and the elders looked at him as though he'd set fire to a tree." },
      },
      choices = {
        { text = "What happened to the young druid?", next = "red" },
        { text = "Something else.", next = "BACK" },
      },
    },
    red = {
      big = true,
      lines = {
        { id = "r_default", text = "He wore it anyway, all through his trials, and passed each one, and now the young druids all want red. I don't know whether I've done the Circle a great service or a great wrong, but I've sold a lot of red dye." },
      },
      choices = {
        { text = "Good for him. The young should find their own colours.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Traditions exist for reasons. Green suits a druid.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    robes = {
      lines = {
        { id = "ro_default", text = "Bear claws, swamp water, the lake trial, moonwell stains, and an astonishing amount of honey. A druid's robe lives a hard life, and I'm the one who has to sell them the thread to mend it." },
      },
      choices = {
        { text = "Why honey, of all things?", next = "honey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    honey = {
      lines = {
        { id = "h2_default", text = "Rabine rewards the young druids in bear shape with honey, and his apprentices always stand too close while he does it. I've stopped selling white thread to anyone who works for him." },
      },
      choices = {
        { text = "A sensible policy.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's not thread, dye or bleach, so it's not my business." } },
  },
}
