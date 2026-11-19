-- Darkshore between the towns (0.38.0): Bashal'Aran, the Grove of the Ancients, Remtravel's dig, and two druids in trouble in the wilds. Voice: bibles/auberdine.md
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "asterion", id = TODO_NPC("Asterion"), name = "Asterion", title = "",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "bashal_aran" }, temper = { "weary" }, values = { "dutiful", "wise" },
  impression = {
    first = "He talks about the old city as if he still hears it.",
    third = "{name} met Asterion, the druid who watches over the ruins of Bashal'Aran.",
  },

  greetings = {
    { id = "g_default", text = "Walk softly here, traveller, for Bashal'Aran was a city once, and the satyrs have not left it in peace." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the ruins, which few people choose to do. Sit a while, if the satyrs allow it." },
  },

  notice = {
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The satyrs in the ruins went quiet the moment you came near, which they never do, and I think they have caught your scent. They know their own, or near enough, and I would sooner they did not mistake you for a friend." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I believe I can, faintly, and it is mourning. Your spirits might hear it more clearly than I do." } },
      choices = {
        { text = "Then we should honour it, Asterion.", next = "BACK", reply = "Then honour it we shall, shaman, and the stones may sleep a little easier. You are the first visitor in a long age to think of the city's grief.", fx = { align = { light = 1 } } },
        { text = "Ruins are ruins. Let them be.", next = "BACK", reply = "They are ruins to you, but they were homes to my people. The satyrs would be glad to hear you say it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "You can, by breaking every satyr you find among the stones and taking back whatever they have dug up. They are cowards in the open and vicious in the dark, so fight them where the moon can see them." } },
      choices = {
        { text = "I'll drive them out and leave the stones in peace.", next = "BACK", reply = "That is all I ask, warrior, and more care than most blades show. I watched these halls built, and I would rather not watch them broken twice.", fx = { align = { honor = 1 } } },
        { text = "Whatever they dug up is mine. Spoils of war.", next = "BACK", reply = "Then you are no better than the satyrs, warrior, and I will thank you to leave it with me. Some spoils curse their keepers.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "In the cellars of the old houses and among the fallen pillars on the eastern side, where they think I cannot see. Follow the hoof marks in the soft ground at dusk, because that is when they come out to dig." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "In the cellars of the old houses and among the fallen pillars on the eastern side, where they think I cannot see. Your {pet} will smell them before you see them, so let it lead. Satyrs hate beasts that hunt them, which is the best reason I know to bring one." },
      },
      choices = {
        { text = "I'll root them out of the cellars, face to face.", next = "BACK", reply = "Then go, and may Elune guide your blade in the dark. Mind the stairs in the cellars; they were old even when I was alive.", fx = { align = { honor = 1 } } },
        { text = "I'll pick them off from the pillars as they dig.", next = "BACK", reply = "Wise, hunter, for they fight poorly at a distance. Pick them off, and leave the pillars standing.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Too much, and not nearly enough to tempt a mortal like you, I hope. The Highborne who lived here poured their arcane into every stone, and the Deth'ryll satyrs are what comes of that hunger, given a few thousand years." },
      },
      choices = {
        { text = "Then I'll help you see it sealed away.", next = "BACK", reply = "Thank you, mage, and I am glad to hear it from one of your craft. I was a mage once, and I know how the wanting feels.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Knowledge shouldn't be left to satyrs.", next = "BACK", reply = "No, it should not, and nor should it be left to you. Help me seal it, and we will both be safer.", fx = { align = { order = -1 } } },
        { text = "What was the city like?", next = "city" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Deal with them by the blade, or deal with them by bargain? I have watched the satyrs whisper to every traveler who comes too close, and I would not trust one of your trade not to listen." },
        { id = "xwl_demon", when = { pet = { type = "Demon" } }, text = "Deal with them by the blade, or deal with them by bargain? Your servant tilts its head toward the forest as if it hears the satyrs already, and I have watched them whisper to every traveler who comes too close, so I would not trust either of you not to listen." },
      },
      choices = {
        { text = "I'll kill them, and listen to nothing.", next = "BACK", reply = "Good, for their whispers have undone better minds than yours. I know, because I once lent them my ear.", fx = { align = { light = 1 } } },
        { text = "There's knowledge in their whispers, if you're careful.", next = "BACK", reply = "That is exactly what the Highborne said, warlock, and look where they are now. Careful is never careful enough.", fx = { align = { light = -1 } } },
        { text = "What do the satyrs want?", next = "satyrs" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Old sorrow, and old magic that the Deth'ryll want badly, and anything a satyr craves is magic no one should hold. Pray over these stones, if you would, in whatever name you pray." } },
      choices = {
        { text = "I'll pray over the stones. Your people deserve peace.", next = "BACK", reply = "Thank you, priest. No one has prayed among these stones since before the sea rose over Zin-Azshari.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Stones don't need prayer. The satyrs need killing.", next = "BACK", reply = "The satyrs do, I will not argue it. But the stones remember, and a prayer would not hurt them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Destroyed, if you ask me, for the Deth'ryll will not leave while there is anything left to dig up. But you serve your own vows, and I would not ask you to break them for me." } },
      choices = {
        { text = "They'll be driven out, and the ruins left in peace.", next = "BACK", reply = "That is the gentler answer, paladin. They would not offer you the same mercy, but I respect it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll be destroyed, every one of them.", next = "BACK", reply = "Then do it, and I will not mourn them. They chose their horns.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The Deth'ryll satyrs carry off whatever old magic they find in these stones, and I would see it taken back before they learn to use it. You needn't fight them all, only reach the ones who carry the pieces, and leave the rest wondering where their brothers went." },
      },
      choices = {
        { text = "If I fight them, I'll fight them face to face.", next = "BACK", reply = "Then you are braver than most rogues. They will not return the courtesy, so watch for the knife in the dark.", fx = { align = { honor = 1 } } },
        { text = "I'll come at them from behind. They won't see me coming.", next = "BACK", reply = "Then they will never see you coming, and they deserve it. Bring back whatever they took.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Asterion, and I watch over what is left of Bashal'Aran. The Deth'ryll satyrs crawl through these stones looking for old magic, and I mean to see that they find none of it." },
        { id = "h_cond", when = { race = "NightElf" }, text = "You're one of the Kaldorei, so you'll feel it too, I think, the old sorrow in these stones. Our people built this place before the sea took so much of the shore." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The Deth'ryll satyrs would scatter if enough of your kind came to Bashal'Aran, and I would be glad to see it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The satyrs of Bashal'Aran leave tracks like goats and a stink like the Legion, and you will know them when you find them." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Then perhaps you can feel what still haunts Bashal'Aran, for I have felt it every night since the satyrs came." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, here at Bashal'Aran. I did not think to see one of your order among our ruins, but I will not refuse the help." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You came up through the ruins without stirring a single satyr, which is more than I can manage. Bashal'Aran could use someone who walks as quietly as you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I watch Bashal'Aran's ruins while the satyrs pick at what my people left behind, so tell me, can your spirits still hear the old city?" },
      },
      again = {
        { id = "h_again1", text = "What else would you know about the ruins? They have stood since before the Sundering, and they will wait for your question." },
        { id = "h_again2", text = "Ask, then, while the satyrs are quiet." },
      },
      choices = {
        { text = "What do the satyrs want here?", next = "satyrs" },
        { text = "Bashal'Aran must have been something, once.", next = "city" },
        { text = "Do you send word to Auberdine?", next = "neighbors" },
        { text = "You're a druid, as I am. How do you bear it here?", next = "druid", when = { class = "DRUID" } },
        { text = "What magic is left in Bashal'Aran?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can I help you drive the satyrs from Bashal'Aran?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Where do the satyrs hide in the ruins, Asterion?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Satyrs are demon-touched. I can deal with their kind.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What haunts these ruins, Asterion?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the satyrs be driven out, or destroyed?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you have a quiet blade do in Bashal'Aran?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can you still hear the old city, Asterion?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    satyrs = {
      lines = {
        { id = "satyrs_default", text = "They want whatever magic the Highborne left behind, for they were Highborne once themselves, before the Legion twisted them. I've asked travellers to take the horns from the Deth'ryll and bring me the old relics they steal." },
      },
      choices = {
        { text = "Why do they keep coming back?", next = "satyrs2" },
      },
    },
    satyrs2 = {
      lines = {
        { id = "satyrs2_default", text = "Because the old magic calls to them, and I think it always will, the way a drunkard hears a tavern door. Some say we should forgive them their shape, and some say we should finish what the war began." },
      },
      choices = {
        { text = "Whatever they were, they chose this. Drive them out.", next = "BACK", reply = "They did, and I cannot forgive them for it. Drive them out, and I will help.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "They were our people once. Pity them, at least.", next = "BACK", reply = "They were, and some nights I pity them. Then I hear their picks in the cellars, and the pity goes.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Let them dig. Dead cities are no one's business.", next = "BACK", reply = "It is my business, and it was my people's home. I will not let them dig.", fx = { align = { order = -1 } } },
      },
    },
    city = {
      lines = {
        { id = "city_default", text = "A city of the Kaldorei, from the days before the Sundering, and later a quiet place where my people kept their histories. Now it is broken stones and old moonlight, and I am all that's left to mind it." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    neighbors = {
      lines = {
        { id = "neighbors_default", text = "When I can, yes, though Auberdine has troubles enough with the bears and the furbolgs. Tharnariun and I were students together once, and he still sends me a bottle of something on the boat days." },
      },
      choices = {
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "druid_default", text = "By listening to the trees instead of the stones, mostly. The ruins grieve, but the forest around them is still young and stubborn, and a druid can lean on that when the nights are long." },
      },
      choices = {
        { text = "Thank you.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a druid who stayed where others left, and I watch the old city because someone should." } },
    highborne = { { id = "tp_highborne", text = "I watch the old Highborne city because the Highborne never stay dead the way they ought to. They loved their magic more than their lives, and some of them still do." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil is the first tree, and it holds our people's life on Hyjal. I'd rather watch over it than this, but somebody has to watch the dead." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream shows the land as it should be, and I have seen this shore there, green and quiet. It is hard to come back from that and look at the ruins." } },
    _none = { { id = "tp_none", text = "I've no answer for that, I'm afraid; the ruins keep their own counsel and so do I." } },
  },
}

P:NPC {
  key = "remtravel", id = TODO_NPC("Prospector Remtravel"), name = "Prospector Remtravel", title = "Explorers' League",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "remtravel_dig" }, temper = { "scatterbrained" }, values = { "curious", "proud" },
  impression = {
    first = "He loses his notes, his tools and occasionally himself, quite cheerfully.",
    third = "{name} met Prospector Remtravel, an absent-minded dwarf digging in southern Darkshore.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a visitor! Mind the trench, {g:lad|lass}, I've only just dug it and I'd hate to lose another one in there." },
    { id = "g_back", when = { metBefore = true }, text = "I know your face, I'm nearly sure of it, which puts you ahead of half my notes!" },
  },

  notice = {
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "What's that in yer pack, rattlin' cold like gravel in a grave? Soul shards, by my beard, an' enough o' them tae haunt the whole dig, so keep them well away from my bones." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "The League says the titans shaped the dwarves out of stone, and the elves say Elune watches over theirs. Digging around their old cities like this, I've started to wonder. What do you believe?" },
      },
      choices = {
        { text = "Titans. Uldaman proves it, or soon will.", next = "op_r1", fx = { affinity = 1, trait = { curious = 1 }, opinion = { titans = "believe" } } },
        { text = "Elune made the kaldorei, and the kaldorei know best.", next = "op_r2", fx = { align = { light = 1 }, opinion = { titans = "elune" } } },
        { text = "Gods and titans are excuses for grave-robbing.", next = "op_r3", fx = { affinity = -1, align = { light = -1 }, opinion = { explorers_league = "wrong" } } },
        { text = "I couldn't say.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "There's a {race} after my own heart! Ironforge is sitting on a tomb full of answers, and I mean to be the one who reads them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Well, I'll not argue with a goddess in her own country, especially not out here alone at night. Still, the stone says what it says." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Grave-robbing! We catalogue, we sketch and we label everything in triplicate, and robbers never label anything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Fascinated, {g:lad|lass}! The old stone talks to us through runes, and maybe your spirits hear what the runes leave out. Come and dig with me sometime!" } },
      choices = {
        { text = "I'll dig with you honestly, Prospector, and share what I find.", next = "BACK", reply = "That's the spirit, {g:lad|lass}, and the League'll thank ye for it! Grab that brush and mind the wee bits.", fx = { align = { honor = 1 } } },
        { text = "Runes are enough. Spirits only muddy the record.", next = "BACK", reply = "Aye, they're enough for me too, mostly. But I'll not turn down a good guess from a spirit, if ye've one handy.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Well, I'd not like to think so, though one of your lot did give me a long, cold look when I took a pick to the old ruins. I fill my holes back in, mostly, and I'd say the furbolgs have done this coast more harm than one dwarf with a shovel." } },
      choices = {
        { text = "These ruins belong to the kaldorei. Ask leave before you dig.", next = "BACK", reply = "Aye, and I did, mostly, though the elves have a funny way o' sayin' yes. I'll ask again, just to be safe.", fx = { align = { order = 1 } } },
        { text = "Dig on. The past belongs to whoever finds it.", next = "BACK", reply = "That's what I keep tellin' the elves, and they keep givin' me that look. Still, it's nice tae hear it from someone.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than a pint o' Thunderbrew, {g:lad|lass}, for they come up from the shore every time I find somethin' worth keepin'. Stand at the trench while I dig, an' I'll put your name in my report tae the League, spelled right an' all." } },
      choices = {
        { text = "I'll stand guard. The League's work matters.", next = "BACK", reply = "Good on ye, {g:lad|lass}! The murlocs won't know what hit 'em, an' I can finally dig without lookin' over my shoulder.", fx = { align = { honor = 1 } } },
        { text = "I'll guard you for a share of the finds.", next = "BACK", reply = "A share, eh? Ye drive a hard bargain, but the League's always been fair. We'll talk about it after the murlocs.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Great things, {g:lad|lass}, wi' teeth like spades an' bones as thick as my arm, an' not one o' them left alive tae hunt. A hunter's eye could tell me how they moved from the bones alone, an' that'd be worth a chapter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Great things, {g:lad|lass}, wi' teeth like spades an' bones as thick as my arm, an' not one o' them left alive tae hunt. An' your {pet} is sniffin' at my trench, which is grand, because if there's a bone down there it'll find it before I do. Just don't let it bury the thing again." },
      },
      choices = {
        { text = "Let the old beasts rest. Some ground should stay undug.", next = "BACK", reply = "Aye, maybe some should, and I'll leave the biggest ones be. But the wee ones have a lot tae teach us.", fx = { align = { light = 1 } } },
        { text = "Dig them all up. The past belongs to the living.", next = "BACK", reply = "That's the League's motto, near enough, and I'll drink tae it. Dig 'em all up!", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Anyone could, but who'd want old elven pots an' half a fossil? The elves, that's who, an' they're no' happy wi' a dwarf diggin' up their ancestors as it is." },
      },
      choices = {
        { text = "I'll keep an eye on it for you.", next = "BACK", reply = "Thank ye, {g:lad|lass}. The elves keep a closer eye on it than I'd like, but they'll no' carry a crate for me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pots sell, Prospector. Mind your back.", next = "BACK", reply = "Pots sell, aye, but no' these pots. Mind yer own back, friend.", fx = { align = { honor = -1 } } },
        { text = "What are you digging for?", next = "dig" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Wards! So that's what gives me a nasty jolt every time I lift a stone. If ye can tell me which ones are safe tae shift, I'll stop losin' diggers tae their nerves." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Wards! A gnome would know, an' that'll be what gives me a nasty jolt every time I lift a stone. Tell me which ones are safe tae shift, an' I'll stop losin' diggers tae their nerves." },
      },
      choices = {
        { text = "I'll mark the dangerous ones carefully.", next = "BACK", reply = "Thank ye, and my fingers thank ye too! A jolt a day is more than enough for any dwarf.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let's break one and see what happens.", next = "BACK", reply = "Break one? Are ye mad? I've had enough jolts for one dig, thank ye very much.", fx = { align = { order = -1 } } },
        { text = "Is the dig dangerous?", next = "danger" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, it's nothing, probably, though it's gone a colour I don't much like. Mind you, the murlocs on the beach bite harder than anything in the ruins, so I'll keep digging and hope for the best." } },
      choices = {
        { text = "Hold still. I'll tend it now, before it worsens.", next = "BACK", reply = "Ach, if ye insist, and I'll try not tae squirm. It has gone a nasty colour, hasn't it?", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If you say it's nothing, I'll take your word.", next = "BACK", reply = "Aye, it's nothin', I'm sure of it, though I'd no' mind if ye stopped lookin' at it like that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Leave them? Never, friend, for the League's job is to learn what's buried before somebody worse finds it first. I'll be respectful, mind, and the elves have had ten thousand years to complain." } },
      choices = {
        { text = "The past should be studied with care and respect.", next = "BACK", reply = "Aye, care and respect, that's how the League does it, mostly, when nobody's in a hurry.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dig what you like. The dead won't miss it.", next = "BACK", reply = "They won't, but the elves will, and they've got the arrows. I'll be careful, thank ye.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Worried? I've had murlocs, cave-ins and worse on this dig already, so a demon on a leash is near enough a relief. Just keep it off the bones, friend, because the League will have my beard if anything else goes missing." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Worried? I've had murlocs, cave-ins and worse on this dig already, so a demon on a leash is near enough a relief. Though yours is poking at my bone crates as we speak, friend, so pull it back, because the League will have my beard if anything else goes missing." },
      },
      choices = {
        { text = "Your finds are safe. I respect the League's work.", next = "BACK", reply = "Thank ye, {g:lad|lass}, and the League thanks ye too. Just keep it away from my fossils.", fx = { align = { order = 1 } } },
        { text = "If it eats your bones, you'll dig up more.", next = "BACK", reply = "That's no' funny, and I'll thank ye tae keep it on a short leash. Some o' these bones are irreplaceable.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_explorers_league_wrong", tags = { "news" }, when = { opinion = { topic = "explorers_league", stance = "wrong" } },
          text = "You're the one who thinks the League should leave the ruins be, aren't you? You're welcome to the opinion, so long as you keep it out of my trenches." },
        { id = "h_default", text = "Remtravel's the name, prospector for the Explorers' League, and these old elven ruins are the finest dig I've had in years. If only I could remember where I left the bloody fossil." },
        { id = "h_cond", when = { race = "Dwarf" }, text = "A dwarf, out here! Tell me you're from Ironforge and you've brought a proper pickaxe, because the elves don't make a tool worth swinging." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Grand, because the murlocs keep chasin' me off my own dig, an' I've had enough o' runnin'." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye'll have a good eye, then, an' I've lost a fossil the size o' my head somewhere about here." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Grand, grand, because I've a nasty feeling I've been bitten by something, and I can't remember what." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now that's a proper sight for an old prospector, and if ye'd watch my back while I dig, I'll dig all the faster." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Ah, one of the elf druids! You lot can talk to trees, can't you, so ask one of them whether it's seen my fossil, would you?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! You haven't seen a pick lying about, have you, or a notebook with an ale ring on the cover? Don't let your wee beastie eat it if you do." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! By my beard, that's a first for the Explorers' League! Do your spirits know where I left my notes?" },
      },
      again = {
        { id = "h_again1", text = "Now, where was I? Ah, yes, you were asking something." },
        { id = "h_again2", text = "Carry on, carry on, I'm listening with at least one ear." },
      },
      choices = {
        { text = "Who do you think built these ruins, really?", next = "op_ask" },
        { text = "What are you digging for?", next = "dig" },
        { text = "What does the Explorers' League hope to find here?", next = "league" },
        { text = "It seems dangerous out here alone.", next = "danger" },
        { text = "I'm from Ironforge, and I brought a pick.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Your dig's wide open. Anyone could walk off with your finds.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Elven ruins like these are full of old wards.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you want the murlocs kept off your dig, Prospector?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What beasts once walked this shore, Prospector?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you want me to look at that bite, Prospector?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Shouldn't you leave these elven ruins alone, Prospector?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your digs disturb the land here, Prospector?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Aren't you worried about my servant near your finds?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do the Explorers' League make of shamans, Prospector?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck with the digging.", next = "END" },
      },
    },
    dig = {
      lines = {
        { id = "dig_default", text = "Bones, {g:lad|lass}, old ones, from beasts that walked this shore before the elves ever did. Gorbold back in Auberdine thinks I've gone soft in the head, but the League pays for curiosity, not common sense." },
      },
      choices = {
        { text = "Did you find anything?", next = "dig2" },
      },
    },
    dig2 = {
      lines = {
        { id = "dig2_default", text = "I found a fossil the size of my head and then the murlocs chased me off and I can't think where I put it down. The elves say these ruins are holy and I ought to leave them be, but bones belong in a museum, don't they?" },
      },
      choices = {
        { text = "Knowledge belongs to everyone. Dig away.", next = "BACK", reply = "That's what I keep sayin', and nobody listens! Dig away, and we'll find that fossil yet.", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "If the elves call it holy, ask their leave first.", next = "BACK", reply = "Aye, and I did, mostly. I'll ask again, just tae be safe.", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    league = {
      lines = {
        { id = "league_default", text = "The whole history of the world, {g:lad|lass}, and Darkshore has more of it lying about than most. Brann Bronzebeard himself would give his beard to see this coast, though don't tell him I said so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "danger_default", text = "Dangerous? Oh, terribly, what with the murlocs and the Blackwood furbolgs and the moonkin gone mad on the ridge. But I've a stout hat and a good sense of direction, which is more than most of my colleagues can say, mind." },
      },
      choices = {
        { text = "If you say so.", next = "BACK" },
      },
    },
    dwarf = {
      lines = {
        { id = "dwarf_default", text = "Bless your beard! Then you'll know the Hall of Explorers smells of old paper and older ale, and you'll forgive a fellow for missing it out here among all these trees." },
      },
      choices = {
        { text = "I do miss it.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Explorers' League, thirty years in the field, and only lost twice, whatever Gorbold back in Auberdine tells you." } },
    magni = {
      { id = "tp_magni", text = "King Magni funds the League, and I've a letter from him on my wall that says 'Find something, Remtravel.' I'm working on it." },
      { id = "tp_magni2", when = { race = "Dwarf" }, text = "Your king's a fine patron, {g:lad|lass}, and I'd say so even if he weren't. He wants results, though, and I'd sooner he never heard how often I get lost." },
    },
    ahn_qiraj = { { id = "tp_ahn_qiraj", text = "Silithus has walls older than any dwarf city, with carvings nobody can read. One day I'll go and get lost there properly." } },
    dire_maul = { { id = "tp_dire_maul", text = "Eldre'Thalas, the night elves' old city in Feralas, mostly intact. If I didn't have a fossil to find here, I'd be there." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Lost good friends in Gnomeregan, and my best brush. I'm told it's still full of radiation and angry machinery." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye, {g:lad|lass}. I can barely tell ye where I left my lunch, and that was under a perfectly good rock." } },
  },
}

P:NPC {
  key = "onu", id = TODO_NPC("Onu"), name = "Onu", title = "Ancient of Lore",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "grove_of_ancients" }, temper = { "slow" }, values = { "wise", "protective" },
  impression = {
    first = "Each word seems to have been weighed for a season first.",
    third = "{name} met Onu, the Ancient of Lore who guards the Grove of the Ancients in Darkshore.",
  },

  greetings = {
    { id = "g_default", text = "Young one, you walk quickly, as all your kind do. Stand a while and let the grove see you." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the grove remembers your footsteps. That is no small thing, for it forgets most visitors." },
  },

  notice = {
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "You wear the hide of a demon about you, young one, and the grove draws its roots away from it. I have stood a long time and seen many kinds of armor, but never one that did not ask a price of its wearer." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "We have known them since the world was young, little one. Your people listen through stone and mine through root, and we both hear the same song." } },
      choices = {
        { text = "Then I will listen with respect, Onu.", next = "BACK", reply = "Then you will hear what the roots have heard, in time, for the world is patient with those who listen. Sit in my shade whenever you wish.", fx = { align = { light = 1 } } },
        { text = "Old songs are old. I will make my own.", next = "BACK", reply = "Make them, young one, and the earth will learn them too. Only remember that every new song is sung over an older one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "There is something there that was not there a season ago, and it gathers others to it in the dark. When it is ready it will come north, and the grove will need roots that hold and blades that do not break." } },
      choices = {
        { text = "I'll wait, and hold when it comes north.", next = "BACK", reply = "Wise. The young rarely wait, and you will be glad of your patience when it comes north and finds you ready.", fx = { align = { order = 1 } } },
        { text = "I'll go to the Glaive and strike first.", next = "BACK", reply = "Then go with care, for what gathers at the Glaive is older than your anger. Strike true, and come back to tell me of it.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The healthy ones do, and they come to sleep in our shade as they always have. The sick ones no longer know us, and that is a grief I have not felt since the trees here were saplings." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The healthy ones do, and they come to sleep in our shade as they always have. Your {pet} is healthy and unafraid of me, which is good to see. Bring it to the grove whenever you pass, and let it rest among the roots." },
      },
      choices = {
        { text = "I'll seek a cure for them, not a quick death.", next = "BACK", reply = "The grove will remember that, hunter, and so shall I. Tharnariun by the shore has been searching for one; go and lend him your eyes.", fx = { align = { light = 1 } } },
        { text = "A quick death is the only mercy left them.", next = "BACK", reply = "It may be so, and that is the sorrow of this season. If it must be done, then be swift and gentle about it.", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "It has stood in that earth longer than your kingdom has had a name, and the land around it remembers violence. Your kind is curious about such things, I know, but the Glaive is not for curious hands." },
      },
      choices = {
        { text = "I'll leave it be, Ancient.", next = "BACK", reply = "You honour the land by leaving it, mage, and I thank you. Some old things sleep more lightly than they seem.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something that old should be understood.", next = "BACK", reply = "Understood by whom, though, and for what? Your kind once sought to understand the Well, and the sea still covers what that cost.", fx = { align = { order = -1 } } },
        { text = "What stirs at the Glaive?", next = "glaive" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "You could, and I think whatever stirs there would welcome you, and that is exactly why I do not want you near it. The Twilight cultists gather at the Glaive, and they would find one of your kind very useful." },
        { id = "xwl_demon", when = { pet = { type = "Demon" } }, text = "You could, and I think whatever stirs there would welcome you. Your servant has been looking toward the Glaive since you came up the road, as if it already knows the way, and that is exactly why I do not want either of you near the cultists who gather there." },
      },
      choices = {
        { text = "Then I'll go and burn them out.", next = "BACK", reply = "Then my roots will be glad of it. Burn them out, and do not linger to hear what they offer you.", fx = { align = { light = 1 } } },
        { text = "Perhaps they'd tell me something worth knowing.", next = "BACK", reply = "It would tell you a great deal, warlock, and all of it bait. I have watched that hook take wiser fish than you.", fx = { align = { light = -1 } } },
        { text = "Who keeps the grove with you?", next = "grove" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A sickness that walks up from the south, from the Master's Glaive, where something waits that I cannot name. The trees feel it in their roots, and so do I, and I would have you pray against it before it reaches us." } },
      choices = {
        { text = "I'll pray for the grove and its roots.", next = "BACK", reply = "Then the roots will feel it, priest, even if they cannot answer you. Prayer is a kind of rain, and they are very thirsty.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Trees can't be healed by prayer, Onu.", next = "BACK", reply = "Perhaps not healed, but comforted, and comfort is no small thing to a tree that is afraid. Say it anyway, for my sake.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Patience, which is hard for the young, and strength, which comes easier. Strike at what threatens the grove, but do not strike in haste, for a hasty blow in this forest often falls on the wrong thing." } },
      choices = {
        { text = "I'll be patient, and strike only when I'm sure.", next = "BACK", reply = "Then you have learned in a day what takes most saplings a century. The grove will be glad of you when the time comes.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Waiting lets evil grow. I'll strike first.", next = "BACK", reply = "Waiting can let evil grow, yes, but haste can wake what was only dozing. I would have you sure before you strike.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Paths do not trouble me, for I have watched a great many of them cross this grove. What troubles me is the Master's Glaive, where the Twilight's Hammer gather, and a quiet walker could learn what they plan there before they know they are seen." },
      },
      choices = {
        { text = "I'll go, but openly, and fight them fairly.", next = "BACK", reply = "Openly, then, and may the grove's strength go before you. The cult will not expect a guest who knocks.", fx = { align = { honor = 1 } } },
        { text = "Unseen is how I work. They'll never know.", next = "BACK", reply = "Then let them never know. Only come back, for I have lost too many young ones to that place.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Onu, and I have kept this grove since the trees here were saplings. Something stirs at the Master's Glaive to the south, where the old blade fell, and I do not like the shape of it." },
        { id = "h_cond", when = { class = "DRUID" }, text = "Ah, a druid walks in my grove, and I hear the Cenarion Circle in the way you step. Malfurion's children are always welcome among the Ancients." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The trees of this grove have watched many like you pass, and fewer return." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The beasts of Darkshore have grown sick, and the grove feels it in its roots." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest stands in the grove. The Light, or Elune, it matters little to the trees, so long as what you carry is gentle." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your kind are young, as the forest counts years, but your vows are old enough to be worth something." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You walk among my roots as quietly as the deer do, little one. I wonder whether you learned that from the forest, or from the dark." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who speaks with the spirits of the world. You walk a path older than you know, little one. Speak, and I will listen." },
      },
      again = {
        { id = "h_again1", text = "Speak, young one, I am listening." },
        { id = "h_again2", text = "The grove waits. What else do you wish to know?" },
      },
      choices = {
        { text = "What is the Master's Glaive?", next = "glaive" },
        { text = "You aren't the only Ancient in this grove, I think.", next = "grove" },
        { text = "You must be very old, Onu.", next = "time" },
        { text = "The Circle sends its respects, Ancient.", next = "druidq", when = { class = "DRUID" } },
        { text = "The Master's Glaive must have been forged with great power.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is there a fight waiting at the Master's Glaive, Onu?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the beasts of the grove still trust the Ancients?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Whatever stirs at the Glaive, I could find out.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What troubles the grove, Ancient One?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you ask of a paladin, Ancient One?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does a rogue's path trouble you, Ancient One?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the Ancients know the spirits I speak with, Onu?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I will leave you in peace.", next = "END" },
      },
    },
    glaive = {
      lines = {
        { id = "glaive_default", text = "A great blade that fell from the sky in the war against the Legion, and it lies in the earth still, far to the south of here. Now men in dark robes gather around it, the Twilight's Hammer, and they whisper to things that should stay sleeping." },
      },
      choices = {
        { text = "What would you have done about them?", next = "glaive2" },
      },
    },
    glaive2 = {
      lines = {
        { id = "glaive2_default", text = "I am too old and too rooted to walk there, so I ask the young ones to go for me. Some would scatter the cult and let them run, and some would end them before the whispering spreads." },
      },
      choices = {
        { text = "Scatter them. They're people, however lost.", next = "BACK", reply = "They are, and lost people may yet be found, as some of my saplings were. Scatter them, and let the land heal behind you.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "End them, before whatever they call answers.", next = "BACK", reply = "Perhaps that is the wiser road, and I fear you may be right. Do what must be done, and do not look into what they were calling.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    grove = {
      lines = {
        { id = "grove_default", text = "Old friends, who sleep more than they speak, as I will someday. We remember the forest as it was before the Sundering, and we keep that memory so the young trees have something to grow toward." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    time = {
      lines = {
        { id = "time_default", text = "Older than the shore you walked to reach me, little one. I remember when this coast was a hill above a city, before the sea came in and took it." },
      },
      choices = {
        { text = "That's older than I can picture.", next = "BACK" },
      },
    },
    druidq = {
      lines = {
        { id = "druidq_default", text = "Then carry mine back to Moonglade, and tell Remulos that Onu still stands. A message from an Ancient is slow, but it arrives." },
      },
      choices = {
        { text = "I will.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am an Ancient of Lore, and the memory of this forest lives in my roots." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil is the root of all our forests' memories, young one. I was a sapling when it was young, and I remember the songs it taught." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream is the world as Cenarius and the Ancients first knew it, before anything was broken. I visit it in my long thoughts, and come back slowly." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion came at the Well and again at Hyjal, and both times the forest bled. My roots remember, and they will not forget." } },
    highborne = { { id = "tp_highborne", text = "The Highborne cared little for the forest, and the forest has not forgotten that either. It is slow to forgive, as I am." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's children walk the Dream as I walk my roots, slowly and with care. Something troubles them, and I feel it as a chill in the soil." } },
    _none = { { id = "tp_none", text = "That is a question for younger minds than mine, little one, and for quicker ones." } },
  },
}

P:NPC {
  key = "volcor", id = TODO_NPC("Volcor"), name = "Volcor", title = "",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "darkshore_wilds" }, temper = { "hunted" }, values = { "brave", "protective" },
  impression = {
    first = "He is hurt and short of patience, but not of courage.",
    third = "{name} met Volcor, a night elf trapped by the maddened Blackwood furbolgs in Darkshore.",
  },

  greetings = {
    { id = "g_default", text = "Quiet, friend, please! The Blackwood are just outside, and they'll hear us if we talk above a whisper." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and you weren't followed, I hope. Good, then we can speak." },
  },

  notice = {
    { id = "n_lock_stones", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "Is that a healthstone you're carrying? Good, because if the Blackwood catch us on the road I'll be needing one, and I'll not be too proud to ask, whoever's life went into it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Something poisoned them, though I do not know what, and they turned on everyone. Your spirits might tell you more than I can." } },
      choices = {
        { text = "Then I will help you escape, Volcor.", next = "BACK", reply = "Elune bless you, stranger, for I had stopped hoping anyone would come. Let us move before the next patrol passes.", fx = { align = { honor = 1 } } },
        { text = "Fight your own way out.", next = "BACK", reply = "I would if I could, but they took my weapon and most of my strength with it. Please, I only need someone to walk beside me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I have asked myself that every night since they took me, and I do not know, because something is driving them that is not their own anger. They were our friends once, and I would rather see them cured than cut down, though I will fight them if I must to reach the road." } },
      choices = {
        { text = "They're sick, not wicked. I'll spare them where I can.", next = "BACK", reply = "Thank you for that, druid, for they were friends of mine before the madness. Spare who you can, and I will follow your lead.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sick or not, they'll kill us. I'll cut us a path.", next = "BACK", reply = "Then cut it, and I will keep close behind you. I only pray it is quick, for all our sakes.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Too many to count when they're all howling, but they come in twos and threes along the path, if we're quick. Stay in front of me and don't stop to finish the stragglers, because we're here for the road, not the furbolgs." } },
      choices = {
        { text = "I'll stay in front and keep you safe.", next = "BACK", reply = "Then I will stay at your shoulder and keep my head down. Lead on, and I will do my best not to slow you.", fx = { align = { honor = 1 } } },
        { text = "I'll finish every one. No stragglers behind us.", next = "BACK", reply = "Then finish them, and I will not stop you, though it hurts to watch. They used to share their fires with us.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "On the high ground, mostly, with their scouts on the trails that lead toward the road. If we keep low and move between their patrols we might slip past, and your bow can deal with the rest." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "On the high ground, mostly, with their scouts on the trails that lead toward the road. Your {pet} will hear them before we do, so keep it close and watch its ears. I'd trust a beast's warning over my own right now." },
      },
      choices = {
        { text = "We go quietly and spare what we can.", next = "BACK", reply = "High ground and quiet feet, then, and I will follow where you step. You read this forest better than I do.", fx = { align = { honor = 1 } } },
        { text = "We go fast, and anything in our way dies.", next = "BACK", reply = "Fast it is, then, and I will run as long as my legs hold out. Do not wait for me if I fall behind.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Quickly, then, because the Blackwood patrol this ground and they won't wait for a priest to finish. Mend what you can and I'll manage the rest, as I have been." } },
      choices = {
        { text = "I won't leave you hurt. Hold still.", next = "BACK", reply = "Your hands are steadier than mine, priest, so I will hold as still as I can. Quickly, though, I hear them howling.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "We've no time. Walk on it until we're clear.", next = "BACK", reply = "Then I will walk on it and pray it holds until we reach the road. I have walked on worse, I think.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Someone in front of me and nothing behind, and that is all I ask. The furbolgs were friends once, so I take no pleasure in it, but I will not die in this cave for their sake." } },
      choices = {
        { text = "I'll guard you all the way, whatever comes.", next = "BACK", reply = "With you in front I almost feel brave again, paladin. Lead on, and I will keep up as best I can.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep up, and I'll do what I can.", next = "BACK", reply = "I will try, and that is all I can promise you in this state. Lead on, and I will not complain.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Quickly, if you can, because they're fierce in a pack and I'm in no shape to hold any of them off. Don't burn the trees, though, because the Blackwood were my friends before the madness took them, and this was their forest too." },
      },
      choices = {
        { text = "I'll spare them if I can. They were your friends.", next = "BACK", reply = "Thank you, mage, and mind the trees too, for they were good to us before all this. Quickly, now.", fx = { align = { light = 1 } } },
        { text = "They're mad now. I'll burn them where they stand.", next = "BACK", reply = "Then burn them if you must, and I will grieve them after we are safe. Only keep the flames off the woods.", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I trust you more than I trust the Blackwood, which isn't saying much just now. Something drove them mad, and I've wondered whether it wasn't the same dark you deal in, so prove to me it isn't before we reach the road." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I trust you more than I trust the Blackwood, which isn't saying much just now. Something drove them mad, and that creature of yours has the same sour smell I caught in their camps, so prove to me it isn't the same dark before we reach the road." },
      },
      choices = {
        { text = "I'll prove it. Stay close and I'll get you out.", next = "BACK", reply = "Then I will stay close and trust you further than I trust the Blackwood. That is the best I can offer today.", fx = { align = { honor = 1 } } },
        { text = "Trust me or stay here. Your choice.", next = "BACK", reply = "I have no choice, so I will trust you, and I will be grateful for it all the same. Let us go before they come back.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "My name is Volcor, and I was taken by the Blackwood furbolgs when they turned on us. I need to reach the road and get word to Auberdine, but even a kaldorei who has walked these woods for centuries can't fight past them alone." },
        { id = "h_cond", when = { class = "ROGUE" }, text = "You move like someone who knows how to go unseen, which may be just what I need. There's more than one way out of this den." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Thank Elune, because I can't fight my way past the Blackwood alone, and you look as though you could." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll know the paths through the Blackwood better than I do now, since mine ended in a cage." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Then you can look at this leg once we're out of here, because I've been walking on it longer than I should." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I'll be glad of that hammer between me and the furbolgs, though I hope you can keep pace with a limping elf." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Then you know the Blackwood were not always like this, and you will understand why it hurts to hide from them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Can you get us past the Blackwood without a fight, or at least make the fight a short one?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, and I'm in no position to be choosy about who gets me out of here. Just keep that thing pointed at the furbolgs and not at me." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Blackwood", min = 30 } },
          text = "You've cut down a lot of the Blackwood getting here, and I'm grateful, though it pains me to say it. They were good neighbours once, before the madness took them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The furbolgs of the Blackwood have gone mad, and I am hurt, though not afraid, so if your spirits can help me slip away, I would welcome them." },
      },
      again = {
        { id = "h_again1", text = "Speak quickly, for they patrol often, and furbolg ears are sharper than a Sentinel's." },
        { id = "h_again2", text = "What else? Keep your voice low." },
      },
      choices = {
        { text = "How do we get you out?", next = "escape" },
        { text = "The Blackwood seem to have turned on you.", next = "furbolg" },
        { text = "Someone in Auberdine must be waiting for you.", next = "others" },
        { text = "I can get us both out unseen.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Let me see to your wounds before we move, Volcor.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'll see you safe to the road, Volcor. What do you need?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How do you want me to handle the furbolgs, Volcor?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you trust a warlock to get you out, Volcor?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What drove the Blackwood furbolgs mad, Volcor?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll come back for you.", next = "END" },
        { text = "How many furbolgs stand between us and the road?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Where do the Blackwood furbolgs keep their watch?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Can the Blackwood furbolgs be healed, Volcor, or are they lost?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
      },
    },
    escape = {
      lines = {
        { id = "escape_default", text = "We can fight our way through the camp, or we can slip around it while they sleep, and either way I need you at my side. I'd sooner do it by force, but I'll trust your judgement." },
      },
      choices = {
        { text = "Why would you rather fight?", next = "escape2" },
      },
    },
    escape2 = {
      lines = {
        { id = "escape2_default", text = "Because they killed two of my friends in front of me, and some part of me wants them to pay. The other part knows they're sick, not wicked, and that something has been poisoning their minds." },
      },
      choices = {
        { text = "We go quietly. Revenge can wait.", next = "BACK", reply = "You are right, and I am ashamed of the other part of me. Quietly, then, and let the Sentinels judge the Blackwood.", fx = { align = { order = 1 }, trait = { patient = 1 } } },
        { text = "They've earned a fight. We go through them.", next = "BACK", reply = "They have, and I will not hold you back. But do not ask me to cheer, because I knew some of them by name.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    furbolg = {
      lines = {
        { id = "furbolg_default", text = "They were friendly once, and traded with us for years, but this season they grew wild and red-eyed. They've been drinking or eating something foul, and I'd wager the satyrs had a hand in it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "others_default", text = "Sentinels I've served beside, and a sister who'll box my ears for getting caught. Tell Thundris Windweaver what's happening up here, whatever becomes of me." },
      },
      choices = {
        { text = "I'll tell him.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "rogue_default", text = "Then you'll lead and I'll follow, and Elune keep us both out of their noses. I've never been gladder to meet someone who sneaks for a living." },
      },
      choices = {
        { text = "Before we go, one more question.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a scout of Auberdine, or I was, before the Blackwood took me." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are what the Blackwood were, before the corruption. I'd give a lot to see a furbolg with sense again, after what the Blackwood did to me." } },
    blackfathom = { { id = "tp_blackfathom", text = "I've scouted near Blackfathom, and the Twilight's Hammer guard it well. Don't go in alone, and don't go in tired." } },
    elune = { { id = "tp_elune", text = "I prayed to Elune when the Blackwood had me, and I'm here, so I'll keep praying." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't time to wonder about it just now. Elune willing, I'll have centuries to wonder later." } },
  },
}

P:NPC {
  key = "kerlonian", id = TODO_NPC("Kerlonian Evershade"), name = "Kerlonian Evershade", title = "",
  bible = "bibles/auberdine.md", role = "questgiver", tier = "quest",
  communities = { "darkshore_wilds" }, temper = { "drowsy" }, values = { "kind", "foolish" },
  impression = {
    first = "He keeps falling back into the Emerald Dream, and it embarrasses him.",
    third = "{name} met Kerlonian Evershade, a druid in Darkshore who cannot stay awake.",
  },

  greetings = {
    { id = "g_default", text = "Hm? Oh, forgive me, I must have dozed off again, which happens rather a lot lately." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and I'm awake to see you, which is a fine change for both of us." },
  },

  notice = {
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You're warm, terribly warm, and I can feel it even through the fog in my head, as though something small and burning had shared its blood with you. That fever will keep me awake, which is a kindness, so do stay close." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It is beautiful and frightening at once, and I lose myself there. Perhaps your spirits could help me wake." } },
      choices = {
        { text = "Then I will help you wake, Kerlonian.", next = "BACK", reply = "Then please do keep shaking me, for the Dream is very sweet and very hard to leave. Liladris will thank you, I promise.", fx = { align = { light = 1 } } },
        { text = "Stay in the Dream. It is safer.", next = "BACK", reply = "Safer, perhaps, and lovelier by far, but Liladris is waiting on this side. I cannot keep her waiting forever.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That's about the size of it, I'm afraid, and the furbolgs on the road have worked out that I'm an easy meal while I'm dreaming. Wake me with the horn if you can and keep them off me if you can't, and I'll see Liladris again." } },
      choices = {
        { text = "I'll guard you. You'll see Liladris again.", next = "BACK", reply = "Thank you, warrior, and I will try very hard to stay on my feet. Liladris will be so glad to see us both.", fx = { align = { honor = 1 } } },
        { text = "I'll guard you, but I won't carry you.", next = "BACK", reply = "That is fair, and I would not ask it of you. I will walk as far as I can and nap only when I must.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some of them sniff at me and wander off, which is kind of them, and some of them don't, which is why I'm glad of company. In the Dream they're all much friendlier, but I can't stay there, because Liladris is waiting." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some of them sniff at me and wander off, which is kind of them, and some of them don't, which is why I'm glad of company. Your {pet} looks as if it would wake me before anything nasty arrived. I'd be very grateful, and so would Liladris." },
      },
      choices = {
        { text = "My companion and I will keep watch over you.", next = "BACK", reply = "Thank you, and your companion too, for beasts seem to sense when I drift off. I will feel much safer for both of you.", fx = { align = { honor = 1 } } },
        { text = "Sleep on the road and you take your chances.", next = "BACK", reply = "I do take my chances, and I have lost a few of them already. Company is a great deal better than luck.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "That is a kind thought, and a strange one, though I don't think you could carry me far. Keep watch for the furbolgs while I walk, and if I nod off, a horn blown in my ear works better than a gentle shake." },
      },
      choices = {
        { text = "I'll get you home safely, Kerlonian.", next = "BACK", reply = "That is all I ask, and more than I expected from a stranger. Liladris will want to thank you herself.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll watch the road, and help myself to what furbolgs drop.", next = "BACK", reply = "Watch the road, then, and I will not ask about the rest. The furbolgs will hardly miss it.", fx = { align = { honor = -1 } } },
        { text = "Who is Liladris?", next = "liladris" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Perhaps, but I am a druid, and the Dream is not something to fight with a spell. It calls to all of us who walked it, and I would rather wake slowly than be torn from it." },
      },
      choices = {
        { text = "Then we'll do it your way.", next = "BACK", reply = "Thank you, for the Dream is a delicate thing and does not like to be hurried. We will get there, slowly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Torn is better than lost forever.", next = "BACK", reply = "Perhaps, though I have seen druids torn from it who never quite came back whole. I would rather be slow than broken.", fx = { align = { order = -1 } } },
        { text = "Why can't you stay awake?", next = "sleep" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I couldn't say, which is the worry, really, because it always slips away before I wake. Liladris would tell me to stop fretting, but I'd sleep easier with your blessing, if you'll forgive the jest." } },
      choices = {
        { text = "Then you'll have my blessing, and I'll watch over you.", next = "BACK", reply = "Your blessing feels like sunlight on the eyelids, which is the best thing for waking. Thank you, truly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dreams are dreams. Wake up and walk, Kerlonian.", next = "BACK", reply = "If only it were so easy, but the Dream does not let go when it is asked. I am trying, believe me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd trust anyone who'd walk me there, and I'd trust a paladin more than most. Only mind the bears in the woods, for I'd rather you didn't fight them while I'm snoring." } },
      choices = {
        { text = "I'll get you home to Liladris, I swear it.", next = "BACK", reply = "An oath from a paladin, and for me? Then I will try very hard to deserve it, and to stay awake.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take you part way. Then you're on your own.", next = "BACK", reply = "Part of the way is far better than none, and I am grateful for it. I will manage the rest somehow.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A little, because things from the Twisting Nether seem to leave a sort of shadow in the Dream, and I keep walking into it. If you're to see me home to Liladris, could you keep it on the far side of the road?" },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A little, because things from the Twisting Nether leave a sort of shadow in the Dream, and yours is standing in it right now, which makes my head swim. If you're to see me home to Liladris, could you keep it on the far side of the road, where I can't feel it?" },
      },
      choices = {
        { text = "Of course. Your rest matters more than its comfort.", next = "BACK", reply = "That is very kind of you, warlock, and kinder than I expected. The Dream will be gentler without that shadow in it.", fx = { align = { light = 1 } } },
        { text = "It goes where I go. You'll have to dream around it.", next = "BACK", reply = "Then I will try, but the shadow follows me down into it every time. Please, at least walk a little ahead.", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Kerlonian, and I'm meant to be on my way home to Auberdine and my love, Liladris. The trouble is that I keep falling asleep on the road, and the Dream doesn't want to let me go." },
        { id = "h_cond", when = { class = "DRUID" }, text = "Another druid! You'll understand, then, how sweet the Dream is, and how easy it is to stay there longer than you should." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, good, because I'm going to fall asleep again any moment, and it's a comfort to have somebody with a sword nearby when I do." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Your companion would make a fine watchman while I nap, and I nap rather often, I'm afraid." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest? Oh, good, perhaps you can tell me if something in the Dream is following me, because I feel it watching sometimes." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll keep me safe on the road, I'm sure, but you may have to carry me, and I do apologise in advance." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Oh, a warlock. Pardon the yawn, because it's the Dream and not you, though your friend there does give me rather sharp dreams." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I may drift off in the middle of a sentence, because I fall into the Emerald Dream sometimes without meaning to, and I wonder, do your spirits dream?" },
      },
      again = {
        { id = "h_again1", text = "Ask, quickly, before I nod off." },
        { id = "h_again2", text = "Yes? I'm listening, I swear it." },
      },
      choices = {
        { text = "Why do you keep falling asleep?", next = "sleep" },
        { text = "Who is Liladris?", next = "liladris" },
        { text = "Is the road to Auberdine safe?", next = "road" },
        { text = "I've felt the Dream's pull, too.", next = "druidk", when = { class = "DRUID" } },
        { text = "I could carry you home without waking you.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Couldn't a spell keep you awake?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "So I'm to stand guard while you sleep, Kerlonian.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the beasts on the road bother you while you sleep?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is something in the Dream troubling you, Kerlonian?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Will you trust me to get you home, Kerlonian?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does my servant trouble your dreams, Kerlonian?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What is it like to fall into the Dream, Kerlonian?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Stay awake, Kerlonian.", next = "END" },
      },
    },
    sleep = {
      lines = {
        { id = "sleep_default", text = "I walked the Emerald Dream too long, and too deeply, and now some part of me wants to go back every moment. The Horn of Awakening can rouse me, if you'll stay with me and blow it when I drift." },
      },
      choices = {
        { text = "Is the Dream so wonderful?", next = "sleep2" },
      },
    },
    sleep2 = {
      lines = {
        { id = "sleep2_default", text = "It's the forest as it was meant to be, green and whole and quiet. Some of my order think we should spend more time there, and some think we've spent too much already." },
      },
      choices = {
        { text = "The waking world needs you more. Come home.", next = "BACK", reply = "You are right, and Liladris would say the same, only louder. I will try to stay with you.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "If the Dream is that beautiful, I'd stay too.", next = "BACK", reply = "You would, I think, and so would I, if not for her. That is the whole trouble with the Dream.", fx = { align = { order = -1 }, trait = { dreamer = 1 } } },
      },
    },
    liladris = {
      lines = {
        { id = "liladris_default", text = "Liladris Moonriver, who waits for me in Auberdine and who is going to be very cross. I promised her I'd be back before the moon was full, and I've lost track of how many moons it's been." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "road_default", text = "Not for anyone who sleeps in the middle of it, no. There are bears gone mad and Blackwood furbolgs about, so do keep an eye out while I'm dreaming." },
      },
      choices = {
        { text = "I'll watch the road.", next = "BACK" },
      },
    },
    druidk = {
      lines = {
        { id = "druidk_default", text = "Then you know it's no sin to love it, only to forget the people waiting for you. Promise me you'll remember that, when it's your turn." },
      },
      choices = {
        { text = "I promise.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a druid of the Cenarion Circle, and very nearly a bridegroom, if I can stay awake." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream pulls at me every time I close my eyes, and Liladris would very much like me to stay awake. I'm trying, I promise you, but it's beautiful in there." } },
    elune = { { id = "tp_elune", text = "Liladris and I mean to be married under Elune's moon at Auberdine. If I can get there without falling asleep, that is." } },
    nordrassil = { { id = "tp_nordrassil", text = "I studied under the roots of Nordrassil, and I slept through most of my study there. The Circle wasn't surprised." } },
    _none = { { id = "tp_none", text = "I'm not sure, and I think I may have dreamed the answer once and forgotten it." } },
  },
}
