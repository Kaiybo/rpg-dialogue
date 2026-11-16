-- The Maclure Vineyards: Pa Maclure, who keeps the feud, and Joshua Maclure, who sells the drink.
-- Voice: bibles/maclures.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Pa Maclure: owner of the vineyard, head of the family, the reason Maybell meets Tommy Joe in secret.
P:NPC {
  key = "pa_maclure", id = TODO_NPC("Pa Maclure"), name = "Pa Maclure",
  bible = "bibles/maclures.md", role = "farmer", tier = "quest", communities = { "goldshire" },
  temper = { "stubborn" }, values = { "proud", "family" }, notices = { "stealth", "kin" },
  impression = {
    first = "Pa Maclure owns the vineyard, the house and, to hear him tell it, every opinion worth having on this side of the river. He looked at the Stonefield fields the way some men look at a storm cloud.",
    third = "{name} met Pa Maclure, head of the Maclure family, who will hear nothing good said of the Stonefields.",
  },
  greetings = {
    { id = "g_vines", text = "Mind the vines. They're older than you and worth more, most likely." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Not come from the Stonefield place, I hope." },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Who's that creeping in my rows? Show yourself! If a Stonefield sent you, you can creep right back." },
    { id = "n_human", cat = "kin", when = { origin = "human_westfall_farmhand" },
      text = "You've a farmer's hands, Westfall by the look of them. Then you know what land costs a family, and what it's worth keeping." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "This is the Maclure vineyard, and I'm Pa Maclure. My family's worked these vines longer than anyone in Goldshire can remember, and we'll work them long after." },
        { id = "h_young", tags = { "news" }, when = { questActive = TODO_QUEST("Young Lovers") },
          text = "Maybell's been mooning about the house all week, sighing at nothing. Girls her age do that, I'm told. You've not seen anything, have you?" },
        { id = "h_escape", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Escape"), days = 3 } },
          text = "Has anyone seen Maybell? Her ma says she's resting, and her door's shut, and I don't like a shut door in my own house." },
        { id = "h_goldtooth", when = { questDone = TODO_QUEST("Goldtooth") },
          text = "So it was a kobold took the Stonefield woman's necklace and not my Billy. I said so from the start. Nobody listens to a Maclure on that farm." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Late to be out among the vines. A man hears things in the rows at night, and none of them are honest." },
      },
      again = {
        { id = "h_again", text = "What else? I've vines to see to before dark." },
        { id = "h_again2", text = "Out with it. I've not got all day, and the grapes have even less." },
        { id = "h_again3", when = { questActive = TODO_QUEST("Young Lovers") }, text = "Well? You keep looking toward the river. There's nothing over there but Stonefields." },
      },
      choices = {
        { text = "What's the trouble with the Stonefields?", next = "feud" },
        { text = "How are the vines this year?", next = "vines" },
        { text = "Tell me about your children.", next = "children" },
        { text = "Seen the Defias up this way?", next = "defias", when = { any = { { questDone = TODO_QUEST("Brotherhood of Thieves") }, { class = "ROGUE" } } } },
        { text = "Good day, Mr. Maclure.", next = "END" },
      },
    },

    feud = {
      big = true,
      lines = {
        { id = "f_default", key = true, text = "Trouble? The Stonefields are the trouble, and they have been since before I was born. My father wouldn't speak to theirs, and his father before him, and I'll not be the Maclure who forgets." },
      },
      choices = {
        { text = "What started it?", next = "feud_start" },
        { text = "Old grudges should be buried, sir.", next = "feud_bury" },
        { text = "Family is family. I understand.", next = "BACK", fx = { align = { order = 1 }, affinity = 1, learn = { "maybell_tommy" } } },
        { text = "A grudge nobody remembers is just stubbornness.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, learn = { "maybell_tommy" } } },
      },
    },
    feud_start = {
      lines = { { id = "fs_default", text = "Doesn't matter what started it. It's how it's always been, and a man who changes how it's always been had better have a very good reason." } },
      choices = {
        { text = "So you don't know either.", next = "feud_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feud_know = {
      lines = { { id = "fk_default", text = "I know they're Stonefields and I'm a Maclure, and that's all the knowing I need. Gramma Stonefield could tell you her version, I expect, and every word of it would be wrong." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    feud_bury = {
      lines = {
        { id = "fb_default", text = "Buried? You don't know what you're asking. Mind your own affairs, stranger, and I'll mind mine, and the Stonefields can mind themselves on their own side of the fence." },
        { id = "fb_escape", when = { questDone = TODO_QUEST("The Escape") },
          text = "You say that like you know something. If you've been carrying notes for my daughter, stranger, I'd sooner not hear it from you, so don't make me ask." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = -1 } } },
    },

    vines = {
      lines = { { id = "v_default", text = "Good grapes and too few hands. Half of Elwynn's young folk have gone for soldiers or adventurers, and the other half want paying in coin I haven't got." } },
      choices = {
        { text = "Joshua sells the wine, doesn't he?", next = "vines_joshua" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vines_joshua = {
      lines = { { id = "vj_default", text = "He does, out front, and he's better at it than me. I'd tell a buyer what I thought of him, and Joshua just smiles and pours." } },
      choices = { { text = "A useful skill.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    children = {
      lines = {
        { id = "c_default", text = "Maybell's a good girl, quiet, helps her ma. Billy's a scamp who eats anything that isn't nailed down. They're Maclures, the both of them, and they'll keep this vineyard when I'm gone." },
      },
      choices = {
        { text = "Does Maybell want the vineyard?", next = "children_maybell" },
        { text = "Billy was blamed for a stolen necklace.", next = "children_billy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    children_maybell = {
      big = true,
      lines = { { id = "cm_default", text = "She'll want what's good for her, when she's old enough to see it. Some lad from a proper family, and no Stonefield, I can tell you that much for nothing." } },
      choices = {
        { text = "Maybe she should choose for herself.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, learn = { "maybell_tommy" } } },
        { text = "A father knows best for his daughter.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    children_billy = {
      lines = { { id = "cb_default", text = "Blamed by the Stonefields, you mean. My boy's no thief; he's only hungry, and there's a difference, though you'd not think so to hear that woman." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    defias = {
      lines = { { id = "d_default", text = "Thieves in red, cutting across the vineyard at night toward the Westfall road. I've a lantern and a stout stick, and they've not touched my grapes yet." } },
      choices = {
        { text = "A stick won't stop them.", next = "BACK", fx = { trait = { cautious = 1 }, learn = { "defias" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Maclures have kept this vineyard since before the orcs came, and after they'd gone we planted it again." } },
    advice = { { id = "tp_ad", text = "Know whose land you're standing on. Out here it matters more than you'd think." } },
    maybell_tommy = { { id = "tp_mt", text = "What's that? My Maybell and who? I'll not hear gossip about my own daughter, and I'll not hear that name.", next = "feud" } },
    defias = { { id = "tp_defias", text = "They cross my land at night. They'll not cross it with my grapes." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I'm not sure I want to. Ask in Goldshire." } },
  },
}

-- Joshua Maclure: vintner, selling drink outside the Maclure house near Pa.
P:NPC {
  key = "joshua_maclure", id = TODO_NPC("Joshua Maclure"), name = "Joshua Maclure", title = "Vintner",
  bible = "bibles/maclures.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "easygoing" }, values = { "practical", "family" }, notices = { "drink" },
  impression = {
    first = "Joshua Maclure sells the family's wine from outside the house, and he has a much easier manner than the man standing near him. He poured me a taste before I'd asked the price.",
    third = "{name} met Joshua Maclure, who sells drink at the Maclure Vineyards and smooths over what Pa says.",
  },
  greetings = {
    { id = "g_drink", text = "A drink for the road? The wine's ours and the water's from the well, and both are honest." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I'll take that as a compliment to the grapes." },
  },
  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy, friend. I'll sell you water, not wine, until you can find your way home without the fence's help." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Joshua Maclure. I sell what the vineyard makes, and a few things it doesn't, to whoever comes up the path. Don't mind Pa; he's sharper than he means to be." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! You'll want ale, and I've a little, though Pa says ale's for folk who can't wait on a grape. Don't tell him I stock it." },
        { id = "h_escape", when = { questDone = TODO_QUEST("The Escape") },
          text = "The house is very quiet this week, and Pa keeps asking questions nobody wants to answer. I sell wine and say nothing, which suits me fine." },
      },
      again = {
        { id = "h_again", text = "Anything else? Pa's watching, so I'd best look busy." },
        { id = "h_again2", text = "Go on, I've a moment before the next cart comes up." },
      },
      choices = {
        { text = "Let me see what you're selling.", next = "BUSINESS" },
        { text = "Is your Pa always like that?", next = "pa" },
        { text = "Who buys your wine?", next = "buyers" },
        { text = "Do you know about Maybell and Tommy Joe?", next = "secret", when = { questDone = TODO_QUEST("Young Lovers") } },
        { text = "Cheers.", next = "END" },
      },
    },
    pa = {
      lines = { { id = "p_default", text = "Always, about Stonefields. Ask him about grapes and he's the gentlest man in Elwynn, but mention the farm across the river and he goes red to the ears." } },
      choices = {
        { text = "And you? Do you hate the Stonefields?", next = "pa_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pa_you = {
      big = true,
      lines = { { id = "py_default", text = "I've never had cause to. Their boy Tommy Joe seems decent, but I'd never say that where Pa could hear it, and you didn't hear it from me either." } },
      choices = {
        { text = "Then say it to him one day.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Wise to keep the peace at home.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "Farley at the Lion's Pride takes a few casks, and travelers on the road take a bottle each. Goldshire drinks more than it admits to, I'll say that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "lions_pride" } } } },
    },
    secret = {
      lines = { { id = "s_default", text = "Know about it? I've watched Maybell slip out to the river every week for a year and covered for her twice, so don't let Pa hear you say their names together." } },
      choices = {
        { text = "Her secret's safe with me.", next = "BACK", fx = { affinity = 2, learn = { "maybell_tommy" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "maybell_tommy" } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born a Maclure, raised among the vines. I'd sooner sell wine than fight about it." } },
    advice = { { id = "tp_ad", text = "Taste before you buy, always. Any vintner who won't let you is hiding something." } },
    maybell_tommy = { { id = "tp_mt", text = "Not here, friend, not with Pa in earshot.", next = "secret" } },
    _none = { { id = "tp_none", text = "Couldn't say. I know grapes, and a little of what goes on in Goldshire." } },
  },
}
