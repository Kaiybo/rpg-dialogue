-- Dun Morogh folk the first passes missed, part 2: Steelgrill's Depot (Bronk Guzzlegear, Loslor Rudge, Yarr Hammerstone)
-- and Brewnall Village with Iceflow Lake (Burdrak Harglhelm, Keeg Gibn, Tristane Shadowstone, Gretta and Paxton Ganter).
-- Voice: bibles/missed_dunmorogh.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bronk Guzzlegear: engineering trainer, Steelgrill's Depot.
P:NPC {
  key = "bronk_guzzlegear", id = TODO_NPC("Bronk Guzzlegear"), name = "Bronk Guzzlegear", gender = "male",
  title = "Engineering Trainer",
  bible = "bibles/missed_dunmorogh.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "loud", "tinkering" }, values = { "craft", "invention" },
  notices = { "craft", "race" },
  impression = {
    first = "Bronk Guzzlegear teaches engineering at Steelgrill's Depot with a wrench in one fist and a tankard in the other. He shouts over engines that aren't running, out of long habit.",
    third = "{name} met Bronk Guzzlegear, who teaches engineering at Steelgrill's Depot.",
  },
  greetings = {
    { id = "g_default", text = "Mind the oil, {class}! If ye've come tae learn how things go bang on purpose, ye've found the right dwarf." },
    { id = "g_eng", when = { profession = "Engineering" }, text = "A fellow tinkerer! Show me yer hands, {g:lad|lass}. Aye, ten fingers still, so ye're either careful or new." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the Depot, are ye? Good, hold this spanner a moment while we talk." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome at my bench! I'll say this fer yer folk, ye build cleverer than we do, though I've yet tae see a gnomish device that'd survive bein' dropped." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bronk Guzzlegear, engineer. I teach the craft here at the Depot, where the siege engines come tae be mended an' there's always scrap fer a student tae ruin." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? Speak up, the boiler's deafened me." },
        { id = "h_again2", text = "Aye, I'm listenin', keep talkin' while I tighten this." },
      },
      choices = {
        { text = "Dwarven engineering or gnomish?", next = "rival" },
        { text = "What comes through the Depot?", next = "depot" },
        { text = "Can engineering help me make camp?", next = "camp", when = { profession = "Engineering" } },
        { text = "I'll let you get back to it.", next = "END" },
      },
    },
    rival = {
      lines = { { id = "r_default", text = "Dwarven, an' I'll tell ye the difference. A gnome builds a thing tae see if it can be built, an' a dwarf builds it so his grandson can still use it, an' only one o' those is safe tae stand beside." } },
      choices = {
        { text = "The gnomes built Gnomeregan.", next = "gnomes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes = {
      lines = { { id = "g_gn", text = "Aye, they did, an' it was a marvel, an' I'll no' make sport o' what happened tae it. Half the pilots at this Depot are refugees from the place, an' they work harder than any three dwarves I know.", fx = { learn = { "gnomeregan" } } } },
      choices = { { text = "That's fairly said. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    depot = {
      lines = { { id = "d_default", text = "Steam tanks, mostly, back from patrol wi' trogg dents in the plating, an' Pilot Stonegear's Trollplow, which he'll no' let anybody else touch. Loslor sells the parts an' Yarr finds the ore, so between us the Depot wants fer little." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "c_default", text = "It can, an' more than ye'd think! Once ye've a bit o' skill I can show ye a wee contraption fer the campsite, for nae engineer should sit by a fire wi' nothin' tae tinker at.", fx = { learn = { "camping" } } } },
      choices = { { text = "I'll come back when I've the skill.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned on the steam tanks in the Second War, an' I've been takin' things apart ever since tae see why they stopped." } },
    gnomeregan = { { id = "tp_gn", text = "A marvel, an' now a tomb full o' poison. The gnomes here dinnae like tae talk o' it, so I dinnae ask." } },
    camping = { { id = "tp_ca", text = "A proper camp wants a proper gadget in it. Come tae me when ye've some engineerin' behind ye." } },
    _none = { { id = "tp_none", text = "If it hasnae got gears in it, I'm nae use tae ye. Ask Beldin Steelgrill, it's his depot." } },
  },
}

-- Loslor Rudge: engineering supplies, Steelgrill's Depot. Supplies Hegnar Rumbleshot; quest Ammo for Rumbleshot.
P:NPC {
  key = "loslor_rudge", id = TODO_NPC("Loslor Rudge"), name = "Loslor Rudge", gender = "male",
  title = "Engineering Supplies",
  bible = "bibles/missed_dunmorogh.md", role = "vendor", tier = "quest",
  communities = { "dunmorogh" }, temper = { "harried" }, values = { "trade", "reliable" },
  notices = { "craft", "class" },
  impression = {
    first = "Loslor Rudge sells powder, bolts and copper tubing at Steelgrill's Depot, and counts his stock twice because he's sure some of it is missing. Just now he's right.",
    third = "{name} met Loslor Rudge, who sells engineering supplies at Steelgrill's Depot.",
  },
  greetings = {
    { id = "g_default", text = "Aye, aye, I'll be wi' ye in a moment, {class}. I'm a crate short an' I'm tryin' tae work out how tae tell a gunsmith." },
    { id = "g_active", when = { questActive = TODO_QUEST("Ammo for Rumbleshot") }, text = "Have ye found my crate yet? It'll be up by the Grizzled Den, where that fool courier dropped it an' ran." },
    { id = "g_done", when = { questDone = TODO_QUEST("Ammo for Rumbleshot") }, text = "There's the {class} who saved my good name wi' Hegnar! He's stopped sendin' me rude notes, an' I've ye tae thank fer it." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye carry a gun, so ye'll understand my trouble better than most. A gunsmith wi' nae shot tae sell is a very unhappy dwarf." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_done", when = { questDone = TODO_QUEST("Ammo for Rumbleshot") }, text = "Loslor Rudge, an' business is runnin' smooth again since ye fetched that crate. I've a new courier now, an' I've made her swear on her beard tae stay on the road." },
        { id = "h_default", text = "Loslor Rudge, engineerin' supplies. I keep the Depot in powder an' parts, an' I supply the shot fer Hegnar Rumbleshot's gun shop up the hill, or I did until my courier lost a whole crate o' it." },
      },
      again = {
        { id = "h_again", text = "What else? I've stock tae count." },
        { id = "h_again2", text = "Go on, {class}, but I'm countin' while I listen." },
      },
      choices = {
        { text = "How does a courier lose a crate?", next = "courier" },
        { text = "Who is Hegnar Rumbleshot?", next = "hegnar" },
        { text = "You look like a dwarf who worries.", next = "worry" },
        { text = "What sells best to engineers?", next = "sells", when = { profession = "Engineering" } },
        { text = "I'll leave you to your counting.", next = "END" },
      },
    },
    courier = {
      lines = { { id = "c_default", text = "By takin' a shortcut, that's how. He left the road tae save an hour, made camp near the Grizzled Den, an' woke tae find a wendigo sniffin' at his bedroll, so he ran an' left the crate where it sat." } },
      choices = {
        { text = "I can't blame him for running.", next = "blame" },
        { text = "What's in the Grizzled Den?", next = "den" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blame = {
      lines = { { id = "b_default", text = "Nor can I, when I'm calm about it. A wendigo's twice the height o' a dwarf an' all teeth, an' the lad's a courier, no' a mountaineer, but I'll blame him fer the shortcut till the day I retire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    den = {
      lines = { { id = "d_default", text = "Wendigo, a whole cave o' them, up in the hills south-west o' Kharanos. They're great white shaggy brutes that keep tae themselves unless ye camp on their doorstep, which is exactly what he did." } },
      choices = {
        { text = "Will they have touched the crate?", next = "crate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crate = {
      lines = { { id = "cr_default", text = "I doubt it, for a wendigo's got nae use fer rifle shot an' cannae eat it. It'll be sittin' in the snow by a cold campfire, an' Hegnar's waitin' on it at his camp north o' there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hegnar = {
      lines = { { id = "he_default", text = "The best gunsmith outside Ironforge, an' the worst-tempered. He keeps a camp in the hills an' sells rifles tae the hunters, an' every ball they fire comes out o' my stores, so when I'm late he lets me hear about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worry = {
      lines = { { id = "w_default", text = "I sell blastin' powder fer a livin' an' I sleep above the shop, so aye, I worry. It's the dwarves who dinnae worry about powder that ye want tae stand well back from." } },
      choices = { { text = "That's sensible. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sells = {
      lines = { { id = "s_default", text = "Blastin' powder, by a mile, an' copper tube after it. Bronk's students go through bolts as if they were eatin' them, an' I've stopped askin' where they all end up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept the Depot's stores fer years, an' I've never lost a crate before this one. It still stings." } },
    camping = { { id = "tp_ca", text = "Ye'll want Bronk fer that, he teaches the makin'. I only sell the parts." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, I've my head full o' inventory. Ask one o' the pilots, they get about." } },
  },
}

-- Yarr Hammerstone: mining trainer, Steelgrill's Depot.
P:NPC {
  key = "yarr_hammerstone", id = TODO_NPC("Yarr Hammerstone"), name = "Yarr Hammerstone", gender = "male",
  title = "Mining Trainer",
  bible = "bibles/missed_dunmorogh.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "patient", "earthy" }, values = { "stone", "craft" },
  notices = { "craft", "race" },
  impression = {
    first = "Yarr Hammerstone teaches mining at Steelgrill's Depot, and he has the stooped shoulders and the slow, sure hands of a dwarf who has spent his life underground. He taps the wall beside him while he talks, listening to it.",
    third = "{name} met Yarr Hammerstone, who teaches mining at Steelgrill's Depot.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. There's copper in every hill o' Dun Morogh, if ye've the pick an' the patience fer it." },
    { id = "g_miner", when = { profession = "Mining" }, text = "That's a miner's squint ye have, from lookin' at rock in bad light. Sit down, {g:lad|lass}, an' tell me what ye've been diggin'." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' wi' rock dust on yer boots, I hope." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf who doesnae mine is like a fish that doesnae swim, {g:lad|lass}. I'll no' lecture ye, but I'll think it loudly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Yarr Hammerstone. I teach folk tae find ore an' tae get it out wi'out bringin' the roof down, which are two different skills an' I've buried friends who only had the first." },
      },
      again = {
        { id = "h_again", text = "What else would ye know, {class}?" },
        { id = "h_again2", text = "Take yer time. Stone's never in a hurry, an' neither am I." },
      },
      choices = {
        { text = "Where should a new miner dig?", next = "where" },
        { text = "You were listening to the wall just now.", next = "listen" },
        { text = "Is a miner any use around a campfire?", next = "camp", when = { profession = "Mining" } },
        { text = "Stone keep you, Yarr.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Follow the hillsides around Kharanos an' the Depot, an' look fer the green stain where copper's weathered. Stay clear o' Gol'Bolar Quarry tae the east fer now, though, for the troggs have come up through the diggin's there.", fx = { learn = { "troggs" } } } },
      choices = {
        { text = "Why do troggs come up where dwarves dig?", next = "troggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs = {
      lines = { { id = "t_default", text = "Because we keep diggin' down intae wherever it is they live, {g:lad|lass}. Nobody likes tae say it, but every trogg in Khaz Modan came out o' a hole some dwarf was proud o', an' the Explorers' League has been arguin' about what that means ever since." } },
      choices = { { text = "That's an uncomfortable thought. Something else.", next = "BACK" } },
    },
    listen = {
      lines = { { id = "l_default", text = "Aye, I was. Sound rock rings when ye knock it an' rotten rock thuds, an' after enough years a miner cannae stand beside a wall wi'out askin' it how it's keepin'." } },
      choices = {
        { text = "And how is this one keeping?", next = "BACK", reply = "It's sound as the day it was cut, I'm pleased tae say. Steelgrill built his depot well." },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "More than ye'd guess, for who else knows how tae lay stones so a fire draws properly? When ye've some skill wi' the pick, come back an' I'll show ye a thing a miner can build fer the camp.", fx = { learn = { "camping" } } } },
      choices = { { text = "I'll hold you to that lesson.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I went down my first shaft before my beard came in, an' I've spent more o' my life under stone than under sky." } },
    troggs = { { id = "tp_tr", text = "They come up where we dig deep. Gol'Bolar Quarry's the latest, an' it'll no' be the last." } },
    camping = { { id = "tp_ca", text = "There's a thing a miner can build fer a camp, an' I'll teach it when ye've the skill." } },
    _none = { { id = "tp_none", text = "That's above ground, an' I've never paid much mind tae what's above ground. Ask Bronk." } },
  },
}

-- Burdrak Harglhelm: leather armor merchant, Brewnall Village.
P:NPC {
  key = "burdrak_harglhelm", id = TODO_NPC("Burdrak Harglhelm"), name = "Burdrak Harglhelm", gender = "male",
  title = "Leather Armor Merchant",
  bible = "bibles/missed_dunmorogh.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "plainspoken" }, values = { "craft", "thrifty" },
  notices = { "class", "pet" },
  impression = {
    first = "Burdrak Harglhelm sells leather armor in Brewnall Village, and the whole stall smells of tannin and woodsmoke. He rubs a hide between finger and thumb before he'll say a word about it.",
    third = "{name} met Burdrak Harglhelm, the leather armor merchant of Brewnall Village.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}. If the wind off Iceflow Lake has found the holes in yer coat, I can help ye there." },
    { id = "g_leather", when = { class = { "HUNTER", "ROGUE" } }, text = "Now here's a customer who knows the worth o' good leather. Come an' feel the weight o' this, {class}, an' tell me it isnae fine." },
    { id = "g_back", when = { metBefore = true }, text = "Back in Brewnall? The coat's held up, then, or ye'd have come back angrier." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a handsome beast ye have, an' I mean that as a tanner, though I see by yer face I'd best no' say more." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Burdrak Harglhelm, leather goods. Brewnall's a brewin' village an' naebody comes here fer armor, so I sell tae the hunters an' trappers who come fer the ale an' leave wi' a jerkin." },
      },
      again = {
        { id = "h_again", text = "Anythin' else I can tell ye?" },
        { id = "h_again2", text = "Aye, {class}, what is it?" },
      },
      choices = {
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Is Brewnall a safe place to keep shop?", next = "safe" },
        { text = "Let me see your stock.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Bear an' boar from the hills, an' wolf when the trappers bring it. Wendigo would make the warmest coat in Khaz Modan, but naebody's ever brought me a whole one, an' I've stopped askin'." } },
      choices = {
        { text = "What about snow leopard?", next = "leopard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leopard = {
      lines = { { id = "le_default", text = "Bonny tae look at an' too thin tae be worth the stitchin'. A leopard pelt's fer a rich dwarf's floor, an' I sell coats fer folk who've work tae do in the cold." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "s_default", text = "Safe enough by day. There's a Frostmane hold in the hills beyond the lake, though, an' when the ice is thick the trolls can walk straight across it, so we keep the doors barred after dark.", fx = { learn = { "frostmane" } } } },
      choices = {
        { text = "Have they ever come across?", next = "across" },
        { text = "Something else.", next = "BACK" },
      },
    },
    across = {
      lines = { { id = "a_default", text = "They've come as far as the shore an' stood lookin' at us, which I liked even less than a raid. The Ganters fish out on that ice every day regardless, an' I'm no' sure whether that's courage or habit." } },
      choices = { { text = "With dwarves it's often both. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a tanner by trade, an' I set up in Brewnall because the trappers all pass through it fer the ale." } },
    frostmane = { { id = "tp_fm", text = "Their hold's beyond the lake. We watch the ice in winter, an' in Dun Morogh it's always winter." } },
    _none = { { id = "tp_none", text = "I dinnae know, friend. Ask Keeg, he hears every tale that's told over a mug." } },
  },
}

-- Keeg Gibn: ale and wine, Brewnall Village.
P:NPC {
  key = "keeg_gibn", id = TODO_NPC("Keeg Gibn"), name = "Keeg Gibn", gender = "male",
  title = "Ale & Wine",
  bible = "bibles/missed_dunmorogh.md", role = "vendor", tier = "service",
  communities = { "dunmorogh" }, temper = { "jolly", "gossipy" }, values = { "ale", "neighbours" },
  notices = { "drink", "race" },
  impression = {
    first = "Keeg Gibn sells ale and wine in Brewnall Village, and samples enough of both to be sure of the quality. He leans on a cask as if it were an old friend's shoulder.",
    third = "{name} met Keeg Gibn, who sells ale and wine in Brewnall Village.",
  },
  greetings = {
    { id = "g_default", text = "Come in, come in, {class}! Ye've a thirsty look, an' there's nae better village in Khaz Modan tae have one in." },
    { id = "g_drunk", when = { drunk = true }, text = "Ha! Ye started wi'out me, I see. Well, pull up a cask an' mind ye dinnae fall off it." },
    { id = "g_back", when = { metBefore = true }, text = "I knew ye'd be back. Naebody comes tae Brewnall only the once." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf o' taste, I can tell. So settle it fer me, {g:lad|lass}: Thunderbrew or Barleybrew? Mind how ye answer, the Barleybrews are stood right over there." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A night elf, in Brewnall! I'm told yer folk drink moonlight an' dew, so I'll be very interested tae see what ye make o' a dwarven stout." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Keeg Gibn, purveyor o' ale an' wine. The Barleybrews make it an' I sell it, an' we both think we've the better half o' the bargain." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I've all day an' a full cask." },
        { id = "h_again2", text = "Aye, go on, I like a customer who talks." },
      },
      choices = {
        { text = "What's the quarrel with the Thunderbrews?", next = "feud" },
        { text = "A dwarf who sells wine?", next = "wine" },
        { text = "What's the talk of the village?", next = "talk" },
        { text = "I'll take a look at your casks.", next = "END" },
      },
    },
    feud = {
      lines = { { id = "f_default", text = "Och, it's older than I am. The Thunderbrews have the big distillery at Kharanos an' their name on every cask in Ironforge, an' the Barleybrews have the better recipe an' nae room tae brew enough o' it, or so Marleth will tell ye at length." } },
      choices = {
        { text = "And what do you think?", next = "think" },
        { text = "Something else.", next = "BACK" },
      },
    },
    think = {
      lines = { { id = "t_default", text = "I think a wise ale merchant drinks both an' praises whichever brewer's in the room. Between ourselves, though, I'd walk through a blizzard fer a Barleybrew stout, an' I'd only walk through light snow fer a Thunderbrew." } },
      choices = { { text = "A careful answer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wine = {
      lines = { { id = "w_default", text = "Aye, I ken, I ken. It comes up from the human lands fer the travellers who ask fer it, an' I sell it wi' a straight face, though I've never worked out what a body's meant tae do wi' a drink that has nae head on it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    talk = {
      lines = { { id = "ta_default", text = "That Rejold Barleybrew's off after some perfect stout again, an' that somethin' big has been at the fish Gretta Ganter leaves out on the ice. Tristane Shadowstone keeps walkin' out along the road as well, an' she'll no' tell anyone what she's lookin' fer." } },
      choices = { { text = "A quiet village, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came tae Brewnall fer one drink, a good many years back, an' I've no' quite finished it." } },
    frostmane = { { id = "tp_fm", text = "The trolls have a hold past the lake. They've never asked tae buy ale, which I take as proof they're savages." } },
    _none = { { id = "tp_none", text = "I've no' heard that one, an' I hear most things. Have a drink an' ask me again, it sometimes helps." } },
  },
}

-- Tristane Shadowstone: Brewnall Village; walks a little way down the road and comes back.
P:NPC {
  key = "tristane_shadowstone", id = TODO_NPC("Tristane Shadowstone"), name = "Tristane Shadowstone", gender = "female",
  bible = "bibles/missed_dunmorogh.md", role = "citizen", tier = "service",
  communities = { "dunmorogh" }, temper = { "watchful", "restless" }, values = { "neighbours", "caution" },
  notices = { "class", "weary" },
  impression = {
    first = "Tristane Shadowstone walks a little way down the road out of Brewnall Village, stops, looks at the hills, and walks back again. She has the air of a dwarf counting something she'd rather not lose track of.",
    third = "{name} met Tristane Shadowstone, who keeps an eye on the road out of Brewnall Village.",
  },
  greetings = {
    { id = "g_default", text = "Good day tae ye, {class}. Ye came in by the road, did ye? Then tell me, did ye see anythin' on it that shouldnae be there?" },
    { id = "g_back", when = { metBefore = true }, text = "Ye again, an' welcome. The road's been quiet since ye left, an' I've walked it enough times tae be sure." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ye're out late, {class}. I dinnae walk the road after dark myself, an' I'd think twice about it if I were ye." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Ye've a tracker's way o' lookin' at the ground. Good, for I'd value yer opinion on some prints I found by the bend." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tristane Shadowstone. I've nae shop an' nae post, but somebody in this village ought tae know what's comin' up the road before it arrives, an' the brewers never look up from their vats." },
      },
      again = {
        { id = "h_again", text = "Aye? Be quick, I'm due another look at the road." },
        { id = "h_again2", text = "What else would ye ask?" },
      },
      choices = {
        { text = "What are you watching for?", next = "watch" },
        { text = "You never go far before you turn back.", next = "far" },
        { text = "What prints did you find?", next = "prints", when = { class = "HUNTER" } },
        { text = "Keep a good watch.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Frostmane, first, for their hold's nae distance from here. After them it's wolves an' leopards in a hungry season, an' wendigo, which are meant tae keep tae their den but dinnae always.", fx = { learn = { "frostmane" } } } },
      choices = {
        { text = "Has the village no mountaineers?", next = "guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guards = {
      lines = { { id = "g_gu", text = "They come by on patrol, an' they're good lads, but they've all o' Dun Morogh tae cover an' the troggs keep them busy tae the east. So it's me an' my two eyes in between times." } },
      choices = { { text = "The village is lucky to have them.", next = "BACK", fx = { affinity = 1 } } },
    },
    far = {
      lines = { { id = "f_default", text = "Ye noticed that, did ye? I go as far as the bend, where I can see the whole slope, an' nae further, because a lookout who gets herself eaten is nae use tae anyone." } },
      choices = { { text = "That's good sense. Something else.", next = "BACK" } },
    },
    prints = {
      lines = { { id = "p_default", text = "Big ones, wi' claws, comin' down from the high ground toward the lake an' goin' back again. They're too broad fer a bear, tae my eye, an' the Ganters say somethin's been stealin' their catch off the ice." } },
      choices = { { text = "That sounds like a wendigo. Something else.", next = "BACK", reply = "It's what I feared, an' I'm glad tae hear a hunter say it. I'll tell Gretta tae keep her fish indoors." } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've lived in Brewnall long enough tae know every stone on that road, an' I'd know if one had moved." } },
    frostmane = { { id = "tp_fm", text = "Their hold's too close fer my likin'. I watch the hills fer their fires every evenin'." } },
    _none = { { id = "tp_none", text = "I couldnae say, I only know the road an' what walks on it. Ask Keeg Gibn, he collects gossip like casks." } },
  },
}

-- Gretta Ganter: fishing supplies, on the ice of Iceflow Lake. Wife of Paxton. Forever quest: Frosthowl.
P:NPC {
  key = "gretta_ganter", id = TODO_NPC("Gretta Ganter"), name = "Gretta Ganter", gender = "female",
  title = "Fishing Supplies",
  bible = "bibles/missed_dunmorogh.md", role = "vendor", tier = "quest",
  communities = { "dunmorogh" }, temper = { "brisk", "practical" }, values = { "kin", "thrifty" },
  notices = { "craft", "weary" },
  impression = {
    first = "Gretta Ganter sells hooks, line and bait from a camp on the ice of Iceflow Lake, wrapped in so many furs that only her nose and her opinions stick out. She runs the business while her husband Paxton watches his float.",
    third = "{name} met Gretta Ganter, who sells fishing supplies on the ice of Iceflow Lake.",
  },
  greetings = {
    { id = "g_default", text = "Mind the hole, {class}, it's deeper than it looks! Now, are ye here tae fish or only tae stand on our lake?" },
    { id = "g_active", when = { questActive = TODO_QUEST("Frosthowl") }, text = "Have ye been up tae the Grizzled Den yet? That beast still has my sack o' fish, an' I want it back before it's eaten the lot." },
    { id = "g_done", when = { questDone = TODO_QUEST("Frosthowl") }, text = "Here's the {class} who took my fish back from a wendigo! Paxton's still tellin' the tale tae every trout in the lake." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the ice, are ye? Ye've better balance than most who try it twice." },
  },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "Ye've line-cuts on yer fingers, so ye're one of us. Paxton will want tae talk yer ear off, an' I'll want tae sell ye a better hook." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_done", when = { questDone = TODO_QUEST("Frosthowl") }, text = "Gretta Ganter, an' business is good now that naethin' large an' white is helpin' itself tae my catch. I've started sleepin' through the night again." },
        { id = "h_default", text = "Gretta Ganter. I sell the tackle an' my husband Paxton teaches the fishin', an' between us we've fed half o' Brewnall through more winters than I'll admit tae." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? My feet are cold, so be quick about it." },
        { id = "h_again2", text = "Aye, go on, the fish can wait." },
      },
      choices = {
        { text = "Why fish out here on the ice?", next = "ice" },
        { text = "Something's troubling you.", next = "thief" },
        { text = "Tell me about your husband.", next = "paxton" },
        { text = "What bait do the fish take here?", next = "bait", when = { profession = "Fishing" } },
        { text = "Show me your tackle.", next = "END" },
      },
    },
    ice = {
      lines = { { id = "i_default", text = "Because this is where the fish are, {g:lad|lass}. The water under the ice is still an' cold, an' the fish lie fat an' slow in it, so ye cut a hole, drop a line an' wait." } },
      choices = {
        { text = "Does the ice ever give way?", next = "giveway" },
        { text = "Something else.", next = "BACK" },
      },
    },
    giveway = {
      lines = { { id = "gw_default", text = "No' in my lifetime, for Dun Morogh never thaws. It's what walks across the ice that worries me, for the Frostmane have a hold beyond the far shore an' the lake's nae barrier tae them.", fx = { learn = { "frostmane" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thief = {
      lines = {
        { id = "t_done", when = { questDone = TODO_QUEST("Frosthowl") }, text = "It was, an' ye settled it. The beast that took my fish will take nae more, an' I'll no' forget who saw tae that." },
        { id = "t_default", text = "Ye've sharp eyes. Somethin' came down off the hills in the night an' carried away a whole sack o' my fish, an' it left prints in the snow the size o' a shield." },
      },
      choices = {
        { text = "What leaves prints like that?", next = "wendigo", when = { ["not"] = { questDone = TODO_QUEST("Frosthowl") } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wendigo = {
      lines = { { id = "we_default", text = "A wendigo, an' I'd wager it's the big one the trappers call Frosthowl, out o' the Grizzled Den. They mostly keep tae their cave, but that one's learned there's an easy supper on our lake." } },
      choices = {
        { text = "It'll come back for more.", next = "more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    more = {
      lines = { { id = "m_default", text = "Aye, that's my fear exactly. A sack o' fish is a week's work, but next time it might find Paxton asleep at his line, an' he'd no' wake fer a wendigo any quicker than he wakes fer me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    paxton = {
      lines = { { id = "p_default", text = "He's the finest fisherman in Dun Morogh an' the worst shopkeeper, which is why I've the stall an' he's the pole. He'd give the hooks away fer a good story, bless him." } },
      choices = { { text = "You make a good pair. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    bait = {
      lines = { { id = "b_default", text = "Somethin' bright, for it's dim under the ice an' the fish are half asleep. Paxton swears by a wee bit o' red cloth on the hook, an' I've given up arguin' because it works." } },
      choices = { { text = "I'll try the red cloth. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I married a fisherman, so I learned tae sell fish. Somebody in the family had tae mind the coin." } },
    frostmane = { { id = "tp_fm", text = "They're across the lake. We see their fires some nights, an' we pack up early when we do." } },
    camping = { { id = "tp_ca", text = "Paxton's the one tae ask about fishin' an' campin'. He's a notion about fish bowls, of all things." } },
    _none = { { id = "tp_none", text = "If it doesnae swim, I've nae opinion on it. Ask in the village." } },
  },
}

-- Paxton Ganter: fishing trainer, Iceflow Lake. Husband of Gretta.
P:NPC {
  key = "paxton_ganter", id = TODO_NPC("Paxton Ganter"), name = "Paxton Ganter", gender = "male",
  title = "Fishing Trainer",
  bible = "bibles/missed_dunmorogh.md", role = "trainer", tier = "service",
  communities = { "dunmorogh" }, temper = { "placid", "dreamy" }, values = { "patience", "kin" },
  notices = { "craft" },
  impression = {
    first = "Paxton Ganter sits over a hole in the ice of Iceflow Lake with a line in his hand and no sign of ever wanting to be elsewhere. He speaks softly, so as not to trouble the fish.",
    third = "{name} met Paxton Ganter, who teaches fishing on the ice of Iceflow Lake.",
  },
  greetings = {
    { id = "g_default", text = "Hush now, an' walk soft, {class}. They can hear a heavy boot through the ice, an' I've one nibblin'." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "Ah, a fisher! Sit down by the hole, {g:lad|lass}, there's room fer two lines an' the fish willnae mind the company." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. I've caught four since ye left, an' lost one that I'll be thinkin' about all winter." },
  },
  notice = {
    { id = "n_impatient", cat = "craft", when = { class = { "WARRIOR", "ROGUE" } },
      text = "Ye've the look o' somebody who cannae sit still fer the length o' a pint. Fishin' would do ye a world o' good, {class}." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Paxton Ganter. I teach the fishin', an' my Gretta sells the tackle, an' she'll tell ye I'm the idle half o' the arrangement, which is true an' I'm content wi' it." },
      },
      again = {
        { id = "h_again", text = "Aye? Softly, mind, there's one circlin'." },
        { id = "h_again2", text = "What else, friend? I've naewhere tae be." },
      },
      choices = {
        { text = "What's the secret to ice fishing?", next = "secret" },
        { text = "Gretta says a beast stole her catch.", next = "beast" },
        { text = "Is a fisherman any use at a camp?", next = "camp", when = { profession = "Fishing" } },
        { text = "I'll leave you to your line.", next = "END" },
      },
    },
    secret = {
      lines = { { id = "s_default", text = "There's nae secret, only waitin'. Ye cut yer hole, ye drop yer line tae just above the weed, an' then ye think about naethin' at all until the float dips." } },
      choices = {
        { text = "Thinking about nothing sounds hard.", next = "nothing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nothing = {
      lines = { { id = "n_default", text = "It's the hardest part, an' it's the part I teach. Any dwarf can bait a hook, but it takes years tae sit by a hole in the ice an' no' wish ye were somewhere warmer." } },
      choices = { { text = "I'll practise. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    beast = {
      lines = {
        { id = "b_done", when = { questDone = TODO_QUEST("Frosthowl") }, text = "It did, an' I hear ye dealt wi' it. I slept through the theft an' I'd have slept through the rescue, so I'm obliged tae ye twice over." },
        { id = "b_default", text = "So she tells me, an' the prints were there in the mornin', right enough. I was asleep ten paces off an' never stirred, which Gretta has mentioned once or twice since." },
      },
      choices = { { text = "A sound sleeper, then. Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "c_default", text = "Oh, aye. Once ye've a bit o' skill I can show ye how tae keep a fish bowl at yer camp, an' ye'd be surprised how much it cheers tired folk tae watch a wee fish go round.", fx = { learn = { "camping" } } } },
      choices = { { text = "A fish bowl. I'll come back for that.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've fished Iceflow Lake since I was a lad, an' I've still no' caught the big one that lives under the east shelf." } },
    frostmane = { { id = "tp_fm", text = "The trolls fish the far side an' we fish this one. It's the only peace we've ever kept wi' them, an' naebody signed it." } },
    camping = { { id = "tp_ca", text = "A fish bowl by the fire does a camp good. I'll teach ye when ye've caught a few." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, I've been lookin' at this hole all day. Gretta will know, she knows everythin'." } },
  },
}
