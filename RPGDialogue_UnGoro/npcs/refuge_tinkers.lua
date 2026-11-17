-- Shizzle and Quixxil, two Cartel goblins on the Marshal Expedition's payroll at Marshal's Refuge.
-- Voice: bibles/refuge_tinkers.md. Neither gives a quest in Classic; their trades are authored.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "shizzle", id = TODO_NPC("Shizzle"), name = "Shizzle", title = "Marshal Expeditions",
  bible = "bibles/refuge_tinkers.md", role = "worker", tier = "service",
  communities = { "marshals_refuge" }, temper = { "eager", "restless" }, values = { "inventive", "profit" },
  notices = { "craft", "travel" },
  impression = {
    first = "Shizzle is a goblin tinker who means to fly out of Un'Goro on a machine he hasn't finished, and he's already selling seats on it. He studies the pterrordax overhead like a merchant studies a rival.",
    third = "{name} met Shizzle, a goblin tinker at Marshal's Refuge who dreams of flying out of the crater.",
  },

  greetings = {
    { id = "g_default", text = "Hey, pal, mind the wing struts, they're worth more than you are. No offence, it's just arithmetic." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer's back! Well, potential customer, but I'm an optimist, it's in the business plan." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Can't sleep either, pal? The raptors sing all night, and I do my best thinkin' when I'm scared." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Whoa, whoa, you've got grease under those nails, pal, the good kind. An engineer! Come look at my gear train, I'll only charge you a little for the privilege." },
    { id = "n_mount", cat = "travel", when = { mounted = true },
      text = "Nice ride, pal, but can it fly? No? Then we're not competitors, and I like you already." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Shizzle, tinker and visionary, contracted to Marshal Expeditions for repairs and keepin' the lamps lit. In my own time, pal, I'm building the first goblin flyer to ever leave this crater the fast way, which is up." },
        { id = "h_goblin", when = { race = "Goblin" },
          text = "Another goblin, out here? Sparks and sprockets, pal, either you're lost or you smell a profit, and I'd like to know which before we talk business." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome, great, here to tell me my wing ratio's wrong, I suppose. Go on, pal, everybody else has." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talk fast, I'm on the clock, technically." },
        { id = "h_again2", text = "Still here? Good, I've got more to sell you." },
      },
      choices = {
        { text = "You're building a flying machine?", next = "flyer" },
        { text = "Why not just take a flight from Gryfe?", next = "gryfe" },
        { text = "What do you actually do for the Marshals?", next = "job" },
        { text = "Let me look at your gear train.", next = "engineer", when = { profession = "Engineering" } },
        { text = "Spark says he wants a seat on your flyer.", next = "spark", when = { heardLine = "spark_nilminer.h_default" } },
        { text = "Good luck getting off the ground.", next = "END" },
      },
    },
    flyer = {
      lines = { { id = "f_default", text = "Frame's done, pal, the engine's mostly done, and the wings are where it all goes wrong. Canvas tears, leather sags, and every time I test it, it lands somewhere a devilsaur's already standing." } },
      choices = {
        { text = "What would make better wings?", next = "flyer_wings" },
        { text = "Has anyone been hurt testing it?", next = "flyer_hurt" },
      },
    },
    flyer_wings = {
      lines = { { id = "fw_default", text = "Pterrordax hide, pal, look up and you'll see a dozen of 'em, gliding all day without a single gear. Light, tough, waterproof, and somebody else's problem to collect, which is my favourite kind of material." } },
      choices = {
        { text = "So you'd skin them for your machine?", next = "flyer_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flyer_stance = {
      big = true,
      lines = { { id = "fs_default", text = "It's progress, pal, and progress always costs somebody somethin'. A flyer gets the scholars out before the next camp falls, and the pterrordax sure aren't using their hides for anything noble." } },
      choices = {
        { text = "Build it. Saving lives is worth a few hides.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The crater's beasts aren't spare parts for your gadget.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flyer_hurt = {
      lines = { { id = "fh_default", text = "Define hurt, pal. I lost my eyebrows on the second test and a boot on the fourth, and Nergal's cooking pot is still somewhere up a tree, but I'm walkin', and that's a successful trial in my line of work." } },
      choices = { { text = "Remind me never to buy a seat.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    gryfe = {
      lines = { { id = "g2_default", text = "Gryfe's a fine goblin and a fair flight master, pal, but his birds fly where the roads go, and his fares go one way, which is up. My flyer's gonna fly anywhere, and I'll set the price, which is the whole point." } },
      choices = { { text = "So it's about money, not escape.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    job = {
      lines = { { id = "j_default", text = "I fix whatever the crater breaks, pal: lamps, rifles, Karna's spare parts, the camp kettle. The Marshals pay late, but they pay, and that's more than I can say for my last three employers." } },
      choices = {
        { text = "You work with Karna?", next = "job_karna" },
        { text = "Something else.", next = "BACK" },
      },
    },
    job_karna = {
      lines = { { id = "jk_default", text = "Work near her, pal, which isn't the same. She builds a mechanical ape and sends it to live with real apes, and they call me reckless? I'd love a look at that mithril casing, though, I won't lie." } },
      choices = { { text = "Ask her nicely. She might show you.", next = "BACK", fx = { affinity = 1 } } },
    },
    engineer = {
      lines = { { id = "e_default", text = "See, pal, the gear train's fine, it's the coupling that shears when the wings flap hard. If you know a better alloy than what I scrounged from a broken rifle, I'm listening, and I'll take the advice on account." } },
      choices = {
        { text = "Mithril. Lighter and stronger than what you've got.", next = "BACK", fx = { affinity = 2 } },
        { text = "Honestly, I'd scrap it and start again.", next = "BACK", fx = { trait = { blunt = 1 } } },
      },
    },
    spark = {
      lines = { { id = "s_default", text = "Spark wants a seat, pal, Spark wants a discount, and Spark wants me to pretend he never called my flyer a flaming coffin. Two outta three, maybe, if he pays in advance." } },
      choices = { { text = "I'll tell him to start saving.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Tinker on contract, pal, Steamwheedle-trained and self-improved. One day I'll be the goblin who flew out of Un'Goro, and I'll charge for the story." } },
    advice = { { id = "tp_ad", text = "Always test somethin' new on a long rope, pal, and make sure you're holding the other end." } },
    _none = { { id = "tp_none", text = "No idea, pal, but if you find out, I'll buy the answer off you for a fair price, give or take." } },
  },
}

P:NPC {
  key = "quixxil", id = TODO_NPC("Quixxil"), name = "Quixxil", title = "Marshal Expeditions",
  bible = "bibles/refuge_tinkers.md", role = "worker", tier = "service",
  communities = { "marshals_refuge" }, temper = { "brisk", "jovial" }, values = { "profit", "practical" },
  notices = { "craft", "kin" },
  impression = {
    first = "Quixxil runs the Marshal Expedition's cook-pot and keeps its stores ledger, and he talks about raptor eggs the way bankers talk about gold. He feeds the camp, and he never lets anyone forget what it costs.",
    third = "{name} met Quixxil, the goblin who cooks and counts the stores at Marshal's Refuge.",
  },

  greetings = {
    { id = "g_default", text = "Hungry, pal? Everybody's hungry, and every bowl goes in the ledger, so don't look at me like that." },
    { id = "g_back", when = { metBefore = true }, text = "Back for seconds, pal? I've got stew, I've got eggs, and I've got a very long memory for who owes what." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "Early riser, pal? Good, you can stir while I count. The raptors are up too, so keep one eye on the ferns." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Thank the trade princes, pal, finally somebody in this crater who knows a skillet from a shield." },
    { id = "n_tauren", cat = "kin", when = { race = "Tauren" },
      text = "Whoa, pal, I'll save you the speech: no, there's no kodo in the stew, and Petra checks, so you can relax." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Quixxil, camp cook and stores-keeper for Marshal Expeditions, which means I feed everybody and I count everything they eat. It's a thankless job, pal, but it pays by the bowl, so I'm not complaining much." },
        { id = "h_goblin", when = { race = "Goblin" },
          text = "A goblin! Then you'll understand my ledger, pal, which makes you the only one in this camp who does." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, eh? Don't ask for ale, pal, the last barrel went to Larion, and he's been nursing it like a grudge ever since." },
      },
      again = {
        { id = "h_again", text = "What else, pal? The pot doesn't stir itself." },
        { id = "h_again2", text = "Go on, I'm listening, I'm just also counting." },
      },
      choices = {
        { text = "What's on the menu?", next = "menu" },
        { text = "How are the expedition's stores holding up?", next = "stores" },
        { text = "Anyone in camp eating poorly?", next = "spraggle" },
        { text = "Any recipes worth trading?", next = "recipe", when = { profession = "Cooking" } },
        { text = "Do you hunt the meat yourself?", next = "hunt", when = { class = { "HUNTER", "DRUID" } } },
        { text = "I'll leave you to your pot.", next = "END" },
      },
    },
    menu = {
      lines = { { id = "m_default", text = "Raptor eggs, mostly, pal, fried, boiled or scrambled, depending on how the egg feels about it. Some days there's stegodon, when somebody brave brings one in, and some days it's mushroom stew and complaints." } },
      choices = {
        { text = "Where do the eggs come from?", next = "menu_eggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    menu_eggs = {
      lines = { { id = "me_default", text = "Out of nests, pal, past the mothers, and the mothers have opinions. I pay a copper an egg, and so far the egg business has cost me two runners and one very good spoon." } },
      choices = {
        { text = "You're sending people to rob raptor nests?", next = "eggs_stance" },
        { text = "A copper an egg seems cheap.", next = "eggs_stance" },
      },
    },
    eggs_stance = {
      big = true,
      lines = { { id = "es_default", text = "Somebody's gotta keep the scholars fed, pal, and the raptors would eat us without a second thought. You want to tell me which one's the crime, the egg or the empty stomach?" } },
      choices = {
        { text = "A camp has to eat. Take what you need.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Pay your runners properly, or stop sending them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stores = {
      lines = { { id = "s_default", text = "Thin, pal, thin as a gnome's excuse. We lost two camps' worth of supplies when the beasts overran us, and Williden keeps promising a caravan from Gadgetzan that keeps getting eaten on the way." } },
      choices = {
        { text = "Eaten by what?", next = "stores_eaten" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stores_eaten = {
      lines = { { id = "se_default", text = "Pterrordax over the slope, pal, mostly, and once by Dadanga, though Petra swears it was just the turnips. I've put it in the ledger as acts of nature, and both of 'em count." } },
      choices = { { text = "Dadanga does look well fed.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    spraggle = {
      lines = { { id = "sp_default", text = "Spraggle, since Ringo went off toward the mountain, pal. She picks at her bowl and stares south, so I give her the best egg and don't write it down, and you didn't hear that from me." } },
      choices = { { text = "That's decent of you, Quixxil.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    recipe = {
      lines = { { id = "r_default", text = "Here's one for free, pal, which I never say: crack a raptor egg on a hot stone by the springs and it'll cook itself while you watch for its mother. Speed's the secret ingredient." } },
      choices = { { text = "I'll try it, carefully.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunt = {
      lines = { { id = "hu_default", text = "Me? With these arms, pal? I buy, I don't hunt. If you're bringin' in meat, I pay fair, well, fair-ish, and the scholars will love you for a week." } },
      choices = { { text = "I'll keep it in mind.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Cook and stores-keeper, pal, Steamwheedle stock. I've fed sailors, miners and now scholars, and scholars complain the most." } },
    advice = { { id = "tp_ad", text = "Never sign on anywhere without seeing the pantry first, pal. A camp's only as brave as its last meal." } },
    _none = { { id = "tp_none", text = "Couldn't say, pal. If it's not edible or billable, it's not my department." } },
  },
}
