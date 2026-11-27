-- The Hall of Explorers' library, the Commons, the Great Forge's gryphons, and the Forlorn Cavern.
-- Voices: bibles/commons.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Curator Thorius: curator of the Ironforge museum; Margol's horn; his brother Dorius and the Suntara Stones.
P:NPC {
  key = "thorius", id = TODO_NPC("Curator Thorius"), name = "Curator Thorius",
  bible = "bibles/commons.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "warm" }, values = { "curious", "loyal" },
  notices = { "trophy", "lock_shadow" },

  impression = {
    first = "He loves his brother Dorius more than everything in the museum.",
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
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The lamps over the titan cases dimmed a hair when ye came through the door, an' they've never done that for a tour before. I'll take ye round all the same, but ye'll forgive me if I walk on the side nearest the lamps." },
  },

  start = "hello",
  nodes = {
    xpt_thorius = {
      big = true,
      lines = { { id = "xpt_thorius_default", text = "A crew o' four came back from Uldaman wi' a stone tablet carved in a script nobody in the Hall could read, an' they argued for an hour over whether tae sell it tae me or keep it. Then they gave it tae the museum for nothin', an' I still think o' them every time I dust it." } },
      choices = {
        { text = "Finds like that belong in the museum, for everyone.", next = "BACK", reply = "Aye, that's what I told them, though it took a pint an' a promise tae put their names on the label before they'd agree.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They should have sold it. Crews have to eat.", next = "BACK", reply = "Crews do have tae eat. But a crew that sells its finds tae the highest bidder soon finds the museum's door shut tae them.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Display it? I'd build it a hall! Mind ye, the Senate's old guard would call it a Wildhammer curio an' want it in the back, behind the Titan carvings, where it couldnae embarrass anyone. History's no' kind tae new things, but it's always interested in them." } },
      choices = {
        { text = "Put it in the back. The Titan relics deserve the place of honour.", next = "BACK", reply = "Spoken like the old guard, an' they'd be glad o' ye, though I'd still want it somewhere folk could see it without a lantern.", fx = { align = { order = 1 } } },
        { text = "Put it in front. Ironforge should see what it's ignored.", next = "BACK", reply = "Ha, now ye're talkin' my language, an' I'll put it right by the door, where every senator has tae walk past it on the way in.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Most o' the hall, if ye count the axes, for dwarves have been fightin' Dark Irons an' troggs since long before there was a museum tae hang the axes in. My favourite's a shield split near in two, for the dwarf behind it lived tae bring it home an' give it tae us." } },
      choices = {
        { text = "Old arms deserve their place of honour here.", next = "BACK", reply = "I'll keep them polished, never fear. Every notch in those blades is a story somebody bled tae tell.", fx = { align = { order = 1 } } },
        { text = "Weapons belong in hands, not behind glass.", next = "BACK", reply = "Some o' them, aye, but these ones are retired, an' they've earned their rest, same as the dwarves who swung them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every curator worries about thieves, for a relic that walks out the door never walks back in. The Hidden Circle swear they've never touched my halls, an' I believe them about as far as I could throw a titan statue." } },
      choices = {
        { text = "Your relics are safe from me, Curator. I steal from enemies only.", next = "BACK", reply = "Glad tae hear it. I'll still be countin' the cases twice tonight, mind.", fx = { align = { honor = 1 } } },
        { text = "A relic in a case does nobody any good, Curator.", next = "BACK", reply = "It does a great many folk good, an' I'll no' have ye say otherwise, for every bairn who presses their nose tae the glass learns somethin'.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It hummed for a full day, an' the gnomes from the Mystic Ward came round wi' their gadgets tae measure it. I'd like tae know what it is before anybody tries tae wake it, an' I'll thank ye tae keep yer spells in yer pockets in here." } },
      choices = {
        { text = "Some things should be studied before they're stirred, Curator.", next = "BACK", reply = "Exactly. I'd rather know what it is than come in one mornin' an' find it's woken up first.", fx = { align = { order = 1 } } },
        { text = "If it wants to wake, I'd let it. That's how we learn.", next = "BACK", reply = "That's how my brother talks, an' it's how he ends up in the Searing Gorge wi' Dark Irons on his heels, so I'll wait, thank ye.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "A few pieces, aye: carved wood from Ashenvale an' a moonstone the size o' yer fist. I'd return 'em if Darnassus asked politely, though nobody's asked yet." } },
      choices = {
        { text = "They belong back in the forest, Curator.", next = "BACK", reply = "Maybe they do. If ye're ever in Darnassus, tell them I'd hand them back gladly for one polite letter.", fx = { align = { honor = 1 } } },
        { text = "Whoever found them fairly may keep them.", next = "BACK", reply = "That's how most curators see it, an' I'll no' quarrel, but I'd still return them if asked, for good manners cost nothin'.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A few, aye: a cracked censer from the old chapel by the Great Forge, an' a prayer-stone some explorer dug out o' Uldaman wi' runes nobody can read. I'll confess I like the stone better, for it's a mystery, an' I've never met a mystery I didnae want tae put in a case." } },
      choices = {
        { text = "Holy things belong where people can kneel before them, Curator.", next = "BACK", reply = "Ye may be right. If ye know a chapel that would have them, I'd be glad tae send them home.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A relic's a relic. Behind glass is as good a place as any.", next = "BACK", reply = "That's what I tell myself, but I'll admit I sometimes catch the old priests prayin' at the glass when they think I'm no' lookin'.", fx = { align = { light = -1 } } },
        { text = "Let's see the rest of the hall.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A dwarf o' the first Ironforge companies tae take Uther's oaths, so the label says, though I'll own the label was written long after an' by somebody who liked a good story. He gave it tae the museum himself when his hands got too stiff for it, an' that's the part I believe." } },
      choices = {
        { text = "Then I'll earn a place in that case, the honest way.", next = "BACK", reply = "I'll keep a spot open for ye. Ye'll have tae do somethin' grand enough for a later curator tae exaggerate, mind.", fx = { align = { honor = 1 } } },
        { text = "Glory belongs to the living. Leave the old gauntlets to the dust.", next = "BACK", reply = "Maybe so, but the living learn from the dust, an' I'll keep those gauntlets polished for the next paladin who needs reminding.", fx = { align = { honor = -1 } } },
        { text = "Show me something else, Curator.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because there's titan-work in these cases, an' I've no notion what it would make o' yer wee shadow standin' over it, an' I'd rather no' find out. Besides, my brother Dorius risks his neck in the Searing Gorge for every stone he sends me, an' I'll no' have one cracked by somethin' curious." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "An' now there's a demon standin' over the cases, the very thing I feared, for there's titan-work in them an' I've no notion what it'll make o' yer {pet}. My brother Dorius risks his neck in the Searing Gorge for every stone he sends me, so keep it back from the glass, for it's starin' like it's hungry." },
      },
      choices = {
        { text = "Understood. What follows me waits by the door.", next = "BACK", reply = "Thank ye kindly. I'd rather no' find out what titan-work thinks o' the likes o' it, an' Dorius would never forgive me if I did.", fx = { align = { order = 1 } } },
        { text = "Your relics are sturdier than you think, Curator.", next = "BACK", reply = "Maybe they are, but I'd rather no' learn it the hard way, so keep yer creature by the door an' I'll keep my relics in one piece.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_thorius", tags = { "news" }, when = { party = true },
          text = "Ye've brought yer friends tae the museum! Wonderful, because I've a great many things tae show an' hardly anyone stays for all o' it. Do keep them clear o' the cases by the far wall, though; the last adventurer who leaned on one set off a curse we're still cataloguin'." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in the museum! Mind the cases, friend, for some o' these relics are older than any temple, an' a few o' them were holy tae somebody once." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll want the case by the north wall, then, for we've a Silver Hand gauntlet there from the Second War, an' I polish it myself." },
        { id = "h_default", key = true,
          text = "Thorius, curator o' the Ironforge museum, at yer service! Every piece in this hall has a story, an' I know all o' them, so mind ye don't ask unless ye've an afternoon tae spare. My brother Dorius is diggin' for the Suntara Stones, so there'll be more soon." },
        { id = "h_horn", tags = { "news" }, when = { questActive = TODO_QUEST("Proof of Deed") },
          text = "What's this ye've brought? Great stones, that's Margol the Rager's horn, the beast that's chased every digger out o' the Searing Gorge for years! Could the museum keep it?" },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("Suntara Stones") },
          text = "A letter, singed, wi' my brother's hand on it. Give it here; I'll read it sittin' down, if ye don't mind." },
        { id = "h_vow", tags = { "news" }, when = { questRecent = { TODO_QUEST("Suntara Stones"), days = 4 } },
          text = "There's an empty hole where my heart used tae be. Dorius asked for his men tae be freed, an' in the name o' the Light, he'll have his wish; I've vowed it." },
        { id = "h_obsidion", tags = { "news" }, when = { questDone = TODO_QUEST("Rise, Obsidion!") },
          text = "Lathoric the Black is dead, an' his great machine wi' him. It doesnae bring Dorius back, but his men are free, an' that's what he asked for, so I can sleep again, mostly." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid in the Hall o' Explorers? Mind the mounted beasts, friend; they were dead long before we stuffed 'em, I promise ye." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye've a light step for the Hall o' Explorers, friend, an' I'll ask ye tae keep yer hands where the display cases can see them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Mind the titan-work behind the glass, for the last one o' yer kind who leaned close made every rune on it glow, an' I had tae sit down." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Then ye'll want tae see the east hall, for there's armor there from the War o' the Three Hammers that still has the dents tae prove it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Welcome tae the Hall o' Explorers! I'll gladly give ye the tour, but whatever's skulkin' at yer heel can wait by the door, for some o' these relics are older than anythin' it answers tae." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, an' a dwarf at that! I've no case in this museum for what ye are, an' I've half a mind tae start one." },
      },
      again = {
        { id = "h_again", text = "Another question? I've a hall full o' answers." },
        { id = "h_again2", text = "Where were we? Ah, aye, we were on the exhibits." },
      },
      choices = {
        { text = "Do you keep anything from the old kaldorei forests here?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd love a tour.", next = "tour" },
        { text = "Tell me about your brother.", next = "dorius" },
        { text = "What are the Suntara Stones?", next = "stones" },
        { text = "Margol the Rager sounds like a beast worth avoiding.", next = "margol", when = { any = { { questActive = TODO_QUEST("Proof of Deed") }, { questDone = TODO_QUEST("Proof of Deed") } } } },
        { text = "Would you pray with me for Dorius?", next = "pray", when = { class = "PRIEST", questDone = TODO_QUEST("Suntara Stones") } },
        { text = "I've a few trophies of my own, Curator.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "A curator must worry about thieves in a museum like this.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What did the titan-work do when that mage leaned close?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which pieces in the museum belonged to warriors, Curator?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have you ever kept relics of faith in the museum, Curator?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Whose gauntlet is that by the north wall, Curator?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why must my companion wait by the door, Curator?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would the museum ever display a shaman's totem, Curator?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "What's the best find a company ever brought you?", next = "xpt_thorius", when = { party = true } },
        { text = "Another time, Curator.", next = "END" },
      },
    },

    tour = {
      lines = {
        { id = "to_default", text = "Splendid! Over here we've relics from the old digs, there's titan-work from Uldaman behind the glass, an' that big skeleton's a raptor, though High Explorer Magellas swears it's a very small dragon." },
      },
      choices = {
        { text = "Who's right, you or Magellas?", next = "tour_who" },
        { text = "Relics belong where they were found.", next = "BACK", reply = "Some say so, an' I'll grant there's sense in it, but a relic in the ground teaches nobody, an' one in a case teaches everybody.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Relics are safest in a museum.", next = "BACK", reply = "That's my thinkin' too! Come along, then, an' I'll show ye the titan-work, which is the best part.", fx = { align = { order = 1 }, affinity = 1 } },
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
        { text = "The place he digs sounds dangerous.", next = "dorius_danger" },
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
        { text = "Those Dark Irons should face justice.", next = "BACK", reply = "Aye, they should, an' I hope they do, but bring my brother home first, an' then ye can have all the justice ye like.", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "dark_iron" } } },
        { text = "Then look after the living first, and leave vengeance be.", next = "BACK", reply = "Aye, that's my wish too, for Dorius would be the first tae say so, an' I'd rather have him home than have the Dark Irons punished.", fx = { align = { honor = -1 }, trait = { kind = 1 }, learn = { "dark_iron" } } },
      },
    },

    stones = {
      lines = {
        { id = "st_default", text = "Old stones o' power that the stories put somewhere in the Searing Gorge. Most curators would call them a legend, but Dorius always said legends are only finds nobody's dug up yet." },
        { id = "st_known", when = { questDone = TODO_QUEST("Suntara Stones") },
          text = "They exist. Dorius proved it, an' the Dark Irons took them, an' used them tae make slaves o' good dwarves. I'd give every case in this museum for them never tae have been found." },
      },
      choices = {
        { text = "Some finds should stay buried.", next = "BACK", reply = "Maybe some should. My brother would dig them up anyway, so I'd rather he had help when he does.", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Knowledge is worth the danger.", next = "BACK", reply = "That's what Dorius would say, an' I love him for it, but I'd rather he came home tae tell me about it than died findin' out.", fx = { align = { light = -1 }, trait = { curious = 1 } } },
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
        { id = "pr_default", text = "Aye. Aye, I'd like that, an' then I'll show ye the case I've set aside for his notes. He'd be embarrassed by it, an' that's the joy o' doin' it." },
      },
      choices = {
        { text = "The Light keeps those we lose.", next = "BACK", reply = "I'll hold on tae that. It's the only comfort I have while he's out there in the Gorge.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "His work keeps him better than any prayer.", next = "BACK", reply = "Maybe it does, an' I'll keep his notes in the case for that very reason, so his work speaks for him even if he cannae.", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Have ye, now! A hunter's trophies are the best kind, for every one comes wi' a story an' a scar. Bring me somethin' wi' a tale tae it, an' I'll find it a case an' a wee brass plate wi' yer name." },
        { id = "xhu_pet", when = { pet = { type = "Beast" } },
          text = "Have ye, now! An' there's yer partner in the business, sniffin' at my mounted boar as if it wants a word wi' it. Keep it off the exhibits, an' tell me about the best beast ye've ever brought down." },
      },
      choices = {
        { text = "A trophy honors the beast. That's why I keep them.", next = "BACK", reply = "That's a fine way tae see it. I'll put it on the label, for the beast deserves its honour as much as the hunter.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A trophy proves I won. That's all.", next = "BACK", reply = "Fair enough, an' I'll write that on the label too, though the bairns will want a better story than that, I'll warrant.", fx = { align = { honor = -1 } } },
        { text = "Who brought you Margol's horn?", next = "margol", when = { any = { { questActive = TODO_QUEST("Proof of Deed") }, { questDone = TODO_QUEST("Proof of Deed") } } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A curator knows a little about everythin' that's ever been dug up, an' rather a lot about the rest. Ask away." } },
    background = { { id = "tp_bg", text = "I keep the museum in the Hall o' Explorers, an' I keep it tidy, an' I give tours tae anyone who stands still long enough." } },
    advice = { { id = "tp_ad", text = "Label everythin'. Ye'll think ye'll remember where it came from, an' ye won't." } },
    explorers_league = { { id = "tp_league", text = "They bring things in an' I put them on shelves. It's a fine arrangement, as long as they remember tae bring them in.", next = "tour" } },
    dark_iron = { { id = "tp_dark_iron", text = "They took my brother. I'll say no more than that unless ye ask me plainly.", next = "dorius" } },
    uldaman = { { id = "tp_uldaman", text = "My brother Dorius was in the Badlands wi' the League before he went tae the Searing Gorge, an' a good many cases in this museum came out o' Uldaman. Titan work, every piece, an' ye can feel it hum if ye're daft enough tae touch." } },
    grim_batol = { { id = "tp_grim_batol", text = "There's a case in the back o' the hall wi' a shard o' Grim Batol's gate in it, an' nobody's ever been brave enough tae steal it. That tells ye somethin' about Grim Batol." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "Dorius writes from the Searing Gorge that the Dark Irons have built a whole city under the Blackrock, an' a grand one. I'd give my beard tae see it an' my life tae get back out." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls o' the desert build fine stone an' bury their kings wi' gold, so the League tells me. I've a mask from Zul'Farrak in the hall that I'm still no' sure was a good idea tae display." } },
    _none = { { id = "tp_none", text = "We've nothin' on that in the museum, I'm afraid. Try the Library; Librarian Mae Paledust finds everythin'." } },
  },
}

-- Librarian Mae Paledust: the Library's book-finder; wants Mythology of the Titans out of the Scarlet Monastery.
P:NPC {
  key = "mae_paledust", id = TODO_NPC("Librarian Mae Paledust"), name = "Librarian Mae Paledust",
  bible = "bibles/commons.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "calm" }, values = { "wise", "curious" },
  notices = { "lore" },

  impression = {
    first = "She quietly finds a book for every question.",
    third = "{name} met Librarian Mae Paledust of the Explorers' League, who keeps the Explorers' library in Ironforge.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Precious few, an' most o' those are Wildhammer songs somebody wrote down badly. The Bronzebeard scholars wrote about the Titans an' the stone, never about the stone answerin' back. If ye'd sit for an hour an' tell me how it works, I'd have the first proper page on it." } },
      choices = {
        { text = "I'll sit for your hour. It ought to be recorded properly.", next = "BACK", reply = "I'll have the ink ready. It's high time somebody wrote it down properly, an' no' in a bad Wildhammer verse.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements don't belong on a library shelf, Mae.", next = "BACK", reply = "Maybe no', an' I'll respect it, but a thing no' written down is a thing that can be lost, an' I've seen enough o' that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every one we could gather, from the War o' the Three Hammers tae the Second War, an' the names o' those who fell in them. Warriors come in now an' then lookin' for a grandfather, an' I'm always glad when I can find him for them." } },
      choices = {
        { text = "The old battles still have lessons for a soldier.", next = "BACK", reply = "Then let me show ye the shelves. A soldier who reads the old battles makes fewer old mistakes.", fx = { align = { order = 1 } } },
        { text = "I'd sooner learn from the next fight than the last.", next = "BACK", reply = "Fair enough, but the next fight often looks a great deal like the last one, an' it's cheaper tae learn from a book than a wound.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The yeti, mostly, for every account I have was written by somebody runnin' away from one. If ye ever get a good look at a yeti an' live, I'd be very glad tae write down what ye saw." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The yeti, mostly, for every account I have was written by somebody runnin' away from one. An' yer {pet}, while I think on it, for the bestiary's thin on tamed beasts an' I'd like tae know how ye came by it." },
      },
      choices = {
        { text = "I'll bring you an honest account, every detail of it.", next = "BACK", reply = "Bless ye! The library could do wi' a yeti account written by someone who was standin' still at the time.", fx = { align = { honor = 1 } } },
        { text = "I'll bring you a good story. Nobody will know the difference.", next = "BACK", reply = "I'd know, love, for I've read every story ever told about yetis, an' a made-up one would stick out like a gnome in a mine.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More often than ye'd think, an' never the cheap ones. A clever thief knows what an old Arathi chronicle fetches in Stormwind, an' I've learned tae keep the best o' them behind my own desk." } },
      choices = {
        { text = "A thief who steals books is no better than a grave robber.", next = "BACK", reply = "That's how I see it. The best ones stay under lock, an' the cheap ones sit on the shelf for show.", fx = { align = { honor = 1 } } },
        { text = "If nobody reads them, they might as well be sold.", next = "BACK", reply = "Somebody always reads them eventually, an' I'll no' have them sold off for the sake o' a thief's convenience.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Anythin' true, really. One o' our books says ye turn into bears at the full moon, another says ye eat nothin' but acorns, an' I suspect neither's quite right." } },
      choices = {
        { text = "Write it plainly. Truth shouldn't stay hidden in groves.", next = "BACK", reply = "Plain it is. I'd rather have one true page than a whole shelf o' acorn nonsense.", fx = { align = { order = 1 } } },
        { text = "Some druid teachings aren't meant for libraries.", next = "BACK", reply = "Fair enough, an' I'll respect that, though I'll still want tae know which bits o' the acorn theory are wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Depends which shelf ye ask, for the human books say the Light, the kaldorei say Elune, an' the oldest dwarven tablets say naught at all about either. I've a theory the titans knew more than they wrote down, but I'll no' say it too loud wi' High Priest Rohan just across the way." } },
      choices = {
        { text = "Faith doesn't need a footnote, Librarian. It needs a heart.", next = "BACK", reply = "Ha! Fair. But I'm a librarian, so I'll keep writin' footnotes, an' ye can keep the heart.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Every belief should be written down and argued with. That's honest.", next = "BACK", reply = "From a priest? I've had a few o' yer lot tell me tae burn the argument instead.", fx = { align = { light = -1 } } },
        { text = "I'll leave the theology for another day.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A copy, aye, written in Uther's own words an' sent from Lordaeron before it fell, though the margins are crammed wi' some dwarf's notes about what Uther meant. Read it if ye like, but leave the notes; I've a fondness for them." } },
      choices = {
        { text = "The oaths mean what they say, nothing more and nothing less.", next = "BACK", reply = "That's the soldier's view, an' I'll respect it, though the dwarf who wrote the margins would have a great deal tae say tae ye.", fx = { align = { order = 1 } } },
        { text = "Oaths should change as the world does. Those notes are wisdom.", next = "BACK", reply = "Aye, maybe they are, an' I'll show ye the best o' them, for some o' those notes were written by a paladin who'd seen a great deal.", fx = { align = { order = -1 } } },
        { text = "Some other time for the oaths.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in the Library! Ye'll be wantin' the theology shelves, I expect, an' I'll warn ye they're half Light an' half arguin' about it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, an' ye've the look o' someone who's read the oaths an' no' just sworn them, an' that's rarer than a dry beard at the Stonefire." },
        { id = "h_default", text = "Mae Paledust, Librarian. If it's written down anywhere, I can likely find it, an' if it's no' in a book yet, I'd like ye tae tell me about it so it can be." },
        { id = "h_myth", tags = { "news" }, when = { questActive = TODO_QUEST("Mythology of the Titans") },
          text = "The book's in the library o' the old Monastery in Tirisfal, if it survived the Scarlet Crusade's housekeepin'. Bring it home tae Ironforge, where it'll be read instead o' burned." },
        { id = "h_myth_done", when = { questDone = TODO_QUEST("Mythology of the Titans") },
          text = "Mythology o' the Titans is on my desk, an' I've read it twice an' argued wi' it three times. Thank ye for rescuin' it." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "Oh, a druid! Our shelves on the Cenarion Circle are terribly thin, so if ye've a moment, I've a great many questions an' a quill already inked." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye're the quiet sort, an' I like that in a library, though I'll be countin' the books after ye've gone, mind." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in the Library! Mind the shelves wi' that, if ye please, for the last axe through here cost me a whole row o' genealogies." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Ye might help me, then, for the bestiary's been missin' a proper account o' the beasts in Dun Morogh's high snows." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I've three shelves on the orcish kind an' no' a single page on a dwarf who does it, so I hope ye'll no' mind if I stare an' take notes." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Softly, now." },
        { id = "h_again2", text = "Ask. I'll find the page." },
      },
      choices = {
        { text = "What would you want written about druids?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why study the past?", next = "past" },
        { text = "Is there a book you're hunting for, Librarian?", next = "titans" },
        { text = "What happened to the Monastery?", next = "monastery", when = { any = { { heardLine = "mae_paledust.ti_default" }, { questActive = TODO_QUEST("Mythology of the Titans") } } } },
        { text = "I trained at an abbey myself.", next = "abbey", when = { origin = "human_abbey_novice" } },
        { text = "The books you'd lock away interest me most.", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "A mage would kill for this library.", next = "k_mage", when = { class = "MAGE" } },
        { text = "I'd guess books go missing from the Library now and then.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the Library keep records of Ironforge's battles?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's missing from the Library's bestiary, Librarian?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do your books say about where faith comes from?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does the Library keep the oaths of the Silver Hand?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Are there any books on dwarves who listen to the earth, Mae?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll let you read.", next = "END" },
      },
    },

    past = {
      lines = {
        { id = "pa_default", text = "Because the future's comin' whether we like it or no', like the rain, an' we cannae stop it. But if we've read the past, we'll at least know which way tae hold the umbrella." },
      },
      choices = {
        { text = "The past teaches us what to keep.", next = "BACK", reply = "That's the first half o' my job. The second half is gettin' folk tae listen.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The past teaches us what to change.", next = "BACK", reply = "That too, an' that's the harder half. Nobody likes bein' told what they ought tae change.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "The books must disagree with each other often enough.", next = "past_disagree" },
      },
    },
    past_disagree = {
      lines = {
        { id = "pd_default", text = "Constantly, an' that's the joy o' it. Royal Historian Archesonus an' I have been arguin' over a single footnote since the spring, an' neither of us intends tae lose." },
      },
      choices = { { text = "My coin's on the Historian.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    titans = {
      lines = {
        { id = "ti_default", key = true, text = "An old work on the titans, the makers the Explorers' League keeps findin' traces of in Uldaman an' elsewhere. There was a copy in the Monastery library in Tirisfal, an' as far as I know, it's still there." },
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
        { text = "Some old secrets are best left unread.", next = "BACK", reply = "Maybe some are. I'd still rather know which ones before the League digs them up an' reads them anyway.", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Every secret is worth reading.", next = "BACK", reply = "That's the spirit o' a librarian, an' I'm glad tae hear it, though I'll admit some o' them have kept me up at night.", fx = { align = { light = -1 }, trait = { curious = 1 } } },
      },
    },

    monastery = {
      lines = {
        { id = "mo_default", text = "It was a seminary for paladins, a stronghold o' the Light, before Lordaeron fell. The Scarlet Crusade holds it now, an' they meant tae purify the land o' the plague, but madness got intae the purifyin'." },
      },
      choices = {
        { text = "They began with good intentions.", next = "BACK", reply = "They did, an' that's what makes their fall so sad. Good intentions are what they'll tell ye about on the way down.", fx = { align = { order = 1 }, learn = { "scarlet_monastery", "scarlet_crusade" } } },
        { text = "Zeal like theirs was always going to curdle.", next = "BACK", reply = "Maybe it was, an' I've thought the same, but I'd rather remember the good intentions so we can watch for the curdling ourselves.", fx = { align = { order = -1 }, learn = { "scarlet_monastery", "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    abbey = {
      lines = {
        { id = "ab_default", text = "Northshire? Then ye'll know what a good library's worth tae a young priest. Theirs is small but well-loved, which is the best kind." },
      },
      choices = { { text = "I spent more time there than at prayers.", next = "BACK", fx = { affinity = 2 } } },
    },
    k_lock = {
      lines = {
        { id = "xlk_default", text = "I'd guessed as much, from the way yer eyes went straight tae the back shelf. I don't burn books, for that's the Scarlets' business, but I keep some o' them where I can see who's readin'." },
        { id = "xlk_texts", when = { origin = "gnome_forbidden_texts" },
          text = "Ye're the gnome who's been askin' after the sealed Gnomeregan folios, aren't ye? I've had three o' them come up the tram since the fall, an' I've read the first page o' one, an' I put it down again." },
      },
      choices = {
        { text = "Knowledge shouldn't be locked away, Librarian.", next = "BACK", reply = "I'll no' lock it. But I'll keep it where I can see who reads it, for that's a librarian's duty too.", fx = { align = { order = -1 } } },
        { text = "You're right to watch the readers.", next = "BACK", reply = "Thank ye. Most folk think I'm just nosy, but there's a reason I keep my eye on the back shelf.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "Kill, is it? I'd prefer ye didnae, for the bloodstains never come out o' vellum. Dalaran's libraries are grander, I'm told, but ours remember things the Kirin Tor never thought tae write down." },
      },
      choices = {
        { text = "Then let me read, and I'll write it down for you.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know where tae find things, which is better than knowin' them. Here's what's on my shelves." } },
    background = { { id = "tp_bg", text = "I find books for the Explorers' League, an' for anyone else who asks nicely. I'm good at it, an' I'll admit I'm proud o' that." } },
    advice = { { id = "tp_ad", text = "Read the old accounts before ye walk intae the old places. They'll tell ye where the floor gives way.", next = "past" } },
    scarlet_monastery = { { id = "tp_monastery", text = "A seminary once, an' a fortress o' zealots now, wi' a fine library I'd dearly love tae borrow from.", next = "monastery" } },
    explorers_league = { { id = "tp_league", text = "They dig, I read, an' we meet in the middle over a very old page." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "Their records were the best in Lordaeron once, kept by priests who loved their libraries. I hope somebody in that monastery still dusts the shelves, though I doubt it." } },
    dire_maul = { { id = "tp_dire_maul", text = "There's a library in Dire Maul that's said tae be older than any book on these shelves, an' I'd walk tae Feralas for one afternoon in it. I'd want a strong escort, mind, an' perhaps a candle that doesnae drip." } },
    lordaeron = { { id = "tp_lordaeron", text = "The whole north o' the continent fell in a single season, an' half its histories burned wi' it. I keep what scraps come south an' write down what the refugees remember, because nobody else will." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's libraries were the best in the world before Archimonde, an' I'm told some o' the shelves survived. If the Kirin Tor ever let a librarian in, I'll be the first tae queue." } },
    _none = { { id = "tp_none", text = "I've nothin' on that just now, but I'll start a list, an' my lists always turn up somethin'." } },
  },
}

-- Historian Karnik: worked with Hammertoe Grez on Uldaman; sends word to Belgrum of the Shadowforge threat.
P:NPC {
  key = "karnik", id = TODO_NPC("Historian Karnik"), name = "Historian Karnik",
  bible = "bibles/commons.md", role = "scholar", tier = "quest",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "serious", "loyal" },
  notices = { "lore", "lock_taint" },

  impression = {
    first = "He grieves his partner Hammertoe and hides it behind work.",
    third = "{name} met Historian Karnik of the Explorers' League, who studies Uldaman from the League's library in Ironforge.",
  },

  greetings = {
    { id = "g_hu_prej", when = { race = "Human" }, priority = 5,
      text = "A human visitor to the League's library! Do be careful with the shelves; your people's histories are on the bottom row, and they keep needing revision." },
    { id = "g_hu_soft", when = { race = "Human", npcFlagBefore = "karnik_human_soft" }, priority = 10,
      text = "Ah, my human correspondent! I've added a footnote on Lothar's dwarven allies because of you, and the Curator says it's the best thing in the chapter." },
    { id = "g_busy", text = "Welcome tae the Explorers' League. If ye need information an' it's in book form, I might be able tae help ye." },
    { id = "g_brisk", when = { disposition = { max = 34 } }, text = "Another traveler wantin' somethin'. I've nae time for meaningless questions just now." },
  },

  notice = {
    { id = "n_explorer", cat = "lore", when = { origin = "dwarf_explorers_league" },
      text = "One o' the League's own. Then ye know what Uldaman means tae us, an' ye'll understand why I'm short wi' folk who don't." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "There's a green cast in yer eyes, an' I've read it described before, in the accounts o' the orcs who crossed the Dark Portal. The chroniclers wrote that the color came first an' the cruelty after, so I'd thank ye tae prove the books wrong." },
  },

  start = "hello",
  nodes = {
    -- Humans (human patch): torn view of humans; Persuade softener sets karnik_human_soft.
    hu_view = {
      lines = {
        { id = "huv_default", key = true,
          text = "As a historian, I find them exhausting, because by the time I've written down what a human kingdom did, it's done something else. Lordaeron called us to the Alliance, spent Khaz Modan's sons at Grim Batol and Blackrock, and then the whole Alliance fell apart over who'd pay for the orc camps." },
        { id = "huv_human", when = { race = "Human" },
          text = "Honestly? Your people move faster than my quill, and I've given up trying to keep a single human kingdom's history straight from one decade to the next." },
      },
      choices = {
        { text = "Did the dwarves regret joining the Alliance?", next = "hu_view2" },
        { text = "You sound more tired than angry, Historian.", next = "hu_view2" },
        { text = "Something else, Historian.", next = "BACK" },
      },
    },
    hu_view2 = {
      big = true,
      lines = {
        { id = "huv2_default",
          text = "Tired is the word, aye. Without Lothar the Horde would have held Ironforge, and I'll write that down plainly, but when Gilneas and Stromgarde walked away and Lordaeron fell to the plague, it was Ironforge left holding the Dark Irons and the Dragonmaw on its own doorstep." },
      },
      choices = {
        { text = "The Alliance saved Khaz Modan. That debt runs one way.", next = "BACK",
          reply = "Well argued, and I'll grant it's the version most of our veterans would sign. I only wish it ran both ways a little more often.",
          fx = { align = { order = 1 }, opinion = { humans = "respect" } } },
        { text = "Human kings use allies, then forget them. History proves it.", next = "BACK",
          reply = "You'd make a sour historian and a fair one, I think. The records do lean your way, though I'd not say so to a Stormwind envoy.",
          fx = { align = { order = -1 }, opinion = { humans = "distrust" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x = {
      lines = {
        { id = "hux_default", key = true,
          text = "My records are hard on everyone, but I'll admit yours fill more pages. Lordaeron took our gunners and our gryphon riders for its war, and when the Alliance came apart, not one human crown asked what became of the dwarves who'd held the line for them." },
      },
      choices = {
        { text = "Then record the humans who stayed. Turalyon didn't walk away.", tag = "Persuade", next = "hu_x_soft",
          check = { pass = { any = { { disposition = { min = 55 } }, { class = "PALADIN" }, { class = "PRIEST" } } } },
          fail = { next = "hu_x_fail", fx = { affinity = -1 } } },
        { text = "Perhaps dwarves should write less and fight more.", next = "BACK",
          reply = "We did plenty of both, and we wrote it down, which is why I can tell you you're wrong.", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x_soft = {
      lines = {
        { id = "huxs_default", key = true, fx = { npcFlag = { set = { "karnik_human_soft" } } },
          text = "No, he didn't, and neither did the men who followed him through the Portal and never came back. That's a fair correction, and a historian who won't take one isn't worth his ink, so I'll write them in." },
      },
      choices = {
        { text = "I'd be glad to read that chapter, Historian.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x_fail = {
      lines = {
        { id = "huxf_default", text = "Turalyon's one name against a whole shelf of treaties, and I've read every one of them. Bring me a better source and I'll listen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Farewell, Historian.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because the Badlands are full o' troggs an' Dark Irons, an' the League keeps sendin' scholars out there wi' a pick an' a notebook an' no' enough else. Next time a team goes tae Uldaman, I'll see they go wi' someone like you." } },
      choices = {
        { text = "I'll go with the next team and keep them safe.", next = "BACK", reply = "The scholars will be glad o' ye. They've been diggin' wi' one hand an' holdin' their notebooks wi' the other.", fx = { align = { honor = 1 } } },
        { text = "Pay me well, and I'll guard any scholar you like.", next = "BACK", reply = "Ha, fair enough, an' I'll see what the League can pay, but dinnae expect much, for scholars are cheap an' the League cheaper.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, for nobody else can read the Badlands, where the troggs move by night an' the buzzards tell ye where somethin's died. A hunter wi' a good rifle walks ahead o' a dig, an' the dig comes home." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Aye, for nobody else can read the Badlands, where the troggs move by night an' the buzzards tell ye where somethin's died. A beast like yer {pet} smells a trogg long before a scholar trips over one, which is a mercy in itself." },
      },
      choices = {
        { text = "I'll walk ahead of your digs and see them home.", next = "BACK", reply = "The digs will be safer for it. A hunter out ahead is worth a dozen guards standin' behind.", fx = { align = { honor = 1 } } },
        { text = "I'll scout for you, but the trophies are mine.", next = "BACK", reply = "Trophies, aye, ye can keep them, but if ye find anythin' wi' writin' on it, it's the League's, an' I'll want it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Hammertoe swore the titan script shifts if ye look at it the right way, an' I've never been able tae look at it the right way. If there's magic in the words, I'd rather a careful mage found it than the Shadowforge." } },
      choices = {
        { text = "Then I'll read them carefully and tell you what I find.", next = "BACK", reply = "I'll be waitin'. Hammertoe would be glad tae know someone could finally read what he spent his life diggin' up.", fx = { align = { order = 1 } } },
        { text = "Knowledge like that should belong to whoever unlocks it first.", next = "BACK", reply = "That's how the Shadowforge see it too, an' I'll no' have the League's finds goin' tae whoever's quickest wi' a spell.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A historian has opinions about everyone, an' I've read what the warlocks o' the Horde did tae this land. I'll grant ye the power was there before them, an' it's what ye do wi' it that the books will remember." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A historian has opinions about everyone, an' I've read what the warlocks o' the Horde did tae this land, so ye'll forgive me for closin' this book while yer demon's eyes are on the page. I'll grant ye the power was there before them, an' it's what ye do wi' it that the books will remember." },
      },
      choices = {
        { text = "I'll turn it on the Shadowforge and the Horde, nothing else.", next = "BACK", reply = "I'll take ye at yer word. The Shadowforge have earned it, an' the Horde twice over.", fx = { align = { light = 1 } } },
        { text = "History is written by the strong. I intend to be strong.", next = "BACK", reply = "Aye, it is, an' I've read a great many o' the strong, an' most o' them ended badly, so mind which history ye're writin'.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because a memory dies wi' the one who holds it, an' a book doesn't! The night elves live long enough tae forget how fragile that is." } },
      choices = {
        { text = "Some knowledge should pass only teacher to student.", next = "BACK", reply = "Maybe some, an' I'll respect that, but I've seen too many teachers die before their students were ready, an' the knowledge with them.", fx = { align = { order = -1 } } },
        { text = "You're right. It should be written down for everyone.", next = "BACK", reply = "A book outlasts the best memory in the world, even an elf's. I've buried too many teachers tae think otherwise.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Hit them, mostly, an' hard, but in the Badlands an' no' here, where the Senate would want a form filled out first. Hammertoe died tryin' tae keep them from the Tablet o' Will, an' I'd take it kindly if somebody made them pay for that before I'm too old tae see it." } },
      choices = {
        { text = "Then they'll answer for Hammertoe, by fair fight and open steel.", next = "BACK", reply = "Aye, they will, an' I'll be glad tae see it, for Hammertoe deserved a fair fight from somebody, an' he didnae get one.", fx = { align = { honor = 1 } } },
        { text = "However it's done, they'll pay. Fair fights are for duels.", next = "BACK", reply = "Aye, they will, however it's done, an' I'll no' be askin' how, for Hammertoe deserves whatever justice we can give him.", fx = { align = { honor = -1 } } },
        { text = "Tell me something else, Historian.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I'd buy the truth about where they came from, which is the bit worth havin', an' the League pays fairly for it. Hammertoe died in the Badlands for those tablets, so I've no patience for anyone who digs for coin an' leaves the history behind." },
      },
      choices = {
        { text = "Fair. I'll bring the truth with anything I find.", next = "BACK", reply = "That's what I like tae hear. The League will pay ye fairly, for the truth's worth more than any tablet.", fx = { align = { honor = 1 } } },
        { text = "Coin is coin, Historian. History doesn't feed me.", next = "BACK", reply = "It doesnae. But Hammertoe died for this history, so forgive me if I'm particular about where it comes from.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_hu_prej", when = { race = "Human", ["not"] = { npcFlagBefore = "karnik_human_soft" } },
          text = "Historian Karnik, of the Explorers' League. I keep the records of Khaz Modan, which means I keep a long list of promises your kings made us and a shorter list of the ones they kept." },
        { id = "h_hu_soft", when = { race = "Human", npcFlagBefore = "karnik_human_soft" },
          text = "Welcome back! The Lothar chapter is coming along nicely, and I've stopped writing 'as usual' beside every human treaty, which the Curator says is growth." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Well, ye'll want tae hear about the Shadowforge, for the Dark Irons in Uldaman are no' the sort a polite word will move." },
        { id = "h_default", text = "Karnik, historian o' the Explorers' League, an' partner tae Hammertoe Grez in the Uldaman work. I'm sorry, but I've a mountain o' work an' very little patience, so tell me what ye need, an' tell me quickly." },
        { id = "h_amulet", tags = { "news" }, when = { questActive = TODO_QUEST("Prospect of Faith") },
          text = "That's Hammertoe's amulet. Then this changes everythin'; if he sent ye wi' it, then he knew what was at stake, an' we'll have tae mourn him later." },
        { id = "h_belgrum", tags = { "news" }, when = { questActive = TODO_QUEST("Passing Word of a Threat") },
          text = "Find Advisor Belgrum, give him my note, an' tell him what ye saw. I'll speak tae Hammertoe's spirit in the meantime, for he may know somethin' that'll stop the Shadowforge." },
        { id = "h_infernus", tags = { "news" }, when = { questActive = TODO_QUEST("An Ambassador of Evil") },
          text = "Ambassador Infernus sits in Angor Fortress, sent there by Ragnaros himself tae mind the Shadowforge diggers. Strike him there, an' their work in Uldaman slows tae a crawl." },
        { id = "h_infernus_done", when = { questDone = TODO_QUEST("An Ambassador of Evil") },
          text = "Belgrum sent word that Infernus is dead, an' aid's goin' tae the Badlands tae recover the dig. Hammertoe would've raised a glass, an' I've raised one for him." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! The kaldorei histories go back further than ours, ye know, an' it drives me half mad that they keep most of it in their heads." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, an' welcome! The Uldaman tablets are full o' marks nobody can read, an' I've a feelin' yer kind would see more in them than I do." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye've a smell o' brimstone about ye, an' I'd be a poor historian if I didnae recognise it. Sit down, if ye like, but keep yer friend outside." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good; a warrior's of more use tae the League these days than another scholar, an' I say that as a scholar." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll have a sharp eye, then, an' the League's always short o' those." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. If ye've come tae sell me somethin' ye found in Uldaman, I'll want tae know exactly where ye found it, an' I'll know if ye're lyin'." },
      },
      again = {
        { id = "h_again", text = "Well? What else?" },
        { id = "h_again2", text = "Go on, then; I'll listen for a minute more." },
      },
      choices = {
        { text = "Why does that trouble a historian so much?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You look deep in some work, Historian.", next = "work" },
        { text = "Tell me about Hammertoe Grez.", next = "hammertoe" },
        { text = "Who threatens your work in Uldaman?", next = "shadowforge" },
        { text = "So you spoke with a spirit.", next = "spirit", when = { any = { { questActive = TODO_QUEST("Passing Word of a Threat") }, { questDone = TODO_QUEST("Passing Word of a Threat") } } } },
        { text = "Could the Light ease Hammertoe's spirit?", next = "light", when = { class = "PRIEST", any = { { questActive = TODO_QUEST("Passing Word of a Threat") }, { questDone = TODO_QUEST("Passing Word of a Threat") } } } },
        { text = "I hear spirits too, historian. Through the earth.", next = "k_shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "What do you hope a mage would see in the Uldaman tablets?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does a historian have opinions about my sort, Karnik?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why would the League need warriors more than scholars?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the Explorers' League ever need hunters, Historian?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would you have a paladin do about the Shadowforge?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you buy relics from a rogue, Historian?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The Shadowforge are dwarves, Historian. Our own kin.", next = "dw_kin", when = { race = "Dwarf" } },
        { text = "What does a League historian actually do all day?", next = "kn_day" },
        { text = "What do you make of humans, Historian?", next = "hu_view" },
        { text = "Your records seem very hard on my people, Historian.", next = "hu_x", when = { race = "Human", ["not"] = { npcFlagBefore = "karnik_human_soft" } } },
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
        { text = "The League should share what it finds.", next = "BACK", reply = "Maybe it should, an' maybe one day it will, but no' while the Dark Irons are diggin' in the same places we are.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Some finds must be guarded.", next = "BACK", reply = "They must. An' I've already said too much, for the walls in this library have ears.", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },

    hammertoe = {
      lines = {
        { id = "ha_default", text = "An explorer an' my partner in the Uldaman work, an' a stubborn old digger who'd go anywhere for a find. He's out in the Badlands now, an' I havenae heard from him in too long." },
        { id = "ha_dead", when = { questDone = TODO_QUEST("Prospect of Faith") },
          text = "He was my partner in the Uldaman work, an' the Shadowforge killed him for what we knew. He sent ye tae me wi' his amulet, so he trusted ye at the end, an' I do too." },
      },
      choices = {
        { text = "His work must be finished.", next = "BACK", reply = "Aye, it must, an' I'll see it done, wi' or without him, though I'd much rather it were with him.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "No find is worth a life.", next = "BACK", reply = "No, it isnae, an' I keep tellin' him so, but Hammertoe was never one for listenin', an' I doubt he's started now.", fx = { align = { honor = -1 } } },
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
        { text = "Then we strike before he grows stronger.", next = "BACK", reply = "Aye, we should, an' I'll say it tae the King, but the King will want tae be sure, an' I cannae blame him for that.", fx = { align = { order = -1 }, trait = { brave = 1 }, learn = { "dark_iron" } } },
        { text = "Then we wait for the King's word.", next = "BACK", reply = "That's the proper way. I only hope the King's word comes before Ragnaros does.", fx = { align = { order = 1 }, trait = { cautious = 1 }, learn = { "dark_iron" } } },
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
        { text = "Then I'll help him finish, and pray him home.", next = "BACK", reply = "Bless ye. He'd be glad o' it; he never did like leavin' a job half done, alive or dead.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "The dead shouldn't be called back to talk.", next = "BACK", reply = "Maybe they shouldnae, an' I've wondered myself, but Hammertoe came tae me, no' the other way round, so I'll listen.", fx = { align = { light = -1 }, affinity = -1 } },
      },
    },
    k_shaman = {
      big = true,
      lines = {
        { id = "xsh_default", text = "Do ye, now. Then ye'll no' laugh at me for talkin' wi' Hammertoe's ghost the way the young Prospectors do behind my back. Tell me true: do they hear us, the dead, or do they only talk?" },
      },
      choices = {
        { text = "They hear, if you speak plainly.", next = "k_shaman_hear" },
        { text = "The dead belong to the earth. Let them rest.", next = "BACK", reply = "Aye, they should, an' maybe that's the kindest thing, but Hammertoe's no' ready tae rest, an' I'll no' force him.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "If they still have work to do, help them do it.", next = "BACK", reply = "That's what I've been tryin' tae do! The young ones think I'm daft, but a shaman would know better.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    k_shaman_hear = {
      lines = {
        { id = "xshh_default", text = "Then I've been too short wi' him, an' he never once complained. I'll go back tae the Badlands when my work lets me, an' I'll say it all slower." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    dw_kin = {
      big = true,
      lines = {
        { id = "dwk_default", text = "Aye, they are, an' that keeps me up at night more than any fire-lord. Every Dark Iron diggin' in Uldaman had a grandsire who drank in the same halls as mine, before the War o' the Three Hammers, an' I'd give a deal tae know whether they dig for Ragnaros because they want tae, or because they cannae stop." },
      },
      choices = {
        { text = "Thralls or not, they killed Hammertoe. No pity.", next = "dw_kin_hard", fx = { align = { light = -1 } } },
        { text = "If they're thralls, some of them might be freed.", next = "dw_kin_soft", fx = { align = { light = 1 } } },
        { text = "Can't they stop?", next = "dw_kin_bound" },
      },
    },
    dw_kin_bound = {
      lines = {
        { id = "dwkb_default", text = "When Thaurissan called the Firelord up, the old accounts say Ragnaros didnae go home again; he stayed under Blackrock an' made the survivors his. Two hundred years an' more o' servin' fire will change a clan's heart, an' I'm no' sure there's a Dark Iron alive who remembers what it was like before." },
      },
      choices = {
        { text = "That's a grim kind of kinship.", next = "BACK", fx = { learn = { "dark_iron" } } },
        { text = "Something else, Historian.", next = "BACK" },
      },
    },
    dw_kin_hard = {
      lines = {
        { id = "dwkh_default", text = "No, an' I'll no' ask ye for any, for I've buried my partner an' I've no pity left tae spare. Only mind that the line between us an' them was drawn by a war an' a fire, an' no' by the stone we were made from." },
      },
      choices = {
        { text = "Something else, Historian.", next = "BACK" },
      },
    },
    dw_kin_soft = {
      lines = {
        { id = "dwks_default", text = "That's a kinder thought than I've heard in this library in a year, an' I hope ye're right. If ever ye meet a Dark Iron who'll lay down his pick an' talk, bring him tae me, an' I'll listen before the guards do." },
      },
      choices = {
        { text = "Something else, Historian.", next = "BACK" },
      },
    },
    kn_day = {
      lines = {
        { id = "knd_default", text = "Reads what the Prospectors send back an' tells them where they've got it wrong, an' then writes tae the High Explorer tae tell him the same. The rest o' the time I'm matchin' rubbings from Uldaman against Ironband's dig, lookin' for the same mark in two places, for that's how ye find what was one thing once." },
      },
      choices = {
        { text = "That sounds slower than digging.", next = "BACK", reply = "It's slower, aye, an' it's where every find actually becomes knowledge. A dug-up relic wi' no reader is just a heavy stone in a crate.", fx = { affinity = 1 } },
        { text = "Something else, Historian.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've books on most things an' opinions on the rest. Be quick; here's what I know." } },
    background = { { id = "tp_bg", text = "I'm a historian o' the Explorers' League. My work's Uldaman, an' my partner in it was Hammertoe Grez, an' that's all I'll say about myself." } },
    advice = { { id = "tp_ad", text = "If it's written down somewhere, read it before ye ask me, an' if it isnae, then ask me." } },
    uldaman = { { id = "tp_uldaman", text = "The old titan vaults in the Badlands, where Hammertoe an' I spent our best years.", next = "work" } },
    dark_iron = { { id = "tp_dark_iron", text = "The Shadowforge clan is diggin' in Uldaman, an' they answer tae somethin' worse than themselves.", next = "shadowforge" } },
    grim_batol = { { id = "tp_grim_batol", text = "The Wildhammer's old hold, cursed by the Dark Irons' last spell an' fit for nobody since. Hammertoe used tae say he'd dig there one day, an' I told him he'd be digging his own grave." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "Dark Irons, diggin' deep an' building grand under Blackrock, an' every one o' them would cut my throat for my notes. I'd like tae know what they want in Uldaman, an' I'd like tae know it soon." } },
    thaurissan = { { id = "tp_thaurissan", text = "A sorcerer-thane who called up somethin' he couldnae put back down. Every scholar o' my age has read the accounts o' that day an' wished they hadnae." } },
    _none = { { id = "tp_none", text = "I've nae book on that, an' nae time tae write one." } },
  },
}

-- Advisor Belgrum: advisor to Magni, acts on the King's authority; the Tablet of Will.
P:NPC {
  key = "belgrum", id = TODO_NPC("Advisor Belgrum"), name = "Advisor Belgrum",
  bible = "bibles/commons.md", role = "noble", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "loyal", "dutiful" },
  notices = { "reputation", "lock_armor" },

  impression = {
    first = "He reads quickly, frowns slowly, and feels the King's weight.",
    third = "{name} met Advisor Belgrum, who advises King Magni and acts on his authority in the Hall of Explorers.",
  },

  greetings = {
    { id = "g_hmm", text = "Hmm? Yes, what is it?" },
    { id = "g_honored", when = { reputation = { faction = "Ironforge", min = "honored" } }, text = "Ah, a friend o' Ironforge. Come in; ye've earned a straight answer." },
  },

  notice = {
    { id = "n_rep", cat = "reputation", when = { reputation = { faction = "Ironforge", min = "revered" } },
      text = "The King knows yer name, ye understand. He doesnae say so often, but he keeps a list, an' ye're on it." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That's no' leather ye've wrapped yerself in but somethin' that was skin on a demon, an' it moves when ye breathe. The King lets yer kind train here, but he'd no' let ye stand at court dressed like that, so mind where ye wear it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Depends which senator ye ask an' how much he's had tae drink. The old families say the Titans gave us all the answers we need, an' others mutter that Thaurissan started wi' callin' on fire, an' look where that went. I remind them the King's own friend is a Wildhammer shaman, an' I watch them change the subject." } },
      choices = {
        { text = "The Senate should hear us out. I'll make my case properly.", next = "BACK", reply = "I'll see ye get a fair hearin'. The Senate likes a dwarf who comes through the front door wi' his hat in his hand.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't need the Senate's blessing to hear the stone.", next = "BACK", reply = "Maybe ye dinnae, but ye'll want it eventually, so I'd tread carefully, for the Senate has long memories an' short tempers.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It reaches by letter an' by ship from Menethil, though slower than either of us would like. The King values the kaldorei as allies, but he'll no' pretend he understands a people who'd sooner live in a tree than under a mountain." } },
      choices = {
        { text = "Alliances run on letters and patience. I'll carry them if asked.", next = "BACK", reply = "I'll remember ye said so. A reliable messenger is worth more tae the King than ye'd think.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Letters are slow. Friendship between peoples is made on the road.", next = "BACK", reply = "Aye, it is. But the road's a long way from the throne room, an' the King has tae work wi' what reaches him.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That they stand firm at the gates o' Khaz Modan while the rest o' the Alliance squabbles over coin. The Dark Irons press us from the south an' the troggs from below, an' the King would sooner see a warrior at Thelsamar than at a banquet in Stormwind." } },
      choices = {
        { text = "Then I'll serve wherever the King needs me.", next = "BACK", reply = "The King will be glad tae hear it. He needs every warrior who'll go where they're sent, an' there's fewer than ye'd think.", fx = { align = { order = 1 } } },
        { text = "I'll go where the fighting suits me, Advisor.", next = "BACK", reply = "Fair enough, but the King's needs dinnae always match the fightin' ye like, so mind ye dinnae end up somewhere ye're no' needed.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than ye'd think, for the passes o' Khaz Modan are long an' the mountaineers cannae watch them all. A hunter who brings word o' the Frostmane movin' in the high snows does the King as much service as a regiment." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "More than ye'd think, for the passes o' Khaz Modan are long, an' word o' the Frostmane movin' in the high snows serves the King as well as a regiment. An' I see yer {pet} is well kept, which tells me more about ye than any letter o' introduction." },
      },
      choices = {
        { text = "I'll carry word to the throne whenever I can.", next = "BACK", reply = "The King will be grateful. A word from the high snows has saved Kharanos more than once.", fx = { align = { order = 1 } } },
        { text = "I hunt for myself, Advisor, not for the throne.", next = "BACK", reply = "Fair enough, but the throne's the reason ye've snows tae hunt in at all, so think on that the next time ye see a troll.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Somebody's been foulin' the forge vents an' loosenin' bolts on the tram, an' I'd stake my beard it's Dark Iron agents walkin' among us in plain coats. A quiet hand could find them before the guards blunder in, an' the King would remember who did it." } },
      choices = {
        { text = "Then point me at the Dark Irons. I'll serve the throne.", next = "BACK", reply = "I'll see the King hears o' it. A quiet hand in the right place is worth a dozen guards in the wrong one.", fx = { align = { order = 1 } } },
        { text = "The Circle looks after its own, Advisor, not the King.", next = "BACK", reply = "Then the Circle will find the King looks after his own too, an' I'd rather no' see the two o' ye come tae blows.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Well enough, for the Mystic Ward has stood wi' us since the Second War an' the gnomes brought fine minds wi' them out o' Gnomeregan. His Majesty only asks that nobody sets the Ward alight, which happens more than ye'd think." } },
      choices = {
        { text = "The Ward serves the King. I'm proud to be part of it.", next = "BACK", reply = "Good. The Ward's been a great help since the gnomes brought their clever minds up wi' them.", fx = { align = { order = 1 } } },
        { text = "Magic answers to the mage, Advisor, not to any throne.", next = "BACK", reply = "Maybe it does, but the King pays for the Ward's candles, an' he'll want a say in what's done by their light.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It tolerates them because they're trained in this city an' watched in this city, an' I'd rather know where ye are. The King has no love for yer craft, but he has less for the Dark Irons, so ye'll find work if ye point it the right way." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It tolerates them because they're trained in this city an' watched in this city, an' I see ye've brought yer {pet} intae the King's own hall tae make the point. The King has no love for yer craft, but he has less for the Dark Irons, so point that thing the right way an' ye'll find work." },
      },
      choices = {
        { text = "Point me at the Dark Irons, and I'll prove my worth.", next = "BACK", reply = "Then I'll point, an' gladly, for the Dark Irons have been walkin' our halls in plain coats, an' I'd like them found.", fx = { align = { light = 1 } } },
        { text = "The King will need my craft long before I need his love.", next = "BACK", reply = "Maybe so, but the King's love is what keeps ye in the city, so I'd no' be too quick tae test how much he can spare.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every night, though no' where the King can hear, for he'll no' have pity in his hall. Princess Moira's been gone tae the Dark Irons long enough that some folk speak o' her in the past, an' I'll thank ye no' tae be one o' them." } },
      choices = {
        { text = "Then I'll pray she comes home, and I won't stop.", next = "BACK", reply = "Bless ye. I've run out o' words for it myself, an' it eases my heart tae know someone else is still askin'.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't free her. Somebody has to go to Blackrock.", next = "BACK", reply = "Aye, somebody does, an' the King knows it, but he'll no' send an army after her, so it'll have tae be somebody braver than an army.", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else, Advisor.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Steadiness, mostly, for the Dark Irons are pressin' from the south an' the Senate is pressin' from the north, an' His Majesty's in the middle wi' his temper. A paladin who keeps his oath an' his head is worth ten who only keep the one." } },
      choices = {
        { text = "My oath is to the King's law. I'll keep it steady.", next = "BACK", reply = "That's what His Majesty needs most. A steady paladin in the hall is worth more than ye'd think, wi' the Senate as it is.", fx = { align = { order = 1 } } },
        { text = "My oath is to the Light, Advisor. Not to the Senate.", next = "BACK", reply = "That's an honest answer, an' I'll respect it, but the Light an' the King's law have walked together a long while in this city.", fx = { align = { order = -1 } } },
        { text = "Something else, Advisor.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The King keeps a few o' yer sort close, an' I'm glad of it, for the court's tempers could use a calm voice now an' again." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, standin' in the King's own hall. Good; the throne's always glad o' a sworn blade, an' doubly glad when it's a sworn blade that thinks first." },
        { id = "h_default", text = "Belgrum, advisor tae King Magni Bronzebeard. I carry the King's word where he cannae carry it himself, which is most places, for he's a busy dwarf." },
        { id = "h_note", tags = { "news" }, when = { questActive = TODO_QUEST("Passing Word of a Threat") },
          text = "A note from Karnik? Good; his notes go tae the top o' the pile. Let me read it." },
        { id = "h_tidings", tags = { "news" }, when = { questDone = TODO_QUEST("Passing Word of a Threat") },
          text = "Och, those were evil tidings Karnik sent. Go back tae him an' say the King's authority is behind him, so he's tae act swiftly; the Shadowforge must be halted in the Badlands." },
        { id = "h_tablet", tags = { "news" }, when = { questActive = TODO_QUEST("The Lost Tablets of Will") },
          text = "Hammertoe Grez's quest is still unfulfilled. Find the Tablet o' Will in Uldaman before the Shadowforge do, for I owe him that much, an' so does Ironforge." },
        { id = "h_tablet_done", when = { questDone = TODO_QUEST("The Lost Tablets of Will") },
          text = "The tablet's wi' the King's mages now, an' they're arguin' over it day an' night. Whatever it is, it's ours, an' no' the Dark Irons', thanks tae you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "One o' the Hidden Circle's lot, unless I miss my guess, an' I rarely do. I've a use for quiet folk this season, so speak plainly." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at the King's side door! If ye've come from the Hall o' Mysteries wi' a petition, I'll hear it, but keep it brief, for there's a queue." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'll speak plain, as the King would want: ye've brought a smell o' brimstone intae the throne room, an' every guard here has a hand on his axe. Say what ye came tae say." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The King's always had a soft spot for warriors, for he was raised among them, an' so was I." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The King's rams an' the King's rifles both owe plenty tae hunters, an' the throne remembers it." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid o' the kaldorei, standin' in the King's own hall. Ye're a long way from yer forests, so I'll see ye're treated as a guest o' the throne." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman o' Khaz Modan. The King's spoken o' Earthseer Farsen often enough that I'll no' be the one tae turn my nose up at ye, though some in the Senate would." },
      },
      again = {
        { id = "h_again", text = "Anythin' further?" },
        { id = "h_again2", text = "Be brief, if ye please; the King's reports pile up faster than I can read them." },
      },
      choices = {
        { text = "What does an advisor to the King do?", next = "advisor" },
        { text = "What's the Tablet of Will?", next = "tablet", when = { any = { { questActive = TODO_QUEST("The Lost Tablets of Will") }, { questDone = TODO_QUEST("The Lost Tablets of Will") } } } },
        { text = "The King seems to trust Karnik completely.", next = "karnik", when = { any = { { questActive = TODO_QUEST("Passing Word of a Threat") }, { questDone = TODO_QUEST("Passing Word of a Threat") } } } },
        { text = "What does the Senate think of all this?", next = "senate" },
        { text = "I've served Ironforge well, Advisor.", next = "served", when = { reputation = { faction = "Ironforge", min = "honored" } } },
        { text = "What does Ironforge want from Stormwind, Advisor?", next = "k_human", when = { race = "Human" } },
        { text = "What use does the throne have for quiet folk?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How does the throne view the mages of Ironforge?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the throne tolerate people with my sort of learning, Advisor?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What does the King ask of Ironforge's warriors these days?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the throne have any use for hunters, Advisor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The court must pray for the King's daughter.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does Ironforge need most from its paladins, Advisor?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the King's word reach as far as Darnassus?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What does the Senate really make of dwarven shamans, Advisor?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "What threatens the mountain most, Advisor?", next = "threats" },
        { text = "I want to serve the throne, Advisor. Where am I needed?", next = "dw_serve", when = { race = "Dwarf" } },
        { text = "Good day, Advisor.", next = "END" },
      },
    },

    advisor = {
      lines = {
        { id = "ad_default", text = "I read what comes in, an' I decide what needs the King's eyes an' what needs only his name. It's a lot o' readin', an' a lot o' decidin', an' very little sleep." },
      },
      choices = {
        { text = "That's a lot of power for one dwarf.", next = "advisor_power" },
        { text = "Something else.", next = "BACK" },
      },
    },
    advisor_power = {
      lines = {
        { id = "ap_default", text = "It is, an' I don't forget it. I use the King's name only where he'd use it himself, an' if ever I'm wrong, he'll tell me, loudly, in front o' everyone." },
      },
      choices = {
        { text = "A king needs trusted hands to act for him.", next = "BACK", reply = "I try tae be worthy o' the trust, though the King has a way o' remindin' me how heavy it is.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The King should speak for himself.", next = "BACK", reply = "He does, an' loudly, but he cannae be everywhere at once, so somebody has tae carry his voice where his feet cannae go.", fx = { align = { order = -1 }, affinity = -1 } },
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
        { text = "Then the tablet should be destroyed.", next = "BACK", reply = "Some on the Senate say so, an' I've half a mind tae agree, but a thing destroyed cannae be studied, an' the Dark Irons might have copies.", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Then Ironforge should learn to use it first.", next = "BACK", reply = "That's the other half o' the Senate, an' they're just as loud, but I'd rather no' build an army we cannae control either.", fx = { align = { light = -1 }, trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    karnik = {
      lines = {
        { id = "ka_default", text = "He's earned it, for he's been right about Uldaman for years while the rest of us were busy bein' wrong. When Karnik sends a note, I read it before my breakfast." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    senate = {
      lines = {
        { id = "se_default", text = "The Senate thinks the King acts too quickly, an' the King thinks the Senate thinks too slowly, an' I stand in the middle wi' a great many papers. Both of them are right, now an' then." },
      },
      choices = {
        { text = "Swift action saves lives.", next = "BACK", reply = "That's the King's argument, an' a good one. But I've seen swift action cost lives too.", fx = { align = { order = -1 } } },
        { text = "The Senate's caution keeps the King honest.", next = "BACK", reply = "That's the Senate's argument. But caution's cost lives as well, so I stand in the middle an' get shouted at from both sides.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    served = {
      big = true,
      lines = {
        { id = "sv_default", text = "Ye have, an' Ironforge doesnae forget. Before ye go, there may be one more thing I'd ask o' ye in the King's name, when the time comes." },
      },
      choices = {
        { text = "Ask, and it's done.", next = "BACK", reply = "I'll remember ye said so. His Majesty will be glad tae know he has a friend he can count on.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "I'll hear the terms first.", next = "BACK", reply = "I'd expect no less from someone wi' sense. I'll lay them out plain when the time comes.", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },
    k_human = {
      lines = {
        { id = "xhm_default", text = "Its word kept, mostly, an' its debts paid, which are no' always the same thing. We sent axes when the Alliance asked, an' the Senate would like tae see some o' them come home before Stormwind asks for more." },
        { id = "xhm_noble", when = { origin = "human_minor_noble" },
          text = "Ye'd know better than most what the House o' Nobles says about us when we're no' in the room. Tell them, if ye ever sit down wi' them, that the Senate keeps a ledger as well." },
      },
      choices = {
        { text = "Stormwind will honor its debts, Advisor.", next = "BACK", reply = "I hope so, an' I'll take yer word for it, for the Senate's patience is no' what it was, an' neither is the King's.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Stormwind's court honors nothing it can avoid.", next = "BACK", reply = "That's a hard thing tae hear from one o' its own, an' I'll keep it tae myself, for the Senate would only use it as a club.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    threats = {
      big = true,
      lines = {
        { id = "thr_default", text = "Ask the Senate an' ye'll get six answers, so here's the King's. The Dark Iron in the south, for they've Ragnaros behind them now; the troggs out o' Uldaman an' Gnomeregan both, for there's no end tae them; an' the Frostmane trolls in the western snows, who were killin' dwarves long before the others." },
      },
      choices = {
        { text = "Then strike the Dark Iron first, and hard.", next = "BACK", reply = "That's the King's heart talkin', an' half the Military Ward's. The other half reminds him that every army we send south leaves Dun Morogh thinner, an' the troggs can count.", fx = { align = { order = -1 } } },
        { text = "Then hold the walls and the roads before anything else.", next = "BACK", reply = "That's the Senate's view, an' it's kept us alive through two wars an' a flood o' refugees. It's no' glorious, but a dwarf behind a good wall is a dwarf that sees his grandchildren.", fx = { align = { order = 1 } } },
        { text = "Where did the troggs come from?", next = "threats_troggs" },
      },
    },
    threats_troggs = {
      lines = {
        { id = "tht_default", text = "From under the earth, deeper than any dwarf has dug, an' that's near all anybody knows. They came boilin' up out o' Gnomeregan an' out o' Uldaman at near the same time, an' the League thinks they're tied tae the old titan vaults somehow, though nobody can say how wi'out a trogg willin' tae explain." },
      },
      choices = {
        { text = "Something else, Advisor.", next = "BACK", fx = { learn = { "troggs" } } },
      },
    },
    dw_serve = {
      lines = {
        { id = "dws_default", text = "Everywhere, {g:lad|lass}, an' that's the honest truth. The mountaineers want rifles on the Loch Modan roads, the League wants strong backs in the Badlands, an' the King wants dwarves who'll go where they're sent an' come home tae tell him what they saw. Which o' those suits ye?" },
      },
      choices = {
        { text = "The roads. Someone has to keep them open.", next = "BACK", reply = "Then see Mountaineer Barleybrew at the South Gate, or go on tae Thelsamar an' the Loch. They'll work ye hard, an' ye'll be thanked by every caravan that gets through.", fx = { trait = { practical = 1 } } },
        { text = "The League. I want to see Uldaman.", next = "BACK", reply = "Then the Hall o' Explorers is up the way, an' Magellas will talk yer ear off. Tell him I sent ye, an' he'll pretend tae be annoyed.", fx = { trait = { curious = 1 } } },
        { text = "Wherever the King sends me, I'll go.", next = "BACK", reply = "That's an old-fashioned answer, an' the best one. Keep earnin' the mountain's trust, an' one day the King will send for ye by name.", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Plenty passes across my desk on its way tae the King. Here's what I can repeat." } },
    background = { { id = "tp_bg", text = "I advise the King an' act on his authority when he's elsewhere. My own story is very dull, an' I'd like tae keep it that way." } },
    advice = { { id = "tp_ad", text = "Read the whole note before ye act on it. The important part's always at the bottom." } },
    uldaman = { { id = "tp_uldaman", text = "Titan vaults, an' Dark Irons diggin' in them, an' an advisor who cannae sleep.", next = "tablet" } },
    magni = { { id = "tp_magni", text = "The King carries more than he lets the Commons see, between his daughter, his brothers an' the Senate. I carry what he hands me an' try tae hand back less." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The King's daughter is under that mountain, an' it's no' a matter I'll discuss in the hall. Ask Magni if ye must, an' see what his face does." } },
    thandol_span = { { id = "tp_thandol_span", text = "The Span's broken, an' the King wants it mended, an' the Senate wants tae know the cost. I spend my days carryin' messages between the two, an' they're both right." } },
    wildhammer = { { id = "tp_wildhammer", text = "The King's correspondence wi' Aerie Peak is cordial an' brief, which, for dwarves, is a fine sign. Falstad writes a good letter, though his spellin' is his own." } },
    _none = { { id = "tp_none", text = "That hasnae crossed my desk. If it's important, it will." } },
  },
}

-- Grand Mason Marblesten: builds the King's memorial to Sully Balloo from Alterac granite.
P:NPC {
  key = "marblesten", id = TODO_NPC("Grand Mason Marblesten"), name = "Grand Mason Marblesten",
  bible = "bibles/commons.md", role = "worker", tier = "quest",
  communities = { "ironforge" }, temper = { "jovial" }, values = { "proud", "practical" },
  notices = { "craft", "lock_shards" },

  impression = {
    first = "Under the cheer he is weary of carving memorials to soldiers.",
    third = "{name} met Grand Mason Marblesten, the master stonemason of Ironforge's Commons.",
  },

  greetings = {
    { id = "g_hu_prej", when = { race = "Human" }, priority = 5,
      text = "A human in the Commons! Mind ye dinnae lean on my granite, {g:lad|lass}; it came all the way from Alterac, an' yer kin have done enough damage up there already." },
    { id = "g_hu_soft", when = { race = "Human", npcFlagBefore = "marblesten_human_soft" }, priority = 10,
      text = "My human stonecutter! Come an' look at the memorial; I've been thinkin' o' Lothar's men while I chisel, an' the work's the better for it." },
    { id = "g_stone", text = "Good day tae ye! Mind the chisels, for they're sharper than they seem, an' they seem very sharp." },
    { id = "g_back", when = { metBefore = true }, text = "{name}, {name}, {name}! Have ye brought me stone?" },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Ye've grit in yer knuckles. If ye ever find a seam o' good white marble, ye'll tell me before ye tell anyone else, won't ye?" },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "Whatever's clinkin' in yer pack is cold enough that the stone dust on my bench has gone damp beside ye. Granite feels heat an' it feels cold, an' I'd sooner it didnae feel whatever's in those wee purple stones." },
  },

  start = "hello",
  nodes = {
    -- Humans (human patch): wry view of humans; Persuade softener sets marblesten_human_soft.
    hu_view = {
      lines = {
        { id = "huv_default", key = true,
          text = "Oh, I like them well enough, {g:lad|lass}! They quarry the finest granite in the world up in Lordaeron, an' then they fight over it, an' plague it, an' leave it in such shambles that I've tae send a body clear tae Darrow Hill tae fetch a block for the King's memorial." },
        { id = "huv_human", when = { race = "Human" },
          text = "I like yer folk well enough, an' I'll tell ye why: ye sit on the best stone in the world. It's only a shame ye keep knockin' down everythin' ye build on it." },
      },
      choices = {
        { text = "What's wrong with how they build?", next = "hu_view2" },
        { text = "Stormwind looks well enough built to me.", next = "hu_view2" },
        { text = "Something else, Grand Mason.", next = "BACK" },
      },
    },
    hu_view2 = {
      big = true,
      lines = {
        { id = "huv2_default",
          text = "Nothin' wrong wi' the buildin', only the keepin'! They raise a city, burn it, raise it again an' then refuse tae pay the masons who raised it, an' up north a human king sold the whole Alliance tae the orcs from Alterac. Fine stone, short memories, that's humans in a sentence." },
      },
      choices = {
        { text = "They rebuild every time. That's worth admiring, Grand Mason.", next = "BACK",
          reply = "It is, it is! I'll admit there's nobody on this world better at startin' over, an' maybe that's the trick o' livin' short.",
          fx = { align = { order = 1 }, opinion = { humans = "respect" } } },
        { text = "A people who won't pay their masons don't deserve stone.", next = "BACK",
          reply = "Ha! Now ye sound like the Stonemasons' Guild, an' I'll no' say they're wrong, though I'll no' say it near a Stormwind envoy either.",
          fx = { align = { order = -1 }, opinion = { humans = "distrust" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x = {
      lines = {
        { id = "hux_default", key = true,
          text = "I speak of it as it happened, {g:lad|lass}. One o' yer kings sold the Alliance tae the Horde, an' another took dwarven guns tae win the war an' then left Khaz Modan tae dig itself out o' the rubble, so dinnae look so wounded when an old mason grumbles." },
      },
      choices = {
        { text = "Perenolde was a traitor. Lothar's men bled beside your kin.", tag = "Persuade", next = "hu_x_soft",
          check = { pass = { any = { { disposition = { min = 55 } }, { class = "PALADIN" }, { profession = "Mining" } } } },
          fail = { next = "hu_x_fail", fx = { affinity = -1 } } },
        { text = "Dwarves have short memories of their own, it seems.", next = "BACK",
          reply = "Short? I'll have ye know my memory's carved in granite, an' it says ye owe us.", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x_soft = {
      lines = {
        { id = "huxs_default", key = true, fx = { npcFlag = { set = { "marblesten_human_soft" } } },
          text = "Aye, they did, an' some o' those men are carved on the walls o' this very hall, if ye know where tae look. Perenolde was one human, an' Lothar was another, an' I'll try tae remember the second one as often as the first." },
      },
      choices = {
        { text = "That's all I ask, Grand Mason.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x_fail = {
      lines = {
        { id = "huxf_default", text = "Bled beside us, aye, an' then went home an' sent us a bill for the honour. Come back when ye've a better argument than a history lesson." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Farewell, Grand Mason.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Soldiers from the Wetlands an' Loch Modan, mostly, an' a good few from the Badlands, an' every one o' them was somebody's son or daughter. I've a fine imagination, so they tell me, but I'd much rather carve a king than a list." } },
      choices = {
        { text = "I'll fight carefully and keep my name off your list.", next = "BACK", reply = "I'll hold ye tae it. I've carved enough names this year tae last me a lifetime, an' I'd rather no' carve yours.", fx = { align = { order = 1 } } },
        { text = "If my name goes up, carve it large.", next = "BACK", reply = "Ha, I'll carve it large, but I'd rather carve it on a fountain someday, wi' nothin' underneath it but a date an' a cheer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because ye both have tae see what's no' there yet, the beast in the brush or the statue in the block. I carved a ram for the Amberstills once, an' I spent a week watchin' the real ones before I touched the stone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because ye both have tae see what's no' there yet, the beast in the brush or the statue in the block. Yer {pet} would make a grand statue, ye know, if it'd sit still for a week, which I doubt." },
      },
      choices = {
        { text = "A beast is best honoured alive, not in stone.", next = "BACK", reply = "It is. But a stone beast outlasts us all, an' sometimes that's the only way left tae honour it.", fx = { align = { honor = 1 } } },
        { text = "Carve my best kill, and I'll pay you well for it.", next = "BACK", reply = "I'll carve it, an' gladly, but I'll want tae hear the story first, for a statue wi'out a tale is just a very heavy rock.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Ye'd be amazed, for good Alterac stone is worth its weight in silver an' the Dark Irons have taken a likin' tae spoilin' the King's work. I've had a crate o' chisels vanish, an' I've a fair idea it was taken tae make me late." } },
      choices = {
        { text = "I'll find out who took them and bring them to the guards.", next = "BACK", reply = "Bless ye! The King's memorial is behind already, an' I cannae afford tae lose another crate.", fx = { align = { order = 1 } } },
        { text = "Then hire someone quieter to take them back, Grand Mason.", next = "BACK", reply = "Ha, a sensible suggestion, an' I'll consider it, though I'd prefer somebody who'd bring them back wi'out takin' a few extra.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It could hurry it, aye, but a memorial raised by a spell would be no tribute at all. Every stone on it has tae be cut by a dwarf's hands, or the King might as well have bought one off a peddler." } },
      choices = {
        { text = "You're right. Some work should be done by hand.", next = "BACK", reply = "It should. A memorial raised by a spell would be an insult tae every dwarf whose name is on it.", fx = { align = { honor = 1 } } },
        { text = "Results matter more than the method, Grand Mason.", next = "BACK", reply = "For a bridge, maybe, but no' for a memorial, for the method is the tribute, an' the dead deserve a dwarf's hands.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Trouble it? We work wi' the grain o' the stone, never against it, an' Ironforge has stood three thousand years for it. I'd call that respect, myself." } },
      choices = {
        { text = "Building with care honours the land.", next = "BACK", reply = "From a druid? Yer lot usually look at a quarry like a wound.", fx = { align = { light = 1 } } },
        { text = "Even careful hands take more than they give.", next = "BACK", reply = "Maybe they do. But Ironforge has given a good deal back over three thousand years, I'd like tae think.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some do, an' some want only the name an' the battle, an' I carve whatever they ask, though the prayers take longer an' cost more in chisels. Sully Balloo's stone has his name, the Thandol Span, an' naught else, for his kin said he'd have hated fuss." } },
      choices = {
        { text = "Every soldier deserves a blessing in stone, whether they'd want fuss or not.", next = "BACK", reply = "Aye, they do, an' I'll carve a prayer on every one, fuss or no fuss, for the families can always ignore it if they like.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The family knows best. A name is enough to remember.", next = "BACK", reply = "Aye, they do, an' I'll carve what they ask, but I'll say a quiet word over every stone myself, for my own peace.", fx = { align = { light = -1 } } },
        { text = "Something else, Grand Mason.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than a few, an' all o' them younger than I'd have liked, for the Second War an' the Thandol Span took the best o' the Silver Hand's dwarves. I'd as soon no' carve yer name, so I'll ask ye tae fight carefully, though I know ye'll no' listen." } },
      choices = {
        { text = "Their sacrifice was duty, and I'll honour it the same way.", next = "BACK", reply = "It was. There's no shortage o' paladins who'd rather forget the cost, so it's good tae hear one who doesnae.", fx = { align = { honor = 1 } } },
        { text = "I'll fight carefully. A dead paladin protects nobody.", next = "BACK", reply = "That's the best thing I've heard all week. I've no wish tae carve a paladin's name this year.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something lighter.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Granite's patient, but it remembers heat, an' I've seen a block crack clean in two from less than that wee thing's breath. This one's for Sully Balloo, who fell at the Thandol Span, an' his widow will come tae see it, so I want it perfect." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Granite's patient, but it remembers heat, an' I can feel the warmth comin' off yer demon from here, so walk it the long way round my block, if ye please. This one's for Sully Balloo, who fell at the Thandol Span, an' his widow will come tae see it, so I want it perfect." },
      },
      choices = {
        { text = "I'll keep it away. Sully deserves a perfect stone.", next = "BACK", reply = "Thank ye kindly. Sully's widow has waited long enough, an' I'll no' have his stone crack because o' some careless creature.", fx = { align = { honor = 1 } } },
        { text = "Stone is stone. Carve faster, Grand Mason.", next = "BACK", reply = "Faster? The dead dinnae care how fast, only that it's right, an' I'll carve it right if it takes me till spring.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_hu_prej", when = { race = "Human", ["not"] = { npcFlagBefore = "marblesten_human_soft" } },
          text = "Grand Mason Marblesten, an' that's Alterac granite ye're standin' beside. Yer folk quarried it, plagued the hills it came from an' then forgot where they'd left it, so I've had tae send for it like a beggar." },
        { id = "h_hu_soft", when = { race = "Human", npcFlagBefore = "marblesten_human_soft" },
          text = "Ah, there ye are! The memorial's comin' along, an' I've stopped grumblin' about Alterac in front o' the apprentices, mostly on yer account." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Ye'll want tae see the memorials, then, for I carve the names an' somebody ought tae say the words over them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, eh? Ye've the walk o' a dwarf who's stood in a shield wall, an' I've carved too many o' those for my likin'." },
        { id = "h_default", text = "Marblesten, Grand Mason o' Ironforge. If it's stone an' it's standin' in this city, chances are I carved it, or I've complained about whoever did." },
        { id = "h_tribute", tags = { "news" }, when = { questActive = TODO_QUEST("A King's Tribute") },
          text = "The King sent ye himself? Well, well, then it's no' a small job! A memorial tae a soldier called Sully Balloo, ye say, who died at the Thandol Span?" },
        { id = "h_granite", tags = { "news" }, when = { questObjective = { TODO_QUEST("A King's Tribute"), left = { min = 1 } } },
          text = "Tell me ye've enough Alterac granite for me tae begin. Darrow Hill in Hillsbrad has the finest stone in the north, an' I'll have nothin' less for this." },
        { id = "h_done", when = { questDone = TODO_QUEST("A King's Tribute") },
          text = "The memorial's finished, an' it's some o' my best work, if I say so myself, an' I do. Lordaeron gives the finest stone there is, an' it's a pity the land's in ruins." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, eh? Ye'll find no trees in here, friend, only stone that's been shaped by dwarven hands for longer than most forests have stood." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye walk like a dwarf who's been told no' tae, an' I've a quarry full o' granite that I'd rather didnae walk off on its own." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, is it? I've seen yer kind try tae shape stone wi' spells, an' it never once came out square." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Mind ye come home in one piece, for I've carved enough warriors' names this year tae last me a lifetime." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll have an eye for a shape, then, an' I've always said a good hunter would make a passable mason." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Mind where ye stand, for somethin' about ye is givin' off heat. I've a block o' Alterac granite set aside for the King's memorial, an' if it scorches I'll be carvin' yer name next." },
      },
      again = {
        { id = "h_again", text = "What else? I've a block coolin' an' a chisel itchin'." },
        { id = "h_again2", text = "Go on; stone's patient." },
      },
      choices = {
        { text = "Doesn't carving a whole mountain trouble the earth?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What makes stone good?", next = "stone" },
        { text = "Who was Sully Balloo?", next = "sully", when = { any = { { questActive = TODO_QUEST("A King's Tribute") }, { questDone = TODO_QUEST("A King's Tribute") }, { questDone = TODO_QUEST("Sully Balloo's Letter") } } } },
        { text = "You must carve a great many memorials.", next = "memorials" },
        { text = "I'm a miner myself.", next = "miner", when = { profession = "Mining" } },
        { text = "This stone has a voice, Grand Mason. I can hear it.", next = "k_shaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Who steals granite, Grand Mason?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could magic not help with the memorial?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Whose names have you been carving, Grand Mason?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why would a hunter make a good mason?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the families ask for prayers carved on the memorials?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "There must be paladins among the names you've carved.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would my little companion really harm your granite, Grand Mason?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do you make of humans, Grand Mason?", next = "hu_view" },
        { text = "You speak of Alterac as if every human sold the Alliance out.", next = "hu_x", when = { race = "Human", ["not"] = { npcFlagBefore = "marblesten_human_soft" } } },
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
        { text = "The best work deserves the best stone.", next = "BACK", reply = "It does. The King's coin is well spent on a stone that'll stand a thousand years.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Local stone would honor him just as well.", next = "BACK", reply = "Maybe it would. But Alterac stone has a grain that holds a name sharp for longer than any I've cut.", fx = { align = { order = -1 } } },
      },
    },

    sully = {
      lines = {
        { id = "su_default", text = "A soldier who died at the Thandol Span when the Dark Irons struck it, an' his widow wrote tae the King. I didnae know him, but I'll know his name very well by the time I've carved it." },
      },
      choices = {
        { text = "Every soldier deserves a stone like this.", next = "BACK", reply = "Aye, they do, an' I'd carve one for every soldier if the King would pay for the stone, but he cannae, an' neither can I.", fx = { align = { honor = 1 }, affinity = 1, learn = { "thandol_span" } } },
        { text = "Better to spend the King's coin on the living.", next = "BACK", reply = "Maybe. But the living remember the dead better when there's somethin' tae look at.", fx = { align = { honor = -1 }, learn = { "thandol_span" } } },
        { text = "You must have met his widow.", next = "sully_sara" },
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
        { id = "me_default", text = "More than I'd like. Bah, does the fightin' never stop? I'd give my best chisel tae spend a year carvin' fountains an' doorways an' nothin' wi' a name on it." },
      },
      choices = {
        { text = "Peace has to be fought for.", next = "BACK", reply = "Aye, it does. I'd still like tae spend a year carvin' somethin' that's no' a grave.", fx = { align = { honor = 1 } } },
        { text = "Peace comes when people stop fighting.", next = "BACK", reply = "Then I'll be waitin' a long while, by the look o' things, but I'll keep a fountain sketch in my pocket for the day it comes.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    miner = {
      lines = {
        { id = "mi_default", text = "Then ye know the mountain's moods! Bring me anythin' white an' fine-grained an' I'll owe ye a story, an' my stories are very long." },
      },
      choices = { { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_shaman = {
      lines = {
        { id = "xsh_default", text = "Ha! I've said that for forty years an' got laughed out o' every tavern in the Commons. Go on, then, put yer hand on that granite an' tell me if it's happy where I set it." },
        { id = "xsh_listener", when = { origin = "dwarf_stone_listener" },
          text = "Ye're the one who used tae press yer ear tae the walls o' the deep halls, aren't ye? I've a block o' Alterac granite in the yard that's been sulkin' since it came, an' I'd value an opinion." },
      },
      choices = {
        { text = "It's content. You set it well.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "It misses the mountain it came from.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Stonecutters hear everythin', for folk forget we're there behind the dust. Here's what I've heard." } },
    background = { { id = "tp_bg", text = "Grand Mason o' Ironforge. I carve what the King wants, an' what the King wants these days is mostly memorials." } },
    advice = { { id = "tp_ad", text = "Tap it before ye trust it. Stone tells ye when it's cracked, if ye listen." } },
    thandol_span = { { id = "tp_span", text = "A fine bridge, built by fine masons, an' the Dark Irons hit it. I take that personally.", next = "sully" } },
    second_war = { { id = "tp_second_war", text = "I've carved more names from the Second War than I can count, an' each one I knew or knew someone who did. Good granite holds a name a long while, longer than grief does, I hope." } },
    scourge = { { id = "tp_scourge", text = "They're askin' for memorials for the dead o' Lordaeron now, an' I've no' got enough stone in all Dun Morogh. I carve what I can, an' I try no' tae think how many names are still comin'." } },
    grim_batol = { { id = "tp_grim_batol", text = "The finest masonry the Wildhammer ever did is in Grim Batol, an' it's all cursed, an' that's a stonemason's grief if ever there was one. I'd love tae see the old gate once, from far off." } },
    wildhammer = { { id = "tp_wildhammer", text = "They build in the cliffs like gryphons do, all perches an' open sky, an' I cannae say I'd sleep a wink in it. Still, Aerie Peak's a handsome piece o' work, for all it lets the weather in." } },
    _none = { { id = "tp_none", text = "If it isnae stone, I wouldnae know. Ask somebody wi' softer hands." } },
  },
}

-- Gryth Thurden: Ironforge's gryphon master at the Great Forge.
P:NPC {
  key = "gryth", id = TODO_NPC("Gryth Thurden"), name = "Gryth Thurden", title = "Gryphon Master",
  bible = "bibles/commons.md", role = "flightmaster", tier = "service",
  communities = { "ironforge" }, temper = { "proud" }, values = { "proud", "loyal" },
  notices = { "mount", "lock_steed" },

  impression = {
    first = "He swears his gryphons are tougher than the Wildhammers' birds.",
    third = "{name} met Gryth Thurden, Ironforge's gryphon master at the Great Forge.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. It's good to see a friendly face." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep my distance." },
    { id = "g_ride", text = "Ye look like ye've somewhere tae be. Need one o' my gryphons?" },
    { id = "g_heat", text = "Feel that heat? My gryphons sleep through it like it's a summer's day, an' that's the Great Forge for ye." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Ye'll want tae get down off that before ye go near my birds. They think everythin' on four legs is lunch." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Every gryphon on this ledge has its hackles up, an' it's that burnin' horse o' yers they smell, for they can scent fire on hooves a mile off. Leave it below the stair an' come up on foot, an' we'll get ye flown." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every time, an' it drives me daft. They go quiet an' tuck their heads, an' I'm left lookin' at a clear sky like a fool till the storm comes. The Wildhammers say that's the spirits o' the air talkin' tae them, an' I say it's a gryphon's good sense, but I'll admit I've never proved which." } },
      choices = {
        { text = "A good handler's instinct matters more than any spirit, Gryth.", next = "BACK", reply = "Maybe it does, an' I'll take that as a compliment, but I'll still keep one eye on the gryphons, for they've never once been wrong.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It's the air spirits. The Wildhammers have that much right.", next = "BACK", reply = "Hmph, dinnae let the Wildhammers hear ye say it, or they'll never let me forget it, but I'll no' say ye're wrong either.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Tae the Wetlands an' Loch Modan, aye, an' they'll set ye down at Menethil or Thelsamar as gentle as a cradle. A Wildhammer bird might get ye there quicker, but ye'd arrive wi' yer stomach still in the clouds." } },
      choices = {
        { text = "Any bird that carries a soldier deserves respect.", next = "BACK", reply = "They do. My birds have carried more soldiers than any Wildhammer would care tae admit.", fx = { align = { honor = 1 } } },
        { text = "I'd ride whichever's faster and keep my stomach to myself.", next = "BACK", reply = "Ha, that's the spirit, an' ye'll find my birds are gentler on the stomach anyway, whatever the Wildhammers tell ye.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They're raised beside it from the egg, an' they grow up thinkin' fire's just weather. A Wildhammer bird would moult in a week down here, but mine preen in the sparks like it's a warm spring day." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They're raised beside it from the egg, an' they grow up thinkin' fire's just weather. That {pet} would never stand the heat so well, I'd wager, but it's a fine beast all the same." },
      },
      choices = {
        { text = "A beast is made by how it's raised. You've done well.", next = "BACK", reply = "Thank ye kindly. I'll tell the birds ye said so, though they'll pretend no' tae care, bein' gryphons.", fx = { align = { honor = 1 } } },
        { text = "Fireproof birds? You'd say anything to beat the Wildhammers.", next = "BACK", reply = "I'd say it, aye, an' it'd be true, so go an' see for yerself, for the young ones preen in the sparks every mornin'.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They mind anyone they cannae see, for a gryphon trusts its eyes an' nothin' else. Walk up tae them in the open, an' they'll carry ye anywhere in Khaz Modan wi'out a peck." } },
      choices = {
        { text = "In the open, then. I'd like to keep my eyes, Gryth.", next = "BACK", reply = "They'll carry ye kindly for it. A gryphon that trusts ye is the gentlest ride in Khaz Modan.", fx = { align = { honor = 1 } } },
        { text = "A beast that can't see me can't stop me either.", next = "BACK", reply = "It'll no' stop ye, aye, but it'll no' carry ye either, an' that's a long walk tae Menethil on foot.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I fly anyone the King lets through the gates, an' that includes you, so long as yer creature stays on the ground. The gryphon doesnae care what ye are, only what it can smell." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I fly anyone the King lets through the gates, an' that includes you, but yer creature stays on the ground, an' ye can see why from how my birds are shiftin' on the perch. A gryphon doesnae care what ye are, only what it can smell, an' every one o' them can smell that." },
      },
      choices = {
        { text = "It stays behind, Gryth. I won't frighten your birds.", next = "BACK", reply = "Thank ye. The birds have no love for anythin' that smells o' brimstone, an' neither have I.", fx = { align = { light = 1 } } },
        { text = "What follows me goes where I go. The birds will learn.", next = "BACK", reply = "Then ye'll be walkin', for my birds will no' learn that lesson while I'm their master, an' I'll no' make them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Mind it? They'd fly whether we rode 'em or no, but they come back tae the roost because they're fed an' cared for. A gryphon that's mistreated won't fly for anyone." } },
      choices = {
        { text = "A bond of trust is honest work.", next = "BACK", reply = "It is. I love these birds more than I love most dwarves, an' I'll no' apologise for it.", fx = { align = { honor = 1 } } },
        { text = "Wild things should stay wild, not saddled.", next = "BACK", reply = "Maybe. But mine come back every time I open the roost, so I think they like it here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Often enough that I keep linen by the roost, for the Wetlands route passes too near Grim Batol an' the Dragonmaw have good eyes an' better bows. The gryphons come back fine, mind, for nobody's fool enough tae shoot a gryphon twice." } },
      choices = {
        { text = "Then I'll stop by when I can and see to your riders.", next = "BACK", reply = "Bless ye. I'll keep the kettle on, for the riders who come back from Grim Batol are glad o' any kindness.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Riders who fly near Grim Batol choose their risk. That's on them.", next = "BACK", reply = "Maybe it is, but they fly it because the King asks them tae, so I'd say a word for them anyway, if I were you.", fx = { align = { light = -1 } } },
        { text = "What else, Gryth?", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "In the Second War, aye, though I was only a lad holdin' the reins. The Wildhammers'll tell ye it was their birds did the flyin', but there were Ironforge gryphons over Grim Batol too, wi' Silver Hand dwarves on their backs, an' I'll argue it wi' any Aerie Peak lout who says otherwise." } },
      choices = {
        { text = "Then they flew with honour, whoever's birds they were.", next = "BACK", reply = "They did. Every bird over Grim Batol that day earned its place in the songs.", fx = { align = { honor = 1 } } },
        { text = "The Wildhammers earned that one. Give them their due.", next = "BACK", reply = "Hmph, they earned a share, I'll grant ye, but no' all o' it, an' I'll no' hear the Ironforge birds forgotten.", fx = { align = { honor = -1 } } },
        { text = "Back to business, Gryth.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because a portal takes ye tae three cities an' no further, an' my birds will take ye anywhere there's a roost. Ye'll no' see Dun Morogh's peaks from a portal either, an' I'd say that's half the reason tae travel at all." },
      },
      choices = {
        { text = "The view's worth the ride, Gryth.", next = "BACK", reply = "It is, an' ye'll never forget it, for there's nothin' like Dun Morogh's peaks at dawn from the back o' a gryphon.", fx = { align = { order = 1 } } },
        { text = "Speed matters more than views.", next = "BACK", reply = "Fair enough, but a portal never took anybody tae Thelsamar, so ye'll be back on my birds sooner or later.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Good, for the last time a rider came in off the Thandol route he'd a Dragonmaw arrow in him, an' I'm no' handy wi' anythin' but feathers." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Aye, my birds like yer sort, for ye sit square in the saddle an' ye don't scream on the dive like the mages do." },
        { id = "h_default", text = "Gryth Thurden, gryphon master. The Wildhammers might have fast steeds, but can those Aerie Peak gryphons stand the heat o' the Great Forge? I think not!" },
        { id = "h_picks", tags = { "news" }, when = { questActive = TODO_QUEST("Gryth Thurden") },
          text = "Honorary picks for Brock Stoneseeker's students in Thelsamar, is it? No trouble at all, as long as ye've been there before an' spoken tae the flight master; my birds won't fly tae a place ye've never seen." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! I've seen yer kind take wing on yer own, an' I'll confess my gryphons get a wee bit jealous when ye do." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "The gryphons have smelled ye comin', so ye might as well step up properly an' stop lurkin' by the pillar." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Keep whatever's at yer heel well back from the roost, if ye please. The gryphons went daft the last time somethin' like it came near, an' I spent an hour gettin' them down off the ceilin'." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ironforge gryphons have carried dwarven warriors since the Second War, an' they've never dropped one, whatever the Wildhammers say." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Then ye'll appreciate a beast that can stand the heat o' the Great Forge, for there's none hardier than mine." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Ye'll be wantin' tae teleport, I suppose, an' leave my gryphons standin' idle, but a portal never once showed anyone the view over Loch Modan." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, eh? Ye've a Wildhammer look about ye, even if yer beard's Bronzebeard. Don't go whisperin' tae my gryphons, for they're confused enough." },
      },
      again = {
        { id = "h_again", text = "Anythin' else, or are ye flyin'?" },
        { id = "h_again2", text = "Go on, ask; the birds are restin'." },
      },
      choices = {
        { text = "Do your gryphons mind being ridden?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I need a ride.", next = "BUSINESS" },
        { text = "What's wrong with Aerie Peak's gryphons?", next = "aerie" },
        { text = "Keeping gryphons under a mountain can't be easy.", next = "keep" },
        { text = "My people rode gryphons at Aerie Peak.", next = "k_wild", when = { origin = "dwarf_wildhammer_kin" } },
        { text = "Do the gryphons really mind someone quiet?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would your gryphons fly me, whatever they smell on me?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do Ironforge gryphons carry warriors to the front?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How do your gryphons stand the heat of the Forge?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your riders must come back wounded often, Gryth.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Have your gryphons ever flown paladins into battle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why fly a gryphon when I can teleport, Gryth?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do your gryphons ever sense a storm before you do, Gryth?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Gryth.", next = "END" },
      },
    },
    aerie = {
      lines = {
        { id = "ae_default", text = "Nothin', if ye like birds that sulk when it's warm. The Wildhammers raise theirs on the cliffs an' fly them half-wild, an' ours are bred by the forge an' fly where they're told." },
      },
      choices = {
        { text = "A gryphon should fly where it's told.", next = "BACK", reply = "Aye, it should, an' mine do, which is why the King rides them an' no' a Wildhammer bird that might take him tae the Hinterlands.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A half-wild gryphon sounds like a better friend.", next = "BACK", reply = "Better friend, maybe, but a worse ride, an' ye'll spend half the flight arguin' wi' it about where ye're goin'.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = {
        { id = "ke_default", text = "Warm roosts, fresh meat, an' a long run out the gates every mornin'. They hate the dark at first, but they love the heat, an' the Great Forge has more heat than anywhere in Khaz Modan." },
      },
      choices = {
        { text = "They must miss the open sky.", next = "keep_sky" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_sky = {
      lines = {
        { id = "ks_default", text = "Every one o' them, every day, an' that's why they fly so well when ye let them out. Ye've never seen a bird so glad tae see the clouds." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_wild = {
      lines = {
        { id = "xwh_default", text = "Did they, now? Then ye'll tell them, next time ye're up in the Hinterlands, that a Great Forge gryphon can take the heat an' still find its way home. Wildhammer birds are fast, I'll grant, but they've never flown through a forge's smoke." },
      },
      choices = {
        { text = "Aerie Peak's birds would leave yours behind.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
        { text = "Yours are tougher. I'll tell them.", next = "BACK", fx = { affinity = 2 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Riders talk while they wait for a bird, an' I listen while I feed them. Here's what I've heard." } },
    background = { { id = "tp_bg", text = "I keep the King's gryphons by the Great Forge, an' I've kept them longer than I'll admit tae." } },
    advice = { { id = "tp_ad", text = "Hold on wi' yer knees, no' yer hands. Yer hands'll want tae wave." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer'll tell ye their gryphons are fiercer, an' maybe they are, but mine come home every time. I'll take a bird that comes home over a bird that bites." } },
    booty_bay = { { id = "tp_booty_bay", text = "Ye can fly from here tae the edge o' the Stranglethorn an' then ye're on yer own, for no gryphon o' mine roosts wi' pirates. Take a boat from there, an' check yer purse when ye land." } },
    theramore = { { id = "tp_theramore", text = "Theramore's across the sea, an' my birds dinnae cross water that wide. Take the ship from Menethil an' send me a postcard." } },
    thandol_span = { { id = "tp_thandol_span", text = "The Span's down, but my gryphons dinnae care, so they're the best way intae Arathi just now. Ye'll pay a bit more, but ye'll no' fall in the gorge." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask a gryphon, they've seen more o' the world than I have." } },
  },
}

-- Hulfdan Blackbeard: rogue trainer in the Forlorn Cavern; the Hidden Circle; the guards have trouble with him.
P:NPC {
  key = "hulfdan", id = TODO_NPC("Hulfdan Blackbeard"), name = "Hulfdan Blackbeard", title = "Rogue Trainer",
  bible = "bibles/commons.md", role = "trainer", tier = "quest",
  communities = { "ironforge" }, temper = { "jovial", "sharp" }, values = { "cunning", "loyal" },
  notices = { "stealth", "lock_shards" },

  impression = {
    first = "He talks like a pirate who has never seen the sea.",
    third = "{name} met Hulfdan Blackbeard, rogue trainer in the Forlorn Cavern and head of Ironforge's Hidden Circle.",
  },

  greetings = {
    { id = "g_voice", text = "Quietly, now, for the guards have big ears. Wut is it?" },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one o' Blackbeard's chosen few! Come in, an' shut the door, an' check it's shut." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Ha! Ye think I cannae see ye? I trained half the shadows in this cavern, scallywag, an' I know every one o' them by name." },
    { id = "n_priest", cat = "stealth", when = { class = "PRIEST" },
      text = "A priest in the Forlorn Cavern? Either ye're lost, or ye've come tae save us, an' I'm no' sure which frightens me more." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "I heard ye comin' before I saw ye, for there's somethin' in yer bag that clinks like coin an' hums like a hive. A rogue's taught tae listen, an' I'll tell ye for free that a pack full o' souls is no' a quiet thing tae carry." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If it did, the Circle's lookouts would be out o' work, so I'll hope it keeps quiet. I've had a lad swear the walls hummed whenever someone was comin' down the stair, an' I wrote it off as ale. Ye'd no' be wantin' tae sell that sort o' warnin', would ye?" } },
      choices = {
        { text = "The earth is no tool for sneaks, Hulfdan.", next = "BACK", reply = "No, it isnae. But my lad still swears the walls hum, so I'll keep my ears open all the same, matey.", fx = { align = { honor = 1 } } },
        { text = "For the right price, I might tell you who's coming.", next = "BACK", reply = "Ha, now there's a shaman after my own heart, an' I'll keep a seat at the table for ye, matey, an' a share o' the purse.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because a cat that can walk past a guard beats any lockpick I own, matey. I'll no' pretend the Circle's honest, but we keep our word an' our mouths shut, which is more than the Senate does." } },
      choices = {
        { text = "A quiet job is still honest work if nobody's hurt.", next = "BACK", reply = "That's the Circle's creed, near enough. Welcome aboard, if ye ever fancy the work.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "My shape is Cenarius's gift, not a burglar's tool.", next = "BACK", reply = "Fair enough, matey, an' I'll respect it, though Cenarius never had tae pay rent in the Forlorn Cavern.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Now an' then, when a job needs a door broken rather than opened, an' my lads would sooner no' be seen doin' it. Mostly, though, a warrior in the Forlorn Cavern brings the guards down on us, an' I've trouble enough wi' them already." } },
      choices = {
        { text = "I break doors openly, or not at all.", next = "BACK", reply = "Then ye'll no' be much use tae me, matey, but I'll respect yer honesty, which is more than most o' my lads can manage.", fx = { align = { honor = 1 } } },
        { text = "A broken door in the dark is still a broken door.", next = "BACK", reply = "Ha, now ye're talkin', matey, an' I'll keep a door or two in mind for ye, if the price is right an' the guards are elsewhere.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Better than ye'd think, for we both know how tae wait an' how tae watch, an' neither of us likes a fair fight. The only trouble is the beasts, for a pet that growls at the wrong moment has sunk more than one o' my jobs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Better than ye'd think, for we both know how tae wait an' how tae watch, but a pet that growls at the wrong moment has sunk more than one o' my jobs. So that {pet} o' yours had better no' growl down here, friend." },
      },
      choices = {
        { text = "My beast and I fight in the open, thank you.", next = "BACK", reply = "Fair enough, matey. The beast's growlin' would give us all away anyway, so it's just as well.", fx = { align = { honor = 1 } } },
        { text = "A fair fight is a foolish fight. We agree there.", next = "BACK", reply = "Ha, a hunter after my own heart, matey, so if ye ever fancy a job, ye know where the Forlorn Cavern is.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Always, but nothin' ye'd need a fireball tae settle. A mage who can keep a secret is worth his weight in thorium tae the Circle, so if ye ever fancy a quieter sort o' work, ye know where tae find me." } },
      choices = {
        { text = "I serve Ironforge, Blackbeard, not the Hidden Circle.", next = "BACK", reply = "Fair enough, matey, an' I'll no' hold it against ye, but if Ironforge ever stops payin', the Circle's door is open.", fx = { align = { order = 1 } } },
        { text = "A quieter sort of work sounds well paid. I'm listening.", next = "BACK", reply = "I thought ye might be, matey, so come down the stair one evenin' an' we'll talk somewhere the walls cannae hear us.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "We share a dark corner an' a bad reputation, an' that's about all. Yer creatures make my lads jumpy, but I'll grant ye a felhunter's nose would be handy on a job." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "We share a dark corner an' a bad reputation, an' yer demons make my lads jumpy, an' that one's makin' them jumpier, standin' there in the dark like it belongs. I'll grant ye a felhunter's nose would be handy on a job, though, whatever ye've brought down here tonight." },
      },
      choices = {
        { text = "What I keep stays leashed. I'll not lend it out for thieving.", next = "BACK", reply = "Fair enough, matey, an' my lads will sleep easier for it, though I'll admit I'm a wee bit disappointed.", fx = { align = { honor = 1 } } },
        { text = "For the right share, my felhunter could sniff out anything you like.", next = "BACK", reply = "Ha, a warlock who knows the value o' a share, an' I'll keep it in mind, matey, though my lads will want it muzzled.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Only when they've been daft enough tae get caught, an' then they need a priest an' a fast gryphon both. I'll no' say the Circle's on the Light's good side, but we've kept a few Dark Iron daggers out o' Magni's back, an' I'd like tae think that counts for summat." } },
      choices = {
        { text = "Then I'll patch your rogues and pray they keep doing that.", next = "BACK", reply = "Bless ye, matey. My lads will be grateful, though they'll never say it, bein' rogues an' proud o' their bruises.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your Circle serves itself. I'll keep my prayers for honest folk.", next = "BACK", reply = "Fair enough, matey. Honest folk need prayers less than my lads do, if ye ask me.", fx = { align = { light = -1 } } },
        { text = "Enough of the Circle's soul.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the guards already know about us an' pretend they don't, an' because we hear things in the Dark Iron camps that no knight in shinin' plate would ever get near. Ye can have yer justice in the open, an' I'll have mine in the dark, an' the Dark Irons can choke on both." } },
      choices = {
        { text = "Thieves are thieves. The law will catch up with you, Blackbeard.", next = "BACK", reply = "Maybe it will, matey, but it's been tryin' for years, an' it keeps findin' that it rather likes what we bring it.", fx = { align = { order = 1 } } },
        { text = "Justice in the dark is still justice. I'll leave you be.", next = "BACK", reply = "That's wise, paladin, an' I'll keep my lads well out o' yer way, which is a kindness tae both o' us.", fx = { align = { order = -1 } } },
        { text = "Let's leave it there, Blackbeard.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, in the Hidden Circle! Arr, have ye come tae save our souls, or have ye lost yer way tae the Mystic Ward, matey?" },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, here? Keep yer voice down, matey, an' keep yer hammer on yer belt; we're all friends in the Forlorn Cavern, more or less." },
        { id = "h_default", text = "Hulfdan Blackbeard, an' this is the Hidden Circle, though if ye tell anyone it's here, it'll no' be hidden, will it? Speak up, but no' too loud." },
        { id = "h_salvation", tags = { "news" }, when = { questActive = TODO_QUEST("Road to Salvation") },
          text = "Hogral sent ye, an' ye fancy yerself a proper rogue, one o' Blackbeard's own? Only a worthless scallywag would think so much o' himself, an' worthless scallywags are just wut the Circle needs." },
        { id = "h_shakedown", tags = { "news" }, when = { questActive = TODO_QUEST("Kingly Shakedown") },
          text = "Magni's blockheads came bargin' in here talkin' about a heist, an' somehow yer name got blurted out. Take the first gryphon tae Stormwind an' find Renzik 'The Shiv' in Old Town, an' don't dawdle." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "Back from the shadows, are ye? Good, good; there's always work for the Circle, an' always somethin' tae teach ye." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in the Forlorn Cavern, an' no' even lost! Keep yer voice down an' yer fire smaller; the guards already think this place is up tae somethin'." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ah, one o' the cavern's other residents. Yer lot an' mine get the same looks from the guards, so we might as well nod tae each other." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, down in the Hidden Circle? Ye're louder than my whole crew put together, so keep yer voice down, if ye can." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, is it? Ye've a quiet step for someone who carries a gun, I'll give ye that." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "Well now, a night elf druid in the Forlorn Cavern, an' no' even lost! Yer kind can slip about as a cat, I hear, which would make ye a fine catch for the Circle." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, down here? The earth's got ears, they say, so I'll thank ye no' tae let it listen in on my business." },
      },
      again = {
        { id = "h_again", text = "Wut else? Quietly, now." },
        { id = "h_again2", text = "Go on, whisper it." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "What is the Hidden Circle?", next = "circle" },
        { text = "Why do the guards have trouble with you?", next = "guards" },
        { text = "The King's guards were muttering about some heist.", next = "heist", when = { any = { { questActive = TODO_QUEST("Kingly Shakedown") }, { questDone = TODO_QUEST("Kingly Shakedown") } } } },
        { text = "What does the Circle want from me now?", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "The Forlorn Cavern seems to be up to something, Blackbeard.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the cavern's other residents get along with your lads?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Have you any use for a warrior down here, Blackbeard?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters and rogues ever work together, Blackbeard?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your rogues ever need a priest, Blackbeard?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why shouldn't a paladin turn your Circle over to the guards?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why would the Hidden Circle want anything from a druid?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does the stone down here tell secrets, Hulfdan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll keep your secret.", next = "END" },
      },
    },

    circle = {
      lines = {
        { id = "ci_default", text = "Ironforge's rogues, trained right here under the King's nose. We keep an ear on things the guards cannae hear, an' a hand on things the guards cannae reach, an' we're very useful tae the right people." },
      },
      choices = {
        { text = "Which people?", next = "circle_who" },
        { text = "Every city needs a few shadows.", next = "BACK", reply = "Aye, matey, an' Ironforge is lucky tae have us, though the guards would never say so tae our faces.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A thieves' guild under the King's nose is a disgrace.", next = "BACK", reply = "Maybe it is, matey, but the King's no' complained yet, an' I'd wager he sleeps better knowin' we're watchin' the Dark Irons.", fx = { align = { order = 1 }, affinity = -2 } },
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
        { text = "The guards are only doing their jobs.", next = "BACK", reply = "Aye, an' I dinnae fault them. I'll keep answerin' their questions wi' questions all the same, matey.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Someone has to keep the guards on their toes.", next = "BACK", reply = "That's the spirit, matey, an' I'll take that job gladly, for nobody else in Ironforge wants it.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    guards_goat = {
      lines = {
        { id = "gg_default", text = "A very fine goat, an' it's back wi' its owner now, an' a wee bit fatter. I'll say no more, for a rogue never tells the whole story, only the funny part." },
      },
      choices = { { text = "Keep the rest, then. The goat knows.", next = "BACK", fx = { affinity = 1 } } },
    },

    heist = {
      lines = {
        { id = "he_default", text = "Wut heist? There was never any heist, friend, for we were plottin' out phase three o' somethin' entirely legal when a couple o' the King's guards came in an' started arrestin' folk, an' nobody claps irons on Hulfdan Blackbeard." },
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
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Nothin' ye can't give, an' that's the trick o' it. Keep yer ears open in the Commons, keep yer hands out o' the King's purse, an' keep yer name off the guards' lips, because a rogue they know is a rogue they hang." },
        { id = "xro_loch", when = { origin = "dwarf_loch_smuggler" },
          text = "Ye ran casks across the loch, I hear, under the noses o' the Mountaineers. That's honest work for a dishonest dwarf, an' the Circle could use a boat or two, if ye've kept the contacts." },
        { id = "xro_scav", when = { origin = "gnome_scavenger" },
          text = "Ye're the gnome who sneaks back intae Gnomeregan for parts, aren't ye? Brave or daft, an' both are useful, so keep doin' it, an' tell me what the troggs are up tae while ye're at it." },
        { id = "xro_canal", when = { origin = "human_canal_pickpocket" },
          text = "Stormwind canals, by the way ye watch my hands. Renzik down in Old Town took a few o' yer sort in, an' ye'll find the Circle's no' so different, only colder an' wi' better beer." },
      },
      choices = {
        { text = "The King's purse is the only one worth taking.", next = "BACK", reply = "Then ye'll be hangin' from the High Seat by sundown, matey, an' I'll be pretendin' I never met ye.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "I'll keep clean in the city. I'm no fool.", next = "BACK", reply = "Good. A clean name in the city is the best tool a rogue has, an' I'll teach ye how tae keep it shiny.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "The Circle must be after something more.", next = "k_rogue_after" },
      },
    },
    k_rogue_after = {
      lines = {
        { id = "xra_default", text = "Information, mostly, an' a wee bit o' coin tae keep the lamps lit. Magni's guards think we're a gang o' thieves, an' the truth is we hear about the Dark Iron's spies a week before they do." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Hidden Circle hears everythin', an' I hear wut the Circle hears. Here's the part I'll sell ye for free." } },
    background = { { id = "tp_bg", text = "Background? Ha, that's a nice try, scallywag! A rogue's past is his own business, an' mine's very well hidden." } },
    advice = { { id = "tp_ad", text = "Never tell the whole story. Tell the funny part, an' keep the rest." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "There's a manor in the Alterac hills that doesnae exist, an' if ye ever find it, ye've been invited. That's all ye'll get from me, matey, an' most get less." } },
    booty_bay = { { id = "tp_booty_bay", text = "Now that's a port worth the name, full o' pirates an' goblins an' honest thieves. I've never been, as such, but I've heard it described by people I trust very little." } },
    syndicate = { { id = "tp_syndicate", text = "Alterac's nobles turned cutpurse, an' they're bad at it, all noise an' no taste. The Hidden Circle has standards, matey, an' the Syndicate doesnae meet them." } },
    _none = { { id = "tp_none", text = "Never heard of it, an' if I had, I'd say I hadnae." } },
  },
}
