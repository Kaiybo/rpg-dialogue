-- More of Booty Bay: the flight masters, the banker and the shopkeepers of the cove. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "gyll", id = TODO_NPC("Gyll"), name = "Gyll",
  title = "Gryphon Master",
  bible = "bibles/stranglethorn.md", role = "flightmaster", tier = "service",
  communities = { "booty_bay" }, temper = { "dry", "steady" }, values = { "practical" },
  notices = { "race", "weary" },

  impression = {
    first = "Gyll keeps the Alliance gryphons on a cliff ledge above a pirate harbor and seems to find that perfectly normal. Gryphons and pirates, Gyll says, both bite if you look at them wrong.",
    third = "{name} met Gyll, who keeps the Alliance gryphons on the cliffs of Booty Bay.",
  },

  greetings = {
    { id = "g_ledge", text = "Gryphons for the Alliance, this side of the ledge. Wind riders are round the other side, and we don't mix the birds." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the cove? The birds were starting to miss the weight." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, good; you'll know to hold the harness and not the feathers. Half my passengers grab the feathers, and then the bird sulks for a week." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You're green round the edges. Sit down a moment before you climb up, because if you're sick over the jungle, the bird will never let you forget it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They sense storms coming off the sea a day before the Baron does, so aye. Booty Bay's a goblin town, and goblins would sell the weather if they could catch it, so I'd keep your spirits close." } },
      choices = {
        { text = "The weather isn't for sale, whatever goblins think.", next = "BACK", reply = "Aye, ye'd think so, but the Baron's tried, and he's charged the sailors for it besides. The birds just laugh at him and tuck their heads under.", fx = { align = { honor = 1 } } },
        { text = "If goblins want to buy the weather, I'd sell it.", next = "BACK", reply = "Ha! Then ye'd be the richest shaman on the coast, and the goblins would build ye a balcony. Mind they don't sell the thunder back tae ye at a markup.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Wildhammer do, up in the Hinterlands, flinging storm hammers from the air, but our birds are couriers, not warbeasts. Still, a gryphon will defend its rider if it's cornered, and that's a fight you don't want to be on the wrong side of." } },
      choices = {
        { text = "Couriers should stay couriers. War beasts need proper training.", next = "BACK", reply = "Right ye are, and the Wildhammer spend years on it wi' every bird. Mine are built for letters and lords, no' for storm hammers.", fx = { align = { order = 1 } } },
        { text = "I'd ride a gryphon into battle if it would carry me.", next = "BACK", reply = "It'd carry ye, aye, straight intae the nearest tree and out the other side. Leave the war birds tae the Wildhammer and keep yer neck.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Young and patient, with a lot of fish and a heavy glove, and you never once let it think it's won a fight with you. A gryphon remembers every slight for years, which I'd guess your own beasts have taught you too." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Young and patient, with a lot of fish and a heavy glove, and you never once let it think it's won a fight with you. A gryphon remembers every slight for years, which I'd guess your own beasts have taught you too. Keep {pet} back from the ledge, though, because my birds see anything with four legs and fur as a snack that's walked itself over." },
      },
      choices = {
        { text = "A beast needs firm rules, or it never trusts you.", next = "BACK", reply = "Aye, that's it exactly, and the birds respect ye for it. Firm and fair, an' plenty o' fish, and ye'll have a friend for life.", fx = { align = { order = 1 } } },
        { text = "A beast should stay half wild. That's its strength.", next = "BACK", reply = "Half wild's fine in the hills, but it's a poor thing on a courier route. Mine have tae land where they're told, no' where they fancy.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They dislike anyone who startles them, and rogues startle them worst of all, since you never make a sound until you're right beside them. Walk up loud and slow, and they'll carry you anywhere you like, even over a pirate harbor." } },
      choices = {
        { text = "I'll walk up loud and slow, then. Respect the beasts.", next = "BACK", reply = "That's all I ask, and the birds'll thank ye wi' fewer bites. Clear yer throat a good ways off and they'll settle.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A gryphon should learn not to startle.", next = "BACK", reply = "Ye try teaching that to a gryphon, and I'll sell tickets. They've been startling at shadows since the titans made 'em.", fx = { align = { order = -1 } } },
        { text = "Something else, Gyll.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Now and then, mostly the young ones who haven't learned to teleport yet, and they spend the whole flight clutching their hats. I tell them the gryphons are smarter than they look, and the gryphons seem to agree with me." } },
      choices = {
        { text = "I'll take the gryphon. Teleporting isn't everything.", next = "BACK", reply = "Good, and ye'll see the coast as the birds see it, which no portal gives ye. Mind yer hat over the bay.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll teleport. Gryphons are for those without better options.", next = "BACK", reply = "Then off ye pop, and the birds won't miss ye. Better options, says you, as if a gryphon weren't the finest ride in the world.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More often than I'd like, and I fly them as fast as the birds will go, because the jungle's fevers don't wait on anybody. I've lost a few on the way, which I don't like to talk about, and the birds always seem to know before I do." } },
      choices = {
        { text = "They died on the way home. The Light knows the difference.", next = "BACK", reply = "I hope so, priest, I truly do. I fly them as fast as the wings'll go, and it's never quite fast enough.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You can't save everyone. Keep the birds flying.", next = "BACK", reply = "Aye, that's what I tell myself at night, and it helps a wee bit. The birds keep flying, and so do I.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not much, because the goblins don't care whose bird is whose as long as the fees are paid, and I'd sooner pay a goblin than fight a Bloodsail, aye. Gringer keeps his wind riders on the same ledge, and we get along fine, mostly because our beasts would kill each other if we didn't." } },
      choices = {
        { text = "Deal fairly with Gringer. The truce here deserves respect.", next = "BACK", reply = "I do, and so does he, mostly, though our birds had a scrap last spring and the Baron fined us both. A truce is a truce, even when it's a grumpy one.", fx = { align = { honor = 1 } } },
        { text = "Be friendly with Gringer, and mind what he overhears.", next = "BACK", reply = "Mind what he overhears, aye, and he minds what I do. It's a fine friendship, as long as nobody's listening.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only the ones that smell like cats, which is half of you, I'm told. A druid in bird form flew alongside my birds once, all the way up the coast, and they sulked for a week, off their fish, because something kept up with them." } },
      choices = {
        { text = "Your birds deserve better than fish. Speak to the Baron about it.", next = "BACK", reply = "I've asked, and the Baron asked for a fee to consider it. The birds'll eat fish till the sea runs dry, I expect.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They eat what's cheap, like everyone in Booty Bay. That's fair.", next = "BACK", reply = "Cheap's the Booty Bay creed, and the birds have learned it too. They've no' complained, at least no' in words.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They'll carry you, but they'll grumble the whole way, because a gryphon knows what's been near you and doesn't care for it. Dismiss your demon before you mount, keep a light hand on the reins, and the bird will take you north without any trouble at all." } },
      choices = {
        { text = "I'll dismiss it. Your birds deserve that courtesy.", next = "BACK", reply = "That's decent o' ye, and the birds'll notice. A gryphon remembers kindness as well as it remembers a grudge.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon goes where I go, Gyll.", next = "BACK", reply = "Then it'll ride in yer lap and the bird'll fly crooked the whole way. Don't say I didn't warn ye when ye land in the bay.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Keep your demon well back from the ledge, please, because a gryphon that smells one will try to throw its rider into the cove, and I've had to fish two out already." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Flying north, I hope, because the birds are restless today and a calm passenger settles them better than any treat, though they'd tell you they want something other than fish." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The birds like a rider in plate, strange as it sounds, because it sits them steady, though your armor will smell of fish by the time you land." },
        { id = "h_default", key = true,
          text = "Gyll, gryphon master. I fly Alliance folk out of Booty Bay to the north, and I keep my birds fed on fish, which they hate, because the Baron charges a fortune for anything else." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "These are Alliance birds, friend, and they'll not carry you. Your wind riders are round the other side of the ledge, and the walk does you good." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue, eh? The gryphons can smell a sneak at fifty paces, so don't go creeping up on them, or you'll find out what a gryphon's beak feels like." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! You'll be wanting to teleport home, I suppose, but the gryphons are a lot more fun, and they don't leave you dizzy for an hour after." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Believe it or not, gryphons like a heavy rider, because the weight steadies them in the sea wind, so you'll have a calm flight north." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, I'd know the look anywhere, because you're eyeing my gryphons the way I eye a fine animal and not the way a passenger does." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf druid on my ledge! My gryphons like you, and they've nipped three travelers this week alone, so don't ruin it by turning into anything they'd want to eat." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! My gryphons don't care much for pirates, but they'll sit still for you, which is more than they do for me." },
      },
      again = {
        { id = "h_again", text = "Anything else? The gryphons hate this salt air, so let's not keep them waiting." },
        { id = "h_again2", text = "Ask away. The birds are digesting." },
      },
      choices = {
        { text = "Show me the routes.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "Gryphons and wind riders, side by side?", next = "neighbors" },
        { text = "The birds can't care much for this jungle heat.", next = "heat" },
        { text = "Your birds could carry me, couldn't they?", next = "x_horde", when = { faction = "Horde" } },
        { text = "Do your gryphons really dislike rogues, Gyll?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do mages ever fly your gryphons, Gyll?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do your gryphons ever carry the wounded north, Gyll?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does keeping Alliance birds in a goblin town trouble you?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'd guess gryphon riders fight from the saddle sometimes, Gyll.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How do you train a gryphon to carry riders, Gyll?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your gryphons fear shapeshifters, Gyll, or only the ones that smell wrong?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Will your gryphons really carry a warlock, Gyll?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your gryphons sense the spirits, Gyll?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },
    neighbors = {
      lines = {
        { id = "n_default", text = "Side by side and not a feather's width closer. The Baron says this is a neutral port, so it is, and both of us pay him for the ledge and both of us pretend the other isn't there." },
      },
      choices = {
        { text = "I'd guess it comes to blows now and then.", next = "neighbors_blows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbors_blows = {
      lines = {
        { id = "nb_default", text = "Once, over a fish, between the birds and not the masters. The Bruisers fined us both, and Gringer and I have been very polite to each other ever since." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    heat = {
      lines = {
        { id = "ht_default", text = "They pant like dogs from noon till sunset, so I fly them early and late and keep wet sailcloth over the perches. A gryphon wasn't built for this coast, but then neither was I." },
      },
      choices = {
        { text = "You both manage, though.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_horde = {
      lines = {
        { id = "xh_default", text = "They could, but they won't, and I'll not ask them to. A gryphon knows who it's carrying, and you'd end up in a tree somewhere north of the Vile Reef wondering what went wrong." },
      },
      choices = {
        { text = "Wind riders it is, then.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I flew birds out of the north until someone offered better pay to fly them out of a pirate cove. I'm still deciding if it was worth it." } },
    advice = { { id = "tp_ad", text = "Fly out at dawn. By noon the air off the jungle is thick enough to swim in." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the strangest flight path I've ever run, pal, with Alliance gryphons on one side and Horde wind riders on the other. Nobody fights, though, because nobody wants to explain it to the Baron." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer taught every gryphon master I ever learned from, and they still do it better than any of us. I'd give a year's pay to see the Aerie at Aerie Peak." } },
    magni = { { id = "tp_magni", text = "King Magni's a fine ruler, from what I hear, though I've never set foot in Ironforge myself. The gryphon roosts there are famous, mind." } },
    theramore = { { id = "tp_theramore", text = "The Theramore route's a long flight over open sea, and the gryphons hate it. I always send extra feed with anybody going that way." } },
    _none = { { id = "tp_none", text = "Ask somebody with their feet on the ground. I spend mine looking up." } },
  },
}

P:NPC {
  key = "gringer", id = TODO_NPC("Gringer"), name = "Gringer",
  title = "Wind Rider Master",
  bible = "bibles/stranglethorn.md", role = "flightmaster", tier = "service",
  communities = { "booty_bay" }, temper = { "gruff" }, values = { "practical", "loyal" },
  notices = { "race" },

  impression = {
    first = "Gringer keeps the Horde's wind riders on the same ledge as the Alliance gryphons and has opinions about both. The beasts seemed to trust him more than he trusts anybody.",
    third = "{name} met Gringer, the wind rider master of Booty Bay.",
  },

  greetings = {
    { id = "g_ledge", text = "These wind riders carry the Horde and nobody else, pal, fare up front. Stand clear of the tails, because the stingers aren't for show and I don't cover the healer's bill." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, the beasts like a familiar smell, and I like a familiar purse." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Big one, aren't you? The riders will carry you, but they'll groan about it the whole way to Grom'gol, so don't take it personally, and don't ask me for the light-rider rate." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They mind everything, and the gryphons on the next ledge mind you even more, since they've carried paladins and never one who smelled like you. Pay your fare and don't feed them, pal, and they'll carry you like anyone else." } },
      choices = {
        { text = "Fare's paid, and I'll keep my crumbs to myself.", next = "BACK", reply = "Good. Crumbs bring gulls, and gulls bring trouble.", fx = { align = { order = 1 } } },
        { text = "Rules are for the living, Gringer. I'll fly how I like.", next = "BACK", reply = "Fly how you like, and the beast will drop you how it likes. The living and the dead fall the same speed.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because you're all used to charging, and you sit on a beast like you mean to ride it through a wall. A wind rider will throw anybody who fights it, and a thrown rider's no refund, so hold on, keep your heels quiet, and let the beast do the flying." } },
      choices = {
        { text = "Heels quiet and hands tight. I can manage that.", next = "BACK", reply = "Good. Quiet heels, tight hands, and you'll land where you meant to.", fx = { align = { order = 1 } } },
        { text = "A beast should learn who's in charge. I'll ride how I like.", next = "BACK", reply = "Then the beast will teach you who's in charge, halfway over the swamp. I'll send a grunt to find what's left.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because a fed wind rider is a lazy wind rider, and a lazy one lands in the swamp halfway to Stonard, and then I'm paying somebody to fetch it. They eat what I give them when I give it, and they fly the faster for being a little hungry." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because a fed wind rider is a lazy wind rider, and a lazy one lands in the swamp halfway to Stonard. They eat what I give them when I give it, and they fly the faster for being a little hungry. That goes for {pet} too, so don't let it beg off my birds, because they'll share nothing and take a bite of it for asking." },
      },
      choices = {
        { text = "Keeping beasts hungry is cruel. I'd feed them well.", next = "BACK", reply = "Fed beasts land in the swamp, and then nobody eats. Lean is kinder than drowned.", fx = { align = { light = 1 } } },
        { text = "Hunger keeps a beast sharp. You're right to keep them lean.", next = "BACK", reply = "You understand beasts, then. Hunger makes them fly true and land quick.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The Bloodsail have taken to firing their swivel guns at anything with wings, and a rider can't dodge grapeshot, and a good rider costs more than the Bloodsail's whole ship. The Alliance gryphons get it too, round the other side of the ledge, but I'll not lose sleep over it." } },
      choices = {
        { text = "Good. Let them waste their shot on gryphons.", next = "BACK", reply = "Better gryphons than my riders, I won't lie. But a Bloodsail shot doesn't care whose bird it hits.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Gryphon or wind rider, no beast deserves grapeshot.", next = "BACK", reply = "No beast deserves it, and I'd say so to the Bloodsail's face if I could reach them. My riders fly high and pray low.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The storms off the sea come up fast, and a wind rider caught in one comes down where it likes, which is never anywhere good. I lost a rider over the Vile Reef last season, a whole season's profit in one beast, and I can still hear it screaming." } },
      choices = {
        { text = "I'll ask the air spirits to calm the coast for your riders.", next = "BACK", reply = "If the spirits listen to you, then my riders will thank you. They never listen to me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Riders die. The wind doesn't care, and neither should you.", next = "BACK", reply = "I care because I count them, shaman, every one that doesn't come back. The wind can be cold, but I won't be.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not mid-flight, at the landing, while I was busy with the straps, and it was a full purse, too. I never found out who it was, but the wind rider did, and it took a bite out of a Bloodsail sailor down on the docks the next morning, so I call that collected." } },
      choices = {
        { text = "The beast had the right of it. Thieves earn their bites.", next = "BACK", reply = "The beast thought so, and it got a good meal of fingers for its trouble. I never fed it so well.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Saddlebags left open are an invitation.", next = "BACK", reply = "An invitation, maybe, but the beast decides who's welcome. It's never once let a thief go without a souvenir.", fx = { align = { order = -1 } } },
        { text = "Something else, Gringer.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Their grandmothers flew over the battlefields when the orcs still drank demon blood, and the beasts have never trusted fel magic since. I don't blame them, pal, and I'll ask you to stand downwind while I saddle one up for you." } },
      choices = {
        { text = "I'll stand downwind and keep my imp on a short leash.", next = "BACK", reply = "Downwind is good. Short leash is better. You'll fly, and the beast will only mutter.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The beasts will have to get used to it.", next = "BACK", reply = "They've had twenty years to get used to it, and they haven't yet. Ride with your imp and the beast will take the long way down.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Something about the smell of grass and rain, I'd guess, which they don't get much of in a pirate town. Back at Thunder Bluff the old druids would sit with the young riders for hours, and those beasts never bit anybody afterward." } },
      choices = {
        { text = "They should be flown free sometimes, Gringer, not only for gold.", next = "BACK", reply = "I would, if the goblins paid for free flights. I let them out over the reef when the Baron isn't looking.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "They're working beasts. Feed them well and let them work.", next = "BACK", reply = "They work, and they eat, and they don't complain. More than I can say for the grunts.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman. The wind riders settle when one of you is near, so stand by them if you like, but don't feed them; feed's on my ledger, not yours." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The beasts smell the grave on the Forsaken and the loa on the trolls, and they like neither, so come up slowly." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. You could teleport home and spare my riders the trip, but you won't, because that costs you reagents and this costs you gold, and mine's the better deal." },
        { id = "h_default", key = true,
          text = "Gringer. I keep the Horde's wind riders on this ledge and fly them up the coast to Grom'gol and over to the swamp at Stonard. Gold first, questions after, pal, and don't feed them anything." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Wrong side of the ledge, buddy. Your gryphons are round with Gyll, and my riders don't care for the smell of Stormwind or its coin." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. The wind riders don't mind you, but I keep an eye on my saddlebags all the same, because the last rogue I flew lightened them by eleven silver." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Keep your demon away from the wind riders, because they've got long memories, and they don't care for anything that smells of the old Horde's fel." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The wind riders don't mind a heavy rider so long as you don't kick, and warriors always kick, so sit still, pal, or pay for the bruises." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, eh? Then you'll know better than to feed my wind riders anything, and you'll know why." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID", faction = "Horde" }, text = "A tauren druid, on my ledge. The wind riders know the Earth Mother's people by smell, and they sit quieter for it, so stay close while I saddle one." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. Gold first, questions after, and my question is whether you glow in the dark, because the riders won't sleep if you do." },
      },
      again = {
        { id = "h_again", text = "Something else? Make it quick, pal; they get restless, and restless beasts eat profits." },
        { id = "h_again2", text = "Go on, then, ask, but the clock's running." },
      },
      choices = {
        { text = "Do the winds over the jungle ever turn against your riders?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What threatens your riders along the coast, Gringer?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me the routes.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "What's the trouble on the coast road?", next = "road" },
        { text = "How do you get on with the gryphon master?", next = "gyll" },
        { text = "Flying sits badly with my people.", next = "x_scourge", when = { race = "Scourge" } },
        { text = "Did a rogue really rob you mid-flight, Gringer?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do wind riders really remember the old Horde, Gringer?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why do warriors always kick the wind riders, Gringer?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why mustn't anyone feed the wind riders, Gringer?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The wind riders seem to settle near a druid, Gringer.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do your riders mind a Forsaken paladin, Gringer?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
    },
    road = {
      lines = {
        { id = "r_default", text = "Trolls in the hills, raptors in the grass and Bloodsail on the beaches. That's why people fly, pal, and why I've more customers than riders on a busy day, which is a fine problem to have." },
      },
      choices = {
        { text = "Grom'gol can't keep the road clear?", next = "road_gromgol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_gromgol = {
      lines = {
        { id = "rg_default", text = "Commander Aggro'gosh tries, and he's got the caravans to Stonard to worry about besides. A road through this jungle grows back faster than you can clear it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gyll = {
      lines = {
        { id = "gy_default", text = "We nod. The Baron's ledge, the Baron's peace, and the Bruisers see to the rest, so we nod every morning, keep our beasts at opposite ends, and undercut each other quietly." },
      },
      choices = {
        { text = "That's sensible.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_scourge = {
      lines = {
        { id = "xs_default", text = "Bats sit better with your lot, I know, kid. But there are no bats here, so you'll ride a wind rider and you'll like it, and if anything falls off on the way, I'm not going back for it, not without a fee." },
      },
      choices = {
        { text = "I'll hold on tight.", next = "BUSINESS", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned the beasts at Orgrimmar and came south for the money, and the money is why I stay, pal, same as everybody." } },
    advice = { { id = "tp_ad", text = "Never stand behind a wind rider, not even once, not even for a moment, not even for gold." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay pays me better than Orgrimmar ever did, and I've got gryphons for neighbors, which takes some getting used to. They're decent beasts, though their masters talk too much." } },
    thrall = { { id = "tp_thrall", text = "The Warchief keeps the Horde strong, and he keeps it fed, and no chief I followed before the camps ever did both. I'd fly anywhere he sent me." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the hottest place a wind rider can land without catching fire, and the beasts hate every minute of it. I don't blame them." } },
    centaur = { { id = "tp_centaur", text = "The centaur in the Barrens shoot at wind riders for sport, pal. I lost a good beast to a Kolkar arrow once, and I haven't forgiven them." } },
    _none = { { id = "tp_none", text = "I fly beasts, pal, I don't answer riddles. Try the tavern; Krazek sells riddles." } },
  },
}

P:NPC {
  key = "viznik", id = TODO_NPC("Viznik Goldgrubber"), name = "Viznik Goldgrubber",
  title = "Banker",
  bible = "bibles/stranglethorn.md", role = "banker", tier = "service",
  communities = { "booty_bay" }, temper = { "smooth", "careful" }, values = { "greedy", "lawful" },
  notices = { "purse" },

  impression = {
    first = "Viznik Goldgrubber spoke of my savings with more affection than most people show their families. The vault is the safest place in a pirate town, and Viznik never lets anyone forget it.",
    third = "{name} met Viznik Goldgrubber, a banker of Booty Bay who serves both Horde and Alliance.",
  },

  greetings = {
    { id = "g_vault", text = "Welcome, welcome, friend! Your valuables are safe with the Steamwheedle, safer than with you, frankly, and the fees are modest by Booty Bay standards." },
    { id = "g_back", when = { metBefore = true }, text = "A returning customer! My favorite kind, after the rich kind, and you might be both, given time and compound interest." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "My, my, that purse has a lovely weight to it. Have you considered how much lovelier it would look in a vault?" },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Everything worries a banker, friend, it's in the job description. Dwarves keep their gold in stone and you talk to stone, so I'd rather not find out what happens if the vault walls start listening to you and asking for a cut." } },
      choices = {
        { text = "Your vault is safe. I don't steal, with spirits or hands.", next = "BACK", reply = "Glad to hear it, friend, and the walls are glad too. Honest depositors are the best kind, and the rarest.", fx = { align = { honor = 1 } } },
        { text = "Then keep me happy, and the walls stay quiet.", next = "BACK", reply = "Now that's a threat a banker can respect, friend! I'll keep you happy, within the bounds of the fee schedule.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Spare armor, old trophies and heirloom swords from regiments that don't exist anymore, a good many of them from Stromgarde, and some of it's worth more than the warrior who owns it. I keep it all oiled, too, because rust is bad for business and worse for my reputation." } },
      choices = {
        { text = "Heirlooms belong in a vault, kept safe and honored.", next = "BACK", reply = "They do, and I keep 'em polished and dry, which is more than their regiments did. Honor's a fine thing to store, and it doesn't rust.", fx = { align = { order = 1 } } },
        { text = "A blade belongs in a fight, not gathering dust.", next = "BACK", reply = "Then come and claim yours, friend, and take it back to work. Storage fees are calculated to the day, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hides, tusks, a stuffed raptor head nobody's come back for in two years, and the claws of a tiger I'm told was enormous. Every piece back there has a fee, and every fee has a date, and I remember every date." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Hides, tusks, a stuffed raptor head nobody's come back for in two years, and the claws of a tiger I'm told was enormous. Every piece back there has a fee, and every fee has a date, and I remember every date. I'm afraid {pet} can't be deposited, before you ask, since the last live beast I took in ate a strongbox and most of what was in it." },
      },
      choices = {
        { text = "I keep trophies to honor the beasts I've taken.", next = "BACK", reply = "And they'll be safe here as long as you keep paying, friend. There's a stuffed panther in box nine that frightens the night clerk every single time.", fx = { align = { light = 1 } } },
        { text = "Trophies are vanity. I sell what I kill and keep the coin.", next = "BACK", reply = "Smart business, friend, the coin keeps better than a stuffed head. Though the raptor head does lend the vault a certain charm.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A mage blinked into the vault once, years ago, and the vault blinked back. We've had wards on every wall since, at tremendous expense, and I'm told he's still somewhere in the Twisting Nether, which makes an excellent deterrent." } },
      choices = {
        { text = "He broke the rules, and he paid for it.", next = "BACK", reply = "He did, and the Cartel charged his estate for the cleanup. A lesson nobody forgot, least of all him, wherever he is now.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Wards can be broken. You'll learn that someday.", next = "BACK", reply = "Maybe they can, friend, and maybe the next mage will learn what the last one did. I'd not try it, if you value your shape.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Totems, mostly, and the occasional carved stone that I'm instructed never to touch. I don't ask what they do, because the Cartel's first rule is discretion, and its second is fees." } },
      choices = {
        { text = "Discretion is a fair rule. I'll respect your vault's laws.", next = "BACK", reply = "Glad to hear it, friend. A vault runs on discretion, and so do I, and so does the Baron.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules are for goblins. My totems stay where I choose.", next = "BACK", reply = "Then you'll keep them somewhere else, friend, at your own risk and no insurance. The vault has rules for a reason.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Twice, and both times my wards caught them before they got past the second door. The Cartel spared no expense on enchantments, so your gold is safer here than anywhere else in Stranglethorn, and I'll be happy to prove it." } },
      choices = {
        { text = "Then I'll trust your vault with my gold.", next = "BACK", reply = "A wise decision, friend, and you won't regret it. The Cartel's never lost a deposit, and it never will while I'm counting.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every ward has a weakness. I'll keep my gold close.", next = "BACK", reply = "Your gold, your risk, friend, and I'll not argue. But the alleys of this town are full of determined people too.", fx = { align = { order = -1 } } },
        { text = "Something else, Viznik.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the Cartel takes no chances, and some of our depositors keep things in their boxes that whisper at night. The wards keep the whispering in and the demons out, and I've never once had to explain a missing coin to anyone." } },
      choices = {
        { text = "Smart of the Cartel. I'll keep my demon away.", next = "BACK", reply = "You're a sensible warlock, friend, and rarer than gold. Keep it outside and we'll get along fine.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your wards won't stop a determined summoner.", next = "BACK", reply = "Maybe not, friend, but the Bruisers will, and the Baron's displeasure is worse than any demon. I'd not test it.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Weigh on me? Only when I'm carrying it, friend, and I hire Bruisers for that, at a very reasonable rate. Gold is the one thing in Booty Bay that never lies to you, friend, and it never asks me for a loan either." } },
      choices = {
        { text = "Gold can't love you back, Viznik. Spend some on others.", next = "BACK", reply = "Spend it on others? Friend, you've just described the worst investment I've ever heard of. Though I'll admit the vault doesn't hug back.", fx = { align = { light = 1 } } },
        { text = "Gold doesn't lie or betray. That's wiser than most faith.", next = "BACK", reply = "Now that's a philosophy I can bank on, friend. Gold's loyal as long as it's counted, and I count it twice.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I charged the druid extra for storing a plant, naturally, and then I moved it to a shelf with a window, because I'm not a monster. It's three feet tall now and I've grown fond of it, which I'd thank you not to tell the other bankers." } },
      choices = {
        { text = "Then water it and don't charge for it. It's earned its keep.", next = "BACK", reply = "Earned its keep? It doesn't pay rent, friend, it just grows, which is the worst kind of tenant. I'll water it, but I'm still charging.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Business is business. Charge the druid for every foot it grows.", next = "BACK", reply = "Now that's a customer after my own heart! Every inch is billable, and the druid's going to get quite a statement.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safer than any chapel collection box, I promise you, because the Cartel has never lost a deposit in this town, and few priests can say the same of their poor box. Pirates and paladins both sleep better knowing their coin is in here, and I sleep best of all, since I'm the one holding the key." } },
      choices = {
        { text = "Trustworthy keeping is worth the fee, Viznik.", next = "BACK", reply = "It is, friend, and I'm glad to hear a paladin say it. The Cartel's honesty has a price, and it's always worth paying.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather carry my own coin than trust the Cartel.", next = "BACK", reply = "Then keep your purse close in this town, friend, and your hand closer. I'll be here when you change your mind, and you will.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Interesting, very interesting. I've a {altrace} called {alt} on my books, from the other side, friend, and if I didn't know better I'd say you shared a jaw, a squint and a very cautious way of watching the vault door." },
        { id = "h_alt_class", when = { alt = { sameClass = true } },
          text = "{alt}, another {altclass}, keeps a box in my vault, pal, so I've some idea what your kind deposit, which is mostly loot and occasionally regret. Both are stored at the same rate, and neither one earns interest." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your coin is welcome in my vault, and I'd guess you've less of it than a pirate and keep it far more carefully, which makes you my favorite kind of customer." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Your coin is welcome in my vault, of course, sweetheart, though I've never yet understood why the faithful keep so little of it." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman of the Horde. Your coin is welcome here, and so are you, provided the lightning stays outside the vault, because the vault isn't insured against weather." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! The Cartel holds relics for many faiths, all of them insured and none of them guaranteed, and yours would be in very good company." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Ah. Your account is welcome here, pal, but my vault has three locks, and I'm the only one with all three keys, and I sleep on them." },
        { id = "h_default", key = true,
          text = "Viznik Goldgrubber, banker to the Steamwheedle and to anyone with something worth keeping. Horde, Alliance, pirate or priest, your coin is all the same color to me, which is gold, my favorite color." },
        { id = "h_rep", when = { reputation = { faction = "Steamwheedle Cartel", min = "honored" } },
          text = "A friend of the Cartel! The Baron speaks well of you, which costs him nothing, so I'll speak well of you too, and that costs me even less." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Your savings would be very safe in my vault, friend, and I've never once lost a coin to a spell, though I'll admit some have tried." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Mind yourself, friend, because my vault has wards against demons, and they'd be very loud if your companion wandered too close." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You'll want to deposit that spare sword, I'd guess, because in Booty Bay a spare sword left under a bed walks off by morning." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Pelts, horns and fangs, I suppose, and you'll want them stored dry, which in this town takes skill and a small surcharge, and I have the skill." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I'd ask what you keep in my vault, but I've learned not to; the last druid's box hummed, and the one before that sprouted." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. Your coin is welcome here, and so are you, provided the lightning stays outside the vault." },
      },
      again = {
        { id = "h_again", text = "Anything else I can hold for you, friend? Coins, secrets, small cursed objects, all at competitive rates?" },
        { id = "h_again2", text = "More questions? Banking is a patient art, chum, and patience earns interest." },
      },
      choices = {
        { text = "What do shamans usually keep in a Steamwheedle vault?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Has anyone ever tried to rob a Steamwheedle vault with magic?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "I need my vault.", next = "BUSINESS" },
        { text = "How safe is a bank in a pirate town?", next = "safe" },
        { text = "You serve both factions?", next = "both" },
        { text = "Do you ever look in the vaults?", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "Some mage must have tried to rob your vault, Viznik.", next = "xmage", when = { class = "MAGE" } },
        { text = "Why does your vault have wards against demons, Viznik?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does all that gold ever weigh on you, Viznik?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do warriors leave much in your vault, Viznik?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do you store pelts and trophies, Viznik?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "A box sprouted in your vault, Viznik? What did you do with it?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Is a Steamwheedle vault really safe for a paladin's savings, Viznik?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does a dwarf shaman worry a goblin banker, Viznik?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    safe = {
      lines = {
        { id = "s_default", text = "Safer than anywhere else in the South Seas, by my last copper. Every pirate in the cove keeps his coin with us, so every pirate in the cove has a reason to keep this vault standing." },
      },
      choices = {
        { text = "Even the Bloodsail?", next = "safe_bloodsail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_bloodsail = {
      lines = {
        { id = "sb_default", text = "Officially, no, since the Baron would have my ears. Unofficially, gold doesn't come with a bandana, and I never ask where a coin has been before it reaches me." },
      },
      choices = {
        { text = "Coin is coin, and that's smart business.", next = "BACK", reply = "Spoken like a true Booty Bay native, friend. Coin has no colors in my vault, and no bandanas either.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "That's how pirates get rich off honest folk.", next = "BACK", reply = "And then they bring it here, friend, which is how honest folk get it back eventually, by way of the Cartel. The system works, mostly.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    both = {
      lines = {
        { id = "b_default", text = "Of course! War is expensive, and expensive things need banks, so war is very good for banks. I'd serve the Scourge if they paid their fees, though I hear they're poor savers." },
        { id = "b_horde", when = { faction = "Horde" },
          text = "Of course, and your gold sits two shelves from an Alliance captain's. Neither of you knows which shelf, and that's how we like it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_rogue = {
      lines = {
        { id = "xr_default", text = "Never, and neither will you. The last fellow who tried found out why the Baron hires so many Bruisers, and why the Bruisers are so very large." },
      },
      choices = {
        { text = "Just curious.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born to the Cartel, trained in the vaults, and never once robbed, friend. Twice almost, but almost isn't robbed, and almost doesn't show up in the ledger." } },
    advice = { { id = "tp_ad", text = "Never carry more gold than you can afford to lose to a raptor, pal; deposit the rest with me." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the most dangerous town I know, friend, which is exactly why a vault here is worth so much. Every pirate wants somewhere safe to keep what they stole." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Arena's very good for business, friend, because the winners make deposits and the losers make withdrawals. I don't care which kind you are." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail have tried to rob this vault twice, and twice they failed, and I'd like it on the record that I wasn't worried either time. Much." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel's the only bank that pays out the same to Horde and Alliance alike, friend, because gold doesn't care who carried it in." } },
    _none = { { id = "tp_none", text = "If it doesn't earn interest, I don't keep track of it, friend, and neither should you." } },
  },
}

P:NPC {
  key = "jutak", id = TODO_NPC("Jutak"), name = "Jutak",
  title = "Blade Trader",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "shrewd" }, values = { "greedy", "proud" },
  notices = { "class" },

  impression = {
    first = "Jutak trades in blades, and somehow each blade on his rack comes with a story about a famous owner. I believed perhaps a third of them, and I suspect Jutak would think that generous.",
    third = "{name} browsed Jutak's blades in Booty Bay, each one sold with a story.",
  },

  greetings = {
    { id = "g_blades", text = "Every blade on this wall is sharp, and most of them are old. Look all you like, but keep your hands behind your back." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "ROGUE" } },
      text = "You hold your weight like someone who's used a blade more than once. Good; I prefer selling to people who'll appreciate the edge." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Maybe, maybe not, but look at the nicks along the edge and tell me it never held a bridge against somebody. A blade remembers what it's done, friend, even if the seller forgets, and a warrior can always feel the difference." } },
      choices = {
        { text = "I'll judge a sword by its steel, not your tall tales.", next = "BACK", reply = "Fair, and you'll find the steel's sound, story or no story. The nicks are real, at least, whatever made them.", fx = { align = { honor = 1 } } },
        { text = "A good story sells a sword. I'd tell it too.", next = "BACK", reply = "Ha! Now you're talking like a trader. A good tale doubles the price, and nobody ever asks for a refund on a story.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "King Bangalash himself, according to the dwarf who sold it to me, and he swore Nesingwary paid him handsomely for the pelt. Nesingwary's people say Bangalash is alive and well, so either the dwarf lied or the old king has nine lives." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "King Bangalash himself, according to the dwarf who sold it to me, and he swore Nesingwary paid him handsomely for the pelt. Nesingwary's people say Bangalash is alive and well, so either the dwarf lied or the old king has nine lives. Your {pet} doesn't care for the smell of this knife, I see, which is either a good sign about its history or a very bad one." },
      },
      choices = {
        { text = "Lying about a kill is the worst thing a hunter can do.", next = "BACK", reply = "It is, and I'll grant you, I wouldn't swear to it. But the hunters love the tale, and they buy the claws.", fx = { align = { honor = 1 } } },
        { text = "A story's half the value. I'd have told the same lie.", next = "BACK", reply = "Then you'd make a fine trader, friend, and a poor hunter. Half my stock sells on stories like that one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A Bloodsail captain who killed three men with it in a single night, or so the seller told me, and I've no reason to doubt him. The blade's sharp and well balanced, so whether the story's true or not, it'll serve you just as well." } },
      choices = {
        { text = "A good blade is enough. I don't need the story.", next = "BACK", reply = "A practical buyer, and they're rarer than you'd think. Take the blade, and I'll save the story for the next fellow.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The story makes the blade. I'll pay for both.", next = "BACK", reply = "That's my favorite kind of customer! Blade and story together, and both of them sharpened.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jutak.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's what the seller swore, and he had very honest eyes, for a pirate. I believe about a third of my stories, and I'll let you decide which third this one falls in, though the price is the same either way." } },
      choices = {
        { text = "I'll pay for the dagger, not the story.", next = "BACK", reply = "Fair enough, and the dagger's worth its price without the tale. Though the tale's a good one, you'll admit.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good story's worth paying for. I'll buy it.", next = "BACK", reply = "You've a merchant's heart, friend, and I like you for it. Stories cost me nothing and sell like hot bread.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A curved knife for cutting herbs, said to have belonged to a kaldorei priestess, though I'd not swear to the priestess. Most druids look at my table like it's a graveyard of trees, and to be fair, some of these hilts are ironwood." } },
      choices = {
        { text = "A blade that cuts herbs cleanly is a worthy tool. I'll look.", next = "BACK", reply = "It is, and the edge is still good after all these years. Whether a priestess held it, I'll leave to you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your stories beat your steel, Jutak. I'll keep my claws.", next = "BACK", reply = "Your claws are free and never need sharpening, so I can't argue. I'll sell the knife to somebody who likes a tale.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The sailor swore it did, and he swore it on his mother, though I later learned he swore everything on his mother, so make of that what you will. Every blade has a story, friend, and the price depends on how much of the story you choose to believe." } },
      choices = {
        { text = "Sell it straight, Jutak, story and doubts together.", next = "BACK", reply = "That's the paladin's way, and I'll not pretend I always do it. But you'll get both from me, since you asked.", fx = { align = { honor = 1 } } },
        { text = "A good story sells a blade. I'd do the same.", next = "BACK", reply = "Then you'd be a better trader than most paladins I've met. The last one made me swear on the Light before he'd buy a spoon.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xpriest_default", text = "It came up out of the troll ruins on a jungle trader's belt, with a carved bone handle and an edge still sharp after who knows how long. Some say it cut offerings for the old troll gods and some say it peeled fruit, and I sell it to whichever customer believes the better story." } },
      choices = {
        { text = "If it was used for sacrifice, it shouldn't be sold.", next = "BACK", reply = "You may be right, and I've thought the same on quiet nights. I'll not sell it to anyone who wants it for that, at least.", fx = { align = { light = 1 } } },
        { text = "A knife is a knife, Jutak. Sell it to whoever pays.", next = "BACK", reply = "That's the Booty Bay answer, and I'll take it. But I'll admit I'd sleep easier if it went to a museum.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Blast if I know, friend; I'd hoped you could tell me, since it came off a drowned Bloodsail and it's hummed ever since, mostly at night. I keep it in a crate under the counter, and the rats won't go near that crate, which is either a very good sign or a very bad one." } },
      choices = {
        { text = "Something that hums like that is best destroyed, Jutak.", next = "BACK", reply = "Maybe it is, and I'd not argue too hard. I'll keep it in the back until somebody braver decides.", fx = { align = { light = 1 } } },
        { text = "Sell it to me. I'll learn what's inside it.", next = "BACK", reply = "Then you're braver than me, friend, and probably richer soon. Take it, and don't tell me what you learn.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! I've a dagger that hums when nobody's holding it, and I'd sell it to you before it makes the other customers nervous." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I've a ritual knife from the old troll ruins, and I'd love to hear what you think it was for, though I'd rather you didn't tell the customers." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've a ceremonial knife here that came out of the old troll ruins, and I'd like you to tell me whether it's holy or just old, because the price depends on it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've a hammer here that belonged to a knight of the Silver Hand, or so the sailor who sold it swore, and I'd let it go to the right owner at a fair price." },
        { id = "h_default", key = true,
          text = "Jutak, trader in blades. Every sword that comes through this harbor passes my counter sooner or later, off a sailor short of rent or a pirate short of luck." },
        { id = "h_back", when = { metBefore = true },
          text = "You're back! I've a new cutlass in since you were here, from a Bloodsail who no longer needs it, for reasons I don't ask about." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You'll want a blade that was owned by a famous assassin, I'd guess, and I've got just the thing, with a story to match." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll not need a sword, I suppose, but I've got a dagger once owned by an archmage of Dalaran, if you'd care to hear the story." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Now this sword here belonged to a captain of Stromgarde who held a bridge against a hundred trolls, or so the sailor who sold it swore, and he looked honest." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, and you'll want a skinning knife, I'd guess, and I've one here that's said to have skinned a white tiger, though I can't swear to the tiger." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid at a blade trader's counter? You'll be wanting a sickle, I'd guess, or else you're lost, and I can sell to either." },
      },
      again = { { id = "h_again", text = "What else? Mind your fingers on the counter." } },
      choices = {
        { text = "Let me see the blades.", next = "BUSINESS" },
        { text = "Where do the blades come from?", next = "source" },
        { text = "I'd like to see the best blade you have.", next = "best" },
        { text = "A shaman's axe would serve me better.", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "Who owned this famous blade, Jutak?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Did an archmage really own this dagger, Jutak?", next = "xmage", when = { class = "MAGE" } },
        { text = "Did a Stromgarde captain really own that sword, Jutak?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Which white tiger did that knife skin, Jutak?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you have anything a druid could use, Jutak?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Did that hammer really belong to a knight of the Silver Hand, Jutak?", next = "xapala", when = { class = "PALADIN" } },
        { text = "You keep talking about some ceremonial knife, Jutak.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Why does that dagger of yours hum, Jutak?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Later.", next = "END" },
      },
    },
    source = {
      lines = {
        { id = "s_default", text = "Sailors, mostly, and the Blackwater lads after a fight with the Bloodsail. Some of these blades have changed hands more times than a gambling debt at the Salty Sailor's card tables." },
      },
      choices = {
        { text = "I'd guess a few of them were stolen.", next = "source_stolen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source_stolen = {
      lines = {
        { id = "ss_default", text = "Stolen is a strong word in a pirate town. I'd say they were freed, and if you find your old sword on my wall, I'll sell it back to you at a fair price." },
      },
      choices = {
        { text = "That's pure robbery, Jutak.", next = "BACK", reply = "Robbery's a word for people who aren't in pirate towns, friend. I'll call it recovery, and give you a fair price to get yours back.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Finders keepers, eh? I respect that.", next = "BACK", reply = "A buyer who understands the trade! Finders keepers, and the finders sell to me.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = {
        { id = "b_default", text = "The one you can afford, friend. Anything better than that goes to Zarena next door, who'll forge you something new, if you've the gold for new." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_shaman = {
      lines = {
        { id = "xs_default", text = "Axes and maces are round the back, where the Horde captains look. A shaman with a good axe and the storm behind it is worth any three of the cutlass boys out on the pier." },
      },
      choices = {
        { text = "Show me the axes, then.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I started out buying swords off drunks, and I still do; I just pay a little more now." } },
    advice = { { id = "tp_ad", text = "Oil your blade every night down here. The sea air rusts steel quicker than any troll can blunt it." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the best place in the world to buy a sword from a drunk, and the second best place to sell it to a fool. I love this town." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "Half my best stock came out of the Arena, pal, dropped by fighters who didn't need it anymore. I don't ask whether they were alive when they dropped it." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "Every blade I've seen out of Zul'Gurub is cursed, or the seller says it is, which puts the price up nicely. I've got one now, actually, if you're interested." } },
    second_war = { { id = "tp_second_war", text = "This sword here was carried by an orc captain in the Second War, or so the drunk who sold it to me said. Maybe one in three of these stories is true." } },
    _none = { { id = "tp_none", text = "If it hasn't got an edge, I've no opinion on it." } },
  },
}

P:NPC {
  key = "zarena", id = TODO_NPC("Zarena Cromwind"), name = "Zarena Cromwind",
  title = "Superior Weaponsmith",
  bible = "bibles/stranglethorn.md", role = "blacksmith", tier = "service",
  communities = { "booty_bay" }, temper = { "proud", "blunt" }, values = { "proud", "practical" },
  notices = { "craft", "kit" },

  impression = {
    first = "Zarena Cromwind sells new steel in a town that mostly trades in secondhand cutlasses, and she makes certain everyone knows the difference. Her work is good enough that the boasting hardly matters.",
    third = "{name} met Zarena Cromwind, the weaponsmith who sells fine new steel in Booty Bay.",
  },

  greetings = {
    { id = "g_forge", text = "My steel is new, properly forged and priced to match. If you want rust and a story, Jutak's next door." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've a smith's forearms and a smith's burns. Look all you like; you'll know quality when you see it, and most of my customers couldn't tell a good edge from a butter knife." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's falling to pieces, and the jungle won't wait for you to mend it. Get to a smith before you leave the cove." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The best, so far, because you're new and you're proud and you want everyone to see the Light still answers you. Walk out of here swinging one of my hammers and every sailor on the pier will know it, and that's good for both of us." } },
      choices = {
        { text = "I'll carry it to use, Zarena, not for show.", next = "BACK", reply = "For use is better, and I'll respect you for it. Fame rusts faster than my steel does, anyway.", fx = { align = { honor = 1 } } },
        { text = "Let them see. A little fame won't hurt.", next = "BACK", reply = "A little fame's good for business, and good steel deserves it. Swing it where everyone can see.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They're salted and pitted and sharpened so often they're more file than blade, and they'll snap on a troll's skull just when you need them. New steel costs more, but a warrior who dies saving silver hasn't saved a thing." } },
      choices = {
        { text = "A warrior who skimps on steel doesn't respect his trade.", next = "BACK", reply = "They don't, and I tell them so every day. A warrior with cheap steel is a warrior who doesn't come back.", fx = { align = { order = 1 } } },
        { text = "I've killed with scrap before. It's the arm that matters.", next = "BACK", reply = "The arm matters, sure, until the scrap snaps on a troll's skull and the arm goes with it. I've seen it happen.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because every hunter in Stranglethorn learns sooner or later that a panther moves faster than you can draw, and that's when you want good steel in your hand. Jaquilina up at the camp will tell you the same, though she'll try to sell you a bigger axe than you need." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because every hunter in Stranglethorn learns sooner or later that a panther moves faster than you can draw, and that's when you want good steel in your hand. Jaquilina up at the camp will tell you the same, though she'll try to sell you a bigger axe than you need. Your {pet} will keep most of them off you, I'll grant, but even the best beast can't watch both sides of a trail at once." },
      },
      choices = {
        { text = "If it reaches me, I'll meet it fairly with steel.", next = "BACK", reply = "Fair is fine, so long as your blade holds. Mine will.", fx = { align = { honor = 1 } } },
        { text = "If it reaches me, I'll trap it or run. No shame in that.", next = "BACK", reply = "No shame at all, and plenty of hunters live that way. Just carry a good knife in case the trap fails.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Everything I forge holds one, because good steel takes a spell the way bad steel takes rust. Jutak's blades will crack the first time you put a glow on them, and I'll be glad to tell you so when they do." } },
      choices = {
        { text = "Quality costs. I'll pay your price.", next = "BACK", reply = "Good, and you'll get every copper's worth. Quality steel holds a spell, and holds its edge too.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll buy from Jutak and take my chances.", next = "BACK", reply = "Then you'll learn what Jutak's stories are worth, eventually. I'll be here when you come back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A tauren once had me forge a mace with a socket for a stone, which she said held a spirit of the earth. I charged her double for the socket and didn't argue about the spirit, and we both went away happy." } },
      choices = {
        { text = "A weapon should honor the spirit it carries.", next = "BACK", reply = "That's what she said, and I made it carefully. Spirits are particular about their homes.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A weapon kills, and that's all it ever needs to do.", next = "BACK", reply = "That's what I'd say too, if I were less polite. But I'll forge whatever socket you want, and charge for it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because secondhand steel has secondhand flaws, and you won't know what they are until the blade snaps in a raptor's throat. My work is forged fresh and tested twice, and I'll stand behind every edge I sell." } },
      choices = {
        { text = "New steel, then. Quality is worth the price.", next = "BACK", reply = "Good choice, and you'll thank me the first time a panther hits your shield. New steel, no surprises.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A dead pirate's cutlass is free. I'll take my chances.", next = "BACK", reply = "Free, until it breaks in your hand at the worst moment. Take your chances, but don't come crying to me.", fx = { align = { order = -1 } } },
        { text = "Something else, Zarena.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I make daggers, and what you use them for is your own business, but I've had a few warlocks through my shop who wanted something sharp for their rites. I don't ask questions, and I don't put my name on the hilt." } },
      choices = {
        { text = "I'll buy one. Your work speaks for itself.", next = "BACK", reply = "My work does speak, and it speaks steel. Take one and use it well, whatever well means to you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "No questions asked is a fine policy for a smith.", next = "BACK", reply = "It is, and it keeps me in business. I'll make the dagger and leave the rest to you.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I care that they don't break, and that's a rarer promise on this boardwalk than it ought to be. Where they go after they leave my counter is between the buyer and their conscience, and I've found mine sleeps better when I don't ask." } },
      choices = {
        { text = "Then ask anyway. A conscience works better awake.", next = "BACK", reply = "Maybe you're right, and maybe I should. I'll start with the next one who wants a blade that won't catch the light.", fx = { align = { light = 1 } } },
        { text = "A smith sells steel, not judgment. You're right not to ask.", next = "BACK", reply = "Exactly, and I'd lose half my trade if I asked. I make it strong, and that's where my part ends.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Good customers and better advertisements, frankly, because when a paladin walks out of here swinging one of my hammers, every sailor on the pier wants one. I don't hold with sermons, but I've never met one of you who didn't pay what was owed." } },
      choices = {
        { text = "We pay what we owe because our word means something.", next = "BACK", reply = "And that's why I like paladins as customers. Your word is as good as your coin, and both pay.", fx = { align = { honor = 1 } } },
        { text = "Paying debts is just good sense. Honor has little to do with it.", next = "BACK", reply = "Good sense or honor, it pays the same, and I'm not picky. Come back when your hammer needs replacing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because every druid I've met has a friend who wants something sharp, and that friend never has any money. You can turn into a bear, but you can't turn into a better sword, so I sell to the warrior standing behind you." } },
      choices = {
        { text = "Point taken. Good steel keeps my friends breathing.", next = "BACK", reply = "Then take a dagger for the road, and give it to that friend. Good steel keeps everyone breathing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My friends will fight with what nature gives them, Zarena.", next = "BACK", reply = "Then they'll fight with teeth and branches, and I'll admire them from a safe distance. Good luck to them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, buying steel? I sell to the faithful as readily as anyone, and I'll tell you plainly that a good mace beats a sermon when the Bloodsail board your ship." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" }, text = "A paladin, now that's a customer worth having, because you'll actually use what you buy instead of hanging it on a wall to impress the sailors." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll want a mace or an axe, then, because I've seen your lot swing both, and you swing them like you mean it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Most of your kind want a mace and an apology, and I only sell the mace." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage in a weaponsmith's? A staff, then, and I'll make it heavy enough to settle an argument after your mana runs dry." },
        { id = "h_default", key = true,
          text = "Zarena Cromwind. I sell the best steel south of Stormwind and north of nowhere, to anyone who'll pay for it. Sailors rust, pirates break and I get rich, so it's a fair arrangement." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want new steel, I hope, and not some rusted cutlass off a dead pirate, because a blade that fails you in the jungle is no blade at all." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You'll not be needing much steel, I'd guess, but I make a fine ritual dagger, if your kind still uses such things." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "Now there's a warrior who knows what good steel feels like, I hope, because you won't find any on the secondhand tables down the pier." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. I don't make bows, so you'll want Haren for that, but nobody on this coast makes a better hatchet for when a panther gets past your arrows." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You don't need my steel, I know, but someone in your party will, so do me a favor and point them my way." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, now that's a customer worth having, and a Forsaken one besides! You'll swing what you buy, and I'd guess you won't complain about the weight." },
      },
      again = { { id = "h_again", text = "Need something more? Mind the sparks, and know the sea air rusts whatever I don't keep hot." } },
      choices = {
        { text = "Have you ever forged a weapon for a shaman before?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you sell anything that holds an enchantment well?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why set up shop in Booty Bay?", next = "why" },
        { text = "What's wrong with Jutak's blades?", next = "jutak" },
        { text = "Steel from the Horde forges is better.", next = "x_orc", when = { race = { "Orc", "Troll" } } },
        { text = "I'm a smith myself, and I'd buy from you.", next = "x_smith", when = { profession = "Blacksmithing" } },
        { text = "Why should I buy new steel instead of salvage, Zarena?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you really make ritual daggers, Zarena?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you care who your blades end up hurting, Zarena?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do you make of the Silver Hand, Zarena?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Those secondhand swords on the pier look poor, Zarena.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why would a hunter need one of your hatchets, Zarena?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why does every merchant here think a druid wants something sharp?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do Forsaken paladins make good customers, Zarena?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Later.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because everyone in this cove fights, and nobody here can forge. The pirates break a blade a week, the Blackwater break two, and every adventurer through the shark's mouth wants something better than what they came with." },
      },
      choices = {
        { text = "Do you miss the north?", next = "why_north" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_north = {
      lines = {
        { id = "wn_default", text = "I miss the coal, which was cheaper and drier. I don't miss the guilds, who wanted a cut of every blade I made, and the Baron only wants a cut of the ones I sell." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jutak = {
      lines = {
        { id = "j_default", text = "Nothing, if you like a sword that's already killed its last three owners. He sells secondhand and I sell first-hand, and we send each other customers without either of us admitting it." },
      },
      choices = {
        { text = "So you're friends, then.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_orc = {
      lines = {
        { id = "xo_default", text = "Heavier, certainly, and the Orgrimmar smiths know how to make a blade that frightens people. Mine are made to cut instead, so pick one up and see if you can tell me otherwise." },
      },
      choices = {
        { text = "Fine, then, show me.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_smith = {
      lines = {
        { id = "xm_default", text = "To a smith I sell plans, if I've any spare, and opinions for free. Don't quench in seawater, whatever the dockhands tell you; it pits the steel and ruins the temper." },
      },
      choices = {
        { text = "That's good advice. Thank you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned at a forge up north and came south when I'd learned enough to charge for it." } },
    advice = { { id = "tp_ad", text = "Buy the best blade you can afford once, not the cheapest blade you can afford six times." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's full of rust and secondhand steel, and I'm the only one who sells it new. You can tell my customers by how many fingers they have left." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "Every blade I've sold to an Arena fighter has come back in one piece, though the fighter hasn't always. That's the difference between good steel and the rest." } },
    magni = { { id = "tp_magni", text = "King Magni keeps the best smiths in the world in Ironforge, and I learned under one of them. I'd tell him so myself if I ever had the chance." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons make fine steel, I'll give them that, but they'd sooner put it in your back than sell it to you. I've seen their work, and I don't sleep any easier for it." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't forge it, so I don't care." } },
  },
}

P:NPC {
  key = "narkk", id = TODO_NPC("Narkk"), name = "Narkk",
  title = "Pirate Supplies",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "jolly", "salesy" }, values = { "greedy" },
  notices = { "class" },

  impression = {
    first = "Narkk sells pirate costume to people who aren't pirates and seems to find that very funny. In a town full of real buccaneers, he dresses the tourists.",
    third = "{name} met Narkk, who sells pirate hats and finery in Booty Bay.",
  },

  greetings = {
    { id = "g_hats", text = "Come in, come in, pal! I sell everything a fearsome buccaneer needs except the ship and the nerve, and I can get you a very good price on the nerve, in bottles." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Now you've got the look already, the skulk and the squint, and those come free. All you need is the hat, chum, and nobody in Booty Bay would ever ask questions." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Plenty, pal, because a big soldier in a pirate hat gets a laugh in every tavern on the coast and a wide berth from the Bruisers. Half the swagger on these piers comes out of my shop at four silver a hat, and the other half comes out of a rum barrel." } },
      choices = {
        { text = "A warrior's reputation should be earned, not bought in a hat.", next = "BACK", reply = "Earned, sure, but a hat makes the earning a lot more fun, buddy. Wear it once and see how the tavern treats you.", fx = { align = { honor = 1 } } },
        { text = "If a hat makes them fear me, I'll wear it gladly.", next = "BACK", reply = "That's the spirit, pal! Fear and laughs are the same price, and the hat buys you both.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because every pirate wants a parrot and nobody wants to feed one, and you hunters already know how much work a real beast is. I sell more stuffed parrots than anything else in the shop, at a markup you wouldn't believe, and they come back for a second one when the first gets sat on." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because every pirate wants a parrot and nobody wants to feed one, and you hunters already know how much work a real beast is. I sell more stuffed parrots than anything else in the shop, mostly because pirates keep sitting on 'em. Not that {pet} needs a rival, mind, and I can tell from the way it's eyeing my parrots that it doesn't approve." },
      },
      choices = {
        { text = "A beast is a partner, not a costume piece.", next = "BACK", reply = "A partner, sure, and a partner who eats twice its weight in seed a week. I'll stick to the stuffed ones, thanks.", fx = { align = { honor = 1 } } },
        { text = "A parrot that never eats sounds like a bargain to me.", next = "BACK", reply = "Now you're thinkin' like a goblin, pal! Stuffed parrot, no feed, no mess, and it never bites the customers.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The Bloodsail keep a few sea witches, or so the sailors say, and that's why their ships always find a fog bank when the Blackwater come looking. I sell fake sea witch hats too, pal, in a lovely black felt, two for the price of slightly more than one." } },
      choices = {
        { text = "I'd fight them face to face, fog or no fog.", next = "BACK", reply = "Brave, buddy, and a little foolish, because you can't fight what you can't see. Bring a lantern at least.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fog's a clever trick. I'd use it myself.", next = "BACK", reply = "Clever, pal, and I'd pay to see it done. Just don't let the Baron catch you fogging his harbour.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Oh, they're some of my best customers, pal, because a troll shaman in a captain's hat is the scariest thing on the pier. One bought my best tricorn last month and wore it while calling lightning down on a Bloodsail longboat, and I've never been prouder." } },
      choices = {
        { text = "A shaman should look like a shaman and keep the old ways.", next = "BACK", reply = "Old ways are fine, buddy, but a good hat never hurt anybody's mojo. Try it on, and the elements might like it too.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Why not? The elements won't mind a good hat.", next = "BACK", reply = "That's the spirit, pal! The elements have been waitin' for a well-dressed shaman for ten thousand years.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the real pirates don't buy them, and the tourists do, and the tourists have more money, buddy. A merchant from Stormwind will pay twice what a Bloodsail would for a hat with a feather, and I'm happy to oblige him, and then some." } },
      choices = {
        { text = "Selling to the tourists is honest work. Good on you.", next = "BACK", reply = "It is, pal, and it pays better than piracy, which surprises everybody. Tourists are the real treasure.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Selling fakes to fools is fine business too.", next = "BACK", reply = "Fakes? Pal, these are genuine costumes, I never once claimed they were real pirate gear. It's all in the sales pitch.", fx = { align = { honor = -1 } } },
        { text = "Something else, Narkk.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It repeats everything, including the curses the Bloodsail taught it, so I'd keep it away from anyone with delicate ears. It's never once cast a spell, but it sounds very impressive when it tries." } },
      choices = {
        { text = "Then I'll take the parrot. It sounds like fun.", next = "BACK", reply = "Ha! It's fun until it curses at the Baron, buddy. Keep a cloth over its cage in polite company.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A parrot shouting curses is no company for a mage.", next = "BACK", reply = "Maybe not, but it's great company for a sailor. I'll find it a buyer with a thicker skin.", fx = { align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Probably not, but you'd be the first to find out, and I'd want to hear about it either way. Either way, I'll take your coin before you try it, and the hat's yours whatever shape you end up in." } },
      choices = {
        { text = "I'd never pretend to be a pirate. It's an insult to the honest.", next = "BACK", reply = "An insult? Pal, the honest ones are a tiny fraction of the market. I'll respect your choice, but the hat's still on the shelf.", fx = { align = { honor = 1 } } },
        { text = "Fine, sell me the hat. A druid can have a little fun.", next = "BACK", reply = "That's what I like to hear, pal! Druid fun is the best fun, and this hat's never been worn by a bear.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because nobody's watching you in Booty Bay, friend, or rather everybody is and nobody cares, which comes to the same thing. I get serious folk from Stormwind and Orgrimmar who want one evening of pretending to be a buccaneer, and buccaneers who lost their hats, and both kinds pay full price." } },
      choices = {
        { text = "A knight should look like a knight, Narkk.", next = "BACK", reply = "And a knight should also have fun once in a while, friend. Booty Bay won't tell the Cathedral, I promise.", fx = { align = { order = 1 } } },
        { text = "One evening as a pirate couldn't hurt. Show me the hats.", next = "BACK", reply = "That's the spirit, pal! One evening, one hat, and a story you'll never tell your order.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Have you ever thought about an eyepatch, friend? Nobody expects a holy knight in an eyepatch, and surprise is the whole point of a costume." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! I've got a hat with a feather that'd make your totems jealous, pal, and it's priced to sell before the feather moults." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Even a holy sort needs a good hat in this sun, friend, and mine come with a feather included, which the hat shops in Ratchet charge extra for." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock! I've got an eyepatch that'd fit your imp, friend, and nobody else in the South Seas can say that." },
        { id = "h_default", key = true,
          text = "Narkk's Pirate Supplies, chum! Real pirates buy their kit off dead men, so I sell to everybody else who wants to look the part when they swagger down the pier, and the markup is the real treasure." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Evening crowd's the best for business. Folk have a few rums at the Salty Sailor and suddenly they need a tricorn, very badly, right now, at whatever price I say." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You don't need a pirate costume, pal, since you already look the part, but I'll sell you one anyway, because that's what I do." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Now, I've got a hat that would suit you, pal, and a parrot that'll sit on your shoulder and say your spells back to you." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Now, I don't sell real armor, pal, but a tricorn hat on top of that helm would make you the most fearsome-looking bosun on the pier." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! I've got a stuffed parrot for your shoulder, pal, guaranteed never to bite, never to squawk and never to fly off with your rations." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Ever wanted to look like a pirate? I've a hat that'll stay on even when you turn into a bear, buddy, or so I'm told by the goblin who sold it to me, and he gave no refunds either." },
      },
      again = { { id = "h_again", text = "What else? Try on anything but the parrot, pal; the parrot's mine and he's not for sale, today." } },
      choices = {
        { text = "Do any shamans actually buy pirate hats from you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do real pirates ever use magic out here?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Don't the real pirates mind?", next = "real" },
        { text = "Somebody must buy all this stuff.", next = "buyers" },
        { text = "A tauren in a pirate hat? Has anyone tried it?", next = "x_tauren", when = { race = "Tauren" } },
        { text = "Why sell pirate costumes in a town full of real pirates, Narkk?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does your parrot really repeat spells, Narkk?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do warriors really buy pirate costumes, Narkk?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why would a hunter want a stuffed parrot, Narkk?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Will your hat really stay on through a shapeshift, Narkk?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why would a paladin ever wear a pirate costume, Narkk?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Later.", next = "END" },
      },
    },
    real = {
      lines = {
        { id = "r_default", text = "The Blackwater lads think it's funny, and the Bloodsail think it's an insult, which makes it funnier and sells more hats. Only don't wear a red bandana out past the reef, pal, or someone will mistake you for the wrong sort." },
      },
      choices = {
        { text = "Why not red?", next = "real_red" },
        { text = "Something else.", next = "BACK" },
      },
    },
    real_red = {
      lines = {
        { id = "rr_default", text = "Bloodsail colors, friend. First Mate Crazz of the Blackwater would put a knife in you before you could explain, and then he'd feel terrible, but only a little." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "Adventurers fresh off the boat, sailors who want to impress a girl in Ratchet, and once a very serious dwarf who wanted the biggest hat I had and paid in gold without haggling. I never asked why, and he never said, and I've loved him ever since." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_tauren = {
      lines = {
        { id = "xt_default", text = "Fleet Master Seahorn did, and look how far it got him! I'll have to cut holes for the horns, but I've done it before, and I've a hat in the back that's never fit anyone smaller than a ship's mast." },
      },
      choices = {
        { text = "Cut the holes, then.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I tried being a real pirate once. The costume was the best part and the wages were terrible, so I kept the costume and let the rest go." } },
    advice = { { id = "tp_ad", text = "Every pirate needs a good hat, pal. A hat says you've plundered, even if all you've plundered is a pie." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's full of real pirates, pal, and every last one needs a proper hat. I sell the hats, and the tourists think they're getting the real thing." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail wear red bandanas, and I sell red bandanas, and the Blackwater boys get very nervous about it. I've told them it's just a costume, but they don't laugh." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire folk buy my costumes by the dozen, pal, because nobody dresses up better than carnival people. They pay well, and they haggle terribly." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I sold a pirate hat to a fighter going into the Arena once, and he won the chest wearing it. He said it was lucky, and I've doubled the price since." } },
    _none = { { id = "tp_none", text = "Never heard of it, buddy, but I could sell you a hat about it." } },
  },
}

P:NPC {
  key = "nixxrax", id = TODO_NPC("Nixxrax Fillamug"), name = "Nixxrax Fillamug",
  gender = "male",
  title = "Food & Drink",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "cheerful" }, values = { "generous", "greedy" },
  notices = { "drink" },

  impression = {
    first = "Nixxrax Fillamug sells food and drink with a sincerity that is half salesmanship and half real pleasure in feeding people. It was hard to tell where one half ended.",
    third = "{name} met Nixxrax Fillamug, who sells food and drink to the hungry of Booty Bay.",
  },

  greetings = {
    { id = "g_flirt", when = { flirt = true, chance = 0.4 }, text = "Well hello, sweetheart, the Salty Sailor just got better lookin' by a margin I can't even put a price on! Sit down, sit down, the smile's free and the bread's a copper." },
    { id = "g_flirt_warm", when = { flirt = true, npcFlagBefore = "flirt_warm" }, text = "There's my favourite customer, sweetheart! I saved you the table with only one wobbly leg, which around here counts as a reservation, and I didn't even bill you for the sentiment." },
    { id = "g_flirt_cool", when = { flirt = true, npcFlagBefore = "flirt_declined", chance = 0.5 }, text = "Food or drink, pal, strictly business, just like you asked! Then again, business is the one thing I never get tired of." },
    { id = "g_food", text = "Are you hungry or thirsty, pal? If it's both, you're my favorite kind of customer, and I've got a combination price!" },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You've had a few already, I can see that, sweetheart. Have some bread with it, only a copper, or you'll be swimming with the sharks before sunset." },
  },

  start = "hello",
  nodes = {
    flirt = {
      lines = { { id = "fl_default", text = "Every customer? No, no, I call the ones I like sweetheart, and the rest I call pal and add a copper to the bill. Listen, listen, I close the kitchen at midnight, and a goblin with a full larder and an empty table is a sad sight, so if you came by after hours, I'd call it an investment in customer relations." } },
      choices = {
        { text = "Midnight it is, then. Save me some bread.", next = "flirt_warm", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "flirt_warm" } } } },
        { text = "Is there any decent ale in that larder, goblin?", next = "flirt_ale", when = { race = "Dwarf" } },
        { text = "You're sweet, but I'm only here for the food.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "flirt_declined" } } },
          reply = "Hey, the food's the best part of me anyway, and it's on the menu every day. No hard feelings, pal, and no charge for the askin'." },
        { text = "Keep your customer relations to yourself, goblin.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 }, npcFlag = { set = { "flirt_declined" } } },
          reply = "Whoa, whoa, message received, loud and clear! The bread's still a copper, and you can have my dignity for nothin', since that's apparently what it's worth." },
      },
    },
    flirt_warm = {
      lines = { { id = "flw_default", text = "Sweetheart, you just made my whole week, and my week included a shark in the cellar! I'll wipe down the good table and light the lantern that doesn't smoke, and you'll see a goblin can be romantic when he isn't counting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flirt_ale = {
      lines = { { id = "fla_default", text = "Decent ale? Sweetheart, I've a cask of Thunderbrew that came off a smuggler's boat at a price I'd blush to tell you, and I've been savin' it for somebody who'd know the difference. Come by at midnight and I'll tap it, and we'll argue about whether dwarves or goblins brew better." } },
      choices = {
        { text = "Dwarves, obviously. I'll come and prove it.", next = "flirt_warm", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "flirt_warm" } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Too much, usually, and then they complain about it halfway up the hill to the Mosh'Ogg camp. Eat a good supper the night before, bought here, and a light breakfast on the day, friend, and you'll fight better than the fellow who stuffed himself at dawn." } },
      choices = {
        { text = "Good advice. A warrior keeps discipline at the table too.", next = "BACK", reply = "Exactly, pal, and the hill up to Mosh'Ogg will thank you. Eat light, fight heavy, and come back for supper.", fx = { align = { order = 1 } } },
        { text = "I eat what I like when I like, and fight anyway.", next = "BACK", reply = "Fight anyway, sure, and complain all the way up the hill, pal. I'll have the antacids waiting.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hunters, mostly, and fishermen, and a few sailors who bring strange things back from Jaguero Isle that I don't ask about. A good hunter keeps my kitchen going and a bad one keeps the infirmary going, so I know which ones to be nice to." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Hunters, mostly, and fishermen, and a few sailors who bring strange things back from Jaguero Isle that I don't ask about. A good hunter keeps my kitchen going and a bad one keeps the infirmary going, so I know which ones to be nice to. And your {pet} has been eyeing my sausages since you walked up, and I don't blame it one bit." },
      },
      choices = {
        { text = "I hunt for the table, never for waste.", next = "BACK", reply = "That's what I like to hear, pal! Bring me what you hunt and I'll make it worth the walk.", fx = { align = { light = 1 } } },
        { text = "I hunt for coin. If cooks pay, they get meat.", next = "BACK", reply = "Then bring me meat, pal, and I'll pay fair, which is better than most cooks in this town. Coin's coin.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They do, mostly about the haunted island the captains won't go near, where they say a ghost wrecked a ship and kept the crew. They talk with their mouths full, so I only catch half, but the half I catch is enough to put me off my dinner, and I don't put myself off dinner for nothin'." } },
      choices = {
        { text = "Someone ought to lay that ghost to rest.", next = "BACK", reply = "Someone should, pal, but don't look at me. I'll fry the fish for whoever goes.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A wreck with no crew means free cargo.", next = "BACK", reply = "Free cargo and a free haunting, pal. I'd leave that wreck alone, but I'll buy whatever you bring back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I leave a plate out back every night, and every morning it's empty, so either the spirits are hungry or the cats are fat. I'm happy to feed both, pal, though only one of them ever pays." } },
      choices = {
        { text = "Feeding hungry things is good work, whatever they are.", next = "BACK", reply = "That's what I tell myself every night, pal. Hungry spirits or hungry cats, it all evens out.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Offerings are wasted food. Sell it to the sailors instead.", next = "BACK", reply = "Waste? Pal, I'm buying luck with those plates, and luck's the best investment in this town. The sailors can buy their own.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Dried fish, salted pork and a little bread, nothing heavy, and everything wrapped so it won't make a sound when you eat it. I've had rogues tell me a crinkling wrapper nearly got them killed, so I wrap everything in cloth now, at a very small surcharge." } },
      choices = {
        { text = "That's thoughtful of you. I'll buy a few days' worth.", next = "BACK", reply = "Smart buyer, pal, and quiet food for quiet work. Nobody hears dried fish, even in a vault.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A real rogue eats before the job, not during.", next = "BACK", reply = "A real rogue eats before, during and after if he's smart, pal. I'll pack it anyway, just in case.", fx = { align = { light = -1 } } },
        { text = "Something else, Nixxrax.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A hundred times better, pal, because conjured bread fills you up and tastes of nothing at all. My fish is caught fresh off the docks, fried in good oil and served hot, and I've never once had a mage ask for a refund after the first bite." } },
      choices = {
        { text = "Real food is worth the coin. I'll try a plate.", next = "BACK", reply = "You won't regret it, pal, and your tongue will thank you. Conjured bread is for emergencies, not for living.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Conjured bread is free. Your fish isn't.", next = "BACK", reply = "Free and tasteless, pal, and you get what you pay for. When you're sick of it, my fish is waiting.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It's business, friend, mostly, but I'll tell you a secret: I'd do it for nothing if the Baron didn't charge me rent. A sailor off a long voyage looks at a hot plate like it's a miracle, and I suppose that makes me a miracle-seller, at a reasonable price." } },
      choices = {
        { text = "A full belly is a blessing. You do the Light's work.", next = "BACK", reply = "That's a kind thing to say, friend, and I'll take it to heart. A full belly's a little miracle every night.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A miracle at a price is still just a sale.", next = "BACK", reply = "Maybe so, friend, but even a sale can be a kindness. The Baron takes his cut, and I take my satisfaction.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Fruit from the jungle, bread off the boats, and fish the sailors swear by, so there's something for anyone who won't eat meat. I've a druid customer who orders nothing but melon, and I've stopped asking why, because he pays in gold and he tips." } },
      choices = {
        { text = "Simple food from the land is best. Your fruit sounds fine.", next = "BACK", reply = "Good taste, pal, simple and fresh. The fruit's picked this morning and the bread's off this morning's boat.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A druid eats like anyone else. Bring me your richest dish.", next = "BACK", reply = "Now that's a druid after my own heart, pal! Rich it is, and I'll make sure there's extra butter.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Plenty of water, salt fish and something sweet, because plate sweats the life right out of you and the salt is what you lose first. I've watched knights faint on the pier from marching about in this sun, and each poor sap told me afterward he'd skipped lunch." } },
      choices = {
        { text = "Then I'll eat on schedule, like a good soldier.", next = "BACK", reply = "That's the spirit, pal! Discipline in the stomach is discipline in the fight.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I eat when I'm hungry, schedule or no schedule.", next = "BACK", reply = "Then you'll faint on the pier, pal, and the Bruisers will charge you for the lift. Eat on schedule, trust me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_bangalash_nix", when = { killed = { name = "Bangalash" } },
          text = "Hey, aren't you the one who took down King Bangalash up at Nesingwary's camp? Old Hemet's been telling everybody about it all season, and I'd bet my last copper that the story sells more drinks than my ale does." },

        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Sit down, sit down, because you've been marching about in all that plate in this heat, and you look like someone who's forgotten the last meal that wasn't a ration." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Sit down, sit down, because every priest I've ever fed was far too thin, and I can't stand the sight of someone who blesses other people's meals and never eats one of their own." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Come and eat, sweetheart, because I hear calling all those elements works up an appetite like nothing else, and appetite's my business." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Sit, eat, and say a blessing if you like, buddy; I'll take any help I can get with the fish, and blessings don't cost me a copper." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock! I'll set out a plate for you and one for whatever's following you, and I'll charge for both." },
        { id = "h_default", key = true,
          text = "Nixxrax Fillamug, and I fill mugs, plates and bellies, in that order, for coin. Sailors come off long voyages starving for anything that isn't hardtack, and I'm here to take their gold for it, very cheerfully." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You'll want something quick and filling, I'd guess, that won't slow you down when you're sneaking about, and I've got just the thing, wrapped quiet and priced fair." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll be conjuring your own bread, I suppose, but there's no spell in the world that can match a good plate of fried fish, and I'll prove it to you." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! You'll want something with meat in it, and lots of it, pal, and I've roast boar here that'll keep you swinging till sundown, priced by the slice." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! If you've brought in any boar meat or crocolisk tail, my kitchen's interested, and if you haven't, I'll happily sell you some of mine." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, and probably hungry! Everybody who walks in from the jungle is hungry, chum, and I've never met a bear who said no to a sweet roll or quibbled over the price." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've bread in the oven, pal, and it won't wait, and burnt bread's money up the chimney." },
        { id = "h_again2", text = "More questions? Ask while you chew, buddy; chewing's good for business." },
      },
      choices = {
        { text = "Do you ever leave an offering of food for the spirits?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The crews must talk about all sorts over your food.", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What have you got?", next = "BUSINESS" },
        { text = "What's the best thing you sell?", next = "best" },
        { text = "Do you compete with the inn?", next = "skindle" },
        { text = "Got anything for the restless dead?", next = "x_scourge", when = { race = "Scourge" } },
        { text = "What do you sell that won't slow a rogue down, Nixxrax?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is your fried fish really better than conjured food, Nixxrax?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you think of feeding people as a blessing, Nixxrax?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What should a warrior eat before a fight, Nixxrax?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Where does your meat come from, Nixxrax?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "I'd guess you serve little a druid would eat, Nixxrax.", next = "xdruid", when = { class = "DRUID" } },
        { text = "What do you feed someone wearing plate in this heat, Nixxrax?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you call every customer sweetheart, Nixxrax?", next = "flirt", when = { flirt = true } },
        { text = "I'm not hungry.", next = "END" },
      },
    },
    best = {
      lines = {
        { id = "b_default", text = "Rum, for the sailors, and fresh fruit for anyone who's been at sea long enough to lose a tooth. A crate of jungle fruit sells faster than gold in this town once a crew's been out a month, and I price it accordingly." },
      },
      choices = {
        { text = "That fruit must come from somewhere.", next = "best_fruit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_fruit = {
      lines = {
        { id = "bf_default", text = "The jungle, picked by people braver than me, between the trolls and the panthers. I pay them well, pal, and I pay their widows better, because it's good for recruitment." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    skindle = {
      lines = {
        { id = "sk_default", text = "Compete? Skindle sells you a stool and a rum and a roof, and I sell you what you take away and eat on the pier. We stay out of each other's way, mostly, and out of each other's ledgers." },
      },
      choices = {
        { text = "I'll not ask about the mostly.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_scourge = {
      lines = {
        { id = "xs_default", text = "I've never had to ask before! Do you even eat, or is it more of a habit? Either way, I'll sell you whatever you like, and I won't ask where it goes." },
      },
      choices = {
        { text = "It's mostly habit.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Booty Bay born, Booty Bay fed, pal. I've never been hungry a day in my life, and I'd like you to say the same, for a very reasonable price." } },
    advice = { { id = "tp_ad", text = "Never drink the water on a ship that's been out more than a week, chum. Drink the rum instead, which I happen to sell." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the best-fed town on the coast, pal, and I like to think I've had a hand in that. Nobody goes hungry here, unless they're broke." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The fighters coming back from the Arena eat like wolves, pal, and they pay in loot instead of coin more often than not. I've got quite a collection of daggers now." } },
    theramore = { { id = "tp_theramore", text = "Theramore cooking is all boiled meat and bread, pal, the Kul Tiran way, and I'd like to send them a few of my recipes. The marsh has fine crabs going to waste." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire food is overpriced and undercooked, pal, and I've told them so. They still sell more than I do when they're in town, which I'm trying not to take personally." } },
    _none = { { id = "tp_none", text = "Can't eat it, can't drink it, can't sell it, so I can't help you with it, pal." } },
  },
}

P:NPC {
  key = "xizk", id = TODO_NPC("Xizk Goodstitch"), name = "Xizk Goodstitch",
  title = "Tailoring Supplies",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "fussy" }, values = { "proud", "practical" },
  notices = { "craft" },

  impression = {
    first = "Xizk Goodstitch can tell a good seam from across the room and winces at a bad one. Selling thread to sailmakers and pirates has given Xizk strong opinions on both.",
    third = "{name} met Xizk Goodstitch, who sells thread, cloth and patterns in Booty Bay.",
  },

  greetings = {
    { id = "g_cloth", text = "I've thread, cloth and patterns for anyone who sews, pal, but please don't touch the silk with tar on your hands, because you'll be buying the whole bolt." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor, I can see it in your stitching. Who did your hem? Never mind; I'm sure they meant well, and I'm sure they charged too much." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a tabard says who you fight for, and a frayed one says nobody's looking after you, and nobody hires a soldier who looks cheap. Stitch it right and stitch it tight, I always say, and you'll look like a soldier and not a scarecrow out of Westfall." } },
      choices = {
        { text = "You're right. A soldier should look after his colors.", next = "BACK", reply = "There's a soldier who listens! Bring it by, pal, and I'll have it looking like parade day by morning.", fx = { align = { order = 1 } } },
        { text = "My tabard's torn from fighting. That's all it needs to say.", next = "BACK", reply = "It says plenty, pal, mostly that nobody loves you. Bring it in, and I'll make it say something better.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Silk outlasts anything else in this damp, pal, while wool rots and linen tears on the first thornbush, so the clever hunters line their cloaks with mageweave and pay me the difference. Not that many hunters are clever about cloth, I'll say that much." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Silk outlasts anything else in this damp, pal, while wool rots and linen tears on the first thornbush, so the clever hunters line their cloaks with mageweave. Not that many hunters are clever about cloth, I'll say that much. And your {pet}'s been snagging that cloak too, I'd wager, which nobody ever thinks about when they buy one." },
      },
      choices = {
        { text = "I mend my gear every night. Habit keeps you alive.", next = "BACK", reply = "That's how hunters live long in this jungle, pal. A good habit is the best seam there is.", fx = { align = { order = 1 } } },
        { text = "I don't fuss over cloth. The jungle tears it anyway.", next = "BACK", reply = "The jungle tears it, sure, and then mold eats what's left, pal. A little fuss saves a lot of coin.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Mageweave can stand up to a mage and silk can stand up to a priest, but nothing stands up to a shaman who forgets which hand the lightning comes out of. Bring me whatever's left, and I'll mend it, at the burn rate." } },
      choices = {
        { text = "Fair warning. I'll take more care with the elements.", next = "BACK", reply = "Good, pal, because my silk can't take another lightning bolt. Mind the sparks, and I'll mind the seams.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements are wild, and so am I. Charge me extra.", next = "BACK", reply = "Extra it is, pal, and I'll put a lightning clause in the receipt. Wild shamans pay double.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Tightly woven wool, dyed dark and oiled against the damp, and stitched with a seam that won't catch on every branch. Most tailors get the seam wrong, and that's what makes the noise, not the cloth." } },
      choices = {
        { text = "Good seams make good work. I'll buy the oiled wool.", next = "BACK", reply = "Smart choice, pal, and it'll last longer than most of your marks. Quiet seams for quiet work.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Any cloth works if you're skilled enough.", next = "BACK", reply = "Skill helps, sure, but a snag on a thorn gives you away every time. Good cloth's the rogue's best friend, pal.", fx = { align = { order = -1 } } },
        { text = "Something else, Xizk.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nothing, which is the most frustrating thing anyone's ever told me, because I've tried for years to make cloth that survives a sail tearing, and you lot just do it with magic. I'd pay good gold to see the stitching on a druid's robe up close." } },
      choices = {
        { text = "Some things should stay a mystery, Xizk. The magic's not for sale.", next = "BACK", reply = "A mystery's a lousy business model, pal, but I'll respect it. Keep your secrets, and I'll keep guessing.", fx = { align = { order = 1 } } },
        { text = "Study what you like. Knowledge shared helps everyone.", next = "BACK", reply = "That's the spirit, pal! Bring me a scrap of whatever you wear and I'll pay you in stitches.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It matters to anyone who looks at you, friend, and a paladin's tabard is the first thing they look at, before the hammer and long before the face. If you're going to wear your order's colors through a pirate town, wear them mended, because a tatty tabard says nobody cares about you, and the Bloodsail notice that sort of thing." } },
      choices = {
        { text = "You're right. I'll have it mended properly.", next = "BACK", reply = "Smart paladin, pal, and you'll look like a hero again. I'll have it done by sunset.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them judge my deeds, not my tabard.", next = "BACK", reply = "Your deeds and your tabard both speak, pal, and one of them's in tatters. I'll fix whichever you bring in.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, and look at that tabard, frayed at the hem and stained at the shoulder. You polish your plate like a mirror and treat the cloth like a dishrag, and I see it every single time." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your robes are a disgrace, sweetheart, and I say that with respect, because I can mend them at very reasonable prices." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, in that robe? Whatever you serve, I'm sure it never asked you to sweat through it." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Your sleeves are scorched at the cuffs, which tells me everything about your last fight and nothing good about your tailor." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Felcloth, is it? I don't stock it and I won't touch it for any price, but I'll mend the plain cloth underneath, for a fee." },
        { id = "h_default", key = true,
          text = "Xizk Goodstitch, supplier of thread and fine cloth. Booty Bay goes through more canvas than anywhere in the South Seas, what with all the sails and all the cannonballs going through them, and every hole is money in my pocket." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want dark cloth that doesn't rustle, and I've got bolts of it, though I'll warn you the jungle's damp will rot it faster than you'd like." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! I can see from here that your tabard's coming apart at the shoulder seam, and I can hardly bear to look at it, though I'll happily bear to quote you a price." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. Your cloak's all burrs and thorns, which I'd expect from the jungle, but some of those snags will be holes by the end of the week." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Your robes must take a beating when you change shape, so I'll wager you're here for a needle, and I'll wager the price twice." },
      },
      again = { { id = "h_again", text = "Anything else? Quickly, pal, before the damp gets into the wool and the wool gets into my profits." } },
      choices = {
        { text = "Can your cloth stand up to lightning and fire?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Somebody must buy most of what you sell.", next = "buyers" },
        { text = "How do you keep cloth dry in this heat?", next = "damp" },
        { text = "I need cloth that can take a spell.", next = "x_caster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "A rogue would want cloth that moves quietly, Xizk.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why does a torn tabard bother you so much, Xizk?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What cloth holds up best in the jungle, Xizk?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What happens to a druid's robes when the druid becomes a bear?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does a frayed tabard really matter that much, Xizk?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Later.", next = "END" },
      },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "The sailmakers for the Blackwater ships, who buy canvas by the bolt and then complain about the price by the yard. After a fight with the Bloodsail, they buy twice as much and complain twice as loudly, and I smile and count it." },
      },
      choices = {
        { text = "Does the Baron buy from you?", next = "buyers_baron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_baron = {
      lines = {
        { id = "bb_default", text = "The Baron buys silk for his coats and argues every coin of it with Krazek watching. I respect that; a goblin who haggles over his own vanity knows the worth of things." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    damp = {
      lines = {
        { id = "d_default", text = "Cedar chests, oilcloth and prayer. Mold is the enemy of every tailor in this cove, and it eats more profit than the Bloodsail ever did, and it never sleeps, so neither do I, not much." },
      },
      choices = {
        { text = "That sounds exhausting.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_caster = {
      lines = {
        { id = "xc_default", text = "Then you want silk and mageweave, and you want it stitched tight, because loose thread burns first when the magic goes wrong. I've seen the scorch marks on more robes than I'd like to admit." },
      },
      choices = {
        { text = "Tight stitches it is.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sewed sails before I sewed silks, and I still say a sail is the harder job, though the silks pay better." } },
    advice = { { id = "tp_ad", text = "Store your cloth with cedar, never with fish, pal. You'd be amazed how many people need telling, and how many come back to buy new cloth." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's a sailor's town, so I mend more sails than silks, and I don't complain. Every ship that comes in has something torn, and I've got the thread for it." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail sails are badly sewn and patched with whatever they've stolen, and I can spot one from the dock. That's how I know they're coming, before anyone else does." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire tents are the finest silk work I've ever seen, pal, and I've tried for years to find out who sews them. Silas Darkmoon won't say a word." } },
    theramore = { { id = "tp_theramore", text = "Theramore's sailmakers do good work, the Kul Tiran way, tight stitches and heavy canvas. I've copied a few of their tricks." } },
    _none = { { id = "tp_none", text = "Not cloth, not thread, not my business, and not my money." } },
  },
}
