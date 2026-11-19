-- Aerie Peak's gryphon master and smith's supplier, and the gnome trader on the hill road. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "guthrum", id = TODO_NPC("Guthrum Thunderfist"), name = "Guthrum Thunderfist",
  title = "Gryphon Master",
  bible = "bibles/unsung.md", role = "flightmaster", tier = "service",
  communities = { "aerie_peak" }, temper = { "hearty", "proud" }, values = { "loyal", "brave" },
  notices = { "race", "mount", "lock_steed" },

  impression = {
    first = "He has little patience for anyone who calls his gryphons mounts.",
    third = "{name} met Guthrum Thunderfist, the gryphon master of Aerie Peak.",
  },

  greetings = {
    { id = "g_aerie", text = "The wind's off the mountains and the gryphons are keen! Where are ye bound?" },
    { id = "g_back", when = { metBefore = true }, text = "Back at the Peak! The birds were askin' after ye, in their way." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf of Ironforge, by yer braids. Ye'll find our birds fly a deal wilder than the ones yer people keep under the mountain, so hold on tight and don't shout at them." },
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Ye rode up here on that? Leave it at the foot of the Peak, friend; the gryphons think anything with four legs is supper." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Ye call that thing a mount, don't ye, wi' its hooves on fire an' its eyes like coals? A gryphon's no mount, it's a partner, an' I'll thank ye no' tae compare 'em." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Gladly, if ye treat 'em as comrades an' no' as mounts, an' I'd wager ye already do, for a shaman knows the wind's no' a servant. The Wildhammer were talkin' tae the sky before Ironforge ever looked up, an' it does my heart good tae see one o' ye finally lookin'." } },
      choices = {
        { text = "Comrades, always. I'd never treat one as a mount.", next = "BACK", reply = "Good, an' they'll know it the moment ye mount. A gryphon can smell a rider's heart.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A gryphon's a gryphon. It flies where I tell it.", next = "BACK", reply = "It'll fly where ye tell it, aye, until it decides tae drop ye in the Vilebranch's lap. Mind yer manners up there.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "We do, for the Hinterlands are wild an' we mean tae keep them that way. Ironforge would have tunnels under every hill if it could, an' a Wildhammer wants sky an' trees over his head; that's why we left in the first place." } },
      choices = {
        { text = "Then keep Ironforge out. The Hinterlands should stay wild.", next = "BACK", reply = "Aye, an' we will, as long as there's a Wildhammer wi' a hammer tae throw. The sky's no' for tunnellin'.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Ironforge is kin. Work with them, not against them.", next = "BACK", reply = "Kin, aye, an' I'll no' say otherwise in front o' strangers. But kin can still keep their shovels off our hills.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Aye, the grandsires o' these very birds, droppin' riders an' storm hammers on the Horde while the Alliance footmen held the ground below. A gryphon remembers a battle in its blood, an' ye'll feel it in the saddle when ye fly over the Vilebranch." } },
      choices = {
        { text = "Then I'll honour them by flying into the fight bravely.", next = "BACK", reply = "That's the way tae do it. Old Stormclaw went down over Jintha'Alor wi' his rider still swingin', an' every bird in the aerie screamed for him that night.", fx = { align = { honor = 1 } } },
        { text = "Gryphons are weapons of war, Guthrum. Nothing more.", next = "BACK", reply = "Weapons? Ye've never flown one, have ye? They'll teach ye different, an' quick.", fx = { align = { honor = -1 } } },
        { text = "Something else, Guthrum.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Depends on the beast an' the bird, same as people. A wolf they'll tolerate an' a cat they'll watch, but anythin' wi' feathers they'll fight, so if yer companion's an owl, keep it well away from the roost." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Depends on the beast an' the bird: a wolf they'll tolerate, a cat they'll watch, an' anythin' wi' feathers they'll fight. My birds are lookin' at {pet} already, so it's lucky they've eaten this mornin'." },
      },
      choices = {
        { text = "Beasts deserve respect, whether they carry us or hunt beside us.", next = "BACK", reply = "Aye, that's the Wildhammer way, an' ye'll find my birds agree.", fx = { align = { honor = 1 } } },
        { text = "A beast serves its master. Respect is for people.", next = "BACK", reply = "My birds'll disagree wi' ye at the first chance, an' they've sharp beaks. Watch yerself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Aye, an' gladly, though ye'll feel every wingbeat in yer spine. My birds have carried dwarves in plate tae Jintha'Alor an' back, an' they've a fondness for riders who stand their ground when the trolls start throwin' spears." } },
      choices = {
        { text = "Then I'll treat your birds as comrades, not mounts.", next = "BACK", reply = "Then ye'll fly well, plate an' all, an' my birds'll be proud tae carry ye.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A mount is a mount, however proud it is.", next = "BACK", reply = "Proud, aye, an' it'll show ye how proud on the first turn. Hold on tight.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Four this season, an' two birds besides, an' the Vilebranch hung the riders' harness on their walls for us tae see. The Wildhammer don't pray the way ye do in Ironforge or Stormwind, but we remember our dead, an' a priest's word over their names would no' go amiss." } },
      choices = {
        { text = "I'll speak their names to the Light, Guthrum.", next = "BACK", reply = "Bless ye. They'd want their names said, an' the birds too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Words won't bring them home. I'll avenge them instead.", next = "BACK", reply = "Aye, I'd like tae see that, an' so would every rider at the Peak. Bring back their harness, if ye can.", fx = { align = { light = -1 } } },
        { text = "Something else, Guthrum.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Always, an' they don't like it, but they're soldiers at heart an' they'll carry ye anyway, so long as ye don't bring yer wee friend on the saddle. Treat a Wildhammer gryphon wi' respect an' it'll fly through a storm for ye, an' treat it ill an' ye'll find out how far it is tae the ground." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Always, an' they don't like it, an' they like it even less wi' yer demon stood right here on the perch. They'll carry ye anyway, for they're soldiers at heart, but send the thing off before ye mount, or ye'll find out how far it is tae the ground." },
      },
      choices = {
        { text = "I'll treat your gryphons with respect, Guthrum.", next = "BACK", reply = "Good. They'll carry ye smoother for it, an' I'll sleep easier.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A beast is a beast. It'll carry me regardless.", next = "BACK", reply = "It will, aye, an' it'll remember ye. I've seen a bird wait three years tae nip a rider who kicked it once, an' it got him good.", fx = { align = { honor = -1 } } },
        { text = "Something else, Guthrum.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "An Ironforge dwarf who hears the wind! The gryphons'll fly ye gentler than most, {class}, for they know a friend o' the sky when one comes up the steps." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, an' in full plate! The birds'll grumble at the weight, {class}, but they've carried heavier, an' they're proud tae carry one o' the Light's own." },
        { id = "h_default", key = true,
          text = "Guthrum Thunderfist, and I keep the gryphons of Aerie Peak flyin'. The Wildhammer were ridin' these birds before Ironforge ever thought to tame one, and I'll send ye anywhere the wind can carry ye, so long as ye treat 'em with respect." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Ye've climbed a long way to be turned back, stranger, but no Wildhammer gryphon carries the Horde. Yer own lot keep wind riders with the trolls at Revantusk, down by the coast." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, an' ye still want a gryphon? Good, {class}, for I've never trusted a spell that drops ye in a city wi' no view on the way." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Ye walked up on my birds without a sound, {class}, an' that's a fine way tae lose a hand around here, for gryphons like tae see who's comin'." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, an' ye'll be wantin' tae fly tae the fightin', no doubt. My birds carried the Wildhammer intae the Second War, so they know a soldier when they see one." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Ye'll understand my birds better than most, then, for ye know a beast's a comrade an' no a saddle wi' feathers." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf druid! The gryphons don't take kindly tae shapechangers, so stay on two legs on the platform, if ye please." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! The birds'll carry ye gladly, {class}, an' I'll ask ye tae say a word for the riders who've no' come back from Jintha'Alor this season, for there's been more than I'd like." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Ye'll fly, {class}, for ye're Alliance an' that's the rule, but the birds'll know what ye are, so dinnae expect a smooth ride." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The birds are restless, and so am I." },
        { id = "h_again2", text = "Speak up, friend; the wind's loud up here." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "Wildhammer gryphons are different from Ironforge's?", next = "wild" },
        { text = "What can you see from the sky here?", next = "sky" },
        { text = "How do you raise a gryphon?", next = "raise" },
        { text = "I prefer my own feet on the ground.", next = "ground", when = { race = { "Gnome", "Human" } } },
        { text = "You must envy a mage's teleport, Guthrum.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could you fly me somewhere, no questions asked?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Will your gryphons bear a paladin's weight, Guthrum?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your gryphons look like they come from fighting stock, Guthrum.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your gryphons get along with a hunter's beast, Guthrum?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Wildhammer worry about the land, Guthrum?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "You must have lost riders to Jintha'Alor, Guthrum.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do gryphons always know what a warlock is, Guthrum?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would a Wildhammer gryphon carry an Ironforge shaman gladly, Guthrum?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Fair winds.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I fly ye where ye pay tae go, an' I don't ask why. But every rider at Aerie Peak knows every bird I send out, so if it's secrecy ye want, ye've picked the gossipiest roost in the Hinterlands." } },
      choices = {
        { text = "Then I'll trust your discretion, Guthrum.", next = "BACK", reply = "Good. Discretion's a rare thing, an' I'll keep yours if ye keep mine.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Gossip can be bought quiet. Everyone has a price.", next = "BACK", reply = "No' my riders, they cannae. Ye'll find the Wildhammer are poor at bein' bought.", fx = { align = { honor = -1 } } },
        { text = "Never mind. Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Envy? Ye blink tae Ironforge an' miss every peak an' river between. My birds carried the Wildhammer intae the Second War, an' there's no spell I'd trade for an hour on a gryphon's back." } },
      choices = {
        { text = "You're right. Some things shouldn't be shortcut.", next = "BACK", reply = "Aye, I am, an' it's good tae hear a mage say it. Fly wi' me once, an' ye'll understand.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "In war, a shortcut is just good sense.", next = "BACK", reply = "Good sense, maybe, but ye'll never see the Hinterlands like we do. That's yer loss.", fx = { align = { honor = -1 } } },
        { text = "Fair. Let me ask something else.", next = "BACK" },
      },
    },
    wild = {
      lines = {
        { id = "w_default", text = "Aye, as different as a wolf from a lapdog! Ironforge's birds are bred to carry passengers and do as they're told, but ours are raised alongside us from the egg, and they fight beside us like any warrior." },
      },
      choices = {
        { text = "You sound like you don't think much of Ironforge.", next = "wild_ironforge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wild_ironforge = {
      lines = {
        { id = "wi_default", text = "Ach, they're our kin, and I'll not speak ill of them in front of strangers. But they live under a mountain and we live on top of one, and that makes a difference to how a dwarf sees the world, if ye take my meaning." },
      },
      choices = {
        { text = "Kin should stand together, above or below.", next = "BACK", reply = "Aye, they should, an' when it matters, they do. I'll say no more.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The sky suits you better than any mountain hall.", next = "BACK", reply = "It does, an' I'll no' argue. Ironforge can keep its halls; I'll keep the clouds.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky = {
      lines = {
        { id = "s_default", text = "Troll fires in the hills, mostly, the Witherbark and the Vilebranch, and the smoke from Jintha'Alor rising to the east. The birds don't like flyin' over it, and I don't make them, because I've lost good riders to troll spears." },
      },
      choices = {
        { text = "Lost riders?", next = "sky_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky_lost = {
      lines = {
        { id = "sl_default", text = "Four this season, shot down over Jintha'Alor, and some of their birds came home alone. A gryphon whose rider doesn't come back won't eat for a week, and some of them never fly again." },
      },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "The trolls should pay for that.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    raise = {
      lines = {
        { id = "r_default", text = "From the egg, by hand, and ye don't leave its side for the first month. A gryphon remembers the face it saw first, and it'll follow that face into fire, which is the whole secret of the Wildhammer, if ye ask me." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    ground = {
      lines = {
        { id = "gr_default", text = "Ha! So did I once, when I was a lad, and then my da threw me on a gryphon's back and slapped its rump. I screamed the whole way to the valley, friend, but I've not wanted my feet on the ground since." },
      },
      choices = {
        { text = "Then I'll give it a try.", next = "BUSINESS", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born on the Peak, raised with the birds, and I'll die on the Peak, with any luck, somewhere near the roost." } },
    advice = { { id = "tp_ad", text = "Never stand downwind of a gryphon that's just eaten, friend. I lost a good cloak that way, an' most o' my dignity." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer gryphons are our comrades, not our mounts, and I'll not hear otherwise. I send them out and I welcome them back, every one." } },
    second_war = { { id = "tp_second_war", text = "My gryphons' grandsires flew in the Second War, and they were the terror of the Horde. I tell the young ones the stories, and they listen." } },
    magni = { { id = "tp_magni", text = "The Bronzebeards call their gryphons mounts, an' I'll never forgive them for it. Magni's a fine king otherwise, I'll grant him that." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye, friend. Ask Falstad's folk; they hear more than I do." } },
  },
}

P:NPC {
  key = "harggan", id = TODO_NPC("Harggan"), name = "Harggan",
  title = "Blacksmithing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "aerie_peak" }, temper = { "gruff", "grudging" }, values = { "practical", "honest" },
  notices = { "craft", "race", "lock_stones" },

  impression = {
    first = "Under the grumbling, he is proud to keep the Wildhammer forges lit.",
    third = "{name} met Harggan, who sells blacksmithing supplies in Aerie Peak.",
  },

  greetings = {
    { id = "g_shop", text = "Coal, flux and bars, hauled up the mountain on my own back, near enough. What d'ye need?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Well, the coal hasn't got any cheaper since ye left." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "Ye've soot under yer nails, so ye're a smith or a miner or both. Good, because I'm tired of selling flux to folk who think it's some sort o' pipeweed." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, all the way up here. If ye're after gears and springs, I've none; this is a forge shop, not a tinkerer's, so don't go poking at the bellows." },
    { id = "n_lock_firestone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "That stone in yer pack's glowin' hotter than my coal, an' I'd ask ye tae take it outside before it sets fire tae somethin'. I've enough trouble wi' the forge wi'out a warlock's ember in it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Never once, an' I've asked it nicely an' rudely an' every way between, but Fraggar says the earth only answers them that listen first. Ye've the knack o' listenin', by the look o' ye, so mebbe ye could put in a word for a tired old cart on a bad road." } },
      choices = {
        { text = "Hard work honours the earth more than any favour, Harggan.", next = "BACK", reply = "Fraggar says the same, an' I suppose he's right. I'll keep askin' anyway.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Next time, just steal a mule from the trolls.", next = "BACK", reply = "Steal a mule from the trolls? Ha! I'd lose an arm an' the mule both. Still, it's a thought.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some, aye, for every mine leaves a hole, and some leave a scar. But the Wildhammer mine less than Ironforge an' they put back what they can, an' I'd say we're kinder tae the hills than most." } },
      choices = {
        { text = "Kinder isn't kind enough. Mine less, Harggan.", next = "BACK", reply = "Less, aye, an' I'll try. But the Peak needs iron, an' iron doesnae grow on trees.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A town needs iron. A few holes are the cost.", next = "BACK", reply = "That's what I tell meself, an' most days I believe it. Fraggar gives me a look every time I bring a new cart up, though.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Hard as the road up, which is hard as a troll's skull, wi' Witherbark watchin' from the trees an' every cart half its weight in iron. The smiths say they cannae make enough armour for the riders, an' I say they cannae make it wi'out me, an' we both grumble about it." } },
      choices = {
        { text = "Your work matters as much as any warrior's. Be proud.", next = "BACK", reply = "Thank ye. It's good tae hear somebody say it, for the riders never do.", fx = { align = { honor = 1 } } },
        { text = "Hauling coal isn't fighting. Warriors earn the glory.", next = "BACK", reply = "Aye, they do, an' they'd have no hammers wi'out my carts. I'll remember ye said that.", fx = { align = { honor = -1 } } },
        { text = "Something else, Harggan.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Twice this season, an' both times they went for the mules first, which is cleverer than I'd like. A troll knows a cart wi'out a mule is just a pile o' iron sittin' in the road, waitin' for them tae come back." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Twice this season, an' both times they went for the mules first. Yer {pet} would make a fine guard for a cart, an' I'd pay it in scraps if ye'd lend it tae me, though I suppose ye wouldnae." },
      },
      choices = {
        { text = "I'll watch your road. Aerie Peak needs that iron.", next = "BACK", reply = "Bless ye. The mules'll thank ye too, if they live long enough.", fx = { align = { honor = 1 } } },
        { text = "I'll watch it, for a cut of the iron.", next = "BACK", reply = "A cut, is it? Ach, fine, a wee one, an' only if the carts make it up.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Few enough, for the Wildhammer keep their own ways an' don't hold wi' Ironforge's chapels. But the ones who come always need their plate mended after the trolls, an' they always pay fair an' say thank ye, an' I've yet tae hear that from a gryphon rider." } },
      choices = {
        { text = "A fair price for fair work. That's only right.", next = "BACK", reply = "That's how I do it, an' how I'll keep doin' it. Come back when yer plate needs mendin'.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Plate's plate. I'll pay what I have to.", next = "BACK", reply = "Then ye'll pay fair, same as everyone, an' I'll no' gouge ye.", fx = { align = { honor = -1 } } },
        { text = "Something else, Harggan.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It's a long climb wi' a sheer drop, an' the Witherbark watch it from the trees, an' last winter I lost a cart an' a good pony over the edge. The carters are brave lads, but brave doesnae keep a wheel on a ledge, so a word from the Light wouldnae hurt." } },
      choices = {
        { text = "I'll pray for them, Harggan, and ride the road myself.", next = "BACK", reply = "Bless ye. Ride it carefully, an' watch the trees.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't fix a road. Wider ledges would.", next = "BACK", reply = "Aye, they would, but the rock's too hard for wider. I've tried.", fx = { align = { light = -1 } } },
        { text = "Something else, Harggan.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I asked a Kirin Tor fellow once if he could send my iron up the mountain the way ye lot send yerselves about, an' he looked at me like I'd asked him tae carry it on his back. So it's carts an' ponies an' sweat for me, an' I'll leave the clever tricks tae the clever folk." } },
      choices = {
        { text = "Honest sweat built Aerie Peak. Nothing wrong with that.", next = "BACK", reply = "Aye, it did, an' I'm proud o' every cart. Thank ye.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "He could have done it. He just didn't care to.", next = "BACK", reply = "Maybe he could, an' maybe he couldnae. I'll never know, an' my back's paid for it.", fx = { align = { order = -1 } } },
        { text = "Something else, Harggan.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman from Ironforge, is it? If ye can ask the earth tae carry my carts up that mountain path, {class}, I'll be the first Wildhammer tae say Ironforge did somethin' useful." },
        { id = "h_default", key = true,
          text = "Harggan, blacksmithing supplies. Every bar of iron and every sack of coal in Aerie Peak came through my door, and most of it came up that mountain path on a cart that nearly went over the edge twice." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Ye smell o' sulphur, {class}, an' I'd know, for I've hauled enough brimstone up this mountain tae smell it in my sleep. Keep yer fires tae yerself an' we'll get on." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I saw yer eyes go tae my strongbox, {class}, an' I'll tell ye now it's empty, for every copper I have goes on haulin' coal up this mountain." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. That armour came from somebody's forge, an' that forge burned coal I hauled up this mountain, so ye're welcome, though ye didnae know tae thank me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If ye're headin' down the road, keep an eye on the treeline for me, for the Witherbark like tae watch my carts from cover." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid of the kaldorei. Ye'll not want iron, I'd guess, but if ye're after a hand axe for kindling, I've plenty." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. That plate didnae come cheap, {class}, an' it didnae come up this mountain on its own either, so I'll be lookin' it over the way a smith looks at another smith's handiwork." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Ye'll not be wantin' iron, I'd guess, {class}, but if ye've a prayer for the carters on the mountain road, I'll take one o' those instead." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Ye'll be no use tae me at the forge, {class}, unless ye can make coal out of thin air, an' I've yet tae meet a mage who could." },
      },
      again = {
        { id = "h_again", text = "What else, then?" },
        { id = "h_again2", text = "Out with it, friend; I've a delivery to check." },
      },
      choices = {
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "Why not mine the ore up here?", next = "ore" },
        { text = "Someone at the Peak must be buying all this iron.", next = "buyers" },
        { text = "The road up the mountain looks dangerous.", next = "road" },
        { text = "I'm a smith myself.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Does a warlock's custom bother the Wildhammer?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You must lose a good deal on that mountain path.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is it hard keeping the Wildhammer forges supplied, Harggan?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have the Witherbark ever attacked your carts, Harggan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the mining in these hills hurt the land?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does Aerie Peak get many paladins, Harggan?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is the mountain road so dangerous, Harggan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Magic could help you haul supplies, Harggan.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does the earth ever help with your hauling, Harggan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than I'd like, an' no all of it tae the edge. The Witherbark watch the road from the forest, an' a cart o' iron's worth more tae a troll than the dwarf drivin' it, so a {g:lad|lass} wi' quiet feet ridin' along would earn their keep." } },
      choices = {
        { text = "I'd guard your carts for honest coin.", next = "BACK", reply = "Honest coin for honest guardin', aye. I'll take ye up on it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Easier to rob the trolls before they rob you.", next = "BACK", reply = "Ha! Rob the robbers, is it? I like the sound o' that, though the Thane might no'.", fx = { align = { honor = -1 } } },
        { text = "Something else, Harggan.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It bothers them plenty, for they remember the Horde's demon fire over these hills, an' some o' them lost kin to it. If ye're buyin' from me, buy it quiet, an' don't summon anythin' in the shop." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It bothers them plenty, for they remember the Horde's demon fire over these hills, an' I can see two o' them through my window starin' at yer demon now. If ye're buyin' from me, buy it quick, an' take that thing back out the door wi' ye." },
      },
      choices = {
        { text = "Demon fire burned your hills. I won't forget that.", next = "BACK", reply = "Thank ye. Some o' the old riders will be glad tae hear it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fire is fire. The Horde just used it better.", next = "BACK", reply = "Better? Ye'll no' say that in front o' the riders, if ye want tae keep yer teeth.", fx = { align = { light = -1 } } },
        { text = "I'll mind my manners. Something else.", next = "BACK" },
      },
    },
    ore = {
      lines = {
        { id = "o_default", text = "Because the Peak's good rock but poor ore, friend, and the good seams in the Hinterlands are in troll country. A dwarf who goes digging near Witherbark land comes home with an arrow in him, or doesn't come home at all." },
      },
      choices = {
        { text = "Someone should clear the trolls out.", next = "BACK", reply = "Aye, someone should, an' the riders try. But trolls are stubborn as stone.", fx = { align = { light = -1 }, trait = { brave = 1 } } },
        { text = "Better to trade with them than fight for it.", next = "BACK", reply = "Trade wi' trolls? I'd like tae see it. Ye'd need a braver merchant than me.", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "The armorers, mostly, for the gryphon riders' gear, and the stormhammer-makers, who are pickier than any customer I've ever had. A Wildhammer's hammer has to fly true and come back, and that takes the best iron I can find." },
      },
      choices = {
        { text = "Hammers that come back?", next = "buyers_hammers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_hammers = {
      lines = {
        { id = "bh_default", text = "Well, not on their own, mind ye, but a Wildhammer throws them true enough that it looks that way from below. Ask any of the riders to show ye; they'll be glad to, and ye'll be glad ye're standing behind them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    road = {
      lines = {
        { id = "r_default", text = "Steep, and worse in the rain, and the owlbeasts in the valley like to come and have a look at the carts. I've lost one load of coal to a broken axle and another to an owlbeast that sat on it, and I'm still not sure which annoyed me more." },
      },
      choices = {
        { text = "So an owlbeast sat on your coal.", next = "road_owl" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_owl = {
      lines = {
        { id = "ro_default", text = "Sat on it, ate some of it, and then wandered off looking very sorry for itself. Ye'd think the beast would learn, but they never do, and neither do I, because I keep driving that road." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    smith = {
      lines = {
        { id = "s_default", text = "Then ye'll want the good flux, not the cheap stuff they sell in the lowlands. The air's thin up here and the forges burn hotter, so a smith who doesn't adjust ends up with brittle steel and a bad name." },
      },
      choices = {
        { text = "Thanks for the advice.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've been hauling iron up this mountain since my beard was short. It's a living, and I'm too stubborn to change it." } },
    advice = { { id = "tp_ad", text = "Buy yer coal in the summer, friend. In the winter the path freezes, the mules sulk, an' the price doubles." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer forges need coal an' iron, an' I haul it up the mountain. It's hard work, but somebody has tae keep the fires lit, an' the riders certainly won't." } },
    magni = { { id = "tp_magni", text = "The Bronzebeards have mines right under their mountain, an' I'd give my beard for one. Haulin' it all up from the valleys is no work for a dwarf." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay buys iron from the south, they say, and sells it for twice the price. I'd sell to them, if they'd fly up here to fetch it." } },
    _none = { { id = "tp_none", text = "Don't know, an' I've no time tae find out. Ask at the inn; Thulfram hears everythin'." } },
  },
}

-- Gigget Zipcoil: gnome trade supplies vendor camped by the road northeast of Quel'Danil Lodge. Neutral.
P:NPC {
  key = "hl_gigget", id = TODO_NPC("Gigget Zipcoil"), name = "Gigget Zipcoil", title = "Trade Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "hinterlands_road" }, temper = { "bright", "brisk" }, values = { "trade", "curious", "brave" },
  notices = { "craft", "race", "class" },

  impression = {
    first = "Gigget Zipcoil sells trade supplies from a small camp in the Hinterlands hills, to anyone of either side who walks up. She has worked out the odds of being eaten out here to two decimal places and decided they are acceptable.",
    third = "{name} met Gigget Zipcoil, a gnome who sells trade supplies from a roadside camp in the Hinterlands.",
  },

  greetings = {
    { id = "g_default", text = "Oh, a customer! Splendid. Thread, vials, flux, dye and fishing poles, all sorted by weight and then by colour." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! That makes you a repeat customer, and my repeat rate just went up by a whole percentage point." },
    { id = "g_craft", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing", "Engineering", "Alchemy" } }, text = "A crafter, I can tell by the hands! Do look, I have nearly everything, and a list of what I haven't." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Still open! I don't close, strictly speaking, because the wolves don't either." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another gnome, out here! Oh, that's wonderful. Do you know, you're the first person in a month I haven't had to look straight up at." },
    { id = "n_horde", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Horde coin spends exactly as well as Alliance coin, I've tested it, so please don't loom. Looming makes me miscount." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Is that a gyrochronatom in your pack? No, don't tell me, I'll only want to take it apart." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker. I have a pattern you'll want to see, for shoulders, with feathers. I don't understand it, but people who do get very excited." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gigget Zipcoil, trade supplies! I set up here because there are crafters in these hills on both sides, and not one shop between Aerie Peak and the coast, which is what we call an underserved market." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Gigget Zipcoil, trade supplies! You'll be from the Peak, or bound for it. Do tell Nioma I am not undercutting her on purpose, it's simply that my overheads are a tent." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Gigget Zipcoil, trade supplies! You're with the Revantusk on the coast, I expect, and not the ones in the ruins. I can tell because you haven't thrown anything, and I do appreciate it." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? I do like questions." },
        { id = "h_again2", text = "Go on! I've nobody to talk to out here but the mule, and she's a poor conversationalist." },
        { id = "h_again3", text = "Yes? Ask away, I can talk and take inventory at the same time, within a small margin of error." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "This is a dangerous place for a shop.", next = "danger" },
        { text = "You sell to the Horde and the Alliance alike?", next = "sides" },
        { text = "Who are your neighbours out here?", next = "neighbours" },
        { text = "What's a gnome trader's life, since Gnomeregan?", next = "x_gnome", when = { race = "Gnome" } },
        { text = "You mentioned a pattern with feathers.", next = "x_lw", when = { profession = "Leatherworking" } },
        { text = "What sells best to people like me?", next = "x_craft", when = { profession = { "Tailoring", "Blacksmithing", "Engineering", "Alchemy" } } },
        { text = "Good trading, Gigget.", next = "END" },
      },
    },
    danger = {
      lines = {
        { id = "dg_default", text = "Oh, measurably! There are wolves, owlbeasts, three separate tribes of trolls and a lodge full of elves who shoot at everyone. But I've kept a tally, and since nobody wants to drive off the only shop for miles, I'm attacked far less often than you'd predict." },
      },
      choices = {
        { text = "And when you are attacked?", next = "danger_when" },
        { text = "You're braver than you look.", next = "danger_brave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_when = {
      lines = {
        { id = "dw_default", text = "Then I have a very loud whistle, a mule who kicks, and a small device under the counter that I'd rather not describe. It has only gone off once, and the tent was the wrong colour for a week afterwards, but the wolf did leave." },
      },
      choices = {
        { text = "I won't ask to see the device.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_brave = {
      lines = {
        { id = "db_default", text = "That's kind, though I think it's mostly arithmetic. A shop in Ironforge has forty competitors and no wolves, and a shop here has no competitors and some wolves. When I ran the figures, the wolves came out cheaper." },
      },
      choices = {
        { text = "Only a gnome would price a wolf.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sides = {
      big = true,
      lines = {
        { id = "sd_default", text = "I do. The Wildhammer buy thread and salt, the Revantusk buy dye and fishing line, and neither asks who else has been by. I did wonder at first whether it was quite right, selling flux to people who might make axes of it for use on my other customers." },
      },
      choices = {
        { text = "Trade keeps both sides fed. There's no wrong in it.", next = "BACK", reply = "That's where I came out too, after some thought. A needle doesn't take sides, and I try to be at least as sensible as a needle.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A trader should stand with her own people.", next = "BACK", reply = "Perhaps she should. But my own people lost their city, and I learned then that a full strongbox is the only wall I can build. I'll keep both doors open.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = {
        { id = "nb_default", text = "Quel'Danil Lodge is just down the hill to the southwest, and I don't go near it, because the elves there are not buying. Aerie Peak is west, the Revantusk are east on the shore, and somewhere south of here a dwarf called Shindigger is brewing something I can smell when the wind turns." },
      },
      choices = {
        { text = "The elves won't trade at all?", next = "neighbours_elves" },
        { text = "Do you trade with Shindigger?", next = "neighbours_brew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours_elves = {
      lines = {
        { id = "ne_default", text = "I walked down once with samples and a very polite sign. An arrow went through the sign, exactly in the middle of the word 'welcome', which I took as a considered reply. I've marked them in my ledger as 'not at present'." },
      },
      choices = {
        { text = "A wise entry. Leave it at that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours_brew = {
      lines = {
        { id = "nbr_default", text = "He buys vials from me by the dozen and returns none of them, so I assume the product is popular or the vials are dissolving. I haven't tried it. I need all of my faculties for the bookkeeping." },
      },
      choices = {
        { text = "From what I hear, that's the right decision.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_gnome = {
      lines = {
        { id = "xg_default", text = "Portable! We all learned that, didn't we? I had a proper shop with shelves on the third tier, and I left it with one bag when the alarms went. Now everything I own folds, and I can be packed and moving in eleven minutes." },
      },
      choices = {
        { text = "We'll have shelves again, in our own city.", next = "x_gnome_home" },
        { text = "Eleven minutes is a fine time.", next = "x_gnome_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_gnome_home = {
      lines = {
        { id = "xgh_default", text = "I've drawn the shop I'll open when Gnomeregan is clean again, to scale, with a counter at a sensible height. Until the High Tinker says it's time, I'll sell thread on a hillside and keep the drawing dry." },
      },
      choices = {
        { text = "Keep it dry, Gigget. You'll need it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_lw = {
      lines = {
        { id = "xl_default", text = "Ironfeather shoulders! It calls for feathers off the big owlbeasts up here, which is why I stock it here and not somewhere safe. I'm told the result is very fine, and that collecting the feathers is the difficult step." },
      },
      choices = {
        { text = "Let me see the pattern.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_craft = {
      lines = {
        { id = "xc_default", text = "Out here? Whatever you ran out of yesterday. Nobody plans to buy thread in the Hinterlands, they simply find themselves a long way from a city with a hole in something. I stock for emergencies, and I price for them only a little." },
      },
      choices = {
        { text = "Honest of you to admit the little.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    quel_danil = { { id = "tp_qd", text = "The elves' lodge, down the hill. They aren't friendly to anyone at present, me included, so I'd walk around it." } },
    _none = { { id = "tp_none", text = "Oh, I don't have data on that, I'm afraid. I could guess, but I'd rather not sell you a guess." } },
  },
}
