-- The Hall of Explorers' library, the Commons, the Great Forge's gryphons, and the Forlorn Cavern.
-- Voices: bibles/commons.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Curator Thorius: curator of the Ironforge museum; Margol's horn; his brother Dorius and the Suntara Stones.
P:NPC {
  key = "thorius", id = TODO_NPC("Curator Thorius"), name = "Curator Thorius",
  bible = "bibles/commons.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "warm" }, values = { "curious", "loyal" },
  notices = { "trophy" },

  impression = {
    first = "Curator Thorius offered me a tour of the museum before I had finished saying hello. He loves every object in it, and he loves his brother Dorius, digging in the Searing Gorge, more than all of them.",
    third = "{name} met Curator Thorius, who keeps Ironforge's museum in the Hall of Explorers.",
  },

  greetings = {
    { id = "g_tour", text = "Why, hello there! Would ye like a tour o' the museum? It's free, an' it's very educational." },
    { id = "g_grief", when = { questDone = TODO_QUEST("Suntara Stones") }, text = "Ah, it's you. Come in, come in; the museum's quiet today, an' I'm glad o' the company." },
  },

  notice = {
    { id = "n_explorer", cat = "trophy", when = { origin = "dwarf_explorers_league" },
      text = "A League explorer! Have ye brought me anythin'? Even a pot shard; I'm very fond o' pot shards." },
    { id = "n_trophy", cat = "trophy", when = { minLevel = 45, questBefore = TODO_QUEST("Proof of Deed") },
      text = "Ye've the look o' someone who's been tae the Searing Gorge an' come back. If ye ever bring back somethin' remarkable, bring it tae me first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thorius, curator o' the Ironforge museum, at yer service! Every piece in this hall has a story, an' I know all o' them, so mind ye don't ask unless ye've an afternoon tae spare." },
        { id = "h_horn", tags = { "news" }, when = { questActive = TODO_QUEST("Proof of Deed") },
          text = "What's this ye've brought? Oh my, I don't believe it; that's the horn o' Margol the Rager, the bane o' every archaeologist who ever set foot in the Searing Gorge! May I keep it?" },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("Suntara Stones") },
          text = "A letter, singed, wi' my brother's hand on it. Give it here; I'll read it sittin' down, if ye don't mind." },
        { id = "h_vow", tags = { "news" }, when = { questRecent = { TODO_QUEST("Suntara Stones"), days = 4 } },
          text = "There's an empty hole where my heart used tae be. Dorius asked for his men tae be freed, an' in the name o' the Light, he'll have his wish; I've vowed it." },
        { id = "h_obsidion", tags = { "news" }, when = { questDone = TODO_QUEST("Rise, Obsidion!") },
          text = "Lathoric the Black is dead, an' his great machine wi' him. It doesnae bring Dorius back, but his men are free, an' that's what he asked for, so I can sleep again, mostly." },
      },
      again = {
        { id = "h_again", text = "Another question? I've a hall full o' answers." },
        { id = "h_again2", text = "Where were we? Ah, aye, we were on the exhibits." },
      },
      choices = {
        { text = "I'd love a tour.", next = "tour" },
        { text = "Tell me about your brother.", next = "dorius" },
        { text = "What are the Suntara Stones?", next = "stones" },
        { text = "Who's Margol the Rager?", next = "margol" },
        { text = "Would you pray with me for Dorius?", next = "pray", when = { class = "PRIEST", questDone = TODO_QUEST("Suntara Stones") } },
        { text = "Another time, Curator.", next = "END" },
      },
    },

    tour = {
      lines = {
        { id = "to_default", text = "Splendid! Over here we've relics from the old digs, there's titan-work from Uldaman behind the glass, an' that big skeleton's a raptor, though Magellas swears it's a very small dragon." },
      },
      choices = {
        { text = "Who's right, you or Magellas?", next = "tour_who" },
        { text = "Relics belong where they were found.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Relics are safest in a museum.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    tour_who = {
      lines = {
        { id = "tw_default", text = "Me, o' course, but I let him have the dragon on Tuesdays, for he's the High Explorer an' it keeps him cheerful. That's half o' curatin', keepin' explorers cheerful." },
      },
      choices = { { text = "Very diplomatic.", next = "BACK", fx = { affinity = 1, learn = { "explorers_league" } } } },
    },

    dorius = {
      lines = {
        { id = "do_default", text = "Dorius Stonetender, my brother, an' a better digger than I'll ever be. He's leadin' an excavation in the Searing Gorge, chasin' the Suntara Stones, an' he writes when he remembers, which isnae often." },
        { id = "do_dead", when = { questDone = TODO_QUEST("Suntara Stones") },
          text = "Dorius was my brother, an' the Dark Irons killed him in the Searing Gorge. His last letter came tae me wi' a thank-ye for whoever carried it, an' that was you." },
      },
      choices = {
        { text = "Is it dangerous, where he digs?", next = "dorius_danger" },
        { text = "I'm so sorry, Thorius.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    dorius_danger = {
      lines = {
        { id = "dd_default", text = "It's the Searing Gorge, so aye, an' the Dark Irons have been seen near his site. He tells me no' tae worry, which is how I know tae worry." },
        { id = "dd_dead", when = { questDone = TODO_QUEST("Suntara Stones") },
          text = "It was. Lathoric the Black used the stones tae bend his team's minds an' set them buildin' somethin' called Obsidion. Dorius walked intae a trap, an' I'd have walked in after him." },
      },
      choices = {
        { text = "Those Dark Irons should face justice.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "dark_iron" } } },
        { text = "Then free his men first, and leave vengeance be.", next = "BACK", fx = { align = { honor = -1 }, trait = { kind = 1 }, learn = { "dark_iron" } } },
      },
    },

    stones = {
      lines = {
        { id = "st_default", text = "Old stones o' power that the stories put somewhere in the Searing Gorge. Most curators would call them a legend, but Dorius always said legends are only finds nobody's dug up yet." },
        { id = "st_known", when = { questDone = TODO_QUEST("Suntara Stones") },
          text = "They exist. Dorius proved it, an' the Dark Irons took them, an' used them tae make slaves o' good dwarves. I'd give a great deal for them never tae have been found." },
      },
      choices = {
        { text = "Some finds should stay buried.", next = "BACK", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Knowledge is worth the danger.", next = "BACK", fx = { align = { light = -1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    margol = {
      lines = {
        { id = "ma_default", text = "A great brute o' a beast in the Searing Gorge that's chased off more digs than the Dark Irons have. Bring me his horn an' I'll put it on the wall, an' every archaeologist in Ironforge will come an' stare at it." },
        { id = "ma_done", when = { questDone = TODO_QUEST("Proof of Deed") },
          text = "His horn's up on the wall now, wi' a wee plaque, an' archaeologists come an' glare at it. One o' them threw a bun at it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    pray = {
      lines = {
        { id = "pr_default", text = "Aye. Aye, I'd like that, an' then I'll show ye the case I've set aside for his notes. He'd be embarrassed by it, which is why I did it." },
      },
      choices = {
        { text = "The Light keeps those we lose.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "His work keeps him better than any prayer.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A curator knows a little about everythin' that's ever been dug up, an' a great deal about the rest. Ask away." } },
    background = { { id = "tp_bg", text = "I keep the museum in the Hall o' Explorers, an' I keep it tidy, an' I give tours tae anyone who stands still long enough." } },
    advice = { { id = "tp_ad", text = "Label everythin'. Ye'll think ye'll remember where it came from, an' ye won't." } },
    explorers_league = { { id = "tp_league", text = "They bring things in an' I put them on shelves. It's a fine arrangement, as long as they remember tae bring them in.", next = "tour" } },
    dark_iron = { { id = "tp_dark_iron", text = "They took my brother. I'll say no more than that unless ye ask me plainly.", next = "dorius" } },
    _none = { { id = "tp_none", text = "We've nothin' on that in the museum, I'm afraid. Try the Library; Mae finds everythin'." } },
  },
}

-- Librarian Mae Paledust: the Library's book-finder; wants Mythology of the Titans out of the Scarlet Monastery.
P:NPC {
  key = "mae_paledust", id = TODO_NPC("Librarian Mae Paledust"), name = "Librarian Mae Paledust",
  bible = "bibles/commons.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "calm" }, values = { "wise", "curious" },
  notices = { "lore" },

  impression = {
    first = "Librarian Mae Paledust believes that studying the past is how you brace for the future. She speaks quietly, as librarians do, and finds a book for every question.",
    third = "{name} met Librarian Mae Paledust of the Explorers' League, who keeps the Library in the Hall of Explorers.",
  },

  greetings = {
    { id = "g_quiet", text = "Quietly, please; the books are listening. What are ye lookin' for?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? I've three new shelves since ye were here, an' nae room for a fourth." },
  },

  notice = {
    { id = "n_priest", cat = "lore", when = { class = "PRIEST" },
      text = "A priest. The Monastery in Tirisfal was a seminary once, before the Crusade took it; I'd guess some o' yer teachers studied there, an' so did some o' my best books." },
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "Ye've read The Seven Kingdoms, I can tell, for ye looked at the right shelf first. Most folk look at the floor." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Mae Paledust, Librarian. If it's written down anywhere, I can likely find it, an' if it's no' in a book yet, I'd like ye tae tell me about it so it can be." },
        { id = "h_myth", tags = { "news" }, when = { questActive = TODO_QUEST("Mythology of the Titans") },
          text = "The book's in the library o' the old Monastery in Tirisfal, if it survived the Scarlet Crusade's housekeepin'. Bring it home tae Ironforge, where it'll be read instead o' burned." },
        { id = "h_myth_done", when = { questDone = TODO_QUEST("Mythology of the Titans") },
          text = "Mythology o' the Titans is on my desk, an' I've read it twice an' argued wi' it three times. Thank ye for rescuin' it." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Softly, now." },
        { id = "h_again2", text = "Ask. I'll find the page." },
      },
      choices = {
        { text = "Why study the past?", next = "past" },
        { text = "What's Mythology of the Titans?", next = "titans" },
        { text = "What happened to the Monastery?", next = "monastery" },
        { text = "I trained at an abbey myself.", next = "abbey", when = { origin = "human_abbey_novice" } },
        { text = "I'll let you read.", next = "END" },
      },
    },

    past = {
      lines = {
        { id = "pa_default", text = "Because the future's comin' whether we like it or no', like rain fallin' tae the sea. We cannae stop it, but if we've read the past, we'll at least know which way tae hold the umbrella." },
      },
      choices = {
        { text = "The past teaches us what to keep.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The past teaches us what to change.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Do the books ever disagree?", next = "past_disagree" },
      },
    },
    past_disagree = {
      lines = {
        { id = "pd_default", text = "Constantly, an' that's the joy o' it. The Royal Historian an' I have been arguin' over a single footnote since the spring, an' neither of us intends tae lose." },
      },
      choices = { { text = "My coin's on the Historian.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    titans = {
      lines = {
        { id = "ti_default", text = "An old work on the titans, the makers the Explorers' League keeps findin' traces of in Uldaman an' elsewhere. There was a copy in the Monastery library in Tirisfal, an' as far as I know, it's still there." },
      },
      choices = {
        { text = "Why does Ironforge want it?", next = "titans_why" },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman", "explorers_league" } } },
      },
    },
    titans_why = {
      lines = {
        { id = "tw_default", text = "Because the League's diggin' up titan-work every season an' guessin' at what it means. A book might stop us guessin', or at least make our guesses more interestin'." },
      },
      choices = {
        { text = "Some old secrets are best left unread.", next = "BACK", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Every secret is worth reading.", next = "BACK", fx = { align = { light = -1 }, trait = { curious = 1 } } },
      },
    },

    monastery = {
      lines = {
        { id = "mo_default", text = "It was a seminary for paladins, a stronghold o' the Light, before Lordaeron fell. The Scarlet Crusade holds it now, an' they meant tae purify the land o' the plague, but madness got intae the purifyin'." },
      },
      choices = {
        { text = "They began with good intentions.", next = "BACK", fx = { align = { order = 1 }, learn = { "scarlet_monastery", "scarlet_crusade" } } },
        { text = "Zeal like theirs was always going to curdle.", next = "BACK", fx = { align = { order = -1 }, learn = { "scarlet_monastery", "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    abbey = {
      lines = {
        { id = "ab_default", text = "Northshire? Then ye'll know what a good library's worth tae a young priest. Theirs is small but well-loved, which is the best kind." },
      },
      choices = { { text = "I spent more time there than at prayers.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know where tae find things, which is better than knowin' them. Here's what's on my shelves." } },
    background = { { id = "tp_bg", text = "I find books for the Explorers' League, an' for anyone else who asks nicely. I'm good at it, an' I'll admit I'm proud o' that." } },
    advice = { { id = "tp_ad", text = "Read the old accounts before ye walk intae the old places. They'll tell ye where the floor gives way.", next = "past" } },
    scarlet_monastery = { { id = "tp_monastery", text = "A seminary once, an' a fortress o' zealots now, wi' a fine library I'd dearly love tae borrow from.", next = "monastery" } },
    explorers_league = { { id = "tp_league", text = "They dig, I read, an' we meet in the middle over a very old page." } },
    _none = { { id = "tp_none", text = "I've nothin' on that just now, but I'll start a list, an' my lists always turn up somethin'." } },
  },
}

-- Historian Karnik: worked with Hammertoe Grez on Uldaman; sends word to Belgrum of the Shadowforge threat.
P:NPC {
  key = "karnik", id = TODO_NPC("Historian Karnik"), name = "Historian Karnik",
  bible = "bibles/commons.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "serious", "loyal" },
  notices = { "lore" },

  impression = {
    first = "Historian Karnik had no time for meaningless questions until I mentioned Uldaman, and then he had all the time in the world. He grieves his partner Hammertoe and hides it behind work.",
    third = "{name} met Historian Karnik of the Explorers' League, who studies Uldaman from the Library in the Hall of Explorers.",
  },

  greetings = {
    { id = "g_busy", text = "Welcome tae the Explorers' League. If ye need information an' it's in book form, I might be able tae help ye." },
    { id = "g_brisk", when = { disposition = { max = 34 } }, text = "Another traveler wantin' somethin'. I've nae time for meaningless questions just now." },
  },

  notice = {
    { id = "n_explorer", cat = "lore", when = { origin = "dwarf_explorers_league" },
      text = "One o' the League's own. Then ye know what Uldaman means tae us, an' ye'll understand why I'm short wi' folk who don't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Karnik, historian o' the Explorers' League. I'm truly sorry, but I've a great deal o' work an' very little patience, so tell me what ye need, an' tell me quickly." },
        { id = "h_amulet", tags = { "news" }, when = { questActive = TODO_QUEST("Prospect of Faith") },
          text = "That's Hammertoe's amulet. Oh, this is a different matter entirely; if he sent ye wi' it, then he knew what was at stake, an' we'll have tae mourn him later." },
        { id = "h_belgrum", tags = { "news" }, when = { questActive = TODO_QUEST("Passing Word of a Threat") },
          text = "Find Advisor Belgrum, give him my note, an' tell him what ye saw. I'll speak tae Hammertoe's spirit in the meantime, for he may know somethin' that'll stop the Shadowforge." },
        { id = "h_infernus", tags = { "news" }, when = { questActive = TODO_QUEST("An Ambassador of Evil") },
          text = "Ambassador Infernus sits in Angor Fortress, sent there by Ragnaros himself tae mind the Shadowforge diggers. Strike him there, an' their work in Uldaman slows tae a crawl." },
        { id = "h_infernus_done", when = { questDone = TODO_QUEST("An Ambassador of Evil") },
          text = "Belgrum sent word that Infernus is dead, an' aid's goin' tae the Badlands tae recover the dig. Hammertoe would've raised a glass, an' I've raised one for him." },
      },
      again = {
        { id = "h_again", text = "Well? What else?" },
        { id = "h_again2", text = "Go on, then; I'll listen for a minute more." },
      },
      choices = {
        { text = "What are you working on?", next = "work" },
        { text = "Who was Hammertoe Grez?", next = "hammertoe" },
        { text = "Who are the Shadowforge?", next = "shadowforge" },
        { text = "You spoke with a spirit?", next = "spirit" },
        { text = "Could the Light ease Hammertoe's spirit?", next = "light", when = { class = "PRIEST" } },
        { text = "I won't keep you.", next = "END" },
      },
    },

    work = {
      lines = {
        { id = "wo_default", text = "Uldaman, an' the lost artifacts buried in it, the titan-work the League's been chasin' for years. Hammertoe Grez an' I were closer than anyone, an' then the Shadowforge noticed." },
      },
      choices = {
        { text = "Closer to what, exactly?", next = "work_what" },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },
    work_what = {
      lines = {
        { id = "ww_default", text = "Tae things that should stay in the League's hands an' out o' the Dark Irons'. That's all I'll say in a public library, an' I've already said more than I meant tae." },
      },
      choices = {
        { text = "The League should share what it finds.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Some finds must be guarded.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },

    hammertoe = {
      lines = {
        { id = "ha_default", text = "An explorer an' my partner in the Uldaman work, an' a stubborn old digger who'd go anywhere for a find. He's out in the Badlands now, an' I havenae heard from him in too long." },
        { id = "ha_dead", when = { questDone = TODO_QUEST("Prospect of Faith") },
          text = "He was my partner in the Uldaman work, an' the Shadowforge killed him for what we knew. He sent ye tae me wi' his amulet, so he trusted ye at the end, an' I do too." },
      },
      choices = {
        { text = "His work must be finished.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "No find is worth a life.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shadowforge = {
      lines = {
        { id = "sh_default", text = "Dark Irons, diggin' in Uldaman for the same things we are, an' they've a fortress in the Badlands at Angor tae work from. Somethin' bigger stands behind them, an' I don't like its shape." },
      },
      choices = {
        { text = "Something bigger?", next = "shadowforge_big" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron", "uldaman" } } },
      },
    },
    shadowforge_big = {
      lines = {
        { id = "sb_default", text = "Ragnaros, if Hammertoe's spirit is tae be believed, an' I've learned tae believe it. A creature o' living fire that sits under Blackrock Mountain an' sends ambassadors, as if he were a king." },
      },
      choices = {
        { text = "Then we strike before he grows stronger.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 }, learn = { "dark_iron" } } },
        { text = "Then we wait for the King's word.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 }, learn = { "dark_iron" } } },
      },
    },

    spirit = {
      lines = {
        { id = "sp_default", text = "I did, an' I'll thank ye no' tae look at me like that. Hammertoe's spirit wouldnae rest while the Shadowforge dug, an' a historian takes his sources where he finds them." },
      },
      choices = {
        { text = "That's a strange source.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    light = {
      lines = {
        { id = "li_default", text = "Perhaps, when his work's done. He's no' sufferin', I think, only stubborn, an' he'll rest when Uldaman's safe an' no' a day before, the same as he did when he was alive." },
      },
      choices = {
        { text = "Then I'll help him finish, and pray him home.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "The dead shouldn't be called back to talk.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've books on most things an' opinions on the rest. Be quick; here's what I know." } },
    background = { { id = "tp_bg", text = "I'm a historian o' the Explorers' League. My work's Uldaman, an' my partner in it was Hammertoe Grez, an' that's all I'll say about myself." } },
    advice = { { id = "tp_ad", text = "If it's written in a book, read the book before ye ask me, an' if it isnae, then ask me." } },
    uldaman = { { id = "tp_uldaman", text = "The old titan vaults in the Badlands, where Hammertoe an' I spent our best years.", next = "work" } },
    dark_iron = { { id = "tp_dark_iron", text = "The Shadowforge clan is diggin' in Uldaman, an' they answer tae somethin' worse than themselves.", next = "shadowforge" } },
    _none = { { id = "tp_none", text = "I've nae book on that, an' nae time tae write one." } },
  },
}

-- Advisor Belgrum: advisor to Magni, acts on the King's authority; the Tablet of Will.
P:NPC {
  key = "belgrum", id = TODO_NPC("Advisor Belgrum"), name = "Advisor Belgrum",
  bible = "bibles/commons.md", role = "noble", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "loyal", "dutiful" },
  notices = { "reputation" },

  impression = {
    first = "Advisor Belgrum speaks with the King's authority and seems to feel its weight in every word. He reads quickly, frowns slowly, and always has time for Historian Karnik's business.",
    third = "{name} met Advisor Belgrum, who advises King Magni and acts on his authority in the Hall of Explorers.",
  },

  greetings = {
    { id = "g_hmm", text = "Hmm? Yes, what is it?" },
    { id = "g_honored", when = { reputation = { faction = "Ironforge", min = "honored" } }, text = "Ah, a friend o' Ironforge. Come in; ye've earned a straight answer." },
  },

  notice = {
    { id = "n_rep", cat = "reputation", when = { reputation = { faction = "Ironforge", min = "revered" } },
      text = "The King knows yer name, ye understand. He doesnae say so often, but he keeps a list, an' ye're on it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Belgrum, advisor tae King Magni Bronzebeard. I carry the King's word where he cannae carry it himself, which is most places, for he's a busy dwarf." },
        { id = "h_note", tags = { "news" }, when = { questActive = TODO_QUEST("Passing Word of a Threat") },
          text = "Word from Historian Karnik? Excellent; I always have time for his business. Let me read it." },
        { id = "h_tidings", tags = { "news" }, when = { questDone = TODO_QUEST("Passing Word of a Threat") },
          text = "Och, those were evil tidings Karnik sent. Tell him on the King's authority tae act swiftly; the Shadowforge must be halted in the Badlands." },
        { id = "h_tablet", tags = { "news" }, when = { questActive = TODO_QUEST("The Lost Tablets of Will") },
          text = "Hammertoe's quest is still unfulfilled. Find the Tablet o' Will in Uldaman before the Shadowforge do, for I owe him that much, an' so does Ironforge." },
        { id = "h_tablet_done", when = { questDone = TODO_QUEST("The Lost Tablets of Will") },
          text = "The tablet's wi' the King's mages now, an' they're arguin' over it day an' night. Whatever it is, it's ours, an' no' the Dark Irons', thanks tae you." },
      },
      again = {
        { id = "h_again", text = "Anythin' further?" },
        { id = "h_again2", text = "Go on; I've a moment before the next report." },
      },
      choices = {
        { text = "What does an advisor to the King do?", next = "advisor" },
        { text = "What's the Tablet of Will?", next = "tablet" },
        { text = "Why does the King trust Karnik so?", next = "karnik" },
        { text = "What does the Senate think of all this?", next = "senate" },
        { text = "I've served Ironforge well, Advisor.", next = "served", when = { reputation = { faction = "Ironforge", min = "honored" } } },
        { text = "Good day, Advisor.", next = "END" },
      },
    },

    advisor = {
      lines = {
        { id = "ad_default", text = "I read what comes in, an' I decide what needs the King's eyes an' what needs only his name. It's a lot o' readin', an' a lot o' decidin', an' very little sleep." },
      },
      choices = {
        { text = "That's a great deal of power for one dwarf.", next = "advisor_power" },
        { text = "Something else.", next = "BACK" },
      },
    },
    advisor_power = {
      lines = {
        { id = "ap_default", text = "It is, an' I don't forget it. I use the King's name only where he'd use it himself, an' if ever I'm wrong, he'll tell me, loudly, in front o' everyone." },
      },
      choices = {
        { text = "A king needs trusted hands to act for him.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The King should speak for himself.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },

    tablet = {
      lines = {
        { id = "ta_default", text = "A stone shard inscribed by the titans themselves, or so the legends say, tae give their creations a will o' their own. Hammertoe dreamt o' findin' it, an' the Shadowforge want it for their golems." },
      },
      choices = {
        { text = "What would they do with it?", next = "tablet_do" },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },
    tablet_do = {
      lines = {
        { id = "td_default", text = "Build an army o' stone that thinks for itself, an' answers tae them. I've seen what their golems do wi'out a will; I'd rather no' see what they do wi' one." },
      },
      choices = {
        { text = "Then the tablet should be destroyed.", next = "BACK", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Then Ironforge should learn to use it first.", next = "BACK", fx = { align = { light = -1 }, trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    karnik = {
      lines = {
        { id = "ka_default", text = "Because he's been right about Uldaman for years while the rest of us were busy bein' wrong. When Karnik sends a note, I read it before my breakfast." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    senate = {
      lines = {
        { id = "se_default", text = "The Senate thinks the King acts too quickly, an' the King thinks the Senate thinks too slowly, an' I stand in the middle wi' a great many papers. Both of them are right, now an' then." },
      },
      choices = {
        { text = "Swift action saves lives.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Senate's caution keeps the King honest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    served = {
      big = true,
      lines = {
        { id = "sv_default", text = "Ye have, an' Ironforge doesnae forget. Before ye go, there may be one more thing I'd ask o' ye in the King's name, when the time comes." },
      },
      choices = {
        { text = "Ask, and it's done.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "I'll hear the terms first.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A great deal passes across my desk on its way tae the King. Here's what I can repeat." } },
    background = { { id = "tp_bg", text = "I advise the King an' act on his authority when he's elsewhere. My own story is very dull, an' I'd like tae keep it that way." } },
    advice = { { id = "tp_ad", text = "Read the whole note before ye act on it. The important part's always at the bottom." } },
    uldaman = { { id = "tp_uldaman", text = "Titan vaults, an' Dark Irons diggin' in them, an' an advisor who cannae sleep.", next = "tablet" } },
    _none = { { id = "tp_none", text = "That hasnae crossed my desk. If it's important, it will." } },
  },
}

-- Grand Mason Marblesten: builds the King's memorial to Sully Balloo from Alterac granite.
P:NPC {
  key = "marblesten", id = TODO_NPC("Grand Mason Marblesten"), name = "Grand Mason Marblesten",
  bible = "bibles/commons.md", role = "worker", tier = "quest",
  communities = { "ironforge" }, temper = { "jovial" }, values = { "proud", "practical" },
  notices = { "craft" },

  impression = {
    first = "Grand Mason Marblesten is delighted by good stone and has, by his own account, quite an imagination. Under the cheer he is weary of carving memorials to soldiers.",
    third = "{name} met Grand Mason Marblesten, the master stonemason of Ironforge's Commons.",
  },

  greetings = {
    { id = "g_stone", text = "Good day tae ye! Mind the chisels, for they're sharper than they seem, an' they seem very sharp." },
    { id = "g_back", when = { metBefore = true }, text = "{name}, {name}, {name}! Have ye brought me stone?" },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Ye've grit in yer knuckles. If ye ever find a seam o' good white marble, ye'll tell me before ye tell anyone else, won't ye?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Marblesten, Grand Mason o' Ironforge. If it's stone an' it's standin' in this city, chances are I carved it, or I've complained about whoever did." },
        { id = "h_tribute", tags = { "news" }, when = { questActive = TODO_QUEST("A King's Tribute") },
          text = "So King Magni himself sent ye? My, my, this must be important! A memorial tae a soldier called Sully Balloo, ye say, who died at the Thandol Span?" },
        { id = "h_granite", tags = { "news" }, when = { questObjective = { TODO_QUEST("A King's Tribute"), left = { min = 1 } } },
          text = "Tell me ye've enough Alterac granite for me tae begin. Darrow Hill in Hillsbrad has the finest stone in the north, an' I'll have nothin' less for this." },
        { id = "h_done", when = { questDone = TODO_QUEST("A King's Tribute") },
          text = "The memorial came out quite well, if I say so myself, an' I do. Such fine stone comes from Lordaeron, an' such a shame the land's in such shambles." },
      },
      again = {
        { id = "h_again", text = "What else? I've a block coolin' an' a chisel itchin'." },
        { id = "h_again2", text = "Go on; stone's patient." },
      },
      choices = {
        { text = "What makes stone good?", next = "stone" },
        { text = "Who was Sully Balloo?", next = "sully" },
        { text = "Do you carve many memorials?", next = "memorials" },
        { text = "I'm a miner myself.", next = "miner", when = { profession = "Mining" } },
        { text = "Good day, Grand Mason.", next = "END" },
      },
    },

    stone = {
      lines = {
        { id = "st_default", text = "Grain, an' weight, an' how it sings when ye tap it. Alterac granite rings like a bell, an' Dun Morogh stone thuds like a dwarf fallin' off a stool, an' each has its uses." },
      },
      choices = {
        { text = "Why go so far for granite?", next = "stone_far" },
        { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    stone_far = {
      lines = {
        { id = "sf_default", text = "Because a memorial has tae outlast everyone who mourns, an' their children, an' theirs. I've quite an imagination, ye know, but I cannae imagine anythin' that'll wear down Alterac granite." },
      },
      choices = {
        { text = "The best work deserves the best stone.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Local stone would honor him just as well.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    sully = {
      lines = {
        { id = "su_default", text = "A soldier who died at the Thandol Span when the Dark Irons struck it, an' his widow wrote tae the King. I didnae know him, but I'll know his name very well by the time I've carved it." },
      },
      choices = {
        { text = "Every soldier deserves a stone like this.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1, learn = { "thandol_span" } } },
        { text = "Better to spend the King's coin on the living.", next = "BACK", fx = { align = { honor = -1 }, learn = { "thandol_span" } } },
        { text = "Have you met his widow?", next = "sully_sara" },
      },
    },
    sully_sara = {
      lines = {
        { id = "ss_default", text = "Sara Balloo, in the Military Ward. I went tae ask her what she'd like on the stone, an' she said his name an' nothin' else, so that's what it'll say, in letters ye can read from the far wall." },
      },
      choices = { { text = "That's right.", next = "BACK", fx = { affinity = 1 } } },
    },

    memorials = {
      lines = {
        { id = "me_default", text = "More than I'd like. Bah, will there ever be peace on Azeroth? I'd give my best chisel tae spend a year carvin' fountains an' doorways an' nothin' wi' a name on it." },
      },
      choices = {
        { text = "Peace has to be fought for.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Peace comes when people stop fighting.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    miner = {
      lines = {
        { id = "mi_default", text = "Then ye know the mountain's moods! Bring me anythin' white an' fine-grained an' I'll owe ye a story, an' my stories are very long." },
      },
      choices = { { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Stonecutters hear everythin', for folk forget we're there behind the dust. Here's what I've heard." } },
    background = { { id = "tp_bg", text = "Grand Mason o' Ironforge. I carve what the King wants, an' what the King wants these days is mostly memorials." } },
    advice = { { id = "tp_ad", text = "Tap it before ye trust it. Stone tells ye when it's cracked, if ye listen." } },
    thandol_span = { { id = "tp_span", text = "A fine bridge, built by fine masons, an' the Dark Irons hit it. I take that personally.", next = "sully" } },
    _none = { { id = "tp_none", text = "If it isnae stone, I wouldnae know. Ask somebody wi' softer hands." } },
  },
}

-- Gryth Thurden: Ironforge's gryphon master at the Great Forge.
P:NPC {
  key = "gryth", id = TODO_NPC("Gryth Thurden"), name = "Gryth Thurden", title = "Gryphon Master",
  bible = "bibles/commons.md", role = "flightmaster", tier = "service",
  communities = { "ironforge" }, temper = { "proud" }, values = { "proud", "loyal" },
  notices = { "mount" },

  impression = {
    first = "Gryth Thurden keeps Ironforge's gryphons by the Great Forge and will tell anyone who listens that they're tougher than the Wildhammers' birds. The gryphons seem to agree with him.",
    third = "{name} met Gryth Thurden, Ironforge's gryphon master at the Great Forge.",
  },

  greetings = {
    { id = "g_ride", text = "Ye look like ye've somewhere tae be. Need one o' my gryphons?" },
    { id = "g_heat", text = "Feel that heat? My gryphons sleep through it like it's a summer's day, an' that's the Great Forge for ye." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Ye'll want tae get down off that before ye go near my birds. They think everythin' on four legs is lunch." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gryth Thurden, gryphon master. The Wildhammers might have fast steeds, but can those Aerie Peak gryphons stand the heat o' the Great Forge? I think not!" },
        { id = "h_picks", tags = { "news" }, when = { questActive = TODO_QUEST("Gryth Thurden") },
          text = "Honorary picks for Brock's students in Thelsamar, is it? No trouble at all, as long as ye've been there before an' spoken tae the flight master; my birds won't fly tae a place ye've never seen." },
      },
      again = {
        { id = "h_again", text = "Anythin' else, or are ye flyin'?" },
        { id = "h_again2", text = "Go on, ask; the birds are restin'." },
      },
      choices = {
        { text = "I need a ride.", next = "BUSINESS" },
        { text = "What's wrong with Aerie Peak's gryphons?", next = "aerie" },
        { text = "How do you keep gryphons under a mountain?", next = "keep" },
        { text = "Farewell, Gryth.", next = "END" },
      },
    },
    aerie = {
      lines = {
        { id = "ae_default", text = "Nothin', if ye like birds that sulk when it's warm. The Wildhammers raise theirs on the cliffs an' fly them half-wild, an' ours are bred by the forge an' fly where they're told." },
      },
      choices = {
        { text = "A gryphon should fly where it's told.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A half-wild gryphon sounds like a better friend.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = {
        { id = "ke_default", text = "Warm roosts, fresh meat, an' a long run out the gates every mornin'. They hate the dark at first, but they love the heat, an' the Great Forge has more heat than anywhere in Khaz Modan." },
      },
      choices = {
        { text = "Do they ever miss the sky?", next = "keep_sky" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_sky = {
      lines = {
        { id = "ks_default", text = "Every one o' them, every day, an' that's why they fly so well when ye let them out. Ye've never seen a bird so glad tae see the clouds." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Riders talk while they wait for a bird, an' I listen while I feed them. Here's what I've heard." } },
    background = { { id = "tp_bg", text = "I keep the King's gryphons by the Great Forge, an' I've kept them longer than I'll admit tae." } },
    advice = { { id = "tp_ad", text = "Hold on wi' yer knees, no' yer hands. Yer hands'll want tae wave." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask a gryphon, they've seen more o' the world than I have." } },
  },
}

-- Hulfdan Blackbeard: rogue trainer in the Forlorn Cavern; the Hidden Circle; the guards have trouble with him.
P:NPC {
  key = "hulfdan", id = TODO_NPC("Hulfdan Blackbeard"), name = "Hulfdan Blackbeard", title = "Rogue Trainer",
  bible = "bibles/commons.md", role = "trainer", tier = "quest",
  communities = { "ironforge" }, temper = { "jovial", "sharp" }, values = { "cunning", "loyal" },
  notices = { "stealth" },

  impression = {
    first = "Hulfdan Blackbeard runs the Hidden Circle out of the Forlorn Cavern and talks like a pirate who has never seen the sea. The guards have trouble with him, and he is proud of it.",
    third = "{name} met Hulfdan Blackbeard, rogue trainer in the Forlorn Cavern and head of Ironforge's Hidden Circle.",
  },

  greetings = {
    { id = "g_voice", text = "Keep yer voice down, the guards may hear ye. Now, wut is it?" },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one o' Blackbeard's chosen few! Come in, an' shut the door, an' check it's shut." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Ha! Ye think I cannae see ye? I trained half the shadows in this cavern, scallywag, an' I know every one o' them by name." },
    { id = "n_priest", cat = "stealth", when = { class = "PRIEST" },
      text = "A priest in the Forlorn Cavern? Either ye're lost, or ye've come tae save us, an' I'm no' sure which frightens me more." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hulfdan Blackbeard, an' this is the Hidden Circle, though if ye tell anyone it's here, it'll no' be hidden, will it? Speak up, but no' too loud." },
        { id = "h_salvation", tags = { "news" }, when = { questActive = TODO_QUEST("Road to Salvation") },
          text = "So ye think ye're a right scoundrel, destined tae be one o' Blackbeard's chosen? Only a good-fer-nothin' scallywag would think so highly o' hisself, an' that's exactly wut we're lookin' fer." },
        { id = "h_shakedown", tags = { "news" }, when = { questActive = TODO_QUEST("Kingly Shakedown") },
          text = "Magni's blockheads came bargin' in here talkin' about a heist, an' somehow yer name got blurted out. Take the first gryphon tae Stormwind an' find Renzik 'The Shiv' in Old Town, an' don't dawdle." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "Back from the shadows, are ye? Good, good; there's always work for the Circle, an' always somethin' tae teach ye." },
      },
      again = {
        { id = "h_again", text = "Wut else? Quietly, now." },
        { id = "h_again2", text = "Go on, whisper it." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "What is the Hidden Circle?", next = "circle" },
        { text = "Why do the guards have trouble with you?", next = "guards" },
        { text = "What heist were the King's guards on about?", next = "heist" },
        { text = "I'll keep your secret.", next = "END" },
      },
    },

    circle = {
      lines = {
        { id = "ci_default", text = "Ironforge's rogues, trained right here under the King's nose. We keep an ear on things the guards cannae hear, an' a hand on things the guards cannae reach, an' we're very useful tae the right people." },
      },
      choices = {
        { text = "Which people?", next = "circle_who" },
        { text = "Every city needs a few shadows.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A thieves' guild under the King's nose is a disgrace.", next = "BACK", fx = { align = { order = 1 }, affinity = -2 } },
      },
    },
    circle_who = {
      lines = {
        { id = "cw_default", text = "Friends in Stormwind, mostly, in Old Town; Renzik 'The Shiv' an' I go back a long way. I send him dwarves, he sends me news, an' nobody writes anythin' down." },
      },
      choices = {
        { text = "Loyalty among rogues. Who knew?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    guards = {
      lines = {
        { id = "gu_default", text = "Because they ask me questions an' I answer them wi' other questions, an' it upsets them somethin' terrible. Also there was a misunderstandin' about a cart, an' a goat, but that's all behind us." },
      },
      choices = {
        { text = "A goat?", next = "guards_goat" },
        { text = "The guards are only doing their jobs.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Someone has to keep the guards on their toes.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    guards_goat = {
      lines = {
        { id = "gg_default", text = "A very fine goat, an' it's back wi' its owner now, an' a wee bit fatter. I'll say no more, for a rogue never tells the whole story, only the funny part." },
      },
      choices = { { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } } },
    },

    heist = {
      lines = {
        { id = "he_default", text = "Wut heist? There's no heist. We were plottin' out phase three o' somethin' entirely legal when a couple o' the King's guards came in an' started arrestin' folk, an' nobody puts the iron on old Blackbeard." },
      },
      choices = {
        { text = "Phase three of what, exactly?", next = "heist_phase" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heist_phase = {
      lines = {
        { id = "hp_default", text = "Of a very legal enterprise, as I've said, an' I'll keep sayin' it until the guards believe it or retire. Ye'll be told more when ye're a member o' long standin', an' no' before." },
      },
      choices = {
        { text = "I'd rather not know.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll earn the rest of the story.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Hidden Circle hears everythin', an' I hear wut the Circle hears. Here's the part I'll sell ye for free." } },
    background = { { id = "tp_bg", text = "Background? Ha, that's a nice try, scallywag! A rogue's past is his own business, an' mine's very well hidden." } },
    advice = { { id = "tp_ad", text = "Never tell the whole story. Tell the funny part, an' keep the rest." } },
    _none = { { id = "tp_none", text = "Never heard of it, an' if I had, I'd say I hadnae." } },
  },
}
