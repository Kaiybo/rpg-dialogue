-- The Wetlands beyond Menethil: Dun Modr and Whelgar's Excavation. Voice: bibles/wetlands_roads.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "longbraid", id = TODO_NPC("Longbraid the Grim"), name = "Longbraid the Grim",
  bible = "bibles/wetlands_roads.md", role = "soldier", tier = "quest",
  communities = { "menethil" }, temper = { "gruff" }, values = { "loyal", "brave" },
  notices = { "race" },

  impression = {
    first = "Longbraid the Grim holds what's left of Dun Modr against the Dark Irons, and he has earned his name.",
    third = "{name} met Longbraid the Grim, who leads the dwarves clinging to the edge of Dun Modr.",
  },

  greetings = {
    { id = "g_modr", text = "Keep yer head down, stranger. The Dark Irons have archers on the walls, and they're better shots than they look." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathin'? Good. In Dun Modr that's a compliment." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Longbraid, they call me, and they add 'the Grim' because I've had little to smile about since the Dark Irons came. They broke the Thandol Span and took Dun Modr, and we hold on by our fingernails." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There's a face I'm glad to see, and there's no' many of those left round here. Come in out of the wet." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick; the walls have ears." },
        { id = "h_again2", text = "Speak yer piece, then, and dinnae waste my breath or yers." },
      },
      choices = {
        { text = "How did the Dark Irons take Dun Modr?", next = "fall" },
        { text = "What about the Thandol Span?", next = "span" },
        { text = "Why do they call you Grim?", next = "grim" },
        { text = "I'm a dwarf of Ironforge. Tell me how to help.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Hold fast, Longbraid.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "f_default", text = "They came out of the south in force, with powder and steel, and we were too few. Harlo Barnaby took an axe in the back covering the retreat, and he's lucky he lived." } },
      choices = {
        { text = "Why weren't you reinforced?", next = "fall_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fall_why = {
      lines = { { id = "fw_default", text = "Ironforge has a dozen fires to put out, and ours wasnae the biggest until it was too late. I'll no' curse the King for it, but I'll no' pretend it didnae hurt." } },
      choices = {
        { text = "The King should have come. Loyalty runs both ways.", next = "fall_end", fx = { align = { honor = -1 } } },
        { text = "You've held your post anyway. That's what matters.", next = "fall_end", fx = { align = { honor = 1 } } },
        { text = "What happens now?", next = "fall_end" },
      },
    },
    fall_end = {
      lines = { { id = "fe_default", text = "Now we take it back, a stone at a time if need be. Every Dark Iron ye put down out there is one less on my walls." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } } },
    },
    span = {
      lines = { { id = "s_default", text = "The great bridge into Arathi, or it was until the Dark Irons blew half of it into the gorge. Motley Garmason can tell ye more, for he's taken it to heart." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "thandol_span" } } } },
    },
    grim = {
      lines = { { id = "g_default", text = "Because I lost good dwarves on these walls, and I remember each one by name. I'll smile again when Dun Modr's ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Then ye already know, kinsman: go out there and fight. And when ye get back to Ironforge, tell them Longbraid still holds." } },
      choices = { { text = "I'll tell them.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I know Dark Irons and walls, and naught else these days." } },
  },
}

P:NPC {
  key = "motley_garmason", id = TODO_NPC("Motley Garmason"), name = "Motley Garmason",
  bible = "bibles/wetlands_roads.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "sharp" }, values = { "loyal" },
  notices = { "class" },

  impression = {
    first = "Motley Garmason camps near the Thandol Span and can't stop thinking about the Dark Irons who broke it.",
    third = "{name} met Motley Garmason, a dwarf of Dun Modr bent on avenging the Thandol Span.",
  },

  greetings = {
    { id = "g_span", text = "Ye've come up the road from Menethil? Then ye've seen what's left of the bridge, and ye know why I'm angry." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Motley Garmason, and I mean to see the Dark Irons pay for the Thandol Span. They blew it to cut us off from Arathi, and they're no' finished yet." },
        { id = "h_span", when = { questActive = TODO_QUEST("The Thandol Span") },
          text = "Go and see the Span for yerself, and find out what the Dark Irons left behind. They're bold enough to leave clues." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? I've a vengeance to plan." },
        { id = "h_again2", text = "Speak yer mind, friend." },
      },
      choices = {
        { text = "Why did they blow up the Span?", next = "why" },
        { text = "Do you have family here?", next = "family" },
        { text = "How does it look from Arathi's side?", next = "arathi" },
        { text = "I know demolitions. Who set the charges?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Good luck, Motley.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "To split Khaz Modan from the human lands, so Ironforge stands alone. Clever, and cruel, and just like them." } },
      choices = {
        { text = "What will you do about it?", next = "why_do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_do = {
      lines = { { id = "wd_default", text = "Find the ones who did it and send them back to Thaurissan in pieces. Or at least in chains, if Longbraid's watching." } },
      choices = {
        { text = "In chains. They should face the King's justice.", next = "why_end", fx = { align = { order = 1 } } },
        { text = "In pieces. They earned it.", next = "why_end", fx = { align = { order = -1 } } },
        { text = "You've thought about this a lot.", next = "why_end" },
      },
    },
    why_end = {
      lines = { { id = "we_default", text = "Every night since the bridge fell, aye. Help me and ye'll see it done right." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    family = {
      lines = { { id = "f_default", text = "My kin are scattered between here and Ironforge, those that are left. I don't speak of the rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    arathi = {
      lines = { { id = "a_default", text = "Orcs and trolls to the north, and Stromgarde's ruins beyond. Without the Span, we'd as well be on the moon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "thandol_span" } } } },
    },
    rogue = {
      lines = { { id = "r_default", text = "Dark Iron sappers, by the scorch marks, and good ones. If ye can read their work, ye'll be more use to me than ten soldiers." } },
      choices = { { text = "I'll take a look.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea, and I've no time to find out. Ask Longbraid." } },
  },
}

P:NPC {
  key = "ormer_ironbraid", id = TODO_NPC("Ormer Ironbraid"), name = "Ormer Ironbraid",
  bible = "bibles/wetlands_roads.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "proud" }, values = { "brave" },
  notices = { "class" },

  impression = {
    first = "Ormer Ironbraid guards Whelgar's Excavation from the raptors, and he holds a grudge against every one of them.",
    third = "{name} met Ormer Ironbraid at Whelgar's Excavation, a dwarf with a score to settle against the local raptors.",
  },

  greetings = {
    { id = "g_dig", text = "Watch the long grass, friend. If it moves and ye didnae move it, run." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ormer Ironbraid, and I keep the raptors off Whelgar's dig. They've taken diggers, mules and more lunches than I care to count." },
        { id = "h_revenge", when = { questActive = TODO_QUEST("Ormer's Revenge") },
          text = "The raptors round the dig need thinnin', and I want the big ones gone most of all. Do it for me, and do it for the lads they took." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep yer eyes on the grass while ye ask." },
        { id = "h_again2", text = "Go on, I'm listenin'." },
      },
      choices = {
        { text = "Why do you hate the raptors so?", next = "raptors" },
        { text = "What's Whelgar digging for?", next = "dig" },
        { text = "How do you fight them?", next = "fight" },
        { text = "Raptors are fine prey. I'll hunt them.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Good hunting, Ormer.", next = "END" },
      },
    },
    raptors = {
      lines = { { id = "r_default", text = "They took a friend of mine off the dig in broad daylight, while he was eatin' his bread. He never even screamed, and I'll hear that silence till I die." } },
      choices = {
        { text = "Is revenge worth it?", next = "raptors_rev" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raptors_rev = {
      lines = { { id = "rv_default", text = "Worth it? I dinnae know, but it's what I've got. Some say I should let it lie, and they werenae there." } },
      choices = {
        { text = "Vengeance won't bring him back. Guard the living instead.", next = "raptors_end", fx = { align = { light = 1 } } },
        { text = "He'd want the beasts dead. Make them pay.", next = "raptors_end", fx = { align = { light = -1 } } },
        { text = "What was his name?", next = "raptors_end" },
      },
    },
    raptors_end = {
      lines = { { id = "re_default", text = "Ye can ask, but I keep it to myself, for it's mine to carry. Help me with the raptors and that'll be enough." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dig = {
      lines = { { id = "d_default", text = "Old things in the earth, for the Explorers' League, and Whelgar won't say much more. Ask him yerself; he's near the caves." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    fight = {
      lines = { { id = "f_default", text = "Back to a wall and a shield up, for they come in pairs. Kill the first one fast, or the second one kills you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Then ye're welcome here, hunter, more than most. Bring me the claws of the biggest and I'll drink to yer name." } },
      choices = { { text = "Consider it done.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I couldnae tell ye. All I think about these days is raptors." } },
  },
}

P:NPC {
  key = "whelgar", id = TODO_NPC("Prospector Whelgar"), name = "Prospector Whelgar",
  bible = "bibles/wetlands_roads.md", role = "scholar", tier = "service",
  communities = { "menethil" }, temper = { "steady" }, values = { "curious" },
  notices = { "race" },

  impression = {
    first = "Prospector Whelgar runs the excavation that bears his name, and he cares more about what's under the mud than what's in the grass.",
    third = "{name} met Prospector Whelgar, who leads the Explorers' League dig in the Wetlands.",
  },

  greetings = {
    { id = "g_dig", text = "Careful where ye step, friend. Ye could be standin' on a thousand years of history." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Prospector Whelgar of the Explorers' League, and this is my excavation, raptors and all. The ground here hides more than mud, though it hides it under plenty of mud." },
      },
      again = {
        { id = "h_again", text = "What else? I've a trench to check." },
      },
      choices = {
        { text = "What have you found?", next = "finds" },
        { text = "Are the raptors a danger to the dig?", next = "raptors" },
        { text = "A gnome scholar would love to see this.", next = "gnome", when = { race = "Gnome" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    finds = {
      lines = { { id = "f_default", text = "Old dwarven stonework, older than Ironforge's records, and some say older still. The League wants it all catalogued before the Dark Irons come lookin'." } },
      choices = {
        { text = "The past should stay buried. Leave it be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "It belongs in Ironforge's halls, properly recorded.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    raptors = {
      lines = { { id = "r_default", text = "They're a nuisance, and Ormer takes them very personally. I let him, for he keeps my diggers alive." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Then tell them to come, for I've more stones than scholars. Mind the raptors on the way." } },
      choices = { { text = "I'll pass it on.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not my field, I'm afraid. Ask me about stones." } },
  },
}
