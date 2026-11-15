-- Menethil Harbor. Voice: bibles/menethil.md
-- The captain on the wall, the drunk by the tavern door, the priest with too much to do,
-- a wounded dwarf out of Dun Modr, a merchant sailor, the innkeeper, the League's man,
-- and a bartender who doesn't sell drinks.
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "stoutfist", id = TODO_NPC("Captain Stoutfist"), name = "Captain Stoutfist",
  bible = "bibles/menethil.md", role = "soldier", tier = "major",
  communities = { "menethil" }, temper = { "fierce" }, values = { "dutiful", "brave" },
  notices = { "soldier", "kit" },

  greetings = {
    { id = "g_wall", text = "Quickly now. I've a wall to keep an' a hill full o' orcs to keep it from." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Good. I've more work than hands, an' ye've got hands." },
    { id = "g_nekrosh", when = { questDone = TODO_QUEST("Defeat Nek'rosh") }, text = "Here's the one who brought me Nek'rosh's head. Stand up straight; the lads are watchin'." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 24 },
      text = "Ye've the look o' someone who's held a line. Good. I need lines held." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Yer kit's in ribbons. Get it seen to before ye go back up the road. I'll no' send folk out half-dressed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Stoutfist. I hold Menethil for Ironforge an' the Alliance both. The Dragonmaw have come down out o' the hills into Dun Algaz, an' if they hold it, the road to Loch Modan's shut." },
        { id = "h_report", tags = { "news" }, when = { questActive = TODO_QUEST("Report to Captain Stoutfist") },
          text = "Ironjaw sent ye? Good man, Ironjaw. I asked him for soldiers who'd go where they're told. Let's find out if that's you." },
        { id = "h_banners", when = { questActive = TODO_QUEST("War Banners") },
          text = "They've a camp in the hills northeast o' here, an' their filthy banners hung over it. Bring me the banners. I want 'em to wake up an' see bare poles." },
        { id = "h_gambit", tags = { "news" }, when = { questActive = TODO_QUEST("Nek'rosh's Gambit") },
          text = "Catapults. The brute's buildin' catapults to throw at my walls. Burn them before he gets the range." },
        { id = "h_nekrosh", tags = { "news" }, when = { questActive = TODO_QUEST("Defeat Nek'rosh") },
          text = "Nek'rosh Skullcrusher. Cut off the head an' the Dragonmaw go back to their caves. Bring it to me in a sack. I'll want to see it." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves from the sky. Can ye see the orc camps from up there? No? Then ye'll walk to them like the rest of us." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Defeat Nek'rosh"), days = 3 } },
          text = "The lads sang last night. Badly, an' about you. I let them. First night in a year nobody's watched the hills for torches." },
        { id = "h_statuette", tags = { "news" }, when = { questActive = TODO_QUEST("A Friend of the Family") },
          text = "Ye've the statuette. Straight to Highlord Fordragon wi' it, an' no detours. No' a clerk, no' a captain. Fordragon." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A proper beard. Good. Half my garrison's sailors who think a hammer's for nails." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night watch. The orcs like the dark, an' so do I. Means I can see their fires." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, mind. The wall doesnae keep itself." },
        { id = "h_again2", text = "Go on. I'm listenin' wi' one ear. The other's on the hills." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask. I'm no' sleepin' till the watch changes anyway." },
      },
      choices = {
        { text = "Who are the Dragonmaw?", next = "dragonmaw" },
        { text = "Who leads them?", next = "nekrosh" },
        { text = "How's the harbour holding?", next = "harbour" },
        { text = "What's happening to the north?", next = "north" },
        { text = "Ironforge sent me to the frontier too, Captain.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Catapults? I could take one apart in an hour.", next = "gnome", when = { race = "Gnome" } },
        { text = "Your wounded and your dead. Who tends them?", next = "priest", when = { class = "PRIEST" } },
        { text = "I came out of Lordaeron. Your harbour carries our king's name.", next = "lordaeron", when = { origin = "human_lordaeron_refugee" } },
        { text = "Nek'rosh is dead. What now?", next = "after", when = { questDone = TODO_QUEST("Defeat Nek'rosh") } },
        { text = "Put me to work, Captain.", next = "BUSINESS", fx = { affinity = 1, standing = { menethil = 1 } } },
        { text = "I'll be going.", next = "END" },
      },
    },

    dragonmaw = {
      big = true,
      lines = {
        { id = "d_default", text = "Orcs that rode dragons in the Second War. They burned half the coast from those beasts' backs. Now they've no dragons left to ride an' they're angrier for it." },
      },
      choices = {
        { text = "Then let's finish them.", next = "BACK", fx = { affinity = 2, learn = { "dragonmaw" }, align = { honor = 1 } } },
        { text = "No dragons at all?", next = "none", fx = { learn = { "dragonmaw" } } },
      },
    },
    none = {
      lines = { { id = "n_default", text = "None I've seen. An' I look. Every mornin', first thing, I look." } },
      choices = {
        { text = "What happened to their dragons?", next = "grim_batol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grim_batol = {
      lines = {
        { id = "gb_default", text = "The reds broke loose an' turned on their riders. That's how the Dragonmaw came to be hidin' in our hills. Now red dragonkin hold the gates o' Grim Batol, east o' here, an' let nobody up that road." },
      },
      choices = {
        { text = "Grim Batol was a dwarven hold, wasn't it?", next = "grim_batol_old" },
        { text = "Good riddance to the Dragonmaw.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    grim_batol_old = {
      lines = {
        { id = "go_default", text = "Wildhammer, before they went north to the Hinterlands. There's been somethin' black in that stone since the old clan wars. No dwarf I know would sleep there, dragons or no." },
      },
      choices = {
        { text = "Then the dragons can keep it.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    nekrosh = {
      lines = {
        { id = "nk_default", text = "Nek'rosh Skullcrusher. Son o' Nekros, the warlock who chained the reds in the first place. The dragons ate his da, an' he's sworn to settle wi' them." },
      },
      choices = {
        { text = "He wants the dragons, not you?", next = "nekrosh_siege" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } },
      },
    },
    nekrosh_siege = {
      big = true,
      lines = {
        { id = "ns_default", text = "He cannae reach the dragons, so he'll reach me: catapults in the hills, his lads in Dun Algaz so no help comes. Clever. I'll give him that an' nothin' else." },
      },
      choices = {
        { text = "Then the catapults burn first.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Can Menethil hold a siege?", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    harbour = {
      lines = { { id = "hb_default", text = "Ships still come an' go, which is the point o' the place. While the boats run, the Alliance has a back door. I mean to keep it open." } },
      choices = {
        { text = "A back door to where?", next = "harbour_routes" },
        { text = "Something else.", next = "BACK", fx = { standing = { menethil = 1 } } },
      },
    },
    harbour_routes = {
      lines = {
        { id = "hr_default", text = "Boats to Theramore an' Auberdine, gryphons to Ironforge an' Southshore. Shut Dun Algaz an' the Thandol Span both, an' this harbour's all that joins Khaz Modan to the rest." },
      },
      choices = {
        { text = "Who built Menethil?", next = "harbour_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harbour_name = {
      lines = {
        { id = "hn_default", text = "Admiral Proudmoore's men, after the Second War. They named it for King Terenas. I'm proud o' that name. Somebody ought to be, now." },
      },
      choices = {
        { text = "Then it's in good hands.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    north = {
      lines = {
        { id = "no_default", text = "Dark Irons. They broke the Thandol Span an' took Dun Modr off Longbraid's lads. One enemy at a time, I keep tellin' my lot. They keep askin' which one." },
      },
      choices = {
        { text = "Can't Ironforge send more soldiers?", next = "north_ironforge" },
        { text = "Harlo Barnaby came from there.", next = "north_harlo" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    north_ironforge = {
      lines = {
        { id = "ni_default", text = "Ironforge sends its sons to every war the Alliance asks it to. That's the trouble. They're still out there, an' the Dark Irons noticed who wasnae home." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    north_harlo = {
      lines = {
        { id = "nh_default", text = "Young Barnaby. Came in on a horse wi' an axe in his back, an' asked if his lads were alive before he asked for a healer. That's a soldier." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    dwarf = {
      lines = {
        { id = "dw_default", text = "Then ye know what this place is. The Wetlands were ours once, holds an' roads both. Menethil's the bit that's left, an' I mean to keep it." },
      },
      choices = {
        { text = "Ironforge will win the rest again.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { menethil = 1 } } },
        { text = "Why not pull back to Loch Modan?", next = "dwarf_retreat" },
      },
    },
    dwarf_retreat = {
      lines = { { id = "dr_default", text = "Because then the boats stop, an' Ironforge talks to Theramore by shoutin'. No. We hold." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    gnome = {
      lines = {
        { id = "gn_default", text = "Ye could, I don't doubt it. I'd sooner ye burned it, an' took apart the ashes after. Mind, if ye see how they're built, tell me what's aimed at my wall." },
      },
      choices = {
        { text = "I'll bring you notes. And a drawing.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Burning's quicker anyway.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Glorin Steelbrow, in the tavern, an' he'll tell ye he's no' enough. Bless the lads before they go up the road, if ye've time. They're braver when somebody's prayed." },
      },
      choices = {
        { text = "I'll pray with them before they go.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, standing = { menethil = 1 } } },
        { text = "And the ones who don't return?", next = "priest_dead" },
      },
    },
    priest_dead = {
      big = true,
      lines = {
        { id = "pd_default", text = "We bury them on the high ground, where the sea cannae take them twice. Glorin says the words. I stand there. Never got used to it. Never want to." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } } },
    },

    lordaeron = {
      lines = {
        { id = "lo_default", text = "Terenas Menethil. I never met the man. I keep his harbour anyway, an' I'll keep his name on the gate as long as I've breath." },
      },
      choices = {
        { text = "Thank you for that.", next = "BACK", fx = { affinity = 3 } },
        { text = "He's dead. Lordaeron's dead.", next = "lordaeron_dead" },
      },
    },
    lordaeron_dead = {
      lines = { { id = "ld_default", text = "Aye. The harbour's no'. That's what names are for, {g:lad|lass}. They outlast the folk who gave them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },

    after = {
      big = true,
      lines = {
        { id = "af_default", text = "Quieter. The banners are ash, the catapults are ash, an' the clan may never get up again. Somebody'll try to take his place. Till then, my lads sleep." },
      },
      choices = {
        { text = "And if someone does?", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Then my work here is done.", next = "BACK", fx = { affinity = 2, standing = { menethil = 2 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ironforge gave me a wall an' a harbour behind it. That's my story. I like it short." } },
    advice = { { id = "tp_ad", text = "Dinnae walk Dun Algaz alone, an' dinnae walk it at night. Ye'll meet orcs either way. Better to see them first." } },
    dragonmaw = {
      { id = "tp_dragonmaw", text = "Dun Algaz is theirs for now. 'For now' is doin' a lot o' work in that sentence." },
      { id = "tp_dragonmaw2", text = "A clan wi' no dragons an' a chief wi' a grudge. Ask me who leads them.", next = "nekrosh" },
    },
    dark_iron = { { id = "tp_dark_iron", text = "Took Dun Modr off us to the north. One enemy at a time, I keep tellin' the lads. They keep askin' which one." } },
    explorers_league = { { id = "tp_league", text = "The League's man upstairs wants an escort to his dig. I've no men to spare for bones." } },
    _none = { { id = "tp_none", text = "No' my concern. My concern's the wall." } },
  },
}

P:NPC {
  key = "fitzsimmons", id = TODO_NPC("First Mate Fitzsimmons"), name = "First Mate Fitzsimmons",
  bible = "bibles/menethil.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "maudlin" }, values = { "loyal" },
  notices = { "drink", "fright" },

  greetings = {
    { id = "g_tale", text = "Sit down, sit down! A drink and a tale, that's my price. You bring the drink, I'll bring the tale." },
    { id = "g_back", when = { metBefore = true }, text = "My friend! You came back. Nobody comes back. Sit. Sit downwind, they all say. I don't know why." },
  },

  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You've had a few! Good, good. Now you're good company. Now you're my kind of company." },
    { id = "n_sailor", cat = "fright", when = { resSick = true },
      text = "You've been dead. I can tell. You've the look my shipmates had, the ones that still walk. Sit by me a while. I don't mind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fitzsimmons, first mate of the Wave Mistress, Third Fleet of Kul Tiras. Was. Was first mate. There's no ship to be first mate of anymore." },
        { id = "h_mead", tags = { "news" }, when = { questActive = TODO_QUEST("The Third Fleet") },
          text = "My mead. It's in the tavern cellar. I'd fetch it, but the stairs move about when I'm sober, and I'm terribly sober right now." },
        { id = "h_mead_done", when = { questRecent = { TODO_QUEST("The Third Fleet"), days = 3 } },
          text = "Ah, that's better. Now I can talk. Now I can talk about it. Pull up that barrel." },
        { id = "h_crew", tags = { "news" }, when = { questActive = TODO_QUEST("The Cursed Crew") },
          text = "The wrecks in the bay aren't empty. My crew never left them. They're still at their posts, and they shouldn't be. Set them free." },
        { id = "h_curse", when = { questDone = TODO_QUEST("Lifting the Curse") },
          text = "They're resting? All of them? Then I'll drink to them tonight. And tomorrow. Mostly to them." },
        { id = "h_halyndor", tags = { "news" }, when = { questActive = TODO_QUEST("Lifting the Curse") },
          text = "The captain still walks the Intrepid. Get his key, open that strongbox, and take what's in it to the priest. Don't look at it long." },
        { id = "h_greenwarden", when = { questActive = TODO_QUEST("The Greenwarden") },
          text = "Off to find old Greenie, are you? East of the road, where it forks for Dun Modr. Bring a big stick. Bring two." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Listen. Hear that, out on the water? No? Lucky. I hear it every night." },
      },
      again = {
        { id = "h_again", text = "Another question? Another drink, then. Your round." },
        { id = "h_again2", text = "Still here? You must be my only friend. Sit closer. No. Not that close." },
      },
      choices = {
        { text = "What happened to the fleet?", next = "fleet" },
        { text = "Why do you drink so much?", next = "why" },
        { text = "What's out in the bay now?", next = "bay" },
        { text = "Got a tale for an adventurer?", next = "greenwarden" },
        { text = "Let me pray for your crew.", next = "priest", when = { class = "PRIEST" } },
        { text = "To the Wave Mistress!", next = "toast", when = { drunk = { min = 1 } } },
        { text = "The Eye's been cleansed, in Stormwind.", next = "cleansed", when = { questDone = TODO_QUEST("Cleansing the Eye") } },
        { text = "Some other time.", next = "END" },
      },
    },
    fleet = {
      big = true,
      lines = {
        { id = "f_default", key = true,
          text = "Red dragons, with orcs on their backs. Second War. They came out of the clouds and set the sails alight, ship after ship. I lived. Nobody else did. Nobody." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, learn = { "dragonmaw" } } },
        { text = "You were lucky.", next = "lucky", fx = { learn = { "dragonmaw" } } },
      },
    },
    lucky = {
      lines = { { id = "l_default", text = "Lucky. Yes. That's what they call it. I've been lucky every night since. Every single night." } },
      choices = {
        { text = "What do you see, at night?", next = "dreams" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dreams = {
      lines = {
        { id = "dm_default", text = "The Wave Mistress, whole again. The lads at the ropes. Then they turn round, and they're not the lads anymore. Then I wake up and go looking for a bottle." },
      },
      choices = {
        { text = "They're still out there, aren't they?", next = "bay" },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because when I'm drunk the bay's just water. When I'm sober it's a graveyard with my friends in it. You'd drink too." } },
      choices = {
        { text = "Maybe I would.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll buy you one.", next = "mead" },
        { text = "Drink won't change what happened.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    mead = {
      lines = {
        { id = "md_default", text = "Would you? A flagon of Helbrek's dwarven mead, then, and none of the watered stuff he sells sailors. Then I'll tell you the rest of it." },
      },
      choices = {
        { text = "One flagon. Then the tale.", next = "BUSINESS", fx = { affinity = 2, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bay = {
      big = true,
      lines = {
        { id = "by_default", text = "Two wrecks off the north shore, the Wave Mistress and the Intrepid. My crew are still aboard. Walking. Something on one of those ships won't let them sleep." },
      },
      choices = {
        { text = "What's holding them?", next = "bay_curse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bay_curse = {
      lines = {
        { id = "bc_default", text = "Something in the Intrepid's strongbox. Captain Halyndor kept the key and never said what he'd locked up. Greedy man. I'd have mutinied, if I'd known." },
      },
      choices = {
        { text = "I'll go out to the wrecks.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    greenwarden = {
      lines = {
        { id = "gw_default", text = "Something called the Greenwarden lives in the marsh, east of where the road forks for Dun Modr. Leave your purse with me. Gold only gets stuck in teeth like that." },
      },
      choices = {
        { text = "Nice try, Fitz.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "What is it, this Greenwarden?", next = "greenwarden_what" },
      },
    },
    greenwarden_what = {
      lines = {
        { id = "gwh_default", text = "Ask it yourself, if it doesn't eat you first. Folk who come back say it talks. Folk who don't come back don't say much." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Pray loud. They're a long way down, and the water's cold. Glorin tried, once. He said the bay didn't answer." },
      },
      choices = {
        { text = "Then I'll take the prayer out to them.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "The Light hears, even underwater.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    toast = {
      lines = {
        { id = "t_default", text = "To the Wave Mistress! And her crew, and her rigging, and her ugly old figurehead. Ha! Now you're a sailor." },
      },
      choices = { { text = "To absent friends.", next = "BACK", fx = { affinity = 2 } } },
    },
    cleansed = {
      lines = {
        { id = "cl_default", text = "Cleansed. Good. Good. I still hear them, some nights. Quieter, maybe. Maybe I'm only drunker." },
      },
      choices = {
        { text = "Give it time, Fitz.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "They're at rest. You can be too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "First mate. Wave Mistress. Third Fleet. Kul Tiras. Say it fast and it doesn't hurt.", next = "fleet" } },
    advice = { { id = "tp_ad", text = "Never sail under a red sky. Or a red dragon. Mostly the dragon." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "Them. The very same. Up in the hills now, without their dragons. I hope they miss them as much as I miss my ship." } },
    _none = { { id = "tp_none", text = "Don't know, friend. Buy me a drink and ask me again; I'll know even less." } },
  },
}

P:NPC {
  key = "glorin", id = TODO_NPC("Glorin Steelbrow"), name = "Glorin Steelbrow",
  bible = "bibles/menethil.md", role = "priest", tier = "quest",
  communities = { "menethil" }, temper = { "grumpy" }, values = { "devout", "dutiful" },
  notices = { "fel", "class" },

  greetings = {
    { id = "g_busy", text = "Hmph. Another one. Aye, aye, the Light bless ye. What is it? I've three things on the fire an' two o' them are smoking." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are ye? Well, ye're useful, I'll give ye that. Useful's rare round here." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "Warlock. Hmph. Stand over there. No, further. The Light an' I have enough to deal with in this marsh." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Thank the Light. Ye can take the next three blessings. I've a backlog." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Glorin Steelbrow, o' the Church. I tend Menethil's souls, an' nobody mentioned the souls come wi' mud, murlocs an' drowned sailors." },
        { id = "h_eye", tags = { "news" }, when = { questActive = TODO_QUEST("The Eye of Paleth") },
          text = "What's that ye've brought out o' the wreck? Don't hand it here. Put it down. Gently. That's got something foul sleepin' in it." },
        { id = "h_cleanse", when = { questActive = TODO_QUEST("Cleansing the Eye") },
          text = "It'll take more than a prayer to scrub that clean. I've the prayer. You fetch the rest." },
        { id = "h_fitz", when = { heardLine = "fitzsimmons.f_default" },
          text = "He told ye about the fleet. Poor soul. I've tried to get him off the drink. He listens, nods, an' asks if the Light comes in a bottle." },
        { id = "h_doomed", tags = { "news" }, when = { questActive = TODO_QUEST("The Doomed Fleet") },
          text = "Farthing sent ye, all the way from Darkshire? Hmph. He always did send me his hardest questions. Sit. It's about the iron, I'll wager." },
        { id = "h_ingots", when = { questActive = TODO_QUEST("The Lost Ingots") },
          text = "Murlocs. It would be murlocs. They've no use for holy iron an' they took every bar anyway." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Evening prayers, an' then the sailors come in wantin' blessings for the mornin' tide. I bless them. I don't promise anything." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, before the next soul comes in drippin'." },
        { id = "h_again2", text = "Aye? Go on. I'm listenin'. Mostly." },
      },
      choices = {
        { text = "Can I help?", next = "help" },
        { text = "Why so grumpy?", next = "grumpy" },
        { text = "What do you know of the wrecks?", next = "wrecks" },
        { text = "Brother, let me take some of the load.", next = "priest", when = { class = "PRIEST" } },
        { text = "Bishop Farthing sent me about lightforge iron.", next = "lightforge", when = { questActive = TODO_QUEST("The Doomed Fleet") } },
        { text = "What is an Eye of Paleth, exactly?", next = "eye", when = { questDone = TODO_QUEST("The Eye of Paleth") } },
        { text = "Light keep you.", next = "END" },
      },
    },
    help = {
      lines = { { id = "hp_default", text = "Aye, by not needin' anything. Failing that, keep the dead in the bay where they belong an' the living out of it." } },
      choices = {
        { text = "I mean it. What needs doing?", next = "work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "wk_default", text = "The drowned wash up wi' the tide. The Captain's lads come down from the hills wi' holes in them. An' Fitzsimmons needs savin' from himself, daily. Pick one." },
      },
      choices = {
        { text = "Tell me about Fitzsimmons.", next = "fitz" },
        { text = "I'll see to the wounded.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { menethil = 1 } } },
      },
    },
    fitz = {
      lines = {
        { id = "fz_default", text = "Last man o' the Third Fleet, an' he's spent every year since tryin' to drown in a flagon. I've tried prayer, sermons an' hidin' the mead. Helbrek keeps findin' it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    grumpy = {
      big = true,
      lines = {
        { id = "g2_default", text = "I'm no' grumpy. I'm busy. Grumpy's what busy looks like from the outside. Inside, it's mostly prayer an' wet socks." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { affinity = 2 } },
        { text = "Who looks after you, then?", next = "grumpy_self" },
      },
    },
    grumpy_self = {
      lines = {
        { id = "gs_default", text = "Nobody, an' I prefer it. The Light an' I have an understandin'. It sends me work, I do it, an' neither of us complains. Well. One of us complains." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wrecks = {
      lines = {
        { id = "wr_default", text = "The Third Fleet, out o' Lordaeron, burned off this coast by red dragons in the last great war. An elven ship sailed wi' them for safety, the Flying Osprey. Didnae help her either." },
      },
      choices = {
        { text = "What was the elven ship carrying?", next = "lightforge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lightforge = {
      big = true,
      lines = {
        { id = "lf_default", text = "Lightforge iron. Metal that strikes wi' holy truth, as the old smiths put it. She sank south o' the harbour, an' I'm told the murlocs have been at her hold." },
      },
      choices = {
        { text = "Who could work such metal?", next = "lightforge_smith" },
        { text = "Iron like that belongs in a paladin's hands.", next = "BACK", when = { class = "PALADIN" }, fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lightforge_smith = {
      lines = {
        { id = "ls_default", text = "Grimand Elmore, in Stormwind's Dwarven District. He'll no' have touched the stuff in years. Bring him the iron an' a good story; he likes both." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eye = {
      big = true,
      lines = {
        { id = "ey_default", text = "Human priests made the Eyes long ago, to see clear an' shine bright. Sour one in sorrow an' ye get what came out o' that wreck. Benedictus can clean it; I cannae." },
      },
      choices = {
        { text = "Why can't you?", next = "eye_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eye_why = {
      lines = {
        { id = "ew_default", text = "Their makin's no' mine. Dwarven prayer on human craft is like fixin' a gnome's clock wi' a hammer. Ye'd get a result. No' the right one." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = {
        { id = "pq_default", text = "Thank the Light, a colleague. Where did they train ye, then? Northshire? The Cathedral? Or did ye learn it on the road like the rest of us?" },
      },
      choices = {
        { text = "Northshire Abbey.", next = "priest_abbey", fx = { learn = { "northshire_abbey" } } },
        { text = "The Cathedral, in Stormwind.", next = "priest_cathedral" },
        { text = "On the road, mostly.", next = "priest_road" },
      },
    },
    priest_abbey = {
      lines = {
        { id = "pa_default", text = "Northshire. Then ye know how to sit still an' pray. Good. Now forget it. Out here ye pray wi' wet feet an' one eye on the door." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest_cathedral = {
      lines = {
        { id = "pc_default", text = "Benedictus's lot. Good man. Give him my regards when ye next carry him somethin' cursed I couldnae fix." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest_road = {
      lines = {
        { id = "pw_default", text = "Best school there is, an' the worst. Ye'll do. Take the next three blessings, would ye? Sailors. They always want three." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An Ironforge priest o' the Church, posted to a marsh. Somebody up the chain has a sense o' humour." } },
    advice = { { id = "tp_ad", text = "Keep yer socks dry an' yer soul drier. The marsh gets into both." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "I bury what the Captain's lads bring back. Ask him about the orcs. Ask me about the burying." } },
    northshire_abbey = { { id = "tp_abbey", text = "Good bells, good bread, an' novices who've never seen a murloc. Lucky them." } },
    _none = { { id = "tp_none", text = "Hmph. No' my problem, an' I've plenty." } },
  },
}

P:NPC {
  key = "harlo", id = TODO_NPC("Harlo Barnaby"), name = "Harlo Barnaby",
  bible = "bibles/menethil.md", role = "soldier", tier = "quest",
  communities = { "menethil" }, temper = { "bitter" }, values = { "brave", "proud" },
  notices = { "body", "kin" },

  greetings = {
    { id = "g_bed", text = "Don't mind me. I'm no' gettin' up. Healer's orders. My orders are different, but she's got the bigger stick." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Any word from the north? Any word at all?" },
  },

  notice = {
    { id = "n_dwarf", cat = "kin", when = { race = "Dwarf" },
      text = "One o' our own. Ye'll understand, then. A dwarf without his hold is just a short man in the rain." },
    { id = "n_hurt", cat = "body", when = { durability = { max = 0.25 } },
      text = "Ye look like I felt. Don't take an axe in the back. That's my advice. Face 'em, always." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Harlo Barnaby. I was at Dun Modr when the Dark Irons came, an' I took an axe in the back runnin'. Woke up here, an' that's the whole bad story." },
        { id = "h_fall", tags = { "news" }, when = { questActive = TODO_QUEST("Fall of Dun Modr") },
          text = "Go north to Dun Modr. See what's left. See who's left. If any o' my lot are breathin', tell 'em Harlo's waitin'." },
        { id = "h_fall_done", when = { questDone = TODO_QUEST("Fall of Dun Modr") },
          text = "So it's as bad as I dreamed. Worse. Thank ye for lookin'. Somebody had to, an' I couldn't." },
        { id = "h_grim", tags = { "news" }, when = { questDone = TODO_QUEST("A Grim Task") },
          text = "Balgaras is dead? The one who never came out to fight? Then I'll sleep tonight. First time since the bridge." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Can't sleep on my front, can't sleep on my back. So I lie here an' count the Dark Irons I owe. It's a long count." },
      },
      again = {
        { id = "h_again", text = "Ask away. I'm no' goin' anywhere. Truly." },
        { id = "h_again2", text = "What else? Talkin' keeps my mind off the back." },
      },
      choices = {
        { text = "Who took Dun Modr?", next = "who" },
        { text = "Who was your commander?", next = "longbraid" },
        { text = "How's the wound?", next = "wound" },
        { text = "Ironforge will retake the north.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Let me pray over that wound.", next = "priest", when = { class = "PRIEST" } },
        { text = "Longbraid's alive. He asked after you.", next = "alive", when = { questDone = TODO_QUEST("Fall of Dun Modr") } },
        { text = "Rest easy.", next = "END", fx = { affinity = 1 } },
      },
    },
    who = {
      big = true,
      lines = {
        { id = "w_default", text = "Dark Irons, out o' the mountains. Fire an' black steel an' no mercy in 'em at all. They didnae want the fort. They wanted the road through it." },
      },
      choices = {
        { text = "I'll go north.", next = "BUSINESS", fx = { affinity = 2, learn = { "dark_iron" } } },
        { text = "Why the road?", next = "road", fx = { learn = { "dark_iron" } } },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Aye, that's the question. When I can stand, I'll ask one of 'em. Politely. Wi' an axe." } },
      choices = {
        { text = "Was it only the fort they hit?", next = "span" },
        { text = "Something else.", next = "BACK" },
      },
    },
    span = {
      lines = {
        { id = "sp_default", text = "The Thandol Span first. They brought down the west bridge wi' good dwarves on it. We pulled into Dun Modr, an' they were on us before we'd counted the dead." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then they'll pay for the bridge too.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
      },
    },
    longbraid = {
      lines = {
        { id = "lb_default", text = "Longbraid the Grim. He sounded the retreat horn. Last thing I heard before the axe. They put me on the only horse left, I'm told. I don't remember it." },
      },
      choices = {
        { text = "Do you think he lived?", next = "longbraid_hope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    longbraid_hope = {
      lines = {
        { id = "lh_default", text = "If any dwarf could, he could. Grim's no' a name, it's a description. Go an' look, would ye? I'd go myself if I could stand." },
      },
      choices = {
        { text = "I'll find him.", next = "BUSINESS", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wound = {
      lines = {
        { id = "wd_default", text = "Stray axe, between the shoulders. Healer says I'll walk. Says it the way ye say the weather'll clear." },
      },
      choices = {
        { text = "You will walk.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Face them, always. I heard.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    dwarf = {
      lines = {
        { id = "dw_default", text = "Aye, when the lads come home from the Alliance's wars an' see what happened while they were gone. Tell them in Ironforge. Tell them loud." },
      },
      choices = { { text = "I'll tell them.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { menethil = 1 } } } },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Glorin's prayed over it twice an' grumbled over it ten times. Go on, then. ...That's warm. That's very warm. Thank ye." },
      },
      choices = { { text = "Rest. It'll mend.", next = "BACK", fx = { affinity = 3, align = { light = 2 } } } },
    },
    alive = {
      big = true,
      lines = {
        { id = "al_default", text = "He's alive! Then the regiment's alive, whatever's left of it. Tell him I'll be on my feet before he's done bein' grim about it." },
      },
      choices = { { text = "I'll tell him.", next = "BACK", fx = { affinity = 3, standing = { menethil = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Longbraid's regiment, Dun Modr. Soldier, an' I'll be one again. That's the whole of it.", next = "longbraid" } },
    advice = { { id = "tp_ad", text = "Watch the bridges up north. They're no' as solid as they look anymore." } },
    dark_iron = { { id = "tp_dark_iron", text = "They put me in this bed. I'll put a few o' them in worse. That's a promise, no' a threat." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "The Captain's problem. Mine's north. Everyone's got a problem in the Wetlands." } },
    _none = { { id = "tp_none", text = "Ask someone who can walk." } },
  },
}

P:NPC {
  key = "karl", id = TODO_NPC("Karl Boran"), name = "Karl Boran",
  bible = "bibles/menethil.md", role = "worker", tier = "quest",
  communities = { "menethil" }, temper = { "steady" }, values = { "hardworking", "practical" },
  notices = { "kit" },

  greetings = {
    { id = "g_dock", text = "Careful of the ropes. And the nets. And the crates. Actually, just stand still a moment." },
    { id = "g_back", when = { metBefore = true }, text = "There you are. The work never stops, but the company's better." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Rough out there? Course it is. Get patched up, then get back to it. That's how we do it here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Karl Boran, merchant marine. I keep cargo moving through this harbour, which is harder than it sounds with half the marsh trying to eat it." },
        { id = "h_crabs", when = { questActive = TODO_QUEST("Claws from the Deep") },
          text = "Claws, aye, from the deep water. Bring me what I asked for and mind your fingers. They're the only ten you get." },
        { id = "h_goods", tags = { "news" }, when = { questActive = TODO_QUEST("Reclaiming Goods") },
          text = "Goods that were ours and aren't anymore. Bring back what you can carry. I'll take dented over gone." },
        { id = "h_statuette", when = { questActive = TODO_QUEST("Return the Statuette") },
          text = "That little carving was in one of the crates? Then it belongs to someone. Get it home. That's the job, every time: get it home." },
        { id = "h_statuette_done", when = { questDone = TODO_QUEST("Return the Statuette") },
          text = "The Blind Princess's captain near wept over that statuette. The Captain says a thing like that shouldn't sit where the Dragonmaw can see it. He's not wrong." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Last boat's in. I count the crates by lantern. Then I count them again, because the lantern lies." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've crates waiting, but they'll wait." },
        { id = "h_again2", text = "Go on. Talk while I stack." },
      },
      choices = {
        { text = "How do you manage out here?", next = "manage" },
        { text = "What's wrong on the coast?", next = "coast" },
        { text = "Where do the ships go from here?", next = "ships" },
        { text = "I came over on the Auberdine boat.", next = "nightelf", when = { race = "NightElf" } },
        { text = "Good luck with the cargo.", next = "END" },
      },
    },
    manage = {
      big = true,
      lines = {
        { id = "m_default", text = "Times are lean. You don't fix lean by moaning. You pick up the next crate, and then the one after that, and one day you look up and the dock's clear." },
      },
      choices = {
        { text = "That's a good way to live.", next = "BACK", fx = { affinity = 2 } },
        { text = "And if the dock never clears?", next = "never" },
      },
    },
    never = {
      lines = { { id = "n_default", text = "Then you'll have moved a great many crates. There are worse ways to spend a life." } },
      choices = {
        { text = "Why are times so lean?", next = "lean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lean = {
      lines = {
        { id = "le_default", text = "The Dragonmaw sit on Dun Algaz, so nothing comes up from Loch Modan by road. It all comes by sea now, and the sea has murlocs in it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dragonmaw" } } } },
    },
    coast = {
      lines = {
        { id = "co_default", text = "Bluegill murlocs, building huts along the shore and raiding anything that floats too close. Not long ago they hit the Blind Princess and dragged half her cargo over the side." },
      },
      choices = {
        { text = "What did they take?", next = "statuette" },
        { text = "Something else.", next = "BACK" },
      },
    },
    statuette = {
      lines = {
        { id = "st_default", text = "Crates, barrels, and one silver statuette of King Terenas, young, as a paladin with his hammer raised. Worth more than the ship, some say. The murlocs only want it because it shines." },
      },
      choices = {
        { text = "I'll find it.", next = "BUSINESS", fx = { affinity = 2, standing = { menethil = 1 } } },
        { text = "Terenas was my king.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Then I'm sorry, and I'll see it gets where it should. Not much comes out of Lordaeron anymore. Every piece of it belongs to somebody." },
      },
      choices = { { text = "Thank you, Karl.", next = "BACK", fx = { affinity = 3 } } },
    },
    ships = {
      lines = {
        { id = "sh_default", text = "Theramore and Auberdine, across the sea. And every payday the Kul Tiras marines come the other way from Theramore, looking for a good time." },
      },
      choices = {
        { text = "What are the marines like?", next = "ships_marines" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships_marines = {
      lines = {
        { id = "sm_default", text = "Loud, thirsty and paid. They drink, they sing, they pay. Mikhail watches them like a hawk. I've never asked him why." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nightelf = {
      lines = {
        { id = "ne_default", text = "Then you've had the crossing. Your folk always come off that boat looking up, like the sky's lower here. It is, I think. It's the rain." },
      },
      choices = {
        { text = "It is lower. And wetter.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Merchant marine. I go where the cargo goes, and lately the cargo comes here." } },
    advice = { { id = "tp_ad", text = "Count your crates twice and your fingers three times. This coast takes both." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "They've cut the road east. Everything goes by sea now. Good for me, bad for everyone else." } },
    _none = { { id = "tp_none", text = "Can't say. I only know what's in the crates, and not always that." } },
  },
}

P:NPC {
  key = "helbrek", id = TODO_NPC("Innkeeper Helbrek"), name = "Innkeeper Helbrek",
  bible = "bibles/menethil.md", role = "innkeeper", tier = "service",
  communities = { "menethil" }, temper = { "jolly" }, values = { "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_tavern", text = "In ye come, out o' the wet! The Deepwater's dry, warm, an' only leaks over the bar, which is where ye want it." },
    { id = "g_home", when = { homeInn = { "Menethil Harbor", "Deepwater Tavern" } }, text = "Hang yer cloak by the fire. It'll steam like a kettle. They all do." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Ye've been wrestlin' the marsh an' the marsh won. Sit. Stew. No arguments." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy now. Ye're startin' to sound like Fitzsimmons, an' one o' him is plenty." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Helbrek. I keep the Deepwater. Sailors, soldiers, diggers, an' one first mate who's been sittin' outside my door since before I owned it." },
        { id = "h_fitz", when = { heardLine = "fitzsimmons.h_default" },
          text = "Fitz told ye who he was? Aye, he's told everyone. I keep his mead in the cellar. Someone has to. Better me than the bay." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Well, an elf from the sky, in the wettest place on Azeroth! Ye'll miss yer clouds. Well. Ye won't. We've plenty here." },
        { id = "h_mate", when = { metBefore = true }, text = "The first mate asked for his usual again. I didnae ask what it was. Neither of us remembers anymore. I just pour." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Rain on the roof an' sailors singin' badly. That's Menethil at night. I wouldnae trade it. Most nights." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The stew's no' goin' anywhere. Neither am I." },
        { id = "h_again2", text = "Aye? Pull up a chair while ye think." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Any news?", next = "news" },
        { text = "Who drinks here?", next = "regulars" },
        { text = "My family brews too, back home.", next = "brewer", when = { origin = "dwarf_brewer" } },
        { text = "Just drying off.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "The Captain's sendin' folk at the orcs, the priest's sendin' folk at the wrecks, an' the bartender's sendin' folk somewhere he won't say. Pick one." } },
      choices = {
        { text = "Where's the bartender sending them?", next = "news_mikhail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news_mikhail = {
      lines = { { id = "nm_default", text = "Ask him. He'll tell ye nothin', very politely. That's Mikhail. Best-mannered wall in the Wetlands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Fitz by the door, the League's man upstairs wi' his maps, Glorin in the corner prayin' at his soup. An' once a month, the Kul Tiras marines off the Theramore boat. Then I hide the good mugs." },
      },
      choices = {
        { text = "Fitzsimmons drinks your mead?", next = "mead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mead = {
      lines = { { id = "md_default", text = "Dwarven mead, by the flagon. He cannae pay for it, so strangers do. A good tale goes a long way in this tavern." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brewer = {
      lines = { { id = "br_default", text = "Do they, now! Then ye'll know my mead's honest. An' if ye think it's no', ye'll keep it to yerself, like family." } },
      choices = { { text = "It's honest. Mostly.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep a dry room in a wet town. That's the whole o' my story, an' it's a good one." } },
    advice = { { id = "tp_ad", text = "Hang yer cloak by the fire an' yer boots by the door. Never the other way round." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "The lads come back from the hills tired an' thirsty. That's how I know there's a war on." } },
    _none = { { id = "tp_none", text = "Ask the room. Sailors know everythin', an' what they don't know they'll make up." } },
  },
}

P:NPC {
  key = "flagongut", id = TODO_NPC("Archaeologist Flagongut"), name = "Archaeologist Flagongut",
  bible = "bibles/menethil.md", role = "scholar", tier = "quest",
  communities = { "menethil" }, temper = { "eager" }, values = { "curious" },
  notices = { "lore", "travel" },

  greetings = {
    { id = "g_maps", text = "Careful, careful, that's a map! They're all maps. Mind where ye put yer elbows." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, ye're back! Found anythin' old? Anythin' at all? I'm no' fussy." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "Ye've read The Seven Kingdoms! Then ye know how much history sits under yer boots. Most folk only notice the mud." },
    { id = "n_far", cat = "travel", when = { visited = "Ironforge" },
      text = "Ye've been to the Hall o' Explorers? Tell Magellas I'm still here. He'll know what that means. It means I'm stuck." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Flagongut, Explorers' League. I came here on my way to the dig at Whelgar's, an' then the raptors took the road. So I'm diggin' through a tavern, for now." },
        { id = "h_prospector", tags = { "news" }, when = { questActive = TODO_QUEST("The Absent Minded Prospector") },
          text = "Word from our man across the sea? About time. He'd lose his own beard if it weren't attached, but he finds things nobody else can." },
        { id = "h_stoutfist", when = { heardLine = "stoutfist.h_default" },
          text = "The Captain told ye about the orcs? Raptors on the road, orcs in the hills, an' me in a tavern. Archaeology!" },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Candle's low an' the maps are still wrong. I keep hopin' one of them will correct itself overnight." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the maps." },
        { id = "h_again2", text = "Aye? Ask away. I've nothin' but time an' a tavern." },
      },
      choices = {
        { text = "What's at Whelgar's dig?", next = "dig" },
        { text = "Why not go to the dig yourself?", next = "stuck" },
        { text = "What's so special about your fossil?", next = "fossil" },
        { text = "I'm League too, sir.", next = "league", when = { origin = "dwarf_explorers_league" } },
        { text = "My people have ruins older than your dig.", next = "elf", when = { race = "NightElf" } },
        { text = "Good luck with it.", next = "END" },
      },
    },
    dig = {
      big = true,
      lines = {
        { id = "d_default", text = "Old things. Older than Ironforge, some say. Bones o' beasts nobody's named, an' stone nobody's read. An' now a pack o' mottled raptors sittin' on the lot." },
      },
      choices = {
        { text = "I'll clear a way for you.", next = "BUSINESS", fx = { affinity = 2, learn = { "explorers_league" } } },
        { text = "Can't the bones wait?", next = "wait" },
      },
    },
    wait = {
      lines = { { id = "w_default", text = "They've waited this long, aye. It's me that can't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stuck = {
      lines = {
        { id = "sk_default", text = "Waitin' on an escort. The road to Whelgar's runs through raptors, an' the Captain's no men to spare for an old dwarf's maps. I tried it alone once, an' lost the stone." },
      },
      choices = {
        { text = "What stone?", next = "stone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stone = {
      lines = {
        { id = "sn_default", text = "The Stone o' Relu, the key to my fossil, I'm sure of it. A raptor swallowed it on the road. Which one, I couldnae tell ye; they all look guilty." },
      },
      choices = {
        { text = "I'll find your stone.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "You want me to search raptor guts?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    fossil = {
      lines = {
        { id = "fo_default", text = "I showed it at the League's conference in Ironforge an' said there was power in it. Half the hall laughed. Whelgar didnae, an' he's got the original at the dig." },
      },
      choices = {
        { text = "Why did they laugh?", next = "fossil_laugh" },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    fossil_laugh = {
      lines = {
        { id = "fl_default", text = "Because I said 'power' instead o' 'interestin'', an' because I'd had two ales. Lesson learned. One ale." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    league = {
      lines = {
        { id = "lg_default", text = "League! Then ye know the creed: find it, note it, dinnae lick it. Who signed yer papers in the Hall?" },
      },
      choices = {
        { text = "High Explorer Magellas.", next = "BACK", fx = { affinity = 2, learn = { "explorers_league" } } },
        { text = "I'd rather not say.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    elf = {
      lines = {
        { id = "el_default", text = "Aye, an' ye won't let us near them! Ach, I'm teasin'. Mostly. How old, would ye say? Roughly?" },
      },
      choices = {
        { text = "Older than your kingdom.", next = "BACK", fx = { affinity = 1 } },
        { text = "We don't count that way.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Explorers' League, field archaeologist, presently stranded. Put that on my stone when I go." } },
    advice = { { id = "tp_ad", text = "Never carry yer best find in an open pack on a raptor road. Ask me how I know.", next = "stone" } },
    explorers_league = { { id = "tp_league", text = "Best job in the world, when ye're no' stuck in a tavern. Which I am." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "Orcs in the hills east o' the dig. I wrote to Ironforge. Ironforge wrote back to say there are orcs in the hills." } },
    _none = { { id = "tp_none", text = "If it's no' buried, I'm the wrong dwarf." } },
  },
}

P:NPC {
  key = "mikhail", id = TODO_NPC("Mikhail"), name = "Mikhail",
  bible = "bibles/menethil.md", role = "citizen", tier = "quest",
  communities = { "menethil" }, temper = { "watchful" }, values = { "loyal", "discreet" },
  notices = { "stealth", "drink" },

  greetings = {
    { id = "g_bar", text = "Evening. Before you ask, no, I don't sell drinks. Helbrek does. I just stand here." },
    { id = "g_back", when = { metBefore = true }, text = "Back. Good. Sit where you can see the door. Everyone should." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You came in quiet. I noticed. I'd have noticed louder, too, but quiet I notice more." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You've been drinking. Not from me. I'd have remembered." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mikhail. I used to work in Stormwind. Now I keep a bar I don't sell from, in a town where nothing happens. I like it that way. Mostly." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "Elling's business? Then it's serious, and it's quiet. Lean in. And if things get lively in here, step back and give it a moment." },
        { id = "h_elling", when = { heardLine = "elling.h_default" },
          text = "So Elling's found you, and his cheese. How is he? Don't tell him I asked. He'd take it as an invitation." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Busiest hour. Nobody in here is doing anything wrong. That's what I tell myself, and then I keep watching." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep it low." },
        { id = "h_again2", text = "Go on. Eyes on the door while you talk, if you don't mind." },
      },
      choices = {
        { text = "Why don't you sell drinks?", next = "drinks" },
        { text = "What did you do in Stormwind?", next = "past" },
        { text = "Who's worth watching in here?", next = "room" },
        { text = "Elling sent me. What's this really about?", next = "diplomat", when = { questActive = TODO_QUEST("The Missing Diplomat") } },
        { text = "You've the eyes of someone in my trade.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    drinks = {
      lines = { { id = "d_default", text = "Behind a bar, a man can watch the whole room and nobody wonders why. A man in a corner, people wonder. I don't like being wondered about." } },
      choices = {
        { text = "Fair.", next = "BACK", fx = { affinity = 1 } },
        { text = "So who are you watching for?", next = "room" },
      },
    },
    past = {
      big = true,
      lines = {
        { id = "p_default", text = "This and that. The kind of work you retire from, if you're lucky. I was lucky. I'd like to stay lucky, so let's leave it there." },
      },
      choices = {
        { text = "Understood.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "Do you miss it?", next = "miss" },
      },
    },
    miss = {
      lines = { { id = "m_default", text = "Daily. Don't tell Elling." } },
      choices = {
        { text = "Why not tell him?", next = "miss_elling" },
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    miss_elling = {
      lines = {
        { id = "me_default", text = "Because he'd have me back in Stormwind by the end of the week, and I'd go. That's the trouble with old friends. They know which strings to pull." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    room = {
      lines = {
        { id = "rm_default", text = "Sailors who are sailors, sailors who aren't, and once a month a crowd of Kul Tiras marines in from Theramore with their pay. That's when I stand very still and listen." },
      },
      choices = {
        { text = "And the fellow upstairs?", next = "room_upstairs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    room_upstairs = {
      lines = {
        { id = "ru_default", text = "Samor Festivus. Sells poisons and calls himself a shady dealer, right there in his title. I respect a man who doesn't pretend." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    diplomat = {
      big = true,
      lines = {
        { id = "dp_default", text = "Whatever Elling told you, it's bigger than he said. He never sends anyone to me for small things. Talk low, and watch who's listening." },
      },
      choices = {
        { text = "You don't seem surprised.", next = "diplomat_calm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    diplomat_calm = {
      lines = {
        { id = "dc_default", text = "I'm never surprised. It's a professional habit. A retired one. Ask me again when this is over, and I might be." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    rogue = {
      lines = {
        { id = "rq_default", text = "Had. Retired eyes now. They still work, mind. Yours spent a long time on the stairs before they found me." },
      },
      choices = {
        { text = "Old habits.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Who trained you?", next = "rogue_trained" },
      },
    },
    rogue_trained = {
      lines = { { id = "rt_default", text = "Nobody you'd find. That was rather the point." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Retired from Stormwind. Took up a bar. I'd tell you more, but then we'd both be uncomfortable.", next = "past" } },
    advice = { { id = "tp_ad", text = "Sit where you can see the door. Hold a full mug, even if you never drink it. Nobody watches a man with a full mug." } },
    defias = { { id = "tp_defias", text = "Stormwind's trouble. I left it there. It keeps sending letters." } },
    _none = { { id = "tp_none", text = "Couldn't say. Wouldn't, either." } },
  },
}
