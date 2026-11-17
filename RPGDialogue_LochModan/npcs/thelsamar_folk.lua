-- More of Thelsamar: Ghak Healtouch the healer, Torren Squarejaw of the Explorers' League,
-- Bailor Stonehand the old weaponsmith, and Brock Stoneseeker the mining trainer.
-- Voices: bibles/thelsamar_folk.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Ghak Healtouch: Thelsamar's healer, who wants Badlands reagents for his remedies.
P:NPC {
  key = "lm_ghak", id = TODO_NPC("Ghak Healtouch"), name = "Ghak Healtouch",
  bible = "bibles/thelsamar_folk.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "gruff", "warm" }, values = { "kind", "practical" },
  notices = { "weary", "kit", "priest" },

  impression = {
    first = "Ghak Healtouch patches up Thelsamar's miners and Mountaineers with salves that smell worse than the wounds. He scolds every patient and then treats them gently, and he seemed to think I'd be back on his table soon.",
    third = "{name} met Ghak Healtouch, the gruff healer of Thelsamar, who brews his remedies from things most folk would rather not touch.",
  },

  greetings = {
    { id = "g_default", text = "Sit down before ye fall down. Ghak Healtouch, an' if ye're bleedin', bleed on the floor an' no' the bandages, for they're clean." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' still in one piece, I see. That's more than I can say for most o' my regulars." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away} an' no' a scratch on ye that I can see. Either ye're careful or ye've been seein' another healer, an' I'll no' ask which." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've toughened up since last time, I can see it in how ye stand. Good, for the Badlands take soft folk apart." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Half my patients this month mentioned ye kindly, which is rare, for my patients mostly complain." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Look at the state o' ye! Yer armour's in ribbons an' I'll wager the skin underneath isnae much better, so sit still an' let me look." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A priest, eh? Ye'll mend a wound faster than me wi' a prayer, but I'll wager my poultice smells more honest." },
    { id = "n_kit", cat = "kit", when = { class = { "WARRIOR", "ROGUE" }, minLevel = 30 },
      text = "Ye've the scars o' someone who's been past the Badlands gate, I'd say. I can tell a gorge cut from a trogg bite at ten paces." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ghak Healtouch, an' I keep Thelsamar's miners an' Mountaineers stitched together. Trogg bites, kobold burns, ogre bruises an' the odd fool who sat on a blastpowder barrel wi' a pipe lit, I've seen them all this year." },
        { id = "h_reagent_before", when = { questBefore = TODO_QUEST("Badlands Reagent Run"), minLevel = 33 },
          text = "Ye've the look o' someone who could cross intae the Badlands an' come back. My shelves are near empty o' the things I cannae find on this side o' the mountains, so I could use a pair o' sturdy hands." },
        { id = "h_reagent_active", tags = { "news" }, when = { questActive = TODO_QUEST("Badlands Reagent Run") },
          text = "Have ye got them yet? Buzzard gizzards, mind, an' fresh ones, for a dried gizzard's worth less than the bird's opinion o' ye." },
        { id = "h_reagent_done", when = { questRecent = { TODO_QUEST("Badlands Reagent Run"), days = 3 } },
          text = "My pots are bubblin' again, thanks tae you! The whole shop stinks like a tanner's cellar, which means the remedies are workin'." },
        { id = "h_low", when = { maxLevel = 15 },
          text = "Ye're green yet, so here's free advice: dinnae fight troggs in pairs, dinnae drink the loch water an' dinnae eat Vidra's sausages on an empty stomach." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, an' a sturdy one. Yer kind heals fast an' complains slow, which makes ye my favourite patients." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Mind yer head on the shelf, or rather, ye won't need tae. Ye're the first patients I've had who didnae need a stool tae reach the cot, ha!" },
        { id = "h_human", when = { race = "Human" },
          text = "A human, is it? Ye bleed easier than a dwarf, so I'll go gentler wi' the needle." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, for there's a miner in the back wi' a pick through his boot." },
        { id = "h_again2", text = "Anythin' more? Hold still while ye think, I'm lookin' at that cut on yer arm." },
      },
      choices = {
        { text = "What do you need from the Badlands?", next = "reagents" },
        { text = "Who do you treat most often?", next = "patients" },
        { text = "How did you learn healing?", next = "learn" },
        { text = "What's the worst wound you've seen this year?", next = "worst" },
        { text = "I could pray over your patients.", next = "xpriest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I brew potions myself. Want to compare notes?", next = "xalch", when = { profession = { name = "Alchemy", min = 1 } } },
        { text = "Good day, Ghak.", next = "END" },
      },
    },

    reagents = {
      lines = {
        { id = "rg_default", text = "Gizzards from the buzzards that circle the Badlands, an' a few other bits that only grow or crawl where it's hot an' dry. Ground right, they make a paste that draws poison out o' a wound faster than anythin' that grows by the loch." },
        { id = "rg_low", when = { maxLevel = 30 },
          text = "Things from the Badlands, past the Valley o' Kings an' through the southern gate, an' I'll no' send ye there yet. Come back when ye've a few more scars, an' I'll tell ye what I need." },
      },
      choices = {
        { text = "Why not use what grows here?", next = "reagents_why" },
        { text = "Is the Badlands that dangerous?", next = "badlands" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reagents_why = {
      lines = {
        { id = "rw_default", text = "Because the loch's herbs are fine for a cough or a bruise, but a trogg's bite festers like nothin' natural. Somethin' in the deep ground gets intae the wound, an' it takes somethin' just as stubborn tae draw it back out." },
      },
      choices = {
        { text = "Something in the deep ground?", next = "reagents_deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reagents_deep = {
      lines = {
        { id = "rd_default", text = "Dinnae ask me what, for I'm a healer an' no' a scholar. All I know is the bites from the excavation troggs go green faster than the ones from the Valley, an' the League's diggers are the ones who come tae me sweatin' an' seein' things." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } } },
    },
    badlands = {
      lines = {
        { id = "bl_default", text = "Dry as a dead dwarf's tankard an' twice as unfriendly. There's ogres, Dark Irons, buzzards that'll eat ye before ye've finished dyin' an' dragons in the far east, if the rumours have it right." },
      },
      choices = {
        { text = "And you'd send me there for gizzards?", next = "badlands_send" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    badlands_send = {
      big = true,
      lines = {
        { id = "bs_default", text = "I'd send ye there for the miner who'd lose his leg without them. That's the trade, friend: somebody bleeds in the Badlands so somebody else doesnae bleed out in Thelsamar." },
      },
      choices = {
        { text = "That's a fair trade. I'll bleed for them.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Only if I'm paid for it. Nobody bleeds for free.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    patients = {
      lines = {
        { id = "pt_default", text = "Diggers from Ironband's camp, mostly, an' the Mountaineers off the Valley o' Kings. The diggers come in scared an' the Mountaineers come in laughin', an' I'm no' sure which worries me more." },
      },
      choices = {
        { text = "Why do the Mountaineers laugh?", next = "patients_laugh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    patients_laugh = {
      lines = {
        { id = "pl_default", text = "Because they're Mountaineers, an' a Mountaineer who stops laughin' is one who's seen too much. Captain Rugelfuss sends me the ones who've gone quiet, an' I give them a cot an' a bottle an' let them sleep." },
        { id = "pl_warm", when = { disposition = { min = 65 } },
          text = "Because they're Mountaineers. I'll tell ye a thing, though: the bottle I give the quiet ones is cold tea. They sleep just the same, an' they wake up wi'out a sore head." },
      },
      choices = {
        { text = "That's a kind lie, Ghak.", next = "BACK", fx = { affinity = 1 }, when = { disposition = { min = 65 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    learn = {
      lines = {
        { id = "ln_default", text = "From my mother, who mended the dam crews when the Stonewrought was new, an' from the Second War, when there were more wounded on the loch than there were healers. Ye learn quick when the alternative is buryin' them." },
      },
      choices = {
        { text = "You were here when the orcs came?", next = "learn_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn_war = {
      big = true,
      lines = {
        { id = "lw_default", text = "Aye, a young fool wi' a bag o' bandages. The Horde came over the hills an' took the loch, an' their catapults are still lyin' on the bottom where we sank them. I mended dwarves an' I mended a few orcs, for a wound doesnae wear a banner." },
        { id = "lw_horde", when = { faction = "Horde" },
          text = "Aye, an' I mended some o' your sort too, for a wound doesnae wear a banner. Dinnae make me regret tellin' ye that." },
      },
      choices = {
        { text = "Healing the enemy is the mark of a good healer.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every orc you mended killed dwarves later.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    worst = {
      lines = {
        { id = "ws_default", text = "A Mountaineer brought down from the north ridge wi' an ogre's club print on his chest, clear as a seal on a letter. He lived, mind, an' he's back on the ridge, which proves the Mountaineers are harder than my good sense." },
      },
      choices = {
        { text = "The Mo'grosh are that strong?", next = "worst_ogres" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst_ogres = {
      lines = {
        { id = "wo_default", text = "Strong enough tae fold plate like parchment. If Bluntnose hires ye tae go after them, come see me first, an' come see me after, if ye can still walk." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xpriest = {
      big = true,
      lines = {
        { id = "xp_default", text = "Ye could, an' I'll no' stop ye, for the Light's welcome in here as long as it doesnae knock my bottles over. I'll say this, though: a prayer's no good on a wound that's still dirty." },
      },
      choices = {
        { text = "The Light and your salves together, then.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The Light doesn't need your salves, Ghak.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalch = {
      lines = {
        { id = "xa_default", text = "Ye're an alchemist, are ye? Then ye'll know a healin' draught's all very well in a fight, but it's the slow work after that keeps a limb on. I'll trade notes, if ye'll admit my poultice beats yer potion for a festerin' bite." },
      },
      choices = {
        { text = "Your poultice wins. My potions are for the fight.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Everyone in Thelsamar ends up on my cot sooner or later, an' they talk while I stitch. Ask." } },
    background = { { id = "tp_bg", text = "My mother mended the dam crews, an' I've mended everyone since. It's no' a glamorous trade." } },
    advice = { { id = "tp_ad", text = "Clean the wound before ye bind it, friend. More dwarves die o' dirt than o' troggs." } },
    troggs = { { id = "tp_troggs", text = "Their bites fester like nothin' natural, an' I'd like tae know why.", next = "reagents_deep" } },
    dark_iron = { { id = "tp_di", text = "I've stitched up Mountaineers who met them on the dam road. Nasty blades, an' they like tae poison them." } },
    _none = { { id = "tp_none", text = "That's no' a wound, so it's no' my business. Try the inn." } },
  },
}

-- Torren Squarejaw: the Explorers' League's field man in Thelsamar, Jern's opposite.
P:NPC {
  key = "lm_torren", id = TODO_NPC("Torren Squarejaw"), name = "Torren Squarejaw",
  bible = "bibles/thelsamar_folk.md", role = "scholar", tier = "service",
  communities = { "thelsamar" }, temper = { "eager", "chatty" }, values = { "curious", "proud" },
  notices = { "race", "origin" },

  impression = {
    first = "Torren Squarejaw would rather be in a hole in the ground than behind a desk, and tells everyone so. He talks about the old ruins round the loch the way other dwarves talk about ale.",
    third = "{name} met Torren Squarejaw of the Explorers' League, who longs for the dig while the League keeps him in Thelsamar.",
  },

  greetings = {
    { id = "g_default", text = "Torren Squarejaw, Explorers' League! If ye've come from anywhere interestin', I want tae hear all about it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Seen any ruins since last time? Any carvin's? Even a wee bit o' broken pot?" },
    { id = "g_league", when = { origin = "dwarf_explorers_league" }, text = "One o' the League's own! Tell me ye're headed tae the dig, for I'd give my beard tae go with ye." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Ye've the blood o' the old builders in ye, whatever they were, an' that's half the reason the League digs at all." },
    { id = "n_origin", cat = "origin", when = { origin = "dwarf_explorers_league" },
      text = "League dust in yer beard, I'd know it anywhere. Which dig? No, let me guess: ye've the sunburn o' the Badlands." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Torren Squarejaw, an' I'm meant tae be the League's field man in Loch Modan, though Jern keeps me in town carryin' letters. The whole valley's full o' things older than Ironforge, an' I spend my days sortin' the post." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! The League's always glad o' gnomes, for ye can fit in the narrow cuts an' ye know which end o' a contraption goes forward." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A night elf! Yer people remember things from before the world was broken, I hear, an' I'd love tae know what ye'd make o' our carvin's." },
      },
      again = {
        { id = "h_again", text = "What else? Ask me about ruins, for I'm sick tae the teeth o' talkin' about the post." },
      },
      choices = {
        { text = "What old things are in this valley?", next = "ruins" },
        { text = "Why does Jern keep you in town?", next = "jern" },
        { text = "What's the League after, really?", next = "league" },
        { text = "My people remember the ancient world.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Good luck with the post, Torren.", next = "END" },
      },
    },

    ruins = {
      lines = {
        { id = "ru_default", text = "Ironband's dig in the east, for one, an' the Valley o' Kings wi' its statues, an' half the islands in the loch have broken catapults on them from the Second War. Under all o' that, there's fitted stone nobody can explain." },
      },
      choices = {
        { text = "Who do you think built it?", next = "ruins_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins_who = {
      big = true,
      lines = {
        { id = "rw_default", text = "Dwarves, Ironforge says, an' they say it loud so nobody asks again. I say the stone's older than any dwarf clan has a name for, an' the League's job is tae find out, no' tae decide first." },
      },
      choices = {
        { text = "Follow the evidence, wherever it leads.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Ironforge's scholars know better than a field hand.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },

    jern = {
      lines = {
        { id = "jr_default", text = "Because somebody has tae, an' Jern's got the ledgers an' I've got the legs. He's a good dwarf, mind, an' he's no' wrong that the dig needs supplies more than it needs another dwarf wi' a trowel an' opinions." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    league = {
      lines = {
        { id = "lg_default", text = "The past o' the dwarven race, is the short answer, an' every scrap o' it we can find. The long answer takes a pint an' an evenin' at the Stoutlager, an' Hearthstove has heard it so often he hides when I start." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },

    xnelf = {
      lines = {
        { id = "xn_default", text = "Then ye'd be a treasure tae the League! Next time ye're near the dig, look at the carvin' on the fitted wall an' tell me if it puts ye in mind o' anythin'. I'll no' hold ye tae an answer." },
      },
      choices = {
        { text = "I'll look, though I promise nothing.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Ruins, carvin's, old roads an' older stories, that's my trade. Ask away." } },
    explorers_league = { { id = "tp_league", text = "The finest society in Ironforge, an' I'll fight anyone who says otherwise.", next = "league" } },
    _none = { { id = "tp_none", text = "No' my field, friend. Ask me about somethin' buried, an' I'll talk yer ears off." } },
  },
}

-- Bailor Stonehand: an old weaponsmith in Thelsamar who once taught Jordan Stilwell.
P:NPC {
  key = "lm_bailor", id = TODO_NPC("Bailor Stonehand"), name = "Bailor Stonehand",
  bible = "bibles/thelsamar_folk.md", role = "blacksmith", tier = "service",
  communities = { "thelsamar" }, temper = { "gruff", "proud" }, values = { "craft", "loyal" },
  notices = { "kit", "paladin" },

  impression = {
    first = "Bailor Stonehand judges people by their weapons and weapons by their balance. He spoke of an old apprentice with more pride than he let his face show.",
    third = "{name} met Bailor Stonehand, an old weaponsmith of Thelsamar who once trained Jordan Stilwell.",
  },

  greetings = {
    { id = "g_default", text = "Let me see yer weapon. No, dinnae tell me about it, just hand it over." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still carryin' that edge? I've seen worse, but no' this week." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ye've let yer gear go tae ruin, an' I'll no' pretend I didnae notice. Morhan'll mend it, for he's the one wi' the anvil lit these days." },
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "A paladin, wi' a hammer on yer belt. I taught a human lad tae forge hammers once, an' he went off tae Ironforge an' made a name for himself." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bailor Stonehand. I was weaponsmith in Thelsamar before Morhan had his beard, an' I've let him have the forge now my shoulders have gone. I still know a good blade when one walks past, an' I still say so." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior. Let me guess: ye've hacked troggs wi' that edge an' never once stopped tae hone it. I can see the nicks from here." },
      },
      again = {
        { id = "h_again", text = "What else? I've all day, which is the only good thing about bein' old." },
      },
      choices = {
        { text = "You trained an apprentice once?", next = "jordan" },
        { text = "What makes a good weapon?", next = "craft" },
        { text = "Why did you give up the forge?", next = "retire" },
        { text = "I'm training at the anvil myself.", next = "xsmith", when = { profession = { name = "Blacksmithing", min = 1 } } },
        { text = "Good day, Bailor.", next = "END" },
      },
    },

    jordan = {
      lines = {
        { id = "jd_default", text = "Jordan Stilwell, a human lad who came down from the north wi' more grief than sense, still mournin' a hammer he'd lost. I taught him tae work iron, an' now he's a smith in Ironforge wi' paladins at his door, an' I'm proud o' him, though I'll deny it." },
      },
      choices = {
        { text = "What hammer had he lost?", next = "jordan_hammer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jordan_hammer = {
      lines = {
        { id = "jh_default", text = "His father's, or the memory o' it. The real thing was left behind when his family fled the north, an' he never talked about it much, but he struck every hammer he made as if he were tryin' tae make that one again." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    craft = {
      big = true,
      lines = {
        { id = "cr_default", text = "Balance first, then the temper o' the steel, an' only then the edge. Most folk buy for the edge an' the shine, an' then wonder why their arm aches after ten swings." },
      },
      choices = {
        { text = "A plain weapon, well made, beats any fancy one.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A weapon is only as good as the one swinging it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    retire = {
      lines = {
        { id = "rt_default", text = "Forty years at the anvil does for a dwarf's shoulders what the troggs never could. Morhan's a good smith an' a better talker, an' between the two o' us we keep Thelsamar armed." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xsmith = {
      lines = {
        { id = "xs_default", text = "Are ye now? Then here's the only lesson worth payin' for: listen tae the steel when ye quench it. If it screams, ye've rushed it, an' no amount o' grindin' will fix what ye've done." },
      },
      choices = {
        { text = "I'll listen to it, Bailor.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know steel an' the folk who swing it. Ask about either." } },
    background = { { id = "tp_bg", text = "Forty years at the forge in Thelsamar, an' a few before that in Ironforge." } },
    _none = { { id = "tp_none", text = "That's no' about steel, so I've no opinion worth hearin'." } },
  },
}
