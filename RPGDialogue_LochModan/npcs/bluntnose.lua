-- Magistrate Bluntnose: Thelsamar's magistrate, tired of waiting on Ironforge. Voice: bibles/bluntnose.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lm_bluntnose", id = TODO_NPC("Magistrate Bluntnose"), name = "Magistrate Bluntnose",
  bible = "bibles/bluntnose.md", role = "noble", tier = "quest",
  communities = { "thelsamar" }, temper = { "sharp", "proud" }, values = { "dutiful", "protective", "practical" },
  notices = { "soldier", "kit" },

  impression = {
    first = "Magistrate Bluntnose runs Thelsamar and has given up waiting on Ironforge to defend it. He hires whoever looks capable, and he looked at me the way a quartermaster looks at a new axe.",
    third = "{name} met Magistrate Bluntnose, who keeps order in Thelsamar and hires blades when Ironforge's soldiers are slow to come.",
  },

  greetings = {
    { id = "o_orcs_pity", tags = { "news" }, when = { gossip = { topic = "orcs", stance = "pity" } },
      text = "Kadrell tells me ye've a soft word for the orcs in the camps. I'll thank ye no' tae repeat it at the Stoutlager, for I've enough fights on my ledger." },
    { id = "g_default", text = "Magistrate Bluntnose. If ye've a complaint, take a number, an' if ye've an axe, come straight in." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, good. I've more trouble than hands, as usual." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' still no soldiers from Ironforge in all that time. Ye're a welcome sight, for ye at least came back." },
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
        { id = "h_alt_higher", when = { alt = { higher = true }, metBefore = false },
          text = "Ye'll forgive me starin', but ye've the look o' {alt}, a {altclass} who sorted out a deal o' trouble round the loch for me an' never once asked when the soldiers were comin'. If that's kin o' yers, Thelsamar's glad tae see the family again." },
        { id = "h_alt_any", when = { alt = true, metBefore = true }, cooldown = "5d",
          text = "{alt} stopped by my desk no' long ago, an' I set that one tae work just as I'll set ye. Between the pair o' ye, I might yet manage without Ironforge's soldiers." },
        { id = "h_default", key = true,
          text = "Magistrate Bluntnose, an' Thelsamar's my charge, for my sins. I keep the peace, settle the quarrels an' write tae Ironforge for soldiers who never seem tae come." },
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
        { text = "The King has a whole kingdom to guard. Be patient.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then hire your own and stop asking.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
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
        { id = "ru_default", text = "Captain o' the Mountaineers in the Valley o' Kings, holdin' back the Stonesplinter troggs wi' too few dwarves. He's a good soldier, an' if ye've a spare day, he'll find a use for it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } } },
    },

    ogres = {
      lines = {
        { id = "og_default", text = "The Mo'grosh, camped on the northeast shore o' the loch, an' there's more o' them every month. Brutes, enforcers an' a few that are just plain big, an' none o' them friendly." },
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
        { id = "tm_default", text = "The dam. Troggs an' ogres kill a farmer here an' there, which is bad enough, but if the dam goes, Thelsamar goes wi' it, an' half the Wetlands after." },
      },
      choices = {
        { text = "Then guard the dam above all else.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Hunt the spy first. A dead spy guards the dam best.", next = "BACK", fx = { align = { honor = -1 } } },
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
    stonewrought_dam = { { id = "tp_dam", text = "The most important wall in Khaz Modan, an' Ironforge sends me two guards for it.", next = "dam" } },
    dark_iron = { { id = "tp_di", text = "There's a poster about him, an' Kadrell's watchin' the road. I'll sleep easier when he's in irons." } },
    _none = { { id = "tp_none", text = "No' a matter for the magistrate, friend. Try the inn, for they know everythin' I don't." } },
    magni = { { id = "tp_magni", text = "King Magni sends tae Thelsamar when it suits him, which is rarely. He's a fine king, but Loch Modan's a long way from the High Seat." } },
    second_war = { { id = "tp_second_war", text = "The orcs came through Loch Modan in the Second War an' burned the valley tae the water's edge. We rebuilt, an' I'll see we never need tae again." } },
    scourge = { { id = "tp_scourge", text = "Folk at the Stoutlager say the Scourge'll come down through the Thandol Span someday. I tell them that's what Menethil's for, an' I hope I'm right." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I wrote tae the Darkmoon Faire askin' them tae come tae Thelsamar. They said the road's too steep for their wagons, an' I said they've never tried." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer are kin, whatever Ironforge says, an' they've been good friends tae Thelsamar. Their riders stop here now an' then, an' they drink like a whole regiment." } },
  },
}
