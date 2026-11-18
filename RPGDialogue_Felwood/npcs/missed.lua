-- Felwood folk an earlier pass missed: Nalesette Wildbringer, who keeps the stables at Talonbranch Glade, and
-- Tenell Leafrunner of the Emerald Circle at the Emerald Sanctuary. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Nalesette Wildbringer: Stable Master, Talonbranch Glade.
P:NPC {
  key = "nalesette_wildbringer", id = TODO_NPC("Nalesette Wildbringer"), name = "Nalesette Wildbringer", title = "Stable Master", gender = "female",
  bible = "bibles/missed.md", role = "stablemaster", tier = "service",
  communities = { "talonbranch" }, temper = { "gentle", "watchful" }, values = { "nature", "protective" },
  notices = { "pet" },
  impression = {
    first = "Nalesette Wildbringer keeps the stables at Talonbranch Glade, the one place in Felwood where an animal can drink without sickening. She checks every beast's eyes and gums before she will take it in.",
    third = "{name} met Nalesette Wildbringer, the stable master at Talonbranch Glade in Felwood.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, {class}. If you have a beast with you, bring it to the moonwell first and let it drink clean water before anything else." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the glade. Tell me you kept your animals away from the green pools." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Let me look at {pet} a moment. The eyes are clear and the gums are pink, so the forest has not got into the blood, and I am glad of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Nalesette Wildbringer, and the beasts of Talonbranch are in my keeping. In any other forest that would be a quiet duty, but in Felwood I spend half my days turning away animals I can no longer help." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "I am Nalesette Wildbringer, and I keep the stables here. A hunter in Felwood must watch what a companion eats and drinks more closely than what it fights, and Kaerbrus will tell you the same." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of me?" },
        { id = "h_again2", text = "Speak, and I will listen while I work." },
      },
      choices = {
        { text = "What does the corruption do to animals?", next = "corrupt" },
        { text = "How do I keep a beast safe in this forest?", next = "safe" },
        { text = "Why is the glade untouched?", next = "glade" },
        { text = "Elune watch over your charges.", next = "END" },
      },
    },
    corrupt = {
      lines = { { id = "c_default", text = "It begins in the water. A bear drinks from a tainted stream, and within a season its coat sloughs, its eyes run green, and it attacks whatever moves, including its own cubs." } },
      choices = {
        { text = "Can a sick beast be cured?", next = "cure" },
        { text = "Let us speak of something else.", next = "BACK" },
      },
    },
    cure = {
      lines = { { id = "cu_default", text = "If it is caught in the first days, clean water and the druids' salves will sometimes draw the poison out. After that there is only one mercy left to give, and I have given it more often than I can bear to count." } },
      choices = { { text = "I'm sorry. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    safe = {
      lines = { { id = "s_default", text = "Carry your own water, and never let it drink from a pool that glows or steams. Feed it nothing you have killed here unless the flesh is red and smells as flesh should." } },
      choices = { { text = "I'll remember. Something else.", next = "BACK" } },
    },
    glade = {
      lines = { { id = "g_default", text = "The moonwell at its heart is still Elune's, and what flows from it keeps the ground clean for a little distance around. Golhine tends it, and I think it is the only thing in Felwood that he trusts." } },
      choices = { { text = "Let us speak of something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have cared for beasts since this forest was green. I stay because the ones that are left have nobody else." } },
    corruption = { { id = "tp_cor", text = "It is in the water and the soil, and it came with the demons. Keep your animals from both." } },
    _none = { { id = "tp_none", text = "I do not know. My concern is the beasts, and they have told me nothing of it." } },
  },
}

-- Tenell Leafrunner: Emerald Circle, Emerald Sanctuary.
P:NPC {
  key = "tenell_leafrunner", id = TODO_NPC("Tenell Leafrunner"), name = "Tenell Leafrunner", title = "Emerald Circle", gender = "male",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "emerald_sanctuary" }, temper = { "earnest", "steady" }, values = { "nature", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Tenell Leafrunner of the Emerald Circle stands at the Emerald Sanctuary with a ranger's pack still on his shoulders, as if he expects to be sent back into the trees within the hour. He has walked more of Felwood than most and likes none of it.",
    third = "{name} met Tenell Leafrunner of the Emerald Circle at the Emerald Sanctuary in Felwood.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. You are welcome at the Sanctuary whatever banner you carry, for the Circle asks only what you will do for the forest." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back out of the trees alive. Tell me what you saw, for every pair of eyes helps us." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, and welcome. You will feel the sickness here in your own bones, as I do, so do not stay long in the deep wood without coming back to clean ground." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the same taint the Shadow Council poured into this forest. The Circle will take your help, but understand that I shall be watching what you do with it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Tenell Leafrunner, of the Emerald Circle. I walk the paths between here and Jaedenar and bring back word of how far the corruption has crept, so that Eridan and the others know where their seeds and salves are needed most." } },
      again = {
        { id = "h_again", text = "What else would you know of the forest?" },
        { id = "h_again2", text = "Ask. I have a little while before I go out again." },
      },
      choices = {
        { text = "What is the Emerald Circle?", next = "circle" },
        { text = "How far has the corruption spread?", next = "spread" },
        { text = "You sound tired of this forest.", next = "tired" },
        { text = "Go safely, Tenell.", next = "END" },
      },
    },
    circle = {
      lines = { { id = "c_default", text = "A handful of druids and their friends, night elf and tauren together, who refuse to call Felwood lost. The Cenarion Circle gave us its blessing and little else, so we mend what we can with our own hands and whatever help the road brings." } },
      choices = {
        { text = "Elves and tauren work side by side here?", next = "together" },
        { text = "Another question.", next = "BACK" },
      },
    },
    together = {
      lines = { { id = "t_default", text = "Greta Mosshoof and I have dug the same poisoned earth with the same spades, and the forest did not ask either of us which city we came from. Whatever our peoples do elsewhere, I would trust her at my back before many of my own kin." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    spread = {
      lines = { { id = "s_default", text = "From Jaedenar outward in every direction, a little more each season. The Jadefire satyrs foul the wells in the south, the Shadow Council sits in the middle like a spider, and the furbolgs of the Deadwood have drunk enough of it to turn on their own.", fx = { learn = { "jaedenar" } } } },
      choices = {
        { text = "Is anything winning it back?", next = "back" },
        { text = "Another question.", next = "BACK" },
      },
    },
    back = {
      lines = { { id = "b_default", text = "Here and there, by a pace at a time. Maybess can cleanse a corrupted plant if someone will carry her salve to it, and each one that heals holds a little ground around it, which is slow work but the only kind that lasts." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
    tired = {
      lines = { { id = "ti_default", text = "I am tired of what was done to it, which is a different thing. I remember this wood before the Legion came, when it was only the southern reach of Ashenvale, and I walk it now so that somebody will remember where the streams ran clean." } },
      choices = { { text = "Another question.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A ranger of these woods before they were called Felwood, and a servant of the Emerald Circle now." } },
    jaedenar = { { id = "tp_jd", text = "The Shadow Council's den in the middle of the forest. The corruption spreads from it like rot from a wound." } },
    _none = { { id = "tp_none", text = "I cannot say. Ask Arathandris; she has more patience for questions than I have answers." } },
  },
}
