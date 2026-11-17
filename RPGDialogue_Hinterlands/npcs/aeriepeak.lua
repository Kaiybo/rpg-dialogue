-- Aerie Peak: the Wildhammer stronghold in the Hinterlands. Voice: bibles/hinterlands.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "falstad", id = TODO_NPC("Falstad Wildhammer"), name = "Falstad Wildhammer",
  bible = "bibles/hinterlands.md", role = "noble", tier = "major",
  communities = { "aerie_peak" }, temper = { "boisterous" }, values = { "proud", "brave", "loyal" },
  notices = { "race", "class" },

  impression = {
    first = "Falstad Wildhammer greets visitors like long-lost kin and talks of trolls the way other people talk of weather to be got through. A Wildhammer and his gryphon, he says, are one creature.",
    third = "{name} met Falstad Wildhammer, High Thane of the Wildhammer clan, at Aerie Peak.",
  },

  greetings = {
    { id = "g_keep", text = "Ha! A visitor tae Wildhammer Keep! Come in, come in, an' tell me ye're here tae fight trolls!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, good! I like a face that keeps comin' back, for it means the trolls didnae get it." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf o' Ironforge, here among the Wildhammer! The mountain's fine, {g:lad|lass}, but ye've no seen anythin' till ye've seen it from a gryphon's back." },
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "SHAMAN" } },
      text = "Ye've the look o' someone who knows beasts, so the gryphons'll like ye, probably." },
  },

  start = "hello",
  nodes = {
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A place, aye, though no' the same one Ironforge gives it. We pray tae the sky an' the storm an' the spirits o' the peaks, but I've seen a priest pull a rider back from the edge o' death, an' I'll no' scoff at that." } },
      choices = {
        { text = "Spirits or Light, whatever heals your riders is holy enough.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Light is the one truth, Thane, whatever your clan believes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Jintha'Alor, where the Vilebranch keep their altars an' their cages, an' where they spill blood every night tae gods I'll no' name. If yer Light can burn that stain off the hill, ye'll have the thanks o' every Wildhammer alive." } },
      choices = {
        { text = "I'll free their captives first, then deal with the altars.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Burn the whole hill. Mercy is wasted on the Vilebranch.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest o' the Light, at Aerie Peak! We Wildhammer mostly keep tae the old spirits, as Fraggar'll tell ye, but I'll take any blessin' that sends a troll back intae the ground." },
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
        { id = "h_xkin", when = { origin = "dwarf_wildhammer_kin" },
          text = "Ha! There's Aerie Peak in yer face, for all ye were raised under a mountain. Kin's kin, an' the eyrie's open to ye any time ye like." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye've a smell about ye like a forge put out wi' the wrong water, {class}, an' I'd wager Fraggar's spirits are hidin' under his bed right now." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A spellcaster at Aerie Peak! Mind ye keep yer fire off the gryphons, {class}, for they've long memories an' sharper beaks." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ha, a quiet one! Ye walked in so soft the gryphons never squawked, an' that's a rarer trick than ye'd think in Wildhammer Keep." },
      },
      again = {
        { id = "h_again", text = "What else? Out wi' it, for I've trolls tae think about!" },
        { id = "h_again2", text = "Ha! More questions, an' I like a curious one, so go on." },
      },
      choices = {
        { text = "Tell me about the gryphon riders.", next = "gryphons" },
        { text = "Who are these trolls?", next = "trolls" },
        { text = "Are the Wildhammer part of the Alliance?", next = "alliance" },
        { text = "Who are your allies out here?", next = "allies" },
        { text = "Ironforge sends its regards.", next = "bronzebeard", when = { race = "Dwarf" } },
        { text = "My people glide on the wind.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Do the Wildhammer count me a friend yet?", next = "friend", when = { townStanding = { town = "aerie_peak", min = 30 } } },
        { text = "My beast and I could fly with your riders.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Point me at the trolls, thane.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "The Hinterlands' forests are sick. I can feel it.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Could a gnome ride one of your gryphons?", next = "xgnome", when = { race = "Gnome" } },
        { text = "Will Aerie Peak suffer a warlock who fights the trolls?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could the arcane help you against the trolls, Thane?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the Wildhammer have any use for someone who works unseen?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the Wildhammer have any place for the Light, Thane?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Where would a paladin's hammer do the most good, Thane?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'm here to fight trolls.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { aerie_peak = 1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Use? The Vilebranch keep their prisoners caged up at Jintha'Alor, an' a gryphon cannae land quiet on a troll temple, so a pair o' soft feet might do what a dozen hammers cannae. I'll no ask who taught ye, mind, for the Wildhammer like their enemies tae see us comin'." } },
      choices = {
        { text = "A blade in the dark saves lives. Honor doesn't.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "When it counts, I'd still face them openly, Thane.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Any fire that lands on the Vilebranch is welcome fire, {class}. But it was Dark Iron sorcery that poisoned Grim Batol for my people long ago, so ye'll forgive a Wildhammer for keepin' one eye on yer hands." } },
      choices = {
        { text = "You're right to be wary. Power needs a firm hand.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear of magic only holds a people back, Thane.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's leave the sorcery there.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'll suffer anyone who fights the Vilebranch, for they cut hearts out on their altars an' I've no room tae be choosy. But the Horde's warlocks burned these hills in the Second War, an' I flew against 'em, so keep yer wee beasties close an' off my landin'." } },
      choices = {
        { text = "I'll keep my demons leashed. Watch me if you like.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fire is fire. I'll burn the trolls however I please.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Enough about demons. Something else.", next = "BACK" },
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
        { text = "Which are the worst?", next = "trolls_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls_worst = {
      lines = { { id = "tw_default", text = "The Vilebranch, with blood on their altars an' cages full o' things they've no right tae. Fraggar can tell ye more, if ye can stand tae hear it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alliance = {
      big = true,
      lines = { { id = "a_default", text = "We fought for it an' bled for it, then came home an' decided we'd rather answer tae our own sky. We're friends tae any who prove themselves, so prove yerself." } },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "The Alliance needs every hammer it can get.", next = "BACK", fx = { affinity = -1, align = { order = 2 } } },
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
        { text = "Fair enough, Thane.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xhu_default", text = "Fly wi' us? Ye'd need a gryphon, an' a gryphon chooses its rider, not the other way round. But a hunter who knows a beast's mind is halfway to bein' a Wildhammer, so go an' sit wi' the birds a while an' see if one takes to ye." } },
      choices = {
        { text = "And if none of them does?", next = "gryphons" },
        { text = "My beast is enough for me.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xwarrior = {
      big = true,
      lines = { { id = "xwa_default", text = "That's the spirit! The Vilebranch are at Jintha'Alor an' the Witherbark at Shadra'Alor, an' the Revantusk sit at the coast wi' the Horde. Hit the first two as hard as ye like; the third I'm still makin' my mind up about." } },
      choices = {
        { text = "A troll's a troll. They'll all fall.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll leave the Revantusk to you, then.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Why not the Revantusk?", next = "trolls" },
      },
    },
    xdruid = {
      lines = { { id = "xdr_default", text = "Ye can, can ye? So can we, in our own way; a Wildhammer knows when the wind's wrong an' the trees have gone quiet. It's the Vilebranch an' their altars, an' whatever they're feedin' wi' all that blood." } },
      choices = {
        { text = "Then I'll help heal it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Ask Fraggar. He listens too.", next = "allies" },
      },
    },
    xgnome = {
      lines = { { id = "xgn_default", text = "Could ye! A gryphon could carry three o' ye an' a picnic. The trouble's no' the weight; it's keepin' ye from tryin' to fit the bird wi' an engine, an' I've heard about gnomes an' engines." } },
      choices = {
        { text = "An engine would be an improvement.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
        { text = "No engines. Just the bird.", next = "BACK", fx = { affinity = 2 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every rider in Aerie Peak reports tae me, an' half o' them exaggerate, so I've learned a great deal! Ask away." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "Ask me anythin' ye like! Ye've earned the riders' respect, an' that means ye've earned mine." },
    },
    background = { { id = "tp_ba", text = "Wildhammer born, gryphon raised, an' Thane by right o' bein' the loudest! The Second War made a rider o' me, an' the Hinterlands made a Thane.", next = "gryphons" } },
    advice = { { id = "tp_ad", text = "Never fight a troll on its own ground; fight it from above, for everythin' is easier from above." } },
    dark_iron = { { id = "tp_dark_iron", text = "Dark Irons! Don't get me started, or we'll be here till the sun's down an' up again." } },
    _none = { { id = "tp_none", text = "Never heard o' it! Is it a troll, now? Then I'll hear of it soon enough." } },
  },
}

P:NPC {
  key = "talonaxe", id = TODO_NPC("Gryphon Master Talonaxe"), name = "Gryphon Master Talonaxe",
  bible = "bibles/hinterlands.md", role = "questgiver", tier = "quest",
  communities = { "aerie_peak" }, temper = { "gruff" }, values = { "loyal", "practical" },
  notices = { "class" },

  impression = {
    first = "Gryphon Master Talonaxe would plainly rather be in the air than talking to me. He keeps the aeries safe from the trolls, and I don't think he's ever lost an argument with one.",
    third = "{name} met Gryphon Master Talonaxe, who keeps the aviary at Aerie Peak safe from the forest trolls.",
  },

  greetings = {
    { id = "g_aviary", text = "Aye, what is it? I'd rather be up in the air than down here talkin', but the gryphons won't take orders from the ground, so somebody has tae." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, eh? Keep yer pet away from the gryphons, or they'll eat it an' then look at ye for more." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Aye, for every night they come tae steal eggs or kill the young. The Vilebranch an' the Witherbark think the Hinterlands are theirs, an' we think they're ours, an' the gryphons just want tae be left alone." } },
      choices = {
        { text = "Drive them out. The gryphons deserve safe aeries.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Guard the aeries, but leave the trolls their hills.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Somethin' else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A rider who listens tae the bird before he listens tae his own temper. I've seen warriors try tae steer a gryphon intae a fight like a cart horse, an' the bird threw 'em off at the Vilebranch walls an' flew home wi'out 'em." } },
      choices = {
        { text = "Then I'll follow your rules, Gryphon Master, to the letter.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Gryphon or not, I'll fight where I choose.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Talonaxe.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Too often, an' the worst o' it isnae the spears. The Vilebranch daub their arrows wi' somethin' foul from their altars, an' a bird struck wi' one sickens for days, so I sit up wi' them an' do what I can, which isnae much." } },
      choices = {
        { text = "Then I'll pray over them. Beasts deserve the Light's mercy too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A gryphon's a beast. Save your prayers for the riders.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, is it? Say a word for the birds while ye're here, {class}, for every gryphon that flies over Jintha'Alor comes back wi' somethin' I'd rather no' see." },
        { id = "h_default", key = true,
          text = "Gryphon Master Talonaxe. I keep the aviary, an' the trolls keep tryin' tae get at the aeries, an' I keep stoppin' 'em." },
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
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid! The gryphons are wary of ye, I can tell, but they'll settle once they know ye're no threat tae the aeries." },
      },
      again = { { id = "h_again", text = "What? Quick, they're wantin' fed." } },
      choices = {
        { text = "Who's Sharpbeak?", next = "sharpbeak" },
        { text = "Why do the trolls want the gryphons?", next = "trolls" },
        { text = "You'd rather be flying?", next = "flying" },
        { text = "What's Rhapsody brewing?", next = "rhapsody" },
        { text = "My pet won't bother your birds.", next = "pet", when = { class = "HUNTER" } },
        { text = "My people ride hippogryphs. Are they so different?", next = "xnightelf", when = { race = "NightElf" } },
        { text = "Couldn't a mage simply teleport, instead of flying?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have the trolls ever crept into your aviary?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the gryphons ever come back hurt from the troll lands?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would it take for you to trust a warrior with a gryphon?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Should the trolls be driven from the aeries for good?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Twice, an' near as quiet as ye. A Witherbark scout got all the way up tae the nests one night before the birds woke an' took him apart, so now I sleep up here wi' them an' I trust nothin' that walks soft." } },
      choices = {
        { text = "Your distrust keeps the birds alive. I'd do the same.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Walking soft is no crime, gryphon master.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Aye, tae yer own city an' nowhere else, an' ye arrive wi' yer stomach left behind. A gryphon'll take ye tae any aerie I name, an' a rider earns the sky every time he climbs on, which is more than any spell can say." } },
      choices = {
        { text = "Earned things matter more than easy ones.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Easier is better. I'll take the spell, thank you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Fair. Another question, then.", next = "BACK" },
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
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "DRUID" } },
      text = "Ye hear the spirits too. Then ye'll know what I mean when I say the trolls' altars make 'em weep." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It cares what the warrior does when he gets where he's goin'. The Vilebranch shed blood on their altars an' the land weeps for it, an' a warrior who sheds blood tae stop them might be forgiven, so long as he doesnae grow tae like it." } },
      choices = {
        { text = "I'd fight only to stop the blood rites, nothing more.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Blood is blood. I'll shed what I must and not count it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Fraggar.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I hear the owls an' the wolves, an' lately I hear them go quiet near Jintha'Alor, which troubles me. The beasts know when the land's sick, an' they flee the sickness long before we see it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet}, is it? A fine name, an' it suits the breath I hear. Keep it close in the forest, for the Vilebranch would take a hunter's beast for their altars as soon as the hunter." },
      },
      choices = {
        { text = "The land is sick. Jintha'Alor must be cleansed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Beasts flee from anything. It means nothing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Maybe, if neither one tries tae own the other. The Light mends what's broken in a body an' the spirits mend what's broken in the land, an' the Vilebranch have broken a great deal o' both up at their altars." } },
      choices = {
        { text = "Each to its own work. Neither should rule the other.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Light answers to no spirit. It stands above them all.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "Ye carry the Light about ye, {class}, warm as a hearthstone. The spirits dinnae mind it, for it's an honest sort o' power, an' it's no' the Light they fear in these hills." },
        { id = "h_default", key = true,
          text = "Fraggar Thundermantle, an' I speak for the spirits o' this land. The Vilebranch spill blood on their altars an' call it worship, but the land remembers every drop." },
        { id = "h_necklace", tags = { "news" }, when = { questActive = TODO_QUEST("Troll Necklace Bounty") },
          text = "Bring me the trolls' necklaces, for each one's a charm against the spirits I serve, an' each one I take is a little less o' their dark work." },
        { id = "h_skulk", when = { questActive = TODO_QUEST("Skulk Rock Clean-up") },
          text = "Skulk Rock is fouled. Clean it, an' the spirits there can rest again." },
        { id = "h_eyes", when = { metBefore = true }, text = "My eyes grow dimmer each winter, an' the spirits grow louder tae make up for it. I think they're bein' kind." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear the wind on the peak? That's no' only wind, for the old spirits walk the ridges after dark." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "Ye carry the arcane like a cold draught, {class}, an' the spirits shiver when ye pass. They've no love for it, though they'll forgive ye if ye mind yer manners." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "There's someone standin' on my blind side, an' the wind says they mean tae stay there. Speak up, {class}, an' let an old dwarf hear ye." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Ye stand heavy, like a dwarf in full mail, though I cannae see if ye are one. The land feels a warrior's step, an' it's no always glad of it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I can hear yer beast breathin' beside ye, an' it's calmer than most, which tells me ye treat it well." },
      },
      again = { { id = "h_again", text = "Aye? I'm listenin', as I'm always listenin'." } },
      choices = {
        { text = "What do the spirits say?", next = "spirits" },
        { text = "Your eyes?", next = "eyes" },
        { text = "What happens at the altars?", next = "altars" },
        { text = "An Ironforge dwarf who hears the elements. What do you make of me?", next = "dwarfshaman", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "I hear them too.", next = "hear", when = { class = { "SHAMAN", "DRUID" } } },
        { text = "Why do the spirits dislike the arcane?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How did you know I was there, Fraggar?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can the Light and your spirits work together, Fraggar?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does the land care if a warrior walks on it, Fraggar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can you hear the beasts of the Hinterlands, Fraggar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll help the spirits.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Your spirits flinch when I come near, old man.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "The spirits can fend for themselves, old man.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "My eyes are failin', but the land isnae, an' it tells me who walks on it. Ye step light, like the Witherbark scouts do, so take care in the forest, for the trolls listen tae the ground the same way I do." } },
      choices = {
        { text = "Respect the land and it keeps your secrets. I'll remember.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The land's secrets are mine to use, old man.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because it takes an' doesnae ask, the same as the Vilebranch blood rites, though cleaner. A Wildhammer asks the storm before he rides it, an' a mage grabs the lightnin' by the tail an' hopes for the best." } },
      choices = {
        { text = "Asking first is wiser. I'll keep that in mind.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power answers to whoever is strong enough to take it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll leave the spirits be. Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = { { id = "s_default", text = "That they're tired, an' that they've been bled for a long time, an' they'd like it tae stop. It's nothin' clever, for the old ones rarely say anythin' clever." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eyes = {
      lines = { { id = "e_default", text = "Goin', slowly. I can tell a friend from a troll by the walk, an' a liar by the breath. That's all a shaman truly needs tae see." } },
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
        { text = "Then the altars must fall.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "If something answers them, maybe it's worth hearing out.", next = "BACK", fx = { align = { light = -2 } } },
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
        { text = "I'll keep it bound while I'm here.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The land will have to bear it.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The spirits speak, an' I listen, an' now an' then they tell me somethin' worth passin' on. Ask, an' I'll tell ye what I can." },
    },
    background = { { id = "tp_ba", text = "Wildhammer, shaman an' listener; the spirits found me young, an' they've no' let go since." } },
    advice = { { id = "tp_ad", text = "When the wind goes quiet in the Hinterlands, listen harder, for somethin's holdin' its breath." } },
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
    { id = "g_inn", text = "Come in, come in, an' pull up a bench! There's ale, there's stew, an' there's a fire hot enough tae thaw a gryphon." },
    { id = "g_home", when = { homeInn = { "Aerie Peak", "Wildhammer Keep" } }, text = "Home again! Yer bed's warm an' yer mug's full. What more could a body want?" },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! Now ye're drinkin' like a Wildhammer, but don't go near the gryphons like that." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Ye look like ye've been dead a wee while, so sit down; ale fixes most things, an' stew fixes the rest." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "In their own way, aye. They don't have the Moon or yer Circle, but they speak tae the winds an' the earth, an' they'd never cut down a tree without a word of thanks. Ironforge thinks it's all superstition, mind." } },
      choices = {
        { text = "Ironforge is wrong. The Wildhammer have the right of it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Each people honors the land in their own way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Somethin' else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every one o' them, an' they tell the fight three times, each bigger than the last. By the third tellin', a single Witherbark scout has become a whole war party, an' I pour the next round anyway, because they've earned the tale." } },
      choices = {
        { text = "A true warrior tells it straight. No need to boast.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good tale's worth stretching. Pour another.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Thulfram.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the owls are gettin' bolder an' the wolves hungrier, an' that somethin' big's been crashin' about near the Overlook Cliffs. Half the riders think it's a troll an' half think it's a beast, an' nobody's been brave enough tae land an' settle it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That's {pet}, is it? It can have the scraps from the kitchen, for the gryphons won't share an' the cat's too fat already." },
      },
      choices = {
        { text = "I'll go and settle it. Rumours do nobody any good.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the mystery be. Not every beast needs hunting.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The sky, mostly, an' their birds, an' whoever's listenin' when the wind turns bad. Ye'll hear a fair few call on the Light too once they've had a drink, for there's no' a Wildhammer alive who'd turn down help over Jintha'Alor." } },
      choices = {
        { text = "A prayer said over ale still counts. The Light hears it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers that come with the third ale aren't worth much.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Well enough, though they think better o' anyone who'll climb on a gryphon. A paladin's a grand thing in a shield wall, but up here the fight's in the air an' in the trees, so the riders reckon ye by whether ye can keep up." } },
      choices = {
        { text = "Then I'll learn the Wildhammer way. Customs can bend.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I fight as my order taught me, on my own two feet.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Sit by the fire, {class}, an' if a rider stumbles in bleedin', as they sometimes do, ye'll forgive me for lookin' yer way first." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, under my roof! Mind the beams wi' that hammer, {class}, for the last one o' yer order who stayed here took a chunk out o' the rafters, an' the riders still toast it." },
        { id = "h_default", key = true,
          text = "Innkeeper Thulfram, at yer service. Gryphon riders, hunters, wanderers: they all end up at my bar. Stay as long as ye like." },
        { id = "h_tale", when = { metBefore = true }, text = "A rider came in last night swearin' his gryphon talked tae him, though he'd had three ales first. Still, I've no' heard a better story all week." },
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
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the kaldorei! The Wildhammer have shamans o' their own, an' they'll be wantin' tae talk wi' ye, I'd wager." },
      },
      again = { { id = "h_again", text = "Anythin' else? Yer mug's no' empty yet." } },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "What do the riders talk about?", next = "riders" },
        { text = "What's the strongest thing you pour?", next = "strong" },
        { text = "Will you serve a warlock under your roof, innkeeper?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do many spellcasters come through Aerie Peak?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you hear much worth knowing behind that bar?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do the riders pray to before they fly, Thulfram?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the Wildhammer think well of paladins, innkeeper?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the Wildhammer warriors drink here after a fight?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do the riders say about the Hinterlands forests?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Wildhammer revere the wild as my people do?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "A mug, please.", next = "END", fx = { affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Everythin', an' I keep it tae myself, which is why the riders still drink here. Every flight comes back wi' a tale o' Jintha'Alor or the elves at Quel'Danil, an' a canny listener could learn the whole Hinterlands from that stool." } },
      choices = {
        { text = "What's said at your bar stays there. Good.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Secrets like that are worth selling, innkeeper.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Pour me something and let's change the subject.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No many, for the Wildhammer trust storms more than spellbooks. The odd one comes over from Dalaran's side o' the mountains, but they've been fewer since the city shut itself away behind its dome, an' they all complain about the stairs." } },
      choices = {
        { text = "The Kirin Tor were right to seal Dalaran away.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hiding behind a dome while Lordaeron burned was shameful.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about something warmer.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'll serve anyone who pays an' doesnae set the place alight. But the riders flew against the Horde's warlocks in the Second War, an' some still drink tae friends that fire took, so I'd keep yer craft quiet at the bar." } },
      choices = {
        { text = "I'll keep quiet. Their grief deserves respect.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Old grief shouldn't stop me using what works.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Fair. Let's talk of other things.", next = "BACK" },
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
    _none = { { id = "tp_none", text = "No idea! Ask the Thane, an' he'll tell ye, loud." } },
  },
}
