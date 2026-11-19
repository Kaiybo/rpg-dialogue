-- Magistrate Bluntnose: Thelsamar's magistrate, tired of waiting on Ironforge. Voice: bibles/bluntnose.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lm_bluntnose", id = TODO_NPC("Magistrate Bluntnose"), name = "Magistrate Bluntnose",
  bible = "bibles/bluntnose.md", role = "noble", tier = "quest",
  communities = { "thelsamar" }, temper = { "sharp", "proud" }, values = { "dutiful", "protective", "practical" },
  notices = { "soldier", "kit" },

  impression = {
    first = "He eyed me the way a quartermaster eyes a new axe.",
    third = "{name} met Magistrate Bluntnose, who keeps order in Thelsamar and hires blades when Ironforge's soldiers are slow to come.",
  },

  greetings = {
    { id = "g_hu_prej", when = { race = "Human" }, priority = 5,
      text = "A human! If ye're here for work, I'll pay ye when it's done, no' a copper before, an' if ye don't like that, the road tae Westfall's that way." },
    { id = "g_hu_soft", when = { race = "Human", npcFlagBefore = "bluntnose_human_soft" }, priority = 10,
      text = "Ah, the human who finished the job! Come in, take a seat; yer mark's the only clean one in my book." },
    { id = "o_orcs_pity", tags = { "news" }, when = { gossip = { topic = "orcs", stance = "pity" } },
      text = "Mountaineer Kadrell tells me ye've a soft word for the orcs in the camps. I'll thank ye no' tae repeat it at the Stoutlager, for I've enough fights on my ledger." },
    { id = "g_default", text = "I'm Magistrate Bluntnose. If ye've a complaint, take a number, an' if ye've an axe, come straight in." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, good. I've more trouble than hands, as usual." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' still no soldiers from Ironforge in all that time. Ye're a welcome sight, for ye at least came back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown into the sort o' blade I wish Ironforge would send me by the dozen." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Every second farmer in Thelsamar's told me what ye've done for them, an' a magistrate listens tae that sort o' thing. Ye've Thelsamar's thanks." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I've had a complaint about ye. I'll no' ask what happened, but I'll ask that it doesnae happen again." },
    { id = "g_ogres", when = { questActive = TODO_QUEST("Mercenaries") }, text = "The ogres are still campin' northeast o' the loch, I hear. Take friends, for they're big, an' there's a lot o' them." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, faction = "Alliance" },
      text = "Now that's a soldier's bearin'! Ye've no idea how good it is tae see one walk through my door who isnae askin' for directions tae Ironforge." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Yer armour's in pieces, friend. Morhan's forge is across the way, an' I'd rather ye mended it than bled on my floor." },
  },

  start = "hello",
  nodes = {
    -- Humans (human patch): wry view of humans; Persuade softener sets bluntnose_human_soft.
    hu_view = {
      lines = {
        { id = "huv_default", key = true,
          text = "I hire them, when they'll come, an' they're good wi' a blade an' bad wi' a ledger. Every human mercenary who's taken coin in Thelsamar has wanted payment in advance, an' half o' them went back tae Westfall before the work was done." },
        { id = "huv_human", when = { race = "Human" },
          text = "I hire yer kind when they'll come, an' ye're grand wi' a blade an' poor wi' a promise. Half the humans I've paid in advance went home before the work was done." },
      },
      choices = {
        { text = "Why hire humans at all, then?", next = "hu_view2" },
        { text = "Westfall's in a bad way, Magistrate. They had reasons.", next = "hu_view2" },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    hu_view2 = {
      big = true,
      lines = {
        { id = "huv2_default",
          text = "Because Ironforge's soldiers are slow tae come an' the troggs are quick, an' a human wi' a sword's better than no sword. I'll grant Westfall's a misery, an' I'll grant a short life makes a man hurry, but a contract's a contract whatever's burnin' back home." },
      },
      choices = {
        { text = "A contract is a contract. Those humans broke their word.", next = "BACK",
          reply = "Aye, an' I've got their marks in my book, every one, in case any o' them ever come back.",
          fx = { align = { honor = 1 }, opinion = { humans = "distrust" } } },
        { text = "They had families starving. Your contract can wait.", next = "BACK",
          reply = "Ye've a soft heart, an' I'll no' say it's wrong, but the troggs dinnae wait on families either.",
          fx = { align = { honor = -1 }, opinion = { humans = "respect" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x = {
      lines = {
        { id = "hux_default", key = true,
          text = "I pay humans last because I've learned tae, {g:lad|lass}. I've a whole page o' names in my book from Westfall an' Redridge, all paid in advance, an' I've seen about a third o' the work they were paid for." },
      },
      choices = {
        { text = "Pay me at the end, then. I'll prove the book wrong.", tag = "Persuade", next = "hu_x_soft",
          check = { pass = { any = { { disposition = { min = 50 } }, { class = { "WARRIOR", "PALADIN" } } } } },
          fail = { next = "hu_x_fail", fx = { affinity = -1 } } },
        { text = "Maybe they ran because you paid poorly, Magistrate.", next = "BACK",
          reply = "I pay fair, an' I'll have that on my stone when I'm buried. Watch yer tongue in my hall.", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x_soft = {
      lines = {
        { id = "huxs_default", key = true, fx = { npcFlag = { set = { "bluntnose_human_soft" } } },
          text = "At the end, no complaint? Well, that's a first, an' I'll write it down. Bring me ten trogg ears an' I'll write ye in my book as a dwarf's equal, which is as high a praise as Thelsamar gives." },
      },
      choices = {
        { text = "Ten trogg ears it is, Magistrate.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x_fail = {
      lines = {
        { id = "huxf_default", text = "Pretty words, an' I've heard them from every name on that page. Do the work first an' then we'll talk." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Farewell, Magistrate.", next = "END" },
      },
    },
    dw_kin = {
      lines = {
        { id = "dw_kin_default", text = "Aye, an' I'll know yer clan by yer beard braids if ye stand still long enough. Thelsamar's Bronzebeard tae the bone, but I've Wildhammer cousins in the Wetlands an' a grandmother who never once said a kind word about either lot." },
        { id = "dw_kin_wild", when = { origin = { "dwarf_wildhammer_kin", "dwarf_wildhammer_shaman" } }, text = "Ye've the look o' Aerie Peak about ye, an' a tattoo or two I'd no' show the King's tax man. Ye're welcome in Thelsamar all the same, for the troggs dinnae care which hammer a dwarf swears by." },
      },
      choices = {
        { text = "The clans should stand together. The old feud helps nobody now.", next = "BACK", reply = "Spoken like a magistrate, an' I wish more o' my petitioners thought so. I'll write it on the wall behind my desk, beside the list o' cattle thieves.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every clan minds its own. That's how it's always been.", next = "BACK", reply = "Aye, an' that's how we came tae three kingdoms an' a burnin' mountain. Still, I cannae fault ye for sayin' plainly what most dwarves think.", fx = { align = { order = -1 } } },
        { text = "Which clan gives you the most trouble?", next = "dw_kin2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    dw_kin2 = {
      lines = {
        { id = "dw_kin2_default", text = "The Dark Irons, an' it's no' close. Ironforge sent word that one o' their spies has been seen round the dam, which is why Kadrell's lookin' at every stranger like they owe him money." },
      },
      choices = {
        { text = "I'll keep an eye out for the spy.", next = "BACK" },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    dw_hist = {
      narr = "He sets down his quill and looks out the window toward the dam.",
      lines = {
        { id = "dw_hist_default", text = "Since before the War o' the Three Hammers, aye. When the clans fought over Ironforge's throne, this valley was the Bronzebeard larder, an' Loch Modan fed the army that drove the Dark Irons an' the Wildhammers out o' the mountain." },
      },
      choices = {
        { text = "And where did the losers go?", next = "dw_hist2" },
        { text = "A larder seems a humble job in a war.", next = "dw_hist3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dw_hist2 = {
      lines = {
        { id = "dw_hist2_default", text = "The Wildhammers went tae Grim Batol, an' the Dark Irons went south an' built their city under Thaurissan. Then the Dark Irons came back for us both, an' their sorcerer-king woke somethin' in the mountain that burned the south tae cinders. That's the Searin' Gorge, an' the Steppes, if ye've ever wondered." },
      },
      choices = {
        { text = "They brought it on themselves.", next = "BACK", reply = "They did, an' they're still payin' for it, the poor cursed devils. Doesnae stop me lockin' my door at night.", fx = { align = { light = -1 } } },
        { text = "Nobody deserves a fire like that, not even the Dark Irons.", next = "BACK", reply = "That's a softer heart than mine, friend, but it's no' a wrong one. There's children down there who never chose their king.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    dw_hist3 = {
      lines = {
        { id = "dw_hist3_default", text = "An army marches on its belly, an' a dwarf army marches on its belly an' its barrels. My great-grandsire salted mutton for the siege lines, an' he told it like he'd won the war single-handed." },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    opn_alliance = {
      lines = {
        { id = "opn_alliance_q", text = "Ye'd have me answer that wi' a Mountaineer in earshot? The King gave his word after the Second War, an' half our Reserve's off at the front keepin' it while my farmers count ogres. I've a ledger for everythin' but that, so ye tell me, is it worth it?" },
      },
      choices = {
        { text = "The Alliance took this mountain back for you. It's a debt.", next = "opn_alliance_r_loyal", fx = { align = { honor = 1 }, opinion = { alliance = "loyal" } } },
        { text = "Not while your own valleys bleed, Magistrate.", next = "opn_alliance_r_burden", fx = { affinity = 1, align = { honor = -1 }, opinion = { alliance = "burden" } } },
        { text = "Alone, Ironforge falls. Together, it only bleeds.", next = "opn_alliance_r_necessary", fx = { trait = { practical = 1 }, opinion = { alliance = "necessary" } } },
        { text = "Stormwind's never paid back a single debt to Lordaeron's people.", next = "opn_alliance_r_broken", when = { origin = "human_lordaeron_refugee" }, fx = { opinion = { alliance = "broken", stormwind = "distrust" } } },
        { text = "I'll leave the ledger to you, Magistrate.", next = "BACK" },
      },
    },
    opn_alliance_r = {
      lines = {
        { id = "opn_alliance_r_default", text = "Wise. Folk who settle that question tend tae end up on my desk as a complaint." },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    opn_alliance_r_loyal = {
      lines = {
        { id = "opn_alliance_r_loyal", text = "A debt, aye, an' we're payin' it in sons. I'll write ye down as a loyal sort, which is a fine thing tae be in Ironforge, an' a lonelier thing in Thelsamar." },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    opn_alliance_r_burden = {
      lines = {
        { id = "opn_alliance_r_burden", text = "Ye've said in one breath what I've been tryin' tae say tae Ironforge in three letters. Don't say it near Rugelfuss, mind; he's a captain, an' captains say 'Yes, my king.'" },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    opn_alliance_r_necessary = {
      lines = {
        { id = "opn_alliance_r_necessary", text = "Hmph. That's the answer o' someone who's never had tae pay for a funeral out o' a town fund. Still, I cannae say it's wrong." },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    opn_alliance_r_broken = {
      lines = {
        { id = "opn_alliance_r_broken", text = "Then ye've more cause tae grumble than me, an' I'll stop my grumblin' while ye're at the counter. Sit, if ye like; I've a chair for folk wi' worse ledgers." },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_hu_prej", when = { race = "Human", ["not"] = { npcFlagBefore = "bluntnose_human_soft" } },
          text = "Magistrate Bluntnose. I hire blades, an' I'll hire yers, but humans get paid on finish, for I've had too many o' yer kind take the coin an' run home." },
        { id = "h_hu_soft", when = { race = "Human", npcFlagBefore = "bluntnose_human_soft" },
          text = "Back again! I've written 'finishes the work' next tae yer name, which is more than I've written for any other human in Thelsamar." },
        { id = "h_alt_higher", when = { alt = { higher = true }, metBefore = false },
          text = "Ye'll forgive me starin', but ye've the look o' {alt}, a {altclass} who sorted out a deal o' trouble round the loch for me an' never once asked when the soldiers were comin'. If that's kin o' yers, Thelsamar's glad tae see the family again." },
        { id = "h_alt_any", when = { alt = true, metBefore = true }, cooldown = "5d",
          text = "{alt} stopped by my desk no' long ago, an' I set that one tae work just as I'll set ye. Between the pair o' ye, I might yet manage without Ironforge's soldiers." },
        { id = "h_default", key = true,
          text = "I'm Magistrate Bluntnose, an' Thelsamar's my charge, for my sins. I keep the peace, settle the quarrels an' write tae Ironforge for soldiers who never seem tae come." },
        { id = "h_merc_before", when = { questBefore = TODO_QUEST("Mercenaries"), minLevel = 17 },
          text = "Two months tae hear that Ironforge can spare us a handful o' soldiers, an' two more before they arrive! Meanwhile there's ogres camped by the loch, so I've no choice but tae hire arms, an' ye look a likely sort." },
        { id = "h_merc_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mercenaries"), days = 3 } },
          text = "The Mo'grosh are broken, an' I didnae have tae wait four months for it! Now we can turn our minds tae those Light-burnin' troggs, an' ye've my thanks an' the town's." },
        { id = "h_merc_later", when = { questLater = { TODO_QUEST("Mercenaries"), days = 7 } },
          text = "The farmers north o' the loch sleep with their shutters open again, since ye dealt wi' the ogres. A magistrate notices a thing like that." },
        { id = "h_choksul", tags = { "news" }, when = { questDone = TODO_QUEST("WANTED: Chok'sul") },
          text = "Chok'sul's head is off the poster an' off his shoulders, an' I signed the bounty myself, gladly. That ogre's been a curse on the north shore for a year." },
        { id = "h_warrior", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Now there's somethin' I can use, an' I've no' had tae write tae Ironforge for ye." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin. The Light's welcome in Thelsamar, an' so's the hammer that comes wi' it." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "I'll keep this short, for I've no quarrel I'd like tae start. State yer business an' be on yer way." },
      },
      again = {
        { id = "h_again", text = "What else? The ledger o' complaints isnae gettin' any shorter." },
        { id = "h_again2", text = "Go on, I'm listenin'. Mostly." },
      },
      choices = {
        { text = "What's wrong with Ironforge's soldiers?", next = "ironforge" },
        { text = "Who's causing trouble on the loch these days?", next = "ogres" },
        { text = "Thelsamar looks to have more than one trouble on its hands.", next = "threats" },
        { text = "What does a magistrate actually do here?", next = "duties" },
        { text = "The dam is vital. Who guards it?", next = "dam", when = { race = { "Dwarf", "Gnome" } } },
        { text = "You'll know the old clan quarrels, Magistrate. I'm a dwarf too.", next = "dw_kin", when = { race = "Dwarf" } },
        { text = "Has Thelsamar always been a Bronzebeard town?", next = "dw_hist" },
        { text = "What do you make of humans, Magistrate?", next = "hu_view" },
        { text = "You pay humans last because you don't trust us, Magistrate?", next = "hu_x", when = { race = "Human", ["not"] = { npcFlagBefore = "bluntnose_human_soft" } } },
        { text = "Good day, Magistrate.", next = "END" },
      },
    },

    ironforge = {
      big = true,
      lines = {
        { id = "if_default", text = "Nothin' wrong wi' them, when they arrive. The King's Mountaineers watch the roads an' the Valley o' Kings, which is right an' proper, but the town itself, the dig an' the dam are left wi' me an' a handful o' farmers." },
      },
      choices = {
        { text = "Then Ironforge is failing you.", next = "ironforge_more" },
        { text = "The King has a whole kingdom to guard. Be patient.", next = "BACK", reply = "Patient? I've been patient since the last harvest, an' patience doesnae mend a wall. But aye, the King's got troubles enough, I'll grant ye.", fx = { align = { order = 1 } } },
        { text = "Then hire your own and stop asking.", next = "BACK", reply = "Wi' what? The town's coffers wouldnae hire a goat. If ye know a guard who works for porridge, send him tae me.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ironforge_more = {
      lines = {
        { id = "ifm_default", text = "I'd no' say failin', no' where Captain Rugelfuss or any o' his Mountaineers could hear me. I'd say it's a long way from the Great Forge tae Thelsamar, an' letters get slower the further south they travel." },
        { id = "ifm_warm", when = { disposition = { min = 65 } },
          text = "Between us, aye, it feels that way some days. Captain Rugelfuss does his best wi' what he's given, an' I'd no' say a word against him, but his best is out in the valley an' my door's right here." },
      },
      choices = {
        { text = "Is the Alliance worth what it costs Ironforge?", next = "opn_alliance" },
        { text = "Who's Captain Rugelfuss?", next = "rugelfuss" },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    rugelfuss = {
      lines = {
        { id = "ru_default", text = "He's captain o' the Mountaineers in the Valley o' Kings, holdin' back the Stonesplinter troggs wi' too few dwarves. He's a good soldier, an' if ye've a spare day, he'll find a use for it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } } },
    },

    ogres = {
      lines = {
        { id = "og_default", text = "The Mo'grosh ogres, camped on the northeast shore o' the loch, an' there's more o' them every month. They've brutes, enforcers an' a few that are just plain big, an' none o' them friendly." },
        { id = "og_done", when = { questDone = TODO_QUEST("Mercenaries") },
          text = "Fewer o' them now, thanks tae you, though ogres breed like rabbits an' fight like bears. Keep an eye on the north shore when ye pass." },
      },
      choices = {
        { text = "I'd guess the ogres want more from the loch than fish.", next = "ogres_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres_want = {
      lines = {
        { id = "ow_default", text = "Food, mostly, an' whatever else they can carry off. Their chief Chok'sul has his face on a poster by the League's door, an' I'll pay well tae see it taken down for the right reason." },
      },
      choices = {
        { text = "I'll bring him in.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    threats = {
      lines = {
        { id = "th_default", text = "Troggs in the hills, kobolds in the foothills, a Dark Iron spy creepin' about the dam an' ogres on the north shore. I could go on, but I'd only depress us both." },
      },
      choices = {
        { text = "Something must trouble you more than the rest.", next = "threats_most" },
        { text = "Something else.", next = "BACK" },
      },
    },
    threats_most = {
      big = true,
      lines = {
        { id = "tm_default", text = "The Stonewrought Dam. Troggs an' ogres kill a farmer here an' there, which is bad enough, but if the dam goes, Thelsamar goes wi' it, an' half the Wetlands after." },
      },
      choices = {
        { text = "Then guard the dam above all else.", next = "BACK", reply = "Aye, that's my thinkin' an' always has been. Stand on Stonewrought an' look down, an' ye'll understand why I cannae sleep.", fx = { align = { honor = 1 } } },
        { text = "Hunt the spy first. A dead spy guards the dam best.", next = "BACK", reply = "A dead spy, aye, if ye can find the beggar. But dinnae leave the dam bare while ye're lookin', or there'll be nothin' left tae guard.", fx = { align = { honor = -1 } } },
        { text = "Who guards the dam now?", next = "dam" },
      },
    },
    dam = {
      lines = {
        { id = "dm_default", text = "Chief Engineer Hinderweir an' his crew, an' a few Mountaineers when they can be spared. Hinderweir would hold it wi' his bare hands if he had tae, but I'd rather he didnae have tae." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "stonewrought_dam" } } } },
    },

    duties = {
      lines = {
        { id = "du_default", text = "Settle who owns which goat, fine whoever started the fight at the Stoutlager, an' make sure the bounty board's paid. It's dull work, but a town without it falls apart faster than ye'd think." },
      },
      choices = {
        { text = "I'd wager it's the miners who start most of the fights.", next = "duties_fights" },
        { text = "Something else.", next = "BACK" },
      },
    },
    duties_fights = {
      lines = {
        { id = "df_default", text = "Miners, after a long week, an' usually over a lass at the bar or a lode in the hills. Innkeeper Hearthstove throws them out an' I fine them in the mornin', which is how Thelsamar keeps the peace." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Every quarrel in Thelsamar reaches my table sooner or later, an' every rumour along wi' it. Ask." } },
    background = { { id = "tp_bg", text = "I've been magistrate here long enough tae remember when Thelsamar had more sheep than troubles." } },
    advice = { { id = "tp_ad", text = "Don't wait for help that's been promised, friend. Hire it, or be it." } },
    stonewrought_dam = { { id = "tp_dam", text = "The Stonewrought Dam's the most important wall in Khaz Modan, an' Ironforge sends me two guards for it.", next = "dam" } },
    dark_iron = { { id = "tp_di", text = "There's a poster about a Dark Iron spy by the League's door, an' Mountaineer Kadrell's watchin' the road for him. I'll sleep easier when he's in irons." } },
    _none = { { id = "tp_none", text = "No' a matter for the magistrate, friend. Try the inn, for they know everythin' I don't." } },
    magni = { { id = "tp_magni", text = "King Magni sends tae Thelsamar when it suits him, which is rarely. He's a fine king, but Loch Modan's a long way from the High Seat." } },
    second_war = { { id = "tp_second_war", text = "The orcs came through Loch Modan in the Second War an' burned the valley tae the water's edge. We rebuilt, an' I'll see we never need tae again." } },
    scourge = { { id = "tp_scourge", text = "Folk at the Stoutlager say the Scourge'll come down through the Thandol Span someday. I tell them that's what Menethil's for, an' I hope I'm right." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I wrote tae the Darkmoon Faire askin' them tae come tae Thelsamar. They said the road's too steep for their wagons, an' I said they've never tried." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer are kin, whatever Ironforge says, an' they've been good friends tae Thelsamar. Their riders stop here now an' then, an' they drink like a whole regiment." } },
  },
}
