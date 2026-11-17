-- Everlook's three weapon masters, who train the blacksmiths' specialties and despise each other's weapons:
-- Kilram (axes; jungle troll), Seril Scourgebane (swords; human), Lilith the Lithe (hammers; Forsaken).
-- Voice: bibles/everlook_smiths.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kilram
---------------------------------------------------------------------------
P:NPC {
  key = "kilram", id = TODO_NPC("Kilram"), name = "Kilram",
  bible = "bibles/everlook_smiths.md", role = "blacksmith", tier = "quest",
  communities = { "everlook" }, temper = { "proud", "jovial" }, values = { "craft", "proud" },
  notices = { "troll", "smith" },

  impression = {
    first = "Kilram is a jungle troll axesmith in Everlook with a long scar down his face that he calls a love tap. He'll teach the way of the axe to any smith who can bring him vengeance.",
    third = "{name} met Kilram, the troll master axesmith of Everlook.",
  },

  greetings = {
    { id = "g_default", text = "I am Kilram, master of the axe. Da rest of dem just be sharpening sticks." },
    { id = "g_back", when = { metBefore = true }, text = "You be back, mon. Still got all your fingers? Good, you be needin' dem for da axe." },
    { id = "g_snake", when = { questActive = TODO_QUEST("Snakestone of the Shadow Huntress") }, text = "Vosh'gajin still be breathin' in Blackrock Spire. Every breath she take be one I owe her." },
    { id = "g_done", when = { questDone = TODO_QUEST("Snakestone of the Shadow Huntress") }, text = "Da shadow huntress be dead, and Kilram sleep good now. Knowledge be power, mon, and so be revenge." },
  },

  notice = {
    { id = "n_troll", cat = "troll", when = { race = "Troll" },
      text = "A troll! Ya know how it is, mon, to be far from da warm sea in all dis snow. Kilram's bones be complainin' every mornin'." },
    { id = "n_smith", cat = "smith", when = { profession = "Blacksmithing" },
      text = "Ya got da arms of a smith, mon. Ya already be thinkin' about da axe, Kilram can see it in your eyes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Kilram, master of da axe, and I teach da way of da axesmith to smiths who be worthy. Da axe be da oldest and da best of weapons, mon, and anybody who tell ya different be sellin' swords or hammers." },
        { id = "h_smith", when = { profession = "Blacksmithing", questBefore = TODO_QUEST("Snakestone of the Shadow Huntress") },
          text = "Ya want to learn da axe? Den ya do Kilram a favor first. Don't let her beauty fool ya; da shadow huntress Vosh'gajin be deadly and deranged, and she gave me dis scar. Ya can find her in Blackrock Spire." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Snakestone of the Shadow Huntress"), days = 3 } },
          text = "Her snakestone, in your hand! Knowledge be power, mon, and now I teach ya everything I know about da axe. Even da secret of Dawn's Edge, if ya be wantin' it." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Kilram be in a talkin' mood." },
        { id = "h_again2", text = "Ask, ask. Da forge be warm and da questions be free." },
      },
      choices = {
        { text = "How did you get that scar?", next = "scar" },
        { text = "Why is the axe the best weapon?", next = "axe" },
        { text = "What do you think of Seril and Lilith?", next = "rivals" },
        { text = "What does an axesmith learn?", next = "learn", when = { profession = "Blacksmithing" } },
        { text = "How does a troll end up in Everlook?", next = "everlook" },
        { text = "Later, Kilram.", next = "END" },
      },
    },
    scar = {
      lines = { { id = "sc_default", text = "Vosh'gajin, da shadow huntress, who serve da Blackrock orcs up in da Spire now. She gave me dis with her blade and called it a love tap, mon, and den she laughed. I been waitin' a long time for somebody to pay her back for dat laugh." } },
      choices = {
        { text = "Why not go yourself?", next = "scar_self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scar_self = {
      big = true,
      lines = { { id = "ss_default", text = "Kilram be a smith, not a fool. Da Spire be full of orcs and dragons, and Kilram would die on da first stair. So I trade what I know for what I want, and some say dat be cowardly, and some say dat be smart." } },
      choices = {
        { text = "A man should settle his own scores.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smart. Let others take the risk.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    axe = {
      lines = { { id = "ax_default", text = "Because da axe chop wood, chop meat and chop enemies, and a sword only be good for one of dose. My people been swingin' axes since before da first human learn to stand up, mon, and we still be here." } },
      choices = { { text = "Hard to argue with that.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    rivals = {
      lines = { { id = "ri_default", text = "Seril be a grumpy human who think a sword be da answer to everything, and Lilith be a dead woman who dance when she think nobody watchin'. We all teach in da same little town, and we all think da others be wrong, and it be da best fun Kilram have all year." } },
      choices = {
        { text = "Do you ever work together?", next = "rivals_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals_work = {
      lines = { { id = "rw_default", text = "Once, when Malyfous needed help with a big order for da Brotherhood. Seril sharpened, Lilith hammered, Kilram did da hard part, and we not talk for a month afterwards. Was a good month." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    learn = {
      lines = { { id = "le_default", text = "Da axesmith's plans, mon: great axes, war axes, and Dawn's Edge, which be da finest axe a mortal smith can make. But ya choose da axe, ya don't choose da sword or da hammer. Seril and Lilith won't teach ya after." } },
      choices = {
        { text = "I'll choose the axe.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I need to think about it.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    everlook = {
      lines = { { id = "ev_default", text = "Da goblins pay good, mon, and dey don't care what color your skin be. Kilram come north for one winter to make a fortune, and dat was a long time ago, and da fortune still be comin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Axes, mon. Axes and revenge." } },
    blackrock_spire = { { id = "tp_brs", text = "Vosh'gajin be up dere. Kill her for Kilram." } },
    _none = { { id = "tp_none", text = "Kilram don't know, mon. Ask da sword man, he think he know everything." } },
  },
}

---------------------------------------------------------------------------
-- Seril Scourgebane
---------------------------------------------------------------------------
P:NPC {
  key = "seril", id = TODO_NPC("Seril Scourgebane"), name = "Seril Scourgebane",
  bible = "bibles/everlook_smiths.md", role = "blacksmith", tier = "quest",
  communities = { "everlook" }, temper = { "cold", "blunt" }, values = { "craft", "stern" },
  notices = { "undead", "smith" },

  impression = {
    first = "Seril Scourgebane is a human swordsmith in Everlook who tells strangers to back off or be cut in half. He has his reasons for being short with people, and most of them come from Stratholme.",
    third = "{name} met Seril Scourgebane, Everlook's master swordsmith.",
  },

  greetings = {
    { id = "g_default", text = "Back off, or I'll cut you in half." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Stand there, then, but not closer." },
    { id = "g_corr", when = { questActive = TODO_QUEST("Corruption") }, text = "The Black Guard Swordsmith still stands in Stratholme. Until he falls, we have nothing to talk about." },
    { id = "g_done", when = { questDone = TODO_QUEST("Corruption") }, text = "You killed the Black Guard's smith. I don't thank people often, so remember this one." },
  },

  notice = {
    { id = "n_undead", cat = "undead", when = { race = "Scourge" },
      text = "Forsaken. I've killed a great many of your shape in Lordaeron, and I've not yet decided whether you're different. Keep your hands where I can see them." },
    { id = "n_smith", cat = "smith", when = { profession = "Blacksmithing" },
      text = "A smith. Good. Then you know a sword when you see one, which puts you ahead of most of this town." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Seril Scourgebane, and I train swordsmiths, if they're worth training. If I'm short with you, it's for a reason: the plans for the great blade Corruption have been stolen by the Black Guard, Baron Rivendare's own skeletal elite, and I'd like them back." },
        { id = "h_smith", when = { profession = "Blacksmithing", questBefore = TODO_QUEST("Corruption") },
          text = "You want to learn the sword. Then go to Stratholme, find the Black Guard Swordsmith, who guards those plans with his undeath, and kill him. Bring me the insignia of the Black Guard, and I'll train you." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Corruption"), days = 3 } },
          text = "The insignia. You actually did it. It should be obvious by now that a sword is always the best choice, so come here and let me show you what a real smith can do." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick." },
        { id = "h_again2", text = "Still here. Ask, then." },
      },
      choices = {
        { text = "Why do they call you Scourgebane?", next = "name" },
        { text = "What is the blade Corruption?", next = "corruption" },
        { text = "Why are swords the best?", next = "sword" },
        { text = "What do you think of Kilram and Lilith?", next = "rivals" },
        { text = "I've been to Stratholme.", next = "strat", when = { cleared = "Stratholme" } },
        { text = "I'm going.", next = "END" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "Because I earned it, in Lordaeron, when the plague came and my village came back from the dead. I cut my way out with a sword I'd forged myself, and I've been cutting the Scourge ever since, whenever my hands aren't busy at the anvil." } },
      choices = {
        { text = "Who did you lose?", next = "name_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_lost = {
      lines = { { id = "nl_default", text = "Everyone. I don't speak their names here; Everlook is full of goblins, and goblins put a price on everything they hear. Leave it there." } },
      choices = { { text = "I'll leave it.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    corruption = {
      lines = { { id = "co_default", text = "A great blade, black and heavy, forged with a craft the Black Guard should never have had. The plans were a smith's work, and the Scourge took them the way they took everything else in Lordaeron, and their swordsmith in Stratholme keeps them now." } },
      choices = {
        { text = "Why make a sword called Corruption?", next = "corruption_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corruption_name = {
      big = true,
      lines = { { id = "cn_default", text = "Because it's made to kill the corrupted, and because a name should warn the one it's pointed at. Some say a blade born of the Scourge's own craft will poison the hand that holds it. I say a sword is only steel, and steel goes where you swing it." } },
      choices = {
        { text = "Some craft is tainted. Leave it buried.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A weapon's a weapon. Use what works.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sword = {
      lines = { { id = "sw_default", text = "Because a sword asks something of the one who holds it. An axe is for chopping, and a hammer is for smashing, but a sword needs a mind behind it, and the ones who win with swords win because they thought faster." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rivals = {
      lines = { { id = "ri_default", text = "Kilram talks too much, and Lilith dances when she thinks I'm not looking, which is worse, because she's dead. They're both fine smiths, which I've never said aloud and never will again." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    strat = {
      lines = { { id = "st_default", text = "Then you've seen what the Baron has made of that city. I used to sell blades in its market. Now it's a slaughterhouse with a crown on top, and every soul that dies there gets up again to serve him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "new_plague" } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Swords. The Scourge. Little else worth knowing." } },
    scholomance = { { id = "tp_scholo", text = "A nest of necromancers. Burn it." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't care." } },
  },
}

---------------------------------------------------------------------------
-- Lilith the Lithe
---------------------------------------------------------------------------
P:NPC {
  key = "lilith", id = TODO_NPC("Lilith the Lithe"), name = "Lilith the Lithe",
  bible = "bibles/everlook_smiths.md", role = "blacksmith", tier = "quest",
  communities = { "everlook" }, temper = { "dry", "excitable" }, values = { "craft", "independent" },
  notices = { "close", "smith" },

  impression = {
    first = "Lilith the Lithe is a Forsaken hammersmith in Everlook with two hobbies: dancing, and threatening to kill people who stand too close. She's very good at both.",
    third = "{name} met Lilith the Lithe, the Forsaken master hammersmith of Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Don't get too close, {name}. I'm liable to fumble and bash your brains open with the face of my hammer." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. Same distance as before, please; I've measured it." },
    { id = "g_seren", when = { questActive = TODO_QUEST("Sweet Serenity") }, text = "The Crimson Hammersmith still has his apron, I take it. Off to the Bastion with you." },
    { id = "g_done", when = { questDone = TODO_QUEST("Sweet Serenity") }, text = "May you bash in many a brain, my dear. I mean that warmly." },
  },

  notice = {
    { id = "n_close", cat = "close", when = { race = { "Human", "Dwarf" } },
      text = "You smell very alive, darling. It's distracting, so take a step back." },
    { id = "n_smith", cat = "smith", when = { profession = "Blacksmithing" },
      text = "A smith! I can tell by the way you looked at my hammer before you looked at my face, and frankly I prefer it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lilith the Lithe, hammersmith, and the best you'll find this side of the grave or the other. Within the Scarlet Bastion lies sweet Serenity, a hammer whose recipe I'd very much like, and the Crimson Hammersmith guards it with his life, which is the thing you'd need to take." },
        { id = "h_smith", when = { profession = "Blacksmithing", questBefore = TODO_QUEST("Sweet Serenity") },
          text = "Defeat the Crimson Hammersmith in Stratholme and bring me his apron, and I shall train you to become a hammersmith. Understand this, though: once you choose the hammer, the paths of the sword and the axe are closed to you for good." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Sweet Serenity"), days = 3 } },
          text = "His apron! Still a little scorched, I see; the Crusade does love a fire. Come here, but not too close, and I'll teach you everything." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance! How lovely. Everlook doesn't care who you march for, and neither do I, though I do enjoy the way your sort flinch when I smile." },
      },
      again = {
        { id = "h_again", text = "Anything else, darling? I was about to dance." },
        { id = "h_again2", text = "Go on. I'll keep my hammer down while you ask." },
      },
      choices = {
        { text = "Why do you dance?", next = "dance" },
        { text = "Why do you want Serenity so badly?", next = "serenity" },
        { text = "Why the hammer over the sword or axe?", next = "hammer" },
        { text = "How does a Forsaken end up in Everlook?", next = "everlook" },
        { text = "Do you dance in Undercity too?", next = "uc", when = { race = "Scourge" } },
        { text = "I'll keep my distance.", next = "END" },
      },
    },
    dance = {
      lines = { { id = "da_default", text = "Because I can. When I first woke up in the grave, my legs wouldn't do anything but shuffle, and I spent a year teaching them to move properly again. Now they dance, and anyone who laughs gets the hammer, so nobody laughs." } },
      choices = {
        { text = "That's rather wonderful, Lilith.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    serenity = {
      lines = { { id = "se_default", text = "Because it's beautiful, darling, a hammer made by people who thought they were holy, and hit very hard because of it. The Scarlet Crusade burned half the people I knew in life, and I want their best hammer in the hands of a Forsaken smith, for the joke of it." } },
      choices = {
        { text = "Revenge, then?", next = "serenity_rev" },
        { text = "Something else.", next = "BACK" },
      },
    },
    serenity_rev = {
      big = true,
      lines = { { id = "sr_default", text = "Revenge, craft, spite, a little of each. The Crusade say we're abominations, and they kill us on sight, and they'd kill you too if you stood next to me long enough. Some of my people would have me forgive them, and I think those people are idiots." } },
      choices = {
        { text = "Take their hammer. They've earned it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Hate eats the hater. Make the hammer for its own sake.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammer = {
      lines = { { id = "ha_default", text = "Because a hammer doesn't care about your armor, darling, or your clever footwork, or your noble lineage. It simply arrives, and then everything underneath it is different. Seril's swords need thinking, and Kilram's axes need muscle, and my hammers need nothing at all but a good swing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    everlook = {
      lines = { { id = "ev_default", text = "The goblins don't ask what you are as long as you pay rent, and nobody in Everlook burns the dead. After Lordaeron, that's practically a paradise, even with the snow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    uc = {
      lines = { { id = "uc_default", text = "Never. The Apothecarium would want to measure my knees, and the Royal Guard would write me up for loitering. Down there everyone shuffles, darling, and I'd rather be cold up here than shuffle." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Hammers, dancing, and how close you're standing." } },
    scarlet_crusade = { { id = "tp_sc", text = "Burners of the dead. I'm collecting their hammers, one smith at a time." } },
    _none = { { id = "tp_none", text = "I haven't the faintest, darling. Ask the troll, he loves to talk." } },
  },
}
