-- Shindigger's Camp: Rhapsody Shindigger, the grounded gryphon rider who brews, and his neighbour
-- Gilveradin Sunchaser, the high elf who deals in Hinterlands Honey Ripple. Voices: bibles/shindigger.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Rhapsody Shindigger: former Aerie Peak gryphon rider, now a moonshiner.
P:NPC {
  key = "hl_rhapsody", id = TODO_NPC("Rhapsody Shindigger"), name = "Rhapsody Shindigger",
  bible = "bibles/shindigger.md", role = "questgiver", tier = "quest",
  communities = { "shindigger_camp" }, temper = { "jovial", "chatty" }, values = { "friendly", "craft" },
  notices = { "drink", "mount" },

  impression = {
    first = "Rhapsody Shindigger was once the finest gryphon rider at Aerie Peak and is now the drunkest brewer in the Hinterlands. Under the hiccups there's a dwarf who misses the sky very badly.",
    third = "{name} met Rhapsody Shindigger, a Wildhammer gryphon rider turned moonshiner at his camp in the Hinterlands.",
  },

  greetings = {
    { id = "g_default", text = "Well, hello! Ye keep bobbin' up an' down, friend, so either stand still or have a drink an' bob along wi' me." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, hic, an' welcome back! Pardon the hiccups, they've been wi' me since breakfast." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, was it? Felt like an afternoon tae me, but then most things do." },
    { id = "g_kocktail", when = { questActive = TODO_QUEST("Rhapsody's Kalimdor Kocktail") }, text = "Roc gizzards from Tanaris, an' livers from Feralas, groddoc an' ironfur! Then I'll talk, I promise." },
    { id = "g_drunk", when = { drunk = true }, text = "Ye've had a few! Now we're seein' eye tae eye, or at least eye tae nose." },
  },

  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = true },
      text = "Is that my malt on yer breath? No? Then ye've been drinkin' somethin' inferior, an' I'm a wee bit hurt." },
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Ye rode in on that? I used tae ride a gryphon, friend, an' ye've no idea how small a horse looks from up there." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rhapsody Shindigger, brewer, an' once the finest gryphon rider Aerie Peak ever had, if I say so myself, an' I do. Did ye feel that just now? The ground's a-shakin', friend, so I need a drink." },
        { id = "h_sent", tags = { "news" }, when = { questActive = TODO_QUEST("Rhapsody Shindigger") },
          text = "Talonaxe sent ye, did he, hic? He let me go, ye know, but I don't hold it against him, for I'd have let me go too." },
        { id = "h_brohann", when = { questActive = TODO_QUEST("Rhapsody's Kalimdor Kocktail") },
          text = "So that crazy fool Brohann sent ye? My, we had quite an adventure, him an' me, an' if ye want tae hear what happened in that swamp, I'm gonna need somethin' stiff." },
        { id = "h_tale", tags = { "news" }, when = { questRecent = { TODO_QUEST("Rhapsody's Tale"), days = 5 } },
          text = "Ye took my troll souvenir tae Brohann? Good! He can keep it, for it gives me bad dreams, an' I've enough o' those from the swim." },
        { id = "h_wildhammer", when = { origin = "dwarf_wildhammer_kin" },
          text = "Wildhammer blood, I can tell! Ye'll know what it means for a rider tae lose his wings, so don't look at me like that." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, eh? Drink's drink an' coin's coin, an' I've never asked a customer his politics." },
      },
      again = {
        { id = "h_again", text = "What else, hic? Ask before I forget the question." },
        { id = "h_again2", text = "Go on, I'm listenin', mostly." },
      },
      choices = {
        { text = "Why did Aerie Peak let you go?", next = "grounded" },
        { text = "Something must have happened in the swamp.", next = "swamp" },
        { text = "Tell me about your brews.", next = "brews" },
        { text = "What's the elf next door selling?", next = "gilveradin" },
        { text = "I ride gryphons too, Rhapsody.", next = "rider", when = { origin = "dwarf_wildhammer_kin" } },
        { text = "Take care, Rhapsody.", next = "END" },
      },
    },

    grounded = {
      lines = {
        { id = "gr_default", text = "I took tae the liquor like a gryphon takes tae the sky, an' a rider who cannae stay in the saddle is a danger tae his bird. Talonaxe had nae choice, an' I've told him so, though I was drunk when I told him." },
      },
      choices = {
        { text = "You must miss flying.", next = "grounded_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grounded_miss = {
      big = true,
      lines = {
        { id = "gm_default", text = "Every mornin' I wake up an' look at the sky, an' every mornin' I have a drink tae stop lookin'. No one could fly like Rhapsody, they used tae say, an' now they say it in a different voice." },
        { id = "gm_warm", when = { disposition = { min = 65 } },
          text = "More than I can say sober, friend, which is why I'm never sober. My bird's still up at the Peak, an' I hear she won't take another rider, an' that's the worst o' it." },
      },
      choices = {
        { text = "Put down the bottle. The sky will wait.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then brew. Every dwarf needs a calling.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    swamp = {
      lines = {
        { id = "sw_default", text = "Before the flight I drank a whole keg o' stout, an' what a flight it was, zippin' over the Swamp o' Sorrows wi' Brohann behind me. I didnae see any temple, mind, till I got a wee bit tipsy an' fell off my mount." },
        { id = "sw_before", when = { questBefore = TODO_QUEST("Rhapsody's Tale") },
          text = "It wasnae a pretty scene, an' I'll no' tell it dry. Bring me what I need for a Kalimdor Kocktail, an' I'll tell ye all about it." },
      },
      choices = {
        { text = "You fell off? Then what?", next = "swamp_fell", when = { questDone = TODO_QUEST("Rhapsody's Kalimdor Kocktail") } },
        { text = "What goes into a Kalimdor Kocktail?", next = "brews" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swamp_fell = {
      lines = {
        { id = "sf_default", text = "Plunged right intae the water an' got sucked down, an' found myself surrounded by a lot o' creepy trolls in a sunken temple. I swam out o' there faster than I've ever flown, an' I made off wi' a troll souvenir besides." },
      },
      choices = {
        { text = "That temple is real, then.", next = "swamp_temple" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swamp_temple = {
      lines = {
        { id = "st_default", text = "Real as this cup, an' it's down there under the swamp, an' those trolls were singin' tae somethin' I'd rather no' meet. Brohann's welcome tae it; I've stuck tae dry land since." },
      },
      choices = { { text = "Something else, Rhapsody.", next = "BACK" } },
    },

    brews = {
      lines = {
        { id = "br_default", text = "Rhapsody Malt's my finest, an' the Thunderbrews use it for their ales, so ye've likely tasted it without knowin'. The Kalimdor Kocktail's a different beast: roc gizzards an' groddoc an' ironfur livers, an' it'll make a troll talk." },
      },
      choices = {
        { text = "Livers and gizzards seem an odd thing to put in a drink.", next = "brews_livers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brews_livers = {
      lines = {
        { id = "bl_default", text = "Aye, an' don't knock it till ye've tried it! It's no' for flavour, mind, it's for the kick, an' the kick is considerable." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    gilveradin = {
      lines = {
        { id = "gi_default", text = "Gilveradin? Honey ripple, he calls it, or rather he sells the bottles an' some orc in Orgrimmar fills them. He talks like a book an' drinks like a dwarf, an' I've never had a better neighbour." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    rider = {
      lines = {
        { id = "ri_default", text = "Do ye now? Then give my regards tae the Peak, an' tell my bird I'm well, even if it's a lie. An', hic, don't fly drunk, for that's the one lesson I can teach ye." },
      },
      choices = {
        { text = "I'll tell her, Rhapsody.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know brewin' an' flyin', an' a wee bit about sunken temples. Ask, an' I'll answer, though maybe no' in order." } },
    background = { { id = "tp_bg", text = "Gryphon rider o' Aerie Peak, retired, involuntarily. Brewer, voluntarily." } },
    advice = { { id = "tp_ad", text = "Never fly on a full keg o' stout. I'm the cautionary tale." } },
    wildhammer = { { id = "tp_wildhammer", text = "I was the finest rider in all o' Aerie Peak once, an' now I'm the finest brewer in the Hinterlands, or the drunkest, dependin' who ye ask. Either way I still look up every time a gryphon goes over." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay rum's near as good as my brew, an' I'll no' say that sober. I'd fly down an' fetch a barrel if anybody would still lend me a gryphon." } },
    magni = { { id = "tp_magni", text = "Magni's a fine dwarf fer a Bronzebeard, but he's never tasted my brew, an' that's a gap in his education. I'd send him a barrel if I could stop drinkin' it long enough tae seal one." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, friend, hic. Ask Gilveradin, he's read every book there is." } },
  },
}

-- Gilveradin Sunchaser: high elf neighbour, purveyor of Hinterlands Honey Ripple packaging.
P:NPC {
  key = "hl_gilveradin", id = TODO_NPC("Gilveradin Sunchaser"), name = "Gilveradin Sunchaser",
  bible = "bibles/shindigger.md", role = "questgiver", tier = "quest",
  communities = { "shindigger_camp" }, temper = { "proud", "dry" }, values = { "cunning", "profit", "friendly" },
  notices = { "drink", "race" },

  impression = {
    first = "Gilveradin Sunchaser is a high elf who sells bottles of Hinterlands Honey Ripple, or rather the empty bottles that make cheap ripple look like the real thing. He speaks like a scholar and schemes like a goblin, and seems to enjoy both.",
    third = "{name} met Gilveradin Sunchaser, a high elf of refined speech and flexible scruples near Shindigger's Camp.",
  },

  greetings = {
    { id = "g_default", text = "Good day to you. I trust your arrival portends business of a liquid nature?" },
    { id = "g_back", when = { metBefore = true }, text = "You return, and on foot, which suggests you have not yet sampled Rhapsody's wares." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the ripple has only improved in your absence, as the best things do." },
    { id = "g_sticky", when = { questActive = TODO_QUEST("A Sticky Situation") }, text = "The crates lie about the abandoned Horde base at Skulk Rock. Mind the oozes, and mind the bottles even more." },
  },

  notice = {
    { id = "n_drink", cat = "drink", when = { drunk = true },
      text = "You are in your cups, I perceive. Rhapsody's malt, or something coarser? Either way, you have my sympathy and my admiration." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A kaldorei, so far from your forests! Do not look at me so; I share a taste for good drink with your people, if little else." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gilveradin Sunchaser, at your service, a connoisseur of the finer things and a merchant of their appearance. I trouble myself little with kings and flags, for a good bottle has no faction." },
        { id = "h_ripple", tags = { "news" }, when = { questActive = TODO_QUEST("Ripple Recovery") },
          text = "Dran Droffers seeks ripple, does he? I possess the original packaging, and I shall assist you, for a fee of two additional bottles, naturally." },
        { id = "h_sticky_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Sticky Situation"), days = 3 } },
          text = "Finely executed, and you did not bruise the delicacy of the ripple, for which I commend you. Our little chicanery shall turn these bottles into an alcoholic treasure of the ages." },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Ripple Delivery") },
          text = "Deliver yon barrel to Dran in his salvage emporium, and pray extend my warmest greetings to Malton. Tell him, should he ever thirst for fine drink and finer company, he would be welcome here." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "An emissary of the Horde! I have orcish friends in Orgrimmar, which shocks my kin no end, and I delight in shocking my kin." },
      },
      again = {
        { id = "h_again", text = "What else may I illuminate for you?" },
        { id = "h_again2", text = "Pray continue. I am at leisure, as ever." },
      },
      choices = {
        { text = "What exactly is Honey Ripple?", next = "ripple" },
        { text = "I hear you're friends with orcs.", next = "orcs" },
        { text = "Selling empty bottles sounds like a swindle.", next = "swindle" },
        { text = "What brings a high elf out here?", next = "here" },
        { text = "Shouldn't you be with the other elves at Quel'Danil?", next = "queldanil", when = { faction = "Alliance" } },
        { text = "Farewell, Gilveradin.", next = "END" },
      },
    },

    ripple = {
      lines = {
        { id = "ri_default", text = "A golden drink of the Hinterlands, sweet as summer and twice as dangerous, much prized by those who can afford it. Its bouquet is delicate, and there is nothing worse than ripple that has been jostled about needlessly." },
      },
      choices = {
        { text = "Who drinks it?", next = "ripple_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ripple_who = {
      lines = {
        { id = "rw_default", text = "Taverns in Orgrimmar, it seems, and anyone who wishes to appear more refined than they are. Dran Droffers stands to make five times my fee, I'm told, which I find admirable rather than offensive." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    orcs = {
      lines = {
        { id = "or_default", text = "Two of them, a father and son of the salvage trade, Dran and Malton Droffers. The father is abrasive and the son is charming, and between them they buy more ripple than the rest of Kalimdor." },
      },
      choices = {
        { text = "Your kin must disapprove.", next = "orcs_kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs_kin = {
      big = true,
      lines = {
        { id = "ok_default", text = "Vigorously, and at length, and in several dialects. The orcs burned our forests in the Second War, and I have not forgotten it, but neither am I obliged to refuse their gold until the end of time." },
      },
      choices = {
        { text = "Old wars shouldn't stop new trade.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Some debts can't be paid in gold.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    swindle = {
      big = true,
      lines = {
        { id = "sw_default", text = "A swindle is when the customer is disappointed, and no one has ever been disappointed by ripple. I merely provide the packaging, and what the buyer believes about its contents is a matter between him and his palate." },
      },
      choices = {
        { text = "It's dishonest, and you know it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Clever. The buyer's happy, the seller's rich.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    here = {
      lines = {
        { id = "he_default", text = "The air, the honey and the company, chiefly Rhapsody's, which is never dull. I found the courts of my people tiresome, and the Hinterlands are anything but." },
      },
      choices = {
        { text = "What do you make of Rhapsody?", next = "here_rhapsody" },
        { text = "Something else.", next = "BACK" },
      },
    },
    here_rhapsody = {
      lines = {
        { id = "hr_default", text = "A tragic figure with excellent malt, which is the best sort of tragic figure. I keep an eye on him, discreetly, for a dwarf who drinks like that ought to have someone watching." },
      },
      choices = { { text = "Something else, Gilveradin.", next = "BACK" } },
    },

    queldanil = {
      lines = {
        { id = "qd_default", text = "At the lodge, with the rangers and their earnest talk of duty and the old alliances? I visit when my supplies run short, and I leave when the lectures begin." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know drink and I know people, and the two are seldom far apart. Ask, and I shall endeavour to enlighten." } },
    background = { { id = "tp_bg", text = "A high elf of no particular allegiance, which my family considers a scandal and I consider a liberation." } },
    advice = { { id = "tp_ad", text = "Never jostle the ripple. In life, as in wine, patience is everything." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was a city of real scholarship once, and I'm told it's being rebuilt. I'd return, if the Kirin Tor would have me, and if the honey trade weren't so lucrative." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are fine mages, but they've no head for commerce. I've often thought I'd teach them a thing or two, if they'd only listen." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's goblins buy my bottles by the crate, and they sell them for triple. I admire their business sense, though I'd not say so in polite company." } },
    _none = { { id = "tp_none", text = "Alas, that lies beyond even my considerable learning. Rhapsody might know, if you catch him between drinks." } },
  },
}
