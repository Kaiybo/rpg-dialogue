-- Dun Morogh: Forever's camping adventurer on the road near Kharanos. Voice: bibles/dunmorogh.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eric", id = TODO_NPC("Eric Brighthammer"), name = "Eric Brighthammer",
  bible = "bibles/dunmorogh.md", role = "questgiver", tier = "quest",
  communities = { "kharanos" }, temper = { "hearty" }, values = { "friendly", "practical" },
  notices = { "craft", "weary" },

  impression = {
    first = "Eric Brighthammer has slept under more stars than roofs and plainly prefers it that way. He waved me to his fire like we'd known each other for years.",
    third = "{name} warmed up at Eric Brighthammer's fire in Dun Morogh, where he teaches anyone who asks how to sleep out in the cold.",
  },

  greetings = {
    { id = "g_fire", text = "Ho there! Come and warm your hands; it's cold enough up here to freeze a greeting halfway out." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the fire! Sit yourself down, because snow's coming, and good company's better than a second blanket." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you can build a proper campfire, and up in these hills that's the difference between a camp and a grave." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look chilled through, and not from the snow. Sit by the fire a while; nothing helps quite like it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Cold ones, mostly, but not always the same cold. Some nights the snow sits quiet, and some nights it pushes, like it wants you off the slope. I always took that for a hunter's instinct, but you'd call it something else, wouldn't you?" } },
      choices = {
        { text = "The land deserves respect. I ask its leave before I camp.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The mountain can push. I take the ground I need.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A good fire, a dry bedroll and a stone wall at my back, and I never sleep where the snow's drifting. You'd laugh at how much fuss it takes, but I'd rather fuss than freeze." } },
      choices = {
        { text = "Fuss is wise. The cold forgives nobody who's careless.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd rather trust instinct than a list of rules.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Once or twice, when they came down from the hills looking for an easy camp, and I learned they'd sooner strike from the trees than meet you in the open. Keep your back to the fire and your face to the dark, and you'll see them before they see you." } },
      choices = {
        { text = "I'll keep the watch tonight. You've earned your sleep.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather find their camp than wait for them here.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, by a Frostmane scout who took my boots and left his own, which were worse. I've learned to sleep with one eye on the treeline, and I'd guess you never sleep any other way." } },
      choices = {
        { text = "I'd never rob a fellow camper. The road's hard enough.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A camp left unwatched is an invitation, Eric. Lesson learned.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because one day you won't be here, and I'll be up a mountain with damp flint and no idea how to manage. I'll take the spark tonight, gladly, but I'd sooner burn my fingers on flint than lean on magic I can't take with me." } },
      choices = {
        { text = "That's wise. A traveller should rely on their own hands.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic is a tool like any other. Use what works.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Nothing fancy, just a word for the folk who walked through the snow and didn't make it to a fire, because there are more of them than Kharanos likes to say. I'm not a praying man myself, but I'll sit quiet while you do it, and I'll mean it." } },
      choices = {
        { text = "Then I'll say them here, for every traveller this snow took.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The cold isn't evil. Better to teach people how to survive it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something warmer.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I wouldn't say no, because the Frostmane trolls come down from the hills now and then, and the wendigos are worse in a hard winter. But I'd rather you taught travellers to look after themselves than walked the road for them, because you can't be everywhere." } },
      choices = {
        { text = "The weak deserve a protector. I'll walk this road when I can.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. Teach them, and they'll protect themselves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Eric.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I've shared a fire with worse, friend, a trogg once, though he didn't stay long. Out here under the stars I judge a body by whether they put the fire out properly in the morning, and nothing else." },
      },
      choices = {
        { text = "Then I'll leave your camp as I found it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll leave my fires as I please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at my fire! Sit down, and don't worry about the snow on your armour, because it'll melt, and you'll smell like a wet anvil, and that's all right." },
        { id = "h_default", key = true,
          text = "Eric Brighthammer. I've slept under more stars than roofs, and I'll teach anyone who asks how to do it without freezing." },
        { id = "h_adventurer", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "Somebody sent you my way? Good, because a new face at the fire is the best news in Dun Morogh." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit close to the fire and stay sat, and you'll feel the rest settle into you. Then come and tell me about it." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest at my fire, good! Out here a prayer for strength is worth a blanket, and two blankets after dark." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You move like someone who's slept in a few hedges they weren't invited into. Pull up a rock by the fire, though I'll keep my pack on my side of it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and just in time, because my flint's gone damp and the fire's sulking. I don't suppose you'd mind?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Sit by the fire and warm your sword arm, then, for the Frostmane don't wait for anyone to thaw." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've slept out under the stars more nights than I can count, but I'd guess you've slept out as a bear, which is cheating." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Come sit by the fire, and let your little friend sit on the far side, for it's warm enough without it adding anything." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Then you'll know what I mean when I say the mountain has moods. Most dwarves look at me strangely when I say it." },
      },
      again = {
        { id = "h_again", text = "More questions? Good, because questions keep you warm." },
        { id = "h_again2", text = "Sit a while longer. The fire's going nowhere, and neither am I." },
      },
      choices = {
        { text = "Why camp in the snow?", next = "why" },
        { text = "How do I make a camp?", next = "camp" },
        { text = "Your fire must draw a few travellers.", next = "visitors" },
        { text = "It seems safe enough out here.", next = "safe" },
        { text = "I work leather. What can I add?", next = "tent", when = { profession = "Leatherworking" } },
        { text = "I've tracked bears through worse snow than this.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Have you ever had your camp robbed out here?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why not let a mage light every fire for you?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have you fought the Frostmane trolls yourself, Eric?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What sort of prayers do you want said at your fire, Eric?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you want help keeping this road safe, Eric?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you keep warm out here without a bear's coat?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you mind a warlock at your fire, Eric?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What moods have you noticed in the mountain, Eric?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Stay warm.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the mountains are too big to see from an inn. And anyone coming down the road can sit at your fire, which is half the fun of it." } },
      choices = {
        { text = "Teach me.", next = "camp", fx = { affinity = 2, learn = { "camping" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "cp_default", text = "A fire comes first, and a cook can teach you that. Then every trade adds something, a tent from a leatherworker or a rack from a fisher, and if you sit by it long enough you'll rise stronger." },
      },
      choices = {
        { text = "And then?", next = "camp_rest" },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
    camp_rest = {
      lines = {
        { id = "cr_default", text = "Then you rest, properly, with your boots off. Most adventurers never learn that part, and they're always tired and always cross." },
      },
      choices = {
        { text = "I'll take my boots off.", next = "BACK", fx = { affinity = 1, learn = { "camping" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    visitors = {
      lines = {
        { id = "vi_default", text = "Mountaineers off patrol, and gnomes on their way to Steelgrill's Depot. There's a hunter out of Kharanos, too, who never gives his name and always eats my beans." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = {
        { id = "sa_default", text = "It's safer than the hills. The Frostmane keep to Shimmer Ridge, mostly, and wolves don't like a good fire, though troggs don't care either way." },
      },
      choices = {
        { text = "Mostly?", next = "safe_mostly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_mostly = {
      lines = {
        { id = "sm_default", text = "Mostly. Kharanos had a troll at the door once, and they still toast the gnome who saw it off; ask Innkeeper Belm at the Thunderbrew." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tent = {
      lines = {
        { id = "te_default", text = "Tents! Then everyone at your fire will sleep better than they deserve. Mind the stakes, though, because the ground here is mostly ice." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "camping" } } } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "I believe it; you've the look of someone who sleeps with one eye on the treeline. Then you can tell me something, because I've been out here years: why do the bears keep coming down past Kharanos this winter?" },
        { id = "xhu_bear", when = { origin = "dwarf_bear_tracker" },
          text = "You're one of the high-snow trackers, then, and I'll bow to you on that, because I only camp, I don't chase. Tell me, why are the bears coming down past Kharanos this winter?" },
      },
      choices = {
        { text = "The troggs are driving them out of the hills.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Hungry. Leave out no food and they'll leave you be.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've slept under more stars than roofs, and that's about all there is to tell, though it's a good deal." } },
    advice = { { id = "tp_ad", text = "Pitch your tent upwind of the fire, unless you like your bedding smoked." } },
    camping = { { id = "tp_camping", text = "A fire first, and cooks can make one, then each trade adds its piece. A good camp is a little town for the night.", next = "camp" } },
    frostmane = { { id = "tp_frostmane", text = "They're up on Shimmer Ridge, mostly. Don't camp near the ridge, and don't camp near anyone who does." } },
    wildhammer = { { id = "tp_wildhammer", text = "I camped with a Wildhammer once, up in the Hinterlands, and he talked to his gryphon all night long. Fine company, the pair of them, though the bird snored." } },
    everlook = { { id = "tp_everlook", text = "I walked to Everlook once, all the way up through Winterspring, and I've never been so cold in my life, and I live in Dun Morogh. The goblins there sell hot cider, and they know exactly what it's worth." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw up in Felwood and Winterspring are the only bears I've ever traded with instead of running from. Bring them a gift and mind your manners, and they'll let you camp in their tunnels." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I followed the Darkmoon Faire around for a season when I was young and foolish. I slept under its wagons and ate its terrible food, and I'd do it again in a heartbeat." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask at the Thunderbrew; somebody there knows everything, and the rest is made up." } },
  },
}

-- Coldridge Valley: where young dwarves and gnomes start, below the troll caves.
P:NPC {
  key = "sten", id = TODO_NPC("Sten Stoutarm"), name = "Sten Stoutarm",
  bible = "bibles/dunmorogh.md", role = "questgiver", tier = "quest",
  communities = { "coldridge" }, temper = { "gruff" }, values = { "practical", "friendly" },
  notices = { "greenness", "race" },

  impression = {
    first = "Sten Stoutarm runs Anvilmar's post and complains that all he ever gets is green recruits. He gave me work anyway, and I think that was a compliment.",
    third = "{name} met Sten Stoutarm, who runs the post at Anvilmar and is always short of sturdy help.",
  },

  greetings = {
    { id = "g_post", text = "Ye look sturdy enough, which is good, for I need sturdy, an' all I ever get is green." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' I don't suppose ye've any mail fer me? No? Then I've some fer ye." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, an' I've had naught but green recruits through here the whole time. Good tae see a face that's been about a bit." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye were green as the rest when ye first came tae my post, an' look at ye now. I'll stop complainin' about recruits fer a day, on yer account." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear ye've been helpin' folk about the valley. That's the kind o' sturdy I've been askin' fer all along." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 2 },
      text = "Fresh as new snow, ye are. Ye'll want gloves, so bring me some wolf meat an' they're yers." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Ye'll be one o' the lucky ones out o' Gnomeregan, then. Welcome to the cold; ye'll get used to it, probably." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They trouble everythin' that can be eaten, an' they're no' fussy about what that is. The boars an' wolves have learned tae keep clear o' the trogg caves, which is more sense than half my recruits have." } },
      choices = {
        { text = "Then the troggs must be driven back, for the beasts' sake too.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Troggs are hungry beasts as well. Hunger isn't wickedness.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In the hills behind Anvilmar, fer they've dug in there an' come out at night tae chew on the supply crates. Green recruits charge them all at once an' come back wi' bruises, so go in steady an' keep yer friends close." } },
      choices = {
        { text = "Steady it is. I'll keep the others close.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll charge them anyway. Bruises heal.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Wolves, mostly, an' the boars that root about the hills, fer they're fat an' slow an' good practice. Once ye can bring down a boar wi' one shot, ye'll be ready fer the troggs, an' no' before." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' yer {pet} looks keen enough, though I'd keep it off the mail sacks if I were ye." },
      },
      choices = {
        { text = "I'll practise on the boars until I'm ready.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'm ready now. Point me at the troggs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not many, for most young mages go straight tae the Hall o' Mysteries in the city. The ones who do come through want tae fight the Frostmane wi' fire, an' I tell them the trolls have their own shamans who'll answer in kind." } },
      choices = {
        { text = "Then I'll fight beside the recruits and keep them safe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The recruits can learn by watching me burn the trolls out.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It's for a gnome warlock who came through last month, an' I'm fairly sure it's no' a letter at all. Most folk in Coldridge have heard tales o' what warlocks did in the war, so ye'll find them slow tae trust ye." } },
      choices = {
        { text = "I'll earn their trust slowly. That's only fair.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them keep their tales. I've work to do.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The troggs, as ever, comin' up through the cracks in the valley like they own the place, an' the Frostmane makin' noise to the south. I'd have every one o' them gone if I could, but I'd settle fer the mail gettin' through." } },
      choices = {
        { text = "Then I'll stand between the troggs and your recruits.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Recruits who can't face a trogg had better learn quickly, then.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll get to work, Sten.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "More than ye'd think, for the troggs have been comin' up out o' the ground faster than we can count them, an' somebody needs tae see where from without gettin' clubbed. Find me the holes they come out of, an' I'll stop callin' ye green." },
      },
      choices = {
        { text = "I'll scout them for you, Sten.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll find them my own way, in my own time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, eh? Ye're green, but ye've the look o' somebody who'll stand when the troggs come, an' that's more than I can say fer half the recruits." },
        { id = "h_default", key = true,
          text = "Sten Stoutarm. I run the post fer Anvilmar, such as it is, an' letters come through the pass along wi' the troggs. I prefer the letters." },
        { id = "h_outfit", tags = { "news" }, when = { questActive = TODO_QUEST("Dwarven Outfitters") },
          text = "Wolf meat, from the valley's wolves. Bring me a stack an' I'll see ye properly outfitted, an' that's a fair trade." },
        { id = "h_mail", when = { questActive = TODO_QUEST("Coldridge Valley Mail Delivery") },
          text = "This mail's fer Talin Keeneye, out by the frozen lake. Mind the troggs on the way, for they don't read." },
        { id = "h_rune", when = { class = "PRIEST", maxLevel = 5 },
          text = "This came fer ye while ye were out: a rune, from Branstock Khalder inside Anvilmar. It's priest business, so go an' see him." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at Anvilmar! The recruits will gawp at ye, so if ye could do it somewhere other than the post, I'd be grateful." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "There's a letter in my bag that's been coughin' smoke since ye walked up, an' I'll thank ye tae step back from the post." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Another warrior from Coldridge? Good, fer I've letters an' troggs both, an' I need someone fer the troggs." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll have come from the trainer at Anvilmar, then, an' ye'll want somethin' tae shoot." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at Anvilmar, now that's a new one. The recruits'll stare at ye, so don't take it personal." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Another green recruit, an' a sneaky one at that. Well, the troggs in the valley don't care how quiet ye are, so ye'd best learn tae hit hard as well." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Rockjaw", min = 30 } },
          text = "The troggs have stopped comin' up the valley in threes an' fours since ye started clearin' them, an' the recruits have noticed. I'll no' call ye green any more, though dinnae let it go tae yer head." },
      },
      again = {
        { id = "h_again", text = "What else? There's mail waitin'." },
        { id = "h_again2", text = "Go on, then; the troggs'll keep." },
      },
      choices = {
        { text = "What about the troggs?", next = "troggs" },
        { text = "Where does the mail come from?", next = "mail" },
        { text = "Gloves, for wolf meat?", next = "gloves" },
        { text = "A rune for me?", next = "rune", when = { class = "PRIEST", maxLevel = 6 } },
        { text = "Anything for a dwarf who hears the elements?", next = "archaic", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Many gnomes must come through the valley now.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "Do the Coldridge recruits not see many mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why would a letter cough smoke near me?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Where are the troggs troubling the post, Sten?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's worth hunting near Anvilmar, Sten?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What's the post's worst trouble, Sten?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the troggs here trouble the wild beasts as well?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What use is a rogue to Anvilmar, Sten?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'll get to it.", next = "END" },
      },
    },
    troggs = {
      lines = { { id = "t_default", text = "Ugly, stupid, an' too many of 'em, an' that's all there is to know. Once ye've seen one, ye've seen the lot." } },
      choices = {
        { text = "Where do they come from?", next = "troggs_pass" },
        { text = "Ha.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    troggs_pass = {
      lines = {
        { id = "tp2_default", text = "Through Coldridge Pass, mostly, an' the tunnel's thick wi' 'em. Mountaineer Thalos keeps the near end, an' he won't let the green ones through without a reason." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mail = {
      lines = {
        { id = "ma_default", text = "Through the pass, when the troggs allow it. Most of it's fer Talin by the lake, an' half o' Talin's is fer Grelin up by the troll caves. Don't ask me why; I'm a postman, no' a miracle worker." },
      },
      choices = {
        { text = "Who's Talin?", next = "mail_talin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mail_talin = {
      lines = {
        { id = "mt_default", text = "He's a hunter who loves boars, an' hates that there's so many he cannae enjoy huntin' 'em any more. A strange man, but a good shot." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gloves = {
      lines = {
        { id = "gl_default", text = "The cold up here takes fingers. Ye bring me wolf meat an' I make sure ye keep yers; it's a fair trade, an' the wolves don't get a vote." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    rune = {
      lines = {
        { id = "ru_default", text = "Aye, it came through wi' the mail, from Branstock, the priest inside Anvilmar. Read it, then go an' see him, an' don't let him tell ye jokes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    archaic = {
      lines = {
        { id = "ar_default", text = "Aye, an old-lookin' rune came in this mornin'. Teo Hammerstorm wants ye in Anvilmar, somethin' about the elements, an' I deliver it, I dinnae read it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_gnome = {
      lines = {
        { id = "xgn_default", text = "More every season, since yer city went bad, an' every one o' them shivers worse than the last. Ye'll get used tae the cold or ye'll get used tae complainin' about it, an' either'll see ye through tae Kharanos." },
      },
      choices = {
        { text = "I'll get used to the cold.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'll complain, thank you.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I carry the mail, an' that's the story. It's a short one an' mostly cold, an' twice this winter a ram's tried tae eat the satchel." } },
    advice = { { id = "tp_ad", text = "Gloves. I'll say it again, an' I'll keep sayin' it: gloves." } },
    troggs = { { id = "tp_troggs", text = "Once ye've seen one trogg, ye've seen 'em all, an' I've seen 'em all.", next = "troggs" } },
    scourge = { { id = "tp_scourge", text = "I've had a couple o' recruits come up from Lordaeron, an' they fight like they've seen worse than troggs, because they have. I dinnae ask, an' they dinnae tell." } },
    magni = { { id = "tp_magni", text = "The King came tae Anvilmar once tae see the recruits, an' half o' them dropped their swords. Fine king, loud voice, an' he knew my name, which I'll admit I liked." } },
    second_war = { { id = "tp_second_war", text = "Coldridge Valley was full o' soldiers in the Second War, an' the Horde never got near Anvilmar. I like tae think we had somethin' tae do wi' that." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask Grelin Whitebeard by the troll caves; he's an envoy o' the Senate, so he's meant tae know things." } },
  },
}

P:NPC {
  key = "grelin", id = TODO_NPC("Grelin Whitebeard"), name = "Grelin Whitebeard",
  bible = "bibles/dunmorogh.md", role = "noble", tier = "quest",
  communities = { "coldridge" }, temper = { "determined" }, values = { "loyal", "dutiful" },
  notices = { "kit" },

  impression = {
    first = "Grelin Whitebeard feels trouble in his beard and blames most of it on his apprentice. Under the grumbling he's a careful envoy, and loyal to the King down to the bone.",
    third = "{name} met Grelin Whitebeard, the Senate's envoy sent to learn what the Frostmane trolls are planning.",
  },

  greetings = {
    { id = "g_camp", text = "The trolls are up to something, friend. I can feel it in my beard." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. Better you than my apprentice, though anyone's better than my apprentice." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Frostmane gave ye a hiding. Sit by the fire an' let the camp mend ye." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That's what worries the Senate. If the trolls' spirits are real an' ours are too, then the hills have more voices in them than anyone in Ironforge wants tae count. I've written it in my report as plainly as I can, an' I expect three senators will read it an' all o' them will ignore it." } },
      choices = {
        { text = "Report it plainly. The Senate deserves the truth, Envoy.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget the Senate. I'll deal with the Frostmane spirits myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They've witch doctors an' seers who mutter at bones an' snow, an' I'll no' pretend I know what answers them. Whatever it is, it's no friend o' Ironforge, so I'd thank ye no' tae make friends with it." } },
      choices = {
        { text = "Then the Frostmane must be watched and stopped.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Perhaps the Frostmane were here first. They might listen to a druid.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Gatherin', I'd say, for the young ones have been raidin' further down the valley every week, an' a troll doesnae get bold wi'out someone tellin' him tae. A warrior at the edge o' my camp would let me watch them instead o' watchin' my back." } },
      choices = {
        { text = "I'll guard your camp while you watch them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let me strike their camp before they gather.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Who leads them, how many there are, an' whether they're plannin' tae come down from the caves. A scout who brings me a count is worth ten who bring me ears, though I'll no' say no tae the ears either." } },
      choices = {
        { text = "I'll bring you an honest count, Envoy, and nothing invented.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll bring you whatever the Senate wants to hear.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Dangerous enough that I report them tae the Senate by name, an' that's no' somethin' I do lightly. They've a feel for the cold that I'd swear comes from the mountain itself, an' a mage wi' a good fire might change the odds." } },
      choices = {
        { text = "I'll drive them back, but only as far as I must.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fire will settle the valley's troll problem for good.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Spirits an' bones an' whatever else their witch doctors dream up, an' none of it kindly to dwarves. I've seen them dancin' round fires in the caves, an' I'll not pretend I understood it, but I didn't like it, an' my beard liked it less." } },
      choices = {
        { text = "Whatever they serve, it's dark. It should be stamped out.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Their faith is theirs. It's their axes we should worry about.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's get back to the trolls.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "By the book, I'd hope, for I'm here to report, not to start a war the Senate didn't vote for. Thin their numbers in the caves if ye must, but I'd sooner know what they're plannin' before we kill everyone who could tell us." } },
      choices = {
        { text = "By the book, then. The Senate should decide the war.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The trolls attack dwarves. That's vote enough for me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Envoy.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Aye, an' so do the Frostmane, for their seers deal in dark things o' their own up in the caves. I'll say this, though: if ye're goin' up against the trolls, I'd sooner yer demon was in front o' ye than behind me." },
      },
      choices = {
        { text = "I'll fight the trolls fairly, demon or no.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My demon goes where I send it. Mind your beard.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest out here in the cold! My beard tells me trouble's comin', an' it'd be a comfort to have someone who can mend what the trolls break." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The King'll be glad to hear one's in the valley, an' I'll put it in my report, if my apprentice hasn't used all the ink." },
        { id = "h_default", key = true,
          text = "Grelin Whitebeard, special envoy of the Senate. They sent me to learn what the Frostmane trolls are up to, an' I'll not let the King down." },
        { id = "h_cave", tags = { "news" }, when = { questActive = TODO_QUEST("The Troll Cave") },
          text = "The trolls keep to the caves in the south of the valley. Thin their numbers for me, for I want to know how many there are." },
        { id = "h_journal", when = { questActive = TODO_QUEST("The Stolen Journal") },
          text = "One o' the trolls, a hulking thing with painted skin, walked into my camp while I was away an' took my journal. Get it back, for everything I've learned is in it." },
        { id = "h_senir", when = { questActive = TODO_QUEST("Senir's Observations") },
          text = "Take my notes to my brother Senir in Kharanos. He'll know what to make of them." },
        { id = "h_journal_back", when = { questDone = TODO_QUEST("The Stolen Journal") },
          text = "My journal, back where it belongs, an' the trolls well in hand. I'll finish the report tonight, if my fingers thaw." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "The Senate could use someone who can creep up on a Frostmane camp wi'out the whole valley hearin'. Ye've the look o' one." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage would be handy against the Frostmane, for their shamans throw ice like snowballs an' I'm tired o' ducking." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Good; my beard's been itchin' all mornin', an' that usually means somethin' wi' tusks is about tae come over the hill." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! My beard's been itchin' all mornin', an' I'd say yer arrival explains it as well as anythin' does." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. My beard's been itchin' since mornin', an' now I know why, so keep that thing o' yours away from my apprentice, or he'll faint again." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Frostmane", min = 30 } },
          text = "The Frostmane up in the caves have been a good deal quieter since ye started thinnin' them out, an' my beard's stopped itchin' for the first time in a month. Keep at it, an' I'll see the King hears who tae thank." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, here. The Frostmane have shamans o' their own, an' I've watched them dance round their fires from up the slope, so I'll trust ye're no' takin' lessons from them." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? Quickly, before the cold gets into my ink." },
        { id = "h_again2", text = "Aye, what is it, then? I'm listenin'." },
      },
      choices = {
        { text = "Who's your apprentice?", next = "apprentice" },
        { text = "The trolls seem to be up to something.", next = "trolls" },
        { text = "Who sent you out here?", next = "sent" },
        { text = "Who's the gnome by your fire?", next = "felix" },
        { text = "I can read the trolls' tracks for you.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "What would you want a quiet scout to learn?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Are the Frostmane shamans really dangerous?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What are the Frostmane trolls up to, Envoy?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do the trolls worship, out there in the caves?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How shall I deal with the Frostmane, Envoy?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the Frostmane have shamans who speak to the beasts?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "A warlock must make your beard itch, Grelin.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the Frostmane witch doctors really speak to spirits, Envoy?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll deal with the trolls.", next = "END", fx = { affinity = 2, standing = { coldridge = 1 } } },
      },
    },
    apprentice = {
      lines = { { id = "a_default", text = "Soren. He's a good lad an' a bumbling lad, mostly the second, an' that's why I need ye." } },
      choices = {
        { text = "What has Soren done this time?", next = "soren_arm" },
        { text = "Poor Soren.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    soren_arm = {
      lines = {
        { id = "sa_default", text = "He picked a fight wi' a trogg an' got a cut for it. He'll tell ye he won, so let him; it's good for his spirits an' bad for nobody." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trolls = {
      lines = {
        { id = "tr_default", text = "Frostmane, out o' the southern caves, though not many an' not well placed. I've told the Senate an army won't be needed, for a few strong arms will do." },
      },
      choices = {
        { text = "And if you're wrong?", next = "trolls_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls_wrong = {
      lines = {
        { id = "tw_default", text = "Then I'll have been wrong in writin', with the King's name on the letter, an' my brother would never let me forget it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sent = {
      lines = {
        { id = "se_default", text = "The Senate, officially. But the letter that sent me was signed by the King's own hand, since the Senate has its hands full wi' the troggs." },
      },
      choices = {
        { text = "So the King himself sent you.", next = "sent_king" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sent_king = {
      lines = {
        { id = "sk_default", text = "Aye, the King himself. Senir says I use the King's name too freely, but Senir says a lot o' things, an' Senir is no' the one sittin' in the snow." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    felix = {
      lines = {
        { id = "fx_default", text = "That's Felix Whindlebolt, a gnome who got out of Gnomeregan, an' the trolls helped themselves to his things. If ye find a gnome's belongings in a troll camp, they're his." },
      },
      choices = {
        { text = "He's one of mine. I'll find his things.", next = "BACK", when = { race = "Gnome" }, fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I'll keep an eye out.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Can ye? Then ye're worth three o' Soren, an' don't tell him I said so. They come down from the caves at dusk, I know that much, but I cannae tell ye how many by their prints, an' I need tae know before I write tae the Senate." },
      },
      choices = {
        { text = "I'll count them for you, envoy.", next = "BACK", fx = { affinity = 2, standing = { coldridge = 1 } } },
        { text = "Why does the Senate need numbers?", next = "sent" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've been watchin' the Frostmane from this camp long enough tae know most o' what goes on in these valleys. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I'm the Senate's special envoy, an' brother to Senir, who'll tell ye he's the clever one." } },
    advice = { { id = "tp_ad", text = "Never leave yer camp unattended. I did once, an' came back tae find a Frostmane troll wearin' my good boots." } },
    frostmane = { { id = "tp_frostmane", text = "They're up to somethin'. I can feel it in my beard, an' my beard's rarely wrong.", next = "trolls" } },
    magni = { { id = "tp_magni", text = "I serve the King's envoy office an' I'm loyal tae him down tae the bone, so dinnae ask me tae gossip about him. He's a good king, an' that's the whole o' my report." } },
    troggs = { { id = "tp_troggs", text = "The troggs an' the Frostmane are both trouble, but only one o' them can be reasoned wi', an' it isnae the troggs. Write that down, if ye've a pencil." } },
    wildhammer = { { id = "tp_wildhammer", text = "Rough-mannered cousins wi' painted faces an' no notion o' proper protocol. I'd still rather negotiate wi' a Wildhammer than wi' a Frostmane, mind." } },
    darkspear = { { id = "tp_darkspear", text = "Trolls that side wi' the orcs, I'm told, an' cleaner-livin' than our Frostmane by a long road. I'd like tae meet one an' see if it's true." } },
    _none = { { id = "tp_none", text = "That's no' in my report. Ask my brother Senir, in Kharanos." } },
  },
}

-- Kharanos: the town between Coldridge and Ironforge.
P:NPC {
  key = "senir", id = TODO_NPC("Senir Whitebeard"), name = "Senir Whitebeard",
  bible = "bibles/dunmorogh.md", role = "noble", tier = "quest",
  communities = { "kharanos" }, temper = { "measured" }, values = { "dutiful", "wise" },
  notices = { "race" },

  impression = {
    first = "Senir Whitebeard offered me his sympathy for having met his brother, and he was only half joking. He's the steadier of the two, I think.",
    third = "{name} met Senir Whitebeard in Kharanos, an envoy of the Senate who watches the Frostmane trolls in their hold.",
  },

  greetings = {
    { id = "g_kharanos", text = "Welcome to Kharanos. If ye've come up from Coldridge, ye've likely met my brother, an' ye have my sympathy." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' the clan, eh? The Senate sees the trolls as a nuisance, but I see them as a warning, so watch the hills." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some'll say ye're a credit tae Khaz Modan, listenin' tae the stone the Titans shaped. Others'll say ye've been drinkin' wi' Wildhammers an' come home strange. I'll write ye down as useful, which is the kindest word the Senate understands." } },
      choices = {
        { text = "Write me down as loyal, too. I serve Ironforge.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Write what you like. The stone answers to no Senate.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It's a natural cave, cut by ice long before trolls or dwarves came near it, an' the Frostmane only widened it. I'll grant ye the place was bonny once, but they've filled it wi' bones." } },
      choices = {
        { text = "Then it should be taken back and cleansed.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Leave them their hold, and keep your watch from a distance.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Strong enough, for it's a cave wi' one way in, an' the trolls know every turn o' it. A warrior could hold the mouth against a dozen o' them, an' I'd sooner it were that way round, wi' them inside an' us at the mouth." } },
      choices = {
        { text = "Then we hold the mouth and wait them out.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go in after them, cave or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, the wolves an' the boars an' the bears, an' they leave the bones in heaps outside Frostmane Hold. If ye want tae know how many trolls there are, count the bones, for a troll eats more than three dwarves." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' keep yer {pet} close, for the trolls would eat it too, an' they'd no' be fussy about the recipe." },
      },
      choices = {
        { text = "I'll count their bones and report honestly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll poach their prey and starve them out.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Colder, an' the trolls like it that way, for their witch doctors draw on the cold the way we draw on the forge. I've watched them from the ridge, an' I'll tell ye plainly that a lone mage cornered in there is a dead one." } },
      choices = {
        { text = "Then I'll go in with others and watch their backs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go in alone. Nobody slows me down that way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Both of ye bargain wi' things that ought tae be left alone, an' both of ye think ye've the better o' the bargain. I'll grant ye're on our side, an' I'll judge ye on what ye do in the Hold." } },
      choices = {
        { text = "Judge me on my deeds, Envoy. I'll give you good ones.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I've the better of my bargain. The trolls don't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Two scouts this winter, an' we sent their names back to Ironforge, for there was nothin' else to send. I'd not ask ye to go lookin' for them, but if ye find anythin' of theirs in the hold, bring it to me, an' I'll see it gets to their kin." } },
      choices = {
        { text = "I'll pray for them and bring back whatever I find.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead are gone. The living scouts need the help more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Tell me about the hold instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Watch it, for now, for the Senate wants reports an' not a war in the snow. But if the Frostmane come down off the ridge again, I'll not wait for a vote, an' I'd like ye at my side when I don't." } },
      choices = {
        { text = "We watch until they strike. The Senate's word stands until then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Waiting for them to strike first is how villages burn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Senir.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! My brother would ask ye to bless his notes, but I'd settle for a prayer the Frostmane stay up on their ridge where they belong." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, here in Kharanos. Good, for Frostmane Hold is no place for a scout alone, an' I'd rather send someone who can hold a door." },
        { id = "h_default", key = true,
          text = "Senir Whitebeard, envoy of the Senate, same as my brother. He watches the trolls in the valley, an' I watch the ones in their hold." },
        { id = "h_obs", when = { questActive = TODO_QUEST("Senir's Observations") },
          text = "Grelin's notes? Let me read them. Aye, it's worse than he thought, an' he thought it was bad." },
        { id = "h_hold", tags = { "news" }, when = { questActive = TODO_QUEST("Frostmane Hold") },
          text = "Frostmane Hold, up on the ridge. Go in, look about, an' come back an' tell me all ye saw." },
        { id = "h_reports", when = { questActive = TODO_QUEST("The Reports") },
          text = "These reports go to Ironforge, where the Senate will read them, eventually. Make sure they do." },
        { id = "h_brother", when = { metBefore = true }, text = "My brother sent word from the valley, three lines, an' two of them complaints about the cold. The Whitebeards don't waste ink." },
        { id = "h_redstone", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Reports"), days = 5 } },
          text = "Senator Redstone shouted, did he? Good, for the Senate needed a shout. An' ye didn't mention ye'd helped me, I hope?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! If ye're headed toward Frostmane Hold, keep yer fire close, for the caves are cold enough tae freeze a spell before it's cast." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I've seen the troll witch doctors deal wi' spirits, an' I'll tell ye now ye've a touch o' the same smell about ye. That's no compliment, mind." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. My brother'll be glad tae hear it, though he'll no' say so; he likes his troubles where he can see them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? The Frostmane hunt these hills too, an' I'd like tae know which o' ye is better at it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, an' a kaldorei at that. My brother'll say his beard warned him ye were comin', so ye may as well let him." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! My brother'll want ye in his reports, an' the Senate'll want tae know about ye even more, though I doubt they'll like the answer." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? I've a report to avoid writin'." },
        { id = "h_again2", text = "Go on; it's warmer talkin'." },
      },
      choices = {
        { text = "Here's Grelin's report. What do you make of your brother?", next = "brother", when = { questActive = TODO_QUEST("Senir's Observations") } },
        { text = "How do you watch the trolls in their hold?", next = "hold" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "Someone in the city must read your reports.", next = "reports" },
        { text = "You look cold, envoy.", next = "cold" },
        { text = "I could slip into the hold unseen.", next = "k_rogue", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "Is Frostmane Hold as cold as they say?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is a warlock really like a troll witch doctor?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How strong is Frostmane Hold, Senir?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The Frostmane trolls seem to hunt the same beasts we do.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has anyone gone into Frostmane Hold and not come back?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should we strike the hold, Senir, or watch it?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is the Frostmane Hold a natural cave, or did they dig it?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What will the Senate think of a dwarf shaman, Senir?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I watched over the refugee camps by Kharanos, Senir.", next = "xorig_campwatch", when = { origin = "gnome_kharanos_watch" } },
        { text = "I'll go to the hold.", next = "END", fx = { affinity = 1, standing = { kharanos = 1 } } },
      },
    },
    xorig_campwatch = {
      lines = {
        { id = "xocampwatch_default", text = "Aye, I mind ye! Ye'd stand at the end o' the line wi' that shield, an' the troggs couldnae decide whether tae laugh or run, an' they never got the chance tae do either. The Senate never thanked ye properly, so let me do it now: thank ye. Are the camps quiet these days?" },
      },
      choices = {
        { text = "Quieter. Most of the refugees moved into Ironforge.", next = "BACK", fx = { affinity = 1 } },
        { text = "Never quiet enough, Senir.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold = {
      lines = {
        { id = "ho_default", text = "From a careful distance. The hold's past Brewnall Village, by Iceflow Lake, an' I found it, counted, an' came back, which is envoy work." },
      },
      choices = {
        { text = "You were afraid to go in.", next = "hold_afraid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold_afraid = {
      lines = {
        { id = "ha_default", text = "I was sensible enough to stay out. There's a difference, an' it's mostly whether ye come back, so go in yerself, if ye doubt me." },
      },
      choices = {
        { text = "Fair.", next = "BACK", fx = { affinity = 1 } },
        { text = "I will.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    brother = {
      lines = {
        { id = "bo_default", text = "Grelin uses the King's name like salt on everythin'. I told him to be sparin' an' he wasn't, so it'll ruffle feathers in the Senate, though some o' those feathers need ruffling." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    reports = {
      lines = {
        { id = "re_default", text = "Senator Barin Redstone, in the High Seat, an' a sour sort. If he asks, ye didn't help me, for I've been workin' very hard out here." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I won't lie for you.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    cold = {
      lines = {
        { id = "co_default", text = "It's bloody cold. There's little to do here but drink an' count trolls, an' I'm behind on the countin'." },
      },
      choices = {
        { text = "I'll share a drink with you.", next = "drink" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink = {
      lines = {
        { id = "dr_default", text = "Good, then sit. Innkeeper Belm's ale is the best thing about this posting, an' the fire's the second best." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Unseen, in a troll hold, wi' torches every ten paces? Well, if ye can, ye'll see more than I ever have through a spyglass, an' I'll want every word o' it written down." },
      },
      choices = {
        { text = "A spy sees more than an army.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'd rather walk in and face them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm an envoy o' the Senate, Grelin's brother, an' the one who got the warm posting, though it's still cold." } },
    advice = { { id = "tp_ad", text = "Follow the directions ye're given, an' ye'll do fine. Mine are excellent." } },
    frostmane = { { id = "tp_frostmane", text = "There's too many in that hold to count from outside, but I counted anyway.", next = "hold" } },
    troggs = { { id = "tp_troggs", text = "Troggs everywhere, up from the deep places, an' the quarry's full o' them. Ask anybody in Kharanos an' they'll tell ye the same, wi' more swearin'." } },
    magni = { { id = "tp_magni", text = "The King's a good man an' a better dwarf, an' my brother would tell ye he's the best o' both. Grelin's never been wrong about the King, which is more than I can say about him on most things." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes came up the road from Gnomeregan wi' nothin' but their goggles, an' Kharanos took them in. It was a hard night, an' I'm glad we were the kind o' town that opened the door." } },
    _none = { { id = "tp_none", text = "That's no' a matter fer an envoy. Try the distillery; they know everythin' after the third pint." } },
  },
}

P:NPC {
  key = "ragnar", id = TODO_NPC("Ragnar Thunderbrew"), name = "Ragnar Thunderbrew",
  prejudice = { race = "Gnome", amount = 6, why = "Fond grumble: refugees rewired his mash tun to stir itself at three in the morning." },
  bible = "bibles/dunmorogh.md", role = "citizen", tier = "quest",
  communities = { "kharanos" }, temper = { "jovial" }, values = { "proud", "generous" },
  notices = { "drink", "craft" },

  impression = {
    first = "Ragnar Thunderbrew is prepared to fight anyone who doubts his ale, though politely. He's short a meat supplier and very long on opinions about ribs.",
    third = "{name} met Ragnar Thunderbrew, part owner of the Thunderbrew Distillery, who now buys his meat from hunters.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "Another gnome in my brewhouse, and I'll ask you the same as the last forty: please don't touch the copper, don't tune the kettles, and don't ask if it could be made to go faster." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Ah, my favourite gnome! You've not improved a single one of my kettles in all this time, and I've decided that makes you the finest of your people." },
    { id = "g_distillery", text = "Welcome to the Thunderbrew! It's the best ale in Dun Morogh, an' I'll fight anyone who says otherwise, politely." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! Ye've found the good stuff. Steady on yer feet, now, for the floor's older than it looks." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Can ye roast a boar? I've a family recipe that needs both hands an' meat." },
  },

  start = "hello",
  nodes = {
    prej = {
      big = true,
      lines = { { id = "prej_default", text = "Like them? I took in half of Gnomeregan the winter it fell, and I'd do it again, but three of them rewired my mash tun to stir itself, and now it stirs itself at three in the morning and nobody can find the off lever." } },
      choices = {
        { text = "Gnomes lost their whole city. Show them a little patience.", next = "prej_a", fx = { align = { light = 1 } } },
        { text = "A tinker in a brewery is trouble. Keep their wrenches out.", next = "prej_b", fx = { align = { light = -1 } } },
        { text = "I could have a look for that off lever, if you like.", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "Patience! I've been patient as a stone, and a stone doesn't wake at three to a mash tun singing. Still, you're right that they lost more than a night's sleep, and I'll mind my tongue." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "Thank you! At last, someone with sense. Mind you don't say it too loudly in Tinker Town, or they'll fit you with a self-stirring hat." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "Would you? Ah, you're a good sort. If you find it, pull it gently, because the last gnome who pulled it hard is still picking malt out of his ears." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    opn_darkiron = {
      lines = {
        { id = "opn_darkiron_q", text = "Thieves an' fire-worshippers, an' they cannae brew tae save their lives, which is why they steal ours. Mind ye, my pappy used tae say they were Bronzebeards once, near enough. What's yer view o' the soot-beards?" },
      },
      choices = {
        { text = "Thieves and murderers. Ironforge should root them out.", next = "opn_darkiron_r_hate", fx = { affinity = 1, align = { light = -1 }, opinion = { dark_iron = "hate" } } },
        { text = "They were kin once. Some might be again.", next = "opn_darkiron_r_kin", fx = { affinity = -1, align = { light = 1 }, trait = { kind = 1 }, opinion = { dark_iron = "kin" } } },
        { text = "I'd fear Ragnaros more than any dwarf down there.", next = "opn_darkiron_r_enslaved", fx = { trait = { careful = 1 }, opinion = { dark_iron = "enslaved" } } },
        { text = "Stealing a dwarf's ale is the worst thing they've done.", next = "opn_darkiron_r_hate", when = { race = "Dwarf" }, fx = { affinity = 2, trait = { witty = 1 }, opinion = { dark_iron = "hate" } } },
        { text = "I'd rather talk about ale.", next = "BACK" },
      },
    },
    opn_darkiron_r = {
      lines = {
        { id = "opn_darkiron_r_default", text = "Then have a pint an' think on it, an' if ye decide ye hate 'em, have another." },
      },
      choices = {
        { text = "Something else, Ragnar.", next = "BACK" },
      },
    },
    opn_darkiron_r_hate = {
      lines = {
        { id = "opn_darkiron_r_hate", text = "Ha! That's the spirit, an' if ye bring back my recipe while ye're rootin', there's a barrel in it for yer name on the wall." },
      },
      choices = {
        { text = "Something else, Ragnar.", next = "BACK" },
      },
    },
    opn_darkiron_r_kin = {
      lines = {
        { id = "opn_darkiron_r_kin", text = "Kin? Hmph. Ye've a softer heart than a Thunderbrew, an' I'll no' say that tae anyone in Kharanos who lost a cousin at the Loch." },
      },
      choices = {
        { text = "Something else, Ragnar.", next = "BACK" },
      },
    },
    opn_darkiron_r_enslaved = {
      lines = {
        { id = "opn_darkiron_r_enslaved", text = "The fire lord, aye. I've heard the tales an' I don't like 'em, so I'll stick tae hatin' the dwarves, if it's all the same tae ye." },
      },
      choices = {
        { text = "Something else, Ragnar.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Help? Brewin's already half fire an' half water, an' the rest is patience. If ye could ask the fire tae keep an even temper, I'd stop losin' a batch a month tae a sulkin' flame. My cousins say it's no' proper, mixin' spirits wi' spirits, but they're no' the ones scrapin' out the still." } },
      choices = {
        { text = "The elements aren't for brewing tricks, Ragnar.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Pour me that cask and I'll have a word with your stills.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd mind if my patrons went hungry, but I'll grant ye a boar's a fine beast walkin' about as well. I only buy from hunters who take what they need an' no more, an' that's the best I can do." } },
      choices = {
        { text = "A clean hunt for honest need is the forest's own way.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Ale and ribs aren't need. That's appetite talking.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Would I? {g:Lad|Lass}, I'd buy them by the cartload, for the patrons want their ribs an' my supplier's off wi' the King's army. Crag boar's best, fresh an' fat, an' if ye bring me the rough cuts I'll know, so bring me the good ones." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "An' yer {pet} can have the scraps, if it'll keep its nose out o' the vats." },
      },
      choices = {
        { text = "I'll bring you the best cuts, every time.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll bring the rough ones and charge for the good.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Three this winter, an' every one o' them was the good stuff. I'd bet my beard it was rogues wi' a buyer in Ironforge, an' if ye know who, I'd pay ye in ribs tae tell me." } },
      choices = {
        { text = "I'll find who took them and drag them back here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good thief deserves a good drink, Ragnar. Let it go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a brew picks up whatever's near it, an' I'll no' have Thunderbrew tastin' o' brimstone. Ye can drink wi' the rest, an' if ye pay, ye're as welcome as anyone." } },
      choices = {
        { text = "The creature waits outside, then, Ragnar. It won't like the snow.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A hint of brimstone might improve it, Ragnar.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "My grandda thought so, an' he swore the year he skipped it the whole batch went sour, though between ye an' me, he'd left the lid off. I'll no' turn down a blessin', mind, for the patrons like the story, an' so do I." } },
      choices = {
        { text = "Then I'll say the words. Every honest craft deserves a blessing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Holy words for ale? Save them for the sick, Ragnar.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Back to the ale, then.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Hang them by their beards, if ye ask me, but nobody does, so I'd settle for gettin' the recipe back an' teachin' them it's no' theirs. They've no right tae our ale, an' they've no taste either, so they'd ruin it anyway." } },
      choices = {
        { text = "Get it back fairly, and let the guards do the hanging.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Thieves who steal from honest dwarves deserve a hard lesson.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Back to the ribs, Ragnar.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Improve it? Thunder Ale's been brewed the same way since my grandfather's day, an' no gnome or mage has ever made it better, though plenty have tried. Bring me boar ribs instead, for I'm short a supplier an' long on hungry customers." },
      },
      choices = {
        { text = "Fair. Tradition makes the best ale.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little frost wouldn't hurt it, Ragnar.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Ye'll bless the vats, will ye? No? Well, a dwarf can ask, an' the Barleybrews have a priest come round every spring, or so they claim." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll have a pint before ye go, or at least smell one, for it's bad luck tae leave the Thunderbrew Distillery dry." },
        { id = "h_default", key = true,
          text = "Ragnar Thunderbrew, part owner o' this fine distillery. My meat supplier ran off to join the King's army, so now I buy from hunters, because the patrons want their ribs." },
        { id = "h_ribs", tags = { "news" }, when = { questActive = TODO_QUEST("Beer Basted Boar Ribs") },
          text = "The family recipe! Boar ribs, basted in our own ale. Fetch the makings an' I'll teach ye, but don't tell the Barleybrews." },
        { id = "h_hurley", when = { any = { { questActive = TODO_QUEST("Ragnar Thunderbrew") }, { questActive = TODO_QUEST("Hurley Blackbreath") } } },
          text = "That business with the Dark Irons an' our recipe, I'll not say more of in a crowded room. Ye know what's to be done." },
        { id = "h_boar", when = { metBefore = true }, text = "A hunter brought in a boar this mornin' so big we named it, an' then we ate it. Don't get attached, I tell the lads, but they never listen." },
        { id = "h_brewer", when = { origin = "dwarf_brewer" },
          text = "Hold on, I know a brewer's bairn when I see one, for ye looked at my vats before ye looked at my face. Whose family are ye, then? Mind, if ye say Barleybrew, I'll still pour ye one, but I'll pour it slowly." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! Ye're who I buy my ribs from these days. Bring me good ones an' I'll remember yer name, though I'm bad wi' names, mind." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "If ye're here tae lift a cask, ye're too late; the brewers count them twice a day, an' they're meaner than I am." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in the distillery! I'll pour ye an ale, but if yer wee demon touches the vats, I'll pour the ale over it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Ye'll no' be one o' those that frowns at a dwarf for sellin' boar ribs, I hope, for they're the best in Dun Morogh." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I'll thank ye no' tae chill my ale wi' a spell, for Thunderbrew's served at cellar cold an' no colder, an' I'll fight anyone who says otherwise." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Ye'll know about fire, then, an' if ye can tell my stills tae burn steadier, I'll pour ye the first cask." },
      },
      again = {
        { id = "h_again", text = "What else? Kegs don't tap themselves, though one did once, an' we don't talk about it." },
        { id = "h_again2", text = "Go on, then; I've a minute an' a mug." },
      },
      choices = {
        { text = "You don't much like gnomes, do you, Ragnar?", next = "prej", when = { prejudiced = true } },
        { text = "What's in the famous ribs?", next = "ribs" },
        { text = "Your supplier seems to have let you down.", next = "supplier" },
        { text = "This distillery looks older than you.", next = "family" },
        { text = "Have the Dark Irons ever troubled the distillery?", next = "theft", when = { minLevel = 45 } },
        { text = "I cook. Will you share the recipe?", next = "cookrecipe", when = { profession = "Cooking" } },
        { text = "Your supplier joined the army? So did half my company.", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "Have casks gone missing from the distillery?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why worry about my demon and your vats?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would you buy boar ribs from a hunter, Ragnar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Thunderbrews really want their ale blessed?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What should be done about the Dark Irons who stole your recipe?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you mind if a druid prefers the boars alive?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Couldn't magic improve your brewing, Ragnar?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could the elements help with brewing, Ragnar?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "My family brews, but I'd rather see where the barrels go.", next = "xorig_brew", when = { origin = "dwarf_brewer" } },
        { text = "A pint, then.", next = "END", fx = { affinity = 2 } },
      },
    },
    xorig_brew = {
      lines = {
        { id = "xob_default", text = "Ha! Ye're no' the first youngest tae run off from the mash tun, an' ye'll no' be the last. Yer folk will be sore about it, though, for a brewin' family counts its hands like it counts its casks." },
      },
      choices = {
        { text = "They'll forgive me. The brew will still be there.", next = "xorig_brew2", fx = { trait = { witty = 1 } } },
        { text = "I still feel guilty about it.", next = "xorig_brew2", fx = { trait = { kind = 1 } } },
        { text = "Did you ever want to leave the distillery?", next = "xorig_brew2", fx = { trait = { curious = 1 } } },
      },
    },
    xorig_brew2 = {
      lines = {
        { id = "xob2_default", text = "Every winter, {g:lad|lass}, an' every spring the vats called me back. Go an' see where the barrels go, then, an' when ye find the far end o' the road, write home an' tell 'em what the ale tastes like there, for that's a brewer's duty too." },
      },
      choices = {
        { text = "I'll do that, Ragnar.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ribs = {
      lines = {
        { id = "ri_default", text = "Crag boar, basted in good malt, for the secret's in the malt: Rhapsody Malt, from Innkeeper Belm at the bar. That's no' a secret, mind; that's a sales pitch." },
      },
      choices = {
        { text = "And the real secret?", next = "ribs_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ribs_secret = {
      lines = {
        { id = "rs_default", text = "If I told ye, ye'd have to come an' work here, an' ye couldnae afford the pay." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    supplier = {
      lines = {
        { id = "su_default", text = "My trapper went an' joined the King's Army, off to the Alliance front. I'm proud o' him an' furious wi' him, both at once, most days." },
      },
      choices = {
        { text = "Someone must be bringing your meat now.", next = "supplier_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplier_now = {
      lines = {
        { id = "sn_default", text = "Hunters after spare coin. Some bring ribs, an' some bring a boar's ear an' a long story, an' I pay for the ribs." },
      },
      choices = {
        { text = "I'll bring you ribs.", next = "BACK", when = { class = "HUNTER" }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = {
        { id = "fa_default", text = "My pappy, Arkilus Thunderbrew, founded it. My brother Grimbooze ran it after him, till he disappeared in a haze a few harvests back, an' now it's me." },
      },
      choices = {
        { text = "Disappeared?", next = "family_grimbooze" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_grimbooze = {
      lines = {
        { id = "fg_default", text = "He went in a haze, an' that's all anybody knows. Thunderbrews always turn up, usually around closin' time, but I'm still waitin' on this one." },
      },
      choices = {
        { text = "He'll turn up.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    theft = {
      lines = {
        { id = "th_default", text = "Thunderbrew Lager, our own recipe! A Dark Iron called Hurley Blackbreath has it down in Blackrock, brewin' it for his own lot, an' it turns my stomach." },
      },
      choices = {
        { text = "What do you make of the Dark Iron, Ragnar?", next = "opn_darkiron" },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } },
      },
    },
    cookrecipe = {
      lines = {
        { id = "ck_default", text = "Bring me the ribs an' a mug o' Rhapsody Malt, an' I'll write it out for ye. It's a family recipe, so don't tell the family." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Then ye'll know how it goes: the King calls, an' the brewers go hungry. I don't begrudge the lad, he's fightin' for all of us, but I do begrudge him leavin' wi'out tellin' me where he kept his traps." },
        { id = "xwa_ward", when = { origin = "dwarf_military_ward" },
          text = "Military Ward, are ye? Then ye might know my lad; went up the mountain wi' a spear an' a grin an' left me his snares. Tell him the ribs are suffering, if ye see him." },
      },
      choices = {
        { text = "The King's call comes before ribs, Ragnar.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "He should've stayed and kept the town fed.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A brewer hears a great deal over a good stout, an' I've poured a great many. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I'm part owner o' the finest distillery in Dun Morogh. The other part's family, an' family's complicated.", next = "family" } },
    advice = { { id = "tp_ad", text = "Never trust a boar that's too easy to catch. It's either sick or it's a trap, an' both ruin ribs." } },
    dark_iron = { { id = "tp_dark_iron", text = "Don't get me started on the Dark Irons. They'd steal the froth off yer ale if ye looked away." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay buys my ale by the barrel, an' I've heard the pirates water it down an' sell it twice. Criminal, an' I'd say so tae the Baron's face." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's beer is an insult tae every honest brewer in Dun Morogh. Bring me a mug o' it an' I'll pour it out an' show ye what ale should taste like." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer brew wi' honey an' herbs an' call it ale, an' it's no' bad, I'll grant them that. I'd still put Thunderbrew up against it in a fair fight." } },
    everlook = { { id = "tp_everlook", text = "Everlook's goblins asked me fer a hundred kegs an' offered tae pay in gnomish shares, an' I'm no' that daft. They can drink snow." } },
    _none = { { id = "tp_none", text = "Couldnae say. Have a drink an' ask again, an' the answer might come to me." } },
  },
}

P:NPC {
  key = "belm", id = TODO_NPC("Innkeeper Belm"), name = "Innkeeper Belm",
  bible = "bibles/dunmorogh.md", role = "innkeeper", tier = "service",
  communities = { "kharanos" }, temper = { "sociable" }, values = { "generous", "friendly" },
  notices = { "weary", "race" },

  impression = {
    first = "Innkeeper Belm put a mug in my hand before I'd asked for one and told me I'd earned it, whatever it was. I'd like more people to work that way.",
    third = "{name} rested at Innkeeper Belm's in Kharanos, where there are beds upstairs and Thunderbrew ale downstairs.",
  },

  greetings = {
    { id = "g_inn", text = "Grab a mug, find a stool, an' put yer feet near the fire. Ye've earned it, whatever it was." },
    { id = "g_home", when = { homeInn = { "Kharanos", "Thunderbrew Distillery" } }, text = "Home again! Yer room's warm an' yer tankard's clean, or mostly clean." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' ye look like ye've earned a mug twice over. Sit by the fire an' I'll fetch it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown a good deal sturdier since ye first warmed yer hands in here. The Thunderbrews would say it's the ale, an' I'd not argue." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Folk about Kharanos have been sayin' kind things o' ye over their mugs. That's earned ye one on the house, in spirit at least." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear ye've got somebody in Kharanos fair riled. Leave it at the door, friend, fer this fire's fer warmin', no' fer feudin'." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Ye look like ye've been dug up. Sit down, for the ale here's raised worse than you." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! We toast a gnome in this inn every night fer savin' the town, as ye'll see." },
    { id = "n_bear", cat = "origin", when = { origin = "dwarf_bear_tracker" },
      text = "Ah, the Kharanos {g:lad|lass} wi' the bear! I remember ye trailin' them through the drifts when ye were knee-high tae a ram, an' now one's trailin' you. Keep it off the hearthrug, for it sheds." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A few o' the old miners grumble intae their ale, an' one asked if ye'd be callin' up orc spirits in my upstairs. I told him the only spirits upstairs are the ones in the bottles he didnae pay for. Most folk are only curious, an' curious dwarves buy more ale, so ye're welcome." } },
      choices = {
        { text = "I'll answer the miners' questions honestly, if they ask.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them grumble. I'll not explain myself to drunks.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A few have tried, an' a few have needed carryin' up the stairs after, so I pour yer people half a mug now. It's no' an insult, mind, it's the voice o' bitter experience." } },
      choices = {
        { text = "Half is wise. A druid should keep a clear head.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Pour it full. Rules are for sober folk.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every one that comes out o' Coldridge, near enough, an' they all want the same three things: a bed, a pint an' tae tell me about the troggs they killed. I give 'em the first two an' listen tae the third, which is the hardest work in the inn." } },
      choices = {
        { text = "No stories from me. The troggs aren't worth the telling.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then hear mine, and it grows each time I tell it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, though they're up an' out before the sun, an' they come back wi' snow on their boots an' a boar over their shoulders. I've learned tae keep a bucket by the door for the meltwater, an' a bone for whatever's followin' them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "There's a bone behind the bar for yer {pet}, if it'll wait politely, which most o' them do for a bone." },
      },
      choices = {
        { text = "I'll wipe my boots and keep the beast quiet.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Snow comes in with hunters. That's the trade.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Right off, an' they took a month tae grow back, which is a long time tae look surprised. He was a gnome out o' Gnomeregan wi' no home tae go back tae, so I forgave him, but I keep the tinderbox now." } },
      choices = {
        { text = "I'll leave your hearth alone, Belm. It's your inn.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your eyebrows grew back. No harm done, surely.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the miners complain about the smell an' the little ones have nightmares if they see yer creatures on the stair. I've nothin' against ye, but I've a whole inn tae keep content." } },
      choices = {
        { text = "That's fair. I'll keep my creatures out of sight.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your guests' nightmares aren't my concern, Belm.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than I'd like, an' they come in wi' trogg bites an' frostbite an' worse, an' Maxan Anvol, the priest upstairs, does what he can between lessons. I keep the corner table free fer the worst of them, an' I keep the ale flowin', for that helps more than ye'd think." } },
      choices = {
        { text = "Then I'll take the corner table tonight and see to them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Ale won't mend a trogg bite. They need a healer, not a mug.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Belm.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every winter, when the troggs get bold an' the Frostmane come down from the ridge, an' the Mountaineers can't be everywhere at once. If ye're stayin' a while, I'd sleep better knowin' there's a paladin under my roof, an' I'll tell the brewers to stop complainin' about the noise." } },
      choices = {
        { text = "Then I'll stand watch tonight, Belm. Sleep easy.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The Mountaineers are paid for it. Let them do their duty.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Just a room, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not a bit, for an innkeeper who asks questions soon has an empty hall. Drink up, an' if anybody comes askin' after a quiet sort wi' a hood, I'll tell them I've been too busy pourin' tae notice." },
      },
      choices = {
        { text = "Thank you. I'll keep trouble out of your hall.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Good. Keep pouring and stay busy.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "Another {altrace}, an' ye've the look o' {alt}, who slept upstairs one cold night an' left the bed made, which nobody does. Kin o' yers, I'd wager, so ye're welcome by the fire." },
        { id = "h_alt_higher", when = { alt = { higher = true }, metBefore = false },
          text = "There was a {altclass} called {alt} who came through Kharanos as green as ye, an' now I hear that name spoken in Ironforge wi' some respect. Mind ye do as well, for the valley likes tae boast about its own." },
        { id = "o_darkiron_kin", tags = { "news" }, when = { gossip = { topic = "dark_iron", stance = "kin" } },
          text = "Ragnar's been tellin' the whole bar ye called the Dark Iron kin. I'd keep that tae yerself in Kharanos, friend; there's folk here who buried sons at the Loch." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Ye'll want a room near the stair, I think, fer that plate makes a racket, an' the brewers sleep light." },
        { id = "h_default", key = true,
          text = "Innkeeper Belm, at yer service. There's beds upstairs, ale downstairs, an' Rhapsody Malt fer anyone brewin' the Thunderbrew way." },
        { id = "h_refugee", when = { origin = "gnome_gnomeregan_refugee" },
          text = "I mind the night yer folk came up out o' the tunnels wi' nothin' but the clothes they stood in, an' every bed in this inn had three gnomes in it. Ye look like ye might have been one o' them, so sit by the fire, for ye've earned the warm end." },
        { id = "h_bound", when = { questActive = TODO_QUEST("Senir's Observations") },
          text = "Ye've come up from Coldridge, then. Welcome to Kharanos; sit down, for the valley's behind ye now." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Maxan Anvol's upstairs, if it's the Light's lessons ye're after. I've priests, paladins, mages an' a rogue all under my roof, the strangest regulars in Dun Morogh." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Ye'll want a room near the hearth, I expect, though I'd ask ye no' tae light it yerself; the last one singed my eyebrows." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, eh? There's a room for ye, but I'll put ye at the end o' the hall, away from the families an' the brewers." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Sit ye down; a warrior's earned a pint by breakfast in Dun Morogh, whatever else they've done." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Ragnar'll want tae see ye, for he's mad for boar ribs an' short o' anyone tae bring them." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at the Thunderbrew! Sit by the fire, friend, for ye kaldorei look as if ye've never seen snow, an' snow's all we've got." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Here, take a mug, ye've earned it, whatever it was ye did that ye'll no' be tellin' me about." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, in Kharanos! Sit by the fire, then, an' tell me if it's happy, for it's been smokin' somethin' awful all week." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've a tap runnin'." },
        { id = "h_again2", text = "Go on; the fire's listenin' too." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Who's the gnome you toast?", next = "lazlo", when = { heardLine = "eric.sm_default" } },
        { text = "What's Rhapsody Malt?", next = "malt" },
        { text = "This inn seems full of trainers.", next = "trainers" },
        { text = "Did a mage really singe your eyebrows?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why put a warlock at the end of the hall?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do many warriors stop at your inn, Belm?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters ever stay at the inn, Belm?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your guests must come back from the valley hurt, Belm.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Kharanos ever need defending, Belm?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do night elves ever drink Thunderbrew, Belm?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Don't you want to know what I've been up to, Belm?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do folk in Kharanos mind a shaman under your roof?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just a room, thanks.", next = "END" },
      },
    },
    lazlo = {
      lines = { { id = "l_default", text = "Lazlo Grindwidget. When the Frostmane came at Kharanos in force, he saw 'em off. He's a small fellow wi' a big heart, an' the Frostmane never came at us like that again." } },
      choices = {
        { text = "A small fellow like that beating a troll is hard to picture.", next = "lazlo2" },
        { text = "To Lazlo.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    lazlo2 = {
      lines = {
        { id = "l2_default", text = "Wi' a grenade that didnae work an' a gadget that did, sort of. He says it was luck an' we say it was Lazlo, an' there's a song about it ye'll hear before the night's out." },
      },
      choices = { { text = "To Lazlo.", next = "BACK", fx = { affinity = 2 } } },
    },
    malt = {
      lines = {
        { id = "mt_default", text = "It's the best malt in Kharanos, an' the secret in Ragnar's ribs. I sell it by the mug, an' he sends half the town over fer it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trainers = {
      lines = {
        { id = "tr_default", text = "Priests upstairs wi' Maxan, paladins an' mages on the landing, an' a rogue in my kitchen I pretend not to see. The hunters train out on the hill." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every traveller through Kharanos stops at my inn, an' every one o' them brings a tale. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I've poured ale in Kharanos longer than I'd admit. I've seen the Frostmane come down an' go back up again, an' the ale stayed." } },
    advice = { { id = "tp_ad", text = "Sleep here before ye go up the mountain. Ironforge never stops hammerin', not even at night." } },
    frostmane = { { id = "tp_frostmane", text = "They came at us once, an' we've a gnome to thank it didnae go worse.", next = "lazlo" } },
    magni = { { id = "tp_magni", text = "The King's never set foot in my inn, but his brother Brann did once an' ate three plates o' ribs. Talked the whole time about some ruin in the Badlands an' never paid." } },
    scourge = { { id = "tp_scourge", text = "Refugees from the north come through Kharanos now an' then, on their way tae Ironforge. I give them a bed an' dinnae ask, for they've seen enough." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire passed near here once, years back, an' Kharanos hasnae stopped talkin' about it. I sold more ale that week than I sell all winter." } },
    _none = { { id = "tp_none", text = "I pour, I listen, an' I forget, mostly the third." } },
  },
}
