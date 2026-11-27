local P = RPGDialogueAPI:Pack("rpgd.world")

-- Bark-only passing pools for towns and outposts (non-capital communities).

P:Pool {
  id = "passt_goldshire_citizen", role = "citizen", community = "goldshire",
  barks = {
    { id = "b_h_noble0", when = { holiday = "noblegarden" }, text = "There are Noblegarden eggs hidden all through Goldshire, {class}. The children have been at it since dawn." },
    { id = "b_h_hallo1", when = { holiday = "hallows_end" }, text = "The Lion's Pride has a bucket of Hallow's End sweets by the door, if you knock politely." },
    { id = "b_goldshire_1", text = "Mind the road past the Lion's Pride, friend; Marshal Dughan says the kobolds have been seen as far as the Fargodeep Mine." },
    { id = "b_goldshire_2", text = "If you're headed for Stormwind, it's straight up the road and you can't miss the gates." },
    { id = "b_goldshire_3", text = "The Defias have been bold of late, so keep an eye on your purse between here and the Westfall border." },
    { id = "b_goldshire_4", when = { timeOfDay = "night" }, text = "Late for travelling, isn't it? The Lion's Pride still has candles lit, if you need a bed." },
    { id = "b_goldshire_5", when = { timeOfDay = "dawn" }, text = "Morning, {class}! The bells from Northshire carry all the way down here on a still day like this." },
    { id = "b_goldshire_6", when = { pet = { type = "Beast" } }, text = "What a handsome animal {pet} is! Keep it clear of the Maclure and Stonefield feud, though, or it'll be dragged in." },
    { id = "b_goldshire_7", when = { maxLevel = 10 }, text = "New out of Northshire Abbey, are you? Don't go wandering into Jasperlode Mine without a friend." },
    { id = "b_goldshire_8", when = { ghost = true }, text = "Light preserve us, a spirit in Goldshire! The graveyard's that way, and I'll pray you find your body." },
    { id = "b_goldshire_9", when = { mounted = true }, text = "Slow that mount down in the square, if you please; the children play right in the road." },
    { id = "b_goldshire_10", when = { class = "PALADIN" }, text = "Light be with you, {class}. It eases the heart to see one of the Church's own passing through." },
    { id = "b_goldshire_11", when = { timesTalked = { min = 5 } }, text = "Back again, {name}? You'll be wearing a rut in our road at this rate, though I don't mind it." },
    { id = "b_goldshire_12", when = { disposition = { min = 65 } }, text = "Good to see you, {name}; you're one of the few strangers I'd trust to watch my cart." },
  },
}

P:Pool {
  id = "passt_goldshire_guard", role = "guard", community = "goldshire",
  barks = {
    { id = "b_goldshire_g1", text = "Keep to the roads, citizen, and report any Defias sightings to Marshal Dughan at once." },
    { id = "b_goldshire_g2", text = "The kobolds in the Fargodeep Mine are getting bolder, so watch yourself if you go near the hills." },
    { id = "b_goldshire_g3", when = { timeOfDay = "night" }, text = "Quiet night so far, and I'd like it to stay that way, {class}." },
    { id = "b_goldshire_g4", when = { class = "ROGUE" }, text = "I'll be keeping an eye on you, {class}; we've had enough cutpurses on this road." },
    { id = "b_goldshire_g5", when = { maxLevel = 8 }, text = "You look green, {g:lad|lass}. Mind the wolves past the Eastvale and don't take on more than you can handle." },
    { id = "b_goldshire_g6", when = { ghost = true }, text = "By the Light, you're a ghost! The Spirit Healer can help you; I certainly can't." },
    { id = "b_goldshire_g7", when = { mounted = true }, text = "Mind the speed through town, rider; there's a stable for that beast behind the inn." },
    { id = "b_goldshire_g8", when = { word = "helped" }, text = "You've done good work for the Watch, {name}, and the marshal knows it." },
    { id = "b_goldshire_g9", when = { faction = "Horde" }, text = "You're a long way from home, stranger, so keep your blade sheathed and your business quick." },
    { id = "b_goldshire_g10", text = "Stormwind Guard, Elwynn detachment, keeping the peace whether the peace wants keeping or not." },
  },
}

P:Pool {
  id = "passt_northshire_citizen", role = "citizen", community = "northshire",
  barks = {
    { id = "b_northshire_1", text = "Brother Sammuel's been training recruits since dawn, and I've not heard him stop for breath once." },
    { id = "b_northshire_2", text = "The kobolds in the Echo Ridge Mine have been stealing candles again, if you can believe it." },
    { id = "b_northshire_3", text = "Mind the vineyard on your way out; the Defias have taken it over, and the brothers are furious." },
    { id = "b_northshire_4", when = { timeOfDay = "dawn" }, text = "The Abbey bells will ring for morning prayer soon, {class}, so walk softly by the chapel." },
    { id = "b_northshire_5", when = { timeOfDay = "night" }, text = "The Abbey grounds are peaceful at night, though I keep hearing the wolves up on the hill." },
    { id = "b_northshire_6", when = { maxLevel = 5 }, text = "You're fresh to the Abbey, aren't you? Speak to Deputy Willem by the doors; he'll set you right." },
    { id = "b_northshire_7", when = { class = "PRIEST" }, text = "Light keep you, {class}. Some of the novices could stand to learn from you." },
    { id = "b_northshire_8", when = { class = "WARLOCK" }, text = "I don't know what business your kind has at a holy Abbey, but behave yourself here." },
    { id = "b_northshire_9", when = { ghost = true }, text = "Oh! A soul still wandering? Go gently, friend; the Light is close in Northshire." },
    { id = "b_northshire_10", when = { pet = { type = "Beast" } }, text = "Keep {pet} away from the Abbey's chickens, would you? Brother Neals counts them every morning." },
    { id = "b_northshire_11", when = { timesTalked = { min = 5 } }, text = "You keep coming back to the Abbey, {name}; perhaps you've a calling after all." },
  },
}

P:Pool {
  id = "passt_lakeshire_citizen", role = "citizen", community = "lakeshire",
  barks = {
    { id = "b_h_love_6", when = { holiday = "love_is_in_the_air" }, text = "Love is in the Air in Lakeshire, {class}, which is lovely, because nothing else is." },
    { id = "b_lakeshire_1", text = "The Blackrock orcs burned the bridge again, and Magistrate Solomon's letters to Stormwind go unanswered." },
    { id = "b_lakeshire_2", text = "Mind the Redridge gnolls along the lake shore; they've been raiding the fishing huts all season." },
    { id = "b_lakeshire_3", text = "If you see Bellygrub the boar near the Lakeshire road, give him a wide berth; he's bigger than a cart." },
    { id = "b_lakeshire_4", text = "Stonewatch Keep is full of orcs now, and every night we watch their fires on the hills." },
    { id = "b_lakeshire_5", when = { timeOfDay = "night" }, text = "The lake's beautiful at night, but I don't look at the far shore too long, not with the orcs over there." },
    { id = "b_lakeshire_6", when = { timeOfDay = "dawn" }, text = "Early start, {class}? The fishermen were out before the mist lifted off Lake Everstill." },
    { id = "b_lakeshire_7", when = { race = "Orc" }, text = "Stay where I can see you... oh, you're one of ours, aren't you? Sorry, it's those Blackrock orcs." },
    { id = "b_lakeshire_8", when = { maxLevel = 16 }, text = "Redridge is no place for the unready, {g:lad|lass}, so stay clear of the Burning Steppes road." },
    { id = "b_lakeshire_9", when = { class = "WARRIOR" }, text = "A {class}! Good, we need every sword we can get, with the Blackrock about." },
    { id = "b_lakeshire_10", when = { ghost = true }, text = "A spirit on the lake road! The poor soul, the Blackrock have claimed another." },
    { id = "b_lakeshire_11", when = { mounted = true }, text = "Careful on that mount; the new bridge planks aren't half as sturdy as the old stone ones were." },
    { id = "b_lakeshire_12", when = { word = "helped" }, text = "You helped us, {name}, and Lakeshire doesn't forget a friend in hard times." },
    { id = "b_lakeshire_13", when = { disposition = { min = 65 } }, text = "Glad to see you again, {name}; the town sleeps a little easier when you're about." },
  },
}

P:Pool {
  id = "passt_lakeshire_guard", role = "guard", community = "lakeshire",
  barks = {
    { id = "b_lakeshire_g1", text = "Keep your eyes on the hills, {class}; the Blackrock scouts have been spotted near Render's Valley." },
    { id = "b_lakeshire_g2", text = "Report to Marshal Marris if you've news of the gnolls; Redridge Militia needs every scrap of it." },
    { id = "b_lakeshire_g3", text = "The bridge is ours for now, and we mean to keep it that way." },
    { id = "b_lakeshire_g4", when = { timeOfDay = "night" }, text = "Night watch is the worst of it; you never know if that's a wolf or a Blackrock scout out there." },
    { id = "b_lakeshire_g5", when = { class = "HUNTER" }, text = "A {class}, good. If you can track a gnoll, the militia would take any help you give." },
    { id = "b_lakeshire_g6", when = { maxLevel = 15 }, text = "You're young for Redridge, so don't go near Stonewatch Keep alone." },
    { id = "b_lakeshire_g7", when = { ghost = true }, text = "You've fallen, ghost; don't let the orcs see your body before you get back to it." },
    { id = "b_lakeshire_g8", when = { faction = "Horde" }, text = "Horde in Redridge? Move on before the militia mistakes you for Blackrock." },
    { id = "b_lakeshire_g9", when = { word = "helped" }, text = "The militia remembers what you did for us, {name}." },
    { id = "b_lakeshire_g10", when = { timesTalked = { min = 5 } }, text = "Good to see you, {name}; you've become a familiar face on the bridge." },
  },
}

P:Pool {
  id = "passt_darkshire_citizen", role = "citizen", community = "darkshire",
  barks = {
    { id = "b_h_hallo7", when = { holiday = "hallows_end" }, text = "Hallow's End in Darkshire is no great change, {class}. We've had real ghosts all year." },
    { id = "b_darkshire_1", text = "Don't stay out past dark, stranger; the worgen come down from the Raven Hill road when the moon is up." },
    { id = "b_darkshire_2", text = "Stitches walks the road from Raven Hill, and the Night Watch can't stop him alone." },
    { id = "b_darkshire_3", text = "Morbent Fel and his dead hold the Raven Hill cemetery, and no one sleeps soundly with that so near." },
    { id = "b_darkshire_4", text = "The Night Watch could use another sword, though I'd not ask it of anyone who values their sleep." },
    { id = "b_darkshire_5", when = { timeOfDay = "night" }, text = "Keep to the lamplight, {class}; Duskwood's dark has a way of swallowing people whole." },
    { id = "b_darkshire_6", when = { timeOfDay = "dusk" }, text = "Dusk again, and the lanterns don't burn as long as they used to, it seems." },
    { id = "b_darkshire_7", when = { race = "Scourge" }, text = "What... you're one of those Forsaken? Get out of Darkshire before the Watch sees you!" },
    { id = "b_darkshire_8", when = { class = "PRIEST" }, text = "A {class}, Light be thanked. Say a prayer for Duskwood, would you? We need it." },
    { id = "b_darkshire_9", when = { maxLevel = 20 }, text = "You look a bit young to be wandering Duskwood, {g:lad|lass}; the worgen don't care how brave you are." },
    { id = "b_darkshire_10", when = { ghost = true }, text = "A ghost? Oh, that's not a good sign for Darkshire. Go to the healer quickly, spirit." },
    { id = "b_darkshire_11", when = { pet = { type = "Beast" } }, text = "Keep {pet} close; the worgen eat dogs and wolves the same as us." },
    { id = "b_darkshire_12", when = { word = "helped" }, text = "You helped the Watch, {name}; there's a little more light in Darkshire for it." },
    { id = "b_darkshire_13", when = { timesTalked = { min = 5 } }, text = "You keep returning, {name}, though most who leave Duskwood never look back." },
  },
}

P:Pool {
  id = "passt_darkshire_guard", role = "guard", community = "darkshire",
  barks = {
    { id = "b_darkshire_g1", text = "The Night Watch stands, but our numbers thin every week, {class}." },
    { id = "b_darkshire_g2", text = "Commander Althea Ebonlocke wants volunteers; the worgen grow bolder every night." },
    { id = "b_darkshire_g3", text = "If you hear a cart rattling on the Raven Hill road, it might be Stitches, so run." },
    { id = "b_darkshire_g4", when = { timeOfDay = "night" }, text = "Stay inside the lantern circle tonight; anything outside it is fair game for the worgen." },
    { id = "b_darkshire_g5", when = { class = "MAGE" }, text = "A {class}? Good, the dead out at Raven Hill hate fire." },
    { id = "b_darkshire_g6", when = { maxLevel = 18 }, text = "You're too young for the Night Watch, but stay close and keep your eyes open." },
    { id = "b_darkshire_g7", when = { ghost = true }, text = "Spirit, the worgen didn't spare you, I see. The Light guide you back." },
    { id = "b_darkshire_g8", when = { faction = "Horde" }, text = "Horde in Duskwood? You've got a death wish, coming this far into the dark." },
    { id = "b_darkshire_g9", when = { word = "helped" }, text = "The Watch is in your debt, {name}, and we don't say that lightly." },
    { id = "b_darkshire_g10", when = { disposition = { min = 65 } }, text = "Good to see you safe, {name}; plenty don't come back from the woods." },
  },
}

P:Pool {
  id = "passt_sentinel_hill_citizen", role = "citizen", community = "sentinel_hill",
  barks = {
    { id = "b_sentinel_hill_1", text = "The Defias Brotherhood holds half of Westfall now, and Gryan Stoutmantle can't keep them out of the farms." },
    { id = "b_sentinel_hill_2", text = "The harvest golems at the Saldean farm went mad, and now nobody dares work the fields." },
    { id = "b_sentinel_hill_3", text = "If you've food to spare, the refugees by the tower would thank you for it, though they'll never ask." },
    { id = "b_sentinel_hill_4", text = "Moonbrook belongs to the Defias now, and folks say there's something worse under the old mines." },
    { id = "b_sentinel_hill_5", when = { timeOfDay = "dusk" }, text = "The dust storms come in with dusk, {class}, so keep your mouth shut and your eyes squinted." },
    { id = "b_sentinel_hill_6", when = { timeOfDay = "night" }, text = "The People's Militia keep watch at night, but the Defias have always been bold in the dark." },
    { id = "b_sentinel_hill_7", when = { class = "ROGUE" }, text = "I hope you're not one of those red-bandana sorts, {class}, because we've no patience for them here." },
    { id = "b_sentinel_hill_8", when = { maxLevel = 15 }, text = "The Dead Acre's crawling with gnolls, {g:lad|lass}, so stay off the eastern roads if you're green." },
    { id = "b_sentinel_hill_9", when = { ghost = true }, text = "Another poor soul lost to Westfall's troubles. The Light keep you, spirit." },
    { id = "b_sentinel_hill_10", when = { pet = { type = "Beast" } }, text = "Watch {pet} around the harvest watchers; they'll swat a hound as soon as look at it." },
    { id = "b_sentinel_hill_11", when = { word = "helped" }, text = "You've done right by Westfall, {name}, and the militia knows your name now." },
    { id = "b_sentinel_hill_12", when = { timesTalked = { min = 5 } }, text = "Back at Sentinel Hill again, {name}? It's good to see someone who doesn't run from this place." },
  },
}

P:Pool {
  id = "passt_sentinel_hill_guard", role = "guard", community = "sentinel_hill",
  barks = {
    { id = "b_sentinel_hill_g1", text = "People's Militia, {class}. We don't have much, but we hold this hill." },
    { id = "b_sentinel_hill_g2", text = "Gryan Stoutmantle wants any word on the Defias passed to him in the tower." },
    { id = "b_sentinel_hill_g3", text = "Keep clear of Moonbrook unless you've friends with you; the Brotherhood guards it closely." },
    { id = "b_sentinel_hill_g4", when = { timeOfDay = "night" }, text = "Night's when the Defias raid; we keep our torches lit and our bows strung." },
    { id = "b_sentinel_hill_g5", when = { class = "WARRIOR" }, text = "Good to see a proper {class} in Westfall; the militia's mostly farmers with pitchforks." },
    { id = "b_sentinel_hill_g6", when = { maxLevel = 12 }, text = "You're green, {g:lad|lass}, so stick to the near fields until you've some steel behind you." },
    { id = "b_sentinel_hill_g7", when = { ghost = true }, text = "Back to your body, ghost; the militia can't spare the time to carry it." },
    { id = "b_sentinel_hill_g8", when = { faction = "Horde" }, text = "Horde on Sentinel Hill? Keep walking, and keep your hands off the refugees." },
    { id = "b_sentinel_hill_g9", when = { word = "helped" }, text = "Stoutmantle speaks well of you, {name}; that's rare praise." },
    { id = "b_sentinel_hill_g10", when = { disposition = { min = 65 } }, text = "Glad you're with us, {name}; Westfall needs friends like you." },
  },
}

P:Pool {
  id = "passt_menethil_citizen", role = "citizen", community = "menethil",
  barks = {
    { id = "b_h_child8", when = { holiday = "childrens_week" }, text = "Children's Week brings the orphans through on the boats. Be kind to them if you pass." },
    { id = "b_menethil_1", text = "The ships to Auberdine and Theramore sail from the docks, and the Dragonmaw keep the road to Ironforge dangerous." },
    { id = "b_menethil_2", text = "The fog came in thick off the Wetlands bay again, and it smells like rot and old sails." },
    { id = "b_menethil_3", text = "The Dragonmaw orcs at Grim Batol have dragons, they say, so keep your eyes on the sky." },
    { id = "b_menethil_4", text = "Don't trust the Dark Iron dwarves digging near Thandol Span; they're no friends of Ironforge." },
    { id = "b_menethil_5", when = { timeOfDay = "night" }, text = "The harbour lights don't do much in the mist, so mind the edges of the dock tonight." },
    { id = "b_menethil_6", when = { timeOfDay = "dawn" }, text = "Morning, {class}. The fishing boats are out early; with the crocolisks in the bay, they need the luck." },
    { id = "b_menethil_7", when = { race = "Dwarf" }, text = "Ah, a dwarf! If you're bound for Ironforge, mind the Dragonmaw on the Dun Algaz road." },
    { id = "b_menethil_8", when = { race = "NightElf" }, text = "Bound for Darkshore, friend? The ship to Auberdine leaves from the far pier." },
    { id = "b_menethil_9", when = { maxLevel = 25 }, text = "The Wetlands are full of raptors and murlocs, {g:lad|lass}, so keep to the road." },
    { id = "b_menethil_10", when = { ghost = true }, text = "A spirit on the docks? Don't drift into the bay; the water's cold enough to kill a second time." },
    { id = "b_menethil_11", when = { mounted = true }, text = "Lead that beast on foot near the dock; the boards are slippery as eels in this weather." },
    { id = "b_menethil_12", when = { word = "helped" }, text = "You helped Menethil, {name}, and I'll drink to that tonight." },
  },
}

P:Pool {
  id = "passt_menethil_guard", role = "guard", community = "menethil",
  barks = {
    { id = "b_menethil_g1", text = "The Dragonmaw are raiding the roads, {class}, so keep your weapon close past the keep." },
    { id = "b_menethil_g2", text = "Menethil Harbor holds, and the Alliance ships still come in, whatever the orcs might think." },
    { id = "b_menethil_g3", text = "Report any Dark Iron sightings near Thandol Span to the harbor master." },
    { id = "b_menethil_g4", when = { timeOfDay = "night" }, text = "Fog and darkness, the worst watch there is; I can't see the end of the pier." },
    { id = "b_menethil_g5", when = { class = "PALADIN" }, text = "A {class}? Good, the Dragonmaw at Grim Batol could use a lesson in the Light." },
    { id = "b_menethil_g6", when = { maxLevel = 22 }, text = "The Wetlands are harsh for the young, so keep to the road and the docks." },
    { id = "b_menethil_g7", when = { ghost = true }, text = "Spirit, your body's somewhere out in the marsh; best go find it." },
    { id = "b_menethil_g8", when = { faction = "Horde" }, text = "Horde in Menethil? Get back on your boat before the Watch takes notice." },
    { id = "b_menethil_g9", when = { word = "helped" }, text = "The harbor's grateful for your help, {name}." },
    { id = "b_menethil_g10", when = { timesTalked = { min = 5 } }, text = "Welcome back to Menethil, {name}; the fog suits you, I think." },
  },
}

P:Pool {
  id = "passt_southshore_citizen", role = "citizen", community = "southshore",
  barks = {
    { id = "b_h_harve5", when = { holiday = "harvest" }, text = "We'll set a place for the fallen at the Harvest feast tonight. Too many of them were from Southshore." },
    { id = "b_southshore_1", text = "Tarren Mill's Forsaken are only a short ride north, and they've been poisoning our wells." },
    { id = "b_southshore_2", text = "The Syndicate prowls the hills around Durnholde Keep, so keep your purse close." },
    { id = "b_southshore_3", text = "Old Durnholde, where Thrall was kept as a slave, is full of Syndicate thieves now." },
    { id = "b_southshore_4", text = "The fishing's good off Southshore, but the murlocs think it's their bay." },
    { id = "b_southshore_5", when = { timeOfDay = "night" }, text = "Quiet night for once, {class}; let's pray the Forsaken stay up the hill till dawn." },
    { id = "b_southshore_6", when = { timeOfDay = "dawn" }, text = "Dawn over the Hillsbrad sea is lovely, though you'd not know it from the gloom in the town." },
    { id = "b_southshore_7", when = { race = "Human" }, text = "Back from the old lands of Lordaeron, are you? It's grim up north, so stay safe." },
    { id = "b_southshore_8", when = { class = "PALADIN" }, text = "Light bless you, {class}; Southshore needs its paladins now more than ever." },
    { id = "b_southshore_9", when = { maxLevel = 25 }, text = "You're young for Hillsbrad, {g:lad|lass}, and the Forsaken don't spare youngsters." },
    { id = "b_southshore_10", when = { ghost = true }, text = "A ghost? Oh, the Forsaken have claimed another poor soul." },
    { id = "b_southshore_11", when = { pet = { type = "Beast" } }, text = "Keep {pet} out of the fields; the farmers don't take kindly to beasts after the plague scare." },
    { id = "b_southshore_12", when = { word = "helped" }, text = "You've helped Southshore, {name}, and that's not forgotten." },
  },
}

P:Pool {
  id = "passt_southshore_guard", role = "guard", community = "southshore",
  barks = {
    { id = "b_southshore_g1", text = "The Forsaken from Tarren Mill are always testing our lines, {class}." },
    { id = "b_southshore_g2", text = "Report any Syndicate or Forsaken movement to Magistrate Henry Maleb." },
    { id = "b_southshore_g3", text = "Southshore stands, though the plague's shadow is never far." },
    { id = "b_southshore_g4", when = { timeOfDay = "night" }, text = "Night watch, eyes north, and pray to the Light the dead stay up the hill." },
    { id = "b_southshore_g5", when = { class = "WARRIOR" }, text = "A {class}, good. We could use your blade against Tarren Mill's dead." },
    { id = "b_southshore_g6", when = { maxLevel = 25 }, text = "Hillsbrad's rough for youngsters, so don't wander too close to Tarren Mill." },
    { id = "b_southshore_g7", when = { ghost = true }, text = "Spirit, go to the healer; the Forsaken would love to see you stay dead." },
    { id = "b_southshore_g8", when = { faction = "Horde" }, text = "Horde in Southshore? Turn around before the Watch decides you're a raider." },
    { id = "b_southshore_g9", when = { word = "helped" }, text = "The Watch is grateful, {name}; you've earned your place here." },
    { id = "b_southshore_g10", when = { disposition = { min = 65 } }, text = "Good to see you safe, {name}; Southshore needs more like you." },
  },
}

P:Pool {
  id = "passt_thelsamar_citizen", role = "citizen", community = "thelsamar",
  barks = {
    { id = "b_thelsamar_1", text = "The troggs in Loch Modan come up from the deeps, and they've been at the dig sites again." },
    { id = "b_thelsamar_2", text = "Stonesplinter troggs and Dark Iron raiders, it's a wonder the miners get anything done at all." },
    { id = "b_thelsamar_3", text = "The Stonewrought Dam holds back the loch, and the engineers mutter about cracks." },
    { id = "b_thelsamar_4", when = { timeOfDay = "night" }, text = "Quiet night by the loch, {g:lad|lass}; you'd almost forget the troggs are out there." },
    { id = "b_thelsamar_5", when = { timeOfDay = "dawn" }, text = "Up early, {class}? The fishermen are out on the loch already, and the mist's lovely." },
    { id = "b_thelsamar_6", when = { race = "Gnome" }, text = "A gnome! Have ye heard any word from Gnomeregan? Some of the refugees passed through last week." },
    { id = "b_thelsamar_7", when = { class = "HUNTER" }, text = "A {class}, eh? The bears up by the Silver Stream Mine have been bold this year." },
    { id = "b_thelsamar_8", when = { maxLevel = 15 }, text = "Loch Modan's no place for the green, {g:lad|lass}; watch out for the troggs." },
    { id = "b_thelsamar_9", when = { ghost = true }, text = "A ghost by the loch? Ye've had bad luck, friend; go and find yer body." },
    { id = "b_thelsamar_10", when = { mounted = true }, text = "Mind that mount on the bridge; the boards are older than my grandfather." },
    { id = "b_thelsamar_11", when = { word = "helped" }, text = "Ye helped Thelsamar, {name}, an' that's worth a toast by the forge." },
  },
}

P:Pool {
  id = "passt_kharanos_citizen", role = "citizen", community = "kharanos",
  barks = {
    { id = "b_h_winte2", when = { holiday = "winter_veil" }, text = "Winter Veil in Kharanos, {g:lad|lass}! There's snow on the roofs and Thunderbrew in every hand." },
    { id = "b_h_midsu3", when = { holiday = "midsummer" }, text = "Even in the snow we light a Midsummer fire. It's a dwarf's duty to defy the weather." },
    { id = "b_kharanos_1", text = "The troggs from Gnomeregan have been poking up all over Dun Morogh since the gnomes lost their city." },
    { id = "b_kharanos_2", text = "The Thunderbrew distillery's ale is the finest in Khaz Modan, an' I'll fight anyone who says otherwise." },
    { id = "b_kharanos_3", text = "Mind the Frostmane trolls in the hills; they've been raidin' the shepherds again." },
    { id = "b_kharanos_4", text = "The snow's comin' down heavy over Dun Morogh, so keep yer cloak tight and yer ale warm." },
    { id = "b_kharanos_5", when = { timeOfDay = "night" }, text = "Cold night, {g:lad|lass}; the Thunderbrew's got a fire goin' if ye want to thaw yer toes." },
    { id = "b_kharanos_6", when = { timeOfDay = "dawn" }, text = "Mornin', {class}! The snow's fresh, an' the yeti tracks up by the ridge are fresher still." },
    { id = "b_kharanos_7", when = { race = "Gnome" }, text = "Ah, a gnome. Sorry about Gnomeregan, {g:lad|lass}; Mekkatorque'll set it right someday." },
    { id = "b_kharanos_8", when = { class = "PALADIN" }, text = "A {class}, eh? Good, the Light's a fine thing to have in a snowstorm." },
    { id = "b_kharanos_9", when = { maxLevel = 10 }, text = "Ye're a wee one, so stay clear of the Frostmane caves till ye've grown a bit." },
    { id = "b_kharanos_10", when = { ghost = true }, text = "A spirit in Kharanos? That's bad luck; go an' find yer body before it freezes." },
    { id = "b_kharanos_11", when = { pet = { type = "Beast" } }, text = "That {pet} looks like it'd fight a yeti! Keep it fed an' it'll keep ye safe." },
    { id = "b_kharanos_12", when = { timesTalked = { min = 5 } }, text = "Back again, {name}? Ye'll be a regular at the Thunderbrew soon enough." },
  },
}

P:Pool {
  id = "passt_kharanos_guard", role = "guard", community = "kharanos",
  barks = {
    { id = "b_kharanos_g1", text = "The troggs keep spillin' out of Gnomeregan, {class}, so watch yer step on the roads." },
    { id = "b_kharanos_g2", text = "Report any Frostmane sightings to the Mountaineers at the Thunderbrew." },
    { id = "b_kharanos_g3", text = "Dun Morogh's quiet, but only because we keep it that way." },
    { id = "b_kharanos_g4", when = { timeOfDay = "night" }, text = "Cold night for a watch, but I've had worse in the Ironforge tunnels." },
    { id = "b_kharanos_g5", when = { class = "WARRIOR" }, text = "A {class}? Good, the troggs could use a lesson in dwarven steel." },
    { id = "b_kharanos_g6", when = { maxLevel = 10 }, text = "Ye're green, {g:lad|lass}, so stick to the road an' mind the wolves." },
    { id = "b_kharanos_g7", when = { ghost = true }, text = "Spirit, ye'll freeze yer soul out here; get back to yer body." },
    { id = "b_kharanos_g8", when = { faction = "Horde" }, text = "Horde in Dun Morogh? Ye've a nerve, I'll give ye that." },
    { id = "b_kharanos_g9", when = { word = "helped" }, text = "The Mountaineers know what ye did, {name}, an' they're grateful." },
    { id = "b_kharanos_g10", when = { disposition = { min = 65 } }, text = "Good to see ye safe, {name}; Kharanos is better for it." },
  },
}

P:Pool {
  id = "passt_auberdine_citizen", role = "citizen", community = "auberdine",
  barks = {
    { id = "b_h_lunar4", when = { holiday = "lunar" }, text = "The Lunar Festival calls many of us to Moonglade. Elune's blessing on your new year, traveler." },
    { id = "b_auberdine_1", text = "The furbolgs of the Blackwood have gone mad, and the druids cannot say what corrupts them." },
    { id = "b_auberdine_2", text = "The ships from Rut'theran and Menethil come and go, though the sea here is never truly calm." },
    { id = "b_auberdine_3", text = "The Twilight cultists gather in the ruins near the shore; the Sentinels watch them closely." },
    { id = "b_auberdine_4", text = "The ruins of Ameth'Aran hold the restless spirits of old Highborne, and the Sentinels keep their distance." },
    { id = "b_auberdine_5", when = { timeOfDay = "night" }, text = "Elune's light shines brightly over the Darkshore tonight, {class}; walk in it and you'll be safe." },
    { id = "b_auberdine_6", when = { timeOfDay = "dawn" }, text = "Ishnu-alah, {class}. The dawn here is pale, but it is beautiful in its own way." },
    { id = "b_auberdine_7", when = { race = "Human" }, text = "Another human on the shore. Your people do seem to travel far, though I wonder at your haste." },
    { id = "b_auberdine_8", when = { class = "DRUID" }, text = "A {class}, welcome. The groves of Darkshore need your care now more than ever." },
    { id = "b_auberdine_9", when = { maxLevel = 15 }, text = "The Blackwood furbolgs are dangerous, young one; tread carefully if you go north." },
    { id = "b_auberdine_10", when = { ghost = true }, text = "A spirit on the shore. The wisps will guide you back, if you follow the moonlight." },
    { id = "b_auberdine_11", when = { form = "cat" }, text = "A druid in cat form, padding through Auberdine. Elune-adore, it's a rare sight even here." },
    { id = "b_auberdine_12", when = { word = "helped" }, text = "You helped Auberdine, {name}, and Elune smiles on such deeds." },
  },
}

P:Pool {
  id = "passt_auberdine_guard", role = "guard", community = "auberdine",
  barks = {
    { id = "b_auberdine_g1", text = "Keep your blade sheathed in Auberdine, {class}; the Sentinels watch every visitor." },
    { id = "b_auberdine_g2", text = "The furbolgs of the Blackwood have turned, and we know not why, so walk carefully." },
    { id = "b_auberdine_g3", text = "Report any cultist activity near the shore to the Sentinels at once." },
    { id = "b_auberdine_g4", when = { timeOfDay = "night" }, text = "Elune watches over us tonight, but the Sentinels watch too." },
    { id = "b_auberdine_g5", when = { class = "HUNTER" }, text = "A {class}, welcome. The beasts of Darkshore need tracking, now that the corruption spreads." },
    { id = "b_auberdine_g6", when = { maxLevel = 15 }, text = "Stay close to the town, young one; the Blackwood is no place for the untested." },
    { id = "b_auberdine_g7", when = { ghost = true }, text = "Spirit, the wisps will guide you; follow the moonlight back to your body." },
    { id = "b_auberdine_g8", when = { faction = "Horde" }, text = "Horde in Darkshore? You'll find no welcome here, so keep moving." },
    { id = "b_auberdine_g9", when = { word = "helped" }, text = "The Sentinels remember your aid, {name}." },
    { id = "b_auberdine_g10", when = { disposition = { min = 65 } }, text = "Ishnu-alah, {name}; you are always welcome in Auberdine." },
  },
}

P:Pool {
  id = "passt_astranaar_citizen", role = "citizen", community = "astranaar",
  barks = {
    { id = "b_astranaar_1", text = "The Warsong orcs cut down Ashenvale's trees like they were weeds, and the Sentinels can barely hold them back." },
    { id = "b_astranaar_2", text = "The satyrs in Ashenvale are a curse from the War of the Ancients, and they've never truly left." },
    { id = "b_astranaar_3", text = "The lake around Astranaar is beautiful, but the Foulweald furbolgs have been bold on its shores." },
    { id = "b_astranaar_4", text = "Splintertree Post is full of orcs, and their axes never stop ringing." },
    { id = "b_astranaar_5", when = { timeOfDay = "night" }, text = "The forest is quiet tonight, {class}, but the Sentinels say that is when the satyrs move." },
    { id = "b_astranaar_6", when = { timeOfDay = "dawn" }, text = "Elune-adore, {class}. The dawn through Ashenvale's trees is a sight worth ten thousand years." },
    { id = "b_astranaar_7", when = { race = "Human" }, text = "A human in Ashenvale. Tread lightly; the forest does not forget an axe." },
    { id = "b_astranaar_8", when = { class = "DRUID" }, text = "Welcome, {class}. The Cenarion Circle needs you; the Warsong grow bolder every season." },
    { id = "b_astranaar_9", when = { maxLevel = 25 }, text = "You are young for Ashenvale, so stay close to Astranaar and its Sentinels." },
    { id = "b_astranaar_10", when = { ghost = true }, text = "A spirit in the forest. Follow the wisps, and Elune will bring you home." },
    { id = "b_astranaar_11", when = { form = "bear" }, text = "A druid in bear form, ambling through Astranaar. The children will be delighted." },
    { id = "b_astranaar_12", when = { word = "helped" }, text = "You helped Astranaar, {name}; the forest itself seems to breathe easier." },
  },
}

P:Pool {
  id = "passt_astranaar_guard", role = "guard", community = "astranaar",
  barks = {
    { id = "b_astranaar_g1", text = "The Warsong orcs are always testing our lines, {class}; keep your bow strung." },
    { id = "b_astranaar_g2", text = "Report any satyr sightings near the lake to the Sentinels at once." },
    { id = "b_astranaar_g3", text = "Astranaar stands, but the forest bleeds where the orcs have been." },
    { id = "b_astranaar_g4", when = { timeOfDay = "night" }, text = "The Sentinels watch through the night, as we have for ten thousand years." },
    { id = "b_astranaar_g5", when = { class = "HUNTER" }, text = "A {class}, welcome. The Warsong scouts could use some tracking." },
    { id = "b_astranaar_g6", when = { maxLevel = 22 }, text = "Stay near the town, young one; Ashenvale is no place for the untested." },
    { id = "b_astranaar_g7", when = { ghost = true }, text = "Spirit, the wisps will guide you; follow the moonlight back." },
    { id = "b_astranaar_g8", when = { faction = "Horde" }, text = "Horde in Astranaar? Leave now, before the Sentinels lose their patience." },
    { id = "b_astranaar_g9", when = { word = "helped" }, text = "The Sentinels remember your aid, {name}." },
    { id = "b_astranaar_g10", when = { disposition = { min = 65 } }, text = "Ishnu-alah, {name}; Astranaar is safer for you." },
  },
}

P:Pool {
  id = "passt_booty_bay_citizen", role = "citizen", community = "booty_bay",
  barks = {
    { id = "b_h_love_17", when = { holiday = "love_is_in_the_air" }, text = "Love is in the Air, they say, and every pirate in port is spending his wages on it." },
    { id = "b_h_winte18", when = { holiday = "winter_veil" }, text = "Winter Veil in the jungle, {class}! Smokywood Pastures still somehow manages to sell us snow." },
    { id = "b_booty_bay_1", text = "Welcome to Booty Bay, pal! Everything's for sale here, so long as you can pay the markup." },
    { id = "b_booty_bay_2", text = "The Bloodsail Buccaneers have been hitting the shipping lanes hard, and insurance is through the roof." },
    { id = "b_booty_bay_3", text = "Mind the sharks off the dock, buddy; we lost three deckhands and a crate of rum last week." },
    { id = "b_booty_bay_4", text = "Baron Revilgaz runs a tight port, so keep your nose clean and your coin flowing." },
    { id = "b_booty_bay_5", when = { timeOfDay = "night" }, text = "Night in Booty Bay's the best time for business, pal; the rum flows and nobody asks questions." },
    { id = "b_booty_bay_6", when = { timeOfDay = "dawn" }, text = "Up early, chum? The fishing boats are back and the fish are fresh, so time is money!" },
    { id = "b_booty_bay_8", when = { class = "ROGUE" }, text = "A {class}, eh? Just keep your fingers out of my pockets and we'll get along fine." },
    { id = "b_booty_bay_9", when = { maxLevel = 35 }, text = "Stranglethorn's dangerous for a youngster, kid, so watch out for the trolls and the panthers." },
    { id = "b_booty_bay_10", when = { ghost = true }, text = "A ghost on the docks? Bad for business, pal; go find your body before the customers notice." },
    { id = "b_booty_bay_11", when = { mounted = true }, text = "Lead that mount carefully, buddy; one wrong step on these planks and you're shark bait." },
    { id = "b_booty_bay_12", when = { pet = { type = "Beast" } }, text = "Nice {pet} you got there, pal! Keep it away from the fish stalls or you'll pay for the damages." },
    { id = "b_booty_bay_13", when = { word = "helped" }, text = "You helped Booty Bay, {name}; I'd call that a sound investment." },
  },
}

P:Pool {
  id = "passt_booty_bay_guard", role = "guard", community = "booty_bay",
  barks = {
    { id = "b_booty_bay_g1", text = "Bruisers keep the peace in Booty Bay, {class}, so behave or you'll swim with the sharks." },
    { id = "b_booty_bay_g2", text = "Steamwheedle rules here, pal: no fighting, no stealing, and no excuses." },
    { id = "b_booty_bay_g3", text = "Bloodsail raiders are a nuisance, but they don't get past us." },
    { id = "b_booty_bay_g4", when = { timeOfDay = "night" }, text = "Night shift's the busiest, buddy; the drunks don't sleep." },
    { id = "b_booty_bay_g5", when = { class = "ROGUE" }, text = "I've got my eye on you, {class}; Booty Bay doesn't need any more thieves." },
    { id = "b_booty_bay_g6", when = { maxLevel = 35 }, text = "Watch yourself in Stranglethorn, kid; the trolls don't care how much you're worth." },
    { id = "b_booty_bay_g7", when = { ghost = true }, text = "A ghost? Off the dock, pal; ghosts are bad for business." },
    { id = "b_booty_bay_g9", when = { word = "helped" }, text = "You've been good for business, {name}; the Baron appreciates that." },
    { id = "b_booty_bay_g10", when = { disposition = { min = 65 } }, text = "Good to see you, {name}; you're one of the few I don't have to watch." },
  },
}

P:Pool {
  id = "passt_gadgetzan_citizen", role = "citizen", community = "gadgetzan",
  barks = {
    { id = "b_h_midsu19", when = { holiday = "midsummer" }, text = "A Midsummer fire in Tanaris? As if the sun weren't hot enough already, {class}." },
    { id = "b_gadgetzan_1", text = "Welcome to Gadgetzan, pal! Water's expensive, but everything else is just very expensive." },
    { id = "b_gadgetzan_2", text = "Mind the Wastewander bandits in the dunes; they've been hitting the water caravans hard." },
    { id = "b_gadgetzan_3", text = "The sandstorms out of the Tanaris desert can strip a goblin's paint in minutes, so stay covered." },
    { id = "b_gadgetzan_4", text = "Zul'Farrak's trolls are restless again, and nobody's selling insurance for that trip." },
    { id = "b_gadgetzan_5", when = { timeOfDay = "night" }, text = "Night in the desert's cold, friend, so you'd better have a blanket or a lot of coin." },
    { id = "b_gadgetzan_6", when = { timeOfDay = "dawn" }, text = "Up early, pal? The sun's not too hot yet, so get your business done before it fries you." },
    { id = "b_gadgetzan_8", when = { class = "MAGE" }, text = "A {class}? Good, we could use someone to conjure up some water, though that'd hurt my margins." },
    { id = "b_gadgetzan_9", when = { maxLevel = 40 }, text = "Tanaris is rough for youngsters, kid, so stay clear of the dunes and the bandits." },
    { id = "b_gadgetzan_10", when = { ghost = true }, text = "A ghost in the sands? Bad luck, pal; the Spirit Healer's waiting out by the graveyard." },
    { id = "b_gadgetzan_11", when = { mounted = true }, text = "Slow that mount in town, buddy; the dust you're kicking up is ruining the merchandise." },
    { id = "b_gadgetzan_12", when = { pet = { type = "Beast" } }, text = "That {pet} looks thirsty, pal, and water's three silver a bucket around here." },
    { id = "b_gadgetzan_13", when = { word = "helped" }, text = "You helped Gadgetzan, {name}, and that's an investment I'd call worthwhile." },
  },
}

P:Pool {
  id = "passt_gadgetzan_guard", role = "guard", community = "gadgetzan",
  barks = {
    { id = "b_gadgetzan_g1", text = "Bruisers keep the peace in Gadgetzan, {class}, so behave or you'll be tossed into the sand." },
    { id = "b_gadgetzan_g2", text = "No fighting in town, pal; that's the Steamwheedle rule, and we enforce it." },
    { id = "b_gadgetzan_g3", text = "Wastewander bandits keep hitting the caravans, but they don't dare come into town." },
    { id = "b_gadgetzan_g4", when = { timeOfDay = "night" }, text = "Night shift's quiet in the desert, though the coyotes never shut up." },
    { id = "b_gadgetzan_g5", when = { class = "ROGUE" }, text = "I've got my eye on you, {class}, so keep your hands where I can see them." },
    { id = "b_gadgetzan_g6", when = { maxLevel = 40 }, text = "Tanaris isn't for the young, kid; stay near town and away from the dunes." },
    { id = "b_gadgetzan_g7", when = { ghost = true }, text = "A ghost? Go find your body, pal, before the sand swallows it." },
    { id = "b_gadgetzan_g9", when = { word = "helped" }, text = "You've been good for business, {name}, and Gadgetzan appreciates it." },
    { id = "b_gadgetzan_g10", when = { disposition = { min = 65 } }, text = "Good to see you, {name}; you're one of the few I trust in this town." },
  },
}

P:Pool {
  id = "passt_everlook_citizen", role = "citizen", community = "everlook",
  barks = {
    { id = "b_h_winte20", when = { holiday = "winter_veil" }, text = "Winter Veil in Everlook is a proper snowy one, {class}! The goblins charge double for the cocoa, though." },
    { id = "b_everlook_1", text = "Welcome to Everlook, pal! The furs are warm, the ale's cold, and everything's priced to sell." },
    { id = "b_everlook_2", text = "The Winterfall furbolgs have gone mad, and they've been raiding the trade routes all season." },
    { id = "b_everlook_3", text = "The snow in Winterspring never stops, chum, so keep your cloak close and your wallet closer." },
    { id = "b_everlook_4", text = "The Frostsaber cats are beautiful, but they'd tear a goblin apart for a scrap of meat." },
    { id = "b_everlook_5", when = { timeOfDay = "night" }, text = "Cold night, friend; if you've got coin, the inn's got a fire that'll thaw your bones." },
    { id = "b_everlook_6", when = { timeOfDay = "dawn" }, text = "Up early, pal? The snow's fresh and the trade's brisk, so let's not waste the daylight." },
    { id = "b_everlook_8", when = { class = "DRUID" }, text = "A {class}? You'll love the Moonglade road, but mind the furbolgs on the way." },
    { id = "b_everlook_9", when = { maxLevel = 55 }, text = "Winterspring's no place for the young, kid; the cold and the furbolgs will finish you." },
    { id = "b_everlook_10", when = { ghost = true }, text = "A ghost in the snow? Bad luck, pal; hurry back to your body before it freezes solid." },
    { id = "b_everlook_11", when = { mounted = true }, text = "Watch that mount on the ice, buddy; one slip and you'll be paying for the damages." },
    { id = "b_everlook_12", when = { word = "helped" }, text = "You helped Everlook, {name}, and that's a good investment in my book." },
  },
}

P:Pool {
  id = "passt_everlook_guard", role = "guard", community = "everlook",
  barks = {
    { id = "b_everlook_g1", text = "Bruisers keep the peace in Everlook, {class}, so behave or you'll be thrown in the snow." },
    { id = "b_everlook_g2", text = "No fighting in town, pal; the Steamwheedle rule applies even up here." },
    { id = "b_everlook_g3", text = "The Winterfall furbolgs keep raiding the caravans, but they won't come into town." },
    { id = "b_everlook_g4", when = { timeOfDay = "night" }, text = "Cold night shift, but the inn's ale keeps me warm." },
    { id = "b_everlook_g5", when = { class = "ROGUE" }, text = "Keep your hands where I can see them, {class}; Everlook doesn't need more thieves." },
    { id = "b_everlook_g6", when = { maxLevel = 55 }, text = "Winterspring's for the hardened, kid; stay near town and keep warm." },
    { id = "b_everlook_g7", when = { ghost = true }, text = "A ghost? Go find your body, pal, before the snow buries it." },
    { id = "b_everlook_g9", when = { word = "helped" }, text = "You've been good for business, {name}; Everlook's grateful." },
    { id = "b_everlook_g10", when = { disposition = { min = 65 } }, text = "Good to see you, {name}; you're one of the few I trust up here." },
  },
}

P:Pool {
  id = "passt_ratchet_citizen", role = "citizen", community = "ratchet",
  barks = {
    { id = "b_ratchet_1", text = "Welcome to Ratchet, pal! The boat to Booty Bay leaves on the hour, so time is money!" },
    { id = "b_ratchet_2", text = "The pirates from the Southsea Freebooters are always sniffing around the docks." },
    { id = "b_ratchet_3", text = "The Venture Company's been drilling in the Barrens, and Steamwheedle doesn't like it one bit." },
    { id = "b_ratchet_4", when = { timeOfDay = "night" }, text = "Night's busy at the docks, chum; the ships come in and the rum goes out." },
    { id = "b_ratchet_5", when = { timeOfDay = "dawn" }, text = "Up early, pal? The fish are fresh, the sailors are hung over, and business is good." },
    { id = "b_ratchet_7", when = { class = "ROGUE" }, text = "A {class}? Keep your fingers off the cargo, pal, and we'll be friends." },
    { id = "b_ratchet_8", when = { maxLevel = 20 }, text = "The Barrens are tough for youngsters, kid, so watch out for the raptors and the quilboar." },
    { id = "b_ratchet_9", when = { ghost = true }, text = "A ghost on the docks? Bad for business, pal; go find your body." },
    { id = "b_ratchet_10", when = { pet = { type = "Beast" } }, text = "Nice {pet}, pal! Keep it away from the fish crates or you'll pay for every bite." },
    { id = "b_ratchet_11", when = { word = "helped" }, text = "You helped Ratchet, {name}; that's a solid investment, and I don't say that often." },
  },
}

P:Pool {
  id = "passt_crossroads_citizen", role = "citizen", community = "crossroads",
  barks = {
    { id = "b_h_midsu11", when = { holiday = "midsummer" }, text = "The Midsummer fire burns at the Crossroads tonight, {class}, and the caravans stop to honor it." },
    { id = "b_h_child12", when = { holiday = "childrens_week" }, text = "An orphan came through on the Orgrimmar road with an adventurer. Good. Every child needs to see the world." },
    { id = "b_crossroads_1", text = "The Kolkar centaur raid the caravans at will, and Thork says the Horde must strike back soon." },
    { id = "b_crossroads_2", text = "Mind the Razormane quilboar to the south; they're bold since their thornweavers took the Barrens." },
    { id = "b_crossroads_3", text = "Water is scarce in the Barrens, so drink when you can and share when you must." },
    { id = "b_crossroads_4", text = "The Southsea pirates near Ratchet have been raiding the coast, and the Crossroads feels it." },
    { id = "b_crossroads_5", when = { timeOfDay = "night" }, text = "The stars over the Barrens are bright tonight, {class}, and the hyenas are loud." },
    { id = "b_crossroads_6", when = { timeOfDay = "dawn" }, text = "Dawn, {class}. The heat will come soon, so drink your water before the sun climbs." },
    { id = "b_crossroads_7", when = { race = "Tauren" }, text = "Ah, a tauren. Your people know the Barrens better than any of us, and it's good to have you here." },
    { id = "b_crossroads_8", when = { class = "WARRIOR" }, text = "A {class}! The centaur need a lesson in Horde steel, and you look like you could teach it." },
    { id = "b_crossroads_9", when = { maxLevel = 20 }, text = "The Barrens are harsh, young one, so stay near the Crossroads until you're stronger." },
    { id = "b_crossroads_10", when = { ghost = true }, text = "A spirit in the dust? Lok'tar, warrior; go and claim your body." },
    { id = "b_crossroads_11", when = { mounted = true }, text = "Slow that mount in the Crossroads; the wind riders are skittish today." },
    { id = "b_crossroads_12", when = { word = "helped" }, text = "You've helped the Crossroads, {name}, and the Horde honors you for it." },
  },
}

P:Pool {
  id = "passt_crossroads_guard", role = "guard", community = "crossroads",
  barks = {
    { id = "b_crossroads_g1", text = "Watch the road for Kolkar raiders, {class}; they've hit two caravans this week." },
    { id = "b_crossroads_g2", text = "Report any centaur sightings to Thork in the tower." },
    { id = "b_crossroads_g3", text = "The Crossroads holds, and it will hold as long as the Horde stands." },
    { id = "b_crossroads_g4", when = { timeOfDay = "night" }, text = "The night watch is quiet, but the centaur love the dark." },
    { id = "b_crossroads_g5", when = { class = "WARRIOR" }, text = "A {class}! Good, the Horde needs strong arms against the centaur." },
    { id = "b_crossroads_g6", when = { maxLevel = 20 }, text = "You're young, grunt, so stay close until you've proven your worth." },
    { id = "b_crossroads_g7", when = { ghost = true }, text = "Spirit, the healer can help you; find your body and return to the fight." },
    { id = "b_crossroads_g8", when = { faction = "Alliance" }, text = "Alliance at the Crossroads? You've got guts, I'll give you that." },
    { id = "b_crossroads_g9", when = { word = "helped" }, text = "The Horde knows your deeds, {name}, and we honor them." },
    { id = "b_crossroads_g10", when = { disposition = { min = 65 } }, text = "Lok'tar, {name}; it is good to see you again." },
  },
}

P:Pool {
  id = "passt_razor_hill_citizen", role = "citizen", community = "razor_hill",
  barks = {
    { id = "b_h_noble9", when = { holiday = "noblegarden" }, text = "Noblegarden eggs are hidden all over Razor Hill, {class}. Even the grunts are looking." },
    { id = "b_h_harve10", when = { holiday = "harvest" }, text = "Grom's monument isn't far, {class}. Leave him something for the Harvest Festival." },
    { id = "b_razor_hill_1", text = "The Burning Blade cultists hide in the Dragonmaw Gates, and Gar'Thok wants them rooted out." },
    { id = "b_razor_hill_2", text = "The Kul Tiras marines at Tiragarde Keep keep landing on our shore, and we keep sending them back." },
    { id = "b_razor_hill_3", text = "Mind the scorpids in the canyons of Durotar; they hide in the sand and strike without warning." },
    { id = "b_razor_hill_4", text = "The Darkspear at Sen'jin Village are good allies, but Zalazane's witchcraft troubles them." },
    { id = "b_razor_hill_5", when = { timeOfDay = "night" }, text = "The night's cold in Durotar, {class}, but a fire and a good blade keep you warm." },
    { id = "b_razor_hill_6", when = { timeOfDay = "dawn" }, text = "Dawn over Durotar is red as blood, warrior, and it suits us." },
    { id = "b_razor_hill_7", when = { race = "Troll" }, text = "Ah, a Darkspear. Your people fought well for the Horde, and Razor Hill remembers it." },
    { id = "b_razor_hill_8", when = { class = "SHAMAN" }, text = "A {class}! The elements are strong in Durotar, and Thrall would be pleased to see you." },
    { id = "b_razor_hill_9", when = { maxLevel = 12 }, text = "You're young, grunt, so stay near Razor Hill and learn before you fight." },
    { id = "b_razor_hill_10", when = { ghost = true }, text = "A spirit? Go to the healer, warrior; the Horde needs you back." },
    { id = "b_razor_hill_11", when = { pet = { type = "Beast" } }, text = "That {pet} is strong, {class}; a good companion for the hunt." },
    { id = "b_razor_hill_12", when = { word = "helped" }, text = "You have helped Razor Hill, {name}, and the Horde honors that." },
  },
}

P:Pool {
  id = "passt_razor_hill_guard", role = "guard", community = "razor_hill",
  barks = {
    { id = "b_razor_hill_g1", text = "Watch for the Kul Tiras marines, {class}; they keep landing on our beaches." },
    { id = "b_razor_hill_g2", text = "Report any Burning Blade activity to Gar'Thok." },
    { id = "b_razor_hill_g3", text = "Razor Hill stands for the Horde, as it always has." },
    { id = "b_razor_hill_g4", when = { timeOfDay = "night" }, text = "The night watch is quiet, but the Burning Blade love the dark." },
    { id = "b_razor_hill_g5", when = { class = "WARRIOR" }, text = "A {class}! Good, we need strong arms against the humans." },
    { id = "b_razor_hill_g6", when = { maxLevel = 12 }, text = "You're green, grunt, so stay close and learn the land." },
    { id = "b_razor_hill_g7", when = { ghost = true }, text = "Spirit, the healer awaits; find your body and return." },
    { id = "b_razor_hill_g8", when = { faction = "Alliance" }, text = "Alliance in Durotar? You're bold, but foolish." },
    { id = "b_razor_hill_g9", when = { word = "helped" }, text = "The Horde knows your deeds, {name}, and honors them." },
    { id = "b_razor_hill_g10", when = { disposition = { min = 65 } }, text = "Lok'tar, {name}; it is good to see you." },
  },
}

P:Pool {
  id = "passt_brill_citizen", role = "citizen", community = "brill",
  barks = {
    { id = "b_h_hallo13", when = { holiday = "hallows_end" }, text = "Hallow's End is our night, {class}. Brill remembers what the Lich King took, and what we took back." },
    { id = "b_h_winte14", when = { holiday = "winter_veil" }, text = "Winter Veil in Brill, {class}. The living hang ornaments; the rest of us watch and remember doing it." },
    { id = "b_brill_1", text = "The Scarlet Crusade grows bolder every week, and Brill is too close to their monastery for my taste." },
    { id = "b_brill_2", text = "The Gallows' End Tavern serves drinks to the living and the dead alike, though the dead enjoy it more." },
    { id = "b_brill_3", text = "The Royal Apothecary Society has been testing new plagues near the Agamand Mills." },
    { id = "b_brill_4", text = "Tirisfal's fog never lifts, which suits us; the living find it unsettling, and we find it comforting." },
    { id = "b_brill_5", when = { timeOfDay = "night" }, text = "The night is long in Tirisfal, {class}, and the dead don't mind; we have plenty of time." },
    { id = "b_brill_6", when = { timeOfDay = "dusk" }, text = "Dusk again in Brill. The Scarlets' torches will be burning on the hills soon." },
    { id = "b_brill_7", when = { race = "Scourge" }, text = "Ah, another of the Forsaken. Welcome home, though Brill is hardly a home." },
    { id = "b_brill_8", when = { class = "PRIEST" }, text = "A {class}? Shadow, I hope, and not that Light the Scarlets love so much." },
    { id = "b_brill_9", when = { maxLevel = 12 }, text = "You're freshly risen, I see; stay near Brill until you've learned to hold a blade." },
    { id = "b_brill_10", when = { ghost = true }, text = "A ghost? How ironic, given most of us are dead already." },
    { id = "b_brill_11", when = { pet = { type = "Beast" } }, text = "That {pet} is rotting nicely; it suits you." },
    { id = "b_brill_12", when = { word = "helped" }, text = "You've done the Dark Lady a service, {name}, and Brill notes it." },
  },
}

P:Pool {
  id = "passt_brill_guard", role = "guard", community = "brill",
  barks = {
    { id = "b_brill_g1", text = "Deathguard keep watch over Brill, {class}, so behave yourself." },
    { id = "b_brill_g2", text = "Report any Scarlet Crusade sightings to Executor Zygand." },
    { id = "b_brill_g3", text = "The Dark Lady's will is our law, and we enforce it." },
    { id = "b_brill_g4", when = { timeOfDay = "night" }, text = "The night watch is easy when you don't need sleep." },
    { id = "b_brill_g5", when = { class = "PALADIN" }, text = "A {class}? Get out of Tirisfal before the Deathguard mistakes you for a Scarlet." },
    { id = "b_brill_g6", when = { maxLevel = 12 }, text = "You're green, so stay near Brill and away from the Scarlets." },
    { id = "b_brill_g7", when = { ghost = true }, text = "A ghost? The healer is near the graveyard; go find your body." },
    { id = "b_brill_g8", when = { faction = "Alliance" }, text = "The living in Tirisfal? You've chosen a poor place to wander." },
    { id = "b_brill_g9", when = { word = "helped" }, text = "The Dark Lady notes your service, {name}." },
    { id = "b_brill_g10", when = { disposition = { min = 65 } }, text = "Good to see you again, {name}; you're one of the few who doesn't smell of the Light." },
  },
}

P:Pool {
  id = "passt_tarren_mill_citizen", role = "citizen", community = "tarren_mill",
  barks = {
    { id = "b_h_hallo21", when = { holiday = "hallows_end" }, text = "Hallow's End, {class}. Tarren Mill was a human town once; tonight it remembers being free of both." },
    { id = "b_tarren_mill_1", text = "The humans of Southshore are just to the south, and they hate us as much as we hate them." },
    { id = "b_tarren_mill_2", text = "The Syndicate prowls the Alterac foothills, and they're no friends of the Forsaken." },
    { id = "b_tarren_mill_3", text = "The Royal Apothecary Society has us gathering samples for their newest plague." },
    { id = "b_tarren_mill_4", text = "Hillsbrad was my home once, when I was alive; now it's just another battlefield." },
    { id = "b_tarren_mill_5", when = { timeOfDay = "night" }, text = "The night is ours, {class}; the humans of Southshore don't sleep easily." },
    { id = "b_tarren_mill_6", when = { timeOfDay = "dawn" }, text = "Dawn over Hillsbrad is a pretty thing, though it means nothing to the dead." },
    { id = "b_tarren_mill_7", when = { race = "Scourge" }, text = "Another Forsaken in Tarren Mill. Good, we need every one of us against Southshore." },
    { id = "b_tarren_mill_8", when = { class = "WARLOCK" }, text = "A {class}? Good, the humans fear your fel magic, and fear is useful." },
    { id = "b_tarren_mill_9", when = { maxLevel = 25 }, text = "You're young for Hillsbrad; stay close and avoid Southshore's guards." },
    { id = "b_tarren_mill_10", when = { ghost = true }, text = "A ghost? You're not the first to fall in Hillsbrad, and you won't be the last." },
    { id = "b_tarren_mill_11", when = { pet = { type = "Beast" } }, text = "That {pet} looks hungry; there's plenty to eat near Southshore." },
    { id = "b_tarren_mill_12", when = { word = "helped" }, text = "You've served the Dark Lady well, {name}, and Tarren Mill remembers it." },
  },
}

P:Pool {
  id = "passt_tarren_mill_guard", role = "guard", community = "tarren_mill",
  barks = {
    { id = "b_tarren_mill_g1", text = "Deathguard keep watch over Tarren Mill, {class}; the humans of Southshore are always close." },
    { id = "b_tarren_mill_g2", text = "Report any Southshore raids to the Deathguard at once." },
    { id = "b_tarren_mill_g3", text = "Tarren Mill stands for the Dark Lady, and it will not fall." },
    { id = "b_tarren_mill_g4", when = { timeOfDay = "night" }, text = "The night watch is easy for the dead; we don't sleep, and we don't forget." },
    { id = "b_tarren_mill_g5", when = { class = "PALADIN" }, text = "A {class}? Leave Tarren Mill before you find out why the living fear us." },
    { id = "b_tarren_mill_g6", when = { maxLevel = 25 }, text = "You're young; stay close and away from Southshore's walls." },
    { id = "b_tarren_mill_g7", when = { ghost = true }, text = "A ghost? Go to the healer and return to the fight." },
    { id = "b_tarren_mill_g8", when = { faction = "Alliance" }, text = "The living in Tarren Mill? You've chosen a poor place to visit." },
    { id = "b_tarren_mill_g9", when = { word = "helped" }, text = "The Dark Lady notes your service, {name}." },
    { id = "b_tarren_mill_g10", when = { disposition = { min = 65 } }, text = "Good to see you again, {name}; you're welcome in Tarren Mill." },
  },
}

P:Pool {
  id = "passt_aerie_peak_citizen", role = "citizen", community = "aerie_peak",
  barks = {
    { id = "b_aerie_peak_1", text = "The Wildhammer gryphons fly free over the Hinterlands, an' there's no finer sight in all the world, {g:lad|lass}." },
    { id = "b_aerie_peak_2", text = "The Witherbark trolls at Shadra'Alor are up to their old tricks again, makin' offerings to their dark gods." },
    { id = "b_aerie_peak_3", text = "Falstad Wildhammer keeps the peace here, but he's no friend of Ironforge's ways, an' he says so loud." },
    { id = "b_aerie_peak_4", text = "The Vilebranch trolls at Jintha'Alor have been raidin' the gryphon nests, an' it makes my blood boil." },
    { id = "b_aerie_peak_5", text = "Ye can smell the Hinterlands pines from here, an' it beats the stink of a forge any day." },
    { id = "b_aerie_peak_6", when = { timeOfDay = "night" }, text = "Gryphons are roostin' for the night, so keep yer voice down near the aerie." },
    { id = "b_aerie_peak_7", when = { race = "Dwarf" }, text = "A Bronzebeard, eh? Ye're welcome here, though ye'll find we do things the Wildhammer way." },
    { id = "b_aerie_peak_8", when = { class = "HUNTER" }, text = "A {class}! The owlbeasts in the Hinterlands would test even a Wildhammer's aim." },
    { id = "b_aerie_peak_9", when = { ghost = true }, text = "A ghost at the aerie? The gryphons can smell ye, an' they don't like it one bit." },
    { id = "b_aerie_peak_10", when = { word = "helped" }, text = "Ye helped the Wildhammer, {name}, an' that's worth a toast by the fire." },
  },
}

P:Pool {
  id = "passt_bloodhoof_citizen", role = "citizen", community = "bloodhoof",
  barks = {
    { id = "b_h_harve15", when = { holiday = "harvest" }, text = "The Harvest is a time to thank the Earth Mother, {class}. Walk with her." },
    { id = "b_h_lunar16", when = { holiday = "lunar" }, text = "Our elders are honored this Lunar Festival, {class}. Visit their resting places if you can." },
    { id = "b_bloodhoof_1", text = "The plains of Mulgore are gentle today, and the kodo graze peacefully near the village." },
    { id = "b_bloodhoof_2", text = "The Venture Company has been cutting into our hills, and the land weeps for it." },
    { id = "b_bloodhoof_3", text = "The Bael'dun dwarves dig in our earth without asking, and Cairne's patience grows thin." },
    { id = "b_bloodhoof_4", text = "Walk with the Earth Mother, friend; Bloodhoof Village welcomes all who come in peace." },
    { id = "b_bloodhoof_5", text = "The Palemane gnolls have been raiding our herds again, but the braves will drive them off." },
    { id = "b_bloodhoof_6", when = { timeOfDay = "night" }, text = "Mu'sha watches over us tonight, {class}; rest well in her light." },
    { id = "b_bloodhoof_7", when = { timeOfDay = "dawn" }, text = "An'she rises over Mulgore, and the grass is wet with morning dew." },
    { id = "b_bloodhoof_8", when = { race = "Tauren" }, text = "Welcome home, young one; Bloodhoof is always open to the children of the Earth Mother." },
    { id = "b_bloodhoof_9", when = { class = "DRUID" }, text = "A {class}, welcome. The Earth Mother's blessing is strong in you." },
    { id = "b_bloodhoof_10", when = { maxLevel = 10 }, text = "You're young, so stay near the village until you've learned the ways of the hunt." },
    { id = "b_bloodhoof_11", when = { ghost = true }, text = "A spirit, wandering the plains. The ancestors will guide you back, little one." },
    { id = "b_bloodhoof_12", when = { word = "helped" }, text = "You've helped Bloodhoof, {name}, and the tribe remembers it." },
  },
}

P:Pool {
  id = "passt_bloodvenom_post_citizen", role = "citizen", community = "bloodvenom_post",
  barks = {
    { id = "b_bloodvenom_post_1", text = "Felwood is sick with demon taint, and the very water here could kill you." },
    { id = "b_bloodvenom_post_2", text = "The Jadefire satyrs prowl the southern woods, and they hunger for more than flesh." },
    { id = "b_bloodvenom_post_3", text = "Bloodvenom Post exists because the Horde needs a foothold here, though I'd rather be anywhere else." },
    { id = "b_bloodvenom_post_4", text = "The corrupted furbolgs of Felwood are mad with fel, and they show no mercy." },
    { id = "b_bloodvenom_post_5", text = "Don't drink from the streams, {class}; they're poisoned by the demons' work." },
    { id = "b_bloodvenom_post_6", when = { timeOfDay = "night" }, text = "Felwood at night is a nightmare, so keep to the firelight, warrior." },
    { id = "b_bloodvenom_post_7", when = { race = "Orc" }, text = "Another orc in Felwood. We know demon taint better than any, and we'll not fall to it again." },
    { id = "b_bloodvenom_post_8", when = { class = "WARLOCK" }, text = "A {class}? Careful, the fel here doesn't need your help to spread." },
    { id = "b_bloodvenom_post_9", when = { ghost = true }, text = "A spirit in Felwood? The taint will twist you if you linger, so hurry." },
    { id = "b_bloodvenom_post_10", when = { word = "helped" }, text = "You've helped Bloodvenom Post, {name}, and the Horde honors it." },
  },
}

P:Pool {
  id = "passt_brackenwall_citizen", role = "citizen", community = "brackenwall",
  barks = {
    { id = "b_brackenwall_1", text = "Brackenwall Village stands strong, though the Theramore humans are always too close for comfort." },
    { id = "b_brackenwall_2", text = "The Dustwallow Marsh is thick with mosquitoes and danger, and the black dragonflight lurks in the south." },
    { id = "b_brackenwall_3", text = "Onyxia's brood are said to nest in the marsh, and only fools wander near their lair." },
    { id = "b_brackenwall_4", text = "The Stonemaul ogres to the west are restless, and they'd sooner crush us than talk." },
    { id = "b_brackenwall_5", text = "Rexxar was seen passing through, they say, and the beastmaster rarely comes to Brackenwall without reason." },
    { id = "b_brackenwall_6", when = { timeOfDay = "night" }, text = "Night in the marsh is loud, {class}, and the crocolisks love the dark." },
    { id = "b_brackenwall_7", when = { race = "Orc" }, text = "Welcome, warrior; the Horde needs strong arms in Dustwallow." },
    { id = "b_brackenwall_8", when = { class = "HUNTER" }, text = "A {class}! The marsh beasts will test your aim, I promise you." },
    { id = "b_brackenwall_9", when = { ghost = true }, text = "A spirit in the marsh? Go to the healer before the crocs find your body." },
    { id = "b_brackenwall_10", when = { word = "helped" }, text = "You've helped Brackenwall, {name}, and the Horde remembers it." },
  },
}

P:Pool {
  id = "passt_chillwind_camp_citizen", role = "citizen", community = "chillwind_camp",
  barks = {
    { id = "b_chillwind_camp_1", text = "The Scourge holds Andorhal, and we watch it from the hills every day." },
    { id = "b_chillwind_camp_2", text = "The Argent Dawn keeps the light alive in the Plaguelands, but it's a dim light these days." },
    { id = "b_chillwind_camp_3", text = "The Scarlet Crusade hates the Scourge as much as we do, though they'd hang us too if they could." },
    { id = "b_chillwind_camp_4", text = "The plague is in the soil here, so don't eat anything you didn't bring with you." },
    { id = "b_chillwind_camp_5", text = "Caer Darrow is held by the Scholomance, and the necromancers there are worse than any ghoul." },
    { id = "b_chillwind_camp_6", when = { timeOfDay = "night" }, text = "The night's quiet, but the Scourge doesn't sleep, so neither do we." },
    { id = "b_chillwind_camp_7", when = { race = "Human" }, text = "Another human in the Plaguelands. Lordaeron's not what it was, but we'll take it back someday." },
    { id = "b_chillwind_camp_8", when = { class = "PALADIN" }, text = "A {class}, Light be praised. The Scourge fears the Light, and we need it here." },
    { id = "b_chillwind_camp_9", when = { ghost = true }, text = "A ghost in the Plaguelands? That's a bad omen, so go find your body before the Scourge does." },
    { id = "b_chillwind_camp_10", when = { word = "helped" }, text = "You've helped Chillwind Camp, {name}, and we're grateful for it." },
  },
}

P:Pool {
  id = "passt_dolanaar_citizen", role = "citizen", community = "dolanaar",
  barks = {
    { id = "b_dolanaar_1", text = "The gnarlpine furbolgs have been corrupted, and the druids search for the source in the woods." },
    { id = "b_dolanaar_2", text = "Teldrassil's woods are peaceful, but there's a darkness spreading among the furbolgs." },
    { id = "b_dolanaar_3", text = "The Ban'ethil Barrow Den is overrun with corrupted creatures, and the Sentinels are worried." },
    { id = "b_dolanaar_4", text = "Elune's light shines bright over Dolanaar, and the moonwells are full." },
    { id = "b_dolanaar_5", text = "The road to Darnassus is safe enough, though the young should be careful near the barrows." },
    { id = "b_dolanaar_6", when = { timeOfDay = "night" }, text = "Ishnu-alah, {class}; walk softly under Elune's light." },
    { id = "b_dolanaar_7", when = { race = "NightElf" }, text = "Welcome, sister of the moon; Dolanaar is your home as much as mine." },
    { id = "b_dolanaar_8", when = { class = "DRUID" }, text = "A {class}, welcome. The corrupted furbolgs need your care, though they don't know it." },
    { id = "b_dolanaar_9", when = { maxLevel = 10 }, text = "You're young; stay close to Dolanaar until you've grown stronger." },
    { id = "b_dolanaar_10", when = { ghost = true }, text = "A spirit in Teldrassil. The wisps will guide you; follow the moonlight." },
    { id = "b_dolanaar_11", when = { word = "helped" }, text = "You've helped Dolanaar, {name}; Elune smiles on such deeds." },
  },
}

P:Pool {
  id = "passt_feathermoon_citizen", role = "citizen", community = "feathermoon",
  barks = {
    { id = "b_feathermoon_1", text = "Feathermoon Stronghold watches over the Sayed Isle and the Feralas coast, and the Sentinels never rest." },
    { id = "b_feathermoon_2", text = "The Gordunni ogres in Feralas grow bold, and they've been seen near the Twin Colossals." },
    { id = "b_feathermoon_3", text = "The ruins of Isildien and Ravenwind are haunted by the old Highborne, and we keep our distance." },
    { id = "b_feathermoon_4", text = "The sea between Feathermoon and the coast is rough, so mind the boat ride." },
    { id = "b_feathermoon_5", text = "Dire Maul is full of ogres and worse things, and the Highborne curse still lingers in its halls." },
    { id = "b_feathermoon_6", when = { timeOfDay = "night" }, text = "Elune's light shines over the sea tonight, {class}; a beautiful sight from the stronghold." },
    { id = "b_feathermoon_7", when = { race = "NightElf" }, text = "Welcome, sister; Feathermoon stands for the Kaldorei, and you are welcome here." },
    { id = "b_feathermoon_8", when = { class = "HUNTER" }, text = "A {class}! Feralas is full of beasts to track, and the Sentinels would welcome your help." },
    { id = "b_feathermoon_9", when = { ghost = true }, text = "A spirit on the isle. Follow the moonlight back to the shore, and Elune will guide you." },
    { id = "b_feathermoon_10", when = { word = "helped" }, text = "You've helped Feathermoon, {name}, and the Sentinels remember it." },
  },
}

P:Pool {
  id = "passt_freewind_citizen", role = "citizen", community = "freewind",
  barks = {
    { id = "b_freewind_1", text = "The Thousand Needles are dangerous, and the Galak centaur raid the lower canyons at will." },
    { id = "b_freewind_2", text = "The Grimtotem tauren have been causing trouble in the needles, and Cairne is not pleased." },
    { id = "b_freewind_3", text = "The winds here are strong, and they carry the voices of our ancestors to those who listen." },
    { id = "b_freewind_4", text = "The wind riders from Freewind Post can take you across the canyons, if you're brave enough." },
    { id = "b_freewind_5", text = "Walk with the Earth Mother, friend; the canyons can be cruel to those who aren't careful." },
    { id = "b_freewind_6", when = { timeOfDay = "night" }, text = "Mu'sha's light shines on the needles tonight, {class}; a beautiful sight from above." },
    { id = "b_freewind_7", when = { race = "Tauren" }, text = "Welcome, young one; Freewind Post is a home for all children of the Earth Mother." },
    { id = "b_freewind_8", when = { class = "SHAMAN" }, text = "A {class}, welcome. The winds here are strong, and they'll speak to you if you listen." },
    { id = "b_freewind_9", when = { ghost = true }, text = "A spirit in the needles. The winds will guide you home, little one." },
    { id = "b_freewind_10", when = { word = "helped" }, text = "You've helped Freewind Post, {name}, and the ancestors smile on it." },
  },
}

P:Pool {
  id = "passt_gromgol_citizen", role = "citizen", community = "gromgol",
  barks = {
    { id = "b_gromgol_1", text = "Grom'gol Base Camp is all the Horde has in Stranglethorn, so we hold it tight." },
    { id = "b_gromgol_2", text = "The Kurzen rebels and the Bloodscalp trolls make the jungle a deadly place, warrior." },
    { id = "b_gromgol_3", text = "The zeppelin to Orgrimmar and Undercity lands here, so make sure you're on it if you're leaving." },
    { id = "b_gromgol_4", text = "Booty Bay's goblins don't care whose side you're on, as long as you pay." },
    { id = "b_gromgol_5", text = "The panthers and raptors of Stranglethorn are fierce, so keep your blade sharp." },
    { id = "b_gromgol_6", when = { timeOfDay = "night" }, text = "The jungle's loud at night, {class}, and the trolls love the dark." },
    { id = "b_gromgol_7", when = { race = "Troll" }, text = "Ah, a Darkspear, mon; dis jungle be your blood, and the Bloodscalp be no friends of yours." },
    { id = "b_gromgol_8", when = { class = "HUNTER" }, text = "A {class}! Hemet Nesingwary's camp would love to hear your tales of the hunt." },
    { id = "b_gromgol_9", when = { ghost = true }, text = "A ghost in the jungle? The healer's close, so hurry back before the panthers find you." },
    { id = "b_gromgol_10", when = { word = "helped" }, text = "You've helped Grom'gol, {name}, and the Horde honors it." },
  },
}

P:Pool {
  id = "passt_hammerfall_citizen", role = "citizen", community = "hammerfall",
  barks = {
    { id = "b_hammerfall_1", text = "Hammerfall stands as a proud reminder of Thrall's freedom, and the Horde will never let it fall." },
    { id = "b_hammerfall_2", text = "The Witherbark trolls and the Syndicate both prowl the Arathi Highlands, and they hate us equally." },
    { id = "b_hammerfall_3", text = "The Stromgarde humans dream of reclaiming their kingdom, but they'll have to go through us." },
    { id = "b_hammerfall_4", text = "The ogres at Boulderfist Hall are bold, and they don't respect anyone's borders." },
    { id = "b_hammerfall_5", text = "This is where Thrall broke the internment camps, warrior, and we honor his strength here." },
    { id = "b_hammerfall_6", when = { timeOfDay = "night" }, text = "The Arathi night is cold, {class}, but a fire and a good blade keep you warm." },
    { id = "b_hammerfall_7", when = { race = "Orc" }, text = "Welcome, warrior; Hammerfall stands for the freedom of our people." },
    { id = "b_hammerfall_8", when = { class = "WARRIOR" }, text = "A {class}! The ogres at Boulderfist Hall could use a lesson in Horde strength." },
    { id = "b_hammerfall_9", when = { ghost = true }, text = "A spirit in the Highlands? Go to the healer and return to the fight." },
    { id = "b_hammerfall_10", when = { word = "helped" }, text = "You've helped Hammerfall, {name}, and the Horde honors you for it." },
  },
}

P:Pool {
  id = "passt_kargath_citizen", role = "citizen", community = "kargath",
  barks = {
    { id = "b_kargath_1", text = "Kargath stands in the Badlands, and the dwarves of Uldaman are never far." },
    { id = "b_kargath_2", text = "The Dark Iron dwarves have been digging in the Badlands, and they're no friends of the Horde." },
    { id = "b_kargath_3", text = "The black dragonflight lurks in the Badlands, and their whelps are vicious." },
    { id = "b_kargath_4", text = "The heat here is brutal, warrior, so drink your water and keep your head covered." },
    { id = "b_kargath_5", text = "The Stonevault troggs come from Uldaman, and they're as stubborn as stone." },
    { id = "b_kargath_6", when = { timeOfDay = "night" }, text = "The Badlands night is cold, {class}, but the stars are bright." },
    { id = "b_kargath_7", when = { race = "Orc" }, text = "Welcome, warrior; Kargath stands for the Horde, as it always has." },
    { id = "b_kargath_8", when = { class = "WARRIOR" }, text = "A {class}! The Dark Irons could use a lesson in Horde steel." },
    { id = "b_kargath_9", when = { ghost = true }, text = "A spirit in the Badlands? The healer's near, so go find your body." },
    { id = "b_kargath_10", when = { word = "helped" }, text = "You've helped Kargath, {name}, and the Horde remembers it." },
  },
}

P:Pool {
  id = "passt_light_hope_citizen", role = "citizen", community = "light_hope",
  barks = {
    { id = "b_light_hope_1", text = "Light's Hope Chapel stands against the Scourge, and the Argent Dawn holds it firm." },
    { id = "b_light_hope_3", text = "The Scarlet Crusade and the Argent Dawn don't see eye to eye, though both hate the Scourge." },
    { id = "b_light_hope_4", text = "The plague is everywhere here, so keep your mouth covered and your faith strong." },
    { id = "b_light_hope_5", text = "Tirion Fordring was cast out for his kindness to an orc, but he's still a hero to some of us." },
    { id = "b_light_hope_6", when = { timeOfDay = "night" }, text = "The night is long in the Plaguelands, {class}, and the Scourge never sleeps." },
    { id = "b_light_hope_7", when = { class = "PALADIN" }, text = "A {class}, Light be praised; the Scourge fears your power." },
    { id = "b_light_hope_8", when = { class = "PRIEST" }, text = "A {class}! The wounded here need your healing more than ever." },
    { id = "b_light_hope_9", when = { ghost = true }, text = "A ghost at Light's Hope? The Light will guide you, but hurry back." },
    { id = "b_light_hope_10", when = { word = "helped" }, text = "You've helped the Argent Dawn, {name}, and we're grateful for it." },
  },
}

P:Pool {
  id = "passt_marshals_refuge_citizen", role = "citizen", community = "marshals_refuge",
  barks = {
    { id = "b_marshals_refuge_1", text = "The Un'Goro Crater is full of dinosaurs, and some of them are bigger than a house." },
    { id = "b_marshals_refuge_2", text = "The silithid insects in the crater are spreading, and they're dangerous in swarms." },
    { id = "b_marshals_refuge_3", text = "The Marshal's Refuge is a small camp, but it's safe enough if you watch for the devilsaurs." },
    { id = "b_marshals_refuge_4", text = "The gorillas in the crater are territorial, so don't wander too far into their land." },
    { id = "b_marshals_refuge_5", text = "The crystals in the crater are said to have strange powers, but I'm no scholar." },
    { id = "b_marshals_refuge_6", when = { timeOfDay = "night" }, text = "The crater's noisy at night, {class}, and the dinosaurs never stop roaring." },
    { id = "b_marshals_refuge_7", when = { class = "HUNTER" }, text = "A {class}! The devilsaurs would make for a good hunt, if you're brave enough." },
    { id = "b_marshals_refuge_8", when = { maxLevel = 48 }, text = "You're young for Un'Goro, so stay near the refuge until you've grown stronger." },
    { id = "b_marshals_refuge_9", when = { ghost = true }, text = "A ghost in the crater? The healer's close, so go find your body." },
    { id = "b_marshals_refuge_10", when = { word = "helped" }, text = "You've helped the refuge, {name}, and we're grateful for it." },
  },
}

P:Pool {
  id = "passt_mojache_citizen", role = "citizen", community = "mojache",
  barks = {
    { id = "b_mojache_1", text = "Camp Mojache watches over the Feralas jungle, and the Gordunni ogres are never far." },
    { id = "b_mojache_2", text = "Dire Maul is full of ogres and worse things, and the Highborne curse still lingers there." },
    { id = "b_mojache_3", text = "The rain in Feralas never stops, but it feeds the land and the beasts." },
    { id = "b_mojache_4", text = "The Grimtotem have been causing trouble in the south, and Cairne is not pleased." },
    { id = "b_mojache_5", text = "Walk with the Earth Mother, friend; the jungle can be cruel to those who aren't careful." },
    { id = "b_mojache_6", when = { timeOfDay = "night" }, text = "Mu'sha's light shines through the rain tonight, {class}." },
    { id = "b_mojache_7", when = { race = "Tauren" }, text = "Welcome, young one; Camp Mojache is a home for all children of the Earth Mother." },
    { id = "b_mojache_8", when = { class = "DRUID" }, text = "A {class}, welcome. The jungle needs your care." },
    { id = "b_mojache_9", when = { ghost = true }, text = "A spirit in the jungle. The ancestors will guide you back, little one." },
    { id = "b_mojache_10", when = { word = "helped" }, text = "You've helped Camp Mojache, {name}, and the tribe remembers it." },
  },
}

P:Pool {
  id = "passt_morgans_vigil_citizen", role = "citizen", community = "morgans_vigil",
  barks = {
    { id = "b_morgans_vigil_1", text = "Morgan's Vigil watches over the Burning Steppes, and the Blackrock orcs are always close." },
    { id = "b_morgans_vigil_2", text = "Blackrock Mountain looms to the west, and the Dark Iron dwarves and black dragons rule it." },
    { id = "b_morgans_vigil_3", text = "The Blackrock orcs raid the Redridge Mountains, and Morgan's Vigil tries to stop them." },
    { id = "b_morgans_vigil_4", text = "The heat of the Burning Steppes is brutal, so keep your water close and your head covered." },
    { id = "b_morgans_vigil_6", when = { timeOfDay = "night" }, text = "The night is hot in the Steppes, {class}, and the lava glows like a forge." },
    { id = "b_morgans_vigil_7", when = { class = "WARRIOR" }, text = "A {class}! The Blackrock orcs need a lesson in Alliance steel." },
    { id = "b_morgans_vigil_8", when = { maxLevel = 50 }, text = "You're young for the Steppes, so stay close to the Vigil." },
    { id = "b_morgans_vigil_9", when = { ghost = true }, text = "A ghost in the Steppes? The healer's near, so go find your body." },
    { id = "b_morgans_vigil_10", when = { word = "helped" }, text = "You've helped Morgan's Vigil, {name}, and we're grateful for it." },
  },
}

P:Pool {
  id = "passt_nighthaven_citizen", role = "citizen", community = "nighthaven",
  barks = {
    { id = "b_nighthaven_1", text = "Nighthaven is a place of peace, and the Cenarion Circle tends the Moonglade's grove." },
    { id = "b_nighthaven_2", text = "The Moonglade is sacred to Elune and the druids, and all are welcome who come in peace." },
    { id = "b_nighthaven_3", text = "Keeper Remulos watches over the Moonglade, and the druids learn from him." },
    { id = "b_nighthaven_4", text = "The Lunar Festival brings many to Nighthaven, though the Moonglade is always beautiful." },
    { id = "b_nighthaven_5", text = "The wisps of the Moonglade are said to carry the dreams of ancient druids." },
    { id = "b_nighthaven_6", when = { timeOfDay = "night" }, text = "Elune's light shines brightly over the Moonglade tonight, {class}; a sacred sight." },
    { id = "b_nighthaven_7", when = { class = "DRUID" }, text = "A {class}, welcome. The Moonglade is your home, and the Circle welcomes you." },
    { id = "b_nighthaven_8", when = { form = "bear" }, text = "A druid in bear form, wandering the Moonglade. The grove welcomes all forms." },
    { id = "b_nighthaven_9", when = { ghost = true }, text = "A spirit in the Moonglade. Elune will guide you back, little one." },
    { id = "b_nighthaven_10", when = { word = "helped" }, text = "You've helped Nighthaven, {name}, and the Circle remembers it." },
  },
}

P:Pool {
  id = "passt_nijels_point_citizen", role = "citizen", community = "nijels_point",
  barks = {
    { id = "b_nijels_point_1", text = "Nijel's Point watches over Desolace, and the centaur clans are always at war." },
    { id = "b_nijels_point_2", text = "The Kolkar, Gelkis and Magram centaur fight for Desolace, and we stay out of their way." },
    { id = "b_nijels_point_3", text = "Desolace is a barren land, but there's still life here if you know where to look." },
    { id = "b_nijels_point_4", text = "The Burning Legion's taint is strong in Desolace, and the demons at Mannoroc Coven are dangerous." },
    { id = "b_nijels_point_5", text = "The kodo graveyard is a sacred place, though the kodo themselves are restless." },
    { id = "b_nijels_point_6", when = { timeOfDay = "night" }, text = "The night is quiet in Desolace, {class}, though the centaur never truly sleep." },
    { id = "b_nijels_point_7", when = { class = "WARLOCK" }, text = "A {class}? The demons at Mannoroc Coven might recognize you, so be careful." },
    { id = "b_nijels_point_8", when = { maxLevel = 35 }, text = "You're young for Desolace, so stay close to Nijel's Point." },
    { id = "b_nijels_point_9", when = { ghost = true }, text = "A ghost in Desolace? The healer's near, so go find your body." },
    { id = "b_nijels_point_10", when = { word = "helped" }, text = "You've helped Nijel's Point, {name}, and we're grateful for it." },
  },
}

P:Pool {
  id = "passt_refuge_pointe_citizen", role = "citizen", community = "refuge_pointe",
  barks = {
    { id = "b_refuge_pointe_1", text = "Refuge Pointe watches over the Arathi Highlands, and Stromgarde dreams of reclaiming its kingdom." },
    { id = "b_refuge_pointe_2", text = "The Syndicate and the Witherbark trolls prowl the Highlands, and they hate us equally." },
    { id = "b_refuge_pointe_3", text = "Hammerfall's orcs are too close for comfort, and they'd love to see Refuge Pointe fall." },
    { id = "b_refuge_pointe_4", text = "The ogres at Boulderfist Hall are bold, and they don't respect anyone's borders." },
    { id = "b_refuge_pointe_5", text = "Stromgarde Keep is half in ruins, but the humans there still fight for their king." },
    { id = "b_refuge_pointe_6", when = { timeOfDay = "night" }, text = "The Arathi night is cold, {class}, but a fire and a good blade keep you warm." },
    { id = "b_refuge_pointe_7", when = { race = "Human" }, text = "Another human in the Highlands. Stromgarde's not what it was, but we'll take it back." },
    { id = "b_refuge_pointe_8", when = { class = "PALADIN" }, text = "A {class}, Light be praised; Refuge Pointe needs your strength." },
    { id = "b_refuge_pointe_9", when = { ghost = true }, text = "A ghost in the Highlands? The healer's near, so go find your body." },
    { id = "b_refuge_pointe_10", when = { word = "helped" }, text = "You've helped Refuge Pointe, {name}, and we're grateful for it." },
  },
}

P:Pool {
  id = "passt_sepulcher_citizen", role = "citizen", community = "sepulcher",
  barks = {
    { id = "b_sepulcher_1", text = "The Sepulcher watches over Silverpine, and the worgen of Pyrewood are never far." },
    { id = "b_sepulcher_2", text = "The Shadowfang Keep is full of worgen, and Arugal's madness still lingers there." },
    { id = "b_sepulcher_3", text = "Ambermill's magi are no friends of the Forsaken, and they'd love to see us destroyed." },
    { id = "b_sepulcher_4", text = "The fog in Silverpine never lifts, which suits us; the living find it unsettling." },
    { id = "b_sepulcher_5", text = "Dalaran's barrier glows to the south, and the magi there hide from the world." },
    { id = "b_sepulcher_6", when = { timeOfDay = "night" }, text = "The night is long in Silverpine, {class}, and the worgen howl." },
    { id = "b_sepulcher_7", when = { race = "Scourge" }, text = "Ah, another of the Forsaken. Welcome to the Sepulcher, though it's hardly a home." },
    { id = "b_sepulcher_8", when = { class = "WARLOCK" }, text = "A {class}? Good, the worgen fear your fel magic." },
    { id = "b_sepulcher_9", when = { ghost = true }, text = "A ghost? How ironic, given most of us are dead already." },
    { id = "b_sepulcher_10", when = { word = "helped" }, text = "You've served the Dark Lady well, {name}, and the Sepulcher remembers it." },
  },
}

P:Pool {
  id = "passt_splintertree_citizen", role = "citizen", community = "splintertree",
  barks = {
    { id = "b_splintertree_1", text = "Splintertree Post watches over Ashenvale, and the night elves are always close." },
    { id = "b_splintertree_2", text = "The Sentinels of Astranaar hate us, and they'd love to see Splintertree fall." },
    { id = "b_splintertree_3", text = "The Warsong clan cuts down Ashenvale's trees, and the night elves won't let us forget it." },
    { id = "b_splintertree_4", text = "The satyrs of Ashenvale are dangerous, and they hate the Horde as much as the elves do." },
    { id = "b_splintertree_5", text = "This forest is where Grom Hellscream killed the demon Mannoroth, and his memory lives on." },
    { id = "b_splintertree_6", when = { timeOfDay = "night" }, text = "The night is dark in Ashenvale, {class}, and the night elves love the dark." },
    { id = "b_splintertree_7", when = { race = "Orc" }, text = "Welcome, warrior; Splintertree stands for the Horde, as it always has." },
    { id = "b_splintertree_8", when = { class = "WARRIOR" }, text = "A {class}! The night elves could use a lesson in Horde steel." },
    { id = "b_splintertree_9", when = { ghost = true }, text = "A ghost in the forest? The healer's near, so go find your body." },
    { id = "b_splintertree_10", when = { word = "helped" }, text = "You've helped Splintertree, {name}, and the Horde honors you for it." },
  },
}

P:Pool {
  id = "passt_stonard_citizen", role = "citizen", community = "stonard",
  barks = {
    { id = "b_stonard_1", text = "Stonard watches over the Swamp of Sorrows, and the Alliance from Nethergarde is never far." },
    { id = "b_stonard_2", text = "The Temple of Atal'Hakkar sinks in the swamp, and the trolls there worship a blood god." },
    { id = "b_stonard_3", text = "The swamp is full of crocolisks and worse things, so keep your blade sharp." },
    { id = "b_stonard_4", text = "The Blasted Lands are to the south, and the Dark Portal there is a reminder of our past." },
    { id = "b_stonard_5", text = "The Fallen Ones of the swamp are dangerous, and they'll drown you in the mud." },
    { id = "b_stonard_6", when = { timeOfDay = "night" }, text = "The swamp's loud at night, {class}, and the crocs love the dark." },
    { id = "b_stonard_7", when = { race = "Orc" }, text = "Welcome, warrior; Stonard has stood since the Second War." },
    { id = "b_stonard_8", when = { class = "SHAMAN" }, text = "A {class}! The swamp's elements are restless, so be careful." },
    { id = "b_stonard_9", when = { ghost = true }, text = "A ghost in the swamp? The healer's near, so go find your body." },
    { id = "b_stonard_10", when = { word = "helped" }, text = "You've helped Stonard, {name}, and the Horde honors you for it." },
  },
}

P:Pool {
  id = "passt_taurajo_citizen", role = "citizen", community = "taurajo",
  barks = {
    { id = "b_taurajo_1", text = "Camp Taurajo watches over the southern Barrens, and the Razormane quilboar are never far." },
    { id = "b_taurajo_2", text = "The Bael Modan dwarves dig in the Barrens, and they're no friends of the tauren." },
    { id = "b_taurajo_3", text = "The plains of the Barrens are wide and empty, but the Earth Mother is still here." },
    { id = "b_taurajo_4", text = "The Kolkar centaur raid the caravans, and the braves of Taurajo try to stop them." },
    { id = "b_taurajo_5", text = "Walk with the Earth Mother, friend; the Barrens can be cruel to those who aren't careful." },
    { id = "b_taurajo_6", when = { timeOfDay = "night" }, text = "Mu'sha's light shines over the Barrens tonight, {class}." },
    { id = "b_taurajo_7", when = { race = "Tauren" }, text = "Welcome, young one; Camp Taurajo is a home for all children of the Earth Mother." },
    { id = "b_taurajo_8", when = { class = "HUNTER" }, text = "A {class}! The Barrens are full of beasts to track, and the braves would welcome your help." },
    { id = "b_taurajo_9", when = { ghost = true }, text = "A spirit in the Barrens. The ancestors will guide you back, little one." },
    { id = "b_taurajo_10", when = { word = "helped" }, text = "You've helped Camp Taurajo, {name}, and the tribe remembers it." },
  },
}

P:Pool {
  id = "passt_theramore_citizen", role = "citizen", community = "theramore",
  barks = {
    { id = "b_theramore_1", text = "Lady Jaina Proudmoore rules Theramore, and she seeks peace with the Horde, though not everyone agrees." },
    { id = "b_theramore_2", text = "The Dustwallow Marsh is full of danger, and the black dragonflight lurks in the south." },
    { id = "b_theramore_3", text = "Brackenwall's orcs are too close for comfort, though Lady Jaina keeps the peace." },
    { id = "b_theramore_4", text = "The sea around Theramore is calm, and the ships from Menethil come and go." },
    { id = "b_theramore_5", text = "The Defias have been seen in the marsh, and Lady Jaina's guards are on alert." },
    { id = "b_theramore_6", when = { timeOfDay = "night" }, text = "The night is quiet in Theramore, {class}, though the marsh is never truly silent." },
    { id = "b_theramore_7", when = { race = "Human" }, text = "Another human in Theramore. Lady Jaina's peace is a fragile thing, so tread lightly." },
    { id = "b_theramore_8", when = { class = "MAGE" }, text = "A {class}! Lady Jaina's magi would welcome your help with their research." },
    { id = "b_theramore_9", when = { ghost = true }, text = "A ghost in Theramore? The healer's near, so go find your body." },
    { id = "b_theramore_10", when = { word = "helped" }, text = "You've helped Theramore, {name}, and we're grateful for it." },
  },
}

P:Pool {
  id = "passt_thorium_point_citizen", role = "citizen", community = "thorium_point",
  barks = {
    { id = "b_thorium_point_1", text = "Thorium Point watches over the Searing Gorge, and the Dark Iron dwarves are never far." },
    { id = "b_thorium_point_2", text = "The Thorium Brotherhood are Dark Irons who turned against Ragnaros, and they're welcome here." },
    { id = "b_thorium_point_3", text = "The heat of the Searing Gorge is brutal, so keep your water close and your head covered." },
    { id = "b_thorium_point_4", text = "The Dark Iron dwarves at the Slag Pit are dangerous, and they don't take prisoners." },
    { id = "b_thorium_point_5", text = "Blackrock Mountain looms to the south, and the black dragons rule it." },
    { id = "b_thorium_point_6", when = { timeOfDay = "night" }, text = "The night is hot in the Gorge, {class}, and the lava glows like a forge." },
    { id = "b_thorium_point_7", when = { class = "WARRIOR" }, text = "A {class}! The Dark Irons need a lesson in steel." },
    { id = "b_thorium_point_8", when = { maxLevel = 45 }, text = "You're young for the Gorge, so stay close to Thorium Point." },
    { id = "b_thorium_point_9", when = { ghost = true }, text = "A ghost in the Gorge? The healer's near, so go find your body." },
    { id = "b_thorium_point_10", when = { word = "helped" }, text = "You've helped Thorium Point, {name}, and we're grateful for it." },
  },
}
