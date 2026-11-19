-- Valormok's camp hands (0.39.0): the food and drink seller and the weaponsmith.
-- Voice: bibles/azshara.md ("Valormok camp hands")
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "kurll", id = TODO_NPC("Kurll"), name = "Kurll", title = "Food & Drink",
  bible = "bibles/azshara.md", role = "vendor", tier = "service",
  communities = { "valormok" }, temper = { "stubborn" }, values = { "dutiful", "careful" },
  notices = { "drink" },

  impression = {
    first = "He serves no grog, knows it's unpopular and doesn't care one bit.",
    third = "{name} met Kurll, the orc who sells food and drink at Valormok, and nothing stronger than milk.",
  },

  greetings = {
    { id = "g_default", text = "Bread, meat, milk and juice. If you're about to ask for grog, save your breath; everyone else has." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You didn't get that drunk on anything I sell, so somebody's smuggling. Don't tell me who, I'd only have to do something about it." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Not much, which suits me fine, since everything I sell comes a long way. Sharp eyes and full bellies keep this camp alive, and you've got the eyes and the Light does the rest, so I'll save my fruit for the grunts." } },
      choices = {
        { text = "Save it for them. The camp comes first.", next = "BACK", reply = "Good, and the grunts will eat better for it. You've got sense, for one of the dead.", fx = { align = { order = 1 } } },
        { text = "I'll take my share like anyone else.", next = "BACK", reply = "Your share, then, and not a crumb more. Everyone eats the same in Valormok.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because the naga are in the water and the elves are on the cliffs, and a camp that drinks dies in its sleep. I lost friends to that mage's betrayal, and I'll not lose more because someone was too drunk to hold a sword, so you'll get milk, and you'll thank me for it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because the naga are in the water and the elves are on the cliffs, and a camp that drinks dies in its sleep. I lost friends to that mage's betrayal, and I'll not lose more to a drunk, so you'll get milk, and your demon can drink nothing at all, because I don't know what it does." },
      },
      choices = {
        { text = "A clear head is wise here. Milk it is.", next = "BACK", reply = "Good. Milk never stabbed anyone in the back, which is more than I can say for that mage.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll drink what I like, Kurll, grog or no grog.", next = "BACK", reply = "Not in my camp, you won't. Drink in Orgrimmar if you must, warlock.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a drunk warrior is a dead warrior when the naga come up the shore at night, and Ag'tor has buried enough of us already. He wants this camp sharp, and so do I, so drink your milk and keep your head." } },
      choices = {
        { text = "Then milk it is. A clear head keeps a warrior alive.", next = "BACK", reply = "That's the answer, and Ag'tor would say the same. Keep your head clear and your axe sharp.", fx = { align = { order = 1 } } },
        { text = "A warrior fights better with a little fire in the belly.", next = "BACK", reply = "Fire in the belly, and naga in the bedroll. Not in my camp, warrior.", fx = { align = { order = -1 } } },
        { text = "Something else, Kurll.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not much, because half the beasts here eat things that glow, and I don't trust anything that's been near those old elf ruins. The coursers are clean enough, I think, but Ogtinc, the furbolg on the cliff, gets cross if you take too many." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not much, because half the beasts here eat things that glow, and I don't trust anything that's been near those old elf ruins. And {pet} can have the scraps, if it doesn't mind fruit peel, because that's mostly what we've got." },
      },
      choices = {
        { text = "I'll hunt what the land can spare and no more.", next = "BACK", reply = "Good. The land here has little enough to spare, and the furbolg watch everything.", fx = { align = { light = 1 } } },
        { text = "I'll hunt what I like. The furbolg can complain.", next = "BACK", reply = "They'll more than complain, hunter, and I'll not feed what you bring from those woods. Hunt carefully.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Cursed enough that I won't feed anything from it to my orcs. The fruit in those woods looks fine and the water looks clean, but the elves who lived here broke something deep, and I'm not betting a warrior's belly on whether it's mended. Everything I sell comes in by wind rider, and I'll pay goblin freight before I bury another orc." } },
      choices = {
        { text = "Keep your rules, Kurll. Discipline keeps this camp alive.", next = "BACK", reply = "They do, shaman, and I'll keep them, whatever anyone grumbles. Thank you for saying it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the warriors forage. They've earned fresh food.", next = "BACK", reply = "They've earned it, aye, and they'll have it in Orgrimmar. Not here, not with the naga watching.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because Ag'tor needs sharp eyes on the woods and steady hands on the axes, and grog gives neither. A rogue knows that better than most, I'd say, since one slip in the dark is all it takes." } },
      choices = {
        { text = "You're right. A clear head saves lives.", next = "BACK", reply = "Good. Tell that to the grunts by the fire, because they think I'm their mother.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little grog never hurt anyone.", next = "BACK", reply = "Tell that to the grunt who fell asleep on watch last spring. We buried him the next week.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll take the fruit.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Hard enough, with naga on the shore and elves in the woods. Every supply run from Orgrimmar risks lives, so I make sure nothing goes to waste, and I'd thank you not to conjure anything that makes my stock look poor." } },
      choices = {
        { text = "I'll respect your stores. Every scrap counts.", next = "BACK", reply = "Good, and the riders who bring them will thank you. Every crate costs a life, near enough.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Conjured food is better anyway.", next = "BACK", reply = "Better? Maybe, but I'll not trust anything I didn't see made. Keep your conjuring to yourself.", fx = { align = { light = -1 } } },
        { text = "I'll take some water.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Because a drunk orc on watch is a dead orc, and we've buried enough of those already. Everyone curses me for it, priests included, but I'll be cursed by the living sooner than mourned by the dead." } },
      choices = {
        { text = "Sharp eyes keep a camp alive. You're right.", next = "BACK", reply = "Good. You'll live longer, priest, and so will the ones you heal.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little grog never hurt anyone's courage.", next = "BACK", reply = "Courage gets orcs killed, if it comes out of a bottle. Not in my camp.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not the fruit, not the mushrooms and not the fish from the bay, if you ask me. A shaman told me the land's sick under the roots, and you druids would know better than me, but I'd rather pay for every sack the wind riders bring than feed this camp poison." } },
      choices = {
        { text = "You're right to be careful. This land isn't healed yet.", next = "BACK", reply = "Good, druid. You're the first in a while who hasn't told me I'm being foolish.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some of it's clean. Waste nothing that the land still gives.", next = "BACK", reply = "Some of it, maybe, but I can't tell which, so none of it goes in my pots. Bring me proof and I'll think on it.", fx = { align = { order = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    dd_betrayed = {
      lines = {
        { id = "dd_betrayed_1",
          text = "He'd push the plate away and stare at the woods, night after night. A dozen warriors died because our commander trusted an elf's word, and Ag'tor carried every one of them like a stone in his gut." },
        { id = "dd_betrayed_2",
          text = "Now the stone's lighter, and the camp can feel it. I've sold more food this week than in a month, and not a drop of grog among it, which tells you something about what really fills a warrior." },
      },
      choices = {
        { text = "Vengeance was owed. I'd do it again.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I hope it brings the dead some peace, not just Ag'tor.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, Kurll.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_betrayed", tags = { "news" }, when = { questDone = TODO_QUEST("Betrayed") },
          text = "Ag'tor ate a full plate last night for the first time since the elf turned on us, and he told me why. You brought him the head of that Rimtori, so eat what you like here; I'll not complain about your appetite." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock. You'll take milk and bread like everyone else, and no grog, because a warlock who can't keep his head is a danger to the whole camp." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. You'll be asking for grog, then, and I'll tell you what I tell every warrior in this camp: milk, juice or water, take your pick." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Bring me fresh meat, if you find any that's safe, because I'm tired of feeding this camp on fruit and good intentions." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, good, then you'll keep a clear head, unlike the warriors who keep pestering me for grog." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue. You'll want something light to eat, I expect, so you can keep moving, and I've got fresh fruit, which is more than the naga ever offer." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage. You'll want plenty of water, I expect, since your kind drink it like it's going out of style, and I've got barrels of it." },
        { id = "h_default", key = true,
          text = "Kurll, and I feed this camp. We're a handful of orcs at the edge of a cursed land with naga in the water and elves in the woods, and a warrior fights no better than his belly, so sharp eyes and full bellies are what I sell." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! You'll take milk with your bread, and no grog, because a priest who can't keep his head is no use to a camp with naga in the water." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! Good, you'll know what's safe to eat in these woods, and I'd be glad to hear it, because I haven't trusted a single berry since we got here." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. You'll not want milk or juice, I'd guess, and you'll not get grog, so you're the easiest customer in Valormok." },
      },
      again = {
        { id = "h_again", text = "Anything else? The bread's going stale while we talk, and a grunt can taste stale bread even in the middle of a battle." },
        { id = "h_again2", text = "Ask, then. I've nothing better to do until supper." },
      },
      choices = {
        { text = "Ag'tor hadn't been eating?", next = "dd_betrayed", when = { questDone = TODO_QUEST("Betrayed") } },
        { text = "They say the land around Valormok is cursed.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Why no grog in an orc camp?", next = "grog" },
        { text = "Your food must come from somewhere far off.", next = "supply" },
        { text = "Why no grog in your camp?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Keeping the camp supplied must be hard.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why no grog in Valormok, Kurll?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why won't you serve grog to warriors, Kurll?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What meat is safe to eat in Azshara, Kurll?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Is any of the food out here safe to eat?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Why no grog at Valormok, Kurll?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does a Forsaken paladin need feeding, Kurll?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    grog = {
      lines = { { id = "gr_default", text = "Because a drunk sentry is a dead sentry, and this camp has buried enough orcs already. The elves at the Thalassian camp killed good warriors who never saw them coming, and I won't sell anything that makes that easier." } },
      choices = {
        { text = "Jediga won't thank you for it.", next = "grog_jediga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grog_jediga = {
      lines = { { id = "gj_default", text = "Jediga thanks nobody for anything, so I'm in good company. She can drink all she likes when she's back in Orgrimmar, and from what she says, that's all she ever thinks about." } },
      choices = {
        { text = "You're right. Sober camps survive.", next = "BACK", reply = "They do, and the ones who live long enough will drink in Orgrimmar. Glad you see it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Warriors have earned a drink.", next = "BACK", reply = "They have, and they'll get it, back home. Not here, not while the naga watch the shore.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      lines = { { id = "s_default", text = "The wind riders bring it from Orgrimmar, a sack or two at a time, and I don't waste a crumb. Kroum grumbles about carrying milk, but he's never once missed a delivery." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I came with the others when Belgrom Rockmaul sent us here. I feed people, and that's all there is to say about it." } },
    advice = { { id = "tp_ad", text = "Eat before you go out to fight in Azshara, because you won't find anything out there you'd want to eat." } },
    thrall = { { id = "tp_thrall", text = "The Warchief doesn't drink on duty, and neither do his warriors, so I don't sell grog. Take it up with Thrall, if you dare." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay ships want to sell me rum by the barrel, and I send them away every time. It's bad for business, but good for the camp." } },
    cairne = { { id = "tp_cairne", text = "The tauren know how to drink milk without complaining, while orcs moan about it like it's poison. I'd like a few more of them in camp." } },
    _none = { { id = "tp_none", text = "Don't know. Ask Ag'tor; he's the one who gives the orders, and he's earned the right with his blood." } },
  },
}

P:NPC {
  key = "gruul_darkblade", id = TODO_NPC("Gruul Darkblade"), name = "Gruul Darkblade", title = "Weaponsmith",
  bible = "bibles/azshara.md", role = "vendor", tier = "service",
  communities = { "valormok" }, temper = { "gruff" }, values = { "honor", "craft" },
  notices = { "class" },

  impression = {
    first = "He has a short temper and a long grudge against Thalassian elves.",
    third = "{name} met Gruul Darkblade, the orc weaponsmith at Valormok.",
  },

  greetings = {
    { id = "g_default", text = "Lok'tar. If you've come for a blade, you've come to the right orc, because Valormok needs fighters with sharp steel more than it needs anything else." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Let me see that edge before you go anywhere near the elves. A dull blade gets an orc killed in this place." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Daggers, eh? Fine, as long as you use them on the elves and not on anybody standing in this camp." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "A hammer doesn't need an edge, but it needs a true head, and I'll give it one. You'll be going after the Thalassians, I hope, because every elf in these woods owes Valormok a debt, and I'd like to see it paid in Light." } },
      choices = {
        { text = "I'll fight the elves fairly, face to face.", next = "BACK", reply = "Fair, then, and I'll respect it. Face to face is the orc way.", fx = { align = { honor = 1 } } },
        { text = "Every elf here owes blood. I'll collect it however I can.", next = "BACK", reply = "However you can, and I'll sharpen the hammer for it. Valormok remembers its dead.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A sharp one, swung fast, before they get a spell off. The elves who killed our warriors were mages, and a mage doesn't need long to finish you, so you strike first and you strike hard, and you don't stop to talk." } },
      choices = {
        { text = "I'll strike first, but I'll face them, not knife them in the back.", next = "BACK", reply = "Good. Strike first and look them in the eye. That's the honest way.", fx = { align = { honor = 1 } } },
        { text = "I'll strike first, and from behind if that's what it takes.", next = "BACK", reply = "Do what you must, but I'd rather you faced them. They'll not respect a back-stabber, and neither will I.", fx = { align = { honor = -1 } } },
        { text = "Something else, Gruul.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Axes and knives, and I'll put an edge on anything that has one, though I leave the bowstrings to the hunters themselves. A hunter's knife does more work than anyone thinks, because the skinning is half the job." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Axes and knives, and I'll put an edge on anything that has one, though I leave the bowstrings to the hunters themselves. And keep {pet} away from my whetstone. The last beast that came by here chewed the handle off a perfectly good axe." },
      },
      choices = {
        { text = "I'll keep my blades sharp and my kills clean, Gruul.", next = "BACK", reply = "Good. A clean kill and a sharp knife, that's a hunter worth respecting.", fx = { align = { light = 1 } } },
        { text = "A dull knife hurts more. Sometimes that's the point.", next = "BACK", reply = "Then you're a crueller hunter than I'd like, and I'll not sharpen for it. Clean kills, or none.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Nothing, shaman, not one good seam of ore in these cursed hills, so every bar I work comes in by wind rider. The old elves' stone lies everywhere, but it's soft and full of their magic, and I'll not forge with it. Give me honest iron from Durotar over anything an elf ever left lying about." } },
      choices = {
        { text = "Honest iron for an honest blade. I'd want no other.", next = "BACK", reply = "Good. That's a shaman who knows steel, and I'll sharpen yours with care.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Elf stone or iron, use whatever kills naga fastest.", next = "BACK", reply = "Elf stone breaks, shaman, and so will your blade with it. Honest iron or nothing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I blame the elf who did it, but I watch every mage the same way now. You're Horde, so I'll sell to you, but don't expect me to turn my back while you're casting." } },
      choices = {
        { text = "I understand. Rimtori will answer for it.", next = "BACK", reply = "She will, and every orc in this camp will see to it. Glad you understand.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your fear makes you weak, smith.", next = "BACK", reply = "Maybe, but I'm alive, and the ones who trusted her aren't. Weak and alive suits me fine.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll take a dagger.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Not many, and they don't take care of what they buy. A demon's fire ruins an edge faster than anything, so if you want my blades to last, keep them away from your pet's flames." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Not many, and they don't take care of what they buy. A demon's fire ruins an edge faster than anything, so if you want my blades to last, keep that one away from them, and keep it away from my whetstone while you're choosing." },
      },
      choices = {
        { text = "I'll take care of my weapons.", next = "BACK", reply = "Good, and they'll last you. I'll not sharpen anything your pet's breathed on.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A blade's a tool. It'll break eventually.", next = "BACK", reply = "Everything does, eventually, but not my blades, not if you care for them. Do better.", fx = { align = { order = -1 } } },
        { text = "I'll see what you've got.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Curse them, burn them, wither them with that shadow of yours, I don't much care how, so long as they stop. They came here with a mage and a smile, and they left with a camp full of our dead." } },
      choices = {
        { text = "I'll defend this camp, but I won't torment anyone.", next = "BACK", reply = "Fair enough, priest, and I'll not ask more. Defending this camp is all I need.", fx = { align = { light = 1 } } },
        { text = "Shadow suits them. I'll make them suffer.", next = "BACK", reply = "They've earned it, and I'll not stop you. Make them remember Valormok.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because their mage led us out here and then turned on us, and the elves in these woods have been picking off orcs ever since. You might speak for the forest, tauren, but the elves speak for it too, with arrows, and I'd sooner give you something sharp than hear you defend them." } },
      choices = {
        { text = "Not every elf betrayed you. Judge the mage, not her kind.", next = "BACK", reply = "Maybe not, tauren, but they all walk the same woods. I'll judge the mage first and the rest after.", fx = { align = { light = 1 } } },
        { text = "They chose their side. Sharpen the axes, Gruul.", next = "BACK", reply = "They did, and the axes are always sharp. Lok'tar, tauren.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Gruul.", next = "BACK" },
      },
    },
    dd_rimtori = {
      lines = {
        { id = "dd_rimtori_1",
          text = "More than anyone? Maybe not more than Ag'tor, but close. I forged the axes those warriors carried into that bargain, and they never got the chance to swing them before her magic took them." },
        { id = "dd_rimtori_2",
          text = "I've cursed every Thalassian since, and I know that isn't fair, not every elf is her. But I'm a smith, not a priest, and fair is a thing that happens to other people." },
      },
      choices = {
        { text = "Your grudge is earned. Keep it sharp.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Not every elf is her. Don't let it rot you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, Gruul.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_rimtori", when = { killed = { name = "Rimtori" } },
          text = "So the elf witch is dead, and it was your blade that did it! Hand it here and let me see the edge, because any weapon that took her deserves a long look from a proper smith." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior of the Horde. Let me see that edge, because if you're going after elves, I want it sharp enough to shave with." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. You'll want your bow strung and your knives sharp, because the elves in these woods are faster than your beast and twice as mean." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? Then you'll swing a mace or an axe with lightning behind it, and I'll make sure the edge is worth the lightning." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage. You'll not be needing my weapons, I expect, unless you want a dagger for when your spells run dry. The elves who killed our warriors were mages too." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock. You'll want a blade that can take a beating, since your demon does most of the fighting and you're left with whatever's in your hand." },
        { id = "h_default", key = true,
          text = "Gruul Darkblade, weaponsmith for Valormok. Axes, swords, maces, whatever you swing, and I'll have it sharp before you go hunting elves or naga, because both of them are hunting us." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, at my forge. You'll not want your mace sharpened, I'd guess, but the elves who killed our warriors won't stop for prayers, so carry something with an edge." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID", faction = "Horde" }, text = "A druid, with claws of your own when you need them. You'll not want my axes, I'd wager, but your friends will, and the elves here aren't shy about killing tauren." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. Bring me that hammer, because the elves who killed our warriors won't care what you pray to, and neither will the edge." },
      },
      again = {
        { id = "h_again", text = "Ask what you came to ask, and I'll keep the whetstone moving while you do." },
        { id = "h_again2", text = "Speak, but quickly. I have blades to finish, and the dead of this camp are still waiting to be avenged." },
      },
      choices = {
        { text = "You wanted Rimtori dead more than anyone.", next = "dd_rimtori", when = { killed = { name = "Rimtori" } } },
        { text = "What does Azshara's earth give a weaponsmith, Gruul?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What happened to this camp's warriors?", next = "elves" },
        { text = "I'd guess a heavy weapon works best against naga.", next = "naga" },
        { text = "Do you blame all mages for what that elf did?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do warlocks buy many weapons?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would you have me curse the Thalassian elves, Gruul?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What makes a good edge against elves, Gruul?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Hunters could use your weapons too, Gruul.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why do you hate the elves so much, Gruul?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Will you keep a paladin's hammer true, Gruul?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    elves = {
      lines = { { id = "e_default", text = "The Thalassian elves came to us as friends, and Belgrom Rockmaul believed them. Then they turned on us, and good warriors died in these woods, and now Ag'tor wants the blood of the mage who led them." } },
      choices = {
        { text = "Ag'tor must have a plan.", next = "elves_plan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_plan = {
      lines = { { id = "ep_default", text = "Ask him yourself; he'll tell you everything he wants done, and he'll pay you for it. I only know that every blade I sharpen is meant for those elves, and I sharpen them well." } },
      choices = {
        { text = "They'll pay for what they did.", next = "BACK", reply = "They will, and I'll sharpen every blade for it. Lok'tar.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Revenge just gets more orcs killed.", next = "BACK", reply = "Maybe it does, but standing still gets them killed too. I'll sharpen the blades and let Ag'tor decide.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga = {
      lines = { { id = "n_default", text = "Something heavy that cracks scales, like a mace or a big axe. A sword will do, but it bounces off a naga's hide if you swing it like an elf, so swing it like an orc." },
        { id = "n_orc", when = { race = "Orc" }, text = "Something heavy, {g:brother|sister}, like a mace or a big axe that cracks scales. You know how to swing it, so swing it hard and keep swinging." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I make weapons. I've made them for longer than you've been alive, and I'll make them until I can't." } },
    advice = { { id = "tp_ad", text = "Never fight with a dull blade. Sharpen it every night, even if you don't think you need to, because Spitelash scales chip an edge faster than rock." } },
    rimtori = { { id = "tp_rimtori", text = "The elf mage who led them. Ag'tor wants her head, and every blade on my rack is for that." } },
    thrall = { { id = "tp_thrall", text = "The Warchief carries the Doomhammer, and that is a weapon. Everything I make is a pale shadow of it, and I make good weapons." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Iron make fine steel and serve a lord of fire, and I would like their forges without their masters. I will settle for their ore." } },
    tyrande = { { id = "tp_tyrande", text = "The night elves' priestess sends archers to pick off our woodcutters. One day I will sharpen an axe for her personally." } },
    booty_bay = { { id = "tp_booty_bay", text = "Goblin blades from Booty Bay look fine and break in a week, and I spend half my days fixing them. That is good business, but bad for my mood." } },
    _none = { { id = "tp_none", text = "I couldn't tell you; ask me about blades and I'll talk all night, for a good edge is an orc's best friend." } },
  },
}
