-- Aerie Peak: the Wildhammer stronghold in the Hinterlands. Voice: bibles/hinterlands.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "falstad", id = TODO_NPC("Falstad Wildhammer"), name = "Falstad Wildhammer",
  bible = "bibles/hinterlands.md", role = "noble", tier = "major",
  communities = { "aerie_peak" }, temper = { "boisterous" }, values = { "proud", "brave", "loyal" },
  likesTone = "blunt", race = "Dwarf",
  prejudice = { race = "Dwarf", faction = "Alliance", exceptOrigin = { "dwarf_wildhammer_kin", "dwarf_wildhammer_shaman" }, amount = 6, why = "Old Wildhammer grudge against Ironforge since the War of the Three Hammers." },
  notices = { "race", "class" },

  impression = {
    first = "Falstad Wildhammer greets visitors like long-lost kin and talks of trolls the way other people talk of weather to be got through. A Wildhammer and his gryphon, he says, are one creature.",
    third = "{name} met Falstad Wildhammer, High Thane of the Wildhammer clan, at Aerie Peak.",
  },

  greetings = {
    { id = "g_prej1", when = { prejudiced = true, ["not"] = { origin = { "dwarf_wildhammer_kin", "dwarf_wildhammer_shaman" } } }, text = "Ironforge! I can smell the forge-smoke an' the paperwork on ye from here. Come in anyway, for Aerie Peak's never shut its gate on a cousin, even one who lives in a hole." },
    { id = "g_prej2", when = { prejudiced = true, ["not"] = { origin = { "dwarf_wildhammer_kin", "dwarf_wildhammer_shaman" } } }, text = "Another Bronzebeard come tae see how the wild folk live! Mind the gryphon dung, for we've no royal servants here tae sweep it." },
    { id = "g_prej_over", when = { prejudiced = "overcome", ["not"] = { origin = { "dwarf_wildhammer_kin", "dwarf_wildhammer_shaman" } } }, text = "Ye're a Bronzebeard, an' ye've fought trolls in my hills like a Wildhammer born, so I'll stop teasin' ye. Mostly." },
    { id = "g_keep", text = "Ha! A visitor tae Wildhammer Keep! Come in, come in, an' tell me ye're here tae fight trolls!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, good! I like a face that keeps comin' back, for it means the trolls didnae get it." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "Ha, there ye are, after {away} away! I'd started tae think the trolls had finally got ye, an' I'm glad tae be wrong." },
    { id = "g_away_long", when = { away = 60 }, text = "Well, look what the wind blew back tae the Keep after {away} away! Sit doon an' tell me every fight ye've had, for I'll wager there were plenty." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've come on a fair bit since we last spoke, I can see it in yer shoulders. The Witherbark'll see it too, an' I'd like tae be there watchin'." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I hear ye put a proper fright intae someone at the Peak. That's grand for trolls, but go easy on my own lads." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The riders have been sayin' good things about ye in the hall, an' a Wildhammer doesnae praise lightly. Come in, then, for ye've earned yer welcome." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf o' Ironforge, here among the Wildhammer! The mountain's fine, {g:lad|lass}, but ye've no seen anythin' till ye've seen it from a gryphon's back." },
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "SHAMAN" } },
      text = "Ye've the look o' someone who knows beasts, so the gryphons'll like ye, probably." },
  },

  start = "hello",
  nodes = {
    dd_trolls = {
      lines = { { id = "dd_trolls_default", text = "Leave? They were here long before Aerie Peak, an' they'll be here when my grandsons are grey, for this was their empire once. The best we can hope is tae keep them in their ruins, an' ye've been doin' a fine job of it." } },
      choices = {
        { text = "Then I'll keep them in their ruins as long as I'm here.", next = "BACK", reply = "That's the spirit o' the Wildhammer. My gryphons will spot for ye whenever ye ride out.", fx = { align = { order = 1 } } },
        { text = "It was their land first. Maybe that should count for something.", next = "BACK", reply = "Maybe it should, an' I've thought it myself on a long patrol. Then they come for my riders with spears, an' I stop thinkin' it.", fx = { align = { order = -1 } } },
        { text = "Something else, Falstad.", next = "BACK" },
      },
    },

    prej = {
      lines = { { id = "prej_default", text = "Aye, an' my grandfather had a worse one! Ye know the War o' the Three Hammers as well as I do, how the Bronzebeards took Ironforge an' showed us the door, an' a clan doesnae forget that because a king sends a letter." } },
      choices = {
        { text = "That's an old grudge, Thane. We bled side by side in the Second War.", next = "BACK", reply = "Side by side, aye, an' I'll drink tae that any night ye like. But my grandfather would turn in his cairn if I forgot Grim Batol entirely.", fx = { align = { order = 1 } } },
        { text = "Grudges keep a clan proud. I'd not drop it either.", next = "BACK", reply = "Ha! A Bronzebeard wi' sense! Keep yer grudge an' I'll keep mine, an' we'll fight the trolls together in between.", fx = { align = { order = -1 } } },
        { text = "Tease away. I'll still out-drink you.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "What do your folk really think of Ironforge?", next = "prej_why" },
        { text = "Something else, Falstad.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "That ye live under a mountain an' call it a kingdom, an' ye've forgotten the sky. My riders say Magni's a fair king, an' I'll grant it, but a fair king in a cave is still a king in a cave." } },
      choices = {
        { text = "The mountain kept us alive when Lordaeron fell.", next = "BACK", reply = "It did, an' I'll no' mock that, for there's many a Wildhammer alive because Ironforge kept its gates. Still, ye miss a grand view.", fx = { align = { order = 1 } } },
        { text = "Aye, I miss the sky too, some days.", next = "BACK", reply = "Then come up an' have a look, {g:lad|lass}! There's a gryphon here wi' yer name on her saddle, if ye've the stomach.", fx = { align = { order = -1 } } },
        { text = "Something else, Falstad.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "Ha! A Bronzebeard who drinks! Ye'll have tae prove it in my keep, an' I'll be keepin' count." } },
      choices = {
        { text = "Something else, Falstad.", next = "BACK" },
      },
    },
    opn_magni = {
      lines = {
        { id = "opn_magni_q", text = "Magni? He's a fine dwarf for one who lives in a hole, an' he's never once flown, which tells ye most o' what ye need tae know. Our grandfathers fell out over Grim Batol an' we've been politely annoyed ever since. But ye've stood in his hall, so tell me what ye think o' him." },
      },
      choices = {
        { text = "Magni's a good king. Your clans should stand closer together.", next = "opn_magni_r_respect", fx = { affinity = -1, align = { order = 1 }, opinion = { magni = "respect", wildhammer = "kin" } } },
        { text = "Stuffy, and far too fond of his council. Your sky suits me better.", next = "opn_magni_r_stuffy", fx = { affinity = 2, align = { order = -1 }, opinion = { magni = "stuffy", wildhammer = "admire" } } },
        { text = "He keeps his word to the Alliance. Can you say the same?", next = "opn_magni_r_loyal", fx = { affinity = -1, trait = { stern = 1 }, opinion = { magni = "loyal" } } },
        { text = "He's grieving, Thane. Muradin's loss sits heavy on him.", next = "opn_magni_r_respect", when = { heardLine = "magni.bl_default" }, fx = { affinity = 1, trait = { kind = 1 }, opinion = { magni = "respect" } } },
        { text = "I'll keep out of dwarf feuds, Thane.", next = "BACK" },
      },
    },
    opn_magni_r = {
      lines = {
        { id = "opn_magni_r_default", text = "Wise. Dwarf feuds outlast everyone who starts 'em, an' most who finish 'em too." },
      },
      choices = {
        { text = "Something else, Thane.", next = "BACK" },
      },
    },
    opn_magni_r_respect = {
      lines = {
        { id = "opn_magni_r_respect", text = "Closer! Ha, ye sound like a Bronzebeard envoy. I'll stand beside 'em in a war, an' I have, but I'll no' stand under their mountain." },
      },
      choices = {
        { text = "Something else, Thane.", next = "BACK" },
      },
    },
    opn_magni_r_stuffy = {
      lines = {
        { id = "opn_magni_r_stuffy", text = "Ha! That's the truest thing a flatlander's said in my hall this season. Thulfram, a mug for this one, an' put it on the Bronzebeards' tab!" },
      },
      choices = {
        { text = "Something else, Thane.", next = "BACK" },
      },
    },
    opn_magni_r_loyal = {
      lines = {
        { id = "opn_magni_r_loyal", text = "Careful. The Wildhammer bled for the Alliance in the Second War an' sent Kurdran Wildhammer through the Dark Portal wi' it, so dinnae lecture me on keepin' faith." },
      },
      choices = {
        { text = "Something else, Thane.", next = "BACK" },
      },
    },
    xpt_dwarf = {
      big = true,
      lines = { { id = "xpt_dwarf_default", text = "Odds is a strong word for brothers who argue at the same table, though we've been arguing since the War of the Three Hammers and we'll argue long after this one. Ironforge digs and counts and we ride and drink, and each of us thinks the other forgot what it means to be a dwarf." } },
      choices = {
        { text = "The Wildhammer are right to keep their own skies.", next = "BACK", reply = "They are, aye, an' it's good tae hear it from kin. We'll keep our sky an' share our hammers when they're needed.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The clans should stand as one again, under one king.", next = "BACK", reply = "One king? Magni's a fine dwarf, but the Wildhammer bow tae the storm an' nae crown. Ask me again in a hundred years.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_zg = {
      big = true,
      lines = { { id = "xcl_zg_default", text = "Then every troll in the south lost its god in one night, an' I'll wager the ones up here felt it too. The Vilebranch witch doctors have been talkin' all year o' blood an' somethin' risin' in the south, so there'll be a good many frightened priests at Jintha'Alor this mornin'." } },
      choices = {
        { text = "Hakkar threatened every land, so I fought for all of them.", next = "BACK", reply = "Spoken like a true Wildhammer! The Vilebranch'll feel it up here, an' I'll make sure they feel it harder.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I went for the treasure, High Thane. The world can thank me later.", next = "BACK", reply = "Treasure an' all, eh? Ha! I'll no' grudge ye, so long as Hakkar stays dead an' ye buy the next round.", fx = { align = { light = -1 } } },
        { text = "Will the Hinterlands trolls be weaker without Hakkar?", next = "xcl_zg2" },
      },
    },
    xcl_zg2 = {
      lines = { { id = "xcl_zg2_default", text = "Weaker, aye, though a wounded troll fights the harder for it, an' I've buried enough riders tae know. The Amani lost their empire tae Quel'Thalas an' then lost their war beside the Horde, an' here they are still, so I'll nae count them finished till the last o' their altars is cold." } },
      choices = {
        { text = "Then I'll keep my blade sharp, High Thane.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Welcome? Ye're kin twice over, {g:lad|lass}, once by blood an' once by the sky, an' I'll fight any dwarf in this keep who says otherwise. Ye'll fly wi' us against the Vilebranch an' drink wi' us after, an' if the storm answers ye, ye'll call it down on the trolls an' no' on my gryphons!" } },
      choices = {
        { text = "Then I'll fight beside the Wildhammer, Thane, and follow your lead.", next = "BACK", reply = "Then ye'll fly wi' my riders, an' the Vilebranch'll learn what a shaman on a gryphon can do.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight, Thane, but I'll go where the spirits send me.", next = "BACK", reply = "The spirits an' the Thane want the same thing, {g:lad|lass}, so ye'll find little tae choose between us. Go where they send ye.", fx = { align = { order = -1 } } },
        { text = "Something else, Thane.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A place, aye, though no' the same one Ironforge gives it. We pray tae the sky an' the storm an' the spirits o' the peaks, but I've seen a priest pull a rider back from the edge o' death, an' I'll no' scoff at that." } },
      choices = {
        { text = "Spirits or Light, whatever heals your riders is holy enough.", next = "BACK", reply = "That's the Wildhammer view exactly, an' ye'd be welcome at any healer's fire in the Peak.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Light is the one truth, Thane, whatever your clan believes.", next = "BACK", reply = "Ironforge's priests say the same, an' we've agreed tae disagree for three hundred years. Heal my riders an' I'll no' argue.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Jintha'Alor, where the Vilebranch keep their altars an' their cages, an' where they spill blood every night tae gods I'll no' name. If yer Light can burn that stain off the hill, ye'll have the thanks o' every Wildhammer alive." } },
      choices = {
        { text = "I'll free their captives first, then deal with the altars.", next = "BACK", reply = "Aye, the captives first, for they've waited long enough. Then bring the altars down on the priests' heads.", fx = { align = { light = 1 } } },
        { text = "Burn the whole hill. Mercy is wasted on the Vilebranch.", next = "BACK", reply = "There's no' a rider in this keep would argue wi' ye, but I'll have the prisoners out before the fire starts.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_dwarf", tags = { "news" }, when = { party = { race = "Dwarf" }, faction = "Alliance" },
          text = "You've brought {companion} up to the Peak, and a Bronzebeard by the cut of that beard. Magni and I keep the peace well enough these days, but I'll warn you that half my riders still mutter about Grim Batol when one of Ironforge's lot walks in." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Ha! An Ironforge dwarf wi' the storm in yer hands! Magni's lot always called the spirits Wildhammer superstition, {class}, an' here ye are provin' 'em wrong in my own hall!" },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest o' the Light, at Aerie Peak! We Wildhammer mostly keep tae the old spirits, as Fraggar our shaman'll tell ye, but I'll take any blessin' that sends a troll back intae the ground." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, in plate an' all! Ye'll be a heavy load for a gryphon, {class}, but the Vilebranch at Jintha'Alor could use a hammer brought down on 'em from a great height." },
        { id = "h_default", key = true,
          text = "Falstad Wildhammer, High Thane o' the Wildhammer clan! The forest trolls are pressin' in on the Hinterlands, an' I mean tae push 'em back where they came from." },
        { id = "h_hinterlands", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("To The Hinterlands") }, { questActive = TODO_QUEST("Gryphon Master Talonaxe") } } },
          text = "Ye've come tae help! Then go see Talonaxe at the aviary, an' he'll put ye where the fightin's thickest." },
        { id = "h_magni", when = { heardLine = "magni.h_default" },
          text = "Ye've been tae Ironforge an' stood before Bronzebeard, have ye? He's a fine king, for a dwarf who never leaves the ground." },
        { id = "h_sharpbeak", tags = { "news" }, when = { questRecent = { TODO_QUEST("Saving Sharpbeak"), days = 3 } },
          text = "Sharpbeak's home! The whole aviary sang last night. Ye've a friend in every Wildhammer on this peak now, an' a few o' the gryphons too." },
        { id = "h_cl_zg", tags = { "news" }, when = { cleared = "Zul'Gurub", faction = "Alliance" },
          text = "Ha! There's a tale come up from Stranglethorn that the blood god o' the Gurubashi's been put down in his own city, an' that ye were in the thick of it. Sit down an' tell me, for there's nae a dwarf in Aerie Peak who won't drink tae that." },
        { id = "h_xkin", when = { origin = "dwarf_wildhammer_kin" },
          text = "Ha! There's Aerie Peak in yer face, for all ye were raised under a mountain. Kin's kin, an' the eyrie's open to ye any time ye like." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye've a smell about ye like a forge put out wi' the wrong water, {class}, an' I'd wager Fraggar's spirits are hidin' under his bed right now." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A spellcaster at Aerie Peak! Mind ye keep yer fire off the gryphons, {class}, for they've long memories an' sharper beaks." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ha, a quiet one! Ye walked in so soft the gryphons never squawked, an' that's a rarer trick than ye'd think in Wildhammer Keep." },
        { id = "h_dd_trolls", tags = { "news" }, when = { killed = { name = { "Vilebranch", "Witherbark" }, min = 60 } },
          text = "My riders tell me the troll drums at Jintha'Alor and Shadra'Alor have gone quieter, an' that a stranger's been doin' the quietin'. I like a guest who leaves the Hinterlands tidier than they found it." },
      },
      again = {
        { id = "h_again", text = "What else? Out wi' it, for I've trolls tae think about!" },
        { id = "h_again2", text = "Ha! More questions, an' I like a curious one, so go on." },
      },
      choices = {
        { text = "Tell me about the gryphon riders.", next = "gryphons" },
        { text = "Who are these trolls?", next = "trolls" },
        { text = "Are the Wildhammer part of the Alliance?", next = "alliance" },
        { text = "The Wildhammer must have allies out here.", next = "allies" },
        { text = "Ironforge sends its regards.", next = "bronzebeard", when = { race = "Dwarf" } },
        { text = "My people glide on the wind.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Do the Wildhammer count me a friend yet?", next = "friend", when = { townStanding = { town = "aerie_peak", min = 30 } } },
        { text = "My beast and I could fly with your riders.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Point me at the trolls, thane.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "The Hinterlands' forests are sick. I can feel it.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Could a gnome ride one of your gryphons?", next = "xgnome", when = { race = "Gnome" } },
        { text = "Will Aerie Peak suffer a warlock who fights the trolls?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The arcane could help you against the trolls, Thane.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the Wildhammer have any use for someone who works unseen?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'd guess the Wildhammer have little place for the Light, Thane.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Where would a paladin's hammer do the most good, Thane?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Am I welcome here, High Thane, as a shaman of Ironforge?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I was in Zul'Gurub when Hakkar fell, High Thane.", next = "xcl_zg", when = { cleared = "Zul'Gurub", faction = "Alliance" } },
        { text = "The Wildhammer and Ironforge still seem at odds, Thane.", next = "xpt_dwarf", when = { party = { race = "Dwarf" }, faction = "Alliance" } },
        { text = "You've a mouth on you about Ironforge, Falstad.", next = "prej", when = { prejudiced = true, ["not"] = { origin = { "dwarf_wildhammer_kin", "dwarf_wildhammer_shaman" } } } },
        { text = "I'm here to fight trolls.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { aerie_peak = 1 } } },
        { text = "Will the trolls ever leave the Hinterlands, Falstad?", next = "dd_trolls", when = { killed = { name = { "Vilebranch", "Witherbark" }, min = 60 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Use? The Vilebranch keep their prisoners caged up at Jintha'Alor, an' a gryphon cannae land quiet on a troll temple, so a pair o' soft feet might do what a dozen hammers cannae. I'll no ask who taught ye, mind, for the Wildhammer like their enemies tae see us comin'." } },
      choices = {
        { text = "A blade in the dark saves lives. Honour doesn't.", next = "BACK", reply = "Aye, it does, an' I've buried enough honourable riders tae know it. Go quiet, an' bring my people home.", fx = { align = { honor = -1 } } },
        { text = "When it counts, I'd still rather face them openly, Thane.", next = "BACK", reply = "Ye've the heart o' a Wildhammer, then, an' I'll no' fault it. Bring yer hammer an' I'll bring mine.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let's talk about something else, Thane.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Any fire that lands on the Vilebranch is welcome fire, {class}. But it was Dark Iron sorcery that poisoned Grim Batol for my people long ago, so ye'll forgive a Wildhammer for keepin' one eye on yer hands." } },
      choices = {
        { text = "You're right to be wary. Power needs a firm hand.", next = "BACK", reply = "Aye, a firm hand an' a clear head. I've seen a young shaman call lightning down on his own gryphon because he was showin' off for the lasses, an' I've no wish tae see it twice.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear of magic only holds a people back, Thane.", next = "BACK", reply = "Maybe, {class}, but ye didnae see Grim Batol after the Dark Irons were done wi' it. Mind yer fire.", fx = { align = { order = -1 } } },
        { text = "Let's leave the sorcery there.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'll suffer anyone who fights the Vilebranch, for they cut hearts out on their altars an' I've no room tae be choosy. But the Horde's warlocks burned these hills in the Second War, an' I flew against 'em, so keep yer wee beasties close an' off my landin'." } },
      choices = {
        { text = "I'll keep my demons leashed. Watch me if you like.", next = "BACK", reply = "Good. Watch ye I will, an' if they stay leashed, ye'll find me a fair host.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fire is fire. I'll burn the trolls however I please.", next = "BACK", reply = "Burn 'em, aye, but if one spark lands on my aerie, ye'll answer tae me an' a very angry gryphon.", fx = { align = { light = -1 } } },
        { text = "Enough about demons. Let's talk about something else.", next = "BACK" },
      },
    },
    gryphons = {
      big = true,
      lines = {
        { id = "g_default", text = "We've flown since before the Second War, an' we flew in it, against the Horde. A Wildhammer an' his gryphon are one creature in the air. Nothin' on the ground can match it." },
      },
      choices = {
        { text = "Could I learn to fly like that?", next = "gryphons_learn" },
        { text = "I'd like to see that.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    gryphons_learn = {
      lines = { { id = "gl_default", text = "Learn? Ha! A gryphon picks ye, or it doesnae. Talonaxe'll let ye ride with the flights, an' that's as close as most outsiders get, so be grateful for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trolls = {
      lines = {
        { id = "t_default", text = "Witherbark in the west, Vilebranch up in Jintha'Alor, Revantusk on the coast. Three tribes, all hatin' each other, all hatin' us more. It's very nearly cosy." },
      },
      choices = {
        { text = "One tribe must be worse than the others.", next = "trolls_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls_worst = {
      lines = { { id = "tw_default", text = "The Vilebranch, with blood on their altars an' cages full o' things they've no right tae. Fraggar can tell ye more, if ye can stand tae hear it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alliance = {
      big = true,
      lines = { { id = "a_default", text = "We fought for it an' bled for it, an' some o' our riders never came home, an' the rest of us decided we'd rather answer tae our own sky. We're friends tae any who prove themselves, so prove yerself." } },
      choices = {
        { text = "What do you make of Magni and his Bronzebeards?", next = "opn_magni" },
        { text = "That's fair, Thane.", next = "BACK", reply = "It's more than fair, it's Wildhammer! I'm glad ye see it, an' I'll tell Magni's next envoy that even his own folk agree wi' me.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "The Alliance needs every hammer it can get.", next = "BACK", reply = "An' when it asks, it gets ours, as it did in the Second War. But we'll no' be told when tae swing.", fx = { affinity = -1, align = { order = 2 } } },
        { text = "You miss the riders who flew off with the Alliance.", tag = "Persuade", next = "kurdran",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Dwarf" }, { trait = "brave" } } } },
          fail = { next = "kurdran_no", fx = { affinity = -1 } } },
      },
    },
    allies = {
      lines = { { id = "al_default", text = "The elves o' Quel'Danil, in the hills. Old friends from the old wars. They don't drink enough, but they shoot straight an' they don't run." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bronzebeard = {
      lines = { { id = "b_default", text = "Does it! Then tell the Bronzebeards the Wildhammer are well, an' flyin', an' still better company, an' they'll know I mean it kindly, mostly." } },
      choices = {
        { text = "I'll pass it on. Word for word.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Ironforge has its own strengths.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    skyborne = {
      lines = { { id = "s_default", text = "Glide! Downhill, aye? A gryphon goes up, {g:lad|lass}. Up! Come back when yer wind can carry ye over a mountain, an' we'll talk about who flies better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    friend = {
      lines = { { id = "f_default", text = "Count ye? The riders toast ye by name at the bar. That's more than they do for me, an' I'm their Thane." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    kurdran = {
      lines = {
        { id = "ku_default", text = "Aye, ye've a sharp eye for a flatlander. Kurdran flew through the Dark Portal wi' the Alliance an' a fine flight o' riders behind him, an' none o' them came back when it closed, so every night at the bar I drink one tae them an' tell nobody why." },
        { id = "ku_dwarf", when = { race = "Dwarf" },
          text = "Ye're a dwarf, so ye'll have heard the tale. Kurdran took our best riders through the Dark Portal wi' the Alliance, an' it closed behind 'em, an' I've raised a mug tae them every night since without once sayin' so out loud." },
      },
      choices = {
        { text = "Here's to Kurdran, then.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kurdran_no = {
      lines = {
        { id = "kn_default", text = "Miss someone? Ha! I miss the days when trolls ran at the sight o' me, an' that's all the missin' I've time for." },
        { id = "kn_elf", when = { race = "NightElf" },
          text = "Ye elves an' yer long faces! I miss nothin' but a quiet sky, an' I'll have that when the trolls are gone." },
      },
      choices = {
        { text = "Here's to a clear sky, then, Thane.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xhu_default", text = "Fly wi' us? Ye'd need a gryphon, an' a gryphon chooses its rider, not the other way round. But a hunter who knows a beast's mind is halfway to bein' a Wildhammer, so go an' sit wi' the birds a while an' see if one takes to ye." } },
      choices = {
        { text = "Tell me more about the gryphon riders.", next = "gryphons" },
        { text = "My beast is enough for me.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xwarrior = {
      big = true,
      lines = { { id = "xwa_default", text = "That's the spirit! The Vilebranch are at Jintha'Alor an' the Witherbark at Shadra'Alor, an' the Revantusk sit at the coast wi' the Horde. Hit the first two as hard as ye like; the third I'm still makin' my mind up about." } },
      choices = {
        { text = "A troll's a troll. They'll all fall in the end.", next = "BACK", reply = "That's the spirit! Off ye go, an' mind the spears; the Vilebranch throw them uphill better than ye'd think.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll leave the Revantusk to you, then.", next = "BACK", reply = "Aye, the Revantusk can wait. They keep tae their beach an' fight the Vilebranch for us, an' I'll no' complain about free help.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Why not the Revantusk?", next = "trolls" },
      },
    },
    xdruid = {
      lines = { { id = "xdr_default", text = "Ye can, can ye? So can we, in our own way; a Wildhammer knows when the wind's wrong an' the trees have gone quiet. It's the Vilebranch an' their altars, an' whatever they're feedin' wi' all that blood." } },
      choices = {
        { text = "Then I'll help heal it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Who else stands with you against them?", next = "allies" },
      },
    },
    xgnome = {
      lines = { { id = "xgn_default", text = "Could ye! A gryphon could carry three o' ye an' a picnic. The trouble's no' the weight; it's keepin' ye from tryin' to fit the bird wi' an engine, an' I've heard about gnomes an' engines." } },
      choices = {
        { text = "An engine would be an improvement.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
        { text = "No engines, I promise. Just the bird.", next = "BACK", fx = { affinity = 2 } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Ha! Now there's someone wi' taste! Say it again louder, so the gryphons can hear ye, fer they think it's all their doin'." },
        { id = "s2", text = "That's a fine thing tae say tae a Wildhammer, an' I'll drink tae it tonight. Ye've a good heart an' a good eye fer a keep." },
      },
      fail = {
        { id = "f1", text = "Och, ye sound like an Ironforge senator wi' a petition up his sleeve. We dinnae butter each other up here, we just say what we want an' then have a drink." },
        { id = "f2", text = "Pretty words are fer folk who live under roofs o' stone. Up here we judge ye by how ye sit a gryphon an' how many trolls ye've dropped." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha ha! Ye cheeky devil, I've no' been ribbed like that since the last clan moot! Come here, fer anyone wi' that much gall belongs at my table." },
        { id = "s2", text = "Now that's the spirit! A body who can trade insults wi' Falstad Wildhammer an' keep grinnin' is a body I'd fly wi'." },
      },
      fail = {
        { id = "f1", text = "Careful, now. I'll laugh at near anythin', but ye'll no' mock the Wildhammer name in the Wildhammers' own keep an' walk out wi' all yer teeth." },
        { id = "f2", text = "That wasnae funny, an' I'm a dwarf who finds most things funny. Ye've a sour tongue, an' I'll thank ye tae keep it behind yer teeth." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Ho, now, steady on! Ye've a glare like a stormcrow, an' I'll no' say it didnae land. Have yer way, then, fer I'd sooner fight trolls than guests." },
        { id = "s2", text = "By the skies, ye mean it, don't ye? All right, all right, I'll give ye that one, an' I'll think twice afore I cross ye." },
      },
      fail = {
        { id = "f1", text = "Ha! I rode a gryphon intae dragonfire in the Second War, so ye'll have tae do better than scowl at me. Try it on the Vilebranch, fer they scare easier." },
        { id = "f2", narr = "He laughs loud enough to startle the gryphons in the roost.", text = "Are ye threatenin' me, in Aerie Peak? That's the funniest thing I've heard all season, an' I'd stop now, while I'm still laughin'." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's Wildhammer business, an' I dinnae hand it tae folk I've no' shared a fight or a keg wi'. Stick about, an' we'll see." },
      { id = "gt2", text = "Aye, I know, an' I'm no' tellin' ye yet. Ye'll have tae prove ye're a friend o' the Peak afore I open my mouth on that." },
    },
    knows = {
      { id = "tp_knows", text = "Every rider in Aerie Peak reports tae me, an' most o' them stretch a story by a troll or two, so I've learned tae hear the truth under the boastin'! Ask away." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "Ask me anythin' ye like! Ye've earned the riders' respect, an' that means ye've earned mine." },
    },
    background = { { id = "tp_ba", text = "Wildhammer born, gryphon raised, an' Thane by right o' bein' the loudest! The Second War made a rider o' me, an' the Hinterlands made a Thane.", next = "gryphons" } },
    advice = { { id = "tp_ad", text = "Never fight a troll on its own ground; fight it from above, for everythin' is easier from above." } },
    dark_iron = { { id = "tp_dark_iron", text = "Dark Irons! Don't get me started, or we'll be here till the sun's down an' up again." } },
    wildhammer = { { id = "tp_wildhammer", text = "We're the Wildhammer, lad, the dwarves who chose the sky over the stone, an' we've never once regretted it. Aerie Peak's our home, an' every gryphon in it is kin." } },
    magni = { { id = "tp_magni", text = "Magni's a fine king fer the Bronzebeards, an' I'll drink tae his health any day. He rules his mountain an' I rule my sky, an' that suits us both." } },
    grim_batol = { { id = "tp_grim_batol", text = "Grim Batol was ours once, before the Dark Irons' witch cursed it wi' her dyin' breath. We left it tae the dark an' the Dragonmaw, an' we built Aerie Peak instead, an' it's the better home." } },
    second_war = { { id = "tp_second_war", text = "We flew wi' the Alliance in the Second War, an' Kurdran an' his riders were the terror o' the Horde. We bled fer the humans, an' we'd do it again, though we'd want a thank ye this time." } },
    thrall = { { id = "tp_thrall", text = "The orc warchief's made peace wi' some an' war wi' others, an' now he's got trolls in Revantusk right on my doorstep. I'll judge him by them, an' so far they've kept tae their side o' the hills." }, { id = "tp_thrall2", when = { faction = "Horde" }, text = "Yer warchief's Revantusk friends sit on my coast an' call it an alliance. Mind yer manners in my aerie, an' we'll get along fine." } },
    green_dragons = { { id = "tp_green_dragons", text = "There's a portal tae the Emerald Dream in the Seradane, an' the green dragons that guard it have gone strange o' late. My riders give it a wide berth, an' so should ye." } },
    the_elements = { { id = "tp_the_elements", text = "We Wildhammer still talk tae the spirits, as the Bronzebeards stopped doin' long ago. Fraggar can tell ye more, if ye can get him tae stop listenin' tae the wind long enough." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi have woken their blood god down in Stranglethorn, an' the Vilebranch up here have been dancin' tae the same drums. I dinnae like it, an' I like it less every night." } },
    _none = { { id = "tp_none", text = "Never heard o' it! Is it a troll, now? Then I'll hear of it soon enough." } },
  },
}

P:NPC {
  key = "talonaxe", id = TODO_NPC("Gryphon Master Talonaxe"), name = "Gryphon Master Talonaxe",
  bible = "bibles/hinterlands.md", role = "questgiver", tier = "quest",
  communities = { "aerie_peak" }, temper = { "gruff" }, values = { "loyal", "practical" },
  prejudice = { race = "Gnome", amount = 8, why = "Gnomish flying machines spook his gryphons." },
  notices = { "class" },

  impression = {
    first = "Gryphon Master Talonaxe would plainly rather be in the air than talking to me. He keeps the aeries safe from the trolls, and I don't think he's ever lost an argument with one.",
    third = "{name} met Gryphon Master Talonaxe, who keeps the aviary at Aerie Peak safe from the forest trolls.",
  },

  greetings = {
    { id = "g_prej1", when = { prejudiced = true }, text = "A gnome. Keep yer tools in yer pack an' nothin' that ticks near my birds, for the last one o' yer folk who came up here brought a flyin' machine, an' I'm still pickin' feathers off the walls." },
    { id = "g_prej2", when = { prejudiced = true }, text = "Gnome, is it? Stand downwind o' the aviary, if ye please. The gryphons can smell engine oil a mile off, an' they hate it worse than I do." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Ye've been round my birds an' not one o' them has bolted, so I'll admit ye're no' like the rest o' yer tinkerin' lot. Come in." },
    { id = "g_aviary", text = "Aye, what is it? I'd rather be up in the air than down here talkin', but the gryphons won't take orders from the ground, so somebody has tae." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' the gryphons noticed before I did, which tells ye somethin'. Right, what is it?" },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear ye talked someone at the Peak intae somethin'. Dinnae try it wi' me, for I answer tae gryphons, an' they dinnae listen tae reason either." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, eh? Keep yer pet away from the gryphons, or they'll eat it an' then look at ye for more." },
  },

  start = "hello",
  nodes = {
    prej = {
      lines = { { id = "prej_default", text = "I don't care for what gnomes build, which is different, though it's hard tae tell the two apart. A gnome flew a whirlin' contraption over the Peak last summer, an' three o' my best birds broke their tethers an' I didnae see them for a week." } },
      choices = {
        { text = "Machines and gryphons can share a sky. Learn to live with it.", next = "BACK", reply = "Learn tae live wi' it? I've been tryin' since that gnome flew over my aerie. I'll try harder, for ye.", fx = { align = { order = 1 } } },
        { text = "Then keep the sky wild. Gryphons don't need gnomish gadgets.", next = "BACK", reply = "That's it exactly! The sky's no' a workshop, an' my birds agree wi' me.", fx = { align = { order = -1 } } },
        { text = "I'll keep my tools packed and stay downwind.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "Did the gryphons come back?", next = "prej_why" },
        { text = "Something else, Talonaxe.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "Two did, an' the third came home a month later wi' a cut wing an' a temper. She won't let anyone ride her now but me, an' every time she hears a whistle she looks at me like it's my fault." } },
      choices = {
        { text = "That gnome should answer for it, not every gnome.", next = "BACK", reply = "Aye, ye're right, an' I'll own it. But she still won't let anyone ride her, an' that's hard tae forgive.", fx = { align = { honor = 1 } } },
        { text = "Blame's easier spread wide. I understand that.", next = "BACK", reply = "Easier, aye, an' I'm ashamed of it some days. Still, my birds are owed somethin'.", fx = { align = { honor = -1 } } },
        { text = "Something else, Talonaxe.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "Aye, well, that's sensible, an' sensible's rarer than ye'd think. Mind ye, if anythin' ticks, ye're out." } },
      choices = {
        { text = "Something else, Talonaxe.", next = "BACK" },
      },
    },
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "A grown gryphon can, but it won't thank you, and it'll remember who sat on its tail long after you've forgotten the flight. We fly the Wildhammer way, one rider and one bird bound for life, and anyone who treats a gryphon like a cart horse gets bitten and deserves it." } },
      choices = {
        { text = "One rider and one bird for life. That's how it should be.", next = "BACK", reply = "That's the Wildhammer way, an' ye'll find my birds respect ye for it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A beast should carry what it's told to carry.", next = "BACK", reply = "Told, is it? Try that wi' a grown gryphon an' see where ye land. My bet's on the river.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They do, an' always have, for a gryphon's half wind an' half stubbornness, an' a Wildhammer rider learns tae hear both. An Ironforge dwarf who can hear what the birds hear is the first I've met, an' I'd let ye near the aeries for that alone." } },
      choices = {
        { text = "A gryphon has to be trained and ruled, or it ruins the rider.", next = "BACK", reply = "Ruled, aye, an' it'll rule ye right back. I've seen it, an' I've buried it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No reins, no orders. Bond with the bird and trust it.", next = "BACK", reply = "That's how a Wildhammer flies, an' ye've a rider's soul. Come up tae the aerie at dawn, when they're hungry an' honest, an' we'll see which o' them picks ye.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Aye, for every night they come tae steal eggs or kill the young. The Vilebranch an' the Witherbark think the Hinterlands are theirs, an' we think they're ours, an' the gryphons just want tae be left alone." } },
      choices = {
        { text = "Drive them out. The gryphons deserve safe aeries.", next = "BACK", reply = "Aye, an' my riders will lead the way. Bring me back the eggs if ye can.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Guard the aeries, but leave the trolls their hills.", next = "BACK", reply = "Leave 'em the hills, an' they'll come back for the eggs. But I hear ye, an' I'll think on it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A rider who listens tae the bird before he listens tae his own temper. I've seen warriors try tae steer a gryphon intae a fight like a cart horse, an' the bird threw 'em off at the Vilebranch walls an' flew home wi'out 'em." } },
      choices = {
        { text = "Then I'll follow your rules to the letter, Gryphon Master.", next = "BACK", reply = "Good, an' ye'll live longer for it. My birds remember the riders who listen.", fx = { align = { order = 1 } } },
        { text = "Gryphon or not, I'll fight where I choose.", next = "BACK", reply = "Then ye'll fight on yer own two feet, for none o' my birds will carry ye. Choose wisely.", fx = { align = { order = -1 } } },
        { text = "Something else, Talonaxe.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Too often, an' the worst o' it isnae the spears. The Vilebranch daub their arrows wi' somethin' foul from their altars, an' a bird struck wi' one sickens for days, so I sit up wi' them an' do what I can, which isnae much." } },
      choices = {
        { text = "Then I'll pray over them. Beasts deserve the Light's mercy too.", next = "BACK", reply = "Bless ye. The birds feel it, I swear, even if they cannae say so.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A gryphon's a beast. Save your prayers for the riders.", next = "BACK", reply = "The riders have priests enough. My birds have only me, so I'll do the prayin' for 'em.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Aye, it might, for the Vilebranch priests work blood magic on their altars, an' I've heard it said their curses slide off the Light like rain off a slate roof. But I'll no' send ye up there on a bird tae play the hero, for Sharpbeak's the one that matters, an' a dead paladin cannae carry a gryphon chick home." } },
      choices = {
        { text = "The chick comes first. Glory can wait, Talonaxe.", next = "BACK", reply = "Aye, that's my thinkin', an' the chick will thank ye when she's grown.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll smash their altars first. The chick can wait.", next = "BACK", reply = "Then ye'll find the chick dead when ye're done, an' I'll find ye a very long walk home.", fx = { align = { honor = -1 } } },
        { text = "Something else, Talonaxe.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "She'd attack anythin' that smells wrong near her nest, an' ye smell wrong, {g:lad|lass}, no offence meant. The Vilebranch shadow hunters reek o' the same dark stuff, so as far as she's concerned, ye might be one o' them in an Alliance coat, an' I'll no' be arguin' wi' a mother gryphon on yer behalf." } },
      choices = {
        { text = "I'll give her nest a wide berth, then.", next = "BACK", reply = "Good. She'll thank ye by no' eatin' ye, which is the best thanks she gives anybody, me included.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then keep her leashed. I go where I need to.", next = "BACK", reply = "She'll no' be leashed, {g:lad|lass}, she's a gryphon. Go round, or go home.", fx = { align = { order = -1 } } },
        { text = "Something else, Talonaxe.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "Four friends behind you, and all of you wanting a ride, I'll wager, though my birds are trained to carry one rider each and they'll tell you so with their beaks." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman o' Ironforge? The birds knew afore I did, {class}, for they've been rufflin' their feathers since ye came up the path, an' that's how they greet a friend o' the wind." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, is it? Say a word for the birds while ye're here, {class}, for every gryphon that flies over Jintha'Alor comes back wi' somethin' I'd rather no' see." },
        { id = "h_default", key = true,
          text = "Gryphon Master Talonaxe. I keep the aviary, an' the trolls keep tryin' tae get at the aeries, an' I keep stoppin' 'em, mostly. They got young Sharpbeak, though, an' I'd sooner be in the air after him than standin' here." },
        { id = "h_cages", tags = { "news" }, when = { questActive = TODO_QUEST("Witherbark Cages") },
          text = "The Witherbark have cages in their villages, so go an' see what's in 'em, though I've a nasty feelin' I know." },
        { id = "h_altar", when = { questActive = TODO_QUEST("The Altar of Zul") },
          text = "There's trolls doin' troll business up at the Altar o' Zul, an' none of it good, so go an' look." },
        { id = "h_sharpbeak", when = { questActive = TODO_QUEST("Saving Sharpbeak") },
          text = "Sharpbeak, Swiftwind an' Keenclaw's young one, is locked in a cage at the top o' Jintha'Alor, where the Vilebranch have him. Bring the wee beast home." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to the Hinterlands") },
          text = "Back from the south, are ye? Good, for now we know what the trolls are about, an' we can do somethin' about it." },
        { id = "h_rhapsody", when = { questActive = TODO_QUEST("Rhapsody Shindigger") },
          text = "Rhapsody Shindigger's got a camp out east o' here, brewin' who knows what. Go see what he wants, because I'm no' goin'." },
        { id = "h_saved", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Saving Sharpbeak"), days = 3 } },
          text = "Sharpbeak hasnae left his mother's side since ye brought him back, an' Keenclaw let me near him this mornin', for the first time. I'll no' forget it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, is it? The gryphons don't like the crackle o' the arcane, {class}, so stand downwind o' the nests if ye please." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Keep yer hands where the birds can see 'em, {class}, for a gryphon knows a sneak by the smell, an' they bite first." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Ye'll want tae fight the trolls, I suppose, an' ye'll want a gryphon tae get there, an' ye'll want me tae trust ye wi' one, which I don't yet." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf druid! The gryphons are wary of ye, I can tell, but they'll settle once they know ye're no threat tae the aeries." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The birds'll moan about the weight o' that plate, {class}, but they'll carry ye, an' I'd wager the trolls at Jintha'Alor have never seen holy light come down on 'em from the sky." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Keep that thing o' yours well away from the nests, {class}, for Keenclaw's still twitchy after the trolls took her young one, an' she'll take yer arm off tae protect what's left." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Witherbark", min = 30 } }, text = "The riders say the Witherbark have gone quiet in the south, an' they've stopped throwin' spears at my birds. Somebody's been teachin' 'em manners, an' I've a fair idea who." },
      },
      again = { { id = "h_again", text = "What is it? Be quick, they're wantin' fed." } },
      choices = {
        { text = "Who's Sharpbeak?", next = "sharpbeak" },
        { text = "Why do the trolls want the gryphons?", next = "trolls" },
        { text = "You look like you'd rather be flying.", next = "flying" },
        { text = "Rhapsody seems to be brewing something strong.", next = "rhapsody", when = { any = { { questActive = TODO_QUEST("Rhapsody Shindigger") }, { questDone = TODO_QUEST("Rhapsody Shindigger") } } } },
        { text = "My pet won't bother your birds.", next = "pet", when = { class = "HUNTER" } },
        { text = "My people ride hippogryphs. Are they so different?", next = "xnightelf", when = { race = "NightElf" } },
        { text = "Couldn't a mage simply teleport, instead of flying?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'd guess the trolls have crept into your aviary before.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the gryphons ever come back hurt from the troll lands?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would it take for you to trust a warrior with a gryphon?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Should the trolls be driven from the aeries for good?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would a paladin be any use against Jintha'Alor, Talonaxe?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would Keenclaw really attack a warlock, Talonaxe?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The gryphons seem to sense the spirits, Talonaxe.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "A gryphon could surely carry two riders, Gryphon Master.", next = "xpt_company", when = { party = { size = 4 }, faction = "Alliance" } },
        { text = "You don't care much for gnomes, Talonaxe.", next = "prej", when = { prejudiced = true } },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Twice, an' near as quiet as ye. A Witherbark scout got all the way up tae the nests one night before the birds woke an' took him apart, so now I sleep up here wi' them an' I trust nothin' that walks soft." } },
      choices = {
        { text = "Your distrust keeps the birds alive. I'd do the same.", next = "BACK", reply = "Aye, an' I'll keep it, thank ye. My birds are alive because I trust nobody.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Walking softly is no crime, Gryphon Master.", next = "BACK", reply = "No' a crime, but a warnin'. I'll keep my eye on ye all the same.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Aye, tae yer own city an' nowhere else, an' ye arrive wi' yer stomach left behind. A gryphon'll take ye tae any aerie I name, an' a rider earns the sky every time he climbs on, which is more than any spell can say." } },
      choices = {
        { text = "Earned things matter more than easy ones.", next = "BACK", reply = "They do, aye, an' ye'll feel the difference the first time ye fly. Come up an' see.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Easier is better. I'll take the spell, thank you.", next = "BACK", reply = "Easier it is, then, an' ye'll miss the best view in the world. Yer loss.", fx = { align = { honor = -1 } } },
        { text = "Fair enough. Another question, then.", next = "BACK" },
      },
    },
    sharpbeak = {
      big = true,
      lines = { { id = "s_default", text = "He's Swiftwind an' Keenclaw's young one, the best bloodline on the peak. The Vilebranch took him for their altar, an' every gryphon in this aviary knows it; they've no' been quiet since." } },
      choices = {
        { text = "I'll bring him home.", next = "BACK", fx = { affinity = 3, trait = { brave = 1 }, standing = { aerie_peak = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls = {
      lines = { { id = "t_default", text = "For their altars, an' for spite, because a Wildhammer without a gryphon's half a Wildhammer, an' they know it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flying = {
      lines = { { id = "f_default", text = "Every day, but the birds need somebody on the ground who knows 'em, an' I'm the somebody. One day I'll train a lad as good as me, an' then I'm off." } },
      choices = {
        { text = "That day might never come.", next = "flying_never", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flying_never = {
      lines = { { id = "fn_default", text = "Aye, I know, but don't tell the lads." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    rhapsody = {
      lines = { { id = "r_default", text = "Somethin' that'd strip paint off a keel. The riders love it an' the gryphons won't go near him, which tells ye which o' them has more sense." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pet = {
      lines = { { id = "p_default", text = "It willnae; it's the birds I'm worried about botherin' it, so keep it close." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xnightelf = {
      lines = { { id = "xne_default", text = "Different enough that I'd not let one in my aerie, an' I'd say the same o' a gryphon in yer forests. Yer hippogryphs are pretty an' quick; a gryphon's a brawler wi' wings, an' that's what ye want against trolls." } },
      choices = {
        { text = "Pretty and quick wins most fights.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Brawlers have their place.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The gryphons see the whole Hinterlands, an' their riders tell me what they saw. Ask, an' be quick about it." },
    },
    background = { { id = "tp_ba", text = "Rider, then trainer, then the one who never gets tae ride, an' funny how that happens.", next = "flying" } },
    advice = { { id = "tp_ad", text = "Bring a gryphon a fish an' it'll remember ye. Bring it two, an' it'll follow ye home." } },
    wildhammer = { { id = "tp_wildhammer", text = "A Wildhammer's gryphon is his brother an' his blade both, an' we fly together or no' at all. I've no patience fer dwarves who keep them in a stable like rams." } },
    magni = { { id = "tp_magni", text = "The Bronzebeards ride their gryphons like carts, an' Magni's lot are the worst o' them. Still, he's a fine dwarf in a fight, an' I'll no' say otherwise." } },
    second_war = { { id = "tp_second_war", text = "My father flew wi' Kurdran in the Second War, an' he came home wi' a gryphon an' a story, an' no' much else. I've the gryphon's grandson in my aerie now." } },
    _none = { { id = "tp_none", text = "Does it fly? If no', then I've no idea." } },
  },
}

P:NPC {
  key = "fraggar", id = TODO_NPC("Fraggar Thundermantle"), name = "Fraggar Thundermantle",
  bible = "bibles/hinterlands.md", role = "questgiver", tier = "quest",
  communities = { "aerie_peak" }, temper = { "solemn" }, values = { "devout", "protective" },
  notices = { "class" },

  impression = {
    first = "Fraggar Thundermantle's eyes are failing, but he listens to the land and says it is not happy. The Vilebranch rites trouble him deeply.",
    third = "{name} sat with Fraggar Thundermantle, who speaks for the spirits of the Hinterlands at Aerie Peak.",
  },

  greetings = {
    { id = "g_spirits", text = "Sit, friend. My eyes are no' what they were, but I hear the land well enough, an' it's no' happy." },
    { id = "g_away", when = { away = 14 }, text = "Is that you, friend? I'd know that step even after {away} away, an' the land's been askin' where ye went." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye sound heavier on yer feet than ye did, an' I don't mean yer belly. Ye've grown strong since we last spoke, an' the spirits mark it." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody at the Peak's carryin' a hot temper about ye. The winds bring me all sorts, an' that one came sour." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "Ye hear the spirits too. Then ye'll know what I mean when I say the trolls' altars make 'em weep." },
  },

  start = "hello",
  nodes = {
    opn_trolls = {
      lines = {
        { id = "opn_trolls_q", text = "The riders say so, an' they've buried enough friends tae say it loud. The spirits say different, but the spirits are kinder than most dwarves. The Revantusk on the coast never bled a gryphon on an altar, as far as I know. What d'ye think, then?" },
      },
      choices = {
        { text = "A troll is a troll. They'll all turn on you.", next = "opn_trolls_r_hate", fx = { align = { light = -1 }, opinion = { trolls = "hate" } } },
        { text = "The Vilebranch are the enemy. Leave the coast tribe be.", next = "opn_trolls_r_some_good", fx = { affinity = 1, align = { light = 1 }, opinion = { trolls = "some_good" } } },
        { text = "They're bleeding the spirits as much as us. I pity them.", next = "opn_trolls_r_pity", fx = { trait = { kind = 1 }, opinion = { trolls = "pity" } } },
        { text = "The spirits answer trolls too. That's enough for me.", next = "opn_trolls_r_some_good", when = { class = "SHAMAN" }, fx = { affinity = 2, opinion = { trolls = "some_good", the_elements = "respect" } } },
        { text = "I can't say, Fraggar.", next = "BACK" },
      },
    },
    opn_trolls_r = {
      lines = {
        { id = "opn_trolls_r_default", text = "Nor can I, most days. My eyes are bad an' my heart's worse at it." },
      },
      choices = {
        { text = "Something else, Fraggar.", next = "BACK" },
      },
    },
    opn_trolls_r_hate = {
      lines = {
        { id = "opn_trolls_r_hate", text = "Ye'll be welcome at the bar wi' that, an' I'll no' argue wi' a dwarf's grief. But the spirits dinnae care whose blood it is on the altar, an' I'd rather ye listened tae them than tae the riders." },
      },
      choices = {
        { text = "Something else, Fraggar.", next = "BACK" },
      },
    },
    opn_trolls_r_some_good = {
      lines = {
        { id = "opn_trolls_r_some_good", text = "Aye. Dinnae say it too loud near Talonaxe, but aye. The spirits'll be glad o' ye, an' so am I." },
      },
      choices = {
        { text = "Something else, Fraggar.", next = "BACK" },
      },
    },
    opn_trolls_r_pity = {
      lines = {
        { id = "opn_trolls_r_pity", text = "Pity's a heavy thing tae carry intae Jintha'Alor, {g:lad|lass}. Carry it anyway, but carry an axe beside it." },
      },
      choices = {
        { text = "Something else, Fraggar.", next = "BACK" },
      },
    },
    xpt_shaman = {
      big = true,
      lines = { { id = "xpt_shaman_default", text = "Some of us never let them go, friend, for the Wildhammer kept to the sky and the storm when Ironforge went down into the stone. It does me good to see a dwarf of any clan call on the wind again, though I'd not say so too loudly in the Great Forge." } },
      choices = {
        { text = "The old ways should come back to Ironforge too.", next = "BACK", reply = "They should, an' I've told 'em so for longer than ye've been alive. Maybe one day.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Ironforge's ways have served the dwarves well enough.", next = "BACK", reply = "They have, I'll grant ye, but the dwarves under the mountain have forgotten the wind. That's a cost.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_zg = {
      big = true,
      lines = { { id = "xcl_zg_default", text = "Then ye've done a hard an' needful thing, though it'll nae feel clean. The Soulflayer drank from every altar where a troll ever spilled blood in his name, an' the spirits tell me the Vilebranch altars were among them, so when he fell, they felt the stones at Jintha'Alor go cold." } },
      choices = {
        { text = "Then I'll cleanse those altars too, if the spirits ask it.", next = "BACK", reply = "Then ye're a better soul than most who walk out o' that jungle. The spirits'll guide ye.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the trolls keep their altars. My part in this is done.", next = "BACK", reply = "Done, aye, an' ye've earned yer rest. But the altars'll still be there when ye wake.", fx = { align = { light = -1 } } },
        { text = "Do the spirits say whether Hakkar can return?", next = "xcl_zg2" },
      },
    },
    xcl_zg2 = {
      lines = { { id = "xcl_zg2_default", text = "They say a god that feeds on blood is never wholly gone, so long as there's someone willin' tae feed it. That's nae a prophecy, mind, only an old dwarf's worry, but I'd keep an eye on any troll who still keeps a knife by his altar." } },
      choices = {
        { text = "I'll watch the altars, and the knives beside them.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It cares what the warrior does when he gets where he's goin'. The Vilebranch shed blood on their altars an' the land weeps for it, an' a warrior who sheds blood tae stop them might be forgiven, so long as he doesnae grow tae like it." } },
      choices = {
        { text = "I'd fight only to stop the blood rites, nothing more.", next = "BACK", reply = "That's all the spirits ask. Ye'll find them on yer side.", fx = { align = { light = 1 } } },
        { text = "Blood is blood. I'll shed what I must and not count it.", next = "BACK", reply = "Then the spirits will count it for ye, an' they're no' kind accountants. Mind yourself.", fx = { align = { light = -1 } } },
        { text = "Something else, Fraggar.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I hear the owls an' the wolves, an' lately I hear them go quiet near Jintha'Alor, which troubles me. The beasts know when the land's sick, an' they flee the sickness long before we see it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I hear the owls an' the wolves, an' lately I hear them go quiet near Jintha'Alor, which troubles me. Keep {pet} close in the forest, for the Vilebranch would take a hunter's beast for their altars as soon as the hunter." },
      },
      choices = {
        { text = "The land is sick, and Jintha'Alor has to be cleansed.", next = "BACK", reply = "Aye, it does, an' soon. I can smell their fires from the Peak on a west wind, an' I'll pray ye're the one tae put them out.", fx = { align = { light = 1 } } },
        { text = "Beasts flee from anything. It means nothing.", next = "BACK", reply = "They flee from what's wrong, an' I've lived long enough tae know the difference. Mind ye listen.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Maybe, if neither one tries tae own the other. The Light mends what's broken in a body an' the spirits mend what's broken in the land, an' the Vilebranch have bled both dry up at their altars." } },
      choices = {
        { text = "Each to its own work. Neither should rule the other.", next = "BACK", reply = "Aye, that's the way o' it. Ye'd make a fine healer at the Peak.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Light answers to no spirit. It stands above them all.", next = "BACK", reply = "The spirits were here before yer Light had a name, but I'll no' fight ye over it. Heal well.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I've always thought so, though there's priests in Ironforge who'd call me a heathen for sayin' it. The Light's a fire ye carry, an' the spirits are the ground ye walk on, an' it's the Vilebranch who've poisoned both wi' their altars, so I'll take any lantern that helps me see them burned out." } },
      choices = {
        { text = "Light and land together, Fraggar. That's how it should be.", next = "BACK", reply = "Aye, together, an' it's good tae hear it from a paladin. Ironforge could learn from ye.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light stands alone. Spirits are a lesser thing.", next = "BACK", reply = "So the priests tell me, an' they've been tellin' me for sixty years. I'll keep listenin' tae the wind.", fx = { align = { order = -1 } } },
        { text = "Something else, Fraggar.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_shaman", tags = { "news" }, when = { party = { class = "SHAMAN" }, faction = "Alliance" },
          text = "{companion} speaks to the storm; I can smell the rain on them from here. You don't see that in Ironforge's folk often, and it does an old Wildhammer's heart good." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "There's Light on ye, {class}, warm as a hearthstone. The spirits dinnae mind it, for it's an honest sort o' power, an' it's no' the Light they fear in these hills." },
        { id = "h_default", key = true,
          text = "Fraggar Thundermantle, an' I speak for the spirits o' this land. The Vilebranch spill blood on their altars an' call it worship, but the land remembers every drop, an' it tells me what my failin' eyes cannae see." },
        { id = "h_necklace", tags = { "news" }, when = { questActive = TODO_QUEST("Troll Necklace Bounty") },
          text = "Bring me the trolls' necklaces, for each one's a charm against the spirits I serve, an' each one I take is a little less o' their dark work." },
        { id = "h_cl_zg", tags = { "news" }, when = { cleared = "Zul'Gurub", faction = "Alliance" },
          text = "Somethin' shifted in the land a few nights past, like a fever breakin', an' the spirits went quiet for the first time in a long while. They tell me it was blood that broke it, far tae the south, an' they tell me ye know the place." },
        { id = "h_skulk", when = { questActive = TODO_QUEST("Skulk Rock Clean-up") },
          text = "Skulk Rock is fouled. Clean it, an' the spirits there can rest again." },
        { id = "h_eyes", when = { metBefore = true }, text = "My eyes grow dimmer each winter, an' the spirits grow louder tae make up for it. I think they're bein' kind." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear the wind on the peak? That's no' only wind, for the old spirits walk the ridges after dark." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "The arcane hangs off ye like a cold draught, {class}, an' the spirits shiver when ye pass. They've no love for it, though they'll forgive ye if ye mind yer manners." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "There's someone standin' on my blind side, an' the wind says they mean tae stay there. Speak up, {class}, an' let an old dwarf hear ye." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Ye stand heavy, like a dwarf in full mail, though I cannae see if ye are one. The land feels a warrior's step, an' it's no always glad of it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I can hear yer beast breathin' beside ye, an' it's calmer than most, which tells me ye treat it well." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Ye shine like a lantern, {class}, an' the spirits o' this land don't quite know what tae make o' ye, though they're no' unfriendly." },
        { id = "h_dd_sharpbeak", when = { questDone = TODO_QUEST("Saving Sharpbeak") },
          text = "The spirits have been singin' about a gryphon brought home, an' Talonaxe says it was yer doin'. Even the old ones on the ridge seem pleased, an' they're hard tae please." },
      },
      again = { { id = "h_again", text = "Aye? I'm listenin', as I'm always listenin'." } },
      choices = {
        { text = "What do the spirits say?", next = "spirits" },
        { text = "Your eyes seem clouded.", next = "eyes" },
        { text = "Something foul must happen at those altars.", next = "altars" },
        { text = "An Ironforge dwarf who hears the elements. What do you make of me?", next = "dwarfshaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "I hear them too.", next = "hear", when = { class = { "SHAMAN", "DRUID" } } },
        { text = "Why do the spirits dislike the arcane?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How did you know I was there, Fraggar?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can the Light and your spirits work together, Fraggar?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I doubt the land cares if a warrior walks on it, Fraggar.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "You must hear the beasts of the Hinterlands, Fraggar.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Can the Light and the spirits stand together, Fraggar?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I fought the Soulflayer in Zul'Gurub, Fraggar.", next = "xcl_zg", when = { cleared = "Zul'Gurub", faction = "Alliance" } },
        { text = "My companion is a shaman. Do the Wildhammer keep the old ways?", next = "xpt_shaman", when = { party = { class = "SHAMAN" }, faction = "Alliance" } },
        { text = "I'll help the spirits, Fraggar.", next = "END", reply = "Bless ye. They'll be glad o' the help, an' so will I. Walk wi' the wind.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Your spirits flinch when I come near, old man.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "I learned from your elders, Fraggar. Ironforge calls it backsliding.", next = "xorig_windshaman", when = { origin = "dwarf_wildhammer_shaman" } },
        { text = "The spirits can fend for themselves, old man.", next = "END", reply = "Maybe they can, an' maybe they cannae. Go on, then, an' mind the land doesnae remember ye unkindly.", fx = { align = { light = -1 } } },
      },
    },
    xorig_windshaman = {
      lines = {
        { id = "xowindshaman_default", text = "Backslidin', is it? Ironforge stopped listenin' tae the land the day it started diggin' through it, an' the spirits remember that even if the Bronzebeards dinnae. What do the winds say tae ye now, child o' the mountain?" },
      },
      choices = {
        { text = "That the land up here is angry.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "That Ironforge will remember too, in time.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "My eyes are failin', but the land isnae, an' it tells me who walks on it. Ye step light, like the Witherbark scouts do, so take care in the forest, for the trolls listen tae the ground the same way I do." } },
      choices = {
        { text = "Respect the land and it keeps your secrets. I'll remember.", next = "BACK", reply = "Aye, it does, an' ye'll find it a loyal friend. I'm glad tae hear it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The land's secrets are mine to use, old man.", next = "BACK", reply = "Then the land'll stop tellin' ye anythin', an' ye'll walk alone. Think on it.", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because it takes an' doesnae ask, the same as the Vilebranch blood rites, though cleaner. A Wildhammer asks the storm before he rides it, an' a mage grabs the lightnin' by the tail an' hopes for the best." } },
      choices = {
        { text = "Asking first is wiser. I'll keep that in mind.", next = "BACK", reply = "Good. Ask, an' ye'll be surprised how often the world says yes. I asked the wind for my first gryphon, an' she landed on my roof the next mornin'.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power answers to whoever's strong enough to take it.", next = "BACK", reply = "That's what the Vilebranch think too, an' look where it's led them. Mind yerself.", fx = { align = { order = -1 } } },
        { text = "I'll leave the spirits be. Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = { { id = "s_default", text = "That they're tired, an' that they've been bled for a long time, an' they'd like it tae stop. It's nothin' clever, for the old ones rarely say anythin' clever." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eyes = {
      lines = { { id = "e_default", text = "Goin', slowly. I can tell a friend from a troll by the walk, an' a liar by the breath. That's all a shaman needs tae see, an' I can still find the ale by smell." } },
      choices = {
        { text = "Then what do you see in me?", next = "eyes_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eyes_me = {
      lines = {
        { id = "em_default", text = "Somebody walkin' steady an' breathin' easy, who's no' lied tae me yet, so keep it that way." },
        { id = "em_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "Somebody carryin' somethin' heavy an' dark. I'll no' ask what, though the spirits might." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    altars = {
      big = true,
      lines = { { id = "a_default", text = "Blood, an' bindin', an' callin' on things that should stay asleep. The Vilebranch think the spirits answer them, an' somethin' answers, but it isnae the spirits." } },
      choices = {
        { text = "Are all the trolls here the same, Fraggar?", next = "opn_trolls" },
        { text = "Then the altars have to fall.", next = "BACK", reply = "Aye, they must, an' I'll pray for the hand that brings them down.", fx = { affinity = 2, align = { light = 2 } } },
        { text = "If something answers them, maybe it's worth hearing out.", next = "BACK", reply = "Hear it out? Ye'd no' like what it says, I promise ye. Leave it asleep.", fx = { align = { light = -2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarfshaman = {
      lines = { { id = "d_default", text = "That Ironforge is finally listenin'! The Wildhammer have heard the spirits since before the Bronzebeards learned tae dig. Welcome, cousin. Ye're late, but ye're welcome." } },
      choices = {
        { text = "Better late.", next = "BACK", fx = { affinity = 3, trait = { pious = 1 } } },
        { text = "Ironforge has its own ways.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    hear = {
      lines = { { id = "h2_default", text = "Then ye'll know what I mean when I say this land's grievin'. Sit wi' me a moment some evenin', for they speak easier tae two." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } } },
    },
    xwarlock = {
      big = true,
      lines = { { id = "xwl_default", text = "Aye, they do, an' so would I if my eyes were better. Whatever ye carry, it's no' from this world, an' the land here's sick enough already wi' troll blood on the altars." } },
      choices = {
        { text = "I'll keep it bound while I'm here.", next = "BACK", reply = "Thank ye. The land breathes easier already.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The land will just have to bear it.", next = "BACK", reply = "It will, aye, but it'll remember ye for it. Walk carefully.", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The spirits speak, an' I listen, an' now an' then they tell me somethin' worth passin' on. Ask, an' I'll tell ye what I can." },
    },
    background = { { id = "tp_ba", text = "Wildhammer, shaman an' listener; the spirits found me young, an' they've no' let go since." } },
    advice = { { id = "tp_ad", text = "When the wind goes quiet in the Hinterlands, listen harder, for somethin's holdin' its breath." } },
    the_elements = { { id = "tp_the_elements", text = "The land here's no' happy, friend, an' it's the Vilebranch an' their blood magic that's sickened it. The spirits speak through the wind an' the stone, an' I listen as best my old ears can." } },
    green_dragons = { { id = "tp_green_dragons", text = "The green dragons in the Seradane were guardians o' the Dream, an' somethin's gone wrong wi' them. The spirits flinch when I speak their names, an' I've stopped speakin' them." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The Atal'ai trolls who worship the blood god have a temple in the swamps tae the south, an' their kin up here have been hearin' its call. I feel it in the earth like a sickness." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream's a place the druids o' the night elves know better than I, but the spirits speak o' it as somewhere sick. That's no' a good thing fer anybody, dwarf or dragon." } },
    _none = { { id = "tp_none", text = "The spirits haven't spoken o' that, an' so neither will I." } },
  },
}

P:NPC {
  key = "thulfram", id = TODO_NPC("Innkeeper Thulfram"), name = "Innkeeper Thulfram",
  bible = "bibles/hinterlands.md", role = "innkeeper", tier = "service",
  communities = { "aerie_peak" }, temper = { "jovial" }, values = { "generous", "friendly" },
  notices = { "drink", "weary" },

  impression = {
    first = "Innkeeper Thulfram promised a fire hot enough to thaw a gryphon and very nearly delivered. Everyone ends up at his bar sooner or later, he says, and I believe it.",
    third = "{name} rested at Innkeeper Thulfram's inn at Aerie Peak, where gryphon riders and wanderers all end up at his bar.",
  },

  greetings = {
    { id = "o_magni_stuffy", tags = { "news" }, when = { gossip = { topic = "magni", stance = "stuffy" } },
      text = "Here's the one who told the Thane that Magni's stuffy! He's had me pour ye a mug on the Bronzebeards' tab every night since, an' the Bronzebeards dinnae know they've a tab." },
    { id = "o_trolls_hate", tags = { "news" }, when = { gossip = { topic = "trolls", stance = "hate" } },
      text = "Fraggar says ye'd see every troll in these hills gone, Revantusk an' all. The riders cheered it, an' Fraggar went quiet, an' that's never a good sign wi' him." },
    { id = "g_inn", text = "Come in, come in, an' pull up a bench! There's ale, there's stew, an' there's a fire hot enough tae thaw a gryphon." },
    { id = "g_home", when = { homeInn = { "Aerie Peak", "Wildhammer Keep" } }, text = "Home again! Yer bed's warm an' yer mug's full. What more could a body want?" },
    { id = "g_away", when = { away = 14 }, text = "Back after {away} away! Pull up yer bench, for the stew's been on since ye left, near enough, an' it's only got better." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The whole common room's been toastin' ye for what ye did for the Peak. Yer first mug's poured already, so drink up." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word round the tables is somebody caught ye spinnin' a tale. I'll still pour for ye, but keep yer stories tae the ones about trolls." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! Now ye're drinkin' like a Wildhammer, but don't go near the gryphons like that." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Ye look like ye've been dead a wee while, so sit down; ale fixes most things, an' stew fixes the rest." },
  },

  start = "hello",
  nodes = {
    dd_sharpbeak = {
      lines = { { id = "dd_sharpbeak_default", text = "Because a Wildhammer an' his gryphon are bound closer than brothers, an' every rider here's lost a bird or feared it. When the trolls took young Sharpbeak, the whole Peak felt it in their bellies, an' ye gave them a reason tae smile again." } },
      choices = {
        { text = "Any creature that loyal deserves rescuing. I'd do it again.", next = "BACK", reply = "Spoken like a Wildhammer, whatever ye were born. The riders'll no' forget it, an' neither will I.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "It was a job, and the Peak paid well for it.", next = "BACK", reply = "Aye, well, keep that last bit tae yerself in here, or ye'll be drinkin' alone. The birds dinnae care, but the riders do.", fx = { align = { light = -1 } } },
        { text = "Something else, Thulfram.", next = "BACK" },
      },
    },

    xpt_table = {
      big = true,
      lines = { { id = "xpt_table_default", text = "Fewer than I'd like and more than the trolls would like, because the road from Hillsbrad runs through Vilebranch country and they don't let a lone traveller pass easily. Those who come in company tend to arrive, and those who come alone tend to arrive late or not at all." } },
      choices = {
        { text = "We look out for each other. That's how we made it.", next = "BACK", reply = "Aye, an' that's the only way through Vilebranch country. The ones who come up that road in twos an' threes are the ones I see again.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A clever traveller goes alone and goes unseen.", next = "BACK", reply = "Alone an' unseen, an' I've buried a few who tried. Mind the road.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Welcome ye? They'll smother ye, for half this keep thinks Ironforge went deaf when it went underground, an' here's one o' ye provin' it didnae. Mind, ye'll hear some teasin' about Bronzebeard tunnels an' Bronzebeard beards, but it's the friendly sort, an' it ends wi' a round." } },
      choices = {
        { text = "Ironforge's ways have their worth. I'll defend them gladly.", next = "BACK", reply = "Aye, they have, an' ye'll find the old riders respect a dwarf who stands for his own. Drink up.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They're right. Ironforge forgot the sky, and I'm glad I didn't.", next = "BACK", reply = "Ha! Ye'll fit right in, then. Grab a stool an' I'll pour ye one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "In their own way, aye. They don't have the Moon or yer Circle, but they speak tae the winds an' the earth, an' they'd never cut down a tree without a word of thanks. Ironforge thinks it's all superstition, mind." } },
      choices = {
        { text = "Ironforge is wrong. The Wildhammer have the right of it.", next = "BACK", reply = "That's what they'd say, aye, an' they'd buy ye a round for it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Each people honours the land in their own way.", next = "BACK", reply = "That's a druid's answer if ever I heard one. The Wildhammer would agree, mostly.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every one o' them, an' they tell the fight three times, each bigger than the last. By the third tellin', a single Witherbark scout has become a whole war party, an' I pour the next round anyway, because they've earned the tale." } },
      choices = {
        { text = "A true warrior tells it straight. There's no need to boast.", next = "BACK", reply = "Straight it is, then, an' I'll pour ye a quiet one. The riders could learn from ye.", fx = { align = { honor = 1 } } },
        { text = "A good tale's worth stretching. Pour another.", next = "BACK", reply = "That's the Wildhammer way! Pour another an' tell me yer best one.", fx = { align = { honor = -1 } } },
        { text = "Something else, Thulfram.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the owls are gettin' bolder an' the wolves hungrier, an' that somethin' big's been crashin' about near the Overlook Cliffs. Half the riders think it's a troll an' half think it's a beast, an' nobody's been brave enough tae land an' settle it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That the owls are gettin' bolder an' somethin' big's been crashin' about near the Overlook Cliffs. An' that's {pet}, is it? It can have the scraps from the kitchen, for the gryphons won't share." },
      },
      choices = {
        { text = "I'll go and settle it. Rumours do nobody any good.", next = "BACK", reply = "Settle it, aye, an' come back wi' the story. I'll want every word o' it for the bar.", fx = { align = { order = 1 } } },
        { text = "Let the mystery be. Not every beast needs hunting.", next = "BACK", reply = "Aye, maybe so. Half my regulars would be heartbroken if somebody came back an' said it was only a big owl.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The sky, mostly, an' their birds, an' whoever's listenin' when the wind turns bad. Ye'll hear a fair few call on the Light too once they've had a drink, for there's no' a Wildhammer alive who'd turn down help over Jintha'Alor." } },
      choices = {
        { text = "A prayer said over ale still counts. The Light hears it.", next = "BACK", reply = "It does, aye, an' I've heard the Light answer a rider or two. Pour ye one?", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers that come with the third ale aren't worth much.", next = "BACK", reply = "Maybe no', but they're honest. I've heard riders at this bar pray for their dead wi' a mug in their hand, an' I'd no' tell them it didnae count.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Well enough, though they think better o' anyone who'll climb on a gryphon. A paladin's a grand thing in a shield wall, but up here the fight's in the air an' in the trees, so the riders reckon ye by whether ye can keep up." } },
      choices = {
        { text = "Then I'll learn the Wildhammer way. Customs can bend.", next = "BACK", reply = "Then ye'll be welcome at every table in the Peak, an' a few beds besides.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I fight as my order taught me, on my own two feet.", next = "BACK", reply = "Grand, an' ye'll find the riders respect that, even if they tease ye for it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_table", tags = { "news" }, when = { party = { size = { min = 2 } }, faction = "Alliance" },
          text = "A table for {companion} and the rest of you, then, and mind the gryphon feathers in your ale, because there's no keeping them out of anything up here." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Well, would ye look at that, a shaman from under the mountain! Sit by the fire, {class}, for the Wildhammer'll want tae buy ye a drink an' hear how Ironforge finally learned tae listen." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Sit by the fire, {class}, an' if a rider stumbles in bleedin', as they sometimes do, ye'll forgive me for lookin' yer way first." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, under my roof! Mind the beams wi' that hammer, {class}, for the last one o' yer order who stayed here took a chunk out o' the rafters, an' the riders still toast it." },
        { id = "h_default", key = true,
          text = "Innkeeper Thulfram, at yer service. Gryphon riders, hunters, wanderers: they all end up at my bar. Stay as long as ye like." },
        { id = "h_tale", when = { metBefore = true }, text = "A rider came in last night swearin' his gryphon talked tae him, though he'd had three ales first. Still, I've no' heard a better story all week." },
        { id = "h_mountaineer", when = { origin = "dwarf_mountaineer" },
          text = "A Dun Morogh mountaineer, at the Peak! Our riders hunt the same trolls from the air that ye hunted on foot in the passes, so ye'll find plenty tae argue about wi' them over an ale, an' they'll tell ye the gryphon's the better way." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The gryphons settle late, an' ye can hear 'em croonin' in the aviary if the fire's low. It's the best sound in the Hinterlands." },
        { id = "h_xkin", when = { origin = "dwarf_wildhammer_kin" },
          text = "Yer Aerie Peak kin have drunk at this very bar, I'd wager, by the look o' ye. Sit by the fire, an' if anyone from Ironforge gives ye grief about yer kin, send them to me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye've brought somethin' in wi' ye that doesnae cast its shadow right, {class}. Keep it off my tables an' away from the riders' ale, an' ye can stay." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Could ye warm the hearth a wee bit? I'm jokin', mostly, {class}, for I've no wish tae see my fire turn blue." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I count my mugs every night, {class}, an' I'll be countin' 'em twice tonight, no offence meant. Sit by the fire where I can see ye, an' we'll get on fine." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Set yer hammer by the door an' yer backside by the fire, for there's no a troll in the Hinterlands that'll find ye here." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, an' ye've brought the forest in on yer boots. Sit, an' tell me what's movin' out there, for the riders only see the trees from above." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid of the kaldorei! The Wildhammer have shamans o' their own, an' they'll be wantin' tae talk wi' ye, I'd wager." },
        { id = "h_dd_sharpbeak", tags = { "news" }, when = { questDone = TODO_QUEST("Saving Sharpbeak") },
          text = "Every rider in the Peak's been raisin' a mug tae whoever brought Sharpbeak home, an' Talonaxe says that's you. Sit down, then, an' let them look at ye properly." },
        { id = "h_dd_necklace", when = { questDone = TODO_QUEST("Troll Necklace Bounty") },
          text = "Fraggar's been showin' off a string o' troll necklaces at my bar an' tellin' everyone where they came from. He's tellin' it as if he'd done it himself, mind, so ye might want tae set him straight." },
      },
      again = { { id = "h_again", text = "Anythin' else? Yer mug's no' empty yet." } },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Your riders seem to have plenty to talk about.", next = "riders" },
        { text = "What's the strongest thing you pour?", next = "strong" },
        { text = "Will you serve a warlock under your roof, innkeeper?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'd guess few spellcasters come through Aerie Peak.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you hear much worth knowing behind that bar?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do the riders pray to before they fly, Thulfram?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the Wildhammer think well of paladins, innkeeper?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The Wildhammer warriors must drink here after a fight.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do the riders say about the Hinterlands forests?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Wildhammer revere the wild as my people do?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Will the Wildhammer really welcome an Ironforge shaman, Thulfram?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'd guess few travellers make it up to the Peak.", next = "xpt_table", when = { party = { size = { min = 2 } }, faction = "Alliance" } },
        { text = "A mug, please.", next = "END", fx = { affinity = 1 } },
        { text = "Why does Sharpbeak matter so much to the riders, Thulfram?", next = "dd_sharpbeak", when = { questDone = TODO_QUEST("Saving Sharpbeak") } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Everythin', an' I keep it tae myself, so the riders keep drinkin' here. Every flight comes back wi' a tale o' Jintha'Alor or the elves at Quel'Danil, an' a canny listener could learn the whole Hinterlands from that stool." } },
      choices = {
        { text = "What's said at your bar stays there. Good.", next = "BACK", reply = "Aye, it does, an' always will. That's why the riders trust me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Secrets like that are worth selling, innkeeper.", next = "BACK", reply = "They are, an' I'd lose every customer I have. Mine stay unsold.", fx = { align = { honor = -1 } } },
        { text = "Pour me something and let's change the subject.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No many, for the Wildhammer trust storms more than spellbooks. The odd one comes over from Dalaran's side o' the mountains, but they've been fewer since the city shut itself away behind its dome, an' it's only now openin' again, an' they all complain about the stairs." } },
      choices = {
        { text = "The Kirin Tor were right to seal Dalaran away.", next = "BACK", reply = "Maybe they were, an' maybe the riders would argue wi' ye. Drink up an' let 'em.", fx = { align = { order = 1 } } },
        { text = "Hiding under a dome while Lordaeron burned was shameful.", next = "BACK", reply = "Aye, the riders say the same, an' loudly. Ye'll find friends at this bar.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about something warmer.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'll serve anyone who pays an' doesnae set the place alight. But the riders flew against the Horde's warlocks in the Second War, an' some still drink tae friends that fire took, so I'd keep yer craft quiet at the bar." } },
      choices = {
        { text = "I'll keep quiet. Their grief deserves respect.", next = "BACK", reply = "Thank ye. They'll no' say it, but they'll notice.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Old grief shouldn't stop me using what works.", next = "BACK", reply = "Maybe no', but ye'll keep it out o' my inn all the same.", fx = { align = { light = -1 } } },
        { text = "Fair enough. Let's talk of other things.", next = "BACK" },
      },
    },
    riders = {
      lines = { { id = "r_default", text = "Trolls, gryphons, an' whose gryphon's best. That last one's ended three friendships an' started two weddings." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strong = {
      lines = { { id = "s_default", text = "Nothin' I pour. If ye want strong, ye want Rhapsody's camp out east, an' ye want a friend tae carry ye home." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everythin' worth knowin' in Aerie Peak gets said at my bar sooner or later! Ask, an' I'll tell ye what I've heard." },
    },
    background = { { id = "tp_ba", text = "I've poured for this keep longer than some o' the gryphons have been alive. They don't drink, but they listen." } },
    advice = { { id = "tp_ad", text = "Eat before ye drink, an' drink before ye fly, an' never the other way round." } },
    wildhammer = { { id = "tp_wildhammer", text = "Every Wildhammer ends up at my bar, sooner or later, an' every one o' them tells me their gryphon's the best. I agree wi' every one o' them, an' I pour." } },
    magni = { { id = "tp_magni", text = "The Bronzebeards send their ambassadors now an' then, an' they drink our ale an' complain about the weather. Magni himself has never come, but I'd pour fer him if he did." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay rum comes up on the gryphons sometimes, an' it's no' bad, though it's no' Wildhammer stout. The riders love it, an' I keep a barrel fer them." } },
    _none = { { id = "tp_none", text = "No idea! Ask the Thane, an' he'll tell ye, loud." } },
  },
}
