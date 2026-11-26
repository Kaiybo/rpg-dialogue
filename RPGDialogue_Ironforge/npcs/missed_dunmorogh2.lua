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
        { id = "h_again_x0", when = { race = "Gnome" }, text = "Back at my bench, wee one? Dinnae touch anythin' till I've hidden the good tools." },
      },
      choices = {
        { text = "Dwarven engineering or gnomish?", next = "rival" },
        { text = "What comes through the Depot?", next = "depot" },
        { text = "Can engineering help me make camp?", next = "camp", when = { profession = "Engineering" } },
        { text = "You mended steam tanks in the war?", next = "tanks" },
        { text = "What does Beldin Steelgrill make of you?", next = "beldin" },
        { text = "Does an engineer need a miner?", next = "ore", when = { profession = "Mining" } },
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
    tanks = {
      lines = { { id = "xtanks_default", text = "Mended them, an' cursed them, an' once or twice slept under one fer the warmth. Ye learn more about an engine wi' a Horde catapult landin' beside ye than ye ever will at a bench." } },
      choices = {
        { text = "Do you miss those days?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      narr = "He turns the wrench over in his hands and stops tightening anything.",
      lines = { { id = "xmiss_default", text = "I miss the lads, no' the war. Half o' what I mended was built tae kill orcs, an' some nights I think on what else we might have made wi' all that iron an' all that cleverness." } },
      choices = {
        { text = "What should engineers build, then?", next = "build" },
        { text = "Something else.", next = "BACK" },
      },
    },
    build = {
      lines = { { id = "xbuild_default", text = "That's the argument at every engineers' table from here tae Tinker Town. Some say we build fer war, since the Horde's still out there an' the Dark Irons are closer, an' some say we build tae make folk's lives easier. Where do ye stand?" } },
      choices = {
        { text = "Build to help folk live. War has enough engineers.", next = "BACK", reply = "Aye, that's my own thinkin', most days. A good pump has saved more dwarves than any cannon.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Build for war. Our enemies aren't resting.", next = "BACK", reply = "I cannae argue wi' it, fer I've seen what comes over the hills when we're no' ready. Still, I'll teach ye tae build a toaster first.", fx = { align = { light = -1 } } },
      },
    },
    beldin = {
      lines = { { id = "xbeldin_default", text = "Beldin says I'm the loudest dwarf on his payroll an' the only one worth the noise. It's his depot, an' he runs it tight, but he lets me keep a cask under the bench, an' that's the mark o' a fair employer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ore = {
      lines = { { id = "xore_default", text = "Every engineer needs a miner, an' every miner thinks he's the more important o' the pair. Copper an' tin fer the bronze, an' a bit o' stone fer the blastin' powder, an' ye'll keep us both in business." } },
      choices = { { text = "Then we're partners.", next = "BACK", reply = "Ha! Aye, until the first thing blows up, an' then it's yer ore that was bad.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    second_war = { { id = "tp_xsecond_war", text = "I mended siege engines in the field while the Horde pressed on Khaz Modan. I'd no' do it again, but I'd no' undo it either." } },
    great_forge = { { id = "tp_xgreat_forge", text = "The Great Forge makes the parts an' I put them together wrong until I put them together right." } },
    background = { { id = "tp_bg", text = "I learned on the steam tanks in the Second War, an' I've been takin' things apart ever since tae see why they stopped." } },
    gnomeregan = { { id = "tp_gn", text = "A marvel, an' now a tomb full o' poison. The gnomes here dinnae like tae talk o' it, so I dinnae ask." } },
    camping = { { id = "tp_ca", text = "A proper camp wants a proper gadget in it. Come tae me when ye've some engineerin' behind ye." } },
    _none = { { id = "tp_none", text = "If it hasnae got gears in it, I'm nae use tae ye. Ask Beldin Steelgrill, it's his depot." } },
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
        { id = "h_again_x0", when = { profession = "Mining" }, text = "Back wi' more questions? Good, a miner who stops askin' is a miner who stops breathin'." },
      },
      choices = {
        { text = "Where should a new miner dig?", next = "where" },
        { text = "You were listening to the wall just now.", next = "listen" },
        { text = "Is a miner any use around a campfire?", next = "camp", when = { profession = "Mining" } },
        { text = "You said you've buried friends.", next = "buried" },
        { text = "Is there anything richer than copper here?", next = "rich" },
        { text = "My family were never miners.", next = "BACK", when = { race = "Dwarf" }, reply = "Then ye've a whole mountain o' catchin' up tae do, {g:lad|lass}. Pick up a pick, an' the stone will forgive yer kin." },
        { text = "What ore should a smith look for?", next = "smithore", when = { profession = "Blacksmithing" } },
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
    buried = {
      narr = "His hand goes still against the wall.",
      lines = { { id = "xburied_default", text = "Aye, two, in the one shaft, an' it's forty years ago an' I still hear it. We were followin' a vein o' tin deeper than we'd any right tae go, an' the roof gave a wee sigh before it came down." } },
      choices = {
        { text = "What did you learn from it?", next = "lesson" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson = {
      lines = { { id = "xlesson_default", text = "That the rock always tells ye first, if ye're listenin', an' that greed's louder than the rock. We heard the sigh an' we wanted one more cart, an' that was all it took." } },
      choices = {
        { text = "Some miners still dig deeper for richer ore.", next = "deeper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deeper = {
      lines = { { id = "xdeeper_default", text = "They do, an' the young ones especially, fer the deep seams pay an' the shallow ones dinnae. I teach them tae stop where the stone says stop, but there's a few who say the mountain only gives tae the bold. What would ye teach?" } },
      choices = {
        { text = "Stop where the stone tells you. No ore's worth a life.", next = "BACK", reply = "Aye, that's the lesson, an' I'd have ye carry it tae every miner ye meet. Thank ye fer hearin' it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Dig deep. The bold find the best seams.", next = "BACK", reply = "They do, an' some o' them find a cave-in. I'll pray ye're one o' the lucky ones, fer I've buried enough.", fx = { align = { order = -1 } } },
      },
    },
    rich = {
      lines = { { id = "xrich_default", text = "Tin, now an' again, though Loch Modan's better fer it, an' a thread o' silver if ye're very lucky an' very patient. Dun Morogh's a copper country, an' that's where every miner learns." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smithore = {
      lines = { { id = "xsmithore_default", text = "Copper an' tin both, fer bronze is what a young smith learns on, an' a smith who knows the ore makes better metal. Come an' ask me afore ye buy from a stranger, fer I can tell ye what's good by the colour." } },
      choices = { { text = "I'll bring you a sample.", next = "BACK", reply = "Do. I've never turned down a look at a good bit o' rock." } },
    },
  },
  topics = {
    great_forge = { { id = "tp_xgreat_forge", text = "Every bar that feeds the Great Forge came out o' somebody's shaft. I like tae remind the smiths o' that." } },
    explorers_league = { { id = "tp_xexplorers_league", text = "The League digs fer history, an' I dig fer ore. We both find troggs, it seems." } },
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
        { id = "h_again_x0", when = { class = "HUNTER" }, text = "Back from the hills, {class}? Show me what ye brought down." },
      },
      choices = {
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Is Brewnall a safe place to keep shop?", next = "safe" },
        { text = "How do you tan hides in this cold?", next = "tan" },
        { text = "Why do trappers come here for ale?", next = "trappers" },
        { text = "What armor suits someone who works quietly?", next = "quiet", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "I skin hides myself. Would you buy them?", next = "skin", when = { profession = "Skinning" } },
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
    tan = {
      lines = { { id = "xtan_default", text = "Slowly, an' wi' a great deal o' swearin'. The cold stops the hide rottin', which is a blessin', but it stops the tannin workin' as well, so it all takes twice as long as it would down in Loch Modan." } },
      choices = {
        { text = "Does the cold help at all?", next = "cold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold = {
      narr = "He rubs a strip of hide between thumb and finger as he talks.",
      lines = { { id = "xcold_default", text = "It gives a tougher hide, an' that's why Dun Morogh leather's prized from here tae Stormwind. A bear that's lived through a winter up here has skin like boot leather afore I've touched it." } },
      choices = {
        { text = "Do the trappers ever take too much?", next = "overhunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    overhunt = {
      lines = { { id = "xoverhunt_default", text = "Some seasons, aye, an' it's a quarrel among the trappers who come through here. Some say ye take only what the hills can spare, an' some say the hills are big an' the beasts are many. What's yer view?" } },
      choices = {
        { text = "Only take what the hills can spare.", next = "BACK", reply = "That's an old dwarf's thinkin', an' I'm glad tae hear it. There'll be bears next winter if we're careful wi' this one's.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Take what you can. Hunger doesn't wait for next year.", next = "BACK", reply = "Aye, I've heard that from a few trappers, an' some o' them are right hungry. But a hill that's empty feeds naebody.", fx = { align = { honor = -1 } } },
      },
    },
    trappers = {
      lines = { { id = "xtrappers_default", text = "Because there's nae ale like Barleybrew ale after a week in the snow, an' Brewnall's on the road down from the hills. They drink first an' sell their furs after, which is better fer me than fer them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    quiet = {
      lines = { { id = "xquiet_default", text = "Soft leather, oiled well an' laced tight, so naethin' creaks when ye move. I've a jerkin made from a leopard's belly that'll let ye walk across a tavern floor like a cat." } },
      choices = { { text = "That sounds like what I need.", next = "BACK", reply = "Have a look at the rack, then. I'll no' ask what ye need it fer." } },
    },
    skin = {
      lines = { { id = "xskin_default", text = "I buy from the trappers I know, mostly, but a clean hide's a clean hide. Take what ye skin tae any merchant fer the coin, an' if ye've somethin' fine, bring it here an' let me tell ye what it's worth." } },
      choices = { { text = "I'll show you my best.", next = "BACK", reply = "Do. I like tae see good work, even if I cannae always buy it." } },
    },
  },
  topics = {
    kharanos = { { id = "tp_xkharanos", text = "Kharanos has the bigger market, but Brewnall has the trappers. I'll stay where the hides come in." } },
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
        { id = "h_again_x0", when = { race = "Dwarf" }, text = "Back fer another, {g:lad|lass}? Have ye settled the Barleybrew question yet?" },
      },
      choices = {
        { text = "What's the quarrel with the Thunderbrews?", next = "feud" },
        { text = "A dwarf who sells wine?", next = "wine" },
        { text = "What's the talk of the village?", next = "talk" },
        { text = "What's Rejold Barleybrew after this time?", next = "rejold" },
        { text = "Who drinks here most?", next = "patrons" },
        { text = "Pour me another, Keeg!", next = "drunk", when = { drunk = true } },
        { text = "Night elves don't drink moonlight, you know.", next = "BACK", when = { race = "NightElf" }, reply = "No? Well, then I've been misinformed, an' I'll be glad tae see what ye do drink. Try the stout, an' sip it." },
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
    rejold = {
      lines = { { id = "xrejold_default", text = "The perfect stout, the same as always. He's sure there's a recipe somewhere that'll make the Thunderbrews weep intae their vats, an' he's been lookin' fer it fer as long as I've known him." } },
      choices = {
        { text = "Will he find it?", next = "find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    find = {
      lines = { { id = "xfind_default", text = "If anyone will, it's Rejold, fer he's stubborn as a ram an' twice as hard-headed. Mind, he says the Thunderbrews would steal it the moment he did, an' he's no' wrong about that." } },
      choices = {
        { text = "Who should win, the old name or the better recipe?", next = "winner" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winner = {
      lines = { { id = "xwinner_default", text = "Now that's the question every dwarf in Dun Morogh has an answer tae, an' none o' them agree. The Thunderbrews have the name an' the history, an' the Barleybrews have the better ale. Ye tell me." } },
      choices = {
        { text = "The Thunderbrew name has earned its place.", next = "BACK", reply = "Aye, it has, an' I'll no' argue wi' a thousand years o' ale. Just dinnae say it too loud in Brewnall.", fx = { align = { order = 1 } } },
        { text = "The better ale should win, whatever the name.", next = "BACK", reply = "Ha! A dwarf after my own heart, even if ye're no' a dwarf. Have a Barleybrew, an' tell Rejold I sent ye.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    patrons = {
      lines = { { id = "xpatrons_default", text = "Trappers, mostly, an' mountaineers on their days off, an' the odd adventurer who came fer one mug an' stayed fer three. The Barleybrews themselves dinnae drink much, fer they say they taste enough at work." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    drunk = {
      lines = { { id = "xdrunk_default", text = "Another? Ye've had a fair few already, by the look o' ye, an' I'd no' be a friend if I didnae tell ye tae sit down first. Water, then ale, an' then we'll see." } },
      choices = { { text = "Water it is.", next = "BACK", reply = "Good. Ye'll thank me in the mornin', or at least ye'll no' curse me." } },
    },
  },
  topics = {
    kharanos = { { id = "tp_xkharanos", text = "The Thunderbrews have the big distillery up in Kharanos. I'll no' say a word against it while their cousin's in the room." } },
    belm = { { id = "tp_xbelm", text = "Innkeeper Belm keeps a fine house in Kharanos. He pours Thunderbrew, which I forgive him fer." } },
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
        { id = "h_again_x0", when = { class = "HUNTER" }, text = "Ye're back, {class}. Any more prints on the road, or only mine?" },
      },
      choices = {
        { text = "What are you watching for?", next = "watch" },
        { text = "You never go far before you turn back.", next = "far" },
        { text = "What prints did you find?", next = "prints", when = { class = "HUNTER" } },
        { text = "Why does the road fall to you?", next = "why" },
        { text = "What do you do once it's dark?", next = "night" },
        { text = "I could walk the road with you a while.", next = "walk", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
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
    why = {
      lines = { { id = "xwhy_default", text = "My father was a mountaineer, an' he taught me tae watch a road the way other bairns are taught their letters. When his knees gave out, he moved down tae Kharanos, an' I stayed here wi' his habits." } },
      choices = {
        { text = "Is he well?", next = "father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      narr = "She smiles for the first time, then glances back down the road.",
      lines = { { id = "xfather_default", text = "Well enough, an' grumblin' about the ale in Kharanos as if Brewnall had spoiled him. He sends me letters askin' what I've seen, an' I write back an' tell him, an' he writes back tellin' me what I missed." } },
      choices = {
        { text = "Should Brewnall raise its own guard?", next = "militia" },
        { text = "Something else.", next = "BACK" },
      },
    },
    militia = {
      lines = { { id = "xmilitia_default", text = "My father says aye, every letter, that a village should arm its own an' no' wait on the King's mountaineers. The Barleybrews say the King's men are enough, an' they'd rather brew than drill. What do ye say?" } },
      choices = {
        { text = "Arm the village. You can't wait on help.", next = "BACK", reply = "That's my father's thinkin', an' mine, if I'm honest. I'll show the Barleybrews yer answer, though they'll only offer ye a drink.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Leave it to the mountaineers. That's their duty.", next = "BACK", reply = "Aye, an' they do it well, most days. I'll keep watchin' in between, as I always have.", fx = { align = { order = 1 } } },
      },
    },
    night = {
      lines = { { id = "xnight_default", text = "I bar my door an' sit by the window wi' a lamp, an' I listen. Ye can hear a wolf on the snow if ye're quiet, an' a troll if ye're very quiet, an' I've had years o' practice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    walk = {
      lines = { { id = "xwalk_default", text = "That's kindly offered, an' I'll take it as far as the bend. Ye watch the left side an' I'll watch the right, an' if we see anythin', we come straight back an' tell the brewers." } },
      choices = { { text = "Lead the way.", next = "BACK", reply = "Ye're a good sort, {class}. The road feels shorter wi' company.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    kharanos = { { id = "tp_xkharanos", text = "My father lives in Kharanos now. He writes tae ask about the road, an' I write tae tell him." } },
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
        { id = "h_again_x0", when = { profession = "Fishing" }, text = "Back on the ice, {g:lad|lass}? Sit an' fish, an' we'll talk between bites." },
      },
      choices = {
        { text = "What's the secret to ice fishing?", next = "secret" },
        { text = "Gretta says a beast stole her catch.", next = "beast" },
        { text = "Is a fisherman any use at a camp?", next = "camp", when = { profession = "Fishing" } },
        { text = "Tell me about the big one under the east shelf.", next = "bigone" },
        { text = "How did you meet Gretta?", next = "gretta" },
        { text = "How do you cook an Iceflow trout?", next = "cook", when = { profession = "Cooking" } },
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
    bigone = {
      lines = { { id = "xbigone_default", text = "She's longer than my arm an' greener than a Dun Morogh dawn, an' I've seen her twice in thirty years. Once in my youth, an' once last spring, when she came up an' looked at my float like it insulted her." } },
      choices = {
        { text = "Have you ever hooked her?", next = "hooked" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hooked = {
      narr = "He gazes at the hole in the ice as if it might answer.",
      lines = { { id = "xhooked_default", text = "Once, an' she took my line, my float an' very nearly me. Gretta found me lyin' on the ice laughin' like a fool, an' she's never let me forget it." } },
      choices = {
        { text = "What will you do if you catch her?", next = "catch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    catch = {
      lines = { { id = "xcatch_default", text = "That's the question I've been askin' myself fer thirty years. Gretta says mount her on the wall at the inn, an' I say she's earned her lake. What would ye do?" } },
      choices = {
        { text = "Let her go. Some things should stay wild.", next = "BACK", reply = "Aye, that's my thinkin', an' I'm glad tae hear it. Gretta will call us both soft, mind.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Mount her on the wall. Thirty years deserves a trophy.", next = "BACK", reply = "Ye sound like Gretta, an' she's usually right. Still, I'd miss the lookin' fer her.", fx = { align = { light = -1 } } },
      },
    },
    gretta = {
      lines = { { id = "xgretta_default", text = "She came out on the ice tae buy a fish from my father, an' she told him he'd overcharged her. He had, an' I married her within the year, fer I knew I'd need somebody who could count." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "xcook_default", text = "Gut her, salt her, an' put her on a hot stone by the fire till the skin crackles. Naethin' fancy, fer a fish that fresh doesnae need it, an' a dwarf who drowns a trout in sauce should be ashamed." } },
      choices = { { text = "Simple is best.", next = "BACK", reply = "Aye, simple an' fresh. Ye'll make a fine fisher yet.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    kharanos = { { id = "tp_xkharanos", text = "Gretta takes the catch up tae Kharanos fer the inn. I stay here, fer the fish dinnae come tae Kharanos." } },
    background = { { id = "tp_bg", text = "I've fished Iceflow Lake since I was a lad, an' I've still no' caught the big one that lives under the east shelf." } },
    frostmane = { { id = "tp_fm", text = "The trolls fish the far side an' we fish this one. It's the only peace we've ever kept wi' them, an' naebody signed it." } },
    camping = { { id = "tp_ca", text = "A fish bowl by the fire does a camp good. I'll teach ye when ye've caught a few." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, I've been lookin' at this hole all day. Gretta will know, she knows everythin'." } },
  },
}
