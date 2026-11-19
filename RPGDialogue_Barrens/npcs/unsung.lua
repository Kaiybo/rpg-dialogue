-- The Barrens' working people with no quests of their own: the Crossroads' wind rider
-- master, supplier, herb seller and bowyer, Camp Taurajo's wind rider master, and Ratchet's
-- flight master and weaponsmith. Voices: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- The Crossroads
---------------------------------------------------------------------------

-- Devrak: the Crossroads' wind rider master.
P:NPC {
  key = "devrak", id = TODO_NPC("Devrak"), name = "Devrak", title = "Wind Rider Master",
  bible = "bibles/unsung.md", role = "flightmaster", tier = "service",
  communities = { "crossroads" }, temper = { "gruff" }, values = { "dutiful", "proud" },
  notices = { "travel", "class", "lock_steed" },
  impression = {
    first = "He knows which routes the harpies like to watch.",
    third = "{name} met Devrak, the wind rider master of the Crossroads.",
  },
  greetings = {
    { id = "g_fly", text = "Need to fly, {class}? The wind riders are rested, and the sky over the Barrens is clear enough for an orc to see the Kolkar from the clouds." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The beasts remember you, so they won't bite. Probably." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and your beast is eyeing my wind riders like they're dinner. Keep it close, because they bite back." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Keep that horse with the burning hooves well back from the roost, because my wind riders are pacing and one has already bitten through its tether. They'll fly you, but they won't breathe the same air as that thing." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They'll carry anyone who pays. Some of the older riders don't like the Light; they fought human knights in the Second War, and they remember. But the wind doesn't care what you pray to, and neither do the beasts." } },
      choices = {
        { text = "Then I'll ride and give them no reason to mind.", next = "BACK", reply = "Then they'll soon forget the glow and remember the rider. The wind carries the honest ones lighter, or so the old orcs say.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Their memories are no concern of mine.", next = "BACK", reply = "They're no concern of yours, but they're the ones holding the reins. Mind your manners at the roost, or you'll be walking to Ratchet.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The riders come down with arrows in them more often than I'd like, because the harpies over the Dry Hills aren't shy. I'd rather have a priest at the roost than a goblin's ointment, and so would my wind riders." } },
      choices = {
        { text = "I'll tend your riders whenever I pass through, Devrak.", next = "BACK", reply = "Then you'll be welcome here every time, and the riders will learn your smell. A wind rider never forgets who pulled the arrow out.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'm here to fly, not to nurse beasts.", next = "BACK", reply = "Then fly, and I'll find a goblin with ointment. Just don't be surprised if your beast takes the long way round over the harpies.", fx = { align = { light = -1 } } },
        { text = "Something else, Devrak.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They'd like to, and I've caught more than one diving at a zhevra herd on the way to Ratchet. I feed them well enough that they shouldn't need to, but a wind rider is a hunter at heart, same as you, and the Barrens is a long way to fly past a meal." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They'd like to, and they'd count your {pet} as fair game if it wandered off. Keep it by your side near the roost, because my wind riders know a hunter's beast from a meal, mostly." },
      },
      choices = {
        { text = "A hunter at heart deserves respect, beast or rider.", next = "BACK", reply = "Spoken like one who knows beasts, and they'll know it too. Treat them as hunters, and they'll carry you like one of their own.", fx = { align = { order = 1 } } },
        { text = "A beast that hunts without leave needs a firmer hand.", next = "BACK", reply = "A firmer hand gets you thrown into the grass, and I've seen it happen to bigger orcs than you. Respect works better up there, believe me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Everywhere the wind riders fly, from what I hear. The Kolkar raid the roads, the quilboar raid the caravans and the humans at Northwatch Hold raid whoever they please, so a warrior with wings can be where he's needed by sundown." } },
      choices = {
        { text = "Then fly me where the Horde needs me most.", next = "BACK", reply = "Then climb up, warrior, and I'll send you where the fighting's hottest. The Horde will be glad of you by sundown.", fx = { align = { honor = 1 } } },
        { text = "Fly me where the bounties are richest, Devrak.", next = "BACK", reply = "Bounties are richest where the arrows are thickest, so mind yourself. I'll fly you, but I won't fly you back if you're in pieces.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every afternoon, when the wind turns hot off the plains. The riders open their wings into it and hang there without a single beat, and I don't need a shaman to tell me something out there is holding them up." } },
      choices = {
        { text = "The air spirits deserve thanks for every safe flight.", next = "BACK", reply = "They do, and the riders seem to agree, in their own way. Leave a word for the wind when you land, and it'll carry you home again.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The riders fly on their own wings. Leave the spirits out of it.", next = "BACK", reply = "Maybe so, but I've never seen wings hang still without help. Fly with whatever you believe, and the wind won't mind either way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Somebody tried it last spring, and the wind rider took two of his fingers before he got anywhere near a saddle. The beasts know their riders by smell, so if you want to sneak past them, you'd best smell like an honest orc." },
      },
      choices = {
        { text = "Then I'll fly honestly, with your blessing.", next = "BACK", reply = "That's the only way to fly from my roost. The beasts will know you by your smell soon enough, and they'll be glad of it.", fx = { align = { honor = 1 } } },
        { text = "I'd find a way past them, if it came to it.", next = "BACK", reply = "You'd lose more than two fingers trying, and I'd let them have them. Try it, and you'll find out how a wind rider deals with a thief.", fx = { align = { honor = -1 } } },
        { text = "What are the wind riders like?", next = "riders" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because teleporting only takes you to the big cities, and my wind riders go wherever the Horde has a roost. Besides, I've never seen a mage enjoy the view over the Barrens on the way, and the view is the best reason to fly." },
      },
      choices = {
        { text = "Fair point. A wind rider's flight it is.", next = "BACK", reply = "Good choice, and you'll thank me when you see the sunset over the Barrens. I've flown that route a hundred times, and I still look down.", fx = { align = { order = 1 } } },
        { text = "Views are for tourists. I'll take the shortcut.", next = "BACK", reply = "Then take your shortcut, and miss the best view in Kalimdor. The riders won't be sorry to carry one less grumbler.", fx = { align = { order = -1 } } },
        { text = "Is it safe flying over the Barrens?", next = "safe" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They won't, not since the druids went down into that place, because the air above it smells wrong to them and they veer off every time. I route every flight around it now, and not one wind rider has ever told me I was wrong to." } },
      choices = {
        { text = "Trust the beasts. Keep every flight well clear of it.", next = "BACK", reply = "That's what I do, and they've never steered me wrong. The beasts bank away from that place without my asking, and I've learned not to argue with them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Avoiding the place won't heal it. Someone should go and look.", next = "BACK", reply = "Someone should, but not with my riders. Go down on your own feet if you must, and may the spirits watch over you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They fear anything that smells of the Twisting Nether, and they're right to, because a frightened wind rider throws its rider over the Barrens. Send your demon away before you climb up, and they'll carry you anywhere, from Ratchet to Orgrimmar." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "They fear anything that smells of the Twisting Nether, and you've brought it right up to their perches, so look how they're pulling at their tethers. Send your demon away before you climb up, and they'll carry you anywhere, from Ratchet to Orgrimmar." },
      },
      choices = {
        { text = "I'll dismiss it before I fly. They've earned that.", next = "BACK", reply = "Then you'll find them gentle as lambs, and they'll carry you anywhere you like. Thank you for that, warlock.", fx = { align = { light = 1 } } },
        { text = "They'll learn to carry whatever I bring.", next = "BACK", reply = "They won't, and they'll throw you in the grass to prove it. Send the thing away, or walk.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin wants a wind rider. The beasts will carry you; I can't say the harpies will be as polite." },
        { id = "h_default", key = true, text = "I'm Devrak, and I keep the wind riders of the Crossroads. They'll take you to Orgrimmar, Thunder Bluff, Ratchet and anywhere else the Horde has a roost, faster than any kodo, and they only respect a rider who doesn't show fear." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The wind riders settle down when one of you is nearby, so come up the tower any time, because you'll make my job easier." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. The wind riders know your scent changes when you do, so tell me now if you're coming up the tower as a cat, because I'd like to warn them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The wind riders don't care how hard you hit, so hold on tight and keep your axe strapped down." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast will want its feet back on the ground the moment you land, but the wind riders don't mind sharing the sky with it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Wind riders don't care what you pray to, but if you're one of the Forsaken, give them a moment to get used to you before you climb on." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The wind riders smell your demon before they see you, so wait at the foot of the tower while I calm them down." },
      },
      choices = {
        { text = "You must feel the air spirits up here on the roost.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the wind riders fly over the Wailing Caverns, Devrak?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Tell me about the wind riders.", next = "riders" },
        { text = "Flying over the Barrens doesn't look safe.", next = "safe" },
        { text = "Your roost looks easy to slip onto uninvited.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why fly at all, when a mage can teleport?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'd guess the wind riders hunt for themselves, Devrak.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Where are warriors needed most, Devrak?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Your riders must need a priest now and then, Devrak.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the wind riders fear my demon, Devrak?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Will your wind riders carry a paladin, Devrak?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not now.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? The beasts are restless, and so am I." } },
    },
    riders = {
      lines = { { id = "r_default", text = "They're proud beasts with a lion's body and a bat's wings, and they bite if you don't respect them. The Horde has ridden them since we came to Kalimdor, because nothing else crosses all this empty land as fast." } },
      choices = { { text = "How do you train them?", next = "riders_train" } },
    },
    riders_train = {
      lines = { { id = "rt_default", text = "With patience and a lot of meat, and by never letting them see you scared. A wind rider follows a rider it trusts, and it will throw anyone it doesn't straight into the grass." } },
      choices = {
        { text = "Respect is better than fear with beasts.", next = "BACK", reply = "That's the truth of it, and the best riders know it from the start. You'd make a fine handler, if you ever wanted the work.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Beasts should know who is master.", next = "BACK", reply = "Try being master to a wind rider, and see how long you stay in the saddle. They choose their riders, and they don't choose the ones who shout.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Safer than walking, because the centaur and the quilboar can't reach you up there. The harpies around Dreadmist Peak are another matter, but my riders know how to fly high over them." } },
      choices = { { text = "Good to know. Let me ask about something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know the skies, not that. Ask Thork; he knows the ground, and he likes reminding me of it." } },
    thrall = { { id = "tp_thrall", text = "The Warchief rides wolves, but I've flown him once, and he held on like a recruit. Don't tell him I said so." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar shoot at my riders from the ground, and the riders shoot back from the sky, so it's an argument we usually win. Still, I keep the routes off their camps when I can." } },
    ratchet = { { id = "tp_ratchet", text = "Bragok keeps the wind riders down at Ratchet, and he complains about the goblins every time I see him. I've never once disagreed with him." } },
    quilboar = { { id = "tp_quilboar", text = "The Razormane can't shoot worth anything, so they're the least of my worries in the sky. It's what they do to the caravans that keeps me up." } },
  },
}

-- Barg: general supplies at the Crossroads.
P:NPC {
  key = "barg", id = TODO_NPC("Barg"), name = "Barg", title = "General Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "gruff" }, values = { "practical" },
  notices = { "purse", "hunger", "lock_shadow" },
  impression = {
    first = "He thinks travelers without water are fools, and he is probably right.",
    third = "{name} bought supplies from Barg, who keeps the general goods at the Crossroads.",
  },
  greetings = {
    { id = "g_shop", text = "Water, food and bags, and you'll want all three out here. An orc who learned thirst in the camps doesn't forget it. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, so you didn't buy enough water last time. Nobody ever does." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "That purse of yours is empty. The quilboar sometimes carry coin, if you're not too squeamish to look." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The water in my barrels goes still and cold whenever you stand near them, like a pond with a snake in it. I don't know what you are under that robe, but you'll buy your water quick and take it with you." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Bandages, oil for that armour, and a good reason to be here. The orcs who came out of the camps remember the Silver Hand's paladins, so you'll want friends at the Crossroads. Buy from me, and I'll be one." } },
      choices = {
        { text = "I'll buy honestly, Barg, and be glad of a friend.", next = "BACK", reply = "Then you've got a friend at the Crossroads, and that's worth more than oil. Come by whenever you need bandages.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll buy what I need. Friends aren't my concern.", next = "BACK", reply = "Then buy what you need and be on your way. The orcs will remember either way, so suit yourself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Half of them, some days, with the sun in their heads and a Kolkar arrow in their leg. I sell bandages, but a priest standing by my stall would sell nothing and do twice the good, so stay as long as you like." } },
      choices = {
        { text = "Then I'll stay a while and see who comes in hurt.", next = "BACK", reply = "Stay as long as you like, and I'll send the limping ones your way. The grunts will be grateful, even if they're too proud to say it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fools who walk out without water deserve their lesson.", next = "BACK", reply = "Maybe they do, but the lesson often kills them. I'd rather they lived to learn it twice.", fx = { align = { light = -1 } } },
        { text = "Something else, Barg.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Twice the water you think, and bandages enough for three bad days, because that's how long it takes to walk to the next well. The centaur fight hard and the sun fights harder, so don't leave the Crossroads short of either." } },
      choices = {
        { text = "I'll carry enough for the grunts beside me too.", next = "BACK", reply = "That's a good grunt, and you'll be the one they follow home. Take an extra skin, then, for the road.", fx = { align = { light = 1 } } },
        { text = "I'll carry for myself. The others can manage.", next = "BACK", reply = "Then carry for yourself, and hope the others carry for you when you need it. I've seen grunts carried in with their tongues swollen black, and every one of them thought he'd brought enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "For the beast, aye, because a thirsty companion is a slow one, and a slow one gets you killed. The oases are fouled more often than not these days, so carry clean water from here and share it with whatever walks at your side." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "For the beast, aye, and your {pet} looks parched already. Give it water before anything else, and it'll carry you through the Barrens." },
      },
      choices = {
        { text = "My beast drinks before I do.", next = "BACK", reply = "Spoken like a true hunter, and your beast will be loyal for it. Take an extra skin for the pair of you.", fx = { align = { light = 1 } } },
        { text = "My beast can find its own water.", next = "BACK", reply = "It'll find water, sure, but maybe not clean water. Take a skin anyway, because a sick beast is worse than a thirsty one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Some can, if you believe the tauren, and I've seen one kneel by a dry wash and dig until his hands came up wet. But I've also sold water to three shamans this week, so I'll keep stocking it." } },
      choices = {
        { text = "Water should be shared freely in a land this dry.", next = "BACK", reply = "In a fair world it would be, but someone has to haul it here. I'll keep my prices low, and that's the best I can do.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Water this scarce is worth whatever you can charge.", next = "BACK", reply = "Not by me, it isn't, and I'd have the whole Crossroads after me if I tried. A fair price and a full skin, that's my trade.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It is, and faster every season, so I sell more waterskins every month. The Lushwater Oasis used to reach the rocks on its western side, and now you can walk all the way round it before your skin's half full." } },
      choices = {
        { text = "Ration the water and guard it. That's the only way through.", next = "BACK", reply = "Ration it, aye, and guard it from the Kolkar. That's how the Crossroads has lasted this long.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Water belongs to all. Nobody should be guarding an oasis.", next = "BACK", reply = "In a kinder land, maybe, but the Kolkar don't share. Somebody has to stand by the water, or nobody drinks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Water, same as everyone, because nobody sneaks far across the Barrens with a dry throat. I've had rogues come in boasting about the Kolkar camps they crept through, and they all came back with cracked lips and bought two skins." },
      },
      choices = {
        { text = "I'll pay for my water like anyone else.", next = "BACK", reply = "Good, then you'll come back with wet lips, and I'll be glad to see you. Honest coin keeps the skins full.", fx = { align = { honor = 1 } } },
        { text = "Easier to take water from the Kolkar's wells.", next = "BACK", reply = "And come back with a Kolkar spear in your back? Pay for your water, rogue, and live to drink it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because conjured water only keeps off thirst, and the Barrens takes more than water out of you. You'll want bread, thread and a pack that won't split, and you'll want to share that water with the grunts on the road, because they can't make their own." },
      },
      choices = {
        { text = "I'll share my water with anyone who needs it.", next = "BACK", reply = "Then you'll have friends on every road out of here, and nobody will leave you lying by a dry well.", fx = { align = { light = 1 } } },
        { text = "My water's for me. The grunts can buy their own.", next = "BACK", reply = "Then you'll drink alone, and maybe die alone. The grunts remember who shared and who didn't.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I don't know and I don't want to know, but I know you do, because demons don't carry packs. Buy your own water and bread, and keep that thing out of my sacks, because the last imp in here got into the flour and I'm still finding sooty handprints." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "I don't know and I don't want to know, but I see it's already got its nose in my sacks. Buy your own water and bread and call that thing off, because the last demon in here got into the flour and I'm still finding sooty handprints." },
      },
      choices = {
        { text = "I'll keep my imp out of your sacks.", next = "BACK", reply = "Thank you, because I'm still sweeping flour out of the corners. Keep it out, and you'll always be welcome here.", fx = { align = { order = 1 } } },
        { text = "My imp goes where it likes, Barg.", next = "BACK", reply = "Then it'll go where my broom goes, and it won't like that much. Keep it leashed or keep it outside.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. You probably don't need water, but you'd be the first traveller in the Barrens who didn't run out of something." },
        { id = "h_default", key = true, text = "I'm Barg, and I sell supplies at the Crossroads. Every traveler in the Barrens comes through here sooner or later, and most of them have run out of water by the time they arrive." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and I'll bet you came in with an empty waterskin like everyone else, because asking the water spirits nicely won't fill it in the Barrens." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, and I'll bet you think the land will give you water out here. It won't, because the oases are shrinking and the Kolkar sit on what's left." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and I'll bet your waterskin's empty and your bandages are gone. They always are." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast drinks as much as you do, I'd wager, and you never plan for it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You'll want water, same as everyone, because praying doesn't keep a body from drying out in the Barrens, does it?" },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You'll want to fill your pockets with things that aren't yours, so fill a waterskin first, at least." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You can conjure your own water, can't you? Then you're the only customer I can't sell it to, and I don't like that one bit." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your demon doesn't drink, I hope, because I'm not selling it water." },
      },
      choices = {
        { text = "I've heard a shaman can find water out here.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The water seems to be running out, Barg.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What should a warrior carry in the Barrens, Barg?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Does a hunter need extra supplies out here, Barg?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What should I carry in the Barrens?", next = "carry" },
        { text = "All sorts must come through the Crossroads.", next = "who" },
        { text = "Plenty of travelers must come in needing more than water.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What does a rogue need from you, Barg?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why would a mage need your supplies, Barg?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Does a warlock's demon need supplies, Barg?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do the dead need in the Barrens, Barg?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? I have more customers waiting." } },
    },
    carry = {
      lines = { { id = "c_default", text = "Water, and then more water, because the oases are few and some of them are fouled now. After that, food that doesn't spoil in the sun, and a bag big enough to carry everything you take from the centaur." } },
      choices = { { text = "Fouled? How?", next = "carry_fouled" } },
    },
    carry_fouled = {
      lines = { { id = "cf_default", text = "Something wrong in the Wailing Caverns is poisoning the water, or that's what Tonga Runetotem says. I don't know the reason, but I know I'm selling a lot more water than I used to." } },
      choices = {
        { text = "Someone should find out what's wrong.", next = "BACK", reply = "Someone should, and I hope it's somebody brave. All I can do is keep the skins filled until they do.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Good for your business, at least.", next = "BACK", reply = "At least, aye, though I'd rather sell less water and have the oases back. Bad water isn't good for anyone, in the end.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Orcs from Orgrimmar, tauren from Thunder Bluff, trolls, Forsaken, goblins from Ratchet, and once in a while a lost human from Northwatch Hold. If they're not trying to kill us, I'll sell them water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I sell water, not answers, grunt, so go and ask Thork." } },
    centaur = { { id = "tp_centaur", text = "A Kolkar will take your water before your life, because they know the Barrens will finish the job for them. Buy two waterskins, and keep one where they won't find it." } },
    quilboar = { { id = "tp_quilboar", text = "The Razormane are thick in the south and thicker every year, and they love a careless traveller. Don't be one, and buy some bandages while you're at it." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins sell the same things I do for twice the price, and they smile while they do it. I don't smile, but you save the difference." } },
    wailing_caverns = { { id = "tp_wailing_caverns", text = "Every fool who goes into those caverns comes out wanting more torches. I keep a stack of them by the door for exactly that reason." } },
  },
}

-- Hula'mahi: reagents and herbs at the Crossroads.
P:NPC {
  key = "hulamahi", id = TODO_NPC("Hula'mahi"), name = "Hula'mahi", title = "Reagents and Herbs",
  gender = "female",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "cheerful" }, values = { "curious", "shrewd" },
  notices = { "craft", "class", "lock_shards" },
  impression = {
    first = "She knows which powder a spellcaster needs before they ask.",
    third = "{name} met Hula'mahi, the troll who sells reagents and herbs at the Crossroads.",
  },
  greetings = {
    { id = "g_shop", text = "Herbs and reagents, mon, for every spell and every sickness. What you be needing?" },
    { id = "g_apprentice", when = { origin = "troll_witch_doctor_apprentice" }, text = "Ah, you got a witch doctor's hands, mon, all stained and careful. You grind roots for one of the old ones at Sen'jin, I bet, so you know already that nothing on my shelf be safe to boil if you don't know what it want first." },
    { id = "g_fl", when = { flirt = true, chance = 0.4, ["not"] = { npcFlagBefore = "hula_fl_no" } }, text = "Ooh, look what the road bring Hula'mahi today! Come in, mon, and stand where the light be good, because me want a proper look at you." },
    { id = "g_fl_yes", when = { flirt = true, chance = 0.5, npcFlagBefore = "hula_fl_yes" }, text = "There be my sweet one! Me been tellin' the herbs about you all week, mon, and every one of them be jealous." },
    { id = "g_fl_no", when = { flirt = true, chance = 0.3, npcFlagBefore = "hula_fl_no" }, text = "Herbs and reagents only, me remember. Hula'mahi be on her best behaviour today, mostly." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell of mageroyal and briarthorn, mon. If you be picking in the Barrens, watch for the snakes around the oases." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, good. You be needing ankhs soon enough, mon, because the spirits only bring you back when you bring the right gift." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "Ah, the shards in your bag be singing, mon, a thin cold song like ghosts in a jar. Hula'mahi sell powders for every spell the loa allow, but keep those away from my herbs, because they turn the leaves black." },
  },
  start = "hello",
  nodes = {
    fl = {
      lines = { { id = "fl_default", text = "Me always in a fine mood, mon, but some customers make it better, and you be one of them. A girl from the Echo Isles learn to know a good catch when it swim by, and you got the look of a big one." } },
      choices = {
        { text = "Then reel me in, Hula'mahi.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "hula_fl_yes" }, clear = { "hula_fl_no" } } } },
        { text = "Aren't I a bit large for you, Hula'mahi?", next = "fl_tauren", when = { race = "Tauren" } },
        { text = "Echo Isles girls always did talk too much.", next = "fl_yes", when = { race = "Troll" }, fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "hula_fl_yes" }, clear = { "hula_fl_no" } } }, reply = "And Echo Isles boys always stand there listenin', mon, so who be the fool?" },
        { text = "Do you sell a love charm among those herbs?", next = "fl_charm" },
        { text = "I'm flattered, but I'm only after herbs today.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "hula_fl_no" }, clear = { "hula_fl_yes" } } }, reply = "Herbs it be, mon, and Hula'mahi not hold it against you." },
        { text = "Throw this one back, Hula'mahi.", next = "BACK", fx = { trait = { stern = 1 }, npcFlag = { set = { "hula_fl_no", "hula_fl_rebuff" }, clear = { "hula_fl_yes" } } }, reply = "Ha! Back in the sea you go, mon. Hula'mahi got a good net and plenty of patience." },
      },
    },
    fl_charm = {
      lines = { { id = "flc_default", text = "Me sell the herbs that go into every love charm a witch doctor ever make, mon, but Hula'mahi never once need one herself. Me just smile like this, and the rest take care of itself, see?" } },
      choices = {
        { text = "I see it working, Hula'mahi.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "hula_fl_yes" }, clear = { "hula_fl_no" } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fl_tauren = {
      lines = { { id = "flt_default", text = "Large? Mon, me be lookin' up at you like you a mesa out on the plains, and me always did like the view from up high. You tauren be gentle as rain and big as a kodo, and that be a fine thing for a girl who like a challenge." } },
      choices = {
        { text = "Then I'll try not to step on you, Hula'mahi.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "hula_fl_yes" }, clear = { "hula_fl_no" } } } },
        { text = "I'll stay down on the plains, thanks.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "hula_fl_no" }, clear = { "hula_fl_yes" } } }, reply = "Suit yourself, big one. The view still be fine from here." },
      },
    },
    fl_yes = {
      lines = { { id = "fly_default", text = "Ha! Now we be talkin', mon. You come back when the Crossroads be quiet and the stars be out, and Hula'mahi show you which herbs be good for the heart and which ones only be good for the head." } },
      choices = {
        { text = "I'll be back when the stars are out.", next = "BACK", reply = "Me be watchin' the road, mon. Don't keep a girl waitin' too long." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Trust? We watch the dead careful, mon, and we watch the Light careful, and you be both. But your coin be the same as anyone's, and the symbols of kings you need be on my shelf." } },
      choices = {
        { text = "I'll trade fair and earn your trust.", next = "BACK", reply = "Fair trade be the only way to trust, mon, so we start well. Come back often, and we see how it goes.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll trade. Your trust I don't need.", next = "BACK", reply = "Then trade, mon, and keep your trust for somebody else. My shelves don't care, and neither do I.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Every morning, mon, a little word to the loa so the spirits be watching my stall and not my debts. The Darkspear priests speak to the loa properly, with shadow and offerings and all, but a merchant only need the loa to look kindly on her prices." } },
      choices = {
        { text = "The loa deserve proper rites, not a merchant's bargain.", next = "BACK", reply = "You speak like a priest of the Darkspear, mon, and maybe you be right. But a merchant's bargain be better than no word at all.", fx = { align = { order = 1 } } },
        { text = "A bargain with the spirits is still a prayer, I suppose.", next = "BACK", reply = "It be a prayer, mon, a small one, and the loa never complained yet. Maybe they like a good bargain too.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Hula'mahi.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The smart ones do, mon, because they walk past peacebloom and earthroot every day and never think to bend down. Bring me what you find around the oases, and the mages and the shaman of the Crossroads be grateful, even if they never know your name." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The smart ones do, mon, and your {pet} keep sniffin' at my jars like it want to help. Keep it close, though, because some of them herbs make a beast sleepy." },
      },
      choices = {
        { text = "I'll gather for the healers of the Crossroads.", next = "BACK", reply = "The healers be grateful, mon, even if they never say so out loud. Bring me peacebloom and earthroot, and I'll see it gets to them.", fx = { align = { honor = 1 } } },
        { text = "I'll gather what sells, troll, and nothing more.", next = "BACK", reply = "Fair enough, mon, I'll buy what sells too, and everybody be happy. Just bring me plenty.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not for themselves, mon, but the smart ones buy a few for their healer friends. A priest with no candles or a shaman with no ankh be no help when you lyin' in the dirt, so think of it as an investment in your own skin." } },
      choices = {
        { text = "I'll look after the healers who look after me.", next = "BACK", reply = "Now that be smart thinkin', mon, because a healer with an empty pouch can't do much for you out on the road.", fx = { align = { honor = 1 } } },
        { text = "Healers can buy their own reagents, troll.", next = "BACK", reply = "They can, mon, but they be busy keeping you alive. Your choice, but I'd think about it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Everybody want to leave the Barrens, mon, and I don't blame them in the dry season. I keep the runes behind the counter, because the last mage who bought a stack teleported to Orgrimmar three times in one day just to eat at the Broken Tusk." },
        { id = "xmage_troll", when = { race = "Troll" }, text = "A Darkspear mage, look at you, mon! The runes be behind the counter, and don't you go teleporting to Orgrimmar three times a day like the last one who bought a stack." },
      },
      choices = {
        { text = "Smart mage. Walking is for people without runes.", next = "BACK", reply = "Ha! You be one of them, mon, I can tell already. Buy a stack, and eat at the Broken Tusk till you're fat.", fx = { align = { order = -1 } } },
        { text = "Wasteful. Runes should be saved for real need.", next = "BACK", reply = "Saved for real need, mon, and every mage think hunger be a real need. Still, I respect a thrifty one.", fx = { align = { order = 1 } } },
        { text = "Where do your herbs come from?", next = "herbs" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "No, mon, and I wouldn't if I could, because the loa don't like trade with things from outside the world. I'll sell you herbs and powder for the spells you cast, and the soul shards you carry be your own business, but don't you go asking me where to find more." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "No, mon, and that thing at your heel be making the loa nervous just by standing there with its eyes on my shelves. I'll sell you herbs and powder for your spells, and your shards be your own business, but keep your servant from touching the jars." },
      },
      choices = {
        { text = "Fair. The loa deserve respect, even from me.", next = "BACK", reply = "That be wise of you, mon, and the loa remember who respect them. Buy your herbs, and we stay friends.", fx = { align = { light = 1 } } },
        { text = "The loa can mind their own business, then.", next = "BACK", reply = "They will, mon, and they'll remember you said so. Careful how you speak of the loa near a troll.", fx = { align = { light = -1 } } },
        { text = "What brings a troll to the Crossroads?", next = "troll" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some from the tauren herbalists, and some from goblin traders who don't say where they found them, mon. I pay the tauren more because their seeds be grown right, but a seed be a seed once it's on my shelf." } },
      choices = {
        { text = "Buy only the honest seeds. The goblin ones may be stolen.", next = "BACK", reply = "Honest seeds be expensive, mon, but they grow right, and that be worth the price. You speak sense.", fx = { align = { honor = 1 } } },
        { text = "A seed is a seed. Where it came from hardly matters.", next = "BACK", reply = "It matter to the loa, mon, if not to the market. But a seed be a seed, and I'll sell it either way.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Flash powder, mon, for when you need to vanish, and the herbs that make your blades sting, though you get your poisons from the trainers. I ask no questions about who it be for, but if it be a tauren, I don't want to hear it." },
      },
      choices = {
        { text = "My blades are for the Horde's enemies, nobody else.", next = "BACK", reply = "Good, mon, then we have no trouble between us. Buy your powder and hunt our enemies.", fx = { align = { honor = 1 } } },
        { text = "Who it's for is between me and my blade.", next = "BACK", reply = "Then I don't ask, mon, and you don't tell me. Just keep it away from the tauren.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one wieldin' the Light, mon. Even paladins need reagents, and I know which ones you be needin' before you ask." },
        { id = "h_default", key = true, text = "I be Hula'mahi, and I sell reagents and herbs at the Crossroads. Mages, priests, shaman, they all come to me sooner or later, because spells need more than words, mon." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon? You don't buy reagents, but you get healed by those who do, so you be welcome all the same." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, mon. You don't buy many reagents, but you pass more herbs out on the plains than any of my customers." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, mon! You be wanting sacred candles, and Hula'mahi got them, though don't be telling the Forsaken I sell the same candles to the trolls." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, mon! You be one of my best customers, because your kind need wild thornroot and maple seeds for the bigger spells, and Hula'mahi keep them fresh." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue, mon. You be wanting powders for your tricks, and Hula'mahi know just which ones." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Where do your herbs come from?", next = "herbs" },
        { text = "A troll at the Crossroads is a rare sight.", next = "troll" },
        { text = "Where do you get your seeds and thornroot, Hula'mahi?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I need runes of teleportation, Hula'mahi.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Hunters must bring you herbs, Hula'mahi.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do warriors ever buy reagents, Hula'mahi?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do you sell anything that feeds a demon, Hula'mahi?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I'd guess you pray to the loa yourself, Hula'mahi.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you sell what a rogue needs, Hula'mahi?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do trolls trust the Light, Hula'mahi?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "You're in a fine mood today, Hula'mahi.", next = "fl", when = { flirt = true, ["not"] = { npcFlagBefore = "hula_fl_rebuff" } } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "What else you want to know, mon? Ask while the shop be quiet." } },
    },
    herbs = {
      lines = { { id = "h2_default", text = "From all over the Barrens, mon, mostly around the oases and the hills. Some come up the road from Ratchet on goblin carts, and those cost more, because goblins be goblins." } },
      choices = { { text = "You haven't mentioned the poisoned oases.", next = "herbs_oasis" } },
    },
    herbs_oasis = {
      lines = { { id = "ho_default", text = "Bad business, mon, because the herbs that grow near bad water be bad themselves. I check every leaf now, and I throw out the ones that smell wrong, even when it cost me." } },
      choices = {
        { text = "That's honest of you.", next = "BACK", reply = "It be the only way, mon, because a bad herb makes a bad potion and a dead customer. The loa watch what I sell.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Most merchants would sell them anyway.", next = "BACK", reply = "Most would, mon, but most don't have the loa watching their shelves. I'd rather lose a sale than a customer.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "t_default", text = "Trade, mon, because the Crossroads be the middle of everything, and everybody pass through here. Sen'jin be a fine place for fishing, but not for selling." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Hula'mahi not know that, mon. Ask Sergra Darkthorn; she know everything about this place." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear came over the sea with Thrall, and we been his people ever since. I sell to orc and tauren both now, but I still miss the sound of the waves." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin keeps the Darkspear proud even out here in the dust, mon. I pray he takes back the Echo Isles before I get too old to go home." } },
    the_elements = { { id = "tp_the_elements", text = "The shaman buy my herbs to speak with the spirits, and the spirits seem to like them well enough. I never ask what they say about me." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet sells the salt herbs from the coast, but they charge too much and half of them be dead already. Mine are fresher, and you can tell the goblins I said so." } },
  },
}

-- Uthrok: the Crossroads' bowyer and gunsmith.
P:NPC {
  key = "uthrok", id = TODO_NPC("Uthrok"), name = "Uthrok", title = "Bowyer & Gunsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "blunt" }, values = { "practical", "craft" },
  notices = { "class", "kit", "lock_armor" },
  impression = {
    first = "He has strong opinions on whether bows or guns are better.",
    third = "{name} met Uthrok, the bowyer and gunsmith of the Crossroads.",
  },
  greetings = {
    { id = "g_shop", text = "Bows, guns, arrows and shot. An orc likes his axe, but out here, if it kills from a distance, I sell it." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, good. You'll want more arrows than you think out here, because the Barrens are wide and the beasts are fast." },
    { id = "n_lock_ward", cat = "lock_armor", when = { class = "WARLOCK", aura = { 6229, 11739, 11740, 28610 } },
      text = "There's a shell of shadow on you, drinking up the light the way dry ground drinks rain. A good bullet would punch right through it, I'd wager, but I'd rather sell you the gun than test it." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because the humans' paladins always charged in close, and my people killed plenty of them from a distance in the Second War. You're Horde now, so learn from us, and don't charge across open ground at anything you could shoot instead." } },
      choices = {
        { text = "I'll charge in close. That's the paladin's way.", next = "BACK", reply = "Charge, then, and see how far you get before the Kolkar spears find you. I'll sell you a gun for when you learn.", fx = { align = { honor = 1 } } },
        { text = "Fair point. Better to kill from range.", next = "BACK", reply = "Now you're learning, paladin. A dead centaur at a hundred paces can't hit back.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A good gun, every time, because a gun stops the centaur before anyone needs healing. I'll admit a priest dragged me out of the Stagnant Oasis when a crocolisk got my leg, though, so I keep a little room in my heart for your kind." } },
      choices = {
        { text = "Healing is the better gift. Anyone can pull a trigger.", next = "BACK", reply = "Maybe it is, and that priest would agree with you. But I'll still sell you a gun, just in case.", fx = { align = { light = 1 } } },
        { text = "Can't argue. Dead centaur need no priest at all.", next = "BACK", reply = "That's the truth, and I'm glad you see it. Buy the gun, and leave the priest a quiet day.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Uthrok.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should carry something that reaches further than his arm, because the Kolkar throw spears and the harpies stay up in the air. A gun or a bow won't win you the fight, but it'll start one on your terms, and in the Barrens, that's how you live through it." } },
      choices = {
        { text = "I'll carry a gun, and use it wisely.", next = "BACK", reply = "Good, because a wise gun is worth two careless ones. Keep it clean, and it'll start every fight on your terms.", fx = { align = { order = 1 } } },
        { text = "Guns are for cowards. I'll charge them.", next = "BACK", reply = "Then charge, and I'll watch the spears find you first. Courage is fine, but it's slower than a bullet.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Range, mostly, because out here you'll see your target long before it sees you. A bow strung with zhevra gut holds well in the heat, and a gun needs keeping clean of the dust, so whatever you carry, clean it every night." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A string of zhevra gut, because it holds in the heat. And let your {pet} run on the plains while you practise, because a restless beast spoils your aim." },
      },
      choices = {
        { text = "I'll keep my weapon clean every night.", next = "BACK", reply = "That's the spirit, hunter, and your weapon will thank you. Run a rag through the barrel every night, and the dust never gets its chance.", fx = { align = { order = 1 } } },
        { text = "I'll clean it when it jams. That's soon enough.", next = "BACK", reply = "Then it'll jam at the worst time, and you'll be cleaning it while a raptor eats you. Every night, hunter, every night.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A bullet, every time, because I can count on it. Lightning hits harder when it lands, I'll give you that, but I've watched a shaman's bolt crackle off a Kolkar stormseer like rain off a roof, and the Kolkar didn't wait for a second try." } },
      choices = {
        { text = "I'll trust the spirits over a goblin's gunpowder.", next = "BACK", reply = "The spirits are fine, but they don't always answer, and powder always does. Trust what you like, but I'll trust my gun.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Trust whatever kills fastest. Nothing else matters.", next = "BACK", reply = "That's what I keep telling people, and nobody listens. Buy the gun, and you'll see I'm right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some do, and the zhevra herds are thinner than they were when I first came to the Crossroads. I sell them the bows, and what they do after that is their own business, though I'd rather they left something for next year." } },
      choices = {
        { text = "The Crossroads should set limits on the hunting.", next = "BACK", reply = "Maybe they should, but Thork has more to worry about than zhevra. I'll mention it, for all the good it'll do.", fx = { align = { order = 1 } } },
        { text = "A trader's job is trade. The hunters can answer for themselves.", next = "BACK", reply = "That's how I see it, though I'm not proud of it. I sell the bows, and the hunters answer to the land.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Every rogue should, because you can pull a Kolkar scout off his feet from the grass and never step into the open. A gun's louder, and loud is the opposite of what you want, so for once I'll tell you to buy the bow." },
      },
      choices = {
        { text = "I'll fight close and look them in the eye.", next = "BACK", reply = "Brave, but I've seen how those stories end. Look them in the eye if you like, but take a bow for when you can't.", fx = { align = { honor = 1 } } },
        { text = "A shot from cover is still a kill.", next = "BACK", reply = "It is, and the scout won't complain about how he died. Take the bow, rogue, and stay in the grass.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not often, because you carry wands, which are sticks with a bit of spark in them if you ask me, though I'll admit they do the job when your mana's spent. The raptors close fast out here, so keep frost between you and them, and stay near the grunts on the road." },
      },
      choices = {
        { text = "I'll fight beside the grunts, not off on my own.", next = "BACK", reply = "Good, because the grunts need cover, and you need someone to hold the raptors off. Stay close, and you'll both live longer.", fx = { align = { order = 1 } } },
        { text = "I fight alone, and I like it that way.", next = "BACK", reply = "Then you'll be the one the raptors pick first. Fight alone if you like, but keep the frost close.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Not many, because a wand does most of what you want and the demon does the rest. The ones who come back are the ones whose demon got sent home in the middle of a fight, and they always want something that shoots, fast." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Not many, because a wand does most of the work and the demon does the rest, and yours looks pretty pleased about that. The ones who come back are the ones whose demon got sent home in the middle of a fight, so ask {pet} how long it plans to stay and buy accordingly." },
      },
      choices = {
        { text = "I'll face my enemies myself, demon or no demon.", next = "BACK", reply = "Good, because the demon won't always be there. A blade in your hand never gets sent home.", fx = { align = { honor = 1 } } },
        { text = "Let the demon take the blows. That's what it's for.", next = "BACK", reply = "Then buy something for when it gets sent home, because it will. Demons always leave at the worst moment.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. You'll want to get close to your enemies, I suppose, which in the Barrens is foolish. Want to buy a bow?" },
        { id = "h_default", key = true, text = "I'm Uthrok, and I sell bows and guns at the Crossroads. Out in the Barrens you can see an enemy coming from a long way off, so you might as well shoot them before they get close." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You throw lightning, so you'll tell me it's better than a bow, but a bow doesn't need the sky's permission to fire." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll tell me claws are better than a bow, and I'll tell you a bow kills a lion before it ever gets close enough to scratch you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll be wanting a gun for when the centaur keep their distance, because they're not foolish enough to stand still for an axe." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know a good bow when you see one, so I won't waste your time with the cheap ones." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Can't shoot worth a thing, I'd wager, but you can keep a hunter alive long enough to learn how, so you're welcome at my counter." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! You throw knives, I bet, but a good bow reaches further, and you'll want one when the knives run out." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You throw fire, so you'll tell me you don't need a bow, but your fire runs out and my arrows don't." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. You've a demon to stand in front of you, so I suppose you don't need a gun, but you'd be surprised how many warlocks buy one anyway." },
      },
      choices = {
        { text = "Which hits harder, lightning or a bullet, Uthrok?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do your hunters ever take more game than the plains can spare?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "A warrior has no need of a gun, Uthrok.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What makes a good bow in the Barrens, Uthrok?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Bow or gun, which is better?", next = "which" },
        { text = "Where do the guns come from?", next = "guns" },
        { text = "Would you rather have a priest or a good gun, Uthrok?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Should a rogue carry a bow, Uthrok?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'd guess mages rarely buy from you, Uthrok.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do warlocks buy weapons from you, Uthrok?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why should a paladin use a bow, Uthrok?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? I've got arrows to fletch." } },
    },
    which = {
      lines = {
        { id = "w_default", text = "A bow is quiet and never jams, and you can make arrows from anything. A gun is loud and hits hard, and the noise scatters the zhevra before you even hit them." },
        { id = "w_tauren", when = { race = "Tauren" }, text = "Your people like guns, I've noticed, and a tauren with a big rifle is a frightening sight. But a bow is quiet and never jams, so think about it." },
      },
      choices = {
        { text = "I prefer the bow.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll take the gun.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guns = {
      lines = { { id = "g_default", text = "Goblins in Ratchet make most of them, and they sell to anyone who pays. The dwarves make better ones, I'll admit, but I'm not walking into Bael Modan to buy one." } },
      choices = { { text = "What's at Bael Modan?", next = "guns_bael" } },
    },
    guns_bael = {
      lines = { { id = "gb_default", text = "A dwarf dig in the south of the Barrens, past Camp Taurajo, full of guns and steam machines. The tauren there hate them, and I don't blame them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I couldn't tell you, grunt, so ask Thork or Sergra; they run this place." } },
    centaur = { { id = "tp_centaur", text = "Centaur are fast, but an arrow is faster, and a bullet's faster still. That's why I sell both, and I'll tell you which to buy." } },
    quilboar = { { id = "tp_quilboar", text = "A quilboar charge is all tusks and noise, and you'll have time for two shots if you keep your nerve. Most don't keep their nerve, which is why Barg sells bandages next door." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins make good guns and charge like they're made of gold. Mine are plainer, and they shoot where you point them." } },
    second_war = { { id = "tp_second_war", text = "The old Horde didn't trust guns, and we lost to dwarves who did. I learned that lesson on a battlefield, and I've been selling it ever since." } },
  },
}

---------------------------------------------------------------------------
-- Camp Taurajo
---------------------------------------------------------------------------

-- Omusa Thunderhorn: Camp Taurajo's wind rider master.
P:NPC {
  key = "omusa", id = TODO_NPC("Omusa Thunderhorn"), name = "Omusa Thunderhorn", title = "Wind Rider Master",
  bible = "bibles/unsung.md", role = "flightmaster", tier = "service",
  communities = { "taurajo" }, temper = { "calm" }, values = { "patient", "kind" },
  notices = { "travel", "weary", "lock_soulstone" },
  impression = {
    first = "He calls each of his wind riders by name.",
    third = "{name} met Omusa Thunderhorn, the wind rider master of Camp Taurajo.",
  },
  greetings = {
    { id = "g_fly", text = "The wind riders are ready, friend, and the wind is kind today. Where would you go?" },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look tired and torn, friend. Let a wind rider carry you for a while, the way the herd carries its weary, and rest your legs." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { carrying = { 5232, 16892, 16893, 16895, 16896 } },
      text = "You carry a stone with a soul waiting in it, and I can feel it like a calf crying in a pen far off. My people sing the dead home to the Earth Mother, and I don't like to think of one kept in a pocket." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "No, but we do not know it. The Earth Mother gave us what we needed long before we met the orcs and their memories of the Silver Hand. I am curious what the Light asks of you, since nothing in this world gives without asking." } },
      choices = {
        { text = "It asks me to protect the living. I do.", next = "BACK", reply = "Then the Earth Mother will smile on you, I think. Protecting the living is a good thing to be asked.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It asks nothing. I take what I need.", next = "BACK", reply = "Then the Light is a generous master, or a careless one. I'd be wary of anything that gives without asking.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The dwarves dig at Bael Modan to the south, and the quilboar of the Razorfen grow bolder every season, so the camp's healers are seldom idle. If you stay, the Earth Mother will not mind whom you pray to, and neither will I." } },
      choices = {
        { text = "I'll stay a while and help your healers, Omusa.", next = "BACK", reply = "Then you're welcome here as long as you stay. The healers will be glad of the help, and so will I.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Taurajo has its own healers. I've roads to fly.", next = "BACK", reply = "Then fly, and the winds go with you. The healers will manage, as they always have.", fx = { align = { light = -1 } } },
        { text = "Something else, Omusa.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Digging, and blasting, and pulling things from the earth that should have stayed buried. The elders at Thunder Bluff want to know what they've found, and the dwarves want no one to see it, so any warrior who goes there will be met with more than words." } },
      choices = {
        { text = "I'll go there and drive them out.", next = "BACK", reply = "Then go carefully, because the dwarves have guns and they dig deep. The elders will be glad to hear of it.", fx = { align = { order = 1 } } },
        { text = "Let them dig. It's not my business.", next = "BACK", reply = "Perhaps not, but the land will make it your business soon enough. The earth there groans louder every night.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because the quilboar and the dwarves have driven off the zhevra, and the lions must eat something. A hunter who thins them carefully keeps the camp safe, but a hunter who takes too many leaves the plains to the quilboar, and that is worse." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The quilboar and the dwarves have driven off the zhevra, so the lions have little to eat, and your {pet} should stay close to you out there. My wind riders spot a hungry lion long before you would." },
      },
      choices = {
        { text = "I'll thin them carefully and leave the rest.", next = "BACK", reply = "That's the way of the hunter, and the Earth Mother will thank you. The plains need their lions as much as their zhevra.", fx = { align = { honor = 1 } } },
        { text = "Lions are a threat. I'll clear the plains of them.", next = "BACK", reply = "Then the quilboar will have the plains to themselves, and that's worse. Thin them, hunter, but don't clear them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They are digging into old earth, older than the tauren, and the herders say the ground there groans at night. The dwarves dig for treasure and the quilboar dig for their god, and between them the land south of Taurajo has no peace." } },
      choices = {
        { text = "The land deserves defending from both of them.", next = "BACK", reply = "It does, and I'm glad to hear someone say so. Go carefully, because both of them dig deep, and neither one likes strangers.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the dwarves and quilboar weaken each other first.", next = "BACK", reply = "A cold plan, but perhaps a wise one. Let them bleed each other, and the land may heal faster.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "That would be a kindness, because the dwarves dig deeper every season and they post guards who watch the sky for my riders. Count their guns and see what they carry out of the ground, and the elders at Thunder Bluff will hear of it on the next wind rider north." },
      },
      choices = {
        { text = "They'll never know I was there. That's the point.", next = "BACK", reply = "That's the way, and the elders will be grateful. Count their guns, and come back unseen.", fx = { align = { honor = -1 } } },
        { text = "I'll watch, but if it comes to blows, I'll fight openly.", next = "BACK", reply = "If it comes to that, fight well and come home. The elders want answers, not more graves.", fx = { align = { honor = 1 } } },
        { text = "What troubles Camp Taurajo most?", next = "trouble" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do, and so do I, though I'm better at hiding it. My riders have never smelled anything like it and they will not carry it, so it must stay behind while you fly, the same as for the Warchief's own warlocks." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "They do, and you can see it, because every one of them has backed to the far end of the platform since your {pet} came up the path. My riders will not carry it, so it must stay behind while you fly, the same as for the Warchief's own warlocks." },
      },
      choices = {
        { text = "It can stay behind. Your riders deserve calm skies.", next = "BACK", reply = "They do, and they'll thank you in their own way. Fly calm, and the wind will be kind.", fx = { align = { light = 1 } } },
        { text = "Your beasts should learn to bear it.", next = "BACK", reply = "They won't, and they'll throw you from the sky to prove it. Leave it behind, or walk to Thunder Bluff.", fx = { align = { light = -1 } } },
        { text = "Do your wind riders have names?", next = "names" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Old things, buried under the earth long before any tauren walked these plains, and they dig as though the ground owed them every one. My riders fly wide around the place now, because the noise and the smoke frighten them." } },
      choices = {
        { text = "Ask them to leave first. If they refuse, then we fight.", next = "BACK", reply = "That's the tauren way, and the elders would approve. Speak first, and fight only if they won't listen.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Strike their camp at night and be done with it.", next = "BACK", reply = "That would end it quickly, but the earth there has had enough violence. Ask the elders first, at least.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They'll carry anyone the Horde trusts, and they don't care whether you carry a spear or a spellbook. What troubles them is the south, where the dwarves have dug in at Bael Modan and the quilboar are stirring, so they come back tense from every flight that way." },
      },
      choices = {
        { text = "The dwarves are digging, not fighting. Leave them be.", next = "BACK", reply = "They're digging up what the Earth Mother buried, and that's a kind of fighting. Still, I'll not argue with you over the dwarves.", fx = { align = { light = 1 } } },
        { text = "The dwarves should be driven out of Bael Modan.", next = "BACK", reply = "The elders would agree, and so would the shamans. Go carefully, because the dwarves have guns and they don't miss.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. The wind riders will take you north, and I'll tell them your name, since they like to know who they carry." },
        { id = "h_default", key = true, text = "I am Omusa Thunderhorn, and I keep the wind riders of Camp Taurajo. From here they fly north to the Crossroads and further, over the grass my people walked on the long migration, and they carry the camp's news to Thunder Bluff." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The wind riders have been uneasy since the dwarves came south with their digging, and perhaps you can feel what they feel." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, at Taurajo's roost. My wind riders have been uneasy since the dwarves started digging at Bael Modan, and I think you'll feel that same unease if you go near it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The dwarves at Bael Modan carry guns, and a warrior is the first thing they'll shoot at, so I hope you're as tough as you look." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. My wind riders see the whole plain from the sky, and they tell me the lions of the southern Barrens are hungrier than usual." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. My wind riders are calm around you, and they lay back their ears at most strangers who come to Taurajo." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage at Taurajo. The wind riders don't mind your magic, though they snort at the smell of the burning." },
      },
      choices = {
        { text = "The dwarves seem to be disturbing something at Bael Modan.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What are the dwarves digging for at Bael Modan, Omusa?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "What troubles Camp Taurajo?", next = "trouble" },
        { text = "Your wind riders must have names.", next = "names" },
        { text = "I could watch the dwarves at Bael Modan without being seen.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What are the dwarves doing at Bael Modan, Omusa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why are the southern lions hungry, Omusa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Your wind riders seem to shy from my demon.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Taurajo could use a priest's help, by the look of it.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Will the wind riders carry a mage, Omusa?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the tauren fear the Light, Omusa?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not now.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything more, friend? The wind is patient today, and so is an old tauren." } },
    },
    trouble = {
      lines = { { id = "t_default", text = "The quilboar of Razorfen Kraul to the south, and the dwarves who dig at Bael Modan to the southeast. The braves keep both away from the camp, but there are fewer braves every season." } },
      choices = { { text = "What do the dwarves want there?", next = "trouble_dwarves" } },
    },
    trouble_dwarves = {
      lines = { { id = "td_default", text = "They dig for old things, buried things, and they don't ask the Earth Mother's permission. Every shaman in the camp says the land is angry there, and I believe them, because I can feel it under my hooves." } },
      choices = {
        { text = "They must be driven off.", next = "BACK", reply = "Perhaps they must, and I'll not argue. The land has had enough of their digging.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Perhaps they can be reasoned with.", next = "BACK", reply = "Perhaps they can, though I've seen no sign of it yet. Try, if your heart says so, and the Earth Mother will see.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    names = {
      lines = { { id = "n_default", text = "Of course they do, but they're private names, between the beast and me. A wind rider who trusts you will carry you through a storm, and that trust starts with knowing its name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The sky I know, friend, but not that, so put your question to the camp's elders by the fire. Walk with the Earth Mother." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made the sky as well as the ground, and my wind riders know both. I thank her every time one of them comes home." } },
    quilboar = { { id = "tp_quilboar", fx = { learn = { "razorfen" } }, text = "The Razorfen lie just to the south of here, and the quilboar there grow strange and cold. My riders fly high over them now, and I do not fault them for it." } },
    cairne = { { id = "tp_cairne", text = "Cairne flew with me once, many years ago, and he laughed like a calf the whole way. I have never told anyone that, and you will not either." } },
    theramore = { { id = "tp_theramore", text = "Theramore's ships pass the coast and their soldiers hold Northwatch, which watches us in turn. Lady Proudmoore is said to want peace, and I would like her soldiers to remember it." } },
  },
}

---------------------------------------------------------------------------
-- Ratchet
---------------------------------------------------------------------------

-- Bragok: Ratchet's flight master.
P:NPC {
  key = "bragok", id = TODO_NPC("Bragok"), name = "Bragok", title = "Flight Master",
  bible = "bibles/unsung.md", role = "flightmaster", tier = "service",
  temper = { "gruff" }, values = { "practical" },
  notices = { "travel" },
  impression = {
    first = "He is plainly happier with his beasts than with the town.",
    third = "{name} met Bragok, the flight master of Ratchet.",
  },
  greetings = {
    { id = "g_fly", text = "Flying? Then hurry, {class}, because the beasts don't like the salt air, and neither does any orc with sense." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Some do. I saw the Silver Hand's glow in the camps, the same as every orc my age, and I don't love it. But fair is fair: you pay, you fly, and the beasts don't care what you pray to." } },
      choices = {
        { text = "Fair is fair. I'll pay and fly.", next = "BACK", reply = "Good, that's all I ask. Fly well, and come back in one piece.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your memories are your burden, not mine.", next = "BACK", reply = "My burden, aye, and I've carried it a long while. Pay and fly, and we'll leave it at that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A temple in Ratchet? The goblins would sell the pews and rent out the altar by the hour. No, a priest does more good up here with my wind riders, where nobody's counting coins." } },
      choices = {
        { text = "Faith shouldn't have a price. Ratchet could learn that.", next = "BACK", reply = "Ratchet could learn plenty, but it won't learn that. The goblins would charge for the lesson.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Goblins pay well. A temple there would turn a profit.", next = "BACK", reply = "It would, and that's exactly why I don't want one there. I've seen what goblins do to anything that turns a profit.", fx = { align = { light = -1 } } },
        { text = "Something else, Bragok.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Crocolisks in the shallows, raptors up in the hills and the odd shark the fishermen drag in, though you'll have to fight the goblins for that one. The goblins pay well for crocolisk hides, so a hunter who comes through my roost rarely leaves empty-handed." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "There's crocolisk in the shallows, and your {pet} looks like it wants the gulls on the docks too. Let it, if you like; the goblins hate those gulls more than anything." },
      },
      choices = {
        { text = "I'll hunt only what keeps Ratchet's roads safe.", next = "BACK", reply = "Then you're a better hunter than most who come through here. Ratchet's roads could use you.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt whatever the goblins pay for.", next = "BACK", reply = "Then you'll do well here, because the goblins pay for everything. Just don't let them haggle you down.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They'd say no, and then hire you anyway. The Southsea pirates come up the beach often enough, and the bruisers can't be everywhere, so a warrior who stops by Ratchet can always find a fight, and usually some coin with it." } },
      choices = {
        { text = "I'll fight for the town, Bragok, not just the coin.", next = "BACK", reply = "That's a warrior I can respect. Ratchet's goblins will pay you anyway, so you might as well feel good about it.", fx = { align = { honor = 1 } } },
        { text = "The coin's the only reason I'd fight for goblins.", next = "BACK", reply = "Honest, at least, and the goblins would agree with you. They don't fight for anything but coin either.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ask them yourself, but my beasts mind it, and they cough every morning the forges are lit. The sea spirits must be patient, or Ratchet would have washed away long ago." } },
      choices = {
        { text = "The goblins should answer for what they burn.", next = "BACK", reply = "They should, but they won't, and the spirits seem to forgive them. I'll leave it to the sea to decide.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the goblins burn what they like. Ratchet isn't ours.", next = "BACK", reply = "It isn't, but my beasts have to breathe it. Still, you're not wrong about whose town it is.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because the Horde needs a roost by the sea, and the goblins want our coin more than they want us gone. I don't like their prices or their smoke, but I like the wind riders, and they like the sea air." } },
      choices = {
        { text = "The Horde's needs come first. Your duty is here.", next = "BACK", reply = "That's how I see it, and that's why I'm still here. The smoke is a small price for the sea air.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No roost is worth breathing goblin smoke. Move it.", next = "BACK", reply = "Move it where, the middle of the ocean? The Horde needs a roost here, and I'll stay until it doesn't.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I trust my wind riders, and the goblins as far as their prices let me, which isn't far. The Southsea pirates on the coast steal from the goblins, and a rogue who watches them closely might learn where all that stolen cargo ends up." },
      },
      choices = {
        { text = "Thieves are thieves, whoever they rob. I'll stop them.", next = "BACK", reply = "Then you'll be busy, because Ratchet's full of thieves of every stripe. Start with the pirates, and work your way down.", fx = { align = { honor = 1 } } },
        { text = "I'd rather learn where it goes and take a share.", next = "BACK", reply = "Then you'd be a pirate yourself, and the bruisers would treat you like one. Mind yourself in this town.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because a teleport takes you home and nowhere else, and my wind riders go wherever the Horde keeps a perch. You'll see the Barrens from above, too, and that view's cheaper than anything the goblins sell in this town." },
      },
      choices = {
        { text = "Then I'll fly the Horde's way, and mind the droppings.", next = "BACK", reply = "Good, and you'll thank me when you see the view. The droppings are part of the ride, I'm afraid.", fx = { align = { order = 1 } } },
        { text = "My way is faster, and I've no time for scenery.", next = "BACK", reply = "Then take your shortcut, mage, and miss the best part of the journey. The wind riders won't mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because they've got more sense than most orcs had back when the Horde drank what the Legion poured for it. Keep the thing dismissed while you fly, and I'll not ask what you do with it on the ground." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Because they've got more sense than most orcs had when the Horde drank what the Legion poured for it, and that thing beside you is the reminder. I see the shame of it every time it looks at me, so dismiss it before you fly, and I'll not ask what you do with it on the ground." },
      },
      choices = {
        { text = "I'll dismiss it. The beasts deserve that much.", next = "BACK", reply = "Good, and they'll carry you for it. That's all I ask of any warlock.", fx = { align = { light = 1 } } },
        { text = "My demon stays. Your beasts can learn.", next = "BACK", reply = "They won't learn, and you'll fall. Dismiss it, or walk to Orgrimmar.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. The goblins will charge you double for everything in Ratchet, Light or no Light. At least my flights are fair." },
        { id = "h_default", key = true, text = "I'm Bragok, and I keep the flight beasts here in Ratchet. The goblins run the town, but they let me keep my roost, because people who fly in spend money." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in a goblin town. You'll hate it here, because the goblins dig and burn whatever they like, and they've never asked a spirit's leave for anything." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, in a goblin town. You'll want to be gone quickly, I expect, because the goblins burn and dump whatever they like along this coast and never look sorry about it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Ratchet's goblins'll sell you anything, but they won't fight for you, so I'm glad to see somebody who will." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The crocolisks along the coast near Ratchet grow fat on the goblins' fish scraps, if you're after a fight." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because the goblins charge for everything here, and I'd bet they'd charge for praying too if they could work out how." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue in Ratchet. You'll fit right in, since the goblins here are mostly thieves with ledgers." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You could probably teleport home cheaper than my wind riders fly, though the goblins would find a way to charge you for it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The wind riders won't like your demon, so put it away before you come near my perch." },
      },
      choices = {
        { text = "Do the spirits mind the goblins' smoke and steam?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why do you keep your roost among the goblins, Bragok?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "The goblins of Ratchet look like they need protecting.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is there good hunting around Ratchet, Bragok?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "You don't look fond of Ratchet.", next = "ratchet" },
        { text = "Where does the boat go?", next = "boat" },
        { text = "Do you ever wish Ratchet had a proper temple, Bragok?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I doubt you trust anyone in Ratchet, Bragok.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why fly when I could teleport, Bragok?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why do the wind riders hate demons, Bragok?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do orcs mind flying a paladin, Bragok?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not now.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? Ask it quick, because the beasts are getting restless." } },
    },
    ratchet = {
      lines = { { id = "r_default", text = "It's too loud, too salty and too full of goblins. They'll sell you your own boots if you stand still long enough, so keep walking." } },
      choices = { { text = "Why stay, then?", next = "ratchet_why" } },
    },
    ratchet_why = {
      lines = { { id = "rw_default", text = "Because the Barrens need a roost by the sea, and somebody has to keep it. The goblins pay on time, I'll give them that, which is more than some orcs do." } },
      choices = {
        { text = "Goblins keep their deals. That counts for something.", next = "BACK", reply = "It does, more than I like to admit. They pay on time, and that's more than most.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I wouldn't trust a goblin's deal.", next = "BACK", reply = "Neither would I, at first, but they've kept every one with me. Still, keep your eyes open, because they're goblins.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boat = {
      lines = { { id = "b_default", text = "South across the sea to Booty Bay in Stranglethorn, the goblins' other town. It's a long trip, but it beats flying over open water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I wouldn't know, so ask Gazlowe, because he knows everything that happens in Ratchet and sells most of it." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's full of goblins who'd sell you your own boots back, and I'm the only one here who doesn't charge for advice. You're welcome." } },
    booty_bay = { { id = "tp_booty_bay", text = "The boat goes to Booty Bay, and the goblins on the other end are no better than the ones here. At least the beasts don't care where you're going." } },
    thrall = { { id = "tp_thrall", text = "The Warchief gave the goblins this town because he owed Gazlowe for Orgrimmar. Some days I think he should have given them the bill instead." } },
    bloodsail = { { id = "tp_bloodsail", text = "They're pirates off the coast, with red sails and bad manners. My riders spot them from the cliffs, and Gazlowe doesn't pay me extra for it." } },
  },
}

-- Ironzar: Ratchet's weaponsmith.
P:NPC {
  key = "ironzar", id = TODO_NPC("Ironzar"), name = "Ironzar", title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  temper = { "smooth" }, values = { "greedy", "shrewd" },
  notices = { "purse", "kit", "lock_shadow" },
  impression = {
    first = "Every blade has a story, and every story raises the price.",
    third = "{name} met Ironzar, the goblin weaponsmith of Ratchet.",
  },
  greetings = {
    { id = "g_shop", text = "Weapons, friend, weapons! The finest in Ratchet and maybe the finest in the Barrens, so step on in and let's talk prices before somebody else buys your sword." },
  },
  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 100000 } },
      text = "Now that's a heavy purse, friend, and I can hear it jinglin' from here. Let me show you the good stock, the stuff I keep in the back for valued customers." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "Your shadow's darker than the one under my awning, friend, and it's making my blades look dull, which is bad for business. Stand a little to the left, would you, where the customers can't see it." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It belonged to a knight of the Silver Hand, back before the plague, or so the seller told me. Now it can belong to a dead knight with the Light, which is poetic, and poetry costs extra. Interested?" } },
      choices = {
        { text = "No. A dead knight's hammer belongs in his grave.", next = "BACK", reply = "That's a noble thought, pal, and a terrible business plan. I'll keep it on the rack for someone less sentimental.", fx = { align = { honor = 1 } } },
        { text = "I'll take it, but I'm not paying for the poetry.", next = "BACK", reply = "No poetry, huh? Fine, pal, I'll knock a little off, but only because you've got good taste.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Pal, out in the Barrens everybody needs a weapon, and a priest especially, because the centaur aim for whoever's doing the healing. A good mace in your hand means you're still around to cast the next spell, and that's worth a few silver." } },
      choices = {
        { text = "My faith protects me better than any goblin steel.", next = "BACK", reply = "Your faith, sure, until a centaur knocks the faith right out of you. I'll keep a mace ready for when you change your mind.", fx = { align = { light = 1 } } },
        { text = "Fair point. Show me what will crack a centaur's skull.", next = "BACK", reply = "Now we're talkin', pal! This one here's cracked more skulls than I can count, and it'll crack plenty more.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Ironzar.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That depends on how much you're spending, pal, but I've got a beauty out of Booty Bay that'll split a centaur's shield in one swing. Of course, I've also got cheaper ones that'll split it in two or three, and they all look about the same from where the centaur's standing." } },
      choices = {
        { text = "I'll pay for quality. My life depends on it.", next = "BACK", reply = "Smart customer, pal, and I'll give you the Booty Bay beauty for it. Your life's worth the extra coin.", fx = { align = { order = 1 } } },
        { text = "I'll take the cheap one and loot a better axe later.", next = "BACK", reply = "A practical one, I like it. Just don't come back complaining when the cheap one splits on the first centaur.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plenty, pal, though they always want the lightest weapons, so they can run. I've got a few short swords and axes that weigh next to nothing, which is perfect for when your pet's busy and something big is chewing on your boot." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Plenty, pal, and that {pet} of yours looks like a good customer too. Shame it can't hold a sword, because I'd sell it one in a heartbeat." },
      },
      choices = {
        { text = "I'll buy something sturdy and fight beside my beast.", next = "BACK", reply = "Sturdy it is, and your beast'll be proud of you. This axe here won't let you down.", fx = { align = { honor = 1 } } },
        { text = "I'll buy the lightest blade. Running is a skill too.", next = "BACK", reply = "Running's a skill, sure, and I'll sell you the lightest blade I've got. Just don't run into anything too big.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Does it? Sure, probably, but I'm not an engineer, pal. What I know is that shamans pay extra for anything that sounds like it'll help with the sparks, and I'm not in the business of arguing with paying customers." } },
      choices = {
        { text = "A merchant should sell honestly, Ironzar.", next = "BACK", reply = "Honestly? Pal, I sell honest weapons with honest stories, mostly. Whatever they believe about the sparks is on them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If they believe it, it's their coin to waste.", next = "BACK", reply = "Exactly, pal, and I'm not the one to tell 'em otherwise. Besides, the ones who believe it come back for a second one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Short, sharp and quiet is my favorite kind of customer, pal! I've got daggers from Booty Bay and a few from places I don't mention, and every blade's balanced well enough to throw, though testing that in the shop goes on your bill." },
      },
      choices = {
        { text = "Daggers in the back end fights early. Good.", next = "BACK", reply = "Now you're speakin' my language, pal. This dagger's ended more fights than I can count.", fx = { align = { honor = -1 } } },
        { text = "I want it for honest duels, not for backs.", next = "BACK", reply = "An honest rogue, huh? I'll sell you a good dagger for that, pal, but don't tell anyone I said so.", fx = { align = { honor = 1 } } },
        { text = "Where do your weapons come from?", next = "where" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Oh no? Then why does every mage who comes in here end up buying a staff, pal? A spell runs out when your mana does, and that's when you'll wish you'd invested in something heavy to hit the raptor with." },
      },
      choices = {
        { text = "Fair. A wise mage plans for empty mana.", next = "BACK", reply = "There's a smart mage, pal, and I've got just the staff for you. Hit something with it when the spells run dry.", fx = { align = { order = 1 } } },
        { text = "My spells won't run out. Keep your sticks.", next = "BACK", reply = "Everybody's spells run out, pal, sooner or later. Come back when yours do, and I'll have a staff waiting.", fx = { align = { order = -1 } } },
        { text = "Who buys weapons in Ratchet?", next = "who" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because claws don't come with a story, pal, and this staff here went through three Kolkar raids before it reached my rack. Whether every word of that is true is between me and the staff, but it's more of a story than any claw can tell." } },
      choices = {
        { text = "I'd rather hear the honest story, even if it's duller.", next = "BACK", reply = "Duller? Pal, honest stories don't sell, and you're asking me to go broke. But I'll tell you the true one, for a price.", fx = { align = { honor = 1 } } },
        { text = "A good story sells. I'd tell it too, true or not.", next = "BACK", reply = "Ha! A druid after my own heart, pal. You'd make a fine salesman, if you ever tire of being a bear.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because demons get sent home at the worst moment, friend, and your spells take a breath to cast that a raptor won't give you. This dagger here came off a ship from Booty Bay, and every warlock who bought one before you is still alive and still a customer, as far as I know." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Because demons get sent home at the worst moment, friend, and yours looks like it'd enjoy watching you find out. This dagger came off a ship from Booty Bay, and every warlock who bought one is still alive and still a customer, with or without his demon." },
      },
      choices = {
        { text = "Fair price, fair blade. I'll pay what it's worth.", next = "BACK", reply = "A fair customer, pal, and I'll remember you for it. That dagger'll serve you well.", fx = { align = { honor = 1 } } },
        { text = "I'll pay half, and you'll still turn a profit.", next = "BACK", reply = "Half? Pal, I'd turn a profit, sure, but I'd cry about it later. Meet me at three quarters, and we've got a deal.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin! Now I've got a hammer here with a story, pal, and the story just got more expensive, because you're going to love it." },
        { id = "h_default", key = true, text = "Ironzar's the name and weapons are my game, friend: swords, axes, maces, you name it, I've got it, and if I don't, I can get it for you for a price that'll only sting a little." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll want a mace with a good copper core, because copper carries the lightning, or so I tell every shaman, and by my last copper, they all buy it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now, I know you can grow your own claws, pal, but trust me, a nice staff with a little iron on the end says more about a person than any old claw." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Now we're talkin', pal, because I've got axes so sharp they'll cut you just for looking at 'em, and I'll only charge you for the ones you buy." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! I've got arrows, bullets and a few knives for when the beast gets too close, pal, and a bundle price if you're buyin' all three." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Now, I know you lot like a staff, and I've got a few that'd make the Razormane think twice, for the right price, of course." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now, a warlock doesn't need a blade, I know, chum, but a warlock with a good dagger is a warlock who doesn't panic when the imp dies, and that's what I call an investment." },
      },
      choices = {
        { text = "Does copper really carry lightning, Ironzar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why would a druid buy a staff instead of using claws, Ironzar?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Where do your weapons come from?", next = "where" },
        { text = "Plenty of folk must buy weapons in Ratchet.", next = "who" },
        { text = "I want something short, sharp and quiet, Ironzar.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "A mage doesn't need your weapons, Ironzar.", next = "xmage", when = { class = "MAGE" } },
        { text = "What's your best axe, Ironzar?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Hunters must buy plenty from you, Ironzar.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Does a priest really need one of your weapons, Ironzar?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would a warlock need your blades, Ironzar?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "What's the hammer's story, Ironzar?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, friend? Time is money, you know, and right now it's your money." } },
    },
    where = {
      lines = { { id = "w_default", text = "Here and there, friend, from the forges in Booty Bay and Gadgetzan, and sometimes from the pirates who wash up on the Merchant Coast with somethin' to sell cheap. I don't ask questions, and you shouldn't either, because questions spoil a bargain." } },
      choices = { { text = "Pirates sound dangerous.", next = "where_pirates" } },
    },
    where_pirates = {
      lines = { { id = "wp_default", text = "The Southsea Freebooters? Dangerous enough, pal, and they keep hitting the Steamwheedle ships along the coast, which drives up the price of everything, including my swords. Gazlowe would love it if someone cleaned 'em out, and so would my margins." } },
      choices = {
        { text = "I'll help with the pirates.", next = "BACK", reply = "Gazlowe'll be glad to hear it, pal, and so will I. Clean 'em out and the prices'll drop, maybe.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Pirates are just goblins without a cartel.", next = "BACK", reply = "Ha! You're not wrong, pal, but don't say it near the bruisers. They take that sort of thing personal.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Everyone, friend: Horde, Alliance, mercenaries and the occasional pirate who's been very nice to me. In Ratchet, the only side that matters is the side with the gold, and I keep my shop on that side." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, friend, but for the right price, I can find out. Just kidding, ask Gazlowe, he charges less for gossip than I do." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got a blacksmith on every corner and a pirate who wants their wares on every other, so the prices down there are criminal, pal. Mine are only a little criminal, and that's a bargain." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Gurubashi Arena's where the real money is, kid, because every scrapper there needs a blade and every blade gets broken. I ship a crate a month, and I'd ship two if they'd stop dying with my merchandise." } },
    venture_company = { { id = "tp_venture_company", text = "Venture Company boys buy axes by the hundred and never ask for a discount, so you know they ain't payin' with their own money. I sell to 'em anyway, because business is business." } },
    centaur = { { id = "tp_centaur", text = "Kolkar spears break, and when they break the riders want something better, and I'd sell to 'em if they'd stop stabbing my customers. That's the trouble with centaur, all market and no manners." } },
  },
}
