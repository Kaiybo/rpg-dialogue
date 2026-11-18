-- Kargath's traders: Greth (stable master) and Sranda (light armor and weapons).
-- Voice: bibles/kargath_traders.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Greth, stable master
---------------------------------------------------------------------------
P:NPC {
  key = "greth", id = 10058, name = "Greth", title = "Stable Master",
  bible = "bibles/kargath_traders.md", role = "stablemaster", tier = "service",
  communities = { "kargath" }, temper = { "gruff", "steady" }, values = { "practical", "loyal" },
  notices = { "pet", "class" },

  impression = {
    first = "Greth keeps the stables at Kargath, out of the sun under a lean-to of hides and old timbers. He worries about water more than anything, and he measures every beast that comes in by how thirsty it looks.",
    third = "{name} met Greth, the stable master at Kargath.",
  },

  greetings = {
    { id = "g_default", text = "Bring the beast into the shade, and let it drink before you do, because out here the beast comes first." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and your beast's still alive, so you're doing something right." },
    { id = "g_noon", when = { timeOfDay = "day" }, text = "The sun's high, so keep the beast out of it, or you'll be carrying it home." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet}'s tongue is hanging out a mile, so let it at the trough before we say anything else." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and you'll want your beast kept cool while you're off in the canyons. I've got the shade for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Greth, and I keep the stables here at Kargath. There's not much water in the Badlands, so every drop goes to the beasts first and the grunts second, and the grunts complain about it." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, out here in the heat, and you'll know as well as I do what this sun does to a beast. Do you want it stabled, or brought out?" },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, and you're sweating like the rest of us, I see. Even the plains of Mulgore have more water than this place, so I'm told." },
      },
      again = {
        { id = "h_again", text = "What else? The trough needs filling." },
        { id = "h_again2", text = "Ask, then, but stay in the shade." },
      },
      choices = {
        { text = "I need to stable a beast.", next = "BUSINESS" },
        { text = "Where does Kargath get its water?", next = "water" },
        { text = "What's dangerous out there for a beast?", next = "wilds" },
        { text = "Do you think we should tame the wild things here?", next = "tame" },
        { text = "My beast never seems thirsty.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    water = {
      lines = { { id = "wa_default", text = "From a spring in the rocks behind the town, which runs slow and gets slower every summer, and from the barrels the wind riders bring up when they can spare the weight. Warlord Goretooth says we'll find more, and I say we'd better." } },
      choices = {
        { text = "What happens if the spring runs dry?", next = "water_dry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    water_dry = {
      big = true,
      lines = { { id = "wad_default", text = "Then the beasts go first, back to Orgrimmar, because I won't watch them die of thirst for the sake of a flag. The Warlord might keep the grunts here, but he'll be keeping them without wolves." } },
      choices = {
        { text = "The beasts come first. You're right, Greth.", next = "BACK", reply = "At least someone sees sense. The Warlord will curse me for it, but he can curse me from the back of a living wolf.", fx = { align = { light = 1 } } },
        { text = "The outpost comes first. The beasts can suffer with us.", next = "BACK", reply = "Then you can carry the grunts' packs yourself when the wolves drop, and we'll see how far you get.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wilds = {
      lines = { { id = "wi_default", text = "Buzzards, which won't attack a healthy beast but will follow a sick one for a day, waiting. Then there are the coyotes, which hunt in packs, and the basilisks in the hills, which turn a beast to stone if it looks at them too long." } },
      choices = {
        { text = "Turn it to stone?", next = "wilds_basilisk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wilds_basilisk = {
      lines = { { id = "wib_default", text = "Near enough, aye, they stiffen up and won't move for an hour, and in this sun an hour is a long time. Keep your beast's eyes down, if you can, and don't let it stare back." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK", fx = { trait = { patient = 1 } } } },
    },

    tame = {
      lines = { { id = "ta_default", text = "Some say the coyotes would make good hunting beasts, if anybody had the patience, and I've seen a hunter or two try it. The buzzards, though, I'd leave to the sky, because nobody wants a pet that's always waiting for them to die." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    xhunter = {
      lines = { { id = "xh_default", text = "Then it's hiding it, because every beast in the Badlands is thirsty all the time. Water it before you leave, and again when you stop, and you'll have it longer." } },
      choices = { { text = "Good advice. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I tended wolves for the Frostwolves once, a long time ago, before I came south. I miss the snow, some days, but the beasts here need me more." } },
    _none = { { id = "tp_none", text = "I know beasts and water, and not much else. Ask the Warlord." } },
  },
}

---------------------------------------------------------------------------
-- Sranda, light armor and weapons
---------------------------------------------------------------------------
P:NPC {
  key = "sranda", id = TODO_NPC("Sranda"), name = "Sranda", title = "Light Armor & Weapons Merchant",
  bible = "bibles/kargath_traders.md", role = "vendor", tier = "service",
  communities = { "kargath" }, temper = { "brisk", "sharp" }, values = { "practical", "ambitious" },
  notices = { "class", "kit" },

  impression = {
    first = "Sranda sells light armor and weapons at Kargath, and she sizes up every customer as though she's deciding whether they'll still be alive to come back. She's quick, dry and doesn't haggle.",
    third = "{name} met Sranda, who sells light armor and weapons at Kargath.",
  },

  greetings = {
    { id = "g_default", text = "Light armor, sharp weapons, and fair prices, so if you're here to haggle, go and haggle with the buzzards." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, which means the last thing I sold you did its job. Good." },
  },

  notice = {
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "All that plate, in this sun. Drink twice what you think you need, and don't say nobody warned you." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather yourself, by your hands. Then you know why I oil mine every morning out here." },
    { id = "n_rogue", cat = "class", when = { class = { "ROGUE", "HUNTER", "DRUID" } },
      text = "Leather, for you, and light, because in this heat you'll want to move. I've got just the thing." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That gear's falling apart, and the sun will finish it off if the Dark Irons don't. Let's see about replacing it." },
  },

  start = "hello",
  nodes = {
    kargath = {
      lines = {
        { id = "ka_default", text = "It's an outpost, not a market, and that suits me, because every soul here needs what I sell. Grawl has the general goods, Greth has the stables, and Shul'kar has the inn, so between us nobody leaves Kargath short." },
      },
      choices = {
        { text = "And the soldiers? Do they buy?", next = "kargath_force" },
        { text = "Why leave Orgrimmar for this?", next = "kargath_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kargath_force = {
      lines = {
        { id = "kf_default", text = "The scouts do. Razal'blade buys my soft leathers and complains I won't bargain, and Galamav wants bowstrings that don't dry out. Gargal buys nothing, because he thinks plate is a point of honour, and he sweats for it." },
      },
      choices = {
        { text = "Let me see what the scouts wear.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kargath_why = {
      lines = {
        { id = "kw_default", text = "In the Drag there were six of us selling the same jerkin and cutting each other's prices to the bone. Out here there's one of me, and a war next door. A merchant goes where she's needed, and I'm needed here." },
      },
      choices = {
        { text = "A sharp eye for an opening.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorge = {
      lines = {
        { id = "go_default", text = "A few every week, heading west through the pass with too much on their backs. I tell them all the same thing: the Gorge is hotter than here, the Dark Irons work slaves in the Cauldron, and nobody sells water past the gate." },
      },
      choices = {
        { text = "Do they listen?", next = "gorge_listen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorge_listen = {
      lines = {
        { id = "gl_default", text = "The ones who come back do. The Thorium Brotherhood keeps a camp up at Thorium Point, I hear, and they'll trade with anyone, so there's that much comfort if you get that far." },
      },
      choices = {
        { text = "Then I'll buy light before I go.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xh_default", text = "Then you want horn and sinew, not plain wood, and a string you wax every night. I keep the good ones wrapped in the cellar, because a bow left on the rack here cracks within the month." },
      },
      choices = {
        { text = "Bring one up from the cellar.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sranda, and I sell light armor and weapons, the kind that won't cook you inside it when the sun's at its height. The heavy plate's for fools in the Badlands, and I've buried a few of them." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue, and I've got daggers and leather for you, and I won't ask what you'll be doing with them. Just pay before you vanish." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "One of the Forsaken, and the heat doesn't bother you, I suppose, since you don't sweat. You still need armor, though, because the Dark Irons still have axes." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it quick; it's hot." },
        { id = "h_again2", text = "Go on, then. I'm listening." },
        { id = "h_again3", text = "Ask, then, but stand in the shade while you do it." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "What's the heat do to armor?", next = "heat" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "Why don't you haggle?", next = "haggle" },
        { text = "I need something quiet.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Kargath isn't much of a market.", next = "kargath" },
        { text = "You get travellers bound for the Searing Gorge.", next = "gorge" },
        { text = "I need a bow that survives this sun.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I'll be going.", next = "END" },
      },
    },

    heat = {
      lines = { { id = "he_default", text = "Cracks leather, warps the wood on a bow, and turns plate into an oven, so the grunts who wear it come back half cooked. I sell to the ones who learn that lesson early." } },
      choices = {
        { text = "How do you keep your stock from cracking?", next = "heat_stock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heat_stock = {
      lines = { { id = "hes_default", text = "Oil, shade and a cool cellar dug into the rock under the inn, which Shul'kar the innkeeper lets me use for a share of the profits. It's the coolest place in Kargath, and the leather likes it better than I do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    buyers = {
      lines = { { id = "bu_default", text = "Scouts, mostly, and the Expeditionary Force's runners, and anyone heading into the Searing Gorge who's got sense. Now and then a Forsaken comes through from the north and buys a dagger and looks at me like I'm the strange one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    haggle = {
      big = true,
      lines = { { id = "ha_default", text = "Because haggling's a game, and I've no time for games in a place where people die if they're slow. I set a fair price, and if you don't like it, there's no other merchant for a day in any direction." } },
      choices = {
        { text = "A fair price for everyone. That's honest trade.", next = "BACK", reply = "It is, and you'd be surprised how few people see it that way. Buy what you need and keep your coin for the road.", fx = { align = { honor = 1 } } },
        { text = "No other merchant? Then you could charge double.", next = "BACK", reply = "I could, and then nobody would trust my prices again. A fair price is how I stay in business when the road gets dangerous.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xrogue = {
      lines = { { id = "xr_default", text = "I've got leather that's been worked until it's soft as cloth, and a dagger with a blackened blade that won't catch the sun. Use them well, and come back alive so you can buy more." } },
      choices = { { text = "That's the plan. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sold armor in Orgrimmar's Drag before I came out here. The prices were better there, but the customers didn't need me as much." } },
    _none = { { id = "tp_none", text = "I sell armor and weapons, not news. Ask Shul'kar at the inn." } },
  },
}
