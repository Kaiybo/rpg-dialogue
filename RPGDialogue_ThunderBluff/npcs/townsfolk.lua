-- Thunder Bluff's working people: the bank, the wind riders, the weapon master and the bowyer,
-- and the teachers of fishing, cooking, alchemy, herbalism and leatherworking.
-- No quests and little gossip in the game. Voice: bibles/townsfolk.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- The central mesa
---------------------------------------------------------------------------

-- Chesmu: a banker who still thinks of wealth as a herd.
P:NPC {
  key = "chesmu", id = TODO_NPC("Chesmu"), name = "Chesmu", title = "Banker",
  bible = "bibles/townsfolk.md", role = "banker", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "honest", "patient" },
  impression = {
    first = "Chesmu keeps Thunder Bluff's vaults and still counts wealth the way the tauren did when they wandered, in herds and in friends. The coins are kept carefully all the same.",
    third = "{name} met Chesmu, a banker of Thunder Bluff who remembers when the tauren kept their wealth on the hoof.",
  },

  greetings = {
    { id = "g_hi", text = "Welcome, friend. Your vault is safe, as safe as a calf in the middle of the herd." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and your things have waited patiently for you. Shall I open the vault?" },
    { id = "g_walk", when = { origin = "tauren_long_migration" }, text = "Welcome, friend. You came here on the long walk, so you'll remember when everything a family owned fit on one kodo's back, and you'll forgive an old banker for marvelling at how full these vaults have grown." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "In what they protect, I think. The orcs say the Silver Hand counted them like coins in the camps, and the tauren never did that to anyone. Count your friends, and keep your coins safe with me." } },
      choices = {
        { text = "My friends count more than my coins, Chesmu.", next = "BACK", reply = "Then you're richer than most who come to my counter, and I'll tell you so gladly. Keep your coins here all the same, and your friends close.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Coins first. Friends come and go.", next = "BACK", reply = "They do come and go, I won't argue that. But a coin never came running when the centaur were at the camp, and a friend did.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The old way, yes. When the tauren wandered, a family was rich if it had healthy herds and friends who would come when called, and a healer who came was worth more than both. The coins in these vaults are useful, but I have never seen one close a wound." } },
      choices = {
        { text = "Then I'll be the friend who comes when called.", next = "BACK", reply = "Then you are the richest kind of healer, by the old count. The herd would have welcomed you at any fire on the plains.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Coin pays for my work, Chesmu, the same as anyone's.", next = "BACK", reply = "It does, and there is no shame in a fair wage. I only meant that some things are worth more than they cost.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Old shields, mostly, and armour from fights they'd rather not forget. I keep it all in the rock beneath the mesa, and some of the braves come back years later just to look at the shield that saved them." } },
      choices = {
        { text = "I'll keep the gear that saved me. It deserves respect.", next = "BACK", reply = "It does, and I'm glad you see it so. Bring it to me when you're done with it, and I'll keep it in the rock with the others.", fx = { align = { order = 1 } } },
        { text = "Old gear is clutter. I'll sell it.", next = "BACK", reply = "Sell it if you must, and I'll not judge you for it. Still, I've seen old braves weep over a dented shield, so you may change your mind one day.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Many do, and I don't mind, as long as they're cleaned first. One hunter left the skull of a plains lion with me and visits it every season, which I find touching, though the other bankers find it strange." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} can wait at the door, please. The vaults are no place for a beast, however well behaved." },
      },
      choices = {
        { text = "I keep my trophies to honour the beasts I've taken.", next = "BACK", reply = "That is a good reason, and the old hunters would say the same. I'll keep them safe and clean for you, and you can visit them whenever you like.", fx = { align = { honor = 1 } } },
        { text = "Trophies are for showing off. I'd sell mine.", next = "BACK", reply = "Then sell them, and someone else will show them off for you. I'd rather keep the skull of a beast that was honoured than one that was bragged over.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Sturdy enough that you'll never find out, and I'll thank you not to wonder aloud near the guards. The vaults of Thunder Bluff are cut into the rock of the mesa itself, and anyone who wants in will need a pick and a lifetime." },
      },
      choices = {
        { text = "Only curious, Chesmu. Your vaults are safe from me.", next = "BACK", reply = "I'm glad to hear it, and the guards will be gladder. Curiosity is a fine thing, so long as it stays on your side of the counter.", fx = { align = { honor = 1 } } },
        { text = "A lifetime is long. Locks only need patience.", next = "BACK", reply = "The rock of this mesa has been patient for longer than the tauren have walked it. I wish you a long and boring life, and the vaults a quiet one.", fx = { align = { honor = -1 } } },
        { text = "Is Thunder Bluff safe for my things?", next = "safe" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Mages keep the strangest things of anyone, and I've learned not to ask. One left a stone that hummed all night, and another left a book I'm sure moved to a different shelf by itself, so I keep the mages' things at the far end." },
      },
      choices = {
        { text = "Fair. I'll keep my strange things properly sealed.", next = "BACK", reply = "Thank you, truly, the other bankers will sleep easier for it. The book still moves, mind you, but at least it's stopped humming.", fx = { align = { order = 1 } } },
        { text = "What I keep is my own business, banker.", next = "BACK", reply = "It is, and I'll keep it that way, at the far end of the vault. Just don't be offended if I keep my distance while I do it.", fx = { align = { order = -1 } } },
        { text = "What do tauren keep in their vaults?", next = "keep" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Less than most, though they keep a few seeds and old charms that came from Moonglade with their first teachers. When we wandered, that was how every tauren lived, and the druids remind me that a full vault is a fine thing but a healthy herd is better." } },
      choices = {
        { text = "A full vault keeps a family safe, and there's no shame in it.", next = "BACK", reply = "No shame at all, and I'm a banker, so I'd hardly say otherwise. Still, the druids keep me honest, and I think that's a good thing too.", fx = { align = { order = 1 } } },
        { text = "Carry little, and nothing can ever tie you down.", next = "BACK", reply = "The druids would agree with you, and so would my grandfather. Still, a wandering people has to carry its wealth somewhere, and my vaults are lighter on the back.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I trust anyone the Horde trusts, and I count wealth in herds and friends besides, so a warlock with friends is a rich warlock. Make friends on the bluff, then, and the vault will be the least of what you keep here." },
      },
      choices = {
        { text = "I'll make friends here, Chesmu.", next = "BACK", reply = "Then you'll find the tauren generous with their friendship, if slow to give it. Come back and tell me who you've met, and I'll count you rich.", fx = { align = { light = 1 } } },
        { text = "Friends are a poor kind of wealth.", next = "BACK", reply = "That's a lonely way to count, and a short one. I hope the bluff changes your mind before you need a friend more than a coin.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The tauren count wealth in herds and friends, and I wonder how a paladin counts it." },
        { id = "h_default", key = true, text = "I am Chesmu, and I keep the vaults of Thunder Bluff. Whatever you leave here is safe until you return for it, and you may reach the same vault from any bank of the Horde." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "Welcome, child of the Earth Mother. Our grandparents carried everything they owned on a kodo's back, and now we leave it with a stranger on a mesa. The world changes, and we change with it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The elders say the earth keeps its treasures deep, and so do I, though mine have locks on them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll have spare armour to store, I expect, because warriors always carry more than they can wear." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Hides and trophies go in the lower vaults, where the smell won't bother the other guests." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Welcome to the vault, friend, though I suspect the thing you value most can't be kept in a box." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. Hamuul's students keep very little in my vaults, because they say the plains hold everything they need, and I never know whether to admire that or worry." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your vault is ready, though I'd ask you to keep anything that whispers out of it." },
      },
      again = { { id = "h_again", text = "Is there something more you wanted to ask, friend? The vaults have waited this long, so they can wait a little longer." } },
      choices = {
        { text = "Do you count a priest's work as wealth, Chesmu?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do shamans keep anything in your vaults, Chesmu?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'd like my vault.", next = "BUSINESS" },
        { text = "I'd guess the tauren haven't always had banks.", next = "history" },
        { text = "What do tauren keep in their vaults?", next = "keep" },
        { text = "Thunder Bluff seems safe enough for my things.", next = "safe" },
        { text = "Your vaults look sturdy, Chesmu. How sturdy, I wonder?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Mages must keep strange things in your vaults.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What do warriors usually leave with you, Chesmu?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do hunters keep their trophies here, Chesmu?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Druids seem to own almost nothing, Chesmu.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do you trust warlocks with your vaults, Chesmu?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "How do you count a paladin's wealth, Chesmu?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Chesmu.", next = "END" },
      },
    },
    history = {
      lines = { { id = "h2_default", text = "No. When we wandered the plains, a tauren's wealth was the herd, and the friends who'd help guard it. The High Chieftain built this city so we could stop running from the centaur, and a city needs a place to keep things." } },
      choices = {
        { text = "You must miss the old ways.", next = "history_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history_miss = {
      big = true,
      lines = { { id = "hm_default", text = "Sometimes, on a clear evening, I miss the sound of the herd at night. But my children sleep without fear of the Kolkar now, and I'd trade every song of the old plains for that." } },
      choices = {
        { text = "Safety is worth the change.", next = "BACK", reply = "It is, for me and for my children. Still, I keep a song or two for the evenings, and that's no harm to anyone.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some freedom is lost when walls go up.", next = "BACK", reply = "It is, and I won't pretend otherwise. But the walls here are of stone and sky, and the plains are still right there below us when we want them.", fx = { align = { order = -1 } } },
      },
    },
    keep = {
      lines = { { id = "k_default", text = "Totems carved by grandparents, a first hunter's bow, a hide painted with a family's story. Gold too, I suppose, but gold never seems to matter much to my people. The keepsakes are what they come back for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "s_default", text = "There's only the lifts up from Mulgore and the bridges between the rises, and the braves watch every one of them. A thief would need wings, and the wind riders would see him first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Totems wrapped in old hide, mostly, and a few sacred stones the elders won't let anyone else touch. When we wandered, a shaman carried the tribe's whole wealth on her back, and now I carry it in iron, which my back is grateful for." } },
      choices = {
        { text = "Sacred things belong in safe hands, and your vault serves the tribe.", next = "BACK", reply = "I'm glad you see it so, and so are the elders who trusted me. Iron is a poor home for sacred things, but a safe one.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sacred things belong on the road with the people, not locked away.", next = "BACK", reply = "Some of the shaman agree, and they come for their totems every season to take them walking. The vault keeps them safe between journeys, no more.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "They keep their own counsel on Elder Rise. I keep their coin the same as anyone's, and say no more." } },
    cairne = { { id = "tp_cairne", text = "Cairne trusts me with the wealth of the bluff, and I keep it as carefully as I kept the herds. Gold is easier to count than kodo, but harder to love." } },
    thrall = { { id = "tp_thrall", text = "The Warchief taught the tauren to keep coin, and we learned. I still count wealth in friends first, though, and Thrall is a good one to count." } },
    booty_bay = { { id = "tp_booty_bay", text = "The goblins of Booty Bay keep a bank too, and they count every copper three times. I admire their care, if not their manners." } },
    _none = { { id = "tp_none", text = "I don't know, friend. Ask Innkeeper Pala; everyone talks to her, as the whole herd drinks at one river." } },
  },
}

-- Tal: the wind rider master on the tower above the central mesa.
P:NPC {
  key = "tal", id = TODO_NPC("Tal"), name = "Tal", title = "Wind Rider Master",
  bible = "bibles/townsfolk.md", role = "flightmaster", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "patient" },
  notices = { "mount", "form" },
  impression = {
    first = "Tal keeps the wind riders at the top of Thunder Bluff's tower and speaks of the sky the way other tauren speak of the plains. He is unhurried, and he trusts the wind more than any map.",
    third = "{name} met Tal, the wind rider master of Thunder Bluff.",
  },

  greetings = {
    { id = "g_hi", text = "The wind is good today, and An'she is high. Where shall it carry you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back on the tower. The wind riders remember you, friend." },
    { id = "g_windshaper", when = { origin = "skyborne_windshaper" }, text = "One of Ayessa's Windshapers, up on my tower again. You stand into the wind like my riders do, as if you're listening for something in it, and I hope one day it tells you what you want to hear." },
  },

  notice = {
    { id = "n_flight", cat = "form", when = { form = "travel" },
      text = "Running in the cheetah's shape, up all those stairs? The wind riders will happily save your legs, druid, and you can save your breath." },
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Bring your mount down off my tower, friend. The wind riders are proud, and they don't like sharing it." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "We trust the wind more than any map, and the wind is a kind of spirit. The Light is a stranger, but strangers are not enemies until they prove it. Fly with my riders, and they'll learn your scent." } },
      choices = {
        { text = "I'll fly with them and prove no enemy.", next = "BACK", reply = "That's the right way to meet them, and they'll respect you for it. Give them a scratch behind the ears when you land, and they'll remember.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll fly. Proving myself is a waste of time.", next = "BACK", reply = "They won't care whether you prove it, only whether you're kind to them. Fly, then, and be gentle with the reins.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Now and then, when harpies spook a wind rider over the Barrens or a storm catches one above the Needles. The beasts fall harder than their riders do, and I've nursed more than one torn wing with salve and patience. I don't know whether your prayers reach a wind rider, but I'd be grateful if you tried." } },
      choices = {
        { text = "I'll try. Beasts deserve healing as much as riders.", next = "BACK", reply = "Thank you, friend, they'll know you tried even if your prayers don't reach them. A wind rider remembers every kindness.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers are for people, Tal, not beasts.", next = "BACK", reply = "That's your choice to make, and I'll not quarrel with it. I'll keep the salve handy, then, and do the praying myself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To the Crossroads, mostly, where the centaur raid and the quilboar fight, and to Camp Taurajo, where the Razorfen grow bolder every season. The wind riders carry warriors to the fight and bring them home again, though they always seem to fly faster on the way back." } },
      choices = {
        { text = "Send me where the Horde needs me most, Tal.", next = "BACK", reply = "The Crossroads always needs more, and the riders will take you there gladly. Hold on tight over the Barrens, the winds are rough.", fx = { align = { honor = 1 } } },
        { text = "Send me where the fighting pays best, Tal.", next = "BACK", reply = "Then Taurajo will suit you, and the Razorfen will make you earn your pay. The riders fly the same whether you're paid or not.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "With patience, raw meat and a great deal of respect, because a wind rider remembers every kindness and every slight. They're proud creatures, and a hunter would understand them better than most, so you're welcome to come up the tower and meet them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} doesn't care for the wind riders, I see. They're not fond of it either, but they've never once quarrelled with a hunter's beast." },
      },
      choices = {
        { text = "Respect is the only way to earn a beast's trust.", next = "BACK", reply = "It is, and the riders know it better than anyone. A beast that trusts you will carry you through any storm.", fx = { align = { honor = 1 } } },
        { text = "A strong hand earns trust faster than respect.", next = "BACK", reply = "Try that with a wind rider, and you'll be walking back from the Crossroads. They'd sooner drop you than be ruled by force.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The wind riders watch it, and they sleep lighter than any guard. More than one thief has tried to climb the tower at night, and the beasts woke the whole rise before he reached the top, so I've never needed to sleep with one eye open." },
      },
      choices = {
        { text = "Good beasts. Nobody should rob a flight master.", next = "BACK", reply = "Good, then you'll be welcome up here any time. The beasts like an honest face, and so do I.", fx = { align = { honor = 1 } } },
        { text = "Light sleepers only need a quieter thief.", next = "BACK", reply = "Then I wish him luck, because the last one fell off the tower. My riders sleep lighter than you'd guess, friend.", fx = { align = { honor = -1 } } },
        { text = "What is it like to fly?", next = "fly" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They'll carry you, but not what follows you, and they'll grumble about the smell of you the whole way to the Crossroads. Wind riders are honest beasts, and they don't care for anything that comes from the Twisting Nether." },
      },
      choices = {
        { text = "I'll leave it behind. Calm skies for your beasts.", next = "BACK", reply = "Thank you, the beasts will fly gentler for it. Calm skies to you as well, warlock.", fx = { align = { light = 1 } } },
        { text = "They'll learn to bear it, like everyone else.", next = "BACK", reply = "They'll bear it because I ask them to, not because they like it. Mind you don't make me ask too often.", fx = { align = { light = -1 } } },
        { text = "Where do the wind riders come from?", next = "beasts" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hamuul's druids say every beast can feel the Earth Mother's balance in them, and a wind rider is only a beast with very large wings. I've also noticed the druids feed them better than the traders do, so I won't swear which reason matters more." } },
      choices = {
        { text = "Beasts know an honest heart, and that's reason enough.", next = "BACK", reply = "That's what I think, though the druids would call it the Earth Mother's balance. Either way, the riders will know you for what you are.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A good meal buys any beast's trust. It's that simple.", next = "BACK", reply = "There's truth in that, and the traders would agree with you. Still, a good meal and an honest heart together never hurt anyone.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They'll carry anyone the Horde trusts, and they don't care what you carry in your head, only what you carry on your back. Trust the wind, not your teleports, and you'll see more of Kalimdor than any city." },
      },
      choices = {
        { text = "I'll trust the wind, then, Tal.", next = "BACK", reply = "Good, then you'll see Kalimdor as the riders see it. There's nothing like the Barrens from above at sunrise.", fx = { align = { order = 1 } } },
        { text = "My spells will get me there faster.", next = "BACK", reply = "Faster, perhaps, but you'll miss the view, and the view is half the point. Fly once, and tell me then whether you still prefer your spells.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. The wind will carry you anywhere, and it doesn't care what you pray to." },
        { id = "h_default", key = true, text = "I am Tal, and I keep the wind riders of Thunder Bluff. They will carry you to the Crossroads, Camp Taurajo, Sun Rock Retreat, or anywhere else the Horde keeps a roost you've visited." },
        { id = "h_skyborne", when = { race = "Skyborne" }, text = "One of the Windshapers. Your people know the sky better than mine, I think, but the wind riders will still carry you, if you'll let them do the flying." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, then you'll enjoy the flight more than most, because the wind riders say your kind talk to the air the whole way." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The wind riders will carry you wherever the Horde needs you, but hold on tight, because they don't slow down for armour." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. My wind riders are beasts too, and they always know when a hunter is near; they lift their heads and watch." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, at the top of the tower. The wind up here hears a great many prayers from nervous riders, so you'll be in good company." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. The wind riders always settle when one of Hamuul's students is near, and I stopped asking why long ago, because I'm grateful for the quiet." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, up the tower. The wind riders don't mind magic, but they mind sudden noises, so cast quietly." },
      },
      again = { { id = "h_again", text = "Anything more? The wind won't wait forever, and neither will that wyvern, who bit a goblin last week for dawdling." } },
      choices = {
        { text = "Do your riders ever come back hurt, Tal?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The wind riders must feel the air spirits, Tal.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Take me somewhere.", next = "BUSINESS" },
        { text = "I've never flown on a wind rider.", next = "fly" },
        { text = "Where do the wind riders come from?", next = "beasts" },
        { text = "Why don't you fly to Bloodhoof Village?", next = "bloodhoof" },
        { text = "Someone must watch the tower while you sleep, Tal.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Where do the wind riders take warriors, Tal?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How do you care for the wind riders, Tal?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Will your wind riders carry a warlock?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why do the wind riders settle around druids, Tal?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Will the wind riders carry a mage, Tal?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the tauren trust the Light, Tal?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Tal.", next = "END" },
      },
    },
    fly = {
      lines = { { id = "f_default", text = "Like standing on the highest rise with the wind in your face, only the rise is moving. The first time I flew over Mulgore, I saw how small our troubles were from up there, and how large the Earth Mother's world is." } },
      choices = {
        { text = "The sky puts everything in its place.", next = "BACK", reply = "It does, and the Earth Mother is very large indeed. Fly once, and you'll come home with smaller troubles and a wider heart.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "From up there, I'd only see targets.", next = "BACK", reply = "Then you've missed the best part of flying, and I'm sorry for it. The sky is wide enough for both of us, but it's wasted on that kind of eye.", fx = { align = { light = -1 } } },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "From the high places of Kalimdor, where the winds are strong. They are proud creatures, and they don't serve; they agree to carry us, as long as we treat them with respect." } },
      choices = {
        { text = "I'd hate to disrespect one.", next = "beasts_respect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_respect = {
      lines = { { id = "br_default", text = "They put you down somewhere you'd rather not be, and they don't fly for you again. I've seen it happen to an orc who kicked one, and he walked home from the Barrens." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bloodhoof = {
      lines = { { id = "bl_default", text = "Because the walk is a good one, and it's short. The plains of Mulgore are worth walking through slowly, friend, so take the lift down and go on foot; you'll thank me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They feel everything about the wind, and they turn skittish when a storm is brewing over the Barrens long before I see a cloud. I've wondered whether they hear the same spirits you do, and I suspect they're better at listening." } },
      choices = {
        { text = "The beasts listen more humbly than we do, so we could learn from them.", next = "BACK", reply = "I think so too, and I try to listen as they do. A wind rider has never once flown me into a storm it could have warned me of.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts sense weather. The spirits speak only to the trained.", next = "BACK", reply = "Perhaps, and you'd know better than I would. Still, I wouldn't bet against a wind rider's ears, trained or not.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I know the wind and the routes it takes. For anything else, ask someone whose hooves stay on the ground." } },
    cairne = { { id = "tp_cairne", text = "Cairne flew with me once, and he held on so tightly that my wind rider complained for a week. He is a great chieftain, but a poor flyer." } },
    thrall = { { id = "tp_thrall", text = "The Warchief flies often, and he flies well. I think he likes the sky as much as I do." } },
    ratchet = { { id = "tp_ratchet", text = "The flight to Ratchet is long and windy, but the sea at the end is worth it. I go there sometimes to remember that the world is bigger than Mulgore." } },
  },
}

---------------------------------------------------------------------------
-- Hunter Rise
---------------------------------------------------------------------------

-- Ansekhwa: the weapon master, who teaches weapons as tools for protecting the herd.
P:NPC {
  key = "ansekhwa", id = TODO_NPC("Ansekhwa"), name = "Ansekhwa", title = "Weapon Master",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "disciplined", "honorable" },
  notices = { "class" },
  impression = {
    first = "Ansekhwa teaches weapons on Thunder Bluff with the calm of someone who has never needed to raise his voice. He treats every blade and staff as a promise to protect someone.",
    third = "{name} met Ansekhwa, the weapon master of Thunder Bluff.",
  },

  greetings = {
    { id = "g_hi", text = "Come to learn a new weapon? Good; a warrior with only one is half armed, and the herd needs you whole." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Show me how your practice has gone." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid with a staff. Many of your kind forget that the staff is a weapon too, so let me teach you to use it properly, and you'll need fewer claws." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Heavier, I think, because the Light holds you to it. The orcs remember the Silver Hand's promises from the camps, and they were broken ones. Keep yours, and you'll carry a weapon honestly." } },
      choices = {
        { text = "I'll keep my promises, Ansekhwa, all of them.", next = "BACK", reply = "Then you'll carry your weapon honestly, and that's all I ask of anyone. The orcs will see it, given time.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Promises are only as good as the need.", next = "BACK", reply = "The orcs heard much the same from the Silver Hand, and they've not forgotten. A weapon in the hands of a broken promise is only a weapon.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A staff, most often, because it keeps an enemy at arm's length while you work, and it leans well when you're tired. Some trolls carry daggers and some Forsaken prefer a wand, and I'll teach either. Whatever you choose, it has to keep you alive long enough to protect someone else." } },
      choices = {
        { text = "Then I'll learn the staff and guard the wounded.", next = "BACK", reply = "A wise choice, and a gentle one, and the wounded will bless you for it. Come back, and I'll teach you to make it sing.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather strike first than wait to protect anyone.", next = "BACK", reply = "Then you'll be a priest who fights, and that's no bad thing. Just remember who you came to protect when the fight is over.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The one in your hand, until it breaks, and then the one nearest you. A tauren warrior learns the axe, the mace and the staff, because the herd must be protected with whatever is at hand, and a warrior who can only fight with one weapon fights poorly with all the others." } },
      choices = {
        { text = "I'll learn every weapon I can, to protect the herd.", next = "BACK", reply = "Good, then you'll protect the herd with whatever's at hand. That's the tauren way, and a sound one.", fx = { align = { order = 1 } } },
        { text = "I'll master one weapon. The rest are distractions.", next = "BACK", reply = "Mastery has its place, and I've seen it save lives. But the day your one weapon breaks, the herd will need whatever you can pick up.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every tauren hunter once carried a spear, long before the orcs brought their guns across the sea. A spear keeps a charging beast at arm's length, and a hunter who knows how to use one will stand when others fall." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} will thank you for learning, {class}. A hunter who can protect his companion is a hunter worth following." },
      },
      choices = {
        { text = "I'll learn the spear, for my companion's sake.", next = "BACK", reply = "Your companion will thank you, and so will I. A spear and a bow together have kept many tauren hunters alive.", fx = { align = { order = 1 } } },
        { text = "My bow is enough. Let the beast handle the rest.", next = "BACK", reply = "The beast will try, and it may even succeed, but a hunter should never leave it all to the beast. Learn the spear, if only for its sake.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They do, in their way, which is the way of the hand that slips between the herd and the wolf. I'll grant you that a dagger in the dark has saved more than one camp, though I'd still rather the wolf saw us coming and chose to leave." },
      },
      choices = {
        { text = "Better the wolf sees us and runs. Agreed.", next = "BACK", reply = "Good, that's the tauren way, and I'm glad to hear it from a rogue. There's more honour in a wolf that leaves than in one that dies.", fx = { align = { honor = 1 } } },
        { text = "The wolf who never sees us never comes back.", next = "BACK", reply = "True enough, and I'll not argue it. But a wolf that never comes back teaches the pack nothing, and the pack keeps coming.", fx = { align = { honor = -1 } } },
        { text = "Why protect the herd and not conquer?", next = "herd" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A staff is a fine weapon, and the oldest, since every tauren elder carries one whether or not they can cast. Learn to swing it properly and you'll be glad of it the day your spells run dry, which is a day that comes for every mage." },
      },
      choices = {
        { text = "Then I'll learn the staff properly. Wise advice.", next = "BACK", reply = "Good, then you'll be ready when the day comes, and it will. The elders carry their staves for a reason.", fx = { align = { order = 1 } } },
        { text = "My spells won't run dry. I'll be fine.", next = "BACK", reply = "Every mage I've met has said so, and some of them are still alive. Learn the staff anyway, for the day you're wrong.", fx = { align = { order = -1 } } },
        { text = "Which weapon do you prefer?", next = "prefer" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Every blade and staff is a promise to protect someone, and I'd teach you to keep that promise yourself instead of handing it to a demon. Learn the staff, and you'll find you lean on the demon less, which is good for everyone." },
      },
      choices = {
        { text = "I'll learn the staff and keep my own promises.", next = "BACK", reply = "Then you'll be the kind of warlock the herd can trust. A promise kept by your own hand is worth more than any demon's.", fx = { align = { honor = 1 } } },
        { text = "My demon keeps my promises well enough.", next = "BACK", reply = "For now, perhaps, and I hope it always does. But I've never trusted a promise kept by something that would gladly break it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. A weapon is a promise to protect someone, and I imagine a paladin's promise is heavier than most." },
        { id = "h_default", key = true, text = "I am Ansekhwa, and I teach the use of weapons to any who can learn them. A weapon is a tool for protecting the herd, and the more tools you carry, the fewer ways the herd can be hurt." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior. You'll want to know every weapon there is, then, because one day the one in your hand will break, and you'll need to pick up whatever lies nearby." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll need a weapon you trust as much as your totems, and I can teach you one." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Show me how you hold that weapon, and I'll tell you how many fights it has lost you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know the bow and the gun, but I can teach you the spear and the axe for when the beast comes close." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Welcome, friend; few healers come to learn a weapon, but a staff or a mace in the right hands is a promise kept." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. You'll want to learn a staff, perhaps, or a dagger, because a demon can't protect you from everything." },
      },
      again = { { id = "h_again", text = "What else? Ask, and I'll answer plainly. Mind the practice post, for a young orc nearly took my horn off swinging at it." } },
      choices = {
        { text = "What weapon suits a priest, Ansekhwa?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Which weapons should a shaman learn, Ansekhwa?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me a weapon.", next = "BUSINESS" },
        { text = "Which weapon do you prefer?", next = "prefer" },
        { text = "Why protect the herd and not conquer?", next = "herd" },
        { text = "Do daggers protect the herd too, in their way?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A mage only needs a staff, Ansekhwa.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Which weapon should a warrior master first, Ansekhwa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should a hunter learn the spear, Ansekhwa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Should a warlock learn weapons, Ansekhwa?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Is a paladin's promise heavier, Ansekhwa?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Ansekhwa.", next = "END" },
      },
    },
    prefer = {
      lines = { { id = "p_default", text = "The mace, because it's honest. It doesn't pretend to be beautiful, and it hits just as hard whether you're skilled or not. A young tauren learns the mace first and then the finer things." } },
      choices = {
        { text = "You haven't mentioned guns.", next = "prefer_gun" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prefer_gun = {
      lines = { { id = "pg_default", text = "Loud, and useful, and the dwarves were clever to invent them. I teach them to hunters who want them, but I'll never love a weapon that frightens the whole herd every time it fires." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    herd = {
      big = true,
      lines = { { id = "h2_default", text = "Because we've seen what conquest did to the orcs and the humans both. The tauren fought only to survive the centaur, and the High Chieftain says we'll fight only to keep what we've built. I believe him." } },
      choices = {
        { text = "That's a wise way to fight.", next = "BACK", reply = "It is, and the High Chieftain has seen more war than most. A herd that fights only to protect lives longer than one that fights to conquer.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sometimes the best defence is striking first.", next = "BACK", reply = "Sometimes, I'll grant, and I've seen it done well. But a herd that strikes first soon finds itself with more enemies than it can count.", fx = { align = { honor = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Maces, axes, staves and daggers, and a good shaman learns more than one, because the elements can be slow to answer when a centaur is already at your throat. Every weapon is a promise to protect someone, so choose the one you mean to keep." } },
      choices = {
        { text = "One weapon, mastered and kept, like a promise.", next = "BACK", reply = "Then choose well, and keep it. The elements will be slower some days, and your weapon will need to answer when they don't.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever weapon is nearest when the centaur come is the right one.", next = "BACK", reply = "It's true in a fight, and many shaman have lived by it. Still, choose one to love, because a weapon you know will serve you best.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I teach weapons, friend, not lore. Ask one of the elders on Elder Rise; they keep the ancestors' memory." } },
    cairne = { { id = "tp_cairne", text = "Cairne carries a runespear taller than most orcs, and he uses it to protect the herd. I teach my students to do the same with every weapon." } },
    centaur = { { id = "tp_centaur", text = "The centaur use spears and bows, and they use them well. A tauren must be better, and I teach them to be." } },
    thrall = { { id = "tp_thrall", text = "The Warchief carries the Doomhammer, and he lifts it only when talking has failed. That is the mark of a true warrior." } },
  },
}

-- Kuna Thunderhorn: sells bows, arrows and guns on Hunter Rise.
P:NPC {
  key = "kuna", id = TODO_NPC("Kuna Thunderhorn"), name = "Kuna Thunderhorn", title = "Bowyer & Fletcher",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm" }, values = { "diligent", "proud" },
  impression = {
    first = "Kuna Thunderhorn makes and sells bows on Hunter Rise and speaks of good wood the way others speak of old friends. There's a family pride in every bow on the rack.",
    third = "{name} met Kuna Thunderhorn, the bowyer of Thunder Bluff's Hunter Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Come in, come in. Test the draw on any of them; that's what they're for, and the wood was given by the Earth Mother to be used." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter! You'll want arrows, I'd guess, and plenty of them. Hunters always run out of arrows first." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Why not? The humans' paladins fought close, the orcs say, but the Thunderhorns have always believed in knowing more than one way to protect the herd. A bow for a paladin would be a strange thing, but a good one." } },
      choices = {
        { text = "Many ways to protect the herd. I'll learn.", next = "BACK", reply = "Good, then come back and I'll fit you a bow. The Thunderhorns would be proud to see a paladin carry one.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A paladin fights close, Kuna. No bows.", next = "BACK", reply = "Then you'll have to wait for the enemy to come to you, and the harpies never will. I'll keep a bow in the back for when you change your mind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "We thank the beast and the Earth Mother before and after, and my family has done so since long before we had a rise to stand on. I don't know if it's prayer the way you mean it, but it keeps a hunter honest. Holt says a hunter who forgets to give thanks will soon forget to aim." } },
      choices = {
        { text = "Giving thanks is a good habit. I'll remember it.", next = "BACK", reply = "Holt will be pleased to hear it, and so will I. A hunter who gives thanks rarely goes hungry.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thanks won't fill a belly, Kuna. Good aim will.", next = "BACK", reply = "Good aim fills one belly, and thanks keeps the herd for the next. Holt would say both, and he's never been wrong yet.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should carry something that reaches further than his arm, because the harpies stay in the air and the centaur throw spears. A Thunderhorn bow is light enough to carry beside an axe, and it'll start a fight on your terms instead of theirs." } },
      choices = {
        { text = "I'll carry a bow and use it wisely.", next = "BACK", reply = "That's all I ask of anyone who carries a Thunderhorn bow. Start the fight on your terms, warrior, and finish it on your feet.", fx = { align = { order = 1 } } },
        { text = "A warrior fights face to face. Bows are for hunters.", next = "BACK", reply = "Face to face is fine until the harpies stay in the air. Carry one anyway, and you'll thank me the first time a centaur throws a spear.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The wood comes from the old trees of Mulgore, and we cut only from trees that have already fallen, so the Earth Mother gives each bow freely. A bow made from a gift shoots truer than one made from a theft, or so my grandmother always said." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it would enjoy a good hunt. Take it out to the plains with a Thunderhorn bow, and you'll both come home happy." },
      },
      choices = {
        { text = "I'll honour the bow and the land it came from.", next = "BACK", reply = "Then the bow will serve you well, and my grandmother would have smiled. A gift honoured is a gift that keeps on giving.", fx = { align = { honor = 1 } } },
        { text = "A bow is a tool. I care only how far it shoots.", next = "BACK", reply = "It will shoot far enough, and true, whatever you believe. I only hope one day you'll feel the difference in the draw.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They buy throwing knives, mostly, and sometimes a small crossbow, though they never say what for. I sell to anyone who pays, but I tell them all the same thing, which is that a Thunderhorn bow has never been fired into a tauren's back and I'd like to keep it that way." },
      },
      choices = {
        { text = "Fair words. I'll keep my aim honest.", next = "BACK", reply = "Good, that's all I ask. A Thunderhorn arrow has never found a tauren's back, and I'd like to keep it that way.", fx = { align = { honor = 1 } } },
        { text = "Where an arrow lands is the archer's business.", next = "BACK", reply = "It is, and the archer will answer for it, before the Earth Mother if not before the guards. Mind where yours land, rogue.", fx = { align = { honor = -1 } } },
        { text = "What makes a good bow?", next = "bow" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A wand fires true, I'll grant you, but it's only a stick with somebody else's magic in it. A bow needs a string and a strong arm, and I'll wager on a strong arm over borrowed magic any day." },
      },
      choices = {
        { text = "Perhaps. There's something to be said for simple tools.", next = "BACK", reply = "There's a great deal to be said, and I'll say it at length if you let me. A strong arm never runs dry.", fx = { align = { order = 1 } } },
        { text = "Magic is magic, borrowed or not. It works.", next = "BACK", reply = "It works until it doesn't, and then you'll want a bow. I'll keep one ready for that day.", fx = { align = { order = -1 } } },
        { text = "Is the hunter trainer on this rise your kin?", next = "holt" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They did once, when a young druid followed my cousin home from near the Red Rocks and asked her which tree she'd taken. Now I gather only fallen wood along the shore of Stonebull Lake, and I swear the bows draw sweeter for it." } },
      choices = {
        { text = "The druids were right to set limits on the cutting.", next = "BACK", reply = "They were, and I'll admit it now, though I grumbled at the time. The fallen wood makes better bows anyway.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A bowyer knows her wood. She shouldn't need anyone's leave.", next = "BACK", reply = "I thought so too, until the druid showed me what I'd taken. A bowyer who listens makes better bows than one who doesn't.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Probably not, though a wand is a poor thing next to a long bow of Mulgore wood. My grandfather used to say the bow never betrays its archer, and I wonder whether you can say the same of your demon." },
      },
      choices = {
        { text = "My demon is bound to me. It won't betray me.", next = "BACK", reply = "I hope so, for your sake. Still, my grandfather's bows never once needed binding, and I'll keep to my wood.", fx = { align = { order = 1 } } },
        { text = "Everything betrays you eventually. I'm ready for it.", next = "BACK", reply = "That's a sad way to see the world, and I hope you're wrong. My bows have never betrayed me, and I've carried them for many winters.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. I make bows, not hammers, but I'm curious what a paladin wants on Hunter Rise." },
        { id = "h_default", key = true, text = "I'm Kuna Thunderhorn, and I sell bows, arrows and guns on Hunter Rise. The Thunderhorns have always been hunters, and somebody in the family had to make the bows instead of only using them." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Come and look at the long bows. They're cut from the old trees of Mulgore, and they'll carry an arrow further than anything the orcs make." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman on Hunter Rise! You'll want a mace more than a bow, I'd wager, but you're welcome to admire the craftsmanship." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior on Hunter Rise? You'll be wanting a gun for when the centaur keep their distance, I'd wager." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! I can tell by the way you looked at my bows before you looked at me." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest on Hunter Rise! I've nothing on my rack for you, I'm afraid, though you're welcome to admire the wood." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! You won't need my bows once you're running with claws, but come and feel the wood anyway, because every stave on this rack came from a tree that fell on its own." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, looking at bows? I'll sell you one, though I doubt you'll ever draw it." },
      },
      again = { { id = "h_again", text = "Anything else? Take your time choosing; a bow is a long friendship." } },
      choices = {
        { text = "Do hunters here ever pray before a hunt, Kuna?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I'd guess few shamans take up the bow.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What makes a good bow?", next = "bow" },
        { text = "Is the hunter trainer on this rise your kin?", next = "holt" },
        { text = "Why sell guns, if you make bows?", next = "guns" },
        { text = "Rogues must buy your bows too, Kuna.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Bows are clumsy. A wand fires just as true.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Should a warrior carry a bow, Kuna?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What makes a Thunderhorn bow special, Kuna?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The druids must mind you cutting wood for bows.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Would a warlock ever need a bow, Kuna?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would a paladin carry a Thunderhorn bow, Kuna?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    bow = {
      lines = { { id = "b_default", text = "Good wood, cut in the right season, and patience while it dries. A bow made in a hurry will crack in the cold, and a bow made slowly will outlive the hunter who carries it." } },
      choices = {
        { text = "Patience makes the best tools.", next = "BACK", fx = { affinity = 1 } },
        { text = "What wood do you use?", next = "bow_wood" },
      },
    },
    bow_wood = {
      lines = { { id = "bw_default", text = "The trees along the streams of Mulgore, mostly, the ones the Earth Mother grew slowly. I never cut a living tree without asking it first, and if that sounds foolish, the bows haven't complained." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    holt = {
      lines = { { id = "h2_default", text = "We're both Thunderhorns, and he'd tell you every Thunderhorn is kin, which is true enough. He teaches the hunters on this rise, and I make sure they have something to shoot with when he's done." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guns = {
      lines = { { id = "g_default", text = "Because some hunters want them, and I'd rather they bought a good gun from me than a bad one from a goblin. I don't make them; I trade for them, and I check every one." } },
      choices = {
        { text = "A bow is more honourable.", next = "BACK", reply = "It is, to my mind, and to most of the Thunderhorns. But I'd rather a hunter carry a good gun than a bad bow, and that's honest.", fx = { align = { order = 1 } } },
        { text = "Whatever works is the right weapon.", next = "BACK", reply = "That's what the hunters who buy them say, and I can't argue it. Still, I'll keep the bows on the front rack, where they belong.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not often, because the elements want you up close, and lightning flies straighter than any arrow I've made. Still, the old shaman who blessed my first bow said the wood remembers the tree, and I've carved every bow since as if that were true." } },
      choices = {
        { text = "It is true. Everything made from the land keeps a spirit.", next = "BACK", reply = "I think so too, and so did the old shaman. My bows have always felt alive in my hands, and I carve them that way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Wood is wood. Good craft comes from your own hands.", next = "BACK", reply = "Your hands, yes, and I'll not take that from you. Still, the wood was a tree first, and I think it remembers.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, friend. Ask Holt; he's tracked more of the plains than I have, and knows more about most things." } },
    centaur = { { id = "tp_centaur", text = "The centaur make bows from the Barrens' thornwood, and they are poor bows. My family's bows are better, and they last longer." } },
    quilboar = { { id = "tp_quilboar", text = "The quilboar make no bows at all, which is why they lose. A hunter needs a good bow, and I make the best." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gives us the wood, and I thank her for every bow I make. A bow made without thanks will always miss." } },
  },
}

---------------------------------------------------------------------------
-- The crafters and teachers
---------------------------------------------------------------------------

-- Kah Mistrunner: the fishing trainer.
P:NPC {
  key = "kah", id = TODO_NPC("Kah Mistrunner"), name = "Kah Mistrunner", title = "Fishing Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "patient" },
  notices = { "profession" },
  impression = {
    first = "Kah Mistrunner teaches fishing on a mesa high above any water, and finds that more amusing than inconvenient. He is easy company, slow to hurry, and quick to laugh.",
    third = "{name} shared a laugh with Kah Mistrunner, who teaches the tauren to fish from a mesa nowhere near any water.",
  },

  greetings = {
    { id = "g_hi", text = "Ho, friend. Come to learn the patient art? The lakes of Mulgore are as calm as a sleeping kodo today." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Tell me what you caught, and don't make it bigger than it was." },
  },

  notice = {
    { id = "n_angler", cat = "profession", when = { profession = { name = "Fishing", min = 150 } },
      text = "You've the look of a proper angler now, the kind who checks the clouds before the water. Sit, and let's talk shop." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Patient ones do, and I imagine the dead are very patient. The Light might scare the fish, though, so keep it dim. Fishing is a quiet thing, and you seem like you've had enough noise." } },
      choices = {
        { text = "Quiet would suit me. I'll keep it dim.", next = "BACK", reply = "Good, the fish and I will both appreciate it. Come down to Stonebull Lake one morning, and we'll sit quiet together.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The fish can deal with the Light.", next = "BACK", reply = "Maybe they can, but they'll swim off while they think about it. Keep it dim, friend, or you'll go home with an empty bucket.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Only when the fish in Stonebull Lake are being stubborn, and they usually are. Aska says it's the bait and not the Earth Mother, and she's probably right, but I like to think someone's listening when I sit out there all morning. If a priest wants to bless my hooks, I won't say no." } },
      choices = {
        { text = "Someone always listens, Kah. Keep asking.", next = "BACK", reply = "I will, and it makes the mornings shorter, whether anyone listens or not. Aska would say you're spoiling me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer's wasted on fish, Kah. Change your bait.", next = "BACK", reply = "You sound just like Aska, and she's usually right. Still, I'll keep a word or two for the fish, just in case.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a warrior on the road must eat, and the lakes of Mulgore are full of fish for anyone patient enough to catch them. The braves who learn to fish learn patience along with it, and patience is a warrior's best friend when the centaur are waiting in ambush." } },
      choices = {
        { text = "Patience is worth learning. I'll try the line.", next = "BACK", reply = "Good, then come down to the lake one morning, and bring your patience. The fish will test it, I promise.", fx = { align = { order = 1 } } },
        { text = "Fishing is for peons. I'll eat jerky.", next = "BACK", reply = "Then your teeth will ache by the Crossroads, and you'll wish you'd listened. The lake will be here when you change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than most hunters think, because you read the water as you read the grass and you wait where the prey wants to be. The difference is that a fish won't charge you, which makes fishing a gentler hunt, though no less honest." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it would like a fish. Most beasts do, and the lakes of Mulgore have plenty to share." },
      },
      choices = {
        { text = "I'll take only what I'll eat, from lake or plain.", next = "BACK", reply = "That's the tauren way, and the lake will thank you for it. A full bucket is fine, but an honest one is better.", fx = { align = { honor = 1 } } },
        { text = "If the fish are biting, I'll fill the bucket.", next = "BACK", reply = "Fill it if they're biting, but leave some for tomorrow. The lake gives freely, and it remembers who's greedy.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Fair to the fish, maybe, because a seal takes only what it can eat while a fisherman fills a whole basket. Turak's students swim in Stonebull Lake sometimes, and I've hooked more of them on my line than I'd like to admit." } },
      choices = {
        { text = "A fisherman's patience beats a seal's teeth. I'll use the line.", next = "BACK", reply = "That's what I think, though Turak's students would argue. The line's gentler, and I don't have to swim.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A catch is a catch, so I'll use whatever works.", next = "BACK", reply = "That's the druid way, I suppose, and I'll not argue with it. Just mind my line if you're swimming, I hook enough of you as it is.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The best, because fishing is waiting quietly for a creature to make a mistake, and a rogue knows that game well. Just don't try to pick the fish's pocket, friend, because it hasn't got one, and you'll only fall in." },
      },
      choices = {
        { text = "I'll learn it honestly, Kah, with line and hook.", next = "BACK", reply = "Good, that's the only way I'll teach it. The fish will make a fool of you either way, so you may as well be honest.", fx = { align = { honor = 1 } } },
        { text = "Faster to take fish from someone else's net.", next = "BACK", reply = "You could, and someone would chase you off the shore for it. The lake has enough fish for everyone who's willing to wait.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because conjured bread tastes of nothing, and a fresh fish from Stonebull Lake tastes of Mulgore. Sit with a line for an afternoon and you'll see, though I'll warn you, the fish here laugh at impatient people." },
      },
      choices = {
        { text = "I'll learn it the proper way, then.", next = "BACK", reply = "Good, the fish will laugh at you either way, but at least you'll be laughing with them. Come down to the lake whenever you like.", fx = { align = { honor = 1 } } },
        { text = "I'll freeze the lake. Fun's for people with time.", next = "BACK", reply = "Ha, then you'll have a very cold lake and a very angry Earth Mother. Try a line first, friend, it's gentler on the fish.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Anyone can learn, if they can sit still and laugh at themselves when the fish wins, which it will. Send your demon off for an afternoon, and you might find a tug on the line beats anything it whispers." },
      },
      choices = {
        { text = "I'll send it off and enjoy the quiet.", next = "BACK", reply = "Good, the quiet's half the reason I fish. You'll be surprised what the water tells you when nothing's whispering.", fx = { align = { light = 1 } } },
        { text = "My demon stays. The fish can cope.", next = "BACK", reply = "Then the fish will cope by staying away from it, I imagine. Good luck to you, warlock, and to your bucket.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin wants to fish on a mesa! Well, the lakes are only a lift and a walk away, and the fish won't care." },
        { id = "h_default", key = true, text = "I'm Kah Mistrunner, and I teach fishing. It's a strange thing to teach on top of a mesa, I know, but the lakes of Mulgore are only a lift and a walk away." },
        { id = "h_troll", when = { race = "Troll" }, text = "A Darkspear! Your people fish the sea, and mine fish the lakes. We should trade secrets, you and I." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Then maybe you can tell me why the fish bite better after a rain, because I've wondered for years." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior who fishes? Don't laugh, because the best warriors I know are the ones who know how to wait." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know patience already, so you'll make a fine fisher, and the lakes of Mulgore are waiting." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, all the way up on a mesa! Sit a while, friend, for fishing is mostly waiting, and I hear prayer is much the same." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! Someday you'll swim like a seal and catch fish with your teeth, and then I'll be out of work, so promise me you'll still use a line now and then." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! You've the patience for fishing, I'd wager, because you're used to waiting in the dark." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, here to learn fishing? You could freeze the lake and pick them out, I suppose, but where's the fun in that?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock! Don't let your demon near the water, friend, or the fish will never bite again." },
      },
      again = { { id = "h_again", text = "Something more? Fishing gives plenty of time for talking, since the fish won't bite and something keeps stealing the ones that do." } },
      choices = {
        { text = "Do you ever pray for fish, Kah?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The fish seem to bite better after rain, Kah.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why would a warrior need to fish, Kah?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Fishing can't be much like hunting, Kah.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Is it fair to fish as a seal, Kah?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "Where's good fishing in Mulgore?", next = "where" },
        { text = "Why do tauren fish?", next = "why" },
        { text = "Do you have family in Thunder Bluff, Kah?", next = "aska" },
        { text = "Can a rogue make a good angler, Kah?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why fish when a mage can conjure food, Kah?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Can a warlock learn to fish, Kah?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the dead make good fishermen, Kah?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Kah.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Stonebull Lake, in the south of Mulgore, is the best, though the gnolls of the Palemane like it too. The streams around Bloodhoof Village are good for a beginner, and nobody will laugh at you there." } },
      choices = {
        { text = "The gnolls must bother you out here.", next = "where_gnolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_gnolls = {
      lines = { { id = "wg_default", text = "Only when they steal my catch. They've no patience for fishing themselves, so they wait until I've caught something and try to take it. Keep a club near your pole." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      big = true,
      lines = { { id = "y_default", text = "Because the Earth Mother provides in the water as well as on the plains, and it would be rude to refuse. And because a tauren who only hunts the kodo will one day find the kodo gone, so we take from many places a little, not from one place a lot." } },
      choices = {
        { text = "Taking only what's needed honours her.", next = "BACK", reply = "It does, and the Earth Mother smiles on it. A little from many places keeps the land full for our children.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The world gives freely. Take what you can.", next = "BACK", reply = "It gives freely, yes, but not endlessly. Take what you can, and one day you'll find there's nothing left to take.", fx = { align = { light = -1 } } },
      },
    },
    aska = {
      lines = { { id = "a_default", text = "My sister Aska cooks whatever I catch, which is how she ended up teaching cooking. Some days I think I fish only so she has something to complain about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My best guess is that the water spirits stir them up, and the fish get hungry and careless. Your guess would be better than mine, but a fisherman learns not to ask too many questions while the line is pulling." } },
      choices = {
        { text = "The water spirits deserve thanks for every catch.", next = "BACK", reply = "I think so too, and I thank them under my breath every time. The fish seem to bite better for it, or so I tell myself.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A catch is skill and patience, so leave the spirits out of it.", next = "BACK", reply = "There's truth in that, and Aska would agree with you. Still, I'll keep thanking them, because it costs me nothing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Can't say I know it. Ask Aska; she hears more gossip round the cookfire than I do by the water." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet has the best fishing in the Barrens, and the goblins sell the best bait. I go there when the mesa gets too dry." } },
    booty_bay = { { id = "tp_booty_bay", text = "The goblins of Booty Bay hold a fishing contest every week, they say. I would like to try it, but I am too old to cross the sea." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made the fish and the rivers, and she made them to be enjoyed. I enjoy them very much, though there is no river up here." } },
  },
}

-- Aska Mistrunner: the cooking trainer, Kah's sister.
P:NPC {
  key = "aska", id = TODO_NPC("Aska Mistrunner"), name = "Aska Mistrunner", title = "Cooking Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm" }, values = { "generous", "practical" },
  notices = { "profession" },
  impression = {
    first = "Aska Mistrunner teaches cooking in Thunder Bluff and treats every visitor as someone who hasn't eaten properly in weeks. She is warm, bossy, and usually right.",
    third = "{name} was fussed over by Aska Mistrunner, who teaches cooking on Thunder Bluff and believes nobody eats enough.",
  },

  greetings = {
    { id = "g_hi", text = "You look hungry. Everyone does, but you look hungrier than a kodo at the end of a dry season." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have you been eating properly, or only that dry trail bread?" },
  },

  notice = {
    { id = "n_cook", cat = "profession", when = { profession = { name = "Cooking", min = 150 } },
      text = "I can smell spices on your sleeves, and they're good ones. You've been cooking properly, then, and I'm proud of you." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because the orcs remember the Light from the camps, the trolls watch the dead, and the tauren are curious but cautious. A paladin who brings stew to the campfire gets a seat. That's how it works." } },
      choices = {
        { text = "Then I'll learn to cook and earn a seat.", next = "BACK", reply = "Good, then come by the fire, and I'll show you how to stew a plainstrider. You'll have your seat before the pot's empty.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A seat's not worth begging for, Aska.", next = "BACK", reply = "It's not begging, dear, it's sharing. But you're welcome to sit apart, if that suits you, and I'll save you a bowl anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Every winter, dear, when the fevers go round the lower rises. A good broth does half the work of any healer, and I'll argue that with a shaman or a priest alike. Bring me a sick one and I'll feed them, and you can do the other half." } },
      choices = {
        { text = "Then we'll share the work, Aska. Broth and prayer together.", next = "BACK", reply = "That's how I like it, dear. Broth and prayer together have pulled more than one calf through a winter.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Broth doesn't close wounds, Aska. Leave the healing to me.", next = "BACK", reply = "It doesn't, but it keeps them alive long enough for you to close them. Bring me the sick ones anyway, and we'll see who does more.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a warrior who can cook keeps his strength on the road, and a warrior who can't eats jerky until his teeth ache. The braves who learn to stew a plainstrider at dawn fight better by noon, and they share their pot with whoever's beside them." } },
      choices = {
        { text = "I'll learn to cook and share the pot.", next = "BACK", reply = "Good, then you'll be welcome at any fire on the road. Bring me a plainstrider, and I'll show you how.", fx = { align = { order = 1 } } },
        { text = "Jerky does me well enough. Cooking is for camps.", next = "BACK", reply = "Then your teeth will ache, and your belly will grumble, and you'll come back to me. I'll be here, dear.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plainstrider for stew and kodo for roasting, though a prairie wolf makes a fine broth if you cook it slowly. Every part of the beast has its use, and a hunter who learns to cook wastes nothing the Earth Mother gave." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would like a share, I'd wager. Set aside a little for it every time you cook, and it'll never wander far from your fire." },
      },
      choices = {
        { text = "I'll cook every part and waste nothing.", next = "BACK", reply = "Then the Earth Mother will smile on your pot, and so will I. Bring me what you have, and I'll show you how.", fx = { align = { honor = 1 } } },
        { text = "I'll cook the best cuts and leave the rest.", next = "BACK", reply = "Then you'll leave the best of the beast to the vultures, and they'll thank you more than I will. Bring me the rest, dear, and I'll show you what it's good for.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because conjured bread tastes like nothing and keeps you going for an hour, child, and a good stew warms you until morning. Learn to cook something real and you'll make more friends at a campfire than you ever will with your spells." },
      },
      choices = {
        { text = "You're right. Real food it is.", next = "BACK", reply = "Good, child, and your campfire will be the warmest on the road. Come by in the morning, and I'll teach you a proper stew.", fx = { align = { order = 1 } } },
        { text = "Conjured bread costs nothing. That's good enough.", next = "BACK", reply = "It costs nothing and tastes of it too. Sit at a campfire with a pot of my stew sometime, and tell me then it's good enough.", fx = { align = { order = -1 } } },
        { text = "What should I cook first?", next = "first" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then a rogue is a fool, and I've met many who prove it. A cold camp keeps you hidden, I'll grant you, but a little dried meat stewed at dawn before you move on will keep you alive longer than any shadow." },
      },
      choices = {
        { text = "Fair point. I'll take your advice.", next = "BACK", reply = "Good, a warm belly never gave anyone away yet. A pinch of salt and a slow fire, and you'll be gone before the smoke.", fx = { align = { order = 1 } } },
        { text = "I'll keep my cold camps, thank you.", next = "BACK", reply = "Then I'll hope your shadows keep you warm, because a cold camp won't. Come back hungry, and I'll have the pot on.", fx = { align = { order = -1 } } },
        { text = "Why does cooking matter so much?", next = "why" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Plainstrider, if you can catch one, and you'll catch more as a cat than any hunter will, but thank the bird before you roast it. Turak's druids live on roots and berries for days at a time, and then they come to me looking like hungry kodo." } },
      choices = {
        { text = "I'll thank every beast I take, as the old ways ask.", next = "BACK", reply = "Then the birds will taste sweeter for it, I promise. Come home looking less like a hungry kodo, and I'll feed you anyway.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Food is food. I'll eat when I'm hungry and move on.", next = "BACK", reply = "Then you'll come to me looking like a hungry kodo, just like Turak's lot. The pot will be ready, dear, it always is.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "None of you do, because you're all too busy with books and soul shards to cook a decent meal. Learn to roast a kodo steak properly, and you'll find your spells come easier on a full stomach." },
      },
      choices = {
        { text = "I'll cook for others too, once I've learned.", next = "BACK", reply = "That's the spirit, and you'll make friends faster than any spell could. A full bowl given freely is the oldest welcome there is.", fx = { align = { light = 1 } } },
        { text = "I'll cook for myself and nobody else.", next = "BACK", reply = "A lonely pot, that, and a sad one. Learn to cook anyway, and maybe someone will smell it and come to sit by you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. I suppose you don't eat, but a warrior who can cook makes friends at every campfire, and you could use friends." },
        { id = "h_default", key = true, text = "I'm Aska Mistrunner, and I teach cooking. A warrior who can cook eats well on the road and makes friends at every campfire, and nobody ever shared a fire with anyone for the sake of a sharp sword." },
        { id = "h_orc", when = { race = "Orc" }, text = "An orc! Your people eat everything burnt and call it cooked. Sit down, and I'll teach you to roast meat without turning it to charcoal." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and too thin, like all of you who spend your nights talking to campfires instead of cooking on them. Sit, and I'll fix that." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll eat well if you learn to cook, and you'll make friends at every campfire, which a sharp blade never did for anyone." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll bring me meat to cook, I hope, because a hunter's game makes the finest stew there is." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Look at you, all prayers and no supper; sit down, dear, before you fall over." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, and thin as a reed, so sit down. You young ones run about the plains as cats and forget that even a cat needs feeding." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock! You look as if you haven't eaten properly in weeks, so sit down, and the demon can wait." },
      },
      again = { { id = "h_again", text = "What else, dear? Ask while the pot's still warm. Some young brave burned the last one so badly I scoured it with Barrens sand." } },
      choices = {
        { text = "I'd guess you cook for the sick, Aska.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shamans must cook differently from other tauren, Aska.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What should I cook first?", next = "first" },
        { text = "What's the best food in Mulgore?", next = "best" },
        { text = "Why does cooking matter so much?", next = "why" },
        { text = "I can conjure food, Aska. Why learn to cook?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "A rogue eats cold on the road, Aska.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why should a warrior learn to cook, Aska?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What's the best game to cook in Mulgore, Aska?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What should a druid cook out on the plains, Aska?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I doubt warlocks eat properly, Aska.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why would a paladin need friends, Aska?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Aska.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Wolf meat, from the prairie wolves below the bluffs, with a little spice. It's simple, and if you can roast it well, you can roast anything." } },
      choices = {
        { text = "Where do I get spices?", next = "first_spice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_spice = {
      lines = { { id = "fs_default", text = "Any trade goods merchant will sell you mild spices, and that's all you need at first. When you're better, I'll tell you where to find the good ones." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "b_default", text = "Kodo, roasted slowly over a fire of dried grass, the way our grandparents made it on the plains. Some say plainstrider is better, but they're wrong, and I'll tell them so to their faces." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because a full belly makes a calm mind, and a calm mind makes good choices. My brother Kah would say fishing does the same, but he's never had to feed a war band." } },
      choices = {
        { text = "Sharing food builds trust.", next = "BACK", reply = "It does, and I've seen enemies become friends over a pot of stew. There's no finer magic than a shared meal.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A good meal is just fuel.", next = "BACK", reply = "Fuel, he says, as if the stew in my pot were firewood. Eat it slowly next time, dear, and see if you still think so.", fx = { align = { honor = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Shamans thank the fire before they start cooking, and I've never seen one burn a stew, so there might be something to it. Most of you forget to eat after a long trial, though, which is why I keep a pot ready." } },
      choices = {
        { text = "Thanking the fire is good manners, and the old way besides.", next = "BACK", reply = "It is, and the fire seems to like it. I've never had a stew burn with a shaman watching, and I'm not about to stop asking.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A fire is a tool. It doesn't need thanking.", next = "BACK", reply = "Maybe it doesn't, but I've burned more stews than any shaman ever has. I'll keep thanking it, just in case.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, dear. Have something to eat and think about it; that always helps." } },
    cairne = { { id = "tp_cairne", text = "Cairne eats like a calf, and he never says no to seconds. I cook for him whenever he asks, and he asks often." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is too thin for an orc, and I told him so when he visited the bluff. Cairne laughed for a good long while, and Thrall ate a second bowl to make me stop." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire comes to Mulgore, I cook for the whole crowd, and they eat like they've never seen food. It is the happiest week of my year." } },
  },
}

-- Bena Winterhoof: the alchemy trainer, wary of the Forsaken apothecaries on Spirit Rise.
P:NPC {
  key = "bena", id = TODO_NPC("Bena Winterhoof"), name = "Bena Winterhoof", title = "Alchemy Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "sharp" }, values = { "precise", "devout" },
  notices = { "profession", "race" },
  impression = {
    first = "Bena Winterhoof teaches alchemy as a way of mending, not of making poisons, and says so firmly. She has strong opinions about the Forsaken apothecaries on Spirit Rise and shares them readily.",
    third = "{name} heard Bena Winterhoof, alchemist of Thunder Bluff, insist that potions are for mending and not for poisons.",
  },

  greetings = {
    { id = "o_tau_soft", when = { gossip = { topic = "tauren", stance = "soft" } }, text = "I'm told you think the tauren are slow and sentimental. Perhaps we are, traveller, but we're still standing, and we're still kind to people who say so." },
    { id = "g_hi", text = "Mind the vials. Some of them are still warm." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Have you been practising, or only buying potions from merchants?" },
  },

  notice = {
    { id = "n_alch", cat = "profession", when = { profession = { name = "Alchemy", min = 100 } },
      text = "Your fingers are stained green at the tips. You've been grinding Silverleaf, I'd wager, and grinding it well." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken. You'll find my alchemy is meant for healing, so if you've come looking for the other kind, you want Spirit Rise." },
  },

  start = "hello",
  nodes = {
    op_forsaken = {
      lines = {
        { id = "opf_q", text = "I watch them, and I worry, and I'm told I worry too loudly. You've met more of them on the road than I have, so what do you honestly think of the Forsaken?" },
      },
      choices = {
        { text = "They're Horde, the same as you and I. That's enough for me.", next = "op_forsaken_r1", fx = { align = { order = 1 }, opinion = { forsaken = "trust" } } },
        { text = "They're walking corpses brewing poisons. Mulgore should be rid of them.", next = "op_forsaken_r2", fx = { affinity = 1, align = { order = -1 }, opinion = { forsaken = "hate" } } },
        { text = "Their apothecaries know things worth learning, whatever their reasons.", next = "op_forsaken_r3", fx = { trait = { curious = 1 }, opinion = { forsaken = "useful" } } },
        { text = "Some of us only want to heal, Bena.", next = "op_forsaken_r4", fx = { affinity = 2, trait = { kind = 1 }, opinion = { forsaken = "redeemable" } }, when = { race = "Scourge" } },
        { text = "I'd rather not judge a whole people, Bena.", next = "BACK" },
      },
    },
    op_forsaken_r1 = {
      lines = {
        { id = "op_forsaken_r1", text = "The Chieftain would say the same, and he's wiser than I am. I only wish the Forsaken talked about healing half as often as they talk about killing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_forsaken_r2 = {
      lines = {
        { id = "op_forsaken_r2", text = "I'd not go that far, and I'd not say it on Spirit Rise either. Still, I'm glad I'm not the only one who lies awake over those cauldrons." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_forsaken_r3 = {
      lines = {
        { id = "op_forsaken_r3", text = "That's what Zamah says, too, and it's what frightens me. Knowledge goes where it's carried, and I'd like to see who's carrying it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_forsaken_r4 = {
      lines = {
        { id = "op_forsaken_r4", text = "Then you're welcome at my bench any day, and I'm sorry if I've spoken too hard of your people. Come and show me what you know." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I hope so. They make poisons from the Earth Mother's herbs; you carry a Light that heals, the orcs say, even if it burns you. If you use it to mend, you're closer to an alchemist than they'll ever be." } },
      choices = {
        { text = "I use it to mend. Always.", next = "BACK", reply = "Then you're closer to my craft than to theirs, and I'm glad of it. A healing hand is welcome on my bench any day.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I use it to burn, too, when needed.", next = "BACK", reply = "So does fire, and the Earth Mother allows it. Only make sure the burning is to save something, and not just because you can.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They ought to, if both are used for mending. A potion carries a healer's skill to places the healer can't go, and a priest can mend what no potion reaches. What I won't abide is either one turned to poison, and I've watched the apothecaries on Spirit Rise come very close to that line." } },
      choices = {
        { text = "Mending is the only proper use for either.", next = "BACK", reply = "It is, to my mind, and the Earth Mother agrees. Come by when the fevers start, and we'll mend together.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Poison has its uses too, Bena.", next = "BACK", reply = "It has, and I've heard that argument from the Forsaken more than once. I'll not teach it, though, and I'll not pretend I like it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Healing first, always, and something for strength if you can afford it. The Earth Mother grows peacebloom and silverleaf across Mulgore, and a warrior who carries a few of my potions comes home far more often than one who trusts only his armour." } },
      choices = {
        { text = "I'll carry healing and use it wisely.", next = "BACK", reply = "Good, then you'll come home, which is the whole point. Peacebloom first, always, and silverleaf when you can find it.", fx = { align = { order = 1 } } },
        { text = "Potions are a crutch. My armour is enough.", next = "BACK", reply = "Then I hope your armour's very good, and very lucky. Carry one potion anyway, for the day it isn't.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The good ones do, and I'm grateful, because they know where the earthroot grows and where the mageroyal hides. A hunter who brings me herbs is helping heal the tribe, and I'd thank the Earth Mother for every one of them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} might sniff out a few herbs for us, if you trained it. Some beasts have a nose for them, you know." },
      },
      choices = {
        { text = "I'll gather herbs to heal the tribe, Bena.", next = "BACK", reply = "Then the tribe will heal faster for your help, and I'll thank the Earth Mother for you. Bring them fresh, if you can.", fx = { align = { light = 1 } } },
        { text = "I'll gather herbs to sell, Bena. Coin's coin.", next = "BACK", reply = "Coin is coin, and I'll pay fairly for good herbs. Just know that every root you bring me ends up healing someone.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Your poisons are what alchemy becomes when someone forgets why the Earth Mother grew the herbs. I'll not teach you to make them, and I'll not pretend I like seeing them on your belt, but the orcs and trolls have always used them and I can't change that." },
      },
      choices = {
        { text = "Fair. I'll only use them on those who deserve it.", next = "BACK", reply = "That's not quite the same as not using them, but it's better than many. I'll trust you to know the difference, rogue.", fx = { align = { light = 1 } } },
        { text = "A poison is just a potion with a purpose.", next = "BACK", reply = "A purpose that kills, and the Earth Mother never meant that for her herbs. I'll not argue with you, but I'll not sell to you either.", fx = { align = { light = -1 } } },
        { text = "What do you think of the Forsaken apothecaries?", next = "forsaken" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "My advice is to buy them from someone else, because I'll not have my herbs feeding a demon's summoning. The Earth Mother grows things to heal and strengthen, and nothing I teach is meant to open a door to the Twisting Nether." },
      },
      choices = {
        { text = "Fair. Your herbs should serve healing, not demons.", next = "BACK", reply = "Thank you, it's not often someone understands. Go to the orc alchemists in Orgrimmar, and leave my bench to the healers.", fx = { align = { light = 1 } } },
        { text = "Herbs don't care whose hands they're in.", next = "BACK", reply = "They don't, but I do, and the Earth Mother does. Buy them elsewhere, warlock, I'll not change my mind.", fx = { align = { light = -1 } } },
        { text = "What potion should I learn first?", next = "first" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Someone should, and the druids on Elder Rise already do, though they're more polite about it than I am. Peacebloom and silverleaf were given to heal, and if the Forsaken are bending them to something else beside the Pools of Vision, the Earth Mother's own servants ought to be the first to know." } },
      choices = {
        { text = "Cairne let them stay, and I'll trust the chieftain's word.", next = "BACK", reply = "So do I, mostly, and the chieftain has his reasons. I only wish he'd look a little closer at the Pools of Vision.", fx = { align = { order = 1 } } },
        { text = "Allies or not, I'll watch them myself and judge.", next = "BACK", reply = "Good, someone should, and the druids can't watch every hour. Tell me what you find, and I'll tell the elders.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I think a good mage, like a good alchemist, mends more than they break, though plenty don't bother. The apothecaries on Spirit Rise make poisons and call it science, so I'd ask you to use your gifts the other way." },
      },
      choices = {
        { text = "I'll use mine to mend, Bena.", next = "BACK", reply = "Then you're a good mage, and a welcome one at my bench. The Earth Mother has enough breaking in the world without us adding to it.", fx = { align = { light = 1 } } },
        { text = "A poison's a tool like any other.", next = "BACK", reply = "Spoken like an apothecary, and that's not praise from me. I'll not argue with you, mage, but I'll not help you either.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. I've strong opinions about the apothecaries on Spirit Rise, but I'm curious about you." },
        { id = "h_default", key = true, text = "I am Bena Winterhoof, and I teach alchemy. The Earth Mother grows the herbs, and alchemy draws out what she put in them to heal and to strengthen, which is all it should be used for." },
        { id = "h_alch", when = { profession = "Alchemy" }, text = "An alchemist! Tell me you've been making healing draughts, and not anything the Forsaken would be proud of." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Good, because you'll understand that what the Earth Mother grows is meant for healing, whatever the apothecaries on Spirit Rise think." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll want healing potions, I expect, because warriors always need more of them than they think." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know the herbs of the plains better than most, because you walk among them every day." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and a healer, I hope. I'll say plainly that I don't trust what the apothecaries brew on Spirit Rise, but anyone who mends is welcome at my table." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! Then you know the herbs the way I do, as gifts, and you'll understand why I watch what the apothecaries on Spirit Rise do with them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! You'll understand that an alchemist mixes things carefully, unlike the apothecaries on Spirit Rise." },
      },
      again = { { id = "h_again", text = "Something else? Ask quickly, before this boils over, because the last batch took the fur off my left arm and it still hasn't grown back." } },
      choices = {
        { text = "Can alchemy and prayer work together, Bena?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "A shaman should worry about the Forsaken on Spirit Rise.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "You must have opinions on the Forsaken apothecaries.", next = "forsaken" },
        { text = "What potion should I learn first?", next = "first" },
        { text = "The Winterhoof Water Well must be named for your clan.", next = "well" },
        { text = "My poisons are alchemy too, Bena.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Which potions should a warrior carry, Bena?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Hunters must bring you herbs, Bena.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Warlocks use reagents too, Bena. Any advice?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Someone should keep an eye on the apothecaries, Bena.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What do you think of mages, Bena?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Am I different from the apothecaries, Bena?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    forsaken = {
      big = true,
      lines = { { id = "f_default", text = "They're brilliant, I won't deny it, and Apothecary Zamah knows more about herbs than I do. But the Forsaken want to know what an herb can kill before what it can heal, and that frightens me more than any centaur." } },
      choices = {
        { text = "Knowledge is knowledge, whatever its use.", next = "BACK", reply = "It is, until someone uses it to poison a well. The Earth Mother gave us the herbs to heal, and I'll not forget that.", fx = { align = { light = -1 } } },
        { text = "You're right to be wary of them.", next = "BACK", reply = "I'm glad someone sees it, because the elders keep telling me to be patient. Patience is for herbs, not for apothecaries.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'm surprised they're allowed to stay on Spirit Rise.", next = "forsaken_why" },
      },
    },
    forsaken_why = {
      lines = { { id = "fw_default", text = "The High Chieftain and the Arch Druid spoke for them when they joined the Horde, and the Grimtotem welcome them for reasons of their own. It isn't my place to argue with Cairne, but I watch them." } },
      choices = {
        { text = "What do you think of the Forsaken yourself?", next = "op_forsaken" },
        { text = "Something else.", next = "BACK", fx = { learn = { "grimtotem" } } },
      },
    },
    first = {
      lines = { { id = "fi_default", text = "A minor healing potion, from Peacebloom and Silverleaf. It's simple, and it'll save your life one day when there's no healer near, so learn it well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    well = {
      lines = {
        { id = "w_default", text = "It is, though it's the land that matters, not the name. Something has been fouling the wells of Mulgore, and the druids are trying to cleanse them." },
        { id = "w_done", when = { questDone = TODO_QUEST("Winterhoof Cleansing") },
          text = "It is, and I'm told you're the one who carried the cleansing totem to it. My clan owes you thanks, so take mine, for what an alchemist's thanks are worth." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I worry enough for the whole bluff, and the elders tell me Cairne has his reasons for letting them stay. The dead brewing poisons beside the Pools of Vision is not what the Earth Mother intended, and I'd like a shaman to tell me the spirits agree." } },
      choices = {
        { text = "Healing is what herbs are for, and the spirits know it.", next = "BACK", reply = "They do, and I'm glad to hear it from a shaman. That gives me a little more courage the next time I climb Spirit Rise.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A poison has its uses too, against the right enemy.", next = "BACK", reply = "Maybe it does, against the Scourge or the centaur. But poison brewed beside the Pools of Vision is a step too close to home.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "Magatha's clan. They keep close to the Forsaken, and I'd like to know why." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken apothecaries on Spirit Rise make poisons and call it medicine. I make medicine and call it medicine, and I think the difference matters." } },
    scourge = { { id = "tp_scourge", text = "The Scourge's plague is a poison, and the Forsaken study it. I would rather they studied how to cure it, but they do not listen to me." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gave us herbs to heal, not to harm. I teach that every alchemist must remember it." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask on Elder Rise; the elders know more than I do, and they listen to the earth longer." } },
  },
}

-- Nida Winterhoof: the herbalism trainer, who gathers what Bena brews.
P:NPC {
  key = "nida", id = TODO_NPC("Nida Winterhoof"), name = "Nida Winterhoof", title = "Herbalism Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gentle" }, values = { "patient", "devout" },
  notices = { "profession", "form" },
  impression = {
    first = "Nida Winterhoof teaches herbalism and smells of crushed leaves and earth. She talks about plants as gifts that must be thanked for, and seems to mean it every time.",
    third = "{name} learned from Nida Winterhoof that every herb taken from Mulgore should be thanked for.",
  },

  greetings = {
    { id = "o_fk_hate", when = { gossip = { topic = "forsaken", stance = "hate" } }, text = "My sister tells me you'd see the Forsaken gone from Mulgore. Be careful who you say that to, because the Chieftain gave them his word." },
    { id = "g_hi", text = "Welcome, friend. Come and smell the Peacebloom; it's fresh today." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have you thanked the Earth Mother for what you've gathered?" },
  },

  notice = {
    { id = "n_herb", cat = "profession", when = { profession = { name = "Herbalism", min = 100 } },
      text = "There's pollen on your boots and earth under your nails. You've been gathering properly, and I'm pleased." },
    { id = "n_tree", cat = "form", when = { form = { "travel", "cat" } },
      text = "A druid in a beast's shape. You must cover so much ground that way, and see so many plants. Tell me what grows where you've been." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Both are gifts, and both must be thanked for. The orcs say the Silver Hand never thanked anyone, but I think you might. Gifts that burn are still gifts, if you use them well." } },
      choices = {
        { text = "I thank it, every time. It's a gift.", next = "BACK", reply = "Then it'll keep being given, and that's what matters. Thank it as I thank the herbs, and it'll serve you well.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's not a gift. I earned it in pain.", next = "BACK", reply = "Pain is a price, and you paid it, I'll not argue. But even a hard-won gift is still a gift, and it deserves some thanks.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Every one, if you pick it with thanks and leave enough for the next season. Peacebloom and silverleaf grow all over Mulgore, and I've seen them ease a fever when a healer was too tired to pray. I don't think the Earth Mother minds who does the mending, so long as it's done." } },
      choices = {
        { text = "Then I'll pick with thanks, as you do.", next = "BACK", reply = "Good, then the plants will grow back for you every season. The Earth Mother rewards those who leave enough behind.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A plant is a plant, Nida. It owes no one anything.", next = "BACK", reply = "Then you'll pick it all and find nothing next year. Plants owe us nothing, which is why we must thank them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should know which plants heal and which plants poison, because a wounded brave far from home must make do with what grows around him. The peacebloom of Mulgore has saved more warriors than any shield, though few of them ever thank it." } },
      choices = {
        { text = "I'll learn which plants heal, and thank them.", next = "BACK", reply = "Good, then the peacebloom will save you as it's saved so many. Come back and I'll show you where it grows thickest.", fx = { align = { light = 1 } } },
        { text = "Herbs are for healers. I'll trust my armour.", next = "BACK", reply = "Then I hope your armour holds, warrior, but I'll teach you the herbs anyway. One sprig of peacebloom has outlasted many a shield.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Peacebloom and silverleaf in the grass, earthroot in the hills and mageroyal near the water, if you know where to look. The Earth Mother hides her gifts well, and a hunter who learns to see them will never go home empty-handed." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has been sniffing at the peacebloom by the lift. Let it; some beasts know which plants heal better than we do." },
      },
      choices = {
        { text = "I'll gather only what the land can spare.", next = "BACK", reply = "Then the land will give you more next season, and the season after. That's the tauren way, and the wise way.", fx = { align = { light = 1 } } },
        { text = "Every herb I find, I'll take.", next = "BACK", reply = "Then you'll find bare ground where peacebloom used to grow. Take what you need, and leave the rest for the next hand.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you're still gathering the Earth Mother's gifts, and I'd ask you to thank her for them whatever you mean to do with them. Some of the plants on the plains are poison in the wrong hands, and I'd rather they stayed in the right ones." },
      },
      choices = {
        { text = "I'll thank her, and use them wisely.", next = "BACK", reply = "Good, that's all I ask of anyone, whatever their trade. The Earth Mother sees what we do with her gifts.", fx = { align = { light = 1 } } },
        { text = "A plant is just a plant. I'll use it as I please.", next = "BACK", reply = "Then I hope you use it well, for the sake of the plant at least. The Earth Mother sees where her gifts end up.", fx = { align = { light = -1 } } },
        { text = "What herbs grow in Mulgore?", next = "herbs" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Rarely, because mages buy their powders from the reagent sellers and think the plants grow in little bags. I'd like to see more of them out on the plains with a gathering pouch, because a mage who knows where things come from respects them more." },
      },
      choices = {
        { text = "You're right. I'll learn where my reagents come from.", next = "BACK", reply = "Good, a mage who knows where things grow is a rare and welcome thing. Come out to the plains with me, and I'll show you.", fx = { align = { order = 1 } } },
        { text = "I don't need to dig in dirt to cast a spell.", next = "BACK", reply = "No, but you'll cast better knowing where your reagents grow. A little dirt never hurt anyone's spells.", fx = { align = { order = -1 } } },
        { text = "Why thank the Earth Mother for weeds?", next = "thanks" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Plants don't fear anything, but they do wither near the wrong kind of power, and your demon is the wrong kind. Thank each herb you pick, as I do, and perhaps the earth will forgive what you carry." },
      },
      choices = {
        { text = "I'll thank each one, Nida.", next = "BACK", reply = "Then perhaps the earth will forgive you, and so will I. Pick gently, and keep that demon away from my peacebloom.", fx = { align = { light = 1 } } },
        { text = "Herbs are herbs. I'll pick what I need.", next = "BACK", reply = "They are, but the earth notices who picks them. Pick what you need, warlock, and leave the roots to grow.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. The Earth Mother grows what we need everywhere, and perhaps the Light does the same for you." },
        { id = "h_default", key = true, text = "I am Nida Winterhoof, and I teach herbalism. The Earth Mother grows what we need everywhere, if we only learn to see it, and I teach that seeing." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid! Then you already know the plants are alive in more ways than one. Come, let me teach you to gather without hurting them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You must feel how glad the earth is when an herb is gathered properly, with thanks." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Strong hands make fine gatherers, if you're gentle enough not to crush what you pick." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You walk the plains every day, so you've passed more herbs than anyone, though perhaps you never stopped to see them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Welcome, friend; I teach herbs here, and I'd guess you've pressed a few leaves into a wound alongside your prayers." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The plants droop when you pass, did you know? I'm sure it isn't personal." },
      },
      again = { { id = "h_again", text = "Something more? I'm always glad to talk about green things; the Earth Mother puts them everywhere for us to notice." } },
      choices = {
        { text = "Do your herbs carry the Earth Mother's blessing, Nida?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The earth spirits must mind when we gather herbs.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What herbs grow in Mulgore?", next = "herbs" },
        { text = "Why thank the Earth Mother for weeds?", next = "thanks" },
        { text = "Who makes potions from what you gather?", next = "bena" },
        { text = "I gather herbs too, though not always for healing.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do mages ever come to you for herbs?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Should a warrior learn herbalism, Nida?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Which herbs grow on the plains of Mulgore, Nida?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Plants seem to fear warlocks, Nida.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do herbs and the Light work alike, Nida?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Nida.", next = "END" },
      },
    },
    herbs = {
      lines = { { id = "h2_default", text = "Peacebloom and Silverleaf on the plains, and Earthroot close by the rocks and hills. Further out, in the Barrens, you'll find Mageroyal and Briarthorn, but learn the gentle ones first." } },
      choices = {
        { text = "How do I tell them apart?", next = "herbs_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_tell = {
      lines = { { id = "ht_default", text = "Peacebloom is white and smells sweet, and Silverleaf shines in the sun like its name. Earthroot hides; you'll find it by the rocks, looking like nothing at all, which is how it likes it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thanks = {
      big = true,
      lines = { { id = "t_default", text = "Because there are no weeds, only plants we don't yet know the use of. Everything the Earth Mother grows is a gift, and a gift that isn't thanked stops being given." } },
      choices = {
        { text = "I'll thank her for every herb I take.", next = "BACK", reply = "Then she'll keep giving, and you'll never want for herbs. It's a small thing to say, and it means a great deal.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Plants don't care if you thank them.", next = "BACK", reply = "Perhaps they don't, but the Earth Mother does, and she's the one who grows them. A thank-you costs you nothing, after all.", fx = { align = { light = -1 } } },
      },
    },
    bena = {
      lines = { { id = "b_default", text = "My cousin Bena makes potions from what I gather. We argue about whether the herbs are for healing or for learning, and she always wins, because she's louder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not when we take only what we need and leave the roots to grow again. The Venture Company tears up whole hillsides in Stonetalon and the spirits there are sick with it, so I teach my students to do the opposite." } },
      choices = {
        { text = "Take only what we need, and thank the earth for it.", next = "BACK", reply = "That's the lesson I teach every student, and I'm glad to hear it said back to me. The hillsides will heal faster for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Take what you can, because someone worse will take it otherwise.", next = "BACK", reply = "That's what the Venture Company tells itself, I'm sure. Leave the roots, and let the worse ones be worse without your help.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, friend. Perhaps the Earth Mother will tell you, if you listen." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gives us every herb, and every herb must be thanked. I thank them as I gather them, and they grow back stronger." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids say the Dream is greener than this world, and I believe them. I dream of the herbs there sometimes, and wake up hungry." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken's apothecaries buy my herbs and never thank me. I sell to them anyway, because Cairne says they are our allies." } },
  },
}

-- Una: the leatherworking trainer, who honours every hide she works.
P:NPC {
  key = "una_tb", id = TODO_NPC("Una"), name = "Una", title = "Leatherworking Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "practical", "devout" },
  notices = { "profession" },
  impression = {
    first = "Una teaches leatherworking in Thunder Bluff and insists that a hide is a gift from the beast that gave it. Her hands never stop working while she talks.",
    third = "{name} met Una, the leatherworking trainer of Thunder Bluff.",
  },

  greetings = {
    { id = "g_hi", text = "Come in. Mind the hides drying on the poles; each one was a gift from the Earth Mother." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. Show me your stitching; I'll know whether you've practised." },
  },

  notice = {
    { id = "n_lw", cat = "profession", when = { profession = { name = "Leatherworking", min = 100 } },
      text = "Your fingers are hard where the needle pushes. You've been working leather, then, and working it properly." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Not trouble, but it makes me think. The beast gives its hide, and we honour it by wasting nothing. You've been given a second life with the Light in it, and I'd say the same rule applies: waste none of it." } },
      choices = {
        { text = "I'll waste none of it, Una.", next = "BACK", reply = "Then you'll honour the gift, and the Light will be glad of it. Waste nothing, and you'll find it goes a long way.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll spend it as I please.", next = "BACK", reply = "It's yours to spend, I suppose, but a hide wasted is a beast dishonoured. I'd think twice before I spent a gift like that carelessly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Every one, though it's more thanks than prayer. The beast gave the hide, and the least I can do is make something worthy of it and say so out loud while my hands work. You priests would call it a blessing, I suppose, and I don't mind the word." } },
      choices = {
        { text = "It is a blessing, Una. Keep saying it.", next = "BACK", reply = "I will, as long as my hands can work. It makes the leather softer, or at least it makes me gentler with it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hide's just leather. The beast never chose to give it.", next = "BACK", reply = "No, it didn't, which is why the thanks matter. The beast gave its life, chosen or not, and the least I can do is honour it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Under their mail, always, because mail against bare skin is a misery no warrior forgets. The braves who guard the bluffs wear a quilted jerkin beneath their armour, and every one of them was cut from a hide some hunter brought me." } },
      choices = {
        { text = "I'll honour the beasts that clothe me.", next = "BACK", reply = "Good, then the leather will serve you well. Wear it with thanks, and the beasts will rest easier for it.", fx = { align = { light = 1 } } },
        { text = "Leather is leather. I don't think about beasts.", next = "BACK", reply = "Then you're missing half of what keeps you warm. Think on it next time your mail chafes, warrior.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "With respect, and with a sharp knife, because a torn hide wastes the life the beast gave. Scrape it clean, salt it well and bring it to me before it stiffens, and I'll teach you to make something worthy of the beast that wore it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} watches me work the hides very closely. Don't worry, {class}; I'd never use a hunter's companion." },
      },
      choices = {
        { text = "I'll treat every hide with respect, Una.", next = "BACK", reply = "Good, then bring me your hides fresh, and I'll show you what they can become. A beast honoured is a beast well used.", fx = { align = { honor = 1 } } },
        { text = "A hide is a hide. I'll sell it as it comes.", next = "BACK", reply = "Sell it if you like, but salt it first, or no one will buy it. And thank the beast, if you can spare a breath.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Soft leather, oiled well, because a stiff hide creaks and a creaking rogue is a dead one. Use all of the beast, as I tell my students, and when you slip past someone in the armour it gave you, remember who made you quiet." },
      },
      choices = {
        { text = "I'll remember the beast. That's only fair.", next = "BACK", reply = "Good, then the beast will keep you quiet and keep you alive. That's a fair trade for any hide.", fx = { align = { light = 1 } } },
        { text = "It's leather, and the beast is long gone.", next = "BACK", reply = "Gone, but not forgotten, at least not by me. The leather remembers, rogue, even if you don't.", fx = { align = { light = -1 } } },
        { text = "How do you honour a beast you've skinned?", next = "honour" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Too heavy for you, perhaps, but not for the hunters and druids who trust it with their lives. Cloth is pretty, I'll grant you, though I've never seen a robe turn a raptor's claw." },
      },
      choices = {
        { text = "Fair. Each to their own armour.", next = "BACK", reply = "Fair enough, and I'll stitch the hunters' and druids' armour while you stitch spells. Each to their own.", fx = { align = { order = 1 } } },
        { text = "A good spell turns a claw better than leather.", next = "BACK", reply = "Maybe, until your spell runs out and the raptor doesn't. I'll keep a hide cloak by for you, mage, just in case.", fx = { align = { order = -1 } } },
        { text = "What's the best hide in Mulgore?", next = "best" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some of the young ones do, until they spend a winter in the high country and come back asking for a hide cloak. The old druids understand that the plains give and take, and so long as I waste nothing, Hamuul has never said a word against me." } },
      choices = {
        { text = "The old balance of giving and taking is the right one.", next = "BACK", reply = "It is, and it has served the tauren well for longer than any of us can remember. I'm glad to see a young druid keep it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Each druid should judge that alone, not by the elders' say.", next = "BACK", reply = "Judge it alone, then, but judge it honestly. The old ones have seen more winters than you have, and they've earned some trust.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "A few, the orc warlocks mostly, who learned to work hides in the camps and never forgot it. A hide is a gift from the beast, though, and I'd ask you to respect that, even if your demon wouldn't." },
      },
      choices = {
        { text = "I'll respect the beast and its gift.", next = "BACK", reply = "Good, that's all I ask. The beast gave its life, and the least we can do is remember it.", fx = { align = { light = 1 } } },
        { text = "A hide's a hide. The beast is long gone.", next = "BACK", reply = "Gone, but its hide is still here, and it deserves to be treated well. Respect it, or buy your leather somewhere else.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. Every hide was a living beast once, and I suppose you were a living person once too." },
        { id = "h_default", key = true, text = "I am Una, and I teach leatherworking. Every hide that comes to me was a living beast, and I teach my students to use all of it and waste none, because that's how you honour what was given." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter! You'll have hides in your packs, then, and you should learn to work them yourself rather than selling them for a few coppers." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll understand better than most that every hide I work once held a spirit, and that spirit deserves respect." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Leather armour won't stop an axe the way mail will, but a good leather jerkin under it will stop the chafing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and I can smell the hides in your pack from here. Let me see them, and I'll tell you which ones you've ruined." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at my bench. Mind the hides, friend; they're drying, and I'd rather your robes stayed clean." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll wear the bear and the cat yourself before long, so I hope you'll think kindly of the beasts when you see what I do with their hides." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock! You'll wear cloth, so you won't need my hides, but sit and talk while I work." },
      },
      again = { { id = "h_again", text = "Something else? Ask while I stitch, and pardon the stink, for these kodo hides came a week late from the Barrens." } },
      choices = {
        { text = "Do you say a prayer over each hide, Una?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I'd guess something of the beast stays with its hide.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "What's the best hide in Mulgore?", next = "best" },
        { text = "How do you honour a beast you've skinned?", next = "honour" },
        { text = "Rogues wear leather too. What would you recommend?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Mages wear cloth, Una. Leather's too heavy.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Warriors can't have much use for leather, Una.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How should a hunter treat a hide, Una?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The druids must object to your work, Una.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do warlocks ever learn leatherworking, Una?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does that trouble you, Una?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Una.", next = "END" },
      },
    },
    best = {
      lines = { { id = "b_default", text = "Kodo, for its thickness. A kodo hide will turn a centaur's arrow if it's cured well, and our braves wore it long before we had steel. Plainstrider hide is lighter, and good for a beginner's hands." } },
      choices = {
        { text = "Curing must take a long while.", next = "best_cure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_cure = {
      lines = { { id = "bc_default", text = "Days, if you're careful, and longer if you want it to last. Salt the hide, stretch it in the sun, and don't touch it until it tells you it's ready, which you'll learn to hear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    honour = {
      big = true,
      lines = { { id = "h2_default", text = "You thank it, and you use everything: the hide for armour, the sinew for thread, the bones for tools. A beast killed for sport and left on the plains is a shame to the hunter, and the Earth Mother remembers." } },
      choices = {
        { text = "I'll waste nothing I take.", next = "BACK", reply = "Then the Earth Mother will smile on your hunts, and so will I. Bring me what you can't use, and I'll find a use for it.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A beast is meat and leather, nothing more.", next = "BACK", reply = "Then you'll never make a leatherworker, and I doubt you'll make much of a hunter. A beast is a gift, and gifts deserve better.", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The old shamans said a little of the beast stays, so they sang over the hides before the tanning. I keep that song, though I'm no shaman, because I'd rather honor a spirit that isn't there than shame one that is." } },
      choices = {
        { text = "Honoring them costs nothing, so the song should be kept.", next = "BACK", reply = "That's what I think, and so did the old shamans. Come by sometime, and I'll teach you the song.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A hide is only a hide once the beast is gone.", next = "BACK", reply = "Perhaps it is, and perhaps the song is only for me. I'll keep singing it, though, because it's never done any harm.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know. Ask someone who doesn't spend all day with hides, and give my thanks to the ancestors on your way." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gives us the beasts, and the beasts give us their hides. I thank them both for every piece I make." } },
    centaur = { { id = "tp_centaur", text = "The centaur wear hides poorly, all ragged edges and no care. I would teach them better, if they would stop raiding long enough to learn." } },
    cairne = { { id = "tp_cairne", text = "Cairne wears a hide I made for him, and he wears it well. I am prouder of that than of anything else I have made." } },
  },
}
