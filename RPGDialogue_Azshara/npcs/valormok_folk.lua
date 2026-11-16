-- Valormok's camp hands (0.39.0): the food and drink seller and the weaponsmith.
-- Voice: bibles/azshara.md ("Valormok camp hands")
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "kurll", id = TODO_NPC("Kurll"), name = "Kurll", title = "Food & Drink",
  bible = "bibles/azshara.md", role = "vendor", tier = "service",
  communities = { "valormok" }, temper = { "stubborn" }, values = { "dutiful", "careful" },
  notices = { "drink" },

  impression = {
    first = "Kurll sells food and drink at Valormok, which in his camp means milk, fruit juice and no grog at all. He knows exactly how unpopular that makes him and doesn't care one bit.",
    third = "{name} met Kurll, the orc who sells food and drink at Valormok, and nothing stronger than milk.",
  },

  greetings = {
    { id = "g_default", text = "Bread, meat, milk and juice. If you're about to ask for grog, save your breath; everyone else has." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You didn't get that drunk on anything I sell, so somebody's smuggling. Don't tell me who, I'd only have to do something about it." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Cursed enough that I won't feed anything from it to my orcs. The fruit in those woods looks fine and the water looks clean, but the elves who lived here broke something deep, and I'm not betting a warrior's belly on whether it's mended. Everything I sell comes in by wind rider, and I'd rather pay for it than bury another orc." } },
      choices = {
        { text = "Keep your rules, Kurll. Discipline keeps this camp alive.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the warriors have their grog. They've earned it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, good, then you'll keep a clear head, which is more than I can say for the warriors who keep asking me for grog." },
        { id = "h_default", key = true,
          text = "Kurll, and I feed this camp. We're a handful of orcs at the edge of a cursed land with naga in the water and elves in the woods, so what we need is sharp eyes and full bellies, and that's what I sell." },
      },
      again = {
        { id = "h_again", text = "Anything else? The bread's going stale while we talk." },
        { id = "h_again2", text = "Ask, then. I've nothing better to do until supper." },
      },
      choices = {
        { text = "Is the land around Valormok as cursed as they say?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Why no grog in an orc camp?", next = "grog" },
        { text = "Where does your food come from?", next = "supply" },
        { text = "Goodbye.", next = "END" },
      },
    },
    grog = {
      lines = { { id = "gr_default", text = "Because a drunk sentry is a dead sentry, and this camp has buried enough orcs already. The elves at the Thalassian camp killed good warriors who never saw them coming, and I won't sell anything that makes that easier." } },
      choices = {
        { text = "Jediga won't thank you for it.", next = "grog_jediga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grog_jediga = {
      lines = { { id = "gj_default", text = "Jediga thanks nobody for anything, so I'm in good company. She can drink all she likes when she's back in Orgrimmar, and from what she says, that's all she ever thinks about." } },
      choices = {
        { text = "You're right. Sober camps survive.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Warriors have earned a drink.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      lines = { { id = "s_default", text = "The wind riders bring it from Orgrimmar, a sack or two at a time, and I don't waste a crumb. Kroum grumbles about carrying milk, but he's never once missed a delivery." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I came with the others when Belgrom Rockmaul sent us here. I feed people, and that's all there is to say about it." } },
    advice = { { id = "tp_ad", text = "Eat before you go out to fight in Azshara, because you won't find anything out there you'd want to eat." } },
    _none = { { id = "tp_none", text = "Don't know. Ask Ag'tor, he's the one who gives the orders." } },
  },
}

P:NPC {
  key = "gruul_darkblade", id = TODO_NPC("Gruul Darkblade"), name = "Gruul Darkblade", title = "Weaponsmith",
  bible = "bibles/azshara.md", role = "vendor", tier = "service",
  communities = { "valormok" }, temper = { "gruff" }, values = { "honor", "craft" },
  notices = { "class" },

  impression = {
    first = "Gruul Darkblade sells and mends weapons at Valormok and judges every warrior by the edge on their blade. He has a short temper and a long grudge against the Thalassian elves who killed his camp's warriors.",
    third = "{name} met Gruul Darkblade, the orc weaponsmith at Valormok.",
  },

  greetings = {
    { id = "g_default", text = "If you've come for a blade, you've come to the right orc, because Valormok needs fighters with sharp steel more than it needs anything else." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Let me see that edge before you go anywhere near the elves. A dull blade gets an orc killed in this place." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Daggers, eh? Fine, as long as you use them on the elves and not on anybody standing in this camp." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Nothing, shaman, not one good seam of ore in these cursed hills, so every bar I work comes in by wind rider. The old elves' stone lies everywhere, but it's soft and full of their magic, and I'll not forge with it. Give me honest iron from Durotar over anything an elf ever left lying about." } },
      choices = {
        { text = "Honest iron for an honest blade. I'd want no other.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Elf stone or iron, use whatever kills naga fastest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? Then you'll swing a mace or an axe with lightning behind it, and I'll make sure the edge is worth the lightning." },
        { id = "h_default", key = true,
          text = "Gruul Darkblade, weaponsmith for Valormok. Axes, swords, maces, whatever you swing, and I'll have it sharp before you go hunting elves or naga, because both of them are hunting us." },
      },
      again = {
        { id = "h_again", text = "Ask what you came to ask, and I'll keep the whetstone moving while you do." },
        { id = "h_again2", text = "Speak, but quickly. I have blades to finish." },
      },
      choices = {
        { text = "What does Azshara's earth give a weaponsmith, Gruul?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What happened to this camp's warriors?", next = "elves" },
        { text = "What's the best weapon against naga?", next = "naga" },
        { text = "Goodbye.", next = "END" },
      },
    },
    elves = {
      lines = { { id = "e_default", text = "The Thalassian elves came to us as friends, and Belgrom Rockmaul believed them. Then they turned on us, and good warriors died in these woods, and now Ag'tor wants the blood of the mage who led them." } },
      choices = {
        { text = "Does Ag'tor have a plan?", next = "elves_plan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_plan = {
      lines = { { id = "ep_default", text = "Ask him yourself; he'll tell you everything he wants done, and he'll pay you for it. I only know that every blade I sharpen is meant for those elves, and I sharpen them well." } },
      choices = {
        { text = "They'll pay for what they did.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Revenge just gets more orcs killed.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga = {
      lines = { { id = "n_default", text = "Something heavy that cracks scales, like a mace or a big axe. A sword will do, but it bounces off a naga's hide if you swing it like an elf, so swing it like an orc." },
        { id = "n_orc", when = { race = "Orc" }, text = "Something heavy, {g:brother|sister}, like a mace or a big axe that cracks scales. You know how to swing it, so swing it hard and keep swinging." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I make weapons. I've made them for longer than you've been alive, and I'll make them until I can't." } },
    advice = { { id = "tp_ad", text = "Never fight with a dull blade. Sharpen it every night, even if you don't think you need to." } },
    rimtori = { { id = "tp_rimtori", text = "The elf mage who led them. Ag'tor wants her head, and every blade on my rack is for that." } },
    _none = { { id = "tp_none", text = "I couldn't tell you; ask me about blades and I'll talk all night." } },
  },
}
