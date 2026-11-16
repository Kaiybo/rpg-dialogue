-- Menethil Harbor's trades: the gryphon master, the gunsmith, the engineering-and-general-goods merchant, and the shady dealer upstairs.
-- Voices: bibles/menethil_shops.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC = P.TODO_NPC

-- Shellei Brondir: gryphon master of Menethil Harbor.
P:NPC {
  key = "wl_shellei", id = TODO_NPC("Shellei Brondir"), name = "Shellei Brondir",
  bible = "bibles/menethil_shops.md", role = "flightmaster", tier = "service",
  communities = { "menethil" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "mount" },

  impression = {
    first = "Shellei Brondir keeps the gryphons at Menethil Harbor and fights a losing battle against the damp in their feathers. She is brisk, practical and fond of her birds in a way she doesn't let show.",
    third = "{name} met Shellei Brondir, the gryphon master of Menethil Harbor.",
  },

  greetings = {
    { id = "g_default", text = "Looking for a gryphon out of this swamp? I can't blame you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and dry, which is more than I can say for my birds." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Please get down before you come any closer. The birds don't like strange mounts, and they like them even less when it's been raining." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      lines = {
        { id = "xro_default", text = "They would, and that's exactly why I keep a ledger of every rider. If the watch comes asking who flew out of Menethil in a hurry, I'll tell them true, so I'd rather you didn't give me cause." },
      },
      choices = {
        { text = "No cause from me, Shellei.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll make sure the ledger's wrong.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's the danger on the way?", next = "danger" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "I'll miss your conversation more, if you've any. Still, a spell won't show you the Wetlands in the morning with the mist on the marsh like milk, and I'd wager your teleport smells of singed hair." },
      },
      choices = {
        { text = "Some things are worth doing the long way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Life's too short to sit on a bird.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How do the gryphons take the damp?", next = "damp" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shellei Brondir, gryphon master of Menethil Harbor. My birds fly east over the mountains to Thelsamar and Ironforge, which is the only way out of the Wetlands that won't leave mud in your boots." },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds are waiting, and they don't wait patiently in the rain." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "How do the gryphons cope with the damp?", next = "damp" },
        { text = "Is it dangerous flying over the Wetlands?", next = "danger" },
        { text = "How did a human come to keep dwarven gryphons?", next = "human" },
        { text = "Your gryphons would make a fine getaway.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'll be teleporting soon. Will you miss my coin?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Thank you, Shellei.", next = "END" },
      },
    },

    damp = {
      lines = {
        { id = "da_default", text = "Badly, and they let me know about it every morning. Their feathers never fully dry here, so I brush them twice a day and keep braziers going in the roost, and they still sulk." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    danger = {
      lines = {
        { id = "dg_default", text = "Over Grim Batol it is, for the Dragonmaw keep red dragons there, so my birds go well around it. The Thandol Span is no picnic either, with Dark Iron raiders on the bridge, but the gryphons fly high and fast and don't stop to look." },
      },
      choices = {
        { text = "Someone should drive the Dragonmaw out.", next = "BACK", fx = { align = { order = 1 }, trait = { brave = 1 }, learn = { "dragonmaw" } } },
        { text = "Wise birds. Best to avoid a fight you can't win.", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 }, learn = { "dragonmaw" } } },
      },
    },

    human = {
      lines = {
        { id = "hu_default", text = "The same way anyone does, by working hard and not minding the bites. The dwarves taught me when Menethil needed more hands, and the birds decided I'd do, which is the only opinion that counts." },
      },
      choices = {
        { text = "The dwarves are generous teachers.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I grew up in Menethil, back when it was Lordaeron's harbor, and I've never wanted to leave it, damp and all." } },
    advice = { { id = "tp_ad", text = "Never feed a gryphon fish. They'll want it every day after." } },
    _none = { { id = "tp_none", text = "I can't help you with that, I'm afraid. Ask at the inn; Helbrek hears everything." } },
  },
}

-- Murndan Derth: dwarf gunsmith in Menethil Harbor.
P:NPC {
  key = "wl_murndan", id = TODO_NPC("Murndan Derth"), name = "Murndan Derth",
  bible = "bibles/menethil_shops.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "gruff" }, values = { "proud", "practical" },
  notices = { "class" },

  impression = {
    first = "Murndan Derth sells guns in Menethil Harbor and spends most of his day fighting rust. He thinks the Wetlands are the worst place in the world to keep a firearm, and he keeps a great many of them.",
    third = "{name} met Murndan Derth, a dwarf gunsmith in Menethil Harbor.",
  },

  greetings = {
    { id = "g_default", text = "Guns, an' shot for them, an' oil, for ye'll need plenty o' that in this swamp." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Is yer barrel still dry? I'll wager it isnae." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, wi' a proper eye for a long shot, I'd say. Let me see yer weapon, for I'll bet the damp's got intae the lock." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      lines = {
        { id = "xro_default", text = "Quieter? A gun's meant tae be loud, so every orc in the marsh knows a dwarf's havin' his say. If ye want quiet, buy a bow from somebody else, for I'll no' insult a good rifle by fittin' it wi' a muffle." },
      },
      choices = {
        { text = "Loud has its uses. Show me what you've got.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Loud gets you killed. Quiet gets the job done.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why a gun over a bow, then?", next = "bow" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Fire near my powder? Ye'll do no such thing! I'll fight the rust wi' oil an' rags like a proper smith, an' ye'll keep yer sparks ten paces from my counter." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Fire near my powder, from a gnome? I've heard how Gnomeregan went, an' I'll no' have Menethil go the same way. I'll fight the rust wi' oil an' rags, thank ye." },
      },
      choices = {
        { text = "Ten paces. Understood.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little warmth never hurt anyone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How do you keep anything dry here?", next = "dry" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Murndan Derth, gunsmith. I came out tae Menethil tae sell guns tae the garrison, an' I've spent every day since fightin' the rust, for this swamp's the wettest place a dwarf ever kept a rifle." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Murndan Derth, gunsmith, an' it's a relief tae see a proper dwarf in this soggy place. The humans here think a gun's a kind o' crossbow, an' I've given up explainin'." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Go on, I've a barrel tae clean." },
      },
      choices = {
        { text = "Let me see your guns.", next = "BUSINESS" },
        { text = "How do you keep a gun dry here?", next = "dry" },
        { text = "Why stay in the Wetlands, then?", next = "stay" },
        { text = "Is a gun better than a bow?", next = "bow" },
        { text = "A gun's too loud for my work. Got anything quieter?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could dry out your stock with a little fire.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Thanks, Murndan.", next = "END" },
      },
    },

    dry = {
      lines = {
        { id = "dr_default", text = "Ye don't, no' properly. Oil it every night, keep it wrapped in leather, an' never set it down on the ground, for the ground here's more water than mud." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    stay = {
      lines = {
        { id = "st_default", text = "Because the garrison needs guns, wi' the Dragonmaw so close an' the Dark Irons on the Thandol Span. A dwarf goes where he's needed, even when it means wet socks for the rest o' his life." },
      },
      choices = {
        { text = "That's real duty. I respect it.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1, learn = { "dragonmaw", "thandol_span" } } },
        { text = "I'd have left for somewhere drier.", next = "BACK", fx = { align = { honor = -1 }, learn = { "dragonmaw", "thandol_span" } } },
      },
    },

    bow = {
      lines = {
        { id = "bo_default", text = "Louder, which scares the beasts, an' harder-hittin', which finishes them. A bow's quieter an' it doesnae rust, I'll grant ye, so ye'll find the bowyers just along the street if ye want one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I made guns in the Great Forge for twenty years before the garrison here asked for a gunsmith, an' I've regretted sayin' yes every rainy day since." } },
    advice = { { id = "tp_ad", text = "Keep yer powder dry. It's the only advice that matters here." } },
    _none = { { id = "tp_none", text = "I don't know anythin' about that, an' I'm too wet tae care." } },
  },
}

-- Neal Allen: engineering supplies and general goods in Menethil Harbor.
P:NPC {
  key = "wl_neal", id = TODO_NPC("Neal Allen"), name = "Neal Allen",
  bible = "bibles/menethil_shops.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "steady" }, values = { "practical", "friendly" },
  notices = { "craft" },

  impression = {
    first = "Neal Allen sells engineering parts and general goods in Menethil Harbor, an odd mix that he says suits a harbor town perfectly. He keeps his blasting powder in sealed jars, and his patience in reserve for the gnomes.",
    third = "{name} met Neal Allen, who sells engineering supplies and general goods in Menethil Harbor.",
  },

  greetings = {
    { id = "g_default", text = "Bread or blasting powder? I sell both, and I keep them on separate shelves." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did that powder stay dry? I sealed the jar myself." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering" } },
      text = "An engineer! You'll want the powder in the sealed jars, not the open ones, unless you want it to fizzle in this damp." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      lines = {
        { id = "xro_default", text = "I stock the blasting kind for the gnomes, and you'd want the flash kind from somebody with a sharper smile than mine. I'll not ask what you're blowing up, so long as it isn't in Menethil." },
      },
      choices = {
        { text = "Nothing in Menethil. You have my word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Best you don't ask, then.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "How's business with the harbour?", next = "business" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Not a thing, I'm sorry to say; the reagent sellers keep to Ironforge and Stormwind. Though I'll tell you, the gnome mages through here came out of Gnomeregan with nothing, and they've learned to make do." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Not a thing, I'm sorry to say, though you'd know better than me how your people manage. Most of the gnomes through here came out of Gnomeregan with nothing, and they've learned to make do with what's on my shelves." },
      },
      choices = {
        { text = "Ironforge has what I need. I'll go properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll get by on my own wits, like they do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why sell here, of all places?", next = "why" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Neal Allen, engineering supplies and general goods. A harbor town needs a bit of everything, from rope and bread for the sailors to tubes and powder for the gnomes passing through." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "Neal Allen, engineering supplies and general goods, and I'm glad to see a gnome, for you're my best customers. I've got coarse powder and bronze tubes, if you're building something interesting." },
      },
      again = {
        { id = "h_again", text = "Anything else you need?" },
        { id = "h_again2", text = "Go on, I've got time." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Why sell engineering parts in a harbor town?", next = "why" },
        { text = "How does business go these days?", next = "business" },
        { text = "Where do the ships from here go?", next = "ships" },
        { text = "Do you stock blasting powder? Flash powder, even?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you sell anything for spellcasters?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Thanks, Neal.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because everyone who comes off a ship needs something, and gnomes come through on the way to Ironforge needing parts. I started with rope and bread, added powder when the gnomes asked, and now I've the oddest shop in the harbor." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    business = {
      lines = {
        { id = "bu_default", text = "Slow, with the Dragonmaw on the roads and the Dark Irons on the Thandol Span, but people still need bread. Lordaeron fell, and the Third Fleet lies drowned in the bay, and we're still here selling, which tells you something about Menethil folk." },
      },
      choices = {
        { text = "That's a stubborn sort of courage.", next = "BACK", fx = { align = { order = 1 }, affinity = 1, learn = { "dragonmaw" } } },
        { text = "Sounds like you should try somewhere else.", next = "BACK", fx = { align = { order = -1 }, learn = { "dragonmaw" } } },
      },
    },

    ships = {
      lines = {
        { id = "sh_default", text = "West across the sea to Auberdine in Darkshore, and south to Theramore in Dustwallow Marsh. The ships run regular, and you'll find the docks just past the inn." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came from Stormwind to Menethil to sell rope, and I never left, though I meant to." } },
    advice = { { id = "tp_ad", text = "Seal everything in this town. Bread, powder, letters, the lot." } },
    _none = { { id = "tp_none", text = "Can't say I know about that. Try Helbrek at the inn." } },
  },
}

-- Samor Festivus: Shady Dealer upstairs in the Deepwater Tavern; sells poisons and admits it.
P:NPC {
  key = "wl_samor", id = TODO_NPC("Samor Festivus"), name = "Samor Festivus",
  bible = "bibles/menethil_shops.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "sharp" }, values = { "cunning", "discreet" },
  notices = { "stealth" },

  impression = {
    first = "Samor Festivus sells poisons from a corner upstairs in the Deepwater Tavern and calls himself a shady dealer without a trace of embarrassment. He is polite, unhurried and very good at not answering questions.",
    third = "{name} met Samor Festivus, the shady dealer upstairs in Menethil's Deepwater Tavern.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in, and close the door behind you. The draft is bad for business." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, a professional. Sit down, and let's discuss your needs quietly." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I heard the third step creak, friend, so you can stop pretending you're not there. It's a good trick, but this tavern has old floorboards." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Samor Festivus, dealer in certain specialized goods. I'd tell you what they are, but if you need them, you already know, and if you don't, you're better off not asking." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "Samor Festivus, and you're the sort of customer I like, the kind who knows what they want and keeps it quiet. I've reagents for every poison you've been taught, and a few you haven't." },
      },
      again = {
        { id = "h_again", text = "Anything else? Softly, please." },
        { id = "h_again2", text = "Is there some other small matter I might help with, discreetly?" },
      },
      choices = {
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "You call yourself a shady dealer. Why?", next = "shady" },
        { text = "Who buys from you?", next = "who" },
        { text = "Does the garrison know you're up here?", next = "garrison" },
        { text = "I'll leave you be.", next = "END" },
      },
    },

    shady = {
      lines = {
        { id = "sh_default", text = "Because it's honest, and honesty is rare in my line of work, so I make a point of it. Everyone in Menethil knows what I sell, and nobody can say I lied to them about it." },
      },
      choices = {
        { text = "An honest poisoner. That's almost admirable.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Honesty about poison is still poison.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },

    who = {
      lines = {
        { id = "wh_default", text = "Rogues, mostly, and the occasional hunter who wants his arrows to bite harder. I don't ask what they do with it, and they don't ask where I get it, and that's a fine arrangement for everyone." },
      },
      choices = {
        { text = "Where do you get it?", next = "who_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_where = {
      lines = {
        { id = "ww_default", text = "Now, you see, that's exactly the question we agreed not to ask. Let's just say the Wetlands have many plants, and some of them aren't friendly." },
      },
      choices = { { text = "Fair enough.", next = "BACK" } },
    },

    garrison = {
      lines = {
        { id = "ga_default", text = "Of course they know, and they let me be, because half their scouts buy from me. Captain Stoutfist pretends I don't exist, which is the best kind of permission." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'd rather not discuss my past, friend. It's much less interesting than my present." } },
    advice = { { id = "tp_ad", text = "Never drink from a cup you didn't watch being poured." } },
    _none = { { id = "tp_none", text = "I'm afraid I know nothing about that, and I'm very good at knowing nothing." } },
  },
}
