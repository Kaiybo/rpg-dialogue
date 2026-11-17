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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They can, though they'll complain the whole way to Thelsamar, and so would you if you had to fly in this damp. Sit still, lean forward over the mountains, and don't swing anything near their wings." } },
      choices = {
        { text = "I'll sit still and give the bird no trouble.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll fly the way I fight, hard and fast.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They mind everything in this swamp, from the damp to the murlocs to the red drakes over Grim Batol. A hunter's beast is one more thing to hiss at, though they hiss loudest at the cats." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} stays on the ground while you fly, and it'll be waiting when you land, as beasts always are." },
      },
      choices = {
        { text = "I'll keep my beast well clear of the roost.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My beast goes where I go. The birds will cope.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, is it? You'll be heavy, then, so I'll give you one of the stronger birds." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Good, then you'll know better than to let your beast near my birds." },
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
        { text = "Can your gryphons carry a warrior in full armor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your gryphons mind a hunter's beast, Shellei?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, for a warrior wi' a rifle can pull a Dragonmaw scout down off a ridge an' then go an' finish him wi' the axe. Just keep it oiled, for this swamp'll rust a barrel in a week if ye let it." } },
      choices = {
        { text = "I'll fight face to face. Guns are for others.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Shoot first, then the axe. That's sense, not cowardice.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Somethin' wi' a short barrel an' a good tight stock, for ye'll be shootin' raptors at close range in the reeds, no' rams on a mountainside. An' oil it every night, for the love o' Magni's beard, or it'll seize just as the raptor jumps." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Yer {pet} will need tae get used tae the bang, mind, for some beasts never do." },
      },
      choices = {
        { text = "I'll oil it every night, as you say.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll care for it my own way, thanks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll want an axe, no' a gun, but ye might want a gun for the times the axe cannae reach." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now there's a customer, for there's no dwarf hunter born who doesnae want a better rifle." },
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
        { text = "Should a warrior carry a gun, Murndan?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What rifle would you sell a hunter in this swamp?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Whetstones, rope, a spare waterskin, and now and then a stick of blasting powder for a door they'd rather not open. The gnomes tell me that's not what it's for, but it works, so I sell it." } },
      choices = {
        { text = "Rations and rope will do. I'll leave the powder.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sell me the powder. Doors are slow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Never enough, for every dwarf hunter in the garrison goes through a pouch a day on crocolisks and raptors. I've told Murndan to sell fewer guns, and he's told me to stock more shot, and we're both right." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And jerky for your {pet}, if it'll eat jerky, which most of them will, given half a chance." },
      },
      choices = {
        { text = "I'll buy only what I'll use, and leave some for others.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take your whole stock and sell it on dear.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, eh? You'll want rope and rations before blasting powder, I'd guess, though you'd be surprised what warriors buy." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? I keep shot and arrows in the back, and the dwarves buy the shot faster than I can stock it." },
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
        { text = "What do warriors usually buy from you, Neal?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you keep enough shot for the hunters here?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Now and then a warrior wanders up here by mistake, and I send him back down to the bar, for my goods are no use to a sword and shield. I find warriors prefer their fights loud and fair, which is admirable, and bad for business." } },
      choices = {
        { text = "A fair fight needs no poison.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A win is a win, however it's earned.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They ask whether my goods would work on an arrowhead, and I tell them I couldn't possibly say. What they do with that knowledge is their own affair, and none of mine." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} away from the jars, if you'd be so kind, for some of them smell like supper and none of them are." },
      },
      choices = {
        { text = "I'll keep my arrows clean, thank you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A tipped arrow brings a raptor down quicker.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Samor Festivus, dealer in certain specialized goods. I'd tell you what they are, but if you need them, you already know, and if you don't, you're better off not asking." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "Samor Festivus, and you're the sort of customer I like, the kind who knows what they want and keeps it quiet. I've reagents for every poison you've been taught, and a few you haven't." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You'll have no need of my goods, I imagine, though I've been surprised before." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. I've nothing for your beast, I'm afraid, though you might find something for your arrows elsewhere." },
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
        { text = "Do warriors ever buy from you, Samor?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters ever come up here looking for something?", next = "xhuntcl", when = { class = "HUNTER" } },
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
