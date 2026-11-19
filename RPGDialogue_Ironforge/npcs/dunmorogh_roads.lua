-- Dun Morogh between the towns: Amberstill Ranch, Steelgrill's Depot, the high snows.
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rudra_amberstill", id = TODO_NPC("Rudra Amberstill"), name = "Rudra Amberstill",
  bible = "bibles/dunmorogh_roads.md", role = "farmer", tier = "quest",
  communities = { "dunmorogh" }, temper = { "gruff" }, values = { "practical" },
  notices = { "class", "lock_shadow" },

  impression = {
    first = "She counts her herd twice a day since the yeti came down.",
    third = "{name} met Rudra Amberstill, who runs the Amberstill Ranch and has a yeti problem.",
  },

  greetings = {
    { id = "g_ranch", text = "Mind the gate, and mind the dung while ye're at it. This is a workin' ranch, no' a sightseein' one." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The rams remember ye, an' they dinnae bother remembering most travellers." },
  },

  notice = {
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The rams have all bunched up against the far fence, an' they only do that for wolves an' blizzards. I've no' smelled sulphur since the blacksmith's fire went wrong, so I'll ask ye tae stand downwind while we talk." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If it knows, it's keepin' quiet about it. My rams go uneasy before a raid, stampin' an' pressin' together, an' my granddad always said the beasts hear the mountain first. If ye can hear it too, sit up wi' me one night an' tell me what's out there." } },
      choices = {
        { text = "I'll sit up with you and keep watch, Rudra.", next = "BACK", reply = "Would ye? I'd be glad o' the company, an' the rams might settle wi' a stranger by the fire, for they've had naught but my grumblin' for a week.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Rams come and go. The mountain has bigger worries.", next = "BACK", reply = "Maybe it does, but the mountain's no' the one countin' heads at dawn an' comin' up one short, so ye'll forgive me if I worry about the rams.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Great broad prints in the snow, wider than my hand, an' a smell like wet fur an' old meat. My da would've said yeti, but whatever it is, it's hungry, an' it's lost its fear o' the ranch." } },
      choices = {
        { text = "Drive it back to the hills. It's only hungry.", next = "BACK", reply = "Aye, maybe, if it'll go, an' I'd rather that than a dead beast on my land, but it's had a taste o' ram now, an' that's a hard thing tae unlearn.", fx = { align = { honor = 1 } } },
        { text = "Kill it before it takes another ram.", next = "BACK", reply = "That's what my heart says, I'll admit, though my granddad would've said a starvin' beast's no' a wicked one, only an unlucky one.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Somethin' big from the high snows, an' Tundra MacGrann swears it's a yeti, though he swears a lot o' things. It comes at night, takes one ram an' leaves the rest screamin', an' I've a ranch tae run in the mornin'." } },
      choices = {
        { text = "I'll stand by the pen tonight, and every night it comes.", next = "BACK", reply = "Then I'll put the kettle on an' leave the lantern lit, an' if the beast comes, ye'll have the whole ranch cheerin' ye on from behind the fence.", fx = { align = { order = 1 } } },
        { text = "I'll go up into the snows and find its den.", next = "BACK", reply = "That's a bold plan, an' I'll no' stop ye, but take a coat an' a friend, because the high snows have swallowed braver dwarves than both of us.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, at night, an' the ram carried him halfway tae Kharanos before it threw him in a snowbank. If ye want tae help, track whatever's killin' my herd instead, for that's a quieter sort o' work that'd suit ye." } },
      choices = {
        { text = "I'll track the beast for you, Rudra. Your herd matters.", next = "BACK", reply = "That's a kinder offer than I expected, an' I'll take it, so go up past the ridge an' follow the tracks, an' mind they dinnae follow you back.", fx = { align = { honor = 1 } } },
        { text = "I'll track it, but a ram would make a fine payment.", next = "BACK", reply = "Ha, cheeky, an' I'll no' be givin' ye a ram for it, but track the beast an' I'll speak well o' ye in Kharanos, which is worth somethin'.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every ram on the ranch jumped the fence at once, an' I spent three days fetchin' them from the hills. I don't doubt yer magic's useful, but out here we do things slow an' steady, the way rams like it." } },
      choices = {
        { text = "Slow and steady it is, Rudra. I'll respect the ranch.", next = "BACK", reply = "Thank ye kindly, an' the rams thank ye too, though they'll still give ye a wary eye for a week or two out o' habit.", fx = { align = { order = 1 } } },
        { text = "Rams will get used to magic sooner or later.", next = "BACK", reply = "Maybe they will, but no' on my ranch an' no' this month, so keep yer sparks in yer pockets until the beast's dealt wi'.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Tired an' scared, the both o' them, for they've been sittin' up nights wi' lanterns since the beast came down, an' one o' the lads saw it take a ram right in front o' him. He's no' said much since, an' I don't know what tae say tae him." } },
      choices = {
        { text = "Let me sit with him a while. Fear like that needs company.", next = "BACK", reply = "Bless ye for it, an' the lad would like that, though he'll pretend he doesnae need it, bein' a dwarf an' fourteen.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He'll mend once the beast is dead. Words won't help.", next = "BACK", reply = "Maybe so. But he's only a lad, an' a kind word never killed anyone.", fx = { align = { light = -1 } } },
        { text = "Tell me about the rams instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A yeti, by the size o' the tracks, an' it comes at dusk when the herd's comin' in, so it knows what it's doin'. Vagash, the hunters call it, an' it's been killin' rams in these hills since before my da ran the ranch." } },
      choices = {
        { text = "Then I'll meet it at dusk, face to face, and end it.", next = "BACK", reply = "That's brave talk, an' I hope ye mean it, because Vagash doesnae wait for a fair fight, an' neither should ye if it comes tae that.", fx = { align = { honor = 1 } } },
        { text = "Bait it with a ram and take it from behind. Whatever works.", next = "BACK", reply = "Hmph, I'll no' be baitin' my rams for anybody, but if ye've a better plan for gettin' behind the brute, I'll hear it.", fx = { align = { honor = -1 } } },
        { text = "Something else, Rudra.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Scare them? One whiff o' brimstone an' they'd be over the fence an' halfway tae Gol'Bolar, an' I'd be countin' them till midnight. If ye want tae help, go up the mountain an' thin the yeti instead." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Scare them? Look at them, they've bunched up in the far corner o' the pen already, an' yer demon's no' even past the gate. One step closer an' they'd be over the fence an' halfway tae Gol'Bolar, so if ye want tae help, take it up the mountain an' thin the yeti instead." },
      },
      choices = {
        { text = "I'll keep it away and deal with the yeti.", next = "BACK", reply = "The rams thank ye too. If the beast's dealt wi', I might even forgive the brimstone smell when ye come back.", fx = { align = { order = 1 } } },
        { text = "Your rams can learn to live with it.", next = "BACK", reply = "They can learn it from yer side o' the fence, then, because I'll no' have my herd stampedin' over the hills for the sake o' yer creature.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I'll no' ask ye tae bless the rams, for they'd only try tae eat yer robes, but I'd take a kind word for the herdsmen." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now there's a sight, an' if ye've come tae put down whatever's eatin' my herd, I'll stand ye a ram ride tae Kharanos an' back." },
        { id = "h_default", key = true,
          text = "Rudra Amberstill, and these are the Amberstill rams, the finest mounts in Khaz Modan. Somethin' big's been comin' down from the hills to pick off my herd, and I've no' slept right in a week." },
        { id = "h_herd", when = { questActive = TODO_QUEST("Protecting the Herd") },
          text = "Vagash is up in the hills to the south, and every day he lives is another ram I lose. Go and put an end to him, {class}." },
        { id = "h_done", when = { questDone = TODO_QUEST("Protecting the Herd") },
          text = "There's the one who brought down Vagash! The rams are grazin' easy again, and so am I." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "If ye're thinkin' o' liftin' a ram, {g:lad|lass}, they bite, an' they bleat louder than any guard." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, an' I'll ask ye tae keep yer fire away from the rams. They've no' forgotten the last one who blinked in front o' them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! I've no' slept right in a week, but I'd sleep a deal better wi' an axe standin' by the pen." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, an' just when I need one. Somethin' big's comin' down from the hills for my rams, an' I wondered if yer kind could tell me what." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I'll ask ye tae keep whatever trails ye well back from the pens, for my rams are skittish enough since the yeti came down, an' I count them twice a day." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Wendigo", min = 20 } },
          text = "There's fewer o' those wendigo comin' down off the mountain since ye went up there, an' my rams have stopped starin' at the ridge. I only counted the herd once this mornin', an' that's thanks tae you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Can ye ask the hills what's been takin' my rams? For I've asked them myself, an' they never answer." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The feed won't spread itself." },
        { id = "h_again2", text = "Go on, ask. I can talk and fork hay at the same time." },
      },
      choices = {
        { text = "What's taking your rams?", next = "yeti" },
        { text = "Tell me about the rams themselves.", next = "rams" },
        { text = "How far is Kharanos from here?", next = "road" },
        { text = "A hunter could track your beast, Rudra.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Has anyone tried to steal your rams?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What happened when a mage blinked near your rams?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What's been coming down to take your rams, Rudra?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How are your herdsmen holding up, Rudra?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What's taking your rams, and when does it hunt?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What kind of tracks has the beast left near your rams?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would my little companion really scare your rams?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What's been taking your rams, Rudra? The earth might know.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day to you.", next = "END" },
      },
    },
    yeti = {
      lines = { { id = "y_default", text = "A yeti called Vagash, big as a cart and twice as mean. He comes down off the slopes at night, takes a ram, and leaves nothin' but wool on the snow." } },
      choices = {
        { text = "This sounds like work for the Mountaineers.", next = "yeti_mtn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yeti_mtn = {
      lines = { { id = "ym_default", text = "The Mountaineers have troggs at Gnomeregan and Frostmane at every pass, so a farmer's yeti comes last. I don't blame them, but I'll no' sit and watch my herd thin either." } },
      choices = {
        { text = "Then the farmers should look after themselves.", next = "yeti_end", fx = { align = { order = -1 } } },
        { text = "The Mountaineers should answer to every dwarf, farmer or not.", next = "yeti_end", fx = { align = { order = 1 } } },
        { text = "What would you have me do?", next = "yeti_end" },
      },
    },
    yeti_end = {
      lines = { { id = "ye_default", text = "Bring me proof he's dead and I'll call ye a friend o' this ranch. That's worth more in Dun Morogh than ye'd think." } },
      choices = { { text = "Something else, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    rams = {
      lines = { { id = "r_default", text = "Bred for the snow and the mountain paths, with hooves like anvils and tempers to match. Veron sells them to the folk who've earned one, and every one starts here." } },
      choices = {
        { text = "Who's Veron?", next = "rams_veron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rams_veron = {
      lines = { { id = "rv_default", text = "Veron Amberstill, my kin, and he does the sellin' while I do the raisin'. He's got the easier half of the work and he'll tell ye otherwise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    road = {
      lines = { { id = "rd_default", text = "West along the road, past the Thunderbrew distillery and the brewery's stink. Keep goin' east instead and ye'll reach the tunnel into Loch Modan." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Aye, ye've the look of one who reads tracks. His prints go south into the hills, wide as a shield, and ye'll no' miss them." } },
      choices = { { text = "Leave it with me.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer ride gryphons an' we ride rams, an' a ram's the better beast fer the snow. They'll tell ye otherwise, an' they're wrong." } },
    frostmane = { { id = "tp_frostmane", text = "The Frostmane come down from the hills an' take whatever's no' nailed down, an' my rams are no' nailed down. I count the herd twice a day an' I sleep wi' one ear open." } },
    magni = { { id = "tp_magni", text = "The King keeps a ram from my ranch, an' I'm prouder o' that than anythin' else I've done. He rides it badly, mind, but it's a fine ram." } },
    _none = { { id = "tp_none", text = "I raise rams, friend, and I know nothin' about that. Ask in Kharanos." } },
  },
}

P:NPC {
  key = "tundra_macgrann", id = TODO_NPC("Tundra MacGrann"), name = "Tundra MacGrann",
  bible = "bibles/dunmorogh_roads.md", role = "citizen", tier = "quest",
  communities = { "dunmorogh" }, temper = { "jovial" }, values = { "practical" },
  notices = { "race", "lock_armor" },

  impression = {
    first = "A bear has run off with his food stash.",
    third = "{name} met Tundra MacGrann, a dwarf who lives rough in the snows and lost his stash to a bear.",
  },

  greetings = {
    { id = "g_snow", text = "Hullo there! Ye're the first face I've seen all week that wasnae covered in fur." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again! Come warm yer hands by the fire, such as it is." },
  },

  notice = {
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Ye're wearin' somethin' dark over yer gear that looks like hide an' moves like smoke, an' the frost won't settle on it. I'll grant it'd keep the cold off out here, but I'd sooner freeze than wear a demon's skin." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It might, an' it might tell ye it's none o' yer business, which is what the earth's been tellin' me for sixty years. The old folk in these snows always said the mountain looks after its own. I just wish it counted me among its own, an' no' the bear." } },
      choices = {
        { text = "The bear's hungry too. Leave him what he needs.", next = "BACK", reply = "Aye, maybe ye're right, an' Ol' Sooty's a hungry old beast, so if ye leave him a wee bit o' cheese, I'll no' complain too loudly.", fx = { align = { light = 1 } } },
        { text = "I'll find that den and take back every scrap.", next = "BACK", reply = "That's the spirit, an' I'll make ye a cup o' somethin' warm when ye come back, provided ye bring the kettle back with ye.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nothin' I thought he'd want, only cheese an' dried meat an' a jar o' honey I was savin'. Aye, the honey, I ken, I ken, an' I've been callin' myself a fool about it since." } },
      choices = {
        { text = "Leave the bear be. It was your mistake, not his.", next = "BACK", reply = "Aye, maybe it was, an' I'll take the lesson, but a dwarf's still got tae eat, an' I'm no' sure I'll learn it before I starve.", fx = { align = { honor = 1 } } },
        { text = "Get your stash back. A bear can learn to fear a camp.", next = "BACK", reply = "That's what I've been tellin' myself, an' maybe a fright'll do him good, so long as ye leave him somethin' tae remember me by.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A great black brute that's been raidin' camps up here all winter, an' he's meaner than any trogg I've met. Mind his claws, let him come tae ye, an' dinnae turn yer back while ye're liftin' my sack." } },
      choices = {
        { text = "I'll face the bear head on, and fairly.", next = "BACK", reply = "Fairly, is it? Well, the bear doesnae know the meanin' o' the word, but I'll admire ye for it while I'm bandagin' ye after.", fx = { align = { honor = 1 } } },
        { text = "I'll lure him off with bait and grab the sack.", next = "BACK", reply = "Clever, an' sensible too, an' I wish I'd thought o' it, because I'd sooner my honey came back than any dwarf come home clawed.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Up intae the high snows, an' his tracks are deep enough tae lose a boot in, so ye'll no' miss them. I've lived out here longer than some o' the hills, but I've never seen a bear so set on another dwarf's dinner." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Up intae the high snows, an' his tracks are deep enough tae lose a boot in, so ye'll no' miss them. Yer {pet} could have a go at him, I suppose, but I'd hate for it tae end up as his pudding." },
      },
      choices = {
        { text = "I'll track him and bring your stash home.", next = "BACK", reply = "Bring it home whole if ye can. I've been eatin' snow an' pride for three days, an' neither one's fillin'.", fx = { align = { honor = 1 } } },
        { text = "I'll track him, and keep the pelt for my trouble.", next = "BACK", reply = "Ha, fair enough, an' ye've earned it if ye can get it, though I'd ask ye tae leave his head on, for I've grown oddly fond o' the brute.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because conjured bread is no' my bread, an' it's no' my brandy either. I've lived on these snows forty years, an' I'll eat what I stored, thank ye, once somebody gets it back from that black brute." } },
      choices = {
        { text = "I'll get your own stash back, Tundra. That's only right.", next = "BACK", reply = "Thank ye kindly, because a dwarf's stash is a dwarf's pride, an' I'll share a nip o' that brandy wi' ye once it's back where it belongs.", fx = { align = { honor = 1 } } },
        { text = "Food's food, Tundra. Conjured bread would save you the bother.", next = "BACK", reply = "Maybe so, but I'll no' have it, an' there's an end to it, because I've never eaten anythin' that sparkled an' I'll no' start now.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd trust ye as far as I'd trust a frozen pond, which is only as far as I've tested it. Ye'll have tae walk a bit further wi' me before I say more." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I'd trust a warlock as far as I'd trust a frozen pond, an' I'd trust what's walkin' at yer heel a good deal less, for it's been watchin' my back since we set out. Ye'll have tae walk a bit further wi' me before I say more, an' it'll walk in front, where I can see it." },
      },
      choices = {
        { text = "Then I'll walk with you, and you'll see I'm sound.", next = "BACK", reply = "We'll see, then, an' I'll keep my eye on ye the whole way, but if ye prove sound, I'll admit it, an' I'll buy ye a mug in Kharanos.", fx = { align = { light = 1 } } },
        { text = "Trust doesn't matter out here. Only survival does.", next = "BACK", reply = "Out here, maybe, but survival's a lonely business without trust, an' I've seen too many dwarves freeze tae death alone tae believe ye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Lonely? I've the hills an' the wind, an' Ol' Sooty the bear for company, though he's no' much o' a conversationalist an' he steals my food. A prayer now an' again wouldnae hurt, I suppose, but I'd sooner ye prayed for my stash." } },
      choices = {
        { text = "Then I'll pray for you and the stash both, Tundra.", next = "BACK", reply = "Thank ye, that's kind, an' a prayer for the honey wouldnae go amiss, for I miss it more than I'll admit tae the bear.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A man who chooses solitude doesn't need my prayers.", next = "BACK", reply = "Aye, maybe no', an' I'll no' quarrel, but I wouldnae turn one away either, for the winters out here are long an' the nights longer.", fx = { align = { light = -1 } } },
        { text = "Let's talk about the bear instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It's a bear, {g:lad|lass}, an' bears steal, same as dwarves drink, an' I'll no' blame it for it. I only want my stash back, an' if Ol' Sooty has tae go tae get it, well, I'll no' be weepin' at his funeral." } },
      choices = {
        { text = "Get the stash and spare the bear if I can. That's fair.", next = "BACK", reply = "That's a fair way tae do it, an' Ol' Sooty would thank ye if he had the manners, which he doesnae, but I'll thank ye for him.", fx = { align = { light = 1 } } },
        { text = "A beast that raids camps will raid them again. It dies.", next = "BACK", reply = "Maybe, an' I'll no' fight ye on it, but I've lived next tae that bear for years, an' I'll miss the old thief when he's gone.", fx = { align = { light = -1 } } },
        { text = "Something else, Tundra.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Nothin', for there's nothin' left, the bear saw tae that! If ye're as quiet as ye look, though, ye could creep up on that bear's den an' see what it's done wi' my stash." },
      },
      choices = {
        { text = "I'll bring back every crumb, Tundra.", next = "BACK", reply = "That's what I like tae hear, an' I'll save ye a crust o' the bread an' a spoon o' the honey, if the bear's left any.", fx = { align = { honor = 1 } } },
        { text = "I'll find it, and maybe keep a little.", next = "BACK", reply = "Ha, a wee bit for yer trouble, I suppose, so long as it's no' the brandy, for that I'll be countin' down tae the last drop.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest out in the snows! I'd kneel, but my knees froze solid back in the Second War, an' they've no' thawed since." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, all the way out here! Ye'll have come tae deal wi' Ol' Sooty, then, an' I'll warn ye he's bigger than he looks, an' he looks big." },
        { id = "h_default", key = true,
          text = "Tundra MacGrann, at yer service, and I've lived in these snows longer than some o' the hills. I'd offer ye a bite, but a great black bear has made off with my whole stash." },
        { id = "h_stash", when = { questActive = TODO_QUEST("Tundra MacGrann's Stolen Stash") },
          text = "Ol' Sooty's the thief, and he's dragged my stash back to his den. Get it back for me and I'll sing yer praises to every rock in Dun Morogh." },
        { id = "h_done", when = { questDone = TODO_QUEST("Tundra MacGrann's Stolen Stash") },
          text = "My stash, back where it belongs! I've been eatin' like a king of Ironforge since, or at least like his cook." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage could warm these old bones, I'd wager, but I'd sooner ye found the bear that took my stash." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye've a strange look about ye, an' the snow's gone grey where ye stood. I'll no' ask, if ye'll no' tell." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, eh? Ye'd be just the thing for a great black bear, if ye're no' too proud tae fight one for a sack o' food." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now ye're the very one I need, for that bear's got my stash, an' ye'll know how tae follow him." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Ye'll know bears, then, an' ye might tell me why a great black one would want my smoked cheese." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Ye've crept up on my camp like the bear did, so I hope ye've no' come for what's left o' my supper." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, eh? Ye wouldnae be able tae ask the earth where a great black bear's hidden my stash, would ye? I've asked the bear, an' he was rude." },
      },
      again = {
        { id = "h_again", text = "Somethin' else on yer mind? I've nowhere to be." },
        { id = "h_again2", text = "Ask what ye like, {g:lad|lass}; I've a fire goin' and nowhere better to be." },
      },
      choices = {
        { text = "So a bear stole your food.", next = "bear" },
        { text = "Why live out here alone?", next = "life" },
        { text = "What's the danger in these hills?", next = "hills" },
        { text = "The cold doesn't trouble a gnome, you know.", next = "gnome", when = { race = "Gnome" } },
        { text = "Why not let a mage conjure you new food?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you trust someone with my secrets out here in the snows?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What sort of bear took your food stash, Tundra?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Which way did the bear go with your stash?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever get lonely out here in the snows, Tundra?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does a thieving bear deserve to die for stealing food?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What did you leave out that a bear would want?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What would a rogue steal from a camp like yours?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would the earth tell me where the bear's den is, Tundra?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Tundra.", next = "END" },
      },
    },
    bear = {
      lines = { { id = "b_default", text = "Ol' Sooty, they call him, a black bear with a nose for cured meat and no shame at all. He took the lot while I was off fishin' at the lake." } },
      choices = {
        { text = "Where's his den?", next = "bear_den" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bear_den = {
      lines = { { id = "bd_default", text = "Up in the hills where the snow's deepest, and ye'll smell my sausages before ye see him. Mind his claws, for he's bigger than ye think." } },
      choices = {
        { text = "A thief's a thief. He'll pay for it.", next = "bear_end", fx = { align = { order = 1 } } },
        { text = "He's only a hungry bear. I'll just take it back.", next = "bear_end", fx = { align = { order = -1 } } },
        { text = "Anything else I should know?", next = "bear_end" },
      },
    },
    bear_end = {
      lines = { { id = "be_default", text = "Only that I want my stash more than I want revenge, so bring the food back first. Ye cannae eat a bear's hide, more's the pity." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    life = {
      lines = { { id = "l_default", text = "Ironforge is all walls and hammers, and Kharanos is all gossip and ale. Out here it's just me and the wind, and the wind never asks me for coin." } },
      choices = {
        { text = "It must get lonely out here.", next = "life_lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life_lonely = {
      lines = { { id = "ll_default", text = "Now and then, so I'm talkin' yer ear off. I go down to Kharanos for a pint when the loneliness gets worse than the walkin'." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hills = {
      lines = { { id = "hl_default", text = "Wendigos in the caves and Frostmane trolls in the western hollows, and the wolves get bold in a hard winter. Keep yer back to a rock and yer fire lit, and ye'll do fine." } },
      choices = { { text = "Good advice. Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Ha! Then ye've more sense than most of my kin, who complain about it with every step. Ye'll be from Gnomeregan, then, and I'm sorry about what happened there." } },
      choices = { { text = "Thank you. We'll take it back one day.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    everlook = { { id = "tp_everlook", text = "I spent a winter in Winterspring once, an' Everlook was the only warm place fer fifty miles. The goblins charge fer the fire, but I'd have paid double." } },
    timbermaw = { { id = "tp_timbermaw", text = "Bears that talk, up north, an' they're the friendliest bears I ever met, which says somethin' about the bears round here. Mine run off wi' my food." } },
    camping = { { id = "tp_camping", text = "Make yer camp where the wind cannae find ye an' the bears cannae smell ye, an' that's all I know. I failed at the second part, as ye can see." } },
    _none = { { id = "tp_none", text = "No idea, friend, and I've had a lot of quiet hours to think about it." } },
  },
}

P:NPC {
  key = "pilot_bellowfiz", id = TODO_NPC("Pilot Bellowfiz"), name = "Pilot Bellowfiz",
  bible = "bibles/dunmorogh_roads.md", role = "questgiver", tier = "quest",
  communities = { "dunmorogh" }, temper = { "eager" }, values = { "practical" },
  notices = { "race", "lock_stones" },

  impression = {
    first = "He talks fast about fuelling and feeding his flying machine.",
    third = "{name} met Pilot Bellowfiz at Steelgrill's Depot, a gnome pilot hungry for his next flight.",
  },

  greetings = {
    { id = "g_depot", text = "Oh, hello! Don't touch anything shiny, it's either hot or about to be." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Wonderful, I've thought of three more things I need." },
  },

  notice = {
    { id = "n_lock_firestone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "Is that a firestone in your bag? I can feel it from here, and I'm standing beside eleven barrels of fuel, so please, please, take three very slow steps back from the hangar door." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Want it? I'd seat you in the cockpit right next to the altimeter! Though I should warn you, every gnome who's flown with a dwarf passenger says they go a bit green over the peaks, so you might have to talk to the wind with your head in a bucket." } },
      choices = {
        { text = "The wind isn't a tool. I'd ask it, never command it.", next = "BACK", reply = "Oh, that's very poetic, and I respect it, though I'll keep my hand on the throttle in case the wind decides it doesn't want to be asked.", fx = { align = { honor = 1 } } },
        { text = "I'll tell it to blow eastward. Save me a seat.", next = "BACK", reply = "Splendid, I'll save you the seat by the altimeter, and if it blows west instead, we'll just call it a very scenic detour.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Constantly, because the gryphons sulk for an hour whenever I start the engine. I keep telling them it isn't a contest, but they've decided it is, and frankly they're winning." } },
      choices = {
        { text = "The sky is the birds' home. Fly gently in it.", next = "BACK", reply = "I'll try, I really will, though I suspect the gryphons will still sulk, because they've decided I'm competition and gnomes always win eventually.", fx = { align = { honor = 1 } } },
        { text = "The sky belongs to whoever can reach it.", next = "BACK", reply = "That's exactly what I tell the gryphons, and they never listen, so maybe you could tell them, because they might take it better from you.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The boars and wolves round the depot, mostly, for they've been helping themselves to the stores, and the flier runs on oil but the pilot runs on stew. A warrior could clear them off long enough for me to finish loading, and I'd be ever so grateful." } },
      choices = {
        { text = "I'll clear them off. No need to thank me.", next = "BACK", reply = "Oh, thank you, you're very kind, and the stew will be much safer for it, though I'll thank you anyway because I'm polite.", fx = { align = { honor = 1 } } },
        { text = "I'll clear them off, if I get a ride later.", next = "BACK", reply = "A ride? Well, that depends on whether the flier lands, but if it does, there's a seat for you, and I'll pretend I said that without a deal.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boar, wolf and bear, if you can manage the bear, for I'm told the flight's long and the clouds don't serve lunch. Steelgrill says I'm overpacking, but Steelgrill's never been stuck on a mountaintop with nothing to eat but a spanner." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Boar, wolf and bear, if you can manage the bear, for I'm told the flight's long and the clouds don't serve lunch. Your {pet} can have a share of whatever's left over, since it'll be doing half the work, I imagine." },
      },
      choices = {
        { text = "I'll bring exactly what's on your list.", next = "BACK", reply = "Splendid, a hunter who follows a list, and I'll tell Steelgrill so, because he's convinced I've packed for an army.", fx = { align = { order = 1 } } },
        { text = "I'll bring whatever I catch. You can sort it out.", next = "BACK", reply = "Oh, I'll sort it, don't worry, though if it's another bear I may need help getting it into the cargo hold, so do stay for a minute.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A troll, once, at Steelgrill's Depot, which was a very long and loud trip. I've fitted a lock since, but I suspect a clever rogue could open it, so I'm trusting you to be a nice rogue." } },
      choices = {
        { text = "I'm a nice rogue, Pilot. Your flier is safe with me.", next = "BACK", reply = "Thank you, and I'll believe you, mostly, though I've moved the spare spanners somewhere a nice rogue wouldn't think to look.", fx = { align = { honor = 1 } } },
        { text = "Your lock's the weak point, Pilot. I'd fix it soon.", next = "BACK", reply = "Oh, bother, I knew it, I'll have to redo it, but thank you for telling me rather than proving it, which is very decent of you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In theory, yes, and in practice, the last gnome who tried it ended up on the roof of Steelgrill's Depot. Gnomeregan was full of magic and machinery working together, and I miss that more than I miss my workshop." } },
      choices = {
        { text = "Then we'll build it carefully, with safety measures first.", next = "BACK", reply = "Safety first, yes, and I'll be glad of the help, because I'd rather not be the next gnome to see the depot from its roof.", fx = { align = { order = 1 } } },
        { text = "Let's test it right now. Theory is for cowards.", next = "BACK", reply = "Oh no, not right now, not here, because the depot roof is very slippery, and I've already been up there once this week.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I'm a gnome, so I trust gears and grease first, but I've crashed four times and walked away from every one, and I've started to wonder if somebody up there likes me. It can't hurt, and if it does, I'll write a very strongly worded report." } },
      choices = {
        { text = "Then I'll say a blessing. Faith and gears can fly together.", next = "BACK", reply = "Thank you, and I'll keep it in my top pocket, right next to the spare bolts, because I need all the luck I can carry up there.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Trust your gears, pilot. Prayers don't hold a wing on.", next = "BACK", reply = "Fair point, and my gears are very good, but four crashes is a lot to walk away from, so I'll keep wondering if you don't mind.", fx = { align = { light = -1 } } },
        { text = "Tell me more about the depot instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Mostly, though the troggs come out of the ground near Gnomeregan and the Frostmane trolls sometimes wander too close. The depot guards do their best, but they're gnomes with very small swords, and I'd feel much better with a paladin about." } },
      choices = {
        { text = "Then I'll watch the depot while you load. That's my duty.", next = "BACK", reply = "Oh, thank you, that's very kind, and the depot guards will be glad of you too, though they'll pretend they had it all in hand.", fx = { align = { honor = 1 } } },
        { text = "Hire more guards. I can't stand watch over every depot.", next = "BACK", reply = "More guards, yes, if only I could pay them in stew, but I suppose I'll make do with the ones I have and a very loud whistle.", fx = { align = { honor = -1 } } },
        { text = "Something else, pilot.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because they're full of very flammable things, and your little companion is a very flammable sort of thing, and I've done the sums on what happens when the two meet! Steelgrill's Depot has had one explosion this season already, and the next one is not going to be mine." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because they're full of very flammable things, and your servant is a very flammable sort of thing, and right now it's standing far too close to the nearest fuel cask! Steelgrill's Depot has had one explosion this season already, so would you kindly walk it backwards until I can't smell the sulphur anymore?" },
      },
      choices = {
        { text = "Understood. It stays far from the fuel.", next = "BACK", reply = "Thank you, really, because I've done the sums, and the sums don't end well for anybody, least of all the flier.", fx = { align = { order = 1 } } },
        { text = "A little fire never hurt a flier.", next = "BACK", reply = "It has never hurt a flier, no, because every flier it touched was immediately unavailable for comment, so please keep it away.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Would you mind saying something over Jetsteam? Nothing fancy, just enough to keep her in the air, because I'm not convinced the engineering will." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I'd offer you a ride, but Jetsteam only seats one, and I'm not sure she'd lift all that plate anyway." },
        { id = "h_default", key = true,
          text = "Pilot Bellowfiz, aviator, at your service! I'm stocking my flier for a long trip, eleven hundred miles by my reckoning, and the depot's larder is emptier than a kobold's head." },
        { id = "h_jet", when = { questActive = TODO_QUEST("Stocking Jetsteam") },
          text = "Bear meat, boar meat and a bit of thick hide, that's what Jetsteam needs! Well, that's what I need, but Jetsteam needs me fed." },
        { id = "h_done", when = { questDone = TODO_QUEST("Stocking Jetsteam") },
          text = "Jetsteam's fully stocked, thanks to you! I'll name a loop-the-loop after you, if I survive it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A sneaky sort! You'd make a terrible stowaway, though, because my flier only seats one and I'd notice the extra weight." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've always wondered whether arcane power could drive a flier, and I'd very much like you to tell me it can." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Splendid, because the depot's larder is empty and the beasts outside are not, and I'm terribly busy with my flier." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Oh, perfect, because I need meat for a long trip, and you can get it faster than the depot's cook can find his spoon." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've heard you can turn into a bear, and I'm deeply curious whether a bear would fit in my cockpit." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You can ride the flier if you like, but that hot little thing following you goes in the cargo hold, and please tell it not to touch the fuel lines, they're very sensitive!" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Oh, splendid. Can you tell the wind to blow eastward on Thursday? My flight plan depends entirely on it." },
        { id = "dd_stonegear", when = { questDone = TODO_QUEST("Stonegear's Search") },
          text = "Stonegear tells me you helped him find what he was after! He's a siege man, not a flier like me, but we pilots look after each other, and I'm obliged to you on his behalf." },
      },
      again = {
        { id = "h_again", text = "Something else? Quickly, quickly, the engine's warm, and every minute idle costs me two percent of my steam!" },
        { id = "h_again2", text = "Ask away, I've got a moment while the pressure builds." },
      },
      choices = {
        { text = "What's Jetsteam?", next = "jet" },
        { text = "What is this depot for?", next = "depot" },
        { text = "You can't be the only one working out here.", next = "people" },
        { text = "A fellow gnome! Where are you flying?", next = "gnome", when = { race = "Gnome" } },
        { text = "Have you had stowaways on your flier before?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could arcane magic really power a flying machine?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What's keeping the depot's larder so empty, Pilot?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What meat do you need for your trip, Pilot?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you really want a prayer said over your flier?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is the depot safe out here, pilot?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your machine must frighten the birds, Pilot.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why are the fuel lines so sensitive, Bellowfiz?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would you want a shaman's help with the winds, Pilot?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Safe flying.", next = "END" },
      },
    },
    jet = {
      lines = { { id = "j_default", text = "My flying machine, and the finest one this side of Ironforge! She runs on steam and good luck, and I make sure there's plenty of both." } },
      choices = {
        { text = "It doesn't look entirely safe.", next = "jet_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jet_safe = {
      lines = { { id = "js_default", text = "Safe is a strong word, and I prefer 'thrilling.' I've only crashed her twice, and both times the ground was in the wrong place." } },
      choices = {
        { text = "Machines like that should be inspected before they fly.", next = "jet_end", fx = { align = { order = 1 } } },
        { text = "Fly first and fix it after. That's the spirit!", next = "jet_end", fx = { align = { order = -1 } } },
        { text = "And the third time?", next = "jet_end" },
      },
    },
    jet_end = {
      lines = { { id = "je_default", text = "The third time will be a triumph, mark my words! Bring me those supplies and you can watch from a very safe distance." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    depot = {
      lines = { { id = "d_default", text = "Steelgrill's Depot is where the gnomes who left Gnomeregan keep their tools and their hope. Tinkerers come and go, and the Mountaineers watch the road for troggs." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },
    people = {
      lines = { { id = "p_default", text = "Pilot Stonegear's here, if you can get a word in past his moustache, and Razzle Sprysprocket was tinkering out east. Everyone's busy fixing something or blowing it up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Wherever the wind wants, cousin! After Gnomeregan, I'd rather be up in the sky than under a mountain, and I don't think I'm the only one." } },
      choices = { { text = "I understand that. Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan built the best flying machines in the world, and I'd fly one back in there if I didn't think the troggs would eat it. Someday, someday, and I'll be at the controls." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "The goblins in Gadgetzan fly their machines on whatever they can find in the desert, and they crash more than they land. I've a cousin there who flies one, and he's lost three eyebrows and most of a moustache." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay has a zeppelin tower, they say, though I've never been, and I'd love to look at it and tut. Goblins never use enough rivets." } },
    _none = { { id = "tp_none", text = "Hmm, not my field. My field is the sky, roughly four thousand feet of it, and that's not in it." } },
  },
}

P:NPC {
  key = "hegnar_rumbleshot", id = TODO_NPC("Hegnar Rumbleshot"), name = "Hegnar Rumbleshot",
  bible = "bibles/dunmorogh_roads.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "gruff" }, values = { "proud" },
  notices = { "class", "lock_shards" },

  impression = {
    first = "He talks about guns like other dwarves talk about ale.",
    third = "{name} met Hegnar Rumbleshot, a gunsmith who keeps camp along the Dun Morogh road.",
  },

  greetings = {
    { id = "g_camp", text = "Lookin' for a gun? Ye've come to the right dwarf, and ye'll no' find a better one between here and Ironforge." },
  },

  notice = {
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "That's a fair weight o' soul shards ye're carryin', an' they rattle like a pouch o' shot, only colder. Every one o' those is a trogg or a troll that'll no' trouble the road again, so I'll grant ye they're tidier than bullets." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every dwarf has a use for a good rifle! Mind, I've heard the earth-talkers say the blast startles the spirits. If that's so, ye'll want a quieter barrel, an' I'll tell ye now that I dinnae make quiet barrels." } },
      choices = {
        { text = "A rifle has its place. Discipline's the same either way.", next = "BACK", reply = "Spoken like a proper dwarf, an' I'll find ye a quieter barrel, though I'll no' promise the spirits willnae jump now an' then.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll trust the storm over powder any day, Hegnar.", next = "BACK", reply = "Aye, aye, the storm's a fine thing, I'll grant ye, but it doesnae always come when called, an' a gun always does.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They frighten everythin' for a mile, an' then everythin' comes back, for the hills are stubborn. A good shot's quick an' clean, which is kinder than a bad arrow, whatever an elf might tell ye." } },
      choices = {
        { text = "A clean kill is kinder, I agree with you there.", next = "BACK", reply = "I've always thought so. I'd rather no' argue about it wi' a druid any longer than I must, though.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The hills were quieter before gunpowder ever came to them.", next = "BACK", reply = "They were, an' they were full o' trolls an' troggs back then too, so I'll take a bit o' noise over a spear in the back, thank ye.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, an' I'll tell ye why: a Frostmane troll wi' a spear can hit ye from twenty paces, an' yer axe cannae. A wee blunderbuss on yer back, an' ye can answer him before ye close the distance." } },
      choices = {
        { text = "I'll close the distance and settle it with steel.", next = "BACK", reply = "Aye, if ye can close it, an' ye might, but I've seen braver warriors than you fall on the way in, so take a pistol anyway.", fx = { align = { honor = 1 } } },
        { text = "Shoot first, close later. That's just good sense.", next = "BACK", reply = "That's what I like tae hear, an' ye'll live longer for it, so take yer pick o' the barrels, for I've a wee blunderbuss that'd suit ye.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than ye'd think, for a pistol's a fine thing tae have when the dagger misses. I'll sell ye one, but if I hear it was used on an honest dwarf, I'll come lookin', an' I'm a very good shot." } },
      choices = {
        { text = "I'd only ever aim it at an enemy, Hegnar.", next = "BACK", reply = "I'll take ye at yer word. I'll still be listenin', mind, because Dun Morogh's a small place for rumours.", fx = { align = { honor = 1 } } },
        { text = "Who I shoot is my business once I've paid.", next = "BACK", reply = "Is it now? Then ye can buy yer pistol somewhere else, an' I'll be keepin' my ears open in Kharanos for yer name.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because most o' yer sort reckon a curse beats a bullet, an' I'd argue the bullet's quicker. If ye keep a gun as well as whatever else ye keep, at least the troggs will die clean." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because most o' yer lot reckon a curse beats a bullet, an' that creature o' yours is lookin' at my rifles like they're toys, which tells me what it thinks o' honest powder. If ye keep a gun as well as yer demons, at least the troggs will die clean." },
      },
      choices = {
        { text = "A clean shot is honest work. I'll keep one handy.", next = "BACK", reply = "That's sense, an' it's more than most o' yer sort will admit, so I'll find ye a wee barrel that sits nicely under a cloak.", fx = { align = { light = 1 } } },
        { text = "The curse is slower, Hegnar, and that's the point.", next = "BACK", reply = "Slower, aye, an' crueller too, an' I'll no' sell ye anythin' tae make it worse, so take yer business elsewhere for the curses.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every dwarf should carry a gun, an' priests most o' all, for ye're the ones the trolls aim at first. Ye can heal the lads after, but first ye've tae live long enough, an' that's where I come in." } },
      choices = {
        { text = "My faith is protection enough. I'll leave the guns to you.", next = "BACK", reply = "Faith's a fine thing, but faith never stopped a troll's spear, an' I'd rather see ye walk back than be carried, so think on it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. Faith and a good barrel are both worth having.", next = "BACK", reply = "Now there's a wise priest, an' I'll sell ye somethin' light, so ye can still bless yer lads wi' both hands when the shootin's done.", fx = { align = { light = -1 } } },
        { text = "Let me look at the rack instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Honourable's for duels, {g:lad|lass}, an' trolls don't duel; they come screamin' down the hill wi' spears. I'll no' tell ye how tae fight, but I've buried dwarves who waited for a fair fight, an' I'd rather sell ye a gun." } },
      choices = {
        { text = "I'll face my foes in the open. That's how it should be.", next = "BACK", reply = "Then ye're braver than most, an' I'll no' laugh, but take a pistol in yer pack anyway, for the trolls dinnae read the rules o' honour.", fx = { align = { honor = 1 } } },
        { text = "A dead troll is a dead troll. Sell me the gun.", next = "BACK", reply = "Ha, a paladin wi' sense, an' that's rarer than ye'd think, so let's find ye somethin' that'll make a troll think twice.", fx = { align = { honor = -1 } } },
        { text = "Something else, Hegnar.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because a gun never runs out o' mana, an' when yer spells are spent an' the wolves are still comin', ye'll wish ye'd listened tae me. Mages cannae fire one, more's the pity, but ye can stand next tae a dwarf who can." },
      },
      choices = {
        { text = "Fair point. I'll keep a dwarf with a gun nearby.", next = "BACK", reply = "Good thinkin', an' I'll be glad tae stand behind ye wi' my rifle, for a mage an' a dwarf wi' a gun can handle most things.", fx = { align = { order = 1 } } },
        { text = "My spells won't run out, Hegnar.", next = "BACK", reply = "Every mage says that, an' every mage is wrong about it eventually, so if ye change yer mind, I'll still be here wi' my barrels.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_hr_vagash = {
      lines = {
        { id = "dd_hr_vagash1", text = "They always are. I sold Rudra's lads two o' my best blunderbusses for that beast, an' they came back wi' empty barrels an' a story about a yeti that shrugged off shot. So tell me true, did ye use a gun, or did ye go at it wi' somethin' sharp?" },
      },
      choices = {
        { text = "A gun, Hegnar. A good one never fails.", next = "BACK", reply = "That's what I like tae hear! I'll tell the next customer that, an' charge a wee bit more.", fx = { align = { order = 1 } } },
        { text = "Something sharp. Guns are for those who fear getting close.", next = "BACK", reply = "Fear, is it? It's called sense, an' I've kept all ten fingers wi' it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest buyin' a gun? Well, why no', for I've sold tae stranger, an' a gun's a fine friend when yer prayers are runnin' low." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll swear by yer hammer, I've no doubt, but a hammer cannae reach a troll on a ridge, an' a gun can." },
        { id = "h_default", key = true,
          text = "Hegnar Rumbleshot, gunsmith, and every barrel on that rack's been tested by my own hand. If it didnae knock me on my backside, it doesnae get sold." },
        { id = "h_ammo", when = { questActive = TODO_QUEST("Ammo for Rumbleshot") },
          text = "Is that my ammunition ye've got there? Good, I was startin' to sell guns with nothin' to put in them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! Ye'll be wantin' somethin' quiet, an' I'll tell ye now nothin' on this rack is quiet." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Cold hands, black ink under the nails, an' ye want a gun? That's a new one, though I'll sell tae anyone wi' coin an' sense." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll swear by yer axe, I've no doubt, but there's no shame in a gun for the troll that's too far tae reach." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I've heard yer kind don't care for guns, an' I'll no' take it personal if ye don't buy one." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Ye'll no' want a gun, I know, but have ye ever heard a Rumbleshot fire in the snow? It's prettier than any spell." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman in my shop! Ye'd no' be the first dwarf tae say powder an' fire are cousins, but ye'd be the first tae ask the fire's permission before ye light the fuse." },
        { id = "dd_vagash", when = { questDone = TODO_QUEST("Protecting the Herd") },
          text = "Rudra Amberstill says ye put down that great yeti, Vagash, that'd been eatin' her rams. I heard it roarin' from my camp at night, an' I'll admit I slept wi' a loaded gun." },
      },
      again = {
        { id = "h_again", text = "What else? I've a rifle to oil." },
      },
      choices = {
        { text = "Vagash was bigger than I expected, Hegnar.", next = "dd_hr_vagash", when = { questDone = TODO_QUEST("Protecting the Herd") } },
        { text = "Why camp out here instead of the city?", next = "camp" },
        { text = "What makes a good gun?", next = "guns" },
        { text = "I'm a hunter. What would you recommend?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do rogues ever buy guns from you?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why would someone like me not buy a gun, Hegnar?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Should a warrior carry a gun as well, Hegnar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Should a priest carry a gun, Hegnar?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is it honourable to shoot a foe from a ridge?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your guns ever frighten the wildlife away for good?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why would a mage care about guns, Hegnar?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does a shaman have any use for a good rifle, Hegnar?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just looking, thanks.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Because the folk who need a gun are out here, no' in the city. Ironforge has its guards; a farmer on the road has only what he carries." } },
      choices = {
        { text = "Every dwarf should be able to defend himself.", next = "BACK", reply = "That's why I'm out here. A dwarf who cannae defend himself is a dwarf waitin' tae be robbed.", fx = { align = { order = -1 } } },
        { text = "The guards should keep the roads safe instead.", next = "BACK", reply = "They should, an' I'd love tae see it, but the guards cannae be everywhere, an' the trolls know it better than anyone.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guns = {
      lines = { { id = "gu_default", text = "A straight barrel, dry powder and a dwarf who knows to clean it. The rest is just decoration for gnomes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Somethin' sturdy that won't jam in the cold, and plenty of shot to go with it. A hunter who runs out of ammunition is just a dwarf with a heavy stick." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay sells guns that'll blow up in yer hand an' charge ye extra fer the explosion. Mine'll only blow up the thing ye're aimin' at." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got a goblin gunsmith who claims he's better than me, an' I've never met him, an' he's wrong. Ye can tell him I said so." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer throw hammers instead o' shootin' guns, which is a fine tradition an' a waste o' good powder. Each tae their own, I suppose." } },
    _none = { { id = "tp_none", text = "If it doesnae go bang, I couldnae tell ye about it." } },
  },
}
