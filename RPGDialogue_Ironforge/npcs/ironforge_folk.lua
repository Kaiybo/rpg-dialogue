-- Ironforge's people a paladin meets: the Hall of Mysteries, the Commons, the gates.
-- Voices: bibles/brandur.md, bibles/john_turner.md, bibles/jordan.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Brandur Ironhammer: paladin trainer; sends dwarves to Tiza Battleforge, humans to Rall.
P:NPC {
  key = "brandur", id = TODO_NPC("Brandur Ironhammer"), name = "Brandur Ironhammer", title = "Paladin Trainer",
  bible = "bibles/brandur.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "proud" }, values = { "pious", "brave" },
  spiritSensitive = true,
  notices = { "kit" },

  impression = {
    first = "Brandur Ironhammer trains the Light's young ones and sends them on with a joke about beards. He has the easy warmth of a teacher who has never doubted his calling.",
    third = "{name} met Brandur Ironhammer, who trains young paladins in Ironforge's Hall of Mysteries.",
  },

  greetings = {
    { id = "g_hall", text = "The Light keep ye! Are ye here for trainin', or for the warm floor?" },
    { id = "g_human", when = { race = "Human", class = "PALADIN" }, text = "A human paladin up the mountain! Rall'll want ye back by supper." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "PALADIN", durability = { max = 0.25 } },
      text = "Yer plate's in a shameful state. A paladin's armor is a promise tae the people behind ye, so mend it." },
  },

  start = "hello",
  nodes = {
    xpt_brandur = {
      big = true,
      lines = { { id = "xpt_brandur_default", text = "Heal them before they ask, an' never tell them they'd have died without ye, because they'll know, an' that does more than any lecture. If they still strut after that, put a wee bit o' salt in their ale." } },
      choices = {
        { text = "I'll tell them plainly when they're wrong. Friends should.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Quiet hints work better. Let them think it was their idea.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I think anythin' that tells folk tae be kind tae each other gets along fine, whatever name it answers to. The priests'll argue the details, but I've never seen a sermon stop a trogg." } },
      choices = {
        { text = "Every faith that guards the weak walks the same road.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Elune is not the Light, and the difference matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That a shield's for others first an' yerself second, an' that holdin' a line is a kind o' prayer. My young ones learn the same from warriors, mind, for there's no paladin alive who couldnae use a lesson in standin' firm." } },
      choices = {
        { text = "A shield is for others first. I believe that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My shield is for me. Others can carry their own.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "In a clean kill an' a fair one, aye, for the Light doesnae ask ye tae spare the boar, only tae waste nothin' an' gloat over nothin'. The best hunters I've known were quiet about it, an' grateful." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' yer {pet} is a blessin' too, if ye treat it like one, for the Light made the beasts as surely as it made us." },
      },
      choices = {
        { text = "I'll hunt cleanly, and waste nothing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A hunt's a hunt. I'll leave the Light to priests.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Both ask for discipline, an' both will burn ye if ye don't have it. I've fought beside mages in the Second War, an' I'll trust one who keeps their head over a paladin who doesnae." } },
      choices = {
        { text = "Discipline is everything. I'll keep my head, Brandur.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Discipline is a cage. Real power comes from letting go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Light judges what ye do, no' what ye wield, an' I've seen warlocks hold a line when braver souls ran. Still, I've buried too many friends tae fel tae welcome it at my table." } },
      choices = {
        { text = "Then judge me by what I do, Brandur. I'll prove it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light has its uses. So does the fel.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "All the time, an' that's how ye know we both care about it! Rohan says the Light's a thing tae be understood, an' I say it's a thing tae be lived, an' we've been arguin' the point over ale for twenty years wi'out either o' us winnin'." } },
      choices = {
        { text = "Rohan's right. Faith must be understood before it's wielded.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You're right, Brandur. Faith is lived, not studied.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Brandur.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The Light has use for anyone who does right by their neighbours, an' I've known a rogue or two who did more good in the dark than a dozen paladins in the open. Mind ye, I've known a few who did the opposite, so I'll keep one eye on the candlesticks all the same." },
      },
      choices = {
        { text = "I'll do right by my neighbours, Brandur.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Right and wrong depend on who's paying.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_brandur", tags = { "news" }, when = { party = { class = "PALADIN" } },
          text = "There's a paladin in yer company, I see, an' {companion} wears it well, beard or no beard. Mind ye keep them humble; the young ones forget the Light shines on the whole company, no' just whoever's holdin' the hammer." },
        { id = "h_default", text = "Brandur Ironhammer, an' I train the Light's young ones here in Ironforge. Dwarves I send on tae Tiza Battleforge an' humans tae Duthorian Rall, for the Light's no' fussy about beards." },
        { id = "h_dwarf", when = { race = "Dwarf", class = "PALADIN" },
          text = "Ye've a dwarf's stubbornness an' a paladin's oath. That's a fine pair, as long as the oath wins the arguments." },
        { id = "h_other", when = { ["not"] = { class = "PALADIN" } },
          text = "Ye're no' one o' mine, but ye're welcome in the Hall all the same. Mind the mages, though; they bite." },
        { id = "h_noble", when = { class = "PALADIN", minLevel = 40 },
          text = "Look at ye, all plate an' purpose! I'll own it, I get a wee bit jealous, an' Tiza says that's my weakness. I'm workin' on it." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Ye're in the right hall, then. Rohan's along the way, pacin' as he does; tell him Brandur sent ye, an' he'll pretend tae know who that is." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage come tae see a paladin? The Light an' the arcane get along better than folk think, if ye don't mind a lecture on the subject." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'll speak wi' ye, warlock, because the Light turns nobody away, but I'll no' pretend I'm comfortable doin' it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! The Light loves a strong arm as much as a strong heart, an' ye'd be welcome among my young ones." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! The Light shines on the high snows as well as on the Hall, an' I'd no' be surprised if it walks wi' ye out there." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! The Light's no' fussy about beards, an' I'm told nature's no' fussy about fur or skin, so we've that in common." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue in the Hall o' Mysteries! Dinnae worry, the Light's no' fussy about who comes in, though it's a wee bit fussy about who goes out wi' the candlesticks." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The Light's patient, but my students aren't." },
        { id = "h_again2", text = "Ask away; my students can drill without me for a wee while." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Who's Tiza Battleforge?", next = "tiza" },
        { text = "How did dwarves come to the Light?", next = "light" },
        { text = "What does a paladin owe the Light, trainer?", next = "owe", when = { class = "PALADIN" } },
        { text = "The Light isn't the only power in the mountain.", next = "shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "How do the Light and the arcane get along?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can a warlock find any place in the Light's eyes?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What can a warrior learn from your paladins, Brandur?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the Light have a place in the hunt, Brandur?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do paladins and priests ever argue about faith, Brandur?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you think the Light and Elune get along, Brandur?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does the Light have any use for rogues, Brandur?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How do I keep a paladin humble, sir?", next = "xpt_brandur", when = { party = { class = "PALADIN" } } },
        { text = "Farewell.", next = "END" },
      },
    },
    tiza = {
      lines = {
        { id = "tz_default", text = "Tiza's one o' our most respected. She gives the young ones the Tome o' Divinity, then sends 'em tae help someone who cannae repay it, an' her husband Muiredon tests the rest." },
      },
      choices = {
        { text = "Tests them how?", next = "tiza_muiredon" },
        { text = "Something else.", next = "BACK", fx = { learn = { "tome_of_divinity" } } },
      },
    },
    tiza_muiredon = {
      lines = {
        { id = "tm_default", text = "There's Dark Irons south o' Helm's Bed Lake. Muiredon an' Narm went spyin' on 'em an' only one came back walkin', an' still the Senate wants proof they're there at all." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    light = {
      lines = {
        { id = "li_default", text = "From the humans, {g:lad|lass}. The Silver Hand took a few o' us in after the Second War, an' more after the Third, when it needed hands. We brought hammers; they brought prayers." },
      },
      choices = {
        { text = "And now?", next = "light_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_now = {
      lines = {
        { id = "ln_default", text = "Now Ironforge trains its own, here in the Hall, wi' the same oaths an' better beer." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    owe = {
      lines = {
        { id = "ow_default", text = "Everythin' ye've got, an' it'll ask for it at the worst moment, usually when ye're tired an' the fella in front o' ye has an axe. The oath doesnae care that ye're tired; that's why it's an oath." },
        { id = "ow_hand", when = { origin = "dwarf_silver_hand" },
          text = "Ye know the answer already, for yer family took the oath after the Second War, when the Silver Hand came recruitin' through the Ward. Everythin' ye've got, an' the Hand's gone now, so ye owe it on yer own." },
        { id = "ow_human", when = { race = "Human" },
          text = "Everythin' ye've got, same as us. Ye'll have heard it said grander in Stormwind, but Duthorian Rall an' I agree on that much, an' we agree on very little." },
      },
      choices = {
        { text = "The oath comes before my own life.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "The oath serves people. When it doesn't, I'll choose people.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "And when I fail it?", next = "owe_fail" },
      },
    },
    owe_fail = {
      lines = {
        { id = "of_default", text = "Then ye get up an' take it again, an' ye don't make a song about it. Every paladin in this Hall has knelt an' started over at least once, an' the ones who say they havenae are fibbin'." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      big = true,
      lines = {
        { id = "sm_default", text = "So I hear, an' I hear it from ye. I'll no' call it heresy, for the Light never said it was alone in the world, but I'll ask ye plain: when the stone talks tae ye, does it ever tell ye tae be kind?" },
        { id = "sm_listener", when = { origin = "dwarf_stone_listener" },
          text = "Ye're the one they talk about in the Mystic Ward, the lass or lad wi' an ear tae the walls. I'll no' call it heresy, but I'll ask ye plain: does the stone ever tell ye tae be kind?" },
      },
      choices = {
        { text = "The stone doesn't judge. That's why I trust it.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Kindness is mine to bring. The stone gives strength.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Something else, trainer.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Light's servants hear a great deal in this hall, an' I've kept my ears open. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I'm a paladin o' the Silver Hand an' a trainer in the Hall. I've sent more young ones up tae Tiza than I can count, an' I can count." } },
    advice = { { id = "tp_ad", text = "Mend yer armor before ye pray. The Light hears ye either way, but the troll's quicker." } },
    tome_of_divinity = { { id = "tp_tome", text = "Tiza teaches it here an' Rall teaches it in Stormwind. It's the same book, just in different accents." } },
    holy_light = { { id = "tp_holy_light", text = "The Light's a plain thing at heart: ye stand up for folk who cannae stand up for themselves, an' ye mean it. The rest is sermons, an' I give a few o' those too." }, { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "Ye know it already, I'd wager, in yer arms when ye swing an' in yer chest when ye stand fast. The Light's no' a book; it's a beard that grows on the inside." } },
    scourge = { { id = "tp_scourge", text = "The dead are the Light's oldest enemy an' its plainest, an' there's nae question which side ye're on. Every paladin o' this hall will see the north sooner or later." } },
    silver_hand = { { id = "tp_silver_hand", text = "Uther's order did right by the world until the plague, an' there's still a few o' them scattered through the Hinterlands an' the north. Them as are left are worth ten men each." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "Zealots, an' good men gone sour wi' grief. They fight the dead, aye, but they've started burnin' the livin' too, an' that's no' the Light I teach." } },
    _none = { { id = "tp_none", text = "That's no' a matter for the Hall o' Mysteries. Ask up in the Commons." } },
  },
}

-- John Turner: always in Ironforge, always collecting for the Stormwind orphans.
P:NPC {
  key = "john_turner", id = TODO_NPC("John Turner"), name = "John Turner",
  bible = "bibles/john_turner.md", role = "citizen", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "wealth" },

  barks = { { id = "b_orphans", text = "Spare a thought for the orphans of Stormwind! A thought, a copper, anything at all!" } },
  impression = {
    first = "John Turner asked me to spare a moment for Stormwind's orphans before he asked my name. He comes all the way to Ironforge for supplies, and he never stops asking.",
    third = "{name} met John Turner, who runs the Stormwind orphanage with his wife and gathers supplies for it in Ironforge.",
  },

  greetings = {
    { id = "g_orphans", text = "Friend! Have you a moment for the orphans of Stormwind?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The orphans thank you for your attention, though they'd thank you more for linen." },
  },

  notice = {
    { id = "n_rich", cat = "wealth", when = { money = { min = 500000 } },
      text = "You've a heavy purse, if you don't mind my saying so. I mind saying it, but I say it anyway, because it's for the children." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Afraid? No, they'd ask you a hundred questions and want to see you call lightning. A few of the older ones lost parents to the orcs, though, and I'd want to tell them first that not every shaman ends up a warlock in a wolf pelt. The Church would want that said gently." } },
      choices = {
        { text = "Tell them gently. I'd gladly visit and answer kindly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They'll learn the difference themselves. I won't soften it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not that I know of, for your people look after their own, and I admire them for it. The children I care for are mostly the war's leftovers, and some of them would love to meet someone who can turn into a cat." } },
      choices = {
        { text = "Then I'll visit them. Every child deserves a little wonder.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "My people come first. Stormwind should tend its own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Half of them, at least, and they practise with broom handles in the yard until Stephanie takes the brooms away. A good many of their fathers were soldiers who never came home, so I suppose it's natural, though it breaks my heart a little." } },
      choices = {
        { text = "Tell them a warrior's first duty is to protect.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Tell them a warrior fights to win, nothing more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than anything, for most of them have never been outside the city walls, and a bear is as good as a dragon to them. If you're ever in Stormwind, come to the orphanage and tell them a story; Stephanie might even let you keep your boots on." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And if you bring your {pet}, they'll never forget it, though I'd keep it away from the little ones' sweets." },
      },
      choices = {
        { text = "I'll visit, and bring the gentlest story I have.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I've no time for children, John. I'm sorry.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It would, and I've seen it. The children lost so much in the wars that anything bright and harmless feels like a gift, and a mage who takes the time to show them is a better mage for it." } },
      choices = {
        { text = "I'll go and show them something bright and harmless.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I've no time for children's games. Coin will have to do.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I think coin is coin, and the children need it badly. What worries me is the children, who've seen enough of shadows already, so give if you like, but give quietly." } },
      choices = {
        { text = "I'll give quietly, John, and keep my shadows away.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Shadows will find them anyway. Better they learn to face them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than you'd believe, because half of them lost their fathers in the wars and the other half never had one, and a paladin is something to look up to. I can't promise they'll behave, but I can promise they'll remember you." } },
      choices = {
        { text = "Then I'll visit them in Stormwind. Every child deserves someone to look up to.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'm no hero for children. They need parents, not paladins.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, John.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The Church sends a few of your sort to the orphanage now and then, and the boys follow them about for weeks after, wanting to be just like them." },
        { id = "h_default", text = "John Turner, at your service. My wife Stephanie and I run the orphanage in Stormwind, and I come up to Ironforge every month to gather supplies. I'm usually here, mind; it's a long month." },
        { id = "h_stephanie", when = { heardLine = "stephanie.h_tome" },
          text = "You've met Stephanie! How is she, and is she tired? She's always tired, poor thing, so tell her I've nearly got the supplies together, as I always have." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Your people are generous, once they've decided you're not a fool. It took them a year to decide about me, and I'm still not sure about some of them." },
        { id = "h_linen", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity"), race = "Dwarf" },
          text = "Is that linen you've brought? Bless you, friend; Stephanie can make ten shirts out of that, eleven if the boys stand still." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Would you say a word for the children the next time you're in the Cathedral? Children always notice who prays for them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "Oh, a mage! The orphans back in Stormwind love a bit of magic, and if you ever pass that way, a small light show would mean more to them than coin." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I won't ask what you carry with you, but I'll ask you to keep it away from the collection box, if you would." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! The children at the orphanage would be thrilled to hear it, for half of them want to grow up to be one." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? The children would love to hear about the beasts you've seen, if you're ever passing through Stormwind." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid from Teldrassil! You've come a long way, and I hope you'll forgive me for asking whether you'd spare a thought for Stormwind's orphans." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I'd heard there were some now. The children in Stormwind would never believe me, so I suppose I'll have to bring them one of you someday." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've time, plenty of it, and a cart that won't fill." },
        { id = "h_again2", text = "Go on, friend. I'll be here, as the whole of Ironforge will tell you, for another month at least." },
      },
      choices = {
        { text = "How are the children?", next = "children" },
        { text = "Aren't you always here?", next = "always" },
        { text = "Where do the children come from?", next = "where" },
        { text = "Why collect in Ironforge?", next = "why_if" },
        { text = "I came out of Lordaeron myself.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "I could pray with them, back in Stormwind.", next = "pray", when = { class = "PRIEST" } },
        { text = "I grew up on the canal docks myself.", next = "canals", when = { race = "Human", class = "ROGUE" } },
        { text = "Would a little magic really cheer the orphans?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you think a warlock's coin would taint the orphans?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the orphans really want to become warriors, John?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Would the orphans really want to hear hunting stories?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would the orphans really want a paladin to visit them?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Are there kaldorei children among Stormwind's orphans?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would the orphans in Stormwind be afraid of a shaman?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck, John.", next = "END" },
      },
    },
    children = {
      lines = { { id = "c_default", text = "They're growing out of everything we give them, which is good news, really. It's just expensive good news." } },
      choices = {
        { text = "What do they need most?", next = "need" },
        { text = "Ha. I'll keep them in mind.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Best not to take in more children than you can feed.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    need = {
      lines = {
        { id = "nd_default", text = "Linen, always linen. Stephanie sews their shirts, and there are more tradesmen about than ever, buying up every bolt before I can get to it." },
      },
      choices = {
        { text = "I'll keep an eye out for linen.", next = "BACK", fx = { affinity = 2, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    always = {
      lines = {
        { id = "al_default", text = "Every month! I do come up every month; it's only that the months have been very close together this year." },
      },
      choices = {
        { text = "Very close.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "You miss her, don't you?", next = "miss" },
      },
    },
    miss = {
      lines = {
        { id = "mi_default", text = "Terribly. Stephanie writes that she's fine, and she always writes that, which is how I know to hurry home." },
      },
      choices = {
        { text = "Then hurry, John.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = {
        { id = "wh_default", text = "Most lost their parents to the Scourge, these last years; some to the war before that. They don't talk about it much, and we don't make them." },
      },
      choices = {
        { text = "That's a kindness.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_if = {
      lines = {
        { id = "wi_default", text = "Dwarves are generous once they've decided you're not a fool, and Ironforge has wool, linen and coin that nobody's asked for twice yet." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Then you know where most of mine come from. Lordaeron's children came south with nothing, and some of them still have nothing but us." },
      },
      choices = {
        { text = "Thank you for them.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Ironforge has enough mouths to feed without Lordaeron's.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "Would you? They'd like that very much. Bring something sweet with you, because prayers go down easier with something sweet." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "I'll bring the sweets, but you can keep the prayers.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    canals = {
      lines = {
        { id = "ca_default", text = "Did you, now? Then you know where half my children would be without Stephanie, and where some of them go when they run off anyway. I won't ask how you learned your trade, but I'll ask you to steer any little ones you meet toward our door." },
        { id = "ca_pick", when = { origin = "human_canal_pickpocket" },
          text = "You've the quick hands of a canal child; I've had a few of those through the orphanage, and every one of them stole my purse in the first week. Did anybody ever take you in?" },
      },
      choices = {
        { text = "I'll send them your way.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Some of them are better off on the streets, John.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "John Turner, of the Stormwind orphanage: Stephanie's husband, collector of linen, and the most persistent man in Ironforge." } },
    advice = { { id = "tp_ad", text = "Ask twice. Most people say no the first time out of habit." } },
    tome_of_divinity = { { id = "tp_tome", text = "The young paladins bring Stephanie linen as part of their training, and it's the best thing the Church ever started." } },
    varian = { { id = "tp_varian", text = "The children ask after the King every week, as if I'd know more than the town criers. I tell them he'll come home, because they need to hear it, and I pray it isn't a lie." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Bolvar visited the orphanage once and let the boys hold his shield, which nearly flattened two of them. They've talked about nothing else for a month." } },
    scourge = { { id = "tp_scourge", text = "Some of our children came south from Lordaeron with nobody but strangers to carry them. They don't talk about the north, and I don't ask." } },
    holy_light = { { id = "tp_holy_light", text = "The Light is a warm meal and a dry bed for a child who had neither yesterday. If the sermons don't get to that, they're only noise." } },
    _none = { { id = "tp_none", text = "No idea! But the orphans of Stormwind could use your help." } },
  },
}

-- Jordan Stilwell: the Church's smith, outside the Gates of Ironforge.
P:NPC {
  key = "jordan", id = TODO_NPC("Jordan Stilwell"), name = "Jordan Stilwell",
  bible = "bibles/jordan.md", role = "blacksmith", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "pious", "honest" },
  notices = { "paladin", "craft" },

  impression = {
    first = "Jordan Stilwell serves the Church at an anvil by the gates, in the cold. He spoke of his faith the way most smiths speak of good iron.",
    third = "{name} met Jordan Stilwell, a smith who serves the Church of the Holy Light at his anvil outside Ironforge's gates.",
  },

  greetings = {
    { id = "g_gate", text = "It's cold out here by the gates, but it's warmer by the anvil, so come closer." },
    { id = "g_fist", when = { questActive = TODO_QUEST("The Test of Righteousness") }, text = "You're here about the hammer? Good; bring me what I asked for and I'll do the rest." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "A paladin. I trained for it once, before my father's forge called me home, and now I make the hammers instead of swinging them. It's a different sort of prayer." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! Show me your hands, then. Those are good burns, and honest ones." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I forge for anyone defending the Alliance, and the Church has never told me otherwise. Some of the brothers would want me to ask what powers your arm before I sharpen your axe. I've decided I don't need to know, so long as you swing it at the right things." } },
      choices = {
        { text = "Then I'll swing it for the Alliance, and the Light can judge.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My arm's my own. The Light needn't weigh in on it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It's the only kind I'm any good at, so I hope so. Every blade I make goes to someone defending something, and I like to think the Light sees the care in that." } },
      choices = {
        { text = "Honest work done well is worship enough.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A blade is still a blade, whatever prayer goes into it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I forge for anyone who comes to the anvil, for the Light doesn't ask to see a tabard before it warms the iron. A hunter's arrowhead needs a fine edge and a true weight, and I've learned to make both out here in the cold." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And a ring for your {pet}'s collar, if you like; I've made a few for the hunters at the gates." },
      },
      choices = {
        { text = "Blessed steel will serve me well, then.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Just the steel, please. I'll skip the blessing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not often, for the Church tends to look at your sort sideways. Still, I've seen rogues fight the Scourge as bravely as any knight, and if you want an honest edge on your blades, I'll give you one." } },
      choices = {
        { text = "An honest edge for honest work. I'll use it well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your edge will open the right throats, whoever's they are.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't know, and that's why I'm asking you to step back. Every piece I forge for the paladins carries a prayer, and I'll not risk a prayer on a guess." } },
      choices = {
        { text = "I'll step back, Jordan. Your prayers deserve respect.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If a prayer can't withstand me, it's a weak prayer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every morning, before the fire's hot, for a hammer made without a prayer is just iron, and a paladin deserves better than iron. Bosch Verigan used to laugh at me for it, and then he'd stand quiet while I finished, and I miss that more than I can say." } },
      choices = {
        { text = "A prayer at the anvil is a good habit. Keep it, Jordan.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Good steel holds without prayer. The work speaks for itself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me see your wares, Jordan.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I don't know, and I'd rather not learn it on a hammer meant for the Church. Stormwind's mages and the Cathedral have always kept a polite distance, and I think there's wisdom in that, even if I couldn't tell you exactly why." },
      },
      choices = {
        { text = "Then I'll keep my distance from your anvil.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The Light and the arcane can share a room.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Jordan Stilwell. I serve the Church of the Holy Light the only way I know: at the anvil." },
        { id = "h_fist", tags = { "news" }, when = { questActive = TODO_QUEST("The Test of Righteousness") },
          text = "Bosch Verigan was my friend. This hammer will carry his name, and it'll go to a paladin worthy of it, which I hope is you." },
        { id = "h_daphne", when = { questDone = TODO_QUEST("The Tome of Valor") },
          text = "You stood with Daphne at the farm? She wrote to me that you were brave and she was braver, and that sounds just like her." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest of the Church, which has been good to Daphne and me. If you're ever on the Westfall coast, look in on her; she'll put you to work." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "The Church sends me paladins, an' you're no paladin. What are you after, then, near my anvil?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock at the Church's anvil! I'll ask you to keep your distance from the blessed metal, for it's been blessed once and I'd not like to bless it again." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I'll forge you arrowheads if you need them, and bless the steel while I'm at it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Nature's work and the Light's work aren't so far apart, I think, though you'll find my hammer louder than your groves." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. I work blessed steel here, and I'd rather you didn't cast near the anvil, because I've never known what the arcane does to a blessing." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I serve the Light at my anvil, and I'll admit I don't know what you serve, but your hands look like they've worked, so we may have more in common than the Church would think." },
      },
      again = {
        { id = "h_again", text = "What else? The fire's in no hurry." },
        { id = "h_again2", text = "Go on. I can listen and hammer at once." },
      },
      choices = {
        { text = "Who was Verigan?", next = "verigan" },
        { text = "Why work outside the gates?", next = "outside" },
        { text = "Where did you learn your craft?", next = "learned" },
        { text = "Tell me about Daphne.", next = "daphne" },
        { text = "You trained as a paladin?", next = "paladin_path", when = { class = "PALADIN" } },
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Do you forge for warriors, or only the faithful?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Does the Church's smith not deal with rogues?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can a warlock's presence harm blessed metal?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you forge for hunters as well as the faithful?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you pray at your anvil, Jordan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Can work at the anvil count as prayer?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does the arcane spoil a blessing, Jordan?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would the Light's smith forge for a shaman, Jordan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Stay warm, Jordan.", next = "END" },
      },
    },
    verigan = {
      lines = { { id = "v_default", text = "He was an old friend and a good man, the kind you name things after so people keep asking who he was. That's the whole point of it." } },
      choices = {
        { text = "Who was he?", next = "verigan_who" },
        { text = "Then I'll remember him.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Names fade, however many things you put them on.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    verigan_who = {
      lines = {
        { id = "vw_default", text = "He was a dwarf of the Silver Hand, and the best friend a human smith ever had in Ironforge. He'd have laughed at a hammer with his name on it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    outside = {
      lines = {
        { id = "ou_default", text = "The cool mountain air, Duthorian tells people. The truth is I like to see the road, because people come up it needing things, and I'd rather meet them halfway." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    learned = {
      lines = {
        { id = "le_default", text = "From my father first, at a keep in Silverpine. Then from Bailor Stonehand in Thelsamar, who taught me what a dwarf's forge can do that a man's can't." },
      },
      choices = {
        { text = "A keep in Silverpine?", next = "keep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      big = true,
      lines = {
        { id = "kp_default", text = "Baron Silverlaine's, back when we lived in Pyrewood. When the keep went foul, Daphne and I ran with nothing, and my father's hammer is still lying in the stables there." },
      },
      choices = {
        { text = "And your father?", next = "father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      lines = {
        { id = "fa_default", text = "The Scourge took him. He always said that hammer was enchanted and I laughed at him for it, and I'd give a great deal to laugh at him again." },
      },
      choices = {
        { text = "I'm sorry, Jordan.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Maybe someone will fetch it back.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    daphne = {
      lines = {
        { id = "dp_default", text = "My wife. She keeps our farm on the Westfall coast while I'm up here, with the Defias at the Longshore. She writes that she's killed a few, and I believe her." },
      },
      choices = {
        { text = "Why leave her alone?", next = "daphne_why" },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias", "westfall" } } },
      },
    },
    daphne_why = {
      lines = {
        { id = "dw_default", text = "I came north to work with the dwarves for a while, and she told me to go. You'd understand if you met her, because nobody wins an argument with Daphne." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    paladin_path = {
      lines = {
        { id = "pp_default", text = "I was going to be, until my father's forge needed me more than the Order did. Seeing what you do now, I'm a little envious, though only a little." },
      },
      choices = {
        { text = "The Order's loss.", next = "BACK", fx = { affinity = 2 } },
        { text = "You serve it anyway.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your father's forge mattered more than any vow would have.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "I forge for whoever stands between the Alliance and its enemies, and the Light doesn't ask me to check. A paladin's hammer gets my prayers along with the steel, but yours gets the same steel." },
      },
      choices = {
        { text = "Keep the prayers. The steel's what counts.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll take the prayers too, if you're offering.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a smith and the son of a smith, and a paladin who never was. I make the hammers for the ones who are.", next = "learned" } },
    advice = { { id = "tp_ad", text = "Look after your tools and they'll look after you. My father said that about hammers, then lent his best one to a cousin and never saw it again." } },
    tome_of_divinity = { { id = "tp_tome", text = "Faith first, then the hammer, and Rall's right about that. Being a smith, I'd put it the other way round, if he'd let me." } },
    westfall = { { id = "tp_westfall", text = "My Daphne keeps the farm there. She's a stubborn woman, and I married her for it." } },
    defias = { { id = "tp_defias", text = "Daphne fights them at our own door. Stormwind's advisors took a good deal longer to notice them than she did." } },
    holy_light = { { id = "tp_holy_light", text = "The Light is like good iron: honest, plain, and better for the hammering. I pray at the anvil, mostly, since it's where I do my best listening." } },
    bolvar = { { id = "tp_bolvar", text = "The Highlord is a fair man and a soldier first, and the Church trusts him. If he holds the throne until the King is found, Stormwind could do far worse." } },
    scourge = { { id = "tp_scourge", text = "I've seen smiths come down from the north who'd forged for Lordaeron's armies, and they don't speak of what they saw. The plague took their kingdom, and they're still forging as if they could win it back." } },
    _none = { { id = "tp_none", text = "I couldn't say, I'm afraid. I only know hammers and prayers." } },
  },
}
