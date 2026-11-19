-- Stonetalon Peak's hippogryph master (0.39.0). Voice: bibles/unsung.md.
-- Classic: Teloren stands on Stonetalon Peak (Thal'darah Overlook is Cataclysm and is never named).
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC = P.TODO_NPC

-- Teloren: hippogryph master at Stonetalon Peak.
P:NPC {
  key = "teloren", id = TODO_NPC("Teloren"), name = "Teloren", title = "Hippogryph Master",
  prejudice = { race = "Gnome", amount = 8, why = "He watches the Venture Company's shredders eat Stonetalon; machines and their makers have become one thing in his mind, which isn't fair to the gnomes." },
  bible = "bibles/unsung.md", role = "flightmaster", tier = "service",
  communities = { "stonetalon_peak" }, temper = { "calm", "watchful" }, values = { "duty", "nature" },
  notices = { "race", "weary", "lock_armor" },
  impression = {
    first = "He watches the smoke in the valleys as if counting it.",
    third = "{name} met Teloren, the watchful hippogryph master of Stonetalon Peak.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "A gnome, on Stonetalon Peak. I'll be short with you, I'm afraid; I've spent a year watching machines chew through the valleys below, and I've forgotten how to like the people who build them." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "I owe you an apology, little friend, and I'm not good at them. You're not the Venture Company, and I shouldn't have looked at you as if you were." },
    { id = "g_default", text = "You climbed all the way up here on foot? Then you've earned a ride down, wherever you're bound, and Elune keep the wind steady under you." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the peak again. The birds know your scent by now, so they won't fuss." },
  },

  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "I've heard your people can step off a ledge and drift down on the wind. That's a fine trick for going down, but a hippogryph takes you back up again." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look like the mountain chewed you up on the way. Rest by the inn a while before you fly, because the birds don't like a rider who can't hold on." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Your skin is wrapped in demon hide, and the hippogryphs can smell it even with your demon dismissed. Let it fade before you mount, because a frightened hippogryph over Stonetalon is a long way to fall." },
  },

  start = "hello",
  nodes = {
    prej_teloren = {
      big = true,
      lines = { { id = "prej_teloren_default", text = "I suppose I do. From up here I watch the Venture Company's shredders tear down trees that were old when Ashenvale was young, and the smoke goes up every morning. When I see a gnome with grease on his gloves, I see those machines, though I know you aren't the ones driving them." } },
      choices = {
        { text = "Machines aren't evil. The goblins who use them are the problem.", next = "BACK", reply = "Perhaps you're right, and I've no quarrel with you, only with the smoke. Forgive an old watcher his suspicions; they're the only thing that grows fast up here.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Some trees have to fall for progress. That's the world now.", next = "BACK", reply = "Then the world has grown poorer than I feared. Those trees were saplings when Elune's light first touched this mountain, and no progress will grow them back.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Then let me show you a gnome who protects the trees.", next = "prej_teloren_calm", fx = { affinity = 1 } },
        { text = "Can the shredders be stopped?", next = "prej_teloren_why" },
      },
    },
    prej_teloren_why = {
      lines = { { id = "prej_teloren_why_default", text = "The Sentinels try, and the druids at the Talondeep path try, but the Venture Company has more machines than we have arrows. Every one we stop, they replace in a week from somewhere south of Ratchet." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_teloren" }, { text = "Something else.", next = "BACK" } },
    },
    prej_teloren_calm = {
      lines = { { id = "prej_teloren_calm_default", text = "I'd like that more than I can say. Go down to Windshear Crag and break a few of their machines, and I'll stop looking at your gloves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That the goblins keep cutting and the forest keeps dying. My birds fly above it, but I would rather they flew above something green." } },
      choices = {
        { text = "The forest will grow back, given help.", next = "BACK", reply = "With help, yes, and with a great deal of time, which the kaldorei have and the goblins do not. I hope I live to see my birds fly over green again.", fx = { align = { light = 1 } } },
        { text = "Burn the goblins out before they burn the forest.", next = "BACK", reply = "I've wished it, on the worst mornings, and I'm not proud of that. But fire answering fire only leaves more ash for the druids to sweep.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They have, in older days, and they would again if Darnassus called for it. For now I keep them for messengers and travellers, and I watch the smoke from the vale so I'll know when that day is coming." } },
      choices = {
        { text = "If that day comes, I'll answer it alongside the Sentinels.", next = "BACK", reply = "Then I'll know your face when the day comes, and I'll be glad of it. Elune keep your blade sharp until then.", fx = { align = { honor = 1 } } },
        { text = "Your wars aren't mine. I fight for my own cause.", next = "BACK", reply = "Then go with your own cause, and may it be a good one. The Sentinels will fight for the mountain whether or not you stand with them.", fx = { align = { honor = -1 } } },
        { text = "Something else, Teloren.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only the harpies, and only because they come in numbers, which no hippogryph will face alone. I'd welcome a hunter who could keep the cliffs clear while my birds rest." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Only the harpies, and only because they come in numbers, which no hippogryph will face alone. Your {pet} is watching my birds, {class}, and they're watching it right back. I think they'll get along, if neither of them blinks." },
      },
      choices = {
        { text = "I'll keep the cliffs clear while your birds rest.", next = "BACK", reply = "Then you have my thanks, and so will the birds. Two of them came back last week with talon marks along their flanks.", fx = { align = { honor = 1 } } },
        { text = "Harpies are a soldier's problem. I'll hunt elsewhere.", next = "BACK", reply = "As you like, though the harpies make no such distinction. I'll keep my birds close to the roost until someone else comes.", fx = { align = { honor = -1 } } },
        { text = "Something else, Teloren.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Often, because the Venture Company sends scouts up the cliffs to see what the druids are planting, and my birds can't follow them into the rocks. If you find one, tell me where he climbed, so I can watch that path from the air." } },
      choices = {
        { text = "I'll find the path and tell you, nothing more.", next = "BACK", reply = "That is all I ask. I'll keep a bird watching that path from first light, and we'll see who uses it.", fx = { align = { honor = 1 } } },
        { text = "I'll find the scout, and he won't climb back down.", next = "BACK", reply = "I didn't ask for that, and I'd rather not hear of it. But I won't pretend to weep for a Venture scout, either.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No, because a portal can't see the Charred Vale burning from above, and a hippogryph's rider sees everything on the way. You'd be surprised how much of what the Keeper knows came to him from someone looking down out of the sky." } },
      choices = {
        { text = "The old ways have a wisdom no spell replaces.", next = "BACK", reply = "They do, and the Keeper would agree with you. Look down as you fly, and you'll learn what the mountain is trying to say.", fx = { align = { order = 1 } } },
        { text = "Quicker roads will win out sooner or later, Teloren.", next = "BACK", reply = "Perhaps they will, and perhaps I'll be the last of the hippogryph masters. Until then, my birds still see more than any portal.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The druids in the Talon Den, likely, and whoever was caught in the fires of the vale. I can fly you to the edges, but I can't fly you into the smoke." } },
      choices = {
        { text = "Then I'll walk into it myself to find them.", next = "BACK", reply = "Then Elune go with you, because the smoke has swallowed braver hearts than ours. Wet a cloth before you go in.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the smoke is that thick, I'll stay out.", next = "BACK", reply = "Wise, if not brave, and I'll not blame you for it. The druids would rather you lived to help another day.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The smoke in the vale, and the Venture Company's saws at Windshear, because the mountain has not been quiet since they came. I watch and count, but someone has to go down and do something about it." } },
      choices = {
        { text = "I'll go down and put a stop to the burning.", next = "BACK", reply = "Then the mountain has a friend, and it needs every one. I'll watch for you from the roost; a smoke-stained traveller is easy to spot.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The fires aren't my concern. I'm only passing through.", next = "BACK", reply = "Then pass through quickly, because the smoke follows travellers. I'll fly you onward when you're ready.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They will, because the Sentinels say you fight for the Alliance, and I trust their word over my own unease. Send away whatever walks with you before you mount, though, because a frightened hippogryph over Stonetalon is a long way to fall." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They will, because the Sentinels say you fight for the Alliance, though the whole roost is shifting and hissing at your {pet} as we speak. Dismiss it before you mount, because a frightened hippogryph over Stonetalon is a long way to fall." },
      },
      choices = {
        { text = "I'll dismiss it before I fly.", next = "BACK", reply = "Thank you. My birds will carry you gently, now that they can't smell it.", fx = { align = { light = 1 } } },
        { text = "What walks with me rides where I ride.", next = "BACK", reply = "Then it will ride alone, because no hippogryph of mine will take it. Dismiss it, or walk down the mountain.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Teloren, and I keep the hippogryphs here on Stonetalon Peak. From here they'll carry you to Auberdine, to Astranaar or down to Nijel's Point in Desolace, which is far quicker than the paths." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, come to see the Keeper? He'll be glad of it. Most who climb this far come for the Peak's sake, but few of them can feel what the Vale has lost." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You came up the last switchback so quietly the birds didn't stir, and they hear nearly everything. I'd like to know where you learned that, though I don't suppose you'll tell me." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "So you're a mage, and I've heard your kind can open doorways across the whole world. I hope you never teach that trick to too many people, or my hippogryphs and I will have nothing to do but watch the smoke." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. My hippogryphs will carry you anywhere you need, though they'll want your blade stowed before they let you on their backs." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and I can see by how your beast watches the hippogryphs that it knows what a flying predator is." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll see the smoke from up here too, I expect, and you'll know there are wounded somewhere beneath it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. My birds will carry you, though you'll want to hold on tight, because the mountain winds don't respect armour." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "The hippogryphs will carry you, but they've been ruffling their feathers since you walked up, and so have I." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who speaks to the winds. My hippogryphs fly through the smoke from the vale every day and tell me nothing, so perhaps the wind will tell you." },
      },
      again = {
        { id = "h_again", text = "What else? The wind's steady, so there's no hurry; my people learned long ago that haste is a young race's habit." },
        { id = "h_again2", text = "Ask whatever you like while the hippogryphs settle their feathers." },
      },
      choices = {
        { text = "You look at my hands like they're holding a wrench, Teloren.", next = "prej_teloren", when = { prejudiced = true } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "What do you see from up here?", next = "see" },
        { text = "Flying in these mountains must be hard.", next = "fly" },
        { text = "Why keep a post this high?", next = "post" },
        { text = "Where did you keep birds before the Peak?", next = "darkshore" },
        { text = "Who else keeps watch up here?", next = "peakfolk" },
        { text = "A quiet walker could be of use to you up here.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you really think magic could replace your hippogryphs?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do your hippogryphs ever carry Sentinels into battle, Teloren?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the hippogryphs fear predators up here, Teloren?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Someone below must need a healer, Teloren.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you have a paladin watch for from up here?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Will your hippogryphs carry me, and what walks with me, Teloren?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What does the smoke from the vale tell you, Teloren?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Teloren.", next = "END" },
      },
    },
    see = {
      lines = {
        { id = "se_default", text = "Smoke, mostly. The goblins of the Venture Company are cutting and burning their way through the valleys to the south, and the Charred Vale still smolders where the fires ran. On a clear day I can see the Barrens beyond, yellow as dry grass." },
      },
      choices = {
        { text = "Can nothing stop the goblins?", next = "see2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    see2 = {
      lines = {
        { id = "se2_default", text = "Keeper Albagorm and his kin are trying, and anyone with a blade who'll help them. But the goblins are many, and they care only for what the mountain can be sold for, so it will take more than a few of us." },
      },
      choices = {
        { text = "Then they must be stopped by force.", next = "BACK", reply = "Force, then, since nothing else has reached them. The Sentinels are ready, and the Keeper will not hold them back much longer.", fx = { align = { light = -1 }, learn = { "venture_company" } } },
        { text = "Heal what's burned first. The fighting can wait.", next = "BACK", reply = "You speak like the Keeper himself, and he'd be glad to hear it. Heal first, and let the Sentinels keep the saws away while you do.", fx = { align = { light = 1 }, learn = { "venture_company" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    fly = {
      lines = {
        { id = "fl_default", text = "The winds here come up off the cliffs without warning, and a young bird can be thrown off course in a moment. I only send the older ones out from the Peak, and I'd ask you to hold on tightly when you cross the ridges." },
      },
      choices = {
        { text = "What becomes of the young birds, then?", next = "fly2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post = {
      lines = {
        { id = "po_default", text = "Because the Keeper is here, and the druids who serve him, and they need a way to reach the rest of our people quickly. Besides, nothing on foot can surprise us up here, and that matters in these mountains." },
      },
      choices = {
        { text = "Has anyone ever tried to surprise you?", next = "post2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post2 = {
      big = true,
      lines = {
        { id = "po2_default", text = "The Horde holds Sun Rock to the east, and their wind riders cross our sky now and then, though they've never come to the Peak. I watch them as they watch me, and so far neither of us has done more than watch." },
      },
      choices = {
        { text = "Keep watching, and let the peace hold as long as it can.", next = "BACK", reply = "That is my hope, and I'm glad you share it. Sun Rock has kept to its rock so far, and I'd like it to stay that way.", fx = { align = { honor = 1 } } },
        { text = "Watching isn't enough. One day they'll come, so prepare.", next = "BACK", reply = "Perhaps they will, and I've told the Sentinels the same. Still, I would rather be ready and wrong than unready and right.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fly2 = {
      lines = {
        { id = "fl2_default", text = "They stay on the Peak and learn the winds from the ledges, a little farther each day, until they can ride a gust without panicking. It takes a season or more, and I lose a few feathers of my own teaching them." },
        { id = "fl2_druid", when = { class = "DRUID" },
          text = "They learn the winds slowly from the ledges, much as you must have learned your first shape, {class}. Some take a season, and some take a year, and I can't hurry either kind." },
      },
      choices = {
        { text = "Patient work. I respect that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkshore = {
      lines = {
        { id = "dk_default", text = "On the Darkshore coast, flying the sea winds out of Auberdine, which are gentle beside these. I asked to come here when the Keeper sent word that the Peak needed a steady hand, and I haven't regretted it, though I miss the sound of the surf." },
      },
      choices = {
        { text = "Why leave somewhere gentler for this?", next = "darkshore2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkshore2 = {
      big = true,
      lines = {
        { id = "dk2_default", text = "Because the gentle places can look after themselves, and Stonetalon can't. The Keeper is old and his druids are few, and someone has to carry word from here to Darnassus before the goblins have cut the whole mountain bare." },
      },
      choices = {
        { text = "Duty belongs where it's needed most, not where it's easy.", next = "BACK", reply = "Spoken like a Sentinel, and Darnassus could use more like you. The Keeper will be glad of you, even if he only shows it by talking longer.", fx = { align = { order = 1 } } },
        { text = "I'd rather choose my own road than follow a summons.", next = "BACK", reply = "Then choose it, and I'll not think less of you. But the mountain will remember who came when it called.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peakfolk = {
      lines = {
        { id = "pf_default", text = "Keeper Albagorm watches over the Talon Den and the grove, and Faralia keeps the inn warm for anyone who climbs this far. The Sentinels walk the paths, and I watch the sky, and between us very little reaches the Peak unseen." },
      },
      choices = {
        { text = "What's the Keeper like?", next = "peakfolk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peakfolk2 = {
      lines = {
        { id = "pf2_default", text = "Old and patient, and slow to anger, though the burning of the vale has angered him. When he speaks of the trees, he speaks of them as if each one had a name, and perhaps to him they do." },
      },
      choices = {
        { text = "I'll go and hear him for myself.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    venture_company = { { id = "tp_vc", text = "The goblins cut and burn the valleys south of here. I see their smoke every morning." } },
    background = { { id = "tp_bg", text = "I keep the hippogryphs on Stonetalon Peak. Before that I flew the coast of Darkshore, which was gentler." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande Whisperwind leads the night elves, and her Sentinels keep our borders. I serve her by keeping the hippogryphs ready, which is a small thing, but a necessary one." } },
    thrall = { { id = "tp_thrall", text = "The orcs' Warchief claims he wants peace, and perhaps he does. But his people's axes are in Ashenvale, and the goblins' smoke is in Stonetalon, and I watch both from this peak." } },
    elune = { { id = "tp_elune", text = "Elune watches over the hippogryphs as she does over us. I thank her each night that none of mine were lost to the goblins' smoke." } },
    teldrassil = { { id = "tp_teldrassil", text = "Teldrassil is our new home, and the hippogryphs fly there from every corner of Kalimdor. I miss the old forests, but Teldrassil is beautiful in its own way." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask Faralia at the inn, or the Keeper, if he's not too deep in his thoughts; his memory runs back further than mine." } },
  },
}
