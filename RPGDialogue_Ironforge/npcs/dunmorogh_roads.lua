-- Dun Morogh between the towns: Amberstill Ranch, Steelgrill's Depot, the high snows.
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rudra_amberstill", id = TODO_NPC("Rudra Amberstill"), name = "Rudra Amberstill",
  bible = "bibles/dunmorogh_roads.md", role = "farmer", tier = "quest",
  communities = { "dunmorogh" }, temper = { "gruff" }, values = { "practical" },
  notices = { "class" },

  impression = {
    first = "Rudra Amberstill keeps the ram ranch east of Kharanos, and she counts her herd twice a day since the yeti came down.",
    third = "{name} met Rudra Amberstill, who runs the Amberstill Ranch and has a yeti problem.",
  },

  greetings = {
    { id = "g_ranch", text = "Mind the gate, and mind the dung while ye're at it. This is a workin' ranch, no' a sightseein' one." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The rams remember ye, which is more than I can say for most travellers." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, at night, an' the ram carried him halfway tae Kharanos before it threw him in a snowbank. If ye want tae help, track whatever's killin' my herd instead, for that's a quieter sort o' work that'd suit ye." } },
      choices = {
        { text = "I'll track the beast for you, Rudra. Your herd matters.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll track it, but a ram would make a fine payment.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every ram on the ranch jumped the fence at once, an' I spent three days fetchin' them from the hills. I don't doubt yer magic's useful, but out here we do things slow an' steady, the way rams like it." } },
      choices = {
        { text = "Slow and steady it is, Rudra. I'll respect the ranch.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rams will get used to magic sooner or later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rudra Amberstill, and these are the Amberstill rams, the finest mounts in Khaz Modan. Somethin' big's been comin' down from the hills to pick off my herd, and I've no' slept right in a week." },
        { id = "h_herd", when = { questActive = TODO_QUEST("Protecting the Herd") },
          text = "Vagash is up in the hills to the south, and every day he lives is another ram I lose. Go and put an end to him, {class}." },
        { id = "h_done", when = { questDone = TODO_QUEST("Protecting the Herd") },
          text = "There's the one who brought down Vagash! The rams are grazin' easy again, and so am I." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "If ye're thinkin' o' liftin' a ram, {g:lad|lass}, they bite, an' they bleat louder than any guard." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, an' I'll ask ye tae keep yer fire away from the rams. They've no' forgotten the last one who blinked in front o' them." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The feed won't spread itself." },
        { id = "h_again2", text = "Go on, ask. I can talk and fork hay at the same time." },
      },
      choices = {
        { text = "What's taking your rams?", next = "yeti" },
        { text = "Tell me about the rams themselves.", next = "rams" },
        { text = "How far is Kharanos from here?", next = "road" },
        { text = "A hunter could track your beast, Rudra.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Has anyone tried to steal your rams?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What happened when a mage blinked near your rams?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Good day to you.", next = "END" },
      },
    },
    yeti = {
      lines = { { id = "y_default", text = "A yeti called Vagash, big as a cart and twice as mean. He comes down off the slopes at night, takes a ram, and leaves nothin' but wool on the snow." } },
      choices = {
        { text = "Why not hire the Mountaineers?", next = "yeti_mtn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yeti_mtn = {
      lines = { { id = "ym_default", text = "The Mountaineers have troggs at Gnomeregan and Frostmane at every pass, so a farmer's yeti comes last. I don't blame them, but I'll no' sit and watch my herd thin either." } },
      choices = {
        { text = "Then the farmers should look after themselves.", next = "yeti_end", fx = { align = { order = -1 } } },
        { text = "The Mountaineers should answer to every dwarf, farmer or not.", next = "yeti_end", fx = { align = { order = 1 } } },
        { text = "What would you have me do?", next = "yeti_end" },
      },
    },
    yeti_end = {
      lines = { { id = "ye_default", text = "Bring me proof he's dead and I'll call ye a friend o' this ranch. That's worth more in Dun Morogh than ye'd think." } },
      choices = { { text = "Something else, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    rams = {
      lines = { { id = "r_default", text = "Bred for the snow and the mountain paths, with hooves like anvils and tempers to match. Veron sells them to the folk who've earned one, and every one starts here." } },
      choices = {
        { text = "Who's Veron?", next = "rams_veron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rams_veron = {
      lines = { { id = "rv_default", text = "Veron Amberstill, my kin, and he does the sellin' while I do the raisin'. He's got the easier half of the work and he'll tell ye otherwise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    road = {
      lines = { { id = "rd_default", text = "West along the road, past the Thunderbrew distillery and the brewery's stink. Keep goin' east instead and ye'll reach the tunnel into Loch Modan." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Aye, ye've the look of one who reads tracks. His prints go south into the hills, wide as a shield, and ye'll no' miss them." } },
      choices = { { text = "Leave it with me.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I raise rams, friend, and I know nothin' about that. Ask in Kharanos." } },
  },
}

P:NPC {
  key = "tundra_macgrann", id = TODO_NPC("Tundra MacGrann"), name = "Tundra MacGrann",
  bible = "bibles/dunmorogh_roads.md", role = "citizen", tier = "quest",
  communities = { "dunmorogh" }, temper = { "jovial" }, values = { "practical" },
  notices = { "race" },

  impression = {
    first = "Tundra MacGrann camps out in the snows of Dun Morogh, and a bear has run off with his food stash.",
    third = "{name} met Tundra MacGrann, a dwarf who lives rough in the snows and lost his stash to a bear.",
  },

  greetings = {
    { id = "g_snow", text = "Hullo there! Ye're the first face I've seen all week that wasnae covered in fur." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again! Come warm yer hands by the fire, such as it is." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because conjured bread is no' my bread, an' it's no' my brandy either. I've lived on these snows forty years, an' I'll eat what I stored, thank ye, once somebody gets it back from that black brute." } },
      choices = {
        { text = "I'll get your own stash back, Tundra. That's only right.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Food's food, Tundra. Conjured bread would save you the bother.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd trust a warlock as far as I'd trust a frozen pond, which is only as far as I've tested it. Ye'll have tae walk a bit further wi' me before I say more." } },
      choices = {
        { text = "Then I'll walk with you, and you'll see I'm sound.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Trust doesn't matter out here. Only survival does.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tundra MacGrann, at yer service, and I've lived in these snows longer than some o' the hills. I'd offer ye a bite, but a great black bear has made off with my whole stash." },
        { id = "h_stash", when = { questActive = TODO_QUEST("Tundra MacGrann's Stolen Stash") },
          text = "Ol' Sooty's the thief, and he's dragged my stash back to his den. Get it back for me and I'll sing yer praises to every rock in Dun Morogh." },
        { id = "h_done", when = { questDone = TODO_QUEST("Tundra MacGrann's Stolen Stash") },
          text = "My stash, back where it belongs! I've been eatin' like a king of Ironforge since, or at least like his cook." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage could warm these old bones, I'd wager, but I'd sooner ye found the bear that took my stash." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye've a warlock's look, an' the snow's gone grey where ye stood. I'll no' ask, if ye'll no' tell." },
      },
      again = {
        { id = "h_again", text = "Somethin' else on yer mind? I've nowhere to be." },
        { id = "h_again2", text = "Ask what ye like, lad; I've a fire goin' and nowhere better to be." },
      },
      choices = {
        { text = "A bear stole your food?", next = "bear" },
        { text = "Why live out here alone?", next = "life" },
        { text = "What's the danger in these hills?", next = "hills" },
        { text = "The cold doesn't trouble a gnome, you know.", next = "gnome", when = { race = "Gnome" } },
        { text = "Why not let a mage conjure you new food?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you trust a warlock out here in the snows?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Farewell, Tundra.", next = "END" },
      },
    },
    bear = {
      lines = { { id = "b_default", text = "Ol' Sooty, they call him, a black bear with a nose for cured meat and no shame at all. He took the lot while I was off fishin' at the lake." } },
      choices = {
        { text = "Where's his den?", next = "bear_den" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bear_den = {
      lines = { { id = "bd_default", text = "Up in the hills where the snow's deepest, and ye'll smell my sausages before ye see him. Mind his claws, for he's bigger than ye think." } },
      choices = {
        { text = "A thief's a thief. He'll pay for it.", next = "bear_end", fx = { align = { order = 1 } } },
        { text = "He's only a hungry bear. I'll just take it back.", next = "bear_end", fx = { align = { order = -1 } } },
        { text = "Anything else I should know?", next = "bear_end" },
      },
    },
    bear_end = {
      lines = { { id = "be_default", text = "Only that I want my stash more than I want revenge, so bring the food back first. A full belly's worth more than a bear's hide out here." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    life = {
      lines = { { id = "l_default", text = "Ironforge is all walls and hammers, and Kharanos is all gossip and ale. Out here it's just me and the wind, and the wind never asks me for coin." } },
      choices = {
        { text = "Don't you get lonely?", next = "life_lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life_lonely = {
      lines = { { id = "ll_default", text = "Now and then, which is why I'm talkin' yer ear off. I go down to Kharanos for a pint when the loneliness gets worse than the walkin'." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hills = {
      lines = { { id = "hl_default", text = "Wendigos in the caves and Frostmane trolls in the western hollows, and the wolves get bold in a hard winter. Keep yer back to a rock and yer fire lit, and ye'll do fine." } },
      choices = { { text = "Good advice. Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Ha! Then ye've more sense than most of my kin, who complain about it with every step. Ye'll be from Gnomeregan, then, and I'm sorry about what happened there." } },
      choices = { { text = "Thank you. We'll take it back one day.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea, friend, and I've had a lot of quiet hours to think about it." } },
  },
}

P:NPC {
  key = "pilot_bellowfiz", id = TODO_NPC("Pilot Bellowfiz"), name = "Pilot Bellowfiz",
  bible = "bibles/dunmorogh_roads.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh" }, temper = { "eager" }, values = { "practical" },
  notices = { "race" },

  impression = {
    first = "Pilot Bellowfiz waits at Steelgrill's Depot for his flying machine to be fuelled and fed, and he talks fast about both.",
    third = "{name} met Pilot Bellowfiz at Steelgrill's Depot, a gnome pilot hungry for his next flight.",
  },

  greetings = {
    { id = "g_depot", text = "Oh, hello! Don't touch anything shiny, it's either hot or about to be." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Wonderful, I've thought of three more things I need." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A troll, once, at Steelgrill's Depot, which was a very long and loud trip. I've fitted a lock since, but I suspect a clever rogue could open it, so I'm trusting you to be a nice rogue." } },
      choices = {
        { text = "I'm a nice rogue, Pilot. Your flier is safe with me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your lock's the weak point, Pilot. I'd fix it soon.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In theory, yes, and in practice, the last gnome who tried it ended up on the roof of Steelgrill's Depot. Gnomeregan was full of magic and machinery working together, and I miss that more than I miss my workshop." } },
      choices = {
        { text = "Then we'll build it carefully, with safety measures first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's test it right now. Theory is for cowards.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Pilot Bellowfiz, aviator, at your service! I'm stocking my flier for a long trip, and the depot's larder is emptier than a kobold's head." },
        { id = "h_jet", when = { questActive = TODO_QUEST("Stocking Jetsteam") },
          text = "Bear meat, boar meat and a bit of thick hide, that's what Jetsteam needs! Well, that's what I need, but Jetsteam needs me fed." },
        { id = "h_done", when = { questDone = TODO_QUEST("Stocking Jetsteam") },
          text = "Jetsteam's fully stocked, thanks to you! I'll name a loop-the-loop after you, if I survive it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A sneaky sort! You'd make a terrible stowaway, though, because my flier only seats one and I'd notice the extra weight." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've always wondered whether arcane power could drive a flier, and I'd very much like you to tell me it can." },
      },
      again = {
        { id = "h_again", text = "Something else? Quickly, quickly, the engine's warm!" },
        { id = "h_again2", text = "Ask away, I've got a moment while the pressure builds." },
      },
      choices = {
        { text = "What's Jetsteam?", next = "jet" },
        { text = "What is this depot for?", next = "depot" },
        { text = "Who else works out here?", next = "people" },
        { text = "A fellow gnome! Where are you flying?", next = "gnome", when = { race = "Gnome" } },
        { text = "Have you had stowaways on your flier before?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could arcane magic really power a flying machine?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Safe flying.", next = "END" },
      },
    },
    jet = {
      lines = { { id = "j_default", text = "My flying machine, and the finest one this side of Ironforge! She runs on steam and good luck, and I make sure there's plenty of both." } },
      choices = {
        { text = "Is it safe?", next = "jet_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jet_safe = {
      lines = { { id = "js_default", text = "Safe is a strong word, and I prefer 'thrilling.' I've only crashed her twice, and both times the ground was in the wrong place." } },
      choices = {
        { text = "Machines like that should be inspected before they fly.", next = "jet_end", fx = { align = { order = 1 } } },
        { text = "Fly first and fix it after. That's the spirit!", next = "jet_end", fx = { align = { order = -1 } } },
        { text = "And the third time?", next = "jet_end" },
      },
    },
    jet_end = {
      lines = { { id = "je_default", text = "The third time will be a triumph, mark my words! Bring me those supplies and you can watch from a very safe distance." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    depot = {
      lines = { { id = "d_default", text = "Steelgrill's Depot is where the gnomes who left Gnomeregan keep their tools and their hope. Tinkerers come and go, and the Mountaineers watch the road for troggs." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },
    people = {
      lines = { { id = "p_default", text = "Pilot Stonegear's here, if you can get a word in past his moustache, and Razzle Sprysprocket was tinkering out east. Everyone's busy fixing something or blowing it up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Wherever the wind wants, cousin! After Gnomeregan, I'd rather be up in the sky than under a mountain, and I don't think I'm the only one." } },
      choices = { { text = "I understand that. Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Hmm, not my field. My field is the sky, and that's not in it." } },
  },
}

P:NPC {
  key = "hegnar_rumbleshot", id = TODO_NPC("Hegnar Rumbleshot"), name = "Hegnar Rumbleshot",
  bible = "bibles/dunmorogh_roads.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "gruff" }, values = { "proud" },
  notices = { "class" },

  impression = {
    first = "Hegnar Rumbleshot sells guns from a camp by the road, and he talks about them like other dwarves talk about ale.",
    third = "{name} met Hegnar Rumbleshot, a gunsmith who keeps camp along the Dun Morogh road.",
  },

  greetings = {
    { id = "g_camp", text = "Lookin' for a gun? Ye've come to the right dwarf, and ye'll no' find a better one between here and Ironforge." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than ye'd think, for a pistol's a fine thing tae have when the dagger misses. I'll sell ye one, but if I hear it was used on an honest dwarf, I'll come lookin', an' I'm a very good shot." } },
      choices = {
        { text = "I'd only ever aim it at an enemy, Hegnar.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Who I shoot is my business once I've paid.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because most o' yer lot reckon a curse beats a bullet, an' I'd argue the bullet's quicker. If ye keep a gun as well as yer demons, at least the troggs will die honestly." } },
      choices = {
        { text = "A clean shot is honest work. I'll keep one handy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The curse is slower, Hegnar, and that's the point.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hegnar Rumbleshot, gunsmith, and every barrel on that rack's been tested by my own hand. If it didnae knock me on my backside, it doesnae get sold." },
        { id = "h_ammo", when = { questActive = TODO_QUEST("Ammo for Rumbleshot") },
          text = "Is that my ammunition ye've got there? Good, I was startin' to sell guns with nothin' to put in them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! Ye'll be wantin' somethin' quiet, an' I'll tell ye now nothin' on this rack is quiet." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock buyin' a gun? That's a new one, though I'll sell tae anyone wi' coin an' sense." },
      },
      again = {
        { id = "h_again", text = "What else? I've a rifle to oil." },
      },
      choices = {
        { text = "Why camp out here instead of the city?", next = "camp" },
        { text = "What makes a good gun?", next = "guns" },
        { text = "I'm a hunter. What would you recommend?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do rogues ever buy guns from you?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why would a warlock not buy a gun?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Just looking, thanks.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Because the folk who need a gun are out here, no' in the city. Ironforge has its guards; a farmer on the road has only what he carries." } },
      choices = {
        { text = "Every dwarf should be able to defend himself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The guards should keep the roads safe instead.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guns = {
      lines = { { id = "gu_default", text = "A straight barrel, dry powder and a dwarf who knows to clean it. The rest is just decoration for gnomes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Somethin' sturdy that won't jam in the cold, and plenty of shot to go with it. A hunter who runs out of ammunition is just a dwarf with a heavy stick." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If it doesnae go bang, I couldnae tell ye about it." } },
  },
}
