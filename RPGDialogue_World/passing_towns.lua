local P = RPGDialogueAPI:Pack("rpgd.world")

-- Bark-only passing pools for towns and outposts (non-capital communities).

P:Pool {
  id = "passt_goldshire_citizen", role = "citizen", community = "goldshire",
  barks = {
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
    { id = "b_aerie_peak_1", text = "The Wildhammer ride gryphons over the Hinterlands, an' there's nae finer sight in all the world, {g:lad|lass}." },
    { id = "b_aerie_peak_2", text = "The Witherbark at Shadra'Alor are makin' offerings to their spider god again, an' it turns my stomach." },
    { id = "b_aerie_peak_3", text = "Falstad keeps the peace here, an' he'll tell any Ironforge envoy just how little he thinks of their councils." },
    { id = "b_aerie_peak_4", text = "The Vilebranch at Jintha'Alor have been stealin' gryphon eggs, an' every rider on this peak wants their heads." },
    { id = "b_aerie_peak_5", text = "Smell those pines on the wind, {g:lad|lass}; that's the Hinterlands, an' it beats forge smoke any day." },
    { id = "b_aerie_peak_6", when = { timeOfDay = "night" }, text = "The gryphons are roostin' for the night, so mind yer boots an' keep yer voice down near the aerie." },
    { id = "b_aerie_peak_7", when = { race = "Dwarf" }, text = "A Bronzebeard, eh? Ye're welcome, but up here we drink harder an' fly higher than yer cousins." },
    { id = "b_aerie_peak_8", when = { class = "HUNTER" }, text = "A {class}! The owlbeasts in the Overlook would test even a Wildhammer's aim, so watch yer back." },
    { id = "b_aerie_peak_9", when = { ghost = true }, text = "A ghost at the aerie? The gryphons can smell ye, an' they're screamin' about it somethin' fierce." },
    { id = "b_aerie_peak_10", when = { word = "helped" }, text = "Word's gone round the stables about ye, {name}, an' Falstad's riders don't praise outsiders lightly." },
    { id = "b_aerie_peak_11", text = "Hold still while I fix this saddle strap; Sharpbeak's been in a foul mood since the trolls came near the nests." },
  },
}

P:Pool {
  id = "passt_bloodhoof_citizen", role = "citizen", community = "bloodhoof",
  barks = {
    { id = "b_bloodhoof_1", text = "The plains are gentle today, and the kodo graze in the tall grass by the Red Rocks." },
    { id = "b_bloodhoof_2", text = "The Venture Company drills at the Rock and the Fields, and the Earth Mother bleeds where they dig." },
    { id = "b_bloodhoof_3", text = "The Bael'dun dwarves tunnel into our hills without asking, and Cairne's patience grows thin as winter grass." },
    { id = "b_bloodhoof_4", text = "Walk with the Earth Mother, friend; Bloodhoof Village welcomes all who come to it in peace." },
    { id = "b_bloodhoof_5", text = "The Palemane gnolls have been slinking around Brambleblade Ravine again, but our braves will drive them off." },
    { id = "b_bloodhoof_6", when = { timeOfDay = "night" }, text = "Mu'sha watches over the plains tonight, {class}, so rest easy beneath her light." },
    { id = "b_bloodhoof_7", when = { timeOfDay = "dawn" }, text = "An'she rises over Mulgore, and the grass is heavy with morning dew." },
    { id = "b_bloodhoof_8", when = { race = "Tauren" }, text = "Welcome home, young one; the Bloodhoof tents are always open to the children of the Earth Mother." },
    { id = "b_bloodhoof_9", when = { class = "DRUID" }, text = "A {class}, welcome. The spirits of Mulgore stir when one of the Cenarion path walks among them." },
    { id = "b_bloodhoof_10", when = { maxLevel = 10 }, text = "Stay near the village while you learn the hunt, little one, for the plainstriders kick harder than they look." },
    { id = "b_bloodhoof_11", when = { ghost = true }, text = "A spirit wanders the plains. The ancestors will guide you back to your body, little one." },
    { id = "b_bloodhoof_12", when = { word = "helped" }, text = "The elders have heard your name spoken at the fire, {name}, and that is no small thing among the tribe." },
    { id = "b_bloodhoof_13", text = "Windfury harpies have been circling the Red Cloud Mesa, and the young braves are itching to chase them." },
  },
}

P:Pool {
  id = "passt_bloodvenom_post_citizen", role = "citizen", community = "bloodvenom_post",
  barks = {
    { id = "b_bloodvenom_post_1", text = "Don't drink from any stream in Felwood, not even the clear ones; the demon taint is in all of it." },
    { id = "b_bloodvenom_post_2", text = "The Shadow Council skulk in Jaedenar, and their warlocks call things out of the dark that shouldn't exist." },
    { id = "b_bloodvenom_post_3", text = "The Deadwood furbolgs went mad from the corruption, and they'll tear apart anyone who walks their trails." },
    { id = "b_bloodvenom_post_4", text = "This forest was beautiful once, they say, before the Legion's filth soaked into every root." },
    { id = "b_bloodvenom_post_5", text = "Irontree Woods is crawling with corrupted beasts, so keep your blade out if you're heading north." },
    { id = "b_bloodvenom_post_6", when = { timeOfDay = "night" }, text = "Felwood glows green at night, {class}, and that light is the sickness, not the moon." },
    { id = "b_bloodvenom_post_7", when = { race = "Orc" }, text = "An orc in Felwood? Then you know what demon blood does better than anyone, so guard yourself." },
    { id = "b_bloodvenom_post_8", when = { class = "WARLOCK" }, text = "A {class}, here? Keep your pets leashed; Felwood has enough demons without you adding more." },
    { id = "b_bloodvenom_post_9", when = { ghost = true }, text = "A ghost in Felwood? Hurry back to your body before the corruption finds a way into it." },
    { id = "b_bloodvenom_post_10", when = { word = "helped" }, text = "The post has had fewer funerals since you came through, {name}, and that's thanks enough out here." },
    { id = "b_bloodvenom_post_11", text = "I burned my boots last week because the bog water ate through the leather, so mind your own." },
  },
}

P:Pool {
  id = "passt_brackenwall_citizen", role = "citizen", community = "brackenwall",
  barks = {
    { id = "b_brackenwall_1", text = "Dustwallow's mud gets into everything, and the mosquitoes here are big enough to carry off a grunt." },
    { id = "b_brackenwall_2", text = "The humans of Theramore sit on their island and watch us, and every orc here watches them right back." },
    { id = "b_brackenwall_3", text = "Stonemaul ogres hold the south of the marsh, and they argue with their fists and clubs alike." },
    { id = "b_brackenwall_4", text = "Black dragons nest in the Wyrmbog, and those who wander in rarely come back to boast of it." },
    { id = "b_brackenwall_5", text = "Thrall made peace with the Lady Proudmoore, but there are some at Brackenwall who never wanted it." },
    { id = "b_brackenwall_6", when = { timeOfDay = "night" }, text = "The swamp breathes at night, {class}, and the things that live in it come up from the water." },
    { id = "b_brackenwall_7", when = { race = "Orc" }, text = "Good to see orcish strength in this marsh; these walls need warriors more than they need peace." },
    { id = "b_brackenwall_8", when = { class = "HUNTER" }, text = "A {class}! The crocolisks of Dustwallow will give your pet a fight worth bragging about." },
    { id = "b_brackenwall_9", when = { ghost = true }, text = "A ghost in the swamp? Walk quickly, for the bog has a way of keeping what it swallows." },
    { id = "b_brackenwall_10", when = { word = "helped" }, text = "The grunts speak of you at the cookfire, {name}, and Brackenwall does not hand out respect cheaply." },
    { id = "b_brackenwall_11", text = "Keep clear of the Shady Rest Inn; there is talk of ghosts and an old murder there." },
  },
}

P:Pool {
  id = "passt_chillwind_camp_citizen", role = "citizen", community = "chillwind_camp",
  barks = {
    { id = "b_chillwind_camp_1", text = "Commander Valorfist keeps Chillwind running on grit alone, so pull your weight or move along." },
    { id = "b_chillwind_camp_2", text = "Andorhal is overrun with the walking dead, and the Scourge raise more from its graves every night." },
    { id = "b_chillwind_camp_3", text = "The Scarlet Crusade at Hearthglen would sooner hang us than help, and that tells you their kind of mercy." },
    { id = "b_chillwind_camp_4", text = "Caer Darrow sits in the lake with the Scholomance beneath it, where the Cult of the Damned teaches necromancy." },
    { id = "b_chillwind_camp_5", text = "This snow never quite melts up here, and the cold gets into old wounds something terrible." },
    { id = "b_chillwind_camp_6", when = { timeOfDay = "night" }, text = "The plague fields stir at night, {class}, so post a watch before you close your eyes." },
    { id = "b_chillwind_camp_7", when = { race = "Human" }, text = "Lordaeron was our home once, and every farm you pass out there belonged to someone's family." },
    { id = "b_chillwind_camp_8", when = { class = "PALADIN" }, text = "A {class}! The Light burns hot against the Scourge, and we have little enough of it here." },
    { id = "b_chillwind_camp_9", when = { ghost = true }, text = "A ghost? Be quick about your body, before the Cult finds a use for what's left of it." },
    { id = "b_chillwind_camp_10", when = { word = "helped" }, text = "Valorfist mentioned your name over supper, {name}, and he doesn't mention many by name at all." },
    { id = "b_chillwind_camp_11", text = "I lost two brothers at Andorhal, so if you find a ring with a hawk on it, bring it here." },
  },
}

P:Pool {
  id = "passt_dolanaar_citizen", role = "citizen", community = "dolanaar",
  barks = {
    { id = "b_dolanaar_1", text = "The moonwells of Dolanaar are clear and bright, and Elune's blessing is strong in this village." },
    { id = "b_dolanaar_2", text = "The Gnarlpine furbolgs were our friends until something poisoned their minds, and now they turn on us." },
    { id = "b_dolanaar_3", text = "Fel Rock was once a peaceful cave, but the Burning Blade's taint has crept in among the stones." },
    { id = "b_dolanaar_4", text = "Teldrassil grows tall above us, and the archdruids say it will be our second Nordrassil in time." },
    { id = "b_dolanaar_5", text = "Ishnu-alah, young one; the roads of Teldrassil are long, but the trees will shade your travels." },
    { id = "b_dolanaar_6", when = { timeOfDay = "night" }, text = "Elune shines bright upon Dolanaar tonight, {class}, and her light is gentle on the leaves." },
    { id = "b_dolanaar_7", when = { race = "NightElf" }, text = "Elune-adore, child; may the Goddess guide your hand and the Sentinels guard your back." },
    { id = "b_dolanaar_8", when = { class = "DRUID" }, text = "A {class} in Dolanaar! The Cenarion Circle will want to hear your thoughts on Teldrassil's health." },
    { id = "b_dolanaar_9", when = { maxLevel = 10 }, text = "Stay near the village while you are young, for the Gnarlpine are not what they once were." },
    { id = "b_dolanaar_10", when = { ghost = true }, text = "A wandering spirit? The wisp will guide you home, for the Goddess does not abandon her children." },
    { id = "b_dolanaar_11", when = { word = "helped" }, text = "The Sentinels speak your name with respect, {name}, and that respect is not easily given here." },
    { id = "b_dolanaar_12", text = "Ban'ethil Barrow Den was meant for our sleeping druids, but now it echoes with something else entirely." },
  },
}

P:Pool {
  id = "passt_feathermoon_citizen", role = "citizen", community = "feathermoon",
  barks = {
    { id = "b_feathermoon_1", text = "Shandris Feathermoon herself keeps this stronghold, and she has never once lost a watch." },
    { id = "b_feathermoon_2", text = "The Gordunni ogres have fortified their camps along the coast, and they grow bolder each season." },
    { id = "b_feathermoon_3", text = "Dire Maul was Eldre'Thalas once, a jewel of the Highborne, and now ogres and shades walk its halls." },
    { id = "b_feathermoon_4", text = "The rain off the Forgotten Coast never truly stops, and the Sentinels' cloaks are never quite dry." },
    { id = "b_feathermoon_5", text = "The Grimtotem tauren have been seen near the ruins of Isildien, and they mean no good by it." },
    { id = "b_feathermoon_6", when = { timeOfDay = "night" }, text = "The sea is calm tonight, {class}, and Elune's light glitters across the water to Sardor Isle." },
    { id = "b_feathermoon_7", when = { race = "NightElf" }, text = "Elune-adore, sister of the forest; Feathermoon is your home here at the edge of the world." },
    { id = "b_feathermoon_8", when = { class = "HUNTER" }, text = "A {class}! The yetis and hippogryphs of Feralas will test your skill and your nerve." },
    { id = "b_feathermoon_9", when = { ghost = true }, text = "A ghost? The sea air carries spirits strangely here, so follow the wisp and do not tarry." },
    { id = "b_feathermoon_10", when = { word = "helped" }, text = "Shandris has heard of your deeds, {name}, and she does not waste her praise on idle archers." },
    { id = "b_feathermoon_11", text = "The ferry leaves for the mainland at dawn, and the boatman curses the ogres every crossing." },
  },
}

P:Pool {
  id = "passt_freewind_citizen", role = "citizen", community = "freewind",
  barks = {
    { id = "b_freewind_1", text = "Freewind Post sits high on its mesa, and the winds carry the voices of our ancestors to us." },
    { id = "b_freewind_2", text = "The Galak centaurs ride through the Needles below, and they hunger for tauren blood." },
    { id = "b_freewind_3", text = "The Grimtotem have turned against Cairne, and they hold Darkcloud Pinnacle as if it were theirs." },
    { id = "b_freewind_4", text = "Mind the lifts and the rope bridges, friend; the drop to the canyon floor is long and unforgiving." },
    { id = "b_freewind_5", text = "Far east lies the Shimmering Flats, where the goblins race their machines and blow themselves up." },
    { id = "b_freewind_6", when = { timeOfDay = "night" }, text = "The stars are close tonight above the Needles, {class}, as if the Earth Mother is watching." },
    { id = "b_freewind_7", when = { race = "Tauren" }, text = "Walk with the winds, child of the Earth Mother; Freewind welcomes you to its high places." },
    { id = "b_freewind_8", when = { class = "SHAMAN" }, text = "A {class}! The winds here speak loudly, and the elements will hear you clearly." },
    { id = "b_freewind_9", when = { ghost = true }, text = "A spirit on the mesa? The winds will carry you back to your body; let them guide you." },
    { id = "b_freewind_10", when = { word = "helped" }, text = "The elders of Freewind speak your name with warmth, {name}, and that warmth is rare among the stones." },
    { id = "b_freewind_11", text = "The harpies of the Splithoof crag tore our banners again, so my hands are full of needle and thread." },
  },
}

P:Pool {
  id = "passt_gromgol_citizen", role = "citizen", community = "gromgol",
  barks = {
    { id = "b_gromgol_1", text = "Dis be Stranglethorn, mon, and de jungle be ready to eat you if you blink twice." },
    { id = "b_gromgol_2", text = "De Bloodsail pirates think dey own dis coast, but Grom'gol knows how to sink a ship." },
    { id = "b_gromgol_3", text = "De Kurzen rebels hide in de jungle, and dey got no love for us or de humans either." },
    { id = "b_gromgol_4", text = "De zeppelin comes and goes from Orgrimmar and de Undercity, so we always got news, ya." },
    { id = "b_gromgol_5", text = "Hemet Nesingwary and his hunters shoot everything in dis jungle, and de raptors don't like it." },
    { id = "b_gromgol_6", when = { timeOfDay = "night" }, text = "De jungle sings at night, {class}, and dat song be full of teeth and claws." },
    { id = "b_gromgol_7", when = { race = "Troll" }, text = "Ah, a Darkspear! Stranglethorn be in our blood, mon, so walk proud through de trees." },
    { id = "b_gromgol_8", when = { class = "HUNTER" }, text = "A {class}! De tigers and panthers of Stranglethorn be de finest prey in de whole world." },
    { id = "b_gromgol_9", when = { ghost = true }, text = "A ghost in de jungle? Bwonsamdi be watchin' you, so get back to your body quick." },
    { id = "b_gromgol_10", when = { word = "helped" }, text = "De loa been whisperin' your name, {name}, and dat be a good sign for a stranger in Grom'gol." },
    { id = "b_gromgol_11", text = "De Gurubashi ruins be full of old troll magic, and some of it still be hungry." },
  },
}

P:Pool {
  id = "passt_hammerfall_citizen", role = "citizen", community = "hammerfall",
  barks = {
    { id = "b_hammerfall_1", text = "Hammerfall stands where the Warchief Doomhammer fell, and the Arathi stone remembers his blood." },
    { id = "b_hammerfall_2", text = "Stromgarde's humans hold their broken city to the south, and they still think these hills are theirs." },
    { id = "b_hammerfall_3", text = "The Syndicate creep around Durnholde Keep, hiring thugs and stealing anything that isn't nailed down." },
    { id = "b_hammerfall_4", text = "Boulderfist ogres camp in the Highlands, and they kill Horde and human alike without a care." },
    { id = "b_hammerfall_5", text = "These camps once held our people in chains, so we hold the land now, with proud axes." },
    { id = "b_hammerfall_6", when = { timeOfDay = "night" }, text = "The Highlands are cold at night, {class}, so keep your fire going and your blade near." },
    { id = "b_hammerfall_7", when = { race = "Orc" }, text = "An orc at Hammerfall! The Doomhammer would be proud to see his people stand free on this ground." },
    { id = "b_hammerfall_8", when = { class = "WARRIOR" }, text = "A {class}! The Highlands always need strong arms against Stromgarde and the Boulderfist." },
    { id = "b_hammerfall_9", when = { ghost = true }, text = "A ghost? Hurry back to your body before the Syndicate rob it bare." },
    { id = "b_hammerfall_10", when = { word = "helped" }, text = "Hammerfall has been safer since you came, {name}, and the Horde owes you a deed or two." },
    { id = "b_hammerfall_11", text = "The Witherbark trolls of Arathi are no kin to the Darkspear, so trust none of their offers." },
  },
}

P:Pool {
  id = "passt_kargath_citizen", role = "citizen", community = "kargath",
  barks = {
    { id = "b_kargath_1", text = "Nothing grows in the Badlands but thorn and grudge, and the sun bakes both until they crack." },
    { id = "b_kargath_2", text = "The Shadowforge Dark Irons dig in the old ruins at Angor, and they guard their spoils with fire." },
    { id = "b_kargath_3", text = "Uldaman lies to the north, a titan vault the Dark Irons and the dwarven diggers both want to plunder." },
    { id = "b_kargath_4", text = "Black dragons nest around the Lethlor Ravine, and their whelps hunt anything foolish enough to wander in." },
    { id = "b_kargath_5", text = "Kargath Bladefist gave this outpost his name, and we keep it the way he kept the Shattered Hand: hard." },
    { id = "b_kargath_6", when = { timeOfDay = "night" }, text = "The rock cools at night, {class}, but the coyotes and the buzzards never stop watching." },
    { id = "b_kargath_7", when = { race = "Orc" }, text = "Lok'tar, orc! Our fathers raised these walls with their own hands, and we keep them standing for the Horde." },
    { id = "b_kargath_8", when = { class = "WARRIOR" }, text = "A {class}! The Badlands grind down the weak, so drink plenty and swing harder than the Dark Irons." },
    { id = "b_kargath_9", when = { ghost = true }, text = "A ghost in the Badlands? The buzzards will pick your bones clean if you dawdle." },
    { id = "b_kargath_10", when = { word = "helped" }, text = "The warlord himself grunted your name at the war table, {name}, and he does not grunt for nothing." },
    { id = "b_kargath_11", text = "Rock elementals walk the dry riverbeds like the stones themselves are angry, and maybe they are." },
  },
}

P:Pool {
  id = "passt_light_hope_citizen", role = "citizen", community = "light_hope",
  barks = {
    { id = "b_light_hope_1", text = "Light's Hope Chapel still stands in the Eastern Plaguelands, and the dead have never once breached its ground." },
    { id = "b_light_hope_2", text = "Stratholme still smoulders behind its walls, and the Scourge pour out of its gates like rats from a sewer." },
    { id = "b_light_hope_3", text = "The Argent Dawn holds this chapel, and every tithe of silver and holy water we're sent goes to the front." },
    { id = "b_light_hope_4", text = "Corin's Crossing belongs to the ghouls now, and the Scarlet zealots at Tyr's Hand would rather we died too." },
    { id = "b_light_hope_5", text = "There's a hermit by the river near Uther's Tomb, and some swear he once wore a paladin's tabard." },
    { id = "b_light_hope_6", when = { timeOfDay = "night" }, text = "Bolt the doors and keep the braziers lit, {class}; the dead come thickest when the sun goes down." },
    { id = "b_light_hope_7", when = { class = "PALADIN" }, text = "A {class}! The Dawn has use for anyone who can call the Light against the plague, so welcome." },
    { id = "b_light_hope_8", when = { class = "PRIEST" }, text = "A {class} of the Light, thank the saints; the sick in the back room have been praying for one." },
    { id = "b_light_hope_9", when = { ghost = true }, text = "A ghost? Run to your body, before the Scourge raise it and send it back to us." },
    { id = "b_light_hope_10", when = { word = "helped" }, text = "The Dawn's quartermaster has written your name in his ledger, {name}, and he keeps very honest books." },
    { id = "b_light_hope_11", text = "The plague cauldrons poison the land for miles, and the Dawn counts every one it destroys like a holy relic." },
  },
}

P:Pool {
  id = "passt_marshals_refuge_citizen", role = "citizen", community = "marshals_refuge",
  barks = {
    { id = "b_marshals_refuge_1", text = "Marshal's Refuge is the only safe ground in Un'Goro, and only because Marris keeps a sharp watch on it." },
    { id = "b_marshals_refuge_2", text = "The devilsaurs shake the whole crater when they hunt, so keep off the open trails and pray they're fed." },
    { id = "b_marshals_refuge_3", text = "The Gorishi silithid have hives in the southwest of the crater, and they skitter closer every week." },
    { id = "b_marshals_refuge_4", text = "Ringo wandered off again, and one day that poor fool is going to come back inside a raptor." },
    { id = "b_marshals_refuge_5", text = "Fire Plume Ridge smokes from dawn to dusk, and the fire elementals around it are hotter tempered still." },
    { id = "b_marshals_refuge_6", when = { timeOfDay = "night" }, text = "Hear that roar out in the dark, {class}? That's why no one sleeps outside the refuge in Un'Goro." },
    { id = "b_marshals_refuge_7", when = { class = "HUNTER" }, text = "A {class}! The pterrordax and stegodons here are the finest test of a hunter's eye in all of Kalimdor." },
    { id = "b_marshals_refuge_8", when = { maxLevel = 48 }, text = "You're green for Un'Goro, so stay close to the refuge, and run if the trees start to shake." },
    { id = "b_marshals_refuge_9", when = { ghost = true }, text = "A ghost? Get back to your body quick before something in the crater mistakes it for supper." },
    { id = "b_marshals_refuge_10", when = { word = "helped" }, text = "Marris owes you a debt, {name}, and so does everybody here who sleeps a little sounder for it." },
    { id = "b_marshals_refuge_11", text = "Those glowing crystals hum with some strange power, and the goblins pay good gold for every one." },
  },
}

P:Pool {
  id = "passt_mojache_citizen", role = "citizen", community = "mojache",
  barks = {
    { id = "b_mojache_1", text = "Camp Mojache sits in the heart of Feralas, and the rain drums on our tents like a ceremonial drum." },
    { id = "b_mojache_2", text = "The Gordunni ogres hold the north, and their warlocks twist magic in ways the Earth Mother rejects." },
    { id = "b_mojache_3", text = "Even here the Grimtotem make camp, and they speak against Cairne Bloodhoof as if he were nothing." },
    { id = "b_mojache_4", text = "Dire Maul lies to the west, a ruined elven city where ogres and old spirits share the halls uneasily." },
    { id = "b_mojache_5", text = "The forests of Feralas are ancient, older than the night elves' memory, and they speak if you listen." },
    { id = "b_mojache_6", when = { timeOfDay = "night" }, text = "Night in Feralas is dark and wet, {class}, but the rain is the Earth Mother's own lullaby." },
    { id = "b_mojache_7", when = { race = "Tauren" }, text = "Walk with the Earth Mother, child; the tents of Mojache are as open to you as the plains of home." },
    { id = "b_mojache_8", when = { class = "DRUID" }, text = "A {class}! The Emerald Dream feels close in Feralas, where the green runs deep and old." },
    { id = "b_mojache_9", when = { ghost = true }, text = "A spirit in the rain? Let the Earth Mother guide you gently back to your body, little one." },
    { id = "b_mojache_10", when = { word = "helped" }, text = "The elders of Mojache say your name at the fire, {name}, and that honor is not given lightly." },
    { id = "b_mojache_11", text = "The great Feralas yetis wander down in winter, and our hunters can tell their tracks from a mile away." },
  },
}

P:Pool {
  id = "passt_morgans_vigil_citizen", role = "citizen", community = "morgans_vigil",
  barks = {
    { id = "b_morgans_vigil_1", text = "Morgan's Vigil watches the Burning Steppes, where the ash falls like grey snow on every rooftop." },
    { id = "b_morgans_vigil_2", text = "The Blackrock orcs ride out of the mountain every night, and their war bands are getting bolder." },
    { id = "b_morgans_vigil_3", text = "Marshal Maxwell keeps this vigil out of pure stubbornness, and he's buried more good soldiers than he'll say." },
    { id = "b_morgans_vigil_4", text = "The Dark Irons answer to Ragnaros down in his molten pit, and they fight like they've got fire in their veins." },
    { id = "b_morgans_vigil_5", text = "The steppes burned when the black dragons came, and nothing green has grown here since." },
    { id = "b_morgans_vigil_6", when = { timeOfDay = "night" }, text = "The steppes glow red at night, {class}, and the smoke hides the stars from the sentries." },
    { id = "b_morgans_vigil_7", when = { class = "WARRIOR" }, text = "A {class}! The Blackrock orcs respect only strength, so show them yours and come back to tell it." },
    { id = "b_morgans_vigil_8", when = { maxLevel = 50 }, text = "You're young for the Burning Steppes, so stay near the vigil and keep watch on the ridges." },
    { id = "b_morgans_vigil_9", when = { ghost = true }, text = "A ghost? The ash will bury your body soon, so hurry before you lose the trail." },
    { id = "b_morgans_vigil_10", when = { word = "helped" }, text = "Maxwell mentioned you by name at muster, {name}, and he barely remembers his own sergeants' names." },
    { id = "b_morgans_vigil_11", text = "My armor's been black with soot since I arrived, and I've stopped pretending I'll ever polish it clean." },
  },
}

P:Pool {
  id = "passt_nighthaven_citizen", role = "citizen", community = "nighthaven",
  barks = {
    { id = "b_nighthaven_1", text = "Moonglade is sacred ground, and no blood is spilled in Nighthaven by any hand, Horde or Alliance." },
    { id = "b_nighthaven_2", text = "Keeper Remulos watches over the glade, and his father was Cenarius himself, the forest lord." },
    { id = "b_nighthaven_3", text = "The Timbermaw furbolgs guard the pass to Felwood, and they remember every friend and every slight." },
    { id = "b_nighthaven_4", text = "The great moonwell of Moonglade is among the oldest in the world, so treat its waters with reverence." },
    { id = "b_nighthaven_5", text = "Tauren and kaldorei druids share this glade, and the Circle asks only peace and patience of each." },
    { id = "b_nighthaven_6", when = { timeOfDay = "night" }, text = "Elune's light is strong over Moonglade tonight, {class}, and Lake Elune'ara shines like silver." },
    { id = "b_nighthaven_7", when = { class = "DRUID" }, text = "A {class}, welcome home; Nighthaven is the heart of the Cenarion Circle, and you belong here." },
    { id = "b_nighthaven_8", when = { form = "bear" }, text = "A bear in Nighthaven! The Timbermaw might mistake you for kin, so mind your manners." },
    { id = "b_nighthaven_9", when = { ghost = true }, text = "A wandering spirit in the glade? Elune will guide you gently back to your body." },
    { id = "b_nighthaven_10", when = { word = "helped" }, text = "Keeper Remulos has noticed your deeds, {name}, and the glade welcomes you as a friend." },
    { id = "b_nighthaven_11", text = "The barrow dens beneath Moonglade hold druids in the Emerald Dream, and their sleep is very long." },
  },
}

P:Pool {
  id = "passt_nijels_point_citizen", role = "citizen", community = "nijels_point",
  barks = {
    { id = "b_nijels_point_1", text = "Desolace is grey and dead, and the centaurs fight each other over every scrap of it." },
    { id = "b_nijels_point_2", text = "The Kolkar, Magram and Gelkis clans war endlessly out there, and we keep well out of their way." },
    { id = "b_nijels_point_3", text = "The Burning Blade have dug into Thunder Axe Fortress, and they've been calling demons into the wastes." },
    { id = "b_nijels_point_4", text = "Maraudon lies to the southwest, sacred to the centaurs and haunted by the princess Theradras." },
    { id = "b_nijels_point_5", text = "Nijel founded this point with his own hands, and some say the dust and silence drove him a little mad." },
    { id = "b_nijels_point_6", when = { timeOfDay = "night" }, text = "Listen to that wind howl, {class}; on nights like this Desolace sounds like it's weeping." },
    { id = "b_nijels_point_7", when = { class = "WARLOCK" }, text = "A {class}? Keep your demons leashed, or the Burning Blade may decide they want them back." },
    { id = "b_nijels_point_8", when = { maxLevel = 35 }, text = "You're young for Desolace, so stay near the point and give the centaur camps a wide berth." },
    { id = "b_nijels_point_9", when = { ghost = true }, text = "A ghost in Desolace? The dust will cover your body soon, so find it before it's gone." },
    { id = "b_nijels_point_10", when = { word = "helped" }, text = "Even the Kodo Graveyard scavengers know your name by now, {name}, and so does everyone at the point." },
    { id = "b_nijels_point_11", text = "Water's worth more than gold in Desolace, so ration yours and don't trust the lake near Shadowbreak." },
  },
}

P:Pool {
  id = "passt_refuge_pointe_citizen", role = "citizen", community = "refuge_pointe",
  barks = {
    { id = "b_refuge_pointe_1", text = "Refuge Pointe is all that's left of Stromgarde's strength in the Arathi Highlands." },
    { id = "b_refuge_pointe_2", text = "The Syndicate hold Durnholde and the other keeps, and they sold Lordaeron out long ago." },
    { id = "b_refuge_pointe_3", text = "The Horde at Hammerfall watch us from the east, and we watch them right back." },
    { id = "b_refuge_pointe_4", text = "Boulderfist ogres raid the farms in the valleys, and the Witherbark trolls lurk in the hills." },
    { id = "b_refuge_pointe_5", text = "Stromgarde was a great city once under Thoras Trollbane, and now it's ruins full of brigands." },
    { id = "b_refuge_pointe_6", when = { timeOfDay = "night" }, text = "The Highlands are cold at night, {class}, and the Syndicate move under cover of darkness." },
    { id = "b_refuge_pointe_7", when = { race = "Human" }, text = "Welcome, friend of Stromgarde; Refuge Pointe holds for the Alliance in these hills." },
    { id = "b_refuge_pointe_8", when = { class = "PALADIN" }, text = "A {class}! The Light shines on Refuge Pointe, and we need every scrap of it against the Syndicate." },
    { id = "b_refuge_pointe_9", when = { ghost = true }, text = "A ghost? Hurry back to your body before the Syndicate strip it bare." },
    { id = "b_refuge_pointe_10", when = { word = "helped" }, text = "The soldiers of the Pointe speak of you with respect, {name}, and that's not easily earned here." },
    { id = "b_refuge_pointe_11", text = "Danath Trollbane's men are spread thin across Arathi, so we need every blade we can find." },
  },
}

P:Pool {
  id = "passt_sepulcher_citizen", role = "citizen", community = "sepulcher",
  barks = {
    { id = "b_sepulcher_1", text = "The Sepulcher hides beneath Silverpine's dark pines, and the Dark Lady's will reaches even here." },
    { id = "b_sepulcher_2", text = "Arugal's worgen haunt Shadowfang Keep, and their howls carry across the forest every night." },
    { id = "b_sepulcher_3", text = "The Pyrewood villagers are cursed, men by day and beasts by night, and the fools don't even know it." },
    { id = "b_sepulcher_4", text = "Dalaran's walls glimmer to the south, and the mages within hide behind their violet shield like frightened children." },
    { id = "b_sepulcher_5", text = "The Royal Apothecary Society has business in Silverpine, and you'd do best not to ask about it." },
    { id = "b_sepulcher_6", when = { timeOfDay = "night" }, text = "Silverpine is darker than ever at night, {class}, and the worgen hunt among the pines." },
    { id = "b_sepulcher_7", when = { race = "Scourge" }, text = "Another of the Forsaken; the Dark Lady's will brought us here, and we serve her gladly." },
    { id = "b_sepulcher_8", when = { class = "WARLOCK" }, text = "A {class}! The shadows are strong in Silverpine, so wield them well against the living." },
    { id = "b_sepulcher_9", when = { ghost = true }, text = "A ghost? You're halfway to one of us already, but find your body before the worgen do." },
    { id = "b_sepulcher_10", when = { word = "helped" }, text = "The deathstalkers speak of you, {name}, and they've a dim view of most living things." },
    { id = "b_sepulcher_11", text = "Fenris Isle once held a keep, and now it holds only the dead and the gnolls who feed on them." },
  },
}

P:Pool {
  id = "passt_splintertree_citizen", role = "citizen", community = "splintertree",
  barks = {
    { id = "b_splintertree_1", text = "Splintertree Post holds the Horde's ground in Ashenvale, and the night elves want us gone." },
    { id = "b_splintertree_2", text = "The Warsong Lumber Camp cuts timber for Orgrimmar, and the Sentinels raid it every night." },
    { id = "b_splintertree_3", text = "The forest itself fights back here, with ancients and dryads who hate the sound of our axes." },
    { id = "b_splintertree_4", text = "Grom Hellscream slew Cenarius in this forest, and the elves have never let us forget it." },
    { id = "b_splintertree_5", text = "The Foulweald and Thistlefur furbolgs are maddened, and they attack anyone who wanders too close." },
    { id = "b_splintertree_6", when = { timeOfDay = "night" }, text = "Ashenvale is dark at night, {class}, and the Sentinels move silently through the trees." },
    { id = "b_splintertree_7", when = { race = "Orc" }, text = "Lok'tar, orc; Splintertree needs strong arms to hold the line against the elves." },
    { id = "b_splintertree_8", when = { class = "WARRIOR" }, text = "A {class}! The Sentinels fight like ghosts, so stay alert and strike before they do." },
    { id = "b_splintertree_9", when = { ghost = true }, text = "A ghost in Ashenvale? Hurry back before the Sentinels find your body." },
    { id = "b_splintertree_10", when = { word = "helped" }, text = "The grunts at the palisade raise their axes when you pass, {name}, and that's a warrior's thanks." },
    { id = "b_splintertree_11", text = "The Warsong axes ring all day, and one by one the trees fall for the Horde." },
  },
}

P:Pool {
  id = "passt_stonard_citizen", role = "citizen", community = "stonard",
  barks = {
    { id = "b_stonard_1", text = "Stonard rises out of the Swamp of Sorrows, and the mud here swallows careless travelers whole." },
    { id = "b_stonard_2", text = "The Temple of Atal'Hakkar sinks deeper into the swamp, and the trolls inside worship a blood god." },
    { id = "b_stonard_3", text = "The Blasted Lands lie to the south, where the Dark Portal stands silent and broken." },
    { id = "b_stonard_4", text = "The Bloodscale and Sorrowscale naga lurk in the swamp's waters, and they strike without warning." },
    { id = "b_stonard_5", text = "Stonard was built by orcs who would not bow, and we hold it with pride and stone." },
    { id = "b_stonard_6", when = { timeOfDay = "night" }, text = "The swamp fogs up thick at night, {class}, and the naga move just below the surface." },
    { id = "b_stonard_7", when = { race = "Orc" }, text = "Lok'tar, orc; Stonard is a fortress of the Horde in this cursed swamp, and it will stand." },
    { id = "b_stonard_8", when = { class = "SHAMAN" }, text = "A {class}! The spirits in the Swamp of Sorrows are troubled, and they need a steady voice." },
    { id = "b_stonard_9", when = { ghost = true }, text = "A ghost in the swamp? Find your body before the naga drag it into the water." },
    { id = "b_stonard_10", when = { word = "helped" }, text = "The orcs of Stonard won't forget your deeds, {name}; we carve such things in stone here." },
    { id = "b_stonard_11", text = "Green dragons have been seen near the Temple, and that means nothing good for any of us." },
  },
}

P:Pool {
  id = "passt_taurajo_citizen", role = "citizen", community = "taurajo",
  barks = {
    { id = "b_taurajo_1", text = "Camp Taurajo watches over the southern Barrens, where the dry grass runs on to the horizon." },
    { id = "b_taurajo_2", text = "The Razorfen quilboar have their kraul to the south, and they raid our caravans often." },
    { id = "b_taurajo_3", text = "Bael Modan lies to the east, a dwarven dig site where the stout folk dig without asking." },
    { id = "b_taurajo_4", text = "Bristleback quilboar have been creeping close to the camp, and the braves keep spears ready." },
    { id = "b_taurajo_5", text = "Dwarven guns at Northwatch boom in the distance some nights, and the Alliance grow restless." },
    { id = "b_taurajo_6", when = { timeOfDay = "night" }, text = "The Barrens are quiet at night, {class}, and the stars shine brightly over Taurajo." },
    { id = "b_taurajo_7", when = { race = "Tauren" }, text = "Walk with the Earth Mother, child; Taurajo is home to those who honor the land." },
    { id = "b_taurajo_8", when = { class = "HUNTER" }, text = "A {class}! The plains of the southern Barrens are full of game, so hunt with respect." },
    { id = "b_taurajo_9", when = { ghost = true }, text = "A ghost on the plains? Let the Earth Mother guide your spirit back home." },
    { id = "b_taurajo_10", when = { word = "helped" }, text = "Taurajo's elders speak your name with honor, {name}, and the tribe remembers it." },
    { id = "b_taurajo_11", text = "The winds carry the scent of rain from Thousand Needles, and the grass turns green after the storms." },
  },
}

P:Pool {
  id = "passt_theramore_citizen", role = "citizen", community = "theramore",
  barks = {
    { id = "b_theramore_1", text = "Theramore stands strong on its island in Dustwallow Marsh, and Lady Jaina keeps it well." },
    { id = "b_theramore_2", text = "The marsh is full of crocolisks and worse, so keep to the roads if you value your boots." },
    { id = "b_theramore_3", text = "Lady Proudmoore made peace with the Horde, but there are some in Theramore who mutter against it." },
    { id = "b_theramore_4", text = "There's talk of something old and dark in the Wyrmbog, but sensible folk don't speak of it aloud." },
    { id = "b_theramore_5", text = "The Stonemaul ogres hold the south of the marsh, and they don't take kindly to visitors." },
    { id = "b_theramore_6", when = { timeOfDay = "night" }, text = "The marsh fogs thick at night, {class}, and the lights of Theramore are a comfort to sailors." },
    { id = "b_theramore_7", when = { race = "Human" }, text = "Welcome to Theramore, friend; Lady Jaina's city is a beacon for the Alliance in Kalimdor." },
    { id = "b_theramore_8", when = { class = "MAGE" }, text = "A {class}! Lady Jaina's tower is full of studious mages, and they always need more hands." },
    { id = "b_theramore_9", when = { ghost = true }, text = "A ghost? The marsh can claim a body quickly, so hurry back before the crocolisks find it." },
    { id = "b_theramore_10", when = { word = "helped" }, text = "The guards at the gate speak of you with respect, {name}, and they aren't easily impressed." },
    { id = "b_theramore_11", text = "The harbor's busy with ships from Menethil, and every one brings letters and gossip from home." },
  },
}

P:Pool {
  id = "passt_thorium_point_citizen", role = "citizen", community = "thorium_point",
  barks = {
    { id = "b_thorium_point_1", text = "Thorium Point clings to the edge of the Searing Gorge, where the Dark Irons dig for fire." },
    { id = "b_thorium_point_2", text = "The Thorium Brotherhood turned from Ragnaros, and they've paid for that choice in Dark Iron blood." },
    { id = "b_thorium_point_3", text = "The heat of the Searing Gorge is brutal, so keep your water close and your head covered." },
    { id = "b_thorium_point_4", text = "The Dark Irons at the Slag Pit drive their slaves to the forges, and they show no mercy at all." },
    { id = "b_thorium_point_5", text = "Blackrock Mountain looms to the south, and the black dragons and Dark Irons both claim it." },
    { id = "b_thorium_point_6", when = { timeOfDay = "night" }, text = "The Gorge stays hot even at night, {class}, and the lava glows like a forge that never cools." },
    { id = "b_thorium_point_7", when = { class = "WARRIOR" }, text = "A {class}! The Dark Irons need a lesson in steel, and you might be the one to teach it." },
    { id = "b_thorium_point_8", when = { maxLevel = 45 }, text = "You're young for the Gorge, so stay close to Thorium Point and watch for fire elementals." },
    { id = "b_thorium_point_9", when = { ghost = true }, text = "A ghost in the Gorge? Find your body before the lava claims it." },
    { id = "b_thorium_point_10", when = { word = "helped" }, text = "The Brotherhood have started calling you friend, {name}, and those Dark Irons don't trust anyone easily." },
    { id = "b_thorium_point_11", text = "The Brotherhood smiths make the finest weapons in the world, if you can earn their favor first." },
  },
}
