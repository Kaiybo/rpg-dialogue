-- Thorium Point's working end: Master Smith Burninate at the forge and Taskmaster Scrange at the job board. Voice: bibles/thoriumpoint_works.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Master Smith Burninate: the Brotherhood's smith and supplier; wants the fiery flux plans back from Maltorius.
P:NPC {
  key = "sg_burninate", id = TODO_NPC("Master Smith Burninate"), name = "Master Smith Burninate",
  bible = "bibles/thoriumpoint_works.md", role = "blacksmith", tier = "quest",
  communities = { "thorium_point" }, temper = { "gruff", "fierce" }, values = { "craft", "proud", "practical" },
  notices = { "race", "craft", "kit" },

  impression = {
    first = "Master Smith Burninate runs the Thorium Brotherhood's forge and hates Overseer Maltorius with a smith's patience: slowly, thoroughly and at high heat. He swears by the Firelord out of old habit and seems to enjoy how it makes people flinch.",
    third = "{name} met Master Smith Burninate, the Thorium Brotherhood's smith at Thorium Point.",
  },

  greetings = {
    { id = "g_default", text = "Burninate, master smith o' the Brotherhood, an' if ye're no' buyin', mind the sparks while ye stand there gawpin'." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, for I've a forge that eats flux faster than I can make it, an' you've legs." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' the forge never went cold once, which is more than I can say for my temper. What d'ye want?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've put on muscle since I saw ye last. Ye could swing a hammer now, I'd say, if ye'd ever the sense tae pick one up." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Point's been sayin' ye're useful. I'll decide that for myself, but it's a start." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! I can see the burn scars on yer forearms from here, an' they're the only references I trust." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ironforge, eh? Yer clan's smiths are fair, for surface work, but they've never stood at a forge wi' the mountain's own fire under it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state o' that kit! The Gorge has been chewin' on ye, an' I'll mend it, for a price, same as everythin' here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I keep the Brotherhood's forge an' sell what the Point needs, from nails tae ale, an' I mend what the Gorge breaks. What I cannae do is make fiery flux, for the plans for it were stolen by a traitor I'd dearly like tae see in a slag bucket." },
        { id = "h_flux", tags = { "news" }, when = { questActive = TODO_QUEST("What the Flux?") },
          text = "The plans are in the Slag Pit, near Maltorius himself, I'd wager, for he'd no' let them out o' his reach. Go down an' fetch them, an' if he's in yer way, all the better." },
        { id = "h_flux_done", when = { questDone = TODO_QUEST("What the Flux?") },
          text = "I've my plans back, an' the flux is comin' along, though it eats reagents like a dragon eats sheep. If ye've hides, iron or kingsblood tae spare, I'll trade for them." },
        { id = "h_maltorius", tags = { "news" }, when = { questDone = TODO_QUEST("WANTED: Overseer Maltorius") },
          text = "Maltorius is dead, they tell me, an' I'll drink tae it tonight, an' tomorrow, an' the day after. Ragnaros knows he had it comin'." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A Bronzebeard at my forge. Our grandfathers cut each other's throats over who made the better steel, an' I'm still right, but I'll sell ye a nail all the same." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, are ye? Coin's coin, an' yours is as good as Ironforge's. Better, some days, for ye don't haggle." },
      },
      again = {
        { id = "h_again", text = "What else? The bellows don't work themselves, an' the apprentice has wandered off again." },
        { id = "h_again2", text = "Ask, then, but stand clear o' the quench tub. It spits." },
        { id = "h_again3", text = "Go on. I'm listenin' wi' one ear; the other's on the forge." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What is fiery flux?", next = "flux" },
        { text = "Who's this traitor?", next = "maltorius" },
        { text = "Why swear by Ragnaros, of all names?", next = "oath" },
        { text = "What does the forge need now?", next = "supplies", when = { questDone = TODO_QUEST("What the Flux?") } },
        { text = "I'm a smith too. Teach me something.", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "Ironforge smiths are the best in Khaz Modan.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    flux = {
      lines = {
        { id = "fx_default", text = "A flux that lets ye work metals ye'd otherwise only spoil, the best kept secret our clan ever had. Every piece o' Dark Iron plate worth the name was forged wi' it, an' without it, the Brotherhood's just another lot o' smiths." },
      },
      choices = {
        { text = "Then why don't you know the recipe?", next = "flux_recipe" },
        { text = "What does the Brotherhood make with it?", next = "flux_make" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flux_recipe = {
      lines = {
        { id = "fr_default", text = "Because it was written down an' kept, no' carried in any one head, so no one smith could walk off wi' it. That was the plan, anyway, until Maltorius walked off wi' the paper." },
      },
      choices = {
        { text = "Secrets kept on paper always walk.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Writing it down was wise. One thief doesn't change that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flux_make = {
      lines = {
        { id = "fm_default", text = "Whatever the Brotherhood's friends will pay for, an' the Brotherhood has very few friends, so it pays tae be good. One day we'll make things no' even Ironforge can match, an' then we'll see who has friends." },
      },
      choices = {
        { text = "I'd like to be one of those friends.", next = "BACK", fx = { affinity = 1, standing = { thorium_point = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    maltorius = {
      big = true,
      lines = {
        { id = "ml_default", text = "Overseer Maltorius, who left our clan wi' the fiery flux plans an' went back tae the Dark Irons. He prized those plans above a pristine arcane crystal, an' I'd bet my anvil they bought him his promotion." },
        { id = "ml_dead", when = { questDone = TODO_QUEST("WANTED: Overseer Maltorius") },
          text = "Maltorius was one o' us once, which is the worst o' it. He's dead now, an' I'm glad, but I'd have liked tae ask him what the promotion was worth." },
      },
      choices = {
        { text = "Where would he keep the plans?", next = "maltorius_where" },
        { text = "Why would he go back?", next = "maltorius_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    maltorius_where = {
      lines = {
        { id = "mw_default", text = "In the Slag Pit, down in the Cauldron, close by himself, for he trusts the Dark Irons about as far as I trust him. Bring them back, an' if ye kick his teeth in while ye're there, so much the better." },
        { id = "mw_done", when = { questDone = TODO_QUEST("What the Flux?") },
          text = "In the Slag Pit, an' ye found them there, which proves I know the swine. I hope ye kicked his teeth in, too." },
      },
      choices = {
        { text = "I'll bring the plans back.", next = "BACK", fx = { affinity = 1 } },
        { text = "Revenge makes a poor smith's tool.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "His teeth will be the first thing I break.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    maltorius_why = {
      lines = {
        { id = "my_default", text = "Some dwarves cannae live without a master, an' freedom frightens them more than the whip. The Brotherhood's poor, an' cold some nights, an' Maltorius liked bein' warm an' feared more than he liked bein' free." },
      },
      choices = {
        { text = "Freedom's worth being poor for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A full belly under a strong master isn't nothing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    oath = {
      lines = {
        { id = "oa_default", text = "Because I spent half my life forgin' his weapons, an' I'll use his name however I please now. Every time I curse by it, I'm takin' a wee bit back, an' I like tae watch the surface folk flinch." },
      },
      choices = {
        { text = "Names have power. I'd stop, if I were you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Curse him all you like. He's earned it.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "What was it like, forging for him?", next = "oath_forge" },
      },
    },
    oath_forge = {
      lines = {
        { id = "of_default", text = "Hot, an' endless, an' no' a word o' thanks. Ye forge a blade an' it's taken away still glowin', an' ye never learn who it killed, an' after a while ye stop wonderin'." },
      },
      choices = {
        { text = "You stopped wondering, but you remembered.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "blackrock_depths" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "blackrock_depths" } } },
      },
    },

    supplies = {
      lines = {
        { id = "su_default", text = "Heavy leather, iron bars an' kingsblood, an' plenty o' each, for flux eats everythin' ye feed it. Skinners, miners an' herb-pickers, the lot o' ye can earn the Brotherhood's thanks one bundle at a time." },
      },
      choices = {
        { text = "Why kingsblood, of all things?", next = "supplies_kingsblood" },
        { text = "I'll bring what I can.", next = "BACK", fx = { affinity = 1, standing = { thorium_point = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_kingsblood = {
      lines = {
        { id = "sk_default", text = "It binds the heat, the plans say, an' don't ask me why a weed out o' some human's swamp does what good ore cannae. I follow the plans; I've stopped arguin' wi' them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xsmith = {
      lines = {
        { id = "xs_default", text = "Somethin' for free, ye mean? Here's one: quench in oil when ye want it tough an' water when ye want it hard, an' never confuse the two in front o' a Dark Iron, or he'll laugh at ye." },
        { id = "xs_high", when = { profession = { name = "Blacksmithing", min = 225 } },
          text = "Ye're past the lessons I'd give a stranger. Earn the Brotherhood's trust, an' there are plans in this forge ye'll never see in Ironforge." },
      },
      choices = {
        { text = "Secrets should be shared among smiths.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Trust first, then the plans. That's right.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd_default", text = "Ha! Say that again when ye've seen what comes off this anvil. Our grandfathers argued it wi' hammers, so I'll let my work argue it now, an' ye can tell me if ye're still sure." },
      },
      choices = {
        { text = "That's fair. Let the work speak.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll stay sure. Dark Iron work is cursed work.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know metal, an' I know the Dark Irons, an' I know who stole from me. Ask what ye like." } },
    background = { { id = "tp_bg", text = "Forged for the Firelord most o' my life, an' walked out wi' Oilfist when he said it was time." } },
    advice = { { id = "tp_ad", text = "Never trust a smith who won't show ye his scars." } },
    dark_iron = { { id = "tp_di", text = "My own blood, an' the most of them would hang me for leavin'. I'd return the favour." } },
    blackrock_depths = { { id = "tp_brd", text = "I worked those forges. Ye'll no' find me goin' back, no' for all the thorium in the mountain." } },
    _none = { { id = "tp_none", text = "If it cannae be hammered, I've no' an opinion on it. Ask Oilfist; he has opinions on everythin'." } },
  },
}

-- Taskmaster Scrange: acting taskmaster of the Brotherhood; posts the bounties and pays them out.
P:NPC {
  key = "sg_scrange", id = TODO_NPC("Taskmaster Scrange"), name = "Taskmaster Scrange",
  bible = "bibles/thoriumpoint_works.md", role = "questgiver", tier = "quest",
  communities = { "thorium_point" }, temper = { "dry", "brisk" }, values = { "practical", "cunning" },
  notices = { "kit", "race", "class" },

  impression = {
    first = "Taskmaster Scrange runs the Thorium Brotherhood's bounties and weighs a recruit's bloodied clothes to see whether the work was done. He was a slaver's taskmaster once, and he has kept the dry humour if not the whip.",
    third = "{name} met Taskmaster Scrange, who pays the Thorium Brotherhood's bounties at Thorium Point.",
  },

  greetings = {
    { id = "g_default", text = "Taskmaster Scrange, actin', an' I pay for work done, no' work promised. If ye've read the board, ye know what we want." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me look at ye: clean, so ye've no' done anythin' yet." },
    { id = "g_bloody", when = { questActive = TODO_QUEST("JOB OPPORTUNITY: Culling the Competition") }, text = "Come here an' stand on the scale, friend, clothes an' all. I'll be the judge o' how hard ye've worked." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' the board's grown a page longer in that time. Ye've some catchin' up tae do." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Torn tae ribbons, are ye? That's the look o' somebody who's been doin' my work, an' I approve." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A sneak, by the soft boots. Good, for half the work on that board wants doin' quietly." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ironforge, here for the Brotherhood's coin. I'll no' ask why if ye don't ask me what I did before." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The Brotherhood has enemies an' little time tae kill them, so we pay folk like you tae do it for us. I keep the bounties an' I pay them out, an' I've never yet paid for a lie." },
        { id = "h_cull", tags = { "news" }, when = { questActive = TODO_QUEST("JOB OPPORTUNITY: Culling the Competition") },
          text = "Fifteen taskmasters an' fifteen slavers, an' I'll know if ye've done it by the weight o' yer shirt. Off ye go, an' don't come back clean." },
        { id = "h_cull_done", when = { questDone = TODO_QUEST("JOB OPPORTUNITY: Culling the Competition") },
          text = "Fifteen pounds an' more o' blood an' worse on yer clothes, an' I've never seen the like. I've written it on the wall, an' nobody's beaten it since." },
        { id = "h_stolen", tags = { "news" }, when = { questActive = TODO_QUEST("STOLEN: Smithing Tuyere and Lookout's Spyglass") },
          text = "A smithin' tuyere an' a lookout's spyglass, both nicked by Dark Irons too jealous tae make their own. The steamsmiths by the Slag Pit have the one, an' the lookouts in the towers have the other." },
        { id = "h_stolen_done", when = { questDone = TODO_QUEST("STOLEN: Smithing Tuyere and Lookout's Spyglass") },
          text = "Burninate's got his tuyere back, an' the lookouts have their spyglass, an' everyone's pretendin' they never lost them. That's the Brotherhood all over." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, an' welcome; the board doesnae care what colour yer tabard is. Neither do I, so long as ye kill the right dwarves." },
      },
      again = {
        { id = "h_again", text = "What else? The board's no' gettin' shorter while we chat." },
        { id = "h_again2", text = "Ask, then. I'm paid by the bounty, no' by the hour, so make it quick." },
        { id = "h_again3", text = "Go on. Mind ye don't drip on my ledger." },
      },
      choices = {
        { text = "What work is there?", next = "board" },
        { text = "Why weigh people's clothes?", next = "weigh" },
        { text = "What did you do before the Brotherhood?", next = "before" },
        { text = "Who stole the tuyere and spyglass?", next = "stolen" },
        { text = "I'll find some work.", next = "END" },
      },
    },

    board = {
      lines = {
        { id = "bd_default", text = "Dark Iron taskmasters an' slavers in the Gorge, the ones who work our cousins tae death in the Cauldron, an' things that walk off from the Point wi'out askin'. The board says the rest, an' the board's in better hand than mine." },
      },
      choices = {
        { text = "Why call them 'the competition'?", next = "board_comp" },
        { text = "Do you free the slaves too?", next = "board_slaves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    board_comp = {
      lines = {
        { id = "bc_default", text = "Because that's what they are. They're taskmasters, an' I'm a taskmaster, an' the Gorge only has room for so many, so I'd like them gone an' my prices up." },
      },
      choices = {
        { text = "So it's just business to you?", next = "board_business" },
        { text = "Something else.", next = "BACK" },
      },
    },
    board_business = {
      lines = {
        { id = "bb_default", text = "It's a joke, friend, though I'll admit no' a very kind one. The truth is I know what those taskmasters do, because I did it, an' every one I pay ye tae kill is one less thing I have tae remember." },
      },
      choices = {
        { text = "Then you're paying off a debt.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Killing them won't clean your hands.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    board_slaves = {
      lines = {
        { id = "bs_default", text = "When we can, which is less often than I'd like. Kill enough o' the slavers an' the rest o' the slaves start lookin' at the gate, an' some o' them run, an' some o' them reach us." },
      },
      choices = {
        { text = "Then every slaver killed is a chain broken.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The slaves should fight for themselves.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    weigh = {
      lines = {
        { id = "wg_default", text = "Because folk lie about what they've killed, an' blood doesnae. I weigh ye clean, I weigh ye after, an' the difference tells me what I'm payin' for." },
      },
      choices = {
        { text = "That's disgusting.", next = "weigh_gross" },
        { text = "That's clever.", next = "weigh_clever" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weigh_gross = {
      lines = {
        { id = "wgg_default", text = "Aye, it is, an' so's the work. If ye wanted clean coin, ye should've gone tae Ironforge an' sold candles." },
      },
      choices = {
        { text = "Fair point.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weigh_clever = {
      lines = {
        { id = "wgc_default", text = "It is, an' I'll take the credit, for nobody else wants it. The record's fifteen pounds an' some, an' I've a feelin' it'll stand a while." },
        { id = "wgc_me", when = { questDone = TODO_QUEST("JOB OPPORTUNITY: Culling the Competition") },
          text = "It is, an' you of all folk should know, for the record on that wall is yours. I've had three try tae beat it, an' they've all come back light." },
      },
      choices = {
        { text = "Records are made to be broken.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },

    before = {
      lines = {
        { id = "bf_default", text = "A taskmaster in the Cauldron, for the Firelord's overseers, an' I was good at it. Then I wasnae, for I stopped wantin' tae be, an' a taskmaster who doesnae want tae is a dead one, so I came here." },
      },
      choices = {
        { text = "What made you stop?", next = "before_why" },
        { text = "A man can change.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A whip-hand never really changes.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    before_why = {
      lines = {
        { id = "bw_default", text = "A wee lad, a gnome they'd brought up from Gnomeregan, who sang while he worked so he'd no' cry. I couldnae bring the whip down on him, an' once I'd stopped once, I couldnae start again." },
      },
      choices = {
        { text = "What happened to him?", next = "before_lad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_lad = {
      lines = {
        { id = "bl_default", text = "I don't know, an' that's the truth. I ran that same night an' I didnae take him wi' me, an' that's somethin' else I pay ye tae help me forget." },
      },
      choices = {
        { text = "You couldn't have saved everyone.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stolen = {
      lines = {
        { id = "st_default", text = "Dark Irons, jealous o' the Point, nicked a smithin' tuyere off Burninate's forge an' a spyglass off the lookouts. The steamsmiths by the Slag Pit have the one, an' the lookouts in the towers round the pit have the other." },
      },
      choices = {
        { text = "What does a blind lookout want with a spyglass?", next = "stolen_lolo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stolen_lolo = {
      lines = {
        { id = "sl_default", text = "Don't let Lolo hear ye say that, for he'll tell ye he can smell a Dark Iron at a mile an' see one at two wi' the glass. The other lookouts use it, mostly, but he likes tae hold it." },
      },
      choices = {
        { text = "Let the old man keep his pride.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A blind lookout should be replaced.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know who the Brotherhood wants dead, an' how much they'll pay. That's a fair bit." } },
    background = { { id = "tp_bg", text = "Taskmaster in the Cauldron, once, an' now the Brotherhood's. Same title, different side." } },
    advice = { { id = "tp_ad", text = "Do the work, an' come back dirty. Clean folk get paid nothin' here." } },
    dark_iron = { { id = "tp_di", text = "My own kind, an' I know better than most what they're capable of." } },
    _none = { { id = "tp_none", text = "If there's no bounty on it, I've no interest in it, friend." } },
  },
}
